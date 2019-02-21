.class public Lcom/belkin/cybergarage/wrapper/UpnpDeviceAction;
.super Lcom/belkin/cybergarage/wrapper/UpnpDeviceBase;
.source "UpnpDeviceAction.java"


# static fields
.field private static final TAG:Ljava/lang/String; = "UpnpDeviceAction"


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 54
    invoke-direct {p0, p1}, Lcom/belkin/cybergarage/wrapper/UpnpDeviceBase;-><init>(Landroid/content/Context;)V

    .line 55
    return-void
.end method


# virtual methods
.method public getDeviceType(Lorg/cybergarage/upnp/Device;)Ljava/lang/String;
    .locals 1
    .param p1, "device"    # Lorg/cybergarage/upnp/Device;

    .prologue
    .line 63
    invoke-virtual {p1}, Lorg/cybergarage/upnp/Device;->getDeviceType()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getFirstDeviceType()Ljava/lang/String;
    .locals 1

    .prologue
    .line 67
    iget-object v0, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceAction;->mDevice:Lorg/cybergarage/upnp/Device;

    invoke-virtual {v0}, Lorg/cybergarage/upnp/Device;->getDeviceType()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
