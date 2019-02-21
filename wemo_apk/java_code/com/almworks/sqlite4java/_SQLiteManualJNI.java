package com.almworks.sqlite4java;

final class _SQLiteManualJNI
{
  public static final native int install_progress_handler(long paramLong, int paramInt, long[] paramArrayOfLong, Object[] paramArrayOfObject);
  
  public static final native int sqlite3_bind_blob(long paramLong, int paramInt1, byte[] paramArrayOfByte, int paramInt2, int paramInt3);
  
  public static final native int sqlite3_bind_text(long paramLong, int paramInt, String paramString);
  
  public static final native int sqlite3_blob_open(long paramLong1, String paramString1, String paramString2, String paramString3, long paramLong2, boolean paramBoolean, long[] paramArrayOfLong);
  
  public static final native int sqlite3_blob_read(long paramLong, int paramInt1, byte[] paramArrayOfByte, int paramInt2, int paramInt3);
  
  public static final native int sqlite3_blob_write(long paramLong, int paramInt1, byte[] paramArrayOfByte, int paramInt2, int paramInt3);
  
  public static final native int sqlite3_column_blob(long paramLong, int paramInt, byte[][] paramArrayOfByte);
  
  public static final native int sqlite3_column_text(long paramLong, int paramInt, String[] paramArrayOfString);
  
  public static final native int sqlite3_exec(long paramLong, String paramString, String[] paramArrayOfString);
  
  public static final native int sqlite3_intarray_bind(long paramLong, long[] paramArrayOfLong, int paramInt1, int paramInt2, boolean paramBoolean1, boolean paramBoolean2);
  
  public static final native int sqlite3_intarray_create(long paramLong, String paramString, long[] paramArrayOfLong);
  
  public static final native int sqlite3_intarray_destroy(long paramLong);
  
  public static final native int sqlite3_intarray_register(long paramLong, long[] paramArrayOfLong);
  
  public static final native int sqlite3_intarray_unbind(long paramLong);
  
  public static final native int sqlite3_load_extension(long paramLong, String paramString1, String paramString2, String[] paramArrayOfString);
  
  public static final native int sqlite3_open_v2(String paramString, long[] paramArrayOfLong, int paramInt, String[] paramArrayOfString);
  
  public static final native int sqlite3_prepare_v2(long paramLong, String paramString, long[] paramArrayOfLong);
  
  public static final native int sqlite3_table_column_metadata(long paramLong, String paramString1, String paramString2, String paramString3, String[] paramArrayOfString, int[] paramArrayOfInt);
  
  public static final native int uninstall_progress_handler(long paramLong1, long paramLong2);
  
  public static final native int wrapper_alloc(int paramInt, long[] paramArrayOfLong, Object[] paramArrayOfObject);
  
  public static final native int wrapper_bind_buffer(long paramLong1, int paramInt1, long paramLong2, int paramInt2);
  
  public static final native int wrapper_column_buffer(long paramLong, int paramInt, Object[] paramArrayOfObject);
  
  public static final native int wrapper_free(long paramLong);
  
  public static final native int wrapper_load_ints(long paramLong, int paramInt1, int[] paramArrayOfInt1, int paramInt2, int paramInt3, int[] paramArrayOfInt2);
  
  public static final native int wrapper_load_longs(long paramLong, int paramInt1, long[] paramArrayOfLong, int paramInt2, int paramInt3, int[] paramArrayOfInt);
  
  public static final native String wrapper_version();
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/almworks/sqlite4java/_SQLiteManualJNI.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */