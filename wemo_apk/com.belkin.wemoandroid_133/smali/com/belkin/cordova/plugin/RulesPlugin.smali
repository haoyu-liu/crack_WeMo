.class public Lcom/belkin/cordova/plugin/RulesPlugin;
.super Lorg/apache/cordova/CordovaPlugin;
.source "RulesPlugin.java"


# static fields
.field public static final ACTION_RULES_DELETE:I = 0x1b5c

.field public static final ACTION_RULES_EDIT:I = 0x1b5b

.field public static final ACTION_RULES_EXTRACT_FROM_DB:I = 0x1b61

.field public static final ACTION_RULES_GET_SUNRISE_TIME:I = 0x1b5e

.field public static final ACTION_RULES_GET_SUNSET_TIME:I = 0x1b5f

.field public static final ACTION_RULES_RESET_DEVICE:I = 0x1b60

.field public static final ACTION_RULES_SAVE:I = 0x1b5a

.field public static final ACTION_RULES_SHOW:I = 0x1b59

.field public static final ACTION_RULES_TOGGLE_STATE:I = 0x1b5d


# instance fields
.field private final TAG:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 19
    invoke-direct {p0}, Lorg/apache/cordova/CordovaPlugin;-><init>()V

    .line 48
    const-class v0, Lcom/belkin/cordova/plugin/RulesPlugin;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/belkin/cordova/plugin/RulesPlugin;->TAG:Ljava/lang/String;

    return-void
.end method

.method private cloneRulesDB()V
    .locals 4

    .prologue
    .line 156
    :try_start_0
    invoke-static {}, Lcom/belkin/wemo/rules/RMRulesSDK;->instance()Lcom/belkin/wemo/rules/RMRulesSDK;

    move-result-object v1

    invoke-virtual {v1}, Lcom/belkin/wemo/rules/RMRulesSDK;->getDependencyProvider()Lcom/belkin/wemo/rules/RMIRulesDependencyProvider;

    move-result-object v1

    invoke-interface {v1}, Lcom/belkin/wemo/rules/RMIRulesDependencyProvider;->provideIRulesUtils()Lcom/belkin/wemo/rules/util/RMIRulesUtils;

    move-result-object v1

    const-string v2, "0"

    const-string v3, "1"

    invoke-interface {v1, v2, v3}, Lcom/belkin/wemo/rules/util/RMIRulesUtils;->copyRulesDB(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/io/FileNotFoundException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_1

    .line 162
    :goto_0
    return-void

    .line 157
    :catch_0
    move-exception v0

    .line 158
    .local v0, "e":Ljava/io/FileNotFoundException;
    iget-object v1, p0, Lcom/belkin/cordova/plugin/RulesPlugin;->TAG:Ljava/lang/String;

    const-string v2, "FileNotFoundException while cloning rules DB: "

    invoke-static {v1, v2, v0}, Lcom/belkin/utils/LogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_0

    .line 159
    .end local v0    # "e":Ljava/io/FileNotFoundException;
    :catch_1
    move-exception v0

    .line 160
    .local v0, "e":Ljava/io/IOException;
    iget-object v1, p0, Lcom/belkin/cordova/plugin/RulesPlugin;->TAG:Ljava/lang/String;

    const-string v2, "IOException while cloning rules DB: "

    invoke-static {v1, v2, v0}, Lcom/belkin/utils/LogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_0
.end method


# virtual methods
.method public execute(Ljava/lang/String;Lorg/json/JSONArray;Lorg/apache/cordova/CallbackContext;)Z
    .locals 11
    .param p1, "action"    # Ljava/lang/String;
    .param p2, "jArray"    # Lorg/json/JSONArray;
    .param p3, "callbackContext"    # Lorg/apache/cordova/CallbackContext;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .prologue
    const/4 v10, 0x1

    const/4 v9, 0x0

    .line 59
    const/4 v2, 0x1

    .line 61
    .local v2, "isActionValid":Z
    invoke-static {p1}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v0

    .line 62
    .local v0, "actionID":I
    const-class v6, Lcom/belkin/cordova/plugin/RulesPlugin;

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "execute(): ActionID = "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, "; JSONArray Params: "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v6, v7}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/Class;Ljava/lang/String;)V

    .line 64
    packed-switch v0, :pswitch_data_0

    .line 146
    const-class v6, Lcom/belkin/cordova/plugin/RulesPlugin;

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "execute(): Invalid action ID = "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v6, v7}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/Class;Ljava/lang/String;)V

    .line 147
    const/4 v2, 0x0

    .line 151
    :goto_0
    return v2

    .line 67
    :pswitch_0
    sget-object v6, Lcom/belkin/wemo/rules/controller/RMRulesController;->INSTANCE:Lcom/belkin/wemo/rules/controller/RMRulesController;

    invoke-virtual {v6, p3}, Lcom/belkin/wemo/rules/controller/RMRulesController;->fetchRules(Lorg/apache/cordova/CallbackContext;)V

    goto :goto_0

    .line 71
    :pswitch_1
    if-eqz p2, :cond_0

    invoke-virtual {p2}, Lorg/json/JSONArray;->length()I

    move-result v6

    if-lt v6, v10, :cond_0

    .line 72
    invoke-direct {p0}, Lcom/belkin/cordova/plugin/RulesPlugin;->cloneRulesDB()V

    .line 73
    invoke-virtual {p2, v9}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v3

    .line 74
    .local v3, "ruleJO":Lorg/json/JSONObject;
    sget-object v6, Lcom/belkin/wemo/rules/controller/RMRulesController;->INSTANCE:Lcom/belkin/wemo/rules/controller/RMRulesController;

    invoke-virtual {v6, v3, p3}, Lcom/belkin/wemo/rules/controller/RMRulesController;->saveNewRule(Lorg/json/JSONObject;Lorg/apache/cordova/CallbackContext;)V

    goto :goto_0

    .line 76
    .end local v3    # "ruleJO":Lorg/json/JSONObject;
    :cond_0
    new-instance v6, Lorg/apache/cordova/PluginResult;

    sget-object v7, Lorg/apache/cordova/PluginResult$Status;->ERROR:Lorg/apache/cordova/PluginResult$Status;

    const-string v8, "Parameters provided are INVALID."

    invoke-direct {v6, v7, v8}, Lorg/apache/cordova/PluginResult;-><init>(Lorg/apache/cordova/PluginResult$Status;Ljava/lang/String;)V

    invoke-virtual {p3, v6}, Lorg/apache/cordova/CallbackContext;->sendPluginResult(Lorg/apache/cordova/PluginResult;)V

    goto :goto_0

    .line 81
    :pswitch_2
    if-eqz p2, :cond_1

    invoke-virtual {p2}, Lorg/json/JSONArray;->length()I

    move-result v6

    if-lt v6, v10, :cond_1

    .line 82
    invoke-direct {p0}, Lcom/belkin/cordova/plugin/RulesPlugin;->cloneRulesDB()V

    .line 83
    invoke-virtual {p2, v9}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v3

    .line 84
    .restart local v3    # "ruleJO":Lorg/json/JSONObject;
    sget-object v6, Lcom/belkin/wemo/rules/controller/RMRulesController;->INSTANCE:Lcom/belkin/wemo/rules/controller/RMRulesController;

    invoke-virtual {v6, v3, p3}, Lcom/belkin/wemo/rules/controller/RMRulesController;->editRule(Lorg/json/JSONObject;Lorg/apache/cordova/CallbackContext;)V

    goto :goto_0

    .line 86
    .end local v3    # "ruleJO":Lorg/json/JSONObject;
    :cond_1
    new-instance v6, Lorg/apache/cordova/PluginResult;

    sget-object v7, Lorg/apache/cordova/PluginResult$Status;->ERROR:Lorg/apache/cordova/PluginResult$Status;

    const-string v8, "Parameters provided are INVALID."

    invoke-direct {v6, v7, v8}, Lorg/apache/cordova/PluginResult;-><init>(Lorg/apache/cordova/PluginResult$Status;Ljava/lang/String;)V

    invoke-virtual {p3, v6}, Lorg/apache/cordova/CallbackContext;->sendPluginResult(Lorg/apache/cordova/PluginResult;)V

    goto :goto_0

    .line 91
    :pswitch_3
    if-eqz p2, :cond_2

    invoke-virtual {p2}, Lorg/json/JSONArray;->length()I

    move-result v6

    if-lt v6, v10, :cond_2

    .line 92
    invoke-direct {p0}, Lcom/belkin/cordova/plugin/RulesPlugin;->cloneRulesDB()V

    .line 93
    invoke-virtual {p2, v9}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v3

    .line 94
    .restart local v3    # "ruleJO":Lorg/json/JSONObject;
    sget-object v6, Lcom/belkin/wemo/rules/controller/RMRulesController;->INSTANCE:Lcom/belkin/wemo/rules/controller/RMRulesController;

    invoke-virtual {v6, v3, p3}, Lcom/belkin/wemo/rules/controller/RMRulesController;->deleteRule(Lorg/json/JSONObject;Lorg/apache/cordova/CallbackContext;)V

    goto :goto_0

    .line 96
    .end local v3    # "ruleJO":Lorg/json/JSONObject;
    :cond_2
    new-instance v6, Lorg/apache/cordova/PluginResult;

    sget-object v7, Lorg/apache/cordova/PluginResult$Status;->ERROR:Lorg/apache/cordova/PluginResult$Status;

    const-string v8, "Parameters provided are INVALID."

    invoke-direct {v6, v7, v8}, Lorg/apache/cordova/PluginResult;-><init>(Lorg/apache/cordova/PluginResult$Status;Ljava/lang/String;)V

    invoke-virtual {p3, v6}, Lorg/apache/cordova/CallbackContext;->sendPluginResult(Lorg/apache/cordova/PluginResult;)V

    goto :goto_0

    .line 101
    :pswitch_4
    if-eqz p2, :cond_3

    invoke-virtual {p2}, Lorg/json/JSONArray;->length()I

    move-result v6

    if-lt v6, v10, :cond_3

    .line 102
    invoke-direct {p0}, Lcom/belkin/cordova/plugin/RulesPlugin;->cloneRulesDB()V

    .line 103
    invoke-virtual {p2, v9}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v3

    .line 104
    .restart local v3    # "ruleJO":Lorg/json/JSONObject;
    sget-object v6, Lcom/belkin/wemo/rules/controller/RMRulesController;->INSTANCE:Lcom/belkin/wemo/rules/controller/RMRulesController;

    invoke-virtual {v6, v3, p3}, Lcom/belkin/wemo/rules/controller/RMRulesController;->toggleRule(Lorg/json/JSONObject;Lorg/apache/cordova/CallbackContext;)V

    goto/16 :goto_0

    .line 106
    .end local v3    # "ruleJO":Lorg/json/JSONObject;
    :cond_3
    new-instance v6, Lorg/apache/cordova/PluginResult;

    sget-object v7, Lorg/apache/cordova/PluginResult$Status;->ERROR:Lorg/apache/cordova/PluginResult$Status;

    const-string v8, "Parameters provided are INVALID."

    invoke-direct {v6, v7, v8}, Lorg/apache/cordova/PluginResult;-><init>(Lorg/apache/cordova/PluginResult$Status;Ljava/lang/String;)V

    invoke-virtual {p3, v6}, Lorg/apache/cordova/CallbackContext;->sendPluginResult(Lorg/apache/cordova/PluginResult;)V

    goto/16 :goto_0

    .line 111
    :pswitch_5
    if-eqz p2, :cond_4

    invoke-virtual {p2}, Lorg/json/JSONArray;->length()I

    move-result v6

    if-lt v6, v10, :cond_4

    .line 112
    invoke-virtual {p2, v9}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v1

    .line 113
    .local v1, "dayIDJO":Lorg/json/JSONObject;
    sget-object v6, Lcom/belkin/wemo/rules/controller/RMRulesController;->INSTANCE:Lcom/belkin/wemo/rules/controller/RMRulesController;

    invoke-virtual {v6, v1}, Lcom/belkin/wemo/rules/controller/RMRulesController;->getSunriseTime(Lorg/json/JSONObject;)D

    move-result-wide v4

    .line 114
    .local v4, "time":D
    new-instance v6, Lorg/apache/cordova/PluginResult;

    sget-object v7, Lorg/apache/cordova/PluginResult$Status;->OK:Lorg/apache/cordova/PluginResult$Status;

    double-to-float v8, v4

    invoke-direct {v6, v7, v8}, Lorg/apache/cordova/PluginResult;-><init>(Lorg/apache/cordova/PluginResult$Status;F)V

    invoke-virtual {p3, v6}, Lorg/apache/cordova/CallbackContext;->sendPluginResult(Lorg/apache/cordova/PluginResult;)V

    goto/16 :goto_0

    .line 116
    .end local v1    # "dayIDJO":Lorg/json/JSONObject;
    .end local v4    # "time":D
    :cond_4
    new-instance v6, Lorg/apache/cordova/PluginResult;

    sget-object v7, Lorg/apache/cordova/PluginResult$Status;->ERROR:Lorg/apache/cordova/PluginResult$Status;

    const-string v8, "Parameters provided are INVALID."

    invoke-direct {v6, v7, v8}, Lorg/apache/cordova/PluginResult;-><init>(Lorg/apache/cordova/PluginResult$Status;Ljava/lang/String;)V

    invoke-virtual {p3, v6}, Lorg/apache/cordova/CallbackContext;->sendPluginResult(Lorg/apache/cordova/PluginResult;)V

    goto/16 :goto_0

    .line 121
    :pswitch_6
    if-eqz p2, :cond_5

    invoke-virtual {p2}, Lorg/json/JSONArray;->length()I

    move-result v6

    if-lt v6, v10, :cond_5

    .line 122
    invoke-virtual {p2, v9}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v1

    .line 123
    .restart local v1    # "dayIDJO":Lorg/json/JSONObject;
    sget-object v6, Lcom/belkin/wemo/rules/controller/RMRulesController;->INSTANCE:Lcom/belkin/wemo/rules/controller/RMRulesController;

    invoke-virtual {v6, v1}, Lcom/belkin/wemo/rules/controller/RMRulesController;->getSunsetTime(Lorg/json/JSONObject;)D

    move-result-wide v4

    .line 124
    .restart local v4    # "time":D
    new-instance v6, Lorg/apache/cordova/PluginResult;

    sget-object v7, Lorg/apache/cordova/PluginResult$Status;->OK:Lorg/apache/cordova/PluginResult$Status;

    double-to-float v8, v4

    invoke-direct {v6, v7, v8}, Lorg/apache/cordova/PluginResult;-><init>(Lorg/apache/cordova/PluginResult$Status;F)V

    invoke-virtual {p3, v6}, Lorg/apache/cordova/CallbackContext;->sendPluginResult(Lorg/apache/cordova/PluginResult;)V

    goto/16 :goto_0

    .line 126
    .end local v1    # "dayIDJO":Lorg/json/JSONObject;
    .end local v4    # "time":D
    :cond_5
    new-instance v6, Lorg/apache/cordova/PluginResult;

    sget-object v7, Lorg/apache/cordova/PluginResult$Status;->ERROR:Lorg/apache/cordova/PluginResult$Status;

    const-string v8, "Parameters provided are INVALID."

    invoke-direct {v6, v7, v8}, Lorg/apache/cordova/PluginResult;-><init>(Lorg/apache/cordova/PluginResult$Status;Ljava/lang/String;)V

    invoke-virtual {p3, v6}, Lorg/apache/cordova/CallbackContext;->sendPluginResult(Lorg/apache/cordova/PluginResult;)V

    goto/16 :goto_0

    .line 131
    :pswitch_7
    if-eqz p2, :cond_6

    invoke-virtual {p2}, Lorg/json/JSONArray;->length()I

    move-result v6

    if-lt v6, v10, :cond_6

    .line 132
    invoke-direct {p0}, Lcom/belkin/cordova/plugin/RulesPlugin;->cloneRulesDB()V

    .line 133
    invoke-virtual {p2, v9}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v1

    .line 134
    .restart local v1    # "dayIDJO":Lorg/json/JSONObject;
    sget-object v6, Lcom/belkin/wemo/rules/controller/RMRulesController;->INSTANCE:Lcom/belkin/wemo/rules/controller/RMRulesController;

    invoke-virtual {v6, v1}, Lcom/belkin/wemo/rules/controller/RMRulesController;->getSunsetTime(Lorg/json/JSONObject;)D

    move-result-wide v4

    .line 135
    .restart local v4    # "time":D
    new-instance v6, Lorg/apache/cordova/PluginResult;

    sget-object v7, Lorg/apache/cordova/PluginResult$Status;->OK:Lorg/apache/cordova/PluginResult$Status;

    double-to-float v8, v4

    invoke-direct {v6, v7, v8}, Lorg/apache/cordova/PluginResult;-><init>(Lorg/apache/cordova/PluginResult$Status;F)V

    invoke-virtual {p3, v6}, Lorg/apache/cordova/CallbackContext;->sendPluginResult(Lorg/apache/cordova/PluginResult;)V

    goto/16 :goto_0

    .line 137
    .end local v1    # "dayIDJO":Lorg/json/JSONObject;
    .end local v4    # "time":D
    :cond_6
    new-instance v6, Lorg/apache/cordova/PluginResult;

    sget-object v7, Lorg/apache/cordova/PluginResult$Status;->ERROR:Lorg/apache/cordova/PluginResult$Status;

    const-string v8, "Parameters provided are INVALID."

    invoke-direct {v6, v7, v8}, Lorg/apache/cordova/PluginResult;-><init>(Lorg/apache/cordova/PluginResult$Status;Ljava/lang/String;)V

    invoke-virtual {p3, v6}, Lorg/apache/cordova/CallbackContext;->sendPluginResult(Lorg/apache/cordova/PluginResult;)V

    goto/16 :goto_0

    .line 142
    :pswitch_8
    sget-object v6, Lcom/belkin/wemo/rules/controller/RMRulesController;->INSTANCE:Lcom/belkin/wemo/rules/controller/RMRulesController;

    invoke-virtual {v6, p3}, Lcom/belkin/wemo/rules/controller/RMRulesController;->extractRulesFromDB(Lorg/apache/cordova/CallbackContext;)V

    goto/16 :goto_0

    .line 64
    nop

    :pswitch_data_0
    .packed-switch 0x1b59
        :pswitch_0
        :pswitch_1
        :pswitch_2
        :pswitch_3
        :pswitch_4
        :pswitch_5
        :pswitch_6
        :pswitch_7
        :pswitch_8
    .end packed-switch
.end method

.method public initialize(Lorg/apache/cordova/CordovaInterface;Lorg/apache/cordova/CordovaWebView;)V
    .locals 0
    .param p1, "cordova"    # Lorg/apache/cordova/CordovaInterface;
    .param p2, "webView"    # Lorg/apache/cordova/CordovaWebView;

    .prologue
    .line 53
    invoke-super {p0, p1, p2}, Lorg/apache/cordova/CordovaPlugin;->initialize(Lorg/apache/cordova/CordovaInterface;Lorg/apache/cordova/CordovaWebView;)V

    .line 54
    return-void
.end method
