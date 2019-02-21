package com.android.volley;

import android.os.Process;
import java.util.concurrent.BlockingQueue;

public class CacheDispatcher
  extends Thread
{
  private static final boolean DEBUG = VolleyLog.DEBUG;
  private final Cache mCache;
  private final BlockingQueue<Request<?>> mCacheQueue;
  private final ResponseDelivery mDelivery;
  private final BlockingQueue<Request<?>> mNetworkQueue;
  private volatile boolean mQuit = false;
  
  public CacheDispatcher(BlockingQueue<Request<?>> paramBlockingQueue1, BlockingQueue<Request<?>> paramBlockingQueue2, Cache paramCache, ResponseDelivery paramResponseDelivery)
  {
    this.mCacheQueue = paramBlockingQueue1;
    this.mNetworkQueue = paramBlockingQueue2;
    this.mCache = paramCache;
    this.mDelivery = paramResponseDelivery;
  }
  
  public void quit()
  {
    this.mQuit = true;
    interrupt();
  }
  
  public void run()
  {
    if (DEBUG) {
      VolleyLog.v("start new dispatcher", new Object[0]);
    }
    Process.setThreadPriority(10);
    this.mCache.initialize();
    for (;;)
    {
      final Request localRequest;
      try
      {
        localRequest = (Request)this.mCacheQueue.take();
        localRequest.addMarker("cache-queue-take");
        if (!localRequest.isCanceled()) {
          break label73;
        }
        localRequest.finish("cache-discard-canceled");
        continue;
        if (!this.mQuit) {
          continue;
        }
      }
      catch (InterruptedException localInterruptedException) {}
      return;
      label73:
      Cache.Entry localEntry = this.mCache.get(localRequest.getCacheKey());
      if (localEntry == null)
      {
        localRequest.addMarker("cache-miss");
        this.mNetworkQueue.put(localRequest);
      }
      else if (localEntry.isExpired())
      {
        localRequest.addMarker("cache-hit-expired");
        localRequest.setCacheEntry(localEntry);
        this.mNetworkQueue.put(localRequest);
      }
      else
      {
        localRequest.addMarker("cache-hit");
        Response localResponse = localRequest.parseNetworkResponse(new NetworkResponse(localEntry.data, localEntry.responseHeaders));
        localRequest.addMarker("cache-hit-parsed");
        if (!localEntry.refreshNeeded())
        {
          this.mDelivery.postResponse(localRequest, localResponse);
        }
        else
        {
          localRequest.addMarker("cache-hit-refresh-needed");
          localRequest.setCacheEntry(localEntry);
          localResponse.intermediate = true;
          this.mDelivery.postResponse(localRequest, localResponse, new Runnable()
          {
            public void run()
            {
              try
              {
                CacheDispatcher.this.mNetworkQueue.put(localRequest);
                return;
              }
              catch (InterruptedException localInterruptedException) {}
            }
          });
        }
      }
    }
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/android/volley/CacheDispatcher.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */