.class Lcom/belkin/wemo/rules/operation/handler/RMStoreDBRulesLocalHandler$NonRuleDevicesStoreRulesCallback;
.super Lcom/belkin/wemo/rules/operation/handler/RMStoreDBRulesLocalHandler$RuleDevicesStoreDeviceRulesCallback;
.source "RMStoreDBRulesLocalHandler.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/belkin/wemo/rules/operation/handler/RMStoreDBRulesLocalHandler;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "NonRuleDevicesStoreRulesCallback"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/belkin/wemo/rules/operation/handler/RMStoreDBRulesLocalHandler;


# direct methods
.method public constructor <init>(Lcom/belkin/wemo/rules/operation/handler/RMStoreDBRulesLocalHandler;I)V
    .locals 1
    .param p2, "devicesCount"    # I

    .prologue
    .line 193
    iput-object p1, p0, Lcom/belkin/wemo/rules/operation/handler/RMStoreDBRulesLocalHandler$NonRuleDevicesStoreRulesCallback;->this$0:Lcom/belkin/wemo/rules/operation/handler/RMStoreDBRulesLocalHandler;

    .line 194
    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, v0}, Lcom/belkin/wemo/rules/operation/handler/RMStoreDBRulesLocalHandler$RuleDevicesStoreDeviceRulesCallback;-><init>(Lcom/belkin/wemo/rules/operation/handler/RMStoreDBRulesLocalHandler;ILcom/belkin/wemo/rules/operation/handler/RMStoreDBRulesLocalHandler$1;)V

    .line 195
    return-void
.end method


# virtual methods
.method public declared-synchronized onError(Lcom/belkin/wemo/rules/device/error/RMRuleDeviceError;)V
    .locals 3
    .param p1, "error"    # Lcom/belkin/wemo/rules/device/error/RMRuleDeviceError;

    .prologue
    .line 203
    monitor-enter p0

    :try_start_0
    iget v0, p0, Lcom/belkin/wemo/rules/operation/handler/RMStoreDBRulesLocalHandler$NonRuleDevicesStoreRulesCallback;->devicesStoreRulesCallbackCount:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lcom/belkin/wemo/rules/operation/handler/RMStoreDBRulesLocalHandler$NonRuleDevicesStoreRulesCallback;->devicesStoreRulesCallbackCount:I

    .line 204
    invoke-static {}, Lcom/belkin/wemo/rules/operation/handler/RMStoreDBRulesLocalHandler;->access$100()Ljava/lang/String;

    move-result-object v0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "STORE Rules for NON RULE Devices: ERROR: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p1}, Lcom/belkin/wemo/rules/device/error/RMRuleDeviceError;->getDeviceUdn()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "; Device fetched count yet: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget v2, p0, Lcom/belkin/wemo/rules/operation/handler/RMStoreDBRulesLocalHandler$NonRuleDevicesStoreRulesCallback;->devicesStoreRulesCallbackCount:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "; Total NON rule devices count: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget v2, p0, Lcom/belkin/wemo/rules/operation/handler/RMStoreDBRulesLocalHandler$NonRuleDevicesStoreRulesCallback;->devicesCount:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "; ERROR CODE: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p1}, Lcom/belkin/wemo/rules/device/error/RMRuleDeviceError;->getErrorCode()I

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "; MESSAGE: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p1}, Lcom/belkin/wemo/rules/device/error/RMRuleDeviceError;->getErrorMessage()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 209
    monitor-exit p0

    return-void

    .line 203
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized onSuccess(Ljava/lang/String;)V
    .locals 3
    .param p1, "udn"    # Ljava/lang/String;

    .prologue
    .line 213
    monitor-enter p0

    :try_start_0
    iget v0, p0, Lcom/belkin/wemo/rules/operation/handler/RMStoreDBRulesLocalHandler$NonRuleDevicesStoreRulesCallback;->devicesStoreRulesCallbackCount:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lcom/belkin/wemo/rules/operation/handler/RMStoreDBRulesLocalHandler$NonRuleDevicesStoreRulesCallback;->devicesStoreRulesCallbackCount:I

    .line 215
    invoke-static {}, Lcom/belkin/wemo/rules/operation/handler/RMStoreDBRulesLocalHandler;->access$100()Ljava/lang/String;

    move-result-object v0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "STORE Rules for NON Rule Devices: storeRules SUCCESS for device: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "; Device callbacks received: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget v2, p0, Lcom/belkin/wemo/rules/operation/handler/RMStoreDBRulesLocalHandler$NonRuleDevicesStoreRulesCallback;->devicesStoreRulesCallbackCount:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "; NON Rule devices count: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget v2, p0, Lcom/belkin/wemo/rules/operation/handler/RMStoreDBRulesLocalHandler$NonRuleDevicesStoreRulesCallback;->devicesCount:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->debugLog(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 218
    monitor-exit p0

    return-void

    .line 213
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method
