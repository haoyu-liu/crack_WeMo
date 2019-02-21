package com.belkin.wemo.cache.zigbee;

import java.util.ArrayList;

public class ZigBeeDevice
{
  private String capabilityID;
  private String currentState;
  private String deviceFriendlyName;
  private String deviceId;
  private String deviceIdAvailablity;
  private String deviceIndex;
  private String deviceListType;
  private String discoveryState = "";
  private String firmwareVersion;
  private String groupCapabilities;
  private String groupCapabilityID;
  private String groupID;
  private String groupName;
  private String iconVersion;
  public ArrayList<ZigBeeDevice> mGrpLEDs = null;
  private String manufacturerName;
  private String modelCode;
  private String wemoCertified;
  
  public void addLEDInGrp(ZigBeeDevice paramZigBeeDevice)
  {
    if (this.mGrpLEDs == null) {
      this.mGrpLEDs = new ArrayList();
    }
    this.mGrpLEDs.add(paramZigBeeDevice);
  }
  
  public String getCapabilityID()
  {
    return this.capabilityID;
  }
  
  public String getCurrentState()
  {
    return this.currentState;
  }
  
  public String getDeviceFriendlyName()
  {
    return this.deviceFriendlyName;
  }
  
  public String getDeviceId()
  {
    return this.deviceId;
  }
  
  public String getDeviceIdAvailablity()
  {
    return this.deviceIdAvailablity;
  }
  
  public String getDeviceIndex()
  {
    return this.deviceIndex;
  }
  
  public String getDeviceListType()
  {
    return this.deviceListType;
  }
  
  public String getDiscoveryState()
  {
    return this.discoveryState;
  }
  
  public String getFirmwareVersion()
  {
    return this.firmwareVersion;
  }
  
  public String getGroupCapabilities()
  {
    return this.groupCapabilities;
  }
  
  public String getGroupCapabilityID()
  {
    return this.groupCapabilityID;
  }
  
  public String getGroupID()
  {
    return this.groupID;
  }
  
  public String getGroupName()
  {
    return this.groupName;
  }
  
  public String getIconVersion()
  {
    return this.iconVersion;
  }
  
  public ArrayList<ZigBeeDevice> getLedGrpDevices()
  {
    return this.mGrpLEDs;
  }
  
  public String getManufacturerName()
  {
    return this.manufacturerName;
  }
  
  public String getModelCode()
  {
    if (this.modelCode == null) {
      return "";
    }
    return this.modelCode;
  }
  
  public String getWemoCertified()
  {
    return this.wemoCertified;
  }
  
  public boolean isGroupLed()
  {
    return (this.mGrpLEDs != null) && (this.mGrpLEDs.size() > 0);
  }
  
  public void setCapabilityID(String paramString)
  {
    this.capabilityID = paramString;
  }
  
  public void setCurrentState(String paramString)
  {
    this.currentState = paramString;
  }
  
  public void setDeviceFriendlyName(String paramString)
  {
    this.deviceFriendlyName = paramString;
  }
  
  public void setDeviceId(String paramString)
  {
    this.deviceId = paramString;
  }
  
  public void setDeviceIdAvailablity(String paramString)
  {
    this.deviceIdAvailablity = paramString;
  }
  
  public void setDeviceIndex(String paramString)
  {
    this.deviceIndex = paramString;
  }
  
  public void setDeviceListType(String paramString)
  {
    this.deviceListType = paramString;
  }
  
  public void setDiscoveryState(String paramString)
  {
    this.discoveryState = paramString;
  }
  
  public void setFirmwareVersion(String paramString)
  {
    this.firmwareVersion = paramString;
  }
  
  public void setGroupCapabilities(String paramString)
  {
    this.groupCapabilities = paramString;
  }
  
  public void setGroupCapabilityID(String paramString)
  {
    this.groupCapabilityID = paramString;
  }
  
  public void setGroupID(String paramString)
  {
    this.groupID = paramString;
  }
  
  public void setGroupName(String paramString)
  {
    this.groupName = paramString;
  }
  
  public void setIconVersion(String paramString)
  {
    this.iconVersion = paramString;
  }
  
  public void setManufacturerName(String paramString)
  {
    this.manufacturerName = paramString;
  }
  
  public void setModelCode(String paramString)
  {
    this.modelCode = paramString;
  }
  
  public void setWemoCertified(String paramString)
  {
    this.wemoCertified = paramString;
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/belkin/wemo/cache/zigbee/ZigBeeDevice.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */