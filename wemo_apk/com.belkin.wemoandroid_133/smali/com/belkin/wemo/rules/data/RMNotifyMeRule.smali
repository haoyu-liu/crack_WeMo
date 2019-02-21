.class public Lcom/belkin/wemo/rules/data/RMNotifyMeRule;
.super Lcom/belkin/wemo/rules/data/RMDBRule;
.source "RMNotifyMeRule.java"


# static fields
.field public static final NOTIFY_DURATION:Ljava/lang/String; = "NOTIFY_DURATION"

.field public static final NOTIFY_MSG:Ljava/lang/String; = "NOTIFY_MSG"

.field public static final NOTIFY_RULE_ID:Ljava/lang/String; = "NOTIFY_RULE_ID"


# instance fields
.field private notificationDuration:I

.field private notificationMsg:Ljava/lang/String;

.field private notifyRuleID:I


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 35
    invoke-direct {p0}, Lcom/belkin/wemo/rules/data/RMDBRule;-><init>()V

    .line 36
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
    .line 28
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

    .line 32
    return-void
.end method


# virtual methods
.method protected assignDBRuleType()Lcom/belkin/wemo/rules/data/RMDBRuleType;
    .locals 1

    .prologue
    .line 40
    sget-object v0, Lcom/belkin/wemo/rules/data/RMDBRuleType;->NOTIFY_ME:Lcom/belkin/wemo/rules/data/RMDBRuleType;

    return-object v0
.end method

.method public getNotificationDuration()I
    .locals 1

    .prologue
    .line 86
    iget v0, p0, Lcom/belkin/wemo/rules/data/RMNotifyMeRule;->notificationDuration:I

    return v0
.end method

.method public getNotificationMsg()Ljava/lang/String;
    .locals 1

    .prologue
    .line 72
    iget-object v0, p0, Lcom/belkin/wemo/rules/data/RMNotifyMeRule;->notificationMsg:Ljava/lang/String;

    return-object v0
.end method

.method public getNotifyRuleID()I
    .locals 1

    .prologue
    .line 58
    iget v0, p0, Lcom/belkin/wemo/rules/data/RMNotifyMeRule;->notifyRuleID:I

    return v0
.end method

.method public setNotificationDuration(I)V
    .locals 0
    .param p1, "notificationDuration"    # I

    .prologue
    .line 93
    iput p1, p0, Lcom/belkin/wemo/rules/data/RMNotifyMeRule;->notificationDuration:I

    .line 94
    return-void
.end method

.method public setNotificationMsg(Ljava/lang/String;)V
    .locals 0
    .param p1, "notificationMsg"    # Ljava/lang/String;

    .prologue
    .line 79
    iput-object p1, p0, Lcom/belkin/wemo/rules/data/RMNotifyMeRule;->notificationMsg:Ljava/lang/String;

    .line 80
    return-void
.end method

.method public setNotifyRuleID(I)V
    .locals 0
    .param p1, "notifyRuleID"    # I

    .prologue
    .line 65
    iput p1, p0, Lcom/belkin/wemo/rules/data/RMNotifyMeRule;->notifyRuleID:I

    .line 66
    return-void
.end method

.method public toJSON(Lorg/json/JSONObject;)Lorg/json/JSONObject;
    .locals 2
    .param p1, "jsonObject"    # Lorg/json/JSONObject;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .prologue
    .line 45
    invoke-super {p0, p1}, Lcom/belkin/wemo/rules/data/RMDBRule;->toJSON(Lorg/json/JSONObject;)Lorg/json/JSONObject;

    .line 47
    const-string v0, "NOTIFY_RULE_ID"

    invoke-virtual {p0}, Lcom/belkin/wemo/rules/data/RMNotifyMeRule;->getNotifyRuleID()I

    move-result v1

    invoke-virtual {p1, v0, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    .line 48
    const-string v0, "NOTIFY_MSG"

    invoke-virtual {p0}, Lcom/belkin/wemo/rules/data/RMNotifyMeRule;->getNotificationMsg()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1, v0, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 49
    const-string v0, "NOTIFY_DURATION"

    invoke-virtual {p0}, Lcom/belkin/wemo/rules/data/RMNotifyMeRule;->getNotificationDuration()I

    move-result v1

    invoke-virtual {p1, v0, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    .line 51
    return-object p1
.end method
