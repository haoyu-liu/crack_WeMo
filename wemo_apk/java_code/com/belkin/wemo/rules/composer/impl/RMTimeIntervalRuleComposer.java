package com.belkin.wemo.rules.composer.impl;

import com.belkin.wemo.rules.data.RMSimpleSwitchRule;
import com.belkin.wemo.rules.data.device.RMDBRuleDevice;
import com.belkin.wemo.rules.db.model.RMTRuleDevices;
import com.belkin.wemo.rules.operation.db.exception.RuleDBException;

public class RMTimeIntervalRuleComposer
  extends RMAbstractDBRuleComposer<RMSimpleSwitchRule>
{
  public RMTimeIntervalRuleComposer(RMSimpleSwitchRule paramRMSimpleSwitchRule)
  {
    super(paramRMSimpleSwitchRule);
  }
  
  protected void addRowInsertAdditionalData(int paramInt, RMSimpleSwitchRule paramRMSimpleSwitchRule, RMDBRuleDevice paramRMDBRuleDevice, RMTRuleDevices paramRMTRuleDevices, String paramString1, String paramString2)
  {
    paramRMTRuleDevices.setZBCapabilityEnd(paramString2);
    paramRMTRuleDevices.setOffModeOffset(paramRMDBRuleDevice.getOffModeOffset());
  }
  
  protected void deleteFromAdditionalTables()
    throws RuleDBException
  {}
  
  protected void writeToAdditionalTables()
    throws RuleDBException
  {}
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/belkin/wemo/rules/composer/impl/RMTimeIntervalRuleComposer.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */