package com.belkin.wemo.cache.devicelist.listener;

import com.belkin.wemo.cache.cloud.AbstractCloudRequest.OnCloudRequestCompleted;
import com.belkin.wemo.cache.devicelist.callback.PluginResultErrorCallback;
import com.belkin.wemo.cache.devicelist.callback.PluginResultSuccessCallback;

public class ResetThresholdRemoteListener
  implements AbstractCloudRequest.OnCloudRequestCompleted
{
  private PluginResultErrorCallback errorCallback;
  private String newThreshold;
  private PluginResultSuccessCallback successCallback;
  
  public ResetThresholdRemoteListener(PluginResultErrorCallback paramPluginResultErrorCallback, PluginResultSuccessCallback paramPluginResultSuccessCallback, String paramString)
  {
    this.errorCallback = paramPluginResultErrorCallback;
    this.successCallback = paramPluginResultSuccessCallback;
    this.newThreshold = paramString;
  }
  
  public void onError(String paramString)
  {
    if (this.errorCallback != null) {
      this.errorCallback.onError(paramString);
    }
  }
  
  public void onSuccess()
  {
    if (this.successCallback != null) {
      this.successCallback.onSuccess(this.newThreshold);
    }
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/belkin/wemo/cache/devicelist/listener/ResetThresholdRemoteListener.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */