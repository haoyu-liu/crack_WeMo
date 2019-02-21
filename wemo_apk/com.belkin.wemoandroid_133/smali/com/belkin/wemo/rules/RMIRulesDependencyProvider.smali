.class public interface abstract Lcom/belkin/wemo/rules/RMIRulesDependencyProvider;
.super Ljava/lang/Object;
.source "RMIRulesDependencyProvider.java"


# virtual methods
.method public abstract cleanUp()V
.end method

.method public abstract provideIRulesUtils()Lcom/belkin/wemo/rules/util/RMIRulesUtils;
.end method

.method public abstract provideNetworkUtils()Lcom/belkin/wemo/cache/utils/RMINetworkUtils;
.end method

.method public abstract provideRulesUpdateBroadcast()Lcom/belkin/wemo/rules/db/broadcast/RMIRulesUpdatedBroadcaster;
.end method
