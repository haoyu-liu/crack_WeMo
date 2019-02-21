.class Lcom/belkin/wemo/rules/controller/RMRulesController$1;
.super Ljava/lang/Object;
.source "RMRulesController.java"

# interfaces
.implements Lcom/belkin/wemo/rules/callback/RMResetDeviceRulesSuccessCallback;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/belkin/wemo/rules/controller/RMRulesController;->resetDeviceRules(Lorg/json/JSONObject;Lorg/apache/cordova/CallbackContext;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/belkin/wemo/rules/controller/RMRulesController;

.field final synthetic val$callbackContext:Lorg/apache/cordova/CallbackContext;


# direct methods
.method constructor <init>(Lcom/belkin/wemo/rules/controller/RMRulesController;Lorg/apache/cordova/CallbackContext;)V
    .locals 0

    .prologue
    .line 115
    iput-object p1, p0, Lcom/belkin/wemo/rules/controller/RMRulesController$1;->this$0:Lcom/belkin/wemo/rules/controller/RMRulesController;

    iput-object p2, p0, Lcom/belkin/wemo/rules/controller/RMRulesController$1;->val$callbackContext:Lorg/apache/cordova/CallbackContext;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onAllDeviceRulesReset(Ljava/lang/String;)V
    .locals 3
    .param p1, "udn"    # Ljava/lang/String;

    .prologue
    .line 119
    invoke-static {}, Lcom/belkin/wemo/rules/controller/RMRulesController;->access$000()Ljava/lang/String;

    move-result-object v0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Reset Device Rules - SUCCESS. UDN: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/belkin/utils/LogUtils;->debugLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 120
    iget-object v0, p0, Lcom/belkin/wemo/rules/controller/RMRulesController$1;->val$callbackContext:Lorg/apache/cordova/CallbackContext;

    if-eqz v0, :cond_0

    .line 121
    iget-object v0, p0, Lcom/belkin/wemo/rules/controller/RMRulesController$1;->val$callbackContext:Lorg/apache/cordova/CallbackContext;

    new-instance v1, Lorg/apache/cordova/PluginResult;

    sget-object v2, Lorg/apache/cordova/PluginResult$Status;->OK:Lorg/apache/cordova/PluginResult$Status;

    invoke-direct {v1, v2}, Lorg/apache/cordova/PluginResult;-><init>(Lorg/apache/cordova/PluginResult$Status;)V

    invoke-virtual {v0, v1}, Lorg/apache/cordova/CallbackContext;->sendPluginResult(Lorg/apache/cordova/PluginResult;)V

    .line 123
    :cond_0
    return-void
.end method
