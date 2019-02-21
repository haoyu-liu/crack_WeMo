.class public Lcom/belkin/beans/MetaDataResponseBean;
.super Ljava/lang/Object;
.source "MetaDataResponseBean.java"


# instance fields
.field arrstrMetaData:[Ljava/lang/String;

.field public strAPSSID:Ljava/lang/String;

.field public strDeviceType:Ljava/lang/String;

.field public strFirmwareVersion:Ljava/lang/String;

.field public strMacAddress:Ljava/lang/String;

.field strMetaData:Ljava/lang/String;

.field public strSerialNumber:Ljava/lang/String;

.field public strSkuNo:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    const/4 v0, 0x0

    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 6
    iput-object v0, p0, Lcom/belkin/beans/MetaDataResponseBean;->strMetaData:Ljava/lang/String;

    .line 7
    iput-object v0, p0, Lcom/belkin/beans/MetaDataResponseBean;->arrstrMetaData:[Ljava/lang/String;

    .line 9
    iput-object v0, p0, Lcom/belkin/beans/MetaDataResponseBean;->strMacAddress:Ljava/lang/String;

    .line 10
    iput-object v0, p0, Lcom/belkin/beans/MetaDataResponseBean;->strSerialNumber:Ljava/lang/String;

    .line 11
    iput-object v0, p0, Lcom/belkin/beans/MetaDataResponseBean;->strSkuNo:Ljava/lang/String;

    .line 12
    iput-object v0, p0, Lcom/belkin/beans/MetaDataResponseBean;->strFirmwareVersion:Ljava/lang/String;

    .line 13
    iput-object v0, p0, Lcom/belkin/beans/MetaDataResponseBean;->strAPSSID:Ljava/lang/String;

    .line 14
    iput-object v0, p0, Lcom/belkin/beans/MetaDataResponseBean;->strDeviceType:Ljava/lang/String;

    return-void
.end method

.method private init()V
    .locals 3

    .prologue
    .line 32
    iget-object v0, p0, Lcom/belkin/beans/MetaDataResponseBean;->strMetaData:Ljava/lang/String;

    const-string v1, "\\|"

    invoke-virtual {v0, v1}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/belkin/beans/MetaDataResponseBean;->arrstrMetaData:[Ljava/lang/String;

    .line 33
    iget-object v0, p0, Lcom/belkin/beans/MetaDataResponseBean;->arrstrMetaData:[Ljava/lang/String;

    array-length v0, v0

    const/4 v1, 0x6

    if-ne v0, v1, :cond_0

    .line 35
    iget-object v0, p0, Lcom/belkin/beans/MetaDataResponseBean;->arrstrMetaData:[Ljava/lang/String;

    const/4 v1, 0x0

    aget-object v0, v0, v1

    const-string v1, "MAC:"

    const-string v2, ""

    invoke-virtual {v0, v1, v2}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/belkin/beans/MetaDataResponseBean;->strMacAddress:Ljava/lang/String;

    .line 36
    iget-object v0, p0, Lcom/belkin/beans/MetaDataResponseBean;->arrstrMetaData:[Ljava/lang/String;

    const/4 v1, 0x1

    aget-object v0, v0, v1

    const-string v1, "SerialNo:"

    const-string v2, ""

    invoke-virtual {v0, v1, v2}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/belkin/beans/MetaDataResponseBean;->strSerialNumber:Ljava/lang/String;

    .line 37
    iget-object v0, p0, Lcom/belkin/beans/MetaDataResponseBean;->arrstrMetaData:[Ljava/lang/String;

    const/4 v1, 0x2

    aget-object v0, v0, v1

    const-string v1, "SkuNo:"

    const-string v2, ""

    invoke-virtual {v0, v1, v2}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/belkin/beans/MetaDataResponseBean;->strSkuNo:Ljava/lang/String;

    .line 38
    iget-object v0, p0, Lcom/belkin/beans/MetaDataResponseBean;->arrstrMetaData:[Ljava/lang/String;

    const/4 v1, 0x3

    aget-object v0, v0, v1

    const-string v1, "FirmwareVersion:"

    const-string v2, ""

    invoke-virtual {v0, v1, v2}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/belkin/beans/MetaDataResponseBean;->strFirmwareVersion:Ljava/lang/String;

    .line 39
    iget-object v0, p0, Lcom/belkin/beans/MetaDataResponseBean;->arrstrMetaData:[Ljava/lang/String;

    const/4 v1, 0x4

    aget-object v0, v0, v1

    const-string v1, "APSSID:"

    const-string v2, ""

    invoke-virtual {v0, v1, v2}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/belkin/beans/MetaDataResponseBean;->strAPSSID:Ljava/lang/String;

    .line 40
    iget-object v0, p0, Lcom/belkin/beans/MetaDataResponseBean;->arrstrMetaData:[Ljava/lang/String;

    const/4 v1, 0x5

    aget-object v0, v0, v1

    const-string v1, "DeviceType:"

    const-string v2, ""

    invoke-virtual {v0, v1, v2}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/belkin/beans/MetaDataResponseBean;->strDeviceType:Ljava/lang/String;

    .line 42
    :cond_0
    return-void
.end method


# virtual methods
.method public getMetadata()Ljava/lang/String;
    .locals 1

    .prologue
    .line 18
    iget-object v0, p0, Lcom/belkin/beans/MetaDataResponseBean;->strMetaData:Ljava/lang/String;

    return-object v0
.end method

.method public setMetadata(Ljava/lang/String;)V
    .locals 1
    .param p1, "metaData"    # Ljava/lang/String;

    .prologue
    .line 23
    iput-object p1, p0, Lcom/belkin/beans/MetaDataResponseBean;->strMetaData:Ljava/lang/String;

    .line 24
    iget-object v0, p0, Lcom/belkin/beans/MetaDataResponseBean;->strMetaData:Ljava/lang/String;

    if-eqz v0, :cond_0

    .line 26
    invoke-direct {p0}, Lcom/belkin/beans/MetaDataResponseBean;->init()V

    .line 28
    :cond_0
    return-void
.end method
