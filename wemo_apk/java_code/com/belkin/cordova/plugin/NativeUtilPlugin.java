package com.belkin.cordova.plugin;

import android.app.Activity;
import android.app.Dialog;
import android.app.ProgressDialog;
import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.text.format.DateFormat;
import android.util.Log;
import android.view.View;
import android.view.ViewGroup.LayoutParams;
import android.view.Window;
import android.view.inputmethod.InputMethodManager;
import android.widget.ProgressBar;
import android.widget.TextView;
import com.belkin.activity.MainActivity;
import com.belkin.utils.GPSTracker;
import com.belkin.utils.LogUtils;
import com.belkin.utils.NativeUtil;
import com.belkin.utils.RuleUtility;
import com.belkin.utils.WiFiSecurityUtil;
import com.belkin.wemo.PermissionController;
import com.belkin.wemo.Permissions;
import com.belkin.wemo.cache.devicelist.DeviceListManager;
import com.belkin.wemo.cache.utils.MoreUtil;
import com.belkin.wemo.cache.utils.SDKNetworkUtils;
import com.belkin.wemo.cache.utils.SharePreferences;
import com.belkin.wemo.thread.WeMoThreadPoolHandler;
import java.io.PrintStream;
import java.util.HashSet;
import java.util.Iterator;
import java.util.Set;
import java.util.concurrent.ExecutorService;
import org.apache.cordova.CallbackContext;
import org.apache.cordova.CordovaInterface;
import org.apache.cordova.CordovaPlugin;
import org.apache.cordova.CordovaWebView;
import org.apache.cordova.PluginResult;
import org.apache.cordova.PluginResult.Status;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

public class NativeUtilPlugin
  extends CordovaPlugin
{
  public static final String TAG = "NativeUtilPlugin";
  public static DeviceListManager sDeviceListManager;
  private BroadcastReceiver mBroadcastReceiver = null;
  private CallbackContext mCallbackContext;
  private Context mContext;
  private MoreUtil mMoreUtil;
  private NativeUtil mNativeUtil;
  private SDKNetworkUtils mNetworkUtil;
  private PluginResult mPluginResult;
  private SharePreferences mSharePreference;
  private ProgressBar mSpinner;
  private WiFiSecurityUtil mWiFiSecurityUtil;
  private PermissionController mpermissionController;
  private Permissions permissions;
  private RuleUtility ruleUtility;
  
  private Set<String> mergeHomeSsid(Set<String> paramSet)
  {
    Set localSet = this.mSharePreference.getHomeSSIDs();
    int i = 1;
    Iterator localIterator1 = paramSet.iterator();
    while (localIterator1.hasNext())
    {
      String str = (String)localIterator1.next();
      Iterator localIterator2 = localSet.iterator();
      while (localIterator2.hasNext()) {
        if (((String)localIterator2.next()).equals(str)) {
          i = 0;
        }
      }
      if (i != 0) {
        localSet.add(str);
      }
    }
    return localSet;
  }
  
  public boolean execute(String paramString, JSONArray paramJSONArray, final CallbackContext paramCallbackContext)
    throws JSONException
  {
    int i = Integer.parseInt(paramString);
    Log.i("NativeUtilPlugin", "actionID: " + i);
    switch (i)
    {
    default: 
      Log.i("NativeUtilPlugin", "Incorrect action ID: " + i);
    case 6006: 
    case 5018: 
    case 5015: 
    case 5016: 
    case 7001: 
    case 7002: 
    case 7003: 
    case 5027: 
    case 5028: 
    case 7004: 
    case 7005: 
    case 7006: 
    case 7007: 
    case 7008: 
    case 7009: 
    case 7010: 
    case 7030: 
    case 7031: 
    case 7032: 
    case 7033: 
    case 7011: 
    case 9001: 
    case 9002: 
    case 7027: 
    case 9015: 
    case 9016: 
    case 9004: 
    case 9005: 
    case 7021: 
    case 7016: 
    case 7017: 
    case 2056: 
    case 2057: 
    case 7025: 
    case 7026: 
    case 2059: 
    case 2060: 
    case 7022: 
    case 7024: 
    case 7018: 
    case 9003: 
    case 9009: 
    case 7020: 
    case 7019: 
    case 2054: 
    case 2050: 
    case 8021: 
    case 8022: 
    case 8023: 
    case 7023: 
    case 9010: 
    case 9011: 
    case 9012: 
    case 8025: 
    case 8026: 
    case 9021: 
    case 9027: 
      for (;;)
      {
        return true;
        Log.i("NativeUtilPlugin", "ACTION_ANALYTICS_DATA");
        paramCallbackContext.success(this.mMoreUtil.analyticsData(this.mContext));
        continue;
        ExecutorService localExecutorService2 = this.cordova.getThreadPool();
        Runnable local1 = new Runnable()
        {
          public void run()
          {
            Log.i("NativeUtilPlugin", "ACTION_DB_RESET_ON_CHANGE_NETWORK");
            NativeUtilPlugin.this.ruleUtility.checkHomeNetworkStatus();
          }
        };
        localExecutorService2.execute(local1);
        paramCallbackContext.success("true");
        continue;
        Log.i("NativeUtilPlugin", "ACTION_GET_LOCATION_INFO");
        this.permissions = Permissions.getInstance(this.mContext);
        this.permissions.fetchPermission(paramCallbackContext);
        continue;
        Log.i("NativeUtilPlugin", "ACTION_GET_SR_SS_TIME");
        System.out.println("CordovaConstants.ACTION_GET_SR_SS_TIME:  " + paramJSONArray.getString(0) + "  ::  " + paramJSONArray.getString(1));
        paramCallbackContext.success(this.ruleUtility.getSunriseSunsetTime(Double.parseDouble(paramJSONArray.getString(0)), Double.parseDouble(paramJSONArray.getString(1))));
        continue;
        this.mPluginResult = new PluginResult(PluginResult.Status.OK, this.mSharePreference.isRemoteEnabled());
        this.mPluginResult.setKeepCallback(false);
        paramCallbackContext.sendPluginResult(this.mPluginResult);
        paramCallbackContext.success();
        continue;
        if (paramJSONArray != null)
        {
          boolean bool = paramJSONArray.getBoolean(0);
          this.mPluginResult = new PluginResult(PluginResult.Status.OK, this.mSharePreference.setRemoteEnabled(bool));
          if (!bool)
          {
            this.mSharePreference.setHomeSSIDs(null);
            this.mSharePreference.setARPMacs(null);
            this.mSharePreference.setRemoteAccessSSID(null);
          }
          this.mPluginResult.setKeepCallback(false);
          paramCallbackContext.sendPluginResult(this.mPluginResult);
        }
        paramCallbackContext.success();
        continue;
        Intent localIntent2 = new Intent("android.intent.action.SEND");
        localIntent2.setType("message/rfc822");
        String[] arrayOfString = new String[1];
        arrayOfString[0] = paramJSONArray.getString(0);
        localIntent2.putExtra("android.intent.extra.EMAIL", arrayOfString);
        localIntent2.putExtra("android.intent.extra.SUBJECT", paramJSONArray.getString(1));
        localIntent2.putExtra("android.intent.extra.TEXT", paramJSONArray.getString(2));
        this.mContext.startActivity(Intent.createChooser(localIntent2, "Send Email"));
        paramCallbackContext.success();
        continue;
        Log.e("NativeUtilPlugin", "ACTION_CHECK_LOCATION_SERVICE");
        if (!new GPSTracker(this.mContext).canGetLocation())
        {
          paramCallbackContext.success(1);
        }
        else
        {
          paramCallbackContext.error(0);
          continue;
          Intent localIntent1 = new Intent("android.settings.LOCATION_SOURCE_SETTINGS");
          this.mContext.startActivity(localIntent1);
          paramCallbackContext.success();
          continue;
          this.mMoreUtil.generateAndCallMarketUri(this.mContext);
          paramCallbackContext.success();
          continue;
          paramCallbackContext.success(this.mMoreUtil.getApplicationVersion(this.mContext));
          continue;
          this.mPluginResult = new PluginResult(PluginResult.Status.OK, this.mNetworkUtil.isHomeNetwork());
          this.mPluginResult.setKeepCallback(false);
          paramCallbackContext.sendPluginResult(this.mPluginResult);
          paramCallbackContext.success();
          continue;
          StringBuilder localStringBuilder = new StringBuilder();
          localStringBuilder.append(paramJSONArray.get(0) + ": " + this.mMoreUtil.getVersionNumber() + ", ").append("\n").append(paramJSONArray.get(1) + ": " + this.mMoreUtil.getDeviceUserName(this.mContext) + ", ").append("\n").append(paramJSONArray.get(2) + ": " + this.mMoreUtil.getApplicationVersion(this.mContext));
          paramCallbackContext.success(localStringBuilder.toString());
          continue;
          Runnable local2 = new Runnable()
          {
            public void run()
            {
              if (NativeUtilPlugin.this.mSharePreference.isRemoteEnabled())
              {
                paramCallbackContext.success(NativeUtilPlugin.this.mNetworkUtil.generateAuthCode());
                return;
              }
              paramCallbackContext.error(1);
            }
          };
          WeMoThreadPoolHandler.executeInBackground(local2);
          continue;
          paramCallbackContext.success(this.mMoreUtil.getFirmwareDetails(paramJSONArray.getString(0)));
          continue;
          this.mSharePreference.saveConfigurationStatus(paramJSONArray.getBoolean(0));
          paramCallbackContext.success();
          continue;
          this.mSharePreference.setNestAuthCallbackStatus(paramJSONArray.getInt(0));
          paramCallbackContext.success();
          continue;
          this.mPluginResult = new PluginResult(PluginResult.Status.OK, this.mSharePreference.getNestAuthCallbackStatus());
          this.mPluginResult.setKeepCallback(false);
          paramCallbackContext.sendPluginResult(this.mPluginResult);
          continue;
          this.mSharePreference.setNestDeauthCallbackStatus(paramJSONArray.getInt(0));
          paramCallbackContext.success();
          continue;
          this.mPluginResult = new PluginResult(PluginResult.Status.OK, this.mSharePreference.getNestDeauthCallbackStatus());
          this.mPluginResult.setKeepCallback(false);
          paramCallbackContext.sendPluginResult(this.mPluginResult);
          continue;
          this.mPluginResult = new PluginResult(PluginResult.Status.OK, this.mSharePreference.checkConfigurationStatus());
          this.mPluginResult.setKeepCallback(false);
          paramCallbackContext.sendPluginResult(this.mPluginResult);
          continue;
          Log.i("NativeUtilPlugin", "ACTION_SHOW_PROGRESS:");
          showSpinner("title", "message");
          paramCallbackContext.success();
          continue;
          Log.i("NativeUtilPlugin", "ACTION_HIDE_PROGRESS:");
          try
          {
            hideSpinner();
            paramCallbackContext.success();
          }
          catch (Exception localException6)
          {
            for (;;)
            {
              Log.i("NativeUtilPlugin", "hide progress:" + localException6);
              MainActivity.mProgressDialog.setCancelable(true);
            }
          }
          paramCallbackContext.success(this.mMoreUtil.getAppAndDeviceInfo(this.mContext).toString());
          continue;
          Log.i("NativeUtilPlugin", "ACTION_SHOW_SPLASH_ON_LOADING:");
          showSplash();
          paramCallbackContext.success();
          continue;
          Log.i("NativeUtilPlugin", "ACTION_HIDE_SPLASH_ON_LOADING:");
          try
          {
            hideSpinner();
            paramCallbackContext.success();
          }
          catch (Exception localException5)
          {
            for (;;)
            {
              Log.i("NativeUtilPlugin", "hide progress:" + localException5);
              MainActivity.mProgressDialog.setCancelable(true);
            }
          }
          Log.i("NativeUtilPlugin", "ACTION_SHOW_RULE_PROGRESS:");
          showProgressDialog(paramJSONArray.getString(0), paramJSONArray.getString(1));
          paramCallbackContext.success();
          continue;
          Log.i("NativeUtilPlugin", "ACTION_HIDE_PROGRESS_DIALOG:");
          try
          {
            hideProgressDialog();
            paramCallbackContext.success();
          }
          catch (Exception localException4)
          {
            for (;;)
            {
              Log.i("NativeUtilPlugin", "hide progress dialog:" + localException4);
              MainActivity.mProgressDialog.setCancelable(true);
            }
          }
          Log.i("NativeUtilPlugin", "ACTION_SAVE_IMAGE_TO_DB:");
          try
          {
            this.mNativeUtil.setImage(paramJSONArray.getString(0), paramJSONArray.getString(1).getBytes());
            paramCallbackContext.success();
          }
          catch (Exception localException3)
          {
            paramCallbackContext.error(0);
          }
          continue;
          Log.i("NativeUtilPlugin", "ACTION_GET_BASE64_IMAGE_FROM_DB:");
          try
          {
            String str9 = this.mNativeUtil.getBase64Image(paramJSONArray.getString(0));
            PluginResult localPluginResult2 = new PluginResult(PluginResult.Status.ERROR, str9);
            this.mPluginResult = localPluginResult2;
            this.mPluginResult.setKeepCallback(false);
            paramCallbackContext.sendPluginResult(this.mPluginResult);
            paramCallbackContext.success();
          }
          catch (Exception localException2)
          {
            paramCallbackContext.error(0);
          }
          continue;
          LogUtils.debugLog("NativeUtilPlugin", "ACTION_GET_NETWORK_TYPE_NEW");
          String str8 = this.mNetworkUtil.getNetworkType();
          LogUtils.debugLog("NativeUtilPlugin", "Network Name: " + str8);
          paramCallbackContext.success(str8);
          continue;
          LogUtils.infoLog("NativeUtilPlugin", "ACTION_GET_CACHE_SSID");
          paramCallbackContext.success(this.mSharePreference.getCacheSSID());
          continue;
          LogUtils.infoLog("NativeUtilPlugin", "ACTION_SET_CACHE_SSID ssid: " + paramJSONArray.getString(0));
          this.mSharePreference.setCacheSSID(paramJSONArray.getString(0));
          paramCallbackContext.success();
          continue;
          LogUtils.infoLog("NativeUtilPlugin", "ACTION_GET_CACHE_ARPMAC");
          paramCallbackContext.success(this.mSharePreference.getCacheArpMac());
          continue;
          LogUtils.infoLog("NativeUtilPlugin", "ACTION_SET_CACHE_ARPMAC arpmac: " + paramJSONArray.getString(0));
          this.mSharePreference.setCacheArpMac(paramJSONArray.getString(0));
          paramCallbackContext.success();
          continue;
          JSONArray localJSONArray2 = paramJSONArray.getJSONArray(0);
          JSONArray localJSONArray3 = paramJSONArray.getJSONArray(1);
          LogUtils.infoLog("NativeUtilPlugin", "ACTION_SET_SSID ssid: " + localJSONArray2 + " arpMac: " + localJSONArray3);
          HashSet localHashSet3 = new HashSet();
          for (int m = 0;; m++)
          {
            int n = localJSONArray2.length();
            if (m >= n) {
              break;
            }
            localHashSet3.add(localJSONArray2.getString(m));
          }
          Set localSet1 = mergeHomeSsid(localHashSet3);
          this.mSharePreference.setHomeSSIDs(localSet1);
          HashSet localHashSet4;
          Set localSet2;
          if (localJSONArray3.length() > 0)
          {
            localHashSet4 = new HashSet();
            for (int i1 = 0;; i1++)
            {
              int i2 = localJSONArray3.length();
              if (i1 >= i2) {
                break;
              }
              localHashSet4.add(localJSONArray3.getString(i1));
            }
            localSet2 = this.mSharePreference.getARPMacs();
            if (localSet2 != null) {
              break label2327;
            }
          }
          label2327:
          for (int i3 = 0;; i3 = localSet2.size())
          {
            Set localSet3 = this.mNetworkUtil.mergeArpMacs(localSet2, localHashSet4);
            this.mSharePreference.setARPMacs(localSet3);
            if ((i3 == 0) && (this.mNetworkUtil.isHomeNetwork()))
            {
              PluginResult localPluginResult1 = new PluginResult(PluginResult.Status.OK, true);
              this.mPluginResult = localPluginResult1;
              this.mPluginResult.setKeepCallback(false);
              paramCallbackContext.sendPluginResult(this.mPluginResult);
            }
            paramCallbackContext.success();
            break;
          }
          this.mSharePreference.storeHomeId(paramJSONArray.getString(0));
          this.mSharePreference.setRemoteAccessSSID(paramJSONArray.getString(1));
          HashSet localHashSet1 = new HashSet();
          HashSet localHashSet2 = new HashSet();
          localHashSet1.add(paramJSONArray.getString(1));
          JSONArray localJSONArray1 = null;
          try
          {
            localJSONArray1 = paramJSONArray.getJSONArray(2);
            if (localJSONArray1 != null) {
              for (int j = 0;; j++)
              {
                int k = localJSONArray1.length();
                if (j >= k) {
                  break;
                }
                localHashSet2.add(localJSONArray1.getString(j));
              }
            }
          }
          catch (Exception localException1)
          {
            localException1.printStackTrace();
            LogUtils.infoLog("NativeUtilPlugin", "ACTION_SET_HOME_CHANGE_SSID Home Id: " + paramJSONArray.getString(0) + " Home Ssid " + paramJSONArray.getString(1) + " arpMacArrayTemp: " + localJSONArray1);
            this.mSharePreference.setHomeSSIDs(localHashSet1);
            this.mSharePreference.setARPMacs(localHashSet2);
            paramCallbackContext.success();
          }
          LogUtils.infoLog("NativeUtilPlugin", "ACTION_GET_NETWORK_NAME");
          String str7 = this.mNetworkUtil.getNetworkName();
          LogUtils.debugLog("NativeUtilPlugin", "Network Name: " + str7);
          paramCallbackContext.success(str7);
          continue;
          LogUtils.infoLog("NativeUtilPlugin", "GET_CURRENT_ARPMAC");
          ExecutorService localExecutorService1 = this.cordova.getThreadPool();
          Runnable local3 = new Runnable()
          {
            public void run()
            {
              paramCallbackContext.success(NativeUtilPlugin.this.mNetworkUtil.getArpMac());
            }
          };
          localExecutorService1.execute(local3);
          continue;
          Log.i("NativeUtilPlugin", "ACTION_PREF_GET_CONFIG_STRING");
          paramCallbackContext.success(this.mSharePreference.getSetupCredential());
          continue;
          Log.i("NativeUtilPlugin", "ACTION_OPEN_SOFT_KEYBOARD");
          ((InputMethodManager)this.cordova.getActivity().getSystemService("input_method")).toggleSoftInput(2, 1);
          paramCallbackContext.success();
          continue;
          Log.i("NativeUtilPlugin", "ACTION_HIDE_SOFT_KEYBOARD");
          ((InputMethodManager)this.cordova.getActivity().getSystemService("input_method")).hideSoftInputFromWindow(this.cordova.getActivity().getCurrentFocus().getWindowToken(), 0);
          paramCallbackContext.success();
          continue;
          Log.i("NativeUtilPlugin", "ACTION_PREF_GET_STARTED_DONE");
          this.mPluginResult = new PluginResult(PluginResult.Status.OK, this.mSharePreference.getGetStartedNeeded());
          this.mPluginResult.setKeepCallback(false);
          paramCallbackContext.sendPluginResult(this.mPluginResult);
          Log.i("NativeUtilPlugin", "ACTION_PREF_SET_GET_STARTED_NEEDED");
          this.mSharePreference.setGetStartedNeeded(paramJSONArray.getBoolean(0));
          paramCallbackContext.success();
          continue;
          this.mPluginResult = new PluginResult(PluginResult.Status.OK, isCurrNtwDiffFromSetup());
          this.mPluginResult.setKeepCallback(false);
          paramCallbackContext.sendPluginResult(this.mPluginResult);
          paramCallbackContext.success();
          continue;
          Log.i("NativeUtilPlugin", "ACTION_GET_REUNION_KEY Start");
          paramCallbackContext.success(new MoreUtil().getReUnionKey(this.mSharePreference));
          continue;
          Log.i("NativeUtilPlugin", "ACTION_GET_LED_IMAGE_FROM_DB");
          paramCallbackContext.success(this.mNativeUtil.getLedBase64Image(paramJSONArray.getString(0).toString()));
          continue;
          Log.i("NativeUtilPlugin", "ACTION_INSERT_LED_IMAGE_TO_DB");
          paramCallbackContext.success(this.mNativeUtil.setLedDeviceImage(paramJSONArray.getString(0).toString(), paramJSONArray.getString(1).toString(), paramJSONArray.getString(2).toString()));
          continue;
          Log.i("NativeUtilPlugin", "ACTION_RESET_LED_IMAGE_TO_DB");
          paramCallbackContext.success(this.mNativeUtil.resetLedDeviceImage(paramJSONArray.getString(0).toString()));
          continue;
          Log.i("NativeUtilPlugin", "ACTION_GET_USER_PREF_TIME_FORMAT");
          this.mPluginResult = new PluginResult(PluginResult.Status.OK, DateFormat.is24HourFormat(this.mContext));
          this.mPluginResult.setKeepCallback(false);
          paramCallbackContext.sendPluginResult(this.mPluginResult);
          paramCallbackContext.success();
          continue;
          String str6 = this.mSharePreference.getEmailIds();
          paramCallbackContext.success(str6);
          Log.i("NativeUtilPlugin", "ACTION_GET_EMAIL- emailSubscription: " + str6);
          continue;
          Log.i("NativeUtilPlugin", "ACTION_SET_EMAIL_ADDRESS inParamArray: " + paramJSONArray.getString(0));
          if (this.mSharePreference.storeEmailIds(paramJSONArray.getString(0))) {}
          for (String str5 = "true";; str5 = "false")
          {
            paramCallbackContext.success(str5);
            break;
          }
          if (this.mSharePreference.deleteEmailIds(paramJSONArray.getInt(0))) {}
          for (String str4 = "true";; str4 = "false")
          {
            paramCallbackContext.success(str4);
            break;
          }
          Log.i("NativeUtilPlugin", "ACTION_SET_BRIDGE_DATA");
          this.mSharePreference.saveBridgeSetup(paramJSONArray.get(0).toString());
          paramCallbackContext.success();
          continue;
          Log.i("NativeUtilPlugin", "ACTION_GET_BRIDGE_DATA");
          paramCallbackContext.success(this.mSharePreference.getbridgeValues());
          continue;
          Log.i("NativeUtilPlugin", "ACTION_IAB_WEMOHEADERHEIGHT" + paramJSONArray.getInt(0));
          this.mSharePreference.setAppHeaderHeight(paramJSONArray.getInt(0));
          continue;
          Log.i("NativeUtilPlugin", "ACTION_GET_STORED_LEGACY_EMAILID inParamArray: " + paramJSONArray.toString());
          this.mSharePreference.getStoredLegacyEmails();
        }
      }
    }
    Log.i("NativeUtilPlugin", "ACTION_SET_EMAIL_DEVICE_TYPE inParamArray: " + paramJSONArray.toString() + " : " + paramJSONArray.get(0));
    JSONObject localJSONObject = new JSONObject(paramJSONArray.get(0).toString());
    String str1 = localJSONObject.optString("deviceType").toString();
    Log.i("NativeUtilPlugin", "deviceType: " + str1);
    String str2 = this.mSharePreference.getEmailOptDeviceType();
    Log.i("NativeUtilPlugin", "emailOptDeviceType: " + str2);
    if (str2.equals("")) {}
    for (String str3 = str1;; str3 = str2 + "," + str1)
    {
      Log.i("NativeUtilPlugin", "OptDeviceType: " + str3);
      this.mSharePreference.storeEmailOptDeviceType(str3);
      break;
    }
  }
  
  public void hideKeyBoard()
  {
    try
    {
      Log.i("NativeUtilPlugin", "hideKeyBoard");
      InputMethodManager localInputMethodManager = (InputMethodManager)this.cordova.getActivity().getSystemService("input_method");
      if (localInputMethodManager.isAcceptingText()) {
        localInputMethodManager.hideSoftInputFromWindow(this.cordova.getActivity().getCurrentFocus().getWindowToken(), 0);
      }
      return;
    }
    finally
    {
      localObject = finally;
      throw ((Throwable)localObject);
    }
  }
  
  public void hideProgressDialog()
  {
    try
    {
      Log.i("NativeUtilPlugin", "hideProgressDialog: ");
      try
      {
        if (MainActivity.mRuleProgressDialog != null) {
          MainActivity.mRuleProgressDialog.dismiss();
        }
        if (MainActivity.mProgressDialog != null) {
          MainActivity.mProgressDialog.dismiss();
        }
      }
      catch (Exception localException)
      {
        for (;;)
        {
          Log.i("NativeUtilPlugin", "hideProgressDialog: " + localException);
        }
      }
      return;
    }
    finally {}
  }
  
  /* Error */
  public void hideSpinner()
  {
    // Byte code:
    //   0: aload_0
    //   1: monitorenter
    //   2: ldc 8
    //   4: ldc_w 724
    //   7: invokestatic 125	android/util/Log:i	(Ljava/lang/String;Ljava/lang/String;)I
    //   10: pop
    //   11: ldc 8
    //   13: new 105	java/lang/StringBuilder
    //   16: dup
    //   17: invokespecial 106	java/lang/StringBuilder:<init>	()V
    //   20: ldc_w 726
    //   23: invokevirtual 112	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   26: getstatic 413	com/belkin/activity/MainActivity:mProgressDialog	Landroid/app/Dialog;
    //   29: invokevirtual 338	java/lang/StringBuilder:append	(Ljava/lang/Object;)Ljava/lang/StringBuilder;
    //   32: invokevirtual 119	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   35: invokestatic 125	android/util/Log:i	(Ljava/lang/String;Ljava/lang/String;)I
    //   38: pop
    //   39: getstatic 413	com/belkin/activity/MainActivity:mProgressDialog	Landroid/app/Dialog;
    //   42: ifnull +9 -> 51
    //   45: getstatic 413	com/belkin/activity/MainActivity:mProgressDialog	Landroid/app/Dialog;
    //   48: invokevirtual 722	android/app/Dialog:dismiss	()V
    //   51: aload_0
    //   52: monitorexit
    //   53: return
    //   54: astore 4
    //   56: ldc 8
    //   58: new 105	java/lang/StringBuilder
    //   61: dup
    //   62: invokespecial 106	java/lang/StringBuilder:<init>	()V
    //   65: ldc_w 728
    //   68: invokevirtual 112	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   71: aload 4
    //   73: invokevirtual 338	java/lang/StringBuilder:append	(Ljava/lang/Object;)Ljava/lang/StringBuilder;
    //   76: invokevirtual 119	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   79: invokestatic 125	android/util/Log:i	(Ljava/lang/String;Ljava/lang/String;)I
    //   82: pop
    //   83: goto -32 -> 51
    //   86: astore_1
    //   87: aload_0
    //   88: monitorexit
    //   89: aload_1
    //   90: athrow
    // Local variable table:
    //   start	length	slot	name	signature
    //   0	91	0	this	NativeUtilPlugin
    //   86	4	1	localObject	Object
    //   54	18	4	localException	Exception
    // Exception table:
    //   from	to	target	type
    //   39	51	54	java/lang/Exception
    //   2	39	86	finally
    //   39	51	86	finally
    //   56	83	86	finally
  }
  
  public void initialize(CordovaInterface paramCordovaInterface, CordovaWebView paramCordovaWebView)
  {
    super.initialize(paramCordovaInterface, paramCordovaWebView);
    this.mContext = paramCordovaInterface.getActivity();
    this.mNetworkUtil = new SDKNetworkUtils(this.mContext);
    this.mSharePreference = new SharePreferences(this.mContext);
    this.mWiFiSecurityUtil = new WiFiSecurityUtil();
    this.mMoreUtil = new MoreUtil();
    this.mNativeUtil = new NativeUtil(this.mContext);
    this.ruleUtility = new RuleUtility(this.mContext);
    sDeviceListManager = DeviceListManager.getInstance(this.mContext);
  }
  
  public boolean isCurrNtwDiffFromSetup()
  {
    Log.i("NativeUtilPlugin", "isCurrNtwDiffFromSetup");
    String str1 = new SDKNetworkUtils(this.mContext).getSSID();
    String str2 = this.mSharePreference.getSetupCredential();
    if (str2 == null) {
      Log.i("NativeUtilPlugin", "isCurrNtwDiffFromSetup savedConfig is null");
    }
    String[] arrayOfString;
    do
    {
      return true;
      arrayOfString = str2.split("\\|");
      Log.i("NativeUtilPlugin", "isCurrNtwDiffFromSetup currentSSID: " + str1 + " saved: " + arrayOfString[0]);
    } while (!str1.equalsIgnoreCase(arrayOfString[0]));
    return false;
  }
  
  public void showProgressDialog(final String paramString1, final String paramString2)
  {
    try
    {
      Log.i("NativeUtilPlugin", "showProgressDialog: ");
      if ((MainActivity.mProgressDialog != null) && (MainActivity.mProgressDialog.isShowing())) {
        MainActivity.mProgressDialog.dismiss();
      }
      Runnable local7 = new Runnable()
      {
        public void run()
        {
          MainActivity.mProgressDialog = new Dialog(NativeUtilPlugin.this.mContext);
          if ((paramString1.equalsIgnoreCase("")) || (paramString1 == null)) {
            MainActivity.mProgressDialog.requestWindowFeature(1);
          }
          for (;;)
          {
            MainActivity.mProgressDialog.setContentView(2130903042);
            ((TextView)MainActivity.mProgressDialog.findViewById(2131296264)).setText(paramString2);
            MainActivity.mProgressDialog.setCancelable(false);
            try
            {
              MainActivity.mProgressDialog.show();
              return;
            }
            catch (Exception localException)
            {
              System.out.println("Exception: " + localException);
            }
            MainActivity.mProgressDialog.setTitle(paramString1);
          }
        }
      };
      this.cordova.getActivity().runOnUiThread(local7);
      return;
    }
    finally {}
  }
  
  public void showSpinner(String paramString1, String paramString2)
  {
    try
    {
      Log.i("NativeUtilPlugin", "showSpinner: ");
      if ((MainActivity.mProgressDialog != null) && (MainActivity.mProgressDialog.isShowing())) {
        MainActivity.mProgressDialog.dismiss();
      }
      Runnable local5 = new Runnable()
      {
        public void run()
        {
          NativeUtilPlugin.this.hideKeyBoard();
          ProgressBar localProgressBar = new ProgressBar(NativeUtilPlugin.this.mContext);
          localProgressBar.setLayoutParams(new ViewGroup.LayoutParams(-2, -2));
          MainActivity.mProgressDialog = new Dialog(NativeUtilPlugin.this.mContext);
          Log.i("NativeUtilPlugin", "mProgressDialog: " + MainActivity.mProgressDialog);
          MainActivity.mProgressDialog.requestWindowFeature(1);
          MainActivity.mProgressDialog.getWindow().clearFlags(2);
          MainActivity.mProgressDialog.setContentView(localProgressBar);
          MainActivity.mProgressDialog.setCancelable(false);
          MainActivity.mProgressDialog.getWindow().setBackgroundDrawableResource(17170445);
          try
          {
            MainActivity.mProgressDialog.show();
            return;
          }
          catch (Exception localException)
          {
            System.out.println("Exception: " + localException);
          }
        }
      };
      this.cordova.getActivity().runOnUiThread(local5);
      return;
    }
    finally {}
  }
  
  public void showSpinnerNew()
  {
    Log.i("NativeUtilPlugin", "showSpinner: ");
    if (MainActivity.mProgressDialog.isShowing()) {
      MainActivity.mProgressDialog.dismiss();
    }
    ProgressBar localProgressBar = new ProgressBar(this.mContext);
    localProgressBar.setLayoutParams(new ViewGroup.LayoutParams(-2, -2));
    MainActivity.mProgressDialog = new Dialog(this.mContext);
    Log.i("NativeUtilPlugin", "mProgressDialog: " + MainActivity.mProgressDialog);
    MainActivity.mProgressDialog.requestWindowFeature(1);
    MainActivity.mProgressDialog.getWindow().clearFlags(2);
    MainActivity.mProgressDialog.setContentView(localProgressBar);
    MainActivity.mProgressDialog.setCancelable(true);
    MainActivity.mProgressDialog.getWindow().setBackgroundDrawableResource(17170445);
    Runnable local4 = new Runnable()
    {
      public void run()
      {
        try
        {
          MainActivity.mProgressDialog.show();
          return;
        }
        catch (Exception localException)
        {
          System.out.println("Exception: " + localException);
        }
      }
    };
    this.cordova.getActivity().runOnUiThread(local4);
  }
  
  public void showSplash()
  {
    try
    {
      Log.i("NativeUtilPlugin", "showSplash: ");
      if ((MainActivity.mProgressDialog != null) && (MainActivity.mProgressDialog.isShowing())) {
        MainActivity.mProgressDialog.dismiss();
      }
      Runnable local6 = new Runnable()
      {
        public void run()
        {
          MainActivity.mProgressDialog = new Dialog(NativeUtilPlugin.this.mContext);
          MainActivity.mProgressDialog.requestWindowFeature(1);
          MainActivity.mProgressDialog.setContentView(2130903044);
          MainActivity.mProgressDialog.setCancelable(false);
          try
          {
            MainActivity.mProgressDialog.show();
            return;
          }
          catch (Exception localException)
          {
            System.out.println("Exception: " + localException);
          }
        }
      };
      this.cordova.getActivity().runOnUiThread(local6);
      return;
    }
    finally {}
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/belkin/cordova/plugin/NativeUtilPlugin.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */