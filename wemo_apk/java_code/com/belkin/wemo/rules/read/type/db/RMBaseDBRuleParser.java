package com.belkin.wemo.rules.read.type.db;

import com.belkin.wemo.cache.utils.SDKLogUtils;
import com.belkin.wemo.rules.data.RMDBRule;
import com.belkin.wemo.rules.data.RMDBRuleType;
import com.belkin.wemo.rules.data.device.RMDBRuleDevice;
import com.belkin.wemo.rules.data.device.RMLed;
import com.belkin.wemo.rules.db.RMRulesDBManager;
import com.belkin.wemo.rules.db.model.RMTRuleDevices;
import com.belkin.wemo.rules.db.model.RMTRules;
import com.belkin.wemo.rules.operation.db.exception.RuleDBException;
import com.belkin.wemo.rules.read.type.callback.RMExtractRuleSuccessCallback;
import com.belkin.wemo.rules.read.type.callback.RMExtractRulesErrorCallback;
import com.belkin.wemo.rules.read.type.error.RMParseRuleError;
import java.util.Iterator;
import java.util.List;

public abstract class RMBaseDBRuleParser<T extends RMDBRule>
  implements RMIDBRuleParser
{
  protected final String TAG = getClass().getSimpleName();
  protected T rule = createRuleObject();
  
  private void extractRulesTable(RMTRules paramRMTRules)
  {
    this.rule.setRuleId(Integer.valueOf(paramRMTRules.getRuleId()).intValue());
    this.rule.setRuleType(getDBRuleType());
    this.rule.setRulesType(2);
    this.rule.setState(paramRMTRules.getState());
    this.rule.setDisplayName(paramRMTRules.getName());
  }
  
  protected abstract T createRuleObject();
  
  public void extractRule(RMTRules paramRMTRules, RMExtractRuleSuccessCallback paramRMExtractRuleSuccessCallback, RMExtractRulesErrorCallback paramRMExtractRulesErrorCallback)
  {
    try
    {
      extractRulesTable(paramRMTRules);
      if (extractRuleDevicesTable(paramRMTRules))
      {
        if (extractRuleSpecificTables())
        {
          if (paramRMExtractRuleSuccessCallback == null) {
            return;
          }
          paramRMExtractRuleSuccessCallback.onRuleParsed(this.rule);
          return;
        }
        if (paramRMExtractRulesErrorCallback == null) {
          return;
        }
        paramRMExtractRulesErrorCallback.onInvalidRuleFound(new RMParseRuleError(506, "Rule specific entries NOT found for this rule ID", 2, this.rule.getRuleType().toString()));
      }
    }
    catch (RuleDBException localRuleDBException)
    {
      SDKLogUtils.errorLog(this.TAG, "RulesDBException while extracting rule: ", localRuleDBException);
      if (paramRMExtractRulesErrorCallback != null)
      {
        paramRMExtractRulesErrorCallback.onInvalidRuleFound(new RMParseRuleError(64636, localRuleDBException.getMessage(), 2, this.rule.getRuleType().toString()));
        return;
        if (paramRMExtractRulesErrorCallback != null) {
          paramRMExtractRulesErrorCallback.onInvalidRuleFound(new RMParseRuleError(503, "No entry found in RULEDEVICES table for this rule ID", 2, this.rule.getRuleType().toString()));
        }
      }
    }
  }
  
  protected int extractRuleDay(RMTRuleDevices paramRMTRuleDevices)
  {
    int i = paramRMTRuleDevices.getDayID();
    SDKLogUtils.debugLog(this.TAG, "Fetch Rules: day id read from RULEDEVICES table: " + i);
    return i;
  }
  
  protected boolean extractRuleDevicesTable(RMTRules paramRMTRules)
    throws RuleDBException
  {
    int i = this.rule.getRuleId();
    List localList = RMRulesDBManager.getInstance().getRuleDevices(i);
    SDKLogUtils.debugLog(this.TAG, "extractRule: Rule ID = " + i + "; RULEDEVICES entries count = " + localList.size());
    int j = localList.size();
    boolean bool = false;
    if (j > 0)
    {
      Object localObject1 = "";
      Object localObject2 = null;
      int k = -1;
      Iterator localIterator = localList.iterator();
      while (localIterator.hasNext())
      {
        RMTRuleDevices localRMTRuleDevices = (RMTRuleDevices)localIterator.next();
        String str = localRMTRuleDevices.getDeviceID();
        SDKLogUtils.debugLog(this.TAG, "Extracted RULEDEVICE ENTRY: DEVICE_ID = " + str);
        if (!((String)localObject1).equals(str))
        {
          k = extractRuleDay(localRMTRuleDevices);
          this.rule.addDay(Integer.valueOf(k));
          localObject1 = str;
          this.rule.setStartTime(localRMTRuleDevices.getStartTime());
          this.rule.setEndTime(localRMTRuleDevices.getEndTime());
          if (str.contains("Bridge")) {}
          for (localObject2 = new RMLed();; localObject2 = new RMDBRuleDevice())
          {
            this.rule.addRuleDevice((RMDBRuleDevice)localObject2);
            fillRuleDeviceDetails(localRMTRuleDevices, (RMDBRuleDevice)localObject2);
            break;
          }
        }
        if ((k == extractRuleDay(localRMTRuleDevices)) && (((String)localObject1).contains("Bridge")))
        {
          fillRuleZbCapabilities(localRMTRuleDevices, (RMDBRuleDevice)localObject2);
        }
        else
        {
          k = extractRuleDay(localRMTRuleDevices);
          this.rule.addDay(Integer.valueOf(k));
        }
      }
      bool = true;
    }
    return bool;
  }
  
  protected abstract boolean extractRuleSpecificTables()
    throws RuleDBException;
  
  protected void fillRuleDeviceDetails(RMTRuleDevices paramRMTRuleDevices, RMDBRuleDevice paramRMDBRuleDevice)
  {
    paramRMDBRuleDevice.setStartAction((int)paramRMTRuleDevices.getStartAction());
    paramRMDBRuleDevice.setUdn(paramRMTRuleDevices.getDeviceID());
    paramRMDBRuleDevice.setOnModeOffset(paramRMTRuleDevices.getOnModeOffset());
    paramRMDBRuleDevice.setOffModeOffset(paramRMTRuleDevices.getOffModeOffset());
    fillRuleZbCapabilities(paramRMTRuleDevices, paramRMDBRuleDevice);
    paramRMDBRuleDevice.setRuleDuration(paramRMTRuleDevices.getRuleDuration());
    paramRMDBRuleDevice.setEndAction((int)paramRMTRuleDevices.getEndAction());
  }
  
  protected void fillRuleZbCapabilities(RMTRuleDevices paramRMTRuleDevices, RMDBRuleDevice paramRMDBRuleDevice)
  {
    paramRMDBRuleDevice.setZbCapabilityStart(paramRMTRuleDevices.getZBCapabilityStart());
    paramRMDBRuleDevice.setZbCapabilityEnd(paramRMTRuleDevices.getZBCapabilityEnd());
  }
  
  protected abstract RMDBRuleType getDBRuleType();
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/belkin/wemo/rules/read/type/db/RMBaseDBRuleParser.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */