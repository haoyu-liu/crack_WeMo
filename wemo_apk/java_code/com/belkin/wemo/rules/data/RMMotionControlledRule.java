package com.belkin.wemo.rules.data;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.Set;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

public class RMMotionControlledRule
  extends RMDBRule
{
  public static final int DAY_ID = -1;
  public static final int LEVEL = 2;
  public static final int SENSOR_DURATION = -1;
  public static final String SENSOR_TARGET_DEV_ARR = "SENSOR_TARGET_DEV_ARR";
  public static final int SESNOR_DURATION = -1;
  public static final int TYPE;
  private int sensorDuration;
  private Set<RMSensorTargetDevice> sensorTargetDeviceSet = new HashSet();
  private int type;
  
  public RMMotionControlledRule() {}
  
  public RMMotionControlledRule(int paramInt1, RMDBRuleType paramRMDBRuleType, int paramInt2, int paramInt3, String paramString, HashMap<String, ArrayList<Integer>> paramHashMap, float paramFloat, int paramInt4, int paramInt5, int paramInt6, int paramInt7, long paramLong)
  {
    super(paramInt1, paramRMDBRuleType, paramInt2, paramInt3, paramString, paramHashMap, paramInt4, paramInt5, paramInt6, paramInt7, paramLong);
  }
  
  public boolean addSensorTargetDevice(RMSensorTargetDevice paramRMSensorTargetDevice)
  {
    return this.sensorTargetDeviceSet.add(paramRMSensorTargetDevice);
  }
  
  protected RMDBRuleType assignDBRuleType()
  {
    return RMDBRuleType.MOTION_CONTROLLED;
  }
  
  public int getSensorDuration()
  {
    return this.sensorDuration;
  }
  
  public Set<RMSensorTargetDevice> getSensorTargetDeviceSet()
  {
    return this.sensorTargetDeviceSet;
  }
  
  public int getType()
  {
    return this.type;
  }
  
  public boolean removeSensorTargetDevice(RMSensorTargetDevice paramRMSensorTargetDevice)
  {
    return this.sensorTargetDeviceSet.remove(paramRMSensorTargetDevice);
  }
  
  public void setSensorDuration(int paramInt)
  {
    this.sensorDuration = paramInt;
  }
  
  public void setSensorTargetDeviceSet(Set<RMSensorTargetDevice> paramSet)
  {
    this.sensorTargetDeviceSet = paramSet;
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
    Iterator localIterator = this.sensorTargetDeviceSet.iterator();
    while (localIterator.hasNext()) {
      localJSONArray.put(((RMSensorTargetDevice)localIterator.next()).toJSON(new JSONObject()));
    }
    paramJSONObject.put("SENSOR_TARGET_DEV_ARR", localJSONArray);
    return paramJSONObject;
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/belkin/wemo/rules/data/RMMotionControlledRule.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */