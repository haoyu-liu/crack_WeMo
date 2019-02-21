.class public interface abstract Lcom/belkin/wemo/rules/IWeMoRules;
.super Ljava/lang/Object;
.source "IWeMoRules.java"


# virtual methods
.method public abstract fetchRules(Landroid/content/Context;Lcom/belkin/wemo/rules/callback/FetchRulesSuccessCallback;Lcom/belkin/wemo/rules/callback/FetchRulesErrorCallback;)V
.end method

.method public abstract fetchRulesAndSyncDevices(Landroid/content/Context;Lcom/belkin/wemo/rules/callback/FetchRulesAndSyncSuccessCallback;Lcom/belkin/wemo/rules/callback/FetchRulesAndSyncErrorCallback;)V
.end method

.method public abstract storeRules(Landroid/content/Context;Ljava/util/HashMap;Lcom/belkin/wemo/rules/callback/StoreRulesSuccessCallback;Lcom/belkin/wemo/rules/callback/StoreRulesErrorCallback;)V
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "[",
            "Ljava/lang/String;",
            ">;",
            "Lcom/belkin/wemo/rules/callback/StoreRulesSuccessCallback;",
            "Lcom/belkin/wemo/rules/callback/StoreRulesErrorCallback;",
            ")V"
        }
    .end annotation
.end method
