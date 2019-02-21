package com.belkin.wemo.rules.fetch.handler;

import com.belkin.wemo.cache.utils.SDKLogUtils;
import com.belkin.wemo.rules.db.broadcast.RMIRulesUpdatedBroadcaster;
import com.belkin.wemo.rules.error.RMRulesError;
import com.belkin.wemo.rules.error.RMRulesTypeError;
import com.belkin.wemo.rules.fetch.callback.RMFetchRulesErrorCallback;
import com.belkin.wemo.rules.fetch.callback.RMFetchRulesSuccessCallback;
import com.belkin.wemo.rules.operation.callback.RMFetchRulesTypeErrorCallback;
import com.belkin.wemo.rules.operation.callback.RMFetchRulesTypeSuccessCallback;
import java.util.ArrayList;

public class RMFetchRulesResponseHandler
  implements RMFetchRulesTypeErrorCallback, RMFetchRulesTypeSuccessCallback
{
  private static final String TAG = RMFetchRulesResponseHandler.class.getSimpleName();
  private int callbackCount;
  private RMFetchRulesErrorCallback errorCallback;
  private boolean noRuleTypeFailed;
  private RMIRulesUpdatedBroadcaster rulesFetchedBroadcaster;
  private int rulesTypeCount;
  private RMFetchRulesSuccessCallback successCallback;
  
  public RMFetchRulesResponseHandler(int paramInt, RMFetchRulesSuccessCallback paramRMFetchRulesSuccessCallback, RMFetchRulesErrorCallback paramRMFetchRulesErrorCallback, RMIRulesUpdatedBroadcaster paramRMIRulesUpdatedBroadcaster)
  {
    this.successCallback = paramRMFetchRulesSuccessCallback;
    this.errorCallback = paramRMFetchRulesErrorCallback;
    this.noRuleTypeFailed = true;
    this.rulesTypeCount = paramInt;
    this.rulesFetchedBroadcaster = paramRMIRulesUpdatedBroadcaster;
  }
  
  public void onSingleTypeRulesFetchError(RMRulesTypeError paramRMRulesTypeError)
  {
    try
    {
      this.noRuleTypeFailed = false;
      int i = paramRMRulesTypeError.getErrorCode();
      String str = paramRMRulesTypeError.getErrorMessage();
      SDKLogUtils.errorLog(TAG, "Fetch Rules: Fetch Rules for TYPE: " + paramRMRulesTypeError.getRulesType() + ", FAILED. errCode: " + i + ", errMsg: " + str);
      if (this.errorCallback != null) {
        this.errorCallback.onRulesFetchFailed(new RMRulesError(i, str));
      }
      return;
    }
    finally
    {
      localObject = finally;
      throw ((Throwable)localObject);
    }
  }
  
  public void onSingleTypeRulesFetched(int paramInt, ArrayList<String> paramArrayList, String... paramVarArgs)
  {
    try
    {
      this.callbackCount = (1 + this.callbackCount);
      SDKLogUtils.debugLog(TAG, "Fetch Rules: Fetch Rules for TYPE: " + paramInt + ", SUCCESS. Rule types callback received: " + this.callbackCount + "; Total rules types count: " + this.rulesTypeCount);
      if (paramInt == 2) {
        this.rulesFetchedBroadcaster.sendRulesUpdatedBroadcast();
      }
      if ((this.noRuleTypeFailed) && (this.callbackCount >= this.rulesTypeCount) && (this.successCallback != null)) {
        this.successCallback.onRulesFetched();
      }
      return;
    }
    finally {}
  }
  
  public void setRuleTypesCount(int paramInt)
  {
    try
    {
      this.rulesTypeCount = paramInt;
      SDKLogUtils.debugLog(TAG, "Fetch Rules: Rules Type count set to " + paramInt);
      return;
    }
    finally
    {
      localObject = finally;
      throw ((Throwable)localObject);
    }
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/belkin/wemo/rules/fetch/handler/RMFetchRulesResponseHandler.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */