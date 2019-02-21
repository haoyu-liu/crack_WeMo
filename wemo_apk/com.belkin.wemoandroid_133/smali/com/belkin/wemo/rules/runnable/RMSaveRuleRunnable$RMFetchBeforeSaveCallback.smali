.class Lcom/belkin/wemo/rules/runnable/RMSaveRuleRunnable$RMFetchBeforeSaveCallback;
.super Ljava/lang/Object;
.source "RMSaveRuleRunnable.java"

# interfaces
.implements Lcom/belkin/wemo/rules/callback/RMShowRulesErrorCallback;
.implements Lcom/belkin/wemo/rules/callback/RMShowRulesSuccessCallback;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/belkin/wemo/rules/runnable/RMSaveRuleRunnable;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "RMFetchBeforeSaveCallback"
.end annotation


# instance fields
.field private activeDeviceList:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lcom/belkin/wemo/cache/data/DeviceInformation;",
            ">;"
        }
    .end annotation
.end field

.field final synthetic this$0:Lcom/belkin/wemo/rules/runnable/RMSaveRuleRunnable;


# direct methods
.method public constructor <init>(Lcom/belkin/wemo/rules/runnable/RMSaveRuleRunnable;Ljava/util/List;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lcom/belkin/wemo/cache/data/DeviceInformation;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 56
    .local p2, "activeDeviceList":Ljava/util/List;, "Ljava/util/List<Lcom/belkin/wemo/cache/data/DeviceInformation;>;"
    iput-object p1, p0, Lcom/belkin/wemo/rules/runnable/RMSaveRuleRunnable$RMFetchBeforeSaveCallback;->this$0:Lcom/belkin/wemo/rules/runnable/RMSaveRuleRunnable;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 57
    iput-object p2, p0, Lcom/belkin/wemo/rules/runnable/RMSaveRuleRunnable$RMFetchBeforeSaveCallback;->activeDeviceList:Ljava/util/List;

    .line 58
    return-void
.end method


# virtual methods
.method public onError(Lcom/belkin/wemo/rules/error/RMRulesError;)V
    .locals 4
    .param p1, "error"    # Lcom/belkin/wemo/rules/error/RMRulesError;

    .prologue
    .line 70
    iget-object v0, p0, Lcom/belkin/wemo/rules/runnable/RMSaveRuleRunnable$RMFetchBeforeSaveCallback;->this$0:Lcom/belkin/wemo/rules/runnable/RMSaveRuleRunnable;

    invoke-static {v0}, Lcom/belkin/wemo/rules/runnable/RMSaveRuleRunnable;->access$400(Lcom/belkin/wemo/rules/runnable/RMSaveRuleRunnable;)Ljava/lang/String;

    move-result-object v0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Fetch before Store ERROR. Code: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p1}, Lcom/belkin/wemo/rules/error/RMRulesError;->getErrorCode()I

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "; Message: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p1}, Lcom/belkin/wemo/rules/error/RMRulesError;->getErrorMessage()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->debugLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 71
    iget-object v0, p0, Lcom/belkin/wemo/rules/runnable/RMSaveRuleRunnable$RMFetchBeforeSaveCallback;->this$0:Lcom/belkin/wemo/rules/runnable/RMSaveRuleRunnable;

    invoke-static {v0}, Lcom/belkin/wemo/rules/runnable/RMSaveRuleRunnable;->access$300(Lcom/belkin/wemo/rules/runnable/RMSaveRuleRunnable;)Lcom/belkin/wemo/rules/callback/RMSaveRuleErrorCallback;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 72
    iget-object v0, p0, Lcom/belkin/wemo/rules/runnable/RMSaveRuleRunnable$RMFetchBeforeSaveCallback;->this$0:Lcom/belkin/wemo/rules/runnable/RMSaveRuleRunnable;

    invoke-static {v0}, Lcom/belkin/wemo/rules/runnable/RMSaveRuleRunnable;->access$300(Lcom/belkin/wemo/rules/runnable/RMSaveRuleRunnable;)Lcom/belkin/wemo/rules/callback/RMSaveRuleErrorCallback;

    move-result-object v0

    new-instance v1, Lcom/belkin/wemo/rules/error/RMRulesError;

    invoke-virtual {p1}, Lcom/belkin/wemo/rules/error/RMRulesError;->getErrorCode()I

    move-result v2

    invoke-virtual {p1}, Lcom/belkin/wemo/rules/error/RMRulesError;->getErrorMessage()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v1, v2, v3}, Lcom/belkin/wemo/rules/error/RMRulesError;-><init>(ILjava/lang/String;)V

    invoke-interface {v0, v1}, Lcom/belkin/wemo/rules/callback/RMSaveRuleErrorCallback;->onError(Lcom/belkin/wemo/rules/error/RMRulesError;)V

    .line 75
    :cond_0
    return-void
.end method

.method public onSuccess(Ljava/util/List;)V
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lcom/belkin/wemo/rules/data/RMRule;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 62
    .local p1, "rulesList":Ljava/util/List;, "Ljava/util/List<Lcom/belkin/wemo/rules/data/RMRule;>;"
    iget-object v1, p0, Lcom/belkin/wemo/rules/runnable/RMSaveRuleRunnable$RMFetchBeforeSaveCallback;->this$0:Lcom/belkin/wemo/rules/runnable/RMSaveRuleRunnable;

    invoke-static {v1}, Lcom/belkin/wemo/rules/runnable/RMSaveRuleRunnable;->access$000(Lcom/belkin/wemo/rules/runnable/RMSaveRuleRunnable;)Ljava/lang/String;

    move-result-object v1

    const-string v2, "Fetch before Store DONE. Next Step - RULE CONFLICTS."

    invoke-static {v1, v2}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->debugLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 64
    new-instance v0, Lcom/belkin/wemo/rules/runnable/RMSaveRuleRunnable$RMNewRuleConflictCallback;

    iget-object v1, p0, Lcom/belkin/wemo/rules/runnable/RMSaveRuleRunnable$RMFetchBeforeSaveCallback;->this$0:Lcom/belkin/wemo/rules/runnable/RMSaveRuleRunnable;

    iget-object v2, p0, Lcom/belkin/wemo/rules/runnable/RMSaveRuleRunnable$RMFetchBeforeSaveCallback;->this$0:Lcom/belkin/wemo/rules/runnable/RMSaveRuleRunnable;

    invoke-static {v2}, Lcom/belkin/wemo/rules/runnable/RMSaveRuleRunnable;->access$100(Lcom/belkin/wemo/rules/runnable/RMSaveRuleRunnable;)Lcom/belkin/wemo/rules/data/RMRule;

    move-result-object v2

    iget-object v3, p0, Lcom/belkin/wemo/rules/runnable/RMSaveRuleRunnable$RMFetchBeforeSaveCallback;->this$0:Lcom/belkin/wemo/rules/runnable/RMSaveRuleRunnable;

    invoke-static {v3}, Lcom/belkin/wemo/rules/runnable/RMSaveRuleRunnable;->access$200(Lcom/belkin/wemo/rules/runnable/RMSaveRuleRunnable;)Lcom/belkin/wemo/rules/callback/RMSaveRuleSuccessCallback;

    move-result-object v3

    iget-object v4, p0, Lcom/belkin/wemo/rules/runnable/RMSaveRuleRunnable$RMFetchBeforeSaveCallback;->this$0:Lcom/belkin/wemo/rules/runnable/RMSaveRuleRunnable;

    invoke-static {v4}, Lcom/belkin/wemo/rules/runnable/RMSaveRuleRunnable;->access$300(Lcom/belkin/wemo/rules/runnable/RMSaveRuleRunnable;)Lcom/belkin/wemo/rules/callback/RMSaveRuleErrorCallback;

    move-result-object v4

    iget-object v5, p0, Lcom/belkin/wemo/rules/runnable/RMSaveRuleRunnable$RMFetchBeforeSaveCallback;->activeDeviceList:Ljava/util/List;

    invoke-direct/range {v0 .. v5}, Lcom/belkin/wemo/rules/runnable/RMSaveRuleRunnable$RMNewRuleConflictCallback;-><init>(Lcom/belkin/wemo/rules/runnable/RMSaveRuleRunnable;Lcom/belkin/wemo/rules/data/RMRule;Lcom/belkin/wemo/rules/callback/RMSaveRuleSuccessCallback;Lcom/belkin/wemo/rules/callback/RMSaveRuleErrorCallback;Ljava/util/List;)V

    .line 65
    .local v0, "callback":Lcom/belkin/wemo/rules/runnable/RMSaveRuleRunnable$RMNewRuleConflictCallback;
    sget-object v1, Lcom/belkin/wemo/rules/data/RMUserRules;->INSTANCE:Lcom/belkin/wemo/rules/data/RMUserRules;

    iget-object v2, p0, Lcom/belkin/wemo/rules/runnable/RMSaveRuleRunnable$RMFetchBeforeSaveCallback;->this$0:Lcom/belkin/wemo/rules/runnable/RMSaveRuleRunnable;

    invoke-static {v2}, Lcom/belkin/wemo/rules/runnable/RMSaveRuleRunnable;->access$100(Lcom/belkin/wemo/rules/runnable/RMSaveRuleRunnable;)Lcom/belkin/wemo/rules/data/RMRule;

    move-result-object v2

    invoke-virtual {v1, v2, v0, v0}, Lcom/belkin/wemo/rules/data/RMUserRules;->verifyRuleConflicts(Lcom/belkin/wemo/rules/data/RMRule;Lcom/belkin/wemo/rules/data/callback/RMRuleConflictSuccessCallback;Lcom/belkin/wemo/rules/data/callback/RMRuleConflictErrorCallback;)V

    .line 66
    return-void
.end method
