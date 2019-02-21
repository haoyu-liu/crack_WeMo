.class public Lcom/belkin/wemo/rules/data/RMLongPressRule;
.super Lcom/belkin/wemo/rules/data/RMDBRule;
.source "RMLongPressRule.java"


# static fields
.field public static final ACTION_AWAY_MODE:I = 0x3


# instance fields
.field private targetDeviceSet:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set",
            "<",
            "Lcom/belkin/wemo/rules/data/RMTargetDevice;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 38
    invoke-direct {p0}, Lcom/belkin/wemo/rules/data/RMDBRule;-><init>()V

    .line 39
    invoke-direct {p0}, Lcom/belkin/wemo/rules/data/RMLongPressRule;->setLongPressProperties()V

    .line 40
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
    .line 30
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

    .line 34
    invoke-direct {p0}, Lcom/belkin/wemo/rules/data/RMLongPressRule;->setLongPressProperties()V

    .line 35
    return-void
.end method

.method private setLongPressProperties()V
    .locals 1

    .prologue
    .line 43
    const/16 v0, 0x3c

    iput v0, p0, Lcom/belkin/wemo/rules/data/RMLongPressRule;->startTime:I

    .line 44
    const v0, 0x15180

    iput v0, p0, Lcom/belkin/wemo/rules/data/RMLongPressRule;->endTime:I

    .line 45
    const v0, 0x15144

    iput v0, p0, Lcom/belkin/wemo/rules/data/RMLongPressRule;->ruleDuration:I

    .line 46
    const/4 v0, -0x1

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/belkin/wemo/rules/data/RMLongPressRule;->addDay(Ljava/lang/Integer;)V

    .line 48
    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    iput-object v0, p0, Lcom/belkin/wemo/rules/data/RMLongPressRule;->targetDeviceSet:Ljava/util/Set;

    .line 49
    return-void
.end method


# virtual methods
.method public addTargetDevice(Lcom/belkin/wemo/rules/data/RMTargetDevice;)Z
    .locals 1
    .param p1, "device"    # Lcom/belkin/wemo/rules/data/RMTargetDevice;

    .prologue
    .line 77
    iget-object v0, p0, Lcom/belkin/wemo/rules/data/RMLongPressRule;->targetDeviceSet:Ljava/util/Set;

    invoke-interface {v0, p1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method public addTargetDevice(Ljava/lang/String;)Z
    .locals 3
    .param p1, "deviceId"    # Ljava/lang/String;

    .prologue
    .line 66
    const/4 v1, 0x0

    .line 67
    .local v1, "isAdded":Z
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v2

    if-nez v2, :cond_0

    .line 68
    new-instance v0, Lcom/belkin/wemo/rules/data/RMTargetDevice;

    invoke-direct {v0}, Lcom/belkin/wemo/rules/data/RMTargetDevice;-><init>()V

    .line 69
    .local v0, "device":Lcom/belkin/wemo/rules/data/RMTargetDevice;
    invoke-virtual {v0, p1}, Lcom/belkin/wemo/rules/data/RMTargetDevice;->setDeviceId(Ljava/lang/String;)V

    .line 70
    iget-object v2, p0, Lcom/belkin/wemo/rules/data/RMLongPressRule;->targetDeviceSet:Ljava/util/Set;

    invoke-interface {v2}, Ljava/util/Set;->size()I

    move-result v2

    invoke-virtual {v0, v2}, Lcom/belkin/wemo/rules/data/RMTargetDevice;->setDeviceIndex(I)V

    .line 71
    iget-object v2, p0, Lcom/belkin/wemo/rules/data/RMLongPressRule;->targetDeviceSet:Ljava/util/Set;

    invoke-interface {v2, v0}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    move-result v1

    .line 73
    .end local v0    # "device":Lcom/belkin/wemo/rules/data/RMTargetDevice;
    :cond_0
    return v1
.end method

.method protected assignDBRuleType()Lcom/belkin/wemo/rules/data/RMDBRuleType;
    .locals 1

    .prologue
    .line 96
    sget-object v0, Lcom/belkin/wemo/rules/data/RMDBRuleType;->LONG_PRESS:Lcom/belkin/wemo/rules/data/RMDBRuleType;

    return-object v0
.end method

.method public getTargetDeviceSet()Ljava/util/Set;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Set",
            "<",
            "Lcom/belkin/wemo/rules/data/RMTargetDevice;",
            ">;"
        }
    .end annotation

    .prologue
    .line 55
    iget-object v0, p0, Lcom/belkin/wemo/rules/data/RMLongPressRule;->targetDeviceSet:Ljava/util/Set;

    return-object v0
.end method

.method public removeTargetDevice(Ljava/lang/String;)Z
    .locals 4
    .param p1, "deviceId"    # Ljava/lang/String;

    .prologue
    .line 81
    const/4 v1, 0x0

    .line 83
    .local v1, "isRemoved":Z
    iget-object v3, p0, Lcom/belkin/wemo/rules/data/RMLongPressRule;->targetDeviceSet:Ljava/util/Set;

    invoke-interface {v3}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v2

    .line 84
    .local v2, "iterator":Ljava/util/Iterator;, "Ljava/util/Iterator<Lcom/belkin/wemo/rules/data/RMTargetDevice;>;"
    :cond_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_1

    .line 85
    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/belkin/wemo/rules/data/RMTargetDevice;

    .line 86
    .local v0, "device":Lcom/belkin/wemo/rules/data/RMTargetDevice;
    invoke-virtual {v0}, Lcom/belkin/wemo/rules/data/RMTargetDevice;->getDeviceId()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p1, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 87
    iget-object v3, p0, Lcom/belkin/wemo/rules/data/RMLongPressRule;->targetDeviceSet:Ljava/util/Set;

    invoke-interface {v3, v0}, Ljava/util/Set;->remove(Ljava/lang/Object;)Z

    move-result v1

    .line 91
    .end local v0    # "device":Lcom/belkin/wemo/rules/data/RMTargetDevice;
    :cond_1
    return v1
.end method

.method public setTargetDeviceSet(Ljava/util/Set;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Set",
            "<",
            "Lcom/belkin/wemo/rules/data/RMTargetDevice;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 62
    .local p1, "targetDeviceSet":Ljava/util/Set;, "Ljava/util/Set<Lcom/belkin/wemo/rules/data/RMTargetDevice;>;"
    iput-object p1, p0, Lcom/belkin/wemo/rules/data/RMLongPressRule;->targetDeviceSet:Ljava/util/Set;

    .line 63
    return-void
.end method

.method public toJSON(Lorg/json/JSONObject;)Lorg/json/JSONObject;
    .locals 4
    .param p1, "jo"    # Lorg/json/JSONObject;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .prologue
    .line 101
    invoke-super {p0, p1}, Lcom/belkin/wemo/rules/data/RMDBRule;->toJSON(Lorg/json/JSONObject;)Lorg/json/JSONObject;

    .line 104
    new-instance v2, Lorg/json/JSONArray;

    invoke-direct {v2}, Lorg/json/JSONArray;-><init>()V

    .line 105
    .local v2, "targetDevicesJA":Lorg/json/JSONArray;
    iget-object v3, p0, Lcom/belkin/wemo/rules/data/RMLongPressRule;->targetDeviceSet:Ljava/util/Set;

    invoke-interface {v3}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "i$":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/belkin/wemo/rules/data/RMTargetDevice;

    .line 106
    .local v0, "device":Lcom/belkin/wemo/rules/data/RMTargetDevice;
    new-instance v3, Lorg/json/JSONObject;

    invoke-direct {v3}, Lorg/json/JSONObject;-><init>()V

    invoke-virtual {v0, v3}, Lcom/belkin/wemo/rules/data/RMTargetDevice;->toJSONObject(Lorg/json/JSONObject;)Lorg/json/JSONObject;

    move-result-object v3

    invoke-virtual {v2, v3}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;

    goto :goto_0

    .line 108
    .end local v0    # "device":Lcom/belkin/wemo/rules/data/RMTargetDevice;
    :cond_0
    const-string v3, "TARGET_DEV_ARR"

    invoke-virtual {p1, v3, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 110
    return-object p1
.end method

.method public toString()Ljava/lang/String;
    .locals 5

    .prologue
    .line 115
    const/4 v2, 0x0

    .line 116
    .local v2, "targetDevicesStr":Ljava/lang/String;
    iget-object v3, p0, Lcom/belkin/wemo/rules/data/RMLongPressRule;->targetDeviceSet:Ljava/util/Set;

    invoke-interface {v3}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "i$":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/belkin/wemo/rules/data/RMTargetDevice;

    .line 117
    .local v0, "device":Lcom/belkin/wemo/rules/data/RMTargetDevice;
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v0}, Lcom/belkin/wemo/rules/data/RMTargetDevice;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    .line 118
    goto :goto_0

    .line 120
    .end local v0    # "device":Lcom/belkin/wemo/rules/data/RMTargetDevice;
    :cond_0
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-super {p0}, Lcom/belkin/wemo/rules/data/RMDBRule;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "; TARGET_DEVICES: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    return-object v3
.end method
