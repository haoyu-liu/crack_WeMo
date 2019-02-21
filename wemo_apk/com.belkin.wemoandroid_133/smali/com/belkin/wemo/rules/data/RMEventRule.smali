.class public Lcom/belkin/wemo/rules/data/RMEventRule;
.super Lcom/belkin/wemo/rules/data/RMDBRule;
.source "RMEventRule.java"


# static fields
.field public static final LEVEL:I = 0x2

.field public static final SENSOR_DEV_ARR:Ljava/lang/String; = "SENSOR_DEV_ARR"

.field public static final SENSOR_DURATION:I = 0x1

.field public static final TYPE:I = 0x5

.field public static final VALUE:I


# instance fields
.field private sensorDeviceSet:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set",
            "<",
            "Lcom/belkin/wemo/rules/data/RMSensorDevice;",
            ">;"
        }
    .end annotation
.end field

.field private sensorDuration:I

.field private type:I


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 58
    invoke-direct {p0}, Lcom/belkin/wemo/rules/data/RMDBRule;-><init>()V

    .line 59
    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    iput-object v0, p0, Lcom/belkin/wemo/rules/data/RMEventRule;->sensorDeviceSet:Ljava/util/Set;

    .line 60
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
    .line 50
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

    .line 53
    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    iput-object v0, p0, Lcom/belkin/wemo/rules/data/RMEventRule;->sensorDeviceSet:Ljava/util/Set;

    .line 55
    return-void
.end method


# virtual methods
.method public addSensorDevice(Lcom/belkin/wemo/rules/data/RMSensorDevice;)Z
    .locals 1
    .param p1, "device"    # Lcom/belkin/wemo/rules/data/RMSensorDevice;

    .prologue
    .line 82
    iget-object v0, p0, Lcom/belkin/wemo/rules/data/RMEventRule;->sensorDeviceSet:Ljava/util/Set;

    invoke-interface {v0, p1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method protected assignDBRuleType()Lcom/belkin/wemo/rules/data/RMDBRuleType;
    .locals 1

    .prologue
    .line 64
    sget-object v0, Lcom/belkin/wemo/rules/data/RMDBRuleType;->EVENT_RULE:Lcom/belkin/wemo/rules/data/RMDBRuleType;

    return-object v0
.end method

.method public getSensorDeviceSet()Ljava/util/Set;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Set",
            "<",
            "Lcom/belkin/wemo/rules/data/RMSensorDevice;",
            ">;"
        }
    .end annotation

    .prologue
    .line 71
    iget-object v0, p0, Lcom/belkin/wemo/rules/data/RMEventRule;->sensorDeviceSet:Ljava/util/Set;

    return-object v0
.end method

.method public getSensorDuration()I
    .locals 1

    .prologue
    .line 28
    iget v0, p0, Lcom/belkin/wemo/rules/data/RMEventRule;->sensorDuration:I

    return v0
.end method

.method public getType()I
    .locals 1

    .prologue
    .line 36
    iget v0, p0, Lcom/belkin/wemo/rules/data/RMEventRule;->type:I

    return v0
.end method

.method public removeSensorDevice(Lcom/belkin/wemo/rules/data/RMSensorDevice;)Z
    .locals 1
    .param p1, "device"    # Lcom/belkin/wemo/rules/data/RMSensorDevice;

    .prologue
    .line 86
    iget-object v0, p0, Lcom/belkin/wemo/rules/data/RMEventRule;->sensorDeviceSet:Ljava/util/Set;

    invoke-interface {v0, p1}, Ljava/util/Set;->remove(Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method public setSensorDeviceSet(Ljava/util/Set;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Set",
            "<",
            "Lcom/belkin/wemo/rules/data/RMSensorDevice;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 78
    .local p1, "targetDeviceSet":Ljava/util/Set;, "Ljava/util/Set<Lcom/belkin/wemo/rules/data/RMSensorDevice;>;"
    iput-object p1, p0, Lcom/belkin/wemo/rules/data/RMEventRule;->sensorDeviceSet:Ljava/util/Set;

    .line 79
    return-void
.end method

.method public setSensorDuration(I)V
    .locals 0
    .param p1, "sensorDuration"    # I

    .prologue
    .line 32
    iput p1, p0, Lcom/belkin/wemo/rules/data/RMEventRule;->sensorDuration:I

    .line 33
    return-void
.end method

.method public setType(I)V
    .locals 0
    .param p1, "type"    # I

    .prologue
    .line 40
    iput p1, p0, Lcom/belkin/wemo/rules/data/RMEventRule;->type:I

    .line 41
    return-void
.end method

.method public toJSON(Lorg/json/JSONObject;)Lorg/json/JSONObject;
    .locals 4
    .param p1, "jsonObject"    # Lorg/json/JSONObject;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .prologue
    .line 91
    invoke-super {p0, p1}, Lcom/belkin/wemo/rules/data/RMDBRule;->toJSON(Lorg/json/JSONObject;)Lorg/json/JSONObject;

    .line 94
    new-instance v2, Lorg/json/JSONArray;

    invoke-direct {v2}, Lorg/json/JSONArray;-><init>()V

    .line 95
    .local v2, "ja":Lorg/json/JSONArray;
    iget-object v3, p0, Lcom/belkin/wemo/rules/data/RMEventRule;->sensorDeviceSet:Ljava/util/Set;

    invoke-interface {v3}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "i$":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/belkin/wemo/rules/data/RMSensorDevice;

    .line 96
    .local v0, "device":Lcom/belkin/wemo/rules/data/RMSensorDevice;
    new-instance v3, Lorg/json/JSONObject;

    invoke-direct {v3}, Lorg/json/JSONObject;-><init>()V

    invoke-virtual {v0, v3}, Lcom/belkin/wemo/rules/data/RMSensorDevice;->toJSON(Lorg/json/JSONObject;)Lorg/json/JSONObject;

    move-result-object v3

    invoke-virtual {v2, v3}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;

    goto :goto_0

    .line 98
    .end local v0    # "device":Lcom/belkin/wemo/rules/data/RMSensorDevice;
    :cond_0
    const-string v3, "SENSOR_DEV_ARR"

    invoke-virtual {p1, v3, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 100
    return-object p1
.end method
