.class public Lcom/belkin/rules/dbmigration/Switch_1_X;
.super Lcom/belkin/rules/dbmigration/DBDataHolder;
.source "Switch_1_X.java"


# instance fields
.field deviceact:Ljava/lang/String;

.field enable:Ljava/lang/String;

.field fri:Ljava/lang/String;

.field id:I

.field mon:Ljava/lang/String;

.field name:Ljava/lang/String;

.field sat:Ljava/lang/String;

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

    .line 43
    const-string v0, ""

    iput-object v0, p0, Lcom/belkin/rules/dbmigration/Switch_1_X;->udn:Ljava/lang/String;

    .line 44
    const-string v0, ""

    iput-object v0, p0, Lcom/belkin/rules/dbmigration/Switch_1_X;->name:Ljava/lang/String;

    .line 45
    const-string v0, ""

    iput-object v0, p0, Lcom/belkin/rules/dbmigration/Switch_1_X;->type:Ljava/lang/String;

    .line 46
    const-string v0, ""

    iput-object v0, p0, Lcom/belkin/rules/dbmigration/Switch_1_X;->enable:Ljava/lang/String;

    .line 47
    const-string v0, ""

    iput-object v0, p0, Lcom/belkin/rules/dbmigration/Switch_1_X;->sun:Ljava/lang/String;

    .line 48
    const-string v0, ""

    iput-object v0, p0, Lcom/belkin/rules/dbmigration/Switch_1_X;->mon:Ljava/lang/String;

    .line 49
    const-string v0, ""

    iput-object v0, p0, Lcom/belkin/rules/dbmigration/Switch_1_X;->tue:Ljava/lang/String;

    .line 50
    const-string v0, ""

    iput-object v0, p0, Lcom/belkin/rules/dbmigration/Switch_1_X;->wed:Ljava/lang/String;

    .line 51
    const-string v0, ""

    iput-object v0, p0, Lcom/belkin/rules/dbmigration/Switch_1_X;->thu:Ljava/lang/String;

    .line 52
    const-string v0, ""

    iput-object v0, p0, Lcom/belkin/rules/dbmigration/Switch_1_X;->fri:Ljava/lang/String;

    .line 53
    const-string v0, ""

    iput-object v0, p0, Lcom/belkin/rules/dbmigration/Switch_1_X;->sat:Ljava/lang/String;

    .line 54
    const-string v0, "1"

    iput-object v0, p0, Lcom/belkin/rules/dbmigration/Switch_1_X;->deviceact:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public getDeviceact()Ljava/lang/String;
    .locals 1

    .prologue
    .line 128
    iget-object v0, p0, Lcom/belkin/rules/dbmigration/Switch_1_X;->deviceact:Ljava/lang/String;

    return-object v0
.end method

.method public getEnable()Ljava/lang/String;
    .locals 1

    .prologue
    .line 80
    iget-object v0, p0, Lcom/belkin/rules/dbmigration/Switch_1_X;->enable:Ljava/lang/String;

    return-object v0
.end method

.method public getFri()Ljava/lang/String;
    .locals 1

    .prologue
    .line 116
    iget-object v0, p0, Lcom/belkin/rules/dbmigration/Switch_1_X;->fri:Ljava/lang/String;

    return-object v0
.end method

.method public getId()I
    .locals 1

    .prologue
    .line 56
    iget v0, p0, Lcom/belkin/rules/dbmigration/Switch_1_X;->id:I

    return v0
.end method

.method public getMon()Ljava/lang/String;
    .locals 1

    .prologue
    .line 92
    iget-object v0, p0, Lcom/belkin/rules/dbmigration/Switch_1_X;->mon:Ljava/lang/String;

    return-object v0
.end method

.method public getName()Ljava/lang/String;
    .locals 1

    .prologue
    .line 68
    iget-object v0, p0, Lcom/belkin/rules/dbmigration/Switch_1_X;->name:Ljava/lang/String;

    return-object v0
.end method

.method public getSat()Ljava/lang/String;
    .locals 1

    .prologue
    .line 122
    iget-object v0, p0, Lcom/belkin/rules/dbmigration/Switch_1_X;->sat:Ljava/lang/String;

    return-object v0
.end method

.method public getSun()Ljava/lang/String;
    .locals 1

    .prologue
    .line 86
    iget-object v0, p0, Lcom/belkin/rules/dbmigration/Switch_1_X;->sun:Ljava/lang/String;

    return-object v0
.end method

.method public getThu()Ljava/lang/String;
    .locals 1

    .prologue
    .line 110
    iget-object v0, p0, Lcom/belkin/rules/dbmigration/Switch_1_X;->thu:Ljava/lang/String;

    return-object v0
.end method

.method public getTue()Ljava/lang/String;
    .locals 1

    .prologue
    .line 98
    iget-object v0, p0, Lcom/belkin/rules/dbmigration/Switch_1_X;->tue:Ljava/lang/String;

    return-object v0
.end method

.method public getType()Ljava/lang/String;
    .locals 1

    .prologue
    .line 74
    iget-object v0, p0, Lcom/belkin/rules/dbmigration/Switch_1_X;->type:Ljava/lang/String;

    return-object v0
.end method

.method public getUdn()Ljava/lang/String;
    .locals 1

    .prologue
    .line 62
    iget-object v0, p0, Lcom/belkin/rules/dbmigration/Switch_1_X;->udn:Ljava/lang/String;

    return-object v0
.end method

.method public getWed()Ljava/lang/String;
    .locals 1

    .prologue
    .line 104
    iget-object v0, p0, Lcom/belkin/rules/dbmigration/Switch_1_X;->wed:Ljava/lang/String;

    return-object v0
.end method

.method public setDeviceact(Ljava/lang/String;)V
    .locals 0
    .param p1, "deviceact"    # Ljava/lang/String;

    .prologue
    .line 131
    iput-object p1, p0, Lcom/belkin/rules/dbmigration/Switch_1_X;->deviceact:Ljava/lang/String;

    .line 132
    return-void
.end method

.method public setEnable(Ljava/lang/String;)V
    .locals 0
    .param p1, "enable"    # Ljava/lang/String;

    .prologue
    .line 83
    iput-object p1, p0, Lcom/belkin/rules/dbmigration/Switch_1_X;->enable:Ljava/lang/String;

    .line 84
    return-void
.end method

.method public setFri(Ljava/lang/String;)V
    .locals 0
    .param p1, "fri"    # Ljava/lang/String;

    .prologue
    .line 119
    iput-object p1, p0, Lcom/belkin/rules/dbmigration/Switch_1_X;->fri:Ljava/lang/String;

    .line 120
    return-void
.end method

.method public setId(I)V
    .locals 0
    .param p1, "id"    # I

    .prologue
    .line 59
    iput p1, p0, Lcom/belkin/rules/dbmigration/Switch_1_X;->id:I

    .line 60
    return-void
.end method

.method public setMon(Ljava/lang/String;)V
    .locals 0
    .param p1, "mon"    # Ljava/lang/String;

    .prologue
    .line 95
    iput-object p1, p0, Lcom/belkin/rules/dbmigration/Switch_1_X;->mon:Ljava/lang/String;

    .line 96
    return-void
.end method

.method public setName(Ljava/lang/String;)V
    .locals 0
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    .line 71
    iput-object p1, p0, Lcom/belkin/rules/dbmigration/Switch_1_X;->name:Ljava/lang/String;

    .line 72
    return-void
.end method

.method public setSat(Ljava/lang/String;)V
    .locals 0
    .param p1, "sat"    # Ljava/lang/String;

    .prologue
    .line 125
    iput-object p1, p0, Lcom/belkin/rules/dbmigration/Switch_1_X;->sat:Ljava/lang/String;

    .line 126
    return-void
.end method

.method public setSun(Ljava/lang/String;)V
    .locals 0
    .param p1, "sun"    # Ljava/lang/String;

    .prologue
    .line 89
    iput-object p1, p0, Lcom/belkin/rules/dbmigration/Switch_1_X;->sun:Ljava/lang/String;

    .line 90
    return-void
.end method

.method public setThu(Ljava/lang/String;)V
    .locals 0
    .param p1, "thu"    # Ljava/lang/String;

    .prologue
    .line 113
    iput-object p1, p0, Lcom/belkin/rules/dbmigration/Switch_1_X;->thu:Ljava/lang/String;

    .line 114
    return-void
.end method

.method public setTue(Ljava/lang/String;)V
    .locals 0
    .param p1, "tue"    # Ljava/lang/String;

    .prologue
    .line 101
    iput-object p1, p0, Lcom/belkin/rules/dbmigration/Switch_1_X;->tue:Ljava/lang/String;

    .line 102
    return-void
.end method

.method public setType(Ljava/lang/String;)V
    .locals 0
    .param p1, "type"    # Ljava/lang/String;

    .prologue
    .line 77
    iput-object p1, p0, Lcom/belkin/rules/dbmigration/Switch_1_X;->type:Ljava/lang/String;

    .line 78
    return-void
.end method

.method public setUdn(Ljava/lang/String;)V
    .locals 0
    .param p1, "udn"    # Ljava/lang/String;

    .prologue
    .line 65
    iput-object p1, p0, Lcom/belkin/rules/dbmigration/Switch_1_X;->udn:Ljava/lang/String;

    .line 66
    return-void
.end method

.method public setWed(Ljava/lang/String;)V
    .locals 0
    .param p1, "wed"    # Ljava/lang/String;

    .prologue
    .line 107
    iput-object p1, p0, Lcom/belkin/rules/dbmigration/Switch_1_X;->wed:Ljava/lang/String;

    .line 108
    return-void
.end method
