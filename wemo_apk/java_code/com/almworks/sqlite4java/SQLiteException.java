package com.almworks.sqlite4java;

public class SQLiteException
  extends Exception
{
  private final int myErrorCode;
  
  public SQLiteException(int paramInt, String paramString)
  {
    this(paramInt, paramString, null);
  }
  
  public SQLiteException(int paramInt, String paramString, Throwable paramThrowable)
  {
    super(paramString, paramThrowable);
    this.myErrorCode = paramInt;
    if (Internal.isFineLogging()) {
      Internal.logFine(getClass(), getMessage());
    }
  }
  
  public int getBaseErrorCode()
  {
    if (this.myErrorCode >= 0) {
      return 0xFF & this.myErrorCode;
    }
    return this.myErrorCode;
  }
  
  public int getErrorCode()
  {
    return this.myErrorCode;
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/almworks/sqlite4java/SQLiteException.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */