.class public Lcom/belkin/wemo/upnp/response/NightModeConfiguration;
.super Ljava/lang/Object;
.source "NightModeConfiguration.java"


# instance fields
.field private endTime:Ljava/lang/String;

.field private nightMode:Ljava/lang/String;

.field private nightModeBrightness:Ljava/lang/String;

.field private startTime:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 14
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 16
    return-void
.end method

.method constructor <init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0
    .param p1, "nightMode"    # Ljava/lang/String;
    .param p2, "nightModeBrightness"    # Ljava/lang/String;
    .param p3, "startTime"    # Ljava/lang/String;
    .param p4, "endTime"    # Ljava/lang/String;

    .prologue
    .line 18
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 19
    invoke-virtual {p0, p1}, Lcom/belkin/wemo/upnp/response/NightModeConfiguration;->setNightMode(Ljava/lang/String;)V

    .line 20
    invoke-virtual {p0, p2}, Lcom/belkin/wemo/upnp/response/NightModeConfiguration;->setNightModeBrightness(Ljava/lang/String;)V

    .line 21
    invoke-virtual {p0, p3}, Lcom/belkin/wemo/upnp/response/NightModeConfiguration;->setStartTime(Ljava/lang/String;)V

    .line 22
    invoke-virtual {p0, p4}, Lcom/belkin/wemo/upnp/response/NightModeConfiguration;->setEndTime(Ljava/lang/String;)V

    .line 23
    return-void
.end method


# virtual methods
.method public getEndTime()Ljava/lang/String;
    .locals 1

    .prologue
    .line 59
    iget-object v0, p0, Lcom/belkin/wemo/upnp/response/NightModeConfiguration;->endTime:Ljava/lang/String;

    return-object v0
.end method

.method public getNightMode()Ljava/lang/String;
    .locals 1

    .prologue
    .line 37
    iget-object v0, p0, Lcom/belkin/wemo/upnp/response/NightModeConfiguration;->nightMode:Ljava/lang/String;

    return-object v0
.end method

.method public getNightModeBrightness()Ljava/lang/String;
    .locals 1

    .prologue
    .line 26
    iget-object v0, p0, Lcom/belkin/wemo/upnp/response/NightModeConfiguration;->nightModeBrightness:Ljava/lang/String;

    return-object v0
.end method

.method public getStartTime()Ljava/lang/String;
    .locals 1

    .prologue
    .line 48
    iget-object v0, p0, Lcom/belkin/wemo/upnp/response/NightModeConfiguration;->startTime:Ljava/lang/String;

    return-object v0
.end method

.method public setEndTime(Ljava/lang/String;)V
    .locals 0
    .param p1, "endTime"    # Ljava/lang/String;

    .prologue
    .line 63
    if-nez p1, :cond_0

    .line 64
    const-string p1, ""

    .line 66
    :cond_0
    iput-object p1, p0, Lcom/belkin/wemo/upnp/response/NightModeConfiguration;->endTime:Ljava/lang/String;

    .line 67
    return-void
.end method

.method public setNightMode(Ljava/lang/String;)V
    .locals 0
    .param p1, "nightMode"    # Ljava/lang/String;

    .prologue
    .line 41
    if-nez p1, :cond_0

    .line 42
    const-string p1, ""

    .line 44
    :cond_0
    iput-object p1, p0, Lcom/belkin/wemo/upnp/response/NightModeConfiguration;->nightMode:Ljava/lang/String;

    .line 45
    return-void
.end method

.method public setNightModeBrightness(Ljava/lang/String;)V
    .locals 0
    .param p1, "nightModeBrightness"    # Ljava/lang/String;

    .prologue
    .line 30
    if-nez p1, :cond_0

    .line 31
    const-string p1, ""

    .line 33
    :cond_0
    iput-object p1, p0, Lcom/belkin/wemo/upnp/response/NightModeConfiguration;->nightModeBrightness:Ljava/lang/String;

    .line 34
    return-void
.end method

.method public setStartTime(Ljava/lang/String;)V
    .locals 0
    .param p1, "startTime"    # Ljava/lang/String;

    .prologue
    .line 52
    if-nez p1, :cond_0

    .line 53
    const-string p1, ""

    .line 55
    :cond_0
    iput-object p1, p0, Lcom/belkin/wemo/upnp/response/NightModeConfiguration;->startTime:Ljava/lang/String;

    .line 56
    return-void
.end method
