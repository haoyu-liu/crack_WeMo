package com.belkin.wemo.thread;

import java.util.concurrent.BlockingQueue;
import java.util.concurrent.ThreadPoolExecutor;
import java.util.concurrent.TimeUnit;

public class WemoThreadPoolExecutor
  extends ThreadPoolExecutor
{
  private int corePoolSize;
  private int currentThreadPoolSize = 0;
  private Object lock;
  private int maxPoolSize;
  
  public WemoThreadPoolExecutor(int paramInt1, int paramInt2, long paramLong, TimeUnit paramTimeUnit, BlockingQueue<Runnable> paramBlockingQueue)
  {
    super(paramInt1, paramInt2, paramLong, paramTimeUnit, paramBlockingQueue);
    this.corePoolSize = paramInt1;
    this.maxPoolSize = paramInt2;
    this.lock = new Object();
  }
  
  private void reEvaluateCorePoolSize(int paramInt)
  {
    int i = paramInt;
    if (i < this.corePoolSize) {
      i = this.corePoolSize;
    }
    for (;;)
    {
      super.setCorePoolSize(i);
      return;
      if (i > this.maxPoolSize) {
        i = this.maxPoolSize;
      }
    }
  }
  
  protected void afterExecute(Runnable paramRunnable, Throwable paramThrowable)
  {
    super.afterExecute(paramRunnable, paramThrowable);
    synchronized (this.lock)
    {
      int i = -1 + this.currentThreadPoolSize;
      this.currentThreadPoolSize = i;
      reEvaluateCorePoolSize(i);
      return;
    }
  }
  
  public void execute(Runnable paramRunnable)
  {
    synchronized (this.lock)
    {
      int i = 1 + this.currentThreadPoolSize;
      this.currentThreadPoolSize = i;
      reEvaluateCorePoolSize(i);
      super.execute(paramRunnable);
      return;
    }
  }
  
  public void setCorePoolSize(int paramInt)
  {
    this.corePoolSize = paramInt;
  }
  
  public void setMaximumPoolSize(int paramInt)
  {
    this.maxPoolSize = paramInt;
    super.setMaximumPoolSize(paramInt);
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/belkin/wemo/thread/WemoThreadPoolExecutor.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */