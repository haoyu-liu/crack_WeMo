package com.belkin.wemo.rules.read.type.error;

import com.belkin.wemo.rules.error.RMRulesError;

public class RMParseRuleError
  extends RMRulesError
{
  private String ruleType;
  private int rulesType;
  
  public RMParseRuleError(int paramInt, String paramString)
  {
    this.rulesType = paramInt;
    this.ruleType = paramString;
  }
  
  public RMParseRuleError(int paramInt1, String paramString, int paramInt2)
  {
    super(paramInt1, paramString);
    this.rulesType = paramInt2;
  }
  
  public RMParseRuleError(int paramInt1, String paramString1, int paramInt2, String paramString2)
  {
    super(paramInt1, paramString1);
    this.rulesType = paramInt2;
    this.ruleType = paramString2;
  }
  
  public String getRuleType()
  {
    return this.ruleType;
  }
  
  public int getRulesType()
  {
    return this.rulesType;
  }
  
  public void setRuleType(String paramString)
  {
    this.ruleType = paramString;
  }
  
  public void setRulesType(int paramInt)
  {
    this.rulesType = paramInt;
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/belkin/wemo/rules/read/type/error/RMParseRuleError.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */