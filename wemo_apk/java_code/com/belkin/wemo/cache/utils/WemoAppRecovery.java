package com.belkin.wemo.cache.utils;

import android.content.Context;

public class WemoAppRecovery
{
  public static final String ERROR_CODE_002 = "ERR_002";
  public static final String ERROR_CODE_414 = "WEMO_414";
  public static final String ERROR_CODE_415 = "WEMO_415";
  public static final String KEY_CODE = "code";
  public static final String KEY_ERROR = "Error";
  public static final String KEY_RESULT_CODE = "resultCode";
  public static final String KEY_error = "error";
  public static final int STATUS_CODE_400 = 400;
  public static final int STATUS_CODE_403 = 403;
  private static final String TAG = "SDK_CloudRequestForAppRecovery";
  private static WemoAppRecovery appRecovery = null;
  private static SharePreferences mSharePreference;
  public boolean consistentFlag = false;
  public int counter = 0;
  public int maxRetryCount = 0;
  
  private WemoAppRecovery(Context paramContext)
  {
    mSharePreference = new SharePreferences(paramContext);
  }
  
  public static WemoAppRecovery getInstance(Context paramContext)
  {
    try
    {
      if (appRecovery == null) {
        appRecovery = new WemoAppRecovery(paramContext);
      }
      WemoAppRecovery localWemoAppRecovery = initAppRecoveryData();
      return localWemoAppRecovery;
    }
    finally {}
  }
  
  public static WemoAppRecovery initAppRecoveryData()
  {
    appRecovery.consistentFlag = mSharePreference.getAppRecoveryFlag();
    appRecovery.counter = mSharePreference.getAppRecoveryCounter();
    appRecovery.maxRetryCount = mSharePreference.getAppRecoveryMaxCount();
    SDKLogUtils.debugLog("SDK_CloudRequestForAppRecovery", "initAppRecoveryData :: AppRecovery values are :: consistentFlag :: " + appRecovery.consistentFlag + " :: counter :: " + appRecovery.counter + " :: appRecovery.maxRetryCount  :: " + appRecovery.maxRetryCount);
    return appRecovery;
  }
  
  public void setAppRecoveryData(WemoAppRecovery paramWemoAppRecovery)
  {
    SDKLogUtils.debugLog("SDK_CloudRequestForAppRecovery", "setAppRecoveryData :: AppRecovery values are :: consistentFlag :: " + paramWemoAppRecovery.consistentFlag + " :: counter :: " + paramWemoAppRecovery.counter + " :: appRecovery.maxRetryCount  :: " + paramWemoAppRecovery.maxRetryCount);
    mSharePreference.setAppRecoveryFlag(paramWemoAppRecovery.consistentFlag);
    mSharePreference.setAppRecoveryCounter(paramWemoAppRecovery.counter);
    mSharePreference.setAppRecoveryMaxCount(paramWemoAppRecovery.maxRetryCount);
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/belkin/wemo/cache/utils/WemoAppRecovery.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */