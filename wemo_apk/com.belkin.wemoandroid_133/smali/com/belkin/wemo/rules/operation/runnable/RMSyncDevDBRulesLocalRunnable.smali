.class public Lcom/belkin/wemo/rules/operation/runnable/RMSyncDevDBRulesLocalRunnable;
.super Lcom/belkin/wemo/runnable/WeMoRunnable;
.source "RMSyncDevDBRulesLocalRunnable.java"


# instance fields
.field private device:Lcom/belkin/wemo/cache/data/DeviceInformation;

.field private params:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation
.end field

.field private rulesDBResponseHandler:Lcom/belkin/wemo/rules/operation/handler/RMSyncDBRulesLocalResponseHandler;


# direct methods
.method public constructor <init>(Lcom/belkin/wemo/cache/data/DeviceInformation;Ljava/util/HashMap;Lcom/belkin/wemo/rules/operation/handler/RMSyncDBRulesLocalResponseHandler;)V
    .locals 0
    .param p1, "device"    # Lcom/belkin/wemo/cache/data/DeviceInformation;
    .param p3, "rulesDBResponseHandler"    # Lcom/belkin/wemo/rules/operation/handler/RMSyncDBRulesLocalResponseHandler;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/belkin/wemo/cache/data/DeviceInformation;",
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;",
            "Lcom/belkin/wemo/rules/operation/handler/RMSyncDBRulesLocalResponseHandler;",
            ")V"
        }
    .end annotation

    .prologue
    .line 19
    .local p2, "params":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    invoke-direct {p0}, Lcom/belkin/wemo/runnable/WeMoRunnable;-><init>()V

    .line 20
    iput-object p1, p0, Lcom/belkin/wemo/rules/operation/runnable/RMSyncDevDBRulesLocalRunnable;->device:Lcom/belkin/wemo/cache/data/DeviceInformation;

    .line 21
    iput-object p3, p0, Lcom/belkin/wemo/rules/operation/runnable/RMSyncDevDBRulesLocalRunnable;->rulesDBResponseHandler:Lcom/belkin/wemo/rules/operation/handler/RMSyncDBRulesLocalResponseHandler;

    .line 22
    iput-object p2, p0, Lcom/belkin/wemo/rules/operation/runnable/RMSyncDevDBRulesLocalRunnable;->params:Ljava/util/HashMap;

    .line 23
    return-void
.end method


# virtual methods
.method public run()V
    .locals 5

    .prologue
    .line 27
    sget-object v1, Lcom/belkin/wemo/rules/device/dbrules/RMDeviceRulesDBFactory;->INSTANCE:Lcom/belkin/wemo/rules/device/dbrules/RMDeviceRulesDBFactory;

    iget-object v2, p0, Lcom/belkin/wemo/rules/operation/runnable/RMSyncDevDBRulesLocalRunnable;->device:Lcom/belkin/wemo/cache/data/DeviceInformation;

    invoke-virtual {v1, v2}, Lcom/belkin/wemo/rules/device/dbrules/RMDeviceRulesDBFactory;->getDeviceRulesInstance(Lcom/belkin/wemo/cache/data/DeviceInformation;)Lcom/belkin/wemo/rules/device/RMIDeviceRules;

    move-result-object v0

    .line 28
    .local v0, "deviceRulesIns":Lcom/belkin/wemo/rules/device/RMIDeviceRules;
    if-eqz v0, :cond_0

    .line 29
    iget-object v1, p0, Lcom/belkin/wemo/rules/operation/runnable/RMSyncDevDBRulesLocalRunnable;->device:Lcom/belkin/wemo/cache/data/DeviceInformation;

    iget-object v2, p0, Lcom/belkin/wemo/rules/operation/runnable/RMSyncDevDBRulesLocalRunnable;->params:Ljava/util/HashMap;

    iget-object v3, p0, Lcom/belkin/wemo/rules/operation/runnable/RMSyncDevDBRulesLocalRunnable;->rulesDBResponseHandler:Lcom/belkin/wemo/rules/operation/handler/RMSyncDBRulesLocalResponseHandler;

    iget-object v4, p0, Lcom/belkin/wemo/rules/operation/runnable/RMSyncDevDBRulesLocalRunnable;->rulesDBResponseHandler:Lcom/belkin/wemo/rules/operation/handler/RMSyncDBRulesLocalResponseHandler;

    invoke-interface {v0, v1, v2, v3, v4}, Lcom/belkin/wemo/rules/device/RMIDeviceRules;->syncDeviceRulesData(Lcom/belkin/wemo/cache/data/DeviceInformation;Ljava/util/HashMap;Lcom/belkin/wemo/rules/device/callback/RMStoreDeviceRulesSuccesCallback;Lcom/belkin/wemo/rules/device/callback/RMStoreDeviceRulesErrorCallback;)V

    .line 31
    :cond_0
    return-void
.end method
