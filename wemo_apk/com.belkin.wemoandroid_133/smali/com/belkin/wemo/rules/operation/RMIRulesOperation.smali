.class public interface abstract Lcom/belkin/wemo/rules/operation/RMIRulesOperation;
.super Ljava/lang/Object;
.source "RMIRulesOperation.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Lcom/belkin/wemo/rules/data/RMRule;",
        ">",
        "Ljava/lang/Object;"
    }
.end annotation


# static fields
.field public static final FW_VER_NO_STORE_SUPPORT_CODE:I = 0x1

.field public static final FW_VER_STORE_SUPPORT_CODE:I = 0x2


# virtual methods
.method public abstract fetchRules(Ljava/util/List;Lcom/belkin/wemo/rules/operation/callback/RMFetchRulesTypeSuccessCallback;Lcom/belkin/wemo/rules/operation/callback/RMFetchRulesTypeErrorCallback;)V
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lcom/belkin/wemo/cache/data/DeviceInformation;",
            ">;",
            "Lcom/belkin/wemo/rules/operation/callback/RMFetchRulesTypeSuccessCallback;",
            "Lcom/belkin/wemo/rules/operation/callback/RMFetchRulesTypeErrorCallback;",
            ")V"
        }
    .end annotation
.end method

.method public abstract storeRules(Ljava/util/List;Lcom/belkin/wemo/rules/data/RMRule;Ljava/util/HashMap;Lcom/belkin/wemo/rules/operation/callback/RMStoreRulesTypeSuccessCallback;Lcom/belkin/wemo/rules/operation/callback/RMStoreRulesTypeErrorCallback;)V
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lcom/belkin/wemo/cache/data/DeviceInformation;",
            ">;TT;",
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;",
            "Lcom/belkin/wemo/rules/operation/callback/RMStoreRulesTypeSuccessCallback;",
            "Lcom/belkin/wemo/rules/operation/callback/RMStoreRulesTypeErrorCallback;",
            ")V"
        }
    .end annotation
.end method

.method public abstract syncRules(Ljava/util/List;Ljava/util/HashMap;Lcom/belkin/wemo/rules/operation/callback/RMSyncRulesTypeSuccessCallback;Lcom/belkin/wemo/rules/operation/callback/RMSyncRulesTypeErrorCallback;)V
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lcom/belkin/wemo/cache/data/DeviceInformation;",
            ">;",
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;",
            "Lcom/belkin/wemo/rules/operation/callback/RMSyncRulesTypeSuccessCallback;",
            "Lcom/belkin/wemo/rules/operation/callback/RMSyncRulesTypeErrorCallback;",
            ")V"
        }
    .end annotation
.end method
