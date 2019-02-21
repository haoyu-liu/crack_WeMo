package org.apache.cordova.networkinformation;

import android.annotation.TargetApi;
import android.app.Activity;
import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.content.IntentFilter;
import android.net.ConnectivityManager;
import android.net.NetworkInfo;
import android.os.Build.VERSION;
import android.provider.Settings.Global;
import android.provider.Settings.System;
import android.util.Log;
import com.belkin.controller.AppController;
import com.belkin.utils.LogUtils;
import com.belkin.wemo.cache.utils.NetworkMode;
import com.belkin.wemo.cache.utils.SDKNetworkUtils;
import org.apache.cordova.CallbackContext;
import org.apache.cordova.CordovaInterface;
import org.apache.cordova.CordovaPlugin;
import org.apache.cordova.CordovaWebView;
import org.apache.cordova.PluginResult;
import org.apache.cordova.PluginResult.Status;
import org.json.JSONArray;

public class NetworkManager
  extends CordovaPlugin
{
  public static final String CDMA = "cdma";
  public static final String EDGE = "edge";
  public static final String EHRPD = "ehrpd";
  public static final String GPRS = "gprs";
  public static final String GSM = "gsm";
  public static final String HSDPA = "hsdpa";
  public static final String HSPA = "hspa";
  public static final String HSPA_PLUS = "hspa+";
  public static final String HSUPA = "hsupa";
  private static final String LOG_TAG = "NetworkManager";
  public static final String LTE = "lte";
  public static final String MOBILE = "mobile";
  public static int NOT_REACHABLE = 0;
  public static final String ONEXRTT = "1xrtt";
  public static int REACHABLE_VIA_CARRIER_DATA_NETWORK = 1;
  public static int REACHABLE_VIA_WIFI_NETWORK = 2;
  public static final String TYPE_2G = "2g";
  public static final String TYPE_3G = "3g";
  public static final String TYPE_4G = "4g";
  public static final String TYPE_AIRPLANE_MODE = "airplaneMode";
  public static final String TYPE_ETHERNET = "ethernet";
  public static final String TYPE_NONE = "none";
  public static final String TYPE_NOT_CONNECTED_TO_WIFI_OR_CELLULAR_DATA = "notConnected";
  public static final String TYPE_UNKNOWN = "unknown";
  public static final String TYPE_WIFI = "wifi";
  public static final String UMB = "umb";
  public static final String UMTS = "umts";
  public static final String WIFI = "wifi";
  public static final String WIMAX = "wimax";
  private CallbackContext connectionCallbackContext;
  private String lastStatus = "";
  private AppController mAppController;
  private SDKNetworkUtils mNetworkUtil;
  BroadcastReceiver receiver = null;
  private boolean registered = false;
  ConnectivityManager sockMan;
  
  private String getConnectionInfo(NetworkInfo paramNetworkInfo)
  {
    String str = "none";
    if (paramNetworkInfo != null) {
      if (paramNetworkInfo.isConnected()) {
        break label44;
      }
    }
    label44:
    for (str = "none";; str = getType(paramNetworkInfo))
    {
      Log.d("CordovaNetworkManager", "Connection Type: " + str);
      return str;
    }
  }
  
  private String getType(NetworkInfo paramNetworkInfo)
  {
    if (paramNetworkInfo != null)
    {
      String str1 = paramNetworkInfo.getTypeName();
      if (str1.toLowerCase().equals("wifi")) {
        return "wifi";
      }
      if (str1.toLowerCase().equals("mobile"))
      {
        String str2 = paramNetworkInfo.getSubtypeName();
        if ((str2.toLowerCase().equals("gsm")) || (str2.toLowerCase().equals("gprs")) || (str2.toLowerCase().equals("edge"))) {
          return "2g";
        }
        if ((str2.toLowerCase().startsWith("cdma")) || (str2.toLowerCase().equals("umts")) || (str2.toLowerCase().equals("1xrtt")) || (str2.toLowerCase().equals("ehrpd")) || (str2.toLowerCase().equals("hsupa")) || (str2.toLowerCase().equals("hsdpa")) || (str2.toLowerCase().equals("hspa"))) {
          return "3g";
        }
        if ((str2.toLowerCase().equals("lte")) || (str2.toLowerCase().equals("umb")) || (str2.toLowerCase().equals("hspa+"))) {
          return "4g";
        }
      }
    }
    else
    {
      return "none";
    }
    return "unknown";
  }
  
  @TargetApi(17)
  private static boolean isAirplaneModeOn(Context paramContext)
  {
    if (Build.VERSION.SDK_INT < 17) {
      if (Settings.System.getInt(paramContext.getContentResolver(), "airplane_mode_on", 0) == 0) {}
    }
    while (Settings.Global.getInt(paramContext.getContentResolver(), "airplane_mode_on", 0) != 0)
    {
      return true;
      return false;
    }
    return false;
  }
  
  private void sendUpdate(String paramString)
  {
    if (this.connectionCallbackContext != null)
    {
      PluginResult localPluginResult = new PluginResult(PluginResult.Status.OK, paramString);
      localPluginResult.setKeepCallback(true);
      this.connectionCallbackContext.sendPluginResult(localPluginResult);
    }
    if (this.webView != null) {
      this.webView.postMessage("networkconnection", paramString);
    }
  }
  
  private void updateConnectionInfo(NetworkInfo paramNetworkInfo)
  {
    String str = getConnectionInfo(paramNetworkInfo);
    if (!str.equals(this.lastStatus))
    {
      processNetworkUpdate(paramNetworkInfo, str);
      sendUpdate(str);
      this.lastStatus = str;
    }
  }
  
  public boolean execute(String paramString, JSONArray paramJSONArray, CallbackContext paramCallbackContext)
  {
    if (paramString.equals("getConnectionInfo"))
    {
      this.connectionCallbackContext = paramCallbackContext;
      NetworkInfo localNetworkInfo2 = this.sockMan.getActiveNetworkInfo();
      PluginResult localPluginResult2 = new PluginResult(PluginResult.Status.OK, getConnectionInfo(localNetworkInfo2));
      localPluginResult2.setKeepCallback(true);
      paramCallbackContext.sendPluginResult(localPluginResult2);
      return true;
    }
    if (paramString.equals("getConnectionStatus"))
    {
      this.connectionCallbackContext = paramCallbackContext;
      NetworkInfo localNetworkInfo1 = this.sockMan.getActiveNetworkInfo();
      processNetworkState(localNetworkInfo1, getConnectionInfo(localNetworkInfo1));
      PluginResult localPluginResult1 = new PluginResult(PluginResult.Status.OK);
      localPluginResult1.setKeepCallback(true);
      paramCallbackContext.sendPluginResult(localPluginResult1);
      return true;
    }
    return false;
  }
  
  public void initialize(CordovaInterface paramCordovaInterface, CordovaWebView paramCordovaWebView)
  {
    super.initialize(paramCordovaInterface, paramCordovaWebView);
    this.sockMan = ((ConnectivityManager)paramCordovaInterface.getActivity().getSystemService("connectivity"));
    this.connectionCallbackContext = null;
    try
    {
      IntentFilter localIntentFilter = new IntentFilter();
      localIntentFilter.addAction("android.net.conn.CONNECTIVITY_CHANGE");
      if (this.receiver == null)
      {
        this.receiver = new BroadcastReceiver()
        {
          public void onReceive(Context paramAnonymousContext, Intent paramAnonymousIntent)
          {
            if (NetworkManager.this.webView != null) {
              NetworkManager.this.updateConnectionInfo(NetworkManager.this.sockMan.getActiveNetworkInfo());
            }
          }
        };
        paramCordovaInterface.getActivity().registerReceiver(this.receiver, localIntentFilter);
        this.registered = true;
      }
      this.mNetworkUtil = new SDKNetworkUtils(paramCordovaInterface.getActivity().getApplicationContext());
      this.mAppController = AppController.getInstance(paramCordovaInterface.getActivity().getApplicationContext());
      return;
    }
    catch (Exception localException)
    {
      LogUtils.errorLog("NetworkManager", "ConnectivityChangeError: " + localException);
    }
  }
  
  public void onDestroy()
  {
    if ((this.receiver != null) && (this.registered)) {}
    try
    {
      this.cordova.getActivity().unregisterReceiver(this.receiver);
      this.registered = false;
      return;
    }
    catch (Exception localException)
    {
      Log.e("NetworkManager", "Error unregistering network receiver: " + localException.getMessage(), localException);
    }
  }
  
  public void processNetworkState(NetworkInfo paramNetworkInfo, String paramString)
  {
    LogUtils.infoLog("NetworkManager", " processNetworkState :: info ::" + paramNetworkInfo + " networkType :: " + paramString);
    boolean bool;
    if ((paramNetworkInfo != null) && (paramNetworkInfo.isConnected()))
    {
      bool = true;
      LogUtils.infoLog("NetworkManager", "isConnected ::" + bool);
      if (!bool)
      {
        if (!paramString.equals("none")) {
          break label228;
        }
        if (!isAirplaneModeOn(this.cordova.getActivity().getApplicationContext())) {
          break label222;
        }
        paramString = "airplaneMode";
      }
    }
    for (;;)
    {
      LogUtils.infoLog("NetworkManager", "networkType ::" + paramString);
      String str = "networkConnection.showNetworkStatus(" + bool + ", '" + paramString + "');";
      if (this.mAppController == null) {
        this.mAppController = AppController.getInstance(this.cordova.getActivity().getApplicationContext());
      }
      if (this.webView != null) {
        this.mAppController.sendJSCallBack(this.webView, str);
      }
      return;
      bool = false;
      break;
      label222:
      paramString = "none";
      continue;
      label228:
      paramString = "notConnected";
    }
  }
  
  public void processNetworkUpdate(NetworkInfo paramNetworkInfo, String paramString)
  {
    boolean bool;
    if ((paramNetworkInfo != null) && (paramNetworkInfo.isConnected()))
    {
      bool = true;
      if (!bool) {
        break label177;
      }
      if (NetworkMode.isLocal())
      {
        if (this.mNetworkUtil == null) {
          this.mNetworkUtil = new SDKNetworkUtils(this.cordova.getActivity().getApplicationContext());
        }
        String str2 = this.mNetworkUtil.getDefaultGatewayIP();
        if ((str2 == null) || (str2.isEmpty())) {
          break label172;
        }
        LogUtils.infoLog("NetworkManager", str2);
      }
    }
    for (;;)
    {
      String str1 = "networkPlugin.onNetworkChanged(" + bool + ", '" + paramString + "');";
      if (this.mAppController == null) {
        this.mAppController = AppController.getInstance(this.cordova.getActivity().getApplicationContext());
      }
      if (this.webView != null) {
        this.mAppController.sendJSCallBack(this.webView, str1);
      }
      return;
      bool = false;
      break;
      label172:
      bool = false;
      continue;
      label177:
      if (paramString.equals("none"))
      {
        if (isAirplaneModeOn(this.cordova.getActivity().getApplicationContext())) {}
        for (paramString = "airplaneMode";; paramString = "none") {
          break;
        }
      }
      paramString = "notConnected";
    }
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/org/apache/cordova/networkinformation/NetworkManager.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */