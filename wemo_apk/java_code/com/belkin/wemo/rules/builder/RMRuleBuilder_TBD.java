package com.belkin.wemo.rules.builder;

import com.belkin.utils.LogUtils;
import com.belkin.wemo.rules.data.RMDBRule;
import com.belkin.wemo.rules.data.RMDBRuleType;
import com.belkin.wemo.rules.data.RMLongPressRule;
import com.belkin.wemo.rules.data.RMRule;
import com.belkin.wemo.rules.data.RMSimpleSwitchRule;
import com.belkin.wemo.rules.data.RMTargetDevice;
import com.belkin.wemo.rules.data.device.RMDBRuleDevice;
import com.belkin.wemo.rules.data.device.RMLed;
import java.util.Iterator;
import java.util.List;
import java.util.Set;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

public class RMRuleBuilder_TBD
{
  public static final String DAY_ID_ARR = "DAY_ID_ARR";
  public static final String DB_RULE_TYPE = "DB_RULE_TYPE";
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
  private static final String TAG = RMRuleBuilder_TBD.class.getSimpleName();
  public static final String TARGET_DEV_ARR = "TARGET_DEV_ARR";
  public static final String UDN = "UDN";
  public static final String WIFI_DEV_ARR = "WIFI_DEV_ARR";
  public static final String ZIGBEE_DEV_ARR = "ZIGBEE_DEV_ARR";
  
  private void addCommonDeviceProperties(RMDBRuleDevice paramRMDBRuleDevice, int paramInt1, String paramString, int paramInt2, int paramInt3) {}
  
  private JSONObject buildDBRuleJSON(RMDBRule paramRMDBRule)
    throws JSONException
  {
    return paramRMDBRule.toJSON(new JSONObject());
  }
  
  private JSONObject buildEventRuleJO(RMLongPressRule paramRMLongPressRule)
    throws JSONException
  {
    JSONObject localJSONObject = new JSONObject();
    localJSONObject.put("DB_RULE_TYPE", RMDBRuleType.EVENT_RULE.toString());
    localJSONObject.put("RULE_ID", paramRMLongPressRule.getRuleId());
    localJSONObject.put("STATE", paramRMLongPressRule.getState());
    localJSONObject.put("DISPLAY_NAME", paramRMLongPressRule.getDisplayName());
    JSONArray localJSONArray1 = new JSONArray();
    Iterator localIterator1 = paramRMLongPressRule.getDaySet().iterator();
    while (localIterator1.hasNext()) {
      localJSONArray1.put((Integer)localIterator1.next());
    }
    localJSONObject.put("DAY_ID_ARR", localJSONArray1);
    JSONArray localJSONArray2 = new JSONArray();
    Iterator localIterator2 = paramRMLongPressRule.getRuleDeviceSet().iterator();
    while (localIterator2.hasNext()) {
      localJSONArray2.put(getDeviceJO((RMDBRuleDevice)localIterator2.next()));
    }
    localJSONObject.put("WIFI_DEV_ARR", localJSONArray2);
    JSONArray localJSONArray3 = new JSONArray();
    Iterator localIterator3 = paramRMLongPressRule.getTargetDeviceSet().iterator();
    while (localIterator3.hasNext()) {
      localJSONArray3.put(((RMTargetDevice)localIterator3.next()).toJSONObject(new JSONObject()));
    }
    localJSONObject.put("TARGET_DEV_ARR", localJSONArray3);
    return localJSONObject;
  }
  
  private JSONObject buildLongPressRuleJO(RMLongPressRule paramRMLongPressRule)
    throws JSONException
  {
    JSONObject localJSONObject = new JSONObject();
    localJSONObject.put("DB_RULE_TYPE", RMDBRuleType.LONG_PRESS.toString());
    localJSONObject.put("RULE_ID", paramRMLongPressRule.getRuleId());
    localJSONObject.put("STATE", paramRMLongPressRule.getState());
    localJSONObject.put("DISPLAY_NAME", paramRMLongPressRule.getDisplayName());
    JSONArray localJSONArray1 = new JSONArray();
    Iterator localIterator1 = paramRMLongPressRule.getDaySet().iterator();
    while (localIterator1.hasNext()) {
      localJSONArray1.put((Integer)localIterator1.next());
    }
    localJSONObject.put("DAY_ID_ARR", localJSONArray1);
    JSONArray localJSONArray2 = new JSONArray();
    Iterator localIterator2 = paramRMLongPressRule.getRuleDeviceSet().iterator();
    while (localIterator2.hasNext()) {
      localJSONArray2.put(getDeviceJO((RMDBRuleDevice)localIterator2.next()));
    }
    localJSONObject.put("WIFI_DEV_ARR", localJSONArray2);
    JSONArray localJSONArray3 = new JSONArray();
    Iterator localIterator3 = paramRMLongPressRule.getTargetDeviceSet().iterator();
    while (localIterator3.hasNext()) {
      localJSONArray3.put(((RMTargetDevice)localIterator3.next()).toJSONObject(new JSONObject()));
    }
    localJSONObject.put("TARGET_DEV_ARR", localJSONArray3);
    return localJSONObject;
  }
  
  private RMDBRule buildNewDBRule(JSONObject paramJSONObject)
    throws JSONException
  {
    int i = paramJSONObject.getInt("RULE_ID");
    int j = paramJSONObject.getInt("STATE");
    String str = paramJSONObject.getString("DISPLAY_NAME");
    int k = paramJSONObject.getInt("START_RULE_CODE");
    int m = paramJSONObject.getInt("START_TIME_SINCE_MIDNIGHT");
    int n = paramJSONObject.getInt("ON_MODE_OFFSET_SEC");
    RMDBRuleType localRMDBRuleType = RMDBRuleType.fromString(paramJSONObject.getString("DB_RULE_TYPE"));
    int i1 = 1.$SwitchMap$com$belkin$wemo$rules$data$RMDBRuleType[localRMDBRuleType.ordinal()];
    Object localObject = null;
    switch (i1)
    {
    }
    for (;;)
    {
      ((RMDBRule)localObject).setRuleId(i);
      ((RMDBRule)localObject).setState(j);
      ((RMDBRule)localObject).setDisplayName(str);
      ((RMDBRule)localObject).setRulesType(2);
      return (RMDBRule)localObject;
      localObject = buildSimpleSwitchRule(paramJSONObject, m, k, n);
    }
  }
  
  private RMSimpleSwitchRule buildSimpleSwitchRule(JSONObject paramJSONObject, int paramInt1, int paramInt2, int paramInt3)
    throws JSONException
  {
    RMSimpleSwitchRule localRMSimpleSwitchRule = new RMSimpleSwitchRule();
    JSONArray localJSONArray1 = paramJSONObject.getJSONArray("DAY_ID_ARR");
    int i = localJSONArray1.length();
    for (int j = 0; j < i; j++) {
      localRMSimpleSwitchRule.addDay(Integer.valueOf(localJSONArray1.getInt(j)));
    }
    JSONArray localJSONArray2 = paramJSONObject.getJSONArray("WIFI_DEV_ARR");
    int k = localJSONArray2.length();
    for (int m = 0; m < k; m++)
    {
      JSONObject localJSONObject = localJSONArray2.getJSONObject(m);
      String str = localJSONObject.getString("UDN");
      if (str.contains("Bridge"))
      {
        JSONArray localJSONArray3 = localJSONObject.getJSONArray("ZIGBEE_DEV_ARR");
        int n = localJSONArray3.length();
        for (int i1 = 0; i1 < n; i1++)
        {
          RMLed localRMLed = getLed(localJSONArray3.getJSONObject(i1));
          addCommonDeviceProperties(localRMLed, paramInt2, str, paramInt1, paramInt3);
          localRMSimpleSwitchRule.addRuleDevice(localRMLed);
          LogUtils.debugLog(TAG, "Device DN UDN: " + localRMLed.getUdn());
        }
      }
      RMDBRuleDevice localRMDBRuleDevice = getDevice(localJSONObject);
      addCommonDeviceProperties(localRMDBRuleDevice, paramInt2, str, paramInt1, paramInt3);
      localRMSimpleSwitchRule.addRuleDevice(localRMDBRuleDevice);
    }
    return localRMSimpleSwitchRule;
  }
  
  private RMDBRuleDevice getDevice(JSONObject paramJSONObject)
    throws JSONException
  {
    RMDBRuleDevice localRMDBRuleDevice = new RMDBRuleDevice();
    localRMDBRuleDevice.setStartAction(paramJSONObject.getInt("START_ACTION"));
    return localRMDBRuleDevice;
  }
  
  private JSONObject getDeviceJO(RMDBRuleDevice paramRMDBRuleDevice)
    throws JSONException
  {
    JSONObject localJSONObject = new JSONObject();
    localJSONObject.put("UDN", paramRMDBRuleDevice.getUiUdn());
    localJSONObject.put("START_ACTION", paramRMDBRuleDevice.getStartAction());
    return localJSONObject;
  }
  
  private RMLed getLed(JSONObject paramJSONObject)
    throws JSONException
  {
    return new RMLed();
  }
  
  public RMRule build(JSONObject paramJSONObject)
    throws JSONException
  {
    if (paramJSONObject != null) {}
    switch (paramJSONObject.getInt("RULE_TYPE"))
    {
    default: 
      return null;
    }
    return buildNewDBRule(paramJSONObject);
  }
  
  public JSONObject buildRuleJSON(RMRule paramRMRule)
    throws JSONException
  {
    JSONObject localJSONObject = new JSONObject();
    if (paramRMRule != null) {
      switch (paramRMRule.getRulesType())
      {
      }
    }
    for (;;)
    {
      LogUtils.debugLog(TAG, "Built Rule JSON: " + localJSONObject.toString());
      return localJSONObject;
      localJSONObject = buildDBRuleJSON((RMDBRule)paramRMRule);
    }
  }
  
  public JSONArray buildRuleListJSONArray(List<RMRule> paramList)
    throws JSONException
  {
    JSONArray localJSONArray = new JSONArray();
    Iterator localIterator = paramList.iterator();
    while (localIterator.hasNext()) {
      localJSONArray.put(buildRuleJSON((RMRule)localIterator.next()));
    }
    return localJSONArray;
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/belkin/wemo/rules/builder/RMRuleBuilder_TBD.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */