package org.cybergarage.util;

import java.io.PrintStream;

public final class Debug
{
  public static Debug debug = new Debug();
  public static boolean enabled = false;
  private PrintStream out = System.out;
  
  public static Debug getDebug()
  {
    return debug;
  }
  
  public static boolean isOn()
  {
    return enabled;
  }
  
  public static final void message(String paramString)
  {
    if (enabled == true) {
      debug.getOut().println("CyberGarage message: Thread: " + Thread.currentThread().getId() + ": " + paramString);
    }
  }
  
  public static final void message(String paramString1, String paramString2)
  {
    if (enabled == true) {
      debug.getOut().println("CyberGarage message Thread: " + Thread.currentThread().getId() + ": ");
    }
    debug.getOut().println(paramString1);
    debug.getOut().println(paramString2);
  }
  
  public static final void off()
  {
    enabled = false;
  }
  
  public static final void on()
  {
    enabled = true;
  }
  
  public static final void warning(Exception paramException)
  {
    warning(paramException.getMessage());
    paramException.printStackTrace(debug.getOut());
  }
  
  public static final void warning(String paramString)
  {
    debug.getOut().println("CyberGarage warning : Thread: " + Thread.currentThread().getId() + ": " + paramString);
  }
  
  public static final void warning(String paramString, Exception paramException)
  {
    if (paramException.getMessage() == null)
    {
      debug.getOut().println("CyberGarage warning : Thread: " + Thread.currentThread().getId() + ": " + paramString + " START");
      paramException.printStackTrace(debug.getOut());
      debug.getOut().println("CyberGarage warning : Thread: " + Thread.currentThread().getId() + ": " + paramString + " END");
      return;
    }
    debug.getOut().println("CyberGarage warning : Thread: " + Thread.currentThread().getId() + ": " + paramString + " (" + paramException.getMessage() + ")");
    paramException.printStackTrace(debug.getOut());
  }
  
  public PrintStream getOut()
  {
    try
    {
      PrintStream localPrintStream = this.out;
      return localPrintStream;
    }
    finally
    {
      localObject = finally;
      throw ((Throwable)localObject);
    }
  }
  
  public void setOut(PrintStream paramPrintStream)
  {
    try
    {
      this.out = paramPrintStream;
      return;
    }
    finally
    {
      localObject = finally;
      throw ((Throwable)localObject);
    }
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/org/cybergarage/util/Debug.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */