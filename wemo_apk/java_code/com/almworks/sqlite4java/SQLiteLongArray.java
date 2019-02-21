package com.almworks.sqlite4java;

public class SQLiteLongArray
{
  private SQLiteController myController;
  private volatile boolean myDisposed;
  private SWIGTYPE_p_intarray myHandle;
  private final String myName;
  
  static
  {
    if (!SQLiteLongArray.class.desiredAssertionStatus()) {}
    for (boolean bool = true;; bool = false)
    {
      $assertionsDisabled = bool;
      return;
    }
  }
  
  SQLiteLongArray(SQLiteController paramSQLiteController, SWIGTYPE_p_intarray paramSWIGTYPE_p_intarray, String paramString)
  {
    assert (paramSQLiteController != null);
    assert (paramSWIGTYPE_p_intarray != null);
    assert (paramString != null);
    this.myController = paramSQLiteController;
    this.myHandle = paramSWIGTYPE_p_intarray;
    this.myName = paramString;
  }
  
  private SWIGTYPE_p_intarray handle()
    throws SQLiteException
  {
    SWIGTYPE_p_intarray localSWIGTYPE_p_intarray = this.myHandle;
    if (localSWIGTYPE_p_intarray == null) {
      throw new SQLiteException(-96, null);
    }
    return localSWIGTYPE_p_intarray;
  }
  
  SWIGTYPE_p_intarray arrayHandle()
  {
    return this.myHandle;
  }
  
  public SQLiteLongArray bind(long... paramVarArgs)
    throws SQLiteException
  {
    if (paramVarArgs == null) {}
    for (int i = 0;; i = paramVarArgs.length) {
      return bind(paramVarArgs, 0, i, false, false);
    }
  }
  
  public SQLiteLongArray bind(long[] paramArrayOfLong, int paramInt1, int paramInt2)
    throws SQLiteException
  {
    return bind(paramArrayOfLong, paramInt1, paramInt2, false, false);
  }
  
  public SQLiteLongArray bind(long[] paramArrayOfLong, int paramInt1, int paramInt2, boolean paramBoolean1, boolean paramBoolean2)
    throws SQLiteException
  {
    if (paramInt1 < 0) {
      throw new ArrayIndexOutOfBoundsException(paramInt1);
    }
    if (paramInt2 < 0) {
      throw new ArrayIndexOutOfBoundsException(paramInt2);
    }
    if ((paramInt2 > 0) && (paramInt1 + paramInt2 > paramArrayOfLong.length)) {
      throw new ArrayIndexOutOfBoundsException(paramInt1 + paramInt2);
    }
    this.myController.validate();
    if (Internal.isFineLogging()) {
      Internal.logFine(this, "bind[" + paramInt2 + "]");
    }
    if (paramInt2 == 0) {}
    for (int i = _SQLiteManual.sqlite3_intarray_unbind(handle());; i = _SQLiteManual.sqlite3_intarray_bind(handle(), paramArrayOfLong, paramInt1, paramInt2, paramBoolean1, paramBoolean2))
    {
      this.myController.throwResult(i, "bind(array)", this);
      return this;
      if (paramArrayOfLong == null) {
        throw new NullPointerException();
      }
    }
  }
  
  public SQLiteLongArray bind(long[] paramArrayOfLong, boolean paramBoolean1, boolean paramBoolean2)
    throws SQLiteException
  {
    if (paramArrayOfLong == null) {}
    for (int i = 0;; i = paramArrayOfLong.length) {
      return bind(paramArrayOfLong, 0, i, paramBoolean1, paramBoolean2);
    }
  }
  
  public void dispose()
  {
    if (this.myHandle == null) {
      return;
    }
    SQLiteController localSQLiteController = this.myController;
    try
    {
      localSQLiteController.validate();
      Internal.logFine(this, "disposing");
      localSQLiteController.dispose(this);
      this.myHandle = null;
      this.myController = SQLiteController.getDisposed(this.myController);
      this.myDisposed = true;
      return;
    }
    catch (SQLiteException localSQLiteException)
    {
      Internal.recoverableError(this, "invalid dispose: " + localSQLiteException, true);
    }
  }
  
  public String getName()
  {
    return this.myName;
  }
  
  public boolean isDisposed()
  {
    return this.myDisposed;
  }
  
  public String toString()
  {
    return this.myName;
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/almworks/sqlite4java/SQLiteLongArray.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */