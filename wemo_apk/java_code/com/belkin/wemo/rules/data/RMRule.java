package com.belkin.wemo.rules.data;

import org.json.JSONException;
import org.json.JSONObject;

public abstract class RMRule
{
  public static final String DB_RULE_TYPE = "DB_RULE_TYPE";
  public static final String DISPLAY_NAME = "DISPLAY_NAME";
  public static final int RULES_TYPE_COUNT = 2;
  public static final int RULES_TYPE_DB = 2;
  public static final int RULES_TYPE_TNG = 1;
  public static final int RULE_DISABLED = 0;
  public static final int RULE_ENABLED = 1;
  public static final String RULE_ID = "RULE_ID";
  public static final String RULE_TYPE = "RULE_TYPE";
  public static final String START_RULE_CODE = "START_RULE_CODE";
  public static final String STATE = "STATE";
  private String displayName;
  public boolean isDelete = false;
  private int ruleId = -1;
  private int rulesType = 2;
  private int state;
  
  public RMRule()
  {
    this.displayName = "";
    this.rulesType = assignRuleType();
  }
  
  public RMRule(int paramInt1, int paramInt2, String paramString, int paramInt3)
  {
    this.ruleId = paramInt1;
    this.rulesType = paramInt2;
    this.displayName = paramString;
    this.state = paramInt3;
  }
  
  public static int getRulesTypeDb()
  {
    return 2;
  }
  
  public static int getRulesTypeTng()
  {
    return 1;
  }
  
  protected abstract int assignRuleType();
  
  public boolean equals(Object paramObject)
  {
    if (this == paramObject) {}
    RMRule localRMRule;
    do
    {
      return true;
      if (paramObject == null) {
        return false;
      }
      if (getClass() != paramObject.getClass()) {
        return false;
      }
      localRMRule = (RMRule)paramObject;
      if (localRMRule.state == 0) {
        return false;
      }
    } while (this.rulesType == localRMRule.rulesType);
    return false;
  }
  
  public String getDisplayName()
  {
    return this.displayName;
  }
  
  public int getRuleId()
  {
    return this.ruleId;
  }
  
  public int getRulesType()
  {
    return this.rulesType;
  }
  
  public int getState()
  {
    return this.state;
  }
  
  public int hashCode()
  {
    return 31 * (31 + this.ruleId) + this.rulesType;
  }
  
  public void setDisplayName(String paramString)
  {
    if (paramString == null)
    {
      this.displayName = "";
      return;
    }
    this.displayName = paramString;
  }
  
  public void setRuleId(int paramInt)
  {
    this.ruleId = paramInt;
  }
  
  public void setRulesType(int paramInt)
  {
    this.rulesType = paramInt;
  }
  
  public void setState(int paramInt)
  {
    this.state = paramInt;
  }
  
  public JSONObject toJSON(JSONObject paramJSONObject)
    throws JSONException
  {
    paramJSONObject.put("RULE_ID", this.ruleId);
    paramJSONObject.put("STATE", this.state);
    paramJSONObject.put("DISPLAY_NAME", this.displayName);
    paramJSONObject.put("RULE_TYPE", this.rulesType);
    return paramJSONObject;
  }
  
  public String toString()
  {
    return "RULE_ID: " + this.ruleId + "; STATE: " + this.state + "; DISPLAY_NAME: " + this.displayName + "; RULES_TYPE: " + this.rulesType;
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/belkin/wemo/rules/data/RMRule.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */