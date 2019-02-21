.class public Lcom/belkin/beans/FirmwareVersionResponseBean;
.super Ljava/lang/Object;
.source "FirmwareVersionResponseBean.java"


# instance fields
.field private firmwareVersion:Ljava/lang/String;

.field private skuNumber:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public getFirmwareVersion()Ljava/lang/String;
    .locals 1

    .prologue
    .line 14
    iget-object v0, p0, Lcom/belkin/beans/FirmwareVersionResponseBean;->firmwareVersion:Ljava/lang/String;

    return-object v0
.end method

.method public getSkuNumber()Ljava/lang/String;
    .locals 1

    .prologue
    .line 6
    iget-object v0, p0, Lcom/belkin/beans/FirmwareVersionResponseBean;->skuNumber:Ljava/lang/String;

    return-object v0
.end method

.method public setFirmwareVersion(Ljava/lang/String;)V
    .locals 0
    .param p1, "firmwareVersion"    # Ljava/lang/String;

    .prologue
    .line 18
    iput-object p1, p0, Lcom/belkin/beans/FirmwareVersionResponseBean;->firmwareVersion:Ljava/lang/String;

    .line 19
    return-void
.end method

.method public setSkuNumber(Ljava/lang/String;)V
    .locals 0
    .param p1, "skuNumber"    # Ljava/lang/String;

    .prologue
    .line 10
    iput-object p1, p0, Lcom/belkin/beans/FirmwareVersionResponseBean;->skuNumber:Ljava/lang/String;

    .line 11
    return-void
.end method
