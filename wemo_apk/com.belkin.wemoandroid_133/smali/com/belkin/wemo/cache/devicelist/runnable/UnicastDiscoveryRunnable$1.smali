.class Lcom/belkin/wemo/cache/devicelist/runnable/UnicastDiscoveryRunnable$1;
.super Ljava/lang/Object;
.source "UnicastDiscoveryRunnable.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/belkin/wemo/cache/devicelist/runnable/UnicastDiscoveryRunnable;->run()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/belkin/wemo/cache/devicelist/runnable/UnicastDiscoveryRunnable;

.field final synthetic val$devObj:Lcom/belkin/wemo/cache/data/DeviceInformation;


# direct methods
.method constructor <init>(Lcom/belkin/wemo/cache/devicelist/runnable/UnicastDiscoveryRunnable;Lcom/belkin/wemo/cache/data/DeviceInformation;)V
    .locals 0

    .prologue
    .line 68
    iput-object p1, p0, Lcom/belkin/wemo/cache/devicelist/runnable/UnicastDiscoveryRunnable$1;->this$0:Lcom/belkin/wemo/cache/devicelist/runnable/UnicastDiscoveryRunnable;

    iput-object p2, p0, Lcom/belkin/wemo/cache/devicelist/runnable/UnicastDiscoveryRunnable$1;->val$devObj:Lcom/belkin/wemo/cache/data/DeviceInformation;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    .prologue
    .line 71
    iget-object v1, p0, Lcom/belkin/wemo/cache/devicelist/runnable/UnicastDiscoveryRunnable$1;->this$0:Lcom/belkin/wemo/cache/devicelist/runnable/UnicastDiscoveryRunnable;

    invoke-static {v1}, Lcom/belkin/wemo/cache/devicelist/runnable/UnicastDiscoveryRunnable;->access$000(Lcom/belkin/wemo/cache/devicelist/runnable/UnicastDiscoveryRunnable;)Lcom/belkin/wemo/cache/cloud/SmartDiscovery;

    move-result-object v1

    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Lcom/belkin/wemo/cache/cloud/SmartDiscovery;->setUnicastFailedForAnyDevice(Z)V

    .line 72
    new-instance v0, Lcom/belkin/wemo/cache/devicelist/UnicastDeviceDiscovery;

    iget-object v1, p0, Lcom/belkin/wemo/cache/devicelist/runnable/UnicastDiscoveryRunnable$1;->val$devObj:Lcom/belkin/wemo/cache/data/DeviceInformation;

    iget-object v2, p0, Lcom/belkin/wemo/cache/devicelist/runnable/UnicastDiscoveryRunnable$1;->this$0:Lcom/belkin/wemo/cache/devicelist/runnable/UnicastDiscoveryRunnable;

    invoke-static {v2}, Lcom/belkin/wemo/cache/devicelist/runnable/UnicastDiscoveryRunnable;->access$100(Lcom/belkin/wemo/cache/devicelist/runnable/UnicastDiscoveryRunnable;)Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    move-result-object v2

    invoke-direct {v0, v1, v2}, Lcom/belkin/wemo/cache/devicelist/UnicastDeviceDiscovery;-><init>(Lcom/belkin/wemo/cache/data/DeviceInformation;Lcom/belkin/wemo/cache/devicelist/DeviceListManager;)V

    .line 73
    .local v0, "ucDevDisc":Lcom/belkin/wemo/cache/devicelist/UnicastDeviceDiscovery;
    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/belkin/wemo/cache/devicelist/UnicastDeviceDiscovery;->runUnicastDiscovery(Lcom/belkin/wemo/cache/devicelist/listener/UnicastListener;)V

    .line 74
    return-void
.end method
