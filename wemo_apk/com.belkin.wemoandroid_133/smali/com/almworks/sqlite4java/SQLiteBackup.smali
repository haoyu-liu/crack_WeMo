.class public Lcom/almworks/sqlite4java/SQLiteBackup;
.super Ljava/lang/Object;
.source "SQLiteBackup.java"


# instance fields
.field private final myDestination:Lcom/almworks/sqlite4java/SQLiteConnection;

.field private myDestinationController:Lcom/almworks/sqlite4java/SQLiteController;

.field private myFinished:Z

.field private myHandle:Lcom/almworks/sqlite4java/SWIGTYPE_p_sqlite3_backup;

.field private final mySource:Lcom/almworks/sqlite4java/SQLiteConnection;

.field private mySourceController:Lcom/almworks/sqlite4java/SQLiteController;


# direct methods
.method constructor <init>(Lcom/almworks/sqlite4java/SQLiteController;Lcom/almworks/sqlite4java/SQLiteController;Lcom/almworks/sqlite4java/SWIGTYPE_p_sqlite3_backup;Lcom/almworks/sqlite4java/SQLiteConnection;Lcom/almworks/sqlite4java/SQLiteConnection;)V
    .locals 1
    .param p1, "sourceController"    # Lcom/almworks/sqlite4java/SQLiteController;
    .param p2, "destinationController"    # Lcom/almworks/sqlite4java/SQLiteController;
    .param p3, "handle"    # Lcom/almworks/sqlite4java/SWIGTYPE_p_sqlite3_backup;
    .param p4, "source"    # Lcom/almworks/sqlite4java/SQLiteConnection;
    .param p5, "destination"    # Lcom/almworks/sqlite4java/SQLiteConnection;

    .prologue
    .line 75
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 76
    iput-object p1, p0, Lcom/almworks/sqlite4java/SQLiteBackup;->mySourceController:Lcom/almworks/sqlite4java/SQLiteController;

    .line 77
    iput-object p2, p0, Lcom/almworks/sqlite4java/SQLiteBackup;->myDestinationController:Lcom/almworks/sqlite4java/SQLiteController;

    .line 78
    iput-object p3, p0, Lcom/almworks/sqlite4java/SQLiteBackup;->myHandle:Lcom/almworks/sqlite4java/SWIGTYPE_p_sqlite3_backup;

    .line 79
    iput-object p5, p0, Lcom/almworks/sqlite4java/SQLiteBackup;->myDestination:Lcom/almworks/sqlite4java/SQLiteConnection;

    .line 80
    iput-object p4, p0, Lcom/almworks/sqlite4java/SQLiteBackup;->mySource:Lcom/almworks/sqlite4java/SQLiteConnection;

    .line 81
    const-string v0, "instantiated"

    invoke-static {p0, v0}, Lcom/almworks/sqlite4java/Internal;->logFine(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 82
    return-void
.end method

.method private handle()Lcom/almworks/sqlite4java/SWIGTYPE_p_sqlite3_backup;
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/almworks/sqlite4java/SQLiteException;
        }
    .end annotation

    .prologue
    .line 221
    iget-object v0, p0, Lcom/almworks/sqlite4java/SQLiteBackup;->myHandle:Lcom/almworks/sqlite4java/SWIGTYPE_p_sqlite3_backup;

    .line 222
    .local v0, "handle":Lcom/almworks/sqlite4java/SWIGTYPE_p_sqlite3_backup;
    if-nez v0, :cond_0

    .line 223
    new-instance v1, Lcom/almworks/sqlite4java/SQLiteException;

    const/16 v2, -0x71

    const/4 v3, 0x0

    invoke-direct {v1, v2, v3}, Lcom/almworks/sqlite4java/SQLiteException;-><init>(ILjava/lang/String;)V

    throw v1

    .line 225
    :cond_0
    return-object v0
.end method

.method private throwResult(ILjava/lang/String;)V
    .locals 1
    .param p1, "rc"    # I
    .param p2, "operation"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/almworks/sqlite4java/SQLiteException;
        }
    .end annotation

    .prologue
    .line 229
    const/16 v0, 0x65

    if-ne p1, v0, :cond_0

    .line 231
    :goto_0
    return-void

    .line 230
    :cond_0
    iget-object v0, p0, Lcom/almworks/sqlite4java/SQLiteBackup;->myDestination:Lcom/almworks/sqlite4java/SQLiteConnection;

    invoke-virtual {v0, p1, p2}, Lcom/almworks/sqlite4java/SQLiteConnection;->throwResult(ILjava/lang/String;)V

    goto :goto_0
.end method


# virtual methods
.method public backupStep(I)Z
    .locals 5
    .param p1, "pagesToBackup"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/almworks/sqlite4java/SQLiteException;,
            Lcom/almworks/sqlite4java/SQLiteBusyException;
        }
    .end annotation

    .prologue
    const/4 v2, 0x1

    .line 103
    iget-object v3, p0, Lcom/almworks/sqlite4java/SQLiteBackup;->mySource:Lcom/almworks/sqlite4java/SQLiteConnection;

    invoke-virtual {v3}, Lcom/almworks/sqlite4java/SQLiteConnection;->checkThread()V

    .line 104
    iget-object v3, p0, Lcom/almworks/sqlite4java/SQLiteBackup;->myDestination:Lcom/almworks/sqlite4java/SQLiteConnection;

    invoke-virtual {v3}, Lcom/almworks/sqlite4java/SQLiteConnection;->checkThread()V

    .line 105
    iget-boolean v3, p0, Lcom/almworks/sqlite4java/SQLiteBackup;->myFinished:Z

    if-eqz v3, :cond_0

    .line 106
    const-string v3, "already finished"

    invoke-static {p0, v3}, Lcom/almworks/sqlite4java/Internal;->logWarn(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 121
    :goto_0
    return v2

    .line 109
    :cond_0
    invoke-static {}, Lcom/almworks/sqlite4java/Internal;->isFineLogging()Z

    move-result v3

    if-eqz v3, :cond_1

    .line 110
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "backupStep("

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, ")"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {p0, v3}, Lcom/almworks/sqlite4java/Internal;->logFine(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 112
    :cond_1
    invoke-direct {p0}, Lcom/almworks/sqlite4java/SQLiteBackup;->handle()Lcom/almworks/sqlite4java/SWIGTYPE_p_sqlite3_backup;

    move-result-object v0

    .line 113
    .local v0, "handle":Lcom/almworks/sqlite4java/SWIGTYPE_p_sqlite3_backup;
    invoke-static {v0, p1}, Lcom/almworks/sqlite4java/_SQLiteSwigged;->sqlite3_backup_step(Lcom/almworks/sqlite4java/SWIGTYPE_p_sqlite3_backup;I)I

    move-result v1

    .line 114
    .local v1, "rc":I
    const-string v3, "backupStep failed"

    invoke-direct {p0, v1, v3}, Lcom/almworks/sqlite4java/SQLiteBackup;->throwResult(ILjava/lang/String;)V

    .line 115
    const/16 v3, 0x65

    if-ne v1, v3, :cond_3

    .line 116
    invoke-static {}, Lcom/almworks/sqlite4java/Internal;->isFineLogging()Z

    move-result v3

    if-eqz v3, :cond_2

    .line 117
    const-string v3, "finished"

    invoke-static {p0, v3}, Lcom/almworks/sqlite4java/Internal;->logFine(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 119
    :cond_2
    iput-boolean v2, p0, Lcom/almworks/sqlite4java/SQLiteBackup;->myFinished:Z

    .line 121
    :cond_3
    iget-boolean v2, p0, Lcom/almworks/sqlite4java/SQLiteBackup;->myFinished:Z

    goto :goto_0
.end method

.method public dispose()V
    .locals 1

    .prologue
    .line 185
    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lcom/almworks/sqlite4java/SQLiteBackup;->dispose(Z)V

    .line 186
    return-void
.end method

.method public dispose(Z)V
    .locals 4
    .param p1, "disposeDestination"    # Z

    .prologue
    .line 157
    :try_start_0
    iget-object v2, p0, Lcom/almworks/sqlite4java/SQLiteBackup;->mySourceController:Lcom/almworks/sqlite4java/SQLiteController;

    invoke-virtual {v2}, Lcom/almworks/sqlite4java/SQLiteController;->validate()V

    .line 158
    iget-object v2, p0, Lcom/almworks/sqlite4java/SQLiteBackup;->myDestinationController:Lcom/almworks/sqlite4java/SQLiteController;

    invoke-virtual {v2}, Lcom/almworks/sqlite4java/SQLiteController;->validate()V
    :try_end_0
    .catch Lcom/almworks/sqlite4java/SQLiteException; {:try_start_0 .. :try_end_0} :catch_0

    .line 163
    const-string v2, "disposing"

    invoke-static {p0, v2}, Lcom/almworks/sqlite4java/Internal;->logFine(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 164
    iget-object v1, p0, Lcom/almworks/sqlite4java/SQLiteBackup;->myHandle:Lcom/almworks/sqlite4java/SWIGTYPE_p_sqlite3_backup;

    .line 165
    .local v1, "handle":Lcom/almworks/sqlite4java/SWIGTYPE_p_sqlite3_backup;
    if-eqz v1, :cond_0

    .line 166
    invoke-static {v1}, Lcom/almworks/sqlite4java/_SQLiteSwigged;->sqlite3_backup_finish(Lcom/almworks/sqlite4java/SWIGTYPE_p_sqlite3_backup;)I

    .line 167
    const/4 v2, 0x0

    iput-object v2, p0, Lcom/almworks/sqlite4java/SQLiteBackup;->myHandle:Lcom/almworks/sqlite4java/SWIGTYPE_p_sqlite3_backup;

    .line 168
    iget-object v2, p0, Lcom/almworks/sqlite4java/SQLiteBackup;->mySourceController:Lcom/almworks/sqlite4java/SQLiteController;

    invoke-static {v2}, Lcom/almworks/sqlite4java/SQLiteController;->getDisposed(Lcom/almworks/sqlite4java/SQLiteController;)Lcom/almworks/sqlite4java/SQLiteController;

    move-result-object v2

    iput-object v2, p0, Lcom/almworks/sqlite4java/SQLiteBackup;->mySourceController:Lcom/almworks/sqlite4java/SQLiteController;

    .line 169
    iget-object v2, p0, Lcom/almworks/sqlite4java/SQLiteBackup;->myDestinationController:Lcom/almworks/sqlite4java/SQLiteController;

    invoke-static {v2}, Lcom/almworks/sqlite4java/SQLiteController;->getDisposed(Lcom/almworks/sqlite4java/SQLiteController;)Lcom/almworks/sqlite4java/SQLiteController;

    move-result-object v2

    iput-object v2, p0, Lcom/almworks/sqlite4java/SQLiteBackup;->myDestinationController:Lcom/almworks/sqlite4java/SQLiteController;

    .line 171
    :cond_0
    if-eqz p1, :cond_1

    .line 172
    iget-object v2, p0, Lcom/almworks/sqlite4java/SQLiteBackup;->myDestination:Lcom/almworks/sqlite4java/SQLiteConnection;

    invoke-virtual {v2}, Lcom/almworks/sqlite4java/SQLiteConnection;->dispose()V

    .line 174
    .end local v1    # "handle":Lcom/almworks/sqlite4java/SWIGTYPE_p_sqlite3_backup;
    :cond_1
    :goto_0
    return-void

    .line 159
    :catch_0
    move-exception v0

    .line 160
    .local v0, "e":Lcom/almworks/sqlite4java/SQLiteException;
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "invalid dispose: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    const/4 v3, 0x1

    invoke-static {p0, v2, v3}, Lcom/almworks/sqlite4java/Internal;->recoverableError(Ljava/lang/Object;Ljava/lang/String;Z)V

    goto :goto_0
.end method

.method public getDestinationConnection()Lcom/almworks/sqlite4java/SQLiteConnection;
    .locals 1

    .prologue
    .line 143
    iget-object v0, p0, Lcom/almworks/sqlite4java/SQLiteBackup;->myDestination:Lcom/almworks/sqlite4java/SQLiteConnection;

    return-object v0
.end method

.method public getPageCount()I
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/almworks/sqlite4java/SQLiteException;
        }
    .end annotation

    .prologue
    .line 196
    iget-object v1, p0, Lcom/almworks/sqlite4java/SQLiteBackup;->mySourceController:Lcom/almworks/sqlite4java/SQLiteController;

    invoke-virtual {v1}, Lcom/almworks/sqlite4java/SQLiteController;->validate()V

    .line 197
    iget-object v1, p0, Lcom/almworks/sqlite4java/SQLiteBackup;->myDestinationController:Lcom/almworks/sqlite4java/SQLiteController;

    invoke-virtual {v1}, Lcom/almworks/sqlite4java/SQLiteController;->validate()V

    .line 198
    invoke-direct {p0}, Lcom/almworks/sqlite4java/SQLiteBackup;->handle()Lcom/almworks/sqlite4java/SWIGTYPE_p_sqlite3_backup;

    move-result-object v0

    .line 199
    .local v0, "handle":Lcom/almworks/sqlite4java/SWIGTYPE_p_sqlite3_backup;
    invoke-static {v0}, Lcom/almworks/sqlite4java/_SQLiteSwigged;->sqlite3_backup_pagecount(Lcom/almworks/sqlite4java/SWIGTYPE_p_sqlite3_backup;)I

    move-result v1

    return v1
.end method

.method public getRemaining()I
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/almworks/sqlite4java/SQLiteException;
        }
    .end annotation

    .prologue
    .line 209
    iget-object v1, p0, Lcom/almworks/sqlite4java/SQLiteBackup;->mySourceController:Lcom/almworks/sqlite4java/SQLiteController;

    invoke-virtual {v1}, Lcom/almworks/sqlite4java/SQLiteController;->validate()V

    .line 210
    iget-object v1, p0, Lcom/almworks/sqlite4java/SQLiteBackup;->myDestinationController:Lcom/almworks/sqlite4java/SQLiteController;

    invoke-virtual {v1}, Lcom/almworks/sqlite4java/SQLiteController;->validate()V

    .line 211
    invoke-direct {p0}, Lcom/almworks/sqlite4java/SQLiteBackup;->handle()Lcom/almworks/sqlite4java/SWIGTYPE_p_sqlite3_backup;

    move-result-object v0

    .line 212
    .local v0, "handle":Lcom/almworks/sqlite4java/SWIGTYPE_p_sqlite3_backup;
    invoke-static {v0}, Lcom/almworks/sqlite4java/_SQLiteSwigged;->sqlite3_backup_remaining(Lcom/almworks/sqlite4java/SWIGTYPE_p_sqlite3_backup;)I

    move-result v1

    return v1
.end method

.method public isFinished()Z
    .locals 1

    .prologue
    .line 130
    iget-boolean v0, p0, Lcom/almworks/sqlite4java/SQLiteBackup;->myFinished:Z

    return v0
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .prologue
    .line 217
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "Backup ["

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/almworks/sqlite4java/SQLiteBackup;->mySource:Lcom/almworks/sqlite4java/SQLiteConnection;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, " -> "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/almworks/sqlite4java/SQLiteBackup;->myDestination:Lcom/almworks/sqlite4java/SQLiteConnection;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "]"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
