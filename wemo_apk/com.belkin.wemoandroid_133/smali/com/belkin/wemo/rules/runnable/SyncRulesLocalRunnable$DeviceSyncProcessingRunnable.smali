.class Lcom/belkin/wemo/rules/runnable/SyncRulesLocalRunnable$DeviceSyncProcessingRunnable;
.super Lcom/belkin/wemo/runnable/WeMoRunnable;
.source "SyncRulesLocalRunnable.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/belkin/wemo/rules/runnable/SyncRulesLocalRunnable;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "DeviceSyncProcessingRunnable"
.end annotation


# instance fields
.field private device:Lorg/cybergarage/upnp/Device;

.field final synthetic this$0:Lcom/belkin/wemo/rules/runnable/SyncRulesLocalRunnable;


# direct methods
.method public constructor <init>(Lcom/belkin/wemo/rules/runnable/SyncRulesLocalRunnable;Lorg/cybergarage/upnp/Device;)V
    .locals 0
    .param p2, "device"    # Lorg/cybergarage/upnp/Device;

    .prologue
    .line 119
    iput-object p1, p0, Lcom/belkin/wemo/rules/runnable/SyncRulesLocalRunnable$DeviceSyncProcessingRunnable;->this$0:Lcom/belkin/wemo/rules/runnable/SyncRulesLocalRunnable;

    invoke-direct {p0}, Lcom/belkin/wemo/runnable/WeMoRunnable;-><init>()V

    .line 120
    iput-object p2, p0, Lcom/belkin/wemo/rules/runnable/SyncRulesLocalRunnable$DeviceSyncProcessingRunnable;->device:Lorg/cybergarage/upnp/Device;

    .line 121
    return-void
.end method


# virtual methods
.method public run()V
    .locals 7

    .prologue
    .line 125
    new-instance v1, Lcom/belkin/wemo/rules/device/impl/DeviceRulesFactory;

    invoke-direct {v1}, Lcom/belkin/wemo/rules/device/impl/DeviceRulesFactory;-><init>()V

    iget-object v2, p0, Lcom/belkin/wemo/rules/runnable/SyncRulesLocalRunnable$DeviceSyncProcessingRunnable;->device:Lorg/cybergarage/upnp/Device;

    invoke-virtual {v1, v2}, Lcom/belkin/wemo/rules/device/impl/DeviceRulesFactory;->getDeviceRulesInstance(Lorg/cybergarage/upnp/Device;)Lcom/belkin/wemo/rules/device/IDeviceRules;

    move-result-object v0

    .line 127
    .local v0, "deviceRules":Lcom/belkin/wemo/rules/device/IDeviceRules;
    if-eqz v0, :cond_0

    .line 131
    iget-object v1, p0, Lcom/belkin/wemo/rules/runnable/SyncRulesLocalRunnable$DeviceSyncProcessingRunnable;->device:Lorg/cybergarage/upnp/Device;

    const/4 v2, 0x0

    iget-object v3, p0, Lcom/belkin/wemo/rules/runnable/SyncRulesLocalRunnable$DeviceSyncProcessingRunnable;->this$0:Lcom/belkin/wemo/rules/runnable/SyncRulesLocalRunnable;

    invoke-static {v3}, Lcom/belkin/wemo/rules/runnable/SyncRulesLocalRunnable;->access$000(Lcom/belkin/wemo/rules/runnable/SyncRulesLocalRunnable;)I

    move-result v3

    invoke-static {v3}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v3

    iget-object v4, p0, Lcom/belkin/wemo/rules/runnable/SyncRulesLocalRunnable$DeviceSyncProcessingRunnable;->this$0:Lcom/belkin/wemo/rules/runnable/SyncRulesLocalRunnable;

    invoke-static {v4}, Lcom/belkin/wemo/rules/runnable/SyncRulesLocalRunnable;->access$100(Lcom/belkin/wemo/rules/runnable/SyncRulesLocalRunnable;)Ljava/lang/String;

    move-result-object v4

    const/4 v5, -0x1

    const/4 v6, 0x0

    new-array v6, v6, [Ljava/lang/String;

    invoke-interface/range {v0 .. v6}, Lcom/belkin/wemo/rules/device/IDeviceRules;->storeDeviceRulesData(Lorg/cybergarage/upnp/Device;Lcom/belkin/wemo/rules/device/callback/StoreDeviceRulesCallback;Ljava/lang/String;Ljava/lang/String;I[Ljava/lang/String;)V

    .line 138
    :cond_0
    return-void
.end method
