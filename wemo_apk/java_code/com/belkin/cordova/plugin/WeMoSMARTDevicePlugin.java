package com.belkin.cordova.plugin;

import android.app.Activity;
import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.content.IntentFilter;
import com.belkin.cloud.CloudServices;
import com.belkin.cybergarage.wrapper.UpnpDeviceList;
import com.belkin.upnp.parser.GenericGetAttributeResponseParser;
import com.belkin.utils.LogUtils;
import com.belkin.utils.WiFiSecurityUtil;
import com.belkin.wemo.cache.devicelist.JSONConstants;
import com.belkin.wemo.cache.utils.NetworkMode;
import com.belkin.wemo.cache.utils.SDKNetworkUtils;
import com.belkin.wemo.cache.utils.SharePreferences;
import com.belkin.wemo.localsdk.WeMoDevice;
import com.belkin.wemo.localsdk.WeMoSDKContext;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
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

public class WeMoSMARTDevicePlugin
  extends CordovaPlugin
{
  public static final String ACTION_CALL_ACTION = "callAction";
  public static final String ACTION_CALL_ACTION_REMOTE = "callActionRemote";
  public static final String ACTION_FETCH_RULES = "fetchRules";
  public static final String ACTION_GET_ALL_DEVICES = "getAllDevices";
  public static final String ACTION_GET_AUTHORIZATION_CODE = "getAuthorizationCode";
  public static final String ACTION_GET_BLOB_STORAGE = "GetBlobStorage";
  public static final String ACTION_GET_DEVICE = "getDevice";
  public static final String ACTION_SET_BLOB_STORAGE = "SetBlobStorage";
  public static final String ACTION_SUBSCRIBE_DEVICE_CHANGE = "subscribeDeviceChange";
  public static final String ACTION_UNSUBSCRIBE_DEVICE_CHANGE = "unsubscribeDeviceChange";
  public static final String ACTION_UPDATE_RULE = "updateRule";
  public static final String DEFAULT_ERROR = "Unexpected error";
  public static final String GET_RETAILER_DETAILS = "GetRetailerDetails";
  public static final String GET_RULES = "GetRules";
  public static final String GET_TEMPLATES = "GetTemplates";
  public static final String INVALID_UDN = "Invalid UDN";
  public static final String MISSING_PARAMETERS = "Missing parameters";
  public static final String SET_RULES = "SetRules";
  public static final String SET_TEMPLATES = "SetTemplates";
  private static final String TAG = "WeMoSMARTDevicePlugin";
  public static WeMoSDKContext mWeMoSDKContext = null;
  private AuthCodeGenerator mAuthCodeGenerator = null;
  private Context mContext;
  private DeviceChangeReceiver mDeviceChangeReceiver = null;
  private SDKNetworkUtils mNetworkUtil;
  private SharePreferences mSharePreference;
  private UpnpDeviceList mUpnpDeviceList;
  private WiFiSecurityUtil mWiFiSecurityUtil;
  private boolean registered = false;
  
  private boolean callAction(final JSONArray paramJSONArray, final CallbackContext paramCallbackContext)
  {
    if ((this.mSharePreference.isRemoteEnabled()) && (!this.mNetworkUtil.isHomeNetwork())) {
      callActionRemote(paramJSONArray, paramCallbackContext);
    }
    for (;;)
    {
      return true;
      this.cordova.getThreadPool().execute(new Runnable()
      {
        public void run()
        {
          String str1 = null;
          JSONObject localJSONObject1 = null;
          for (;;)
          {
            try
            {
              int i = paramJSONArray.length();
              localJSONObject1 = null;
              if (i < 4) {
                continue;
              }
              String str3 = paramJSONArray.getString(0);
              localJSONObject1 = null;
              if (str3 == null) {
                break label539;
              }
              int j = str3.length();
              localJSONObject1 = null;
              if (j <= 0) {
                break label539;
              }
              String str4 = paramJSONArray.getString(1);
              str5 = paramJSONArray.getString(2);
              localJSONObject1 = null;
              if (str5 == null) {
                break label528;
              }
              int k = str5.length();
              localJSONObject1 = null;
              if (k <= 0) {
                break label528;
              }
              JSONObject localJSONObject2 = paramJSONArray.getJSONObject(3).getJSONObject("data");
              boolean bool1 = str5.equals("SetAttributes");
              localJSONObject1 = null;
              if (bool1)
              {
                String str6 = WeMoSMARTDevicePlugin.this.createAttributeList(localJSONObject2, str3);
                localJSONObject2 = new JSONObject().put("attributeList", str6);
              }
              boolean bool2 = str5.equals("SetBlobStorage");
              localJSONObject1 = null;
              if (bool2)
              {
                String str7 = WeMoSMARTDevicePlugin.this.createArgumentList(localJSONObject2);
                localJSONObject2 = new JSONObject().put("attributeList", str7);
              }
              boolean bool3 = str5.equals("GetBlobStorage");
              localJSONObject1 = null;
              if (bool3)
              {
                String str8 = WeMoSMARTDevicePlugin.this.createArgumentList(localJSONObject2);
                localJSONObject2 = new JSONObject().put("attributeList", str8);
              }
              localJSONObject1 = WeMoSMARTDevicePlugin.this.mUpnpDeviceList.callAction(str3, str4, str5, localJSONObject2);
              if (localJSONObject1 != null) {
                continue;
              }
              String str9 = "No action (" + str5 + ") response UDN: " + str3;
              str2 = str9;
            }
            catch (Exception localException)
            {
              try
              {
                String str5;
                StringBuilder localStringBuilder;
                LogUtils.errorLog("WeMoSMARTDevicePlugin", "Call action error: " + str2 + "UDN: " + paramJSONArray.getString(0));
                paramCallbackContext.error(str2);
                return;
                if (str5.equals("GetAttributes"))
                {
                  localJSONObject1 = new GenericGetAttributeResponseParser().parseGetAttributeResponse(localJSONObject1.getString("attributeList"));
                  str2 = null;
                  str1 = null;
                  continue;
                }
                if (!str5.equals("GetRules"))
                {
                  boolean bool4 = str5.equals("SetRules");
                  str2 = null;
                  str1 = null;
                  if (!bool4) {
                    continue;
                  }
                }
                str1 = localJSONObject1.getString("ruleList");
                str2 = null;
                continue;
                str2 = "Missing parameters";
                localJSONObject1 = null;
                str1 = null;
                continue;
                localException = localException;
                str2 = localException.toString();
                str1 = null;
                continue;
                Object localObject = str1;
              }
              catch (JSONException localJSONException)
              {
                localJSONException.printStackTrace();
                continue;
              }
              if (str1 != null) {
                continue;
              }
              paramCallbackContext.success(localJSONObject1);
              return;
              paramCallbackContext.success(str1);
              return;
            }
            localStringBuilder = new StringBuilder().append("output msg: ");
            if (str1 == null)
            {
              localObject = localJSONObject1;
              LogUtils.infoLog("WeMoSMARTDevicePlugin", localObject);
              if (str2 == null) {
                continue;
              }
            }
            label528:
            String str2 = "Invalid action";
            localJSONObject1 = null;
            str1 = null;
            continue;
            label539:
            str2 = "Invalid UDN";
            localJSONObject1 = null;
            str1 = null;
          }
        }
      });
    }
  }
  
  private boolean callActionRemote(final JSONArray paramJSONArray, final CallbackContext paramCallbackContext)
  {
    this.cordova.getThreadPool().execute(new Runnable()
    {
      public void run()
      {
        try
        {
          String str3 = paramJSONArray.getString(0);
          localJSONObject = paramJSONArray.getJSONObject(3);
          str4 = paramJSONArray.getString(2);
          str5 = localJSONObject.getString("macAddress");
          str1 = null;
          str2 = null;
          if (str3 != null)
          {
            int i = str3.length();
            str1 = null;
            str2 = null;
            if (i > 0)
            {
              str6 = WeMoSMARTDevicePlugin.this.mWiFiSecurityUtil.generateAuthCode(WeMoSMARTDevicePlugin.this.mContext);
              localCloudServices = CloudServices.getInstance(WeMoSMARTDevicePlugin.this.mContext);
              if (!str4.equals("GetRetailerDetails")) {
                break label230;
              }
              String str8 = localJSONObject.getJSONObject("data").getString("deviceDetails");
              LogUtils.infoLog("xml data received to be sent via request", "xml : " + str8);
              str2 = localCloudServices.getSerializationTracking(str8, str6, "", str5, "");
              str1 = null;
              if (str2 == null) {
                str1 = "No action response";
              }
            }
          }
        }
        catch (JSONException localJSONException)
        {
          String str2;
          for (;;)
          {
            JSONObject localJSONObject;
            String str4;
            String str5;
            String str6;
            CloudServices localCloudServices;
            label230:
            Object localObject;
            String str1 = localJSONException.toString();
            str2 = null;
          }
          paramCallbackContext.success(str2);
        }
        LogUtils.infoLog("WeMoSMARTDevicePlugin", "output msg: " + str2);
        if (str1 != null)
        {
          LogUtils.errorLog("WeMoSMARTDevicePlugin", "Call action error: " + str1);
          paramCallbackContext.error(str1);
          return;
          if ((str4.equals("SetTemplates")) || (str4.equals("GetTemplates"))) {
            localObject = localJSONObject.getJSONObject("data").getString("templateList");
          }
          for (;;)
          {
            str2 = localCloudServices.sendRequest((String)localObject, str6, "", str5);
            break;
            if ((str4.equals("SetRules")) || (str4.equals("GetRules")))
            {
              localObject = localJSONObject.getJSONObject("data").getString("ruleList");
            }
            else
            {
              String str7 = localJSONObject.getString("data");
              localObject = str7;
            }
          }
        }
      }
    });
    return true;
  }
  
  private String createArgumentList(JSONObject paramJSONObject)
    throws JSONException
  {
    StringBuffer localStringBuffer = new StringBuffer();
    Iterator localIterator = paramJSONObject.keys();
    while (localIterator.hasNext())
    {
      String str = (String)localIterator.next();
      localStringBuffer.append("<attribute>");
      localStringBuffer.append("<name>");
      localStringBuffer.append(str);
      localStringBuffer.append("</name>");
      localStringBuffer.append("<value>");
      localStringBuffer.append(paramJSONObject.optString(str));
      localStringBuffer.append("</value>");
      localStringBuffer.append("</attribute>");
    }
    LogUtils.infoLog("createArgumentList", "str.toString():::::::;" + localStringBuffer.toString());
    return localStringBuffer.toString();
  }
  
  private String createAttributeList(JSONObject paramJSONObject, String paramString)
    throws JSONException
  {
    JSONObject localJSONObject = new JSONObject(this.mUpnpDeviceList.getDevice(paramString).getString("attributeList"));
    StringBuffer localStringBuffer = new StringBuffer();
    Iterator localIterator1 = localJSONObject.keys();
    while (localIterator1.hasNext())
    {
      String str1 = "NULL";
      String str2 = (String)localIterator1.next();
      Iterator localIterator2 = paramJSONObject.keys();
      while (localIterator2.hasNext()) {
        if (((String)localIterator2.next()).equals(str2)) {
          str1 = paramJSONObject.optString(str2);
        }
      }
      localStringBuffer.append("<attribute>");
      localStringBuffer.append("<name>");
      localStringBuffer.append(str2);
      localStringBuffer.append("</name>");
      localStringBuffer.append("<value>");
      localStringBuffer.append(str1);
      localStringBuffer.append("</value>");
      localStringBuffer.append("</attribute>");
    }
    LogUtils.infoLog("setAttriuteState", "str.toString():::::::;" + localStringBuffer.toString());
    return localStringBuffer.toString();
  }
  
  private boolean fetchRules(JSONArray paramJSONArray, CallbackContext paramCallbackContext)
  {
    String str = null;
    try
    {
      if (paramJSONArray.length() >= 1) {
        paramJSONArray.getString(0);
      }
      while (str != null)
      {
        paramCallbackContext.error(str);
        return true;
        str = "Missing parameters";
      }
    }
    catch (Exception localException)
    {
      for (;;)
      {
        str = localException.toString();
      }
      paramCallbackContext.success();
    }
    return true;
  }
  
  private boolean getAllDevices(JSONArray paramJSONArray, final CallbackContext paramCallbackContext)
  {
    this.cordova.getThreadPool().execute(new Runnable()
    {
      public void run()
      {
        for (;;)
        {
          try
          {
            JSONObject localJSONObject = WeMoSMARTDevicePlugin.this.mUpnpDeviceList.getWeMoDeviceList();
            if (localJSONObject == null) {
              continue;
            }
            localJSONArray2 = new JSONArray();
            try
            {
              Iterator localIterator = localJSONObject.keys();
              if (!localIterator.hasNext()) {
                continue;
              }
              localJSONArray2.put(localJSONObject.getJSONObject((String)localIterator.next()));
              continue;
              str = localException1.toString();
            }
            catch (Exception localException1)
            {
              localJSONArray1 = localJSONArray2;
            }
          }
          catch (Exception localException2)
          {
            JSONArray localJSONArray2;
            String str;
            JSONArray localJSONArray1 = null;
            continue;
          }
          if (str == null) {
            continue;
          }
          LogUtils.errorLog("WeMoSMARTDevicePlugin", "Get all devices error: " + str);
          paramCallbackContext.error(str);
          return;
          localJSONArray1 = localJSONArray2;
          str = null;
          continue;
          str = "Unexpected error";
          localJSONArray1 = null;
        }
        paramCallbackContext.success(localJSONArray1);
      }
    });
    return true;
  }
  
  private boolean getAuthorizationCode(JSONArray paramJSONArray, CallbackContext paramCallbackContext)
  {
    try
    {
      if (this.mAuthCodeGenerator == null) {
        this.mAuthCodeGenerator = new AuthCodeGenerator(this.cordova.getActivity());
      }
      str2 = this.mAuthCodeGenerator.getCode();
      str1 = null;
      if (str2 == null) {
        str1 = "No code generated";
      }
    }
    catch (Exception localException)
    {
      for (;;)
      {
        String str1 = localException.toString();
        String str2 = null;
        continue;
        paramCallbackContext.success(str2);
      }
    }
    if (str1 != null)
    {
      paramCallbackContext.error(str1);
      return true;
    }
  }
  
  private boolean getDevice(final JSONArray paramJSONArray, final CallbackContext paramCallbackContext)
  {
    if (!NetworkMode.isLocal()) {
      return true;
    }
    this.cordova.getThreadPool().execute(new Runnable()
    {
      public void run()
      {
        JSONObject localJSONObject = null;
        WeMoSMARTDevicePlugin.access$102(WeMoSMARTDevicePlugin.this, UpnpDeviceList.getInstance(WeMoSMARTDevicePlugin.this.mContext));
        for (;;)
        {
          try
          {
            JSONArray localJSONArray = paramJSONArray;
            localJSONObject = null;
            if (localJSONArray == null) {
              continue;
            }
            int i = paramJSONArray.length();
            localJSONObject = null;
            if (i < 1) {
              continue;
            }
            String str1 = paramJSONArray.getString(0);
            localJSONObject = null;
            if (str1 == null) {
              continue;
            }
            int j = str1.length();
            localJSONObject = null;
            if (j <= 0) {
              continue;
            }
            localJSONObject = WeMoSMARTDevicePlugin.this.mUpnpDeviceList.getDevice(str1);
            localObject = null;
            if (localJSONObject == null)
            {
              String str2 = "Device not found " + str1;
              localObject = str2;
            }
          }
          catch (Exception localException)
          {
            Object localObject = localException.toString();
            continue;
            paramCallbackContext.success(localJSONObject);
          }
          if (localObject == null) {
            continue;
          }
          LogUtils.errorLog("WeMoSMARTDevicePlugin", "Get device error: " + (String)localObject);
          paramCallbackContext.error((String)localObject);
          return;
          localObject = "Invalid UDN";
          localJSONObject = null;
          continue;
          localObject = "Missing parameters";
          localJSONObject = null;
        }
      }
    });
    return true;
  }
  
  private WeMoDevice getWemoDevice(String paramString)
  {
    WeMoSDKContext localWeMoSDKContext = mWeMoSDKContext;
    WeMoDevice localWeMoDevice = null;
    if (localWeMoSDKContext != null) {
      localWeMoDevice = mWeMoSDKContext.getWeMoDeviceByUDN(paramString);
    }
    return localWeMoDevice;
  }
  
  /* Error */
  private boolean subscribeDeviceChange(JSONArray paramJSONArray, CallbackContext paramCallbackContext)
  {
    // Byte code:
    //   0: aconst_null
    //   1: astore_3
    //   2: aconst_null
    //   3: astore 4
    //   5: aload_1
    //   6: invokevirtual 263	org/json/JSONArray:length	()I
    //   9: iconst_1
    //   10: if_icmplt +99 -> 109
    //   13: aload_1
    //   14: iconst_0
    //   15: invokevirtual 266	org/json/JSONArray:getString	(I)Ljava/lang/String;
    //   18: astore 6
    //   20: aload 6
    //   22: ifnull +78 -> 100
    //   25: aload 6
    //   27: invokevirtual 310	java/lang/String:length	()I
    //   30: ifle +70 -> 100
    //   33: aload_0
    //   34: getfield 92	com/belkin/cordova/plugin/WeMoSMARTDevicePlugin:mDeviceChangeReceiver	Lcom/belkin/cordova/plugin/WeMoSMARTDevicePlugin$DeviceChangeReceiver;
    //   37: ifnonnull +15 -> 52
    //   40: aload_0
    //   41: new 312	com/belkin/cordova/plugin/WeMoSMARTDevicePlugin$DeviceChangeReceiver
    //   44: dup
    //   45: aload_0
    //   46: invokespecial 315	com/belkin/cordova/plugin/WeMoSMARTDevicePlugin$DeviceChangeReceiver:<init>	(Lcom/belkin/cordova/plugin/WeMoSMARTDevicePlugin;)V
    //   49: putfield 92	com/belkin/cordova/plugin/WeMoSMARTDevicePlugin:mDeviceChangeReceiver	Lcom/belkin/cordova/plugin/WeMoSMARTDevicePlugin$DeviceChangeReceiver;
    //   52: aload_0
    //   53: getfield 92	com/belkin/cordova/plugin/WeMoSMARTDevicePlugin:mDeviceChangeReceiver	Lcom/belkin/cordova/plugin/WeMoSMARTDevicePlugin$DeviceChangeReceiver;
    //   56: aload 6
    //   58: aload_2
    //   59: invokevirtual 319	com/belkin/cordova/plugin/WeMoSMARTDevicePlugin$DeviceChangeReceiver:addDevice	(Ljava/lang/String;Lorg/apache/cordova/CallbackContext;)V
    //   62: new 321	org/apache/cordova/PluginResult
    //   65: dup
    //   66: getstatic 327	org/apache/cordova/PluginResult$Status:OK	Lorg/apache/cordova/PluginResult$Status;
    //   69: invokespecial 330	org/apache/cordova/PluginResult:<init>	(Lorg/apache/cordova/PluginResult$Status;)V
    //   72: astore 7
    //   74: aload 7
    //   76: iconst_1
    //   77: invokevirtual 334	org/apache/cordova/PluginResult:setKeepCallback	(Z)V
    //   80: aload 7
    //   82: astore 4
    //   84: aload_3
    //   85: ifnonnull +8 -> 93
    //   88: aload 4
    //   90: ifnonnull +39 -> 129
    //   93: aload_2
    //   94: aload_3
    //   95: invokevirtual 271	org/apache/cordova/CallbackContext:error	(Ljava/lang/String;)V
    //   98: iconst_1
    //   99: ireturn
    //   100: ldc 53
    //   102: astore_3
    //   103: aconst_null
    //   104: astore 4
    //   106: goto -22 -> 84
    //   109: ldc 56
    //   111: astore_3
    //   112: aconst_null
    //   113: astore 4
    //   115: goto -31 -> 84
    //   118: astore 5
    //   120: aload 5
    //   122: invokevirtual 272	java/lang/Exception:toString	()Ljava/lang/String;
    //   125: astore_3
    //   126: goto -42 -> 84
    //   129: aload_2
    //   130: aload 4
    //   132: invokevirtual 338	org/apache/cordova/CallbackContext:sendPluginResult	(Lorg/apache/cordova/PluginResult;)V
    //   135: iconst_1
    //   136: ireturn
    //   137: astore 5
    //   139: aload 7
    //   141: astore 4
    //   143: goto -23 -> 120
    // Local variable table:
    //   start	length	slot	name	signature
    //   0	146	0	this	WeMoSMARTDevicePlugin
    //   0	146	1	paramJSONArray	JSONArray
    //   0	146	2	paramCallbackContext	CallbackContext
    //   1	125	3	str1	String
    //   3	139	4	localObject	Object
    //   118	3	5	localException1	Exception
    //   137	1	5	localException2	Exception
    //   18	39	6	str2	String
    //   72	68	7	localPluginResult	PluginResult
    // Exception table:
    //   from	to	target	type
    //   5	20	118	java/lang/Exception
    //   25	52	118	java/lang/Exception
    //   52	74	118	java/lang/Exception
    //   74	80	137	java/lang/Exception
  }
  
  private boolean unsubscribeDeviceChange(JSONArray paramJSONArray, CallbackContext paramCallbackContext)
  {
    String str1 = null;
    for (;;)
    {
      try
      {
        if (paramJSONArray.length() < 1) {
          continue;
        }
        String str2 = paramJSONArray.getString(0);
        if ((str2 == null) || (str2.length() <= 0)) {
          continue;
        }
        this.mDeviceChangeReceiver.removeDevice(str2);
      }
      catch (Exception localException)
      {
        str1 = localException.toString();
        continue;
        paramCallbackContext.success();
      }
      if (str1 == null) {
        continue;
      }
      paramCallbackContext.error(str1);
      return true;
      str1 = "Invalid UDN";
      continue;
      str1 = "Missing parameters";
    }
    return true;
  }
  
  private boolean updateRule(JSONArray paramJSONArray, CallbackContext paramCallbackContext)
  {
    String str = null;
    try
    {
      if (paramJSONArray.length() >= 2)
      {
        paramJSONArray.getString(0);
        paramJSONArray.getJSONObject(1);
      }
      while (str != null)
      {
        paramCallbackContext.error(str);
        return true;
        str = "Missing parameters";
      }
    }
    catch (Exception localException)
    {
      for (;;)
      {
        str = localException.toString();
      }
      paramCallbackContext.success();
    }
    return true;
  }
  
  public boolean execute(String paramString, JSONArray paramJSONArray, CallbackContext paramCallbackContext)
    throws JSONException
  {
    LogUtils.infoLog("WeMoSMARTDevicePlugin", "actionID: " + paramString + " args: " + paramJSONArray);
    if ("getDevice".equals(paramString)) {
      return getDevice(paramJSONArray, paramCallbackContext);
    }
    if ("getAllDevices".equals(paramString)) {
      return getAllDevices(paramJSONArray, paramCallbackContext);
    }
    if ("callAction".equals(paramString)) {
      return callAction(paramJSONArray, paramCallbackContext);
    }
    if ("callActionRemote".equals(paramString)) {
      return callActionRemote(paramJSONArray, paramCallbackContext);
    }
    if ("getAuthorizationCode".equals(paramString)) {
      return getAuthorizationCode(paramJSONArray, paramCallbackContext);
    }
    if ("fetchRules".equals(paramString)) {
      return fetchRules(paramJSONArray, paramCallbackContext);
    }
    if ("updateRule".equals(paramString)) {
      return updateRule(paramJSONArray, paramCallbackContext);
    }
    if ("subscribeDeviceChange".equals(paramString)) {
      return subscribeDeviceChange(paramJSONArray, paramCallbackContext);
    }
    if ("unsubscribeDeviceChange".equals(paramString)) {
      return unsubscribeDeviceChange(paramJSONArray, paramCallbackContext);
    }
    if ("GetBlobStorage".equals(paramString)) {
      return callAction(paramJSONArray, paramCallbackContext);
    }
    if ("SetBlobStorage".equals(paramString)) {
      return callAction(paramJSONArray, paramCallbackContext);
    }
    return false;
  }
  
  public void initialize(CordovaInterface paramCordovaInterface, CordovaWebView paramCordovaWebView)
  {
    super.initialize(paramCordovaInterface, paramCordovaWebView);
    this.mContext = paramCordovaInterface.getActivity();
    mWeMoSDKContext = WeMoSDKContext.getInstance(this.mContext);
    this.mUpnpDeviceList = UpnpDeviceList.getInstance(this.mContext);
    this.mWiFiSecurityUtil = new WiFiSecurityUtil();
    this.mSharePreference = new SharePreferences(this.mContext);
    this.mNetworkUtil = new SDKNetworkUtils(this.mContext);
  }
  
  public void onPause(boolean paramBoolean)
  {
    super.onPause(paramBoolean);
    if ((this.mDeviceChangeReceiver != null) && (this.registered)) {}
    try
    {
      this.cordova.getActivity().unregisterReceiver(this.mDeviceChangeReceiver);
      this.registered = false;
      return;
    }
    catch (Exception localException)
    {
      LogUtils.errorLog("WeMoSMARTDevicePlugin", "Error unregistering network receiver: " + localException.getMessage());
    }
  }
  
  public void onResume(boolean paramBoolean)
  {
    super.onResume(paramBoolean);
    if ((this.mDeviceChangeReceiver != null) && (!this.registered)) {}
    try
    {
      this.cordova.getActivity().registerReceiver(this.mDeviceChangeReceiver, this.mDeviceChangeReceiver.intentFilter);
      this.registered = true;
      return;
    }
    catch (Exception localException)
    {
      LogUtils.errorLog("WeMoSMARTDevicePlugin", "Error registering network receiver: " + localException.getMessage());
    }
  }
  
  private class DeviceChangeReceiver
    extends BroadcastReceiver
  {
    private IntentFilter intentFilter = new IntentFilter("com.controller.belkin.hybrid.STATE_CHANGED");
    private Map<String, CallbackContext> mDeviceChangeCallbacks = new HashMap();
    
    public DeviceChangeReceiver()
    {
      WeMoSMARTDevicePlugin.this.cordova.getActivity().registerReceiver(this, this.intentFilter);
      WeMoSMARTDevicePlugin.access$602(WeMoSMARTDevicePlugin.this, true);
    }
    
    public void addDevice(String paramString, CallbackContext paramCallbackContext)
    {
      this.mDeviceChangeCallbacks.put(paramString, paramCallbackContext);
    }
    
    public void finalize()
    {
      try
      {
        WeMoSMARTDevicePlugin.this.cordova.getActivity().unregisterReceiver(this);
        return;
      }
      catch (Exception localException) {}
    }
    
    public void onReceive(Context paramContext, final Intent paramIntent)
    {
      WeMoSMARTDevicePlugin.this.cordova.getThreadPool().execute(new Runnable()
      {
        public void run()
        {
          try
          {
            String str1 = paramIntent.getStringExtra("udn");
            if ((str1 != null) && (WeMoSMARTDevicePlugin.DeviceChangeReceiver.this.mDeviceChangeCallbacks.containsKey(str1)))
            {
              JSONObject localJSONObject1 = WeMoSMARTDevicePlugin.this.mUpnpDeviceList.getDevice(str1);
              if (localJSONObject1 != null)
              {
                localJSONObject1.put("state", paramIntent.getStringExtra("state"));
                localJSONObject1.put(JSONConstants.NOTIFY_TYPE, paramIntent.getStringExtra(JSONConstants.NOTIFY_TYPE));
                String str2 = paramIntent.getStringExtra("attributeList");
                if (str2 == null)
                {
                  JSONObject localJSONObject2 = new JSONObject();
                  WeMoDevice localWeMoDevice = WeMoSMARTDevicePlugin.this.getWemoDevice(str1);
                  if (localWeMoDevice == null)
                  {
                    WeMoSMARTDevicePlugin.mWeMoSDKContext = WeMoSDKContext.getInstance(WeMoSMARTDevicePlugin.this.mContext);
                    localWeMoDevice = WeMoSMARTDevicePlugin.this.getWemoDevice(str1);
                  }
                  localJSONObject2.put(JSONConstants.BINARY_STATE, paramIntent.getStringExtra("state"));
                  localJSONObject2.put("RuleAutoOffTime", localWeMoDevice.getCountdownEndTime());
                  localJSONObject2.put(JSONConstants.INSIGHT_ON_FOR, paramIntent.getStringExtra(JSONConstants.INSIGHT_ON_FOR));
                  localJSONObject2.put(JSONConstants.INSIGHT_TTTON, paramIntent.getStringExtra(JSONConstants.INSIGHT_TTTON));
                  localJSONObject2.put(JSONConstants.INSIGHT_PAST_14_TOTAL_TIME, paramIntent.getStringExtra(JSONConstants.INSIGHT_PAST_14_TOTAL_TIME));
                  localJSONObject2.put(JSONConstants.INSIGHT_HRS_CONNECTED, paramIntent.getStringExtra(JSONConstants.INSIGHT_HRS_CONNECTED));
                  localJSONObject2.put(JSONConstants.INSIGHT_AVG_POWER_ON, paramIntent.getStringExtra(JSONConstants.INSIGHT_AVG_POWER_ON));
                  localJSONObject2.put(JSONConstants.INSIGHT_POWER_NOW, paramIntent.getStringExtra(JSONConstants.INSIGHT_POWER_NOW));
                  localJSONObject2.put(JSONConstants.INSIGHT_TODAY_TOTAL_KWH, paramIntent.getStringExtra(JSONConstants.INSIGHT_TODAY_TOTAL_KWH));
                  localJSONObject2.put(JSONConstants.INSIGHT_PAST_14_DAYS_KWH, paramIntent.getStringExtra(JSONConstants.INSIGHT_PAST_14_DAYS_KWH));
                  localJSONObject2.put(JSONConstants.INSIGHT_POWER_THRESHOLD, paramIntent.getStringExtra(JSONConstants.INSIGHT_POWER_THRESHOLD));
                  localJSONObject1.put("attributeList", localJSONObject2);
                }
                for (;;)
                {
                  LogUtils.infoLog("WeMoSMARTDevicePlugin", "onReceive() wemosmart plugin notifications: " + localJSONObject1);
                  PluginResult localPluginResult = new PluginResult(PluginResult.Status.OK, localJSONObject1);
                  localPluginResult.setKeepCallback(true);
                  ((CallbackContext)WeMoSMARTDevicePlugin.DeviceChangeReceiver.this.mDeviceChangeCallbacks.get(str1)).sendPluginResult(localPluginResult);
                  return;
                  localJSONObject1.put("attributeList", str2);
                }
              }
              LogUtils.errorLog("WeMoSMARTDevicePlugin", "Device change error: Device not found " + str1);
            }
          }
          catch (Exception localException)
          {
            LogUtils.errorLog("WeMoSMARTDevicePlugin", "DeviceChangeReceiver onReceive() exception: " + localException);
            return;
          }
        }
      });
    }
    
    public void removeDevice(String paramString)
    {
      this.mDeviceChangeCallbacks.remove(paramString);
    }
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/belkin/cordova/plugin/WeMoSMARTDevicePlugin.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */