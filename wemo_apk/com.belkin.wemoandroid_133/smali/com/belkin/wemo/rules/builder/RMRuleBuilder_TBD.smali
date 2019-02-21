.class public Lcom/belkin/wemo/rules/builder/RMRuleBuilder_TBD;
.super Ljava/lang/Object;
.source "RMRuleBuilder_TBD.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/belkin/wemo/rules/builder/RMRuleBuilder_TBD$1;
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

.field private static final TAG:Ljava/lang/String;

.field public static final TARGET_DEV_ARR:Ljava/lang/String; = "TARGET_DEV_ARR"

.field public static final UDN:Ljava/lang/String; = "UDN"

.field public static final WIFI_DEV_ARR:Ljava/lang/String; = "WIFI_DEV_ARR"

.field public static final ZIGBEE_DEV_ARR:Ljava/lang/String; = "ZIGBEE_DEV_ARR"


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 41
    const-class v0, Lcom/belkin/wemo/rules/builder/RMRuleBuilder_TBD;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/belkin/wemo/rules/builder/RMRuleBuilder_TBD;->TAG:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 20
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 108
    return-void
.end method

.method private addCommonDeviceProperties(Lcom/belkin/wemo/rules/data/device/RMDBRuleDevice;ILjava/lang/String;II)V
    .locals 0
    .param p1, "device"    # Lcom/belkin/wemo/rules/data/device/RMDBRuleDevice;
    .param p2, "ruleCode"    # I
    .param p3, "udn"    # Ljava/lang/String;
    .param p4, "startTime"    # I
    .param p5, "onModeOffset"    # I

    .prologue
    .line 162
    return-void
.end method

.method private buildDBRuleJSON(Lcom/belkin/wemo/rules/data/RMDBRule;)Lorg/json/JSONObject;
    .locals 1
    .param p1, "dbRule"    # Lcom/belkin/wemo/rules/data/RMDBRule;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .prologue
    .line 197
    new-instance v0, Lorg/json/JSONObject;

    invoke-direct {v0}, Lorg/json/JSONObject;-><init>()V

    .line 213
    .local v0, "ruleJO":Lorg/json/JSONObject;
    invoke-virtual {p1, v0}, Lcom/belkin/wemo/rules/data/RMDBRule;->toJSON(Lorg/json/JSONObject;)Lorg/json/JSONObject;

    move-result-object v0

    .line 214
    return-object v0
.end method

.method private buildEventRuleJO(Lcom/belkin/wemo/rules/data/RMLongPressRule;)Lorg/json/JSONObject;
    .locals 10
    .param p1, "rule"    # Lcom/belkin/wemo/rules/data/RMLongPressRule;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .prologue
    .line 271
    new-instance v4, Lorg/json/JSONObject;

    invoke-direct {v4}, Lorg/json/JSONObject;-><init>()V

    .line 272
    .local v4, "ruleJO":Lorg/json/JSONObject;
    const-string v8, "DB_RULE_TYPE"

    sget-object v9, Lcom/belkin/wemo/rules/data/RMDBRuleType;->EVENT_RULE:Lcom/belkin/wemo/rules/data/RMDBRuleType;

    invoke-virtual {v9}, Lcom/belkin/wemo/rules/data/RMDBRuleType;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v4, v8, v9}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 273
    const-string v8, "RULE_ID"

    invoke-virtual {p1}, Lcom/belkin/wemo/rules/data/RMLongPressRule;->getRuleId()I

    move-result v9

    invoke-virtual {v4, v8, v9}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    .line 274
    const-string v8, "STATE"

    invoke-virtual {p1}, Lcom/belkin/wemo/rules/data/RMLongPressRule;->getState()I

    move-result v9

    invoke-virtual {v4, v8, v9}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    .line 275
    const-string v8, "DISPLAY_NAME"

    invoke-virtual {p1}, Lcom/belkin/wemo/rules/data/RMLongPressRule;->getDisplayName()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v4, v8, v9}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 280
    new-instance v3, Lorg/json/JSONArray;

    invoke-direct {v3}, Lorg/json/JSONArray;-><init>()V

    .line 281
    .local v3, "ruleDaysJA":Lorg/json/JSONArray;
    invoke-virtual {p1}, Lcom/belkin/wemo/rules/data/RMLongPressRule;->getDaySet()Ljava/util/Set;

    move-result-object v8

    invoke-interface {v8}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v2

    .local v2, "i$":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v8

    if-eqz v8, :cond_0

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    .line 282
    .local v0, "day":Ljava/lang/Integer;
    invoke-virtual {v3, v0}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;

    goto :goto_0

    .line 284
    .end local v0    # "day":Ljava/lang/Integer;
    :cond_0
    const-string v8, "DAY_ID_ARR"

    invoke-virtual {v4, v8, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 286
    new-instance v7, Lorg/json/JSONArray;

    invoke-direct {v7}, Lorg/json/JSONArray;-><init>()V

    .line 289
    .local v7, "wifiDeviceJA":Lorg/json/JSONArray;
    invoke-virtual {p1}, Lcom/belkin/wemo/rules/data/RMLongPressRule;->getRuleDeviceSet()Ljava/util/Set;

    move-result-object v8

    invoke-interface {v8}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_1
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v8

    if-eqz v8, :cond_1

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/belkin/wemo/rules/data/device/RMDBRuleDevice;

    .line 302
    .local v1, "device":Lcom/belkin/wemo/rules/data/device/RMDBRuleDevice;
    invoke-direct {p0, v1}, Lcom/belkin/wemo/rules/builder/RMRuleBuilder_TBD;->getDeviceJO(Lcom/belkin/wemo/rules/data/device/RMDBRuleDevice;)Lorg/json/JSONObject;

    move-result-object v8

    invoke-virtual {v7, v8}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;

    goto :goto_1

    .line 309
    .end local v1    # "device":Lcom/belkin/wemo/rules/data/device/RMDBRuleDevice;
    :cond_1
    const-string v8, "WIFI_DEV_ARR"

    invoke-virtual {v4, v8, v7}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 312
    new-instance v6, Lorg/json/JSONArray;

    invoke-direct {v6}, Lorg/json/JSONArray;-><init>()V

    .line 313
    .local v6, "targetDevicesJA":Lorg/json/JSONArray;
    invoke-virtual {p1}, Lcom/belkin/wemo/rules/data/RMLongPressRule;->getTargetDeviceSet()Ljava/util/Set;

    move-result-object v8

    invoke-interface {v8}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_2
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v8

    if-eqz v8, :cond_2

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/belkin/wemo/rules/data/RMTargetDevice;

    .line 314
    .local v5, "targetDevice":Lcom/belkin/wemo/rules/data/RMTargetDevice;
    new-instance v8, Lorg/json/JSONObject;

    invoke-direct {v8}, Lorg/json/JSONObject;-><init>()V

    invoke-virtual {v5, v8}, Lcom/belkin/wemo/rules/data/RMTargetDevice;->toJSONObject(Lorg/json/JSONObject;)Lorg/json/JSONObject;

    move-result-object v8

    invoke-virtual {v6, v8}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;

    goto :goto_2

    .line 316
    .end local v5    # "targetDevice":Lcom/belkin/wemo/rules/data/RMTargetDevice;
    :cond_2
    const-string v8, "TARGET_DEV_ARR"

    invoke-virtual {v4, v8, v6}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 320
    return-object v4
.end method

.method private buildLongPressRuleJO(Lcom/belkin/wemo/rules/data/RMLongPressRule;)Lorg/json/JSONObject;
    .locals 10
    .param p1, "rule"    # Lcom/belkin/wemo/rules/data/RMLongPressRule;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .prologue
    .line 218
    new-instance v4, Lorg/json/JSONObject;

    invoke-direct {v4}, Lorg/json/JSONObject;-><init>()V

    .line 219
    .local v4, "ruleJO":Lorg/json/JSONObject;
    const-string v8, "DB_RULE_TYPE"

    sget-object v9, Lcom/belkin/wemo/rules/data/RMDBRuleType;->LONG_PRESS:Lcom/belkin/wemo/rules/data/RMDBRuleType;

    invoke-virtual {v9}, Lcom/belkin/wemo/rules/data/RMDBRuleType;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v4, v8, v9}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 220
    const-string v8, "RULE_ID"

    invoke-virtual {p1}, Lcom/belkin/wemo/rules/data/RMLongPressRule;->getRuleId()I

    move-result v9

    invoke-virtual {v4, v8, v9}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    .line 221
    const-string v8, "STATE"

    invoke-virtual {p1}, Lcom/belkin/wemo/rules/data/RMLongPressRule;->getState()I

    move-result v9

    invoke-virtual {v4, v8, v9}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    .line 222
    const-string v8, "DISPLAY_NAME"

    invoke-virtual {p1}, Lcom/belkin/wemo/rules/data/RMLongPressRule;->getDisplayName()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v4, v8, v9}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 227
    new-instance v3, Lorg/json/JSONArray;

    invoke-direct {v3}, Lorg/json/JSONArray;-><init>()V

    .line 228
    .local v3, "ruleDaysJA":Lorg/json/JSONArray;
    invoke-virtual {p1}, Lcom/belkin/wemo/rules/data/RMLongPressRule;->getDaySet()Ljava/util/Set;

    move-result-object v8

    invoke-interface {v8}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v2

    .local v2, "i$":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v8

    if-eqz v8, :cond_0

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    .line 229
    .local v0, "day":Ljava/lang/Integer;
    invoke-virtual {v3, v0}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;

    goto :goto_0

    .line 231
    .end local v0    # "day":Ljava/lang/Integer;
    :cond_0
    const-string v8, "DAY_ID_ARR"

    invoke-virtual {v4, v8, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 233
    new-instance v7, Lorg/json/JSONArray;

    invoke-direct {v7}, Lorg/json/JSONArray;-><init>()V

    .line 236
    .local v7, "wifiDeviceJA":Lorg/json/JSONArray;
    invoke-virtual {p1}, Lcom/belkin/wemo/rules/data/RMLongPressRule;->getRuleDeviceSet()Ljava/util/Set;

    move-result-object v8

    invoke-interface {v8}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_1
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v8

    if-eqz v8, :cond_1

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/belkin/wemo/rules/data/device/RMDBRuleDevice;

    .line 249
    .local v1, "device":Lcom/belkin/wemo/rules/data/device/RMDBRuleDevice;
    invoke-direct {p0, v1}, Lcom/belkin/wemo/rules/builder/RMRuleBuilder_TBD;->getDeviceJO(Lcom/belkin/wemo/rules/data/device/RMDBRuleDevice;)Lorg/json/JSONObject;

    move-result-object v8

    invoke-virtual {v7, v8}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;

    goto :goto_1

    .line 256
    .end local v1    # "device":Lcom/belkin/wemo/rules/data/device/RMDBRuleDevice;
    :cond_1
    const-string v8, "WIFI_DEV_ARR"

    invoke-virtual {v4, v8, v7}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 259
    new-instance v6, Lorg/json/JSONArray;

    invoke-direct {v6}, Lorg/json/JSONArray;-><init>()V

    .line 260
    .local v6, "targetDevicesJA":Lorg/json/JSONArray;
    invoke-virtual {p1}, Lcom/belkin/wemo/rules/data/RMLongPressRule;->getTargetDeviceSet()Ljava/util/Set;

    move-result-object v8

    invoke-interface {v8}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_2
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v8

    if-eqz v8, :cond_2

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/belkin/wemo/rules/data/RMTargetDevice;

    .line 261
    .local v5, "targetDevice":Lcom/belkin/wemo/rules/data/RMTargetDevice;
    new-instance v8, Lorg/json/JSONObject;

    invoke-direct {v8}, Lorg/json/JSONObject;-><init>()V

    invoke-virtual {v5, v8}, Lcom/belkin/wemo/rules/data/RMTargetDevice;->toJSONObject(Lorg/json/JSONObject;)Lorg/json/JSONObject;

    move-result-object v8

    invoke-virtual {v6, v8}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;

    goto :goto_2

    .line 263
    .end local v5    # "targetDevice":Lcom/belkin/wemo/rules/data/RMTargetDevice;
    :cond_2
    const-string v8, "TARGET_DEV_ARR"

    invoke-virtual {v4, v8, v6}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 267
    return-object v4
.end method

.method private buildNewDBRule(Lorg/json/JSONObject;)Lcom/belkin/wemo/rules/data/RMDBRule;
    .locals 11
    .param p1, "ruleObject"    # Lorg/json/JSONObject;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .prologue
    .line 92
    const/4 v0, 0x0

    .line 93
    .local v0, "dbRule":Lcom/belkin/wemo/rules/data/RMDBRule;
    const-string v9, "RULE_ID"

    invoke-virtual {p1, v9}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v6

    .line 94
    .local v6, "ruleId":I
    const-string v9, "STATE"

    invoke-virtual {p1, v9}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v8

    .line 95
    .local v8, "state":I
    const-string v9, "DISPLAY_NAME"

    invoke-virtual {p1, v9}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 96
    .local v3, "displayName":Ljava/lang/String;
    const-string v9, "START_RULE_CODE"

    invoke-virtual {p1, v9}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v5

    .line 97
    .local v5, "ruleCode":I
    const-string v9, "START_TIME_SINCE_MIDNIGHT"

    invoke-virtual {p1, v9}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v7

    .line 98
    .local v7, "startTime":I
    const-string v9, "ON_MODE_OFFSET_SEC"

    invoke-virtual {p1, v9}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v4

    .line 99
    .local v4, "onModeOffset":I
    const-string v9, "DB_RULE_TYPE"

    invoke-virtual {p1, v9}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 100
    .local v2, "dbRuleTypeStr":Ljava/lang/String;
    invoke-static {v2}, Lcom/belkin/wemo/rules/data/RMDBRuleType;->fromString(Ljava/lang/String;)Lcom/belkin/wemo/rules/data/RMDBRuleType;

    move-result-object v1

    .line 102
    .local v1, "dbRuleType":Lcom/belkin/wemo/rules/data/RMDBRuleType;
    sget-object v9, Lcom/belkin/wemo/rules/builder/RMRuleBuilder_TBD$1;->$SwitchMap$com$belkin$wemo$rules$data$RMDBRuleType:[I

    invoke-virtual {v1}, Lcom/belkin/wemo/rules/data/RMDBRuleType;->ordinal()I

    move-result v10

    aget v9, v9, v10

    packed-switch v9, :pswitch_data_0

    .line 112
    :goto_0
    invoke-virtual {v0, v6}, Lcom/belkin/wemo/rules/data/RMDBRule;->setRuleId(I)V

    .line 113
    invoke-virtual {v0, v8}, Lcom/belkin/wemo/rules/data/RMDBRule;->setState(I)V

    .line 114
    invoke-virtual {v0, v3}, Lcom/belkin/wemo/rules/data/RMDBRule;->setDisplayName(Ljava/lang/String;)V

    .line 116
    const/4 v9, 0x2

    invoke-virtual {v0, v9}, Lcom/belkin/wemo/rules/data/RMDBRule;->setRulesType(I)V

    .line 118
    return-object v0

    .line 104
    :pswitch_0
    invoke-direct {p0, p1, v7, v5, v4}, Lcom/belkin/wemo/rules/builder/RMRuleBuilder_TBD;->buildSimpleSwitchRule(Lorg/json/JSONObject;III)Lcom/belkin/wemo/rules/data/RMSimpleSwitchRule;

    move-result-object v0

    .line 105
    goto :goto_0

    .line 102
    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
    .end packed-switch
.end method

.method private buildSimpleSwitchRule(Lorg/json/JSONObject;III)Lcom/belkin/wemo/rules/data/RMSimpleSwitchRule;
    .locals 17
    .param p1, "ruleObject"    # Lorg/json/JSONObject;
    .param p2, "startTime"    # I
    .param p3, "ruleCode"    # I
    .param p4, "onModeOffset"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .prologue
    .line 122
    new-instance v10, Lcom/belkin/wemo/rules/data/RMSimpleSwitchRule;

    invoke-direct {v10}, Lcom/belkin/wemo/rules/data/RMSimpleSwitchRule;-><init>()V

    .line 123
    .local v10, "rule":Lcom/belkin/wemo/rules/data/RMSimpleSwitchRule;
    const-string v1, "DAY_ID_ARR"

    move-object/from16 v0, p1

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->getJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v11

    .line 126
    .local v11, "ruleDaysArr":Lorg/json/JSONArray;
    invoke-virtual {v11}, Lorg/json/JSONArray;->length()I

    move-result v7

    .line 127
    .local v7, "dayArrLength":I
    const/4 v9, 0x0

    .local v9, "i":I
    :goto_0
    if-ge v9, v7, :cond_0

    .line 128
    invoke-virtual {v11, v9}, Lorg/json/JSONArray;->getInt(I)I

    move-result v1

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v10, v1}, Lcom/belkin/wemo/rules/data/RMSimpleSwitchRule;->addDay(Ljava/lang/Integer;)V

    .line 127
    add-int/lit8 v9, v9, 0x1

    goto :goto_0

    .line 132
    :cond_0
    const-string v1, "WIFI_DEV_ARR"

    move-object/from16 v0, p1

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->getJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v12

    .line 133
    .local v12, "ruleDevicesJA":Lorg/json/JSONArray;
    invoke-virtual {v12}, Lorg/json/JSONArray;->length()I

    move-result v8

    .line 134
    .local v8, "deviceArrLength":I
    const/4 v9, 0x0

    :goto_1
    if-ge v9, v8, :cond_3

    .line 135
    invoke-virtual {v12, v9}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v13

    .line 136
    .local v13, "singleDevJO":Lorg/json/JSONObject;
    const-string v1, "UDN"

    invoke-virtual {v13, v1}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    .line 138
    .local v4, "udn":Ljava/lang/String;
    const-string v1, "Bridge"

    invoke-virtual {v4, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 140
    const-string v1, "ZIGBEE_DEV_ARR"

    invoke-virtual {v13, v1}, Lorg/json/JSONObject;->getJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v15

    .line 141
    .local v15, "zigbeeDevJA":Lorg/json/JSONArray;
    invoke-virtual {v15}, Lorg/json/JSONArray;->length()I

    move-result v16

    .line 142
    .local v16, "zigbeeDevLength":I
    const/4 v14, 0x0

    .local v14, "y":I
    :goto_2
    move/from16 v0, v16

    if-ge v14, v0, :cond_2

    .line 143
    invoke-virtual {v15, v14}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v1

    move-object/from16 v0, p0

    invoke-direct {v0, v1}, Lcom/belkin/wemo/rules/builder/RMRuleBuilder_TBD;->getLed(Lorg/json/JSONObject;)Lcom/belkin/wemo/rules/data/device/RMLed;

    move-result-object v2

    .local v2, "device":Lcom/belkin/wemo/rules/data/device/RMLed;
    move-object/from16 v1, p0

    move/from16 v3, p3

    move/from16 v5, p2

    move/from16 v6, p4

    .line 144
    invoke-direct/range {v1 .. v6}, Lcom/belkin/wemo/rules/builder/RMRuleBuilder_TBD;->addCommonDeviceProperties(Lcom/belkin/wemo/rules/data/device/RMDBRuleDevice;ILjava/lang/String;II)V

    .line 145
    invoke-virtual {v10, v2}, Lcom/belkin/wemo/rules/data/RMSimpleSwitchRule;->addRuleDevice(Lcom/belkin/wemo/rules/data/device/RMDBRuleDevice;)Z

    .line 146
    sget-object v1, Lcom/belkin/wemo/rules/builder/RMRuleBuilder_TBD;->TAG:Ljava/lang/String;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Device DN UDN: "

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v2}, Lcom/belkin/wemo/rules/data/device/RMLed;->getUdn()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v1, v3}, Lcom/belkin/utils/LogUtils;->debugLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 142
    add-int/lit8 v14, v14, 0x1

    goto :goto_2

    .line 149
    .end local v2    # "device":Lcom/belkin/wemo/rules/data/device/RMLed;
    .end local v14    # "y":I
    .end local v15    # "zigbeeDevJA":Lorg/json/JSONArray;
    .end local v16    # "zigbeeDevLength":I
    :cond_1
    move-object/from16 v0, p0

    invoke-direct {v0, v13}, Lcom/belkin/wemo/rules/builder/RMRuleBuilder_TBD;->getDevice(Lorg/json/JSONObject;)Lcom/belkin/wemo/rules/data/device/RMDBRuleDevice;

    move-result-object v2

    .local v2, "device":Lcom/belkin/wemo/rules/data/device/RMDBRuleDevice;
    move-object/from16 v1, p0

    move/from16 v3, p3

    move/from16 v5, p2

    move/from16 v6, p4

    .line 150
    invoke-direct/range {v1 .. v6}, Lcom/belkin/wemo/rules/builder/RMRuleBuilder_TBD;->addCommonDeviceProperties(Lcom/belkin/wemo/rules/data/device/RMDBRuleDevice;ILjava/lang/String;II)V

    .line 151
    invoke-virtual {v10, v2}, Lcom/belkin/wemo/rules/data/RMSimpleSwitchRule;->addRuleDevice(Lcom/belkin/wemo/rules/data/device/RMDBRuleDevice;)Z

    .line 134
    .end local v2    # "device":Lcom/belkin/wemo/rules/data/device/RMDBRuleDevice;
    :cond_2
    add-int/lit8 v9, v9, 0x1

    goto :goto_1

    .line 154
    .end local v4    # "udn":Ljava/lang/String;
    .end local v13    # "singleDevJO":Lorg/json/JSONObject;
    :cond_3
    return-object v10
.end method

.method private getDevice(Lorg/json/JSONObject;)Lcom/belkin/wemo/rules/data/device/RMDBRuleDevice;
    .locals 2
    .param p1, "deviceJO"    # Lorg/json/JSONObject;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .prologue
    .line 176
    new-instance v0, Lcom/belkin/wemo/rules/data/device/RMDBRuleDevice;

    invoke-direct {v0}, Lcom/belkin/wemo/rules/data/device/RMDBRuleDevice;-><init>()V

    .line 177
    .local v0, "device":Lcom/belkin/wemo/rules/data/device/RMDBRuleDevice;
    const-string v1, "START_ACTION"

    invoke-virtual {p1, v1}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v1

    invoke-virtual {v0, v1}, Lcom/belkin/wemo/rules/data/device/RMDBRuleDevice;->setStartAction(I)V

    .line 178
    return-object v0
.end method

.method private getDeviceJO(Lcom/belkin/wemo/rules/data/device/RMDBRuleDevice;)Lorg/json/JSONObject;
    .locals 3
    .param p1, "ruleDevice"    # Lcom/belkin/wemo/rules/data/device/RMDBRuleDevice;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .prologue
    .line 324
    new-instance v0, Lorg/json/JSONObject;

    invoke-direct {v0}, Lorg/json/JSONObject;-><init>()V

    .line 325
    .local v0, "deviceJO":Lorg/json/JSONObject;
    const-string v1, "UDN"

    invoke-virtual {p1}, Lcom/belkin/wemo/rules/data/device/RMDBRuleDevice;->getUiUdn()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 326
    const-string v1, "START_ACTION"

    invoke-virtual {p1}, Lcom/belkin/wemo/rules/data/device/RMDBRuleDevice;->getStartAction()I

    move-result v2

    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    .line 327
    return-object v0
.end method

.method private getLed(Lorg/json/JSONObject;)Lcom/belkin/wemo/rules/data/device/RMLed;
    .locals 1
    .param p1, "zigbeeDeviceJO"    # Lorg/json/JSONObject;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .prologue
    .line 165
    new-instance v0, Lcom/belkin/wemo/rules/data/device/RMLed;

    invoke-direct {v0}, Lcom/belkin/wemo/rules/data/device/RMLed;-><init>()V

    .line 172
    .local v0, "led":Lcom/belkin/wemo/rules/data/device/RMLed;
    return-object v0
.end method


# virtual methods
.method public build(Lorg/json/JSONObject;)Lcom/belkin/wemo/rules/data/RMRule;
    .locals 2
    .param p1, "ruleObject"    # Lorg/json/JSONObject;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .prologue
    .line 72
    const/4 v0, 0x0

    .line 73
    .local v0, "rule":Lcom/belkin/wemo/rules/data/RMRule;
    if-eqz p1, :cond_0

    .line 74
    const-string v1, "RULE_TYPE"

    invoke-virtual {p1, v1}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v1

    packed-switch v1, :pswitch_data_0

    .line 83
    :cond_0
    :goto_0
    return-object v0

    .line 76
    :pswitch_0
    invoke-direct {p0, p1}, Lcom/belkin/wemo/rules/builder/RMRuleBuilder_TBD;->buildNewDBRule(Lorg/json/JSONObject;)Lcom/belkin/wemo/rules/data/RMDBRule;

    move-result-object v0

    .line 77
    goto :goto_0

    .line 74
    :pswitch_data_0
    .packed-switch 0x2
        :pswitch_0
    .end packed-switch
.end method

.method public buildRuleJSON(Lcom/belkin/wemo/rules/data/RMRule;)Lorg/json/JSONObject;
    .locals 4
    .param p1, "rule"    # Lcom/belkin/wemo/rules/data/RMRule;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .prologue
    .line 182
    new-instance v0, Lorg/json/JSONObject;

    invoke-direct {v0}, Lorg/json/JSONObject;-><init>()V

    .line 183
    .local v0, "ruleJO":Lorg/json/JSONObject;
    if-eqz p1, :cond_0

    .line 184
    invoke-virtual {p1}, Lcom/belkin/wemo/rules/data/RMRule;->getRulesType()I

    move-result v1

    packed-switch v1, :pswitch_data_0

    .line 192
    .end local p1    # "rule":Lcom/belkin/wemo/rules/data/RMRule;
    :cond_0
    :goto_0
    sget-object v1, Lcom/belkin/wemo/rules/builder/RMRuleBuilder_TBD;->TAG:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Built Rule JSON: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v0}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/belkin/utils/LogUtils;->debugLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 193
    return-object v0

    .line 186
    .restart local p1    # "rule":Lcom/belkin/wemo/rules/data/RMRule;
    :pswitch_0
    check-cast p1, Lcom/belkin/wemo/rules/data/RMDBRule;

    .end local p1    # "rule":Lcom/belkin/wemo/rules/data/RMRule;
    invoke-direct {p0, p1}, Lcom/belkin/wemo/rules/builder/RMRuleBuilder_TBD;->buildDBRuleJSON(Lcom/belkin/wemo/rules/data/RMDBRule;)Lorg/json/JSONObject;

    move-result-object v0

    .line 187
    goto :goto_0

    .line 184
    :pswitch_data_0
    .packed-switch 0x2
        :pswitch_0
    .end packed-switch
.end method

.method public buildRuleListJSONArray(Ljava/util/List;)Lorg/json/JSONArray;
    .locals 5
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
    .line 340
    .local p1, "rulesList":Ljava/util/List;, "Ljava/util/List<Lcom/belkin/wemo/rules/data/RMRule;>;"
    new-instance v3, Lorg/json/JSONArray;

    invoke-direct {v3}, Lorg/json/JSONArray;-><init>()V

    .line 341
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

    .line 342
    .local v1, "rule":Lcom/belkin/wemo/rules/data/RMRule;
    invoke-virtual {p0, v1}, Lcom/belkin/wemo/rules/builder/RMRuleBuilder_TBD;->buildRuleJSON(Lcom/belkin/wemo/rules/data/RMRule;)Lorg/json/JSONObject;

    move-result-object v2

    .line 343
    .local v2, "ruleJO":Lorg/json/JSONObject;
    invoke-virtual {v3, v2}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;

    goto :goto_0

    .line 345
    .end local v1    # "rule":Lcom/belkin/wemo/rules/data/RMRule;
    .end local v2    # "ruleJO":Lorg/json/JSONObject;
    :cond_0
    return-object v3
.end method
