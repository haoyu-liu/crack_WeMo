package com.belkin.devices.runnable;

import android.content.Context;
import com.belkin.cybergarage.wrapper.UpnpDeviceList;
import com.belkin.utils.LogUtils;
import com.belkin.wemo.runnable.WeMoRunnable;
import org.apache.cordova.CallbackContext;
import org.apache.cordova.PluginResult;
import org.apache.cordova.PluginResult.Status;
import org.json.JSONException;

public class GetLocalEmailBodyRunnable
  extends WeMoRunnable
{
  private static final String TAG = "GetLocalEmailBodyRunnable";
  private CallbackContext mCallbackContext = null;
  private UpnpDeviceList mUpnpDeviceList = null;
  
  public GetLocalEmailBodyRunnable(CallbackContext paramCallbackContext, Context paramContext)
  {
    this.mCallbackContext = paramCallbackContext;
    this.mUpnpDeviceList = UpnpDeviceList.getInstance(paramContext);
  }
  
  private void onError(Exception paramException)
  {
    PluginResult localPluginResult = new PluginResult(PluginResult.Status.ERROR);
    localPluginResult.setKeepCallback(false);
    this.mCallbackContext.sendPluginResult(localPluginResult);
  }
  
  private void onSuccess(String paramString)
  {
    PluginResult localPluginResult = new PluginResult(PluginResult.Status.OK, paramString);
    localPluginResult.setKeepCallback(false);
    this.mCallbackContext.sendPluginResult(localPluginResult);
  }
  
  public void run()
  {
    if (this.mCallbackContext != null) {}
    try
    {
      String str = this.mUpnpDeviceList.getEmailData();
      LogUtils.infoLog("GetLocalEmailBodyRunnable", "GetLocalEmailBody result: " + str);
      onSuccess(str);
      return;
    }
    catch (JSONException localJSONException)
    {
      LogUtils.errorLog("GetLocalEmailBodyRunnable", "Error during ACTION_GET_LOCAL_EMAIL_BODY", localJSONException);
      onError(localJSONException);
    }
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/belkin/devices/runnable/GetLocalEmailBodyRunnable.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */