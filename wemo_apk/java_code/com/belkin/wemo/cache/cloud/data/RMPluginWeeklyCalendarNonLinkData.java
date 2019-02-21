package com.belkin.wemo.cache.cloud.data;

public class RMPluginWeeklyCalendarNonLinkData
  extends RMPluginWeeklyCalendarData
{
  private String friday;
  private String monday;
  private String saturday;
  private String sunday;
  private String thursday;
  private String tuesday;
  private String wednesday;
  
  public RMPluginWeeklyCalendarNonLinkData(String paramString1, String paramString2, String paramString3, String paramString4, String paramString5, String paramString6, String paramString7, String paramString8, String paramString9)
  {
    super(paramString1, paramString2);
    this.monday = paramString3;
    this.tuesday = paramString4;
    this.wednesday = paramString5;
    this.thursday = paramString6;
    this.friday = paramString7;
    this.saturday = paramString8;
    this.sunday = paramString9;
  }
  
  public String assembleWeeklyCalendarData()
  {
    return "<mon>" + this.monday + "</mon>" + "<tues>" + this.tuesday + "</tues>" + "<wed>" + this.wednesday + "</wed>" + "<thur>" + this.thursday + "</thur>" + "<fri>" + this.friday + "</fri>" + "<sat>" + this.saturday + "</sat>" + "<sun>" + this.sunday + "</sun>";
  }
  
  public String getFriday()
  {
    return this.friday;
  }
  
  public String getMonday()
  {
    return this.monday;
  }
  
  public String getSaturday()
  {
    return this.saturday;
  }
  
  public String getSunday()
  {
    return this.sunday;
  }
  
  public String getThursday()
  {
    return this.thursday;
  }
  
  public String getTuesday()
  {
    return this.tuesday;
  }
  
  public String getWednesday()
  {
    return this.wednesday;
  }
  
  public void setFriday(String paramString)
  {
    this.friday = paramString;
  }
  
  public void setMonday(String paramString)
  {
    this.monday = paramString;
  }
  
  public void setSaturday(String paramString)
  {
    this.saturday = paramString;
  }
  
  public void setSunday(String paramString)
  {
    this.sunday = paramString;
  }
  
  public void setThursday(String paramString)
  {
    this.thursday = paramString;
  }
  
  public void setTuesday(String paramString)
  {
    this.tuesday = paramString;
  }
  
  public void setWednesday(String paramString)
  {
    this.wednesday = paramString;
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/belkin/wemo/cache/cloud/data/RMPluginWeeklyCalendarNonLinkData.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */