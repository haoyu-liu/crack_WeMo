.class Lcom/belkin/wemo/cache/devicelist/DeviceListManager$3;
.super Ljava/util/TimerTask;
.source "DeviceListManager.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->startCloudPeriodicUpdate()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/belkin/wemo/cache/devicelist/DeviceListManager;


# direct methods
.method constructor <init>(Lcom/belkin/wemo/cache/devicelist/DeviceListManager;)V
    .locals 0

    .prologue
    .line 761
    iput-object p1, p0, Lcom/belkin/wemo/cache/devicelist/DeviceListManager$3;->this$0:Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    invoke-direct {p0}, Ljava/util/TimerTask;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    .prologue
    .line 764
    const-string v0, "DeviceListManager"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "STARTING CLOUD PERIODIC UPDATE mNetworkUtils.isHomeNetwork(): "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/belkin/wemo/cache/devicelist/DeviceListManager$3;->this$0:Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    invoke-static {v2}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->access$000(Lcom/belkin/wemo/cache/devicelist/DeviceListManager;)Lcom/belkin/wemo/cache/utils/SDKNetworkUtils;

    move-result-object v2

    invoke-virtual {v2}, Lcom/belkin/wemo/cache/utils/SDKNetworkUtils;->isHomeNetwork()Z

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->debugLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 765
    iget-object v0, p0, Lcom/belkin/wemo/cache/devicelist/DeviceListManager$3;->this$0:Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    invoke-static {v0}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->access$000(Lcom/belkin/wemo/cache/devicelist/DeviceListManager;)Lcom/belkin/wemo/cache/utils/SDKNetworkUtils;

    move-result-object v0

    invoke-virtual {v0}, Lcom/belkin/wemo/cache/utils/SDKNetworkUtils;->isHomeNetwork()Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/belkin/wemo/cache/devicelist/DeviceListManager$3;->this$0:Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    invoke-static {v0}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->access$100(Lcom/belkin/wemo/cache/devicelist/DeviceListManager;)Lcom/belkin/wemo/cache/cloud/SmartDiscovery;

    move-result-object v0

    invoke-virtual {v0}, Lcom/belkin/wemo/cache/cloud/SmartDiscovery;->isForcedRemoteEnabled()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 766
    :cond_0
    iget-object v0, p0, Lcom/belkin/wemo/cache/devicelist/DeviceListManager$3;->this$0:Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    invoke-virtual {v0}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->makeCloudRequestForUpdateDeviceList()V

    .line 768
    :cond_1
    return-void
.end method
