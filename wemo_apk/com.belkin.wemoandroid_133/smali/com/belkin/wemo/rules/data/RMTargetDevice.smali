.class public Lcom/belkin/wemo/rules/data/RMTargetDevice;
.super Ljava/lang/Object;
.source "RMTargetDevice.java"


# instance fields
.field private final DEVICE_ID:Ljava/lang/String;

.field private final DEVICE_INDEX:Ljava/lang/String;

.field private deviceId:Ljava/lang/String;

.field private deviceIndex:I


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 21
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 10
    const-string v0, "DEVICE_INDEX"

    iput-object v0, p0, Lcom/belkin/wemo/rules/data/RMTargetDevice;->DEVICE_INDEX:Ljava/lang/String;

    .line 11
    const-string v0, "DEVICE_ID"

    iput-object v0, p0, Lcom/belkin/wemo/rules/data/RMTargetDevice;->DEVICE_ID:Ljava/lang/String;

    .line 22
    const-string v0, ""

    iput-object v0, p0, Lcom/belkin/wemo/rules/data/RMTargetDevice;->deviceId:Ljava/lang/String;

    .line 23
    return-void
.end method


# virtual methods
.method public getDeviceId()Ljava/lang/String;
    .locals 1

    .prologue
    .line 29
    iget-object v0, p0, Lcom/belkin/wemo/rules/data/RMTargetDevice;->deviceId:Ljava/lang/String;

    return-object v0
.end method

.method public getDeviceIndex()I
    .locals 1

    .prologue
    .line 43
    iget v0, p0, Lcom/belkin/wemo/rules/data/RMTargetDevice;->deviceIndex:I

    return v0
.end method

.method public setDeviceId(Ljava/lang/String;)V
    .locals 0
    .param p1, "deviceId"    # Ljava/lang/String;

    .prologue
    .line 36
    iput-object p1, p0, Lcom/belkin/wemo/rules/data/RMTargetDevice;->deviceId:Ljava/lang/String;

    .line 37
    return-void
.end method

.method public setDeviceIndex(I)V
    .locals 0
    .param p1, "deviceIndex"    # I

    .prologue
    .line 50
    iput p1, p0, Lcom/belkin/wemo/rules/data/RMTargetDevice;->deviceIndex:I

    .line 51
    return-void
.end method

.method public toJSONObject(Lorg/json/JSONObject;)Lorg/json/JSONObject;
    .locals 2
    .param p1, "jo"    # Lorg/json/JSONObject;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .prologue
    .line 54
    const-string v0, "DEVICE_ID"

    iget-object v1, p0, Lcom/belkin/wemo/rules/data/RMTargetDevice;->deviceId:Ljava/lang/String;

    invoke-virtual {p1, v0, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 55
    const-string v0, "DEVICE_INDEX"

    iget v1, p0, Lcom/belkin/wemo/rules/data/RMTargetDevice;->deviceIndex:I

    invoke-virtual {p1, v0, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    .line 57
    return-object p1
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .prologue
    .line 18
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "{DEVICE_INDEX: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v1, p0, Lcom/belkin/wemo/rules/data/RMTargetDevice;->deviceIndex:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", DEVICE_ID: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/belkin/wemo/rules/data/RMTargetDevice;->deviceId:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "}"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
