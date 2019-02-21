package com.belkin.cordova.plugin;

import android.content.Context;
import com.belkin.controller.AppController;
import com.belkin.controller.DeviceListController;
import com.belkin.cordova.plugin.callback.FirmwareUpdateCallback;
import com.belkin.cordova.plugin.runnable.FirmwareUpdateRunnable;
import com.belkin.firmware.FirmwareUpdateManager;
import com.belkin.utils.LogUtils;
import com.belkin.wemo.cache.devicelist.DeviceListManager.NotificationListenerDLM;
import com.belkin.wemo.cache.utils.NetworkMode;
import com.belkin.wemo.cache.utils.SDKLogUtils;
import com.belkin.wemo.cache.utils.SharePreferences;
import com.belkin.wemo.thread.WeMoThreadPoolHandler;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Locale;
import java.util.Timer;
import org.apache.cordova.CallbackContext;
import org.apache.cordova.CordovaInterface;
import org.apache.cordova.CordovaPlugin;
import org.apache.cordova.CordovaWebView;
import org.apache.cordova.PluginResult;
import org.apache.cordova.PluginResult.Status;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

public class FirmwareUpdatePlugin
  extends CordovaPlugin
  implements DeviceListManager.NotificationListenerDLM
{
  public static final String ACTION_FW_PROGRESS_STATUS = "isFWUpdateInProgress";
  public static final String ACTION_GET_AVAILABLE_UPDATES = "getAvailableUpdates";
  public static final String ACTION_GET_UPDATE_STATUS = "sendUpdateStatus";
  public static final String ACTION_INITIATE_FIRMWARE_UPDATE = "doFirmwareUpdate";
  public static final String TAG = "FirmwareUpdatePlugin";
  private Timer firmwareUpdateTimer;
  private AppController mAppController;
  private Context mContext = null;
  private DeviceListController mDeviceListController;
  private SharePreferences mSharePreference;
  
  private void sendJavascriptCB(String paramString)
  {
    LogUtils.infoLog("smartDevicePlugin:Native:sendJavascriptCB cb", paramString);
    if ((this.webView != null) && (this.mAppController != null)) {
      this.mAppController.sendJSCallBack(this.webView, paramString);
    }
  }
  
  public boolean execute(String paramString, JSONArray paramJSONArray, CallbackContext paramCallbackContext)
    throws JSONException
  {
    LogUtils.infoLog("FirmwareUpdatePlugin", "action: " + paramString);
    FirmwareUpdateCallback localFirmwareUpdateCallback;
    if ("doFirmwareUpdate".equals(paramString))
    {
      LogUtils.infoLog("FirmwareUpdatePlugin", " action: " + paramString + "inputParams:" + paramJSONArray);
      LogUtils.infoLog("FirmwareUpdatePlugin", "ACTION_INITIATE_FIRMWARE_UPDATE" + paramJSONArray);
      this.mSharePreference = new SharePreferences(this.mContext);
      long l = new Date().getTime();
      SDKLogUtils.infoLog("FirmwareUpdatePlugin", " Firmware upgrade started on: " + l);
      this.mSharePreference.setCurrentTimeStamp(l);
      localFirmwareUpdateCallback = new FirmwareUpdateCallback(paramCallbackContext);
      if (paramJSONArray != null) {
        WeMoThreadPoolHandler.executeInBackground(new FirmwareUpdateRunnable(paramJSONArray, localFirmwareUpdateCallback));
      }
    }
    for (;;)
    {
      return true;
      localFirmwareUpdateCallback.onError("null inParamArray");
      continue;
      if ("getAvailableUpdates".equals(paramString))
      {
        SimpleDateFormat localSimpleDateFormat = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss", Locale.ENGLISH);
        Date localDate = new Date();
        LogUtils.infoLog("FirmwareUpdatePlugin", "ACTION_GET_AVAILABLE_UPDATES" + paramJSONArray);
        LogUtils.infoLog("FirmwareUpdatePlugin", "ACTION_GET_AVAILABLE_UPDATES" + localSimpleDateFormat.format(localDate));
        FirmwareUpdateManager.getAvailableUpdates(paramJSONArray);
        PluginResult localPluginResult = new PluginResult(PluginResult.Status.OK);
        localPluginResult.setKeepCallback(false);
        paramCallbackContext.sendPluginResult(localPluginResult);
      }
      else if ("sendUpdateStatus".equals(paramString))
      {
        LogUtils.infoLog("FirmwareUpdatePlugin", "ACTION_GET_UPDATE_STATUS:" + paramJSONArray);
        if ((!NetworkMode.isLocal()) && (paramJSONArray.length() > 0)) {
          FirmwareUpdateManager.updateUpgradeStatus(paramJSONArray.getJSONObject(0).getString("udn"), paramJSONArray.getJSONObject(0).getString("status") + "", "");
        }
      }
      else if ("isFWUpdateInProgress".equals(paramString))
      {
        if (this.mDeviceListController.isFWUpgradeInProgress()) {
          paramCallbackContext.success("true");
        } else {
          paramCallbackContext.success("false");
        }
      }
    }
  }
  
  public void initialize(CordovaInterface paramCordovaInterface, CordovaWebView paramCordovaWebView)
  {
    LogUtils.infoLog("FirmwareUpdatePlugin", "FirmwareUpdatePlugin initialize");
    super.initialize(paramCordovaInterface, paramCordovaWebView);
    this.mContext = paramCordovaInterface.getActivity();
    this.mAppController = AppController.getInstance(this.mContext);
    this.mDeviceListController = DeviceListController.getInstance(this.mContext);
  }
  
  public void onNotify(String paramString1, String paramString2, String paramString3)
  {
    if (paramString1.equalsIgnoreCase("FirmwareUpdateStatus"))
    {
      LogUtils.infoLog("FirmwareUpdatePlugin", "FirmwareUpdateStatus status:" + paramString2 + " udn:" + paramString3);
      sendJavascriptCB("window.firmwareUpdatePlugin.onStatusChange('" + paramString3 + "','" + paramString2 + "');");
    }
    while (!paramString1.equalsIgnoreCase("SubDeviceFWUpdate")) {
      return;
    }
    LogUtils.infoLog("FirmwareUpdatePlugin", "SubDeviceFWUpdate status:" + paramString2 + " udn:" + paramString3);
    sendJavascriptCB("window.firmwareUpdatePlugin.onStatusChange('" + paramString3 + "','" + paramString2 + "');");
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/belkin/cordova/plugin/FirmwareUpdatePlugin.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */