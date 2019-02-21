.class public Lcom/belkin/wemo/cache/devicelist/DeviceRequestTracker;
.super Ljava/lang/Object;
.source "DeviceRequestTracker.java"


# instance fields
.field private final STALE_REQUEST_TIME_LIMIT:J

.field private final TAG:Ljava/lang/String;

.field private pendingRequestTimestampQueue:Ljava/util/Queue;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Queue",
            "<",
            "Ljava/lang/Long;",
            ">;"
        }
    .end annotation
.end field

.field private requestCount:I

.field private udn:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/lang/String;)V
    .locals 2
    .param p1, "udn"    # Ljava/lang/String;

    .prologue
    .line 19
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 14
    const-class v0, Lcom/belkin/wemo/cache/devicelist/DeviceRequestTracker;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/belkin/wemo/cache/devicelist/DeviceRequestTracker;->TAG:Ljava/lang/String;

    .line 17
    const-wide/16 v0, 0x1388

    iput-wide v0, p0, Lcom/belkin/wemo/cache/devicelist/DeviceRequestTracker;->STALE_REQUEST_TIME_LIMIT:J

    .line 20
    iput-object p1, p0, Lcom/belkin/wemo/cache/devicelist/DeviceRequestTracker;->udn:Ljava/lang/String;

    .line 21
    new-instance v0, Ljava/util/PriorityQueue;

    invoke-direct {v0}, Ljava/util/PriorityQueue;-><init>()V

    iput-object v0, p0, Lcom/belkin/wemo/cache/devicelist/DeviceRequestTracker;->pendingRequestTimestampQueue:Ljava/util/Queue;

    .line 22
    return-void
.end method

.method private decrementRequestCount()V
    .locals 2

    .prologue
    .line 65
    const/4 v0, 0x0

    iget v1, p0, Lcom/belkin/wemo/cache/devicelist/DeviceRequestTracker;->requestCount:I

    add-int/lit8 v1, v1, -0x1

    iput v1, p0, Lcom/belkin/wemo/cache/devicelist/DeviceRequestTracker;->requestCount:I

    invoke-static {v0, v1}, Ljava/lang/Math;->max(II)I

    move-result v0

    iput v0, p0, Lcom/belkin/wemo/cache/devicelist/DeviceRequestTracker;->requestCount:I

    .line 66
    return-void
.end method

.method private purgeStaleRequests()V
    .locals 8

    .prologue
    .line 55
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    .line 56
    .local v0, "currentTime":J
    :goto_0
    iget-object v4, p0, Lcom/belkin/wemo/cache/devicelist/DeviceRequestTracker;->pendingRequestTimestampQueue:Ljava/util/Queue;

    invoke-interface {v4}, Ljava/util/Queue;->isEmpty()Z

    move-result v4

    if-nez v4, :cond_0

    iget-object v4, p0, Lcom/belkin/wemo/cache/devicelist/DeviceRequestTracker;->pendingRequestTimestampQueue:Ljava/util/Queue;

    invoke-interface {v4}, Ljava/util/Queue;->peek()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/Long;

    invoke-virtual {v4}, Ljava/lang/Long;->longValue()J

    move-result-wide v4

    sub-long v4, v0, v4

    const-wide/16 v6, 0x1388

    cmp-long v4, v4, v6

    if-lez v4, :cond_0

    .line 58
    iget-object v4, p0, Lcom/belkin/wemo/cache/devicelist/DeviceRequestTracker;->pendingRequestTimestampQueue:Ljava/util/Queue;

    invoke-interface {v4}, Ljava/util/Queue;->remove()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/Long;

    invoke-virtual {v4}, Ljava/lang/Long;->longValue()J

    move-result-wide v2

    .line 59
    .local v2, "staleRequestTimestamp":J
    invoke-direct {p0}, Lcom/belkin/wemo/cache/devicelist/DeviceRequestTracker;->decrementRequestCount()V

    .line 60
    iget-object v4, p0, Lcom/belkin/wemo/cache/devicelist/DeviceRequestTracker;->TAG:Ljava/lang/String;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "uPnP Device Request: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    iget-object v6, p0, Lcom/belkin/wemo/cache/devicelist/DeviceRequestTracker;->udn:Ljava/lang/String;

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, "; request count: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    iget v6, p0, Lcom/belkin/wemo/cache/devicelist/DeviceRequestTracker;->requestCount:I

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, "; Purging stale timestamp: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v2, v3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, " at current time: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v0, v1}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->debugLog(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    .line 62
    .end local v2    # "staleRequestTimestamp":J
    :cond_0
    return-void
.end method


# virtual methods
.method public declared-synchronized isRequestNotificationPending()Z
    .locals 4

    .prologue
    .line 44
    monitor-enter p0

    const/4 v0, 0x0

    .line 45
    .local v0, "isPending":Z
    :try_start_0
    invoke-direct {p0}, Lcom/belkin/wemo/cache/devicelist/DeviceRequestTracker;->purgeStaleRequests()V

    .line 46
    iget v1, p0, Lcom/belkin/wemo/cache/devicelist/DeviceRequestTracker;->requestCount:I

    if-lez v1, :cond_0

    .line 47
    const/4 v0, 0x1

    .line 50
    :cond_0
    iget-object v1, p0, Lcom/belkin/wemo/cache/devicelist/DeviceRequestTracker;->TAG:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "uPnP Device Request: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p0, Lcom/belkin/wemo/cache/devicelist/DeviceRequestTracker;->udn:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "; request count: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget v3, p0, Lcom/belkin/wemo/cache/devicelist/DeviceRequestTracker;->requestCount:I

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "; Is Request Notification Pending: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->debugLog(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 51
    monitor-exit p0

    return v0

    .line 44
    :catchall_0
    move-exception v1

    monitor-exit p0

    throw v1
.end method

.method public declared-synchronized onRequestNotificationReceived()V
    .locals 3

    .prologue
    .line 32
    monitor-enter p0

    :try_start_0
    invoke-direct {p0}, Lcom/belkin/wemo/cache/devicelist/DeviceRequestTracker;->decrementRequestCount()V

    .line 33
    iget-object v0, p0, Lcom/belkin/wemo/cache/devicelist/DeviceRequestTracker;->pendingRequestTimestampQueue:Ljava/util/Queue;

    invoke-interface {v0}, Ljava/util/Queue;->poll()Ljava/lang/Object;

    .line 34
    iget-object v0, p0, Lcom/belkin/wemo/cache/devicelist/DeviceRequestTracker;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "uPnP Device Request: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/belkin/wemo/cache/devicelist/DeviceRequestTracker;->udn:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "; Notification Received. Request Counter decremented to "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget v2, p0, Lcom/belkin/wemo/cache/devicelist/DeviceRequestTracker;->requestCount:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->debugLog(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 35
    monitor-exit p0

    return-void

    .line 32
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized onRequestSuccess()V
    .locals 5

    .prologue
    .line 25
    monitor-enter p0

    :try_start_0
    iget v2, p0, Lcom/belkin/wemo/cache/devicelist/DeviceRequestTracker;->requestCount:I

    add-int/lit8 v2, v2, 0x1

    iput v2, p0, Lcom/belkin/wemo/cache/devicelist/DeviceRequestTracker;->requestCount:I

    .line 26
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    .line 27
    .local v0, "currentTime":J
    iget-object v2, p0, Lcom/belkin/wemo/cache/devicelist/DeviceRequestTracker;->pendingRequestTimestampQueue:Ljava/util/Queue;

    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v3

    invoke-interface {v2, v3}, Ljava/util/Queue;->add(Ljava/lang/Object;)Z

    .line 28
    iget-object v2, p0, Lcom/belkin/wemo/cache/devicelist/DeviceRequestTracker;->TAG:Ljava/lang/String;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "uPnP Device Request: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-object v4, p0, Lcom/belkin/wemo/cache/devicelist/DeviceRequestTracker;->udn:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "; Request success. Request Counter incremented to "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget v4, p0, Lcom/belkin/wemo/cache/devicelist/DeviceRequestTracker;->requestCount:I

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, " at current time: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v0, v1}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->debugLog(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 29
    monitor-exit p0

    return-void

    .line 25
    .end local v0    # "currentTime":J
    :catchall_0
    move-exception v2

    monitor-exit p0

    throw v2
.end method

.method public declared-synchronized reset()V
    .locals 3

    .prologue
    .line 38
    monitor-enter p0

    const/4 v0, 0x0

    :try_start_0
    iput v0, p0, Lcom/belkin/wemo/cache/devicelist/DeviceRequestTracker;->requestCount:I

    .line 39
    iget-object v0, p0, Lcom/belkin/wemo/cache/devicelist/DeviceRequestTracker;->pendingRequestTimestampQueue:Ljava/util/Queue;

    invoke-interface {v0}, Ljava/util/Queue;->clear()V

    .line 40
    iget-object v0, p0, Lcom/belkin/wemo/cache/devicelist/DeviceRequestTracker;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "uPnP Device Request: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/belkin/wemo/cache/devicelist/DeviceRequestTracker;->udn:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "; Request Counter RESET to 0"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->debugLog(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 41
    monitor-exit p0

    return-void

    .line 38
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method
