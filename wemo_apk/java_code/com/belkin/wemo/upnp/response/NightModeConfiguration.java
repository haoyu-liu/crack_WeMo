package com.belkin.wemo.upnp.response;

public class NightModeConfiguration
{
  private String endTime;
  private String nightMode;
  private String nightModeBrightness;
  private String startTime;
  
  public NightModeConfiguration() {}
  
  NightModeConfiguration(String paramString1, String paramString2, String paramString3, String paramString4)
  {
    setNightMode(paramString1);
    setNightModeBrightness(paramString2);
    setStartTime(paramString3);
    setEndTime(paramString4);
  }
  
  public String getEndTime()
  {
    return this.endTime;
  }
  
  public String getNightMode()
  {
    return this.nightMode;
  }
  
  public String getNightModeBrightness()
  {
    return this.nightModeBrightness;
  }
  
  public String getStartTime()
  {
    return this.startTime;
  }
  
  public void setEndTime(String paramString)
  {
    if (paramString == null) {
      paramString = "";
    }
    this.endTime = paramString;
  }
  
  public void setNightMode(String paramString)
  {
    if (paramString == null) {
      paramString = "";
    }
    this.nightMode = paramString;
  }
  
  public void setNightModeBrightness(String paramString)
  {
    if (paramString == null) {
      paramString = "";
    }
    this.nightModeBrightness = paramString;
  }
  
  public void setStartTime(String paramString)
  {
    if (paramString == null) {
      paramString = "";
    }
    this.startTime = paramString;
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/belkin/wemo/upnp/response/NightModeConfiguration.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */