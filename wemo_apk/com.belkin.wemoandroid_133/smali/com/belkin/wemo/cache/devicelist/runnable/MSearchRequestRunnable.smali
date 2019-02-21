.class public Lcom/belkin/wemo/cache/devicelist/runnable/MSearchRequestRunnable;
.super Lcom/belkin/wemo/runnable/WeMoRunnable;
.source "MSearchRequestRunnable.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/belkin/wemo/cache/devicelist/runnable/MSearchRequestRunnable$1;,
        Lcom/belkin/wemo/cache/devicelist/runnable/MSearchRequestRunnable$MSearchTimerTask;
    }
.end annotation


# static fields
.field private static final MAX_MSEARCH_COUNT:I = 0x3

.field private static final MSEARCH_INTERVAL_SECOND_ATTEMPT_MS:I = 0x64

.field private static final MSEARCH_INTERVAL_THIRD_ATTEMPT_MS:I = 0xbb8

.field private static final MX_FIRST_ATTEMPT:I = 0x1

.field private static final MX_NEXT_ATTEMPTS:I = 0x2


# instance fields
.field private deviceListManager:Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

.field private msearchIterationCount:I

.field private smartDiscovery:Lcom/belkin/wemo/cache/cloud/SmartDiscovery;


# direct methods
.method public constructor <init>(Lcom/belkin/wemo/cache/devicelist/DeviceListManager;Lcom/belkin/wemo/cache/cloud/SmartDiscovery;)V
    .locals 0
    .param p1, "deviceListManager"    # Lcom/belkin/wemo/cache/devicelist/DeviceListManager;
    .param p2, "smartDiscovery"    # Lcom/belkin/wemo/cache/cloud/SmartDiscovery;

    .prologue
    .line 26
    invoke-direct {p0}, Lcom/belkin/wemo/runnable/WeMoRunnable;-><init>()V

    .line 27
    iput-object p1, p0, Lcom/belkin/wemo/cache/devicelist/runnable/MSearchRequestRunnable;->deviceListManager:Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    .line 28
    iput-object p2, p0, Lcom/belkin/wemo/cache/devicelist/runnable/MSearchRequestRunnable;->smartDiscovery:Lcom/belkin/wemo/cache/cloud/SmartDiscovery;

    .line 29
    return-void
.end method

.method static synthetic access$100(Lcom/belkin/wemo/cache/devicelist/runnable/MSearchRequestRunnable;)Ljava/lang/String;
    .locals 1
    .param p0, "x0"    # Lcom/belkin/wemo/cache/devicelist/runnable/MSearchRequestRunnable;

    .prologue
    .line 13
    iget-object v0, p0, Lcom/belkin/wemo/cache/devicelist/runnable/MSearchRequestRunnable;->TAG:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$200(Lcom/belkin/wemo/cache/devicelist/runnable/MSearchRequestRunnable;)I
    .locals 1
    .param p0, "x0"    # Lcom/belkin/wemo/cache/devicelist/runnable/MSearchRequestRunnable;

    .prologue
    .line 13
    iget v0, p0, Lcom/belkin/wemo/cache/devicelist/runnable/MSearchRequestRunnable;->msearchIterationCount:I

    return v0
.end method

.method static synthetic access$300(Lcom/belkin/wemo/cache/devicelist/runnable/MSearchRequestRunnable;II)V
    .locals 0
    .param p0, "x0"    # Lcom/belkin/wemo/cache/devicelist/runnable/MSearchRequestRunnable;
    .param p1, "x1"    # I
    .param p2, "x2"    # I

    .prologue
    .line 13
    invoke-direct {p0, p1, p2}, Lcom/belkin/wemo/cache/devicelist/runnable/MSearchRequestRunnable;->sendMSearchRequest(II)V

    return-void
.end method

.method private sendMSearchRequest(II)V
    .locals 6
    .param p1, "mx"    # I
    .param p2, "nextScheduleTime"    # I

    .prologue
    .line 43
    iget-object v1, p0, Lcom/belkin/wemo/cache/devicelist/runnable/MSearchRequestRunnable;->TAG:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Sending MSearch Request. MX: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "; MSearch requested completed count: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget v3, p0, Lcom/belkin/wemo/cache/devicelist/runnable/MSearchRequestRunnable;->msearchIterationCount:I

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->debugLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 44
    iget-object v1, p0, Lcom/belkin/wemo/cache/devicelist/runnable/MSearchRequestRunnable;->deviceListManager:Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    invoke-virtual {v1}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->getUpnpControl()Lorg/cybergarage/upnp/ControlPoint;

    move-result-object v1

    invoke-virtual {v1, p1}, Lorg/cybergarage/upnp/ControlPoint;->search(I)Z

    move-result v0

    .line 46
    .local v0, "isSuccess":Z
    if-nez v0, :cond_0

    .line 47
    iget-object v1, p0, Lcom/belkin/wemo/cache/devicelist/runnable/MSearchRequestRunnable;->TAG:Ljava/lang/String;

    const-string v2, "MSearch Request Failed. Recreating control point. MSearch requests shall be sent after control point has been re-created"

    invoke-static {v1, v2}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 51
    :cond_0
    iget v1, p0, Lcom/belkin/wemo/cache/devicelist/runnable/MSearchRequestRunnable;->msearchIterationCount:I

    add-int/lit8 v1, v1, 0x1

    iput v1, p0, Lcom/belkin/wemo/cache/devicelist/runnable/MSearchRequestRunnable;->msearchIterationCount:I

    .line 53
    iget v1, p0, Lcom/belkin/wemo/cache/devicelist/runnable/MSearchRequestRunnable;->msearchIterationCount:I

    const/4 v2, 0x3

    if-ge v1, v2, :cond_1

    .line 55
    iget-object v1, p0, Lcom/belkin/wemo/cache/devicelist/runnable/MSearchRequestRunnable;->TAG:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Timer task scheduled for next MSearch request after time: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "MS; Request sent count: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget v3, p0, Lcom/belkin/wemo/cache/devicelist/runnable/MSearchRequestRunnable;->msearchIterationCount:I

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->debugLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 56
    new-instance v1, Ljava/util/Timer;

    invoke-direct {v1}, Ljava/util/Timer;-><init>()V

    new-instance v2, Lcom/belkin/wemo/cache/devicelist/runnable/MSearchRequestRunnable$MSearchTimerTask;

    const/4 v3, 0x0

    invoke-direct {v2, p0, v3}, Lcom/belkin/wemo/cache/devicelist/runnable/MSearchRequestRunnable$MSearchTimerTask;-><init>(Lcom/belkin/wemo/cache/devicelist/runnable/MSearchRequestRunnable;Lcom/belkin/wemo/cache/devicelist/runnable/MSearchRequestRunnable$1;)V

    int-to-long v4, p2

    invoke-virtual {v1, v2, v4, v5}, Ljava/util/Timer;->schedule(Ljava/util/TimerTask;J)V

    .line 61
    :goto_0
    return-void

    .line 58
    :cond_1
    iget-object v1, p0, Lcom/belkin/wemo/cache/devicelist/runnable/MSearchRequestRunnable;->TAG:Ljava/lang/String;

    const-string v2, "All MSearch requests completed. Timer task scheduled for Smart Discovery. Delay: 6000"

    invoke-static {v1, v2}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->debugLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 59
    new-instance v1, Ljava/util/Timer;

    invoke-direct {v1}, Ljava/util/Timer;-><init>()V

    new-instance v2, Lcom/belkin/wemo/cache/cloud/timertask/MSearchStatusTimerTask;

    iget-object v3, p0, Lcom/belkin/wemo/cache/devicelist/runnable/MSearchRequestRunnable;->smartDiscovery:Lcom/belkin/wemo/cache/cloud/SmartDiscovery;

    invoke-direct {v2, v3}, Lcom/belkin/wemo/cache/cloud/timertask/MSearchStatusTimerTask;-><init>(Lcom/belkin/wemo/cache/cloud/SmartDiscovery;)V

    const-wide/16 v4, 0x1770

    invoke-virtual {v1, v2, v4, v5}, Ljava/util/Timer;->schedule(Ljava/util/TimerTask;J)V

    goto :goto_0
.end method


# virtual methods
.method protected getLoggerTag()Ljava/lang/String;
    .locals 4

    .prologue
    .line 33
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ":"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Thread;->getId()J

    move-result-wide v2

    invoke-virtual {v0, v2, v3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public run()V
    .locals 2

    .prologue
    .line 39
    const/4 v0, 0x1

    const/16 v1, 0x64

    invoke-direct {p0, v0, v1}, Lcom/belkin/wemo/cache/devicelist/runnable/MSearchRequestRunnable;->sendMSearchRequest(II)V

    .line 40
    return-void
.end method
