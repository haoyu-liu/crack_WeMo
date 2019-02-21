.class public interface abstract Lcom/belkin/wemo/rules/operation/callback/RMSyncRulesTypeErrorCallback;
.super Ljava/lang/Object;
.source "RMSyncRulesTypeErrorCallback.java"

# interfaces
.implements Lcom/belkin/wemo/rules/callback/RMWeMoRulesErrorCallback;


# virtual methods
.method public abstract onError(Lcom/belkin/wemo/rules/error/RMRulesTypeError;)V
.end method

.method public abstract onSingleTypeRulesSyncError(ILjava/util/List;)V
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation
.end method
