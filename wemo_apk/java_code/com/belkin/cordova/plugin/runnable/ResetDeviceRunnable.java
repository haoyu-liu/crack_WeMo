package com.belkin.cordova.plugin.runnable;

import com.belkin.controller.DeviceListController;
import com.belkin.cordova.plugin.callback.ResetDeviceCallback;
import com.belkin.utils.LogUtils;
import com.belkin.wemo.runnable.WeMoRunnable;
import org.json.JSONArray;
import org.json.JSONObject;

public class ResetDeviceRunnable
  extends WeMoRunnable
{
  private static final String TAG = "ResetDeviceRunnable";
  private ResetDeviceCallback mCallback;
  private DeviceListController mDeviceListController;
  private JSONArray mInParamArray;
  
  public ResetDeviceRunnable(JSONArray paramJSONArray, ResetDeviceCallback paramResetDeviceCallback, DeviceListController paramDeviceListController)
  {
    this.mInParamArray = paramJSONArray;
    this.mCallback = paramResetDeviceCallback;
    this.mDeviceListController = paramDeviceListController;
  }
  
  public void run()
  {
    try
    {
      if (this.mInParamArray.length() > 2) {}
      JSONObject localJSONObject;
      for (Object localObject = this.mDeviceListController.resetDevice(this.mCallback, this.mCallback, this.mInParamArray.getString(0), this.mInParamArray.getJSONObject(1), this.mInParamArray.getJSONObject(2), new Boolean[0]); ((JSONObject)localObject).has("error"); localObject = localJSONObject)
      {
        LogUtils.errorLog("ResetDeviceRunnable", "Error in run() of resetDevice: " + localObject);
        this.mCallback.onError(((JSONObject)localObject).toString());
        return;
        localJSONObject = this.mDeviceListController.resetDevice(this.mCallback, this.mCallback, this.mInParamArray.getString(0), this.mInParamArray.getJSONObject(1), new JSONObject(), new Boolean[0]);
      }
      return;
    }
    catch (Exception localException)
    {
      LogUtils.errorLog("ResetDeviceRunnable", "Exception in run() of resetDevice: ", localException);
      this.mCallback.onError("{\"error\":\"Exception in run() of resetDevice\"");
    }
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/belkin/cordova/plugin/runnable/ResetDeviceRunnable.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */