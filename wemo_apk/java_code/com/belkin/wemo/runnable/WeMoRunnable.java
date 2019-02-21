package com.belkin.wemo.runnable;

public abstract class WeMoRunnable
  implements Runnable
{
  protected String TAG = getLoggerTag();
  
  protected String getLoggerTag()
  {
    return getClass().getSimpleName();
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/belkin/wemo/runnable/WeMoRunnable.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */