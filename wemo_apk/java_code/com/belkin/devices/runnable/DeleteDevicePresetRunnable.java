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

public class DeleteDevicePresetRunnable
  extends WeMoRunnable
{
  private static final String TAG = "DeleteDevicePresetRunnable";
  private SetAndGetActionCallBack mCallbackContext = null;
  private Context mContext = null;
  private JSONArray mPresetsInfo = null;
  private UpnpDeviceList mUpNpDeviceList = null;
  
  public DeleteDevicePresetRunnable(JSONArray paramJSONArray, SetAndGetActionCallBack paramSetAndGetActionCallBack, Context paramContext)
  {
    LogUtils.infoLog("DeleteDevicePresetRunnable", "presetsInfo: " + paramJSONArray.toString());
    this.mCallbackContext = paramSetAndGetActionCallBack;
    this.mUpNpDeviceList = new UpnpDeviceList(paramContext);
    this.mPresetsInfo = paramJSONArray;
    this.mContext = paramContext;
  }
  
  public void run()
  {
    try
    {
      if (NetworkMode.isLocal())
      {
        this.mUpNpDeviceList.deleteDevicePreset(this.mPresetsInfo, this.mCallbackContext);
        return;
      }
      DeviceListManager.getInstance(this.mContext).deleteDevicePresetCloud(this.mPresetsInfo, this.mCallbackContext);
      return;
    }
    catch (JSONException localJSONException)
    {
      LogUtils.errorLog("DeleteDevicePresetRunnable", "JSONException during delete preset: ", localJSONException);
    }
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/belkin/devices/runnable/DeleteDevicePresetRunnable.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */