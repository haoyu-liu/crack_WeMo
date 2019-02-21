.class public Lcom/belkin/wemo/rules/operation/impl/RMTNGRulesOperationFactory;
.super Ljava/lang/Object;
.source "RMTNGRulesOperationFactory.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 10
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static getInstance()Lcom/belkin/wemo/rules/operation/RMIRulesOperation;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/belkin/wemo/rules/operation/RMIRulesOperation",
            "<",
            "Lcom/belkin/wemo/rules/data/RMTNGRule;",
            ">;"
        }
    .end annotation

    .prologue
    .line 13
    const/4 v1, 0x0

    .line 14
    .local v1, "operation":Lcom/belkin/wemo/rules/operation/RMIRulesOperation;, "Lcom/belkin/wemo/rules/operation/RMIRulesOperation<Lcom/belkin/wemo/rules/data/RMTNGRule;>;"
    invoke-static {}, Lcom/belkin/wemo/rules/RMRulesSDK;->instance()Lcom/belkin/wemo/rules/RMRulesSDK;

    move-result-object v2

    .line 15
    .local v2, "sdk":Lcom/belkin/wemo/rules/RMRulesSDK;
    if-eqz v2, :cond_0

    .line 16
    invoke-virtual {v2}, Lcom/belkin/wemo/rules/RMRulesSDK;->getDependencyProvider()Lcom/belkin/wemo/rules/RMIRulesDependencyProvider;

    move-result-object v3

    invoke-interface {v3}, Lcom/belkin/wemo/rules/RMIRulesDependencyProvider;->provideNetworkUtils()Lcom/belkin/wemo/cache/utils/RMINetworkUtils;

    move-result-object v3

    invoke-interface {v3}, Lcom/belkin/wemo/cache/utils/RMINetworkUtils;->isLocal()Z

    move-result v0

    .line 17
    .local v0, "isLocal":Z
    if-eqz v0, :cond_1

    .line 18
    new-instance v1, Lcom/belkin/wemo/rules/operation/impl/RMTNGRulesLocalOperationImpl;

    .end local v1    # "operation":Lcom/belkin/wemo/rules/operation/RMIRulesOperation;, "Lcom/belkin/wemo/rules/operation/RMIRulesOperation<Lcom/belkin/wemo/rules/data/RMTNGRule;>;"
    invoke-direct {v1}, Lcom/belkin/wemo/rules/operation/impl/RMTNGRulesLocalOperationImpl;-><init>()V

    .line 23
    .end local v0    # "isLocal":Z
    .restart local v1    # "operation":Lcom/belkin/wemo/rules/operation/RMIRulesOperation;, "Lcom/belkin/wemo/rules/operation/RMIRulesOperation<Lcom/belkin/wemo/rules/data/RMTNGRule;>;"
    :cond_0
    :goto_0
    return-object v1

    .line 20
    .restart local v0    # "isLocal":Z
    :cond_1
    new-instance v1, Lcom/belkin/wemo/rules/operation/impl/RMTNGRulesRemoteOperationImpl;

    .end local v1    # "operation":Lcom/belkin/wemo/rules/operation/RMIRulesOperation;, "Lcom/belkin/wemo/rules/operation/RMIRulesOperation<Lcom/belkin/wemo/rules/data/RMTNGRule;>;"
    invoke-direct {v1}, Lcom/belkin/wemo/rules/operation/impl/RMTNGRulesRemoteOperationImpl;-><init>()V

    .restart local v1    # "operation":Lcom/belkin/wemo/rules/operation/RMIRulesOperation;, "Lcom/belkin/wemo/rules/operation/RMIRulesOperation<Lcom/belkin/wemo/rules/data/RMTNGRule;>;"
    goto :goto_0
.end method
