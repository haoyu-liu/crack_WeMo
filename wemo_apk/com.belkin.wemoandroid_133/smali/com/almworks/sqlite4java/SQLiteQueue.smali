.class public Lcom/almworks/sqlite4java/SQLiteQueue;
.super Ljava/lang/Object;
.source "SQLiteQueue.java"


# static fields
.field static final synthetic $assertionsDisabled:Z

.field public static final DEFAULT_REINCARNATE_TIMEOUT:J = 0xbb8L


# instance fields
.field private myConnection:Lcom/almworks/sqlite4java/SQLiteConnection;

.field private myCurrentJob:Lcom/almworks/sqlite4java/SQLiteJob;

.field private final myDatabaseFile:Ljava/io/File;

.field protected myJobs:Ljava/util/Collection;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Collection",
            "<",
            "Lcom/almworks/sqlite4java/SQLiteJob;",
            ">;"
        }
    .end annotation
.end field

.field private final myLock:Ljava/lang/Object;

.field private myStopRequested:Z

.field private myStopRequired:Z

.field private volatile myThread:Ljava/lang/Thread;

.field private final myThreadFactory:Ljava/util/concurrent/ThreadFactory;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 77
    const-class v0, Lcom/almworks/sqlite4java/SQLiteQueue;

    invoke-virtual {v0}, Ljava/lang/Class;->desiredAssertionStatus()Z

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    sput-boolean v0, Lcom/almworks/sqlite4java/SQLiteQueue;->$assertionsDisabled:Z

    return-void

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public constructor <init>()V
    .locals 1

    .prologue
    .line 137
    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lcom/almworks/sqlite4java/SQLiteQueue;-><init>(Ljava/io/File;)V

    .line 138
    return-void
.end method

.method public constructor <init>(Ljava/io/File;)V
    .locals 1
    .param p1, "databaseFile"    # Ljava/io/File;

    .prologue
    .line 150
    invoke-static {}, Ljava/util/concurrent/Executors;->defaultThreadFactory()Ljava/util/concurrent/ThreadFactory;

    move-result-object v0

    invoke-direct {p0, p1, v0}, Lcom/almworks/sqlite4java/SQLiteQueue;-><init>(Ljava/io/File;Ljava/util/concurrent/ThreadFactory;)V

    .line 151
    return-void
.end method

.method public constructor <init>(Ljava/io/File;Ljava/util/concurrent/ThreadFactory;)V
    .locals 1
    .param p1, "databaseFile"    # Ljava/io/File;
    .param p2, "threadFactory"    # Ljava/util/concurrent/ThreadFactory;

    .prologue
    .line 159
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 101
    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Lcom/almworks/sqlite4java/SQLiteQueue;->myLock:Ljava/lang/Object;

    .line 160
    if-nez p2, :cond_0

    .line 161
    new-instance v0, Ljava/lang/NullPointerException;

    invoke-direct {v0}, Ljava/lang/NullPointerException;-><init>()V

    throw v0

    .line 162
    :cond_0
    iput-object p1, p0, Lcom/almworks/sqlite4java/SQLiteQueue;->myDatabaseFile:Ljava/io/File;

    .line 163
    iput-object p2, p0, Lcom/almworks/sqlite4java/SQLiteQueue;->myThreadFactory:Ljava/util/concurrent/ThreadFactory;

    .line 164
    return-void
.end method

.method static synthetic access$000(Lcom/almworks/sqlite4java/SQLiteQueue;)V
    .locals 0
    .param p0, "x0"    # Lcom/almworks/sqlite4java/SQLiteQueue;

    .prologue
    .line 77
    invoke-direct {p0}, Lcom/almworks/sqlite4java/SQLiteQueue;->runQueue()V

    return-void
.end method

.method static synthetic access$100(Lcom/almworks/sqlite4java/SQLiteQueue;)Ljava/lang/Object;
    .locals 1
    .param p0, "x0"    # Lcom/almworks/sqlite4java/SQLiteQueue;

    .prologue
    .line 77
    iget-object v0, p0, Lcom/almworks/sqlite4java/SQLiteQueue;->myLock:Ljava/lang/Object;

    return-object v0
.end method

.method static synthetic access$200(Lcom/almworks/sqlite4java/SQLiteQueue;)Z
    .locals 1
    .param p0, "x0"    # Lcom/almworks/sqlite4java/SQLiteQueue;

    .prologue
    .line 77
    iget-boolean v0, p0, Lcom/almworks/sqlite4java/SQLiteQueue;->myStopRequested:Z

    return v0
.end method

.method private cancelJobs(Ljava/util/List;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lcom/almworks/sqlite4java/SQLiteJob;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 672
    .local p1, "jobs":Ljava/util/List;, "Ljava/util/List<Lcom/almworks/sqlite4java/SQLiteJob;>;"
    if-eqz p1, :cond_0

    .line 673
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "i$":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/almworks/sqlite4java/SQLiteJob;

    .line 674
    .local v1, "job":Lcom/almworks/sqlite4java/SQLiteJob;
    const/4 v2, 0x1

    invoke-virtual {v1, v2}, Lcom/almworks/sqlite4java/SQLiteJob;->cancel(Z)Z

    goto :goto_0

    .line 677
    .end local v0    # "i$":Ljava/util/Iterator;
    .end local v1    # "job":Lcom/almworks/sqlite4java/SQLiteJob;
    :cond_0
    return-void
.end method

.method private queueFunction()V
    .locals 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Throwable;
        }
    .end annotation

    .prologue
    const/4 v2, 0x0

    .line 637
    invoke-static {}, Lcom/almworks/sqlite4java/Internal;->isFineLogging()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 638
    const-string v1, "started"

    invoke-static {p0, v1}, Lcom/almworks/sqlite4java/Internal;->logFine(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 639
    :cond_0
    iget-object v1, p0, Lcom/almworks/sqlite4java/SQLiteQueue;->myConnection:Lcom/almworks/sqlite4java/SQLiteConnection;

    invoke-virtual {p0, v1}, Lcom/almworks/sqlite4java/SQLiteQueue;->disposeConnection(Lcom/almworks/sqlite4java/SQLiteConnection;)V

    .line 640
    iput-object v2, p0, Lcom/almworks/sqlite4java/SQLiteQueue;->myConnection:Lcom/almworks/sqlite4java/SQLiteConnection;

    .line 641
    invoke-virtual {p0}, Lcom/almworks/sqlite4java/SQLiteQueue;->openConnection()Lcom/almworks/sqlite4java/SQLiteConnection;

    move-result-object v1

    iput-object v1, p0, Lcom/almworks/sqlite4java/SQLiteQueue;->myConnection:Lcom/almworks/sqlite4java/SQLiteConnection;

    .line 642
    iget-object v1, p0, Lcom/almworks/sqlite4java/SQLiteQueue;->myConnection:Lcom/almworks/sqlite4java/SQLiteConnection;

    invoke-virtual {p0, v1}, Lcom/almworks/sqlite4java/SQLiteQueue;->initConnection(Lcom/almworks/sqlite4java/SQLiteConnection;)V

    .line 645
    :goto_0
    invoke-static {}, Ljava/lang/Thread;->interrupted()Z

    move-result v1

    if-eqz v1, :cond_1

    .line 646
    new-instance v1, Ljava/lang/InterruptedException;

    invoke-direct {v1}, Ljava/lang/InterruptedException;-><init>()V

    throw v1

    .line 648
    :cond_1
    iget-object v2, p0, Lcom/almworks/sqlite4java/SQLiteQueue;->myLock:Ljava/lang/Object;

    monitor-enter v2

    .line 649
    const/4 v1, 0x0

    :try_start_0
    iput-object v1, p0, Lcom/almworks/sqlite4java/SQLiteQueue;->myCurrentJob:Lcom/almworks/sqlite4java/SQLiteJob;

    .line 650
    iget-object v1, p0, Lcom/almworks/sqlite4java/SQLiteQueue;->myLock:Ljava/lang/Object;

    invoke-virtual {v1}, Ljava/lang/Object;->notify()V

    .line 652
    :goto_1
    iget-boolean v1, p0, Lcom/almworks/sqlite4java/SQLiteQueue;->myStopRequested:Z

    if-eqz v1, :cond_4

    iget-boolean v1, p0, Lcom/almworks/sqlite4java/SQLiteQueue;->myStopRequired:Z

    if-nez v1, :cond_2

    invoke-virtual {p0}, Lcom/almworks/sqlite4java/SQLiteQueue;->isJobQueueEmpty()Z

    move-result v1

    if-eqz v1, :cond_4

    .line 653
    :cond_2
    invoke-static {}, Lcom/almworks/sqlite4java/Internal;->isFineLogging()Z

    move-result v1

    if-eqz v1, :cond_3

    .line 654
    const-string v1, "thread exiting"

    invoke-static {p0, v1}, Lcom/almworks/sqlite4java/Internal;->logFine(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 656
    :cond_3
    monitor-exit v2

    return-void

    .line 658
    :cond_4
    invoke-virtual {p0}, Lcom/almworks/sqlite4java/SQLiteQueue;->selectJob()Lcom/almworks/sqlite4java/SQLiteJob;

    move-result-object v0

    .line 659
    .local v0, "job":Lcom/almworks/sqlite4java/SQLiteJob;
    if-eqz v0, :cond_5

    .line 660
    iput-object v0, p0, Lcom/almworks/sqlite4java/SQLiteQueue;->myCurrentJob:Lcom/almworks/sqlite4java/SQLiteJob;

    .line 666
    monitor-exit v2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 667
    invoke-virtual {p0, v0}, Lcom/almworks/sqlite4java/SQLiteQueue;->executeJob(Lcom/almworks/sqlite4java/SQLiteJob;)V

    goto :goto_0

    .line 663
    :cond_5
    :try_start_1
    iget-object v1, p0, Lcom/almworks/sqlite4java/SQLiteQueue;->myLock:Ljava/lang/Object;

    const-wide/16 v4, 0x3e8

    invoke-virtual {v1, v4, v5}, Ljava/lang/Object;->wait(J)V

    .line 664
    iget-object v1, p0, Lcom/almworks/sqlite4java/SQLiteQueue;->myLock:Ljava/lang/Object;

    invoke-virtual {v1}, Ljava/lang/Object;->notify()V

    goto :goto_1

    .line 666
    .end local v0    # "job":Lcom/almworks/sqlite4java/SQLiteJob;
    :catchall_0
    move-exception v1

    monitor-exit v2
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v1
.end method

.method private runQueue()V
    .locals 3

    .prologue
    .line 623
    :try_start_0
    invoke-direct {p0}, Lcom/almworks/sqlite4java/SQLiteQueue;->queueFunction()V
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_1
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 632
    invoke-direct {p0}, Lcom/almworks/sqlite4java/SQLiteQueue;->threadStopped()V

    .line 634
    :goto_0
    return-void

    .line 624
    :catch_0
    move-exception v0

    .line 625
    .local v0, "e":Ljava/lang/InterruptedException;
    :try_start_1
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Thread;->interrupt()V

    .line 626
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " interrupted"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1, v0}, Lcom/almworks/sqlite4java/Internal;->logWarn(Ljava/lang/Object;Ljava/lang/Object;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 632
    invoke-direct {p0}, Lcom/almworks/sqlite4java/SQLiteQueue;->threadStopped()V

    goto :goto_0

    .line 627
    .end local v0    # "e":Ljava/lang/InterruptedException;
    :catch_1
    move-exception v0

    .line 628
    .local v0, "e":Ljava/lang/Throwable;
    :try_start_2
    sget-object v1, Ljava/util/logging/Level;->SEVERE:Ljava/util/logging/Level;

    const-string v2, "error running job queue"

    invoke-static {v1, p0, v2, v0}, Lcom/almworks/sqlite4java/Internal;->log(Ljava/util/logging/Level;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Throwable;)V

    .line 629
    instance-of v1, v0, Ljava/lang/ThreadDeath;

    if-eqz v1, :cond_0

    .line 630
    check-cast v0, Ljava/lang/ThreadDeath;

    .end local v0    # "e":Ljava/lang/Throwable;
    throw v0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 632
    :catchall_0
    move-exception v1

    invoke-direct {p0}, Lcom/almworks/sqlite4java/SQLiteQueue;->threadStopped()V

    throw v1

    .restart local v0    # "e":Ljava/lang/Throwable;
    :cond_0
    invoke-direct {p0}, Lcom/almworks/sqlite4java/SQLiteQueue;->threadStopped()V

    goto :goto_0
.end method

.method private threadStopped()V
    .locals 6

    .prologue
    const/4 v1, 0x1

    const/4 v4, 0x0

    .line 680
    sget-boolean v2, Lcom/almworks/sqlite4java/SQLiteQueue;->$assertionsDisabled:Z

    if-nez v2, :cond_0

    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v2

    iget-object v3, p0, Lcom/almworks/sqlite4java/SQLiteQueue;->myThread:Ljava/lang/Thread;

    if-eq v2, v3, :cond_0

    new-instance v2, Ljava/lang/AssertionError;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, " "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-object v4, p0, Lcom/almworks/sqlite4java/SQLiteQueue;->myThread:Ljava/lang/Thread;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/lang/AssertionError;-><init>(Ljava/lang/Object;)V

    throw v2

    .line 681
    :cond_0
    iget-object v2, p0, Lcom/almworks/sqlite4java/SQLiteQueue;->myConnection:Lcom/almworks/sqlite4java/SQLiteConnection;

    invoke-virtual {p0, v2}, Lcom/almworks/sqlite4java/SQLiteQueue;->disposeConnection(Lcom/almworks/sqlite4java/SQLiteConnection;)V

    .line 682
    iput-object v4, p0, Lcom/almworks/sqlite4java/SQLiteQueue;->myConnection:Lcom/almworks/sqlite4java/SQLiteConnection;

    .line 684
    const/4 v0, 0x0

    .line 685
    .local v0, "droppedJobs":Ljava/util/List;, "Ljava/util/List<Lcom/almworks/sqlite4java/SQLiteJob;>;"
    iget-object v3, p0, Lcom/almworks/sqlite4java/SQLiteQueue;->myLock:Ljava/lang/Object;

    monitor-enter v3

    .line 686
    :try_start_0
    iget-boolean v2, p0, Lcom/almworks/sqlite4java/SQLiteQueue;->myStopRequested:Z

    if-nez v2, :cond_4

    .line 687
    .local v1, "reincarnate":Z
    :goto_0
    if-eqz v1, :cond_1

    invoke-virtual {p0}, Lcom/almworks/sqlite4java/SQLiteQueue;->isReincarnationPossible()Z

    move-result v2

    if-nez v2, :cond_1

    .line 688
    sget-object v2, Ljava/util/logging/Level;->SEVERE:Ljava/util/logging/Level;

    const-string v4, "stopped abnormally, reincarnation is not possible for in-memory database"

    const/4 v5, 0x0

    invoke-static {v2, p0, v4, v5}, Lcom/almworks/sqlite4java/Internal;->log(Ljava/util/logging/Level;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Throwable;)V

    .line 689
    const/4 v1, 0x0

    .line 690
    const/4 v2, 0x1

    iput-boolean v2, p0, Lcom/almworks/sqlite4java/SQLiteQueue;->myStopRequested:Z

    .line 692
    :cond_1
    if-nez v1, :cond_2

    .line 693
    invoke-virtual {p0}, Lcom/almworks/sqlite4java/SQLiteQueue;->removeJobsClearQueue()Ljava/util/List;

    move-result-object v0

    .line 695
    :cond_2
    const/4 v2, 0x0

    iput-object v2, p0, Lcom/almworks/sqlite4java/SQLiteQueue;->myThread:Ljava/lang/Thread;

    .line 696
    monitor-exit v3
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 697
    if-nez v1, :cond_5

    .line 698
    invoke-direct {p0, v0}, Lcom/almworks/sqlite4java/SQLiteQueue;->cancelJobs(Ljava/util/List;)V

    .line 699
    invoke-static {}, Lcom/almworks/sqlite4java/Internal;->isFineLogging()Z

    move-result v2

    if-eqz v2, :cond_3

    .line 700
    const-string v2, "stopped"

    invoke-static {p0, v2}, Lcom/almworks/sqlite4java/Internal;->logFine(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 705
    :cond_3
    :goto_1
    return-void

    .line 686
    .end local v1    # "reincarnate":Z
    :cond_4
    const/4 v1, 0x0

    goto :goto_0

    .line 696
    :catchall_0
    move-exception v2

    :try_start_1
    monitor-exit v3
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v2

    .line 703
    .restart local v1    # "reincarnate":Z
    :cond_5
    invoke-virtual {p0}, Lcom/almworks/sqlite4java/SQLiteQueue;->getReincarnationTimeout()J

    move-result-wide v2

    invoke-virtual {p0, v2, v3}, Lcom/almworks/sqlite4java/SQLiteQueue;->reincarnate(J)V

    goto :goto_1
.end method


# virtual methods
.method protected addJob(Lcom/almworks/sqlite4java/SQLiteJob;)V
    .locals 2
    .param p1, "job"    # Lcom/almworks/sqlite4java/SQLiteJob;

    .prologue
    .line 384
    sget-boolean v1, Lcom/almworks/sqlite4java/SQLiteQueue;->$assertionsDisabled:Z

    if-nez v1, :cond_0

    iget-object v1, p0, Lcom/almworks/sqlite4java/SQLiteQueue;->myLock:Ljava/lang/Object;

    invoke-static {v1}, Ljava/lang/Thread;->holdsLock(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_0

    new-instance v1, Ljava/lang/AssertionError;

    invoke-direct {v1, p1}, Ljava/lang/AssertionError;-><init>(Ljava/lang/Object;)V

    throw v1

    .line 385
    :cond_0
    iget-object v0, p0, Lcom/almworks/sqlite4java/SQLiteQueue;->myJobs:Ljava/util/Collection;

    .line 386
    .local v0, "jobs":Ljava/util/Collection;, "Ljava/util/Collection<Lcom/almworks/sqlite4java/SQLiteJob;>;"
    if-nez v0, :cond_1

    .line 387
    invoke-virtual {p0}, Lcom/almworks/sqlite4java/SQLiteQueue;->createJobCollection()Ljava/util/Collection;

    move-result-object v0

    iput-object v0, p0, Lcom/almworks/sqlite4java/SQLiteQueue;->myJobs:Ljava/util/Collection;

    .line 389
    :cond_1
    invoke-interface {v0, p1}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    .line 390
    return-void
.end method

.method protected afterExecute(Lcom/almworks/sqlite4java/SQLiteJob;)V
    .locals 1
    .param p1, "job"    # Lcom/almworks/sqlite4java/SQLiteJob;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Throwable;
        }
    .end annotation

    .prologue
    .line 551
    sget-boolean v0, Lcom/almworks/sqlite4java/SQLiteQueue;->$assertionsDisabled:Z

    if-nez v0, :cond_0

    invoke-virtual {p1}, Lcom/almworks/sqlite4java/SQLiteJob;->isDone()Z

    move-result v0

    if-nez v0, :cond_0

    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0, p1}, Ljava/lang/AssertionError;-><init>(Ljava/lang/Object;)V

    throw v0

    .line 552
    :cond_0
    invoke-virtual {p1}, Lcom/almworks/sqlite4java/SQLiteJob;->isCancelled()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 553
    invoke-virtual {p0}, Lcom/almworks/sqlite4java/SQLiteQueue;->rollback()V

    .line 555
    :cond_1
    return-void
.end method

.method protected createJobCollection()Ljava/util/Collection;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Collection",
            "<",
            "Lcom/almworks/sqlite4java/SQLiteJob;",
            ">;"
        }
    .end annotation

    .prologue
    .line 400
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    return-object v0
.end method

.method protected disposeConnection(Lcom/almworks/sqlite4java/SQLiteConnection;)V
    .locals 3
    .param p1, "connection"    # Lcom/almworks/sqlite4java/SQLiteConnection;

    .prologue
    .line 491
    if-eqz p1, :cond_1

    .line 492
    :try_start_0
    invoke-static {}, Lcom/almworks/sqlite4java/Internal;->isFineLogging()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 493
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "disposing "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {p0, v1}, Lcom/almworks/sqlite4java/Internal;->logFine(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 495
    :cond_0
    invoke-virtual {p1}, Lcom/almworks/sqlite4java/SQLiteConnection;->dispose()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 500
    :cond_1
    :goto_0
    return-void

    .line 497
    :catch_0
    move-exception v0

    .line 498
    .local v0, "e":Ljava/lang/Exception;
    sget-object v1, Ljava/util/logging/Level;->SEVERE:Ljava/util/logging/Level;

    const-string v2, "error disposing connection"

    invoke-static {v1, p0, v2, v0}, Lcom/almworks/sqlite4java/Internal;->log(Ljava/util/logging/Level;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Throwable;)V

    goto :goto_0
.end method

.method public execute(Lcom/almworks/sqlite4java/SQLiteJob;)Lcom/almworks/sqlite4java/SQLiteJob;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            "J:",
            "Lcom/almworks/sqlite4java/SQLiteJob",
            "<TT;>;>(TJ;)TJ;"
        }
    .end annotation

    .prologue
    .line 319
    .local p1, "job":Lcom/almworks/sqlite4java/SQLiteJob;, "TJ;"
    if-nez p1, :cond_0

    .line 320
    new-instance v1, Ljava/lang/NullPointerException;

    invoke-direct {v1}, Ljava/lang/NullPointerException;-><init>()V

    throw v1

    .line 321
    :cond_0
    const/4 v0, 0x0

    .line 322
    .local v0, "cancel":Z
    iget-object v2, p0, Lcom/almworks/sqlite4java/SQLiteQueue;->myLock:Ljava/lang/Object;

    monitor-enter v2

    .line 323
    :try_start_0
    iget-boolean v1, p0, Lcom/almworks/sqlite4java/SQLiteQueue;->myStopRequested:Z

    if-eqz v1, :cond_2

    .line 324
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "job not executed: "

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {p0, v1}, Lcom/almworks/sqlite4java/Internal;->logFine(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 325
    const/4 v0, 0x1

    .line 333
    :goto_0
    monitor-exit v2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 334
    if-eqz v0, :cond_1

    .line 335
    const/4 v1, 0x1

    invoke-virtual {p1, v1}, Lcom/almworks/sqlite4java/SQLiteJob;->cancel(Z)Z

    .line 337
    :cond_1
    return-object p1

    .line 327
    :cond_2
    :try_start_1
    invoke-static {}, Lcom/almworks/sqlite4java/Internal;->isFineLogging()Z

    move-result v1

    if-eqz v1, :cond_3

    .line 328
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "queueing "

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {p0, v1}, Lcom/almworks/sqlite4java/Internal;->logFine(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 330
    :cond_3
    invoke-virtual {p0, p1}, Lcom/almworks/sqlite4java/SQLiteQueue;->addJob(Lcom/almworks/sqlite4java/SQLiteJob;)V

    .line 331
    iget-object v1, p0, Lcom/almworks/sqlite4java/SQLiteQueue;->myLock:Ljava/lang/Object;

    invoke-virtual {v1}, Ljava/lang/Object;->notify()V

    goto :goto_0

    .line 333
    :catchall_0
    move-exception v1

    monitor-exit v2
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v1
.end method

.method protected executeJob(Lcom/almworks/sqlite4java/SQLiteJob;)V
    .locals 5
    .param p1, "job"    # Lcom/almworks/sqlite4java/SQLiteJob;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Throwable;
        }
    .end annotation

    .prologue
    .line 526
    if-nez p1, :cond_1

    .line 542
    :cond_0
    :goto_0
    return-void

    .line 527
    :cond_1
    iget-object v0, p0, Lcom/almworks/sqlite4java/SQLiteQueue;->myConnection:Lcom/almworks/sqlite4java/SQLiteConnection;

    .line 528
    .local v0, "connection":Lcom/almworks/sqlite4java/SQLiteConnection;
    if-nez v0, :cond_2

    .line 529
    new-instance v2, Ljava/lang/IllegalStateException;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v3, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, ": executeJob: no connection"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 531
    :cond_2
    :try_start_0
    invoke-static {}, Lcom/almworks/sqlite4java/Internal;->isFineLogging()Z

    move-result v2

    if-eqz v2, :cond_3

    .line 532
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "executing "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {p0, v2}, Lcom/almworks/sqlite4java/Internal;->logFine(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 534
    :cond_3
    invoke-virtual {p1, v0, p0}, Lcom/almworks/sqlite4java/SQLiteJob;->execute(Lcom/almworks/sqlite4java/SQLiteConnection;Lcom/almworks/sqlite4java/SQLiteQueue;)V

    .line 535
    invoke-virtual {p0, p1}, Lcom/almworks/sqlite4java/SQLiteQueue;->afterExecute(Lcom/almworks/sqlite4java/SQLiteJob;)V

    .line 536
    invoke-static {}, Lcom/almworks/sqlite4java/Internal;->isFineLogging()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 537
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "finished executing "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {p0, v2}, Lcom/almworks/sqlite4java/Internal;->logFine(Ljava/lang/Object;Ljava/lang/Object;)V
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 539
    :catch_0
    move-exception v1

    .line 540
    .local v1, "e":Ljava/lang/Throwable;
    invoke-virtual {p0, p1, v1}, Lcom/almworks/sqlite4java/SQLiteQueue;->handleJobException(Lcom/almworks/sqlite4java/SQLiteJob;Ljava/lang/Throwable;)V

    goto :goto_0
.end method

.method public flush()Lcom/almworks/sqlite4java/SQLiteQueue;
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/InterruptedException;
        }
    .end annotation

    .prologue
    .line 347
    iget-object v1, p0, Lcom/almworks/sqlite4java/SQLiteQueue;->myLock:Ljava/lang/Object;

    monitor-enter v1

    .line 348
    :goto_0
    :try_start_0
    invoke-virtual {p0}, Lcom/almworks/sqlite4java/SQLiteQueue;->isJobQueueEmpty()Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/almworks/sqlite4java/SQLiteQueue;->myCurrentJob:Lcom/almworks/sqlite4java/SQLiteJob;

    if-eqz v0, :cond_1

    .line 349
    :cond_0
    iget-object v0, p0, Lcom/almworks/sqlite4java/SQLiteQueue;->myLock:Ljava/lang/Object;

    const-wide/16 v2, 0x3e8

    invoke-virtual {v0, v2, v3}, Ljava/lang/Object;->wait(J)V

    .line 350
    iget-object v0, p0, Lcom/almworks/sqlite4java/SQLiteQueue;->myLock:Ljava/lang/Object;

    invoke-virtual {v0}, Ljava/lang/Object;->notify()V

    goto :goto_0

    .line 352
    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0

    :cond_1
    :try_start_1
    monitor-exit v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 353
    return-object p0
.end method

.method public getDatabaseFile()Ljava/io/File;
    .locals 1

    .prologue
    .line 176
    iget-object v0, p0, Lcom/almworks/sqlite4java/SQLiteQueue;->myDatabaseFile:Ljava/io/File;

    return-object v0
.end method

.method protected getReincarnationTimeout()J
    .locals 2

    .prologue
    .line 575
    const-wide/16 v0, 0xbb8

    return-wide v0
.end method

.method protected handleJobException(Lcom/almworks/sqlite4java/SQLiteJob;Ljava/lang/Throwable;)V
    .locals 1
    .param p1, "job"    # Lcom/almworks/sqlite4java/SQLiteJob;
    .param p2, "e"    # Ljava/lang/Throwable;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Throwable;
        }
    .end annotation

    .prologue
    .line 565
    invoke-virtual {p0}, Lcom/almworks/sqlite4java/SQLiteQueue;->rollback()V

    .line 566
    instance-of v0, p2, Ljava/lang/ThreadDeath;

    if-eqz v0, :cond_0

    check-cast p2, Ljava/lang/ThreadDeath;

    .end local p2    # "e":Ljava/lang/Throwable;
    throw p2

    .line 567
    .restart local p2    # "e":Ljava/lang/Throwable;
    :cond_0
    return-void
.end method

.method protected initConnection(Lcom/almworks/sqlite4java/SQLiteConnection;)V
    .locals 0
    .param p1, "connection"    # Lcom/almworks/sqlite4java/SQLiteConnection;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/almworks/sqlite4java/SQLiteException;
        }
    .end annotation

    .prologue
    .line 482
    return-void
.end method

.method public isDatabaseThread()Z
    .locals 2

    .prologue
    .line 373
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v0

    iget-object v1, p0, Lcom/almworks/sqlite4java/SQLiteQueue;->myThread:Ljava/lang/Thread;

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method protected isJobQueueEmpty()Z
    .locals 1

    .prologue
    .line 411
    sget-boolean v0, Lcom/almworks/sqlite4java/SQLiteQueue;->$assertionsDisabled:Z

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/almworks/sqlite4java/SQLiteQueue;->myLock:Ljava/lang/Object;

    invoke-static {v0}, Ljava/lang/Thread;->holdsLock(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0

    .line 412
    :cond_0
    iget-object v0, p0, Lcom/almworks/sqlite4java/SQLiteQueue;->myJobs:Ljava/util/Collection;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/almworks/sqlite4java/SQLiteQueue;->myJobs:Ljava/util/Collection;

    invoke-interface {v0}, Ljava/util/Collection;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_2

    :cond_1
    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_2
    const/4 v0, 0x0

    goto :goto_0
.end method

.method protected isReincarnationPossible()Z
    .locals 4

    .prologue
    .line 584
    iget-object v0, p0, Lcom/almworks/sqlite4java/SQLiteQueue;->myDatabaseFile:Ljava/io/File;

    if-eqz v0, :cond_0

    invoke-virtual {p0}, Lcom/almworks/sqlite4java/SQLiteQueue;->getReincarnationTimeout()J

    move-result-wide v0

    const-wide/16 v2, 0x0

    cmp-long v0, v0, v2

    if-ltz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public isStopped()Z
    .locals 2

    .prologue
    .line 362
    iget-object v1, p0, Lcom/almworks/sqlite4java/SQLiteQueue;->myLock:Ljava/lang/Object;

    monitor-enter v1

    .line 363
    :try_start_0
    iget-boolean v0, p0, Lcom/almworks/sqlite4java/SQLiteQueue;->myStopRequested:Z

    monitor-exit v1

    return v0

    .line 364
    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method public join()Lcom/almworks/sqlite4java/SQLiteQueue;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/InterruptedException;
        }
    .end annotation

    .prologue
    .line 283
    invoke-static {}, Lcom/almworks/sqlite4java/Internal;->isFineLogging()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 284
    const-string v1, "waiting for queue to stop"

    invoke-static {p0, v1}, Lcom/almworks/sqlite4java/Internal;->logFine(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 286
    :cond_0
    iget-object v0, p0, Lcom/almworks/sqlite4java/SQLiteQueue;->myThread:Ljava/lang/Thread;

    .line 287
    .local v0, "thread":Ljava/lang/Thread;
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v1

    if-ne v0, v1, :cond_1

    .line 288
    new-instance v1, Ljava/lang/IllegalStateException;

    invoke-direct {v1}, Ljava/lang/IllegalStateException;-><init>()V

    throw v1

    .line 290
    :cond_1
    if-eqz v0, :cond_2

    .line 291
    invoke-virtual {v0}, Ljava/lang/Thread;->join()V

    .line 293
    :cond_2
    return-object p0
.end method

.method protected openConnection()Lcom/almworks/sqlite4java/SQLiteConnection;
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/almworks/sqlite4java/SQLiteException;
        }
    .end annotation

    .prologue
    .line 459
    new-instance v0, Lcom/almworks/sqlite4java/SQLiteConnection;

    iget-object v2, p0, Lcom/almworks/sqlite4java/SQLiteQueue;->myDatabaseFile:Ljava/io/File;

    invoke-direct {v0, v2}, Lcom/almworks/sqlite4java/SQLiteConnection;-><init>(Ljava/io/File;)V

    .line 460
    .local v0, "connection":Lcom/almworks/sqlite4java/SQLiteConnection;
    invoke-static {}, Lcom/almworks/sqlite4java/Internal;->isFineLogging()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 461
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "opening "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {p0, v2}, Lcom/almworks/sqlite4java/Internal;->logFine(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 464
    :cond_0
    :try_start_0
    invoke-virtual {v0}, Lcom/almworks/sqlite4java/SQLiteConnection;->open()Lcom/almworks/sqlite4java/SQLiteConnection;
    :try_end_0
    .catch Lcom/almworks/sqlite4java/SQLiteException; {:try_start_0 .. :try_end_0} :catch_0

    .line 469
    return-object v0

    .line 465
    :catch_0
    move-exception v1

    .line 466
    .local v1, "e":Lcom/almworks/sqlite4java/SQLiteException;
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "cannot open "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2, v1}, Lcom/almworks/sqlite4java/Internal;->logWarn(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 467
    throw v1
.end method

.method protected reincarnate(J)V
    .locals 3
    .param p1, "reincarnateTimeout"    # J

    .prologue
    .line 594
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "stopped abnormally, reincarnating in "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1, p2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "ms"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {p0, v1}, Lcom/almworks/sqlite4java/Internal;->logWarn(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 595
    iget-object v1, p0, Lcom/almworks/sqlite4java/SQLiteQueue;->myThreadFactory:Ljava/util/concurrent/ThreadFactory;

    new-instance v2, Lcom/almworks/sqlite4java/SQLiteQueue$2;

    invoke-direct {v2, p0, p1, p2}, Lcom/almworks/sqlite4java/SQLiteQueue$2;-><init>(Lcom/almworks/sqlite4java/SQLiteQueue;J)V

    invoke-interface {v1, v2}, Ljava/util/concurrent/ThreadFactory;->newThread(Ljava/lang/Runnable;)Ljava/lang/Thread;

    move-result-object v0

    .line 616
    .local v0, "reincarnator":Ljava/lang/Thread;
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "reincarnate "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " in "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1, p2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "ms"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/Thread;->setName(Ljava/lang/String;)V

    .line 617
    invoke-virtual {v0}, Ljava/lang/Thread;->start()V

    .line 618
    return-void
.end method

.method protected removeJobsClearQueue()Ljava/util/List;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Lcom/almworks/sqlite4java/SQLiteJob;",
            ">;"
        }
    .end annotation

    .prologue
    .line 425
    sget-boolean v1, Lcom/almworks/sqlite4java/SQLiteQueue;->$assertionsDisabled:Z

    if-nez v1, :cond_0

    iget-object v1, p0, Lcom/almworks/sqlite4java/SQLiteQueue;->myLock:Ljava/lang/Object;

    invoke-static {v1}, Ljava/lang/Thread;->holdsLock(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_0

    new-instance v1, Ljava/lang/AssertionError;

    invoke-direct {v1}, Ljava/lang/AssertionError;-><init>()V

    throw v1

    .line 426
    :cond_0
    iget-object v1, p0, Lcom/almworks/sqlite4java/SQLiteQueue;->myJobs:Ljava/util/Collection;

    if-nez v1, :cond_1

    invoke-static {}, Ljava/util/Collections;->emptyList()Ljava/util/List;

    move-result-object v0

    .line 429
    :goto_0
    return-object v0

    .line 427
    :cond_1
    new-instance v0, Ljava/util/ArrayList;

    iget-object v1, p0, Lcom/almworks/sqlite4java/SQLiteQueue;->myJobs:Ljava/util/Collection;

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 428
    .local v0, "r":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/almworks/sqlite4java/SQLiteJob;>;"
    iget-object v1, p0, Lcom/almworks/sqlite4java/SQLiteQueue;->myJobs:Ljava/util/Collection;

    invoke-interface {v1}, Ljava/util/Collection;->clear()V

    goto :goto_0
.end method

.method protected rollback()V
    .locals 3

    .prologue
    .line 507
    invoke-static {}, Lcom/almworks/sqlite4java/Internal;->isFineLogging()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 508
    const-string v1, "rolling back transaction"

    invoke-static {p0, v1}, Lcom/almworks/sqlite4java/Internal;->logFine(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 511
    :cond_0
    :try_start_0
    iget-object v1, p0, Lcom/almworks/sqlite4java/SQLiteQueue;->myConnection:Lcom/almworks/sqlite4java/SQLiteConnection;

    const-string v2, "ROLLBACK"

    invoke-virtual {v1, v2}, Lcom/almworks/sqlite4java/SQLiteConnection;->exec(Ljava/lang/String;)Lcom/almworks/sqlite4java/SQLiteConnection;
    :try_end_0
    .catch Lcom/almworks/sqlite4java/SQLiteException; {:try_start_0 .. :try_end_0} :catch_0

    .line 517
    :cond_1
    :goto_0
    return-void

    .line 512
    :catch_0
    move-exception v0

    .line 513
    .local v0, "e":Lcom/almworks/sqlite4java/SQLiteException;
    invoke-static {}, Lcom/almworks/sqlite4java/Internal;->isFineLogging()Z

    move-result v1

    if-eqz v1, :cond_1

    .line 514
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "exception during rollback: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {p0, v1}, Lcom/almworks/sqlite4java/Internal;->logFine(Ljava/lang/Object;Ljava/lang/Object;)V

    goto :goto_0
.end method

.method protected selectJob()Lcom/almworks/sqlite4java/SQLiteJob;
    .locals 4

    .prologue
    .line 440
    sget-boolean v3, Lcom/almworks/sqlite4java/SQLiteQueue;->$assertionsDisabled:Z

    if-nez v3, :cond_0

    iget-object v3, p0, Lcom/almworks/sqlite4java/SQLiteQueue;->myLock:Ljava/lang/Object;

    invoke-static {v3}, Ljava/lang/Thread;->holdsLock(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_0

    new-instance v3, Ljava/lang/AssertionError;

    invoke-direct {v3}, Ljava/lang/AssertionError;-><init>()V

    throw v3

    .line 441
    :cond_0
    iget-object v1, p0, Lcom/almworks/sqlite4java/SQLiteQueue;->myJobs:Ljava/util/Collection;

    .line 442
    .local v1, "jobs":Ljava/util/Collection;, "Ljava/util/Collection<Lcom/almworks/sqlite4java/SQLiteJob;>;"
    if-eqz v1, :cond_1

    invoke-interface {v1}, Ljava/util/Collection;->isEmpty()Z

    move-result v3

    if-eqz v3, :cond_2

    :cond_1
    const/4 v2, 0x0

    .line 446
    :goto_0
    return-object v2

    .line 443
    :cond_2
    invoke-interface {v1}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .line 444
    .local v0, "ii":Ljava/util/Iterator;, "Ljava/util/Iterator<Lcom/almworks/sqlite4java/SQLiteJob;>;"
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/almworks/sqlite4java/SQLiteJob;

    .line 445
    .local v2, "r":Lcom/almworks/sqlite4java/SQLiteJob;
    invoke-interface {v0}, Ljava/util/Iterator;->remove()V

    goto :goto_0
.end method

.method public start()Lcom/almworks/sqlite4java/SQLiteQueue;
    .locals 6

    .prologue
    .line 195
    iget-object v3, p0, Lcom/almworks/sqlite4java/SQLiteQueue;->myLock:Ljava/lang/Object;

    monitor-enter v3

    .line 196
    :try_start_0
    iget-object v2, p0, Lcom/almworks/sqlite4java/SQLiteQueue;->myThread:Ljava/lang/Thread;

    if-nez v2, :cond_0

    iget-boolean v2, p0, Lcom/almworks/sqlite4java/SQLiteQueue;->myStopRequested:Z

    if-eqz v2, :cond_2

    .line 197
    :cond_0
    iget-boolean v2, p0, Lcom/almworks/sqlite4java/SQLiteQueue;->myStopRequested:Z

    if-eqz v2, :cond_1

    const-string v2, "stopped"

    :goto_0
    invoke-static {p0, v2}, Lcom/almworks/sqlite4java/Internal;->logWarn(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 198
    monitor-exit v3

    .line 219
    :goto_1
    return-object p0

    .line 197
    :cond_1
    const-string v2, "already started"

    goto :goto_0

    .line 200
    :cond_2
    invoke-static {}, Lcom/almworks/sqlite4java/Internal;->isFineLogging()Z

    move-result v2

    if-eqz v2, :cond_3

    .line 201
    const-string v2, "starting"

    invoke-static {p0, v2}, Lcom/almworks/sqlite4java/Internal;->logFine(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 203
    :cond_3
    iget-object v2, p0, Lcom/almworks/sqlite4java/SQLiteQueue;->myThreadFactory:Ljava/util/concurrent/ThreadFactory;

    new-instance v4, Lcom/almworks/sqlite4java/SQLiteQueue$1;

    invoke-direct {v4, p0}, Lcom/almworks/sqlite4java/SQLiteQueue$1;-><init>(Lcom/almworks/sqlite4java/SQLiteQueue;)V

    invoke-interface {v2, v4}, Ljava/util/concurrent/ThreadFactory;->newThread(Ljava/lang/Runnable;)Ljava/lang/Thread;

    move-result-object v1

    .line 208
    .local v1, "thread":Ljava/lang/Thread;
    if-nez v1, :cond_4

    .line 209
    new-instance v2, Ljava/lang/IllegalStateException;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v4, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, " cannot create new thread"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v2, v4}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 217
    .end local v1    # "thread":Ljava/lang/Thread;
    :catchall_0
    move-exception v2

    monitor-exit v3
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v2

    .line 211
    .restart local v1    # "thread":Ljava/lang/Thread;
    :cond_4
    :try_start_1
    invoke-virtual {v1}, Ljava/lang/Thread;->getName()Ljava/lang/String;

    move-result-object v0

    .line 213
    .local v0, "name":Ljava/lang/String;
    if-eqz v0, :cond_5

    const-string v2, "Thread-"

    invoke-virtual {v0, v2}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_5

    const-string v2, "pool-"

    invoke-virtual {v0, v2}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_6

    .line 214
    :cond_5
    invoke-virtual {p0}, Lcom/almworks/sqlite4java/SQLiteQueue;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/Thread;->setName(Ljava/lang/String;)V

    .line 216
    :cond_6
    iput-object v1, p0, Lcom/almworks/sqlite4java/SQLiteQueue;->myThread:Ljava/lang/Thread;

    .line 217
    monitor-exit v3
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 218
    invoke-virtual {v1}, Ljava/lang/Thread;->start()V

    goto :goto_1
.end method

.method public stop(Z)Lcom/almworks/sqlite4java/SQLiteQueue;
    .locals 4
    .param p1, "gracefully"    # Z

    .prologue
    const/4 v3, 0x1

    .line 244
    const/4 v0, 0x0

    .line 245
    .local v0, "currentJob":Lcom/almworks/sqlite4java/SQLiteJob;
    iget-object v2, p0, Lcom/almworks/sqlite4java/SQLiteQueue;->myLock:Ljava/lang/Object;

    monitor-enter v2

    .line 246
    if-nez p1, :cond_1

    .line 247
    :try_start_0
    iget-boolean v1, p0, Lcom/almworks/sqlite4java/SQLiteQueue;->myStopRequired:Z

    if-nez v1, :cond_0

    iget-boolean v1, p0, Lcom/almworks/sqlite4java/SQLiteQueue;->myStopRequested:Z

    if-eqz v1, :cond_0

    invoke-static {}, Lcom/almworks/sqlite4java/Internal;->isFineLogging()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 248
    const-string v1, "now stopping non-gracefully"

    invoke-static {p0, v1}, Lcom/almworks/sqlite4java/Internal;->logFine(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 250
    :cond_0
    const/4 v1, 0x1

    iput-boolean v1, p0, Lcom/almworks/sqlite4java/SQLiteQueue;->myStopRequired:Z

    .line 252
    :cond_1
    iget-boolean v1, p0, Lcom/almworks/sqlite4java/SQLiteQueue;->myStopRequested:Z

    if-eqz v1, :cond_3

    .line 254
    monitor-exit v2

    .line 268
    :cond_2
    :goto_0
    return-object p0

    .line 256
    :cond_3
    invoke-static {}, Lcom/almworks/sqlite4java/Internal;->isFineLogging()Z

    move-result v1

    if-eqz v1, :cond_4

    .line 257
    if-eqz p1, :cond_6

    const-string v1, "stopping gracefully"

    :goto_1
    invoke-static {p0, v1}, Lcom/almworks/sqlite4java/Internal;->logFine(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 259
    :cond_4
    const/4 v1, 0x1

    iput-boolean v1, p0, Lcom/almworks/sqlite4java/SQLiteQueue;->myStopRequested:Z

    .line 260
    iget-boolean v1, p0, Lcom/almworks/sqlite4java/SQLiteQueue;->myStopRequired:Z

    if-eqz v1, :cond_5

    .line 261
    iget-object v0, p0, Lcom/almworks/sqlite4java/SQLiteQueue;->myCurrentJob:Lcom/almworks/sqlite4java/SQLiteJob;

    .line 263
    :cond_5
    iget-object v1, p0, Lcom/almworks/sqlite4java/SQLiteQueue;->myLock:Ljava/lang/Object;

    invoke-virtual {v1}, Ljava/lang/Object;->notify()V

    .line 264
    monitor-exit v2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 265
    if-eqz v0, :cond_2

    .line 266
    invoke-virtual {v0, v3}, Lcom/almworks/sqlite4java/SQLiteJob;->cancel(Z)Z

    goto :goto_0

    .line 257
    :cond_6
    :try_start_1
    const-string v1, "stopping non-gracefully"

    goto :goto_1

    .line 264
    :catchall_0
    move-exception v1

    monitor-exit v2
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v1
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .prologue
    .line 167
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "SQLiteQueue["

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v0, p0, Lcom/almworks/sqlite4java/SQLiteQueue;->myDatabaseFile:Ljava/io/File;

    if-nez v0, :cond_0

    const-string v0, ""

    :goto_0
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "]"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0

    :cond_0
    iget-object v0, p0, Lcom/almworks/sqlite4java/SQLiteQueue;->myDatabaseFile:Ljava/io/File;

    invoke-virtual {v0}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v0

    goto :goto_0
.end method
