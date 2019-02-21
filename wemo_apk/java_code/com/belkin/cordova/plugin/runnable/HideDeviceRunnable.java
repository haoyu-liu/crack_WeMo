package com.belkin.cordova.plugin.runnable;

import android.content.Context;
import com.belkin.controller.DeviceListController;
import com.belkin.cordova.plugin.callback.HideDeviceCallback;
import com.belkin.utils.LogUtils;
import com.belkin.wemo.runnable.WeMoRunnable;
import org.json.JSONArray;
import org.json.JSONObject;

public class HideDeviceRunnable
  extends WeMoRunnable
{
  private static final String TAG = "HideDeviceRunnable";
  private HideDeviceCallback mCallback;
  private Context mContext;
  private DeviceListController mDeviceListController;
  private JSONArray mInParamArray;
  
  public HideDeviceRunnable(JSONArray paramJSONArray, HideDeviceCallback paramHideDeviceCallback, Context paramContext)
  {
    this.mContext = paramContext;
    this.mInParamArray = paramJSONArray;
    this.mCallback = paramHideDeviceCallback;
    this.mDeviceListController = DeviceListController.getInstance(paramContext);
  }
  
  public void run()
  {
    try
    {
      if (this.mInParamArray != null)
      {
        if (this.mInParamArray.length() > 0)
        {
          JSONObject localJSONObject = this.mInParamArray.getJSONObject(0);
          if (!localJSONObject.has("udn")) {
            return;
          }
          String str = localJSONObject.getString("udn");
          int i = localJSONObject.getInt("hide");
          this.mDeviceListController.hideDevice(str, i);
          this.mCallback.onSuccess("success hiding device");
          return;
        }
        this.mCallback.onError("empty mInParamArray");
        return;
      }
    }
    catch (Exception localException)
    {
      LogUtils.errorLog("HideDeviceRunnable", "Exception in run() method ex:" + localException);
      localException.printStackTrace();
      this.mCallback.onError("Exception in run for HideDeviceRunnable");
      return;
    }
    this.mCallback.onError("null mInParamArray");
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/belkin/cordova/plugin/runnable/HideDeviceRunnable.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */