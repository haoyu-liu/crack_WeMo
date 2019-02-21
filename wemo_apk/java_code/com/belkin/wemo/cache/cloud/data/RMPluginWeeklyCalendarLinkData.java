package com.belkin.wemo.cache.cloud.data;

public class RMPluginWeeklyCalendarLinkData
  extends RMPluginWeeklyCalendarData
{
  private String calendarListData;
  
  public RMPluginWeeklyCalendarLinkData(String paramString1, String paramString2, String paramString3)
  {
    super(paramString1, paramString2);
    this.calendarListData = paramString3;
  }
  
  public String assembleWeeklyCalendarData()
  {
    return "<CalendarList>" + this.calendarListData + "</CalendarList>";
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/belkin/wemo/cache/cloud/data/RMPluginWeeklyCalendarLinkData.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */