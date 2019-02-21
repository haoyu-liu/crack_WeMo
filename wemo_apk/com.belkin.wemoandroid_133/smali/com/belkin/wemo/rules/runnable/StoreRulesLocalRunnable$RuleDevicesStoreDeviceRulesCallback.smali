.class Lcom/belkin/wemo/rules/runnable/StoreRulesLocalRunnable$RuleDevicesStoreDeviceRulesCallback;
.super Ljava/lang/Object;
.source "StoreRulesLocalRunnable.java"

# interfaces
.implements Lcom/belkin/wemo/rules/device/callback/StoreDeviceRulesCallback;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/belkin/wemo/rules/runnable/StoreRulesLocalRunnable;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "RuleDevicesStoreDeviceRulesCallback"
.end annotation


# instance fields
.field protected devicesCount:I

.field protected devicesStoreRulesCallbackCount:I

.field private ruleDeviceErrorCount:I

.field final synthetic this$0:Lcom/belkin/wemo/rules/runnable/StoreRulesLocalRunnable;


# direct methods
.method private constructor <init>(Lcom/belkin/wemo/rules/runnable/StoreRulesLocalRunnable;I)V
    .locals 0
    .param p2, "devicesCount"    # I

    .prologue
    .line 359
    iput-object p1, p0, Lcom/belkin/wemo/rules/runnable/StoreRulesLocalRunnable$RuleDevicesStoreDeviceRulesCallback;->this$0:Lcom/belkin/wemo/rules/runnable/StoreRulesLocalRunnable;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 360
    iput p2, p0, Lcom/belkin/wemo/rules/runnable/StoreRulesLocalRunnable$RuleDevicesStoreDeviceRulesCallback;->devicesCount:I

    .line 361
    return-void
.end method

.method synthetic constructor <init>(Lcom/belkin/wemo/rules/runnable/StoreRulesLocalRunnable;ILcom/belkin/wemo/rules/runnable/StoreRulesLocalRunnable$1;)V
    .locals 0
    .param p1, "x0"    # Lcom/belkin/wemo/rules/runnable/StoreRulesLocalRunnable;
    .param p2, "x1"    # I
    .param p3, "x2"    # Lcom/belkin/wemo/rules/runnable/StoreRulesLocalRunnable$1;

    .prologue
    .line 353
    invoke-direct {p0, p1, p2}, Lcom/belkin/wemo/rules/runnable/StoreRulesLocalRunnable$RuleDevicesStoreDeviceRulesCallback;-><init>(Lcom/belkin/wemo/rules/runnable/StoreRulesLocalRunnable;I)V

    return-void
.end method


# virtual methods
.method public declared-synchronized onError(Lcom/belkin/wemo/rules/device/error/RuleDeviceError;)V
    .locals 3
    .param p1, "error"    # Lcom/belkin/wemo/rules/device/error/RuleDeviceError;

    .prologue
    .line 365
    monitor-enter p0

    :try_start_0
    iget v0, p0, Lcom/belkin/wemo/rules/runnable/StoreRulesLocalRunnable$RuleDevicesStoreDeviceRulesCallback;->devicesStoreRulesCallbackCount:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lcom/belkin/wemo/rules/runnable/StoreRulesLocalRunnable$RuleDevicesStoreDeviceRulesCallback;->devicesStoreRulesCallbackCount:I

    .line 366
    iget v0, p0, Lcom/belkin/wemo/rules/runnable/StoreRulesLocalRunnable$RuleDevicesStoreDeviceRulesCallback;->ruleDeviceErrorCount:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lcom/belkin/wemo/rules/runnable/StoreRulesLocalRunnable$RuleDevicesStoreDeviceRulesCallback;->ruleDeviceErrorCount:I

    .line 368
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

    iget v2, p0, Lcom/belkin/wemo/rules/runnable/StoreRulesLocalRunnable$RuleDevicesStoreDeviceRulesCallback;->devicesStoreRulesCallbackCount:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "; Total rule devices count: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget v2, p0, Lcom/belkin/wemo/rules/runnable/StoreRulesLocalRunnable$RuleDevicesStoreDeviceRulesCallback;->devicesCount:I

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

    .line 374
    iget v0, p0, Lcom/belkin/wemo/rules/runnable/StoreRulesLocalRunnable$RuleDevicesStoreDeviceRulesCallback;->devicesStoreRulesCallbackCount:I

    iget v1, p0, Lcom/belkin/wemo/rules/runnable/StoreRulesLocalRunnable$RuleDevicesStoreDeviceRulesCallback;->devicesCount:I

    if-ne v0, v1, :cond_0

    .line 375
    invoke-virtual {p0}, Lcom/belkin/wemo/rules/runnable/StoreRulesLocalRunnable$RuleDevicesStoreDeviceRulesCallback;->onRulesSyncAttemptsComplete()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 377
    :cond_0
    monitor-exit p0

    return-void

    .line 365
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method protected onRulesSyncAttemptsComplete()V
    .locals 5

    .prologue
    .line 393
    const-string v0, "StoreRulesLocalRunnable"

    const-string v1, "Store Rules: All rule devices callbacks received."

    invoke-static {v0, v1}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 395
    iget v0, p0, Lcom/belkin/wemo/rules/runnable/StoreRulesLocalRunnable$RuleDevicesStoreDeviceRulesCallback;->ruleDeviceErrorCount:I

    iget v1, p0, Lcom/belkin/wemo/rules/runnable/StoreRulesLocalRunnable$RuleDevicesStoreDeviceRulesCallback;->devicesCount:I

    if-ne v0, v1, :cond_1

    .line 396
    const-string v0, "StoreRulesLocalRunnable"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Store Rules: Store rule on all rule devices failed. Rule devices count: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget v2, p0, Lcom/belkin/wemo/rules/runnable/StoreRulesLocalRunnable$RuleDevicesStoreDeviceRulesCallback;->devicesCount:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/belkin/utils/LogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 398
    iget-object v0, p0, Lcom/belkin/wemo/rules/runnable/StoreRulesLocalRunnable$RuleDevicesStoreDeviceRulesCallback;->this$0:Lcom/belkin/wemo/rules/runnable/StoreRulesLocalRunnable;

    invoke-static {v0}, Lcom/belkin/wemo/rules/runnable/StoreRulesLocalRunnable;->access$200(Lcom/belkin/wemo/rules/runnable/StoreRulesLocalRunnable;)Lcom/belkin/wemo/rules/callback/StoreRulesErrorCallback;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 399
    iget-object v0, p0, Lcom/belkin/wemo/rules/runnable/StoreRulesLocalRunnable$RuleDevicesStoreDeviceRulesCallback;->this$0:Lcom/belkin/wemo/rules/runnable/StoreRulesLocalRunnable;

    invoke-static {v0}, Lcom/belkin/wemo/rules/runnable/StoreRulesLocalRunnable;->access$200(Lcom/belkin/wemo/rules/runnable/StoreRulesLocalRunnable;)Lcom/belkin/wemo/rules/callback/StoreRulesErrorCallback;

    move-result-object v0

    new-instance v1, Lcom/belkin/wemo/rules/error/RMRulesError;

    const/4 v2, -0x3

    const-string v3, "Rule could not be saved on even a single rule device."

    invoke-direct {v1, v2, v3}, Lcom/belkin/wemo/rules/error/RMRulesError;-><init>(ILjava/lang/String;)V

    invoke-interface {v0, v1}, Lcom/belkin/wemo/rules/callback/StoreRulesErrorCallback;->onError(Lcom/belkin/wemo/rules/error/RMRulesError;)V

    .line 413
    :cond_0
    :goto_0
    return-void

    .line 403
    :cond_1
    iget-object v0, p0, Lcom/belkin/wemo/rules/runnable/StoreRulesLocalRunnable$RuleDevicesStoreDeviceRulesCallback;->this$0:Lcom/belkin/wemo/rules/runnable/StoreRulesLocalRunnable;

    invoke-static {v0}, Lcom/belkin/wemo/rules/runnable/StoreRulesLocalRunnable;->access$1100(Lcom/belkin/wemo/rules/runnable/StoreRulesLocalRunnable;)Ljava/util/List;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    if-lez v0, :cond_2

    .line 404
    iget-object v0, p0, Lcom/belkin/wemo/rules/runnable/StoreRulesLocalRunnable$RuleDevicesStoreDeviceRulesCallback;->this$0:Lcom/belkin/wemo/rules/runnable/StoreRulesLocalRunnable;

    iget-object v1, p0, Lcom/belkin/wemo/rules/runnable/StoreRulesLocalRunnable$RuleDevicesStoreDeviceRulesCallback;->this$0:Lcom/belkin/wemo/rules/runnable/StoreRulesLocalRunnable;

    invoke-static {v1}, Lcom/belkin/wemo/rules/runnable/StoreRulesLocalRunnable;->access$1100(Lcom/belkin/wemo/rules/runnable/StoreRulesLocalRunnable;)Ljava/util/List;

    move-result-object v1

    new-instance v2, Lcom/belkin/wemo/rules/runnable/StoreRulesLocalRunnable$NonRuleDevicesStoreRulesCallback;

    iget-object v3, p0, Lcom/belkin/wemo/rules/runnable/StoreRulesLocalRunnable$RuleDevicesStoreDeviceRulesCallback;->this$0:Lcom/belkin/wemo/rules/runnable/StoreRulesLocalRunnable;

    iget-object v4, p0, Lcom/belkin/wemo/rules/runnable/StoreRulesLocalRunnable$RuleDevicesStoreDeviceRulesCallback;->this$0:Lcom/belkin/wemo/rules/runnable/StoreRulesLocalRunnable;

    invoke-static {v4}, Lcom/belkin/wemo/rules/runnable/StoreRulesLocalRunnable;->access$1100(Lcom/belkin/wemo/rules/runnable/StoreRulesLocalRunnable;)Ljava/util/List;

    move-result-object v4

    invoke-interface {v4}, Ljava/util/List;->size()I

    move-result v4

    invoke-direct {v2, v3, v4}, Lcom/belkin/wemo/rules/runnable/StoreRulesLocalRunnable$NonRuleDevicesStoreRulesCallback;-><init>(Lcom/belkin/wemo/rules/runnable/StoreRulesLocalRunnable;I)V

    invoke-static {v0, v1, v2}, Lcom/belkin/wemo/rules/runnable/StoreRulesLocalRunnable;->access$1200(Lcom/belkin/wemo/rules/runnable/StoreRulesLocalRunnable;Ljava/util/List;Lcom/belkin/wemo/rules/runnable/StoreRulesLocalRunnable$RuleDevicesStoreDeviceRulesCallback;)V

    goto :goto_0

    .line 407
    :cond_2
    iget-object v0, p0, Lcom/belkin/wemo/rules/runnable/StoreRulesLocalRunnable$RuleDevicesStoreDeviceRulesCallback;->this$0:Lcom/belkin/wemo/rules/runnable/StoreRulesLocalRunnable;

    invoke-static {v0}, Lcom/belkin/wemo/rules/runnable/StoreRulesLocalRunnable;->access$1000(Lcom/belkin/wemo/rules/runnable/StoreRulesLocalRunnable;)Lcom/belkin/wemo/cache/utils/SharePreferences;

    move-result-object v0

    iget-object v1, p0, Lcom/belkin/wemo/rules/runnable/StoreRulesLocalRunnable$RuleDevicesStoreDeviceRulesCallback;->this$0:Lcom/belkin/wemo/rules/runnable/StoreRulesLocalRunnable;

    invoke-static {v1}, Lcom/belkin/wemo/rules/runnable/StoreRulesLocalRunnable;->access$900(Lcom/belkin/wemo/rules/runnable/StoreRulesLocalRunnable;)I

    move-result v1

    invoke-static {v1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/belkin/wemo/cache/utils/SharePreferences;->setDBVersion(Ljava/lang/String;)V

    .line 408
    iget-object v0, p0, Lcom/belkin/wemo/rules/runnable/StoreRulesLocalRunnable$RuleDevicesStoreDeviceRulesCallback;->this$0:Lcom/belkin/wemo/rules/runnable/StoreRulesLocalRunnable;

    invoke-static {v0}, Lcom/belkin/wemo/rules/runnable/StoreRulesLocalRunnable;->access$800(Lcom/belkin/wemo/rules/runnable/StoreRulesLocalRunnable;)Lcom/belkin/wemo/rules/callback/StoreRulesSuccessCallback;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 409
    iget-object v0, p0, Lcom/belkin/wemo/rules/runnable/StoreRulesLocalRunnable$RuleDevicesStoreDeviceRulesCallback;->this$0:Lcom/belkin/wemo/rules/runnable/StoreRulesLocalRunnable;

    invoke-static {v0}, Lcom/belkin/wemo/rules/runnable/StoreRulesLocalRunnable;->access$800(Lcom/belkin/wemo/rules/runnable/StoreRulesLocalRunnable;)Lcom/belkin/wemo/rules/callback/StoreRulesSuccessCallback;

    move-result-object v0

    invoke-interface {v0}, Lcom/belkin/wemo/rules/callback/StoreRulesSuccessCallback;->onSuccess()V

    goto :goto_0
.end method

.method public declared-synchronized onSuccess(Ljava/lang/String;)V
    .locals 3
    .param p1, "udn"    # Ljava/lang/String;

    .prologue
    .line 381
    monitor-enter p0

    :try_start_0
    iget v0, p0, Lcom/belkin/wemo/rules/runnable/StoreRulesLocalRunnable$RuleDevicesStoreDeviceRulesCallback;->devicesStoreRulesCallbackCount:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lcom/belkin/wemo/rules/runnable/StoreRulesLocalRunnable$RuleDevicesStoreDeviceRulesCallback;->devicesStoreRulesCallbackCount:I

    .line 383
    const-string v0, "StoreRulesLocalRunnable"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "STORE Rules for Rule Devices: storeRules SUCCESS for device: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "; Device callbacks received: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget v2, p0, Lcom/belkin/wemo/rules/runnable/StoreRulesLocalRunnable$RuleDevicesStoreDeviceRulesCallback;->devicesStoreRulesCallbackCount:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "; Rule devices count: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget v2, p0, Lcom/belkin/wemo/rules/runnable/StoreRulesLocalRunnable$RuleDevicesStoreDeviceRulesCallback;->devicesCount:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 387
    iget v0, p0, Lcom/belkin/wemo/rules/runnable/StoreRulesLocalRunnable$RuleDevicesStoreDeviceRulesCallback;->devicesStoreRulesCallbackCount:I

    iget v1, p0, Lcom/belkin/wemo/rules/runnable/StoreRulesLocalRunnable$RuleDevicesStoreDeviceRulesCallback;->devicesCount:I

    if-ne v0, v1, :cond_0

    .line 388
    invoke-virtual {p0}, Lcom/belkin/wemo/rules/runnable/StoreRulesLocalRunnable$RuleDevicesStoreDeviceRulesCallback;->onRulesSyncAttemptsComplete()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 390
    :cond_0
    monitor-exit p0

    return-void

    .line 381
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method
