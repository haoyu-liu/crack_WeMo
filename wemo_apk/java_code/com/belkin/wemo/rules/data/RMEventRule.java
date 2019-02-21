package com.belkin.wemo.rules.data;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.Set;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

public class RMEventRule
  extends RMDBRule
{
  public static final int LEVEL = 2;
  public static final String SENSOR_DEV_ARR = "SENSOR_DEV_ARR";
  public static final int SENSOR_DURATION = 1;
  public static final int TYPE = 5;
  public static final int VALUE;
  private Set<RMSensorDevice> sensorDeviceSet = new HashSet();
  private int sensorDuration;
  private int type;
  
  public RMEventRule() {}
  
  public RMEventRule(int paramInt1, RMDBRuleType paramRMDBRuleType, int paramInt2, int paramInt3, String paramString, HashMap<String, ArrayList<Integer>> paramHashMap, float paramFloat, int paramInt4, int paramInt5, int paramInt6, int paramInt7, long paramLong)
  {
    super(paramInt1, paramRMDBRuleType, paramInt2, paramInt3, paramString, paramHashMap, paramInt4, paramInt5, paramInt6, paramInt7, paramLong);
  }
  
  public boolean addSensorDevice(RMSensorDevice paramRMSensorDevice)
  {
    return this.sensorDeviceSet.add(paramRMSensorDevice);
  }
  
  protected RMDBRuleType assignDBRuleType()
  {
    return RMDBRuleType.EVENT_RULE;
  }
  
  public Set<RMSensorDevice> getSensorDeviceSet()
  {
    return this.sensorDeviceSet;
  }
  
  public int getSensorDuration()
  {
    return this.sensorDuration;
  }
  
  public int getType()
  {
    return this.type;
  }
  
  public boolean removeSensorDevice(RMSensorDevice paramRMSensorDevice)
  {
    return this.sensorDeviceSet.remove(paramRMSensorDevice);
  }
  
  public void setSensorDeviceSet(Set<RMSensorDevice> paramSet)
  {
    this.sensorDeviceSet = paramSet;
  }
  
  public void setSensorDuration(int paramInt)
  {
    this.sensorDuration = paramInt;
  }
  
  public void setType(int paramInt)
  {
    this.type = paramInt;
  }
  
  public JSONObject toJSON(JSONObject paramJSONObject)
    throws JSONException
  {
    super.toJSON(paramJSONObject);
    JSONArray localJSONArray = new JSONArray();
    Iterator localIterator = this.sensorDeviceSet.iterator();
    while (localIterator.hasNext()) {
      localJSONArray.put(((RMSensorDevice)localIterator.next()).toJSON(new JSONObject()));
    }
    paramJSONObject.put("SENSOR_DEV_ARR", localJSONArray);
    return paramJSONObject;
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/belkin/wemo/rules/data/RMEventRule.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */