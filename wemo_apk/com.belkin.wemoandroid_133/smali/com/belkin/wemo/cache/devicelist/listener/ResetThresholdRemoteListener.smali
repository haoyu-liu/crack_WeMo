.class public Lcom/belkin/wemo/cache/devicelist/listener/ResetThresholdRemoteListener;
.super Ljava/lang/Object;
.source "ResetThresholdRemoteListener.java"

# interfaces
.implements Lcom/belkin/wemo/cache/cloud/AbstractCloudRequest$OnCloudRequestCompleted;


# instance fields
.field private errorCallback:Lcom/belkin/wemo/cache/devicelist/callback/PluginResultErrorCallback;

.field private newThreshold:Ljava/lang/String;

.field private successCallback:Lcom/belkin/wemo/cache/devicelist/callback/PluginResultSuccessCallback;


# direct methods
.method public constructor <init>(Lcom/belkin/wemo/cache/devicelist/callback/PluginResultErrorCallback;Lcom/belkin/wemo/cache/devicelist/callback/PluginResultSuccessCallback;Ljava/lang/String;)V
    .locals 0
    .param p1, "errorCallback"    # Lcom/belkin/wemo/cache/devicelist/callback/PluginResultErrorCallback;
    .param p2, "successCallback"    # Lcom/belkin/wemo/cache/devicelist/callback/PluginResultSuccessCallback;
    .param p3, "newThreshold"    # Ljava/lang/String;

    .prologue
    .line 13
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 14
    iput-object p1, p0, Lcom/belkin/wemo/cache/devicelist/listener/ResetThresholdRemoteListener;->errorCallback:Lcom/belkin/wemo/cache/devicelist/callback/PluginResultErrorCallback;

    .line 15
    iput-object p2, p0, Lcom/belkin/wemo/cache/devicelist/listener/ResetThresholdRemoteListener;->successCallback:Lcom/belkin/wemo/cache/devicelist/callback/PluginResultSuccessCallback;

    .line 16
    iput-object p3, p0, Lcom/belkin/wemo/cache/devicelist/listener/ResetThresholdRemoteListener;->newThreshold:Ljava/lang/String;

    .line 17
    return-void
.end method


# virtual methods
.method public onError(Ljava/lang/String;)V
    .locals 1
    .param p1, "error"    # Ljava/lang/String;

    .prologue
    .line 28
    iget-object v0, p0, Lcom/belkin/wemo/cache/devicelist/listener/ResetThresholdRemoteListener;->errorCallback:Lcom/belkin/wemo/cache/devicelist/callback/PluginResultErrorCallback;

    if-eqz v0, :cond_0

    .line 29
    iget-object v0, p0, Lcom/belkin/wemo/cache/devicelist/listener/ResetThresholdRemoteListener;->errorCallback:Lcom/belkin/wemo/cache/devicelist/callback/PluginResultErrorCallback;

    invoke-interface {v0, p1}, Lcom/belkin/wemo/cache/devicelist/callback/PluginResultErrorCallback;->onError(Ljava/lang/String;)V

    .line 31
    :cond_0
    return-void
.end method

.method public onSuccess()V
    .locals 2

    .prologue
    .line 21
    iget-object v0, p0, Lcom/belkin/wemo/cache/devicelist/listener/ResetThresholdRemoteListener;->successCallback:Lcom/belkin/wemo/cache/devicelist/callback/PluginResultSuccessCallback;

    if-eqz v0, :cond_0

    .line 22
    iget-object v0, p0, Lcom/belkin/wemo/cache/devicelist/listener/ResetThresholdRemoteListener;->successCallback:Lcom/belkin/wemo/cache/devicelist/callback/PluginResultSuccessCallback;

    iget-object v1, p0, Lcom/belkin/wemo/cache/devicelist/listener/ResetThresholdRemoteListener;->newThreshold:Ljava/lang/String;

    invoke-interface {v0, v1}, Lcom/belkin/wemo/cache/devicelist/callback/PluginResultSuccessCallback;->onSuccess(Ljava/lang/String;)V

    .line 24
    :cond_0
    return-void
.end method
