.class public Lcom/belkin/wemo/rules/operation/download/impl/RMRulesDBDownloadFactory;
.super Ljava/lang/Object;
.source "RMRulesDBDownloadFactory.java"


# direct methods
.method private constructor <init>()V
    .locals 0

    .prologue
    .line 9
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 11
    return-void
.end method

.method public static getRulesDBDownloaderInstance()Lcom/belkin/wemo/rules/operation/download/RMIRulesDBDownloader;
    .locals 4

    .prologue
    .line 14
    const/4 v0, 0x0

    .line 15
    .local v0, "downloader":Lcom/belkin/wemo/rules/operation/download/RMIRulesDBDownloader;
    invoke-static {}, Lcom/belkin/wemo/rules/RMRulesSDK;->instance()Lcom/belkin/wemo/rules/RMRulesSDK;

    move-result-object v2

    .line 16
    .local v2, "sdk":Lcom/belkin/wemo/rules/RMRulesSDK;
    if-eqz v2, :cond_0

    .line 17
    invoke-virtual {v2}, Lcom/belkin/wemo/rules/RMRulesSDK;->getDependencyProvider()Lcom/belkin/wemo/rules/RMIRulesDependencyProvider;

    move-result-object v3

    invoke-interface {v3}, Lcom/belkin/wemo/rules/RMIRulesDependencyProvider;->provideIRulesUtils()Lcom/belkin/wemo/rules/util/RMIRulesUtils;

    move-result-object v1

    .line 18
    .local v1, "rulesUtils":Lcom/belkin/wemo/rules/util/RMIRulesUtils;
    invoke-virtual {v2}, Lcom/belkin/wemo/rules/RMRulesSDK;->getDependencyProvider()Lcom/belkin/wemo/rules/RMIRulesDependencyProvider;

    move-result-object v3

    invoke-interface {v3}, Lcom/belkin/wemo/rules/RMIRulesDependencyProvider;->provideNetworkUtils()Lcom/belkin/wemo/cache/utils/RMINetworkUtils;

    move-result-object v3

    invoke-interface {v3}, Lcom/belkin/wemo/cache/utils/RMINetworkUtils;->isLocal()Z

    move-result v3

    if-eqz v3, :cond_1

    .line 19
    new-instance v0, Lcom/belkin/wemo/rules/operation/download/impl/RMRulesDBDownloadLocalImpl;

    .end local v0    # "downloader":Lcom/belkin/wemo/rules/operation/download/RMIRulesDBDownloader;
    invoke-direct {v0, v1}, Lcom/belkin/wemo/rules/operation/download/impl/RMRulesDBDownloadLocalImpl;-><init>(Lcom/belkin/wemo/rules/util/RMIRulesUtils;)V

    .line 23
    .restart local v0    # "downloader":Lcom/belkin/wemo/rules/operation/download/RMIRulesDBDownloader;
    :goto_0
    const/4 v1, 0x0

    .line 24
    const/4 v2, 0x0

    .line 26
    .end local v1    # "rulesUtils":Lcom/belkin/wemo/rules/util/RMIRulesUtils;
    :cond_0
    return-object v0

    .line 21
    .restart local v1    # "rulesUtils":Lcom/belkin/wemo/rules/util/RMIRulesUtils;
    :cond_1
    new-instance v0, Lcom/belkin/wemo/rules/operation/download/impl/RMRulesDBDownloadRemoteImpl;

    .end local v0    # "downloader":Lcom/belkin/wemo/rules/operation/download/RMIRulesDBDownloader;
    invoke-direct {v0, v1}, Lcom/belkin/wemo/rules/operation/download/impl/RMRulesDBDownloadRemoteImpl;-><init>(Lcom/belkin/wemo/rules/util/RMIRulesUtils;)V

    .restart local v0    # "downloader":Lcom/belkin/wemo/rules/operation/download/RMIRulesDBDownloader;
    goto :goto_0
.end method
