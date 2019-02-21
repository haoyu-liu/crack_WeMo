.class public Lcom/belkin/devices/runnable/SetDeviceNameOnLinkRunnable;
.super Lcom/belkin/wemo/runnable/WeMoRunnable;
.source "SetDeviceNameOnLinkRunnable.java"


# static fields
.field private static final TAG:Ljava/lang/String; = "SetDeviceNameOnLinkRunnable"


# instance fields
.field private mCallback:Lcom/belkin/devices/callback/SetDeviceNameOnLinkCallBack;

.field private mUpNpDeviceList:Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;

.field private subDeviceInfo:Lorg/json/JSONArray;


# direct methods
.method public constructor <init>(Lorg/json/JSONArray;Lcom/belkin/devices/callback/SetDeviceNameOnLinkCallBack;Landroid/content/Context;)V
    .locals 1
    .param p1, "deviceInfo"    # Lorg/json/JSONArray;
    .param p2, "callback"    # Lcom/belkin/devices/callback/SetDeviceNameOnLinkCallBack;
    .param p3, "context"    # Landroid/content/Context;

    .prologue
    const/4 v0, 0x0

    .line 22
    invoke-direct {p0}, Lcom/belkin/wemo/runnable/WeMoRunnable;-><init>()V

    .line 17
    iput-object v0, p0, Lcom/belkin/devices/runnable/SetDeviceNameOnLinkRunnable;->mUpNpDeviceList:Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;

    .line 18
    iput-object v0, p0, Lcom/belkin/devices/runnable/SetDeviceNameOnLinkRunnable;->mCallback:Lcom/belkin/devices/callback/SetDeviceNameOnLinkCallBack;

    .line 19
    iput-object v0, p0, Lcom/belkin/devices/runnable/SetDeviceNameOnLinkRunnable;->subDeviceInfo:Lorg/json/JSONArray;

    .line 23
    iput-object p2, p0, Lcom/belkin/devices/runnable/SetDeviceNameOnLinkRunnable;->mCallback:Lcom/belkin/devices/callback/SetDeviceNameOnLinkCallBack;

    .line 24
    iput-object p1, p0, Lcom/belkin/devices/runnable/SetDeviceNameOnLinkRunnable;->subDeviceInfo:Lorg/json/JSONArray;

    .line 25
    new-instance v0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;

    invoke-direct {v0, p3}, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/belkin/devices/runnable/SetDeviceNameOnLinkRunnable;->mUpNpDeviceList:Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;

    .line 26
    return-void
.end method


# virtual methods
.method public run()V
    .locals 4

    .prologue
    .line 30
    invoke-static {}, Lcom/belkin/wemo/cache/utils/NetworkMode;->isLocal()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 32
    :try_start_0
    iget-object v1, p0, Lcom/belkin/devices/runnable/SetDeviceNameOnLinkRunnable;->mUpNpDeviceList:Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;

    iget-object v2, p0, Lcom/belkin/devices/runnable/SetDeviceNameOnLinkRunnable;->subDeviceInfo:Lorg/json/JSONArray;

    iget-object v3, p0, Lcom/belkin/devices/runnable/SetDeviceNameOnLinkRunnable;->mCallback:Lcom/belkin/devices/callback/SetDeviceNameOnLinkCallBack;

    invoke-virtual {v1, v2, v3}, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->setMultipleDeviceName(Lorg/json/JSONArray;Lcom/belkin/devices/callback/SetDeviceNameOnLinkCallBack;)V
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 37
    :cond_0
    :goto_0
    return-void

    .line 33
    :catch_0
    move-exception v0

    .line 34
    .local v0, "e":Lorg/json/JSONException;
    const-string v1, "SetDeviceNameOnLinkRunnable"

    const-string v2, "JSONException in setting mutipleDeviceName: "

    invoke-static {v1, v2, v0}, Lcom/belkin/utils/LogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_0
.end method
