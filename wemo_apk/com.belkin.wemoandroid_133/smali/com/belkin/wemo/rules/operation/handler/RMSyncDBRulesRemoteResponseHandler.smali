.class public Lcom/belkin/wemo/rules/operation/handler/RMSyncDBRulesRemoteResponseHandler;
.super Ljava/lang/Object;
.source "RMSyncDBRulesRemoteResponseHandler.java"

# interfaces
.implements Lcom/belkin/wemo/rules/operation/callback/RMStoreRulesRemoteSuccessCallback;
.implements Lcom/belkin/wemo/rules/operation/callback/RMStoreRulesRemoteErrorCallback;


# static fields
.field private static final TAG:Ljava/lang/String;


# instance fields
.field private callbacksReceivedCount:I

.field private errorCallback:Lcom/belkin/wemo/rules/operation/callback/RMSyncRulesTypeErrorCallback;

.field private fwVersionFailedCount:I

.field private fwVersionsCount:I

.field private successCallback:Lcom/belkin/wemo/rules/operation/callback/RMSyncRulesTypeSuccessCallback;

.field private syncFailedDeviceList:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 18
    const-class v0, Lcom/belkin/wemo/rules/operation/handler/RMSyncDBRulesRemoteResponseHandler;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/belkin/wemo/rules/operation/handler/RMSyncDBRulesRemoteResponseHandler;->TAG:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>(Lcom/belkin/wemo/rules/operation/callback/RMSyncRulesTypeErrorCallback;Lcom/belkin/wemo/rules/operation/callback/RMSyncRulesTypeSuccessCallback;)V
    .locals 1
    .param p1, "errorCallback"    # Lcom/belkin/wemo/rules/operation/callback/RMSyncRulesTypeErrorCallback;
    .param p2, "successCallback"    # Lcom/belkin/wemo/rules/operation/callback/RMSyncRulesTypeSuccessCallback;

    .prologue
    .line 28
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 29
    iput-object p1, p0, Lcom/belkin/wemo/rules/operation/handler/RMSyncDBRulesRemoteResponseHandler;->errorCallback:Lcom/belkin/wemo/rules/operation/callback/RMSyncRulesTypeErrorCallback;

    .line 30
    iput-object p2, p0, Lcom/belkin/wemo/rules/operation/handler/RMSyncDBRulesRemoteResponseHandler;->successCallback:Lcom/belkin/wemo/rules/operation/callback/RMSyncRulesTypeSuccessCallback;

    .line 31
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/belkin/wemo/rules/operation/handler/RMSyncDBRulesRemoteResponseHandler;->syncFailedDeviceList:Ljava/util/List;

    .line 32
    return-void
.end method

.method private onAllDeviceCallbacksReceived()V
    .locals 4

    .prologue
    const/4 v3, 0x2

    .line 44
    sget-object v0, Lcom/belkin/wemo/rules/operation/handler/RMSyncDBRulesRemoteResponseHandler;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Store Rules: All Sync Rules Callbacks received. FW version failed count = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget v2, p0, Lcom/belkin/wemo/rules/operation/handler/RMSyncDBRulesRemoteResponseHandler;->fwVersionFailedCount:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "; fw version count = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget v2, p0, Lcom/belkin/wemo/rules/operation/handler/RMSyncDBRulesRemoteResponseHandler;->fwVersionsCount:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->debugLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 45
    iget v0, p0, Lcom/belkin/wemo/rules/operation/handler/RMSyncDBRulesRemoteResponseHandler;->fwVersionFailedCount:I

    iget v1, p0, Lcom/belkin/wemo/rules/operation/handler/RMSyncDBRulesRemoteResponseHandler;->fwVersionsCount:I

    if-ne v0, v1, :cond_1

    .line 46
    iget-object v0, p0, Lcom/belkin/wemo/rules/operation/handler/RMSyncDBRulesRemoteResponseHandler;->errorCallback:Lcom/belkin/wemo/rules/operation/callback/RMSyncRulesTypeErrorCallback;

    if-eqz v0, :cond_0

    .line 47
    iget-object v0, p0, Lcom/belkin/wemo/rules/operation/handler/RMSyncDBRulesRemoteResponseHandler;->errorCallback:Lcom/belkin/wemo/rules/operation/callback/RMSyncRulesTypeErrorCallback;

    iget-object v1, p0, Lcom/belkin/wemo/rules/operation/handler/RMSyncDBRulesRemoteResponseHandler;->syncFailedDeviceList:Ljava/util/List;

    invoke-interface {v0, v3, v1}, Lcom/belkin/wemo/rules/operation/callback/RMSyncRulesTypeErrorCallback;->onSingleTypeRulesSyncError(ILjava/util/List;)V

    .line 54
    :cond_0
    :goto_0
    return-void

    .line 50
    :cond_1
    iget-object v0, p0, Lcom/belkin/wemo/rules/operation/handler/RMSyncDBRulesRemoteResponseHandler;->successCallback:Lcom/belkin/wemo/rules/operation/callback/RMSyncRulesTypeSuccessCallback;

    if-eqz v0, :cond_0

    .line 51
    iget-object v0, p0, Lcom/belkin/wemo/rules/operation/handler/RMSyncDBRulesRemoteResponseHandler;->successCallback:Lcom/belkin/wemo/rules/operation/callback/RMSyncRulesTypeSuccessCallback;

    invoke-interface {v0, v3}, Lcom/belkin/wemo/rules/operation/callback/RMSyncRulesTypeSuccessCallback;->onSingleTypeRulesSynced(I)V

    goto :goto_0
.end method


# virtual methods
.method public declared-synchronized incrementFWCount()V
    .locals 1

    .prologue
    .line 39
    monitor-enter p0

    :try_start_0
    iget v0, p0, Lcom/belkin/wemo/rules/operation/handler/RMSyncDBRulesRemoteResponseHandler;->fwVersionsCount:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lcom/belkin/wemo/rules/operation/handler/RMSyncDBRulesRemoteResponseHandler;->fwVersionsCount:I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 40
    monitor-exit p0

    return-void

    .line 39
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public onError(Lcom/belkin/wemo/rules/error/RMRulesError;Ljava/util/List;I)V
    .locals 5
    .param p1, "error"    # Lcom/belkin/wemo/rules/error/RMRulesError;
    .param p3, "fwVersionSupportCode"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/belkin/wemo/rules/error/RMRulesError;",
            "Ljava/util/List",
            "<",
            "Lcom/belkin/wemo/cache/data/DeviceInformation;",
            ">;I)V"
        }
    .end annotation

    .prologue
    .line 59
    .local p2, "deviceList":Ljava/util/List;, "Ljava/util/List<Lcom/belkin/wemo/cache/data/DeviceInformation;>;"
    iget v2, p0, Lcom/belkin/wemo/rules/operation/handler/RMSyncDBRulesRemoteResponseHandler;->callbacksReceivedCount:I

    add-int/lit8 v2, v2, 0x1

    iput v2, p0, Lcom/belkin/wemo/rules/operation/handler/RMSyncDBRulesRemoteResponseHandler;->callbacksReceivedCount:I

    .line 60
    iget v2, p0, Lcom/belkin/wemo/rules/operation/handler/RMSyncDBRulesRemoteResponseHandler;->fwVersionFailedCount:I

    add-int/lit8 v2, v2, 0x1

    iput v2, p0, Lcom/belkin/wemo/rules/operation/handler/RMSyncDBRulesRemoteResponseHandler;->fwVersionFailedCount:I

    .line 61
    sget-object v2, Lcom/belkin/wemo/rules/operation/handler/RMSyncDBRulesRemoteResponseHandler;->TAG:Ljava/lang/String;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Store Rules (Remote): sync ERROR for devices with version support Code: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 63
    invoke-interface {p2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "i$":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/belkin/wemo/cache/data/DeviceInformation;

    .line 64
    .local v0, "deviceInfo":Lcom/belkin/wemo/cache/data/DeviceInformation;
    iget-object v2, p0, Lcom/belkin/wemo/rules/operation/handler/RMSyncDBRulesRemoteResponseHandler;->syncFailedDeviceList:Ljava/util/List;

    invoke-virtual {v0}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getUDN()Ljava/lang/String;

    move-result-object v3

    invoke-interface {v2, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 67
    .end local v0    # "deviceInfo":Lcom/belkin/wemo/cache/data/DeviceInformation;
    :cond_0
    iget v2, p0, Lcom/belkin/wemo/rules/operation/handler/RMSyncDBRulesRemoteResponseHandler;->callbacksReceivedCount:I

    iget v3, p0, Lcom/belkin/wemo/rules/operation/handler/RMSyncDBRulesRemoteResponseHandler;->fwVersionsCount:I

    if-lt v2, v3, :cond_1

    .line 68
    invoke-direct {p0}, Lcom/belkin/wemo/rules/operation/handler/RMSyncDBRulesRemoteResponseHandler;->onAllDeviceCallbacksReceived()V

    .line 70
    :cond_1
    return-void
.end method

.method public onSuccess(Ljava/util/List;I)V
    .locals 3
    .param p2, "fwVersionSupportCode"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lcom/belkin/wemo/cache/data/DeviceInformation;",
            ">;I)V"
        }
    .end annotation

    .prologue
    .line 75
    .local p1, "devicesList":Ljava/util/List;, "Ljava/util/List<Lcom/belkin/wemo/cache/data/DeviceInformation;>;"
    iget v0, p0, Lcom/belkin/wemo/rules/operation/handler/RMSyncDBRulesRemoteResponseHandler;->callbacksReceivedCount:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lcom/belkin/wemo/rules/operation/handler/RMSyncDBRulesRemoteResponseHandler;->callbacksReceivedCount:I

    .line 77
    sget-object v0, Lcom/belkin/wemo/rules/operation/handler/RMSyncDBRulesRemoteResponseHandler;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Store Rules (Remote): sync SUCCESS for devices with version support Code: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->debugLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 79
    iget v0, p0, Lcom/belkin/wemo/rules/operation/handler/RMSyncDBRulesRemoteResponseHandler;->callbacksReceivedCount:I

    iget v1, p0, Lcom/belkin/wemo/rules/operation/handler/RMSyncDBRulesRemoteResponseHandler;->fwVersionsCount:I

    if-lt v0, v1, :cond_0

    .line 80
    invoke-direct {p0}, Lcom/belkin/wemo/rules/operation/handler/RMSyncDBRulesRemoteResponseHandler;->onAllDeviceCallbacksReceived()V

    .line 82
    :cond_0
    return-void
.end method
