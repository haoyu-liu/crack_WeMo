package com.almworks.sqlite4java;

public class SQLiteInterruptedException
  extends SQLiteException
{
  public SQLiteInterruptedException()
  {
    this(9, "");
  }
  
  public SQLiteInterruptedException(int paramInt, String paramString)
  {
    super(paramInt, paramString);
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/almworks/sqlite4java/SQLiteInterruptedException.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */