package com.belkin.wemo.cache.devicelist;

import com.belkin.wemo.cache.utils.SDKLogUtils;
import java.util.PriorityQueue;
import java.util.Queue;

public class DeviceRequestTracker
{
  private final long STALE_REQUEST_TIME_LIMIT = 5000L;
  private final String TAG = DeviceRequestTracker.class.getSimpleName();
  private Queue<Long> pendingRequestTimestampQueue;
  private int requestCount;
  private String udn;
  
  public DeviceRequestTracker(String paramString)
  {
    this.udn = paramString;
    this.pendingRequestTimestampQueue = new PriorityQueue();
  }
  
  private void decrementRequestCount()
  {
    int i = -1 + this.requestCount;
    this.requestCount = i;
    this.requestCount = Math.max(0, i);
  }
  
  private void purgeStaleRequests()
  {
    long l1 = System.currentTimeMillis();
    while ((!this.pendingRequestTimestampQueue.isEmpty()) && (l1 - ((Long)this.pendingRequestTimestampQueue.peek()).longValue() > 5000L))
    {
      long l2 = ((Long)this.pendingRequestTimestampQueue.remove()).longValue();
      decrementRequestCount();
      SDKLogUtils.debugLog(this.TAG, "uPnP Device Request: " + this.udn + "; request count: " + this.requestCount + "; Purging stale timestamp: " + l2 + " at current time: " + l1);
    }
  }
  
  public boolean isRequestNotificationPending()
  {
    try
    {
      purgeStaleRequests();
      int i = this.requestCount;
      boolean bool = false;
      if (i > 0) {
        bool = true;
      }
      SDKLogUtils.debugLog(this.TAG, "uPnP Device Request: " + this.udn + "; request count: " + this.requestCount + "; Is Request Notification Pending: " + bool);
      return bool;
    }
    finally {}
  }
  
  public void onRequestNotificationReceived()
  {
    try
    {
      decrementRequestCount();
      this.pendingRequestTimestampQueue.poll();
      SDKLogUtils.debugLog(this.TAG, "uPnP Device Request: " + this.udn + "; Notification Received. Request Counter decremented to " + this.requestCount);
      return;
    }
    finally
    {
      localObject = finally;
      throw ((Throwable)localObject);
    }
  }
  
  public void onRequestSuccess()
  {
    try
    {
      this.requestCount = (1 + this.requestCount);
      long l = System.currentTimeMillis();
      this.pendingRequestTimestampQueue.add(Long.valueOf(l));
      SDKLogUtils.debugLog(this.TAG, "uPnP Device Request: " + this.udn + "; Request success. Request Counter incremented to " + this.requestCount + " at current time: " + l);
      return;
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
      this.requestCount = 0;
      this.pendingRequestTimestampQueue.clear();
      SDKLogUtils.debugLog(this.TAG, "uPnP Device Request: " + this.udn + "; Request Counter RESET to 0");
      return;
    }
    finally
    {
      localObject = finally;
      throw ((Throwable)localObject);
    }
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/belkin/wemo/cache/devicelist/DeviceRequestTracker.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */