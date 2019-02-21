package com.belkin.rules.utils;

public class ScheduleStringAction
{
  private String schedule;
  private int time;
  
  public ScheduleStringAction(int paramInt, String paramString)
  {
    this.time = paramInt;
    this.schedule = paramString;
  }
  
  public String getSchedule()
  {
    return this.schedule;
  }
  
  public int getTime()
  {
    return this.time;
  }
  
  public void setSchedule(String paramString)
  {
    this.schedule = paramString;
  }
  
  public void setTime(int paramInt)
  {
    this.time = paramInt;
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/belkin/rules/utils/ScheduleStringAction.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */