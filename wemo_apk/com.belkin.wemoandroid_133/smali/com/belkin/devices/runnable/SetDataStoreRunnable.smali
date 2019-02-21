.class public Lcom/belkin/devices/runnable/SetDataStoreRunnable;
.super Lcom/belkin/wemo/runnable/WeMoRunnable;
.source "SetDataStoreRunnable.java"


# static fields
.field private static final TAG:Ljava/lang/String; = "SetDataStoreRunnable"


# instance fields
.field private mBridgeUDN:Ljava/lang/String;

.field private mCallback:Lcom/belkin/devices/callback/SetDataStoreOnLinkCallBack;

.field private mContext:Landroid/content/Context;

.field private mEmergencyContacts:Ljava/lang/String;

.field private mUpNpDeviceList:Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;


# direct methods
.method public constructor <init>(Ljava/lang/String;Lcom/belkin/devices/callback/SetDataStoreOnLinkCallBack;Landroid/content/Context;Ljava/lang/String;)V
    .locals 1
    .param p1, "bridgeUDN"    # Ljava/lang/String;
    .param p2, "callback"    # Lcom/belkin/devices/callback/SetDataStoreOnLinkCallBack;
    .param p3, "context"    # Landroid/content/Context;
    .param p4, "emergencyContacts"    # Ljava/lang/String;

    .prologue
    const/4 v0, 0x0

    .line 23
    invoke-direct {p0}, Lcom/belkin/wemo/runnable/WeMoRunnable;-><init>()V

    .line 16
    iput-object v0, p0, Lcom/belkin/devices/runnable/SetDataStoreRunnable;->mUpNpDeviceList:Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;

    .line 17
    iput-object v0, p0, Lcom/belkin/devices/runnable/SetDataStoreRunnable;->mCallback:Lcom/belkin/devices/callback/SetDataStoreOnLinkCallBack;

    .line 18
    iput-object v0, p0, Lcom/belkin/devices/runnable/SetDataStoreRunnable;->mEmergencyContacts:Ljava/lang/String;

    .line 19
    const-string v0, ""

    iput-object v0, p0, Lcom/belkin/devices/runnable/SetDataStoreRunnable;->mBridgeUDN:Ljava/lang/String;

    .line 24
    iput-object p2, p0, Lcom/belkin/devices/runnable/SetDataStoreRunnable;->mCallback:Lcom/belkin/devices/callback/SetDataStoreOnLinkCallBack;

    .line 25
    invoke-static {}, Lcom/belkin/wemo/cache/utils/NetworkMode;->isLocal()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 26
    new-instance v0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;

    invoke-direct {v0, p3}, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/belkin/devices/runnable/SetDataStoreRunnable;->mUpNpDeviceList:Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;

    .line 27
    :cond_0
    iput-object p4, p0, Lcom/belkin/devices/runnable/SetDataStoreRunnable;->mEmergencyContacts:Ljava/lang/String;

    .line 28
    iput-object p1, p0, Lcom/belkin/devices/runnable/SetDataStoreRunnable;->mBridgeUDN:Ljava/lang/String;

    .line 29
    iput-object p3, p0, Lcom/belkin/devices/runnable/SetDataStoreRunnable;->mContext:Landroid/content/Context;

    .line 30
    return-void
.end method


# virtual methods
.method public run()V
    .locals 4

    .prologue
    .line 34
    invoke-static {}, Lcom/belkin/wemo/cache/utils/NetworkMode;->isLocal()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 35
    iget-object v0, p0, Lcom/belkin/devices/runnable/SetDataStoreRunnable;->mUpNpDeviceList:Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;

    iget-object v1, p0, Lcom/belkin/devices/runnable/SetDataStoreRunnable;->mEmergencyContacts:Ljava/lang/String;

    iget-object v2, p0, Lcom/belkin/devices/runnable/SetDataStoreRunnable;->mCallback:Lcom/belkin/devices/callback/SetDataStoreOnLinkCallBack;

    invoke-virtual {v0, v1, v2}, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->setEmergencyContacts(Ljava/lang/String;Lcom/belkin/devices/callback/SetDataStoreOnLinkCallBack;)V

    .line 50
    :goto_0
    return-void

    .line 39
    :cond_0
    iget-object v0, p0, Lcom/belkin/devices/runnable/SetDataStoreRunnable;->mBridgeUDN:Ljava/lang/String;

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_2

    .line 40
    iget-object v0, p0, Lcom/belkin/devices/runnable/SetDataStoreRunnable;->mContext:Landroid/content/Context;

    if-eqz v0, :cond_1

    .line 41
    iget-object v0, p0, Lcom/belkin/devices/runnable/SetDataStoreRunnable;->mContext:Landroid/content/Context;

    invoke-static {v0}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->getInstance(Landroid/content/Context;)Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    move-result-object v0

    iget-object v1, p0, Lcom/belkin/devices/runnable/SetDataStoreRunnable;->mCallback:Lcom/belkin/devices/callback/SetDataStoreOnLinkCallBack;

    iget-object v2, p0, Lcom/belkin/devices/runnable/SetDataStoreRunnable;->mBridgeUDN:Ljava/lang/String;

    iget-object v3, p0, Lcom/belkin/devices/runnable/SetDataStoreRunnable;->mEmergencyContacts:Ljava/lang/String;

    invoke-virtual {v0, v1, v2, v3}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->setDataStoreOnCloud(Lcom/belkin/wemo/callback/SetAndGetActionCallBack;Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    .line 43
    :cond_1
    iget-object v0, p0, Lcom/belkin/devices/runnable/SetDataStoreRunnable;->mCallback:Lcom/belkin/devices/callback/SetDataStoreOnLinkCallBack;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/belkin/devices/callback/SetDataStoreOnLinkCallBack;->onSuccess(Ljava/lang/String;)V

    goto :goto_0

    .line 46
    :cond_2
    const-string v0, "SetDataStoreRunnable"

    const-string v1, "Bridge Udn is empty or null"

    invoke-static {v0, v1}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 47
    iget-object v0, p0, Lcom/belkin/devices/runnable/SetDataStoreRunnable;->mCallback:Lcom/belkin/devices/callback/SetDataStoreOnLinkCallBack;

    invoke-virtual {v0}, Lcom/belkin/devices/callback/SetDataStoreOnLinkCallBack;->onError()V

    goto :goto_0
.end method
