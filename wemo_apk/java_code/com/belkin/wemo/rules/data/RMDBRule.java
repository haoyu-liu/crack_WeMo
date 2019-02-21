package com.belkin.wemo.rules.data;

import com.belkin.wemo.cache.utils.SDKLogUtils;
import com.belkin.wemo.rules.data.device.RMDBRuleDevice;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.LinkedHashSet;
import java.util.Map;
import java.util.Set;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

public abstract class RMDBRule
  extends RMRule
{
  public static final int ACTION_OFF = 0;
  public static final int ACTION_ON = 1;
  public static final int ALL_WEEK = -1;
  public static final int CALENDAR_FRIDAY = 4;
  public static final int CALENDAR_MONDAY = 0;
  public static final int CALENDAR_SATURDAY = 5;
  public static final int CALENDAR_SUNDAY = 6;
  public static final int CALENDAR_THURSDAY = 3;
  public static final int CALENDAR_TUESDAY = 1;
  public static final int CALENDAR_WEDNESDAY = 2;
  public static final String DAY_ID_ARR = "DAY_ID_ARR";
  public static String DAY_STR_FRIDAY = "Fri";
  public static String DAY_STR_MONDAY;
  public static String DAY_STR_SATURDAY = "Sat";
  public static String DAY_STR_SUNDAY = "Sun";
  public static String DAY_STR_THURSDAY;
  public static String DAY_STR_TUESDAY;
  public static String DAY_STR_WEDNESDAY;
  public static final int DEFAULT_LED_FADE = 30;
  public static final int DEFAULT_RULE_ORDER = 2;
  public static final String DEFAULT_SYNC = "NOSYNC";
  public static final int DEFAULT_UI_LED_FADE = 3;
  public static final String DEVICE_ID = "DEVICE_ID";
  public static final String END_ACTION = "END_ACTION";
  public static final String END_TIME_SINCE_MIDNIGHT = "END_TIME_SINCE_MIDNIGHT";
  public static final int FRIDAY = 6;
  public static final int MONDAY = 2;
  public static final int PREFIX_SUNRISE = 1;
  public static final int PREFIX_SUNSET = 2;
  public static final String RULE_DURATION = "RULE_DURATION";
  public static final String RULE_END_TIME_CODE = "RULE_END_TIME_CODE";
  public static final String RULE_START_TIME_CODE = "RULE_START_TIME_CODE";
  public static final int RULE_TIME_CODE_NO_LOCATION = 0;
  public static final int RULE_TIME_CODE_SUNRISE = 1;
  public static final int RULE_TIME_CODE_SUNSET = 2;
  public static final int SATURDAY = 7;
  public static final String SENSOR_DURATION = "SENSOR_DURATION";
  public static final String START_ACTION = "START_ACTION";
  public static final String START_BRIGHTNESS = "START_BRIGHTNESS";
  public static final String START_LED_FADE_SEC = "START_LED_FADE_SEC";
  public static final String START_TIME_SINCE_MIDNIGHT = "START_TIME_SINCE_MIDNIGHT";
  public static final int SUNDAY = 1;
  private static final String TAG = RMDBRule.class.getSimpleName();
  public static final String TARGET_DEV_ARR = "TARGET_DEV_ARR";
  public static final int THURSDAY = 5;
  public static final int TUESDAY = 3;
  public static final String TYPE = "TYPE";
  public static final String UDN = "UDN";
  public static final int WEDNESDAY = 4;
  public static final int WEEKDAYS = 8;
  public static final int WEEKEND = 9;
  public static final String WIFI_DEV_ARR = "WIFI_DEV_ARR";
  public static final String ZB_CAPABILITY_BRIGHTNESS = "10008";
  public static final String ZB_CAPABILITY_STATE = "10006";
  public static final String ZIGBEE_DEV_ARR = "ZIGBEE_DEV_ARR";
  public static final String ZIGBEE_DEV_ID = "ZIGBEE_DEV_ID";
  protected Map<Integer, Integer> calendarIndexToDBDayMap;
  protected Map<Integer, String> calendarIndexToDayStrMap;
  protected Set<Integer> dayList;
  private String endDate = "";
  protected int endTime = -1;
  private float latitude;
  private float longtitude;
  private int ruleCodeEnd;
  private int ruleCodeStart;
  private Set<RMDBRuleDevice> ruleDeviceSet;
  protected int ruleDuration = -1;
  private int ruleOrder = 2;
  private RMDBRuleType ruleType;
  private String startDate = "";
  protected int startTime = -1;
  private String sync = "NOSYNC";
  
  static
  {
    DAY_STR_MONDAY = "Mon";
    DAY_STR_TUESDAY = "Tues";
    DAY_STR_WEDNESDAY = "Wed";
    DAY_STR_THURSDAY = "Thurs";
  }
  
  public RMDBRule()
  {
    initDataStructures();
  }
  
  public RMDBRule(int paramInt1, RMDBRuleType paramRMDBRuleType, int paramInt2, int paramInt3, String paramString, HashMap<String, ArrayList<Integer>> paramHashMap, int paramInt4, int paramInt5, int paramInt6, int paramInt7, long paramLong)
  {
    super(paramInt1, paramInt2, paramString, paramInt3);
    this.ruleType = paramRMDBRuleType;
    initDataStructures();
  }
  
  private int calculateTimeCode(int paramInt)
  {
    return paramInt % 10;
  }
  
  private void initDataStructures()
  {
    this.dayList = new HashSet();
    this.calendarIndexToDayStrMap = new HashMap();
    this.calendarIndexToDayStrMap.put(Integer.valueOf(4), DAY_STR_FRIDAY);
    this.calendarIndexToDayStrMap.put(Integer.valueOf(0), DAY_STR_MONDAY);
    this.calendarIndexToDayStrMap.put(Integer.valueOf(5), DAY_STR_SATURDAY);
    this.calendarIndexToDayStrMap.put(Integer.valueOf(6), DAY_STR_SUNDAY);
    this.calendarIndexToDayStrMap.put(Integer.valueOf(3), DAY_STR_THURSDAY);
    this.calendarIndexToDayStrMap.put(Integer.valueOf(1), DAY_STR_TUESDAY);
    this.calendarIndexToDayStrMap.put(Integer.valueOf(2), DAY_STR_WEDNESDAY);
    this.calendarIndexToDBDayMap = new HashMap();
    this.calendarIndexToDBDayMap.put(Integer.valueOf(4), Integer.valueOf(6));
    this.calendarIndexToDBDayMap.put(Integer.valueOf(0), Integer.valueOf(2));
    this.calendarIndexToDBDayMap.put(Integer.valueOf(5), Integer.valueOf(7));
    this.calendarIndexToDBDayMap.put(Integer.valueOf(6), Integer.valueOf(1));
    this.calendarIndexToDBDayMap.put(Integer.valueOf(3), Integer.valueOf(5));
    this.calendarIndexToDBDayMap.put(Integer.valueOf(1), Integer.valueOf(3));
    this.calendarIndexToDBDayMap.put(Integer.valueOf(2), Integer.valueOf(4));
    this.ruleDeviceSet = new LinkedHashSet();
    this.ruleType = assignDBRuleType();
  }
  
  public void addDay(Integer paramInteger)
  {
    this.dayList.add(paramInteger);
  }
  
  public boolean addRuleDevice(RMDBRuleDevice paramRMDBRuleDevice)
  {
    SDKLogUtils.debugLog(TAG, "Rule device add request. UI_UDN: " + paramRMDBRuleDevice.getUiUdn() + "; RuleID: " + getRuleId());
    return this.ruleDeviceSet.add(paramRMDBRuleDevice);
  }
  
  protected abstract RMDBRuleType assignDBRuleType();
  
  protected int assignRuleType()
  {
    return 2;
  }
  
  public boolean deleteDevice(RMDBRuleDevice paramRMDBRuleDevice)
  {
    SDKLogUtils.debugLog(TAG, "Rule device delete request. UI_UDN: " + paramRMDBRuleDevice.getUiUdn() + "; RuleID: " + getRuleId());
    return this.ruleDeviceSet.remove(paramRMDBRuleDevice);
  }
  
  public boolean equals(Object paramObject)
  {
    if (this == paramObject) {}
    RMDBRule localRMDBRule;
    do
    {
      return true;
      if (!super.equals(paramObject)) {
        return false;
      }
      if (getClass() != paramObject.getClass()) {
        return false;
      }
      localRMDBRule = (RMDBRule)paramObject;
      if (this.dayList == null)
      {
        if (localRMDBRule.dayList != null) {
          return false;
        }
      }
      else if (!this.dayList.equals(localRMDBRule.dayList)) {
        return false;
      }
      if (this.ruleDeviceSet == null)
      {
        if (localRMDBRule.ruleDeviceSet != null) {
          return false;
        }
      }
      else if (!this.ruleDeviceSet.equals(localRMDBRule.ruleDeviceSet)) {
        return false;
      }
    } while (this.ruleType == localRMDBRule.ruleType);
    return false;
  }
  
  public Set<Integer> getDaySet()
  {
    return this.dayList;
  }
  
  public String getEndDate()
  {
    return this.endDate;
  }
  
  public int getEndTime()
  {
    return this.endTime;
  }
  
  public float getLatitude()
  {
    return this.latitude;
  }
  
  public float getLongtitude()
  {
    return this.longtitude;
  }
  
  public int getRuleCodeEnd()
  {
    return this.ruleCodeEnd;
  }
  
  public int getRuleCodeStart()
  {
    return this.ruleCodeStart;
  }
  
  public Set<RMDBRuleDevice> getRuleDeviceSet()
  {
    return this.ruleDeviceSet;
  }
  
  public int getRuleDuration()
  {
    return this.ruleDuration;
  }
  
  public int getRuleOrder()
  {
    return this.ruleOrder;
  }
  
  public RMDBRuleType getRuleType()
  {
    return this.ruleType;
  }
  
  public String getStartDate()
  {
    return this.startDate;
  }
  
  public int getStartTime()
  {
    return this.startTime;
  }
  
  public String getSync()
  {
    return this.sync;
  }
  
  public int hashCode()
  {
    int i = 31 * super.hashCode();
    int j;
    int m;
    label34:
    int n;
    int i1;
    if (this.dayList == null)
    {
      j = 0;
      int k = 31 * (i + j);
      if (this.ruleDeviceSet != null) {
        break label76;
      }
      m = 0;
      n = 31 * (k + m);
      RMDBRuleType localRMDBRuleType = this.ruleType;
      i1 = 0;
      if (localRMDBRuleType != null) {
        break label90;
      }
    }
    for (;;)
    {
      return n + i1;
      j = this.dayList.hashCode();
      break;
      label76:
      m = this.ruleDeviceSet.hashCode();
      break label34;
      label90:
      i1 = this.ruleType.hashCode();
    }
  }
  
  public void removeDay(Integer paramInteger)
  {
    this.dayList.remove(paramInteger);
  }
  
  public void setDayList(Set<Integer> paramSet)
  {
    if (paramSet != null)
    {
      this.dayList = paramSet;
      return;
    }
    this.dayList = new HashSet();
  }
  
  public void setEndDate(String paramString)
  {
    this.endDate = paramString;
  }
  
  public void setEndTime(int paramInt)
  {
    this.endTime = paramInt;
    setRuleCodeEnd(calculateTimeCode(paramInt));
  }
  
  public void setLatitude(float paramFloat)
  {
    this.latitude = paramFloat;
  }
  
  public void setLongtitude(float paramFloat)
  {
    this.longtitude = paramFloat;
  }
  
  public void setRuleCodeEnd(int paramInt)
  {
    this.ruleCodeEnd = paramInt;
  }
  
  public void setRuleCodeStart(int paramInt)
  {
    this.ruleCodeStart = paramInt;
  }
  
  public void setRuleDeviceSet(Set<RMDBRuleDevice> paramSet)
  {
    this.ruleDeviceSet = paramSet;
  }
  
  public void setRuleDuration(int paramInt)
  {
    this.ruleDuration = paramInt;
  }
  
  public void setRuleOrder(int paramInt)
  {
    this.ruleOrder = paramInt;
  }
  
  public void setRuleType(RMDBRuleType paramRMDBRuleType)
  {
    this.ruleType = paramRMDBRuleType;
  }
  
  public void setStartDate(String paramString)
  {
    this.startDate = paramString;
  }
  
  public void setStartTime(int paramInt)
  {
    this.startTime = paramInt;
    setRuleCodeStart(calculateTimeCode(paramInt));
  }
  
  public void setSync(String paramString)
  {
    this.sync = paramString;
  }
  
  public JSONObject toJSON(JSONObject paramJSONObject)
    throws JSONException
  {
    super.toJSON(paramJSONObject);
    paramJSONObject.put("DB_RULE_TYPE", getRuleType());
    paramJSONObject.put("START_TIME_SINCE_MIDNIGHT", this.startTime);
    paramJSONObject.put("END_TIME_SINCE_MIDNIGHT", this.endTime);
    paramJSONObject.put("RULE_DURATION", this.ruleDuration);
    paramJSONObject.put("RULE_START_TIME_CODE", getRuleCodeStart());
    paramJSONObject.put("RULE_END_TIME_CODE", getRuleCodeEnd());
    JSONArray localJSONArray1 = new JSONArray();
    Iterator localIterator1 = this.dayList.iterator();
    while (localIterator1.hasNext()) {
      localJSONArray1.put((Integer)localIterator1.next());
    }
    paramJSONObject.put("DAY_ID_ARR", localJSONArray1);
    JSONArray localJSONArray2 = new JSONArray();
    Iterator localIterator2 = this.ruleDeviceSet.iterator();
    while (localIterator2.hasNext()) {
      localJSONArray2.put(((RMDBRuleDevice)localIterator2.next()).toJSON(new JSONObject()));
    }
    paramJSONObject.put("WIFI_DEV_ARR", localJSONArray2);
    return paramJSONObject;
  }
  
  public String toString()
  {
    String str1 = super.toString() + "; START_TIME: " + this.startTime + "; END_TIME: " + this.endTime + "; RULE_DURATION: " + this.ruleDuration;
    String str2 = null;
    Iterator localIterator = this.ruleDeviceSet.iterator();
    while (localIterator.hasNext())
    {
      RMDBRuleDevice localRMDBRuleDevice = (RMDBRuleDevice)localIterator.next();
      str2 = str2 + localRMDBRuleDevice.toString();
    }
    return str1 + "; RULE_DEVICES: " + str2;
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/belkin/wemo/rules/data/RMDBRule.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */