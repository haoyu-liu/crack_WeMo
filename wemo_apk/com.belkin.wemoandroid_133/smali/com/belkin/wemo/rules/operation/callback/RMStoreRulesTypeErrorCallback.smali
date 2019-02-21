.class public interface abstract Lcom/belkin/wemo/rules/operation/callback/RMStoreRulesTypeErrorCallback;
.super Ljava/lang/Object;
.source "RMStoreRulesTypeErrorCallback.java"

# interfaces
.implements Lcom/belkin/wemo/rules/callback/RMWeMoRulesErrorCallback;


# virtual methods
.method public abstract onSingleTypeRulesStoreError(Lcom/belkin/wemo/rules/error/RMRulesTypeError;)V
.end method

.method public abstract onSingleTypeStoreFailed(ILjava/util/List;)V
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
