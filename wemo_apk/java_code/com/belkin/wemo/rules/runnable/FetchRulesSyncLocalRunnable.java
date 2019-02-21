package com.belkin.wemo.rules.runnable;

import android.content.Context;
import com.belkin.utils.LogUtils;
import com.belkin.wemo.rules.callback.FetchRulesAndSyncErrorCallback;
import com.belkin.wemo.rules.callback.FetchRulesAndSyncSuccessCallback;
import com.belkin.wemo.thread.WeMoThreadPoolHandler;
import java.util.ArrayList;

public class FetchRulesSyncLocalRunnable
  extends FetchRulesLocalAbstractRunnable
{
  public static final String TAG = "FetchRulesSyncLocalRunnable";
  private FetchRulesAndSyncErrorCallback errorCallback;
  private FetchRulesAndSyncSuccessCallback successCallback;
  
  public FetchRulesSyncLocalRunnable(Context paramContext, FetchRulesAndSyncSuccessCallback paramFetchRulesAndSyncSuccessCallback, FetchRulesAndSyncErrorCallback paramFetchRulesAndSyncErrorCallback)
  {
    super(paramContext);
    this.successCallback = paramFetchRulesAndSyncSuccessCallback;
    this.errorCallback = paramFetchRulesAndSyncErrorCallback;
  }
  
  private void syncLowerDevicesDB(int paramInt, ArrayList<String> paramArrayList)
  {
    int i = paramArrayList.size();
    LogUtils.infoLog("FetchRulesSyncLocalRunnable", "Fetch Rules: Devices with older versions of DB to be synced: " + i);
    if (i > 0) {
      WeMoThreadPoolHandler.executeInBackground(new SyncRulesLocalRunnable(this.context, paramArrayList, paramInt));
    }
  }
  
  protected void sendError(Exception paramException)
  {
    LogUtils.errorLog("FetchRulesSyncLocalRunnable", "Fetch Rules: ERROR: ", paramException);
    if (this.errorCallback != null) {
      this.errorCallback.onError();
    }
  }
  
  protected void sendSuccessResponse(String paramString, int paramInt, ArrayList<String> paramArrayList)
  {
    if (this.successCallback != null) {
      this.successCallback.onSuccess(paramString, paramInt);
    }
    syncLowerDevicesDB(paramInt, paramArrayList);
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/belkin/wemo/rules/runnable/FetchRulesSyncLocalRunnable.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */