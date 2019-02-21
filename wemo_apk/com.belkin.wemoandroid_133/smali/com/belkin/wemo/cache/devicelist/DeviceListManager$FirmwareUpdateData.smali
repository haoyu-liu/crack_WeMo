.class public Lcom/belkin/wemo/cache/devicelist/DeviceListManager$FirmwareUpdateData;
.super Ljava/lang/Object;
.source "DeviceListManager.java"

# interfaces
.implements Ljava/io/Serializable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/belkin/wemo/cache/devicelist/DeviceListManager;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "FirmwareUpdateData"
.end annotation


# static fields
.field private static final serialVersionUID:J = 0x6ea40825606237e0L


# instance fields
.field private fwStatus:Ljava/lang/String;

.field private oldFwVersion:Ljava/lang/String;

.field private statusTS:J

.field private udn:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 298
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 300
    return-void
.end method


# virtual methods
.method public getFwStatus()Ljava/lang/String;
    .locals 1

    .prologue
    .line 311
    iget-object v0, p0, Lcom/belkin/wemo/cache/devicelist/DeviceListManager$FirmwareUpdateData;->fwStatus:Ljava/lang/String;

    return-object v0
.end method

.method public getOldFwVersion()Ljava/lang/String;
    .locals 1

    .prologue
    .line 288
    iget-object v0, p0, Lcom/belkin/wemo/cache/devicelist/DeviceListManager$FirmwareUpdateData;->oldFwVersion:Ljava/lang/String;

    return-object v0
.end method

.method public getStatusTS()J
    .locals 2

    .prologue
    .line 303
    iget-wide v0, p0, Lcom/belkin/wemo/cache/devicelist/DeviceListManager$FirmwareUpdateData;->statusTS:J

    return-wide v0
.end method

.method public getUdn()Ljava/lang/String;
    .locals 1

    .prologue
    .line 322
    iget-object v0, p0, Lcom/belkin/wemo/cache/devicelist/DeviceListManager$FirmwareUpdateData;->udn:Ljava/lang/String;

    return-object v0
.end method

.method public setFwStatus(Ljava/lang/String;)V
    .locals 0
    .param p1, "fwStatus"    # Ljava/lang/String;

    .prologue
    .line 315
    if-nez p1, :cond_0

    .line 316
    const-string p1, ""

    .line 318
    :cond_0
    iput-object p1, p0, Lcom/belkin/wemo/cache/devicelist/DeviceListManager$FirmwareUpdateData;->fwStatus:Ljava/lang/String;

    .line 319
    return-void
.end method

.method public setOldFwVersion(Ljava/lang/String;)V
    .locals 0
    .param p1, "oldFwVersion"    # Ljava/lang/String;

    .prologue
    .line 292
    if-nez p1, :cond_0

    .line 293
    const-string p1, ""

    .line 295
    :cond_0
    iput-object p1, p0, Lcom/belkin/wemo/cache/devicelist/DeviceListManager$FirmwareUpdateData;->oldFwVersion:Ljava/lang/String;

    .line 296
    return-void
.end method

.method public setStatusTS(J)V
    .locals 1
    .param p1, "statusTS"    # J

    .prologue
    .line 307
    iput-wide p1, p0, Lcom/belkin/wemo/cache/devicelist/DeviceListManager$FirmwareUpdateData;->statusTS:J

    .line 308
    return-void
.end method

.method public setUdn(Ljava/lang/String;)V
    .locals 0
    .param p1, "udn"    # Ljava/lang/String;

    .prologue
    .line 326
    if-nez p1, :cond_0

    .line 327
    const-string p1, ""

    .line 329
    :cond_0
    iput-object p1, p0, Lcom/belkin/wemo/cache/devicelist/DeviceListManager$FirmwareUpdateData;->udn:Ljava/lang/String;

    .line 330
    return-void
.end method
