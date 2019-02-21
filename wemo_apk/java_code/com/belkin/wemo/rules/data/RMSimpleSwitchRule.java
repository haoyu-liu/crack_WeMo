package com.belkin.wemo.rules.data;

import java.util.ArrayList;
import java.util.HashMap;

public class RMSimpleSwitchRule
  extends RMDBRule
{
  public RMSimpleSwitchRule() {}
  
  public RMSimpleSwitchRule(int paramInt1, RMDBRuleType paramRMDBRuleType, int paramInt2, int paramInt3, String paramString, HashMap<String, ArrayList<Integer>> paramHashMap, float paramFloat, int paramInt4, int paramInt5, int paramInt6, int paramInt7, long paramLong)
  {
    super(paramInt1, paramRMDBRuleType, paramInt2, paramInt3, paramString, paramHashMap, paramInt4, paramInt5, paramInt6, paramInt7, paramLong);
  }
  
  protected RMDBRuleType assignDBRuleType()
  {
    return RMDBRuleType.SIMPLE_SWITCH;
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/belkin/wemo/rules/data/RMSimpleSwitchRule.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */