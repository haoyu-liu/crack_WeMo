package com.belkin.wemo.rules.data.error;

import com.belkin.wemo.rules.error.RMRulesError;

public class RMRuleConflictError
  extends RMRulesError
{
  public RMRuleConflictError()
  {
    this.errorCode = 504;
    this.errorMessage = "Rule is conflicting with an already existing rule.";
  }
  
  public RMRuleConflictError(int paramInt, String paramString)
  {
    super(paramInt, paramString);
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/belkin/wemo/rules/data/error/RMRuleConflictError.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */