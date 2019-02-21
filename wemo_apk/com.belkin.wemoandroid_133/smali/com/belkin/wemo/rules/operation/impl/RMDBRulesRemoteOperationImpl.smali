.class public Lcom/belkin/wemo/rules/operation/impl/RMDBRulesRemoteOperationImpl;
.super Ljava/lang/Object;
.source "RMDBRulesRemoteOperationImpl.java"

# interfaces
.implements Lcom/belkin/wemo/rules/operation/RMIRulesOperation;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lcom/belkin/wemo/rules/operation/RMIRulesOperation",
        "<",
        "Lcom/belkin/wemo/rules/data/RMDBRule;",
        ">;"
    }
.end annotation


# instance fields
.field private rulesUtils:Lcom/belkin/wemo/rules/util/RMIRulesUtils;


# direct methods
.method public constructor <init>(Lcom/belkin/wemo/rules/util/RMIRulesUtils;)V
    .locals 0
    .param p1, "rulesUtils"    # Lcom/belkin/wemo/rules/util/RMIRulesUtils;

    .prologue
    .line 33
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 34
    iput-object p1, p0, Lcom/belkin/wemo/rules/operation/impl/RMDBRulesRemoteOperationImpl;->rulesUtils:Lcom/belkin/wemo/rules/util/RMIRulesUtils;

    .line 35
    return-void
.end method


# virtual methods
.method public fetchRules(Ljava/util/List;Lcom/belkin/wemo/rules/operation/callback/RMFetchRulesTypeSuccessCallback;Lcom/belkin/wemo/rules/operation/callback/RMFetchRulesTypeErrorCallback;)V
    .locals 7
    .param p2, "successCallback"    # Lcom/belkin/wemo/rules/operation/callback/RMFetchRulesTypeSuccessCallback;
    .param p3, "errorCallback"    # Lcom/belkin/wemo/rules/operation/callback/RMFetchRulesTypeErrorCallback;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lcom/belkin/wemo/cache/data/DeviceInformation;",
            ">;",
            "Lcom/belkin/wemo/rules/operation/callback/RMFetchRulesTypeSuccessCallback;",
            "Lcom/belkin/wemo/rules/operation/callback/RMFetchRulesTypeErrorCallback;",
            ")V"
        }
    .end annotation

    .prologue
    .line 42
    .local p1, "activeDevicesList":Ljava/util/List;, "Ljava/util/List<Lcom/belkin/wemo/cache/data/DeviceInformation;>;"
    if-eqz p1, :cond_0

    invoke-interface {p1}, Ljava/util/List;->isEmpty()Z

    move-result v3

    if-eqz v3, :cond_2

    .line 43
    :cond_0
    if-eqz p3, :cond_1

    .line 44
    new-instance v3, Lcom/belkin/wemo/rules/error/RMRulesTypeError;

    const/16 v4, 0x12c

    const-string v5, "No device is online."

    const/4 v6, 0x2

    invoke-direct {v3, v4, v5, v6}, Lcom/belkin/wemo/rules/error/RMRulesTypeError;-><init>(ILjava/lang/String;I)V

    invoke-interface {p3, v3}, Lcom/belkin/wemo/rules/operation/callback/RMFetchRulesTypeErrorCallback;->onSingleTypeRulesFetchError(Lcom/belkin/wemo/rules/error/RMRulesTypeError;)V

    .line 59
    :cond_1
    return-void

    .line 51
    :cond_2
    new-instance v1, Lcom/belkin/wemo/rules/operation/handler/RMFetchDBRulesResponseHandler;

    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v3

    iget-object v4, p0, Lcom/belkin/wemo/rules/operation/impl/RMDBRulesRemoteOperationImpl;->rulesUtils:Lcom/belkin/wemo/rules/util/RMIRulesUtils;

    invoke-direct {v1, p2, p3, v3, v4}, Lcom/belkin/wemo/rules/operation/handler/RMFetchDBRulesResponseHandler;-><init>(Lcom/belkin/wemo/rules/operation/callback/RMFetchRulesTypeSuccessCallback;Lcom/belkin/wemo/rules/operation/callback/RMFetchRulesTypeErrorCallback;ILcom/belkin/wemo/rules/util/RMIRulesUtils;)V

    .line 53
    .local v1, "handler":Lcom/belkin/wemo/rules/operation/handler/RMFetchDBRulesResponseHandler;
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    .local v2, "i$":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_1

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/belkin/wemo/cache/data/DeviceInformation;

    .line 56
    .local v0, "device":Lcom/belkin/wemo/cache/data/DeviceInformation;
    invoke-virtual {v0}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getRulesDBVersion()I

    move-result v3

    const-string v4, "No path required for remote"

    invoke-virtual {v0}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getUDN()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v1, v3, v4, v5}, Lcom/belkin/wemo/rules/operation/handler/RMFetchDBRulesResponseHandler;->onSuccess(ILjava/lang/String;Ljava/lang/String;)V

    goto :goto_0
.end method

.method public storeRules(Ljava/util/List;Lcom/belkin/wemo/rules/data/RMDBRule;Ljava/util/HashMap;Lcom/belkin/wemo/rules/operation/callback/RMStoreRulesTypeSuccessCallback;Lcom/belkin/wemo/rules/operation/callback/RMStoreRulesTypeErrorCallback;)V
    .locals 16
    .param p2, "rule"    # Lcom/belkin/wemo/rules/data/RMDBRule;
    .param p4, "successCallback"    # Lcom/belkin/wemo/rules/operation/callback/RMStoreRulesTypeSuccessCallback;
    .param p5, "errorCallback"    # Lcom/belkin/wemo/rules/operation/callback/RMStoreRulesTypeErrorCallback;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lcom/belkin/wemo/cache/data/DeviceInformation;",
            ">;",
            "Lcom/belkin/wemo/rules/data/RMDBRule;",
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;",
            "Lcom/belkin/wemo/rules/operation/callback/RMStoreRulesTypeSuccessCallback;",
            "Lcom/belkin/wemo/rules/operation/callback/RMStoreRulesTypeErrorCallback;",
            ")V"
        }
    .end annotation

    .prologue
    .line 109
    .local p1, "devicesList":Ljava/util/List;, "Ljava/util/List<Lcom/belkin/wemo/cache/data/DeviceInformation;>;"
    .local p3, "params":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    if-eqz p1, :cond_0

    invoke-interface/range {p1 .. p1}, Ljava/util/List;->isEmpty()Z

    move-result v3

    if-eqz v3, :cond_2

    .line 110
    :cond_0
    if-eqz p5, :cond_1

    .line 111
    new-instance v3, Lcom/belkin/wemo/rules/error/RMRulesTypeError;

    const/16 v5, 0x12c

    const-string v7, "No device is online."

    const/4 v8, 0x2

    invoke-direct {v3, v5, v7, v8}, Lcom/belkin/wemo/rules/error/RMRulesTypeError;-><init>(ILjava/lang/String;I)V

    move-object/from16 v0, p5

    invoke-interface {v0, v3}, Lcom/belkin/wemo/rules/operation/callback/RMStoreRulesTypeErrorCallback;->onSingleTypeRulesStoreError(Lcom/belkin/wemo/rules/error/RMRulesTypeError;)V

    .line 144
    :cond_1
    :goto_0
    return-void

    .line 118
    :cond_2
    new-instance v6, Ljava/util/ArrayList;

    invoke-direct {v6}, Ljava/util/ArrayList;-><init>()V

    .line 119
    .local v6, "storeSupportDeviceList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/belkin/wemo/cache/data/DeviceInformation;>;"
    new-instance v10, Ljava/util/ArrayList;

    invoke-direct {v10}, Ljava/util/ArrayList;-><init>()V

    .line 120
    .local v10, "noStoreSupportDeviceList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/belkin/wemo/cache/data/DeviceInformation;>;"
    invoke-interface/range {p1 .. p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v15

    .local v15, "i$":Ljava/util/Iterator;
    :goto_1
    invoke-interface {v15}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_4

    invoke-interface {v15}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v14

    check-cast v14, Lcom/belkin/wemo/cache/data/DeviceInformation;

    .line 122
    .local v14, "device":Lcom/belkin/wemo/cache/data/DeviceInformation;
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/belkin/wemo/rules/operation/impl/RMDBRulesRemoteOperationImpl;->rulesUtils:Lcom/belkin/wemo/rules/util/RMIRulesUtils;

    invoke-interface {v3, v14}, Lcom/belkin/wemo/rules/util/RMIRulesUtils;->isFetchStoreRulesSupportedInRemoteDev(Lcom/belkin/wemo/cache/data/DeviceInformation;)Z

    move-result v3

    if-eqz v3, :cond_3

    .line 124
    invoke-virtual {v6, v14}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_1

    .line 127
    :cond_3
    invoke-virtual {v10, v14}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_1

    .line 131
    .end local v14    # "device":Lcom/belkin/wemo/cache/data/DeviceInformation;
    :cond_4
    new-instance v4, Lcom/belkin/wemo/rules/operation/handler/RMStoreDBRulesRemoteResponseHandler;

    invoke-virtual/range {p2 .. p2}, Lcom/belkin/wemo/rules/data/RMDBRule;->getRuleDeviceSet()Ljava/util/Set;

    move-result-object v3

    move-object/from16 v0, p5

    move-object/from16 v1, p4

    move-object/from16 v2, p2

    invoke-direct {v4, v0, v1, v3, v2}, Lcom/belkin/wemo/rules/operation/handler/RMStoreDBRulesRemoteResponseHandler;-><init>(Lcom/belkin/wemo/rules/operation/callback/RMStoreRulesTypeErrorCallback;Lcom/belkin/wemo/rules/operation/callback/RMStoreRulesTypeSuccessCallback;Ljava/util/Set;Lcom/belkin/wemo/rules/data/RMDBRule;)V

    .line 133
    .local v4, "handler":Lcom/belkin/wemo/rules/operation/handler/RMStoreDBRulesRemoteResponseHandler;
    invoke-virtual {v6}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v3

    if-nez v3, :cond_5

    .line 134
    invoke-virtual {v4}, Lcom/belkin/wemo/rules/operation/handler/RMStoreDBRulesRemoteResponseHandler;->incrementFWTypeCount()V

    .line 135
    const-string v3, " RMDBRulesRemoteOperationImpl"

    const-string v5, "if (!storeSupportDeviceList.isEmpty())"

    invoke-static {v3, v5}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 136
    invoke-static {}, Lcom/belkin/wemo/thread/WeMoThreadPoolHandler;->getInstance()Lcom/belkin/wemo/thread/WeMoThreadPoolHandler;

    move-result-object v11

    new-instance v3, Lcom/belkin/wemo/rules/operation/runnable/RMStoreDBRulesWithStoreRemoteRunnable;

    move-object/from16 v0, p0

    iget-object v9, v0, Lcom/belkin/wemo/rules/operation/impl/RMDBRulesRemoteOperationImpl;->rulesUtils:Lcom/belkin/wemo/rules/util/RMIRulesUtils;

    move-object v5, v4

    move-object/from16 v7, p2

    move-object/from16 v8, p3

    invoke-direct/range {v3 .. v9}, Lcom/belkin/wemo/rules/operation/runnable/RMStoreDBRulesWithStoreRemoteRunnable;-><init>(Lcom/belkin/wemo/rules/operation/callback/RMStoreRulesRemoteErrorCallback;Lcom/belkin/wemo/rules/operation/callback/RMStoreRulesRemoteSuccessCallback;Ljava/util/List;Lcom/belkin/wemo/rules/data/RMDBRule;Ljava/util/HashMap;Lcom/belkin/wemo/rules/util/RMIRulesUtils;)V

    invoke-virtual {v11, v3}, Lcom/belkin/wemo/thread/WeMoThreadPoolHandler;->executeViaBackground(Lcom/belkin/wemo/runnable/WeMoRunnable;)V

    .line 139
    :cond_5
    invoke-virtual {v10}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v3

    if-nez v3, :cond_1

    .line 140
    invoke-virtual {v4}, Lcom/belkin/wemo/rules/operation/handler/RMStoreDBRulesRemoteResponseHandler;->incrementFWTypeCount()V

    .line 141
    invoke-static {}, Lcom/belkin/wemo/thread/WeMoThreadPoolHandler;->getInstance()Lcom/belkin/wemo/thread/WeMoThreadPoolHandler;

    move-result-object v3

    new-instance v7, Lcom/belkin/wemo/rules/operation/runnable/RMStoreDBRulesNoStoreRemoteRunnable;

    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/belkin/wemo/rules/operation/impl/RMDBRulesRemoteOperationImpl;->rulesUtils:Lcom/belkin/wemo/rules/util/RMIRulesUtils;

    move-object v8, v4

    move-object v9, v4

    move-object/from16 v11, p2

    move-object/from16 v12, p3

    invoke-direct/range {v7 .. v13}, Lcom/belkin/wemo/rules/operation/runnable/RMStoreDBRulesNoStoreRemoteRunnable;-><init>(Lcom/belkin/wemo/rules/operation/callback/RMStoreRulesRemoteErrorCallback;Lcom/belkin/wemo/rules/operation/callback/RMStoreRulesRemoteSuccessCallback;Ljava/util/List;Lcom/belkin/wemo/rules/data/RMDBRule;Ljava/util/HashMap;Lcom/belkin/wemo/rules/util/RMIRulesUtils;)V

    invoke-virtual {v3, v7}, Lcom/belkin/wemo/thread/WeMoThreadPoolHandler;->executeViaBackground(Lcom/belkin/wemo/runnable/WeMoRunnable;)V

    goto :goto_0
.end method

.method public bridge synthetic storeRules(Ljava/util/List;Lcom/belkin/wemo/rules/data/RMRule;Ljava/util/HashMap;Lcom/belkin/wemo/rules/operation/callback/RMStoreRulesTypeSuccessCallback;Lcom/belkin/wemo/rules/operation/callback/RMStoreRulesTypeErrorCallback;)V
    .locals 6
    .param p1, "x0"    # Ljava/util/List;
    .param p2, "x1"    # Lcom/belkin/wemo/rules/data/RMRule;
    .param p3, "x2"    # Ljava/util/HashMap;
    .param p4, "x3"    # Lcom/belkin/wemo/rules/operation/callback/RMStoreRulesTypeSuccessCallback;
    .param p5, "x4"    # Lcom/belkin/wemo/rules/operation/callback/RMStoreRulesTypeErrorCallback;

    .prologue
    .line 29
    move-object v2, p2

    check-cast v2, Lcom/belkin/wemo/rules/data/RMDBRule;

    move-object v0, p0

    move-object v1, p1

    move-object v3, p3

    move-object v4, p4

    move-object v5, p5

    invoke-virtual/range {v0 .. v5}, Lcom/belkin/wemo/rules/operation/impl/RMDBRulesRemoteOperationImpl;->storeRules(Ljava/util/List;Lcom/belkin/wemo/rules/data/RMDBRule;Ljava/util/HashMap;Lcom/belkin/wemo/rules/operation/callback/RMStoreRulesTypeSuccessCallback;Lcom/belkin/wemo/rules/operation/callback/RMStoreRulesTypeErrorCallback;)V

    return-void
.end method

.method public syncRules(Ljava/util/List;Ljava/util/HashMap;Lcom/belkin/wemo/rules/operation/callback/RMSyncRulesTypeSuccessCallback;Lcom/belkin/wemo/rules/operation/callback/RMSyncRulesTypeErrorCallback;)V
    .locals 14
    .param p3, "successCallback"    # Lcom/belkin/wemo/rules/operation/callback/RMSyncRulesTypeSuccessCallback;
    .param p4, "errorCallback"    # Lcom/belkin/wemo/rules/operation/callback/RMSyncRulesTypeErrorCallback;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lcom/belkin/wemo/cache/data/DeviceInformation;",
            ">;",
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;",
            "Lcom/belkin/wemo/rules/operation/callback/RMSyncRulesTypeSuccessCallback;",
            "Lcom/belkin/wemo/rules/operation/callback/RMSyncRulesTypeErrorCallback;",
            ")V"
        }
    .end annotation

    .prologue
    .line 67
    .local p1, "devicesToSyncList":Ljava/util/List;, "Ljava/util/List<Lcom/belkin/wemo/cache/data/DeviceInformation;>;"
    .local p2, "params":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    if-eqz p1, :cond_0

    invoke-interface {p1}, Ljava/util/List;->isEmpty()Z

    move-result v2

    if-eqz v2, :cond_2

    .line 68
    :cond_0
    if-eqz p4, :cond_1

    .line 69
    new-instance v2, Lcom/belkin/wemo/rules/error/RMRulesTypeError;

    const/16 v4, 0x12c

    const-string v5, "No device is online."

    const/4 v6, 0x2

    invoke-direct {v2, v4, v5, v6}, Lcom/belkin/wemo/rules/error/RMRulesTypeError;-><init>(ILjava/lang/String;I)V

    move-object/from16 v0, p4

    invoke-interface {v0, v2}, Lcom/belkin/wemo/rules/operation/callback/RMSyncRulesTypeErrorCallback;->onError(Lcom/belkin/wemo/rules/error/RMRulesTypeError;)V

    .line 102
    :cond_1
    :goto_0
    return-void

    .line 76
    :cond_2
    new-instance v12, Ljava/util/ArrayList;

    invoke-direct {v12}, Ljava/util/ArrayList;-><init>()V

    .line 77
    .local v12, "storeSupportDeviceList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/belkin/wemo/cache/data/DeviceInformation;>;"
    new-instance v11, Ljava/util/ArrayList;

    invoke-direct {v11}, Ljava/util/ArrayList;-><init>()V

    .line 78
    .local v11, "noStoreSupportDeviceList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/belkin/wemo/cache/data/DeviceInformation;>;"
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v10

    .local v10, "i$":Ljava/util/Iterator;
    :goto_1
    invoke-interface {v10}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_4

    invoke-interface {v10}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Lcom/belkin/wemo/cache/data/DeviceInformation;

    .line 80
    .local v9, "device":Lcom/belkin/wemo/cache/data/DeviceInformation;
    iget-object v2, p0, Lcom/belkin/wemo/rules/operation/impl/RMDBRulesRemoteOperationImpl;->rulesUtils:Lcom/belkin/wemo/rules/util/RMIRulesUtils;

    invoke-interface {v2, v9}, Lcom/belkin/wemo/rules/util/RMIRulesUtils;->isFetchStoreRulesSupportedInRemoteDev(Lcom/belkin/wemo/cache/data/DeviceInformation;)Z

    move-result v2

    if-eqz v2, :cond_3

    .line 82
    invoke-virtual {v12, v9}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_1

    .line 85
    :cond_3
    invoke-virtual {v11, v9}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_1

    .line 89
    .end local v9    # "device":Lcom/belkin/wemo/cache/data/DeviceInformation;
    :cond_4
    new-instance v3, Lcom/belkin/wemo/rules/operation/handler/RMSyncDBRulesRemoteResponseHandler;

    move-object/from16 v0, p4

    move-object/from16 v1, p3

    invoke-direct {v3, v0, v1}, Lcom/belkin/wemo/rules/operation/handler/RMSyncDBRulesRemoteResponseHandler;-><init>(Lcom/belkin/wemo/rules/operation/callback/RMSyncRulesTypeErrorCallback;Lcom/belkin/wemo/rules/operation/callback/RMSyncRulesTypeSuccessCallback;)V

    .line 91
    .local v3, "handler":Lcom/belkin/wemo/rules/operation/handler/RMSyncDBRulesRemoteResponseHandler;
    invoke-virtual {v12}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v2

    if-nez v2, :cond_5

    .line 92
    invoke-virtual {v3}, Lcom/belkin/wemo/rules/operation/handler/RMSyncDBRulesRemoteResponseHandler;->incrementFWCount()V

    .line 93
    const-string v2, " RMDBRulesRemoteOperationImpl"

    const-string v4, "if (!storeSupportDeviceList.isEmpty())"

    invoke-static {v2, v4}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 94
    invoke-static {}, Lcom/belkin/wemo/thread/WeMoThreadPoolHandler;->getInstance()Lcom/belkin/wemo/thread/WeMoThreadPoolHandler;

    move-result-object v13

    new-instance v2, Lcom/belkin/wemo/rules/operation/runnable/RMSyncDBRulesWithStoreRemoteRunnable;

    const/4 v6, 0x0

    iget-object v8, p0, Lcom/belkin/wemo/rules/operation/impl/RMDBRulesRemoteOperationImpl;->rulesUtils:Lcom/belkin/wemo/rules/util/RMIRulesUtils;

    move-object v4, v3

    move-object v5, p1

    move-object/from16 v7, p2

    invoke-direct/range {v2 .. v8}, Lcom/belkin/wemo/rules/operation/runnable/RMSyncDBRulesWithStoreRemoteRunnable;-><init>(Lcom/belkin/wemo/rules/operation/callback/RMStoreRulesRemoteErrorCallback;Lcom/belkin/wemo/rules/operation/callback/RMStoreRulesRemoteSuccessCallback;Ljava/util/List;Lcom/belkin/wemo/rules/data/RMDBRule;Ljava/util/HashMap;Lcom/belkin/wemo/rules/util/RMIRulesUtils;)V

    invoke-virtual {v13, v2}, Lcom/belkin/wemo/thread/WeMoThreadPoolHandler;->executeViaBackground(Lcom/belkin/wemo/runnable/WeMoRunnable;)V

    .line 97
    :cond_5
    invoke-virtual {v11}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v2

    if-nez v2, :cond_1

    .line 98
    invoke-virtual {v3}, Lcom/belkin/wemo/rules/operation/handler/RMSyncDBRulesRemoteResponseHandler;->incrementFWCount()V

    .line 99
    invoke-static {}, Lcom/belkin/wemo/thread/WeMoThreadPoolHandler;->getInstance()Lcom/belkin/wemo/thread/WeMoThreadPoolHandler;

    move-result-object v8

    new-instance v2, Lcom/belkin/wemo/rules/operation/runnable/RMSyncDBRulesNoStoreRemoteRunnable;

    iget-object v7, p0, Lcom/belkin/wemo/rules/operation/impl/RMDBRulesRemoteOperationImpl;->rulesUtils:Lcom/belkin/wemo/rules/util/RMIRulesUtils;

    move-object v4, v3

    move-object v5, p1

    move-object/from16 v6, p2

    invoke-direct/range {v2 .. v7}, Lcom/belkin/wemo/rules/operation/runnable/RMSyncDBRulesNoStoreRemoteRunnable;-><init>(Lcom/belkin/wemo/rules/operation/callback/RMStoreRulesRemoteErrorCallback;Lcom/belkin/wemo/rules/operation/callback/RMStoreRulesRemoteSuccessCallback;Ljava/util/List;Ljava/util/HashMap;Lcom/belkin/wemo/rules/util/RMIRulesUtils;)V

    invoke-virtual {v8, v2}, Lcom/belkin/wemo/thread/WeMoThreadPoolHandler;->executeViaBackground(Lcom/belkin/wemo/runnable/WeMoRunnable;)V

    goto :goto_0
.end method
