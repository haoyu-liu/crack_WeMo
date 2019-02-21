package com.belkin.exception;

public class WemoException
  extends Exception
{
  private static final long serialVersionUID = 1L;
  
  public WemoException(String paramString)
  {
    super(paramString);
  }
  
  public WemoException(String paramString, Throwable paramThrowable)
  {
    super(paramString, paramThrowable);
  }
  
  public WemoException(Throwable paramThrowable)
  {
    super(paramThrowable);
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/belkin/exception/WemoException.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */