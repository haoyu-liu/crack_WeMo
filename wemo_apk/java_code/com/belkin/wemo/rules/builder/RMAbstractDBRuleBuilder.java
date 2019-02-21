package com.belkin.wemo.rules.builder;

import com.belkin.wemo.rules.data.RMDBRule;
import com.belkin.wemo.rules.data.device.RMDBRuleDevice;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

public abstract class RMAbstractDBRuleBuilder<T extends RMDBRule>
  extends RMAbstractRuleBuilder<T>
{
  public static final String DAY_ID_ARR = "DAY_ID_ARR";
  public static final String DB_RULE_TYPE = "DB_RULE_TYPE";
  public static final String DEVICE_ID = "DEVICE_ID";
  public static final String DEVICE_INDEX = "DEVICE_INDEX";
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
  
  public RMAbstractDBRuleBuilder(JSONObject paramJSONObject)
  {
    super(paramJSONObject);
  }
  
  private void addRuleDevices(RMDBRule paramRMDBRule)
    throws JSONException
  {
    JSONArray localJSONArray = this.ruleJO.getJSONArray("WIFI_DEV_ARR");
    int i = localJSONArray.length();
    for (int j = 0; j < i; j++)
    {
      JSONObject localJSONObject = localJSONArray.getJSONObject(j);
      RMDBRuleDevice localRMDBRuleDevice = new RMDBRuleDevice();
      localRMDBRuleDevice.setStartAction(getStartAction(localJSONObject));
      localRMDBRuleDevice.setEndAction(getEndAction(localJSONObject));
      localRMDBRuleDevice.setUiUdn(getUiUDN(localJSONObject));
      localRMDBRuleDevice.setOnModeOffset(getOnModeOffset(localJSONObject));
      localRMDBRuleDevice.setOffModeOffset(getOffModeOffset(localJSONObject));
      paramRMDBRule.addRuleDevice(localRMDBRuleDevice);
    }
  }
  
  protected void addRuleDetails()
    throws JSONException
  {
    addRuleDevices((RMDBRule)this.rule);
  }
  
  protected int getEndAction(JSONObject paramJSONObject)
    throws JSONException
  {
    return -1;
  }
  
  protected int getOffModeOffset(JSONObject paramJSONObject)
    throws JSONException
  {
    return -1;
  }
  
  protected int getOnModeOffset(JSONObject paramJSONObject)
    throws JSONException
  {
    return -1;
  }
  
  protected int getStartAction(JSONObject paramJSONObject)
    throws JSONException
  {
    return paramJSONObject.getInt("START_ACTION");
  }
  
  protected String getUiUDN(JSONObject paramJSONObject)
    throws JSONException
  {
    return paramJSONObject.getString("UDN");
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/belkin/wemo/rules/builder/RMAbstractDBRuleBuilder.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */