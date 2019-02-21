package com.belkin.beans;

public class FirmwareVersionResponseBean
{
  private String firmwareVersion;
  private String skuNumber;
  
  public String getFirmwareVersion()
  {
    return this.firmwareVersion;
  }
  
  public String getSkuNumber()
  {
    return this.skuNumber;
  }
  
  public void setFirmwareVersion(String paramString)
  {
    this.firmwareVersion = paramString;
  }
  
  public void setSkuNumber(String paramString)
  {
    this.skuNumber = paramString;
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/belkin/beans/FirmwareVersionResponseBean.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */