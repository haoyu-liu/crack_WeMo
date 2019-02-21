package com.almworks.sqlite4java;

class _SQLiteSwiggedJNI
{
  public static final native int sqlite3_backup_finish(long paramLong);
  
  public static final native long sqlite3_backup_init(long paramLong1, String paramString1, long paramLong2, String paramString2);
  
  public static final native int sqlite3_backup_pagecount(long paramLong);
  
  public static final native int sqlite3_backup_remaining(long paramLong);
  
  public static final native int sqlite3_backup_step(long paramLong, int paramInt);
  
  public static final native int sqlite3_bind_double(long paramLong, int paramInt, double paramDouble);
  
  public static final native int sqlite3_bind_int(long paramLong, int paramInt1, int paramInt2);
  
  public static final native int sqlite3_bind_int64(long paramLong1, int paramInt, long paramLong2);
  
  public static final native int sqlite3_bind_null(long paramLong, int paramInt);
  
  public static final native int sqlite3_bind_parameter_count(long paramLong);
  
  public static final native int sqlite3_bind_parameter_index(long paramLong, String paramString);
  
  public static final native String sqlite3_bind_parameter_name(long paramLong, int paramInt);
  
  public static final native int sqlite3_bind_zeroblob(long paramLong, int paramInt1, int paramInt2);
  
  public static final native int sqlite3_blob_bytes(long paramLong);
  
  public static final native int sqlite3_blob_close(long paramLong);
  
  public static final native int sqlite3_blob_reopen(long paramLong1, long paramLong2);
  
  public static final native int sqlite3_busy_timeout(long paramLong, int paramInt);
  
  public static final native int sqlite3_changes(long paramLong);
  
  public static final native int sqlite3_clear_bindings(long paramLong);
  
  public static final native int sqlite3_close(long paramLong);
  
  public static final native int sqlite3_column_count(long paramLong);
  
  public static final native String sqlite3_column_database_name(long paramLong, int paramInt);
  
  public static final native String sqlite3_column_decltype(long paramLong, int paramInt);
  
  public static final native double sqlite3_column_double(long paramLong, int paramInt);
  
  public static final native int sqlite3_column_int(long paramLong, int paramInt);
  
  public static final native long sqlite3_column_int64(long paramLong, int paramInt);
  
  public static final native String sqlite3_column_name(long paramLong, int paramInt);
  
  public static final native String sqlite3_column_origin_name(long paramLong, int paramInt);
  
  public static final native String sqlite3_column_table_name(long paramLong, int paramInt);
  
  public static final native int sqlite3_column_type(long paramLong, int paramInt);
  
  public static final native String sqlite3_compileoption_get(int paramInt);
  
  public static final native int sqlite3_compileoption_used(String paramString);
  
  public static final native int sqlite3_complete(String paramString);
  
  public static final native int sqlite3_data_count(long paramLong);
  
  public static final native long sqlite3_db_handle(long paramLong);
  
  public static final native int sqlite3_db_readonly(long paramLong, String paramString);
  
  public static final native int sqlite3_enable_load_extension(long paramLong, int paramInt);
  
  public static final native int sqlite3_enable_shared_cache(int paramInt);
  
  public static final native int sqlite3_errcode(long paramLong);
  
  public static final native String sqlite3_errmsg(long paramLong);
  
  public static final native int sqlite3_extended_errcode(long paramLong);
  
  public static final native int sqlite3_extended_result_codes(long paramLong, int paramInt);
  
  public static final native int sqlite3_finalize(long paramLong);
  
  public static final native int sqlite3_get_autocommit(long paramLong);
  
  public static final native int sqlite3_initialize();
  
  public static final native void sqlite3_interrupt(long paramLong);
  
  public static final native long sqlite3_last_insert_rowid(long paramLong);
  
  public static final native String sqlite3_libversion();
  
  public static final native int sqlite3_libversion_number();
  
  public static final native int sqlite3_limit(long paramLong, int paramInt1, int paramInt2);
  
  public static final native long sqlite3_memory_highwater(int paramInt);
  
  public static final native long sqlite3_memory_used();
  
  public static final native int sqlite3_release_memory(int paramInt);
  
  public static final native int sqlite3_reset(long paramLong);
  
  public static final native int sqlite3_shutdown();
  
  public static final native long sqlite3_soft_heap_limit64(long paramLong);
  
  public static final native String sqlite3_sourceid();
  
  public static final native int sqlite3_step(long paramLong);
  
  public static final native int sqlite3_stmt_readonly(long paramLong);
  
  public static final native int sqlite3_threadsafe();
  
  public static final native int sqlite3_total_changes(long paramLong);
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/almworks/sqlite4java/_SQLiteSwiggedJNI.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */