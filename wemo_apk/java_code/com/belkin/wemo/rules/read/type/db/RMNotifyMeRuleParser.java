package com.belkin.wemo.rules.read.type.db;

import com.belkin.wemo.cache.utils.SDKLogUtils;
import com.belkin.wemo.rules.data.RMDBRuleType;
import com.belkin.wemo.rules.data.RMNotifyMeRule;
import com.belkin.wemo.rules.data.device.RMDBRuleDevice;
import com.belkin.wemo.rules.db.RMRulesDBManager;
import com.belkin.wemo.rules.db.model.RMTRuleDevices;
import com.belkin.wemo.rules.db.model.RMTRules;
import com.belkin.wemo.rules.db.model.RMTSensorNotification;
import com.belkin.wemo.rules.operation.db.exception.RuleDBException;
import java.util.Iterator;
import java.util.List;
import java.util.Set;

public class RMNotifyMeRuleParser
  extends RMBaseDBRuleParser<RMNotifyMeRule>
{
  protected RMNotifyMeRule createRuleObject()
  {
    return new RMNotifyMeRule();
  }
  
  protected boolean extractRuleDevicesTable(RMTRules paramRMTRules)
    throws RuleDBException
  {
    int i = ((RMNotifyMeRule)this.rule).getRuleId();
    List localList = RMRulesDBManager.getInstance().getRuleDevices(i);
    SDKLogUtils.debugLog(this.TAG, "extractRule: Rule ID = " + i + "; RULEDEVICES entries count = " + localList.size());
    if (localList.size() > 0)
    {
      Iterator localIterator1 = localList.iterator();
      while (localIterator1.hasNext())
      {
        RMTRuleDevices localRMTRuleDevices = (RMTRuleDevices)localIterator1.next();
        String str = localRMTRuleDevices.getDeviceID();
        Iterator localIterator2 = ((RMNotifyMeRule)this.rule).getRuleDeviceSet().iterator();
        for (;;)
        {
          if (localIterator2.hasNext()) {
            if (((RMDBRuleDevice)localIterator2.next()).getUdn().equals(str))
            {
              SDKLogUtils.debugLog(this.TAG, "Entry already added in rule object for Notify Me DEVICE. UDN = " + str + "; Extracting day ID and moving to next row.");
              ((RMNotifyMeRule)this.rule).addDay(Integer.valueOf(extractRuleDay(localRMTRuleDevices)));
              break;
            }
          }
        }
        RMDBRuleDevice localRMDBRuleDevice = new RMDBRuleDevice();
        fillRuleDeviceDetails(localRMTRuleDevices, localRMDBRuleDevice);
        ((RMNotifyMeRule)this.rule).addRuleDevice(localRMDBRuleDevice);
        ((RMNotifyMeRule)this.rule).addDay(Integer.valueOf(extractRuleDay(localRMTRuleDevices)));
        ((RMNotifyMeRule)this.rule).setStartTime(localRMTRuleDevices.getStartTime());
        ((RMNotifyMeRule)this.rule).setEndTime(localRMTRuleDevices.getEndTime());
        ((RMNotifyMeRule)this.rule).setRuleDuration(localRMTRuleDevices.getRuleDuration());
        SDKLogUtils.debugLog(this.TAG, "Extracted TARGET DEVICE ENTRY: DEVICE_ID = " + localRMDBRuleDevice.getUdn());
      }
    }
    return true;
  }
  
  protected boolean extractRuleSpecificTables()
    throws RuleDBException
  {
    boolean bool = true;
    int i = ((RMNotifyMeRule)this.rule).getRuleId();
    List localList = RMRulesDBManager.getInstance().getSensorNotification(i);
    int j = localList.size();
    SDKLogUtils.debugLog(this.TAG, "Fetch Rules: Extracting data from TARGETDEVICES table. Rule ID: " + i + "; Target Devices Count: " + j);
    if (j > 0)
    {
      Iterator localIterator = localList.iterator();
      while (localIterator.hasNext())
      {
        RMTSensorNotification localRMTSensorNotification = (RMTSensorNotification)localIterator.next();
        ((RMNotifyMeRule)this.rule).setNotificationDuration(localRMTSensorNotification.getNotificationDuration());
        ((RMNotifyMeRule)this.rule).setNotificationMsg(localRMTSensorNotification.getNotificationMessage());
        ((RMNotifyMeRule)this.rule).setNotifyRuleID(localRMTSensorNotification.getNotifyRuleID());
      }
      bool = true;
    }
    return bool;
  }
  
  protected RMDBRuleType getDBRuleType()
  {
    return RMDBRuleType.NOTIFY_ME;
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/belkin/wemo/rules/read/type/db/RMNotifyMeRuleParser.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */