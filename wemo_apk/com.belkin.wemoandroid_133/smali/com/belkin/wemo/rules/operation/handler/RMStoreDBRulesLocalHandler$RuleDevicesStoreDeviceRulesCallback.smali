.class Lcom/belkin/wemo/rules/operation/handler/RMStoreDBRulesLocalHandler$RuleDevicesStoreDeviceRulesCallback;
.super Ljava/lang/Object;
.source "RMStoreDBRulesLocalHandler.java"

# interfaces
.implements Lcom/belkin/wemo/rules/device/callback/RMStoreDeviceRulesErrorCallback;
.implements Lcom/belkin/wemo/rules/device/callback/RMStoreDeviceRulesSuccesCallback;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/belkin/wemo/rules/operation/handler/RMStoreDBRulesLocalHandler;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "RuleDevicesStoreDeviceRulesCallback"
.end annotation


# instance fields
.field protected devicesCount:I

.field protected devicesStoreRulesCallbackCount:I

.field private ruleDeviceErrorCount:I

.field private storeErrorUDNList:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field final synthetic this$0:Lcom/belkin/wemo/rules/operation/handler/RMStoreDBRulesLocalHandler;


# direct methods
.method private constructor <init>(Lcom/belkin/wemo/rules/operation/handler/RMStoreDBRulesLocalHandler;I)V
    .locals 1
    .param p2, "devicesCount"    # I

    .prologue
    .line 118
    iput-object p1, p0, Lcom/belkin/wemo/rules/operation/handler/RMStoreDBRulesLocalHandler$RuleDevicesStoreDeviceRulesCallback;->this$0:Lcom/belkin/wemo/rules/operation/handler/RMStoreDBRulesLocalHandler;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 119
    iput p2, p0, Lcom/belkin/wemo/rules/operation/handler/RMStoreDBRulesLocalHandler$RuleDevicesStoreDeviceRulesCallback;->devicesCount:I

    .line 120
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/belkin/wemo/rules/operation/handler/RMStoreDBRulesLocalHandler$RuleDevicesStoreDeviceRulesCallback;->storeErrorUDNList:Ljava/util/List;

    .line 121
    return-void
.end method

.method synthetic constructor <init>(Lcom/belkin/wemo/rules/operation/handler/RMStoreDBRulesLocalHandler;ILcom/belkin/wemo/rules/operation/handler/RMStoreDBRulesLocalHandler$1;)V
    .locals 0
    .param p1, "x0"    # Lcom/belkin/wemo/rules/operation/handler/RMStoreDBRulesLocalHandler;
    .param p2, "x1"    # I
    .param p3, "x2"    # Lcom/belkin/wemo/rules/operation/handler/RMStoreDBRulesLocalHandler$1;

    .prologue
    .line 111
    invoke-direct {p0, p1, p2}, Lcom/belkin/wemo/rules/operation/handler/RMStoreDBRulesLocalHandler$RuleDevicesStoreDeviceRulesCallback;-><init>(Lcom/belkin/wemo/rules/operation/handler/RMStoreDBRulesLocalHandler;I)V

    return-void
.end method

.method private onRulesSyncAttemptsComplete()V
    .locals 10

    .prologue
    const/4 v9, 0x2

    .line 155
    invoke-static {}, Lcom/belkin/wemo/rules/operation/handler/RMStoreDBRulesLocalHandler;->access$100()Ljava/lang/String;

    move-result-object v0

    const-string v1, "Store Rules: All RULE devices callbacks received."

    invoke-static {v0, v1}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 157
    iget v0, p0, Lcom/belkin/wemo/rules/operation/handler/RMStoreDBRulesLocalHandler$RuleDevicesStoreDeviceRulesCallback;->ruleDeviceErrorCount:I

    iget v1, p0, Lcom/belkin/wemo/rules/operation/handler/RMStoreDBRulesLocalHandler$RuleDevicesStoreDeviceRulesCallback;->devicesCount:I

    if-ne v0, v1, :cond_1

    .line 158
    invoke-static {}, Lcom/belkin/wemo/rules/operation/handler/RMStoreDBRulesLocalHandler;->access$100()Ljava/lang/String;

    move-result-object v0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Store Rules: Store rule on ALL RULE DEVICES FAILED. Rule devices count: "

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget v3, p0, Lcom/belkin/wemo/rules/operation/handler/RMStoreDBRulesLocalHandler$RuleDevicesStoreDeviceRulesCallback;->devicesCount:I

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 160
    iget-object v0, p0, Lcom/belkin/wemo/rules/operation/handler/RMStoreDBRulesLocalHandler$RuleDevicesStoreDeviceRulesCallback;->this$0:Lcom/belkin/wemo/rules/operation/handler/RMStoreDBRulesLocalHandler;

    invoke-static {v0}, Lcom/belkin/wemo/rules/operation/handler/RMStoreDBRulesLocalHandler;->access$200(Lcom/belkin/wemo/rules/operation/handler/RMStoreDBRulesLocalHandler;)Lcom/belkin/wemo/rules/operation/callback/RMStoreRulesTypeErrorCallback;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 161
    iget-object v0, p0, Lcom/belkin/wemo/rules/operation/handler/RMStoreDBRulesLocalHandler$RuleDevicesStoreDeviceRulesCallback;->this$0:Lcom/belkin/wemo/rules/operation/handler/RMStoreDBRulesLocalHandler;

    invoke-static {v0}, Lcom/belkin/wemo/rules/operation/handler/RMStoreDBRulesLocalHandler;->access$200(Lcom/belkin/wemo/rules/operation/handler/RMStoreDBRulesLocalHandler;)Lcom/belkin/wemo/rules/operation/callback/RMStoreRulesTypeErrorCallback;

    move-result-object v0

    iget-object v1, p0, Lcom/belkin/wemo/rules/operation/handler/RMStoreDBRulesLocalHandler$RuleDevicesStoreDeviceRulesCallback;->storeErrorUDNList:Ljava/util/List;

    invoke-interface {v0, v9, v1}, Lcom/belkin/wemo/rules/operation/callback/RMStoreRulesTypeErrorCallback;->onSingleTypeStoreFailed(ILjava/util/List;)V

    .line 188
    :cond_0
    :goto_0
    return-void

    .line 170
    :cond_1
    iget-object v0, p0, Lcom/belkin/wemo/rules/operation/handler/RMStoreDBRulesLocalHandler$RuleDevicesStoreDeviceRulesCallback;->this$0:Lcom/belkin/wemo/rules/operation/handler/RMStoreDBRulesLocalHandler;

    invoke-static {v0}, Lcom/belkin/wemo/rules/operation/handler/RMStoreDBRulesLocalHandler;->access$300(Lcom/belkin/wemo/rules/operation/handler/RMStoreDBRulesLocalHandler;)Ljava/util/List;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v7

    .line 171
    .local v7, "nonRuleDeviceListSize":I
    if-lez v7, :cond_2

    .line 173
    new-instance v4, Lcom/belkin/wemo/rules/operation/handler/RMStoreDBRulesLocalHandler$NonRuleDevicesStoreRulesCallback;

    iget-object v0, p0, Lcom/belkin/wemo/rules/operation/handler/RMStoreDBRulesLocalHandler$RuleDevicesStoreDeviceRulesCallback;->this$0:Lcom/belkin/wemo/rules/operation/handler/RMStoreDBRulesLocalHandler;

    invoke-direct {v4, v0, v7}, Lcom/belkin/wemo/rules/operation/handler/RMStoreDBRulesLocalHandler$NonRuleDevicesStoreRulesCallback;-><init>(Lcom/belkin/wemo/rules/operation/handler/RMStoreDBRulesLocalHandler;I)V

    .line 174
    .local v4, "callback":Lcom/belkin/wemo/rules/operation/handler/RMStoreDBRulesLocalHandler$NonRuleDevicesStoreRulesCallback;
    iget-object v0, p0, Lcom/belkin/wemo/rules/operation/handler/RMStoreDBRulesLocalHandler$RuleDevicesStoreDeviceRulesCallback;->this$0:Lcom/belkin/wemo/rules/operation/handler/RMStoreDBRulesLocalHandler;

    invoke-static {v0}, Lcom/belkin/wemo/rules/operation/handler/RMStoreDBRulesLocalHandler;->access$300(Lcom/belkin/wemo/rules/operation/handler/RMStoreDBRulesLocalHandler;)Ljava/util/List;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v6

    .local v6, "i$":Ljava/util/Iterator;
    :goto_1
    invoke-interface {v6}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_2

    invoke-interface {v6}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/belkin/wemo/cache/data/DeviceInformation;

    .line 175
    .local v2, "device":Lcom/belkin/wemo/cache/data/DeviceInformation;
    invoke-static {}, Lcom/belkin/wemo/thread/WeMoThreadPoolHandler;->getInstance()Lcom/belkin/wemo/thread/WeMoThreadPoolHandler;

    move-result-object v8

    new-instance v0, Lcom/belkin/wemo/rules/operation/runnable/RMStoreDevDBRulesLocalRunnable;

    iget-object v1, p0, Lcom/belkin/wemo/rules/operation/handler/RMStoreDBRulesLocalHandler$RuleDevicesStoreDeviceRulesCallback;->this$0:Lcom/belkin/wemo/rules/operation/handler/RMStoreDBRulesLocalHandler;

    invoke-static {v1}, Lcom/belkin/wemo/rules/operation/handler/RMStoreDBRulesLocalHandler;->access$400(Lcom/belkin/wemo/rules/operation/handler/RMStoreDBRulesLocalHandler;)Lcom/belkin/wemo/rules/data/RMDBRule;

    move-result-object v1

    iget-object v3, p0, Lcom/belkin/wemo/rules/operation/handler/RMStoreDBRulesLocalHandler$RuleDevicesStoreDeviceRulesCallback;->this$0:Lcom/belkin/wemo/rules/operation/handler/RMStoreDBRulesLocalHandler;

    invoke-static {v3}, Lcom/belkin/wemo/rules/operation/handler/RMStoreDBRulesLocalHandler;->access$500(Lcom/belkin/wemo/rules/operation/handler/RMStoreDBRulesLocalHandler;)Ljava/util/HashMap;

    move-result-object v3

    move-object v5, v4

    invoke-direct/range {v0 .. v5}, Lcom/belkin/wemo/rules/operation/runnable/RMStoreDevDBRulesLocalRunnable;-><init>(Lcom/belkin/wemo/rules/data/RMDBRule;Lcom/belkin/wemo/cache/data/DeviceInformation;Ljava/util/HashMap;Lcom/belkin/wemo/rules/device/callback/RMStoreDeviceRulesSuccesCallback;Lcom/belkin/wemo/rules/device/callback/RMStoreDeviceRulesErrorCallback;)V

    invoke-virtual {v8, v0}, Lcom/belkin/wemo/thread/WeMoThreadPoolHandler;->executeViaBackground(Lcom/belkin/wemo/runnable/WeMoRunnable;)V

    goto :goto_1

    .line 184
    .end local v2    # "device":Lcom/belkin/wemo/cache/data/DeviceInformation;
    .end local v4    # "callback":Lcom/belkin/wemo/rules/operation/handler/RMStoreDBRulesLocalHandler$NonRuleDevicesStoreRulesCallback;
    .end local v6    # "i$":Ljava/util/Iterator;
    :cond_2
    iget-object v0, p0, Lcom/belkin/wemo/rules/operation/handler/RMStoreDBRulesLocalHandler$RuleDevicesStoreDeviceRulesCallback;->this$0:Lcom/belkin/wemo/rules/operation/handler/RMStoreDBRulesLocalHandler;

    invoke-static {v0}, Lcom/belkin/wemo/rules/operation/handler/RMStoreDBRulesLocalHandler;->access$600(Lcom/belkin/wemo/rules/operation/handler/RMStoreDBRulesLocalHandler;)Lcom/belkin/wemo/rules/operation/callback/RMStoreRulesTypeSuccessCallback;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 185
    iget-object v0, p0, Lcom/belkin/wemo/rules/operation/handler/RMStoreDBRulesLocalHandler$RuleDevicesStoreDeviceRulesCallback;->this$0:Lcom/belkin/wemo/rules/operation/handler/RMStoreDBRulesLocalHandler;

    invoke-static {v0}, Lcom/belkin/wemo/rules/operation/handler/RMStoreDBRulesLocalHandler;->access$600(Lcom/belkin/wemo/rules/operation/handler/RMStoreDBRulesLocalHandler;)Lcom/belkin/wemo/rules/operation/callback/RMStoreRulesTypeSuccessCallback;

    move-result-object v0

    iget-object v1, p0, Lcom/belkin/wemo/rules/operation/handler/RMStoreDBRulesLocalHandler$RuleDevicesStoreDeviceRulesCallback;->storeErrorUDNList:Ljava/util/List;

    invoke-interface {v0, v9, v1}, Lcom/belkin/wemo/rules/operation/callback/RMStoreRulesTypeSuccessCallback;->onSingleTypeStoreSuccess(ILjava/util/List;)V

    goto :goto_0
.end method


# virtual methods
.method public declared-synchronized onError(Lcom/belkin/wemo/rules/device/error/RMRuleDeviceError;)V
    .locals 4
    .param p1, "error"    # Lcom/belkin/wemo/rules/device/error/RMRuleDeviceError;

    .prologue
    .line 125
    monitor-enter p0

    :try_start_0
    iget v1, p0, Lcom/belkin/wemo/rules/operation/handler/RMStoreDBRulesLocalHandler$RuleDevicesStoreDeviceRulesCallback;->devicesStoreRulesCallbackCount:I

    add-int/lit8 v1, v1, 0x1

    iput v1, p0, Lcom/belkin/wemo/rules/operation/handler/RMStoreDBRulesLocalHandler$RuleDevicesStoreDeviceRulesCallback;->devicesStoreRulesCallbackCount:I

    .line 126
    iget v1, p0, Lcom/belkin/wemo/rules/operation/handler/RMStoreDBRulesLocalHandler$RuleDevicesStoreDeviceRulesCallback;->ruleDeviceErrorCount:I

    add-int/lit8 v1, v1, 0x1

    iput v1, p0, Lcom/belkin/wemo/rules/operation/handler/RMStoreDBRulesLocalHandler$RuleDevicesStoreDeviceRulesCallback;->ruleDeviceErrorCount:I

    .line 128
    invoke-virtual {p1}, Lcom/belkin/wemo/rules/device/error/RMRuleDeviceError;->getDeviceUdn()Ljava/lang/String;

    move-result-object v0

    .line 129
    .local v0, "udn":Ljava/lang/String;
    iget-object v1, p0, Lcom/belkin/wemo/rules/operation/handler/RMStoreDBRulesLocalHandler$RuleDevicesStoreDeviceRulesCallback;->storeErrorUDNList:Ljava/util/List;

    invoke-interface {v1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 130
    invoke-static {}, Lcom/belkin/wemo/rules/operation/handler/RMStoreDBRulesLocalHandler;->access$100()Ljava/lang/String;

    move-result-object v1

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "STORE Rules for RULE DEVICES: ERROR for device: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "; RULE Device fetched count yet: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget v3, p0, Lcom/belkin/wemo/rules/operation/handler/RMStoreDBRulesLocalHandler$RuleDevicesStoreDeviceRulesCallback;->devicesStoreRulesCallbackCount:I

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "; Total RULE devices count: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget v3, p0, Lcom/belkin/wemo/rules/operation/handler/RMStoreDBRulesLocalHandler$RuleDevicesStoreDeviceRulesCallback;->devicesCount:I

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "; ERROR CODE: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {p1}, Lcom/belkin/wemo/rules/device/error/RMRuleDeviceError;->getErrorCode()I

    move-result v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "; MESSAGE: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {p1}, Lcom/belkin/wemo/rules/device/error/RMRuleDeviceError;->getErrorMessage()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 136
    iget v1, p0, Lcom/belkin/wemo/rules/operation/handler/RMStoreDBRulesLocalHandler$RuleDevicesStoreDeviceRulesCallback;->devicesStoreRulesCallbackCount:I

    iget v2, p0, Lcom/belkin/wemo/rules/operation/handler/RMStoreDBRulesLocalHandler$RuleDevicesStoreDeviceRulesCallback;->devicesCount:I

    if-ne v1, v2, :cond_0

    .line 137
    invoke-direct {p0}, Lcom/belkin/wemo/rules/operation/handler/RMStoreDBRulesLocalHandler$RuleDevicesStoreDeviceRulesCallback;->onRulesSyncAttemptsComplete()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 139
    :cond_0
    monitor-exit p0

    return-void

    .line 125
    .end local v0    # "udn":Ljava/lang/String;
    :catchall_0
    move-exception v1

    monitor-exit p0

    throw v1
.end method

.method public declared-synchronized onSuccess(Ljava/lang/String;)V
    .locals 3
    .param p1, "udn"    # Ljava/lang/String;

    .prologue
    .line 143
    monitor-enter p0

    :try_start_0
    iget v0, p0, Lcom/belkin/wemo/rules/operation/handler/RMStoreDBRulesLocalHandler$RuleDevicesStoreDeviceRulesCallback;->devicesStoreRulesCallbackCount:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lcom/belkin/wemo/rules/operation/handler/RMStoreDBRulesLocalHandler$RuleDevicesStoreDeviceRulesCallback;->devicesStoreRulesCallbackCount:I

    .line 145
    invoke-static {}, Lcom/belkin/wemo/rules/operation/handler/RMStoreDBRulesLocalHandler;->access$100()Ljava/lang/String;

    move-result-object v0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "STORE Rules for RULE DEVICES: SUCCESS for device: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "; RULE Device fetched count yet: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget v2, p0, Lcom/belkin/wemo/rules/operation/handler/RMStoreDBRulesLocalHandler$RuleDevicesStoreDeviceRulesCallback;->devicesStoreRulesCallbackCount:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "; Total RULE devices count: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget v2, p0, Lcom/belkin/wemo/rules/operation/handler/RMStoreDBRulesLocalHandler$RuleDevicesStoreDeviceRulesCallback;->devicesCount:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 149
    iget v0, p0, Lcom/belkin/wemo/rules/operation/handler/RMStoreDBRulesLocalHandler$RuleDevicesStoreDeviceRulesCallback;->devicesStoreRulesCallbackCount:I

    iget v1, p0, Lcom/belkin/wemo/rules/operation/handler/RMStoreDBRulesLocalHandler$RuleDevicesStoreDeviceRulesCallback;->devicesCount:I

    if-ne v0, v1, :cond_0

    .line 150
    invoke-direct {p0}, Lcom/belkin/wemo/rules/operation/handler/RMStoreDBRulesLocalHandler$RuleDevicesStoreDeviceRulesCallback;->onRulesSyncAttemptsComplete()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 152
    :cond_0
    monitor-exit p0

    return-void

    .line 143
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method
