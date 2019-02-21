package com.almworks.sqlite4java;

class _SQLiteSwigged
{
  public static int sqlite3_backup_finish(SWIGTYPE_p_sqlite3_backup paramSWIGTYPE_p_sqlite3_backup)
  {
    return _SQLiteSwiggedJNI.sqlite3_backup_finish(SWIGTYPE_p_sqlite3_backup.getCPtr(paramSWIGTYPE_p_sqlite3_backup));
  }
  
  public static SWIGTYPE_p_sqlite3_backup sqlite3_backup_init(SWIGTYPE_p_sqlite3 paramSWIGTYPE_p_sqlite31, String paramString1, SWIGTYPE_p_sqlite3 paramSWIGTYPE_p_sqlite32, String paramString2)
  {
    long l = _SQLiteSwiggedJNI.sqlite3_backup_init(SWIGTYPE_p_sqlite3.getCPtr(paramSWIGTYPE_p_sqlite31), paramString1, SWIGTYPE_p_sqlite3.getCPtr(paramSWIGTYPE_p_sqlite32), paramString2);
    if (l == 0L) {
      return null;
    }
    return new SWIGTYPE_p_sqlite3_backup(l, false);
  }
  
  public static int sqlite3_backup_pagecount(SWIGTYPE_p_sqlite3_backup paramSWIGTYPE_p_sqlite3_backup)
  {
    return _SQLiteSwiggedJNI.sqlite3_backup_pagecount(SWIGTYPE_p_sqlite3_backup.getCPtr(paramSWIGTYPE_p_sqlite3_backup));
  }
  
  public static int sqlite3_backup_remaining(SWIGTYPE_p_sqlite3_backup paramSWIGTYPE_p_sqlite3_backup)
  {
    return _SQLiteSwiggedJNI.sqlite3_backup_remaining(SWIGTYPE_p_sqlite3_backup.getCPtr(paramSWIGTYPE_p_sqlite3_backup));
  }
  
  public static int sqlite3_backup_step(SWIGTYPE_p_sqlite3_backup paramSWIGTYPE_p_sqlite3_backup, int paramInt)
  {
    return _SQLiteSwiggedJNI.sqlite3_backup_step(SWIGTYPE_p_sqlite3_backup.getCPtr(paramSWIGTYPE_p_sqlite3_backup), paramInt);
  }
  
  public static int sqlite3_bind_double(SWIGTYPE_p_sqlite3_stmt paramSWIGTYPE_p_sqlite3_stmt, int paramInt, double paramDouble)
  {
    return _SQLiteSwiggedJNI.sqlite3_bind_double(SWIGTYPE_p_sqlite3_stmt.getCPtr(paramSWIGTYPE_p_sqlite3_stmt), paramInt, paramDouble);
  }
  
  public static int sqlite3_bind_int(SWIGTYPE_p_sqlite3_stmt paramSWIGTYPE_p_sqlite3_stmt, int paramInt1, int paramInt2)
  {
    return _SQLiteSwiggedJNI.sqlite3_bind_int(SWIGTYPE_p_sqlite3_stmt.getCPtr(paramSWIGTYPE_p_sqlite3_stmt), paramInt1, paramInt2);
  }
  
  public static int sqlite3_bind_int64(SWIGTYPE_p_sqlite3_stmt paramSWIGTYPE_p_sqlite3_stmt, int paramInt, long paramLong)
  {
    return _SQLiteSwiggedJNI.sqlite3_bind_int64(SWIGTYPE_p_sqlite3_stmt.getCPtr(paramSWIGTYPE_p_sqlite3_stmt), paramInt, paramLong);
  }
  
  public static int sqlite3_bind_null(SWIGTYPE_p_sqlite3_stmt paramSWIGTYPE_p_sqlite3_stmt, int paramInt)
  {
    return _SQLiteSwiggedJNI.sqlite3_bind_null(SWIGTYPE_p_sqlite3_stmt.getCPtr(paramSWIGTYPE_p_sqlite3_stmt), paramInt);
  }
  
  public static int sqlite3_bind_parameter_count(SWIGTYPE_p_sqlite3_stmt paramSWIGTYPE_p_sqlite3_stmt)
  {
    return _SQLiteSwiggedJNI.sqlite3_bind_parameter_count(SWIGTYPE_p_sqlite3_stmt.getCPtr(paramSWIGTYPE_p_sqlite3_stmt));
  }
  
  public static int sqlite3_bind_parameter_index(SWIGTYPE_p_sqlite3_stmt paramSWIGTYPE_p_sqlite3_stmt, String paramString)
  {
    return _SQLiteSwiggedJNI.sqlite3_bind_parameter_index(SWIGTYPE_p_sqlite3_stmt.getCPtr(paramSWIGTYPE_p_sqlite3_stmt), paramString);
  }
  
  public static String sqlite3_bind_parameter_name(SWIGTYPE_p_sqlite3_stmt paramSWIGTYPE_p_sqlite3_stmt, int paramInt)
  {
    return _SQLiteSwiggedJNI.sqlite3_bind_parameter_name(SWIGTYPE_p_sqlite3_stmt.getCPtr(paramSWIGTYPE_p_sqlite3_stmt), paramInt);
  }
  
  public static int sqlite3_bind_zeroblob(SWIGTYPE_p_sqlite3_stmt paramSWIGTYPE_p_sqlite3_stmt, int paramInt1, int paramInt2)
  {
    return _SQLiteSwiggedJNI.sqlite3_bind_zeroblob(SWIGTYPE_p_sqlite3_stmt.getCPtr(paramSWIGTYPE_p_sqlite3_stmt), paramInt1, paramInt2);
  }
  
  public static int sqlite3_blob_bytes(SWIGTYPE_p_sqlite3_blob paramSWIGTYPE_p_sqlite3_blob)
  {
    return _SQLiteSwiggedJNI.sqlite3_blob_bytes(SWIGTYPE_p_sqlite3_blob.getCPtr(paramSWIGTYPE_p_sqlite3_blob));
  }
  
  public static int sqlite3_blob_close(SWIGTYPE_p_sqlite3_blob paramSWIGTYPE_p_sqlite3_blob)
  {
    return _SQLiteSwiggedJNI.sqlite3_blob_close(SWIGTYPE_p_sqlite3_blob.getCPtr(paramSWIGTYPE_p_sqlite3_blob));
  }
  
  public static int sqlite3_blob_reopen(SWIGTYPE_p_sqlite3_blob paramSWIGTYPE_p_sqlite3_blob, long paramLong)
  {
    return _SQLiteSwiggedJNI.sqlite3_blob_reopen(SWIGTYPE_p_sqlite3_blob.getCPtr(paramSWIGTYPE_p_sqlite3_blob), paramLong);
  }
  
  public static int sqlite3_busy_timeout(SWIGTYPE_p_sqlite3 paramSWIGTYPE_p_sqlite3, int paramInt)
  {
    return _SQLiteSwiggedJNI.sqlite3_busy_timeout(SWIGTYPE_p_sqlite3.getCPtr(paramSWIGTYPE_p_sqlite3), paramInt);
  }
  
  public static int sqlite3_changes(SWIGTYPE_p_sqlite3 paramSWIGTYPE_p_sqlite3)
  {
    return _SQLiteSwiggedJNI.sqlite3_changes(SWIGTYPE_p_sqlite3.getCPtr(paramSWIGTYPE_p_sqlite3));
  }
  
  public static int sqlite3_clear_bindings(SWIGTYPE_p_sqlite3_stmt paramSWIGTYPE_p_sqlite3_stmt)
  {
    return _SQLiteSwiggedJNI.sqlite3_clear_bindings(SWIGTYPE_p_sqlite3_stmt.getCPtr(paramSWIGTYPE_p_sqlite3_stmt));
  }
  
  public static int sqlite3_close(SWIGTYPE_p_sqlite3 paramSWIGTYPE_p_sqlite3)
  {
    return _SQLiteSwiggedJNI.sqlite3_close(SWIGTYPE_p_sqlite3.getCPtr(paramSWIGTYPE_p_sqlite3));
  }
  
  public static int sqlite3_column_count(SWIGTYPE_p_sqlite3_stmt paramSWIGTYPE_p_sqlite3_stmt)
  {
    return _SQLiteSwiggedJNI.sqlite3_column_count(SWIGTYPE_p_sqlite3_stmt.getCPtr(paramSWIGTYPE_p_sqlite3_stmt));
  }
  
  public static String sqlite3_column_database_name(SWIGTYPE_p_sqlite3_stmt paramSWIGTYPE_p_sqlite3_stmt, int paramInt)
  {
    return _SQLiteSwiggedJNI.sqlite3_column_database_name(SWIGTYPE_p_sqlite3_stmt.getCPtr(paramSWIGTYPE_p_sqlite3_stmt), paramInt);
  }
  
  public static String sqlite3_column_decltype(SWIGTYPE_p_sqlite3_stmt paramSWIGTYPE_p_sqlite3_stmt, int paramInt)
  {
    return _SQLiteSwiggedJNI.sqlite3_column_decltype(SWIGTYPE_p_sqlite3_stmt.getCPtr(paramSWIGTYPE_p_sqlite3_stmt), paramInt);
  }
  
  public static double sqlite3_column_double(SWIGTYPE_p_sqlite3_stmt paramSWIGTYPE_p_sqlite3_stmt, int paramInt)
  {
    return _SQLiteSwiggedJNI.sqlite3_column_double(SWIGTYPE_p_sqlite3_stmt.getCPtr(paramSWIGTYPE_p_sqlite3_stmt), paramInt);
  }
  
  public static int sqlite3_column_int(SWIGTYPE_p_sqlite3_stmt paramSWIGTYPE_p_sqlite3_stmt, int paramInt)
  {
    return _SQLiteSwiggedJNI.sqlite3_column_int(SWIGTYPE_p_sqlite3_stmt.getCPtr(paramSWIGTYPE_p_sqlite3_stmt), paramInt);
  }
  
  public static long sqlite3_column_int64(SWIGTYPE_p_sqlite3_stmt paramSWIGTYPE_p_sqlite3_stmt, int paramInt)
  {
    return _SQLiteSwiggedJNI.sqlite3_column_int64(SWIGTYPE_p_sqlite3_stmt.getCPtr(paramSWIGTYPE_p_sqlite3_stmt), paramInt);
  }
  
  public static String sqlite3_column_name(SWIGTYPE_p_sqlite3_stmt paramSWIGTYPE_p_sqlite3_stmt, int paramInt)
  {
    return _SQLiteSwiggedJNI.sqlite3_column_name(SWIGTYPE_p_sqlite3_stmt.getCPtr(paramSWIGTYPE_p_sqlite3_stmt), paramInt);
  }
  
  public static String sqlite3_column_origin_name(SWIGTYPE_p_sqlite3_stmt paramSWIGTYPE_p_sqlite3_stmt, int paramInt)
  {
    return _SQLiteSwiggedJNI.sqlite3_column_origin_name(SWIGTYPE_p_sqlite3_stmt.getCPtr(paramSWIGTYPE_p_sqlite3_stmt), paramInt);
  }
  
  public static String sqlite3_column_table_name(SWIGTYPE_p_sqlite3_stmt paramSWIGTYPE_p_sqlite3_stmt, int paramInt)
  {
    return _SQLiteSwiggedJNI.sqlite3_column_table_name(SWIGTYPE_p_sqlite3_stmt.getCPtr(paramSWIGTYPE_p_sqlite3_stmt), paramInt);
  }
  
  public static int sqlite3_column_type(SWIGTYPE_p_sqlite3_stmt paramSWIGTYPE_p_sqlite3_stmt, int paramInt)
  {
    return _SQLiteSwiggedJNI.sqlite3_column_type(SWIGTYPE_p_sqlite3_stmt.getCPtr(paramSWIGTYPE_p_sqlite3_stmt), paramInt);
  }
  
  public static String sqlite3_compileoption_get(int paramInt)
  {
    return _SQLiteSwiggedJNI.sqlite3_compileoption_get(paramInt);
  }
  
  public static int sqlite3_compileoption_used(String paramString)
  {
    return _SQLiteSwiggedJNI.sqlite3_compileoption_used(paramString);
  }
  
  public static int sqlite3_complete(String paramString)
  {
    return _SQLiteSwiggedJNI.sqlite3_complete(paramString);
  }
  
  public static int sqlite3_data_count(SWIGTYPE_p_sqlite3_stmt paramSWIGTYPE_p_sqlite3_stmt)
  {
    return _SQLiteSwiggedJNI.sqlite3_data_count(SWIGTYPE_p_sqlite3_stmt.getCPtr(paramSWIGTYPE_p_sqlite3_stmt));
  }
  
  public static SWIGTYPE_p_sqlite3 sqlite3_db_handle(SWIGTYPE_p_sqlite3_stmt paramSWIGTYPE_p_sqlite3_stmt)
  {
    long l = _SQLiteSwiggedJNI.sqlite3_db_handle(SWIGTYPE_p_sqlite3_stmt.getCPtr(paramSWIGTYPE_p_sqlite3_stmt));
    if (l == 0L) {
      return null;
    }
    return new SWIGTYPE_p_sqlite3(l, false);
  }
  
  public static int sqlite3_db_readonly(SWIGTYPE_p_sqlite3 paramSWIGTYPE_p_sqlite3, String paramString)
  {
    return _SQLiteSwiggedJNI.sqlite3_db_readonly(SWIGTYPE_p_sqlite3.getCPtr(paramSWIGTYPE_p_sqlite3), paramString);
  }
  
  public static int sqlite3_enable_load_extension(SWIGTYPE_p_sqlite3 paramSWIGTYPE_p_sqlite3, int paramInt)
  {
    return _SQLiteSwiggedJNI.sqlite3_enable_load_extension(SWIGTYPE_p_sqlite3.getCPtr(paramSWIGTYPE_p_sqlite3), paramInt);
  }
  
  public static int sqlite3_enable_shared_cache(int paramInt)
  {
    return _SQLiteSwiggedJNI.sqlite3_enable_shared_cache(paramInt);
  }
  
  public static int sqlite3_errcode(SWIGTYPE_p_sqlite3 paramSWIGTYPE_p_sqlite3)
  {
    return _SQLiteSwiggedJNI.sqlite3_errcode(SWIGTYPE_p_sqlite3.getCPtr(paramSWIGTYPE_p_sqlite3));
  }
  
  public static String sqlite3_errmsg(SWIGTYPE_p_sqlite3 paramSWIGTYPE_p_sqlite3)
  {
    return _SQLiteSwiggedJNI.sqlite3_errmsg(SWIGTYPE_p_sqlite3.getCPtr(paramSWIGTYPE_p_sqlite3));
  }
  
  public static int sqlite3_extended_errcode(SWIGTYPE_p_sqlite3 paramSWIGTYPE_p_sqlite3)
  {
    return _SQLiteSwiggedJNI.sqlite3_extended_errcode(SWIGTYPE_p_sqlite3.getCPtr(paramSWIGTYPE_p_sqlite3));
  }
  
  public static int sqlite3_extended_result_codes(SWIGTYPE_p_sqlite3 paramSWIGTYPE_p_sqlite3, int paramInt)
  {
    return _SQLiteSwiggedJNI.sqlite3_extended_result_codes(SWIGTYPE_p_sqlite3.getCPtr(paramSWIGTYPE_p_sqlite3), paramInt);
  }
  
  public static int sqlite3_finalize(SWIGTYPE_p_sqlite3_stmt paramSWIGTYPE_p_sqlite3_stmt)
  {
    return _SQLiteSwiggedJNI.sqlite3_finalize(SWIGTYPE_p_sqlite3_stmt.getCPtr(paramSWIGTYPE_p_sqlite3_stmt));
  }
  
  public static int sqlite3_get_autocommit(SWIGTYPE_p_sqlite3 paramSWIGTYPE_p_sqlite3)
  {
    return _SQLiteSwiggedJNI.sqlite3_get_autocommit(SWIGTYPE_p_sqlite3.getCPtr(paramSWIGTYPE_p_sqlite3));
  }
  
  public static int sqlite3_initialize()
  {
    return _SQLiteSwiggedJNI.sqlite3_initialize();
  }
  
  public static void sqlite3_interrupt(SWIGTYPE_p_sqlite3 paramSWIGTYPE_p_sqlite3)
  {
    _SQLiteSwiggedJNI.sqlite3_interrupt(SWIGTYPE_p_sqlite3.getCPtr(paramSWIGTYPE_p_sqlite3));
  }
  
  public static long sqlite3_last_insert_rowid(SWIGTYPE_p_sqlite3 paramSWIGTYPE_p_sqlite3)
  {
    return _SQLiteSwiggedJNI.sqlite3_last_insert_rowid(SWIGTYPE_p_sqlite3.getCPtr(paramSWIGTYPE_p_sqlite3));
  }
  
  public static String sqlite3_libversion()
  {
    return _SQLiteSwiggedJNI.sqlite3_libversion();
  }
  
  public static int sqlite3_libversion_number()
  {
    return _SQLiteSwiggedJNI.sqlite3_libversion_number();
  }
  
  public static int sqlite3_limit(SWIGTYPE_p_sqlite3 paramSWIGTYPE_p_sqlite3, int paramInt1, int paramInt2)
  {
    return _SQLiteSwiggedJNI.sqlite3_limit(SWIGTYPE_p_sqlite3.getCPtr(paramSWIGTYPE_p_sqlite3), paramInt1, paramInt2);
  }
  
  public static long sqlite3_memory_highwater(int paramInt)
  {
    return _SQLiteSwiggedJNI.sqlite3_memory_highwater(paramInt);
  }
  
  public static long sqlite3_memory_used()
  {
    return _SQLiteSwiggedJNI.sqlite3_memory_used();
  }
  
  public static int sqlite3_release_memory(int paramInt)
  {
    return _SQLiteSwiggedJNI.sqlite3_release_memory(paramInt);
  }
  
  public static int sqlite3_reset(SWIGTYPE_p_sqlite3_stmt paramSWIGTYPE_p_sqlite3_stmt)
  {
    return _SQLiteSwiggedJNI.sqlite3_reset(SWIGTYPE_p_sqlite3_stmt.getCPtr(paramSWIGTYPE_p_sqlite3_stmt));
  }
  
  public static int sqlite3_shutdown()
  {
    return _SQLiteSwiggedJNI.sqlite3_shutdown();
  }
  
  public static long sqlite3_soft_heap_limit64(long paramLong)
  {
    return _SQLiteSwiggedJNI.sqlite3_soft_heap_limit64(paramLong);
  }
  
  public static String sqlite3_sourceid()
  {
    return _SQLiteSwiggedJNI.sqlite3_sourceid();
  }
  
  public static int sqlite3_step(SWIGTYPE_p_sqlite3_stmt paramSWIGTYPE_p_sqlite3_stmt)
  {
    return _SQLiteSwiggedJNI.sqlite3_step(SWIGTYPE_p_sqlite3_stmt.getCPtr(paramSWIGTYPE_p_sqlite3_stmt));
  }
  
  public static int sqlite3_stmt_readonly(SWIGTYPE_p_sqlite3_stmt paramSWIGTYPE_p_sqlite3_stmt)
  {
    return _SQLiteSwiggedJNI.sqlite3_stmt_readonly(SWIGTYPE_p_sqlite3_stmt.getCPtr(paramSWIGTYPE_p_sqlite3_stmt));
  }
  
  public static int sqlite3_threadsafe()
  {
    return _SQLiteSwiggedJNI.sqlite3_threadsafe();
  }
  
  public static int sqlite3_total_changes(SWIGTYPE_p_sqlite3 paramSWIGTYPE_p_sqlite3)
  {
    return _SQLiteSwiggedJNI.sqlite3_total_changes(SWIGTYPE_p_sqlite3.getCPtr(paramSWIGTYPE_p_sqlite3));
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/almworks/sqlite4java/_SQLiteSwigged.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */