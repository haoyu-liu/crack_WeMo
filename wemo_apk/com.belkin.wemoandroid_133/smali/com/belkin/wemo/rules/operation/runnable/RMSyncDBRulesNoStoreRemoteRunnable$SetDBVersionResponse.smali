.class Lcom/belkin/wemo/rules/operation/runnable/RMSyncDBRulesNoStoreRemoteRunnable$SetDBVersionResponse;
.super Ljava/lang/Object;
.source "RMSyncDBRulesNoStoreRemoteRunnable.java"

# interfaces
.implements Lcom/belkin/wemo/cache/cloud/listener/OnRequestCompleteListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/belkin/wemo/rules/operation/runnable/RMSyncDBRulesNoStoreRemoteRunnable;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "SetDBVersionResponse"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/belkin/wemo/rules/operation/runnable/RMSyncDBRulesNoStoreRemoteRunnable;


# direct methods
.method private constructor <init>(Lcom/belkin/wemo/rules/operation/runnable/RMSyncDBRulesNoStoreRemoteRunnable;)V
    .locals 0

    .prologue
    .line 67
    iput-object p1, p0, Lcom/belkin/wemo/rules/operation/runnable/RMSyncDBRulesNoStoreRemoteRunnable$SetDBVersionResponse;->this$0:Lcom/belkin/wemo/rules/operation/runnable/RMSyncDBRulesNoStoreRemoteRunnable;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/belkin/wemo/rules/operation/runnable/RMSyncDBRulesNoStoreRemoteRunnable;Lcom/belkin/wemo/rules/operation/runnable/RMSyncDBRulesNoStoreRemoteRunnable$1;)V
    .locals 0
    .param p1, "x0"    # Lcom/belkin/wemo/rules/operation/runnable/RMSyncDBRulesNoStoreRemoteRunnable;
    .param p2, "x1"    # Lcom/belkin/wemo/rules/operation/runnable/RMSyncDBRulesNoStoreRemoteRunnable$1;

    .prologue
    .line 67
    invoke-direct {p0, p1}, Lcom/belkin/wemo/rules/operation/runnable/RMSyncDBRulesNoStoreRemoteRunnable$SetDBVersionResponse;-><init>(Lcom/belkin/wemo/rules/operation/runnable/RMSyncDBRulesNoStoreRemoteRunnable;)V

    return-void
.end method


# virtual methods
.method public onRequestComplete(ZI[B)V
    .locals 4
    .param p1, "success"    # Z
    .param p2, "statusCode"    # I
    .param p3, "resp"    # [B

    .prologue
    const/4 v3, 0x1

    .line 72
    iget-object v0, p0, Lcom/belkin/wemo/rules/operation/runnable/RMSyncDBRulesNoStoreRemoteRunnable$SetDBVersionResponse;->this$0:Lcom/belkin/wemo/rules/operation/runnable/RMSyncDBRulesNoStoreRemoteRunnable;

    invoke-static {v0}, Lcom/belkin/wemo/rules/operation/runnable/RMSyncDBRulesNoStoreRemoteRunnable;->access$100(Lcom/belkin/wemo/rules/operation/runnable/RMSyncDBRulesNoStoreRemoteRunnable;)Ljava/lang/String;

    move-result-object v0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Store Rules (No Store): Set DB Version remote call response. status = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 73
    const/16 v0, 0xc8

    if-eq p2, v0, :cond_1

    .line 75
    iget-object v0, p0, Lcom/belkin/wemo/rules/operation/runnable/RMSyncDBRulesNoStoreRemoteRunnable$SetDBVersionResponse;->this$0:Lcom/belkin/wemo/rules/operation/runnable/RMSyncDBRulesNoStoreRemoteRunnable;

    iget-object v0, v0, Lcom/belkin/wemo/rules/operation/runnable/RMSyncDBRulesNoStoreRemoteRunnable;->errorCallback:Lcom/belkin/wemo/rules/operation/callback/RMStoreRulesRemoteErrorCallback;

    if-eqz v0, :cond_0

    .line 76
    iget-object v0, p0, Lcom/belkin/wemo/rules/operation/runnable/RMSyncDBRulesNoStoreRemoteRunnable$SetDBVersionResponse;->this$0:Lcom/belkin/wemo/rules/operation/runnable/RMSyncDBRulesNoStoreRemoteRunnable;

    iget-object v0, v0, Lcom/belkin/wemo/rules/operation/runnable/RMSyncDBRulesNoStoreRemoteRunnable;->errorCallback:Lcom/belkin/wemo/rules/operation/callback/RMStoreRulesRemoteErrorCallback;

    new-instance v1, Lcom/belkin/wemo/rules/error/RMRulesError;

    invoke-direct {v1}, Lcom/belkin/wemo/rules/error/RMRulesError;-><init>()V

    iget-object v2, p0, Lcom/belkin/wemo/rules/operation/runnable/RMSyncDBRulesNoStoreRemoteRunnable$SetDBVersionResponse;->this$0:Lcom/belkin/wemo/rules/operation/runnable/RMSyncDBRulesNoStoreRemoteRunnable;

    iget-object v2, v2, Lcom/belkin/wemo/rules/operation/runnable/RMSyncDBRulesNoStoreRemoteRunnable;->devicesList:Ljava/util/List;

    invoke-interface {v0, v1, v2, v3}, Lcom/belkin/wemo/rules/operation/callback/RMStoreRulesRemoteErrorCallback;->onError(Lcom/belkin/wemo/rules/error/RMRulesError;Ljava/util/List;I)V

    .line 84
    :cond_0
    :goto_0
    return-void

    .line 80
    :cond_1
    iget-object v0, p0, Lcom/belkin/wemo/rules/operation/runnable/RMSyncDBRulesNoStoreRemoteRunnable$SetDBVersionResponse;->this$0:Lcom/belkin/wemo/rules/operation/runnable/RMSyncDBRulesNoStoreRemoteRunnable;

    iget-object v0, v0, Lcom/belkin/wemo/rules/operation/runnable/RMSyncDBRulesNoStoreRemoteRunnable;->succesCallback:Lcom/belkin/wemo/rules/operation/callback/RMStoreRulesRemoteSuccessCallback;

    if-eqz v0, :cond_0

    .line 81
    iget-object v0, p0, Lcom/belkin/wemo/rules/operation/runnable/RMSyncDBRulesNoStoreRemoteRunnable$SetDBVersionResponse;->this$0:Lcom/belkin/wemo/rules/operation/runnable/RMSyncDBRulesNoStoreRemoteRunnable;

    iget-object v0, v0, Lcom/belkin/wemo/rules/operation/runnable/RMSyncDBRulesNoStoreRemoteRunnable;->succesCallback:Lcom/belkin/wemo/rules/operation/callback/RMStoreRulesRemoteSuccessCallback;

    iget-object v1, p0, Lcom/belkin/wemo/rules/operation/runnable/RMSyncDBRulesNoStoreRemoteRunnable$SetDBVersionResponse;->this$0:Lcom/belkin/wemo/rules/operation/runnable/RMSyncDBRulesNoStoreRemoteRunnable;

    iget-object v1, v1, Lcom/belkin/wemo/rules/operation/runnable/RMSyncDBRulesNoStoreRemoteRunnable;->devicesList:Ljava/util/List;

    invoke-interface {v0, v1, v3}, Lcom/belkin/wemo/rules/operation/callback/RMStoreRulesRemoteSuccessCallback;->onSuccess(Ljava/util/List;I)V

    goto :goto_0
.end method
