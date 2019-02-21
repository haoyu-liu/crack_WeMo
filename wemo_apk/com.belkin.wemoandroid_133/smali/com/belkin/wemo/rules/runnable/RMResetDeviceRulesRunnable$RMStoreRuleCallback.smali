.class Lcom/belkin/wemo/rules/runnable/RMResetDeviceRulesRunnable$RMStoreRuleCallback;
.super Ljava/lang/Object;
.source "RMResetDeviceRulesRunnable.java"

# interfaces
.implements Lcom/belkin/wemo/rules/operation/callback/RMSyncRulesTypeSuccessCallback;
.implements Lcom/belkin/wemo/rules/operation/callback/RMSyncRulesTypeErrorCallback;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/belkin/wemo/rules/runnable/RMResetDeviceRulesRunnable;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "RMStoreRuleCallback"
.end annotation


# instance fields
.field private errorCallback:Lcom/belkin/wemo/rules/callback/RMResetDeviceRulesErrorCallback;

.field private successCallback:Lcom/belkin/wemo/rules/callback/RMResetDeviceRulesSuccessCallback;

.field final synthetic this$0:Lcom/belkin/wemo/rules/runnable/RMResetDeviceRulesRunnable;


# direct methods
.method public constructor <init>(Lcom/belkin/wemo/rules/runnable/RMResetDeviceRulesRunnable;Lcom/belkin/wemo/rules/callback/RMResetDeviceRulesSuccessCallback;Lcom/belkin/wemo/rules/callback/RMResetDeviceRulesErrorCallback;)V
    .locals 0
    .param p2, "successCallback"    # Lcom/belkin/wemo/rules/callback/RMResetDeviceRulesSuccessCallback;
    .param p3, "errorCallback"    # Lcom/belkin/wemo/rules/callback/RMResetDeviceRulesErrorCallback;

    .prologue
    .line 127
    iput-object p1, p0, Lcom/belkin/wemo/rules/runnable/RMResetDeviceRulesRunnable$RMStoreRuleCallback;->this$0:Lcom/belkin/wemo/rules/runnable/RMResetDeviceRulesRunnable;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 128
    iput-object p2, p0, Lcom/belkin/wemo/rules/runnable/RMResetDeviceRulesRunnable$RMStoreRuleCallback;->successCallback:Lcom/belkin/wemo/rules/callback/RMResetDeviceRulesSuccessCallback;

    .line 129
    iput-object p3, p0, Lcom/belkin/wemo/rules/runnable/RMResetDeviceRulesRunnable$RMStoreRuleCallback;->errorCallback:Lcom/belkin/wemo/rules/callback/RMResetDeviceRulesErrorCallback;

    .line 130
    return-void
.end method


# virtual methods
.method public onError(Lcom/belkin/wemo/rules/error/RMRulesTypeError;)V
    .locals 4
    .param p1, "error"    # Lcom/belkin/wemo/rules/error/RMRulesTypeError;

    .prologue
    .line 134
    iget-object v0, p0, Lcom/belkin/wemo/rules/runnable/RMResetDeviceRulesRunnable$RMStoreRuleCallback;->errorCallback:Lcom/belkin/wemo/rules/callback/RMResetDeviceRulesErrorCallback;

    if-eqz v0, :cond_0

    .line 135
    iget-object v0, p0, Lcom/belkin/wemo/rules/runnable/RMResetDeviceRulesRunnable$RMStoreRuleCallback;->errorCallback:Lcom/belkin/wemo/rules/callback/RMResetDeviceRulesErrorCallback;

    new-instance v1, Lcom/belkin/wemo/rules/error/RMRulesError;

    invoke-virtual {p1}, Lcom/belkin/wemo/rules/error/RMRulesTypeError;->getErrorCode()I

    move-result v2

    invoke-virtual {p1}, Lcom/belkin/wemo/rules/error/RMRulesTypeError;->getErrorMessage()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v1, v2, v3}, Lcom/belkin/wemo/rules/error/RMRulesError;-><init>(ILjava/lang/String;)V

    invoke-interface {v0, v1}, Lcom/belkin/wemo/rules/callback/RMResetDeviceRulesErrorCallback;->onError(Lcom/belkin/wemo/rules/error/RMRulesError;)V

    .line 137
    :cond_0
    return-void
.end method

.method public onSingleTypeRulesSyncError(ILjava/util/List;)V
    .locals 2
    .param p1, "RulesType"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 142
    .local p2, "syncFailedDeviceUDNsList":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    iget-object v0, p0, Lcom/belkin/wemo/rules/runnable/RMResetDeviceRulesRunnable$RMStoreRuleCallback;->errorCallback:Lcom/belkin/wemo/rules/callback/RMResetDeviceRulesErrorCallback;

    if-eqz v0, :cond_0

    .line 143
    iget-object v0, p0, Lcom/belkin/wemo/rules/runnable/RMResetDeviceRulesRunnable$RMStoreRuleCallback;->errorCallback:Lcom/belkin/wemo/rules/callback/RMResetDeviceRulesErrorCallback;

    new-instance v1, Lcom/belkin/wemo/rules/error/RMRulesError;

    invoke-direct {v1}, Lcom/belkin/wemo/rules/error/RMRulesError;-><init>()V

    invoke-interface {v0, v1}, Lcom/belkin/wemo/rules/callback/RMResetDeviceRulesErrorCallback;->onError(Lcom/belkin/wemo/rules/error/RMRulesError;)V

    .line 145
    :cond_0
    return-void
.end method

.method public onSingleTypeRulesSynced(I)V
    .locals 2
    .param p1, "rulesType"    # I

    .prologue
    .line 149
    iget-object v0, p0, Lcom/belkin/wemo/rules/runnable/RMResetDeviceRulesRunnable$RMStoreRuleCallback;->this$0:Lcom/belkin/wemo/rules/runnable/RMResetDeviceRulesRunnable;

    invoke-static {v0}, Lcom/belkin/wemo/rules/runnable/RMResetDeviceRulesRunnable;->access$800(Lcom/belkin/wemo/rules/runnable/RMResetDeviceRulesRunnable;)Ljava/lang/String;

    move-result-object v0

    const-string v1, "Reset Device Rules: STORE RULES COMPLETE - SENDNING RESPONSE TO CALLBACK, IF AVAILABLE."

    invoke-static {v0, v1}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->debugLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 150
    iget-object v0, p0, Lcom/belkin/wemo/rules/runnable/RMResetDeviceRulesRunnable$RMStoreRuleCallback;->successCallback:Lcom/belkin/wemo/rules/callback/RMResetDeviceRulesSuccessCallback;

    if-eqz v0, :cond_0

    .line 151
    iget-object v0, p0, Lcom/belkin/wemo/rules/runnable/RMResetDeviceRulesRunnable$RMStoreRuleCallback;->successCallback:Lcom/belkin/wemo/rules/callback/RMResetDeviceRulesSuccessCallback;

    iget-object v1, p0, Lcom/belkin/wemo/rules/runnable/RMResetDeviceRulesRunnable$RMStoreRuleCallback;->this$0:Lcom/belkin/wemo/rules/runnable/RMResetDeviceRulesRunnable;

    invoke-static {v1}, Lcom/belkin/wemo/rules/runnable/RMResetDeviceRulesRunnable;->access$100(Lcom/belkin/wemo/rules/runnable/RMResetDeviceRulesRunnable;)Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1}, Lcom/belkin/wemo/rules/callback/RMResetDeviceRulesSuccessCallback;->onAllDeviceRulesReset(Ljava/lang/String;)V

    .line 153
    :cond_0
    return-void
.end method
