.class public Lcom/belkin/wemo/rules/builder/RMRuleBuilder;
.super Ljava/lang/Object;
.source "RMRuleBuilder.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/belkin/wemo/rules/builder/RMRuleBuilder$1;
    }
.end annotation


# static fields
.field public static final DAY_ID_ARR:Ljava/lang/String; = "DAY_ID_ARR"

.field public static final DB_RULE_TYPE:Ljava/lang/String; = "DB_RULE_TYPE"

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


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 9
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 42
    return-void
.end method


# virtual methods
.method public getBuilder(Lorg/json/JSONObject;)Lcom/belkin/wemo/rules/builder/RMAbstractRuleBuilder;
    .locals 5
    .param p1, "ruleJSONObject"    # Lorg/json/JSONObject;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/json/JSONObject;",
            ")",
            "Lcom/belkin/wemo/rules/builder/RMAbstractRuleBuilder",
            "<+",
            "Lcom/belkin/wemo/rules/data/RMRule;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .prologue
    .line 33
    const-string v3, "DB_RULE_TYPE"

    invoke-virtual {p1, v3}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 34
    .local v2, "dbRuleTypeStr":Ljava/lang/String;
    invoke-static {v2}, Lcom/belkin/wemo/rules/data/RMDBRuleType;->fromString(Ljava/lang/String;)Lcom/belkin/wemo/rules/data/RMDBRuleType;

    move-result-object v1

    .line 36
    .local v1, "dbRuleType":Lcom/belkin/wemo/rules/data/RMDBRuleType;
    const/4 v0, 0x0

    .line 37
    .local v0, "builder":Lcom/belkin/wemo/rules/builder/RMAbstractRuleBuilder;, "Lcom/belkin/wemo/rules/builder/RMAbstractRuleBuilder<+Lcom/belkin/wemo/rules/data/RMRule;>;"
    sget-object v3, Lcom/belkin/wemo/rules/builder/RMRuleBuilder$1;->$SwitchMap$com$belkin$wemo$rules$data$RMDBRuleType:[I

    invoke-virtual {v1}, Lcom/belkin/wemo/rules/data/RMDBRuleType;->ordinal()I

    move-result v4

    aget v3, v3, v4

    packed-switch v3, :pswitch_data_0

    .line 45
    :goto_0
    return-object v0

    .line 39
    :pswitch_0
    new-instance v0, Lcom/belkin/wemo/rules/builder/RMLongPressRuleBuilder;

    .end local v0    # "builder":Lcom/belkin/wemo/rules/builder/RMAbstractRuleBuilder;, "Lcom/belkin/wemo/rules/builder/RMAbstractRuleBuilder<+Lcom/belkin/wemo/rules/data/RMRule;>;"
    invoke-direct {v0, p1}, Lcom/belkin/wemo/rules/builder/RMLongPressRuleBuilder;-><init>(Lorg/json/JSONObject;)V

    .line 40
    .restart local v0    # "builder":Lcom/belkin/wemo/rules/builder/RMAbstractRuleBuilder;, "Lcom/belkin/wemo/rules/builder/RMAbstractRuleBuilder<+Lcom/belkin/wemo/rules/data/RMRule;>;"
    goto :goto_0

    .line 37
    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
    .end packed-switch
.end method
