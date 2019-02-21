.class final Lcom/almworks/sqlite4java/_SQLiteManualJNI;
.super Ljava/lang/Object;
.source "_SQLiteManualJNI.java"


# direct methods
.method constructor <init>()V
    .locals 0

    .prologue
    .line 19
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static final native install_progress_handler(JI[J[Ljava/lang/Object;)I
.end method

.method public static final native sqlite3_bind_blob(JI[BII)I
.end method

.method public static final native sqlite3_bind_text(JILjava/lang/String;)I
.end method

.method public static final native sqlite3_blob_open(JLjava/lang/String;Ljava/lang/String;Ljava/lang/String;JZ[J)I
.end method

.method public static final native sqlite3_blob_read(JI[BII)I
.end method

.method public static final native sqlite3_blob_write(JI[BII)I
.end method

.method public static final native sqlite3_column_blob(JI[[B)I
.end method

.method public static final native sqlite3_column_text(JI[Ljava/lang/String;)I
.end method

.method public static final native sqlite3_exec(JLjava/lang/String;[Ljava/lang/String;)I
.end method

.method public static final native sqlite3_intarray_bind(J[JIIZZ)I
.end method

.method public static final native sqlite3_intarray_create(JLjava/lang/String;[J)I
.end method

.method public static final native sqlite3_intarray_destroy(J)I
.end method

.method public static final native sqlite3_intarray_register(J[J)I
.end method

.method public static final native sqlite3_intarray_unbind(J)I
.end method

.method public static final native sqlite3_load_extension(JLjava/lang/String;Ljava/lang/String;[Ljava/lang/String;)I
.end method

.method public static final native sqlite3_open_v2(Ljava/lang/String;[JI[Ljava/lang/String;)I
.end method

.method public static final native sqlite3_prepare_v2(JLjava/lang/String;[J)I
.end method

.method public static final native sqlite3_table_column_metadata(JLjava/lang/String;Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;[I)I
.end method

.method public static final native uninstall_progress_handler(JJ)I
.end method

.method public static final native wrapper_alloc(I[J[Ljava/lang/Object;)I
.end method

.method public static final native wrapper_bind_buffer(JIJI)I
.end method

.method public static final native wrapper_column_buffer(JI[Ljava/lang/Object;)I
.end method

.method public static final native wrapper_free(J)I
.end method

.method public static final native wrapper_load_ints(JI[III[I)I
.end method

.method public static final native wrapper_load_longs(JI[JII[I)I
.end method

.method public static final native wrapper_version()Ljava/lang/String;
.end method
