package com.belkin.wemo.rules.runnable;

import android.content.Context;
import com.belkin.utils.LogUtils;
import com.belkin.wemo.rules.callback.FetchRulesErrorCallback;
import com.belkin.wemo.rules.callback.FetchRulesSuccessCallback;
import java.util.ArrayList;

public class FetchRulesLocalRunnable
  extends FetchRulesLocalAbstractRunnable
{
  public static final String FETCH_RULES_RUNNABLE_TAG = "FetchRulesLocalRunnable";
  private FetchRulesErrorCallback errorCallback;
  private FetchRulesSuccessCallback successCallback;
  
  public FetchRulesLocalRunnable(Context paramContext, FetchRulesSuccessCallback paramFetchRulesSuccessCallback, FetchRulesErrorCallback paramFetchRulesErrorCallback)
  {
    super(paramContext);
    this.successCallback = paramFetchRulesSuccessCallback;
    this.errorCallback = paramFetchRulesErrorCallback;
  }
  
  protected void sendError(Exception paramException)
  {
    LogUtils.errorLog("FetchRulesLocalRunnable", "Fetch Rules: ERROR: ", paramException);
    if (this.errorCallback != null) {
      this.errorCallback.onError();
    }
  }
  
  protected void sendSuccessResponse(String paramString, int paramInt, ArrayList<String> paramArrayList)
  {
    if (this.successCallback != null) {
      this.successCallback.onSuccess(paramString, paramInt, paramArrayList);
    }
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/belkin/wemo/rules/runnable/FetchRulesLocalRunnable.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */