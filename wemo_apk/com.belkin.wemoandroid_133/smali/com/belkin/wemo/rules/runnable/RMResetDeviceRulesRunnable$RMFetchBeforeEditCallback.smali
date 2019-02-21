.class Lcom/belkin/wemo/rules/runnable/RMResetDeviceRulesRunnable$RMFetchBeforeEditCallback;
.super Ljava/lang/Object;
.source "RMResetDeviceRulesRunnable.java"

# interfaces
.implements Lcom/belkin/wemo/rules/callback/RMShowRulesErrorCallback;
.implements Lcom/belkin/wemo/rules/callback/RMShowRulesSuccessCallback;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/belkin/wemo/rules/runnable/RMResetDeviceRulesRunnable;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "RMFetchBeforeEditCallback"
.end annotation


# instance fields
.field private activeDeviceList:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lcom/belkin/wemo/cache/data/DeviceInformation;",
            ">;"
        }
    .end annotation
.end field

.field final synthetic this$0:Lcom/belkin/wemo/rules/runnable/RMResetDeviceRulesRunnable;


# direct methods
.method public constructor <init>(Lcom/belkin/wemo/rules/runnable/RMResetDeviceRulesRunnable;Ljava/util/List;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lcom/belkin/wemo/cache/data/DeviceInformation;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 59
    .local p2, "activeDeviceList":Ljava/util/List;, "Ljava/util/List<Lcom/belkin/wemo/cache/data/DeviceInformation;>;"
    iput-object p1, p0, Lcom/belkin/wemo/rules/runnable/RMResetDeviceRulesRunnable$RMFetchBeforeEditCallback;->this$0:Lcom/belkin/wemo/rules/runnable/RMResetDeviceRulesRunnable;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 60
    iput-object p2, p0, Lcom/belkin/wemo/rules/runnable/RMResetDeviceRulesRunnable$RMFetchBeforeEditCallback;->activeDeviceList:Ljava/util/List;

    .line 61
    return-void
.end method


# virtual methods
.method public onError(Lcom/belkin/wemo/rules/error/RMRulesError;)V
    .locals 4
    .param p1, "error"    # Lcom/belkin/wemo/rules/error/RMRulesError;

    .prologue
    .line 115
    iget-object v0, p0, Lcom/belkin/wemo/rules/runnable/RMResetDeviceRulesRunnable$RMFetchBeforeEditCallback;->this$0:Lcom/belkin/wemo/rules/runnable/RMResetDeviceRulesRunnable;

    invoke-static {v0}, Lcom/belkin/wemo/rules/runnable/RMResetDeviceRulesRunnable;->access$600(Lcom/belkin/wemo/rules/runnable/RMResetDeviceRulesRunnable;)Lcom/belkin/wemo/rules/callback/RMResetDeviceRulesErrorCallback;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 116
    iget-object v0, p0, Lcom/belkin/wemo/rules/runnable/RMResetDeviceRulesRunnable$RMFetchBeforeEditCallback;->this$0:Lcom/belkin/wemo/rules/runnable/RMResetDeviceRulesRunnable;

    invoke-static {v0}, Lcom/belkin/wemo/rules/runnable/RMResetDeviceRulesRunnable;->access$600(Lcom/belkin/wemo/rules/runnable/RMResetDeviceRulesRunnable;)Lcom/belkin/wemo/rules/callback/RMResetDeviceRulesErrorCallback;

    move-result-object v0

    new-instance v1, Lcom/belkin/wemo/rules/error/RMRulesError;

    invoke-virtual {p1}, Lcom/belkin/wemo/rules/error/RMRulesError;->getErrorCode()I

    move-result v2

    invoke-virtual {p1}, Lcom/belkin/wemo/rules/error/RMRulesError;->getErrorMessage()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v1, v2, v3}, Lcom/belkin/wemo/rules/error/RMRulesError;-><init>(ILjava/lang/String;)V

    invoke-interface {v0, v1}, Lcom/belkin/wemo/rules/callback/RMResetDeviceRulesErrorCallback;->onError(Lcom/belkin/wemo/rules/error/RMRulesError;)V

    .line 118
    :cond_0
    return-void
.end method

.method public onSuccess(Ljava/util/List;)V
    .locals 14
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lcom/belkin/wemo/rules/data/RMRule;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 65
    .local p1, "rulesList":Ljava/util/List;, "Ljava/util/List<Lcom/belkin/wemo/rules/data/RMRule;>;"
    iget-object v9, p0, Lcom/belkin/wemo/rules/runnable/RMResetDeviceRulesRunnable$RMFetchBeforeEditCallback;->this$0:Lcom/belkin/wemo/rules/runnable/RMResetDeviceRulesRunnable;

    invoke-static {v9}, Lcom/belkin/wemo/rules/runnable/RMResetDeviceRulesRunnable;->access$000(Lcom/belkin/wemo/rules/runnable/RMResetDeviceRulesRunnable;)Ljava/lang/String;

    move-result-object v9

    const-string v10, "Reset Device Rules: FETCH RULES COMPLETE. RESETING DEVICE RULE ENTRIES FROM DB."

    invoke-static {v9, v10}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->debugLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 69
    new-instance v9, Lcom/belkin/wemo/rules/db/RMResetDBRulesManager;

    iget-object v10, p0, Lcom/belkin/wemo/rules/runnable/RMResetDeviceRulesRunnable$RMFetchBeforeEditCallback;->this$0:Lcom/belkin/wemo/rules/runnable/RMResetDeviceRulesRunnable;

    invoke-static {v10}, Lcom/belkin/wemo/rules/runnable/RMResetDeviceRulesRunnable;->access$100(Lcom/belkin/wemo/rules/runnable/RMResetDeviceRulesRunnable;)Ljava/lang/String;

    move-result-object v10

    invoke-direct {v9, v10}, Lcom/belkin/wemo/rules/db/RMResetDBRulesManager;-><init>(Ljava/lang/String;)V

    invoke-virtual {v9}, Lcom/belkin/wemo/rules/db/RMResetDBRulesManager;->resetDeviceRules()I

    move-result v7

    .line 70
    .local v7, "rulesModified":I
    iget-object v9, p0, Lcom/belkin/wemo/rules/runnable/RMResetDeviceRulesRunnable$RMFetchBeforeEditCallback;->this$0:Lcom/belkin/wemo/rules/runnable/RMResetDeviceRulesRunnable;

    invoke-static {v9}, Lcom/belkin/wemo/rules/runnable/RMResetDeviceRulesRunnable;->access$200(Lcom/belkin/wemo/rules/runnable/RMResetDeviceRulesRunnable;)Ljava/lang/String;

    move-result-object v9

    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    const-string v11, "Reset Device Rules: Numer rules modified = "

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10, v7}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v10

    const-string v11, "; UDN: "

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    iget-object v11, p0, Lcom/belkin/wemo/rules/runnable/RMResetDeviceRulesRunnable$RMFetchBeforeEditCallback;->this$0:Lcom/belkin/wemo/rules/runnable/RMResetDeviceRulesRunnable;

    invoke-static {v11}, Lcom/belkin/wemo/rules/runnable/RMResetDeviceRulesRunnable;->access$100(Lcom/belkin/wemo/rules/runnable/RMResetDeviceRulesRunnable;)Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-static {v9, v10}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->debugLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 71
    if-lez v7, :cond_1

    .line 72
    iget-object v9, p0, Lcom/belkin/wemo/rules/runnable/RMResetDeviceRulesRunnable$RMFetchBeforeEditCallback;->this$0:Lcom/belkin/wemo/rules/runnable/RMResetDeviceRulesRunnable;

    invoke-static {v9}, Lcom/belkin/wemo/rules/runnable/RMResetDeviceRulesRunnable;->access$300(Lcom/belkin/wemo/rules/runnable/RMResetDeviceRulesRunnable;)Ljava/lang/String;

    move-result-object v9

    const-string v10, "Reset Device Rules: RESETING DEVICE RULE ENTRIES FROM DB - COMPLETE. CALLING STORE RULES."

    invoke-static {v9, v10}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->debugLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 74
    invoke-static {}, Lcom/belkin/wemo/rules/RMRulesSDK;->instance()Lcom/belkin/wemo/rules/RMRulesSDK;

    move-result-object v9

    invoke-virtual {v9}, Lcom/belkin/wemo/rules/RMRulesSDK;->getDependencyProvider()Lcom/belkin/wemo/rules/RMIRulesDependencyProvider;

    move-result-object v9

    invoke-interface {v9}, Lcom/belkin/wemo/rules/RMIRulesDependencyProvider;->provideIRulesUtils()Lcom/belkin/wemo/rules/util/RMIRulesUtils;

    move-result-object v8

    .line 76
    .local v8, "rulesUtils":Lcom/belkin/wemo/rules/util/RMIRulesUtils;
    invoke-interface {v8}, Lcom/belkin/wemo/rules/util/RMIRulesUtils;->getDBFilePathWithNameInApp()Ljava/lang/String;

    move-result-object v4

    .line 77
    .local v4, "fileToZip":Ljava/lang/String;
    invoke-interface {v8}, Lcom/belkin/wemo/rules/util/RMIRulesUtils;->getZippedDBFilePathWithNameInApp()Ljava/lang/String;

    move-result-object v2

    .line 79
    .local v2, "dbZIPFileLoc":Ljava/lang/String;
    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v9

    if-nez v9, :cond_0

    .line 82
    :try_start_0
    invoke-interface {v8, v4, v2}, Lcom/belkin/wemo/rules/util/RMIRulesUtils;->createZipFileInApp(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 87
    :goto_0
    new-instance v6, Ljava/util/HashMap;

    invoke-direct {v6}, Ljava/util/HashMap;-><init>()V

    .line 88
    .local v6, "params":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    const-string v9, "db_zip_file"

    invoke-virtual {v6, v9, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 90
    invoke-static {}, Lcom/belkin/wemo/rules/RMRulesSDK;->instance()Lcom/belkin/wemo/rules/RMRulesSDK;

    move-result-object v9

    invoke-virtual {v9}, Lcom/belkin/wemo/rules/RMRulesSDK;->getDependencyProvider()Lcom/belkin/wemo/rules/RMIRulesDependencyProvider;

    move-result-object v9

    invoke-interface {v9}, Lcom/belkin/wemo/rules/RMIRulesDependencyProvider;->provideIRulesUtils()Lcom/belkin/wemo/rules/util/RMIRulesUtils;

    move-result-object v9

    invoke-interface {v9}, Lcom/belkin/wemo/rules/util/RMIRulesUtils;->getRulesDBVerion()Ljava/lang/String;

    move-result-object v1

    .line 91
    .local v1, "currentDBVersion":Ljava/lang/String;
    const-string v9, "new_db_version"

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/Integer;->intValue()I

    move-result v10

    add-int/lit8 v10, v10, 0x1

    invoke-static {v10}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v10

    invoke-virtual {v6, v9, v10}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 93
    const-string v9, "process_db"

    const/4 v10, 0x1

    invoke-static {v10}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v10

    invoke-virtual {v6, v9, v10}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 95
    new-instance v0, Lcom/belkin/wemo/rules/runnable/RMResetDeviceRulesRunnable$RMStoreRuleCallback;

    iget-object v9, p0, Lcom/belkin/wemo/rules/runnable/RMResetDeviceRulesRunnable$RMFetchBeforeEditCallback;->this$0:Lcom/belkin/wemo/rules/runnable/RMResetDeviceRulesRunnable;

    iget-object v10, p0, Lcom/belkin/wemo/rules/runnable/RMResetDeviceRulesRunnable$RMFetchBeforeEditCallback;->this$0:Lcom/belkin/wemo/rules/runnable/RMResetDeviceRulesRunnable;

    invoke-static {v10}, Lcom/belkin/wemo/rules/runnable/RMResetDeviceRulesRunnable;->access$500(Lcom/belkin/wemo/rules/runnable/RMResetDeviceRulesRunnable;)Lcom/belkin/wemo/rules/callback/RMResetDeviceRulesSuccessCallback;

    move-result-object v10

    iget-object v11, p0, Lcom/belkin/wemo/rules/runnable/RMResetDeviceRulesRunnable$RMFetchBeforeEditCallback;->this$0:Lcom/belkin/wemo/rules/runnable/RMResetDeviceRulesRunnable;

    invoke-static {v11}, Lcom/belkin/wemo/rules/runnable/RMResetDeviceRulesRunnable;->access$600(Lcom/belkin/wemo/rules/runnable/RMResetDeviceRulesRunnable;)Lcom/belkin/wemo/rules/callback/RMResetDeviceRulesErrorCallback;

    move-result-object v11

    invoke-direct {v0, v9, v10, v11}, Lcom/belkin/wemo/rules/runnable/RMResetDeviceRulesRunnable$RMStoreRuleCallback;-><init>(Lcom/belkin/wemo/rules/runnable/RMResetDeviceRulesRunnable;Lcom/belkin/wemo/rules/callback/RMResetDeviceRulesSuccessCallback;Lcom/belkin/wemo/rules/callback/RMResetDeviceRulesErrorCallback;)V

    .line 96
    .local v0, "callback":Lcom/belkin/wemo/rules/runnable/RMResetDeviceRulesRunnable$RMStoreRuleCallback;
    invoke-static {}, Lcom/belkin/wemo/rules/operation/impl/RMDBRulesOperationFactory;->getInstance()Lcom/belkin/wemo/rules/operation/RMIRulesOperation;

    move-result-object v5

    .line 97
    .local v5, "operation":Lcom/belkin/wemo/rules/operation/RMIRulesOperation;, "Lcom/belkin/wemo/rules/operation/RMIRulesOperation<Lcom/belkin/wemo/rules/data/RMDBRule;>;"
    if-eqz v5, :cond_0

    .line 98
    iget-object v9, p0, Lcom/belkin/wemo/rules/runnable/RMResetDeviceRulesRunnable$RMFetchBeforeEditCallback;->activeDeviceList:Ljava/util/List;

    invoke-interface {v5, v9, v6, v0, v0}, Lcom/belkin/wemo/rules/operation/RMIRulesOperation;->syncRules(Ljava/util/List;Ljava/util/HashMap;Lcom/belkin/wemo/rules/operation/callback/RMSyncRulesTypeSuccessCallback;Lcom/belkin/wemo/rules/operation/callback/RMSyncRulesTypeErrorCallback;)V

    .line 111
    .end local v0    # "callback":Lcom/belkin/wemo/rules/runnable/RMResetDeviceRulesRunnable$RMStoreRuleCallback;
    .end local v1    # "currentDBVersion":Ljava/lang/String;
    .end local v2    # "dbZIPFileLoc":Ljava/lang/String;
    .end local v4    # "fileToZip":Ljava/lang/String;
    .end local v5    # "operation":Lcom/belkin/wemo/rules/operation/RMIRulesOperation;, "Lcom/belkin/wemo/rules/operation/RMIRulesOperation<Lcom/belkin/wemo/rules/data/RMDBRule;>;"
    .end local v6    # "params":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    .end local v8    # "rulesUtils":Lcom/belkin/wemo/rules/util/RMIRulesUtils;
    :cond_0
    :goto_1
    return-void

    .line 83
    .restart local v2    # "dbZIPFileLoc":Ljava/lang/String;
    .restart local v4    # "fileToZip":Ljava/lang/String;
    .restart local v8    # "rulesUtils":Lcom/belkin/wemo/rules/util/RMIRulesUtils;
    :catch_0
    move-exception v3

    .line 84
    .local v3, "e":Ljava/io/IOException;
    iget-object v9, p0, Lcom/belkin/wemo/rules/runnable/RMResetDeviceRulesRunnable$RMFetchBeforeEditCallback;->this$0:Lcom/belkin/wemo/rules/runnable/RMResetDeviceRulesRunnable;

    invoke-static {v9}, Lcom/belkin/wemo/rules/runnable/RMResetDeviceRulesRunnable;->access$400(Lcom/belkin/wemo/rules/runnable/RMResetDeviceRulesRunnable;)Ljava/lang/String;

    move-result-object v9

    const-string v10, "Store Rules: Exception during zip for syncing devices with lower db version: "

    invoke-static {v9, v10, v3}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Exception;)V

    goto :goto_0

    .line 101
    .end local v2    # "dbZIPFileLoc":Ljava/lang/String;
    .end local v3    # "e":Ljava/io/IOException;
    .end local v4    # "fileToZip":Ljava/lang/String;
    .end local v8    # "rulesUtils":Lcom/belkin/wemo/rules/util/RMIRulesUtils;
    :cond_1
    if-nez v7, :cond_2

    .line 102
    iget-object v9, p0, Lcom/belkin/wemo/rules/runnable/RMResetDeviceRulesRunnable$RMFetchBeforeEditCallback;->this$0:Lcom/belkin/wemo/rules/runnable/RMResetDeviceRulesRunnable;

    invoke-static {v9}, Lcom/belkin/wemo/rules/runnable/RMResetDeviceRulesRunnable;->access$700(Lcom/belkin/wemo/rules/runnable/RMResetDeviceRulesRunnable;)Ljava/lang/String;

    move-result-object v9

    const-string v10, "Reset Device Rules: NO RULES FOUND FOR DEVICE. MOVING TO NEXT STEP."

    invoke-static {v9, v10}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->debugLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 103
    iget-object v9, p0, Lcom/belkin/wemo/rules/runnable/RMResetDeviceRulesRunnable$RMFetchBeforeEditCallback;->this$0:Lcom/belkin/wemo/rules/runnable/RMResetDeviceRulesRunnable;

    invoke-static {v9}, Lcom/belkin/wemo/rules/runnable/RMResetDeviceRulesRunnable;->access$500(Lcom/belkin/wemo/rules/runnable/RMResetDeviceRulesRunnable;)Lcom/belkin/wemo/rules/callback/RMResetDeviceRulesSuccessCallback;

    move-result-object v9

    if-eqz v9, :cond_0

    .line 104
    iget-object v9, p0, Lcom/belkin/wemo/rules/runnable/RMResetDeviceRulesRunnable$RMFetchBeforeEditCallback;->this$0:Lcom/belkin/wemo/rules/runnable/RMResetDeviceRulesRunnable;

    invoke-static {v9}, Lcom/belkin/wemo/rules/runnable/RMResetDeviceRulesRunnable;->access$500(Lcom/belkin/wemo/rules/runnable/RMResetDeviceRulesRunnable;)Lcom/belkin/wemo/rules/callback/RMResetDeviceRulesSuccessCallback;

    move-result-object v9

    iget-object v10, p0, Lcom/belkin/wemo/rules/runnable/RMResetDeviceRulesRunnable$RMFetchBeforeEditCallback;->this$0:Lcom/belkin/wemo/rules/runnable/RMResetDeviceRulesRunnable;

    invoke-static {v10}, Lcom/belkin/wemo/rules/runnable/RMResetDeviceRulesRunnable;->access$100(Lcom/belkin/wemo/rules/runnable/RMResetDeviceRulesRunnable;)Ljava/lang/String;

    move-result-object v10

    invoke-interface {v9, v10}, Lcom/belkin/wemo/rules/callback/RMResetDeviceRulesSuccessCallback;->onAllDeviceRulesReset(Ljava/lang/String;)V

    goto :goto_1

    .line 107
    :cond_2
    iget-object v9, p0, Lcom/belkin/wemo/rules/runnable/RMResetDeviceRulesRunnable$RMFetchBeforeEditCallback;->this$0:Lcom/belkin/wemo/rules/runnable/RMResetDeviceRulesRunnable;

    invoke-static {v9}, Lcom/belkin/wemo/rules/runnable/RMResetDeviceRulesRunnable;->access$600(Lcom/belkin/wemo/rules/runnable/RMResetDeviceRulesRunnable;)Lcom/belkin/wemo/rules/callback/RMResetDeviceRulesErrorCallback;

    move-result-object v9

    if-eqz v9, :cond_0

    .line 108
    iget-object v9, p0, Lcom/belkin/wemo/rules/runnable/RMResetDeviceRulesRunnable$RMFetchBeforeEditCallback;->this$0:Lcom/belkin/wemo/rules/runnable/RMResetDeviceRulesRunnable;

    invoke-static {v9}, Lcom/belkin/wemo/rules/runnable/RMResetDeviceRulesRunnable;->access$600(Lcom/belkin/wemo/rules/runnable/RMResetDeviceRulesRunnable;)Lcom/belkin/wemo/rules/callback/RMResetDeviceRulesErrorCallback;

    move-result-object v9

    new-instance v10, Lcom/belkin/wemo/rules/error/RMRulesError;

    const/4 v11, -0x1

    new-instance v12, Ljava/lang/StringBuilder;

    invoke-direct {v12}, Ljava/lang/StringBuilder;-><init>()V

    const-string v13, "Unable to delete rules for device: "

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    iget-object v13, p0, Lcom/belkin/wemo/rules/runnable/RMResetDeviceRulesRunnable$RMFetchBeforeEditCallback;->this$0:Lcom/belkin/wemo/rules/runnable/RMResetDeviceRulesRunnable;

    invoke-static {v13}, Lcom/belkin/wemo/rules/runnable/RMResetDeviceRulesRunnable;->access$100(Lcom/belkin/wemo/rules/runnable/RMResetDeviceRulesRunnable;)Ljava/lang/String;

    move-result-object v13

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v12

    invoke-direct {v10, v11, v12}, Lcom/belkin/wemo/rules/error/RMRulesError;-><init>(ILjava/lang/String;)V

    invoke-interface {v9, v10}, Lcom/belkin/wemo/rules/callback/RMResetDeviceRulesErrorCallback;->onError(Lcom/belkin/wemo/rules/error/RMRulesError;)V

    goto :goto_1
.end method
