.class Lcom/almworks/sqlite4java/ProgressHandler;
.super Ljava/lang/Object;
.source "ProgressHandler.java"


# static fields
.field static final synthetic $assertionsDisabled:Z

.field public static final DISPOSED:Lcom/almworks/sqlite4java/ProgressHandler;

.field private static final OFFSET_CANCEL:I = 0x0

.field private static final OFFSET_STEPCOUNT:I = 0x1


# instance fields
.field private myBuffer:Ljava/nio/ByteBuffer;

.field private myLongs:Ljava/nio/LongBuffer;

.field private myPointer:Lcom/almworks/sqlite4java/SWIGTYPE_p_direct_buffer;

.field private final myStepsPerCallback:I


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 23
    const-class v0, Lcom/almworks/sqlite4java/ProgressHandler;

    invoke-virtual {v0}, Ljava/lang/Class;->desiredAssertionStatus()Z

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    sput-boolean v0, Lcom/almworks/sqlite4java/ProgressHandler;->$assertionsDisabled:Z

    .line 24
    new-instance v0, Lcom/almworks/sqlite4java/ProgressHandler;

    invoke-direct {v0}, Lcom/almworks/sqlite4java/ProgressHandler;-><init>()V

    sput-object v0, Lcom/almworks/sqlite4java/ProgressHandler;->DISPOSED:Lcom/almworks/sqlite4java/ProgressHandler;

    return-void

    .line 23
    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method private constructor <init>()V
    .locals 1

    .prologue
    .line 45
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 46
    const/4 v0, 0x0

    iput v0, p0, Lcom/almworks/sqlite4java/ProgressHandler;->myStepsPerCallback:I

    .line 47
    return-void
.end method

.method public constructor <init>(Lcom/almworks/sqlite4java/SWIGTYPE_p_direct_buffer;Ljava/nio/ByteBuffer;I)V
    .locals 2
    .param p1, "pointer"    # Lcom/almworks/sqlite4java/SWIGTYPE_p_direct_buffer;
    .param p2, "buffer"    # Ljava/nio/ByteBuffer;
    .param p3, "stepsPerCallback"    # I

    .prologue
    .line 35
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 36
    iput p3, p0, Lcom/almworks/sqlite4java/ProgressHandler;->myStepsPerCallback:I

    .line 37
    sget-boolean v0, Lcom/almworks/sqlite4java/ProgressHandler;->$assertionsDisabled:Z

    if-nez v0, :cond_0

    invoke-virtual {p2}, Ljava/nio/ByteBuffer;->isDirect()Z

    move-result v0

    if-nez v0, :cond_0

    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0

    .line 38
    :cond_0
    sget-boolean v0, Lcom/almworks/sqlite4java/ProgressHandler;->$assertionsDisabled:Z

    if-nez v0, :cond_1

    invoke-virtual {p2}, Ljava/nio/ByteBuffer;->capacity()I

    move-result v0

    const/16 v1, 0x10

    if-eq v0, v1, :cond_1

    new-instance v0, Ljava/lang/AssertionError;

    invoke-virtual {p2}, Ljava/nio/ByteBuffer;->capacity()I

    move-result v1

    invoke-direct {v0, v1}, Ljava/lang/AssertionError;-><init>(I)V

    throw v0

    .line 39
    :cond_1
    iput-object p1, p0, Lcom/almworks/sqlite4java/ProgressHandler;->myPointer:Lcom/almworks/sqlite4java/SWIGTYPE_p_direct_buffer;

    .line 40
    iput-object p2, p0, Lcom/almworks/sqlite4java/ProgressHandler;->myBuffer:Ljava/nio/ByteBuffer;

    .line 41
    invoke-static {}, Ljava/nio/ByteOrder;->nativeOrder()Ljava/nio/ByteOrder;

    move-result-object v0

    invoke-virtual {p2, v0}, Ljava/nio/ByteBuffer;->order(Ljava/nio/ByteOrder;)Ljava/nio/ByteBuffer;

    move-result-object v0

    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->asLongBuffer()Ljava/nio/LongBuffer;

    move-result-object v0

    iput-object v0, p0, Lcom/almworks/sqlite4java/ProgressHandler;->myLongs:Ljava/nio/LongBuffer;

    .line 42
    sget-boolean v0, Lcom/almworks/sqlite4java/ProgressHandler;->$assertionsDisabled:Z

    if-nez v0, :cond_2

    iget-object v0, p0, Lcom/almworks/sqlite4java/ProgressHandler;->myLongs:Ljava/nio/LongBuffer;

    invoke-virtual {v0}, Ljava/nio/LongBuffer;->capacity()I

    move-result v0

    const/4 v1, 0x2

    if-eq v0, v1, :cond_2

    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0

    .line 43
    :cond_2
    return-void
.end method


# virtual methods
.method public declared-synchronized cancel()V
    .locals 4

    .prologue
    .line 65
    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lcom/almworks/sqlite4java/ProgressHandler;->myLongs:Ljava/nio/LongBuffer;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-nez v0, :cond_0

    .line 68
    :goto_0
    monitor-exit p0

    return-void

    .line 67
    :cond_0
    :try_start_1
    iget-object v0, p0, Lcom/almworks/sqlite4java/ProgressHandler;->myLongs:Ljava/nio/LongBuffer;

    const/4 v1, 0x0

    const-wide/16 v2, 0x1

    invoke-virtual {v0, v1, v2, v3}, Ljava/nio/LongBuffer;->put(IJ)Ljava/nio/LongBuffer;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    .line 65
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized dispose()Lcom/almworks/sqlite4java/SWIGTYPE_p_direct_buffer;
    .locals 2

    .prologue
    .line 50
    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lcom/almworks/sqlite4java/ProgressHandler;->myPointer:Lcom/almworks/sqlite4java/SWIGTYPE_p_direct_buffer;

    .line 51
    .local v0, "ptr":Lcom/almworks/sqlite4java/SWIGTYPE_p_direct_buffer;
    const/4 v1, 0x0

    iput-object v1, p0, Lcom/almworks/sqlite4java/ProgressHandler;->myBuffer:Ljava/nio/ByteBuffer;

    .line 52
    const/4 v1, 0x0

    iput-object v1, p0, Lcom/almworks/sqlite4java/ProgressHandler;->myPointer:Lcom/almworks/sqlite4java/SWIGTYPE_p_direct_buffer;

    .line 53
    const/4 v1, 0x0

    iput-object v1, p0, Lcom/almworks/sqlite4java/ProgressHandler;->myLongs:Ljava/nio/LongBuffer;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 54
    monitor-exit p0

    return-object v0

    .line 50
    .end local v0    # "ptr":Lcom/almworks/sqlite4java/SWIGTYPE_p_direct_buffer;
    :catchall_0
    move-exception v1

    monitor-exit p0

    throw v1
.end method

.method public declared-synchronized getSteps()J
    .locals 4

    .prologue
    .line 71
    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lcom/almworks/sqlite4java/ProgressHandler;->myLongs:Ljava/nio/LongBuffer;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-nez v0, :cond_0

    .line 72
    const-wide/16 v0, -0x1

    .line 73
    :goto_0
    monitor-exit p0

    return-wide v0

    :cond_0
    :try_start_1
    iget-object v0, p0, Lcom/almworks/sqlite4java/ProgressHandler;->myLongs:Ljava/nio/LongBuffer;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Ljava/nio/LongBuffer;->get(I)J

    move-result-wide v0

    iget v2, p0, Lcom/almworks/sqlite4java/ProgressHandler;->myStepsPerCallback:I
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    int-to-long v2, v2

    mul-long/2addr v0, v2

    goto :goto_0

    .line 71
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized reset()V
    .locals 4

    .prologue
    .line 58
    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lcom/almworks/sqlite4java/ProgressHandler;->myLongs:Ljava/nio/LongBuffer;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-nez v0, :cond_0

    .line 62
    :goto_0
    monitor-exit p0

    return-void

    .line 60
    :cond_0
    :try_start_1
    iget-object v0, p0, Lcom/almworks/sqlite4java/ProgressHandler;->myLongs:Ljava/nio/LongBuffer;

    const/4 v1, 0x0

    const-wide/16 v2, 0x0

    invoke-virtual {v0, v1, v2, v3}, Ljava/nio/LongBuffer;->put(IJ)Ljava/nio/LongBuffer;

    .line 61
    iget-object v0, p0, Lcom/almworks/sqlite4java/ProgressHandler;->myLongs:Ljava/nio/LongBuffer;

    const/4 v1, 0x1

    const-wide/16 v2, 0x0

    invoke-virtual {v0, v1, v2, v3}, Ljava/nio/LongBuffer;->put(IJ)Ljava/nio/LongBuffer;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    .line 58
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method
