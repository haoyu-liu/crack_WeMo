package com.almworks.sqlite4java;

import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.nio.BufferUnderflowException;
import java.nio.ByteBuffer;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

public final class SQLiteStatement
{
  public static final SQLiteStatement DISPOSED;
  private List<BindStream> myBindStreams;
  private boolean myCancelled;
  private int myColumnCount = -1;
  private List<ColumnStream> myColumnStreams;
  private SQLiteController myController;
  private SWIGTYPE_p_sqlite3_stmt myHandle;
  private boolean myHasBindings;
  private boolean myHasRow;
  private SQLiteProfiler myProfiler;
  private ProgressHandler myProgressHandler;
  private final SQLParts mySqlParts;
  private boolean myStepped;
  
  static
  {
    if (!SQLiteStatement.class.desiredAssertionStatus()) {}
    for (boolean bool = true;; bool = false)
    {
      $assertionsDisabled = bool;
      DISPOSED = new SQLiteStatement();
      return;
    }
  }
  
  private SQLiteStatement()
  {
    this.myController = SQLiteController.getDisposed(null);
    this.myHandle = null;
    this.mySqlParts = new SQLParts().fix();
    this.myProfiler = null;
  }
  
  SQLiteStatement(SQLiteController paramSQLiteController, SWIGTYPE_p_sqlite3_stmt paramSWIGTYPE_p_sqlite3_stmt, SQLParts paramSQLParts, SQLiteProfiler paramSQLiteProfiler)
  {
    assert (paramSWIGTYPE_p_sqlite3_stmt != null);
    assert (paramSQLParts.isFixed()) : paramSQLParts;
    this.myController = paramSQLiteController;
    this.myHandle = paramSWIGTYPE_p_sqlite3_stmt;
    this.mySqlParts = paramSQLParts;
    this.myProfiler = paramSQLiteProfiler;
    Internal.logFine(this, "instantiated");
  }
  
  private void checkColumn(int paramInt, SWIGTYPE_p_sqlite3_stmt paramSWIGTYPE_p_sqlite3_stmt, boolean paramBoolean)
    throws SQLiteException
  {
    if ((paramBoolean) && (!this.myHasRow)) {
      throw new SQLiteException(-95, null);
    }
    if (paramInt < 0) {
      throw new SQLiteException(-94, String.valueOf(paramInt));
    }
    int i = getColumnCount(paramSWIGTYPE_p_sqlite3_stmt);
    if (paramInt >= i) {
      throw new SQLiteException(-94, paramInt + "(" + i + ")");
    }
  }
  
  private void clearBindStreams(boolean paramBoolean)
  {
    List localList = this.myBindStreams;
    if (localList != null)
    {
      this.myBindStreams = null;
      Iterator localIterator = localList.iterator();
      while (localIterator.hasNext())
      {
        BindStream localBindStream = (BindStream)localIterator.next();
        if ((paramBoolean) && (!localBindStream.isDisposed())) {
          try
          {
            localBindStream.close();
          }
          catch (IOException localIOException)
          {
            Internal.logFine(this, localIOException.toString());
          }
        } else {
          localBindStream.dispose();
        }
      }
      localList.clear();
    }
  }
  
  private void clearColumnStreams()
  {
    List localList = this.myColumnStreams;
    if (localList != null)
    {
      this.myColumnStreams = null;
      Iterator localIterator = localList.iterator();
      while (localIterator.hasNext())
      {
        ColumnStream localColumnStream = (ColumnStream)localIterator.next();
        try
        {
          localColumnStream.close();
        }
        catch (IOException localIOException)
        {
          Internal.logFine(this, localIOException.toString());
        }
      }
    }
  }
  
  private void finalizeStep(ProgressHandler paramProgressHandler, String paramString)
  {
    try
    {
      this.myProgressHandler = null;
      if (paramProgressHandler != null)
      {
        if (Internal.isFineLogging()) {
          Internal.logFine(this, paramString + " " + paramProgressHandler.getSteps() + " steps");
        }
        paramProgressHandler.reset();
      }
      return;
    }
    finally {}
  }
  
  private int getColumnCount(SWIGTYPE_p_sqlite3_stmt paramSWIGTYPE_p_sqlite3_stmt)
  {
    int i = this.myColumnCount;
    if (i < 0)
    {
      Internal.logFine(this, "asking column count");
      i = _SQLiteSwigged.sqlite3_column_count(paramSWIGTYPE_p_sqlite3_stmt);
      this.myColumnCount = i;
      if (i >= 0) {
        break label57;
      }
      Internal.recoverableError(this, "columnsCount=" + i, true);
      i = 0;
    }
    label57:
    while (!Internal.isFineLogging()) {
      return i;
    }
    Internal.logFine(this, "columnCount=" + i);
    return i;
  }
  
  private int getColumnType(int paramInt, SWIGTYPE_p_sqlite3_stmt paramSWIGTYPE_p_sqlite3_stmt)
    throws SQLiteException
  {
    checkColumn(paramInt, paramSWIGTYPE_p_sqlite3_stmt, false);
    if (Internal.isFineLogging()) {
      Internal.logFine(this, "columnType(" + paramInt + ")");
    }
    int i = _SQLiteSwigged.sqlite3_column_type(paramSWIGTYPE_p_sqlite3_stmt, paramInt);
    if (Internal.isFineLogging()) {
      Internal.logFine(this, "columnType(" + paramInt + ")=" + i);
    }
    return i;
  }
  
  private int getValidBindParameterIndex(String paramString)
    throws SQLiteException
  {
    int i = getBindParameterIndex(paramString);
    if (i == 0) {
      throw new SQLiteException(-11, "failed to find parameter with specified name (" + paramString + ")");
    }
    return i;
  }
  
  private SWIGTYPE_p_sqlite3_stmt handle()
    throws SQLiteException
  {
    SWIGTYPE_p_sqlite3_stmt localSWIGTYPE_p_sqlite3_stmt = this.myHandle;
    if (localSWIGTYPE_p_sqlite3_stmt == null) {
      throw new SQLiteException(-96, null);
    }
    return localSWIGTYPE_p_sqlite3_stmt;
  }
  
  private ProgressHandler prepareStep()
    throws SQLiteException
  {
    clearBindStreams(true);
    clearColumnStreams();
    ProgressHandler localProgressHandler = this.myController.getProgressHandler();
    localProgressHandler.reset();
    try
    {
      if (this.myCancelled) {
        throw new SQLiteInterruptedException();
      }
    }
    finally {}
    this.myProgressHandler = localProgressHandler;
    return localProgressHandler;
  }
  
  private void stepResult(int paramInt, String paramString)
    throws SQLiteException
  {
    if (!this.myStepped) {
      this.myColumnCount = -1;
    }
    this.myStepped = true;
    if (paramInt == 100)
    {
      if (Internal.isFineLogging()) {
        Internal.logFine(this, paramString + " ROW");
      }
      this.myHasRow = true;
      return;
    }
    if (paramInt == 101)
    {
      if (Internal.isFineLogging()) {
        Internal.logFine(this, paramString + " DONE");
      }
      this.myHasRow = false;
      return;
    }
    this.myController.throwResult(paramInt, paramString + "()", this);
  }
  
  public SQLiteStatement bind(int paramInt, double paramDouble)
    throws SQLiteException
  {
    this.myController.validate();
    if (Internal.isFineLogging()) {
      Internal.logFine(this, "bind(" + paramInt + "," + paramDouble + ")");
    }
    int i = _SQLiteSwigged.sqlite3_bind_double(handle(), paramInt, paramDouble);
    this.myController.throwResult(i, "bind(double)", this);
    this.myHasBindings = true;
    return this;
  }
  
  public SQLiteStatement bind(int paramInt1, int paramInt2)
    throws SQLiteException
  {
    this.myController.validate();
    if (Internal.isFineLogging()) {
      Internal.logFine(this, "bind(" + paramInt1 + "," + paramInt2 + ")");
    }
    int i = _SQLiteSwigged.sqlite3_bind_int(handle(), paramInt1, paramInt2);
    this.myController.throwResult(i, "bind(int)", this);
    this.myHasBindings = true;
    return this;
  }
  
  public SQLiteStatement bind(int paramInt, long paramLong)
    throws SQLiteException
  {
    this.myController.validate();
    if (Internal.isFineLogging()) {
      Internal.logFine(this, "bind(" + paramInt + "," + paramLong + ")");
    }
    int i = _SQLiteSwigged.sqlite3_bind_int64(handle(), paramInt, paramLong);
    this.myController.throwResult(i, "bind(long)", this);
    this.myHasBindings = true;
    return this;
  }
  
  public SQLiteStatement bind(int paramInt, String paramString)
    throws SQLiteException
  {
    if (paramString == null)
    {
      Internal.logFine(this, "bind(null string)");
      return bindNull(paramInt);
    }
    this.myController.validate();
    if (Internal.isFineLogging())
    {
      if (paramString.length() > 20) {
        break label107;
      }
      Internal.logFine(this, "bind(" + paramInt + "," + paramString + ")");
    }
    for (;;)
    {
      int i = _SQLiteManual.sqlite3_bind_text(handle(), paramInt, paramString);
      this.myController.throwResult(i, "bind(String)", this);
      this.myHasBindings = true;
      return this;
      label107:
      Internal.logFine(this, "bind(" + paramInt + "," + paramString.substring(0, 20) + "....)");
    }
  }
  
  public SQLiteStatement bind(int paramInt, byte[] paramArrayOfByte)
    throws SQLiteException
  {
    if (paramArrayOfByte == null) {
      return bindNull(paramInt);
    }
    return bind(paramInt, paramArrayOfByte, 0, paramArrayOfByte.length);
  }
  
  public SQLiteStatement bind(int paramInt1, byte[] paramArrayOfByte, int paramInt2, int paramInt3)
    throws SQLiteException
  {
    if (paramArrayOfByte == null)
    {
      Internal.logFine(this, "bind(null blob)");
      return bindNull(paramInt1);
    }
    if ((paramInt2 < 0) || (paramInt2 + paramInt3 > paramArrayOfByte.length)) {
      throw new ArrayIndexOutOfBoundsException(paramArrayOfByte.length + " " + paramInt2 + " " + paramInt3);
    }
    this.myController.validate();
    if (Internal.isFineLogging()) {
      Internal.logFine(this, "bind(" + paramInt1 + ",[" + paramInt3 + "])");
    }
    int i = _SQLiteManual.sqlite3_bind_blob(handle(), paramInt1, paramArrayOfByte, paramInt2, paramInt3);
    this.myController.throwResult(i, "bind(blob)", this);
    this.myHasBindings = true;
    return this;
  }
  
  public SQLiteStatement bind(String paramString, double paramDouble)
    throws SQLiteException
  {
    return bind(getValidBindParameterIndex(paramString), paramDouble);
  }
  
  public SQLiteStatement bind(String paramString, int paramInt)
    throws SQLiteException
  {
    return bind(getValidBindParameterIndex(paramString), paramInt);
  }
  
  public SQLiteStatement bind(String paramString, long paramLong)
    throws SQLiteException
  {
    return bind(getValidBindParameterIndex(paramString), paramLong);
  }
  
  public SQLiteStatement bind(String paramString1, String paramString2)
    throws SQLiteException
  {
    return bind(getValidBindParameterIndex(paramString1), paramString2);
  }
  
  public SQLiteStatement bind(String paramString, byte[] paramArrayOfByte)
    throws SQLiteException
  {
    return bind(getValidBindParameterIndex(paramString), paramArrayOfByte);
  }
  
  public SQLiteStatement bind(String paramString, byte[] paramArrayOfByte, int paramInt1, int paramInt2)
    throws SQLiteException
  {
    return bind(getValidBindParameterIndex(paramString), paramArrayOfByte, paramInt1, paramInt2);
  }
  
  public SQLiteStatement bindNull(int paramInt)
    throws SQLiteException
  {
    this.myController.validate();
    if (Internal.isFineLogging()) {
      Internal.logFine(this, "bind_null(" + paramInt + ")");
    }
    int i = _SQLiteSwigged.sqlite3_bind_null(handle(), paramInt);
    this.myController.throwResult(i, "bind(null)", this);
    return this;
  }
  
  public SQLiteStatement bindNull(String paramString)
    throws SQLiteException
  {
    return bindNull(getValidBindParameterIndex(paramString));
  }
  
  public OutputStream bindStream(int paramInt)
    throws SQLiteException
  {
    return bindStream(paramInt, 0);
  }
  
  public OutputStream bindStream(int paramInt1, int paramInt2)
    throws SQLiteException
  {
    this.myController.validate();
    if (Internal.isFineLogging()) {
      Internal.logFine(this, "bindStream(" + paramInt1 + "," + paramInt2 + ")");
    }
    try
    {
      BindStream localBindStream = new BindStream(paramInt1, this.myController.allocateBuffer(paramInt2));
      Object localObject = this.myBindStreams;
      if (localObject == null)
      {
        localObject = new ArrayList(1);
        this.myBindStreams = ((List)localObject);
      }
      ((List)localObject).add(localBindStream);
      this.myHasBindings = true;
      return localBindStream;
    }
    catch (IOException localIOException)
    {
      throw new SQLiteException(-99, "cannot allocate buffer", localIOException);
    }
  }
  
  public OutputStream bindStream(String paramString)
    throws SQLiteException
  {
    return bindStream(getValidBindParameterIndex(paramString), 0);
  }
  
  public OutputStream bindStream(String paramString, int paramInt)
    throws SQLiteException
  {
    return bindStream(getValidBindParameterIndex(paramString), paramInt);
  }
  
  public SQLiteStatement bindZeroBlob(int paramInt1, int paramInt2)
    throws SQLiteException
  {
    if (paramInt2 < 0)
    {
      Internal.logFine(this, "bind(null zeroblob)");
      return bindNull(paramInt1);
    }
    this.myController.validate();
    if (Internal.isFineLogging()) {
      Internal.logFine(this, "bindZeroBlob(" + paramInt1 + "," + paramInt2 + ")");
    }
    int i = _SQLiteSwigged.sqlite3_bind_zeroblob(handle(), paramInt1, paramInt2);
    this.myController.throwResult(i, "bindZeroBlob()", this);
    this.myHasBindings = true;
    return this;
  }
  
  public SQLiteStatement bindZeroBlob(String paramString, int paramInt)
    throws SQLiteException
  {
    return bindZeroBlob(getValidBindParameterIndex(paramString), paramInt);
  }
  
  public void cancel()
  {
    try
    {
      this.myCancelled = true;
      ProgressHandler localProgressHandler = this.myProgressHandler;
      if (localProgressHandler != null) {
        localProgressHandler.cancel();
      }
      return;
    }
    finally {}
  }
  
  void clear()
  {
    clearBindStreams(false);
    clearColumnStreams();
    this.myHandle = null;
    this.myHasRow = false;
    this.myColumnCount = -1;
    this.myHasBindings = false;
    this.myStepped = false;
    this.myController = SQLiteController.getDisposed(this.myController);
    this.myProfiler = null;
    Internal.logFine(this, "cleared");
  }
  
  public SQLiteStatement clearBindings()
    throws SQLiteException
  {
    this.myController.validate();
    Internal.logFine(this, "clearBindings");
    if (this.myHasBindings)
    {
      Internal.logFine(this, "clearing bindings");
      int i = _SQLiteSwigged.sqlite3_clear_bindings(handle());
      this.myController.throwResult(i, "clearBindings()", this);
      clearBindStreams(false);
    }
    this.myHasBindings = false;
    return this;
  }
  
  public byte[] columnBlob(int paramInt)
    throws SQLiteException
  {
    this.myController.validate();
    SWIGTYPE_p_sqlite3_stmt localSWIGTYPE_p_sqlite3_stmt = handle();
    checkColumn(paramInt, localSWIGTYPE_p_sqlite3_stmt, true);
    if (Internal.isFineLogging()) {
      Internal.logFine(this, "columnBytes(" + paramInt + ")");
    }
    _SQLiteManual local_SQLiteManual = this.myController.getSQLiteManual();
    byte[] arrayOfByte = local_SQLiteManual.sqlite3_column_blob(localSWIGTYPE_p_sqlite3_stmt, paramInt);
    this.myController.throwResult(local_SQLiteManual.getLastReturnCode(), "columnBytes", this);
    StringBuilder localStringBuilder;
    if (Internal.isFineLogging())
    {
      localStringBuilder = new StringBuilder().append("columnBytes(").append(paramInt).append(")=[");
      if (arrayOfByte != null) {
        break label149;
      }
    }
    label149:
    for (Object localObject = "null";; localObject = Integer.valueOf(arrayOfByte.length))
    {
      Internal.logFine(this, localObject + "]");
      return arrayOfByte;
    }
  }
  
  public int columnCount()
    throws SQLiteException
  {
    this.myController.validate();
    return getColumnCount(handle());
  }
  
  public double columnDouble(int paramInt)
    throws SQLiteException
  {
    this.myController.validate();
    SWIGTYPE_p_sqlite3_stmt localSWIGTYPE_p_sqlite3_stmt = handle();
    checkColumn(paramInt, localSWIGTYPE_p_sqlite3_stmt, true);
    if (Internal.isFineLogging()) {
      Internal.logFine(this, "columnDouble(" + paramInt + ")");
    }
    double d = _SQLiteSwigged.sqlite3_column_double(localSWIGTYPE_p_sqlite3_stmt, paramInt);
    if (Internal.isFineLogging()) {
      Internal.logFine(this, "columnDouble(" + paramInt + ")=" + d);
    }
    return d;
  }
  
  public int columnInt(int paramInt)
    throws SQLiteException
  {
    this.myController.validate();
    SWIGTYPE_p_sqlite3_stmt localSWIGTYPE_p_sqlite3_stmt = handle();
    checkColumn(paramInt, localSWIGTYPE_p_sqlite3_stmt, true);
    if (Internal.isFineLogging()) {
      Internal.logFine(this, "columnInt(" + paramInt + ")");
    }
    int i = _SQLiteSwigged.sqlite3_column_int(localSWIGTYPE_p_sqlite3_stmt, paramInt);
    if (Internal.isFineLogging()) {
      Internal.logFine(this, "columnInt(" + paramInt + ")=" + i);
    }
    return i;
  }
  
  public long columnLong(int paramInt)
    throws SQLiteException
  {
    this.myController.validate();
    SWIGTYPE_p_sqlite3_stmt localSWIGTYPE_p_sqlite3_stmt = handle();
    checkColumn(paramInt, localSWIGTYPE_p_sqlite3_stmt, true);
    if (Internal.isFineLogging()) {
      Internal.logFine(this, "columnLong(" + paramInt + ")");
    }
    long l = _SQLiteSwigged.sqlite3_column_int64(localSWIGTYPE_p_sqlite3_stmt, paramInt);
    if (Internal.isFineLogging()) {
      Internal.logFine(this, "columnLong(" + paramInt + ")=" + l);
    }
    return l;
  }
  
  public boolean columnNull(int paramInt)
    throws SQLiteException
  {
    this.myController.validate();
    return getColumnType(paramInt, handle()) == 5;
  }
  
  public InputStream columnStream(int paramInt)
    throws SQLiteException
  {
    this.myController.validate();
    SWIGTYPE_p_sqlite3_stmt localSWIGTYPE_p_sqlite3_stmt = handle();
    checkColumn(paramInt, localSWIGTYPE_p_sqlite3_stmt, true);
    if (Internal.isFineLogging()) {
      Internal.logFine(this, "columnStream(" + paramInt + ")");
    }
    _SQLiteManual local_SQLiteManual = this.myController.getSQLiteManual();
    ByteBuffer localByteBuffer = local_SQLiteManual.wrapper_column_buffer(localSWIGTYPE_p_sqlite3_stmt, paramInt);
    this.myController.throwResult(local_SQLiteManual.getLastReturnCode(), "columnStream", this);
    if (localByteBuffer == null) {
      return null;
    }
    ColumnStream localColumnStream = new ColumnStream(localByteBuffer);
    Object localObject = this.myColumnStreams;
    if (localObject == null)
    {
      localObject = new ArrayList(1);
      this.myColumnStreams = ((List)localObject);
    }
    ((List)localObject).add(localColumnStream);
    return localColumnStream;
  }
  
  public String columnString(int paramInt)
    throws SQLiteException
  {
    this.myController.validate();
    SWIGTYPE_p_sqlite3_stmt localSWIGTYPE_p_sqlite3_stmt = handle();
    checkColumn(paramInt, localSWIGTYPE_p_sqlite3_stmt, true);
    if (Internal.isFineLogging()) {
      Internal.logFine(this, "columnString(" + paramInt + ")");
    }
    _SQLiteManual local_SQLiteManual = this.myController.getSQLiteManual();
    String str = local_SQLiteManual.sqlite3_column_text(localSWIGTYPE_p_sqlite3_stmt, paramInt);
    this.myController.throwResult(local_SQLiteManual.getLastReturnCode(), "columnString()", this);
    if (Internal.isFineLogging())
    {
      if (str == null) {
        Internal.logFine(this, "columnString(" + paramInt + ") is null");
      }
    }
    else {
      return str;
    }
    if (str.length() <= 20)
    {
      Internal.logFine(this, "columnString(" + paramInt + ")=" + str);
      return str;
    }
    Internal.logFine(this, "columnString(" + paramInt + ")=" + str.substring(0, 20) + "....");
    return str;
  }
  
  public int columnType(int paramInt)
    throws SQLiteException
  {
    this.myController.validate();
    return getColumnType(paramInt, handle());
  }
  
  public Object columnValue(int paramInt)
    throws SQLiteException
  {
    this.myController.validate();
    int i = getColumnType(paramInt, handle());
    switch (i)
    {
    default: 
      Internal.recoverableError(this, "value type " + i + " not yet supported", true);
    case 5: 
      return null;
    case 2: 
      return Double.valueOf(columnDouble(paramInt));
    case 1: 
      long l = columnLong(paramInt);
      if (l == (int)l) {
        return Integer.valueOf((int)l);
      }
      return Long.valueOf(l);
    case 3: 
      return columnString(paramInt);
    }
    return columnBlob(paramInt);
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
  
  public int getBindParameterCount()
    throws SQLiteException
  {
    this.myController.validate();
    return _SQLiteSwigged.sqlite3_bind_parameter_count(handle());
  }
  
  public int getBindParameterIndex(String paramString)
    throws SQLiteException
  {
    this.myController.validate();
    return _SQLiteSwigged.sqlite3_bind_parameter_index(handle(), paramString);
  }
  
  public String getBindParameterName(int paramInt)
    throws SQLiteException
  {
    this.myController.validate();
    return _SQLiteSwigged.sqlite3_bind_parameter_name(handle(), paramInt);
  }
  
  public String getColumnDatabaseName(int paramInt)
    throws SQLiteException
  {
    this.myController.validate();
    SWIGTYPE_p_sqlite3_stmt localSWIGTYPE_p_sqlite3_stmt = handle();
    checkColumn(paramInt, localSWIGTYPE_p_sqlite3_stmt, false);
    if (Internal.isFineLogging()) {
      Internal.logFine(this, "columnDatabaseName(" + paramInt + ")");
    }
    String str = _SQLiteSwigged.sqlite3_column_database_name(localSWIGTYPE_p_sqlite3_stmt, paramInt);
    if (Internal.isFineLogging()) {
      Internal.logFine(this, "columnDatabaseName(" + paramInt + ")=" + str);
    }
    return str;
  }
  
  public String getColumnName(int paramInt)
    throws SQLiteException
  {
    this.myController.validate();
    SWIGTYPE_p_sqlite3_stmt localSWIGTYPE_p_sqlite3_stmt = handle();
    checkColumn(paramInt, localSWIGTYPE_p_sqlite3_stmt, false);
    if (Internal.isFineLogging()) {
      Internal.logFine(this, "columnName(" + paramInt + ")");
    }
    String str = _SQLiteSwigged.sqlite3_column_name(localSWIGTYPE_p_sqlite3_stmt, paramInt);
    if (Internal.isFineLogging()) {
      Internal.logFine(this, "columnName(" + paramInt + ")=" + str);
    }
    return str;
  }
  
  public String getColumnOriginName(int paramInt)
    throws SQLiteException
  {
    this.myController.validate();
    SWIGTYPE_p_sqlite3_stmt localSWIGTYPE_p_sqlite3_stmt = handle();
    checkColumn(paramInt, localSWIGTYPE_p_sqlite3_stmt, false);
    if (Internal.isFineLogging()) {
      Internal.logFine(this, "columnOriginName(" + paramInt + ")");
    }
    String str = _SQLiteSwigged.sqlite3_column_origin_name(localSWIGTYPE_p_sqlite3_stmt, paramInt);
    if (Internal.isFineLogging()) {
      Internal.logFine(this, "columnOriginName(" + paramInt + ")=" + str);
    }
    return str;
  }
  
  public String getColumnTableName(int paramInt)
    throws SQLiteException
  {
    this.myController.validate();
    SWIGTYPE_p_sqlite3_stmt localSWIGTYPE_p_sqlite3_stmt = handle();
    checkColumn(paramInt, localSWIGTYPE_p_sqlite3_stmt, false);
    if (Internal.isFineLogging()) {
      Internal.logFine(this, "columnTableName(" + paramInt + ")");
    }
    String str = _SQLiteSwigged.sqlite3_column_table_name(localSWIGTYPE_p_sqlite3_stmt, paramInt);
    if (Internal.isFineLogging()) {
      Internal.logFine(this, "columnTableName(" + paramInt + ")=" + str);
    }
    return str;
  }
  
  public SQLParts getSqlParts()
  {
    return this.mySqlParts;
  }
  
  public boolean hasBindings()
  {
    return this.myHasBindings;
  }
  
  public boolean hasRow()
  {
    return this.myHasRow;
  }
  
  public boolean hasStepped()
  {
    return this.myStepped;
  }
  
  public boolean isDisposed()
  {
    return this.myHandle == null;
  }
  
  public boolean isReadOnly()
    throws SQLiteException
  {
    this.myController.validate();
    return _SQLiteSwigged.sqlite3_stmt_readonly(handle()) != 0;
  }
  
  /* Error */
  public int loadInts(int paramInt1, int[] paramArrayOfInt, int paramInt2, int paramInt3)
    throws SQLiteException
  {
    // Byte code:
    //   0: aload_0
    //   1: getfield 55	com/almworks/sqlite4java/SQLiteStatement:myController	Lcom/almworks/sqlite4java/SQLiteController;
    //   4: invokevirtual 265	com/almworks/sqlite4java/SQLiteController:validate	()V
    //   7: aload_2
    //   8: ifnull +21 -> 29
    //   11: iload 4
    //   13: ifle +16 -> 29
    //   16: iload_3
    //   17: iflt +12 -> 29
    //   20: iload_3
    //   21: iload 4
    //   23: iadd
    //   24: aload_2
    //   25: arraylength
    //   26: if_icmple +19 -> 45
    //   29: getstatic 39	com/almworks/sqlite4java/SQLiteStatement:$assertionsDisabled	Z
    //   32: ifne +11 -> 43
    //   35: new 71	java/lang/AssertionError
    //   38: dup
    //   39: invokespecial 72	java/lang/AssertionError:<init>	()V
    //   42: athrow
    //   43: iconst_0
    //   44: ireturn
    //   45: invokestatic 183	com/almworks/sqlite4java/Internal:isFineLogging	()Z
    //   48: ifeq +53 -> 101
    //   51: aload_0
    //   52: new 122	java/lang/StringBuilder
    //   55: dup
    //   56: invokespecial 123	java/lang/StringBuilder:<init>	()V
    //   59: ldc_w 588
    //   62: invokevirtual 132	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   65: iload_1
    //   66: invokevirtual 127	java/lang/StringBuilder:append	(I)Ljava/lang/StringBuilder;
    //   69: ldc_w 269
    //   72: invokevirtual 132	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   75: iload_3
    //   76: invokevirtual 127	java/lang/StringBuilder:append	(I)Ljava/lang/StringBuilder;
    //   79: ldc_w 269
    //   82: invokevirtual 132	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   85: iload 4
    //   87: invokevirtual 127	java/lang/StringBuilder:append	(I)Ljava/lang/StringBuilder;
    //   90: ldc -122
    //   92: invokevirtual 132	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   95: invokevirtual 138	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   98: invokestatic 86	com/almworks/sqlite4java/Internal:logFine	(Ljava/lang/Object;Ljava/lang/Object;)V
    //   101: aload_0
    //   102: getfield 250	com/almworks/sqlite4java/SQLiteStatement:myStepped	Z
    //   105: ifeq +12 -> 117
    //   108: aload_0
    //   109: getfield 107	com/almworks/sqlite4java/SQLiteStatement:myHasRow	Z
    //   112: ifne +5 -> 117
    //   115: iconst_0
    //   116: ireturn
    //   117: aload_0
    //   118: invokespecial 96	com/almworks/sqlite4java/SQLiteStatement:handle	()Lcom/almworks/sqlite4java/SWIGTYPE_p_sqlite3_stmt;
    //   121: astore 5
    //   123: aload_0
    //   124: invokespecial 590	com/almworks/sqlite4java/SQLiteStatement:prepareStep	()Lcom/almworks/sqlite4java/ProgressHandler;
    //   127: astore 6
    //   129: aload_0
    //   130: getfield 55	com/almworks/sqlite4java/SQLiteStatement:myController	Lcom/almworks/sqlite4java/SQLiteController;
    //   133: invokevirtual 431	com/almworks/sqlite4java/SQLiteController:getSQLiteManual	()Lcom/almworks/sqlite4java/_SQLiteManual;
    //   136: astore 8
    //   138: aload_0
    //   139: getfield 68	com/almworks/sqlite4java/SQLiteStatement:myProfiler	Lcom/almworks/sqlite4java/SQLiteProfiler;
    //   142: astore 9
    //   144: aload 9
    //   146: ifnonnull +78 -> 224
    //   149: lconst_0
    //   150: lstore 12
    //   152: aload 8
    //   154: aload 5
    //   156: iload_1
    //   157: aload_2
    //   158: iload_3
    //   159: iload 4
    //   161: invokevirtual 594	com/almworks/sqlite4java/_SQLiteManual:wrapper_load_ints	(Lcom/almworks/sqlite4java/SWIGTYPE_p_sqlite3_stmt;I[III)I
    //   164: istore 14
    //   166: aload 8
    //   168: invokevirtual 438	com/almworks/sqlite4java/_SQLiteManual:getLastReturnCode	()I
    //   171: istore 15
    //   173: aload 9
    //   175: ifnull +28 -> 203
    //   178: aload 9
    //   180: aload_0
    //   181: getfield 250	com/almworks/sqlite4java/SQLiteStatement:myStepped	Z
    //   184: aload_0
    //   185: getfield 66	com/almworks/sqlite4java/SQLiteStatement:mySqlParts	Lcom/almworks/sqlite4java/SQLParts;
    //   188: invokevirtual 595	com/almworks/sqlite4java/SQLParts:toString	()Ljava/lang/String;
    //   191: lload 12
    //   193: invokestatic 600	java/lang/System:nanoTime	()J
    //   196: iload 15
    //   198: iload 14
    //   200: invokevirtual 606	com/almworks/sqlite4java/SQLiteProfiler:reportLoadInts	(ZLjava/lang/String;JJII)V
    //   203: aload_0
    //   204: aload 6
    //   206: ldc_w 607
    //   209: invokespecial 609	com/almworks/sqlite4java/SQLiteStatement:finalizeStep	(Lcom/almworks/sqlite4java/ProgressHandler;Ljava/lang/String;)V
    //   212: aload_0
    //   213: iload 15
    //   215: ldc_w 607
    //   218: invokespecial 611	com/almworks/sqlite4java/SQLiteStatement:stepResult	(ILjava/lang/String;)V
    //   221: iload 14
    //   223: ireturn
    //   224: invokestatic 600	java/lang/System:nanoTime	()J
    //   227: lstore 10
    //   229: lload 10
    //   231: lstore 12
    //   233: goto -81 -> 152
    //   236: astore 7
    //   238: aload_0
    //   239: aload 6
    //   241: ldc_w 607
    //   244: invokespecial 609	com/almworks/sqlite4java/SQLiteStatement:finalizeStep	(Lcom/almworks/sqlite4java/ProgressHandler;Ljava/lang/String;)V
    //   247: aload 7
    //   249: athrow
    // Local variable table:
    //   start	length	slot	name	signature
    //   0	250	0	this	SQLiteStatement
    //   0	250	1	paramInt1	int
    //   0	250	2	paramArrayOfInt	int[]
    //   0	250	3	paramInt2	int
    //   0	250	4	paramInt3	int
    //   121	34	5	localSWIGTYPE_p_sqlite3_stmt	SWIGTYPE_p_sqlite3_stmt
    //   127	113	6	localProgressHandler	ProgressHandler
    //   236	12	7	localObject	Object
    //   136	31	8	local_SQLiteManual	_SQLiteManual
    //   142	37	9	localSQLiteProfiler	SQLiteProfiler
    //   227	3	10	l1	long
    //   150	82	12	l2	long
    //   164	58	14	i	int
    //   171	43	15	j	int
    // Exception table:
    //   from	to	target	type
    //   129	144	236	finally
    //   152	173	236	finally
    //   178	203	236	finally
    //   224	229	236	finally
  }
  
  /* Error */
  public int loadLongs(int paramInt1, long[] paramArrayOfLong, int paramInt2, int paramInt3)
    throws SQLiteException
  {
    // Byte code:
    //   0: aload_0
    //   1: getfield 55	com/almworks/sqlite4java/SQLiteStatement:myController	Lcom/almworks/sqlite4java/SQLiteController;
    //   4: invokevirtual 265	com/almworks/sqlite4java/SQLiteController:validate	()V
    //   7: aload_2
    //   8: ifnull +21 -> 29
    //   11: iload 4
    //   13: ifle +16 -> 29
    //   16: iload_3
    //   17: iflt +12 -> 29
    //   20: iload_3
    //   21: iload 4
    //   23: iadd
    //   24: aload_2
    //   25: arraylength
    //   26: if_icmple +19 -> 45
    //   29: getstatic 39	com/almworks/sqlite4java/SQLiteStatement:$assertionsDisabled	Z
    //   32: ifne +11 -> 43
    //   35: new 71	java/lang/AssertionError
    //   38: dup
    //   39: invokespecial 72	java/lang/AssertionError:<init>	()V
    //   42: athrow
    //   43: iconst_0
    //   44: ireturn
    //   45: invokestatic 183	com/almworks/sqlite4java/Internal:isFineLogging	()Z
    //   48: ifeq +53 -> 101
    //   51: aload_0
    //   52: new 122	java/lang/StringBuilder
    //   55: dup
    //   56: invokespecial 123	java/lang/StringBuilder:<init>	()V
    //   59: ldc_w 615
    //   62: invokevirtual 132	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   65: iload_1
    //   66: invokevirtual 127	java/lang/StringBuilder:append	(I)Ljava/lang/StringBuilder;
    //   69: ldc_w 269
    //   72: invokevirtual 132	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   75: iload_3
    //   76: invokevirtual 127	java/lang/StringBuilder:append	(I)Ljava/lang/StringBuilder;
    //   79: ldc_w 269
    //   82: invokevirtual 132	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   85: iload 4
    //   87: invokevirtual 127	java/lang/StringBuilder:append	(I)Ljava/lang/StringBuilder;
    //   90: ldc -122
    //   92: invokevirtual 132	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   95: invokevirtual 138	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   98: invokestatic 86	com/almworks/sqlite4java/Internal:logFine	(Ljava/lang/Object;Ljava/lang/Object;)V
    //   101: aload_0
    //   102: getfield 250	com/almworks/sqlite4java/SQLiteStatement:myStepped	Z
    //   105: ifeq +12 -> 117
    //   108: aload_0
    //   109: getfield 107	com/almworks/sqlite4java/SQLiteStatement:myHasRow	Z
    //   112: ifne +5 -> 117
    //   115: iconst_0
    //   116: ireturn
    //   117: aload_0
    //   118: invokespecial 96	com/almworks/sqlite4java/SQLiteStatement:handle	()Lcom/almworks/sqlite4java/SWIGTYPE_p_sqlite3_stmt;
    //   121: astore 5
    //   123: aload_0
    //   124: invokespecial 590	com/almworks/sqlite4java/SQLiteStatement:prepareStep	()Lcom/almworks/sqlite4java/ProgressHandler;
    //   127: astore 6
    //   129: aload_0
    //   130: getfield 55	com/almworks/sqlite4java/SQLiteStatement:myController	Lcom/almworks/sqlite4java/SQLiteController;
    //   133: invokevirtual 431	com/almworks/sqlite4java/SQLiteController:getSQLiteManual	()Lcom/almworks/sqlite4java/_SQLiteManual;
    //   136: astore 8
    //   138: aload_0
    //   139: getfield 68	com/almworks/sqlite4java/SQLiteStatement:myProfiler	Lcom/almworks/sqlite4java/SQLiteProfiler;
    //   142: astore 9
    //   144: aload 9
    //   146: ifnonnull +78 -> 224
    //   149: lconst_0
    //   150: lstore 12
    //   152: aload 8
    //   154: aload 5
    //   156: iload_1
    //   157: aload_2
    //   158: iload_3
    //   159: iload 4
    //   161: invokevirtual 619	com/almworks/sqlite4java/_SQLiteManual:wrapper_load_longs	(Lcom/almworks/sqlite4java/SWIGTYPE_p_sqlite3_stmt;I[JII)I
    //   164: istore 14
    //   166: aload 8
    //   168: invokevirtual 438	com/almworks/sqlite4java/_SQLiteManual:getLastReturnCode	()I
    //   171: istore 15
    //   173: aload 9
    //   175: ifnull +28 -> 203
    //   178: aload 9
    //   180: aload_0
    //   181: getfield 250	com/almworks/sqlite4java/SQLiteStatement:myStepped	Z
    //   184: aload_0
    //   185: getfield 66	com/almworks/sqlite4java/SQLiteStatement:mySqlParts	Lcom/almworks/sqlite4java/SQLParts;
    //   188: invokevirtual 595	com/almworks/sqlite4java/SQLParts:toString	()Ljava/lang/String;
    //   191: lload 12
    //   193: invokestatic 600	java/lang/System:nanoTime	()J
    //   196: iload 15
    //   198: iload 14
    //   200: invokevirtual 622	com/almworks/sqlite4java/SQLiteProfiler:reportLoadLongs	(ZLjava/lang/String;JJII)V
    //   203: aload_0
    //   204: aload 6
    //   206: ldc_w 623
    //   209: invokespecial 609	com/almworks/sqlite4java/SQLiteStatement:finalizeStep	(Lcom/almworks/sqlite4java/ProgressHandler;Ljava/lang/String;)V
    //   212: aload_0
    //   213: iload 15
    //   215: ldc_w 623
    //   218: invokespecial 611	com/almworks/sqlite4java/SQLiteStatement:stepResult	(ILjava/lang/String;)V
    //   221: iload 14
    //   223: ireturn
    //   224: invokestatic 600	java/lang/System:nanoTime	()J
    //   227: lstore 10
    //   229: lload 10
    //   231: lstore 12
    //   233: goto -81 -> 152
    //   236: astore 7
    //   238: aload_0
    //   239: aload 6
    //   241: ldc_w 623
    //   244: invokespecial 609	com/almworks/sqlite4java/SQLiteStatement:finalizeStep	(Lcom/almworks/sqlite4java/ProgressHandler;Ljava/lang/String;)V
    //   247: aload 7
    //   249: athrow
    // Local variable table:
    //   start	length	slot	name	signature
    //   0	250	0	this	SQLiteStatement
    //   0	250	1	paramInt1	int
    //   0	250	2	paramArrayOfLong	long[]
    //   0	250	3	paramInt2	int
    //   0	250	4	paramInt3	int
    //   121	34	5	localSWIGTYPE_p_sqlite3_stmt	SWIGTYPE_p_sqlite3_stmt
    //   127	113	6	localProgressHandler	ProgressHandler
    //   236	12	7	localObject	Object
    //   136	31	8	local_SQLiteManual	_SQLiteManual
    //   142	37	9	localSQLiteProfiler	SQLiteProfiler
    //   227	3	10	l1	long
    //   150	82	12	l2	long
    //   164	58	14	i	int
    //   171	43	15	j	int
    // Exception table:
    //   from	to	target	type
    //   129	144	236	finally
    //   152	173	236	finally
    //   178	203	236	finally
    //   224	229	236	finally
  }
  
  public SQLiteStatement reset()
    throws SQLiteException
  {
    return reset(true);
  }
  
  public SQLiteStatement reset(boolean paramBoolean)
    throws SQLiteException
  {
    this.myController.validate();
    boolean bool = Internal.isFineLogging();
    if (bool) {
      Internal.logFine(this, "reset(" + paramBoolean + ")");
    }
    SWIGTYPE_p_sqlite3_stmt localSWIGTYPE_p_sqlite3_stmt = handle();
    clearColumnStreams();
    if (this.myStepped)
    {
      if (bool) {
        Internal.logFine(this, "resetting");
      }
      _SQLiteSwigged.sqlite3_reset(localSWIGTYPE_p_sqlite3_stmt);
    }
    this.myHasRow = false;
    this.myStepped = false;
    this.myColumnCount = -1;
    if ((paramBoolean) && (this.myHasBindings))
    {
      if (bool) {
        Internal.logFine(this, "clearing bindings");
      }
      int i = _SQLiteSwigged.sqlite3_clear_bindings(localSWIGTYPE_p_sqlite3_stmt);
      this.myController.throwResult(i, "reset.clearBindings()", this);
      clearBindStreams(false);
      this.myHasBindings = false;
    }
    try
    {
      this.myCancelled = false;
      return this;
    }
    finally {}
  }
  
  SWIGTYPE_p_sqlite3_stmt statementHandle()
  {
    return this.myHandle;
  }
  
  /* Error */
  public boolean step()
    throws SQLiteException
  {
    // Byte code:
    //   0: aload_0
    //   1: getfield 55	com/almworks/sqlite4java/SQLiteStatement:myController	Lcom/almworks/sqlite4java/SQLiteController;
    //   4: invokevirtual 265	com/almworks/sqlite4java/SQLiteController:validate	()V
    //   7: invokestatic 183	com/almworks/sqlite4java/Internal:isFineLogging	()Z
    //   10: ifeq +10 -> 20
    //   13: aload_0
    //   14: ldc_w 641
    //   17: invokestatic 86	com/almworks/sqlite4java/Internal:logFine	(Ljava/lang/Object;Ljava/lang/Object;)V
    //   20: aload_0
    //   21: invokespecial 96	com/almworks/sqlite4java/SQLiteStatement:handle	()Lcom/almworks/sqlite4java/SWIGTYPE_p_sqlite3_stmt;
    //   24: astore_1
    //   25: aload_0
    //   26: invokespecial 590	com/almworks/sqlite4java/SQLiteStatement:prepareStep	()Lcom/almworks/sqlite4java/ProgressHandler;
    //   29: astore_2
    //   30: aload_0
    //   31: getfield 68	com/almworks/sqlite4java/SQLiteStatement:myProfiler	Lcom/almworks/sqlite4java/SQLiteProfiler;
    //   34: astore 4
    //   36: aload 4
    //   38: ifnonnull +62 -> 100
    //   41: lconst_0
    //   42: lstore 7
    //   44: aload_1
    //   45: invokestatic 644	com/almworks/sqlite4java/_SQLiteSwigged:sqlite3_step	(Lcom/almworks/sqlite4java/SWIGTYPE_p_sqlite3_stmt;)I
    //   48: istore 9
    //   50: aload 4
    //   52: ifnull +26 -> 78
    //   55: aload 4
    //   57: aload_0
    //   58: getfield 250	com/almworks/sqlite4java/SQLiteStatement:myStepped	Z
    //   61: aload_0
    //   62: getfield 66	com/almworks/sqlite4java/SQLiteStatement:mySqlParts	Lcom/almworks/sqlite4java/SQLParts;
    //   65: invokevirtual 595	com/almworks/sqlite4java/SQLParts:toString	()Ljava/lang/String;
    //   68: lload 7
    //   70: invokestatic 600	java/lang/System:nanoTime	()J
    //   73: iload 9
    //   75: invokevirtual 648	com/almworks/sqlite4java/SQLiteProfiler:reportStep	(ZLjava/lang/String;JJI)V
    //   78: aload_0
    //   79: aload_2
    //   80: ldc_w 641
    //   83: invokespecial 609	com/almworks/sqlite4java/SQLiteStatement:finalizeStep	(Lcom/almworks/sqlite4java/ProgressHandler;Ljava/lang/String;)V
    //   86: aload_0
    //   87: iload 9
    //   89: ldc_w 641
    //   92: invokespecial 611	com/almworks/sqlite4java/SQLiteStatement:stepResult	(ILjava/lang/String;)V
    //   95: aload_0
    //   96: getfield 107	com/almworks/sqlite4java/SQLiteStatement:myHasRow	Z
    //   99: ireturn
    //   100: invokestatic 600	java/lang/System:nanoTime	()J
    //   103: lstore 5
    //   105: lload 5
    //   107: lstore 7
    //   109: goto -65 -> 44
    //   112: astore_3
    //   113: aload_0
    //   114: aload_2
    //   115: ldc_w 641
    //   118: invokespecial 609	com/almworks/sqlite4java/SQLiteStatement:finalizeStep	(Lcom/almworks/sqlite4java/ProgressHandler;Ljava/lang/String;)V
    //   121: aload_3
    //   122: athrow
    // Local variable table:
    //   start	length	slot	name	signature
    //   0	123	0	this	SQLiteStatement
    //   24	21	1	localSWIGTYPE_p_sqlite3_stmt	SWIGTYPE_p_sqlite3_stmt
    //   29	86	2	localProgressHandler	ProgressHandler
    //   112	10	3	localObject	Object
    //   34	22	4	localSQLiteProfiler	SQLiteProfiler
    //   103	3	5	l1	long
    //   42	66	7	l2	long
    //   48	40	9	i	int
    // Exception table:
    //   from	to	target	type
    //   30	36	112	finally
    //   44	50	112	finally
    //   55	78	112	finally
    //   100	105	112	finally
  }
  
  public SQLiteStatement stepThrough()
    throws SQLiteException
  {
    while (step()) {}
    return this;
  }
  
  public String toString()
  {
    return "[" + this.mySqlParts + "]" + this.myController;
  }
  
  private final class BindStream
    extends OutputStream
  {
    private DirectBuffer myBuffer;
    private final int myIndex;
    
    static
    {
      if (!SQLiteStatement.class.desiredAssertionStatus()) {}
      for (boolean bool = true;; bool = false)
      {
        $assertionsDisabled = bool;
        return;
      }
    }
    
    public BindStream(int paramInt, DirectBuffer paramDirectBuffer)
      throws IOException
    {
      this.myIndex = paramInt;
      this.myBuffer = paramDirectBuffer;
      this.myBuffer.data().clear();
    }
    
    private ByteBuffer buffer(int paramInt)
      throws IOException, SQLiteException
    {
      DirectBuffer localDirectBuffer1 = getBuffer();
      Object localObject = localDirectBuffer1.data();
      if (((ByteBuffer)localObject).remaining() < paramInt) {
        try
        {
          DirectBuffer localDirectBuffer2 = SQLiteStatement.this.myController.allocateBuffer(paramInt + localDirectBuffer1.getCapacity());
          ByteBuffer localByteBuffer = localDirectBuffer2.data();
          ((ByteBuffer)localObject).flip();
          localByteBuffer.put((ByteBuffer)localObject);
          SQLiteStatement.this.myController.freeBuffer(localDirectBuffer1);
          localObject = localByteBuffer;
          this.myBuffer = localDirectBuffer2;
          if ((!$assertionsDisabled) && (((ByteBuffer)localObject).remaining() < paramInt)) {
            throw new AssertionError(((ByteBuffer)localObject).capacity());
          }
        }
        catch (IOException localIOException)
        {
          dispose();
          throw localIOException;
        }
      }
      return (ByteBuffer)localObject;
    }
    
    private DirectBuffer getBuffer()
      throws IOException
    {
      DirectBuffer localDirectBuffer = this.myBuffer;
      if (localDirectBuffer == null) {
        throw new IOException("stream discarded");
      }
      if (!localDirectBuffer.isValid()) {
        throw new IOException("buffer discarded");
      }
      if (!localDirectBuffer.isUsed()) {
        throw new IOException("buffer not used");
      }
      return localDirectBuffer;
    }
    
    public void close()
      throws IOException
    {
      try
      {
        SQLiteStatement.this.myController.validate();
        DirectBuffer localDirectBuffer = this.myBuffer;
        if (localDirectBuffer == null) {
          return;
        }
        if (Internal.isFineLogging()) {
          Internal.logFine(SQLiteStatement.this, "BindStream.close:bind([" + localDirectBuffer.data().capacity() + "])");
        }
        int i = _SQLiteManual.wrapper_bind_buffer(SQLiteStatement.this.handle(), this.myIndex, localDirectBuffer);
        dispose();
        SQLiteStatement.this.myController.throwResult(i, "bind(buffer)", SQLiteStatement.this);
        return;
      }
      catch (SQLiteException localSQLiteException)
      {
        throw new IOException("cannot write: " + localSQLiteException);
      }
    }
    
    public void dispose()
    {
      DirectBuffer localDirectBuffer = this.myBuffer;
      if (localDirectBuffer != null)
      {
        this.myBuffer = null;
        SQLiteStatement.this.myController.freeBuffer(localDirectBuffer);
      }
      List localList = SQLiteStatement.this.myBindStreams;
      if (localList != null) {
        localList.remove(this);
      }
    }
    
    public boolean isDisposed()
    {
      return this.myBuffer == null;
    }
    
    public void write(int paramInt)
      throws IOException
    {
      try
      {
        SQLiteStatement.this.myController.validate();
        buffer(1).put((byte)paramInt);
        return;
      }
      catch (SQLiteException localSQLiteException)
      {
        dispose();
        throw new IOException("cannot write: " + localSQLiteException);
      }
    }
    
    public void write(byte[] paramArrayOfByte, int paramInt1, int paramInt2)
      throws IOException
    {
      try
      {
        SQLiteStatement.this.myController.validate();
        buffer(paramInt2).put(paramArrayOfByte, paramInt1, paramInt2);
        return;
      }
      catch (SQLiteException localSQLiteException)
      {
        dispose();
        throw new IOException("cannot write: " + localSQLiteException);
      }
    }
  }
  
  private class ColumnStream
    extends InputStream
  {
    private ByteBuffer myBuffer;
    
    static
    {
      if (!SQLiteStatement.class.desiredAssertionStatus()) {}
      for (boolean bool = true;; bool = false)
      {
        $assertionsDisabled = bool;
        return;
      }
    }
    
    public ColumnStream(ByteBuffer paramByteBuffer)
    {
      assert (paramByteBuffer != null);
      this.myBuffer = paramByteBuffer;
    }
    
    public void close()
      throws IOException
    {
      this.myBuffer = null;
      List localList = SQLiteStatement.this.myColumnStreams;
      if (localList != null) {
        localList.remove(this);
      }
    }
    
    public ByteBuffer getBuffer()
      throws IOException
    {
      ByteBuffer localByteBuffer = this.myBuffer;
      if (localByteBuffer == null) {
        throw new IOException("stream closed");
      }
      return localByteBuffer;
    }
    
    public int read()
      throws IOException
    {
      ByteBuffer localByteBuffer = getBuffer();
      if (localByteBuffer.remaining() <= 0) {
        return -1;
      }
      try
      {
        int i = localByteBuffer.get();
        return i & 0xFF;
      }
      catch (BufferUnderflowException localBufferUnderflowException)
      {
        Internal.logWarn(this, "weird: " + localBufferUnderflowException);
      }
      return -1;
    }
    
    public int read(byte[] paramArrayOfByte, int paramInt1, int paramInt2)
      throws IOException
    {
      ByteBuffer localByteBuffer = getBuffer();
      int i = localByteBuffer.remaining();
      if (i <= 0) {
        return -1;
      }
      if (i < paramInt2) {
        paramInt2 = i;
      }
      try
      {
        localByteBuffer.get(paramArrayOfByte, paramInt1, paramInt2);
        return paramInt2;
      }
      catch (BufferUnderflowException localBufferUnderflowException)
      {
        Internal.logWarn(this, "weird: " + localBufferUnderflowException);
      }
      return -1;
    }
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/almworks/sqlite4java/SQLiteStatement.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */