package com.belkin.exception;

public class DatabaseException
  extends WemoException
{
  private static final long serialVersionUID = 1L;
  
  public DatabaseException(String paramString)
  {
    super(paramString);
  }
  
  public DatabaseException(String paramString, Throwable paramThrowable)
  {
    super(paramString, paramThrowable);
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/belkin/exception/DatabaseException.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */