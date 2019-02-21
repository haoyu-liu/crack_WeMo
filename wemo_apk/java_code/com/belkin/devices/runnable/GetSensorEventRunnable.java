package com.belkin.devices.runnable;

import android.content.Context;
import com.belkin.devices.callback.GetSensorEventHistoryCallBack;
import com.belkin.wemo.cache.devicelist.DeviceListManager;
import com.belkin.wemo.runnable.WeMoRunnable;
import org.json.JSONArray;

public class GetSensorEventRunnable
  extends WeMoRunnable
{
  private JSONArray array = null;
  private GetSensorEventHistoryCallBack mCallback = null;
  private DeviceListManager mDeviceListManager = null;
  
  public GetSensorEventRunnable(GetSensorEventHistoryCallBack paramGetSensorEventHistoryCallBack, Context paramContext, JSONArray paramJSONArray)
  {
    this.mCallback = paramGetSensorEventHistoryCallBack;
    this.mDeviceListManager = DeviceListManager.getInstance(paramContext);
    this.array = paramJSONArray;
  }
  
  public void run()
  {
    this.mDeviceListManager.fetchSensorEventHistory(this.mCallback, this.array);
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/belkin/devices/runnable/GetSensorEventRunnable.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */