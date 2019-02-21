package com.almworks.sqlite4java;

public class SQLiteBusyException
  extends SQLiteException
{
  static
  {
    if (!SQLiteBusyException.class.desiredAssertionStatus()) {}
    for (boolean bool = true;; bool = false)
    {
      $assertionsDisabled = bool;
      return;
    }
  }
  
  public SQLiteBusyException(int paramInt, String paramString)
  {
    super(paramInt, paramString);
    assert ((paramInt == 5) || (paramInt == 2826)) : paramInt;
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/almworks/sqlite4java/SQLiteBusyException.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */