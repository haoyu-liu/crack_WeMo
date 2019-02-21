package com.almworks.sqlite4java;

import java.io.IOException;

abstract class SQLiteController
{
  static
  {
    if (!SQLiteController.class.desiredAssertionStatus()) {}
    for (boolean bool = true;; bool = false)
    {
      $assertionsDisabled = bool;
      return;
    }
  }
  
  public static SQLiteController getDisposed(SQLiteController paramSQLiteController)
  {
    if ((paramSQLiteController instanceof Disposed)) {
      return paramSQLiteController;
    }
    boolean bool = $assertionsDisabled;
    int i = 0;
    if (!bool)
    {
      i = 1;
      if (i == 0) {
        throw new AssertionError();
      }
    }
    if (i == 0) {
      return Disposed.INSTANCE;
    }
    if (paramSQLiteController == null) {}
    for (String str = "";; str = paramSQLiteController.toString()) {
      return new Disposed(str, null);
    }
  }
  
  public abstract DirectBuffer allocateBuffer(int paramInt)
    throws IOException, SQLiteException;
  
  public abstract void dispose(SQLiteBlob paramSQLiteBlob);
  
  public abstract void dispose(SQLiteLongArray paramSQLiteLongArray);
  
  public abstract void dispose(SQLiteStatement paramSQLiteStatement);
  
  public abstract void freeBuffer(DirectBuffer paramDirectBuffer);
  
  public abstract ProgressHandler getProgressHandler()
    throws SQLiteException;
  
  public abstract _SQLiteManual getSQLiteManual();
  
  public abstract void throwResult(int paramInt, String paramString, Object paramObject)
    throws SQLiteException;
  
  public abstract void validate()
    throws SQLiteException;
  
  private static class Disposed
    extends SQLiteController
  {
    public static final Disposed INSTANCE = new Disposed("");
    private final String myName;
    
    private Disposed(String paramString)
    {
      this.myName = (paramString + "[D]");
    }
    
    public DirectBuffer allocateBuffer(int paramInt)
      throws IOException, SQLiteException
    {
      throw new IOException();
    }
    
    public void dispose(SQLiteBlob paramSQLiteBlob) {}
    
    public void dispose(SQLiteLongArray paramSQLiteLongArray) {}
    
    public void dispose(SQLiteStatement paramSQLiteStatement) {}
    
    public void freeBuffer(DirectBuffer paramDirectBuffer) {}
    
    public ProgressHandler getProgressHandler()
    {
      return ProgressHandler.DISPOSED;
    }
    
    public _SQLiteManual getSQLiteManual()
    {
      return new _SQLiteManual();
    }
    
    public void throwResult(int paramInt, String paramString, Object paramObject)
      throws SQLiteException
    {}
    
    public String toString()
    {
      return this.myName;
    }
    
    public void validate()
      throws SQLiteException
    {
      throw new SQLiteException(-92, "statement is disposed");
    }
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/almworks/sqlite4java/SQLiteController.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */