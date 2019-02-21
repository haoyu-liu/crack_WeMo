.class Lcom/belkin/wemo/rules/runnable/RMSaveRuleRunnable$RMNewRuleComposerCallback;
.super Ljava/lang/Object;
.source "RMSaveRuleRunnable.java"

# interfaces
.implements Lcom/belkin/wemo/rules/composer/callback/RMComposeRulesErrorCallback;
.implements Lcom/belkin/wemo/rules/composer/callback/RMComposeRulesSuccessCallback;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/belkin/wemo/rules/runnable/RMSaveRuleRunnable;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "RMNewRuleComposerCallback"
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
    .line 127
    .local p5, "activeDeviceList":Ljava/util/List;, "Ljava/util/List<Lcom/belkin/wemo/cache/data/DeviceInformation;>;"
    iput-object p1, p0, Lcom/belkin/wemo/rules/runnable/RMSaveRuleRunnable$RMNewRuleComposerCallback;->this$0:Lcom/belkin/wemo/rules/runnable/RMSaveRuleRunnable;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 128
    iput-object p3, p0, Lcom/belkin/wemo/rules/runnable/RMSaveRuleRunnable$RMNewRuleComposerCallback;->successCallback:Lcom/belkin/wemo/rules/callback/RMSaveRuleSuccessCallback;

    .line 129
    iput-object p4, p0, Lcom/belkin/wemo/rules/runnable/RMSaveRuleRunnable$RMNewRuleComposerCallback;->errorCallback:Lcom/belkin/wemo/rules/callback/RMSaveRuleErrorCallback;

    .line 130
    iput-object p2, p0, Lcom/belkin/wemo/rules/runnable/RMSaveRuleRunnable$RMNewRuleComposerCallback;->rule:Lcom/belkin/wemo/rules/data/RMRule;

    .line 131
    iput-object p5, p0, Lcom/belkin/wemo/rules/runnable/RMSaveRuleRunnable$RMNewRuleComposerCallback;->activeDeviceList:Ljava/util/List;

    .line 132
    return-void
.end method


# virtual methods
.method public onRulesComposed()V
    .locals 5

    .prologue
    .line 136
    iget-object v1, p0, Lcom/belkin/wemo/rules/runnable/RMSaveRuleRunnable$RMNewRuleComposerCallback;->this$0:Lcom/belkin/wemo/rules/runnable/RMSaveRuleRunnable;

    invoke-static {v1}, Lcom/belkin/wemo/rules/runnable/RMSaveRuleRunnable;->access$600(Lcom/belkin/wemo/rules/runnable/RMSaveRuleRunnable;)Ljava/lang/String;

    move-result-object v1

    const-string v2, "RULE ADDED TO DB and USER RULES. Next Step - STORE RULES (or equivalent API)"

    invoke-static {v1, v2}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->debugLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 138
    new-instance v0, Lcom/belkin/wemo/rules/runnable/RMSaveRuleRunnable$RMStoreRuleCallback;

    iget-object v1, p0, Lcom/belkin/wemo/rules/runnable/RMSaveRuleRunnable$RMNewRuleComposerCallback;->this$0:Lcom/belkin/wemo/rules/runnable/RMSaveRuleRunnable;

    iget-object v2, p0, Lcom/belkin/wemo/rules/runnable/RMSaveRuleRunnable$RMNewRuleComposerCallback;->rule:Lcom/belkin/wemo/rules/data/RMRule;

    iget-object v3, p0, Lcom/belkin/wemo/rules/runnable/RMSaveRuleRunnable$RMNewRuleComposerCallback;->successCallback:Lcom/belkin/wemo/rules/callback/RMSaveRuleSuccessCallback;

    iget-object v4, p0, Lcom/belkin/wemo/rules/runnable/RMSaveRuleRunnable$RMNewRuleComposerCallback;->errorCallback:Lcom/belkin/wemo/rules/callback/RMSaveRuleErrorCallback;

    invoke-direct {v0, v1, v2, v3, v4}, Lcom/belkin/wemo/rules/runnable/RMSaveRuleRunnable$RMStoreRuleCallback;-><init>(Lcom/belkin/wemo/rules/runnable/RMSaveRuleRunnable;Lcom/belkin/wemo/rules/data/RMRule;Lcom/belkin/wemo/rules/callback/RMSaveRuleSuccessCallback;Lcom/belkin/wemo/rules/callback/RMSaveRuleErrorCallback;)V

    .line 139
    .local v0, "callback":Lcom/belkin/wemo/rules/runnable/RMSaveRuleRunnable$RMStoreRuleCallback;
    sget-object v1, Lcom/belkin/wemo/rules/store/RMStoreRulesManager;->INSTANCE:Lcom/belkin/wemo/rules/store/RMStoreRulesManager;

    iget-object v2, p0, Lcom/belkin/wemo/rules/runnable/RMSaveRuleRunnable$RMNewRuleComposerCallback;->rule:Lcom/belkin/wemo/rules/data/RMRule;

    iget-object v3, p0, Lcom/belkin/wemo/rules/runnable/RMSaveRuleRunnable$RMNewRuleComposerCallback;->activeDeviceList:Ljava/util/List;

    invoke-virtual {v1, v2, v0, v0, v3}, Lcom/belkin/wemo/rules/store/RMStoreRulesManager;->storeRules(Lcom/belkin/wemo/rules/data/RMRule;Lcom/belkin/wemo/rules/store/callback/RMStoreRulesSuccessCallback;Lcom/belkin/wemo/rules/store/callback/RMStoreRulesErrorCallback;Ljava/util/List;)V

    .line 140
    return-void
.end method

.method public onRulesCompositionFailed()V
    .locals 2

    .prologue
    .line 145
    sget-object v0, Lcom/belkin/wemo/rules/data/RMUserRules;->INSTANCE:Lcom/belkin/wemo/rules/data/RMUserRules;

    iget-object v1, p0, Lcom/belkin/wemo/rules/runnable/RMSaveRuleRunnable$RMNewRuleComposerCallback;->rule:Lcom/belkin/wemo/rules/data/RMRule;

    invoke-virtual {v0, v1}, Lcom/belkin/wemo/rules/data/RMUserRules;->deleteRule(Lcom/belkin/wemo/rules/data/RMRule;)Lcom/belkin/wemo/rules/data/RMRule;

    .line 147
    iget-object v0, p0, Lcom/belkin/wemo/rules/runnable/RMSaveRuleRunnable$RMNewRuleComposerCallback;->errorCallback:Lcom/belkin/wemo/rules/callback/RMSaveRuleErrorCallback;

    if-eqz v0, :cond_0

    .line 148
    iget-object v0, p0, Lcom/belkin/wemo/rules/runnable/RMSaveRuleRunnable$RMNewRuleComposerCallback;->errorCallback:Lcom/belkin/wemo/rules/callback/RMSaveRuleErrorCallback;

    new-instance v1, Lcom/belkin/wemo/rules/error/RMRulesError;

    invoke-direct {v1}, Lcom/belkin/wemo/rules/error/RMRulesError;-><init>()V

    invoke-interface {v0, v1}, Lcom/belkin/wemo/rules/callback/RMSaveRuleErrorCallback;->onError(Lcom/belkin/wemo/rules/error/RMRulesError;)V

    .line 150
    :cond_0
    return-void
.end method
