.class public Lcom/belkin/wemo/upnp/response/MetaInfo;
.super Ljava/lang/Object;
.source "MetaInfo.java"


# instance fields
.field private firmwareVersion:Ljava/lang/String;

.field private ssid:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 4
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public getFirmwareVersion()Ljava/lang/String;
    .locals 1

    .prologue
    .line 10
    iget-object v0, p0, Lcom/belkin/wemo/upnp/response/MetaInfo;->firmwareVersion:Ljava/lang/String;

    return-object v0
.end method

.method public getSSID()Ljava/lang/String;
    .locals 1

    .prologue
    .line 18
    iget-object v0, p0, Lcom/belkin/wemo/upnp/response/MetaInfo;->ssid:Ljava/lang/String;

    return-object v0
.end method

.method public setFirmwareVersion(Ljava/lang/String;)V
    .locals 0
    .param p1, "firmwareVersion"    # Ljava/lang/String;

    .prologue
    .line 14
    iput-object p1, p0, Lcom/belkin/wemo/upnp/response/MetaInfo;->firmwareVersion:Ljava/lang/String;

    .line 15
    return-void
.end method

.method public setSSID(Ljava/lang/String;)V
    .locals 0
    .param p1, "ssid"    # Ljava/lang/String;

    .prologue
    .line 22
    iput-object p1, p0, Lcom/belkin/wemo/upnp/response/MetaInfo;->ssid:Ljava/lang/String;

    .line 23
    return-void
.end method
