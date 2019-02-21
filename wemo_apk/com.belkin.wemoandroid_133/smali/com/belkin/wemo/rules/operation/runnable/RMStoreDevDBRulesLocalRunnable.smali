.class public Lcom/belkin/wemo/rules/operation/runnable/RMStoreDevDBRulesLocalRunnable;
.super Lcom/belkin/wemo/runnable/WeMoRunnable;
.source "RMStoreDevDBRulesLocalRunnable.java"


# instance fields
.field private device:Lcom/belkin/wemo/cache/data/DeviceInformation;

.field private errorCallback:Lcom/belkin/wemo/rules/device/callback/RMStoreDeviceRulesErrorCallback;

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

.field private rule:Lcom/belkin/wemo/rules/data/RMDBRule;

.field private successCallback:Lcom/belkin/wemo/rules/device/callback/RMStoreDeviceRulesSuccesCallback;


# direct methods
.method public constructor <init>(Lcom/belkin/wemo/rules/data/RMDBRule;Lcom/belkin/wemo/cache/data/DeviceInformation;Ljava/util/HashMap;Lcom/belkin/wemo/rules/device/callback/RMStoreDeviceRulesSuccesCallback;Lcom/belkin/wemo/rules/device/callback/RMStoreDeviceRulesErrorCallback;)V
    .locals 0
    .param p1, "rule"    # Lcom/belkin/wemo/rules/data/RMDBRule;
    .param p2, "device"    # Lcom/belkin/wemo/cache/data/DeviceInformation;
    .param p4, "successCallback"    # Lcom/belkin/wemo/rules/device/callback/RMStoreDeviceRulesSuccesCallback;
    .param p5, "errorCallback"    # Lcom/belkin/wemo/rules/device/callback/RMStoreDeviceRulesErrorCallback;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/belkin/wemo/rules/data/RMDBRule;",
            "Lcom/belkin/wemo/cache/data/DeviceInformation;",
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;",
            "Lcom/belkin/wemo/rules/device/callback/RMStoreDeviceRulesSuccesCallback;",
            "Lcom/belkin/wemo/rules/device/callback/RMStoreDeviceRulesErrorCallback;",
            ")V"
        }
    .end annotation

    .prologue
    .line 22
    .local p3, "params":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    invoke-direct {p0}, Lcom/belkin/wemo/runnable/WeMoRunnable;-><init>()V

    .line 23
    iput-object p2, p0, Lcom/belkin/wemo/rules/operation/runnable/RMStoreDevDBRulesLocalRunnable;->device:Lcom/belkin/wemo/cache/data/DeviceInformation;

    .line 24
    iput-object p4, p0, Lcom/belkin/wemo/rules/operation/runnable/RMStoreDevDBRulesLocalRunnable;->successCallback:Lcom/belkin/wemo/rules/device/callback/RMStoreDeviceRulesSuccesCallback;

    .line 25
    iput-object p5, p0, Lcom/belkin/wemo/rules/operation/runnable/RMStoreDevDBRulesLocalRunnable;->errorCallback:Lcom/belkin/wemo/rules/device/callback/RMStoreDeviceRulesErrorCallback;

    .line 26
    iput-object p1, p0, Lcom/belkin/wemo/rules/operation/runnable/RMStoreDevDBRulesLocalRunnable;->rule:Lcom/belkin/wemo/rules/data/RMDBRule;

    .line 27
    iput-object p3, p0, Lcom/belkin/wemo/rules/operation/runnable/RMStoreDevDBRulesLocalRunnable;->params:Ljava/util/HashMap;

    .line 28
    return-void
.end method


# virtual methods
.method public run()V
    .locals 6

    .prologue
    .line 32
    sget-object v1, Lcom/belkin/wemo/rules/device/dbrules/RMDeviceRulesDBFactory;->INSTANCE:Lcom/belkin/wemo/rules/device/dbrules/RMDeviceRulesDBFactory;

    iget-object v2, p0, Lcom/belkin/wemo/rules/operation/runnable/RMStoreDevDBRulesLocalRunnable;->device:Lcom/belkin/wemo/cache/data/DeviceInformation;

    invoke-virtual {v1, v2}, Lcom/belkin/wemo/rules/device/dbrules/RMDeviceRulesDBFactory;->getDeviceRulesInstance(Lcom/belkin/wemo/cache/data/DeviceInformation;)Lcom/belkin/wemo/rules/device/RMIDeviceRules;

    move-result-object v0

    .line 33
    .local v0, "deviceRulesIns":Lcom/belkin/wemo/rules/device/RMIDeviceRules;
    if-eqz v0, :cond_0

    .line 34
    iget-object v1, p0, Lcom/belkin/wemo/rules/operation/runnable/RMStoreDevDBRulesLocalRunnable;->device:Lcom/belkin/wemo/cache/data/DeviceInformation;

    iget-object v2, p0, Lcom/belkin/wemo/rules/operation/runnable/RMStoreDevDBRulesLocalRunnable;->rule:Lcom/belkin/wemo/rules/data/RMDBRule;

    iget-object v3, p0, Lcom/belkin/wemo/rules/operation/runnable/RMStoreDevDBRulesLocalRunnable;->params:Ljava/util/HashMap;

    iget-object v4, p0, Lcom/belkin/wemo/rules/operation/runnable/RMStoreDevDBRulesLocalRunnable;->successCallback:Lcom/belkin/wemo/rules/device/callback/RMStoreDeviceRulesSuccesCallback;

    iget-object v5, p0, Lcom/belkin/wemo/rules/operation/runnable/RMStoreDevDBRulesLocalRunnable;->errorCallback:Lcom/belkin/wemo/rules/device/callback/RMStoreDeviceRulesErrorCallback;

    invoke-interface/range {v0 .. v5}, Lcom/belkin/wemo/rules/device/RMIDeviceRules;->storeDeviceRulesData(Lcom/belkin/wemo/cache/data/DeviceInformation;Lcom/belkin/wemo/rules/data/RMDBRule;Ljava/util/HashMap;Lcom/belkin/wemo/rules/device/callback/RMStoreDeviceRulesSuccesCallback;Lcom/belkin/wemo/rules/device/callback/RMStoreDeviceRulesErrorCallback;)V

    .line 36
    :cond_0
    return-void
.end method
