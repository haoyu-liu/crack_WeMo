package com.belkin.cordova.plugin.callback;

import org.apache.cordova.CallbackContext;

public class SetBlobStorageCallback
  implements SuccessPluginResultCallback, ErrorPluginResultCallback
{
  private CallbackContext mCallbackContext;
  
  public SetBlobStorageCallback(CallbackContext paramCallbackContext)
  {
    this.mCallbackContext = paramCallbackContext;
  }
  
  public void onError(String paramString) {}
  
  public void onSuccess(String paramString) {}
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/belkin/cordova/plugin/callback/SetBlobStorageCallback.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */