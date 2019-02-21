package com.almworks.sqlite4java;

import java.io.File;
import java.io.IOException;
import java.nio.ByteBuffer;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Locale;
import java.util.Map.Entry;
import java.util.Set;
import java.util.logging.Level;
import javolution.util.stripped.FastMap;
import javolution.util.stripped.FastMap.Entry;

public final class SQLiteConnection
{
  public static final String DEFAULT_DB_NAME = "main";
  private static final int DEFAULT_STEPS_PER_CALLBACK = 1;
  private static final int MAX_POOLED_DIRECT_BUFFER_SIZE = 1048576;
  private final ArrayList<SQLiteBlob> myBlobs = new ArrayList(10);
  private final ArrayList<DirectBuffer> myBuffers = new ArrayList(10);
  private int myBuffersTotalSize;
  private final SQLiteController myCachedController = new CachedController(null);
  private volatile Thread myConfinement;
  private boolean myDisposed;
  private final File myFile;
  private SWIGTYPE_p_sqlite3 myHandle;
  private SWIGTYPE_p_intarray_module myIntArrayModule;
  private final Object myLock = new Object();
  private int myLongArrayCounter;
  private final FastMap<String, SWIGTYPE_p_intarray> myLongArrays = FastMap.newInstance();
  private final int myNumber = Internal.nextConnectionNumber();
  private int myOpenFlags;
  private volatile SQLiteProfiler myProfiler;
  private ProgressHandler myProgressHandler;
  private final _SQLiteManual mySQLiteManual = new _SQLiteManual();
  private final FastMap<SQLParts, SWIGTYPE_p_sqlite3_stmt> myStatementCache = new FastMap();
  private final ArrayList<SQLiteStatement> myStatements = new ArrayList(100);
  private volatile int myStepsPerCallback = 1;
  private final SQLiteController myUncachedController = new UncachedController(null);
  
  static
  {
    if (!SQLiteConnection.class.desiredAssertionStatus()) {}
    for (boolean bool = true;; bool = false)
    {
      $assertionsDisabled = bool;
      return;
    }
  }
  
  public SQLiteConnection()
  {
    this(null);
  }
  
  public SQLiteConnection(File paramFile)
  {
    this.myFile = paramFile;
    Internal.logInfo(this, "instantiated [" + this.myFile + "]");
  }
  
  private DirectBuffer allocateBuffer(int paramInt)
    throws SQLiteException, IOException
  {
    checkThread();
    handle();
    int i = 1024;
    while (i < paramInt + 2) {
      i <<= 1;
    }
    int j = i - 2;
    Object localObject1 = null;
    int k;
    label159:
    int m;
    synchronized (this.myLock)
    {
      k = -1 + this.myBuffers.size();
      DirectBuffer localDirectBuffer1;
      if (k >= 0)
      {
        localDirectBuffer1 = (DirectBuffer)this.myBuffers.get(k);
        if (!localDirectBuffer1.isValid())
        {
          this.myBuffers.remove(k);
          this.myBuffersTotalSize -= localDirectBuffer1.getCapacity();
          break label368;
        }
        if (localDirectBuffer1.getCapacity() >= j) {}
      }
      else
      {
        if (localObject1 == null) {
          break label159;
        }
        ((DirectBuffer)localObject1).incUsed();
        ((DirectBuffer)localObject1).data().clear();
        return (DirectBuffer)localObject1;
      }
      if (localDirectBuffer1.isUsed()) {
        break label368;
      }
      localObject1 = localDirectBuffer1;
      break label368;
      m = this.myBuffersTotalSize;
      if ((!$assertionsDisabled) && (localObject1 != null)) {
        throw new AssertionError();
      }
    }
    DirectBuffer localDirectBuffer2 = this.mySQLiteManual.wrapper_alloc(i);
    throwResult(this.mySQLiteManual.getLastReturnCode(), "allocateBuffer", Integer.valueOf(paramInt));
    if (localDirectBuffer2 == null) {
      throw new SQLiteException(-99, "cannot allocate buffer [" + paramInt + "]");
    }
    localDirectBuffer2.incUsed();
    localDirectBuffer2.data().clear();
    Object localObject4;
    if (m + i < 1048576) {
      localObject4 = this.myLock;
    }
    for (int n = 0;; n++)
    {
      try
      {
        if ((n < this.myBuffers.size()) && (((DirectBuffer)this.myBuffers.get(n)).getCapacity() <= j)) {
          continue;
        }
        this.myBuffers.add(n, localDirectBuffer2);
        this.myBuffersTotalSize += localDirectBuffer2.getCapacity();
      }
      finally {}
      label368:
      k--;
      break;
      return localDirectBuffer2;
    }
  }
  
  private static void appendW(StringBuilder paramStringBuilder, String paramString, int paramInt, char paramChar)
  {
    paramStringBuilder.append(paramString);
    for (int i = paramString.length(); i < paramInt; i++) {
      paramStringBuilder.append(paramChar);
    }
  }
  
  private void cacheArrayHandle(SQLiteLongArray paramSQLiteLongArray)
  {
    if (Internal.isFineLogging()) {
      Internal.logFine(paramSQLiteLongArray, "returning handle to cache");
    }
    int i = 0;
    SWIGTYPE_p_intarray localSWIGTYPE_p_intarray1 = paramSQLiteLongArray.arrayHandle();
    if (localSWIGTYPE_p_intarray1 == null) {
      Internal.logWarn(paramSQLiteLongArray, "no handle");
    }
    SWIGTYPE_p_intarray localSWIGTYPE_p_intarray2;
    do
    {
      return;
      try
      {
        throwResult(_SQLiteManual.sqlite3_intarray_unbind(localSWIGTYPE_p_intarray1), "intarray_unbind");
        if (i != 0)
        {
          finalizeArray(paramSQLiteLongArray);
          return;
        }
      }
      catch (SQLiteException localSQLiteException)
      {
        for (;;)
        {
          Internal.log(Level.WARNING, paramSQLiteLongArray, "exception when clearing", localSQLiteException);
          i = 1;
        }
        localSWIGTYPE_p_intarray2 = (SWIGTYPE_p_intarray)this.myLongArrays.put(paramSQLiteLongArray.getName(), localSWIGTYPE_p_intarray1);
      }
    } while (localSWIGTYPE_p_intarray2 == null);
    Internal.logWarn(paramSQLiteLongArray, localSWIGTYPE_p_intarray1 + " expunged " + localSWIGTYPE_p_intarray2);
  }
  
  /* Error */
  private void cacheStatementHandle(SQLiteStatement paramSQLiteStatement)
  {
    // Byte code:
    //   0: invokestatic 284	com/almworks/sqlite4java/Internal:isFineLogging	()Z
    //   3: ifeq +10 -> 13
    //   6: aload_1
    //   7: ldc_w 286
    //   10: invokestatic 289	com/almworks/sqlite4java/Internal:logFine	(Ljava/lang/Object;Ljava/lang/Object;)V
    //   13: aload_1
    //   14: invokevirtual 337	com/almworks/sqlite4java/SQLiteStatement:statementHandle	()Lcom/almworks/sqlite4java/SWIGTYPE_p_sqlite3_stmt;
    //   17: astore_2
    //   18: aload_1
    //   19: invokevirtual 341	com/almworks/sqlite4java/SQLiteStatement:getSqlParts	()Lcom/almworks/sqlite4java/SQLParts;
    //   22: astore_3
    //   23: aload_1
    //   24: invokevirtual 344	com/almworks/sqlite4java/SQLiteStatement:hasStepped	()Z
    //   27: ifeq +14 -> 41
    //   30: aload_0
    //   31: aload_2
    //   32: invokestatic 350	com/almworks/sqlite4java/_SQLiteSwigged:sqlite3_reset	(Lcom/almworks/sqlite4java/SWIGTYPE_p_sqlite3_stmt;)I
    //   35: ldc_w 352
    //   38: invokevirtual 308	com/almworks/sqlite4java/SQLiteConnection:throwResult	(ILjava/lang/String;)V
    //   41: aload_1
    //   42: invokevirtual 355	com/almworks/sqlite4java/SQLiteStatement:hasBindings	()Z
    //   45: istore 10
    //   47: iconst_0
    //   48: istore 5
    //   50: iload 10
    //   52: ifeq +14 -> 66
    //   55: aload_0
    //   56: aload_2
    //   57: invokestatic 358	com/almworks/sqlite4java/_SQLiteSwigged:sqlite3_clear_bindings	(Lcom/almworks/sqlite4java/SWIGTYPE_p_sqlite3_stmt;)I
    //   60: ldc_w 360
    //   63: invokevirtual 308	com/almworks/sqlite4java/SQLiteConnection:throwResult	(ILjava/lang/String;)V
    //   66: aload_0
    //   67: getfield 79	com/almworks/sqlite4java/SQLiteConnection:myLock	Ljava/lang/Object;
    //   70: astore 6
    //   72: aload 6
    //   74: monitorenter
    //   75: iload 5
    //   77: ifne +36 -> 113
    //   80: aload_0
    //   81: getfield 95	com/almworks/sqlite4java/SQLiteConnection:myStatementCache	Ljavolution/util/stripped/FastMap;
    //   84: aload_3
    //   85: aload_2
    //   86: invokevirtual 327	javolution/util/stripped/FastMap:put	(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    //   89: checkcast 362	com/almworks/sqlite4java/SWIGTYPE_p_sqlite3_stmt
    //   92: astore 8
    //   94: aload 8
    //   96: ifnull +17 -> 113
    //   99: aload 8
    //   101: aload_2
    //   102: if_acmpne +58 -> 160
    //   105: aload_1
    //   106: ldc_w 364
    //   109: iconst_1
    //   110: invokestatic 368	com/almworks/sqlite4java/Internal:recoverableError	(Ljava/lang/Object;Ljava/lang/String;Z)V
    //   113: aload_0
    //   114: aload_1
    //   115: invokespecial 371	com/almworks/sqlite4java/SQLiteConnection:forgetStatement	(Lcom/almworks/sqlite4java/SQLiteStatement;)V
    //   118: aload 6
    //   120: monitorexit
    //   121: iload 5
    //   123: ifeq +16 -> 139
    //   126: aload_1
    //   127: ldc_w 373
    //   130: invokestatic 289	com/almworks/sqlite4java/Internal:logFine	(Ljava/lang/Object;Ljava/lang/Object;)V
    //   133: aload_0
    //   134: aload_2
    //   135: aload_3
    //   136: invokespecial 376	com/almworks/sqlite4java/SQLiteConnection:finalizeStatement	(Lcom/almworks/sqlite4java/SWIGTYPE_p_sqlite3_stmt;Lcom/almworks/sqlite4java/SQLParts;)V
    //   139: return
    //   140: astore 4
    //   142: getstatic 314	java/util/logging/Level:WARNING	Ljava/util/logging/Level;
    //   145: aload_1
    //   146: ldc_w 316
    //   149: aload 4
    //   151: invokestatic 320	com/almworks/sqlite4java/Internal:log	(Ljava/util/logging/Level;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Throwable;)V
    //   154: iconst_1
    //   155: istore 5
    //   157: goto -91 -> 66
    //   160: invokestatic 284	com/almworks/sqlite4java/Internal:isFineLogging	()Z
    //   163: ifeq +33 -> 196
    //   166: aload_1
    //   167: new 124	java/lang/StringBuilder
    //   170: dup
    //   171: invokespecial 125	java/lang/StringBuilder:<init>	()V
    //   174: ldc_w 378
    //   177: invokevirtual 131	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   180: aload_3
    //   181: invokevirtual 134	java/lang/StringBuilder:append	(Ljava/lang/Object;)Ljava/lang/StringBuilder;
    //   184: ldc_w 380
    //   187: invokevirtual 131	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   190: invokevirtual 140	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   193: invokestatic 289	com/almworks/sqlite4java/Internal:logFine	(Ljava/lang/Object;Ljava/lang/Object;)V
    //   196: aload_0
    //   197: getfield 95	com/almworks/sqlite4java/SQLiteConnection:myStatementCache	Ljavolution/util/stripped/FastMap;
    //   200: aload_3
    //   201: aload 8
    //   203: invokevirtual 327	javolution/util/stripped/FastMap:put	(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    //   206: pop
    //   207: iconst_1
    //   208: istore 5
    //   210: goto -97 -> 113
    //   213: astore 7
    //   215: aload 6
    //   217: monitorexit
    //   218: aload 7
    //   220: athrow
    // Local variable table:
    //   start	length	slot	name	signature
    //   0	221	0	this	SQLiteConnection
    //   0	221	1	paramSQLiteStatement	SQLiteStatement
    //   17	118	2	localSWIGTYPE_p_sqlite3_stmt1	SWIGTYPE_p_sqlite3_stmt
    //   22	179	3	localSQLParts	SQLParts
    //   140	10	4	localSQLiteException	SQLiteException
    //   48	161	5	i	int
    //   70	146	6	localObject1	Object
    //   213	6	7	localObject2	Object
    //   92	110	8	localSWIGTYPE_p_sqlite3_stmt2	SWIGTYPE_p_sqlite3_stmt
    //   45	6	10	bool	boolean
    // Exception table:
    //   from	to	target	type
    //   23	41	140	com/almworks/sqlite4java/SQLiteException
    //   41	47	140	com/almworks/sqlite4java/SQLiteException
    //   55	66	140	com/almworks/sqlite4java/SQLiteException
    //   80	94	213	finally
    //   105	113	213	finally
    //   113	121	213	finally
    //   160	196	213	finally
    //   196	207	213	finally
    //   215	218	213	finally
  }
  
  private void configureConnection(SWIGTYPE_p_sqlite3 paramSWIGTYPE_p_sqlite3)
  {
    int i = _SQLiteSwigged.sqlite3_extended_result_codes(paramSWIGTYPE_p_sqlite3, 1);
    if (i != 0) {
      Internal.logWarn(this, "cannot enable extended result codes [" + i + "]");
    }
  }
  
  private SQLiteLongArray createArray0(String paramString, SQLiteController paramSQLiteController)
    throws SQLiteException
  {
    SWIGTYPE_p_sqlite3 localSWIGTYPE_p_sqlite3 = handle();
    if (paramString == null) {
      paramString = nextArrayName();
    }
    SWIGTYPE_p_intarray_module localSWIGTYPE_p_intarray_module = getIntArrayModule(localSWIGTYPE_p_sqlite3);
    if (Internal.isFineLogging()) {
      Internal.logFine(this, "creating intarray [" + paramString + "]");
    }
    SWIGTYPE_p_intarray localSWIGTYPE_p_intarray = this.mySQLiteManual.sqlite3_intarray_create(localSWIGTYPE_p_intarray_module, paramString);
    int i = this.mySQLiteManual.getLastReturnCode();
    if (i != 0) {
      throwResult(i, "createArray()", paramString + " (cannot allocate virtual table)");
    }
    if (localSWIGTYPE_p_intarray == null) {
      throwResult(-99, "createArray()", paramString);
    }
    if (Internal.isFineLogging()) {
      Internal.logFine(this, "created intarray [" + paramString + "]");
    }
    return new SQLiteLongArray(paramSQLiteController, localSWIGTYPE_p_intarray, paramString);
  }
  
  private void finalizeArray(SQLiteLongArray paramSQLiteLongArray)
  {
    Internal.logFine(paramSQLiteLongArray, "finalizing");
    finalizeArrayHandle(paramSQLiteLongArray.arrayHandle(), paramSQLiteLongArray.getName());
  }
  
  private void finalizeArrayHandle(SWIGTYPE_p_intarray paramSWIGTYPE_p_intarray, String paramString)
  {
    int i = _SQLiteManual.sqlite3_intarray_destroy(paramSWIGTYPE_p_intarray);
    if (i != 0) {
      Internal.logWarn(this, "error [" + i + "] finalizing array " + paramString);
    }
  }
  
  private void finalizeArrays()
  {
    Thread localThread1 = this.myConfinement;
    Thread localThread2 = Thread.currentThread();
    int i = 0;
    if (localThread1 != localThread2) {
      i = 1;
    }
    if (i == 0) {
      Internal.logFine(this, "finalizing arrays");
    }
    for (;;)
    {
      synchronized (this.myLock)
      {
        if (!this.myLongArrays.isEmpty()) {}
      }
      synchronized (this.myLock)
      {
        int j;
        if (!this.myLongArrays.isEmpty())
        {
          j = this.myLongArrays.size();
          if (i != 0)
          {
            Internal.logWarn(this, "cannot finalize " + j + " arrays from alien thread");
            this.myLongArrays.clear();
          }
        }
        else
        {
          return;
          FastMap localFastMap = new FastMap(this.myLongArrays);
          this.myLongArrays.clear();
          Iterator localIterator = localFastMap.entrySet().iterator();
          while (localIterator.hasNext())
          {
            Map.Entry localEntry = (Map.Entry)localIterator.next();
            finalizeArrayHandle((SWIGTYPE_p_intarray)localEntry.getValue(), (String)localEntry.getKey());
          }
          localObject4 = finally;
          throw ((Throwable)localObject4);
        }
        Internal.recoverableError(this, j + " arrays are not finalized", false);
      }
    }
  }
  
  private void finalizeBlob(SQLiteBlob paramSQLiteBlob)
  {
    Internal.logFine(paramSQLiteBlob, "finalizing");
    SWIGTYPE_p_sqlite3_blob localSWIGTYPE_p_sqlite3_blob = paramSQLiteBlob.blobHandle();
    paramSQLiteBlob.clear();
    softClose(localSWIGTYPE_p_sqlite3_blob, paramSQLiteBlob);
    synchronized (this.myLock)
    {
      forgetBlob(paramSQLiteBlob);
      return;
    }
  }
  
  private void finalizeBlobs()
  {
    Thread localThread1 = this.myConfinement;
    Thread localThread2 = Thread.currentThread();
    int i = 0;
    if (localThread1 != localThread2) {
      i = 1;
    }
    if (i == 0) {
      Internal.logFine(this, "finalizing blobs");
    }
    for (;;)
    {
      synchronized (this.myLock)
      {
        if (!this.myBlobs.isEmpty()) {}
      }
      synchronized (this.myLock)
      {
        int j;
        if (!this.myBlobs.isEmpty())
        {
          j = this.myBlobs.size();
          if (i != 0) {
            Internal.logWarn(this, "cannot finalize " + j + " blobs from alien thread");
          }
        }
        else
        {
          this.myBlobs.clear();
          return;
          SQLiteBlob[] arrayOfSQLiteBlob = (SQLiteBlob[])this.myBlobs.toArray(new SQLiteBlob[this.myBlobs.size()]);
          int k = arrayOfSQLiteBlob.length;
          for (int m = 0; m < k; m++) {
            finalizeBlob(arrayOfSQLiteBlob[m]);
          }
          localObject4 = finally;
          throw ((Throwable)localObject4);
        }
        Internal.recoverableError(this, j + " blobs are not finalized", false);
      }
    }
  }
  
  private void finalizeBuffers()
  {
    DirectBuffer[] arrayOfDirectBuffer;
    synchronized (this.myLock)
    {
      if (this.myBuffers.isEmpty()) {
        return;
      }
      arrayOfDirectBuffer = (DirectBuffer[])this.myBuffers.toArray(new DirectBuffer[this.myBuffers.size()]);
      this.myBuffers.clear();
      this.myBuffersTotalSize = 0;
      if (Thread.currentThread() == this.myConfinement)
      {
        int i = arrayOfDirectBuffer.length;
        int j = 0;
        if (j >= i) {
          return;
        }
        _SQLiteManual.wrapper_free(arrayOfDirectBuffer[j]);
        j++;
      }
    }
    Internal.logWarn(this, "cannot free " + arrayOfDirectBuffer.length + " buffers from alien thread (" + Thread.currentThread() + ")");
  }
  
  private void finalizeProgressHandler(SWIGTYPE_p_sqlite3 paramSWIGTYPE_p_sqlite3)
  {
    if (Thread.currentThread() == this.myConfinement)
    {
      ProgressHandler localProgressHandler = this.myProgressHandler;
      if (localProgressHandler != null) {
        _SQLiteManual.uninstall_progress_handler(paramSWIGTYPE_p_sqlite3, localProgressHandler);
      }
    }
  }
  
  private void finalizeStatement(SQLiteStatement paramSQLiteStatement)
  {
    Internal.logFine(paramSQLiteStatement, "finalizing");
    SWIGTYPE_p_sqlite3_stmt localSWIGTYPE_p_sqlite3_stmt = paramSQLiteStatement.statementHandle();
    SQLParts localSQLParts = paramSQLiteStatement.getSqlParts();
    paramSQLiteStatement.clear();
    softFinalize(localSWIGTYPE_p_sqlite3_stmt, paramSQLiteStatement);
    synchronized (this.myLock)
    {
      forgetStatement(paramSQLiteStatement);
      forgetCachedHandle(localSWIGTYPE_p_sqlite3_stmt, localSQLParts);
      return;
    }
  }
  
  private void finalizeStatement(SWIGTYPE_p_sqlite3_stmt paramSWIGTYPE_p_sqlite3_stmt, SQLParts paramSQLParts)
  {
    if (Internal.isFineLogging()) {
      Internal.logFine(this, "finalizing cached stmt for " + paramSQLParts);
    }
    softFinalize(paramSWIGTYPE_p_sqlite3_stmt, paramSQLParts);
    synchronized (this.myLock)
    {
      forgetCachedHandle(paramSWIGTYPE_p_sqlite3_stmt, paramSQLParts);
      return;
    }
  }
  
  private void finalizeStatements()
  {
    Thread localThread1 = this.myConfinement;
    Thread localThread2 = Thread.currentThread();
    int i = 0;
    if (localThread1 != localThread2) {
      i = 1;
    }
    if (i == 0) {
      Internal.logFine(this, "finalizing statements");
    }
    for (;;)
    {
      synchronized (this.myLock)
      {
        if (this.myStatements.isEmpty()) {
          synchronized (this.myLock)
          {
            if (!this.myStatementCache.isEmpty()) {}
          }
        }
      }
      synchronized (this.myLock)
      {
        int j;
        if ((!this.myStatements.isEmpty()) || (!this.myStatementCache.isEmpty()))
        {
          j = this.myStatements.size() + this.myStatementCache.size();
          if (i != 0) {
            Internal.logWarn(this, "cannot finalize " + j + " statements from alien thread");
          }
        }
        else
        {
          this.myStatements.clear();
          this.myStatementCache.clear();
          return;
          SQLiteStatement[] arrayOfSQLiteStatement = (SQLiteStatement[])this.myStatements.toArray(new SQLiteStatement[this.myStatements.size()]);
          int k = arrayOfSQLiteStatement.length;
          for (int m = 0; m < k; m++) {
            finalizeStatement(arrayOfSQLiteStatement[m]);
          }
          localObject4 = finally;
          throw ((Throwable)localObject4);
          Map.Entry localEntry = (Map.Entry)this.myStatementCache.entrySet().iterator().next();
          SQLParts localSQLParts = (SQLParts)localEntry.getKey();
          SWIGTYPE_p_sqlite3_stmt localSWIGTYPE_p_sqlite3_stmt = (SWIGTYPE_p_sqlite3_stmt)localEntry.getValue();
          finalizeStatement(localSWIGTYPE_p_sqlite3_stmt, localSQLParts);
          continue;
          localObject6 = finally;
          throw ((Throwable)localObject6);
        }
        Internal.recoverableError(this, j + " statements are not finalized", false);
      }
    }
  }
  
  private void forgetBlob(SQLiteBlob paramSQLiteBlob)
  {
    assert (Thread.holdsLock(this.myLock));
    if (!this.myBlobs.remove(paramSQLiteBlob)) {
      Internal.recoverableError(paramSQLiteBlob, "alien blob", true);
    }
  }
  
  private void forgetCachedHandle(SWIGTYPE_p_sqlite3_stmt paramSWIGTYPE_p_sqlite3_stmt, SQLParts paramSQLParts)
  {
    assert (Thread.holdsLock(this.myLock));
    SWIGTYPE_p_sqlite3_stmt localSWIGTYPE_p_sqlite3_stmt = (SWIGTYPE_p_sqlite3_stmt)this.myStatementCache.remove(paramSQLParts);
    if ((localSWIGTYPE_p_sqlite3_stmt != null) && (localSWIGTYPE_p_sqlite3_stmt != paramSWIGTYPE_p_sqlite3_stmt)) {
      this.myStatementCache.put(paramSQLParts, localSWIGTYPE_p_sqlite3_stmt);
    }
  }
  
  private void forgetStatement(SQLiteStatement paramSQLiteStatement)
  {
    assert (Thread.holdsLock(this.myLock));
    if (!this.myStatements.remove(paramSQLiteStatement)) {
      Internal.recoverableError(paramSQLiteStatement, "alien statement", true);
    }
  }
  
  private void freeBuffer(DirectBuffer paramDirectBuffer)
    throws SQLiteException
  {
    checkThread();
    synchronized (this.myLock)
    {
      if (this.myBuffers.indexOf(paramDirectBuffer) >= 0)
      {
        i = 1;
        paramDirectBuffer.decUsed();
        if ((i == 0) && (_SQLiteManual.wrapper_free(paramDirectBuffer) != 0)) {
          Internal.recoverableError(this, "error deallocating buffer", true);
        }
        return;
      }
      int i = 0;
    }
  }
  
  private SWIGTYPE_p_intarray_module getIntArrayModule(SWIGTYPE_p_sqlite3 paramSWIGTYPE_p_sqlite3)
    throws SQLiteException
  {
    SWIGTYPE_p_intarray_module localSWIGTYPE_p_intarray_module = this.myIntArrayModule;
    if (localSWIGTYPE_p_intarray_module == null)
    {
      if (Internal.isFineLogging()) {
        Internal.logFine(this, "registering INTARRAY module");
      }
      localSWIGTYPE_p_intarray_module = this.mySQLiteManual.sqlite3_intarray_register(paramSWIGTYPE_p_sqlite3);
      this.myIntArrayModule = localSWIGTYPE_p_intarray_module;
      throwResult(this.mySQLiteManual.getLastReturnCode(), "getIntArrayModule()");
      if (localSWIGTYPE_p_intarray_module == null) {
        throwResult(-99, "getIntArrayModule()");
      }
    }
    return localSWIGTYPE_p_intarray_module;
  }
  
  private ProgressHandler getProgressHandler()
    throws SQLiteException
  {
    ProgressHandler localProgressHandler = this.myProgressHandler;
    if (localProgressHandler == null)
    {
      localProgressHandler = this.mySQLiteManual.install_progress_handler(handle(), this.myStepsPerCallback);
      if (localProgressHandler == null)
      {
        Internal.logWarn(this, "cannot install progress handler [" + this.mySQLiteManual.getLastReturnCode() + "]");
        localProgressHandler = ProgressHandler.DISPOSED;
      }
      this.myProgressHandler = localProgressHandler;
    }
    return localProgressHandler;
  }
  
  private String getSqliteDbName()
  {
    if (this.myFile == null) {
      return ":memory:";
    }
    return this.myFile.getAbsolutePath();
  }
  
  private SWIGTYPE_p_sqlite3 handle()
    throws SQLiteException
  {
    synchronized (this.myLock)
    {
      if (this.myDisposed) {
        throw new SQLiteException(-92, "connection is disposed");
      }
    }
    SWIGTYPE_p_sqlite3 localSWIGTYPE_p_sqlite3 = this.myHandle;
    if (localSWIGTYPE_p_sqlite3 == null) {
      throw new SQLiteException(-97, null);
    }
    return localSWIGTYPE_p_sqlite3;
  }
  
  private String nextArrayName()
  {
    Object[] arrayOfObject = new Object[1];
    int i = 1 + this.myLongArrayCounter;
    this.myLongArrayCounter = i;
    arrayOfObject[0] = Integer.valueOf(i);
    return String.format("__IA%02X", arrayOfObject);
  }
  
  private void open0(int paramInt)
    throws SQLiteException
  {
    
    if (Internal.isFineLogging()) {
      Internal.logFine(this, "opening (0x" + Integer.toHexString(paramInt).toUpperCase(Locale.US) + ")");
    }
    synchronized (this.myLock)
    {
      if (this.myDisposed) {
        throw new SQLiteException(-92, "cannot reopen closed connection");
      }
    }
    if (this.myConfinement == null)
    {
      this.myConfinement = Thread.currentThread();
      if (Internal.isFineLogging()) {
        Internal.logFine(this, "confined to " + this.myConfinement);
      }
    }
    for (;;)
    {
      SWIGTYPE_p_sqlite3 localSWIGTYPE_p_sqlite31 = this.myHandle;
      if (localSWIGTYPE_p_sqlite31 == null) {
        break;
      }
      Internal.recoverableError(this, "already opened", true);
      return;
      checkThread();
    }
    String str1 = getSqliteDbName();
    if (Internal.isFineLogging()) {
      Internal.logFine(this, "dbname [" + str1 + "]");
    }
    SWIGTYPE_p_sqlite3 localSWIGTYPE_p_sqlite32 = this.mySQLiteManual.sqlite3_open_v2(str1, paramInt);
    int i = this.mySQLiteManual.getLastReturnCode();
    if (i != 0)
    {
      if (localSWIGTYPE_p_sqlite32 != null) {
        if (Internal.isFineLogging()) {
          Internal.logFine(this, "error on open (" + i + "), closing handle");
        }
      }
      try
      {
        _SQLiteSwigged.sqlite3_close(localSWIGTYPE_p_sqlite32);
        String str2 = this.mySQLiteManual.drainLastOpenError();
        if (str2 == null) {
          str2 = "open database error code " + i;
        }
        throw new SQLiteException(i, str2);
      }
      catch (Exception localException)
      {
        for (;;)
        {
          Internal.log(Level.FINE, this, "error on closing after failed open", localException);
        }
      }
    }
    if (localSWIGTYPE_p_sqlite32 == null) {
      throw new SQLiteException(-99, "sqlite didn't return db handle");
    }
    configureConnection(localSWIGTYPE_p_sqlite32);
    synchronized (this.myLock)
    {
      this.myHandle = localSWIGTYPE_p_sqlite32;
      this.myOpenFlags = paramInt;
      Internal.logInfo(this, "opened");
      return;
    }
  }
  
  private void softClose(SWIGTYPE_p_sqlite3_blob paramSWIGTYPE_p_sqlite3_blob, Object paramObject)
  {
    int i = _SQLiteSwigged.sqlite3_blob_close(paramSWIGTYPE_p_sqlite3_blob);
    if (i != 0) {
      Internal.logWarn(this, "error [" + i + "] finishing " + paramObject);
    }
  }
  
  private void softFinalize(SWIGTYPE_p_sqlite3_stmt paramSWIGTYPE_p_sqlite3_stmt, Object paramObject)
  {
    int i = _SQLiteSwigged.sqlite3_finalize(paramSWIGTYPE_p_sqlite3_stmt);
    if (i != 0) {
      Internal.logWarn(this, "error [" + i + "] finishing " + paramObject);
    }
  }
  
  public SQLiteBlob blob(String paramString1, String paramString2, long paramLong, boolean paramBoolean)
    throws SQLiteException
  {
    return blob(null, paramString1, paramString2, paramLong, paramBoolean);
  }
  
  public SQLiteBlob blob(String paramString1, String paramString2, String paramString3, long paramLong, boolean paramBoolean)
    throws SQLiteException
  {
    checkThread();
    if (Internal.isFineLogging()) {
      Internal.logFine(this, "openBlob [" + paramString1 + "," + paramString2 + "," + paramString3 + "," + paramLong + "," + paramBoolean + "]");
    }
    SWIGTYPE_p_sqlite3 localSWIGTYPE_p_sqlite3 = handle();
    SWIGTYPE_p_sqlite3_blob localSWIGTYPE_p_sqlite3_blob = this.mySQLiteManual.sqlite3_blob_open(localSWIGTYPE_p_sqlite3, paramString1, paramString2, paramString3, paramLong, paramBoolean);
    throwResult(this.mySQLiteManual.getLastReturnCode(), "openBlob()", null);
    if (localSWIGTYPE_p_sqlite3_blob == null) {
      throw new SQLiteException(-99, "sqlite did not return blob");
    }
    SQLiteBlob localSQLiteBlob;
    synchronized (this.myLock)
    {
      if (this.myHandle != null) {
        localSQLiteBlob = new SQLiteBlob(this.myUncachedController, localSWIGTYPE_p_sqlite3_blob, paramString1, paramString2, paramString3, paramLong, paramBoolean);
      }
    }
    for (;;)
    {
      try
      {
        this.myBlobs.add(localSQLiteBlob);
        if (localSQLiteBlob != null) {}
      }
      finally
      {
        continue;
      }
      try
      {
        throwResult(_SQLiteSwigged.sqlite3_blob_close(localSWIGTYPE_p_sqlite3_blob), "blob_close() in prepare()");
        throw new SQLiteException(-97, "connection disposed");
        Internal.logWarn(this, "connection disposed while opening blob");
        localSQLiteBlob = null;
        continue;
        localObject2 = finally;
        throw ((Throwable)localObject2);
        return localSQLiteBlob;
      }
      catch (Exception localException) {}
    }
  }
  
  void checkThread()
    throws SQLiteException
  {
    Thread localThread1 = this.myConfinement;
    if (localThread1 == null) {
      throw new SQLiteException(-92, this + " is not confined or already disposed");
    }
    Thread localThread2 = Thread.currentThread();
    if (localThread2 != localThread1) {
      throw new SQLiteException(-98, this + " confined(" + localThread1 + ") used (" + localThread2 + ")");
    }
  }
  
  SWIGTYPE_p_sqlite3 connectionHandle()
  {
    return this.myHandle;
  }
  
  public SQLiteLongArray createArray()
    throws SQLiteException
  {
    return createArray(null, true);
  }
  
  public SQLiteLongArray createArray(String paramString, boolean paramBoolean)
    throws SQLiteException
  {
    checkThread();
    if (Internal.isFineLogging()) {
      Internal.logFine(this, "createArray [" + paramString + "," + paramBoolean + "]");
    }
    if ((!paramBoolean) && (paramString != null) && (this.myLongArrays.containsKey(paramString)))
    {
      Internal.logWarn(this, "using cached array in lieu of passed parameter, because name already in use");
      paramBoolean = true;
    }
    if (!paramBoolean) {
      return createArray0(paramString, this.myUncachedController);
    }
    if ((paramString == null) && (!this.myLongArrays.isEmpty())) {
      paramString = (String)this.myLongArrays.head().getNext().getKey();
    }
    if (paramString == null) {}
    for (SWIGTYPE_p_intarray localSWIGTYPE_p_intarray = null; localSWIGTYPE_p_intarray != null; localSWIGTYPE_p_intarray = (SWIGTYPE_p_intarray)this.myLongArrays.remove(paramString)) {
      return new SQLiteLongArray(this.myCachedController, localSWIGTYPE_p_intarray, paramString);
    }
    return createArray0(paramString, this.myCachedController);
  }
  
  public String debug(String paramString)
  {
    SQLiteStatement localSQLiteStatement = null;
    label31:
    do
    {
      try
      {
        localSQLiteStatement = prepare(paramString);
        if (localSQLiteStatement.step()) {
          break label31;
        }
        localObject2 = "";
      }
      catch (SQLiteException localSQLiteException)
      {
        int i;
        int[] arrayOfInt;
        String[] arrayOfString;
        int j;
        ArrayList localArrayList;
        String str2;
        StringBuilder localStringBuilder;
        int m;
        int n;
        str1 = localSQLiteException.getMessage();
        Object localObject2 = str1;
        return (String)localObject2;
      }
      finally
      {
        if (localSQLiteStatement == null) {
          break label433;
        }
        localSQLiteStatement.dispose();
      }
      return (String)localObject2;
      i = localSQLiteStatement.columnCount();
      if (i != 0) {
        break;
      }
      localObject2 = "";
    } while (localSQLiteStatement == null);
    localSQLiteStatement.dispose();
    return (String)localObject2;
    arrayOfInt = new int[i];
    arrayOfString = new String[i];
    for (j = 0; j < i; j++)
    {
      arrayOfString[j] = String.valueOf(localSQLiteStatement.getColumnName(j));
      arrayOfInt[j] = arrayOfString[j].length();
    }
    localArrayList = new ArrayList();
    break label435;
    label126:
    int k;
    if (k < i)
    {
      if (localSQLiteStatement.columnNull(k)) {}
      for (str2 = "<null>";; str2 = String.valueOf(localSQLiteStatement.columnValue(k)))
      {
        localArrayList.add(str2);
        arrayOfInt[k] = Math.max(arrayOfInt[k], str2.length());
        k++;
        break;
      }
    }
    if (!localSQLiteStatement.step())
    {
      localStringBuilder = new StringBuilder();
      localStringBuilder.append('|');
      for (m = 0; m < i; m++)
      {
        appendW(localStringBuilder, arrayOfString[m], arrayOfInt[m], ' ');
        localStringBuilder.append('|');
      }
      localStringBuilder.append("\n|");
      for (n = 0; n < i; n++)
      {
        appendW(localStringBuilder, "", arrayOfInt[n], '-');
        localStringBuilder.append('|');
      }
    }
    for (;;)
    {
      int i1;
      if (i1 < localArrayList.size())
      {
        if (i1 % i == 0) {
          localStringBuilder.append("\n|");
        }
        appendW(localStringBuilder, (String)localArrayList.get(i1), arrayOfInt[(i1 % i)], ' ');
        localStringBuilder.append('|');
        i1++;
      }
      else
      {
        String str3 = localStringBuilder.toString();
        localObject2 = str3;
        if (localSQLiteStatement == null) {
          break;
        }
        localSQLiteStatement.dispose();
        return (String)localObject2;
        String str1;
        label433:
        label435:
        k = 0;
        break label126;
        i1 = 0;
      }
    }
  }
  
  public void dispose()
  {
    synchronized (this.myLock)
    {
      if (this.myDisposed) {
        return;
      }
      Thread localThread = this.myConfinement;
      if ((localThread != null) && (localThread != Thread.currentThread()))
      {
        Internal.recoverableError(this, "will not dispose from a non-confining thread", true);
        return;
      }
    }
    this.myDisposed = true;
    SWIGTYPE_p_sqlite3 localSWIGTYPE_p_sqlite3 = this.myHandle;
    this.myHandle = null;
    this.myOpenFlags = 0;
    if (localSWIGTYPE_p_sqlite3 != null)
    {
      Internal.logFine(this, "disposing");
      finalizeStatements();
      finalizeBlobs();
      finalizeBuffers();
      finalizeArrays();
      finalizeProgressHandler(localSWIGTYPE_p_sqlite3);
      int i = _SQLiteSwigged.sqlite3_close(localSWIGTYPE_p_sqlite3);
      if (i != 0) {}
      try
      {
        String str3 = _SQLiteSwigged.sqlite3_errmsg(localSWIGTYPE_p_sqlite3);
        str1 = str3;
      }
      catch (Exception localException)
      {
        for (;;)
        {
          StringBuilder localStringBuilder;
          Internal.log(Level.WARNING, this, "cannot get sqlite3_errmsg", localException);
          String str1 = null;
          continue;
          String str2 = ": " + str1;
        }
      }
      localStringBuilder = new StringBuilder().append("close error ").append(i);
      if (str1 == null)
      {
        str2 = "";
        Internal.logWarn(this, str2);
        Internal.logInfo(this, "connection closed");
        this.myConfinement = null;
        return;
      }
    }
  }
  
  /* Error */
  public SQLiteConnection exec(String paramString)
    throws SQLiteException
  {
    // Byte code:
    //   0: aload_0
    //   1: invokevirtual 203	com/almworks/sqlite4java/SQLiteConnection:checkThread	()V
    //   4: aload_0
    //   5: getfield 831	com/almworks/sqlite4java/SQLiteConnection:myProfiler	Lcom/almworks/sqlite4java/SQLiteProfiler;
    //   8: astore_2
    //   9: invokestatic 284	com/almworks/sqlite4java/Internal:isFineLogging	()Z
    //   12: ifeq +32 -> 44
    //   15: aload_0
    //   16: new 124	java/lang/StringBuilder
    //   19: dup
    //   20: invokespecial 125	java/lang/StringBuilder:<init>	()V
    //   23: ldc_w 833
    //   26: invokevirtual 131	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   29: aload_1
    //   30: invokevirtual 131	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   33: ldc -120
    //   35: invokevirtual 131	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   38: invokevirtual 140	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   41: invokestatic 289	com/almworks/sqlite4java/Internal:logFine	(Ljava/lang/Object;Ljava/lang/Object;)V
    //   44: aload_0
    //   45: invokespecial 168	com/almworks/sqlite4java/SQLiteConnection:handle	()Lcom/almworks/sqlite4java/SWIGTYPE_p_sqlite3;
    //   48: astore_3
    //   49: aload_0
    //   50: invokespecial 196	com/almworks/sqlite4java/SQLiteConnection:getProgressHandler	()Lcom/almworks/sqlite4java/ProgressHandler;
    //   53: astore 4
    //   55: aload 4
    //   57: invokevirtual 835	com/almworks/sqlite4java/ProgressHandler:reset	()V
    //   60: iconst_1
    //   61: anewarray 275	java/lang/String
    //   64: dup
    //   65: iconst_0
    //   66: aconst_null
    //   67: aastore
    //   68: astore 5
    //   70: aload_2
    //   71: ifnonnull +101 -> 172
    //   74: lconst_0
    //   75: lstore 9
    //   77: aload_3
    //   78: aload_1
    //   79: aload 5
    //   81: invokestatic 839	com/almworks/sqlite4java/_SQLiteManual:sqlite3_exec	(Lcom/almworks/sqlite4java/SWIGTYPE_p_sqlite3;Ljava/lang/String;[Ljava/lang/String;)I
    //   84: istore 11
    //   86: aload_2
    //   87: ifnull +15 -> 102
    //   90: aload_2
    //   91: aload_1
    //   92: lload 9
    //   94: invokestatic 845	java/lang/System:nanoTime	()J
    //   97: iload 11
    //   99: invokevirtual 851	com/almworks/sqlite4java/SQLiteProfiler:reportExec	(Ljava/lang/String;JJI)V
    //   102: aload_0
    //   103: iload 11
    //   105: ldc_w 853
    //   108: aload 5
    //   110: iconst_0
    //   111: aaload
    //   112: invokevirtual 259	com/almworks/sqlite4java/SQLiteConnection:throwResult	(ILjava/lang/String;Ljava/lang/Object;)V
    //   115: invokestatic 284	com/almworks/sqlite4java/Internal:isFineLogging	()Z
    //   118: ifeq +47 -> 165
    //   121: aload_0
    //   122: new 124	java/lang/StringBuilder
    //   125: dup
    //   126: invokespecial 125	java/lang/StringBuilder:<init>	()V
    //   129: ldc_w 833
    //   132: invokevirtual 131	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   135: aload_1
    //   136: invokevirtual 131	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   139: ldc_w 855
    //   142: invokevirtual 131	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   145: aload 4
    //   147: invokevirtual 858	com/almworks/sqlite4java/ProgressHandler:getSteps	()J
    //   150: invokevirtual 697	java/lang/StringBuilder:append	(J)Ljava/lang/StringBuilder;
    //   153: ldc_w 860
    //   156: invokevirtual 131	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   159: invokevirtual 140	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   162: invokestatic 289	com/almworks/sqlite4java/Internal:logFine	(Ljava/lang/Object;Ljava/lang/Object;)V
    //   165: aload 4
    //   167: invokevirtual 835	com/almworks/sqlite4java/ProgressHandler:reset	()V
    //   170: aload_0
    //   171: areturn
    //   172: invokestatic 845	java/lang/System:nanoTime	()J
    //   175: lstore 7
    //   177: lload 7
    //   179: lstore 9
    //   181: goto -104 -> 77
    //   184: astore 6
    //   186: invokestatic 284	com/almworks/sqlite4java/Internal:isFineLogging	()Z
    //   189: ifeq +47 -> 236
    //   192: aload_0
    //   193: new 124	java/lang/StringBuilder
    //   196: dup
    //   197: invokespecial 125	java/lang/StringBuilder:<init>	()V
    //   200: ldc_w 833
    //   203: invokevirtual 131	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   206: aload_1
    //   207: invokevirtual 131	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   210: ldc_w 855
    //   213: invokevirtual 131	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   216: aload 4
    //   218: invokevirtual 858	com/almworks/sqlite4java/ProgressHandler:getSteps	()J
    //   221: invokevirtual 697	java/lang/StringBuilder:append	(J)Ljava/lang/StringBuilder;
    //   224: ldc_w 860
    //   227: invokevirtual 131	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   230: invokevirtual 140	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   233: invokestatic 289	com/almworks/sqlite4java/Internal:logFine	(Ljava/lang/Object;Ljava/lang/Object;)V
    //   236: aload 4
    //   238: invokevirtual 835	com/almworks/sqlite4java/ProgressHandler:reset	()V
    //   241: aload 6
    //   243: athrow
    // Local variable table:
    //   start	length	slot	name	signature
    //   0	244	0	this	SQLiteConnection
    //   0	244	1	paramString	String
    //   8	83	2	localSQLiteProfiler	SQLiteProfiler
    //   48	30	3	localSWIGTYPE_p_sqlite3	SWIGTYPE_p_sqlite3
    //   53	184	4	localProgressHandler	ProgressHandler
    //   68	41	5	arrayOfString	String[]
    //   184	58	6	localObject	Object
    //   175	3	7	l1	long
    //   75	105	9	l2	long
    //   84	20	11	i	int
    // Exception table:
    //   from	to	target	type
    //   60	70	184	finally
    //   77	86	184	finally
    //   90	102	184	finally
    //   102	115	184	finally
    //   172	177	184	finally
  }
  
  protected void finalize()
    throws Throwable
  {
    super.finalize();
    SWIGTYPE_p_sqlite3 localSWIGTYPE_p_sqlite3 = this.myHandle;
    boolean bool = this.myDisposed;
    if ((localSWIGTYPE_p_sqlite3 != null) || (!bool)) {
      Internal.recoverableError(this, "wasn't disposed before finalizing", true);
    }
  }
  
  public boolean getAutoCommit()
    throws SQLiteException
  {
    checkThread();
    return _SQLiteSwigged.sqlite3_get_autocommit(handle()) != 0;
  }
  
  public int getChanges()
    throws SQLiteException
  {
    checkThread();
    return _SQLiteSwigged.sqlite3_changes(handle());
  }
  
  public File getDatabaseFile()
  {
    return this.myFile;
  }
  
  public int getErrorCode()
    throws SQLiteException
  {
    checkThread();
    return _SQLiteSwigged.sqlite3_errcode(handle());
  }
  
  public String getErrorMessage()
    throws SQLiteException
  {
    checkThread();
    return _SQLiteSwigged.sqlite3_errmsg(handle());
  }
  
  public long getLastInsertId()
    throws SQLiteException
  {
    checkThread();
    return _SQLiteSwigged.sqlite3_last_insert_rowid(handle());
  }
  
  public int getLimit(int paramInt)
    throws SQLiteException
  {
    checkThread();
    return _SQLiteSwigged.sqlite3_limit(handle(), paramInt, -1);
  }
  
  public int getOpenFlags()
  {
    synchronized (this.myLock)
    {
      int i = this.myOpenFlags;
      return i;
    }
  }
  
  int getStatementCount()
  {
    synchronized (this.myLock)
    {
      int i = this.myStatements.size();
      return i;
    }
  }
  
  public SQLiteColumnMetadata getTableColumnMetadata(String paramString1, String paramString2, String paramString3)
    throws SQLiteException
  {
    checkThread();
    if (Internal.isFineLogging()) {
      Internal.logFine(this, "calling sqlite3_table_column_metadata [" + paramString1 + "," + paramString2 + "," + paramString3 + "]");
    }
    return this.mySQLiteManual.sqlite3_table_column_metadata(handle(), paramString1, paramString2, paramString3);
  }
  
  public int getTotalChanges()
    throws SQLiteException
  {
    checkThread();
    return _SQLiteSwigged.sqlite3_total_changes(handle());
  }
  
  public SQLiteBackup initializeBackup(File paramFile)
    throws SQLiteException
  {
    return initializeBackup("main", paramFile, 6);
  }
  
  public SQLiteBackup initializeBackup(String paramString, File paramFile, int paramInt)
    throws SQLiteException
  {
    checkThread();
    SQLiteConnection localSQLiteConnection = new SQLiteConnection(paramFile).openV2(paramInt);
    if (Internal.isFineLogging()) {
      Internal.logFine(this, "initializeBackup to " + localSQLiteConnection);
    }
    SWIGTYPE_p_sqlite3 localSWIGTYPE_p_sqlite3 = handle();
    SWIGTYPE_p_sqlite3_backup localSWIGTYPE_p_sqlite3_backup = _SQLiteSwigged.sqlite3_backup_init(localSQLiteConnection.handle(), "main", localSWIGTYPE_p_sqlite3, paramString);
    if (localSWIGTYPE_p_sqlite3_backup == null) {
      try
      {
        localSQLiteConnection.throwResult(localSQLiteConnection.getErrorCode(), "backup initialization");
        throw new SQLiteException(-99, "backup failed to start but error code is 0");
      }
      finally
      {
        localSQLiteConnection.dispose();
      }
    }
    SQLiteController localSQLiteController = localSQLiteConnection.myUncachedController;
    return new SQLiteBackup(this.myUncachedController, localSQLiteController, localSWIGTYPE_p_sqlite3_backup, this, localSQLiteConnection);
  }
  
  public void interrupt()
    throws SQLiteException
  {
    _SQLiteSwigged.sqlite3_interrupt(handle());
  }
  
  public boolean isDisposed()
  {
    synchronized (this.myLock)
    {
      boolean bool = this.myDisposed;
      return bool;
    }
  }
  
  public boolean isMemoryDatabase()
  {
    return this.myFile == null;
  }
  
  public boolean isOpen()
  {
    for (;;)
    {
      synchronized (this.myLock)
      {
        if ((this.myHandle != null) && (!this.myDisposed))
        {
          bool = true;
          return bool;
        }
      }
      boolean bool = false;
    }
  }
  
  public boolean isReadOnly()
    throws SQLiteException
  {
    return isReadOnly(null);
  }
  
  public boolean isReadOnly(String paramString)
    throws SQLiteException
  {
    checkThread();
    if (Internal.isFineLogging()) {
      Internal.logFine(this, "calling sqlite3_db_readonly [" + paramString + "]");
    }
    int i = _SQLiteSwigged.sqlite3_db_readonly(handle(), paramString);
    if (i == -1) {
      throw new SQLiteException(i, paramString + " is not a valid database name");
    }
    assert ((i == 0) || (i == 1)) : i;
    return i == 1;
  }
  
  public void loadExtension(File paramFile)
    throws SQLiteException
  {
    loadExtension(paramFile, null);
  }
  
  public void loadExtension(File paramFile, String paramString)
    throws SQLiteException
  {
    checkThread();
    SWIGTYPE_p_sqlite3 localSWIGTYPE_p_sqlite3 = handle();
    String str1 = paramFile.getAbsolutePath();
    if (Internal.isFineLogging()) {
      Internal.logFine(this, "loading extension from (" + str1 + "," + paramString + ")");
    }
    String str2 = this.mySQLiteManual.sqlite3_load_extension(localSWIGTYPE_p_sqlite3, str1, paramString);
    throwResult(this.mySQLiteManual.getLastReturnCode(), "loadExtension()", str2);
    if (Internal.isFineLogging()) {
      Internal.logFine(this, "extension (" + str1 + "," + paramString + ") loaded");
    }
  }
  
  public SQLiteConnection open()
    throws SQLiteException
  {
    return open(true);
  }
  
  public SQLiteConnection open(boolean paramBoolean)
    throws SQLiteException
  {
    int i = 2;
    if (!paramBoolean)
    {
      if (isMemoryDatabase()) {
        throw new SQLiteException(-99, "cannot open memory database without creation");
      }
    }
    else {
      i |= 0x4;
    }
    open0(i);
    return this;
  }
  
  public SQLiteConnection openReadonly()
    throws SQLiteException
  {
    if (isMemoryDatabase()) {
      throw new SQLiteException(-99, "cannot open memory database in read-only mode");
    }
    open0(1);
    return this;
  }
  
  public SQLiteConnection openV2(int paramInt)
    throws SQLiteException
  {
    open0(paramInt);
    return this;
  }
  
  public SQLiteStatement prepare(SQLParts paramSQLParts)
    throws SQLiteException
  {
    return prepare(paramSQLParts, true);
  }
  
  /* Error */
  public SQLiteStatement prepare(SQLParts paramSQLParts, boolean paramBoolean)
    throws SQLiteException
  {
    // Byte code:
    //   0: aload_0
    //   1: invokevirtual 203	com/almworks/sqlite4java/SQLiteConnection:checkThread	()V
    //   4: aload_0
    //   5: getfield 831	com/almworks/sqlite4java/SQLiteConnection:myProfiler	Lcom/almworks/sqlite4java/SQLiteProfiler;
    //   8: astore_3
    //   9: invokestatic 284	com/almworks/sqlite4java/Internal:isFineLogging	()Z
    //   12: ifeq +32 -> 44
    //   15: aload_0
    //   16: new 124	java/lang/StringBuilder
    //   19: dup
    //   20: invokespecial 125	java/lang/StringBuilder:<init>	()V
    //   23: ldc_w 990
    //   26: invokevirtual 131	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   29: aload_1
    //   30: invokevirtual 134	java/lang/StringBuilder:append	(Ljava/lang/Object;)Ljava/lang/StringBuilder;
    //   33: ldc -120
    //   35: invokevirtual 131	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   38: invokevirtual 140	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   41: invokestatic 289	com/almworks/sqlite4java/Internal:logFine	(Ljava/lang/Object;Ljava/lang/Object;)V
    //   44: aload_1
    //   45: ifnonnull +11 -> 56
    //   48: new 992	java/lang/IllegalArgumentException
    //   51: dup
    //   52: invokespecial 993	java/lang/IllegalArgumentException:<init>	()V
    //   55: athrow
    //   56: aload_0
    //   57: getfield 79	com/almworks/sqlite4java/SQLiteConnection:myLock	Ljava/lang/Object;
    //   60: astore 4
    //   62: aload 4
    //   64: monitorenter
    //   65: aconst_null
    //   66: astore 5
    //   68: aconst_null
    //   69: astore 6
    //   71: iload_2
    //   72: ifeq +106 -> 178
    //   75: aload_0
    //   76: getfield 95	com/almworks/sqlite4java/SQLiteConnection:myStatementCache	Ljavolution/util/stripped/FastMap;
    //   79: aload_1
    //   80: invokevirtual 997	javolution/util/stripped/FastMap:getEntry	(Ljava/lang/Object;)Ljavolution/util/stripped/FastMap$Entry;
    //   83: astore 20
    //   85: aconst_null
    //   86: astore 5
    //   88: aconst_null
    //   89: astore 6
    //   91: aload 20
    //   93: ifnull +85 -> 178
    //   96: aload 20
    //   98: invokevirtual 750	javolution/util/stripped/FastMap$Entry:getKey	()Ljava/lang/Object;
    //   101: checkcast 546	com/almworks/sqlite4java/SQLParts
    //   104: astore 5
    //   106: getstatic 63	com/almworks/sqlite4java/SQLiteConnection:$assertionsDisabled	Z
    //   109: ifne +24 -> 133
    //   112: aload 5
    //   114: ifnonnull +19 -> 133
    //   117: new 241	java/lang/AssertionError
    //   120: dup
    //   121: invokespecial 242	java/lang/AssertionError:<init>	()V
    //   124: athrow
    //   125: astore 19
    //   127: aload 4
    //   129: monitorexit
    //   130: aload 19
    //   132: athrow
    //   133: getstatic 63	com/almworks/sqlite4java/SQLiteConnection:$assertionsDisabled	Z
    //   136: ifne +20 -> 156
    //   139: aload 5
    //   141: invokevirtual 1000	com/almworks/sqlite4java/SQLParts:isFixed	()Z
    //   144: ifne +12 -> 156
    //   147: new 241	java/lang/AssertionError
    //   150: dup
    //   151: aload_1
    //   152: invokespecial 1003	java/lang/AssertionError:<init>	(Ljava/lang/Object;)V
    //   155: athrow
    //   156: aload 20
    //   158: invokevirtual 1004	javolution/util/stripped/FastMap$Entry:getValue	()Ljava/lang/Object;
    //   161: checkcast 362	com/almworks/sqlite4java/SWIGTYPE_p_sqlite3_stmt
    //   164: astore 6
    //   166: aload 6
    //   168: ifnull +10 -> 178
    //   171: aload 20
    //   173: aconst_null
    //   174: invokevirtual 1007	javolution/util/stripped/FastMap$Entry:setValue	(Ljava/lang/Object;)Ljava/lang/Object;
    //   177: pop
    //   178: aload_0
    //   179: invokespecial 168	com/almworks/sqlite4java/SQLiteConnection:handle	()Lcom/almworks/sqlite4java/SWIGTYPE_p_sqlite3;
    //   182: astore 7
    //   184: aload 4
    //   186: monitorexit
    //   187: aload 6
    //   189: ifnonnull +151 -> 340
    //   192: invokestatic 284	com/almworks/sqlite4java/Internal:isFineLogging	()Z
    //   195: ifeq +32 -> 227
    //   198: aload_0
    //   199: new 124	java/lang/StringBuilder
    //   202: dup
    //   203: invokespecial 125	java/lang/StringBuilder:<init>	()V
    //   206: ldc_w 1009
    //   209: invokevirtual 131	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   212: aload_1
    //   213: invokevirtual 134	java/lang/StringBuilder:append	(Ljava/lang/Object;)Ljava/lang/StringBuilder;
    //   216: ldc -120
    //   218: invokevirtual 131	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   221: invokevirtual 140	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   224: invokestatic 289	com/almworks/sqlite4java/Internal:logFine	(Ljava/lang/Object;Ljava/lang/Object;)V
    //   227: aload_3
    //   228: ifnonnull +37 -> 265
    //   231: lconst_0
    //   232: lstore 15
    //   234: aload_1
    //   235: invokevirtual 1010	com/almworks/sqlite4java/SQLParts:toString	()Ljava/lang/String;
    //   238: astore 17
    //   240: aload 17
    //   242: invokevirtual 1013	java/lang/String:trim	()Ljava/lang/String;
    //   245: invokevirtual 278	java/lang/String:length	()I
    //   248: ifne +25 -> 273
    //   251: new 164	com/almworks/sqlite4java/SQLiteException
    //   254: dup
    //   255: sipush 64537
    //   258: ldc_w 1015
    //   261: invokespecial 267	com/almworks/sqlite4java/SQLiteException:<init>	(ILjava/lang/String;)V
    //   264: athrow
    //   265: invokestatic 845	java/lang/System:nanoTime	()J
    //   268: lstore 15
    //   270: goto -36 -> 234
    //   273: aload_0
    //   274: getfield 112	com/almworks/sqlite4java/SQLiteConnection:mySQLiteManual	Lcom/almworks/sqlite4java/_SQLiteManual;
    //   277: aload 7
    //   279: aload 17
    //   281: invokevirtual 1019	com/almworks/sqlite4java/_SQLiteManual:sqlite3_prepare_v2	(Lcom/almworks/sqlite4java/SWIGTYPE_p_sqlite3;Ljava/lang/String;)Lcom/almworks/sqlite4java/SWIGTYPE_p_sqlite3_stmt;
    //   284: astore 6
    //   286: aload_0
    //   287: getfield 112	com/almworks/sqlite4java/SQLiteConnection:mySQLiteManual	Lcom/almworks/sqlite4java/_SQLiteManual;
    //   290: invokevirtual 248	com/almworks/sqlite4java/_SQLiteManual:getLastReturnCode	()I
    //   293: istore 18
    //   295: aload_3
    //   296: ifnull +16 -> 312
    //   299: aload_3
    //   300: aload 17
    //   302: lload 15
    //   304: invokestatic 845	java/lang/System:nanoTime	()J
    //   307: iload 18
    //   309: invokevirtual 1022	com/almworks/sqlite4java/SQLiteProfiler:reportPrepare	(Ljava/lang/String;JJI)V
    //   312: aload_0
    //   313: iload 18
    //   315: ldc_w 1024
    //   318: aload_1
    //   319: invokevirtual 259	com/almworks/sqlite4java/SQLiteConnection:throwResult	(ILjava/lang/String;Ljava/lang/Object;)V
    //   322: aload 6
    //   324: ifnonnull +51 -> 375
    //   327: new 164	com/almworks/sqlite4java/SQLiteException
    //   330: dup
    //   331: bipush -99
    //   333: ldc_w 1026
    //   336: invokespecial 267	com/almworks/sqlite4java/SQLiteException:<init>	(ILjava/lang/String;)V
    //   339: athrow
    //   340: invokestatic 284	com/almworks/sqlite4java/Internal:isFineLogging	()Z
    //   343: ifeq +32 -> 375
    //   346: aload_0
    //   347: new 124	java/lang/StringBuilder
    //   350: dup
    //   351: invokespecial 125	java/lang/StringBuilder:<init>	()V
    //   354: ldc_w 1028
    //   357: invokevirtual 131	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   360: aload_1
    //   361: invokevirtual 134	java/lang/StringBuilder:append	(Ljava/lang/Object;)Ljava/lang/StringBuilder;
    //   364: ldc -120
    //   366: invokevirtual 131	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   369: invokevirtual 140	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   372: invokestatic 289	com/almworks/sqlite4java/Internal:logFine	(Ljava/lang/Object;Ljava/lang/Object;)V
    //   375: aload_0
    //   376: getfield 79	com/almworks/sqlite4java/SQLiteConnection:myLock	Ljava/lang/Object;
    //   379: astore 8
    //   381: aload 8
    //   383: monitorenter
    //   384: aload_0
    //   385: getfield 604	com/almworks/sqlite4java/SQLiteConnection:myHandle	Lcom/almworks/sqlite4java/SWIGTYPE_p_sqlite3;
    //   388: ifnull +99 -> 487
    //   391: iload_2
    //   392: ifeq +86 -> 478
    //   395: aload_0
    //   396: getfield 102	com/almworks/sqlite4java/SQLiteConnection:myCachedController	Lcom/almworks/sqlite4java/SQLiteController;
    //   399: astore 10
    //   401: aload 5
    //   403: ifnonnull +9 -> 412
    //   406: aload_1
    //   407: invokevirtual 1031	com/almworks/sqlite4java/SQLParts:getFixedParts	()Lcom/almworks/sqlite4java/SQLParts;
    //   410: astore 5
    //   412: new 333	com/almworks/sqlite4java/SQLiteStatement
    //   415: dup
    //   416: aload 10
    //   418: aload 6
    //   420: aload 5
    //   422: aload_0
    //   423: getfield 831	com/almworks/sqlite4java/SQLiteConnection:myProfiler	Lcom/almworks/sqlite4java/SQLiteProfiler;
    //   426: invokespecial 1034	com/almworks/sqlite4java/SQLiteStatement:<init>	(Lcom/almworks/sqlite4java/SQLiteController;Lcom/almworks/sqlite4java/SWIGTYPE_p_sqlite3_stmt;Lcom/almworks/sqlite4java/SQLParts;Lcom/almworks/sqlite4java/SQLiteProfiler;)V
    //   429: astore 11
    //   431: aload_0
    //   432: getfield 86	com/almworks/sqlite4java/SQLiteConnection:myStatements	Ljava/util/ArrayList;
    //   435: aload 11
    //   437: invokevirtual 713	java/util/ArrayList:add	(Ljava/lang/Object;)Z
    //   440: pop
    //   441: aload 11
    //   443: astore 13
    //   445: aload 8
    //   447: monitorexit
    //   448: aload 13
    //   450: ifnonnull +78 -> 528
    //   453: aload_0
    //   454: aload 6
    //   456: invokestatic 685	com/almworks/sqlite4java/_SQLiteSwigged:sqlite3_finalize	(Lcom/almworks/sqlite4java/SWIGTYPE_p_sqlite3_stmt;)I
    //   459: ldc_w 1036
    //   462: invokevirtual 308	com/almworks/sqlite4java/SQLiteConnection:throwResult	(ILjava/lang/String;)V
    //   465: new 164	com/almworks/sqlite4java/SQLiteException
    //   468: dup
    //   469: bipush -97
    //   471: ldc_w 717
    //   474: invokespecial 267	com/almworks/sqlite4java/SQLiteException:<init>	(ILjava/lang/String;)V
    //   477: athrow
    //   478: aload_0
    //   479: getfield 107	com/almworks/sqlite4java/SQLiteConnection:myUncachedController	Lcom/almworks/sqlite4java/SQLiteController;
    //   482: astore 10
    //   484: goto -83 -> 401
    //   487: aload_0
    //   488: new 124	java/lang/StringBuilder
    //   491: dup
    //   492: invokespecial 125	java/lang/StringBuilder:<init>	()V
    //   495: ldc_w 1038
    //   498: invokevirtual 131	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   501: aload_1
    //   502: invokevirtual 134	java/lang/StringBuilder:append	(Ljava/lang/Object;)Ljava/lang/StringBuilder;
    //   505: ldc -120
    //   507: invokevirtual 131	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   510: invokevirtual 140	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   513: invokestatic 300	com/almworks/sqlite4java/Internal:logWarn	(Ljava/lang/Object;Ljava/lang/Object;)V
    //   516: aconst_null
    //   517: astore 13
    //   519: goto -74 -> 445
    //   522: aload 8
    //   524: monitorexit
    //   525: aload 9
    //   527: athrow
    //   528: aload 13
    //   530: areturn
    //   531: astore 14
    //   533: goto -68 -> 465
    //   536: astore 9
    //   538: goto -16 -> 522
    //   541: astore 9
    //   543: goto -21 -> 522
    // Local variable table:
    //   start	length	slot	name	signature
    //   0	546	0	this	SQLiteConnection
    //   0	546	1	paramSQLParts	SQLParts
    //   0	546	2	paramBoolean	boolean
    //   8	292	3	localSQLiteProfiler	SQLiteProfiler
    //   60	125	4	localObject1	Object
    //   66	355	5	localSQLParts	SQLParts
    //   69	386	6	localSWIGTYPE_p_sqlite3_stmt	SWIGTYPE_p_sqlite3_stmt
    //   182	96	7	localSWIGTYPE_p_sqlite3	SWIGTYPE_p_sqlite3
    //   379	144	8	localObject2	Object
    //   525	1	9	localObject3	Object
    //   536	1	9	localObject4	Object
    //   541	1	9	localObject5	Object
    //   399	84	10	localSQLiteController	SQLiteController
    //   429	13	11	localSQLiteStatement1	SQLiteStatement
    //   443	86	13	localSQLiteStatement2	SQLiteStatement
    //   531	1	14	localException	Exception
    //   232	71	15	l	long
    //   238	63	17	str	String
    //   293	21	18	i	int
    //   125	6	19	localObject6	Object
    //   83	89	20	localEntry	FastMap.Entry
    // Exception table:
    //   from	to	target	type
    //   75	85	125	finally
    //   96	112	125	finally
    //   117	125	125	finally
    //   127	130	125	finally
    //   133	156	125	finally
    //   156	166	125	finally
    //   171	178	125	finally
    //   178	187	125	finally
    //   453	465	531	java/lang/Exception
    //   431	441	536	finally
    //   384	391	541	finally
    //   395	401	541	finally
    //   406	412	541	finally
    //   412	431	541	finally
    //   445	448	541	finally
    //   478	484	541	finally
    //   487	516	541	finally
    //   522	525	541	finally
  }
  
  public SQLiteStatement prepare(String paramString)
    throws SQLiteException
  {
    return prepare(paramString, true);
  }
  
  public SQLiteStatement prepare(String paramString, boolean paramBoolean)
    throws SQLiteException
  {
    return prepare(new SQLParts(paramString), paramBoolean);
  }
  
  public SQLiteProfiler profile()
  {
    SQLiteProfiler localSQLiteProfiler = this.myProfiler;
    if (localSQLiteProfiler == null)
    {
      localSQLiteProfiler = new SQLiteProfiler();
      this.myProfiler = localSQLiteProfiler;
    }
    return localSQLiteProfiler;
  }
  
  public SQLiteConnection setBusyTimeout(long paramLong)
    throws SQLiteException
  {
    checkThread();
    throwResult(_SQLiteSwigged.sqlite3_busy_timeout(handle(), (int)paramLong), "setBusyTimeout");
    return this;
  }
  
  public void setExtensionLoadingEnabled(boolean paramBoolean)
    throws SQLiteException
  {
    checkThread();
    SWIGTYPE_p_sqlite3 localSWIGTYPE_p_sqlite3 = handle();
    int i;
    if (paramBoolean)
    {
      i = 1;
      throwResult(_SQLiteSwigged.sqlite3_enable_load_extension(localSWIGTYPE_p_sqlite3, i), "enableLoadExtension()");
      if (Internal.isFineLogging()) {
        if (!paramBoolean) {
          break label54;
        }
      }
    }
    label54:
    for (String str = "Extension load enabled";; str = "Extension load disabled")
    {
      Internal.logFine(this, str);
      return;
      i = 0;
      break;
    }
  }
  
  public int setLimit(int paramInt1, int paramInt2)
    throws SQLiteException
  {
    checkThread();
    return _SQLiteSwigged.sqlite3_limit(handle(), paramInt1, paramInt2);
  }
  
  public void setStepsPerCallback(int paramInt)
  {
    if (paramInt > 0) {
      this.myStepsPerCallback = paramInt;
    }
  }
  
  public SQLiteProfiler stopProfiling()
  {
    SQLiteProfiler localSQLiteProfiler = this.myProfiler;
    this.myProfiler = null;
    return localSQLiteProfiler;
  }
  
  void throwResult(int paramInt, String paramString)
    throws SQLiteException
  {
    throwResult(paramInt, paramString, null);
  }
  
  void throwResult(int paramInt, String paramString, Object paramObject)
    throws SQLiteException
  {
    if (paramInt == 0) {
      return;
    }
    SWIGTYPE_p_sqlite3 localSWIGTYPE_p_sqlite3 = this.myHandle;
    localObject = this + " " + paramString;
    if (paramObject == null) {}
    for (String str1 = null;; str1 = String.valueOf(paramObject))
    {
      if (str1 != null) {
        localObject = (String)localObject + " " + str1;
      }
      if (localSWIGTYPE_p_sqlite3 != null) {}
      try
      {
        String str2 = _SQLiteSwigged.sqlite3_errmsg(localSWIGTYPE_p_sqlite3);
        if ((str1 == null) || (!str1.equals(str2)))
        {
          String str3 = (String)localObject + " [" + str2 + "]";
          localObject = str3;
        }
      }
      catch (Exception localException)
      {
        for (;;)
        {
          Internal.log(Level.WARNING, this, "cannot get sqlite3_errmsg", localException);
        }
        if (paramInt != 9) {
          break label207;
        }
        throw new SQLiteInterruptedException(paramInt, (String)localObject);
        throw new SQLiteException(paramInt, (String)localObject);
      }
      if ((paramInt != 5) && (paramInt != 2826)) {
        break;
      }
      throw new SQLiteBusyException(paramInt, (String)localObject);
    }
  }
  
  public String toString()
  {
    return "DB[" + this.myNumber + "]";
  }
  
  private abstract class BaseController
    extends SQLiteController
  {
    static
    {
      if (!SQLiteConnection.class.desiredAssertionStatus()) {}
      for (boolean bool = true;; bool = false)
      {
        $assertionsDisabled = bool;
        return;
      }
    }
    
    private BaseController() {}
    
    private boolean validateImpl()
      throws SQLiteException
    {
      SQLiteConnection.this.checkThread();
      SQLiteConnection.this.handle();
      return true;
    }
    
    public DirectBuffer allocateBuffer(int paramInt)
      throws IOException, SQLiteException
    {
      return SQLiteConnection.this.allocateBuffer(paramInt);
    }
    
    protected boolean checkDispose(Object paramObject)
    {
      try
      {
        SQLiteConnection.this.checkThread();
        return true;
      }
      catch (SQLiteException localSQLiteException)
      {
        Internal.recoverableError(this, "disposing " + paramObject + " from alien thread", true);
      }
      return false;
    }
    
    public void dispose(SQLiteBlob paramSQLiteBlob)
    {
      if (checkDispose(paramSQLiteBlob)) {
        SQLiteConnection.this.finalizeBlob(paramSQLiteBlob);
      }
    }
    
    public void freeBuffer(DirectBuffer paramDirectBuffer)
    {
      try
      {
        SQLiteConnection.this.freeBuffer(paramDirectBuffer);
        return;
      }
      catch (SQLiteException localSQLiteException)
      {
        Internal.logWarn(SQLiteConnection.this, localSQLiteException.toString());
      }
    }
    
    public ProgressHandler getProgressHandler()
      throws SQLiteException
    {
      return SQLiteConnection.this.getProgressHandler();
    }
    
    public _SQLiteManual getSQLiteManual()
    {
      return SQLiteConnection.this.mySQLiteManual;
    }
    
    public void throwResult(int paramInt, String paramString, Object paramObject)
      throws SQLiteException
    {
      SQLiteConnection.this.throwResult(paramInt, paramString, paramObject);
    }
    
    public void validate()
      throws SQLiteException
    {
      assert (validateImpl());
    }
  }
  
  private class CachedController
    extends SQLiteConnection.BaseController
  {
    private CachedController()
    {
      super(null);
    }
    
    public void dispose(SQLiteLongArray paramSQLiteLongArray)
    {
      if (checkDispose(paramSQLiteLongArray)) {
        SQLiteConnection.this.cacheArrayHandle(paramSQLiteLongArray);
      }
    }
    
    public void dispose(SQLiteStatement paramSQLiteStatement)
    {
      if (checkDispose(paramSQLiteStatement)) {
        SQLiteConnection.this.cacheStatementHandle(paramSQLiteStatement);
      }
    }
    
    public String toString()
    {
      return SQLiteConnection.this.toString() + "[C]";
    }
  }
  
  private class UncachedController
    extends SQLiteConnection.BaseController
  {
    private UncachedController()
    {
      super(null);
    }
    
    public void dispose(SQLiteLongArray paramSQLiteLongArray)
    {
      if (checkDispose(paramSQLiteLongArray)) {
        SQLiteConnection.this.finalizeArray(paramSQLiteLongArray);
      }
    }
    
    public void dispose(SQLiteStatement paramSQLiteStatement)
    {
      if (checkDispose(paramSQLiteStatement)) {
        SQLiteConnection.this.finalizeStatement(paramSQLiteStatement);
      }
    }
    
    public String toString()
    {
      return SQLiteConnection.this.toString() + "[U]";
    }
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/almworks/sqlite4java/SQLiteConnection.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */