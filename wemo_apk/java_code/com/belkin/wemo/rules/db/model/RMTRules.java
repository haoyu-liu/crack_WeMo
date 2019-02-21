package com.belkin.wemo.rules.db.model;

public class RMTRules
{
  public static final String DEFAULT_END_DATE = "07301982";
  public static final int DEFAULT_RULE_ORDER = 2;
  public static final String DEFAULT_START_DATE = "12201982";
  public static final String DEFAULT_SYNC = "NOSYNC";
  private String EndDate = "07301982";
  private String Name;
  private String RuleId = "";
  private int RuleOrder = 2;
  private String StartDate = "12201982";
  private int State;
  private String Sync = "NOSYNC";
  private String Type;
  
  public String getEndDate()
  {
    return this.EndDate;
  }
  
  public String getName()
  {
    return this.Name;
  }
  
  public String getRuleId()
  {
    return this.RuleId;
  }
  
  public int getRuleOrder()
  {
    return this.RuleOrder;
  }
  
  public String getStartDate()
  {
    return this.StartDate;
  }
  
  public int getState()
  {
    return this.State;
  }
  
  public String getSync()
  {
    return this.Sync;
  }
  
  public String getType()
  {
    return this.Type;
  }
  
  public void setEndDate(String paramString)
  {
    this.EndDate = paramString;
  }
  
  public void setName(String paramString)
  {
    this.Name = paramString;
  }
  
  public void setRuleId(String paramString)
  {
    this.RuleId = paramString;
  }
  
  public void setRuleOrder(int paramInt)
  {
    this.RuleOrder = paramInt;
  }
  
  public void setStartDate(String paramString)
  {
    this.StartDate = paramString;
  }
  
  public void setState(int paramInt)
  {
    this.State = paramInt;
  }
  
  public void setSync(String paramString)
  {
    this.Sync = paramString;
  }
  
  public void setType(String paramString)
  {
    this.Type = paramString;
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/belkin/wemo/rules/db/model/RMTRules.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */