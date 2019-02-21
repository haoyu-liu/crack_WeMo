package com.belkin.wemo.cache.utils;

import com.belkin.wemo.cache.data.DeviceInformation;
import com.belkin.wemo.cache.data.ZigBeeDeviceInformation;

public class Converters
{
  public static DeviceInformation convertZigBeeDeviceInformationToDeviceInformation(ZigBeeDeviceInformation paramZigBeeDeviceInformation)
  {
    DeviceInformation localDeviceInformation = new DeviceInformation(paramZigBeeDeviceInformation.getBridgeUDN(), paramZigBeeDeviceInformation.getUniqueID(), paramZigBeeDeviceInformation.getState(), paramZigBeeDeviceInformation.getCapabilities(), paramZigBeeDeviceInformation.getIcon(), paramZigBeeDeviceInformation.getFirmwareVersion(), paramZigBeeDeviceInformation.getModelCode(), paramZigBeeDeviceInformation.getName(), paramZigBeeDeviceInformation.getBridgeUDN());
    localDeviceInformation.setCheckingStatus(paramZigBeeDeviceInformation.getCheckingStatus());
    localDeviceInformation.setDiscoveryState(paramZigBeeDeviceInformation.getDiscoveryState());
    localDeviceInformation.setFriendlyName(paramZigBeeDeviceInformation.getName());
    localDeviceInformation.setInActive(paramZigBeeDeviceInformation.getInactive());
    localDeviceInformation.setIsDiscovered(paramZigBeeDeviceInformation.getIsDiscovered());
    localDeviceInformation.setTimestamp(paramZigBeeDeviceInformation.getTimestamp());
    localDeviceInformation.setWhichFound(paramZigBeeDeviceInformation.getWhichFound());
    localDeviceInformation.setWhichDiscovered(paramZigBeeDeviceInformation.getWhichDiscovered());
    localDeviceInformation.setFoundTime(paramZigBeeDeviceInformation.getFoundTime());
    localDeviceInformation.setLEDGroupID(paramZigBeeDeviceInformation.getGroupId());
    localDeviceInformation.setLEDGroupName(paramZigBeeDeviceInformation.getGroupName());
    return localDeviceInformation;
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/belkin/wemo/cache/utils/Converters.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */