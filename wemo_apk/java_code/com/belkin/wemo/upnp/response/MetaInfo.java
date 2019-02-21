package com.belkin.wemo.upnp.response;

public class MetaInfo
{
  private String firmwareVersion;
  private String ssid;
  
  public String getFirmwareVersion()
  {
    return this.firmwareVersion;
  }
  
  public String getSSID()
  {
    return this.ssid;
  }
  
  public void setFirmwareVersion(String paramString)
  {
    this.firmwareVersion = paramString;
  }
  
  public void setSSID(String paramString)
  {
    this.ssid = paramString;
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/belkin/wemo/upnp/response/MetaInfo.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */