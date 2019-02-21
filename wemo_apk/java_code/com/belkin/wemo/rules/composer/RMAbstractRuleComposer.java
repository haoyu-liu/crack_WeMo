package com.belkin.wemo.rules.composer;

import com.belkin.wemo.rules.composer.callback.RMComposeRulesErrorCallback;
import com.belkin.wemo.rules.composer.callback.RMComposeRulesSuccessCallback;
import com.belkin.wemo.rules.data.RMRule;

public abstract class RMAbstractRuleComposer<T extends RMRule>
{
  protected final String TAG;
  protected T rule;
  
  public RMAbstractRuleComposer(T paramT)
  {
    this.rule = paramT;
    this.TAG = getClass().getSimpleName();
  }
  
  public abstract void add(RMComposeRulesSuccessCallback paramRMComposeRulesSuccessCallback, RMComposeRulesErrorCallback paramRMComposeRulesErrorCallback);
  
  public abstract void delete(RMComposeRulesSuccessCallback paramRMComposeRulesSuccessCallback, RMComposeRulesErrorCallback paramRMComposeRulesErrorCallback);
  
  public abstract void disable(RMComposeRulesSuccessCallback paramRMComposeRulesSuccessCallback, RMComposeRulesErrorCallback paramRMComposeRulesErrorCallback);
  
  public abstract void edit(RMComposeRulesSuccessCallback paramRMComposeRulesSuccessCallback, RMComposeRulesErrorCallback paramRMComposeRulesErrorCallback);
  
  public abstract void enable(RMComposeRulesSuccessCallback paramRMComposeRulesSuccessCallback, RMComposeRulesErrorCallback paramRMComposeRulesErrorCallback);
  
  public abstract void reset(RMComposeRulesSuccessCallback paramRMComposeRulesSuccessCallback, RMComposeRulesErrorCallback paramRMComposeRulesErrorCallback);
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/belkin/wemo/rules/composer/RMAbstractRuleComposer.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */