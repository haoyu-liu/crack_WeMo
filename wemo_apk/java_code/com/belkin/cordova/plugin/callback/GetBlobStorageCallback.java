package com.belkin.cordova.plugin.callback;

import android.text.TextUtils;
import com.belkin.utils.LogUtils;
import org.apache.cordova.CallbackContext;
import org.apache.cordova.PluginResult;
import org.apache.cordova.PluginResult.Status;
import org.json.JSONArray;

public class GetBlobStorageCallback
  implements SuccessPluginResultCallback, ErrorPluginResultCallback
{
  private final String TAG = "GetSetBlobStorageCallback";
  private CallbackContext mCallbackContext;
  
  public GetBlobStorageCallback(CallbackContext paramCallbackContext)
  {
    this.mCallbackContext = paramCallbackContext;
  }
  
  public void onError(String paramString)
  {
    LogUtils.errorLog("GetSetBlobStorageCallback", "GetSetBlobStorageCallback: onError() callback. error: " + paramString);
    if (this.mCallbackContext != null)
    {
      PluginResult localPluginResult = new PluginResult(PluginResult.Status.ERROR, paramString);
      localPluginResult.setKeepCallback(false);
      this.mCallbackContext.sendPluginResult(localPluginResult);
    }
  }
  
  public void onSuccess(String paramString)
  {
    LogUtils.infoLog("GetSetBlobStorageCallback", "GetSetBlobStorageCallback: onSuccess() callback. result: " + paramString);
    try
    {
      if (this.mCallbackContext != null)
      {
        JSONArray localJSONArray1 = new JSONArray();
        if (TextUtils.isEmpty(paramString)) {}
        JSONArray localJSONArray2;
        for (PluginResult localPluginResult = new PluginResult(PluginResult.Status.OK, localJSONArray1);; localPluginResult = new PluginResult(PluginResult.Status.OK, localJSONArray2))
        {
          localPluginResult.setKeepCallback(false);
          this.mCallbackContext.sendPluginResult(localPluginResult);
          return;
          localJSONArray2 = new JSONArray(paramString);
        }
      }
      return;
    }
    catch (Exception localException)
    {
      LogUtils.errorLog("GetSetBlobStorageCallback", "Exception in onSuccess ex:" + localException);
    }
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/belkin/cordova/plugin/callback/GetBlobStorageCallback.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */