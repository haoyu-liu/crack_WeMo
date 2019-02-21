.class public Lcom/belkin/wemo/upnp/response/SetBulbTypeResponse;
.super Lcom/belkin/wemo/upnp/response/RMBaseUpnpResponse;
.source "SetBulbTypeResponse.java"


# instance fields
.field private maxLevel:Ljava/lang/String;

.field private minLevel:Ljava/lang/String;

.field private turnOnLevel:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 5
    invoke-direct {p0}, Lcom/belkin/wemo/upnp/response/RMBaseUpnpResponse;-><init>()V

    return-void
.end method


# virtual methods
.method public getMaxLevel()Ljava/lang/String;
    .locals 1

    .prologue
    .line 21
    iget-object v0, p0, Lcom/belkin/wemo/upnp/response/SetBulbTypeResponse;->maxLevel:Ljava/lang/String;

    if-nez v0, :cond_0

    .line 22
    const-string v0, ""

    iput-object v0, p0, Lcom/belkin/wemo/upnp/response/SetBulbTypeResponse;->maxLevel:Ljava/lang/String;

    .line 24
    :cond_0
    iget-object v0, p0, Lcom/belkin/wemo/upnp/response/SetBulbTypeResponse;->maxLevel:Ljava/lang/String;

    return-object v0
.end method

.method public getMinLevel()Ljava/lang/String;
    .locals 1

    .prologue
    .line 12
    iget-object v0, p0, Lcom/belkin/wemo/upnp/response/SetBulbTypeResponse;->minLevel:Ljava/lang/String;

    if-nez v0, :cond_0

    .line 13
    const-string v0, ""

    iput-object v0, p0, Lcom/belkin/wemo/upnp/response/SetBulbTypeResponse;->minLevel:Ljava/lang/String;

    .line 15
    :cond_0
    iget-object v0, p0, Lcom/belkin/wemo/upnp/response/SetBulbTypeResponse;->minLevel:Ljava/lang/String;

    return-object v0
.end method

.method public getTurnOnLevel()Ljava/lang/String;
    .locals 1

    .prologue
    .line 30
    iget-object v0, p0, Lcom/belkin/wemo/upnp/response/SetBulbTypeResponse;->turnOnLevel:Ljava/lang/String;

    if-nez v0, :cond_0

    .line 31
    const-string v0, ""

    iput-object v0, p0, Lcom/belkin/wemo/upnp/response/SetBulbTypeResponse;->turnOnLevel:Ljava/lang/String;

    .line 33
    :cond_0
    iget-object v0, p0, Lcom/belkin/wemo/upnp/response/SetBulbTypeResponse;->turnOnLevel:Ljava/lang/String;

    return-object v0
.end method

.method public setMaxLevel(Ljava/lang/String;)V
    .locals 0
    .param p1, "maxLevel"    # Ljava/lang/String;

    .prologue
    .line 27
    iput-object p1, p0, Lcom/belkin/wemo/upnp/response/SetBulbTypeResponse;->maxLevel:Ljava/lang/String;

    .line 28
    return-void
.end method

.method public setMinLevel(Ljava/lang/String;)V
    .locals 0
    .param p1, "minLevel"    # Ljava/lang/String;

    .prologue
    .line 18
    iput-object p1, p0, Lcom/belkin/wemo/upnp/response/SetBulbTypeResponse;->minLevel:Ljava/lang/String;

    .line 19
    return-void
.end method

.method public setTurnOnLevel(Ljava/lang/String;)V
    .locals 0
    .param p1, "turnOnLevel"    # Ljava/lang/String;

    .prologue
    .line 36
    iput-object p1, p0, Lcom/belkin/wemo/upnp/response/SetBulbTypeResponse;->turnOnLevel:Ljava/lang/String;

    .line 37
    return-void
.end method
