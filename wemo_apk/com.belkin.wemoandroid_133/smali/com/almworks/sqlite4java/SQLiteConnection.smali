.class public final Lcom/almworks/sqlite4java/SQLiteConnection;
.super Ljava/lang/Object;
.source "SQLiteConnection.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/almworks/sqlite4java/SQLiteConnection$1;,
        Lcom/almworks/sqlite4java/SQLiteConnection$UncachedController;,
        Lcom/almworks/sqlite4java/SQLiteConnection$CachedController;,
        Lcom/almworks/sqlite4java/SQLiteConnection$BaseController;
    }
.end annotation


# static fields
.field static final synthetic $assertionsDisabled:Z

.field public static final DEFAULT_DB_NAME:Ljava/lang/String; = "main"

.field private static final DEFAULT_STEPS_PER_CALLBACK:I = 0x1

.field private static final MAX_POOLED_DIRECT_BUFFER_SIZE:I = 0x100000


# instance fields
.field private final myBlobs:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Lcom/almworks/sqlite4java/SQLiteBlob;",
            ">;"
        }
    .end annotation
.end field

.field private final myBuffers:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Lcom/almworks/sqlite4java/DirectBuffer;",
            ">;"
        }
    .end annotation
.end field

.field private myBuffersTotalSize:I

.field private final myCachedController:Lcom/almworks/sqlite4java/SQLiteController;

.field private volatile myConfinement:Ljava/lang/Thread;

.field private myDisposed:Z

.field private final myFile:Ljava/io/File;

.field private myHandle:Lcom/almworks/sqlite4java/SWIGTYPE_p_sqlite3;

.field private myIntArrayModule:Lcom/almworks/sqlite4java/SWIGTYPE_p_intarray_module;

.field private final myLock:Ljava/lang/Object;

.field private myLongArrayCounter:I

.field private final myLongArrays:Ljavolution/util/stripped/FastMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljavolution/util/stripped/FastMap",
            "<",
            "Ljava/lang/String;",
            "Lcom/almworks/sqlite4java/SWIGTYPE_p_intarray;",
            ">;"
        }
    .end annotation
.end field

.field private final myNumber:I

.field private myOpenFlags:I

.field private volatile myProfiler:Lcom/almworks/sqlite4java/SQLiteProfiler;

.field private myProgressHandler:Lcom/almworks/sqlite4java/ProgressHandler;

.field private final mySQLiteManual:Lcom/almworks/sqlite4java/_SQLiteManual;

.field private final myStatementCache:Ljavolution/util/stripped/FastMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljavolution/util/stripped/FastMap",
            "<",
            "Lcom/almworks/sqlite4java/SQLParts;",
            "Lcom/almworks/sqlite4java/SWIGTYPE_p_sqlite3_stmt;",
            ">;"
        }
    .end annotation
.end field

.field private final myStatements:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Lcom/almworks/sqlite4java/SQLiteStatement;",
            ">;"
        }
    .end annotation
.end field

.field private volatile myStepsPerCallback:I

.field private final myUncachedController:Lcom/almworks/sqlite4java/SQLiteController;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 51
    const-class v0, Lcom/almworks/sqlite4java/SQLiteConnection;

    invoke-virtual {v0}, Ljava/lang/Class;->desiredAssertionStatus()Z

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    sput-boolean v0, Lcom/almworks/sqlite4java/SQLiteConnection;->$assertionsDisabled:Z

    return-void

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public constructor <init>()V
    .locals 1

    .prologue
    .line 189
    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lcom/almworks/sqlite4java/SQLiteConnection;-><init>(Ljava/io/File;)V

    .line 190
    return-void
.end method

.method public constructor <init>(Ljava/io/File;)V
    .locals 4
    .param p1, "dbfile"    # Ljava/io/File;

    .prologue
    const/4 v3, 0x0

    const/16 v2, 0xa

    .line 177
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 65
    invoke-static {}, Lcom/almworks/sqlite4java/Internal;->nextConnectionNumber()I

    move-result v0

    iput v0, p0, Lcom/almworks/sqlite4java/SQLiteConnection;->myNumber:I

    .line 71
    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Lcom/almworks/sqlite4java/SQLiteConnection;->myLock:Ljava/lang/Object;

    .line 91
    new-instance v0, Ljava/util/ArrayList;

    const/16 v1, 0x64

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(I)V

    iput-object v0, p0, Lcom/almworks/sqlite4java/SQLiteConnection;->myStatements:Ljava/util/ArrayList;

    .line 96
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0, v2}, Ljava/util/ArrayList;-><init>(I)V

    iput-object v0, p0, Lcom/almworks/sqlite4java/SQLiteConnection;->myBlobs:Ljava/util/ArrayList;

    .line 102
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0, v2}, Ljava/util/ArrayList;-><init>(I)V

    iput-object v0, p0, Lcom/almworks/sqlite4java/SQLiteConnection;->myBuffers:Ljava/util/ArrayList;

    .line 116
    new-instance v0, Ljavolution/util/stripped/FastMap;

    invoke-direct {v0}, Ljavolution/util/stripped/FastMap;-><init>()V

    iput-object v0, p0, Lcom/almworks/sqlite4java/SQLiteConnection;->myStatementCache:Ljavolution/util/stripped/FastMap;

    .line 121
    new-instance v0, Lcom/almworks/sqlite4java/SQLiteConnection$CachedController;

    invoke-direct {v0, p0, v3}, Lcom/almworks/sqlite4java/SQLiteConnection$CachedController;-><init>(Lcom/almworks/sqlite4java/SQLiteConnection;Lcom/almworks/sqlite4java/SQLiteConnection$1;)V

    iput-object v0, p0, Lcom/almworks/sqlite4java/SQLiteConnection;->myCachedController:Lcom/almworks/sqlite4java/SQLiteController;

    .line 126
    new-instance v0, Lcom/almworks/sqlite4java/SQLiteConnection$UncachedController;

    invoke-direct {v0, p0, v3}, Lcom/almworks/sqlite4java/SQLiteConnection$UncachedController;-><init>(Lcom/almworks/sqlite4java/SQLiteConnection;Lcom/almworks/sqlite4java/SQLiteConnection$1;)V

    iput-object v0, p0, Lcom/almworks/sqlite4java/SQLiteConnection;->myUncachedController:Lcom/almworks/sqlite4java/SQLiteController;

    .line 132
    new-instance v0, Lcom/almworks/sqlite4java/_SQLiteManual;

    invoke-direct {v0}, Lcom/almworks/sqlite4java/_SQLiteManual;-><init>()V

    iput-object v0, p0, Lcom/almworks/sqlite4java/SQLiteConnection;->mySQLiteManual:Lcom/almworks/sqlite4java/_SQLiteManual;

    .line 147
    const/4 v0, 0x1

    iput v0, p0, Lcom/almworks/sqlite4java/SQLiteConnection;->myStepsPerCallback:I

    .line 158
    invoke-static {}, Ljavolution/util/stripped/FastMap;->newInstance()Ljavolution/util/stripped/FastMap;

    move-result-object v0

    iput-object v0, p0, Lcom/almworks/sqlite4java/SQLiteConnection;->myLongArrays:Ljavolution/util/stripped/FastMap;

    .line 178
    iput-object p1, p0, Lcom/almworks/sqlite4java/SQLiteConnection;->myFile:Ljava/io/File;

    .line 179
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "instantiated ["

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/almworks/sqlite4java/SQLiteConnection;->myFile:Ljava/io/File;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "]"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {p0, v0}, Lcom/almworks/sqlite4java/Internal;->logInfo(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 180
    return-void
.end method

.method static synthetic access$1000(Lcom/almworks/sqlite4java/SQLiteConnection;Lcom/almworks/sqlite4java/SQLiteLongArray;)V
    .locals 0
    .param p0, "x0"    # Lcom/almworks/sqlite4java/SQLiteConnection;
    .param p1, "x1"    # Lcom/almworks/sqlite4java/SQLiteLongArray;

    .prologue
    .line 51
    invoke-direct {p0, p1}, Lcom/almworks/sqlite4java/SQLiteConnection;->cacheArrayHandle(Lcom/almworks/sqlite4java/SQLiteLongArray;)V

    return-void
.end method

.method static synthetic access$1100(Lcom/almworks/sqlite4java/SQLiteConnection;Lcom/almworks/sqlite4java/SQLiteStatement;)V
    .locals 0
    .param p0, "x0"    # Lcom/almworks/sqlite4java/SQLiteConnection;
    .param p1, "x1"    # Lcom/almworks/sqlite4java/SQLiteStatement;

    .prologue
    .line 51
    invoke-direct {p0, p1}, Lcom/almworks/sqlite4java/SQLiteConnection;->finalizeStatement(Lcom/almworks/sqlite4java/SQLiteStatement;)V

    return-void
.end method

.method static synthetic access$1200(Lcom/almworks/sqlite4java/SQLiteConnection;Lcom/almworks/sqlite4java/SQLiteLongArray;)V
    .locals 0
    .param p0, "x0"    # Lcom/almworks/sqlite4java/SQLiteConnection;
    .param p1, "x1"    # Lcom/almworks/sqlite4java/SQLiteLongArray;

    .prologue
    .line 51
    invoke-direct {p0, p1}, Lcom/almworks/sqlite4java/SQLiteConnection;->finalizeArray(Lcom/almworks/sqlite4java/SQLiteLongArray;)V

    return-void
.end method

.method static synthetic access$200(Lcom/almworks/sqlite4java/SQLiteConnection;)Lcom/almworks/sqlite4java/SWIGTYPE_p_sqlite3;
    .locals 1
    .param p0, "x0"    # Lcom/almworks/sqlite4java/SQLiteConnection;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/almworks/sqlite4java/SQLiteException;
        }
    .end annotation

    .prologue
    .line 51
    invoke-direct {p0}, Lcom/almworks/sqlite4java/SQLiteConnection;->handle()Lcom/almworks/sqlite4java/SWIGTYPE_p_sqlite3;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$300(Lcom/almworks/sqlite4java/SQLiteConnection;Lcom/almworks/sqlite4java/SQLiteBlob;)V
    .locals 0
    .param p0, "x0"    # Lcom/almworks/sqlite4java/SQLiteConnection;
    .param p1, "x1"    # Lcom/almworks/sqlite4java/SQLiteBlob;

    .prologue
    .line 51
    invoke-direct {p0, p1}, Lcom/almworks/sqlite4java/SQLiteConnection;->finalizeBlob(Lcom/almworks/sqlite4java/SQLiteBlob;)V

    return-void
.end method

.method static synthetic access$400(Lcom/almworks/sqlite4java/SQLiteConnection;)Lcom/almworks/sqlite4java/_SQLiteManual;
    .locals 1
    .param p0, "x0"    # Lcom/almworks/sqlite4java/SQLiteConnection;

    .prologue
    .line 51
    iget-object v0, p0, Lcom/almworks/sqlite4java/SQLiteConnection;->mySQLiteManual:Lcom/almworks/sqlite4java/_SQLiteManual;

    return-object v0
.end method

.method static synthetic access$500(Lcom/almworks/sqlite4java/SQLiteConnection;I)Lcom/almworks/sqlite4java/DirectBuffer;
    .locals 1
    .param p0, "x0"    # Lcom/almworks/sqlite4java/SQLiteConnection;
    .param p1, "x1"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/almworks/sqlite4java/SQLiteException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 51
    invoke-direct {p0, p1}, Lcom/almworks/sqlite4java/SQLiteConnection;->allocateBuffer(I)Lcom/almworks/sqlite4java/DirectBuffer;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$600(Lcom/almworks/sqlite4java/SQLiteConnection;Lcom/almworks/sqlite4java/DirectBuffer;)V
    .locals 0
    .param p0, "x0"    # Lcom/almworks/sqlite4java/SQLiteConnection;
    .param p1, "x1"    # Lcom/almworks/sqlite4java/DirectBuffer;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/almworks/sqlite4java/SQLiteException;
        }
    .end annotation

    .prologue
    .line 51
    invoke-direct {p0, p1}, Lcom/almworks/sqlite4java/SQLiteConnection;->freeBuffer(Lcom/almworks/sqlite4java/DirectBuffer;)V

    return-void
.end method

.method static synthetic access$700(Lcom/almworks/sqlite4java/SQLiteConnection;)Lcom/almworks/sqlite4java/ProgressHandler;
    .locals 1
    .param p0, "x0"    # Lcom/almworks/sqlite4java/SQLiteConnection;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/almworks/sqlite4java/SQLiteException;
        }
    .end annotation

    .prologue
    .line 51
    invoke-direct {p0}, Lcom/almworks/sqlite4java/SQLiteConnection;->getProgressHandler()Lcom/almworks/sqlite4java/ProgressHandler;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$900(Lcom/almworks/sqlite4java/SQLiteConnection;Lcom/almworks/sqlite4java/SQLiteStatement;)V
    .locals 0
    .param p0, "x0"    # Lcom/almworks/sqlite4java/SQLiteConnection;
    .param p1, "x1"    # Lcom/almworks/sqlite4java/SQLiteStatement;

    .prologue
    .line 51
    invoke-direct {p0, p1}, Lcom/almworks/sqlite4java/SQLiteConnection;->cacheStatementHandle(Lcom/almworks/sqlite4java/SQLiteStatement;)V

    return-void
.end method

.method private allocateBuffer(I)Lcom/almworks/sqlite4java/DirectBuffer;
    .locals 11
    .param p1, "minimumSize"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/almworks/sqlite4java/SQLiteException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 1558
    invoke-virtual {p0}, Lcom/almworks/sqlite4java/SQLiteConnection;->checkThread()V

    .line 1559
    invoke-direct {p0}, Lcom/almworks/sqlite4java/SQLiteConnection;->handle()Lcom/almworks/sqlite4java/SWIGTYPE_p_sqlite3;

    .line 1560
    const/16 v6, 0x400

    .line 1561
    .local v6, "size":I
    :goto_0
    add-int/lit8 v7, p1, 0x2

    if-ge v6, v7, :cond_0

    .line 1562
    shl-int/lit8 v6, v6, 0x1

    goto :goto_0

    .line 1563
    :cond_0
    add-int/lit8 v5, v6, -0x2

    .line 1565
    .local v5, "payloadSize":I
    const/4 v2, 0x0

    .line 1566
    .local v2, "buffer":Lcom/almworks/sqlite4java/DirectBuffer;
    iget-object v8, p0, Lcom/almworks/sqlite4java/SQLiteConnection;->myLock:Ljava/lang/Object;

    monitor-enter v8

    .line 1567
    :try_start_0
    iget-object v7, p0, Lcom/almworks/sqlite4java/SQLiteConnection;->myBuffers:Ljava/util/ArrayList;

    invoke-virtual {v7}, Ljava/util/ArrayList;->size()I

    move-result v7

    add-int/lit8 v4, v7, -0x1

    .local v4, "i":I
    :goto_1
    if-ltz v4, :cond_3

    .line 1568
    iget-object v7, p0, Lcom/almworks/sqlite4java/SQLiteConnection;->myBuffers:Ljava/util/ArrayList;

    invoke-virtual {v7, v4}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/almworks/sqlite4java/DirectBuffer;

    .line 1569
    .local v1, "b":Lcom/almworks/sqlite4java/DirectBuffer;
    invoke-virtual {v1}, Lcom/almworks/sqlite4java/DirectBuffer;->isValid()Z

    move-result v7

    if-nez v7, :cond_2

    .line 1570
    iget-object v7, p0, Lcom/almworks/sqlite4java/SQLiteConnection;->myBuffers:Ljava/util/ArrayList;

    invoke-virtual {v7, v4}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    .line 1571
    iget v7, p0, Lcom/almworks/sqlite4java/SQLiteConnection;->myBuffersTotalSize:I

    invoke-virtual {v1}, Lcom/almworks/sqlite4java/DirectBuffer;->getCapacity()I

    move-result v9

    sub-int/2addr v7, v9

    iput v7, p0, Lcom/almworks/sqlite4java/SQLiteConnection;->myBuffersTotalSize:I

    .line 1567
    :cond_1
    :goto_2
    add-int/lit8 v4, v4, -0x1

    goto :goto_1

    .line 1574
    :cond_2
    invoke-virtual {v1}, Lcom/almworks/sqlite4java/DirectBuffer;->getCapacity()I

    move-result v7

    if-ge v7, v5, :cond_4

    .line 1581
    .end local v1    # "b":Lcom/almworks/sqlite4java/DirectBuffer;
    :cond_3
    if-eqz v2, :cond_5

    .line 1582
    invoke-virtual {v2}, Lcom/almworks/sqlite4java/DirectBuffer;->incUsed()V

    .line 1583
    invoke-virtual {v2}, Lcom/almworks/sqlite4java/DirectBuffer;->data()Ljava/nio/ByteBuffer;

    move-result-object v7

    invoke-virtual {v7}, Ljava/nio/ByteBuffer;->clear()Ljava/nio/Buffer;

    .line 1584
    monitor-exit v8

    move-object v3, v2

    .line 1608
    .end local v2    # "buffer":Lcom/almworks/sqlite4java/DirectBuffer;
    .local v3, "buffer":Lcom/almworks/sqlite4java/DirectBuffer;
    :goto_3
    return-object v3

    .line 1577
    .end local v3    # "buffer":Lcom/almworks/sqlite4java/DirectBuffer;
    .restart local v1    # "b":Lcom/almworks/sqlite4java/DirectBuffer;
    .restart local v2    # "buffer":Lcom/almworks/sqlite4java/DirectBuffer;
    :cond_4
    invoke-virtual {v1}, Lcom/almworks/sqlite4java/DirectBuffer;->isUsed()Z

    move-result v7

    if-nez v7, :cond_1

    .line 1578
    move-object v2, v1

    goto :goto_2

    .line 1586
    .end local v1    # "b":Lcom/almworks/sqlite4java/DirectBuffer;
    :cond_5
    iget v0, p0, Lcom/almworks/sqlite4java/SQLiteConnection;->myBuffersTotalSize:I

    .line 1587
    .local v0, "allocated":I
    monitor-exit v8
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 1588
    sget-boolean v7, Lcom/almworks/sqlite4java/SQLiteConnection;->$assertionsDisabled:Z

    if-nez v7, :cond_6

    if-eqz v2, :cond_6

    new-instance v7, Ljava/lang/AssertionError;

    invoke-direct {v7}, Ljava/lang/AssertionError;-><init>()V

    throw v7

    .line 1587
    .end local v0    # "allocated":I
    .end local v4    # "i":I
    :catchall_0
    move-exception v7

    :try_start_1
    monitor-exit v8
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v7

    .line 1589
    .restart local v0    # "allocated":I
    .restart local v4    # "i":I
    :cond_6
    iget-object v7, p0, Lcom/almworks/sqlite4java/SQLiteConnection;->mySQLiteManual:Lcom/almworks/sqlite4java/_SQLiteManual;

    invoke-virtual {v7, v6}, Lcom/almworks/sqlite4java/_SQLiteManual;->wrapper_alloc(I)Lcom/almworks/sqlite4java/DirectBuffer;

    move-result-object v2

    .line 1590
    iget-object v7, p0, Lcom/almworks/sqlite4java/SQLiteConnection;->mySQLiteManual:Lcom/almworks/sqlite4java/_SQLiteManual;

    invoke-virtual {v7}, Lcom/almworks/sqlite4java/_SQLiteManual;->getLastReturnCode()I

    move-result v7

    const-string v8, "allocateBuffer"

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v9

    invoke-virtual {p0, v7, v8, v9}, Lcom/almworks/sqlite4java/SQLiteConnection;->throwResult(ILjava/lang/String;Ljava/lang/Object;)V

    .line 1591
    if-nez v2, :cond_7

    .line 1592
    new-instance v7, Lcom/almworks/sqlite4java/SQLiteException;

    const/16 v8, -0x63

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "cannot allocate buffer ["

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v9

    const-string v10, "]"

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-direct {v7, v8, v9}, Lcom/almworks/sqlite4java/SQLiteException;-><init>(ILjava/lang/String;)V

    throw v7

    .line 1594
    :cond_7
    invoke-virtual {v2}, Lcom/almworks/sqlite4java/DirectBuffer;->incUsed()V

    .line 1595
    invoke-virtual {v2}, Lcom/almworks/sqlite4java/DirectBuffer;->data()Ljava/nio/ByteBuffer;

    move-result-object v7

    invoke-virtual {v7}, Ljava/nio/ByteBuffer;->clear()Ljava/nio/Buffer;

    .line 1596
    add-int v7, v0, v6

    const/high16 v8, 0x100000

    if-ge v7, v8, :cond_9

    .line 1597
    iget-object v8, p0, Lcom/almworks/sqlite4java/SQLiteConnection;->myLock:Ljava/lang/Object;

    monitor-enter v8

    .line 1599
    const/4 v4, 0x0

    :goto_4
    :try_start_2
    iget-object v7, p0, Lcom/almworks/sqlite4java/SQLiteConnection;->myBuffers:Ljava/util/ArrayList;

    invoke-virtual {v7}, Ljava/util/ArrayList;->size()I

    move-result v7

    if-ge v4, v7, :cond_8

    .line 1600
    iget-object v7, p0, Lcom/almworks/sqlite4java/SQLiteConnection;->myBuffers:Ljava/util/ArrayList;

    invoke-virtual {v7, v4}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/almworks/sqlite4java/DirectBuffer;

    .line 1601
    .restart local v1    # "b":Lcom/almworks/sqlite4java/DirectBuffer;
    invoke-virtual {v1}, Lcom/almworks/sqlite4java/DirectBuffer;->getCapacity()I

    move-result v7

    if-le v7, v5, :cond_a

    .line 1604
    .end local v1    # "b":Lcom/almworks/sqlite4java/DirectBuffer;
    :cond_8
    iget-object v7, p0, Lcom/almworks/sqlite4java/SQLiteConnection;->myBuffers:Ljava/util/ArrayList;

    invoke-virtual {v7, v4, v2}, Ljava/util/ArrayList;->add(ILjava/lang/Object;)V

    .line 1605
    iget v7, p0, Lcom/almworks/sqlite4java/SQLiteConnection;->myBuffersTotalSize:I

    invoke-virtual {v2}, Lcom/almworks/sqlite4java/DirectBuffer;->getCapacity()I

    move-result v9

    add-int/2addr v7, v9

    iput v7, p0, Lcom/almworks/sqlite4java/SQLiteConnection;->myBuffersTotalSize:I

    .line 1606
    monitor-exit v8

    :cond_9
    move-object v3, v2

    .line 1608
    .end local v2    # "buffer":Lcom/almworks/sqlite4java/DirectBuffer;
    .restart local v3    # "buffer":Lcom/almworks/sqlite4java/DirectBuffer;
    goto/16 :goto_3

    .line 1599
    .end local v3    # "buffer":Lcom/almworks/sqlite4java/DirectBuffer;
    .restart local v1    # "b":Lcom/almworks/sqlite4java/DirectBuffer;
    .restart local v2    # "buffer":Lcom/almworks/sqlite4java/DirectBuffer;
    :cond_a
    add-int/lit8 v4, v4, 0x1

    goto :goto_4

    .line 1606
    .end local v1    # "b":Lcom/almworks/sqlite4java/DirectBuffer;
    :catchall_1
    move-exception v7

    monitor-exit v8
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    throw v7
.end method

.method private static appendW(Ljava/lang/StringBuilder;Ljava/lang/String;IC)V
    .locals 1
    .param p0, "buf"    # Ljava/lang/StringBuilder;
    .param p1, "what"    # Ljava/lang/String;
    .param p2, "width"    # I
    .param p3, "filler"    # C

    .prologue
    .line 1671
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1672
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v0

    .local v0, "i":I
    :goto_0
    if-ge v0, p2, :cond_0

    .line 1673
    invoke-virtual {p0, p3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 1672
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 1674
    :cond_0
    return-void
.end method

.method private cacheArrayHandle(Lcom/almworks/sqlite4java/SQLiteLongArray;)V
    .locals 7
    .param p1, "array"    # Lcom/almworks/sqlite4java/SQLiteLongArray;

    .prologue
    .line 1301
    invoke-static {}, Lcom/almworks/sqlite4java/Internal;->isFineLogging()Z

    move-result v5

    if-eqz v5, :cond_0

    .line 1302
    const-string v5, "returning handle to cache"

    invoke-static {p1, v5}, Lcom/almworks/sqlite4java/Internal;->logFine(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 1303
    :cond_0
    const/4 v2, 0x0

    .line 1304
    .local v2, "finalize":Z
    invoke-virtual {p1}, Lcom/almworks/sqlite4java/SQLiteLongArray;->arrayHandle()Lcom/almworks/sqlite4java/SWIGTYPE_p_intarray;

    move-result-object v3

    .line 1305
    .local v3, "handle":Lcom/almworks/sqlite4java/SWIGTYPE_p_intarray;
    if-nez v3, :cond_2

    .line 1306
    const-string v5, "no handle"

    invoke-static {p1, v5}, Lcom/almworks/sqlite4java/Internal;->logWarn(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 1324
    :cond_1
    :goto_0
    return-void

    .line 1310
    :cond_2
    :try_start_0
    invoke-static {v3}, Lcom/almworks/sqlite4java/_SQLiteManual;->sqlite3_intarray_unbind(Lcom/almworks/sqlite4java/SWIGTYPE_p_intarray;)I

    move-result v4

    .line 1311
    .local v4, "rc":I
    const-string v5, "intarray_unbind"

    invoke-virtual {p0, v4, v5}, Lcom/almworks/sqlite4java/SQLiteConnection;->throwResult(ILjava/lang/String;)V
    :try_end_0
    .catch Lcom/almworks/sqlite4java/SQLiteException; {:try_start_0 .. :try_end_0} :catch_0

    .line 1316
    .end local v4    # "rc":I
    :goto_1
    if-eqz v2, :cond_3

    .line 1317
    invoke-direct {p0, p1}, Lcom/almworks/sqlite4java/SQLiteConnection;->finalizeArray(Lcom/almworks/sqlite4java/SQLiteLongArray;)V

    goto :goto_0

    .line 1312
    :catch_0
    move-exception v0

    .line 1313
    .local v0, "e":Lcom/almworks/sqlite4java/SQLiteException;
    sget-object v5, Ljava/util/logging/Level;->WARNING:Ljava/util/logging/Level;

    const-string v6, "exception when clearing"

    invoke-static {v5, p1, v6, v0}, Lcom/almworks/sqlite4java/Internal;->log(Ljava/util/logging/Level;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Throwable;)V

    .line 1314
    const/4 v2, 0x1

    goto :goto_1

    .line 1319
    .end local v0    # "e":Lcom/almworks/sqlite4java/SQLiteException;
    :cond_3
    iget-object v5, p0, Lcom/almworks/sqlite4java/SQLiteConnection;->myLongArrays:Ljavolution/util/stripped/FastMap;

    invoke-virtual {p1}, Lcom/almworks/sqlite4java/SQLiteLongArray;->getName()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6, v3}, Ljavolution/util/stripped/FastMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/almworks/sqlite4java/SWIGTYPE_p_intarray;

    .line 1320
    .local v1, "expunged":Lcom/almworks/sqlite4java/SWIGTYPE_p_intarray;
    if-eqz v1, :cond_1

    .line 1321
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v5, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, " expunged "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {p1, v5}, Lcom/almworks/sqlite4java/Internal;->logWarn(Ljava/lang/Object;Ljava/lang/Object;)V

    goto :goto_0
.end method

.method private cacheStatementHandle(Lcom/almworks/sqlite4java/SQLiteStatement;)V
    .locals 9
    .param p1, "statement"    # Lcom/almworks/sqlite4java/SQLiteStatement;

    .prologue
    .line 1330
    invoke-static {}, Lcom/almworks/sqlite4java/Internal;->isFineLogging()Z

    move-result v6

    if-eqz v6, :cond_0

    .line 1331
    const-string v6, "returning handle to cache"

    invoke-static {p1, v6}, Lcom/almworks/sqlite4java/Internal;->logFine(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 1332
    :cond_0
    const/4 v2, 0x0

    .line 1333
    .local v2, "finalize":Z
    invoke-virtual {p1}, Lcom/almworks/sqlite4java/SQLiteStatement;->statementHandle()Lcom/almworks/sqlite4java/SWIGTYPE_p_sqlite3_stmt;

    move-result-object v3

    .line 1334
    .local v3, "handle":Lcom/almworks/sqlite4java/SWIGTYPE_p_sqlite3_stmt;
    invoke-virtual {p1}, Lcom/almworks/sqlite4java/SQLiteStatement;->getSqlParts()Lcom/almworks/sqlite4java/SQLParts;

    move-result-object v5

    .line 1336
    .local v5, "sql":Lcom/almworks/sqlite4java/SQLParts;
    :try_start_0
    invoke-virtual {p1}, Lcom/almworks/sqlite4java/SQLiteStatement;->hasStepped()Z

    move-result v6

    if-eqz v6, :cond_1

    .line 1337
    invoke-static {v3}, Lcom/almworks/sqlite4java/_SQLiteSwigged;->sqlite3_reset(Lcom/almworks/sqlite4java/SWIGTYPE_p_sqlite3_stmt;)I

    move-result v4

    .line 1338
    .local v4, "rc":I
    const-string v6, "reset"

    invoke-virtual {p0, v4, v6}, Lcom/almworks/sqlite4java/SQLiteConnection;->throwResult(ILjava/lang/String;)V

    .line 1340
    .end local v4    # "rc":I
    :cond_1
    invoke-virtual {p1}, Lcom/almworks/sqlite4java/SQLiteStatement;->hasBindings()Z

    move-result v6

    if-eqz v6, :cond_2

    .line 1341
    invoke-static {v3}, Lcom/almworks/sqlite4java/_SQLiteSwigged;->sqlite3_clear_bindings(Lcom/almworks/sqlite4java/SWIGTYPE_p_sqlite3_stmt;)I

    move-result v4

    .line 1342
    .restart local v4    # "rc":I
    const-string v6, "clearBindings"

    invoke-virtual {p0, v4, v6}, Lcom/almworks/sqlite4java/SQLiteConnection;->throwResult(ILjava/lang/String;)V
    :try_end_0
    .catch Lcom/almworks/sqlite4java/SQLiteException; {:try_start_0 .. :try_end_0} :catch_0

    .line 1348
    .end local v4    # "rc":I
    :cond_2
    :goto_0
    iget-object v7, p0, Lcom/almworks/sqlite4java/SQLiteConnection;->myLock:Ljava/lang/Object;

    monitor-enter v7

    .line 1349
    if-nez v2, :cond_3

    .line 1350
    :try_start_1
    iget-object v6, p0, Lcom/almworks/sqlite4java/SQLiteConnection;->myStatementCache:Ljavolution/util/stripped/FastMap;

    invoke-virtual {v6, v5, v3}, Ljavolution/util/stripped/FastMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/almworks/sqlite4java/SWIGTYPE_p_sqlite3_stmt;

    .line 1351
    .local v1, "expunged":Lcom/almworks/sqlite4java/SWIGTYPE_p_sqlite3_stmt;
    if-eqz v1, :cond_3

    .line 1352
    if-ne v1, v3, :cond_5

    .line 1353
    const-string v6, "handle appeared in cache when inserted"

    const/4 v8, 0x1

    invoke-static {p1, v6, v8}, Lcom/almworks/sqlite4java/Internal;->recoverableError(Ljava/lang/Object;Ljava/lang/String;Z)V

    .line 1364
    .end local v1    # "expunged":Lcom/almworks/sqlite4java/SWIGTYPE_p_sqlite3_stmt;
    :cond_3
    :goto_1
    invoke-direct {p0, p1}, Lcom/almworks/sqlite4java/SQLiteConnection;->forgetStatement(Lcom/almworks/sqlite4java/SQLiteStatement;)V

    .line 1365
    monitor-exit v7
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 1366
    if-eqz v2, :cond_4

    .line 1367
    const-string v6, "cache don\'t need me, finalizing"

    invoke-static {p1, v6}, Lcom/almworks/sqlite4java/Internal;->logFine(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 1368
    invoke-direct {p0, v3, v5}, Lcom/almworks/sqlite4java/SQLiteConnection;->finalizeStatement(Lcom/almworks/sqlite4java/SWIGTYPE_p_sqlite3_stmt;Lcom/almworks/sqlite4java/SQLParts;)V

    .line 1370
    :cond_4
    return-void

    .line 1344
    :catch_0
    move-exception v0

    .line 1345
    .local v0, "e":Lcom/almworks/sqlite4java/SQLiteException;
    sget-object v6, Ljava/util/logging/Level;->WARNING:Ljava/util/logging/Level;

    const-string v7, "exception when clearing"

    invoke-static {v6, p1, v7, v0}, Lcom/almworks/sqlite4java/Internal;->log(Ljava/util/logging/Level;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Throwable;)V

    .line 1346
    const/4 v2, 0x1

    goto :goto_0

    .line 1356
    .end local v0    # "e":Lcom/almworks/sqlite4java/SQLiteException;
    .restart local v1    # "expunged":Lcom/almworks/sqlite4java/SWIGTYPE_p_sqlite3_stmt;
    :cond_5
    :try_start_2
    invoke-static {}, Lcom/almworks/sqlite4java/Internal;->isFineLogging()Z

    move-result v6

    if-eqz v6, :cond_6

    .line 1357
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "second cached copy for ["

    invoke-virtual {v6, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v8, "] prevails"

    invoke-virtual {v6, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {p1, v6}, Lcom/almworks/sqlite4java/Internal;->logFine(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 1359
    :cond_6
    iget-object v6, p0, Lcom/almworks/sqlite4java/SQLiteConnection;->myStatementCache:Ljavolution/util/stripped/FastMap;

    invoke-virtual {v6, v5, v1}, Ljavolution/util/stripped/FastMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1360
    const/4 v2, 0x1

    goto :goto_1

    .line 1365
    .end local v1    # "expunged":Lcom/almworks/sqlite4java/SWIGTYPE_p_sqlite3_stmt;
    :catchall_0
    move-exception v6

    monitor-exit v7
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    throw v6
.end method

.method private configureConnection(Lcom/almworks/sqlite4java/SWIGTYPE_p_sqlite3;)V
    .locals 3
    .param p1, "handle"    # Lcom/almworks/sqlite4java/SWIGTYPE_p_sqlite3;

    .prologue
    .line 1494
    const/4 v1, 0x1

    invoke-static {p1, v1}, Lcom/almworks/sqlite4java/_SQLiteSwigged;->sqlite3_extended_result_codes(Lcom/almworks/sqlite4java/SWIGTYPE_p_sqlite3;I)I

    move-result v0

    .line 1495
    .local v0, "rc":I
    if-eqz v0, :cond_0

    .line 1496
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "cannot enable extended result codes ["

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "]"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {p0, v1}, Lcom/almworks/sqlite4java/Internal;->logWarn(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 1498
    :cond_0
    return-void
.end method

.method private createArray0(Ljava/lang/String;Lcom/almworks/sqlite4java/SQLiteController;)Lcom/almworks/sqlite4java/SQLiteLongArray;
    .locals 7
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "controller"    # Lcom/almworks/sqlite4java/SQLiteController;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/almworks/sqlite4java/SQLiteException;
        }
    .end annotation

    .prologue
    .line 1061
    invoke-direct {p0}, Lcom/almworks/sqlite4java/SQLiteConnection;->handle()Lcom/almworks/sqlite4java/SWIGTYPE_p_sqlite3;

    move-result-object v0

    .line 1062
    .local v0, "handle":Lcom/almworks/sqlite4java/SWIGTYPE_p_sqlite3;
    if-nez p1, :cond_0

    .line 1063
    invoke-direct {p0}, Lcom/almworks/sqlite4java/SQLiteConnection;->nextArrayName()Ljava/lang/String;

    move-result-object p1

    .line 1064
    :cond_0
    invoke-direct {p0, v0}, Lcom/almworks/sqlite4java/SQLiteConnection;->getIntArrayModule(Lcom/almworks/sqlite4java/SWIGTYPE_p_sqlite3;)Lcom/almworks/sqlite4java/SWIGTYPE_p_intarray_module;

    move-result-object v1

    .line 1065
    .local v1, "module":Lcom/almworks/sqlite4java/SWIGTYPE_p_intarray_module;
    invoke-static {}, Lcom/almworks/sqlite4java/Internal;->isFineLogging()Z

    move-result v4

    if-eqz v4, :cond_1

    .line 1066
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "creating intarray ["

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, "]"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {p0, v4}, Lcom/almworks/sqlite4java/Internal;->logFine(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 1067
    :cond_1
    iget-object v4, p0, Lcom/almworks/sqlite4java/SQLiteConnection;->mySQLiteManual:Lcom/almworks/sqlite4java/_SQLiteManual;

    invoke-virtual {v4, v1, p1}, Lcom/almworks/sqlite4java/_SQLiteManual;->sqlite3_intarray_create(Lcom/almworks/sqlite4java/SWIGTYPE_p_intarray_module;Ljava/lang/String;)Lcom/almworks/sqlite4java/SWIGTYPE_p_intarray;

    move-result-object v2

    .line 1068
    .local v2, "r":Lcom/almworks/sqlite4java/SWIGTYPE_p_intarray;
    iget-object v4, p0, Lcom/almworks/sqlite4java/SQLiteConnection;->mySQLiteManual:Lcom/almworks/sqlite4java/_SQLiteManual;

    invoke-virtual {v4}, Lcom/almworks/sqlite4java/_SQLiteManual;->getLastReturnCode()I

    move-result v3

    .line 1069
    .local v3, "rc":I
    if-eqz v3, :cond_2

    .line 1070
    const-string v4, "createArray()"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v5, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, " (cannot allocate virtual table)"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {p0, v3, v4, v5}, Lcom/almworks/sqlite4java/SQLiteConnection;->throwResult(ILjava/lang/String;Ljava/lang/Object;)V

    .line 1072
    :cond_2
    if-nez v2, :cond_3

    .line 1073
    const/16 v4, -0x63

    const-string v5, "createArray()"

    invoke-virtual {p0, v4, v5, p1}, Lcom/almworks/sqlite4java/SQLiteConnection;->throwResult(ILjava/lang/String;Ljava/lang/Object;)V

    .line 1075
    :cond_3
    invoke-static {}, Lcom/almworks/sqlite4java/Internal;->isFineLogging()Z

    move-result v4

    if-eqz v4, :cond_4

    .line 1076
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "created intarray ["

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, "]"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {p0, v4}, Lcom/almworks/sqlite4java/Internal;->logFine(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 1077
    :cond_4
    new-instance v4, Lcom/almworks/sqlite4java/SQLiteLongArray;

    invoke-direct {v4, p2, v2, p1}, Lcom/almworks/sqlite4java/SQLiteLongArray;-><init>(Lcom/almworks/sqlite4java/SQLiteController;Lcom/almworks/sqlite4java/SWIGTYPE_p_intarray;Ljava/lang/String;)V

    return-object v4
.end method

.method private finalizeArray(Lcom/almworks/sqlite4java/SQLiteLongArray;)V
    .locals 3
    .param p1, "array"    # Lcom/almworks/sqlite4java/SQLiteLongArray;

    .prologue
    .line 1263
    const-string v2, "finalizing"

    invoke-static {p1, v2}, Lcom/almworks/sqlite4java/Internal;->logFine(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 1264
    invoke-virtual {p1}, Lcom/almworks/sqlite4java/SQLiteLongArray;->arrayHandle()Lcom/almworks/sqlite4java/SWIGTYPE_p_intarray;

    move-result-object v0

    .line 1265
    .local v0, "handle":Lcom/almworks/sqlite4java/SWIGTYPE_p_intarray;
    invoke-virtual {p1}, Lcom/almworks/sqlite4java/SQLiteLongArray;->getName()Ljava/lang/String;

    move-result-object v1

    .line 1266
    .local v1, "tableName":Ljava/lang/String;
    invoke-direct {p0, v0, v1}, Lcom/almworks/sqlite4java/SQLiteConnection;->finalizeArrayHandle(Lcom/almworks/sqlite4java/SWIGTYPE_p_intarray;Ljava/lang/String;)V

    .line 1267
    return-void
.end method

.method private finalizeArrayHandle(Lcom/almworks/sqlite4java/SWIGTYPE_p_intarray;Ljava/lang/String;)V
    .locals 3
    .param p1, "handle"    # Lcom/almworks/sqlite4java/SWIGTYPE_p_intarray;
    .param p2, "name"    # Ljava/lang/String;

    .prologue
    .line 1270
    invoke-static {p1}, Lcom/almworks/sqlite4java/_SQLiteManual;->sqlite3_intarray_destroy(Lcom/almworks/sqlite4java/SWIGTYPE_p_intarray;)I

    move-result v0

    .line 1271
    .local v0, "rc":I
    if-eqz v0, :cond_0

    .line 1272
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "error ["

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "] finalizing array "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {p0, v1}, Lcom/almworks/sqlite4java/Internal;->logWarn(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 1274
    :cond_0
    return-void
.end method

.method private finalizeArrays()V
    .locals 8

    .prologue
    const/4 v0, 0x0

    .line 1183
    iget-object v5, p0, Lcom/almworks/sqlite4java/SQLiteConnection;->myConfinement:Ljava/lang/Thread;

    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v6

    if-eq v5, v6, :cond_0

    const/4 v0, 0x1

    .line 1184
    .local v0, "alienThread":Z
    :cond_0
    if-nez v0, :cond_2

    .line 1185
    const-string v5, "finalizing arrays"

    invoke-static {p0, v5}, Lcom/almworks/sqlite4java/Internal;->logFine(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 1188
    :cond_1
    iget-object v6, p0, Lcom/almworks/sqlite4java/SQLiteConnection;->myLock:Ljava/lang/Object;

    monitor-enter v6

    .line 1189
    :try_start_0
    iget-object v5, p0, Lcom/almworks/sqlite4java/SQLiteConnection;->myLongArrays:Ljavolution/util/stripped/FastMap;

    invoke-virtual {v5}, Ljavolution/util/stripped/FastMap;->isEmpty()Z

    move-result v5

    if-eqz v5, :cond_4

    .line 1190
    monitor-exit v6
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 1199
    :cond_2
    iget-object v6, p0, Lcom/almworks/sqlite4java/SQLiteConnection;->myLock:Ljava/lang/Object;

    monitor-enter v6

    .line 1200
    :try_start_1
    iget-object v5, p0, Lcom/almworks/sqlite4java/SQLiteConnection;->myLongArrays:Ljavolution/util/stripped/FastMap;

    invoke-virtual {v5}, Ljavolution/util/stripped/FastMap;->isEmpty()Z

    move-result v5

    if-nez v5, :cond_3

    .line 1201
    iget-object v5, p0, Lcom/almworks/sqlite4java/SQLiteConnection;->myLongArrays:Ljavolution/util/stripped/FastMap;

    invoke-virtual {v5}, Ljavolution/util/stripped/FastMap;->size()I

    move-result v1

    .line 1202
    .local v1, "count":I
    if-eqz v0, :cond_5

    .line 1203
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "cannot finalize "

    invoke-virtual {v5, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v7, " arrays from alien thread"

    invoke-virtual {v5, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {p0, v5}, Lcom/almworks/sqlite4java/Internal;->logWarn(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 1207
    :goto_0
    iget-object v5, p0, Lcom/almworks/sqlite4java/SQLiteConnection;->myLongArrays:Ljavolution/util/stripped/FastMap;

    invoke-virtual {v5}, Ljavolution/util/stripped/FastMap;->clear()V

    .line 1209
    .end local v1    # "count":I
    :cond_3
    monitor-exit v6
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 1210
    return-void

    .line 1191
    :cond_4
    :try_start_2
    new-instance v3, Ljavolution/util/stripped/FastMap;

    iget-object v5, p0, Lcom/almworks/sqlite4java/SQLiteConnection;->myLongArrays:Ljavolution/util/stripped/FastMap;

    invoke-direct {v3, v5}, Ljavolution/util/stripped/FastMap;-><init>(Ljava/util/Map;)V

    .line 1192
    .local v3, "fastMap":Ljavolution/util/stripped/FastMap;, "Ljavolution/util/stripped/FastMap<Ljava/lang/String;Lcom/almworks/sqlite4java/SWIGTYPE_p_intarray;>;"
    iget-object v5, p0, Lcom/almworks/sqlite4java/SQLiteConnection;->myLongArrays:Ljavolution/util/stripped/FastMap;

    invoke-virtual {v5}, Ljavolution/util/stripped/FastMap;->clear()V

    .line 1193
    monitor-exit v6
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 1194
    invoke-virtual {v3}, Ljavolution/util/stripped/FastMap;->entrySet()Ljava/util/Set;

    move-result-object v5

    invoke-interface {v5}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v4

    .local v4, "i$":Ljava/util/Iterator;
    :goto_1
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_1

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/Map$Entry;

    .line 1195
    .local v2, "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Lcom/almworks/sqlite4java/SWIGTYPE_p_intarray;>;"
    invoke-interface {v2}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/almworks/sqlite4java/SWIGTYPE_p_intarray;

    invoke-interface {v2}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/lang/String;

    invoke-direct {p0, v5, v6}, Lcom/almworks/sqlite4java/SQLiteConnection;->finalizeArrayHandle(Lcom/almworks/sqlite4java/SWIGTYPE_p_intarray;Ljava/lang/String;)V

    goto :goto_1

    .line 1193
    .end local v2    # "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Lcom/almworks/sqlite4java/SWIGTYPE_p_intarray;>;"
    .end local v3    # "fastMap":Ljavolution/util/stripped/FastMap;, "Ljavolution/util/stripped/FastMap<Ljava/lang/String;Lcom/almworks/sqlite4java/SWIGTYPE_p_intarray;>;"
    .end local v4    # "i$":Ljava/util/Iterator;
    :catchall_0
    move-exception v5

    :try_start_3
    monitor-exit v6
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    throw v5

    .line 1205
    .restart local v1    # "count":I
    :cond_5
    :try_start_4
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v5, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v7, " arrays are not finalized"

    invoke-virtual {v5, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    const/4 v7, 0x0

    invoke-static {p0, v5, v7}, Lcom/almworks/sqlite4java/Internal;->recoverableError(Ljava/lang/Object;Ljava/lang/String;Z)V

    goto :goto_0

    .line 1209
    .end local v1    # "count":I
    :catchall_1
    move-exception v5

    monitor-exit v6
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_1

    throw v5
.end method

.method private finalizeBlob(Lcom/almworks/sqlite4java/SQLiteBlob;)V
    .locals 3
    .param p1, "blob"    # Lcom/almworks/sqlite4java/SQLiteBlob;

    .prologue
    .line 1277
    const-string v1, "finalizing"

    invoke-static {p1, v1}, Lcom/almworks/sqlite4java/Internal;->logFine(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 1278
    invoke-virtual {p1}, Lcom/almworks/sqlite4java/SQLiteBlob;->blobHandle()Lcom/almworks/sqlite4java/SWIGTYPE_p_sqlite3_blob;

    move-result-object v0

    .line 1279
    .local v0, "handle":Lcom/almworks/sqlite4java/SWIGTYPE_p_sqlite3_blob;
    invoke-virtual {p1}, Lcom/almworks/sqlite4java/SQLiteBlob;->clear()V

    .line 1280
    invoke-direct {p0, v0, p1}, Lcom/almworks/sqlite4java/SQLiteConnection;->softClose(Lcom/almworks/sqlite4java/SWIGTYPE_p_sqlite3_blob;Ljava/lang/Object;)V

    .line 1281
    iget-object v2, p0, Lcom/almworks/sqlite4java/SQLiteConnection;->myLock:Ljava/lang/Object;

    monitor-enter v2

    .line 1282
    :try_start_0
    invoke-direct {p0, p1}, Lcom/almworks/sqlite4java/SQLiteConnection;->forgetBlob(Lcom/almworks/sqlite4java/SQLiteBlob;)V

    .line 1283
    monitor-exit v2

    .line 1284
    return-void

    .line 1283
    :catchall_0
    move-exception v1

    monitor-exit v2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method private finalizeBlobs()V
    .locals 11

    .prologue
    const/4 v1, 0x0

    .line 1213
    iget-object v8, p0, Lcom/almworks/sqlite4java/SQLiteConnection;->myConfinement:Ljava/lang/Thread;

    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v9

    if-eq v8, v9, :cond_0

    const/4 v1, 0x1

    .line 1214
    .local v1, "alienThread":Z
    :cond_0
    if-nez v1, :cond_2

    .line 1215
    const-string v8, "finalizing blobs"

    invoke-static {p0, v8}, Lcom/almworks/sqlite4java/Internal;->logFine(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 1217
    :cond_1
    const/4 v4, 0x0

    .line 1218
    .local v4, "blobs":[Lcom/almworks/sqlite4java/SQLiteBlob;
    iget-object v9, p0, Lcom/almworks/sqlite4java/SQLiteConnection;->myLock:Ljava/lang/Object;

    monitor-enter v9

    .line 1219
    :try_start_0
    iget-object v8, p0, Lcom/almworks/sqlite4java/SQLiteConnection;->myBlobs:Ljava/util/ArrayList;

    invoke-virtual {v8}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v8

    if-eqz v8, :cond_4

    .line 1220
    monitor-exit v9
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 1228
    .end local v4    # "blobs":[Lcom/almworks/sqlite4java/SQLiteBlob;
    :cond_2
    iget-object v9, p0, Lcom/almworks/sqlite4java/SQLiteConnection;->myLock:Ljava/lang/Object;

    monitor-enter v9

    .line 1229
    :try_start_1
    iget-object v8, p0, Lcom/almworks/sqlite4java/SQLiteConnection;->myBlobs:Ljava/util/ArrayList;

    invoke-virtual {v8}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v8

    if-nez v8, :cond_3

    .line 1230
    iget-object v8, p0, Lcom/almworks/sqlite4java/SQLiteConnection;->myBlobs:Ljava/util/ArrayList;

    invoke-virtual {v8}, Ljava/util/ArrayList;->size()I

    move-result v5

    .line 1231
    .local v5, "count":I
    if-eqz v1, :cond_5

    .line 1232
    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "cannot finalize "

    invoke-virtual {v8, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v10, " blobs from alien thread"

    invoke-virtual {v8, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-static {p0, v8}, Lcom/almworks/sqlite4java/Internal;->logWarn(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 1237
    .end local v5    # "count":I
    :cond_3
    :goto_0
    iget-object v8, p0, Lcom/almworks/sqlite4java/SQLiteConnection;->myBlobs:Ljava/util/ArrayList;

    invoke-virtual {v8}, Ljava/util/ArrayList;->clear()V

    .line 1238
    monitor-exit v9
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 1239
    return-void

    .line 1221
    .restart local v4    # "blobs":[Lcom/almworks/sqlite4java/SQLiteBlob;
    :cond_4
    :try_start_2
    iget-object v8, p0, Lcom/almworks/sqlite4java/SQLiteConnection;->myBlobs:Ljava/util/ArrayList;

    iget-object v10, p0, Lcom/almworks/sqlite4java/SQLiteConnection;->myBlobs:Ljava/util/ArrayList;

    invoke-virtual {v10}, Ljava/util/ArrayList;->size()I

    move-result v10

    new-array v10, v10, [Lcom/almworks/sqlite4java/SQLiteBlob;

    invoke-virtual {v8, v10}, Ljava/util/ArrayList;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v8

    move-object v0, v8

    check-cast v0, [Lcom/almworks/sqlite4java/SQLiteBlob;

    move-object v4, v0

    .line 1222
    monitor-exit v9
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 1223
    move-object v2, v4

    .local v2, "arr$":[Lcom/almworks/sqlite4java/SQLiteBlob;
    array-length v7, v2

    .local v7, "len$":I
    const/4 v6, 0x0

    .local v6, "i$":I
    :goto_1
    if-ge v6, v7, :cond_1

    aget-object v3, v2, v6

    .line 1224
    .local v3, "blob":Lcom/almworks/sqlite4java/SQLiteBlob;
    invoke-direct {p0, v3}, Lcom/almworks/sqlite4java/SQLiteConnection;->finalizeBlob(Lcom/almworks/sqlite4java/SQLiteBlob;)V

    .line 1223
    add-int/lit8 v6, v6, 0x1

    goto :goto_1

    .line 1222
    .end local v2    # "arr$":[Lcom/almworks/sqlite4java/SQLiteBlob;
    .end local v3    # "blob":Lcom/almworks/sqlite4java/SQLiteBlob;
    .end local v6    # "i$":I
    .end local v7    # "len$":I
    :catchall_0
    move-exception v8

    :try_start_3
    monitor-exit v9
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    throw v8

    .line 1234
    .end local v4    # "blobs":[Lcom/almworks/sqlite4java/SQLiteBlob;
    .restart local v5    # "count":I
    :cond_5
    :try_start_4
    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v8, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v10, " blobs are not finalized"

    invoke-virtual {v8, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    const/4 v10, 0x0

    invoke-static {p0, v8, v10}, Lcom/almworks/sqlite4java/Internal;->recoverableError(Ljava/lang/Object;Ljava/lang/String;Z)V

    goto :goto_0

    .line 1238
    .end local v5    # "count":I
    :catchall_1
    move-exception v8

    monitor-exit v9
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_1

    throw v8
.end method

.method private finalizeBuffers()V
    .locals 8

    .prologue
    .line 1110
    iget-object v6, p0, Lcom/almworks/sqlite4java/SQLiteConnection;->myLock:Ljava/lang/Object;

    monitor-enter v6

    .line 1111
    :try_start_0
    iget-object v5, p0, Lcom/almworks/sqlite4java/SQLiteConnection;->myBuffers:Ljava/util/ArrayList;

    invoke-virtual {v5}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v5

    if-eqz v5, :cond_1

    .line 1112
    monitor-exit v6

    .line 1125
    :cond_0
    :goto_0
    return-void

    .line 1114
    :cond_1
    iget-object v5, p0, Lcom/almworks/sqlite4java/SQLiteConnection;->myBuffers:Ljava/util/ArrayList;

    iget-object v7, p0, Lcom/almworks/sqlite4java/SQLiteConnection;->myBuffers:Ljava/util/ArrayList;

    invoke-virtual {v7}, Ljava/util/ArrayList;->size()I

    move-result v7

    new-array v7, v7, [Lcom/almworks/sqlite4java/DirectBuffer;

    invoke-virtual {v5, v7}, Ljava/util/ArrayList;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v2

    check-cast v2, [Lcom/almworks/sqlite4java/DirectBuffer;

    .line 1115
    .local v2, "buffers":[Lcom/almworks/sqlite4java/DirectBuffer;
    iget-object v5, p0, Lcom/almworks/sqlite4java/SQLiteConnection;->myBuffers:Ljava/util/ArrayList;

    invoke-virtual {v5}, Ljava/util/ArrayList;->clear()V

    .line 1116
    const/4 v5, 0x0

    iput v5, p0, Lcom/almworks/sqlite4java/SQLiteConnection;->myBuffersTotalSize:I

    .line 1117
    monitor-exit v6
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 1118
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v5

    iget-object v6, p0, Lcom/almworks/sqlite4java/SQLiteConnection;->myConfinement:Ljava/lang/Thread;

    if-ne v5, v6, :cond_2

    .line 1119
    move-object v0, v2

    .local v0, "arr$":[Lcom/almworks/sqlite4java/DirectBuffer;
    array-length v4, v0

    .local v4, "len$":I
    const/4 v3, 0x0

    .local v3, "i$":I
    :goto_1
    if-ge v3, v4, :cond_0

    aget-object v1, v0, v3

    .line 1120
    .local v1, "buffer":Lcom/almworks/sqlite4java/DirectBuffer;
    invoke-static {v1}, Lcom/almworks/sqlite4java/_SQLiteManual;->wrapper_free(Lcom/almworks/sqlite4java/DirectBuffer;)I

    .line 1119
    add-int/lit8 v3, v3, 0x1

    goto :goto_1

    .line 1117
    .end local v0    # "arr$":[Lcom/almworks/sqlite4java/DirectBuffer;
    .end local v1    # "buffer":Lcom/almworks/sqlite4java/DirectBuffer;
    .end local v2    # "buffers":[Lcom/almworks/sqlite4java/DirectBuffer;
    .end local v3    # "i$":I
    .end local v4    # "len$":I
    :catchall_0
    move-exception v5

    :try_start_1
    monitor-exit v6
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v5

    .line 1123
    .restart local v2    # "buffers":[Lcom/almworks/sqlite4java/DirectBuffer;
    :cond_2
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "cannot free "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    array-length v6, v2

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, " buffers from alien thread ("

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, ")"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {p0, v5}, Lcom/almworks/sqlite4java/Internal;->logWarn(Ljava/lang/Object;Ljava/lang/Object;)V

    goto :goto_0
.end method

.method private finalizeProgressHandler(Lcom/almworks/sqlite4java/SWIGTYPE_p_sqlite3;)V
    .locals 3
    .param p1, "handle"    # Lcom/almworks/sqlite4java/SWIGTYPE_p_sqlite3;

    .prologue
    .line 1100
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v1

    iget-object v2, p0, Lcom/almworks/sqlite4java/SQLiteConnection;->myConfinement:Ljava/lang/Thread;

    if-ne v1, v2, :cond_0

    .line 1101
    iget-object v0, p0, Lcom/almworks/sqlite4java/SQLiteConnection;->myProgressHandler:Lcom/almworks/sqlite4java/ProgressHandler;

    .line 1102
    .local v0, "handler":Lcom/almworks/sqlite4java/ProgressHandler;
    if-eqz v0, :cond_0

    .line 1103
    invoke-static {p1, v0}, Lcom/almworks/sqlite4java/_SQLiteManual;->uninstall_progress_handler(Lcom/almworks/sqlite4java/SWIGTYPE_p_sqlite3;Lcom/almworks/sqlite4java/ProgressHandler;)I

    .line 1106
    .end local v0    # "handler":Lcom/almworks/sqlite4java/ProgressHandler;
    :cond_0
    return-void
.end method

.method private finalizeStatement(Lcom/almworks/sqlite4java/SQLiteStatement;)V
    .locals 4
    .param p1, "statement"    # Lcom/almworks/sqlite4java/SQLiteStatement;

    .prologue
    .line 1251
    const-string v2, "finalizing"

    invoke-static {p1, v2}, Lcom/almworks/sqlite4java/Internal;->logFine(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 1252
    invoke-virtual {p1}, Lcom/almworks/sqlite4java/SQLiteStatement;->statementHandle()Lcom/almworks/sqlite4java/SWIGTYPE_p_sqlite3_stmt;

    move-result-object v0

    .line 1253
    .local v0, "handle":Lcom/almworks/sqlite4java/SWIGTYPE_p_sqlite3_stmt;
    invoke-virtual {p1}, Lcom/almworks/sqlite4java/SQLiteStatement;->getSqlParts()Lcom/almworks/sqlite4java/SQLParts;

    move-result-object v1

    .line 1254
    .local v1, "sql":Lcom/almworks/sqlite4java/SQLParts;
    invoke-virtual {p1}, Lcom/almworks/sqlite4java/SQLiteStatement;->clear()V

    .line 1255
    invoke-direct {p0, v0, p1}, Lcom/almworks/sqlite4java/SQLiteConnection;->softFinalize(Lcom/almworks/sqlite4java/SWIGTYPE_p_sqlite3_stmt;Ljava/lang/Object;)V

    .line 1256
    iget-object v3, p0, Lcom/almworks/sqlite4java/SQLiteConnection;->myLock:Ljava/lang/Object;

    monitor-enter v3

    .line 1257
    :try_start_0
    invoke-direct {p0, p1}, Lcom/almworks/sqlite4java/SQLiteConnection;->forgetStatement(Lcom/almworks/sqlite4java/SQLiteStatement;)V

    .line 1258
    invoke-direct {p0, v0, v1}, Lcom/almworks/sqlite4java/SQLiteConnection;->forgetCachedHandle(Lcom/almworks/sqlite4java/SWIGTYPE_p_sqlite3_stmt;Lcom/almworks/sqlite4java/SQLParts;)V

    .line 1259
    monitor-exit v3

    .line 1260
    return-void

    .line 1259
    :catchall_0
    move-exception v2

    monitor-exit v3
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v2
.end method

.method private finalizeStatement(Lcom/almworks/sqlite4java/SWIGTYPE_p_sqlite3_stmt;Lcom/almworks/sqlite4java/SQLParts;)V
    .locals 2
    .param p1, "handle"    # Lcom/almworks/sqlite4java/SWIGTYPE_p_sqlite3_stmt;
    .param p2, "sql"    # Lcom/almworks/sqlite4java/SQLParts;

    .prologue
    .line 1242
    invoke-static {}, Lcom/almworks/sqlite4java/Internal;->isFineLogging()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 1243
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "finalizing cached stmt for "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {p0, v0}, Lcom/almworks/sqlite4java/Internal;->logFine(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 1244
    :cond_0
    invoke-direct {p0, p1, p2}, Lcom/almworks/sqlite4java/SQLiteConnection;->softFinalize(Lcom/almworks/sqlite4java/SWIGTYPE_p_sqlite3_stmt;Ljava/lang/Object;)V

    .line 1245
    iget-object v1, p0, Lcom/almworks/sqlite4java/SQLiteConnection;->myLock:Ljava/lang/Object;

    monitor-enter v1

    .line 1246
    :try_start_0
    invoke-direct {p0, p1, p2}, Lcom/almworks/sqlite4java/SQLiteConnection;->forgetCachedHandle(Lcom/almworks/sqlite4java/SWIGTYPE_p_sqlite3_stmt;Lcom/almworks/sqlite4java/SQLParts;)V

    .line 1247
    monitor-exit v1

    .line 1248
    return-void

    .line 1247
    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method private finalizeStatements()V
    .locals 14

    .prologue
    const/4 v1, 0x0

    .line 1141
    iget-object v11, p0, Lcom/almworks/sqlite4java/SQLiteConnection;->myConfinement:Ljava/lang/Thread;

    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v12

    if-eq v11, v12, :cond_0

    const/4 v1, 0x1

    .line 1142
    .local v1, "alienThread":Z
    :cond_0
    if-nez v1, :cond_2

    .line 1143
    const-string v11, "finalizing statements"

    invoke-static {p0, v11}, Lcom/almworks/sqlite4java/Internal;->logFine(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 1145
    :cond_1
    const/4 v9, 0x0

    .line 1146
    .local v9, "statements":[Lcom/almworks/sqlite4java/SQLiteStatement;
    iget-object v12, p0, Lcom/almworks/sqlite4java/SQLiteConnection;->myLock:Ljava/lang/Object;

    monitor-enter v12

    .line 1147
    :try_start_0
    iget-object v11, p0, Lcom/almworks/sqlite4java/SQLiteConnection;->myStatements:Ljava/util/ArrayList;

    invoke-virtual {v11}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v11

    if-eqz v11, :cond_5

    .line 1148
    monitor-exit v12
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 1156
    :goto_0
    const/4 v10, 0x0

    .line 1157
    .local v10, "stmt":Lcom/almworks/sqlite4java/SWIGTYPE_p_sqlite3_stmt;
    const/4 v7, 0x0

    .line 1158
    .local v7, "sql":Lcom/almworks/sqlite4java/SQLParts;
    iget-object v12, p0, Lcom/almworks/sqlite4java/SQLiteConnection;->myLock:Ljava/lang/Object;

    monitor-enter v12

    .line 1159
    :try_start_1
    iget-object v11, p0, Lcom/almworks/sqlite4java/SQLiteConnection;->myStatementCache:Ljavolution/util/stripped/FastMap;

    invoke-virtual {v11}, Ljavolution/util/stripped/FastMap;->isEmpty()Z

    move-result v11

    if-eqz v11, :cond_6

    .line 1160
    monitor-exit v12
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 1168
    .end local v7    # "sql":Lcom/almworks/sqlite4java/SQLParts;
    .end local v9    # "statements":[Lcom/almworks/sqlite4java/SQLiteStatement;
    .end local v10    # "stmt":Lcom/almworks/sqlite4java/SWIGTYPE_p_sqlite3_stmt;
    :cond_2
    iget-object v12, p0, Lcom/almworks/sqlite4java/SQLiteConnection;->myLock:Ljava/lang/Object;

    monitor-enter v12

    .line 1169
    :try_start_2
    iget-object v11, p0, Lcom/almworks/sqlite4java/SQLiteConnection;->myStatements:Ljava/util/ArrayList;

    invoke-virtual {v11}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v11

    if-eqz v11, :cond_3

    iget-object v11, p0, Lcom/almworks/sqlite4java/SQLiteConnection;->myStatementCache:Ljavolution/util/stripped/FastMap;

    invoke-virtual {v11}, Ljavolution/util/stripped/FastMap;->isEmpty()Z

    move-result v11

    if-nez v11, :cond_4

    .line 1170
    :cond_3
    iget-object v11, p0, Lcom/almworks/sqlite4java/SQLiteConnection;->myStatements:Ljava/util/ArrayList;

    invoke-virtual {v11}, Ljava/util/ArrayList;->size()I

    move-result v11

    iget-object v13, p0, Lcom/almworks/sqlite4java/SQLiteConnection;->myStatementCache:Ljavolution/util/stripped/FastMap;

    invoke-virtual {v13}, Ljavolution/util/stripped/FastMap;->size()I

    move-result v13

    add-int v3, v11, v13

    .line 1171
    .local v3, "count":I
    if-eqz v1, :cond_7

    .line 1172
    new-instance v11, Ljava/lang/StringBuilder;

    invoke-direct {v11}, Ljava/lang/StringBuilder;-><init>()V

    const-string v13, "cannot finalize "

    invoke-virtual {v11, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v11

    const-string v13, " statements from alien thread"

    invoke-virtual {v11, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v11

    invoke-static {p0, v11}, Lcom/almworks/sqlite4java/Internal;->logWarn(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 1177
    .end local v3    # "count":I
    :cond_4
    :goto_1
    iget-object v11, p0, Lcom/almworks/sqlite4java/SQLiteConnection;->myStatements:Ljava/util/ArrayList;

    invoke-virtual {v11}, Ljava/util/ArrayList;->clear()V

    .line 1178
    iget-object v11, p0, Lcom/almworks/sqlite4java/SQLiteConnection;->myStatementCache:Ljavolution/util/stripped/FastMap;

    invoke-virtual {v11}, Ljavolution/util/stripped/FastMap;->clear()V

    .line 1179
    monitor-exit v12
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_2

    .line 1180
    return-void

    .line 1149
    .restart local v9    # "statements":[Lcom/almworks/sqlite4java/SQLiteStatement;
    :cond_5
    :try_start_3
    iget-object v11, p0, Lcom/almworks/sqlite4java/SQLiteConnection;->myStatements:Ljava/util/ArrayList;

    iget-object v13, p0, Lcom/almworks/sqlite4java/SQLiteConnection;->myStatements:Ljava/util/ArrayList;

    invoke-virtual {v13}, Ljava/util/ArrayList;->size()I

    move-result v13

    new-array v13, v13, [Lcom/almworks/sqlite4java/SQLiteStatement;

    invoke-virtual {v11, v13}, Ljava/util/ArrayList;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v11

    move-object v0, v11

    check-cast v0, [Lcom/almworks/sqlite4java/SQLiteStatement;

    move-object v9, v0

    .line 1150
    monitor-exit v12
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 1151
    move-object v2, v9

    .local v2, "arr$":[Lcom/almworks/sqlite4java/SQLiteStatement;
    array-length v6, v2

    .local v6, "len$":I
    const/4 v5, 0x0

    .local v5, "i$":I
    :goto_2
    if-ge v5, v6, :cond_1

    aget-object v8, v2, v5

    .line 1152
    .local v8, "statement":Lcom/almworks/sqlite4java/SQLiteStatement;
    invoke-direct {p0, v8}, Lcom/almworks/sqlite4java/SQLiteConnection;->finalizeStatement(Lcom/almworks/sqlite4java/SQLiteStatement;)V

    .line 1151
    add-int/lit8 v5, v5, 0x1

    goto :goto_2

    .line 1150
    .end local v2    # "arr$":[Lcom/almworks/sqlite4java/SQLiteStatement;
    .end local v5    # "i$":I
    .end local v6    # "len$":I
    .end local v8    # "statement":Lcom/almworks/sqlite4java/SQLiteStatement;
    :catchall_0
    move-exception v11

    :try_start_4
    monitor-exit v12
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    throw v11

    .line 1161
    .restart local v7    # "sql":Lcom/almworks/sqlite4java/SQLParts;
    .restart local v10    # "stmt":Lcom/almworks/sqlite4java/SWIGTYPE_p_sqlite3_stmt;
    :cond_6
    :try_start_5
    iget-object v11, p0, Lcom/almworks/sqlite4java/SQLiteConnection;->myStatementCache:Ljavolution/util/stripped/FastMap;

    invoke-virtual {v11}, Ljavolution/util/stripped/FastMap;->entrySet()Ljava/util/Set;

    move-result-object v11

    invoke-interface {v11}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v11

    invoke-interface {v11}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/util/Map$Entry;

    .line 1162
    .local v4, "e":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Lcom/almworks/sqlite4java/SQLParts;Lcom/almworks/sqlite4java/SWIGTYPE_p_sqlite3_stmt;>;"
    invoke-interface {v4}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v11

    move-object v0, v11

    check-cast v0, Lcom/almworks/sqlite4java/SQLParts;

    move-object v7, v0

    .line 1163
    invoke-interface {v4}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v11

    move-object v0, v11

    check-cast v0, Lcom/almworks/sqlite4java/SWIGTYPE_p_sqlite3_stmt;

    move-object v10, v0

    .line 1164
    monitor-exit v12
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_1

    .line 1165
    invoke-direct {p0, v10, v7}, Lcom/almworks/sqlite4java/SQLiteConnection;->finalizeStatement(Lcom/almworks/sqlite4java/SWIGTYPE_p_sqlite3_stmt;Lcom/almworks/sqlite4java/SQLParts;)V

    goto/16 :goto_0

    .line 1164
    .end local v4    # "e":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Lcom/almworks/sqlite4java/SQLParts;Lcom/almworks/sqlite4java/SWIGTYPE_p_sqlite3_stmt;>;"
    :catchall_1
    move-exception v11

    :try_start_6
    monitor-exit v12
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_1

    throw v11

    .line 1174
    .end local v7    # "sql":Lcom/almworks/sqlite4java/SQLParts;
    .end local v9    # "statements":[Lcom/almworks/sqlite4java/SQLiteStatement;
    .end local v10    # "stmt":Lcom/almworks/sqlite4java/SWIGTYPE_p_sqlite3_stmt;
    .restart local v3    # "count":I
    :cond_7
    :try_start_7
    new-instance v11, Ljava/lang/StringBuilder;

    invoke-direct {v11}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v11, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v11

    const-string v13, " statements are not finalized"

    invoke-virtual {v11, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v11

    const/4 v13, 0x0

    invoke-static {p0, v11, v13}, Lcom/almworks/sqlite4java/Internal;->recoverableError(Ljava/lang/Object;Ljava/lang/String;Z)V

    goto :goto_1

    .line 1179
    .end local v3    # "count":I
    :catchall_2
    move-exception v11

    monitor-exit v12
    :try_end_7
    .catchall {:try_start_7 .. :try_end_7} :catchall_2

    throw v11
.end method

.method private forgetBlob(Lcom/almworks/sqlite4java/SQLiteBlob;)V
    .locals 3
    .param p1, "blob"    # Lcom/almworks/sqlite4java/SQLiteBlob;

    .prologue
    .line 1390
    sget-boolean v1, Lcom/almworks/sqlite4java/SQLiteConnection;->$assertionsDisabled:Z

    if-nez v1, :cond_0

    iget-object v1, p0, Lcom/almworks/sqlite4java/SQLiteConnection;->myLock:Ljava/lang/Object;

    invoke-static {v1}, Ljava/lang/Thread;->holdsLock(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_0

    new-instance v1, Ljava/lang/AssertionError;

    invoke-direct {v1}, Ljava/lang/AssertionError;-><init>()V

    throw v1

    .line 1391
    :cond_0
    iget-object v1, p0, Lcom/almworks/sqlite4java/SQLiteConnection;->myBlobs:Ljava/util/ArrayList;

    invoke-virtual {v1, p1}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    move-result v0

    .line 1392
    .local v0, "removed":Z
    if-nez v0, :cond_1

    .line 1393
    const-string v1, "alien blob"

    const/4 v2, 0x1

    invoke-static {p1, v1, v2}, Lcom/almworks/sqlite4java/Internal;->recoverableError(Ljava/lang/Object;Ljava/lang/String;Z)V

    .line 1395
    :cond_1
    return-void
.end method

.method private forgetCachedHandle(Lcom/almworks/sqlite4java/SWIGTYPE_p_sqlite3_stmt;Lcom/almworks/sqlite4java/SQLParts;)V
    .locals 2
    .param p1, "handle"    # Lcom/almworks/sqlite4java/SWIGTYPE_p_sqlite3_stmt;
    .param p2, "sql"    # Lcom/almworks/sqlite4java/SQLParts;

    .prologue
    .line 1373
    sget-boolean v1, Lcom/almworks/sqlite4java/SQLiteConnection;->$assertionsDisabled:Z

    if-nez v1, :cond_0

    iget-object v1, p0, Lcom/almworks/sqlite4java/SQLiteConnection;->myLock:Ljava/lang/Object;

    invoke-static {v1}, Ljava/lang/Thread;->holdsLock(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_0

    new-instance v1, Ljava/lang/AssertionError;

    invoke-direct {v1}, Ljava/lang/AssertionError;-><init>()V

    throw v1

    .line 1374
    :cond_0
    iget-object v1, p0, Lcom/almworks/sqlite4java/SQLiteConnection;->myStatementCache:Ljavolution/util/stripped/FastMap;

    invoke-virtual {v1, p2}, Ljavolution/util/stripped/FastMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/almworks/sqlite4java/SWIGTYPE_p_sqlite3_stmt;

    .line 1375
    .local v0, "removedHandle":Lcom/almworks/sqlite4java/SWIGTYPE_p_sqlite3_stmt;
    if-eqz v0, :cond_1

    if-eq v0, p1, :cond_1

    .line 1377
    iget-object v1, p0, Lcom/almworks/sqlite4java/SQLiteConnection;->myStatementCache:Ljavolution/util/stripped/FastMap;

    invoke-virtual {v1, p2, v0}, Ljavolution/util/stripped/FastMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1379
    :cond_1
    return-void
.end method

.method private forgetStatement(Lcom/almworks/sqlite4java/SQLiteStatement;)V
    .locals 3
    .param p1, "statement"    # Lcom/almworks/sqlite4java/SQLiteStatement;

    .prologue
    .line 1382
    sget-boolean v1, Lcom/almworks/sqlite4java/SQLiteConnection;->$assertionsDisabled:Z

    if-nez v1, :cond_0

    iget-object v1, p0, Lcom/almworks/sqlite4java/SQLiteConnection;->myLock:Ljava/lang/Object;

    invoke-static {v1}, Ljava/lang/Thread;->holdsLock(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_0

    new-instance v1, Ljava/lang/AssertionError;

    invoke-direct {v1}, Ljava/lang/AssertionError;-><init>()V

    throw v1

    .line 1383
    :cond_0
    iget-object v1, p0, Lcom/almworks/sqlite4java/SQLiteConnection;->myStatements:Ljava/util/ArrayList;

    invoke-virtual {v1, p1}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    move-result v0

    .line 1384
    .local v0, "removed":Z
    if-nez v0, :cond_1

    .line 1385
    const-string v1, "alien statement"

    const/4 v2, 0x1

    invoke-static {p1, v1, v2}, Lcom/almworks/sqlite4java/Internal;->recoverableError(Ljava/lang/Object;Ljava/lang/String;Z)V

    .line 1387
    :cond_1
    return-void
.end method

.method private freeBuffer(Lcom/almworks/sqlite4java/DirectBuffer;)V
    .locals 5
    .param p1, "buffer"    # Lcom/almworks/sqlite4java/DirectBuffer;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/almworks/sqlite4java/SQLiteException;
        }
    .end annotation

    .prologue
    const/4 v2, 0x1

    .line 1543
    invoke-virtual {p0}, Lcom/almworks/sqlite4java/SQLiteConnection;->checkThread()V

    .line 1545
    iget-object v3, p0, Lcom/almworks/sqlite4java/SQLiteConnection;->myLock:Ljava/lang/Object;

    monitor-enter v3

    .line 1546
    :try_start_0
    iget-object v4, p0, Lcom/almworks/sqlite4java/SQLiteConnection;->myBuffers:Ljava/util/ArrayList;

    invoke-virtual {v4, p1}, Ljava/util/ArrayList;->indexOf(Ljava/lang/Object;)I

    move-result v4

    if-ltz v4, :cond_1

    move v0, v2

    .line 1547
    .local v0, "cached":Z
    :goto_0
    monitor-exit v3
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 1548
    invoke-virtual {p1}, Lcom/almworks/sqlite4java/DirectBuffer;->decUsed()V

    .line 1549
    if-nez v0, :cond_0

    .line 1550
    invoke-static {p1}, Lcom/almworks/sqlite4java/_SQLiteManual;->wrapper_free(Lcom/almworks/sqlite4java/DirectBuffer;)I

    move-result v1

    .line 1551
    .local v1, "rc":I
    if-eqz v1, :cond_0

    .line 1552
    const-string v3, "error deallocating buffer"

    invoke-static {p0, v3, v2}, Lcom/almworks/sqlite4java/Internal;->recoverableError(Ljava/lang/Object;Ljava/lang/String;Z)V

    .line 1555
    .end local v1    # "rc":I
    :cond_0
    return-void

    .line 1546
    .end local v0    # "cached":Z
    :cond_1
    const/4 v0, 0x0

    goto :goto_0

    .line 1547
    :catchall_0
    move-exception v2

    :try_start_1
    monitor-exit v3
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v2
.end method

.method private getIntArrayModule(Lcom/almworks/sqlite4java/SWIGTYPE_p_sqlite3;)Lcom/almworks/sqlite4java/SWIGTYPE_p_intarray_module;
    .locals 3
    .param p1, "handle"    # Lcom/almworks/sqlite4java/SWIGTYPE_p_sqlite3;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/almworks/sqlite4java/SQLiteException;
        }
    .end annotation

    .prologue
    .line 1081
    iget-object v0, p0, Lcom/almworks/sqlite4java/SQLiteConnection;->myIntArrayModule:Lcom/almworks/sqlite4java/SWIGTYPE_p_intarray_module;

    .line 1083
    .local v0, "r":Lcom/almworks/sqlite4java/SWIGTYPE_p_intarray_module;
    if-nez v0, :cond_1

    .line 1084
    invoke-static {}, Lcom/almworks/sqlite4java/Internal;->isFineLogging()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 1085
    const-string v1, "registering INTARRAY module"

    invoke-static {p0, v1}, Lcom/almworks/sqlite4java/Internal;->logFine(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 1086
    :cond_0
    iget-object v1, p0, Lcom/almworks/sqlite4java/SQLiteConnection;->mySQLiteManual:Lcom/almworks/sqlite4java/_SQLiteManual;

    invoke-virtual {v1, p1}, Lcom/almworks/sqlite4java/_SQLiteManual;->sqlite3_intarray_register(Lcom/almworks/sqlite4java/SWIGTYPE_p_sqlite3;)Lcom/almworks/sqlite4java/SWIGTYPE_p_intarray_module;

    move-result-object v0

    iput-object v0, p0, Lcom/almworks/sqlite4java/SQLiteConnection;->myIntArrayModule:Lcom/almworks/sqlite4java/SWIGTYPE_p_intarray_module;

    .line 1087
    iget-object v1, p0, Lcom/almworks/sqlite4java/SQLiteConnection;->mySQLiteManual:Lcom/almworks/sqlite4java/_SQLiteManual;

    invoke-virtual {v1}, Lcom/almworks/sqlite4java/_SQLiteManual;->getLastReturnCode()I

    move-result v1

    const-string v2, "getIntArrayModule()"

    invoke-virtual {p0, v1, v2}, Lcom/almworks/sqlite4java/SQLiteConnection;->throwResult(ILjava/lang/String;)V

    .line 1088
    if-nez v0, :cond_1

    .line 1089
    const/16 v1, -0x63

    const-string v2, "getIntArrayModule()"

    invoke-virtual {p0, v1, v2}, Lcom/almworks/sqlite4java/SQLiteConnection;->throwResult(ILjava/lang/String;)V

    .line 1092
    :cond_1
    return-object v0
.end method

.method private getProgressHandler()Lcom/almworks/sqlite4java/ProgressHandler;
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/almworks/sqlite4java/SQLiteException;
        }
    .end annotation

    .prologue
    .line 1128
    iget-object v0, p0, Lcom/almworks/sqlite4java/SQLiteConnection;->myProgressHandler:Lcom/almworks/sqlite4java/ProgressHandler;

    .line 1129
    .local v0, "handler":Lcom/almworks/sqlite4java/ProgressHandler;
    if-nez v0, :cond_1

    .line 1130
    iget-object v1, p0, Lcom/almworks/sqlite4java/SQLiteConnection;->mySQLiteManual:Lcom/almworks/sqlite4java/_SQLiteManual;

    invoke-direct {p0}, Lcom/almworks/sqlite4java/SQLiteConnection;->handle()Lcom/almworks/sqlite4java/SWIGTYPE_p_sqlite3;

    move-result-object v2

    iget v3, p0, Lcom/almworks/sqlite4java/SQLiteConnection;->myStepsPerCallback:I

    invoke-virtual {v1, v2, v3}, Lcom/almworks/sqlite4java/_SQLiteManual;->install_progress_handler(Lcom/almworks/sqlite4java/SWIGTYPE_p_sqlite3;I)Lcom/almworks/sqlite4java/ProgressHandler;

    move-result-object v0

    .line 1131
    if-nez v0, :cond_0

    .line 1132
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "cannot install progress handler ["

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/almworks/sqlite4java/SQLiteConnection;->mySQLiteManual:Lcom/almworks/sqlite4java/_SQLiteManual;

    invoke-virtual {v2}, Lcom/almworks/sqlite4java/_SQLiteManual;->getLastReturnCode()I

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "]"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {p0, v1}, Lcom/almworks/sqlite4java/Internal;->logWarn(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 1133
    sget-object v0, Lcom/almworks/sqlite4java/ProgressHandler;->DISPOSED:Lcom/almworks/sqlite4java/ProgressHandler;

    .line 1135
    :cond_0
    iput-object v0, p0, Lcom/almworks/sqlite4java/SQLiteConnection;->myProgressHandler:Lcom/almworks/sqlite4java/ProgressHandler;

    .line 1137
    :cond_1
    return-object v0
.end method

.method private getSqliteDbName()Ljava/lang/String;
    .locals 1

    .prologue
    .line 1501
    iget-object v0, p0, Lcom/almworks/sqlite4java/SQLiteConnection;->myFile:Ljava/io/File;

    if-nez v0, :cond_0

    const-string v0, ":memory:"

    :goto_0
    return-object v0

    :cond_0
    iget-object v0, p0, Lcom/almworks/sqlite4java/SQLiteConnection;->myFile:Ljava/io/File;

    invoke-virtual {v0}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v0

    goto :goto_0
.end method

.method private handle()Lcom/almworks/sqlite4java/SWIGTYPE_p_sqlite3;
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/almworks/sqlite4java/SQLiteException;
        }
    .end annotation

    .prologue
    .line 1398
    iget-object v2, p0, Lcom/almworks/sqlite4java/SQLiteConnection;->myLock:Ljava/lang/Object;

    monitor-enter v2

    .line 1399
    :try_start_0
    iget-boolean v1, p0, Lcom/almworks/sqlite4java/SQLiteConnection;->myDisposed:Z

    if-eqz v1, :cond_0

    .line 1400
    new-instance v1, Lcom/almworks/sqlite4java/SQLiteException;

    const/16 v3, -0x5c

    const-string v4, "connection is disposed"

    invoke-direct {v1, v3, v4}, Lcom/almworks/sqlite4java/SQLiteException;-><init>(ILjava/lang/String;)V

    throw v1

    .line 1405
    :catchall_0
    move-exception v1

    monitor-exit v2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1

    .line 1401
    :cond_0
    :try_start_1
    iget-object v0, p0, Lcom/almworks/sqlite4java/SQLiteConnection;->myHandle:Lcom/almworks/sqlite4java/SWIGTYPE_p_sqlite3;

    .line 1402
    .local v0, "handle":Lcom/almworks/sqlite4java/SWIGTYPE_p_sqlite3;
    if-nez v0, :cond_1

    .line 1403
    new-instance v1, Lcom/almworks/sqlite4java/SQLiteException;

    const/16 v3, -0x61

    const/4 v4, 0x0

    invoke-direct {v1, v3, v4}, Lcom/almworks/sqlite4java/SQLiteException;-><init>(ILjava/lang/String;)V

    throw v1

    .line 1404
    :cond_1
    monitor-exit v2
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    return-object v0
.end method

.method private nextArrayName()Ljava/lang/String;
    .locals 4

    .prologue
    .line 1096
    const-string v0, "__IA%02X"

    const/4 v1, 0x1

    new-array v1, v1, [Ljava/lang/Object;

    const/4 v2, 0x0

    iget v3, p0, Lcom/almworks/sqlite4java/SQLiteConnection;->myLongArrayCounter:I

    add-int/lit8 v3, v3, 0x1

    iput v3, p0, Lcom/almworks/sqlite4java/SQLiteConnection;->myLongArrayCounter:I

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    aput-object v3, v1, v2

    invoke-static {v0, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method private open0(I)V
    .locals 9
    .param p1, "flags"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/almworks/sqlite4java/SQLiteException;
        }
    .end annotation

    .prologue
    .line 1441
    invoke-static {}, Lcom/almworks/sqlite4java/SQLite;->loadLibrary()V

    .line 1442
    invoke-static {}, Lcom/almworks/sqlite4java/Internal;->isFineLogging()Z

    move-result v5

    if-eqz v5, :cond_0

    .line 1443
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "opening (0x"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-static {p1}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    move-result-object v6

    sget-object v7, Ljava/util/Locale;->US:Ljava/util/Locale;

    invoke-virtual {v6, v7}, Ljava/lang/String;->toUpperCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, ")"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {p0, v5}, Lcom/almworks/sqlite4java/Internal;->logFine(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 1445
    :cond_0
    iget-object v6, p0, Lcom/almworks/sqlite4java/SQLiteConnection;->myLock:Ljava/lang/Object;

    monitor-enter v6

    .line 1446
    :try_start_0
    iget-boolean v5, p0, Lcom/almworks/sqlite4java/SQLiteConnection;->myDisposed:Z

    if-eqz v5, :cond_1

    .line 1447
    new-instance v5, Lcom/almworks/sqlite4java/SQLiteException;

    const/16 v7, -0x5c

    const-string v8, "cannot reopen closed connection"

    invoke-direct {v5, v7, v8}, Lcom/almworks/sqlite4java/SQLiteException;-><init>(ILjava/lang/String;)V

    throw v5

    .line 1457
    :catchall_0
    move-exception v5

    monitor-exit v6
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v5

    .line 1449
    :cond_1
    :try_start_1
    iget-object v5, p0, Lcom/almworks/sqlite4java/SQLiteConnection;->myConfinement:Ljava/lang/Thread;

    if-nez v5, :cond_3

    .line 1450
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v5

    iput-object v5, p0, Lcom/almworks/sqlite4java/SQLiteConnection;->myConfinement:Ljava/lang/Thread;

    .line 1451
    invoke-static {}, Lcom/almworks/sqlite4java/Internal;->isFineLogging()Z

    move-result v5

    if-eqz v5, :cond_2

    .line 1452
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "confined to "

    invoke-virtual {v5, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    iget-object v7, p0, Lcom/almworks/sqlite4java/SQLiteConnection;->myConfinement:Ljava/lang/Thread;

    invoke-virtual {v5, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {p0, v5}, Lcom/almworks/sqlite4java/Internal;->logFine(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 1456
    :cond_2
    :goto_0
    iget-object v3, p0, Lcom/almworks/sqlite4java/SQLiteConnection;->myHandle:Lcom/almworks/sqlite4java/SWIGTYPE_p_sqlite3;

    .line 1457
    .local v3, "handle":Lcom/almworks/sqlite4java/SWIGTYPE_p_sqlite3;
    monitor-exit v6
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 1458
    if-eqz v3, :cond_4

    .line 1459
    const-string v5, "already opened"

    const/4 v6, 0x1

    invoke-static {p0, v5, v6}, Lcom/almworks/sqlite4java/Internal;->recoverableError(Ljava/lang/Object;Ljava/lang/String;Z)V

    .line 1491
    :goto_1
    return-void

    .line 1454
    .end local v3    # "handle":Lcom/almworks/sqlite4java/SWIGTYPE_p_sqlite3;
    :cond_3
    :try_start_2
    invoke-virtual {p0}, Lcom/almworks/sqlite4java/SQLiteConnection;->checkThread()V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    goto :goto_0

    .line 1462
    .restart local v3    # "handle":Lcom/almworks/sqlite4java/SWIGTYPE_p_sqlite3;
    :cond_4
    invoke-direct {p0}, Lcom/almworks/sqlite4java/SQLiteConnection;->getSqliteDbName()Ljava/lang/String;

    move-result-object v0

    .line 1463
    .local v0, "dbname":Ljava/lang/String;
    invoke-static {}, Lcom/almworks/sqlite4java/Internal;->isFineLogging()Z

    move-result v5

    if-eqz v5, :cond_5

    .line 1464
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "dbname ["

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, "]"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {p0, v5}, Lcom/almworks/sqlite4java/Internal;->logFine(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 1465
    :cond_5
    iget-object v5, p0, Lcom/almworks/sqlite4java/SQLiteConnection;->mySQLiteManual:Lcom/almworks/sqlite4java/_SQLiteManual;

    invoke-virtual {v5, v0, p1}, Lcom/almworks/sqlite4java/_SQLiteManual;->sqlite3_open_v2(Ljava/lang/String;I)Lcom/almworks/sqlite4java/SWIGTYPE_p_sqlite3;

    move-result-object v3

    .line 1466
    iget-object v5, p0, Lcom/almworks/sqlite4java/SQLiteConnection;->mySQLiteManual:Lcom/almworks/sqlite4java/_SQLiteManual;

    invoke-virtual {v5}, Lcom/almworks/sqlite4java/_SQLiteManual;->getLastReturnCode()I

    move-result v4

    .line 1467
    .local v4, "rc":I
    if-eqz v4, :cond_9

    .line 1468
    if-eqz v3, :cond_7

    .line 1469
    invoke-static {}, Lcom/almworks/sqlite4java/Internal;->isFineLogging()Z

    move-result v5

    if-eqz v5, :cond_6

    .line 1470
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "error on open ("

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, "), closing handle"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {p0, v5}, Lcom/almworks/sqlite4java/Internal;->logFine(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 1472
    :cond_6
    :try_start_3
    invoke-static {v3}, Lcom/almworks/sqlite4java/_SQLiteSwigged;->sqlite3_close(Lcom/almworks/sqlite4java/SWIGTYPE_p_sqlite3;)I
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_0

    .line 1477
    :cond_7
    :goto_2
    iget-object v5, p0, Lcom/almworks/sqlite4java/SQLiteConnection;->mySQLiteManual:Lcom/almworks/sqlite4java/_SQLiteManual;

    invoke-virtual {v5}, Lcom/almworks/sqlite4java/_SQLiteManual;->drainLastOpenError()Ljava/lang/String;

    move-result-object v2

    .line 1478
    .local v2, "errorMessage":Ljava/lang/String;
    if-nez v2, :cond_8

    .line 1479
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "open database error code "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    .line 1480
    :cond_8
    new-instance v5, Lcom/almworks/sqlite4java/SQLiteException;

    invoke-direct {v5, v4, v2}, Lcom/almworks/sqlite4java/SQLiteException;-><init>(ILjava/lang/String;)V

    throw v5

    .line 1473
    .end local v2    # "errorMessage":Ljava/lang/String;
    :catch_0
    move-exception v1

    .line 1474
    .local v1, "e":Ljava/lang/Exception;
    sget-object v5, Ljava/util/logging/Level;->FINE:Ljava/util/logging/Level;

    const-string v6, "error on closing after failed open"

    invoke-static {v5, p0, v6, v1}, Lcom/almworks/sqlite4java/Internal;->log(Ljava/util/logging/Level;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Throwable;)V

    goto :goto_2

    .line 1482
    .end local v1    # "e":Ljava/lang/Exception;
    :cond_9
    if-nez v3, :cond_a

    .line 1483
    new-instance v5, Lcom/almworks/sqlite4java/SQLiteException;

    const/16 v6, -0x63

    const-string v7, "sqlite didn\'t return db handle"

    invoke-direct {v5, v6, v7}, Lcom/almworks/sqlite4java/SQLiteException;-><init>(ILjava/lang/String;)V

    throw v5

    .line 1485
    :cond_a
    invoke-direct {p0, v3}, Lcom/almworks/sqlite4java/SQLiteConnection;->configureConnection(Lcom/almworks/sqlite4java/SWIGTYPE_p_sqlite3;)V

    .line 1486
    iget-object v6, p0, Lcom/almworks/sqlite4java/SQLiteConnection;->myLock:Ljava/lang/Object;

    monitor-enter v6

    .line 1487
    :try_start_4
    iput-object v3, p0, Lcom/almworks/sqlite4java/SQLiteConnection;->myHandle:Lcom/almworks/sqlite4java/SWIGTYPE_p_sqlite3;

    .line 1488
    iput p1, p0, Lcom/almworks/sqlite4java/SQLiteConnection;->myOpenFlags:I

    .line 1489
    monitor-exit v6
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_1

    .line 1490
    const-string v5, "opened"

    invoke-static {p0, v5}, Lcom/almworks/sqlite4java/Internal;->logInfo(Ljava/lang/Object;Ljava/lang/Object;)V

    goto/16 :goto_1

    .line 1489
    :catchall_1
    move-exception v5

    :try_start_5
    monitor-exit v6
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_1

    throw v5
.end method

.method private softClose(Lcom/almworks/sqlite4java/SWIGTYPE_p_sqlite3_blob;Ljava/lang/Object;)V
    .locals 3
    .param p1, "handle"    # Lcom/almworks/sqlite4java/SWIGTYPE_p_sqlite3_blob;
    .param p2, "source"    # Ljava/lang/Object;

    .prologue
    .line 1294
    invoke-static {p1}, Lcom/almworks/sqlite4java/_SQLiteSwigged;->sqlite3_blob_close(Lcom/almworks/sqlite4java/SWIGTYPE_p_sqlite3_blob;)I

    move-result v0

    .line 1295
    .local v0, "rc":I
    if-eqz v0, :cond_0

    .line 1296
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "error ["

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "] finishing "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {p0, v1}, Lcom/almworks/sqlite4java/Internal;->logWarn(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 1298
    :cond_0
    return-void
.end method

.method private softFinalize(Lcom/almworks/sqlite4java/SWIGTYPE_p_sqlite3_stmt;Ljava/lang/Object;)V
    .locals 3
    .param p1, "handle"    # Lcom/almworks/sqlite4java/SWIGTYPE_p_sqlite3_stmt;
    .param p2, "source"    # Ljava/lang/Object;

    .prologue
    .line 1287
    invoke-static {p1}, Lcom/almworks/sqlite4java/_SQLiteSwigged;->sqlite3_finalize(Lcom/almworks/sqlite4java/SWIGTYPE_p_sqlite3_stmt;)I

    move-result v0

    .line 1288
    .local v0, "rc":I
    if-eqz v0, :cond_0

    .line 1289
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "error ["

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "] finishing "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {p0, v1}, Lcom/almworks/sqlite4java/Internal;->logWarn(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 1291
    :cond_0
    return-void
.end method


# virtual methods
.method public blob(Ljava/lang/String;Ljava/lang/String;JZ)Lcom/almworks/sqlite4java/SQLiteBlob;
    .locals 7
    .param p1, "table"    # Ljava/lang/String;
    .param p2, "column"    # Ljava/lang/String;
    .param p3, "rowid"    # J
    .param p5, "writeAccess"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/almworks/sqlite4java/SQLiteException;
        }
    .end annotation

    .prologue
    .line 711
    const/4 v1, 0x0

    move-object v0, p0

    move-object v2, p1

    move-object v3, p2

    move-wide v4, p3

    move v6, p5

    invoke-virtual/range {v0 .. v6}, Lcom/almworks/sqlite4java/SQLiteConnection;->blob(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;JZ)Lcom/almworks/sqlite4java/SQLiteBlob;

    move-result-object v0

    return-object v0
.end method

.method public blob(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;JZ)Lcom/almworks/sqlite4java/SQLiteBlob;
    .locals 16
    .param p1, "dbname"    # Ljava/lang/String;
    .param p2, "table"    # Ljava/lang/String;
    .param p3, "column"    # Ljava/lang/String;
    .param p4, "rowid"    # J
    .param p6, "writeAccess"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/almworks/sqlite4java/SQLiteException;
        }
    .end annotation

    .prologue
    .line 668
    invoke-virtual/range {p0 .. p0}, Lcom/almworks/sqlite4java/SQLiteConnection;->checkThread()V

    .line 669
    invoke-static {}, Lcom/almworks/sqlite4java/Internal;->isFineLogging()Z

    move-result v3

    if-eqz v3, :cond_0

    .line 670
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "openBlob ["

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    move-object/from16 v0, p1

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v5, ","

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    move-object/from16 v0, p2

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v5, ","

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    move-object/from16 v0, p3

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v5, ","

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    move-wide/from16 v0, p4

    invoke-virtual {v3, v0, v1}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v5, ","

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    move/from16 v0, p6

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v5, "]"

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    move-object/from16 v0, p0

    invoke-static {v0, v3}, Lcom/almworks/sqlite4java/Internal;->logFine(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 671
    :cond_0
    invoke-direct/range {p0 .. p0}, Lcom/almworks/sqlite4java/SQLiteConnection;->handle()Lcom/almworks/sqlite4java/SWIGTYPE_p_sqlite3;

    move-result-object v4

    .line 672
    .local v4, "handle":Lcom/almworks/sqlite4java/SWIGTYPE_p_sqlite3;
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/almworks/sqlite4java/SQLiteConnection;->mySQLiteManual:Lcom/almworks/sqlite4java/_SQLiteManual;

    move-object/from16 v5, p1

    move-object/from16 v6, p2

    move-object/from16 v7, p3

    move-wide/from16 v8, p4

    move/from16 v10, p6

    invoke-virtual/range {v3 .. v10}, Lcom/almworks/sqlite4java/_SQLiteManual;->sqlite3_blob_open(Lcom/almworks/sqlite4java/SWIGTYPE_p_sqlite3;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;JZ)Lcom/almworks/sqlite4java/SWIGTYPE_p_sqlite3_blob;

    move-result-object v8

    .line 673
    .local v8, "blob":Lcom/almworks/sqlite4java/SWIGTYPE_p_sqlite3_blob;
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/almworks/sqlite4java/SQLiteConnection;->mySQLiteManual:Lcom/almworks/sqlite4java/_SQLiteManual;

    invoke-virtual {v3}, Lcom/almworks/sqlite4java/_SQLiteManual;->getLastReturnCode()I

    move-result v3

    const-string v5, "openBlob()"

    const/4 v7, 0x0

    move-object/from16 v0, p0

    invoke-virtual {v0, v3, v5, v7}, Lcom/almworks/sqlite4java/SQLiteConnection;->throwResult(ILjava/lang/String;Ljava/lang/Object;)V

    .line 674
    if-nez v8, :cond_1

    .line 675
    new-instance v3, Lcom/almworks/sqlite4java/SQLiteException;

    const/16 v5, -0x63

    const-string v7, "sqlite did not return blob"

    invoke-direct {v3, v5, v7}, Lcom/almworks/sqlite4java/SQLiteException;-><init>(ILjava/lang/String;)V

    throw v3

    .line 676
    :cond_1
    const/4 v2, 0x0

    .line 677
    .local v2, "result":Lcom/almworks/sqlite4java/SQLiteBlob;
    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/almworks/sqlite4java/SQLiteConnection;->myLock:Ljava/lang/Object;

    monitor-enter v5

    .line 680
    :try_start_0
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/almworks/sqlite4java/SQLiteConnection;->myHandle:Lcom/almworks/sqlite4java/SWIGTYPE_p_sqlite3;

    if-eqz v3, :cond_2

    .line 681
    new-instance v6, Lcom/almworks/sqlite4java/SQLiteBlob;

    move-object/from16 v0, p0

    iget-object v7, v0, Lcom/almworks/sqlite4java/SQLiteConnection;->myUncachedController:Lcom/almworks/sqlite4java/SQLiteController;

    move-object/from16 v9, p1

    move-object/from16 v10, p2

    move-object/from16 v11, p3

    move-wide/from16 v12, p4

    move/from16 v14, p6

    invoke-direct/range {v6 .. v14}, Lcom/almworks/sqlite4java/SQLiteBlob;-><init>(Lcom/almworks/sqlite4java/SQLiteController;Lcom/almworks/sqlite4java/SWIGTYPE_p_sqlite3_blob;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;JZ)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 682
    .end local v2    # "result":Lcom/almworks/sqlite4java/SQLiteBlob;
    .local v6, "result":Lcom/almworks/sqlite4java/SQLiteBlob;
    :try_start_1
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/almworks/sqlite4java/SQLiteConnection;->myBlobs:Ljava/util/ArrayList;

    invoke-virtual {v3, v6}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 686
    :goto_0
    monitor-exit v5
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 687
    if-nez v6, :cond_3

    .line 690
    :try_start_2
    invoke-static {v8}, Lcom/almworks/sqlite4java/_SQLiteSwigged;->sqlite3_blob_close(Lcom/almworks/sqlite4java/SWIGTYPE_p_sqlite3_blob;)I

    move-result v3

    const-string v5, "blob_close() in prepare()"

    move-object/from16 v0, p0

    invoke-virtual {v0, v3, v5}, Lcom/almworks/sqlite4java/SQLiteConnection;->throwResult(ILjava/lang/String;)V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0

    .line 694
    :goto_1
    new-instance v3, Lcom/almworks/sqlite4java/SQLiteException;

    const/16 v5, -0x61

    const-string v7, "connection disposed"

    invoke-direct {v3, v5, v7}, Lcom/almworks/sqlite4java/SQLiteException;-><init>(ILjava/lang/String;)V

    throw v3

    .line 684
    .end local v6    # "result":Lcom/almworks/sqlite4java/SQLiteBlob;
    .restart local v2    # "result":Lcom/almworks/sqlite4java/SQLiteBlob;
    :cond_2
    :try_start_3
    const-string v3, "connection disposed while opening blob"

    move-object/from16 v0, p0

    invoke-static {v0, v3}, Lcom/almworks/sqlite4java/Internal;->logWarn(Ljava/lang/Object;Ljava/lang/Object;)V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    move-object v6, v2

    .end local v2    # "result":Lcom/almworks/sqlite4java/SQLiteBlob;
    .restart local v6    # "result":Lcom/almworks/sqlite4java/SQLiteBlob;
    goto :goto_0

    .line 686
    .end local v6    # "result":Lcom/almworks/sqlite4java/SQLiteBlob;
    .restart local v2    # "result":Lcom/almworks/sqlite4java/SQLiteBlob;
    :catchall_0
    move-exception v3

    move-object v6, v2

    .end local v2    # "result":Lcom/almworks/sqlite4java/SQLiteBlob;
    .restart local v6    # "result":Lcom/almworks/sqlite4java/SQLiteBlob;
    :goto_2
    :try_start_4
    monitor-exit v5
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_1

    throw v3

    .line 696
    :cond_3
    return-object v6

    .line 691
    :catch_0
    move-exception v3

    goto :goto_1

    .line 686
    :catchall_1
    move-exception v3

    goto :goto_2
.end method

.method checkThread()V
    .locals 7
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/almworks/sqlite4java/SQLiteException;
        }
    .end annotation

    .prologue
    .line 1511
    iget-object v0, p0, Lcom/almworks/sqlite4java/SQLiteConnection;->myConfinement:Ljava/lang/Thread;

    .line 1512
    .local v0, "confinement":Ljava/lang/Thread;
    if-nez v0, :cond_0

    .line 1513
    new-instance v3, Lcom/almworks/sqlite4java/SQLiteException;

    const/16 v4, -0x5c

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v5, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, " is not confined or already disposed"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v3, v4, v5}, Lcom/almworks/sqlite4java/SQLiteException;-><init>(ILjava/lang/String;)V

    throw v3

    .line 1515
    :cond_0
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v2

    .line 1516
    .local v2, "thread":Ljava/lang/Thread;
    if-eq v2, v0, :cond_1

    .line 1517
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v3, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, " confined("

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, ") used ("

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, ")"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 1518
    .local v1, "message":Ljava/lang/String;
    new-instance v3, Lcom/almworks/sqlite4java/SQLiteException;

    const/16 v4, -0x62

    invoke-direct {v3, v4, v1}, Lcom/almworks/sqlite4java/SQLiteException;-><init>(ILjava/lang/String;)V

    throw v3

    .line 1520
    .end local v1    # "message":Ljava/lang/String;
    :cond_1
    return-void
.end method

.method connectionHandle()Lcom/almworks/sqlite4java/SWIGTYPE_p_sqlite3;
    .locals 1

    .prologue
    .line 1539
    iget-object v0, p0, Lcom/almworks/sqlite4java/SQLiteConnection;->myHandle:Lcom/almworks/sqlite4java/SWIGTYPE_p_sqlite3;

    return-object v0
.end method

.method public createArray()Lcom/almworks/sqlite4java/SQLiteLongArray;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/almworks/sqlite4java/SQLiteException;
        }
    .end annotation

    .prologue
    .line 942
    const/4 v0, 0x0

    const/4 v1, 0x1

    invoke-virtual {p0, v0, v1}, Lcom/almworks/sqlite4java/SQLiteConnection;->createArray(Ljava/lang/String;Z)Lcom/almworks/sqlite4java/SQLiteLongArray;

    move-result-object v0

    return-object v0
.end method

.method public createArray(Ljava/lang/String;Z)Lcom/almworks/sqlite4java/SQLiteLongArray;
    .locals 3
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "cached"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/almworks/sqlite4java/SQLiteException;
        }
    .end annotation

    .prologue
    .line 910
    invoke-virtual {p0}, Lcom/almworks/sqlite4java/SQLiteConnection;->checkThread()V

    .line 911
    invoke-static {}, Lcom/almworks/sqlite4java/Internal;->isFineLogging()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 912
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "createArray ["

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ","

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "]"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {p0, v1}, Lcom/almworks/sqlite4java/Internal;->logFine(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 913
    :cond_0
    if-nez p2, :cond_1

    if-eqz p1, :cond_1

    iget-object v1, p0, Lcom/almworks/sqlite4java/SQLiteConnection;->myLongArrays:Ljavolution/util/stripped/FastMap;

    invoke-virtual {v1, p1}, Ljavolution/util/stripped/FastMap;->containsKey(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 914
    const-string v1, "using cached array in lieu of passed parameter, because name already in use"

    invoke-static {p0, v1}, Lcom/almworks/sqlite4java/Internal;->logWarn(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 915
    const/4 p2, 0x1

    .line 917
    :cond_1
    if-nez p2, :cond_2

    .line 918
    iget-object v1, p0, Lcom/almworks/sqlite4java/SQLiteConnection;->myUncachedController:Lcom/almworks/sqlite4java/SQLiteController;

    invoke-direct {p0, p1, v1}, Lcom/almworks/sqlite4java/SQLiteConnection;->createArray0(Ljava/lang/String;Lcom/almworks/sqlite4java/SQLiteController;)Lcom/almworks/sqlite4java/SQLiteLongArray;

    move-result-object v1

    .line 927
    :goto_0
    return-object v1

    .line 920
    :cond_2
    if-nez p1, :cond_3

    iget-object v1, p0, Lcom/almworks/sqlite4java/SQLiteConnection;->myLongArrays:Ljavolution/util/stripped/FastMap;

    invoke-virtual {v1}, Ljavolution/util/stripped/FastMap;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_3

    .line 921
    iget-object v1, p0, Lcom/almworks/sqlite4java/SQLiteConnection;->myLongArrays:Ljavolution/util/stripped/FastMap;

    invoke-virtual {v1}, Ljavolution/util/stripped/FastMap;->head()Ljavolution/util/stripped/FastMap$Entry;

    move-result-object v1

    invoke-virtual {v1}, Ljavolution/util/stripped/FastMap$Entry;->getNext()Ljavolution/util/stripped/FastMap$Entry;

    move-result-object v1

    invoke-virtual {v1}, Ljavolution/util/stripped/FastMap$Entry;->getKey()Ljava/lang/Object;

    move-result-object p1

    .end local p1    # "name":Ljava/lang/String;
    check-cast p1, Ljava/lang/String;

    .line 923
    .restart local p1    # "name":Ljava/lang/String;
    :cond_3
    if-nez p1, :cond_4

    const/4 v0, 0x0

    .line 924
    .local v0, "array":Lcom/almworks/sqlite4java/SWIGTYPE_p_intarray;
    :goto_1
    if-eqz v0, :cond_5

    .line 925
    new-instance v1, Lcom/almworks/sqlite4java/SQLiteLongArray;

    iget-object v2, p0, Lcom/almworks/sqlite4java/SQLiteConnection;->myCachedController:Lcom/almworks/sqlite4java/SQLiteController;

    invoke-direct {v1, v2, v0, p1}, Lcom/almworks/sqlite4java/SQLiteLongArray;-><init>(Lcom/almworks/sqlite4java/SQLiteController;Lcom/almworks/sqlite4java/SWIGTYPE_p_intarray;Ljava/lang/String;)V

    goto :goto_0

    .line 923
    .end local v0    # "array":Lcom/almworks/sqlite4java/SWIGTYPE_p_intarray;
    :cond_4
    iget-object v1, p0, Lcom/almworks/sqlite4java/SQLiteConnection;->myLongArrays:Ljavolution/util/stripped/FastMap;

    invoke-virtual {v1, p1}, Ljavolution/util/stripped/FastMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/almworks/sqlite4java/SWIGTYPE_p_intarray;

    move-object v0, v1

    goto :goto_1

    .line 927
    .restart local v0    # "array":Lcom/almworks/sqlite4java/SWIGTYPE_p_intarray;
    :cond_5
    iget-object v1, p0, Lcom/almworks/sqlite4java/SQLiteConnection;->myCachedController:Lcom/almworks/sqlite4java/SQLiteController;

    invoke-direct {p0, p1, v1}, Lcom/almworks/sqlite4java/SQLiteConnection;->createArray0(Ljava/lang/String;Lcom/almworks/sqlite4java/SQLiteController;)Lcom/almworks/sqlite4java/SQLiteLongArray;

    move-result-object v1

    goto :goto_0
.end method

.method public debug(Ljava/lang/String;)Ljava/lang/String;
    .locals 13
    .param p1, "sql"    # Ljava/lang/String;

    .prologue
    .line 1618
    const/4 v7, 0x0

    .line 1620
    .local v7, "st":Lcom/almworks/sqlite4java/SQLiteStatement;
    :try_start_0
    invoke-virtual {p0, p1}, Lcom/almworks/sqlite4java/SQLiteConnection;->prepare(Ljava/lang/String;)Lcom/almworks/sqlite4java/SQLiteStatement;

    move-result-object v7

    .line 1621
    invoke-virtual {v7}, Lcom/almworks/sqlite4java/SQLiteStatement;->step()Z

    move-result v6

    .line 1622
    .local v6, "r":Z
    if-nez v6, :cond_1

    .line 1623
    const-string v10, ""
    :try_end_0
    .catch Lcom/almworks/sqlite4java/SQLiteException; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 1666
    if-eqz v7, :cond_0

    invoke-virtual {v7}, Lcom/almworks/sqlite4java/SQLiteStatement;->dispose()V

    .end local v6    # "r":Z
    :cond_0
    :goto_0
    return-object v10

    .line 1625
    .restart local v6    # "r":Z
    :cond_1
    :try_start_1
    invoke-virtual {v7}, Lcom/almworks/sqlite4java/SQLiteStatement;->columnCount()I

    move-result v3

    .line 1626
    .local v3, "columns":I
    if-nez v3, :cond_2

    .line 1627
    const-string v10, ""
    :try_end_1
    .catch Lcom/almworks/sqlite4java/SQLiteException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 1666
    if-eqz v7, :cond_0

    invoke-virtual {v7}, Lcom/almworks/sqlite4java/SQLiteStatement;->dispose()V

    goto :goto_0

    .line 1629
    :cond_2
    :try_start_2
    new-array v9, v3, [I

    .line 1630
    .local v9, "widths":[I
    new-array v2, v3, [Ljava/lang/String;

    .line 1631
    .local v2, "columnNames":[Ljava/lang/String;
    const/4 v5, 0x0

    .local v5, "i":I
    :goto_1
    if-ge v5, v3, :cond_3

    .line 1632
    invoke-virtual {v7, v5}, Lcom/almworks/sqlite4java/SQLiteStatement;->getColumnName(I)Ljava/lang/String;

    move-result-object v10

    invoke-static {v10}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v10

    aput-object v10, v2, v5

    .line 1633
    aget-object v10, v2, v5

    invoke-virtual {v10}, Ljava/lang/String;->length()I

    move-result v10

    aput v10, v9, v5

    .line 1631
    add-int/lit8 v5, v5, 0x1

    goto :goto_1

    .line 1635
    :cond_3
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 1637
    .local v1, "cells":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    :cond_4
    const/4 v5, 0x0

    :goto_2
    if-ge v5, v3, :cond_6

    .line 1638
    invoke-virtual {v7, v5}, Lcom/almworks/sqlite4java/SQLiteStatement;->columnNull(I)Z

    move-result v10

    if-eqz v10, :cond_5

    const-string v8, "<null>"

    .line 1639
    .local v8, "v":Ljava/lang/String;
    :goto_3
    invoke-interface {v1, v8}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1640
    aget v10, v9, v5

    invoke-virtual {v8}, Ljava/lang/String;->length()I

    move-result v11

    invoke-static {v10, v11}, Ljava/lang/Math;->max(II)I

    move-result v10

    aput v10, v9, v5

    .line 1637
    add-int/lit8 v5, v5, 0x1

    goto :goto_2

    .line 1638
    .end local v8    # "v":Ljava/lang/String;
    :cond_5
    invoke-virtual {v7, v5}, Lcom/almworks/sqlite4java/SQLiteStatement;->columnValue(I)Ljava/lang/Object;

    move-result-object v10

    invoke-static {v10}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v8

    goto :goto_3

    .line 1642
    :cond_6
    invoke-virtual {v7}, Lcom/almworks/sqlite4java/SQLiteStatement;->step()Z

    move-result v10

    if-nez v10, :cond_4

    .line 1644
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 1645
    .local v0, "buf":Ljava/lang/StringBuilder;
    const/16 v10, 0x7c

    invoke-virtual {v0, v10}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 1646
    const/4 v5, 0x0

    :goto_4
    if-ge v5, v3, :cond_7

    .line 1647
    aget-object v10, v2, v5

    aget v11, v9, v5

    const/16 v12, 0x20

    invoke-static {v0, v10, v11, v12}, Lcom/almworks/sqlite4java/SQLiteConnection;->appendW(Ljava/lang/StringBuilder;Ljava/lang/String;IC)V

    .line 1648
    const/16 v10, 0x7c

    invoke-virtual {v0, v10}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 1646
    add-int/lit8 v5, v5, 0x1

    goto :goto_4

    .line 1650
    :cond_7
    const-string v10, "\n|"

    invoke-virtual {v0, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1651
    const/4 v5, 0x0

    :goto_5
    if-ge v5, v3, :cond_8

    .line 1652
    const-string v10, ""

    aget v11, v9, v5

    const/16 v12, 0x2d

    invoke-static {v0, v10, v11, v12}, Lcom/almworks/sqlite4java/SQLiteConnection;->appendW(Ljava/lang/StringBuilder;Ljava/lang/String;IC)V

    .line 1653
    const/16 v10, 0x7c

    invoke-virtual {v0, v10}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 1651
    add-int/lit8 v5, v5, 0x1

    goto :goto_5

    .line 1655
    :cond_8
    const/4 v5, 0x0

    :goto_6
    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v10

    if-ge v5, v10, :cond_a

    .line 1656
    rem-int v10, v5, v3

    if-nez v10, :cond_9

    .line 1657
    const-string v10, "\n|"

    invoke-virtual {v0, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1659
    :cond_9
    invoke-interface {v1, v5}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Ljava/lang/String;

    rem-int v11, v5, v3

    aget v11, v9, v11

    const/16 v12, 0x20

    invoke-static {v0, v10, v11, v12}, Lcom/almworks/sqlite4java/SQLiteConnection;->appendW(Ljava/lang/StringBuilder;Ljava/lang/String;IC)V

    .line 1660
    const/16 v10, 0x7c

    invoke-virtual {v0, v10}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 1655
    add-int/lit8 v5, v5, 0x1

    goto :goto_6

    .line 1662
    :cond_a
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    :try_end_2
    .catch Lcom/almworks/sqlite4java/SQLiteException; {:try_start_2 .. :try_end_2} :catch_0
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    move-result-object v10

    .line 1666
    if-eqz v7, :cond_0

    invoke-virtual {v7}, Lcom/almworks/sqlite4java/SQLiteStatement;->dispose()V

    goto/16 :goto_0

    .line 1663
    .end local v0    # "buf":Ljava/lang/StringBuilder;
    .end local v1    # "cells":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    .end local v2    # "columnNames":[Ljava/lang/String;
    .end local v3    # "columns":I
    .end local v5    # "i":I
    .end local v6    # "r":Z
    .end local v9    # "widths":[I
    :catch_0
    move-exception v4

    .line 1664
    .local v4, "e":Lcom/almworks/sqlite4java/SQLiteException;
    :try_start_3
    invoke-virtual {v4}, Lcom/almworks/sqlite4java/SQLiteException;->getMessage()Ljava/lang/String;
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    move-result-object v10

    .line 1666
    if-eqz v7, :cond_0

    invoke-virtual {v7}, Lcom/almworks/sqlite4java/SQLiteStatement;->dispose()V

    goto/16 :goto_0

    .end local v4    # "e":Lcom/almworks/sqlite4java/SQLiteException;
    :catchall_0
    move-exception v10

    if-eqz v7, :cond_b

    invoke-virtual {v7}, Lcom/almworks/sqlite4java/SQLiteStatement;->dispose()V

    :cond_b
    throw v10
.end method

.method public dispose()V
    .locals 9

    .prologue
    const/4 v8, 0x0

    .line 433
    iget-object v6, p0, Lcom/almworks/sqlite4java/SQLiteConnection;->myLock:Ljava/lang/Object;

    monitor-enter v6

    .line 434
    :try_start_0
    iget-boolean v5, p0, Lcom/almworks/sqlite4java/SQLiteConnection;->myDisposed:Z

    if-eqz v5, :cond_1

    .line 435
    monitor-exit v6

    .line 467
    :cond_0
    :goto_0
    return-void

    .line 436
    :cond_1
    iget-object v0, p0, Lcom/almworks/sqlite4java/SQLiteConnection;->myConfinement:Ljava/lang/Thread;

    .line 437
    .local v0, "confinement":Ljava/lang/Thread;
    if-eqz v0, :cond_2

    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v5

    if-eq v0, v5, :cond_2

    .line 438
    const-string v5, "will not dispose from a non-confining thread"

    const/4 v7, 0x1

    invoke-static {p0, v5, v7}, Lcom/almworks/sqlite4java/Internal;->recoverableError(Ljava/lang/Object;Ljava/lang/String;Z)V

    .line 439
    monitor-exit v6

    goto :goto_0

    .line 445
    .end local v0    # "confinement":Ljava/lang/Thread;
    :catchall_0
    move-exception v5

    monitor-exit v6
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v5

    .line 441
    .restart local v0    # "confinement":Ljava/lang/Thread;
    :cond_2
    const/4 v5, 0x1

    :try_start_1
    iput-boolean v5, p0, Lcom/almworks/sqlite4java/SQLiteConnection;->myDisposed:Z

    .line 442
    iget-object v3, p0, Lcom/almworks/sqlite4java/SQLiteConnection;->myHandle:Lcom/almworks/sqlite4java/SWIGTYPE_p_sqlite3;

    .line 443
    .local v3, "handle":Lcom/almworks/sqlite4java/SWIGTYPE_p_sqlite3;
    const/4 v5, 0x0

    iput-object v5, p0, Lcom/almworks/sqlite4java/SQLiteConnection;->myHandle:Lcom/almworks/sqlite4java/SWIGTYPE_p_sqlite3;

    .line 444
    const/4 v5, 0x0

    iput v5, p0, Lcom/almworks/sqlite4java/SQLiteConnection;->myOpenFlags:I

    .line 445
    monitor-exit v6
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 446
    if-eqz v3, :cond_0

    .line 448
    const-string v5, "disposing"

    invoke-static {p0, v5}, Lcom/almworks/sqlite4java/Internal;->logFine(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 449
    invoke-direct {p0}, Lcom/almworks/sqlite4java/SQLiteConnection;->finalizeStatements()V

    .line 450
    invoke-direct {p0}, Lcom/almworks/sqlite4java/SQLiteConnection;->finalizeBlobs()V

    .line 451
    invoke-direct {p0}, Lcom/almworks/sqlite4java/SQLiteConnection;->finalizeBuffers()V

    .line 452
    invoke-direct {p0}, Lcom/almworks/sqlite4java/SQLiteConnection;->finalizeArrays()V

    .line 453
    invoke-direct {p0, v3}, Lcom/almworks/sqlite4java/SQLiteConnection;->finalizeProgressHandler(Lcom/almworks/sqlite4java/SWIGTYPE_p_sqlite3;)V

    .line 454
    invoke-static {v3}, Lcom/almworks/sqlite4java/_SQLiteSwigged;->sqlite3_close(Lcom/almworks/sqlite4java/SWIGTYPE_p_sqlite3;)I

    move-result v4

    .line 456
    .local v4, "rc":I
    if-eqz v4, :cond_3

    .line 457
    const/4 v2, 0x0

    .line 459
    .local v2, "errmsg":Ljava/lang/String;
    :try_start_2
    invoke-static {v3}, Lcom/almworks/sqlite4java/_SQLiteSwigged;->sqlite3_errmsg(Lcom/almworks/sqlite4java/SWIGTYPE_p_sqlite3;)Ljava/lang/String;
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0

    move-result-object v2

    .line 463
    :goto_1
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "close error "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v6

    if-nez v2, :cond_4

    const-string v5, ""

    :goto_2
    invoke-virtual {v6, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {p0, v5}, Lcom/almworks/sqlite4java/Internal;->logWarn(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 465
    .end local v2    # "errmsg":Ljava/lang/String;
    :cond_3
    const-string v5, "connection closed"

    invoke-static {p0, v5}, Lcom/almworks/sqlite4java/Internal;->logInfo(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 466
    iput-object v8, p0, Lcom/almworks/sqlite4java/SQLiteConnection;->myConfinement:Ljava/lang/Thread;

    goto :goto_0

    .line 460
    .restart local v2    # "errmsg":Ljava/lang/String;
    :catch_0
    move-exception v1

    .line 461
    .local v1, "e":Ljava/lang/Exception;
    sget-object v5, Ljava/util/logging/Level;->WARNING:Ljava/util/logging/Level;

    const-string v6, "cannot get sqlite3_errmsg"

    invoke-static {v5, p0, v6, v1}, Lcom/almworks/sqlite4java/Internal;->log(Ljava/util/logging/Level;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Throwable;)V

    goto :goto_1

    .line 463
    .end local v1    # "e":Ljava/lang/Exception;
    :cond_4
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, ": "

    invoke-virtual {v5, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    goto :goto_2
.end method

.method public exec(Ljava/lang/String;)Lcom/almworks/sqlite4java/SQLiteConnection;
    .locals 12
    .param p1, "sql"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/almworks/sqlite4java/SQLiteException;
        }
    .end annotation

    .prologue
    .line 484
    invoke-virtual {p0}, Lcom/almworks/sqlite4java/SQLiteConnection;->checkThread()V

    .line 485
    iget-object v0, p0, Lcom/almworks/sqlite4java/SQLiteConnection;->myProfiler:Lcom/almworks/sqlite4java/SQLiteProfiler;

    .line 486
    .local v0, "profiler":Lcom/almworks/sqlite4java/SQLiteProfiler;
    invoke-static {}, Lcom/almworks/sqlite4java/Internal;->isFineLogging()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 487
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "exec ["

    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v4, "]"

    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {p0, v1}, Lcom/almworks/sqlite4java/Internal;->logFine(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 488
    :cond_0
    invoke-direct {p0}, Lcom/almworks/sqlite4java/SQLiteConnection;->handle()Lcom/almworks/sqlite4java/SWIGTYPE_p_sqlite3;

    move-result-object v8

    .line 489
    .local v8, "handle":Lcom/almworks/sqlite4java/SWIGTYPE_p_sqlite3;
    invoke-direct {p0}, Lcom/almworks/sqlite4java/SQLiteConnection;->getProgressHandler()Lcom/almworks/sqlite4java/ProgressHandler;

    move-result-object v9

    .line 490
    .local v9, "ph":Lcom/almworks/sqlite4java/ProgressHandler;
    invoke-virtual {v9}, Lcom/almworks/sqlite4java/ProgressHandler;->reset()V

    .line 492
    const/4 v1, 0x1

    :try_start_0
    new-array v7, v1, [Ljava/lang/String;

    const/4 v1, 0x0

    const/4 v4, 0x0

    aput-object v4, v7, v1

    .line 493
    .local v7, "error":[Ljava/lang/String;
    if-nez v0, :cond_3

    const-wide/16 v2, 0x0

    .line 494
    .local v2, "from":J
    :goto_0
    invoke-static {v8, p1, v7}, Lcom/almworks/sqlite4java/_SQLiteManual;->sqlite3_exec(Lcom/almworks/sqlite4java/SWIGTYPE_p_sqlite3;Ljava/lang/String;[Ljava/lang/String;)I

    move-result v6

    .line 495
    .local v6, "rc":I
    if-eqz v0, :cond_1

    invoke-static {}, Ljava/lang/System;->nanoTime()J

    move-result-wide v4

    move-object v1, p1

    invoke-virtual/range {v0 .. v6}, Lcom/almworks/sqlite4java/SQLiteProfiler;->reportExec(Ljava/lang/String;JJI)V

    .line 496
    :cond_1
    const-string v1, "exec()"

    const/4 v4, 0x0

    aget-object v4, v7, v4

    invoke-virtual {p0, v6, v1, v4}, Lcom/almworks/sqlite4java/SQLiteConnection;->throwResult(ILjava/lang/String;Ljava/lang/Object;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 498
    invoke-static {}, Lcom/almworks/sqlite4java/Internal;->isFineLogging()Z

    move-result v1

    if-eqz v1, :cond_2

    .line 499
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "exec ["

    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v4, "]: "

    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v9}, Lcom/almworks/sqlite4java/ProgressHandler;->getSteps()J

    move-result-wide v4

    invoke-virtual {v1, v4, v5}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v4, " steps"

    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {p0, v1}, Lcom/almworks/sqlite4java/Internal;->logFine(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 500
    :cond_2
    invoke-virtual {v9}, Lcom/almworks/sqlite4java/ProgressHandler;->reset()V

    .line 502
    return-object p0

    .line 493
    .end local v2    # "from":J
    .end local v6    # "rc":I
    :cond_3
    :try_start_1
    invoke-static {}, Ljava/lang/System;->nanoTime()J
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    move-result-wide v2

    goto :goto_0

    .line 498
    .end local v7    # "error":[Ljava/lang/String;
    :catchall_0
    move-exception v1

    invoke-static {}, Lcom/almworks/sqlite4java/Internal;->isFineLogging()Z

    move-result v4

    if-eqz v4, :cond_4

    .line 499
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "exec ["

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, "]: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v9}, Lcom/almworks/sqlite4java/ProgressHandler;->getSteps()J

    move-result-wide v10

    invoke-virtual {v4, v10, v11}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, " steps"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {p0, v4}, Lcom/almworks/sqlite4java/Internal;->logFine(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 500
    :cond_4
    invoke-virtual {v9}, Lcom/almworks/sqlite4java/ProgressHandler;->reset()V

    throw v1
.end method

.method protected finalize()V
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Throwable;
        }
    .end annotation

    .prologue
    .line 1530
    invoke-super {p0}, Ljava/lang/Object;->finalize()V

    .line 1531
    iget-object v1, p0, Lcom/almworks/sqlite4java/SQLiteConnection;->myHandle:Lcom/almworks/sqlite4java/SWIGTYPE_p_sqlite3;

    .line 1532
    .local v1, "handle":Lcom/almworks/sqlite4java/SWIGTYPE_p_sqlite3;
    iget-boolean v0, p0, Lcom/almworks/sqlite4java/SQLiteConnection;->myDisposed:Z

    .line 1533
    .local v0, "disposed":Z
    if-nez v1, :cond_0

    if-nez v0, :cond_1

    .line 1534
    :cond_0
    const-string v2, "wasn\'t disposed before finalizing"

    const/4 v3, 0x1

    invoke-static {p0, v2, v3}, Lcom/almworks/sqlite4java/Internal;->recoverableError(Ljava/lang/Object;Ljava/lang/String;Z)V

    .line 1536
    :cond_1
    return-void
.end method

.method public getAutoCommit()Z
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/almworks/sqlite4java/SQLiteException;
        }
    .end annotation

    .prologue
    .line 742
    invoke-virtual {p0}, Lcom/almworks/sqlite4java/SQLiteConnection;->checkThread()V

    .line 743
    invoke-direct {p0}, Lcom/almworks/sqlite4java/SQLiteConnection;->handle()Lcom/almworks/sqlite4java/SWIGTYPE_p_sqlite3;

    move-result-object v1

    invoke-static {v1}, Lcom/almworks/sqlite4java/_SQLiteSwigged;->sqlite3_get_autocommit(Lcom/almworks/sqlite4java/SWIGTYPE_p_sqlite3;)I

    move-result v0

    .line 744
    .local v0, "r":I
    if-eqz v0, :cond_0

    const/4 v1, 0x1

    :goto_0
    return v1

    :cond_0
    const/4 v1, 0x0

    goto :goto_0
.end method

.method public getChanges()I
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/almworks/sqlite4java/SQLiteException;
        }
    .end annotation

    .prologue
    .line 772
    invoke-virtual {p0}, Lcom/almworks/sqlite4java/SQLiteConnection;->checkThread()V

    .line 773
    invoke-direct {p0}, Lcom/almworks/sqlite4java/SQLiteConnection;->handle()Lcom/almworks/sqlite4java/SWIGTYPE_p_sqlite3;

    move-result-object v0

    invoke-static {v0}, Lcom/almworks/sqlite4java/_SQLiteSwigged;->sqlite3_changes(Lcom/almworks/sqlite4java/SWIGTYPE_p_sqlite3;)I

    move-result v0

    return v0
.end method

.method public getDatabaseFile()Ljava/io/File;
    .locals 1

    .prologue
    .line 198
    iget-object v0, p0, Lcom/almworks/sqlite4java/SQLiteConnection;->myFile:Ljava/io/File;

    return-object v0
.end method

.method public getErrorCode()I
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/almworks/sqlite4java/SQLiteException;
        }
    .end annotation

    .prologue
    .line 814
    invoke-virtual {p0}, Lcom/almworks/sqlite4java/SQLiteConnection;->checkThread()V

    .line 815
    invoke-direct {p0}, Lcom/almworks/sqlite4java/SQLiteConnection;->handle()Lcom/almworks/sqlite4java/SWIGTYPE_p_sqlite3;

    move-result-object v0

    invoke-static {v0}, Lcom/almworks/sqlite4java/_SQLiteSwigged;->sqlite3_errcode(Lcom/almworks/sqlite4java/SWIGTYPE_p_sqlite3;)I

    move-result v0

    return v0
.end method

.method public getErrorMessage()Ljava/lang/String;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/almworks/sqlite4java/SQLiteException;
        }
    .end annotation

    .prologue
    .line 826
    invoke-virtual {p0}, Lcom/almworks/sqlite4java/SQLiteConnection;->checkThread()V

    .line 827
    invoke-direct {p0}, Lcom/almworks/sqlite4java/SQLiteConnection;->handle()Lcom/almworks/sqlite4java/SWIGTYPE_p_sqlite3;

    move-result-object v0

    invoke-static {v0}, Lcom/almworks/sqlite4java/_SQLiteSwigged;->sqlite3_errmsg(Lcom/almworks/sqlite4java/SWIGTYPE_p_sqlite3;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getLastInsertId()J
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/almworks/sqlite4java/SQLiteException;
        }
    .end annotation

    .prologue
    .line 758
    invoke-virtual {p0}, Lcom/almworks/sqlite4java/SQLiteConnection;->checkThread()V

    .line 759
    invoke-direct {p0}, Lcom/almworks/sqlite4java/SQLiteConnection;->handle()Lcom/almworks/sqlite4java/SWIGTYPE_p_sqlite3;

    move-result-object v2

    invoke-static {v2}, Lcom/almworks/sqlite4java/_SQLiteSwigged;->sqlite3_last_insert_rowid(Lcom/almworks/sqlite4java/SWIGTYPE_p_sqlite3;)J

    move-result-wide v0

    .line 760
    .local v0, "id":J
    return-wide v0
.end method

.method public getLimit(I)I
    .locals 2
    .param p1, "id"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/almworks/sqlite4java/SQLiteException;
        }
    .end annotation

    .prologue
    .line 251
    invoke-virtual {p0}, Lcom/almworks/sqlite4java/SQLiteConnection;->checkThread()V

    .line 252
    invoke-direct {p0}, Lcom/almworks/sqlite4java/SQLiteConnection;->handle()Lcom/almworks/sqlite4java/SWIGTYPE_p_sqlite3;

    move-result-object v0

    const/4 v1, -0x1

    invoke-static {v0, p1, v1}, Lcom/almworks/sqlite4java/_SQLiteSwigged;->sqlite3_limit(Lcom/almworks/sqlite4java/SWIGTYPE_p_sqlite3;II)I

    move-result v0

    return v0
.end method

.method public getOpenFlags()I
    .locals 2

    .prologue
    .line 410
    iget-object v1, p0, Lcom/almworks/sqlite4java/SQLiteConnection;->myLock:Ljava/lang/Object;

    monitor-enter v1

    .line 411
    :try_start_0
    iget v0, p0, Lcom/almworks/sqlite4java/SQLiteConnection;->myOpenFlags:I

    monitor-exit v1

    return v0

    .line 412
    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method getStatementCount()I
    .locals 2

    .prologue
    .line 1505
    iget-object v1, p0, Lcom/almworks/sqlite4java/SQLiteConnection;->myLock:Ljava/lang/Object;

    monitor-enter v1

    .line 1506
    :try_start_0
    iget-object v0, p0, Lcom/almworks/sqlite4java/SQLiteConnection;->myStatements:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    monitor-exit v1

    return v0

    .line 1507
    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method public getTableColumnMetadata(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lcom/almworks/sqlite4java/SQLiteColumnMetadata;
    .locals 2
    .param p1, "dbName"    # Ljava/lang/String;
    .param p2, "tableName"    # Ljava/lang/String;
    .param p3, "columnName"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/almworks/sqlite4java/SQLiteException;
        }
    .end annotation

    .prologue
    .line 516
    invoke-virtual {p0}, Lcom/almworks/sqlite4java/SQLiteConnection;->checkThread()V

    .line 517
    invoke-static {}, Lcom/almworks/sqlite4java/Internal;->isFineLogging()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 518
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "calling sqlite3_table_column_metadata ["

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ","

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ","

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "]"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {p0, v0}, Lcom/almworks/sqlite4java/Internal;->logFine(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 519
    :cond_0
    iget-object v0, p0, Lcom/almworks/sqlite4java/SQLiteConnection;->mySQLiteManual:Lcom/almworks/sqlite4java/_SQLiteManual;

    invoke-direct {p0}, Lcom/almworks/sqlite4java/SQLiteConnection;->handle()Lcom/almworks/sqlite4java/SWIGTYPE_p_sqlite3;

    move-result-object v1

    invoke-virtual {v0, v1, p1, p2, p3}, Lcom/almworks/sqlite4java/_SQLiteManual;->sqlite3_table_column_metadata(Lcom/almworks/sqlite4java/SWIGTYPE_p_sqlite3;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lcom/almworks/sqlite4java/SQLiteColumnMetadata;

    move-result-object v0

    return-object v0
.end method

.method public getTotalChanges()I
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/almworks/sqlite4java/SQLiteException;
        }
    .end annotation

    .prologue
    .line 785
    invoke-virtual {p0}, Lcom/almworks/sqlite4java/SQLiteConnection;->checkThread()V

    .line 786
    invoke-direct {p0}, Lcom/almworks/sqlite4java/SQLiteConnection;->handle()Lcom/almworks/sqlite4java/SWIGTYPE_p_sqlite3;

    move-result-object v0

    invoke-static {v0}, Lcom/almworks/sqlite4java/_SQLiteSwigged;->sqlite3_total_changes(Lcom/almworks/sqlite4java/SWIGTYPE_p_sqlite3;)I

    move-result v0

    return v0
.end method

.method public initializeBackup(Ljava/io/File;)Lcom/almworks/sqlite4java/SQLiteBackup;
    .locals 2
    .param p1, "destinationDbFile"    # Ljava/io/File;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/almworks/sqlite4java/SQLiteException;
        }
    .end annotation

    .prologue
    .line 1004
    const-string v0, "main"

    const/4 v1, 0x6

    invoke-virtual {p0, v0, p1, v1}, Lcom/almworks/sqlite4java/SQLiteConnection;->initializeBackup(Ljava/lang/String;Ljava/io/File;I)Lcom/almworks/sqlite4java/SQLiteBackup;

    move-result-object v0

    return-object v0
.end method

.method public initializeBackup(Ljava/lang/String;Ljava/io/File;I)Lcom/almworks/sqlite4java/SQLiteBackup;
    .locals 9
    .param p1, "sourceDbName"    # Ljava/lang/String;
    .param p2, "destinationDbFile"    # Ljava/io/File;
    .param p3, "flags"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/almworks/sqlite4java/SQLiteException;
        }
    .end annotation

    .prologue
    .line 969
    invoke-virtual {p0}, Lcom/almworks/sqlite4java/SQLiteConnection;->checkThread()V

    .line 970
    new-instance v0, Lcom/almworks/sqlite4java/SQLiteConnection;

    invoke-direct {v0, p2}, Lcom/almworks/sqlite4java/SQLiteConnection;-><init>(Ljava/io/File;)V

    invoke-virtual {v0, p3}, Lcom/almworks/sqlite4java/SQLiteConnection;->openV2(I)Lcom/almworks/sqlite4java/SQLiteConnection;

    move-result-object v5

    .line 971
    .local v5, "destination":Lcom/almworks/sqlite4java/SQLiteConnection;
    invoke-static {}, Lcom/almworks/sqlite4java/Internal;->isFineLogging()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 972
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "initializeBackup to "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {p0, v0}, Lcom/almworks/sqlite4java/Internal;->logFine(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 974
    :cond_0
    invoke-direct {p0}, Lcom/almworks/sqlite4java/SQLiteConnection;->handle()Lcom/almworks/sqlite4java/SWIGTYPE_p_sqlite3;

    move-result-object v8

    .line 975
    .local v8, "sourceDb":Lcom/almworks/sqlite4java/SWIGTYPE_p_sqlite3;
    invoke-direct {v5}, Lcom/almworks/sqlite4java/SQLiteConnection;->handle()Lcom/almworks/sqlite4java/SWIGTYPE_p_sqlite3;

    move-result-object v6

    .line 976
    .local v6, "destinationDb":Lcom/almworks/sqlite4java/SWIGTYPE_p_sqlite3;
    const-string v0, "main"

    invoke-static {v6, v0, v8, p1}, Lcom/almworks/sqlite4java/_SQLiteSwigged;->sqlite3_backup_init(Lcom/almworks/sqlite4java/SWIGTYPE_p_sqlite3;Ljava/lang/String;Lcom/almworks/sqlite4java/SWIGTYPE_p_sqlite3;Ljava/lang/String;)Lcom/almworks/sqlite4java/SWIGTYPE_p_sqlite3_backup;

    move-result-object v3

    .line 977
    .local v3, "backup":Lcom/almworks/sqlite4java/SWIGTYPE_p_sqlite3_backup;
    if-nez v3, :cond_1

    .line 979
    :try_start_0
    invoke-virtual {v5}, Lcom/almworks/sqlite4java/SQLiteConnection;->getErrorCode()I

    move-result v7

    .line 980
    .local v7, "errorCode":I
    const-string v0, "backup initialization"

    invoke-virtual {v5, v7, v0}, Lcom/almworks/sqlite4java/SQLiteConnection;->throwResult(ILjava/lang/String;)V

    .line 981
    new-instance v0, Lcom/almworks/sqlite4java/SQLiteException;

    const/16 v1, -0x63

    const-string v4, "backup failed to start but error code is 0"

    invoke-direct {v0, v1, v4}, Lcom/almworks/sqlite4java/SQLiteException;-><init>(ILjava/lang/String;)V

    throw v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 983
    .end local v7    # "errorCode":I
    :catchall_0
    move-exception v0

    invoke-virtual {v5}, Lcom/almworks/sqlite4java/SQLiteConnection;->dispose()V

    throw v0

    .line 986
    :cond_1
    iget-object v2, v5, Lcom/almworks/sqlite4java/SQLiteConnection;->myUncachedController:Lcom/almworks/sqlite4java/SQLiteController;

    .line 987
    .local v2, "destinationController":Lcom/almworks/sqlite4java/SQLiteController;
    new-instance v0, Lcom/almworks/sqlite4java/SQLiteBackup;

    iget-object v1, p0, Lcom/almworks/sqlite4java/SQLiteConnection;->myUncachedController:Lcom/almworks/sqlite4java/SQLiteController;

    move-object v4, p0

    invoke-direct/range {v0 .. v5}, Lcom/almworks/sqlite4java/SQLiteBackup;-><init>(Lcom/almworks/sqlite4java/SQLiteController;Lcom/almworks/sqlite4java/SQLiteController;Lcom/almworks/sqlite4java/SWIGTYPE_p_sqlite3_backup;Lcom/almworks/sqlite4java/SQLiteConnection;Lcom/almworks/sqlite4java/SQLiteConnection;)V

    return-object v0
.end method

.method public interrupt()V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/almworks/sqlite4java/SQLiteException;
        }
    .end annotation

    .prologue
    .line 801
    invoke-direct {p0}, Lcom/almworks/sqlite4java/SQLiteConnection;->handle()Lcom/almworks/sqlite4java/SWIGTYPE_p_sqlite3;

    move-result-object v0

    invoke-static {v0}, Lcom/almworks/sqlite4java/_SQLiteSwigged;->sqlite3_interrupt(Lcom/almworks/sqlite4java/SWIGTYPE_p_sqlite3;)V

    .line 802
    return-void
.end method

.method public isDisposed()Z
    .locals 2

    .prologue
    .line 348
    iget-object v1, p0, Lcom/almworks/sqlite4java/SQLiteConnection;->myLock:Ljava/lang/Object;

    monitor-enter v1

    .line 349
    :try_start_0
    iget-boolean v0, p0, Lcom/almworks/sqlite4java/SQLiteConnection;->myDisposed:Z

    monitor-exit v1

    return v0

    .line 350
    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method public isMemoryDatabase()Z
    .locals 1

    .prologue
    .line 207
    iget-object v0, p0, Lcom/almworks/sqlite4java/SQLiteConnection;->myFile:Ljava/io/File;

    if-nez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public isOpen()Z
    .locals 2

    .prologue
    .line 337
    iget-object v1, p0, Lcom/almworks/sqlite4java/SQLiteConnection;->myLock:Ljava/lang/Object;

    monitor-enter v1

    .line 338
    :try_start_0
    iget-object v0, p0, Lcom/almworks/sqlite4java/SQLiteConnection;->myHandle:Lcom/almworks/sqlite4java/SWIGTYPE_p_sqlite3;

    if-eqz v0, :cond_0

    iget-boolean v0, p0, Lcom/almworks/sqlite4java/SQLiteConnection;->myDisposed:Z

    if-nez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    monitor-exit v1

    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0

    .line 339
    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method public isReadOnly()Z
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/almworks/sqlite4java/SQLiteException;
        }
    .end annotation

    .prologue
    .line 401
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lcom/almworks/sqlite4java/SQLiteConnection;->isReadOnly(Ljava/lang/String;)Z

    move-result v0

    return v0
.end method

.method public isReadOnly(Ljava/lang/String;)Z
    .locals 4
    .param p1, "dbName"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/almworks/sqlite4java/SQLiteException;
        }
    .end annotation

    .prologue
    const/4 v1, 0x1

    .line 369
    invoke-virtual {p0}, Lcom/almworks/sqlite4java/SQLiteConnection;->checkThread()V

    .line 370
    invoke-static {}, Lcom/almworks/sqlite4java/Internal;->isFineLogging()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 371
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "calling sqlite3_db_readonly ["

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "]"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {p0, v2}, Lcom/almworks/sqlite4java/Internal;->logFine(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 373
    :cond_0
    invoke-direct {p0}, Lcom/almworks/sqlite4java/SQLiteConnection;->handle()Lcom/almworks/sqlite4java/SWIGTYPE_p_sqlite3;

    move-result-object v2

    invoke-static {v2, p1}, Lcom/almworks/sqlite4java/_SQLiteSwigged;->sqlite3_db_readonly(Lcom/almworks/sqlite4java/SWIGTYPE_p_sqlite3;Ljava/lang/String;)I

    move-result v0

    .line 375
    .local v0, "result":I
    const/4 v2, -0x1

    if-ne v0, v2, :cond_1

    .line 376
    new-instance v1, Lcom/almworks/sqlite4java/SQLiteException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " is not a valid database name"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v0, v2}, Lcom/almworks/sqlite4java/SQLiteException;-><init>(ILjava/lang/String;)V

    throw v1

    .line 378
    :cond_1
    sget-boolean v2, Lcom/almworks/sqlite4java/SQLiteConnection;->$assertionsDisabled:Z

    if-nez v2, :cond_2

    if-eqz v0, :cond_2

    if-eq v0, v1, :cond_2

    new-instance v1, Ljava/lang/AssertionError;

    invoke-direct {v1, v0}, Ljava/lang/AssertionError;-><init>(I)V

    throw v1

    .line 379
    :cond_2
    if-ne v0, v1, :cond_3

    :goto_0
    return v1

    :cond_3
    const/4 v1, 0x0

    goto :goto_0
.end method

.method public loadExtension(Ljava/io/File;)V
    .locals 1
    .param p1, "extensionFile"    # Ljava/io/File;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/almworks/sqlite4java/SQLiteException;
        }
    .end annotation

    .prologue
    .line 1057
    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0}, Lcom/almworks/sqlite4java/SQLiteConnection;->loadExtension(Ljava/io/File;Ljava/lang/String;)V

    .line 1058
    return-void
.end method

.method public loadExtension(Ljava/io/File;Ljava/lang/String;)V
    .locals 6
    .param p1, "extensionFile"    # Ljava/io/File;
    .param p2, "entryPoint"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/almworks/sqlite4java/SQLiteException;
        }
    .end annotation

    .prologue
    .line 1033
    invoke-virtual {p0}, Lcom/almworks/sqlite4java/SQLiteConnection;->checkThread()V

    .line 1034
    invoke-direct {p0}, Lcom/almworks/sqlite4java/SQLiteConnection;->handle()Lcom/almworks/sqlite4java/SWIGTYPE_p_sqlite3;

    move-result-object v1

    .line 1035
    .local v1, "handle":Lcom/almworks/sqlite4java/SWIGTYPE_p_sqlite3;
    invoke-virtual {p1}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v2

    .line 1036
    .local v2, "path":Ljava/lang/String;
    invoke-static {}, Lcom/almworks/sqlite4java/Internal;->isFineLogging()Z

    move-result v4

    if-eqz v4, :cond_0

    .line 1037
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "loading extension from ("

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, ","

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, ")"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {p0, v4}, Lcom/almworks/sqlite4java/Internal;->logFine(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 1039
    :cond_0
    iget-object v4, p0, Lcom/almworks/sqlite4java/SQLiteConnection;->mySQLiteManual:Lcom/almworks/sqlite4java/_SQLiteManual;

    invoke-virtual {v4, v1, v2, p2}, Lcom/almworks/sqlite4java/_SQLiteManual;->sqlite3_load_extension(Lcom/almworks/sqlite4java/SWIGTYPE_p_sqlite3;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 1040
    .local v0, "error":Ljava/lang/String;
    iget-object v4, p0, Lcom/almworks/sqlite4java/SQLiteConnection;->mySQLiteManual:Lcom/almworks/sqlite4java/_SQLiteManual;

    invoke-virtual {v4}, Lcom/almworks/sqlite4java/_SQLiteManual;->getLastReturnCode()I

    move-result v3

    .line 1041
    .local v3, "rc":I
    const-string v4, "loadExtension()"

    invoke-virtual {p0, v3, v4, v0}, Lcom/almworks/sqlite4java/SQLiteConnection;->throwResult(ILjava/lang/String;Ljava/lang/Object;)V

    .line 1042
    invoke-static {}, Lcom/almworks/sqlite4java/Internal;->isFineLogging()Z

    move-result v4

    if-eqz v4, :cond_1

    .line 1043
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "extension ("

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, ","

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, ") loaded"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {p0, v4}, Lcom/almworks/sqlite4java/Internal;->logFine(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 1045
    :cond_1
    return-void
.end method

.method public open()Lcom/almworks/sqlite4java/SQLiteConnection;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/almworks/sqlite4java/SQLiteException;
        }
    .end annotation

    .prologue
    .line 293
    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lcom/almworks/sqlite4java/SQLiteConnection;->open(Z)Lcom/almworks/sqlite4java/SQLiteConnection;

    move-result-object v0

    return-object v0
.end method

.method public open(Z)Lcom/almworks/sqlite4java/SQLiteConnection;
    .locals 4
    .param p1, "allowCreate"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/almworks/sqlite4java/SQLiteException;
        }
    .end annotation

    .prologue
    .line 274
    const/4 v0, 0x2

    .line 275
    .local v0, "flags":I
    if-nez p1, :cond_0

    .line 276
    invoke-virtual {p0}, Lcom/almworks/sqlite4java/SQLiteConnection;->isMemoryDatabase()Z

    move-result v1

    if-eqz v1, :cond_1

    .line 277
    new-instance v1, Lcom/almworks/sqlite4java/SQLiteException;

    const/16 v2, -0x63

    const-string v3, "cannot open memory database without creation"

    invoke-direct {v1, v2, v3}, Lcom/almworks/sqlite4java/SQLiteException;-><init>(ILjava/lang/String;)V

    throw v1

    .line 280
    :cond_0
    or-int/lit8 v0, v0, 0x4

    .line 282
    :cond_1
    invoke-direct {p0, v0}, Lcom/almworks/sqlite4java/SQLiteConnection;->open0(I)V

    .line 283
    return-object p0
.end method

.method public openReadonly()Lcom/almworks/sqlite4java/SQLiteConnection;
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/almworks/sqlite4java/SQLiteException;
        }
    .end annotation

    .prologue
    .line 304
    invoke-virtual {p0}, Lcom/almworks/sqlite4java/SQLiteConnection;->isMemoryDatabase()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 305
    new-instance v0, Lcom/almworks/sqlite4java/SQLiteException;

    const/16 v1, -0x63

    const-string v2, "cannot open memory database in read-only mode"

    invoke-direct {v0, v1, v2}, Lcom/almworks/sqlite4java/SQLiteException;-><init>(ILjava/lang/String;)V

    throw v0

    .line 307
    :cond_0
    const/4 v0, 0x1

    invoke-direct {p0, v0}, Lcom/almworks/sqlite4java/SQLiteConnection;->open0(I)V

    .line 308
    return-object p0
.end method

.method public openV2(I)Lcom/almworks/sqlite4java/SQLiteConnection;
    .locals 0
    .param p1, "flags"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/almworks/sqlite4java/SQLiteException;
        }
    .end annotation

    .prologue
    .line 327
    invoke-direct {p0, p1}, Lcom/almworks/sqlite4java/SQLiteConnection;->open0(I)V

    .line 328
    return-object p0
.end method

.method public prepare(Lcom/almworks/sqlite4java/SQLParts;)Lcom/almworks/sqlite4java/SQLiteStatement;
    .locals 1
    .param p1, "sql"    # Lcom/almworks/sqlite4java/SQLParts;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/almworks/sqlite4java/SQLiteException;
        }
    .end annotation

    .prologue
    .line 647
    const/4 v0, 0x1

    invoke-virtual {p0, p1, v0}, Lcom/almworks/sqlite4java/SQLiteConnection;->prepare(Lcom/almworks/sqlite4java/SQLParts;Z)Lcom/almworks/sqlite4java/SQLiteStatement;

    move-result-object v0

    return-object v0
.end method

.method public prepare(Lcom/almworks/sqlite4java/SQLParts;Z)Lcom/almworks/sqlite4java/SQLiteStatement;
    .locals 17
    .param p1, "sql"    # Lcom/almworks/sqlite4java/SQLParts;
    .param p2, "cached"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/almworks/sqlite4java/SQLiteException;
        }
    .end annotation

    .prologue
    .line 544
    invoke-virtual/range {p0 .. p0}, Lcom/almworks/sqlite4java/SQLiteConnection;->checkThread()V

    .line 545
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/almworks/sqlite4java/SQLiteConnection;->myProfiler:Lcom/almworks/sqlite4java/SQLiteProfiler;

    .line 546
    .local v2, "profiler":Lcom/almworks/sqlite4java/SQLiteProfiler;
    invoke-static {}, Lcom/almworks/sqlite4java/Internal;->isFineLogging()Z

    move-result v6

    if-eqz v6, :cond_0

    .line 547
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "prepare ["

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    move-object/from16 v0, p1

    invoke-virtual {v6, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, "]"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    move-object/from16 v0, p0

    invoke-static {v0, v6}, Lcom/almworks/sqlite4java/Internal;->logFine(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 548
    :cond_0
    if-nez p1, :cond_1

    .line 549
    new-instance v6, Ljava/lang/IllegalArgumentException;

    invoke-direct {v6}, Ljava/lang/IllegalArgumentException;-><init>()V

    throw v6

    .line 551
    :cond_1
    const/4 v15, 0x0

    .line 552
    .local v15, "stmt":Lcom/almworks/sqlite4java/SWIGTYPE_p_sqlite3_stmt;
    const/4 v11, 0x0

    .line 554
    .local v11, "fixedKey":Lcom/almworks/sqlite4java/SQLParts;
    move-object/from16 v0, p0

    iget-object v7, v0, Lcom/almworks/sqlite4java/SQLiteConnection;->myLock:Ljava/lang/Object;

    monitor-enter v7

    .line 555
    if-eqz p2, :cond_4

    .line 557
    :try_start_0
    move-object/from16 v0, p0

    iget-object v6, v0, Lcom/almworks/sqlite4java/SQLiteConnection;->myStatementCache:Ljavolution/util/stripped/FastMap;

    move-object/from16 v0, p1

    invoke-virtual {v6, v0}, Ljavolution/util/stripped/FastMap;->getEntry(Ljava/lang/Object;)Ljavolution/util/stripped/FastMap$Entry;

    move-result-object v10

    .line 558
    .local v10, "e":Ljavolution/util/stripped/FastMap$Entry;, "Ljavolution/util/stripped/FastMap$Entry<Lcom/almworks/sqlite4java/SQLParts;Lcom/almworks/sqlite4java/SWIGTYPE_p_sqlite3_stmt;>;"
    if-eqz v10, :cond_4

    .line 559
    invoke-virtual {v10}, Ljavolution/util/stripped/FastMap$Entry;->getKey()Ljava/lang/Object;

    move-result-object v6

    move-object v0, v6

    check-cast v0, Lcom/almworks/sqlite4java/SQLParts;

    move-object v11, v0

    .line 560
    sget-boolean v6, Lcom/almworks/sqlite4java/SQLiteConnection;->$assertionsDisabled:Z

    if-nez v6, :cond_2

    if-nez v11, :cond_2

    new-instance v6, Ljava/lang/AssertionError;

    invoke-direct {v6}, Ljava/lang/AssertionError;-><init>()V

    throw v6

    .line 569
    .end local v10    # "e":Ljavolution/util/stripped/FastMap$Entry;, "Ljavolution/util/stripped/FastMap$Entry<Lcom/almworks/sqlite4java/SQLParts;Lcom/almworks/sqlite4java/SWIGTYPE_p_sqlite3_stmt;>;"
    :catchall_0
    move-exception v6

    monitor-exit v7
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v6

    .line 561
    .restart local v10    # "e":Ljavolution/util/stripped/FastMap$Entry;, "Ljavolution/util/stripped/FastMap$Entry<Lcom/almworks/sqlite4java/SQLParts;Lcom/almworks/sqlite4java/SWIGTYPE_p_sqlite3_stmt;>;"
    :cond_2
    :try_start_1
    sget-boolean v6, Lcom/almworks/sqlite4java/SQLiteConnection;->$assertionsDisabled:Z

    if-nez v6, :cond_3

    invoke-virtual {v11}, Lcom/almworks/sqlite4java/SQLParts;->isFixed()Z

    move-result v6

    if-nez v6, :cond_3

    new-instance v6, Ljava/lang/AssertionError;

    move-object/from16 v0, p1

    invoke-direct {v6, v0}, Ljava/lang/AssertionError;-><init>(Ljava/lang/Object;)V

    throw v6

    .line 562
    :cond_3
    invoke-virtual {v10}, Ljavolution/util/stripped/FastMap$Entry;->getValue()Ljava/lang/Object;

    move-result-object v6

    move-object v0, v6

    check-cast v0, Lcom/almworks/sqlite4java/SWIGTYPE_p_sqlite3_stmt;

    move-object v15, v0

    .line 563
    if-eqz v15, :cond_4

    .line 564
    const/4 v6, 0x0

    invoke-virtual {v10, v6}, Ljavolution/util/stripped/FastMap$Entry;->setValue(Ljava/lang/Object;)Ljava/lang/Object;

    .line 568
    .end local v10    # "e":Ljavolution/util/stripped/FastMap$Entry;, "Ljavolution/util/stripped/FastMap$Entry<Lcom/almworks/sqlite4java/SQLParts;Lcom/almworks/sqlite4java/SWIGTYPE_p_sqlite3_stmt;>;"
    :cond_4
    invoke-direct/range {p0 .. p0}, Lcom/almworks/sqlite4java/SQLiteConnection;->handle()Lcom/almworks/sqlite4java/SWIGTYPE_p_sqlite3;

    move-result-object v12

    .line 569
    .local v12, "handle":Lcom/almworks/sqlite4java/SWIGTYPE_p_sqlite3;
    monitor-exit v7
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 570
    if-nez v15, :cond_9

    .line 571
    invoke-static {}, Lcom/almworks/sqlite4java/Internal;->isFineLogging()Z

    move-result v6

    if-eqz v6, :cond_5

    .line 572
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "calling sqlite3_prepare_v2 for ["

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    move-object/from16 v0, p1

    invoke-virtual {v6, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, "]"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    move-object/from16 v0, p0

    invoke-static {v0, v6}, Lcom/almworks/sqlite4java/Internal;->logFine(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 573
    :cond_5
    if-nez v2, :cond_6

    const-wide/16 v4, 0x0

    .line 574
    .local v4, "from":J
    :goto_0
    invoke-virtual/range {p1 .. p1}, Lcom/almworks/sqlite4java/SQLParts;->toString()Ljava/lang/String;

    move-result-object v3

    .line 575
    .local v3, "sqlString":Ljava/lang/String;
    invoke-virtual {v3}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/String;->length()I

    move-result v6

    if-nez v6, :cond_7

    .line 576
    new-instance v6, Lcom/almworks/sqlite4java/SQLiteException;

    const/16 v7, -0x3e7

    const-string v16, "empty SQL"

    move-object/from16 v0, v16

    invoke-direct {v6, v7, v0}, Lcom/almworks/sqlite4java/SQLiteException;-><init>(ILjava/lang/String;)V

    throw v6

    .line 573
    .end local v3    # "sqlString":Ljava/lang/String;
    .end local v4    # "from":J
    :cond_6
    invoke-static {}, Ljava/lang/System;->nanoTime()J

    move-result-wide v4

    goto :goto_0

    .line 577
    .restart local v3    # "sqlString":Ljava/lang/String;
    .restart local v4    # "from":J
    :cond_7
    move-object/from16 v0, p0

    iget-object v6, v0, Lcom/almworks/sqlite4java/SQLiteConnection;->mySQLiteManual:Lcom/almworks/sqlite4java/_SQLiteManual;

    invoke-virtual {v6, v12, v3}, Lcom/almworks/sqlite4java/_SQLiteManual;->sqlite3_prepare_v2(Lcom/almworks/sqlite4java/SWIGTYPE_p_sqlite3;Ljava/lang/String;)Lcom/almworks/sqlite4java/SWIGTYPE_p_sqlite3_stmt;

    move-result-object v15

    .line 578
    move-object/from16 v0, p0

    iget-object v6, v0, Lcom/almworks/sqlite4java/SQLiteConnection;->mySQLiteManual:Lcom/almworks/sqlite4java/_SQLiteManual;

    invoke-virtual {v6}, Lcom/almworks/sqlite4java/_SQLiteManual;->getLastReturnCode()I

    move-result v8

    .line 579
    .local v8, "rc":I
    if-eqz v2, :cond_8

    invoke-static {}, Ljava/lang/System;->nanoTime()J

    move-result-wide v6

    invoke-virtual/range {v2 .. v8}, Lcom/almworks/sqlite4java/SQLiteProfiler;->reportPrepare(Ljava/lang/String;JJI)V

    .line 580
    :cond_8
    const-string v6, "prepare()"

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    invoke-virtual {v0, v8, v6, v1}, Lcom/almworks/sqlite4java/SQLiteConnection;->throwResult(ILjava/lang/String;Ljava/lang/Object;)V

    .line 581
    if-nez v15, :cond_a

    .line 582
    new-instance v6, Lcom/almworks/sqlite4java/SQLiteException;

    const/16 v7, -0x63

    const-string v16, "sqlite did not return stmt"

    move-object/from16 v0, v16

    invoke-direct {v6, v7, v0}, Lcom/almworks/sqlite4java/SQLiteException;-><init>(ILjava/lang/String;)V

    throw v6

    .line 584
    .end local v3    # "sqlString":Ljava/lang/String;
    .end local v4    # "from":J
    .end local v8    # "rc":I
    :cond_9
    invoke-static {}, Lcom/almworks/sqlite4java/Internal;->isFineLogging()Z

    move-result v6

    if-eqz v6, :cond_a

    .line 585
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "using cached stmt for ["

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    move-object/from16 v0, p1

    invoke-virtual {v6, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, "]"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    move-object/from16 v0, p0

    invoke-static {v0, v6}, Lcom/almworks/sqlite4java/Internal;->logFine(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 587
    :cond_a
    const/4 v13, 0x0

    .line 588
    .local v13, "statement":Lcom/almworks/sqlite4java/SQLiteStatement;
    move-object/from16 v0, p0

    iget-object v7, v0, Lcom/almworks/sqlite4java/SQLiteConnection;->myLock:Ljava/lang/Object;

    monitor-enter v7

    .line 591
    :try_start_2
    move-object/from16 v0, p0

    iget-object v6, v0, Lcom/almworks/sqlite4java/SQLiteConnection;->myHandle:Lcom/almworks/sqlite4java/SWIGTYPE_p_sqlite3;

    if-eqz v6, :cond_d

    .line 592
    if-eqz p2, :cond_c

    move-object/from16 v0, p0

    iget-object v9, v0, Lcom/almworks/sqlite4java/SQLiteConnection;->myCachedController:Lcom/almworks/sqlite4java/SQLiteController;

    .line 593
    .local v9, "controller":Lcom/almworks/sqlite4java/SQLiteController;
    :goto_1
    if-nez v11, :cond_b

    .line 594
    invoke-virtual/range {p1 .. p1}, Lcom/almworks/sqlite4java/SQLParts;->getFixedParts()Lcom/almworks/sqlite4java/SQLParts;

    move-result-object v11

    .line 595
    :cond_b
    new-instance v14, Lcom/almworks/sqlite4java/SQLiteStatement;

    move-object/from16 v0, p0

    iget-object v6, v0, Lcom/almworks/sqlite4java/SQLiteConnection;->myProfiler:Lcom/almworks/sqlite4java/SQLiteProfiler;

    invoke-direct {v14, v9, v15, v11, v6}, Lcom/almworks/sqlite4java/SQLiteStatement;-><init>(Lcom/almworks/sqlite4java/SQLiteController;Lcom/almworks/sqlite4java/SWIGTYPE_p_sqlite3_stmt;Lcom/almworks/sqlite4java/SQLParts;Lcom/almworks/sqlite4java/SQLiteProfiler;)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    .line 596
    .end local v13    # "statement":Lcom/almworks/sqlite4java/SQLiteStatement;
    .local v14, "statement":Lcom/almworks/sqlite4java/SQLiteStatement;
    :try_start_3
    move-object/from16 v0, p0

    iget-object v6, v0, Lcom/almworks/sqlite4java/SQLiteConnection;->myStatements:Ljava/util/ArrayList;

    invoke-virtual {v6, v14}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_2

    move-object v13, v14

    .line 600
    .end local v9    # "controller":Lcom/almworks/sqlite4java/SQLiteController;
    .end local v14    # "statement":Lcom/almworks/sqlite4java/SQLiteStatement;
    .restart local v13    # "statement":Lcom/almworks/sqlite4java/SQLiteStatement;
    :goto_2
    :try_start_4
    monitor-exit v7
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_1

    .line 601
    if-nez v13, :cond_e

    .line 604
    :try_start_5
    invoke-static {v15}, Lcom/almworks/sqlite4java/_SQLiteSwigged;->sqlite3_finalize(Lcom/almworks/sqlite4java/SWIGTYPE_p_sqlite3_stmt;)I

    move-result v6

    const-string v7, "finalize() in prepare()"

    move-object/from16 v0, p0

    invoke-virtual {v0, v6, v7}, Lcom/almworks/sqlite4java/SQLiteConnection;->throwResult(ILjava/lang/String;)V
    :try_end_5
    .catch Ljava/lang/Exception; {:try_start_5 .. :try_end_5} :catch_0

    .line 608
    :goto_3
    new-instance v6, Lcom/almworks/sqlite4java/SQLiteException;

    const/16 v7, -0x61

    const-string v16, "connection disposed"

    move-object/from16 v0, v16

    invoke-direct {v6, v7, v0}, Lcom/almworks/sqlite4java/SQLiteException;-><init>(ILjava/lang/String;)V

    throw v6

    .line 592
    :cond_c
    :try_start_6
    move-object/from16 v0, p0

    iget-object v9, v0, Lcom/almworks/sqlite4java/SQLiteConnection;->myUncachedController:Lcom/almworks/sqlite4java/SQLiteController;

    goto :goto_1

    .line 598
    :cond_d
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v16, "connection disposed while preparing statement for ["

    move-object/from16 v0, v16

    invoke-virtual {v6, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    move-object/from16 v0, p1

    invoke-virtual {v6, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v16, "]"

    move-object/from16 v0, v16

    invoke-virtual {v6, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    move-object/from16 v0, p0

    invoke-static {v0, v6}, Lcom/almworks/sqlite4java/Internal;->logWarn(Ljava/lang/Object;Ljava/lang/Object;)V

    goto :goto_2

    .line 600
    :catchall_1
    move-exception v6

    :goto_4
    monitor-exit v7
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_1

    throw v6

    .line 610
    :cond_e
    return-object v13

    .line 605
    :catch_0
    move-exception v6

    goto :goto_3

    .line 600
    .end local v13    # "statement":Lcom/almworks/sqlite4java/SQLiteStatement;
    .restart local v9    # "controller":Lcom/almworks/sqlite4java/SQLiteController;
    .restart local v14    # "statement":Lcom/almworks/sqlite4java/SQLiteStatement;
    :catchall_2
    move-exception v6

    move-object v13, v14

    .end local v14    # "statement":Lcom/almworks/sqlite4java/SQLiteStatement;
    .restart local v13    # "statement":Lcom/almworks/sqlite4java/SQLiteStatement;
    goto :goto_4
.end method

.method public prepare(Ljava/lang/String;)Lcom/almworks/sqlite4java/SQLiteStatement;
    .locals 1
    .param p1, "sql"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/almworks/sqlite4java/SQLiteException;
        }
    .end annotation

    .prologue
    .line 622
    const/4 v0, 0x1

    invoke-virtual {p0, p1, v0}, Lcom/almworks/sqlite4java/SQLiteConnection;->prepare(Ljava/lang/String;Z)Lcom/almworks/sqlite4java/SQLiteStatement;

    move-result-object v0

    return-object v0
.end method

.method public prepare(Ljava/lang/String;Z)Lcom/almworks/sqlite4java/SQLiteStatement;
    .locals 1
    .param p1, "sql"    # Ljava/lang/String;
    .param p2, "cached"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/almworks/sqlite4java/SQLiteException;
        }
    .end annotation

    .prologue
    .line 635
    new-instance v0, Lcom/almworks/sqlite4java/SQLParts;

    invoke-direct {v0, p1}, Lcom/almworks/sqlite4java/SQLParts;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0, v0, p2}, Lcom/almworks/sqlite4java/SQLiteConnection;->prepare(Lcom/almworks/sqlite4java/SQLParts;Z)Lcom/almworks/sqlite4java/SQLiteStatement;

    move-result-object v0

    return-object v0
.end method

.method public profile()Lcom/almworks/sqlite4java/SQLiteProfiler;
    .locals 1

    .prologue
    .line 844
    iget-object v0, p0, Lcom/almworks/sqlite4java/SQLiteConnection;->myProfiler:Lcom/almworks/sqlite4java/SQLiteProfiler;

    .line 845
    .local v0, "profiler":Lcom/almworks/sqlite4java/SQLiteProfiler;
    if-nez v0, :cond_0

    .line 846
    new-instance v0, Lcom/almworks/sqlite4java/SQLiteProfiler;

    .end local v0    # "profiler":Lcom/almworks/sqlite4java/SQLiteProfiler;
    invoke-direct {v0}, Lcom/almworks/sqlite4java/SQLiteProfiler;-><init>()V

    .restart local v0    # "profiler":Lcom/almworks/sqlite4java/SQLiteProfiler;
    iput-object v0, p0, Lcom/almworks/sqlite4java/SQLiteConnection;->myProfiler:Lcom/almworks/sqlite4java/SQLiteProfiler;

    .line 847
    :cond_0
    return-object v0
.end method

.method public setBusyTimeout(J)Lcom/almworks/sqlite4java/SQLiteConnection;
    .locals 3
    .param p1, "millis"    # J
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/almworks/sqlite4java/SQLiteException;
        }
    .end annotation

    .prologue
    .line 726
    invoke-virtual {p0}, Lcom/almworks/sqlite4java/SQLiteConnection;->checkThread()V

    .line 727
    invoke-direct {p0}, Lcom/almworks/sqlite4java/SQLiteConnection;->handle()Lcom/almworks/sqlite4java/SWIGTYPE_p_sqlite3;

    move-result-object v1

    long-to-int v2, p1

    invoke-static {v1, v2}, Lcom/almworks/sqlite4java/_SQLiteSwigged;->sqlite3_busy_timeout(Lcom/almworks/sqlite4java/SWIGTYPE_p_sqlite3;I)I

    move-result v0

    .line 728
    .local v0, "rc":I
    const-string v1, "setBusyTimeout"

    invoke-virtual {p0, v0, v1}, Lcom/almworks/sqlite4java/SQLiteConnection;->throwResult(ILjava/lang/String;)V

    .line 729
    return-object p0
.end method

.method public setExtensionLoadingEnabled(Z)V
    .locals 3
    .param p1, "enabled"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/almworks/sqlite4java/SQLiteException;
        }
    .end annotation

    .prologue
    .line 1015
    invoke-virtual {p0}, Lcom/almworks/sqlite4java/SQLiteConnection;->checkThread()V

    .line 1016
    invoke-direct {p0}, Lcom/almworks/sqlite4java/SQLiteConnection;->handle()Lcom/almworks/sqlite4java/SWIGTYPE_p_sqlite3;

    move-result-object v2

    if-eqz p1, :cond_1

    const/4 v1, 0x1

    :goto_0
    invoke-static {v2, v1}, Lcom/almworks/sqlite4java/_SQLiteSwigged;->sqlite3_enable_load_extension(Lcom/almworks/sqlite4java/SWIGTYPE_p_sqlite3;I)I

    move-result v0

    .line 1017
    .local v0, "rc":I
    const-string v1, "enableLoadExtension()"

    invoke-virtual {p0, v0, v1}, Lcom/almworks/sqlite4java/SQLiteConnection;->throwResult(ILjava/lang/String;)V

    .line 1018
    invoke-static {}, Lcom/almworks/sqlite4java/Internal;->isFineLogging()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 1019
    if-eqz p1, :cond_2

    const-string v1, "Extension load enabled"

    :goto_1
    invoke-static {p0, v1}, Lcom/almworks/sqlite4java/Internal;->logFine(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 1021
    :cond_0
    return-void

    .line 1016
    .end local v0    # "rc":I
    :cond_1
    const/4 v1, 0x0

    goto :goto_0

    .line 1019
    .restart local v0    # "rc":I
    :cond_2
    const-string v1, "Extension load disabled"

    goto :goto_1
.end method

.method public setLimit(II)I
    .locals 1
    .param p1, "id"    # I
    .param p2, "newVal"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/almworks/sqlite4java/SQLiteException;
        }
    .end annotation

    .prologue
    .line 238
    invoke-virtual {p0}, Lcom/almworks/sqlite4java/SQLiteConnection;->checkThread()V

    .line 239
    invoke-direct {p0}, Lcom/almworks/sqlite4java/SQLiteConnection;->handle()Lcom/almworks/sqlite4java/SWIGTYPE_p_sqlite3;

    move-result-object v0

    invoke-static {v0, p1, p2}, Lcom/almworks/sqlite4java/_SQLiteSwigged;->sqlite3_limit(Lcom/almworks/sqlite4java/SWIGTYPE_p_sqlite3;II)I

    move-result v0

    return v0
.end method

.method public setStepsPerCallback(I)V
    .locals 0
    .param p1, "stepsPerCallback"    # I

    .prologue
    .line 223
    if-lez p1, :cond_0

    .line 224
    iput p1, p0, Lcom/almworks/sqlite4java/SQLiteConnection;->myStepsPerCallback:I

    .line 226
    :cond_0
    return-void
.end method

.method public stopProfiling()Lcom/almworks/sqlite4java/SQLiteProfiler;
    .locals 2

    .prologue
    .line 860
    iget-object v0, p0, Lcom/almworks/sqlite4java/SQLiteConnection;->myProfiler:Lcom/almworks/sqlite4java/SQLiteProfiler;

    .line 861
    .local v0, "profiler":Lcom/almworks/sqlite4java/SQLiteProfiler;
    const/4 v1, 0x0

    iput-object v1, p0, Lcom/almworks/sqlite4java/SQLiteConnection;->myProfiler:Lcom/almworks/sqlite4java/SQLiteProfiler;

    .line 862
    return-object v0
.end method

.method throwResult(ILjava/lang/String;)V
    .locals 1
    .param p1, "resultCode"    # I
    .param p2, "operation"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/almworks/sqlite4java/SQLiteException;
        }
    .end annotation

    .prologue
    .line 1409
    const/4 v0, 0x0

    invoke-virtual {p0, p1, p2, v0}, Lcom/almworks/sqlite4java/SQLiteConnection;->throwResult(ILjava/lang/String;Ljava/lang/Object;)V

    .line 1410
    return-void
.end method

.method throwResult(ILjava/lang/String;Ljava/lang/Object;)V
    .locals 7
    .param p1, "resultCode"    # I
    .param p2, "operation"    # Ljava/lang/String;
    .param p3, "additional"    # Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/almworks/sqlite4java/SQLiteException;
        }
    .end annotation

    .prologue
    .line 1413
    if-nez p1, :cond_0

    return-void

    .line 1416
    :cond_0
    iget-object v3, p0, Lcom/almworks/sqlite4java/SQLiteConnection;->myHandle:Lcom/almworks/sqlite4java/SWIGTYPE_p_sqlite3;

    .line 1417
    .local v3, "handle":Lcom/almworks/sqlite4java/SWIGTYPE_p_sqlite3;
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v5, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, " "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    .line 1418
    .local v4, "message":Ljava/lang/String;
    if-nez p3, :cond_5

    const/4 v0, 0x0

    .line 1419
    .local v0, "additionalMessage":Ljava/lang/String;
    :goto_0
    if-eqz v0, :cond_1

    .line 1420
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v5, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, " "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    .line 1421
    :cond_1
    if-eqz v3, :cond_3

    .line 1423
    :try_start_0
    invoke-static {v3}, Lcom/almworks/sqlite4java/_SQLiteSwigged;->sqlite3_errmsg(Lcom/almworks/sqlite4java/SWIGTYPE_p_sqlite3;)Ljava/lang/String;

    move-result-object v2

    .line 1424
    .local v2, "errmsg":Ljava/lang/String;
    if-eqz v0, :cond_2

    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-nez v5, :cond_3

    .line 1425
    :cond_2
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v5, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, " ["

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, "]"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v4

    .line 1431
    .end local v2    # "errmsg":Ljava/lang/String;
    :cond_3
    :goto_1
    const/4 v5, 0x5

    if-eq p1, v5, :cond_4

    const/16 v5, 0xb0a

    if-ne p1, v5, :cond_6

    .line 1432
    :cond_4
    new-instance v5, Lcom/almworks/sqlite4java/SQLiteBusyException;

    invoke-direct {v5, p1, v4}, Lcom/almworks/sqlite4java/SQLiteBusyException;-><init>(ILjava/lang/String;)V

    throw v5

    .line 1418
    .end local v0    # "additionalMessage":Ljava/lang/String;
    :cond_5
    invoke-static {p3}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    goto :goto_0

    .line 1427
    .restart local v0    # "additionalMessage":Ljava/lang/String;
    :catch_0
    move-exception v1

    .line 1428
    .local v1, "e":Ljava/lang/Exception;
    sget-object v5, Ljava/util/logging/Level;->WARNING:Ljava/util/logging/Level;

    const-string v6, "cannot get sqlite3_errmsg"

    invoke-static {v5, p0, v6, v1}, Lcom/almworks/sqlite4java/Internal;->log(Ljava/util/logging/Level;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Throwable;)V

    goto :goto_1

    .line 1433
    .end local v1    # "e":Ljava/lang/Exception;
    :cond_6
    const/16 v5, 0x9

    if-ne p1, v5, :cond_7

    .line 1434
    new-instance v5, Lcom/almworks/sqlite4java/SQLiteInterruptedException;

    invoke-direct {v5, p1, v4}, Lcom/almworks/sqlite4java/SQLiteInterruptedException;-><init>(ILjava/lang/String;)V

    throw v5

    .line 1436
    :cond_7
    new-instance v5, Lcom/almworks/sqlite4java/SQLiteException;

    invoke-direct {v5, p1, v4}, Lcom/almworks/sqlite4java/SQLiteException;-><init>(ILjava/lang/String;)V

    throw v5
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .prologue
    .line 1523
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "DB["

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v1, p0, Lcom/almworks/sqlite4java/SQLiteConnection;->myNumber:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "]"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
