package com.belkin.wemo.rules.read.type.db;

import com.belkin.wemo.cache.utils.SDKLogUtils;
import com.belkin.wemo.rules.data.RMDBRuleType;
import com.belkin.wemo.rules.data.RMLongPressRule;
import com.belkin.wemo.rules.data.RMTargetDevice;
import com.belkin.wemo.rules.db.RMRulesDBManager;
import com.belkin.wemo.rules.db.model.RMTTargetDevices;
import com.belkin.wemo.rules.operation.db.exception.RuleDBException;
import java.util.Iterator;
import java.util.List;

public class RMLongPressRuleParser
  extends RMBaseDBRuleParser<RMLongPressRule>
{
  protected RMLongPressRule createRuleObject()
  {
    return new RMLongPressRule();
  }
  
  protected boolean extractRuleSpecificTables()
    throws RuleDBException
  {
    boolean bool = true;
    int i = ((RMLongPressRule)this.rule).getRuleId();
    List localList = RMRulesDBManager.getInstance().getTargetDevices(i);
    int j = localList.size();
    SDKLogUtils.debugLog(this.TAG, "Fetch Rules: Extracting data from TARGETDEVICES table. Rule ID: " + i + "; Target Devices Count: " + j);
    if (j > 0)
    {
      Iterator localIterator = localList.iterator();
      while (localIterator.hasNext())
      {
        RMTTargetDevices localRMTTargetDevices = (RMTTargetDevices)localIterator.next();
        int k = localRMTTargetDevices.getDeviceIndex();
        if (k != -1)
        {
          SDKLogUtils.debugLog(this.TAG, "Fetch Rules: Device Index IS NOT a TRIGGER_DEVICE_DEFAULT_INDEX. Index: " + k + "; Adding into rule object.");
          RMTargetDevice localRMTargetDevice = new RMTargetDevice();
          localRMTargetDevice.setDeviceId(localRMTTargetDevices.getDeviceID());
          localRMTargetDevice.setDeviceIndex(k);
          ((RMLongPressRule)this.rule).addTargetDevice(localRMTargetDevice);
        }
        else
        {
          SDKLogUtils.debugLog(this.TAG, "Fetch Rules: Device Index IS a TRIGGER_DEVICE_DEFAULT_INDEX. Index: " + k + "; NOT Adding into rule object.");
        }
      }
      bool = true;
    }
    return bool;
  }
  
  protected RMDBRuleType getDBRuleType()
  {
    return RMDBRuleType.LONG_PRESS;
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/belkin/wemo/rules/read/type/db/RMLongPressRuleParser.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */