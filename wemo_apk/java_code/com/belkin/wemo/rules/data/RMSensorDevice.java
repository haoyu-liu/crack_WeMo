package com.belkin.wemo.rules.data;

import com.belkin.wemo.rules.data.device.RMDBRuleDevice;
import org.json.JSONException;
import org.json.JSONObject;

public class RMSensorDevice
  extends RMDBRuleDevice
{
  private int level;
  private int sensorDuration;
  private int type;
  private int value;
  
  public int getLevel()
  {
    return this.level;
  }
  
  public int getSensorDuration()
  {
    return this.sensorDuration;
  }
  
  public int getType()
  {
    return this.type;
  }
  
  public int getValue()
  {
    return this.value;
  }
  
  public void setLevel(int paramInt)
  {
    this.level = paramInt;
  }
  
  public void setSensorDuration(int paramInt)
  {
    this.sensorDuration = paramInt;
  }
  
  public void setType(int paramInt)
  {
    this.type = paramInt;
  }
  
  public void setValue(int paramInt)
  {
    this.value = paramInt;
  }
  
  public JSONObject toJSON(JSONObject paramJSONObject)
    throws JSONException
  {
    super.toJSON(paramJSONObject);
    paramJSONObject.put("TYPE", this.type);
    paramJSONObject.put("SENSOR_DURATION", this.sensorDuration);
    return paramJSONObject;
  }
  
  public String toString()
  {
    return "{TYPE: " + this.type + ", LEVEL: " + this.level + ", SENSOR_DURATION: " + this.sensorDuration + ", VALUE: " + this.value + "}";
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/belkin/wemo/rules/data/RMSensorDevice.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */