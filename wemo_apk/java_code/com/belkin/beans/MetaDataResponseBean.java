package com.belkin.beans;

public class MetaDataResponseBean
{
  String[] arrstrMetaData = null;
  public String strAPSSID = null;
  public String strDeviceType = null;
  public String strFirmwareVersion = null;
  public String strMacAddress = null;
  String strMetaData = null;
  public String strSerialNumber = null;
  public String strSkuNo = null;
  
  private void init()
  {
    this.arrstrMetaData = this.strMetaData.split("\\|");
    if (this.arrstrMetaData.length == 6)
    {
      this.strMacAddress = this.arrstrMetaData[0].replace("MAC:", "");
      this.strSerialNumber = this.arrstrMetaData[1].replace("SerialNo:", "").trim();
      this.strSkuNo = this.arrstrMetaData[2].replace("SkuNo:", "").trim();
      this.strFirmwareVersion = this.arrstrMetaData[3].replace("FirmwareVersion:", "").trim();
      this.strAPSSID = this.arrstrMetaData[4].replace("APSSID:", "").trim();
      this.strDeviceType = this.arrstrMetaData[5].replace("DeviceType:", "").trim();
    }
  }
  
  public String getMetadata()
  {
    return this.strMetaData;
  }
  
  public void setMetadata(String paramString)
  {
    this.strMetaData = paramString;
    if (this.strMetaData != null) {
      init();
    }
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/belkin/beans/MetaDataResponseBean.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */