package com.belkin.wemo.rules.composer.impl;

import com.belkin.wemo.cache.utils.SDKLogUtils;
import com.belkin.wemo.rules.composer.RMAbstractRuleComposer;
import com.belkin.wemo.rules.composer.callback.RMComposeRulesErrorCallback;
import com.belkin.wemo.rules.composer.callback.RMComposeRulesSuccessCallback;
import com.belkin.wemo.rules.data.RMDBRule;
import com.belkin.wemo.rules.data.RMDBRuleType;
import com.belkin.wemo.rules.data.device.RMDBRuleDevice;
import com.belkin.wemo.rules.data.device.RMLed;
import com.belkin.wemo.rules.db.RMRulesDBManager;
import com.belkin.wemo.rules.db.model.RMTRuleDevices;
import com.belkin.wemo.rules.db.model.RMTRules;
import com.belkin.wemo.rules.operation.db.exception.RuleDBException;
import java.util.Iterator;
import java.util.Set;

public abstract class RMAbstractDBRuleComposer<T extends RMDBRule>
  extends RMAbstractRuleComposer<T>
{
  public RMAbstractDBRuleComposer(T paramT)
  {
    super(paramT);
  }
  
  private void addDayRow(int paramInt, T paramT, RMDBRuleDevice paramRMDBRuleDevice, RMTRuleDevices paramRMTRuleDevices)
    throws RuleDBException
  {
    addDayRow(paramInt, paramT, paramRMDBRuleDevice, paramRMTRuleDevices, "", "");
  }
  
  private void addDayRow(int paramInt, T paramT, RMDBRuleDevice paramRMDBRuleDevice, RMTRuleDevices paramRMTRuleDevices, String paramString1, String paramString2)
    throws RuleDBException
  {
    paramRMTRuleDevices.setRuleID(paramT.getRuleId());
    paramRMTRuleDevices.setDeviceID(paramRMDBRuleDevice.getUdn());
    paramRMTRuleDevices.setGroupID(0);
    paramRMTRuleDevices.setDayID(paramInt);
    paramRMTRuleDevices.setStartTime(paramT.getStartTime());
    paramRMTRuleDevices.setEndTime(paramT.getEndTime());
    paramRMTRuleDevices.setRuleDuration(paramT.getRuleDuration());
    paramRMTRuleDevices.setStartAction(paramRMDBRuleDevice.getStartAction());
    paramRMTRuleDevices.setEndAction(paramRMDBRuleDevice.getEndAction());
    paramRMTRuleDevices.setOnModeOffset(paramRMDBRuleDevice.getOnModeOffset());
    paramRMTRuleDevices.setOffModeOffset(paramRMDBRuleDevice.getOffModeOffset());
    paramRMTRuleDevices.setZBCapabilityStart(paramString1);
    paramRMTRuleDevices.setZBCapabilityEnd(paramString2);
    addRowInsertAdditionalData(paramInt, paramT, paramRMDBRuleDevice, paramRMTRuleDevices, paramString1, paramString2);
    RMRulesDBManager.getInstance().insertRowRuleDevices(paramRMTRuleDevices);
  }
  
  private void toggleRuleState(RMComposeRulesSuccessCallback paramRMComposeRulesSuccessCallback, RMComposeRulesErrorCallback paramRMComposeRulesErrorCallback, int paramInt1, int paramInt2)
  {
    try
    {
      int i = RMRulesDBManager.getInstance().toggleRuleState(paramInt2, paramInt1);
      if (i == 1)
      {
        if (paramRMComposeRulesSuccessCallback != null) {
          paramRMComposeRulesSuccessCallback.onRulesComposed();
        }
      }
      else
      {
        SDKLogUtils.errorLog(this.TAG, "Toggling Rule State FAILED. RuleId: " + paramInt1 + "; State requested: " + paramInt2 + "; Number of rows affetced by update call: " + i);
        if (paramRMComposeRulesErrorCallback != null)
        {
          paramRMComposeRulesErrorCallback.onRulesCompositionFailed();
          return;
        }
      }
    }
    catch (RuleDBException localRuleDBException)
    {
      SDKLogUtils.errorLog(this.TAG, "Store Rule: RuleDBException while enabling rule with ruleID: " + paramInt1 + "; ", localRuleDBException);
      if (paramRMComposeRulesErrorCallback != null) {
        paramRMComposeRulesErrorCallback.onRulesCompositionFailed();
      }
    }
  }
  
  private void writeToRuleDevicesTable()
    throws RuleDBException
  {
    Iterator localIterator1 = ((RMDBRule)this.rule).getRuleDeviceSet().iterator();
    while (localIterator1.hasNext())
    {
      RMDBRuleDevice localRMDBRuleDevice = (RMDBRuleDevice)localIterator1.next();
      RMTRuleDevices localRMTRuleDevices = new RMTRuleDevices();
      Iterator localIterator2 = ((RMDBRule)this.rule).getDaySet().iterator();
      while (localIterator2.hasNext())
      {
        Integer localInteger = (Integer)localIterator2.next();
        if (localRMDBRuleDevice.getClass().equals(RMLed.class))
        {
          addDayRow(localInteger.intValue(), (RMDBRule)this.rule, localRMDBRuleDevice, localRMTRuleDevices, localRMDBRuleDevice.getZBCapabilityStartStateStr(), localRMDBRuleDevice.getZBCapabilityEndStateStr());
          addDayRow(localInteger.intValue(), (RMDBRule)this.rule, localRMDBRuleDevice, localRMTRuleDevices, localRMDBRuleDevice.getZBCapabilityStartBrightnessStr(), localRMDBRuleDevice.getZBCapabilityEndBrightnessStr());
        }
        else
        {
          addDayRow(localInteger.intValue(), (RMDBRule)this.rule, localRMDBRuleDevice, localRMTRuleDevices);
        }
      }
    }
  }
  
  private void writeToRulesTable()
    throws RuleDBException
  {
    RMTRules localRMTRules = new RMTRules();
    localRMTRules.setName(((RMDBRule)this.rule).getDisplayName());
    localRMTRules.setRuleId(String.valueOf(((RMDBRule)this.rule).getRuleId()));
    localRMTRules.setState(((RMDBRule)this.rule).getState());
    localRMTRules.setType(((RMDBRule)this.rule).getRuleType().toString());
    RMRulesDBManager.getInstance().replaceRowRules(localRMTRules);
  }
  
  public void add(RMComposeRulesSuccessCallback paramRMComposeRulesSuccessCallback, RMComposeRulesErrorCallback paramRMComposeRulesErrorCallback)
  {
    try
    {
      writeToRulesTable();
      writeToRuleDevicesTable();
      writeToAdditionalTables();
      if (paramRMComposeRulesSuccessCallback != null) {
        paramRMComposeRulesSuccessCallback.onRulesComposed();
      }
      return;
    }
    catch (RuleDBException localRuleDBException)
    {
      do
      {
        SDKLogUtils.errorLog(this.TAG, "Store Rule: RuleDBException while adding new rule in DB: ", localRuleDBException);
      } while (paramRMComposeRulesErrorCallback == null);
      paramRMComposeRulesErrorCallback.onRulesCompositionFailed();
    }
  }
  
  protected abstract void addRowInsertAdditionalData(int paramInt, T paramT, RMDBRuleDevice paramRMDBRuleDevice, RMTRuleDevices paramRMTRuleDevices, String paramString1, String paramString2);
  
  public void delete(RMComposeRulesSuccessCallback paramRMComposeRulesSuccessCallback, RMComposeRulesErrorCallback paramRMComposeRulesErrorCallback)
  {
    int i = ((RMDBRule)this.rule).getRuleId();
    do
    {
      try
      {
        if (RMRulesDBManager.getInstance().deleteRowRules(i) == 1)
        {
          RMRulesDBManager.getInstance().deleteRowRuleDevices(i);
          deleteFromAdditionalTables();
          if (paramRMComposeRulesSuccessCallback != null) {
            paramRMComposeRulesSuccessCallback.onRulesComposed();
          }
          return;
        }
      }
      catch (RuleDBException localRuleDBException)
      {
        do
        {
          SDKLogUtils.errorLog(this.TAG, "Store Rule: RuleDBException while deleting rule from DB: ", localRuleDBException);
        } while (paramRMComposeRulesErrorCallback == null);
        paramRMComposeRulesErrorCallback.onRulesCompositionFailed();
      }
    } while (paramRMComposeRulesErrorCallback == null);
    paramRMComposeRulesErrorCallback.onRulesCompositionFailed();
    return;
  }
  
  protected abstract void deleteFromAdditionalTables()
    throws RuleDBException;
  
  public void disable(RMComposeRulesSuccessCallback paramRMComposeRulesSuccessCallback, RMComposeRulesErrorCallback paramRMComposeRulesErrorCallback)
  {
    toggleRuleState(paramRMComposeRulesSuccessCallback, paramRMComposeRulesErrorCallback, ((RMDBRule)this.rule).getRuleId(), 0);
  }
  
  public void edit(RMComposeRulesSuccessCallback paramRMComposeRulesSuccessCallback, RMComposeRulesErrorCallback paramRMComposeRulesErrorCallback)
  {
    int i = ((RMDBRule)this.rule).getRuleId();
    try
    {
      RMRulesDBManager.getInstance().deleteRowRuleDevices(i);
      deleteFromAdditionalTables();
      add(paramRMComposeRulesSuccessCallback, paramRMComposeRulesErrorCallback);
      return;
    }
    catch (RuleDBException localRuleDBException)
    {
      while (paramRMComposeRulesErrorCallback == null) {}
      paramRMComposeRulesErrorCallback.onRulesCompositionFailed();
    }
  }
  
  public void enable(RMComposeRulesSuccessCallback paramRMComposeRulesSuccessCallback, RMComposeRulesErrorCallback paramRMComposeRulesErrorCallback)
  {
    toggleRuleState(paramRMComposeRulesSuccessCallback, paramRMComposeRulesErrorCallback, ((RMDBRule)this.rule).getRuleId(), 1);
  }
  
  public void reset(RMComposeRulesSuccessCallback paramRMComposeRulesSuccessCallback, RMComposeRulesErrorCallback paramRMComposeRulesErrorCallback) {}
  
  protected abstract void writeToAdditionalTables()
    throws RuleDBException;
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/belkin/wemo/rules/composer/impl/RMAbstractDBRuleComposer.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */