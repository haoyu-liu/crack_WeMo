package com.belkin.devices.runnable;

import android.content.Context;
import android.text.TextUtils;
import com.belkin.cybergarage.wrapper.UpnpDeviceList;
import com.belkin.devices.callback.GetDataStoreOnLinkCallBack;
import com.belkin.utils.LogUtils;
import com.belkin.wemo.cache.devicelist.DeviceListManager;
import com.belkin.wemo.cache.utils.NetworkMode;
import com.belkin.wemo.runnable.WeMoRunnable;

public class GetDataStoreRunnable
  extends WeMoRunnable
{
  private static final String TAG = "GetDataStoreRunnable";
  private String bridgeUDN = "";
  private GetDataStoreOnLinkCallBack mCallback = null;
  private Context mContext = null;
  private UpnpDeviceList mUpNpDeviceList = null;
  
  public GetDataStoreRunnable(String paramString, GetDataStoreOnLinkCallBack paramGetDataStoreOnLinkCallBack, Context paramContext)
  {
    this.mCallback = paramGetDataStoreOnLinkCallBack;
    if (NetworkMode.isLocal()) {
      this.mUpNpDeviceList = new UpnpDeviceList(paramContext);
    }
    this.bridgeUDN = paramString;
    this.mContext = paramContext;
  }
  
  public void run()
  {
    LogUtils.infoLog("GetDataStoreRunnable", "Local Mode: " + NetworkMode.isLocal());
    if (NetworkMode.isLocal())
    {
      this.mUpNpDeviceList.getEmergencyContacts(this.mCallback);
      return;
    }
    if (!TextUtils.isEmpty(this.bridgeUDN))
    {
      if (this.mContext != null)
      {
        DeviceListManager.getInstance(this.mContext).getDataStoreFromCloud(this.mCallback, this.bridgeUDN);
        return;
      }
      this.mCallback.onSuccess(null);
      return;
    }
    LogUtils.infoLog("GetDataStoreRunnable", "bridge UDN is null");
    this.mCallback.onError();
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/belkin/devices/runnable/GetDataStoreRunnable.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */