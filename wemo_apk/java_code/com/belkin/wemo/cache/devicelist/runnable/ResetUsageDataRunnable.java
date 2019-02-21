package com.belkin.wemo.cache.devicelist.runnable;

import com.belkin.wemo.cache.devicelist.DeviceListManager;
import com.belkin.wemo.cache.devicelist.callback.PluginResultErrorCallback;
import com.belkin.wemo.cache.devicelist.callback.PluginResultSuccessCallback;
import com.belkin.wemo.cache.utils.SDKLogUtils;
import com.belkin.wemo.runnable.WeMoRunnable;
import org.json.JSONException;
import org.json.JSONObject;

public class ResetUsageDataRunnable
  extends WeMoRunnable
{
  private static final String TAG = "ResetUsageDataRunnable";
  private PluginResultErrorCallback errorCallback;
  private DeviceListManager mDLM;
  private PluginResultSuccessCallback successCallback;
  private String udn;
  
  public ResetUsageDataRunnable(PluginResultErrorCallback paramPluginResultErrorCallback, PluginResultSuccessCallback paramPluginResultSuccessCallback, DeviceListManager paramDeviceListManager, String paramString)
  {
    this.mDLM = paramDeviceListManager;
    this.errorCallback = paramPluginResultErrorCallback;
    this.successCallback = paramPluginResultSuccessCallback;
    this.udn = paramString;
  }
  
  public void run()
  {
    this.mDLM.getDeviceFromDBByUDN(this.udn, false, true, false);
    try
    {
      boolean bool2 = this.mDLM.resetPlugin(this.udn, "4");
      bool1 = bool2;
      if (bool1) {}
      if (!bool1) {
        break label201;
      }
    }
    catch (Exception localException)
    {
      for (;;)
      {
        try
        {
          JSONObject localJSONObject = this.mDLM.prepareDeviceResetResponse("reset_usage_data", this.udn, "true");
          this.successCallback.onSuccess(localJSONObject.toString());
          this.mDLM.sendNotification("reset_usage_data", bool1 + "", this.udn);
          SDKLogUtils.debugLog("ResetUsageDataRunnable", "Was reset operation successful: " + bool1);
          return;
          localException = localException;
          SDKLogUtils.errorLog("ResetUsageDataRunnable", "Exception in ResetWifiRunnable:doInBackground ex:" + localException);
          boolean bool1 = false;
        }
        catch (JSONException localJSONException)
        {
          SDKLogUtils.errorLog("ResetUsageDataRunnable", "exception in RESET_USAGE_DATA: ", localJSONException);
          if (this.errorCallback == null) {
            continue;
          }
          this.errorCallback.onError(localJSONException.getMessage());
          continue;
        }
        if (this.errorCallback != null) {
          this.errorCallback.onError("RESET_USAGE_DATA failed");
        }
      }
    }
    if (this.successCallback == null) {}
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/belkin/wemo/cache/devicelist/runnable/ResetUsageDataRunnable.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */