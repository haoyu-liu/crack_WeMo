package com.belkin.wemo.rules.builder;

import com.belkin.wemo.rules.data.RMRule;
import org.json.JSONException;
import org.json.JSONObject;

public abstract class RMAbstractRuleBuilder<T extends RMRule>
{
  public static final String DAY_ID_ARR = "DAY_ID_ARR";
  public static final String DB_RULE_TYPE = "DB_RULE_TYPE";
  public static final String DEVICE_ = "DEVICE_INDEX";
  public static final String DEVICE_ID = "DEVICE_ID";
  public static final String DISPLAY_NAME = "DISPLAY_NAME";
  public static final String END_TIME_SINCE_MIDNIGHT = "END_TIME_SINCE_MIDNIGHT";
  public static final String ON_MODE_OFFSET_SEC = "ON_MODE_OFFSET_SEC";
  public static final String RULE_ID = "RULE_ID";
  public static final String RULE_TYPE = "RULE_TYPE";
  public static final String START_ACTION = "START_ACTION";
  public static final String START_BRIGHTNESS = "START_BRIGHTNESS";
  public static final String START_LED_FADE_SEC = "START_LED_FADE_SEC";
  public static final String START_RULE_CODE = "START_RULE_CODE";
  public static final String START_TIME_SINCE_MIDNIGHT = "START_TIME_SINCE_MIDNIGHT";
  public static final String STATE = "STATE";
  public static final String TARGET_DEV_ARR = "TARGET_DEV_ARR";
  public static final String UDN = "UDN";
  public static final String WIFI_DEV_ARR = "WIFI_DEV_ARR";
  public static final String ZIGBEE_DEV_ARR = "ZIGBEE_DEV_ARR";
  protected T rule;
  protected JSONObject ruleJO;
  
  public RMAbstractRuleBuilder(JSONObject paramJSONObject)
  {
    this.ruleJO = paramJSONObject;
  }
  
  protected abstract void addRuleDetails()
    throws JSONException;
  
  public T buildExisting()
    throws JSONException
  {
    RMRule localRMRule = buildNew();
    localRMRule.setRuleId(this.ruleJO.getInt("RULE_ID"));
    return localRMRule;
  }
  
  public T buildNew()
    throws JSONException
  {
    this.rule = instantiateRule();
    int i = this.ruleJO.getInt("STATE");
    this.rule.setState(i);
    String str = this.ruleJO.getString("DISPLAY_NAME");
    this.rule.setDisplayName(str);
    addRuleDetails();
    return this.rule;
  }
  
  protected abstract T instantiateRule();
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/belkin/wemo/rules/builder/RMAbstractRuleBuilder.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */