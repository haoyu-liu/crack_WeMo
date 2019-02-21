package com.belkin.devices.callback;

import com.belkin.utils.LogUtils;
import com.belkin.wemo.callback.SetAndGetActionCallBack;
import org.apache.cordova.CallbackContext;
import org.apache.cordova.PluginResult;
import org.apache.cordova.PluginResult.Status;

public class DevicePresetCallBack
  implements SetAndGetActionCallBack
{
  private static final String TAG = "DevicePresetCallBack";
  private CallbackContext mCallbackContext;
  
  public DevicePresetCallBack(CallbackContext paramCallbackContext)
  {
    this.mCallbackContext = paramCallbackContext;
  }
  
  public void onError()
  {
    LogUtils.errorLog("DevicePresetCallBack", "DevicePresetCallBack: onError.");
    if (this.mCallbackContext != null)
    {
      PluginResult localPluginResult = new PluginResult(PluginResult.Status.ERROR);
      localPluginResult.setKeepCallback(false);
      this.mCallbackContext.sendPluginResult(localPluginResult);
    }
  }
  
  public void onSuccess(String paramString)
  {
    LogUtils.infoLog("DevicePresetCallBack", "DevicePresetCallBack: onSuccess: " + paramString);
    if (this.mCallbackContext != null)
    {
      PluginResult localPluginResult = new PluginResult(PluginResult.Status.OK, paramString);
      localPluginResult.setKeepCallback(false);
      this.mCallbackContext.sendPluginResult(localPluginResult);
    }
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/belkin/devices/callback/DevicePresetCallBack.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */