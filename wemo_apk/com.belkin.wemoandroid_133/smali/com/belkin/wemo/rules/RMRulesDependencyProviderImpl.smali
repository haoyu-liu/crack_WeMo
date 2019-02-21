.class public Lcom/belkin/wemo/rules/RMRulesDependencyProviderImpl;
.super Ljava/lang/Object;
.source "RMRulesDependencyProviderImpl.java"

# interfaces
.implements Lcom/belkin/wemo/rules/RMIRulesDependencyProvider;


# instance fields
.field protected networkUtils:Lcom/belkin/wemo/cache/utils/RMINetworkUtils;

.field protected rulesUpdateBroadcaster:Lcom/belkin/wemo/rules/db/broadcast/RMIRulesUpdatedBroadcaster;

.field protected rulesUtils:Lcom/belkin/wemo/rules/util/RMIRulesUtils;


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 16
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 17
    invoke-virtual {p0}, Lcom/belkin/wemo/rules/RMRulesDependencyProviderImpl;->createRulesUtils()Lcom/belkin/wemo/rules/util/RMIRulesUtils;

    move-result-object v0

    iput-object v0, p0, Lcom/belkin/wemo/rules/RMRulesDependencyProviderImpl;->rulesUtils:Lcom/belkin/wemo/rules/util/RMIRulesUtils;

    .line 18
    invoke-virtual {p0}, Lcom/belkin/wemo/rules/RMRulesDependencyProviderImpl;->createNetworkUtils()Lcom/belkin/wemo/cache/utils/RMINetworkUtils;

    move-result-object v0

    iput-object v0, p0, Lcom/belkin/wemo/rules/RMRulesDependencyProviderImpl;->networkUtils:Lcom/belkin/wemo/cache/utils/RMINetworkUtils;

    .line 19
    invoke-virtual {p0}, Lcom/belkin/wemo/rules/RMRulesDependencyProviderImpl;->createRulesUpdateBroadcaster()Lcom/belkin/wemo/rules/db/broadcast/RMIRulesUpdatedBroadcaster;

    move-result-object v0

    iput-object v0, p0, Lcom/belkin/wemo/rules/RMRulesDependencyProviderImpl;->rulesUpdateBroadcaster:Lcom/belkin/wemo/rules/db/broadcast/RMIRulesUpdatedBroadcaster;

    .line 20
    return-void
.end method


# virtual methods
.method public cleanUp()V
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 41
    iput-object v1, p0, Lcom/belkin/wemo/rules/RMRulesDependencyProviderImpl;->rulesUtils:Lcom/belkin/wemo/rules/util/RMIRulesUtils;

    .line 42
    iput-object v1, p0, Lcom/belkin/wemo/rules/RMRulesDependencyProviderImpl;->networkUtils:Lcom/belkin/wemo/cache/utils/RMINetworkUtils;

    .line 43
    iget-object v0, p0, Lcom/belkin/wemo/rules/RMRulesDependencyProviderImpl;->rulesUpdateBroadcaster:Lcom/belkin/wemo/rules/db/broadcast/RMIRulesUpdatedBroadcaster;

    if-eqz v0, :cond_0

    .line 44
    iget-object v0, p0, Lcom/belkin/wemo/rules/RMRulesDependencyProviderImpl;->rulesUpdateBroadcaster:Lcom/belkin/wemo/rules/db/broadcast/RMIRulesUpdatedBroadcaster;

    invoke-interface {v0}, Lcom/belkin/wemo/rules/db/broadcast/RMIRulesUpdatedBroadcaster;->unregisterAllOnRulesUpdatedListeners()V

    .line 45
    iput-object v1, p0, Lcom/belkin/wemo/rules/RMRulesDependencyProviderImpl;->rulesUpdateBroadcaster:Lcom/belkin/wemo/rules/db/broadcast/RMIRulesUpdatedBroadcaster;

    .line 47
    :cond_0
    return-void
.end method

.method protected createNetworkUtils()Lcom/belkin/wemo/cache/utils/RMINetworkUtils;
    .locals 1

    .prologue
    .line 27
    new-instance v0, Lcom/belkin/wemo/cache/utils/RMNetworkUtilsImpl;

    invoke-direct {v0}, Lcom/belkin/wemo/cache/utils/RMNetworkUtilsImpl;-><init>()V

    return-object v0
.end method

.method protected createRulesUpdateBroadcaster()Lcom/belkin/wemo/rules/db/broadcast/RMIRulesUpdatedBroadcaster;
    .locals 1

    .prologue
    .line 31
    new-instance v0, Lcom/belkin/wemo/rules/db/broadcast/impl/RMRulesUpdatedBroadcastImpl;

    invoke-direct {v0}, Lcom/belkin/wemo/rules/db/broadcast/impl/RMRulesUpdatedBroadcastImpl;-><init>()V

    return-object v0
.end method

.method protected createRulesUtils()Lcom/belkin/wemo/rules/util/RMIRulesUtils;
    .locals 1

    .prologue
    .line 23
    new-instance v0, Lcom/belkin/wemo/rules/util/impl/RMRulesUtilsImpl;

    invoke-direct {v0}, Lcom/belkin/wemo/rules/util/impl/RMRulesUtilsImpl;-><init>()V

    return-object v0
.end method

.method public provideIRulesUtils()Lcom/belkin/wemo/rules/util/RMIRulesUtils;
    .locals 1

    .prologue
    .line 36
    iget-object v0, p0, Lcom/belkin/wemo/rules/RMRulesDependencyProviderImpl;->rulesUtils:Lcom/belkin/wemo/rules/util/RMIRulesUtils;

    return-object v0
.end method

.method public provideNetworkUtils()Lcom/belkin/wemo/cache/utils/RMINetworkUtils;
    .locals 1

    .prologue
    .line 51
    iget-object v0, p0, Lcom/belkin/wemo/rules/RMRulesDependencyProviderImpl;->networkUtils:Lcom/belkin/wemo/cache/utils/RMINetworkUtils;

    return-object v0
.end method

.method public provideRulesUpdateBroadcast()Lcom/belkin/wemo/rules/db/broadcast/RMIRulesUpdatedBroadcaster;
    .locals 1

    .prologue
    .line 56
    iget-object v0, p0, Lcom/belkin/wemo/rules/RMRulesDependencyProviderImpl;->rulesUpdateBroadcaster:Lcom/belkin/wemo/rules/db/broadcast/RMIRulesUpdatedBroadcaster;

    return-object v0
.end method
