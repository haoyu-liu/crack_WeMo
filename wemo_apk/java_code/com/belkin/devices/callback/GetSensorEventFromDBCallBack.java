package com.belkin.devices.callback;

import com.belkin.utils.LogUtils;
import org.apache.cordova.CallbackContext;
import org.apache.cordova.PluginResult;
import org.apache.cordova.PluginResult.Status;
import org.json.JSONArray;

public class GetSensorEventFromDBCallBack
{
  private static final String TAG = "GetSensorEventFromDBCallBack";
  private CallbackContext mCallbackContext;
  
  public GetSensorEventFromDBCallBack(CallbackContext paramCallbackContext)
  {
    this.mCallbackContext = paramCallbackContext;
  }
  
  public void onError()
  {
    LogUtils.errorLog("GetSensorEventFromDBCallBack", "GetSensorEventFromDBCallBack: error during fetching sensor event history from DB");
    if (this.mCallbackContext != null)
    {
      PluginResult localPluginResult = new PluginResult(PluginResult.Status.ERROR);
      localPluginResult.setKeepCallback(false);
      this.mCallbackContext.sendPluginResult(localPluginResult);
    }
  }
  
  public void onSuccess(JSONArray paramJSONArray)
  {
    LogUtils.infoLog("GetSensorEventFromDBCallBack", ":: GetSensorEventFromDBCallBack: success fetching data from DB ::" + paramJSONArray);
    if (this.mCallbackContext != null)
    {
      PluginResult localPluginResult = new PluginResult(PluginResult.Status.OK, paramJSONArray);
      localPluginResult.setKeepCallback(false);
      this.mCallbackContext.sendPluginResult(localPluginResult);
    }
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/belkin/devices/callback/GetSensorEventFromDBCallBack.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */