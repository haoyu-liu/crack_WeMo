package com.belkin.wemo.exception;

public abstract class WeMoException
  extends Exception
{
  private static final long serialVersionUID = -1946424173132332017L;
  
  public WeMoException() {}
  
  public WeMoException(String paramString)
  {
    super(paramString);
  }
  
  public WeMoException(String paramString, Throwable paramThrowable)
  {
    super(paramString, paramThrowable);
  }
  
  public WeMoException(Throwable paramThrowable)
  {
    super(paramThrowable);
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/belkin/wemo/exception/WeMoException.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */