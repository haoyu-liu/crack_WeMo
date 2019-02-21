.class public final Lcom/almworks/sqlite4java/SQLiteStatement;
.super Ljava/lang/Object;
.source "SQLiteStatement.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/almworks/sqlite4java/SQLiteStatement$ColumnStream;,
        Lcom/almworks/sqlite4java/SQLiteStatement$BindStream;
    }
.end annotation


# static fields
.field static final synthetic $assertionsDisabled:Z

.field public static final DISPOSED:Lcom/almworks/sqlite4java/SQLiteStatement;


# instance fields
.field private myBindStreams:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lcom/almworks/sqlite4java/SQLiteStatement$BindStream;",
            ">;"
        }
    .end annotation
.end field

.field private myCancelled:Z

.field private myColumnCount:I

.field private myColumnStreams:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lcom/almworks/sqlite4java/SQLiteStatement$ColumnStream;",
            ">;"
        }
    .end annotation
.end field

.field private myController:Lcom/almworks/sqlite4java/SQLiteController;

.field private myHandle:Lcom/almworks/sqlite4java/SWIGTYPE_p_sqlite3_stmt;

.field private myHasBindings:Z

.field private myHasRow:Z

.field private myProfiler:Lcom/almworks/sqlite4java/SQLiteProfiler;

.field private myProgressHandler:Lcom/almworks/sqlite4java/ProgressHandler;

.field private final mySqlParts:Lcom/almworks/sqlite4java/SQLParts;

.field private myStepped:Z


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 57
    const-class v0, Lcom/almworks/sqlite4java/SQLiteStatement;

    invoke-virtual {v0}, Ljava/lang/Class;->desiredAssertionStatus()Z

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    sput-boolean v0, Lcom/almworks/sqlite4java/SQLiteStatement;->$assertionsDisabled:Z

    .line 61
    new-instance v0, Lcom/almworks/sqlite4java/SQLiteStatement;

    invoke-direct {v0}, Lcom/almworks/sqlite4java/SQLiteStatement;-><init>()V

    sput-object v0, Lcom/almworks/sqlite4java/SQLiteStatement;->DISPOSED:Lcom/almworks/sqlite4java/SQLiteStatement;

    return-void

    .line 57
    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method private constructor <init>()V
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 143
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 102
    const/4 v0, -0x1

    iput v0, p0, Lcom/almworks/sqlite4java/SQLiteStatement;->myColumnCount:I

    .line 144
    invoke-static {v1}, Lcom/almworks/sqlite4java/SQLiteController;->getDisposed(Lcom/almworks/sqlite4java/SQLiteController;)Lcom/almworks/sqlite4java/SQLiteController;

    move-result-object v0

    iput-object v0, p0, Lcom/almworks/sqlite4java/SQLiteStatement;->myController:Lcom/almworks/sqlite4java/SQLiteController;

    .line 145
    iput-object v1, p0, Lcom/almworks/sqlite4java/SQLiteStatement;->myHandle:Lcom/almworks/sqlite4java/SWIGTYPE_p_sqlite3_stmt;

    .line 146
    new-instance v0, Lcom/almworks/sqlite4java/SQLParts;

    invoke-direct {v0}, Lcom/almworks/sqlite4java/SQLParts;-><init>()V

    invoke-virtual {v0}, Lcom/almworks/sqlite4java/SQLParts;->fix()Lcom/almworks/sqlite4java/SQLParts;

    move-result-object v0

    iput-object v0, p0, Lcom/almworks/sqlite4java/SQLiteStatement;->mySqlParts:Lcom/almworks/sqlite4java/SQLParts;

    .line 147
    iput-object v1, p0, Lcom/almworks/sqlite4java/SQLiteStatement;->myProfiler:Lcom/almworks/sqlite4java/SQLiteProfiler;

    .line 148
    return-void
.end method

.method constructor <init>(Lcom/almworks/sqlite4java/SQLiteController;Lcom/almworks/sqlite4java/SWIGTYPE_p_sqlite3_stmt;Lcom/almworks/sqlite4java/SQLParts;Lcom/almworks/sqlite4java/SQLiteProfiler;)V
    .locals 1
    .param p1, "controller"    # Lcom/almworks/sqlite4java/SQLiteController;
    .param p2, "handle"    # Lcom/almworks/sqlite4java/SWIGTYPE_p_sqlite3_stmt;
    .param p3, "sqlParts"    # Lcom/almworks/sqlite4java/SQLParts;
    .param p4, "profiler"    # Lcom/almworks/sqlite4java/SQLiteProfiler;

    .prologue
    .line 130
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 102
    const/4 v0, -0x1

    iput v0, p0, Lcom/almworks/sqlite4java/SQLiteStatement;->myColumnCount:I

    .line 131
    sget-boolean v0, Lcom/almworks/sqlite4java/SQLiteStatement;->$assertionsDisabled:Z

    if-nez v0, :cond_0

    if-nez p2, :cond_0

    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0

    .line 132
    :cond_0
    sget-boolean v0, Lcom/almworks/sqlite4java/SQLiteStatement;->$assertionsDisabled:Z

    if-nez v0, :cond_1

    invoke-virtual {p3}, Lcom/almworks/sqlite4java/SQLParts;->isFixed()Z

    move-result v0

    if-nez v0, :cond_1

    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0, p3}, Ljava/lang/AssertionError;-><init>(Ljava/lang/Object;)V

    throw v0

    .line 133
    :cond_1
    iput-object p1, p0, Lcom/almworks/sqlite4java/SQLiteStatement;->myController:Lcom/almworks/sqlite4java/SQLiteController;

    .line 134
    iput-object p2, p0, Lcom/almworks/sqlite4java/SQLiteStatement;->myHandle:Lcom/almworks/sqlite4java/SWIGTYPE_p_sqlite3_stmt;

    .line 135
    iput-object p3, p0, Lcom/almworks/sqlite4java/SQLiteStatement;->mySqlParts:Lcom/almworks/sqlite4java/SQLParts;

    .line 136
    iput-object p4, p0, Lcom/almworks/sqlite4java/SQLiteStatement;->myProfiler:Lcom/almworks/sqlite4java/SQLiteProfiler;

    .line 137
    const-string v0, "instantiated"

    invoke-static {p0, v0}, Lcom/almworks/sqlite4java/Internal;->logFine(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 138
    return-void
.end method

.method static synthetic access$000(Lcom/almworks/sqlite4java/SQLiteStatement;)Lcom/almworks/sqlite4java/SQLiteController;
    .locals 1
    .param p0, "x0"    # Lcom/almworks/sqlite4java/SQLiteStatement;

    .prologue
    .line 57
    iget-object v0, p0, Lcom/almworks/sqlite4java/SQLiteStatement;->myController:Lcom/almworks/sqlite4java/SQLiteController;

    return-object v0
.end method

.method static synthetic access$100(Lcom/almworks/sqlite4java/SQLiteStatement;)Lcom/almworks/sqlite4java/SWIGTYPE_p_sqlite3_stmt;
    .locals 1
    .param p0, "x0"    # Lcom/almworks/sqlite4java/SQLiteStatement;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/almworks/sqlite4java/SQLiteException;
        }
    .end annotation

    .prologue
    .line 57
    invoke-direct {p0}, Lcom/almworks/sqlite4java/SQLiteStatement;->handle()Lcom/almworks/sqlite4java/SWIGTYPE_p_sqlite3_stmt;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$200(Lcom/almworks/sqlite4java/SQLiteStatement;)Ljava/util/List;
    .locals 1
    .param p0, "x0"    # Lcom/almworks/sqlite4java/SQLiteStatement;

    .prologue
    .line 57
    iget-object v0, p0, Lcom/almworks/sqlite4java/SQLiteStatement;->myBindStreams:Ljava/util/List;

    return-object v0
.end method

.method static synthetic access$300(Lcom/almworks/sqlite4java/SQLiteStatement;)Ljava/util/List;
    .locals 1
    .param p0, "x0"    # Lcom/almworks/sqlite4java/SQLiteStatement;

    .prologue
    .line 57
    iget-object v0, p0, Lcom/almworks/sqlite4java/SQLiteStatement;->myColumnStreams:Ljava/util/List;

    return-object v0
.end method

.method private checkColumn(ILcom/almworks/sqlite4java/SWIGTYPE_p_sqlite3_stmt;Z)V
    .locals 5
    .param p1, "column"    # I
    .param p2, "handle"    # Lcom/almworks/sqlite4java/SWIGTYPE_p_sqlite3_stmt;
    .param p3, "mustHaveRow"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/almworks/sqlite4java/SQLiteException;
        }
    .end annotation

    .prologue
    const/16 v4, -0x5e

    .line 1338
    if-eqz p3, :cond_0

    iget-boolean v1, p0, Lcom/almworks/sqlite4java/SQLiteStatement;->myHasRow:Z

    if-nez v1, :cond_0

    .line 1339
    new-instance v1, Lcom/almworks/sqlite4java/SQLiteException;

    const/16 v2, -0x5f

    const/4 v3, 0x0

    invoke-direct {v1, v2, v3}, Lcom/almworks/sqlite4java/SQLiteException;-><init>(ILjava/lang/String;)V

    throw v1

    .line 1340
    :cond_0
    if-gez p1, :cond_1

    .line 1341
    new-instance v1, Lcom/almworks/sqlite4java/SQLiteException;

    invoke-static {p1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v4, v2}, Lcom/almworks/sqlite4java/SQLiteException;-><init>(ILjava/lang/String;)V

    throw v1

    .line 1342
    :cond_1
    invoke-direct {p0, p2}, Lcom/almworks/sqlite4java/SQLiteStatement;->getColumnCount(Lcom/almworks/sqlite4java/SWIGTYPE_p_sqlite3_stmt;)I

    move-result v0

    .line 1343
    .local v0, "columnCount":I
    if-lt p1, v0, :cond_2

    .line 1344
    new-instance v1, Lcom/almworks/sqlite4java/SQLiteException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "("

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, ")"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v4, v2}, Lcom/almworks/sqlite4java/SQLiteException;-><init>(ILjava/lang/String;)V

    throw v1

    .line 1345
    :cond_2
    return-void
.end method

.method private clearBindStreams(Z)V
    .locals 5
    .param p1, "bind"    # Z

    .prologue
    .line 1300
    iget-object v3, p0, Lcom/almworks/sqlite4java/SQLiteStatement;->myBindStreams:Ljava/util/List;

    .line 1301
    .local v3, "table":Ljava/util/List;, "Ljava/util/List<Lcom/almworks/sqlite4java/SQLiteStatement$BindStream;>;"
    if-eqz v3, :cond_2

    .line 1302
    const/4 v4, 0x0

    iput-object v4, p0, Lcom/almworks/sqlite4java/SQLiteStatement;->myBindStreams:Ljava/util/List;

    .line 1303
    invoke-interface {v3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "i$":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/almworks/sqlite4java/SQLiteStatement$BindStream;

    .line 1304
    .local v2, "stream":Lcom/almworks/sqlite4java/SQLiteStatement$BindStream;
    if-eqz p1, :cond_0

    invoke-virtual {v2}, Lcom/almworks/sqlite4java/SQLiteStatement$BindStream;->isDisposed()Z

    move-result v4

    if-nez v4, :cond_0

    .line 1306
    :try_start_0
    invoke-virtual {v2}, Lcom/almworks/sqlite4java/SQLiteStatement$BindStream;->close()V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 1307
    :catch_0
    move-exception v0

    .line 1308
    .local v0, "e":Ljava/io/IOException;
    invoke-virtual {v0}, Ljava/io/IOException;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {p0, v4}, Lcom/almworks/sqlite4java/Internal;->logFine(Ljava/lang/Object;Ljava/lang/Object;)V

    goto :goto_0

    .line 1311
    .end local v0    # "e":Ljava/io/IOException;
    :cond_0
    invoke-virtual {v2}, Lcom/almworks/sqlite4java/SQLiteStatement$BindStream;->dispose()V

    goto :goto_0

    .line 1314
    .end local v2    # "stream":Lcom/almworks/sqlite4java/SQLiteStatement$BindStream;
    :cond_1
    invoke-interface {v3}, Ljava/util/List;->clear()V

    .line 1316
    .end local v1    # "i$":Ljava/util/Iterator;
    :cond_2
    return-void
.end method

.method private clearColumnStreams()V
    .locals 5

    .prologue
    .line 1286
    iget-object v3, p0, Lcom/almworks/sqlite4java/SQLiteStatement;->myColumnStreams:Ljava/util/List;

    .line 1287
    .local v3, "table":Ljava/util/List;, "Ljava/util/List<Lcom/almworks/sqlite4java/SQLiteStatement$ColumnStream;>;"
    if-eqz v3, :cond_0

    .line 1288
    const/4 v4, 0x0

    iput-object v4, p0, Lcom/almworks/sqlite4java/SQLiteStatement;->myColumnStreams:Ljava/util/List;

    .line 1289
    invoke-interface {v3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "i$":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/almworks/sqlite4java/SQLiteStatement$ColumnStream;

    .line 1291
    .local v2, "stream":Lcom/almworks/sqlite4java/SQLiteStatement$ColumnStream;
    :try_start_0
    invoke-virtual {v2}, Lcom/almworks/sqlite4java/SQLiteStatement$ColumnStream;->close()V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 1292
    :catch_0
    move-exception v0

    .line 1293
    .local v0, "e":Ljava/io/IOException;
    invoke-virtual {v0}, Ljava/io/IOException;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {p0, v4}, Lcom/almworks/sqlite4java/Internal;->logFine(Ljava/lang/Object;Ljava/lang/Object;)V

    goto :goto_0

    .line 1297
    .end local v0    # "e":Ljava/io/IOException;
    .end local v1    # "i$":Ljava/util/Iterator;
    .end local v2    # "stream":Lcom/almworks/sqlite4java/SQLiteStatement$ColumnStream;
    :cond_0
    return-void
.end method

.method private finalizeStep(Lcom/almworks/sqlite4java/ProgressHandler;Ljava/lang/String;)V
    .locals 4
    .param p1, "ph"    # Lcom/almworks/sqlite4java/ProgressHandler;
    .param p2, "methodName"    # Ljava/lang/String;

    .prologue
    .line 1377
    monitor-enter p0

    .line 1378
    const/4 v0, 0x0

    :try_start_0
    iput-object v0, p0, Lcom/almworks/sqlite4java/SQLiteStatement;->myProgressHandler:Lcom/almworks/sqlite4java/ProgressHandler;

    .line 1379
    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 1380
    if-eqz p1, :cond_1

    .line 1381
    invoke-static {}, Lcom/almworks/sqlite4java/Internal;->isFineLogging()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 1382
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, " "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {p1}, Lcom/almworks/sqlite4java/ProgressHandler;->getSteps()J

    move-result-wide v2

    invoke-virtual {v0, v2, v3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, " steps"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {p0, v0}, Lcom/almworks/sqlite4java/Internal;->logFine(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 1383
    :cond_0
    invoke-virtual {p1}, Lcom/almworks/sqlite4java/ProgressHandler;->reset()V

    .line 1385
    :cond_1
    return-void

    .line 1379
    :catchall_0
    move-exception v0

    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v0
.end method

.method private getColumnCount(Lcom/almworks/sqlite4java/SWIGTYPE_p_sqlite3_stmt;)I
    .locals 3
    .param p1, "handle"    # Lcom/almworks/sqlite4java/SWIGTYPE_p_sqlite3_stmt;

    .prologue
    .line 1348
    iget v0, p0, Lcom/almworks/sqlite4java/SQLiteStatement;->myColumnCount:I

    .line 1349
    .local v0, "cc":I
    if-gez v0, :cond_0

    .line 1351
    const-string v1, "asking column count"

    invoke-static {p0, v1}, Lcom/almworks/sqlite4java/Internal;->logFine(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 1352
    invoke-static {p1}, Lcom/almworks/sqlite4java/_SQLiteSwigged;->sqlite3_column_count(Lcom/almworks/sqlite4java/SWIGTYPE_p_sqlite3_stmt;)I

    move-result v0

    iput v0, p0, Lcom/almworks/sqlite4java/SQLiteStatement;->myColumnCount:I

    .line 1353
    if-gez v0, :cond_1

    .line 1354
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "columnsCount="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    const/4 v2, 0x1

    invoke-static {p0, v1, v2}, Lcom/almworks/sqlite4java/Internal;->recoverableError(Ljava/lang/Object;Ljava/lang/String;Z)V

    .line 1355
    const/4 v0, 0x0

    .line 1360
    :cond_0
    :goto_0
    return v0

    .line 1356
    :cond_1
    invoke-static {}, Lcom/almworks/sqlite4java/Internal;->isFineLogging()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 1357
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "columnCount="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {p0, v1}, Lcom/almworks/sqlite4java/Internal;->logFine(Ljava/lang/Object;Ljava/lang/Object;)V

    goto :goto_0
.end method

.method private getColumnType(ILcom/almworks/sqlite4java/SWIGTYPE_p_sqlite3_stmt;)I
    .locals 3
    .param p1, "column"    # I
    .param p2, "handle"    # Lcom/almworks/sqlite4java/SWIGTYPE_p_sqlite3_stmt;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/almworks/sqlite4java/SQLiteException;
        }
    .end annotation

    .prologue
    .line 1327
    const/4 v1, 0x0

    invoke-direct {p0, p1, p2, v1}, Lcom/almworks/sqlite4java/SQLiteStatement;->checkColumn(ILcom/almworks/sqlite4java/SWIGTYPE_p_sqlite3_stmt;Z)V

    .line 1328
    invoke-static {}, Lcom/almworks/sqlite4java/Internal;->isFineLogging()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 1329
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "columnType("

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ")"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {p0, v1}, Lcom/almworks/sqlite4java/Internal;->logFine(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 1330
    :cond_0
    invoke-static {p2, p1}, Lcom/almworks/sqlite4java/_SQLiteSwigged;->sqlite3_column_type(Lcom/almworks/sqlite4java/SWIGTYPE_p_sqlite3_stmt;I)I

    move-result v0

    .line 1331
    .local v0, "valueType":I
    invoke-static {}, Lcom/almworks/sqlite4java/Internal;->isFineLogging()Z

    move-result v1

    if-eqz v1, :cond_1

    .line 1332
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "columnType("

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ")="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {p0, v1}, Lcom/almworks/sqlite4java/Internal;->logFine(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 1333
    :cond_1
    return v0
.end method

.method private getValidBindParameterIndex(Ljava/lang/String;)I
    .locals 5
    .param p1, "name"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/almworks/sqlite4java/SQLiteException;
        }
    .end annotation

    .prologue
    .line 537
    invoke-virtual {p0, p1}, Lcom/almworks/sqlite4java/SQLiteStatement;->getBindParameterIndex(Ljava/lang/String;)I

    move-result v0

    .line 538
    .local v0, "index":I
    if-nez v0, :cond_0

    .line 539
    new-instance v1, Lcom/almworks/sqlite4java/SQLiteException;

    const/16 v2, -0xb

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "failed to find parameter with specified name ("

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, ")"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v1, v2, v3}, Lcom/almworks/sqlite4java/SQLiteException;-><init>(ILjava/lang/String;)V

    throw v1

    .line 541
    :cond_0
    return v0
.end method

.method private handle()Lcom/almworks/sqlite4java/SWIGTYPE_p_sqlite3_stmt;
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/almworks/sqlite4java/SQLiteException;
        }
    .end annotation

    .prologue
    .line 1319
    iget-object v0, p0, Lcom/almworks/sqlite4java/SQLiteStatement;->myHandle:Lcom/almworks/sqlite4java/SWIGTYPE_p_sqlite3_stmt;

    .line 1320
    .local v0, "handle":Lcom/almworks/sqlite4java/SWIGTYPE_p_sqlite3_stmt;
    if-nez v0, :cond_0

    .line 1321
    new-instance v1, Lcom/almworks/sqlite4java/SQLiteException;

    const/16 v2, -0x60

    const/4 v3, 0x0

    invoke-direct {v1, v2, v3}, Lcom/almworks/sqlite4java/SQLiteException;-><init>(ILjava/lang/String;)V

    throw v1

    .line 1323
    :cond_0
    return-object v0
.end method

.method private prepareStep()Lcom/almworks/sqlite4java/ProgressHandler;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/almworks/sqlite4java/SQLiteException;
        }
    .end annotation

    .prologue
    .line 1364
    const/4 v1, 0x1

    invoke-direct {p0, v1}, Lcom/almworks/sqlite4java/SQLiteStatement;->clearBindStreams(Z)V

    .line 1365
    invoke-direct {p0}, Lcom/almworks/sqlite4java/SQLiteStatement;->clearColumnStreams()V

    .line 1366
    iget-object v1, p0, Lcom/almworks/sqlite4java/SQLiteStatement;->myController:Lcom/almworks/sqlite4java/SQLiteController;

    invoke-virtual {v1}, Lcom/almworks/sqlite4java/SQLiteController;->getProgressHandler()Lcom/almworks/sqlite4java/ProgressHandler;

    move-result-object v0

    .line 1367
    .local v0, "ph":Lcom/almworks/sqlite4java/ProgressHandler;
    invoke-virtual {v0}, Lcom/almworks/sqlite4java/ProgressHandler;->reset()V

    .line 1368
    monitor-enter p0

    .line 1369
    :try_start_0
    iget-boolean v1, p0, Lcom/almworks/sqlite4java/SQLiteStatement;->myCancelled:Z

    if-eqz v1, :cond_0

    .line 1370
    new-instance v1, Lcom/almworks/sqlite4java/SQLiteInterruptedException;

    invoke-direct {v1}, Lcom/almworks/sqlite4java/SQLiteInterruptedException;-><init>()V

    throw v1

    .line 1372
    :catchall_0
    move-exception v1

    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1

    .line 1371
    :cond_0
    :try_start_1
    iput-object v0, p0, Lcom/almworks/sqlite4java/SQLiteStatement;->myProgressHandler:Lcom/almworks/sqlite4java/ProgressHandler;

    .line 1372
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 1373
    return-object v0
.end method

.method private stepResult(ILjava/lang/String;)V
    .locals 3
    .param p1, "rc"    # I
    .param p2, "methodName"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/almworks/sqlite4java/SQLiteException;
        }
    .end annotation

    .prologue
    const/4 v2, 0x1

    .line 1388
    iget-boolean v0, p0, Lcom/almworks/sqlite4java/SQLiteStatement;->myStepped:Z

    if-nez v0, :cond_0

    .line 1390
    const/4 v0, -0x1

    iput v0, p0, Lcom/almworks/sqlite4java/SQLiteStatement;->myColumnCount:I

    .line 1392
    :cond_0
    iput-boolean v2, p0, Lcom/almworks/sqlite4java/SQLiteStatement;->myStepped:Z

    .line 1393
    const/16 v0, 0x64

    if-ne p1, v0, :cond_2

    .line 1394
    invoke-static {}, Lcom/almworks/sqlite4java/Internal;->isFineLogging()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 1395
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, " ROW"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {p0, v0}, Lcom/almworks/sqlite4java/Internal;->logFine(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 1396
    :cond_1
    iput-boolean v2, p0, Lcom/almworks/sqlite4java/SQLiteStatement;->myHasRow:Z

    .line 1404
    :goto_0
    return-void

    .line 1397
    :cond_2
    const/16 v0, 0x65

    if-ne p1, v0, :cond_4

    .line 1398
    invoke-static {}, Lcom/almworks/sqlite4java/Internal;->isFineLogging()Z

    move-result v0

    if-eqz v0, :cond_3

    .line 1399
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, " DONE"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {p0, v0}, Lcom/almworks/sqlite4java/Internal;->logFine(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 1400
    :cond_3
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/almworks/sqlite4java/SQLiteStatement;->myHasRow:Z

    goto :goto_0

    .line 1402
    :cond_4
    iget-object v0, p0, Lcom/almworks/sqlite4java/SQLiteStatement;->myController:Lcom/almworks/sqlite4java/SQLiteController;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "()"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, p1, v1, p0}, Lcom/almworks/sqlite4java/SQLiteController;->throwResult(ILjava/lang/String;Ljava/lang/Object;)V

    goto :goto_0
.end method


# virtual methods
.method public bind(ID)Lcom/almworks/sqlite4java/SQLiteStatement;
    .locals 4
    .param p1, "index"    # I
    .param p2, "value"    # D
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/almworks/sqlite4java/SQLiteException;
        }
    .end annotation

    .prologue
    .line 554
    iget-object v1, p0, Lcom/almworks/sqlite4java/SQLiteStatement;->myController:Lcom/almworks/sqlite4java/SQLiteController;

    invoke-virtual {v1}, Lcom/almworks/sqlite4java/SQLiteController;->validate()V

    .line 555
    invoke-static {}, Lcom/almworks/sqlite4java/Internal;->isFineLogging()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 556
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "bind("

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ","

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p2, p3}, Ljava/lang/StringBuilder;->append(D)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ")"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {p0, v1}, Lcom/almworks/sqlite4java/Internal;->logFine(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 557
    :cond_0
    invoke-direct {p0}, Lcom/almworks/sqlite4java/SQLiteStatement;->handle()Lcom/almworks/sqlite4java/SWIGTYPE_p_sqlite3_stmt;

    move-result-object v1

    invoke-static {v1, p1, p2, p3}, Lcom/almworks/sqlite4java/_SQLiteSwigged;->sqlite3_bind_double(Lcom/almworks/sqlite4java/SWIGTYPE_p_sqlite3_stmt;ID)I

    move-result v0

    .line 558
    .local v0, "rc":I
    iget-object v1, p0, Lcom/almworks/sqlite4java/SQLiteStatement;->myController:Lcom/almworks/sqlite4java/SQLiteController;

    const-string v2, "bind(double)"

    invoke-virtual {v1, v0, v2, p0}, Lcom/almworks/sqlite4java/SQLiteController;->throwResult(ILjava/lang/String;Ljava/lang/Object;)V

    .line 559
    const/4 v1, 0x1

    iput-boolean v1, p0, Lcom/almworks/sqlite4java/SQLiteStatement;->myHasBindings:Z

    .line 560
    return-object p0
.end method

.method public bind(II)Lcom/almworks/sqlite4java/SQLiteStatement;
    .locals 3
    .param p1, "index"    # I
    .param p2, "value"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/almworks/sqlite4java/SQLiteException;
        }
    .end annotation

    .prologue
    .line 588
    iget-object v1, p0, Lcom/almworks/sqlite4java/SQLiteStatement;->myController:Lcom/almworks/sqlite4java/SQLiteController;

    invoke-virtual {v1}, Lcom/almworks/sqlite4java/SQLiteController;->validate()V

    .line 589
    invoke-static {}, Lcom/almworks/sqlite4java/Internal;->isFineLogging()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 590
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "bind("

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ","

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ")"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {p0, v1}, Lcom/almworks/sqlite4java/Internal;->logFine(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 591
    :cond_0
    invoke-direct {p0}, Lcom/almworks/sqlite4java/SQLiteStatement;->handle()Lcom/almworks/sqlite4java/SWIGTYPE_p_sqlite3_stmt;

    move-result-object v1

    invoke-static {v1, p1, p2}, Lcom/almworks/sqlite4java/_SQLiteSwigged;->sqlite3_bind_int(Lcom/almworks/sqlite4java/SWIGTYPE_p_sqlite3_stmt;II)I

    move-result v0

    .line 592
    .local v0, "rc":I
    iget-object v1, p0, Lcom/almworks/sqlite4java/SQLiteStatement;->myController:Lcom/almworks/sqlite4java/SQLiteController;

    const-string v2, "bind(int)"

    invoke-virtual {v1, v0, v2, p0}, Lcom/almworks/sqlite4java/SQLiteController;->throwResult(ILjava/lang/String;Ljava/lang/Object;)V

    .line 593
    const/4 v1, 0x1

    iput-boolean v1, p0, Lcom/almworks/sqlite4java/SQLiteStatement;->myHasBindings:Z

    .line 594
    return-object p0
.end method

.method public bind(IJ)Lcom/almworks/sqlite4java/SQLiteStatement;
    .locals 4
    .param p1, "index"    # I
    .param p2, "value"    # J
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/almworks/sqlite4java/SQLiteException;
        }
    .end annotation

    .prologue
    .line 622
    iget-object v1, p0, Lcom/almworks/sqlite4java/SQLiteStatement;->myController:Lcom/almworks/sqlite4java/SQLiteController;

    invoke-virtual {v1}, Lcom/almworks/sqlite4java/SQLiteController;->validate()V

    .line 623
    invoke-static {}, Lcom/almworks/sqlite4java/Internal;->isFineLogging()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 624
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "bind("

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ","

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p2, p3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ")"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {p0, v1}, Lcom/almworks/sqlite4java/Internal;->logFine(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 625
    :cond_0
    invoke-direct {p0}, Lcom/almworks/sqlite4java/SQLiteStatement;->handle()Lcom/almworks/sqlite4java/SWIGTYPE_p_sqlite3_stmt;

    move-result-object v1

    invoke-static {v1, p1, p2, p3}, Lcom/almworks/sqlite4java/_SQLiteSwigged;->sqlite3_bind_int64(Lcom/almworks/sqlite4java/SWIGTYPE_p_sqlite3_stmt;IJ)I

    move-result v0

    .line 626
    .local v0, "rc":I
    iget-object v1, p0, Lcom/almworks/sqlite4java/SQLiteStatement;->myController:Lcom/almworks/sqlite4java/SQLiteController;

    const-string v2, "bind(long)"

    invoke-virtual {v1, v0, v2, p0}, Lcom/almworks/sqlite4java/SQLiteController;->throwResult(ILjava/lang/String;Ljava/lang/Object;)V

    .line 627
    const/4 v1, 0x1

    iput-boolean v1, p0, Lcom/almworks/sqlite4java/SQLiteStatement;->myHasBindings:Z

    .line 628
    return-object p0
.end method

.method public bind(ILjava/lang/String;)Lcom/almworks/sqlite4java/SQLiteStatement;
    .locals 4
    .param p1, "index"    # I
    .param p2, "value"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/almworks/sqlite4java/SQLiteException;
        }
    .end annotation

    .prologue
    const/16 v3, 0x14

    .line 656
    if-nez p2, :cond_0

    .line 657
    const-string v1, "bind(null string)"

    invoke-static {p0, v1}, Lcom/almworks/sqlite4java/Internal;->logFine(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 658
    invoke-virtual {p0, p1}, Lcom/almworks/sqlite4java/SQLiteStatement;->bindNull(I)Lcom/almworks/sqlite4java/SQLiteStatement;

    move-result-object p0

    .line 670
    .end local p0    # "this":Lcom/almworks/sqlite4java/SQLiteStatement;
    :goto_0
    return-object p0

    .line 660
    .restart local p0    # "this":Lcom/almworks/sqlite4java/SQLiteStatement;
    :cond_0
    iget-object v1, p0, Lcom/almworks/sqlite4java/SQLiteStatement;->myController:Lcom/almworks/sqlite4java/SQLiteController;

    invoke-virtual {v1}, Lcom/almworks/sqlite4java/SQLiteController;->validate()V

    .line 661
    invoke-static {}, Lcom/almworks/sqlite4java/Internal;->isFineLogging()Z

    move-result v1

    if-eqz v1, :cond_1

    .line 662
    invoke-virtual {p2}, Ljava/lang/String;->length()I

    move-result v1

    if-gt v1, v3, :cond_2

    .line 663
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "bind("

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ","

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ")"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {p0, v1}, Lcom/almworks/sqlite4java/Internal;->logFine(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 667
    :cond_1
    :goto_1
    invoke-direct {p0}, Lcom/almworks/sqlite4java/SQLiteStatement;->handle()Lcom/almworks/sqlite4java/SWIGTYPE_p_sqlite3_stmt;

    move-result-object v1

    invoke-static {v1, p1, p2}, Lcom/almworks/sqlite4java/_SQLiteManual;->sqlite3_bind_text(Lcom/almworks/sqlite4java/SWIGTYPE_p_sqlite3_stmt;ILjava/lang/String;)I

    move-result v0

    .line 668
    .local v0, "rc":I
    iget-object v1, p0, Lcom/almworks/sqlite4java/SQLiteStatement;->myController:Lcom/almworks/sqlite4java/SQLiteController;

    const-string v2, "bind(String)"

    invoke-virtual {v1, v0, v2, p0}, Lcom/almworks/sqlite4java/SQLiteController;->throwResult(ILjava/lang/String;Ljava/lang/Object;)V

    .line 669
    const/4 v1, 0x1

    iput-boolean v1, p0, Lcom/almworks/sqlite4java/SQLiteStatement;->myHasBindings:Z

    goto :goto_0

    .line 665
    .end local v0    # "rc":I
    :cond_2
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "bind("

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ","

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const/4 v2, 0x0

    invoke-virtual {p2, v2, v3}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "....)"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {p0, v1}, Lcom/almworks/sqlite4java/Internal;->logFine(Ljava/lang/Object;Ljava/lang/Object;)V

    goto :goto_1
.end method

.method public bind(I[B)Lcom/almworks/sqlite4java/SQLiteStatement;
    .locals 2
    .param p1, "index"    # I
    .param p2, "value"    # [B
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/almworks/sqlite4java/SQLiteException;
        }
    .end annotation

    .prologue
    .line 698
    if-nez p2, :cond_0

    invoke-virtual {p0, p1}, Lcom/almworks/sqlite4java/SQLiteStatement;->bindNull(I)Lcom/almworks/sqlite4java/SQLiteStatement;

    move-result-object v0

    :goto_0
    return-object v0

    :cond_0
    const/4 v0, 0x0

    array-length v1, p2

    invoke-virtual {p0, p1, p2, v0, v1}, Lcom/almworks/sqlite4java/SQLiteStatement;->bind(I[BII)Lcom/almworks/sqlite4java/SQLiteStatement;

    move-result-object v0

    goto :goto_0
.end method

.method public bind(I[BII)Lcom/almworks/sqlite4java/SQLiteStatement;
    .locals 4
    .param p1, "index"    # I
    .param p2, "value"    # [B
    .param p3, "offset"    # I
    .param p4, "length"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/almworks/sqlite4java/SQLiteException;
        }
    .end annotation

    .prologue
    .line 728
    if-nez p2, :cond_0

    .line 729
    const-string v1, "bind(null blob)"

    invoke-static {p0, v1}, Lcom/almworks/sqlite4java/Internal;->logFine(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 730
    invoke-virtual {p0, p1}, Lcom/almworks/sqlite4java/SQLiteStatement;->bindNull(I)Lcom/almworks/sqlite4java/SQLiteStatement;

    move-result-object p0

    .line 741
    .end local p0    # "this":Lcom/almworks/sqlite4java/SQLiteStatement;
    :goto_0
    return-object p0

    .line 732
    .restart local p0    # "this":Lcom/almworks/sqlite4java/SQLiteStatement;
    :cond_0
    if-ltz p3, :cond_1

    add-int v1, p3, p4

    array-length v2, p2

    if-le v1, v2, :cond_2

    .line 733
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

    .line 734
    :cond_2
    iget-object v1, p0, Lcom/almworks/sqlite4java/SQLiteStatement;->myController:Lcom/almworks/sqlite4java/SQLiteController;

    invoke-virtual {v1}, Lcom/almworks/sqlite4java/SQLiteController;->validate()V

    .line 735
    invoke-static {}, Lcom/almworks/sqlite4java/Internal;->isFineLogging()Z

    move-result v1

    if-eqz v1, :cond_3

    .line 736
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "bind("

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ",["

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "])"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {p0, v1}, Lcom/almworks/sqlite4java/Internal;->logFine(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 738
    :cond_3
    invoke-direct {p0}, Lcom/almworks/sqlite4java/SQLiteStatement;->handle()Lcom/almworks/sqlite4java/SWIGTYPE_p_sqlite3_stmt;

    move-result-object v1

    invoke-static {v1, p1, p2, p3, p4}, Lcom/almworks/sqlite4java/_SQLiteManual;->sqlite3_bind_blob(Lcom/almworks/sqlite4java/SWIGTYPE_p_sqlite3_stmt;I[BII)I

    move-result v0

    .line 739
    .local v0, "rc":I
    iget-object v1, p0, Lcom/almworks/sqlite4java/SQLiteStatement;->myController:Lcom/almworks/sqlite4java/SQLiteController;

    const-string v2, "bind(blob)"

    invoke-virtual {v1, v0, v2, p0}, Lcom/almworks/sqlite4java/SQLiteController;->throwResult(ILjava/lang/String;Ljava/lang/Object;)V

    .line 740
    const/4 v1, 0x1

    iput-boolean v1, p0, Lcom/almworks/sqlite4java/SQLiteStatement;->myHasBindings:Z

    goto :goto_0
.end method

.method public bind(Ljava/lang/String;D)Lcom/almworks/sqlite4java/SQLiteStatement;
    .locals 2
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "value"    # D
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/almworks/sqlite4java/SQLiteException;
        }
    .end annotation

    .prologue
    .line 575
    invoke-direct {p0, p1}, Lcom/almworks/sqlite4java/SQLiteStatement;->getValidBindParameterIndex(Ljava/lang/String;)I

    move-result v0

    invoke-virtual {p0, v0, p2, p3}, Lcom/almworks/sqlite4java/SQLiteStatement;->bind(ID)Lcom/almworks/sqlite4java/SQLiteStatement;

    move-result-object v0

    return-object v0
.end method

.method public bind(Ljava/lang/String;I)Lcom/almworks/sqlite4java/SQLiteStatement;
    .locals 1
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "value"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/almworks/sqlite4java/SQLiteException;
        }
    .end annotation

    .prologue
    .line 609
    invoke-direct {p0, p1}, Lcom/almworks/sqlite4java/SQLiteStatement;->getValidBindParameterIndex(Ljava/lang/String;)I

    move-result v0

    invoke-virtual {p0, v0, p2}, Lcom/almworks/sqlite4java/SQLiteStatement;->bind(II)Lcom/almworks/sqlite4java/SQLiteStatement;

    move-result-object v0

    return-object v0
.end method

.method public bind(Ljava/lang/String;J)Lcom/almworks/sqlite4java/SQLiteStatement;
    .locals 2
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "value"    # J
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/almworks/sqlite4java/SQLiteException;
        }
    .end annotation

    .prologue
    .line 643
    invoke-direct {p0, p1}, Lcom/almworks/sqlite4java/SQLiteStatement;->getValidBindParameterIndex(Ljava/lang/String;)I

    move-result v0

    invoke-virtual {p0, v0, p2, p3}, Lcom/almworks/sqlite4java/SQLiteStatement;->bind(IJ)Lcom/almworks/sqlite4java/SQLiteStatement;

    move-result-object v0

    return-object v0
.end method

.method public bind(Ljava/lang/String;Ljava/lang/String;)Lcom/almworks/sqlite4java/SQLiteStatement;
    .locals 1
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "value"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/almworks/sqlite4java/SQLiteException;
        }
    .end annotation

    .prologue
    .line 685
    invoke-direct {p0, p1}, Lcom/almworks/sqlite4java/SQLiteStatement;->getValidBindParameterIndex(Ljava/lang/String;)I

    move-result v0

    invoke-virtual {p0, v0, p2}, Lcom/almworks/sqlite4java/SQLiteStatement;->bind(ILjava/lang/String;)Lcom/almworks/sqlite4java/SQLiteStatement;

    move-result-object v0

    return-object v0
.end method

.method public bind(Ljava/lang/String;[B)Lcom/almworks/sqlite4java/SQLiteStatement;
    .locals 1
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "value"    # [B
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/almworks/sqlite4java/SQLiteException;
        }
    .end annotation

    .prologue
    .line 713
    invoke-direct {p0, p1}, Lcom/almworks/sqlite4java/SQLiteStatement;->getValidBindParameterIndex(Ljava/lang/String;)I

    move-result v0

    invoke-virtual {p0, v0, p2}, Lcom/almworks/sqlite4java/SQLiteStatement;->bind(I[B)Lcom/almworks/sqlite4java/SQLiteStatement;

    move-result-object v0

    return-object v0
.end method

.method public bind(Ljava/lang/String;[BII)Lcom/almworks/sqlite4java/SQLiteStatement;
    .locals 1
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "value"    # [B
    .param p3, "offset"    # I
    .param p4, "length"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/almworks/sqlite4java/SQLiteException;
        }
    .end annotation

    .prologue
    .line 758
    invoke-direct {p0, p1}, Lcom/almworks/sqlite4java/SQLiteStatement;->getValidBindParameterIndex(Ljava/lang/String;)I

    move-result v0

    invoke-virtual {p0, v0, p2, p3, p4}, Lcom/almworks/sqlite4java/SQLiteStatement;->bind(I[BII)Lcom/almworks/sqlite4java/SQLiteStatement;

    move-result-object v0

    return-object v0
.end method

.method public bindNull(I)Lcom/almworks/sqlite4java/SQLiteStatement;
    .locals 3
    .param p1, "index"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/almworks/sqlite4java/SQLiteException;
        }
    .end annotation

    .prologue
    .line 809
    iget-object v1, p0, Lcom/almworks/sqlite4java/SQLiteStatement;->myController:Lcom/almworks/sqlite4java/SQLiteController;

    invoke-virtual {v1}, Lcom/almworks/sqlite4java/SQLiteController;->validate()V

    .line 810
    invoke-static {}, Lcom/almworks/sqlite4java/Internal;->isFineLogging()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 811
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "bind_null("

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ")"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {p0, v1}, Lcom/almworks/sqlite4java/Internal;->logFine(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 812
    :cond_0
    invoke-direct {p0}, Lcom/almworks/sqlite4java/SQLiteStatement;->handle()Lcom/almworks/sqlite4java/SWIGTYPE_p_sqlite3_stmt;

    move-result-object v1

    invoke-static {v1, p1}, Lcom/almworks/sqlite4java/_SQLiteSwigged;->sqlite3_bind_null(Lcom/almworks/sqlite4java/SWIGTYPE_p_sqlite3_stmt;I)I

    move-result v0

    .line 813
    .local v0, "rc":I
    iget-object v1, p0, Lcom/almworks/sqlite4java/SQLiteStatement;->myController:Lcom/almworks/sqlite4java/SQLiteController;

    const-string v2, "bind(null)"

    invoke-virtual {v1, v0, v2, p0}, Lcom/almworks/sqlite4java/SQLiteController;->throwResult(ILjava/lang/String;Ljava/lang/Object;)V

    .line 815
    return-object p0
.end method

.method public bindNull(Ljava/lang/String;)Lcom/almworks/sqlite4java/SQLiteStatement;
    .locals 1
    .param p1, "name"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/almworks/sqlite4java/SQLiteException;
        }
    .end annotation

    .prologue
    .line 829
    invoke-direct {p0, p1}, Lcom/almworks/sqlite4java/SQLiteStatement;->getValidBindParameterIndex(Ljava/lang/String;)I

    move-result v0

    invoke-virtual {p0, v0}, Lcom/almworks/sqlite4java/SQLiteStatement;->bindNull(I)Lcom/almworks/sqlite4java/SQLiteStatement;

    move-result-object v0

    return-object v0
.end method

.method public bindStream(I)Ljava/io/OutputStream;
    .locals 1
    .param p1, "index"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/almworks/sqlite4java/SQLiteException;
        }
    .end annotation

    .prologue
    .line 846
    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0}, Lcom/almworks/sqlite4java/SQLiteStatement;->bindStream(II)Ljava/io/OutputStream;

    move-result-object v0

    return-object v0
.end method

.method public bindStream(II)Ljava/io/OutputStream;
    .locals 7
    .param p1, "index"    # I
    .param p2, "bufferSize"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/almworks/sqlite4java/SQLiteException;
        }
    .end annotation

    .prologue
    .line 883
    iget-object v4, p0, Lcom/almworks/sqlite4java/SQLiteStatement;->myController:Lcom/almworks/sqlite4java/SQLiteController;

    invoke-virtual {v4}, Lcom/almworks/sqlite4java/SQLiteController;->validate()V

    .line 884
    invoke-static {}, Lcom/almworks/sqlite4java/Internal;->isFineLogging()Z

    move-result v4

    if-eqz v4, :cond_0

    .line 885
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "bindStream("

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, ","

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, ")"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {p0, v4}, Lcom/almworks/sqlite4java/Internal;->logFine(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 887
    :cond_0
    :try_start_0
    iget-object v4, p0, Lcom/almworks/sqlite4java/SQLiteStatement;->myController:Lcom/almworks/sqlite4java/SQLiteController;

    invoke-virtual {v4, p2}, Lcom/almworks/sqlite4java/SQLiteController;->allocateBuffer(I)Lcom/almworks/sqlite4java/DirectBuffer;

    move-result-object v0

    .line 888
    .local v0, "buffer":Lcom/almworks/sqlite4java/DirectBuffer;
    new-instance v3, Lcom/almworks/sqlite4java/SQLiteStatement$BindStream;

    invoke-direct {v3, p0, p1, v0}, Lcom/almworks/sqlite4java/SQLiteStatement$BindStream;-><init>(Lcom/almworks/sqlite4java/SQLiteStatement;ILcom/almworks/sqlite4java/DirectBuffer;)V

    .line 889
    .local v3, "out":Lcom/almworks/sqlite4java/SQLiteStatement$BindStream;
    iget-object v2, p0, Lcom/almworks/sqlite4java/SQLiteStatement;->myBindStreams:Ljava/util/List;

    .line 890
    .local v2, "list":Ljava/util/List;, "Ljava/util/List<Lcom/almworks/sqlite4java/SQLiteStatement$BindStream;>;"
    if-nez v2, :cond_1

    .line 891
    new-instance v2, Ljava/util/ArrayList;

    .end local v2    # "list":Ljava/util/List;, "Ljava/util/List<Lcom/almworks/sqlite4java/SQLiteStatement$BindStream;>;"
    const/4 v4, 0x1

    invoke-direct {v2, v4}, Ljava/util/ArrayList;-><init>(I)V

    .restart local v2    # "list":Ljava/util/List;, "Ljava/util/List<Lcom/almworks/sqlite4java/SQLiteStatement$BindStream;>;"
    iput-object v2, p0, Lcom/almworks/sqlite4java/SQLiteStatement;->myBindStreams:Ljava/util/List;

    .line 893
    :cond_1
    invoke-interface {v2, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 894
    const/4 v4, 0x1

    iput-boolean v4, p0, Lcom/almworks/sqlite4java/SQLiteStatement;->myHasBindings:Z
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 895
    return-object v3

    .line 896
    .end local v0    # "buffer":Lcom/almworks/sqlite4java/DirectBuffer;
    .end local v2    # "list":Ljava/util/List;, "Ljava/util/List<Lcom/almworks/sqlite4java/SQLiteStatement$BindStream;>;"
    .end local v3    # "out":Lcom/almworks/sqlite4java/SQLiteStatement$BindStream;
    :catch_0
    move-exception v1

    .line 897
    .local v1, "e":Ljava/io/IOException;
    new-instance v4, Lcom/almworks/sqlite4java/SQLiteException;

    const/16 v5, -0x63

    const-string v6, "cannot allocate buffer"

    invoke-direct {v4, v5, v6, v1}, Lcom/almworks/sqlite4java/SQLiteException;-><init>(ILjava/lang/String;Ljava/lang/Throwable;)V

    throw v4
.end method

.method public bindStream(Ljava/lang/String;)Ljava/io/OutputStream;
    .locals 2
    .param p1, "name"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/almworks/sqlite4java/SQLiteException;
        }
    .end annotation

    .prologue
    .line 865
    invoke-direct {p0, p1}, Lcom/almworks/sqlite4java/SQLiteStatement;->getValidBindParameterIndex(Ljava/lang/String;)I

    move-result v0

    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1}, Lcom/almworks/sqlite4java/SQLiteStatement;->bindStream(II)Ljava/io/OutputStream;

    move-result-object v0

    return-object v0
.end method

.method public bindStream(Ljava/lang/String;I)Ljava/io/OutputStream;
    .locals 1
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "bufferSize"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/almworks/sqlite4java/SQLiteException;
        }
    .end annotation

    .prologue
    .line 918
    invoke-direct {p0, p1}, Lcom/almworks/sqlite4java/SQLiteStatement;->getValidBindParameterIndex(Ljava/lang/String;)I

    move-result v0

    invoke-virtual {p0, v0, p2}, Lcom/almworks/sqlite4java/SQLiteStatement;->bindStream(II)Ljava/io/OutputStream;

    move-result-object v0

    return-object v0
.end method

.method public bindZeroBlob(II)Lcom/almworks/sqlite4java/SQLiteStatement;
    .locals 3
    .param p1, "index"    # I
    .param p2, "length"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/almworks/sqlite4java/SQLiteException;
        }
    .end annotation

    .prologue
    .line 771
    if-gez p2, :cond_0

    .line 772
    const-string v1, "bind(null zeroblob)"

    invoke-static {p0, v1}, Lcom/almworks/sqlite4java/Internal;->logFine(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 773
    invoke-virtual {p0, p1}, Lcom/almworks/sqlite4java/SQLiteStatement;->bindNull(I)Lcom/almworks/sqlite4java/SQLiteStatement;

    move-result-object p0

    .line 782
    .end local p0    # "this":Lcom/almworks/sqlite4java/SQLiteStatement;
    :goto_0
    return-object p0

    .line 775
    .restart local p0    # "this":Lcom/almworks/sqlite4java/SQLiteStatement;
    :cond_0
    iget-object v1, p0, Lcom/almworks/sqlite4java/SQLiteStatement;->myController:Lcom/almworks/sqlite4java/SQLiteController;

    invoke-virtual {v1}, Lcom/almworks/sqlite4java/SQLiteController;->validate()V

    .line 776
    invoke-static {}, Lcom/almworks/sqlite4java/Internal;->isFineLogging()Z

    move-result v1

    if-eqz v1, :cond_1

    .line 777
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "bindZeroBlob("

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ","

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ")"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {p0, v1}, Lcom/almworks/sqlite4java/Internal;->logFine(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 779
    :cond_1
    invoke-direct {p0}, Lcom/almworks/sqlite4java/SQLiteStatement;->handle()Lcom/almworks/sqlite4java/SWIGTYPE_p_sqlite3_stmt;

    move-result-object v1

    invoke-static {v1, p1, p2}, Lcom/almworks/sqlite4java/_SQLiteSwigged;->sqlite3_bind_zeroblob(Lcom/almworks/sqlite4java/SWIGTYPE_p_sqlite3_stmt;II)I

    move-result v0

    .line 780
    .local v0, "rc":I
    iget-object v1, p0, Lcom/almworks/sqlite4java/SQLiteStatement;->myController:Lcom/almworks/sqlite4java/SQLiteController;

    const-string v2, "bindZeroBlob()"

    invoke-virtual {v1, v0, v2, p0}, Lcom/almworks/sqlite4java/SQLiteController;->throwResult(ILjava/lang/String;Ljava/lang/Object;)V

    .line 781
    const/4 v1, 0x1

    iput-boolean v1, p0, Lcom/almworks/sqlite4java/SQLiteStatement;->myHasBindings:Z

    goto :goto_0
.end method

.method public bindZeroBlob(Ljava/lang/String;I)Lcom/almworks/sqlite4java/SQLiteStatement;
    .locals 1
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "length"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/almworks/sqlite4java/SQLiteException;
        }
    .end annotation

    .prologue
    .line 797
    invoke-direct {p0, p1}, Lcom/almworks/sqlite4java/SQLiteStatement;->getValidBindParameterIndex(Ljava/lang/String;)I

    move-result v0

    invoke-virtual {p0, v0, p2}, Lcom/almworks/sqlite4java/SQLiteStatement;->bindZeroBlob(II)Lcom/almworks/sqlite4java/SQLiteStatement;

    move-result-object v0

    return-object v0
.end method

.method public cancel()V
    .locals 2

    .prologue
    .line 338
    monitor-enter p0

    .line 339
    const/4 v1, 0x1

    :try_start_0
    iput-boolean v1, p0, Lcom/almworks/sqlite4java/SQLiteStatement;->myCancelled:Z

    .line 340
    iget-object v0, p0, Lcom/almworks/sqlite4java/SQLiteStatement;->myProgressHandler:Lcom/almworks/sqlite4java/ProgressHandler;

    .line 341
    .local v0, "handler":Lcom/almworks/sqlite4java/ProgressHandler;
    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 342
    if-eqz v0, :cond_0

    .line 343
    invoke-virtual {v0}, Lcom/almworks/sqlite4java/ProgressHandler;->cancel()V

    .line 345
    :cond_0
    return-void

    .line 341
    .end local v0    # "handler":Lcom/almworks/sqlite4java/ProgressHandler;
    :catchall_0
    move-exception v1

    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v1
.end method

.method clear()V
    .locals 3

    .prologue
    const/4 v2, 0x0

    const/4 v1, 0x0

    .line 1273
    invoke-direct {p0, v1}, Lcom/almworks/sqlite4java/SQLiteStatement;->clearBindStreams(Z)V

    .line 1274
    invoke-direct {p0}, Lcom/almworks/sqlite4java/SQLiteStatement;->clearColumnStreams()V

    .line 1275
    iput-object v2, p0, Lcom/almworks/sqlite4java/SQLiteStatement;->myHandle:Lcom/almworks/sqlite4java/SWIGTYPE_p_sqlite3_stmt;

    .line 1276
    iput-boolean v1, p0, Lcom/almworks/sqlite4java/SQLiteStatement;->myHasRow:Z

    .line 1277
    const/4 v0, -0x1

    iput v0, p0, Lcom/almworks/sqlite4java/SQLiteStatement;->myColumnCount:I

    .line 1278
    iput-boolean v1, p0, Lcom/almworks/sqlite4java/SQLiteStatement;->myHasBindings:Z

    .line 1279
    iput-boolean v1, p0, Lcom/almworks/sqlite4java/SQLiteStatement;->myStepped:Z

    .line 1280
    iget-object v0, p0, Lcom/almworks/sqlite4java/SQLiteStatement;->myController:Lcom/almworks/sqlite4java/SQLiteController;

    invoke-static {v0}, Lcom/almworks/sqlite4java/SQLiteController;->getDisposed(Lcom/almworks/sqlite4java/SQLiteController;)Lcom/almworks/sqlite4java/SQLiteController;

    move-result-object v0

    iput-object v0, p0, Lcom/almworks/sqlite4java/SQLiteStatement;->myController:Lcom/almworks/sqlite4java/SQLiteController;

    .line 1281
    iput-object v2, p0, Lcom/almworks/sqlite4java/SQLiteStatement;->myProfiler:Lcom/almworks/sqlite4java/SQLiteProfiler;

    .line 1282
    const-string v0, "cleared"

    invoke-static {p0, v0}, Lcom/almworks/sqlite4java/Internal;->logFine(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 1283
    return-void
.end method

.method public clearBindings()Lcom/almworks/sqlite4java/SQLiteStatement;
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/almworks/sqlite4java/SQLiteException;
        }
    .end annotation

    .prologue
    const/4 v3, 0x0

    .line 252
    iget-object v1, p0, Lcom/almworks/sqlite4java/SQLiteStatement;->myController:Lcom/almworks/sqlite4java/SQLiteController;

    invoke-virtual {v1}, Lcom/almworks/sqlite4java/SQLiteController;->validate()V

    .line 253
    const-string v1, "clearBindings"

    invoke-static {p0, v1}, Lcom/almworks/sqlite4java/Internal;->logFine(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 254
    iget-boolean v1, p0, Lcom/almworks/sqlite4java/SQLiteStatement;->myHasBindings:Z

    if-eqz v1, :cond_0

    .line 255
    const-string v1, "clearing bindings"

    invoke-static {p0, v1}, Lcom/almworks/sqlite4java/Internal;->logFine(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 256
    invoke-direct {p0}, Lcom/almworks/sqlite4java/SQLiteStatement;->handle()Lcom/almworks/sqlite4java/SWIGTYPE_p_sqlite3_stmt;

    move-result-object v1

    invoke-static {v1}, Lcom/almworks/sqlite4java/_SQLiteSwigged;->sqlite3_clear_bindings(Lcom/almworks/sqlite4java/SWIGTYPE_p_sqlite3_stmt;)I

    move-result v0

    .line 257
    .local v0, "rc":I
    iget-object v1, p0, Lcom/almworks/sqlite4java/SQLiteStatement;->myController:Lcom/almworks/sqlite4java/SQLiteController;

    const-string v2, "clearBindings()"

    invoke-virtual {v1, v0, v2, p0}, Lcom/almworks/sqlite4java/SQLiteController;->throwResult(ILjava/lang/String;Ljava/lang/Object;)V

    .line 258
    invoke-direct {p0, v3}, Lcom/almworks/sqlite4java/SQLiteStatement;->clearBindStreams(Z)V

    .line 260
    .end local v0    # "rc":I
    :cond_0
    iput-boolean v3, p0, Lcom/almworks/sqlite4java/SQLiteStatement;->myHasBindings:Z

    .line 261
    return-object p0
.end method

.method public columnBlob(I)[B
    .locals 6
    .param p1, "column"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/almworks/sqlite4java/SQLiteException;
        }
    .end annotation

    .prologue
    .line 1029
    iget-object v3, p0, Lcom/almworks/sqlite4java/SQLiteStatement;->myController:Lcom/almworks/sqlite4java/SQLiteController;

    invoke-virtual {v3}, Lcom/almworks/sqlite4java/SQLiteController;->validate()V

    .line 1030
    invoke-direct {p0}, Lcom/almworks/sqlite4java/SQLiteStatement;->handle()Lcom/almworks/sqlite4java/SWIGTYPE_p_sqlite3_stmt;

    move-result-object v0

    .line 1031
    .local v0, "handle":Lcom/almworks/sqlite4java/SWIGTYPE_p_sqlite3_stmt;
    const/4 v3, 0x1

    invoke-direct {p0, p1, v0, v3}, Lcom/almworks/sqlite4java/SQLiteStatement;->checkColumn(ILcom/almworks/sqlite4java/SWIGTYPE_p_sqlite3_stmt;Z)V

    .line 1032
    invoke-static {}, Lcom/almworks/sqlite4java/Internal;->isFineLogging()Z

    move-result v3

    if-eqz v3, :cond_0

    .line 1033
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "columnBytes("

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

    .line 1034
    :cond_0
    iget-object v3, p0, Lcom/almworks/sqlite4java/SQLiteStatement;->myController:Lcom/almworks/sqlite4java/SQLiteController;

    invoke-virtual {v3}, Lcom/almworks/sqlite4java/SQLiteController;->getSQLiteManual()Lcom/almworks/sqlite4java/_SQLiteManual;

    move-result-object v2

    .line 1035
    .local v2, "sqlite":Lcom/almworks/sqlite4java/_SQLiteManual;
    invoke-virtual {v2, v0, p1}, Lcom/almworks/sqlite4java/_SQLiteManual;->sqlite3_column_blob(Lcom/almworks/sqlite4java/SWIGTYPE_p_sqlite3_stmt;I)[B

    move-result-object v1

    .line 1036
    .local v1, "r":[B
    iget-object v3, p0, Lcom/almworks/sqlite4java/SQLiteStatement;->myController:Lcom/almworks/sqlite4java/SQLiteController;

    invoke-virtual {v2}, Lcom/almworks/sqlite4java/_SQLiteManual;->getLastReturnCode()I

    move-result v4

    const-string v5, "columnBytes"

    invoke-virtual {v3, v4, v5, p0}, Lcom/almworks/sqlite4java/SQLiteController;->throwResult(ILjava/lang/String;Ljava/lang/Object;)V

    .line 1037
    invoke-static {}, Lcom/almworks/sqlite4java/Internal;->isFineLogging()Z

    move-result v3

    if-eqz v3, :cond_1

    .line 1038
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "columnBytes("

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, ")=["

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    if-nez v1, :cond_2

    const-string v3, "null"

    :goto_0
    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "]"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {p0, v3}, Lcom/almworks/sqlite4java/Internal;->logFine(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 1039
    :cond_1
    return-object v1

    .line 1038
    :cond_2
    array-length v3, v1

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    goto :goto_0
.end method

.method public columnCount()I
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/almworks/sqlite4java/SQLiteException;
        }
    .end annotation

    .prologue
    .line 1104
    iget-object v0, p0, Lcom/almworks/sqlite4java/SQLiteStatement;->myController:Lcom/almworks/sqlite4java/SQLiteController;

    invoke-virtual {v0}, Lcom/almworks/sqlite4java/SQLiteController;->validate()V

    .line 1105
    invoke-direct {p0}, Lcom/almworks/sqlite4java/SQLiteStatement;->handle()Lcom/almworks/sqlite4java/SWIGTYPE_p_sqlite3_stmt;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/almworks/sqlite4java/SQLiteStatement;->getColumnCount(Lcom/almworks/sqlite4java/SWIGTYPE_p_sqlite3_stmt;)I

    move-result v0

    return v0
.end method

.method public columnDouble(I)D
    .locals 5
    .param p1, "column"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/almworks/sqlite4java/SQLiteException;
        }
    .end annotation

    .prologue
    .line 985
    iget-object v1, p0, Lcom/almworks/sqlite4java/SQLiteStatement;->myController:Lcom/almworks/sqlite4java/SQLiteController;

    invoke-virtual {v1}, Lcom/almworks/sqlite4java/SQLiteController;->validate()V

    .line 986
    invoke-direct {p0}, Lcom/almworks/sqlite4java/SQLiteStatement;->handle()Lcom/almworks/sqlite4java/SWIGTYPE_p_sqlite3_stmt;

    move-result-object v0

    .line 987
    .local v0, "handle":Lcom/almworks/sqlite4java/SWIGTYPE_p_sqlite3_stmt;
    const/4 v1, 0x1

    invoke-direct {p0, p1, v0, v1}, Lcom/almworks/sqlite4java/SQLiteStatement;->checkColumn(ILcom/almworks/sqlite4java/SWIGTYPE_p_sqlite3_stmt;Z)V

    .line 988
    invoke-static {}, Lcom/almworks/sqlite4java/Internal;->isFineLogging()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 989
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "columnDouble("

    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v4, ")"

    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {p0, v1}, Lcom/almworks/sqlite4java/Internal;->logFine(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 990
    :cond_0
    invoke-static {v0, p1}, Lcom/almworks/sqlite4java/_SQLiteSwigged;->sqlite3_column_double(Lcom/almworks/sqlite4java/SWIGTYPE_p_sqlite3_stmt;I)D

    move-result-wide v2

    .line 991
    .local v2, "r":D
    invoke-static {}, Lcom/almworks/sqlite4java/Internal;->isFineLogging()Z

    move-result v1

    if-eqz v1, :cond_1

    .line 992
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "columnDouble("

    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v4, ")="

    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v2, v3}, Ljava/lang/StringBuilder;->append(D)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {p0, v1}, Lcom/almworks/sqlite4java/Internal;->logFine(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 993
    :cond_1
    return-wide v2
.end method

.method public columnInt(I)I
    .locals 4
    .param p1, "column"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/almworks/sqlite4java/SQLiteException;
        }
    .end annotation

    .prologue
    .line 963
    iget-object v2, p0, Lcom/almworks/sqlite4java/SQLiteStatement;->myController:Lcom/almworks/sqlite4java/SQLiteController;

    invoke-virtual {v2}, Lcom/almworks/sqlite4java/SQLiteController;->validate()V

    .line 964
    invoke-direct {p0}, Lcom/almworks/sqlite4java/SQLiteStatement;->handle()Lcom/almworks/sqlite4java/SWIGTYPE_p_sqlite3_stmt;

    move-result-object v0

    .line 965
    .local v0, "handle":Lcom/almworks/sqlite4java/SWIGTYPE_p_sqlite3_stmt;
    const/4 v2, 0x1

    invoke-direct {p0, p1, v0, v2}, Lcom/almworks/sqlite4java/SQLiteStatement;->checkColumn(ILcom/almworks/sqlite4java/SWIGTYPE_p_sqlite3_stmt;Z)V

    .line 966
    invoke-static {}, Lcom/almworks/sqlite4java/Internal;->isFineLogging()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 967
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "columnInt("

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, ")"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {p0, v2}, Lcom/almworks/sqlite4java/Internal;->logFine(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 968
    :cond_0
    invoke-static {v0, p1}, Lcom/almworks/sqlite4java/_SQLiteSwigged;->sqlite3_column_int(Lcom/almworks/sqlite4java/SWIGTYPE_p_sqlite3_stmt;I)I

    move-result v1

    .line 969
    .local v1, "r":I
    invoke-static {}, Lcom/almworks/sqlite4java/Internal;->isFineLogging()Z

    move-result v2

    if-eqz v2, :cond_1

    .line 970
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "columnInt("

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, ")="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {p0, v2}, Lcom/almworks/sqlite4java/Internal;->logFine(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 971
    :cond_1
    return v1
.end method

.method public columnLong(I)J
    .locals 5
    .param p1, "column"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/almworks/sqlite4java/SQLiteException;
        }
    .end annotation

    .prologue
    .line 1007
    iget-object v1, p0, Lcom/almworks/sqlite4java/SQLiteStatement;->myController:Lcom/almworks/sqlite4java/SQLiteController;

    invoke-virtual {v1}, Lcom/almworks/sqlite4java/SQLiteController;->validate()V

    .line 1008
    invoke-direct {p0}, Lcom/almworks/sqlite4java/SQLiteStatement;->handle()Lcom/almworks/sqlite4java/SWIGTYPE_p_sqlite3_stmt;

    move-result-object v0

    .line 1009
    .local v0, "handle":Lcom/almworks/sqlite4java/SWIGTYPE_p_sqlite3_stmt;
    const/4 v1, 0x1

    invoke-direct {p0, p1, v0, v1}, Lcom/almworks/sqlite4java/SQLiteStatement;->checkColumn(ILcom/almworks/sqlite4java/SWIGTYPE_p_sqlite3_stmt;Z)V

    .line 1010
    invoke-static {}, Lcom/almworks/sqlite4java/Internal;->isFineLogging()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 1011
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "columnLong("

    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v4, ")"

    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {p0, v1}, Lcom/almworks/sqlite4java/Internal;->logFine(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 1012
    :cond_0
    invoke-static {v0, p1}, Lcom/almworks/sqlite4java/_SQLiteSwigged;->sqlite3_column_int64(Lcom/almworks/sqlite4java/SWIGTYPE_p_sqlite3_stmt;I)J

    move-result-wide v2

    .line 1013
    .local v2, "r":J
    invoke-static {}, Lcom/almworks/sqlite4java/Internal;->isFineLogging()Z

    move-result v1

    if-eqz v1, :cond_1

    .line 1014
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "columnLong("

    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v4, ")="

    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v2, v3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {p0, v1}, Lcom/almworks/sqlite4java/Internal;->logFine(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 1015
    :cond_1
    return-wide v2
.end method

.method public columnNull(I)Z
    .locals 2
    .param p1, "column"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/almworks/sqlite4java/SQLiteException;
        }
    .end annotation

    .prologue
    .line 1083
    iget-object v1, p0, Lcom/almworks/sqlite4java/SQLiteStatement;->myController:Lcom/almworks/sqlite4java/SQLiteController;

    invoke-virtual {v1}, Lcom/almworks/sqlite4java/SQLiteController;->validate()V

    .line 1084
    invoke-direct {p0}, Lcom/almworks/sqlite4java/SQLiteStatement;->handle()Lcom/almworks/sqlite4java/SWIGTYPE_p_sqlite3_stmt;

    move-result-object v1

    invoke-direct {p0, p1, v1}, Lcom/almworks/sqlite4java/SQLiteStatement;->getColumnType(ILcom/almworks/sqlite4java/SWIGTYPE_p_sqlite3_stmt;)I

    move-result v0

    .line 1085
    .local v0, "valueType":I
    const/4 v1, 0x5

    if-ne v0, v1, :cond_0

    const/4 v1, 0x1

    :goto_0
    return v1

    :cond_0
    const/4 v1, 0x0

    goto :goto_0
.end method

.method public columnStream(I)Ljava/io/InputStream;
    .locals 9
    .param p1, "column"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/almworks/sqlite4java/SQLiteException;
        }
    .end annotation

    .prologue
    const/4 v8, 0x1

    .line 1056
    iget-object v5, p0, Lcom/almworks/sqlite4java/SQLiteStatement;->myController:Lcom/almworks/sqlite4java/SQLiteController;

    invoke-virtual {v5}, Lcom/almworks/sqlite4java/SQLiteController;->validate()V

    .line 1057
    invoke-direct {p0}, Lcom/almworks/sqlite4java/SQLiteStatement;->handle()Lcom/almworks/sqlite4java/SWIGTYPE_p_sqlite3_stmt;

    move-result-object v1

    .line 1058
    .local v1, "handle":Lcom/almworks/sqlite4java/SWIGTYPE_p_sqlite3_stmt;
    invoke-direct {p0, p1, v1, v8}, Lcom/almworks/sqlite4java/SQLiteStatement;->checkColumn(ILcom/almworks/sqlite4java/SWIGTYPE_p_sqlite3_stmt;Z)V

    .line 1059
    invoke-static {}, Lcom/almworks/sqlite4java/Internal;->isFineLogging()Z

    move-result v5

    if-eqz v5, :cond_0

    .line 1060
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "columnStream("

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, ")"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {p0, v5}, Lcom/almworks/sqlite4java/Internal;->logFine(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 1061
    :cond_0
    iget-object v5, p0, Lcom/almworks/sqlite4java/SQLiteStatement;->myController:Lcom/almworks/sqlite4java/SQLiteController;

    invoke-virtual {v5}, Lcom/almworks/sqlite4java/SQLiteController;->getSQLiteManual()Lcom/almworks/sqlite4java/_SQLiteManual;

    move-result-object v3

    .line 1062
    .local v3, "sqlite":Lcom/almworks/sqlite4java/_SQLiteManual;
    invoke-virtual {v3, v1, p1}, Lcom/almworks/sqlite4java/_SQLiteManual;->wrapper_column_buffer(Lcom/almworks/sqlite4java/SWIGTYPE_p_sqlite3_stmt;I)Ljava/nio/ByteBuffer;

    move-result-object v0

    .line 1063
    .local v0, "buffer":Ljava/nio/ByteBuffer;
    iget-object v5, p0, Lcom/almworks/sqlite4java/SQLiteStatement;->myController:Lcom/almworks/sqlite4java/SQLiteController;

    invoke-virtual {v3}, Lcom/almworks/sqlite4java/_SQLiteManual;->getLastReturnCode()I

    move-result v6

    const-string v7, "columnStream"

    invoke-virtual {v5, v6, v7, p0}, Lcom/almworks/sqlite4java/SQLiteController;->throwResult(ILjava/lang/String;Ljava/lang/Object;)V

    .line 1064
    if-nez v0, :cond_1

    .line 1065
    const/4 v2, 0x0

    .line 1071
    :goto_0
    return-object v2

    .line 1066
    :cond_1
    new-instance v2, Lcom/almworks/sqlite4java/SQLiteStatement$ColumnStream;

    invoke-direct {v2, p0, v0}, Lcom/almworks/sqlite4java/SQLiteStatement$ColumnStream;-><init>(Lcom/almworks/sqlite4java/SQLiteStatement;Ljava/nio/ByteBuffer;)V

    .line 1067
    .local v2, "in":Lcom/almworks/sqlite4java/SQLiteStatement$ColumnStream;
    iget-object v4, p0, Lcom/almworks/sqlite4java/SQLiteStatement;->myColumnStreams:Ljava/util/List;

    .line 1068
    .local v4, "table":Ljava/util/List;, "Ljava/util/List<Lcom/almworks/sqlite4java/SQLiteStatement$ColumnStream;>;"
    if-nez v4, :cond_2

    .line 1069
    new-instance v4, Ljava/util/ArrayList;

    .end local v4    # "table":Ljava/util/List;, "Ljava/util/List<Lcom/almworks/sqlite4java/SQLiteStatement$ColumnStream;>;"
    invoke-direct {v4, v8}, Ljava/util/ArrayList;-><init>(I)V

    .restart local v4    # "table":Ljava/util/List;, "Ljava/util/List<Lcom/almworks/sqlite4java/SQLiteStatement$ColumnStream;>;"
    iput-object v4, p0, Lcom/almworks/sqlite4java/SQLiteStatement;->myColumnStreams:Ljava/util/List;

    .line 1070
    :cond_2
    invoke-interface {v4, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0
.end method

.method public columnString(I)Ljava/lang/String;
    .locals 7
    .param p1, "column"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/almworks/sqlite4java/SQLiteException;
        }
    .end annotation

    .prologue
    const/16 v6, 0x14

    .line 932
    iget-object v3, p0, Lcom/almworks/sqlite4java/SQLiteStatement;->myController:Lcom/almworks/sqlite4java/SQLiteController;

    invoke-virtual {v3}, Lcom/almworks/sqlite4java/SQLiteController;->validate()V

    .line 933
    invoke-direct {p0}, Lcom/almworks/sqlite4java/SQLiteStatement;->handle()Lcom/almworks/sqlite4java/SWIGTYPE_p_sqlite3_stmt;

    move-result-object v0

    .line 934
    .local v0, "handle":Lcom/almworks/sqlite4java/SWIGTYPE_p_sqlite3_stmt;
    const/4 v3, 0x1

    invoke-direct {p0, p1, v0, v3}, Lcom/almworks/sqlite4java/SQLiteStatement;->checkColumn(ILcom/almworks/sqlite4java/SWIGTYPE_p_sqlite3_stmt;Z)V

    .line 935
    invoke-static {}, Lcom/almworks/sqlite4java/Internal;->isFineLogging()Z

    move-result v3

    if-eqz v3, :cond_0

    .line 936
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "columnString("

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

    .line 937
    :cond_0
    iget-object v3, p0, Lcom/almworks/sqlite4java/SQLiteStatement;->myController:Lcom/almworks/sqlite4java/SQLiteController;

    invoke-virtual {v3}, Lcom/almworks/sqlite4java/SQLiteController;->getSQLiteManual()Lcom/almworks/sqlite4java/_SQLiteManual;

    move-result-object v2

    .line 938
    .local v2, "sqlite":Lcom/almworks/sqlite4java/_SQLiteManual;
    invoke-virtual {v2, v0, p1}, Lcom/almworks/sqlite4java/_SQLiteManual;->sqlite3_column_text(Lcom/almworks/sqlite4java/SWIGTYPE_p_sqlite3_stmt;I)Ljava/lang/String;

    move-result-object v1

    .line 939
    .local v1, "result":Ljava/lang/String;
    iget-object v3, p0, Lcom/almworks/sqlite4java/SQLiteStatement;->myController:Lcom/almworks/sqlite4java/SQLiteController;

    invoke-virtual {v2}, Lcom/almworks/sqlite4java/_SQLiteManual;->getLastReturnCode()I

    move-result v4

    const-string v5, "columnString()"

    invoke-virtual {v3, v4, v5, p0}, Lcom/almworks/sqlite4java/SQLiteController;->throwResult(ILjava/lang/String;Ljava/lang/Object;)V

    .line 940
    invoke-static {}, Lcom/almworks/sqlite4java/Internal;->isFineLogging()Z

    move-result v3

    if-eqz v3, :cond_1

    .line 941
    if-nez v1, :cond_2

    .line 942
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "columnString("

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, ") is null"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {p0, v3}, Lcom/almworks/sqlite4java/Internal;->logFine(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 949
    :cond_1
    :goto_0
    return-object v1

    .line 943
    :cond_2
    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v3

    if-gt v3, v6, :cond_3

    .line 944
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "columnString("

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, ")="

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {p0, v3}, Lcom/almworks/sqlite4java/Internal;->logFine(Ljava/lang/Object;Ljava/lang/Object;)V

    goto :goto_0

    .line 946
    :cond_3
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "columnString("

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, ")="

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const/4 v4, 0x0

    invoke-virtual {v1, v4, v6}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "...."

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {p0, v3}, Lcom/almworks/sqlite4java/Internal;->logFine(Ljava/lang/Object;Ljava/lang/Object;)V

    goto :goto_0
.end method

.method public columnType(I)I
    .locals 1
    .param p1, "column"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/almworks/sqlite4java/SQLiteException;
        }
    .end annotation

    .prologue
    .line 1172
    iget-object v0, p0, Lcom/almworks/sqlite4java/SQLiteStatement;->myController:Lcom/almworks/sqlite4java/SQLiteController;

    invoke-virtual {v0}, Lcom/almworks/sqlite4java/SQLiteController;->validate()V

    .line 1173
    invoke-direct {p0}, Lcom/almworks/sqlite4java/SQLiteStatement;->handle()Lcom/almworks/sqlite4java/SWIGTYPE_p_sqlite3_stmt;

    move-result-object v0

    invoke-direct {p0, p1, v0}, Lcom/almworks/sqlite4java/SQLiteStatement;->getColumnType(ILcom/almworks/sqlite4java/SWIGTYPE_p_sqlite3_stmt;)I

    move-result v0

    return v0
.end method

.method public columnValue(I)Ljava/lang/Object;
    .locals 6
    .param p1, "column"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/almworks/sqlite4java/SQLiteException;
        }
    .end annotation

    .prologue
    const/4 v3, 0x0

    .line 1128
    iget-object v4, p0, Lcom/almworks/sqlite4java/SQLiteStatement;->myController:Lcom/almworks/sqlite4java/SQLiteController;

    invoke-virtual {v4}, Lcom/almworks/sqlite4java/SQLiteController;->validate()V

    .line 1129
    invoke-direct {p0}, Lcom/almworks/sqlite4java/SQLiteStatement;->handle()Lcom/almworks/sqlite4java/SWIGTYPE_p_sqlite3_stmt;

    move-result-object v4

    invoke-direct {p0, p1, v4}, Lcom/almworks/sqlite4java/SQLiteStatement;->getColumnType(ILcom/almworks/sqlite4java/SWIGTYPE_p_sqlite3_stmt;)I

    move-result v2

    .line 1130
    .local v2, "valueType":I
    packed-switch v2, :pswitch_data_0

    .line 1147
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "value type "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, " not yet supported"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    const/4 v5, 0x1

    invoke-static {p0, v4, v5}, Lcom/almworks/sqlite4java/Internal;->recoverableError(Ljava/lang/Object;Ljava/lang/String;Z)V

    .line 1148
    :goto_0
    :pswitch_0
    return-object v3

    .line 1134
    :pswitch_1
    invoke-virtual {p0, p1}, Lcom/almworks/sqlite4java/SQLiteStatement;->columnDouble(I)D

    move-result-wide v4

    invoke-static {v4, v5}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v3

    goto :goto_0

    .line 1136
    :pswitch_2
    invoke-virtual {p0, p1}, Lcom/almworks/sqlite4java/SQLiteStatement;->columnLong(I)J

    move-result-wide v0

    .line 1137
    .local v0, "value":J
    long-to-int v3, v0

    int-to-long v4, v3

    cmp-long v3, v0, v4

    if-nez v3, :cond_0

    .line 1138
    long-to-int v3, v0

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    goto :goto_0

    .line 1140
    :cond_0
    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v3

    goto :goto_0

    .line 1143
    .end local v0    # "value":J
    :pswitch_3
    invoke-virtual {p0, p1}, Lcom/almworks/sqlite4java/SQLiteStatement;->columnString(I)Ljava/lang/String;

    move-result-object v3

    goto :goto_0

    .line 1145
    :pswitch_4
    invoke-virtual {p0, p1}, Lcom/almworks/sqlite4java/SQLiteStatement;->columnBlob(I)[B

    move-result-object v3

    goto :goto_0

    .line 1130
    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_2
        :pswitch_1
        :pswitch_3
        :pswitch_4
        :pswitch_0
    .end packed-switch
.end method

.method public dispose()V
    .locals 3

    .prologue
    .line 178
    iget-object v1, p0, Lcom/almworks/sqlite4java/SQLiteStatement;->myHandle:Lcom/almworks/sqlite4java/SWIGTYPE_p_sqlite3_stmt;

    if-nez v1, :cond_0

    .line 190
    :goto_0
    return-void

    .line 181
    :cond_0
    :try_start_0
    iget-object v1, p0, Lcom/almworks/sqlite4java/SQLiteStatement;->myController:Lcom/almworks/sqlite4java/SQLiteController;

    invoke-virtual {v1}, Lcom/almworks/sqlite4java/SQLiteController;->validate()V
    :try_end_0
    .catch Lcom/almworks/sqlite4java/SQLiteException; {:try_start_0 .. :try_end_0} :catch_0

    .line 186
    const-string v1, "disposing"

    invoke-static {p0, v1}, Lcom/almworks/sqlite4java/Internal;->logFine(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 187
    iget-object v1, p0, Lcom/almworks/sqlite4java/SQLiteStatement;->myController:Lcom/almworks/sqlite4java/SQLiteController;

    invoke-virtual {v1, p0}, Lcom/almworks/sqlite4java/SQLiteController;->dispose(Lcom/almworks/sqlite4java/SQLiteStatement;)V

    .line 189
    invoke-virtual {p0}, Lcom/almworks/sqlite4java/SQLiteStatement;->clear()V

    goto :goto_0

    .line 182
    :catch_0
    move-exception v0

    .line 183
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

.method public getBindParameterCount()I
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/almworks/sqlite4java/SQLiteException;
        }
    .end annotation

    .prologue
    .line 502
    iget-object v0, p0, Lcom/almworks/sqlite4java/SQLiteStatement;->myController:Lcom/almworks/sqlite4java/SQLiteController;

    invoke-virtual {v0}, Lcom/almworks/sqlite4java/SQLiteController;->validate()V

    .line 503
    invoke-direct {p0}, Lcom/almworks/sqlite4java/SQLiteStatement;->handle()Lcom/almworks/sqlite4java/SWIGTYPE_p_sqlite3_stmt;

    move-result-object v0

    invoke-static {v0}, Lcom/almworks/sqlite4java/_SQLiteSwigged;->sqlite3_bind_parameter_count(Lcom/almworks/sqlite4java/SWIGTYPE_p_sqlite3_stmt;)I

    move-result v0

    return v0
.end method

.method public getBindParameterIndex(Ljava/lang/String;)I
    .locals 1
    .param p1, "name"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/almworks/sqlite4java/SQLiteException;
        }
    .end annotation

    .prologue
    .line 528
    iget-object v0, p0, Lcom/almworks/sqlite4java/SQLiteStatement;->myController:Lcom/almworks/sqlite4java/SQLiteController;

    invoke-virtual {v0}, Lcom/almworks/sqlite4java/SQLiteController;->validate()V

    .line 529
    invoke-direct {p0}, Lcom/almworks/sqlite4java/SQLiteStatement;->handle()Lcom/almworks/sqlite4java/SWIGTYPE_p_sqlite3_stmt;

    move-result-object v0

    invoke-static {v0, p1}, Lcom/almworks/sqlite4java/_SQLiteSwigged;->sqlite3_bind_parameter_index(Lcom/almworks/sqlite4java/SWIGTYPE_p_sqlite3_stmt;Ljava/lang/String;)I

    move-result v0

    return v0
.end method

.method public getBindParameterName(I)Ljava/lang/String;
    .locals 1
    .param p1, "index"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/almworks/sqlite4java/SQLiteException;
        }
    .end annotation

    .prologue
    .line 515
    iget-object v0, p0, Lcom/almworks/sqlite4java/SQLiteStatement;->myController:Lcom/almworks/sqlite4java/SQLiteController;

    invoke-virtual {v0}, Lcom/almworks/sqlite4java/SQLiteController;->validate()V

    .line 516
    invoke-direct {p0}, Lcom/almworks/sqlite4java/SQLiteStatement;->handle()Lcom/almworks/sqlite4java/SWIGTYPE_p_sqlite3_stmt;

    move-result-object v0

    invoke-static {v0, p1}, Lcom/almworks/sqlite4java/_SQLiteSwigged;->sqlite3_bind_parameter_name(Lcom/almworks/sqlite4java/SWIGTYPE_p_sqlite3_stmt;I)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getColumnDatabaseName(I)Ljava/lang/String;
    .locals 4
    .param p1, "column"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/almworks/sqlite4java/SQLiteException;
        }
    .end annotation

    .prologue
    .line 1225
    iget-object v2, p0, Lcom/almworks/sqlite4java/SQLiteStatement;->myController:Lcom/almworks/sqlite4java/SQLiteController;

    invoke-virtual {v2}, Lcom/almworks/sqlite4java/SQLiteController;->validate()V

    .line 1226
    invoke-direct {p0}, Lcom/almworks/sqlite4java/SQLiteStatement;->handle()Lcom/almworks/sqlite4java/SWIGTYPE_p_sqlite3_stmt;

    move-result-object v0

    .line 1227
    .local v0, "handle":Lcom/almworks/sqlite4java/SWIGTYPE_p_sqlite3_stmt;
    const/4 v2, 0x0

    invoke-direct {p0, p1, v0, v2}, Lcom/almworks/sqlite4java/SQLiteStatement;->checkColumn(ILcom/almworks/sqlite4java/SWIGTYPE_p_sqlite3_stmt;Z)V

    .line 1228
    invoke-static {}, Lcom/almworks/sqlite4java/Internal;->isFineLogging()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 1229
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "columnDatabaseName("

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, ")"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {p0, v2}, Lcom/almworks/sqlite4java/Internal;->logFine(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 1230
    :cond_0
    invoke-static {v0, p1}, Lcom/almworks/sqlite4java/_SQLiteSwigged;->sqlite3_column_database_name(Lcom/almworks/sqlite4java/SWIGTYPE_p_sqlite3_stmt;I)Ljava/lang/String;

    move-result-object v1

    .line 1231
    .local v1, "r":Ljava/lang/String;
    invoke-static {}, Lcom/almworks/sqlite4java/Internal;->isFineLogging()Z

    move-result v2

    if-eqz v2, :cond_1

    .line 1232
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "columnDatabaseName("

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, ")="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {p0, v2}, Lcom/almworks/sqlite4java/Internal;->logFine(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 1233
    :cond_1
    return-object v1
.end method

.method public getColumnName(I)Ljava/lang/String;
    .locals 4
    .param p1, "column"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/almworks/sqlite4java/SQLiteException;
        }
    .end annotation

    .prologue
    .line 1185
    iget-object v2, p0, Lcom/almworks/sqlite4java/SQLiteStatement;->myController:Lcom/almworks/sqlite4java/SQLiteController;

    invoke-virtual {v2}, Lcom/almworks/sqlite4java/SQLiteController;->validate()V

    .line 1186
    invoke-direct {p0}, Lcom/almworks/sqlite4java/SQLiteStatement;->handle()Lcom/almworks/sqlite4java/SWIGTYPE_p_sqlite3_stmt;

    move-result-object v0

    .line 1187
    .local v0, "handle":Lcom/almworks/sqlite4java/SWIGTYPE_p_sqlite3_stmt;
    const/4 v2, 0x0

    invoke-direct {p0, p1, v0, v2}, Lcom/almworks/sqlite4java/SQLiteStatement;->checkColumn(ILcom/almworks/sqlite4java/SWIGTYPE_p_sqlite3_stmt;Z)V

    .line 1188
    invoke-static {}, Lcom/almworks/sqlite4java/Internal;->isFineLogging()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 1189
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "columnName("

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, ")"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {p0, v2}, Lcom/almworks/sqlite4java/Internal;->logFine(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 1190
    :cond_0
    invoke-static {v0, p1}, Lcom/almworks/sqlite4java/_SQLiteSwigged;->sqlite3_column_name(Lcom/almworks/sqlite4java/SWIGTYPE_p_sqlite3_stmt;I)Ljava/lang/String;

    move-result-object v1

    .line 1191
    .local v1, "r":Ljava/lang/String;
    invoke-static {}, Lcom/almworks/sqlite4java/Internal;->isFineLogging()Z

    move-result v2

    if-eqz v2, :cond_1

    .line 1192
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "columnName("

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, ")="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {p0, v2}, Lcom/almworks/sqlite4java/Internal;->logFine(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 1193
    :cond_1
    return-object v1
.end method

.method public getColumnOriginName(I)Ljava/lang/String;
    .locals 4
    .param p1, "column"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/almworks/sqlite4java/SQLiteException;
        }
    .end annotation

    .prologue
    .line 1246
    iget-object v2, p0, Lcom/almworks/sqlite4java/SQLiteStatement;->myController:Lcom/almworks/sqlite4java/SQLiteController;

    invoke-virtual {v2}, Lcom/almworks/sqlite4java/SQLiteController;->validate()V

    .line 1247
    invoke-direct {p0}, Lcom/almworks/sqlite4java/SQLiteStatement;->handle()Lcom/almworks/sqlite4java/SWIGTYPE_p_sqlite3_stmt;

    move-result-object v0

    .line 1248
    .local v0, "handle":Lcom/almworks/sqlite4java/SWIGTYPE_p_sqlite3_stmt;
    const/4 v2, 0x0

    invoke-direct {p0, p1, v0, v2}, Lcom/almworks/sqlite4java/SQLiteStatement;->checkColumn(ILcom/almworks/sqlite4java/SWIGTYPE_p_sqlite3_stmt;Z)V

    .line 1249
    invoke-static {}, Lcom/almworks/sqlite4java/Internal;->isFineLogging()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 1250
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "columnOriginName("

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, ")"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {p0, v2}, Lcom/almworks/sqlite4java/Internal;->logFine(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 1251
    :cond_0
    invoke-static {v0, p1}, Lcom/almworks/sqlite4java/_SQLiteSwigged;->sqlite3_column_origin_name(Lcom/almworks/sqlite4java/SWIGTYPE_p_sqlite3_stmt;I)Ljava/lang/String;

    move-result-object v1

    .line 1252
    .local v1, "r":Ljava/lang/String;
    invoke-static {}, Lcom/almworks/sqlite4java/Internal;->isFineLogging()Z

    move-result v2

    if-eqz v2, :cond_1

    .line 1253
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "columnOriginName("

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, ")="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {p0, v2}, Lcom/almworks/sqlite4java/Internal;->logFine(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 1254
    :cond_1
    return-object v1
.end method

.method public getColumnTableName(I)Ljava/lang/String;
    .locals 4
    .param p1, "column"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/almworks/sqlite4java/SQLiteException;
        }
    .end annotation

    .prologue
    .line 1205
    iget-object v2, p0, Lcom/almworks/sqlite4java/SQLiteStatement;->myController:Lcom/almworks/sqlite4java/SQLiteController;

    invoke-virtual {v2}, Lcom/almworks/sqlite4java/SQLiteController;->validate()V

    .line 1206
    invoke-direct {p0}, Lcom/almworks/sqlite4java/SQLiteStatement;->handle()Lcom/almworks/sqlite4java/SWIGTYPE_p_sqlite3_stmt;

    move-result-object v0

    .line 1207
    .local v0, "handle":Lcom/almworks/sqlite4java/SWIGTYPE_p_sqlite3_stmt;
    const/4 v2, 0x0

    invoke-direct {p0, p1, v0, v2}, Lcom/almworks/sqlite4java/SQLiteStatement;->checkColumn(ILcom/almworks/sqlite4java/SWIGTYPE_p_sqlite3_stmt;Z)V

    .line 1208
    invoke-static {}, Lcom/almworks/sqlite4java/Internal;->isFineLogging()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 1209
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "columnTableName("

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, ")"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {p0, v2}, Lcom/almworks/sqlite4java/Internal;->logFine(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 1210
    :cond_0
    invoke-static {v0, p1}, Lcom/almworks/sqlite4java/_SQLiteSwigged;->sqlite3_column_table_name(Lcom/almworks/sqlite4java/SWIGTYPE_p_sqlite3_stmt;I)Ljava/lang/String;

    move-result-object v1

    .line 1211
    .local v1, "r":Ljava/lang/String;
    invoke-static {}, Lcom/almworks/sqlite4java/Internal;->isFineLogging()Z

    move-result v2

    if-eqz v2, :cond_1

    .line 1212
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "columnTableName("

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, ")="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {p0, v2}, Lcom/almworks/sqlite4java/Internal;->logFine(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 1213
    :cond_1
    return-object v1
.end method

.method public getSqlParts()Lcom/almworks/sqlite4java/SQLParts;
    .locals 1

    .prologue
    .line 165
    iget-object v0, p0, Lcom/almworks/sqlite4java/SQLiteStatement;->mySqlParts:Lcom/almworks/sqlite4java/SQLParts;

    return-object v0
.end method

.method public hasBindings()Z
    .locals 1

    .prologue
    .line 362
    iget-boolean v0, p0, Lcom/almworks/sqlite4java/SQLiteStatement;->myHasBindings:Z

    return v0
.end method

.method public hasRow()Z
    .locals 1

    .prologue
    .line 353
    iget-boolean v0, p0, Lcom/almworks/sqlite4java/SQLiteStatement;->myHasRow:Z

    return v0
.end method

.method public hasStepped()Z
    .locals 1

    .prologue
    .line 371
    iget-boolean v0, p0, Lcom/almworks/sqlite4java/SQLiteStatement;->myStepped:Z

    return v0
.end method

.method public isDisposed()Z
    .locals 1

    .prologue
    .line 154
    iget-object v0, p0, Lcom/almworks/sqlite4java/SQLiteStatement;->myHandle:Lcom/almworks/sqlite4java/SWIGTYPE_p_sqlite3_stmt;

    if-nez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public isReadOnly()Z
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/almworks/sqlite4java/SQLiteException;
        }
    .end annotation

    .prologue
    .line 1265
    iget-object v0, p0, Lcom/almworks/sqlite4java/SQLiteStatement;->myController:Lcom/almworks/sqlite4java/SQLiteController;

    invoke-virtual {v0}, Lcom/almworks/sqlite4java/SQLiteController;->validate()V

    .line 1266
    invoke-direct {p0}, Lcom/almworks/sqlite4java/SQLiteStatement;->handle()Lcom/almworks/sqlite4java/SWIGTYPE_p_sqlite3_stmt;

    move-result-object v0

    invoke-static {v0}, Lcom/almworks/sqlite4java/_SQLiteSwigged;->sqlite3_stmt_readonly(Lcom/almworks/sqlite4java/SWIGTYPE_p_sqlite3_stmt;)I

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public loadInts(I[III)I
    .locals 16
    .param p1, "column"    # I
    .param p2, "buffer"    # [I
    .param p3, "offset"    # I
    .param p4, "length"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/almworks/sqlite4java/SQLiteException;
        }
    .end annotation

    .prologue
    .line 407
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/almworks/sqlite4java/SQLiteStatement;->myController:Lcom/almworks/sqlite4java/SQLiteController;

    invoke-virtual {v4}, Lcom/almworks/sqlite4java/SQLiteController;->validate()V

    .line 408
    if-eqz p2, :cond_0

    if-lez p4, :cond_0

    if-ltz p3, :cond_0

    add-int v4, p3, p4

    move-object/from16 v0, p2

    array-length v5, v0

    if-le v4, v5, :cond_2

    .line 409
    :cond_0
    sget-boolean v4, Lcom/almworks/sqlite4java/SQLiteStatement;->$assertionsDisabled:Z

    if-nez v4, :cond_1

    new-instance v4, Ljava/lang/AssertionError;

    invoke-direct {v4}, Ljava/lang/AssertionError;-><init>()V

    throw v4

    .line 410
    :cond_1
    const/4 v13, 0x0

    .line 431
    :goto_0
    return v13

    .line 412
    :cond_2
    invoke-static {}, Lcom/almworks/sqlite4java/Internal;->isFineLogging()Z

    move-result v4

    if-eqz v4, :cond_3

    .line 413
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "loadInts("

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    move/from16 v0, p1

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, ","

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    move/from16 v0, p3

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, ","

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    move/from16 v0, p4

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, ")"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    move-object/from16 v0, p0

    invoke-static {v0, v4}, Lcom/almworks/sqlite4java/Internal;->logFine(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 414
    :cond_3
    move-object/from16 v0, p0

    iget-boolean v4, v0, Lcom/almworks/sqlite4java/SQLiteStatement;->myStepped:Z

    if-eqz v4, :cond_4

    move-object/from16 v0, p0

    iget-boolean v4, v0, Lcom/almworks/sqlite4java/SQLiteStatement;->myHasRow:Z

    if-nez v4, :cond_4

    .line 415
    const/4 v13, 0x0

    goto :goto_0

    .line 416
    :cond_4
    invoke-direct/range {p0 .. p0}, Lcom/almworks/sqlite4java/SQLiteStatement;->handle()Lcom/almworks/sqlite4java/SWIGTYPE_p_sqlite3_stmt;

    move-result-object v3

    .line 419
    .local v3, "handle":Lcom/almworks/sqlite4java/SWIGTYPE_p_sqlite3_stmt;
    invoke-direct/range {p0 .. p0}, Lcom/almworks/sqlite4java/SQLiteStatement;->prepareStep()Lcom/almworks/sqlite4java/ProgressHandler;

    move-result-object v14

    .line 421
    .local v14, "ph":Lcom/almworks/sqlite4java/ProgressHandler;
    :try_start_0
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/almworks/sqlite4java/SQLiteStatement;->myController:Lcom/almworks/sqlite4java/SQLiteController;

    invoke-virtual {v4}, Lcom/almworks/sqlite4java/SQLiteController;->getSQLiteManual()Lcom/almworks/sqlite4java/_SQLiteManual;

    move-result-object v2

    .line 422
    .local v2, "manual":Lcom/almworks/sqlite4java/_SQLiteManual;
    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/almworks/sqlite4java/SQLiteStatement;->myProfiler:Lcom/almworks/sqlite4java/SQLiteProfiler;

    .line 423
    .local v15, "profiler":Lcom/almworks/sqlite4java/SQLiteProfiler;
    if-nez v15, :cond_6

    const-wide/16 v8, 0x0

    .local v8, "from":J
    :goto_1
    move/from16 v4, p1

    move-object/from16 v5, p2

    move/from16 v6, p3

    move/from16 v7, p4

    .line 424
    invoke-virtual/range {v2 .. v7}, Lcom/almworks/sqlite4java/_SQLiteManual;->wrapper_load_ints(Lcom/almworks/sqlite4java/SWIGTYPE_p_sqlite3_stmt;I[III)I

    move-result v13

    .line 425
    .local v13, "r":I
    invoke-virtual {v2}, Lcom/almworks/sqlite4java/_SQLiteManual;->getLastReturnCode()I

    move-result v12

    .line 426
    .local v12, "rc":I
    if-eqz v15, :cond_5

    move-object/from16 v0, p0

    iget-boolean v6, v0, Lcom/almworks/sqlite4java/SQLiteStatement;->myStepped:Z

    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/almworks/sqlite4java/SQLiteStatement;->mySqlParts:Lcom/almworks/sqlite4java/SQLParts;

    invoke-virtual {v4}, Lcom/almworks/sqlite4java/SQLParts;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {}, Ljava/lang/System;->nanoTime()J

    move-result-wide v10

    move-object v5, v15

    invoke-virtual/range {v5 .. v13}, Lcom/almworks/sqlite4java/SQLiteProfiler;->reportLoadInts(ZLjava/lang/String;JJII)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 428
    :cond_5
    const-string v4, "loadInts"

    move-object/from16 v0, p0

    invoke-direct {v0, v14, v4}, Lcom/almworks/sqlite4java/SQLiteStatement;->finalizeStep(Lcom/almworks/sqlite4java/ProgressHandler;Ljava/lang/String;)V

    .line 430
    const-string v4, "loadInts"

    move-object/from16 v0, p0

    invoke-direct {v0, v12, v4}, Lcom/almworks/sqlite4java/SQLiteStatement;->stepResult(ILjava/lang/String;)V

    goto/16 :goto_0

    .line 423
    .end local v8    # "from":J
    .end local v12    # "rc":I
    .end local v13    # "r":I
    :cond_6
    :try_start_1
    invoke-static {}, Ljava/lang/System;->nanoTime()J
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    move-result-wide v8

    goto :goto_1

    .line 428
    .end local v2    # "manual":Lcom/almworks/sqlite4java/_SQLiteManual;
    .end local v15    # "profiler":Lcom/almworks/sqlite4java/SQLiteProfiler;
    :catchall_0
    move-exception v4

    const-string v5, "loadInts"

    move-object/from16 v0, p0

    invoke-direct {v0, v14, v5}, Lcom/almworks/sqlite4java/SQLiteStatement;->finalizeStep(Lcom/almworks/sqlite4java/ProgressHandler;Ljava/lang/String;)V

    throw v4
.end method

.method public loadLongs(I[JII)I
    .locals 16
    .param p1, "column"    # I
    .param p2, "buffer"    # [J
    .param p3, "offset"    # I
    .param p4, "length"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/almworks/sqlite4java/SQLiteException;
        }
    .end annotation

    .prologue
    .line 467
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/almworks/sqlite4java/SQLiteStatement;->myController:Lcom/almworks/sqlite4java/SQLiteController;

    invoke-virtual {v4}, Lcom/almworks/sqlite4java/SQLiteController;->validate()V

    .line 468
    if-eqz p2, :cond_0

    if-lez p4, :cond_0

    if-ltz p3, :cond_0

    add-int v4, p3, p4

    move-object/from16 v0, p2

    array-length v5, v0

    if-le v4, v5, :cond_2

    .line 469
    :cond_0
    sget-boolean v4, Lcom/almworks/sqlite4java/SQLiteStatement;->$assertionsDisabled:Z

    if-nez v4, :cond_1

    new-instance v4, Ljava/lang/AssertionError;

    invoke-direct {v4}, Ljava/lang/AssertionError;-><init>()V

    throw v4

    .line 470
    :cond_1
    const/4 v13, 0x0

    .line 491
    :goto_0
    return v13

    .line 472
    :cond_2
    invoke-static {}, Lcom/almworks/sqlite4java/Internal;->isFineLogging()Z

    move-result v4

    if-eqz v4, :cond_3

    .line 473
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "loadLongs("

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    move/from16 v0, p1

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, ","

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    move/from16 v0, p3

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, ","

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    move/from16 v0, p4

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, ")"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    move-object/from16 v0, p0

    invoke-static {v0, v4}, Lcom/almworks/sqlite4java/Internal;->logFine(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 474
    :cond_3
    move-object/from16 v0, p0

    iget-boolean v4, v0, Lcom/almworks/sqlite4java/SQLiteStatement;->myStepped:Z

    if-eqz v4, :cond_4

    move-object/from16 v0, p0

    iget-boolean v4, v0, Lcom/almworks/sqlite4java/SQLiteStatement;->myHasRow:Z

    if-nez v4, :cond_4

    .line 475
    const/4 v13, 0x0

    goto :goto_0

    .line 476
    :cond_4
    invoke-direct/range {p0 .. p0}, Lcom/almworks/sqlite4java/SQLiteStatement;->handle()Lcom/almworks/sqlite4java/SWIGTYPE_p_sqlite3_stmt;

    move-result-object v3

    .line 479
    .local v3, "handle":Lcom/almworks/sqlite4java/SWIGTYPE_p_sqlite3_stmt;
    invoke-direct/range {p0 .. p0}, Lcom/almworks/sqlite4java/SQLiteStatement;->prepareStep()Lcom/almworks/sqlite4java/ProgressHandler;

    move-result-object v14

    .line 481
    .local v14, "ph":Lcom/almworks/sqlite4java/ProgressHandler;
    :try_start_0
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/almworks/sqlite4java/SQLiteStatement;->myController:Lcom/almworks/sqlite4java/SQLiteController;

    invoke-virtual {v4}, Lcom/almworks/sqlite4java/SQLiteController;->getSQLiteManual()Lcom/almworks/sqlite4java/_SQLiteManual;

    move-result-object v2

    .line 482
    .local v2, "manual":Lcom/almworks/sqlite4java/_SQLiteManual;
    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/almworks/sqlite4java/SQLiteStatement;->myProfiler:Lcom/almworks/sqlite4java/SQLiteProfiler;

    .line 483
    .local v15, "profiler":Lcom/almworks/sqlite4java/SQLiteProfiler;
    if-nez v15, :cond_6

    const-wide/16 v8, 0x0

    .local v8, "from":J
    :goto_1
    move/from16 v4, p1

    move-object/from16 v5, p2

    move/from16 v6, p3

    move/from16 v7, p4

    .line 484
    invoke-virtual/range {v2 .. v7}, Lcom/almworks/sqlite4java/_SQLiteManual;->wrapper_load_longs(Lcom/almworks/sqlite4java/SWIGTYPE_p_sqlite3_stmt;I[JII)I

    move-result v13

    .line 485
    .local v13, "r":I
    invoke-virtual {v2}, Lcom/almworks/sqlite4java/_SQLiteManual;->getLastReturnCode()I

    move-result v12

    .line 486
    .local v12, "rc":I
    if-eqz v15, :cond_5

    move-object/from16 v0, p0

    iget-boolean v6, v0, Lcom/almworks/sqlite4java/SQLiteStatement;->myStepped:Z

    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/almworks/sqlite4java/SQLiteStatement;->mySqlParts:Lcom/almworks/sqlite4java/SQLParts;

    invoke-virtual {v4}, Lcom/almworks/sqlite4java/SQLParts;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {}, Ljava/lang/System;->nanoTime()J

    move-result-wide v10

    move-object v5, v15

    invoke-virtual/range {v5 .. v13}, Lcom/almworks/sqlite4java/SQLiteProfiler;->reportLoadLongs(ZLjava/lang/String;JJII)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 488
    :cond_5
    const-string v4, "loadLongs"

    move-object/from16 v0, p0

    invoke-direct {v0, v14, v4}, Lcom/almworks/sqlite4java/SQLiteStatement;->finalizeStep(Lcom/almworks/sqlite4java/ProgressHandler;Ljava/lang/String;)V

    .line 490
    const-string v4, "loadLongs"

    move-object/from16 v0, p0

    invoke-direct {v0, v12, v4}, Lcom/almworks/sqlite4java/SQLiteStatement;->stepResult(ILjava/lang/String;)V

    goto/16 :goto_0

    .line 483
    .end local v8    # "from":J
    .end local v12    # "rc":I
    .end local v13    # "r":I
    :cond_6
    :try_start_1
    invoke-static {}, Ljava/lang/System;->nanoTime()J
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    move-result-wide v8

    goto :goto_1

    .line 488
    .end local v2    # "manual":Lcom/almworks/sqlite4java/_SQLiteManual;
    .end local v15    # "profiler":Lcom/almworks/sqlite4java/SQLiteProfiler;
    :catchall_0
    move-exception v4

    const-string v5, "loadLongs"

    move-object/from16 v0, p0

    invoke-direct {v0, v14, v5}, Lcom/almworks/sqlite4java/SQLiteStatement;->finalizeStep(Lcom/almworks/sqlite4java/ProgressHandler;Ljava/lang/String;)V

    throw v4
.end method

.method public reset()Lcom/almworks/sqlite4java/SQLiteStatement;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/almworks/sqlite4java/SQLiteException;
        }
    .end annotation

    .prologue
    .line 241
    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lcom/almworks/sqlite4java/SQLiteStatement;->reset(Z)Lcom/almworks/sqlite4java/SQLiteStatement;

    move-result-object v0

    return-object v0
.end method

.method public reset(Z)Lcom/almworks/sqlite4java/SQLiteStatement;
    .locals 6
    .param p1, "clearBindings"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/almworks/sqlite4java/SQLiteException;
        }
    .end annotation

    .prologue
    const/4 v5, 0x0

    .line 205
    iget-object v3, p0, Lcom/almworks/sqlite4java/SQLiteStatement;->myController:Lcom/almworks/sqlite4java/SQLiteController;

    invoke-virtual {v3}, Lcom/almworks/sqlite4java/SQLiteController;->validate()V

    .line 206
    invoke-static {}, Lcom/almworks/sqlite4java/Internal;->isFineLogging()Z

    move-result v0

    .line 207
    .local v0, "fineLogging":Z
    if-eqz v0, :cond_0

    .line 208
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "reset("

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, ")"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {p0, v3}, Lcom/almworks/sqlite4java/Internal;->logFine(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 209
    :cond_0
    invoke-direct {p0}, Lcom/almworks/sqlite4java/SQLiteStatement;->handle()Lcom/almworks/sqlite4java/SWIGTYPE_p_sqlite3_stmt;

    move-result-object v1

    .line 210
    .local v1, "handle":Lcom/almworks/sqlite4java/SWIGTYPE_p_sqlite3_stmt;
    invoke-direct {p0}, Lcom/almworks/sqlite4java/SQLiteStatement;->clearColumnStreams()V

    .line 211
    iget-boolean v3, p0, Lcom/almworks/sqlite4java/SQLiteStatement;->myStepped:Z

    if-eqz v3, :cond_2

    .line 212
    if-eqz v0, :cond_1

    .line 213
    const-string v3, "resetting"

    invoke-static {p0, v3}, Lcom/almworks/sqlite4java/Internal;->logFine(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 214
    :cond_1
    invoke-static {v1}, Lcom/almworks/sqlite4java/_SQLiteSwigged;->sqlite3_reset(Lcom/almworks/sqlite4java/SWIGTYPE_p_sqlite3_stmt;)I

    .line 216
    :cond_2
    iput-boolean v5, p0, Lcom/almworks/sqlite4java/SQLiteStatement;->myHasRow:Z

    .line 217
    iput-boolean v5, p0, Lcom/almworks/sqlite4java/SQLiteStatement;->myStepped:Z

    .line 218
    const/4 v3, -0x1

    iput v3, p0, Lcom/almworks/sqlite4java/SQLiteStatement;->myColumnCount:I

    .line 219
    if-eqz p1, :cond_4

    iget-boolean v3, p0, Lcom/almworks/sqlite4java/SQLiteStatement;->myHasBindings:Z

    if-eqz v3, :cond_4

    .line 220
    if-eqz v0, :cond_3

    .line 221
    const-string v3, "clearing bindings"

    invoke-static {p0, v3}, Lcom/almworks/sqlite4java/Internal;->logFine(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 222
    :cond_3
    invoke-static {v1}, Lcom/almworks/sqlite4java/_SQLiteSwigged;->sqlite3_clear_bindings(Lcom/almworks/sqlite4java/SWIGTYPE_p_sqlite3_stmt;)I

    move-result v2

    .line 223
    .local v2, "rc":I
    iget-object v3, p0, Lcom/almworks/sqlite4java/SQLiteStatement;->myController:Lcom/almworks/sqlite4java/SQLiteController;

    const-string v4, "reset.clearBindings()"

    invoke-virtual {v3, v2, v4, p0}, Lcom/almworks/sqlite4java/SQLiteController;->throwResult(ILjava/lang/String;Ljava/lang/Object;)V

    .line 224
    invoke-direct {p0, v5}, Lcom/almworks/sqlite4java/SQLiteStatement;->clearBindStreams(Z)V

    .line 225
    iput-boolean v5, p0, Lcom/almworks/sqlite4java/SQLiteStatement;->myHasBindings:Z

    .line 227
    .end local v2    # "rc":I
    :cond_4
    monitor-enter p0

    .line 228
    const/4 v3, 0x0

    :try_start_0
    iput-boolean v3, p0, Lcom/almworks/sqlite4java/SQLiteStatement;->myCancelled:Z

    .line 229
    monitor-exit p0

    .line 230
    return-object p0

    .line 229
    :catchall_0
    move-exception v3

    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v3
.end method

.method statementHandle()Lcom/almworks/sqlite4java/SWIGTYPE_p_sqlite3_stmt;
    .locals 1

    .prologue
    .line 1421
    iget-object v0, p0, Lcom/almworks/sqlite4java/SQLiteStatement;->myHandle:Lcom/almworks/sqlite4java/SWIGTYPE_p_sqlite3_stmt;

    return-object v0
.end method

.method public step()Z
    .locals 10
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/almworks/sqlite4java/SQLiteException;
        }
    .end annotation

    .prologue
    .line 286
    iget-object v2, p0, Lcom/almworks/sqlite4java/SQLiteStatement;->myController:Lcom/almworks/sqlite4java/SQLiteController;

    invoke-virtual {v2}, Lcom/almworks/sqlite4java/SQLiteController;->validate()V

    .line 287
    invoke-static {}, Lcom/almworks/sqlite4java/Internal;->isFineLogging()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 288
    const-string v2, "step"

    invoke-static {p0, v2}, Lcom/almworks/sqlite4java/Internal;->logFine(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 289
    :cond_0
    invoke-direct {p0}, Lcom/almworks/sqlite4java/SQLiteStatement;->handle()Lcom/almworks/sqlite4java/SWIGTYPE_p_sqlite3_stmt;

    move-result-object v0

    .line 291
    .local v0, "handle":Lcom/almworks/sqlite4java/SWIGTYPE_p_sqlite3_stmt;
    invoke-direct {p0}, Lcom/almworks/sqlite4java/SQLiteStatement;->prepareStep()Lcom/almworks/sqlite4java/ProgressHandler;

    move-result-object v9

    .line 293
    .local v9, "ph":Lcom/almworks/sqlite4java/ProgressHandler;
    :try_start_0
    iget-object v1, p0, Lcom/almworks/sqlite4java/SQLiteStatement;->myProfiler:Lcom/almworks/sqlite4java/SQLiteProfiler;

    .line 294
    .local v1, "profiler":Lcom/almworks/sqlite4java/SQLiteProfiler;
    if-nez v1, :cond_2

    const-wide/16 v4, 0x0

    .line 295
    .local v4, "from":J
    :goto_0
    invoke-static {v0}, Lcom/almworks/sqlite4java/_SQLiteSwigged;->sqlite3_step(Lcom/almworks/sqlite4java/SWIGTYPE_p_sqlite3_stmt;)I

    move-result v8

    .line 296
    .local v8, "rc":I
    if-eqz v1, :cond_1

    .line 297
    iget-boolean v2, p0, Lcom/almworks/sqlite4java/SQLiteStatement;->myStepped:Z

    iget-object v3, p0, Lcom/almworks/sqlite4java/SQLiteStatement;->mySqlParts:Lcom/almworks/sqlite4java/SQLParts;

    invoke-virtual {v3}, Lcom/almworks/sqlite4java/SQLParts;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {}, Ljava/lang/System;->nanoTime()J

    move-result-wide v6

    invoke-virtual/range {v1 .. v8}, Lcom/almworks/sqlite4java/SQLiteProfiler;->reportStep(ZLjava/lang/String;JJI)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 299
    :cond_1
    const-string v2, "step"

    invoke-direct {p0, v9, v2}, Lcom/almworks/sqlite4java/SQLiteStatement;->finalizeStep(Lcom/almworks/sqlite4java/ProgressHandler;Ljava/lang/String;)V

    .line 301
    const-string v2, "step"

    invoke-direct {p0, v8, v2}, Lcom/almworks/sqlite4java/SQLiteStatement;->stepResult(ILjava/lang/String;)V

    .line 302
    iget-boolean v2, p0, Lcom/almworks/sqlite4java/SQLiteStatement;->myHasRow:Z

    return v2

    .line 294
    .end local v4    # "from":J
    .end local v8    # "rc":I
    :cond_2
    :try_start_1
    invoke-static {}, Ljava/lang/System;->nanoTime()J
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    move-result-wide v4

    goto :goto_0

    .line 299
    .end local v1    # "profiler":Lcom/almworks/sqlite4java/SQLiteProfiler;
    :catchall_0
    move-exception v2

    const-string v3, "step"

    invoke-direct {p0, v9, v3}, Lcom/almworks/sqlite4java/SQLiteStatement;->finalizeStep(Lcom/almworks/sqlite4java/ProgressHandler;Ljava/lang/String;)V

    throw v2
.end method

.method public stepThrough()Lcom/almworks/sqlite4java/SQLiteStatement;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/almworks/sqlite4java/SQLiteException;
        }
    .end annotation

    .prologue
    .line 315
    :cond_0
    invoke-virtual {p0}, Lcom/almworks/sqlite4java/SQLiteStatement;->step()Z

    move-result v0

    if-nez v0, :cond_0

    .line 316
    return-object p0
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .prologue
    .line 1407
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "["

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/almworks/sqlite4java/SQLiteStatement;->mySqlParts:Lcom/almworks/sqlite4java/SQLParts;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "]"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/almworks/sqlite4java/SQLiteStatement;->myController:Lcom/almworks/sqlite4java/SQLiteController;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
