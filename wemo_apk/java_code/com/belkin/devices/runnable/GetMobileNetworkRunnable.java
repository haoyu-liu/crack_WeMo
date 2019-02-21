package com.belkin.devices.runnable;

import android.content.Context;
import android.text.TextUtils;
import com.belkin.utils.LogUtils;
import com.belkin.wemo.cache.utils.SDKNetworkUtils;
import com.belkin.wemo.runnable.WeMoRunnable;
import org.apache.cordova.CallbackContext;
import org.apache.cordova.PluginResult;
import org.apache.cordova.PluginResult.Status;

public class GetMobileNetworkRunnable
  extends WeMoRunnable
{
  private static final String TAG = "GetMobileNetworkRunnable";
  private CallbackContext mCallbackContext = null;
  private SDKNetworkUtils mNetworkUtil = null;
  
  public GetMobileNetworkRunnable(CallbackContext paramCallbackContext, Context paramContext)
  {
    this.mCallbackContext = paramCallbackContext;
    this.mNetworkUtil = new SDKNetworkUtils(paramContext);
  }
  
  private void onError(String paramString)
  {
    LogUtils.errorLog("GetMobileNetworkRunnable", "onError: " + paramString);
    PluginResult localPluginResult = new PluginResult(PluginResult.Status.ERROR);
    localPluginResult.setKeepCallback(false);
    this.mCallbackContext.sendPluginResult(localPluginResult);
  }
  
  private void onSuccess(String paramString)
  {
    LogUtils.infoLog("GetMobileNetworkRunnable", "onSuccess: " + paramString);
    PluginResult localPluginResult = new PluginResult(PluginResult.Status.OK, paramString);
    localPluginResult.setKeepCallback(false);
    this.mCallbackContext.sendPluginResult(localPluginResult);
  }
  
  public void run()
  {
    String str;
    if (this.mCallbackContext != null)
    {
      str = this.mNetworkUtil.getNetworkType();
      LogUtils.infoLog("GetMobileNetworkRunnable", "result: " + str);
      if (!TextUtils.isEmpty(str)) {
        onSuccess(str);
      }
    }
    else
    {
      return;
    }
    onError(str);
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/belkin/devices/runnable/GetMobileNetworkRunnable.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */