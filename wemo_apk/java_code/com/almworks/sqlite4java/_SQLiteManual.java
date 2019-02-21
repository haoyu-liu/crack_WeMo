package com.almworks.sqlite4java;

import java.nio.ByteBuffer;

final class _SQLiteManual
{
  private final byte[][] myByteArray = { null };
  private final int[] myInt = { 0, 0, 0 };
  private String myLastOpenError = null;
  private int myLastReturnCode = 0;
  private final long[] myLong = { 0L };
  private final Object[] myObject = { null, null };
  private final String[] myString = { null, null };
  
  static
  {
    if (!_SQLiteManual.class.desiredAssertionStatus()) {}
    for (boolean bool = true;; bool = false)
    {
      $assertionsDisabled = bool;
      return;
    }
  }
  
  public static int sqlite3_bind_blob(SWIGTYPE_p_sqlite3_stmt paramSWIGTYPE_p_sqlite3_stmt, int paramInt1, byte[] paramArrayOfByte, int paramInt2, int paramInt3)
  {
    return _SQLiteManualJNI.sqlite3_bind_blob(SWIGTYPE_p_sqlite3_stmt.getCPtr(paramSWIGTYPE_p_sqlite3_stmt), paramInt1, paramArrayOfByte, paramInt2, paramInt3);
  }
  
  public static int sqlite3_bind_text(SWIGTYPE_p_sqlite3_stmt paramSWIGTYPE_p_sqlite3_stmt, int paramInt, String paramString)
  {
    return _SQLiteManualJNI.sqlite3_bind_text(SWIGTYPE_p_sqlite3_stmt.getCPtr(paramSWIGTYPE_p_sqlite3_stmt), paramInt, paramString);
  }
  
  public static int sqlite3_blob_read(SWIGTYPE_p_sqlite3_blob paramSWIGTYPE_p_sqlite3_blob, int paramInt1, byte[] paramArrayOfByte, int paramInt2, int paramInt3)
  {
    return _SQLiteManualJNI.sqlite3_blob_read(SWIGTYPE_p_sqlite3_blob.getCPtr(paramSWIGTYPE_p_sqlite3_blob), paramInt1, paramArrayOfByte, paramInt2, paramInt3);
  }
  
  public static int sqlite3_blob_write(SWIGTYPE_p_sqlite3_blob paramSWIGTYPE_p_sqlite3_blob, int paramInt1, byte[] paramArrayOfByte, int paramInt2, int paramInt3)
  {
    return _SQLiteManualJNI.sqlite3_blob_write(SWIGTYPE_p_sqlite3_blob.getCPtr(paramSWIGTYPE_p_sqlite3_blob), paramInt1, paramArrayOfByte, paramInt2, paramInt3);
  }
  
  public static int sqlite3_exec(SWIGTYPE_p_sqlite3 paramSWIGTYPE_p_sqlite3, String paramString, String[] paramArrayOfString)
  {
    assert ((paramArrayOfString == null) || (paramArrayOfString.length == 1)) : paramArrayOfString.length;
    return _SQLiteManualJNI.sqlite3_exec(SWIGTYPE_p_sqlite3.getCPtr(paramSWIGTYPE_p_sqlite3), paramString, paramArrayOfString);
  }
  
  public static int sqlite3_intarray_bind(SWIGTYPE_p_intarray paramSWIGTYPE_p_intarray, long[] paramArrayOfLong, int paramInt1, int paramInt2, boolean paramBoolean1, boolean paramBoolean2)
  {
    return _SQLiteManualJNI.sqlite3_intarray_bind(SWIGTYPE_p_intarray.getCPtr(paramSWIGTYPE_p_intarray), paramArrayOfLong, paramInt1, paramInt2, paramBoolean1, paramBoolean2);
  }
  
  public static int sqlite3_intarray_destroy(SWIGTYPE_p_intarray paramSWIGTYPE_p_intarray)
  {
    return _SQLiteManualJNI.sqlite3_intarray_destroy(SWIGTYPE_p_intarray.getCPtr(paramSWIGTYPE_p_intarray));
  }
  
  public static int sqlite3_intarray_unbind(SWIGTYPE_p_intarray paramSWIGTYPE_p_intarray)
  {
    return _SQLiteManualJNI.sqlite3_intarray_unbind(SWIGTYPE_p_intarray.getCPtr(paramSWIGTYPE_p_intarray));
  }
  
  public static int uninstall_progress_handler(SWIGTYPE_p_sqlite3 paramSWIGTYPE_p_sqlite3, ProgressHandler paramProgressHandler)
  {
    SWIGTYPE_p_direct_buffer localSWIGTYPE_p_direct_buffer = paramProgressHandler.dispose();
    if (localSWIGTYPE_p_direct_buffer == null) {
      return 0;
    }
    return _SQLiteManualJNI.uninstall_progress_handler(SWIGTYPE_p_sqlite3.getCPtr(paramSWIGTYPE_p_sqlite3), SWIGTYPE_p_direct_buffer.getCPtr(localSWIGTYPE_p_direct_buffer));
  }
  
  public static int wrapper_bind_buffer(SWIGTYPE_p_sqlite3_stmt paramSWIGTYPE_p_sqlite3_stmt, int paramInt, DirectBuffer paramDirectBuffer)
  {
    SWIGTYPE_p_direct_buffer localSWIGTYPE_p_direct_buffer = paramDirectBuffer.getHandle();
    if (localSWIGTYPE_p_direct_buffer == null) {
      return -99;
    }
    int i = paramDirectBuffer.getPosition();
    return _SQLiteManualJNI.wrapper_bind_buffer(SWIGTYPE_p_sqlite3_stmt.getCPtr(paramSWIGTYPE_p_sqlite3_stmt), paramInt, SWIGTYPE_p_direct_buffer.getCPtr(localSWIGTYPE_p_direct_buffer), i);
  }
  
  public static int wrapper_free(DirectBuffer paramDirectBuffer)
  {
    SWIGTYPE_p_direct_buffer localSWIGTYPE_p_direct_buffer = paramDirectBuffer.getHandle();
    paramDirectBuffer.invalidate();
    if (localSWIGTYPE_p_direct_buffer == null) {
      return 0;
    }
    return _SQLiteManualJNI.wrapper_free(SWIGTYPE_p_direct_buffer.getCPtr(localSWIGTYPE_p_direct_buffer));
  }
  
  public static String wrapper_version()
  {
    return _SQLiteManualJNI.wrapper_version();
  }
  
  public String drainLastOpenError()
  {
    String str = this.myLastOpenError;
    this.myLastOpenError = null;
    return str;
  }
  
  public int getLastReturnCode()
  {
    return this.myLastReturnCode;
  }
  
  public ProgressHandler install_progress_handler(SWIGTYPE_p_sqlite3 paramSWIGTYPE_p_sqlite3, int paramInt)
  {
    this.myLastReturnCode = 0;
    this.myLong[0] = 0L;
    this.myObject[0] = null;
    this.myLastReturnCode = _SQLiteManualJNI.install_progress_handler(SWIGTYPE_p_sqlite3.getCPtr(paramSWIGTYPE_p_sqlite3), paramInt, this.myLong, this.myObject);
    if ((this.myObject[0] instanceof ByteBuffer)) {}
    long l;
    for (ByteBuffer localByteBuffer = (ByteBuffer)this.myObject[0];; localByteBuffer = null)
    {
      this.myObject[0] = null;
      l = this.myLong[0];
      this.myLong[0] = 0L;
      if ((l != 0L) && (localByteBuffer != null)) {
        break;
      }
      return null;
    }
    return new ProgressHandler(new SWIGTYPE_p_direct_buffer(l, true), localByteBuffer, paramInt);
  }
  
  public SWIGTYPE_p_sqlite3_blob sqlite3_blob_open(SWIGTYPE_p_sqlite3 paramSWIGTYPE_p_sqlite3, String paramString1, String paramString2, String paramString3, long paramLong, boolean paramBoolean)
  {
    this.myLastReturnCode = 0;
    this.myLong[0] = 0L;
    this.myLastReturnCode = _SQLiteManualJNI.sqlite3_blob_open(SWIGTYPE_p_sqlite3.getCPtr(paramSWIGTYPE_p_sqlite3), paramString1, paramString2, paramString3, paramLong, paramBoolean, this.myLong);
    long l = this.myLong[0];
    this.myLong[0] = 0L;
    if (l == 0L) {
      return null;
    }
    return new SWIGTYPE_p_sqlite3_blob(l, true);
  }
  
  public byte[] sqlite3_column_blob(SWIGTYPE_p_sqlite3_stmt paramSWIGTYPE_p_sqlite3_stmt, int paramInt)
  {
    this.myLastReturnCode = 0;
    this.myByteArray[0] = null;
    this.myLastReturnCode = _SQLiteManualJNI.sqlite3_column_blob(SWIGTYPE_p_sqlite3_stmt.getCPtr(paramSWIGTYPE_p_sqlite3_stmt), paramInt, this.myByteArray);
    byte[] arrayOfByte = this.myByteArray[0];
    this.myByteArray[0] = null;
    return arrayOfByte;
  }
  
  public String sqlite3_column_text(SWIGTYPE_p_sqlite3_stmt paramSWIGTYPE_p_sqlite3_stmt, int paramInt)
  {
    this.myLastReturnCode = 0;
    this.myString[0] = null;
    this.myLastReturnCode = _SQLiteManualJNI.sqlite3_column_text(SWIGTYPE_p_sqlite3_stmt.getCPtr(paramSWIGTYPE_p_sqlite3_stmt), paramInt, this.myString);
    String str = this.myString[0];
    this.myString[0] = null;
    return str;
  }
  
  public SWIGTYPE_p_intarray sqlite3_intarray_create(SWIGTYPE_p_intarray_module paramSWIGTYPE_p_intarray_module, String paramString)
  {
    this.myLastReturnCode = 0;
    this.myLong[0] = 0L;
    this.myLastReturnCode = _SQLiteManualJNI.sqlite3_intarray_create(SWIGTYPE_p_intarray_module.getCPtr(paramSWIGTYPE_p_intarray_module), paramString, this.myLong);
    if (this.myLong[0] == 0L) {
      return null;
    }
    return new SWIGTYPE_p_intarray(this.myLong[0], true);
  }
  
  public SWIGTYPE_p_intarray_module sqlite3_intarray_register(SWIGTYPE_p_sqlite3 paramSWIGTYPE_p_sqlite3)
  {
    this.myLastReturnCode = 0;
    this.myLong[0] = 0L;
    this.myLastReturnCode = _SQLiteManualJNI.sqlite3_intarray_register(SWIGTYPE_p_sqlite3.getCPtr(paramSWIGTYPE_p_sqlite3), this.myLong);
    if (this.myLong[0] == 0L) {
      return null;
    }
    return new SWIGTYPE_p_intarray_module(this.myLong[0], true);
  }
  
  public String sqlite3_load_extension(SWIGTYPE_p_sqlite3 paramSWIGTYPE_p_sqlite3, String paramString1, String paramString2)
  {
    this.myLastReturnCode = 0;
    this.myString[0] = null;
    this.myLastReturnCode = _SQLiteManualJNI.sqlite3_load_extension(SWIGTYPE_p_sqlite3.getCPtr(paramSWIGTYPE_p_sqlite3), paramString1, paramString2, this.myString);
    String str = this.myString[0];
    this.myString[0] = null;
    return str;
  }
  
  public SWIGTYPE_p_sqlite3 sqlite3_open_v2(String paramString, int paramInt)
  {
    this.myLastReturnCode = 0;
    this.myLong[0] = 0L;
    this.myString[0] = null;
    this.myLastReturnCode = _SQLiteManualJNI.sqlite3_open_v2(paramString, this.myLong, paramInt, this.myString);
    long l = this.myLong[0];
    this.myLong[0] = 0L;
    this.myLastOpenError = this.myString[0];
    this.myString[0] = null;
    if (l == 0L) {
      return null;
    }
    return new SWIGTYPE_p_sqlite3(l, true);
  }
  
  public SWIGTYPE_p_sqlite3_stmt sqlite3_prepare_v2(SWIGTYPE_p_sqlite3 paramSWIGTYPE_p_sqlite3, String paramString)
  {
    this.myLastReturnCode = 0;
    this.myLong[0] = 0L;
    this.myLastReturnCode = _SQLiteManualJNI.sqlite3_prepare_v2(SWIGTYPE_p_sqlite3.getCPtr(paramSWIGTYPE_p_sqlite3), paramString, this.myLong);
    long l = this.myLong[0];
    this.myLong[0] = 0L;
    if (l == 0L) {
      return null;
    }
    return new SWIGTYPE_p_sqlite3_stmt(l, true);
  }
  
  public SQLiteColumnMetadata sqlite3_table_column_metadata(SWIGTYPE_p_sqlite3 paramSWIGTYPE_p_sqlite3, String paramString1, String paramString2, String paramString3)
    throws SQLiteException
  {
    this.myString[0] = null;
    this.myString[1] = null;
    this.myInt[0] = 0;
    this.myInt[1] = 0;
    this.myInt[2] = 0;
    int i = _SQLiteManualJNI.sqlite3_table_column_metadata(SWIGTYPE_p_sqlite3.getCPtr(paramSWIGTYPE_p_sqlite3), paramString1, paramString2, paramString3, this.myString, this.myInt);
    String str1 = this.myString[0];
    String str2 = this.myString[1];
    boolean bool1;
    boolean bool2;
    if (this.myInt[0] == 1)
    {
      bool1 = true;
      if (this.myInt[1] != 1) {
        break label188;
      }
      bool2 = true;
      label98:
      if (this.myInt[2] != 1) {
        break label194;
      }
    }
    SQLiteColumnMetadata localSQLiteColumnMetadata;
    label188:
    label194:
    for (boolean bool3 = true;; bool3 = false)
    {
      localSQLiteColumnMetadata = new SQLiteColumnMetadata(str1, str2, bool1, bool2, bool3);
      this.myString[0] = null;
      this.myString[1] = null;
      this.myInt[0] = 0;
      this.myInt[1] = 0;
      this.myInt[2] = 0;
      if (i == 0) {
        break label200;
      }
      throw new SQLiteException(i, "failed calling sqlite3_table_column_metadata()");
      bool1 = false;
      break;
      bool2 = false;
      break label98;
    }
    label200:
    return localSQLiteColumnMetadata;
  }
  
  public DirectBuffer wrapper_alloc(int paramInt)
  {
    this.myLastReturnCode = 0;
    this.myLong[0] = 0L;
    this.myObject[0] = null;
    this.myObject[1] = null;
    this.myLastReturnCode = _SQLiteManualJNI.wrapper_alloc(paramInt, this.myLong, this.myObject);
    ByteBuffer localByteBuffer1;
    if ((this.myObject[0] instanceof ByteBuffer))
    {
      localByteBuffer1 = (ByteBuffer)this.myObject[0];
      if (!(this.myObject[1] instanceof ByteBuffer)) {
        break label116;
      }
    }
    long l;
    label116:
    for (ByteBuffer localByteBuffer2 = (ByteBuffer)this.myObject[1];; localByteBuffer2 = null)
    {
      l = this.myLong[0];
      if ((localByteBuffer1 != null) && (localByteBuffer2 != null) && (l != 0L)) {
        break label121;
      }
      return null;
      localByteBuffer1 = null;
      break;
    }
    label121:
    return new DirectBuffer(new SWIGTYPE_p_direct_buffer(l, true), localByteBuffer1, localByteBuffer2, paramInt);
  }
  
  public ByteBuffer wrapper_column_buffer(SWIGTYPE_p_sqlite3_stmt paramSWIGTYPE_p_sqlite3_stmt, int paramInt)
  {
    this.myLastReturnCode = 0;
    this.myObject[0] = null;
    this.myLastReturnCode = _SQLiteManualJNI.wrapper_column_buffer(SWIGTYPE_p_sqlite3_stmt.getCPtr(paramSWIGTYPE_p_sqlite3_stmt), paramInt, this.myObject);
    if ((this.myObject[0] instanceof ByteBuffer)) {}
    for (ByteBuffer localByteBuffer = (ByteBuffer)this.myObject[0];; localByteBuffer = null)
    {
      this.myObject[0] = null;
      return localByteBuffer;
    }
  }
  
  public int wrapper_load_ints(SWIGTYPE_p_sqlite3_stmt paramSWIGTYPE_p_sqlite3_stmt, int paramInt1, int[] paramArrayOfInt, int paramInt2, int paramInt3)
  {
    this.myLastReturnCode = 0;
    this.myInt[0] = 0;
    this.myLastReturnCode = _SQLiteManualJNI.wrapper_load_ints(SWIGTYPE_p_sqlite3_stmt.getCPtr(paramSWIGTYPE_p_sqlite3_stmt), paramInt1, paramArrayOfInt, paramInt2, paramInt3, this.myInt);
    int i = this.myInt[0];
    this.myInt[0] = 0;
    return i;
  }
  
  public int wrapper_load_longs(SWIGTYPE_p_sqlite3_stmt paramSWIGTYPE_p_sqlite3_stmt, int paramInt1, long[] paramArrayOfLong, int paramInt2, int paramInt3)
  {
    this.myLastReturnCode = 0;
    this.myInt[0] = 0;
    this.myLastReturnCode = _SQLiteManualJNI.wrapper_load_longs(SWIGTYPE_p_sqlite3_stmt.getCPtr(paramSWIGTYPE_p_sqlite3_stmt), paramInt1, paramArrayOfLong, paramInt2, paramInt3, this.myInt);
    int i = this.myInt[0];
    this.myInt[0] = 0;
    return i;
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/almworks/sqlite4java/_SQLiteManual.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */