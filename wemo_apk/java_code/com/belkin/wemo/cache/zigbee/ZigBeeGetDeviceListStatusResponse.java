package com.belkin.wemo.cache.zigbee;

public class ZigBeeGetDeviceListStatusResponse
{
  private static final String NO = "NO";
  private String Avability;
  private String DeviceIDLED;
  private String capabilityid;
  private String capabilityvalue;
  private String isGroupAction;
  private int lastEventTimeStamp = -1;
  
  public String getAvability()
  {
    return this.Avability;
  }
  
  public String getCapabilityid()
  {
    return this.capabilityid;
  }
  
  public String getCapabilityvalue()
  {
    return this.capabilityvalue;
  }
  
  public String getDeviceIDLED()
  {
    return this.DeviceIDLED;
  }
  
  public String getIsGroupAction()
  {
    return this.isGroupAction;
  }
  
  public int getLastEventTimeStamp()
  {
    return this.lastEventTimeStamp;
  }
  
  public boolean isAvailable()
  {
    return !getAvability().equals("NO");
  }
  
  public void setAvability(String paramString)
  {
    this.Avability = paramString;
  }
  
  public void setCapabilityid(String paramString)
  {
    this.capabilityid = paramString;
  }
  
  public void setCapabilityvalue(String paramString)
  {
    this.capabilityvalue = paramString;
  }
  
  public void setDeviceIDLED(String paramString)
  {
    this.DeviceIDLED = paramString;
  }
  
  public void setIsGroupAction(String paramString)
  {
    this.isGroupAction = paramString;
  }
  
  public void setLastEventTimeStamp(int paramInt)
  {
    this.lastEventTimeStamp = paramInt;
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/belkin/wemo/cache/zigbee/ZigBeeGetDeviceListStatusResponse.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */