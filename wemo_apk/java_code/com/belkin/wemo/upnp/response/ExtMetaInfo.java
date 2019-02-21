package com.belkin.wemo.upnp.response;

public class ExtMetaInfo
{
  private String fwStatus;
  
  public ExtMetaInfo() {}
  
  public ExtMetaInfo(String paramString)
  {
    this.fwStatus = paramString;
  }
  
  public String getFwStatus()
  {
    return this.fwStatus;
  }
  
  public void setFwStatus(String paramString)
  {
    this.fwStatus = paramString;
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/belkin/wemo/upnp/response/ExtMetaInfo.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */