package com.belkin.wemo.rules.data.device;

import android.text.TextUtils;
import com.belkin.wemo.cache.utils.SDKLogUtils;
import org.json.JSONException;
import org.json.JSONObject;

public class RMLed
  extends RMDBRuleDevice
{
  private String ledID;
  
  protected void calculateUiUdn()
  {
    super.calculateUiUdn();
    if ((!TextUtils.isEmpty(this.dbUdn)) && (this.dbUdn.contains("Bridge")))
    {
      String[] arrayOfString = this.dbUdn.split(":");
      if (arrayOfString.length >= 3)
      {
        this.uiUdn = (arrayOfString[0] + ":" + arrayOfString[1]);
        this.ledID = arrayOfString[2];
        SDKLogUtils.debugLog(this.TAG, "calculateUiUdn: LED ID = " + this.ledID + "; BridgeUDN = " + this.uiUdn);
      }
    }
  }
  
  public String getLedID()
  {
    return this.ledID;
  }
  
  public void setLedID(String paramString)
  {
    this.ledID = paramString;
    calculateDbUdn();
  }
  
  public JSONObject toJSON(JSONObject paramJSONObject)
    throws JSONException
  {
    super.toJSON(paramJSONObject);
    if (!TextUtils.isEmpty(this.ledID)) {
      paramJSONObject.put("ZIGBEE_DEV_ID", this.ledID);
    }
    return paramJSONObject;
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/belkin/wemo/rules/data/device/RMLed.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */