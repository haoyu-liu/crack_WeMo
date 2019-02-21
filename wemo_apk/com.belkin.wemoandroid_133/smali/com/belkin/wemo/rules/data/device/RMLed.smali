.class public Lcom/belkin/wemo/rules/data/device/RMLed;
.super Lcom/belkin/wemo/rules/data/device/RMDBRuleDevice;
.source "RMLed.java"


# instance fields
.field private ledID:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 14
    invoke-direct {p0}, Lcom/belkin/wemo/rules/data/device/RMDBRuleDevice;-><init>()V

    .line 20
    return-void
.end method


# virtual methods
.method protected calculateUiUdn()V
    .locals 4

    .prologue
    .line 62
    invoke-super {p0}, Lcom/belkin/wemo/rules/data/device/RMDBRuleDevice;->calculateUiUdn()V

    .line 63
    iget-object v1, p0, Lcom/belkin/wemo/rules/data/device/RMLed;->dbUdn:Ljava/lang/String;

    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_0

    iget-object v1, p0, Lcom/belkin/wemo/rules/data/device/RMLed;->dbUdn:Ljava/lang/String;

    const-string v2, "Bridge"

    invoke-virtual {v1, v2}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 64
    iget-object v1, p0, Lcom/belkin/wemo/rules/data/device/RMLed;->dbUdn:Ljava/lang/String;

    const-string v2, ":"

    invoke-virtual {v1, v2}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v0

    .line 65
    .local v0, "bridgeArray":[Ljava/lang/String;
    array-length v1, v0

    const/4 v2, 0x3

    if-lt v1, v2, :cond_0

    .line 66
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const/4 v2, 0x0

    aget-object v2, v0, v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ":"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const/4 v2, 0x1

    aget-object v2, v0, v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lcom/belkin/wemo/rules/data/device/RMLed;->uiUdn:Ljava/lang/String;

    .line 67
    const/4 v1, 0x2

    aget-object v1, v0, v1

    iput-object v1, p0, Lcom/belkin/wemo/rules/data/device/RMLed;->ledID:Ljava/lang/String;

    .line 68
    iget-object v1, p0, Lcom/belkin/wemo/rules/data/device/RMLed;->TAG:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "calculateUiUdn: LED ID = "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p0, Lcom/belkin/wemo/rules/data/device/RMLed;->ledID:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "; BridgeUDN = "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p0, Lcom/belkin/wemo/rules/data/device/RMLed;->uiUdn:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->debugLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 71
    .end local v0    # "bridgeArray":[Ljava/lang/String;
    :cond_0
    return-void
.end method

.method public getLedID()Ljava/lang/String;
    .locals 1

    .prologue
    .line 49
    iget-object v0, p0, Lcom/belkin/wemo/rules/data/device/RMLed;->ledID:Ljava/lang/String;

    return-object v0
.end method

.method public setLedID(Ljava/lang/String;)V
    .locals 0
    .param p1, "ledID"    # Ljava/lang/String;

    .prologue
    .line 56
    iput-object p1, p0, Lcom/belkin/wemo/rules/data/device/RMLed;->ledID:Ljava/lang/String;

    .line 57
    invoke-virtual {p0}, Lcom/belkin/wemo/rules/data/device/RMLed;->calculateDbUdn()V

    .line 58
    return-void
.end method

.method public toJSON(Lorg/json/JSONObject;)Lorg/json/JSONObject;
    .locals 2
    .param p1, "ruleDeviceJO"    # Lorg/json/JSONObject;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .prologue
    .line 38
    invoke-super {p0, p1}, Lcom/belkin/wemo/rules/data/device/RMDBRuleDevice;->toJSON(Lorg/json/JSONObject;)Lorg/json/JSONObject;

    .line 39
    iget-object v0, p0, Lcom/belkin/wemo/rules/data/device/RMLed;->ledID:Ljava/lang/String;

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 40
    const-string v0, "ZIGBEE_DEV_ID"

    iget-object v1, p0, Lcom/belkin/wemo/rules/data/device/RMLed;->ledID:Ljava/lang/String;

    invoke-virtual {p1, v0, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 42
    :cond_0
    return-object p1
.end method
