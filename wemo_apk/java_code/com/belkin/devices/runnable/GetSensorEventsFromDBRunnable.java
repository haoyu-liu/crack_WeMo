package com.belkin.devices.runnable;

import android.content.Context;
import com.belkin.devices.callback.GetSensorEventFromDBCallBack;
import com.belkin.wemo.cache.devicelist.DeviceListManager;
import com.belkin.wemo.runnable.WeMoRunnable;

public class GetSensorEventsFromDBRunnable
  extends WeMoRunnable
{
  private GetSensorEventFromDBCallBack mCallback = null;
  private DeviceListManager mDeviceListManager = null;
  
  public GetSensorEventsFromDBRunnable(GetSensorEventFromDBCallBack paramGetSensorEventFromDBCallBack, Context paramContext)
  {
    this.mCallback = paramGetSensorEventFromDBCallBack;
    this.mDeviceListManager = DeviceListManager.getInstance(paramContext);
  }
  
  public void run()
  {
    this.mCallback.onSuccess(this.mDeviceListManager.fetchSensorEventHistoryFromDB());
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/belkin/devices/runnable/GetSensorEventsFromDBRunnable.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */