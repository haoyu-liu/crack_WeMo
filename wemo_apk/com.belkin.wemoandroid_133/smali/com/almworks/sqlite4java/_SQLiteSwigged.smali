.class Lcom/almworks/sqlite4java/_SQLiteSwigged;
.super Ljava/lang/Object;
.source "_SQLiteSwigged.java"


# direct methods
.method constructor <init>()V
    .locals 0

    .prologue
    .line 11
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static sqlite3_backup_finish(Lcom/almworks/sqlite4java/SWIGTYPE_p_sqlite3_backup;)I
    .locals 2
    .param p0, "p"    # Lcom/almworks/sqlite4java/SWIGTYPE_p_sqlite3_backup;

    .prologue
    .line 239
    invoke-static {p0}, Lcom/almworks/sqlite4java/SWIGTYPE_p_sqlite3_backup;->getCPtr(Lcom/almworks/sqlite4java/SWIGTYPE_p_sqlite3_backup;)J

    move-result-wide v0

    invoke-static {v0, v1}, Lcom/almworks/sqlite4java/_SQLiteSwiggedJNI;->sqlite3_backup_finish(J)I

    move-result v0

    return v0
.end method

.method public static sqlite3_backup_init(Lcom/almworks/sqlite4java/SWIGTYPE_p_sqlite3;Ljava/lang/String;Lcom/almworks/sqlite4java/SWIGTYPE_p_sqlite3;Ljava/lang/String;)Lcom/almworks/sqlite4java/SWIGTYPE_p_sqlite3_backup;
    .locals 8
    .param p0, "arg0"    # Lcom/almworks/sqlite4java/SWIGTYPE_p_sqlite3;
    .param p1, "arg1"    # Ljava/lang/String;
    .param p2, "arg2"    # Lcom/almworks/sqlite4java/SWIGTYPE_p_sqlite3;
    .param p3, "arg3"    # Ljava/lang/String;

    .prologue
    .line 230
    invoke-static {p0}, Lcom/almworks/sqlite4java/SWIGTYPE_p_sqlite3;->getCPtr(Lcom/almworks/sqlite4java/SWIGTYPE_p_sqlite3;)J

    move-result-wide v0

    invoke-static {p2}, Lcom/almworks/sqlite4java/SWIGTYPE_p_sqlite3;->getCPtr(Lcom/almworks/sqlite4java/SWIGTYPE_p_sqlite3;)J

    move-result-wide v3

    move-object v2, p1

    move-object v5, p3

    invoke-static/range {v0 .. v5}, Lcom/almworks/sqlite4java/_SQLiteSwiggedJNI;->sqlite3_backup_init(JLjava/lang/String;JLjava/lang/String;)J

    move-result-wide v6

    .line 231
    .local v6, "cPtr":J
    const-wide/16 v0, 0x0

    cmp-long v0, v6, v0

    if-nez v0, :cond_0

    const/4 v0, 0x0

    :goto_0
    return-object v0

    :cond_0
    new-instance v0, Lcom/almworks/sqlite4java/SWIGTYPE_p_sqlite3_backup;

    const/4 v1, 0x0

    invoke-direct {v0, v6, v7, v1}, Lcom/almworks/sqlite4java/SWIGTYPE_p_sqlite3_backup;-><init>(JZ)V

    goto :goto_0
.end method

.method public static sqlite3_backup_pagecount(Lcom/almworks/sqlite4java/SWIGTYPE_p_sqlite3_backup;)I
    .locals 2
    .param p0, "p"    # Lcom/almworks/sqlite4java/SWIGTYPE_p_sqlite3_backup;

    .prologue
    .line 247
    invoke-static {p0}, Lcom/almworks/sqlite4java/SWIGTYPE_p_sqlite3_backup;->getCPtr(Lcom/almworks/sqlite4java/SWIGTYPE_p_sqlite3_backup;)J

    move-result-wide v0

    invoke-static {v0, v1}, Lcom/almworks/sqlite4java/_SQLiteSwiggedJNI;->sqlite3_backup_pagecount(J)I

    move-result v0

    return v0
.end method

.method public static sqlite3_backup_remaining(Lcom/almworks/sqlite4java/SWIGTYPE_p_sqlite3_backup;)I
    .locals 2
    .param p0, "p"    # Lcom/almworks/sqlite4java/SWIGTYPE_p_sqlite3_backup;

    .prologue
    .line 243
    invoke-static {p0}, Lcom/almworks/sqlite4java/SWIGTYPE_p_sqlite3_backup;->getCPtr(Lcom/almworks/sqlite4java/SWIGTYPE_p_sqlite3_backup;)J

    move-result-wide v0

    invoke-static {v0, v1}, Lcom/almworks/sqlite4java/_SQLiteSwiggedJNI;->sqlite3_backup_remaining(J)I

    move-result v0

    return v0
.end method

.method public static sqlite3_backup_step(Lcom/almworks/sqlite4java/SWIGTYPE_p_sqlite3_backup;I)I
    .locals 2
    .param p0, "p"    # Lcom/almworks/sqlite4java/SWIGTYPE_p_sqlite3_backup;
    .param p1, "nPage"    # I

    .prologue
    .line 235
    invoke-static {p0}, Lcom/almworks/sqlite4java/SWIGTYPE_p_sqlite3_backup;->getCPtr(Lcom/almworks/sqlite4java/SWIGTYPE_p_sqlite3_backup;)J

    move-result-wide v0

    invoke-static {v0, v1, p1}, Lcom/almworks/sqlite4java/_SQLiteSwiggedJNI;->sqlite3_backup_step(JI)I

    move-result v0

    return v0
.end method

.method public static sqlite3_bind_double(Lcom/almworks/sqlite4java/SWIGTYPE_p_sqlite3_stmt;ID)I
    .locals 2
    .param p0, "arg0"    # Lcom/almworks/sqlite4java/SWIGTYPE_p_sqlite3_stmt;
    .param p1, "arg1"    # I
    .param p2, "arg2"    # D

    .prologue
    .line 97
    invoke-static {p0}, Lcom/almworks/sqlite4java/SWIGTYPE_p_sqlite3_stmt;->getCPtr(Lcom/almworks/sqlite4java/SWIGTYPE_p_sqlite3_stmt;)J

    move-result-wide v0

    invoke-static {v0, v1, p1, p2, p3}, Lcom/almworks/sqlite4java/_SQLiteSwiggedJNI;->sqlite3_bind_double(JID)I

    move-result v0

    return v0
.end method

.method public static sqlite3_bind_int(Lcom/almworks/sqlite4java/SWIGTYPE_p_sqlite3_stmt;II)I
    .locals 2
    .param p0, "arg0"    # Lcom/almworks/sqlite4java/SWIGTYPE_p_sqlite3_stmt;
    .param p1, "arg1"    # I
    .param p2, "arg2"    # I

    .prologue
    .line 101
    invoke-static {p0}, Lcom/almworks/sqlite4java/SWIGTYPE_p_sqlite3_stmt;->getCPtr(Lcom/almworks/sqlite4java/SWIGTYPE_p_sqlite3_stmt;)J

    move-result-wide v0

    invoke-static {v0, v1, p1, p2}, Lcom/almworks/sqlite4java/_SQLiteSwiggedJNI;->sqlite3_bind_int(JII)I

    move-result v0

    return v0
.end method

.method public static sqlite3_bind_int64(Lcom/almworks/sqlite4java/SWIGTYPE_p_sqlite3_stmt;IJ)I
    .locals 2
    .param p0, "arg0"    # Lcom/almworks/sqlite4java/SWIGTYPE_p_sqlite3_stmt;
    .param p1, "arg1"    # I
    .param p2, "arg2"    # J

    .prologue
    .line 105
    invoke-static {p0}, Lcom/almworks/sqlite4java/SWIGTYPE_p_sqlite3_stmt;->getCPtr(Lcom/almworks/sqlite4java/SWIGTYPE_p_sqlite3_stmt;)J

    move-result-wide v0

    invoke-static {v0, v1, p1, p2, p3}, Lcom/almworks/sqlite4java/_SQLiteSwiggedJNI;->sqlite3_bind_int64(JIJ)I

    move-result v0

    return v0
.end method

.method public static sqlite3_bind_null(Lcom/almworks/sqlite4java/SWIGTYPE_p_sqlite3_stmt;I)I
    .locals 2
    .param p0, "arg0"    # Lcom/almworks/sqlite4java/SWIGTYPE_p_sqlite3_stmt;
    .param p1, "arg1"    # I

    .prologue
    .line 109
    invoke-static {p0}, Lcom/almworks/sqlite4java/SWIGTYPE_p_sqlite3_stmt;->getCPtr(Lcom/almworks/sqlite4java/SWIGTYPE_p_sqlite3_stmt;)J

    move-result-wide v0

    invoke-static {v0, v1, p1}, Lcom/almworks/sqlite4java/_SQLiteSwiggedJNI;->sqlite3_bind_null(JI)I

    move-result v0

    return v0
.end method

.method public static sqlite3_bind_parameter_count(Lcom/almworks/sqlite4java/SWIGTYPE_p_sqlite3_stmt;)I
    .locals 2
    .param p0, "arg0"    # Lcom/almworks/sqlite4java/SWIGTYPE_p_sqlite3_stmt;

    .prologue
    .line 117
    invoke-static {p0}, Lcom/almworks/sqlite4java/SWIGTYPE_p_sqlite3_stmt;->getCPtr(Lcom/almworks/sqlite4java/SWIGTYPE_p_sqlite3_stmt;)J

    move-result-wide v0

    invoke-static {v0, v1}, Lcom/almworks/sqlite4java/_SQLiteSwiggedJNI;->sqlite3_bind_parameter_count(J)I

    move-result v0

    return v0
.end method

.method public static sqlite3_bind_parameter_index(Lcom/almworks/sqlite4java/SWIGTYPE_p_sqlite3_stmt;Ljava/lang/String;)I
    .locals 2
    .param p0, "arg0"    # Lcom/almworks/sqlite4java/SWIGTYPE_p_sqlite3_stmt;
    .param p1, "zName"    # Ljava/lang/String;

    .prologue
    .line 125
    invoke-static {p0}, Lcom/almworks/sqlite4java/SWIGTYPE_p_sqlite3_stmt;->getCPtr(Lcom/almworks/sqlite4java/SWIGTYPE_p_sqlite3_stmt;)J

    move-result-wide v0

    invoke-static {v0, v1, p1}, Lcom/almworks/sqlite4java/_SQLiteSwiggedJNI;->sqlite3_bind_parameter_index(JLjava/lang/String;)I

    move-result v0

    return v0
.end method

.method public static sqlite3_bind_parameter_name(Lcom/almworks/sqlite4java/SWIGTYPE_p_sqlite3_stmt;I)Ljava/lang/String;
    .locals 2
    .param p0, "arg0"    # Lcom/almworks/sqlite4java/SWIGTYPE_p_sqlite3_stmt;
    .param p1, "arg1"    # I

    .prologue
    .line 121
    invoke-static {p0}, Lcom/almworks/sqlite4java/SWIGTYPE_p_sqlite3_stmt;->getCPtr(Lcom/almworks/sqlite4java/SWIGTYPE_p_sqlite3_stmt;)J

    move-result-wide v0

    invoke-static {v0, v1, p1}, Lcom/almworks/sqlite4java/_SQLiteSwiggedJNI;->sqlite3_bind_parameter_name(JI)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static sqlite3_bind_zeroblob(Lcom/almworks/sqlite4java/SWIGTYPE_p_sqlite3_stmt;II)I
    .locals 2
    .param p0, "arg0"    # Lcom/almworks/sqlite4java/SWIGTYPE_p_sqlite3_stmt;
    .param p1, "arg1"    # I
    .param p2, "n"    # I

    .prologue
    .line 113
    invoke-static {p0}, Lcom/almworks/sqlite4java/SWIGTYPE_p_sqlite3_stmt;->getCPtr(Lcom/almworks/sqlite4java/SWIGTYPE_p_sqlite3_stmt;)J

    move-result-wide v0

    invoke-static {v0, v1, p1, p2}, Lcom/almworks/sqlite4java/_SQLiteSwiggedJNI;->sqlite3_bind_zeroblob(JII)I

    move-result v0

    return v0
.end method

.method public static sqlite3_blob_bytes(Lcom/almworks/sqlite4java/SWIGTYPE_p_sqlite3_blob;)I
    .locals 2
    .param p0, "arg0"    # Lcom/almworks/sqlite4java/SWIGTYPE_p_sqlite3_blob;

    .prologue
    .line 214
    invoke-static {p0}, Lcom/almworks/sqlite4java/SWIGTYPE_p_sqlite3_blob;->getCPtr(Lcom/almworks/sqlite4java/SWIGTYPE_p_sqlite3_blob;)J

    move-result-wide v0

    invoke-static {v0, v1}, Lcom/almworks/sqlite4java/_SQLiteSwiggedJNI;->sqlite3_blob_bytes(J)I

    move-result v0

    return v0
.end method

.method public static sqlite3_blob_close(Lcom/almworks/sqlite4java/SWIGTYPE_p_sqlite3_blob;)I
    .locals 2
    .param p0, "arg0"    # Lcom/almworks/sqlite4java/SWIGTYPE_p_sqlite3_blob;

    .prologue
    .line 210
    invoke-static {p0}, Lcom/almworks/sqlite4java/SWIGTYPE_p_sqlite3_blob;->getCPtr(Lcom/almworks/sqlite4java/SWIGTYPE_p_sqlite3_blob;)J

    move-result-wide v0

    invoke-static {v0, v1}, Lcom/almworks/sqlite4java/_SQLiteSwiggedJNI;->sqlite3_blob_close(J)I

    move-result v0

    return v0
.end method

.method public static sqlite3_blob_reopen(Lcom/almworks/sqlite4java/SWIGTYPE_p_sqlite3_blob;J)I
    .locals 3
    .param p0, "arg0"    # Lcom/almworks/sqlite4java/SWIGTYPE_p_sqlite3_blob;
    .param p1, "arg1"    # J

    .prologue
    .line 222
    invoke-static {p0}, Lcom/almworks/sqlite4java/SWIGTYPE_p_sqlite3_blob;->getCPtr(Lcom/almworks/sqlite4java/SWIGTYPE_p_sqlite3_blob;)J

    move-result-wide v0

    invoke-static {v0, v1, p1, p2}, Lcom/almworks/sqlite4java/_SQLiteSwiggedJNI;->sqlite3_blob_reopen(JJ)I

    move-result v0

    return v0
.end method

.method public static sqlite3_busy_timeout(Lcom/almworks/sqlite4java/SWIGTYPE_p_sqlite3;I)I
    .locals 2
    .param p0, "arg0"    # Lcom/almworks/sqlite4java/SWIGTYPE_p_sqlite3;
    .param p1, "ms"    # I

    .prologue
    .line 77
    invoke-static {p0}, Lcom/almworks/sqlite4java/SWIGTYPE_p_sqlite3;->getCPtr(Lcom/almworks/sqlite4java/SWIGTYPE_p_sqlite3;)J

    move-result-wide v0

    invoke-static {v0, v1, p1}, Lcom/almworks/sqlite4java/_SQLiteSwiggedJNI;->sqlite3_busy_timeout(JI)I

    move-result v0

    return v0
.end method

.method public static sqlite3_changes(Lcom/almworks/sqlite4java/SWIGTYPE_p_sqlite3;)I
    .locals 2
    .param p0, "arg0"    # Lcom/almworks/sqlite4java/SWIGTYPE_p_sqlite3;

    .prologue
    .line 61
    invoke-static {p0}, Lcom/almworks/sqlite4java/SWIGTYPE_p_sqlite3;->getCPtr(Lcom/almworks/sqlite4java/SWIGTYPE_p_sqlite3;)J

    move-result-wide v0

    invoke-static {v0, v1}, Lcom/almworks/sqlite4java/_SQLiteSwiggedJNI;->sqlite3_changes(J)I

    move-result v0

    return v0
.end method

.method public static sqlite3_clear_bindings(Lcom/almworks/sqlite4java/SWIGTYPE_p_sqlite3_stmt;)I
    .locals 2
    .param p0, "arg0"    # Lcom/almworks/sqlite4java/SWIGTYPE_p_sqlite3_stmt;

    .prologue
    .line 129
    invoke-static {p0}, Lcom/almworks/sqlite4java/SWIGTYPE_p_sqlite3_stmt;->getCPtr(Lcom/almworks/sqlite4java/SWIGTYPE_p_sqlite3_stmt;)J

    move-result-wide v0

    invoke-static {v0, v1}, Lcom/almworks/sqlite4java/_SQLiteSwiggedJNI;->sqlite3_clear_bindings(J)I

    move-result v0

    return v0
.end method

.method public static sqlite3_close(Lcom/almworks/sqlite4java/SWIGTYPE_p_sqlite3;)I
    .locals 2
    .param p0, "arg0"    # Lcom/almworks/sqlite4java/SWIGTYPE_p_sqlite3;

    .prologue
    .line 49
    invoke-static {p0}, Lcom/almworks/sqlite4java/SWIGTYPE_p_sqlite3;->getCPtr(Lcom/almworks/sqlite4java/SWIGTYPE_p_sqlite3;)J

    move-result-wide v0

    invoke-static {v0, v1}, Lcom/almworks/sqlite4java/_SQLiteSwiggedJNI;->sqlite3_close(J)I

    move-result v0

    return v0
.end method

.method public static sqlite3_column_count(Lcom/almworks/sqlite4java/SWIGTYPE_p_sqlite3_stmt;)I
    .locals 2
    .param p0, "pStmt"    # Lcom/almworks/sqlite4java/SWIGTYPE_p_sqlite3_stmt;

    .prologue
    .line 133
    invoke-static {p0}, Lcom/almworks/sqlite4java/SWIGTYPE_p_sqlite3_stmt;->getCPtr(Lcom/almworks/sqlite4java/SWIGTYPE_p_sqlite3_stmt;)J

    move-result-wide v0

    invoke-static {v0, v1}, Lcom/almworks/sqlite4java/_SQLiteSwiggedJNI;->sqlite3_column_count(J)I

    move-result v0

    return v0
.end method

.method public static sqlite3_column_database_name(Lcom/almworks/sqlite4java/SWIGTYPE_p_sqlite3_stmt;I)Ljava/lang/String;
    .locals 2
    .param p0, "arg0"    # Lcom/almworks/sqlite4java/SWIGTYPE_p_sqlite3_stmt;
    .param p1, "arg1"    # I

    .prologue
    .line 141
    invoke-static {p0}, Lcom/almworks/sqlite4java/SWIGTYPE_p_sqlite3_stmt;->getCPtr(Lcom/almworks/sqlite4java/SWIGTYPE_p_sqlite3_stmt;)J

    move-result-wide v0

    invoke-static {v0, v1, p1}, Lcom/almworks/sqlite4java/_SQLiteSwiggedJNI;->sqlite3_column_database_name(JI)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static sqlite3_column_decltype(Lcom/almworks/sqlite4java/SWIGTYPE_p_sqlite3_stmt;I)Ljava/lang/String;
    .locals 2
    .param p0, "arg0"    # Lcom/almworks/sqlite4java/SWIGTYPE_p_sqlite3_stmt;
    .param p1, "i"    # I

    .prologue
    .line 153
    invoke-static {p0}, Lcom/almworks/sqlite4java/SWIGTYPE_p_sqlite3_stmt;->getCPtr(Lcom/almworks/sqlite4java/SWIGTYPE_p_sqlite3_stmt;)J

    move-result-wide v0

    invoke-static {v0, v1, p1}, Lcom/almworks/sqlite4java/_SQLiteSwiggedJNI;->sqlite3_column_decltype(JI)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static sqlite3_column_double(Lcom/almworks/sqlite4java/SWIGTYPE_p_sqlite3_stmt;I)D
    .locals 2
    .param p0, "arg0"    # Lcom/almworks/sqlite4java/SWIGTYPE_p_sqlite3_stmt;
    .param p1, "iCol"    # I

    .prologue
    .line 165
    invoke-static {p0}, Lcom/almworks/sqlite4java/SWIGTYPE_p_sqlite3_stmt;->getCPtr(Lcom/almworks/sqlite4java/SWIGTYPE_p_sqlite3_stmt;)J

    move-result-wide v0

    invoke-static {v0, v1, p1}, Lcom/almworks/sqlite4java/_SQLiteSwiggedJNI;->sqlite3_column_double(JI)D

    move-result-wide v0

    return-wide v0
.end method

.method public static sqlite3_column_int(Lcom/almworks/sqlite4java/SWIGTYPE_p_sqlite3_stmt;I)I
    .locals 2
    .param p0, "arg0"    # Lcom/almworks/sqlite4java/SWIGTYPE_p_sqlite3_stmt;
    .param p1, "iCol"    # I

    .prologue
    .line 169
    invoke-static {p0}, Lcom/almworks/sqlite4java/SWIGTYPE_p_sqlite3_stmt;->getCPtr(Lcom/almworks/sqlite4java/SWIGTYPE_p_sqlite3_stmt;)J

    move-result-wide v0

    invoke-static {v0, v1, p1}, Lcom/almworks/sqlite4java/_SQLiteSwiggedJNI;->sqlite3_column_int(JI)I

    move-result v0

    return v0
.end method

.method public static sqlite3_column_int64(Lcom/almworks/sqlite4java/SWIGTYPE_p_sqlite3_stmt;I)J
    .locals 2
    .param p0, "arg0"    # Lcom/almworks/sqlite4java/SWIGTYPE_p_sqlite3_stmt;
    .param p1, "iCol"    # I

    .prologue
    .line 173
    invoke-static {p0}, Lcom/almworks/sqlite4java/SWIGTYPE_p_sqlite3_stmt;->getCPtr(Lcom/almworks/sqlite4java/SWIGTYPE_p_sqlite3_stmt;)J

    move-result-wide v0

    invoke-static {v0, v1, p1}, Lcom/almworks/sqlite4java/_SQLiteSwiggedJNI;->sqlite3_column_int64(JI)J

    move-result-wide v0

    return-wide v0
.end method

.method public static sqlite3_column_name(Lcom/almworks/sqlite4java/SWIGTYPE_p_sqlite3_stmt;I)Ljava/lang/String;
    .locals 2
    .param p0, "arg0"    # Lcom/almworks/sqlite4java/SWIGTYPE_p_sqlite3_stmt;
    .param p1, "N"    # I

    .prologue
    .line 137
    invoke-static {p0}, Lcom/almworks/sqlite4java/SWIGTYPE_p_sqlite3_stmt;->getCPtr(Lcom/almworks/sqlite4java/SWIGTYPE_p_sqlite3_stmt;)J

    move-result-wide v0

    invoke-static {v0, v1, p1}, Lcom/almworks/sqlite4java/_SQLiteSwiggedJNI;->sqlite3_column_name(JI)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static sqlite3_column_origin_name(Lcom/almworks/sqlite4java/SWIGTYPE_p_sqlite3_stmt;I)Ljava/lang/String;
    .locals 2
    .param p0, "arg0"    # Lcom/almworks/sqlite4java/SWIGTYPE_p_sqlite3_stmt;
    .param p1, "arg1"    # I

    .prologue
    .line 149
    invoke-static {p0}, Lcom/almworks/sqlite4java/SWIGTYPE_p_sqlite3_stmt;->getCPtr(Lcom/almworks/sqlite4java/SWIGTYPE_p_sqlite3_stmt;)J

    move-result-wide v0

    invoke-static {v0, v1, p1}, Lcom/almworks/sqlite4java/_SQLiteSwiggedJNI;->sqlite3_column_origin_name(JI)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static sqlite3_column_table_name(Lcom/almworks/sqlite4java/SWIGTYPE_p_sqlite3_stmt;I)Ljava/lang/String;
    .locals 2
    .param p0, "arg0"    # Lcom/almworks/sqlite4java/SWIGTYPE_p_sqlite3_stmt;
    .param p1, "arg1"    # I

    .prologue
    .line 145
    invoke-static {p0}, Lcom/almworks/sqlite4java/SWIGTYPE_p_sqlite3_stmt;->getCPtr(Lcom/almworks/sqlite4java/SWIGTYPE_p_sqlite3_stmt;)J

    move-result-wide v0

    invoke-static {v0, v1, p1}, Lcom/almworks/sqlite4java/_SQLiteSwiggedJNI;->sqlite3_column_table_name(JI)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static sqlite3_column_type(Lcom/almworks/sqlite4java/SWIGTYPE_p_sqlite3_stmt;I)I
    .locals 2
    .param p0, "arg0"    # Lcom/almworks/sqlite4java/SWIGTYPE_p_sqlite3_stmt;
    .param p1, "iCol"    # I

    .prologue
    .line 177
    invoke-static {p0}, Lcom/almworks/sqlite4java/SWIGTYPE_p_sqlite3_stmt;->getCPtr(Lcom/almworks/sqlite4java/SWIGTYPE_p_sqlite3_stmt;)J

    move-result-wide v0

    invoke-static {v0, v1, p1}, Lcom/almworks/sqlite4java/_SQLiteSwiggedJNI;->sqlite3_column_type(JI)I

    move-result v0

    return v0
.end method

.method public static sqlite3_compileoption_get(I)Ljava/lang/String;
    .locals 1
    .param p0, "N"    # I

    .prologue
    .line 41
    invoke-static {p0}, Lcom/almworks/sqlite4java/_SQLiteSwiggedJNI;->sqlite3_compileoption_get(I)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static sqlite3_compileoption_used(Ljava/lang/String;)I
    .locals 1
    .param p0, "zOptName"    # Ljava/lang/String;

    .prologue
    .line 37
    invoke-static {p0}, Lcom/almworks/sqlite4java/_SQLiteSwiggedJNI;->sqlite3_compileoption_used(Ljava/lang/String;)I

    move-result v0

    return v0
.end method

.method public static sqlite3_complete(Ljava/lang/String;)I
    .locals 1
    .param p0, "sql"    # Ljava/lang/String;

    .prologue
    .line 73
    invoke-static {p0}, Lcom/almworks/sqlite4java/_SQLiteSwiggedJNI;->sqlite3_complete(Ljava/lang/String;)I

    move-result v0

    return v0
.end method

.method public static sqlite3_data_count(Lcom/almworks/sqlite4java/SWIGTYPE_p_sqlite3_stmt;)I
    .locals 2
    .param p0, "pStmt"    # Lcom/almworks/sqlite4java/SWIGTYPE_p_sqlite3_stmt;

    .prologue
    .line 161
    invoke-static {p0}, Lcom/almworks/sqlite4java/SWIGTYPE_p_sqlite3_stmt;->getCPtr(Lcom/almworks/sqlite4java/SWIGTYPE_p_sqlite3_stmt;)J

    move-result-wide v0

    invoke-static {v0, v1}, Lcom/almworks/sqlite4java/_SQLiteSwiggedJNI;->sqlite3_data_count(J)I

    move-result v0

    return v0
.end method

.method public static sqlite3_db_handle(Lcom/almworks/sqlite4java/SWIGTYPE_p_sqlite3_stmt;)Lcom/almworks/sqlite4java/SWIGTYPE_p_sqlite3;
    .locals 4
    .param p0, "arg0"    # Lcom/almworks/sqlite4java/SWIGTYPE_p_sqlite3_stmt;

    .prologue
    .line 193
    invoke-static {p0}, Lcom/almworks/sqlite4java/SWIGTYPE_p_sqlite3_stmt;->getCPtr(Lcom/almworks/sqlite4java/SWIGTYPE_p_sqlite3_stmt;)J

    move-result-wide v2

    invoke-static {v2, v3}, Lcom/almworks/sqlite4java/_SQLiteSwiggedJNI;->sqlite3_db_handle(J)J

    move-result-wide v0

    .line 194
    .local v0, "cPtr":J
    const-wide/16 v2, 0x0

    cmp-long v2, v0, v2

    if-nez v2, :cond_0

    const/4 v2, 0x0

    :goto_0
    return-object v2

    :cond_0
    new-instance v2, Lcom/almworks/sqlite4java/SWIGTYPE_p_sqlite3;

    const/4 v3, 0x0

    invoke-direct {v2, v0, v1, v3}, Lcom/almworks/sqlite4java/SWIGTYPE_p_sqlite3;-><init>(JZ)V

    goto :goto_0
.end method

.method public static sqlite3_db_readonly(Lcom/almworks/sqlite4java/SWIGTYPE_p_sqlite3;Ljava/lang/String;)I
    .locals 2
    .param p0, "db"    # Lcom/almworks/sqlite4java/SWIGTYPE_p_sqlite3;
    .param p1, "zDbName"    # Ljava/lang/String;

    .prologue
    .line 255
    invoke-static {p0}, Lcom/almworks/sqlite4java/SWIGTYPE_p_sqlite3;->getCPtr(Lcom/almworks/sqlite4java/SWIGTYPE_p_sqlite3;)J

    move-result-wide v0

    invoke-static {v0, v1, p1}, Lcom/almworks/sqlite4java/_SQLiteSwiggedJNI;->sqlite3_db_readonly(JLjava/lang/String;)I

    move-result v0

    return v0
.end method

.method public static sqlite3_enable_load_extension(Lcom/almworks/sqlite4java/SWIGTYPE_p_sqlite3;I)I
    .locals 2
    .param p0, "db"    # Lcom/almworks/sqlite4java/SWIGTYPE_p_sqlite3;
    .param p1, "onoff"    # I

    .prologue
    .line 251
    invoke-static {p0}, Lcom/almworks/sqlite4java/SWIGTYPE_p_sqlite3;->getCPtr(Lcom/almworks/sqlite4java/SWIGTYPE_p_sqlite3;)J

    move-result-wide v0

    invoke-static {v0, v1, p1}, Lcom/almworks/sqlite4java/_SQLiteSwiggedJNI;->sqlite3_enable_load_extension(JI)I

    move-result v0

    return v0
.end method

.method public static sqlite3_enable_shared_cache(I)I
    .locals 1
    .param p0, "arg0"    # I

    .prologue
    .line 198
    invoke-static {p0}, Lcom/almworks/sqlite4java/_SQLiteSwiggedJNI;->sqlite3_enable_shared_cache(I)I

    move-result v0

    return v0
.end method

.method public static sqlite3_errcode(Lcom/almworks/sqlite4java/SWIGTYPE_p_sqlite3;)I
    .locals 2
    .param p0, "db"    # Lcom/almworks/sqlite4java/SWIGTYPE_p_sqlite3;

    .prologue
    .line 89
    invoke-static {p0}, Lcom/almworks/sqlite4java/SWIGTYPE_p_sqlite3;->getCPtr(Lcom/almworks/sqlite4java/SWIGTYPE_p_sqlite3;)J

    move-result-wide v0

    invoke-static {v0, v1}, Lcom/almworks/sqlite4java/_SQLiteSwiggedJNI;->sqlite3_errcode(J)I

    move-result v0

    return v0
.end method

.method public static sqlite3_errmsg(Lcom/almworks/sqlite4java/SWIGTYPE_p_sqlite3;)Ljava/lang/String;
    .locals 2
    .param p0, "arg0"    # Lcom/almworks/sqlite4java/SWIGTYPE_p_sqlite3;

    .prologue
    .line 93
    invoke-static {p0}, Lcom/almworks/sqlite4java/SWIGTYPE_p_sqlite3;->getCPtr(Lcom/almworks/sqlite4java/SWIGTYPE_p_sqlite3;)J

    move-result-wide v0

    invoke-static {v0, v1}, Lcom/almworks/sqlite4java/_SQLiteSwiggedJNI;->sqlite3_errmsg(J)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static sqlite3_extended_errcode(Lcom/almworks/sqlite4java/SWIGTYPE_p_sqlite3;)I
    .locals 2
    .param p0, "db"    # Lcom/almworks/sqlite4java/SWIGTYPE_p_sqlite3;

    .prologue
    .line 21
    invoke-static {p0}, Lcom/almworks/sqlite4java/SWIGTYPE_p_sqlite3;->getCPtr(Lcom/almworks/sqlite4java/SWIGTYPE_p_sqlite3;)J

    move-result-wide v0

    invoke-static {v0, v1}, Lcom/almworks/sqlite4java/_SQLiteSwiggedJNI;->sqlite3_extended_errcode(J)I

    move-result v0

    return v0
.end method

.method public static sqlite3_extended_result_codes(Lcom/almworks/sqlite4java/SWIGTYPE_p_sqlite3;I)I
    .locals 2
    .param p0, "arg0"    # Lcom/almworks/sqlite4java/SWIGTYPE_p_sqlite3;
    .param p1, "onoff"    # I

    .prologue
    .line 53
    invoke-static {p0}, Lcom/almworks/sqlite4java/SWIGTYPE_p_sqlite3;->getCPtr(Lcom/almworks/sqlite4java/SWIGTYPE_p_sqlite3;)J

    move-result-wide v0

    invoke-static {v0, v1, p1}, Lcom/almworks/sqlite4java/_SQLiteSwiggedJNI;->sqlite3_extended_result_codes(JI)I

    move-result v0

    return v0
.end method

.method public static sqlite3_finalize(Lcom/almworks/sqlite4java/SWIGTYPE_p_sqlite3_stmt;)I
    .locals 2
    .param p0, "pStmt"    # Lcom/almworks/sqlite4java/SWIGTYPE_p_sqlite3_stmt;

    .prologue
    .line 181
    invoke-static {p0}, Lcom/almworks/sqlite4java/SWIGTYPE_p_sqlite3_stmt;->getCPtr(Lcom/almworks/sqlite4java/SWIGTYPE_p_sqlite3_stmt;)J

    move-result-wide v0

    invoke-static {v0, v1}, Lcom/almworks/sqlite4java/_SQLiteSwiggedJNI;->sqlite3_finalize(J)I

    move-result v0

    return v0
.end method

.method public static sqlite3_get_autocommit(Lcom/almworks/sqlite4java/SWIGTYPE_p_sqlite3;)I
    .locals 2
    .param p0, "arg0"    # Lcom/almworks/sqlite4java/SWIGTYPE_p_sqlite3;

    .prologue
    .line 189
    invoke-static {p0}, Lcom/almworks/sqlite4java/SWIGTYPE_p_sqlite3;->getCPtr(Lcom/almworks/sqlite4java/SWIGTYPE_p_sqlite3;)J

    move-result-wide v0

    invoke-static {v0, v1}, Lcom/almworks/sqlite4java/_SQLiteSwiggedJNI;->sqlite3_get_autocommit(J)I

    move-result v0

    return v0
.end method

.method public static sqlite3_initialize()I
    .locals 1

    .prologue
    .line 13
    invoke-static {}, Lcom/almworks/sqlite4java/_SQLiteSwiggedJNI;->sqlite3_initialize()I

    move-result v0

    return v0
.end method

.method public static sqlite3_interrupt(Lcom/almworks/sqlite4java/SWIGTYPE_p_sqlite3;)V
    .locals 2
    .param p0, "arg0"    # Lcom/almworks/sqlite4java/SWIGTYPE_p_sqlite3;

    .prologue
    .line 69
    invoke-static {p0}, Lcom/almworks/sqlite4java/SWIGTYPE_p_sqlite3;->getCPtr(Lcom/almworks/sqlite4java/SWIGTYPE_p_sqlite3;)J

    move-result-wide v0

    invoke-static {v0, v1}, Lcom/almworks/sqlite4java/_SQLiteSwiggedJNI;->sqlite3_interrupt(J)V

    .line 70
    return-void
.end method

.method public static sqlite3_last_insert_rowid(Lcom/almworks/sqlite4java/SWIGTYPE_p_sqlite3;)J
    .locals 2
    .param p0, "arg0"    # Lcom/almworks/sqlite4java/SWIGTYPE_p_sqlite3;

    .prologue
    .line 57
    invoke-static {p0}, Lcom/almworks/sqlite4java/SWIGTYPE_p_sqlite3;->getCPtr(Lcom/almworks/sqlite4java/SWIGTYPE_p_sqlite3;)J

    move-result-wide v0

    invoke-static {v0, v1}, Lcom/almworks/sqlite4java/_SQLiteSwiggedJNI;->sqlite3_last_insert_rowid(J)J

    move-result-wide v0

    return-wide v0
.end method

.method public static sqlite3_libversion()Ljava/lang/String;
    .locals 1

    .prologue
    .line 25
    invoke-static {}, Lcom/almworks/sqlite4java/_SQLiteSwiggedJNI;->sqlite3_libversion()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static sqlite3_libversion_number()I
    .locals 1

    .prologue
    .line 33
    invoke-static {}, Lcom/almworks/sqlite4java/_SQLiteSwiggedJNI;->sqlite3_libversion_number()I

    move-result v0

    return v0
.end method

.method public static sqlite3_limit(Lcom/almworks/sqlite4java/SWIGTYPE_p_sqlite3;II)I
    .locals 2
    .param p0, "arg0"    # Lcom/almworks/sqlite4java/SWIGTYPE_p_sqlite3;
    .param p1, "arg1"    # I
    .param p2, "arg2"    # I

    .prologue
    .line 226
    invoke-static {p0}, Lcom/almworks/sqlite4java/SWIGTYPE_p_sqlite3;->getCPtr(Lcom/almworks/sqlite4java/SWIGTYPE_p_sqlite3;)J

    move-result-wide v0

    invoke-static {v0, v1, p1, p2}, Lcom/almworks/sqlite4java/_SQLiteSwiggedJNI;->sqlite3_limit(JII)I

    move-result v0

    return v0
.end method

.method public static sqlite3_memory_highwater(I)J
    .locals 2
    .param p0, "resetFlag"    # I

    .prologue
    .line 85
    invoke-static {p0}, Lcom/almworks/sqlite4java/_SQLiteSwiggedJNI;->sqlite3_memory_highwater(I)J

    move-result-wide v0

    return-wide v0
.end method

.method public static sqlite3_memory_used()J
    .locals 2

    .prologue
    .line 81
    invoke-static {}, Lcom/almworks/sqlite4java/_SQLiteSwiggedJNI;->sqlite3_memory_used()J

    move-result-wide v0

    return-wide v0
.end method

.method public static sqlite3_release_memory(I)I
    .locals 1
    .param p0, "arg0"    # I

    .prologue
    .line 202
    invoke-static {p0}, Lcom/almworks/sqlite4java/_SQLiteSwiggedJNI;->sqlite3_release_memory(I)I

    move-result v0

    return v0
.end method

.method public static sqlite3_reset(Lcom/almworks/sqlite4java/SWIGTYPE_p_sqlite3_stmt;)I
    .locals 2
    .param p0, "pStmt"    # Lcom/almworks/sqlite4java/SWIGTYPE_p_sqlite3_stmt;

    .prologue
    .line 185
    invoke-static {p0}, Lcom/almworks/sqlite4java/SWIGTYPE_p_sqlite3_stmt;->getCPtr(Lcom/almworks/sqlite4java/SWIGTYPE_p_sqlite3_stmt;)J

    move-result-wide v0

    invoke-static {v0, v1}, Lcom/almworks/sqlite4java/_SQLiteSwiggedJNI;->sqlite3_reset(J)I

    move-result v0

    return v0
.end method

.method public static sqlite3_shutdown()I
    .locals 1

    .prologue
    .line 17
    invoke-static {}, Lcom/almworks/sqlite4java/_SQLiteSwiggedJNI;->sqlite3_shutdown()I

    move-result v0

    return v0
.end method

.method public static sqlite3_soft_heap_limit64(J)J
    .locals 2
    .param p0, "arg0"    # J

    .prologue
    .line 206
    invoke-static {p0, p1}, Lcom/almworks/sqlite4java/_SQLiteSwiggedJNI;->sqlite3_soft_heap_limit64(J)J

    move-result-wide v0

    return-wide v0
.end method

.method public static sqlite3_sourceid()Ljava/lang/String;
    .locals 1

    .prologue
    .line 29
    invoke-static {}, Lcom/almworks/sqlite4java/_SQLiteSwiggedJNI;->sqlite3_sourceid()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static sqlite3_step(Lcom/almworks/sqlite4java/SWIGTYPE_p_sqlite3_stmt;)I
    .locals 2
    .param p0, "arg0"    # Lcom/almworks/sqlite4java/SWIGTYPE_p_sqlite3_stmt;

    .prologue
    .line 157
    invoke-static {p0}, Lcom/almworks/sqlite4java/SWIGTYPE_p_sqlite3_stmt;->getCPtr(Lcom/almworks/sqlite4java/SWIGTYPE_p_sqlite3_stmt;)J

    move-result-wide v0

    invoke-static {v0, v1}, Lcom/almworks/sqlite4java/_SQLiteSwiggedJNI;->sqlite3_step(J)I

    move-result v0

    return v0
.end method

.method public static sqlite3_stmt_readonly(Lcom/almworks/sqlite4java/SWIGTYPE_p_sqlite3_stmt;)I
    .locals 2
    .param p0, "arg0"    # Lcom/almworks/sqlite4java/SWIGTYPE_p_sqlite3_stmt;

    .prologue
    .line 218
    invoke-static {p0}, Lcom/almworks/sqlite4java/SWIGTYPE_p_sqlite3_stmt;->getCPtr(Lcom/almworks/sqlite4java/SWIGTYPE_p_sqlite3_stmt;)J

    move-result-wide v0

    invoke-static {v0, v1}, Lcom/almworks/sqlite4java/_SQLiteSwiggedJNI;->sqlite3_stmt_readonly(J)I

    move-result v0

    return v0
.end method

.method public static sqlite3_threadsafe()I
    .locals 1

    .prologue
    .line 45
    invoke-static {}, Lcom/almworks/sqlite4java/_SQLiteSwiggedJNI;->sqlite3_threadsafe()I

    move-result v0

    return v0
.end method

.method public static sqlite3_total_changes(Lcom/almworks/sqlite4java/SWIGTYPE_p_sqlite3;)I
    .locals 2
    .param p0, "arg0"    # Lcom/almworks/sqlite4java/SWIGTYPE_p_sqlite3;

    .prologue
    .line 65
    invoke-static {p0}, Lcom/almworks/sqlite4java/SWIGTYPE_p_sqlite3;->getCPtr(Lcom/almworks/sqlite4java/SWIGTYPE_p_sqlite3;)J

    move-result-wide v0

    invoke-static {v0, v1}, Lcom/almworks/sqlite4java/_SQLiteSwiggedJNI;->sqlite3_total_changes(J)I

    move-result v0

    return v0
.end method
