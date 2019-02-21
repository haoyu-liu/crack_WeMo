package com.belkin.rules.dbmigration;

import android.util.Log;

public final class RulesTable
{
  private String endDate = "12201982";
  private String name = "";
  private int ruleId;
  private int ruleOrder = 2;
  private String startDate = "12201982";
  private String state = "";
  private String sync = "NOSYNC";
  private String type = "";
  
  public String getEndDate()
  {
    return this.endDate;
  }
  
  public String getName()
  {
    return this.name;
  }
  
  public int getRuleId()
  {
    return this.ruleId;
  }
  
  public int getRuleOrder()
  {
    return this.ruleOrder;
  }
  
  public String getStartDate()
  {
    return this.startDate;
  }
  
  public String getState()
  {
    return this.state;
  }
  
  public String getSync()
  {
    return this.sync;
  }
  
  public String getType()
  {
    return this.type;
  }
  
  public void setEndDate(String paramString)
  {
    this.endDate = paramString;
  }
  
  public void setName(String paramString)
  {
    this.name = paramString;
  }
  
  public void setRuleId(int paramInt)
  {
    this.ruleId = paramInt;
  }
  
  public void setRuleOrder(int paramInt)
  {
    this.ruleOrder = paramInt;
  }
  
  public void setStartDate(String paramString)
  {
    this.startDate = paramString;
  }
  
  public void setState(String paramString)
  {
    this.state = paramString;
  }
  
  public void setSync(String paramString)
  {
    this.sync = paramString;
  }
  
  public void setType(String paramString)
  {
    this.type = paramString;
  }
  
  public String toString()
  {
    Log.e("RULE TABLE", this.ruleId + " - " + this.name + " - " + this.type + " - " + this.ruleOrder + " - " + this.startDate + " - " + this.endDate + " - " + this.state + " - " + this.sync);
    return super.toString();
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/belkin/rules/dbmigration/RulesTable.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */