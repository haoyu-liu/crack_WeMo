.class Lcom/belkin/wemo/rules/operation/runnable/RMSyncDBRulesNoStoreRemoteRunnable$SendDBFileResponse;
.super Ljava/lang/Object;
.source "RMSyncDBRulesNoStoreRemoteRunnable.java"

# interfaces
.implements Lcom/belkin/wemo/cache/cloud/listener/OnRequestCompleteListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/belkin/wemo/rules/operation/runnable/RMSyncDBRulesNoStoreRemoteRunnable;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "SendDBFileResponse"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/belkin/wemo/rules/operation/runnable/RMSyncDBRulesNoStoreRemoteRunnable;


# direct methods
.method private constructor <init>(Lcom/belkin/wemo/rules/operation/runnable/RMSyncDBRulesNoStoreRemoteRunnable;)V
    .locals 0

    .prologue
    .line 87
    iput-object p1, p0, Lcom/belkin/wemo/rules/operation/runnable/RMSyncDBRulesNoStoreRemoteRunnable$SendDBFileResponse;->this$0:Lcom/belkin/wemo/rules/operation/runnable/RMSyncDBRulesNoStoreRemoteRunnable;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/belkin/wemo/rules/operation/runnable/RMSyncDBRulesNoStoreRemoteRunnable;Lcom/belkin/wemo/rules/operation/runnable/RMSyncDBRulesNoStoreRemoteRunnable$1;)V
    .locals 0
    .param p1, "x0"    # Lcom/belkin/wemo/rules/operation/runnable/RMSyncDBRulesNoStoreRemoteRunnable;
    .param p2, "x1"    # Lcom/belkin/wemo/rules/operation/runnable/RMSyncDBRulesNoStoreRemoteRunnable$1;

    .prologue
    .line 87
    invoke-direct {p0, p1}, Lcom/belkin/wemo/rules/operation/runnable/RMSyncDBRulesNoStoreRemoteRunnable$SendDBFileResponse;-><init>(Lcom/belkin/wemo/rules/operation/runnable/RMSyncDBRulesNoStoreRemoteRunnable;)V

    return-void
.end method


# virtual methods
.method public onRequestComplete(ZI[B)V
    .locals 10
    .param p1, "success"    # Z
    .param p2, "statusCode"    # I
    .param p3, "resp"    # [B

    .prologue
    .line 92
    iget-object v6, p0, Lcom/belkin/wemo/rules/operation/runnable/RMSyncDBRulesNoStoreRemoteRunnable$SendDBFileResponse;->this$0:Lcom/belkin/wemo/rules/operation/runnable/RMSyncDBRulesNoStoreRemoteRunnable;

    invoke-static {v6}, Lcom/belkin/wemo/rules/operation/runnable/RMSyncDBRulesNoStoreRemoteRunnable;->access$200(Lcom/belkin/wemo/rules/operation/runnable/RMSyncDBRulesNoStoreRemoteRunnable;)Ljava/lang/String;

    move-result-object v6

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "Store Rules (No Store): Send DB File remote call response. status = "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v6, v7}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 93
    const/16 v6, 0xc8

    if-eq p2, v6, :cond_1

    const/16 v6, 0xce

    if-eq p2, v6, :cond_1

    .line 96
    iget-object v6, p0, Lcom/belkin/wemo/rules/operation/runnable/RMSyncDBRulesNoStoreRemoteRunnable$SendDBFileResponse;->this$0:Lcom/belkin/wemo/rules/operation/runnable/RMSyncDBRulesNoStoreRemoteRunnable;

    iget-object v6, v6, Lcom/belkin/wemo/rules/operation/runnable/RMSyncDBRulesNoStoreRemoteRunnable;->errorCallback:Lcom/belkin/wemo/rules/operation/callback/RMStoreRulesRemoteErrorCallback;

    if-eqz v6, :cond_0

    .line 97
    iget-object v6, p0, Lcom/belkin/wemo/rules/operation/runnable/RMSyncDBRulesNoStoreRemoteRunnable$SendDBFileResponse;->this$0:Lcom/belkin/wemo/rules/operation/runnable/RMSyncDBRulesNoStoreRemoteRunnable;

    iget-object v6, v6, Lcom/belkin/wemo/rules/operation/runnable/RMSyncDBRulesNoStoreRemoteRunnable;->errorCallback:Lcom/belkin/wemo/rules/operation/callback/RMStoreRulesRemoteErrorCallback;

    new-instance v7, Lcom/belkin/wemo/rules/error/RMRulesError;

    invoke-direct {v7}, Lcom/belkin/wemo/rules/error/RMRulesError;-><init>()V

    iget-object v8, p0, Lcom/belkin/wemo/rules/operation/runnable/RMSyncDBRulesNoStoreRemoteRunnable$SendDBFileResponse;->this$0:Lcom/belkin/wemo/rules/operation/runnable/RMSyncDBRulesNoStoreRemoteRunnable;

    iget-object v8, v8, Lcom/belkin/wemo/rules/operation/runnable/RMSyncDBRulesNoStoreRemoteRunnable;->devicesList:Ljava/util/List;

    const/4 v9, 0x1

    invoke-interface {v6, v7, v8, v9}, Lcom/belkin/wemo/rules/operation/callback/RMStoreRulesRemoteErrorCallback;->onError(Lcom/belkin/wemo/rules/error/RMRulesError;Ljava/util/List;I)V

    .line 111
    :cond_0
    :goto_0
    return-void

    .line 102
    :cond_1
    iget-object v6, p0, Lcom/belkin/wemo/rules/operation/runnable/RMSyncDBRulesNoStoreRemoteRunnable$SendDBFileResponse;->this$0:Lcom/belkin/wemo/rules/operation/runnable/RMSyncDBRulesNoStoreRemoteRunnable;

    iget-object v6, v6, Lcom/belkin/wemo/rules/operation/runnable/RMSyncDBRulesNoStoreRemoteRunnable;->params:Ljava/util/HashMap;

    const-string v7, "new_db_version"

    invoke-virtual {v6, v7}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    .line 103
    .local v0, "dbVersionToSet":Ljava/lang/Integer;
    new-instance v4, Ljava/util/HashMap;

    invoke-direct {v4}, Ljava/util/HashMap;-><init>()V

    .line 104
    .local v4, "pluginIDToMacHashMap":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/String;>;"
    iget-object v6, p0, Lcom/belkin/wemo/rules/operation/runnable/RMSyncDBRulesNoStoreRemoteRunnable$SendDBFileResponse;->this$0:Lcom/belkin/wemo/rules/operation/runnable/RMSyncDBRulesNoStoreRemoteRunnable;

    iget-object v6, v6, Lcom/belkin/wemo/rules/operation/runnable/RMSyncDBRulesNoStoreRemoteRunnable;->devicesList:Ljava/util/List;

    invoke-interface {v6}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    .local v2, "i$":Ljava/util/Iterator;
    :goto_1
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_2

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/belkin/wemo/cache/data/DeviceInformation;

    .line 105
    .local v1, "deviceInfo":Lcom/belkin/wemo/cache/data/DeviceInformation;
    invoke-virtual {v1}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getPluginID()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v1}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getMAC()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v4, v6, v7}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_1

    .line 107
    .end local v1    # "deviceInfo":Lcom/belkin/wemo/cache/data/DeviceInformation;
    :cond_2
    new-instance v5, Lcom/belkin/wemo/cache/cloud/RMCloudRequestSetDBVersion;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v6

    new-instance v7, Lcom/belkin/wemo/rules/operation/runnable/RMSyncDBRulesNoStoreRemoteRunnable$SetDBVersionResponse;

    iget-object v8, p0, Lcom/belkin/wemo/rules/operation/runnable/RMSyncDBRulesNoStoreRemoteRunnable$SendDBFileResponse;->this$0:Lcom/belkin/wemo/rules/operation/runnable/RMSyncDBRulesNoStoreRemoteRunnable;

    const/4 v9, 0x0

    invoke-direct {v7, v8, v9}, Lcom/belkin/wemo/rules/operation/runnable/RMSyncDBRulesNoStoreRemoteRunnable$SetDBVersionResponse;-><init>(Lcom/belkin/wemo/rules/operation/runnable/RMSyncDBRulesNoStoreRemoteRunnable;Lcom/belkin/wemo/rules/operation/runnable/RMSyncDBRulesNoStoreRemoteRunnable$1;)V

    invoke-direct {v5, v4, v6, v7}, Lcom/belkin/wemo/cache/cloud/RMCloudRequestSetDBVersion;-><init>(Ljava/util/HashMap;ILcom/belkin/wemo/cache/cloud/listener/OnRequestCompleteListener;)V

    .line 108
    .local v5, "request":Lcom/belkin/wemo/cache/cloud/RMCloudRequestSetDBVersion;
    new-instance v3, Lcom/belkin/wemo/cache/cloud/CloudRequestManager;

    sget-object v6, Lcom/belkin/wemo/WeMo;->INSTANCE:Lcom/belkin/wemo/WeMo;

    invoke-virtual {v6}, Lcom/belkin/wemo/WeMo;->getContext()Landroid/content/Context;

    move-result-object v6

    invoke-direct {v3, v6}, Lcom/belkin/wemo/cache/cloud/CloudRequestManager;-><init>(Landroid/content/Context;)V

    .line 109
    .local v3, "manager":Lcom/belkin/wemo/cache/cloud/CloudRequestManager;
    invoke-virtual {v3, v5}, Lcom/belkin/wemo/cache/cloud/CloudRequestManager;->makeRequest(Lcom/belkin/wemo/cache/cloud/CloudRequestInterface;)V

    goto :goto_0
.end method
