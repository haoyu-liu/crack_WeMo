package com.belkin.wemo.rules.data;

import org.json.JSONException;
import org.json.JSONObject;

public class RMTargetDevice
{
  private final String DEVICE_ID = "DEVICE_ID";
  private final String DEVICE_INDEX = "DEVICE_INDEX";
  private String deviceId = "";
  private int deviceIndex;
  
  public String getDeviceId()
  {
    return this.deviceId;
  }
  
  public int getDeviceIndex()
  {
    return this.deviceIndex;
  }
  
  public void setDeviceId(String paramString)
  {
    this.deviceId = paramString;
  }
  
  public void setDeviceIndex(int paramInt)
  {
    this.deviceIndex = paramInt;
  }
  
  public JSONObject toJSONObject(JSONObject paramJSONObject)
    throws JSONException
  {
    paramJSONObject.put("DEVICE_ID", this.deviceId);
    paramJSONObject.put("DEVICE_INDEX", this.deviceIndex);
    return paramJSONObject;
  }
  
  public String toString()
  {
    return "{DEVICE_INDEX: " + this.deviceIndex + ", DEVICE_ID: " + this.deviceId + "}";
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/belkin/wemo/rules/data/RMTargetDevice.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */