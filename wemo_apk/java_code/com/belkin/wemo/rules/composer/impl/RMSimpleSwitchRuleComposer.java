package com.belkin.wemo.rules.composer.impl;

import com.belkin.wemo.rules.data.RMSimpleSwitchRule;
import com.belkin.wemo.rules.data.device.RMDBRuleDevice;
import com.belkin.wemo.rules.db.model.RMTRuleDevices;
import com.belkin.wemo.rules.operation.db.exception.RuleDBException;

public class RMSimpleSwitchRuleComposer
  extends RMAbstractDBRuleComposer<RMSimpleSwitchRule>
{
  public RMSimpleSwitchRuleComposer(RMSimpleSwitchRule paramRMSimpleSwitchRule)
  {
    super(paramRMSimpleSwitchRule);
  }
  
  protected void addRowInsertAdditionalData(int paramInt, RMSimpleSwitchRule paramRMSimpleSwitchRule, RMDBRuleDevice paramRMDBRuleDevice, RMTRuleDevices paramRMTRuleDevices, String paramString1, String paramString2) {}
  
  protected void deleteFromAdditionalTables()
    throws RuleDBException
  {}
  
  protected void writeToAdditionalTables()
    throws RuleDBException
  {}
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/belkin/wemo/rules/composer/impl/RMSimpleSwitchRuleComposer.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */