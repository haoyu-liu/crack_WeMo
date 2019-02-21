package com.belkin.cordova.plugin.callback;

import android.text.TextUtils;
import com.belkin.utils.LogUtils;
import org.apache.cordova.CallbackContext;
import org.apache.cordova.PluginResult;
import org.apache.cordova.PluginResult.Status;

public class FirmwareUpdateCallback
  implements ErrorPluginResultCallback, SuccessPluginResultCallback
{
  private static final String TAG = "FirmwareUpdateCallback";
  private CallbackContext mCallbackContext;
  
  public FirmwareUpdateCallback(CallbackContext paramCallbackContext)
  {
    this.mCallbackContext = paramCallbackContext;
  }
  
  public void onError(String paramString)
  {
    LogUtils.errorLog("FirmwareUpdateCallback", "error in firmware update.");
    if (this.mCallbackContext != null)
    {
      PluginResult localPluginResult = new PluginResult(PluginResult.Status.ERROR);
      localPluginResult.setKeepCallback(false);
      this.mCallbackContext.sendPluginResult(localPluginResult);
    }
  }
  
  public void onSuccess(String paramString)
  {
    LogUtils.infoLog("FirmwareUpdateCallback", "firmware update processing started successfully " + paramString);
    if (this.mCallbackContext != null)
    {
      if (!TextUtils.isEmpty(paramString))
      {
        PluginResult localPluginResult = new PluginResult(PluginResult.Status.OK);
        localPluginResult.setKeepCallback(false);
        this.mCallbackContext.sendPluginResult(localPluginResult);
      }
    }
    else {
      return;
    }
    LogUtils.infoLog("FirmwareUpdateCallback", "Empty result" + paramString);
    onError("empty result");
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/belkin/cordova/plugin/callback/FirmwareUpdateCallback.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */