package com.belkin.wemo.rules.data;

import java.util.ArrayList;
import java.util.HashMap;

public class RMCountdownTimerRule
  extends RMDBRule
{
  private int countdownTime;
  
  public RMCountdownTimerRule() {}
  
  public RMCountdownTimerRule(int paramInt1, RMDBRuleType paramRMDBRuleType, int paramInt2, int paramInt3, String paramString, HashMap<String, ArrayList<Integer>> paramHashMap, int paramInt4, int paramInt5, int paramInt6, int paramInt7, long paramLong)
  {
    super(paramInt1, paramRMDBRuleType, paramInt2, paramInt3, paramString, paramHashMap, paramInt4, paramInt5, paramInt6, paramInt7, paramLong);
  }
  
  protected RMDBRuleType assignDBRuleType()
  {
    return RMDBRuleType.COUNTDOWN_RULE;
  }
  
  public int getCountdownTime()
  {
    return this.countdownTime;
  }
  
  public void setCountdownTime(int paramInt)
  {
    this.countdownTime = paramInt;
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/belkin/wemo/rules/data/RMCountdownTimerRule.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */