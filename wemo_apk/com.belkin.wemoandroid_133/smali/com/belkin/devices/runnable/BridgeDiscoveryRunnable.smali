.class public Lcom/belkin/devices/runnable/BridgeDiscoveryRunnable;
.super Lcom/belkin/wemo/runnable/WeMoRunnable;
.source "BridgeDiscoveryRunnable.java"


# instance fields
.field private mCallbackContext:Lorg/apache/cordova/CallbackContext;

.field private mContext:Landroid/content/Context;

.field private mDeviceListController:Lcom/belkin/controller/DeviceListController;


# direct methods
.method public constructor <init>(Landroid/content/Context;Lorg/apache/cordova/CallbackContext;)V
    .locals 1
    .param p1, "mContext"    # Landroid/content/Context;
    .param p2, "callbackContext"    # Lorg/apache/cordova/CallbackContext;

    .prologue
    .line 22
    invoke-direct {p0}, Lcom/belkin/wemo/runnable/WeMoRunnable;-><init>()V

    .line 23
    iput-object p1, p0, Lcom/belkin/devices/runnable/BridgeDiscoveryRunnable;->mContext:Landroid/content/Context;

    .line 24
    iput-object p2, p0, Lcom/belkin/devices/runnable/BridgeDiscoveryRunnable;->mCallbackContext:Lorg/apache/cordova/CallbackContext;

    .line 25
    invoke-static {p1}, Lcom/belkin/controller/DeviceListController;->getInstance(Landroid/content/Context;)Lcom/belkin/controller/DeviceListController;

    move-result-object v0

    iput-object v0, p0, Lcom/belkin/devices/runnable/BridgeDiscoveryRunnable;->mDeviceListController:Lcom/belkin/controller/DeviceListController;

    .line 26
    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    .prologue
    .line 30
    invoke-static {}, Lcom/belkin/wemo/cache/utils/NetworkMode;->isLocal()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 31
    iget-object v0, p0, Lcom/belkin/devices/runnable/BridgeDiscoveryRunnable;->mDeviceListController:Lcom/belkin/controller/DeviceListController;

    iget-object v1, p0, Lcom/belkin/devices/runnable/BridgeDiscoveryRunnable;->mContext:Landroid/content/Context;

    iget-object v2, p0, Lcom/belkin/devices/runnable/BridgeDiscoveryRunnable;->mCallbackContext:Lorg/apache/cordova/CallbackContext;

    invoke-virtual {v0, v1, v2}, Lcom/belkin/controller/DeviceListController;->checkBhonjourInNetwork(Landroid/content/Context;Lorg/apache/cordova/CallbackContext;)V

    .line 36
    :goto_0
    return-void

    .line 33
    :cond_0
    const-string v0, "BridgeRemoveDeviceRunnable"

    const-string v1, "No Bridge Discovery in Remote Mode"

    invoke-static {v0, v1}, Lcom/belkin/utils/LogUtils;->debugLog(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0
.end method
