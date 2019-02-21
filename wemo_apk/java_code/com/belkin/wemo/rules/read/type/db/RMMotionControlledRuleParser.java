package com.belkin.wemo.rules.read.type.db;

import com.belkin.wemo.cache.utils.SDKLogUtils;
import com.belkin.wemo.rules.data.RMDBRuleType;
import com.belkin.wemo.rules.data.RMMotionControlledRule;
import com.belkin.wemo.rules.data.RMSensorDevice;
import com.belkin.wemo.rules.data.RMSensorTargetDevice;
import com.belkin.wemo.rules.db.RMRulesDBManager;
import com.belkin.wemo.rules.db.model.RMTRuleDevices;
import com.belkin.wemo.rules.db.model.RMTRules;
import com.belkin.wemo.rules.operation.db.exception.RuleDBException;
import java.util.Iterator;
import java.util.List;
import java.util.Set;

public class RMMotionControlledRuleParser
  extends RMBaseDBRuleParser<RMMotionControlledRule>
{
  private boolean extractTargetDevice(RMTRuleDevices paramRMTRuleDevices)
  {
    String str = paramRMTRuleDevices.getDeviceID();
    Iterator localIterator = ((RMMotionControlledRule)this.rule).getSensorTargetDeviceSet().iterator();
    while (localIterator.hasNext()) {
      if (((RMSensorTargetDevice)localIterator.next()).getUdn().equals(str))
      {
        SDKLogUtils.debugLog(this.TAG, "Entry already added in rule object for SESNOR TARGET DEVICE. UDN = " + str + "; Extracting day ID and moving to next row.");
        ((RMMotionControlledRule)this.rule).addDay(Integer.valueOf(extractRuleDay(paramRMTRuleDevices)));
        return true;
      }
    }
    RMSensorTargetDevice localRMSensorTargetDevice = new RMSensorTargetDevice();
    localRMSensorTargetDevice.setSensorDuration(paramRMTRuleDevices.getSensorDuration());
    fillRuleDeviceDetails(paramRMTRuleDevices, localRMSensorTargetDevice);
    ((RMMotionControlledRule)this.rule).addSensorTargetDevice(localRMSensorTargetDevice);
    ((RMMotionControlledRule)this.rule).addDay(Integer.valueOf(extractRuleDay(paramRMTRuleDevices)));
    SDKLogUtils.debugLog(this.TAG, "Extracted TARGET DEVICE ENTRY: DEVICE_ID = " + localRMSensorTargetDevice.getUdn());
    return true;
  }
  
  private boolean extractTriggerDevice(RMTRuleDevices paramRMTRuleDevices)
  {
    ((RMMotionControlledRule)this.rule).setStartTime(paramRMTRuleDevices.getStartTime());
    ((RMMotionControlledRule)this.rule).setEndTime(paramRMTRuleDevices.getEndTime());
    ((RMMotionControlledRule)this.rule).setRuleDuration(paramRMTRuleDevices.getRuleDuration());
    RMSensorDevice localRMSensorDevice = new RMSensorDevice();
    ((RMMotionControlledRule)this.rule).addRuleDevice(localRMSensorDevice);
    localRMSensorDevice.setValue(paramRMTRuleDevices.getValue());
    localRMSensorDevice.setLevel(paramRMTRuleDevices.getLevel());
    localRMSensorDevice.setSensorDuration(paramRMTRuleDevices.getSensorDuration());
    localRMSensorDevice.setType(paramRMTRuleDevices.getType());
    fillRuleDeviceDetails(paramRMTRuleDevices, localRMSensorDevice);
    SDKLogUtils.debugLog(this.TAG, "Extracted SENSOR DEVICE ENTRY: DEVICE_ID = " + localRMSensorDevice.getUdn());
    return true;
  }
  
  private boolean isSensorDevice(RMTRuleDevices paramRMTRuleDevices)
  {
    int i = paramRMTRuleDevices.getType();
    int j = paramRMTRuleDevices.getSensorDuration();
    int k = extractRuleDay(paramRMTRuleDevices);
    boolean bool = false;
    if (i == 0)
    {
      bool = false;
      if (j == -1)
      {
        bool = false;
        if (-1 == k) {
          bool = true;
        }
      }
    }
    return bool;
  }
  
  protected RMMotionControlledRule createRuleObject()
  {
    return new RMMotionControlledRule();
  }
  
  protected boolean extractRuleDevicesTable(RMTRules paramRMTRules)
    throws RuleDBException
  {
    boolean bool = true;
    int i = ((RMMotionControlledRule)this.rule).getRuleId();
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
        if (!isSensorDevice(localRMTRuleDevices)) {
          break label126;
        }
      }
      label126:
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
    return RMDBRuleType.MOTION_CONTROLLED;
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/belkin/wemo/rules/read/type/db/RMMotionControlledRuleParser.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */