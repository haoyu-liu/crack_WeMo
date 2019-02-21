package com.belkin.wemo.rules.data.device;

import org.json.JSONException;
import org.json.JSONObject;

public class RMDBRuleDevice
{
  protected final String TAG = getClass().getSimpleName();
  protected String dbUdn = "";
  private int endAction = -1;
  private int offModeOffset = -1;
  private int onModeOffset = -1;
  private int ruleDuration;
  private int startAction = -1;
  protected String uiUdn = "";
  private String zbCapabilityEnd = "";
  private String zbCapabilityStart = "";
  
  protected void calculateDbUdn()
  {
    this.dbUdn = this.uiUdn;
  }
  
  protected void calculateUiUdn()
  {
    this.uiUdn = this.dbUdn;
  }
  
  public boolean equals(Object paramObject)
  {
    if (this == paramObject) {}
    RMDBRuleDevice localRMDBRuleDevice;
    do
    {
      do
      {
        return true;
        if (paramObject == null) {
          return false;
        }
        if (getClass() != paramObject.getClass()) {
          return false;
        }
        localRMDBRuleDevice = (RMDBRuleDevice)paramObject;
        if (this.dbUdn == null)
        {
          if (localRMDBRuleDevice.dbUdn != null) {
            return false;
          }
        }
        else if (!this.dbUdn.equals(localRMDBRuleDevice.dbUdn)) {
          return false;
        }
        if (this.endAction != localRMDBRuleDevice.endAction) {
          return false;
        }
        if (this.offModeOffset != localRMDBRuleDevice.offModeOffset) {
          return false;
        }
        if (this.onModeOffset != localRMDBRuleDevice.onModeOffset) {
          return false;
        }
        if (this.startAction != localRMDBRuleDevice.startAction) {
          return false;
        }
        if (this.uiUdn == null)
        {
          if (localRMDBRuleDevice.uiUdn != null) {
            return false;
          }
        }
        else if (!this.uiUdn.equals(localRMDBRuleDevice.uiUdn)) {
          return false;
        }
        if (this.zbCapabilityEnd == null)
        {
          if (localRMDBRuleDevice.zbCapabilityEnd != null) {
            return false;
          }
        }
        else if (!this.zbCapabilityEnd.equals(localRMDBRuleDevice.zbCapabilityEnd)) {
          return false;
        }
        if (this.zbCapabilityStart != null) {
          break;
        }
      } while (localRMDBRuleDevice.zbCapabilityStart == null);
      return false;
    } while (this.zbCapabilityStart.equals(localRMDBRuleDevice.zbCapabilityStart));
    return false;
  }
  
  protected void extractZBCapabilityEnd(String paramString) {}
  
  protected void extractZBCapabilityStart(String paramString) {}
  
  public int getEndAction()
  {
    return this.endAction;
  }
  
  public int getOffModeOffset()
  {
    return this.offModeOffset;
  }
  
  public int getOnModeOffset()
  {
    return this.onModeOffset;
  }
  
  public int getRuleDuration()
  {
    return this.ruleDuration;
  }
  
  public int getStartAction()
  {
    return this.startAction;
  }
  
  public String getUdn()
  {
    return this.dbUdn;
  }
  
  public String getUiUdn()
  {
    return this.uiUdn;
  }
  
  public String getZBCapabilityEndBrightnessStr()
  {
    return "";
  }
  
  public String getZBCapabilityEndStateStr()
  {
    return "";
  }
  
  public String getZBCapabilityStartBrightnessStr()
  {
    return "";
  }
  
  public String getZBCapabilityStartStateStr()
  {
    return "";
  }
  
  public String getZbCapabilityEnd()
  {
    return this.zbCapabilityEnd;
  }
  
  public String getZbCapabilityStart()
  {
    return this.zbCapabilityStart;
  }
  
  public int hashCode()
  {
    int i;
    int k;
    label58:
    int n;
    label76:
    int i1;
    int i2;
    if (this.dbUdn == null)
    {
      i = 0;
      int j = 31 * (31 * (31 * (31 * (31 * (i + 31) + this.endAction) + this.offModeOffset) + this.onModeOffset) + this.startAction);
      if (this.uiUdn != null) {
        break label117;
      }
      k = 0;
      int m = 31 * (j + k);
      if (this.zbCapabilityEnd != null) {
        break label128;
      }
      n = 0;
      i1 = 31 * (m + n);
      String str = this.zbCapabilityStart;
      i2 = 0;
      if (str != null) {
        break label140;
      }
    }
    for (;;)
    {
      return i1 + i2;
      i = this.dbUdn.hashCode();
      break;
      label117:
      k = this.uiUdn.hashCode();
      break label58;
      label128:
      n = this.zbCapabilityEnd.hashCode();
      break label76;
      label140:
      i2 = this.zbCapabilityStart.hashCode();
    }
  }
  
  public void setEndAction(int paramInt)
  {
    this.endAction = paramInt;
  }
  
  public void setOffModeOffset(int paramInt)
  {
    this.offModeOffset = paramInt;
  }
  
  public void setOnModeOffset(int paramInt)
  {
    this.onModeOffset = paramInt;
  }
  
  public void setRuleDuration(int paramInt)
  {
    this.ruleDuration = paramInt;
  }
  
  public void setStartAction(int paramInt)
  {
    this.startAction = paramInt;
  }
  
  public void setUdn(String paramString)
  {
    this.dbUdn = paramString;
    calculateUiUdn();
  }
  
  public void setUiUdn(String paramString)
  {
    this.uiUdn = paramString;
    calculateDbUdn();
  }
  
  public void setZbCapabilityEnd(String paramString)
  {
    this.zbCapabilityEnd = paramString;
    extractZBCapabilityStart(paramString);
  }
  
  public void setZbCapabilityStart(String paramString)
  {
    this.zbCapabilityStart = paramString;
    extractZBCapabilityStart(paramString);
  }
  
  public JSONObject toJSON(JSONObject paramJSONObject)
    throws JSONException
  {
    paramJSONObject.put("UDN", this.uiUdn);
    paramJSONObject.put("START_ACTION", this.startAction);
    paramJSONObject.put("END_ACTION", this.endAction);
    return paramJSONObject;
  }
  
  public String toString()
  {
    return "{DB_UDN: " + this.dbUdn + ", UI_UDN: " + this.uiUdn + ", START_ACTION: " + this.startAction + ", END_ACTION: " + this.endAction + ", ZB_CAB_START: " + this.zbCapabilityStart + ", ZB_CAP_END" + this.zbCapabilityEnd + "}";
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/belkin/wemo/rules/data/device/RMDBRuleDevice.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */