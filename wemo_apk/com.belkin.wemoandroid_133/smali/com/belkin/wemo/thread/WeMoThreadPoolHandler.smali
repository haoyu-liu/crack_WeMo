.class public Lcom/belkin/wemo/thread/WeMoThreadPoolHandler;
.super Ljava/lang/Object;
.source "WeMoThreadPoolHandler.java"


# static fields
.field public static CORE_POOL_SIZE:I

.field public static KEEP_ALIVE_TIME:J

.field public static MAX_POOL_SIZE:I

.field private static wemoThreadPool:Lcom/belkin/wemo/thread/WeMoThreadPoolHandler;


# instance fields
.field private final TAG:Ljava/lang/String;

.field private executor:Ljava/util/concurrent/ThreadPoolExecutor;

.field private wemoThreadPoolBlockingQueue:Ljava/util/concurrent/BlockingQueue;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/BlockingQueue",
            "<",
            "Ljava/lang/Runnable;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .prologue
    .line 65
    const/4 v0, 0x0

    sput v0, Lcom/belkin/wemo/thread/WeMoThreadPoolHandler;->CORE_POOL_SIZE:I

    .line 66
    const/16 v0, 0x1e

    sput v0, Lcom/belkin/wemo/thread/WeMoThreadPoolHandler;->MAX_POOL_SIZE:I

    .line 67
    const-wide/16 v0, 0x1388

    sput-wide v0, Lcom/belkin/wemo/thread/WeMoThreadPoolHandler;->KEEP_ALIVE_TIME:J

    return-void
.end method

.method private constructor <init>()V
    .locals 8

    .prologue
    .line 75
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 73
    const-class v0, Lcom/belkin/wemo/thread/WeMoThreadPoolHandler;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/belkin/wemo/thread/WeMoThreadPoolHandler;->TAG:Ljava/lang/String;

    .line 76
    new-instance v0, Ljava/util/concurrent/LinkedBlockingQueue;

    invoke-direct {v0}, Ljava/util/concurrent/LinkedBlockingQueue;-><init>()V

    iput-object v0, p0, Lcom/belkin/wemo/thread/WeMoThreadPoolHandler;->wemoThreadPoolBlockingQueue:Ljava/util/concurrent/BlockingQueue;

    .line 77
    new-instance v1, Lcom/belkin/wemo/thread/WemoThreadPoolExecutor;

    sget v2, Lcom/belkin/wemo/thread/WeMoThreadPoolHandler;->CORE_POOL_SIZE:I

    sget v3, Lcom/belkin/wemo/thread/WeMoThreadPoolHandler;->MAX_POOL_SIZE:I

    sget-wide v4, Lcom/belkin/wemo/thread/WeMoThreadPoolHandler;->KEEP_ALIVE_TIME:J

    sget-object v6, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    iget-object v7, p0, Lcom/belkin/wemo/thread/WeMoThreadPoolHandler;->wemoThreadPoolBlockingQueue:Ljava/util/concurrent/BlockingQueue;

    invoke-direct/range {v1 .. v7}, Lcom/belkin/wemo/thread/WemoThreadPoolExecutor;-><init>(IIJLjava/util/concurrent/TimeUnit;Ljava/util/concurrent/BlockingQueue;)V

    iput-object v1, p0, Lcom/belkin/wemo/thread/WeMoThreadPoolHandler;->executor:Ljava/util/concurrent/ThreadPoolExecutor;

    .line 78
    return-void
.end method

.method private constructor <init>(Lcom/belkin/wemo/thread/WemoThreadPoolExecutor;)V
    .locals 8
    .param p1, "executor"    # Lcom/belkin/wemo/thread/WemoThreadPoolExecutor;

    .prologue
    .line 80
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 73
    const-class v0, Lcom/belkin/wemo/thread/WeMoThreadPoolHandler;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/belkin/wemo/thread/WeMoThreadPoolHandler;->TAG:Ljava/lang/String;

    .line 81
    new-instance v0, Ljava/util/concurrent/LinkedBlockingQueue;

    invoke-direct {v0}, Ljava/util/concurrent/LinkedBlockingQueue;-><init>()V

    iput-object v0, p0, Lcom/belkin/wemo/thread/WeMoThreadPoolHandler;->wemoThreadPoolBlockingQueue:Ljava/util/concurrent/BlockingQueue;

    .line 82
    new-instance p1, Lcom/belkin/wemo/thread/WemoThreadPoolExecutor;

    .end local p1    # "executor":Lcom/belkin/wemo/thread/WemoThreadPoolExecutor;
    sget v2, Lcom/belkin/wemo/thread/WeMoThreadPoolHandler;->CORE_POOL_SIZE:I

    sget v3, Lcom/belkin/wemo/thread/WeMoThreadPoolHandler;->MAX_POOL_SIZE:I

    sget-wide v4, Lcom/belkin/wemo/thread/WeMoThreadPoolHandler;->KEEP_ALIVE_TIME:J

    sget-object v6, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    iget-object v7, p0, Lcom/belkin/wemo/thread/WeMoThreadPoolHandler;->wemoThreadPoolBlockingQueue:Ljava/util/concurrent/BlockingQueue;

    move-object v1, p1

    invoke-direct/range {v1 .. v7}, Lcom/belkin/wemo/thread/WemoThreadPoolExecutor;-><init>(IIJLjava/util/concurrent/TimeUnit;Ljava/util/concurrent/BlockingQueue;)V

    .line 83
    .restart local p1    # "executor":Lcom/belkin/wemo/thread/WemoThreadPoolExecutor;
    return-void
.end method

.method public static executeInBackground(Ljava/lang/Runnable;)V
    .locals 1
    .param p0, "task"    # Ljava/lang/Runnable;

    .prologue
    .line 134
    invoke-static {}, Ljava/util/concurrent/Executors;->newSingleThreadExecutor()Ljava/util/concurrent/ExecutorService;

    move-result-object v0

    invoke-interface {v0, p0}, Ljava/util/concurrent/ExecutorService;->execute(Ljava/lang/Runnable;)V

    .line 135
    return-void
.end method

.method public static declared-synchronized getInstance()Lcom/belkin/wemo/thread/WeMoThreadPoolHandler;
    .locals 2

    .prologue
    .line 96
    const-class v1, Lcom/belkin/wemo/thread/WeMoThreadPoolHandler;

    monitor-enter v1

    :try_start_0
    sget-object v0, Lcom/belkin/wemo/thread/WeMoThreadPoolHandler;->wemoThreadPool:Lcom/belkin/wemo/thread/WeMoThreadPoolHandler;

    if-nez v0, :cond_0

    .line 97
    new-instance v0, Lcom/belkin/wemo/thread/WeMoThreadPoolHandler;

    invoke-direct {v0}, Lcom/belkin/wemo/thread/WeMoThreadPoolHandler;-><init>()V

    sput-object v0, Lcom/belkin/wemo/thread/WeMoThreadPoolHandler;->wemoThreadPool:Lcom/belkin/wemo/thread/WeMoThreadPoolHandler;

    .line 99
    :cond_0
    sget-object v0, Lcom/belkin/wemo/thread/WeMoThreadPoolHandler;->wemoThreadPool:Lcom/belkin/wemo/thread/WeMoThreadPoolHandler;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit v1

    return-object v0

    .line 96
    :catchall_0
    move-exception v0

    monitor-exit v1

    throw v0
.end method


# virtual methods
.method public declared-synchronized destroyThreadPool()V
    .locals 1

    .prologue
    .line 106
    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lcom/belkin/wemo/thread/WeMoThreadPoolHandler;->executor:Ljava/util/concurrent/ThreadPoolExecutor;

    if-eqz v0, :cond_0

    .line 107
    iget-object v0, p0, Lcom/belkin/wemo/thread/WeMoThreadPoolHandler;->executor:Ljava/util/concurrent/ThreadPoolExecutor;

    invoke-virtual {v0}, Ljava/util/concurrent/ThreadPoolExecutor;->shutdown()V

    .line 108
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/belkin/wemo/thread/WeMoThreadPoolHandler;->executor:Ljava/util/concurrent/ThreadPoolExecutor;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 110
    :cond_0
    monitor-exit p0

    return-void

    .line 106
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized executeViaBackground(Lcom/belkin/wemo/runnable/WeMoRunnable;)V
    .locals 3
    .param p1, "task"    # Lcom/belkin/wemo/runnable/WeMoRunnable;

    .prologue
    .line 119
    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lcom/belkin/wemo/thread/WeMoThreadPoolHandler;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Execute In Background Request Received. Runnable: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->debugLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 120
    iget-object v0, p0, Lcom/belkin/wemo/thread/WeMoThreadPoolHandler;->executor:Ljava/util/concurrent/ThreadPoolExecutor;

    invoke-virtual {v0, p1}, Ljava/util/concurrent/ThreadPoolExecutor;->execute(Ljava/lang/Runnable;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 121
    monitor-exit p0

    return-void

    .line 119
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized sumbitViaBackground(Lcom/belkin/wemo/runnable/WeMoRunnable;)Ljava/util/concurrent/Future;
    .locals 1
    .param p1, "task"    # Lcom/belkin/wemo/runnable/WeMoRunnable;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/belkin/wemo/runnable/WeMoRunnable;",
            ")",
            "Ljava/util/concurrent/Future",
            "<*>;"
        }
    .end annotation

    .prologue
    .line 124
    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lcom/belkin/wemo/thread/WeMoThreadPoolHandler;->executor:Ljava/util/concurrent/ThreadPoolExecutor;

    invoke-virtual {v0, p1}, Ljava/util/concurrent/ThreadPoolExecutor;->submit(Ljava/lang/Runnable;)Ljava/util/concurrent/Future;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result-object v0

    monitor-exit p0

    return-object v0

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method
