.class public abstract Lcom/belkin/wemo/rules/builder/RMAbstractDBRuleBuilder;
.super Lcom/belkin/wemo/rules/builder/RMAbstractRuleBuilder;
.source "RMAbstractDBRuleBuilder.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Lcom/belkin/wemo/rules/data/RMDBRule;",
        ">",
        "Lcom/belkin/wemo/rules/builder/RMAbstractRuleBuilder",
        "<TT;>;"
    }
.end annotation


# static fields
.field public static final DAY_ID_ARR:Ljava/lang/String; = "DAY_ID_ARR"

.field public static final DB_RULE_TYPE:Ljava/lang/String; = "DB_RULE_TYPE"

.field public static final DEVICE_ID:Ljava/lang/String; = "DEVICE_ID"

.field public static final DEVICE_INDEX:Ljava/lang/String; = "DEVICE_INDEX"

.field public static final DISPLAY_NAME:Ljava/lang/String; = "DISPLAY_NAME"

.field public static final END_TIME_SINCE_MIDNIGHT:Ljava/lang/String; = "END_TIME_SINCE_MIDNIGHT"

.field public static final ON_MODE_OFFSET_SEC:Ljava/lang/String; = "ON_MODE_OFFSET_SEC"

.field public static final RULE_ID:Ljava/lang/String; = "RULE_ID"

.field public static final RULE_TYPE:Ljava/lang/String; = "RULE_TYPE"

.field public static final START_ACTION:Ljava/lang/String; = "START_ACTION"

.field public static final START_BRIGHTNESS:Ljava/lang/String; = "START_BRIGHTNESS"

.field public static final START_LED_FADE_SEC:Ljava/lang/String; = "START_LED_FADE_SEC"

.field public static final START_RULE_CODE:Ljava/lang/String; = "START_RULE_CODE"

.field public static final START_TIME_SINCE_MIDNIGHT:Ljava/lang/String; = "START_TIME_SINCE_MIDNIGHT"

.field public static final STATE:Ljava/lang/String; = "STATE"

.field public static final TARGET_DEV_ARR:Ljava/lang/String; = "TARGET_DEV_ARR"

.field public static final UDN:Ljava/lang/String; = "UDN"

.field public static final WIFI_DEV_ARR:Ljava/lang/String; = "WIFI_DEV_ARR"

.field public static final ZIGBEE_DEV_ARR:Ljava/lang/String; = "ZIGBEE_DEV_ARR"


# direct methods
.method public constructor <init>(Lorg/json/JSONObject;)V
    .locals 0
    .param p1, "ruleJSONObject"    # Lorg/json/JSONObject;

    .prologue
    .line 13
    .local p0, "this":Lcom/belkin/wemo/rules/builder/RMAbstractDBRuleBuilder;, "Lcom/belkin/wemo/rules/builder/RMAbstractDBRuleBuilder<TT;>;"
    invoke-direct {p0, p1}, Lcom/belkin/wemo/rules/builder/RMAbstractRuleBuilder;-><init>(Lorg/json/JSONObject;)V

    .line 14
    return-void
.end method

.method private addRuleDevices(Lcom/belkin/wemo/rules/data/RMDBRule;)V
    .locals 7
    .param p1, "rule"    # Lcom/belkin/wemo/rules/data/RMDBRule;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .prologue
    .line 45
    .local p0, "this":Lcom/belkin/wemo/rules/builder/RMAbstractDBRuleBuilder;, "Lcom/belkin/wemo/rules/builder/RMAbstractDBRuleBuilder<TT;>;"
    iget-object v5, p0, Lcom/belkin/wemo/rules/builder/RMAbstractDBRuleBuilder;->ruleJO:Lorg/json/JSONObject;

    const-string v6, "WIFI_DEV_ARR"

    invoke-virtual {v5, v6}, Lorg/json/JSONObject;->getJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v3

    .line 46
    .local v3, "ruleDeviceArr":Lorg/json/JSONArray;
    invoke-virtual {v3}, Lorg/json/JSONArray;->length()I

    move-result v1

    .line 48
    .local v1, "ruleDevCount":I
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    if-ge v0, v1, :cond_0

    .line 49
    invoke-virtual {v3, v0}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v4

    .line 50
    .local v4, "ruleDeviceJO":Lorg/json/JSONObject;
    new-instance v2, Lcom/belkin/wemo/rules/data/device/RMDBRuleDevice;

    invoke-direct {v2}, Lcom/belkin/wemo/rules/data/device/RMDBRuleDevice;-><init>()V

    .line 53
    .local v2, "ruleDevice":Lcom/belkin/wemo/rules/data/device/RMDBRuleDevice;
    invoke-virtual {p0, v4}, Lcom/belkin/wemo/rules/builder/RMAbstractDBRuleBuilder;->getStartAction(Lorg/json/JSONObject;)I

    move-result v5

    invoke-virtual {v2, v5}, Lcom/belkin/wemo/rules/data/device/RMDBRuleDevice;->setStartAction(I)V

    .line 55
    invoke-virtual {p0, v4}, Lcom/belkin/wemo/rules/builder/RMAbstractDBRuleBuilder;->getEndAction(Lorg/json/JSONObject;)I

    move-result v5

    invoke-virtual {v2, v5}, Lcom/belkin/wemo/rules/data/device/RMDBRuleDevice;->setEndAction(I)V

    .line 57
    invoke-virtual {p0, v4}, Lcom/belkin/wemo/rules/builder/RMAbstractDBRuleBuilder;->getUiUDN(Lorg/json/JSONObject;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v2, v5}, Lcom/belkin/wemo/rules/data/device/RMDBRuleDevice;->setUiUdn(Ljava/lang/String;)V

    .line 59
    invoke-virtual {p0, v4}, Lcom/belkin/wemo/rules/builder/RMAbstractDBRuleBuilder;->getOnModeOffset(Lorg/json/JSONObject;)I

    move-result v5

    invoke-virtual {v2, v5}, Lcom/belkin/wemo/rules/data/device/RMDBRuleDevice;->setOnModeOffset(I)V

    .line 61
    invoke-virtual {p0, v4}, Lcom/belkin/wemo/rules/builder/RMAbstractDBRuleBuilder;->getOffModeOffset(Lorg/json/JSONObject;)I

    move-result v5

    invoke-virtual {v2, v5}, Lcom/belkin/wemo/rules/data/device/RMDBRuleDevice;->setOffModeOffset(I)V

    .line 63
    invoke-virtual {p1, v2}, Lcom/belkin/wemo/rules/data/RMDBRule;->addRuleDevice(Lcom/belkin/wemo/rules/data/device/RMDBRuleDevice;)Z

    .line 48
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 65
    .end local v2    # "ruleDevice":Lcom/belkin/wemo/rules/data/device/RMDBRuleDevice;
    .end local v4    # "ruleDeviceJO":Lorg/json/JSONObject;
    :cond_0
    return-void
.end method


# virtual methods
.method protected addRuleDetails()V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .prologue
    .line 40
    .local p0, "this":Lcom/belkin/wemo/rules/builder/RMAbstractDBRuleBuilder;, "Lcom/belkin/wemo/rules/builder/RMAbstractDBRuleBuilder<TT;>;"
    iget-object v0, p0, Lcom/belkin/wemo/rules/builder/RMAbstractDBRuleBuilder;->rule:Lcom/belkin/wemo/rules/data/RMRule;

    check-cast v0, Lcom/belkin/wemo/rules/data/RMDBRule;

    invoke-direct {p0, v0}, Lcom/belkin/wemo/rules/builder/RMAbstractDBRuleBuilder;->addRuleDevices(Lcom/belkin/wemo/rules/data/RMDBRule;)V

    .line 41
    return-void
.end method

.method protected getEndAction(Lorg/json/JSONObject;)I
    .locals 1
    .param p1, "ruleDeviceJO"    # Lorg/json/JSONObject;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .prologue
    .line 78
    .local p0, "this":Lcom/belkin/wemo/rules/builder/RMAbstractDBRuleBuilder;, "Lcom/belkin/wemo/rules/builder/RMAbstractDBRuleBuilder<TT;>;"
    const/4 v0, -0x1

    return v0
.end method

.method protected getOffModeOffset(Lorg/json/JSONObject;)I
    .locals 1
    .param p1, "ruleDeviceJO"    # Lorg/json/JSONObject;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .prologue
    .line 86
    .local p0, "this":Lcom/belkin/wemo/rules/builder/RMAbstractDBRuleBuilder;, "Lcom/belkin/wemo/rules/builder/RMAbstractDBRuleBuilder<TT;>;"
    const/4 v0, -0x1

    return v0
.end method

.method protected getOnModeOffset(Lorg/json/JSONObject;)I
    .locals 1
    .param p1, "ruleDeviceJO"    # Lorg/json/JSONObject;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .prologue
    .line 82
    .local p0, "this":Lcom/belkin/wemo/rules/builder/RMAbstractDBRuleBuilder;, "Lcom/belkin/wemo/rules/builder/RMAbstractDBRuleBuilder<TT;>;"
    const/4 v0, -0x1

    return v0
.end method

.method protected getStartAction(Lorg/json/JSONObject;)I
    .locals 2
    .param p1, "ruleDeviceJO"    # Lorg/json/JSONObject;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .prologue
    .line 68
    .local p0, "this":Lcom/belkin/wemo/rules/builder/RMAbstractDBRuleBuilder;, "Lcom/belkin/wemo/rules/builder/RMAbstractDBRuleBuilder<TT;>;"
    const-string v1, "START_ACTION"

    invoke-virtual {p1, v1}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v0

    .line 69
    .local v0, "startAction":I
    return v0
.end method

.method protected getUiUDN(Lorg/json/JSONObject;)Ljava/lang/String;
    .locals 2
    .param p1, "ruleDeviceJO"    # Lorg/json/JSONObject;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .prologue
    .line 73
    .local p0, "this":Lcom/belkin/wemo/rules/builder/RMAbstractDBRuleBuilder;, "Lcom/belkin/wemo/rules/builder/RMAbstractDBRuleBuilder<TT;>;"
    const-string v1, "UDN"

    invoke-virtual {p1, v1}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 74
    .local v0, "uiUDN":Ljava/lang/String;
    return-object v0
.end method
