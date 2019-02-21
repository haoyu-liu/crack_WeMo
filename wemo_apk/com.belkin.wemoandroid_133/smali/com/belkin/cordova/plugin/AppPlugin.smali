.class public Lcom/belkin/cordova/plugin/AppPlugin;
.super Lorg/apache/cordova/CordovaPlugin;
.source "AppPlugin.java"


# static fields
.field public static final ACTION_GET_CONTACT_LIST:Ljava/lang/String; = "getContactList"

.field public static final ACTION_GET_EMERGENCY_CONTACT:Ljava/lang/String; = "getEmergencyContact"

.field public static final ACTION_SET_EMERGENCY_CONTACT:Ljava/lang/String; = "setEmergencyContact"

.field public static final TAG:Ljava/lang/String; = "AppPlugin"


# instance fields
.field private mAppController:Lcom/belkin/controller/AppController;

.field private mContext:Landroid/content/Context;


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    const/4 v0, 0x0

    .line 37
    invoke-direct {p0}, Lorg/apache/cordova/CordovaPlugin;-><init>()V

    .line 34
    iput-object v0, p0, Lcom/belkin/cordova/plugin/AppPlugin;->mContext:Landroid/content/Context;

    .line 35
    iput-object v0, p0, Lcom/belkin/cordova/plugin/AppPlugin;->mAppController:Lcom/belkin/controller/AppController;

    .line 39
    return-void
.end method

.method static synthetic access$000(Lcom/belkin/cordova/plugin/AppPlugin;)Lcom/belkin/controller/AppController;
    .locals 1
    .param p0, "x0"    # Lcom/belkin/cordova/plugin/AppPlugin;

    .prologue
    .line 27
    iget-object v0, p0, Lcom/belkin/cordova/plugin/AppPlugin;->mAppController:Lcom/belkin/controller/AppController;

    return-object v0
.end method


# virtual methods
.method public execute(Ljava/lang/String;Lorg/json/JSONArray;Lorg/apache/cordova/CallbackContext;)Z
    .locals 10
    .param p1, "action"    # Ljava/lang/String;
    .param p2, "inParamArray"    # Lorg/json/JSONArray;
    .param p3, "callbackContext"    # Lorg/apache/cordova/CallbackContext;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .prologue
    const/4 v9, 0x0

    const/4 v8, 0x1

    .line 53
    const-string v5, "AppPlugin"

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "action: "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 55
    const-string v5, "getContactList"

    invoke-virtual {v5, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_1

    .line 57
    new-instance v5, Ljava/lang/Thread;

    new-instance v6, Lcom/belkin/cordova/plugin/AppPlugin$1;

    invoke-direct {v6, p0, p3}, Lcom/belkin/cordova/plugin/AppPlugin$1;-><init>(Lcom/belkin/cordova/plugin/AppPlugin;Lorg/apache/cordova/CallbackContext;)V

    invoke-direct {v5, v6}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    invoke-virtual {v5}, Ljava/lang/Thread;->start()V

    .line 116
    :cond_0
    :goto_0
    return v8

    .line 76
    :cond_1
    const-string v5, "setEmergencyContact"

    invoke-virtual {v5, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_3

    .line 77
    invoke-virtual {p2, v9}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v2

    .line 78
    .local v2, "contactsObject":Lorg/json/JSONObject;
    const-string v0, ""

    .line 79
    .local v0, "bridgeUDN":Ljava/lang/String;
    const-string v5, "AppPlugin"

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "Emergency contact: "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 80
    invoke-virtual {v2}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v4

    .line 81
    .local v4, "emergencyContactsInfo":Ljava/lang/String;
    invoke-virtual {p2}, Lorg/json/JSONArray;->length()I

    move-result v5

    if-le v5, v8, :cond_2

    .line 82
    invoke-virtual {p2, v8}, Lorg/json/JSONArray;->getString(I)Ljava/lang/String;

    move-result-object v0

    .line 84
    :cond_2
    new-instance v1, Lcom/belkin/devices/callback/SetDataStoreOnLinkCallBack;

    invoke-direct {v1, p3}, Lcom/belkin/devices/callback/SetDataStoreOnLinkCallBack;-><init>(Lorg/apache/cordova/CallbackContext;)V

    .line 85
    .local v1, "callback":Lcom/belkin/devices/callback/SetDataStoreOnLinkCallBack;
    new-instance v5, Lcom/belkin/devices/runnable/SetDataStoreRunnable;

    iget-object v6, p0, Lcom/belkin/cordova/plugin/AppPlugin;->mContext:Landroid/content/Context;

    invoke-direct {v5, v0, v1, v6, v4}, Lcom/belkin/devices/runnable/SetDataStoreRunnable;-><init>(Ljava/lang/String;Lcom/belkin/devices/callback/SetDataStoreOnLinkCallBack;Landroid/content/Context;Ljava/lang/String;)V

    invoke-static {v5}, Lcom/belkin/wemo/thread/WeMoThreadPoolHandler;->executeInBackground(Ljava/lang/Runnable;)V

    goto :goto_0

    .line 87
    .end local v0    # "bridgeUDN":Ljava/lang/String;
    .end local v1    # "callback":Lcom/belkin/devices/callback/SetDataStoreOnLinkCallBack;
    .end local v2    # "contactsObject":Lorg/json/JSONObject;
    .end local v4    # "emergencyContactsInfo":Ljava/lang/String;
    :cond_3
    const-string v5, "getEmergencyContact"

    invoke-virtual {v5, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_5

    .line 88
    const-string v0, ""

    .line 89
    .restart local v0    # "bridgeUDN":Ljava/lang/String;
    invoke-virtual {p2}, Lorg/json/JSONArray;->length()I

    move-result v5

    if-lt v5, v8, :cond_4

    .line 90
    invoke-virtual {p2, v9}, Lorg/json/JSONArray;->getString(I)Ljava/lang/String;

    move-result-object v0

    .line 92
    :cond_4
    new-instance v1, Lcom/belkin/devices/callback/GetDataStoreOnLinkCallBack;

    invoke-direct {v1, p3}, Lcom/belkin/devices/callback/GetDataStoreOnLinkCallBack;-><init>(Lorg/apache/cordova/CallbackContext;)V

    .line 93
    .local v1, "callback":Lcom/belkin/devices/callback/GetDataStoreOnLinkCallBack;
    new-instance v5, Lcom/belkin/devices/runnable/GetDataStoreRunnable;

    iget-object v6, p0, Lcom/belkin/cordova/plugin/AppPlugin;->mContext:Landroid/content/Context;

    invoke-direct {v5, v0, v1, v6}, Lcom/belkin/devices/runnable/GetDataStoreRunnable;-><init>(Ljava/lang/String;Lcom/belkin/devices/callback/GetDataStoreOnLinkCallBack;Landroid/content/Context;)V

    invoke-static {v5}, Lcom/belkin/wemo/thread/WeMoThreadPoolHandler;->executeInBackground(Ljava/lang/Runnable;)V

    goto :goto_0

    .line 95
    .end local v0    # "bridgeUDN":Ljava/lang/String;
    .end local v1    # "callback":Lcom/belkin/devices/callback/GetDataStoreOnLinkCallBack;
    :cond_5
    const-string v5, "setMulitpleDeviceName"

    invoke-virtual {v5, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_7

    .line 96
    new-instance v1, Lcom/belkin/devices/callback/SetDeviceNameOnLinkCallBack;

    invoke-direct {v1, p3}, Lcom/belkin/devices/callback/SetDeviceNameOnLinkCallBack;-><init>(Lorg/apache/cordova/CallbackContext;)V

    .line 97
    .local v1, "callback":Lcom/belkin/devices/callback/SetDeviceNameOnLinkCallBack;
    if-eqz p2, :cond_6

    .line 98
    new-instance v5, Lcom/belkin/devices/runnable/SetDeviceNameOnLinkRunnable;

    iget-object v6, p0, Lcom/belkin/cordova/plugin/AppPlugin;->mContext:Landroid/content/Context;

    invoke-direct {v5, p2, v1, v6}, Lcom/belkin/devices/runnable/SetDeviceNameOnLinkRunnable;-><init>(Lorg/json/JSONArray;Lcom/belkin/devices/callback/SetDeviceNameOnLinkCallBack;Landroid/content/Context;)V

    invoke-static {v5}, Lcom/belkin/wemo/thread/WeMoThreadPoolHandler;->executeInBackground(Ljava/lang/Runnable;)V

    goto/16 :goto_0

    .line 100
    :cond_6
    invoke-virtual {v1}, Lcom/belkin/devices/callback/SetDeviceNameOnLinkCallBack;->onError()V

    goto/16 :goto_0

    .line 102
    .end local v1    # "callback":Lcom/belkin/devices/callback/SetDeviceNameOnLinkCallBack;
    :cond_7
    const-string v5, "getMobileNetworkType"

    invoke-virtual {v5, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_8

    .line 103
    const-string v5, "AppPlugin"

    const-string v6, " ACTION_GET_MOBILE_NETWORK_TYPE"

    invoke-static {v5, v6}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 104
    if-eqz p3, :cond_0

    .line 105
    new-instance v5, Lcom/belkin/devices/runnable/GetMobileNetworkRunnable;

    iget-object v6, p0, Lcom/belkin/cordova/plugin/AppPlugin;->mContext:Landroid/content/Context;

    invoke-direct {v5, p3, v6}, Lcom/belkin/devices/runnable/GetMobileNetworkRunnable;-><init>(Lorg/apache/cordova/CallbackContext;Landroid/content/Context;)V

    invoke-static {v5}, Lcom/belkin/wemo/thread/WeMoThreadPoolHandler;->executeInBackground(Ljava/lang/Runnable;)V

    goto/16 :goto_0

    .line 108
    :cond_8
    const-string v5, "getFWVersion"

    invoke-virtual {v5, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_0

    .line 109
    if-eqz p3, :cond_0

    .line 110
    new-instance v3, Lorg/apache/cordova/PluginResult;

    sget-object v5, Lorg/apache/cordova/PluginResult$Status;->OK:Lorg/apache/cordova/PluginResult$Status;

    iget-object v6, p0, Lcom/belkin/cordova/plugin/AppPlugin;->mContext:Landroid/content/Context;

    invoke-static {v6}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->getInstance(Landroid/content/Context;)Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    move-result-object v6

    invoke-virtual {v6}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->getFWVersionsFromDb()Lorg/json/JSONArray;

    move-result-object v6

    invoke-direct {v3, v5, v6}, Lorg/apache/cordova/PluginResult;-><init>(Lorg/apache/cordova/PluginResult$Status;Lorg/json/JSONArray;)V

    .line 111
    .local v3, "dataResult":Lorg/apache/cordova/PluginResult;
    invoke-virtual {v3, v9}, Lorg/apache/cordova/PluginResult;->setKeepCallback(Z)V

    .line 112
    invoke-virtual {p3, v3}, Lorg/apache/cordova/CallbackContext;->sendPluginResult(Lorg/apache/cordova/PluginResult;)V

    goto/16 :goto_0
.end method

.method public initialize(Lorg/apache/cordova/CordovaInterface;Lorg/apache/cordova/CordovaWebView;)V
    .locals 2
    .param p1, "cordova"    # Lorg/apache/cordova/CordovaInterface;
    .param p2, "webView"    # Lorg/apache/cordova/CordovaWebView;

    .prologue
    .line 43
    const-string v0, "AppPlugin"

    const-string v1, "AppPlugin initialize"

    invoke-static {v0, v1}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 44
    invoke-super {p0, p1, p2}, Lorg/apache/cordova/CordovaPlugin;->initialize(Lorg/apache/cordova/CordovaInterface;Lorg/apache/cordova/CordovaWebView;)V

    .line 46
    invoke-interface {p1}, Lorg/apache/cordova/CordovaInterface;->getActivity()Landroid/app/Activity;

    move-result-object v0

    iput-object v0, p0, Lcom/belkin/cordova/plugin/AppPlugin;->mContext:Landroid/content/Context;

    .line 47
    iget-object v0, p0, Lcom/belkin/cordova/plugin/AppPlugin;->mContext:Landroid/content/Context;

    invoke-static {v0}, Lcom/belkin/controller/AppController;->getInstance(Landroid/content/Context;)Lcom/belkin/controller/AppController;

    move-result-object v0

    iput-object v0, p0, Lcom/belkin/cordova/plugin/AppPlugin;->mAppController:Lcom/belkin/controller/AppController;

    .line 48
    return-void
.end method
