.class public Lcom/belkin/rules/dbmigration/Sensor_1_X;
.super Lcom/belkin/rules/dbmigration/DBDataHolder;
.source "Sensor_1_X.java"


# instance fields
.field deviceact:Ljava/lang/String;

.field enable:Ljava/lang/String;

.field endTime:Ljava/lang/String;

.field fri:Ljava/lang/String;

.field id:I

.field mon:Ljava/lang/String;

.field name:Ljava/lang/String;

.field sat:Ljava/lang/String;

.field sensitivity:Ljava/lang/String;

.field sensorudn:Ljava/lang/String;

.field startTime:Ljava/lang/String;

.field sun:Ljava/lang/String;

.field thu:Ljava/lang/String;

.field tue:Ljava/lang/String;

.field type:Ljava/lang/String;

.field udn:Ljava/lang/String;

.field wed:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 40
    invoke-direct {p0}, Lcom/belkin/rules/dbmigration/DBDataHolder;-><init>()V

    .line 42
    const-string v0, ""

    iput-object v0, p0, Lcom/belkin/rules/dbmigration/Sensor_1_X;->udn:Ljava/lang/String;

    .line 43
    const-string v0, ""

    iput-object v0, p0, Lcom/belkin/rules/dbmigration/Sensor_1_X;->name:Ljava/lang/String;

    .line 44
    const-string v0, ""

    iput-object v0, p0, Lcom/belkin/rules/dbmigration/Sensor_1_X;->type:Ljava/lang/String;

    .line 46
    const-string v0, ""

    iput-object v0, p0, Lcom/belkin/rules/dbmigration/Sensor_1_X;->sun:Ljava/lang/String;

    .line 47
    const-string v0, ""

    iput-object v0, p0, Lcom/belkin/rules/dbmigration/Sensor_1_X;->mon:Ljava/lang/String;

    .line 48
    const-string v0, ""

    iput-object v0, p0, Lcom/belkin/rules/dbmigration/Sensor_1_X;->tue:Ljava/lang/String;

    .line 49
    const-string v0, ""

    iput-object v0, p0, Lcom/belkin/rules/dbmigration/Sensor_1_X;->wed:Ljava/lang/String;

    .line 50
    const-string v0, ""

    iput-object v0, p0, Lcom/belkin/rules/dbmigration/Sensor_1_X;->thu:Ljava/lang/String;

    .line 51
    const-string v0, ""

    iput-object v0, p0, Lcom/belkin/rules/dbmigration/Sensor_1_X;->fri:Ljava/lang/String;

    .line 52
    const-string v0, ""

    iput-object v0, p0, Lcom/belkin/rules/dbmigration/Sensor_1_X;->sat:Ljava/lang/String;

    .line 53
    const-string v0, ""

    iput-object v0, p0, Lcom/belkin/rules/dbmigration/Sensor_1_X;->deviceact:Ljava/lang/String;

    .line 54
    const-string v0, ""

    iput-object v0, p0, Lcom/belkin/rules/dbmigration/Sensor_1_X;->sensorudn:Ljava/lang/String;

    .line 55
    const-string v0, ""

    iput-object v0, p0, Lcom/belkin/rules/dbmigration/Sensor_1_X;->startTime:Ljava/lang/String;

    .line 56
    const-string v0, ""

    iput-object v0, p0, Lcom/belkin/rules/dbmigration/Sensor_1_X;->endTime:Ljava/lang/String;

    .line 57
    const-string v0, ""

    iput-object v0, p0, Lcom/belkin/rules/dbmigration/Sensor_1_X;->sensitivity:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public getDeviceact()Ljava/lang/String;
    .locals 1

    .prologue
    .line 131
    iget-object v0, p0, Lcom/belkin/rules/dbmigration/Sensor_1_X;->deviceact:Ljava/lang/String;

    return-object v0
.end method

.method public getEnable()Ljava/lang/String;
    .locals 1

    .prologue
    .line 83
    iget-object v0, p0, Lcom/belkin/rules/dbmigration/Sensor_1_X;->enable:Ljava/lang/String;

    return-object v0
.end method

.method public getEndTime()Ljava/lang/String;
    .locals 1

    .prologue
    .line 149
    iget-object v0, p0, Lcom/belkin/rules/dbmigration/Sensor_1_X;->endTime:Ljava/lang/String;

    return-object v0
.end method

.method public getFri()Ljava/lang/String;
    .locals 1

    .prologue
    .line 119
    iget-object v0, p0, Lcom/belkin/rules/dbmigration/Sensor_1_X;->fri:Ljava/lang/String;

    return-object v0
.end method

.method public getId()I
    .locals 1

    .prologue
    .line 59
    iget v0, p0, Lcom/belkin/rules/dbmigration/Sensor_1_X;->id:I

    return v0
.end method

.method public getMon()Ljava/lang/String;
    .locals 1

    .prologue
    .line 95
    iget-object v0, p0, Lcom/belkin/rules/dbmigration/Sensor_1_X;->mon:Ljava/lang/String;

    return-object v0
.end method

.method public getName()Ljava/lang/String;
    .locals 1

    .prologue
    .line 71
    iget-object v0, p0, Lcom/belkin/rules/dbmigration/Sensor_1_X;->name:Ljava/lang/String;

    return-object v0
.end method

.method public getSat()Ljava/lang/String;
    .locals 1

    .prologue
    .line 125
    iget-object v0, p0, Lcom/belkin/rules/dbmigration/Sensor_1_X;->sat:Ljava/lang/String;

    return-object v0
.end method

.method public getSensitivity()Ljava/lang/String;
    .locals 1

    .prologue
    .line 155
    iget-object v0, p0, Lcom/belkin/rules/dbmigration/Sensor_1_X;->sensitivity:Ljava/lang/String;

    return-object v0
.end method

.method public getSensorudn()Ljava/lang/String;
    .locals 1

    .prologue
    .line 137
    iget-object v0, p0, Lcom/belkin/rules/dbmigration/Sensor_1_X;->sensorudn:Ljava/lang/String;

    return-object v0
.end method

.method public getStartTime()Ljava/lang/String;
    .locals 1

    .prologue
    .line 143
    iget-object v0, p0, Lcom/belkin/rules/dbmigration/Sensor_1_X;->startTime:Ljava/lang/String;

    return-object v0
.end method

.method public getSun()Ljava/lang/String;
    .locals 1

    .prologue
    .line 89
    iget-object v0, p0, Lcom/belkin/rules/dbmigration/Sensor_1_X;->sun:Ljava/lang/String;

    return-object v0
.end method

.method public getThu()Ljava/lang/String;
    .locals 1

    .prologue
    .line 113
    iget-object v0, p0, Lcom/belkin/rules/dbmigration/Sensor_1_X;->thu:Ljava/lang/String;

    return-object v0
.end method

.method public getTue()Ljava/lang/String;
    .locals 1

    .prologue
    .line 101
    iget-object v0, p0, Lcom/belkin/rules/dbmigration/Sensor_1_X;->tue:Ljava/lang/String;

    return-object v0
.end method

.method public getType()Ljava/lang/String;
    .locals 1

    .prologue
    .line 77
    iget-object v0, p0, Lcom/belkin/rules/dbmigration/Sensor_1_X;->type:Ljava/lang/String;

    return-object v0
.end method

.method public getUdn()Ljava/lang/String;
    .locals 1

    .prologue
    .line 65
    iget-object v0, p0, Lcom/belkin/rules/dbmigration/Sensor_1_X;->udn:Ljava/lang/String;

    return-object v0
.end method

.method public getWed()Ljava/lang/String;
    .locals 1

    .prologue
    .line 107
    iget-object v0, p0, Lcom/belkin/rules/dbmigration/Sensor_1_X;->wed:Ljava/lang/String;

    return-object v0
.end method

.method public setDeviceact(Ljava/lang/String;)V
    .locals 0
    .param p1, "deviceact"    # Ljava/lang/String;

    .prologue
    .line 134
    iput-object p1, p0, Lcom/belkin/rules/dbmigration/Sensor_1_X;->deviceact:Ljava/lang/String;

    .line 135
    return-void
.end method

.method public setEnable(Ljava/lang/String;)V
    .locals 0
    .param p1, "enable"    # Ljava/lang/String;

    .prologue
    .line 86
    iput-object p1, p0, Lcom/belkin/rules/dbmigration/Sensor_1_X;->enable:Ljava/lang/String;

    .line 87
    return-void
.end method

.method public setEndTime(Ljava/lang/String;)V
    .locals 0
    .param p1, "endTime"    # Ljava/lang/String;

    .prologue
    .line 152
    iput-object p1, p0, Lcom/belkin/rules/dbmigration/Sensor_1_X;->endTime:Ljava/lang/String;

    .line 153
    return-void
.end method

.method public setFri(Ljava/lang/String;)V
    .locals 0
    .param p1, "fri"    # Ljava/lang/String;

    .prologue
    .line 122
    iput-object p1, p0, Lcom/belkin/rules/dbmigration/Sensor_1_X;->fri:Ljava/lang/String;

    .line 123
    return-void
.end method

.method public setId(I)V
    .locals 0
    .param p1, "id"    # I

    .prologue
    .line 62
    iput p1, p0, Lcom/belkin/rules/dbmigration/Sensor_1_X;->id:I

    .line 63
    return-void
.end method

.method public setMon(Ljava/lang/String;)V
    .locals 0
    .param p1, "mon"    # Ljava/lang/String;

    .prologue
    .line 98
    iput-object p1, p0, Lcom/belkin/rules/dbmigration/Sensor_1_X;->mon:Ljava/lang/String;

    .line 99
    return-void
.end method

.method public setName(Ljava/lang/String;)V
    .locals 0
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    .line 74
    iput-object p1, p0, Lcom/belkin/rules/dbmigration/Sensor_1_X;->name:Ljava/lang/String;

    .line 75
    return-void
.end method

.method public setSat(Ljava/lang/String;)V
    .locals 0
    .param p1, "sat"    # Ljava/lang/String;

    .prologue
    .line 128
    iput-object p1, p0, Lcom/belkin/rules/dbmigration/Sensor_1_X;->sat:Ljava/lang/String;

    .line 129
    return-void
.end method

.method public setSensitivity(Ljava/lang/String;)V
    .locals 0
    .param p1, "sensitivity"    # Ljava/lang/String;

    .prologue
    .line 158
    iput-object p1, p0, Lcom/belkin/rules/dbmigration/Sensor_1_X;->sensitivity:Ljava/lang/String;

    .line 159
    return-void
.end method

.method public setSensorudn(Ljava/lang/String;)V
    .locals 0
    .param p1, "sensorudn"    # Ljava/lang/String;

    .prologue
    .line 140
    iput-object p1, p0, Lcom/belkin/rules/dbmigration/Sensor_1_X;->sensorudn:Ljava/lang/String;

    .line 141
    return-void
.end method

.method public setStartTime(Ljava/lang/String;)V
    .locals 0
    .param p1, "startTime"    # Ljava/lang/String;

    .prologue
    .line 146
    iput-object p1, p0, Lcom/belkin/rules/dbmigration/Sensor_1_X;->startTime:Ljava/lang/String;

    .line 147
    return-void
.end method

.method public setSun(Ljava/lang/String;)V
    .locals 0
    .param p1, "sun"    # Ljava/lang/String;

    .prologue
    .line 92
    iput-object p1, p0, Lcom/belkin/rules/dbmigration/Sensor_1_X;->sun:Ljava/lang/String;

    .line 93
    return-void
.end method

.method public setThu(Ljava/lang/String;)V
    .locals 0
    .param p1, "thu"    # Ljava/lang/String;

    .prologue
    .line 116
    iput-object p1, p0, Lcom/belkin/rules/dbmigration/Sensor_1_X;->thu:Ljava/lang/String;

    .line 117
    return-void
.end method

.method public setTue(Ljava/lang/String;)V
    .locals 0
    .param p1, "tue"    # Ljava/lang/String;

    .prologue
    .line 104
    iput-object p1, p0, Lcom/belkin/rules/dbmigration/Sensor_1_X;->tue:Ljava/lang/String;

    .line 105
    return-void
.end method

.method public setType(Ljava/lang/String;)V
    .locals 0
    .param p1, "type"    # Ljava/lang/String;

    .prologue
    .line 80
    iput-object p1, p0, Lcom/belkin/rules/dbmigration/Sensor_1_X;->type:Ljava/lang/String;

    .line 81
    return-void
.end method

.method public setUdn(Ljava/lang/String;)V
    .locals 0
    .param p1, "udn"    # Ljava/lang/String;

    .prologue
    .line 68
    iput-object p1, p0, Lcom/belkin/rules/dbmigration/Sensor_1_X;->udn:Ljava/lang/String;

    .line 69
    return-void
.end method

.method public setWed(Ljava/lang/String;)V
    .locals 0
    .param p1, "wed"    # Ljava/lang/String;

    .prologue
    .line 110
    iput-object p1, p0, Lcom/belkin/rules/dbmigration/Sensor_1_X;->wed:Ljava/lang/String;

    .line 111
    return-void
.end method
