.class public abstract Lcom/belkin/wemo/rules/builder/RMAbstractRuleBuilder;
.super Ljava/lang/Object;
.source "RMAbstractRuleBuilder.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Lcom/belkin/wemo/rules/data/RMRule;",
        ">",
        "Ljava/lang/Object;"
    }
.end annotation


# static fields
.field public static final DAY_ID_ARR:Ljava/lang/String; = "DAY_ID_ARR"

.field public static final DB_RULE_TYPE:Ljava/lang/String; = "DB_RULE_TYPE"

.field public static final DEVICE_:Ljava/lang/String; = "DEVICE_INDEX"

.field public static final DEVICE_ID:Ljava/lang/String; = "DEVICE_ID"

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


# instance fields
.field protected rule:Lcom/belkin/wemo/rules/data/RMRule;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "TT;"
        }
    .end annotation
.end field

.field protected ruleJO:Lorg/json/JSONObject;


# direct methods
.method public constructor <init>(Lorg/json/JSONObject;)V
    .locals 0
    .param p1, "ruleJSONObject"    # Lorg/json/JSONObject;

    .prologue
    .line 34
    .local p0, "this":Lcom/belkin/wemo/rules/builder/RMAbstractRuleBuilder;, "Lcom/belkin/wemo/rules/builder/RMAbstractRuleBuilder<TT;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 35
    iput-object p1, p0, Lcom/belkin/wemo/rules/builder/RMAbstractRuleBuilder;->ruleJO:Lorg/json/JSONObject;

    .line 36
    return-void
.end method


# virtual methods
.method protected abstract addRuleDetails()V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation
.end method

.method public buildExisting()Lcom/belkin/wemo/rules/data/RMRule;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TT;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .prologue
    .line 53
    .local p0, "this":Lcom/belkin/wemo/rules/builder/RMAbstractRuleBuilder;, "Lcom/belkin/wemo/rules/builder/RMAbstractRuleBuilder<TT;>;"
    invoke-virtual {p0}, Lcom/belkin/wemo/rules/builder/RMAbstractRuleBuilder;->buildNew()Lcom/belkin/wemo/rules/data/RMRule;

    move-result-object v0

    .line 54
    .local v0, "rule":Lcom/belkin/wemo/rules/data/RMRule;, "TT;"
    iget-object v2, p0, Lcom/belkin/wemo/rules/builder/RMAbstractRuleBuilder;->ruleJO:Lorg/json/JSONObject;

    const-string v3, "RULE_ID"

    invoke-virtual {v2, v3}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v1

    .line 56
    .local v1, "ruleId":I
    invoke-virtual {v0, v1}, Lcom/belkin/wemo/rules/data/RMRule;->setRuleId(I)V

    .line 58
    return-object v0
.end method

.method public buildNew()Lcom/belkin/wemo/rules/data/RMRule;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TT;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .prologue
    .line 39
    .local p0, "this":Lcom/belkin/wemo/rules/builder/RMAbstractRuleBuilder;, "Lcom/belkin/wemo/rules/builder/RMAbstractRuleBuilder<TT;>;"
    invoke-virtual {p0}, Lcom/belkin/wemo/rules/builder/RMAbstractRuleBuilder;->instantiateRule()Lcom/belkin/wemo/rules/data/RMRule;

    move-result-object v2

    iput-object v2, p0, Lcom/belkin/wemo/rules/builder/RMAbstractRuleBuilder;->rule:Lcom/belkin/wemo/rules/data/RMRule;

    .line 41
    iget-object v2, p0, Lcom/belkin/wemo/rules/builder/RMAbstractRuleBuilder;->ruleJO:Lorg/json/JSONObject;

    const-string v3, "STATE"

    invoke-virtual {v2, v3}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v1

    .line 42
    .local v1, "state":I
    iget-object v2, p0, Lcom/belkin/wemo/rules/builder/RMAbstractRuleBuilder;->rule:Lcom/belkin/wemo/rules/data/RMRule;

    invoke-virtual {v2, v1}, Lcom/belkin/wemo/rules/data/RMRule;->setState(I)V

    .line 44
    iget-object v2, p0, Lcom/belkin/wemo/rules/builder/RMAbstractRuleBuilder;->ruleJO:Lorg/json/JSONObject;

    const-string v3, "DISPLAY_NAME"

    invoke-virtual {v2, v3}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 45
    .local v0, "displayName":Ljava/lang/String;
    iget-object v2, p0, Lcom/belkin/wemo/rules/builder/RMAbstractRuleBuilder;->rule:Lcom/belkin/wemo/rules/data/RMRule;

    invoke-virtual {v2, v0}, Lcom/belkin/wemo/rules/data/RMRule;->setDisplayName(Ljava/lang/String;)V

    .line 47
    invoke-virtual {p0}, Lcom/belkin/wemo/rules/builder/RMAbstractRuleBuilder;->addRuleDetails()V

    .line 49
    iget-object v2, p0, Lcom/belkin/wemo/rules/builder/RMAbstractRuleBuilder;->rule:Lcom/belkin/wemo/rules/data/RMRule;

    return-object v2
.end method

.method protected abstract instantiateRule()Lcom/belkin/wemo/rules/data/RMRule;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TT;"
        }
    .end annotation
.end method
