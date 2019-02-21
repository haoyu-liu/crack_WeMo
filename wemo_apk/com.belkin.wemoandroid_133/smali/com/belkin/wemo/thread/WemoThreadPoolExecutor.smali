.class public Lcom/belkin/wemo/thread/WemoThreadPoolExecutor;
.super Ljava/util/concurrent/ThreadPoolExecutor;
.source "WemoThreadPoolExecutor.java"


# instance fields
.field private corePoolSize:I

.field private currentThreadPoolSize:I

.field private lock:Ljava/lang/Object;

.field private maxPoolSize:I


# direct methods
.method public constructor <init>(IIJLjava/util/concurrent/TimeUnit;Ljava/util/concurrent/BlockingQueue;)V
    .locals 1
    .param p1, "corePoolSize"    # I
    .param p2, "maximumPoolSize"    # I
    .param p3, "keepAliveTime"    # J
    .param p5, "unit"    # Ljava/util/concurrent/TimeUnit;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(IIJ",
            "Ljava/util/concurrent/TimeUnit;",
            "Ljava/util/concurrent/BlockingQueue",
            "<",
            "Ljava/lang/Runnable;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 82
    .local p6, "workQueue":Ljava/util/concurrent/BlockingQueue;, "Ljava/util/concurrent/BlockingQueue<Ljava/lang/Runnable;>;"
    invoke-direct/range {p0 .. p6}, Ljava/util/concurrent/ThreadPoolExecutor;-><init>(IIJLjava/util/concurrent/TimeUnit;Ljava/util/concurrent/BlockingQueue;)V

    .line 84
    const/4 v0, 0x0

    iput v0, p0, Lcom/belkin/wemo/thread/WemoThreadPoolExecutor;->currentThreadPoolSize:I

    .line 85
    iput p1, p0, Lcom/belkin/wemo/thread/WemoThreadPoolExecutor;->corePoolSize:I

    .line 86
    iput p2, p0, Lcom/belkin/wemo/thread/WemoThreadPoolExecutor;->maxPoolSize:I

    .line 87
    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Lcom/belkin/wemo/thread/WemoThreadPoolExecutor;->lock:Ljava/lang/Object;

    .line 88
    return-void
.end method

.method private reEvaluateCorePoolSize(I)V
    .locals 2
    .param p1, "currentSize"    # I

    .prologue
    .line 131
    move v0, p1

    .line 133
    .local v0, "newCorePoolSize":I
    iget v1, p0, Lcom/belkin/wemo/thread/WemoThreadPoolExecutor;->corePoolSize:I

    if-ge v0, v1, :cond_1

    .line 134
    iget v0, p0, Lcom/belkin/wemo/thread/WemoThreadPoolExecutor;->corePoolSize:I

    .line 138
    :cond_0
    :goto_0
    invoke-super {p0, v0}, Ljava/util/concurrent/ThreadPoolExecutor;->setCorePoolSize(I)V

    .line 139
    return-void

    .line 135
    :cond_1
    iget v1, p0, Lcom/belkin/wemo/thread/WemoThreadPoolExecutor;->maxPoolSize:I

    if-le v0, v1, :cond_0

    .line 136
    iget v0, p0, Lcom/belkin/wemo/thread/WemoThreadPoolExecutor;->maxPoolSize:I

    goto :goto_0
.end method


# virtual methods
.method protected afterExecute(Ljava/lang/Runnable;Ljava/lang/Throwable;)V
    .locals 2
    .param p1, "r"    # Ljava/lang/Runnable;
    .param p2, "t"    # Ljava/lang/Throwable;

    .prologue
    .line 124
    invoke-super {p0, p1, p2}, Ljava/util/concurrent/ThreadPoolExecutor;->afterExecute(Ljava/lang/Runnable;Ljava/lang/Throwable;)V

    .line 125
    iget-object v1, p0, Lcom/belkin/wemo/thread/WemoThreadPoolExecutor;->lock:Ljava/lang/Object;

    monitor-enter v1

    .line 126
    :try_start_0
    iget v0, p0, Lcom/belkin/wemo/thread/WemoThreadPoolExecutor;->currentThreadPoolSize:I

    add-int/lit8 v0, v0, -0x1

    iput v0, p0, Lcom/belkin/wemo/thread/WemoThreadPoolExecutor;->currentThreadPoolSize:I

    invoke-direct {p0, v0}, Lcom/belkin/wemo/thread/WemoThreadPoolExecutor;->reEvaluateCorePoolSize(I)V

    .line 127
    monitor-exit v1

    .line 128
    return-void

    .line 127
    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method public execute(Ljava/lang/Runnable;)V
    .locals 2
    .param p1, "command"    # Ljava/lang/Runnable;

    .prologue
    .line 113
    iget-object v1, p0, Lcom/belkin/wemo/thread/WemoThreadPoolExecutor;->lock:Ljava/lang/Object;

    monitor-enter v1

    .line 114
    :try_start_0
    iget v0, p0, Lcom/belkin/wemo/thread/WemoThreadPoolExecutor;->currentThreadPoolSize:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lcom/belkin/wemo/thread/WemoThreadPoolExecutor;->currentThreadPoolSize:I

    invoke-direct {p0, v0}, Lcom/belkin/wemo/thread/WemoThreadPoolExecutor;->reEvaluateCorePoolSize(I)V

    .line 115
    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 116
    invoke-super {p0, p1}, Ljava/util/concurrent/ThreadPoolExecutor;->execute(Ljava/lang/Runnable;)V

    .line 117
    return-void

    .line 115
    :catchall_0
    move-exception v0

    :try_start_1
    monitor-exit v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v0
.end method

.method public setCorePoolSize(I)V
    .locals 0
    .param p1, "corePoolSize"    # I

    .prologue
    .line 105
    iput p1, p0, Lcom/belkin/wemo/thread/WemoThreadPoolExecutor;->corePoolSize:I

    .line 106
    return-void
.end method

.method public setMaximumPoolSize(I)V
    .locals 0
    .param p1, "maximumPoolSize"    # I

    .prologue
    .line 96
    iput p1, p0, Lcom/belkin/wemo/thread/WemoThreadPoolExecutor;->maxPoolSize:I

    .line 97
    invoke-super {p0, p1}, Ljava/util/concurrent/ThreadPoolExecutor;->setMaximumPoolSize(I)V

    .line 98
    return-void
.end method
