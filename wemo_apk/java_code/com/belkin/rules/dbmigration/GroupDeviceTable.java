package com.belkin.rules.dbmigration;

public final class GroupDeviceTable
{
  private int deviceCombinationPK;
  private String deviceId = "";
  private int groupId;
  
  public int getDeviceCombinationPK()
  {
    return this.deviceCombinationPK;
  }
  
  public String getDeviceId()
  {
    return this.deviceId;
  }
  
  public int getGroupId()
  {
    return this.groupId;
  }
  
  public void setDeviceCombinationPK(int paramInt)
  {
    this.deviceCombinationPK = paramInt;
  }
  
  public void setDeviceId(String paramString)
  {
    this.deviceId = paramString;
  }
  
  public void setGroupId(int paramInt)
  {
    this.groupId = paramInt;
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/belkin/rules/dbmigration/GroupDeviceTable.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */