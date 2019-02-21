package com.belkin.wemo.upnp.response;

public class SetBulbTypeResponse
  extends RMBaseUpnpResponse
{
  private String maxLevel;
  private String minLevel;
  private String turnOnLevel;
  
  public String getMaxLevel()
  {
    if (this.maxLevel == null) {
      this.maxLevel = "";
    }
    return this.maxLevel;
  }
  
  public String getMinLevel()
  {
    if (this.minLevel == null) {
      this.minLevel = "";
    }
    return this.minLevel;
  }
  
  public String getTurnOnLevel()
  {
    if (this.turnOnLevel == null) {
      this.turnOnLevel = "";
    }
    return this.turnOnLevel;
  }
  
  public void setMaxLevel(String paramString)
  {
    this.maxLevel = paramString;
  }
  
  public void setMinLevel(String paramString)
  {
    this.minLevel = paramString;
  }
  
  public void setTurnOnLevel(String paramString)
  {
    this.turnOnLevel = paramString;
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/belkin/wemo/upnp/response/SetBulbTypeResponse.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */