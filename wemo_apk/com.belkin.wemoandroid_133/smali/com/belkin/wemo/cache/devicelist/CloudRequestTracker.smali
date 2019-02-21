.class public Lcom/belkin/wemo/cache/devicelist/CloudRequestTracker;
.super Ljava/lang/Object;
.source "CloudRequestTracker.java"


# static fields
.field private static final TAG:Ljava/lang/String;

.field private static requestTracker:Lcom/belkin/wemo/cache/devicelist/CloudRequestTracker;


# instance fields
.field private requestCounter:I


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 11
    const-class v0, Lcom/belkin/wemo/cache/cloud/CloudRequestManager;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/belkin/wemo/cache/devicelist/CloudRequestTracker;->TAG:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 6
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static declared-synchronized instance()Lcom/belkin/wemo/cache/devicelist/CloudRequestTracker;
    .locals 2

    .prologue
    .line 14
    const-class v1, Lcom/belkin/wemo/cache/devicelist/CloudRequestTracker;

    monitor-enter v1

    :try_start_0
    sget-object v0, Lcom/belkin/wemo/cache/devicelist/CloudRequestTracker;->requestTracker:Lcom/belkin/wemo/cache/devicelist/CloudRequestTracker;

    if-nez v0, :cond_0

    .line 15
    new-instance v0, Lcom/belkin/wemo/cache/devicelist/CloudRequestTracker;

    invoke-direct {v0}, Lcom/belkin/wemo/cache/devicelist/CloudRequestTracker;-><init>()V

    sput-object v0, Lcom/belkin/wemo/cache/devicelist/CloudRequestTracker;->requestTracker:Lcom/belkin/wemo/cache/devicelist/CloudRequestTracker;

    .line 17
    :cond_0
    sget-object v0, Lcom/belkin/wemo/cache/devicelist/CloudRequestTracker;->requestTracker:Lcom/belkin/wemo/cache/devicelist/CloudRequestTracker;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit v1

    return-object v0

    .line 14
    :catchall_0
    move-exception v0

    monitor-exit v1

    throw v0
.end method


# virtual methods
.method public declared-synchronized onRequestCompleted()I
    .locals 3

    .prologue
    .line 28
    monitor-enter p0

    :try_start_0
    iget v0, p0, Lcom/belkin/wemo/cache/devicelist/CloudRequestTracker;->requestCounter:I

    add-int/lit8 v0, v0, -0x1

    iput v0, p0, Lcom/belkin/wemo/cache/devicelist/CloudRequestTracker;->requestCounter:I

    .line 29
    sget-object v0, Lcom/belkin/wemo/cache/devicelist/CloudRequestTracker;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Request Completed: Cloud requests in progress count: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget v2, p0, Lcom/belkin/wemo/cache/devicelist/CloudRequestTracker;->requestCounter:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->debugLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 31
    iget v0, p0, Lcom/belkin/wemo/cache/devicelist/CloudRequestTracker;->requestCounter:I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return v0

    .line 28
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized onRequestIssued()I
    .locals 3

    .prologue
    .line 21
    monitor-enter p0

    :try_start_0
    iget v0, p0, Lcom/belkin/wemo/cache/devicelist/CloudRequestTracker;->requestCounter:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lcom/belkin/wemo/cache/devicelist/CloudRequestTracker;->requestCounter:I

    .line 22
    sget-object v0, Lcom/belkin/wemo/cache/devicelist/CloudRequestTracker;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Request Issued: Cloud requests in progress count: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget v2, p0, Lcom/belkin/wemo/cache/devicelist/CloudRequestTracker;->requestCounter:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->debugLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 24
    iget v0, p0, Lcom/belkin/wemo/cache/devicelist/CloudRequestTracker;->requestCounter:I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return v0

    .line 21
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized reset()V
    .locals 2

    .prologue
    .line 35
    monitor-enter p0

    const/4 v0, 0x0

    :try_start_0
    iput v0, p0, Lcom/belkin/wemo/cache/devicelist/CloudRequestTracker;->requestCounter:I

    .line 36
    sget-object v0, Lcom/belkin/wemo/cache/devicelist/CloudRequestTracker;->TAG:Ljava/lang/String;

    const-string v1, "Cloud request counter reset to 0"

    invoke-static {v0, v1}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->debugLog(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 37
    monitor-exit p0

    return-void

    .line 35
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method
