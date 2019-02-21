package com.belkin.wemo.cache.devicelist.runnable;

import com.belkin.wemo.cache.devicelist.DeviceListManager;
import com.belkin.wemo.cache.devicelist.callback.PluginResultErrorCallback;
import com.belkin.wemo.cache.devicelist.callback.PluginResultSuccessCallback;
import com.belkin.wemo.cache.utils.SDKLogUtils;
import com.belkin.wemo.runnable.WeMoRunnable;
import org.json.JSONException;
import org.json.JSONObject;

public class ResetWifiRunnable
  extends WeMoRunnable
{
  private static final String TAG = "ResetWifiRunnable";
  private PluginResultErrorCallback errorCallback;
  private DeviceListManager mDLM;
  private PluginResultSuccessCallback successCallback;
  private String udn;
  
  public ResetWifiRunnable(PluginResultErrorCallback paramPluginResultErrorCallback, PluginResultSuccessCallback paramPluginResultSuccessCallback, DeviceListManager paramDeviceListManager, String paramString)
  {
    this.mDLM = paramDeviceListManager;
    this.successCallback = paramPluginResultSuccessCallback;
    this.errorCallback = paramPluginResultErrorCallback;
    this.udn = paramString;
  }
  
  public void run()
  {
    boolean bool = false;
    for (;;)
    {
      try
      {
        bool = this.mDLM.resetPlugin(this.udn, "5");
        if (!bool) {
          continue;
        }
        this.mDLM.removeDeviceByUDN(this.udn, false);
        PluginResultSuccessCallback localPluginResultSuccessCallback = this.successCallback;
        if (localPluginResultSuccessCallback == null) {}
      }
      catch (Exception localException)
      {
        JSONObject localJSONObject;
        SDKLogUtils.errorLog("ResetWifiRunnable", "Exception in ResetWifiRunnable:doInBackground ex:" + localException);
        continue;
        if (this.errorCallback == null) {
          continue;
        }
        this.errorCallback.onError("RESET_WIFI  failed");
        continue;
      }
      try
      {
        localJSONObject = this.mDLM.prepareDeviceResetResponse("reset_wifi", this.udn, "true");
        this.successCallback.onSuccess(localJSONObject.toString());
        this.mDLM.sendNotification("reset_wifi", bool + "", this.udn);
        SDKLogUtils.debugLog("ResetWifiRunnable", "Result of wifi reset operation: " + bool);
        return;
      }
      catch (JSONException localJSONException)
      {
        SDKLogUtils.errorLog("ResetWifiRunnable", "exception in resetDeviceAll: ", localJSONException);
        if (this.errorCallback == null) {
          continue;
        }
        this.errorCallback.onError(localJSONException.getMessage());
      }
    }
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/belkin/wemo/cache/devicelist/runnable/ResetWifiRunnable.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */