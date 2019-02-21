package com.belkin.wemo.rules.data;

import com.belkin.wemo.rules.data.device.RMLed;
import org.json.JSONException;
import org.json.JSONObject;

public class RMSensorTargetDevice
  extends RMLed
{
  private int sensorDuration;
  
  public int getSensorDuration()
  {
    return this.sensorDuration;
  }
  
  public void setSensorDuration(int paramInt)
  {
    this.sensorDuration = paramInt;
  }
  
  public JSONObject toJSON(JSONObject paramJSONObject)
    throws JSONException
  {
    super.toJSON(paramJSONObject);
    paramJSONObject.put("SENSOR_DURATION", this.sensorDuration);
    return paramJSONObject;
  }
  
  public String toString()
  {
    return "{SENSOR_DURATION: " + this.sensorDuration + "}";
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/belkin/wemo/rules/data/RMSensorTargetDevice.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */