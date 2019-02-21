package com.localytics.android;

import android.content.ContentValues;
import android.content.Context;
import android.content.Intent;
import android.database.Cursor;
import android.location.Location;
import android.os.Build;
import android.os.Build.VERSION;
import android.os.Looper;
import android.os.Message;
import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import android.telephony.TelephonyManager;
import android.text.TextUtils;
import java.net.URLDecoder;
import java.security.SecureRandom;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Calendar;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Set;
import java.util.TimeZone;
import java.util.TreeMap;
import java.util.UUID;
import java.util.concurrent.Callable;
import java.util.concurrent.CountDownLatch;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

class AnalyticsHandler
  extends BaseHandler
{
  private static final int MESSAGE_CLOSE = 102;
  private static final int MESSAGE_DISABLE_PUSH = 112;
  private static final int MESSAGE_HANDLE_PUSH_REGISTRATION = 110;
  private static final int MESSAGE_OPEN = 101;
  private static final int MESSAGE_OPT_OUT = 108;
  private static final int MESSAGE_REGISTER_PUSH = 109;
  private static final int MESSAGE_SET_CUSTOM_DIMENSION = 107;
  private static final int MESSAGE_SET_IDENTIFIER = 105;
  private static final int MESSAGE_SET_LOCATION = 106;
  private static final int MESSAGE_SET_PUSH_REGID = 113;
  private static final int MESSAGE_SET_REFERRERID = 114;
  private static final int MESSAGE_TAG_EVENT = 103;
  private static final int MESSAGE_TAG_SCREEN = 104;
  private static final String PARAM_LOCALYTICS_REFERRER_TEST_MODE = "localytics_test_mode";
  private static final String[] PROJECTION_SET_CUSTOM_DIMENSION = { "custom_dimension_value" };
  private static final String[] PROJECTION_SET_IDENTIFIER = { "key", "value" };
  private static final String SELECTION_SET_CUSTOM_DIMENSION = String.format("%s = ?", new Object[] { "custom_dimension_key" });
  private static final String SELECTION_SET_IDENTIFIER = String.format("%s = ?", new Object[] { "key" });
  private static Location sLastLocation = null;
  private boolean mAppWasUpgraded = false;
  boolean mFirstSessionEver = false;
  boolean mReferrerTestModeEnabled = false;
  boolean mSentReferrerTestMode = false;
  private final List<String> screenFlow = new ArrayList();
  
  AnalyticsHandler(LocalyticsDao paramLocalyticsDao, Looper paramLooper)
  {
    super(paramLocalyticsDao, paramLooper);
    this.siloName = "Analytics";
    this.listeners = new AnalyticsListenersSet(null);
    queueMessage(obtainMessage(1));
  }
  
  private void _addLocationIDsAndCustomDimensions(JSONObject paramJSONObject1, JSONObject paramJSONObject2, String paramString1, String paramString2)
  {
    try
    {
      if (sLastLocation != null)
      {
        double d1 = sLastLocation.getLatitude();
        double d2 = sLastLocation.getLongitude();
        if ((d1 != 0.0D) && (d2 != 0.0D))
        {
          paramJSONObject1.put("lat", d1);
          paramJSONObject1.put("lng", d2);
        }
      }
      paramJSONObject1.put("cid", paramString1);
      paramJSONObject1.put("utp", paramString2);
      if (paramJSONObject2.length() > 0) {
        paramJSONObject1.put("ids", paramJSONObject2);
      }
      Cursor localCursor = null;
      try
      {
        localCursor = this.mProvider.query("custom_dimensions", null, null, null, null);
        while (localCursor.moveToNext())
        {
          String str1 = localCursor.getString(localCursor.getColumnIndexOrThrow("custom_dimension_key"));
          String str2 = localCursor.getString(localCursor.getColumnIndexOrThrow("custom_dimension_value"));
          paramJSONObject1.put(str1.replace("custom_dimension_", "c"), str2);
        }
        if (localCursor == null) {
          return;
        }
      }
      finally
      {
        if (localCursor != null) {
          localCursor.close();
        }
      }
      localCursor.close();
      return;
    }
    catch (JSONException localJSONException) {}
  }
  
  private void _close()
  {
    if (!_isSessionOpen())
    {
      Localytics.Log.w("Session was not open, so close is not possible.");
      return;
    }
    ((AnalyticsListener)this.listeners).localyticsSessionWillClose();
    _tagEvent("close");
  }
  
  private void _dequeQueuedCloseSessionTag(boolean paramBoolean)
  {
    ContentValues localContentValues = new ContentValues();
    Cursor localCursor;
    if (paramBoolean) {
      localCursor = null;
    }
    try
    {
      localCursor = this.mProvider.query("info", new String[] { "queued_close_session_blob", "queued_close_session_blob_upload_format" }, null, null, null);
      if (localCursor.moveToFirst())
      {
        String str = localCursor.getString(localCursor.getColumnIndexOrThrow("queued_close_session_blob"));
        int i = localCursor.getInt(localCursor.getColumnIndexOrThrow("queued_close_session_blob_upload_format"));
        if (!TextUtils.isEmpty(str))
        {
          this.screenFlow.clear();
          localContentValues.put("blob", str);
          localContentValues.put("upload_format", Integer.valueOf(i));
          this.mProvider.insert("events", localContentValues);
          localContentValues.clear();
          this.mAppWasUpgraded = false;
          this.mFirstSessionEver = false;
        }
      }
      if (localCursor != null) {
        localCursor.close();
      }
      localContentValues.putNull("queued_close_session_blob");
      localContentValues.putNull("queued_close_session_blob_upload_format");
      localContentValues.put("last_session_close_time", Integer.valueOf(0));
      this.mProvider.update("info", localContentValues, null, null);
      return;
    }
    finally
    {
      if (localCursor != null) {
        localCursor.close();
      }
    }
  }
  
  private String _getCustomDimension(int paramInt)
  {
    Object localObject1 = null;
    if (paramInt >= 0)
    {
      localObject1 = null;
      if (paramInt <= 10) {
        break label16;
      }
    }
    for (;;)
    {
      return (String)localObject1;
      label16:
      String str1 = getCustomDimensionAttributeKey(paramInt);
      Cursor localCursor = null;
      try
      {
        localCursor = this.mProvider.query("custom_dimensions", PROJECTION_SET_CUSTOM_DIMENSION, SELECTION_SET_CUSTOM_DIMENSION, new String[] { str1 }, null);
        boolean bool = localCursor.moveToFirst();
        localObject1 = null;
        if (bool)
        {
          String str2 = localCursor.getString(localCursor.getColumnIndexOrThrow("custom_dimension_value"));
          localObject1 = str2;
        }
        return (String)localObject1;
      }
      finally
      {
        if (localCursor != null) {
          localCursor.close();
        }
      }
    }
  }
  
  private JSONObject _getIdentifiers()
  {
    Cursor localCursor = null;
    localJSONObject = new JSONObject();
    try
    {
      localCursor = this.mProvider.query("identifiers", null, null, null, null);
      while (localCursor.moveToNext()) {
        localJSONObject.put(localCursor.getString(localCursor.getColumnIndexOrThrow("key")), localCursor.getString(localCursor.getColumnIndexOrThrow("value")));
      }
      return localJSONObject;
    }
    catch (JSONException localJSONException)
    {
      return localJSONObject;
      return localJSONObject;
    }
    finally
    {
      while (localCursor == null) {}
      localCursor.close();
    }
  }
  
  private void _handlePushRegistration(Intent paramIntent)
  {
    String str = paramIntent.getStringExtra("registration_id");
    if (_isPushDisabled())
    {
      Localytics.Log.v("GCM registered but push disabled: removing id");
      _setPushID(null);
    }
    do
    {
      return;
      if (paramIntent.getStringExtra("error") != null)
      {
        Localytics.Log.v("GCM registration failed");
        return;
      }
      if (paramIntent.getStringExtra("unregistered") != null)
      {
        Localytics.Log.v("GCM unregistered: removing id");
        _setPushID(null);
        return;
      }
    } while (str == null);
    Localytics.Log.v(String.format("GCM registered, new id: %s", new Object[] { str }));
    _setPushID(str);
  }
  
  private boolean _isOptedOut()
  {
    Cursor localCursor = null;
    try
    {
      localCursor = this.mProvider.query("info", new String[] { "opt_out" }, null, null, null);
      if (localCursor.moveToFirst())
      {
        int i = localCursor.getInt(localCursor.getColumnIndexOrThrow("opt_out"));
        if (i != 0) {}
        for (boolean bool = true;; bool = false) {
          return bool;
        }
      }
      return false;
    }
    finally
    {
      if (localCursor != null) {
        localCursor.close();
      }
    }
  }
  
  private boolean _isPushDisabled()
  {
    boolean bool = false;
    Cursor localCursor = null;
    try
    {
      localCursor = this.mProvider.query("info", new String[] { "push_disabled" }, null, null, null);
      if (localCursor.moveToNext())
      {
        int i = localCursor.getInt(localCursor.getColumnIndexOrThrow("push_disabled"));
        if (i == 1) {}
        for (bool = true;; bool = false) {
          break;
        }
      }
      return bool;
    }
    finally
    {
      if (localCursor != null) {
        localCursor.close();
      }
    }
    return bool;
  }
  
  private boolean _isSessionOpen()
  {
    long l1 = 0L;
    long l2 = 0L;
    Cursor localCursor = null;
    try
    {
      localCursor = this.mProvider.query("info", new String[] { "last_session_open_time", "last_session_close_time" }, null, null, null);
      if (localCursor.moveToFirst())
      {
        l1 = localCursor.getLong(localCursor.getColumnIndexOrThrow("last_session_open_time"));
        long l3 = localCursor.getLong(localCursor.getColumnIndexOrThrow("last_session_close_time"));
        l2 = l3;
      }
      if (localCursor != null) {
        localCursor.close();
      }
      if ((l1 != 0L) && (l1 >= l2)) {
        return true;
      }
    }
    finally
    {
      if (localCursor != null) {
        localCursor.close();
      }
    }
    return false;
  }
  
  private void _open()
  {
    if (_isSessionOpen())
    {
      Localytics.Log.w("Session was already open");
      return;
    }
    Cursor localCursor = null;
    for (;;)
    {
      try
      {
        localCursor = this.mProvider.query("info", new String[] { "last_session_close_time" }, null, null, null);
        if (localCursor.moveToFirst())
        {
          long l = localCursor.getLong(localCursor.getColumnIndexOrThrow("last_session_close_time"));
          if (System.currentTimeMillis() < l + Constants.SESSION_EXPIRATION)
          {
            ((AnalyticsListener)this.listeners).localyticsSessionWillOpen(false, this.mAppWasUpgraded, true);
            Localytics.Log.v("Opening old closed session and reconnecting");
            _dequeQueuedCloseSessionTag(false);
            ((AnalyticsListener)this.listeners).localyticsSessionDidOpen(false, this.mAppWasUpgraded, true);
          }
        }
        else
        {
          return;
        }
        ((AnalyticsListener)this.listeners).localyticsSessionWillOpen(this.mFirstSessionEver, this.mAppWasUpgraded, false);
        Localytics.Log.v("Opening new session");
        _dequeQueuedCloseSessionTag(true);
        DatapointHelper.AdvertisingInfo localAdvertisingInfo = DatapointHelper.getAdvertisingInfo(this.mLocalyticsDao.getAppContext());
        String str;
        if (localAdvertisingInfo == null)
        {
          str = null;
          _setFirstAdvertisingId(str);
          _tagEvent("open");
          BaseProvider.deleteOldFiles(this.mLocalyticsDao.getAppContext());
          ((AnalyticsListener)this.listeners).localyticsSessionDidOpen(this.mFirstSessionEver, this.mAppWasUpgraded, false);
        }
        else
        {
          str = localAdvertisingInfo.id;
        }
      }
      finally
      {
        if (localCursor != null) {
          localCursor.close();
        }
      }
    }
  }
  
  private void _registerPush(String paramString)
  {
    if (_isPushDisabled()) {
      Localytics.Log.v("Registering for GCM but push disabled");
    }
    for (;;)
    {
      return;
      Cursor localCursor = null;
      try
      {
        localCursor = this.mProvider.query("info", new String[] { "sender_id", "registration_version", "registration_id" }, null, null, null);
        boolean bool = localCursor.moveToFirst();
        Object localObject2 = null;
        String str1 = null;
        String str2 = null;
        if (bool)
        {
          str2 = localCursor.getString(localCursor.getColumnIndexOrThrow("sender_id"));
          str1 = localCursor.getString(localCursor.getColumnIndexOrThrow("registration_version"));
          String str3 = localCursor.getString(localCursor.getColumnIndexOrThrow("registration_id"));
          localObject2 = str3;
        }
        if (localCursor != null) {
          localCursor.close();
        }
        if (!paramString.equals(str2))
        {
          localObject2 = null;
          _setPushID(paramString, null);
        }
        String str4 = DatapointHelper.getAppVersion(this.mLocalyticsDao.getAppContext());
        if ((!TextUtils.isEmpty((CharSequence)localObject2)) && (str4.equals(str1))) {
          continue;
        }
        Class[] arrayOfClass = { Context.class };
        Object[] arrayOfObject = new Object[1];
        arrayOfObject[0] = this.mLocalyticsDao.getAppContext();
        Object localObject3 = ReflectionUtils.tryInvokeStatic("com.google.android.gms.gcm.GoogleCloudMessaging", "getInstance", arrayOfClass, arrayOfObject);
        if (localObject3 == null) {
          continue;
        }
        PushReceiver.retrySenderId = paramString;
        ReflectionUtils.tryInvokeInstance(localObject3, "register", new Class[] { String[].class }, new Object[] { { paramString } });
        return;
      }
      finally
      {
        if (localCursor != null) {
          localCursor.close();
        }
      }
    }
  }
  
  private void _reuploadFirstSession(String paramString)
  {
    String str = _replaceAttributionInFirstSession(paramString);
    if (!TextUtils.isEmpty(str)) {
      new ReferralUploader(this, str, this.mLocalyticsDao).start();
    }
  }
  
  private void _setCustomDimension(int paramInt, String paramString)
  {
    String str = getCustomDimensionAttributeKey(paramInt);
    if (TextUtils.isEmpty(paramString)) {
      this.mProvider.remove("custom_dimensions", String.format("%s = ?", new Object[] { "custom_dimension_key" }), new String[] { str });
    }
    ContentValues localContentValues;
    do
    {
      return;
      localContentValues = new ContentValues();
      localContentValues.put("custom_dimension_key", str);
      localContentValues.put("custom_dimension_value", paramString);
    } while (this.mProvider.update("custom_dimensions", localContentValues, SELECTION_SET_CUSTOM_DIMENSION, new String[] { str }) != 0);
    this.mProvider.insert("custom_dimensions", localContentValues);
  }
  
  private void _setFirstAdvertisingId(String paramString)
  {
    Cursor localCursor = null;
    try
    {
      localCursor = this.mProvider.query("info", new String[] { "first_advertising_id" }, null, null, null);
      boolean bool = localCursor.moveToFirst();
      Object localObject2 = null;
      if (bool)
      {
        String str = localCursor.getString(localCursor.getColumnIndexOrThrow("first_advertising_id"));
        localObject2 = str;
      }
      if (localCursor != null) {
        localCursor.close();
      }
      if (!TextUtils.isEmpty((CharSequence)localObject2))
      {
        Localytics.Log.v("First advertising id has already been set before.");
        return;
      }
    }
    finally
    {
      if (localCursor != null) {
        localCursor.close();
      }
    }
    ContentValues localContentValues = new ContentValues();
    localContentValues.put("first_advertising_id", paramString);
    this.mProvider.update("info", localContentValues, null, null);
  }
  
  private void _setIdentifier(String paramString1, String paramString2)
  {
    if (paramString2 != null) {
      paramString2 = paramString2.trim();
    }
    ContentValues localContentValues2;
    if (TextUtils.isEmpty(paramString2))
    {
      this.mProvider.remove("identifiers", String.format("%s = ?", new Object[] { "key" }), new String[] { paramString1 });
      if (paramString1.equals("customer_id"))
      {
        localContentValues2 = new ContentValues();
        if (!TextUtils.isEmpty(paramString2)) {
          break label180;
        }
        localContentValues2.put("customer_id", this.mLocalyticsDao.getInstallationId());
        localContentValues2.put("user_type", "anonymous");
      }
    }
    for (;;)
    {
      this.mProvider.update("info", localContentValues2, null, null);
      return;
      ContentValues localContentValues1 = new ContentValues();
      localContentValues1.put("key", paramString1);
      localContentValues1.put("value", paramString2);
      if (this.mProvider.update("identifiers", localContentValues1, SELECTION_SET_IDENTIFIER, new String[] { paramString1 }) != 0) {
        break;
      }
      this.mProvider.insert("identifiers", localContentValues1);
      break;
      label180:
      localContentValues2.put("customer_id", paramString2);
      localContentValues2.put("user_type", "known");
    }
  }
  
  private void _setOptedOut(boolean paramBoolean)
  {
    if (_isOptedOut() == paramBoolean) {
      return;
    }
    if (paramBoolean) {}
    for (String str = "opt_out";; str = "opt_in")
    {
      _tagEvent(str);
      if ((_isSessionOpen()) && (paramBoolean)) {
        _close();
      }
      ContentValues localContentValues = new ContentValues();
      localContentValues.put("opt_out", Boolean.valueOf(paramBoolean));
      this.mProvider.update("info", localContentValues, null, null);
      return;
    }
  }
  
  private void _setPushDisabled(int paramInt)
  {
    ContentValues localContentValues = new ContentValues();
    localContentValues.put("push_disabled", Integer.valueOf(paramInt));
    this.mProvider.update("info", localContentValues, null, null);
  }
  
  private void _setPushID(String paramString)
  {
    ContentValues localContentValues = new ContentValues();
    if (paramString == null) {
      paramString = "";
    }
    localContentValues.put("registration_id", paramString);
    localContentValues.put("registration_version", DatapointHelper.getAppVersion(this.mLocalyticsDao.getAppContext()));
    this.mProvider.update("info", localContentValues, null, null);
  }
  
  private void _setPushID(String paramString1, String paramString2)
  {
    ContentValues localContentValues = new ContentValues();
    localContentValues.put("sender_id", paramString1);
    if (paramString2 == null) {
      paramString2 = "";
    }
    localContentValues.put("registration_id", paramString2);
    this.mProvider.update("info", localContentValues, null, null);
  }
  
  private void _setReferrerId(String paramString)
  {
    Cursor localCursor;
    if (!TextUtils.isEmpty(paramString)) {
      localCursor = null;
    }
    try
    {
      localCursor = this.mProvider.query("info", new String[] { "play_attribution" }, null, null, null);
      if ((localCursor.moveToFirst()) && (TextUtils.isEmpty(localCursor.getString(localCursor.getColumnIndexOrThrow("play_attribution")))))
      {
        ContentValues localContentValues = new ContentValues();
        localContentValues.put("play_attribution", paramString);
        this.mProvider.update("info", localContentValues, null, null);
        Localytics.Log.i("[REFERRAL] _setReferrerId: " + paramString);
        _reuploadFirstSession(paramString);
      }
      return;
    }
    finally
    {
      if (localCursor != null) {
        localCursor.close();
      }
    }
  }
  
  private void _tagEvent(String paramString)
  {
    _tagEvent(paramString, null, null);
  }
  
  private void _tagEvent(String paramString, Map<String, String> paramMap, Long paramLong)
  {
    String str1 = "";
    String str2 = "";
    String str3 = "";
    Cursor localCursor = null;
    for (;;)
    {
      try
      {
        JSONObject localJSONObject1 = new JSONObject();
        long l1 = 0L;
        localJSONObject1.put("dt", "h");
        localJSONObject1.put("u", UUID.randomUUID().toString());
        Context localContext = this.mLocalyticsDao.getAppContext();
        TelephonyManager localTelephonyManager = (TelephonyManager)localContext.getSystemService("phone");
        JSONObject localJSONObject2 = new JSONObject();
        JSONObject localJSONObject3;
        ContentValues localContentValues1;
        ContentValues localContentValues2;
        JSONObject localJSONObject4;
        long l2;
        String str11;
        long l5;
        long l4;
        try
        {
          localCursor = this.mProvider.query("info", null, null, null, null);
          boolean bool1 = localCursor.moveToFirst();
          int i = 0;
          int j = 0;
          TimeZone localTimeZone;
          if (bool1)
          {
            localJSONObject1.put("pa", Math.round((float)(localCursor.getLong(localCursor.getColumnIndexOrThrow("created_time")) / 1000L)));
            i = localCursor.getInt(localCursor.getColumnIndexOrThrow("next_header_number"));
            j = localCursor.getInt(localCursor.getColumnIndexOrThrow("next_session_number"));
            str2 = localCursor.getString(localCursor.getColumnIndexOrThrow("customer_id"));
            str3 = localCursor.getString(localCursor.getColumnIndexOrThrow("user_type"));
            str1 = localCursor.getString(localCursor.getColumnIndexOrThrow("current_session_uuid"));
            localJSONObject1.put("seq", i);
            localJSONObject2.put("dt", "a");
            localJSONObject2.put("au", this.mLocalyticsDao.getApiKey());
            String str4 = DatapointHelper.getAndroidIdHashOrNull(this.mLocalyticsDao.getAppContext());
            if (str4 != null) {
              localJSONObject2.put("du", str4);
            }
            localJSONObject2.put("lv", "androida_3.4.0");
            localJSONObject2.put("av", DatapointHelper.getAppVersion(this.mLocalyticsDao.getAppContext()));
            localJSONObject2.put("dp", "Android");
            localJSONObject2.put("dll", Locale.getDefault().getLanguage());
            localJSONObject2.put("dlc", Locale.getDefault().getCountry());
            localJSONObject2.put("nc", localTelephonyManager.getNetworkCountryIso());
            localJSONObject2.put("dc", localTelephonyManager.getSimCountryIso());
            localJSONObject2.put("dma", DatapointHelper.getManufacturer());
            localJSONObject2.put("dmo", Build.MODEL);
            localJSONObject2.put("dov", Build.VERSION.RELEASE);
            localJSONObject2.put("nca", localTelephonyManager.getNetworkOperatorName());
            localJSONObject2.put("dac", DatapointHelper.getNetworkType(localTelephonyManager, this.mLocalyticsDao.getAppContext()));
            localJSONObject2.put("iu", this.mLocalyticsDao.getInstallationId());
            String str5 = localCursor.getString(localCursor.getColumnIndexOrThrow("fb_attribution"));
            if (str5 != null) {
              localJSONObject2.put("fbat", str5);
            }
            String str6 = localCursor.getString(localCursor.getColumnIndexOrThrow("registration_id"));
            if (str6 != null) {
              localJSONObject2.put("push", str6);
            }
            String str7 = localCursor.getString(localCursor.getColumnIndexOrThrow("first_android_id"));
            if (str7 != null) {
              localJSONObject2.put("aid", str7);
            }
            Object localObject2 = DatapointHelper.getAndroidIdOrNull(this.mLocalyticsDao.getAppContext());
            if (localObject2 == null) {
              localObject2 = JSONObject.NULL;
            }
            localJSONObject2.put("caid", localObject2);
            DatapointHelper.AdvertisingInfo localAdvertisingInfo = DatapointHelper.getAdvertisingInfo(this.mLocalyticsDao.getAppContext());
            if ((localAdvertisingInfo != null) && (localAdvertisingInfo.limitAdTracking))
            {
              bool2 = true;
              localJSONObject2.put("lad", bool2);
              String str8 = localCursor.getString(localCursor.getColumnIndexOrThrow("first_advertising_id"));
              if (str8 != null) {
                localJSONObject2.put("gadid", str8);
              }
              if ((localAdvertisingInfo != null) && (localAdvertisingInfo.id != null)) {
                localJSONObject2.put("gcadid", localAdvertisingInfo.id);
              }
              localTimeZone = TimeZone.getDefault();
              if (!localTimeZone.inDaylightTime(Calendar.getInstance(localTimeZone).getTime())) {
                continue;
              }
              m = localTimeZone.getRawOffset() + localTimeZone.getDSTSavings();
              localJSONObject2.put("tz", m / 1000L);
              String str9 = localCursor.getString(localCursor.getColumnIndexOrThrow("package_name"));
              if (str9 != null) {
                localJSONObject2.put("pkg", str9);
              }
              Object localObject3 = DatapointHelper.getSerialNumberHashOrNull();
              if (localObject3 == null) {
                localObject3 = JSONObject.NULL;
              }
              localJSONObject2.put("dms", localObject3);
              localJSONObject2.put("dsdk", Integer.valueOf(Constants.CURRENT_API_LEVEL));
              String str10 = localCursor.getString(localCursor.getColumnIndexOrThrow("play_attribution"));
              if (str10 != null) {
                localJSONObject2.put("aurl", str10);
              }
              l1 = localCursor.getLong(localCursor.getColumnIndexOrThrow("last_session_open_time"));
              _updateHeaderForTestModeAttribution(str10, localJSONObject2, localAdvertisingInfo, false);
            }
          }
          else
          {
            if (localCursor != null) {
              localCursor.close();
            }
            localJSONObject1.put("attrs", localJSONObject2);
            localJSONObject3 = _getIdentifiers();
            if (localJSONObject3.length() > 0) {
              localJSONObject1.put("ids", localJSONObject3);
            }
            localContentValues1 = new ContentValues();
            localContentValues2 = new ContentValues();
            localContentValues1.put("next_header_number", Integer.valueOf(i + 1));
            localJSONObject4 = new JSONObject();
            l2 = System.currentTimeMillis();
            str11 = UUID.randomUUID().toString();
            if (!"open".equals(paramString)) {
              continue;
            }
            localJSONObject4.put("dt", "s");
            localJSONObject4.put("ct", Math.round(l2 / 1000L));
            localJSONObject4.put("u", str11);
            l5 = l2 - l1;
            if (l1 != 0L) {
              continue;
            }
            localJSONObject4.put("sl", 0.0D);
            localJSONObject4.put("nth", j);
            _addLocationIDsAndCustomDimensions(localJSONObject4, localJSONObject3, str2, str3);
            Object[] arrayOfObject4 = new Object[2];
            arrayOfObject4[0] = localJSONObject1.toString();
            arrayOfObject4[1] = localJSONObject4.toString();
            String str13 = String.format("%s\n%s", arrayOfObject4);
            localContentValues2.put("blob", str13);
            localContentValues2.put("upload_format", Integer.valueOf(AnalyticsProvider.EventsV3Columns.UploadFormat.V2.getValue()));
            localContentValues1.put("last_session_open_time", Long.valueOf(l2));
            localContentValues1.put("next_session_number", Integer.valueOf(j + 1));
            localContentValues1.put("current_session_uuid", str11);
            if (this.mFirstSessionEver) {
              localContentValues1.put("first_open_event_blob", str13);
            }
            this.mProvider.update("info", localContentValues1, null, null);
            if (localContentValues2.size() > 0) {
              this.mProvider.insert("events", localContentValues2);
            }
            if (!Arrays.asList(new String[] { "open", "close", "opt_in", "opt_out" }).contains(paramString))
            {
              AnalyticsListener localAnalyticsListener = (AnalyticsListener)this.listeners;
              if (paramLong != null) {
                continue;
              }
              l4 = 0L;
              localAnalyticsListener.localyticsDidTagEvent(paramString, paramMap, l4);
            }
            return;
          }
          boolean bool2 = false;
          continue;
          int k = localTimeZone.getRawOffset();
          int m = k;
          continue;
          if (l5 <= 0L) {
            continue;
          }
        }
        finally
        {
          if (localCursor != null) {
            localCursor.close();
          }
        }
        localJSONObject4.put("sl", Math.round(l5 / 1000L));
        continue;
        if ("close".equals(paramString))
        {
          localJSONObject4.put("dt", "c");
          localJSONObject4.put("u", str11);
          localJSONObject4.put("su", str1);
          localJSONObject4.put("ss", Math.round(l1 / 1000L));
          localJSONObject4.put("ct", Math.round(l2 / 1000L));
          localJSONObject4.put("ctl", Math.round((l2 - l1) / 1000L));
          JSONArray localJSONArray = new JSONArray(this.screenFlow);
          if (localJSONArray.length() > 0) {
            localJSONObject4.put("fl", localJSONArray);
          }
          _addLocationIDsAndCustomDimensions(localJSONObject4, localJSONObject3, str2, str3);
          localContentValues1.put("last_session_close_time", Long.valueOf(l2));
          Object[] arrayOfObject3 = new Object[2];
          arrayOfObject3[0] = localJSONObject1.toString();
          arrayOfObject3[1] = localJSONObject4.toString();
          localContentValues1.put("queued_close_session_blob", String.format("%s\n%s", arrayOfObject3));
          localContentValues1.put("queued_close_session_blob_upload_format", Integer.valueOf(AnalyticsProvider.EventsV3Columns.UploadFormat.V2.getValue()));
        }
        else if (("opt_in".equals(paramString)) || ("opt_out".equals(paramString)))
        {
          localJSONObject4.put("dt", "o");
          localJSONObject4.put("u", this.mLocalyticsDao.getApiKey());
          String str12;
          if ("opt_out".equals(paramString))
          {
            str12 = Boolean.TRUE.toString();
            localJSONObject4.put("out", str12);
            localJSONObject4.put("ct", Math.round(l2 / 1000L));
            Object[] arrayOfObject1 = new Object[2];
            arrayOfObject1[0] = localJSONObject1.toString();
            arrayOfObject1[1] = localJSONObject4.toString();
            localContentValues2.put("blob", String.format("%s\n%s", arrayOfObject1));
            localContentValues2.put("upload_format", Integer.valueOf(AnalyticsProvider.EventsV3Columns.UploadFormat.V2.getValue()));
          }
          else
          {
            str12 = Boolean.FALSE.toString();
          }
        }
        else
        {
          localJSONObject4.put("dt", "e");
          localJSONObject4.put("ct", Math.round(l2 / 1000L));
          localJSONObject4.put("u", str11);
          if (_isSessionOpen())
          {
            localJSONObject4.put("su", str1);
            if (paramString.startsWith(localContext.getPackageName()))
            {
              localJSONObject4.put("n", paramString.substring(1 + localContext.getPackageName().length(), paramString.length()));
              if (paramLong.longValue() != 0L) {
                localJSONObject4.put("v", paramLong);
              }
              _addLocationIDsAndCustomDimensions(localJSONObject4, localJSONObject3, str2, str3);
              if (paramMap != null) {
                localJSONObject4.put("attrs", new JSONObject(paramMap));
              }
              Object[] arrayOfObject2 = new Object[2];
              arrayOfObject2[0] = localJSONObject1.toString();
              arrayOfObject2[1] = localJSONObject4.toString();
              localContentValues2.put("blob", String.format("%s\n%s", arrayOfObject2));
              localContentValues2.put("upload_format", Integer.valueOf(AnalyticsProvider.EventsV3Columns.UploadFormat.V2.getValue()));
            }
            else
            {
              localJSONObject4.put("n", paramString);
              continue;
              long l3 = paramLong.longValue();
              l4 = l3;
            }
          }
          else
          {
            str1 = "";
          }
        }
      }
      catch (Exception localException)
      {
        return;
      }
    }
  }
  
  private void _tagScreen(String paramString)
  {
    if (_isSessionOpen())
    {
      if ((this.screenFlow.size() == 0) || (!paramString.equals(this.screenFlow.get(-1 + this.screenFlow.size())))) {
        this.screenFlow.add(paramString);
      }
      return;
    }
    Localytics.Log.w("Screen not tagged because a session is not open");
  }
  
  private void _updateHeaderForTestModeAttribution(String paramString, @NonNull JSONObject paramJSONObject, DatapointHelper.AdvertisingInfo paramAdvertisingInfo, boolean paramBoolean)
  {
    if (!this.mSentReferrerTestMode)
    {
      if (!TextUtils.isEmpty(paramString))
      {
        String[] arrayOfString1 = URLDecoder.decode(paramString).split("[&]");
        int i = arrayOfString1.length;
        int j = 0;
        if (j < i)
        {
          String[] arrayOfString2 = arrayOfString1[j].split("[=]");
          if (arrayOfString2.length > 1)
          {
            String str3 = arrayOfString2[0].toLowerCase();
            String str4 = arrayOfString2[1].toLowerCase();
            if ((!str3.equals("localytics_test_mode")) || ((!str4.equals("1")) && (!str4.equals("true")))) {
              break label126;
            }
          }
          label126:
          for (boolean bool = true;; bool = false)
          {
            this.mReferrerTestModeEnabled = bool;
            j++;
            break;
          }
        }
      }
      if (((!paramBoolean) && (!this.mFirstSessionEver)) || (!this.mReferrerTestModeEnabled)) {}
    }
    try
    {
      Localytics.Log.i("[REFERRAL] using fake id for attribution test mode");
      String str1 = Long.toHexString(new SecureRandom().nextLong());
      paramJSONObject.put("aid", str1);
      paramJSONObject.put("du", DatapointHelper.getSha256_buggy(str1));
      paramJSONObject.put("caid", str1);
      if (paramAdvertisingInfo != null)
      {
        String str2 = UUID.randomUUID().toString();
        paramJSONObject.put("gadid", str2);
        paramJSONObject.put("gcadid", str2);
      }
      this.mSentReferrerTestMode = true;
      return;
    }
    catch (JSONException localJSONException)
    {
      LocalyticsManager.throwOrLogError(JSONException.class, "Exception adding values to object");
    }
  }
  
  private String getCustomDimensionAttributeKey(int paramInt)
  {
    if ((paramInt >= 0) && (paramInt <= 10))
    {
      Object[] arrayOfObject = new Object[2];
      arrayOfObject[0] = "custom_dimension_";
      arrayOfObject[1] = String.valueOf(paramInt);
      return String.format("%s%s", arrayOfObject);
    }
    return (String)LocalyticsManager.throwOrLogError(IndexOutOfBoundsException.class, "Custom dimension index cannot exceed " + String.valueOf(10));
  }
  
  protected void _deleteUploadedData(int paramInt)
  {
    this.mProvider.remove("events", "_id <= " + paramInt, null);
  }
  
  protected TreeMap<Integer, Object> _getDataToUpload()
  {
    TreeMap localTreeMap = new TreeMap();
    Cursor localCursor = null;
    try
    {
      localCursor = this.mProvider.query("events", null, null, null, "_id ASC");
      while ((localCursor.moveToNext()) && (localTreeMap.size() < 100))
      {
        int i = localCursor.getInt(localCursor.getColumnIndexOrThrow("_id"));
        String str = localCursor.getString(localCursor.getColumnIndexOrThrow("blob"));
        localTreeMap.put(Integer.valueOf(i), str);
      }
      while (localCursor == null) {}
    }
    finally
    {
      if (localCursor != null) {
        localCursor.close();
      }
      return localTreeMap;
    }
    localCursor.close();
    return localTreeMap;
  }
  
  protected int _getMaxRowToUpload()
  {
    Cursor localCursor = null;
    try
    {
      localCursor = this.mProvider.query("events", new String[] { "_id" }, null, null, "_id ASC");
      boolean bool = localCursor.moveToLast();
      int i = 0;
      if (bool)
      {
        int j = localCursor.getInt(localCursor.getColumnIndexOrThrow("_id"));
        i = j;
      }
      return i;
    }
    finally
    {
      if (localCursor != null) {
        localCursor.close();
      }
    }
    return 0;
  }
  
  protected void _init()
  {
    if (this.mProvider == null) {
      this.mProvider = new AnalyticsProvider(this.siloName.toLowerCase(), this.mLocalyticsDao);
    }
    _initApiKey();
  }
  
  protected void _initApiKey()
  {
    Cursor localCursor = null;
    for (;;)
    {
      String str1;
      try
      {
        str1 = DatapointHelper.getAppVersion(this.mLocalyticsDao.getAppContext());
        localCursor = this.mProvider.query("info", new String[] { "app_version", "uuid", "next_session_number", "customer_id" }, null, null, null);
        if (localCursor.moveToFirst())
        {
          Object[] arrayOfObject2 = new Object[1];
          arrayOfObject2[0] = this.mLocalyticsDao.getApiKey();
          Localytics.Log.v(String.format("Loading details for API key %s", arrayOfObject2));
          ContentValues localContentValues2 = new ContentValues();
          if (!localCursor.getString(localCursor.getColumnIndexOrThrow("app_version")).equals(str1))
          {
            localContentValues2.put("app_version", str1);
            this.mAppWasUpgraded = true;
          }
          if (localContentValues2.size() != 0) {
            this.mProvider.update("info", localContentValues2, null, null);
          }
          String str3;
          if (localCursor.getInt(localCursor.getColumnIndexOrThrow("next_session_number")) == 1)
          {
            bool = true;
            this.mFirstSessionEver = bool;
            this.mLocalyticsDao.setInstallationId(localCursor.getString(localCursor.getColumnIndexOrThrow("uuid")));
            str3 = localCursor.getString(localCursor.getColumnIndexOrThrow("customer_id"));
          }
          try
          {
            if (this.mLocalyticsDao.getCustomerIdInMemory(true) == null) {
              this.mLocalyticsDao.setCustomerIdInMemory(str3);
            }
            if (localCursor != null) {
              localCursor.close();
            }
            this.mLocalyticsDao.getCustomerIdInitiatedLatch().countDown();
            this.mProvider.vacuumIfNecessary();
            return;
          }
          finally {}
          boolean bool = false;
          continue;
        }
        arrayOfObject1 = new Object[1];
      }
      finally
      {
        if (localCursor != null) {
          localCursor.close();
        }
        this.mLocalyticsDao.getCustomerIdInitiatedLatch().countDown();
      }
      Object[] arrayOfObject1;
      arrayOfObject1[0] = this.mLocalyticsDao.getApiKey();
      Localytics.Log.v(String.format("Performing first-time initialization for new API key %s", arrayOfObject1));
      String str2 = UUID.randomUUID().toString();
      this.mLocalyticsDao.setInstallationId(str2);
      ContentValues localContentValues1 = new ContentValues();
      localContentValues1.put("api_key", this.mLocalyticsDao.getApiKey());
      localContentValues1.put("uuid", str2);
      localContentValues1.put("created_time", Long.valueOf(System.currentTimeMillis()));
      localContentValues1.put("opt_out", Boolean.FALSE);
      localContentValues1.put("push_disabled", Boolean.FALSE);
      localContentValues1.put("customer_id", str2);
      localContentValues1.put("user_type", "anonymous");
      localContentValues1.put("fb_attribution", DatapointHelper.getFBAttribution(this.mLocalyticsDao.getAppContext()));
      localContentValues1.put("first_android_id", DatapointHelper.getAndroidIdOrNull(this.mLocalyticsDao.getAppContext()));
      localContentValues1.put("package_name", this.mLocalyticsDao.getAppContext().getPackageName());
      localContentValues1.put("app_version", str1);
      localContentValues1.put("next_session_number", Integer.valueOf(1));
      localContentValues1.put("next_header_number", Integer.valueOf(1));
      localContentValues1.put("last_session_open_time", Integer.valueOf(0));
      localContentValues1.put("last_session_close_time", Integer.valueOf(0));
      this.mProvider.insert("info", localContentValues1);
      this.mFirstSessionEver = true;
      try
      {
        if (this.mLocalyticsDao.getCustomerIdInMemory(true) == null) {
          this.mLocalyticsDao.setCustomerIdInMemory(str2);
        }
      }
      finally {}
    }
  }
  
  protected void _onUploadCompleted(String paramString)
  {
    this.mProvider.vacuumIfNecessary();
  }
  
  @Nullable
  String _replaceAttributionInFirstSession(String paramString)
  {
    Cursor localCursor = null;
    try
    {
      localCursor = this.mProvider.query("info", new String[] { "first_open_event_blob" }, null, null, null);
      if (localCursor.moveToFirst())
      {
        String str1 = localCursor.getString(localCursor.getColumnIndexOrThrow("first_open_event_blob"));
        if (!TextUtils.isEmpty(str1))
        {
          String[] arrayOfString = str1.split("[\n]");
          try
          {
            JSONObject localJSONObject1 = new JSONObject(arrayOfString[0]);
            JSONObject localJSONObject2 = (JSONObject)localJSONObject1.get("attrs");
            _updateHeaderForTestModeAttribution(paramString, localJSONObject2, DatapointHelper.getAdvertisingInfo(this.mLocalyticsDao.getAppContext()), true);
            localJSONObject2.put("aurl", paramString);
            Object[] arrayOfObject = new Object[2];
            arrayOfObject[0] = localJSONObject1.toString();
            arrayOfObject[1] = arrayOfString[1];
            String str2 = String.format("%s\n%s", arrayOfObject);
            return str2;
          }
          catch (JSONException localJSONException)
          {
            Localytics.Log.e("JSONException", localJSONException);
          }
        }
      }
      return null;
    }
    finally
    {
      if (localCursor != null) {
        localCursor.close();
      }
    }
  }
  
  void closeSession()
  {
    queueMessage(obtainMessage(102));
  }
  
  String getCustomDimension(final int paramInt)
  {
    getString(new Callable()
    {
      public String call()
      {
        return AnalyticsHandler.this._getCustomDimension(paramInt);
      }
    });
  }
  
  String getIdentifier(final String paramString)
  {
    getString(new Callable()
    {
      public String call()
      {
        Cursor localCursor = null;
        try
        {
          BaseProvider localBaseProvider = AnalyticsHandler.this.mProvider;
          String[] arrayOfString1 = AnalyticsHandler.PROJECTION_SET_IDENTIFIER;
          String str1 = AnalyticsHandler.SELECTION_SET_IDENTIFIER;
          String[] arrayOfString2 = new String[1];
          arrayOfString2[0] = paramString;
          localCursor = localBaseProvider.query("identifiers", arrayOfString1, str1, arrayOfString2, null);
          boolean bool = localCursor.moveToFirst();
          Object localObject2 = null;
          if (bool)
          {
            String str2 = localCursor.getString(localCursor.getColumnIndexOrThrow("value"));
            localObject2 = str2;
          }
          return (String)localObject2;
        }
        finally
        {
          if (localCursor != null) {
            localCursor.close();
          }
        }
      }
    });
  }
  
  Map<String, String> getIdentifiers()
  {
    getMap(new Callable()
    {
      public Map call()
      {
        Cursor localCursor = null;
        HashMap localHashMap = new HashMap();
        try
        {
          localCursor = AnalyticsHandler.this.mProvider.query("identifiers", null, null, null, null);
          while (localCursor.moveToNext()) {
            localHashMap.put(localCursor.getString(localCursor.getColumnIndexOrThrow("key")), localCursor.getString(localCursor.getColumnIndexOrThrow("value")));
          }
          while (localCursor == null) {}
        }
        finally
        {
          if (localCursor != null) {
            localCursor.close();
          }
          return localHashMap;
        }
        localCursor.close();
        return localHashMap;
      }
    });
  }
  
  String getPushRegistrationID()
  {
    getString(new Callable()
    {
      public String call()
      {
        Cursor localCursor = null;
        try
        {
          localCursor = AnalyticsHandler.this.mProvider.query("info", new String[] { "registration_id" }, null, null, null);
          boolean bool = localCursor.moveToFirst();
          Object localObject2 = null;
          if (bool)
          {
            String str = localCursor.getString(localCursor.getColumnIndexOrThrow("registration_id"));
            localObject2 = str;
          }
          return (String)localObject2;
        }
        finally
        {
          if (localCursor != null) {
            localCursor.close();
          }
        }
        return null;
      }
    });
  }
  
  protected BaseUploadThread getUploadThread(TreeMap<Integer, Object> paramTreeMap, String paramString)
  {
    return new AnalyticsUploadHandler(this, paramTreeMap, paramString, this.mLocalyticsDao);
  }
  
  protected void handleMessageExtended(Message paramMessage)
    throws Exception
  {
    switch (paramMessage.what)
    {
    case 111: 
    default: 
      super.handleMessageExtended(paramMessage);
      return;
    case 101: 
      Localytics.Log.d("Analytics handler received MESSAGE_OPEN");
      this.mProvider.runBatchTransaction(new Runnable()
      {
        public void run()
        {
          if (AnalyticsHandler.this._isOptedOut())
          {
            Localytics.Log.d("Data collection is opted out");
            return;
          }
          AnalyticsHandler.this._open();
        }
      });
      return;
    case 102: 
      Localytics.Log.d("Analytics handler received MESSAGE_CLOSE");
      this.mProvider.runBatchTransaction(new Runnable()
      {
        public void run()
        {
          if (AnalyticsHandler.this._isOptedOut())
          {
            Localytics.Log.d("Data collection is opted out");
            return;
          }
          AnalyticsHandler.this._close();
        }
      });
      return;
    case 103: 
      Localytics.Log.d("Analytics handler received MESSAGE_TAG_EVENT");
      Object[] arrayOfObject3 = (Object[])paramMessage.obj;
      final String str8 = (String)arrayOfObject3[0];
      final Map localMap = (Map)arrayOfObject3[1];
      final Long localLong = (Long)arrayOfObject3[2];
      BaseProvider localBaseProvider10 = this.mProvider;
      Runnable local5 = new Runnable()
      {
        public void run()
        {
          if (AnalyticsHandler.this._isOptedOut())
          {
            Localytics.Log.d("Data collection is opted out");
            return;
          }
          AnalyticsHandler.this._tagEvent(str8, localMap, localLong);
        }
      };
      localBaseProvider10.runBatchTransaction(local5);
      return;
    case 104: 
      Localytics.Log.d("Analytics handler received MESSAGE_TAG_SCREEN");
      final String str7 = (String)paramMessage.obj;
      BaseProvider localBaseProvider9 = this.mProvider;
      Runnable local6 = new Runnable()
      {
        public void run()
        {
          if (AnalyticsHandler.this._isOptedOut())
          {
            Localytics.Log.d("Data collection is opted out");
            return;
          }
          AnalyticsHandler.this._tagScreen(str7);
        }
      };
      localBaseProvider9.runBatchTransaction(local6);
      return;
    case 107: 
      Localytics.Log.d("Analytics handler received MESSAGE_SET_CUSTOM_DIMENSION");
      Object[] arrayOfObject2 = (Object[])paramMessage.obj;
      final int j = ((Integer)arrayOfObject2[0]).intValue();
      final String str6 = (String)arrayOfObject2[1];
      BaseProvider localBaseProvider8 = this.mProvider;
      Runnable local7 = new Runnable()
      {
        public void run()
        {
          AnalyticsHandler.this._setCustomDimension(j, str6);
        }
      };
      localBaseProvider8.runBatchTransaction(local7);
      return;
    case 105: 
      Localytics.Log.d("Analytics handler received MESSAGE_SET_IDENTIFIER");
      Object[] arrayOfObject1 = (Object[])paramMessage.obj;
      final String str4 = (String)arrayOfObject1[0];
      final String str5 = (String)arrayOfObject1[1];
      BaseProvider localBaseProvider7 = this.mProvider;
      Runnable local8 = new Runnable()
      {
        public void run()
        {
          AnalyticsHandler.this._setIdentifier(str4, str5);
        }
      };
      localBaseProvider7.runBatchTransaction(local8);
      return;
    case 106: 
      Localytics.Log.d("Analytics handler received MESSAGE_SET_LOCATION");
      sLastLocation = (Location)paramMessage.obj;
      return;
    case 113: 
      Localytics.Log.d("Analytics handler received MESSAGE_SET_PUSH_REGID");
      final String str3 = (String)paramMessage.obj;
      BaseProvider localBaseProvider6 = this.mProvider;
      Runnable local9 = new Runnable()
      {
        public void run()
        {
          if (AnalyticsHandler.this._isPushDisabled())
          {
            Localytics.Log.v("Registering for GCM but push disabled");
            return;
          }
          AnalyticsHandler.this._setPushID(str3);
        }
      };
      localBaseProvider6.runBatchTransaction(local9);
      return;
    case 112: 
      Localytics.Log.d("Analytics handler received MESSAGE_DISABLE_PUSH");
      final int i = paramMessage.arg1;
      BaseProvider localBaseProvider5 = this.mProvider;
      Runnable local10 = new Runnable()
      {
        public void run()
        {
          AnalyticsHandler.this._setPushDisabled(i);
        }
      };
      localBaseProvider5.runBatchTransaction(local10);
      return;
    case 108: 
      Localytics.Log.v("Analytics handler received MESSAGE_OPT_OUT");
      if (paramMessage.arg1 != 0) {}
      for (final boolean bool = true;; bool = false)
      {
        BaseProvider localBaseProvider4 = this.mProvider;
        Runnable local11 = new Runnable()
        {
          public void run()
          {
            AnalyticsHandler.this._setOptedOut(bool);
          }
        };
        localBaseProvider4.runBatchTransaction(local11);
        return;
      }
    case 109: 
      Localytics.Log.d("Analytics handler received MESSAGE_REGISTER_PUSH");
      final String str2 = (String)paramMessage.obj;
      BaseProvider localBaseProvider3 = this.mProvider;
      Runnable local12 = new Runnable()
      {
        public void run()
        {
          AnalyticsHandler.this._registerPush(str2);
        }
      };
      localBaseProvider3.runBatchTransaction(local12);
      return;
    case 110: 
      Localytics.Log.d("Analytics handler received MESSAGE_HANDLE_PUSH_REGISTRATION");
      final Intent localIntent = (Intent)paramMessage.obj;
      BaseProvider localBaseProvider2 = this.mProvider;
      Runnable local13 = new Runnable()
      {
        public void run()
        {
          AnalyticsHandler.this._handlePushRegistration(localIntent);
        }
      };
      localBaseProvider2.runBatchTransaction(local13);
      return;
    }
    Localytics.Log.d("Analytics handler received MESSAGE_SET_REFERRERID");
    final String str1 = (String)paramMessage.obj;
    BaseProvider localBaseProvider1 = this.mProvider;
    Runnable local14 = new Runnable()
    {
      public void run()
      {
        AnalyticsHandler.this._setReferrerId(str1);
      }
    };
    localBaseProvider1.runBatchTransaction(local14);
  }
  
  void handleRegistration(Intent paramIntent)
  {
    queueMessage(obtainMessage(110, paramIntent));
  }
  
  boolean isOptedOut()
  {
    getBool(new Callable()
    {
      public Boolean call()
      {
        return Boolean.valueOf(AnalyticsHandler.this._isOptedOut());
      }
    });
  }
  
  boolean isPushDisabled()
  {
    getBool(new Callable()
    {
      public Boolean call()
      {
        return Boolean.valueOf(AnalyticsHandler.this._isPushDisabled());
      }
    });
  }
  
  void openSession()
  {
    queueMessage(obtainMessage(101));
  }
  
  void registerPush(String paramString, long paramLong)
  {
    queueMessageDelayed(obtainMessage(109, paramString), paramLong);
  }
  
  void setCustomDimension(int paramInt, String paramString)
  {
    if ((paramInt < 0) || (paramInt >= 10)) {
      throw new IllegalArgumentException("Only valid dimensions are 0 - 9");
    }
    Object[] arrayOfObject = new Object[2];
    arrayOfObject[0] = Integer.valueOf(paramInt);
    arrayOfObject[1] = paramString;
    queueMessage(obtainMessage(107, arrayOfObject));
  }
  
  void setIdentifier(String paramString1, String paramString2)
  {
    if (TextUtils.isEmpty(paramString1)) {
      throw new IllegalArgumentException("key cannot be null or empty");
    }
    queueMessage(obtainMessage(105, new Object[] { paramString1, paramString2 }));
  }
  
  void setLocation(Location paramLocation)
  {
    queueMessage(obtainMessage(106, new Location(paramLocation)));
  }
  
  void setOptedOut(boolean paramBoolean)
  {
    int i = 1;
    Object[] arrayOfObject = new Object[i];
    arrayOfObject[0] = Boolean.valueOf(paramBoolean);
    Localytics.Log.v(String.format("Requested opt-out state is %b", arrayOfObject));
    if (paramBoolean) {}
    for (;;)
    {
      queueMessage(obtainMessage(108, i, 0));
      return;
      i = 0;
    }
  }
  
  void setPushDisabled(boolean paramBoolean)
  {
    if (paramBoolean) {}
    for (int i = 1;; i = 0)
    {
      queueMessage(obtainMessage(112, i, 0));
      return;
    }
  }
  
  void setPushRegistrationId(String paramString)
  {
    queueMessage(obtainMessage(113, paramString));
  }
  
  void setReferrerId(String paramString)
  {
    queueMessage(obtainMessage(114, paramString));
  }
  
  void setScreenFlow(List<String> paramList)
  {
    this.screenFlow.addAll(0, paramList);
  }
  
  void tagEvent(String paramString, Map<String, String> paramMap, long paramLong)
  {
    if (TextUtils.isEmpty(paramString)) {
      throw new IllegalArgumentException("event cannot be null or empty");
    }
    if (paramMap != null)
    {
      if (paramMap.isEmpty()) {
        LocalyticsManager.throwOrLogError(IllegalArgumentException.class, "attributes is empty.  Did the caller make an error?");
      }
      if (paramMap.size() > 50)
      {
        Object[] arrayOfObject2 = new Object[2];
        arrayOfObject2[0] = Integer.valueOf(paramMap.size());
        arrayOfObject2[1] = Integer.valueOf(50);
        LocalyticsManager.throwOrLogError(IllegalArgumentException.class, String.format("attributes size is %d, exceeding the maximum size of %d.  Did the caller make an error?", arrayOfObject2));
      }
      Iterator localIterator = paramMap.entrySet().iterator();
      while (localIterator.hasNext())
      {
        Map.Entry localEntry = (Map.Entry)localIterator.next();
        String str1 = (String)localEntry.getKey();
        String str2 = (String)localEntry.getValue();
        if (TextUtils.isEmpty(str1)) {
          LocalyticsManager.throwOrLogError(IllegalArgumentException.class, "attributes cannot contain null or empty keys");
        }
        if (TextUtils.isEmpty(str2)) {
          LocalyticsManager.throwOrLogError(IllegalArgumentException.class, "attributes cannot contain null or empty values");
        }
      }
    }
    Object[] arrayOfObject1 = new Object[3];
    arrayOfObject1[0] = paramString;
    arrayOfObject1[1] = paramMap;
    arrayOfObject1[2] = Long.valueOf(paramLong);
    queueMessage(obtainMessage(103, arrayOfObject1));
  }
  
  void tagScreen(String paramString)
  {
    if (TextUtils.isEmpty(paramString)) {
      throw new IllegalArgumentException("event cannot be null or empty");
    }
    queueMessage(obtainMessage(104, paramString));
  }
  
  private final class AnalyticsListenersSet
    extends BaseHandler.ListenersSet
    implements AnalyticsListener
  {
    private AnalyticsListenersSet()
    {
      super();
    }
    
    public void localyticsDidTagEvent(String paramString, Map<String, String> paramMap, long paramLong)
    {
      try
      {
        Class[] arrayOfClass = new Class[3];
        arrayOfClass[0] = String.class;
        arrayOfClass[1] = Map.class;
        arrayOfClass[2] = Long.TYPE;
        Object[] arrayOfObject = new Object[3];
        arrayOfObject[0] = paramString;
        arrayOfObject[1] = paramMap;
        arrayOfObject[2] = Long.valueOf(paramLong);
        callListeners("localyticsDidTagEvent", arrayOfClass, arrayOfObject);
        return;
      }
      finally
      {
        localObject = finally;
        throw ((Throwable)localObject);
      }
    }
    
    public void localyticsSessionDidOpen(boolean paramBoolean1, boolean paramBoolean2, boolean paramBoolean3)
    {
      try
      {
        Class[] arrayOfClass = new Class[3];
        arrayOfClass[0] = Boolean.TYPE;
        arrayOfClass[1] = Boolean.TYPE;
        arrayOfClass[2] = Boolean.TYPE;
        Object[] arrayOfObject = new Object[3];
        arrayOfObject[0] = Boolean.valueOf(paramBoolean1);
        arrayOfObject[1] = Boolean.valueOf(paramBoolean2);
        arrayOfObject[2] = Boolean.valueOf(paramBoolean3);
        callListeners("localyticsSessionDidOpen", arrayOfClass, arrayOfObject);
        return;
      }
      finally
      {
        localObject = finally;
        throw ((Throwable)localObject);
      }
    }
    
    public void localyticsSessionWillClose()
    {
      try
      {
        callListeners("localyticsSessionWillClose", null, null);
        return;
      }
      finally
      {
        localObject = finally;
        throw ((Throwable)localObject);
      }
    }
    
    public void localyticsSessionWillOpen(boolean paramBoolean1, boolean paramBoolean2, boolean paramBoolean3)
    {
      try
      {
        Class[] arrayOfClass = new Class[3];
        arrayOfClass[0] = Boolean.TYPE;
        arrayOfClass[1] = Boolean.TYPE;
        arrayOfClass[2] = Boolean.TYPE;
        Object[] arrayOfObject = new Object[3];
        arrayOfObject[0] = Boolean.valueOf(paramBoolean1);
        arrayOfObject[1] = Boolean.valueOf(paramBoolean2);
        arrayOfObject[2] = Boolean.valueOf(paramBoolean3);
        callListeners("localyticsSessionWillOpen", arrayOfClass, arrayOfObject);
        return;
      }
      finally
      {
        localObject = finally;
        throw ((Throwable)localObject);
      }
    }
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/localytics/android/AnalyticsHandler.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */