package com.belkin.wemo.cache.zigbee;

import com.belkin.wemo.cache.devicelist.UpnpConstants;
import com.belkin.wemo.cache.utils.SDKLogUtils;
import java.util.ArrayList;
import org.cybergarage.upnp.Action;
import org.cybergarage.upnp.ControlPoint;
import org.cybergarage.upnp.Device;

public class ZigBeeBridgeScanner
{
  ControlPoint controlPoint;
  
  public ZigBeeBridgeScanner(ControlPoint paramControlPoint)
  {
    this.controlPoint = paramControlPoint;
  }
  
  private boolean setArgument(Action paramAction, String[] paramArrayOfString1, String[] paramArrayOfString2)
  {
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
  
  public ArrayList<ZigBeeDevice> getZigBeeDevicesFromBridge(String paramString)
  {
    SDKLogUtils.infoLog("ZigbeeScan", "in getZigBeeDevicesFromBridge");
    try
    {
      Device localDevice = this.controlPoint.getDevice(paramString);
      if (localDevice != null)
      {
        Action localAction = localDevice.getAction("GetEndDevices");
        String[] arrayOfString1 = UpnpConstants.GET_END_DEVICES_ARGS;
        String[] arrayOfString2 = new String[2];
        arrayOfString2[0] = paramString;
        arrayOfString2[1] = String.valueOf(getEndList.PAIRED_LIST);
        setArgument(localAction, arrayOfString1, arrayOfString2);
        String str = localAction.postControlAction();
        if (str != null)
        {
          SDKLogUtils.infoLog("ZigbeeScan", "responseString:" + str);
          ArrayList localArrayList = new GetEndDeviceListResponse().parseForGetEndDeviceList(str);
          return localArrayList;
        }
      }
    }
    catch (Exception localException)
    {
      localException.printStackTrace();
    }
    return null;
  }
  
  private static enum getEndList
  {
    static
    {
      ALL_LIST = new getEndList("ALL_LIST", 1);
      PAIRED_LIST = new getEndList("PAIRED_LIST", 2);
      UNPAIRED_LIST = new getEndList("UNPAIRED_LIST", 3);
      getEndList[] arrayOfgetEndList = new getEndList[4];
      arrayOfgetEndList[0] = SCAN_LIST;
      arrayOfgetEndList[1] = ALL_LIST;
      arrayOfgetEndList[2] = PAIRED_LIST;
      arrayOfgetEndList[3] = UNPAIRED_LIST;
      $VALUES = arrayOfgetEndList;
    }
    
    private getEndList() {}
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/belkin/wemo/cache/zigbee/ZigBeeBridgeScanner.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */