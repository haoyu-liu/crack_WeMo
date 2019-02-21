package com.belkin.cordova.plugin.callback;

import android.text.TextUtils;
import com.belkin.utils.LogUtils;
import com.belkin.wemo.cache.devicelist.callback.PluginResultErrorCallback;
import com.belkin.wemo.cache.devicelist.callback.PluginResultSuccessCallback;
import org.apache.cordova.CallbackContext;
import org.apache.cordova.PluginResult;
import org.apache.cordova.PluginResult.Status;

public class ResetDeviceCallback
  implements PluginResultErrorCallback, PluginResultSuccessCallback
{
  private static final String TAG = "ResetDeviceCallback";
  private CallbackContext mCallbackContext;
  
  public ResetDeviceCallback(CallbackContext paramCallbackContext)
  {
    this.mCallbackContext = paramCallbackContext;
  }
  
  public void onError(String paramString)
  {
    LogUtils.errorLog("ResetDeviceCallback", "SetDevicePropertiesCallback: error during setting device properties.");
    if (this.mCallbackContext != null)
    {
      PluginResult localPluginResult = new PluginResult(PluginResult.Status.ERROR, paramString);
      localPluginResult.setKeepCallback(false);
      this.mCallbackContext.sendPluginResult(localPluginResult);
    }
  }
  
  public void onSuccess(String paramString)
  {
    LogUtils.infoLog("ResetDeviceCallback", "onSuccess: result>> " + paramString);
    if (this.mCallbackContext != null) {
      if (!TextUtils.isEmpty(paramString)) {
        break label65;
      }
    }
    label65:
    for (PluginResult localPluginResult = new PluginResult(PluginResult.Status.OK, "{}");; localPluginResult = new PluginResult(PluginResult.Status.OK, paramString))
    {
      localPluginResult.setKeepCallback(false);
      this.mCallbackContext.sendPluginResult(localPluginResult);
      return;
    }
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/belkin/cordova/plugin/callback/ResetDeviceCallback.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */