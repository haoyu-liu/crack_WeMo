package com.almworks.sqlite4java;

import java.util.concurrent.ExecutionException;
import java.util.concurrent.Future;
import java.util.concurrent.TimeUnit;
import java.util.concurrent.TimeoutException;
import java.util.logging.Level;

public abstract class SQLiteJob<T>
  implements Future<T>
{
  private static final int CANCELLED = 4;
  private static final int ERROR = 3;
  private static final int PENDING = 0;
  private static final int RUNNING = 1;
  private static final int SUCCEEDED = 2;
  private SQLiteConnection myConnection;
  private Throwable myError;
  private final Object myLock = new Object();
  private SQLiteQueue myQueue;
  private T myResult;
  private int myState = 0;
  
  static
  {
    if (!SQLiteJob.class.desiredAssertionStatus()) {}
    for (boolean bool = true;; bool = false)
    {
      $assertionsDisabled = bool;
      return;
    }
  }
  
  /* Error */
  private void finishJob(T paramT)
  {
    // Byte code:
    //   0: aload_0
    //   1: getfield 46	com/almworks/sqlite4java/SQLiteJob:myLock	Ljava/lang/Object;
    //   4: astore_2
    //   5: aload_2
    //   6: monitorenter
    //   7: aload_0
    //   8: aconst_null
    //   9: putfield 54	com/almworks/sqlite4java/SQLiteJob:myConnection	Lcom/almworks/sqlite4java/SQLiteConnection;
    //   12: aload_0
    //   13: getfield 48	com/almworks/sqlite4java/SQLiteJob:myState	I
    //   16: iconst_1
    //   17: if_icmpne +13 -> 30
    //   20: aload_0
    //   21: iconst_2
    //   22: putfield 48	com/almworks/sqlite4java/SQLiteJob:myState	I
    //   25: aload_0
    //   26: aload_1
    //   27: putfield 56	com/almworks/sqlite4java/SQLiteJob:myResult	Ljava/lang/Object;
    //   30: aload_0
    //   31: getfield 48	com/almworks/sqlite4java/SQLiteJob:myState	I
    //   34: istore 4
    //   36: aload_0
    //   37: getfield 58	com/almworks/sqlite4java/SQLiteJob:myError	Ljava/lang/Throwable;
    //   40: astore 5
    //   42: aload_2
    //   43: monitorexit
    //   44: iload 4
    //   46: iconst_4
    //   47: if_icmpne +54 -> 101
    //   50: aload_0
    //   51: invokevirtual 61	com/almworks/sqlite4java/SQLiteJob:jobCancelled	()V
    //   54: aload_0
    //   55: aload_1
    //   56: invokevirtual 64	com/almworks/sqlite4java/SQLiteJob:jobFinished	(Ljava/lang/Object;)V
    //   59: aload_0
    //   60: getfield 46	com/almworks/sqlite4java/SQLiteJob:myLock	Ljava/lang/Object;
    //   63: astore 8
    //   65: aload 8
    //   67: monitorenter
    //   68: aload_0
    //   69: aconst_null
    //   70: putfield 66	com/almworks/sqlite4java/SQLiteJob:myQueue	Lcom/almworks/sqlite4java/SQLiteQueue;
    //   73: aload_0
    //   74: getfield 46	com/almworks/sqlite4java/SQLiteJob:myLock	Ljava/lang/Object;
    //   77: invokevirtual 69	java/lang/Object:notifyAll	()V
    //   80: aload 8
    //   82: monitorexit
    //   83: invokestatic 74	com/almworks/sqlite4java/Internal:isFineLogging	()Z
    //   86: ifeq +9 -> 95
    //   89: aload_0
    //   90: ldc 76
    //   92: invokestatic 80	com/almworks/sqlite4java/Internal:logFine	(Ljava/lang/Object;Ljava/lang/Object;)V
    //   95: return
    //   96: astore_3
    //   97: aload_2
    //   98: monitorexit
    //   99: aload_3
    //   100: athrow
    //   101: iload 4
    //   103: iconst_3
    //   104: if_icmpne -50 -> 54
    //   107: aload_0
    //   108: aload 5
    //   110: invokevirtual 84	com/almworks/sqlite4java/SQLiteJob:jobError	(Ljava/lang/Throwable;)V
    //   113: goto -59 -> 54
    //   116: astore 6
    //   118: getstatic 90	java/util/logging/Level:WARNING	Ljava/util/logging/Level;
    //   121: aload_0
    //   122: ldc 92
    //   124: aload 6
    //   126: invokestatic 96	com/almworks/sqlite4java/Internal:log	(Ljava/util/logging/Level;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Throwable;)V
    //   129: aload 6
    //   131: instanceof 98
    //   134: ifeq -80 -> 54
    //   137: aload 6
    //   139: checkcast 98	java/lang/ThreadDeath
    //   142: athrow
    //   143: astore 7
    //   145: getstatic 90	java/util/logging/Level:WARNING	Ljava/util/logging/Level;
    //   148: aload_0
    //   149: ldc 92
    //   151: aload 7
    //   153: invokestatic 96	com/almworks/sqlite4java/Internal:log	(Ljava/util/logging/Level;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Throwable;)V
    //   156: aload 7
    //   158: instanceof 98
    //   161: ifeq -102 -> 59
    //   164: aload 7
    //   166: checkcast 98	java/lang/ThreadDeath
    //   169: athrow
    //   170: astore 9
    //   172: aload 8
    //   174: monitorexit
    //   175: aload 9
    //   177: athrow
    // Local variable table:
    //   start	length	slot	name	signature
    //   0	178	0	this	SQLiteJob
    //   0	178	1	paramT	T
    //   4	94	2	localObject1	Object
    //   96	4	3	localObject2	Object
    //   34	71	4	i	int
    //   40	69	5	localThrowable1	Throwable
    //   116	22	6	localThrowable2	Throwable
    //   143	22	7	localThrowable3	Throwable
    //   170	6	9	localObject4	Object
    // Exception table:
    //   from	to	target	type
    //   7	30	96	finally
    //   30	44	96	finally
    //   97	99	96	finally
    //   50	54	116	java/lang/Throwable
    //   107	113	116	java/lang/Throwable
    //   54	59	143	java/lang/Throwable
    //   68	83	170	finally
    //   172	175	170	finally
  }
  
  private void processJobError(Throwable paramThrowable)
    throws Throwable
  {
    synchronized (this.myLock)
    {
      if ((paramThrowable instanceof SQLiteInterruptedException))
      {
        this.myState = 4;
        if (Internal.isFineLogging()) {
          Internal.log(Level.FINE, this, "cancelled", paramThrowable);
        }
        return;
      }
      Internal.log(Level.WARNING, this, "job exception", paramThrowable);
      this.myError = paramThrowable;
      this.myState = 3;
      throw paramThrowable;
    }
  }
  
  private boolean startJob(SQLiteConnection paramSQLiteConnection, SQLiteQueue paramSQLiteQueue)
  {
    synchronized (this.myLock)
    {
      if (this.myState != 0)
      {
        if (this.myState != 4) {
          Internal.logWarn(this, "was already executed");
        }
        return false;
      }
      this.myState = 1;
      this.myConnection = paramSQLiteConnection;
      this.myQueue = paramSQLiteQueue;
      if (Internal.isFineLogging()) {
        Internal.logFine(this, "started");
      }
      try
      {
        jobStarted(paramSQLiteConnection);
        return true;
      }
      catch (Throwable localThrowable)
      {
        Internal.log(Level.SEVERE, this, "callback exception", localThrowable);
        return true;
      }
    }
  }
  
  public void cancel()
  {
    cancel(true);
  }
  
  public boolean cancel(boolean paramBoolean)
  {
    synchronized (this.myLock)
    {
      if (isDone()) {
        return false;
      }
      if ((this.myState == 1) && (!paramBoolean)) {
        return false;
      }
    }
    assert ((this.myConnection == null) || (this.myState == 1)) : (this.myState + " " + this.myConnection);
    this.myState = 4;
    SQLiteConnection localSQLiteConnection = this.myConnection;
    if (localSQLiteConnection != null) {
      if (Internal.isFineLogging()) {
        Internal.logFine(this, "interrupting");
      }
    }
    for (;;)
    {
      try
      {
        localSQLiteConnection.interrupt();
        return true;
      }
      catch (SQLiteException localSQLiteException)
      {
        Internal.log(Level.WARNING, this, "exception when interrupting", localSQLiteException);
        continue;
      }
      if (Internal.isFineLogging()) {
        Internal.logFine(this, "cancelling");
      }
      finishJob(null);
    }
  }
  
  public T complete()
  {
    try
    {
      Object localObject = get(Long.MAX_VALUE, TimeUnit.MILLISECONDS);
      return (T)localObject;
    }
    catch (InterruptedException localInterruptedException)
    {
      Internal.log(Level.WARNING, this, "complete() consumed exception", localInterruptedException);
      Thread.currentThread().interrupt();
      return null;
    }
    catch (ExecutionException localExecutionException)
    {
      Internal.log(Level.WARNING, this, "complete() consumed exception", localExecutionException);
      return null;
    }
    catch (TimeoutException localTimeoutException)
    {
      Internal.log(Level.WARNING, this, "complete() timeout?", localTimeoutException);
    }
    return null;
  }
  
  void execute(SQLiteConnection paramSQLiteConnection, SQLiteQueue paramSQLiteQueue)
    throws Throwable
  {
    if (!startJob(paramSQLiteConnection, paramSQLiteQueue)) {
      return;
    }
    try
    {
      Object localObject2 = job(paramSQLiteConnection);
      finishJob(localObject2);
      return;
    }
    catch (Throwable localThrowable)
    {
      processJobError(localThrowable);
      return;
    }
    finally
    {
      finishJob(null);
    }
  }
  
  public T get()
    throws InterruptedException, ExecutionException
  {
    try
    {
      Object localObject = get(Long.MAX_VALUE, TimeUnit.MILLISECONDS);
      return (T)localObject;
    }
    catch (TimeoutException localTimeoutException)
    {
      throw new AssertionError(localTimeoutException + " cannot happen");
    }
  }
  
  public T get(long paramLong, TimeUnit paramTimeUnit)
    throws InterruptedException, ExecutionException, TimeoutException
  {
    synchronized (this.myLock)
    {
      if (isDone()) {
        break label85;
      }
      SQLiteQueue localSQLiteQueue = this.myQueue;
      if ((localSQLiteQueue != null) && (localSQLiteQueue.isDatabaseThread())) {
        throw new IllegalStateException("called from the database thread, would block forever");
      }
    }
    long l1 = System.currentTimeMillis();
    long l2;
    if (paramLong <= 0L) {
      l2 = l1 - 1L;
    }
    for (;;)
    {
      if ((l1 >= l2) || (isDone()))
      {
        label85:
        if (!isDone()) {
          break label190;
        }
        if (this.myState != 3) {
          break;
        }
        throw new ExecutionException(this.myError);
        l2 = l1 + paramTimeUnit.toMillis(paramLong);
        if (l2 < l1) {
          l2 = Long.MAX_VALUE;
        }
      }
      else
      {
        if (Thread.interrupted()) {
          throw new InterruptedException();
        }
        this.myLock.wait(Math.min(1000L, l2 - l1));
        l1 = System.currentTimeMillis();
      }
    }
    Object localObject3 = this.myResult;
    return (T)localObject3;
    label190:
    throw new TimeoutException();
  }
  
  public Throwable getError()
  {
    synchronized (this.myLock)
    {
      Throwable localThrowable = this.myError;
      return localThrowable;
    }
  }
  
  protected final SQLiteQueue getQueue()
  {
    synchronized (this.myLock)
    {
      SQLiteQueue localSQLiteQueue = this.myQueue;
      return localSQLiteQueue;
    }
  }
  
  public boolean isCancelled()
  {
    for (;;)
    {
      synchronized (this.myLock)
      {
        if (this.myState == 4)
        {
          bool = true;
          return bool;
        }
      }
      boolean bool = false;
    }
  }
  
  public boolean isDone()
  {
    for (;;)
    {
      synchronized (this.myLock)
      {
        if ((this.myState != 2) && (this.myState != 4))
        {
          if (this.myState != 3) {
            break label48;
          }
          break label43;
          return bool;
        }
      }
      label43:
      boolean bool = true;
      continue;
      label48:
      bool = false;
    }
  }
  
  protected abstract T job(SQLiteConnection paramSQLiteConnection)
    throws Throwable;
  
  protected void jobCancelled()
    throws Throwable
  {}
  
  protected void jobError(Throwable paramThrowable)
    throws Throwable
  {}
  
  protected void jobFinished(T paramT)
    throws Throwable
  {}
  
  protected void jobStarted(SQLiteConnection paramSQLiteConnection)
    throws Throwable
  {}
  
  public String toString()
  {
    String str = super.toString();
    int i = str.lastIndexOf('.');
    if (i >= 0) {
      str = str.substring(i + 1);
    }
    return str;
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/almworks/sqlite4java/SQLiteJob.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */