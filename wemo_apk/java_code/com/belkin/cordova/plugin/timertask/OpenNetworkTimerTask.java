package com.belkin.cordova.plugin.timertask;

import com.belkin.cybergarage.wrapper.UpnpDeviceList;
import com.belkin.utils.LogUtils;
import java.util.TimerTask;
import org.json.JSONException;

public class OpenNetworkTimerTask
  extends TimerTask
{
  private final String TAG;
  private UpnpDeviceList upnpDeiceList;
  
  public OpenNetworkTimerTask(UpnpDeviceList paramUpnpDeviceList)
  {
    this.upnpDeiceList = paramUpnpDeviceList;
    this.TAG = OpenNetworkTimerTask.class.getSimpleName();
  }
  
  public void run()
  {
    try
    {
      LogUtils.debugLog(this.TAG, "OPEN_NETWORK call issued to Bridge.");
      this.upnpDeiceList.openBridgeNetwork();
      return;
    }
    catch (JSONException localJSONException)
    {
      LogUtils.errorLog(this.TAG, "JSONException in openBridgeNetwork(): ", localJSONException);
    }
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/belkin/cordova/plugin/timertask/OpenNetworkTimerTask.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */