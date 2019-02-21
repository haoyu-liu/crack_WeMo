package com.belkin.wemo.thread;

import com.belkin.wemo.cache.utils.SDKLogUtils;
import com.belkin.wemo.runnable.WeMoRunnable;
import java.util.concurrent.BlockingQueue;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import java.util.concurrent.Future;
import java.util.concurrent.LinkedBlockingQueue;
import java.util.concurrent.ThreadPoolExecutor;
import java.util.concurrent.TimeUnit;

public class WeMoThreadPoolHandler
{
  public static int CORE_POOL_SIZE = 0;
  public static long KEEP_ALIVE_TIME = 5000L;
  public static int MAX_POOL_SIZE = 30;
  private static WeMoThreadPoolHandler wemoThreadPool;
  private final String TAG = WeMoThreadPoolHandler.class.getSimpleName();
  private ThreadPoolExecutor executor;
  private BlockingQueue<Runnable> wemoThreadPoolBlockingQueue = new LinkedBlockingQueue();
  
  private WeMoThreadPoolHandler()
  {
    this.executor = new WemoThreadPoolExecutor(CORE_POOL_SIZE, MAX_POOL_SIZE, KEEP_ALIVE_TIME, TimeUnit.MILLISECONDS, this.wemoThreadPoolBlockingQueue);
  }
  
  private WeMoThreadPoolHandler(WemoThreadPoolExecutor paramWemoThreadPoolExecutor)
  {
    new WemoThreadPoolExecutor(CORE_POOL_SIZE, MAX_POOL_SIZE, KEEP_ALIVE_TIME, TimeUnit.MILLISECONDS, this.wemoThreadPoolBlockingQueue);
  }
  
  public static void executeInBackground(Runnable paramRunnable)
  {
    Executors.newSingleThreadExecutor().execute(paramRunnable);
  }
  
  public static WeMoThreadPoolHandler getInstance()
  {
    try
    {
      if (wemoThreadPool == null) {
        wemoThreadPool = new WeMoThreadPoolHandler();
      }
      WeMoThreadPoolHandler localWeMoThreadPoolHandler = wemoThreadPool;
      return localWeMoThreadPoolHandler;
    }
    finally {}
  }
  
  public void destroyThreadPool()
  {
    try
    {
      if (this.executor != null)
      {
        this.executor.shutdown();
        this.executor = null;
      }
      return;
    }
    finally
    {
      localObject = finally;
      throw ((Throwable)localObject);
    }
  }
  
  public void executeViaBackground(WeMoRunnable paramWeMoRunnable)
  {
    try
    {
      SDKLogUtils.debugLog(this.TAG, "Execute In Background Request Received. Runnable: " + paramWeMoRunnable.getClass().getSimpleName());
      this.executor.execute(paramWeMoRunnable);
      return;
    }
    finally
    {
      localObject = finally;
      throw ((Throwable)localObject);
    }
  }
  
  public Future<?> sumbitViaBackground(WeMoRunnable paramWeMoRunnable)
  {
    try
    {
      Future localFuture = this.executor.submit(paramWeMoRunnable);
      return localFuture;
    }
    finally
    {
      localObject = finally;
      throw ((Throwable)localObject);
    }
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/belkin/wemo/thread/WeMoThreadPoolHandler.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */