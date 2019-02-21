package com.belkin.wemo.rules.data;

import java.util.ArrayList;
import java.util.HashMap;
import org.json.JSONException;
import org.json.JSONObject;

public class RMNotifyMeRule
  extends RMDBRule
{
  public static final String NOTIFY_DURATION = "NOTIFY_DURATION";
  public static final String NOTIFY_MSG = "NOTIFY_MSG";
  public static final String NOTIFY_RULE_ID = "NOTIFY_RULE_ID";
  private int notificationDuration;
  private String notificationMsg;
  private int notifyRuleID;
  
  public RMNotifyMeRule() {}
  
  public RMNotifyMeRule(int paramInt1, RMDBRuleType paramRMDBRuleType, int paramInt2, int paramInt3, String paramString, HashMap<String, ArrayList<Integer>> paramHashMap, float paramFloat, int paramInt4, int paramInt5, int paramInt6, int paramInt7, long paramLong)
  {
    super(paramInt1, paramRMDBRuleType, paramInt2, paramInt3, paramString, paramHashMap, paramInt4, paramInt5, paramInt6, paramInt7, paramLong);
  }
  
  protected RMDBRuleType assignDBRuleType()
  {
    return RMDBRuleType.NOTIFY_ME;
  }
  
  public int getNotificationDuration()
  {
    return this.notificationDuration;
  }
  
  public String getNotificationMsg()
  {
    return this.notificationMsg;
  }
  
  public int getNotifyRuleID()
  {
    return this.notifyRuleID;
  }
  
  public void setNotificationDuration(int paramInt)
  {
    this.notificationDuration = paramInt;
  }
  
  public void setNotificationMsg(String paramString)
  {
    this.notificationMsg = paramString;
  }
  
  public void setNotifyRuleID(int paramInt)
  {
    this.notifyRuleID = paramInt;
  }
  
  public JSONObject toJSON(JSONObject paramJSONObject)
    throws JSONException
  {
    super.toJSON(paramJSONObject);
    paramJSONObject.put("NOTIFY_RULE_ID", getNotifyRuleID());
    paramJSONObject.put("NOTIFY_MSG", getNotificationMsg());
    paramJSONObject.put("NOTIFY_DURATION", getNotificationDuration());
    return paramJSONObject;
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/belkin/wemo/rules/data/RMNotifyMeRule.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */