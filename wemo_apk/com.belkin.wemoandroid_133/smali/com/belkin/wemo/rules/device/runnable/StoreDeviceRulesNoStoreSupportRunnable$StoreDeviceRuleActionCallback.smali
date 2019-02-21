.class abstract Lcom/belkin/wemo/rules/device/runnable/StoreDeviceRulesNoStoreSupportRunnable$StoreDeviceRuleActionCallback;
.super Ljava/lang/Object;
.source "StoreDeviceRulesNoStoreSupportRunnable.java"

# interfaces
.implements Lcom/belkin/cybergarage/wrapper/ControlActionHandler$ControlActionErrorCallback;
.implements Lcom/belkin/cybergarage/wrapper/ControlActionHandler$ControlActionSuccessCallback;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/belkin/wemo/rules/device/runnable/StoreDeviceRulesNoStoreSupportRunnable;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x402
    name = "StoreDeviceRuleActionCallback"
.end annotation


# instance fields
.field protected deviceUdn:Ljava/lang/String;

.field final synthetic this$0:Lcom/belkin/wemo/rules/device/runnable/StoreDeviceRulesNoStoreSupportRunnable;


# direct methods
.method public constructor <init>(Lcom/belkin/wemo/rules/device/runnable/StoreDeviceRulesNoStoreSupportRunnable;Ljava/lang/String;)V
    .locals 0
    .param p2, "deviceUdn"    # Ljava/lang/String;

    .prologue
    .line 240
    iput-object p1, p0, Lcom/belkin/wemo/rules/device/runnable/StoreDeviceRulesNoStoreSupportRunnable$StoreDeviceRuleActionCallback;->this$0:Lcom/belkin/wemo/rules/device/runnable/StoreDeviceRulesNoStoreSupportRunnable;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 241
    iput-object p2, p0, Lcom/belkin/wemo/rules/device/runnable/StoreDeviceRulesNoStoreSupportRunnable$StoreDeviceRuleActionCallback;->deviceUdn:Ljava/lang/String;

    .line 242
    return-void
.end method


# virtual methods
.method public onActionError(Ljava/lang/Exception;)V
    .locals 4
    .param p1, "e"    # Ljava/lang/Exception;

    .prologue
    .line 248
    invoke-virtual {p0, p1}, Lcom/belkin/wemo/rules/device/runnable/StoreDeviceRulesNoStoreSupportRunnable$StoreDeviceRuleActionCallback;->onExceptionEncountered(Ljava/lang/Exception;)V

    .line 250
    iget-object v2, p0, Lcom/belkin/wemo/rules/device/runnable/StoreDeviceRulesNoStoreSupportRunnable$StoreDeviceRuleActionCallback;->this$0:Lcom/belkin/wemo/rules/device/runnable/StoreDeviceRulesNoStoreSupportRunnable;

    invoke-static {v2}, Lcom/belkin/wemo/rules/device/runnable/StoreDeviceRulesNoStoreSupportRunnable;->access$000(Lcom/belkin/wemo/rules/device/runnable/StoreDeviceRulesNoStoreSupportRunnable;)Lcom/belkin/wemo/rules/device/callback/StoreDeviceRulesCallback;

    move-result-object v2

    if-eqz v2, :cond_0

    .line 251
    const/4 v0, 0x0

    .line 252
    .local v0, "error":Lcom/belkin/wemo/rules/device/error/RuleDeviceError;
    invoke-virtual {p1}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v1

    .line 253
    .local v1, "message":Ljava/lang/String;
    const-string v2, "Socket connection error while trying to post uPnP Action."

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 254
    new-instance v0, Lcom/belkin/wemo/rules/device/error/RuleDeviceError;

    .end local v0    # "error":Lcom/belkin/wemo/rules/device/error/RuleDeviceError;
    const/16 v2, -0xc8

    iget-object v3, p0, Lcom/belkin/wemo/rules/device/runnable/StoreDeviceRulesNoStoreSupportRunnable$StoreDeviceRuleActionCallback;->deviceUdn:Ljava/lang/String;

    invoke-direct {v0, v2, v1, v3}, Lcom/belkin/wemo/rules/device/error/RuleDeviceError;-><init>(ILjava/lang/String;Ljava/lang/String;)V

    .line 259
    .restart local v0    # "error":Lcom/belkin/wemo/rules/device/error/RuleDeviceError;
    :goto_0
    iget-object v2, p0, Lcom/belkin/wemo/rules/device/runnable/StoreDeviceRulesNoStoreSupportRunnable$StoreDeviceRuleActionCallback;->this$0:Lcom/belkin/wemo/rules/device/runnable/StoreDeviceRulesNoStoreSupportRunnable;

    invoke-static {v2}, Lcom/belkin/wemo/rules/device/runnable/StoreDeviceRulesNoStoreSupportRunnable;->access$000(Lcom/belkin/wemo/rules/device/runnable/StoreDeviceRulesNoStoreSupportRunnable;)Lcom/belkin/wemo/rules/device/callback/StoreDeviceRulesCallback;

    move-result-object v2

    invoke-interface {v2, v0}, Lcom/belkin/wemo/rules/device/callback/StoreDeviceRulesCallback;->onError(Lcom/belkin/wemo/rules/device/error/RuleDeviceError;)V

    .line 261
    .end local v0    # "error":Lcom/belkin/wemo/rules/device/error/RuleDeviceError;
    .end local v1    # "message":Ljava/lang/String;
    :cond_0
    return-void

    .line 256
    .restart local v0    # "error":Lcom/belkin/wemo/rules/device/error/RuleDeviceError;
    .restart local v1    # "message":Ljava/lang/String;
    :cond_1
    new-instance v0, Lcom/belkin/wemo/rules/device/error/RuleDeviceError;

    .end local v0    # "error":Lcom/belkin/wemo/rules/device/error/RuleDeviceError;
    iget-object v2, p0, Lcom/belkin/wemo/rules/device/runnable/StoreDeviceRulesNoStoreSupportRunnable$StoreDeviceRuleActionCallback;->deviceUdn:Ljava/lang/String;

    invoke-direct {v0, v2}, Lcom/belkin/wemo/rules/device/error/RuleDeviceError;-><init>(Ljava/lang/String;)V

    .line 257
    .restart local v0    # "error":Lcom/belkin/wemo/rules/device/error/RuleDeviceError;
    invoke-virtual {v0, v1}, Lcom/belkin/wemo/rules/device/error/RuleDeviceError;->setErrorMessage(Ljava/lang/String;)V

    goto :goto_0
.end method

.method protected abstract onExceptionEncountered(Ljava/lang/Exception;)V
.end method
