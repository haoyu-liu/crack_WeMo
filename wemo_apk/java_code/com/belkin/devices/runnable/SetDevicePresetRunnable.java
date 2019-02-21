package com.belkin.devices.runnable;

import android.content.Context;
import com.belkin.cybergarage.wrapper.UpnpDeviceList;
import com.belkin.utils.LogUtils;
import com.belkin.wemo.cache.devicelist.DeviceListManager;
import com.belkin.wemo.cache.utils.NetworkMode;
import com.belkin.wemo.callback.SetAndGetActionCallBack;
import com.belkin.wemo.runnable.WeMoRunnable;
import org.json.JSONArray;
import org.json.JSONException;

public class SetDevicePresetRunnable
  extends WeMoRunnable
{
  private static final String TAG = "SetDevicePresetRunnable";
  private SetAndGetActionCallBack mCallback = null;
  private Context mContext = null;
  private JSONArray mPresetsInfo = null;
  
  public SetDevicePresetRunnable(JSONArray paramJSONArray, SetAndGetActionCallBack paramSetAndGetActionCallBack, Context paramContext)
  {
    LogUtils.infoLog("SetDevicePresetRunnable", "presetsInfo: " + paramJSONArray.toString());
    this.mCallback = paramSetAndGetActionCallBack;
    this.mPresetsInfo = paramJSONArray;
    this.mContext = paramContext;
  }
  
  public void run()
  {
    try
    {
      if (NetworkMode.isLocal())
      {
        new UpnpDeviceList(this.mContext).setDevicePreset(this.mPresetsInfo, this.mCallback);
        return;
      }
      DeviceListManager.getInstance(this.mContext).setDevicePresetCloud(this.mPresetsInfo, this.mCallback);
      return;
    }
    catch (JSONException localJSONException)
    {
      LogUtils.errorLog("SetDevicePresetRunnable", "JSONException during set preset: ", localJSONException);
    }
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/belkin/devices/runnable/SetDevicePresetRunnable.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */