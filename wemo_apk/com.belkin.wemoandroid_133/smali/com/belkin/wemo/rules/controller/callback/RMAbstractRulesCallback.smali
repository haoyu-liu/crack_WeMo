.class public abstract Lcom/belkin/wemo/rules/controller/callback/RMAbstractRulesCallback;
.super Ljava/lang/Object;
.source "RMAbstractRulesCallback.java"


# instance fields
.field protected final TAG:Ljava/lang/String;

.field protected callbackContext:Lorg/apache/cordova/CallbackContext;

.field protected rule:Lcom/belkin/wemo/rules/data/RMRule;


# direct methods
.method public constructor <init>(Lorg/apache/cordova/CallbackContext;Lcom/belkin/wemo/rules/data/RMRule;)V
    .locals 1
    .param p1, "callbackContext"    # Lorg/apache/cordova/CallbackContext;
    .param p2, "rule"    # Lcom/belkin/wemo/rules/data/RMRule;

    .prologue
    .line 15
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 16
    iput-object p1, p0, Lcom/belkin/wemo/rules/controller/callback/RMAbstractRulesCallback;->callbackContext:Lorg/apache/cordova/CallbackContext;

    .line 17
    iput-object p2, p0, Lcom/belkin/wemo/rules/controller/callback/RMAbstractRulesCallback;->rule:Lcom/belkin/wemo/rules/data/RMRule;

    .line 18
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/belkin/wemo/rules/controller/callback/RMAbstractRulesCallback;->TAG:Ljava/lang/String;

    .line 19
    return-void
.end method


# virtual methods
.method protected sendError(Lcom/belkin/wemo/error/WeMoError;)V
    .locals 3
    .param p1, "error"    # Lcom/belkin/wemo/error/WeMoError;

    .prologue
    .line 36
    iget-object v1, p0, Lcom/belkin/wemo/rules/controller/callback/RMAbstractRulesCallback;->callbackContext:Lorg/apache/cordova/CallbackContext;

    if-eqz v1, :cond_0

    .line 37
    new-instance v0, Lorg/apache/cordova/PluginResult;

    sget-object v1, Lorg/apache/cordova/PluginResult$Status;->ERROR:Lorg/apache/cordova/PluginResult$Status;

    invoke-virtual {p1}, Lcom/belkin/wemo/error/WeMoError;->toJson()Lorg/json/JSONObject;

    move-result-object v2

    invoke-direct {v0, v1, v2}, Lorg/apache/cordova/PluginResult;-><init>(Lorg/apache/cordova/PluginResult$Status;Lorg/json/JSONObject;)V

    .line 38
    .local v0, "showRulesResult":Lorg/apache/cordova/PluginResult;
    iget-object v1, p0, Lcom/belkin/wemo/rules/controller/callback/RMAbstractRulesCallback;->callbackContext:Lorg/apache/cordova/CallbackContext;

    invoke-virtual {v1, v0}, Lorg/apache/cordova/CallbackContext;->sendPluginResult(Lorg/apache/cordova/PluginResult;)V

    .line 40
    .end local v0    # "showRulesResult":Lorg/apache/cordova/PluginResult;
    :cond_0
    return-void
.end method
