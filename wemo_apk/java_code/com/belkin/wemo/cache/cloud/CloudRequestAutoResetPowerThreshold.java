package com.belkin.wemo.cache.cloud;

import com.belkin.wemo.cache.data.DeviceInformation;
import com.belkin.wemo.cache.devicelist.DeviceListManager;
import org.json.JSONObject;

public class CloudRequestAutoResetPowerThreshold
  extends CRSetPowerThreshold
{
  public CloudRequestAutoResetPowerThreshold(DeviceListManager paramDeviceListManager, DeviceInformation paramDeviceInformation, String paramString, JSONObject paramJSONObject)
  {
    super(paramDeviceListManager, paramDeviceInformation, paramString, paramJSONObject);
  }
  
  protected String getDefaultPowerThreshold()
  {
    return "2";
  }
  
  protected String getPowerThresold()
  {
    return "0";
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/belkin/wemo/cache/cloud/CloudRequestAutoResetPowerThreshold.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */