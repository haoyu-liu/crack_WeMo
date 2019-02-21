package org.cybergarage.util;

public class Mutex
{
  private boolean syncLock = false;
  
  public void lock()
  {
    try
    {
      for (;;)
      {
        boolean bool = this.syncLock;
        if (bool != true) {
          break;
        }
        try
        {
          wait();
        }
        catch (Exception localException)
        {
          Debug.warning(localException);
        }
      }
      this.syncLock = true;
    }
    finally {}
  }
  
  public void unlock()
  {
    try
    {
      this.syncLock = false;
      notifyAll();
      return;
    }
    finally
    {
      localObject = finally;
      throw ((Throwable)localObject);
    }
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/org/cybergarage/util/Mutex.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */