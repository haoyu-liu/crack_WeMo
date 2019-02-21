.class Lcom/belkin/wemo/rules/runnable/StoreRulesLocalRunnable$NonRuleDevicesStoreRulesCallback;
.super Lcom/belkin/wemo/rules/runnable/StoreRulesLocalRunnable$RuleDevicesStoreDeviceRulesCallback;
.source "StoreRulesLocalRunnable.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/belkin/wemo/rules/runnable/StoreRulesLocalRunnable;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "NonRuleDevicesStoreRulesCallback"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/belkin/wemo/rules/runnable/StoreRulesLocalRunnable;


# direct methods
.method public constructor <init>(Lcom/belkin/wemo/rules/runnable/StoreRulesLocalRunnable;I)V
    .locals 1
    .param p2, "devicesCount"    # I

    .prologue
    .line 309
    iput-object p1, p0, Lcom/belkin/wemo/rules/runnable/StoreRulesLocalRunnable$NonRuleDevicesStoreRulesCallback;->this$0:Lcom/belkin/wemo/rules/runnable/StoreRulesLocalRunnable;

    .line 310
    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, v0}, Lcom/belkin/wemo/rules/runnable/StoreRulesLocalRunnable$RuleDevicesStoreDeviceRulesCallback;-><init>(Lcom/belkin/wemo/rules/runnable/StoreRulesLocalRunnable;ILcom/belkin/wemo/rules/runnable/StoreRulesLocalRunnable$1;)V

    .line 311
    return-void
.end method


# virtual methods
.method public declared-synchronized onError(Lcom/belkin/wemo/rules/device/error/RuleDeviceError;)V
    .locals 3
    .param p1, "error"    # Lcom/belkin/wemo/rules/device/error/RuleDeviceError;

    .prologue
    .line 315
    monitor-enter p0

    :try_start_0
    iget v0, p0, Lcom/belkin/wemo/rules/runnable/StoreRulesLocalRunnable$NonRuleDevicesStoreRulesCallback;->devicesStoreRulesCallbackCount:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lcom/belkin/wemo/rules/runnable/StoreRulesLocalRunnable$NonRuleDevicesStoreRulesCallback;->devicesStoreRulesCallbackCount:I

    .line 317
    const-string v0, "StoreRulesLocalRunnable"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "STORE Rules for Rule Devices: storeRules ERROR for device: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p1}, Lcom/belkin/wemo/rules/device/error/RuleDeviceError;->getDeviceUdn()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "; Device fetched count yet: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget v2, p0, Lcom/belkin/wemo/rules/runnable/StoreRulesLocalRunnable$NonRuleDevicesStoreRulesCallback;->devicesStoreRulesCallbackCount:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "; Total non rule devices count: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget v2, p0, Lcom/belkin/wemo/rules/runnable/StoreRulesLocalRunnable$NonRuleDevicesStoreRulesCallback;->devicesCount:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "; ERROR CODE: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p1}, Lcom/belkin/wemo/rules/device/error/RuleDeviceError;->getErrorCode()I

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "; MESSAGE: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p1}, Lcom/belkin/wemo/rules/device/error/RuleDeviceError;->getErrorMessage()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/belkin/utils/LogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 323
    iget v0, p0, Lcom/belkin/wemo/rules/runnable/StoreRulesLocalRunnable$NonRuleDevicesStoreRulesCallback;->devicesStoreRulesCallbackCount:I

    iget v1, p0, Lcom/belkin/wemo/rules/runnable/StoreRulesLocalRunnable$NonRuleDevicesStoreRulesCallback;->devicesCount:I

    if-ne v0, v1, :cond_0

    .line 324
    invoke-virtual {p0}, Lcom/belkin/wemo/rules/runnable/StoreRulesLocalRunnable$NonRuleDevicesStoreRulesCallback;->onRulesSyncAttemptsComplete()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 326
    :cond_0
    monitor-exit p0

    return-void

    .line 315
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method protected onRulesSyncAttemptsComplete()V
    .locals 2

    .prologue
    .line 342
    const-string v0, "StoreRulesLocalRunnable"

    const-string v1, "Store Rules: All NON rule devices callbacks received."

    invoke-static {v0, v1}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 345
    iget-object v0, p0, Lcom/belkin/wemo/rules/runnable/StoreRulesLocalRunnable$NonRuleDevicesStoreRulesCallback;->this$0:Lcom/belkin/wemo/rules/runnable/StoreRulesLocalRunnable;

    invoke-static {v0}, Lcom/belkin/wemo/rules/runnable/StoreRulesLocalRunnable;->access$800(Lcom/belkin/wemo/rules/runnable/StoreRulesLocalRunnable;)Lcom/belkin/wemo/rules/callback/StoreRulesSuccessCallback;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 347
    iget-object v0, p0, Lcom/belkin/wemo/rules/runnable/StoreRulesLocalRunnable$NonRuleDevicesStoreRulesCallback;->this$0:Lcom/belkin/wemo/rules/runnable/StoreRulesLocalRunnable;

    invoke-static {v0}, Lcom/belkin/wemo/rules/runnable/StoreRulesLocalRunnable;->access$1000(Lcom/belkin/wemo/rules/runnable/StoreRulesLocalRunnable;)Lcom/belkin/wemo/cache/utils/SharePreferences;

    move-result-object v0

    iget-object v1, p0, Lcom/belkin/wemo/rules/runnable/StoreRulesLocalRunnable$NonRuleDevicesStoreRulesCallback;->this$0:Lcom/belkin/wemo/rules/runnable/StoreRulesLocalRunnable;

    invoke-static {v1}, Lcom/belkin/wemo/rules/runnable/StoreRulesLocalRunnable;->access$900(Lcom/belkin/wemo/rules/runnable/StoreRulesLocalRunnable;)I

    move-result v1

    invoke-static {v1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/belkin/wemo/cache/utils/SharePreferences;->setDBVersion(Ljava/lang/String;)V

    .line 348
    iget-object v0, p0, Lcom/belkin/wemo/rules/runnable/StoreRulesLocalRunnable$NonRuleDevicesStoreRulesCallback;->this$0:Lcom/belkin/wemo/rules/runnable/StoreRulesLocalRunnable;

    invoke-static {v0}, Lcom/belkin/wemo/rules/runnable/StoreRulesLocalRunnable;->access$800(Lcom/belkin/wemo/rules/runnable/StoreRulesLocalRunnable;)Lcom/belkin/wemo/rules/callback/StoreRulesSuccessCallback;

    move-result-object v0

    invoke-interface {v0}, Lcom/belkin/wemo/rules/callback/StoreRulesSuccessCallback;->onSuccess()V

    .line 350
    :cond_0
    return-void
.end method

.method public declared-synchronized onSuccess(Ljava/lang/String;)V
    .locals 3
    .param p1, "udn"    # Ljava/lang/String;

    .prologue
    .line 330
    monitor-enter p0

    :try_start_0
    iget v0, p0, Lcom/belkin/wemo/rules/runnable/StoreRulesLocalRunnable$NonRuleDevicesStoreRulesCallback;->devicesStoreRulesCallbackCount:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lcom/belkin/wemo/rules/runnable/StoreRulesLocalRunnable$NonRuleDevicesStoreRulesCallback;->devicesStoreRulesCallbackCount:I

    .line 332
    const-string v0, "StoreRulesLocalRunnable"

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

    iget v2, p0, Lcom/belkin/wemo/rules/runnable/StoreRulesLocalRunnable$NonRuleDevicesStoreRulesCallback;->devicesStoreRulesCallbackCount:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "; NON Rule devices count: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget v2, p0, Lcom/belkin/wemo/rules/runnable/StoreRulesLocalRunnable$NonRuleDevicesStoreRulesCallback;->devicesCount:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 336
    iget v0, p0, Lcom/belkin/wemo/rules/runnable/StoreRulesLocalRunnable$NonRuleDevicesStoreRulesCallback;->devicesStoreRulesCallbackCount:I

    iget v1, p0, Lcom/belkin/wemo/rules/runnable/StoreRulesLocalRunnable$NonRuleDevicesStoreRulesCallback;->devicesCount:I

    if-ne v0, v1, :cond_0

    .line 337
    invoke-virtual {p0}, Lcom/belkin/wemo/rules/runnable/StoreRulesLocalRunnable$NonRuleDevicesStoreRulesCallback;->onRulesSyncAttemptsComplete()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 339
    :cond_0
    monitor-exit p0

    return-void

    .line 330
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method
