.class final Lcom/almworks/sqlite4java/_SQLiteManual;
.super Ljava/lang/Object;
.source "_SQLiteManual.java"


# static fields
.field static final synthetic $assertionsDisabled:Z


# instance fields
.field private final myByteArray:[[B

.field private final myInt:[I

.field private myLastOpenError:Ljava/lang/String;

.field private myLastReturnCode:I

.field private final myLong:[J

.field private final myObject:[Ljava/lang/Object;

.field private final myString:[Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 23
    const-class v0, Lcom/almworks/sqlite4java/_SQLiteManual;

    invoke-virtual {v0}, Ljava/lang/Class;->desiredAssertionStatus()Z

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    sput-boolean v0, Lcom/almworks/sqlite4java/_SQLiteManual;->$assertionsDisabled:Z

    return-void

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method constructor <init>()V
    .locals 7

    .prologue
    const/4 v6, 0x2

    const/4 v5, 0x1

    const/4 v4, 0x0

    const/4 v1, 0x0

    .line 23
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 28
    const/4 v0, 0x3

    new-array v0, v0, [I

    fill-array-data v0, :array_0

    iput-object v0, p0, Lcom/almworks/sqlite4java/_SQLiteManual;->myInt:[I

    .line 29
    new-array v0, v5, [J

    const-wide/16 v2, 0x0

    aput-wide v2, v0, v4

    iput-object v0, p0, Lcom/almworks/sqlite4java/_SQLiteManual;->myLong:[J

    .line 30
    new-array v0, v6, [Ljava/lang/String;

    aput-object v1, v0, v4

    aput-object v1, v0, v5

    iput-object v0, p0, Lcom/almworks/sqlite4java/_SQLiteManual;->myString:[Ljava/lang/String;

    .line 31
    new-array v0, v5, [[B

    aput-object v1, v0, v4

    iput-object v0, p0, Lcom/almworks/sqlite4java/_SQLiteManual;->myByteArray:[[B

    .line 32
    new-array v0, v6, [Ljava/lang/Object;

    aput-object v1, v0, v4

    aput-object v1, v0, v5

    iput-object v0, p0, Lcom/almworks/sqlite4java/_SQLiteManual;->myObject:[Ljava/lang/Object;

    .line 37
    iput v4, p0, Lcom/almworks/sqlite4java/_SQLiteManual;->myLastReturnCode:I

    .line 38
    iput-object v1, p0, Lcom/almworks/sqlite4java/_SQLiteManual;->myLastOpenError:Ljava/lang/String;

    return-void

    .line 28
    :array_0
    .array-data 4
        0x0
        0x0
        0x0
    .end array-data
.end method

.method public static sqlite3_bind_blob(Lcom/almworks/sqlite4java/SWIGTYPE_p_sqlite3_stmt;I[BII)I
    .locals 6
    .param p0, "stmt"    # Lcom/almworks/sqlite4java/SWIGTYPE_p_sqlite3_stmt;
    .param p1, "index"    # I
    .param p2, "value"    # [B
    .param p3, "offset"    # I
    .param p4, "length"    # I

    .prologue
    .line 72
    invoke-static {p0}, Lcom/almworks/sqlite4java/SWIGTYPE_p_sqlite3_stmt;->getCPtr(Lcom/almworks/sqlite4java/SWIGTYPE_p_sqlite3_stmt;)J

    move-result-wide v0

    move v2, p1

    move-object v3, p2

    move v4, p3

    move v5, p4

    invoke-static/range {v0 .. v5}, Lcom/almworks/sqlite4java/_SQLiteManualJNI;->sqlite3_bind_blob(JI[BII)I

    move-result v0

    return v0
.end method

.method public static sqlite3_bind_text(Lcom/almworks/sqlite4java/SWIGTYPE_p_sqlite3_stmt;ILjava/lang/String;)I
    .locals 2
    .param p0, "stmt"    # Lcom/almworks/sqlite4java/SWIGTYPE_p_sqlite3_stmt;
    .param p1, "index"    # I
    .param p2, "value"    # Ljava/lang/String;

    .prologue
    .line 68
    invoke-static {p0}, Lcom/almworks/sqlite4java/SWIGTYPE_p_sqlite3_stmt;->getCPtr(Lcom/almworks/sqlite4java/SWIGTYPE_p_sqlite3_stmt;)J

    move-result-wide v0

    invoke-static {v0, v1, p1, p2}, Lcom/almworks/sqlite4java/_SQLiteManualJNI;->sqlite3_bind_text(JILjava/lang/String;)I

    move-result v0

    return v0
.end method

.method public static sqlite3_blob_read(Lcom/almworks/sqlite4java/SWIGTYPE_p_sqlite3_blob;I[BII)I
    .locals 6
    .param p0, "blob"    # Lcom/almworks/sqlite4java/SWIGTYPE_p_sqlite3_blob;
    .param p1, "blobOffset"    # I
    .param p2, "buffer"    # [B
    .param p3, "bufferOffset"    # I
    .param p4, "length"    # I

    .prologue
    .line 76
    invoke-static {p0}, Lcom/almworks/sqlite4java/SWIGTYPE_p_sqlite3_blob;->getCPtr(Lcom/almworks/sqlite4java/SWIGTYPE_p_sqlite3_blob;)J

    move-result-wide v0

    move v2, p1

    move-object v3, p2

    move v4, p3

    move v5, p4

    invoke-static/range {v0 .. v5}, Lcom/almworks/sqlite4java/_SQLiteManualJNI;->sqlite3_blob_read(JI[BII)I

    move-result v0

    return v0
.end method

.method public static sqlite3_blob_write(Lcom/almworks/sqlite4java/SWIGTYPE_p_sqlite3_blob;I[BII)I
    .locals 6
    .param p0, "blob"    # Lcom/almworks/sqlite4java/SWIGTYPE_p_sqlite3_blob;
    .param p1, "blobOffset"    # I
    .param p2, "buffer"    # [B
    .param p3, "bufferOffset"    # I
    .param p4, "length"    # I

    .prologue
    .line 80
    invoke-static {p0}, Lcom/almworks/sqlite4java/SWIGTYPE_p_sqlite3_blob;->getCPtr(Lcom/almworks/sqlite4java/SWIGTYPE_p_sqlite3_blob;)J

    move-result-wide v0

    move v2, p1

    move-object v3, p2

    move v4, p3

    move v5, p4

    invoke-static/range {v0 .. v5}, Lcom/almworks/sqlite4java/_SQLiteManualJNI;->sqlite3_blob_write(JI[BII)I

    move-result v0

    return v0
.end method

.method public static sqlite3_exec(Lcom/almworks/sqlite4java/SWIGTYPE_p_sqlite3;Ljava/lang/String;[Ljava/lang/String;)I
    .locals 2
    .param p0, "db"    # Lcom/almworks/sqlite4java/SWIGTYPE_p_sqlite3;
    .param p1, "sql"    # Ljava/lang/String;
    .param p2, "outError"    # [Ljava/lang/String;

    .prologue
    .line 45
    sget-boolean v0, Lcom/almworks/sqlite4java/_SQLiteManual;->$assertionsDisabled:Z

    if-nez v0, :cond_0

    if-eqz p2, :cond_0

    array-length v0, p2

    const/4 v1, 0x1

    if-eq v0, v1, :cond_0

    new-instance v0, Ljava/lang/AssertionError;

    array-length v1, p2

    invoke-direct {v0, v1}, Ljava/lang/AssertionError;-><init>(I)V

    throw v0

    .line 46
    :cond_0
    invoke-static {p0}, Lcom/almworks/sqlite4java/SWIGTYPE_p_sqlite3;->getCPtr(Lcom/almworks/sqlite4java/SWIGTYPE_p_sqlite3;)J

    move-result-wide v0

    invoke-static {v0, v1, p1, p2}, Lcom/almworks/sqlite4java/_SQLiteManualJNI;->sqlite3_exec(JLjava/lang/String;[Ljava/lang/String;)I

    move-result v0

    return v0
.end method

.method public static sqlite3_intarray_bind(Lcom/almworks/sqlite4java/SWIGTYPE_p_intarray;[JIIZZ)I
    .locals 7
    .param p0, "array"    # Lcom/almworks/sqlite4java/SWIGTYPE_p_intarray;
    .param p1, "values"    # [J
    .param p2, "offset"    # I
    .param p3, "length"    # I
    .param p4, "ordered"    # Z
    .param p5, "unique"    # Z

    .prologue
    .line 236
    invoke-static {p0}, Lcom/almworks/sqlite4java/SWIGTYPE_p_intarray;->getCPtr(Lcom/almworks/sqlite4java/SWIGTYPE_p_intarray;)J

    move-result-wide v0

    move-object v2, p1

    move v3, p2

    move v4, p3

    move v5, p4

    move v6, p5

    invoke-static/range {v0 .. v6}, Lcom/almworks/sqlite4java/_SQLiteManualJNI;->sqlite3_intarray_bind(J[JIIZZ)I

    move-result v0

    return v0
.end method

.method public static sqlite3_intarray_destroy(Lcom/almworks/sqlite4java/SWIGTYPE_p_intarray;)I
    .locals 2
    .param p0, "array"    # Lcom/almworks/sqlite4java/SWIGTYPE_p_intarray;

    .prologue
    .line 244
    invoke-static {p0}, Lcom/almworks/sqlite4java/SWIGTYPE_p_intarray;->getCPtr(Lcom/almworks/sqlite4java/SWIGTYPE_p_intarray;)J

    move-result-wide v0

    invoke-static {v0, v1}, Lcom/almworks/sqlite4java/_SQLiteManualJNI;->sqlite3_intarray_destroy(J)I

    move-result v0

    return v0
.end method

.method public static sqlite3_intarray_unbind(Lcom/almworks/sqlite4java/SWIGTYPE_p_intarray;)I
    .locals 2
    .param p0, "array"    # Lcom/almworks/sqlite4java/SWIGTYPE_p_intarray;

    .prologue
    .line 240
    invoke-static {p0}, Lcom/almworks/sqlite4java/SWIGTYPE_p_intarray;->getCPtr(Lcom/almworks/sqlite4java/SWIGTYPE_p_intarray;)J

    move-result-wide v0

    invoke-static {v0, v1}, Lcom/almworks/sqlite4java/_SQLiteManualJNI;->sqlite3_intarray_unbind(J)I

    move-result v0

    return v0
.end method

.method public static uninstall_progress_handler(Lcom/almworks/sqlite4java/SWIGTYPE_p_sqlite3;Lcom/almworks/sqlite4java/ProgressHandler;)I
    .locals 6
    .param p0, "db"    # Lcom/almworks/sqlite4java/SWIGTYPE_p_sqlite3;
    .param p1, "handler"    # Lcom/almworks/sqlite4java/ProgressHandler;

    .prologue
    .line 197
    invoke-virtual {p1}, Lcom/almworks/sqlite4java/ProgressHandler;->dispose()Lcom/almworks/sqlite4java/SWIGTYPE_p_direct_buffer;

    move-result-object v0

    .line 198
    .local v0, "pointer":Lcom/almworks/sqlite4java/SWIGTYPE_p_direct_buffer;
    if-nez v0, :cond_0

    .line 199
    const/4 v1, 0x0

    .line 200
    :goto_0
    return v1

    :cond_0
    invoke-static {p0}, Lcom/almworks/sqlite4java/SWIGTYPE_p_sqlite3;->getCPtr(Lcom/almworks/sqlite4java/SWIGTYPE_p_sqlite3;)J

    move-result-wide v2

    invoke-static {v0}, Lcom/almworks/sqlite4java/SWIGTYPE_p_direct_buffer;->getCPtr(Lcom/almworks/sqlite4java/SWIGTYPE_p_direct_buffer;)J

    move-result-wide v4

    invoke-static {v2, v3, v4, v5}, Lcom/almworks/sqlite4java/_SQLiteManualJNI;->uninstall_progress_handler(JJ)I

    move-result v1

    goto :goto_0
.end method

.method public static wrapper_bind_buffer(Lcom/almworks/sqlite4java/SWIGTYPE_p_sqlite3_stmt;ILcom/almworks/sqlite4java/DirectBuffer;)I
    .locals 7
    .param p0, "stmt"    # Lcom/almworks/sqlite4java/SWIGTYPE_p_sqlite3_stmt;
    .param p1, "index"    # I
    .param p2, "buffer"    # Lcom/almworks/sqlite4java/DirectBuffer;

    .prologue
    .line 166
    invoke-virtual {p2}, Lcom/almworks/sqlite4java/DirectBuffer;->getHandle()Lcom/almworks/sqlite4java/SWIGTYPE_p_direct_buffer;

    move-result-object v6

    .line 167
    .local v6, "handle":Lcom/almworks/sqlite4java/SWIGTYPE_p_direct_buffer;
    if-nez v6, :cond_0

    .line 168
    const/16 v0, -0x63

    .line 170
    :goto_0
    return v0

    .line 169
    :cond_0
    invoke-virtual {p2}, Lcom/almworks/sqlite4java/DirectBuffer;->getPosition()I

    move-result v5

    .line 170
    .local v5, "size":I
    invoke-static {p0}, Lcom/almworks/sqlite4java/SWIGTYPE_p_sqlite3_stmt;->getCPtr(Lcom/almworks/sqlite4java/SWIGTYPE_p_sqlite3_stmt;)J

    move-result-wide v0

    invoke-static {v6}, Lcom/almworks/sqlite4java/SWIGTYPE_p_direct_buffer;->getCPtr(Lcom/almworks/sqlite4java/SWIGTYPE_p_direct_buffer;)J

    move-result-wide v3

    move v2, p1

    invoke-static/range {v0 .. v5}, Lcom/almworks/sqlite4java/_SQLiteManualJNI;->wrapper_bind_buffer(JIJI)I

    move-result v0

    goto :goto_0
.end method

.method public static wrapper_free(Lcom/almworks/sqlite4java/DirectBuffer;)I
    .locals 4
    .param p0, "buffer"    # Lcom/almworks/sqlite4java/DirectBuffer;

    .prologue
    .line 157
    invoke-virtual {p0}, Lcom/almworks/sqlite4java/DirectBuffer;->getHandle()Lcom/almworks/sqlite4java/SWIGTYPE_p_direct_buffer;

    move-result-object v0

    .line 158
    .local v0, "handle":Lcom/almworks/sqlite4java/SWIGTYPE_p_direct_buffer;
    invoke-virtual {p0}, Lcom/almworks/sqlite4java/DirectBuffer;->invalidate()V

    .line 159
    if-nez v0, :cond_0

    .line 160
    const/4 v1, 0x0

    .line 162
    :goto_0
    return v1

    .line 161
    :cond_0
    invoke-static {v0}, Lcom/almworks/sqlite4java/SWIGTYPE_p_direct_buffer;->getCPtr(Lcom/almworks/sqlite4java/SWIGTYPE_p_direct_buffer;)J

    move-result-wide v2

    invoke-static {v2, v3}, Lcom/almworks/sqlite4java/_SQLiteManualJNI;->wrapper_free(J)I

    move-result v1

    .line 162
    .local v1, "rc":I
    goto :goto_0
.end method

.method public static wrapper_version()Ljava/lang/String;
    .locals 1

    .prologue
    .line 41
    invoke-static {}, Lcom/almworks/sqlite4java/_SQLiteManualJNI;->wrapper_version()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method


# virtual methods
.method public drainLastOpenError()Ljava/lang/String;
    .locals 2

    .prologue
    .line 88
    iget-object v0, p0, Lcom/almworks/sqlite4java/_SQLiteManual;->myLastOpenError:Ljava/lang/String;

    .line 89
    .local v0, "r":Ljava/lang/String;
    const/4 v1, 0x0

    iput-object v1, p0, Lcom/almworks/sqlite4java/_SQLiteManual;->myLastOpenError:Ljava/lang/String;

    .line 90
    return-object v0
.end method

.method public getLastReturnCode()I
    .locals 1

    .prologue
    .line 84
    iget v0, p0, Lcom/almworks/sqlite4java/_SQLiteManual;->myLastReturnCode:I

    return v0
.end method

.method public install_progress_handler(Lcom/almworks/sqlite4java/SWIGTYPE_p_sqlite3;I)Lcom/almworks/sqlite4java/ProgressHandler;
    .locals 12
    .param p1, "db"    # Lcom/almworks/sqlite4java/SWIGTYPE_p_sqlite3;
    .param p2, "stepsPerCallback"    # I

    .prologue
    const-wide/16 v10, 0x0

    const/4 v4, 0x0

    const/4 v8, 0x0

    .line 183
    iput v8, p0, Lcom/almworks/sqlite4java/_SQLiteManual;->myLastReturnCode:I

    .line 184
    iget-object v3, p0, Lcom/almworks/sqlite4java/_SQLiteManual;->myLong:[J

    aput-wide v10, v3, v8

    .line 185
    iget-object v3, p0, Lcom/almworks/sqlite4java/_SQLiteManual;->myObject:[Ljava/lang/Object;

    aput-object v4, v3, v8

    .line 186
    invoke-static {p1}, Lcom/almworks/sqlite4java/SWIGTYPE_p_sqlite3;->getCPtr(Lcom/almworks/sqlite4java/SWIGTYPE_p_sqlite3;)J

    move-result-wide v6

    iget-object v3, p0, Lcom/almworks/sqlite4java/_SQLiteManual;->myLong:[J

    iget-object v5, p0, Lcom/almworks/sqlite4java/_SQLiteManual;->myObject:[Ljava/lang/Object;

    invoke-static {v6, v7, p2, v3, v5}, Lcom/almworks/sqlite4java/_SQLiteManualJNI;->install_progress_handler(JI[J[Ljava/lang/Object;)I

    move-result v3

    iput v3, p0, Lcom/almworks/sqlite4java/_SQLiteManual;->myLastReturnCode:I

    .line 187
    iget-object v3, p0, Lcom/almworks/sqlite4java/_SQLiteManual;->myObject:[Ljava/lang/Object;

    aget-object v3, v3, v8

    instance-of v3, v3, Ljava/nio/ByteBuffer;

    if-eqz v3, :cond_1

    iget-object v3, p0, Lcom/almworks/sqlite4java/_SQLiteManual;->myObject:[Ljava/lang/Object;

    aget-object v3, v3, v8

    check-cast v3, Ljava/nio/ByteBuffer;

    move-object v2, v3

    .line 188
    .local v2, "r":Ljava/nio/ByteBuffer;
    :goto_0
    iget-object v3, p0, Lcom/almworks/sqlite4java/_SQLiteManual;->myObject:[Ljava/lang/Object;

    aput-object v4, v3, v8

    .line 189
    iget-object v3, p0, Lcom/almworks/sqlite4java/_SQLiteManual;->myLong:[J

    aget-wide v0, v3, v8

    .line 190
    .local v0, "ptr":J
    iget-object v3, p0, Lcom/almworks/sqlite4java/_SQLiteManual;->myLong:[J

    aput-wide v10, v3, v8

    .line 191
    cmp-long v3, v0, v10

    if-eqz v3, :cond_0

    if-nez v2, :cond_2

    .line 193
    :cond_0
    :goto_1
    return-object v4

    .end local v0    # "ptr":J
    .end local v2    # "r":Ljava/nio/ByteBuffer;
    :cond_1
    move-object v2, v4

    .line 187
    goto :goto_0

    .line 193
    .restart local v0    # "ptr":J
    .restart local v2    # "r":Ljava/nio/ByteBuffer;
    :cond_2
    new-instance v4, Lcom/almworks/sqlite4java/ProgressHandler;

    new-instance v3, Lcom/almworks/sqlite4java/SWIGTYPE_p_direct_buffer;

    const/4 v5, 0x1

    invoke-direct {v3, v0, v1, v5}, Lcom/almworks/sqlite4java/SWIGTYPE_p_direct_buffer;-><init>(JZ)V

    invoke-direct {v4, v3, v2, p2}, Lcom/almworks/sqlite4java/ProgressHandler;-><init>(Lcom/almworks/sqlite4java/SWIGTYPE_p_direct_buffer;Ljava/nio/ByteBuffer;I)V

    goto :goto_1
.end method

.method public sqlite3_blob_open(Lcom/almworks/sqlite4java/SWIGTYPE_p_sqlite3;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;JZ)Lcom/almworks/sqlite4java/SWIGTYPE_p_sqlite3_blob;
    .locals 13
    .param p1, "db"    # Lcom/almworks/sqlite4java/SWIGTYPE_p_sqlite3;
    .param p2, "database"    # Ljava/lang/String;
    .param p3, "table"    # Ljava/lang/String;
    .param p4, "column"    # Ljava/lang/String;
    .param p5, "rowid"    # J
    .param p7, "writeAccess"    # Z

    .prologue
    .line 133
    const/4 v0, 0x0

    iput v0, p0, Lcom/almworks/sqlite4java/_SQLiteManual;->myLastReturnCode:I

    .line 134
    iget-object v0, p0, Lcom/almworks/sqlite4java/_SQLiteManual;->myLong:[J

    const/4 v1, 0x0

    const-wide/16 v2, 0x0

    aput-wide v2, v0, v1

    .line 135
    invoke-static {p1}, Lcom/almworks/sqlite4java/SWIGTYPE_p_sqlite3;->getCPtr(Lcom/almworks/sqlite4java/SWIGTYPE_p_sqlite3;)J

    move-result-wide v0

    iget-object v8, p0, Lcom/almworks/sqlite4java/_SQLiteManual;->myLong:[J

    move-object v2, p2

    move-object/from16 v3, p3

    move-object/from16 v4, p4

    move-wide/from16 v5, p5

    move/from16 v7, p7

    invoke-static/range {v0 .. v8}, Lcom/almworks/sqlite4java/_SQLiteManualJNI;->sqlite3_blob_open(JLjava/lang/String;Ljava/lang/String;Ljava/lang/String;JZ[J)I

    move-result v0

    iput v0, p0, Lcom/almworks/sqlite4java/_SQLiteManual;->myLastReturnCode:I

    .line 136
    iget-object v0, p0, Lcom/almworks/sqlite4java/_SQLiteManual;->myLong:[J

    const/4 v1, 0x0

    aget-wide v10, v0, v1

    .line 137
    .local v10, "ptr":J
    iget-object v0, p0, Lcom/almworks/sqlite4java/_SQLiteManual;->myLong:[J

    const/4 v1, 0x0

    const-wide/16 v2, 0x0

    aput-wide v2, v0, v1

    .line 138
    const-wide/16 v0, 0x0

    cmp-long v0, v10, v0

    if-nez v0, :cond_0

    const/4 v0, 0x0

    :goto_0
    return-object v0

    :cond_0
    new-instance v0, Lcom/almworks/sqlite4java/SWIGTYPE_p_sqlite3_blob;

    const/4 v1, 0x1

    invoke-direct {v0, v10, v11, v1}, Lcom/almworks/sqlite4java/SWIGTYPE_p_sqlite3_blob;-><init>(JZ)V

    goto :goto_0
.end method

.method public sqlite3_column_blob(Lcom/almworks/sqlite4java/SWIGTYPE_p_sqlite3_stmt;I)[B
    .locals 6
    .param p1, "stmt"    # Lcom/almworks/sqlite4java/SWIGTYPE_p_sqlite3_stmt;
    .param p2, "column"    # I

    .prologue
    const/4 v5, 0x0

    const/4 v4, 0x0

    .line 124
    iput v4, p0, Lcom/almworks/sqlite4java/_SQLiteManual;->myLastReturnCode:I

    .line 125
    iget-object v1, p0, Lcom/almworks/sqlite4java/_SQLiteManual;->myByteArray:[[B

    aput-object v5, v1, v4

    .line 126
    invoke-static {p1}, Lcom/almworks/sqlite4java/SWIGTYPE_p_sqlite3_stmt;->getCPtr(Lcom/almworks/sqlite4java/SWIGTYPE_p_sqlite3_stmt;)J

    move-result-wide v2

    iget-object v1, p0, Lcom/almworks/sqlite4java/_SQLiteManual;->myByteArray:[[B

    invoke-static {v2, v3, p2, v1}, Lcom/almworks/sqlite4java/_SQLiteManualJNI;->sqlite3_column_blob(JI[[B)I

    move-result v1

    iput v1, p0, Lcom/almworks/sqlite4java/_SQLiteManual;->myLastReturnCode:I

    .line 127
    iget-object v1, p0, Lcom/almworks/sqlite4java/_SQLiteManual;->myByteArray:[[B

    aget-object v0, v1, v4

    .line 128
    .local v0, "r":[B
    iget-object v1, p0, Lcom/almworks/sqlite4java/_SQLiteManual;->myByteArray:[[B

    aput-object v5, v1, v4

    .line 129
    return-object v0
.end method

.method public sqlite3_column_text(Lcom/almworks/sqlite4java/SWIGTYPE_p_sqlite3_stmt;I)Ljava/lang/String;
    .locals 6
    .param p1, "stmt"    # Lcom/almworks/sqlite4java/SWIGTYPE_p_sqlite3_stmt;
    .param p2, "column"    # I

    .prologue
    const/4 v5, 0x0

    const/4 v4, 0x0

    .line 115
    iput v4, p0, Lcom/almworks/sqlite4java/_SQLiteManual;->myLastReturnCode:I

    .line 116
    iget-object v1, p0, Lcom/almworks/sqlite4java/_SQLiteManual;->myString:[Ljava/lang/String;

    aput-object v5, v1, v4

    .line 117
    invoke-static {p1}, Lcom/almworks/sqlite4java/SWIGTYPE_p_sqlite3_stmt;->getCPtr(Lcom/almworks/sqlite4java/SWIGTYPE_p_sqlite3_stmt;)J

    move-result-wide v2

    iget-object v1, p0, Lcom/almworks/sqlite4java/_SQLiteManual;->myString:[Ljava/lang/String;

    invoke-static {v2, v3, p2, v1}, Lcom/almworks/sqlite4java/_SQLiteManualJNI;->sqlite3_column_text(JI[Ljava/lang/String;)I

    move-result v1

    iput v1, p0, Lcom/almworks/sqlite4java/_SQLiteManual;->myLastReturnCode:I

    .line 118
    iget-object v1, p0, Lcom/almworks/sqlite4java/_SQLiteManual;->myString:[Ljava/lang/String;

    aget-object v0, v1, v4

    .line 119
    .local v0, "r":Ljava/lang/String;
    iget-object v1, p0, Lcom/almworks/sqlite4java/_SQLiteManual;->myString:[Ljava/lang/String;

    aput-object v5, v1, v4

    .line 120
    return-object v0
.end method

.method public sqlite3_intarray_create(Lcom/almworks/sqlite4java/SWIGTYPE_p_intarray_module;Ljava/lang/String;)Lcom/almworks/sqlite4java/SWIGTYPE_p_intarray;
    .locals 6
    .param p1, "module"    # Lcom/almworks/sqlite4java/SWIGTYPE_p_intarray_module;
    .param p2, "name"    # Ljava/lang/String;

    .prologue
    const-wide/16 v4, 0x0

    const/4 v3, 0x0

    .line 229
    iput v3, p0, Lcom/almworks/sqlite4java/_SQLiteManual;->myLastReturnCode:I

    .line 230
    iget-object v0, p0, Lcom/almworks/sqlite4java/_SQLiteManual;->myLong:[J

    aput-wide v4, v0, v3

    .line 231
    invoke-static {p1}, Lcom/almworks/sqlite4java/SWIGTYPE_p_intarray_module;->getCPtr(Lcom/almworks/sqlite4java/SWIGTYPE_p_intarray_module;)J

    move-result-wide v0

    iget-object v2, p0, Lcom/almworks/sqlite4java/_SQLiteManual;->myLong:[J

    invoke-static {v0, v1, p2, v2}, Lcom/almworks/sqlite4java/_SQLiteManualJNI;->sqlite3_intarray_create(JLjava/lang/String;[J)I

    move-result v0

    iput v0, p0, Lcom/almworks/sqlite4java/_SQLiteManual;->myLastReturnCode:I

    .line 232
    iget-object v0, p0, Lcom/almworks/sqlite4java/_SQLiteManual;->myLong:[J

    aget-wide v0, v0, v3

    cmp-long v0, v0, v4

    if-nez v0, :cond_0

    const/4 v0, 0x0

    :goto_0
    return-object v0

    :cond_0
    new-instance v0, Lcom/almworks/sqlite4java/SWIGTYPE_p_intarray;

    iget-object v1, p0, Lcom/almworks/sqlite4java/_SQLiteManual;->myLong:[J

    aget-wide v2, v1, v3

    const/4 v1, 0x1

    invoke-direct {v0, v2, v3, v1}, Lcom/almworks/sqlite4java/SWIGTYPE_p_intarray;-><init>(JZ)V

    goto :goto_0
.end method

.method public sqlite3_intarray_register(Lcom/almworks/sqlite4java/SWIGTYPE_p_sqlite3;)Lcom/almworks/sqlite4java/SWIGTYPE_p_intarray_module;
    .locals 6
    .param p1, "db"    # Lcom/almworks/sqlite4java/SWIGTYPE_p_sqlite3;

    .prologue
    const-wide/16 v4, 0x0

    const/4 v3, 0x0

    .line 222
    iput v3, p0, Lcom/almworks/sqlite4java/_SQLiteManual;->myLastReturnCode:I

    .line 223
    iget-object v0, p0, Lcom/almworks/sqlite4java/_SQLiteManual;->myLong:[J

    aput-wide v4, v0, v3

    .line 224
    invoke-static {p1}, Lcom/almworks/sqlite4java/SWIGTYPE_p_sqlite3;->getCPtr(Lcom/almworks/sqlite4java/SWIGTYPE_p_sqlite3;)J

    move-result-wide v0

    iget-object v2, p0, Lcom/almworks/sqlite4java/_SQLiteManual;->myLong:[J

    invoke-static {v0, v1, v2}, Lcom/almworks/sqlite4java/_SQLiteManualJNI;->sqlite3_intarray_register(J[J)I

    move-result v0

    iput v0, p0, Lcom/almworks/sqlite4java/_SQLiteManual;->myLastReturnCode:I

    .line 225
    iget-object v0, p0, Lcom/almworks/sqlite4java/_SQLiteManual;->myLong:[J

    aget-wide v0, v0, v3

    cmp-long v0, v0, v4

    if-nez v0, :cond_0

    const/4 v0, 0x0

    :goto_0
    return-object v0

    :cond_0
    new-instance v0, Lcom/almworks/sqlite4java/SWIGTYPE_p_intarray_module;

    iget-object v1, p0, Lcom/almworks/sqlite4java/_SQLiteManual;->myLong:[J

    aget-wide v2, v1, v3

    const/4 v1, 0x1

    invoke-direct {v0, v2, v3, v1}, Lcom/almworks/sqlite4java/SWIGTYPE_p_intarray_module;-><init>(JZ)V

    goto :goto_0
.end method

.method public sqlite3_load_extension(Lcom/almworks/sqlite4java/SWIGTYPE_p_sqlite3;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 6
    .param p1, "db"    # Lcom/almworks/sqlite4java/SWIGTYPE_p_sqlite3;
    .param p2, "file"    # Ljava/lang/String;
    .param p3, "proc"    # Ljava/lang/String;

    .prologue
    const/4 v5, 0x0

    const/4 v4, 0x0

    .line 248
    iput v4, p0, Lcom/almworks/sqlite4java/_SQLiteManual;->myLastReturnCode:I

    .line 249
    iget-object v1, p0, Lcom/almworks/sqlite4java/_SQLiteManual;->myString:[Ljava/lang/String;

    aput-object v5, v1, v4

    .line 250
    invoke-static {p1}, Lcom/almworks/sqlite4java/SWIGTYPE_p_sqlite3;->getCPtr(Lcom/almworks/sqlite4java/SWIGTYPE_p_sqlite3;)J

    move-result-wide v2

    iget-object v1, p0, Lcom/almworks/sqlite4java/_SQLiteManual;->myString:[Ljava/lang/String;

    invoke-static {v2, v3, p2, p3, v1}, Lcom/almworks/sqlite4java/_SQLiteManualJNI;->sqlite3_load_extension(JLjava/lang/String;Ljava/lang/String;[Ljava/lang/String;)I

    move-result v1

    iput v1, p0, Lcom/almworks/sqlite4java/_SQLiteManual;->myLastReturnCode:I

    .line 251
    iget-object v1, p0, Lcom/almworks/sqlite4java/_SQLiteManual;->myString:[Ljava/lang/String;

    aget-object v0, v1, v4

    .line 252
    .local v0, "r":Ljava/lang/String;
    iget-object v1, p0, Lcom/almworks/sqlite4java/_SQLiteManual;->myString:[Ljava/lang/String;

    aput-object v5, v1, v4

    .line 253
    return-object v0
.end method

.method public sqlite3_open_v2(Ljava/lang/String;I)Lcom/almworks/sqlite4java/SWIGTYPE_p_sqlite3;
    .locals 8
    .param p1, "filename"    # Ljava/lang/String;
    .param p2, "flags"    # I

    .prologue
    const-wide/16 v6, 0x0

    const/4 v2, 0x0

    const/4 v5, 0x0

    .line 94
    iput v5, p0, Lcom/almworks/sqlite4java/_SQLiteManual;->myLastReturnCode:I

    .line 95
    iget-object v3, p0, Lcom/almworks/sqlite4java/_SQLiteManual;->myLong:[J

    aput-wide v6, v3, v5

    .line 96
    iget-object v3, p0, Lcom/almworks/sqlite4java/_SQLiteManual;->myString:[Ljava/lang/String;

    aput-object v2, v3, v5

    .line 97
    iget-object v3, p0, Lcom/almworks/sqlite4java/_SQLiteManual;->myLong:[J

    iget-object v4, p0, Lcom/almworks/sqlite4java/_SQLiteManual;->myString:[Ljava/lang/String;

    invoke-static {p1, v3, p2, v4}, Lcom/almworks/sqlite4java/_SQLiteManualJNI;->sqlite3_open_v2(Ljava/lang/String;[JI[Ljava/lang/String;)I

    move-result v3

    iput v3, p0, Lcom/almworks/sqlite4java/_SQLiteManual;->myLastReturnCode:I

    .line 98
    iget-object v3, p0, Lcom/almworks/sqlite4java/_SQLiteManual;->myLong:[J

    aget-wide v0, v3, v5

    .line 99
    .local v0, "ptr":J
    iget-object v3, p0, Lcom/almworks/sqlite4java/_SQLiteManual;->myLong:[J

    aput-wide v6, v3, v5

    .line 100
    iget-object v3, p0, Lcom/almworks/sqlite4java/_SQLiteManual;->myString:[Ljava/lang/String;

    aget-object v3, v3, v5

    iput-object v3, p0, Lcom/almworks/sqlite4java/_SQLiteManual;->myLastOpenError:Ljava/lang/String;

    .line 101
    iget-object v3, p0, Lcom/almworks/sqlite4java/_SQLiteManual;->myString:[Ljava/lang/String;

    aput-object v2, v3, v5

    .line 102
    cmp-long v3, v0, v6

    if-nez v3, :cond_0

    :goto_0
    return-object v2

    :cond_0
    new-instance v2, Lcom/almworks/sqlite4java/SWIGTYPE_p_sqlite3;

    const/4 v3, 0x1

    invoke-direct {v2, v0, v1, v3}, Lcom/almworks/sqlite4java/SWIGTYPE_p_sqlite3;-><init>(JZ)V

    goto :goto_0
.end method

.method public sqlite3_prepare_v2(Lcom/almworks/sqlite4java/SWIGTYPE_p_sqlite3;Ljava/lang/String;)Lcom/almworks/sqlite4java/SWIGTYPE_p_sqlite3_stmt;
    .locals 8
    .param p1, "db"    # Lcom/almworks/sqlite4java/SWIGTYPE_p_sqlite3;
    .param p2, "sql"    # Ljava/lang/String;

    .prologue
    const-wide/16 v6, 0x0

    const/4 v5, 0x0

    .line 106
    iput v5, p0, Lcom/almworks/sqlite4java/_SQLiteManual;->myLastReturnCode:I

    .line 107
    iget-object v2, p0, Lcom/almworks/sqlite4java/_SQLiteManual;->myLong:[J

    aput-wide v6, v2, v5

    .line 108
    invoke-static {p1}, Lcom/almworks/sqlite4java/SWIGTYPE_p_sqlite3;->getCPtr(Lcom/almworks/sqlite4java/SWIGTYPE_p_sqlite3;)J

    move-result-wide v2

    iget-object v4, p0, Lcom/almworks/sqlite4java/_SQLiteManual;->myLong:[J

    invoke-static {v2, v3, p2, v4}, Lcom/almworks/sqlite4java/_SQLiteManualJNI;->sqlite3_prepare_v2(JLjava/lang/String;[J)I

    move-result v2

    iput v2, p0, Lcom/almworks/sqlite4java/_SQLiteManual;->myLastReturnCode:I

    .line 109
    iget-object v2, p0, Lcom/almworks/sqlite4java/_SQLiteManual;->myLong:[J

    aget-wide v0, v2, v5

    .line 110
    .local v0, "ptr":J
    iget-object v2, p0, Lcom/almworks/sqlite4java/_SQLiteManual;->myLong:[J

    aput-wide v6, v2, v5

    .line 111
    cmp-long v2, v0, v6

    if-nez v2, :cond_0

    const/4 v2, 0x0

    :goto_0
    return-object v2

    :cond_0
    new-instance v2, Lcom/almworks/sqlite4java/SWIGTYPE_p_sqlite3_stmt;

    const/4 v3, 0x1

    invoke-direct {v2, v0, v1, v3}, Lcom/almworks/sqlite4java/SWIGTYPE_p_sqlite3_stmt;-><init>(JZ)V

    goto :goto_0
.end method

.method public sqlite3_table_column_metadata(Lcom/almworks/sqlite4java/SWIGTYPE_p_sqlite3;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lcom/almworks/sqlite4java/SQLiteColumnMetadata;
    .locals 8
    .param p1, "db"    # Lcom/almworks/sqlite4java/SWIGTYPE_p_sqlite3;
    .param p2, "dbName"    # Ljava/lang/String;
    .param p3, "tableName"    # Ljava/lang/String;
    .param p4, "columnName"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/almworks/sqlite4java/SQLiteException;
        }
    .end annotation

    .prologue
    .line 50
    iget-object v1, p0, Lcom/almworks/sqlite4java/_SQLiteManual;->myString:[Ljava/lang/String;

    const/4 v2, 0x0

    const/4 v3, 0x0

    aput-object v3, v1, v2

    .line 51
    iget-object v1, p0, Lcom/almworks/sqlite4java/_SQLiteManual;->myString:[Ljava/lang/String;

    const/4 v2, 0x1

    const/4 v3, 0x0

    aput-object v3, v1, v2

    .line 52
    iget-object v1, p0, Lcom/almworks/sqlite4java/_SQLiteManual;->myInt:[I

    const/4 v2, 0x0

    const/4 v3, 0x0

    aput v3, v1, v2

    .line 53
    iget-object v1, p0, Lcom/almworks/sqlite4java/_SQLiteManual;->myInt:[I

    const/4 v2, 0x1

    const/4 v3, 0x0

    aput v3, v1, v2

    .line 54
    iget-object v1, p0, Lcom/almworks/sqlite4java/_SQLiteManual;->myInt:[I

    const/4 v2, 0x2

    const/4 v3, 0x0

    aput v3, v1, v2

    .line 55
    invoke-static {p1}, Lcom/almworks/sqlite4java/SWIGTYPE_p_sqlite3;->getCPtr(Lcom/almworks/sqlite4java/SWIGTYPE_p_sqlite3;)J

    move-result-wide v0

    iget-object v5, p0, Lcom/almworks/sqlite4java/_SQLiteManual;->myString:[Ljava/lang/String;

    iget-object v6, p0, Lcom/almworks/sqlite4java/_SQLiteManual;->myInt:[I

    move-object v2, p2

    move-object v3, p3

    move-object v4, p4

    invoke-static/range {v0 .. v6}, Lcom/almworks/sqlite4java/_SQLiteManualJNI;->sqlite3_table_column_metadata(JLjava/lang/String;Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;[I)I

    move-result v7

    .line 56
    .local v7, "res":I
    new-instance v0, Lcom/almworks/sqlite4java/SQLiteColumnMetadata;

    iget-object v1, p0, Lcom/almworks/sqlite4java/_SQLiteManual;->myString:[Ljava/lang/String;

    const/4 v2, 0x0

    aget-object v1, v1, v2

    iget-object v2, p0, Lcom/almworks/sqlite4java/_SQLiteManual;->myString:[Ljava/lang/String;

    const/4 v3, 0x1

    aget-object v2, v2, v3

    iget-object v3, p0, Lcom/almworks/sqlite4java/_SQLiteManual;->myInt:[I

    const/4 v4, 0x0

    aget v3, v3, v4

    const/4 v4, 0x1

    if-ne v3, v4, :cond_0

    const/4 v3, 0x1

    :goto_0
    iget-object v4, p0, Lcom/almworks/sqlite4java/_SQLiteManual;->myInt:[I

    const/4 v5, 0x1

    aget v4, v4, v5

    const/4 v5, 0x1

    if-ne v4, v5, :cond_1

    const/4 v4, 0x1

    :goto_1
    iget-object v5, p0, Lcom/almworks/sqlite4java/_SQLiteManual;->myInt:[I

    const/4 v6, 0x2

    aget v5, v5, v6

    const/4 v6, 0x1

    if-ne v5, v6, :cond_2

    const/4 v5, 0x1

    :goto_2
    invoke-direct/range {v0 .. v5}, Lcom/almworks/sqlite4java/SQLiteColumnMetadata;-><init>(Ljava/lang/String;Ljava/lang/String;ZZZ)V

    .line 57
    .local v0, "columnMetadata":Lcom/almworks/sqlite4java/SQLiteColumnMetadata;
    iget-object v1, p0, Lcom/almworks/sqlite4java/_SQLiteManual;->myString:[Ljava/lang/String;

    const/4 v2, 0x0

    const/4 v3, 0x0

    aput-object v3, v1, v2

    .line 58
    iget-object v1, p0, Lcom/almworks/sqlite4java/_SQLiteManual;->myString:[Ljava/lang/String;

    const/4 v2, 0x1

    const/4 v3, 0x0

    aput-object v3, v1, v2

    .line 59
    iget-object v1, p0, Lcom/almworks/sqlite4java/_SQLiteManual;->myInt:[I

    const/4 v2, 0x0

    const/4 v3, 0x0

    aput v3, v1, v2

    .line 60
    iget-object v1, p0, Lcom/almworks/sqlite4java/_SQLiteManual;->myInt:[I

    const/4 v2, 0x1

    const/4 v3, 0x0

    aput v3, v1, v2

    .line 61
    iget-object v1, p0, Lcom/almworks/sqlite4java/_SQLiteManual;->myInt:[I

    const/4 v2, 0x2

    const/4 v3, 0x0

    aput v3, v1, v2

    .line 62
    if-eqz v7, :cond_3

    .line 63
    new-instance v1, Lcom/almworks/sqlite4java/SQLiteException;

    const-string v2, "failed calling sqlite3_table_column_metadata()"

    invoke-direct {v1, v7, v2}, Lcom/almworks/sqlite4java/SQLiteException;-><init>(ILjava/lang/String;)V

    throw v1

    .line 56
    .end local v0    # "columnMetadata":Lcom/almworks/sqlite4java/SQLiteColumnMetadata;
    :cond_0
    const/4 v3, 0x0

    goto :goto_0

    :cond_1
    const/4 v4, 0x0

    goto :goto_1

    :cond_2
    const/4 v5, 0x0

    goto :goto_2

    .line 64
    .restart local v0    # "columnMetadata":Lcom/almworks/sqlite4java/SQLiteColumnMetadata;
    :cond_3
    return-object v0
.end method

.method public wrapper_alloc(I)Lcom/almworks/sqlite4java/DirectBuffer;
    .locals 12
    .param p1, "size"    # I

    .prologue
    const-wide/16 v10, 0x0

    const/4 v8, 0x1

    const/4 v5, 0x0

    const/4 v7, 0x0

    .line 142
    iput v7, p0, Lcom/almworks/sqlite4java/_SQLiteManual;->myLastReturnCode:I

    .line 143
    iget-object v4, p0, Lcom/almworks/sqlite4java/_SQLiteManual;->myLong:[J

    aput-wide v10, v4, v7

    .line 144
    iget-object v4, p0, Lcom/almworks/sqlite4java/_SQLiteManual;->myObject:[Ljava/lang/Object;

    aput-object v5, v4, v7

    .line 145
    iget-object v4, p0, Lcom/almworks/sqlite4java/_SQLiteManual;->myObject:[Ljava/lang/Object;

    aput-object v5, v4, v8

    .line 146
    iget-object v4, p0, Lcom/almworks/sqlite4java/_SQLiteManual;->myLong:[J

    iget-object v6, p0, Lcom/almworks/sqlite4java/_SQLiteManual;->myObject:[Ljava/lang/Object;

    invoke-static {p1, v4, v6}, Lcom/almworks/sqlite4java/_SQLiteManualJNI;->wrapper_alloc(I[J[Ljava/lang/Object;)I

    move-result v4

    iput v4, p0, Lcom/almworks/sqlite4java/_SQLiteManual;->myLastReturnCode:I

    .line 147
    iget-object v4, p0, Lcom/almworks/sqlite4java/_SQLiteManual;->myObject:[Ljava/lang/Object;

    aget-object v4, v4, v7

    instance-of v4, v4, Ljava/nio/ByteBuffer;

    if-eqz v4, :cond_1

    iget-object v4, p0, Lcom/almworks/sqlite4java/_SQLiteManual;->myObject:[Ljava/lang/Object;

    aget-object v4, v4, v7

    check-cast v4, Ljava/nio/ByteBuffer;

    move-object v0, v4

    .line 148
    .local v0, "controlBuffer":Ljava/nio/ByteBuffer;
    :goto_0
    iget-object v4, p0, Lcom/almworks/sqlite4java/_SQLiteManual;->myObject:[Ljava/lang/Object;

    aget-object v4, v4, v8

    instance-of v4, v4, Ljava/nio/ByteBuffer;

    if-eqz v4, :cond_2

    iget-object v4, p0, Lcom/almworks/sqlite4java/_SQLiteManual;->myObject:[Ljava/lang/Object;

    aget-object v4, v4, v8

    check-cast v4, Ljava/nio/ByteBuffer;

    move-object v1, v4

    .line 149
    .local v1, "dataBuffer":Ljava/nio/ByteBuffer;
    :goto_1
    iget-object v4, p0, Lcom/almworks/sqlite4java/_SQLiteManual;->myLong:[J

    aget-wide v2, v4, v7

    .line 150
    .local v2, "ptr":J
    if-eqz v0, :cond_0

    if-eqz v1, :cond_0

    cmp-long v4, v2, v10

    if-nez v4, :cond_3

    .line 153
    :cond_0
    :goto_2
    return-object v5

    .end local v0    # "controlBuffer":Ljava/nio/ByteBuffer;
    .end local v1    # "dataBuffer":Ljava/nio/ByteBuffer;
    .end local v2    # "ptr":J
    :cond_1
    move-object v0, v5

    .line 147
    goto :goto_0

    .restart local v0    # "controlBuffer":Ljava/nio/ByteBuffer;
    :cond_2
    move-object v1, v5

    .line 148
    goto :goto_1

    .line 153
    .restart local v1    # "dataBuffer":Ljava/nio/ByteBuffer;
    .restart local v2    # "ptr":J
    :cond_3
    new-instance v5, Lcom/almworks/sqlite4java/DirectBuffer;

    new-instance v4, Lcom/almworks/sqlite4java/SWIGTYPE_p_direct_buffer;

    invoke-direct {v4, v2, v3, v8}, Lcom/almworks/sqlite4java/SWIGTYPE_p_direct_buffer;-><init>(JZ)V

    invoke-direct {v5, v4, v0, v1, p1}, Lcom/almworks/sqlite4java/DirectBuffer;-><init>(Lcom/almworks/sqlite4java/SWIGTYPE_p_direct_buffer;Ljava/nio/ByteBuffer;Ljava/nio/ByteBuffer;I)V

    goto :goto_2
.end method

.method public wrapper_column_buffer(Lcom/almworks/sqlite4java/SWIGTYPE_p_sqlite3_stmt;I)Ljava/nio/ByteBuffer;
    .locals 6
    .param p1, "stmt"    # Lcom/almworks/sqlite4java/SWIGTYPE_p_sqlite3_stmt;
    .param p2, "column"    # I

    .prologue
    const/4 v2, 0x0

    const/4 v3, 0x0

    .line 174
    iput v3, p0, Lcom/almworks/sqlite4java/_SQLiteManual;->myLastReturnCode:I

    .line 175
    iget-object v1, p0, Lcom/almworks/sqlite4java/_SQLiteManual;->myObject:[Ljava/lang/Object;

    aput-object v2, v1, v3

    .line 176
    invoke-static {p1}, Lcom/almworks/sqlite4java/SWIGTYPE_p_sqlite3_stmt;->getCPtr(Lcom/almworks/sqlite4java/SWIGTYPE_p_sqlite3_stmt;)J

    move-result-wide v4

    iget-object v1, p0, Lcom/almworks/sqlite4java/_SQLiteManual;->myObject:[Ljava/lang/Object;

    invoke-static {v4, v5, p2, v1}, Lcom/almworks/sqlite4java/_SQLiteManualJNI;->wrapper_column_buffer(JI[Ljava/lang/Object;)I

    move-result v1

    iput v1, p0, Lcom/almworks/sqlite4java/_SQLiteManual;->myLastReturnCode:I

    .line 177
    iget-object v1, p0, Lcom/almworks/sqlite4java/_SQLiteManual;->myObject:[Ljava/lang/Object;

    aget-object v1, v1, v3

    instance-of v1, v1, Ljava/nio/ByteBuffer;

    if-eqz v1, :cond_0

    iget-object v1, p0, Lcom/almworks/sqlite4java/_SQLiteManual;->myObject:[Ljava/lang/Object;

    aget-object v1, v1, v3

    check-cast v1, Ljava/nio/ByteBuffer;

    move-object v0, v1

    .line 178
    .local v0, "r":Ljava/nio/ByteBuffer;
    :goto_0
    iget-object v1, p0, Lcom/almworks/sqlite4java/_SQLiteManual;->myObject:[Ljava/lang/Object;

    aput-object v2, v1, v3

    .line 179
    return-object v0

    .end local v0    # "r":Ljava/nio/ByteBuffer;
    :cond_0
    move-object v0, v2

    .line 177
    goto :goto_0
.end method

.method public wrapper_load_ints(Lcom/almworks/sqlite4java/SWIGTYPE_p_sqlite3_stmt;I[III)I
    .locals 9
    .param p1, "stmt"    # Lcom/almworks/sqlite4java/SWIGTYPE_p_sqlite3_stmt;
    .param p2, "column"    # I
    .param p3, "buffer"    # [I
    .param p4, "offset"    # I
    .param p5, "count"    # I

    .prologue
    const/4 v8, 0x0

    .line 204
    iput v8, p0, Lcom/almworks/sqlite4java/_SQLiteManual;->myLastReturnCode:I

    .line 205
    iget-object v0, p0, Lcom/almworks/sqlite4java/_SQLiteManual;->myInt:[I

    aput v8, v0, v8

    .line 206
    invoke-static {p1}, Lcom/almworks/sqlite4java/SWIGTYPE_p_sqlite3_stmt;->getCPtr(Lcom/almworks/sqlite4java/SWIGTYPE_p_sqlite3_stmt;)J

    move-result-wide v0

    iget-object v6, p0, Lcom/almworks/sqlite4java/_SQLiteManual;->myInt:[I

    move v2, p2

    move-object v3, p3

    move v4, p4

    move v5, p5

    invoke-static/range {v0 .. v6}, Lcom/almworks/sqlite4java/_SQLiteManualJNI;->wrapper_load_ints(JI[III[I)I

    move-result v0

    iput v0, p0, Lcom/almworks/sqlite4java/_SQLiteManual;->myLastReturnCode:I

    .line 207
    iget-object v0, p0, Lcom/almworks/sqlite4java/_SQLiteManual;->myInt:[I

    aget v7, v0, v8

    .line 208
    .local v7, "r":I
    iget-object v0, p0, Lcom/almworks/sqlite4java/_SQLiteManual;->myInt:[I

    aput v8, v0, v8

    .line 209
    return v7
.end method

.method public wrapper_load_longs(Lcom/almworks/sqlite4java/SWIGTYPE_p_sqlite3_stmt;I[JII)I
    .locals 9
    .param p1, "stmt"    # Lcom/almworks/sqlite4java/SWIGTYPE_p_sqlite3_stmt;
    .param p2, "column"    # I
    .param p3, "buffer"    # [J
    .param p4, "offset"    # I
    .param p5, "count"    # I

    .prologue
    const/4 v8, 0x0

    .line 213
    iput v8, p0, Lcom/almworks/sqlite4java/_SQLiteManual;->myLastReturnCode:I

    .line 214
    iget-object v0, p0, Lcom/almworks/sqlite4java/_SQLiteManual;->myInt:[I

    aput v8, v0, v8

    .line 215
    invoke-static {p1}, Lcom/almworks/sqlite4java/SWIGTYPE_p_sqlite3_stmt;->getCPtr(Lcom/almworks/sqlite4java/SWIGTYPE_p_sqlite3_stmt;)J

    move-result-wide v0

    iget-object v6, p0, Lcom/almworks/sqlite4java/_SQLiteManual;->myInt:[I

    move v2, p2

    move-object v3, p3

    move v4, p4

    move v5, p5

    invoke-static/range {v0 .. v6}, Lcom/almworks/sqlite4java/_SQLiteManualJNI;->wrapper_load_longs(JI[JII[I)I

    move-result v0

    iput v0, p0, Lcom/almworks/sqlite4java/_SQLiteManual;->myLastReturnCode:I

    .line 216
    iget-object v0, p0, Lcom/almworks/sqlite4java/_SQLiteManual;->myInt:[I

    aget v7, v0, v8

    .line 217
    .local v7, "r":I
    iget-object v0, p0, Lcom/almworks/sqlite4java/_SQLiteManual;->myInt:[I

    aput v8, v0, v8

    .line 218
    return v7
.end method
