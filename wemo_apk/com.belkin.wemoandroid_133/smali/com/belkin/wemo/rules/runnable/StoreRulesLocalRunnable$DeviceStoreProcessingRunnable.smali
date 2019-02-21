.class Lcom/belkin/wemo/rules/runnable/StoreRulesLocalRunnable$DeviceStoreProcessingRunnable;
.super Lcom/belkin/wemo/runnable/WeMoRunnable;
.source "StoreRulesLocalRunnable.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/belkin/wemo/rules/runnable/StoreRulesLocalRunnable;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "DeviceStoreProcessingRunnable"
.end annotation


# instance fields
.field private callback:Lcom/belkin/wemo/rules/runnable/StoreRulesLocalRunnable$RuleDevicesStoreDeviceRulesCallback;

.field private device:Lorg/cybergarage/upnp/Device;

.field final synthetic this$0:Lcom/belkin/wemo/rules/runnable/StoreRulesLocalRunnable;


# direct methods
.method public constructor <init>(Lcom/belkin/wemo/rules/runnable/StoreRulesLocalRunnable;Lorg/cybergarage/upnp/Device;Lcom/belkin/wemo/rules/runnable/StoreRulesLocalRunnable$RuleDevicesStoreDeviceRulesCallback;)V
    .locals 0
    .param p2, "device"    # Lorg/cybergarage/upnp/Device;
    .param p3, "callback"    # Lcom/belkin/wemo/rules/runnable/StoreRulesLocalRunnable$RuleDevicesStoreDeviceRulesCallback;

    .prologue
    .line 283
    iput-object p1, p0, Lcom/belkin/wemo/rules/runnable/StoreRulesLocalRunnable$DeviceStoreProcessingRunnable;->this$0:Lcom/belkin/wemo/rules/runnable/StoreRulesLocalRunnable;

    invoke-direct {p0}, Lcom/belkin/wemo/runnable/WeMoRunnable;-><init>()V

    .line 284
    iput-object p2, p0, Lcom/belkin/wemo/rules/runnable/StoreRulesLocalRunnable$DeviceStoreProcessingRunnable;->device:Lorg/cybergarage/upnp/Device;

    .line 285
    iput-object p3, p0, Lcom/belkin/wemo/rules/runnable/StoreRulesLocalRunnable$DeviceStoreProcessingRunnable;->callback:Lcom/belkin/wemo/rules/runnable/StoreRulesLocalRunnable$RuleDevicesStoreDeviceRulesCallback;

    .line 286
    return-void
.end method


# virtual methods
.method public run()V
    .locals 9

    .prologue
    .line 290
    new-instance v1, Lcom/belkin/wemo/rules/device/impl/DeviceRulesFactory;

    invoke-direct {v1}, Lcom/belkin/wemo/rules/device/impl/DeviceRulesFactory;-><init>()V

    iget-object v2, p0, Lcom/belkin/wemo/rules/runnable/StoreRulesLocalRunnable$DeviceStoreProcessingRunnable;->device:Lorg/cybergarage/upnp/Device;

    invoke-virtual {v1, v2}, Lcom/belkin/wemo/rules/device/impl/DeviceRulesFactory;->getDeviceRulesInstance(Lorg/cybergarage/upnp/Device;)Lcom/belkin/wemo/rules/device/IDeviceRules;

    move-result-object v0

    .line 292
    .local v0, "deviceRules":Lcom/belkin/wemo/rules/device/IDeviceRules;
    iget-object v1, p0, Lcom/belkin/wemo/rules/runnable/StoreRulesLocalRunnable$DeviceStoreProcessingRunnable;->device:Lorg/cybergarage/upnp/Device;

    invoke-virtual {v1}, Lorg/cybergarage/upnp/Device;->getUDN()Ljava/lang/String;

    move-result-object v7

    .line 293
    .local v7, "deviceUDN":Ljava/lang/String;
    iget-object v1, p0, Lcom/belkin/wemo/rules/runnable/StoreRulesLocalRunnable$DeviceStoreProcessingRunnable;->this$0:Lcom/belkin/wemo/rules/runnable/StoreRulesLocalRunnable;

    invoke-static {v1}, Lcom/belkin/wemo/rules/runnable/StoreRulesLocalRunnable;->access$500(Lcom/belkin/wemo/rules/runnable/StoreRulesLocalRunnable;)Ljava/util/HashMap;

    move-result-object v1

    invoke-virtual {v1, v7}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Lcom/belkin/wemo/rules/runnable/StoreRulesLocalRunnable$ProcessDBModel;

    .line 294
    .local v8, "model":Lcom/belkin/wemo/rules/runnable/StoreRulesLocalRunnable$ProcessDBModel;
    iget-object v1, p0, Lcom/belkin/wemo/rules/runnable/StoreRulesLocalRunnable$DeviceStoreProcessingRunnable;->TAG:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Store Rules: Current  device UDN: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "; ProcessDB state: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v8}, Lcom/belkin/wemo/rules/runnable/StoreRulesLocalRunnable$ProcessDBModel;->getState()I

    move-result v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 296
    if-eqz v0, :cond_0

    .line 297
    iget-object v1, p0, Lcom/belkin/wemo/rules/runnable/StoreRulesLocalRunnable$DeviceStoreProcessingRunnable;->device:Lorg/cybergarage/upnp/Device;

    iget-object v2, p0, Lcom/belkin/wemo/rules/runnable/StoreRulesLocalRunnable$DeviceStoreProcessingRunnable;->callback:Lcom/belkin/wemo/rules/runnable/StoreRulesLocalRunnable$RuleDevicesStoreDeviceRulesCallback;

    iget-object v3, p0, Lcom/belkin/wemo/rules/runnable/StoreRulesLocalRunnable$DeviceStoreProcessingRunnable;->this$0:Lcom/belkin/wemo/rules/runnable/StoreRulesLocalRunnable;

    invoke-static {v3}, Lcom/belkin/wemo/rules/runnable/StoreRulesLocalRunnable;->access$600(Lcom/belkin/wemo/rules/runnable/StoreRulesLocalRunnable;)I

    move-result v3

    invoke-static {v3}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v3

    iget-object v4, p0, Lcom/belkin/wemo/rules/runnable/StoreRulesLocalRunnable$DeviceStoreProcessingRunnable;->this$0:Lcom/belkin/wemo/rules/runnable/StoreRulesLocalRunnable;

    invoke-static {v4}, Lcom/belkin/wemo/rules/runnable/StoreRulesLocalRunnable;->access$700(Lcom/belkin/wemo/rules/runnable/StoreRulesLocalRunnable;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v8}, Lcom/belkin/wemo/rules/runnable/StoreRulesLocalRunnable$ProcessDBModel;->getState()I

    move-result v5

    invoke-virtual {v8}, Lcom/belkin/wemo/rules/runnable/StoreRulesLocalRunnable$ProcessDBModel;->getWeeklyCalendarArray()[Ljava/lang/String;

    move-result-object v6

    invoke-interface/range {v0 .. v6}, Lcom/belkin/wemo/rules/device/IDeviceRules;->storeDeviceRulesData(Lorg/cybergarage/upnp/Device;Lcom/belkin/wemo/rules/device/callback/StoreDeviceRulesCallback;Ljava/lang/String;Ljava/lang/String;I[Ljava/lang/String;)V

    .line 304
    :cond_0
    return-void
.end method
