package org.cybergarage.util;

public final class TimerUtil
{
  public static final void wait(int paramInt)
  {
    long l = paramInt;
    try
    {
      Thread.sleep(l);
      return;
    }
    catch (Exception localException) {}
  }
  
  public static final void waitRandom(int paramInt)
  {
    long l = (int)(Math.random() * paramInt);
    try
    {
      Thread.sleep(l);
      return;
    }
    catch (Exception localException) {}
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/org/cybergarage/util/TimerUtil.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */