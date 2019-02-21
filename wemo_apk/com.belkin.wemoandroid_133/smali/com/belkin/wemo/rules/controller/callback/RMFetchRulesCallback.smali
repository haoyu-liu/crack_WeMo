.class public Lcom/belkin/wemo/rules/controller/callback/RMFetchRulesCallback;
.super Lcom/belkin/wemo/rules/controller/callback/RMAbstractRulesCallback;
.source "RMFetchRulesCallback.java"

# interfaces
.implements Lcom/belkin/wemo/rules/callback/RMShowRulesErrorCallback;
.implements Lcom/belkin/wemo/rules/callback/RMShowRulesSuccessCallback;


# direct methods
.method public constructor <init>(Lorg/apache/cordova/CallbackContext;)V
    .locals 1
    .param p1, "callbackContext"    # Lorg/apache/cordova/CallbackContext;

    .prologue
    .line 21
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lcom/belkin/wemo/rules/controller/callback/RMAbstractRulesCallback;-><init>(Lorg/apache/cordova/CallbackContext;Lcom/belkin/wemo/rules/data/RMRule;)V

    .line 22
    return-void
.end method

.method private getRulesJSONArray(Ljava/util/List;)Lorg/json/JSONArray;
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lcom/belkin/wemo/rules/data/RMRule;",
            ">;)",
            "Lorg/json/JSONArray;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .prologue
    .line 44
    .local p1, "rulesList":Ljava/util/List;, "Ljava/util/List<Lcom/belkin/wemo/rules/data/RMRule;>;"
    new-instance v3, Lorg/json/JSONArray;

    invoke-direct {v3}, Lorg/json/JSONArray;-><init>()V

    .line 45
    .local v3, "rulesJA":Lorg/json/JSONArray;
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "i$":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/belkin/wemo/rules/data/RMRule;

    .line 46
    .local v1, "rule":Lcom/belkin/wemo/rules/data/RMRule;
    new-instance v4, Lorg/json/JSONObject;

    invoke-direct {v4}, Lorg/json/JSONObject;-><init>()V

    invoke-virtual {v1, v4}, Lcom/belkin/wemo/rules/data/RMRule;->toJSON(Lorg/json/JSONObject;)Lorg/json/JSONObject;

    move-result-object v2

    .line 47
    .local v2, "ruleJO":Lorg/json/JSONObject;
    invoke-virtual {v3, v2}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;

    goto :goto_0

    .line 49
    .end local v1    # "rule":Lcom/belkin/wemo/rules/data/RMRule;
    .end local v2    # "ruleJO":Lorg/json/JSONObject;
    :cond_0
    iget-object v4, p0, Lcom/belkin/wemo/rules/controller/callback/RMFetchRulesCallback;->TAG:Ljava/lang/String;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "Fetch Rules: JSONArray of Rules List: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Lcom/belkin/utils/LogUtils;->debugLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 50
    return-object v3
.end method


# virtual methods
.method public onError(Lcom/belkin/wemo/rules/error/RMRulesError;)V
    .locals 0
    .param p1, "error"    # Lcom/belkin/wemo/rules/error/RMRulesError;

    .prologue
    .line 26
    invoke-virtual {p0, p1}, Lcom/belkin/wemo/rules/controller/callback/RMFetchRulesCallback;->sendError(Lcom/belkin/wemo/error/WeMoError;)V

    .line 27
    return-void
.end method

.method public onSuccess(Ljava/util/List;)V
    .locals 5
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
    .line 31
    .local p1, "rulesList":Ljava/util/List;, "Ljava/util/List<Lcom/belkin/wemo/rules/data/RMRule;>;"
    iget-object v2, p0, Lcom/belkin/wemo/rules/controller/callback/RMFetchRulesCallback;->callbackContext:Lorg/apache/cordova/CallbackContext;

    if-eqz v2, :cond_0

    .line 34
    :try_start_0
    new-instance v1, Lorg/apache/cordova/PluginResult;

    sget-object v2, Lorg/apache/cordova/PluginResult$Status;->OK:Lorg/apache/cordova/PluginResult$Status;

    invoke-direct {p0, p1}, Lcom/belkin/wemo/rules/controller/callback/RMFetchRulesCallback;->getRulesJSONArray(Ljava/util/List;)Lorg/json/JSONArray;

    move-result-object v3

    invoke-direct {v1, v2, v3}, Lorg/apache/cordova/PluginResult;-><init>(Lorg/apache/cordova/PluginResult$Status;Lorg/json/JSONArray;)V

    .line 35
    .local v1, "showRulesResult":Lorg/apache/cordova/PluginResult;
    iget-object v2, p0, Lcom/belkin/wemo/rules/controller/callback/RMFetchRulesCallback;->callbackContext:Lorg/apache/cordova/CallbackContext;

    invoke-virtual {v2, v1}, Lorg/apache/cordova/CallbackContext;->sendPluginResult(Lorg/apache/cordova/PluginResult;)V
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 41
    .end local v1    # "showRulesResult":Lorg/apache/cordova/PluginResult;
    :cond_0
    :goto_0
    return-void

    .line 36
    :catch_0
    move-exception v0

    .line 37
    .local v0, "e":Lorg/json/JSONException;
    iget-object v2, p0, Lcom/belkin/wemo/rules/controller/callback/RMFetchRulesCallback;->TAG:Ljava/lang/String;

    const-string v3, "Fetch Rules: JSONException while converting rules list to JSONArray: "

    invoke-static {v2, v3, v0}, Lcom/belkin/utils/LogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 38
    new-instance v2, Lcom/belkin/wemo/rules/error/RMRulesError;

    const/4 v3, -0x1

    const-string v4, "Error while processing Rules!"

    invoke-direct {v2, v3, v4}, Lcom/belkin/wemo/rules/error/RMRulesError;-><init>(ILjava/lang/String;)V

    invoke-virtual {p0, v2}, Lcom/belkin/wemo/rules/controller/callback/RMFetchRulesCallback;->sendError(Lcom/belkin/wemo/error/WeMoError;)V

    goto :goto_0
.end method
