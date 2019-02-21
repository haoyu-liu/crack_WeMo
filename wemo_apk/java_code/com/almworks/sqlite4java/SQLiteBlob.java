package com.almworks.sqlite4java;

public final class SQLiteBlob
{
  private SQLiteController myController;
  private SWIGTYPE_p_sqlite3_blob myHandle;
  private int myLength = -1;
  private final String myName;
  private final boolean myWriteAccess;
  
  static
  {
    if (!SQLiteBlob.class.desiredAssertionStatus()) {}
    for (boolean bool = true;; bool = false)
    {
      $assertionsDisabled = bool;
      return;
    }
  }
  
  SQLiteBlob(SQLiteController paramSQLiteController, SWIGTYPE_p_sqlite3_blob paramSWIGTYPE_p_sqlite3_blob, String paramString1, String paramString2, String paramString3, long paramLong, boolean paramBoolean)
  {
    assert (paramSQLiteController != null);
    assert (paramSWIGTYPE_p_sqlite3_blob != null);
    this.myController = paramSQLiteController;
    this.myHandle = paramSWIGTYPE_p_sqlite3_blob;
    this.myWriteAccess = paramBoolean;
    this.myName = (paramString1 + "." + paramString2 + "." + paramString3 + ":" + paramLong);
  }
  
  private SWIGTYPE_p_sqlite3_blob handle()
    throws SQLiteException
  {
    SWIGTYPE_p_sqlite3_blob localSWIGTYPE_p_sqlite3_blob = this.myHandle;
    if (localSWIGTYPE_p_sqlite3_blob == null) {
      throw new SQLiteException(-93, null);
    }
    return localSWIGTYPE_p_sqlite3_blob;
  }
  
  SWIGTYPE_p_sqlite3_blob blobHandle()
  {
    return this.myHandle;
  }
  
  void clear()
  {
    this.myHandle = null;
    this.myController = SQLiteController.getDisposed(this.myController);
    Internal.logFine(this, "cleared");
  }
  
  public void dispose()
  {
    if (this.myHandle == null) {
      return;
    }
    try
    {
      this.myController.validate();
      Internal.logFine(this, "disposing");
      this.myController.dispose(this);
      clear();
      return;
    }
    catch (SQLiteException localSQLiteException)
    {
      Internal.recoverableError(this, "invalid dispose: " + localSQLiteException, true);
    }
  }
  
  public int getSize()
    throws SQLiteException
  {
    this.myController.validate();
    if (this.myLength < 0) {
      this.myLength = _SQLiteSwigged.sqlite3_blob_bytes(handle());
    }
    return this.myLength;
  }
  
  public boolean isDisposed()
  {
    return this.myHandle == null;
  }
  
  public boolean isWriteAllowed()
  {
    return this.myWriteAccess;
  }
  
  public void read(int paramInt1, byte[] paramArrayOfByte, int paramInt2, int paramInt3)
    throws SQLiteException
  {
    if (paramArrayOfByte == null) {
      throw new NullPointerException();
    }
    if ((paramInt2 < 0) || (paramInt2 + paramInt3 > paramArrayOfByte.length)) {
      throw new ArrayIndexOutOfBoundsException(paramArrayOfByte.length + " " + paramInt2 + " " + paramInt3);
    }
    this.myController.validate();
    if (Internal.isFineLogging()) {
      Internal.logFine(this, "read[" + paramInt1 + "," + paramInt3 + "]");
    }
    int i = _SQLiteManual.sqlite3_blob_read(handle(), paramInt1, paramArrayOfByte, paramInt2, paramInt3);
    this.myController.throwResult(i, "read", this);
  }
  
  public void reopen(long paramLong)
    throws SQLiteException
  {
    this.myController.validate();
    if (Internal.isFineLogging()) {
      Internal.logFine(this, "reopen[" + paramLong + "]");
    }
    int i = _SQLiteSwigged.sqlite3_blob_reopen(handle(), paramLong);
    this.myController.throwResult(i, "reopen", this);
  }
  
  public String toString()
  {
    return "[" + this.myName + "]" + this.myController;
  }
  
  public void write(int paramInt1, byte[] paramArrayOfByte, int paramInt2, int paramInt3)
    throws SQLiteException
  {
    if (paramArrayOfByte == null) {
      throw new NullPointerException();
    }
    if ((paramInt2 < 0) || (paramInt2 + paramInt3 > paramArrayOfByte.length)) {
      throw new ArrayIndexOutOfBoundsException(paramArrayOfByte.length + " " + paramInt2 + " " + paramInt3);
    }
    this.myController.validate();
    if (Internal.isFineLogging()) {
      Internal.logFine(this, "write[" + paramInt1 + "," + paramInt3 + "]");
    }
    int i = _SQLiteManual.sqlite3_blob_write(handle(), paramInt1, paramArrayOfByte, paramInt2, paramInt3);
    this.myController.throwResult(i, "write", this);
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/almworks/sqlite4java/SQLiteBlob.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */