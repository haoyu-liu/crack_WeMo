package com.belkin.rules.dbmigration;

import android.util.Log;

public final class DeviceCombinationTable
{
  private int deviceCombinationPK;
  private int deviceGroupId = 0;
  private String deviceId;
  private int ruleId;
  private int sensorGroupId = 0;
  private String sensorId = "";
  
  public int getDeviceCombinationPK()
  {
    return this.deviceCombinationPK;
  }
  
  public int getDeviceGroupId()
  {
    return this.deviceGroupId;
  }
  
  public String getDeviceId()
  {
    return this.deviceId;
  }
  
  public int getRuleId()
  {
    return this.ruleId;
  }
  
  public int getSensorGroupId()
  {
    return this.sensorGroupId;
  }
  
  public String getSensorId()
  {
    return this.sensorId;
  }
  
  public void setDeviceCombinationPK(int paramInt)
  {
    this.deviceCombinationPK = paramInt;
  }
  
  public void setDeviceGroupId(int paramInt)
  {
    this.deviceGroupId = paramInt;
  }
  
  public void setDeviceId(String paramString)
  {
    this.deviceId = paramString;
  }
  
  public void setRuleId(int paramInt)
  {
    this.ruleId = paramInt;
  }
  
  public void setSensorGroupId(int paramInt)
  {
    this.sensorGroupId = paramInt;
  }
  
  public void setSensorId(String paramString)
  {
    this.sensorId = paramString;
  }
  
  public String toString()
  {
    Log.e("DEVICE COMBINATION TABLE ", this.ruleId + " : " + this.deviceId + " : " + this.deviceCombinationPK + " : " + this.deviceGroupId);
    return super.toString();
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/belkin/rules/dbmigration/DeviceCombinationTable.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */