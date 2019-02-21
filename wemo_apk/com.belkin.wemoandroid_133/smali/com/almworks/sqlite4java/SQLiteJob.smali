.class public abstract Lcom/almworks/sqlite4java/SQLiteJob;
.super Ljava/lang/Object;
.source "SQLiteJob.java"

# interfaces
.implements Ljava/util/concurrent/Future;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;",
        "Ljava/util/concurrent/Future",
        "<TT;>;"
    }
.end annotation


# static fields
.field static final synthetic $assertionsDisabled:Z

.field private static final CANCELLED:I = 0x4

.field private static final ERROR:I = 0x3

.field private static final PENDING:I = 0x0

.field private static final RUNNING:I = 0x1

.field private static final SUCCEEDED:I = 0x2


# instance fields
.field private myConnection:Lcom/almworks/sqlite4java/SQLiteConnection;

.field private myError:Ljava/lang/Throwable;

.field private final myLock:Ljava/lang/Object;

.field private myQueue:Lcom/almworks/sqlite4java/SQLiteQueue;

.field private myResult:Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "TT;"
        }
    .end annotation
.end field

.field private myState:I


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 54
    const-class v0, Lcom/almworks/sqlite4java/SQLiteJob;

    invoke-virtual {v0}, Ljava/lang/Class;->desiredAssertionStatus()Z

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    sput-boolean v0, Lcom/almworks/sqlite4java/SQLiteJob;->$assertionsDisabled:Z

    return-void

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public constructor <init>()V
    .locals 1

    .prologue
    .line 54
    .local p0, "this":Lcom/almworks/sqlite4java/SQLiteJob;, "Lcom/almworks/sqlite4java/SQLiteJob<TT;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 65
    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Lcom/almworks/sqlite4java/SQLiteJob;->myLock:Ljava/lang/Object;

    .line 70
    const/4 v0, 0x0

    iput v0, p0, Lcom/almworks/sqlite4java/SQLiteJob;->myState:I

    return-void
.end method

.method private finishJob(Ljava/lang/Object;)V
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)V"
        }
    .end annotation

    .prologue
    .line 422
    .local p0, "this":Lcom/almworks/sqlite4java/SQLiteJob;, "Lcom/almworks/sqlite4java/SQLiteJob<TT;>;"
    .local p1, "result":Ljava/lang/Object;, "TT;"
    iget-object v4, p0, Lcom/almworks/sqlite4java/SQLiteJob;->myLock:Ljava/lang/Object;

    monitor-enter v4

    .line 423
    const/4 v3, 0x0

    :try_start_0
    iput-object v3, p0, Lcom/almworks/sqlite4java/SQLiteJob;->myConnection:Lcom/almworks/sqlite4java/SQLiteConnection;

    .line 424
    iget v3, p0, Lcom/almworks/sqlite4java/SQLiteJob;->myState:I

    const/4 v5, 0x1

    if-ne v3, v5, :cond_0

    .line 425
    const/4 v3, 0x2

    iput v3, p0, Lcom/almworks/sqlite4java/SQLiteJob;->myState:I

    .line 426
    iput-object p1, p0, Lcom/almworks/sqlite4java/SQLiteJob;->myResult:Ljava/lang/Object;

    .line 428
    :cond_0
    iget v2, p0, Lcom/almworks/sqlite4java/SQLiteJob;->myState:I

    .line 429
    .local v2, "state":I
    iget-object v1, p0, Lcom/almworks/sqlite4java/SQLiteJob;->myError:Ljava/lang/Throwable;

    .line 430
    .local v1, "error":Ljava/lang/Throwable;
    monitor-exit v4
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 432
    const/4 v3, 0x4

    if-ne v2, v3, :cond_4

    .line 433
    :try_start_1
    invoke-virtual {p0}, Lcom/almworks/sqlite4java/SQLiteJob;->jobCancelled()V
    :try_end_1
    .catch Ljava/lang/Throwable; {:try_start_1 .. :try_end_1} :catch_0

    .line 442
    :cond_1
    :goto_0
    :try_start_2
    invoke-virtual {p0, p1}, Lcom/almworks/sqlite4java/SQLiteJob;->jobFinished(Ljava/lang/Object;)V
    :try_end_2
    .catch Ljava/lang/Throwable; {:try_start_2 .. :try_end_2} :catch_1

    .line 447
    :cond_2
    iget-object v4, p0, Lcom/almworks/sqlite4java/SQLiteJob;->myLock:Ljava/lang/Object;

    monitor-enter v4

    .line 448
    const/4 v3, 0x0

    :try_start_3
    iput-object v3, p0, Lcom/almworks/sqlite4java/SQLiteJob;->myQueue:Lcom/almworks/sqlite4java/SQLiteQueue;

    .line 449
    iget-object v3, p0, Lcom/almworks/sqlite4java/SQLiteJob;->myLock:Ljava/lang/Object;

    invoke-virtual {v3}, Ljava/lang/Object;->notifyAll()V

    .line 450
    monitor-exit v4
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    .line 451
    invoke-static {}, Lcom/almworks/sqlite4java/Internal;->isFineLogging()Z

    move-result v3

    if-eqz v3, :cond_3

    .line 452
    const-string v3, "finished"

    invoke-static {p0, v3}, Lcom/almworks/sqlite4java/Internal;->logFine(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 454
    :cond_3
    return-void

    .line 430
    .end local v1    # "error":Ljava/lang/Throwable;
    .end local v2    # "state":I
    :catchall_0
    move-exception v3

    :try_start_4
    monitor-exit v4
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    throw v3

    .line 434
    .restart local v1    # "error":Ljava/lang/Throwable;
    .restart local v2    # "state":I
    :cond_4
    const/4 v3, 0x3

    if-ne v2, v3, :cond_1

    .line 435
    :try_start_5
    invoke-virtual {p0, v1}, Lcom/almworks/sqlite4java/SQLiteJob;->jobError(Ljava/lang/Throwable;)V
    :try_end_5
    .catch Ljava/lang/Throwable; {:try_start_5 .. :try_end_5} :catch_0

    goto :goto_0

    .line 437
    :catch_0
    move-exception v0

    .line 438
    .local v0, "e":Ljava/lang/Throwable;
    sget-object v3, Ljava/util/logging/Level;->WARNING:Ljava/util/logging/Level;

    const-string v4, "callback exception"

    invoke-static {v3, p0, v4, v0}, Lcom/almworks/sqlite4java/Internal;->log(Ljava/util/logging/Level;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Throwable;)V

    .line 439
    instance-of v3, v0, Ljava/lang/ThreadDeath;

    if-eqz v3, :cond_1

    check-cast v0, Ljava/lang/ThreadDeath;

    .end local v0    # "e":Ljava/lang/Throwable;
    throw v0

    .line 443
    :catch_1
    move-exception v0

    .line 444
    .restart local v0    # "e":Ljava/lang/Throwable;
    sget-object v3, Ljava/util/logging/Level;->WARNING:Ljava/util/logging/Level;

    const-string v4, "callback exception"

    invoke-static {v3, p0, v4, v0}, Lcom/almworks/sqlite4java/Internal;->log(Ljava/util/logging/Level;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Throwable;)V

    .line 445
    instance-of v3, v0, Ljava/lang/ThreadDeath;

    if-eqz v3, :cond_2

    check-cast v0, Ljava/lang/ThreadDeath;

    .end local v0    # "e":Ljava/lang/Throwable;
    throw v0

    .line 450
    :catchall_1
    move-exception v3

    :try_start_6
    monitor-exit v4
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_1

    throw v3
.end method

.method private processJobError(Ljava/lang/Throwable;)V
    .locals 3
    .param p1, "e"    # Ljava/lang/Throwable;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Throwable;
        }
    .end annotation

    .prologue
    .line 404
    .local p0, "this":Lcom/almworks/sqlite4java/SQLiteJob;, "Lcom/almworks/sqlite4java/SQLiteJob<TT;>;"
    iget-object v1, p0, Lcom/almworks/sqlite4java/SQLiteJob;->myLock:Ljava/lang/Object;

    monitor-enter v1

    .line 405
    :try_start_0
    instance-of v0, p1, Lcom/almworks/sqlite4java/SQLiteInterruptedException;

    if-eqz v0, :cond_1

    .line 406
    const/4 v0, 0x4

    iput v0, p0, Lcom/almworks/sqlite4java/SQLiteJob;->myState:I

    .line 407
    invoke-static {}, Lcom/almworks/sqlite4java/Internal;->isFineLogging()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 408
    sget-object v0, Ljava/util/logging/Level;->FINE:Ljava/util/logging/Level;

    const-string v2, "cancelled"

    invoke-static {v0, p0, v2, p1}, Lcom/almworks/sqlite4java/Internal;->log(Ljava/util/logging/Level;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Throwable;)V

    .line 416
    :cond_0
    monitor-exit v1

    .line 417
    return-void

    .line 411
    :cond_1
    sget-object v0, Ljava/util/logging/Level;->WARNING:Ljava/util/logging/Level;

    const-string v2, "job exception"

    invoke-static {v0, p0, v2, p1}, Lcom/almworks/sqlite4java/Internal;->log(Ljava/util/logging/Level;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Throwable;)V

    .line 412
    iput-object p1, p0, Lcom/almworks/sqlite4java/SQLiteJob;->myError:Ljava/lang/Throwable;

    .line 413
    const/4 v0, 0x3

    iput v0, p0, Lcom/almworks/sqlite4java/SQLiteJob;->myState:I

    .line 414
    throw p1

    .line 416
    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method private startJob(Lcom/almworks/sqlite4java/SQLiteConnection;Lcom/almworks/sqlite4java/SQLiteQueue;)Z
    .locals 4
    .param p1, "connection"    # Lcom/almworks/sqlite4java/SQLiteConnection;
    .param p2, "queue"    # Lcom/almworks/sqlite4java/SQLiteQueue;

    .prologue
    .local p0, "this":Lcom/almworks/sqlite4java/SQLiteJob;, "Lcom/almworks/sqlite4java/SQLiteJob<TT;>;"
    const/4 v1, 0x1

    .line 381
    iget-object v2, p0, Lcom/almworks/sqlite4java/SQLiteJob;->myLock:Ljava/lang/Object;

    monitor-enter v2

    .line 382
    :try_start_0
    iget v3, p0, Lcom/almworks/sqlite4java/SQLiteJob;->myState:I

    if-eqz v3, :cond_1

    .line 383
    iget v1, p0, Lcom/almworks/sqlite4java/SQLiteJob;->myState:I

    const/4 v3, 0x4

    if-eq v1, v3, :cond_0

    .line 384
    const-string v1, "was already executed"

    invoke-static {p0, v1}, Lcom/almworks/sqlite4java/Internal;->logWarn(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 386
    :cond_0
    const/4 v1, 0x0

    monitor-exit v2

    .line 400
    :goto_0
    return v1

    .line 388
    :cond_1
    const/4 v3, 0x1

    iput v3, p0, Lcom/almworks/sqlite4java/SQLiteJob;->myState:I

    .line 389
    iput-object p1, p0, Lcom/almworks/sqlite4java/SQLiteJob;->myConnection:Lcom/almworks/sqlite4java/SQLiteConnection;

    .line 390
    iput-object p2, p0, Lcom/almworks/sqlite4java/SQLiteJob;->myQueue:Lcom/almworks/sqlite4java/SQLiteQueue;

    .line 391
    monitor-exit v2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 392
    invoke-static {}, Lcom/almworks/sqlite4java/Internal;->isFineLogging()Z

    move-result v2

    if-eqz v2, :cond_2

    .line 393
    const-string v2, "started"

    invoke-static {p0, v2}, Lcom/almworks/sqlite4java/Internal;->logFine(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 396
    :cond_2
    :try_start_1
    invoke-virtual {p0, p1}, Lcom/almworks/sqlite4java/SQLiteJob;->jobStarted(Lcom/almworks/sqlite4java/SQLiteConnection;)V
    :try_end_1
    .catch Ljava/lang/Throwable; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_0

    .line 397
    :catch_0
    move-exception v0

    .line 398
    .local v0, "e":Ljava/lang/Throwable;
    sget-object v2, Ljava/util/logging/Level;->SEVERE:Ljava/util/logging/Level;

    const-string v3, "callback exception"

    invoke-static {v2, p0, v3, v0}, Lcom/almworks/sqlite4java/Internal;->log(Ljava/util/logging/Level;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Throwable;)V

    goto :goto_0

    .line 391
    .end local v0    # "e":Ljava/lang/Throwable;
    :catchall_0
    move-exception v1

    :try_start_2
    monitor-exit v2
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    throw v1
.end method


# virtual methods
.method public cancel()V
    .locals 1

    .prologue
    .line 254
    .local p0, "this":Lcom/almworks/sqlite4java/SQLiteJob;, "Lcom/almworks/sqlite4java/SQLiteJob<TT;>;"
    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lcom/almworks/sqlite4java/SQLiteJob;->cancel(Z)Z

    .line 255
    return-void
.end method

.method public cancel(Z)Z
    .locals 6
    .param p1, "mayInterruptIfRunning"    # Z

    .prologue
    .local p0, "this":Lcom/almworks/sqlite4java/SQLiteJob;, "Lcom/almworks/sqlite4java/SQLiteJob<TT;>;"
    const/4 v2, 0x0

    const/4 v3, 0x1

    .line 218
    iget-object v4, p0, Lcom/almworks/sqlite4java/SQLiteJob;->myLock:Ljava/lang/Object;

    monitor-enter v4

    .line 219
    :try_start_0
    invoke-virtual {p0}, Lcom/almworks/sqlite4java/SQLiteJob;->isDone()Z

    move-result v5

    if-eqz v5, :cond_0

    .line 220
    monitor-exit v4

    .line 245
    :goto_0
    return v2

    .line 222
    :cond_0
    iget v5, p0, Lcom/almworks/sqlite4java/SQLiteJob;->myState:I

    if-ne v5, v3, :cond_1

    if-nez p1, :cond_1

    .line 223
    monitor-exit v4

    goto :goto_0

    .line 228
    :catchall_0
    move-exception v2

    monitor-exit v4
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v2

    .line 225
    :cond_1
    :try_start_1
    sget-boolean v2, Lcom/almworks/sqlite4java/SQLiteJob;->$assertionsDisabled:Z

    if-nez v2, :cond_2

    iget-object v2, p0, Lcom/almworks/sqlite4java/SQLiteJob;->myConnection:Lcom/almworks/sqlite4java/SQLiteConnection;

    if-eqz v2, :cond_2

    iget v2, p0, Lcom/almworks/sqlite4java/SQLiteJob;->myState:I

    if-eq v2, v3, :cond_2

    new-instance v2, Ljava/lang/AssertionError;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    iget v5, p0, Lcom/almworks/sqlite4java/SQLiteJob;->myState:I

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v5, " "

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-object v5, p0, Lcom/almworks/sqlite4java/SQLiteJob;->myConnection:Lcom/almworks/sqlite4java/SQLiteConnection;

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/lang/AssertionError;-><init>(Ljava/lang/Object;)V

    throw v2

    .line 226
    :cond_2
    const/4 v2, 0x4

    iput v2, p0, Lcom/almworks/sqlite4java/SQLiteJob;->myState:I

    .line 227
    iget-object v0, p0, Lcom/almworks/sqlite4java/SQLiteJob;->myConnection:Lcom/almworks/sqlite4java/SQLiteConnection;

    .line 228
    .local v0, "connection":Lcom/almworks/sqlite4java/SQLiteConnection;
    monitor-exit v4
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 229
    if-eqz v0, :cond_4

    .line 230
    invoke-static {}, Lcom/almworks/sqlite4java/Internal;->isFineLogging()Z

    move-result v2

    if-eqz v2, :cond_3

    .line 231
    const-string v2, "interrupting"

    invoke-static {p0, v2}, Lcom/almworks/sqlite4java/Internal;->logFine(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 234
    :cond_3
    :try_start_2
    invoke-virtual {v0}, Lcom/almworks/sqlite4java/SQLiteConnection;->interrupt()V
    :try_end_2
    .catch Lcom/almworks/sqlite4java/SQLiteException; {:try_start_2 .. :try_end_2} :catch_0

    :goto_1
    move v2, v3

    .line 245
    goto :goto_0

    .line 235
    :catch_0
    move-exception v1

    .line 236
    .local v1, "e":Lcom/almworks/sqlite4java/SQLiteException;
    sget-object v2, Ljava/util/logging/Level;->WARNING:Ljava/util/logging/Level;

    const-string v4, "exception when interrupting"

    invoke-static {v2, p0, v4, v1}, Lcom/almworks/sqlite4java/Internal;->log(Ljava/util/logging/Level;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Throwable;)V

    goto :goto_1

    .line 239
    .end local v1    # "e":Lcom/almworks/sqlite4java/SQLiteException;
    :cond_4
    invoke-static {}, Lcom/almworks/sqlite4java/Internal;->isFineLogging()Z

    move-result v2

    if-eqz v2, :cond_5

    .line 240
    const-string v2, "cancelling"

    invoke-static {p0, v2}, Lcom/almworks/sqlite4java/Internal;->logFine(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 243
    :cond_5
    const/4 v2, 0x0

    invoke-direct {p0, v2}, Lcom/almworks/sqlite4java/SQLiteJob;->finishJob(Ljava/lang/Object;)V

    goto :goto_1
.end method

.method public complete()Ljava/lang/Object;
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TT;"
        }
    .end annotation

    .prologue
    .local p0, "this":Lcom/almworks/sqlite4java/SQLiteJob;, "Lcom/almworks/sqlite4java/SQLiteJob<TT;>;"
    const/4 v1, 0x0

    .line 346
    const-wide v2, 0x7fffffffffffffffL

    :try_start_0
    sget-object v4, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-virtual {p0, v2, v3, v4}, Lcom/almworks/sqlite4java/SQLiteJob;->get(JLjava/util/concurrent/TimeUnit;)Ljava/lang/Object;
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/util/concurrent/ExecutionException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/util/concurrent/TimeoutException; {:try_start_0 .. :try_end_0} :catch_2

    move-result-object v1

    .line 356
    :goto_0
    return-object v1

    .line 347
    :catch_0
    move-exception v0

    .line 348
    .local v0, "e":Ljava/lang/InterruptedException;
    sget-object v2, Ljava/util/logging/Level;->WARNING:Ljava/util/logging/Level;

    const-string v3, "complete() consumed exception"

    invoke-static {v2, p0, v3, v0}, Lcom/almworks/sqlite4java/Internal;->log(Ljava/util/logging/Level;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Throwable;)V

    .line 349
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Thread;->interrupt()V

    goto :goto_0

    .line 351
    .end local v0    # "e":Ljava/lang/InterruptedException;
    :catch_1
    move-exception v0

    .line 352
    .local v0, "e":Ljava/util/concurrent/ExecutionException;
    sget-object v2, Ljava/util/logging/Level;->WARNING:Ljava/util/logging/Level;

    const-string v3, "complete() consumed exception"

    invoke-static {v2, p0, v3, v0}, Lcom/almworks/sqlite4java/Internal;->log(Ljava/util/logging/Level;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Throwable;)V

    goto :goto_0

    .line 354
    .end local v0    # "e":Ljava/util/concurrent/ExecutionException;
    :catch_2
    move-exception v0

    .line 355
    .local v0, "e":Ljava/util/concurrent/TimeoutException;
    sget-object v2, Ljava/util/logging/Level;->WARNING:Ljava/util/logging/Level;

    const-string v3, "complete() timeout?"

    invoke-static {v2, p0, v3, v0}, Lcom/almworks/sqlite4java/Internal;->log(Ljava/util/logging/Level;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Throwable;)V

    goto :goto_0
.end method

.method execute(Lcom/almworks/sqlite4java/SQLiteConnection;Lcom/almworks/sqlite4java/SQLiteQueue;)V
    .locals 3
    .param p1, "connection"    # Lcom/almworks/sqlite4java/SQLiteConnection;
    .param p2, "queue"    # Lcom/almworks/sqlite4java/SQLiteQueue;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Throwable;
        }
    .end annotation

    .prologue
    .line 369
    .local p0, "this":Lcom/almworks/sqlite4java/SQLiteJob;, "Lcom/almworks/sqlite4java/SQLiteJob<TT;>;"
    invoke-direct {p0, p1, p2}, Lcom/almworks/sqlite4java/SQLiteJob;->startJob(Lcom/almworks/sqlite4java/SQLiteConnection;Lcom/almworks/sqlite4java/SQLiteQueue;)Z

    move-result v2

    if-nez v2, :cond_0

    .line 378
    :goto_0
    return-void

    .line 370
    :cond_0
    const/4 v1, 0x0

    .line 372
    .local v1, "result":Ljava/lang/Object;, "TT;"
    :try_start_0
    invoke-virtual {p0, p1}, Lcom/almworks/sqlite4java/SQLiteJob;->job(Lcom/almworks/sqlite4java/SQLiteConnection;)Ljava/lang/Object;
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result-object v1

    .line 376
    invoke-direct {p0, v1}, Lcom/almworks/sqlite4java/SQLiteJob;->finishJob(Ljava/lang/Object;)V

    goto :goto_0

    .line 373
    :catch_0
    move-exception v0

    .line 374
    .local v0, "e":Ljava/lang/Throwable;
    :try_start_1
    invoke-direct {p0, v0}, Lcom/almworks/sqlite4java/SQLiteJob;->processJobError(Ljava/lang/Throwable;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 376
    invoke-direct {p0, v1}, Lcom/almworks/sqlite4java/SQLiteJob;->finishJob(Ljava/lang/Object;)V

    goto :goto_0

    .end local v0    # "e":Ljava/lang/Throwable;
    :catchall_0
    move-exception v2

    invoke-direct {p0, v1}, Lcom/almworks/sqlite4java/SQLiteJob;->finishJob(Ljava/lang/Object;)V

    throw v2
.end method

.method public get()Ljava/lang/Object;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TT;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/InterruptedException;,
            Ljava/util/concurrent/ExecutionException;
        }
    .end annotation

    .prologue
    .line 283
    .local p0, "this":Lcom/almworks/sqlite4java/SQLiteJob;, "Lcom/almworks/sqlite4java/SQLiteJob<TT;>;"
    const-wide v2, 0x7fffffffffffffffL

    :try_start_0
    sget-object v1, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-virtual {p0, v2, v3, v1}, Lcom/almworks/sqlite4java/SQLiteJob;->get(JLjava/util/concurrent/TimeUnit;)Ljava/lang/Object;
    :try_end_0
    .catch Ljava/util/concurrent/TimeoutException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v1

    return-object v1

    .line 284
    :catch_0
    move-exception v0

    .line 285
    .local v0, "e":Ljava/util/concurrent/TimeoutException;
    new-instance v1, Ljava/lang/AssertionError;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " cannot happen"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/AssertionError;-><init>(Ljava/lang/Object;)V

    throw v1
.end method

.method public get(JLjava/util/concurrent/TimeUnit;)Ljava/lang/Object;
    .locals 17
    .param p1, "timeout"    # J
    .param p3, "unit"    # Ljava/util/concurrent/TimeUnit;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(J",
            "Ljava/util/concurrent/TimeUnit;",
            ")TT;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/InterruptedException;,
            Ljava/util/concurrent/ExecutionException;,
            Ljava/util/concurrent/TimeoutException;
        }
    .end annotation

    .prologue
    .line 302
    .local p0, "this":Lcom/almworks/sqlite4java/SQLiteJob;, "Lcom/almworks/sqlite4java/SQLiteJob<TT;>;"
    move-object/from16 v0, p0

    iget-object v10, v0, Lcom/almworks/sqlite4java/SQLiteJob;->myLock:Ljava/lang/Object;

    monitor-enter v10

    .line 303
    :try_start_0
    invoke-virtual/range {p0 .. p0}, Lcom/almworks/sqlite4java/SQLiteJob;->isDone()Z

    move-result v7

    if-nez v7, :cond_2

    .line 304
    move-object/from16 v0, p0

    iget-object v6, v0, Lcom/almworks/sqlite4java/SQLiteJob;->myQueue:Lcom/almworks/sqlite4java/SQLiteQueue;

    .line 305
    .local v6, "queue":Lcom/almworks/sqlite4java/SQLiteQueue;
    if-eqz v6, :cond_0

    invoke-virtual {v6}, Lcom/almworks/sqlite4java/SQLiteQueue;->isDatabaseThread()Z

    move-result v7

    if-eqz v7, :cond_0

    .line 306
    new-instance v7, Ljava/lang/IllegalStateException;

    const-string v11, "called from the database thread, would block forever"

    invoke-direct {v7, v11}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v7

    .line 333
    .end local v6    # "queue":Lcom/almworks/sqlite4java/SQLiteQueue;
    :catchall_0
    move-exception v7

    monitor-exit v10
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v7

    .line 308
    .restart local v6    # "queue":Lcom/almworks/sqlite4java/SQLiteQueue;
    :cond_0
    :try_start_1
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v4

    .line 310
    .local v4, "now":J
    const-wide/16 v12, 0x0

    cmp-long v7, p1, v12

    if-gtz v7, :cond_3

    .line 311
    const-wide/16 v12, 0x1

    sub-long v8, v4, v12

    .line 319
    .local v8, "stop":J
    :cond_1
    :goto_0
    cmp-long v7, v4, v8

    if-gez v7, :cond_2

    .line 320
    invoke-virtual/range {p0 .. p0}, Lcom/almworks/sqlite4java/SQLiteJob;->isDone()Z

    move-result v7

    if-eqz v7, :cond_4

    .line 327
    .end local v4    # "now":J
    .end local v6    # "queue":Lcom/almworks/sqlite4java/SQLiteQueue;
    .end local v8    # "stop":J
    :cond_2
    invoke-virtual/range {p0 .. p0}, Lcom/almworks/sqlite4java/SQLiteJob;->isDone()Z

    move-result v7

    if-eqz v7, :cond_7

    .line 328
    move-object/from16 v0, p0

    iget v7, v0, Lcom/almworks/sqlite4java/SQLiteJob;->myState:I

    const/4 v11, 0x3

    if-ne v7, v11, :cond_6

    .line 329
    new-instance v7, Ljava/util/concurrent/ExecutionException;

    move-object/from16 v0, p0

    iget-object v11, v0, Lcom/almworks/sqlite4java/SQLiteJob;->myError:Ljava/lang/Throwable;

    invoke-direct {v7, v11}, Ljava/util/concurrent/ExecutionException;-><init>(Ljava/lang/Throwable;)V

    throw v7

    .line 313
    .restart local v4    # "now":J
    .restart local v6    # "queue":Lcom/almworks/sqlite4java/SQLiteQueue;
    :cond_3
    move-object/from16 v0, p3

    move-wide/from16 v1, p1

    invoke-virtual {v0, v1, v2}, Ljava/util/concurrent/TimeUnit;->toMillis(J)J

    move-result-wide v12

    add-long v8, v4, v12

    .line 314
    .restart local v8    # "stop":J
    cmp-long v7, v8, v4

    if-gez v7, :cond_1

    .line 316
    const-wide v8, 0x7fffffffffffffffL

    goto :goto_0

    .line 321
    :cond_4
    invoke-static {}, Ljava/lang/Thread;->interrupted()Z

    move-result v7

    if-eqz v7, :cond_5

    .line 322
    new-instance v7, Ljava/lang/InterruptedException;

    invoke-direct {v7}, Ljava/lang/InterruptedException;-><init>()V

    throw v7

    .line 323
    :cond_5
    move-object/from16 v0, p0

    iget-object v7, v0, Lcom/almworks/sqlite4java/SQLiteJob;->myLock:Ljava/lang/Object;

    const-wide/16 v12, 0x3e8

    sub-long v14, v8, v4

    invoke-static {v12, v13, v14, v15}, Ljava/lang/Math;->min(JJ)J

    move-result-wide v12

    invoke-virtual {v7, v12, v13}, Ljava/lang/Object;->wait(J)V

    .line 324
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v4

    goto :goto_0

    .line 331
    .end local v4    # "now":J
    .end local v6    # "queue":Lcom/almworks/sqlite4java/SQLiteQueue;
    .end local v8    # "stop":J
    :cond_6
    move-object/from16 v0, p0

    iget-object v7, v0, Lcom/almworks/sqlite4java/SQLiteJob;->myResult:Ljava/lang/Object;

    monitor-exit v10

    return-object v7

    .line 333
    :cond_7
    monitor-exit v10
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 334
    new-instance v7, Ljava/util/concurrent/TimeoutException;

    invoke-direct {v7}, Ljava/util/concurrent/TimeoutException;-><init>()V

    throw v7
.end method

.method public getError()Ljava/lang/Throwable;
    .locals 2

    .prologue
    .line 171
    .local p0, "this":Lcom/almworks/sqlite4java/SQLiteJob;, "Lcom/almworks/sqlite4java/SQLiteJob<TT;>;"
    iget-object v1, p0, Lcom/almworks/sqlite4java/SQLiteJob;->myLock:Ljava/lang/Object;

    monitor-enter v1

    .line 172
    :try_start_0
    iget-object v0, p0, Lcom/almworks/sqlite4java/SQLiteJob;->myError:Ljava/lang/Throwable;

    monitor-exit v1

    return-object v0

    .line 173
    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method protected final getQueue()Lcom/almworks/sqlite4java/SQLiteQueue;
    .locals 2

    .prologue
    .line 160
    .local p0, "this":Lcom/almworks/sqlite4java/SQLiteJob;, "Lcom/almworks/sqlite4java/SQLiteJob<TT;>;"
    iget-object v1, p0, Lcom/almworks/sqlite4java/SQLiteJob;->myLock:Ljava/lang/Object;

    monitor-enter v1

    .line 161
    :try_start_0
    iget-object v0, p0, Lcom/almworks/sqlite4java/SQLiteJob;->myQueue:Lcom/almworks/sqlite4java/SQLiteQueue;

    monitor-exit v1

    return-object v0

    .line 162
    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method public isCancelled()Z
    .locals 3

    .prologue
    .line 264
    .local p0, "this":Lcom/almworks/sqlite4java/SQLiteJob;, "Lcom/almworks/sqlite4java/SQLiteJob<TT;>;"
    iget-object v1, p0, Lcom/almworks/sqlite4java/SQLiteJob;->myLock:Ljava/lang/Object;

    monitor-enter v1

    .line 265
    :try_start_0
    iget v0, p0, Lcom/almworks/sqlite4java/SQLiteJob;->myState:I

    const/4 v2, 0x4

    if-ne v0, v2, :cond_0

    const/4 v0, 0x1

    :goto_0
    monitor-exit v1

    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0

    .line 266
    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method public isDone()Z
    .locals 3

    .prologue
    .line 186
    .local p0, "this":Lcom/almworks/sqlite4java/SQLiteJob;, "Lcom/almworks/sqlite4java/SQLiteJob<TT;>;"
    iget-object v1, p0, Lcom/almworks/sqlite4java/SQLiteJob;->myLock:Ljava/lang/Object;

    monitor-enter v1

    .line 187
    :try_start_0
    iget v0, p0, Lcom/almworks/sqlite4java/SQLiteJob;->myState:I

    const/4 v2, 0x2

    if-eq v0, v2, :cond_0

    iget v0, p0, Lcom/almworks/sqlite4java/SQLiteJob;->myState:I

    const/4 v2, 0x4

    if-eq v0, v2, :cond_0

    iget v0, p0, Lcom/almworks/sqlite4java/SQLiteJob;->myState:I

    const/4 v2, 0x3

    if-ne v0, v2, :cond_1

    :cond_0
    const/4 v0, 0x1

    :goto_0
    monitor-exit v1

    return v0

    :cond_1
    const/4 v0, 0x0

    goto :goto_0

    .line 188
    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method protected abstract job(Lcom/almworks/sqlite4java/SQLiteConnection;)Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/almworks/sqlite4java/SQLiteConnection;",
            ")TT;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Throwable;
        }
    .end annotation
.end method

.method protected jobCancelled()V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Throwable;
        }
    .end annotation

    .prologue
    .line 153
    .local p0, "this":Lcom/almworks/sqlite4java/SQLiteJob;, "Lcom/almworks/sqlite4java/SQLiteJob<TT;>;"
    return-void
.end method

.method protected jobError(Ljava/lang/Throwable;)V
    .locals 0
    .param p1, "error"    # Ljava/lang/Throwable;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Throwable;
        }
    .end annotation

    .prologue
    .line 144
    .local p0, "this":Lcom/almworks/sqlite4java/SQLiteJob;, "Lcom/almworks/sqlite4java/SQLiteJob<TT;>;"
    return-void
.end method

.method protected jobFinished(Ljava/lang/Object;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Throwable;
        }
    .end annotation

    .prologue
    .line 134
    .local p0, "this":Lcom/almworks/sqlite4java/SQLiteJob;, "Lcom/almworks/sqlite4java/SQLiteJob<TT;>;"
    .local p1, "result":Ljava/lang/Object;, "TT;"
    return-void
.end method

.method protected jobStarted(Lcom/almworks/sqlite4java/SQLiteConnection;)V
    .locals 0
    .param p1, "connection"    # Lcom/almworks/sqlite4java/SQLiteConnection;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Throwable;
        }
    .end annotation

    .prologue
    .line 117
    .local p0, "this":Lcom/almworks/sqlite4java/SQLiteJob;, "Lcom/almworks/sqlite4java/SQLiteJob<TT;>;"
    return-void
.end method

.method public toString()Ljava/lang/String;
    .locals 3

    .prologue
    .line 362
    .local p0, "this":Lcom/almworks/sqlite4java/SQLiteJob;, "Lcom/almworks/sqlite4java/SQLiteJob<TT;>;"
    invoke-super {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    .line 363
    .local v1, "r":Ljava/lang/String;
    const/16 v2, 0x2e

    invoke-virtual {v1, v2}, Ljava/lang/String;->lastIndexOf(I)I

    move-result v0

    .line 364
    .local v0, "k":I
    if-ltz v0, :cond_0

    add-int/lit8 v2, v0, 0x1

    invoke-virtual {v1, v2}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v1

    .line 365
    :cond_0
    return-object v1
.end method
