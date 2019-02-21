.class Lcom/belkin/wemo/rules/impl/RulesRemoteImpl;
.super Ljava/lang/Object;
.source "RulesRemoteImpl.java"

# interfaces
.implements Lcom/belkin/wemo/rules/IWeMoRules;


# static fields
.field private static instance:Lcom/belkin/wemo/rules/impl/RulesRemoteImpl;


# direct methods
.method private constructor <init>()V
    .locals 0

    .prologue
    .line 86
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 88
    return-void
.end method

.method public static declared-synchronized destroyInstance()V
    .locals 2

    .prologue
    .line 106
    const-class v1, Lcom/belkin/wemo/rules/impl/RulesRemoteImpl;

    monitor-enter v1

    :try_start_0
    sget-object v0, Lcom/belkin/wemo/rules/impl/RulesRemoteImpl;->instance:Lcom/belkin/wemo/rules/impl/RulesRemoteImpl;

    if-eqz v0, :cond_0

    .line 107
    const/4 v0, 0x0

    sput-object v0, Lcom/belkin/wemo/rules/impl/RulesRemoteImpl;->instance:Lcom/belkin/wemo/rules/impl/RulesRemoteImpl;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 109
    :cond_0
    monitor-exit v1

    return-void

    .line 106
    :catchall_0
    move-exception v0

    monitor-exit v1

    throw v0
.end method

.method public static declared-synchronized getInstance()Lcom/belkin/wemo/rules/impl/RulesRemoteImpl;
    .locals 2

    .prologue
    .line 96
    const-class v1, Lcom/belkin/wemo/rules/impl/RulesRemoteImpl;

    monitor-enter v1

    :try_start_0
    sget-object v0, Lcom/belkin/wemo/rules/impl/RulesRemoteImpl;->instance:Lcom/belkin/wemo/rules/impl/RulesRemoteImpl;

    if-nez v0, :cond_0

    .line 97
    new-instance v0, Lcom/belkin/wemo/rules/impl/RulesRemoteImpl;

    invoke-direct {v0}, Lcom/belkin/wemo/rules/impl/RulesRemoteImpl;-><init>()V

    sput-object v0, Lcom/belkin/wemo/rules/impl/RulesRemoteImpl;->instance:Lcom/belkin/wemo/rules/impl/RulesRemoteImpl;

    .line 99
    :cond_0
    sget-object v0, Lcom/belkin/wemo/rules/impl/RulesRemoteImpl;->instance:Lcom/belkin/wemo/rules/impl/RulesRemoteImpl;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit v1

    return-object v0

    .line 96
    :catchall_0
    move-exception v0

    monitor-exit v1

    throw v0
.end method


# virtual methods
.method public fetchRules(Landroid/content/Context;Lcom/belkin/wemo/rules/callback/FetchRulesSuccessCallback;Lcom/belkin/wemo/rules/callback/FetchRulesErrorCallback;)V
    .locals 9
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "successCallback"    # Lcom/belkin/wemo/rules/callback/FetchRulesSuccessCallback;
    .param p3, "errorCallback"    # Lcom/belkin/wemo/rules/callback/FetchRulesErrorCallback;

    .prologue
    .line 152
    invoke-static {p1}, Lcom/belkin/wemo/utils/WeMoUtils;->getWiFiDeviceList(Landroid/content/Context;)Ljava/util/List;

    move-result-object v6

    .line 153
    .local v6, "activeDevicesList":Ljava/util/List;, "Ljava/util/List<Lcom/belkin/wemo/cache/data/DeviceInformation;>;"
    new-instance v2, Lcom/belkin/wemo/rules/impl/handler/RMFetchDBRulesResponseHandler;

    invoke-interface {v6}, Ljava/util/List;->size()I

    move-result v0

    invoke-direct {v2, p1, p2, p3, v0}, Lcom/belkin/wemo/rules/impl/handler/RMFetchDBRulesResponseHandler;-><init>(Landroid/content/Context;Lcom/belkin/wemo/rules/callback/FetchRulesSuccessCallback;Lcom/belkin/wemo/rules/callback/FetchRulesErrorCallback;I)V

    .line 155
    .local v2, "handler":Lcom/belkin/wemo/rules/impl/handler/RMFetchDBRulesResponseHandler;
    invoke-interface {v6}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v7

    .local v7, "i$":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v7}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-interface {v7}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/belkin/wemo/cache/data/DeviceInformation;

    .line 156
    .local v4, "device":Lcom/belkin/wemo/cache/data/DeviceInformation;
    invoke-static {}, Lcom/belkin/wemo/thread/WeMoThreadPoolHandler;->getInstance()Lcom/belkin/wemo/thread/WeMoThreadPoolHandler;

    move-result-object v8

    new-instance v0, Lcom/belkin/wemo/rules/operation/runnable/GetDBVersionRemoteRunnable;

    new-instance v5, Lcom/belkin/wemo/cache/cloud/CloudRequestManager;

    invoke-direct {v5, p1}, Lcom/belkin/wemo/cache/cloud/CloudRequestManager;-><init>(Landroid/content/Context;)V

    move-object v1, p1

    move-object v3, v2

    invoke-direct/range {v0 .. v5}, Lcom/belkin/wemo/rules/operation/runnable/GetDBVersionRemoteRunnable;-><init>(Landroid/content/Context;Lcom/belkin/wemo/rules/device/callback/RMFetchDeviceRulesErrorCallback;Lcom/belkin/wemo/rules/device/callback/RMFetchDeviceRulesSuccesCallback;Lcom/belkin/wemo/cache/data/DeviceInformation;Lcom/belkin/wemo/cache/cloud/CloudRequestManager;)V

    invoke-virtual {v8, v0}, Lcom/belkin/wemo/thread/WeMoThreadPoolHandler;->executeViaBackground(Lcom/belkin/wemo/runnable/WeMoRunnable;)V

    goto :goto_0

    .line 159
    .end local v4    # "device":Lcom/belkin/wemo/cache/data/DeviceInformation;
    :cond_0
    return-void
.end method

.method public fetchRulesAndSyncDevices(Landroid/content/Context;Lcom/belkin/wemo/rules/callback/FetchRulesAndSyncSuccessCallback;Lcom/belkin/wemo/rules/callback/FetchRulesAndSyncErrorCallback;)V
    .locals 0
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "successCallback"    # Lcom/belkin/wemo/rules/callback/FetchRulesAndSyncSuccessCallback;
    .param p3, "errorCallback"    # Lcom/belkin/wemo/rules/callback/FetchRulesAndSyncErrorCallback;

    .prologue
    .line 142
    return-void
.end method

.method public storeRules(Landroid/content/Context;Ljava/util/HashMap;Lcom/belkin/wemo/rules/callback/StoreRulesSuccessCallback;Lcom/belkin/wemo/rules/callback/StoreRulesErrorCallback;)V
    .locals 8
    .param p1, "context"    # Landroid/content/Context;
    .param p3, "successCallback"    # Lcom/belkin/wemo/rules/callback/StoreRulesSuccessCallback;
    .param p4, "errorCallback"    # Lcom/belkin/wemo/rules/callback/StoreRulesErrorCallback;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "[",
            "Ljava/lang/String;",
            ">;",
            "Lcom/belkin/wemo/rules/callback/StoreRulesSuccessCallback;",
            "Lcom/belkin/wemo/rules/callback/StoreRulesErrorCallback;",
            ")V"
        }
    .end annotation

    .prologue
    .line 120
    .local p2, "weeklyRecordsHashMap":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;[Ljava/lang/String;>;"
    const-string v0, "RulesRemoteImpl"

    const-string v1, "storeRules"

    invoke-static {v0, v1}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 121
    invoke-static {p1}, Lcom/belkin/wemo/utils/WeMoUtils;->getWiFiDeviceList(Landroid/content/Context;)Ljava/util/List;

    move-result-object v2

    .line 123
    .local v2, "devicesList":Ljava/util/List;, "Ljava/util/List<Lcom/belkin/wemo/cache/data/DeviceInformation;>;"
    if-eqz v2, :cond_0

    invoke-interface {v2}, Ljava/util/List;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_2

    .line 124
    :cond_0
    if-eqz p4, :cond_1

    .line 125
    new-instance v0, Lcom/belkin/wemo/rules/error/RMRulesError;

    const/4 v1, -0x1

    const-string v3, "Error while processing Rules!"

    invoke-direct {v0, v1, v3}, Lcom/belkin/wemo/rules/error/RMRulesError;-><init>(ILjava/lang/String;)V

    invoke-interface {p4, v0}, Lcom/belkin/wemo/rules/callback/StoreRulesErrorCallback;->onError(Lcom/belkin/wemo/rules/error/RMRulesError;)V

    .line 131
    :cond_1
    :goto_0
    return-void

    .line 129
    :cond_2
    invoke-static {}, Lcom/belkin/wemo/thread/WeMoThreadPoolHandler;->getInstance()Lcom/belkin/wemo/thread/WeMoThreadPoolHandler;

    move-result-object v7

    new-instance v0, Lcom/belkin/wemo/rules/runnable/StoreRulesRemoteRunnable;

    new-instance v1, Lcom/belkin/utils/RuleUtility;

    invoke-direct {v1, p1}, Lcom/belkin/utils/RuleUtility;-><init>(Landroid/content/Context;)V

    invoke-virtual {v1}, Lcom/belkin/utils/RuleUtility;->getDBInBase64Encoding()Ljava/lang/String;

    move-result-object v3

    move-object v1, p1

    move-object v4, p2

    move-object v5, p3

    move-object v6, p4

    invoke-direct/range {v0 .. v6}, Lcom/belkin/wemo/rules/runnable/StoreRulesRemoteRunnable;-><init>(Landroid/content/Context;Ljava/util/List;Ljava/lang/String;Ljava/util/HashMap;Lcom/belkin/wemo/rules/callback/StoreRulesSuccessCallback;Lcom/belkin/wemo/rules/callback/StoreRulesErrorCallback;)V

    invoke-virtual {v7, v0}, Lcom/belkin/wemo/thread/WeMoThreadPoolHandler;->executeViaBackground(Lcom/belkin/wemo/runnable/WeMoRunnable;)V

    goto :goto_0
.end method
