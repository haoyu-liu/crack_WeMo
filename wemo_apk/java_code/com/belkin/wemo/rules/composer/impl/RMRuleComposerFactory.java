package com.belkin.wemo.rules.composer.impl;

import com.belkin.wemo.rules.composer.RMAbstractRuleComposer;
import com.belkin.wemo.rules.data.RMCountdownTimerRule;
import com.belkin.wemo.rules.data.RMLongPressRule;
import com.belkin.wemo.rules.data.RMRule;
import com.belkin.wemo.rules.data.RMSimpleSwitchRule;

public enum RMRuleComposerFactory
{
  static
  {
    RMRuleComposerFactory[] arrayOfRMRuleComposerFactory = new RMRuleComposerFactory[1];
    arrayOfRMRuleComposerFactory[0] = INSTANCE;
    $VALUES = arrayOfRMRuleComposerFactory;
  }
  
  private RMRuleComposerFactory() {}
  
  private RMAbstractRuleComposer<? extends RMRule> getDBRuleComposer(RMRule paramRMRule)
  {
    switch (((com.belkin.wemo.rules.data.RMDBRule)paramRMRule).getRuleType())
    {
    case ???: 
    case ???: 
    case ???: 
    case ???: 
    case ???: 
    case ???: 
    case ???: 
    case ???: 
    default: 
      return null;
    case ???: 
      return new RMSimpleSwitchRuleComposer((RMSimpleSwitchRule)paramRMRule);
    case ???: 
      return new RMCountdownTimerRuleComposer((RMCountdownTimerRule)paramRMRule);
    }
    return new RMLongPressRuleComposer((RMLongPressRule)paramRMRule);
  }
  
  public RMAbstractRuleComposer<? extends RMRule> getInstance(RMRule paramRMRule)
  {
    switch (paramRMRule.getRulesType())
    {
    case 1: 
    default: 
      return null;
    }
    return getDBRuleComposer(paramRMRule);
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/belkin/wemo/rules/composer/impl/RMRuleComposerFactory.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */