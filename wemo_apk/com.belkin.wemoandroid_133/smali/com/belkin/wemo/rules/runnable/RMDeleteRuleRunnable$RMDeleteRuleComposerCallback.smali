.class Lcom/belkin/wemo/rules/runnable/RMDeleteRuleRunnable$RMDeleteRuleComposerCallback;
.super Ljava/lang/Object;
.source "RMDeleteRuleRunnable.java"

# interfaces
.implements Lcom/belkin/wemo/rules/composer/callback/RMComposeRulesErrorCallback;
.implements Lcom/belkin/wemo/rules/composer/callback/RMComposeRulesSuccessCallback;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/belkin/wemo/rules/runnable/RMDeleteRuleRunnable;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "RMDeleteRuleComposerCallback"
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

.field private deletedRule:Lcom/belkin/wemo/rules/data/RMRule;

.field private errorCallback:Lcom/belkin/wemo/rules/callback/RMDeleteRuleErrorCallback;

.field private successCallback:Lcom/belkin/wemo/rules/callback/RMDeleteRuleSuccessCallback;

.field final synthetic this$0:Lcom/belkin/wemo/rules/runnable/RMDeleteRuleRunnable;


# direct methods
.method public constructor <init>(Lcom/belkin/wemo/rules/runnable/RMDeleteRuleRunnable;Lcom/belkin/wemo/rules/data/RMRule;Lcom/belkin/wemo/rules/callback/RMDeleteRuleSuccessCallback;Lcom/belkin/wemo/rules/callback/RMDeleteRuleErrorCallback;Ljava/util/List;)V
    .locals 2
    .param p2, "rule"    # Lcom/belkin/wemo/rules/data/RMRule;
    .param p3, "successCallback"    # Lcom/belkin/wemo/rules/callback/RMDeleteRuleSuccessCallback;
    .param p4, "errorCallback"    # Lcom/belkin/wemo/rules/callback/RMDeleteRuleErrorCallback;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/belkin/wemo/rules/data/RMRule;",
            "Lcom/belkin/wemo/rules/callback/RMDeleteRuleSuccessCallback;",
            "Lcom/belkin/wemo/rules/callback/RMDeleteRuleErrorCallback;",
            "Ljava/util/List",
            "<",
            "Lcom/belkin/wemo/cache/data/DeviceInformation;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 94
    .local p5, "activeDeviceList":Ljava/util/List;, "Ljava/util/List<Lcom/belkin/wemo/cache/data/DeviceInformation;>;"
    iput-object p1, p0, Lcom/belkin/wemo/rules/runnable/RMDeleteRuleRunnable$RMDeleteRuleComposerCallback;->this$0:Lcom/belkin/wemo/rules/runnable/RMDeleteRuleRunnable;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 95
    iput-object p3, p0, Lcom/belkin/wemo/rules/runnable/RMDeleteRuleRunnable$RMDeleteRuleComposerCallback;->successCallback:Lcom/belkin/wemo/rules/callback/RMDeleteRuleSuccessCallback;

    .line 96
    iput-object p4, p0, Lcom/belkin/wemo/rules/runnable/RMDeleteRuleRunnable$RMDeleteRuleComposerCallback;->errorCallback:Lcom/belkin/wemo/rules/callback/RMDeleteRuleErrorCallback;

    .line 97
    iput-object p2, p0, Lcom/belkin/wemo/rules/runnable/RMDeleteRuleRunnable$RMDeleteRuleComposerCallback;->deletedRule:Lcom/belkin/wemo/rules/data/RMRule;

    .line 98
    iget-object v0, p0, Lcom/belkin/wemo/rules/runnable/RMDeleteRuleRunnable$RMDeleteRuleComposerCallback;->deletedRule:Lcom/belkin/wemo/rules/data/RMRule;

    const/4 v1, 0x1

    iput-boolean v1, v0, Lcom/belkin/wemo/rules/data/RMRule;->isDelete:Z

    .line 99
    iput-object p5, p0, Lcom/belkin/wemo/rules/runnable/RMDeleteRuleRunnable$RMDeleteRuleComposerCallback;->activeDeviceList:Ljava/util/List;

    .line 100
    return-void
.end method


# virtual methods
.method public onRulesComposed()V
    .locals 5

    .prologue
    .line 105
    new-instance v0, Lcom/belkin/wemo/rules/runnable/RMDeleteRuleRunnable$RMStoreRuleCallback;

    iget-object v1, p0, Lcom/belkin/wemo/rules/runnable/RMDeleteRuleRunnable$RMDeleteRuleComposerCallback;->this$0:Lcom/belkin/wemo/rules/runnable/RMDeleteRuleRunnable;

    iget-object v2, p0, Lcom/belkin/wemo/rules/runnable/RMDeleteRuleRunnable$RMDeleteRuleComposerCallback;->deletedRule:Lcom/belkin/wemo/rules/data/RMRule;

    iget-object v3, p0, Lcom/belkin/wemo/rules/runnable/RMDeleteRuleRunnable$RMDeleteRuleComposerCallback;->successCallback:Lcom/belkin/wemo/rules/callback/RMDeleteRuleSuccessCallback;

    iget-object v4, p0, Lcom/belkin/wemo/rules/runnable/RMDeleteRuleRunnable$RMDeleteRuleComposerCallback;->errorCallback:Lcom/belkin/wemo/rules/callback/RMDeleteRuleErrorCallback;

    invoke-direct {v0, v1, v2, v3, v4}, Lcom/belkin/wemo/rules/runnable/RMDeleteRuleRunnable$RMStoreRuleCallback;-><init>(Lcom/belkin/wemo/rules/runnable/RMDeleteRuleRunnable;Lcom/belkin/wemo/rules/data/RMRule;Lcom/belkin/wemo/rules/callback/RMDeleteRuleSuccessCallback;Lcom/belkin/wemo/rules/callback/RMDeleteRuleErrorCallback;)V

    .line 106
    .local v0, "callback":Lcom/belkin/wemo/rules/runnable/RMDeleteRuleRunnable$RMStoreRuleCallback;
    sget-object v1, Lcom/belkin/wemo/rules/store/RMStoreRulesManager;->INSTANCE:Lcom/belkin/wemo/rules/store/RMStoreRulesManager;

    iget-object v2, p0, Lcom/belkin/wemo/rules/runnable/RMDeleteRuleRunnable$RMDeleteRuleComposerCallback;->deletedRule:Lcom/belkin/wemo/rules/data/RMRule;

    iget-object v3, p0, Lcom/belkin/wemo/rules/runnable/RMDeleteRuleRunnable$RMDeleteRuleComposerCallback;->activeDeviceList:Ljava/util/List;

    invoke-virtual {v1, v2, v0, v0, v3}, Lcom/belkin/wemo/rules/store/RMStoreRulesManager;->storeRules(Lcom/belkin/wemo/rules/data/RMRule;Lcom/belkin/wemo/rules/store/callback/RMStoreRulesSuccessCallback;Lcom/belkin/wemo/rules/store/callback/RMStoreRulesErrorCallback;Ljava/util/List;)V

    .line 107
    return-void
.end method

.method public onRulesCompositionFailed()V
    .locals 2

    .prologue
    .line 111
    iget-object v0, p0, Lcom/belkin/wemo/rules/runnable/RMDeleteRuleRunnable$RMDeleteRuleComposerCallback;->this$0:Lcom/belkin/wemo/rules/runnable/RMDeleteRuleRunnable;

    iget-object v1, p0, Lcom/belkin/wemo/rules/runnable/RMDeleteRuleRunnable$RMDeleteRuleComposerCallback;->deletedRule:Lcom/belkin/wemo/rules/data/RMRule;

    invoke-static {v0, v1}, Lcom/belkin/wemo/rules/runnable/RMDeleteRuleRunnable;->access$500(Lcom/belkin/wemo/rules/runnable/RMDeleteRuleRunnable;Lcom/belkin/wemo/rules/data/RMRule;)V

    .line 113
    iget-object v0, p0, Lcom/belkin/wemo/rules/runnable/RMDeleteRuleRunnable$RMDeleteRuleComposerCallback;->errorCallback:Lcom/belkin/wemo/rules/callback/RMDeleteRuleErrorCallback;

    if-eqz v0, :cond_0

    .line 114
    iget-object v0, p0, Lcom/belkin/wemo/rules/runnable/RMDeleteRuleRunnable$RMDeleteRuleComposerCallback;->errorCallback:Lcom/belkin/wemo/rules/callback/RMDeleteRuleErrorCallback;

    new-instance v1, Lcom/belkin/wemo/rules/error/RMRulesError;

    invoke-direct {v1}, Lcom/belkin/wemo/rules/error/RMRulesError;-><init>()V

    invoke-interface {v0, v1}, Lcom/belkin/wemo/rules/callback/RMDeleteRuleErrorCallback;->onError(Lcom/belkin/wemo/rules/error/RMRulesError;)V

    .line 116
    :cond_0
    return-void
.end method
