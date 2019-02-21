.class public Lcom/belkin/wemo/rules/operation/runnable/RMSyncDBRulesWithStoreRemoteRunnable;
.super Lcom/belkin/wemo/runnable/WeMoRunnable;
.source "RMSyncDBRulesWithStoreRemoteRunnable.java"

# interfaces
.implements Lcom/belkin/wemo/cache/cloud/listener/OnRequestCompleteListener;


# instance fields
.field protected devicesList:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lcom/belkin/wemo/cache/data/DeviceInformation;",
            ">;"
        }
    .end annotation
.end field

.field protected errorCallback:Lcom/belkin/wemo/rules/operation/callback/RMStoreRulesRemoteErrorCallback;

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

.field private processDB:I

.field private rule:Lcom/belkin/wemo/rules/data/RMDBRule;

.field private rulesUtils:Lcom/belkin/wemo/rules/util/RMIRulesUtils;

.field protected succesCallback:Lcom/belkin/wemo/rules/operation/callback/RMStoreRulesRemoteSuccessCallback;


# direct methods
.method public constructor <init>(Lcom/belkin/wemo/rules/operation/callback/RMStoreRulesRemoteErrorCallback;Lcom/belkin/wemo/rules/operation/callback/RMStoreRulesRemoteSuccessCallback;Ljava/util/List;Lcom/belkin/wemo/rules/data/RMDBRule;Ljava/util/HashMap;Lcom/belkin/wemo/rules/util/RMIRulesUtils;)V
    .locals 0
    .param p1, "errorCallback"    # Lcom/belkin/wemo/rules/operation/callback/RMStoreRulesRemoteErrorCallback;
    .param p2, "succesCallback"    # Lcom/belkin/wemo/rules/operation/callback/RMStoreRulesRemoteSuccessCallback;
    .param p4, "rule"    # Lcom/belkin/wemo/rules/data/RMDBRule;
    .param p6, "rulesUtils"    # Lcom/belkin/wemo/rules/util/RMIRulesUtils;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/belkin/wemo/rules/operation/callback/RMStoreRulesRemoteErrorCallback;",
            "Lcom/belkin/wemo/rules/operation/callback/RMStoreRulesRemoteSuccessCallback;",
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
            "Lcom/belkin/wemo/rules/util/RMIRulesUtils;",
            ")V"
        }
    .end annotation

    .prologue
    .line 42
    .local p3, "devicesList":Ljava/util/List;, "Ljava/util/List<Lcom/belkin/wemo/cache/data/DeviceInformation;>;"
    .local p5, "params":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    invoke-direct {p0}, Lcom/belkin/wemo/runnable/WeMoRunnable;-><init>()V

    .line 43
    iput-object p1, p0, Lcom/belkin/wemo/rules/operation/runnable/RMSyncDBRulesWithStoreRemoteRunnable;->errorCallback:Lcom/belkin/wemo/rules/operation/callback/RMStoreRulesRemoteErrorCallback;

    .line 44
    iput-object p2, p0, Lcom/belkin/wemo/rules/operation/runnable/RMSyncDBRulesWithStoreRemoteRunnable;->succesCallback:Lcom/belkin/wemo/rules/operation/callback/RMStoreRulesRemoteSuccessCallback;

    .line 46
    iput-object p3, p0, Lcom/belkin/wemo/rules/operation/runnable/RMSyncDBRulesWithStoreRemoteRunnable;->devicesList:Ljava/util/List;

    .line 47
    iput-object p5, p0, Lcom/belkin/wemo/rules/operation/runnable/RMSyncDBRulesWithStoreRemoteRunnable;->params:Ljava/util/HashMap;

    .line 48
    iput-object p4, p0, Lcom/belkin/wemo/rules/operation/runnable/RMSyncDBRulesWithStoreRemoteRunnable;->rule:Lcom/belkin/wemo/rules/data/RMDBRule;

    .line 49
    iput-object p6, p0, Lcom/belkin/wemo/rules/operation/runnable/RMSyncDBRulesWithStoreRemoteRunnable;->rulesUtils:Lcom/belkin/wemo/rules/util/RMIRulesUtils;

    .line 50
    return-void
.end method


# virtual methods
.method protected getProcessDBValue(Lcom/belkin/wemo/rules/data/RMDBRule;Ljava/lang/String;)Ljava/lang/String;
    .locals 1
    .param p1, "rule"    # Lcom/belkin/wemo/rules/data/RMDBRule;
    .param p2, "deviceUdn"    # Ljava/lang/String;

    .prologue
    .line 99
    iget v0, p0, Lcom/belkin/wemo/rules/operation/runnable/RMSyncDBRulesWithStoreRemoteRunnable;->processDB:I

    invoke-static {v0}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public onRequestComplete(ZI[B)V
    .locals 4
    .param p1, "success"    # Z
    .param p2, "statusCode"    # I
    .param p3, "resp"    # [B

    .prologue
    const/4 v3, 0x2

    .line 105
    iget-object v0, p0, Lcom/belkin/wemo/rules/operation/runnable/RMSyncDBRulesWithStoreRemoteRunnable;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Store Rules (Store Support): StoreRules remote call response. status = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 106
    const/16 v0, 0xc8

    if-eq p2, v0, :cond_1

    const/16 v0, 0xce

    if-eq p2, v0, :cond_1

    .line 108
    iget-object v0, p0, Lcom/belkin/wemo/rules/operation/runnable/RMSyncDBRulesWithStoreRemoteRunnable;->errorCallback:Lcom/belkin/wemo/rules/operation/callback/RMStoreRulesRemoteErrorCallback;

    if-eqz v0, :cond_0

    .line 109
    iget-object v0, p0, Lcom/belkin/wemo/rules/operation/runnable/RMSyncDBRulesWithStoreRemoteRunnable;->errorCallback:Lcom/belkin/wemo/rules/operation/callback/RMStoreRulesRemoteErrorCallback;

    new-instance v1, Lcom/belkin/wemo/rules/error/RMRulesError;

    invoke-direct {v1}, Lcom/belkin/wemo/rules/error/RMRulesError;-><init>()V

    iget-object v2, p0, Lcom/belkin/wemo/rules/operation/runnable/RMSyncDBRulesWithStoreRemoteRunnable;->devicesList:Ljava/util/List;

    invoke-interface {v0, v1, v2, v3}, Lcom/belkin/wemo/rules/operation/callback/RMStoreRulesRemoteErrorCallback;->onError(Lcom/belkin/wemo/rules/error/RMRulesError;Ljava/util/List;I)V

    .line 116
    :cond_0
    :goto_0
    return-void

    .line 112
    :cond_1
    iget-object v0, p0, Lcom/belkin/wemo/rules/operation/runnable/RMSyncDBRulesWithStoreRemoteRunnable;->succesCallback:Lcom/belkin/wemo/rules/operation/callback/RMStoreRulesRemoteSuccessCallback;

    if-eqz v0, :cond_0

    .line 113
    iget-object v0, p0, Lcom/belkin/wemo/rules/operation/runnable/RMSyncDBRulesWithStoreRemoteRunnable;->succesCallback:Lcom/belkin/wemo/rules/operation/callback/RMStoreRulesRemoteSuccessCallback;

    iget-object v1, p0, Lcom/belkin/wemo/rules/operation/runnable/RMSyncDBRulesWithStoreRemoteRunnable;->devicesList:Ljava/util/List;

    invoke-interface {v0, v1, v3}, Lcom/belkin/wemo/rules/operation/callback/RMStoreRulesRemoteSuccessCallback;->onSuccess(Ljava/util/List;I)V

    goto :goto_0
.end method

.method public run()V
    .locals 22

    .prologue
    .line 56
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/wemo/rules/operation/runnable/RMSyncDBRulesWithStoreRemoteRunnable;->params:Ljava/util/HashMap;

    move-object/from16 v18, v0

    const-string v19, "db_zip_file"

    invoke-virtual/range {v18 .. v19}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Ljava/lang/String;

    .line 57
    .local v7, "dbZIPFileInApp":Ljava/lang/String;
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/wemo/rules/operation/runnable/RMSyncDBRulesWithStoreRemoteRunnable;->params:Ljava/util/HashMap;

    move-object/from16 v18, v0

    const-string v19, "new_db_version"

    invoke-virtual/range {v18 .. v19}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/lang/Integer;

    .line 58
    .local v6, "dbVersionToSet":Ljava/lang/Integer;
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/wemo/rules/operation/runnable/RMSyncDBRulesWithStoreRemoteRunnable;->params:Ljava/util/HashMap;

    move-object/from16 v18, v0

    const-string v19, "new_db_version"

    invoke-virtual/range {v18 .. v19}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v16

    .line 59
    .local v16, "processDBObj":Ljava/lang/Object;
    if-eqz v16, :cond_0

    .line 60
    check-cast v16, Ljava/lang/Integer;

    .end local v16    # "processDBObj":Ljava/lang/Object;
    invoke-virtual/range {v16 .. v16}, Ljava/lang/Integer;->intValue()I

    move-result v18

    move/from16 v0, v18

    move-object/from16 v1, p0

    iput v0, v1, Lcom/belkin/wemo/rules/operation/runnable/RMSyncDBRulesWithStoreRemoteRunnable;->processDB:I

    .line 63
    :cond_0
    const-string v5, ""

    .line 65
    .local v5, "dbInBase64Encoding":Ljava/lang/String;
    :try_start_0
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/wemo/rules/operation/runnable/RMSyncDBRulesWithStoreRemoteRunnable;->rulesUtils:Lcom/belkin/wemo/rules/util/RMIRulesUtils;

    move-object/from16 v18, v0

    move-object/from16 v0, v18

    invoke-interface {v0, v7}, Lcom/belkin/wemo/rules/util/RMIRulesUtils;->getFileInBase64Encoding(Ljava/lang/String;)Ljava/lang/String;
    :try_end_0
    .catch Lcom/belkin/wemo/exception/InvalidArgumentsException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v5

    .line 76
    invoke-static {v5}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v18

    if-eqz v18, :cond_2

    .line 78
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/wemo/rules/operation/runnable/RMSyncDBRulesWithStoreRemoteRunnable;->errorCallback:Lcom/belkin/wemo/rules/operation/callback/RMStoreRulesRemoteErrorCallback;

    move-object/from16 v18, v0

    if-eqz v18, :cond_1

    .line 79
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/wemo/rules/operation/runnable/RMSyncDBRulesWithStoreRemoteRunnable;->errorCallback:Lcom/belkin/wemo/rules/operation/callback/RMStoreRulesRemoteErrorCallback;

    move-object/from16 v18, v0

    new-instance v19, Lcom/belkin/wemo/rules/error/RMRulesError;

    invoke-direct/range {v19 .. v19}, Lcom/belkin/wemo/rules/error/RMRulesError;-><init>()V

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/wemo/rules/operation/runnable/RMSyncDBRulesWithStoreRemoteRunnable;->devicesList:Ljava/util/List;

    move-object/from16 v20, v0

    const/16 v21, 0x2

    invoke-interface/range {v18 .. v21}, Lcom/belkin/wemo/rules/operation/callback/RMStoreRulesRemoteErrorCallback;->onError(Lcom/belkin/wemo/rules/error/RMRulesError;Ljava/util/List;I)V

    .line 96
    :cond_1
    :goto_0
    return-void

    .line 66
    :catch_0
    move-exception v9

    .line 67
    .local v9, "e":Lcom/belkin/wemo/exception/InvalidArgumentsException;
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/wemo/rules/operation/runnable/RMSyncDBRulesWithStoreRemoteRunnable;->TAG:Ljava/lang/String;

    move-object/from16 v18, v0

    const-string v19, "Store Rules Remote (Store Support): InvalidArgumentsException while converting db zip to base64 encoding."

    move-object/from16 v0, v18

    move-object/from16 v1, v19

    invoke-static {v0, v1, v9}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Exception;)V

    .line 68
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/wemo/rules/operation/runnable/RMSyncDBRulesWithStoreRemoteRunnable;->errorCallback:Lcom/belkin/wemo/rules/operation/callback/RMStoreRulesRemoteErrorCallback;

    move-object/from16 v18, v0

    if-eqz v18, :cond_1

    .line 69
    new-instance v10, Lcom/belkin/wemo/rules/device/error/RMRuleDeviceError;

    invoke-direct {v10}, Lcom/belkin/wemo/rules/device/error/RMRuleDeviceError;-><init>()V

    .line 70
    .local v10, "error":Lcom/belkin/wemo/rules/device/error/RMRuleDeviceError;
    invoke-virtual {v9}, Lcom/belkin/wemo/exception/InvalidArgumentsException;->getMessage()Ljava/lang/String;

    move-result-object v18

    move-object/from16 v0, v18

    invoke-virtual {v10, v0}, Lcom/belkin/wemo/rules/device/error/RMRuleDeviceError;->setErrorMessage(Ljava/lang/String;)V

    .line 71
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/wemo/rules/operation/runnable/RMSyncDBRulesWithStoreRemoteRunnable;->errorCallback:Lcom/belkin/wemo/rules/operation/callback/RMStoreRulesRemoteErrorCallback;

    move-object/from16 v18, v0

    new-instance v19, Lcom/belkin/wemo/rules/error/RMRulesError;

    invoke-direct/range {v19 .. v19}, Lcom/belkin/wemo/rules/error/RMRulesError;-><init>()V

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/wemo/rules/operation/runnable/RMSyncDBRulesWithStoreRemoteRunnable;->devicesList:Ljava/util/List;

    move-object/from16 v20, v0

    const/16 v21, 0x2

    invoke-interface/range {v18 .. v21}, Lcom/belkin/wemo/rules/operation/callback/RMStoreRulesRemoteErrorCallback;->onError(Lcom/belkin/wemo/rules/error/RMRulesError;Ljava/util/List;I)V

    goto :goto_0

    .line 82
    .end local v9    # "e":Lcom/belkin/wemo/exception/InvalidArgumentsException;
    .end local v10    # "error":Lcom/belkin/wemo/rules/device/error/RMRuleDeviceError;
    :cond_2
    new-instance v4, Ljava/util/ArrayList;

    invoke-direct {v4}, Ljava/util/ArrayList;-><init>()V

    .line 83
    .local v4, "dataList":Ljava/util/List;, "Ljava/util/List<Lcom/belkin/wemo/cache/cloud/RMCloudRequestStoreRules$PluginStoreRulesData;>;"
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/wemo/rules/operation/runnable/RMSyncDBRulesWithStoreRemoteRunnable;->devicesList:Ljava/util/List;

    move-object/from16 v18, v0

    invoke-interface/range {v18 .. v18}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v11

    .local v11, "i$":Ljava/util/Iterator;
    :goto_1
    invoke-interface {v11}, Ljava/util/Iterator;->hasNext()Z

    move-result v18

    if-eqz v18, :cond_3

    invoke-interface {v11}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Lcom/belkin/wemo/cache/data/DeviceInformation;

    .line 84
    .local v8, "deviceInfo":Lcom/belkin/wemo/cache/data/DeviceInformation;
    invoke-virtual {v8}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getPluginID()Ljava/lang/String;

    move-result-object v14

    .line 85
    .local v14, "pluginId":Ljava/lang/String;
    invoke-virtual {v8}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getMAC()Ljava/lang/String;

    move-result-object v12

    .line 86
    .local v12, "mac":Ljava/lang/String;
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/wemo/rules/operation/runnable/RMSyncDBRulesWithStoreRemoteRunnable;->rule:Lcom/belkin/wemo/rules/data/RMDBRule;

    move-object/from16 v18, v0

    invoke-virtual {v8}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getUDN()Ljava/lang/String;

    move-result-object v19

    move-object/from16 v0, p0

    move-object/from16 v1, v18

    move-object/from16 v2, v19

    invoke-virtual {v0, v1, v2}, Lcom/belkin/wemo/rules/operation/runnable/RMSyncDBRulesWithStoreRemoteRunnable;->getProcessDBValue(Lcom/belkin/wemo/rules/data/RMDBRule;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v15

    .line 88
    .local v15, "processDB":Ljava/lang/String;
    new-instance v3, Lcom/belkin/wemo/cache/cloud/RMCloudRequestStoreRules$PluginStoreRulesData;

    invoke-direct {v3, v14, v12, v15}, Lcom/belkin/wemo/cache/cloud/RMCloudRequestStoreRules$PluginStoreRulesData;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 89
    .local v3, "data":Lcom/belkin/wemo/cache/cloud/RMCloudRequestStoreRules$PluginStoreRulesData;
    invoke-interface {v4, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_1

    .line 92
    .end local v3    # "data":Lcom/belkin/wemo/cache/cloud/RMCloudRequestStoreRules$PluginStoreRulesData;
    .end local v8    # "deviceInfo":Lcom/belkin/wemo/cache/data/DeviceInformation;
    .end local v12    # "mac":Ljava/lang/String;
    .end local v14    # "pluginId":Ljava/lang/String;
    .end local v15    # "processDB":Ljava/lang/String;
    :cond_3
    new-instance v17, Lcom/belkin/wemo/cache/cloud/RMCloudRequestStoreRules;

    invoke-virtual {v6}, Ljava/lang/Integer;->intValue()I

    move-result v18

    move-object/from16 v0, v17

    move-object/from16 v1, p0

    move/from16 v2, v18

    invoke-direct {v0, v4, v1, v5, v2}, Lcom/belkin/wemo/cache/cloud/RMCloudRequestStoreRules;-><init>(Ljava/util/List;Lcom/belkin/wemo/cache/cloud/listener/OnRequestCompleteListener;Ljava/lang/String;I)V

    .line 93
    .local v17, "request":Lcom/belkin/wemo/cache/cloud/RMCloudRequestStoreRules;
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/wemo/rules/operation/runnable/RMSyncDBRulesWithStoreRemoteRunnable;->rulesUtils:Lcom/belkin/wemo/rules/util/RMIRulesUtils;

    move-object/from16 v18, v0

    invoke-interface/range {v18 .. v18}, Lcom/belkin/wemo/rules/util/RMIRulesUtils;->getCloudRequestManager()Lcom/belkin/wemo/cache/cloud/CloudRequestManager;

    move-result-object v13

    .line 94
    .local v13, "manager":Lcom/belkin/wemo/cache/cloud/CloudRequestManager;
    move-object/from16 v0, v17

    invoke-virtual {v13, v0}, Lcom/belkin/wemo/cache/cloud/CloudRequestManager;->makeByteStreamRequest(Lcom/belkin/wemo/cache/cloud/CloudRequestInterface;)V

    goto/16 :goto_0
.end method
