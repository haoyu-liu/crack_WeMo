.class public Lcom/belkin/cordova/plugin/timertask/OpenNetworkTimerTask;
.super Ljava/util/TimerTask;
.source "OpenNetworkTimerTask.java"


# instance fields
.field private final TAG:Ljava/lang/String;

.field private upnpDeiceList:Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;


# direct methods
.method public constructor <init>(Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;)V
    .locals 1
    .param p1, "upnpDeviceList"    # Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;

    .prologue
    .line 16
    invoke-direct {p0}, Ljava/util/TimerTask;-><init>()V

    .line 17
    iput-object p1, p0, Lcom/belkin/cordova/plugin/timertask/OpenNetworkTimerTask;->upnpDeiceList:Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;

    .line 18
    const-class v0, Lcom/belkin/cordova/plugin/timertask/OpenNetworkTimerTask;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/belkin/cordova/plugin/timertask/OpenNetworkTimerTask;->TAG:Ljava/lang/String;

    .line 19
    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    .prologue
    .line 24
    :try_start_0
    iget-object v1, p0, Lcom/belkin/cordova/plugin/timertask/OpenNetworkTimerTask;->TAG:Ljava/lang/String;

    const-string v2, "OPEN_NETWORK call issued to Bridge."

    invoke-static {v1, v2}, Lcom/belkin/utils/LogUtils;->debugLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 25
    iget-object v1, p0, Lcom/belkin/cordova/plugin/timertask/OpenNetworkTimerTask;->upnpDeiceList:Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;

    invoke-virtual {v1}, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->openBridgeNetwork()Lorg/json/JSONArray;
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 29
    :goto_0
    return-void

    .line 26
    :catch_0
    move-exception v0

    .line 27
    .local v0, "e":Lorg/json/JSONException;
    iget-object v1, p0, Lcom/belkin/cordova/plugin/timertask/OpenNetworkTimerTask;->TAG:Ljava/lang/String;

    const-string v2, "JSONException in openBridgeNetwork(): "

    invoke-static {v1, v2, v0}, Lcom/belkin/utils/LogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_0
.end method
