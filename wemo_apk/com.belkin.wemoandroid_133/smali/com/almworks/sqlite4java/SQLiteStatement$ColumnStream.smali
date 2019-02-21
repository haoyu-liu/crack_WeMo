.class Lcom/almworks/sqlite4java/SQLiteStatement$ColumnStream;
.super Ljava/io/InputStream;
.source "SQLiteStatement.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/almworks/sqlite4java/SQLiteStatement;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "ColumnStream"
.end annotation


# static fields
.field static final synthetic $assertionsDisabled:Z


# instance fields
.field private myBuffer:Ljava/nio/ByteBuffer;

.field final synthetic this$0:Lcom/almworks/sqlite4java/SQLiteStatement;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 1522
    const-class v0, Lcom/almworks/sqlite4java/SQLiteStatement;

    invoke-virtual {v0}, Ljava/lang/Class;->desiredAssertionStatus()Z

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    sput-boolean v0, Lcom/almworks/sqlite4java/SQLiteStatement$ColumnStream;->$assertionsDisabled:Z

    return-void

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public constructor <init>(Lcom/almworks/sqlite4java/SQLiteStatement;Ljava/nio/ByteBuffer;)V
    .locals 1
    .param p2, "buffer"    # Ljava/nio/ByteBuffer;

    .prologue
    .line 1525
    iput-object p1, p0, Lcom/almworks/sqlite4java/SQLiteStatement$ColumnStream;->this$0:Lcom/almworks/sqlite4java/SQLiteStatement;

    invoke-direct {p0}, Ljava/io/InputStream;-><init>()V

    .line 1526
    sget-boolean v0, Lcom/almworks/sqlite4java/SQLiteStatement$ColumnStream;->$assertionsDisabled:Z

    if-nez v0, :cond_0

    if-nez p2, :cond_0

    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0

    .line 1527
    :cond_0
    iput-object p2, p0, Lcom/almworks/sqlite4java/SQLiteStatement$ColumnStream;->myBuffer:Ljava/nio/ByteBuffer;

    .line 1528
    return-void
.end method


# virtual methods
.method public close()V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 1561
    const/4 v1, 0x0

    iput-object v1, p0, Lcom/almworks/sqlite4java/SQLiteStatement$ColumnStream;->myBuffer:Ljava/nio/ByteBuffer;

    .line 1562
    iget-object v1, p0, Lcom/almworks/sqlite4java/SQLiteStatement$ColumnStream;->this$0:Lcom/almworks/sqlite4java/SQLiteStatement;

    invoke-static {v1}, Lcom/almworks/sqlite4java/SQLiteStatement;->access$300(Lcom/almworks/sqlite4java/SQLiteStatement;)Ljava/util/List;

    move-result-object v0

    .line 1563
    .local v0, "table":Ljava/util/List;, "Ljava/util/List<Lcom/almworks/sqlite4java/SQLiteStatement$ColumnStream;>;"
    if-eqz v0, :cond_0

    .line 1564
    invoke-interface {v0, p0}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    .line 1565
    :cond_0
    return-void
.end method

.method public getBuffer()Ljava/nio/ByteBuffer;
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 1568
    iget-object v0, p0, Lcom/almworks/sqlite4java/SQLiteStatement$ColumnStream;->myBuffer:Ljava/nio/ByteBuffer;

    .line 1569
    .local v0, "buffer":Ljava/nio/ByteBuffer;
    if-nez v0, :cond_0

    .line 1570
    new-instance v1, Ljava/io/IOException;

    const-string v2, "stream closed"

    invoke-direct {v1, v2}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 1571
    :cond_0
    return-object v0
.end method

.method public read()I
    .locals 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v3, -0x1

    .line 1531
    invoke-virtual {p0}, Lcom/almworks/sqlite4java/SQLiteStatement$ColumnStream;->getBuffer()Ljava/nio/ByteBuffer;

    move-result-object v1

    .line 1532
    .local v1, "buffer":Ljava/nio/ByteBuffer;
    invoke-virtual {v1}, Ljava/nio/ByteBuffer;->remaining()I

    move-result v4

    if-gtz v4, :cond_0

    .line 1541
    :goto_0
    return v3

    .line 1534
    :cond_0
    const/4 v0, 0x0

    .line 1536
    .local v0, "b":B
    :try_start_0
    invoke-virtual {v1}, Ljava/nio/ByteBuffer;->get()B
    :try_end_0
    .catch Ljava/nio/BufferUnderflowException; {:try_start_0 .. :try_end_0} :catch_0

    move-result v0

    .line 1541
    and-int/lit16 v3, v0, 0xff

    goto :goto_0

    .line 1537
    :catch_0
    move-exception v2

    .line 1538
    .local v2, "e":Ljava/nio/BufferUnderflowException;
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "weird: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {p0, v4}, Lcom/almworks/sqlite4java/Internal;->logWarn(Ljava/lang/Object;Ljava/lang/Object;)V

    goto :goto_0
.end method

.method public read([BII)I
    .locals 6
    .param p1, "b"    # [B
    .param p2, "off"    # I
    .param p3, "len"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v3, -0x1

    .line 1545
    invoke-virtual {p0}, Lcom/almworks/sqlite4java/SQLiteStatement$ColumnStream;->getBuffer()Ljava/nio/ByteBuffer;

    move-result-object v0

    .line 1546
    .local v0, "buffer":Ljava/nio/ByteBuffer;
    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->remaining()I

    move-result v2

    .line 1547
    .local v2, "rem":I
    if-gtz v2, :cond_0

    .line 1556
    :goto_0
    return v3

    .line 1550
    :cond_0
    if-ge v2, p3, :cond_1

    .line 1551
    move p3, v2

    .line 1552
    :cond_1
    :try_start_0
    invoke-virtual {v0, p1, p2, p3}, Ljava/nio/ByteBuffer;->get([BII)Ljava/nio/ByteBuffer;
    :try_end_0
    .catch Ljava/nio/BufferUnderflowException; {:try_start_0 .. :try_end_0} :catch_0

    move v3, p3

    .line 1553
    goto :goto_0

    .line 1554
    :catch_0
    move-exception v1

    .line 1555
    .local v1, "e":Ljava/nio/BufferUnderflowException;
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "weird: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {p0, v4}, Lcom/almworks/sqlite4java/Internal;->logWarn(Ljava/lang/Object;Ljava/lang/Object;)V

    goto :goto_0
.end method
