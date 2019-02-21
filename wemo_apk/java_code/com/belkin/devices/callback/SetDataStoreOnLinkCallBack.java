package com.belkin.devices.callback;

import com.belkin.utils.LogUtils;
import com.belkin.wemo.callback.SetAndGetActionCallBack;
import org.apache.cordova.CallbackContext;
import org.apache.cordova.PluginResult;
import org.apache.cordova.PluginResult.Status;

public class SetDataStoreOnLinkCallBack
  implements SetAndGetActionCallBack
{
  private static final String TAG = "SetDataStoreOnLinkCallBack";
  private CallbackContext mCallbackContext;
  
  public SetDataStoreOnLinkCallBack(CallbackContext paramCallbackContext)
  {
    this.mCallbackContext = paramCallbackContext;
  }
  
  public void onError()
  {
    LogUtils.errorLog("SetDataStoreOnLinkCallBack", "SetDataStoreOnLinkCallBack: error during setting emergency contact ().");
    if (this.mCallbackContext != null)
    {
      PluginResult localPluginResult = new PluginResult(PluginResult.Status.ERROR);
      localPluginResult.setKeepCallback(false);
      this.mCallbackContext.sendPluginResult(localPluginResult);
    }
  }
  
  public void onSuccess(String paramString)
  {
    LogUtils.infoLog("SetDataStoreOnLinkCallBack", "SetDataStoreOnLinkCallBack" + paramString);
    if (this.mCallbackContext != null)
    {
      PluginResult localPluginResult = new PluginResult(PluginResult.Status.OK, paramString);
      localPluginResult.setKeepCallback(false);
      this.mCallbackContext.sendPluginResult(localPluginResult);
    }
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/belkin/devices/callback/SetDataStoreOnLinkCallBack.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */