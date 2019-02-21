.class final Lcom/almworks/sqlite4java/DirectBuffer;
.super Ljava/lang/Object;
.source "DirectBuffer.java"


# static fields
.field static final synthetic $assertionsDisabled:Z

.field static final CONTROL_BYTES:I = 0x2


# instance fields
.field private myControlBuffer:Ljava/nio/ByteBuffer;

.field private myDataBuffer:Ljava/nio/ByteBuffer;

.field private myHandle:Lcom/almworks/sqlite4java/SWIGTYPE_p_direct_buffer;

.field private final mySize:I


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 22
    const-class v0, Lcom/almworks/sqlite4java/DirectBuffer;

    invoke-virtual {v0}, Ljava/lang/Class;->desiredAssertionStatus()Z

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    sput-boolean v0, Lcom/almworks/sqlite4java/DirectBuffer;->$assertionsDisabled:Z

    return-void

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method constructor <init>(Lcom/almworks/sqlite4java/SWIGTYPE_p_direct_buffer;Ljava/nio/ByteBuffer;Ljava/nio/ByteBuffer;I)V
    .locals 3
    .param p1, "handle"    # Lcom/almworks/sqlite4java/SWIGTYPE_p_direct_buffer;
    .param p2, "controlBuffer"    # Ljava/nio/ByteBuffer;
    .param p3, "dataBuffer"    # Ljava/nio/ByteBuffer;
    .param p4, "size"    # I

    .prologue
    const/4 v2, 0x2

    .line 30
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 31
    sget-boolean v0, Lcom/almworks/sqlite4java/DirectBuffer;->$assertionsDisabled:Z

    if-nez v0, :cond_0

    invoke-virtual {p2}, Ljava/nio/ByteBuffer;->capacity()I

    move-result v0

    invoke-virtual {p3}, Ljava/nio/ByteBuffer;->capacity()I

    move-result v1

    add-int/2addr v0, v1

    if-eq p4, v0, :cond_0

    new-instance v0, Ljava/lang/AssertionError;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, p4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p2}, Ljava/nio/ByteBuffer;->capacity()I

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p3}, Ljava/nio/ByteBuffer;->capacity()I

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/AssertionError;-><init>(Ljava/lang/Object;)V

    throw v0

    .line 32
    :cond_0
    sget-boolean v0, Lcom/almworks/sqlite4java/DirectBuffer;->$assertionsDisabled:Z

    if-nez v0, :cond_1

    invoke-virtual {p2}, Ljava/nio/ByteBuffer;->capacity()I

    move-result v0

    if-eq v0, v2, :cond_1

    new-instance v0, Ljava/lang/AssertionError;

    invoke-virtual {p2}, Ljava/nio/ByteBuffer;->capacity()I

    move-result v1

    invoke-direct {v0, v1}, Ljava/lang/AssertionError;-><init>(I)V

    throw v0

    .line 33
    :cond_1
    sget-boolean v0, Lcom/almworks/sqlite4java/DirectBuffer;->$assertionsDisabled:Z

    if-nez v0, :cond_2

    if-gt p4, v2, :cond_2

    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0, p4}, Ljava/lang/AssertionError;-><init>(I)V

    throw v0

    .line 34
    :cond_2
    iput-object p1, p0, Lcom/almworks/sqlite4java/DirectBuffer;->myHandle:Lcom/almworks/sqlite4java/SWIGTYPE_p_direct_buffer;

    .line 35
    iput-object p2, p0, Lcom/almworks/sqlite4java/DirectBuffer;->myControlBuffer:Ljava/nio/ByteBuffer;

    .line 36
    iput-object p3, p0, Lcom/almworks/sqlite4java/DirectBuffer;->myDataBuffer:Ljava/nio/ByteBuffer;

    .line 37
    iput p4, p0, Lcom/almworks/sqlite4java/DirectBuffer;->mySize:I

    .line 38
    return-void
.end method


# virtual methods
.method public data()Ljava/nio/ByteBuffer;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 41
    invoke-virtual {p0}, Lcom/almworks/sqlite4java/DirectBuffer;->isValid()Z

    move-result v0

    if-nez v0, :cond_0

    .line 42
    new-instance v0, Ljava/io/IOException;

    const-string v1, "buffer disposed"

    invoke-direct {v0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 43
    :cond_0
    iget-object v0, p0, Lcom/almworks/sqlite4java/DirectBuffer;->myDataBuffer:Ljava/nio/ByteBuffer;

    return-object v0
.end method

.method public decUsed()V
    .locals 4

    .prologue
    const/4 v3, 0x0

    .line 82
    iget-object v0, p0, Lcom/almworks/sqlite4java/DirectBuffer;->myControlBuffer:Ljava/nio/ByteBuffer;

    .line 83
    .local v0, "controlBuffer":Ljava/nio/ByteBuffer;
    if-eqz v0, :cond_0

    .line 84
    invoke-virtual {v0, v3}, Ljava/nio/ByteBuffer;->get(I)B

    move-result v1

    .line 85
    .local v1, "usage":B
    if-lez v1, :cond_0

    .line 86
    add-int/lit8 v2, v1, -0x1

    int-to-byte v2, v2

    invoke-virtual {v0, v3, v2}, Ljava/nio/ByteBuffer;->put(IB)Ljava/nio/ByteBuffer;

    .line 88
    .end local v1    # "usage":B
    :cond_0
    return-void
.end method

.method public getCapacity()I
    .locals 1

    .prologue
    .line 47
    iget v0, p0, Lcom/almworks/sqlite4java/DirectBuffer;->mySize:I

    add-int/lit8 v0, v0, -0x2

    return v0
.end method

.method public getHandle()Lcom/almworks/sqlite4java/SWIGTYPE_p_direct_buffer;
    .locals 1

    .prologue
    .line 56
    iget-object v0, p0, Lcom/almworks/sqlite4java/DirectBuffer;->myHandle:Lcom/almworks/sqlite4java/SWIGTYPE_p_direct_buffer;

    return-object v0
.end method

.method public getPosition()I
    .locals 2

    .prologue
    .line 51
    iget-object v0, p0, Lcom/almworks/sqlite4java/DirectBuffer;->myDataBuffer:Ljava/nio/ByteBuffer;

    .line 52
    .local v0, "buffer":Ljava/nio/ByteBuffer;
    if-nez v0, :cond_0

    const/4 v1, 0x0

    :goto_0
    return v1

    :cond_0
    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->position()I

    move-result v1

    goto :goto_0
.end method

.method public incUsed()V
    .locals 3

    .prologue
    const/4 v2, 0x0

    .line 75
    iget-object v0, p0, Lcom/almworks/sqlite4java/DirectBuffer;->myControlBuffer:Ljava/nio/ByteBuffer;

    .line 76
    .local v0, "controlBuffer":Ljava/nio/ByteBuffer;
    if-eqz v0, :cond_0

    .line 77
    invoke-virtual {v0, v2}, Ljava/nio/ByteBuffer;->get(I)B

    move-result v1

    add-int/lit8 v1, v1, 0x1

    int-to-byte v1, v1

    invoke-virtual {v0, v2, v1}, Ljava/nio/ByteBuffer;->put(IB)Ljava/nio/ByteBuffer;

    .line 79
    :cond_0
    return-void
.end method

.method invalidate()V
    .locals 1

    .prologue
    const/4 v0, 0x0

    .line 91
    iput-object v0, p0, Lcom/almworks/sqlite4java/DirectBuffer;->myControlBuffer:Ljava/nio/ByteBuffer;

    .line 92
    iput-object v0, p0, Lcom/almworks/sqlite4java/DirectBuffer;->myDataBuffer:Ljava/nio/ByteBuffer;

    .line 93
    iput-object v0, p0, Lcom/almworks/sqlite4java/DirectBuffer;->myHandle:Lcom/almworks/sqlite4java/SWIGTYPE_p_direct_buffer;

    .line 94
    return-void
.end method

.method public isUsed()Z
    .locals 3

    .prologue
    const/4 v1, 0x0

    .line 68
    iget-object v0, p0, Lcom/almworks/sqlite4java/DirectBuffer;->myControlBuffer:Ljava/nio/ByteBuffer;

    .line 69
    .local v0, "controlBuffer":Ljava/nio/ByteBuffer;
    if-nez v0, :cond_1

    .line 71
    :cond_0
    :goto_0
    return v1

    :cond_1
    invoke-virtual {v0, v1}, Ljava/nio/ByteBuffer;->get(I)B

    move-result v2

    if-eqz v2, :cond_0

    const/4 v1, 0x1

    goto :goto_0
.end method

.method public isValid()Z
    .locals 5

    .prologue
    const/4 v2, 0x1

    const/4 v3, 0x0

    .line 60
    iget-object v0, p0, Lcom/almworks/sqlite4java/DirectBuffer;->myControlBuffer:Ljava/nio/ByteBuffer;

    .line 61
    .local v0, "controlBuffer":Ljava/nio/ByteBuffer;
    if-eqz v0, :cond_0

    iget-object v4, p0, Lcom/almworks/sqlite4java/DirectBuffer;->myDataBuffer:Ljava/nio/ByteBuffer;

    if-eqz v4, :cond_0

    iget-object v4, p0, Lcom/almworks/sqlite4java/DirectBuffer;->myHandle:Lcom/almworks/sqlite4java/SWIGTYPE_p_direct_buffer;

    if-nez v4, :cond_2

    :cond_0
    move v2, v3

    .line 64
    :cond_1
    :goto_0
    return v2

    .line 63
    :cond_2
    invoke-virtual {v0, v2}, Ljava/nio/ByteBuffer;->get(I)B

    move-result v1

    .line 64
    .local v1, "pendingRemove":B
    if-eqz v1, :cond_1

    move v2, v3

    goto :goto_0
.end method
