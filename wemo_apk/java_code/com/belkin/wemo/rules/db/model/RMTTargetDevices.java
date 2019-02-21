package com.belkin.wemo.rules.db.model;

public class RMTTargetDevices
{
  private String DeviceID;
  private int DeviceIndex;
  private int RuleId;
  
  public String getDeviceID()
  {
    return this.DeviceID;
  }
  
  public int getDeviceIndex()
  {
    return this.DeviceIndex;
  }
  
  public int getRuleId()
  {
    return this.RuleId;
  }
  
  public void setDeviceID(String paramString)
  {
    this.DeviceID = paramString;
  }
  
  public void setDeviceIndex(int paramInt)
  {
    this.DeviceIndex = paramInt;
  }
  
  public void setRuleId(int paramInt)
  {
    this.RuleId = paramInt;
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/belkin/wemo/rules/db/model/RMTTargetDevices.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */