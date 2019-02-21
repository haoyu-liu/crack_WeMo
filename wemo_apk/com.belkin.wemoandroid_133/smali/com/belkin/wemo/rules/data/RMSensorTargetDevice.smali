.class public Lcom/belkin/wemo/rules/data/RMSensorTargetDevice;
.super Lcom/belkin/wemo/rules/data/device/RMLed;
.source "RMSensorTargetDevice.java"


# instance fields
.field private sensorDuration:I


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 8
    invoke-direct {p0}, Lcom/belkin/wemo/rules/data/device/RMLed;-><init>()V

    return-void
.end method


# virtual methods
.method public getSensorDuration()I
    .locals 1

    .prologue
    .line 26
    iget v0, p0, Lcom/belkin/wemo/rules/data/RMSensorTargetDevice;->sensorDuration:I

    return v0
.end method

.method public setSensorDuration(I)V
    .locals 0
    .param p1, "sensorDuration"    # I

    .prologue
    .line 30
    iput p1, p0, Lcom/belkin/wemo/rules/data/RMSensorTargetDevice;->sensorDuration:I

    .line 31
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
    .line 14
    invoke-super {p0, p1}, Lcom/belkin/wemo/rules/data/device/RMLed;->toJSON(Lorg/json/JSONObject;)Lorg/json/JSONObject;

    .line 15
    const-string v0, "SENSOR_DURATION"

    iget v1, p0, Lcom/belkin/wemo/rules/data/RMSensorTargetDevice;->sensorDuration:I

    invoke-virtual {p1, v0, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    .line 17
    return-object p1
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .prologue
    .line 22
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "{SENSOR_DURATION: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v1, p0, Lcom/belkin/wemo/rules/data/RMSensorTargetDevice;->sensorDuration:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "}"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
