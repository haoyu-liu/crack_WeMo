package com.belkin.wemo.rules.data;

import android.text.TextUtils;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.Set;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

public class RMLongPressRule
  extends RMDBRule
{
  public static final int ACTION_AWAY_MODE = 3;
  private Set<RMTargetDevice> targetDeviceSet;
  
  public RMLongPressRule()
  {
    setLongPressProperties();
  }
  
  public RMLongPressRule(int paramInt1, RMDBRuleType paramRMDBRuleType, int paramInt2, int paramInt3, String paramString, HashMap<String, ArrayList<Integer>> paramHashMap, float paramFloat, int paramInt4, int paramInt5, int paramInt6, int paramInt7, long paramLong)
  {
    super(paramInt1, paramRMDBRuleType, paramInt2, paramInt3, paramString, paramHashMap, paramInt4, paramInt5, paramInt6, paramInt7, paramLong);
    setLongPressProperties();
  }
  
  private void setLongPressProperties()
  {
    this.startTime = 60;
    this.endTime = 86400;
    this.ruleDuration = 86340;
    addDay(Integer.valueOf(-1));
    this.targetDeviceSet = new HashSet();
  }
  
  public boolean addTargetDevice(RMTargetDevice paramRMTargetDevice)
  {
    return this.targetDeviceSet.add(paramRMTargetDevice);
  }
  
  public boolean addTargetDevice(String paramString)
  {
    boolean bool1 = TextUtils.isEmpty(paramString);
    boolean bool2 = false;
    if (!bool1)
    {
      RMTargetDevice localRMTargetDevice = new RMTargetDevice();
      localRMTargetDevice.setDeviceId(paramString);
      localRMTargetDevice.setDeviceIndex(this.targetDeviceSet.size());
      bool2 = this.targetDeviceSet.add(localRMTargetDevice);
    }
    return bool2;
  }
  
  protected RMDBRuleType assignDBRuleType()
  {
    return RMDBRuleType.LONG_PRESS;
  }
  
  public Set<RMTargetDevice> getTargetDeviceSet()
  {
    return this.targetDeviceSet;
  }
  
  public boolean removeTargetDevice(String paramString)
  {
    Iterator localIterator = this.targetDeviceSet.iterator();
    RMTargetDevice localRMTargetDevice;
    do
    {
      boolean bool1 = localIterator.hasNext();
      bool2 = false;
      if (!bool1) {
        break;
      }
      localRMTargetDevice = (RMTargetDevice)localIterator.next();
    } while (!paramString.equals(localRMTargetDevice.getDeviceId()));
    boolean bool2 = this.targetDeviceSet.remove(localRMTargetDevice);
    return bool2;
  }
  
  public void setTargetDeviceSet(Set<RMTargetDevice> paramSet)
  {
    this.targetDeviceSet = paramSet;
  }
  
  public JSONObject toJSON(JSONObject paramJSONObject)
    throws JSONException
  {
    super.toJSON(paramJSONObject);
    JSONArray localJSONArray = new JSONArray();
    Iterator localIterator = this.targetDeviceSet.iterator();
    while (localIterator.hasNext()) {
      localJSONArray.put(((RMTargetDevice)localIterator.next()).toJSONObject(new JSONObject()));
    }
    paramJSONObject.put("TARGET_DEV_ARR", localJSONArray);
    return paramJSONObject;
  }
  
  public String toString()
  {
    String str = null;
    Iterator localIterator = this.targetDeviceSet.iterator();
    while (localIterator.hasNext())
    {
      RMTargetDevice localRMTargetDevice = (RMTargetDevice)localIterator.next();
      str = str + localRMTargetDevice.toString();
    }
    return super.toString() + "; TARGET_DEVICES: " + str;
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/belkin/wemo/rules/data/RMLongPressRule.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */