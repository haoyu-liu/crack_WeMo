package com.belkin.wemo.rules.read.type.db;

import com.belkin.wemo.cache.utils.SDKLogUtils;
import com.belkin.wemo.rules.data.RMAwayModeRule;
import com.belkin.wemo.rules.data.RMDBRuleType;
import com.belkin.wemo.rules.data.device.RMDBRuleDevice;
import com.belkin.wemo.rules.db.RMRulesDBManager;
import com.belkin.wemo.rules.db.model.RMTRuleDevices;
import com.belkin.wemo.rules.db.model.RMTRules;
import com.belkin.wemo.rules.operation.db.exception.RuleDBException;
import java.util.Iterator;
import java.util.List;
import java.util.Set;

public class RMAwayModeRuleParser
  extends RMBaseDBRuleParser<RMAwayModeRule>
{
  protected RMAwayModeRule createRuleObject()
  {
    return new RMAwayModeRule();
  }
  
  protected boolean extractRuleDevicesTable(RMTRules paramRMTRules)
    throws RuleDBException
  {
    int i = ((RMAwayModeRule)this.rule).getRuleId();
    List localList = RMRulesDBManager.getInstance().getRuleDevices(i);
    SDKLogUtils.debugLog(this.TAG, "extractRule: Rule ID = " + i + "; RULEDEVICES entries count = " + localList.size());
    if (localList.size() > 0)
    {
      Iterator localIterator1 = localList.iterator();
      while (localIterator1.hasNext())
      {
        RMTRuleDevices localRMTRuleDevices = (RMTRuleDevices)localIterator1.next();
        String str = localRMTRuleDevices.getDeviceID();
        Iterator localIterator2 = ((RMAwayModeRule)this.rule).getRuleDeviceSet().iterator();
        for (;;)
        {
          if (localIterator2.hasNext()) {
            if (((RMDBRuleDevice)localIterator2.next()).getUdn().equals(str))
            {
              SDKLogUtils.debugLog(this.TAG, "Entry already added in rule object for AWAY MODE DEVICE. UDN = " + str + "; Extracting day ID and moving to next row.");
              ((RMAwayModeRule)this.rule).addDay(Integer.valueOf(extractRuleDay(localRMTRuleDevices)));
              break;
            }
          }
        }
        RMDBRuleDevice localRMDBRuleDevice = new RMDBRuleDevice();
        fillRuleDeviceDetails(localRMTRuleDevices, localRMDBRuleDevice);
        ((RMAwayModeRule)this.rule).addRuleDevice(localRMDBRuleDevice);
        ((RMAwayModeRule)this.rule).addDay(Integer.valueOf(extractRuleDay(localRMTRuleDevices)));
        ((RMAwayModeRule)this.rule).setStartTime(localRMTRuleDevices.getStartTime());
        ((RMAwayModeRule)this.rule).setEndTime(localRMTRuleDevices.getEndTime());
        ((RMAwayModeRule)this.rule).setRuleDuration(localRMTRuleDevices.getRuleDuration());
        SDKLogUtils.debugLog(this.TAG, "Extracted TARGET DEVICE ENTRY: DEVICE_ID = " + localRMDBRuleDevice.getUdn());
      }
    }
    return true;
  }
  
  protected boolean extractRuleSpecificTables()
  {
    return true;
  }
  
  protected RMDBRuleType getDBRuleType()
  {
    return RMDBRuleType.AWAY_MODE;
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/belkin/wemo/rules/read/type/db/RMAwayModeRuleParser.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */