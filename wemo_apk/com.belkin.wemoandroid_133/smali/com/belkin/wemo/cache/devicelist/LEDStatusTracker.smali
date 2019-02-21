.class public Lcom/belkin/wemo/cache/devicelist/LEDStatusTracker;
.super Ljava/lang/Object;
.source "LEDStatusTracker.java"


# static fields
.field private static final TAG:Ljava/lang/String;

.field private static offlineLEDCount:I


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 8
    const-class v0, Lcom/belkin/wemo/cache/devicelist/LEDStatusTracker;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/belkin/wemo/cache/devicelist/LEDStatusTracker;->TAG:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static declared-synchronized incrementOfflineLEDCount()V
    .locals 4

    .prologue
    .line 20
    const-class v1, Lcom/belkin/wemo/cache/devicelist/LEDStatusTracker;

    monitor-enter v1

    :try_start_0
    sget v0, Lcom/belkin/wemo/cache/devicelist/LEDStatusTracker;->offlineLEDCount:I

    add-int/lit8 v0, v0, 0x1

    sput v0, Lcom/belkin/wemo/cache/devicelist/LEDStatusTracker;->offlineLEDCount:I

    .line 21
    sget-object v0, Lcom/belkin/wemo/cache/devicelist/LEDStatusTracker;->TAG:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "LED Status Tracking: Offline LED Count INCREMENTED. New Count: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    sget v3, Lcom/belkin/wemo/cache/devicelist/LEDStatusTracker;->offlineLEDCount:I

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v0, v2}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->debugLog(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 22
    monitor-exit v1

    return-void

    .line 20
    :catchall_0
    move-exception v0

    monitor-exit v1

    throw v0
.end method

.method public static declared-synchronized isAnyLEDOffline()Z
    .locals 5

    .prologue
    .line 11
    const-class v2, Lcom/belkin/wemo/cache/devicelist/LEDStatusTracker;

    monitor-enter v2

    const/4 v0, 0x0

    .line 12
    .local v0, "isOffline":Z
    :try_start_0
    sget v1, Lcom/belkin/wemo/cache/devicelist/LEDStatusTracker;->offlineLEDCount:I

    if-lez v1, :cond_0

    .line 13
    const/4 v0, 0x1

    .line 15
    :cond_0
    sget-object v1, Lcom/belkin/wemo/cache/devicelist/LEDStatusTracker;->TAG:Ljava/lang/String;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "LED Status Tracking: Is Any LED Offline = "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "; Offline count: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    sget v4, Lcom/belkin/wemo/cache/devicelist/LEDStatusTracker;->offlineLEDCount:I

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v1, v3}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->debugLog(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 16
    monitor-exit v2

    return v0

    .line 11
    :catchall_0
    move-exception v1

    monitor-exit v2

    throw v1
.end method

.method public static declared-synchronized resetOfflineLEDCount()V
    .locals 3

    .prologue
    .line 25
    const-class v1, Lcom/belkin/wemo/cache/devicelist/LEDStatusTracker;

    monitor-enter v1

    const/4 v0, 0x0

    :try_start_0
    sput v0, Lcom/belkin/wemo/cache/devicelist/LEDStatusTracker;->offlineLEDCount:I

    .line 26
    sget-object v0, Lcom/belkin/wemo/cache/devicelist/LEDStatusTracker;->TAG:Ljava/lang/String;

    const-string v2, "LED Status Tracking: Offline LED Count RESET."

    invoke-static {v0, v2}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->debugLog(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 27
    monitor-exit v1

    return-void

    .line 25
    :catchall_0
    move-exception v0

    monitor-exit v1

    throw v0
.end method
