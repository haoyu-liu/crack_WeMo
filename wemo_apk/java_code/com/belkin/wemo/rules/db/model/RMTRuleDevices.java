package com.belkin.wemo.rules.db.model;

public class RMTRuleDevices
{
  public static final int DEFAULT_LEVEL = -1;
  public static final String DEFAULT_PRODUCT_NAME = "";
  public static final int DEFAULT_TYPE = -1;
  public static final int DEFAULT_VALUE = -1;
  public static final String DEFAULT_ZB_CAPABILITY_END = "";
  public static final String DEFAULT_ZB_CAPABILITY_START = "";
  private int CountdownTime = -1;
  private int DayID;
  private String DeviceID;
  private float EndAction;
  private int EndTime = -1;
  private int GroupID;
  private int Level;
  private int OffModeOffset;
  private int OnModeOffset;
  private int RuleDuration;
  private int RuleID;
  private int SensorDuration;
  private float StartAction;
  private int StartTime;
  private int Type;
  private int Value;
  private String ZBCapabilityEnd;
  private String ZBCapabilityStart;
  
  public RMTRuleDevices()
  {
    initToDefault();
  }
  
  private void initToDefault()
  {
    this.Type = -1;
    this.Value = -1;
    this.Level = -1;
    this.ZBCapabilityEnd = "";
    this.ZBCapabilityStart = "";
    this.StartAction = -1.0F;
    this.EndAction = -1.0F;
    this.SensorDuration = -1;
    this.StartTime = -1;
    this.EndTime = -1;
    this.RuleDuration = -1;
  }
  
  public int getCountdownTime()
  {
    return this.CountdownTime;
  }
  
  public int getDayID()
  {
    return this.DayID;
  }
  
  public String getDeviceID()
  {
    return this.DeviceID;
  }
  
  public float getEndAction()
  {
    return this.EndAction;
  }
  
  public int getEndTime()
  {
    return this.EndTime;
  }
  
  public int getGroupID()
  {
    return this.GroupID;
  }
  
  public int getLevel()
  {
    return this.Level;
  }
  
  public int getOffModeOffset()
  {
    return this.OffModeOffset;
  }
  
  public int getOnModeOffset()
  {
    return this.OnModeOffset;
  }
  
  public int getRuleDuration()
  {
    return this.RuleDuration;
  }
  
  public int getRuleID()
  {
    return this.RuleID;
  }
  
  public int getSensorDuration()
  {
    return this.SensorDuration;
  }
  
  public float getStartAction()
  {
    return this.StartAction;
  }
  
  public int getStartTime()
  {
    return this.StartTime;
  }
  
  public int getType()
  {
    return this.Type;
  }
  
  public int getValue()
  {
    return this.Value;
  }
  
  public String getZBCapabilityEnd()
  {
    return this.ZBCapabilityEnd;
  }
  
  public String getZBCapabilityStart()
  {
    return this.ZBCapabilityStart;
  }
  
  public void setCountdownTime(int paramInt)
  {
    this.CountdownTime = paramInt;
  }
  
  public void setDayID(int paramInt)
  {
    this.DayID = paramInt;
  }
  
  public void setDeviceID(String paramString)
  {
    this.DeviceID = paramString;
  }
  
  public void setEndAction(float paramFloat)
  {
    this.EndAction = paramFloat;
  }
  
  public void setEndTime(int paramInt)
  {
    this.EndTime = paramInt;
  }
  
  public void setGroupID(int paramInt)
  {
    this.GroupID = paramInt;
  }
  
  public void setLevel(int paramInt)
  {
    this.Level = paramInt;
  }
  
  public void setOffModeOffset(int paramInt)
  {
    this.OffModeOffset = paramInt;
  }
  
  public void setOnModeOffset(int paramInt)
  {
    this.OnModeOffset = paramInt;
  }
  
  public void setRuleDuration(int paramInt)
  {
    this.RuleDuration = paramInt;
  }
  
  public void setRuleID(int paramInt)
  {
    this.RuleID = paramInt;
  }
  
  public void setSensorDuration(int paramInt)
  {
    this.SensorDuration = paramInt;
  }
  
  public void setStartAction(float paramFloat)
  {
    this.StartAction = paramFloat;
  }
  
  public void setStartTime(int paramInt)
  {
    this.StartTime = paramInt;
  }
  
  public void setType(int paramInt)
  {
    this.Type = paramInt;
  }
  
  public void setValue(int paramInt)
  {
    this.Value = paramInt;
  }
  
  public void setZBCapabilityEnd(String paramString)
  {
    this.ZBCapabilityEnd = paramString;
  }
  
  public void setZBCapabilityStart(String paramString)
  {
    this.ZBCapabilityStart = paramString;
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/belkin/wemo/rules/db/model/RMTRuleDevices.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */