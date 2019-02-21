.class Lcom/belkin/wemo/cache/devicelist/runnable/MSearchDeviceAddedRunnable$DeviceCoolingPeriodTimerTask;
.super Ljava/util/TimerTask;
.source "MSearchDeviceAddedRunnable.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/belkin/wemo/cache/devicelist/runnable/MSearchDeviceAddedRunnable;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "DeviceCoolingPeriodTimerTask"
.end annotation


# instance fields
.field private listener:Lcom/belkin/wemo/cache/devicelist/runnable/MSearchDeviceAddedRunnable$onMSearchDeviceProcessedListener;

.field final synthetic this$0:Lcom/belkin/wemo/cache/devicelist/runnable/MSearchDeviceAddedRunnable;

.field private udn:Ljava/lang/String;


# direct methods
.method public constructor <init>(Lcom/belkin/wemo/cache/devicelist/runnable/MSearchDeviceAddedRunnable;Ljava/lang/String;Lcom/belkin/wemo/cache/devicelist/runnable/MSearchDeviceAddedRunnable$onMSearchDeviceProcessedListener;)V
    .locals 0
    .param p2, "udn"    # Ljava/lang/String;
    .param p3, "listener"    # Lcom/belkin/wemo/cache/devicelist/runnable/MSearchDeviceAddedRunnable$onMSearchDeviceProcessedListener;

    .prologue
    .line 171
    iput-object p1, p0, Lcom/belkin/wemo/cache/devicelist/runnable/MSearchDeviceAddedRunnable$DeviceCoolingPeriodTimerTask;->this$0:Lcom/belkin/wemo/cache/devicelist/runnable/MSearchDeviceAddedRunnable;

    invoke-direct {p0}, Ljava/util/TimerTask;-><init>()V

    .line 172
    iput-object p2, p0, Lcom/belkin/wemo/cache/devicelist/runnable/MSearchDeviceAddedRunnable$DeviceCoolingPeriodTimerTask;->udn:Ljava/lang/String;

    .line 173
    iput-object p3, p0, Lcom/belkin/wemo/cache/devicelist/runnable/MSearchDeviceAddedRunnable$DeviceCoolingPeriodTimerTask;->listener:Lcom/belkin/wemo/cache/devicelist/runnable/MSearchDeviceAddedRunnable$onMSearchDeviceProcessedListener;

    .line 174
    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    .prologue
    .line 178
    iget-object v0, p0, Lcom/belkin/wemo/cache/devicelist/runnable/MSearchDeviceAddedRunnable$DeviceCoolingPeriodTimerTask;->this$0:Lcom/belkin/wemo/cache/devicelist/runnable/MSearchDeviceAddedRunnable;

    invoke-static {v0}, Lcom/belkin/wemo/cache/devicelist/runnable/MSearchDeviceAddedRunnable;->access$000(Lcom/belkin/wemo/cache/devicelist/runnable/MSearchDeviceAddedRunnable;)Ljava/lang/String;

    move-result-object v0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Discovery: UNREACHABLE DEVICE COOLING PERIOD DONE. UDN: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/belkin/wemo/cache/devicelist/runnable/MSearchDeviceAddedRunnable$DeviceCoolingPeriodTimerTask;->udn:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 179
    iget-object v0, p0, Lcom/belkin/wemo/cache/devicelist/runnable/MSearchDeviceAddedRunnable$DeviceCoolingPeriodTimerTask;->listener:Lcom/belkin/wemo/cache/devicelist/runnable/MSearchDeviceAddedRunnable$onMSearchDeviceProcessedListener;

    if-eqz v0, :cond_0

    .line 180
    iget-object v0, p0, Lcom/belkin/wemo/cache/devicelist/runnable/MSearchDeviceAddedRunnable$DeviceCoolingPeriodTimerTask;->listener:Lcom/belkin/wemo/cache/devicelist/runnable/MSearchDeviceAddedRunnable$onMSearchDeviceProcessedListener;

    iget-object v1, p0, Lcom/belkin/wemo/cache/devicelist/runnable/MSearchDeviceAddedRunnable$DeviceCoolingPeriodTimerTask;->udn:Ljava/lang/String;

    invoke-interface {v0, v1}, Lcom/belkin/wemo/cache/devicelist/runnable/MSearchDeviceAddedRunnable$onMSearchDeviceProcessedListener;->onMSearchProcessingFailed(Ljava/lang/String;)V

    .line 182
    :cond_0
    return-void
.end method
