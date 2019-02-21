.class public Lcom/belkin/wemo/rules/runnable/RMEnableRuleRunnable$RMToggleRuleComposerCallback;
.super Ljava/lang/Object;
.source "RMEnableRuleRunnable.java"

# interfaces
.implements Lcom/belkin/wemo/rules/composer/callback/RMComposeRulesErrorCallback;
.implements Lcom/belkin/wemo/rules/composer/callback/RMComposeRulesSuccessCallback;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/belkin/wemo/rules/runnable/RMEnableRuleRunnable;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4
    name = "RMToggleRuleComposerCallback"
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

.field private errorCallback:Lcom/belkin/wemo/rules/callback/RMToggleRuleErrorCallback;

.field private rule:Lcom/belkin/wemo/rules/data/RMRule;

.field private successCallback:Lcom/belkin/wemo/rules/callback/RMToggleRuleSuccessCallback;

.field final synthetic this$0:Lcom/belkin/wemo/rules/runnable/RMEnableRuleRunnable;


# direct methods
.method public constructor <init>(Lcom/belkin/wemo/rules/runnable/RMEnableRuleRunnable;Lcom/belkin/wemo/rules/data/RMRule;Lcom/belkin/wemo/rules/callback/RMToggleRuleSuccessCallback;Lcom/belkin/wemo/rules/callback/RMToggleRuleErrorCallback;Ljava/util/List;)V
    .locals 0
    .param p2, "rule"    # Lcom/belkin/wemo/rules/data/RMRule;
    .param p3, "successCallback"    # Lcom/belkin/wemo/rules/callback/RMToggleRuleSuccessCallback;
    .param p4, "errorCallback"    # Lcom/belkin/wemo/rules/callback/RMToggleRuleErrorCallback;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/belkin/wemo/rules/data/RMRule;",
            "Lcom/belkin/wemo/rules/callback/RMToggleRuleSuccessCallback;",
            "Lcom/belkin/wemo/rules/callback/RMToggleRuleErrorCallback;",
            "Ljava/util/List",
            "<",
            "Lcom/belkin/wemo/cache/data/DeviceInformation;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 141
    .local p5, "activeDeviceList":Ljava/util/List;, "Ljava/util/List<Lcom/belkin/wemo/cache/data/DeviceInformation;>;"
    iput-object p1, p0, Lcom/belkin/wemo/rules/runnable/RMEnableRuleRunnable$RMToggleRuleComposerCallback;->this$0:Lcom/belkin/wemo/rules/runnable/RMEnableRuleRunnable;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 142
    iput-object p3, p0, Lcom/belkin/wemo/rules/runnable/RMEnableRuleRunnable$RMToggleRuleComposerCallback;->successCallback:Lcom/belkin/wemo/rules/callback/RMToggleRuleSuccessCallback;

    .line 143
    iput-object p4, p0, Lcom/belkin/wemo/rules/runnable/RMEnableRuleRunnable$RMToggleRuleComposerCallback;->errorCallback:Lcom/belkin/wemo/rules/callback/RMToggleRuleErrorCallback;

    .line 144
    iput-object p2, p0, Lcom/belkin/wemo/rules/runnable/RMEnableRuleRunnable$RMToggleRuleComposerCallback;->rule:Lcom/belkin/wemo/rules/data/RMRule;

    .line 145
    iput-object p5, p0, Lcom/belkin/wemo/rules/runnable/RMEnableRuleRunnable$RMToggleRuleComposerCallback;->activeDeviceList:Ljava/util/List;

    .line 146
    return-void
.end method


# virtual methods
.method public onRulesComposed()V
    .locals 5

    .prologue
    .line 151
    new-instance v0, Lcom/belkin/wemo/rules/runnable/RMEnableRuleRunnable$RMStoreRuleCallback;

    iget-object v1, p0, Lcom/belkin/wemo/rules/runnable/RMEnableRuleRunnable$RMToggleRuleComposerCallback;->this$0:Lcom/belkin/wemo/rules/runnable/RMEnableRuleRunnable;

    iget-object v2, p0, Lcom/belkin/wemo/rules/runnable/RMEnableRuleRunnable$RMToggleRuleComposerCallback;->rule:Lcom/belkin/wemo/rules/data/RMRule;

    iget-object v3, p0, Lcom/belkin/wemo/rules/runnable/RMEnableRuleRunnable$RMToggleRuleComposerCallback;->successCallback:Lcom/belkin/wemo/rules/callback/RMToggleRuleSuccessCallback;

    iget-object v4, p0, Lcom/belkin/wemo/rules/runnable/RMEnableRuleRunnable$RMToggleRuleComposerCallback;->errorCallback:Lcom/belkin/wemo/rules/callback/RMToggleRuleErrorCallback;

    invoke-direct {v0, v1, v2, v3, v4}, Lcom/belkin/wemo/rules/runnable/RMEnableRuleRunnable$RMStoreRuleCallback;-><init>(Lcom/belkin/wemo/rules/runnable/RMEnableRuleRunnable;Lcom/belkin/wemo/rules/data/RMRule;Lcom/belkin/wemo/rules/callback/RMToggleRuleSuccessCallback;Lcom/belkin/wemo/rules/callback/RMToggleRuleErrorCallback;)V

    .line 152
    .local v0, "callback":Lcom/belkin/wemo/rules/runnable/RMEnableRuleRunnable$RMStoreRuleCallback;
    sget-object v1, Lcom/belkin/wemo/rules/store/RMStoreRulesManager;->INSTANCE:Lcom/belkin/wemo/rules/store/RMStoreRulesManager;

    iget-object v2, p0, Lcom/belkin/wemo/rules/runnable/RMEnableRuleRunnable$RMToggleRuleComposerCallback;->rule:Lcom/belkin/wemo/rules/data/RMRule;

    iget-object v3, p0, Lcom/belkin/wemo/rules/runnable/RMEnableRuleRunnable$RMToggleRuleComposerCallback;->activeDeviceList:Ljava/util/List;

    invoke-virtual {v1, v2, v0, v0, v3}, Lcom/belkin/wemo/rules/store/RMStoreRulesManager;->storeRules(Lcom/belkin/wemo/rules/data/RMRule;Lcom/belkin/wemo/rules/store/callback/RMStoreRulesSuccessCallback;Lcom/belkin/wemo/rules/store/callback/RMStoreRulesErrorCallback;Ljava/util/List;)V

    .line 153
    return-void
.end method

.method public onRulesCompositionFailed()V
    .locals 2

    .prologue
    .line 158
    iget-object v0, p0, Lcom/belkin/wemo/rules/runnable/RMEnableRuleRunnable$RMToggleRuleComposerCallback;->this$0:Lcom/belkin/wemo/rules/runnable/RMEnableRuleRunnable;

    iget-object v1, p0, Lcom/belkin/wemo/rules/runnable/RMEnableRuleRunnable$RMToggleRuleComposerCallback;->rule:Lcom/belkin/wemo/rules/data/RMRule;

    invoke-virtual {v0, v1}, Lcom/belkin/wemo/rules/runnable/RMEnableRuleRunnable;->restorePreviousState(Lcom/belkin/wemo/rules/data/RMRule;)V

    .line 160
    iget-object v0, p0, Lcom/belkin/wemo/rules/runnable/RMEnableRuleRunnable$RMToggleRuleComposerCallback;->errorCallback:Lcom/belkin/wemo/rules/callback/RMToggleRuleErrorCallback;

    if-eqz v0, :cond_0

    .line 161
    iget-object v0, p0, Lcom/belkin/wemo/rules/runnable/RMEnableRuleRunnable$RMToggleRuleComposerCallback;->errorCallback:Lcom/belkin/wemo/rules/callback/RMToggleRuleErrorCallback;

    new-instance v1, Lcom/belkin/wemo/rules/error/RMRulesError;

    invoke-direct {v1}, Lcom/belkin/wemo/rules/error/RMRulesError;-><init>()V

    invoke-interface {v0, v1}, Lcom/belkin/wemo/rules/callback/RMToggleRuleErrorCallback;->onError(Lcom/belkin/wemo/rules/error/RMRulesError;)V

    .line 163
    :cond_0
    return-void
.end method
