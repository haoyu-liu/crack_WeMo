package com.belkin.wemo.rules.operation.download.impl;

import com.belkin.wemo.cache.cloud.CloudRequestManager;
import com.belkin.wemo.cache.cloud.RMCloudRequestGetDBFile;
import com.belkin.wemo.cache.cloud.listener.OnRequestCompleteListener;
import com.belkin.wemo.cache.utils.SDKLogUtils;
import com.belkin.wemo.localsdk.exception.RulesException;
import com.belkin.wemo.rules.operation.download.callback.RMRulesDBDownloadErrorCallback;
import com.belkin.wemo.rules.operation.download.callback.RMRulesDBDownloadSuccessCallback;
import com.belkin.wemo.rules.util.RMIRulesUtils;
import java.io.IOException;

public class RMRulesDBDownloadRemoteImpl
  extends RMRulesDBDownloadAbstractImpl
{
  public RMRulesDBDownloadRemoteImpl(RMIRulesUtils paramRMIRulesUtils)
  {
    super(paramRMIRulesUtils);
  }
  
  protected void download(String paramString1, String paramString2, String paramString3, RMRulesDBDownloadSuccessCallback paramRMRulesDBDownloadSuccessCallback, RMRulesDBDownloadErrorCallback paramRMRulesDBDownloadErrorCallback)
  {
    RMCloudRequestGetDBFile localRMCloudRequestGetDBFile = new RMCloudRequestGetDBFile(paramString3, new DownloadDBRequestListener(paramRMRulesDBDownloadSuccessCallback, paramRMRulesDBDownloadErrorCallback, paramString2));
    this.rulesUtils.getCloudRequestManager().makeByteStreamRequest(localRMCloudRequestGetDBFile);
  }
  
  private class DownloadDBRequestListener
    implements OnRequestCompleteListener
  {
    private RMRulesDBDownloadErrorCallback errorCallback;
    private String rulesDBFileWithPath;
    private RMRulesDBDownloadSuccessCallback successCallback;
    
    public DownloadDBRequestListener(RMRulesDBDownloadSuccessCallback paramRMRulesDBDownloadSuccessCallback, RMRulesDBDownloadErrorCallback paramRMRulesDBDownloadErrorCallback, String paramString)
    {
      this.successCallback = paramRMRulesDBDownloadSuccessCallback;
      this.errorCallback = paramRMRulesDBDownloadErrorCallback;
      this.rulesDBFileWithPath = paramString;
    }
    
    public void onRequestComplete(boolean paramBoolean, int paramInt, byte[] paramArrayOfByte)
    {
      if (paramBoolean) {}
      do
      {
        try
        {
          SDKLogUtils.debugLog(RMRulesDBDownloadRemoteImpl.this.TAG, "Fetch Rules: Remote: Location for Downloading rules DB from cloud: " + this.rulesDBFileWithPath);
          RMRulesDBDownloadRemoteImpl.this.rulesUtils.downloadFromUrl(paramArrayOfByte, this.rulesDBFileWithPath);
          if (this.successCallback != null) {
            this.successCallback.onRulesDBDownloaded(this.rulesDBFileWithPath);
          }
          return;
        }
        catch (IOException localIOException)
        {
          do
          {
            SDKLogUtils.errorLog(RMRulesDBDownloadRemoteImpl.this.TAG, "IOException while downloading rules DB from cloud: ", localIOException);
          } while (this.errorCallback == null);
          this.errorCallback.onRulesDBDownloadException(localIOException);
          return;
        }
        SDKLogUtils.errorLog(RMRulesDBDownloadRemoteImpl.this.TAG, "Error received while downloading rules DB from cloud. STATUS CODE: " + paramInt);
      } while (this.errorCallback == null);
      this.errorCallback.onRulesDBDownloadException(new RulesException("DB Download failed"));
    }
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/belkin/wemo/rules/operation/download/impl/RMRulesDBDownloadRemoteImpl.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */