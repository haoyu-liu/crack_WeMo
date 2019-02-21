package com.belkin.wemo.rules.db.model;

public class RMTSensorNotification
{
  private int NotificationDuration;
  private String NotificationMessage;
  private int NotifyRuleID;
  private int RuleId;
  
  public int getNotificationDuration()
  {
    return this.NotificationDuration;
  }
  
  public String getNotificationMessage()
  {
    return this.NotificationMessage;
  }
  
  public int getNotifyRuleID()
  {
    return this.NotifyRuleID;
  }
  
  public int getRuleId()
  {
    return this.RuleId;
  }
  
  public void setNotificationDuration(int paramInt)
  {
    this.NotificationDuration = paramInt;
  }
  
  public void setNotificationMessage(String paramString)
  {
    this.NotificationMessage = paramString;
  }
  
  public void setNotifyRuleID(int paramInt)
  {
    this.NotifyRuleID = paramInt;
  }
  
  public void setRuleId(int paramInt)
  {
    this.RuleId = paramInt;
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/belkin/wemo/rules/db/model/RMTSensorNotification.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */