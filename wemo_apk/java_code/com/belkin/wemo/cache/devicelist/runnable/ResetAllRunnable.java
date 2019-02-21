package com.belkin.wemo.cache.devicelist.runnable;

import android.text.TextUtils;
import com.belkin.wemo.cache.data.DeviceInformation;
import com.belkin.wemo.cache.devicelist.DeviceListManager;
import com.belkin.wemo.cache.devicelist.UpnpConstants;
import com.belkin.wemo.cache.devicelist.callback.PluginResultErrorCallback;
import com.belkin.wemo.cache.devicelist.callback.PluginResultSuccessCallback;
import com.belkin.wemo.cache.utils.LedDeviceResponseParser;
import com.belkin.wemo.cache.utils.MoreUtil;
import com.belkin.wemo.cache.utils.SDKLogUtils;
import com.belkin.wemo.cache.utils.SharePreferences;
import com.belkin.wemo.runnable.WeMoRunnable;
import org.cybergarage.upnp.Action;
import org.cybergarage.upnp.ControlPoint;
import org.cybergarage.upnp.Device;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

public class ResetAllRunnable
  extends WeMoRunnable
{
  private static final String TAG = "ResetAllRunnable";
  private JSONObject deviceInformation;
  private PluginResultErrorCallback errorCallback;
  private DeviceListManager mDeviceListManager;
  private MoreUtil mMoreUtil;
  private SharePreferences mSharePreference;
  private JSONObject stateData;
  private PluginResultSuccessCallback successCallback;
  private String udn;
  
  public ResetAllRunnable(DeviceListManager paramDeviceListManager, PluginResultErrorCallback paramPluginResultErrorCallback, PluginResultSuccessCallback paramPluginResultSuccessCallback, String paramString, JSONObject paramJSONObject1, JSONObject paramJSONObject2, SharePreferences paramSharePreferences)
  {
    this.mDeviceListManager = paramDeviceListManager;
    this.mMoreUtil = new MoreUtil();
    this.errorCallback = paramPluginResultErrorCallback;
    this.successCallback = paramPluginResultSuccessCallback;
    this.udn = paramString;
    this.deviceInformation = paramJSONObject1;
    this.stateData = paramJSONObject2;
    this.mSharePreference = paramSharePreferences;
  }
  
  private boolean resetDeviceAllLocalButZigbee(String paramString, ControlPoint paramControlPoint)
  {
    if (paramString == null) {
      SDKLogUtils.errorLog("ResetAllRunnable", "null udn on resetDeviceAllLocalButZigbee");
    }
    try
    {
      Device localDevice = paramControlPoint.getDevice(paramString);
      DeviceInformation localDeviceInformation = this.mDeviceListManager.getDeviceInformationByUDN(paramString);
      if (localDevice == null) {
        SDKLogUtils.errorLog("ResetAllRunnable", "null localdevice on resetDeviceAllLocalButZigbee");
      }
      Action localAction = localDevice.getAction("ReSetup");
      localAction.setArgumentValue("Reset", "2");
      String str1 = localAction.postControlAction();
      SDKLogUtils.infoLog("ResetAllRunnable", "resetAllContentAndSettings response: " + str1);
      boolean bool1 = false;
      if (str1 != null)
      {
        boolean bool2 = str1.contains(UpnpConstants.ERROR);
        bool1 = false;
        if (!bool2)
        {
          SDKLogUtils.infoLog("ResetAllRunnable", "if reset is successful then reset the firmware flags for the device type");
          if (str1.contains("reset_remote"))
          {
            SDKLogUtils.infoLog("ResetAllRunnable", "response contains reset_remote; Home Id: ");
            this.mSharePreference.storeHomeId("");
            this.mSharePreference.storePrivateKey("");
            this.mSharePreference.setRemoteEnabled(false);
            this.mSharePreference.setDBVersion("0");
            this.mSharePreference.setRemoteAccessSSID("");
          }
          String str2 = localDevice.getDeviceType();
          if ((str2 != null) && (str2.contains("insight")))
          {
            String str3 = localDeviceInformation.getHwVersion();
            if ((str3 != null) && (str3.equalsIgnoreCase("v2"))) {
              str2 = str2 + "v2";
            }
          }
          this.mMoreUtil.resetFWFlags(str2);
          bool1 = true;
        }
      }
      return bool1;
    }
    catch (Exception localException)
    {
      SDKLogUtils.errorLog("ResetAllRunnable", "exception in resetAllContentAndSettings: " + localException);
    }
    return false;
  }
  
  private boolean resetDeviceLocalZigbee(String paramString, ControlPoint paramControlPoint)
    throws JSONException
  {
    SDKLogUtils.infoLog("ResetAllRunnable", "Reset on local for Zigbee udn: " + paramString);
    new JSONArray();
    String str1 = this.mDeviceListManager.getBridgeUdn(paramString, paramControlPoint);
    SDKLogUtils.debugLog("ResetAllRunnable", "remove dev id:" + paramString);
    Action localAction = paramControlPoint.getDevice(str1).getAction("RemoveDevice");
    this.mDeviceListManager.setArgument(localAction, UpnpConstants.ARGS_DEVICEIDS, new String[] { paramString });
    String str2 = localAction.postControlAction();
    SDKLogUtils.debugLog("ResetAllRunnable", "response remove device n/w===+" + str2);
    this.mMoreUtil.resetFWFlags("MZ100");
    JSONObject localJSONObject = new LedDeviceResponseParser().parseNetworkStatus(str2);
    SDKLogUtils.infoLog("ResetAllRunnable", "JSONObject parsed response :" + localJSONObject);
    boolean bool1 = TextUtils.isEmpty(str2);
    boolean bool2 = false;
    if (!bool1)
    {
      boolean bool3 = localJSONObject.has("GetAddLedDeviceStatus");
      bool2 = false;
      if (bool3)
      {
        boolean bool4 = localJSONObject.getString("GetAddLedDeviceStatus").equals("true");
        bool2 = false;
        if (bool4)
        {
          this.mDeviceListManager.removeDeviceByUDN(paramString, false);
          SDKLogUtils.infoLog("ResetAllRunnable", "Removing device from database for udn: " + paramString);
          bool2 = true;
        }
      }
    }
    return bool2;
  }
  
  public void run()
  {
    Boolean.valueOf(false);
    try
    {
      localControlPoint = this.mDeviceListManager.getUpnpControl();
      if ((TextUtils.isEmpty(this.udn)) || (this.deviceInformation == null) || (this.stateData == null)) {
        SDKLogUtils.errorLog("ResetAllRunnable", "null in doInBackground udn:" + this.udn + ", deviceInformation:" + this.deviceInformation + ",stateData:" + this.stateData);
      }
      SDKLogUtils.infoLog("ResetAllRunnable", "Reset in local for udn: " + this.udn);
      DeviceInformation localDeviceInformation = this.mDeviceListManager.getDeviceFromDBByUDN(this.udn, false, true, false);
      SDKLogUtils.infoLog("ResetAllRunnable", "dev: " + localDeviceInformation);
      if (!this.mDeviceListManager.isZigbee(this.udn)) {
        break label294;
      }
      Boolean localBoolean2 = Boolean.valueOf(resetDeviceLocalZigbee(this.udn, localControlPoint));
      localObject = localBoolean2;
    }
    catch (Exception localException)
    {
      for (;;)
      {
        try
        {
          ControlPoint localControlPoint;
          JSONObject localJSONObject = this.mDeviceListManager.prepareDeviceResetResponse("reset_all", this.udn, "true");
          this.successCallback.onSuccess(localJSONObject.toString());
          this.mDeviceListManager.sendNotification("reset_all", ((Boolean)localObject).toString(), this.udn);
          SDKLogUtils.debugLog("ResetAllRunnable", "Result of reset operation: " + localObject);
          return;
          Boolean localBoolean1 = Boolean.valueOf(resetDeviceAllLocalButZigbee(this.udn, localControlPoint));
          Object localObject = localBoolean1;
          continue;
          localException = localException;
          SDKLogUtils.errorLog("ResetAllRunnable", "exception in resetDeviceAll: " + localException);
          localObject = Boolean.valueOf(false);
        }
        catch (JSONException localJSONException)
        {
          SDKLogUtils.errorLog("ResetAllRunnable", "exception in resetDeviceAll: ", localJSONException);
          if (this.errorCallback == null) {
            continue;
          }
          this.errorCallback.onError(localJSONException.getMessage());
          continue;
        }
        if (this.errorCallback != null) {
          this.errorCallback.onError("RESET_ALL failed");
        }
      }
    }
    if (((Boolean)localObject).booleanValue())
    {
      this.mDeviceListManager.removeDeviceByUDN(this.udn, false);
      if (this.successCallback == null) {}
    }
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/belkin/wemo/cache/devicelist/runnable/ResetAllRunnable.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */