.class public final Lcom/belkin/rules/dbmigration/GroupDeviceTable;
.super Ljava/lang/Object;
.source "GroupDeviceTable.java"


# instance fields
.field private deviceCombinationPK:I

.field private deviceId:Ljava/lang/String;

.field private groupId:I


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 40
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 43
    const-string v0, ""

    iput-object v0, p0, Lcom/belkin/rules/dbmigration/GroupDeviceTable;->deviceId:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public getDeviceCombinationPK()I
    .locals 1

    .prologue
    .line 45
    iget v0, p0, Lcom/belkin/rules/dbmigration/GroupDeviceTable;->deviceCombinationPK:I

    return v0
.end method

.method public getDeviceId()Ljava/lang/String;
    .locals 1

    .prologue
    .line 57
    iget-object v0, p0, Lcom/belkin/rules/dbmigration/GroupDeviceTable;->deviceId:Ljava/lang/String;

    return-object v0
.end method

.method public getGroupId()I
    .locals 1

    .prologue
    .line 51
    iget v0, p0, Lcom/belkin/rules/dbmigration/GroupDeviceTable;->groupId:I

    return v0
.end method

.method public setDeviceCombinationPK(I)V
    .locals 0
    .param p1, "deviceCombinationPK"    # I

    .prologue
    .line 48
    iput p1, p0, Lcom/belkin/rules/dbmigration/GroupDeviceTable;->deviceCombinationPK:I

    .line 49
    return-void
.end method

.method public setDeviceId(Ljava/lang/String;)V
    .locals 0
    .param p1, "deviceId"    # Ljava/lang/String;

    .prologue
    .line 60
    iput-object p1, p0, Lcom/belkin/rules/dbmigration/GroupDeviceTable;->deviceId:Ljava/lang/String;

    .line 61
    return-void
.end method

.method public setGroupId(I)V
    .locals 0
    .param p1, "groupId"    # I

    .prologue
    .line 54
    iput p1, p0, Lcom/belkin/rules/dbmigration/GroupDeviceTable;->groupId:I

    .line 55
    return-void
.end method
