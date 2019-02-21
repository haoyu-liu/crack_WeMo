package com.belkin.wemo.cache.zigbee;

import com.belkin.wemo.cache.devicelist.DeviceListManager;
import com.belkin.wemo.cache.devicelist.UpnpConstants;
import com.belkin.wemo.cache.utils.SDKLogUtils;
import java.util.ArrayList;
import org.cybergarage.upnp.Action;
import org.cybergarage.upnp.ControlPoint;
import org.cybergarage.upnp.Device;

public class ZigBeeGetDeviceStatus
{
  private DeviceListManager deviceListManager;
  
  public ZigBeeGetDeviceStatus(DeviceListManager paramDeviceListManager)
  {
    this.deviceListManager = paramDeviceListManager;
  }
  
  private boolean setArgument(Action paramAction, String[] paramArrayOfString1, String[] paramArrayOfString2)
  {
    SDKLogUtils.infoLog("ZigbeeScan", "keyList size:" + paramArrayOfString1.length);
    int i;
    if ((paramArrayOfString2 != null) && (paramArrayOfString1 != null)) {
      i = 0;
    }
    while (i < paramArrayOfString1.length)
    {
      paramAction.setArgumentValue(paramArrayOfString1[i], paramArrayOfString2[i]);
      i++;
      continue;
      return false;
    }
    return true;
  }
  
  public ArrayList<ZigBeeGetDeviceListStatusResponse> getZigBeeDevicesFromBridge(String paramString1, String paramString2)
  {
    SDKLogUtils.infoLog("ZigbeeScan", "in getZigBeeDevicesFromBridge:" + paramString2);
    Object localObject = new ArrayList();
    try
    {
      if (this.deviceListManager != null)
      {
        Device localDevice = this.deviceListManager.getUpnpControl().getDevice(paramString1);
        if (localDevice != null)
        {
          Action localAction = localDevice.getAction("GetDeviceStatus");
          setArgument(localAction, UpnpConstants.ARGS_DEVICEIDS, new String[] { paramString2 });
          String str = localAction.postControlAction();
          SDKLogUtils.infoLog("ZigbeeScan", "action response" + str);
          if (str != null)
          {
            ArrayList localArrayList = new GetDeviceListStatusResponse().parseForDeviceListStatus(str);
            localObject = localArrayList;
          }
        }
      }
      return (ArrayList<ZigBeeGetDeviceListStatusResponse>)localObject;
    }
    catch (Exception localException)
    {
      localException.printStackTrace();
    }
    return (ArrayList<ZigBeeGetDeviceListStatusResponse>)localObject;
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/belkin/wemo/cache/zigbee/ZigBeeGetDeviceStatus.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */