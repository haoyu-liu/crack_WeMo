package com.belkin.devices.runnable;

import android.content.Context;
import com.belkin.cybergarage.wrapper.UpnpDeviceList;
import com.belkin.devices.callback.SetDeviceNameOnLinkCallBack;
import com.belkin.utils.LogUtils;
import com.belkin.wemo.cache.utils.NetworkMode;
import com.belkin.wemo.runnable.WeMoRunnable;
import org.json.JSONArray;
import org.json.JSONException;

public class SetDeviceNameOnLinkRunnable
  extends WeMoRunnable
{
  private static final String TAG = "SetDeviceNameOnLinkRunnable";
  private SetDeviceNameOnLinkCallBack mCallback = null;
  private UpnpDeviceList mUpNpDeviceList = null;
  private JSONArray subDeviceInfo = null;
  
  public SetDeviceNameOnLinkRunnable(JSONArray paramJSONArray, SetDeviceNameOnLinkCallBack paramSetDeviceNameOnLinkCallBack, Context paramContext)
  {
    this.mCallback = paramSetDeviceNameOnLinkCallBack;
    this.subDeviceInfo = paramJSONArray;
    this.mUpNpDeviceList = new UpnpDeviceList(paramContext);
  }
  
  public void run()
  {
    if (NetworkMode.isLocal()) {}
    try
    {
      this.mUpNpDeviceList.setMultipleDeviceName(this.subDeviceInfo, this.mCallback);
      return;
    }
    catch (JSONException localJSONException)
    {
      LogUtils.errorLog("SetDeviceNameOnLinkRunnable", "JSONException in setting mutipleDeviceName: ", localJSONException);
    }
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/belkin/devices/runnable/SetDeviceNameOnLinkRunnable.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */