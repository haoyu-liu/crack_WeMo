.class public final enum Lcom/belkin/wemo/rules/controller/RMRulesController;
.super Ljava/lang/Enum;
.source "RMRulesController.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lcom/belkin/wemo/rules/controller/RMRulesController;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/belkin/wemo/rules/controller/RMRulesController;

.field public static final enum INSTANCE:Lcom/belkin/wemo/rules/controller/RMRulesController;

.field private static final TAG:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .prologue
    const/4 v2, 0x0

    .line 31
    new-instance v0, Lcom/belkin/wemo/rules/controller/RMRulesController;

    const-string v1, "INSTANCE"

    invoke-direct {v0, v1, v2}, Lcom/belkin/wemo/rules/controller/RMRulesController;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/belkin/wemo/rules/controller/RMRulesController;->INSTANCE:Lcom/belkin/wemo/rules/controller/RMRulesController;

    .line 29
    const/4 v0, 0x1

    new-array v0, v0, [Lcom/belkin/wemo/rules/controller/RMRulesController;

    sget-object v1, Lcom/belkin/wemo/rules/controller/RMRulesController;->INSTANCE:Lcom/belkin/wemo/rules/controller/RMRulesController;

    aput-object v1, v0, v2

    sput-object v0, Lcom/belkin/wemo/rules/controller/RMRulesController;->$VALUES:[Lcom/belkin/wemo/rules/controller/RMRulesController;

    .line 33
    const-class v0, Lcom/belkin/wemo/rules/controller/RMRulesController;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/belkin/wemo/rules/controller/RMRulesController;->TAG:Ljava/lang/String;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;I)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .prologue
    .line 35
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    .line 37
    return-void
.end method

.method static synthetic access$000()Ljava/lang/String;
    .locals 1

    .prologue
    .line 29
    sget-object v0, Lcom/belkin/wemo/rules/controller/RMRulesController;->TAG:Ljava/lang/String;

    return-object v0
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/belkin/wemo/rules/controller/RMRulesController;
    .locals 1
    .param p0, "name"    # Ljava/lang/String;

    .prologue
    .line 29
    const-class v0, Lcom/belkin/wemo/rules/controller/RMRulesController;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lcom/belkin/wemo/rules/controller/RMRulesController;

    return-object v0
.end method

.method public static values()[Lcom/belkin/wemo/rules/controller/RMRulesController;
    .locals 1

    .prologue
    .line 29
    sget-object v0, Lcom/belkin/wemo/rules/controller/RMRulesController;->$VALUES:[Lcom/belkin/wemo/rules/controller/RMRulesController;

    invoke-virtual {v0}, [Lcom/belkin/wemo/rules/controller/RMRulesController;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/belkin/wemo/rules/controller/RMRulesController;

    return-object v0
.end method


# virtual methods
.method public deleteAllRules(Lorg/json/JSONArray;Lorg/apache/cordova/CallbackContext;)V
    .locals 0
    .param p1, "params"    # Lorg/json/JSONArray;
    .param p2, "callbackContext"    # Lorg/apache/cordova/CallbackContext;

    .prologue
    .line 77
    return-void
.end method

.method public deleteRule(Lorg/json/JSONObject;Lorg/apache/cordova/CallbackContext;)V
    .locals 3
    .param p1, "ruleJO"    # Lorg/json/JSONObject;
    .param p2, "callbackContext"    # Lorg/apache/cordova/CallbackContext;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .prologue
    .line 65
    const-string v2, "RULE_ID"

    invoke-virtual {p1, v2}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v1

    .line 67
    .local v1, "ruleId":I
    new-instance v0, Lcom/belkin/wemo/rules/controller/callback/RMDeleteRuleCallback;

    invoke-direct {v0, p2, v1}, Lcom/belkin/wemo/rules/controller/callback/RMDeleteRuleCallback;-><init>(Lorg/apache/cordova/CallbackContext;I)V

    .line 68
    .local v0, "callback":Lcom/belkin/wemo/rules/controller/callback/RMDeleteRuleCallback;
    invoke-static {}, Lcom/belkin/wemo/rules/RMRulesSDK;->instance()Lcom/belkin/wemo/rules/RMRulesSDK;

    move-result-object v2

    invoke-virtual {v2}, Lcom/belkin/wemo/rules/RMRulesSDK;->getRules()Lcom/belkin/wemo/rules/RMIRules;

    move-result-object v2

    invoke-interface {v2, v1, v0, v0}, Lcom/belkin/wemo/rules/RMIRules;->deleteRule(ILcom/belkin/wemo/rules/callback/RMDeleteRuleSuccessCallback;Lcom/belkin/wemo/rules/callback/RMDeleteRuleErrorCallback;)V

    .line 69
    return-void
.end method

.method public editRule(Lorg/json/JSONObject;Lorg/apache/cordova/CallbackContext;)V
    .locals 4
    .param p1, "ruleJO"    # Lorg/json/JSONObject;
    .param p2, "callbackContext"    # Lorg/apache/cordova/CallbackContext;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .prologue
    .line 47
    new-instance v3, Lcom/belkin/wemo/rules/builder/RMRuleBuilder;

    invoke-direct {v3}, Lcom/belkin/wemo/rules/builder/RMRuleBuilder;-><init>()V

    invoke-virtual {v3, p1}, Lcom/belkin/wemo/rules/builder/RMRuleBuilder;->getBuilder(Lorg/json/JSONObject;)Lcom/belkin/wemo/rules/builder/RMAbstractRuleBuilder;

    move-result-object v0

    .line 48
    .local v0, "builder":Lcom/belkin/wemo/rules/builder/RMAbstractRuleBuilder;, "Lcom/belkin/wemo/rules/builder/RMAbstractRuleBuilder<+Lcom/belkin/wemo/rules/data/RMRule;>;"
    invoke-virtual {v0}, Lcom/belkin/wemo/rules/builder/RMAbstractRuleBuilder;->buildExisting()Lcom/belkin/wemo/rules/data/RMRule;

    move-result-object v2

    .line 50
    .local v2, "rule":Lcom/belkin/wemo/rules/data/RMRule;
    new-instance v1, Lcom/belkin/wemo/rules/controller/callback/RMEditRuleCallback;

    invoke-direct {v1, p2, v2}, Lcom/belkin/wemo/rules/controller/callback/RMEditRuleCallback;-><init>(Lorg/apache/cordova/CallbackContext;Lcom/belkin/wemo/rules/data/RMRule;)V

    .line 51
    .local v1, "callback":Lcom/belkin/wemo/rules/controller/callback/RMEditRuleCallback;
    invoke-static {}, Lcom/belkin/wemo/rules/RMRulesSDK;->instance()Lcom/belkin/wemo/rules/RMRulesSDK;

    move-result-object v3

    invoke-virtual {v3}, Lcom/belkin/wemo/rules/RMRulesSDK;->getRules()Lcom/belkin/wemo/rules/RMIRules;

    move-result-object v3

    invoke-interface {v3, v2, v1, v1}, Lcom/belkin/wemo/rules/RMIRules;->editRule(Lcom/belkin/wemo/rules/data/RMRule;Lcom/belkin/wemo/rules/callback/RMEditRuleSuccessCallback;Lcom/belkin/wemo/rules/callback/RMEditRuleErrorCallback;)V

    .line 52
    return-void
.end method

.method public extractRulesFromDB(Lorg/apache/cordova/CallbackContext;)V
    .locals 2
    .param p1, "callbackContext"    # Lorg/apache/cordova/CallbackContext;

    .prologue
    .line 107
    new-instance v0, Lcom/belkin/wemo/rules/controller/callback/RMFetchRulesCallback;

    invoke-direct {v0, p1}, Lcom/belkin/wemo/rules/controller/callback/RMFetchRulesCallback;-><init>(Lorg/apache/cordova/CallbackContext;)V

    .line 108
    .local v0, "callback":Lcom/belkin/wemo/rules/controller/callback/RMFetchRulesCallback;
    invoke-static {}, Lcom/belkin/wemo/rules/RMRulesSDK;->instance()Lcom/belkin/wemo/rules/RMRulesSDK;

    move-result-object v1

    invoke-virtual {v1}, Lcom/belkin/wemo/rules/RMRulesSDK;->getRules()Lcom/belkin/wemo/rules/RMIRules;

    move-result-object v1

    invoke-interface {v1, v0, v0}, Lcom/belkin/wemo/rules/RMIRules;->getRulesListFromCache(Lcom/belkin/wemo/rules/callback/RMShowRulesSuccessCallback;Lcom/belkin/wemo/rules/callback/RMShowRulesErrorCallback;)V

    .line 109
    return-void
.end method

.method public fetchRules(Lorg/apache/cordova/CallbackContext;)V
    .locals 2
    .param p1, "callbackContext"    # Lorg/apache/cordova/CallbackContext;

    .prologue
    .line 40
    new-instance v0, Lcom/belkin/wemo/rules/controller/callback/RMFetchRulesCallback;

    invoke-direct {v0, p1}, Lcom/belkin/wemo/rules/controller/callback/RMFetchRulesCallback;-><init>(Lorg/apache/cordova/CallbackContext;)V

    .line 41
    .local v0, "callback":Lcom/belkin/wemo/rules/controller/callback/RMFetchRulesCallback;
    invoke-static {}, Lcom/belkin/wemo/rules/RMRulesSDK;->instance()Lcom/belkin/wemo/rules/RMRulesSDK;

    move-result-object v1

    invoke-virtual {v1}, Lcom/belkin/wemo/rules/RMRulesSDK;->getRules()Lcom/belkin/wemo/rules/RMIRules;

    move-result-object v1

    invoke-interface {v1, v0, v0}, Lcom/belkin/wemo/rules/RMIRules;->fetchRules(Lcom/belkin/wemo/rules/callback/RMShowRulesSuccessCallback;Lcom/belkin/wemo/rules/callback/RMShowRulesErrorCallback;)V

    .line 42
    return-void
.end method

.method public getRule(Lorg/json/JSONArray;Lorg/apache/cordova/CallbackContext;)V
    .locals 0
    .param p1, "params"    # Lorg/json/JSONArray;
    .param p2, "callbackContext"    # Lorg/apache/cordova/CallbackContext;

    .prologue
    .line 73
    return-void
.end method

.method public getSunriseTime(Lorg/json/JSONObject;)D
    .locals 6
    .param p1, "jo"    # Lorg/json/JSONObject;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .prologue
    .line 93
    const-string v2, "dayID"

    invoke-virtual {p1, v2}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v1

    .line 95
    .local v1, "dayID":I
    invoke-static {}, Lcom/belkin/wemo/rules/data/RMUserLocation;->getInstance()Lcom/belkin/wemo/rules/data/RMUserLocation;

    move-result-object v2

    invoke-virtual {v2}, Lcom/belkin/wemo/rules/data/RMUserLocation;->getLocationInfo()Lcom/belkin/wemo/rules/data/RMLocationInfo;

    move-result-object v0

    .line 96
    .local v0, "currentLocInfo":Lcom/belkin/wemo/rules/data/RMLocationInfo;
    invoke-virtual {v0}, Lcom/belkin/wemo/rules/data/RMLocationInfo;->getLatitude()D

    move-result-wide v2

    invoke-virtual {v0}, Lcom/belkin/wemo/rules/data/RMLocationInfo;->getLongitude()D

    move-result-wide v4

    invoke-static {v2, v3, v4, v5, v1}, Lcom/belkin/wemo/rules/util/RMSunriseSunsetUtility;->getSunriseTime(DDI)D

    move-result-wide v2

    return-wide v2
.end method

.method public getSunsetTime(Lorg/json/JSONObject;)D
    .locals 6
    .param p1, "jo"    # Lorg/json/JSONObject;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .prologue
    .line 100
    const-string v2, "dayID"

    invoke-virtual {p1, v2}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v1

    .line 102
    .local v1, "dayID":I
    invoke-static {}, Lcom/belkin/wemo/rules/data/RMUserLocation;->getInstance()Lcom/belkin/wemo/rules/data/RMUserLocation;

    move-result-object v2

    invoke-virtual {v2}, Lcom/belkin/wemo/rules/data/RMUserLocation;->getLocationInfo()Lcom/belkin/wemo/rules/data/RMLocationInfo;

    move-result-object v0

    .line 103
    .local v0, "currentLocInfo":Lcom/belkin/wemo/rules/data/RMLocationInfo;
    invoke-virtual {v0}, Lcom/belkin/wemo/rules/data/RMLocationInfo;->getLatitude()D

    move-result-wide v2

    invoke-virtual {v0}, Lcom/belkin/wemo/rules/data/RMLocationInfo;->getLongitude()D

    move-result-wide v4

    invoke-static {v2, v3, v4, v5, v1}, Lcom/belkin/wemo/rules/util/RMSunriseSunsetUtility;->getSunsetTime(DDI)D

    move-result-wide v2

    return-wide v2
.end method

.method public resetDeviceRules(Lorg/json/JSONObject;Lorg/apache/cordova/CallbackContext;)V
    .locals 4
    .param p1, "jo"    # Lorg/json/JSONObject;
    .param p2, "callbackContext"    # Lorg/apache/cordova/CallbackContext;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .prologue
    .line 112
    const-string v1, "udn"

    invoke-virtual {p1, v1}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 114
    .local v0, "udn":Ljava/lang/String;
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_1

    .line 115
    invoke-static {}, Lcom/belkin/wemo/rules/RMRulesSDK;->instance()Lcom/belkin/wemo/rules/RMRulesSDK;

    move-result-object v1

    invoke-virtual {v1}, Lcom/belkin/wemo/rules/RMRulesSDK;->getRules()Lcom/belkin/wemo/rules/RMIRules;

    move-result-object v1

    new-instance v2, Lcom/belkin/wemo/rules/controller/RMRulesController$1;

    invoke-direct {v2, p0, p2}, Lcom/belkin/wemo/rules/controller/RMRulesController$1;-><init>(Lcom/belkin/wemo/rules/controller/RMRulesController;Lorg/apache/cordova/CallbackContext;)V

    new-instance v3, Lcom/belkin/wemo/rules/controller/RMRulesController$2;

    invoke-direct {v3, p0, v0, p2}, Lcom/belkin/wemo/rules/controller/RMRulesController$2;-><init>(Lcom/belkin/wemo/rules/controller/RMRulesController;Ljava/lang/String;Lorg/apache/cordova/CallbackContext;)V

    invoke-interface {v1, v0, v2, v3}, Lcom/belkin/wemo/rules/RMIRules;->deleteRulesFromDevice(Ljava/lang/String;Lcom/belkin/wemo/rules/callback/RMResetDeviceRulesSuccessCallback;Lcom/belkin/wemo/rules/callback/RMResetDeviceRulesErrorCallback;)V

    .line 139
    :cond_0
    :goto_0
    return-void

    .line 135
    :cond_1
    if-eqz p2, :cond_0

    .line 136
    new-instance v1, Lorg/apache/cordova/PluginResult;

    sget-object v2, Lorg/apache/cordova/PluginResult$Status;->ERROR:Lorg/apache/cordova/PluginResult$Status;

    const-string v3, "UDN is invalid"

    invoke-direct {v1, v2, v3}, Lorg/apache/cordova/PluginResult;-><init>(Lorg/apache/cordova/PluginResult$Status;Ljava/lang/String;)V

    invoke-virtual {p2, v1}, Lorg/apache/cordova/CallbackContext;->sendPluginResult(Lorg/apache/cordova/PluginResult;)V

    goto :goto_0
.end method

.method public saveNewRule(Lorg/json/JSONObject;Lorg/apache/cordova/CallbackContext;)V
    .locals 4
    .param p1, "ruleJO"    # Lorg/json/JSONObject;
    .param p2, "callbackContext"    # Lorg/apache/cordova/CallbackContext;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .prologue
    .line 56
    new-instance v3, Lcom/belkin/wemo/rules/builder/RMRuleBuilder;

    invoke-direct {v3}, Lcom/belkin/wemo/rules/builder/RMRuleBuilder;-><init>()V

    invoke-virtual {v3, p1}, Lcom/belkin/wemo/rules/builder/RMRuleBuilder;->getBuilder(Lorg/json/JSONObject;)Lcom/belkin/wemo/rules/builder/RMAbstractRuleBuilder;

    move-result-object v0

    .line 57
    .local v0, "builder":Lcom/belkin/wemo/rules/builder/RMAbstractRuleBuilder;, "Lcom/belkin/wemo/rules/builder/RMAbstractRuleBuilder<+Lcom/belkin/wemo/rules/data/RMRule;>;"
    invoke-virtual {v0}, Lcom/belkin/wemo/rules/builder/RMAbstractRuleBuilder;->buildNew()Lcom/belkin/wemo/rules/data/RMRule;

    move-result-object v2

    .line 59
    .local v2, "rule":Lcom/belkin/wemo/rules/data/RMRule;
    new-instance v1, Lcom/belkin/wemo/rules/controller/callback/RMSaveRuleCallback;

    invoke-direct {v1, p2, v2}, Lcom/belkin/wemo/rules/controller/callback/RMSaveRuleCallback;-><init>(Lorg/apache/cordova/CallbackContext;Lcom/belkin/wemo/rules/data/RMRule;)V

    .line 60
    .local v1, "callback":Lcom/belkin/wemo/rules/controller/callback/RMSaveRuleCallback;
    invoke-static {}, Lcom/belkin/wemo/rules/RMRulesSDK;->instance()Lcom/belkin/wemo/rules/RMRulesSDK;

    move-result-object v3

    invoke-virtual {v3}, Lcom/belkin/wemo/rules/RMRulesSDK;->getRules()Lcom/belkin/wemo/rules/RMIRules;

    move-result-object v3

    invoke-interface {v3, v2, v1, v1}, Lcom/belkin/wemo/rules/RMIRules;->saveRule(Lcom/belkin/wemo/rules/data/RMRule;Lcom/belkin/wemo/rules/callback/RMSaveRuleSuccessCallback;Lcom/belkin/wemo/rules/callback/RMSaveRuleErrorCallback;)V

    .line 61
    return-void
.end method

.method public toggleRule(Lorg/json/JSONObject;Lorg/apache/cordova/CallbackContext;)V
    .locals 4
    .param p1, "ruleJO"    # Lorg/json/JSONObject;
    .param p2, "callbackContext"    # Lorg/apache/cordova/CallbackContext;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .prologue
    .line 81
    const-string v3, "RULE_ID"

    invoke-virtual {p1, v3}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v1

    .line 82
    .local v1, "ruleId":I
    const-string v3, "STATE"

    invoke-virtual {p1, v3}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v2

    .line 84
    .local v2, "toggle":I
    new-instance v0, Lcom/belkin/wemo/rules/controller/callback/RMToggleRuleCallback;

    invoke-direct {v0, p2, v1}, Lcom/belkin/wemo/rules/controller/callback/RMToggleRuleCallback;-><init>(Lorg/apache/cordova/CallbackContext;I)V

    .line 85
    .local v0, "callback":Lcom/belkin/wemo/rules/controller/callback/RMToggleRuleCallback;
    if-nez v2, :cond_0

    .line 86
    invoke-static {}, Lcom/belkin/wemo/rules/RMRulesSDK;->instance()Lcom/belkin/wemo/rules/RMRulesSDK;

    move-result-object v3

    invoke-virtual {v3}, Lcom/belkin/wemo/rules/RMRulesSDK;->getRules()Lcom/belkin/wemo/rules/RMIRules;

    move-result-object v3

    invoke-interface {v3, v1, v0, v0}, Lcom/belkin/wemo/rules/RMIRules;->disableRule(ILcom/belkin/wemo/rules/callback/RMToggleRuleSuccessCallback;Lcom/belkin/wemo/rules/callback/RMToggleRuleErrorCallback;)V

    .line 90
    :goto_0
    return-void

    .line 88
    :cond_0
    invoke-static {}, Lcom/belkin/wemo/rules/RMRulesSDK;->instance()Lcom/belkin/wemo/rules/RMRulesSDK;

    move-result-object v3

    invoke-virtual {v3}, Lcom/belkin/wemo/rules/RMRulesSDK;->getRules()Lcom/belkin/wemo/rules/RMIRules;

    move-result-object v3

    invoke-interface {v3, v1, v0, v0}, Lcom/belkin/wemo/rules/RMIRules;->enableRule(ILcom/belkin/wemo/rules/callback/RMToggleRuleSuccessCallback;Lcom/belkin/wemo/rules/callback/RMToggleRuleErrorCallback;)V

    goto :goto_0
.end method
