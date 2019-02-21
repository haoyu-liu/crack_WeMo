package com.belkin.wemo.rules.operation.download.impl;

import com.belkin.wemo.cache.utils.SDKLogUtils;
import com.belkin.wemo.rules.operation.download.callback.RMRulesDBDownloadErrorCallback;
import com.belkin.wemo.rules.operation.download.callback.RMRulesDBDownloadSuccessCallback;
import com.belkin.wemo.rules.util.RMIRulesUtils;
import java.io.FileNotFoundException;
import java.io.IOException;

public class RMRulesDBDownloadLocalImpl
  extends RMRulesDBDownloadAbstractImpl
{
  public RMRulesDBDownloadLocalImpl(RMIRulesUtils paramRMIRulesUtils)
  {
    super(paramRMIRulesUtils);
  }
  
  protected void download(String paramString1, String paramString2, String paramString3, RMRulesDBDownloadSuccessCallback paramRMRulesDBDownloadSuccessCallback, RMRulesDBDownloadErrorCallback paramRMRulesDBDownloadErrorCallback)
  {
    try
    {
      this.rulesUtils.downloadFromUrl(paramString1, paramString2);
      if (paramRMRulesDBDownloadSuccessCallback != null) {
        paramRMRulesDBDownloadSuccessCallback.onRulesDBDownloaded(paramString2);
      }
      return;
    }
    catch (FileNotFoundException localFileNotFoundException)
    {
      do
      {
        SDKLogUtils.errorLog(this.TAG, "FileNotFoundException while downloading from URL: " + paramString1, localFileNotFoundException);
      } while (paramRMRulesDBDownloadErrorCallback == null);
      paramRMRulesDBDownloadErrorCallback.onRulesDBDownloadException(localFileNotFoundException);
      return;
    }
    catch (IOException localIOException)
    {
      do
      {
        SDKLogUtils.errorLog(this.TAG, "IOException while downloading from URL: ", localIOException);
      } while (paramRMRulesDBDownloadErrorCallback == null);
      paramRMRulesDBDownloadErrorCallback.onRulesDBDownloadException(localIOException);
    }
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/belkin/wemo/rules/operation/download/impl/RMRulesDBDownloadLocalImpl.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */