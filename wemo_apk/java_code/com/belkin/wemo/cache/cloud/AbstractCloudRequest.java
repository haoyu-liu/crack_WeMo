package com.belkin.wemo.cache.cloud;

import java.util.HashMap;
import java.util.Map;

public abstract class AbstractCloudRequest
  implements CloudRequestInterface
{
  protected Map<String, String> headersMap = new HashMap();
  private OnCloudRequestCompleted requestCompleteListener;
  
  public Map<String, String> getAdditionalHeadersMap()
  {
    return this.headersMap;
  }
  
  protected OnCloudRequestCompleted getOnCloudRequestCompletedListener()
  {
    return this.requestCompleteListener;
  }
  
  public void setOnCloudRequestCompletedListener(OnCloudRequestCompleted paramOnCloudRequestCompleted)
  {
    this.requestCompleteListener = paramOnCloudRequestCompleted;
  }
  
  public static abstract interface OnCloudRequestCompleted
  {
    public abstract void onError(String paramString);
    
    public abstract void onSuccess();
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/belkin/wemo/cache/cloud/AbstractCloudRequest.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */