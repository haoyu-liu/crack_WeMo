package com.belkin.wemo.rules.read.type.db.handler;

import com.belkin.wemo.cache.utils.SDKLogUtils;
import com.belkin.wemo.rules.data.RMRule;
import com.belkin.wemo.rules.read.type.callback.RMExtractRuleSuccessCallback;
import com.belkin.wemo.rules.read.type.callback.RMExtractRulesErrorCallback;
import com.belkin.wemo.rules.read.type.callback.RMReadRulesTypeErrorCallback;
import com.belkin.wemo.rules.read.type.callback.RMReadRulesTypeSuccessCallback;
import com.belkin.wemo.rules.read.type.error.RMParseRuleError;
import java.util.ArrayList;

public class RMReadDBRulesHandler
  implements RMExtractRuleSuccessCallback, RMExtractRulesErrorCallback
{
  private static final String TAG = RMReadDBRulesHandler.class.getSimpleName();
  private boolean allCallbacksPassedYet = true;
  private int callbackCount;
  private RMReadRulesTypeErrorCallback errorCallback;
  private int rulesCount;
  private ArrayList<RMRule> rulesList;
  private RMReadRulesTypeSuccessCallback successCallback;
  
  public RMReadDBRulesHandler(RMReadRulesTypeSuccessCallback paramRMReadRulesTypeSuccessCallback, RMReadRulesTypeErrorCallback paramRMReadRulesTypeErrorCallback, int paramInt)
  {
    this.successCallback = paramRMReadRulesTypeSuccessCallback;
    this.errorCallback = paramRMReadRulesTypeErrorCallback;
    this.rulesCount = paramInt;
    this.rulesList = new ArrayList();
  }
  
  private void notifyListenerIfAllRulesParsed()
  {
    if ((this.callbackCount == this.rulesCount) && (this.successCallback != null)) {
      this.successCallback.onRulesParsed(this.rulesList, 2);
    }
  }
  
  public void onInvalidRuleFound(RMParseRuleError paramRMParseRuleError)
  {
    try
    {
      if (this.allCallbacksPassedYet)
      {
        this.callbackCount = (1 + this.callbackCount);
        SDKLogUtils.errorLog(TAG, "onInvalidRuleFound: error message: " + paramRMParseRuleError.getErrorMessage());
        notifyListenerIfAllRulesParsed();
      }
      return;
    }
    finally
    {
      localObject = finally;
      throw ((Throwable)localObject);
    }
  }
  
  public void onRuleParsed(RMRule paramRMRule)
  {
    try
    {
      if (this.allCallbacksPassedYet)
      {
        this.callbackCount = (1 + this.callbackCount);
        SDKLogUtils.infoLog(TAG, "Fetch Rules: Rule read successfully from DB for rule: " + paramRMRule.getDisplayName());
        this.rulesList.add(paramRMRule);
        notifyListenerIfAllRulesParsed();
      }
      return;
    }
    finally
    {
      localObject = finally;
      throw ((Throwable)localObject);
    }
  }
  
  public void onRulesParsingFailed(RMParseRuleError paramRMParseRuleError)
  {
    try
    {
      if (this.allCallbacksPassedYet)
      {
        this.allCallbacksPassedYet = false;
        SDKLogUtils.infoLog(TAG, "Fetch Rules: rule could NOT be read successfully from the DB.");
        if (this.errorCallback != null) {
          this.errorCallback.onRulesExtractionFailed(paramRMParseRuleError);
        }
      }
      return;
    }
    finally
    {
      localObject = finally;
      throw ((Throwable)localObject);
    }
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/belkin/wemo/rules/read/type/db/handler/RMReadDBRulesHandler.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */