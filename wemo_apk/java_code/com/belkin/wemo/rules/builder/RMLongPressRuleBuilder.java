package com.belkin.wemo.rules.builder;

import com.belkin.wemo.rules.data.RMLongPressRule;
import com.belkin.wemo.rules.data.RMTargetDevice;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

class RMLongPressRuleBuilder
  extends RMAbstractDBRuleBuilder<RMLongPressRule>
{
  public RMLongPressRuleBuilder(JSONObject paramJSONObject)
  {
    super(paramJSONObject);
  }
  
  private void addTargetDevices()
    throws JSONException
  {
    JSONArray localJSONArray = this.ruleJO.getJSONArray("TARGET_DEV_ARR");
    int i = localJSONArray.length();
    for (int j = 0; j < i; j++)
    {
      JSONObject localJSONObject = localJSONArray.getJSONObject(j);
      String str = localJSONObject.getString("DEVICE_ID");
      int k = localJSONObject.getInt("DEVICE_INDEX");
      RMTargetDevice localRMTargetDevice = new RMTargetDevice();
      localRMTargetDevice.setDeviceId(str);
      localRMTargetDevice.setDeviceIndex(k);
      ((RMLongPressRule)this.rule).addTargetDevice(localRMTargetDevice);
    }
  }
  
  protected void addRuleDetails()
    throws JSONException
  {
    super.addRuleDetails();
    addTargetDevices();
  }
  
  public RMLongPressRule instantiateRule()
  {
    return new RMLongPressRule();
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/belkin/wemo/rules/builder/RMLongPressRuleBuilder.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */