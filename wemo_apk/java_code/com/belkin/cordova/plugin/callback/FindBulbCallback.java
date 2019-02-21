package com.belkin.cordova.plugin.callback;

import android.text.TextUtils;
import com.belkin.utils.LogUtils;
import org.apache.cordova.CallbackContext;
import org.apache.cordova.PluginResult;
import org.apache.cordova.PluginResult.Status;
import org.json.JSONArray;

public class FindBulbCallback
  implements SuccessPluginResultCallback, ErrorPluginResultCallback
{
  private String TAG = "FindBulbCallback";
  private CallbackContext mCallbackContext;
  
  public FindBulbCallback(CallbackContext paramCallbackContext)
  {
    this.mCallbackContext = paramCallbackContext;
  }
  
  public void onError(String paramString)
  {
    LogUtils.errorLog(this.TAG, "FindBulbCallback: success during find bulb.");
    if (this.mCallbackContext != null)
    {
      PluginResult localPluginResult = new PluginResult(PluginResult.Status.ERROR, paramString);
      localPluginResult.setKeepCallback(false);
      this.mCallbackContext.sendPluginResult(localPluginResult);
    }
  }
  
  public void onSuccess(String paramString)
  {
    LogUtils.infoLog(this.TAG, "FindBulbCallback: success during find bulb.");
    LogUtils.infoLog(this.TAG, "onSuccess: result>> " + paramString);
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
      LogUtils.errorLog(this.TAG, "Exception in onSuccess ex:" + localException);
    }
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/belkin/cordova/plugin/callback/FindBulbCallback.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */