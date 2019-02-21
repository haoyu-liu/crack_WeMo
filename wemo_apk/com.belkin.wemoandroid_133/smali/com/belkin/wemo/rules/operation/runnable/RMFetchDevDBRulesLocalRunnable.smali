.class public Lcom/belkin/wemo/rules/operation/runnable/RMFetchDevDBRulesLocalRunnable;
.super Lcom/belkin/wemo/runnable/WeMoRunnable;
.source "RMFetchDevDBRulesLocalRunnable.java"


# instance fields
.field private device:Lcom/belkin/wemo/cache/data/DeviceInformation;

.field private rulesDBResponseHandler:Lcom/belkin/wemo/rules/operation/handler/RMFetchDBRulesResponseHandler;


# direct methods
.method public constructor <init>(Lcom/belkin/wemo/cache/data/DeviceInformation;Lcom/belkin/wemo/rules/operation/handler/RMFetchDBRulesResponseHandler;)V
    .locals 0
    .param p1, "device"    # Lcom/belkin/wemo/cache/data/DeviceInformation;
    .param p2, "rulesDBResponseHandler"    # Lcom/belkin/wemo/rules/operation/handler/RMFetchDBRulesResponseHandler;

    .prologue
    .line 14
    invoke-direct {p0}, Lcom/belkin/wemo/runnable/WeMoRunnable;-><init>()V

    .line 15
    iput-object p1, p0, Lcom/belkin/wemo/rules/operation/runnable/RMFetchDevDBRulesLocalRunnable;->device:Lcom/belkin/wemo/cache/data/DeviceInformation;

    .line 16
    iput-object p2, p0, Lcom/belkin/wemo/rules/operation/runnable/RMFetchDevDBRulesLocalRunnable;->rulesDBResponseHandler:Lcom/belkin/wemo/rules/operation/handler/RMFetchDBRulesResponseHandler;

    .line 17
    return-void
.end method


# virtual methods
.method public run()V
    .locals 4

    .prologue
    .line 21
    sget-object v1, Lcom/belkin/wemo/rules/device/dbrules/RMDeviceRulesDBFactory;->INSTANCE:Lcom/belkin/wemo/rules/device/dbrules/RMDeviceRulesDBFactory;

    iget-object v2, p0, Lcom/belkin/wemo/rules/operation/runnable/RMFetchDevDBRulesLocalRunnable;->device:Lcom/belkin/wemo/cache/data/DeviceInformation;

    invoke-virtual {v1, v2}, Lcom/belkin/wemo/rules/device/dbrules/RMDeviceRulesDBFactory;->getDeviceRulesInstance(Lcom/belkin/wemo/cache/data/DeviceInformation;)Lcom/belkin/wemo/rules/device/RMIDeviceRules;

    move-result-object v0

    .line 22
    .local v0, "deviceRulesIns":Lcom/belkin/wemo/rules/device/RMIDeviceRules;
    if-eqz v0, :cond_0

    .line 23
    iget-object v1, p0, Lcom/belkin/wemo/rules/operation/runnable/RMFetchDevDBRulesLocalRunnable;->device:Lcom/belkin/wemo/cache/data/DeviceInformation;

    iget-object v2, p0, Lcom/belkin/wemo/rules/operation/runnable/RMFetchDevDBRulesLocalRunnable;->rulesDBResponseHandler:Lcom/belkin/wemo/rules/operation/handler/RMFetchDBRulesResponseHandler;

    iget-object v3, p0, Lcom/belkin/wemo/rules/operation/runnable/RMFetchDevDBRulesLocalRunnable;->rulesDBResponseHandler:Lcom/belkin/wemo/rules/operation/handler/RMFetchDBRulesResponseHandler;

    invoke-interface {v0, v1, v2, v3}, Lcom/belkin/wemo/rules/device/RMIDeviceRules;->fetchDeviceRulesData(Lcom/belkin/wemo/cache/data/DeviceInformation;Lcom/belkin/wemo/rules/device/callback/RMFetchDeviceRulesSuccesCallback;Lcom/belkin/wemo/rules/device/callback/RMFetchDeviceRulesErrorCallback;)V

    .line 25
    :cond_0
    return-void
.end method
