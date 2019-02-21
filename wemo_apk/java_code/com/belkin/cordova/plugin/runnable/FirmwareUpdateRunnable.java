package com.belkin.cordova.plugin.runnable;

import com.belkin.cordova.plugin.callback.FirmwareUpdateCallback;
import com.belkin.firmware.FirmwareUpdateManager;
import com.belkin.wemo.runnable.WeMoRunnable;
import org.json.JSONArray;

public class FirmwareUpdateRunnable
  extends WeMoRunnable
{
  private FirmwareUpdateCallback mCallback;
  private JSONArray mInParamArray;
  
  public FirmwareUpdateRunnable(JSONArray paramJSONArray, FirmwareUpdateCallback paramFirmwareUpdateCallback)
  {
    this.mInParamArray = paramJSONArray;
    this.mCallback = paramFirmwareUpdateCallback;
  }
  
  public void run()
  {
    boolean bool;
    if (this.mInParamArray != null)
    {
      bool = FirmwareUpdateManager.processFirwareUpdatePayload(this.mInParamArray);
      if (bool) {
        this.mCallback.onSuccess(Boolean.toString(bool));
      }
    }
    else
    {
      return;
    }
    this.mCallback.onError(Boolean.toString(bool));
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/belkin/cordova/plugin/runnable/FirmwareUpdateRunnable.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */