.class public Lcom/belkin/wemo/rules/operation/handler/RMSyncDBRulesLocalResponseHandler;
.super Ljava/lang/Object;
.source "RMSyncDBRulesLocalResponseHandler.java"

# interfaces
.implements Lcom/belkin/wemo/rules/device/callback/RMStoreDeviceRulesErrorCallback;
.implements Lcom/belkin/wemo/rules/device/callback/RMStoreDeviceRulesSuccesCallback;


# static fields
.field private static final TAG:Ljava/lang/String;


# instance fields
.field private callbacksReceivedCount:I

.field private devicesNotSynedUDNList:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private devicesToSyncCount:I

.field private errorCallback:Lcom/belkin/wemo/rules/operation/callback/RMSyncRulesTypeErrorCallback;

.field private successCallback:Lcom/belkin/wemo/rules/operation/callback/RMSyncRulesTypeSuccessCallback;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 15
    const-class v0, Lcom/belkin/wemo/rules/operation/handler/RMSyncDBRulesLocalResponseHandler;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/belkin/wemo/rules/operation/handler/RMSyncDBRulesLocalResponseHandler;->TAG:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>(Lcom/belkin/wemo/rules/operation/callback/RMSyncRulesTypeErrorCallback;Lcom/belkin/wemo/rules/operation/callback/RMSyncRulesTypeSuccessCallback;I)V
    .locals 1
    .param p1, "errorCallback"    # Lcom/belkin/wemo/rules/operation/callback/RMSyncRulesTypeErrorCallback;
    .param p2, "successCallback"    # Lcom/belkin/wemo/rules/operation/callback/RMSyncRulesTypeSuccessCallback;
    .param p3, "devicesToSyncCount"    # I

    .prologue
    .line 26
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 27
    iput-object p1, p0, Lcom/belkin/wemo/rules/operation/handler/RMSyncDBRulesLocalResponseHandler;->errorCallback:Lcom/belkin/wemo/rules/operation/callback/RMSyncRulesTypeErrorCallback;

    .line 28
    iput-object p2, p0, Lcom/belkin/wemo/rules/operation/handler/RMSyncDBRulesLocalResponseHandler;->successCallback:Lcom/belkin/wemo/rules/operation/callback/RMSyncRulesTypeSuccessCallback;

    .line 29
    iput p3, p0, Lcom/belkin/wemo/rules/operation/handler/RMSyncDBRulesLocalResponseHandler;->devicesToSyncCount:I

    .line 31
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/belkin/wemo/rules/operation/handler/RMSyncDBRulesLocalResponseHandler;->devicesNotSynedUDNList:Ljava/util/ArrayList;

    .line 32
    return-void
.end method

.method private onAllDeviceCallbacksReceived()V
    .locals 5

    .prologue
    const/4 v4, 0x2

    .line 48
    iget-object v1, p0, Lcom/belkin/wemo/rules/operation/handler/RMSyncDBRulesLocalResponseHandler;->devicesNotSynedUDNList:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v0

    .line 49
    .local v0, "devicesNotSyncedCount":I
    sget-object v1, Lcom/belkin/wemo/rules/operation/handler/RMSyncDBRulesLocalResponseHandler;->TAG:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Store Rules: All Sync Rules Callbacks received. Devices Not synced count = "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "; Total devices count = "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget v3, p0, Lcom/belkin/wemo/rules/operation/handler/RMSyncDBRulesLocalResponseHandler;->devicesToSyncCount:I

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->debugLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 50
    iget v1, p0, Lcom/belkin/wemo/rules/operation/handler/RMSyncDBRulesLocalResponseHandler;->devicesToSyncCount:I

    if-ge v0, v1, :cond_1

    .line 51
    iget-object v1, p0, Lcom/belkin/wemo/rules/operation/handler/RMSyncDBRulesLocalResponseHandler;->successCallback:Lcom/belkin/wemo/rules/operation/callback/RMSyncRulesTypeSuccessCallback;

    if-eqz v1, :cond_0

    .line 52
    iget-object v1, p0, Lcom/belkin/wemo/rules/operation/handler/RMSyncDBRulesLocalResponseHandler;->successCallback:Lcom/belkin/wemo/rules/operation/callback/RMSyncRulesTypeSuccessCallback;

    invoke-interface {v1, v4}, Lcom/belkin/wemo/rules/operation/callback/RMSyncRulesTypeSuccessCallback;->onSingleTypeRulesSynced(I)V

    .line 59
    :cond_0
    :goto_0
    return-void

    .line 55
    :cond_1
    iget-object v1, p0, Lcom/belkin/wemo/rules/operation/handler/RMSyncDBRulesLocalResponseHandler;->errorCallback:Lcom/belkin/wemo/rules/operation/callback/RMSyncRulesTypeErrorCallback;

    if-eqz v1, :cond_0

    .line 56
    iget-object v1, p0, Lcom/belkin/wemo/rules/operation/handler/RMSyncDBRulesLocalResponseHandler;->errorCallback:Lcom/belkin/wemo/rules/operation/callback/RMSyncRulesTypeErrorCallback;

    iget-object v2, p0, Lcom/belkin/wemo/rules/operation/handler/RMSyncDBRulesLocalResponseHandler;->devicesNotSynedUDNList:Ljava/util/ArrayList;

    invoke-interface {v1, v4, v2}, Lcom/belkin/wemo/rules/operation/callback/RMSyncRulesTypeErrorCallback;->onSingleTypeRulesSyncError(ILjava/util/List;)V

    goto :goto_0
.end method


# virtual methods
.method public declared-synchronized onError(Lcom/belkin/wemo/rules/device/error/RMRuleDeviceError;)V
    .locals 3
    .param p1, "error"    # Lcom/belkin/wemo/rules/device/error/RMRuleDeviceError;

    .prologue
    .line 63
    monitor-enter p0

    :try_start_0
    iget v0, p0, Lcom/belkin/wemo/rules/operation/handler/RMSyncDBRulesLocalResponseHandler;->callbacksReceivedCount:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lcom/belkin/wemo/rules/operation/handler/RMSyncDBRulesLocalResponseHandler;->callbacksReceivedCount:I

    .line 65
    sget-object v0, Lcom/belkin/wemo/rules/operation/handler/RMSyncDBRulesLocalResponseHandler;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Sync Rules: sync ERROR for device: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p1}, Lcom/belkin/wemo/rules/device/error/RMRuleDeviceError;->getDeviceUdn()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "\n Total device synced yet count: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget v2, p0, Lcom/belkin/wemo/rules/operation/handler/RMSyncDBRulesLocalResponseHandler;->callbacksReceivedCount:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 68
    iget-object v0, p0, Lcom/belkin/wemo/rules/operation/handler/RMSyncDBRulesLocalResponseHandler;->devicesNotSynedUDNList:Ljava/util/ArrayList;

    invoke-virtual {p1}, Lcom/belkin/wemo/rules/device/error/RMRuleDeviceError;->getDeviceUdn()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 69
    iget v0, p0, Lcom/belkin/wemo/rules/operation/handler/RMSyncDBRulesLocalResponseHandler;->callbacksReceivedCount:I

    iget v1, p0, Lcom/belkin/wemo/rules/operation/handler/RMSyncDBRulesLocalResponseHandler;->devicesToSyncCount:I

    if-ne v0, v1, :cond_0

    .line 70
    invoke-direct {p0}, Lcom/belkin/wemo/rules/operation/handler/RMSyncDBRulesLocalResponseHandler;->onAllDeviceCallbacksReceived()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 72
    :cond_0
    monitor-exit p0

    return-void

    .line 63
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized onSuccess(Ljava/lang/String;)V
    .locals 3
    .param p1, "udn"    # Ljava/lang/String;

    .prologue
    .line 36
    monitor-enter p0

    :try_start_0
    iget v0, p0, Lcom/belkin/wemo/rules/operation/handler/RMSyncDBRulesLocalResponseHandler;->callbacksReceivedCount:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lcom/belkin/wemo/rules/operation/handler/RMSyncDBRulesLocalResponseHandler;->callbacksReceivedCount:I

    .line 38
    sget-object v0, Lcom/belkin/wemo/rules/operation/handler/RMSyncDBRulesLocalResponseHandler;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Sync Rules: sync SUCCESS for device: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "\n Total device synced yet count: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget v2, p0, Lcom/belkin/wemo/rules/operation/handler/RMSyncDBRulesLocalResponseHandler;->callbacksReceivedCount:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->debugLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 41
    iget v0, p0, Lcom/belkin/wemo/rules/operation/handler/RMSyncDBRulesLocalResponseHandler;->callbacksReceivedCount:I

    iget v1, p0, Lcom/belkin/wemo/rules/operation/handler/RMSyncDBRulesLocalResponseHandler;->devicesToSyncCount:I

    if-ne v0, v1, :cond_0

    .line 42
    invoke-direct {p0}, Lcom/belkin/wemo/rules/operation/handler/RMSyncDBRulesLocalResponseHandler;->onAllDeviceCallbacksReceived()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 44
    :cond_0
    monitor-exit p0

    return-void

    .line 36
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method
