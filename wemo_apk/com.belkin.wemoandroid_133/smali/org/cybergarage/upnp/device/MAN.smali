.class public Lorg/cybergarage/upnp/device/MAN;
.super Ljava/lang/Object;
.source "MAN.java"


# static fields
.field public static final DISCOVER:Ljava/lang/String; = "ssdp:discover"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 18
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static final isDiscover(Ljava/lang/String;)Z
    .locals 2
    .param p0, "value"    # Ljava/lang/String;

    .prologue
    const/4 v0, 0x1

    .line 24
    if-nez p0, :cond_1

    .line 25
    const/4 v0, 0x0

    .line 28
    :cond_0
    :goto_0
    return v0

    .line 26
    :cond_1
    const-string v1, "ssdp:discover"

    invoke-virtual {p0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eq v1, v0, :cond_0

    .line 28
    const-string v0, "\"ssdp:discover\""

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    goto :goto_0
.end method
