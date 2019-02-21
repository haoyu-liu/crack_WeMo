package com.almworks.sqlite4java;

import java.io.File;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Collections;
import java.util.Iterator;
import java.util.List;
import java.util.concurrent.Executors;
import java.util.concurrent.ThreadFactory;
import java.util.logging.Level;

public class SQLiteQueue
{
  public static final long DEFAULT_REINCARNATE_TIMEOUT = 3000L;
  private SQLiteConnection myConnection;
  private SQLiteJob myCurrentJob;
  private final File myDatabaseFile;
  protected Collection<SQLiteJob> myJobs;
  private final Object myLock = new Object();
  private boolean myStopRequested;
  private boolean myStopRequired;
  private volatile Thread myThread;
  private final ThreadFactory myThreadFactory;
  
  static
  {
    if (!SQLiteQueue.class.desiredAssertionStatus()) {}
    for (boolean bool = true;; bool = false)
    {
      $assertionsDisabled = bool;
      return;
    }
  }
  
  public SQLiteQueue()
  {
    this(null);
  }
  
  public SQLiteQueue(File paramFile)
  {
    this(paramFile, Executors.defaultThreadFactory());
  }
  
  public SQLiteQueue(File paramFile, ThreadFactory paramThreadFactory)
  {
    if (paramThreadFactory == null) {
      throw new NullPointerException();
    }
    this.myDatabaseFile = paramFile;
    this.myThreadFactory = paramThreadFactory;
  }
  
  private void cancelJobs(List<SQLiteJob> paramList)
  {
    if (paramList != null)
    {
      Iterator localIterator = paramList.iterator();
      while (localIterator.hasNext()) {
        ((SQLiteJob)localIterator.next()).cancel(true);
      }
    }
  }
  
  private void queueFunction()
    throws Throwable
  {
    if (Internal.isFineLogging()) {
      Internal.logFine(this, "started");
    }
    disposeConnection(this.myConnection);
    this.myConnection = null;
    this.myConnection = openConnection();
    initConnection(this.myConnection);
    for (;;)
    {
      if (Thread.interrupted()) {
        throw new InterruptedException();
      }
      synchronized (this.myLock)
      {
        this.myCurrentJob = null;
        this.myLock.notify();
        if ((this.myStopRequested) && ((this.myStopRequired) || (isJobQueueEmpty())))
        {
          if (Internal.isFineLogging()) {
            Internal.logFine(this, "thread exiting");
          }
          return;
        }
        SQLiteJob localSQLiteJob = selectJob();
        if (localSQLiteJob != null)
        {
          this.myCurrentJob = localSQLiteJob;
          executeJob(localSQLiteJob);
          continue;
        }
        this.myLock.wait(1000L);
        this.myLock.notify();
      }
    }
  }
  
  private void runQueue()
  {
    try
    {
      queueFunction();
      return;
    }
    catch (InterruptedException localInterruptedException)
    {
      Thread.currentThread().interrupt();
      Internal.logWarn(this + " interrupted", localInterruptedException);
      return;
    }
    catch (Throwable localThrowable)
    {
      Internal.log(Level.SEVERE, this, "error running job queue", localThrowable);
      if ((localThrowable instanceof ThreadDeath)) {
        throw ((ThreadDeath)localThrowable);
      }
    }
    finally
    {
      threadStopped();
    }
    threadStopped();
  }
  
  private void threadStopped()
  {
    int i = 1;
    assert (Thread.currentThread() == this.myThread) : (Thread.currentThread() + " " + this.myThread);
    disposeConnection(this.myConnection);
    this.myConnection = null;
    synchronized (this.myLock)
    {
      if (!this.myStopRequested)
      {
        if ((i != 0) && (!isReincarnationPossible()))
        {
          Internal.log(Level.SEVERE, this, "stopped abnormally, reincarnation is not possible for in-memory database", null);
          i = 0;
          this.myStopRequested = true;
        }
        List localList = null;
        if (i == 0) {
          localList = removeJobsClearQueue();
        }
        this.myThread = null;
        if (i == 0)
        {
          cancelJobs(localList);
          if (Internal.isFineLogging()) {
            Internal.logFine(this, "stopped");
          }
        }
      }
      else
      {
        i = 0;
      }
    }
    reincarnate(getReincarnationTimeout());
  }
  
  protected void addJob(SQLiteJob paramSQLiteJob)
  {
    assert (Thread.holdsLock(this.myLock)) : paramSQLiteJob;
    Collection localCollection = this.myJobs;
    if (localCollection == null)
    {
      localCollection = createJobCollection();
      this.myJobs = localCollection;
    }
    localCollection.add(paramSQLiteJob);
  }
  
  protected void afterExecute(SQLiteJob paramSQLiteJob)
    throws Throwable
  {
    assert (paramSQLiteJob.isDone()) : paramSQLiteJob;
    if (paramSQLiteJob.isCancelled()) {
      rollback();
    }
  }
  
  protected Collection<SQLiteJob> createJobCollection()
  {
    return new ArrayList();
  }
  
  protected void disposeConnection(SQLiteConnection paramSQLiteConnection)
  {
    if (paramSQLiteConnection != null) {}
    try
    {
      if (Internal.isFineLogging()) {
        Internal.logFine(this, "disposing " + paramSQLiteConnection);
      }
      paramSQLiteConnection.dispose();
      return;
    }
    catch (Exception localException)
    {
      Internal.log(Level.SEVERE, this, "error disposing connection", localException);
    }
  }
  
  public <T, J extends SQLiteJob<T>> J execute(J paramJ)
  {
    if (paramJ == null) {
      throw new NullPointerException();
    }
    synchronized (this.myLock)
    {
      if (this.myStopRequested)
      {
        Internal.logFine(this, "job not executed: " + paramJ);
        i = 1;
        if (i != 0) {
          paramJ.cancel(true);
        }
        return paramJ;
      }
      if (Internal.isFineLogging()) {
        Internal.logFine(this, "queueing " + paramJ);
      }
      addJob(paramJ);
      this.myLock.notify();
      int i = 0;
    }
  }
  
  protected void executeJob(SQLiteJob paramSQLiteJob)
    throws Throwable
  {
    if (paramSQLiteJob == null) {}
    for (;;)
    {
      return;
      SQLiteConnection localSQLiteConnection = this.myConnection;
      if (localSQLiteConnection == null) {
        throw new IllegalStateException(this + ": executeJob: no connection");
      }
      try
      {
        if (Internal.isFineLogging()) {
          Internal.logFine(this, "executing " + paramSQLiteJob);
        }
        paramSQLiteJob.execute(localSQLiteConnection, this);
        afterExecute(paramSQLiteJob);
        if (Internal.isFineLogging())
        {
          Internal.logFine(this, "finished executing " + paramSQLiteJob);
          return;
        }
      }
      catch (Throwable localThrowable)
      {
        handleJobException(paramSQLiteJob, localThrowable);
      }
    }
  }
  
  public SQLiteQueue flush()
    throws InterruptedException
  {
    synchronized (this.myLock)
    {
      if ((!isJobQueueEmpty()) || (this.myCurrentJob != null))
      {
        this.myLock.wait(1000L);
        this.myLock.notify();
      }
    }
    return this;
  }
  
  public File getDatabaseFile()
  {
    return this.myDatabaseFile;
  }
  
  protected long getReincarnationTimeout()
  {
    return 3000L;
  }
  
  protected void handleJobException(SQLiteJob paramSQLiteJob, Throwable paramThrowable)
    throws Throwable
  {
    rollback();
    if ((paramThrowable instanceof ThreadDeath)) {
      throw ((ThreadDeath)paramThrowable);
    }
  }
  
  protected void initConnection(SQLiteConnection paramSQLiteConnection)
    throws SQLiteException
  {}
  
  public boolean isDatabaseThread()
  {
    return Thread.currentThread() == this.myThread;
  }
  
  protected boolean isJobQueueEmpty()
  {
    assert (Thread.holdsLock(this.myLock));
    return (this.myJobs == null) || (this.myJobs.isEmpty());
  }
  
  protected boolean isReincarnationPossible()
  {
    return (this.myDatabaseFile != null) && (getReincarnationTimeout() >= 0L);
  }
  
  public boolean isStopped()
  {
    synchronized (this.myLock)
    {
      boolean bool = this.myStopRequested;
      return bool;
    }
  }
  
  public SQLiteQueue join()
    throws InterruptedException
  {
    if (Internal.isFineLogging()) {
      Internal.logFine(this, "waiting for queue to stop");
    }
    Thread localThread = this.myThread;
    if (localThread == Thread.currentThread()) {
      throw new IllegalStateException();
    }
    if (localThread != null) {
      localThread.join();
    }
    return this;
  }
  
  protected SQLiteConnection openConnection()
    throws SQLiteException
  {
    SQLiteConnection localSQLiteConnection = new SQLiteConnection(this.myDatabaseFile);
    if (Internal.isFineLogging()) {
      Internal.logFine(this, "opening " + localSQLiteConnection);
    }
    try
    {
      localSQLiteConnection.open();
      return localSQLiteConnection;
    }
    catch (SQLiteException localSQLiteException)
    {
      Internal.logWarn("cannot open " + localSQLiteConnection, localSQLiteException);
      throw localSQLiteException;
    }
  }
  
  protected void reincarnate(final long paramLong)
  {
    Internal.logWarn(this, "stopped abnormally, reincarnating in " + paramLong + "ms");
    Thread localThread = this.myThreadFactory.newThread(new Runnable()
    {
      /* Error */
      public void run()
      {
        // Byte code:
        //   0: aload_0
        //   1: getfield 19	com/almworks/sqlite4java/SQLiteQueue$2:this$0	Lcom/almworks/sqlite4java/SQLiteQueue;
        //   4: invokestatic 31	com/almworks/sqlite4java/SQLiteQueue:access$100	(Lcom/almworks/sqlite4java/SQLiteQueue;)Ljava/lang/Object;
        //   7: astore_2
        //   8: aload_2
        //   9: monitorenter
        //   10: invokestatic 37	java/lang/System:currentTimeMillis	()J
        //   13: lstore 4
        //   15: lload 4
        //   17: aload_0
        //   18: getfield 21	com/almworks/sqlite4java/SQLiteQueue$2:val$reincarnateTimeout	J
        //   21: ladd
        //   22: lstore 6
        //   24: lload 4
        //   26: lload 6
        //   28: lcmp
        //   29: ifge +48 -> 77
        //   32: aload_0
        //   33: getfield 19	com/almworks/sqlite4java/SQLiteQueue$2:this$0	Lcom/almworks/sqlite4java/SQLiteQueue;
        //   36: invokestatic 31	com/almworks/sqlite4java/SQLiteQueue:access$100	(Lcom/almworks/sqlite4java/SQLiteQueue;)Ljava/lang/Object;
        //   39: lload 6
        //   41: lload 4
        //   43: lsub
        //   44: invokevirtual 40	java/lang/Object:wait	(J)V
        //   47: aload_0
        //   48: getfield 19	com/almworks/sqlite4java/SQLiteQueue$2:this$0	Lcom/almworks/sqlite4java/SQLiteQueue;
        //   51: invokestatic 44	com/almworks/sqlite4java/SQLiteQueue:access$200	(Lcom/almworks/sqlite4java/SQLiteQueue;)Z
        //   54: ifeq +15 -> 69
        //   57: aload_0
        //   58: getfield 19	com/almworks/sqlite4java/SQLiteQueue$2:this$0	Lcom/almworks/sqlite4java/SQLiteQueue;
        //   61: ldc 46
        //   63: invokestatic 52	com/almworks/sqlite4java/Internal:logWarn	(Ljava/lang/Object;Ljava/lang/Object;)V
        //   66: aload_2
        //   67: monitorexit
        //   68: return
        //   69: invokestatic 37	java/lang/System:currentTimeMillis	()J
        //   72: lstore 4
        //   74: goto -50 -> 24
        //   77: aload_2
        //   78: monitorexit
        //   79: aload_0
        //   80: getfield 19	com/almworks/sqlite4java/SQLiteQueue$2:this$0	Lcom/almworks/sqlite4java/SQLiteQueue;
        //   83: invokevirtual 56	com/almworks/sqlite4java/SQLiteQueue:start	()Lcom/almworks/sqlite4java/SQLiteQueue;
        //   86: pop
        //   87: return
        //   88: astore_1
        //   89: getstatic 62	java/util/logging/Level:WARNING	Ljava/util/logging/Level;
        //   92: aload_0
        //   93: getfield 19	com/almworks/sqlite4java/SQLiteQueue$2:this$0	Lcom/almworks/sqlite4java/SQLiteQueue;
        //   96: ldc 64
        //   98: aload_1
        //   99: invokestatic 68	com/almworks/sqlite4java/Internal:log	(Ljava/util/logging/Level;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Throwable;)V
        //   102: return
        //   103: astore_3
        //   104: aload_2
        //   105: monitorexit
        //   106: aload_3
        //   107: athrow
        // Local variable table:
        //   start	length	slot	name	signature
        //   0	108	0	this	2
        //   88	11	1	localInterruptedException	InterruptedException
        //   103	4	3	localObject2	Object
        //   13	60	4	l1	long
        //   22	18	6	l2	long
        // Exception table:
        //   from	to	target	type
        //   0	10	88	java/lang/InterruptedException
        //   79	87	88	java/lang/InterruptedException
        //   106	108	88	java/lang/InterruptedException
        //   10	24	103	finally
        //   32	68	103	finally
        //   69	74	103	finally
        //   77	79	103	finally
        //   104	106	103	finally
      }
    });
    localThread.setName("reincarnate " + this + " in " + paramLong + "ms");
    localThread.start();
  }
  
  protected List<SQLiteJob> removeJobsClearQueue()
  {
    assert (Thread.holdsLock(this.myLock));
    if (this.myJobs == null) {
      return Collections.emptyList();
    }
    ArrayList localArrayList = new ArrayList(this.myJobs);
    this.myJobs.clear();
    return localArrayList;
  }
  
  protected void rollback()
  {
    if (Internal.isFineLogging()) {
      Internal.logFine(this, "rolling back transaction");
    }
    try
    {
      this.myConnection.exec("ROLLBACK");
      return;
    }
    catch (SQLiteException localSQLiteException)
    {
      while (!Internal.isFineLogging()) {}
      Internal.logFine(this, "exception during rollback: " + localSQLiteException);
    }
  }
  
  protected SQLiteJob selectJob()
  {
    assert (Thread.holdsLock(this.myLock));
    Collection localCollection = this.myJobs;
    if ((localCollection == null) || (localCollection.isEmpty())) {
      return null;
    }
    Iterator localIterator = localCollection.iterator();
    SQLiteJob localSQLiteJob = (SQLiteJob)localIterator.next();
    localIterator.remove();
    return localSQLiteJob;
  }
  
  public SQLiteQueue start()
  {
    for (;;)
    {
      Thread localThread;
      synchronized (this.myLock)
      {
        if ((this.myThread != null) || (this.myStopRequested))
        {
          if (!this.myStopRequested) {
            break label168;
          }
          str1 = "stopped";
          Internal.logWarn(this, str1);
          return this;
        }
        if (Internal.isFineLogging()) {
          Internal.logFine(this, "starting");
        }
        localThread = this.myThreadFactory.newThread(new Runnable()
        {
          public void run()
          {
            SQLiteQueue.this.runQueue();
          }
        });
        if (localThread == null) {
          throw new IllegalStateException(this + " cannot create new thread");
        }
      }
      String str2 = localThread.getName();
      if ((str2 == null) || (str2.startsWith("Thread-")) || (str2.startsWith("pool-"))) {
        localThread.setName(toString());
      }
      this.myThread = localThread;
      localThread.start();
      return this;
      label168:
      String str1 = "already started";
    }
  }
  
  public SQLiteQueue stop(boolean paramBoolean)
  {
    Object localObject1 = this.myLock;
    if (!paramBoolean) {}
    try
    {
      if ((!this.myStopRequired) && (this.myStopRequested) && (Internal.isFineLogging())) {
        Internal.logFine(this, "now stopping non-gracefully");
      }
      this.myStopRequired = true;
      if (this.myStopRequested) {
        return this;
      }
      if (Internal.isFineLogging()) {
        if (!paramBoolean) {
          break label123;
        }
      }
      label123:
      for (String str = "stopping gracefully";; str = "stopping non-gracefully")
      {
        Internal.logFine(this, str);
        this.myStopRequested = true;
        boolean bool = this.myStopRequired;
        SQLiteJob localSQLiteJob = null;
        if (bool) {
          localSQLiteJob = this.myCurrentJob;
        }
        this.myLock.notify();
        if (localSQLiteJob == null) {
          break;
        }
        localSQLiteJob.cancel(true);
        return this;
      }
      return this;
    }
    finally {}
  }
  
  public String toString()
  {
    StringBuilder localStringBuilder = new StringBuilder().append("SQLiteQueue[");
    if (this.myDatabaseFile == null) {}
    for (String str = "";; str = this.myDatabaseFile.getName()) {
      return str + "]";
    }
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/almworks/sqlite4java/SQLiteQueue.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */