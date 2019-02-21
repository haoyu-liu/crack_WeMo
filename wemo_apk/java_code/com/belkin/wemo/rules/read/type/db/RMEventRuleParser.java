package com.belkin.wemo.rules.read.type.db;

import com.belkin.wemo.cache.utils.SDKLogUtils;
import com.belkin.wemo.rules.data.RMDBRuleType;
import com.belkin.wemo.rules.data.RMEventRule;
import com.belkin.wemo.rules.data.RMSensorDevice;
import com.belkin.wemo.rules.data.device.RMDBRuleDevice;
import com.belkin.wemo.rules.db.RMRulesDBManager;
import com.belkin.wemo.rules.db.model.RMTRuleDevices;
import com.belkin.wemo.rules.db.model.RMTRules;
import com.belkin.wemo.rules.operation.db.exception.RuleDBException;
import java.util.Iterator;
import java.util.List;
import java.util.Set;

public class RMEventRuleParser
  extends RMBaseDBRuleParser<RMEventRule>
{
  private boolean extractTargetDevice(RMTRuleDevices paramRMTRuleDevices)
  {
    String str = paramRMTRuleDevices.getDeviceID();
    Iterator localIterator = ((RMEventRule)this.rule).getRuleDeviceSet().iterator();
    while (localIterator.hasNext()) {
      if (((RMDBRuleDevice)localIterator.next()).getUdn().equals(str))
      {
        SDKLogUtils.debugLog(this.TAG, "Entry already added in rule object for TARGET DEVICE. UDN = " + str + "; Moving to next row.");
        return true;
      }
    }
    RMDBRuleDevice localRMDBRuleDevice = new RMDBRuleDevice();
    fillRuleDeviceDetails(paramRMTRuleDevices, localRMDBRuleDevice);
    ((RMEventRule)this.rule).addRuleDevice(localRMDBRuleDevice);
    SDKLogUtils.debugLog(this.TAG, "Extracted TARGET DEVICE ENTRY: DEVICE_ID = " + localRMDBRuleDevice.getUdn());
    return true;
  }
  
  private boolean extractTriggerDevice(RMTRuleDevices paramRMTRuleDevices)
  {
    ((RMEventRule)this.rule).setStartTime(paramRMTRuleDevices.getStartTime());
    ((RMEventRule)this.rule).setEndTime(paramRMTRuleDevices.getEndTime());
    ((RMEventRule)this.rule).setRuleDuration(paramRMTRuleDevices.getRuleDuration());
    RMSensorDevice localRMSensorDevice = new RMSensorDevice();
    ((RMEventRule)this.rule).addSensorDevice(localRMSensorDevice);
    localRMSensorDevice.setValue(paramRMTRuleDevices.getValue());
    localRMSensorDevice.setLevel(paramRMTRuleDevices.getLevel());
    localRMSensorDevice.setSensorDuration(paramRMTRuleDevices.getSensorDuration());
    localRMSensorDevice.setType(paramRMTRuleDevices.getType());
    fillRuleDeviceDetails(paramRMTRuleDevices, localRMSensorDevice);
    ((RMEventRule)this.rule).addDay(Integer.valueOf(extractRuleDay(paramRMTRuleDevices)));
    SDKLogUtils.debugLog(this.TAG, "Extracted SENSOR DEVICE ENTRY: DEVICE_ID = " + localRMSensorDevice.getUdn());
    return true;
  }
  
  protected RMEventRule createRuleObject()
  {
    return new RMEventRule();
  }
  
  protected boolean extractRuleDevicesTable(RMTRules paramRMTRules)
    throws RuleDBException
  {
    boolean bool = true;
    int i = ((RMEventRule)this.rule).getRuleId();
    List localList = RMRulesDBManager.getInstance().getRuleDevices(i);
    SDKLogUtils.debugLog(this.TAG, "extractRule: Rule ID = " + i + "; RULEDEVICES entries count = " + localList.size());
    Iterator localIterator;
    if (localList.size() > 0) {
      localIterator = localList.iterator();
    }
    for (;;)
    {
      RMTRuleDevices localRMTRuleDevices;
      if (localIterator.hasNext())
      {
        localRMTRuleDevices = (RMTRuleDevices)localIterator.next();
        int j = localRMTRuleDevices.getType();
        int k = localRMTRuleDevices.getSensorDuration();
        if ((j != 5) || (k != 1)) {
          break label143;
        }
      }
      label143:
      for (bool = extractTriggerDevice(localRMTRuleDevices); !bool; bool = extractTargetDevice(localRMTRuleDevices)) {
        return bool;
      }
    }
  }
  
  protected boolean extractRuleSpecificTables()
  {
    return true;
  }
  
  protected RMDBRuleType getDBRuleType()
  {
    return RMDBRuleType.EVENT_RULE;
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/belkin/wemo/rules/read/type/db/RMEventRuleParser.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */