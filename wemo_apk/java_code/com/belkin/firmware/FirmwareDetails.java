package com.belkin.firmware;

import org.json.JSONException;
import org.json.JSONObject;

public class FirmwareDetails
{
  String bridgeUDN = "";
  String currentVersion;
  String deviceType;
  String md5;
  String uniqueID;
  String updateURL;
  String updateVersion;
  String zigbeeIds = "";
  
  public FirmwareDetails(String paramString1, String paramString2, String paramString3, String paramString4, String paramString5, String paramString6)
  {
    this.uniqueID = paramString1;
    this.currentVersion = paramString2;
    this.updateURL = paramString3;
    this.updateVersion = paramString4;
    this.md5 = paramString5;
    this.deviceType = paramString6;
  }
  
  public FirmwareDetails(String paramString1, String paramString2, String paramString3, String paramString4, String paramString5, String paramString6, String paramString7)
  {
    this.uniqueID = paramString1;
    this.currentVersion = paramString2;
    this.updateURL = paramString3;
    this.updateVersion = paramString4;
    this.md5 = paramString5;
    this.deviceType = paramString6;
    this.bridgeUDN = paramString7;
  }
  
  public FirmwareDetails(JSONObject paramJSONObject)
  {
    try
    {
      this.uniqueID = paramJSONObject.getString("udn");
      this.updateURL = paramJSONObject.getString("url");
      this.updateVersion = paramJSONObject.getString("version");
      this.md5 = paramJSONObject.getString("checksum");
      this.deviceType = paramJSONObject.getString("modelCode");
      return;
    }
    catch (JSONException localJSONException)
    {
      localJSONException.printStackTrace();
    }
  }
  
  public FirmwareDetails(JSONObject paramJSONObject, String paramString)
  {
    try
    {
      this.uniqueID = paramString;
      this.updateURL = paramJSONObject.getString("url");
      this.updateVersion = paramJSONObject.getString("version");
      this.md5 = paramJSONObject.getString("checksum");
      this.deviceType = paramJSONObject.getString("modelCode");
      this.zigbeeIds = paramJSONObject.getString("udn");
      this.bridgeUDN = paramJSONObject.getString("bridgeUDN");
      return;
    }
    catch (JSONException localJSONException)
    {
      localJSONException.printStackTrace();
    }
  }
  
  public String getBridgeUDN()
  {
    return this.bridgeUDN;
  }
  
  public String getCurrentVersion()
  {
    return this.currentVersion;
  }
  
  public String getDeviceType()
  {
    return this.deviceType;
  }
  
  public String getMd5()
  {
    return this.md5;
  }
  
  public String getUniqueID()
  {
    return this.uniqueID;
  }
  
  public String getUpdateURL()
  {
    return this.updateURL;
  }
  
  public String getUpdateVersion()
  {
    return this.updateVersion;
  }
  
  public String getZigbeeIds()
  {
    return this.zigbeeIds;
  }
  
  public void setBridgeUDN(String paramString)
  {
    this.bridgeUDN = paramString;
  }
  
  public void setCurrentVersion(String paramString)
  {
    this.currentVersion = paramString;
  }
  
  public void setDeviceType(String paramString)
  {
    this.deviceType = paramString;
  }
  
  public void setMd5(String paramString)
  {
    this.md5 = paramString;
  }
  
  public void setUniqueID(String paramString)
  {
    this.uniqueID = paramString;
  }
  
  public void setUpdateURL(String paramString)
  {
    this.updateURL = paramString;
  }
  
  public void setUpdateVersion(String paramString)
  {
    this.updateVersion = paramString;
  }
  
  public void setZigbeeIds(String paramString)
  {
    this.zigbeeIds = paramString;
  }
  
  public String toString()
  {
    return "FirmwareDetails [uniqueID=" + this.uniqueID + ", currentVersion=" + this.currentVersion + ", updateURL=" + this.updateURL + ", updateVersion=" + this.updateVersion + ", md5=" + this.md5 + ", deviceType=" + this.deviceType + ", bridgeUDN=" + this.bridgeUDN + ", zigbeeIds=" + this.zigbeeIds + "]";
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/belkin/firmware/FirmwareDetails.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */