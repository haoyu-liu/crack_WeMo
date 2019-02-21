.class public Lcom/belkin/wemo/rules/fetch/handler/RMFetchAndSyncRulesResponseHandler;
.super Lcom/belkin/wemo/rules/fetch/handler/RMFetchRulesResponseHandler;
.source "RMFetchAndSyncRulesResponseHandler.java"


# static fields
.field private static final TAG:Ljava/lang/String;


# instance fields
.field private rulesUtils:Lcom/belkin/wemo/rules/util/RMIRulesUtils;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 22
    const-class v0, Lcom/belkin/wemo/rules/fetch/handler/RMFetchAndSyncRulesResponseHandler;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/belkin/wemo/rules/fetch/handler/RMFetchAndSyncRulesResponseHandler;->TAG:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>(ILcom/belkin/wemo/rules/fetch/callback/RMFetchRulesSuccessCallback;Lcom/belkin/wemo/rules/fetch/callback/RMFetchRulesErrorCallback;Lcom/belkin/wemo/rules/util/RMIRulesUtils;Lcom/belkin/wemo/rules/db/broadcast/RMIRulesUpdatedBroadcaster;)V
    .locals 0
    .param p1, "ruleTypesCount"    # I
    .param p2, "successCallback"    # Lcom/belkin/wemo/rules/fetch/callback/RMFetchRulesSuccessCallback;
    .param p3, "errorCallback"    # Lcom/belkin/wemo/rules/fetch/callback/RMFetchRulesErrorCallback;
    .param p4, "rulesUtils"    # Lcom/belkin/wemo/rules/util/RMIRulesUtils;
    .param p5, "rulesFetchedBroadcaster"    # Lcom/belkin/wemo/rules/db/broadcast/RMIRulesUpdatedBroadcaster;

    .prologue
    .line 29
    invoke-direct {p0, p1, p2, p3, p5}, Lcom/belkin/wemo/rules/fetch/handler/RMFetchRulesResponseHandler;-><init>(ILcom/belkin/wemo/rules/fetch/callback/RMFetchRulesSuccessCallback;Lcom/belkin/wemo/rules/fetch/callback/RMFetchRulesErrorCallback;Lcom/belkin/wemo/rules/db/broadcast/RMIRulesUpdatedBroadcaster;)V

    .line 30
    iput-object p4, p0, Lcom/belkin/wemo/rules/fetch/handler/RMFetchAndSyncRulesResponseHandler;->rulesUtils:Lcom/belkin/wemo/rules/util/RMIRulesUtils;

    .line 31
    return-void
.end method

.method private getDevicesToSync(Ljava/util/ArrayList;)Ljava/util/ArrayList;
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList",
            "<",
            "Ljava/lang/String;",
            ">;)",
            "Ljava/util/ArrayList",
            "<",
            "Lcom/belkin/wemo/cache/data/DeviceInformation;",
            ">;"
        }
    .end annotation

    .prologue
    .line 71
    .local p1, "outOfSyncDeviceUDNList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 73
    .local v1, "devicesToSync":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/belkin/wemo/cache/data/DeviceInformation;>;"
    sget-object v4, Lcom/belkin/wemo/rules/fetch/handler/RMFetchAndSyncRulesResponseHandler;->TAG:Ljava/lang/String;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "Fetch Rules: Syncing uPnP devices with older DB versions. Such devices UDNs count: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    move-result v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->debugLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 74
    invoke-virtual {p1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v2

    .local v2, "i$":Ljava/util/Iterator;
    :cond_0
    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_1

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    .line 75
    .local v3, "udn":Ljava/lang/String;
    iget-object v4, p0, Lcom/belkin/wemo/rules/fetch/handler/RMFetchAndSyncRulesResponseHandler;->rulesUtils:Lcom/belkin/wemo/rules/util/RMIRulesUtils;

    invoke-interface {v4, v3}, Lcom/belkin/wemo/rules/util/RMIRulesUtils;->getDeviceInformationByUDNFromMemory(Ljava/lang/String;)Lcom/belkin/wemo/cache/data/DeviceInformation;

    move-result-object v0

    .line 77
    .local v0, "device":Lcom/belkin/wemo/cache/data/DeviceInformation;
    if-eqz v0, :cond_0

    .line 78
    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 81
    .end local v0    # "device":Lcom/belkin/wemo/cache/data/DeviceInformation;
    .end local v3    # "udn":Ljava/lang/String;
    :cond_1
    return-object v1
.end method


# virtual methods
.method public varargs declared-synchronized onSingleTypeRulesFetched(ILjava/util/ArrayList;[Ljava/lang/String;)V
    .locals 8
    .param p1, "rulesType"    # I
    .param p3, "extras"    # [Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I",
            "Ljava/util/ArrayList",
            "<",
            "Ljava/lang/String;",
            ">;[",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    .prologue
    .line 36
    .local p2, "outOfSyncDeviceUDNList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    monitor-enter p0

    :try_start_0
    invoke-super {p0, p1, p2, p3}, Lcom/belkin/wemo/rules/fetch/handler/RMFetchRulesResponseHandler;->onSingleTypeRulesFetched(ILjava/util/ArrayList;[Ljava/lang/String;)V

    .line 39
    invoke-virtual {p2}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v5

    if-nez v5, :cond_1

    .line 40
    const/4 v5, 0x2

    if-ne p1, v5, :cond_1

    .line 42
    iget-object v5, p0, Lcom/belkin/wemo/rules/fetch/handler/RMFetchAndSyncRulesResponseHandler;->rulesUtils:Lcom/belkin/wemo/rules/util/RMIRulesUtils;

    invoke-interface {v5}, Lcom/belkin/wemo/rules/util/RMIRulesUtils;->getDBFilePathWithNameInApp()Ljava/lang/String;

    move-result-object v2

    .line 43
    .local v2, "fileToZip":Ljava/lang/String;
    iget-object v5, p0, Lcom/belkin/wemo/rules/fetch/handler/RMFetchAndSyncRulesResponseHandler;->rulesUtils:Lcom/belkin/wemo/rules/util/RMIRulesUtils;

    invoke-interface {v5}, Lcom/belkin/wemo/rules/util/RMIRulesUtils;->getZippedDBFilePathWithNameInApp()Ljava/lang/String;

    move-result-object v0

    .line 45
    .local v0, "dbZIPFileLoc":Ljava/lang/String;
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result v5

    if-nez v5, :cond_1

    .line 48
    :try_start_1
    iget-object v5, p0, Lcom/belkin/wemo/rules/fetch/handler/RMFetchAndSyncRulesResponseHandler;->rulesUtils:Lcom/belkin/wemo/rules/util/RMIRulesUtils;

    invoke-interface {v5, v2, v0}, Lcom/belkin/wemo/rules/util/RMIRulesUtils;->createZipFileInApp(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 53
    :goto_0
    :try_start_2
    new-instance v4, Ljava/util/HashMap;

    invoke-direct {v4}, Ljava/util/HashMap;-><init>()V

    .line 54
    .local v4, "params":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    const-string v5, "db_zip_file"

    invoke-virtual {v4, v5, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 56
    if-eqz p3, :cond_0

    array-length v5, p3

    const/4 v6, 0x1

    if-lt v5, v6, :cond_0

    .line 57
    const-string v5, "new_db_version"

    const/4 v6, 0x0

    aget-object v6, p3, v6

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v6

    invoke-virtual {v4, v5, v6}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 61
    :cond_0
    invoke-static {}, Lcom/belkin/wemo/rules/operation/impl/RMDBRulesOperationFactory;->getInstance()Lcom/belkin/wemo/rules/operation/RMIRulesOperation;

    move-result-object v3

    .line 62
    .local v3, "operation":Lcom/belkin/wemo/rules/operation/RMIRulesOperation;, "Lcom/belkin/wemo/rules/operation/RMIRulesOperation<Lcom/belkin/wemo/rules/data/RMDBRule;>;"
    if-eqz v3, :cond_1

    .line 63
    invoke-direct {p0, p2}, Lcom/belkin/wemo/rules/fetch/handler/RMFetchAndSyncRulesResponseHandler;->getDevicesToSync(Ljava/util/ArrayList;)Ljava/util/ArrayList;

    move-result-object v5

    const/4 v6, 0x0

    const/4 v7, 0x0

    invoke-interface {v3, v5, v4, v6, v7}, Lcom/belkin/wemo/rules/operation/RMIRulesOperation;->syncRules(Ljava/util/List;Ljava/util/HashMap;Lcom/belkin/wemo/rules/operation/callback/RMSyncRulesTypeSuccessCallback;Lcom/belkin/wemo/rules/operation/callback/RMSyncRulesTypeErrorCallback;)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 68
    .end local v0    # "dbZIPFileLoc":Ljava/lang/String;
    .end local v2    # "fileToZip":Ljava/lang/String;
    .end local v3    # "operation":Lcom/belkin/wemo/rules/operation/RMIRulesOperation;, "Lcom/belkin/wemo/rules/operation/RMIRulesOperation<Lcom/belkin/wemo/rules/data/RMDBRule;>;"
    .end local v4    # "params":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    :cond_1
    monitor-exit p0

    return-void

    .line 49
    .restart local v0    # "dbZIPFileLoc":Ljava/lang/String;
    .restart local v2    # "fileToZip":Ljava/lang/String;
    :catch_0
    move-exception v1

    .line 50
    .local v1, "e":Ljava/io/IOException;
    :try_start_3
    sget-object v5, Lcom/belkin/wemo/rules/fetch/handler/RMFetchAndSyncRulesResponseHandler;->TAG:Ljava/lang/String;

    const-string v6, "Store Rules: Exception during zip for syncing devices with lower db version: "

    invoke-static {v5, v6, v1}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Exception;)V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    goto :goto_0

    .line 36
    .end local v0    # "dbZIPFileLoc":Ljava/lang/String;
    .end local v1    # "e":Ljava/io/IOException;
    .end local v2    # "fileToZip":Ljava/lang/String;
    :catchall_0
    move-exception v5

    monitor-exit p0

    throw v5
.end method
