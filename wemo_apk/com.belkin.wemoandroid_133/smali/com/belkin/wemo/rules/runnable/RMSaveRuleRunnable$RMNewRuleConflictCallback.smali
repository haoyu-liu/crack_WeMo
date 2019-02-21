.class Lcom/belkin/wemo/rules/runnable/RMSaveRuleRunnable$RMNewRuleConflictCallback;
.super Ljava/lang/Object;
.source "RMSaveRuleRunnable.java"

# interfaces
.implements Lcom/belkin/wemo/rules/data/callback/RMRuleConflictErrorCallback;
.implements Lcom/belkin/wemo/rules/data/callback/RMRuleConflictSuccessCallback;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/belkin/wemo/rules/runnable/RMSaveRuleRunnable;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "RMNewRuleConflictCallback"
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

.field private errorCallback:Lcom/belkin/wemo/rules/callback/RMSaveRuleErrorCallback;

.field private rule:Lcom/belkin/wemo/rules/data/RMRule;

.field private successCallback:Lcom/belkin/wemo/rules/callback/RMSaveRuleSuccessCallback;

.field final synthetic this$0:Lcom/belkin/wemo/rules/runnable/RMSaveRuleRunnable;


# direct methods
.method public constructor <init>(Lcom/belkin/wemo/rules/runnable/RMSaveRuleRunnable;Lcom/belkin/wemo/rules/data/RMRule;Lcom/belkin/wemo/rules/callback/RMSaveRuleSuccessCallback;Lcom/belkin/wemo/rules/callback/RMSaveRuleErrorCallback;Ljava/util/List;)V
    .locals 0
    .param p2, "rule"    # Lcom/belkin/wemo/rules/data/RMRule;
    .param p3, "successCallback"    # Lcom/belkin/wemo/rules/callback/RMSaveRuleSuccessCallback;
    .param p4, "errorCallback"    # Lcom/belkin/wemo/rules/callback/RMSaveRuleErrorCallback;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/belkin/wemo/rules/data/RMRule;",
            "Lcom/belkin/wemo/rules/callback/RMSaveRuleSuccessCallback;",
            "Lcom/belkin/wemo/rules/callback/RMSaveRuleErrorCallback;",
            "Ljava/util/List",
            "<",
            "Lcom/belkin/wemo/cache/data/DeviceInformation;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 88
    .local p5, "activeDeviceList":Ljava/util/List;, "Ljava/util/List<Lcom/belkin/wemo/cache/data/DeviceInformation;>;"
    iput-object p1, p0, Lcom/belkin/wemo/rules/runnable/RMSaveRuleRunnable$RMNewRuleConflictCallback;->this$0:Lcom/belkin/wemo/rules/runnable/RMSaveRuleRunnable;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 89
    iput-object p3, p0, Lcom/belkin/wemo/rules/runnable/RMSaveRuleRunnable$RMNewRuleConflictCallback;->successCallback:Lcom/belkin/wemo/rules/callback/RMSaveRuleSuccessCallback;

    .line 90
    iput-object p4, p0, Lcom/belkin/wemo/rules/runnable/RMSaveRuleRunnable$RMNewRuleConflictCallback;->errorCallback:Lcom/belkin/wemo/rules/callback/RMSaveRuleErrorCallback;

    .line 91
    iput-object p2, p0, Lcom/belkin/wemo/rules/runnable/RMSaveRuleRunnable$RMNewRuleConflictCallback;->rule:Lcom/belkin/wemo/rules/data/RMRule;

    .line 92
    iput-object p5, p0, Lcom/belkin/wemo/rules/runnable/RMSaveRuleRunnable$RMNewRuleConflictCallback;->activeDeviceList:Ljava/util/List;

    .line 93
    return-void
.end method


# virtual methods
.method public onConflictFound(Lcom/belkin/wemo/rules/data/error/RMRuleConflictError;)V
    .locals 4
    .param p1, "error"    # Lcom/belkin/wemo/rules/data/error/RMRuleConflictError;

    .prologue
    .line 111
    iget-object v0, p0, Lcom/belkin/wemo/rules/runnable/RMSaveRuleRunnable$RMNewRuleConflictCallback;->errorCallback:Lcom/belkin/wemo/rules/callback/RMSaveRuleErrorCallback;

    if-eqz v0, :cond_0

    .line 112
    iget-object v0, p0, Lcom/belkin/wemo/rules/runnable/RMSaveRuleRunnable$RMNewRuleConflictCallback;->errorCallback:Lcom/belkin/wemo/rules/callback/RMSaveRuleErrorCallback;

    new-instance v1, Lcom/belkin/wemo/rules/error/RMRulesError;

    invoke-virtual {p1}, Lcom/belkin/wemo/rules/data/error/RMRuleConflictError;->getErrorCode()I

    move-result v2

    invoke-virtual {p1}, Lcom/belkin/wemo/rules/data/error/RMRuleConflictError;->getErrorMessage()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v1, v2, v3}, Lcom/belkin/wemo/rules/error/RMRulesError;-><init>(ILjava/lang/String;)V

    invoke-interface {v0, v1}, Lcom/belkin/wemo/rules/callback/RMSaveRuleErrorCallback;->onError(Lcom/belkin/wemo/rules/error/RMRulesError;)V

    .line 114
    :cond_0
    return-void
.end method

.method public onNoConflictFound()V
    .locals 7

    .prologue
    .line 97
    iget-object v1, p0, Lcom/belkin/wemo/rules/runnable/RMSaveRuleRunnable$RMNewRuleConflictCallback;->this$0:Lcom/belkin/wemo/rules/runnable/RMSaveRuleRunnable;

    invoke-static {v1}, Lcom/belkin/wemo/rules/runnable/RMSaveRuleRunnable;->access$500(Lcom/belkin/wemo/rules/runnable/RMSaveRuleRunnable;)Ljava/lang/String;

    move-result-object v1

    const-string v2, "NO RULE CONFLICTS FOUND. Next Step - ADD RULE TO RULES DB AND USER RULES."

    invoke-static {v1, v2}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->debugLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 100
    sget-object v1, Lcom/belkin/wemo/rules/data/RMUserRules;->INSTANCE:Lcom/belkin/wemo/rules/data/RMUserRules;

    iget-object v2, p0, Lcom/belkin/wemo/rules/runnable/RMSaveRuleRunnable$RMNewRuleConflictCallback;->rule:Lcom/belkin/wemo/rules/data/RMRule;

    invoke-virtual {v1, v2}, Lcom/belkin/wemo/rules/data/RMUserRules;->addRule(Lcom/belkin/wemo/rules/data/RMRule;)V

    .line 103
    sget-object v1, Lcom/belkin/wemo/rules/composer/impl/RMRuleComposerFactory;->INSTANCE:Lcom/belkin/wemo/rules/composer/impl/RMRuleComposerFactory;

    iget-object v2, p0, Lcom/belkin/wemo/rules/runnable/RMSaveRuleRunnable$RMNewRuleConflictCallback;->rule:Lcom/belkin/wemo/rules/data/RMRule;

    invoke-virtual {v1, v2}, Lcom/belkin/wemo/rules/composer/impl/RMRuleComposerFactory;->getInstance(Lcom/belkin/wemo/rules/data/RMRule;)Lcom/belkin/wemo/rules/composer/RMAbstractRuleComposer;

    move-result-object v6

    .line 105
    .local v6, "composer":Lcom/belkin/wemo/rules/composer/RMAbstractRuleComposer;, "Lcom/belkin/wemo/rules/composer/RMAbstractRuleComposer<+Lcom/belkin/wemo/rules/data/RMRule;>;"
    new-instance v0, Lcom/belkin/wemo/rules/runnable/RMSaveRuleRunnable$RMNewRuleComposerCallback;

    iget-object v1, p0, Lcom/belkin/wemo/rules/runnable/RMSaveRuleRunnable$RMNewRuleConflictCallback;->this$0:Lcom/belkin/wemo/rules/runnable/RMSaveRuleRunnable;

    iget-object v2, p0, Lcom/belkin/wemo/rules/runnable/RMSaveRuleRunnable$RMNewRuleConflictCallback;->rule:Lcom/belkin/wemo/rules/data/RMRule;

    iget-object v3, p0, Lcom/belkin/wemo/rules/runnable/RMSaveRuleRunnable$RMNewRuleConflictCallback;->successCallback:Lcom/belkin/wemo/rules/callback/RMSaveRuleSuccessCallback;

    iget-object v4, p0, Lcom/belkin/wemo/rules/runnable/RMSaveRuleRunnable$RMNewRuleConflictCallback;->errorCallback:Lcom/belkin/wemo/rules/callback/RMSaveRuleErrorCallback;

    iget-object v5, p0, Lcom/belkin/wemo/rules/runnable/RMSaveRuleRunnable$RMNewRuleConflictCallback;->activeDeviceList:Ljava/util/List;

    invoke-direct/range {v0 .. v5}, Lcom/belkin/wemo/rules/runnable/RMSaveRuleRunnable$RMNewRuleComposerCallback;-><init>(Lcom/belkin/wemo/rules/runnable/RMSaveRuleRunnable;Lcom/belkin/wemo/rules/data/RMRule;Lcom/belkin/wemo/rules/callback/RMSaveRuleSuccessCallback;Lcom/belkin/wemo/rules/callback/RMSaveRuleErrorCallback;Ljava/util/List;)V

    .line 106
    .local v0, "callback":Lcom/belkin/wemo/rules/runnable/RMSaveRuleRunnable$RMNewRuleComposerCallback;
    invoke-virtual {v6, v0, v0}, Lcom/belkin/wemo/rules/composer/RMAbstractRuleComposer;->edit(Lcom/belkin/wemo/rules/composer/callback/RMComposeRulesSuccessCallback;Lcom/belkin/wemo/rules/composer/callback/RMComposeRulesErrorCallback;)V

    .line 107
    return-void
.end method
