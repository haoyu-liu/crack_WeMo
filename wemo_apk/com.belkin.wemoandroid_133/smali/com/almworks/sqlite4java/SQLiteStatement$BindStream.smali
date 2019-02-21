.class final Lcom/almworks/sqlite4java/SQLiteStatement$BindStream;
.super Ljava/io/OutputStream;
.source "SQLiteStatement.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/almworks/sqlite4java/SQLiteStatement;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x12
    name = "BindStream"
.end annotation


# static fields
.field static final synthetic $assertionsDisabled:Z


# instance fields
.field private myBuffer:Lcom/almworks/sqlite4java/DirectBuffer;

.field private final myIndex:I

.field final synthetic this$0:Lcom/almworks/sqlite4java/SQLiteStatement;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 1424
    const-class v0, Lcom/almworks/sqlite4java/SQLiteStatement;

    invoke-virtual {v0}, Ljava/lang/Class;->desiredAssertionStatus()Z

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    sput-boolean v0, Lcom/almworks/sqlite4java/SQLiteStatement$BindStream;->$assertionsDisabled:Z

    return-void

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public constructor <init>(Lcom/almworks/sqlite4java/SQLiteStatement;ILcom/almworks/sqlite4java/DirectBuffer;)V
    .locals 1
    .param p2, "index"    # I
    .param p3, "buffer"    # Lcom/almworks/sqlite4java/DirectBuffer;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 1428
    iput-object p1, p0, Lcom/almworks/sqlite4java/SQLiteStatement$BindStream;->this$0:Lcom/almworks/sqlite4java/SQLiteStatement;

    invoke-direct {p0}, Ljava/io/OutputStream;-><init>()V

    .line 1429
    iput p2, p0, Lcom/almworks/sqlite4java/SQLiteStatement$BindStream;->myIndex:I

    .line 1430
    iput-object p3, p0, Lcom/almworks/sqlite4java/SQLiteStatement$BindStream;->myBuffer:Lcom/almworks/sqlite4java/DirectBuffer;

    .line 1431
    iget-object v0, p0, Lcom/almworks/sqlite4java/SQLiteStatement$BindStream;->myBuffer:Lcom/almworks/sqlite4java/DirectBuffer;

    invoke-virtual {v0}, Lcom/almworks/sqlite4java/DirectBuffer;->data()Ljava/nio/ByteBuffer;

    move-result-object v0

    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->clear()Ljava/nio/Buffer;

    .line 1432
    return-void
.end method

.method private buffer(I)Ljava/nio/ByteBuffer;
    .locals 7
    .param p1, "len"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lcom/almworks/sqlite4java/SQLiteException;
        }
    .end annotation

    .prologue
    .line 1457
    invoke-direct {p0}, Lcom/almworks/sqlite4java/SQLiteStatement$BindStream;->getBuffer()Lcom/almworks/sqlite4java/DirectBuffer;

    move-result-object v0

    .line 1458
    .local v0, "buffer":Lcom/almworks/sqlite4java/DirectBuffer;
    invoke-virtual {v0}, Lcom/almworks/sqlite4java/DirectBuffer;->data()Ljava/nio/ByteBuffer;

    move-result-object v1

    .line 1459
    .local v1, "data":Ljava/nio/ByteBuffer;
    invoke-virtual {v1}, Ljava/nio/ByteBuffer;->remaining()I

    move-result v5

    if-ge v5, p1, :cond_0

    .line 1460
    const/4 v3, 0x0

    .line 1462
    .local v3, "newBuffer":Lcom/almworks/sqlite4java/DirectBuffer;
    :try_start_0
    iget-object v5, p0, Lcom/almworks/sqlite4java/SQLiteStatement$BindStream;->this$0:Lcom/almworks/sqlite4java/SQLiteStatement;

    invoke-static {v5}, Lcom/almworks/sqlite4java/SQLiteStatement;->access$000(Lcom/almworks/sqlite4java/SQLiteStatement;)Lcom/almworks/sqlite4java/SQLiteController;

    move-result-object v5

    invoke-virtual {v0}, Lcom/almworks/sqlite4java/DirectBuffer;->getCapacity()I

    move-result v6

    add-int/2addr v6, p1

    invoke-virtual {v5, v6}, Lcom/almworks/sqlite4java/SQLiteController;->allocateBuffer(I)Lcom/almworks/sqlite4java/DirectBuffer;
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v3

    .line 1467
    invoke-virtual {v3}, Lcom/almworks/sqlite4java/DirectBuffer;->data()Ljava/nio/ByteBuffer;

    move-result-object v4

    .line 1468
    .local v4, "newData":Ljava/nio/ByteBuffer;
    invoke-virtual {v1}, Ljava/nio/ByteBuffer;->flip()Ljava/nio/Buffer;

    .line 1469
    invoke-virtual {v4, v1}, Ljava/nio/ByteBuffer;->put(Ljava/nio/ByteBuffer;)Ljava/nio/ByteBuffer;

    .line 1470
    iget-object v5, p0, Lcom/almworks/sqlite4java/SQLiteStatement$BindStream;->this$0:Lcom/almworks/sqlite4java/SQLiteStatement;

    invoke-static {v5}, Lcom/almworks/sqlite4java/SQLiteStatement;->access$000(Lcom/almworks/sqlite4java/SQLiteStatement;)Lcom/almworks/sqlite4java/SQLiteController;

    move-result-object v5

    invoke-virtual {v5, v0}, Lcom/almworks/sqlite4java/SQLiteController;->freeBuffer(Lcom/almworks/sqlite4java/DirectBuffer;)V

    .line 1471
    move-object v1, v4

    .line 1472
    iput-object v3, p0, Lcom/almworks/sqlite4java/SQLiteStatement$BindStream;->myBuffer:Lcom/almworks/sqlite4java/DirectBuffer;

    .line 1473
    sget-boolean v5, Lcom/almworks/sqlite4java/SQLiteStatement$BindStream;->$assertionsDisabled:Z

    if-nez v5, :cond_0

    invoke-virtual {v1}, Ljava/nio/ByteBuffer;->remaining()I

    move-result v5

    if-ge v5, p1, :cond_0

    new-instance v5, Ljava/lang/AssertionError;

    invoke-virtual {v1}, Ljava/nio/ByteBuffer;->capacity()I

    move-result v6

    invoke-direct {v5, v6}, Ljava/lang/AssertionError;-><init>(I)V

    throw v5

    .line 1463
    .end local v4    # "newData":Ljava/nio/ByteBuffer;
    :catch_0
    move-exception v2

    .line 1464
    .local v2, "e":Ljava/io/IOException;
    invoke-virtual {p0}, Lcom/almworks/sqlite4java/SQLiteStatement$BindStream;->dispose()V

    .line 1465
    throw v2

    .line 1475
    .end local v2    # "e":Ljava/io/IOException;
    .end local v3    # "newBuffer":Lcom/almworks/sqlite4java/DirectBuffer;
    :cond_0
    return-object v1
.end method

.method private getBuffer()Lcom/almworks/sqlite4java/DirectBuffer;
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 1499
    iget-object v0, p0, Lcom/almworks/sqlite4java/SQLiteStatement$BindStream;->myBuffer:Lcom/almworks/sqlite4java/DirectBuffer;

    .line 1500
    .local v0, "buffer":Lcom/almworks/sqlite4java/DirectBuffer;
    if-nez v0, :cond_0

    .line 1501
    new-instance v1, Ljava/io/IOException;

    const-string v2, "stream discarded"

    invoke-direct {v1, v2}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 1502
    :cond_0
    invoke-virtual {v0}, Lcom/almworks/sqlite4java/DirectBuffer;->isValid()Z

    move-result v1

    if-nez v1, :cond_1

    .line 1503
    new-instance v1, Ljava/io/IOException;

    const-string v2, "buffer discarded"

    invoke-direct {v1, v2}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 1504
    :cond_1
    invoke-virtual {v0}, Lcom/almworks/sqlite4java/DirectBuffer;->isUsed()Z

    move-result v1

    if-nez v1, :cond_2

    .line 1505
    new-instance v1, Ljava/io/IOException;

    const-string v2, "buffer not used"

    invoke-direct {v1, v2}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 1506
    :cond_2
    return-object v0
.end method


# virtual methods
.method public close()V
    .locals 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 1480
    :try_start_0
    iget-object v3, p0, Lcom/almworks/sqlite4java/SQLiteStatement$BindStream;->this$0:Lcom/almworks/sqlite4java/SQLiteStatement;

    invoke-static {v3}, Lcom/almworks/sqlite4java/SQLiteStatement;->access$000(Lcom/almworks/sqlite4java/SQLiteStatement;)Lcom/almworks/sqlite4java/SQLiteController;

    move-result-object v3

    invoke-virtual {v3}, Lcom/almworks/sqlite4java/SQLiteController;->validate()V

    .line 1481
    iget-object v0, p0, Lcom/almworks/sqlite4java/SQLiteStatement$BindStream;->myBuffer:Lcom/almworks/sqlite4java/DirectBuffer;

    .line 1482
    .local v0, "buffer":Lcom/almworks/sqlite4java/DirectBuffer;
    if-nez v0, :cond_0

    .line 1492
    :goto_0
    return-void

    .line 1484
    :cond_0
    invoke-static {}, Lcom/almworks/sqlite4java/Internal;->isFineLogging()Z

    move-result v3

    if-eqz v3, :cond_1

    .line 1485
    iget-object v3, p0, Lcom/almworks/sqlite4java/SQLiteStatement$BindStream;->this$0:Lcom/almworks/sqlite4java/SQLiteStatement;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "BindStream.close:bind(["

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v0}, Lcom/almworks/sqlite4java/DirectBuffer;->data()Ljava/nio/ByteBuffer;

    move-result-object v5

    invoke-virtual {v5}, Ljava/nio/ByteBuffer;->capacity()I

    move-result v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, "])"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Lcom/almworks/sqlite4java/Internal;->logFine(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 1486
    :cond_1
    iget-object v3, p0, Lcom/almworks/sqlite4java/SQLiteStatement$BindStream;->this$0:Lcom/almworks/sqlite4java/SQLiteStatement;

    invoke-static {v3}, Lcom/almworks/sqlite4java/SQLiteStatement;->access$100(Lcom/almworks/sqlite4java/SQLiteStatement;)Lcom/almworks/sqlite4java/SWIGTYPE_p_sqlite3_stmt;

    move-result-object v3

    iget v4, p0, Lcom/almworks/sqlite4java/SQLiteStatement$BindStream;->myIndex:I

    invoke-static {v3, v4, v0}, Lcom/almworks/sqlite4java/_SQLiteManual;->wrapper_bind_buffer(Lcom/almworks/sqlite4java/SWIGTYPE_p_sqlite3_stmt;ILcom/almworks/sqlite4java/DirectBuffer;)I

    move-result v2

    .line 1487
    .local v2, "rc":I
    invoke-virtual {p0}, Lcom/almworks/sqlite4java/SQLiteStatement$BindStream;->dispose()V

    .line 1488
    iget-object v3, p0, Lcom/almworks/sqlite4java/SQLiteStatement$BindStream;->this$0:Lcom/almworks/sqlite4java/SQLiteStatement;

    invoke-static {v3}, Lcom/almworks/sqlite4java/SQLiteStatement;->access$000(Lcom/almworks/sqlite4java/SQLiteStatement;)Lcom/almworks/sqlite4java/SQLiteController;

    move-result-object v3

    const-string v4, "bind(buffer)"

    iget-object v5, p0, Lcom/almworks/sqlite4java/SQLiteStatement$BindStream;->this$0:Lcom/almworks/sqlite4java/SQLiteStatement;

    invoke-virtual {v3, v2, v4, v5}, Lcom/almworks/sqlite4java/SQLiteController;->throwResult(ILjava/lang/String;Ljava/lang/Object;)V
    :try_end_0
    .catch Lcom/almworks/sqlite4java/SQLiteException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 1489
    .end local v0    # "buffer":Lcom/almworks/sqlite4java/DirectBuffer;
    .end local v2    # "rc":I
    :catch_0
    move-exception v1

    .line 1490
    .local v1, "e":Lcom/almworks/sqlite4java/SQLiteException;
    new-instance v3, Ljava/io/IOException;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "cannot write: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v3
.end method

.method public dispose()V
    .locals 3

    .prologue
    .line 1510
    iget-object v0, p0, Lcom/almworks/sqlite4java/SQLiteStatement$BindStream;->myBuffer:Lcom/almworks/sqlite4java/DirectBuffer;

    .line 1511
    .local v0, "buffer":Lcom/almworks/sqlite4java/DirectBuffer;
    if-eqz v0, :cond_0

    .line 1512
    const/4 v2, 0x0

    iput-object v2, p0, Lcom/almworks/sqlite4java/SQLiteStatement$BindStream;->myBuffer:Lcom/almworks/sqlite4java/DirectBuffer;

    .line 1513
    iget-object v2, p0, Lcom/almworks/sqlite4java/SQLiteStatement$BindStream;->this$0:Lcom/almworks/sqlite4java/SQLiteStatement;

    invoke-static {v2}, Lcom/almworks/sqlite4java/SQLiteStatement;->access$000(Lcom/almworks/sqlite4java/SQLiteStatement;)Lcom/almworks/sqlite4java/SQLiteController;

    move-result-object v2

    invoke-virtual {v2, v0}, Lcom/almworks/sqlite4java/SQLiteController;->freeBuffer(Lcom/almworks/sqlite4java/DirectBuffer;)V

    .line 1515
    :cond_0
    iget-object v2, p0, Lcom/almworks/sqlite4java/SQLiteStatement$BindStream;->this$0:Lcom/almworks/sqlite4java/SQLiteStatement;

    invoke-static {v2}, Lcom/almworks/sqlite4java/SQLiteStatement;->access$200(Lcom/almworks/sqlite4java/SQLiteStatement;)Ljava/util/List;

    move-result-object v1

    .line 1516
    .local v1, "list":Ljava/util/List;, "Ljava/util/List<Lcom/almworks/sqlite4java/SQLiteStatement$BindStream;>;"
    if-eqz v1, :cond_1

    .line 1517
    invoke-interface {v1, p0}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    .line 1519
    :cond_1
    return-void
.end method

.method public isDisposed()Z
    .locals 1

    .prologue
    .line 1495
    iget-object v0, p0, Lcom/almworks/sqlite4java/SQLiteStatement$BindStream;->myBuffer:Lcom/almworks/sqlite4java/DirectBuffer;

    if-nez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public write(I)V
    .locals 5
    .param p1, "b"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 1436
    :try_start_0
    iget-object v2, p0, Lcom/almworks/sqlite4java/SQLiteStatement$BindStream;->this$0:Lcom/almworks/sqlite4java/SQLiteStatement;

    invoke-static {v2}, Lcom/almworks/sqlite4java/SQLiteStatement;->access$000(Lcom/almworks/sqlite4java/SQLiteStatement;)Lcom/almworks/sqlite4java/SQLiteController;

    move-result-object v2

    invoke-virtual {v2}, Lcom/almworks/sqlite4java/SQLiteController;->validate()V

    .line 1437
    const/4 v2, 0x1

    invoke-direct {p0, v2}, Lcom/almworks/sqlite4java/SQLiteStatement$BindStream;->buffer(I)Ljava/nio/ByteBuffer;

    move-result-object v0

    .line 1438
    .local v0, "data":Ljava/nio/ByteBuffer;
    int-to-byte v2, p1

    invoke-virtual {v0, v2}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;
    :try_end_0
    .catch Lcom/almworks/sqlite4java/SQLiteException; {:try_start_0 .. :try_end_0} :catch_0

    .line 1443
    return-void

    .line 1439
    .end local v0    # "data":Ljava/nio/ByteBuffer;
    :catch_0
    move-exception v1

    .line 1440
    .local v1, "e":Lcom/almworks/sqlite4java/SQLiteException;
    invoke-virtual {p0}, Lcom/almworks/sqlite4java/SQLiteStatement$BindStream;->dispose()V

    .line 1441
    new-instance v2, Ljava/io/IOException;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "cannot write: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v2
.end method

.method public write([BII)V
    .locals 5
    .param p1, "b"    # [B
    .param p2, "off"    # I
    .param p3, "len"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 1447
    :try_start_0
    iget-object v2, p0, Lcom/almworks/sqlite4java/SQLiteStatement$BindStream;->this$0:Lcom/almworks/sqlite4java/SQLiteStatement;

    invoke-static {v2}, Lcom/almworks/sqlite4java/SQLiteStatement;->access$000(Lcom/almworks/sqlite4java/SQLiteStatement;)Lcom/almworks/sqlite4java/SQLiteController;

    move-result-object v2

    invoke-virtual {v2}, Lcom/almworks/sqlite4java/SQLiteController;->validate()V

    .line 1448
    invoke-direct {p0, p3}, Lcom/almworks/sqlite4java/SQLiteStatement$BindStream;->buffer(I)Ljava/nio/ByteBuffer;

    move-result-object v0

    .line 1449
    .local v0, "data":Ljava/nio/ByteBuffer;
    invoke-virtual {v0, p1, p2, p3}, Ljava/nio/ByteBuffer;->put([BII)Ljava/nio/ByteBuffer;
    :try_end_0
    .catch Lcom/almworks/sqlite4java/SQLiteException; {:try_start_0 .. :try_end_0} :catch_0

    .line 1454
    return-void

    .line 1450
    .end local v0    # "data":Ljava/nio/ByteBuffer;
    :catch_0
    move-exception v1

    .line 1451
    .local v1, "e":Lcom/almworks/sqlite4java/SQLiteException;
    invoke-virtual {p0}, Lcom/almworks/sqlite4java/SQLiteStatement$BindStream;->dispose()V

    .line 1452
    new-instance v2, Ljava/io/IOException;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "cannot write: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v2
.end method
