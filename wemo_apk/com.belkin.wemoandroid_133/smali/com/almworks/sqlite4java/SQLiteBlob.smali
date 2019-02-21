.class public final Lcom/almworks/sqlite4java/SQLiteBlob;
.super Ljava/lang/Object;
.source "SQLiteBlob.java"


# static fields
.field static final synthetic $assertionsDisabled:Z


# instance fields
.field private myController:Lcom/almworks/sqlite4java/SQLiteController;

.field private myHandle:Lcom/almworks/sqlite4java/SWIGTYPE_p_sqlite3_blob;

.field private myLength:I

.field private final myName:Ljava/lang/String;

.field private final myWriteAccess:Z


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 35
    const-class v0, Lcom/almworks/sqlite4java/SQLiteBlob;

    invoke-virtual {v0}, Ljava/lang/Class;->desiredAssertionStatus()Z

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    sput-boolean v0, Lcom/almworks/sqlite4java/SQLiteBlob;->$assertionsDisabled:Z

    return-void

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method constructor <init>(Lcom/almworks/sqlite4java/SQLiteController;Lcom/almworks/sqlite4java/SWIGTYPE_p_sqlite3_blob;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;JZ)V
    .locals 2
    .param p1, "controller"    # Lcom/almworks/sqlite4java/SQLiteController;
    .param p2, "handle"    # Lcom/almworks/sqlite4java/SWIGTYPE_p_sqlite3_blob;
    .param p3, "dbname"    # Ljava/lang/String;
    .param p4, "table"    # Ljava/lang/String;
    .param p5, "column"    # Ljava/lang/String;
    .param p6, "rowid"    # J
    .param p8, "writeAccess"    # Z

    .prologue
    .line 63
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 59
    const/4 v0, -0x1

    iput v0, p0, Lcom/almworks/sqlite4java/SQLiteBlob;->myLength:I

    .line 64
    sget-boolean v0, Lcom/almworks/sqlite4java/SQLiteBlob;->$assertionsDisabled:Z

    if-nez v0, :cond_0

    if-nez p1, :cond_0

    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0

    .line 65
    :cond_0
    sget-boolean v0, Lcom/almworks/sqlite4java/SQLiteBlob;->$assertionsDisabled:Z

    if-nez v0, :cond_1

    if-nez p2, :cond_1

    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0

    .line 66
    :cond_1
    iput-object p1, p0, Lcom/almworks/sqlite4java/SQLiteBlob;->myController:Lcom/almworks/sqlite4java/SQLiteController;

    .line 67
    iput-object p2, p0, Lcom/almworks/sqlite4java/SQLiteBlob;->myHandle:Lcom/almworks/sqlite4java/SWIGTYPE_p_sqlite3_blob;

    .line 68
    iput-boolean p8, p0, Lcom/almworks/sqlite4java/SQLiteBlob;->myWriteAccess:Z

    .line 69
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "."

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "."

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ":"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p6, p7}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/almworks/sqlite4java/SQLiteBlob;->myName:Ljava/lang/String;

    .line 70
    return-void
.end method

.method private handle()Lcom/almworks/sqlite4java/SWIGTYPE_p_sqlite3_blob;
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/almworks/sqlite4java/SQLiteException;
        }
    .end annotation

    .prologue
    .line 196
    iget-object v0, p0, Lcom/almworks/sqlite4java/SQLiteBlob;->myHandle:Lcom/almworks/sqlite4java/SWIGTYPE_p_sqlite3_blob;

    .line 197
    .local v0, "handle":Lcom/almworks/sqlite4java/SWIGTYPE_p_sqlite3_blob;
    if-nez v0, :cond_0

    .line 198
    new-instance v1, Lcom/almworks/sqlite4java/SQLiteException;

    const/16 v2, -0x5d

    const/4 v3, 0x0

    invoke-direct {v1, v2, v3}, Lcom/almworks/sqlite4java/SQLiteException;-><init>(ILjava/lang/String;)V

    throw v1

    .line 200
    :cond_0
    return-object v0
.end method


# virtual methods
.method blobHandle()Lcom/almworks/sqlite4java/SWIGTYPE_p_sqlite3_blob;
    .locals 1

    .prologue
    .line 204
    iget-object v0, p0, Lcom/almworks/sqlite4java/SQLiteBlob;->myHandle:Lcom/almworks/sqlite4java/SWIGTYPE_p_sqlite3_blob;

    return-object v0
.end method

.method clear()V
    .locals 1

    .prologue
    .line 211
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/almworks/sqlite4java/SQLiteBlob;->myHandle:Lcom/almworks/sqlite4java/SWIGTYPE_p_sqlite3_blob;

    .line 212
    iget-object v0, p0, Lcom/almworks/sqlite4java/SQLiteBlob;->myController:Lcom/almworks/sqlite4java/SQLiteController;

    invoke-static {v0}, Lcom/almworks/sqlite4java/SQLiteController;->getDisposed(Lcom/almworks/sqlite4java/SQLiteController;)Lcom/almworks/sqlite4java/SQLiteController;

    move-result-object v0

    iput-object v0, p0, Lcom/almworks/sqlite4java/SQLiteBlob;->myController:Lcom/almworks/sqlite4java/SQLiteController;

    .line 213
    const-string v0, "cleared"

    invoke-static {p0, v0}, Lcom/almworks/sqlite4java/Internal;->logFine(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 214
    return-void
.end method

.method public dispose()V
    .locals 3

    .prologue
    .line 79
    iget-object v1, p0, Lcom/almworks/sqlite4java/SQLiteBlob;->myHandle:Lcom/almworks/sqlite4java/SWIGTYPE_p_sqlite3_blob;

    if-nez v1, :cond_0

    .line 91
    :goto_0
    return-void

    .line 82
    :cond_0
    :try_start_0
    iget-object v1, p0, Lcom/almworks/sqlite4java/SQLiteBlob;->myController:Lcom/almworks/sqlite4java/SQLiteController;

    invoke-virtual {v1}, Lcom/almworks/sqlite4java/SQLiteController;->validate()V
    :try_end_0
    .catch Lcom/almworks/sqlite4java/SQLiteException; {:try_start_0 .. :try_end_0} :catch_0

    .line 87
    const-string v1, "disposing"

    invoke-static {p0, v1}, Lcom/almworks/sqlite4java/Internal;->logFine(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 88
    iget-object v1, p0, Lcom/almworks/sqlite4java/SQLiteBlob;->myController:Lcom/almworks/sqlite4java/SQLiteController;

    invoke-virtual {v1, p0}, Lcom/almworks/sqlite4java/SQLiteController;->dispose(Lcom/almworks/sqlite4java/SQLiteBlob;)V

    .line 90
    invoke-virtual {p0}, Lcom/almworks/sqlite4java/SQLiteBlob;->clear()V

    goto :goto_0

    .line 83
    :catch_0
    move-exception v0

    .line 84
    .local v0, "e":Lcom/almworks/sqlite4java/SQLiteException;
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "invalid dispose: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    const/4 v2, 0x1

    invoke-static {p0, v1, v2}, Lcom/almworks/sqlite4java/Internal;->recoverableError(Ljava/lang/Object;Ljava/lang/String;Z)V

    goto :goto_0
.end method

.method public getSize()I
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/almworks/sqlite4java/SQLiteException;
        }
    .end annotation

    .prologue
    .line 109
    iget-object v0, p0, Lcom/almworks/sqlite4java/SQLiteBlob;->myController:Lcom/almworks/sqlite4java/SQLiteController;

    invoke-virtual {v0}, Lcom/almworks/sqlite4java/SQLiteController;->validate()V

    .line 110
    iget v0, p0, Lcom/almworks/sqlite4java/SQLiteBlob;->myLength:I

    if-gez v0, :cond_0

    .line 111
    invoke-direct {p0}, Lcom/almworks/sqlite4java/SQLiteBlob;->handle()Lcom/almworks/sqlite4java/SWIGTYPE_p_sqlite3_blob;

    move-result-object v0

    invoke-static {v0}, Lcom/almworks/sqlite4java/_SQLiteSwigged;->sqlite3_blob_bytes(Lcom/almworks/sqlite4java/SWIGTYPE_p_sqlite3_blob;)I

    move-result v0

    iput v0, p0, Lcom/almworks/sqlite4java/SQLiteBlob;->myLength:I

    .line 113
    :cond_0
    iget v0, p0, Lcom/almworks/sqlite4java/SQLiteBlob;->myLength:I

    return v0
.end method

.method public isDisposed()Z
    .locals 1

    .prologue
    .line 99
    iget-object v0, p0, Lcom/almworks/sqlite4java/SQLiteBlob;->myHandle:Lcom/almworks/sqlite4java/SWIGTYPE_p_sqlite3_blob;

    if-nez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public isWriteAllowed()Z
    .locals 1

    .prologue
    .line 177
    iget-boolean v0, p0, Lcom/almworks/sqlite4java/SQLiteBlob;->myWriteAccess:Z

    return v0
.end method

.method public read(I[BII)V
    .locals 4
    .param p1, "blobOffset"    # I
    .param p2, "buffer"    # [B
    .param p3, "offset"    # I
    .param p4, "length"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/almworks/sqlite4java/SQLiteException;
        }
    .end annotation

    .prologue
    .line 130
    if-nez p2, :cond_0

    .line 131
    new-instance v1, Ljava/lang/NullPointerException;

    invoke-direct {v1}, Ljava/lang/NullPointerException;-><init>()V

    throw v1

    .line 132
    :cond_0
    if-ltz p3, :cond_1

    add-int v1, p3, p4

    array-length v2, p2

    if-le v1, v2, :cond_2

    .line 133
    :cond_1
    new-instance v1, Ljava/lang/ArrayIndexOutOfBoundsException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    array-length v3, p2

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/ArrayIndexOutOfBoundsException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 134
    :cond_2
    iget-object v1, p0, Lcom/almworks/sqlite4java/SQLiteBlob;->myController:Lcom/almworks/sqlite4java/SQLiteController;

    invoke-virtual {v1}, Lcom/almworks/sqlite4java/SQLiteController;->validate()V

    .line 135
    invoke-static {}, Lcom/almworks/sqlite4java/Internal;->isFineLogging()Z

    move-result v1

    if-eqz v1, :cond_3

    .line 136
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "read["

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ","

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "]"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {p0, v1}, Lcom/almworks/sqlite4java/Internal;->logFine(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 137
    :cond_3
    invoke-direct {p0}, Lcom/almworks/sqlite4java/SQLiteBlob;->handle()Lcom/almworks/sqlite4java/SWIGTYPE_p_sqlite3_blob;

    move-result-object v1

    invoke-static {v1, p1, p2, p3, p4}, Lcom/almworks/sqlite4java/_SQLiteManual;->sqlite3_blob_read(Lcom/almworks/sqlite4java/SWIGTYPE_p_sqlite3_blob;I[BII)I

    move-result v0

    .line 138
    .local v0, "rc":I
    iget-object v1, p0, Lcom/almworks/sqlite4java/SQLiteBlob;->myController:Lcom/almworks/sqlite4java/SQLiteController;

    const-string v2, "read"

    invoke-virtual {v1, v0, v2, p0}, Lcom/almworks/sqlite4java/SQLiteController;->throwResult(ILjava/lang/String;Ljava/lang/Object;)V

    .line 139
    return-void
.end method

.method public reopen(J)V
    .locals 3
    .param p1, "rowid"    # J
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/almworks/sqlite4java/SQLiteException;
        }
    .end annotation

    .prologue
    .line 188
    iget-object v1, p0, Lcom/almworks/sqlite4java/SQLiteBlob;->myController:Lcom/almworks/sqlite4java/SQLiteController;

    invoke-virtual {v1}, Lcom/almworks/sqlite4java/SQLiteController;->validate()V

    .line 189
    invoke-static {}, Lcom/almworks/sqlite4java/Internal;->isFineLogging()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 190
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "reopen["

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1, p2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "]"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {p0, v1}, Lcom/almworks/sqlite4java/Internal;->logFine(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 191
    :cond_0
    invoke-direct {p0}, Lcom/almworks/sqlite4java/SQLiteBlob;->handle()Lcom/almworks/sqlite4java/SWIGTYPE_p_sqlite3_blob;

    move-result-object v1

    invoke-static {v1, p1, p2}, Lcom/almworks/sqlite4java/_SQLiteSwigged;->sqlite3_blob_reopen(Lcom/almworks/sqlite4java/SWIGTYPE_p_sqlite3_blob;J)I

    move-result v0

    .line 192
    .local v0, "rc":I
    iget-object v1, p0, Lcom/almworks/sqlite4java/SQLiteBlob;->myController:Lcom/almworks/sqlite4java/SQLiteController;

    const-string v2, "reopen"

    invoke-virtual {v1, v0, v2, p0}, Lcom/almworks/sqlite4java/SQLiteController;->throwResult(ILjava/lang/String;Ljava/lang/Object;)V

    .line 193
    return-void
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .prologue
    .line 217
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "["

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/almworks/sqlite4java/SQLiteBlob;->myName:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "]"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/almworks/sqlite4java/SQLiteBlob;->myController:Lcom/almworks/sqlite4java/SQLiteController;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public write(I[BII)V
    .locals 4
    .param p1, "blobOffset"    # I
    .param p2, "buffer"    # [B
    .param p3, "offset"    # I
    .param p4, "length"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/almworks/sqlite4java/SQLiteException;
        }
    .end annotation

    .prologue
    .line 160
    if-nez p2, :cond_0

    .line 161
    new-instance v1, Ljava/lang/NullPointerException;

    invoke-direct {v1}, Ljava/lang/NullPointerException;-><init>()V

    throw v1

    .line 162
    :cond_0
    if-ltz p3, :cond_1

    add-int v1, p3, p4

    array-length v2, p2

    if-le v1, v2, :cond_2

    .line 163
    :cond_1
    new-instance v1, Ljava/lang/ArrayIndexOutOfBoundsException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    array-length v3, p2

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/ArrayIndexOutOfBoundsException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 164
    :cond_2
    iget-object v1, p0, Lcom/almworks/sqlite4java/SQLiteBlob;->myController:Lcom/almworks/sqlite4java/SQLiteController;

    invoke-virtual {v1}, Lcom/almworks/sqlite4java/SQLiteController;->validate()V

    .line 165
    invoke-static {}, Lcom/almworks/sqlite4java/Internal;->isFineLogging()Z

    move-result v1

    if-eqz v1, :cond_3

    .line 166
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "write["

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ","

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "]"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {p0, v1}, Lcom/almworks/sqlite4java/Internal;->logFine(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 167
    :cond_3
    invoke-direct {p0}, Lcom/almworks/sqlite4java/SQLiteBlob;->handle()Lcom/almworks/sqlite4java/SWIGTYPE_p_sqlite3_blob;

    move-result-object v1

    invoke-static {v1, p1, p2, p3, p4}, Lcom/almworks/sqlite4java/_SQLiteManual;->sqlite3_blob_write(Lcom/almworks/sqlite4java/SWIGTYPE_p_sqlite3_blob;I[BII)I

    move-result v0

    .line 168
    .local v0, "rc":I
    iget-object v1, p0, Lcom/almworks/sqlite4java/SQLiteBlob;->myController:Lcom/almworks/sqlite4java/SQLiteController;

    const-string v2, "write"

    invoke-virtual {v1, v0, v2, p0}, Lcom/almworks/sqlite4java/SQLiteController;->throwResult(ILjava/lang/String;Ljava/lang/Object;)V

    .line 169
    return-void
.end method
