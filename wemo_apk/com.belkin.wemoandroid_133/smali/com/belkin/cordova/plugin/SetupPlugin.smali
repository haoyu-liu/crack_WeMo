.class public Lcom/belkin/cordova/plugin/SetupPlugin;
.super Lorg/apache/cordova/CordovaPlugin;
.source "SetupPlugin.java"


# static fields
.field public static final TAG:Ljava/lang/String; = "SetupPlugin"


# instance fields
.field d:Lorg/cybergarage/upnp/Device;

.field private getEndListArray:Lorg/json/JSONArray;

.field private mBroadcastReceiver:Landroid/content/BroadcastReceiver;

.field private mBroadcastReceiverGetend:Landroid/content/BroadcastReceiver;

.field private mCallbackContext:Lorg/apache/cordova/CallbackContext;

.field private mContext:Landroid/content/Context;

.field mDeviceListManager:Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

.field private mLedCallbackContext:Lorg/apache/cordova/CallbackContext;

.field private mNetworkUtil:Lcom/belkin/wemo/cache/utils/SDKNetworkUtils;

.field private mPassword:Ljava/lang/String;

.field private mPluginResult:Lorg/apache/cordova/PluginResult;

.field private mSharePreference:Lcom/belkin/wemo/cache/utils/SharePreferences;

.field private mUpnpDeviceSetup:Lcom/belkin/cybergarage/wrapper/UpnpDeviceSetup;

.field private mWiFiSecurityUtil:Lcom/belkin/utils/WiFiSecurityUtil;

.field private mWifiUtil:Lcom/belkin/utils/WifiUtil;


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    const/4 v0, 0x0

    .line 57
    invoke-direct {p0}, Lorg/apache/cordova/CordovaPlugin;-><init>()V

    .line 69
    iput-object v0, p0, Lcom/belkin/cordova/plugin/SetupPlugin;->mCallbackContext:Lorg/apache/cordova/CallbackContext;

    .line 70
    iput-object v0, p0, Lcom/belkin/cordova/plugin/SetupPlugin;->mLedCallbackContext:Lorg/apache/cordova/CallbackContext;

    .line 75
    iput-object v0, p0, Lcom/belkin/cordova/plugin/SetupPlugin;->d:Lorg/cybergarage/upnp/Device;

    return-void
.end method

.method private GetendThread()V
    .locals 2

    .prologue
    .line 947
    new-instance v0, Lorg/json/JSONArray;

    invoke-direct {v0}, Lorg/json/JSONArray;-><init>()V

    iput-object v0, p0, Lcom/belkin/cordova/plugin/SetupPlugin;->getEndListArray:Lorg/json/JSONArray;

    .line 948
    new-instance v0, Ljava/lang/Thread;

    new-instance v1, Lcom/belkin/cordova/plugin/SetupPlugin$8;

    invoke-direct {v1, p0}, Lcom/belkin/cordova/plugin/SetupPlugin$8;-><init>(Lcom/belkin/cordova/plugin/SetupPlugin;)V

    invoke-direct {v0, v1}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    invoke-virtual {v0}, Ljava/lang/Thread;->start()V

    .line 976
    return-void
.end method

.method static synthetic access$000(Lcom/belkin/cordova/plugin/SetupPlugin;)Landroid/content/Context;
    .locals 1
    .param p0, "x0"    # Lcom/belkin/cordova/plugin/SetupPlugin;

    .prologue
    .line 57
    iget-object v0, p0, Lcom/belkin/cordova/plugin/SetupPlugin;->mContext:Landroid/content/Context;

    return-object v0
.end method

.method static synthetic access$100(Lcom/belkin/cordova/plugin/SetupPlugin;)Lcom/belkin/cybergarage/wrapper/UpnpDeviceSetup;
    .locals 1
    .param p0, "x0"    # Lcom/belkin/cordova/plugin/SetupPlugin;

    .prologue
    .line 57
    iget-object v0, p0, Lcom/belkin/cordova/plugin/SetupPlugin;->mUpnpDeviceSetup:Lcom/belkin/cybergarage/wrapper/UpnpDeviceSetup;

    return-object v0
.end method

.method static synthetic access$1000(Lcom/belkin/cordova/plugin/SetupPlugin;Landroid/content/Intent;Ljava/lang/String;[Ljava/lang/String;)V
    .locals 0
    .param p0, "x0"    # Lcom/belkin/cordova/plugin/SetupPlugin;
    .param p1, "x1"    # Landroid/content/Intent;
    .param p2, "x2"    # Ljava/lang/String;
    .param p3, "x3"    # [Ljava/lang/String;

    .prologue
    .line 57
    invoke-direct {p0, p1, p2, p3}, Lcom/belkin/cordova/plugin/SetupPlugin;->sendStatusIntent(Landroid/content/Intent;Ljava/lang/String;[Ljava/lang/String;)V

    return-void
.end method

.method static synthetic access$102(Lcom/belkin/cordova/plugin/SetupPlugin;Lcom/belkin/cybergarage/wrapper/UpnpDeviceSetup;)Lcom/belkin/cybergarage/wrapper/UpnpDeviceSetup;
    .locals 0
    .param p0, "x0"    # Lcom/belkin/cordova/plugin/SetupPlugin;
    .param p1, "x1"    # Lcom/belkin/cybergarage/wrapper/UpnpDeviceSetup;

    .prologue
    .line 57
    iput-object p1, p0, Lcom/belkin/cordova/plugin/SetupPlugin;->mUpnpDeviceSetup:Lcom/belkin/cybergarage/wrapper/UpnpDeviceSetup;

    return-object p1
.end method

.method static synthetic access$1100(Lcom/belkin/cordova/plugin/SetupPlugin;)Lorg/json/JSONArray;
    .locals 1
    .param p0, "x0"    # Lcom/belkin/cordova/plugin/SetupPlugin;

    .prologue
    .line 57
    iget-object v0, p0, Lcom/belkin/cordova/plugin/SetupPlugin;->getEndListArray:Lorg/json/JSONArray;

    return-object v0
.end method

.method static synthetic access$1102(Lcom/belkin/cordova/plugin/SetupPlugin;Lorg/json/JSONArray;)Lorg/json/JSONArray;
    .locals 0
    .param p0, "x0"    # Lcom/belkin/cordova/plugin/SetupPlugin;
    .param p1, "x1"    # Lorg/json/JSONArray;

    .prologue
    .line 57
    iput-object p1, p0, Lcom/belkin/cordova/plugin/SetupPlugin;->getEndListArray:Lorg/json/JSONArray;

    return-object p1
.end method

.method static synthetic access$200(Lcom/belkin/cordova/plugin/SetupPlugin;)Lcom/belkin/wemo/cache/utils/SDKNetworkUtils;
    .locals 1
    .param p0, "x0"    # Lcom/belkin/cordova/plugin/SetupPlugin;

    .prologue
    .line 57
    iget-object v0, p0, Lcom/belkin/cordova/plugin/SetupPlugin;->mNetworkUtil:Lcom/belkin/wemo/cache/utils/SDKNetworkUtils;

    return-object v0
.end method

.method static synthetic access$300(Lcom/belkin/cordova/plugin/SetupPlugin;)Lcom/belkin/wemo/cache/utils/SharePreferences;
    .locals 1
    .param p0, "x0"    # Lcom/belkin/cordova/plugin/SetupPlugin;

    .prologue
    .line 57
    iget-object v0, p0, Lcom/belkin/cordova/plugin/SetupPlugin;->mSharePreference:Lcom/belkin/wemo/cache/utils/SharePreferences;

    return-object v0
.end method

.method static synthetic access$400(Lcom/belkin/cordova/plugin/SetupPlugin;)Ljava/lang/String;
    .locals 1
    .param p0, "x0"    # Lcom/belkin/cordova/plugin/SetupPlugin;

    .prologue
    .line 57
    iget-object v0, p0, Lcom/belkin/cordova/plugin/SetupPlugin;->mPassword:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$402(Lcom/belkin/cordova/plugin/SetupPlugin;Ljava/lang/String;)Ljava/lang/String;
    .locals 0
    .param p0, "x0"    # Lcom/belkin/cordova/plugin/SetupPlugin;
    .param p1, "x1"    # Ljava/lang/String;

    .prologue
    .line 57
    iput-object p1, p0, Lcom/belkin/cordova/plugin/SetupPlugin;->mPassword:Ljava/lang/String;

    return-object p1
.end method

.method static synthetic access$500(Lcom/belkin/cordova/plugin/SetupPlugin;)Lcom/belkin/utils/WiFiSecurityUtil;
    .locals 1
    .param p0, "x0"    # Lcom/belkin/cordova/plugin/SetupPlugin;

    .prologue
    .line 57
    iget-object v0, p0, Lcom/belkin/cordova/plugin/SetupPlugin;->mWiFiSecurityUtil:Lcom/belkin/utils/WiFiSecurityUtil;

    return-object v0
.end method

.method static synthetic access$600(Lcom/belkin/cordova/plugin/SetupPlugin;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0
    .param p0, "x0"    # Lcom/belkin/cordova/plugin/SetupPlugin;
    .param p1, "x1"    # Ljava/lang/String;
    .param p2, "x2"    # Ljava/lang/String;

    .prologue
    .line 57
    invoke-direct {p0, p1, p2}, Lcom/belkin/cordova/plugin/SetupPlugin;->pushConnectionStatusIntent(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method static synthetic access$700(Lcom/belkin/cordova/plugin/SetupPlugin;)V
    .locals 0
    .param p0, "x0"    # Lcom/belkin/cordova/plugin/SetupPlugin;

    .prologue
    .line 57
    invoke-direct {p0}, Lcom/belkin/cordova/plugin/SetupPlugin;->sleep2s()V

    return-void
.end method

.method static synthetic access$800(Lcom/belkin/cordova/plugin/SetupPlugin;[Ljava/lang/String;)V
    .locals 0
    .param p0, "x0"    # Lcom/belkin/cordova/plugin/SetupPlugin;
    .param p1, "x1"    # [Ljava/lang/String;

    .prologue
    .line 57
    invoke-direct {p0, p1}, Lcom/belkin/cordova/plugin/SetupPlugin;->saveWiFiCredentials([Ljava/lang/String;)V

    return-void
.end method

.method static synthetic access$900(Lcom/belkin/cordova/plugin/SetupPlugin;Ljava/lang/String;)Z
    .locals 1
    .param p0, "x0"    # Lcom/belkin/cordova/plugin/SetupPlugin;
    .param p1, "x1"    # Ljava/lang/String;

    .prologue
    .line 57
    invoke-direct {p0, p1}, Lcom/belkin/cordova/plugin/SetupPlugin;->smartSetup(Ljava/lang/String;)Z

    move-result v0

    return v0
.end method

.method private getendCallListener(Lorg/apache/cordova/CallbackContext;)Z
    .locals 7
    .param p1, "callbackContext"    # Lorg/apache/cordova/CallbackContext;

    .prologue
    const/4 v6, 0x1

    .line 758
    iget-object v4, p0, Lcom/belkin/cordova/plugin/SetupPlugin;->mBroadcastReceiverGetend:Landroid/content/BroadcastReceiver;

    if-eqz v4, :cond_0

    .line 759
    const-string v4, "SetupPlugin"

    const-string v5, "getendCallListener Setup listener already running."

    invoke-static {v4, v5}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 760
    const-string v4, "Setup listener already running."

    invoke-virtual {p1, v4}, Lorg/apache/cordova/CallbackContext;->error(Ljava/lang/String;)V

    .line 813
    :goto_0
    return v6

    .line 763
    :cond_0
    const-string v4, "SetupPlugin"

    const-string v5, "getendCallListener setup listeners started"

    invoke-static {v4, v5}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 765
    move-object v3, p1

    .line 768
    .local v3, "tempContext":Lorg/apache/cordova/CallbackContext;
    new-instance v1, Landroid/content/IntentFilter;

    invoke-direct {v1}, Landroid/content/IntentFilter;-><init>()V

    .line 769
    .local v1, "intentFilter":Landroid/content/IntentFilter;
    const-string v4, "com.controller.belkin.hybrid.BRIDGE_DEVICES"

    invoke-virtual {v1, v4}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 770
    new-instance v4, Lcom/belkin/cordova/plugin/SetupPlugin$7;

    invoke-direct {v4, p0, v3}, Lcom/belkin/cordova/plugin/SetupPlugin$7;-><init>(Lcom/belkin/cordova/plugin/SetupPlugin;Lorg/apache/cordova/CallbackContext;)V

    iput-object v4, p0, Lcom/belkin/cordova/plugin/SetupPlugin;->mBroadcastReceiverGetend:Landroid/content/BroadcastReceiver;

    .line 805
    :try_start_0
    iget-object v4, p0, Lcom/belkin/cordova/plugin/SetupPlugin;->mContext:Landroid/content/Context;

    iget-object v5, p0, Lcom/belkin/cordova/plugin/SetupPlugin;->mBroadcastReceiverGetend:Landroid/content/BroadcastReceiver;

    invoke-virtual {v4, v5, v1}, Landroid/content/Context;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)Landroid/content/Intent;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 810
    :goto_1
    new-instance v2, Lorg/apache/cordova/PluginResult;

    sget-object v4, Lorg/apache/cordova/PluginResult$Status;->NO_RESULT:Lorg/apache/cordova/PluginResult$Status;

    invoke-direct {v2, v4}, Lorg/apache/cordova/PluginResult;-><init>(Lorg/apache/cordova/PluginResult$Status;)V

    .line 811
    .local v2, "pluginResult":Lorg/apache/cordova/PluginResult;
    invoke-virtual {v2, v6}, Lorg/apache/cordova/PluginResult;->setKeepCallback(Z)V

    .line 812
    invoke-virtual {p1, v2}, Lorg/apache/cordova/CallbackContext;->sendPluginResult(Lorg/apache/cordova/PluginResult;)V

    goto :goto_0

    .line 806
    .end local v2    # "pluginResult":Lorg/apache/cordova/PluginResult;
    :catch_0
    move-exception v0

    .line 807
    .local v0, "e":Ljava/lang/Exception;
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_1
.end method

.method private pushConnectionStatusIntent(Ljava/lang/String;Ljava/lang/String;)V
    .locals 2
    .param p1, "status"    # Ljava/lang/String;
    .param p2, "secSSID"    # Ljava/lang/String;

    .prologue
    .line 564
    new-instance v0, Landroid/content/Intent;

    invoke-direct {v0}, Landroid/content/Intent;-><init>()V

    .line 565
    .local v0, "intent":Landroid/content/Intent;
    const-string v1, "smartString"

    invoke-virtual {v0, v1, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 566
    const-string v1, "SSID"

    invoke-virtual {v0, v1, p2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 567
    const-string v1, "com.controller.belkin.hybrid.CONNECTION_STATUS"

    invoke-virtual {v0, v1}, Landroid/content/Intent;->setAction(Ljava/lang/String;)Landroid/content/Intent;

    .line 568
    iget-object v1, p0, Lcom/belkin/cordova/plugin/SetupPlugin;->mContext:Landroid/content/Context;

    invoke-virtual {v1, v0}, Landroid/content/Context;->sendBroadcast(Landroid/content/Intent;)V

    .line 569
    return-void
.end method

.method private saveWiFiCredentials([Ljava/lang/String;)V
    .locals 4
    .param p1, "connectionParams"    # [Ljava/lang/String;

    .prologue
    .line 685
    const-string v0, ""

    .line 686
    .local v0, "connectionString":Ljava/lang/String;
    const/4 v1, 0x0

    .local v1, "j":I
    :goto_0
    array-length v2, p1

    if-ge v1, v2, :cond_0

    .line 687
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    aget-object v3, p1, v1

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const/16 v3, 0x7c

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 686
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 689
    :cond_0
    iget-object v2, p0, Lcom/belkin/cordova/plugin/SetupPlugin;->mSharePreference:Lcom/belkin/wemo/cache/utils/SharePreferences;

    invoke-virtual {v2, v0}, Lcom/belkin/wemo/cache/utils/SharePreferences;->saveSetupCredential(Ljava/lang/String;)V

    .line 690
    return-void
.end method

.method private sendStatusIntent(Landroid/content/Intent;Ljava/lang/String;[Ljava/lang/String;)V
    .locals 8
    .param p1, "intent"    # Landroid/content/Intent;
    .param p2, "listen"    # Ljava/lang/String;
    .param p3, "attrs"    # [Ljava/lang/String;

    .prologue
    .line 860
    :try_start_0
    invoke-virtual {p1}, Landroid/content/Intent;->getExtras()Landroid/os/Bundle;

    move-result-object v0

    .line 861
    .local v0, "bundle":Landroid/os/Bundle;
    if-nez v0, :cond_1

    .line 863
    const-string v5, "SetupPlugin"

    const-string v6, "Error, bundle is null"

    invoke-static {v5, v6}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 882
    .end local v0    # "bundle":Landroid/os/Bundle;
    :cond_0
    :goto_0
    return-void

    .line 866
    .restart local v0    # "bundle":Landroid/os/Bundle;
    :cond_1
    new-instance v4, Lorg/json/JSONObject;

    invoke-direct {v4}, Lorg/json/JSONObject;-><init>()V

    .line 867
    .local v4, "setupObject":Lorg/json/JSONObject;
    const-string v5, "listen"

    invoke-virtual {v4, v5, p2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 868
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_1
    array-length v5, p3

    if-ge v2, v5, :cond_2

    .line 869
    aget-object v5, p3, v2

    aget-object v6, p3, v2

    invoke-virtual {v0, v6}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v4, v5, v6}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 868
    add-int/lit8 v2, v2, 0x1

    goto :goto_1

    .line 872
    :cond_2
    const-string v5, "SetupPlugin"

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "sendStatusIntent changed JSON: "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v4}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 873
    new-instance v3, Lorg/apache/cordova/PluginResult;

    sget-object v5, Lorg/apache/cordova/PluginResult$Status;->OK:Lorg/apache/cordova/PluginResult$Status;

    invoke-direct {v3, v5, v4}, Lorg/apache/cordova/PluginResult;-><init>(Lorg/apache/cordova/PluginResult$Status;Lorg/json/JSONObject;)V

    .line 874
    .local v3, "result":Lorg/apache/cordova/PluginResult;
    const/4 v5, 0x1

    invoke-virtual {v3, v5}, Lorg/apache/cordova/PluginResult;->setKeepCallback(Z)V

    .line 875
    sget-object v5, Ljava/lang/System;->out:Ljava/io/PrintStream;

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "plugin status:"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v3}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 876
    if-eqz v3, :cond_0

    .line 877
    iget-object v5, p0, Lcom/belkin/cordova/plugin/SetupPlugin;->mCallbackContext:Lorg/apache/cordova/CallbackContext;

    invoke-virtual {v5, v3}, Lorg/apache/cordova/CallbackContext;->sendPluginResult(Lorg/apache/cordova/PluginResult;)V
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 879
    .end local v0    # "bundle":Landroid/os/Bundle;
    .end local v2    # "i":I
    .end local v3    # "result":Lorg/apache/cordova/PluginResult;
    .end local v4    # "setupObject":Lorg/json/JSONObject;
    :catch_0
    move-exception v1

    .line 880
    .local v1, "e":Lorg/json/JSONException;
    invoke-virtual {v1}, Lorg/json/JSONException;->printStackTrace()V

    goto :goto_0
.end method

.method private sendWarmupIntent()Z
    .locals 6

    .prologue
    .line 820
    :try_start_0
    const-string v3, "SetupPlugin"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "sendWarmupIntent mContext: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget-object v5, p0, Lcom/belkin/cordova/plugin/SetupPlugin;->mContext:Landroid/content/Context;

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 821
    new-instance v1, Landroid/content/Intent;

    invoke-direct {v1}, Landroid/content/Intent;-><init>()V

    .line 822
    .local v1, "intent":Landroid/content/Intent;
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 823
    .local v2, "tempList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    const-string v3, "0"

    invoke-virtual {v2, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 824
    const-string v3, "getLedList"

    invoke-virtual {v1, v3, v2}, Landroid/content/Intent;->putStringArrayListExtra(Ljava/lang/String;Ljava/util/ArrayList;)Landroid/content/Intent;

    .line 825
    const-string v3, "com.controller.belkin.hybrid.BRIDGE_DEVICES"

    invoke-virtual {v1, v3}, Landroid/content/Intent;->setAction(Ljava/lang/String;)Landroid/content/Intent;

    .line 826
    iget-object v3, p0, Lcom/belkin/cordova/plugin/SetupPlugin;->mContext:Landroid/content/Context;

    invoke-virtual {v3, v1}, Landroid/content/Context;->sendBroadcast(Landroid/content/Intent;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 832
    .end local v1    # "intent":Landroid/content/Intent;
    .end local v2    # "tempList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    :goto_0
    const/4 v3, 0x1

    return v3

    .line 828
    :catch_0
    move-exception v0

    .line 830
    .local v0, "e":Ljava/lang/Exception;
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_0
.end method

.method private setupAsync(Lorg/json/JSONArray;Z)V
    .locals 2
    .param p1, "inParamArray"    # Lorg/json/JSONArray;
    .param p2, "rememberedSetup"    # Z

    .prologue
    .line 572
    iget-object v0, p0, Lcom/belkin/cordova/plugin/SetupPlugin;->cordova:Lorg/apache/cordova/CordovaInterface;

    invoke-interface {v0}, Lorg/apache/cordova/CordovaInterface;->getThreadPool()Ljava/util/concurrent/ExecutorService;

    move-result-object v0

    new-instance v1, Lcom/belkin/cordova/plugin/SetupPlugin$5;

    invoke-direct {v1, p0, p2, p1}, Lcom/belkin/cordova/plugin/SetupPlugin$5;-><init>(Lcom/belkin/cordova/plugin/SetupPlugin;ZLorg/json/JSONArray;)V

    invoke-interface {v0, v1}, Ljava/util/concurrent/ExecutorService;->execute(Ljava/lang/Runnable;)V

    .line 682
    return-void
.end method

.method private sleep2s()V
    .locals 4

    .prologue
    .line 694
    const-wide/16 v2, 0x7d0

    :try_start_0
    invoke-static {v2, v3}, Ljava/lang/Thread;->sleep(J)V
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0

    .line 698
    :goto_0
    return-void

    .line 695
    :catch_0
    move-exception v0

    .line 696
    .local v0, "e":Ljava/lang/InterruptedException;
    invoke-virtual {v0}, Ljava/lang/InterruptedException;->printStackTrace()V

    goto :goto_0
.end method

.method private smartSetup(Ljava/lang/String;)Z
    .locals 10
    .param p1, "secSSID"    # Ljava/lang/String;

    .prologue
    .line 544
    const-string v3, "SetupPlugin"

    const-string v6, "smartSetup, No longer connected to wemo - Flow B, checking network type till it connects or timeout"

    invoke-static {v3, v6}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 545
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v4

    .line 546
    .local v4, "startTime":J
    const/4 v0, 0x0

    .line 547
    .local v0, "count":I
    const-string v2, ""

    .line 550
    .local v2, "networkType":Ljava/lang/String;
    :cond_0
    const-wide/16 v6, 0x2710

    :try_start_0
    invoke-static {v6, v7}, Ljava/lang/Thread;->sleep(J)V
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0

    .line 554
    :goto_0
    iget-object v3, p0, Lcom/belkin/cordova/plugin/SetupPlugin;->mNetworkUtil:Lcom/belkin/wemo/cache/utils/SDKNetworkUtils;

    invoke-virtual {v3}, Lcom/belkin/wemo/cache/utils/SDKNetworkUtils;->getNetworkType()Ljava/lang/String;

    move-result-object v2

    .line 555
    const-string v3, "SetupPlugin"

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "smartSetup, checking network type till it connects or timeout try: "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    add-int/lit8 v0, v0, 0x1

    invoke-virtual {v6, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, " networkType: "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v3, v6}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 558
    const-string v3, "No_Network"

    invoke-virtual {v3, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_1

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v6

    sub-long/2addr v6, v4

    const-wide/32 v8, 0xea60

    cmp-long v3, v6, v8

    if-ltz v3, :cond_0

    .line 559
    :cond_1
    const-string v3, "6"

    invoke-direct {p0, v3, p1}, Lcom/belkin/cordova/plugin/SetupPlugin;->pushConnectionStatusIntent(Ljava/lang/String;Ljava/lang/String;)V

    .line 560
    const/4 v3, 0x1

    return v3

    .line 551
    :catch_0
    move-exception v1

    .line 552
    .local v1, "e":Ljava/lang/InterruptedException;
    invoke-virtual {v1}, Ljava/lang/InterruptedException;->printStackTrace()V

    goto :goto_0
.end method

.method private startSmartSetupListeners(Lorg/apache/cordova/CallbackContext;)Z
    .locals 5
    .param p1, "callbackContext"    # Lorg/apache/cordova/CallbackContext;

    .prologue
    const/4 v4, 0x1

    .line 702
    iget-object v2, p0, Lcom/belkin/cordova/plugin/SetupPlugin;->mBroadcastReceiver:Landroid/content/BroadcastReceiver;

    if-eqz v2, :cond_0

    .line 703
    const-string v2, "SetupPlugin"

    const-string v3, "startSmartSetupListeners Setup listener already running."

    invoke-static {v2, v3}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 704
    const-string v2, "Setup listener already running."

    invoke-virtual {p1, v2}, Lorg/apache/cordova/CallbackContext;->error(Ljava/lang/String;)V

    .line 753
    :goto_0
    return v4

    .line 707
    :cond_0
    const-string v2, "SetupPlugin"

    const-string v3, "startSmartSetupListeners setup listeners started"

    invoke-static {v2, v3}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 709
    iput-object p1, p0, Lcom/belkin/cordova/plugin/SetupPlugin;->mCallbackContext:Lorg/apache/cordova/CallbackContext;

    .line 712
    new-instance v0, Landroid/content/IntentFilter;

    invoke-direct {v0}, Landroid/content/IntentFilter;-><init>()V

    .line 713
    .local v0, "intentFilter":Landroid/content/IntentFilter;
    const-string v2, "com.controller.belkin.hybrid.WIFI_STATE_CHANGED"

    invoke-virtual {v0, v2}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 714
    const-string v2, "com.controller.belkin.hybrid.CONNECTION_STATUS"

    invoke-virtual {v0, v2}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 715
    const-string v2, "com.controller.belkin.hybrid.SMART_REGISTRATION"

    invoke-virtual {v0, v2}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 716
    const-string v2, "com.controller.belkin.hybrid.SMART_CHECK_WEMO"

    invoke-virtual {v0, v2}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 717
    new-instance v2, Lcom/belkin/cordova/plugin/SetupPlugin$6;

    invoke-direct {v2, p0}, Lcom/belkin/cordova/plugin/SetupPlugin$6;-><init>(Lcom/belkin/cordova/plugin/SetupPlugin;)V

    iput-object v2, p0, Lcom/belkin/cordova/plugin/SetupPlugin;->mBroadcastReceiver:Landroid/content/BroadcastReceiver;

    .line 746
    :try_start_0
    iget-object v2, p0, Lcom/belkin/cordova/plugin/SetupPlugin;->mContext:Landroid/content/Context;

    iget-object v3, p0, Lcom/belkin/cordova/plugin/SetupPlugin;->mBroadcastReceiver:Landroid/content/BroadcastReceiver;

    invoke-virtual {v2, v3, v0}, Landroid/content/Context;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)Landroid/content/Intent;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 750
    :goto_1
    new-instance v1, Lorg/apache/cordova/PluginResult;

    sget-object v2, Lorg/apache/cordova/PluginResult$Status;->NO_RESULT:Lorg/apache/cordova/PluginResult$Status;

    invoke-direct {v1, v2}, Lorg/apache/cordova/PluginResult;-><init>(Lorg/apache/cordova/PluginResult$Status;)V

    .line 751
    .local v1, "pluginResult":Lorg/apache/cordova/PluginResult;
    invoke-virtual {v1, v4}, Lorg/apache/cordova/PluginResult;->setKeepCallback(Z)V

    .line 752
    invoke-virtual {p1, v1}, Lorg/apache/cordova/CallbackContext;->sendPluginResult(Lorg/apache/cordova/PluginResult;)V

    goto :goto_0

    .line 747
    .end local v1    # "pluginResult":Lorg/apache/cordova/PluginResult;
    :catch_0
    move-exception v2

    goto :goto_1
.end method

.method private stopSmartSetupListeners(Lorg/apache/cordova/CallbackContext;)Z
    .locals 6
    .param p1, "callbackContext"    # Lorg/apache/cordova/CallbackContext;

    .prologue
    const/4 v5, 0x0

    const/4 v4, 0x1

    .line 886
    iget-object v1, p0, Lcom/belkin/cordova/plugin/SetupPlugin;->mBroadcastReceiver:Landroid/content/BroadcastReceiver;

    if-eqz v1, :cond_0

    .line 888
    :try_start_0
    iget-object v1, p0, Lcom/belkin/cordova/plugin/SetupPlugin;->mContext:Landroid/content/Context;

    iget-object v2, p0, Lcom/belkin/cordova/plugin/SetupPlugin;->mBroadcastReceiver:Landroid/content/BroadcastReceiver;

    invoke-virtual {v1, v2}, Landroid/content/Context;->unregisterReceiver(Landroid/content/BroadcastReceiver;)V

    .line 889
    const/4 v1, 0x0

    iput-object v1, p0, Lcom/belkin/cordova/plugin/SetupPlugin;->mBroadcastReceiver:Landroid/content/BroadcastReceiver;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 894
    :goto_0
    new-instance v1, Lorg/apache/cordova/PluginResult;

    sget-object v2, Lorg/apache/cordova/PluginResult$Status;->OK:Lorg/apache/cordova/PluginResult$Status;

    invoke-direct {v1, v2}, Lorg/apache/cordova/PluginResult;-><init>(Lorg/apache/cordova/PluginResult$Status;)V

    iput-object v1, p0, Lcom/belkin/cordova/plugin/SetupPlugin;->mPluginResult:Lorg/apache/cordova/PluginResult;

    .line 895
    iget-object v1, p0, Lcom/belkin/cordova/plugin/SetupPlugin;->mPluginResult:Lorg/apache/cordova/PluginResult;

    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Lorg/apache/cordova/PluginResult;->setKeepCallback(Z)V

    .line 896
    iget-object v1, p0, Lcom/belkin/cordova/plugin/SetupPlugin;->mCallbackContext:Lorg/apache/cordova/CallbackContext;

    iget-object v2, p0, Lcom/belkin/cordova/plugin/SetupPlugin;->mPluginResult:Lorg/apache/cordova/PluginResult;

    invoke-virtual {v1, v2}, Lorg/apache/cordova/CallbackContext;->sendPluginResult(Lorg/apache/cordova/PluginResult;)V

    .line 897
    iput-object v5, p0, Lcom/belkin/cordova/plugin/SetupPlugin;->mCallbackContext:Lorg/apache/cordova/CallbackContext;

    .line 898
    invoke-virtual {p1}, Lorg/apache/cordova/CallbackContext;->success()V

    .line 902
    :goto_1
    return v4

    .line 890
    :catch_0
    move-exception v0

    .line 891
    .local v0, "e":Ljava/lang/Exception;
    const-string v1, "SetupPlugin"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Error unregistering device listener: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v0}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_0

    .line 900
    .end local v0    # "e":Ljava/lang/Exception;
    :cond_0
    invoke-virtual {p1, v4}, Lorg/apache/cordova/CallbackContext;->error(I)V

    goto :goto_1
.end method

.method private stopgetEndSetupListeners(Lorg/apache/cordova/CallbackContext;)Z
    .locals 6
    .param p1, "callbackContext"    # Lorg/apache/cordova/CallbackContext;

    .prologue
    const/4 v5, 0x0

    const/4 v4, 0x1

    .line 837
    iget-object v1, p0, Lcom/belkin/cordova/plugin/SetupPlugin;->mBroadcastReceiverGetend:Landroid/content/BroadcastReceiver;

    if-eqz v1, :cond_0

    .line 839
    :try_start_0
    iget-object v1, p0, Lcom/belkin/cordova/plugin/SetupPlugin;->mContext:Landroid/content/Context;

    iget-object v2, p0, Lcom/belkin/cordova/plugin/SetupPlugin;->mBroadcastReceiverGetend:Landroid/content/BroadcastReceiver;

    invoke-virtual {v1, v2}, Landroid/content/Context;->unregisterReceiver(Landroid/content/BroadcastReceiver;)V

    .line 840
    const/4 v1, 0x0

    iput-object v1, p0, Lcom/belkin/cordova/plugin/SetupPlugin;->mBroadcastReceiverGetend:Landroid/content/BroadcastReceiver;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 845
    :goto_0
    new-instance v1, Lorg/apache/cordova/PluginResult;

    sget-object v2, Lorg/apache/cordova/PluginResult$Status;->OK:Lorg/apache/cordova/PluginResult$Status;

    invoke-direct {v1, v2}, Lorg/apache/cordova/PluginResult;-><init>(Lorg/apache/cordova/PluginResult$Status;)V

    iput-object v1, p0, Lcom/belkin/cordova/plugin/SetupPlugin;->mPluginResult:Lorg/apache/cordova/PluginResult;

    .line 846
    iget-object v1, p0, Lcom/belkin/cordova/plugin/SetupPlugin;->mPluginResult:Lorg/apache/cordova/PluginResult;

    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Lorg/apache/cordova/PluginResult;->setKeepCallback(Z)V

    .line 847
    iget-object v1, p0, Lcom/belkin/cordova/plugin/SetupPlugin;->mLedCallbackContext:Lorg/apache/cordova/CallbackContext;

    iget-object v2, p0, Lcom/belkin/cordova/plugin/SetupPlugin;->mPluginResult:Lorg/apache/cordova/PluginResult;

    invoke-virtual {v1, v2}, Lorg/apache/cordova/CallbackContext;->sendPluginResult(Lorg/apache/cordova/PluginResult;)V

    .line 848
    iput-object v5, p0, Lcom/belkin/cordova/plugin/SetupPlugin;->mLedCallbackContext:Lorg/apache/cordova/CallbackContext;

    .line 849
    invoke-virtual {p1}, Lorg/apache/cordova/CallbackContext;->success()V

    .line 853
    :goto_1
    return v4

    .line 841
    :catch_0
    move-exception v0

    .line 842
    .local v0, "e":Ljava/lang/Exception;
    const-string v1, "SetupPlugin"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Error unregistering device listener: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v0}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_0

    .line 851
    .end local v0    # "e":Ljava/lang/Exception;
    :cond_0
    invoke-virtual {p1, v4}, Lorg/apache/cordova/CallbackContext;->error(I)V

    goto :goto_1
.end method


# virtual methods
.method public execute(Ljava/lang/String;Lorg/json/JSONArray;Lorg/apache/cordova/CallbackContext;)Z
    .locals 36
    .param p1, "action"    # Ljava/lang/String;
    .param p2, "inParamArray"    # Lorg/json/JSONArray;
    .param p3, "callbackContext"    # Lorg/apache/cordova/CallbackContext;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .prologue
    .line 97
    const-string v33, "SetupPlugin"

    new-instance v34, Ljava/lang/StringBuilder;

    invoke-direct/range {v34 .. v34}, Ljava/lang/StringBuilder;-><init>()V

    const-string v35, "SetupPlugin execute method for ACTION = "

    invoke-virtual/range {v34 .. v35}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v34

    move-object/from16 v0, v34

    move-object/from16 v1, p1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v34

    const-string v35, "; Params = "

    invoke-virtual/range {v34 .. v35}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v34

    move-object/from16 v0, v34

    move-object/from16 v1, p2

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v34

    const-string v35, "; Context: "

    invoke-virtual/range {v34 .. v35}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v34

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/cordova/plugin/SetupPlugin;->mContext:Landroid/content/Context;

    move-object/from16 v35, v0

    invoke-virtual/range {v34 .. v35}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v34

    invoke-virtual/range {v34 .. v34}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v34

    invoke-static/range {v33 .. v34}, Lcom/belkin/utils/LogUtils;->debugLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 98
    const-string v33, "isNetworkConnected"

    move-object/from16 v0, p1

    move-object/from16 v1, v33

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v33

    if-eqz v33, :cond_1

    .line 99
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/cordova/plugin/SetupPlugin;->mNetworkUtil:Lcom/belkin/wemo/cache/utils/SDKNetworkUtils;

    move-object/from16 v33, v0

    invoke-virtual/range {v33 .. v33}, Lcom/belkin/wemo/cache/utils/SDKNetworkUtils;->isNetworkConnected()Z

    move-result v27

    .line 100
    .local v27, "result":Z
    const-string v33, "SetupPlugin"

    new-instance v34, Ljava/lang/StringBuilder;

    invoke-direct/range {v34 .. v34}, Ljava/lang/StringBuilder;-><init>()V

    const-string v35, "is Network Connected: "

    invoke-virtual/range {v34 .. v35}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v34

    move-object/from16 v0, v34

    move/from16 v1, v27

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v34

    invoke-virtual/range {v34 .. v34}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v34

    invoke-static/range {v33 .. v34}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 101
    if-eqz v27, :cond_0

    const-string v33, "true"

    :goto_0
    move-object/from16 v0, p3

    move-object/from16 v1, v33

    invoke-virtual {v0, v1}, Lorg/apache/cordova/CallbackContext;->success(Ljava/lang/String;)V

    .line 102
    const/16 v27, 0x1

    .line 540
    .end local v27    # "result":Z
    :goto_1
    return v27

    .line 101
    .restart local v27    # "result":Z
    :cond_0
    const-string v33, "false"

    goto :goto_0

    .line 104
    .end local v27    # "result":Z
    :cond_1
    const-string v33, "isPluginConnected"

    move-object/from16 v0, p1

    move-object/from16 v1, v33

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v33

    if-eqz v33, :cond_4

    .line 106
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/cordova/plugin/SetupPlugin;->mNetworkUtil:Lcom/belkin/wemo/cache/utils/SDKNetworkUtils;

    move-object/from16 v33, v0

    invoke-virtual/range {v33 .. v33}, Lcom/belkin/wemo/cache/utils/SDKNetworkUtils;->isPluginConnected()Z

    move-result v27

    .line 107
    .restart local v27    # "result":Z
    const-string v33, "SetupPlugin"

    new-instance v34, Ljava/lang/StringBuilder;

    invoke-direct/range {v34 .. v34}, Ljava/lang/StringBuilder;-><init>()V

    const-string v35, "is plugin Connected: "

    invoke-virtual/range {v34 .. v35}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v34

    move-object/from16 v0, v34

    move/from16 v1, v27

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v34

    invoke-virtual/range {v34 .. v34}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v34

    invoke-static/range {v33 .. v34}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 108
    if-eqz v27, :cond_3

    const-string v33, "true"

    :goto_2
    move-object/from16 v0, p3

    move-object/from16 v1, v33

    invoke-virtual {v0, v1}, Lorg/apache/cordova/CallbackContext;->success(Ljava/lang/String;)V

    .line 540
    .end local v27    # "result":Z
    :cond_2
    :goto_3
    const/16 v27, 0x0

    goto :goto_1

    .line 108
    .restart local v27    # "result":Z
    :cond_3
    const-string v33, "false"

    goto :goto_2

    .line 109
    .end local v27    # "result":Z
    :cond_4
    const-string v33, "openWifiSettings"

    move-object/from16 v0, p1

    move-object/from16 v1, v33

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v33

    if-eqz v33, :cond_5

    .line 110
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/cordova/plugin/SetupPlugin;->mContext:Landroid/content/Context;

    move-object/from16 v33, v0

    new-instance v34, Landroid/content/Intent;

    const-string v35, "android.settings.WIFI_SETTINGS"

    invoke-direct/range {v34 .. v35}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    invoke-virtual/range {v33 .. v34}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 111
    const/16 v27, 0x1

    goto :goto_1

    .line 113
    :cond_5
    const-string v33, "recreateControlPoint"

    move-object/from16 v0, p1

    move-object/from16 v1, v33

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v33

    if-eqz v33, :cond_6

    .line 114
    const-string v33, "SetupPlugin"

    const-string v34, "ACTION_RECREATE_CONTROL_POINT_NEW"

    invoke-static/range {v33 .. v34}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 115
    new-instance v33, Lcom/belkin/cordova/plugin/SetupPlugin$1;

    move-object/from16 v0, v33

    move-object/from16 v1, p0

    move-object/from16 v2, p3

    invoke-direct {v0, v1, v2}, Lcom/belkin/cordova/plugin/SetupPlugin$1;-><init>(Lcom/belkin/cordova/plugin/SetupPlugin;Lorg/apache/cordova/CallbackContext;)V

    invoke-static/range {v33 .. v33}, Lcom/belkin/wemo/thread/WeMoThreadPoolHandler;->executeInBackground(Ljava/lang/Runnable;)V

    .line 128
    const/16 v27, 0x1

    goto/16 :goto_1

    .line 130
    :cond_6
    const-string v33, "setupDeviceDetails"

    move-object/from16 v0, p1

    move-object/from16 v1, v33

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v33

    if-eqz v33, :cond_7

    .line 131
    const-string v33, "SetupPlugin"

    const-string v34, "setupDeviceDetails"

    invoke-static/range {v33 .. v34}, Lcom/belkin/utils/LogUtils;->debugLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 132
    new-instance v33, Lcom/belkin/cordova/plugin/SetupPlugin$2;

    move-object/from16 v0, v33

    move-object/from16 v1, p0

    move-object/from16 v2, p3

    invoke-direct {v0, v1, v2}, Lcom/belkin/cordova/plugin/SetupPlugin$2;-><init>(Lcom/belkin/cordova/plugin/SetupPlugin;Lorg/apache/cordova/CallbackContext;)V

    invoke-static/range {v33 .. v33}, Lcom/belkin/wemo/thread/WeMoThreadPoolHandler;->executeInBackground(Ljava/lang/Runnable;)V

    .line 226
    const/16 v27, 0x1

    goto/16 :goto_1

    .line 227
    :cond_7
    const-string v33, "getFirmwareVersion"

    move-object/from16 v0, p1

    move-object/from16 v1, v33

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v33

    if-eqz v33, :cond_9

    .line 228
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/cordova/plugin/SetupPlugin;->mUpnpDeviceSetup:Lcom/belkin/cybergarage/wrapper/UpnpDeviceSetup;

    move-object/from16 v33, v0

    invoke-virtual/range {v33 .. v33}, Lcom/belkin/cybergarage/wrapper/UpnpDeviceSetup;->getSetupDevice()Lorg/cybergarage/upnp/Device;

    move-result-object v11

    .line 229
    .local v11, "d":Lorg/cybergarage/upnp/Device;
    const-string v16, ""

    .line 230
    .local v16, "firmware":Ljava/lang/String;
    if-eqz v11, :cond_8

    .line 231
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/cordova/plugin/SetupPlugin;->mContext:Landroid/content/Context;

    move-object/from16 v33, v0

    invoke-static/range {v33 .. v33}, Lcom/belkin/wemo/localsdk/WeMoSDKContext;->getInstance(Landroid/content/Context;)Lcom/belkin/wemo/localsdk/WeMoSDKContext;

    move-result-object v33

    invoke-virtual {v11}, Lorg/cybergarage/upnp/Device;->getUDN()Ljava/lang/String;

    move-result-object v34

    invoke-virtual/range {v33 .. v34}, Lcom/belkin/wemo/localsdk/WeMoSDKContext;->getWeMoDeviceByUDN(Ljava/lang/String;)Lcom/belkin/wemo/localsdk/WeMoDevice;

    move-result-object v32

    .line 232
    .local v32, "wemoDevice":Lcom/belkin/wemo/localsdk/WeMoDevice;
    if-eqz v32, :cond_8

    .line 233
    invoke-virtual/range {v32 .. v32}, Lcom/belkin/wemo/localsdk/WeMoDevice;->getFirmwareVersion()Ljava/lang/String;

    move-result-object v16

    .line 236
    .end local v32    # "wemoDevice":Lcom/belkin/wemo/localsdk/WeMoDevice;
    :cond_8
    move-object/from16 v0, p3

    move-object/from16 v1, v16

    invoke-virtual {v0, v1}, Lorg/apache/cordova/CallbackContext;->success(Ljava/lang/String;)V

    .line 237
    const/16 v27, 0x1

    goto/16 :goto_1

    .line 238
    .end local v11    # "d":Lorg/cybergarage/upnp/Device;
    .end local v16    # "firmware":Ljava/lang/String;
    :cond_9
    const-string v33, "stopUpNpService"

    move-object/from16 v0, p1

    move-object/from16 v1, v33

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v33

    if-eqz v33, :cond_c

    .line 240
    sget-object v33, Lcom/belkin/cordova/plugin/DevicePlugin;->mWeMoSDKContext:Lcom/belkin/wemo/localsdk/WeMoSDKContext;

    if-eqz v33, :cond_a

    .line 241
    sget-object v33, Lcom/belkin/cordova/plugin/DevicePlugin;->mWeMoSDKContext:Lcom/belkin/wemo/localsdk/WeMoSDKContext;

    invoke-virtual/range {v33 .. v33}, Lcom/belkin/wemo/localsdk/WeMoSDKContext;->stop()V

    .line 242
    const/16 v33, 0x0

    sput-object v33, Lcom/belkin/cordova/plugin/DevicePlugin;->mWeMoSDKContext:Lcom/belkin/wemo/localsdk/WeMoSDKContext;

    .line 245
    :cond_a
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/cordova/plugin/SetupPlugin;->mUpnpDeviceSetup:Lcom/belkin/cybergarage/wrapper/UpnpDeviceSetup;

    move-object/from16 v33, v0

    if-eqz v33, :cond_b

    .line 246
    const/16 v33, 0x0

    move-object/from16 v0, v33

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/belkin/cordova/plugin/SetupPlugin;->mUpnpDeviceSetup:Lcom/belkin/cybergarage/wrapper/UpnpDeviceSetup;

    .line 247
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/cordova/plugin/SetupPlugin;->mNetworkUtil:Lcom/belkin/wemo/cache/utils/SDKNetworkUtils;

    move-object/from16 v33, v0

    invoke-virtual/range {v33 .. v33}, Lcom/belkin/wemo/cache/utils/SDKNetworkUtils;->unRegisterNetwork()V

    .line 249
    :cond_b
    invoke-virtual/range {p3 .. p3}, Lorg/apache/cordova/CallbackContext;->success()V

    .line 250
    const/16 v27, 0x1

    goto/16 :goto_1

    .line 251
    :cond_c
    const-string v33, "getConfigStatus"

    move-object/from16 v0, p1

    move-object/from16 v1, v33

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v33

    if-eqz v33, :cond_e

    .line 252
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/cordova/plugin/SetupPlugin;->mSharePreference:Lcom/belkin/wemo/cache/utils/SharePreferences;

    move-object/from16 v33, v0

    invoke-virtual/range {v33 .. v33}, Lcom/belkin/wemo/cache/utils/SharePreferences;->checkConfigurationStatus()Z

    move-result v33

    if-eqz v33, :cond_d

    const-string v33, "true"

    :goto_4
    move-object/from16 v0, p3

    move-object/from16 v1, v33

    invoke-virtual {v0, v1}, Lorg/apache/cordova/CallbackContext;->success(Ljava/lang/String;)V

    .line 253
    const-string v33, "SetupPlugin"

    new-instance v34, Ljava/lang/StringBuilder;

    invoke-direct/range {v34 .. v34}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/cordova/plugin/SetupPlugin;->mSharePreference:Lcom/belkin/wemo/cache/utils/SharePreferences;

    move-object/from16 v35, v0

    invoke-virtual/range {v35 .. v35}, Lcom/belkin/wemo/cache/utils/SharePreferences;->checkConfigurationStatus()Z

    move-result v35

    invoke-virtual/range {v34 .. v35}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v34

    const-string v35, ""

    invoke-virtual/range {v34 .. v35}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v34

    invoke-virtual/range {v34 .. v34}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v34

    invoke-static/range {v33 .. v34}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 254
    const/16 v27, 0x1

    goto/16 :goto_1

    .line 252
    :cond_d
    const-string v33, "false"

    goto :goto_4

    .line 255
    :cond_e
    const-string v33, "connectToDeafultRouter"

    move-object/from16 v0, p1

    move-object/from16 v1, v33

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v33

    if-eqz v33, :cond_10

    .line 256
    const-string v33, "SetupPlugin"

    const-string v34, "(action.equals(CordovaConstants.ACTION_CONNECT_TO_DEFAULT_ROUTER)"

    invoke-static/range {v33 .. v34}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 257
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/cordova/plugin/SetupPlugin;->mSharePreference:Lcom/belkin/wemo/cache/utils/SharePreferences;

    move-object/from16 v33, v0

    invoke-virtual/range {v33 .. v33}, Lcom/belkin/wemo/cache/utils/SharePreferences;->getSetupCredential()Ljava/lang/String;

    move-result-object v28

    .line 258
    .local v28, "savedConfig":Ljava/lang/String;
    if-nez v28, :cond_f

    .line 259
    const-string v33, "SetupPlugin"

    const-string v34, "setupAsync savedConfig is null"

    invoke-static/range {v33 .. v34}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 260
    const/16 v33, 0x0

    move-object/from16 v0, p3

    move/from16 v1, v33

    invoke-virtual {v0, v1}, Lorg/apache/cordova/CallbackContext;->error(I)V

    .line 261
    const/16 v27, 0x0

    goto/16 :goto_1

    .line 263
    :cond_f
    const/16 v33, 0x1

    move-object/from16 v0, p0

    move-object/from16 v1, p2

    move/from16 v2, v33

    invoke-direct {v0, v1, v2}, Lcom/belkin/cordova/plugin/SetupPlugin;->setupAsync(Lorg/json/JSONArray;Z)V

    .line 264
    const/16 v27, 0x1

    goto/16 :goto_1

    .line 265
    .end local v28    # "savedConfig":Ljava/lang/String;
    :cond_10
    const-string v33, "getWiFiAPList"

    move-object/from16 v0, p1

    move-object/from16 v1, v33

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v33

    if-eqz v33, :cond_11

    .line 266
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/cordova/plugin/SetupPlugin;->cordova:Lorg/apache/cordova/CordovaInterface;

    move-object/from16 v33, v0

    invoke-interface/range {v33 .. v33}, Lorg/apache/cordova/CordovaInterface;->getThreadPool()Ljava/util/concurrent/ExecutorService;

    move-result-object v33

    new-instance v34, Lcom/belkin/cordova/plugin/SetupPlugin$3;

    move-object/from16 v0, v34

    move-object/from16 v1, p0

    move-object/from16 v2, p3

    invoke-direct {v0, v1, v2}, Lcom/belkin/cordova/plugin/SetupPlugin$3;-><init>(Lcom/belkin/cordova/plugin/SetupPlugin;Lorg/apache/cordova/CallbackContext;)V

    invoke-interface/range {v33 .. v34}, Ljava/util/concurrent/ExecutorService;->execute(Ljava/lang/Runnable;)V

    .line 276
    const/16 v27, 0x1

    goto/16 :goto_1

    .line 277
    :cond_11
    const-string v33, "postAPPasswordData"

    move-object/from16 v0, p1

    move-object/from16 v1, v33

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v33

    if-eqz v33, :cond_12

    .line 278
    const-string v33, "SetupPlugin"

    const-string v34, "(action.equals(CordovaConstants.ACTION_POST_AP_PASSWORD_DATA)"

    invoke-static/range {v33 .. v34}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 279
    const/16 v33, 0x0

    move-object/from16 v0, p0

    move-object/from16 v1, p2

    move/from16 v2, v33

    invoke-direct {v0, v1, v2}, Lcom/belkin/cordova/plugin/SetupPlugin;->setupAsync(Lorg/json/JSONArray;Z)V

    .line 280
    const/16 v27, 0x1

    goto/16 :goto_1

    .line 283
    :cond_12
    const-string v33, "getEndDevicesNew"

    move-object/from16 v0, p1

    move-object/from16 v1, v33

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v33

    if-eqz v33, :cond_13

    .line 284
    invoke-direct/range {p0 .. p0}, Lcom/belkin/cordova/plugin/SetupPlugin;->sendWarmupIntent()Z

    .line 285
    invoke-virtual/range {p3 .. p3}, Lorg/apache/cordova/CallbackContext;->success()V

    .line 286
    const/16 v27, 0x1

    goto/16 :goto_1

    .line 288
    :cond_13
    const-string v33, "setFriendlyName"

    move-object/from16 v0, p1

    move-object/from16 v1, v33

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v33

    if-eqz v33, :cond_17

    .line 289
    const/16 v33, 0x0

    move-object/from16 v0, p2

    move/from16 v1, v33

    invoke-virtual {v0, v1}, Lorg/json/JSONArray;->get(I)Ljava/lang/Object;

    move-result-object v33

    invoke-virtual/range {v33 .. v33}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v17

    .line 290
    .local v17, "friendlyName":Ljava/lang/String;
    if-nez v17, :cond_14

    .line 291
    invoke-virtual/range {p3 .. p3}, Lorg/apache/cordova/CallbackContext;->success()V

    .line 292
    const/16 v27, 0x1

    goto/16 :goto_1

    .line 294
    :cond_14
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/cordova/plugin/SetupPlugin;->mUpnpDeviceSetup:Lcom/belkin/cybergarage/wrapper/UpnpDeviceSetup;

    move-object/from16 v33, v0

    const/16 v34, 0x1

    move/from16 v0, v34

    new-array v0, v0, [Ljava/lang/String;

    move-object/from16 v34, v0

    const/16 v35, 0x0

    aput-object v17, v34, v35

    invoke-virtual/range {v33 .. v34}, Lcom/belkin/cybergarage/wrapper/UpnpDeviceSetup;->setFriendlyName([Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v26

    .line 295
    .local v26, "response":Lorg/json/JSONObject;
    if-eqz v26, :cond_16

    const-string v33, "ChangeFriendlyName"

    move-object/from16 v0, v26

    move-object/from16 v1, v33

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v33

    const-string v34, "true"

    invoke-virtual/range {v33 .. v34}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v33

    if-eqz v33, :cond_16

    .line 296
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/cordova/plugin/SetupPlugin;->mUpnpDeviceSetup:Lcom/belkin/cybergarage/wrapper/UpnpDeviceSetup;

    move-object/from16 v33, v0

    invoke-virtual/range {v33 .. v33}, Lcom/belkin/cybergarage/wrapper/UpnpDeviceSetup;->getSetupDevice()Lorg/cybergarage/upnp/Device;

    move-result-object v11

    .line 297
    .restart local v11    # "d":Lorg/cybergarage/upnp/Device;
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/cordova/plugin/SetupPlugin;->mDeviceListManager:Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    move-object/from16 v33, v0

    if-nez v33, :cond_15

    .line 298
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/cordova/plugin/SetupPlugin;->mContext:Landroid/content/Context;

    move-object/from16 v33, v0

    invoke-static/range {v33 .. v33}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->getInstance(Landroid/content/Context;)Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    move-result-object v33

    move-object/from16 v0, v33

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/belkin/cordova/plugin/SetupPlugin;->mDeviceListManager:Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    .line 300
    :cond_15
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/cordova/plugin/SetupPlugin;->mDeviceListManager:Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    move-object/from16 v33, v0

    invoke-virtual {v11}, Lorg/cybergarage/upnp/Device;->getUDN()Ljava/lang/String;

    move-result-object v34

    move-object/from16 v0, v33

    move-object/from16 v1, v34

    move-object/from16 v2, v17

    invoke-virtual {v0, v1, v2}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->updateFriendlyName(Ljava/lang/String;Ljava/lang/String;)V

    .line 302
    .end local v11    # "d":Lorg/cybergarage/upnp/Device;
    :cond_16
    move-object/from16 v0, p3

    move-object/from16 v1, v26

    invoke-virtual {v0, v1}, Lorg/apache/cordova/CallbackContext;->success(Lorg/json/JSONObject;)V

    .line 304
    const/16 v27, 0x1

    goto/16 :goto_1

    .line 305
    .end local v17    # "friendlyName":Ljava/lang/String;
    .end local v26    # "response":Lorg/json/JSONObject;
    :cond_17
    const-string v33, "editIconInSetup"

    move-object/from16 v0, p1

    move-object/from16 v1, v33

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v33

    if-eqz v33, :cond_1a

    .line 306
    if-eqz p2, :cond_19

    invoke-virtual/range {p2 .. p2}, Lorg/json/JSONArray;->length()I

    move-result v33

    if-lez v33, :cond_19

    .line 307
    const/16 v33, 0x0

    move-object/from16 v0, p2

    move/from16 v1, v33

    invoke-virtual {v0, v1}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v19

    .line 308
    .local v19, "iconJO":Lorg/json/JSONObject;
    const-string v33, "icon"

    move-object/from16 v0, v19

    move-object/from16 v1, v33

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v18

    .line 309
    .local v18, "icon":Ljava/lang/String;
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/cordova/plugin/SetupPlugin;->mUpnpDeviceSetup:Lcom/belkin/cybergarage/wrapper/UpnpDeviceSetup;

    move-object/from16 v33, v0

    move-object/from16 v0, v33

    move-object/from16 v1, v18

    invoke-virtual {v0, v1}, Lcom/belkin/cybergarage/wrapper/UpnpDeviceSetup;->editIcon(Ljava/lang/String;)Z

    move-result v33

    if-eqz v33, :cond_18

    .line 310
    new-instance v33, Lorg/apache/cordova/PluginResult;

    sget-object v34, Lorg/apache/cordova/PluginResult$Status;->OK:Lorg/apache/cordova/PluginResult$Status;

    invoke-direct/range {v33 .. v34}, Lorg/apache/cordova/PluginResult;-><init>(Lorg/apache/cordova/PluginResult$Status;)V

    move-object/from16 v0, p3

    move-object/from16 v1, v33

    invoke-virtual {v0, v1}, Lorg/apache/cordova/CallbackContext;->sendPluginResult(Lorg/apache/cordova/PluginResult;)V

    .line 311
    const/16 v27, 0x1

    goto/16 :goto_1

    .line 313
    :cond_18
    new-instance v33, Lorg/apache/cordova/PluginResult;

    sget-object v34, Lorg/apache/cordova/PluginResult$Status;->ERROR:Lorg/apache/cordova/PluginResult$Status;

    invoke-direct/range {v33 .. v34}, Lorg/apache/cordova/PluginResult;-><init>(Lorg/apache/cordova/PluginResult$Status;)V

    move-object/from16 v0, p3

    move-object/from16 v1, v33

    invoke-virtual {v0, v1}, Lorg/apache/cordova/CallbackContext;->sendPluginResult(Lorg/apache/cordova/PluginResult;)V

    goto/16 :goto_3

    .line 316
    .end local v18    # "icon":Ljava/lang/String;
    .end local v19    # "iconJO":Lorg/json/JSONObject;
    :cond_19
    const-string v33, "SetupPlugin"

    const-string v34, "ACTION_EDIT_ICON_IN_SETUP: inParamArray is NULL or empty"

    invoke-static/range {v33 .. v34}, Lcom/belkin/utils/LogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 317
    new-instance v33, Lorg/apache/cordova/PluginResult;

    sget-object v34, Lorg/apache/cordova/PluginResult$Status;->ERROR:Lorg/apache/cordova/PluginResult$Status;

    invoke-direct/range {v33 .. v34}, Lorg/apache/cordova/PluginResult;-><init>(Lorg/apache/cordova/PluginResult$Status;)V

    move-object/from16 v0, p3

    move-object/from16 v1, v33

    invoke-virtual {v0, v1}, Lorg/apache/cordova/CallbackContext;->sendPluginResult(Lorg/apache/cordova/PluginResult;)V

    goto/16 :goto_3

    .line 319
    :cond_1a
    const-string v33, "getNetworkStatus"

    move-object/from16 v0, p1

    move-object/from16 v1, v33

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v33

    if-eqz v33, :cond_1b

    .line 320
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/cordova/plugin/SetupPlugin;->mUpnpDeviceSetup:Lcom/belkin/cybergarage/wrapper/UpnpDeviceSetup;

    move-object/from16 v33, v0

    invoke-virtual/range {v33 .. v33}, Lcom/belkin/cybergarage/wrapper/UpnpDeviceSetup;->networkStatus()Lorg/json/JSONObject;

    move-result-object v33

    move-object/from16 v0, p3

    move-object/from16 v1, v33

    invoke-virtual {v0, v1}, Lorg/apache/cordova/CallbackContext;->success(Lorg/json/JSONObject;)V

    .line 321
    const/16 v27, 0x1

    goto/16 :goto_1

    .line 322
    :cond_1b
    const-string v33, "closeAccessPoint"

    move-object/from16 v0, p1

    move-object/from16 v1, v33

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v33

    if-eqz v33, :cond_1c

    .line 323
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/cordova/plugin/SetupPlugin;->mUpnpDeviceSetup:Lcom/belkin/cybergarage/wrapper/UpnpDeviceSetup;

    move-object/from16 v33, v0

    invoke-virtual/range {v33 .. v33}, Lcom/belkin/cybergarage/wrapper/UpnpDeviceSetup;->closeSetup()Lorg/json/JSONObject;

    move-result-object v33

    move-object/from16 v0, p3

    move-object/from16 v1, v33

    invoke-virtual {v0, v1}, Lorg/apache/cordova/CallbackContext;->success(Lorg/json/JSONObject;)V

    .line 324
    const/16 v27, 0x1

    goto/16 :goto_1

    .line 325
    :cond_1c
    const-string v33, "connectWiFiRouter"

    move-object/from16 v0, p1

    move-object/from16 v1, v33

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v33

    if-eqz v33, :cond_1e

    .line 326
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/cordova/plugin/SetupPlugin;->mSharePreference:Lcom/belkin/wemo/cache/utils/SharePreferences;

    move-object/from16 v33, v0

    invoke-virtual/range {v33 .. v33}, Lcom/belkin/wemo/cache/utils/SharePreferences;->getSetupCredential()Ljava/lang/String;

    move-result-object v33

    const-string v34, "\\|"

    invoke-virtual/range {v33 .. v34}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v10

    .line 327
    .local v10, "connStrings":[Ljava/lang/String;
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/cordova/plugin/SetupPlugin;->mWifiUtil:Lcom/belkin/utils/WifiUtil;

    move-object/from16 v33, v0

    move-object/from16 v0, v33

    invoke-virtual {v0, v10}, Lcom/belkin/utils/WifiUtil;->connectWiFiNetwork([Ljava/lang/String;)Z

    move-result v33

    if-eqz v33, :cond_1d

    const-string v33, "true"

    :goto_5
    move-object/from16 v0, p3

    move-object/from16 v1, v33

    invoke-virtual {v0, v1}, Lorg/apache/cordova/CallbackContext;->success(Ljava/lang/String;)V

    .line 328
    const/16 v27, 0x1

    goto/16 :goto_1

    .line 327
    :cond_1d
    const-string v33, "false"

    goto :goto_5

    .line 329
    .end local v10    # "connStrings":[Ljava/lang/String;
    :cond_1e
    const-string v33, "setConfigStatus"

    move-object/from16 v0, p1

    move-object/from16 v1, v33

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v33

    if-eqz v33, :cond_1f

    .line 330
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/cordova/plugin/SetupPlugin;->mSharePreference:Lcom/belkin/wemo/cache/utils/SharePreferences;

    move-object/from16 v33, v0

    const/16 v34, 0x0

    move-object/from16 v0, p2

    move/from16 v1, v34

    invoke-virtual {v0, v1}, Lorg/json/JSONArray;->getBoolean(I)Z

    move-result v34

    invoke-virtual/range {v33 .. v34}, Lcom/belkin/wemo/cache/utils/SharePreferences;->saveConfigurationStatus(Z)V

    .line 331
    invoke-virtual/range {p3 .. p3}, Lorg/apache/cordova/CallbackContext;->success()V

    .line 332
    const/16 v27, 0x1

    goto/16 :goto_1

    .line 333
    :cond_1f
    const-string v33, "setDeviceImage"

    move-object/from16 v0, p1

    move-object/from16 v1, v33

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v33

    if-eqz v33, :cond_22

    .line 338
    :try_start_0
    const-string v33, "SetupPlugin"

    new-instance v34, Ljava/lang/StringBuilder;

    invoke-direct/range {v34 .. v34}, Ljava/lang/StringBuilder;-><init>()V

    const-string v35, "SET_DEVICE_IMAGE: "

    invoke-virtual/range {v34 .. v35}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v34

    const/16 v35, 0x0

    move-object/from16 v0, p2

    move/from16 v1, v35

    invoke-virtual {v0, v1}, Lorg/json/JSONArray;->getString(I)Ljava/lang/String;

    move-result-object v35

    invoke-static/range {v35 .. v35}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v35

    invoke-virtual/range {v34 .. v35}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v34

    invoke-virtual/range {v34 .. v34}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v34

    invoke-static/range {v33 .. v34}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 339
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/cordova/plugin/SetupPlugin;->mUpnpDeviceSetup:Lcom/belkin/cybergarage/wrapper/UpnpDeviceSetup;

    move-object/from16 v33, v0

    invoke-virtual/range {v33 .. v33}, Lcom/belkin/cybergarage/wrapper/UpnpDeviceSetup;->getIconUrl()Lorg/json/JSONObject;

    move-result-object v33

    const-string v34, "GetIconURL"

    invoke-virtual/range {v33 .. v34}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v20

    .line 340
    .local v20, "imgURL":Ljava/lang/String;
    const-string v33, ""

    move-object/from16 v0, v20

    move-object/from16 v1, v33

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v33

    if-nez v33, :cond_20

    if-nez v20, :cond_21

    .line 341
    :cond_20
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/cordova/plugin/SetupPlugin;->mUpnpDeviceSetup:Lcom/belkin/cybergarage/wrapper/UpnpDeviceSetup;

    move-object/from16 v33, v0

    invoke-virtual/range {v33 .. v33}, Lcom/belkin/cybergarage/wrapper/UpnpDeviceSetup;->getSetupDevice()Lorg/cybergarage/upnp/Device;

    move-result-object v33

    const-string v34, "icon.jpg"

    invoke-virtual/range {v33 .. v34}, Lorg/cybergarage/upnp/Device;->getAbsoluteURL(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v20

    .line 343
    :cond_21
    const-string v33, "SetupPlugin"

    new-instance v34, Ljava/lang/StringBuilder;

    invoke-direct/range {v34 .. v34}, Ljava/lang/StringBuilder;-><init>()V

    const-string v35, "UPLOAD IMAGE TO: "

    invoke-virtual/range {v34 .. v35}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v34

    move-object/from16 v0, v34

    move-object/from16 v1, v20

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v34

    const-string v35, " new"

    invoke-virtual/range {v34 .. v35}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v34

    invoke-virtual/range {v34 .. v34}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v34

    invoke-static/range {v33 .. v34}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 344
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/cordova/plugin/SetupPlugin;->mUpnpDeviceSetup:Lcom/belkin/cybergarage/wrapper/UpnpDeviceSetup;

    move-object/from16 v33, v0

    const/16 v34, 0x0

    move-object/from16 v0, p2

    move/from16 v1, v34

    invoke-virtual {v0, v1}, Lorg/json/JSONArray;->getString(I)Ljava/lang/String;

    move-result-object v34

    invoke-static/range {v34 .. v34}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v34

    move-object/from16 v0, v33

    move-object/from16 v1, v34

    move-object/from16 v2, v20

    invoke-virtual {v0, v1, v2}, Lcom/belkin/cybergarage/wrapper/UpnpDeviceSetup;->setIconUsingUri(Landroid/net/Uri;Ljava/lang/String;)V

    .line 345
    invoke-virtual/range {p3 .. p3}, Lorg/apache/cordova/CallbackContext;->success()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 351
    .end local v20    # "imgURL":Ljava/lang/String;
    :goto_6
    const/16 v27, 0x1

    goto/16 :goto_1

    .line 346
    :catch_0
    move-exception v14

    .line 347
    .local v14, "e":Ljava/lang/Exception;
    invoke-virtual {v14}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_6

    .line 352
    .end local v14    # "e":Ljava/lang/Exception;
    :cond_22
    const-string v33, "getDefaultRouterSSID"

    move-object/from16 v0, p1

    move-object/from16 v1, v33

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v33

    if-eqz v33, :cond_23

    .line 353
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/cordova/plugin/SetupPlugin;->mSharePreference:Lcom/belkin/wemo/cache/utils/SharePreferences;

    move-object/from16 v33, v0

    invoke-virtual/range {v33 .. v33}, Lcom/belkin/wemo/cache/utils/SharePreferences;->getSetupCredential()Ljava/lang/String;

    move-result-object v28

    .line 354
    .restart local v28    # "savedConfig":Ljava/lang/String;
    const-string v33, "\\|"

    move-object/from16 v0, v28

    move-object/from16 v1, v33

    invoke-virtual {v0, v1}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v9

    .line 355
    .local v9, "configArray":[Ljava/lang/String;
    const-string v33, "SetupPlugin"

    new-instance v34, Ljava/lang/StringBuilder;

    invoke-direct/range {v34 .. v34}, Ljava/lang/StringBuilder;-><init>()V

    const-string v35, "configArray[0]"

    invoke-virtual/range {v34 .. v35}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v34

    const/16 v35, 0x0

    aget-object v35, v9, v35

    invoke-virtual/range {v34 .. v35}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v34

    invoke-virtual/range {v34 .. v34}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v34

    invoke-static/range {v33 .. v34}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 356
    const/16 v33, 0x0

    aget-object v33, v9, v33

    move-object/from16 v0, p3

    move-object/from16 v1, v33

    invoke-virtual {v0, v1}, Lorg/apache/cordova/CallbackContext;->success(Ljava/lang/String;)V

    .line 357
    const/16 v27, 0x1

    goto/16 :goto_1

    .line 358
    .end local v9    # "configArray":[Ljava/lang/String;
    .end local v28    # "savedConfig":Ljava/lang/String;
    :cond_23
    const-string v33, "enableRemoteAccess"

    move-object/from16 v0, p1

    move-object/from16 v1, v33

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v33

    if-eqz v33, :cond_24

    .line 359
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/cordova/plugin/SetupPlugin;->cordova:Lorg/apache/cordova/CordovaInterface;

    move-object/from16 v33, v0

    invoke-interface/range {v33 .. v33}, Lorg/apache/cordova/CordovaInterface;->getThreadPool()Ljava/util/concurrent/ExecutorService;

    move-result-object v33

    new-instance v34, Lcom/belkin/cordova/plugin/SetupPlugin$4;

    move-object/from16 v0, v34

    move-object/from16 v1, p0

    move-object/from16 v2, p2

    move-object/from16 v3, p3

    invoke-direct {v0, v1, v2, v3}, Lcom/belkin/cordova/plugin/SetupPlugin$4;-><init>(Lcom/belkin/cordova/plugin/SetupPlugin;Lorg/json/JSONArray;Lorg/apache/cordova/CallbackContext;)V

    invoke-interface/range {v33 .. v34}, Ljava/util/concurrent/ExecutorService;->execute(Ljava/lang/Runnable;)V

    .line 405
    const/16 v27, 0x1

    goto/16 :goto_1

    .line 406
    :cond_24
    const-string v33, "startSetupListeners"

    move-object/from16 v0, p1

    move-object/from16 v1, v33

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v33

    if-eqz v33, :cond_25

    .line 407
    move-object/from16 v0, p0

    move-object/from16 v1, p3

    invoke-direct {v0, v1}, Lcom/belkin/cordova/plugin/SetupPlugin;->startSmartSetupListeners(Lorg/apache/cordova/CallbackContext;)Z

    move-result v27

    goto/16 :goto_1

    .line 408
    :cond_25
    const-string v33, "stopSetupListeners"

    move-object/from16 v0, p1

    move-object/from16 v1, v33

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v33

    if-eqz v33, :cond_26

    .line 409
    move-object/from16 v0, p0

    move-object/from16 v1, p3

    invoke-direct {v0, v1}, Lcom/belkin/cordova/plugin/SetupPlugin;->stopSmartSetupListeners(Lorg/apache/cordova/CallbackContext;)Z

    move-result v27

    goto/16 :goto_1

    .line 410
    :cond_26
    const-string v33, "startgetendListeners"

    move-object/from16 v0, p1

    move-object/from16 v1, v33

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v33

    if-eqz v33, :cond_27

    .line 411
    move-object/from16 v0, p0

    move-object/from16 v1, p3

    invoke-direct {v0, v1}, Lcom/belkin/cordova/plugin/SetupPlugin;->getendCallListener(Lorg/apache/cordova/CallbackContext;)Z

    move-result v27

    goto/16 :goto_1

    .line 412
    :cond_27
    const-string v33, "stopgetendListeners"

    move-object/from16 v0, p1

    move-object/from16 v1, v33

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v33

    if-eqz v33, :cond_28

    .line 413
    move-object/from16 v0, p0

    move-object/from16 v1, p3

    invoke-direct {v0, v1}, Lcom/belkin/cordova/plugin/SetupPlugin;->stopgetEndSetupListeners(Lorg/apache/cordova/CallbackContext;)Z

    move-result v27

    goto/16 :goto_1

    .line 414
    :cond_28
    const-string v33, "openNetwork"

    move-object/from16 v0, p1

    move-object/from16 v1, v33

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v33

    if-eqz v33, :cond_29

    .line 415
    const-string v33, "SetupPlugin"

    const-string v34, "ACTION_OPEN_NETWORK_SETUP"

    invoke-static/range {v33 .. v34}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 416
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/cordova/plugin/SetupPlugin;->mUpnpDeviceSetup:Lcom/belkin/cybergarage/wrapper/UpnpDeviceSetup;

    move-object/from16 v33, v0

    invoke-virtual/range {v33 .. v33}, Lcom/belkin/cybergarage/wrapper/UpnpDeviceSetup;->openBridgeNetwork()Lorg/json/JSONArray;

    move-result-object v33

    move-object/from16 v0, p3

    move-object/from16 v1, v33

    invoke-virtual {v0, v1}, Lorg/apache/cordova/CallbackContext;->success(Lorg/json/JSONArray;)V

    .line 417
    const/16 v27, 0x1

    goto/16 :goto_1

    .line 418
    :cond_29
    const-string v33, "getEndDevices"

    move-object/from16 v0, p1

    move-object/from16 v1, v33

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v33

    if-eqz v33, :cond_2a

    .line 419
    invoke-direct/range {p0 .. p0}, Lcom/belkin/cordova/plugin/SetupPlugin;->GetendThread()V

    .line 420
    new-instance v33, Lorg/apache/cordova/PluginResult;

    sget-object v34, Lorg/apache/cordova/PluginResult$Status;->OK:Lorg/apache/cordova/PluginResult$Status;

    invoke-direct/range {v33 .. v34}, Lorg/apache/cordova/PluginResult;-><init>(Lorg/apache/cordova/PluginResult$Status;)V

    move-object/from16 v0, v33

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/belkin/cordova/plugin/SetupPlugin;->mPluginResult:Lorg/apache/cordova/PluginResult;

    .line 421
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/cordova/plugin/SetupPlugin;->mPluginResult:Lorg/apache/cordova/PluginResult;

    move-object/from16 v33, v0

    const/16 v34, 0x0

    invoke-virtual/range {v33 .. v34}, Lorg/apache/cordova/PluginResult;->setKeepCallback(Z)V

    .line 422
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/cordova/plugin/SetupPlugin;->mPluginResult:Lorg/apache/cordova/PluginResult;

    move-object/from16 v33, v0

    move-object/from16 v0, p3

    move-object/from16 v1, v33

    invoke-virtual {v0, v1}, Lorg/apache/cordova/CallbackContext;->sendPluginResult(Lorg/apache/cordova/PluginResult;)V

    .line 423
    invoke-virtual/range {p3 .. p3}, Lorg/apache/cordova/CallbackContext;->success()V

    .line 424
    const/16 v27, 0x1

    goto/16 :goto_1

    .line 425
    :cond_2a
    const-string v33, "closeNetwork"

    move-object/from16 v0, p1

    move-object/from16 v1, v33

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v33

    if-eqz v33, :cond_2b

    .line 426
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/cordova/plugin/SetupPlugin;->mUpnpDeviceSetup:Lcom/belkin/cybergarage/wrapper/UpnpDeviceSetup;

    move-object/from16 v33, v0

    invoke-virtual/range {v33 .. v33}, Lcom/belkin/cybergarage/wrapper/UpnpDeviceSetup;->closeBridgeNetwork()Lorg/json/JSONObject;

    move-result-object v33

    move-object/from16 v0, p3

    move-object/from16 v1, v33

    invoke-virtual {v0, v1}, Lorg/apache/cordova/CallbackContext;->success(Lorg/json/JSONObject;)V

    .line 427
    const/16 v27, 0x1

    goto/16 :goto_1

    .line 428
    :cond_2b
    const-string v33, "addDevice"

    move-object/from16 v0, p1

    move-object/from16 v1, v33

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v33

    if-eqz v33, :cond_2c

    .line 429
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/cordova/plugin/SetupPlugin;->mUpnpDeviceSetup:Lcom/belkin/cybergarage/wrapper/UpnpDeviceSetup;

    move-object/from16 v33, v0

    move-object/from16 v0, v33

    move-object/from16 v1, p2

    invoke-virtual {v0, v1}, Lcom/belkin/cybergarage/wrapper/UpnpDeviceSetup;->addBridgeDevices(Lorg/json/JSONArray;)Lorg/json/JSONArray;

    move-result-object v33

    move-object/from16 v0, p3

    move-object/from16 v1, v33

    invoke-virtual {v0, v1}, Lorg/apache/cordova/CallbackContext;->success(Lorg/json/JSONArray;)V

    .line 430
    const/16 v27, 0x1

    goto/16 :goto_1

    .line 431
    :cond_2c
    const-string v33, "setledstatus"

    move-object/from16 v0, p1

    move-object/from16 v1, v33

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v33

    if-eqz v33, :cond_2d

    .line 432
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/cordova/plugin/SetupPlugin;->mUpnpDeviceSetup:Lcom/belkin/cybergarage/wrapper/UpnpDeviceSetup;

    move-object/from16 v33, v0

    const/16 v34, 0x0

    move-object/from16 v0, p2

    move/from16 v1, v34

    invoke-virtual {v0, v1}, Lorg/json/JSONArray;->getJSONArray(I)Lorg/json/JSONArray;

    move-result-object v34

    const/16 v35, 0x1

    move-object/from16 v0, p2

    move/from16 v1, v35

    invoke-virtual {v0, v1}, Lorg/json/JSONArray;->getJSONArray(I)Lorg/json/JSONArray;

    move-result-object v35

    invoke-virtual/range {v33 .. v35}, Lcom/belkin/cybergarage/wrapper/UpnpDeviceSetup;->setLedDeviceStatus(Lorg/json/JSONArray;Lorg/json/JSONArray;)Lorg/json/JSONArray;

    move-result-object v33

    move-object/from16 v0, p3

    move-object/from16 v1, v33

    invoke-virtual {v0, v1}, Lorg/apache/cordova/CallbackContext;->success(Lorg/json/JSONArray;)V

    .line 433
    const/16 v27, 0x1

    goto/16 :goto_1

    .line 435
    :cond_2d
    const-string v33, "setAttributes"

    move-object/from16 v0, p1

    move-object/from16 v1, v33

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v33

    if-eqz v33, :cond_2e

    .line 436
    const-string v33, "SetupPlugin"

    const-string v34, ":::::ACTION_SET_ATTRIBUTES::: "

    invoke-static/range {v33 .. v34}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 437
    const/16 v33, 0x0

    move-object/from16 v0, p2

    move/from16 v1, v33

    invoke-virtual {v0, v1}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v5

    .line 438
    .local v5, "attributeList":Lorg/json/JSONObject;
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/cordova/plugin/SetupPlugin;->mUpnpDeviceSetup:Lcom/belkin/cybergarage/wrapper/UpnpDeviceSetup;

    move-object/from16 v33, v0

    move-object/from16 v0, v33

    invoke-virtual {v0, v5}, Lcom/belkin/cybergarage/wrapper/UpnpDeviceSetup;->setAttribute(Lorg/json/JSONObject;)Z

    move-result v27

    .line 439
    .restart local v27    # "result":Z
    goto/16 :goto_1

    .line 441
    .end local v5    # "attributeList":Lorg/json/JSONObject;
    .end local v27    # "result":Z
    :cond_2e
    const-string v33, "getAttributes"

    move-object/from16 v0, p1

    move-object/from16 v1, v33

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v33

    if-eqz v33, :cond_2f

    .line 442
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/cordova/plugin/SetupPlugin;->mUpnpDeviceSetup:Lcom/belkin/cybergarage/wrapper/UpnpDeviceSetup;

    move-object/from16 v33, v0

    invoke-virtual/range {v33 .. v33}, Lcom/belkin/cybergarage/wrapper/UpnpDeviceSetup;->getAttribute()Lorg/json/JSONObject;

    move-result-object v25

    .line 443
    .local v25, "jsonobj":Lorg/json/JSONObject;
    move-object/from16 v0, p3

    move-object/from16 v1, v25

    invoke-virtual {v0, v1}, Lorg/apache/cordova/CallbackContext;->success(Lorg/json/JSONObject;)V

    .line 444
    const/16 v27, 0x1

    goto/16 :goto_1

    .line 446
    .end local v25    # "jsonobj":Lorg/json/JSONObject;
    :cond_2f
    const-string v33, "setCustomizedState"

    move-object/from16 v0, p1

    move-object/from16 v1, v33

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v33

    if-eqz v33, :cond_30

    .line 447
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/cordova/plugin/SetupPlugin;->mUpnpDeviceSetup:Lcom/belkin/cybergarage/wrapper/UpnpDeviceSetup;

    move-object/from16 v33, v0

    invoke-virtual/range {v33 .. v33}, Lcom/belkin/cybergarage/wrapper/UpnpDeviceSetup;->setCustomState()Lorg/json/JSONObject;

    move-result-object v25

    .line 448
    .restart local v25    # "jsonobj":Lorg/json/JSONObject;
    move-object/from16 v0, p3

    move-object/from16 v1, v25

    invoke-virtual {v0, v1}, Lorg/apache/cordova/CallbackContext;->success(Lorg/json/JSONObject;)V

    .line 449
    const/16 v27, 0x1

    goto/16 :goto_1

    .line 451
    .end local v25    # "jsonobj":Lorg/json/JSONObject;
    :cond_30
    const-string v33, "getCustomizedState"

    move-object/from16 v0, p1

    move-object/from16 v1, v33

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v33

    if-eqz v33, :cond_31

    .line 452
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/cordova/plugin/SetupPlugin;->mUpnpDeviceSetup:Lcom/belkin/cybergarage/wrapper/UpnpDeviceSetup;

    move-object/from16 v33, v0

    invoke-virtual/range {v33 .. v33}, Lcom/belkin/cybergarage/wrapper/UpnpDeviceSetup;->getCustomState()Lorg/json/JSONObject;

    move-result-object v25

    .line 453
    .restart local v25    # "jsonobj":Lorg/json/JSONObject;
    move-object/from16 v0, p3

    move-object/from16 v1, v25

    invoke-virtual {v0, v1}, Lorg/apache/cordova/CallbackContext;->success(Lorg/json/JSONObject;)V

    .line 454
    const/16 v27, 0x1

    goto/16 :goto_1

    .line 456
    .end local v25    # "jsonobj":Lorg/json/JSONObject;
    :cond_31
    const-string v33, "2051"

    move-object/from16 v0, p1

    move-object/from16 v1, v33

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v33

    if-eqz v33, :cond_32

    .line 458
    const-string v33, "SetupPlugin"

    const-string v34, "ACTION_SAVE_REMOTE_REGISTRATION"

    invoke-static/range {v33 .. v34}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 459
    move-object/from16 v0, p0

    move-object/from16 v1, p2

    invoke-virtual {v0, v1}, Lcom/belkin/cordova/plugin/SetupPlugin;->saveRemoteRegistrationData(Lorg/json/JSONArray;)V

    .line 460
    invoke-virtual/range {p3 .. p3}, Lorg/apache/cordova/CallbackContext;->success()V

    .line 461
    const/16 v27, 0x1

    goto/16 :goto_1

    .line 462
    :cond_32
    const-string v33, "CheckAutoNetworkSwitch"

    move-object/from16 v0, p1

    move-object/from16 v1, v33

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v33

    if-eqz v33, :cond_33

    .line 464
    const-string v33, "SetupPlugin"

    const-string v34, "ACTION CheckAutoNetworkSwitch"

    invoke-static/range {v33 .. v34}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 466
    new-instance v24, Lorg/json/JSONObject;

    invoke-direct/range {v24 .. v24}, Lorg/json/JSONObject;-><init>()V

    .line 467
    .local v24, "jsonObj":Lorg/json/JSONObject;
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/cordova/plugin/SetupPlugin;->mContext:Landroid/content/Context;

    move-object/from16 v33, v0

    move-object/from16 v0, p0

    move-object/from16 v1, v33

    invoke-virtual {v0, v1}, Lcom/belkin/cordova/plugin/SetupPlugin;->isPoorNetworkAvoidanceEnabled(Landroid/content/Context;)Z

    move-result v21

    .line 468
    .local v21, "isPoorNetworkAvoidanceEnabled":Z
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/cordova/plugin/SetupPlugin;->mContext:Landroid/content/Context;

    move-object/from16 v33, v0

    move-object/from16 v0, p0

    move-object/from16 v1, v33

    invoke-virtual {v0, v1}, Lcom/belkin/cordova/plugin/SetupPlugin;->isScanningAlwaysAvailableEnabled(Landroid/content/Context;)Z

    move-result v22

    .line 469
    .local v22, "isScanningAlwaysAvailableEnabled":Z
    const-string v33, "SetupPlugin"

    new-instance v34, Ljava/lang/StringBuilder;

    invoke-direct/range {v34 .. v34}, Ljava/lang/StringBuilder;-><init>()V

    const-string v35, "isPoorNetworkAvoidanceEnabled:"

    invoke-virtual/range {v34 .. v35}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v34

    move-object/from16 v0, v34

    move/from16 v1, v21

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v34

    const-string v35, " "

    invoke-virtual/range {v34 .. v35}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v34

    const-string v35, "isScanningAlwaysAvailableEnabled:"

    invoke-virtual/range {v34 .. v35}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v34

    move-object/from16 v0, v34

    move/from16 v1, v22

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v34

    invoke-virtual/range {v34 .. v34}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v34

    invoke-static/range {v33 .. v34}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 471
    const-string v33, "isScanningAlwaysAvailableEnabled"

    move-object/from16 v0, v24

    move-object/from16 v1, v33

    move/from16 v2, v22

    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Z)Lorg/json/JSONObject;

    .line 472
    const-string v33, "isPoorNetworkAvoidanceEnabled"

    move-object/from16 v0, v24

    move-object/from16 v1, v33

    move/from16 v2, v21

    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Z)Lorg/json/JSONObject;

    .line 474
    move-object/from16 v0, p3

    move-object/from16 v1, v24

    invoke-virtual {v0, v1}, Lorg/apache/cordova/CallbackContext;->success(Lorg/json/JSONObject;)V

    .line 475
    const/16 v27, 0x1

    goto/16 :goto_1

    .line 476
    .end local v21    # "isPoorNetworkAvoidanceEnabled":Z
    .end local v22    # "isScanningAlwaysAvailableEnabled":Z
    .end local v24    # "jsonObj":Lorg/json/JSONObject;
    :cond_33
    const-string v33, "updateZigbeeInCacheDB"

    move-object/from16 v0, p1

    move-object/from16 v1, v33

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v33

    if-eqz v33, :cond_34

    .line 478
    const-string v33, "SetupPlugin"

    const-string v34, "ACTION_UPDATE_ZIGBEE_IN_CACHEDB"

    invoke-static/range {v33 .. v34}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 479
    const-string v33, "SetupPlugin"

    new-instance v34, Ljava/lang/StringBuilder;

    invoke-direct/range {v34 .. v34}, Ljava/lang/StringBuilder;-><init>()V

    const-string v35, "inParamArray:"

    invoke-virtual/range {v34 .. v35}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v34

    move-object/from16 v0, v34

    move-object/from16 v1, p2

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v34

    invoke-virtual/range {v34 .. v34}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v34

    invoke-static/range {v33 .. v34}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 480
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/cordova/plugin/SetupPlugin;->mContext:Landroid/content/Context;

    move-object/from16 v33, v0

    invoke-static/range {v33 .. v33}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->getInstance(Landroid/content/Context;)Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    move-result-object v33

    const/16 v34, 0x0

    move-object/from16 v0, p2

    move/from16 v1, v34

    invoke-virtual {v0, v1}, Lorg/json/JSONArray;->get(I)Ljava/lang/Object;

    move-result-object v34

    invoke-virtual/range {v34 .. v34}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v34

    invoke-virtual/range {v33 .. v34}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->initiateScanZigBeeDevice(Ljava/lang/String;)V

    .line 481
    new-instance v24, Lorg/json/JSONObject;

    invoke-direct/range {v24 .. v24}, Lorg/json/JSONObject;-><init>()V

    .line 482
    .restart local v24    # "jsonObj":Lorg/json/JSONObject;
    const-string v33, "success"

    const/16 v34, 0x1

    move-object/from16 v0, v24

    move-object/from16 v1, v33

    move/from16 v2, v34

    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Z)Lorg/json/JSONObject;

    move-result-object v33

    move-object/from16 v0, p3

    move-object/from16 v1, v33

    invoke-virtual {v0, v1}, Lorg/apache/cordova/CallbackContext;->success(Lorg/json/JSONObject;)V

    .line 483
    const/16 v27, 0x1

    goto/16 :goto_1

    .line 484
    .end local v24    # "jsonObj":Lorg/json/JSONObject;
    :cond_34
    const-string v33, "initControlPoint"

    move-object/from16 v0, p1

    move-object/from16 v1, v33

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v33

    if-eqz v33, :cond_37

    .line 485
    const-string v33, "SetupPlugin"

    const-string v34, "ACTION_INIT_CONTROL_POINT"

    invoke-static/range {v33 .. v34}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 486
    sget-object v12, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->devListManager:Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    .line 487
    .local v12, "devMgr":Lcom/belkin/wemo/cache/devicelist/DeviceListManager;
    if-nez v12, :cond_35

    .line 488
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/cordova/plugin/SetupPlugin;->mContext:Landroid/content/Context;

    move-object/from16 v33, v0

    invoke-static/range {v33 .. v33}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->getInstance(Landroid/content/Context;)Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    move-result-object v12

    .line 490
    :cond_35
    if-eqz v12, :cond_36

    .line 491
    invoke-virtual {v12}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->initControlPoint()V

    .line 493
    :cond_36
    invoke-virtual/range {p3 .. p3}, Lorg/apache/cordova/CallbackContext;->success()V

    .line 494
    const/16 v27, 0x1

    goto/16 :goto_1

    .line 495
    .end local v12    # "devMgr":Lcom/belkin/wemo/cache/devicelist/DeviceListManager;
    :cond_37
    const-string v33, "setBinaryStateInSetup"

    move-object/from16 v0, p1

    move-object/from16 v1, v33

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v33

    if-eqz v33, :cond_2

    .line 496
    const/16 v23, 0x0

    .line 497
    .local v23, "isSuccess":Z
    if-eqz p2, :cond_3c

    invoke-virtual/range {p2 .. p2}, Lorg/json/JSONArray;->length()I

    move-result v33

    if-lez v33, :cond_3c

    .line 498
    const/16 v33, 0x0

    move-object/from16 v0, p2

    move/from16 v1, v33

    invoke-virtual {v0, v1}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v7

    .line 499
    .local v7, "binaryStateParams":Lorg/json/JSONObject;
    if-eqz v7, :cond_3b

    .line 500
    const-string v33, "udn"

    move-object/from16 v0, v33

    invoke-virtual {v7, v0}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v31

    .line 501
    .local v31, "udn":Ljava/lang/String;
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/cordova/plugin/SetupPlugin;->mDeviceListManager:Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    move-object/from16 v33, v0

    invoke-virtual/range {v33 .. v33}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->getUpnpControl()Lorg/cybergarage/upnp/ControlPoint;

    move-result-object v33

    move-object/from16 v0, v33

    move-object/from16 v1, v31

    invoke-virtual {v0, v1}, Lorg/cybergarage/upnp/ControlPoint;->getDevice(Ljava/lang/String;)Lorg/cybergarage/upnp/Device;

    move-result-object v13

    .line 502
    .local v13, "device":Lorg/cybergarage/upnp/Device;
    if-eqz v13, :cond_3a

    .line 503
    const-string v33, "SetBinaryState"

    move-object/from16 v0, v33

    invoke-virtual {v13, v0}, Lorg/cybergarage/upnp/Device;->getAction(Ljava/lang/String;)Lorg/cybergarage/upnp/Action;

    move-result-object v6

    .line 504
    .local v6, "binaryStateAction":Lorg/cybergarage/upnp/Action;
    if-eqz v6, :cond_39

    .line 505
    const-string v33, "state"

    move-object/from16 v0, v33

    invoke-virtual {v7, v0}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v30

    .line 506
    .local v30, "state":Ljava/lang/String;
    const-string v33, "brightness"

    move-object/from16 v0, v33

    invoke-virtual {v7, v0}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    .line 507
    .local v8, "brightness":Ljava/lang/String;
    const-string v33, "fader"

    move-object/from16 v0, v33

    invoke-virtual {v7, v0}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v15

    .line 509
    .local v15, "fader":Ljava/lang/String;
    const-string v33, "brightness"

    move-object/from16 v0, v33

    invoke-virtual {v6, v0, v8}, Lorg/cybergarage/upnp/Action;->setArgumentValue(Ljava/lang/String;Ljava/lang/String;)V

    .line 510
    const-string v33, "fader"

    move-object/from16 v0, v33

    invoke-virtual {v6, v0, v15}, Lorg/cybergarage/upnp/Action;->setArgumentValue(Ljava/lang/String;Ljava/lang/String;)V

    .line 511
    sget-object v33, Lcom/belkin/wemo/cache/devicelist/UpnpConstants;->SET_BINARY_STATE_ARGS:[Ljava/lang/String;

    const/16 v34, 0x0

    aget-object v33, v33, v34

    move-object/from16 v0, v33

    move-object/from16 v1, v30

    invoke-virtual {v6, v0, v1}, Lorg/cybergarage/upnp/Action;->setArgumentValue(Ljava/lang/String;Ljava/lang/String;)V

    .line 513
    invoke-virtual {v6}, Lorg/cybergarage/upnp/Action;->postControlAction()Ljava/lang/String;

    move-result-object v4

    .line 514
    .local v4, "actionResult":Ljava/lang/String;
    const-string v33, "SetupPlugin"

    new-instance v34, Ljava/lang/StringBuilder;

    invoke-direct/range {v34 .. v34}, Ljava/lang/StringBuilder;-><init>()V

    const-string v35, "SETUP: SetBinaryState action response: "

    invoke-virtual/range {v34 .. v35}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v34

    move-object/from16 v0, v34

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v34

    invoke-virtual/range {v34 .. v34}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v34

    invoke-static/range {v33 .. v34}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 516
    invoke-static {v4}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v33

    if-nez v33, :cond_38

    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    move-result-object v33

    move-object/from16 v0, v33

    invoke-virtual {v4, v0}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v33

    const-string v34, "upnperror"

    invoke-virtual/range {v33 .. v34}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v33

    if-nez v33, :cond_38

    .line 517
    const/16 v23, 0x1

    .line 531
    .end local v4    # "actionResult":Ljava/lang/String;
    .end local v6    # "binaryStateAction":Lorg/cybergarage/upnp/Action;
    .end local v7    # "binaryStateParams":Lorg/json/JSONObject;
    .end local v8    # "brightness":Ljava/lang/String;
    .end local v13    # "device":Lorg/cybergarage/upnp/Device;
    .end local v15    # "fader":Ljava/lang/String;
    .end local v30    # "state":Ljava/lang/String;
    .end local v31    # "udn":Ljava/lang/String;
    :cond_38
    :goto_7
    const/16 v29, 0x0

    .line 532
    .local v29, "setBinaryStatePR":Lorg/apache/cordova/PluginResult;
    if-eqz v23, :cond_3d

    .line 533
    new-instance v29, Lorg/apache/cordova/PluginResult;

    .end local v29    # "setBinaryStatePR":Lorg/apache/cordova/PluginResult;
    sget-object v33, Lorg/apache/cordova/PluginResult$Status;->OK:Lorg/apache/cordova/PluginResult$Status;

    move-object/from16 v0, v29

    move-object/from16 v1, v33

    invoke-direct {v0, v1}, Lorg/apache/cordova/PluginResult;-><init>(Lorg/apache/cordova/PluginResult$Status;)V

    .line 537
    .restart local v29    # "setBinaryStatePR":Lorg/apache/cordova/PluginResult;
    :goto_8
    move-object/from16 v0, p3

    move-object/from16 v1, v29

    invoke-virtual {v0, v1}, Lorg/apache/cordova/CallbackContext;->sendPluginResult(Lorg/apache/cordova/PluginResult;)V

    .line 538
    const/16 v27, 0x1

    goto/16 :goto_1

    .line 520
    .end local v29    # "setBinaryStatePR":Lorg/apache/cordova/PluginResult;
    .restart local v6    # "binaryStateAction":Lorg/cybergarage/upnp/Action;
    .restart local v7    # "binaryStateParams":Lorg/json/JSONObject;
    .restart local v13    # "device":Lorg/cybergarage/upnp/Device;
    .restart local v31    # "udn":Ljava/lang/String;
    :cond_39
    const-string v33, "SetupPlugin"

    new-instance v34, Ljava/lang/StringBuilder;

    invoke-direct/range {v34 .. v34}, Ljava/lang/StringBuilder;-><init>()V

    const-string v35, "SETUP: SetBinaryState Action is NULL for udn: "

    invoke-virtual/range {v34 .. v35}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v34

    move-object/from16 v0, v34

    move-object/from16 v1, v31

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v34

    invoke-virtual/range {v34 .. v34}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v34

    invoke-static/range {v33 .. v34}, Lcom/belkin/utils/LogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_7

    .line 523
    .end local v6    # "binaryStateAction":Lorg/cybergarage/upnp/Action;
    :cond_3a
    const-string v33, "SetupPlugin"

    new-instance v34, Ljava/lang/StringBuilder;

    invoke-direct/range {v34 .. v34}, Ljava/lang/StringBuilder;-><init>()V

    const-string v35, "SETUP: SetBinaryState: Control Point device is NULL for udn: "

    invoke-virtual/range {v34 .. v35}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v34

    move-object/from16 v0, v34

    move-object/from16 v1, v31

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v34

    invoke-virtual/range {v34 .. v34}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v34

    invoke-static/range {v33 .. v34}, Lcom/belkin/utils/LogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_7

    .line 526
    .end local v13    # "device":Lorg/cybergarage/upnp/Device;
    .end local v31    # "udn":Ljava/lang/String;
    :cond_3b
    const-string v33, "SetupPlugin"

    const-string v34, "SETUP: SetBinaryState: JSONObject containing params is NULL"

    invoke-static/range {v33 .. v34}, Lcom/belkin/utils/LogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_7

    .line 529
    .end local v7    # "binaryStateParams":Lorg/json/JSONObject;
    :cond_3c
    const-string v33, "SetupPlugin"

    const-string v34, "SETUP: SetBinaryState: Input Param array is NULL"

    invoke-static/range {v33 .. v34}, Lcom/belkin/utils/LogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_7

    .line 535
    .restart local v29    # "setBinaryStatePR":Lorg/apache/cordova/PluginResult;
    :cond_3d
    new-instance v29, Lorg/apache/cordova/PluginResult;

    .end local v29    # "setBinaryStatePR":Lorg/apache/cordova/PluginResult;
    sget-object v33, Lorg/apache/cordova/PluginResult$Status;->ERROR:Lorg/apache/cordova/PluginResult$Status;

    move-object/from16 v0, v29

    move-object/from16 v1, v33

    invoke-direct {v0, v1}, Lorg/apache/cordova/PluginResult;-><init>(Lorg/apache/cordova/PluginResult$Status;)V

    .restart local v29    # "setBinaryStatePR":Lorg/apache/cordova/PluginResult;
    goto :goto_8
.end method

.method public initialize(Lorg/apache/cordova/CordovaInterface;Lorg/apache/cordova/CordovaWebView;)V
    .locals 2
    .param p1, "cordova"    # Lorg/apache/cordova/CordovaInterface;
    .param p2, "webView"    # Lorg/apache/cordova/CordovaWebView;

    .prologue
    .line 78
    const-string v0, "SetupPlugin"

    const-string v1, "SetupPlugin initialize"

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 79
    invoke-super {p0, p1, p2}, Lorg/apache/cordova/CordovaPlugin;->initialize(Lorg/apache/cordova/CordovaInterface;Lorg/apache/cordova/CordovaWebView;)V

    .line 80
    invoke-interface {p1}, Lorg/apache/cordova/CordovaInterface;->getActivity()Landroid/app/Activity;

    move-result-object v0

    iput-object v0, p0, Lcom/belkin/cordova/plugin/SetupPlugin;->mContext:Landroid/content/Context;

    .line 84
    iget-object v0, p0, Lcom/belkin/cordova/plugin/SetupPlugin;->mContext:Landroid/content/Context;

    invoke-static {v0}, Lcom/belkin/wemo/localsdk/WeMoSDKContext;->getInstance(Landroid/content/Context;)Lcom/belkin/wemo/localsdk/WeMoSDKContext;

    move-result-object v0

    sput-object v0, Lcom/belkin/cordova/plugin/DevicePlugin;->mWeMoSDKContext:Lcom/belkin/wemo/localsdk/WeMoSDKContext;

    .line 86
    iget-object v0, p0, Lcom/belkin/cordova/plugin/SetupPlugin;->mContext:Landroid/content/Context;

    invoke-static {v0}, Lcom/belkin/cybergarage/wrapper/UpnpDeviceSetup;->getInstance(Landroid/content/Context;)Lcom/belkin/cybergarage/wrapper/UpnpDeviceSetup;

    move-result-object v0

    iput-object v0, p0, Lcom/belkin/cordova/plugin/SetupPlugin;->mUpnpDeviceSetup:Lcom/belkin/cybergarage/wrapper/UpnpDeviceSetup;

    .line 87
    new-instance v0, Lcom/belkin/utils/WiFiSecurityUtil;

    invoke-direct {v0}, Lcom/belkin/utils/WiFiSecurityUtil;-><init>()V

    iput-object v0, p0, Lcom/belkin/cordova/plugin/SetupPlugin;->mWiFiSecurityUtil:Lcom/belkin/utils/WiFiSecurityUtil;

    .line 88
    new-instance v0, Lcom/belkin/wemo/cache/utils/SharePreferences;

    iget-object v1, p0, Lcom/belkin/cordova/plugin/SetupPlugin;->mContext:Landroid/content/Context;

    invoke-direct {v0, v1}, Lcom/belkin/wemo/cache/utils/SharePreferences;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/belkin/cordova/plugin/SetupPlugin;->mSharePreference:Lcom/belkin/wemo/cache/utils/SharePreferences;

    .line 89
    new-instance v0, Lcom/belkin/utils/WifiUtil;

    iget-object v1, p0, Lcom/belkin/cordova/plugin/SetupPlugin;->mContext:Landroid/content/Context;

    invoke-direct {v0, v1}, Lcom/belkin/utils/WifiUtil;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/belkin/cordova/plugin/SetupPlugin;->mWifiUtil:Lcom/belkin/utils/WifiUtil;

    .line 90
    new-instance v0, Lcom/belkin/wemo/cache/utils/SDKNetworkUtils;

    iget-object v1, p0, Lcom/belkin/cordova/plugin/SetupPlugin;->mContext:Landroid/content/Context;

    invoke-direct {v0, v1}, Lcom/belkin/wemo/cache/utils/SDKNetworkUtils;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/belkin/cordova/plugin/SetupPlugin;->mNetworkUtil:Lcom/belkin/wemo/cache/utils/SDKNetworkUtils;

    .line 91
    iget-object v0, p0, Lcom/belkin/cordova/plugin/SetupPlugin;->mContext:Landroid/content/Context;

    invoke-static {v0}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->getInstance(Landroid/content/Context;)Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    move-result-object v0

    iput-object v0, p0, Lcom/belkin/cordova/plugin/SetupPlugin;->mDeviceListManager:Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    .line 92
    return-void
.end method

.method public isPoorNetworkAvoidanceEnabled(Landroid/content/Context;)Z
    .locals 12
    .param p1, "ctx"    # Landroid/content/Context;
    .annotation build Landroid/annotation/TargetApi;
        value = 0x11
    .end annotation

    .prologue
    .line 984
    const/4 v3, -0x1

    .line 985
    .local v3, "SETTING_UNKNOWN":I
    const/4 v2, 0x1

    .line 986
    .local v2, "SETTING_ENABLED":I
    const-string v0, "wifi_watchdog_poor_network_test_enabled"

    .line 987
    .local v0, "AVOID_POOR":Ljava/lang/String;
    const-string v4, "android.net.wifi.WifiWatchdogStateMachine"

    .line 988
    .local v4, "WATCHDOG_CLASS":Ljava/lang/String;
    const-string v1, "DEFAULT_POOR_NETWORK_AVOIDANCE_ENABLED"

    .line 989
    .local v1, "DEFAULT_ENABLED":Ljava/lang/String;
    invoke-virtual {p1}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v5

    .line 993
    .local v5, "cr":Landroid/content/ContentResolver;
    sget v10, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v11, 0x11

    if-lt v10, v11, :cond_0

    .line 995
    const-string v10, "wifi_watchdog_poor_network_test_enabled"

    const/4 v11, -0x1

    invoke-static {v5, v10, v11}, Landroid/provider/Settings$Global;->getInt(Landroid/content/ContentResolver;Ljava/lang/String;I)I

    move-result v8

    .line 1007
    .local v8, "result":I
    :goto_0
    const/4 v10, -0x1

    if-eq v8, v10, :cond_3

    .line 1008
    const/4 v10, 0x1

    if-ne v8, v10, :cond_2

    const/4 v10, 0x1

    .line 1035
    .end local v8    # "result":I
    :goto_1
    return v10

    .line 997
    :cond_0
    sget v10, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v11, 0xf

    if-lt v10, v11, :cond_1

    .line 998
    const-string v10, "wifi_watchdog_poor_network_test_enabled"

    const/4 v11, -0x1

    invoke-static {v5, v10, v11}, Landroid/provider/Settings$Secure;->getInt(Landroid/content/ContentResolver;Ljava/lang/String;I)I

    move-result v8

    .restart local v8    # "result":I
    goto :goto_0

    .line 1003
    .end local v8    # "result":I
    :cond_1
    const/4 v10, 0x0

    goto :goto_1

    .line 1008
    .restart local v8    # "result":I
    :cond_2
    const/4 v10, 0x0

    goto :goto_1

    .line 1013
    :cond_3
    sget v10, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v11, 0x11

    if-lt v10, v11, :cond_5

    .line 1019
    :try_start_0
    const-string v10, "android.net.wifi.WifiWatchdogStateMachine"

    invoke-static {v10}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v9

    .line 1020
    .local v9, "wifiWatchdog":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    const-string v10, "DEFAULT_POOR_NETWORK_AVOIDANCE_ENABLED"

    invoke-virtual {v9, v10}, Ljava/lang/Class;->getField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v6

    .line 1021
    .local v6, "defValue":Ljava/lang/reflect/Field;
    invoke-virtual {v6}, Ljava/lang/reflect/Field;->isAccessible()Z

    move-result v10

    if-nez v10, :cond_4

    const/4 v10, 0x1

    invoke-virtual {v6, v10}, Ljava/lang/reflect/Field;->setAccessible(Z)V

    .line 1022
    :cond_4
    const/4 v10, 0x0

    invoke-virtual {v6, v10}, Ljava/lang/reflect/Field;->getBoolean(Ljava/lang/Object;)Z
    :try_end_0
    .catch Ljava/lang/IllegalAccessException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/NoSuchFieldException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/ClassNotFoundException; {:try_start_0 .. :try_end_0} :catch_2
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_0} :catch_3

    move-result v10

    goto :goto_1

    .line 1023
    .end local v6    # "defValue":Ljava/lang/reflect/Field;
    .end local v9    # "wifiWatchdog":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    :catch_0
    move-exception v7

    .line 1024
    .local v7, "ex":Ljava/lang/IllegalAccessException;
    const/4 v10, 0x0

    goto :goto_1

    .line 1025
    .end local v7    # "ex":Ljava/lang/IllegalAccessException;
    :catch_1
    move-exception v7

    .line 1026
    .local v7, "ex":Ljava/lang/NoSuchFieldException;
    const/4 v10, 0x0

    goto :goto_1

    .line 1027
    .end local v7    # "ex":Ljava/lang/NoSuchFieldException;
    :catch_2
    move-exception v7

    .line 1028
    .local v7, "ex":Ljava/lang/ClassNotFoundException;
    const/4 v10, 0x0

    goto :goto_1

    .line 1029
    .end local v7    # "ex":Ljava/lang/ClassNotFoundException;
    :catch_3
    move-exception v7

    .line 1030
    .local v7, "ex":Ljava/lang/IllegalArgumentException;
    const/4 v10, 0x0

    goto :goto_1

    .line 1035
    .end local v7    # "ex":Ljava/lang/IllegalArgumentException;
    :cond_5
    const/4 v10, 0x1

    goto :goto_1
.end method

.method public isScanningAlwaysAvailableEnabled(Landroid/content/Context;)Z
    .locals 4
    .param p1, "context"    # Landroid/content/Context;
    .annotation build Landroid/annotation/TargetApi;
        value = 0x12
    .end annotation

    .prologue
    .line 1046
    :try_start_0
    sget v2, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v3, 0x12

    if-lt v2, v3, :cond_0

    .line 1047
    const-string v2, "wifi"

    invoke-virtual {p1, v2}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/net/wifi/WifiManager;

    .line 1048
    .local v1, "wifiMgr":Landroid/net/wifi/WifiManager;
    invoke-virtual {v1}, Landroid/net/wifi/WifiManager;->isScanAlwaysAvailable()Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result v2

    if-eqz v2, :cond_0

    .line 1049
    const/4 v2, 0x1

    .line 1057
    .end local v1    # "wifiMgr":Landroid/net/wifi/WifiManager;
    :goto_0
    return v2

    .line 1052
    :catch_0
    move-exception v0

    .line 1054
    .local v0, "e":Ljava/lang/Exception;
    const-string v2, "SetupPlugin"

    invoke-virtual {v0}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/belkin/utils/LogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 1057
    .end local v0    # "e":Ljava/lang/Exception;
    :cond_0
    const/4 v2, 0x0

    goto :goto_0
.end method

.method protected saveRemoteRegistrationData(Lorg/json/JSONArray;)V
    .locals 12
    .param p1, "inParamArray"    # Lorg/json/JSONArray;

    .prologue
    .line 907
    :try_start_0
    const-string v4, ""

    .line 908
    .local v4, "homeSSID":Ljava/lang/String;
    const/4 v8, 0x1

    .line 909
    .local v8, "setupFallbackRouterSame":Z
    iget-object v9, p0, Lcom/belkin/cordova/plugin/SetupPlugin;->mSharePreference:Lcom/belkin/wemo/cache/utils/SharePreferences;

    invoke-virtual {v9}, Lcom/belkin/wemo/cache/utils/SharePreferences;->getSetupCredential()Ljava/lang/String;

    move-result-object v7

    .line 910
    .local v7, "savedConfig":Ljava/lang/String;
    if-eqz v7, :cond_3

    .line 911
    const-string v9, "\\|"

    invoke-virtual {v7, v9}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v1

    .line 912
    .local v1, "configArray":[Ljava/lang/String;
    const/4 v9, 0x0

    aget-object v4, v1, v9

    .line 913
    iget-object v9, p0, Lcom/belkin/cordova/plugin/SetupPlugin;->mNetworkUtil:Lcom/belkin/wemo/cache/utils/SDKNetworkUtils;

    invoke-virtual {v9}, Lcom/belkin/wemo/cache/utils/SDKNetworkUtils;->getSSID()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v4, v9}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v9

    if-nez v9, :cond_0

    .line 915
    const/4 v8, 0x0

    .line 919
    .end local v1    # "configArray":[Ljava/lang/String;
    :cond_0
    :goto_0
    iget-object v9, p0, Lcom/belkin/cordova/plugin/SetupPlugin;->mSharePreference:Lcom/belkin/wemo/cache/utils/SharePreferences;

    const/4 v10, 0x0

    invoke-virtual {v9, v10}, Lcom/belkin/wemo/cache/utils/SharePreferences;->setRemoteAutoEnableNeeded(Z)V

    .line 920
    const/4 v9, 0x3

    invoke-virtual {p1, v9}, Lorg/json/JSONArray;->getString(I)Ljava/lang/String;

    move-result-object v6

    .line 921
    .local v6, "privateKey":Ljava/lang/String;
    const-string v9, "NOKEY"

    invoke-virtual {v6, v9}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v9

    if-nez v9, :cond_1

    .line 922
    iget-object v9, p0, Lcom/belkin/cordova/plugin/SetupPlugin;->mSharePreference:Lcom/belkin/wemo/cache/utils/SharePreferences;

    invoke-virtual {v9, v6}, Lcom/belkin/wemo/cache/utils/SharePreferences;->storePrivateKey(Ljava/lang/String;)V

    .line 925
    :cond_1
    iget-object v9, p0, Lcom/belkin/cordova/plugin/SetupPlugin;->mSharePreference:Lcom/belkin/wemo/cache/utils/SharePreferences;

    const/4 v10, 0x2

    invoke-virtual {p1, v10}, Lorg/json/JSONArray;->getString(I)Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v9, v10}, Lcom/belkin/wemo/cache/utils/SharePreferences;->storeHomeId(Ljava/lang/String;)V

    .line 926
    new-instance v5, Ljava/util/HashSet;

    invoke-direct {v5}, Ljava/util/HashSet;-><init>()V

    .line 927
    .local v5, "homeSSIDs":Ljava/util/HashSet;, "Ljava/util/HashSet<Ljava/lang/String;>;"
    invoke-virtual {v5, v4}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    .line 928
    iget-object v9, p0, Lcom/belkin/cordova/plugin/SetupPlugin;->mSharePreference:Lcom/belkin/wemo/cache/utils/SharePreferences;

    invoke-virtual {v9, v5}, Lcom/belkin/wemo/cache/utils/SharePreferences;->setHomeSSIDs(Ljava/util/Set;)Z

    .line 929
    iget-object v9, p0, Lcom/belkin/cordova/plugin/SetupPlugin;->mSharePreference:Lcom/belkin/wemo/cache/utils/SharePreferences;

    invoke-virtual {v9, v4}, Lcom/belkin/wemo/cache/utils/SharePreferences;->setRemoteAccessSSID(Ljava/lang/String;)Z

    .line 930
    if-eqz v8, :cond_2

    .line 932
    iget-object v9, p0, Lcom/belkin/cordova/plugin/SetupPlugin;->mNetworkUtil:Lcom/belkin/wemo/cache/utils/SDKNetworkUtils;

    invoke-virtual {v9}, Lcom/belkin/wemo/cache/utils/SDKNetworkUtils;->getArpMac()Ljava/lang/String;

    move-result-object v2

    .line 933
    .local v2, "currentArpMac":Ljava/lang/String;
    if-eqz v2, :cond_2

    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v9

    if-lez v9, :cond_2

    .line 935
    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    .line 936
    .local v0, "arpMacs":Ljava/util/HashSet;, "Ljava/util/HashSet<Ljava/lang/String;>;"
    invoke-virtual {v0, v2}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    .line 937
    iget-object v9, p0, Lcom/belkin/cordova/plugin/SetupPlugin;->mSharePreference:Lcom/belkin/wemo/cache/utils/SharePreferences;

    invoke-virtual {v9, v0}, Lcom/belkin/wemo/cache/utils/SharePreferences;->setARPMacs(Ljava/util/Set;)Z

    .line 940
    .end local v0    # "arpMacs":Ljava/util/HashSet;, "Ljava/util/HashSet<Ljava/lang/String;>;"
    .end local v2    # "currentArpMac":Ljava/lang/String;
    :cond_2
    iget-object v9, p0, Lcom/belkin/cordova/plugin/SetupPlugin;->mSharePreference:Lcom/belkin/wemo/cache/utils/SharePreferences;

    const/4 v10, 0x1

    invoke-virtual {v9, v10}, Lcom/belkin/wemo/cache/utils/SharePreferences;->setRemoteEnabled(Z)Z

    .line 941
    const-string v9, "SetupPlugin"

    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    const-string v11, "saveRemoteRegistrationData: HomeId: "

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    iget-object v11, p0, Lcom/belkin/cordova/plugin/SetupPlugin;->mSharePreference:Lcom/belkin/wemo/cache/utils/SharePreferences;

    invoke-virtual {v11}, Lcom/belkin/wemo/cache/utils/SharePreferences;->getHomeId()Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    const-string v11, " PrivateKey: "

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    iget-object v11, p0, Lcom/belkin/cordova/plugin/SetupPlugin;->mSharePreference:Lcom/belkin/wemo/cache/utils/SharePreferences;

    invoke-virtual {v11}, Lcom/belkin/wemo/cache/utils/SharePreferences;->getPrivateKey()Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    const-string v11, " HomeSSID: "

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    iget-object v11, p0, Lcom/belkin/cordova/plugin/SetupPlugin;->mSharePreference:Lcom/belkin/wemo/cache/utils/SharePreferences;

    invoke-virtual {v11}, Lcom/belkin/wemo/cache/utils/SharePreferences;->getHomeSSIDs()Ljava/util/Set;

    move-result-object v11

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v10

    const-string v11, " RemoteEnabled: "

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    iget-object v11, p0, Lcom/belkin/cordova/plugin/SetupPlugin;->mSharePreference:Lcom/belkin/wemo/cache/utils/SharePreferences;

    invoke-virtual {v11}, Lcom/belkin/wemo/cache/utils/SharePreferences;->isRemoteEnabled()Z

    move-result v11

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v10

    const-string v11, " setupFallbackRouterSame: "

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10, v8}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-static {v9, v10}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 945
    .end local v4    # "homeSSID":Ljava/lang/String;
    .end local v5    # "homeSSIDs":Ljava/util/HashSet;, "Ljava/util/HashSet<Ljava/lang/String;>;"
    .end local v6    # "privateKey":Ljava/lang/String;
    .end local v7    # "savedConfig":Ljava/lang/String;
    .end local v8    # "setupFallbackRouterSame":Z
    :goto_1
    return-void

    .line 918
    .restart local v4    # "homeSSID":Ljava/lang/String;
    .restart local v7    # "savedConfig":Ljava/lang/String;
    .restart local v8    # "setupFallbackRouterSame":Z
    :cond_3
    iget-object v9, p0, Lcom/belkin/cordova/plugin/SetupPlugin;->mNetworkUtil:Lcom/belkin/wemo/cache/utils/SDKNetworkUtils;

    invoke-virtual {v9}, Lcom/belkin/wemo/cache/utils/SDKNetworkUtils;->getSSID()Ljava/lang/String;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v4

    goto/16 :goto_0

    .line 942
    .end local v4    # "homeSSID":Ljava/lang/String;
    .end local v7    # "savedConfig":Ljava/lang/String;
    .end local v8    # "setupFallbackRouterSame":Z
    :catch_0
    move-exception v3

    .line 943
    .local v3, "e":Ljava/lang/Exception;
    const-string v9, "SetupPlugin"

    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    const-string v11, "saveRemoteRegistrationData Exception: "

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-static {v9, v10}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_1
.end method
