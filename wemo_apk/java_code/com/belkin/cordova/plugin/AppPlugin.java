package com.belkin.cordova.plugin;

import android.content.Context;
import com.belkin.controller.AppController;
import com.belkin.devices.callback.GetDataStoreOnLinkCallBack;
import com.belkin.devices.callback.SetDataStoreOnLinkCallBack;
import com.belkin.devices.callback.SetDeviceNameOnLinkCallBack;
import com.belkin.devices.runnable.GetDataStoreRunnable;
import com.belkin.devices.runnable.GetMobileNetworkRunnable;
import com.belkin.devices.runnable.SetDataStoreRunnable;
import com.belkin.devices.runnable.SetDeviceNameOnLinkRunnable;
import com.belkin.utils.LogUtils;
import com.belkin.wemo.cache.devicelist.DeviceListManager;
import com.belkin.wemo.thread.WeMoThreadPoolHandler;
import org.apache.cordova.CallbackContext;
import org.apache.cordova.CordovaInterface;
import org.apache.cordova.CordovaPlugin;
import org.apache.cordova.CordovaWebView;
import org.apache.cordova.PluginResult;
import org.apache.cordova.PluginResult.Status;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

public class AppPlugin
  extends CordovaPlugin
{
  public static final String ACTION_GET_CONTACT_LIST = "getContactList";
  public static final String ACTION_GET_EMERGENCY_CONTACT = "getEmergencyContact";
  public static final String ACTION_SET_EMERGENCY_CONTACT = "setEmergencyContact";
  public static final String TAG = "AppPlugin";
  private AppController mAppController = null;
  private Context mContext = null;
  
  public boolean execute(String paramString, JSONArray paramJSONArray, final CallbackContext paramCallbackContext)
    throws JSONException
  {
    LogUtils.infoLog("AppPlugin", "action: " + paramString);
    if ("getContactList".equals(paramString)) {
      new Thread(new Runnable()
      {
        public void run()
        {
          JSONArray localJSONArray = AppPlugin.this.mAppController.getContactsList();
          if ((localJSONArray != null) && (localJSONArray.length() > 0))
          {
            LogUtils.infoLog("AppPlugin", "ACTION_GET_CONTACT_LIST : contacts list " + localJSONArray.toString());
            PluginResult localPluginResult = new PluginResult(PluginResult.Status.OK, localJSONArray);
            localPluginResult.setKeepCallback(false);
            paramCallbackContext.sendPluginResult(localPluginResult);
            return;
          }
          paramCallbackContext.error("error fetching contacts list");
        }
      }).start();
    }
    do
    {
      do
      {
        return true;
        if ("setEmergencyContact".equals(paramString))
        {
          JSONObject localJSONObject = paramJSONArray.getJSONObject(0);
          String str2 = "";
          LogUtils.infoLog("AppPlugin", "Emergency contact: " + localJSONObject);
          String str3 = localJSONObject.toString();
          if (paramJSONArray.length() > 1) {
            str2 = paramJSONArray.getString(1);
          }
          WeMoThreadPoolHandler.executeInBackground(new SetDataStoreRunnable(str2, new SetDataStoreOnLinkCallBack(paramCallbackContext), this.mContext, str3));
          return true;
        }
        if ("getEmergencyContact".equals(paramString))
        {
          String str1 = "";
          if (paramJSONArray.length() >= 1) {
            str1 = paramJSONArray.getString(0);
          }
          WeMoThreadPoolHandler.executeInBackground(new GetDataStoreRunnable(str1, new GetDataStoreOnLinkCallBack(paramCallbackContext), this.mContext));
          return true;
        }
        if ("setMulitpleDeviceName".equals(paramString))
        {
          SetDeviceNameOnLinkCallBack localSetDeviceNameOnLinkCallBack = new SetDeviceNameOnLinkCallBack(paramCallbackContext);
          if (paramJSONArray != null)
          {
            WeMoThreadPoolHandler.executeInBackground(new SetDeviceNameOnLinkRunnable(paramJSONArray, localSetDeviceNameOnLinkCallBack, this.mContext));
            return true;
          }
          localSetDeviceNameOnLinkCallBack.onError();
          return true;
        }
        if (!"getMobileNetworkType".equals(paramString)) {
          break;
        }
        LogUtils.infoLog("AppPlugin", " ACTION_GET_MOBILE_NETWORK_TYPE");
      } while (paramCallbackContext == null);
      WeMoThreadPoolHandler.executeInBackground(new GetMobileNetworkRunnable(paramCallbackContext, this.mContext));
      return true;
    } while ((!"getFWVersion".equals(paramString)) || (paramCallbackContext == null));
    PluginResult localPluginResult = new PluginResult(PluginResult.Status.OK, DeviceListManager.getInstance(this.mContext).getFWVersionsFromDb());
    localPluginResult.setKeepCallback(false);
    paramCallbackContext.sendPluginResult(localPluginResult);
    return true;
  }
  
  public void initialize(CordovaInterface paramCordovaInterface, CordovaWebView paramCordovaWebView)
  {
    LogUtils.infoLog("AppPlugin", "AppPlugin initialize");
    super.initialize(paramCordovaInterface, paramCordovaWebView);
    this.mContext = paramCordovaInterface.getActivity();
    this.mAppController = AppController.getInstance(this.mContext);
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/belkin/cordova/plugin/AppPlugin.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */