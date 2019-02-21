.class public Lorg/cybergarage/upnp/device/ST;
.super Ljava/lang/Object;
.source "ST.java"


# static fields
.field public static final ALL_DEVICE:Ljava/lang/String; = "ssdp:all"

.field public static final ROOT_DEVICE:Ljava/lang/String; = "urn:Belkin:service:basicevent:1"

.field public static final URN_DEVICE:Ljava/lang/String; = "urn:schemas-upnp-org:device:"

.field public static final URN_SERVICE:Ljava/lang/String; = "urn:schemas-upnp-org:service:"

.field public static final UUID_DEVICE:Ljava/lang/String; = "uuid"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 18
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static final isAllDevice(Ljava/lang/String;)Z
    .locals 2
    .param p0, "value"    # Ljava/lang/String;

    .prologue
    const/4 v0, 0x1

    .line 32
    if-nez p0, :cond_1

    .line 33
    const/4 v0, 0x0

    .line 36
    :cond_0
    :goto_0
    return v0

    .line 34
    :cond_1
    const-string v1, "ssdp:all"

    invoke-virtual {p0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eq v1, v0, :cond_0

    .line 36
    const-string v0, "\"ssdp:all\""

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    goto :goto_0
.end method

.method public static final isRootDevice(Ljava/lang/String;)Z
    .locals 2
    .param p0, "value"    # Ljava/lang/String;

    .prologue
    const/4 v0, 0x1

    .line 41
    if-nez p0, :cond_1

    .line 42
    const/4 v0, 0x0

    .line 45
    :cond_0
    :goto_0
    return v0

    .line 43
    :cond_1
    const-string v1, "urn:Belkin:service:basicevent:1"

    invoke-virtual {p0, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eq v1, v0, :cond_0

    .line 45
    const-string v0, "\"urn:Belkin:service:basicevent:1\""

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    goto :goto_0
.end method

.method public static final isURNDevice(Ljava/lang/String;)Z
    .locals 2
    .param p0, "value"    # Ljava/lang/String;

    .prologue
    const/4 v0, 0x1

    .line 59
    if-nez p0, :cond_1

    .line 60
    const/4 v0, 0x0

    .line 63
    :cond_0
    :goto_0
    return v0

    .line 61
    :cond_1
    const-string v1, "urn:schemas-upnp-org:device:"

    invoke-virtual {p0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    if-eq v1, v0, :cond_0

    .line 63
    const-string v0, "\"urn:schemas-upnp-org:device:"

    invoke-virtual {p0, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    goto :goto_0
.end method

.method public static final isURNService(Ljava/lang/String;)Z
    .locals 2
    .param p0, "value"    # Ljava/lang/String;

    .prologue
    const/4 v0, 0x1

    .line 68
    if-nez p0, :cond_1

    .line 69
    const/4 v0, 0x0

    .line 72
    :cond_0
    :goto_0
    return v0

    .line 70
    :cond_1
    const-string v1, "urn:schemas-upnp-org:service:"

    invoke-virtual {p0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    if-eq v1, v0, :cond_0

    .line 72
    const-string v0, "\"urn:schemas-upnp-org:service:"

    invoke-virtual {p0, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    goto :goto_0
.end method

.method public static final isUUIDDevice(Ljava/lang/String;)Z
    .locals 2
    .param p0, "value"    # Ljava/lang/String;

    .prologue
    const/4 v0, 0x1

    .line 50
    if-nez p0, :cond_1

    .line 51
    const/4 v0, 0x0

    .line 54
    :cond_0
    :goto_0
    return v0

    .line 52
    :cond_1
    const-string v1, "uuid"

    invoke-virtual {p0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    if-eq v1, v0, :cond_0

    .line 54
    const-string v0, "\"uuid"

    invoke-virtual {p0, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    goto :goto_0
.end method
