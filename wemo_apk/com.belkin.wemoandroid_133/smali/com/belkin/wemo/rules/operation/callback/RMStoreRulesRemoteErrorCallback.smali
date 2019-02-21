.class public interface abstract Lcom/belkin/wemo/rules/operation/callback/RMStoreRulesRemoteErrorCallback;
.super Ljava/lang/Object;
.source "RMStoreRulesRemoteErrorCallback.java"

# interfaces
.implements Lcom/belkin/wemo/rules/callback/RMWeMoRulesErrorCallback;


# virtual methods
.method public abstract onError(Lcom/belkin/wemo/rules/error/RMRulesError;Ljava/util/List;I)V
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/belkin/wemo/rules/error/RMRulesError;",
            "Ljava/util/List",
            "<",
            "Lcom/belkin/wemo/cache/data/DeviceInformation;",
            ">;I)V"
        }
    .end annotation
.end method
