package org.cybergarage.util;

public class ThreadCore
  implements Runnable
{
  private Thread mThreadObject = null;
  
  public Thread getThreadObject()
  {
    return this.mThreadObject;
  }
  
  public boolean isRunnable()
  {
    return Thread.currentThread() == getThreadObject();
  }
  
  public void restart()
  {
    stop();
    start();
  }
  
  public void run() {}
  
  public void setThreadObject(Thread paramThread)
  {
    this.mThreadObject = paramThread;
  }
  
  public void start()
  {
    if (getThreadObject() == null)
    {
      Thread localThread = new Thread(this, "Cyber.ThreadCore");
      setThreadObject(localThread);
      localThread.start();
    }
  }
  
  public void stop()
  {
    Thread localThread = getThreadObject();
    if (localThread != null)
    {
      localThread.interrupt();
      setThreadObject(null);
    }
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/org/cybergarage/util/ThreadCore.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */