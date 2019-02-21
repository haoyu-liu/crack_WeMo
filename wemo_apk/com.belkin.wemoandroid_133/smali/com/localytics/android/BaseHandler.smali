.class abstract Lcom/localytics/android/BaseHandler;
.super Landroid/os/Handler;
.source "BaseHandler.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/localytics/android/BaseHandler$ListenersSet;,
        Lcom/localytics/android/BaseHandler$BaseListener;
    }
.end annotation


# static fields
.field private static final CANCEL_UPLOAD:Ljava/lang/String; = "cancel"

.field private static final MESSAGE_GET_VALUE:I = 0x2

.field static final MESSAGE_INIT:I = 0x1

.field private static final MESSAGE_UPLOAD:I = 0x3

.field static final MESSAGE_UPLOAD_CALLBACK:I = 0x4

.field private static final UPLOAD_WAKE_LOCK:Ljava/lang/String; = "UPLOAD_WAKE_LOCK"


# instance fields
.field protected doesRetry:Z

.field listeners:Lcom/localytics/android/BaseHandler$ListenersSet;

.field mLocalyticsDao:Lcom/localytics/android/LocalyticsDao;

.field mProvider:Lcom/localytics/android/BaseProvider;

.field private mWakeLock:Landroid/os/PowerManager$WakeLock;

.field private maxRowToUpload:I

.field private numberOfRetries:I

.field private pendingUploadMessage:Landroid/os/Message;

.field private queuePriorityMessages:Z

.field siloName:Ljava/lang/String;

.field private uploadThread:Lcom/localytics/android/BaseUploadThread;


# direct methods
.method constructor <init>(Lcom/localytics/android/LocalyticsDao;Landroid/os/Looper;)V
    .locals 2
    .param p1, "localyticsDao"    # Lcom/localytics/android/LocalyticsDao;
    .param p2, "looper"    # Landroid/os/Looper;

    .prologue
    const/4 v1, 0x0

    const/4 v0, 0x0

    .line 63
    invoke-direct {p0, p2}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    .line 44
    iput v0, p0, Lcom/localytics/android/BaseHandler;->maxRowToUpload:I

    .line 49
    iput v0, p0, Lcom/localytics/android/BaseHandler;->numberOfRetries:I

    .line 54
    iput-boolean v0, p0, Lcom/localytics/android/BaseHandler;->queuePriorityMessages:Z

    .line 56
    iput-object v1, p0, Lcom/localytics/android/BaseHandler;->uploadThread:Lcom/localytics/android/BaseUploadThread;

    .line 57
    iput-object v1, p0, Lcom/localytics/android/BaseHandler;->pendingUploadMessage:Landroid/os/Message;

    .line 59
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/localytics/android/BaseHandler;->doesRetry:Z

    .line 64
    iput-object p1, p0, Lcom/localytics/android/BaseHandler;->mLocalyticsDao:Lcom/localytics/android/LocalyticsDao;

    .line 65
    return-void
.end method

.method private _uploadCallback(ILjava/lang/String;)V
    .locals 5
    .param p1, "rowsToDelete"    # I
    .param p2, "responseString"    # Ljava/lang/String;

    .prologue
    const/4 v4, 0x0

    .line 361
    iget-object v1, p0, Lcom/localytics/android/BaseHandler;->uploadThread:Lcom/localytics/android/BaseUploadThread;

    iget-object v0, v1, Lcom/localytics/android/BaseUploadThread;->customerID:Ljava/lang/String;

    .line 362
    .local v0, "customerId":Ljava/lang/String;
    const/4 v1, 0x0

    iput-object v1, p0, Lcom/localytics/android/BaseHandler;->uploadThread:Lcom/localytics/android/BaseUploadThread;

    .line 363
    if-lez p1, :cond_2

    .line 365
    invoke-virtual {p0, p1}, Lcom/localytics/android/BaseHandler;->_deleteUploadedData(I)V

    .line 366
    iput v4, p0, Lcom/localytics/android/BaseHandler;->numberOfRetries:I

    .line 374
    :goto_0
    iget-boolean v1, p0, Lcom/localytics/android/BaseHandler;->doesRetry:Z

    if-eqz v1, :cond_0

    iget v1, p0, Lcom/localytics/android/BaseHandler;->maxRowToUpload:I

    if-eq p1, v1, :cond_0

    iget v1, p0, Lcom/localytics/android/BaseHandler;->numberOfRetries:I

    const/4 v2, 0x3

    if-le v1, v2, :cond_3

    .line 376
    :cond_0
    iget v1, p0, Lcom/localytics/android/BaseHandler;->maxRowToUpload:I

    if-ne p1, v1, :cond_1

    .line 378
    invoke-virtual {p0, p2}, Lcom/localytics/android/BaseHandler;->_onUploadCompleted(Ljava/lang/String;)V

    .line 389
    :cond_1
    invoke-direct {p0}, Lcom/localytics/android/BaseHandler;->cancelPendingUpload()V

    .line 390
    iput v4, p0, Lcom/localytics/android/BaseHandler;->numberOfRetries:I

    .line 391
    iput v4, p0, Lcom/localytics/android/BaseHandler;->maxRowToUpload:I

    .line 393
    invoke-direct {p0}, Lcom/localytics/android/BaseHandler;->exitWakeLock()V

    .line 399
    :goto_1
    return-void

    .line 371
    :cond_2
    iget v1, p0, Lcom/localytics/android/BaseHandler;->numberOfRetries:I

    add-int/lit8 v1, v1, 0x1

    iput v1, p0, Lcom/localytics/android/BaseHandler;->numberOfRetries:I

    goto :goto_0

    .line 397
    :cond_3
    const-wide/16 v2, 0x2710

    invoke-virtual {p0, v4, v2, v3, v0}, Lcom/localytics/android/BaseHandler;->upload(ZJLjava/lang/String;)V

    goto :goto_1
.end method

.method static synthetic access$000(Lcom/localytics/android/BaseHandler;ILjava/lang/String;)V
    .locals 0
    .param p0, "x0"    # Lcom/localytics/android/BaseHandler;
    .param p1, "x1"    # I
    .param p2, "x2"    # Ljava/lang/String;

    .prologue
    .line 19
    invoke-direct {p0, p1, p2}, Lcom/localytics/android/BaseHandler;->_uploadCallback(ILjava/lang/String;)V

    return-void
.end method

.method static synthetic access$102(Lcom/localytics/android/BaseHandler;Z)Z
    .locals 0
    .param p0, "x0"    # Lcom/localytics/android/BaseHandler;
    .param p1, "x1"    # Z

    .prologue
    .line 19
    iput-boolean p1, p0, Lcom/localytics/android/BaseHandler;->queuePriorityMessages:Z

    return p1
.end method

.method private cancelPendingUpload()V
    .locals 4

    .prologue
    const/4 v3, 0x0

    .line 403
    iget-object v1, p0, Lcom/localytics/android/BaseHandler;->pendingUploadMessage:Landroid/os/Message;

    if-eqz v1, :cond_0

    .line 405
    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    .line 406
    .local v0, "cancelUploadBundle":Landroid/os/Bundle;
    const-string v1, "cancel"

    const/4 v2, 0x1

    invoke-virtual {v0, v1, v2}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    .line 407
    iget-object v1, p0, Lcom/localytics/android/BaseHandler;->pendingUploadMessage:Landroid/os/Message;

    invoke-virtual {v1, v0}, Landroid/os/Message;->setData(Landroid/os/Bundle;)V

    .line 408
    const/4 v1, 0x0

    iput-object v1, p0, Lcom/localytics/android/BaseHandler;->pendingUploadMessage:Landroid/os/Message;

    .line 409
    iput v3, p0, Lcom/localytics/android/BaseHandler;->numberOfRetries:I

    .line 410
    iput v3, p0, Lcom/localytics/android/BaseHandler;->maxRowToUpload:I

    .line 412
    .end local v0    # "cancelUploadBundle":Landroid/os/Bundle;
    :cond_0
    return-void
.end method

.method private enterWakeLock()V
    .locals 5

    .prologue
    .line 420
    iget-object v3, p0, Lcom/localytics/android/BaseHandler;->mLocalyticsDao:Lcom/localytics/android/LocalyticsDao;

    invoke-interface {v3}, Lcom/localytics/android/LocalyticsDao;->getAppContext()Landroid/content/Context;

    move-result-object v0

    .line 421
    .local v0, "appContext":Landroid/content/Context;
    invoke-virtual {v0}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v1

    .line 422
    .local v1, "packageManager":Landroid/content/pm/PackageManager;
    const-string v3, "android.permission.WAKE_LOCK"

    invoke-virtual {v0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v1, v3, v4}, Landroid/content/pm/PackageManager;->checkPermission(Ljava/lang/String;Ljava/lang/String;)I

    move-result v3

    if-nez v3, :cond_3

    .line 424
    iget-object v3, p0, Lcom/localytics/android/BaseHandler;->mWakeLock:Landroid/os/PowerManager$WakeLock;

    if-nez v3, :cond_1

    .line 427
    const-string v3, "power"

    invoke-virtual {v0, v3}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/os/PowerManager;

    .line 428
    .local v2, "pm":Landroid/os/PowerManager;
    const/4 v3, 0x1

    const-string v4, "UPLOAD_WAKE_LOCK"

    invoke-virtual {v2, v3, v4}, Landroid/os/PowerManager;->newWakeLock(ILjava/lang/String;)Landroid/os/PowerManager$WakeLock;

    move-result-object v3

    iput-object v3, p0, Lcom/localytics/android/BaseHandler;->mWakeLock:Landroid/os/PowerManager$WakeLock;

    .line 429
    iget-object v3, p0, Lcom/localytics/android/BaseHandler;->mWakeLock:Landroid/os/PowerManager$WakeLock;

    invoke-virtual {v3}, Landroid/os/PowerManager$WakeLock;->isHeld()Z

    move-result v3

    if-eqz v3, :cond_0

    .line 431
    const-string v3, "Wake lock will be acquired but is held when shouldn\'t be."

    invoke-static {v3}, Lcom/localytics/android/Localytics$Log;->w(Ljava/lang/String;)I

    .line 433
    :cond_0
    iget-object v3, p0, Lcom/localytics/android/BaseHandler;->mWakeLock:Landroid/os/PowerManager$WakeLock;

    invoke-virtual {v3}, Landroid/os/PowerManager$WakeLock;->acquire()V

    .line 434
    iget-object v3, p0, Lcom/localytics/android/BaseHandler;->mWakeLock:Landroid/os/PowerManager$WakeLock;

    invoke-virtual {v3}, Landroid/os/PowerManager$WakeLock;->isHeld()Z

    move-result v3

    if-eqz v3, :cond_2

    .line 436
    const-string v3, "Wake lock acquired."

    invoke-static {v3}, Lcom/localytics/android/Localytics$Log;->v(Ljava/lang/String;)I

    .line 447
    .end local v2    # "pm":Landroid/os/PowerManager;
    :cond_1
    :goto_0
    return-void

    .line 440
    .restart local v2    # "pm":Landroid/os/PowerManager;
    :cond_2
    const-string v3, "Localytics library failed to get wake lock"

    invoke-static {v3}, Lcom/localytics/android/Localytics$Log;->w(Ljava/lang/String;)I

    goto :goto_0

    .line 445
    .end local v2    # "pm":Landroid/os/PowerManager;
    :cond_3
    const-string v3, "android.permission.WAKE_LOCK is missing from the Manifest file."

    invoke-static {v3}, Lcom/localytics/android/Localytics$Log;->v(Ljava/lang/String;)I

    goto :goto_0
.end method

.method private exitWakeLock()V
    .locals 4

    .prologue
    .line 451
    iget-object v2, p0, Lcom/localytics/android/BaseHandler;->mLocalyticsDao:Lcom/localytics/android/LocalyticsDao;

    invoke-interface {v2}, Lcom/localytics/android/LocalyticsDao;->getAppContext()Landroid/content/Context;

    move-result-object v0

    .line 452
    .local v0, "appContext":Landroid/content/Context;
    invoke-virtual {v0}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v1

    .line 453
    .local v1, "packageManager":Landroid/content/pm/PackageManager;
    const-string v2, "android.permission.WAKE_LOCK"

    invoke-virtual {v0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v2, v3}, Landroid/content/pm/PackageManager;->checkPermission(Ljava/lang/String;Ljava/lang/String;)I

    move-result v2

    if-nez v2, :cond_3

    .line 455
    iget-object v2, p0, Lcom/localytics/android/BaseHandler;->mWakeLock:Landroid/os/PowerManager$WakeLock;

    if-eqz v2, :cond_1

    .line 457
    iget-object v2, p0, Lcom/localytics/android/BaseHandler;->mWakeLock:Landroid/os/PowerManager$WakeLock;

    invoke-virtual {v2}, Landroid/os/PowerManager$WakeLock;->isHeld()Z

    move-result v2

    if-nez v2, :cond_0

    .line 459
    const-string v2, "Wake lock will be released but not held when should be."

    invoke-static {v2}, Lcom/localytics/android/Localytics$Log;->w(Ljava/lang/String;)I

    .line 463
    :cond_0
    iget-object v2, p0, Lcom/localytics/android/BaseHandler;->mWakeLock:Landroid/os/PowerManager$WakeLock;

    invoke-virtual {v2}, Landroid/os/PowerManager$WakeLock;->release()V

    .line 465
    iget-object v2, p0, Lcom/localytics/android/BaseHandler;->mWakeLock:Landroid/os/PowerManager$WakeLock;

    invoke-virtual {v2}, Landroid/os/PowerManager$WakeLock;->isHeld()Z

    move-result v2

    if-eqz v2, :cond_2

    .line 467
    const-string v2, "Wake lock was not released when it should have been."

    invoke-static {v2}, Lcom/localytics/android/Localytics$Log;->w(Ljava/lang/String;)I

    .line 473
    :goto_0
    const/4 v2, 0x0

    iput-object v2, p0, Lcom/localytics/android/BaseHandler;->mWakeLock:Landroid/os/PowerManager$WakeLock;

    .line 480
    :cond_1
    :goto_1
    return-void

    .line 471
    :cond_2
    const-string v2, "Wake lock released."

    invoke-static {v2}, Lcom/localytics/android/Localytics$Log;->v(Ljava/lang/String;)I

    goto :goto_0

    .line 478
    :cond_3
    const-string v2, "android.permission.WAKE_LOCK is missing from the Manifest file."

    invoke-static {v2}, Lcom/localytics/android/Localytics$Log;->v(Ljava/lang/String;)I

    goto :goto_1
.end method

.method private getFuture(Ljava/util/concurrent/Callable;)Ljava/util/concurrent/FutureTask;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/util/concurrent/Callable",
            "<TT;>;)",
            "Ljava/util/concurrent/FutureTask",
            "<TT;>;"
        }
    .end annotation

    .prologue
    .line 164
    .local p1, "callable":Ljava/util/concurrent/Callable;, "Ljava/util/concurrent/Callable<TT;>;"
    new-instance v0, Ljava/util/concurrent/FutureTask;

    invoke-direct {v0, p1}, Ljava/util/concurrent/FutureTask;-><init>(Ljava/util/concurrent/Callable;)V

    .line 165
    .local v0, "task":Ljava/util/concurrent/FutureTask;, "Ljava/util/concurrent/FutureTask<TT;>;"
    const/4 v1, 0x2

    invoke-virtual {p0, v1, v0}, Lcom/localytics/android/BaseHandler;->obtainMessage(ILjava/lang/Object;)Landroid/os/Message;

    move-result-object v1

    invoke-virtual {p0, v1}, Lcom/localytics/android/BaseHandler;->queueMessage(Landroid/os/Message;)Z

    .line 166
    return-object v0
.end method

.method private getType(Ljava/util/concurrent/Callable;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/util/concurrent/Callable",
            "<TT;>;TT;)TT;"
        }
    .end annotation

    .prologue
    .line 187
    .local p1, "callable":Ljava/util/concurrent/Callable;, "Ljava/util/concurrent/Callable<TT;>;"
    .local p2, "defaultValue":Ljava/lang/Object;, "TT;"
    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v0

    invoke-static {}, Landroid/os/Looper;->myLooper()Landroid/os/Looper;

    move-result-object v1

    if-ne v0, v1, :cond_0

    .line 189
    new-instance v0, Ljava/lang/RuntimeException;

    const-string v1, "Cannot be called on the main thread."

    invoke-direct {v0, v1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 192
    :cond_0
    invoke-direct {p0, p1}, Lcom/localytics/android/BaseHandler;->getFuture(Ljava/util/concurrent/Callable;)Ljava/util/concurrent/FutureTask;

    move-result-object v0

    invoke-virtual {p0, v0, p2}, Lcom/localytics/android/BaseHandler;->getFutureTaskValue(Ljava/util/concurrent/FutureTask;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method


# virtual methods
.method protected abstract _deleteUploadedData(I)V
.end method

.method protected abstract _getDataToUpload()Ljava/util/TreeMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/TreeMap",
            "<",
            "Ljava/lang/Integer;",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation
.end method

.method protected abstract _getMaxRowToUpload()I
.end method

.method abstract _init()V
.end method

.method protected abstract _onUploadCompleted(Ljava/lang/String;)V
.end method

.method _upload(ZLjava/lang/String;)V
    .locals 7
    .param p1, "adjustMaxRow"    # Z
    .param p2, "customerId"    # Ljava/lang/String;

    .prologue
    const/4 v6, 0x0

    .line 314
    iget v3, p0, Lcom/localytics/android/BaseHandler;->maxRowToUpload:I

    if-eqz v3, :cond_0

    iget-object v3, p0, Lcom/localytics/android/BaseHandler;->uploadThread:Lcom/localytics/android/BaseUploadThread;

    if-eqz v3, :cond_0

    iget-object v3, p0, Lcom/localytics/android/BaseHandler;->uploadThread:Lcom/localytics/android/BaseUploadThread;

    invoke-virtual {v3}, Lcom/localytics/android/BaseUploadThread;->isAlive()Z

    move-result v3

    if-nez v3, :cond_0

    .line 316
    iput v6, p0, Lcom/localytics/android/BaseHandler;->maxRowToUpload:I

    .line 317
    const/4 v3, 0x0

    iput-object v3, p0, Lcom/localytics/android/BaseHandler;->uploadThread:Lcom/localytics/android/BaseUploadThread;

    .line 320
    :cond_0
    invoke-virtual {p0}, Lcom/localytics/android/BaseHandler;->_getMaxRowToUpload()I

    move-result v2

    .line 322
    .local v2, "lastRowToUpload":I
    if-eqz p1, :cond_1

    iget v3, p0, Lcom/localytics/android/BaseHandler;->maxRowToUpload:I

    if-eqz v3, :cond_1

    .line 324
    iput v2, p0, Lcom/localytics/android/BaseHandler;->maxRowToUpload:I

    .line 326
    const-string v3, "Already uploading %s"

    const/4 v4, 0x1

    new-array v4, v4, [Ljava/lang/Object;

    iget-object v5, p0, Lcom/localytics/android/BaseHandler;->siloName:Ljava/lang/String;

    invoke-virtual {v5}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v5

    aput-object v5, v4, v6

    invoke-static {v3, v4}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Lcom/localytics/android/Localytics$Log;->d(Ljava/lang/String;)I

    .line 357
    :goto_0
    return-void

    .line 333
    :cond_1
    :try_start_0
    invoke-virtual {p0}, Lcom/localytics/android/BaseHandler;->_getDataToUpload()Ljava/util/TreeMap;

    move-result-object v0

    .line 334
    .local v0, "data":Ljava/util/TreeMap;, "Ljava/util/TreeMap<Ljava/lang/Integer;Ljava/lang/Object;>;"
    invoke-virtual {v0}, Ljava/util/TreeMap;->size()I

    move-result v3

    if-nez v3, :cond_2

    .line 336
    const/4 v3, 0x0

    iput v3, p0, Lcom/localytics/android/BaseHandler;->maxRowToUpload:I
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 352
    .end local v0    # "data":Ljava/util/TreeMap;, "Ljava/util/TreeMap<Ljava/lang/Integer;Ljava/lang/Object;>;"
    :catch_0
    move-exception v1

    .line 354
    .local v1, "e":Ljava/lang/Exception;
    const-string v3, "Error occurred during upload"

    invoke-static {v3, v1}, Lcom/localytics/android/Localytics$Log;->w(Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 355
    iput v6, p0, Lcom/localytics/android/BaseHandler;->maxRowToUpload:I

    goto :goto_0

    .line 344
    .end local v1    # "e":Ljava/lang/Exception;
    .restart local v0    # "data":Ljava/util/TreeMap;, "Ljava/util/TreeMap<Ljava/lang/Integer;Ljava/lang/Object;>;"
    :cond_2
    if-eqz p1, :cond_3

    .line 346
    :try_start_1
    iput v2, p0, Lcom/localytics/android/BaseHandler;->maxRowToUpload:I

    .line 349
    :cond_3
    invoke-direct {p0}, Lcom/localytics/android/BaseHandler;->enterWakeLock()V

    .line 350
    invoke-virtual {p0, v0, p2}, Lcom/localytics/android/BaseHandler;->getUploadThread(Ljava/util/TreeMap;Ljava/lang/String;)Lcom/localytics/android/BaseUploadThread;

    move-result-object v3

    iput-object v3, p0, Lcom/localytics/android/BaseHandler;->uploadThread:Lcom/localytics/android/BaseUploadThread;

    invoke-virtual {v3}, Lcom/localytics/android/BaseUploadThread;->start()V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_0
.end method

.method addListener(Lcom/localytics/android/BaseHandler$BaseListener;)V
    .locals 2
    .param p1, "listener"    # Lcom/localytics/android/BaseHandler$BaseListener;

    .prologue
    .line 225
    iget-object v1, p0, Lcom/localytics/android/BaseHandler;->listeners:Lcom/localytics/android/BaseHandler$ListenersSet;

    monitor-enter v1

    .line 227
    :try_start_0
    iget-object v0, p0, Lcom/localytics/android/BaseHandler;->listeners:Lcom/localytics/android/BaseHandler$ListenersSet;

    invoke-virtual {v0, p1}, Lcom/localytics/android/BaseHandler$ListenersSet;->add(Ljava/lang/Object;)Z

    .line 228
    monitor-exit v1

    .line 229
    return-void

    .line 228
    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method getBool(Ljava/util/concurrent/Callable;)Z
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/concurrent/Callable",
            "<",
            "Ljava/lang/Boolean;",
            ">;)Z"
        }
    .end annotation

    .prologue
    .line 159
    .local p1, "booleanCallable":Ljava/util/concurrent/Callable;, "Ljava/util/concurrent/Callable<Ljava/lang/Boolean;>;"
    const/4 v0, 0x0

    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    invoke-direct {p0, p1, v0}, Lcom/localytics/android/BaseHandler;->getType(Ljava/util/concurrent/Callable;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Boolean;

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    return v0
.end method

.method getFutureTaskValue(Ljava/util/concurrent/FutureTask;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/util/concurrent/FutureTask",
            "<TT;>;TT;)TT;"
        }
    .end annotation

    .prologue
    .line 171
    .local p1, "task":Ljava/util/concurrent/FutureTask;, "Ljava/util/concurrent/FutureTask<TT;>;"
    .local p2, "defaultValue":Ljava/lang/Object;, "TT;"
    move-object v0, p2

    .line 174
    .local v0, "ret":Ljava/lang/Object;, "TT;"
    :try_start_0
    invoke-virtual {p1}, Ljava/util/concurrent/FutureTask;->get()Ljava/lang/Object;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result-object v0

    move-object v1, v0

    .line 181
    .end local v0    # "ret":Ljava/lang/Object;, "TT;"
    .local v1, "ret":Ljava/lang/Object;, "TT;"
    :goto_0
    return-object v1

    .line 176
    .end local v1    # "ret":Ljava/lang/Object;, "TT;"
    .restart local v0    # "ret":Ljava/lang/Object;, "TT;"
    :catch_0
    move-exception v2

    move-object v1, v0

    .line 181
    .end local v0    # "ret":Ljava/lang/Object;, "TT;"
    .restart local v1    # "ret":Ljava/lang/Object;, "TT;"
    goto :goto_0

    .end local v1    # "ret":Ljava/lang/Object;, "TT;"
    .restart local v0    # "ret":Ljava/lang/Object;, "TT;"
    :catchall_0
    move-exception v2

    move-object v1, v0

    .end local v0    # "ret":Ljava/lang/Object;, "TT;"
    .restart local v1    # "ret":Ljava/lang/Object;, "TT;"
    goto :goto_0
.end method

.method getList(Ljava/util/concurrent/Callable;)Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/concurrent/Callable",
            "<",
            "Ljava/util/List;",
            ">;)",
            "Ljava/util/List;"
        }
    .end annotation

    .prologue
    .line 220
    .local p1, "listCallable":Ljava/util/concurrent/Callable;, "Ljava/util/concurrent/Callable<Ljava/util/List;>;"
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lcom/localytics/android/BaseHandler;->getType(Ljava/util/concurrent/Callable;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/List;

    return-object v0
.end method

.method getMap(Ljava/util/concurrent/Callable;)Ljava/util/Map;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/concurrent/Callable",
            "<",
            "Ljava/util/Map;",
            ">;)",
            "Ljava/util/Map;"
        }
    .end annotation

    .prologue
    .line 215
    .local p1, "mapCallable":Ljava/util/concurrent/Callable;, "Ljava/util/concurrent/Callable<Ljava/util/Map;>;"
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lcom/localytics/android/BaseHandler;->getType(Ljava/util/concurrent/Callable;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Map;

    return-object v0
.end method

.method getString(Ljava/util/concurrent/Callable;)Ljava/lang/String;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/concurrent/Callable",
            "<",
            "Ljava/lang/String;",
            ">;)",
            "Ljava/lang/String;"
        }
    .end annotation

    .prologue
    .line 210
    .local p1, "stringCallable":Ljava/util/concurrent/Callable;, "Ljava/util/concurrent/Callable<Ljava/lang/String;>;"
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lcom/localytics/android/BaseHandler;->getType(Ljava/util/concurrent/Callable;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    return-object v0
.end method

.method protected abstract getUploadThread(Ljava/util/TreeMap;Ljava/lang/String;)Lcom/localytics/android/BaseUploadThread;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/TreeMap",
            "<",
            "Ljava/lang/Integer;",
            "Ljava/lang/Object;",
            ">;",
            "Ljava/lang/String;",
            ")",
            "Lcom/localytics/android/BaseUploadThread;"
        }
    .end annotation
.end method

.method public handleMessage(Landroid/os/Message;)V
    .locals 13
    .param p1, "msg"    # Landroid/os/Message;

    .prologue
    .line 72
    :try_start_0
    invoke-super {p0, p1}, Landroid/os/Handler;->handleMessage(Landroid/os/Message;)V

    .line 74
    const-string v9, "%s handler received %s"

    const/4 v10, 0x2

    new-array v10, v10, [Ljava/lang/Object;

    const/4 v11, 0x0

    iget-object v12, p0, Lcom/localytics/android/BaseHandler;->siloName:Ljava/lang/String;

    aput-object v12, v10, v11

    const/4 v11, 0x1

    aput-object p1, v10, v11

    invoke-static {v9, v10}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v9

    invoke-static {v9}, Lcom/localytics/android/Localytics$Log;->v(Ljava/lang/String;)I

    .line 76
    iget v9, p1, Landroid/os/Message;->what:I

    packed-switch v9, :pswitch_data_0

    .line 138
    invoke-virtual {p0, p1}, Lcom/localytics/android/BaseHandler;->handleMessageExtended(Landroid/os/Message;)V

    .line 147
    :cond_0
    :goto_0
    return-void

    .line 80
    :pswitch_0
    invoke-virtual {p0}, Lcom/localytics/android/BaseHandler;->_init()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 143
    :catch_0
    move-exception v4

    .line 145
    .local v4, "e":Ljava/lang/Exception;
    const-string v9, "%s handler can\'t handle message %s"

    const/4 v10, 0x2

    new-array v10, v10, [Ljava/lang/Object;

    const/4 v11, 0x0

    iget-object v12, p0, Lcom/localytics/android/BaseHandler;->siloName:Ljava/lang/String;

    aput-object v12, v10, v11

    const/4 v11, 0x1

    iget v12, p1, Landroid/os/Message;->what:I

    invoke-static {v12}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v12

    aput-object v12, v10, v11

    invoke-static {v9, v10}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v9

    invoke-static {v9, v4}, Lcom/localytics/android/Localytics$Log;->e(Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_0

    .line 85
    .end local v4    # "e":Ljava/lang/Exception;
    :pswitch_1
    :try_start_1
    iget-object v5, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast v5, Ljava/util/concurrent/FutureTask;

    .line 86
    .local v5, "fTask":Ljava/util/concurrent/FutureTask;
    iget-object v9, p0, Lcom/localytics/android/BaseHandler;->mProvider:Lcom/localytics/android/BaseProvider;

    new-instance v10, Lcom/localytics/android/BaseHandler$1;

    invoke-direct {v10, p0, v5}, Lcom/localytics/android/BaseHandler$1;-><init>(Lcom/localytics/android/BaseHandler;Ljava/util/concurrent/FutureTask;)V

    invoke-virtual {v9, v10}, Lcom/localytics/android/BaseProvider;->runBatchTransaction(Ljava/lang/Runnable;)V

    goto :goto_0

    .line 98
    .end local v5    # "fTask":Ljava/util/concurrent/FutureTask;
    :pswitch_2
    const-string v9, "%s handler received MESSAGE_UPLOAD"

    const/4 v10, 0x1

    new-array v10, v10, [Ljava/lang/Object;

    const/4 v11, 0x0

    iget-object v12, p0, Lcom/localytics/android/BaseHandler;->siloName:Ljava/lang/String;

    aput-object v12, v10, v11

    invoke-static {v9, v10}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v9

    invoke-static {v9}, Lcom/localytics/android/Localytics$Log;->d(Ljava/lang/String;)I

    .line 100
    iget-object v9, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast v9, [Ljava/lang/Object;

    move-object v0, v9

    check-cast v0, [Ljava/lang/Object;

    move-object v6, v0

    .line 101
    .local v6, "params":[Ljava/lang/Object;
    const/4 v9, 0x0

    aget-object v1, v6, v9

    check-cast v1, Ljava/lang/Boolean;

    .line 102
    .local v1, "adjustMaxRowToUpload":Ljava/lang/Boolean;
    const/4 v9, 0x1

    aget-object v3, v6, v9

    check-cast v3, Ljava/lang/String;

    .line 103
    .local v3, "customerId":Ljava/lang/String;
    invoke-virtual {p1}, Landroid/os/Message;->getData()Landroid/os/Bundle;

    move-result-object v9

    const-string v10, "cancel"

    invoke-virtual {v9, v10}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;)Z

    move-result v2

    .line 105
    .local v2, "cancelUpload":Z
    if-nez v2, :cond_0

    .line 107
    iget-object v9, p0, Lcom/localytics/android/BaseHandler;->mProvider:Lcom/localytics/android/BaseProvider;

    new-instance v10, Lcom/localytics/android/BaseHandler$2;

    invoke-direct {v10, p0, v1, v3}, Lcom/localytics/android/BaseHandler$2;-><init>(Lcom/localytics/android/BaseHandler;Ljava/lang/Boolean;Ljava/lang/String;)V

    invoke-virtual {v9, v10}, Lcom/localytics/android/BaseProvider;->runBatchTransaction(Ljava/lang/Runnable;)V

    goto :goto_0

    .line 120
    .end local v1    # "adjustMaxRowToUpload":Ljava/lang/Boolean;
    .end local v2    # "cancelUpload":Z
    .end local v3    # "customerId":Ljava/lang/String;
    .end local v6    # "params":[Ljava/lang/Object;
    :pswitch_3
    const-string v9, "%s handler received MESSAGE_UPLOAD_CALLBACK"

    const/4 v10, 0x1

    new-array v10, v10, [Ljava/lang/Object;

    const/4 v11, 0x0

    iget-object v12, p0, Lcom/localytics/android/BaseHandler;->siloName:Ljava/lang/String;

    aput-object v12, v10, v11

    invoke-static {v9, v10}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v9

    invoke-static {v9}, Lcom/localytics/android/Localytics$Log;->d(Ljava/lang/String;)I

    .line 122
    iget-object v9, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast v9, [Ljava/lang/Object;

    move-object v0, v9

    check-cast v0, [Ljava/lang/Object;

    move-object v6, v0

    .line 123
    .restart local v6    # "params":[Ljava/lang/Object;
    const/4 v9, 0x0

    aget-object v9, v6, v9

    check-cast v9, Ljava/lang/Integer;

    invoke-virtual {v9}, Ljava/lang/Integer;->intValue()I

    move-result v8

    .line 124
    .local v8, "rowsToDelete":I
    const/4 v9, 0x1

    aget-object v7, v6, v9

    check-cast v7, Ljava/lang/String;

    .line 126
    .local v7, "responseString":Ljava/lang/String;
    iget-object v9, p0, Lcom/localytics/android/BaseHandler;->mProvider:Lcom/localytics/android/BaseProvider;

    new-instance v10, Lcom/localytics/android/BaseHandler$3;

    invoke-direct {v10, p0, v8, v7}, Lcom/localytics/android/BaseHandler$3;-><init>(Lcom/localytics/android/BaseHandler;ILjava/lang/String;)V

    invoke-virtual {v9, v10}, Lcom/localytics/android/BaseProvider;->runBatchTransaction(Ljava/lang/Runnable;)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    goto/16 :goto_0

    .line 76
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_1
        :pswitch_2
        :pswitch_3
    .end packed-switch
.end method

.method handleMessageExtended(Landroid/os/Message;)V
    .locals 2
    .param p1, "msg"    # Landroid/os/Message;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 154
    new-instance v0, Ljava/lang/Exception;

    const-string v1, "Fell through switch statement"

    invoke-direct {v0, v1}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method queueMessage(Landroid/os/Message;)Z
    .locals 2
    .param p1, "msg"    # Landroid/os/Message;

    .prologue
    .line 197
    iget-boolean v0, p0, Lcom/localytics/android/BaseHandler;->queuePriorityMessages:Z

    if-eqz v0, :cond_0

    invoke-virtual {p0}, Lcom/localytics/android/BaseHandler;->getLooper()Landroid/os/Looper;

    move-result-object v0

    invoke-virtual {v0}, Landroid/os/Looper;->getThread()Ljava/lang/Thread;

    move-result-object v0

    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v1

    if-ne v0, v1, :cond_0

    .line 199
    invoke-virtual {p0, p1}, Lcom/localytics/android/BaseHandler;->handleMessage(Landroid/os/Message;)V

    .line 200
    const/4 v0, 0x1

    .line 204
    :goto_0
    return v0

    :cond_0
    invoke-virtual {p0, p1}, Lcom/localytics/android/BaseHandler;->sendMessage(Landroid/os/Message;)Z

    move-result v0

    goto :goto_0
.end method

.method final queueMessageDelayed(Landroid/os/Message;J)Z
    .locals 2
    .param p1, "msg"    # Landroid/os/Message;
    .param p2, "delay"    # J

    .prologue
    .line 241
    const-wide/16 v0, 0x0

    cmp-long v0, p2, v0

    if-nez v0, :cond_0

    .line 243
    invoke-virtual {p0, p1}, Lcom/localytics/android/BaseHandler;->queueMessage(Landroid/os/Message;)Z

    move-result v0

    .line 247
    :goto_0
    return v0

    :cond_0
    invoke-virtual {p0, p1, p2, p3}, Lcom/localytics/android/BaseHandler;->sendMessageDelayed(Landroid/os/Message;J)Z

    move-result v0

    goto :goto_0
.end method

.method removeListener(Lcom/localytics/android/BaseHandler$BaseListener;)V
    .locals 2
    .param p1, "listener"    # Lcom/localytics/android/BaseHandler$BaseListener;

    .prologue
    .line 233
    iget-object v1, p0, Lcom/localytics/android/BaseHandler;->listeners:Lcom/localytics/android/BaseHandler$ListenersSet;

    monitor-enter v1

    .line 235
    :try_start_0
    iget-object v0, p0, Lcom/localytics/android/BaseHandler;->listeners:Lcom/localytics/android/BaseHandler$ListenersSet;

    invoke-virtual {v0, p1}, Lcom/localytics/android/BaseHandler$ListenersSet;->remove(Ljava/lang/Object;)Z

    .line 236
    monitor-exit v1

    .line 237
    return-void

    .line 236
    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method upload(Ljava/lang/String;)V
    .locals 4
    .param p1, "customerId"    # Ljava/lang/String;

    .prologue
    .line 283
    const/4 v0, 0x1

    const-wide/16 v2, 0x0

    invoke-virtual {p0, v0, v2, v3, p1}, Lcom/localytics/android/BaseHandler;->upload(ZJLjava/lang/String;)V

    .line 284
    return-void
.end method

.method upload(ZJLjava/lang/String;)V
    .locals 6
    .param p1, "adjustMaxRowToUpload"    # Z
    .param p2, "backoff"    # J
    .param p4, "customerId"    # Ljava/lang/String;

    .prologue
    const/4 v5, 0x0

    .line 288
    const/4 v2, 0x3

    const/4 v3, 0x2

    new-array v3, v3, [Ljava/lang/Object;

    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v4

    aput-object v4, v3, v5

    const/4 v4, 0x1

    aput-object p4, v3, v4

    invoke-virtual {p0, v2, v3}, Lcom/localytics/android/BaseHandler;->obtainMessage(ILjava/lang/Object;)Landroid/os/Message;

    move-result-object v1

    .line 289
    .local v1, "msg":Landroid/os/Message;
    const-wide/16 v2, 0x0

    cmp-long v2, p2, v2

    if-nez v2, :cond_0

    .line 291
    invoke-direct {p0}, Lcom/localytics/android/BaseHandler;->cancelPendingUpload()V

    .line 292
    invoke-virtual {p0, v1}, Lcom/localytics/android/BaseHandler;->queueMessage(Landroid/os/Message;)Z

    .line 302
    :goto_0
    return-void

    .line 296
    :cond_0
    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    .line 297
    .local v0, "cancelUploadBundle":Landroid/os/Bundle;
    const-string v2, "cancel"

    invoke-virtual {v0, v2, v5}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    .line 298
    iput-object v1, p0, Lcom/localytics/android/BaseHandler;->pendingUploadMessage:Landroid/os/Message;

    .line 299
    iget-object v2, p0, Lcom/localytics/android/BaseHandler;->pendingUploadMessage:Landroid/os/Message;

    invoke-virtual {v2, v0}, Landroid/os/Message;->setData(Landroid/os/Bundle;)V

    .line 300
    iget-object v2, p0, Lcom/localytics/android/BaseHandler;->pendingUploadMessage:Landroid/os/Message;

    invoke-virtual {p0, v2, p2, p3}, Lcom/localytics/android/BaseHandler;->queueMessageDelayed(Landroid/os/Message;J)Z

    goto :goto_0
.end method
