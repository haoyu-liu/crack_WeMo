package com.belkin.wemo.rules.composer.impl;

import com.belkin.wemo.cache.utils.SDKLogUtils;
import com.belkin.wemo.rules.data.RMLongPressRule;
import com.belkin.wemo.rules.data.RMTargetDevice;
import com.belkin.wemo.rules.data.device.RMDBRuleDevice;
import com.belkin.wemo.rules.db.RMRulesDBManager;
import com.belkin.wemo.rules.db.model.RMTRuleDevices;
import com.belkin.wemo.rules.db.model.RMTTargetDevices;
import com.belkin.wemo.rules.operation.db.exception.RuleDBException;
import java.util.Iterator;
import java.util.Set;

public class RMLongPressRuleComposer
  extends RMAbstractDBRuleComposer<RMLongPressRule>
{
  private static final int START_ACTION_AWAY_MODE = 3;
  public static final int TRIGGER_DEVICE_DEFAULT_INDEX = -1;
  
  public RMLongPressRuleComposer(RMLongPressRule paramRMLongPressRule)
  {
    super(paramRMLongPressRule);
  }
  
  protected void addRowInsertAdditionalData(int paramInt, RMLongPressRule paramRMLongPressRule, RMDBRuleDevice paramRMDBRuleDevice, RMTRuleDevices paramRMTRuleDevices, String paramString1, String paramString2) {}
  
  protected void deleteFromAdditionalTables()
    throws RuleDBException
  {
    RMRulesDBManager.getInstance().deleteRowTargetDevices(((RMLongPressRule)this.rule).getRuleId());
  }
  
  protected void writeToAdditionalTables()
    throws RuleDBException
  {
    Iterator localIterator1 = ((RMLongPressRule)this.rule).getRuleDeviceSet().iterator();
    while (localIterator1.hasNext())
    {
      RMDBRuleDevice localRMDBRuleDevice = (RMDBRuleDevice)localIterator1.next();
      int j = localRMDBRuleDevice.getStartAction();
      String str1 = localRMDBRuleDevice.getUiUdn();
      if (3 == j)
      {
        Iterator localIterator3 = ((RMLongPressRule)this.rule).getTargetDeviceSet().iterator();
        String str2;
        do
        {
          boolean bool = localIterator3.hasNext();
          k = 0;
          if (!bool) {
            break;
          }
          str2 = ((RMTargetDevice)localIterator3.next()).getDeviceId();
          SDKLogUtils.debugLog(this.TAG, "TriggerDevice Not A TargetDevice CHECK. TARGETDeviceId: " + str2 + "; TRIGGERDeviceId: " + str1);
        } while (!str2.equalsIgnoreCase(str1));
        int k = 1;
        if (k == 0)
        {
          SDKLogUtils.debugLog(this.TAG, "TriggerDevice Not A TargetDevice. ADDING Default Entry in TARGETDEVICES Table");
          RMTargetDevice localRMTargetDevice2 = new RMTargetDevice();
          localRMTargetDevice2.setDeviceId(str1);
          localRMTargetDevice2.setDeviceIndex(-1);
          ((RMLongPressRule)this.rule).addTargetDevice(localRMTargetDevice2);
        }
      }
    }
    int i = ((RMLongPressRule)this.rule).getRuleId();
    Iterator localIterator2 = ((RMLongPressRule)this.rule).getTargetDeviceSet().iterator();
    while (localIterator2.hasNext())
    {
      RMTargetDevice localRMTargetDevice1 = (RMTargetDevice)localIterator2.next();
      SDKLogUtils.debugLog(this.TAG, "Target Device Entry: DEVICE_ID: " + localRMTargetDevice1.getDeviceId() + "; DEVICE_INDEX: " + localRMTargetDevice1.getDeviceIndex() + "; RULE_ID: " + i);
      RMTTargetDevices localRMTTargetDevices = new RMTTargetDevices();
      localRMTTargetDevices.setDeviceID(localRMTargetDevice1.getDeviceId());
      localRMTTargetDevices.setDeviceIndex(localRMTargetDevice1.getDeviceIndex());
      localRMTTargetDevices.setRuleId(i);
      RMRulesDBManager.getInstance().insertRowTargetDevices(localRMTTargetDevices);
    }
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/belkin/wemo/rules/composer/impl/RMLongPressRuleComposer.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */