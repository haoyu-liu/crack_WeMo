.class Lcom/belkin/wemo/rules/builder/RMLongPressRuleBuilder;
.super Lcom/belkin/wemo/rules/builder/RMAbstractDBRuleBuilder;
.source "RMLongPressRuleBuilder.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/belkin/wemo/rules/builder/RMAbstractDBRuleBuilder",
        "<",
        "Lcom/belkin/wemo/rules/data/RMLongPressRule;",
        ">;"
    }
.end annotation


# direct methods
.method public constructor <init>(Lorg/json/JSONObject;)V
    .locals 0
    .param p1, "ruleJSONObject"    # Lorg/json/JSONObject;

    .prologue
    .line 13
    invoke-direct {p0, p1}, Lcom/belkin/wemo/rules/builder/RMAbstractDBRuleBuilder;-><init>(Lorg/json/JSONObject;)V

    .line 14
    return-void
.end method

.method private addTargetDevices()V
    .locals 9
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .prologue
    .line 29
    iget-object v7, p0, Lcom/belkin/wemo/rules/builder/RMLongPressRuleBuilder;->ruleJO:Lorg/json/JSONObject;

    const-string v8, "TARGET_DEV_ARR"

    invoke-virtual {v7, v8}, Lorg/json/JSONObject;->getJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v5

    .line 30
    .local v5, "targetDevicesArr":Lorg/json/JSONArray;
    invoke-virtual {v5}, Lorg/json/JSONArray;->length()I

    move-result v0

    .line 32
    .local v0, "count":I
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_0
    if-ge v2, v0, :cond_0

    .line 33
    invoke-virtual {v5, v2}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v4

    .line 34
    .local v4, "targetDevice":Lorg/json/JSONObject;
    const-string v7, "DEVICE_ID"

    invoke-virtual {v4, v7}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 35
    .local v1, "deviceId":Ljava/lang/String;
    const-string v7, "DEVICE_INDEX"

    invoke-virtual {v4, v7}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v3

    .line 37
    .local v3, "index":I
    new-instance v6, Lcom/belkin/wemo/rules/data/RMTargetDevice;

    invoke-direct {v6}, Lcom/belkin/wemo/rules/data/RMTargetDevice;-><init>()V

    .line 38
    .local v6, "td":Lcom/belkin/wemo/rules/data/RMTargetDevice;
    invoke-virtual {v6, v1}, Lcom/belkin/wemo/rules/data/RMTargetDevice;->setDeviceId(Ljava/lang/String;)V

    .line 39
    invoke-virtual {v6, v3}, Lcom/belkin/wemo/rules/data/RMTargetDevice;->setDeviceIndex(I)V

    .line 41
    iget-object v7, p0, Lcom/belkin/wemo/rules/builder/RMLongPressRuleBuilder;->rule:Lcom/belkin/wemo/rules/data/RMRule;

    check-cast v7, Lcom/belkin/wemo/rules/data/RMLongPressRule;

    invoke-virtual {v7, v6}, Lcom/belkin/wemo/rules/data/RMLongPressRule;->addTargetDevice(Lcom/belkin/wemo/rules/data/RMTargetDevice;)Z

    .line 32
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 43
    .end local v1    # "deviceId":Ljava/lang/String;
    .end local v3    # "index":I
    .end local v4    # "targetDevice":Lorg/json/JSONObject;
    .end local v6    # "td":Lcom/belkin/wemo/rules/data/RMTargetDevice;
    :cond_0
    return-void
.end method


# virtual methods
.method protected addRuleDetails()V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .prologue
    .line 23
    invoke-super {p0}, Lcom/belkin/wemo/rules/builder/RMAbstractDBRuleBuilder;->addRuleDetails()V

    .line 25
    invoke-direct {p0}, Lcom/belkin/wemo/rules/builder/RMLongPressRuleBuilder;->addTargetDevices()V

    .line 26
    return-void
.end method

.method public instantiateRule()Lcom/belkin/wemo/rules/data/RMLongPressRule;
    .locals 1

    .prologue
    .line 18
    new-instance v0, Lcom/belkin/wemo/rules/data/RMLongPressRule;

    invoke-direct {v0}, Lcom/belkin/wemo/rules/data/RMLongPressRule;-><init>()V

    return-object v0
.end method

.method public bridge synthetic instantiateRule()Lcom/belkin/wemo/rules/data/RMRule;
    .locals 1

    .prologue
    .line 10
    invoke-virtual {p0}, Lcom/belkin/wemo/rules/builder/RMLongPressRuleBuilder;->instantiateRule()Lcom/belkin/wemo/rules/data/RMLongPressRule;

    move-result-object v0

    return-object v0
.end method
