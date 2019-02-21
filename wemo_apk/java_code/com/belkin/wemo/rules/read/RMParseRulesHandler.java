package com.belkin.wemo.rules.read;

import com.belkin.wemo.cache.utils.SDKLogUtils;
import com.belkin.wemo.rules.data.RMRule;
import com.belkin.wemo.rules.read.callback.RMParseRulesErrorCallback;
import com.belkin.wemo.rules.read.callback.RMParseRulesSuccessCallback;
import com.belkin.wemo.rules.read.type.callback.RMReadRulesTypeErrorCallback;
import com.belkin.wemo.rules.read.type.callback.RMReadRulesTypeSuccessCallback;
import com.belkin.wemo.rules.read.type.error.RMParseRuleError;
import java.util.ArrayList;

public class RMParseRulesHandler
  implements RMReadRulesTypeSuccessCallback, RMReadRulesTypeErrorCallback
{
  private static final String TAG = RMParseRulesHandler.class.getSimpleName();
  private boolean allCallbacksPassedYet = true;
  private int callbackCount;
  private RMParseRulesErrorCallback errorCallback;
  private ArrayList<RMRule> rulesList;
  private int rulesTypeCount;
  private RMParseRulesSuccessCallback successCallback;
  
  public RMParseRulesHandler(RMParseRulesSuccessCallback paramRMParseRulesSuccessCallback, RMParseRulesErrorCallback paramRMParseRulesErrorCallback, int paramInt)
  {
    this.successCallback = paramRMParseRulesSuccessCallback;
    this.errorCallback = paramRMParseRulesErrorCallback;
    this.rulesTypeCount = paramInt;
    this.rulesList = new ArrayList();
  }
  
  public void onRulesExtractionFailed(RMParseRuleError paramRMParseRuleError)
  {
    try
    {
      this.allCallbacksPassedYet = false;
      SDKLogUtils.infoLog(TAG, "Fetch Rules: Rules parsing failed for type: " + paramRMParseRuleError.getRulesType());
      if (this.errorCallback != null) {
        this.errorCallback.onRulesParsingFailed(paramRMParseRuleError);
      }
      return;
    }
    finally
    {
      localObject = finally;
      throw ((Throwable)localObject);
    }
  }
  
  public void onRulesParsed(ArrayList<? extends RMRule> paramArrayList, int paramInt)
  {
    try
    {
      if (this.allCallbacksPassedYet)
      {
        this.callbackCount = (1 + this.callbackCount);
        SDKLogUtils.infoLog(TAG, "Fetch Rules: Rules parsed for type: " + paramInt + "; Rules count: " + paramArrayList.size());
        this.rulesList.addAll(paramArrayList);
        if ((this.callbackCount == this.rulesTypeCount) && (this.successCallback != null)) {
          this.successCallback.onRulesParsed(this.rulesList);
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


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/belkin/wemo/rules/read/RMParseRulesHandler.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */