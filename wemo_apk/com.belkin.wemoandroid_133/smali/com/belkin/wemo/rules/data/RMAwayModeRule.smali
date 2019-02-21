.class public Lcom/belkin/wemo/rules/data/RMAwayModeRule;
.super Lcom/belkin/wemo/rules/data/RMDBRule;
.source "RMAwayModeRule.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 25
    invoke-direct {p0}, Lcom/belkin/wemo/rules/data/RMDBRule;-><init>()V

    .line 26
    return-void
.end method

.method public constructor <init>(ILcom/belkin/wemo/rules/data/RMDBRuleType;IILjava/lang/String;Ljava/util/HashMap;FIIIIJ)V
    .locals 14
    .param p1, "ruleId"    # I
    .param p2, "type"    # Lcom/belkin/wemo/rules/data/RMDBRuleType;
    .param p3, "rulesType"    # I
    .param p4, "state"    # I
    .param p5, "displayName"    # Ljava/lang/String;
    .param p7, "endAction"    # F
    .param p8, "value"    # I
    .param p9, "level"    # I
    .param p10, "onModeOffset"    # I
    .param p11, "offModeOffset"    # I
    .param p12, "sunriseSunsetEndTime"    # J
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I",
            "Lcom/belkin/wemo/rules/data/RMDBRuleType;",
            "II",
            "Ljava/lang/String;",
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/util/ArrayList",
            "<",
            "Ljava/lang/Integer;",
            ">;>;FIIIIJ)V"
        }
    .end annotation

    .prologue
    .line 18
    .local p6, "ruleDeviceUDNDaysMap":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/util/ArrayList<Ljava/lang/Integer;>;>;"
    move-object v1, p0

    move v2, p1

    move-object/from16 v3, p2

    move/from16 v4, p3

    move/from16 v5, p4

    move-object/from16 v6, p5

    move-object/from16 v7, p6

    move/from16 v8, p8

    move/from16 v9, p9

    move/from16 v10, p10

    move/from16 v11, p11

    move-wide/from16 v12, p12

    invoke-direct/range {v1 .. v13}, Lcom/belkin/wemo/rules/data/RMDBRule;-><init>(ILcom/belkin/wemo/rules/data/RMDBRuleType;IILjava/lang/String;Ljava/util/HashMap;IIIIJ)V

    .line 22
    return-void
.end method


# virtual methods
.method protected assignDBRuleType()Lcom/belkin/wemo/rules/data/RMDBRuleType;
    .locals 1

    .prologue
    .line 30
    sget-object v0, Lcom/belkin/wemo/rules/data/RMDBRuleType;->AWAY_MODE:Lcom/belkin/wemo/rules/data/RMDBRuleType;

    return-object v0
.end method

.method public toJSON(Lorg/json/JSONObject;)Lorg/json/JSONObject;
    .locals 1
    .param p1, "jo"    # Lorg/json/JSONObject;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .prologue
    .line 35
    invoke-super {p0, p1}, Lcom/belkin/wemo/rules/data/RMDBRule;->toJSON(Lorg/json/JSONObject;)Lorg/json/JSONObject;

    move-result-object v0

    return-object v0
.end method
