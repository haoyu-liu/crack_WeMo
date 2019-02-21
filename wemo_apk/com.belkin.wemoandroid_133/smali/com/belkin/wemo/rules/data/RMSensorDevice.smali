.class public Lcom/belkin/wemo/rules/data/RMSensorDevice;
.super Lcom/belkin/wemo/rules/data/device/RMDBRuleDevice;
.source "RMSensorDevice.java"


# instance fields
.field private level:I

.field private sensorDuration:I

.field private type:I

.field private value:I


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 8
    invoke-direct {p0}, Lcom/belkin/wemo/rules/data/device/RMDBRuleDevice;-><init>()V

    return-void
.end method


# virtual methods
.method public getLevel()I
    .locals 1

    .prologue
    .line 54
    iget v0, p0, Lcom/belkin/wemo/rules/data/RMSensorDevice;->level:I

    return v0
.end method

.method public getSensorDuration()I
    .locals 1

    .prologue
    .line 38
    iget v0, p0, Lcom/belkin/wemo/rules/data/RMSensorDevice;->sensorDuration:I

    return v0
.end method

.method public getType()I
    .locals 1

    .prologue
    .line 30
    iget v0, p0, Lcom/belkin/wemo/rules/data/RMSensorDevice;->type:I

    return v0
.end method

.method public getValue()I
    .locals 1

    .prologue
    .line 46
    iget v0, p0, Lcom/belkin/wemo/rules/data/RMSensorDevice;->value:I

    return v0
.end method

.method public setLevel(I)V
    .locals 0
    .param p1, "level"    # I

    .prologue
    .line 58
    iput p1, p0, Lcom/belkin/wemo/rules/data/RMSensorDevice;->level:I

    .line 59
    return-void
.end method

.method public setSensorDuration(I)V
    .locals 0
    .param p1, "sensorDuration"    # I

    .prologue
    .line 42
    iput p1, p0, Lcom/belkin/wemo/rules/data/RMSensorDevice;->sensorDuration:I

    .line 43
    return-void
.end method

.method public setType(I)V
    .locals 0
    .param p1, "type"    # I

    .prologue
    .line 34
    iput p1, p0, Lcom/belkin/wemo/rules/data/RMSensorDevice;->type:I

    .line 35
    return-void
.end method

.method public setValue(I)V
    .locals 0
    .param p1, "value"    # I

    .prologue
    .line 50
    iput p1, p0, Lcom/belkin/wemo/rules/data/RMSensorDevice;->value:I

    .line 51
    return-void
.end method

.method public toJSON(Lorg/json/JSONObject;)Lorg/json/JSONObject;
    .locals 2
    .param p1, "jo"    # Lorg/json/JSONObject;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .prologue
    .line 17
    invoke-super {p0, p1}, Lcom/belkin/wemo/rules/data/device/RMDBRuleDevice;->toJSON(Lorg/json/JSONObject;)Lorg/json/JSONObject;

    .line 18
    const-string v0, "TYPE"

    iget v1, p0, Lcom/belkin/wemo/rules/data/RMSensorDevice;->type:I

    invoke-virtual {p1, v0, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    .line 19
    const-string v0, "SENSOR_DURATION"

    iget v1, p0, Lcom/belkin/wemo/rules/data/RMSensorDevice;->sensorDuration:I

    invoke-virtual {p1, v0, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    .line 21
    return-object p1
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .prologue
    .line 26
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "{TYPE: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v1, p0, Lcom/belkin/wemo/rules/data/RMSensorDevice;->type:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", LEVEL: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v1, p0, Lcom/belkin/wemo/rules/data/RMSensorDevice;->level:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", SENSOR_DURATION: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v1, p0, Lcom/belkin/wemo/rules/data/RMSensorDevice;->sensorDuration:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", VALUE: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v1, p0, Lcom/belkin/wemo/rules/data/RMSensorDevice;->value:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "}"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
