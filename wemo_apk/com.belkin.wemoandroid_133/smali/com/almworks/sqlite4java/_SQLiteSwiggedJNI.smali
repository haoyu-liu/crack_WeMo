.class Lcom/almworks/sqlite4java/_SQLiteSwiggedJNI;
.super Ljava/lang/Object;
.source "_SQLiteSwiggedJNI.java"


# direct methods
.method constructor <init>()V
    .locals 0

    .prologue
    .line 11
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static final native sqlite3_backup_finish(J)I
.end method

.method public static final native sqlite3_backup_init(JLjava/lang/String;JLjava/lang/String;)J
.end method

.method public static final native sqlite3_backup_pagecount(J)I
.end method

.method public static final native sqlite3_backup_remaining(J)I
.end method

.method public static final native sqlite3_backup_step(JI)I
.end method

.method public static final native sqlite3_bind_double(JID)I
.end method

.method public static final native sqlite3_bind_int(JII)I
.end method

.method public static final native sqlite3_bind_int64(JIJ)I
.end method

.method public static final native sqlite3_bind_null(JI)I
.end method

.method public static final native sqlite3_bind_parameter_count(J)I
.end method

.method public static final native sqlite3_bind_parameter_index(JLjava/lang/String;)I
.end method

.method public static final native sqlite3_bind_parameter_name(JI)Ljava/lang/String;
.end method

.method public static final native sqlite3_bind_zeroblob(JII)I
.end method

.method public static final native sqlite3_blob_bytes(J)I
.end method

.method public static final native sqlite3_blob_close(J)I
.end method

.method public static final native sqlite3_blob_reopen(JJ)I
.end method

.method public static final native sqlite3_busy_timeout(JI)I
.end method

.method public static final native sqlite3_changes(J)I
.end method

.method public static final native sqlite3_clear_bindings(J)I
.end method

.method public static final native sqlite3_close(J)I
.end method

.method public static final native sqlite3_column_count(J)I
.end method

.method public static final native sqlite3_column_database_name(JI)Ljava/lang/String;
.end method

.method public static final native sqlite3_column_decltype(JI)Ljava/lang/String;
.end method

.method public static final native sqlite3_column_double(JI)D
.end method

.method public static final native sqlite3_column_int(JI)I
.end method

.method public static final native sqlite3_column_int64(JI)J
.end method

.method public static final native sqlite3_column_name(JI)Ljava/lang/String;
.end method

.method public static final native sqlite3_column_origin_name(JI)Ljava/lang/String;
.end method

.method public static final native sqlite3_column_table_name(JI)Ljava/lang/String;
.end method

.method public static final native sqlite3_column_type(JI)I
.end method

.method public static final native sqlite3_compileoption_get(I)Ljava/lang/String;
.end method

.method public static final native sqlite3_compileoption_used(Ljava/lang/String;)I
.end method

.method public static final native sqlite3_complete(Ljava/lang/String;)I
.end method

.method public static final native sqlite3_data_count(J)I
.end method

.method public static final native sqlite3_db_handle(J)J
.end method

.method public static final native sqlite3_db_readonly(JLjava/lang/String;)I
.end method

.method public static final native sqlite3_enable_load_extension(JI)I
.end method

.method public static final native sqlite3_enable_shared_cache(I)I
.end method

.method public static final native sqlite3_errcode(J)I
.end method

.method public static final native sqlite3_errmsg(J)Ljava/lang/String;
.end method

.method public static final native sqlite3_extended_errcode(J)I
.end method

.method public static final native sqlite3_extended_result_codes(JI)I
.end method

.method public static final native sqlite3_finalize(J)I
.end method

.method public static final native sqlite3_get_autocommit(J)I
.end method

.method public static final native sqlite3_initialize()I
.end method

.method public static final native sqlite3_interrupt(J)V
.end method

.method public static final native sqlite3_last_insert_rowid(J)J
.end method

.method public static final native sqlite3_libversion()Ljava/lang/String;
.end method

.method public static final native sqlite3_libversion_number()I
.end method

.method public static final native sqlite3_limit(JII)I
.end method

.method public static final native sqlite3_memory_highwater(I)J
.end method

.method public static final native sqlite3_memory_used()J
.end method

.method public static final native sqlite3_release_memory(I)I
.end method

.method public static final native sqlite3_reset(J)I
.end method

.method public static final native sqlite3_shutdown()I
.end method

.method public static final native sqlite3_soft_heap_limit64(J)J
.end method

.method public static final native sqlite3_sourceid()Ljava/lang/String;
.end method

.method public static final native sqlite3_step(J)I
.end method

.method public static final native sqlite3_stmt_readonly(J)I
.end method

.method public static final native sqlite3_threadsafe()I
.end method

.method public static final native sqlite3_total_changes(J)I
.end method
