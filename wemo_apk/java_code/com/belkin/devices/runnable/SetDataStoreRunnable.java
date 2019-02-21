package com.belkin.devices.runnable;

import android.content.Context;
import android.text.TextUtils;
import com.belkin.cybergarage.wrapper.UpnpDeviceList;
import com.belkin.devices.callback.SetDataStoreOnLinkCallBack;
import com.belkin.utils.LogUtils;
import com.belkin.wemo.cache.devicelist.DeviceListManager;
import com.belkin.wemo.cache.utils.NetworkMode;
import com.belkin.wemo.runnable.WeMoRunnable;

public class SetDataStoreRunnable
  extends WeMoRunnable
{
  private static final String TAG = "SetDataStoreRunnable";
  private String mBridgeUDN = "";
  private SetDataStoreOnLinkCallBack mCallback = null;
  private Context mContext;
  private String mEmergencyContacts = null;
  private UpnpDeviceList mUpNpDeviceList = null;
  
  public SetDataStoreRunnable(String paramString1, SetDataStoreOnLinkCallBack paramSetDataStoreOnLinkCallBack, Context paramContext, String paramString2)
  {
    this.mCallback = paramSetDataStoreOnLinkCallBack;
    if (NetworkMode.isLocal()) {
      this.mUpNpDeviceList = new UpnpDeviceList(paramContext);
    }
    this.mEmergencyContacts = paramString2;
    this.mBridgeUDN = paramString1;
    this.mContext = paramContext;
  }
  
  public void run()
  {
    if (NetworkMode.isLocal())
    {
      this.mUpNpDeviceList.setEmergencyContacts(this.mEmergencyContacts, this.mCallback);
      return;
    }
    if (!TextUtils.isEmpty(this.mBridgeUDN))
    {
      if (this.mContext != null)
      {
        DeviceListManager.getInstance(this.mContext).setDataStoreOnCloud(this.mCallback, this.mBridgeUDN, this.mEmergencyContacts);
        return;
      }
      this.mCallback.onSuccess(null);
      return;
    }
    LogUtils.infoLog("SetDataStoreRunnable", "Bridge Udn is empty or null");
    this.mCallback.onError();
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/belkin/devices/runnable/SetDataStoreRunnable.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */