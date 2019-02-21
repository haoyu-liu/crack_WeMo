.class Lcom/belkin/wemo/rules/device/runnable/StoreDeviceRulesStoreSupportRunnable$StoreRulesActionCallback;
.super Ljava/lang/Object;
.source "StoreDeviceRulesStoreSupportRunnable.java"

# interfaces
.implements Lcom/belkin/cybergarage/wrapper/ControlActionHandler$ControlActionErrorCallback;
.implements Lcom/belkin/cybergarage/wrapper/ControlActionHandler$ControlActionSuccessCallback;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/belkin/wemo/rules/device/runnable/StoreDeviceRulesStoreSupportRunnable;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "StoreRulesActionCallback"
.end annotation


# instance fields
.field private deviceUdn:Ljava/lang/String;

.field final synthetic this$0:Lcom/belkin/wemo/rules/device/runnable/StoreDeviceRulesStoreSupportRunnable;


# direct methods
.method constructor <init>(Lcom/belkin/wemo/rules/device/runnable/StoreDeviceRulesStoreSupportRunnable;Ljava/lang/String;)V
    .locals 0
    .param p2, "deviceUdn"    # Ljava/lang/String;

    .prologue
    .line 145
    iput-object p1, p0, Lcom/belkin/wemo/rules/device/runnable/StoreDeviceRulesStoreSupportRunnable$StoreRulesActionCallback;->this$0:Lcom/belkin/wemo/rules/device/runnable/StoreDeviceRulesStoreSupportRunnable;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 146
    iput-object p2, p0, Lcom/belkin/wemo/rules/device/runnable/StoreDeviceRulesStoreSupportRunnable$StoreRulesActionCallback;->deviceUdn:Ljava/lang/String;

    .line 147
    return-void
.end method


# virtual methods
.method public onActionError(Ljava/lang/Exception;)V
    .locals 4
    .param p1, "e"    # Ljava/lang/Exception;

    .prologue
    .line 159
    iget-object v2, p0, Lcom/belkin/wemo/rules/device/runnable/StoreDeviceRulesStoreSupportRunnable$StoreRulesActionCallback;->this$0:Lcom/belkin/wemo/rules/device/runnable/StoreDeviceRulesStoreSupportRunnable;

    invoke-static {v2}, Lcom/belkin/wemo/rules/device/runnable/StoreDeviceRulesStoreSupportRunnable;->access$000(Lcom/belkin/wemo/rules/device/runnable/StoreDeviceRulesStoreSupportRunnable;)Lcom/belkin/wemo/rules/device/callback/StoreDeviceRulesCallback;

    move-result-object v2

    if-eqz v2, :cond_0

    .line 160
    const/4 v0, 0x0

    .line 161
    .local v0, "error":Lcom/belkin/wemo/rules/device/error/RuleDeviceError;
    invoke-virtual {p1}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v1

    .line 162
    .local v1, "message":Ljava/lang/String;
    const-string v2, "Socket connection error while trying to post uPnP Action."

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 163
    new-instance v0, Lcom/belkin/wemo/rules/device/error/RuleDeviceError;

    .end local v0    # "error":Lcom/belkin/wemo/rules/device/error/RuleDeviceError;
    const/16 v2, -0xc8

    iget-object v3, p0, Lcom/belkin/wemo/rules/device/runnable/StoreDeviceRulesStoreSupportRunnable$StoreRulesActionCallback;->deviceUdn:Ljava/lang/String;

    invoke-direct {v0, v2, v1, v3}, Lcom/belkin/wemo/rules/device/error/RuleDeviceError;-><init>(ILjava/lang/String;Ljava/lang/String;)V

    .line 167
    .restart local v0    # "error":Lcom/belkin/wemo/rules/device/error/RuleDeviceError;
    :goto_0
    iget-object v2, p0, Lcom/belkin/wemo/rules/device/runnable/StoreDeviceRulesStoreSupportRunnable$StoreRulesActionCallback;->this$0:Lcom/belkin/wemo/rules/device/runnable/StoreDeviceRulesStoreSupportRunnable;

    invoke-static {v2}, Lcom/belkin/wemo/rules/device/runnable/StoreDeviceRulesStoreSupportRunnable;->access$000(Lcom/belkin/wemo/rules/device/runnable/StoreDeviceRulesStoreSupportRunnable;)Lcom/belkin/wemo/rules/device/callback/StoreDeviceRulesCallback;

    move-result-object v2

    invoke-interface {v2, v0}, Lcom/belkin/wemo/rules/device/callback/StoreDeviceRulesCallback;->onError(Lcom/belkin/wemo/rules/device/error/RuleDeviceError;)V

    .line 169
    .end local v0    # "error":Lcom/belkin/wemo/rules/device/error/RuleDeviceError;
    .end local v1    # "message":Ljava/lang/String;
    :cond_0
    return-void

    .line 165
    .restart local v0    # "error":Lcom/belkin/wemo/rules/device/error/RuleDeviceError;
    .restart local v1    # "message":Ljava/lang/String;
    :cond_1
    new-instance v0, Lcom/belkin/wemo/rules/device/error/RuleDeviceError;

    .end local v0    # "error":Lcom/belkin/wemo/rules/device/error/RuleDeviceError;
    iget-object v2, p0, Lcom/belkin/wemo/rules/device/runnable/StoreDeviceRulesStoreSupportRunnable$StoreRulesActionCallback;->deviceUdn:Ljava/lang/String;

    invoke-direct {v0, v2}, Lcom/belkin/wemo/rules/device/error/RuleDeviceError;-><init>(Ljava/lang/String;)V

    .restart local v0    # "error":Lcom/belkin/wemo/rules/device/error/RuleDeviceError;
    goto :goto_0
.end method

.method public onActionSuccess(Ljava/lang/String;)V
    .locals 3
    .param p1, "responseXMLStr"    # Ljava/lang/String;

    .prologue
    .line 152
    iget-object v0, p0, Lcom/belkin/wemo/rules/device/runnable/StoreDeviceRulesStoreSupportRunnable$StoreRulesActionCallback;->this$0:Lcom/belkin/wemo/rules/device/runnable/StoreDeviceRulesStoreSupportRunnable;

    invoke-static {v0}, Lcom/belkin/wemo/rules/device/runnable/StoreDeviceRulesStoreSupportRunnable;->access$000(Lcom/belkin/wemo/rules/device/runnable/StoreDeviceRulesStoreSupportRunnable;)Lcom/belkin/wemo/rules/device/callback/StoreDeviceRulesCallback;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 153
    iget-object v0, p0, Lcom/belkin/wemo/rules/device/runnable/StoreDeviceRulesStoreSupportRunnable$StoreRulesActionCallback;->this$0:Lcom/belkin/wemo/rules/device/runnable/StoreDeviceRulesStoreSupportRunnable;

    iget-object v1, p0, Lcom/belkin/wemo/rules/device/runnable/StoreDeviceRulesStoreSupportRunnable$StoreRulesActionCallback;->this$0:Lcom/belkin/wemo/rules/device/runnable/StoreDeviceRulesStoreSupportRunnable;

    invoke-static {v1, p1}, Lcom/belkin/wemo/rules/device/runnable/StoreDeviceRulesStoreSupportRunnable;->access$100(Lcom/belkin/wemo/rules/device/runnable/StoreDeviceRulesStoreSupportRunnable;Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v1

    iget-object v2, p0, Lcom/belkin/wemo/rules/device/runnable/StoreDeviceRulesStoreSupportRunnable$StoreRulesActionCallback;->deviceUdn:Ljava/lang/String;

    invoke-static {v0, v1, v2}, Lcom/belkin/wemo/rules/device/runnable/StoreDeviceRulesStoreSupportRunnable;->access$200(Lcom/belkin/wemo/rules/device/runnable/StoreDeviceRulesStoreSupportRunnable;Lorg/json/JSONObject;Ljava/lang/String;)V

    .line 155
    :cond_0
    return-void
.end method
