package com.almworks.sqlite4java;

public class SQLiteBackup
{
  private final SQLiteConnection myDestination;
  private SQLiteController myDestinationController;
  private boolean myFinished;
  private SWIGTYPE_p_sqlite3_backup myHandle;
  private final SQLiteConnection mySource;
  private SQLiteController mySourceController;
  
  SQLiteBackup(SQLiteController paramSQLiteController1, SQLiteController paramSQLiteController2, SWIGTYPE_p_sqlite3_backup paramSWIGTYPE_p_sqlite3_backup, SQLiteConnection paramSQLiteConnection1, SQLiteConnection paramSQLiteConnection2)
  {
    this.mySourceController = paramSQLiteController1;
    this.myDestinationController = paramSQLiteController2;
    this.myHandle = paramSWIGTYPE_p_sqlite3_backup;
    this.myDestination = paramSQLiteConnection2;
    this.mySource = paramSQLiteConnection1;
    Internal.logFine(this, "instantiated");
  }
  
  private SWIGTYPE_p_sqlite3_backup handle()
    throws SQLiteException
  {
    SWIGTYPE_p_sqlite3_backup localSWIGTYPE_p_sqlite3_backup = this.myHandle;
    if (localSWIGTYPE_p_sqlite3_backup == null) {
      throw new SQLiteException(-113, null);
    }
    return localSWIGTYPE_p_sqlite3_backup;
  }
  
  private void throwResult(int paramInt, String paramString)
    throws SQLiteException
  {
    if (paramInt == 101) {
      return;
    }
    this.myDestination.throwResult(paramInt, paramString);
  }
  
  public boolean backupStep(int paramInt)
    throws SQLiteException, SQLiteBusyException
  {
    this.mySource.checkThread();
    this.myDestination.checkThread();
    if (this.myFinished)
    {
      Internal.logWarn(this, "already finished");
      return true;
    }
    if (Internal.isFineLogging()) {
      Internal.logFine(this, "backupStep(" + paramInt + ")");
    }
    int i = _SQLiteSwigged.sqlite3_backup_step(handle(), paramInt);
    throwResult(i, "backupStep failed");
    if (i == 101)
    {
      if (Internal.isFineLogging()) {
        Internal.logFine(this, "finished");
      }
      this.myFinished = true;
    }
    return this.myFinished;
  }
  
  public void dispose()
  {
    dispose(true);
  }
  
  public void dispose(boolean paramBoolean)
  {
    try
    {
      this.mySourceController.validate();
      this.myDestinationController.validate();
      Internal.logFine(this, "disposing");
      SWIGTYPE_p_sqlite3_backup localSWIGTYPE_p_sqlite3_backup = this.myHandle;
      if (localSWIGTYPE_p_sqlite3_backup != null)
      {
        _SQLiteSwigged.sqlite3_backup_finish(localSWIGTYPE_p_sqlite3_backup);
        this.myHandle = null;
        this.mySourceController = SQLiteController.getDisposed(this.mySourceController);
        this.myDestinationController = SQLiteController.getDisposed(this.myDestinationController);
      }
      if (paramBoolean) {
        this.myDestination.dispose();
      }
      return;
    }
    catch (SQLiteException localSQLiteException)
    {
      Internal.recoverableError(this, "invalid dispose: " + localSQLiteException, true);
    }
  }
  
  public SQLiteConnection getDestinationConnection()
  {
    return this.myDestination;
  }
  
  public int getPageCount()
    throws SQLiteException
  {
    this.mySourceController.validate();
    this.myDestinationController.validate();
    return _SQLiteSwigged.sqlite3_backup_pagecount(handle());
  }
  
  public int getRemaining()
    throws SQLiteException
  {
    this.mySourceController.validate();
    this.myDestinationController.validate();
    return _SQLiteSwigged.sqlite3_backup_remaining(handle());
  }
  
  public boolean isFinished()
  {
    return this.myFinished;
  }
  
  public String toString()
  {
    return "Backup [" + this.mySource + " -> " + this.myDestination + "]";
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/almworks/sqlite4java/SQLiteBackup.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */