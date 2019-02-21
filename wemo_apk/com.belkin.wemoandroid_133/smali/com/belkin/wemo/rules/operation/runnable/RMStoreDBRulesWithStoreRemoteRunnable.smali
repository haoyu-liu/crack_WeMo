.class public Lcom/belkin/wemo/rules/operation/runnable/RMStoreDBRulesWithStoreRemoteRunnable;
.super Lcom/belkin/wemo/rules/operation/runnable/RMSyncDBRulesWithStoreRemoteRunnable;
.source "RMStoreDBRulesWithStoreRemoteRunnable.java"


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
    .line 21
    .local p3, "devicesList":Ljava/util/List;, "Ljava/util/List<Lcom/belkin/wemo/cache/data/DeviceInformation;>;"
    .local p5, "params":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    invoke-direct/range {p0 .. p6}, Lcom/belkin/wemo/rules/operation/runnable/RMSyncDBRulesWithStoreRemoteRunnable;-><init>(Lcom/belkin/wemo/rules/operation/callback/RMStoreRulesRemoteErrorCallback;Lcom/belkin/wemo/rules/operation/callback/RMStoreRulesRemoteSuccessCallback;Ljava/util/List;Lcom/belkin/wemo/rules/data/RMDBRule;Ljava/util/HashMap;Lcom/belkin/wemo/rules/util/RMIRulesUtils;)V

    .line 22
    return-void
.end method


# virtual methods
.method protected getProcessDBValue(Lcom/belkin/wemo/rules/data/RMDBRule;Ljava/lang/String;)Ljava/lang/String;
    .locals 2
    .param p1, "rule"    # Lcom/belkin/wemo/rules/data/RMDBRule;
    .param p2, "deviceUdn"    # Ljava/lang/String;

    .prologue
    .line 26
    const-string v0, "0"

    .line 28
    .local v0, "processDB":Ljava/lang/String;
    if-eqz p1, :cond_0

    .line 29
    sget-object v1, Lcom/belkin/wemo/rules/data/RMUserRules;->INSTANCE:Lcom/belkin/wemo/rules/data/RMUserRules;

    invoke-virtual {v1, p1, p2}, Lcom/belkin/wemo/rules/data/RMUserRules;->isProcessDBRequired(Lcom/belkin/wemo/rules/data/RMDBRule;Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_1

    const-string v0, "1"

    .line 31
    :cond_0
    :goto_0
    return-object v0

    .line 29
    :cond_1
    const-string v0, "0"

    goto :goto_0
.end method
