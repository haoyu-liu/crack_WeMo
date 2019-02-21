package com.belkin.cordova.plugin;

import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.content.pm.ApplicationInfo;
import android.net.Uri;
import android.os.AsyncTask;
import android.os.Bundle;
import android.os.Handler;
import android.util.Log;
import com.belkin.cloud.CloudServices;
import com.belkin.controller.AppController;
import com.belkin.cordova.plugin.timertask.OpenNetworkTimerTask;
import com.belkin.cybergarage.wrapper.UpnpDeviceList;
import com.belkin.exception.DatabaseException;
import com.belkin.remoteservice.HttpResponseObject;
import com.belkin.remoteservice.RestfulWebservice;
import com.belkin.rules.utils.WeeklyCalenderStringsHandler.AllDevicesScheduleStringSuccessCallback;
import com.belkin.utils.ExternalAppLaunchUtil;
import com.belkin.utils.LogUtils;
import com.belkin.utils.NetCamUtil;
import com.belkin.utils.RuleUtility;
import com.belkin.utils.UploadFileUtil;
import com.belkin.utils.WiFiSecurityUtil;
import com.belkin.wemo.cache.cloud.listener.OnRequestCompleteListener;
import com.belkin.wemo.cache.data.DeviceInformation;
import com.belkin.wemo.cache.devicelist.DeviceListManager;
import com.belkin.wemo.cache.devicelist.JSONConstants;
import com.belkin.wemo.cache.devicelist.UpnpConstants;
import com.belkin.wemo.cache.utils.SDKNetworkUtils;
import com.belkin.wemo.cache.utils.SharePreferences;
import com.belkin.wemo.localsdk.WeMoSDKContext;
import com.belkin.wemo.localsdk.WeMoSDKContext.NotificationListener;
import com.belkin.wemo.rules.callback.FetchRulesAndSyncErrorCallback;
import com.belkin.wemo.rules.callback.FetchRulesAndSyncSuccessCallback;
import com.belkin.wemo.rules.callback.StoreRulesErrorCallback;
import com.belkin.wemo.rules.callback.StoreRulesSuccessCallback;
import com.belkin.wemo.rules.error.RMRulesError;
import com.belkin.wemo.storage.FileStorage;
import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.Timer;
import java.util.concurrent.CountDownLatch;
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

public class DevicePlugin
  extends CordovaPlugin
  implements WeMoSDKContext.NotificationListener
{
  public static final String STR_FALSE = "false";
  public static final String STR_TRUE = "true";
  public static final String TAG = "DevicePlugin";
  private static boolean isRemoteEnableGoing = false;
  private static BroadcastReceiver mBroadcastReceiver;
  public static Context mContext;
  public static DeviceListManager mDLM;
  private static JSONObject mDummyDevices;
  public static WeMoSDKContext mWeMoSDKContext = null;
  private static CordovaWebView mWebView;
  private ExternalAppLaunchUtil appLaunchUtil;
  private CloudServices cs;
  private CallbackContext deviceCallbackContext = null;
  private JSONArray getDeviceList = new JSONArray();
  private Runnable getDeviceListTask = new Runnable()
  {
    public void run()
    {
      LogUtils.infoLog("DevicePlugin", "leddevices callback update task:" + DevicePlugin.this.getDeviceList);
      DevicePlugin.access$102(DevicePlugin.this, new PluginResult(PluginResult.Status.OK, DevicePlugin.this.getDeviceList));
      DevicePlugin.this.mPluginResult.setKeepCallback(false);
      DevicePlugin.this.deviceCallbackContext.sendPluginResult(DevicePlugin.this.mPluginResult);
      DevicePlugin.this.mHandler.removeCallbacks(DevicePlugin.this.getDeviceListTask);
    }
  };
  private JSONArray getendArray;
  private HttpResponseObject httpResponseObject;
  private AppController mAppController;
  private CallbackContext mCallbackContext = null;
  private JSONArray mCheckParams;
  private Handler mHandler = new Handler();
  private SDKNetworkUtils mNetworkUtil;
  private PluginResult mPluginResult;
  private SharePreferences mSharePreference;
  private int mTimerIndex = 0;
  private UpnpDeviceList mUpnpDeviceList;
  private WiFiSecurityUtil mWiFiSecurityUtil;
  private NetCamUtil netCamUtil;
  RestfulWebservice objHttpConnection;
  private Timer openBridgeNetworkTimer;
  private String[] param;
  private HashMap<String, String[]> weeklyRecordsHashMap;
  
  static
  {
    mDLM = null;
    mDummyDevices = null;
  }
  
  public DevicePlugin()
  {
    mBroadcastReceiver = null;
    this.weeklyRecordsHashMap = new HashMap();
  }
  
  private void checkIfWemoPresentAsync(final JSONArray paramJSONArray)
  {
    new Thread(new Runnable()
    {
      public void run()
      {
        try
        {
          String str1 = paramJSONArray.getString(0).toString();
          LogUtils.infoLog("DevicePlugin", "ACTION_CHECK_WEMO_PRESENT serialNo: " + str1);
          String str2;
          if (DevicePlugin.this.mUpnpDeviceList.checkIfWemoPresent(str1)) {
            str2 = "1";
          }
          for (;;)
          {
            LogUtils.infoLog("DevicePlugin", "checkIfWemoPresentAsync retStatus Code: " + str2);
            DevicePlugin.this.pushCheckWemoIntent(str2);
            return;
            if ("No_Network".equals(DevicePlugin.this.mNetworkUtil.getNetworkType())) {
              str2 = "2";
            } else {
              str2 = "0";
            }
          }
          return;
        }
        catch (JSONException localJSONException)
        {
          localJSONException.printStackTrace();
        }
      }
    }).start();
  }
  
  private void enableRemoteAccessMethod(CallbackContext paramCallbackContext)
  {
    try
    {
      isRemoteEnableGoing = true;
      JSONArray localJSONArray = new JSONArray();
      if (mDLM.setRemoteAccess().getBoolean(0))
      {
        this.mSharePreference.setRemoteAutoEnableNeeded(false);
        localJSONArray.put(true);
        localJSONArray.put(this.mNetworkUtil.getSSID());
        isRemoteEnableGoing = false;
        if (paramCallbackContext != null) {
          paramCallbackContext.sendPluginResult(new PluginResult(PluginResult.Status.OK, localJSONArray));
        }
        for (;;)
        {
          mDLM.nestTokenExistenceCheck();
          mDLM.getNestDevicesFromCloud();
          String str = this.mSharePreference.getEmailOptDeviceType();
          LogUtils.infoLog("DevicePlugin", "deviceType: " + str);
          if (str.equals("")) {
            break;
          }
          LogUtils.infoLog("DevicePlugin", "collectEmailIDToCloud called");
          mDLM.collectEmailIDToCloud();
          return;
          LogUtils.infoLog("DevicePlugin", "enableRemoteAccessMethod null callback");
        }
      }
      return;
    }
    catch (JSONException localJSONException)
    {
      isRemoteEnableGoing = false;
      localJSONException.printStackTrace();
      if (paramCallbackContext != null)
      {
        paramCallbackContext.sendPluginResult(new PluginResult(PluginResult.Status.ERROR, "" + localJSONException));
        return;
        if (0 == 0)
        {
          isRemoteEnableGoing = false;
          if (paramCallbackContext != null)
          {
            paramCallbackContext.sendPluginResult(new PluginResult(PluginResult.Status.ERROR, "DevicePlugin Error"));
            return;
          }
          LogUtils.infoLog("DevicePlugin", "enableRemoteAccessMethod null callback");
        }
      }
      else
      {
        LogUtils.infoLog("DevicePlugin", "enableRemoteAccessMethod null callback");
      }
    }
  }
  
  private void getEndList()
  {
    this.getendArray = new JSONArray();
    this.cordova.getThreadPool().execute(new Runnable()
    {
      public void run()
      {
        Intent localIntent;
        try
        {
          DevicePlugin.access$2002(DevicePlugin.this, DevicePlugin.this.mUpnpDeviceList.parseGetEndDeviceList());
          localIntent = new Intent();
          ArrayList localArrayList = new ArrayList();
          int i = 0;
          for (;;)
          {
            int j = DevicePlugin.this.getendArray.length();
            if (i < j) {
              try
              {
                localArrayList.add(DevicePlugin.this.getendArray.getJSONObject(i).toString());
                i++;
              }
              catch (JSONException localJSONException)
              {
                for (;;)
                {
                  localJSONException.printStackTrace();
                }
              }
            }
          }
          localIntent.putStringArrayListExtra("getLedList", localArrayList);
        }
        catch (Exception localException)
        {
          localException.printStackTrace();
          return;
        }
        localIntent.setAction("com.controller.belkin.hybrid.BRIDGE_DEVICES");
        DevicePlugin.mContext.sendBroadcast(localIntent);
      }
    });
  }
  
  private void getEndList(JSONArray paramJSONArray)
  {
    this.mCheckParams = paramJSONArray;
    this.getendArray = new JSONArray();
    this.cordova.getThreadPool().execute(new Runnable()
    {
      public void run()
      {
        try
        {
          Log.d("DevicePlugin", "params..........." + DevicePlugin.this.mCheckParams.get(0).toString());
          DevicePlugin.access$2002(DevicePlugin.this, DevicePlugin.this.mUpnpDeviceList.parseGetEndDeviceList(DevicePlugin.this.mCheckParams));
          DevicePlugin.this.pushDeviceListIntent(DevicePlugin.this.getendArray);
          return;
        }
        catch (JSONException localJSONException)
        {
          localJSONException.printStackTrace();
        }
      }
    });
  }
  
  private void getEndListStatus(JSONArray paramJSONArray)
  {
    this.mCheckParams = paramJSONArray;
    this.getendArray = new JSONArray();
    new Thread(new Runnable()
    {
      public void run()
      {
        Intent localIntent;
        try
        {
          StringBuffer localStringBuffer = new StringBuffer();
          Log.d("DevicePlugin", "params..........." + DevicePlugin.this.mCheckParams.length() + "--" + DevicePlugin.this.mCheckParams);
          for (int i = 0; i < DevicePlugin.this.mCheckParams.length(); i++)
          {
            localStringBuffer.append(DevicePlugin.this.mCheckParams.get(i).toString());
            if (i < -1 + DevicePlugin.this.mCheckParams.length()) {
              localStringBuffer.append(",");
            }
            Log.d("DevicePlugin", "params inside..........." + DevicePlugin.this.mCheckParams.get(i).toString() + "---" + localStringBuffer.toString());
          }
          DevicePlugin.access$2002(DevicePlugin.this, DevicePlugin.this.mUpnpDeviceList.getLedDeviceStatus(localStringBuffer.toString()));
          LogUtils.infoLog("DevicePlugin", "pushDeviceListStatusIntent: " + DevicePlugin.this.getendArray);
          localIntent = new Intent();
          ArrayList localArrayList = new ArrayList();
          int j = 0;
          for (;;)
          {
            int k = DevicePlugin.this.getendArray.length();
            if (j < k) {
              try
              {
                localArrayList.add(DevicePlugin.this.getendArray.getJSONObject(j).toString());
                j++;
              }
              catch (JSONException localJSONException2)
              {
                for (;;)
                {
                  localJSONException2.printStackTrace();
                }
              }
            }
          }
          localIntent.putStringArrayListExtra("getLedStatusList", localArrayList);
        }
        catch (JSONException localJSONException1)
        {
          localJSONException1.printStackTrace();
          return;
        }
        localIntent.setAction("com.controller.belkin.hybrid.BRIDGE_DEVICES_STATUS");
        DevicePlugin.mContext.sendBroadcast(localIntent);
      }
    }).start();
  }
  
  private void getStatusForGrpLed(final CallbackContext paramCallbackContext, JSONArray paramJSONArray)
  {
    this.mCheckParams = paramJSONArray;
    this.getendArray = new JSONArray();
    this.cordova.getThreadPool().execute(new Runnable()
    {
      public void run()
      {
        try
        {
          StringBuffer localStringBuffer = new StringBuffer();
          for (int i = 0; i < DevicePlugin.this.mCheckParams.length(); i++)
          {
            localStringBuffer.append(DevicePlugin.this.mCheckParams.get(i).toString());
            if (i < -1 + DevicePlugin.this.mCheckParams.length()) {
              localStringBuffer.append(",");
            }
            LogUtils.infoLog("DevicePlugin", "params inside..........." + DevicePlugin.this.mCheckParams.get(i).toString() + "---" + localStringBuffer.toString());
          }
          DevicePlugin.access$2002(DevicePlugin.this, DevicePlugin.this.mUpnpDeviceList.getLedDeviceStatus(localStringBuffer.toString()));
          LogUtils.infoLog("DevicePlugin", "pushDeviceListStatusIntent: " + DevicePlugin.this.getendArray);
          DevicePlugin.access$102(DevicePlugin.this, new PluginResult(PluginResult.Status.OK, DevicePlugin.this.getendArray));
          DevicePlugin.this.mPluginResult.setKeepCallback(false);
          paramCallbackContext.sendPluginResult(DevicePlugin.this.mPluginResult);
          return;
        }
        catch (JSONException localJSONException)
        {
          localJSONException.printStackTrace();
        }
      }
    });
  }
  
  private void pushCheckWemoIntent(String paramString)
  {
    LogUtils.infoLog("DevicePlugin", "pushCheckWemoIntent: " + paramString);
    Intent localIntent = new Intent();
    localIntent.putExtra("smartString", paramString);
    localIntent.setAction("com.controller.belkin.hybrid.SMART_CHECK_WEMO");
    mContext.sendBroadcast(localIntent);
  }
  
  private void pushDeviceListIntent(JSONArray paramJSONArray)
  {
    LogUtils.infoLog("DevicePlugin", "pushDeviceListIntent: " + paramJSONArray);
    this.getendArray = paramJSONArray;
    Intent localIntent = new Intent();
    ArrayList localArrayList = new ArrayList();
    int i = 0;
    for (;;)
    {
      if (i < paramJSONArray.length()) {
        try
        {
          localArrayList.add(paramJSONArray.getJSONObject(i).toString());
          i++;
        }
        catch (JSONException localJSONException)
        {
          for (;;)
          {
            localJSONException.printStackTrace();
          }
        }
      }
    }
    localIntent.putStringArrayListExtra("getLedList", localArrayList);
    localIntent.setAction("com.controller.belkin.hybrid.BRIDGE_DEVICES");
    mContext.sendBroadcast(localIntent);
  }
  
  private void pushSmartRegistrationIntent(String paramString)
  {
    LogUtils.infoLog("DevicePlugin", "pushSmartRegistrationIntent: " + paramString);
    Intent localIntent = new Intent();
    localIntent.putExtra("smartString", paramString);
    localIntent.setAction("com.controller.belkin.hybrid.SMART_REGISTRATION");
    mContext.sendBroadcast(localIntent);
  }
  
  private void registrationDataAsync()
  {
    new Thread(new Runnable()
    {
      public void run()
      {
        try
        {
          localJSONObject = DevicePlugin.this.mUpnpDeviceList.getRegistrationData();
          str1 = "";
          if ((localJSONObject != null) && (!localJSONObject.isNull("registrationStatus"))) {
            str1 = localJSONObject.getString("registrationStatus");
          }
          LogUtils.infoLog("DevicePlugin", "registrationDataAsync status: " + str1);
          if (str1.equalsIgnoreCase("S"))
          {
            DevicePlugin.this.mSharePreference.setRemoteAutoEnableNeeded(false);
            String str2 = localJSONObject.getString("privateKeyPhone");
            if (!str2.equalsIgnoreCase("NOKEY")) {
              DevicePlugin.this.mSharePreference.storePrivateKey(str2);
            }
            DevicePlugin.this.mSharePreference.storeHomeId(localJSONObject.getString("homeId"));
            HashSet localHashSet1 = new HashSet();
            String str3 = DevicePlugin.this.mNetworkUtil.getSSID();
            localHashSet1.add(str3);
            DevicePlugin.this.mSharePreference.setHomeSSIDs(localHashSet1);
            DevicePlugin.this.mSharePreference.setRemoteAccessSSID(str3);
            localHashSet2 = new HashSet();
          }
        }
        catch (JSONException localJSONException)
        {
          JSONObject localJSONObject;
          String str1;
          HashSet localHashSet2;
          String str6;
          label200:
          localJSONException.printStackTrace();
          return;
        }
        try
        {
          str6 = localJSONObject.getString("arpMac");
          str4 = str6;
        }
        catch (Exception localException)
        {
          str4 = null;
          break label200;
        }
        if ((str4 != null) && (str4.length() > 0))
        {
          localHashSet2.add(str4);
          Log.d("DevicePlugin", "registrationDataAsync Got ArpMac from FW: " + str4);
        }
        for (;;)
        {
          DevicePlugin.this.mSharePreference.setARPMacs(localHashSet2);
          DevicePlugin.this.mSharePreference.setRemoteEnabled(true);
          LogUtils.infoLog("DevicePlugin", "registrationDataAsync ACTION_GET_REGISTRATION_DATA HomeId: " + DevicePlugin.this.mSharePreference.getHomeId() + " PrivateKey: " + DevicePlugin.this.mSharePreference.getPrivateKey() + " HomeSSID: " + DevicePlugin.this.mSharePreference.getHomeSSIDs() + " RemoteEnabled: " + DevicePlugin.this.mSharePreference.isRemoteEnabled());
          DevicePlugin.this.pushSmartRegistrationIntent(str1);
          return;
          String str5 = DevicePlugin.this.mNetworkUtil.getArpMac();
          if ((str5 != null) && (str5.length() > 0)) {
            localHashSet2.add(str5);
          }
        }
      }
    }).start();
  }
  
  private void registrationStatusAsync()
  {
    new Thread(new Runnable()
    {
      public void run()
      {
        try
        {
          JSONObject localJSONObject = DevicePlugin.this.mUpnpDeviceList.getRegistrationStatus();
          String str = "";
          if ((localJSONObject != null) && (!localJSONObject.isNull("registrationStatus"))) {
            str = localJSONObject.getString("registrationStatus");
          }
          LogUtils.infoLog("DevicePlugin", "registrationStatusAsync resStatus Code: " + str);
          DevicePlugin.this.pushSmartRegistrationIntent(str);
          return;
        }
        catch (JSONException localJSONException)
        {
          localJSONException.printStackTrace();
        }
      }
    }).start();
  }
  
  private void sendDevicesListIntent(Intent paramIntent, String paramString, String[] paramArrayOfString)
  {
    for (;;)
    {
      JSONObject localJSONObject;
      try
      {
        if (paramIntent.getExtras() == null)
        {
          LogUtils.infoLog("DevicePlugin", "Error, bundle is null");
          return;
        }
        localJSONObject = new JSONObject();
        localJSONObject.put("listen", paramString);
        if ((this.getendArray != null) && (this.getendArray.length() > 0))
        {
          localJSONObject.put(paramArrayOfString[0], this.getendArray);
          LogUtils.infoLog("DevicePlugin", "sendDevicesListIntent JSON: " + localJSONObject.toString());
          PluginResult localPluginResult = new PluginResult(PluginResult.Status.OK, localJSONObject);
          localPluginResult.setKeepCallback(true);
          if (localPluginResult == null) {
            break;
          }
          LogUtils.infoLog("DevicePlugin", "sendDevicesListIntent plugin result: " + localPluginResult.toString());
          this.mCallbackContext.sendPluginResult(localPluginResult);
          return;
        }
      }
      catch (JSONException localJSONException)
      {
        localJSONException.printStackTrace();
        return;
      }
      localJSONObject.put(paramArrayOfString[0], paramIntent.getStringArrayListExtra("getLedList"));
    }
  }
  
  private void sendJavascriptCB(String paramString)
  {
    int i = 1;
    int j;
    if (this.webView != null)
    {
      j = i;
      if (this.mAppController == null) {
        break label42;
      }
    }
    for (;;)
    {
      if ((j & i) != 0) {
        this.mAppController.sendJSCallBack(this.webView, paramString);
      }
      return;
      j = 0;
      break;
      label42:
      i = 0;
    }
  }
  
  public boolean equals(Object paramObject)
  {
    return paramObject instanceof DevicePlugin;
  }
  
  /* Error */
  public boolean execute(String arg1, JSONArray arg2, CallbackContext arg3)
    throws JSONException
  {
    // Byte code:
    //   0: aload_1
    //   1: invokestatic 473	java/lang/Integer:parseInt	(Ljava/lang/String;)I
    //   4: istore 4
    //   6: ldc 16
    //   8: new 277	java/lang/StringBuilder
    //   11: dup
    //   12: invokespecial 278	java/lang/StringBuilder:<init>	()V
    //   15: ldc_w 475
    //   18: invokevirtual 284	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   21: iload 4
    //   23: invokevirtual 478	java/lang/StringBuilder:append	(I)Ljava/lang/StringBuilder;
    //   26: ldc_w 480
    //   29: invokevirtual 284	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   32: invokestatic 486	com/belkin/wemo/cache/utils/NetworkMode:isLocal	()Z
    //   35: invokevirtual 489	java/lang/StringBuilder:append	(Z)Ljava/lang/StringBuilder;
    //   38: invokevirtual 287	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   41: invokestatic 293	com/belkin/utils/LogUtils:infoLog	(Ljava/lang/String;Ljava/lang/String;)V
    //   44: invokestatic 486	com/belkin/wemo/cache/utils/NetworkMode:isLocal	()Z
    //   47: istore 5
    //   49: iload 5
    //   51: ifeq +28 -> 79
    //   54: getstatic 373	com/belkin/cordova/plugin/DevicePlugin:mContext	Landroid/content/Context;
    //   57: invokestatic 495	com/belkin/wemo/localsdk/WeMoSDKContext:getInstance	(Landroid/content/Context;)Lcom/belkin/wemo/localsdk/WeMoSDKContext;
    //   60: putstatic 76	com/belkin/cordova/plugin/DevicePlugin:mWeMoSDKContext	Lcom/belkin/wemo/localsdk/WeMoSDKContext;
    //   63: getstatic 76	com/belkin/cordova/plugin/DevicePlugin:mWeMoSDKContext	Lcom/belkin/wemo/localsdk/WeMoSDKContext;
    //   66: aload_0
    //   67: invokevirtual 499	com/belkin/wemo/localsdk/WeMoSDKContext:addNotificationListener	(Lcom/belkin/wemo/localsdk/WeMoSDKContext$NotificationListener;)V
    //   70: getstatic 373	com/belkin/cordova/plugin/DevicePlugin:mContext	Landroid/content/Context;
    //   73: invokestatic 502	com/belkin/wemo/cache/devicelist/DeviceListManager:getInstance	(Landroid/content/Context;)Lcom/belkin/wemo/cache/devicelist/DeviceListManager;
    //   76: putstatic 78	com/belkin/cordova/plugin/DevicePlugin:mDLM	Lcom/belkin/wemo/cache/devicelist/DeviceListManager;
    //   79: iload 4
    //   81: lookupswitch	default:+955->1036, 1102:+11028->11109, 2000:+997->1078, 2001:+1057->1138, 2002:+1339->1420, 2003:+1998->2079, 2004:+2061->2142, 2005:+2080->2161, 2006:+2445->2526, 2007:+2813->2894, 2008:+2968->3049, 2009:+2995->3076, 2010:+3193->3274, 2011:+3433->3514, 2012:+3490->3571, 2013:+3518->3599, 2014:+8280->8361, 2015:+8532->8613, 2016:+8565->8646, 2017:+8653->8734, 2018:+983->1064, 2019:+10330->10411, 2020:+10365->10446, 2021:+10511->10592, 2022:+10546->10627, 2023:+10439->10520, 2024:+10475->10556, 2031:+3271->3352, 2032:+3352->3433, 2033:+10696->10777, 2034:+10660->10741, 2035:+10810->10891, 2036:+9913->9994, 2037:+1820->1901, 2038:+1845->1926, 2039:+1072->1153, 2050:+8251->8332, 2052:+10846->10927, 2053:+10858->10939, 2055:+10877->10958, 2058:+3073->3154, 2060:+11055->11136, 2061:+11078->11159, 2062:+11195->11276, 2063:+11342->11423, 2064:+11357->11438, 2065:+11476->11557, 2066:+11372->11453, 2067:+11425->11506, 2068:+11517->11598, 2069:+11532->11613, 2070:+11612->11693, 2071:+2563->2644, 2072:+11558->11639, 2073:+11659->11740, 2075:+12781->12862, 2076:+12884->12965, 2078:+8722->8803, 2080:+9947->10028, 2081:+11467->11548, 2082:+1780->1861, 2083:+11976->12057, 2084:+12014->12095, 2085:+12052->12133, 2086:+1765->1846, 2100:+12090->12171, 5002:+6085->6166, 5003:+6842->6923, 5004:+3568->3649, 5005:+3612->3693, 5006:+4904->4985, 5007:+9004->9085, 5008:+9168->9249, 5009:+7998->8079, 5010:+9589->9670, 5011:+9641->9722, 5012:+7200->7281, 5014:+7028->7109, 5017:+8309->8390, 5019:+7864->7945, 5020:+7931->8012, 5021:+9540->9621, 5022:+9483->9564, 5023:+12155->12236, 5024:+12612->12693, 5025:+8391->8472, 5026:+3926->4007, 5050:+6670->6751, 5051:+6271->6352, 5053:+6443->6524, 5055:+7537->7618, 5090:+5515->5596, 5092:+8442->8523, 5093:+3656->3737, 5094:+3681->3762, 5095:+8472->8553, 5096:+8502->8583, 5097:+1271->1352, 5098:+8022->8103, 5555:+3732->3813, 6001:+7703->7784, 6002:+7718->7799, 6004:+9775->9856, 6005:+9833->9914, 8024:+5452->5533, 8025:+12715->12796, 8026:+12733->12814, 9004:+10008->10089, 9007:+10896->10977, 9008:+10962->11043, 9013:+1939->2020, 9023:+5424->5505, 9024:+8788->8869, 9025:+8854->8935, 9105:+10055->10136, 9106:+10257->10338, 9501:+5882->5963, 9502:+5951->6032, 9503:+6020->6101
    //   1036: ldc 16
    //   1038: new 277	java/lang/StringBuilder
    //   1041: dup
    //   1042: invokespecial 278	java/lang/StringBuilder:<init>	()V
    //   1045: ldc_w 504
    //   1048: invokevirtual 284	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   1051: iload 4
    //   1053: invokevirtual 478	java/lang/StringBuilder:append	(I)Ljava/lang/StringBuilder;
    //   1056: invokevirtual 287	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   1059: invokestatic 293	com/belkin/utils/LogUtils:infoLog	(Ljava/lang/String;Ljava/lang/String;)V
    //   1062: iconst_1
    //   1063: ireturn
    //   1064: aload_3
    //   1065: aload_0
    //   1066: getfield 143	com/belkin/cordova/plugin/DevicePlugin:mNetworkUtil	Lcom/belkin/wemo/cache/utils/SDKNetworkUtils;
    //   1069: invokevirtual 507	com/belkin/wemo/cache/utils/SDKNetworkUtils:getAPData	()Ljava/lang/String;
    //   1072: invokevirtual 510	org/apache/cordova/CallbackContext:success	(Ljava/lang/String;)V
    //   1075: goto -13 -> 1062
    //   1078: aload_0
    //   1079: getfield 327	com/belkin/cordova/plugin/DevicePlugin:cordova	Lorg/apache/cordova/CordovaInterface;
    //   1082: invokeinterface 333 1 0
    //   1087: new 512	com/belkin/cordova/plugin/DevicePlugin$1
    //   1090: dup
    //   1091: aload_0
    //   1092: invokespecial 513	com/belkin/cordova/plugin/DevicePlugin$1:<init>	(Lcom/belkin/cordova/plugin/DevicePlugin;)V
    //   1095: invokeinterface 341 2 0
    //   1100: aload_0
    //   1101: new 251	org/apache/cordova/PluginResult
    //   1104: dup
    //   1105: getstatic 257	org/apache/cordova/PluginResult$Status:OK	Lorg/apache/cordova/PluginResult$Status;
    //   1108: iconst_1
    //   1109: invokespecial 516	org/apache/cordova/PluginResult:<init>	(Lorg/apache/cordova/PluginResult$Status;Z)V
    //   1112: putfield 123	com/belkin/cordova/plugin/DevicePlugin:mPluginResult	Lorg/apache/cordova/PluginResult;
    //   1115: aload_0
    //   1116: getfield 123	com/belkin/cordova/plugin/DevicePlugin:mPluginResult	Lorg/apache/cordova/PluginResult;
    //   1119: iconst_0
    //   1120: invokevirtual 438	org/apache/cordova/PluginResult:setKeepCallback	(Z)V
    //   1123: aload_3
    //   1124: aload_0
    //   1125: getfield 123	com/belkin/cordova/plugin/DevicePlugin:mPluginResult	Lorg/apache/cordova/PluginResult;
    //   1128: invokevirtual 266	org/apache/cordova/CallbackContext:sendPluginResult	(Lorg/apache/cordova/PluginResult;)V
    //   1131: aload_3
    //   1132: invokevirtual 518	org/apache/cordova/CallbackContext:success	()V
    //   1135: goto -73 -> 1062
    //   1138: new 520	com/belkin/cordova/plugin/DevicePlugin$2
    //   1141: dup
    //   1142: aload_0
    //   1143: aload_3
    //   1144: invokespecial 521	com/belkin/cordova/plugin/DevicePlugin$2:<init>	(Lcom/belkin/cordova/plugin/DevicePlugin;Lorg/apache/cordova/CallbackContext;)V
    //   1147: invokestatic 526	com/belkin/wemo/thread/WeMoThreadPoolHandler:executeInBackground	(Ljava/lang/Runnable;)V
    //   1150: goto -88 -> 1062
    //   1153: getstatic 76	com/belkin/cordova/plugin/DevicePlugin:mWeMoSDKContext	Lcom/belkin/wemo/localsdk/WeMoSDKContext;
    //   1156: invokevirtual 529	com/belkin/wemo/localsdk/WeMoSDKContext:getDeviceCache	()Ljava/lang/String;
    //   1159: wide
    //   1163: wide
    //   1167: invokevirtual 532	java/lang/String:isEmpty	()Z
    //   1170: ifeq +164 -> 1334
    //   1173: new 394	org/json/JSONObject
    //   1176: dup
    //   1177: invokespecial 425	org/json/JSONObject:<init>	()V
    //   1180: wide
    //   1184: wide
    //   1188: putstatic 80	com/belkin/cordova/plugin/DevicePlugin:mDummyDevices	Lorg/json/JSONObject;
    //   1191: aload_3
    //   1192: wide
    //   1196: invokevirtual 535	org/apache/cordova/CallbackContext:success	(Lorg/json/JSONObject;)V
    //   1199: ldc_w 537
    //   1202: new 277	java/lang/StringBuilder
    //   1205: dup
    //   1206: invokespecial 278	java/lang/StringBuilder:<init>	()V
    //   1209: ldc_w 539
    //   1212: invokevirtual 284	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   1215: wide
    //   1219: invokevirtual 540	org/json/JSONObject:length	()I
    //   1222: invokevirtual 478	java/lang/StringBuilder:append	(I)Ljava/lang/StringBuilder;
    //   1225: invokevirtual 287	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   1228: invokestatic 293	com/belkin/utils/LogUtils:infoLog	(Ljava/lang/String;Ljava/lang/String;)V
    //   1231: getstatic 78	com/belkin/cordova/plugin/DevicePlugin:mDLM	Lcom/belkin/wemo/cache/devicelist/DeviceListManager;
    //   1234: invokevirtual 544	com/belkin/wemo/cache/devicelist/DeviceListManager:getDeviceInformation	()Ljava/util/ArrayList;
    //   1237: invokevirtual 548	java/util/ArrayList:iterator	()Ljava/util/Iterator;
    //   1240: wide
    //   1244: wide
    //   1248: invokeinterface 553 1 0
    //   1253: ifeq -191 -> 1062
    //   1256: wide
    //   1260: invokeinterface 557 1 0
    //   1265: checkcast 559	com/belkin/wemo/cache/data/DeviceInformation
    //   1268: wide
    //   1272: wide
    //   1276: invokevirtual 562	com/belkin/wemo/cache/data/DeviceInformation:getInActive	()I
    //   1279: ifne -35 -> 1244
    //   1282: ldc_w 537
    //   1285: new 277	java/lang/StringBuilder
    //   1288: dup
    //   1289: invokespecial 278	java/lang/StringBuilder:<init>	()V
    //   1292: ldc_w 564
    //   1295: invokevirtual 284	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   1298: wide
    //   1302: invokevirtual 567	com/belkin/wemo/cache/data/DeviceInformation:getUDN	()Ljava/lang/String;
    //   1305: invokevirtual 284	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   1308: invokevirtual 287	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   1311: invokestatic 293	com/belkin/utils/LogUtils:infoLog	(Ljava/lang/String;Ljava/lang/String;)V
    //   1314: aload_0
    //   1315: ldc_w 568
    //   1318: ldc_w 295
    //   1321: wide
    //   1325: invokevirtual 567	com/belkin/wemo/cache/data/DeviceInformation:getUDN	()Ljava/lang/String;
    //   1328: invokevirtual 572	com/belkin/cordova/plugin/DevicePlugin:onNotify	(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    //   1331: goto -87 -> 1244
    //   1334: new 394	org/json/JSONObject
    //   1337: dup
    //   1338: wide
    //   1342: invokespecial 574	org/json/JSONObject:<init>	(Ljava/lang/String;)V
    //   1345: wide
    //   1349: goto -165 -> 1184
    //   1352: aload_3
    //   1353: ifnull -291 -> 1062
    //   1356: invokestatic 579	com/belkin/utils/RuleUtility:doesRulesDBFileExist	()Z
    //   1359: ifeq +36 -> 1395
    //   1362: getstatic 257	org/apache/cordova/PluginResult$Status:OK	Lorg/apache/cordova/PluginResult$Status;
    //   1365: wide
    //   1369: new 251	org/apache/cordova/PluginResult
    //   1372: dup
    //   1373: wide
    //   1377: invokespecial 582	org/apache/cordova/PluginResult:<init>	(Lorg/apache/cordova/PluginResult$Status;)V
    //   1380: wide
    //   1384: aload_3
    //   1385: wide
    //   1389: invokevirtual 266	org/apache/cordova/CallbackContext:sendPluginResult	(Lorg/apache/cordova/PluginResult;)V
    //   1392: goto -330 -> 1062
    //   1395: getstatic 314	org/apache/cordova/PluginResult$Status:ERROR	Lorg/apache/cordova/PluginResult$Status;
    //   1398: wide
    //   1402: new 251	org/apache/cordova/PluginResult
    //   1405: dup
    //   1406: wide
    //   1410: invokespecial 582	org/apache/cordova/PluginResult:<init>	(Lorg/apache/cordova/PluginResult$Status;)V
    //   1413: wide
    //   1417: goto -33 -> 1384
    //   1420: ldc 16
    //   1422: ldc_w 584
    //   1425: invokestatic 293	com/belkin/utils/LogUtils:infoLog	(Ljava/lang/String;Ljava/lang/String;)V
    //   1428: new 394	org/json/JSONObject
    //   1431: dup
    //   1432: invokespecial 425	org/json/JSONObject:<init>	()V
    //   1435: wide
    //   1439: getstatic 78	com/belkin/cordova/plugin/DevicePlugin:mDLM	Lcom/belkin/wemo/cache/devicelist/DeviceListManager;
    //   1442: invokevirtual 544	com/belkin/wemo/cache/devicelist/DeviceListManager:getDeviceInformation	()Ljava/util/ArrayList;
    //   1445: wide
    //   1449: wide
    //   1453: ifnull +382 -> 1835
    //   1456: iconst_0
    //   1457: wide
    //   1461: iconst_0
    //   1462: wide
    //   1466: wide
    //   1472: ldc2_w 585
    //   1475: invokestatic 590	java/lang/Thread:sleep	(J)V
    //   1478: wide
    //   1482: invokeinterface 593 1 0
    //   1487: wide
    //   1491: wide
    //   1495: invokeinterface 553 1 0
    //   1500: ifeq +34 -> 1534
    //   1503: wide
    //   1507: invokeinterface 557 1 0
    //   1512: checkcast 559	com/belkin/wemo/cache/data/DeviceInformation
    //   1515: invokevirtual 562	com/belkin/wemo/cache/data/DeviceInformation:getInActive	()I
    //   1518: wide
    //   1522: wide
    //   1526: ifne -35 -> 1491
    //   1529: iconst_1
    //   1530: wide
    //   1534: wide
    //   1538: iconst_5
    //   1539: if_icmpge +10 -> 1549
    //   1542: wide
    //   1546: ifeq -80 -> 1466
    //   1549: wide
    //   1553: invokeinterface 593 1 0
    //   1558: wide
    //   1562: wide
    //   1566: invokeinterface 553 1 0
    //   1571: ifeq +264 -> 1835
    //   1574: wide
    //   1578: invokeinterface 557 1 0
    //   1583: checkcast 559	com/belkin/wemo/cache/data/DeviceInformation
    //   1586: wide
    //   1590: wide
    //   1594: invokevirtual 562	com/belkin/wemo/cache/data/DeviceInformation:getInActive	()I
    //   1597: ifne -35 -> 1562
    //   1600: new 394	org/json/JSONObject
    //   1603: dup
    //   1604: invokespecial 425	org/json/JSONObject:<init>	()V
    //   1607: wide
    //   1611: wide
    //   1615: ldc_w 595
    //   1618: wide
    //   1622: invokevirtual 598	com/belkin/wemo/cache/data/DeviceInformation:getFriendlyName	()Ljava/lang/String;
    //   1625: invokevirtual 430	org/json/JSONObject:put	(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    //   1628: pop
    //   1629: wide
    //   1633: ldc_w 600
    //   1636: wide
    //   1640: invokevirtual 603	com/belkin/wemo/cache/data/DeviceInformation:getType	()Ljava/lang/String;
    //   1643: invokevirtual 430	org/json/JSONObject:put	(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    //   1646: pop
    //   1647: wide
    //   1651: ldc_w 605
    //   1654: wide
    //   1658: invokevirtual 567	com/belkin/wemo/cache/data/DeviceInformation:getUDN	()Ljava/lang/String;
    //   1661: invokevirtual 430	org/json/JSONObject:put	(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    //   1664: pop
    //   1665: wide
    //   1669: ldc_w 607
    //   1672: wide
    //   1676: invokevirtual 610	com/belkin/wemo/cache/data/DeviceInformation:getState	()I
    //   1679: invokevirtual 613	org/json/JSONObject:put	(Ljava/lang/String;I)Lorg/json/JSONObject;
    //   1682: pop
    //   1683: wide
    //   1687: ldc_w 615
    //   1690: wide
    //   1694: invokevirtual 618	com/belkin/wemo/cache/data/DeviceInformation:getIcon	()Ljava/lang/String;
    //   1697: invokevirtual 430	org/json/JSONObject:put	(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    //   1700: pop
    //   1701: wide
    //   1705: invokevirtual 567	com/belkin/wemo/cache/data/DeviceInformation:getUDN	()Ljava/lang/String;
    //   1708: ldc_w 620
    //   1711: invokevirtual 624	java/lang/String:contains	(Ljava/lang/CharSequence;)Z
    //   1714: ifne +67 -> 1781
    //   1717: wide
    //   1721: invokevirtual 567	com/belkin/wemo/cache/data/DeviceInformation:getUDN	()Ljava/lang/String;
    //   1724: ldc_w 626
    //   1727: invokevirtual 624	java/lang/String:contains	(Ljava/lang/CharSequence;)Z
    //   1730: ifne +51 -> 1781
    //   1733: wide
    //   1737: invokevirtual 567	com/belkin/wemo/cache/data/DeviceInformation:getUDN	()Ljava/lang/String;
    //   1740: ldc_w 628
    //   1743: invokevirtual 624	java/lang/String:contains	(Ljava/lang/CharSequence;)Z
    //   1746: ifne +35 -> 1781
    //   1749: wide
    //   1753: invokevirtual 567	com/belkin/wemo/cache/data/DeviceInformation:getUDN	()Ljava/lang/String;
    //   1756: ldc_w 630
    //   1759: invokevirtual 624	java/lang/String:contains	(Ljava/lang/CharSequence;)Z
    //   1762: ifne +19 -> 1781
    //   1765: wide
    //   1769: invokevirtual 567	com/belkin/wemo/cache/data/DeviceInformation:getUDN	()Ljava/lang/String;
    //   1772: ldc_w 632
    //   1775: invokevirtual 624	java/lang/String:contains	(Ljava/lang/CharSequence;)Z
    //   1778: ifeq +21 -> 1799
    //   1781: wide
    //   1785: ldc_w 634
    //   1788: wide
    //   1792: invokevirtual 638	com/belkin/wemo/cache/data/DeviceInformation:getAttributeList	()Lorg/json/JSONObject;
    //   1795: invokevirtual 430	org/json/JSONObject:put	(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    //   1798: pop
    //   1799: wide
    //   1803: wide
    //   1807: invokevirtual 567	com/belkin/wemo/cache/data/DeviceInformation:getUDN	()Ljava/lang/String;
    //   1810: wide
    //   1814: invokevirtual 430	org/json/JSONObject:put	(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    //   1817: pop
    //   1818: goto -256 -> 1562
    //   1821: wide
    //   1825: wide
    //   1829: invokevirtual 639	java/lang/InterruptedException:printStackTrace	()V
    //   1832: goto -283 -> 1549
    //   1835: aload_3
    //   1836: wide
    //   1840: invokevirtual 535	org/apache/cordova/CallbackContext:success	(Lorg/json/JSONObject;)V
    //   1843: goto -781 -> 1062
    //   1846: new 641	com/belkin/cordova/plugin/DevicePlugin$3
    //   1849: dup
    //   1850: aload_0
    //   1851: aload_3
    //   1852: invokespecial 642	com/belkin/cordova/plugin/DevicePlugin$3:<init>	(Lcom/belkin/cordova/plugin/DevicePlugin;Lorg/apache/cordova/CallbackContext;)V
    //   1855: invokestatic 526	com/belkin/wemo/thread/WeMoThreadPoolHandler:executeInBackground	(Ljava/lang/Runnable;)V
    //   1858: goto -796 -> 1062
    //   1861: ldc 16
    //   1863: ldc_w 644
    //   1866: invokestatic 293	com/belkin/utils/LogUtils:infoLog	(Ljava/lang/String;Ljava/lang/String;)V
    //   1869: getstatic 76	com/belkin/cordova/plugin/DevicePlugin:mWeMoSDKContext	Lcom/belkin/wemo/localsdk/WeMoSDKContext;
    //   1872: ifnull -810 -> 1062
    //   1875: getstatic 76	com/belkin/cordova/plugin/DevicePlugin:mWeMoSDKContext	Lcom/belkin/wemo/localsdk/WeMoSDKContext;
    //   1878: invokevirtual 647	com/belkin/wemo/localsdk/WeMoSDKContext:getActiveDeviceList	()Ljava/util/ArrayList;
    //   1881: invokevirtual 650	java/util/ArrayList:clear	()V
    //   1884: goto -822 -> 1062
    //   1887: wide
    //   1891: wide
    //   1895: invokevirtual 651	java/lang/Exception:printStackTrace	()V
    //   1898: goto -836 -> 1062
    //   1901: aload_0
    //   1902: getfield 327	com/belkin/cordova/plugin/DevicePlugin:cordova	Lorg/apache/cordova/CordovaInterface;
    //   1905: invokeinterface 333 1 0
    //   1910: new 653	com/belkin/cordova/plugin/DevicePlugin$4
    //   1913: dup
    //   1914: aload_0
    //   1915: invokespecial 654	com/belkin/cordova/plugin/DevicePlugin$4:<init>	(Lcom/belkin/cordova/plugin/DevicePlugin;)V
    //   1918: invokeinterface 341 2 0
    //   1923: goto -861 -> 1062
    //   1926: aload_2
    //   1927: iconst_0
    //   1928: invokevirtual 658	org/json/JSONArray:getString	(I)Ljava/lang/String;
    //   1931: wide
    //   1935: wide
    //   1939: ifnull +71 -> 2010
    //   1942: getstatic 76	com/belkin/cordova/plugin/DevicePlugin:mWeMoSDKContext	Lcom/belkin/wemo/localsdk/WeMoSDKContext;
    //   1945: ifnull +65 -> 2010
    //   1948: getstatic 76	com/belkin/cordova/plugin/DevicePlugin:mWeMoSDKContext	Lcom/belkin/wemo/localsdk/WeMoSDKContext;
    //   1951: wide
    //   1955: invokevirtual 662	com/belkin/wemo/localsdk/WeMoSDKContext:getWeMoDeviceByUDN	(Ljava/lang/String;)Lcom/belkin/wemo/localsdk/WeMoDevice;
    //   1958: ifnonnull +37 -> 1995
    //   1961: getstatic 80	com/belkin/cordova/plugin/DevicePlugin:mDummyDevices	Lorg/json/JSONObject;
    //   1964: ifnull +21 -> 1985
    //   1967: getstatic 80	com/belkin/cordova/plugin/DevicePlugin:mDummyDevices	Lorg/json/JSONObject;
    //   1970: wide
    //   1974: invokevirtual 666	org/json/JSONObject:remove	(Ljava/lang/String;)Ljava/lang/Object;
    //   1977: pop
    //   1978: aload_3
    //   1979: invokevirtual 518	org/apache/cordova/CallbackContext:success	()V
    //   1982: goto -920 -> 1062
    //   1985: aload_3
    //   1986: ldc_w 668
    //   1989: invokevirtual 671	org/apache/cordova/CallbackContext:error	(Ljava/lang/String;)V
    //   1992: goto -930 -> 1062
    //   1995: getstatic 76	com/belkin/cordova/plugin/DevicePlugin:mWeMoSDKContext	Lcom/belkin/wemo/localsdk/WeMoSDKContext;
    //   1998: aload_2
    //   1999: iconst_0
    //   2000: invokevirtual 658	org/json/JSONArray:getString	(I)Ljava/lang/String;
    //   2003: invokevirtual 675	com/belkin/wemo/localsdk/WeMoSDKContext:removeWeMoDeviceByUDN	(Ljava/lang/String;)Z
    //   2006: pop
    //   2007: goto -29 -> 1978
    //   2010: aload_3
    //   2011: ldc_w 668
    //   2014: invokevirtual 671	org/apache/cordova/CallbackContext:error	(Ljava/lang/String;)V
    //   2017: goto -955 -> 1062
    //   2020: aload_2
    //   2021: iconst_0
    //   2022: invokevirtual 658	org/json/JSONArray:getString	(I)Ljava/lang/String;
    //   2025: wide
    //   2029: wide
    //   2033: iconst_1
    //   2034: wide
    //   2038: ldc_w 677
    //   2041: invokevirtual 680	java/lang/String:lastIndexOf	(Ljava/lang/String;)I
    //   2044: iadd
    //   2045: wide
    //   2049: invokevirtual 681	java/lang/String:length	()I
    //   2052: invokevirtual 685	java/lang/String:substring	(II)Ljava/lang/String;
    //   2055: wide
    //   2059: aload_3
    //   2060: getstatic 373	com/belkin/cordova/plugin/DevicePlugin:mContext	Landroid/content/Context;
    //   2063: invokestatic 690	com/belkin/wemo/storage/FileStorage:getInstance	(Landroid/content/Context;)Lcom/belkin/wemo/storage/FileStorage;
    //   2066: wide
    //   2070: invokevirtual 694	com/belkin/wemo/storage/FileStorage:getDefaultIconFileUrl	(Ljava/lang/String;)Ljava/lang/String;
    //   2073: invokevirtual 510	org/apache/cordova/CallbackContext:success	(Ljava/lang/String;)V
    //   2076: goto -1014 -> 1062
    //   2079: ldc 16
    //   2081: ldc_w 696
    //   2084: invokestatic 293	com/belkin/utils/LogUtils:infoLog	(Ljava/lang/String;Ljava/lang/String;)V
    //   2087: invokestatic 700	com/belkin/wemo/localsdk/WeMoSDKContext:getWeMoSDKInstance	()Lcom/belkin/wemo/localsdk/WeMoSDKContext;
    //   2090: putstatic 76	com/belkin/cordova/plugin/DevicePlugin:mWeMoSDKContext	Lcom/belkin/wemo/localsdk/WeMoSDKContext;
    //   2093: getstatic 76	com/belkin/cordova/plugin/DevicePlugin:mWeMoSDKContext	Lcom/belkin/wemo/localsdk/WeMoSDKContext;
    //   2096: ifnull +9 -> 2105
    //   2099: getstatic 76	com/belkin/cordova/plugin/DevicePlugin:mWeMoSDKContext	Lcom/belkin/wemo/localsdk/WeMoSDKContext;
    //   2102: invokevirtual 703	com/belkin/wemo/localsdk/WeMoSDKContext:stop	()V
    //   2105: aload_0
    //   2106: new 251	org/apache/cordova/PluginResult
    //   2109: dup
    //   2110: getstatic 257	org/apache/cordova/PluginResult$Status:OK	Lorg/apache/cordova/PluginResult$Status;
    //   2113: invokespecial 582	org/apache/cordova/PluginResult:<init>	(Lorg/apache/cordova/PluginResult$Status;)V
    //   2116: putfield 123	com/belkin/cordova/plugin/DevicePlugin:mPluginResult	Lorg/apache/cordova/PluginResult;
    //   2119: aload_0
    //   2120: getfield 123	com/belkin/cordova/plugin/DevicePlugin:mPluginResult	Lorg/apache/cordova/PluginResult;
    //   2123: iconst_1
    //   2124: invokevirtual 438	org/apache/cordova/PluginResult:setKeepCallback	(Z)V
    //   2127: aload_3
    //   2128: aload_0
    //   2129: getfield 123	com/belkin/cordova/plugin/DevicePlugin:mPluginResult	Lorg/apache/cordova/PluginResult;
    //   2132: invokevirtual 266	org/apache/cordova/CallbackContext:sendPluginResult	(Lorg/apache/cordova/PluginResult;)V
    //   2135: aconst_null
    //   2136: putstatic 76	com/belkin/cordova/plugin/DevicePlugin:mWeMoSDKContext	Lcom/belkin/wemo/localsdk/WeMoSDKContext;
    //   2139: goto -1077 -> 1062
    //   2142: getstatic 76	com/belkin/cordova/plugin/DevicePlugin:mWeMoSDKContext	Lcom/belkin/wemo/localsdk/WeMoSDKContext;
    //   2145: aload_2
    //   2146: iconst_1
    //   2147: invokevirtual 658	org/json/JSONArray:getString	(I)Ljava/lang/String;
    //   2150: aload_2
    //   2151: iconst_0
    //   2152: invokevirtual 658	org/json/JSONArray:getString	(I)Ljava/lang/String;
    //   2155: invokevirtual 706	com/belkin/wemo/localsdk/WeMoSDKContext:setDeviceState	(Ljava/lang/String;Ljava/lang/String;)V
    //   2158: goto -1096 -> 1062
    //   2161: ldc 16
    //   2163: ldc_w 708
    //   2166: invokestatic 293	com/belkin/utils/LogUtils:infoLog	(Ljava/lang/String;Ljava/lang/String;)V
    //   2169: aload_0
    //   2170: getfield 87	com/belkin/cordova/plugin/DevicePlugin:mCallbackContext	Lorg/apache/cordova/CallbackContext;
    //   2173: ifnull +12 -> 2185
    //   2176: aload_3
    //   2177: ldc_w 710
    //   2180: invokevirtual 671	org/apache/cordova/CallbackContext:error	(Ljava/lang/String;)V
    //   2183: iconst_1
    //   2184: ireturn
    //   2185: aload_0
    //   2186: aload_3
    //   2187: putfield 87	com/belkin/cordova/plugin/DevicePlugin:mCallbackContext	Lorg/apache/cordova/CallbackContext;
    //   2190: new 712	android/content/IntentFilter
    //   2193: dup
    //   2194: invokespecial 713	android/content/IntentFilter:<init>	()V
    //   2197: wide
    //   2201: wide
    //   2205: ldc_w 715
    //   2208: invokevirtual 718	android/content/IntentFilter:addAction	(Ljava/lang/String;)V
    //   2211: wide
    //   2215: ldc_w 720
    //   2218: invokevirtual 718	android/content/IntentFilter:addAction	(Ljava/lang/String;)V
    //   2221: wide
    //   2225: ldc_w 722
    //   2228: invokevirtual 718	android/content/IntentFilter:addAction	(Ljava/lang/String;)V
    //   2231: wide
    //   2235: ldc_w 724
    //   2238: invokevirtual 718	android/content/IntentFilter:addAction	(Ljava/lang/String;)V
    //   2241: wide
    //   2245: ldc_w 726
    //   2248: invokevirtual 718	android/content/IntentFilter:addAction	(Ljava/lang/String;)V
    //   2251: wide
    //   2255: ldc_w 728
    //   2258: invokevirtual 718	android/content/IntentFilter:addAction	(Ljava/lang/String;)V
    //   2261: wide
    //   2265: ldc_w 406
    //   2268: invokevirtual 718	android/content/IntentFilter:addAction	(Ljava/lang/String;)V
    //   2271: wide
    //   2275: ldc_w 730
    //   2278: invokevirtual 718	android/content/IntentFilter:addAction	(Ljava/lang/String;)V
    //   2281: wide
    //   2285: ldc_w 732
    //   2288: invokevirtual 718	android/content/IntentFilter:addAction	(Ljava/lang/String;)V
    //   2291: wide
    //   2295: ldc_w 734
    //   2298: invokevirtual 718	android/content/IntentFilter:addAction	(Ljava/lang/String;)V
    //   2301: wide
    //   2305: ldc_w 736
    //   2308: invokevirtual 718	android/content/IntentFilter:addAction	(Ljava/lang/String;)V
    //   2311: getstatic 110	com/belkin/cordova/plugin/DevicePlugin:mBroadcastReceiver	Landroid/content/BroadcastReceiver;
    //   2314: ifnonnull +179 -> 2493
    //   2317: ldc 16
    //   2319: ldc_w 738
    //   2322: invokestatic 293	com/belkin/utils/LogUtils:infoLog	(Ljava/lang/String;Ljava/lang/String;)V
    //   2325: new 740	com/belkin/cordova/plugin/DevicePlugin$5
    //   2328: dup
    //   2329: aload_0
    //   2330: aload_0
    //   2331: invokespecial 743	com/belkin/cordova/plugin/DevicePlugin$5:<init>	(Lcom/belkin/cordova/plugin/DevicePlugin;Lcom/belkin/cordova/plugin/DevicePlugin;)V
    //   2334: putstatic 110	com/belkin/cordova/plugin/DevicePlugin:mBroadcastReceiver	Landroid/content/BroadcastReceiver;
    //   2337: getstatic 373	com/belkin/cordova/plugin/DevicePlugin:mContext	Landroid/content/Context;
    //   2340: getstatic 110	com/belkin/cordova/plugin/DevicePlugin:mBroadcastReceiver	Landroid/content/BroadcastReceiver;
    //   2343: wide
    //   2347: invokevirtual 747	android/content/Context:registerReceiver	(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)Landroid/content/Intent;
    //   2350: pop
    //   2351: aload_0
    //   2352: getfield 119	com/belkin/cordova/plugin/DevicePlugin:mUpnpDeviceList	Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;
    //   2355: invokevirtual 752	com/belkin/cybergarage/wrapper/UpnpDeviceList:getWeMoDeviceList	()Lorg/json/JSONObject;
    //   2358: ldc_w 754
    //   2361: invokevirtual 757	org/json/JSONObject:get	(Ljava/lang/String;)Ljava/lang/Object;
    //   2364: checkcast 383	java/util/ArrayList
    //   2367: wide
    //   2371: iconst_0
    //   2372: wide
    //   2376: wide
    //   2380: invokevirtual 760	java/util/ArrayList:size	()I
    //   2383: wide
    //   2387: wide
    //   2391: wide
    //   2395: if_icmpge +98 -> 2493
    //   2398: ldc 16
    //   2400: new 277	java/lang/StringBuilder
    //   2403: dup
    //   2404: invokespecial 278	java/lang/StringBuilder:<init>	()V
    //   2407: ldc_w 762
    //   2410: invokevirtual 284	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   2413: wide
    //   2417: wide
    //   2421: invokevirtual 765	java/util/ArrayList:get	(I)Ljava/lang/Object;
    //   2424: checkcast 297	java/lang/String
    //   2427: invokevirtual 284	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   2430: invokevirtual 287	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   2433: invokestatic 293	com/belkin/utils/LogUtils:infoLog	(Ljava/lang/String;Ljava/lang/String;)V
    //   2436: aload_0
    //   2437: ldc_w 568
    //   2440: ldc_w 295
    //   2443: wide
    //   2447: wide
    //   2451: invokevirtual 765	java/util/ArrayList:get	(I)Ljava/lang/Object;
    //   2454: checkcast 297	java/lang/String
    //   2457: invokevirtual 572	com/belkin/cordova/plugin/DevicePlugin:onNotify	(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    //   2460: wide
    //   2466: goto -90 -> 2376
    //   2469: wide
    //   2473: ldc 16
    //   2475: ldc_w 767
    //   2478: wide
    //   2482: invokestatic 771	com/belkin/utils/LogUtils:errorLog	(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V
    //   2485: aconst_null
    //   2486: wide
    //   2490: goto -119 -> 2371
    //   2493: new 251	org/apache/cordova/PluginResult
    //   2496: dup
    //   2497: getstatic 774	org/apache/cordova/PluginResult$Status:NO_RESULT	Lorg/apache/cordova/PluginResult$Status;
    //   2500: invokespecial 582	org/apache/cordova/PluginResult:<init>	(Lorg/apache/cordova/PluginResult$Status;)V
    //   2503: wide
    //   2507: wide
    //   2511: iconst_1
    //   2512: invokevirtual 438	org/apache/cordova/PluginResult:setKeepCallback	(Z)V
    //   2515: aload_3
    //   2516: wide
    //   2520: invokevirtual 266	org/apache/cordova/CallbackContext:sendPluginResult	(Lorg/apache/cordova/PluginResult;)V
    //   2523: goto -1461 -> 1062
    //   2526: ldc 16
    //   2528: ldc_w 776
    //   2531: invokestatic 293	com/belkin/utils/LogUtils:infoLog	(Ljava/lang/String;Ljava/lang/String;)V
    //   2534: getstatic 110	com/belkin/cordova/plugin/DevicePlugin:mBroadcastReceiver	Landroid/content/BroadcastReceiver;
    //   2537: ifnull +99 -> 2636
    //   2540: getstatic 373	com/belkin/cordova/plugin/DevicePlugin:mContext	Landroid/content/Context;
    //   2543: getstatic 110	com/belkin/cordova/plugin/DevicePlugin:mBroadcastReceiver	Landroid/content/BroadcastReceiver;
    //   2546: invokevirtual 780	android/content/Context:unregisterReceiver	(Landroid/content/BroadcastReceiver;)V
    //   2549: aconst_null
    //   2550: putstatic 110	com/belkin/cordova/plugin/DevicePlugin:mBroadcastReceiver	Landroid/content/BroadcastReceiver;
    //   2553: aload_0
    //   2554: new 251	org/apache/cordova/PluginResult
    //   2557: dup
    //   2558: getstatic 257	org/apache/cordova/PluginResult$Status:OK	Lorg/apache/cordova/PluginResult$Status;
    //   2561: invokespecial 582	org/apache/cordova/PluginResult:<init>	(Lorg/apache/cordova/PluginResult$Status;)V
    //   2564: putfield 123	com/belkin/cordova/plugin/DevicePlugin:mPluginResult	Lorg/apache/cordova/PluginResult;
    //   2567: aload_0
    //   2568: getfield 123	com/belkin/cordova/plugin/DevicePlugin:mPluginResult	Lorg/apache/cordova/PluginResult;
    //   2571: iconst_0
    //   2572: invokevirtual 438	org/apache/cordova/PluginResult:setKeepCallback	(Z)V
    //   2575: aload_0
    //   2576: getfield 87	com/belkin/cordova/plugin/DevicePlugin:mCallbackContext	Lorg/apache/cordova/CallbackContext;
    //   2579: aload_0
    //   2580: getfield 123	com/belkin/cordova/plugin/DevicePlugin:mPluginResult	Lorg/apache/cordova/PluginResult;
    //   2583: invokevirtual 266	org/apache/cordova/CallbackContext:sendPluginResult	(Lorg/apache/cordova/PluginResult;)V
    //   2586: aload_0
    //   2587: aconst_null
    //   2588: putfield 87	com/belkin/cordova/plugin/DevicePlugin:mCallbackContext	Lorg/apache/cordova/CallbackContext;
    //   2591: aload_3
    //   2592: invokevirtual 518	org/apache/cordova/CallbackContext:success	()V
    //   2595: goto -1533 -> 1062
    //   2598: wide
    //   2602: ldc 16
    //   2604: new 277	java/lang/StringBuilder
    //   2607: dup
    //   2608: invokespecial 278	java/lang/StringBuilder:<init>	()V
    //   2611: ldc_w 782
    //   2614: invokevirtual 284	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   2617: wide
    //   2621: invokevirtual 785	java/lang/Exception:getMessage	()Ljava/lang/String;
    //   2624: invokevirtual 284	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   2627: invokevirtual 287	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   2630: invokestatic 787	com/belkin/utils/LogUtils:errorLog	(Ljava/lang/String;Ljava/lang/String;)V
    //   2633: goto -80 -> 2553
    //   2636: aload_3
    //   2637: iconst_1
    //   2638: invokevirtual 790	org/apache/cordova/CallbackContext:error	(I)V
    //   2641: goto -1579 -> 1062
    //   2644: ldc 16
    //   2646: ldc_w 708
    //   2649: invokestatic 293	com/belkin/utils/LogUtils:infoLog	(Ljava/lang/String;Ljava/lang/String;)V
    //   2652: aload_0
    //   2653: getfield 87	com/belkin/cordova/plugin/DevicePlugin:mCallbackContext	Lorg/apache/cordova/CallbackContext;
    //   2656: ifnull +12 -> 2668
    //   2659: aload_3
    //   2660: ldc_w 710
    //   2663: invokevirtual 671	org/apache/cordova/CallbackContext:error	(Ljava/lang/String;)V
    //   2666: iconst_1
    //   2667: ireturn
    //   2668: aload_0
    //   2669: aload_3
    //   2670: putfield 87	com/belkin/cordova/plugin/DevicePlugin:mCallbackContext	Lorg/apache/cordova/CallbackContext;
    //   2673: new 712	android/content/IntentFilter
    //   2676: dup
    //   2677: invokespecial 713	android/content/IntentFilter:<init>	()V
    //   2680: wide
    //   2684: wide
    //   2688: ldc_w 406
    //   2691: invokevirtual 718	android/content/IntentFilter:addAction	(Ljava/lang/String;)V
    //   2694: wide
    //   2698: ldc_w 730
    //   2701: invokevirtual 718	android/content/IntentFilter:addAction	(Ljava/lang/String;)V
    //   2704: getstatic 110	com/belkin/cordova/plugin/DevicePlugin:mBroadcastReceiver	Landroid/content/BroadcastReceiver;
    //   2707: ifnonnull +154 -> 2861
    //   2710: ldc 16
    //   2712: ldc_w 738
    //   2715: invokestatic 293	com/belkin/utils/LogUtils:infoLog	(Ljava/lang/String;Ljava/lang/String;)V
    //   2718: new 792	com/belkin/cordova/plugin/DevicePlugin$6
    //   2721: dup
    //   2722: aload_0
    //   2723: invokespecial 793	com/belkin/cordova/plugin/DevicePlugin$6:<init>	(Lcom/belkin/cordova/plugin/DevicePlugin;)V
    //   2726: putstatic 110	com/belkin/cordova/plugin/DevicePlugin:mBroadcastReceiver	Landroid/content/BroadcastReceiver;
    //   2729: getstatic 373	com/belkin/cordova/plugin/DevicePlugin:mContext	Landroid/content/Context;
    //   2732: getstatic 110	com/belkin/cordova/plugin/DevicePlugin:mBroadcastReceiver	Landroid/content/BroadcastReceiver;
    //   2735: wide
    //   2739: invokevirtual 747	android/content/Context:registerReceiver	(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)Landroid/content/Intent;
    //   2742: pop
    //   2743: getstatic 78	com/belkin/cordova/plugin/DevicePlugin:mDLM	Lcom/belkin/wemo/cache/devicelist/DeviceListManager;
    //   2746: ifnonnull +12 -> 2758
    //   2749: getstatic 373	com/belkin/cordova/plugin/DevicePlugin:mContext	Landroid/content/Context;
    //   2752: invokestatic 502	com/belkin/wemo/cache/devicelist/DeviceListManager:getInstance	(Landroid/content/Context;)Lcom/belkin/wemo/cache/devicelist/DeviceListManager;
    //   2755: putstatic 78	com/belkin/cordova/plugin/DevicePlugin:mDLM	Lcom/belkin/wemo/cache/devicelist/DeviceListManager;
    //   2758: getstatic 78	com/belkin/cordova/plugin/DevicePlugin:mDLM	Lcom/belkin/wemo/cache/devicelist/DeviceListManager;
    //   2761: invokevirtual 544	com/belkin/wemo/cache/devicelist/DeviceListManager:getDeviceInformation	()Ljava/util/ArrayList;
    //   2764: invokevirtual 548	java/util/ArrayList:iterator	()Ljava/util/Iterator;
    //   2767: wide
    //   2771: wide
    //   2775: invokeinterface 553 1 0
    //   2780: ifeq +81 -> 2861
    //   2783: wide
    //   2787: invokeinterface 557 1 0
    //   2792: checkcast 559	com/belkin/wemo/cache/data/DeviceInformation
    //   2795: wide
    //   2799: wide
    //   2803: invokevirtual 562	com/belkin/wemo/cache/data/DeviceInformation:getInActive	()I
    //   2806: ifne -35 -> 2771
    //   2809: ldc_w 537
    //   2812: new 277	java/lang/StringBuilder
    //   2815: dup
    //   2816: invokespecial 278	java/lang/StringBuilder:<init>	()V
    //   2819: ldc_w 564
    //   2822: invokevirtual 284	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   2825: wide
    //   2829: invokevirtual 567	com/belkin/wemo/cache/data/DeviceInformation:getUDN	()Ljava/lang/String;
    //   2832: invokevirtual 284	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   2835: invokevirtual 287	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   2838: invokestatic 293	com/belkin/utils/LogUtils:infoLog	(Ljava/lang/String;Ljava/lang/String;)V
    //   2841: aload_0
    //   2842: ldc_w 568
    //   2845: ldc_w 295
    //   2848: wide
    //   2852: invokevirtual 567	com/belkin/wemo/cache/data/DeviceInformation:getUDN	()Ljava/lang/String;
    //   2855: invokevirtual 572	com/belkin/cordova/plugin/DevicePlugin:onNotify	(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    //   2858: goto -87 -> 2771
    //   2861: new 251	org/apache/cordova/PluginResult
    //   2864: dup
    //   2865: getstatic 774	org/apache/cordova/PluginResult$Status:NO_RESULT	Lorg/apache/cordova/PluginResult$Status;
    //   2868: invokespecial 582	org/apache/cordova/PluginResult:<init>	(Lorg/apache/cordova/PluginResult$Status;)V
    //   2871: wide
    //   2875: wide
    //   2879: iconst_1
    //   2880: invokevirtual 438	org/apache/cordova/PluginResult:setKeepCallback	(Z)V
    //   2883: aload_3
    //   2884: wide
    //   2888: invokevirtual 266	org/apache/cordova/CallbackContext:sendPluginResult	(Lorg/apache/cordova/PluginResult;)V
    //   2891: goto -1829 -> 1062
    //   2894: ldc 16
    //   2896: new 277	java/lang/StringBuilder
    //   2899: dup
    //   2900: invokespecial 278	java/lang/StringBuilder:<init>	()V
    //   2903: ldc_w 795
    //   2906: invokevirtual 284	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   2909: aload_2
    //   2910: iconst_0
    //   2911: invokevirtual 796	org/json/JSONArray:get	(I)Ljava/lang/Object;
    //   2914: invokevirtual 443	java/lang/Object:toString	()Ljava/lang/String;
    //   2917: invokevirtual 284	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   2920: invokevirtual 287	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   2923: invokestatic 293	com/belkin/utils/LogUtils:infoLog	(Ljava/lang/String;Ljava/lang/String;)V
    //   2926: getstatic 257	org/apache/cordova/PluginResult$Status:OK	Lorg/apache/cordova/PluginResult$Status;
    //   2929: wide
    //   2933: aload_0
    //   2934: getfield 119	com/belkin/cordova/plugin/DevicePlugin:mUpnpDeviceList	Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;
    //   2937: wide
    //   2941: new 297	java/lang/String
    //   2944: dup
    //   2945: aload_2
    //   2946: iconst_0
    //   2947: invokevirtual 796	org/json/JSONArray:get	(I)Ljava/lang/Object;
    //   2950: invokevirtual 443	java/lang/Object:toString	()Ljava/lang/String;
    //   2953: invokespecial 797	java/lang/String:<init>	(Ljava/lang/String;)V
    //   2956: wide
    //   2960: iconst_1
    //   2961: anewarray 297	java/lang/String
    //   2964: wide
    //   2968: wide
    //   2972: iconst_0
    //   2973: aload_2
    //   2974: iconst_1
    //   2975: invokevirtual 796	org/json/JSONArray:get	(I)Ljava/lang/Object;
    //   2978: invokevirtual 443	java/lang/Object:toString	()Ljava/lang/String;
    //   2981: aastore
    //   2982: aload_0
    //   2983: new 251	org/apache/cordova/PluginResult
    //   2986: dup
    //   2987: wide
    //   2991: wide
    //   2995: wide
    //   2999: wide
    //   3003: invokevirtual 801	com/belkin/cybergarage/wrapper/UpnpDeviceList:setFriendlyName	(Ljava/lang/String;[Ljava/lang/String;)Z
    //   3006: invokespecial 516	org/apache/cordova/PluginResult:<init>	(Lorg/apache/cordova/PluginResult$Status;Z)V
    //   3009: putfield 123	com/belkin/cordova/plugin/DevicePlugin:mPluginResult	Lorg/apache/cordova/PluginResult;
    //   3012: aload_0
    //   3013: getfield 123	com/belkin/cordova/plugin/DevicePlugin:mPluginResult	Lorg/apache/cordova/PluginResult;
    //   3016: iconst_0
    //   3017: invokevirtual 438	org/apache/cordova/PluginResult:setKeepCallback	(Z)V
    //   3020: aload_3
    //   3021: aload_0
    //   3022: getfield 123	com/belkin/cordova/plugin/DevicePlugin:mPluginResult	Lorg/apache/cordova/PluginResult;
    //   3025: invokevirtual 266	org/apache/cordova/CallbackContext:sendPluginResult	(Lorg/apache/cordova/PluginResult;)V
    //   3028: aload_3
    //   3029: invokevirtual 518	org/apache/cordova/CallbackContext:success	()V
    //   3032: goto -1970 -> 1062
    //   3035: wide
    //   3039: wide
    //   3043: invokevirtual 651	java/lang/Exception:printStackTrace	()V
    //   3046: goto -1984 -> 1062
    //   3049: aload_0
    //   3050: getfield 327	com/belkin/cordova/plugin/DevicePlugin:cordova	Lorg/apache/cordova/CordovaInterface;
    //   3053: invokeinterface 333 1 0
    //   3058: new 803	com/belkin/cordova/plugin/DevicePlugin$7
    //   3061: dup
    //   3062: aload_0
    //   3063: aload_2
    //   3064: aload_3
    //   3065: invokespecial 806	com/belkin/cordova/plugin/DevicePlugin$7:<init>	(Lcom/belkin/cordova/plugin/DevicePlugin;Lorg/json/JSONArray;Lorg/apache/cordova/CallbackContext;)V
    //   3068: invokeinterface 341 2 0
    //   3073: goto -2011 -> 1062
    //   3076: ldc 16
    //   3078: new 277	java/lang/StringBuilder
    //   3081: dup
    //   3082: invokespecial 278	java/lang/StringBuilder:<init>	()V
    //   3085: ldc_w 808
    //   3088: invokevirtual 284	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   3091: aload_2
    //   3092: iconst_0
    //   3093: invokevirtual 658	org/json/JSONArray:getString	(I)Ljava/lang/String;
    //   3096: invokevirtual 284	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   3099: invokevirtual 287	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   3102: invokestatic 293	com/belkin/utils/LogUtils:infoLog	(Ljava/lang/String;Ljava/lang/String;)V
    //   3105: aload_0
    //   3106: new 251	org/apache/cordova/PluginResult
    //   3109: dup
    //   3110: getstatic 257	org/apache/cordova/PluginResult$Status:OK	Lorg/apache/cordova/PluginResult$Status;
    //   3113: aload_0
    //   3114: getfield 119	com/belkin/cordova/plugin/DevicePlugin:mUpnpDeviceList	Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;
    //   3117: aload_2
    //   3118: iconst_0
    //   3119: invokevirtual 658	org/json/JSONArray:getString	(I)Ljava/lang/String;
    //   3122: invokevirtual 811	com/belkin/cybergarage/wrapper/UpnpDeviceList:clearNameIconRule	(Ljava/lang/String;)Z
    //   3125: invokespecial 516	org/apache/cordova/PluginResult:<init>	(Lorg/apache/cordova/PluginResult$Status;Z)V
    //   3128: putfield 123	com/belkin/cordova/plugin/DevicePlugin:mPluginResult	Lorg/apache/cordova/PluginResult;
    //   3131: aload_0
    //   3132: getfield 123	com/belkin/cordova/plugin/DevicePlugin:mPluginResult	Lorg/apache/cordova/PluginResult;
    //   3135: iconst_0
    //   3136: invokevirtual 438	org/apache/cordova/PluginResult:setKeepCallback	(Z)V
    //   3139: aload_3
    //   3140: aload_0
    //   3141: getfield 123	com/belkin/cordova/plugin/DevicePlugin:mPluginResult	Lorg/apache/cordova/PluginResult;
    //   3144: invokevirtual 266	org/apache/cordova/CallbackContext:sendPluginResult	(Lorg/apache/cordova/PluginResult;)V
    //   3147: aload_3
    //   3148: invokevirtual 518	org/apache/cordova/CallbackContext:success	()V
    //   3151: goto -2089 -> 1062
    //   3154: ldc 16
    //   3156: new 277	java/lang/StringBuilder
    //   3159: dup
    //   3160: invokespecial 278	java/lang/StringBuilder:<init>	()V
    //   3163: ldc_w 813
    //   3166: invokevirtual 284	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   3169: aload_2
    //   3170: iconst_2
    //   3171: invokevirtual 658	org/json/JSONArray:getString	(I)Ljava/lang/String;
    //   3174: invokevirtual 284	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   3177: invokevirtual 287	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   3180: invokestatic 293	com/belkin/utils/LogUtils:infoLog	(Ljava/lang/String;Ljava/lang/String;)V
    //   3183: aload_0
    //   3184: getfield 193	com/belkin/cordova/plugin/DevicePlugin:mWiFiSecurityUtil	Lcom/belkin/utils/WiFiSecurityUtil;
    //   3187: getstatic 373	com/belkin/cordova/plugin/DevicePlugin:mContext	Landroid/content/Context;
    //   3190: invokevirtual 819	com/belkin/utils/WiFiSecurityUtil:generateAuthCode	(Landroid/content/Context;)Ljava/lang/String;
    //   3193: wide
    //   3197: new 821	com/belkin/devices/ResetDevice
    //   3200: dup
    //   3201: getstatic 373	com/belkin/cordova/plugin/DevicePlugin:mContext	Landroid/content/Context;
    //   3204: invokespecial 824	com/belkin/devices/ResetDevice:<init>	(Landroid/content/Context;)V
    //   3207: wide
    //   3211: aload_0
    //   3212: new 251	org/apache/cordova/PluginResult
    //   3215: dup
    //   3216: getstatic 257	org/apache/cordova/PluginResult$Status:OK	Lorg/apache/cordova/PluginResult$Status;
    //   3219: wide
    //   3223: aload_2
    //   3224: iconst_0
    //   3225: invokevirtual 658	org/json/JSONArray:getString	(I)Ljava/lang/String;
    //   3228: aload_2
    //   3229: iconst_1
    //   3230: invokevirtual 658	org/json/JSONArray:getString	(I)Ljava/lang/String;
    //   3233: aload_2
    //   3234: iconst_2
    //   3235: invokevirtual 658	org/json/JSONArray:getString	(I)Ljava/lang/String;
    //   3238: wide
    //   3242: invokevirtual 828	com/belkin/devices/ResetDevice:resetRemote	(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Z
    //   3245: invokespecial 516	org/apache/cordova/PluginResult:<init>	(Lorg/apache/cordova/PluginResult$Status;Z)V
    //   3248: putfield 123	com/belkin/cordova/plugin/DevicePlugin:mPluginResult	Lorg/apache/cordova/PluginResult;
    //   3251: aload_0
    //   3252: getfield 123	com/belkin/cordova/plugin/DevicePlugin:mPluginResult	Lorg/apache/cordova/PluginResult;
    //   3255: iconst_0
    //   3256: invokevirtual 438	org/apache/cordova/PluginResult:setKeepCallback	(Z)V
    //   3259: aload_3
    //   3260: aload_0
    //   3261: getfield 123	com/belkin/cordova/plugin/DevicePlugin:mPluginResult	Lorg/apache/cordova/PluginResult;
    //   3264: invokevirtual 266	org/apache/cordova/CallbackContext:sendPluginResult	(Lorg/apache/cordova/PluginResult;)V
    //   3267: aload_3
    //   3268: invokevirtual 518	org/apache/cordova/CallbackContext:success	()V
    //   3271: goto -2209 -> 1062
    //   3274: ldc 16
    //   3276: new 277	java/lang/StringBuilder
    //   3279: dup
    //   3280: invokespecial 278	java/lang/StringBuilder:<init>	()V
    //   3283: ldc_w 830
    //   3286: invokevirtual 284	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   3289: aload_2
    //   3290: iconst_0
    //   3291: invokevirtual 658	org/json/JSONArray:getString	(I)Ljava/lang/String;
    //   3294: invokevirtual 284	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   3297: invokevirtual 287	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   3300: invokestatic 293	com/belkin/utils/LogUtils:infoLog	(Ljava/lang/String;Ljava/lang/String;)V
    //   3303: aload_0
    //   3304: new 251	org/apache/cordova/PluginResult
    //   3307: dup
    //   3308: getstatic 257	org/apache/cordova/PluginResult$Status:OK	Lorg/apache/cordova/PluginResult$Status;
    //   3311: aload_0
    //   3312: getfield 119	com/belkin/cordova/plugin/DevicePlugin:mUpnpDeviceList	Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;
    //   3315: aload_2
    //   3316: iconst_0
    //   3317: invokevirtual 658	org/json/JSONArray:getString	(I)Ljava/lang/String;
    //   3320: invokevirtual 833	com/belkin/cybergarage/wrapper/UpnpDeviceList:resetPlugIn	(Ljava/lang/String;)Z
    //   3323: invokespecial 516	org/apache/cordova/PluginResult:<init>	(Lorg/apache/cordova/PluginResult$Status;Z)V
    //   3326: putfield 123	com/belkin/cordova/plugin/DevicePlugin:mPluginResult	Lorg/apache/cordova/PluginResult;
    //   3329: aload_0
    //   3330: getfield 123	com/belkin/cordova/plugin/DevicePlugin:mPluginResult	Lorg/apache/cordova/PluginResult;
    //   3333: iconst_0
    //   3334: invokevirtual 438	org/apache/cordova/PluginResult:setKeepCallback	(Z)V
    //   3337: aload_3
    //   3338: aload_0
    //   3339: getfield 123	com/belkin/cordova/plugin/DevicePlugin:mPluginResult	Lorg/apache/cordova/PluginResult;
    //   3342: invokevirtual 266	org/apache/cordova/CallbackContext:sendPluginResult	(Lorg/apache/cordova/PluginResult;)V
    //   3345: aload_3
    //   3346: invokevirtual 518	org/apache/cordova/CallbackContext:success	()V
    //   3349: goto -2287 -> 1062
    //   3352: ldc 16
    //   3354: new 277	java/lang/StringBuilder
    //   3357: dup
    //   3358: invokespecial 278	java/lang/StringBuilder:<init>	()V
    //   3361: ldc_w 835
    //   3364: invokevirtual 284	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   3367: aload_2
    //   3368: iconst_0
    //   3369: invokevirtual 658	org/json/JSONArray:getString	(I)Ljava/lang/String;
    //   3372: invokevirtual 284	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   3375: invokevirtual 287	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   3378: invokestatic 293	com/belkin/utils/LogUtils:infoLog	(Ljava/lang/String;Ljava/lang/String;)V
    //   3381: aload_0
    //   3382: new 251	org/apache/cordova/PluginResult
    //   3385: dup
    //   3386: getstatic 257	org/apache/cordova/PluginResult$Status:OK	Lorg/apache/cordova/PluginResult$Status;
    //   3389: aload_0
    //   3390: getfield 119	com/belkin/cordova/plugin/DevicePlugin:mUpnpDeviceList	Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;
    //   3393: aload_2
    //   3394: iconst_0
    //   3395: invokevirtual 658	org/json/JSONArray:getString	(I)Ljava/lang/String;
    //   3398: ldc_w 837
    //   3401: invokevirtual 841	com/belkin/cybergarage/wrapper/UpnpDeviceList:newOptionsReset	(Ljava/lang/String;Ljava/lang/String;)Z
    //   3404: invokespecial 516	org/apache/cordova/PluginResult:<init>	(Lorg/apache/cordova/PluginResult$Status;Z)V
    //   3407: putfield 123	com/belkin/cordova/plugin/DevicePlugin:mPluginResult	Lorg/apache/cordova/PluginResult;
    //   3410: aload_0
    //   3411: getfield 123	com/belkin/cordova/plugin/DevicePlugin:mPluginResult	Lorg/apache/cordova/PluginResult;
    //   3414: iconst_0
    //   3415: invokevirtual 438	org/apache/cordova/PluginResult:setKeepCallback	(Z)V
    //   3418: aload_3
    //   3419: aload_0
    //   3420: getfield 123	com/belkin/cordova/plugin/DevicePlugin:mPluginResult	Lorg/apache/cordova/PluginResult;
    //   3423: invokevirtual 266	org/apache/cordova/CallbackContext:sendPluginResult	(Lorg/apache/cordova/PluginResult;)V
    //   3426: aload_3
    //   3427: invokevirtual 518	org/apache/cordova/CallbackContext:success	()V
    //   3430: goto -2368 -> 1062
    //   3433: ldc 16
    //   3435: new 277	java/lang/StringBuilder
    //   3438: dup
    //   3439: invokespecial 278	java/lang/StringBuilder:<init>	()V
    //   3442: ldc_w 843
    //   3445: invokevirtual 284	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   3448: aload_2
    //   3449: iconst_0
    //   3450: invokevirtual 658	org/json/JSONArray:getString	(I)Ljava/lang/String;
    //   3453: invokevirtual 284	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   3456: invokevirtual 287	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   3459: invokestatic 293	com/belkin/utils/LogUtils:infoLog	(Ljava/lang/String;Ljava/lang/String;)V
    //   3462: aload_0
    //   3463: new 251	org/apache/cordova/PluginResult
    //   3466: dup
    //   3467: getstatic 257	org/apache/cordova/PluginResult$Status:OK	Lorg/apache/cordova/PluginResult$Status;
    //   3470: aload_0
    //   3471: getfield 119	com/belkin/cordova/plugin/DevicePlugin:mUpnpDeviceList	Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;
    //   3474: aload_2
    //   3475: iconst_0
    //   3476: invokevirtual 658	org/json/JSONArray:getString	(I)Ljava/lang/String;
    //   3479: ldc_w 845
    //   3482: invokevirtual 841	com/belkin/cybergarage/wrapper/UpnpDeviceList:newOptionsReset	(Ljava/lang/String;Ljava/lang/String;)Z
    //   3485: invokespecial 516	org/apache/cordova/PluginResult:<init>	(Lorg/apache/cordova/PluginResult$Status;Z)V
    //   3488: putfield 123	com/belkin/cordova/plugin/DevicePlugin:mPluginResult	Lorg/apache/cordova/PluginResult;
    //   3491: aload_0
    //   3492: getfield 123	com/belkin/cordova/plugin/DevicePlugin:mPluginResult	Lorg/apache/cordova/PluginResult;
    //   3495: iconst_0
    //   3496: invokevirtual 438	org/apache/cordova/PluginResult:setKeepCallback	(Z)V
    //   3499: aload_3
    //   3500: aload_0
    //   3501: getfield 123	com/belkin/cordova/plugin/DevicePlugin:mPluginResult	Lorg/apache/cordova/PluginResult;
    //   3504: invokevirtual 266	org/apache/cordova/CallbackContext:sendPluginResult	(Lorg/apache/cordova/PluginResult;)V
    //   3507: aload_3
    //   3508: invokevirtual 518	org/apache/cordova/CallbackContext:success	()V
    //   3511: goto -2449 -> 1062
    //   3514: ldc 16
    //   3516: ldc_w 847
    //   3519: invokestatic 293	com/belkin/utils/LogUtils:infoLog	(Ljava/lang/String;Ljava/lang/String;)V
    //   3522: aload_0
    //   3523: new 251	org/apache/cordova/PluginResult
    //   3526: dup
    //   3527: getstatic 257	org/apache/cordova/PluginResult$Status:OK	Lorg/apache/cordova/PluginResult$Status;
    //   3530: aload_0
    //   3531: getfield 119	com/belkin/cordova/plugin/DevicePlugin:mUpnpDeviceList	Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;
    //   3534: aload_2
    //   3535: iconst_0
    //   3536: invokevirtual 658	org/json/JSONArray:getString	(I)Ljava/lang/String;
    //   3539: invokevirtual 850	com/belkin/cybergarage/wrapper/UpnpDeviceList:getWeMoSSID	(Ljava/lang/String;)Ljava/lang/String;
    //   3542: invokespecial 320	org/apache/cordova/PluginResult:<init>	(Lorg/apache/cordova/PluginResult$Status;Ljava/lang/String;)V
    //   3545: putfield 123	com/belkin/cordova/plugin/DevicePlugin:mPluginResult	Lorg/apache/cordova/PluginResult;
    //   3548: aload_0
    //   3549: getfield 123	com/belkin/cordova/plugin/DevicePlugin:mPluginResult	Lorg/apache/cordova/PluginResult;
    //   3552: iconst_0
    //   3553: invokevirtual 438	org/apache/cordova/PluginResult:setKeepCallback	(Z)V
    //   3556: aload_3
    //   3557: aload_0
    //   3558: getfield 123	com/belkin/cordova/plugin/DevicePlugin:mPluginResult	Lorg/apache/cordova/PluginResult;
    //   3561: invokevirtual 266	org/apache/cordova/CallbackContext:sendPluginResult	(Lorg/apache/cordova/PluginResult;)V
    //   3564: aload_3
    //   3565: invokevirtual 518	org/apache/cordova/CallbackContext:success	()V
    //   3568: goto -2506 -> 1062
    //   3571: aload_0
    //   3572: getfield 143	com/belkin/cordova/plugin/DevicePlugin:mNetworkUtil	Lcom/belkin/wemo/cache/utils/SDKNetworkUtils;
    //   3575: invokevirtual 853	com/belkin/wemo/cache/utils/SDKNetworkUtils:getNetworkType	()Ljava/lang/String;
    //   3578: astore -1
    //   3580: aload -1
    //   3582: ifnull +57 -> 3639
    //   3585: aload -1
    //   3587: invokevirtual 532	java/lang/String:isEmpty	()Z
    //   3590: ifne +49 -> 3639
    //   3593: aload_3
    //   3594: aload -1
    //   3596: invokevirtual 510	org/apache/cordova/CallbackContext:success	(Ljava/lang/String;)V
    //   3599: aload_0
    //   3600: new 251	org/apache/cordova/PluginResult
    //   3603: dup
    //   3604: getstatic 257	org/apache/cordova/PluginResult$Status:OK	Lorg/apache/cordova/PluginResult$Status;
    //   3607: aload_0
    //   3608: getfield 189	com/belkin/cordova/plugin/DevicePlugin:mSharePreference	Lcom/belkin/wemo/cache/utils/SharePreferences;
    //   3611: invokevirtual 856	com/belkin/wemo/cache/utils/SharePreferences:isRemoteEnabled	()Z
    //   3614: invokespecial 516	org/apache/cordova/PluginResult:<init>	(Lorg/apache/cordova/PluginResult$Status;Z)V
    //   3617: putfield 123	com/belkin/cordova/plugin/DevicePlugin:mPluginResult	Lorg/apache/cordova/PluginResult;
    //   3620: aload_0
    //   3621: getfield 123	com/belkin/cordova/plugin/DevicePlugin:mPluginResult	Lorg/apache/cordova/PluginResult;
    //   3624: iconst_0
    //   3625: invokevirtual 438	org/apache/cordova/PluginResult:setKeepCallback	(Z)V
    //   3628: aload_3
    //   3629: aload_0
    //   3630: getfield 123	com/belkin/cordova/plugin/DevicePlugin:mPluginResult	Lorg/apache/cordova/PluginResult;
    //   3633: invokevirtual 266	org/apache/cordova/CallbackContext:sendPluginResult	(Lorg/apache/cordova/PluginResult;)V
    //   3636: goto -2574 -> 1062
    //   3639: aload_3
    //   3640: ldc_w 858
    //   3643: invokevirtual 671	org/apache/cordova/CallbackContext:error	(Ljava/lang/String;)V
    //   3646: goto -47 -> 3599
    //   3649: ldc 16
    //   3651: ldc_w 860
    //   3654: invokestatic 293	com/belkin/utils/LogUtils:infoLog	(Ljava/lang/String;Ljava/lang/String;)V
    //   3657: getstatic 373	com/belkin/cordova/plugin/DevicePlugin:mContext	Landroid/content/Context;
    //   3660: invokestatic 865	com/belkin/wemo/rules/impl/WeMoRulesFactory:getInstance	(Landroid/content/Context;)Lcom/belkin/wemo/rules/IWeMoRules;
    //   3663: astore -3
    //   3665: new 867	com/belkin/cordova/plugin/DevicePlugin$FetchDevicesRulesCallback
    //   3668: dup
    //   3669: aload_0
    //   3670: aload_3
    //   3671: invokespecial 868	com/belkin/cordova/plugin/DevicePlugin$FetchDevicesRulesCallback:<init>	(Lcom/belkin/cordova/plugin/DevicePlugin;Lorg/apache/cordova/CallbackContext;)V
    //   3674: astore -2
    //   3676: aload -3
    //   3678: getstatic 373	com/belkin/cordova/plugin/DevicePlugin:mContext	Landroid/content/Context;
    //   3681: aload -2
    //   3683: aload -2
    //   3685: invokeinterface 874 4 0
    //   3690: goto -2628 -> 1062
    //   3693: ldc 16
    //   3695: ldc_w 876
    //   3698: invokestatic 293	com/belkin/utils/LogUtils:infoLog	(Ljava/lang/String;Ljava/lang/String;)V
    //   3701: new 878	com/belkin/cordova/plugin/DevicePlugin$StoreDeviceRulesCallback
    //   3704: dup
    //   3705: aload_0
    //   3706: aload_3
    //   3707: invokespecial 879	com/belkin/cordova/plugin/DevicePlugin$StoreDeviceRulesCallback:<init>	(Lcom/belkin/cordova/plugin/DevicePlugin;Lorg/apache/cordova/CallbackContext;)V
    //   3710: astore -4
    //   3712: getstatic 373	com/belkin/cordova/plugin/DevicePlugin:mContext	Landroid/content/Context;
    //   3715: invokestatic 865	com/belkin/wemo/rules/impl/WeMoRulesFactory:getInstance	(Landroid/content/Context;)Lcom/belkin/wemo/rules/IWeMoRules;
    //   3718: getstatic 373	com/belkin/cordova/plugin/DevicePlugin:mContext	Landroid/content/Context;
    //   3721: aload_0
    //   3722: getfield 115	com/belkin/cordova/plugin/DevicePlugin:weeklyRecordsHashMap	Ljava/util/HashMap;
    //   3725: aload -4
    //   3727: aload -4
    //   3729: invokeinterface 883 5 0
    //   3734: goto -2672 -> 1062
    //   3737: ldc 16
    //   3739: ldc_w 885
    //   3742: invokestatic 293	com/belkin/utils/LogUtils:infoLog	(Ljava/lang/String;Ljava/lang/String;)V
    //   3745: aload_3
    //   3746: aload_0
    //   3747: getfield 119	com/belkin/cordova/plugin/DevicePlugin:mUpnpDeviceList	Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;
    //   3750: getstatic 373	com/belkin/cordova/plugin/DevicePlugin:mContext	Landroid/content/Context;
    //   3753: invokevirtual 888	com/belkin/cybergarage/wrapper/UpnpDeviceList:getPragmaFromDB	(Landroid/content/Context;)Ljava/lang/String;
    //   3756: invokevirtual 510	org/apache/cordova/CallbackContext:success	(Ljava/lang/String;)V
    //   3759: goto -2697 -> 1062
    //   3762: ldc 16
    //   3764: new 277	java/lang/StringBuilder
    //   3767: dup
    //   3768: invokespecial 278	java/lang/StringBuilder:<init>	()V
    //   3771: ldc_w 890
    //   3774: invokevirtual 284	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   3777: aload_2
    //   3778: iconst_0
    //   3779: invokevirtual 894	org/json/JSONArray:getInt	(I)I
    //   3782: invokevirtual 478	java/lang/StringBuilder:append	(I)Ljava/lang/StringBuilder;
    //   3785: invokevirtual 287	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   3788: invokestatic 293	com/belkin/utils/LogUtils:infoLog	(Ljava/lang/String;Ljava/lang/String;)V
    //   3791: aload_0
    //   3792: getfield 119	com/belkin/cordova/plugin/DevicePlugin:mUpnpDeviceList	Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;
    //   3795: getstatic 373	com/belkin/cordova/plugin/DevicePlugin:mContext	Landroid/content/Context;
    //   3798: aload_2
    //   3799: iconst_0
    //   3800: invokevirtual 894	org/json/JSONArray:getInt	(I)I
    //   3803: invokevirtual 898	com/belkin/cybergarage/wrapper/UpnpDeviceList:setPragmaInDB	(Landroid/content/Context;I)V
    //   3806: aload_3
    //   3807: invokevirtual 518	org/apache/cordova/CallbackContext:success	()V
    //   3810: goto -2748 -> 1062
    //   3813: ldc 16
    //   3815: ldc_w 900
    //   3818: invokestatic 293	com/belkin/utils/LogUtils:infoLog	(Ljava/lang/String;Ljava/lang/String;)V
    //   3821: bipush 8
    //   3823: anewarray 297	java/lang/String
    //   3826: astore -11
    //   3828: aload -11
    //   3830: iconst_0
    //   3831: aload_2
    //   3832: bipush 7
    //   3834: invokevirtual 658	org/json/JSONArray:getString	(I)Ljava/lang/String;
    //   3837: aastore
    //   3838: iconst_0
    //   3839: istore -10
    //   3841: iconst_m1
    //   3842: aload_2
    //   3843: invokevirtual 388	org/json/JSONArray:length	()I
    //   3846: iadd
    //   3847: istore -9
    //   3849: iload -10
    //   3851: iload -9
    //   3853: if_icmpge +52 -> 3905
    //   3856: aload -11
    //   3858: iload -10
    //   3860: iconst_1
    //   3861: iadd
    //   3862: aload_2
    //   3863: iload -10
    //   3865: invokevirtual 658	org/json/JSONArray:getString	(I)Ljava/lang/String;
    //   3868: aastore
    //   3869: ldc 16
    //   3871: new 277	java/lang/StringBuilder
    //   3874: dup
    //   3875: invokespecial 278	java/lang/StringBuilder:<init>	()V
    //   3878: ldc_w 902
    //   3881: invokevirtual 284	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   3884: aload -11
    //   3886: iload -10
    //   3888: aaload
    //   3889: invokevirtual 284	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   3892: invokevirtual 287	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   3895: invokestatic 908	android/util/Log:d	(Ljava/lang/String;Ljava/lang/String;)I
    //   3898: pop
    //   3899: iinc -10 1
    //   3902: goto -61 -> 3841
    //   3905: aload_0
    //   3906: getfield 115	com/belkin/cordova/plugin/DevicePlugin:weeklyRecordsHashMap	Ljava/util/HashMap;
    //   3909: ldc_w 910
    //   3912: aload -11
    //   3914: invokevirtual 913	java/util/HashMap:put	(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    //   3917: pop
    //   3918: aload_0
    //   3919: getfield 115	com/belkin/cordova/plugin/DevicePlugin:weeklyRecordsHashMap	Ljava/util/HashMap;
    //   3922: invokevirtual 917	java/util/HashMap:entrySet	()Ljava/util/Set;
    //   3925: invokeinterface 920 1 0
    //   3930: astore -7
    //   3932: aload -7
    //   3934: invokeinterface 553 1 0
    //   3939: ifeq -2877 -> 1062
    //   3942: aload -7
    //   3944: invokeinterface 557 1 0
    //   3949: checkcast 922	java/util/Map$Entry
    //   3952: astore -6
    //   3954: ldc 16
    //   3956: new 277	java/lang/StringBuilder
    //   3959: dup
    //   3960: invokespecial 278	java/lang/StringBuilder:<init>	()V
    //   3963: ldc_w 924
    //   3966: invokevirtual 284	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   3969: aload -6
    //   3971: invokeinterface 927 1 0
    //   3976: checkcast 297	java/lang/String
    //   3979: invokevirtual 284	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   3982: ldc_w 929
    //   3985: invokevirtual 284	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   3988: aload -6
    //   3990: invokeinterface 932 1 0
    //   3995: invokevirtual 317	java/lang/StringBuilder:append	(Ljava/lang/Object;)Ljava/lang/StringBuilder;
    //   3998: invokevirtual 287	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   4001: invokestatic 293	com/belkin/utils/LogUtils:infoLog	(Ljava/lang/String;Ljava/lang/String;)V
    //   4004: goto -72 -> 3932
    //   4007: ldc 16
    //   4009: ldc_w 934
    //   4012: invokestatic 293	com/belkin/utils/LogUtils:infoLog	(Ljava/lang/String;Ljava/lang/String;)V
    //   4015: aload_0
    //   4016: getfield 115	com/belkin/cordova/plugin/DevicePlugin:weeklyRecordsHashMap	Ljava/util/HashMap;
    //   4019: invokevirtual 935	java/util/HashMap:clear	()V
    //   4022: aload_2
    //   4023: ifnull +941 -> 4964
    //   4026: aload_2
    //   4027: invokevirtual 388	org/json/JSONArray:length	()I
    //   4030: iconst_2
    //   4031: if_icmplt +933 -> 4964
    //   4034: aload_2
    //   4035: iconst_0
    //   4036: invokevirtual 658	org/json/JSONArray:getString	(I)Ljava/lang/String;
    //   4039: astore -41
    //   4041: aload_2
    //   4042: iconst_1
    //   4043: invokevirtual 658	org/json/JSONArray:getString	(I)Ljava/lang/String;
    //   4046: astore -40
    //   4048: aload -41
    //   4050: ifnull +893 -> 4943
    //   4053: aload -40
    //   4055: ifnull +888 -> 4943
    //   4058: ldc 16
    //   4060: new 277	java/lang/StringBuilder
    //   4063: dup
    //   4064: invokespecial 278	java/lang/StringBuilder:<init>	()V
    //   4067: ldc_w 937
    //   4070: invokevirtual 284	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   4073: aload -41
    //   4075: invokevirtual 681	java/lang/String:length	()I
    //   4078: invokevirtual 478	java/lang/StringBuilder:append	(I)Ljava/lang/StringBuilder;
    //   4081: invokevirtual 287	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   4084: invokestatic 293	com/belkin/utils/LogUtils:infoLog	(Ljava/lang/String;Ljava/lang/String;)V
    //   4087: ldc 16
    //   4089: new 277	java/lang/StringBuilder
    //   4092: dup
    //   4093: invokespecial 278	java/lang/StringBuilder:<init>	()V
    //   4096: ldc_w 939
    //   4099: invokevirtual 284	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   4102: aload -40
    //   4104: invokevirtual 681	java/lang/String:length	()I
    //   4107: invokevirtual 478	java/lang/StringBuilder:append	(I)Ljava/lang/StringBuilder;
    //   4110: invokevirtual 287	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   4113: invokestatic 293	com/belkin/utils/LogUtils:infoLog	(Ljava/lang/String;Ljava/lang/String;)V
    //   4116: new 394	org/json/JSONObject
    //   4119: dup
    //   4120: aload -41
    //   4122: invokespecial 574	org/json/JSONObject:<init>	(Ljava/lang/String;)V
    //   4125: astore -39
    //   4127: aload -39
    //   4129: invokevirtual 942	org/json/JSONObject:keys	()Ljava/util/Iterator;
    //   4132: astore -38
    //   4134: aload -38
    //   4136: invokeinterface 553 1 0
    //   4141: ifeq +253 -> 4394
    //   4144: aload -38
    //   4146: invokeinterface 557 1 0
    //   4151: checkcast 297	java/lang/String
    //   4154: astore -21
    //   4156: ldc 16
    //   4158: new 277	java/lang/StringBuilder
    //   4161: dup
    //   4162: invokespecial 278	java/lang/StringBuilder:<init>	()V
    //   4165: ldc_w 944
    //   4168: invokevirtual 284	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   4171: aload -21
    //   4173: invokevirtual 284	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   4176: invokevirtual 287	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   4179: invokestatic 293	com/belkin/utils/LogUtils:infoLog	(Ljava/lang/String;Ljava/lang/String;)V
    //   4182: aload -39
    //   4184: aload -21
    //   4186: invokevirtual 948	org/json/JSONObject:getJSONArray	(Ljava/lang/String;)Lorg/json/JSONArray;
    //   4189: astore -20
    //   4191: bipush 8
    //   4193: anewarray 297	java/lang/String
    //   4196: astore -19
    //   4198: aload -21
    //   4200: ldc_w 950
    //   4203: invokevirtual 624	java/lang/String:contains	(Ljava/lang/CharSequence;)Z
    //   4206: ifeq +102 -> 4308
    //   4209: iconst_0
    //   4210: istore -15
    //   4212: aload -20
    //   4214: invokevirtual 388	org/json/JSONArray:length	()I
    //   4217: bipush 7
    //   4219: invokestatic 956	java/lang/Math:min	(II)I
    //   4222: istore -14
    //   4224: iload -15
    //   4226: iload -14
    //   4228: if_icmpge +80 -> 4308
    //   4231: aload -20
    //   4233: iload -15
    //   4235: invokevirtual 658	org/json/JSONArray:getString	(I)Ljava/lang/String;
    //   4238: astore -13
    //   4240: iload -15
    //   4242: ifne +57 -> 4299
    //   4245: bipush 6
    //   4247: istore -12
    //   4249: aload -19
    //   4251: iload -12
    //   4253: aload -13
    //   4255: aastore
    //   4256: ldc 16
    //   4258: new 277	java/lang/StringBuilder
    //   4261: dup
    //   4262: invokespecial 278	java/lang/StringBuilder:<init>	()V
    //   4265: ldc_w 958
    //   4268: invokevirtual 284	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   4271: iload -12
    //   4273: invokevirtual 478	java/lang/StringBuilder:append	(I)Ljava/lang/StringBuilder;
    //   4276: ldc_w 960
    //   4279: invokevirtual 284	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   4282: aload -13
    //   4284: invokevirtual 284	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   4287: invokevirtual 287	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   4290: invokestatic 293	com/belkin/utils/LogUtils:infoLog	(Ljava/lang/String;Ljava/lang/String;)V
    //   4293: iinc -15 1
    //   4296: goto -84 -> 4212
    //   4299: iload -15
    //   4301: iconst_1
    //   4302: isub
    //   4303: istore -12
    //   4305: goto -56 -> 4249
    //   4308: aload -21
    //   4310: invokestatic 966	java/util/Locale:getDefault	()Ljava/util/Locale;
    //   4313: invokevirtual 970	java/lang/String:toLowerCase	(Ljava/util/Locale;)Ljava/lang/String;
    //   4316: ldc_w 972
    //   4319: invokevirtual 624	java/lang/String:contains	(Ljava/lang/CharSequence;)Z
    //   4322: ifeq +43 -> 4365
    //   4325: aload -21
    //   4327: invokestatic 977	com/belkin/wemo/utils/WeMoUtils:getMakerUDNComparisonString	(Ljava/lang/String;)Ljava/lang/String;
    //   4330: astore -18
    //   4332: aload -21
    //   4334: ldc_w 950
    //   4337: invokevirtual 624	java/lang/String:contains	(Ljava/lang/CharSequence;)Z
    //   4340: ifeq +32 -> 4372
    //   4343: aload -19
    //   4345: bipush 7
    //   4347: aload -21
    //   4349: aastore
    //   4350: aload_0
    //   4351: getfield 115	com/belkin/cordova/plugin/DevicePlugin:weeklyRecordsHashMap	Ljava/util/HashMap;
    //   4354: aload -18
    //   4356: aload -19
    //   4358: invokevirtual 913	java/util/HashMap:put	(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    //   4361: pop
    //   4362: goto -228 -> 4134
    //   4365: aload -21
    //   4367: astore -18
    //   4369: goto -37 -> 4332
    //   4372: aload -19
    //   4374: iconst_0
    //   4375: ldc_w 295
    //   4378: aastore
    //   4379: aload_0
    //   4380: getfield 115	com/belkin/cordova/plugin/DevicePlugin:weeklyRecordsHashMap	Ljava/util/HashMap;
    //   4383: aload -18
    //   4385: aload -19
    //   4387: invokevirtual 913	java/util/HashMap:put	(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    //   4390: pop
    //   4391: goto -257 -> 4134
    //   4394: new 394	org/json/JSONObject
    //   4397: dup
    //   4398: aload -40
    //   4400: invokespecial 574	org/json/JSONObject:<init>	(Ljava/lang/String;)V
    //   4403: astore -37
    //   4405: ldc_w 295
    //   4408: astore -36
    //   4410: aload_0
    //   4411: getfield 115	com/belkin/cordova/plugin/DevicePlugin:weeklyRecordsHashMap	Ljava/util/HashMap;
    //   4414: invokevirtual 917	java/util/HashMap:entrySet	()Ljava/util/Set;
    //   4417: invokeinterface 920 1 0
    //   4422: astore -35
    //   4424: aload -35
    //   4426: invokeinterface 553 1 0
    //   4431: ifeq +434 -> 4865
    //   4434: aload -35
    //   4436: invokeinterface 557 1 0
    //   4441: checkcast 922	java/util/Map$Entry
    //   4444: astore -33
    //   4446: aload -33
    //   4448: invokeinterface 932 1 0
    //   4453: checkcast 978	[Ljava/lang/String;
    //   4456: astore -32
    //   4458: aload -33
    //   4460: invokeinterface 927 1 0
    //   4465: checkcast 297	java/lang/String
    //   4468: astore -31
    //   4470: aload -31
    //   4472: invokestatic 966	java/util/Locale:getDefault	()Ljava/util/Locale;
    //   4475: invokevirtual 970	java/lang/String:toLowerCase	(Ljava/util/Locale;)Ljava/lang/String;
    //   4478: ldc_w 972
    //   4481: invokevirtual 624	java/lang/String:contains	(Ljava/lang/CharSequence;)Z
    //   4484: ifeq +84 -> 4568
    //   4487: ldc 16
    //   4489: ldc_w 980
    //   4492: invokestatic 293	com/belkin/utils/LogUtils:infoLog	(Ljava/lang/String;Ljava/lang/String;)V
    //   4495: aload -37
    //   4497: invokevirtual 983	org/json/JSONObject:names	()Lorg/json/JSONArray;
    //   4500: astore -25
    //   4502: aconst_null
    //   4503: astore -29
    //   4505: aload -25
    //   4507: ifnull +70 -> 4577
    //   4510: iconst_0
    //   4511: istore -24
    //   4513: aload -25
    //   4515: invokevirtual 388	org/json/JSONArray:length	()I
    //   4518: istore -23
    //   4520: iload -24
    //   4522: iload -23
    //   4524: if_icmpge +53 -> 4577
    //   4527: aload -25
    //   4529: iload -24
    //   4531: invokevirtual 796	org/json/JSONArray:get	(I)Ljava/lang/Object;
    //   4534: checkcast 297	java/lang/String
    //   4537: astore -22
    //   4539: aload -22
    //   4541: invokestatic 966	java/util/Locale:getDefault	()Ljava/util/Locale;
    //   4544: invokevirtual 970	java/lang/String:toLowerCase	(Ljava/util/Locale;)Ljava/lang/String;
    //   4547: ldc_w 972
    //   4550: invokevirtual 624	java/lang/String:contains	(Ljava/lang/CharSequence;)Z
    //   4553: ifeq +8493 -> 13046
    //   4556: aload -37
    //   4558: aload -22
    //   4560: invokevirtual 948	org/json/JSONObject:getJSONArray	(Ljava/lang/String;)Lorg/json/JSONArray;
    //   4563: astore -29
    //   4565: goto +8481 -> 13046
    //   4568: aload -37
    //   4570: aload -31
    //   4572: invokevirtual 948	org/json/JSONObject:getJSONArray	(Ljava/lang/String;)Lorg/json/JSONArray;
    //   4575: astore -29
    //   4577: aload -29
    //   4579: ifnull -155 -> 4424
    //   4582: aload -29
    //   4584: iconst_0
    //   4585: invokevirtual 658	org/json/JSONArray:getString	(I)Ljava/lang/String;
    //   4588: astore -28
    //   4590: aload -29
    //   4592: iconst_1
    //   4593: invokevirtual 658	org/json/JSONArray:getString	(I)Ljava/lang/String;
    //   4596: astore -27
    //   4598: new 277	java/lang/StringBuilder
    //   4601: dup
    //   4602: invokespecial 278	java/lang/StringBuilder:<init>	()V
    //   4605: aload -36
    //   4607: invokevirtual 284	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   4610: ldc_w 985
    //   4613: invokevirtual 284	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   4616: ldc_w 987
    //   4619: invokevirtual 284	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   4622: aload -28
    //   4624: invokevirtual 284	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   4627: ldc_w 989
    //   4630: invokevirtual 284	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   4633: ldc_w 991
    //   4636: invokevirtual 284	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   4639: aload -27
    //   4641: invokevirtual 284	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   4644: ldc_w 993
    //   4647: invokevirtual 284	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   4650: ldc_w 995
    //   4653: invokevirtual 284	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   4656: ldc_w 997
    //   4659: invokevirtual 284	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   4662: ldc_w 999
    //   4665: invokevirtual 284	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   4668: aload -32
    //   4670: iconst_0
    //   4671: aaload
    //   4672: invokevirtual 284	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   4675: ldc_w 1001
    //   4678: invokevirtual 284	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   4681: ldc_w 1003
    //   4684: invokevirtual 284	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   4687: aload -32
    //   4689: iconst_1
    //   4690: aaload
    //   4691: invokevirtual 284	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   4694: ldc_w 1005
    //   4697: invokevirtual 284	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   4700: ldc_w 1007
    //   4703: invokevirtual 284	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   4706: aload -32
    //   4708: iconst_2
    //   4709: aaload
    //   4710: invokevirtual 284	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   4713: ldc_w 1009
    //   4716: invokevirtual 284	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   4719: ldc_w 1011
    //   4722: invokevirtual 284	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   4725: aload -32
    //   4727: iconst_3
    //   4728: aaload
    //   4729: invokevirtual 284	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   4732: ldc_w 1013
    //   4735: invokevirtual 284	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   4738: ldc_w 1015
    //   4741: invokevirtual 284	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   4744: aload -32
    //   4746: iconst_4
    //   4747: aaload
    //   4748: invokevirtual 284	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   4751: ldc_w 1017
    //   4754: invokevirtual 284	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   4757: ldc_w 1019
    //   4760: invokevirtual 284	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   4763: aload -32
    //   4765: iconst_5
    //   4766: aaload
    //   4767: invokevirtual 284	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   4770: ldc_w 1021
    //   4773: invokevirtual 284	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   4776: ldc_w 1023
    //   4779: invokevirtual 284	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   4782: aload -32
    //   4784: bipush 6
    //   4786: aaload
    //   4787: invokevirtual 284	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   4790: ldc_w 1025
    //   4793: invokevirtual 284	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   4796: ldc_w 1027
    //   4799: invokevirtual 284	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   4802: ldc_w 1029
    //   4805: invokevirtual 284	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   4808: ldc_w 1031
    //   4811: invokevirtual 284	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   4814: invokevirtual 287	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   4817: astore -26
    //   4819: aload -26
    //   4821: astore -36
    //   4823: goto -399 -> 4424
    //   4826: astore -30
    //   4828: ldc 16
    //   4830: new 277	java/lang/StringBuilder
    //   4833: dup
    //   4834: invokespecial 278	java/lang/StringBuilder:<init>	()V
    //   4837: ldc_w 1033
    //   4840: invokevirtual 284	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   4843: aload -31
    //   4845: invokevirtual 284	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   4848: ldc_w 1035
    //   4851: invokevirtual 284	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   4854: invokevirtual 287	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   4857: aload -30
    //   4859: invokestatic 771	com/belkin/utils/LogUtils:errorLog	(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V
    //   4862: goto -438 -> 4424
    //   4865: new 277	java/lang/StringBuilder
    //   4868: dup
    //   4869: invokespecial 278	java/lang/StringBuilder:<init>	()V
    //   4872: ldc_w 1037
    //   4875: invokevirtual 284	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   4878: aload -36
    //   4880: invokevirtual 284	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   4883: ldc_w 1039
    //   4886: invokevirtual 284	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   4889: invokevirtual 287	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   4892: astore -34
    //   4894: ldc 16
    //   4896: new 277	java/lang/StringBuilder
    //   4899: dup
    //   4900: invokespecial 278	java/lang/StringBuilder:<init>	()V
    //   4903: ldc_w 1041
    //   4906: invokevirtual 284	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   4909: aload -34
    //   4911: invokevirtual 284	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   4914: invokevirtual 287	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   4917: invokestatic 293	com/belkin/utils/LogUtils:infoLog	(Ljava/lang/String;Ljava/lang/String;)V
    //   4920: aload_3
    //   4921: ifnull -3859 -> 1062
    //   4924: aload_3
    //   4925: new 251	org/apache/cordova/PluginResult
    //   4928: dup
    //   4929: getstatic 257	org/apache/cordova/PluginResult$Status:OK	Lorg/apache/cordova/PluginResult$Status;
    //   4932: aload -34
    //   4934: invokespecial 320	org/apache/cordova/PluginResult:<init>	(Lorg/apache/cordova/PluginResult$Status;Ljava/lang/String;)V
    //   4937: invokevirtual 266	org/apache/cordova/CallbackContext:sendPluginResult	(Lorg/apache/cordova/PluginResult;)V
    //   4940: goto -3878 -> 1062
    //   4943: aload_3
    //   4944: ifnull -3882 -> 1062
    //   4947: aload_3
    //   4948: new 251	org/apache/cordova/PluginResult
    //   4951: dup
    //   4952: getstatic 314	org/apache/cordova/PluginResult$Status:ERROR	Lorg/apache/cordova/PluginResult$Status;
    //   4955: invokespecial 582	org/apache/cordova/PluginResult:<init>	(Lorg/apache/cordova/PluginResult$Status;)V
    //   4958: invokevirtual 266	org/apache/cordova/CallbackContext:sendPluginResult	(Lorg/apache/cordova/PluginResult;)V
    //   4961: goto -3899 -> 1062
    //   4964: aload_3
    //   4965: ifnull -3903 -> 1062
    //   4968: aload_3
    //   4969: new 251	org/apache/cordova/PluginResult
    //   4972: dup
    //   4973: getstatic 314	org/apache/cordova/PluginResult$Status:ERROR	Lorg/apache/cordova/PluginResult$Status;
    //   4976: invokespecial 582	org/apache/cordova/PluginResult:<init>	(Lorg/apache/cordova/PluginResult$Status;)V
    //   4979: invokevirtual 266	org/apache/cordova/CallbackContext:sendPluginResult	(Lorg/apache/cordova/PluginResult;)V
    //   4982: goto -3920 -> 1062
    //   4985: ldc 16
    //   4987: ldc_w 1043
    //   4990: invokestatic 293	com/belkin/utils/LogUtils:infoLog	(Ljava/lang/String;Ljava/lang/String;)V
    //   4993: aload_2
    //   4994: iconst_0
    //   4995: invokevirtual 658	org/json/JSONArray:getString	(I)Ljava/lang/String;
    //   4998: astore -60
    //   5000: ldc 16
    //   5002: new 277	java/lang/StringBuilder
    //   5005: dup
    //   5006: invokespecial 278	java/lang/StringBuilder:<init>	()V
    //   5009: ldc_w 937
    //   5012: invokevirtual 284	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   5015: aload -60
    //   5017: invokevirtual 681	java/lang/String:length	()I
    //   5020: invokevirtual 478	java/lang/StringBuilder:append	(I)Ljava/lang/StringBuilder;
    //   5023: invokevirtual 287	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   5026: invokestatic 293	com/belkin/utils/LogUtils:infoLog	(Ljava/lang/String;Ljava/lang/String;)V
    //   5029: new 394	org/json/JSONObject
    //   5032: dup
    //   5033: aload -60
    //   5035: invokespecial 574	org/json/JSONObject:<init>	(Ljava/lang/String;)V
    //   5038: astore -59
    //   5040: aload -59
    //   5042: invokevirtual 942	org/json/JSONObject:keys	()Ljava/util/Iterator;
    //   5045: astore -58
    //   5047: aload -58
    //   5049: invokeinterface 553 1 0
    //   5054: ifeq +278 -> 5332
    //   5057: aload -58
    //   5059: invokeinterface 557 1 0
    //   5064: checkcast 297	java/lang/String
    //   5067: astore -51
    //   5069: ldc 16
    //   5071: new 277	java/lang/StringBuilder
    //   5074: dup
    //   5075: invokespecial 278	java/lang/StringBuilder:<init>	()V
    //   5078: ldc_w 944
    //   5081: invokevirtual 284	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   5084: aload -51
    //   5086: invokevirtual 284	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   5089: invokevirtual 287	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   5092: invokestatic 293	com/belkin/utils/LogUtils:infoLog	(Ljava/lang/String;Ljava/lang/String;)V
    //   5095: aload -59
    //   5097: aload -51
    //   5099: invokevirtual 948	org/json/JSONObject:getJSONArray	(Ljava/lang/String;)Lorg/json/JSONArray;
    //   5102: astore -50
    //   5104: bipush 8
    //   5106: anewarray 297	java/lang/String
    //   5109: astore -49
    //   5111: aload -51
    //   5113: ldc_w 950
    //   5116: invokevirtual 624	java/lang/String:contains	(Ljava/lang/CharSequence;)Z
    //   5119: ifeq +102 -> 5221
    //   5122: iconst_0
    //   5123: istore -45
    //   5125: aload -50
    //   5127: invokevirtual 388	org/json/JSONArray:length	()I
    //   5130: bipush 7
    //   5132: invokestatic 956	java/lang/Math:min	(II)I
    //   5135: istore -44
    //   5137: iload -45
    //   5139: iload -44
    //   5141: if_icmpge +80 -> 5221
    //   5144: aload -50
    //   5146: iload -45
    //   5148: invokevirtual 658	org/json/JSONArray:getString	(I)Ljava/lang/String;
    //   5151: astore -43
    //   5153: iload -45
    //   5155: ifne +57 -> 5212
    //   5158: bipush 6
    //   5160: istore -42
    //   5162: aload -49
    //   5164: iload -42
    //   5166: aload -43
    //   5168: aastore
    //   5169: ldc 16
    //   5171: new 277	java/lang/StringBuilder
    //   5174: dup
    //   5175: invokespecial 278	java/lang/StringBuilder:<init>	()V
    //   5178: ldc_w 958
    //   5181: invokevirtual 284	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   5184: iload -42
    //   5186: invokevirtual 478	java/lang/StringBuilder:append	(I)Ljava/lang/StringBuilder;
    //   5189: ldc_w 960
    //   5192: invokevirtual 284	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   5195: aload -43
    //   5197: invokevirtual 284	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   5200: invokevirtual 287	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   5203: invokestatic 293	com/belkin/utils/LogUtils:infoLog	(Ljava/lang/String;Ljava/lang/String;)V
    //   5206: iinc -45 1
    //   5209: goto -84 -> 5125
    //   5212: iload -45
    //   5214: iconst_1
    //   5215: isub
    //   5216: istore -42
    //   5218: goto -56 -> 5162
    //   5221: aload -51
    //   5223: invokestatic 966	java/util/Locale:getDefault	()Ljava/util/Locale;
    //   5226: invokevirtual 970	java/lang/String:toLowerCase	(Ljava/util/Locale;)Ljava/lang/String;
    //   5229: ldc_w 972
    //   5232: invokevirtual 624	java/lang/String:contains	(Ljava/lang/CharSequence;)Z
    //   5235: ifeq +43 -> 5278
    //   5238: aload -51
    //   5240: invokestatic 977	com/belkin/wemo/utils/WeMoUtils:getMakerUDNComparisonString	(Ljava/lang/String;)Ljava/lang/String;
    //   5243: astore -48
    //   5245: aload -51
    //   5247: ldc_w 950
    //   5250: invokevirtual 624	java/lang/String:contains	(Ljava/lang/CharSequence;)Z
    //   5253: ifeq +57 -> 5310
    //   5256: aload -49
    //   5258: bipush 7
    //   5260: aload -51
    //   5262: aastore
    //   5263: aload_0
    //   5264: getfield 115	com/belkin/cordova/plugin/DevicePlugin:weeklyRecordsHashMap	Ljava/util/HashMap;
    //   5267: aload -48
    //   5269: aload -49
    //   5271: invokevirtual 913	java/util/HashMap:put	(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    //   5274: pop
    //   5275: goto -228 -> 5047
    //   5278: aload -51
    //   5280: invokestatic 966	java/util/Locale:getDefault	()Ljava/util/Locale;
    //   5283: invokevirtual 970	java/lang/String:toLowerCase	(Ljava/util/Locale;)Ljava/lang/String;
    //   5286: ldc_w 910
    //   5289: invokevirtual 624	java/lang/String:contains	(Ljava/lang/CharSequence;)Z
    //   5292: ifeq +11 -> 5303
    //   5295: ldc_w 910
    //   5298: astore -48
    //   5300: goto -55 -> 5245
    //   5303: aload -51
    //   5305: astore -48
    //   5307: goto -62 -> 5245
    //   5310: aload -49
    //   5312: iconst_0
    //   5313: ldc_w 295
    //   5316: aastore
    //   5317: aload_0
    //   5318: getfield 115	com/belkin/cordova/plugin/DevicePlugin:weeklyRecordsHashMap	Ljava/util/HashMap;
    //   5321: aload -48
    //   5323: aload -49
    //   5325: invokevirtual 913	java/util/HashMap:put	(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    //   5328: pop
    //   5329: goto -282 -> 5047
    //   5332: aload_0
    //   5333: getfield 115	com/belkin/cordova/plugin/DevicePlugin:weeklyRecordsHashMap	Ljava/util/HashMap;
    //   5336: invokevirtual 917	java/util/HashMap:entrySet	()Ljava/util/Set;
    //   5339: invokeinterface 920 1 0
    //   5344: astore -57
    //   5346: aload -57
    //   5348: invokeinterface 553 1 0
    //   5353: ifeq +131 -> 5484
    //   5356: aload -57
    //   5358: invokeinterface 557 1 0
    //   5363: checkcast 922	java/util/Map$Entry
    //   5366: astore -56
    //   5368: ldc 16
    //   5370: new 277	java/lang/StringBuilder
    //   5373: dup
    //   5374: invokespecial 278	java/lang/StringBuilder:<init>	()V
    //   5377: ldc_w 1045
    //   5380: invokevirtual 284	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   5383: aload -56
    //   5385: invokeinterface 927 1 0
    //   5390: checkcast 297	java/lang/String
    //   5393: invokevirtual 284	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   5396: ldc_w 929
    //   5399: invokevirtual 284	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   5402: aload -56
    //   5404: invokeinterface 932 1 0
    //   5409: invokevirtual 317	java/lang/StringBuilder:append	(Ljava/lang/Object;)Ljava/lang/StringBuilder;
    //   5412: invokevirtual 287	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   5415: invokestatic 293	com/belkin/utils/LogUtils:infoLog	(Ljava/lang/String;Ljava/lang/String;)V
    //   5418: aload -56
    //   5420: invokeinterface 932 1 0
    //   5425: checkcast 978	[Ljava/lang/String;
    //   5428: astore -55
    //   5430: aload -55
    //   5432: arraylength
    //   5433: istore -54
    //   5435: iconst_0
    //   5436: istore -53
    //   5438: iload -53
    //   5440: iload -54
    //   5442: if_icmpge -96 -> 5346
    //   5445: aload -55
    //   5447: iload -53
    //   5449: aaload
    //   5450: astore -52
    //   5452: ldc 16
    //   5454: new 277	java/lang/StringBuilder
    //   5457: dup
    //   5458: invokespecial 278	java/lang/StringBuilder:<init>	()V
    //   5461: ldc_w 1047
    //   5464: invokevirtual 284	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   5467: aload -52
    //   5469: invokevirtual 284	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   5472: invokevirtual 287	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   5475: invokestatic 293	com/belkin/utils/LogUtils:infoLog	(Ljava/lang/String;Ljava/lang/String;)V
    //   5478: iinc -53 1
    //   5481: goto -43 -> 5438
    //   5484: aload_3
    //   5485: ifnull -4423 -> 1062
    //   5488: aload_3
    //   5489: new 251	org/apache/cordova/PluginResult
    //   5492: dup
    //   5493: getstatic 257	org/apache/cordova/PluginResult$Status:OK	Lorg/apache/cordova/PluginResult$Status;
    //   5496: invokespecial 582	org/apache/cordova/PluginResult:<init>	(Lorg/apache/cordova/PluginResult$Status;)V
    //   5499: invokevirtual 266	org/apache/cordova/CallbackContext:sendPluginResult	(Lorg/apache/cordova/PluginResult;)V
    //   5502: goto -4440 -> 1062
    //   5505: ldc 16
    //   5507: ldc_w 1049
    //   5510: invokestatic 293	com/belkin/utils/LogUtils:infoLog	(Ljava/lang/String;Ljava/lang/String;)V
    //   5513: aload_3
    //   5514: new 576	com/belkin/utils/RuleUtility
    //   5517: dup
    //   5518: getstatic 373	com/belkin/cordova/plugin/DevicePlugin:mContext	Landroid/content/Context;
    //   5521: invokespecial 1050	com/belkin/utils/RuleUtility:<init>	(Landroid/content/Context;)V
    //   5524: invokevirtual 1053	com/belkin/utils/RuleUtility:getDBInBase64Encoding	()Ljava/lang/String;
    //   5527: invokevirtual 510	org/apache/cordova/CallbackContext:success	(Ljava/lang/String;)V
    //   5530: goto -4468 -> 1062
    //   5533: ldc 16
    //   5535: ldc_w 1055
    //   5538: invokestatic 293	com/belkin/utils/LogUtils:infoLog	(Ljava/lang/String;Ljava/lang/String;)V
    //   5541: iconst_2
    //   5542: anewarray 297	java/lang/String
    //   5545: astore -63
    //   5547: iconst_0
    //   5548: istore -62
    //   5550: aload_2
    //   5551: invokevirtual 388	org/json/JSONArray:length	()I
    //   5554: istore -61
    //   5556: iload -62
    //   5558: iload -61
    //   5560: if_icmpge +20 -> 5580
    //   5563: aload -63
    //   5565: iload -62
    //   5567: aload_2
    //   5568: iload -62
    //   5570: invokevirtual 658	org/json/JSONArray:getString	(I)Ljava/lang/String;
    //   5573: aastore
    //   5574: iinc -62 1
    //   5577: goto -27 -> 5550
    //   5580: aload_3
    //   5581: aload_0
    //   5582: getfield 119	com/belkin/cordova/plugin/DevicePlugin:mUpnpDeviceList	Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;
    //   5585: aload -63
    //   5587: invokevirtual 1059	com/belkin/cybergarage/wrapper/UpnpDeviceList:deleteWeeklyCalendarString	([Ljava/lang/String;)Ljava/lang/String;
    //   5590: invokevirtual 510	org/apache/cordova/CallbackContext:success	(Ljava/lang/String;)V
    //   5593: goto -4531 -> 1062
    //   5596: ldc 16
    //   5598: new 277	java/lang/StringBuilder
    //   5601: dup
    //   5602: invokespecial 278	java/lang/StringBuilder:<init>	()V
    //   5605: ldc_w 1061
    //   5608: invokevirtual 284	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   5611: aload_2
    //   5612: iconst_0
    //   5613: invokevirtual 796	org/json/JSONArray:get	(I)Ljava/lang/Object;
    //   5616: invokevirtual 443	java/lang/Object:toString	()Ljava/lang/String;
    //   5619: invokevirtual 284	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   5622: invokevirtual 287	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   5625: invokestatic 1064	android/util/Log:v	(Ljava/lang/String;Ljava/lang/String;)I
    //   5628: pop
    //   5629: aload_2
    //   5630: iconst_0
    //   5631: invokevirtual 1067	org/json/JSONArray:getJSONArray	(I)Lorg/json/JSONArray;
    //   5634: astore -75
    //   5636: new 383	java/util/ArrayList
    //   5639: dup
    //   5640: invokespecial 384	java/util/ArrayList:<init>	()V
    //   5643: astore -74
    //   5645: iconst_0
    //   5646: istore -73
    //   5648: aload -75
    //   5650: invokevirtual 388	org/json/JSONArray:length	()I
    //   5653: istore -72
    //   5655: iload -73
    //   5657: iload -72
    //   5659: if_icmpge +159 -> 5818
    //   5662: aload -75
    //   5664: iload -73
    //   5666: invokevirtual 658	org/json/JSONArray:getString	(I)Ljava/lang/String;
    //   5669: astore -69
    //   5671: aload -69
    //   5673: ldc_w 1069
    //   5676: invokevirtual 624	java/lang/String:contains	(Ljava/lang/CharSequence;)Z
    //   5679: ifne +117 -> 5796
    //   5682: getstatic 373	com/belkin/cordova/plugin/DevicePlugin:mContext	Landroid/content/Context;
    //   5685: invokestatic 502	com/belkin/wemo/cache/devicelist/DeviceListManager:getInstance	(Landroid/content/Context;)Lcom/belkin/wemo/cache/devicelist/DeviceListManager;
    //   5688: aload -69
    //   5690: invokevirtual 1073	com/belkin/wemo/cache/devicelist/DeviceListManager:getDevice	(Ljava/lang/String;)Lcom/belkin/wemo/cache/data/DeviceInformation;
    //   5693: astore -67
    //   5695: aload -67
    //   5697: ifnull +60 -> 5757
    //   5700: invokestatic 1079	com/belkin/wemo/rules/RMRulesSDK:instance	()Lcom/belkin/wemo/rules/RMRulesSDK;
    //   5703: invokevirtual 1083	com/belkin/wemo/rules/RMRulesSDK:getDependencyProvider	()Lcom/belkin/wemo/rules/RMIRulesDependencyProvider;
    //   5706: invokeinterface 1089 1 0
    //   5711: aload -67
    //   5713: invokevirtual 1092	com/belkin/wemo/cache/data/DeviceInformation:getFirmwareVersion	()Ljava/lang/String;
    //   5716: invokeinterface 1097 2 0
    //   5721: sipush 10600
    //   5724: if_icmpge +19 -> 5743
    //   5727: aload -74
    //   5729: aload -69
    //   5731: invokeinterface 1098 2 0
    //   5736: pop
    //   5737: iinc -73 1
    //   5740: goto -92 -> 5648
    //   5743: aload -74
    //   5745: ldc_w 295
    //   5748: invokeinterface 1098 2 0
    //   5753: pop
    //   5754: goto -17 -> 5737
    //   5757: ldc 16
    //   5759: new 277	java/lang/StringBuilder
    //   5762: dup
    //   5763: invokespecial 278	java/lang/StringBuilder:<init>	()V
    //   5766: ldc_w 1100
    //   5769: invokevirtual 284	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   5772: aload -69
    //   5774: invokevirtual 284	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   5777: invokevirtual 287	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   5780: invokestatic 787	com/belkin/utils/LogUtils:errorLog	(Ljava/lang/String;Ljava/lang/String;)V
    //   5783: aload -74
    //   5785: aload -69
    //   5787: invokeinterface 1098 2 0
    //   5792: pop
    //   5793: goto -56 -> 5737
    //   5796: ldc 16
    //   5798: ldc_w 1102
    //   5801: invokestatic 1105	com/belkin/utils/LogUtils:debugLog	(Ljava/lang/String;Ljava/lang/String;)V
    //   5804: aload -74
    //   5806: ldc_w 295
    //   5809: invokeinterface 1098 2 0
    //   5814: pop
    //   5815: goto -78 -> 5737
    //   5818: aload -74
    //   5820: aload -74
    //   5822: invokeinterface 1106 1 0
    //   5827: anewarray 297	java/lang/String
    //   5830: invokeinterface 1110 2 0
    //   5835: checkcast 978	[Ljava/lang/String;
    //   5838: astore -71
    //   5840: new 91	org/json/JSONArray
    //   5843: dup
    //   5844: aload -74
    //   5846: invokespecial 1113	org/json/JSONArray:<init>	(Ljava/util/Collection;)V
    //   5849: astore -70
    //   5851: ldc 16
    //   5853: new 277	java/lang/StringBuilder
    //   5856: dup
    //   5857: invokespecial 278	java/lang/StringBuilder:<init>	()V
    //   5860: ldc_w 1115
    //   5863: invokevirtual 284	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   5866: aload -70
    //   5868: invokevirtual 1116	org/json/JSONArray:toString	()Ljava/lang/String;
    //   5871: invokevirtual 284	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   5874: invokevirtual 287	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   5877: invokestatic 293	com/belkin/utils/LogUtils:infoLog	(Ljava/lang/String;Ljava/lang/String;)V
    //   5880: invokestatic 486	com/belkin/wemo/cache/utils/NetworkMode:isLocal	()Z
    //   5883: ifeq +41 -> 5924
    //   5886: aload_0
    //   5887: getfield 119	com/belkin/cordova/plugin/DevicePlugin:mUpnpDeviceList	Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;
    //   5890: aload -71
    //   5892: invokevirtual 1120	com/belkin/cybergarage/wrapper/UpnpDeviceList:simulatedRuleDataAction	([Ljava/lang/String;)Z
    //   5895: ifeq +12 -> 5907
    //   5898: aload_3
    //   5899: aload -70
    //   5901: invokevirtual 1122	org/apache/cordova/CallbackContext:success	(Lorg/json/JSONArray;)V
    //   5904: goto -4842 -> 1062
    //   5907: aload_3
    //   5908: new 251	org/apache/cordova/PluginResult
    //   5911: dup
    //   5912: getstatic 314	org/apache/cordova/PluginResult$Status:ERROR	Lorg/apache/cordova/PluginResult$Status;
    //   5915: invokespecial 582	org/apache/cordova/PluginResult:<init>	(Lorg/apache/cordova/PluginResult$Status;)V
    //   5918: invokevirtual 266	org/apache/cordova/CallbackContext:sendPluginResult	(Lorg/apache/cordova/PluginResult;)V
    //   5921: goto -4859 -> 1062
    //   5924: new 1124	com/belkin/wemo/cache/cloud/CloudRequestManager
    //   5927: dup
    //   5928: getstatic 373	com/belkin/cordova/plugin/DevicePlugin:mContext	Landroid/content/Context;
    //   5931: invokespecial 1125	com/belkin/wemo/cache/cloud/CloudRequestManager:<init>	(Landroid/content/Context;)V
    //   5934: new 1127	com/belkin/wemo/cache/cloud/CloudRequestSimulatedRuleData
    //   5937: dup
    //   5938: getstatic 373	com/belkin/cordova/plugin/DevicePlugin:mContext	Landroid/content/Context;
    //   5941: aload -71
    //   5943: new 1129	com/belkin/cordova/plugin/DevicePlugin$8
    //   5946: dup
    //   5947: aload_0
    //   5948: aload_3
    //   5949: aload -70
    //   5951: invokespecial 1132	com/belkin/cordova/plugin/DevicePlugin$8:<init>	(Lcom/belkin/cordova/plugin/DevicePlugin;Lorg/apache/cordova/CallbackContext;Lorg/json/JSONArray;)V
    //   5954: invokespecial 1135	com/belkin/wemo/cache/cloud/CloudRequestSimulatedRuleData:<init>	(Landroid/content/Context;[Ljava/lang/String;Lcom/belkin/wemo/cache/cloud/listener/OnRequestCompleteListener;)V
    //   5957: invokevirtual 1139	com/belkin/wemo/cache/cloud/CloudRequestManager:makeRequest	(Lcom/belkin/wemo/cache/cloud/CloudRequestInterface;)V
    //   5960: goto -4898 -> 1062
    //   5963: ldc 16
    //   5965: ldc_w 1141
    //   5968: invokestatic 293	com/belkin/utils/LogUtils:infoLog	(Ljava/lang/String;Ljava/lang/String;)V
    //   5971: iconst_4
    //   5972: anewarray 297	java/lang/String
    //   5975: astore -79
    //   5977: iconst_0
    //   5978: istore -78
    //   5980: aload_2
    //   5981: invokevirtual 388	org/json/JSONArray:length	()I
    //   5984: istore -77
    //   5986: iload -78
    //   5988: iload -77
    //   5990: if_icmpge +26 -> 6016
    //   5993: iload -78
    //   5995: iconst_4
    //   5996: if_icmpge +20 -> 6016
    //   5999: aload -79
    //   6001: iload -78
    //   6003: aload_2
    //   6004: iload -78
    //   6006: invokevirtual 658	org/json/JSONArray:getString	(I)Ljava/lang/String;
    //   6009: aastore
    //   6010: iinc -78 1
    //   6013: goto -33 -> 5980
    //   6016: aload_3
    //   6017: aload_0
    //   6018: getfield 119	com/belkin/cordova/plugin/DevicePlugin:mUpnpDeviceList	Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;
    //   6021: aload -79
    //   6023: invokevirtual 1144	com/belkin/cybergarage/wrapper/UpnpDeviceList:setNotifyMessage	([Ljava/lang/String;)Ljava/lang/String;
    //   6026: invokevirtual 510	org/apache/cordova/CallbackContext:success	(Ljava/lang/String;)V
    //   6029: goto -4967 -> 1062
    //   6032: ldc 16
    //   6034: ldc_w 1146
    //   6037: invokestatic 293	com/belkin/utils/LogUtils:infoLog	(Ljava/lang/String;Ljava/lang/String;)V
    //   6040: iconst_2
    //   6041: anewarray 297	java/lang/String
    //   6044: astore -82
    //   6046: iconst_0
    //   6047: istore -81
    //   6049: aload_2
    //   6050: invokevirtual 388	org/json/JSONArray:length	()I
    //   6053: istore -80
    //   6055: iload -81
    //   6057: iload -80
    //   6059: if_icmpge +26 -> 6085
    //   6062: iload -81
    //   6064: iconst_2
    //   6065: if_icmpge +20 -> 6085
    //   6068: aload -82
    //   6070: iload -81
    //   6072: aload_2
    //   6073: iload -81
    //   6075: invokevirtual 658	org/json/JSONArray:getString	(I)Ljava/lang/String;
    //   6078: aastore
    //   6079: iinc -81 1
    //   6082: goto -33 -> 6049
    //   6085: aload_3
    //   6086: aload_0
    //   6087: getfield 119	com/belkin/cordova/plugin/DevicePlugin:mUpnpDeviceList	Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;
    //   6090: aload -82
    //   6092: invokevirtual 1149	com/belkin/cybergarage/wrapper/UpnpDeviceList:deleteNotifyRule	([Ljava/lang/String;)Ljava/lang/String;
    //   6095: invokevirtual 510	org/apache/cordova/CallbackContext:success	(Ljava/lang/String;)V
    //   6098: goto -5036 -> 1062
    //   6101: ldc 16
    //   6103: ldc_w 1151
    //   6106: invokestatic 293	com/belkin/utils/LogUtils:infoLog	(Ljava/lang/String;Ljava/lang/String;)V
    //   6109: aload_2
    //   6110: iconst_0
    //   6111: invokevirtual 658	org/json/JSONArray:getString	(I)Ljava/lang/String;
    //   6114: astore -85
    //   6116: iconst_2
    //   6117: anewarray 297	java/lang/String
    //   6120: dup
    //   6121: iconst_0
    //   6122: ldc_w 1153
    //   6125: aastore
    //   6126: dup
    //   6127: iconst_1
    //   6128: aload -85
    //   6130: aastore
    //   6131: astore -84
    //   6133: aload_0
    //   6134: getfield 115	com/belkin/cordova/plugin/DevicePlugin:weeklyRecordsHashMap	Ljava/util/HashMap;
    //   6137: aload -85
    //   6139: aload -84
    //   6141: invokevirtual 913	java/util/HashMap:put	(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    //   6144: pop
    //   6145: aload_3
    //   6146: ifnull -5084 -> 1062
    //   6149: aload_3
    //   6150: new 251	org/apache/cordova/PluginResult
    //   6153: dup
    //   6154: getstatic 257	org/apache/cordova/PluginResult$Status:OK	Lorg/apache/cordova/PluginResult$Status;
    //   6157: invokespecial 582	org/apache/cordova/PluginResult:<init>	(Lorg/apache/cordova/PluginResult$Status;)V
    //   6160: invokevirtual 266	org/apache/cordova/CallbackContext:sendPluginResult	(Lorg/apache/cordova/PluginResult;)V
    //   6163: goto -5101 -> 1062
    //   6166: ldc 16
    //   6168: ldc_w 1155
    //   6171: invokestatic 293	com/belkin/utils/LogUtils:infoLog	(Ljava/lang/String;Ljava/lang/String;)V
    //   6174: new 91	org/json/JSONArray
    //   6177: dup
    //   6178: invokespecial 92	org/json/JSONArray:<init>	()V
    //   6181: astore -93
    //   6183: getstatic 78	com/belkin/cordova/plugin/DevicePlugin:mDLM	Lcom/belkin/wemo/cache/devicelist/DeviceListManager;
    //   6186: invokevirtual 544	com/belkin/wemo/cache/devicelist/DeviceListManager:getDeviceInformation	()Ljava/util/ArrayList;
    //   6189: invokevirtual 548	java/util/ArrayList:iterator	()Ljava/util/Iterator;
    //   6192: astore -92
    //   6194: aload -92
    //   6196: invokeinterface 553 1 0
    //   6201: ifeq +113 -> 6314
    //   6204: aload -92
    //   6206: invokeinterface 557 1 0
    //   6211: checkcast 559	com/belkin/wemo/cache/data/DeviceInformation
    //   6214: astore -91
    //   6216: new 394	org/json/JSONObject
    //   6219: dup
    //   6220: invokespecial 425	org/json/JSONObject:<init>	()V
    //   6223: astore -90
    //   6225: aload -91
    //   6227: invokevirtual 603	com/belkin/wemo/cache/data/DeviceInformation:getType	()Ljava/lang/String;
    //   6230: ldc_w 1157
    //   6233: invokevirtual 1160	java/lang/String:equalsIgnoreCase	(Ljava/lang/String;)Z
    //   6236: ifne +17 -> 6253
    //   6239: aload -91
    //   6241: invokevirtual 603	com/belkin/wemo/cache/data/DeviceInformation:getType	()Ljava/lang/String;
    //   6244: ldc_w 1162
    //   6247: invokevirtual 1160	java/lang/String:equalsIgnoreCase	(Ljava/lang/String;)Z
    //   6250: ifeq -56 -> 6194
    //   6253: aload -91
    //   6255: invokevirtual 562	com/belkin/wemo/cache/data/DeviceInformation:getInActive	()I
    //   6258: ifne -64 -> 6194
    //   6261: aload -90
    //   6263: ldc_w 595
    //   6266: aload -91
    //   6268: invokevirtual 598	com/belkin/wemo/cache/data/DeviceInformation:getFriendlyName	()Ljava/lang/String;
    //   6271: invokevirtual 430	org/json/JSONObject:put	(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    //   6274: pop
    //   6275: aload -90
    //   6277: ldc_w 605
    //   6280: aload -91
    //   6282: invokevirtual 567	com/belkin/wemo/cache/data/DeviceInformation:getUDN	()Ljava/lang/String;
    //   6285: invokevirtual 430	org/json/JSONObject:put	(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    //   6288: pop
    //   6289: aload -90
    //   6291: ldc_w 1164
    //   6294: aload -91
    //   6296: invokevirtual 1167	com/belkin/wemo/cache/data/DeviceInformation:getProductName	()Ljava/lang/String;
    //   6299: invokevirtual 430	org/json/JSONObject:put	(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    //   6302: pop
    //   6303: aload -93
    //   6305: aload -90
    //   6307: invokevirtual 249	org/json/JSONArray:put	(Ljava/lang/Object;)Lorg/json/JSONArray;
    //   6310: pop
    //   6311: goto -117 -> 6194
    //   6314: ldc 16
    //   6316: new 277	java/lang/StringBuilder
    //   6319: dup
    //   6320: invokespecial 278	java/lang/StringBuilder:<init>	()V
    //   6323: ldc_w 1169
    //   6326: invokevirtual 284	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   6329: aload -93
    //   6331: invokevirtual 1116	org/json/JSONArray:toString	()Ljava/lang/String;
    //   6334: invokevirtual 284	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   6337: invokevirtual 287	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   6340: invokestatic 1105	com/belkin/utils/LogUtils:debugLog	(Ljava/lang/String;Ljava/lang/String;)V
    //   6343: aload_3
    //   6344: aload -93
    //   6346: invokevirtual 1122	org/apache/cordova/CallbackContext:success	(Lorg/json/JSONArray;)V
    //   6349: goto -5287 -> 1062
    //   6352: ldc 16
    //   6354: ldc_w 1171
    //   6357: invokestatic 293	com/belkin/utils/LogUtils:infoLog	(Ljava/lang/String;Ljava/lang/String;)V
    //   6360: new 91	org/json/JSONArray
    //   6363: dup
    //   6364: invokespecial 92	org/json/JSONArray:<init>	()V
    //   6367: astore -101
    //   6369: getstatic 78	com/belkin/cordova/plugin/DevicePlugin:mDLM	Lcom/belkin/wemo/cache/devicelist/DeviceListManager;
    //   6372: invokevirtual 544	com/belkin/wemo/cache/devicelist/DeviceListManager:getDeviceInformation	()Ljava/util/ArrayList;
    //   6375: invokevirtual 548	java/util/ArrayList:iterator	()Ljava/util/Iterator;
    //   6378: astore -100
    //   6380: aload -100
    //   6382: invokeinterface 553 1 0
    //   6387: ifeq +99 -> 6486
    //   6390: aload -100
    //   6392: invokeinterface 557 1 0
    //   6397: checkcast 559	com/belkin/wemo/cache/data/DeviceInformation
    //   6400: astore -99
    //   6402: new 394	org/json/JSONObject
    //   6405: dup
    //   6406: invokespecial 425	org/json/JSONObject:<init>	()V
    //   6409: astore -98
    //   6411: aload -99
    //   6413: invokevirtual 603	com/belkin/wemo/cache/data/DeviceInformation:getType	()Ljava/lang/String;
    //   6416: ldc_w 1162
    //   6419: invokevirtual 1160	java/lang/String:equalsIgnoreCase	(Ljava/lang/String;)Z
    //   6422: ifeq -42 -> 6380
    //   6425: aload -99
    //   6427: invokevirtual 562	com/belkin/wemo/cache/data/DeviceInformation:getInActive	()I
    //   6430: ifne -50 -> 6380
    //   6433: aload -98
    //   6435: ldc_w 595
    //   6438: aload -99
    //   6440: invokevirtual 598	com/belkin/wemo/cache/data/DeviceInformation:getFriendlyName	()Ljava/lang/String;
    //   6443: invokevirtual 430	org/json/JSONObject:put	(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    //   6446: pop
    //   6447: aload -98
    //   6449: ldc_w 605
    //   6452: aload -99
    //   6454: invokevirtual 567	com/belkin/wemo/cache/data/DeviceInformation:getUDN	()Ljava/lang/String;
    //   6457: invokevirtual 430	org/json/JSONObject:put	(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    //   6460: pop
    //   6461: aload -98
    //   6463: ldc_w 1164
    //   6466: aload -99
    //   6468: invokevirtual 1167	com/belkin/wemo/cache/data/DeviceInformation:getProductName	()Ljava/lang/String;
    //   6471: invokevirtual 430	org/json/JSONObject:put	(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    //   6474: pop
    //   6475: aload -101
    //   6477: aload -98
    //   6479: invokevirtual 249	org/json/JSONArray:put	(Ljava/lang/Object;)Lorg/json/JSONArray;
    //   6482: pop
    //   6483: goto -103 -> 6380
    //   6486: ldc 16
    //   6488: new 277	java/lang/StringBuilder
    //   6491: dup
    //   6492: invokespecial 278	java/lang/StringBuilder:<init>	()V
    //   6495: ldc_w 1173
    //   6498: invokevirtual 284	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   6501: aload -101
    //   6503: invokevirtual 1116	org/json/JSONArray:toString	()Ljava/lang/String;
    //   6506: invokevirtual 284	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   6509: invokevirtual 287	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   6512: invokestatic 1105	com/belkin/utils/LogUtils:debugLog	(Ljava/lang/String;Ljava/lang/String;)V
    //   6515: aload_3
    //   6516: aload -101
    //   6518: invokevirtual 1122	org/apache/cordova/CallbackContext:success	(Lorg/json/JSONArray;)V
    //   6521: goto -5459 -> 1062
    //   6524: ldc 16
    //   6526: ldc_w 1175
    //   6529: invokestatic 293	com/belkin/utils/LogUtils:infoLog	(Ljava/lang/String;Ljava/lang/String;)V
    //   6532: new 91	org/json/JSONArray
    //   6535: dup
    //   6536: invokespecial 92	org/json/JSONArray:<init>	()V
    //   6539: astore -110
    //   6541: getstatic 373	com/belkin/cordova/plugin/DevicePlugin:mContext	Landroid/content/Context;
    //   6544: invokestatic 502	com/belkin/wemo/cache/devicelist/DeviceListManager:getInstance	(Landroid/content/Context;)Lcom/belkin/wemo/cache/devicelist/DeviceListManager;
    //   6547: invokevirtual 544	com/belkin/wemo/cache/devicelist/DeviceListManager:getDeviceInformation	()Ljava/util/ArrayList;
    //   6550: invokevirtual 548	java/util/ArrayList:iterator	()Ljava/util/Iterator;
    //   6553: astore -109
    //   6555: aload -109
    //   6557: invokeinterface 553 1 0
    //   6562: ifeq +151 -> 6713
    //   6565: aload -109
    //   6567: invokeinterface 557 1 0
    //   6572: checkcast 559	com/belkin/wemo/cache/data/DeviceInformation
    //   6575: astore -108
    //   6577: aload -108
    //   6579: invokevirtual 603	com/belkin/wemo/cache/data/DeviceInformation:getType	()Ljava/lang/String;
    //   6582: ldc_w 1162
    //   6585: invokevirtual 1160	java/lang/String:equalsIgnoreCase	(Ljava/lang/String;)Z
    //   6588: ifeq -33 -> 6555
    //   6591: aload -108
    //   6593: invokevirtual 562	com/belkin/wemo/cache/data/DeviceInformation:getInActive	()I
    //   6596: ifne -41 -> 6555
    //   6599: aload -108
    //   6601: invokestatic 1181	com/belkin/wemo/rules/util/RuleUtility:isLongPressRuleSupportedLS	(Lcom/belkin/wemo/cache/data/DeviceInformation;)Z
    //   6604: istore -107
    //   6606: ldc 16
    //   6608: new 277	java/lang/StringBuilder
    //   6611: dup
    //   6612: invokespecial 278	java/lang/StringBuilder:<init>	()V
    //   6615: ldc_w 1183
    //   6618: invokevirtual 284	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   6621: aload -108
    //   6623: invokevirtual 567	com/belkin/wemo/cache/data/DeviceInformation:getUDN	()Ljava/lang/String;
    //   6626: invokevirtual 284	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   6629: ldc_w 1185
    //   6632: invokevirtual 284	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   6635: iload -107
    //   6637: invokevirtual 489	java/lang/StringBuilder:append	(Z)Ljava/lang/StringBuilder;
    //   6640: invokevirtual 287	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   6643: invokestatic 1105	com/belkin/utils/LogUtils:debugLog	(Ljava/lang/String;Ljava/lang/String;)V
    //   6646: iload -107
    //   6648: ifeq -93 -> 6555
    //   6651: new 394	org/json/JSONObject
    //   6654: dup
    //   6655: invokespecial 425	org/json/JSONObject:<init>	()V
    //   6658: astore -106
    //   6660: aload -106
    //   6662: ldc_w 595
    //   6665: aload -108
    //   6667: invokevirtual 598	com/belkin/wemo/cache/data/DeviceInformation:getFriendlyName	()Ljava/lang/String;
    //   6670: invokevirtual 430	org/json/JSONObject:put	(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    //   6673: pop
    //   6674: aload -106
    //   6676: ldc_w 605
    //   6679: aload -108
    //   6681: invokevirtual 567	com/belkin/wemo/cache/data/DeviceInformation:getUDN	()Ljava/lang/String;
    //   6684: invokevirtual 430	org/json/JSONObject:put	(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    //   6687: pop
    //   6688: aload -106
    //   6690: ldc_w 1164
    //   6693: aload -108
    //   6695: invokevirtual 1167	com/belkin/wemo/cache/data/DeviceInformation:getProductName	()Ljava/lang/String;
    //   6698: invokevirtual 430	org/json/JSONObject:put	(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    //   6701: pop
    //   6702: aload -110
    //   6704: aload -106
    //   6706: invokevirtual 249	org/json/JSONArray:put	(Ljava/lang/Object;)Lorg/json/JSONArray;
    //   6709: pop
    //   6710: goto -155 -> 6555
    //   6713: ldc 16
    //   6715: new 277	java/lang/StringBuilder
    //   6718: dup
    //   6719: invokespecial 278	java/lang/StringBuilder:<init>	()V
    //   6722: ldc_w 1187
    //   6725: invokevirtual 284	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   6728: aload -110
    //   6730: invokevirtual 1116	org/json/JSONArray:toString	()Ljava/lang/String;
    //   6733: invokevirtual 284	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   6736: invokevirtual 287	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   6739: invokestatic 1105	com/belkin/utils/LogUtils:debugLog	(Ljava/lang/String;Ljava/lang/String;)V
    //   6742: aload_3
    //   6743: aload -110
    //   6745: invokevirtual 1122	org/apache/cordova/CallbackContext:success	(Lorg/json/JSONArray;)V
    //   6748: goto -5686 -> 1062
    //   6751: ldc 16
    //   6753: ldc_w 1189
    //   6756: invokestatic 293	com/belkin/utils/LogUtils:infoLog	(Ljava/lang/String;Ljava/lang/String;)V
    //   6759: new 91	org/json/JSONArray
    //   6762: dup
    //   6763: invokespecial 92	org/json/JSONArray:<init>	()V
    //   6766: astore -118
    //   6768: getstatic 78	com/belkin/cordova/plugin/DevicePlugin:mDLM	Lcom/belkin/wemo/cache/devicelist/DeviceListManager;
    //   6771: invokevirtual 544	com/belkin/wemo/cache/devicelist/DeviceListManager:getDeviceInformation	()Ljava/util/ArrayList;
    //   6774: invokevirtual 548	java/util/ArrayList:iterator	()Ljava/util/Iterator;
    //   6777: astore -117
    //   6779: aload -117
    //   6781: invokeinterface 553 1 0
    //   6786: ifeq +99 -> 6885
    //   6789: aload -117
    //   6791: invokeinterface 557 1 0
    //   6796: checkcast 559	com/belkin/wemo/cache/data/DeviceInformation
    //   6799: astore -116
    //   6801: new 394	org/json/JSONObject
    //   6804: dup
    //   6805: invokespecial 425	org/json/JSONObject:<init>	()V
    //   6808: astore -115
    //   6810: aload -116
    //   6812: invokevirtual 603	com/belkin/wemo/cache/data/DeviceInformation:getType	()Ljava/lang/String;
    //   6815: ldc_w 1191
    //   6818: invokevirtual 1160	java/lang/String:equalsIgnoreCase	(Ljava/lang/String;)Z
    //   6821: ifeq -42 -> 6779
    //   6824: aload -116
    //   6826: invokevirtual 562	com/belkin/wemo/cache/data/DeviceInformation:getInActive	()I
    //   6829: ifne -50 -> 6779
    //   6832: aload -115
    //   6834: ldc_w 595
    //   6837: aload -116
    //   6839: invokevirtual 598	com/belkin/wemo/cache/data/DeviceInformation:getFriendlyName	()Ljava/lang/String;
    //   6842: invokevirtual 430	org/json/JSONObject:put	(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    //   6845: pop
    //   6846: aload -115
    //   6848: ldc_w 605
    //   6851: aload -116
    //   6853: invokevirtual 567	com/belkin/wemo/cache/data/DeviceInformation:getUDN	()Ljava/lang/String;
    //   6856: invokevirtual 430	org/json/JSONObject:put	(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    //   6859: pop
    //   6860: aload -115
    //   6862: ldc_w 1164
    //   6865: aload -116
    //   6867: invokevirtual 1167	com/belkin/wemo/cache/data/DeviceInformation:getProductName	()Ljava/lang/String;
    //   6870: invokevirtual 430	org/json/JSONObject:put	(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    //   6873: pop
    //   6874: aload -118
    //   6876: aload -115
    //   6878: invokevirtual 249	org/json/JSONArray:put	(Ljava/lang/Object;)Lorg/json/JSONArray;
    //   6881: pop
    //   6882: goto -103 -> 6779
    //   6885: ldc 16
    //   6887: new 277	java/lang/StringBuilder
    //   6890: dup
    //   6891: invokespecial 278	java/lang/StringBuilder:<init>	()V
    //   6894: ldc_w 1193
    //   6897: invokevirtual 284	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   6900: aload -118
    //   6902: invokevirtual 1116	org/json/JSONArray:toString	()Ljava/lang/String;
    //   6905: invokevirtual 284	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   6908: invokevirtual 287	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   6911: invokestatic 1105	com/belkin/utils/LogUtils:debugLog	(Ljava/lang/String;Ljava/lang/String;)V
    //   6914: aload_3
    //   6915: aload -118
    //   6917: invokevirtual 1122	org/apache/cordova/CallbackContext:success	(Lorg/json/JSONArray;)V
    //   6920: goto -5858 -> 1062
    //   6923: ldc 16
    //   6925: ldc_w 1195
    //   6928: invokestatic 293	com/belkin/utils/LogUtils:infoLog	(Ljava/lang/String;Ljava/lang/String;)V
    //   6931: new 91	org/json/JSONArray
    //   6934: dup
    //   6935: invokespecial 92	org/json/JSONArray:<init>	()V
    //   6938: astore -126
    //   6940: getstatic 78	com/belkin/cordova/plugin/DevicePlugin:mDLM	Lcom/belkin/wemo/cache/devicelist/DeviceListManager;
    //   6943: invokevirtual 544	com/belkin/wemo/cache/devicelist/DeviceListManager:getDeviceInformation	()Ljava/util/ArrayList;
    //   6946: invokevirtual 548	java/util/ArrayList:iterator	()Ljava/util/Iterator;
    //   6949: astore -125
    //   6951: aload -125
    //   6953: invokeinterface 553 1 0
    //   6958: ifeq +113 -> 7071
    //   6961: aload -125
    //   6963: invokeinterface 557 1 0
    //   6968: checkcast 559	com/belkin/wemo/cache/data/DeviceInformation
    //   6971: astore -124
    //   6973: new 394	org/json/JSONObject
    //   6976: dup
    //   6977: invokespecial 425	org/json/JSONObject:<init>	()V
    //   6980: astore -123
    //   6982: aload -124
    //   6984: invokevirtual 603	com/belkin/wemo/cache/data/DeviceInformation:getType	()Ljava/lang/String;
    //   6987: ldc_w 1197
    //   6990: invokevirtual 1160	java/lang/String:equalsIgnoreCase	(Ljava/lang/String;)Z
    //   6993: ifne +17 -> 7010
    //   6996: aload -124
    //   6998: invokevirtual 603	com/belkin/wemo/cache/data/DeviceInformation:getType	()Ljava/lang/String;
    //   7001: ldc_w 1199
    //   7004: invokevirtual 1160	java/lang/String:equalsIgnoreCase	(Ljava/lang/String;)Z
    //   7007: ifeq -56 -> 6951
    //   7010: aload -124
    //   7012: invokevirtual 562	com/belkin/wemo/cache/data/DeviceInformation:getInActive	()I
    //   7015: ifne -64 -> 6951
    //   7018: aload -123
    //   7020: ldc_w 595
    //   7023: aload -124
    //   7025: invokevirtual 598	com/belkin/wemo/cache/data/DeviceInformation:getFriendlyName	()Ljava/lang/String;
    //   7028: invokevirtual 430	org/json/JSONObject:put	(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    //   7031: pop
    //   7032: aload -123
    //   7034: ldc_w 605
    //   7037: aload -124
    //   7039: invokevirtual 567	com/belkin/wemo/cache/data/DeviceInformation:getUDN	()Ljava/lang/String;
    //   7042: invokevirtual 430	org/json/JSONObject:put	(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    //   7045: pop
    //   7046: aload -123
    //   7048: ldc_w 1164
    //   7051: aload -124
    //   7053: invokevirtual 1167	com/belkin/wemo/cache/data/DeviceInformation:getProductName	()Ljava/lang/String;
    //   7056: invokevirtual 430	org/json/JSONObject:put	(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    //   7059: pop
    //   7060: aload -126
    //   7062: aload -123
    //   7064: invokevirtual 249	org/json/JSONArray:put	(Ljava/lang/Object;)Lorg/json/JSONArray;
    //   7067: pop
    //   7068: goto -117 -> 6951
    //   7071: ldc 16
    //   7073: new 277	java/lang/StringBuilder
    //   7076: dup
    //   7077: invokespecial 278	java/lang/StringBuilder:<init>	()V
    //   7080: ldc_w 1201
    //   7083: invokevirtual 284	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   7086: aload -126
    //   7088: invokevirtual 1116	org/json/JSONArray:toString	()Ljava/lang/String;
    //   7091: invokevirtual 284	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   7094: invokevirtual 287	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   7097: invokestatic 1105	com/belkin/utils/LogUtils:debugLog	(Ljava/lang/String;Ljava/lang/String;)V
    //   7100: aload_3
    //   7101: aload -126
    //   7103: invokevirtual 1122	org/apache/cordova/CallbackContext:success	(Lorg/json/JSONArray;)V
    //   7106: goto -6044 -> 1062
    //   7109: ldc 16
    //   7111: ldc_w 1203
    //   7114: invokestatic 293	com/belkin/utils/LogUtils:infoLog	(Ljava/lang/String;Ljava/lang/String;)V
    //   7117: new 91	org/json/JSONArray
    //   7120: dup
    //   7121: invokespecial 92	org/json/JSONArray:<init>	()V
    //   7124: astore 122
    //   7126: getstatic 78	com/belkin/cordova/plugin/DevicePlugin:mDLM	Lcom/belkin/wemo/cache/devicelist/DeviceListManager;
    //   7129: invokevirtual 544	com/belkin/wemo/cache/devicelist/DeviceListManager:getDeviceInformation	()Ljava/util/ArrayList;
    //   7132: invokevirtual 548	java/util/ArrayList:iterator	()Ljava/util/Iterator;
    //   7135: astore 123
    //   7137: aload 123
    //   7139: invokeinterface 553 1 0
    //   7144: ifeq +99 -> 7243
    //   7147: aload 123
    //   7149: invokeinterface 557 1 0
    //   7154: checkcast 559	com/belkin/wemo/cache/data/DeviceInformation
    //   7157: astore 124
    //   7159: new 394	org/json/JSONObject
    //   7162: dup
    //   7163: invokespecial 425	org/json/JSONObject:<init>	()V
    //   7166: astore 125
    //   7168: aload 124
    //   7170: invokevirtual 603	com/belkin/wemo/cache/data/DeviceInformation:getType	()Ljava/lang/String;
    //   7173: ldc_w 1205
    //   7176: invokevirtual 1160	java/lang/String:equalsIgnoreCase	(Ljava/lang/String;)Z
    //   7179: ifeq -42 -> 7137
    //   7182: aload 124
    //   7184: invokevirtual 562	com/belkin/wemo/cache/data/DeviceInformation:getInActive	()I
    //   7187: ifne -50 -> 7137
    //   7190: aload 125
    //   7192: ldc_w 595
    //   7195: aload 124
    //   7197: invokevirtual 598	com/belkin/wemo/cache/data/DeviceInformation:getFriendlyName	()Ljava/lang/String;
    //   7200: invokevirtual 430	org/json/JSONObject:put	(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    //   7203: pop
    //   7204: aload 125
    //   7206: ldc_w 605
    //   7209: aload 124
    //   7211: invokevirtual 567	com/belkin/wemo/cache/data/DeviceInformation:getUDN	()Ljava/lang/String;
    //   7214: invokevirtual 430	org/json/JSONObject:put	(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    //   7217: pop
    //   7218: aload 125
    //   7220: ldc_w 1164
    //   7223: aload 124
    //   7225: invokevirtual 1167	com/belkin/wemo/cache/data/DeviceInformation:getProductName	()Ljava/lang/String;
    //   7228: invokevirtual 430	org/json/JSONObject:put	(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    //   7231: pop
    //   7232: aload 122
    //   7234: aload 125
    //   7236: invokevirtual 249	org/json/JSONArray:put	(Ljava/lang/Object;)Lorg/json/JSONArray;
    //   7239: pop
    //   7240: goto -103 -> 7137
    //   7243: ldc 16
    //   7245: new 277	java/lang/StringBuilder
    //   7248: dup
    //   7249: invokespecial 278	java/lang/StringBuilder:<init>	()V
    //   7252: ldc_w 1207
    //   7255: invokevirtual 284	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   7258: aload 122
    //   7260: invokevirtual 1116	org/json/JSONArray:toString	()Ljava/lang/String;
    //   7263: invokevirtual 284	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   7266: invokevirtual 287	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   7269: invokestatic 1105	com/belkin/utils/LogUtils:debugLog	(Ljava/lang/String;Ljava/lang/String;)V
    //   7272: aload_3
    //   7273: aload 122
    //   7275: invokevirtual 1122	org/apache/cordova/CallbackContext:success	(Lorg/json/JSONArray;)V
    //   7278: goto -6216 -> 1062
    //   7281: ldc 16
    //   7283: ldc_w 1209
    //   7286: invokestatic 293	com/belkin/utils/LogUtils:infoLog	(Ljava/lang/String;Ljava/lang/String;)V
    //   7289: new 91	org/json/JSONArray
    //   7292: dup
    //   7293: invokespecial 92	org/json/JSONArray:<init>	()V
    //   7296: astore 108
    //   7298: getstatic 78	com/belkin/cordova/plugin/DevicePlugin:mDLM	Lcom/belkin/wemo/cache/devicelist/DeviceListManager;
    //   7301: invokevirtual 544	com/belkin/wemo/cache/devicelist/DeviceListManager:getDeviceInformation	()Ljava/util/ArrayList;
    //   7304: invokevirtual 548	java/util/ArrayList:iterator	()Ljava/util/Iterator;
    //   7307: astore 109
    //   7309: aload 109
    //   7311: invokeinterface 553 1 0
    //   7316: ifeq +264 -> 7580
    //   7319: aload 109
    //   7321: invokeinterface 557 1 0
    //   7326: checkcast 559	com/belkin/wemo/cache/data/DeviceInformation
    //   7329: astore 110
    //   7331: aload 110
    //   7333: invokevirtual 603	com/belkin/wemo/cache/data/DeviceInformation:getType	()Ljava/lang/String;
    //   7336: ldc_w 1211
    //   7339: invokevirtual 1160	java/lang/String:equalsIgnoreCase	(Ljava/lang/String;)Z
    //   7342: ifeq -33 -> 7309
    //   7345: aload 110
    //   7347: invokevirtual 562	com/belkin/wemo/cache/data/DeviceInformation:getInActive	()I
    //   7350: ifne -41 -> 7309
    //   7353: new 394	org/json/JSONObject
    //   7356: dup
    //   7357: invokespecial 425	org/json/JSONObject:<init>	()V
    //   7360: astore 111
    //   7362: ldc 16
    //   7364: new 277	java/lang/StringBuilder
    //   7367: dup
    //   7368: invokespecial 278	java/lang/StringBuilder:<init>	()V
    //   7371: ldc_w 1213
    //   7374: invokevirtual 284	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   7377: aload 110
    //   7379: invokevirtual 1092	com/belkin/wemo/cache/data/DeviceInformation:getFirmwareVersion	()Ljava/lang/String;
    //   7382: invokevirtual 284	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   7385: invokevirtual 287	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   7388: invokestatic 293	com/belkin/utils/LogUtils:infoLog	(Ljava/lang/String;Ljava/lang/String;)V
    //   7391: aload 110
    //   7393: invokevirtual 1092	com/belkin/wemo/cache/data/DeviceInformation:getFirmwareVersion	()Ljava/lang/String;
    //   7396: astore 112
    //   7398: aload 112
    //   7400: ifnull +68 -> 7468
    //   7403: aload 112
    //   7405: ldc_w 295
    //   7408: if_acmpeq +60 -> 7468
    //   7411: aload 112
    //   7413: ldc_w 1215
    //   7416: invokevirtual 1219	java/lang/String:split	(Ljava/lang/String;)[Ljava/lang/String;
    //   7419: astore 120
    //   7421: aload 111
    //   7423: ldc_w 1221
    //   7426: aload 120
    //   7428: iconst_2
    //   7429: aaload
    //   7430: invokestatic 473	java/lang/Integer:parseInt	(Ljava/lang/String;)I
    //   7433: invokevirtual 613	org/json/JSONObject:put	(Ljava/lang/String;I)Lorg/json/JSONObject;
    //   7436: pop
    //   7437: ldc 16
    //   7439: new 277	java/lang/StringBuilder
    //   7442: dup
    //   7443: invokespecial 278	java/lang/StringBuilder:<init>	()V
    //   7446: ldc_w 1223
    //   7449: invokevirtual 284	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   7452: aload 120
    //   7454: iconst_2
    //   7455: aaload
    //   7456: invokestatic 473	java/lang/Integer:parseInt	(Ljava/lang/String;)I
    //   7459: invokevirtual 478	java/lang/StringBuilder:append	(I)Ljava/lang/StringBuilder;
    //   7462: invokevirtual 287	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   7465: invokestatic 293	com/belkin/utils/LogUtils:infoLog	(Ljava/lang/String;Ljava/lang/String;)V
    //   7468: aload 111
    //   7470: ldc_w 595
    //   7473: aload 110
    //   7475: invokevirtual 598	com/belkin/wemo/cache/data/DeviceInformation:getFriendlyName	()Ljava/lang/String;
    //   7478: invokevirtual 430	org/json/JSONObject:put	(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    //   7481: pop
    //   7482: aload 111
    //   7484: ldc_w 605
    //   7487: aload 110
    //   7489: invokevirtual 567	com/belkin/wemo/cache/data/DeviceInformation:getUDN	()Ljava/lang/String;
    //   7492: invokevirtual 430	org/json/JSONObject:put	(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    //   7495: pop
    //   7496: aload 110
    //   7498: invokevirtual 638	com/belkin/wemo/cache/data/DeviceInformation:getAttributeList	()Lorg/json/JSONObject;
    //   7501: astore 115
    //   7503: aload 111
    //   7505: ldc_w 1225
    //   7508: aload 115
    //   7510: ldc_w 1227
    //   7513: invokevirtual 757	org/json/JSONObject:get	(Ljava/lang/String;)Ljava/lang/Object;
    //   7516: checkcast 394	org/json/JSONObject
    //   7519: ldc_w 1229
    //   7522: invokevirtual 757	org/json/JSONObject:get	(Ljava/lang/String;)Ljava/lang/Object;
    //   7525: invokevirtual 430	org/json/JSONObject:put	(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    //   7528: pop
    //   7529: aload 111
    //   7531: ldc_w 1231
    //   7534: aload 115
    //   7536: ldc_w 1233
    //   7539: invokevirtual 757	org/json/JSONObject:get	(Ljava/lang/String;)Ljava/lang/Object;
    //   7542: checkcast 394	org/json/JSONObject
    //   7545: ldc_w 1229
    //   7548: invokevirtual 757	org/json/JSONObject:get	(Ljava/lang/String;)Ljava/lang/Object;
    //   7551: invokevirtual 430	org/json/JSONObject:put	(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    //   7554: pop
    //   7555: aload 111
    //   7557: ldc_w 1164
    //   7560: aload 110
    //   7562: invokevirtual 1167	com/belkin/wemo/cache/data/DeviceInformation:getProductName	()Ljava/lang/String;
    //   7565: invokevirtual 430	org/json/JSONObject:put	(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    //   7568: pop
    //   7569: aload 108
    //   7571: aload 111
    //   7573: invokevirtual 249	org/json/JSONArray:put	(Ljava/lang/Object;)Lorg/json/JSONArray;
    //   7576: pop
    //   7577: goto -268 -> 7309
    //   7580: ldc 16
    //   7582: new 277	java/lang/StringBuilder
    //   7585: dup
    //   7586: invokespecial 278	java/lang/StringBuilder:<init>	()V
    //   7589: ldc_w 1235
    //   7592: invokevirtual 284	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   7595: aload 108
    //   7597: invokevirtual 1116	org/json/JSONArray:toString	()Ljava/lang/String;
    //   7600: invokevirtual 284	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   7603: invokevirtual 287	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   7606: invokestatic 1105	com/belkin/utils/LogUtils:debugLog	(Ljava/lang/String;Ljava/lang/String;)V
    //   7609: aload_3
    //   7610: aload 108
    //   7612: invokevirtual 1122	org/apache/cordova/CallbackContext:success	(Lorg/json/JSONArray;)V
    //   7615: goto -6553 -> 1062
    //   7618: ldc 16
    //   7620: ldc_w 1237
    //   7623: invokestatic 293	com/belkin/utils/LogUtils:infoLog	(Ljava/lang/String;Ljava/lang/String;)V
    //   7626: aload_2
    //   7627: ifnull +137 -> 7764
    //   7630: aload_2
    //   7631: invokevirtual 388	org/json/JSONArray:length	()I
    //   7634: iconst_1
    //   7635: if_icmplt +129 -> 7764
    //   7638: aload_2
    //   7639: iconst_0
    //   7640: invokevirtual 392	org/json/JSONArray:getJSONObject	(I)Lorg/json/JSONObject;
    //   7643: ldc_w 605
    //   7646: invokevirtual 1239	org/json/JSONObject:getString	(Ljava/lang/String;)Ljava/lang/String;
    //   7649: astore 104
    //   7651: getstatic 78	com/belkin/cordova/plugin/DevicePlugin:mDLM	Lcom/belkin/wemo/cache/devicelist/DeviceListManager;
    //   7654: aload 104
    //   7656: invokevirtual 1073	com/belkin/wemo/cache/devicelist/DeviceListManager:getDevice	(Ljava/lang/String;)Lcom/belkin/wemo/cache/data/DeviceInformation;
    //   7659: astore 105
    //   7661: aload 105
    //   7663: ifnull +63 -> 7726
    //   7666: invokestatic 1079	com/belkin/wemo/rules/RMRulesSDK:instance	()Lcom/belkin/wemo/rules/RMRulesSDK;
    //   7669: invokevirtual 1083	com/belkin/wemo/rules/RMRulesSDK:getDependencyProvider	()Lcom/belkin/wemo/rules/RMIRulesDependencyProvider;
    //   7672: invokeinterface 1089 1 0
    //   7677: aload 105
    //   7679: invokevirtual 1092	com/belkin/wemo/cache/data/DeviceInformation:getFirmwareVersion	()Ljava/lang/String;
    //   7682: invokeinterface 1097 2 0
    //   7687: istore 106
    //   7689: iconst_0
    //   7690: istore 107
    //   7692: iload 106
    //   7694: sipush 10600
    //   7697: if_icmplt +6 -> 7703
    //   7700: iconst_1
    //   7701: istore 107
    //   7703: aload_3
    //   7704: ifnull -6642 -> 1062
    //   7707: aload_3
    //   7708: new 251	org/apache/cordova/PluginResult
    //   7711: dup
    //   7712: getstatic 257	org/apache/cordova/PluginResult$Status:OK	Lorg/apache/cordova/PluginResult$Status;
    //   7715: iload 107
    //   7717: invokespecial 1242	org/apache/cordova/PluginResult:<init>	(Lorg/apache/cordova/PluginResult$Status;I)V
    //   7720: invokevirtual 266	org/apache/cordova/CallbackContext:sendPluginResult	(Lorg/apache/cordova/PluginResult;)V
    //   7723: goto -6661 -> 1062
    //   7726: aload_3
    //   7727: new 251	org/apache/cordova/PluginResult
    //   7730: dup
    //   7731: getstatic 314	org/apache/cordova/PluginResult$Status:ERROR	Lorg/apache/cordova/PluginResult$Status;
    //   7734: new 277	java/lang/StringBuilder
    //   7737: dup
    //   7738: invokespecial 278	java/lang/StringBuilder:<init>	()V
    //   7741: ldc_w 1244
    //   7744: invokevirtual 284	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   7747: aload 104
    //   7749: invokevirtual 284	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   7752: invokevirtual 287	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   7755: invokespecial 320	org/apache/cordova/PluginResult:<init>	(Lorg/apache/cordova/PluginResult$Status;Ljava/lang/String;)V
    //   7758: invokevirtual 266	org/apache/cordova/CallbackContext:sendPluginResult	(Lorg/apache/cordova/PluginResult;)V
    //   7761: goto -6699 -> 1062
    //   7764: aload_3
    //   7765: new 251	org/apache/cordova/PluginResult
    //   7768: dup
    //   7769: getstatic 314	org/apache/cordova/PluginResult$Status:ERROR	Lorg/apache/cordova/PluginResult$Status;
    //   7772: ldc_w 1246
    //   7775: invokespecial 320	org/apache/cordova/PluginResult:<init>	(Lorg/apache/cordova/PluginResult$Status;Ljava/lang/String;)V
    //   7778: invokevirtual 266	org/apache/cordova/CallbackContext:sendPluginResult	(Lorg/apache/cordova/PluginResult;)V
    //   7781: goto -6719 -> 1062
    //   7784: new 1248	com/belkin/cordova/plugin/DevicePlugin$9
    //   7787: dup
    //   7788: aload_0
    //   7789: aload_3
    //   7790: invokespecial 1249	com/belkin/cordova/plugin/DevicePlugin$9:<init>	(Lcom/belkin/cordova/plugin/DevicePlugin;Lorg/apache/cordova/CallbackContext;)V
    //   7793: invokestatic 526	com/belkin/wemo/thread/WeMoThreadPoolHandler:executeInBackground	(Ljava/lang/Runnable;)V
    //   7796: goto -6734 -> 1062
    //   7799: aload_0
    //   7800: getfield 189	com/belkin/cordova/plugin/DevicePlugin:mSharePreference	Lcom/belkin/wemo/cache/utils/SharePreferences;
    //   7803: invokevirtual 1252	com/belkin/wemo/cache/utils/SharePreferences:getHomeSSIDs	()Ljava/util/Set;
    //   7806: astore 94
    //   7808: new 91	org/json/JSONArray
    //   7811: dup
    //   7812: invokespecial 92	org/json/JSONArray:<init>	()V
    //   7815: astore 95
    //   7817: aload 95
    //   7819: aload_0
    //   7820: getfield 193	com/belkin/cordova/plugin/DevicePlugin:mWiFiSecurityUtil	Lcom/belkin/utils/WiFiSecurityUtil;
    //   7823: getstatic 373	com/belkin/cordova/plugin/DevicePlugin:mContext	Landroid/content/Context;
    //   7826: invokevirtual 1255	com/belkin/utils/WiFiSecurityUtil:getDeviceID	(Landroid/content/Context;)Ljava/lang/String;
    //   7829: invokevirtual 249	org/json/JSONArray:put	(Ljava/lang/Object;)Lorg/json/JSONArray;
    //   7832: pop
    //   7833: aload 95
    //   7835: aload_0
    //   7836: getfield 189	com/belkin/cordova/plugin/DevicePlugin:mSharePreference	Lcom/belkin/wemo/cache/utils/SharePreferences;
    //   7839: invokevirtual 856	com/belkin/wemo/cache/utils/SharePreferences:isRemoteEnabled	()Z
    //   7842: invokevirtual 240	org/json/JSONArray:put	(Z)Lorg/json/JSONArray;
    //   7845: pop
    //   7846: aload_0
    //   7847: getfield 189	com/belkin/cordova/plugin/DevicePlugin:mSharePreference	Lcom/belkin/wemo/cache/utils/SharePreferences;
    //   7850: invokevirtual 1258	com/belkin/wemo/cache/utils/SharePreferences:getRemoteAccessSSID	()Ljava/lang/String;
    //   7853: astore 98
    //   7855: aload 98
    //   7857: ifnull +11 -> 7868
    //   7860: aload 98
    //   7862: invokevirtual 532	java/lang/String:isEmpty	()Z
    //   7865: ifeq +34 -> 7899
    //   7868: aload 94
    //   7870: invokeinterface 920 1 0
    //   7875: astore 99
    //   7877: aload 99
    //   7879: invokeinterface 553 1 0
    //   7884: ifeq +15 -> 7899
    //   7887: aload 99
    //   7889: invokeinterface 557 1 0
    //   7894: checkcast 297	java/lang/String
    //   7897: astore 98
    //   7899: aload 95
    //   7901: aload 98
    //   7903: invokevirtual 249	org/json/JSONArray:put	(Ljava/lang/Object;)Lorg/json/JSONArray;
    //   7906: pop
    //   7907: aload 95
    //   7909: aload_0
    //   7910: getfield 189	com/belkin/cordova/plugin/DevicePlugin:mSharePreference	Lcom/belkin/wemo/cache/utils/SharePreferences;
    //   7913: invokevirtual 1261	com/belkin/wemo/cache/utils/SharePreferences:getHomeId	()Ljava/lang/String;
    //   7916: invokevirtual 249	org/json/JSONArray:put	(Ljava/lang/Object;)Lorg/json/JSONArray;
    //   7919: pop
    //   7920: aload 95
    //   7922: iload 5
    //   7924: invokevirtual 240	org/json/JSONArray:put	(Z)Lorg/json/JSONArray;
    //   7927: pop
    //   7928: aload 95
    //   7930: getstatic 82	com/belkin/cordova/plugin/DevicePlugin:isRemoteEnableGoing	Z
    //   7933: invokevirtual 240	org/json/JSONArray:put	(Z)Lorg/json/JSONArray;
    //   7936: pop
    //   7937: aload_3
    //   7938: aload 95
    //   7940: invokevirtual 1122	org/apache/cordova/CallbackContext:success	(Lorg/json/JSONArray;)V
    //   7943: iconst_1
    //   7944: ireturn
    //   7945: aload_2
    //   7946: ifnull +45 -> 7991
    //   7949: aload_2
    //   7950: invokevirtual 388	org/json/JSONArray:length	()I
    //   7953: iconst_2
    //   7954: if_icmplt +37 -> 7991
    //   7957: aload_2
    //   7958: iconst_1
    //   7959: invokevirtual 658	org/json/JSONArray:getString	(I)Ljava/lang/String;
    //   7962: ldc_w 1263
    //   7965: invokevirtual 1219	java/lang/String:split	(Ljava/lang/String;)[Ljava/lang/String;
    //   7968: astore 93
    //   7970: getstatic 373	com/belkin/cordova/plugin/DevicePlugin:mContext	Landroid/content/Context;
    //   7973: aload 93
    //   7975: new 1265	com/belkin/cordova/plugin/DevicePlugin$10
    //   7978: dup
    //   7979: aload_0
    //   7980: aload_3
    //   7981: invokespecial 1266	com/belkin/cordova/plugin/DevicePlugin$10:<init>	(Lcom/belkin/cordova/plugin/DevicePlugin;Lorg/apache/cordova/CallbackContext;)V
    //   7984: aconst_null
    //   7985: invokestatic 1272	com/belkin/rules/utils/WeeklyCalenderStringsHandler:getScheduleJSONObject	(Landroid/content/Context;[Ljava/lang/String;Lcom/belkin/rules/utils/WeeklyCalenderStringsHandler$AllDevicesScheduleStringSuccessCallback;Lcom/belkin/rules/utils/WeeklyCalenderStringsHandler$AllDevicesScheduleStringErrorCallback;)V
    //   7988: goto -6926 -> 1062
    //   7991: aload_3
    //   7992: ifnull -6930 -> 1062
    //   7995: aload_3
    //   7996: new 251	org/apache/cordova/PluginResult
    //   7999: dup
    //   8000: getstatic 314	org/apache/cordova/PluginResult$Status:ERROR	Lorg/apache/cordova/PluginResult$Status;
    //   8003: invokespecial 582	org/apache/cordova/PluginResult:<init>	(Lorg/apache/cordova/PluginResult$Status;)V
    //   8006: invokevirtual 266	org/apache/cordova/CallbackContext:sendPluginResult	(Lorg/apache/cordova/PluginResult;)V
    //   8009: goto -6947 -> 1062
    //   8012: aload_2
    //   8013: ifnull +45 -> 8058
    //   8016: aload_2
    //   8017: invokevirtual 388	org/json/JSONArray:length	()I
    //   8020: iconst_2
    //   8021: if_icmplt +37 -> 8058
    //   8024: aload_2
    //   8025: iconst_1
    //   8026: invokevirtual 658	org/json/JSONArray:getString	(I)Ljava/lang/String;
    //   8029: ldc_w 1263
    //   8032: invokevirtual 1219	java/lang/String:split	(Ljava/lang/String;)[Ljava/lang/String;
    //   8035: astore 92
    //   8037: getstatic 373	com/belkin/cordova/plugin/DevicePlugin:mContext	Landroid/content/Context;
    //   8040: aload 92
    //   8042: new 1274	com/belkin/cordova/plugin/DevicePlugin$11
    //   8045: dup
    //   8046: aload_0
    //   8047: aload_3
    //   8048: invokespecial 1275	com/belkin/cordova/plugin/DevicePlugin$11:<init>	(Lcom/belkin/cordova/plugin/DevicePlugin;Lorg/apache/cordova/CallbackContext;)V
    //   8051: aconst_null
    //   8052: invokestatic 1278	com/belkin/rules/utils/WeeklyCalenderStringsHandler:getSensorScheduleJSONObject	(Landroid/content/Context;[Ljava/lang/String;Lcom/belkin/rules/utils/WeeklyCalenderStringsHandler$AllDevicesScheduleStringSuccessCallback;Lcom/belkin/rules/utils/WeeklyCalenderStringsHandler$AllDevicesScheduleStringErrorCallback;)V
    //   8055: goto -6993 -> 1062
    //   8058: aload_3
    //   8059: ifnull -6997 -> 1062
    //   8062: aload_3
    //   8063: new 251	org/apache/cordova/PluginResult
    //   8066: dup
    //   8067: getstatic 314	org/apache/cordova/PluginResult$Status:ERROR	Lorg/apache/cordova/PluginResult$Status;
    //   8070: invokespecial 582	org/apache/cordova/PluginResult:<init>	(Lorg/apache/cordova/PluginResult$Status;)V
    //   8073: invokevirtual 266	org/apache/cordova/CallbackContext:sendPluginResult	(Lorg/apache/cordova/PluginResult;)V
    //   8076: goto -7014 -> 1062
    //   8079: new 576	com/belkin/utils/RuleUtility
    //   8082: dup
    //   8083: getstatic 373	com/belkin/cordova/plugin/DevicePlugin:mContext	Landroid/content/Context;
    //   8086: invokespecial 1050	com/belkin/utils/RuleUtility:<init>	(Landroid/content/Context;)V
    //   8089: astore 91
    //   8091: aload_3
    //   8092: aload 91
    //   8094: invokevirtual 1281	com/belkin/utils/RuleUtility:checkCopyRawDBStatus	()Ljava/lang/String;
    //   8097: invokevirtual 510	org/apache/cordova/CallbackContext:success	(Ljava/lang/String;)V
    //   8100: goto -7038 -> 1062
    //   8103: aload_2
    //   8104: ifnull +199 -> 8303
    //   8107: aload_2
    //   8108: invokevirtual 388	org/json/JSONArray:length	()I
    //   8111: iconst_2
    //   8112: if_icmplt +191 -> 8303
    //   8115: aload_2
    //   8116: iconst_0
    //   8117: invokevirtual 658	org/json/JSONArray:getString	(I)Ljava/lang/String;
    //   8120: astore 89
    //   8122: aload_2
    //   8123: iconst_1
    //   8124: invokevirtual 658	org/json/JSONArray:getString	(I)Ljava/lang/String;
    //   8127: astore 90
    //   8129: aload 89
    //   8131: ldc_w 1283
    //   8134: invokevirtual 301	java/lang/String:equals	(Ljava/lang/Object;)Z
    //   8137: ifeq +90 -> 8227
    //   8140: new 277	java/lang/StringBuilder
    //   8143: dup
    //   8144: invokespecial 278	java/lang/StringBuilder:<init>	()V
    //   8147: invokestatic 1286	com/belkin/utils/RuleUtility:getLocalDBPath	()Ljava/lang/String;
    //   8150: invokevirtual 284	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   8153: invokestatic 1289	com/belkin/utils/RuleUtility:getLocalDBName	()Ljava/lang/String;
    //   8156: invokevirtual 284	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   8159: invokevirtual 287	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   8162: astore 89
    //   8164: aload 90
    //   8166: ldc_w 1283
    //   8169: invokevirtual 301	java/lang/String:equals	(Ljava/lang/Object;)Z
    //   8172: ifeq +93 -> 8265
    //   8175: new 277	java/lang/StringBuilder
    //   8178: dup
    //   8179: invokespecial 278	java/lang/StringBuilder:<init>	()V
    //   8182: invokestatic 1286	com/belkin/utils/RuleUtility:getLocalDBPath	()Ljava/lang/String;
    //   8185: invokevirtual 284	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   8188: invokestatic 1289	com/belkin/utils/RuleUtility:getLocalDBName	()Ljava/lang/String;
    //   8191: invokevirtual 284	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   8194: invokevirtual 287	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   8197: astore 90
    //   8199: aload 89
    //   8201: aload 90
    //   8203: invokestatic 1292	com/belkin/utils/RuleUtility:copyDBFile	(Ljava/lang/String;Ljava/lang/String;)V
    //   8206: aload_3
    //   8207: ifnull -7145 -> 1062
    //   8210: aload_3
    //   8211: new 251	org/apache/cordova/PluginResult
    //   8214: dup
    //   8215: getstatic 257	org/apache/cordova/PluginResult$Status:OK	Lorg/apache/cordova/PluginResult$Status;
    //   8218: invokespecial 582	org/apache/cordova/PluginResult:<init>	(Lorg/apache/cordova/PluginResult$Status;)V
    //   8221: invokevirtual 266	org/apache/cordova/CallbackContext:sendPluginResult	(Lorg/apache/cordova/PluginResult;)V
    //   8224: goto -7162 -> 1062
    //   8227: aload 89
    //   8229: ldc_w 1294
    //   8232: invokevirtual 301	java/lang/String:equals	(Ljava/lang/Object;)Z
    //   8235: ifeq -71 -> 8164
    //   8238: new 277	java/lang/StringBuilder
    //   8241: dup
    //   8242: invokespecial 278	java/lang/StringBuilder:<init>	()V
    //   8245: invokestatic 1286	com/belkin/utils/RuleUtility:getLocalDBPath	()Ljava/lang/String;
    //   8248: invokevirtual 284	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   8251: ldc_w 1296
    //   8254: invokevirtual 284	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   8257: invokevirtual 287	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   8260: astore 89
    //   8262: goto -98 -> 8164
    //   8265: aload 90
    //   8267: ldc_w 1294
    //   8270: invokevirtual 301	java/lang/String:equals	(Ljava/lang/Object;)Z
    //   8273: ifeq -74 -> 8199
    //   8276: new 277	java/lang/StringBuilder
    //   8279: dup
    //   8280: invokespecial 278	java/lang/StringBuilder:<init>	()V
    //   8283: invokestatic 1286	com/belkin/utils/RuleUtility:getLocalDBPath	()Ljava/lang/String;
    //   8286: invokevirtual 284	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   8289: ldc_w 1296
    //   8292: invokevirtual 284	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   8295: invokevirtual 287	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   8298: astore 90
    //   8300: goto -101 -> 8199
    //   8303: ldc 16
    //   8305: ldc_w 1298
    //   8308: invokestatic 787	com/belkin/utils/LogUtils:errorLog	(Ljava/lang/String;Ljava/lang/String;)V
    //   8311: aload_3
    //   8312: ifnull -7250 -> 1062
    //   8315: aload_3
    //   8316: new 251	org/apache/cordova/PluginResult
    //   8319: dup
    //   8320: getstatic 314	org/apache/cordova/PluginResult$Status:ERROR	Lorg/apache/cordova/PluginResult$Status;
    //   8323: invokespecial 582	org/apache/cordova/PluginResult:<init>	(Lorg/apache/cordova/PluginResult$Status;)V
    //   8326: invokevirtual 266	org/apache/cordova/CallbackContext:sendPluginResult	(Lorg/apache/cordova/PluginResult;)V
    //   8329: goto -7267 -> 1062
    //   8332: ldc 16
    //   8334: ldc_w 1300
    //   8337: invokestatic 293	com/belkin/utils/LogUtils:infoLog	(Ljava/lang/String;Ljava/lang/String;)V
    //   8340: aload_3
    //   8341: new 1302	com/belkin/wemo/cache/utils/MoreUtil
    //   8344: dup
    //   8345: invokespecial 1303	com/belkin/wemo/cache/utils/MoreUtil:<init>	()V
    //   8348: aload_0
    //   8349: getfield 189	com/belkin/cordova/plugin/DevicePlugin:mSharePreference	Lcom/belkin/wemo/cache/utils/SharePreferences;
    //   8352: invokevirtual 1307	com/belkin/wemo/cache/utils/MoreUtil:getReUnionKey	(Lcom/belkin/wemo/cache/utils/SharePreferences;)Ljava/lang/String;
    //   8355: invokevirtual 510	org/apache/cordova/CallbackContext:success	(Ljava/lang/String;)V
    //   8358: goto -7296 -> 1062
    //   8361: ldc 16
    //   8363: ldc_w 1309
    //   8366: invokestatic 293	com/belkin/utils/LogUtils:infoLog	(Ljava/lang/String;Ljava/lang/String;)V
    //   8369: aload_3
    //   8370: aload_0
    //   8371: getfield 119	com/belkin/cordova/plugin/DevicePlugin:mUpnpDeviceList	Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;
    //   8374: new 91	org/json/JSONArray
    //   8377: dup
    //   8378: invokespecial 92	org/json/JSONArray:<init>	()V
    //   8381: invokevirtual 1313	com/belkin/cybergarage/wrapper/UpnpDeviceList:getCurrentFirmwareVersion	(Lorg/json/JSONArray;)Lorg/json/JSONArray;
    //   8384: invokevirtual 1122	org/apache/cordova/CallbackContext:success	(Lorg/json/JSONArray;)V
    //   8387: goto -7325 -> 1062
    //   8390: ldc 16
    //   8392: ldc_w 1315
    //   8395: invokestatic 293	com/belkin/utils/LogUtils:infoLog	(Ljava/lang/String;Ljava/lang/String;)V
    //   8398: aload_2
    //   8399: ifnull +43 -> 8442
    //   8402: aload_2
    //   8403: invokevirtual 388	org/json/JSONArray:length	()I
    //   8406: iconst_1
    //   8407: if_icmple +35 -> 8442
    //   8410: ldc 16
    //   8412: ldc_w 1317
    //   8415: invokestatic 293	com/belkin/utils/LogUtils:infoLog	(Ljava/lang/String;Ljava/lang/String;)V
    //   8418: aload_3
    //   8419: aload_0
    //   8420: getfield 119	com/belkin/cordova/plugin/DevicePlugin:mUpnpDeviceList	Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;
    //   8423: aload_2
    //   8424: iconst_0
    //   8425: invokevirtual 658	org/json/JSONArray:getString	(I)Ljava/lang/String;
    //   8428: aload_2
    //   8429: iconst_1
    //   8430: invokevirtual 658	org/json/JSONArray:getString	(I)Ljava/lang/String;
    //   8433: invokevirtual 1321	com/belkin/cybergarage/wrapper/UpnpDeviceList:getCurrentFirmwareVersionByUDN	(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    //   8436: invokevirtual 510	org/apache/cordova/CallbackContext:success	(Ljava/lang/String;)V
    //   8439: goto -7377 -> 1062
    //   8442: ldc 16
    //   8444: ldc_w 1323
    //   8447: invokestatic 293	com/belkin/utils/LogUtils:infoLog	(Ljava/lang/String;Ljava/lang/String;)V
    //   8450: aload_3
    //   8451: aload_0
    //   8452: getfield 119	com/belkin/cordova/plugin/DevicePlugin:mUpnpDeviceList	Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;
    //   8455: aload_2
    //   8456: iconst_0
    //   8457: invokevirtual 658	org/json/JSONArray:getString	(I)Ljava/lang/String;
    //   8460: invokevirtual 1325	com/belkin/cybergarage/wrapper/UpnpDeviceList:getCurrentFirmwareVersionByUDN	(Ljava/lang/String;)Z
    //   8463: invokestatic 1330	java/lang/Boolean:toString	(Z)Ljava/lang/String;
    //   8466: invokevirtual 510	org/apache/cordova/CallbackContext:success	(Ljava/lang/String;)V
    //   8469: goto -7407 -> 1062
    //   8472: ldc 16
    //   8474: new 277	java/lang/StringBuilder
    //   8477: dup
    //   8478: invokespecial 278	java/lang/StringBuilder:<init>	()V
    //   8481: ldc_w 1332
    //   8484: invokevirtual 284	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   8487: aload_2
    //   8488: iconst_0
    //   8489: invokevirtual 658	org/json/JSONArray:getString	(I)Ljava/lang/String;
    //   8492: invokevirtual 284	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   8495: invokevirtual 287	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   8498: invokestatic 293	com/belkin/utils/LogUtils:infoLog	(Ljava/lang/String;Ljava/lang/String;)V
    //   8501: aload_3
    //   8502: aload_0
    //   8503: getfield 119	com/belkin/cordova/plugin/DevicePlugin:mUpnpDeviceList	Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;
    //   8506: aload_2
    //   8507: iconst_0
    //   8508: invokevirtual 658	org/json/JSONArray:getString	(I)Ljava/lang/String;
    //   8511: invokevirtual 1335	com/belkin/cybergarage/wrapper/UpnpDeviceList:getMakerFirmwareVersion	(Ljava/lang/String;)Z
    //   8514: invokestatic 1330	java/lang/Boolean:toString	(Z)Ljava/lang/String;
    //   8517: invokevirtual 510	org/apache/cordova/CallbackContext:success	(Ljava/lang/String;)V
    //   8520: goto -7458 -> 1062
    //   8523: ldc 16
    //   8525: ldc_w 1337
    //   8528: invokestatic 293	com/belkin/utils/LogUtils:infoLog	(Ljava/lang/String;Ljava/lang/String;)V
    //   8531: aload_3
    //   8532: aload_0
    //   8533: getfield 119	com/belkin/cordova/plugin/DevicePlugin:mUpnpDeviceList	Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;
    //   8536: aload_2
    //   8537: iconst_0
    //   8538: invokevirtual 658	org/json/JSONArray:getString	(I)Ljava/lang/String;
    //   8541: invokevirtual 1340	com/belkin/cybergarage/wrapper/UpnpDeviceList:getSOFirmwareVersionByUDN	(Ljava/lang/String;)Z
    //   8544: invokestatic 1330	java/lang/Boolean:toString	(Z)Ljava/lang/String;
    //   8547: invokevirtual 510	org/apache/cordova/CallbackContext:success	(Ljava/lang/String;)V
    //   8550: goto -7488 -> 1062
    //   8553: ldc 16
    //   8555: ldc_w 1342
    //   8558: invokestatic 293	com/belkin/utils/LogUtils:infoLog	(Ljava/lang/String;Ljava/lang/String;)V
    //   8561: aload_3
    //   8562: aload_0
    //   8563: getfield 119	com/belkin/cordova/plugin/DevicePlugin:mUpnpDeviceList	Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;
    //   8566: aload_2
    //   8567: iconst_0
    //   8568: invokevirtual 658	org/json/JSONArray:getString	(I)Ljava/lang/String;
    //   8571: invokevirtual 1345	com/belkin/cybergarage/wrapper/UpnpDeviceList:getMotionNotifyFirmwareVersionByUDN	(Ljava/lang/String;)Z
    //   8574: invokestatic 1330	java/lang/Boolean:toString	(Z)Ljava/lang/String;
    //   8577: invokevirtual 510	org/apache/cordova/CallbackContext:success	(Ljava/lang/String;)V
    //   8580: goto -7518 -> 1062
    //   8583: ldc 16
    //   8585: ldc_w 1347
    //   8588: invokestatic 293	com/belkin/utils/LogUtils:infoLog	(Ljava/lang/String;Ljava/lang/String;)V
    //   8591: aload_3
    //   8592: aload_0
    //   8593: getfield 119	com/belkin/cordova/plugin/DevicePlugin:mUpnpDeviceList	Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;
    //   8596: aload_2
    //   8597: iconst_0
    //   8598: invokevirtual 658	org/json/JSONArray:getString	(I)Ljava/lang/String;
    //   8601: invokevirtual 1350	com/belkin/cybergarage/wrapper/UpnpDeviceList:getCountdownFirmwareVersionByUDN	(Ljava/lang/String;)Z
    //   8604: invokestatic 1330	java/lang/Boolean:toString	(Z)Ljava/lang/String;
    //   8607: invokevirtual 510	org/apache/cordova/CallbackContext:success	(Ljava/lang/String;)V
    //   8610: goto -7548 -> 1062
    //   8613: ldc 16
    //   8615: ldc_w 1352
    //   8618: invokestatic 293	com/belkin/utils/LogUtils:infoLog	(Ljava/lang/String;Ljava/lang/String;)V
    //   8621: new 208	java/lang/Thread
    //   8624: dup
    //   8625: new 1354	com/belkin/cordova/plugin/DevicePlugin$12
    //   8628: dup
    //   8629: aload_0
    //   8630: iload 5
    //   8632: aload_2
    //   8633: aload_3
    //   8634: invokespecial 1357	com/belkin/cordova/plugin/DevicePlugin$12:<init>	(Lcom/belkin/cordova/plugin/DevicePlugin;ZLorg/json/JSONArray;Lorg/apache/cordova/CallbackContext;)V
    //   8637: invokespecial 215	java/lang/Thread:<init>	(Ljava/lang/Runnable;)V
    //   8640: invokevirtual 218	java/lang/Thread:start	()V
    //   8643: goto -7581 -> 1062
    //   8646: ldc 16
    //   8648: ldc_w 1359
    //   8651: invokestatic 293	com/belkin/utils/LogUtils:infoLog	(Ljava/lang/String;Ljava/lang/String;)V
    //   8654: iload 5
    //   8656: ifeq +44 -> 8700
    //   8659: aload_3
    //   8660: aload_0
    //   8661: getfield 119	com/belkin/cordova/plugin/DevicePlugin:mUpnpDeviceList	Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;
    //   8664: aload_2
    //   8665: iconst_0
    //   8666: invokevirtual 658	org/json/JSONArray:getString	(I)Ljava/lang/String;
    //   8669: aload_0
    //   8670: getfield 119	com/belkin/cordova/plugin/DevicePlugin:mUpnpDeviceList	Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;
    //   8673: aload_2
    //   8674: iconst_1
    //   8675: invokevirtual 1067	org/json/JSONArray:getJSONArray	(I)Lorg/json/JSONArray;
    //   8678: invokevirtual 1313	com/belkin/cybergarage/wrapper/UpnpDeviceList:getCurrentFirmwareVersion	(Lorg/json/JSONArray;)Lorg/json/JSONArray;
    //   8681: invokevirtual 1363	com/belkin/cybergarage/wrapper/UpnpDeviceList:firmwareUpdateList	(Ljava/lang/String;Lorg/json/JSONArray;)Lorg/json/JSONObject;
    //   8684: invokevirtual 535	org/apache/cordova/CallbackContext:success	(Lorg/json/JSONObject;)V
    //   8687: goto -7625 -> 1062
    //   8690: astore 88
    //   8692: aload 88
    //   8694: invokevirtual 311	org/json/JSONException:printStackTrace	()V
    //   8697: goto -7635 -> 1062
    //   8700: aload_3
    //   8701: aload_0
    //   8702: getfield 119	com/belkin/cordova/plugin/DevicePlugin:mUpnpDeviceList	Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;
    //   8705: aload_2
    //   8706: iconst_0
    //   8707: invokevirtual 658	org/json/JSONArray:getString	(I)Ljava/lang/String;
    //   8710: aload_2
    //   8711: iconst_1
    //   8712: invokevirtual 1067	org/json/JSONArray:getJSONArray	(I)Lorg/json/JSONArray;
    //   8715: invokevirtual 1363	com/belkin/cybergarage/wrapper/UpnpDeviceList:firmwareUpdateList	(Ljava/lang/String;Lorg/json/JSONArray;)Lorg/json/JSONObject;
    //   8718: invokevirtual 535	org/apache/cordova/CallbackContext:success	(Lorg/json/JSONObject;)V
    //   8721: goto -7659 -> 1062
    //   8724: astore 87
    //   8726: aload 87
    //   8728: invokevirtual 311	org/json/JSONException:printStackTrace	()V
    //   8731: goto -7669 -> 1062
    //   8734: new 251	org/apache/cordova/PluginResult
    //   8737: dup
    //   8738: getstatic 257	org/apache/cordova/PluginResult$Status:OK	Lorg/apache/cordova/PluginResult$Status;
    //   8741: aload_0
    //   8742: getfield 119	com/belkin/cordova/plugin/DevicePlugin:mUpnpDeviceList	Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;
    //   8745: aload_2
    //   8746: iconst_0
    //   8747: invokevirtual 658	org/json/JSONArray:getString	(I)Ljava/lang/String;
    //   8750: aload_2
    //   8751: iconst_1
    //   8752: invokevirtual 658	org/json/JSONArray:getString	(I)Ljava/lang/String;
    //   8755: aload_2
    //   8756: iconst_2
    //   8757: invokevirtual 658	org/json/JSONArray:getString	(I)Ljava/lang/String;
    //   8760: aload_2
    //   8761: iconst_3
    //   8762: invokevirtual 658	org/json/JSONArray:getString	(I)Ljava/lang/String;
    //   8765: aload_2
    //   8766: iconst_4
    //   8767: invokevirtual 658	org/json/JSONArray:getString	(I)Ljava/lang/String;
    //   8770: invokevirtual 1367	com/belkin/cybergarage/wrapper/UpnpDeviceList:updateFirmware	(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Z
    //   8773: invokespecial 516	org/apache/cordova/PluginResult:<init>	(Lorg/apache/cordova/PluginResult$Status;Z)V
    //   8776: astore 86
    //   8778: aload_0
    //   8779: aload 86
    //   8781: putfield 123	com/belkin/cordova/plugin/DevicePlugin:mPluginResult	Lorg/apache/cordova/PluginResult;
    //   8784: aload_0
    //   8785: getfield 123	com/belkin/cordova/plugin/DevicePlugin:mPluginResult	Lorg/apache/cordova/PluginResult;
    //   8788: iconst_0
    //   8789: invokevirtual 438	org/apache/cordova/PluginResult:setKeepCallback	(Z)V
    //   8792: aload_3
    //   8793: aload_0
    //   8794: getfield 123	com/belkin/cordova/plugin/DevicePlugin:mPluginResult	Lorg/apache/cordova/PluginResult;
    //   8797: invokevirtual 266	org/apache/cordova/CallbackContext:sendPluginResult	(Lorg/apache/cordova/PluginResult;)V
    //   8800: goto -7738 -> 1062
    //   8803: ldc_w 1369
    //   8806: new 277	java/lang/StringBuilder
    //   8809: dup
    //   8810: invokespecial 278	java/lang/StringBuilder:<init>	()V
    //   8813: ldc_w 1371
    //   8816: invokevirtual 284	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   8819: aload_2
    //   8820: invokevirtual 1116	org/json/JSONArray:toString	()Ljava/lang/String;
    //   8823: invokevirtual 284	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   8826: invokevirtual 287	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   8829: invokestatic 293	com/belkin/utils/LogUtils:infoLog	(Ljava/lang/String;Ljava/lang/String;)V
    //   8832: aload_2
    //   8833: invokestatic 1376	com/belkin/firmware/ZigbeeFirmwareUpdateManager:addTofirmwareUpdateQueue	(Lorg/json/JSONArray;)V
    //   8836: aload_0
    //   8837: new 251	org/apache/cordova/PluginResult
    //   8840: dup
    //   8841: getstatic 257	org/apache/cordova/PluginResult$Status:OK	Lorg/apache/cordova/PluginResult$Status;
    //   8844: invokespecial 582	org/apache/cordova/PluginResult:<init>	(Lorg/apache/cordova/PluginResult$Status;)V
    //   8847: putfield 123	com/belkin/cordova/plugin/DevicePlugin:mPluginResult	Lorg/apache/cordova/PluginResult;
    //   8850: aload_0
    //   8851: getfield 123	com/belkin/cordova/plugin/DevicePlugin:mPluginResult	Lorg/apache/cordova/PluginResult;
    //   8854: iconst_0
    //   8855: invokevirtual 438	org/apache/cordova/PluginResult:setKeepCallback	(Z)V
    //   8858: aload_3
    //   8859: aload_0
    //   8860: getfield 123	com/belkin/cordova/plugin/DevicePlugin:mPluginResult	Lorg/apache/cordova/PluginResult;
    //   8863: invokevirtual 266	org/apache/cordova/CallbackContext:sendPluginResult	(Lorg/apache/cordova/PluginResult;)V
    //   8866: goto -7804 -> 1062
    //   8869: ldc_w 1369
    //   8872: new 277	java/lang/StringBuilder
    //   8875: dup
    //   8876: invokespecial 278	java/lang/StringBuilder:<init>	()V
    //   8879: ldc_w 1378
    //   8882: invokevirtual 284	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   8885: aload_2
    //   8886: invokevirtual 1116	org/json/JSONArray:toString	()Ljava/lang/String;
    //   8889: invokevirtual 284	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   8892: invokevirtual 287	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   8895: invokestatic 293	com/belkin/utils/LogUtils:infoLog	(Ljava/lang/String;Ljava/lang/String;)V
    //   8898: aload_2
    //   8899: invokestatic 1376	com/belkin/firmware/ZigbeeFirmwareUpdateManager:addTofirmwareUpdateQueue	(Lorg/json/JSONArray;)V
    //   8902: aload_0
    //   8903: new 251	org/apache/cordova/PluginResult
    //   8906: dup
    //   8907: getstatic 257	org/apache/cordova/PluginResult$Status:OK	Lorg/apache/cordova/PluginResult$Status;
    //   8910: invokespecial 582	org/apache/cordova/PluginResult:<init>	(Lorg/apache/cordova/PluginResult$Status;)V
    //   8913: putfield 123	com/belkin/cordova/plugin/DevicePlugin:mPluginResult	Lorg/apache/cordova/PluginResult;
    //   8916: aload_0
    //   8917: getfield 123	com/belkin/cordova/plugin/DevicePlugin:mPluginResult	Lorg/apache/cordova/PluginResult;
    //   8920: iconst_0
    //   8921: invokevirtual 438	org/apache/cordova/PluginResult:setKeepCallback	(Z)V
    //   8924: aload_3
    //   8925: aload_0
    //   8926: getfield 123	com/belkin/cordova/plugin/DevicePlugin:mPluginResult	Lorg/apache/cordova/PluginResult;
    //   8929: invokevirtual 266	org/apache/cordova/CallbackContext:sendPluginResult	(Lorg/apache/cordova/PluginResult;)V
    //   8932: goto -7870 -> 1062
    //   8935: ldc_w 1369
    //   8938: new 277	java/lang/StringBuilder
    //   8941: dup
    //   8942: invokespecial 278	java/lang/StringBuilder:<init>	()V
    //   8945: ldc_w 1380
    //   8948: invokevirtual 284	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   8951: aload_2
    //   8952: invokevirtual 1116	org/json/JSONArray:toString	()Ljava/lang/String;
    //   8955: invokevirtual 284	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   8958: invokevirtual 287	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   8961: invokestatic 293	com/belkin/utils/LogUtils:infoLog	(Ljava/lang/String;Ljava/lang/String;)V
    //   8964: aload_2
    //   8965: iconst_1
    //   8966: invokevirtual 658	org/json/JSONArray:getString	(I)Ljava/lang/String;
    //   8969: astore 85
    //   8971: ldc_w 1369
    //   8974: new 277	java/lang/StringBuilder
    //   8977: dup
    //   8978: invokespecial 278	java/lang/StringBuilder:<init>	()V
    //   8981: ldc_w 1382
    //   8984: invokevirtual 284	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   8987: aload 85
    //   8989: invokevirtual 284	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   8992: invokevirtual 287	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   8995: invokestatic 293	com/belkin/utils/LogUtils:infoLog	(Ljava/lang/String;Ljava/lang/String;)V
    //   8998: ldc_w 1369
    //   9001: new 277	java/lang/StringBuilder
    //   9004: dup
    //   9005: invokespecial 278	java/lang/StringBuilder:<init>	()V
    //   9008: ldc_w 1384
    //   9011: invokevirtual 284	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   9014: getstatic 1387	com/belkin/firmware/ZigbeeFirmwareUpdateManager:currentlyUpdating	Ljava/lang/String;
    //   9017: invokevirtual 284	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   9020: invokevirtual 287	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   9023: invokestatic 293	com/belkin/utils/LogUtils:infoLog	(Ljava/lang/String;Ljava/lang/String;)V
    //   9026: getstatic 1387	com/belkin/firmware/ZigbeeFirmwareUpdateManager:currentlyUpdating	Ljava/lang/String;
    //   9029: aload 85
    //   9031: invokevirtual 1160	java/lang/String:equalsIgnoreCase	(Ljava/lang/String;)Z
    //   9034: ifeq +18 -> 9052
    //   9037: aload 85
    //   9039: aload_2
    //   9040: iconst_0
    //   9041: invokevirtual 658	org/json/JSONArray:getString	(I)Ljava/lang/String;
    //   9044: aload_2
    //   9045: iconst_2
    //   9046: invokevirtual 658	org/json/JSONArray:getString	(I)Ljava/lang/String;
    //   9049: invokestatic 1390	com/belkin/firmware/ZigbeeFirmwareUpdateManager:updateUpgradeStatus	(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    //   9052: aload_0
    //   9053: new 251	org/apache/cordova/PluginResult
    //   9056: dup
    //   9057: getstatic 257	org/apache/cordova/PluginResult$Status:OK	Lorg/apache/cordova/PluginResult$Status;
    //   9060: invokespecial 582	org/apache/cordova/PluginResult:<init>	(Lorg/apache/cordova/PluginResult$Status;)V
    //   9063: putfield 123	com/belkin/cordova/plugin/DevicePlugin:mPluginResult	Lorg/apache/cordova/PluginResult;
    //   9066: aload_0
    //   9067: getfield 123	com/belkin/cordova/plugin/DevicePlugin:mPluginResult	Lorg/apache/cordova/PluginResult;
    //   9070: iconst_0
    //   9071: invokevirtual 438	org/apache/cordova/PluginResult:setKeepCallback	(Z)V
    //   9074: aload_3
    //   9075: aload_0
    //   9076: getfield 123	com/belkin/cordova/plugin/DevicePlugin:mPluginResult	Lorg/apache/cordova/PluginResult;
    //   9079: invokevirtual 266	org/apache/cordova/CallbackContext:sendPluginResult	(Lorg/apache/cordova/PluginResult;)V
    //   9082: goto -8020 -> 1062
    //   9085: ldc 16
    //   9087: ldc_w 1392
    //   9090: invokestatic 1105	com/belkin/utils/LogUtils:debugLog	(Ljava/lang/String;Ljava/lang/String;)V
    //   9093: aload_2
    //   9094: iconst_0
    //   9095: invokevirtual 658	org/json/JSONArray:getString	(I)Ljava/lang/String;
    //   9098: astore 79
    //   9100: aload_2
    //   9101: iconst_1
    //   9102: invokevirtual 658	org/json/JSONArray:getString	(I)Ljava/lang/String;
    //   9105: astore 80
    //   9107: ldc 16
    //   9109: new 277	java/lang/StringBuilder
    //   9112: dup
    //   9113: invokespecial 278	java/lang/StringBuilder:<init>	()V
    //   9116: ldc_w 1394
    //   9119: invokevirtual 284	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   9122: aload 79
    //   9124: invokevirtual 284	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   9127: ldc_w 1396
    //   9130: invokevirtual 284	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   9133: aload 80
    //   9135: invokevirtual 284	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   9138: invokevirtual 287	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   9141: invokestatic 1105	com/belkin/utils/LogUtils:debugLog	(Ljava/lang/String;Ljava/lang/String;)V
    //   9144: new 1398	java/util/concurrent/CountDownLatch
    //   9147: dup
    //   9148: iconst_1
    //   9149: invokespecial 1400	java/util/concurrent/CountDownLatch:<init>	(I)V
    //   9152: astore 81
    //   9154: new 1402	com/belkin/wemo/cache/cloud/CloudRequestGetRulesDB
    //   9157: dup
    //   9158: getstatic 373	com/belkin/cordova/plugin/DevicePlugin:mContext	Landroid/content/Context;
    //   9161: aload 79
    //   9163: new 1404	com/belkin/cordova/plugin/DevicePlugin$13
    //   9166: dup
    //   9167: aload_0
    //   9168: aload 80
    //   9170: aload_3
    //   9171: aload 81
    //   9173: invokespecial 1407	com/belkin/cordova/plugin/DevicePlugin$13:<init>	(Lcom/belkin/cordova/plugin/DevicePlugin;Ljava/lang/String;Lorg/apache/cordova/CallbackContext;Ljava/util/concurrent/CountDownLatch;)V
    //   9176: invokespecial 1410	com/belkin/wemo/cache/cloud/CloudRequestGetRulesDB:<init>	(Landroid/content/Context;Ljava/lang/String;Lcom/belkin/wemo/cache/cloud/listener/OnRequestCompleteListener;)V
    //   9179: astore 82
    //   9181: new 1124	com/belkin/wemo/cache/cloud/CloudRequestManager
    //   9184: dup
    //   9185: getstatic 373	com/belkin/cordova/plugin/DevicePlugin:mContext	Landroid/content/Context;
    //   9188: invokespecial 1125	com/belkin/wemo/cache/cloud/CloudRequestManager:<init>	(Landroid/content/Context;)V
    //   9191: aload 82
    //   9193: invokevirtual 1413	com/belkin/wemo/cache/cloud/CloudRequestManager:makeByteStreamRequest	(Lcom/belkin/wemo/cache/cloud/CloudRequestInterface;)V
    //   9196: aload 81
    //   9198: invokevirtual 1416	java/util/concurrent/CountDownLatch:await	()V
    //   9201: ldc 16
    //   9203: ldc_w 1418
    //   9206: invokestatic 1105	com/belkin/utils/LogUtils:debugLog	(Ljava/lang/String;Ljava/lang/String;)V
    //   9209: goto -8147 -> 1062
    //   9212: astore 83
    //   9214: ldc 16
    //   9216: ldc_w 1420
    //   9219: aload 83
    //   9221: invokestatic 771	com/belkin/utils/LogUtils:errorLog	(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V
    //   9224: aload_3
    //   9225: ifnull -8163 -> 1062
    //   9228: new 251	org/apache/cordova/PluginResult
    //   9231: dup
    //   9232: getstatic 314	org/apache/cordova/PluginResult$Status:ERROR	Lorg/apache/cordova/PluginResult$Status;
    //   9235: invokespecial 582	org/apache/cordova/PluginResult:<init>	(Lorg/apache/cordova/PluginResult$Status;)V
    //   9238: astore 84
    //   9240: aload_3
    //   9241: aload 84
    //   9243: invokevirtual 266	org/apache/cordova/CallbackContext:sendPluginResult	(Lorg/apache/cordova/PluginResult;)V
    //   9246: goto -8184 -> 1062
    //   9249: ldc 16
    //   9251: ldc_w 1422
    //   9254: invokestatic 293	com/belkin/utils/LogUtils:infoLog	(Ljava/lang/String;Ljava/lang/String;)V
    //   9257: aload_0
    //   9258: getfield 193	com/belkin/cordova/plugin/DevicePlugin:mWiFiSecurityUtil	Lcom/belkin/utils/WiFiSecurityUtil;
    //   9261: getstatic 373	com/belkin/cordova/plugin/DevicePlugin:mContext	Landroid/content/Context;
    //   9264: invokevirtual 819	com/belkin/utils/WiFiSecurityUtil:generateAuthCode	(Landroid/content/Context;)Ljava/lang/String;
    //   9267: astore 74
    //   9269: ldc 16
    //   9271: new 277	java/lang/StringBuilder
    //   9274: dup
    //   9275: invokespecial 278	java/lang/StringBuilder:<init>	()V
    //   9278: ldc_w 1424
    //   9281: invokevirtual 284	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   9284: aload 74
    //   9286: invokevirtual 284	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   9289: invokevirtual 287	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   9292: invokestatic 293	com/belkin/utils/LogUtils:infoLog	(Ljava/lang/String;Ljava/lang/String;)V
    //   9295: ldc 16
    //   9297: new 277	java/lang/StringBuilder
    //   9300: dup
    //   9301: invokespecial 278	java/lang/StringBuilder:<init>	()V
    //   9304: ldc_w 1426
    //   9307: invokevirtual 284	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   9310: aload_2
    //   9311: iconst_0
    //   9312: invokevirtual 658	org/json/JSONArray:getString	(I)Ljava/lang/String;
    //   9315: invokevirtual 284	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   9318: invokevirtual 287	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   9321: invokestatic 293	com/belkin/utils/LogUtils:infoLog	(Ljava/lang/String;Ljava/lang/String;)V
    //   9324: aload_0
    //   9325: iconst_3
    //   9326: anewarray 297	java/lang/String
    //   9329: putfield 1428	com/belkin/cordova/plugin/DevicePlugin:param	[Ljava/lang/String;
    //   9332: aload_0
    //   9333: getfield 1428	com/belkin/cordova/plugin/DevicePlugin:param	[Ljava/lang/String;
    //   9336: iconst_0
    //   9337: sipush 5008
    //   9340: invokestatic 1431	java/lang/String:valueOf	(I)Ljava/lang/String;
    //   9343: aastore
    //   9344: aload_0
    //   9345: getfield 1428	com/belkin/cordova/plugin/DevicePlugin:param	[Ljava/lang/String;
    //   9348: iconst_1
    //   9349: aload 74
    //   9351: aastore
    //   9352: aload_0
    //   9353: getfield 1428	com/belkin/cordova/plugin/DevicePlugin:param	[Ljava/lang/String;
    //   9356: iconst_2
    //   9357: aload_2
    //   9358: iconst_0
    //   9359: invokevirtual 658	org/json/JSONArray:getString	(I)Ljava/lang/String;
    //   9362: aastore
    //   9363: aload_0
    //   9364: new 1433	com/belkin/remoteservice/RestfulWebservice
    //   9367: dup
    //   9368: aload_0
    //   9369: getfield 1428	com/belkin/cordova/plugin/DevicePlugin:param	[Ljava/lang/String;
    //   9372: getstatic 373	com/belkin/cordova/plugin/DevicePlugin:mContext	Landroid/content/Context;
    //   9375: invokespecial 1436	com/belkin/remoteservice/RestfulWebservice:<init>	([Ljava/lang/String;Landroid/content/Context;)V
    //   9378: putfield 1438	com/belkin/cordova/plugin/DevicePlugin:objHttpConnection	Lcom/belkin/remoteservice/RestfulWebservice;
    //   9381: aload_0
    //   9382: aload_0
    //   9383: getfield 1438	com/belkin/cordova/plugin/DevicePlugin:objHttpConnection	Lcom/belkin/remoteservice/RestfulWebservice;
    //   9386: iconst_0
    //   9387: anewarray 1440	java/lang/Void
    //   9390: invokevirtual 1443	com/belkin/remoteservice/RestfulWebservice:execute	([Ljava/lang/Object;)Landroid/os/AsyncTask;
    //   9393: invokevirtual 1447	android/os/AsyncTask:get	()Ljava/lang/Object;
    //   9396: checkcast 1449	com/belkin/remoteservice/HttpResponseObject
    //   9399: putfield 1451	com/belkin/cordova/plugin/DevicePlugin:httpResponseObject	Lcom/belkin/remoteservice/HttpResponseObject;
    //   9402: ldc 16
    //   9404: new 277	java/lang/StringBuilder
    //   9407: dup
    //   9408: invokespecial 278	java/lang/StringBuilder:<init>	()V
    //   9411: ldc_w 1453
    //   9414: invokevirtual 284	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   9417: aload_0
    //   9418: getfield 1451	com/belkin/cordova/plugin/DevicePlugin:httpResponseObject	Lcom/belkin/remoteservice/HttpResponseObject;
    //   9421: invokevirtual 1456	com/belkin/remoteservice/HttpResponseObject:getResponseCode	()I
    //   9424: invokevirtual 478	java/lang/StringBuilder:append	(I)Ljava/lang/StringBuilder;
    //   9427: invokevirtual 287	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   9430: invokestatic 1064	android/util/Log:v	(Ljava/lang/String;Ljava/lang/String;)I
    //   9433: pop
    //   9434: aload_0
    //   9435: getfield 1438	com/belkin/cordova/plugin/DevicePlugin:objHttpConnection	Lcom/belkin/remoteservice/RestfulWebservice;
    //   9438: invokevirtual 1460	com/belkin/remoteservice/RestfulWebservice:getStatus	()Landroid/os/AsyncTask$Status;
    //   9441: getstatic 1466	android/os/AsyncTask$Status:RUNNING	Landroid/os/AsyncTask$Status;
    //   9444: invokevirtual 1467	android/os/AsyncTask$Status:equals	(Ljava/lang/Object;)Z
    //   9447: ifeq +42 -> 9489
    //   9450: ldc2_w 585
    //   9453: invokestatic 590	java/lang/Thread:sleep	(J)V
    //   9456: goto -22 -> 9434
    //   9459: astore 76
    //   9461: aload 76
    //   9463: invokevirtual 639	java/lang/InterruptedException:printStackTrace	()V
    //   9466: goto -32 -> 9434
    //   9469: astore 77
    //   9471: aload 77
    //   9473: invokevirtual 639	java/lang/InterruptedException:printStackTrace	()V
    //   9476: goto -42 -> 9434
    //   9479: astore 75
    //   9481: aload 75
    //   9483: invokevirtual 1468	java/util/concurrent/ExecutionException:printStackTrace	()V
    //   9486: goto -52 -> 9434
    //   9489: ldc 16
    //   9491: new 277	java/lang/StringBuilder
    //   9494: dup
    //   9495: invokespecial 278	java/lang/StringBuilder:<init>	()V
    //   9498: ldc_w 1470
    //   9501: invokevirtual 284	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   9504: aload_0
    //   9505: getfield 1451	com/belkin/cordova/plugin/DevicePlugin:httpResponseObject	Lcom/belkin/remoteservice/HttpResponseObject;
    //   9508: invokevirtual 1456	com/belkin/remoteservice/HttpResponseObject:getResponseCode	()I
    //   9511: invokevirtual 478	java/lang/StringBuilder:append	(I)Ljava/lang/StringBuilder;
    //   9514: invokevirtual 287	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   9517: invokestatic 293	com/belkin/utils/LogUtils:infoLog	(Ljava/lang/String;Ljava/lang/String;)V
    //   9520: aload_0
    //   9521: new 251	org/apache/cordova/PluginResult
    //   9524: dup
    //   9525: getstatic 257	org/apache/cordova/PluginResult$Status:OK	Lorg/apache/cordova/PluginResult$Status;
    //   9528: aload_0
    //   9529: getfield 1451	com/belkin/cordova/plugin/DevicePlugin:httpResponseObject	Lcom/belkin/remoteservice/HttpResponseObject;
    //   9532: invokevirtual 1456	com/belkin/remoteservice/HttpResponseObject:getResponseCode	()I
    //   9535: invokespecial 1242	org/apache/cordova/PluginResult:<init>	(Lorg/apache/cordova/PluginResult$Status;I)V
    //   9538: putfield 123	com/belkin/cordova/plugin/DevicePlugin:mPluginResult	Lorg/apache/cordova/PluginResult;
    //   9541: aload_0
    //   9542: getfield 123	com/belkin/cordova/plugin/DevicePlugin:mPluginResult	Lorg/apache/cordova/PluginResult;
    //   9545: iconst_0
    //   9546: invokevirtual 438	org/apache/cordova/PluginResult:setKeepCallback	(Z)V
    //   9549: aload_3
    //   9550: aload_0
    //   9551: getfield 123	com/belkin/cordova/plugin/DevicePlugin:mPluginResult	Lorg/apache/cordova/PluginResult;
    //   9554: invokevirtual 266	org/apache/cordova/CallbackContext:sendPluginResult	(Lorg/apache/cordova/PluginResult;)V
    //   9557: aload_3
    //   9558: invokevirtual 518	org/apache/cordova/CallbackContext:success	()V
    //   9561: goto -8499 -> 1062
    //   9564: new 208	java/lang/Thread
    //   9567: dup
    //   9568: new 1472	com/belkin/cordova/plugin/DevicePlugin$14
    //   9571: dup
    //   9572: aload_0
    //   9573: aload_2
    //   9574: aload_3
    //   9575: invokespecial 1473	com/belkin/cordova/plugin/DevicePlugin$14:<init>	(Lcom/belkin/cordova/plugin/DevicePlugin;Lorg/json/JSONArray;Lorg/apache/cordova/CallbackContext;)V
    //   9578: invokespecial 215	java/lang/Thread:<init>	(Ljava/lang/Runnable;)V
    //   9581: astore 72
    //   9583: aload 72
    //   9585: iconst_1
    //   9586: invokevirtual 1476	java/lang/Thread:setPriority	(I)V
    //   9589: aload 72
    //   9591: invokevirtual 218	java/lang/Thread:start	()V
    //   9594: new 251	org/apache/cordova/PluginResult
    //   9597: dup
    //   9598: getstatic 774	org/apache/cordova/PluginResult$Status:NO_RESULT	Lorg/apache/cordova/PluginResult$Status;
    //   9601: invokespecial 582	org/apache/cordova/PluginResult:<init>	(Lorg/apache/cordova/PluginResult$Status;)V
    //   9604: astore 73
    //   9606: aload 73
    //   9608: iconst_1
    //   9609: invokevirtual 438	org/apache/cordova/PluginResult:setKeepCallback	(Z)V
    //   9612: aload_3
    //   9613: aload 73
    //   9615: invokevirtual 266	org/apache/cordova/CallbackContext:sendPluginResult	(Lorg/apache/cordova/PluginResult;)V
    //   9618: goto -8556 -> 1062
    //   9621: aload_0
    //   9622: getfield 193	com/belkin/cordova/plugin/DevicePlugin:mWiFiSecurityUtil	Lcom/belkin/utils/WiFiSecurityUtil;
    //   9625: getstatic 373	com/belkin/cordova/plugin/DevicePlugin:mContext	Landroid/content/Context;
    //   9628: invokevirtual 819	com/belkin/utils/WiFiSecurityUtil:generateAuthCode	(Landroid/content/Context;)Ljava/lang/String;
    //   9631: astore 70
    //   9633: aload_0
    //   9634: getstatic 373	com/belkin/cordova/plugin/DevicePlugin:mContext	Landroid/content/Context;
    //   9637: invokestatic 1481	com/belkin/cloud/CloudServices:getInstance	(Landroid/content/Context;)Lcom/belkin/cloud/CloudServices;
    //   9640: putfield 197	com/belkin/cordova/plugin/DevicePlugin:cs	Lcom/belkin/cloud/CloudServices;
    //   9643: aload_0
    //   9644: getfield 197	com/belkin/cordova/plugin/DevicePlugin:cs	Lcom/belkin/cloud/CloudServices;
    //   9647: aload_2
    //   9648: iconst_1
    //   9649: invokevirtual 658	org/json/JSONArray:getString	(I)Ljava/lang/String;
    //   9652: aload_2
    //   9653: iconst_0
    //   9654: invokevirtual 658	org/json/JSONArray:getString	(I)Ljava/lang/String;
    //   9657: aload 70
    //   9659: invokevirtual 1485	com/belkin/cloud/CloudServices:putDeviceIcon	(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Z
    //   9662: pop
    //   9663: aload_3
    //   9664: invokevirtual 518	org/apache/cordova/CallbackContext:success	()V
    //   9667: goto -8605 -> 1062
    //   9670: ldc 16
    //   9672: ldc_w 1487
    //   9675: invokestatic 293	com/belkin/utils/LogUtils:infoLog	(Ljava/lang/String;Ljava/lang/String;)V
    //   9678: ldc 16
    //   9680: new 277	java/lang/StringBuilder
    //   9683: dup
    //   9684: invokespecial 278	java/lang/StringBuilder:<init>	()V
    //   9687: ldc_w 1489
    //   9690: invokevirtual 284	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   9693: aload_0
    //   9694: getfield 189	com/belkin/cordova/plugin/DevicePlugin:mSharePreference	Lcom/belkin/wemo/cache/utils/SharePreferences;
    //   9697: invokevirtual 1492	com/belkin/wemo/cache/utils/SharePreferences:getDBVersion	()Ljava/lang/String;
    //   9700: invokevirtual 284	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   9703: invokevirtual 287	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   9706: invokestatic 293	com/belkin/utils/LogUtils:infoLog	(Ljava/lang/String;Ljava/lang/String;)V
    //   9709: aload_3
    //   9710: aload_0
    //   9711: getfield 189	com/belkin/cordova/plugin/DevicePlugin:mSharePreference	Lcom/belkin/wemo/cache/utils/SharePreferences;
    //   9714: invokevirtual 1492	com/belkin/wemo/cache/utils/SharePreferences:getDBVersion	()Ljava/lang/String;
    //   9717: invokevirtual 510	org/apache/cordova/CallbackContext:success	(Ljava/lang/String;)V
    //   9720: iconst_1
    //   9721: ireturn
    //   9722: ldc 16
    //   9724: new 277	java/lang/StringBuilder
    //   9727: dup
    //   9728: invokespecial 278	java/lang/StringBuilder:<init>	()V
    //   9731: ldc_w 1426
    //   9734: invokevirtual 284	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   9737: aload_2
    //   9738: iconst_0
    //   9739: invokevirtual 658	org/json/JSONArray:getString	(I)Ljava/lang/String;
    //   9742: invokevirtual 284	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   9745: invokevirtual 287	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   9748: invokestatic 293	com/belkin/utils/LogUtils:infoLog	(Ljava/lang/String;Ljava/lang/String;)V
    //   9751: ldc 16
    //   9753: ldc_w 1494
    //   9756: invokestatic 293	com/belkin/utils/LogUtils:infoLog	(Ljava/lang/String;Ljava/lang/String;)V
    //   9759: ldc 16
    //   9761: new 277	java/lang/StringBuilder
    //   9764: dup
    //   9765: invokespecial 278	java/lang/StringBuilder:<init>	()V
    //   9768: ldc_w 1489
    //   9771: invokevirtual 284	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   9774: aload_2
    //   9775: iconst_0
    //   9776: invokevirtual 658	org/json/JSONArray:getString	(I)Ljava/lang/String;
    //   9779: invokevirtual 284	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   9782: invokevirtual 287	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   9785: invokestatic 293	com/belkin/utils/LogUtils:infoLog	(Ljava/lang/String;Ljava/lang/String;)V
    //   9788: aload_2
    //   9789: iconst_0
    //   9790: invokevirtual 658	org/json/JSONArray:getString	(I)Ljava/lang/String;
    //   9793: astore 69
    //   9795: aload 69
    //   9797: ifnull +11 -> 9808
    //   9800: aload 69
    //   9802: ldc_w 295
    //   9805: if_acmpne +8 -> 9813
    //   9808: ldc_w 1283
    //   9811: astore 69
    //   9813: aload_0
    //   9814: getfield 189	com/belkin/cordova/plugin/DevicePlugin:mSharePreference	Lcom/belkin/wemo/cache/utils/SharePreferences;
    //   9817: aload 69
    //   9819: invokevirtual 1497	com/belkin/wemo/cache/utils/SharePreferences:setDBVersion	(Ljava/lang/String;)V
    //   9822: ldc 16
    //   9824: new 277	java/lang/StringBuilder
    //   9827: dup
    //   9828: invokespecial 278	java/lang/StringBuilder:<init>	()V
    //   9831: ldc_w 1499
    //   9834: invokevirtual 284	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   9837: aload 69
    //   9839: invokevirtual 284	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   9842: invokevirtual 287	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   9845: invokestatic 293	com/belkin/utils/LogUtils:infoLog	(Ljava/lang/String;Ljava/lang/String;)V
    //   9848: aload_3
    //   9849: aload 69
    //   9851: invokevirtual 510	org/apache/cordova/CallbackContext:success	(Ljava/lang/String;)V
    //   9854: iconst_1
    //   9855: ireturn
    //   9856: ldc 16
    //   9858: ldc_w 1501
    //   9861: invokestatic 293	com/belkin/utils/LogUtils:infoLog	(Ljava/lang/String;Ljava/lang/String;)V
    //   9864: ldc 16
    //   9866: new 277	java/lang/StringBuilder
    //   9869: dup
    //   9870: invokespecial 278	java/lang/StringBuilder:<init>	()V
    //   9873: ldc_w 1489
    //   9876: invokevirtual 284	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   9879: aload_0
    //   9880: getfield 193	com/belkin/cordova/plugin/DevicePlugin:mWiFiSecurityUtil	Lcom/belkin/utils/WiFiSecurityUtil;
    //   9883: getstatic 373	com/belkin/cordova/plugin/DevicePlugin:mContext	Landroid/content/Context;
    //   9886: invokevirtual 1255	com/belkin/utils/WiFiSecurityUtil:getDeviceID	(Landroid/content/Context;)Ljava/lang/String;
    //   9889: invokevirtual 284	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   9892: invokevirtual 287	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   9895: invokestatic 293	com/belkin/utils/LogUtils:infoLog	(Ljava/lang/String;Ljava/lang/String;)V
    //   9898: aload_3
    //   9899: aload_0
    //   9900: getfield 193	com/belkin/cordova/plugin/DevicePlugin:mWiFiSecurityUtil	Lcom/belkin/utils/WiFiSecurityUtil;
    //   9903: getstatic 373	com/belkin/cordova/plugin/DevicePlugin:mContext	Landroid/content/Context;
    //   9906: invokevirtual 1255	com/belkin/utils/WiFiSecurityUtil:getDeviceID	(Landroid/content/Context;)Ljava/lang/String;
    //   9909: invokevirtual 510	org/apache/cordova/CallbackContext:success	(Ljava/lang/String;)V
    //   9912: iconst_1
    //   9913: ireturn
    //   9914: ldc 16
    //   9916: ldc_w 1503
    //   9919: invokestatic 293	com/belkin/utils/LogUtils:infoLog	(Ljava/lang/String;Ljava/lang/String;)V
    //   9922: aload_0
    //   9923: getfield 189	com/belkin/cordova/plugin/DevicePlugin:mSharePreference	Lcom/belkin/wemo/cache/utils/SharePreferences;
    //   9926: ldc_w 295
    //   9929: invokevirtual 1506	com/belkin/wemo/cache/utils/SharePreferences:storePrivateKey	(Ljava/lang/String;)V
    //   9932: aload_0
    //   9933: getfield 189	com/belkin/cordova/plugin/DevicePlugin:mSharePreference	Lcom/belkin/wemo/cache/utils/SharePreferences;
    //   9936: ldc_w 295
    //   9939: invokevirtual 1509	com/belkin/wemo/cache/utils/SharePreferences:storeHomeId	(Ljava/lang/String;)V
    //   9942: aload_0
    //   9943: getfield 189	com/belkin/cordova/plugin/DevicePlugin:mSharePreference	Lcom/belkin/wemo/cache/utils/SharePreferences;
    //   9946: aconst_null
    //   9947: invokevirtual 1513	com/belkin/wemo/cache/utils/SharePreferences:setHomeSSIDs	(Ljava/util/Set;)Z
    //   9950: pop
    //   9951: aload_0
    //   9952: getfield 189	com/belkin/cordova/plugin/DevicePlugin:mSharePreference	Lcom/belkin/wemo/cache/utils/SharePreferences;
    //   9955: aconst_null
    //   9956: invokevirtual 1516	com/belkin/wemo/cache/utils/SharePreferences:setARPMacs	(Ljava/util/Set;)Z
    //   9959: pop
    //   9960: aload_0
    //   9961: getfield 189	com/belkin/cordova/plugin/DevicePlugin:mSharePreference	Lcom/belkin/wemo/cache/utils/SharePreferences;
    //   9964: aconst_null
    //   9965: invokevirtual 1519	com/belkin/wemo/cache/utils/SharePreferences:setRemoteAccessSSID	(Ljava/lang/String;)Z
    //   9968: pop
    //   9969: aload_0
    //   9970: getfield 189	com/belkin/cordova/plugin/DevicePlugin:mSharePreference	Lcom/belkin/wemo/cache/utils/SharePreferences;
    //   9973: iconst_0
    //   9974: invokevirtual 1523	com/belkin/wemo/cache/utils/SharePreferences:setRemoteEnabled	(Z)Z
    //   9977: pop
    //   9978: aload_0
    //   9979: getfield 189	com/belkin/cordova/plugin/DevicePlugin:mSharePreference	Lcom/belkin/wemo/cache/utils/SharePreferences;
    //   9982: ldc_w 1283
    //   9985: invokevirtual 1497	com/belkin/wemo/cache/utils/SharePreferences:setDBVersion	(Ljava/lang/String;)V
    //   9988: aload_3
    //   9989: invokevirtual 518	org/apache/cordova/CallbackContext:success	()V
    //   9992: iconst_1
    //   9993: ireturn
    //   9994: ldc 16
    //   9996: ldc_w 1525
    //   9999: invokestatic 293	com/belkin/utils/LogUtils:infoLog	(Ljava/lang/String;Ljava/lang/String;)V
    //   10002: aload_0
    //   10003: getfield 327	com/belkin/cordova/plugin/DevicePlugin:cordova	Lorg/apache/cordova/CordovaInterface;
    //   10006: invokeinterface 333 1 0
    //   10011: new 1527	com/belkin/cordova/plugin/DevicePlugin$15
    //   10014: dup
    //   10015: aload_0
    //   10016: aload_3
    //   10017: aload_2
    //   10018: invokespecial 1528	com/belkin/cordova/plugin/DevicePlugin$15:<init>	(Lcom/belkin/cordova/plugin/DevicePlugin;Lorg/apache/cordova/CallbackContext;Lorg/json/JSONArray;)V
    //   10021: invokeinterface 341 2 0
    //   10026: iconst_1
    //   10027: ireturn
    //   10028: ldc 16
    //   10030: ldc_w 1530
    //   10033: invokestatic 293	com/belkin/utils/LogUtils:infoLog	(Ljava/lang/String;Ljava/lang/String;)V
    //   10036: aload_0
    //   10037: getfield 189	com/belkin/cordova/plugin/DevicePlugin:mSharePreference	Lcom/belkin/wemo/cache/utils/SharePreferences;
    //   10040: invokevirtual 1534	com/belkin/wemo/cache/utils/SharePreferences:getInsightHomeSettingsParams	()[Ljava/lang/String;
    //   10043: astore 61
    //   10045: new 394	org/json/JSONObject
    //   10048: dup
    //   10049: invokespecial 425	org/json/JSONObject:<init>	()V
    //   10052: astore 62
    //   10054: aload 62
    //   10056: getstatic 1539	com/belkin/wemo/cache/devicelist/JSONConstants:INSIGHT_ENERGY_PER_UNIT_COST	Ljava/lang/String;
    //   10059: aload 61
    //   10061: iconst_0
    //   10062: aaload
    //   10063: invokevirtual 430	org/json/JSONObject:put	(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    //   10066: pop
    //   10067: aload 62
    //   10069: getstatic 1542	com/belkin/wemo/cache/devicelist/JSONConstants:INSIGHT_CURRENCY	Ljava/lang/String;
    //   10072: aload 61
    //   10074: iconst_1
    //   10075: aaload
    //   10076: invokevirtual 430	org/json/JSONObject:put	(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    //   10079: pop
    //   10080: aload_3
    //   10081: aload 62
    //   10083: invokevirtual 535	org/apache/cordova/CallbackContext:success	(Lorg/json/JSONObject;)V
    //   10086: goto -9024 -> 1062
    //   10089: aload_0
    //   10090: new 251	org/apache/cordova/PluginResult
    //   10093: dup
    //   10094: getstatic 257	org/apache/cordova/PluginResult$Status:OK	Lorg/apache/cordova/PluginResult$Status;
    //   10097: aload_0
    //   10098: getfield 1544	com/belkin/cordova/plugin/DevicePlugin:netCamUtil	Lcom/belkin/utils/NetCamUtil;
    //   10101: getstatic 373	com/belkin/cordova/plugin/DevicePlugin:mContext	Landroid/content/Context;
    //   10104: invokevirtual 1550	com/belkin/utils/NetCamUtil:checkNetCam	(Landroid/content/Context;)Z
    //   10107: invokespecial 516	org/apache/cordova/PluginResult:<init>	(Lorg/apache/cordova/PluginResult$Status;Z)V
    //   10110: putfield 123	com/belkin/cordova/plugin/DevicePlugin:mPluginResult	Lorg/apache/cordova/PluginResult;
    //   10113: aload_0
    //   10114: getfield 123	com/belkin/cordova/plugin/DevicePlugin:mPluginResult	Lorg/apache/cordova/PluginResult;
    //   10117: iconst_0
    //   10118: invokevirtual 438	org/apache/cordova/PluginResult:setKeepCallback	(Z)V
    //   10121: aload_3
    //   10122: aload_0
    //   10123: getfield 123	com/belkin/cordova/plugin/DevicePlugin:mPluginResult	Lorg/apache/cordova/PluginResult;
    //   10126: invokevirtual 266	org/apache/cordova/CallbackContext:sendPluginResult	(Lorg/apache/cordova/PluginResult;)V
    //   10129: aload_3
    //   10130: invokevirtual 518	org/apache/cordova/CallbackContext:success	()V
    //   10133: goto -9071 -> 1062
    //   10136: ldc 16
    //   10138: new 277	java/lang/StringBuilder
    //   10141: dup
    //   10142: invokespecial 278	java/lang/StringBuilder:<init>	()V
    //   10145: ldc_w 1552
    //   10148: invokevirtual 284	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   10151: aload_2
    //   10152: iconst_0
    //   10153: invokevirtual 658	org/json/JSONArray:getString	(I)Ljava/lang/String;
    //   10156: invokevirtual 284	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   10159: invokevirtual 287	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   10162: invokestatic 293	com/belkin/utils/LogUtils:infoLog	(Ljava/lang/String;Ljava/lang/String;)V
    //   10165: ldc 16
    //   10167: new 277	java/lang/StringBuilder
    //   10170: dup
    //   10171: invokespecial 278	java/lang/StringBuilder:<init>	()V
    //   10174: ldc_w 1554
    //   10177: invokevirtual 284	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   10180: aload_2
    //   10181: iconst_1
    //   10182: invokevirtual 658	org/json/JSONArray:getString	(I)Ljava/lang/String;
    //   10185: invokevirtual 284	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   10188: invokevirtual 287	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   10191: invokestatic 293	com/belkin/utils/LogUtils:infoLog	(Ljava/lang/String;Ljava/lang/String;)V
    //   10194: ldc 16
    //   10196: new 277	java/lang/StringBuilder
    //   10199: dup
    //   10200: invokespecial 278	java/lang/StringBuilder:<init>	()V
    //   10203: ldc_w 1556
    //   10206: invokevirtual 284	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   10209: aload_2
    //   10210: iconst_2
    //   10211: invokevirtual 658	org/json/JSONArray:getString	(I)Ljava/lang/String;
    //   10214: invokevirtual 284	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   10217: invokevirtual 287	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   10220: invokestatic 293	com/belkin/utils/LogUtils:infoLog	(Ljava/lang/String;Ljava/lang/String;)V
    //   10223: iload 5
    //   10225: ifeq +75 -> 10300
    //   10228: aload_0
    //   10229: getfield 1544	com/belkin/cordova/plugin/DevicePlugin:netCamUtil	Lcom/belkin/utils/NetCamUtil;
    //   10232: getstatic 373	com/belkin/cordova/plugin/DevicePlugin:mContext	Landroid/content/Context;
    //   10235: aload_2
    //   10236: iconst_0
    //   10237: invokevirtual 658	org/json/JSONArray:getString	(I)Ljava/lang/String;
    //   10240: aload_0
    //   10241: getfield 119	com/belkin/cordova/plugin/DevicePlugin:mUpnpDeviceList	Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;
    //   10244: aload_2
    //   10245: iconst_1
    //   10246: invokevirtual 658	org/json/JSONArray:getString	(I)Ljava/lang/String;
    //   10249: invokevirtual 1559	com/belkin/cybergarage/wrapper/UpnpDeviceList:getMacAddressByUDN	(Ljava/lang/String;)Ljava/lang/String;
    //   10252: aload_2
    //   10253: iconst_2
    //   10254: invokevirtual 658	org/json/JSONArray:getString	(I)Ljava/lang/String;
    //   10257: invokestatic 473	java/lang/Integer:parseInt	(Ljava/lang/String;)I
    //   10260: invokevirtual 1563	com/belkin/utils/NetCamUtil:launchNetCamApp	(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;I)V
    //   10263: aload_0
    //   10264: new 251	org/apache/cordova/PluginResult
    //   10267: dup
    //   10268: getstatic 257	org/apache/cordova/PluginResult$Status:OK	Lorg/apache/cordova/PluginResult$Status;
    //   10271: invokespecial 582	org/apache/cordova/PluginResult:<init>	(Lorg/apache/cordova/PluginResult$Status;)V
    //   10274: putfield 123	com/belkin/cordova/plugin/DevicePlugin:mPluginResult	Lorg/apache/cordova/PluginResult;
    //   10277: aload_0
    //   10278: getfield 123	com/belkin/cordova/plugin/DevicePlugin:mPluginResult	Lorg/apache/cordova/PluginResult;
    //   10281: iconst_0
    //   10282: invokevirtual 438	org/apache/cordova/PluginResult:setKeepCallback	(Z)V
    //   10285: aload_3
    //   10286: aload_0
    //   10287: getfield 123	com/belkin/cordova/plugin/DevicePlugin:mPluginResult	Lorg/apache/cordova/PluginResult;
    //   10290: invokevirtual 266	org/apache/cordova/CallbackContext:sendPluginResult	(Lorg/apache/cordova/PluginResult;)V
    //   10293: aload_3
    //   10294: invokevirtual 518	org/apache/cordova/CallbackContext:success	()V
    //   10297: goto -9235 -> 1062
    //   10300: aload_0
    //   10301: getfield 1544	com/belkin/cordova/plugin/DevicePlugin:netCamUtil	Lcom/belkin/utils/NetCamUtil;
    //   10304: getstatic 373	com/belkin/cordova/plugin/DevicePlugin:mContext	Landroid/content/Context;
    //   10307: aload_2
    //   10308: iconst_0
    //   10309: invokevirtual 658	org/json/JSONArray:getString	(I)Ljava/lang/String;
    //   10312: aload_0
    //   10313: getfield 119	com/belkin/cordova/plugin/DevicePlugin:mUpnpDeviceList	Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;
    //   10316: aload_2
    //   10317: iconst_1
    //   10318: invokevirtual 658	org/json/JSONArray:getString	(I)Ljava/lang/String;
    //   10321: invokevirtual 1566	com/belkin/cybergarage/wrapper/UpnpDeviceList:getMacAddresswithColon	(Ljava/lang/String;)Ljava/lang/String;
    //   10324: aload_2
    //   10325: iconst_2
    //   10326: invokevirtual 658	org/json/JSONArray:getString	(I)Ljava/lang/String;
    //   10329: invokestatic 473	java/lang/Integer:parseInt	(Ljava/lang/String;)I
    //   10332: invokevirtual 1563	com/belkin/utils/NetCamUtil:launchNetCamApp	(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;I)V
    //   10335: goto -72 -> 10263
    //   10338: ldc 16
    //   10340: ldc_w 1568
    //   10343: invokestatic 293	com/belkin/utils/LogUtils:infoLog	(Ljava/lang/String;Ljava/lang/String;)V
    //   10346: iload 5
    //   10348: ifeq +50 -> 10398
    //   10351: aload_0
    //   10352: getfield 1570	com/belkin/cordova/plugin/DevicePlugin:appLaunchUtil	Lcom/belkin/utils/ExternalAppLaunchUtil;
    //   10355: getstatic 373	com/belkin/cordova/plugin/DevicePlugin:mContext	Landroid/content/Context;
    //   10358: invokevirtual 1575	com/belkin/utils/ExternalAppLaunchUtil:launchAlexaApp	(Landroid/content/Context;)V
    //   10361: aload_0
    //   10362: new 251	org/apache/cordova/PluginResult
    //   10365: dup
    //   10366: getstatic 257	org/apache/cordova/PluginResult$Status:OK	Lorg/apache/cordova/PluginResult$Status;
    //   10369: invokespecial 582	org/apache/cordova/PluginResult:<init>	(Lorg/apache/cordova/PluginResult$Status;)V
    //   10372: putfield 123	com/belkin/cordova/plugin/DevicePlugin:mPluginResult	Lorg/apache/cordova/PluginResult;
    //   10375: aload_0
    //   10376: getfield 123	com/belkin/cordova/plugin/DevicePlugin:mPluginResult	Lorg/apache/cordova/PluginResult;
    //   10379: iconst_0
    //   10380: invokevirtual 438	org/apache/cordova/PluginResult:setKeepCallback	(Z)V
    //   10383: aload_3
    //   10384: aload_0
    //   10385: getfield 123	com/belkin/cordova/plugin/DevicePlugin:mPluginResult	Lorg/apache/cordova/PluginResult;
    //   10388: invokevirtual 266	org/apache/cordova/CallbackContext:sendPluginResult	(Lorg/apache/cordova/PluginResult;)V
    //   10391: aload_3
    //   10392: invokevirtual 518	org/apache/cordova/CallbackContext:success	()V
    //   10395: goto -9333 -> 1062
    //   10398: aload_0
    //   10399: getfield 1570	com/belkin/cordova/plugin/DevicePlugin:appLaunchUtil	Lcom/belkin/utils/ExternalAppLaunchUtil;
    //   10402: getstatic 373	com/belkin/cordova/plugin/DevicePlugin:mContext	Landroid/content/Context;
    //   10405: invokevirtual 1575	com/belkin/utils/ExternalAppLaunchUtil:launchAlexaApp	(Landroid/content/Context;)V
    //   10408: goto -47 -> 10361
    //   10411: ldc 16
    //   10413: ldc_w 1577
    //   10416: invokestatic 293	com/belkin/utils/LogUtils:infoLog	(Ljava/lang/String;Ljava/lang/String;)V
    //   10419: aload_0
    //   10420: getfield 327	com/belkin/cordova/plugin/DevicePlugin:cordova	Lorg/apache/cordova/CordovaInterface;
    //   10423: invokeinterface 333 1 0
    //   10428: new 1579	com/belkin/cordova/plugin/DevicePlugin$16
    //   10431: dup
    //   10432: aload_0
    //   10433: aload_3
    //   10434: aload_2
    //   10435: invokespecial 1580	com/belkin/cordova/plugin/DevicePlugin$16:<init>	(Lcom/belkin/cordova/plugin/DevicePlugin;Lorg/apache/cordova/CallbackContext;Lorg/json/JSONArray;)V
    //   10438: invokeinterface 341 2 0
    //   10443: goto -9381 -> 1062
    //   10446: ldc 16
    //   10448: ldc_w 1582
    //   10451: invokestatic 293	com/belkin/utils/LogUtils:infoLog	(Ljava/lang/String;Ljava/lang/String;)V
    //   10454: aload_0
    //   10455: new 251	org/apache/cordova/PluginResult
    //   10458: dup
    //   10459: getstatic 257	org/apache/cordova/PluginResult$Status:OK	Lorg/apache/cordova/PluginResult$Status;
    //   10462: aload_0
    //   10463: getfield 119	com/belkin/cordova/plugin/DevicePlugin:mUpnpDeviceList	Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;
    //   10466: aload_2
    //   10467: iconst_0
    //   10468: invokevirtual 796	org/json/JSONArray:get	(I)Ljava/lang/Object;
    //   10471: invokevirtual 443	java/lang/Object:toString	()Ljava/lang/String;
    //   10474: ldc_w 1584
    //   10477: aload_2
    //   10478: iconst_1
    //   10479: invokevirtual 796	org/json/JSONArray:get	(I)Ljava/lang/Object;
    //   10482: invokevirtual 443	java/lang/Object:toString	()Ljava/lang/String;
    //   10485: getstatic 1587	com/belkin/wemo/cache/devicelist/JSONConstants:NEW_VALUE_POWER_THRESHOLD	Ljava/lang/String;
    //   10488: invokevirtual 1590	com/belkin/cybergarage/wrapper/UpnpDeviceList:setValueFromAction	(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Z
    //   10491: invokespecial 516	org/apache/cordova/PluginResult:<init>	(Lorg/apache/cordova/PluginResult$Status;Z)V
    //   10494: putfield 123	com/belkin/cordova/plugin/DevicePlugin:mPluginResult	Lorg/apache/cordova/PluginResult;
    //   10497: aload_0
    //   10498: getfield 123	com/belkin/cordova/plugin/DevicePlugin:mPluginResult	Lorg/apache/cordova/PluginResult;
    //   10501: iconst_0
    //   10502: invokevirtual 438	org/apache/cordova/PluginResult:setKeepCallback	(Z)V
    //   10505: aload_3
    //   10506: aload_0
    //   10507: getfield 123	com/belkin/cordova/plugin/DevicePlugin:mPluginResult	Lorg/apache/cordova/PluginResult;
    //   10510: invokevirtual 266	org/apache/cordova/CallbackContext:sendPluginResult	(Lorg/apache/cordova/PluginResult;)V
    //   10513: aload_3
    //   10514: invokevirtual 518	org/apache/cordova/CallbackContext:success	()V
    //   10517: goto -9455 -> 1062
    //   10520: ldc 16
    //   10522: ldc_w 1592
    //   10525: invokestatic 293	com/belkin/utils/LogUtils:infoLog	(Ljava/lang/String;Ljava/lang/String;)V
    //   10528: aload_3
    //   10529: aload_0
    //   10530: getfield 119	com/belkin/cordova/plugin/DevicePlugin:mUpnpDeviceList	Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;
    //   10533: aload_2
    //   10534: iconst_0
    //   10535: invokevirtual 796	org/json/JSONArray:get	(I)Ljava/lang/Object;
    //   10538: invokevirtual 443	java/lang/Object:toString	()Ljava/lang/String;
    //   10541: ldc_w 1594
    //   10544: getstatic 1587	com/belkin/wemo/cache/devicelist/JSONConstants:NEW_VALUE_POWER_THRESHOLD	Ljava/lang/String;
    //   10547: invokevirtual 1598	com/belkin/cybergarage/wrapper/UpnpDeviceList:getActionResultValue	(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    //   10550: invokevirtual 510	org/apache/cordova/CallbackContext:success	(Ljava/lang/String;)V
    //   10553: goto -9491 -> 1062
    //   10556: ldc 16
    //   10558: ldc_w 1600
    //   10561: invokestatic 293	com/belkin/utils/LogUtils:infoLog	(Ljava/lang/String;Ljava/lang/String;)V
    //   10564: aload_3
    //   10565: aload_0
    //   10566: getfield 119	com/belkin/cordova/plugin/DevicePlugin:mUpnpDeviceList	Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;
    //   10569: aload_2
    //   10570: iconst_0
    //   10571: invokevirtual 796	org/json/JSONArray:get	(I)Ljava/lang/Object;
    //   10574: invokevirtual 443	java/lang/Object:toString	()Ljava/lang/String;
    //   10577: ldc_w 1602
    //   10580: getstatic 1605	com/belkin/wemo/cache/devicelist/JSONConstants:INSTANT_POWER	Ljava/lang/String;
    //   10583: invokevirtual 1598	com/belkin/cybergarage/wrapper/UpnpDeviceList:getActionResultValue	(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    //   10586: invokevirtual 510	org/apache/cordova/CallbackContext:success	(Ljava/lang/String;)V
    //   10589: goto -9527 -> 1062
    //   10592: ldc 16
    //   10594: ldc_w 1607
    //   10597: invokestatic 293	com/belkin/utils/LogUtils:infoLog	(Ljava/lang/String;Ljava/lang/String;)V
    //   10600: aload_0
    //   10601: getfield 327	com/belkin/cordova/plugin/DevicePlugin:cordova	Lorg/apache/cordova/CordovaInterface;
    //   10604: invokeinterface 333 1 0
    //   10609: new 1609	com/belkin/cordova/plugin/DevicePlugin$17
    //   10612: dup
    //   10613: aload_0
    //   10614: aload_2
    //   10615: aload_3
    //   10616: invokespecial 1610	com/belkin/cordova/plugin/DevicePlugin$17:<init>	(Lcom/belkin/cordova/plugin/DevicePlugin;Lorg/json/JSONArray;Lorg/apache/cordova/CallbackContext;)V
    //   10619: invokeinterface 341 2 0
    //   10624: goto -9562 -> 1062
    //   10627: ldc 16
    //   10629: ldc_w 1612
    //   10632: invokestatic 293	com/belkin/utils/LogUtils:infoLog	(Ljava/lang/String;Ljava/lang/String;)V
    //   10635: getstatic 257	org/apache/cordova/PluginResult$Status:OK	Lorg/apache/cordova/PluginResult$Status;
    //   10638: astore 56
    //   10640: aload_0
    //   10641: getfield 119	com/belkin/cordova/plugin/DevicePlugin:mUpnpDeviceList	Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;
    //   10644: astore 57
    //   10646: aload_2
    //   10647: iconst_0
    //   10648: invokevirtual 796	org/json/JSONArray:get	(I)Ljava/lang/Object;
    //   10651: invokevirtual 443	java/lang/Object:toString	()Ljava/lang/String;
    //   10654: astore 58
    //   10656: getstatic 1617	com/belkin/wemo/cache/devicelist/UpnpConstants:ENERGY_PER_UNIT_COST_DATA	[Ljava/lang/String;
    //   10659: astore 59
    //   10661: iconst_2
    //   10662: anewarray 297	java/lang/String
    //   10665: astore 60
    //   10667: aload 60
    //   10669: iconst_0
    //   10670: aload_2
    //   10671: iconst_1
    //   10672: invokevirtual 796	org/json/JSONArray:get	(I)Ljava/lang/Object;
    //   10675: invokevirtual 443	java/lang/Object:toString	()Ljava/lang/String;
    //   10678: aastore
    //   10679: aload 60
    //   10681: iconst_1
    //   10682: aload_2
    //   10683: iconst_2
    //   10684: invokevirtual 796	org/json/JSONArray:get	(I)Ljava/lang/Object;
    //   10687: invokevirtual 443	java/lang/Object:toString	()Ljava/lang/String;
    //   10690: aastore
    //   10691: aload_0
    //   10692: new 251	org/apache/cordova/PluginResult
    //   10695: dup
    //   10696: aload 56
    //   10698: aload 57
    //   10700: aload 58
    //   10702: ldc_w 1619
    //   10705: aload 59
    //   10707: aload 60
    //   10709: invokevirtual 1623	com/belkin/cybergarage/wrapper/UpnpDeviceList:setParametersValues	(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;[Ljava/lang/String;)Z
    //   10712: invokespecial 516	org/apache/cordova/PluginResult:<init>	(Lorg/apache/cordova/PluginResult$Status;Z)V
    //   10715: putfield 123	com/belkin/cordova/plugin/DevicePlugin:mPluginResult	Lorg/apache/cordova/PluginResult;
    //   10718: aload_0
    //   10719: getfield 123	com/belkin/cordova/plugin/DevicePlugin:mPluginResult	Lorg/apache/cordova/PluginResult;
    //   10722: iconst_0
    //   10723: invokevirtual 438	org/apache/cordova/PluginResult:setKeepCallback	(Z)V
    //   10726: aload_3
    //   10727: aload_0
    //   10728: getfield 123	com/belkin/cordova/plugin/DevicePlugin:mPluginResult	Lorg/apache/cordova/PluginResult;
    //   10731: invokevirtual 266	org/apache/cordova/CallbackContext:sendPluginResult	(Lorg/apache/cordova/PluginResult;)V
    //   10734: aload_3
    //   10735: invokevirtual 518	org/apache/cordova/CallbackContext:success	()V
    //   10738: goto -9676 -> 1062
    //   10741: ldc 16
    //   10743: ldc_w 1625
    //   10746: invokestatic 293	com/belkin/utils/LogUtils:infoLog	(Ljava/lang/String;Ljava/lang/String;)V
    //   10749: aload_3
    //   10750: aload_0
    //   10751: getfield 119	com/belkin/cordova/plugin/DevicePlugin:mUpnpDeviceList	Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;
    //   10754: aload_2
    //   10755: iconst_0
    //   10756: invokevirtual 796	org/json/JSONArray:get	(I)Ljava/lang/Object;
    //   10759: invokevirtual 443	java/lang/Object:toString	()Ljava/lang/String;
    //   10762: ldc_w 1627
    //   10765: getstatic 1630	com/belkin/wemo/cache/devicelist/UpnpConstants:DATA_EXPORT_ARGS	[Ljava/lang/String;
    //   10768: invokevirtual 1634	com/belkin/cybergarage/wrapper/UpnpDeviceList:getActionResultValuesJSONObject	(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)Lorg/json/JSONObject;
    //   10771: invokevirtual 535	org/apache/cordova/CallbackContext:success	(Lorg/json/JSONObject;)V
    //   10774: goto -9712 -> 1062
    //   10777: ldc 16
    //   10779: ldc_w 1636
    //   10782: invokestatic 293	com/belkin/utils/LogUtils:infoLog	(Ljava/lang/String;Ljava/lang/String;)V
    //   10785: getstatic 257	org/apache/cordova/PluginResult$Status:OK	Lorg/apache/cordova/PluginResult$Status;
    //   10788: astore 51
    //   10790: aload_0
    //   10791: getfield 119	com/belkin/cordova/plugin/DevicePlugin:mUpnpDeviceList	Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;
    //   10794: astore 52
    //   10796: aload_2
    //   10797: iconst_0
    //   10798: invokevirtual 796	org/json/JSONArray:get	(I)Ljava/lang/Object;
    //   10801: invokevirtual 443	java/lang/Object:toString	()Ljava/lang/String;
    //   10804: astore 53
    //   10806: getstatic 1639	com/belkin/wemo/cache/devicelist/UpnpConstants:SCHEDULE_DATA_EXPORT_ARGS	[Ljava/lang/String;
    //   10809: astore 54
    //   10811: iconst_2
    //   10812: anewarray 297	java/lang/String
    //   10815: astore 55
    //   10817: aload 55
    //   10819: iconst_0
    //   10820: aload_2
    //   10821: iconst_1
    //   10822: invokevirtual 796	org/json/JSONArray:get	(I)Ljava/lang/Object;
    //   10825: invokevirtual 443	java/lang/Object:toString	()Ljava/lang/String;
    //   10828: aastore
    //   10829: aload 55
    //   10831: iconst_1
    //   10832: aload_2
    //   10833: iconst_2
    //   10834: invokevirtual 796	org/json/JSONArray:get	(I)Ljava/lang/Object;
    //   10837: invokevirtual 443	java/lang/Object:toString	()Ljava/lang/String;
    //   10840: aastore
    //   10841: aload_0
    //   10842: new 251	org/apache/cordova/PluginResult
    //   10845: dup
    //   10846: aload 51
    //   10848: aload 52
    //   10850: aload 53
    //   10852: ldc_w 1641
    //   10855: aload 54
    //   10857: aload 55
    //   10859: invokevirtual 1623	com/belkin/cybergarage/wrapper/UpnpDeviceList:setParametersValues	(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;[Ljava/lang/String;)Z
    //   10862: invokespecial 516	org/apache/cordova/PluginResult:<init>	(Lorg/apache/cordova/PluginResult$Status;Z)V
    //   10865: putfield 123	com/belkin/cordova/plugin/DevicePlugin:mPluginResult	Lorg/apache/cordova/PluginResult;
    //   10868: aload_0
    //   10869: getfield 123	com/belkin/cordova/plugin/DevicePlugin:mPluginResult	Lorg/apache/cordova/PluginResult;
    //   10872: iconst_0
    //   10873: invokevirtual 438	org/apache/cordova/PluginResult:setKeepCallback	(Z)V
    //   10876: aload_3
    //   10877: aload_0
    //   10878: getfield 123	com/belkin/cordova/plugin/DevicePlugin:mPluginResult	Lorg/apache/cordova/PluginResult;
    //   10881: invokevirtual 266	org/apache/cordova/CallbackContext:sendPluginResult	(Lorg/apache/cordova/PluginResult;)V
    //   10884: aload_3
    //   10885: invokevirtual 518	org/apache/cordova/CallbackContext:success	()V
    //   10888: goto -9826 -> 1062
    //   10891: ldc 16
    //   10893: ldc_w 1643
    //   10896: invokestatic 293	com/belkin/utils/LogUtils:infoLog	(Ljava/lang/String;Ljava/lang/String;)V
    //   10899: aload_3
    //   10900: aload_0
    //   10901: getfield 119	com/belkin/cordova/plugin/DevicePlugin:mUpnpDeviceList	Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;
    //   10904: aload_2
    //   10905: iconst_0
    //   10906: invokevirtual 796	org/json/JSONArray:get	(I)Ljava/lang/Object;
    //   10909: invokevirtual 443	java/lang/Object:toString	()Ljava/lang/String;
    //   10912: ldc_w 1645
    //   10915: getstatic 1587	com/belkin/wemo/cache/devicelist/JSONConstants:NEW_VALUE_POWER_THRESHOLD	Ljava/lang/String;
    //   10918: invokevirtual 1598	com/belkin/cybergarage/wrapper/UpnpDeviceList:getActionResultValue	(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    //   10921: invokevirtual 510	org/apache/cordova/CallbackContext:success	(Ljava/lang/String;)V
    //   10924: goto -9862 -> 1062
    //   10927: aload_0
    //   10928: aload_2
    //   10929: invokespecial 1647	com/belkin/cordova/plugin/DevicePlugin:checkIfWemoPresentAsync	(Lorg/json/JSONArray;)V
    //   10932: aload_3
    //   10933: invokevirtual 518	org/apache/cordova/CallbackContext:success	()V
    //   10936: goto -9874 -> 1062
    //   10939: ldc 16
    //   10941: ldc_w 1649
    //   10944: invokestatic 293	com/belkin/utils/LogUtils:infoLog	(Ljava/lang/String;Ljava/lang/String;)V
    //   10947: aload_0
    //   10948: invokespecial 1651	com/belkin/cordova/plugin/DevicePlugin:registrationDataAsync	()V
    //   10951: aload_3
    //   10952: invokevirtual 518	org/apache/cordova/CallbackContext:success	()V
    //   10955: goto -9893 -> 1062
    //   10958: ldc 16
    //   10960: ldc_w 1653
    //   10963: invokestatic 293	com/belkin/utils/LogUtils:infoLog	(Ljava/lang/String;Ljava/lang/String;)V
    //   10966: aload_0
    //   10967: invokespecial 1655	com/belkin/cordova/plugin/DevicePlugin:registrationStatusAsync	()V
    //   10970: aload_3
    //   10971: invokevirtual 518	org/apache/cordova/CallbackContext:success	()V
    //   10974: goto -9912 -> 1062
    //   10977: ldc 16
    //   10979: ldc_w 1657
    //   10982: invokestatic 293	com/belkin/utils/LogUtils:infoLog	(Ljava/lang/String;Ljava/lang/String;)V
    //   10985: aload_2
    //   10986: invokevirtual 388	org/json/JSONArray:length	()I
    //   10989: anewarray 297	java/lang/String
    //   10992: astore 48
    //   10994: iconst_0
    //   10995: istore 49
    //   10997: aload_2
    //   10998: invokevirtual 388	org/json/JSONArray:length	()I
    //   11001: istore 50
    //   11003: iload 49
    //   11005: iload 50
    //   11007: if_icmpge +20 -> 11027
    //   11010: aload 48
    //   11012: iload 49
    //   11014: aload_2
    //   11015: iload 49
    //   11017: invokevirtual 658	org/json/JSONArray:getString	(I)Ljava/lang/String;
    //   11020: aastore
    //   11021: iinc 49 1
    //   11024: goto -27 -> 10997
    //   11027: aload_3
    //   11028: aload_0
    //   11029: getfield 119	com/belkin/cordova/plugin/DevicePlugin:mUpnpDeviceList	Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;
    //   11032: aload 48
    //   11034: invokevirtual 1660	com/belkin/cybergarage/wrapper/UpnpDeviceList:setNightLightStatus	([Ljava/lang/String;)Ljava/lang/String;
    //   11037: invokevirtual 510	org/apache/cordova/CallbackContext:success	(Ljava/lang/String;)V
    //   11040: goto -9978 -> 1062
    //   11043: ldc 16
    //   11045: ldc_w 1662
    //   11048: invokestatic 293	com/belkin/utils/LogUtils:infoLog	(Ljava/lang/String;Ljava/lang/String;)V
    //   11051: aload_2
    //   11052: invokevirtual 388	org/json/JSONArray:length	()I
    //   11055: anewarray 297	java/lang/String
    //   11058: astore 45
    //   11060: iconst_0
    //   11061: istore 46
    //   11063: aload_2
    //   11064: invokevirtual 388	org/json/JSONArray:length	()I
    //   11067: istore 47
    //   11069: iload 46
    //   11071: iload 47
    //   11073: if_icmpge +20 -> 11093
    //   11076: aload 45
    //   11078: iload 46
    //   11080: aload_2
    //   11081: iload 46
    //   11083: invokevirtual 658	org/json/JSONArray:getString	(I)Ljava/lang/String;
    //   11086: aastore
    //   11087: iinc 46 1
    //   11090: goto -27 -> 11063
    //   11093: aload_3
    //   11094: aload_0
    //   11095: getfield 119	com/belkin/cordova/plugin/DevicePlugin:mUpnpDeviceList	Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;
    //   11098: aload 45
    //   11100: invokevirtual 1665	com/belkin/cybergarage/wrapper/UpnpDeviceList:getNightLightStatus	([Ljava/lang/String;)Ljava/lang/String;
    //   11103: invokevirtual 510	org/apache/cordova/CallbackContext:success	(Ljava/lang/String;)V
    //   11106: goto -10044 -> 1062
    //   11109: aload_2
    //   11110: iconst_0
    //   11111: invokevirtual 658	org/json/JSONArray:getString	(I)Ljava/lang/String;
    //   11114: astore 43
    //   11116: aload_2
    //   11117: iconst_1
    //   11118: invokevirtual 392	org/json/JSONArray:getJSONObject	(I)Lorg/json/JSONObject;
    //   11121: astore 44
    //   11123: getstatic 76	com/belkin/cordova/plugin/DevicePlugin:mWeMoSDKContext	Lcom/belkin/wemo/localsdk/WeMoSDKContext;
    //   11126: aload 43
    //   11128: aload 44
    //   11130: invokevirtual 1669	com/belkin/wemo/localsdk/WeMoSDKContext:setAttriuteState	(Ljava/lang/String;Lorg/json/JSONObject;)V
    //   11133: goto -10071 -> 1062
    //   11136: new 96	android/os/Handler
    //   11139: dup
    //   11140: invokespecial 97	android/os/Handler:<init>	()V
    //   11143: new 1671	com/belkin/cordova/plugin/DevicePlugin$18
    //   11146: dup
    //   11147: aload_0
    //   11148: aload_3
    //   11149: invokespecial 1672	com/belkin/cordova/plugin/DevicePlugin$18:<init>	(Lcom/belkin/cordova/plugin/DevicePlugin;Lorg/apache/cordova/CallbackContext;)V
    //   11152: invokevirtual 1676	android/os/Handler:post	(Ljava/lang/Runnable;)Z
    //   11155: pop
    //   11156: goto -10094 -> 1062
    //   11159: ldc 16
    //   11161: new 277	java/lang/StringBuilder
    //   11164: dup
    //   11165: invokespecial 278	java/lang/StringBuilder:<init>	()V
    //   11168: ldc_w 1678
    //   11171: invokevirtual 284	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   11174: aload_2
    //   11175: iconst_0
    //   11176: invokevirtual 658	org/json/JSONArray:getString	(I)Ljava/lang/String;
    //   11179: invokevirtual 1679	java/lang/String:toString	()Ljava/lang/String;
    //   11182: invokevirtual 284	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   11185: invokevirtual 287	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   11188: invokestatic 908	android/util/Log:d	(Ljava/lang/String;Ljava/lang/String;)I
    //   11191: pop
    //   11192: aload_2
    //   11193: iconst_0
    //   11194: invokevirtual 658	org/json/JSONArray:getString	(I)Ljava/lang/String;
    //   11197: invokevirtual 1679	java/lang/String:toString	()Ljava/lang/String;
    //   11200: ldc_w 1681
    //   11203: invokevirtual 1160	java/lang/String:equalsIgnoreCase	(Ljava/lang/String;)Z
    //   11206: ifeq +15 -> 11221
    //   11209: aload_0
    //   11210: aload_2
    //   11211: invokespecial 1683	com/belkin/cordova/plugin/DevicePlugin:getEndList	(Lorg/json/JSONArray;)V
    //   11214: aload_3
    //   11215: invokevirtual 518	org/apache/cordova/CallbackContext:success	()V
    //   11218: goto -10156 -> 1062
    //   11221: aload_2
    //   11222: iconst_0
    //   11223: invokevirtual 658	org/json/JSONArray:getString	(I)Ljava/lang/String;
    //   11226: invokevirtual 1679	java/lang/String:toString	()Ljava/lang/String;
    //   11229: ldc_w 1685
    //   11232: invokevirtual 1160	java/lang/String:equalsIgnoreCase	(Ljava/lang/String;)Z
    //   11235: ifeq +14 -> 11249
    //   11238: aload_0
    //   11239: invokespecial 1687	com/belkin/cordova/plugin/DevicePlugin:getEndList	()V
    //   11242: aload_3
    //   11243: invokevirtual 518	org/apache/cordova/CallbackContext:success	()V
    //   11246: goto -10184 -> 1062
    //   11249: aload_0
    //   11250: getfield 327	com/belkin/cordova/plugin/DevicePlugin:cordova	Lorg/apache/cordova/CordovaInterface;
    //   11253: invokeinterface 333 1 0
    //   11258: new 1689	com/belkin/cordova/plugin/DevicePlugin$19
    //   11261: dup
    //   11262: aload_0
    //   11263: aload_2
    //   11264: aload_3
    //   11265: invokespecial 1690	com/belkin/cordova/plugin/DevicePlugin$19:<init>	(Lcom/belkin/cordova/plugin/DevicePlugin;Lorg/json/JSONArray;Lorg/apache/cordova/CallbackContext;)V
    //   11268: invokeinterface 341 2 0
    //   11273: goto -10211 -> 1062
    //   11276: aload_0
    //   11277: new 91	org/json/JSONArray
    //   11280: dup
    //   11281: invokespecial 92	org/json/JSONArray:<init>	()V
    //   11284: putfield 94	com/belkin/cordova/plugin/DevicePlugin:getDeviceList	Lorg/json/JSONArray;
    //   11287: aload_0
    //   11288: getfield 99	com/belkin/cordova/plugin/DevicePlugin:mHandler	Landroid/os/Handler;
    //   11291: aload_0
    //   11292: getfield 108	com/belkin/cordova/plugin/DevicePlugin:getDeviceListTask	Ljava/lang/Runnable;
    //   11295: invokevirtual 1693	android/os/Handler:removeCallbacks	(Ljava/lang/Runnable;)V
    //   11298: aload_0
    //   11299: aload_0
    //   11300: getfield 119	com/belkin/cordova/plugin/DevicePlugin:mUpnpDeviceList	Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;
    //   11303: aload_2
    //   11304: iconst_0
    //   11305: invokevirtual 796	org/json/JSONArray:get	(I)Ljava/lang/Object;
    //   11308: invokevirtual 443	java/lang/Object:toString	()Ljava/lang/String;
    //   11311: invokevirtual 1696	com/belkin/cybergarage/wrapper/UpnpDeviceList:getCapabilityProfileList	(Ljava/lang/String;)Lorg/json/JSONArray;
    //   11314: putfield 94	com/belkin/cordova/plugin/DevicePlugin:getDeviceList	Lorg/json/JSONArray;
    //   11317: aload_0
    //   11318: aload_3
    //   11319: putfield 89	com/belkin/cordova/plugin/DevicePlugin:deviceCallbackContext	Lorg/apache/cordova/CallbackContext;
    //   11322: aload_0
    //   11323: getfield 99	com/belkin/cordova/plugin/DevicePlugin:mHandler	Landroid/os/Handler;
    //   11326: aload_0
    //   11327: getfield 108	com/belkin/cordova/plugin/DevicePlugin:getDeviceListTask	Ljava/lang/Runnable;
    //   11330: ldc2_w 1697
    //   11333: invokevirtual 1702	android/os/Handler:postDelayed	(Ljava/lang/Runnable;J)Z
    //   11336: pop
    //   11337: aload_0
    //   11338: getfield 94	com/belkin/cordova/plugin/DevicePlugin:getDeviceList	Lorg/json/JSONArray;
    //   11341: invokevirtual 388	org/json/JSONArray:length	()I
    //   11344: ifle -10282 -> 1062
    //   11347: ldc 16
    //   11349: new 277	java/lang/StringBuilder
    //   11352: dup
    //   11353: invokespecial 278	java/lang/StringBuilder:<init>	()V
    //   11356: ldc_w 1704
    //   11359: invokevirtual 284	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   11362: aload_0
    //   11363: getfield 94	com/belkin/cordova/plugin/DevicePlugin:getDeviceList	Lorg/json/JSONArray;
    //   11366: invokevirtual 317	java/lang/StringBuilder:append	(Ljava/lang/Object;)Ljava/lang/StringBuilder;
    //   11369: invokevirtual 287	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   11372: invokestatic 293	com/belkin/utils/LogUtils:infoLog	(Ljava/lang/String;Ljava/lang/String;)V
    //   11375: aload_0
    //   11376: getfield 99	com/belkin/cordova/plugin/DevicePlugin:mHandler	Landroid/os/Handler;
    //   11379: aload_0
    //   11380: getfield 108	com/belkin/cordova/plugin/DevicePlugin:getDeviceListTask	Ljava/lang/Runnable;
    //   11383: invokevirtual 1693	android/os/Handler:removeCallbacks	(Ljava/lang/Runnable;)V
    //   11386: aload_0
    //   11387: new 251	org/apache/cordova/PluginResult
    //   11390: dup
    //   11391: getstatic 257	org/apache/cordova/PluginResult$Status:OK	Lorg/apache/cordova/PluginResult$Status;
    //   11394: aload_0
    //   11395: getfield 94	com/belkin/cordova/plugin/DevicePlugin:getDeviceList	Lorg/json/JSONArray;
    //   11398: invokespecial 260	org/apache/cordova/PluginResult:<init>	(Lorg/apache/cordova/PluginResult$Status;Lorg/json/JSONArray;)V
    //   11401: putfield 123	com/belkin/cordova/plugin/DevicePlugin:mPluginResult	Lorg/apache/cordova/PluginResult;
    //   11404: aload_0
    //   11405: getfield 123	com/belkin/cordova/plugin/DevicePlugin:mPluginResult	Lorg/apache/cordova/PluginResult;
    //   11408: iconst_0
    //   11409: invokevirtual 438	org/apache/cordova/PluginResult:setKeepCallback	(Z)V
    //   11412: aload_3
    //   11413: aload_0
    //   11414: getfield 123	com/belkin/cordova/plugin/DevicePlugin:mPluginResult	Lorg/apache/cordova/PluginResult;
    //   11417: invokevirtual 266	org/apache/cordova/CallbackContext:sendPluginResult	(Lorg/apache/cordova/PluginResult;)V
    //   11420: goto -10358 -> 1062
    //   11423: aload_3
    //   11424: aload_0
    //   11425: getfield 119	com/belkin/cordova/plugin/DevicePlugin:mUpnpDeviceList	Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;
    //   11428: aload_2
    //   11429: invokevirtual 1707	com/belkin/cybergarage/wrapper/UpnpDeviceList:addBridgeDevices	(Lorg/json/JSONArray;)Lorg/json/JSONArray;
    //   11432: invokevirtual 1122	org/apache/cordova/CallbackContext:success	(Lorg/json/JSONArray;)V
    //   11435: goto -10373 -> 1062
    //   11438: aload_3
    //   11439: aload_0
    //   11440: getfield 119	com/belkin/cordova/plugin/DevicePlugin:mUpnpDeviceList	Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;
    //   11443: aload_2
    //   11444: invokevirtual 1710	com/belkin/cybergarage/wrapper/UpnpDeviceList:removeBridgeDevices	(Lorg/json/JSONArray;)Lorg/json/JSONArray;
    //   11447: invokevirtual 1122	org/apache/cordova/CallbackContext:success	(Lorg/json/JSONArray;)V
    //   11450: goto -10388 -> 1062
    //   11453: getstatic 1716	java/lang/System:out	Ljava/io/PrintStream;
    //   11456: new 277	java/lang/StringBuilder
    //   11459: dup
    //   11460: invokespecial 278	java/lang/StringBuilder:<init>	()V
    //   11463: ldc_w 1718
    //   11466: invokevirtual 284	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   11469: aload_2
    //   11470: invokevirtual 1116	org/json/JSONArray:toString	()Ljava/lang/String;
    //   11473: invokevirtual 284	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   11476: invokevirtual 287	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   11479: invokevirtual 1723	java/io/PrintStream:println	(Ljava/lang/String;)V
    //   11482: aload_3
    //   11483: aload_0
    //   11484: getfield 119	com/belkin/cordova/plugin/DevicePlugin:mUpnpDeviceList	Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;
    //   11487: aload_2
    //   11488: iconst_0
    //   11489: invokevirtual 1067	org/json/JSONArray:getJSONArray	(I)Lorg/json/JSONArray;
    //   11492: aload_2
    //   11493: iconst_1
    //   11494: invokevirtual 1067	org/json/JSONArray:getJSONArray	(I)Lorg/json/JSONArray;
    //   11497: invokevirtual 1727	com/belkin/cybergarage/wrapper/UpnpDeviceList:setLedDeviceStatus	(Lorg/json/JSONArray;Lorg/json/JSONArray;)Lorg/json/JSONArray;
    //   11500: invokevirtual 1122	org/apache/cordova/CallbackContext:success	(Lorg/json/JSONArray;)V
    //   11503: goto -10441 -> 1062
    //   11506: aload_0
    //   11507: aload_2
    //   11508: invokespecial 1729	com/belkin/cordova/plugin/DevicePlugin:getEndListStatus	(Lorg/json/JSONArray;)V
    //   11511: aload_0
    //   11512: new 251	org/apache/cordova/PluginResult
    //   11515: dup
    //   11516: getstatic 257	org/apache/cordova/PluginResult$Status:OK	Lorg/apache/cordova/PluginResult$Status;
    //   11519: invokespecial 582	org/apache/cordova/PluginResult:<init>	(Lorg/apache/cordova/PluginResult$Status;)V
    //   11522: putfield 123	com/belkin/cordova/plugin/DevicePlugin:mPluginResult	Lorg/apache/cordova/PluginResult;
    //   11525: aload_0
    //   11526: getfield 123	com/belkin/cordova/plugin/DevicePlugin:mPluginResult	Lorg/apache/cordova/PluginResult;
    //   11529: iconst_0
    //   11530: invokevirtual 438	org/apache/cordova/PluginResult:setKeepCallback	(Z)V
    //   11533: aload_3
    //   11534: aload_0
    //   11535: getfield 123	com/belkin/cordova/plugin/DevicePlugin:mPluginResult	Lorg/apache/cordova/PluginResult;
    //   11538: invokevirtual 266	org/apache/cordova/CallbackContext:sendPluginResult	(Lorg/apache/cordova/PluginResult;)V
    //   11541: aload_3
    //   11542: invokevirtual 518	org/apache/cordova/CallbackContext:success	()V
    //   11545: goto -10483 -> 1062
    //   11548: aload_0
    //   11549: aload_3
    //   11550: aload_2
    //   11551: invokespecial 1731	com/belkin/cordova/plugin/DevicePlugin:getStatusForGrpLed	(Lorg/apache/cordova/CallbackContext;Lorg/json/JSONArray;)V
    //   11554: goto -10492 -> 1062
    //   11557: aload_3
    //   11558: aload_0
    //   11559: getfield 119	com/belkin/cordova/plugin/DevicePlugin:mUpnpDeviceList	Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;
    //   11562: invokevirtual 1734	com/belkin/cybergarage/wrapper/UpnpDeviceList:closeBridgeNetwork	()Lorg/json/JSONObject;
    //   11565: invokevirtual 535	org/apache/cordova/CallbackContext:success	(Lorg/json/JSONObject;)V
    //   11568: aload_0
    //   11569: getfield 203	com/belkin/cordova/plugin/DevicePlugin:openBridgeNetworkTimer	Ljava/util/Timer;
    //   11572: ifnull -10510 -> 1062
    //   11575: aload_0
    //   11576: getfield 203	com/belkin/cordova/plugin/DevicePlugin:openBridgeNetworkTimer	Ljava/util/Timer;
    //   11579: invokevirtual 1739	java/util/Timer:cancel	()V
    //   11582: aload_0
    //   11583: aconst_null
    //   11584: putfield 203	com/belkin/cordova/plugin/DevicePlugin:openBridgeNetworkTimer	Ljava/util/Timer;
    //   11587: ldc 16
    //   11589: ldc_w 1741
    //   11592: invokestatic 1105	com/belkin/utils/LogUtils:debugLog	(Ljava/lang/String;Ljava/lang/String;)V
    //   11595: goto -10533 -> 1062
    //   11598: aload_3
    //   11599: aload_0
    //   11600: getfield 119	com/belkin/cordova/plugin/DevicePlugin:mUpnpDeviceList	Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;
    //   11603: aload_2
    //   11604: invokevirtual 1744	com/belkin/cybergarage/wrapper/UpnpDeviceList:createGroup	(Lorg/json/JSONArray;)Lorg/json/JSONArray;
    //   11607: invokevirtual 1122	org/apache/cordova/CallbackContext:success	(Lorg/json/JSONArray;)V
    //   11610: goto -10548 -> 1062
    //   11613: aload_3
    //   11614: aload_0
    //   11615: getfield 119	com/belkin/cordova/plugin/DevicePlugin:mUpnpDeviceList	Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;
    //   11618: aload_2
    //   11619: iconst_0
    //   11620: invokevirtual 1067	org/json/JSONArray:getJSONArray	(I)Lorg/json/JSONArray;
    //   11623: iconst_0
    //   11624: invokevirtual 658	org/json/JSONArray:getString	(I)Ljava/lang/String;
    //   11627: invokevirtual 1679	java/lang/String:toString	()Ljava/lang/String;
    //   11630: invokevirtual 1747	com/belkin/cybergarage/wrapper/UpnpDeviceList:deleteGroup	(Ljava/lang/String;)Lorg/json/JSONArray;
    //   11633: invokevirtual 1122	org/apache/cordova/CallbackContext:success	(Lorg/json/JSONArray;)V
    //   11636: goto -10574 -> 1062
    //   11639: ldc 16
    //   11641: new 277	java/lang/StringBuilder
    //   11644: dup
    //   11645: invokespecial 278	java/lang/StringBuilder:<init>	()V
    //   11648: ldc_w 1749
    //   11651: invokevirtual 284	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   11654: aload_2
    //   11655: iconst_0
    //   11656: invokevirtual 796	org/json/JSONArray:get	(I)Ljava/lang/Object;
    //   11659: invokevirtual 443	java/lang/Object:toString	()Ljava/lang/String;
    //   11662: invokevirtual 284	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   11665: invokevirtual 287	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   11668: invokestatic 293	com/belkin/utils/LogUtils:infoLog	(Ljava/lang/String;Ljava/lang/String;)V
    //   11671: aload_3
    //   11672: aload_0
    //   11673: getfield 119	com/belkin/cordova/plugin/DevicePlugin:mUpnpDeviceList	Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;
    //   11676: aload_2
    //   11677: iconst_0
    //   11678: invokevirtual 658	org/json/JSONArray:getString	(I)Ljava/lang/String;
    //   11681: invokevirtual 1679	java/lang/String:toString	()Ljava/lang/String;
    //   11684: invokevirtual 1752	com/belkin/cybergarage/wrapper/UpnpDeviceList:findLedBulb	(Ljava/lang/String;)Lorg/json/JSONArray;
    //   11687: invokevirtual 1122	org/apache/cordova/CallbackContext:success	(Lorg/json/JSONArray;)V
    //   11690: goto -10628 -> 1062
    //   11693: ldc 16
    //   11695: new 277	java/lang/StringBuilder
    //   11698: dup
    //   11699: invokespecial 278	java/lang/StringBuilder:<init>	()V
    //   11702: ldc_w 1754
    //   11705: invokevirtual 284	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   11708: aload_2
    //   11709: iconst_1
    //   11710: invokevirtual 796	org/json/JSONArray:get	(I)Ljava/lang/Object;
    //   11713: invokevirtual 443	java/lang/Object:toString	()Ljava/lang/String;
    //   11716: invokevirtual 284	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   11719: invokevirtual 287	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   11722: invokestatic 293	com/belkin/utils/LogUtils:infoLog	(Ljava/lang/String;Ljava/lang/String;)V
    //   11725: aload_3
    //   11726: aload_0
    //   11727: getfield 119	com/belkin/cordova/plugin/DevicePlugin:mUpnpDeviceList	Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;
    //   11730: aload_2
    //   11731: invokevirtual 1757	com/belkin/cybergarage/wrapper/UpnpDeviceList:setLedFriendlyName	(Lorg/json/JSONArray;)Lorg/json/JSONArray;
    //   11734: invokevirtual 1122	org/apache/cordova/CallbackContext:success	(Lorg/json/JSONArray;)V
    //   11737: goto -10675 -> 1062
    //   11740: ldc 16
    //   11742: ldc_w 1759
    //   11745: invokestatic 293	com/belkin/utils/LogUtils:infoLog	(Ljava/lang/String;Ljava/lang/String;)V
    //   11748: new 91	org/json/JSONArray
    //   11751: dup
    //   11752: invokespecial 92	org/json/JSONArray:<init>	()V
    //   11755: astore 23
    //   11757: new 383	java/util/ArrayList
    //   11760: dup
    //   11761: invokespecial 384	java/util/ArrayList:<init>	()V
    //   11764: astore 24
    //   11766: getstatic 78	com/belkin/cordova/plugin/DevicePlugin:mDLM	Lcom/belkin/wemo/cache/devicelist/DeviceListManager;
    //   11769: invokevirtual 544	com/belkin/wemo/cache/devicelist/DeviceListManager:getDeviceInformation	()Ljava/util/ArrayList;
    //   11772: invokevirtual 548	java/util/ArrayList:iterator	()Ljava/util/Iterator;
    //   11775: astore 25
    //   11777: aload 25
    //   11779: invokeinterface 553 1 0
    //   11784: ifeq +225 -> 12009
    //   11787: aload 25
    //   11789: invokeinterface 557 1 0
    //   11794: checkcast 559	com/belkin/wemo/cache/data/DeviceInformation
    //   11797: astore 26
    //   11799: new 394	org/json/JSONObject
    //   11802: dup
    //   11803: invokespecial 425	org/json/JSONObject:<init>	()V
    //   11806: astore 27
    //   11808: aload 26
    //   11810: invokevirtual 1762	com/belkin/wemo/cache/data/DeviceInformation:getProductType	()Ljava/lang/String;
    //   11813: ldc_w 1764
    //   11816: invokevirtual 1160	java/lang/String:equalsIgnoreCase	(Ljava/lang/String;)Z
    //   11819: ifeq -42 -> 11777
    //   11822: aload 26
    //   11824: invokevirtual 1767	com/belkin/wemo/cache/data/DeviceInformation:getBridgeUDN	()Ljava/lang/String;
    //   11827: invokestatic 1771	android/text/TextUtils:isEmpty	(Ljava/lang/CharSequence;)Z
    //   11830: ifne -53 -> 11777
    //   11833: aload 26
    //   11835: invokevirtual 1774	com/belkin/wemo/cache/data/DeviceInformation:getGroupID	()Ljava/lang/String;
    //   11838: astore 28
    //   11840: aload 28
    //   11842: invokestatic 1771	android/text/TextUtils:isEmpty	(Ljava/lang/CharSequence;)Z
    //   11845: ifeq +78 -> 11923
    //   11848: aload 26
    //   11850: invokevirtual 562	com/belkin/wemo/cache/data/DeviceInformation:getInActive	()I
    //   11853: ifne -76 -> 11777
    //   11856: aload 27
    //   11858: ldc_w 595
    //   11861: aload 26
    //   11863: invokevirtual 598	com/belkin/wemo/cache/data/DeviceInformation:getFriendlyName	()Ljava/lang/String;
    //   11866: invokevirtual 430	org/json/JSONObject:put	(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    //   11869: pop
    //   11870: aload 27
    //   11872: ldc_w 605
    //   11875: aload 26
    //   11877: invokevirtual 567	com/belkin/wemo/cache/data/DeviceInformation:getUDN	()Ljava/lang/String;
    //   11880: invokevirtual 430	org/json/JSONObject:put	(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    //   11883: pop
    //   11884: aload 27
    //   11886: ldc_w 1164
    //   11889: aload 26
    //   11891: invokevirtual 1167	com/belkin/wemo/cache/data/DeviceInformation:getProductName	()Ljava/lang/String;
    //   11894: invokevirtual 430	org/json/JSONObject:put	(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    //   11897: pop
    //   11898: aload 27
    //   11900: ldc_w 1776
    //   11903: aload 26
    //   11905: invokevirtual 1767	com/belkin/wemo/cache/data/DeviceInformation:getBridgeUDN	()Ljava/lang/String;
    //   11908: invokevirtual 430	org/json/JSONObject:put	(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    //   11911: pop
    //   11912: aload 23
    //   11914: aload 27
    //   11916: invokevirtual 249	org/json/JSONArray:put	(Ljava/lang/Object;)Lorg/json/JSONArray;
    //   11919: pop
    //   11920: goto -143 -> 11777
    //   11923: aload 24
    //   11925: aload 28
    //   11927: invokeinterface 1778 2 0
    //   11932: ifne -155 -> 11777
    //   11935: aload 24
    //   11937: aload 28
    //   11939: invokeinterface 1098 2 0
    //   11944: pop
    //   11945: aload 27
    //   11947: ldc_w 595
    //   11950: aload 26
    //   11952: invokevirtual 1781	com/belkin/wemo/cache/data/DeviceInformation:getGroupName	()Ljava/lang/String;
    //   11955: invokevirtual 430	org/json/JSONObject:put	(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    //   11958: pop
    //   11959: aload 27
    //   11961: ldc_w 605
    //   11964: aload 28
    //   11966: invokevirtual 430	org/json/JSONObject:put	(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    //   11969: pop
    //   11970: aload 27
    //   11972: ldc_w 1164
    //   11975: aload 26
    //   11977: invokevirtual 1167	com/belkin/wemo/cache/data/DeviceInformation:getProductName	()Ljava/lang/String;
    //   11980: invokevirtual 430	org/json/JSONObject:put	(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    //   11983: pop
    //   11984: aload 27
    //   11986: ldc_w 1776
    //   11989: aload 26
    //   11991: invokevirtual 1767	com/belkin/wemo/cache/data/DeviceInformation:getBridgeUDN	()Ljava/lang/String;
    //   11994: invokevirtual 430	org/json/JSONObject:put	(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    //   11997: pop
    //   11998: aload 23
    //   12000: aload 27
    //   12002: invokevirtual 249	org/json/JSONArray:put	(Ljava/lang/Object;)Lorg/json/JSONArray;
    //   12005: pop
    //   12006: goto -229 -> 11777
    //   12009: ldc 16
    //   12011: new 277	java/lang/StringBuilder
    //   12014: dup
    //   12015: invokespecial 278	java/lang/StringBuilder:<init>	()V
    //   12018: ldc_w 1783
    //   12021: invokevirtual 284	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   12024: aload 23
    //   12026: invokevirtual 1116	org/json/JSONArray:toString	()Ljava/lang/String;
    //   12029: invokevirtual 284	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   12032: invokevirtual 287	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   12035: invokestatic 1105	com/belkin/utils/LogUtils:debugLog	(Ljava/lang/String;Ljava/lang/String;)V
    //   12038: aload_3
    //   12039: new 251	org/apache/cordova/PluginResult
    //   12042: dup
    //   12043: getstatic 257	org/apache/cordova/PluginResult$Status:OK	Lorg/apache/cordova/PluginResult$Status;
    //   12046: aload 23
    //   12048: invokespecial 260	org/apache/cordova/PluginResult:<init>	(Lorg/apache/cordova/PluginResult$Status;Lorg/json/JSONArray;)V
    //   12051: invokevirtual 266	org/apache/cordova/CallbackContext:sendPluginResult	(Lorg/apache/cordova/PluginResult;)V
    //   12054: goto -10992 -> 1062
    //   12057: ldc 16
    //   12059: ldc_w 1785
    //   12062: invokestatic 293	com/belkin/utils/LogUtils:infoLog	(Ljava/lang/String;Ljava/lang/String;)V
    //   12065: new 251	org/apache/cordova/PluginResult
    //   12068: dup
    //   12069: getstatic 257	org/apache/cordova/PluginResult$Status:OK	Lorg/apache/cordova/PluginResult$Status;
    //   12072: ldc_w 1787
    //   12075: invokespecial 320	org/apache/cordova/PluginResult:<init>	(Lorg/apache/cordova/PluginResult$Status;Ljava/lang/String;)V
    //   12078: astore 22
    //   12080: aload 22
    //   12082: iconst_0
    //   12083: invokevirtual 438	org/apache/cordova/PluginResult:setKeepCallback	(Z)V
    //   12086: aload_3
    //   12087: aload 22
    //   12089: invokevirtual 266	org/apache/cordova/CallbackContext:sendPluginResult	(Lorg/apache/cordova/PluginResult;)V
    //   12092: goto -11030 -> 1062
    //   12095: ldc 16
    //   12097: ldc_w 1789
    //   12100: invokestatic 293	com/belkin/utils/LogUtils:infoLog	(Ljava/lang/String;Ljava/lang/String;)V
    //   12103: new 251	org/apache/cordova/PluginResult
    //   12106: dup
    //   12107: getstatic 257	org/apache/cordova/PluginResult$Status:OK	Lorg/apache/cordova/PluginResult$Status;
    //   12110: ldc_w 1787
    //   12113: invokespecial 320	org/apache/cordova/PluginResult:<init>	(Lorg/apache/cordova/PluginResult$Status;Ljava/lang/String;)V
    //   12116: astore 21
    //   12118: aload 21
    //   12120: iconst_0
    //   12121: invokevirtual 438	org/apache/cordova/PluginResult:setKeepCallback	(Z)V
    //   12124: aload_3
    //   12125: aload 21
    //   12127: invokevirtual 266	org/apache/cordova/CallbackContext:sendPluginResult	(Lorg/apache/cordova/PluginResult;)V
    //   12130: goto -11068 -> 1062
    //   12133: ldc 16
    //   12135: ldc_w 1791
    //   12138: invokestatic 293	com/belkin/utils/LogUtils:infoLog	(Ljava/lang/String;Ljava/lang/String;)V
    //   12141: new 251	org/apache/cordova/PluginResult
    //   12144: dup
    //   12145: getstatic 257	org/apache/cordova/PluginResult$Status:OK	Lorg/apache/cordova/PluginResult$Status;
    //   12148: ldc_w 1787
    //   12151: invokespecial 320	org/apache/cordova/PluginResult:<init>	(Lorg/apache/cordova/PluginResult$Status;Ljava/lang/String;)V
    //   12154: astore 20
    //   12156: aload 20
    //   12158: iconst_0
    //   12159: invokevirtual 438	org/apache/cordova/PluginResult:setKeepCallback	(Z)V
    //   12162: aload_3
    //   12163: aload 20
    //   12165: invokevirtual 266	org/apache/cordova/CallbackContext:sendPluginResult	(Lorg/apache/cordova/PluginResult;)V
    //   12168: goto -11106 -> 1062
    //   12171: ldc 16
    //   12173: new 277	java/lang/StringBuilder
    //   12176: dup
    //   12177: invokespecial 278	java/lang/StringBuilder:<init>	()V
    //   12180: ldc_w 1793
    //   12183: invokevirtual 284	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   12186: aload_2
    //   12187: iconst_0
    //   12188: invokevirtual 796	org/json/JSONArray:get	(I)Ljava/lang/Object;
    //   12191: invokevirtual 443	java/lang/Object:toString	()Ljava/lang/String;
    //   12194: invokevirtual 284	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   12197: invokevirtual 287	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   12200: invokestatic 293	com/belkin/utils/LogUtils:infoLog	(Ljava/lang/String;Ljava/lang/String;)V
    //   12203: aload_0
    //   12204: getfield 119	com/belkin/cordova/plugin/DevicePlugin:mUpnpDeviceList	Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;
    //   12207: aload_2
    //   12208: iconst_0
    //   12209: invokevirtual 796	org/json/JSONArray:get	(I)Ljava/lang/Object;
    //   12212: invokevirtual 443	java/lang/Object:toString	()Ljava/lang/String;
    //   12215: invokevirtual 1796	com/belkin/cybergarage/wrapper/UpnpDeviceList:removeLed	(Ljava/lang/String;)Z
    //   12218: pop
    //   12219: aload_3
    //   12220: invokevirtual 518	org/apache/cordova/CallbackContext:success	()V
    //   12223: goto -11161 -> 1062
    //   12226: astore 18
    //   12228: aload 18
    //   12230: invokevirtual 651	java/lang/Exception:printStackTrace	()V
    //   12233: goto -14 -> 12219
    //   12236: ldc 16
    //   12238: ldc_w 1798
    //   12241: invokestatic 293	com/belkin/utils/LogUtils:infoLog	(Ljava/lang/String;Ljava/lang/String;)V
    //   12244: aload_0
    //   12245: getfield 193	com/belkin/cordova/plugin/DevicePlugin:mWiFiSecurityUtil	Lcom/belkin/utils/WiFiSecurityUtil;
    //   12248: getstatic 373	com/belkin/cordova/plugin/DevicePlugin:mContext	Landroid/content/Context;
    //   12251: invokevirtual 819	com/belkin/utils/WiFiSecurityUtil:generateAuthCode	(Landroid/content/Context;)Ljava/lang/String;
    //   12254: astore 9
    //   12256: ldc 16
    //   12258: new 277	java/lang/StringBuilder
    //   12261: dup
    //   12262: invokespecial 278	java/lang/StringBuilder:<init>	()V
    //   12265: ldc_w 1424
    //   12268: invokevirtual 284	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   12271: aload 9
    //   12273: invokevirtual 1801	java/lang/String:trim	()Ljava/lang/String;
    //   12276: invokevirtual 284	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   12279: invokevirtual 287	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   12282: invokestatic 293	com/belkin/utils/LogUtils:infoLog	(Ljava/lang/String;Ljava/lang/String;)V
    //   12285: ldc 16
    //   12287: new 277	java/lang/StringBuilder
    //   12290: dup
    //   12291: invokespecial 278	java/lang/StringBuilder:<init>	()V
    //   12294: ldc_w 1426
    //   12297: invokevirtual 284	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   12300: aload_2
    //   12301: iconst_0
    //   12302: invokevirtual 658	org/json/JSONArray:getString	(I)Ljava/lang/String;
    //   12305: invokevirtual 284	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   12308: invokevirtual 287	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   12311: invokestatic 293	com/belkin/utils/LogUtils:infoLog	(Ljava/lang/String;Ljava/lang/String;)V
    //   12314: ldc 16
    //   12316: new 277	java/lang/StringBuilder
    //   12319: dup
    //   12320: invokespecial 278	java/lang/StringBuilder:<init>	()V
    //   12323: ldc_w 1803
    //   12326: invokevirtual 284	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   12329: aload_2
    //   12330: iconst_1
    //   12331: invokevirtual 658	org/json/JSONArray:getString	(I)Ljava/lang/String;
    //   12334: invokevirtual 284	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   12337: invokevirtual 287	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   12340: invokestatic 293	com/belkin/utils/LogUtils:infoLog	(Ljava/lang/String;Ljava/lang/String;)V
    //   12343: aload_0
    //   12344: bipush 8
    //   12346: anewarray 297	java/lang/String
    //   12349: putfield 1428	com/belkin/cordova/plugin/DevicePlugin:param	[Ljava/lang/String;
    //   12352: aload_0
    //   12353: getfield 1428	com/belkin/cordova/plugin/DevicePlugin:param	[Ljava/lang/String;
    //   12356: iconst_0
    //   12357: sipush 5023
    //   12360: invokestatic 1431	java/lang/String:valueOf	(I)Ljava/lang/String;
    //   12363: aastore
    //   12364: aload_0
    //   12365: getfield 1428	com/belkin/cordova/plugin/DevicePlugin:param	[Ljava/lang/String;
    //   12368: iconst_1
    //   12369: aload 9
    //   12371: invokevirtual 1801	java/lang/String:trim	()Ljava/lang/String;
    //   12374: aastore
    //   12375: aload_0
    //   12376: getfield 1428	com/belkin/cordova/plugin/DevicePlugin:param	[Ljava/lang/String;
    //   12379: iconst_2
    //   12380: aload_2
    //   12381: iconst_0
    //   12382: invokevirtual 658	org/json/JSONArray:getString	(I)Ljava/lang/String;
    //   12385: aastore
    //   12386: aload_0
    //   12387: getfield 1428	com/belkin/cordova/plugin/DevicePlugin:param	[Ljava/lang/String;
    //   12390: iconst_3
    //   12391: aload_2
    //   12392: iconst_1
    //   12393: invokevirtual 658	org/json/JSONArray:getString	(I)Ljava/lang/String;
    //   12396: aastore
    //   12397: aload_0
    //   12398: getfield 1428	com/belkin/cordova/plugin/DevicePlugin:param	[Ljava/lang/String;
    //   12401: iconst_4
    //   12402: aload_2
    //   12403: iconst_2
    //   12404: invokevirtual 658	org/json/JSONArray:getString	(I)Ljava/lang/String;
    //   12407: aastore
    //   12408: aload_0
    //   12409: getfield 1428	com/belkin/cordova/plugin/DevicePlugin:param	[Ljava/lang/String;
    //   12412: iconst_5
    //   12413: aload_2
    //   12414: iconst_3
    //   12415: invokevirtual 658	org/json/JSONArray:getString	(I)Ljava/lang/String;
    //   12418: aastore
    //   12419: aload_0
    //   12420: getfield 1428	com/belkin/cordova/plugin/DevicePlugin:param	[Ljava/lang/String;
    //   12423: bipush 6
    //   12425: aload_2
    //   12426: iconst_4
    //   12427: invokevirtual 658	org/json/JSONArray:getString	(I)Ljava/lang/String;
    //   12430: aastore
    //   12431: aload_0
    //   12432: getfield 1428	com/belkin/cordova/plugin/DevicePlugin:param	[Ljava/lang/String;
    //   12435: bipush 7
    //   12437: aload_2
    //   12438: iconst_5
    //   12439: invokevirtual 658	org/json/JSONArray:getString	(I)Ljava/lang/String;
    //   12442: aastore
    //   12443: aload_0
    //   12444: new 1433	com/belkin/remoteservice/RestfulWebservice
    //   12447: dup
    //   12448: aload_0
    //   12449: getfield 1428	com/belkin/cordova/plugin/DevicePlugin:param	[Ljava/lang/String;
    //   12452: getstatic 373	com/belkin/cordova/plugin/DevicePlugin:mContext	Landroid/content/Context;
    //   12455: invokespecial 1436	com/belkin/remoteservice/RestfulWebservice:<init>	([Ljava/lang/String;Landroid/content/Context;)V
    //   12458: putfield 1438	com/belkin/cordova/plugin/DevicePlugin:objHttpConnection	Lcom/belkin/remoteservice/RestfulWebservice;
    //   12461: aload_0
    //   12462: aload_0
    //   12463: getfield 1438	com/belkin/cordova/plugin/DevicePlugin:objHttpConnection	Lcom/belkin/remoteservice/RestfulWebservice;
    //   12466: iconst_0
    //   12467: anewarray 1440	java/lang/Void
    //   12470: invokevirtual 1443	com/belkin/remoteservice/RestfulWebservice:execute	([Ljava/lang/Object;)Landroid/os/AsyncTask;
    //   12473: invokevirtual 1447	android/os/AsyncTask:get	()Ljava/lang/Object;
    //   12476: checkcast 1449	com/belkin/remoteservice/HttpResponseObject
    //   12479: putfield 1451	com/belkin/cordova/plugin/DevicePlugin:httpResponseObject	Lcom/belkin/remoteservice/HttpResponseObject;
    //   12482: ldc 16
    //   12484: new 277	java/lang/StringBuilder
    //   12487: dup
    //   12488: invokespecial 278	java/lang/StringBuilder:<init>	()V
    //   12491: ldc_w 1805
    //   12494: invokevirtual 284	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   12497: aload_0
    //   12498: getfield 1451	com/belkin/cordova/plugin/DevicePlugin:httpResponseObject	Lcom/belkin/remoteservice/HttpResponseObject;
    //   12501: invokevirtual 1456	com/belkin/remoteservice/HttpResponseObject:getResponseCode	()I
    //   12504: invokevirtual 478	java/lang/StringBuilder:append	(I)Ljava/lang/StringBuilder;
    //   12507: invokevirtual 287	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   12510: invokestatic 1064	android/util/Log:v	(Ljava/lang/String;Ljava/lang/String;)I
    //   12513: pop
    //   12514: aload_0
    //   12515: getfield 1438	com/belkin/cordova/plugin/DevicePlugin:objHttpConnection	Lcom/belkin/remoteservice/RestfulWebservice;
    //   12518: invokevirtual 1460	com/belkin/remoteservice/RestfulWebservice:getStatus	()Landroid/os/AsyncTask$Status;
    //   12521: getstatic 1466	android/os/AsyncTask$Status:RUNNING	Landroid/os/AsyncTask$Status;
    //   12524: invokevirtual 1467	android/os/AsyncTask$Status:equals	(Ljava/lang/Object;)Z
    //   12527: ifeq +42 -> 12569
    //   12530: ldc2_w 585
    //   12533: invokestatic 590	java/lang/Thread:sleep	(J)V
    //   12536: goto -22 -> 12514
    //   12539: astore 15
    //   12541: aload 15
    //   12543: invokevirtual 639	java/lang/InterruptedException:printStackTrace	()V
    //   12546: goto -32 -> 12514
    //   12549: astore 16
    //   12551: aload 16
    //   12553: invokevirtual 639	java/lang/InterruptedException:printStackTrace	()V
    //   12556: goto -42 -> 12514
    //   12559: astore 10
    //   12561: aload 10
    //   12563: invokevirtual 1468	java/util/concurrent/ExecutionException:printStackTrace	()V
    //   12566: goto -52 -> 12514
    //   12569: new 91	org/json/JSONArray
    //   12572: dup
    //   12573: invokespecial 92	org/json/JSONArray:<init>	()V
    //   12576: astore 11
    //   12578: aload_0
    //   12579: getfield 1451	com/belkin/cordova/plugin/DevicePlugin:httpResponseObject	Lcom/belkin/remoteservice/HttpResponseObject;
    //   12582: invokevirtual 1456	com/belkin/remoteservice/HttpResponseObject:getResponseCode	()I
    //   12585: istore 12
    //   12587: aload 11
    //   12589: iload 12
    //   12591: invokevirtual 1807	org/json/JSONArray:put	(I)Lorg/json/JSONArray;
    //   12594: pop
    //   12595: iload 12
    //   12597: sipush 200
    //   12600: if_icmpne +23 -> 12623
    //   12603: aload 11
    //   12605: new 297	java/lang/String
    //   12608: dup
    //   12609: aload_0
    //   12610: getfield 1451	com/belkin/cordova/plugin/DevicePlugin:httpResponseObject	Lcom/belkin/remoteservice/HttpResponseObject;
    //   12613: invokevirtual 1811	com/belkin/remoteservice/HttpResponseObject:getDataReceived	()[B
    //   12616: invokespecial 1814	java/lang/String:<init>	([B)V
    //   12619: invokevirtual 249	org/json/JSONArray:put	(Ljava/lang/Object;)Lorg/json/JSONArray;
    //   12622: pop
    //   12623: ldc 16
    //   12625: new 277	java/lang/StringBuilder
    //   12628: dup
    //   12629: invokespecial 278	java/lang/StringBuilder:<init>	()V
    //   12632: ldc_w 1816
    //   12635: invokevirtual 284	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   12638: aload_0
    //   12639: getfield 1451	com/belkin/cordova/plugin/DevicePlugin:httpResponseObject	Lcom/belkin/remoteservice/HttpResponseObject;
    //   12642: invokevirtual 1456	com/belkin/remoteservice/HttpResponseObject:getResponseCode	()I
    //   12645: invokevirtual 478	java/lang/StringBuilder:append	(I)Ljava/lang/StringBuilder;
    //   12648: invokevirtual 287	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   12651: invokestatic 293	com/belkin/utils/LogUtils:infoLog	(Ljava/lang/String;Ljava/lang/String;)V
    //   12654: aload_0
    //   12655: new 251	org/apache/cordova/PluginResult
    //   12658: dup
    //   12659: getstatic 257	org/apache/cordova/PluginResult$Status:OK	Lorg/apache/cordova/PluginResult$Status;
    //   12662: aload 11
    //   12664: invokespecial 260	org/apache/cordova/PluginResult:<init>	(Lorg/apache/cordova/PluginResult$Status;Lorg/json/JSONArray;)V
    //   12667: putfield 123	com/belkin/cordova/plugin/DevicePlugin:mPluginResult	Lorg/apache/cordova/PluginResult;
    //   12670: aload_0
    //   12671: getfield 123	com/belkin/cordova/plugin/DevicePlugin:mPluginResult	Lorg/apache/cordova/PluginResult;
    //   12674: iconst_0
    //   12675: invokevirtual 438	org/apache/cordova/PluginResult:setKeepCallback	(Z)V
    //   12678: aload_3
    //   12679: aload_0
    //   12680: getfield 123	com/belkin/cordova/plugin/DevicePlugin:mPluginResult	Lorg/apache/cordova/PluginResult;
    //   12683: invokevirtual 266	org/apache/cordova/CallbackContext:sendPluginResult	(Lorg/apache/cordova/PluginResult;)V
    //   12686: aload_3
    //   12687: invokevirtual 518	org/apache/cordova/CallbackContext:success	()V
    //   12690: goto -11628 -> 1062
    //   12693: dconst_0
    //   12694: invokestatic 1821	java/lang/Double:valueOf	(D)Ljava/lang/Double;
    //   12697: astore 6
    //   12699: dconst_0
    //   12700: invokestatic 1821	java/lang/Double:valueOf	(D)Ljava/lang/Double;
    //   12703: astore 7
    //   12705: new 1823	com/belkin/utils/GPSTracker
    //   12708: dup
    //   12709: getstatic 373	com/belkin/cordova/plugin/DevicePlugin:mContext	Landroid/content/Context;
    //   12712: invokespecial 1824	com/belkin/utils/GPSTracker:<init>	(Landroid/content/Context;)V
    //   12715: astore 8
    //   12717: aload 8
    //   12719: invokevirtual 1827	com/belkin/utils/GPSTracker:canGetLocation	()Z
    //   12722: ifeq +23 -> 12745
    //   12725: aload 8
    //   12727: invokevirtual 1831	com/belkin/utils/GPSTracker:getLatitude	()D
    //   12730: invokestatic 1821	java/lang/Double:valueOf	(D)Ljava/lang/Double;
    //   12733: astore 6
    //   12735: aload 8
    //   12737: invokevirtual 1834	com/belkin/utils/GPSTracker:getLongitude	()D
    //   12740: invokestatic 1821	java/lang/Double:valueOf	(D)Ljava/lang/Double;
    //   12743: astore 7
    //   12745: aload_3
    //   12746: new 277	java/lang/StringBuilder
    //   12749: dup
    //   12750: invokespecial 278	java/lang/StringBuilder:<init>	()V
    //   12753: ldc_w 295
    //   12756: invokevirtual 284	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   12759: getstatic 1840	com/belkin/rules/utils/RulesConstants:SHARP	C
    //   12762: invokevirtual 1843	java/lang/StringBuilder:append	(C)Ljava/lang/StringBuilder;
    //   12765: aload 6
    //   12767: invokevirtual 1844	java/lang/Double:toString	()Ljava/lang/String;
    //   12770: invokevirtual 284	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   12773: getstatic 1847	com/belkin/rules/utils/RulesConstants:COMMA	C
    //   12776: invokevirtual 1843	java/lang/StringBuilder:append	(C)Ljava/lang/StringBuilder;
    //   12779: aload 7
    //   12781: invokevirtual 1844	java/lang/Double:toString	()Ljava/lang/String;
    //   12784: invokevirtual 284	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   12787: invokevirtual 287	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   12790: invokevirtual 510	org/apache/cordova/CallbackContext:success	(Ljava/lang/String;)V
    //   12793: goto -11731 -> 1062
    //   12796: aload_0
    //   12797: getfield 189	com/belkin/cordova/plugin/DevicePlugin:mSharePreference	Lcom/belkin/wemo/cache/utils/SharePreferences;
    //   12800: aload_2
    //   12801: invokevirtual 1116	org/json/JSONArray:toString	()Ljava/lang/String;
    //   12804: invokevirtual 1850	com/belkin/wemo/cache/utils/SharePreferences:saveBridgeSetup	(Ljava/lang/String;)V
    //   12807: aload_3
    //   12808: invokevirtual 518	org/apache/cordova/CallbackContext:success	()V
    //   12811: goto -11749 -> 1062
    //   12814: aload_0
    //   12815: new 251	org/apache/cordova/PluginResult
    //   12818: dup
    //   12819: getstatic 257	org/apache/cordova/PluginResult$Status:OK	Lorg/apache/cordova/PluginResult$Status;
    //   12822: aload_0
    //   12823: getfield 189	com/belkin/cordova/plugin/DevicePlugin:mSharePreference	Lcom/belkin/wemo/cache/utils/SharePreferences;
    //   12826: invokevirtual 1853	com/belkin/wemo/cache/utils/SharePreferences:getbridgeValues	()Ljava/lang/String;
    //   12829: invokespecial 320	org/apache/cordova/PluginResult:<init>	(Lorg/apache/cordova/PluginResult$Status;Ljava/lang/String;)V
    //   12832: putfield 123	com/belkin/cordova/plugin/DevicePlugin:mPluginResult	Lorg/apache/cordova/PluginResult;
    //   12835: aload_0
    //   12836: getfield 123	com/belkin/cordova/plugin/DevicePlugin:mPluginResult	Lorg/apache/cordova/PluginResult;
    //   12839: iconst_0
    //   12840: invokevirtual 438	org/apache/cordova/PluginResult:setKeepCallback	(Z)V
    //   12843: aload_3
    //   12844: aload_0
    //   12845: getfield 123	com/belkin/cordova/plugin/DevicePlugin:mPluginResult	Lorg/apache/cordova/PluginResult;
    //   12848: invokevirtual 266	org/apache/cordova/CallbackContext:sendPluginResult	(Lorg/apache/cordova/PluginResult;)V
    //   12851: aload_3
    //   12852: invokevirtual 518	org/apache/cordova/CallbackContext:success	()V
    //   12855: aload_3
    //   12856: invokevirtual 518	org/apache/cordova/CallbackContext:success	()V
    //   12859: goto -11797 -> 1062
    //   12862: ldc 16
    //   12864: new 277	java/lang/StringBuilder
    //   12867: dup
    //   12868: invokespecial 278	java/lang/StringBuilder:<init>	()V
    //   12871: ldc_w 1855
    //   12874: invokevirtual 284	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   12877: aload_2
    //   12878: iconst_0
    //   12879: invokevirtual 658	org/json/JSONArray:getString	(I)Ljava/lang/String;
    //   12882: invokevirtual 284	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   12885: ldc_w 1857
    //   12888: invokevirtual 284	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   12891: aload_2
    //   12892: iconst_1
    //   12893: invokevirtual 658	org/json/JSONArray:getString	(I)Ljava/lang/String;
    //   12896: invokevirtual 284	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   12899: invokevirtual 287	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   12902: invokestatic 293	com/belkin/utils/LogUtils:infoLog	(Ljava/lang/String;Ljava/lang/String;)V
    //   12905: aload_0
    //   12906: getfield 189	com/belkin/cordova/plugin/DevicePlugin:mSharePreference	Lcom/belkin/wemo/cache/utils/SharePreferences;
    //   12909: aload_2
    //   12910: iconst_0
    //   12911: invokevirtual 796	org/json/JSONArray:get	(I)Ljava/lang/Object;
    //   12914: invokevirtual 443	java/lang/Object:toString	()Ljava/lang/String;
    //   12917: aload_2
    //   12918: iconst_1
    //   12919: invokevirtual 796	org/json/JSONArray:get	(I)Ljava/lang/Object;
    //   12922: invokevirtual 443	java/lang/Object:toString	()Ljava/lang/String;
    //   12925: invokevirtual 1860	com/belkin/wemo/cache/utils/SharePreferences:setFaderPref	(Ljava/lang/String;Ljava/lang/String;)V
    //   12928: aload_0
    //   12929: new 251	org/apache/cordova/PluginResult
    //   12932: dup
    //   12933: getstatic 257	org/apache/cordova/PluginResult$Status:OK	Lorg/apache/cordova/PluginResult$Status;
    //   12936: invokespecial 582	org/apache/cordova/PluginResult:<init>	(Lorg/apache/cordova/PluginResult$Status;)V
    //   12939: putfield 123	com/belkin/cordova/plugin/DevicePlugin:mPluginResult	Lorg/apache/cordova/PluginResult;
    //   12942: aload_0
    //   12943: getfield 123	com/belkin/cordova/plugin/DevicePlugin:mPluginResult	Lorg/apache/cordova/PluginResult;
    //   12946: iconst_0
    //   12947: invokevirtual 438	org/apache/cordova/PluginResult:setKeepCallback	(Z)V
    //   12950: aload_3
    //   12951: aload_0
    //   12952: getfield 123	com/belkin/cordova/plugin/DevicePlugin:mPluginResult	Lorg/apache/cordova/PluginResult;
    //   12955: invokevirtual 266	org/apache/cordova/CallbackContext:sendPluginResult	(Lorg/apache/cordova/PluginResult;)V
    //   12958: aload_3
    //   12959: invokevirtual 518	org/apache/cordova/CallbackContext:success	()V
    //   12962: goto -11900 -> 1062
    //   12965: ldc 16
    //   12967: new 277	java/lang/StringBuilder
    //   12970: dup
    //   12971: invokespecial 278	java/lang/StringBuilder:<init>	()V
    //   12974: ldc_w 1862
    //   12977: invokevirtual 284	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   12980: aload_2
    //   12981: iconst_0
    //   12982: invokevirtual 658	org/json/JSONArray:getString	(I)Ljava/lang/String;
    //   12985: invokevirtual 284	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   12988: invokevirtual 287	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   12991: invokestatic 293	com/belkin/utils/LogUtils:infoLog	(Ljava/lang/String;Ljava/lang/String;)V
    //   12994: aload_0
    //   12995: new 251	org/apache/cordova/PluginResult
    //   12998: dup
    //   12999: getstatic 257	org/apache/cordova/PluginResult$Status:OK	Lorg/apache/cordova/PluginResult$Status;
    //   13002: aload_0
    //   13003: getfield 189	com/belkin/cordova/plugin/DevicePlugin:mSharePreference	Lcom/belkin/wemo/cache/utils/SharePreferences;
    //   13006: aload_2
    //   13007: iconst_0
    //   13008: invokevirtual 796	org/json/JSONArray:get	(I)Ljava/lang/Object;
    //   13011: invokevirtual 443	java/lang/Object:toString	()Ljava/lang/String;
    //   13014: invokevirtual 1865	com/belkin/wemo/cache/utils/SharePreferences:getFaderPref	(Ljava/lang/String;)Ljava/lang/String;
    //   13017: invokespecial 320	org/apache/cordova/PluginResult:<init>	(Lorg/apache/cordova/PluginResult$Status;Ljava/lang/String;)V
    //   13020: putfield 123	com/belkin/cordova/plugin/DevicePlugin:mPluginResult	Lorg/apache/cordova/PluginResult;
    //   13023: aload_0
    //   13024: getfield 123	com/belkin/cordova/plugin/DevicePlugin:mPluginResult	Lorg/apache/cordova/PluginResult;
    //   13027: iconst_0
    //   13028: invokevirtual 438	org/apache/cordova/PluginResult:setKeepCallback	(Z)V
    //   13031: aload_3
    //   13032: aload_0
    //   13033: getfield 123	com/belkin/cordova/plugin/DevicePlugin:mPluginResult	Lorg/apache/cordova/PluginResult;
    //   13036: invokevirtual 266	org/apache/cordova/CallbackContext:sendPluginResult	(Lorg/apache/cordova/PluginResult;)V
    //   13039: aload_3
    //   13040: invokevirtual 518	org/apache/cordova/CallbackContext:success	()V
    //   13043: goto -11981 -> 1062
    //   13046: iinc -24 1
    //   13049: goto -8536 -> 4513
    // Exception table:
    //   from	to	target	type
    //   1472	1491	1821	java/lang/InterruptedException
    //   1491	1522	1821	java/lang/InterruptedException
    //   1875	1884	1887	java/lang/Exception
    //   2351	2371	2469	com/belkin/exception/DatabaseException
    //   2540	2553	2598	java/lang/Exception
    //   2894	3032	3035	java/lang/Exception
    //   4470	4502	4826	org/json/JSONException
    //   4513	4520	4826	org/json/JSONException
    //   4527	4565	4826	org/json/JSONException
    //   4568	4577	4826	org/json/JSONException
    //   4582	4819	4826	org/json/JSONException
    //   8659	8687	8690	org/json/JSONException
    //   8700	8721	8724	org/json/JSONException
    //   9196	9209	9212	java/lang/InterruptedException
    //   9450	9456	9459	java/lang/InterruptedException
    //   9381	9434	9469	java/lang/InterruptedException
    //   9381	9434	9479	java/util/concurrent/ExecutionException
    //   12203	12219	12226	java/lang/Exception
    //   12530	12536	12539	java/lang/InterruptedException
    //   12461	12514	12549	java/lang/InterruptedException
    //   12461	12514	12559	java/util/concurrent/ExecutionException
  }
  
  public int hashCode()
  {
    return 1011;
  }
  
  public void initialize(CordovaInterface paramCordovaInterface, CordovaWebView paramCordovaWebView)
  {
    super.initialize(paramCordovaInterface, paramCordovaWebView);
    mContext = paramCordovaInterface.getActivity();
    this.mNetworkUtil = new SDKNetworkUtils(mContext);
    this.mSharePreference = new SharePreferences(mContext);
    boolean bool1 = RuleUtility.doesRulesDBFileExist();
    LogUtils.infoLog("DevicePlugin", "DB file exists:" + bool1);
    if (!bool1)
    {
      String str1 = mContext.getApplicationInfo().dataDir + "/" + "databases" + "/" + "pluginrules2.db";
      String str2 = RuleUtility.getStoragePath() + "/" + "unzipped" + "/" + "pluginrules2.db";
      File localFile = new File(RuleUtility.getStoragePath() + "/" + "unzipped");
      boolean bool2 = new File(str1).exists();
      LogUtils.infoLog("DevicePlugin", "RULE DB SOURCE FILE at " + str1 + " ,and targetPathStr:" + str2 + ": srcFileExist = " + bool2);
      if (bool2)
      {
        if (!localFile.exists()) {
          localFile.mkdir();
        }
        RuleUtility.copyDBFile(str1, str2);
      }
    }
    if (this.mNetworkUtil.isHomeNetwork())
    {
      mWeMoSDKContext = WeMoSDKContext.getInstance(mContext);
      mDLM = DeviceListManager.getInstance(mContext);
      mWeMoSDKContext.addNotificationListener(this);
    }
    this.mUpnpDeviceList = UpnpDeviceList.getInstance(mContext);
    this.mWiFiSecurityUtil = new WiFiSecurityUtil();
    this.netCamUtil = new NetCamUtil();
    this.appLaunchUtil = new ExternalAppLaunchUtil();
    mWebView = paramCordovaWebView;
    this.mAppController = AppController.getInstance(mContext);
  }
  
  public void onNotify(String paramString1, String paramString2, String paramString3)
  {
    if (mWeMoSDKContext == null) {
      return;
    }
    LogUtils.infoLog("DevicePlugin", "onnotify in deviceplugin LedDeviceId:" + paramString2 + " udn: " + paramString3 + " message: " + paramString1 + " hash: " + hashCode());
  }
  
  protected void saveRemoteRegistrationData(JSONArray paramJSONArray)
  {
    boolean bool = true;
    try
    {
      String str1 = this.mSharePreference.getSetupCredential();
      Object localObject;
      if (str1 != null)
      {
        localObject = str1.split("\\|")[0];
        if (!((String)localObject).equalsIgnoreCase(this.mNetworkUtil.getSSID())) {
          bool = false;
        }
      }
      for (;;)
      {
        this.mSharePreference.setRemoteAutoEnableNeeded(false);
        String str2 = paramJSONArray.getString(3);
        if (!str2.equalsIgnoreCase("NOKEY")) {
          this.mSharePreference.storePrivateKey(str2);
        }
        this.mSharePreference.storeHomeId(paramJSONArray.getString(2));
        HashSet localHashSet1 = new HashSet();
        localHashSet1.add(localObject);
        this.mSharePreference.setHomeSSIDs(localHashSet1);
        this.mSharePreference.setRemoteAccessSSID((String)localObject);
        if (bool)
        {
          String str3 = this.mNetworkUtil.getArpMac();
          if ((str3 != null) && (str3.length() > 0))
          {
            HashSet localHashSet2 = new HashSet();
            localHashSet2.add(str3);
            this.mSharePreference.setARPMacs(localHashSet2);
          }
        }
        this.mSharePreference.setRemoteEnabled(true);
        LogUtils.infoLog("DevicePlugin", "saveRemoteRegistrationData: HomeId: " + this.mSharePreference.getHomeId() + " PrivateKey: " + this.mSharePreference.getPrivateKey() + " HomeSSID: " + this.mSharePreference.getHomeSSIDs() + " RemoteEnabled: " + this.mSharePreference.isRemoteEnabled() + " setupFallbackRouterSame: " + bool);
        return;
        String str4 = this.mNetworkUtil.getSSID();
        localObject = str4;
      }
      return;
    }
    catch (Exception localException)
    {
      LogUtils.infoLog("DevicePlugin", "saveRemoteRegistrationData Exception: " + localException);
    }
  }
  
  private class FetchDevicesRulesCallback
    implements FetchRulesAndSyncErrorCallback, FetchRulesAndSyncSuccessCallback
  {
    private CallbackContext context;
    
    public FetchDevicesRulesCallback(CallbackContext paramCallbackContext)
    {
      this.context = paramCallbackContext;
    }
    
    public void onError()
    {
      LogUtils.errorLog("DevicePlugin", "FetchDevicerulesCallback: error during fetchRules().");
      if (this.context != null) {
        this.context.sendPluginResult(new PluginResult(PluginResult.Status.ERROR, "Error while processing Rules!"));
      }
    }
    
    public void onSuccess(String paramString, int paramInt)
    {
      LogUtils.errorLog("DevicePlugin", "FetchDevicerulesCallback: fetchRules() succeeded.");
      if (this.context != null) {
        this.context.sendPluginResult(new PluginResult(PluginResult.Status.OK, paramString));
      }
    }
  }
  
  private class StoreDeviceRulesCallback
    implements StoreRulesErrorCallback, StoreRulesSuccessCallback
  {
    private CallbackContext context;
    
    public StoreDeviceRulesCallback(CallbackContext paramCallbackContext)
    {
      this.context = paramCallbackContext;
    }
    
    public void onError(RMRulesError paramRMRulesError)
    {
      if (DevicePlugin.this.weeklyRecordsHashMap != null) {
        DevicePlugin.this.weeklyRecordsHashMap.clear();
      }
      if (this.context != null) {
        if (paramRMRulesError == null) {
          break label79;
        }
      }
      label79:
      for (String str = paramRMRulesError.getErrorMessage();; str = "Error while processing Rules!")
      {
        LogUtils.errorLog("DevicePlugin", "Store Rules: Error - " + str);
        this.context.sendPluginResult(new PluginResult(PluginResult.Status.ERROR, str));
        return;
      }
    }
    
    public void onSuccess()
    {
      if (DevicePlugin.this.weeklyRecordsHashMap != null) {
        DevicePlugin.this.weeklyRecordsHashMap.clear();
      }
      if (this.context != null) {
        this.context.sendPluginResult(new PluginResult(PluginResult.Status.OK, "true"));
      }
    }
  }
  
  private class TimerTask
    implements Runnable
  {
    private int mIndex = 0;
    
    public TimerTask(int paramInt)
    {
      this.mIndex = paramInt;
    }
    
    public void run()
    {
      try
      {
        Thread.sleep(2000L);
        if (DevicePlugin.this.mTimerIndex == this.mIndex)
        {
          Intent localIntent1 = new Intent();
          localIntent1.setAction("com.controller.belkin.hybrid.SET_INACTIVE_STATE");
          DevicePlugin.mContext.sendBroadcast(localIntent1);
        }
        Thread.sleep(13000L);
        if (DevicePlugin.this.mTimerIndex == this.mIndex)
        {
          Intent localIntent2 = new Intent();
          localIntent2.setAction("com.controller.belkin.hybrid.SET_UNAVAILABLE_STATE");
          DevicePlugin.mContext.sendBroadcast(localIntent2);
        }
        return;
      }
      catch (InterruptedException localInterruptedException)
      {
        LogUtils.infoLog("DevicePlugin", "Timer work is interrupt " + localInterruptedException.getMessage());
      }
    }
  }
  
  public class enableRemoteAccess
    extends AsyncTask<Void, Void, JSONObject>
  {
    public enableRemoteAccess() {}
    
    protected JSONObject doInBackground(Void... paramVarArgs)
    {
      LogUtils.infoLog("DevicePlugin", "doInBackground: enableRemoteAccess");
      Object localObject1 = null;
      Iterator localIterator = DevicePlugin.mDLM.getDeviceInformation().iterator();
      while (localIterator.hasNext())
      {
        DeviceInformation localDeviceInformation = (DeviceInformation)localIterator.next();
        if (localDeviceInformation.getInActive() == 0) {
          localObject1 = localDeviceInformation;
        }
      }
      try
      {
        Thread.sleep(2000L);
        int i = DevicePlugin.this.mUpnpDeviceList.getWeMoDeviceList().length();
        Object localObject2 = null;
        if (i > 0)
        {
          JSONObject localJSONObject = DevicePlugin.this.mUpnpDeviceList.enableRemoteAccess((DeviceInformation)localObject1);
          localObject2 = localJSONObject;
        }
        return (JSONObject)localObject2;
      }
      catch (DatabaseException localDatabaseException)
      {
        localDatabaseException.printStackTrace();
        return null;
      }
      catch (JSONException localJSONException)
      {
        localJSONException.printStackTrace();
        return null;
      }
      catch (InterruptedException localInterruptedException)
      {
        localInterruptedException.printStackTrace();
      }
      return null;
    }
    
    protected void onPostExecute(JSONObject paramJSONObject)
    {
      try
      {
        LogUtils.infoLog("DevicePlugin", "Remote Access enabled in background");
        LogUtils.infoLog("DevicePlugin", "private key...: " + paramJSONObject.getString("privateKeyPhone"));
        LogUtils.infoLog("DevicePlugin", "Home ID...: " + paramJSONObject.getString("homeId"));
        LogUtils.infoLog("DevicePlugin", "State...: " + paramJSONObject.getString("statusCode"));
        LogUtils.infoLog("DevicePlugin", "UUID...: " + DevicePlugin.this.mWiFiSecurityUtil.getDeviceID(DevicePlugin.mContext));
        DevicePlugin.this.mSharePreference.setRemoteAutoEnableNeeded(false);
        boolean bool1 = paramJSONObject.getString("statusCode").equalsIgnoreCase("S");
        bool2 = false;
        if (bool1)
        {
          bool2 = true;
          String str1 = paramJSONObject.getString("privateKeyPhone");
          if (!str1.equalsIgnoreCase("NOKEY")) {
            DevicePlugin.this.mSharePreference.storePrivateKey(str1);
          }
          DevicePlugin.this.mSharePreference.storeHomeId(paramJSONObject.getString("homeId"));
          HashSet localHashSet1 = new HashSet();
          String str2 = DevicePlugin.this.mNetworkUtil.getSSID();
          localHashSet1.add(str2);
          DevicePlugin.this.mSharePreference.setHomeSSIDs(localHashSet1);
          DevicePlugin.this.mSharePreference.setRemoteAccessSSID(str2);
          localHashSet2 = new HashSet();
        }
      }
      catch (Exception localException1)
      {
        boolean bool2;
        HashSet localHashSet2;
        String str5;
        label285:
        LogUtils.infoLog("DevicePlugin", "Exception: " + localException1);
        return;
      }
      try
      {
        str5 = paramJSONObject.getString("arpMac");
        str3 = str5;
      }
      catch (Exception localException2)
      {
        str3 = null;
        break label285;
      }
      if ((str3 != null) && (str3.length() > 0))
      {
        localHashSet2.add(str3);
        Log.d("DevicePlugin", "enableRemoteAccess onPostExecute Got ArpMac from FW: " + str3);
      }
      for (;;)
      {
        DevicePlugin.this.mSharePreference.setARPMacs(localHashSet2);
        DevicePlugin.this.mSharePreference.setRemoteEnabled(bool2);
        if (!bool2) {
          DevicePlugin.this.mSharePreference.setDBVersion("0");
        }
        LogUtils.infoLog("DevicePlugin", "onPostExecute SSID: " + DevicePlugin.this.mNetworkUtil.getSSID() + " arpMacs: " + localHashSet2);
        LogUtils.infoLog("DevicePlugin", "Sucess: " + bool2);
        return;
        String str4 = DevicePlugin.this.mNetworkUtil.getArpMac();
        if ((str4 != null) && (str4.length() > 0)) {
          localHashSet2.add(str4);
        }
      }
    }
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/belkin/cordova/plugin/DevicePlugin.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */