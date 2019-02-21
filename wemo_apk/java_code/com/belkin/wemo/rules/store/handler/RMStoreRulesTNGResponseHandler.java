package com.belkin.wemo.rules.store.handler;

import com.belkin.wemo.rules.error.RMRulesTypeError;
import com.belkin.wemo.rules.operation.callback.RMStoreRulesTypeErrorCallback;
import com.belkin.wemo.rules.operation.callback.RMStoreRulesTypeSuccessCallback;
import com.belkin.wemo.rules.store.callback.RMStoreRulesErrorCallback;
import com.belkin.wemo.rules.store.callback.RMStoreRulesSuccessCallback;
import java.util.List;

public class RMStoreRulesTNGResponseHandler
  implements RMStoreRulesTypeErrorCallback, RMStoreRulesTypeSuccessCallback
{
  private int callbackCount;
  private RMStoreRulesErrorCallback errorCallback;
  private boolean noRuleTypeFailed;
  private RMStoreRulesSuccessCallback successCallback;
  
  public RMStoreRulesTNGResponseHandler(RMStoreRulesSuccessCallback paramRMStoreRulesSuccessCallback, RMStoreRulesErrorCallback paramRMStoreRulesErrorCallback)
  {
    this.successCallback = paramRMStoreRulesSuccessCallback;
    this.errorCallback = paramRMStoreRulesErrorCallback;
    this.noRuleTypeFailed = true;
  }
  
  public void onSingleTypeRulesStoreError(RMRulesTypeError paramRMRulesTypeError) {}
  
  public void onSingleTypeStoreFailed(int paramInt, List<String> paramList) {}
  
  public void onSingleTypeStoreSuccess(int paramInt, List<String> paramList) {}
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/belkin/wemo/rules/store/handler/RMStoreRulesTNGResponseHandler.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */