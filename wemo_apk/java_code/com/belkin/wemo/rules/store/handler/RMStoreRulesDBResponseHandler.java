package com.belkin.wemo.rules.store.handler;

import com.belkin.wemo.WeMo;
import com.belkin.wemo.cache.utils.SDKLogUtils;
import com.belkin.wemo.cache.utils.SharePreferences;
import com.belkin.wemo.rules.error.RMRulesError;
import com.belkin.wemo.rules.error.RMRulesTypeError;
import com.belkin.wemo.rules.operation.callback.RMStoreRulesTypeErrorCallback;
import com.belkin.wemo.rules.operation.callback.RMStoreRulesTypeSuccessCallback;
import com.belkin.wemo.rules.store.callback.RMStoreRulesErrorCallback;
import com.belkin.wemo.rules.store.callback.RMStoreRulesSuccessCallback;
import com.belkin.wemo.rules.util.RMIRulesUtils;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.util.List;

public class RMStoreRulesDBResponseHandler
  implements RMStoreRulesTypeErrorCallback, RMStoreRulesTypeSuccessCallback
{
  private final String TAG = RMStoreRulesDBResponseHandler.class.getSimpleName();
  private RMStoreRulesErrorCallback errorCallback;
  private String newRulesDBVersion;
  private RMIRulesUtils rulesUtils;
  private RMStoreRulesSuccessCallback successCallback;
  
  public RMStoreRulesDBResponseHandler(RMStoreRulesSuccessCallback paramRMStoreRulesSuccessCallback, RMStoreRulesErrorCallback paramRMStoreRulesErrorCallback, RMIRulesUtils paramRMIRulesUtils, String paramString)
  {
    this.successCallback = paramRMStoreRulesSuccessCallback;
    this.errorCallback = paramRMStoreRulesErrorCallback;
    this.newRulesDBVersion = paramString;
    this.rulesUtils = paramRMIRulesUtils;
  }
  
  public void onSingleTypeRulesStoreError(RMRulesTypeError paramRMRulesTypeError)
  {
    if (paramRMRulesTypeError.getRulesType() == 2)
    {
      SDKLogUtils.errorLog(this.TAG, "DB Based Rule storing FAILED. Resetting DB Version.");
      this.rulesUtils.setRulesDBVersion("0");
    }
    try
    {
      this.rulesUtils.copyRulesDB("1", "0");
      if (this.errorCallback != null) {
        this.errorCallback.onStoreRulesFailed(new RMRulesError(paramRMRulesTypeError.getErrorCode(), paramRMRulesTypeError.getErrorMessage()));
      }
      return;
    }
    catch (FileNotFoundException localFileNotFoundException)
    {
      for (;;)
      {
        SDKLogUtils.errorLog(this.TAG, "FileNotFoundException while cloning rules DB: ", localFileNotFoundException);
      }
    }
    catch (IOException localIOException)
    {
      for (;;)
      {
        SDKLogUtils.errorLog(this.TAG, "IOException while cloning rules DB: ", localIOException);
      }
    }
  }
  
  public void onSingleTypeStoreFailed(int paramInt, List<String> paramList)
  {
    if (paramInt == 2)
    {
      SDKLogUtils.errorLog(this.TAG, "DB Based Rule storing FAILED. Resetting DB Version.");
      this.rulesUtils.setRulesDBVersion("0");
    }
    try
    {
      this.rulesUtils.copyRulesDB("1", "0");
      if (this.errorCallback != null) {
        this.errorCallback.onStoreRulesFailed(new RMRulesError(65134, "Rule could not be saved on ANY RULE device!"));
      }
      return;
    }
    catch (FileNotFoundException localFileNotFoundException)
    {
      for (;;)
      {
        SDKLogUtils.errorLog(this.TAG, "FileNotFoundException while cloning rules DB: ", localFileNotFoundException);
      }
    }
    catch (IOException localIOException)
    {
      for (;;)
      {
        SDKLogUtils.errorLog(this.TAG, "IOException while cloning rules DB: ", localIOException);
      }
    }
  }
  
  public void onSingleTypeStoreSuccess(int paramInt, List<String> paramList)
  {
    if (paramInt == 2)
    {
      this.rulesUtils.setRulesDBVersion(this.newRulesDBVersion);
      new SharePreferences(WeMo.INSTANCE.getContext()).setDBVersion(this.newRulesDBVersion);
    }
    if (this.successCallback != null) {
      this.successCallback.onRulesStored();
    }
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/belkin/wemo/rules/store/handler/RMStoreRulesDBResponseHandler.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */