package com.belkin.devices.callback;

import android.text.TextUtils;
import com.belkin.utils.LogUtils;
import com.belkin.wemo.callback.SetAndGetActionCallBack;
import org.apache.cordova.CallbackContext;
import org.apache.cordova.PluginResult;
import org.apache.cordova.PluginResult.Status;

public class SetDeviceNameOnLinkCallBack
  implements SetAndGetActionCallBack
{
  private static final String TAG = "SetDeviceNameOnLinkCallBack";
  private CallbackContext mCallbackContext;
  
  public SetDeviceNameOnLinkCallBack(CallbackContext paramCallbackContext)
  {
    this.mCallbackContext = paramCallbackContext;
  }
  
  public void onError()
  {
    LogUtils.errorLog("SetDeviceNameOnLinkCallBack", "SetDeviceNameOnLinkCallBack: error during getting emergency contact.");
    if (this.mCallbackContext != null)
    {
      PluginResult localPluginResult = new PluginResult(PluginResult.Status.ERROR);
      localPluginResult.setKeepCallback(false);
      this.mCallbackContext.sendPluginResult(localPluginResult);
    }
  }
  
  public void onSuccess(String paramString)
  {
    LogUtils.infoLog("SetDeviceNameOnLinkCallBack", "onSuccess: result>> " + paramString);
    if (this.mCallbackContext != null)
    {
      if (TextUtils.isEmpty(paramString))
      {
        PluginResult localPluginResult = new PluginResult(PluginResult.Status.OK);
        localPluginResult.setKeepCallback(false);
        this.mCallbackContext.sendPluginResult(localPluginResult);
      }
    }
    else {
      return;
    }
    LogUtils.infoLog("SetDeviceNameOnLinkCallBack", "Error in setting the multiple device names :: deviceIDs " + paramString);
    onError();
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/belkin/devices/callback/SetDeviceNameOnLinkCallBack.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */