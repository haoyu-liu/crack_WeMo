.class public interface abstract Lcom/belkin/wemo/rules/operation/callback/RMStoreRulesRemoteSuccessCallback;
.super Ljava/lang/Object;
.source "RMStoreRulesRemoteSuccessCallback.java"

# interfaces
.implements Lcom/belkin/wemo/rules/callback/RMWeMoRulesSuccessCallback;


# virtual methods
.method public abstract onSuccess(Ljava/util/List;I)V
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lcom/belkin/wemo/cache/data/DeviceInformation;",
            ">;I)V"
        }
    .end annotation
.end method
