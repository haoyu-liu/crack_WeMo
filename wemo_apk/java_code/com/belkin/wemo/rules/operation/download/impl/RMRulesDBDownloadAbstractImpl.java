package com.belkin.wemo.rules.operation.download.impl;

import android.text.TextUtils;
import com.belkin.wemo.cache.utils.SDKLogUtils;
import com.belkin.wemo.exception.InvalidArgumentsException;
import com.belkin.wemo.rules.operation.download.RMIRulesDBDownloader;
import com.belkin.wemo.rules.operation.download.callback.RMRulesDBDownloadErrorCallback;
import com.belkin.wemo.rules.operation.download.callback.RMRulesDBDownloadSuccessCallback;
import com.belkin.wemo.rules.util.RMIRulesUtils;
import java.util.HashMap;

public abstract class RMRulesDBDownloadAbstractImpl
  implements RMIRulesDBDownloader
{
  protected final String TAG = getClass().getSimpleName();
  protected RMIRulesUtils rulesUtils;
  
  public RMRulesDBDownloadAbstractImpl(RMIRulesUtils paramRMIRulesUtils)
  {
    this.rulesUtils = paramRMIRulesUtils;
  }
  
  protected abstract void download(String paramString1, String paramString2, String paramString3, RMRulesDBDownloadSuccessCallback paramRMRulesDBDownloadSuccessCallback, RMRulesDBDownloadErrorCallback paramRMRulesDBDownloadErrorCallback);
  
  public void downloadRulesDB(HashMap<String, String> paramHashMap, RMRulesDBDownloadSuccessCallback paramRMRulesDBDownloadSuccessCallback, RMRulesDBDownloadErrorCallback paramRMRulesDBDownloadErrorCallback)
    throws InvalidArgumentsException
  {
    if (paramHashMap != null)
    {
      String str1 = (String)paramHashMap.get("download_url");
      String str2 = (String)paramHashMap.get("download_location");
      String str3 = (String)paramHashMap.get("mac_address");
      if ((TextUtils.isEmpty(str2)) || (TextUtils.isEmpty(str1)))
      {
        SDKLogUtils.errorLog(this.TAG, "Unable to download Rules DB from URL as download location or URL are invalid.");
        throw new InvalidArgumentsException("Input data for downloading DB is not valid.");
      }
      download(str1, str2, str3, paramRMRulesDBDownloadSuccessCallback, paramRMRulesDBDownloadErrorCallback);
      return;
    }
    SDKLogUtils.errorLog(this.TAG, "Unable to download Rules DB from URL as dataMap is Null");
    throw new InvalidArgumentsException("Input data for downloading DB is not valid.");
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/belkin/wemo/rules/operation/download/impl/RMRulesDBDownloadAbstractImpl.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */