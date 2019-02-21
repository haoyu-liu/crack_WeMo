package com.belkin.wemo.cache.cloud.data;

public abstract class RMPluginWeeklyCalendarData
{
  protected String mac;
  protected String pluginId;
  
  public RMPluginWeeklyCalendarData(String paramString1, String paramString2)
  {
    this.pluginId = paramString1;
    this.mac = paramString2;
  }
  
  public abstract String assembleWeeklyCalendarData();
  
  public String getMac()
  {
    return this.mac;
  }
  
  public String getPluginId()
  {
    return this.pluginId;
  }
  
  public void setMac(String paramString)
  {
    this.mac = paramString;
  }
  
  public void setPluginId(String paramString)
  {
    this.pluginId = paramString;
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/belkin/wemo/cache/cloud/data/RMPluginWeeklyCalendarData.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */