package com.belkin.wemo.rules.data;

import java.util.ArrayList;
import java.util.HashMap;
import org.json.JSONException;
import org.json.JSONObject;

public class RMAwayModeRule
  extends RMDBRule
{
  public RMAwayModeRule() {}
  
  public RMAwayModeRule(int paramInt1, RMDBRuleType paramRMDBRuleType, int paramInt2, int paramInt3, String paramString, HashMap<String, ArrayList<Integer>> paramHashMap, float paramFloat, int paramInt4, int paramInt5, int paramInt6, int paramInt7, long paramLong)
  {
    super(paramInt1, paramRMDBRuleType, paramInt2, paramInt3, paramString, paramHashMap, paramInt4, paramInt5, paramInt6, paramInt7, paramLong);
  }
  
  protected RMDBRuleType assignDBRuleType()
  {
    return RMDBRuleType.AWAY_MODE;
  }
  
  public JSONObject toJSON(JSONObject paramJSONObject)
    throws JSONException
  {
    return super.toJSON(paramJSONObject);
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/belkin/wemo/rules/data/RMAwayModeRule.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */