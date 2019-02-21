.class Lcom/belkin/wemo/rules/runnable/RMEditRuleRunnable$RMEditRuleComposerCallback;
.super Ljava/lang/Object;
.source "RMEditRuleRunnable.java"

# interfaces
.implements Lcom/belkin/wemo/rules/composer/callback/RMComposeRulesErrorCallback;
.implements Lcom/belkin/wemo/rules/composer/callback/RMComposeRulesSuccessCallback;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/belkin/wemo/rules/runnable/RMEditRuleRunnable;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "RMEditRuleComposerCallback"
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

.field private errorCallback:Lcom/belkin/wemo/rules/callback/RMEditRuleErrorCallback;

.field private rule:Lcom/belkin/wemo/rules/data/RMRule;

.field private successCallback:Lcom/belkin/wemo/rules/callback/RMEditRuleSuccessCallback;

.field final synthetic this$0:Lcom/belkin/wemo/rules/runnable/RMEditRuleRunnable;


# direct methods
.method public constructor <init>(Lcom/belkin/wemo/rules/runnable/RMEditRuleRunnable;Lcom/belkin/wemo/rules/data/RMRule;Lcom/belkin/wemo/rules/callback/RMEditRuleSuccessCallback;Lcom/belkin/wemo/rules/callback/RMEditRuleErrorCallback;Ljava/util/List;)V
    .locals 0
    .param p2, "rule"    # Lcom/belkin/wemo/rules/data/RMRule;
    .param p3, "successCallback"    # Lcom/belkin/wemo/rules/callback/RMEditRuleSuccessCallback;
    .param p4, "errorCallback"    # Lcom/belkin/wemo/rules/callback/RMEditRuleErrorCallback;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/belkin/wemo/rules/data/RMRule;",
            "Lcom/belkin/wemo/rules/callback/RMEditRuleSuccessCallback;",
            "Lcom/belkin/wemo/rules/callback/RMEditRuleErrorCallback;",
            "Ljava/util/List",
            "<",
            "Lcom/belkin/wemo/cache/data/DeviceInformation;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 122
    .local p5, "activeDeviceList":Ljava/util/List;, "Ljava/util/List<Lcom/belkin/wemo/cache/data/DeviceInformation;>;"
    iput-object p1, p0, Lcom/belkin/wemo/rules/runnable/RMEditRuleRunnable$RMEditRuleComposerCallback;->this$0:Lcom/belkin/wemo/rules/runnable/RMEditRuleRunnable;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 123
    iput-object p3, p0, Lcom/belkin/wemo/rules/runnable/RMEditRuleRunnable$RMEditRuleComposerCallback;->successCallback:Lcom/belkin/wemo/rules/callback/RMEditRuleSuccessCallback;

    .line 124
    iput-object p4, p0, Lcom/belkin/wemo/rules/runnable/RMEditRuleRunnable$RMEditRuleComposerCallback;->errorCallback:Lcom/belkin/wemo/rules/callback/RMEditRuleErrorCallback;

    .line 125
    iput-object p2, p0, Lcom/belkin/wemo/rules/runnable/RMEditRuleRunnable$RMEditRuleComposerCallback;->rule:Lcom/belkin/wemo/rules/data/RMRule;

    .line 126
    iput-object p5, p0, Lcom/belkin/wemo/rules/runnable/RMEditRuleRunnable$RMEditRuleComposerCallback;->activeDeviceList:Ljava/util/List;

    .line 127
    return-void
.end method


# virtual methods
.method public onRulesComposed()V
    .locals 5

    .prologue
    .line 132
    new-instance v0, Lcom/belkin/wemo/rules/runnable/RMEditRuleRunnable$RMStoreRuleCallback;

    iget-object v1, p0, Lcom/belkin/wemo/rules/runnable/RMEditRuleRunnable$RMEditRuleComposerCallback;->this$0:Lcom/belkin/wemo/rules/runnable/RMEditRuleRunnable;

    iget-object v2, p0, Lcom/belkin/wemo/rules/runnable/RMEditRuleRunnable$RMEditRuleComposerCallback;->rule:Lcom/belkin/wemo/rules/data/RMRule;

    iget-object v3, p0, Lcom/belkin/wemo/rules/runnable/RMEditRuleRunnable$RMEditRuleComposerCallback;->successCallback:Lcom/belkin/wemo/rules/callback/RMEditRuleSuccessCallback;

    iget-object v4, p0, Lcom/belkin/wemo/rules/runnable/RMEditRuleRunnable$RMEditRuleComposerCallback;->errorCallback:Lcom/belkin/wemo/rules/callback/RMEditRuleErrorCallback;

    invoke-direct {v0, v1, v2, v3, v4}, Lcom/belkin/wemo/rules/runnable/RMEditRuleRunnable$RMStoreRuleCallback;-><init>(Lcom/belkin/wemo/rules/runnable/RMEditRuleRunnable;Lcom/belkin/wemo/rules/data/RMRule;Lcom/belkin/wemo/rules/callback/RMEditRuleSuccessCallback;Lcom/belkin/wemo/rules/callback/RMEditRuleErrorCallback;)V

    .line 133
    .local v0, "callback":Lcom/belkin/wemo/rules/runnable/RMEditRuleRunnable$RMStoreRuleCallback;
    sget-object v1, Lcom/belkin/wemo/rules/store/RMStoreRulesManager;->INSTANCE:Lcom/belkin/wemo/rules/store/RMStoreRulesManager;

    iget-object v2, p0, Lcom/belkin/wemo/rules/runnable/RMEditRuleRunnable$RMEditRuleComposerCallback;->rule:Lcom/belkin/wemo/rules/data/RMRule;

    iget-object v3, p0, Lcom/belkin/wemo/rules/runnable/RMEditRuleRunnable$RMEditRuleComposerCallback;->activeDeviceList:Ljava/util/List;

    invoke-virtual {v1, v2, v0, v0, v3}, Lcom/belkin/wemo/rules/store/RMStoreRulesManager;->storeRules(Lcom/belkin/wemo/rules/data/RMRule;Lcom/belkin/wemo/rules/store/callback/RMStoreRulesSuccessCallback;Lcom/belkin/wemo/rules/store/callback/RMStoreRulesErrorCallback;Ljava/util/List;)V

    .line 134
    return-void
.end method

.method public onRulesCompositionFailed()V
    .locals 2

    .prologue
    .line 138
    iget-object v0, p0, Lcom/belkin/wemo/rules/runnable/RMEditRuleRunnable$RMEditRuleComposerCallback;->errorCallback:Lcom/belkin/wemo/rules/callback/RMEditRuleErrorCallback;

    if-eqz v0, :cond_0

    .line 139
    iget-object v0, p0, Lcom/belkin/wemo/rules/runnable/RMEditRuleRunnable$RMEditRuleComposerCallback;->errorCallback:Lcom/belkin/wemo/rules/callback/RMEditRuleErrorCallback;

    new-instance v1, Lcom/belkin/wemo/rules/error/RMRulesError;

    invoke-direct {v1}, Lcom/belkin/wemo/rules/error/RMRulesError;-><init>()V

    invoke-interface {v0, v1}, Lcom/belkin/wemo/rules/callback/RMEditRuleErrorCallback;->onError(Lcom/belkin/wemo/rules/error/RMRulesError;)V

    .line 143
    :cond_0
    sget-object v0, Lcom/belkin/wemo/rules/data/RMUserRules;->INSTANCE:Lcom/belkin/wemo/rules/data/RMUserRules;

    iget-object v1, p0, Lcom/belkin/wemo/rules/runnable/RMEditRuleRunnable$RMEditRuleComposerCallback;->this$0:Lcom/belkin/wemo/rules/runnable/RMEditRuleRunnable;

    invoke-static {v1}, Lcom/belkin/wemo/rules/runnable/RMEditRuleRunnable;->access$300(Lcom/belkin/wemo/rules/runnable/RMEditRuleRunnable;)Lcom/belkin/wemo/rules/data/RMRule;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/belkin/wemo/rules/data/RMUserRules;->replaceRule(Lcom/belkin/wemo/rules/data/RMRule;)Lcom/belkin/wemo/rules/data/RMRule;

    .line 144
    return-void
.end method
