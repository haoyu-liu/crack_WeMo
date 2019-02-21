.class public Lcom/belkin/wemo/rules/operation/impl/RMDBRulesOperationFactory;
.super Ljava/lang/Object;
.source "RMDBRulesOperationFactory.java"


# static fields
.field private static final TAG:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 11
    const-class v0, Lcom/belkin/wemo/rules/operation/impl/RMDBRulesOperationFactory;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/belkin/wemo/rules/operation/impl/RMDBRulesOperationFactory;->TAG:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 9
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static getInstance()Lcom/belkin/wemo/rules/operation/RMIRulesOperation;
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/belkin/wemo/rules/operation/RMIRulesOperation",
            "<",
            "Lcom/belkin/wemo/rules/data/RMDBRule;",
            ">;"
        }
    .end annotation

    .prologue
    .line 14
    const/4 v1, 0x0

    .line 15
    .local v1, "operation":Lcom/belkin/wemo/rules/operation/RMIRulesOperation;, "Lcom/belkin/wemo/rules/operation/RMIRulesOperation<Lcom/belkin/wemo/rules/data/RMDBRule;>;"
    invoke-static {}, Lcom/belkin/wemo/rules/RMRulesSDK;->instance()Lcom/belkin/wemo/rules/RMRulesSDK;

    move-result-object v3

    .line 16
    .local v3, "sdk":Lcom/belkin/wemo/rules/RMRulesSDK;
    if-eqz v3, :cond_0

    .line 18
    invoke-virtual {v3}, Lcom/belkin/wemo/rules/RMRulesSDK;->getDependencyProvider()Lcom/belkin/wemo/rules/RMIRulesDependencyProvider;

    move-result-object v4

    invoke-interface {v4}, Lcom/belkin/wemo/rules/RMIRulesDependencyProvider;->provideNetworkUtils()Lcom/belkin/wemo/cache/utils/RMINetworkUtils;

    move-result-object v4

    invoke-interface {v4}, Lcom/belkin/wemo/cache/utils/RMINetworkUtils;->isLocal()Z

    move-result v0

    .line 19
    .local v0, "isLocal":Z
    sget-object v4, Lcom/belkin/wemo/rules/operation/impl/RMDBRulesOperationFactory;->TAG:Ljava/lang/String;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "Fetch Rules: Is network mode local: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->debugLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 21
    invoke-virtual {v3}, Lcom/belkin/wemo/rules/RMRulesSDK;->getDependencyProvider()Lcom/belkin/wemo/rules/RMIRulesDependencyProvider;

    move-result-object v4

    invoke-interface {v4}, Lcom/belkin/wemo/rules/RMIRulesDependencyProvider;->provideIRulesUtils()Lcom/belkin/wemo/rules/util/RMIRulesUtils;

    move-result-object v2

    .line 22
    .local v2, "rulesUtils":Lcom/belkin/wemo/rules/util/RMIRulesUtils;
    if-eqz v0, :cond_1

    .line 23
    new-instance v1, Lcom/belkin/wemo/rules/operation/impl/RMDBRulesLocalOperationImpl;

    .end local v1    # "operation":Lcom/belkin/wemo/rules/operation/RMIRulesOperation;, "Lcom/belkin/wemo/rules/operation/RMIRulesOperation<Lcom/belkin/wemo/rules/data/RMDBRule;>;"
    invoke-direct {v1, v2}, Lcom/belkin/wemo/rules/operation/impl/RMDBRulesLocalOperationImpl;-><init>(Lcom/belkin/wemo/rules/util/RMIRulesUtils;)V

    .line 28
    .end local v0    # "isLocal":Z
    .end local v2    # "rulesUtils":Lcom/belkin/wemo/rules/util/RMIRulesUtils;
    .restart local v1    # "operation":Lcom/belkin/wemo/rules/operation/RMIRulesOperation;, "Lcom/belkin/wemo/rules/operation/RMIRulesOperation<Lcom/belkin/wemo/rules/data/RMDBRule;>;"
    :cond_0
    :goto_0
    return-object v1

    .line 25
    .restart local v0    # "isLocal":Z
    .restart local v2    # "rulesUtils":Lcom/belkin/wemo/rules/util/RMIRulesUtils;
    :cond_1
    new-instance v1, Lcom/belkin/wemo/rules/operation/impl/RMDBRulesRemoteOperationImpl;

    .end local v1    # "operation":Lcom/belkin/wemo/rules/operation/RMIRulesOperation;, "Lcom/belkin/wemo/rules/operation/RMIRulesOperation<Lcom/belkin/wemo/rules/data/RMDBRule;>;"
    invoke-direct {v1, v2}, Lcom/belkin/wemo/rules/operation/impl/RMDBRulesRemoteOperationImpl;-><init>(Lcom/belkin/wemo/rules/util/RMIRulesUtils;)V

    .restart local v1    # "operation":Lcom/belkin/wemo/rules/operation/RMIRulesOperation;, "Lcom/belkin/wemo/rules/operation/RMIRulesOperation<Lcom/belkin/wemo/rules/data/RMDBRule;>;"
    goto :goto_0
.end method
