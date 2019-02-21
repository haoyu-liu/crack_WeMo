package com.belkin.cordova.plugin.callback;

import com.belkin.utils.LogUtils;
import org.apache.cordova.CallbackContext;
import org.apache.cordova.PluginResult;
import org.apache.cordova.PluginResult.Status;

public class HideDeviceCallback
  implements SuccessPluginResultCallback, ErrorPluginResultCallback
{
  private final String TAG = getClass().getSimpleName();
  private CallbackContext mCallbackContext;
  
  public HideDeviceCallback(CallbackContext paramCallbackContext)
  {
    this.mCallbackContext = paramCallbackContext;
  }
  
  public void onError(String paramString)
  {
    LogUtils.errorLog(this.TAG, "Error during hiding device: " + paramString);
    if (this.mCallbackContext != null)
    {
      PluginResult localPluginResult = new PluginResult(PluginResult.Status.ERROR, paramString);
      localPluginResult.setKeepCallback(false);
      this.mCallbackContext.sendPluginResult(localPluginResult);
    }
  }
  
  public void onSuccess(String paramString)
  {
    LogUtils.debugLog(this.TAG, "Hide deviceSUCCESS: " + paramString);
    if (this.mCallbackContext != null)
    {
      PluginResult localPluginResult = new PluginResult(PluginResult.Status.OK, paramString);
      localPluginResult.setKeepCallback(false);
      this.mCallbackContext.sendPluginResult(localPluginResult);
    }
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/belkin/cordova/plugin/callback/HideDeviceCallback.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */