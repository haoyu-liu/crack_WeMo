package com.belkin.wemo.cache.devicelist.runnable;

import android.text.TextUtils;
import com.belkin.wemo.cache.data.DeviceInformation;
import com.belkin.wemo.cache.devicelist.DeviceListManager;
import com.belkin.wemo.cache.devicelist.callback.PluginResultErrorCallback;
import com.belkin.wemo.cache.devicelist.callback.PluginResultSuccessCallback;
import com.belkin.wemo.cache.utils.SDKLogUtils;
import com.belkin.wemo.controlaction.ControlActionHandler;
import com.belkin.wemo.controlaction.callback.ControlActionErrorCallback;
import com.belkin.wemo.controlaction.callback.ControlActionSuccessCallback;
import com.belkin.wemo.localsdk.parser.ResetPowerThresholdResponse;
import com.belkin.wemo.runnable.WeMoRunnable;
import org.cybergarage.upnp.Action;
import org.cybergarage.upnp.ControlPoint;
import org.cybergarage.upnp.Device;
import org.json.JSONException;

public class ResetThresholdRunnable
  extends WeMoRunnable
  implements ControlActionSuccessCallback, ControlActionErrorCallback
{
  private PluginResultErrorCallback errorCallback;
  private DeviceListManager mDLM;
  private String mResetType;
  private PluginResultSuccessCallback successCallback;
  private String udn;
  
  public ResetThresholdRunnable(PluginResultErrorCallback paramPluginResultErrorCallback, PluginResultSuccessCallback paramPluginResultSuccessCallback, String paramString1, DeviceListManager paramDeviceListManager, String paramString2)
  {
    this.mDLM = paramDeviceListManager;
    this.udn = paramString2;
    this.mResetType = paramString1;
    this.errorCallback = paramPluginResultErrorCallback;
    this.successCallback = paramPluginResultSuccessCallback;
  }
  
  private boolean processNewPowerThreshold(String paramString)
  {
    DeviceInformation localDeviceInformation = this.mDLM.getDeviceInformationFromDevicesArray(this.udn);
    if (localDeviceInformation != null) {
      try
      {
        localDeviceInformation.setAttributeValue("powerThreshold", paramString);
        this.mDLM.setDeviceInformationToDevicesArrayLocal(localDeviceInformation, false);
        return true;
      }
      catch (JSONException localJSONException)
      {
        SDKLogUtils.errorLog(this.TAG, "JSONException while setting attribute value: ", localJSONException);
        return false;
      }
    }
    SDKLogUtils.errorLog(this.TAG, "Null device information in updateAttribute() : ");
    return false;
  }
  
  public void onActionError(Exception paramException)
  {
    if (this.errorCallback != null) {
      this.errorCallback.onError(paramException.getMessage());
    }
  }
  
  public void onActionSuccess(String paramString)
  {
    String str = String.valueOf(new ResetPowerThresholdResponse().parsePowerThreshold(paramString));
    SDKLogUtils.debugLog(this.TAG, "Power Threshold from FW after Reset: " + str);
    if (processNewPowerThreshold(str)) {
      if (this.successCallback != null) {
        this.successCallback.onSuccess(str);
      }
    }
    while (this.errorCallback == null) {
      return;
    }
    this.errorCallback.onError("Error while processing new power threshold.");
  }
  
  public void run()
  {
    try
    {
      if (!TextUtils.isEmpty(this.mResetType))
      {
        Device localDevice = this.mDLM.getUpnpControl().getDevice(this.udn);
        if (localDevice != null)
        {
          Action localAction;
          if (this.mResetType.equals("resetThreshold")) {
            localAction = localDevice.getAction("ResetPowerThreshold");
          }
          for (;;)
          {
            ControlActionHandler.newInstance().postControlAction(localAction, this, this);
            return;
            boolean bool = this.mResetType.equals("resetAutoThreshold");
            localAction = null;
            if (bool) {
              localAction = localDevice.getAction("SetAutoPowerThreshold");
            }
          }
        }
        if (this.errorCallback == null) {
          return;
        }
        this.errorCallback.onError("uPnP Device is empty for UDN: " + this.udn);
      }
    }
    catch (Exception localException)
    {
      SDKLogUtils.errorLog(this.TAG, "Exception in run()", localException);
      if (this.errorCallback != null)
      {
        this.errorCallback.onError("Empty reset type for run()");
        return;
        if (this.errorCallback != null) {
          this.errorCallback.onError("Empty reset type for run()");
        }
      }
    }
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/belkin/wemo/cache/devicelist/runnable/ResetThresholdRunnable.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */