.class public abstract Lcom/belkin/wemo/sqlite/WeMoSqliteOpenHelper;
.super Ljava/lang/Object;
.source "WeMoSqliteOpenHelper.java"


# static fields
.field private static final TAG:Ljava/lang/String;


# instance fields
.field private final mContext:Landroid/content/Context;

.field private mDatabase:Landroid/database/sqlite/SQLiteDatabase;

.field private mEnableWriteAheadLogging:Z

.field private final mErrorHandler:Landroid/database/DatabaseErrorHandler;

.field private final mFactory:Landroid/database/sqlite/SQLiteDatabase$CursorFactory;

.field private mIsInitializing:Z

.field private final mName:Ljava/lang/String;

.field private final mNewVersion:I


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 33
    const-class v0, Lcom/belkin/wemo/sqlite/WeMoSqliteOpenHelper;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/belkin/wemo/sqlite/WeMoSqliteOpenHelper;->TAG:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Ljava/lang/String;Landroid/database/sqlite/SQLiteDatabase$CursorFactory;I)V
    .locals 6
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "name"    # Ljava/lang/String;
    .param p3, "factory"    # Landroid/database/sqlite/SQLiteDatabase$CursorFactory;
    .param p4, "version"    # I

    .prologue
    .line 60
    const/4 v5, 0x0

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move-object v3, p3

    move v4, p4

    invoke-direct/range {v0 .. v5}, Lcom/belkin/wemo/sqlite/WeMoSqliteOpenHelper;-><init>(Landroid/content/Context;Ljava/lang/String;Landroid/database/sqlite/SQLiteDatabase$CursorFactory;ILandroid/database/DatabaseErrorHandler;)V

    .line 61
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Ljava/lang/String;Landroid/database/sqlite/SQLiteDatabase$CursorFactory;ILandroid/database/DatabaseErrorHandler;)V
    .locals 3
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "name"    # Ljava/lang/String;
    .param p3, "factory"    # Landroid/database/sqlite/SQLiteDatabase$CursorFactory;
    .param p4, "version"    # I
    .param p5, "errorHandler"    # Landroid/database/DatabaseErrorHandler;

    .prologue
    .line 81
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 82
    const/4 v0, 0x1

    if-ge p4, v0, :cond_0

    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Version must be >= 1, was "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 84
    :cond_0
    iput-object p1, p0, Lcom/belkin/wemo/sqlite/WeMoSqliteOpenHelper;->mContext:Landroid/content/Context;

    .line 85
    iput-object p2, p0, Lcom/belkin/wemo/sqlite/WeMoSqliteOpenHelper;->mName:Ljava/lang/String;

    .line 86
    iput-object p3, p0, Lcom/belkin/wemo/sqlite/WeMoSqliteOpenHelper;->mFactory:Landroid/database/sqlite/SQLiteDatabase$CursorFactory;

    .line 87
    iput p4, p0, Lcom/belkin/wemo/sqlite/WeMoSqliteOpenHelper;->mNewVersion:I

    .line 88
    iput-object p5, p0, Lcom/belkin/wemo/sqlite/WeMoSqliteOpenHelper;->mErrorHandler:Landroid/database/DatabaseErrorHandler;

    .line 89
    return-void
.end method

.method private getDatabaseLocked()Landroid/database/sqlite/SQLiteDatabase;
    .locals 8

    .prologue
    const/4 v4, 0x0

    const/4 v7, 0x0

    .line 136
    iget-object v3, p0, Lcom/belkin/wemo/sqlite/WeMoSqliteOpenHelper;->mDatabase:Landroid/database/sqlite/SQLiteDatabase;

    if-eqz v3, :cond_0

    .line 137
    iget-object v3, p0, Lcom/belkin/wemo/sqlite/WeMoSqliteOpenHelper;->mDatabase:Landroid/database/sqlite/SQLiteDatabase;

    invoke-virtual {v3}, Landroid/database/sqlite/SQLiteDatabase;->isOpen()Z

    move-result v3

    if-nez v3, :cond_1

    .line 139
    iput-object v4, p0, Lcom/belkin/wemo/sqlite/WeMoSqliteOpenHelper;->mDatabase:Landroid/database/sqlite/SQLiteDatabase;

    .line 146
    :cond_0
    iget-boolean v3, p0, Lcom/belkin/wemo/sqlite/WeMoSqliteOpenHelper;->mIsInitializing:Z

    if-eqz v3, :cond_3

    .line 147
    new-instance v3, Ljava/lang/IllegalStateException;

    const-string v4, "getDatabase called recursively"

    invoke-direct {v3, v4}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 140
    :cond_1
    iget-object v3, p0, Lcom/belkin/wemo/sqlite/WeMoSqliteOpenHelper;->mDatabase:Landroid/database/sqlite/SQLiteDatabase;

    invoke-virtual {v3}, Landroid/database/sqlite/SQLiteDatabase;->isReadOnly()Z

    move-result v3

    if-nez v3, :cond_0

    .line 142
    iget-object v0, p0, Lcom/belkin/wemo/sqlite/WeMoSqliteOpenHelper;->mDatabase:Landroid/database/sqlite/SQLiteDatabase;

    .line 202
    :cond_2
    :goto_0
    return-object v0

    .line 150
    :cond_3
    iget-object v0, p0, Lcom/belkin/wemo/sqlite/WeMoSqliteOpenHelper;->mDatabase:Landroid/database/sqlite/SQLiteDatabase;

    .line 152
    .local v0, "db":Landroid/database/sqlite/SQLiteDatabase;
    const/4 v3, 0x1

    :try_start_0
    iput-boolean v3, p0, Lcom/belkin/wemo/sqlite/WeMoSqliteOpenHelper;->mIsInitializing:Z

    .line 154
    if-nez v0, :cond_4

    .line 155
    iget-object v3, p0, Lcom/belkin/wemo/sqlite/WeMoSqliteOpenHelper;->mName:Ljava/lang/String;

    invoke-static {v3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v3

    if-eqz v3, :cond_6

    .line 156
    const/4 v3, 0x0

    invoke-static {v3}, Landroid/database/sqlite/SQLiteDatabase;->create(Landroid/database/sqlite/SQLiteDatabase$CursorFactory;)Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v0

    .line 157
    sget-object v3, Lcom/belkin/wemo/sqlite/WeMoSqliteOpenHelper;->TAG:Ljava/lang/String;

    const-string v4, "A memory backed database has been created since Dataname is NULL"

    invoke-static {v3, v4}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->debugLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 172
    :cond_4
    :goto_1
    invoke-virtual {p0, v0}, Lcom/belkin/wemo/sqlite/WeMoSqliteOpenHelper;->onConfigure(Landroid/database/sqlite/SQLiteDatabase;)V

    .line 174
    invoke-virtual {v0}, Landroid/database/sqlite/SQLiteDatabase;->getVersion()I

    move-result v2

    .line 175
    .local v2, "version":I
    iget v3, p0, Lcom/belkin/wemo/sqlite/WeMoSqliteOpenHelper;->mNewVersion:I

    if-eq v2, v3, :cond_5

    .line 177
    invoke-virtual {v0}, Landroid/database/sqlite/SQLiteDatabase;->beginTransaction()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 179
    if-nez v2, :cond_8

    .line 180
    :try_start_1
    invoke-virtual {p0, v0}, Lcom/belkin/wemo/sqlite/WeMoSqliteOpenHelper;->onCreate(Landroid/database/sqlite/SQLiteDatabase;)V

    .line 188
    :goto_2
    iget v3, p0, Lcom/belkin/wemo/sqlite/WeMoSqliteOpenHelper;->mNewVersion:I

    invoke-virtual {v0, v3}, Landroid/database/sqlite/SQLiteDatabase;->setVersion(I)V

    .line 189
    invoke-virtual {v0}, Landroid/database/sqlite/SQLiteDatabase;->setTransactionSuccessful()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 191
    :try_start_2
    invoke-virtual {v0}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    .line 195
    :cond_5
    invoke-virtual {p0, v0}, Lcom/belkin/wemo/sqlite/WeMoSqliteOpenHelper;->onOpen(Landroid/database/sqlite/SQLiteDatabase;)V

    .line 197
    iput-object v0, p0, Lcom/belkin/wemo/sqlite/WeMoSqliteOpenHelper;->mDatabase:Landroid/database/sqlite/SQLiteDatabase;
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 200
    iput-boolean v7, p0, Lcom/belkin/wemo/sqlite/WeMoSqliteOpenHelper;->mIsInitializing:Z

    .line 201
    if-eqz v0, :cond_2

    iget-object v3, p0, Lcom/belkin/wemo/sqlite/WeMoSqliteOpenHelper;->mDatabase:Landroid/database/sqlite/SQLiteDatabase;

    if-eq v0, v3, :cond_2

    .line 202
    invoke-virtual {v0}, Landroid/database/sqlite/SQLiteDatabase;->close()V

    goto :goto_0

    .line 160
    .end local v2    # "version":I
    :cond_6
    :try_start_3
    iget-object v3, p0, Lcom/belkin/wemo/sqlite/WeMoSqliteOpenHelper;->mName:Ljava/lang/String;

    iget-object v4, p0, Lcom/belkin/wemo/sqlite/WeMoSqliteOpenHelper;->mFactory:Landroid/database/sqlite/SQLiteDatabase$CursorFactory;

    const v5, 0x10000010

    iget-object v6, p0, Lcom/belkin/wemo/sqlite/WeMoSqliteOpenHelper;->mErrorHandler:Landroid/database/DatabaseErrorHandler;

    invoke-static {v3, v4, v5, v6}, Landroid/database/sqlite/SQLiteDatabase;->openDatabase(Ljava/lang/String;Landroid/database/sqlite/SQLiteDatabase$CursorFactory;ILandroid/database/DatabaseErrorHandler;)Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v0

    .line 165
    sget-object v3, Lcom/belkin/wemo/sqlite/WeMoSqliteOpenHelper;->TAG:Ljava/lang/String;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Database opened (created if necessary): "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget-object v5, p0, Lcom/belkin/wemo/sqlite/WeMoSqliteOpenHelper;->mName:Ljava/lang/String;

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->debugLog(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_3
    .catch Landroid/database/sqlite/SQLiteException; {:try_start_3 .. :try_end_3} :catch_0
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    goto :goto_1

    .line 166
    :catch_0
    move-exception v1

    .line 167
    .local v1, "ex":Landroid/database/sqlite/SQLiteException;
    :try_start_4
    throw v1
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    .line 200
    .end local v1    # "ex":Landroid/database/sqlite/SQLiteException;
    :catchall_0
    move-exception v3

    iput-boolean v7, p0, Lcom/belkin/wemo/sqlite/WeMoSqliteOpenHelper;->mIsInitializing:Z

    .line 201
    if-eqz v0, :cond_7

    iget-object v4, p0, Lcom/belkin/wemo/sqlite/WeMoSqliteOpenHelper;->mDatabase:Landroid/database/sqlite/SQLiteDatabase;

    if-eq v0, v4, :cond_7

    .line 202
    invoke-virtual {v0}, Landroid/database/sqlite/SQLiteDatabase;->close()V

    :cond_7
    throw v3

    .line 182
    .restart local v2    # "version":I
    :cond_8
    :try_start_5
    iget v3, p0, Lcom/belkin/wemo/sqlite/WeMoSqliteOpenHelper;->mNewVersion:I

    if-le v2, v3, :cond_9

    .line 183
    iget v3, p0, Lcom/belkin/wemo/sqlite/WeMoSqliteOpenHelper;->mNewVersion:I

    invoke-virtual {p0, v0, v2, v3}, Lcom/belkin/wemo/sqlite/WeMoSqliteOpenHelper;->onDowngrade(Landroid/database/sqlite/SQLiteDatabase;II)V
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_1

    goto :goto_2

    .line 191
    :catchall_1
    move-exception v3

    :try_start_6
    invoke-virtual {v0}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    throw v3
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_0

    .line 185
    :cond_9
    :try_start_7
    iget v3, p0, Lcom/belkin/wemo/sqlite/WeMoSqliteOpenHelper;->mNewVersion:I

    invoke-virtual {p0, v0, v2, v3}, Lcom/belkin/wemo/sqlite/WeMoSqliteOpenHelper;->onUpgrade(Landroid/database/sqlite/SQLiteDatabase;II)V
    :try_end_7
    .catchall {:try_start_7 .. :try_end_7} :catchall_1

    goto :goto_2
.end method


# virtual methods
.method public declared-synchronized close()V
    .locals 2

    .prologue
    .line 211
    monitor-enter p0

    :try_start_0
    iget-boolean v0, p0, Lcom/belkin/wemo/sqlite/WeMoSqliteOpenHelper;->mIsInitializing:Z

    if-eqz v0, :cond_0

    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "Closed during initialization"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0

    .line 213
    :cond_0
    :try_start_1
    iget-object v0, p0, Lcom/belkin/wemo/sqlite/WeMoSqliteOpenHelper;->mDatabase:Landroid/database/sqlite/SQLiteDatabase;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/belkin/wemo/sqlite/WeMoSqliteOpenHelper;->mDatabase:Landroid/database/sqlite/SQLiteDatabase;

    invoke-virtual {v0}, Landroid/database/sqlite/SQLiteDatabase;->isOpen()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 214
    iget-object v0, p0, Lcom/belkin/wemo/sqlite/WeMoSqliteOpenHelper;->mDatabase:Landroid/database/sqlite/SQLiteDatabase;

    invoke-virtual {v0}, Landroid/database/sqlite/SQLiteDatabase;->close()V

    .line 215
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/belkin/wemo/sqlite/WeMoSqliteOpenHelper;->mDatabase:Landroid/database/sqlite/SQLiteDatabase;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 217
    :cond_1
    monitor-exit p0

    return-void
.end method

.method public getDatabaseName()Ljava/lang/String;
    .locals 1

    .prologue
    .line 96
    iget-object v0, p0, Lcom/belkin/wemo/sqlite/WeMoSqliteOpenHelper;->mName:Ljava/lang/String;

    return-object v0
.end method

.method public getWritableDatabase()Landroid/database/sqlite/SQLiteDatabase;
    .locals 1

    .prologue
    .line 129
    monitor-enter p0

    .line 130
    :try_start_0
    invoke-direct {p0}, Lcom/belkin/wemo/sqlite/WeMoSqliteOpenHelper;->getDatabaseLocked()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v0

    monitor-exit p0

    return-object v0

    .line 131
    :catchall_0
    move-exception v0

    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method public onConfigure(Landroid/database/sqlite/SQLiteDatabase;)V
    .locals 0
    .param p1, "db"    # Landroid/database/sqlite/SQLiteDatabase;

    .prologue
    .line 236
    return-void
.end method

.method public abstract onCreate(Landroid/database/sqlite/SQLiteDatabase;)V
.end method

.method public onDowngrade(Landroid/database/sqlite/SQLiteDatabase;II)V
    .locals 3
    .param p1, "db"    # Landroid/database/sqlite/SQLiteDatabase;
    .param p2, "oldVersion"    # I
    .param p3, "newVersion"    # I

    .prologue
    .line 286
    new-instance v0, Landroid/database/sqlite/SQLiteException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Can\'t downgrade database from version "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " to "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/database/sqlite/SQLiteException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public onOpen(Landroid/database/sqlite/SQLiteDatabase;)V
    .locals 0
    .param p1, "db"    # Landroid/database/sqlite/SQLiteDatabase;

    .prologue
    .line 303
    return-void
.end method

.method public abstract onUpgrade(Landroid/database/sqlite/SQLiteDatabase;II)V
.end method

.method public setWriteAheadLoggingEnabled(Z)V
    .locals 1
    .param p1, "enabled"    # Z

    .prologue
    .line 111
    monitor-enter p0

    .line 112
    :try_start_0
    iget-boolean v0, p0, Lcom/belkin/wemo/sqlite/WeMoSqliteOpenHelper;->mEnableWriteAheadLogging:Z

    if-eq v0, p1, :cond_1

    .line 113
    iget-object v0, p0, Lcom/belkin/wemo/sqlite/WeMoSqliteOpenHelper;->mDatabase:Landroid/database/sqlite/SQLiteDatabase;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/belkin/wemo/sqlite/WeMoSqliteOpenHelper;->mDatabase:Landroid/database/sqlite/SQLiteDatabase;

    invoke-virtual {v0}, Landroid/database/sqlite/SQLiteDatabase;->isOpen()Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/belkin/wemo/sqlite/WeMoSqliteOpenHelper;->mDatabase:Landroid/database/sqlite/SQLiteDatabase;

    invoke-virtual {v0}, Landroid/database/sqlite/SQLiteDatabase;->isReadOnly()Z

    move-result v0

    if-nez v0, :cond_0

    .line 114
    if-eqz p1, :cond_2

    .line 115
    iget-object v0, p0, Lcom/belkin/wemo/sqlite/WeMoSqliteOpenHelper;->mDatabase:Landroid/database/sqlite/SQLiteDatabase;

    invoke-virtual {v0}, Landroid/database/sqlite/SQLiteDatabase;->enableWriteAheadLogging()Z

    .line 120
    :cond_0
    :goto_0
    iput-boolean p1, p0, Lcom/belkin/wemo/sqlite/WeMoSqliteOpenHelper;->mEnableWriteAheadLogging:Z

    .line 122
    :cond_1
    monitor-exit p0

    .line 123
    return-void

    .line 117
    :cond_2
    iget-object v0, p0, Lcom/belkin/wemo/sqlite/WeMoSqliteOpenHelper;->mDatabase:Landroid/database/sqlite/SQLiteDatabase;

    invoke-virtual {v0}, Landroid/database/sqlite/SQLiteDatabase;->disableWriteAheadLogging()V

    goto :goto_0

    .line 122
    :catchall_0
    move-exception v0

    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method
