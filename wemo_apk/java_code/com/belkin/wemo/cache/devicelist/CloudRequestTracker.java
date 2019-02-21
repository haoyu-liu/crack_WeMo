package com.belkin.wemo.cache.devicelist;

import com.belkin.wemo.cache.cloud.CloudRequestManager;
import com.belkin.wemo.cache.utils.SDKLogUtils;

public class CloudRequestTracker
{
  private static final String TAG = CloudRequestManager.class.getSimpleName();
  private static CloudRequestTracker requestTracker;
  private int requestCounter;
  
  public static CloudRequestTracker instance()
  {
    try
    {
      if (requestTracker == null) {
        requestTracker = new CloudRequestTracker();
      }
      CloudRequestTracker localCloudRequestTracker = requestTracker;
      return localCloudRequestTracker;
    }
    finally {}
  }
  
  public int onRequestCompleted()
  {
    try
    {
      this.requestCounter = (-1 + this.requestCounter);
      SDKLogUtils.debugLog(TAG, "Request Completed: Cloud requests in progress count: " + this.requestCounter);
      int i = this.requestCounter;
      return i;
    }
    finally
    {
      localObject = finally;
      throw ((Throwable)localObject);
    }
  }
  
  public int onRequestIssued()
  {
    try
    {
      this.requestCounter = (1 + this.requestCounter);
      SDKLogUtils.debugLog(TAG, "Request Issued: Cloud requests in progress count: " + this.requestCounter);
      int i = this.requestCounter;
      return i;
    }
    finally
    {
      localObject = finally;
      throw ((Throwable)localObject);
    }
  }
  
  public void reset()
  {
    try
    {
      this.requestCounter = 0;
      SDKLogUtils.debugLog(TAG, "Cloud request counter reset to 0");
      return;
    }
    finally
    {
      localObject = finally;
      throw ((Throwable)localObject);
    }
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/belkin/wemo/cache/devicelist/CloudRequestTracker.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */