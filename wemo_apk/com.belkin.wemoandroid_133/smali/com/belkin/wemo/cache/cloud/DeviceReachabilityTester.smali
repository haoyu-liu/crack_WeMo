.class public Lcom/belkin/wemo/cache/cloud/DeviceReachabilityTester;
.super Ljava/lang/Object;
.source "DeviceReachabilityTester.java"

# interfaces
.implements Lcom/belkin/wemo/controlaction/callback/ControlActionErrorCallback;
.implements Lcom/belkin/wemo/controlaction/callback/ControlActionSuccessCallback;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/belkin/wemo/cache/cloud/DeviceReachabilityTester$IDeviceReachabilityListener;
    }
.end annotation


# instance fields
.field private final TAG:Ljava/lang/String;

.field private device:Lorg/cybergarage/upnp/Device;

.field private listener:Lcom/belkin/wemo/cache/cloud/DeviceReachabilityTester$IDeviceReachabilityListener;


# direct methods
.method public constructor <init>(Lorg/cybergarage/upnp/Device;Lcom/belkin/wemo/cache/cloud/DeviceReachabilityTester$IDeviceReachabilityListener;)V
    .locals 1
    .param p1, "device"    # Lorg/cybergarage/upnp/Device;
    .param p2, "listener"    # Lcom/belkin/wemo/cache/cloud/DeviceReachabilityTester$IDeviceReachabilityListener;

    .prologue
    .line 26
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 27
    iput-object p2, p0, Lcom/belkin/wemo/cache/cloud/DeviceReachabilityTester;->listener:Lcom/belkin/wemo/cache/cloud/DeviceReachabilityTester$IDeviceReachabilityListener;

    .line 28
    iput-object p1, p0, Lcom/belkin/wemo/cache/cloud/DeviceReachabilityTester;->device:Lorg/cybergarage/upnp/Device;

    .line 29
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/belkin/wemo/cache/cloud/DeviceReachabilityTester;->TAG:Ljava/lang/String;

    .line 30
    return-void
.end method


# virtual methods
.method public onActionError(Ljava/lang/Exception;)V
    .locals 3
    .param p1, "e"    # Ljava/lang/Exception;

    .prologue
    .line 54
    iget-object v0, p0, Lcom/belkin/wemo/cache/cloud/DeviceReachabilityTester;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Device is NOT reachable. UDN: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/belkin/wemo/cache/cloud/DeviceReachabilityTester;->device:Lorg/cybergarage/upnp/Device;

    invoke-virtual {v2}, Lorg/cybergarage/upnp/Device;->getUDN()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "; Response: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p1}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 55
    iget-object v0, p0, Lcom/belkin/wemo/cache/cloud/DeviceReachabilityTester;->listener:Lcom/belkin/wemo/cache/cloud/DeviceReachabilityTester$IDeviceReachabilityListener;

    if-eqz v0, :cond_0

    .line 56
    iget-object v0, p0, Lcom/belkin/wemo/cache/cloud/DeviceReachabilityTester;->listener:Lcom/belkin/wemo/cache/cloud/DeviceReachabilityTester$IDeviceReachabilityListener;

    invoke-interface {v0}, Lcom/belkin/wemo/cache/cloud/DeviceReachabilityTester$IDeviceReachabilityListener;->onDeviceNotReachable()V

    .line 58
    :cond_0
    return-void
.end method

.method public onActionSuccess(Ljava/lang/String;)V
    .locals 3
    .param p1, "responseXMLStr"    # Ljava/lang/String;

    .prologue
    .line 45
    iget-object v0, p0, Lcom/belkin/wemo/cache/cloud/DeviceReachabilityTester;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Device is reachable. UDN: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/belkin/wemo/cache/cloud/DeviceReachabilityTester;->device:Lorg/cybergarage/upnp/Device;

    invoke-virtual {v2}, Lorg/cybergarage/upnp/Device;->getUDN()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "; Action response: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->debugLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 46
    iget-object v0, p0, Lcom/belkin/wemo/cache/cloud/DeviceReachabilityTester;->listener:Lcom/belkin/wemo/cache/cloud/DeviceReachabilityTester$IDeviceReachabilityListener;

    if-eqz v0, :cond_0

    .line 47
    iget-object v0, p0, Lcom/belkin/wemo/cache/cloud/DeviceReachabilityTester;->listener:Lcom/belkin/wemo/cache/cloud/DeviceReachabilityTester$IDeviceReachabilityListener;

    invoke-interface {v0}, Lcom/belkin/wemo/cache/cloud/DeviceReachabilityTester$IDeviceReachabilityListener;->onDeviceReachable()V

    .line 49
    :cond_0
    return-void
.end method

.method public start()V
    .locals 3

    .prologue
    .line 33
    iget-object v1, p0, Lcom/belkin/wemo/cache/cloud/DeviceReachabilityTester;->device:Lorg/cybergarage/upnp/Device;

    if-eqz v1, :cond_1

    .line 34
    iget-object v1, p0, Lcom/belkin/wemo/cache/cloud/DeviceReachabilityTester;->device:Lorg/cybergarage/upnp/Device;

    const-string v2, "GetFriendlyName"

    invoke-virtual {v1, v2}, Lorg/cybergarage/upnp/Device;->getAction(Ljava/lang/String;)Lorg/cybergarage/upnp/Action;

    move-result-object v0

    .line 35
    .local v0, "action":Lorg/cybergarage/upnp/Action;
    invoke-static {}, Lcom/belkin/wemo/controlaction/ControlActionHandler;->newInstance()Lcom/belkin/wemo/controlaction/ControlActionHandler;

    move-result-object v1

    invoke-virtual {v1, v0, p0, p0}, Lcom/belkin/wemo/controlaction/ControlActionHandler;->postControlAction(Lorg/cybergarage/upnp/Action;Lcom/belkin/wemo/controlaction/callback/ControlActionErrorCallback;Lcom/belkin/wemo/controlaction/callback/ControlActionSuccessCallback;)V

    .line 41
    .end local v0    # "action":Lorg/cybergarage/upnp/Action;
    :cond_0
    :goto_0
    return-void

    .line 37
    :cond_1
    iget-object v1, p0, Lcom/belkin/wemo/cache/cloud/DeviceReachabilityTester;->listener:Lcom/belkin/wemo/cache/cloud/DeviceReachabilityTester$IDeviceReachabilityListener;

    if-eqz v1, :cond_0

    .line 38
    iget-object v1, p0, Lcom/belkin/wemo/cache/cloud/DeviceReachabilityTester;->listener:Lcom/belkin/wemo/cache/cloud/DeviceReachabilityTester$IDeviceReachabilityListener;

    invoke-interface {v1}, Lcom/belkin/wemo/cache/cloud/DeviceReachabilityTester$IDeviceReachabilityListener;->onDeviceNotReachable()V

    goto :goto_0
.end method
