.class public Lorg/apache/cordova/geolocation/GeoBroker;
.super Lorg/apache/cordova/CordovaPlugin;
.source "GeoBroker.java"


# static fields
.field public static final TAG:Ljava/lang/String; = "GeoBroker"


# instance fields
.field private gpsListener:Lorg/apache/cordova/geolocation/GPSListener;

.field private locationManager:Landroid/location/LocationManager;

.field private mContext:Landroid/content/Context;

.field private networkListener:Lorg/apache/cordova/geolocation/NetworkListener;

.field private permissions:Lcom/belkin/wemo/Permissions;


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 44
    invoke-direct {p0}, Lorg/apache/cordova/CordovaPlugin;-><init>()V

    return-void
.end method

.method private addWatch(Ljava/lang/String;Lorg/apache/cordova/CallbackContext;Z)V
    .locals 1
    .param p1, "timerId"    # Ljava/lang/String;
    .param p2, "callbackContext"    # Lorg/apache/cordova/CallbackContext;
    .param p3, "enableHighAccuracy"    # Z

    .prologue
    .line 140
    if-eqz p3, :cond_0

    .line 141
    iget-object v0, p0, Lorg/apache/cordova/geolocation/GeoBroker;->gpsListener:Lorg/apache/cordova/geolocation/GPSListener;

    invoke-virtual {v0, p1, p2}, Lorg/apache/cordova/geolocation/GPSListener;->addWatch(Ljava/lang/String;Lorg/apache/cordova/CallbackContext;)V

    .line 145
    :goto_0
    return-void

    .line 143
    :cond_0
    iget-object v0, p0, Lorg/apache/cordova/geolocation/GeoBroker;->networkListener:Lorg/apache/cordova/geolocation/NetworkListener;

    invoke-virtual {v0, p1, p2}, Lorg/apache/cordova/geolocation/NetworkListener;->addWatch(Ljava/lang/String;Lorg/apache/cordova/CallbackContext;)V

    goto :goto_0
.end method

.method private clearWatch(Ljava/lang/String;)V
    .locals 1
    .param p1, "id"    # Ljava/lang/String;

    .prologue
    .line 127
    iget-object v0, p0, Lorg/apache/cordova/geolocation/GeoBroker;->gpsListener:Lorg/apache/cordova/geolocation/GPSListener;

    invoke-virtual {v0, p1}, Lorg/apache/cordova/geolocation/GPSListener;->clearWatch(Ljava/lang/String;)V

    .line 128
    iget-object v0, p0, Lorg/apache/cordova/geolocation/GeoBroker;->networkListener:Lorg/apache/cordova/geolocation/NetworkListener;

    invoke-virtual {v0, p1}, Lorg/apache/cordova/geolocation/NetworkListener;->clearWatch(Ljava/lang/String;)V

    .line 129
    return-void
.end method

.method private getCurrentLocation(Lorg/apache/cordova/CallbackContext;ZI)V
    .locals 1
    .param p1, "callbackContext"    # Lorg/apache/cordova/CallbackContext;
    .param p2, "enableHighAccuracy"    # Z
    .param p3, "timeout"    # I

    .prologue
    .line 132
    if-eqz p2, :cond_0

    .line 133
    iget-object v0, p0, Lorg/apache/cordova/geolocation/GeoBroker;->gpsListener:Lorg/apache/cordova/geolocation/GPSListener;

    invoke-virtual {v0, p1, p3}, Lorg/apache/cordova/geolocation/GPSListener;->addCallback(Lorg/apache/cordova/CallbackContext;I)V

    .line 137
    :goto_0
    return-void

    .line 135
    :cond_0
    iget-object v0, p0, Lorg/apache/cordova/geolocation/GeoBroker;->networkListener:Lorg/apache/cordova/geolocation/NetworkListener;

    invoke-virtual {v0, p1, p3}, Lorg/apache/cordova/geolocation/NetworkListener;->addCallback(Lorg/apache/cordova/CallbackContext;I)V

    goto :goto_0
.end method


# virtual methods
.method public execute(Ljava/lang/String;Lorg/json/JSONArray;Lorg/apache/cordova/CallbackContext;)Z
    .locals 12
    .param p1, "action"    # Ljava/lang/String;
    .param p2, "args"    # Lorg/json/JSONArray;
    .param p3, "callbackContext"    # Lorg/apache/cordova/CallbackContext;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .prologue
    .line 68
    iget-object v7, p0, Lorg/apache/cordova/geolocation/GeoBroker;->locationManager:Landroid/location/LocationManager;

    if-nez v7, :cond_0

    .line 69
    iget-object v7, p0, Lorg/apache/cordova/geolocation/GeoBroker;->cordova:Lorg/apache/cordova/CordovaInterface;

    invoke-interface {v7}, Lorg/apache/cordova/CordovaInterface;->getActivity()Landroid/app/Activity;

    move-result-object v7

    const-string v8, "location"

    invoke-virtual {v7, v8}, Landroid/app/Activity;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Landroid/location/LocationManager;

    iput-object v7, p0, Lorg/apache/cordova/geolocation/GeoBroker;->locationManager:Landroid/location/LocationManager;

    .line 71
    :cond_0
    iget-object v7, p0, Lorg/apache/cordova/geolocation/GeoBroker;->locationManager:Landroid/location/LocationManager;

    const-string v8, "gps"

    invoke-virtual {v7, v8}, Landroid/location/LocationManager;->isProviderEnabled(Ljava/lang/String;)Z

    move-result v7

    if-nez v7, :cond_1

    iget-object v7, p0, Lorg/apache/cordova/geolocation/GeoBroker;->locationManager:Landroid/location/LocationManager;

    const-string v8, "network"

    invoke-virtual {v7, v8}, Landroid/location/LocationManager;->isProviderEnabled(Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_c

    .line 73
    :cond_1
    iget-object v7, p0, Lorg/apache/cordova/geolocation/GeoBroker;->networkListener:Lorg/apache/cordova/geolocation/NetworkListener;

    if-nez v7, :cond_2

    .line 74
    new-instance v7, Lorg/apache/cordova/geolocation/NetworkListener;

    iget-object v8, p0, Lorg/apache/cordova/geolocation/GeoBroker;->locationManager:Landroid/location/LocationManager;

    invoke-direct {v7, v8, p0}, Lorg/apache/cordova/geolocation/NetworkListener;-><init>(Landroid/location/LocationManager;Lorg/apache/cordova/geolocation/GeoBroker;)V

    iput-object v7, p0, Lorg/apache/cordova/geolocation/GeoBroker;->networkListener:Lorg/apache/cordova/geolocation/NetworkListener;

    .line 76
    :cond_2
    iget-object v7, p0, Lorg/apache/cordova/geolocation/GeoBroker;->gpsListener:Lorg/apache/cordova/geolocation/GPSListener;

    if-nez v7, :cond_3

    .line 77
    new-instance v7, Lorg/apache/cordova/geolocation/GPSListener;

    iget-object v8, p0, Lorg/apache/cordova/geolocation/GeoBroker;->locationManager:Landroid/location/LocationManager;

    invoke-direct {v7, v8, p0}, Lorg/apache/cordova/geolocation/GPSListener;-><init>(Landroid/location/LocationManager;Lorg/apache/cordova/geolocation/GeoBroker;)V

    iput-object v7, p0, Lorg/apache/cordova/geolocation/GeoBroker;->gpsListener:Lorg/apache/cordova/geolocation/GPSListener;

    .line 81
    :cond_3
    const-string v7, "getLocation"

    invoke-virtual {p1, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_7

    .line 82
    const/4 v7, 0x0

    invoke-virtual {p2, v7}, Lorg/json/JSONArray;->getBoolean(I)Z

    move-result v0

    .line 83
    .local v0, "enableHighAccuracy":Z
    const/4 v7, 0x1

    invoke-virtual {p2, v7}, Lorg/json/JSONArray;->getInt(I)I

    move-result v3

    .line 84
    .local v3, "maximumAge":I
    iget-object v7, p0, Lorg/apache/cordova/geolocation/GeoBroker;->permissions:Lcom/belkin/wemo/Permissions;

    invoke-virtual {v7}, Lcom/belkin/wemo/Permissions;->checkLocationPermission()Z

    move-result v7

    if-eqz v7, :cond_6

    .line 85
    iget-object v8, p0, Lorg/apache/cordova/geolocation/GeoBroker;->locationManager:Landroid/location/LocationManager;

    if-eqz v0, :cond_4

    const-string v7, "gps"

    :goto_0
    invoke-virtual {v8, v7}, Landroid/location/LocationManager;->getLastKnownLocation(Ljava/lang/String;)Landroid/location/Location;

    move-result-object v2

    .line 87
    .local v2, "last":Landroid/location/Location;
    if-eqz v2, :cond_5

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v8

    invoke-virtual {v2}, Landroid/location/Location;->getTime()J

    move-result-wide v10

    sub-long/2addr v8, v10

    int-to-long v10, v3

    cmp-long v7, v8, v10

    if-gtz v7, :cond_5

    .line 88
    new-instance v5, Lorg/apache/cordova/PluginResult;

    sget-object v7, Lorg/apache/cordova/PluginResult$Status;->OK:Lorg/apache/cordova/PluginResult$Status;

    invoke-virtual {p0, v2}, Lorg/apache/cordova/geolocation/GeoBroker;->returnLocationJSON(Landroid/location/Location;)Lorg/json/JSONObject;

    move-result-object v8

    invoke-direct {v5, v7, v8}, Lorg/apache/cordova/PluginResult;-><init>(Lorg/apache/cordova/PluginResult$Status;Lorg/json/JSONObject;)V

    .line 89
    .local v5, "result":Lorg/apache/cordova/PluginResult;
    invoke-virtual {p3, v5}, Lorg/apache/cordova/CallbackContext;->sendPluginResult(Lorg/apache/cordova/PluginResult;)V

    .line 123
    .end local v0    # "enableHighAccuracy":Z
    .end local v2    # "last":Landroid/location/Location;
    .end local v3    # "maximumAge":I
    .end local v5    # "result":Lorg/apache/cordova/PluginResult;
    :goto_1
    const/4 v7, 0x1

    :goto_2
    return v7

    .line 85
    .restart local v0    # "enableHighAccuracy":Z
    .restart local v3    # "maximumAge":I
    :cond_4
    const-string v7, "network"

    goto :goto_0

    .line 91
    .restart local v2    # "last":Landroid/location/Location;
    :cond_5
    const/4 v7, 0x2

    const v8, 0xea60

    invoke-virtual {p2, v7, v8}, Lorg/json/JSONArray;->optInt(II)I

    move-result v7

    invoke-direct {p0, p3, v0, v7}, Lorg/apache/cordova/geolocation/GeoBroker;->getCurrentLocation(Lorg/apache/cordova/CallbackContext;ZI)V

    goto :goto_1

    .line 94
    .end local v2    # "last":Landroid/location/Location;
    :cond_6
    const-string v7, "GeoBroker"

    const-string v8, " Location Permission Denied"

    invoke-static {v7, v8}, Lcom/belkin/utils/LogUtils;->debugLog(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_1

    .line 97
    .end local v0    # "enableHighAccuracy":Z
    .end local v3    # "maximumAge":I
    :cond_7
    const-string v7, "addWatch"

    invoke-virtual {p1, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_9

    .line 98
    const/4 v7, 0x0

    invoke-virtual {p2, v7}, Lorg/json/JSONArray;->getString(I)Ljava/lang/String;

    move-result-object v1

    .line 99
    .local v1, "id":Ljava/lang/String;
    const/4 v7, 0x1

    invoke-virtual {p2, v7}, Lorg/json/JSONArray;->getBoolean(I)Z

    move-result v0

    .line 100
    .restart local v0    # "enableHighAccuracy":Z
    iget-object v7, p0, Lorg/apache/cordova/geolocation/GeoBroker;->permissions:Lcom/belkin/wemo/Permissions;

    invoke-virtual {v7}, Lcom/belkin/wemo/Permissions;->checkLocationPermission()Z

    move-result v7

    if-eqz v7, :cond_8

    .line 101
    invoke-direct {p0, v1, p3, v0}, Lorg/apache/cordova/geolocation/GeoBroker;->addWatch(Ljava/lang/String;Lorg/apache/cordova/CallbackContext;Z)V

    goto :goto_1

    .line 103
    :cond_8
    const-string v7, "GeoBroker"

    const-string v8, " Location Permission Denied"

    invoke-static {v7, v8}, Lcom/belkin/utils/LogUtils;->debugLog(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_1

    .line 106
    .end local v0    # "enableHighAccuracy":Z
    .end local v1    # "id":Ljava/lang/String;
    :cond_9
    const-string v7, "clearWatch"

    invoke-virtual {p1, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_b

    .line 107
    const/4 v7, 0x0

    invoke-virtual {p2, v7}, Lorg/json/JSONArray;->getString(I)Ljava/lang/String;

    move-result-object v1

    .line 108
    .restart local v1    # "id":Ljava/lang/String;
    iget-object v7, p0, Lorg/apache/cordova/geolocation/GeoBroker;->permissions:Lcom/belkin/wemo/Permissions;

    invoke-virtual {v7}, Lcom/belkin/wemo/Permissions;->checkLocationPermission()Z

    move-result v7

    if-eqz v7, :cond_a

    .line 109
    invoke-direct {p0, v1}, Lorg/apache/cordova/geolocation/GeoBroker;->clearWatch(Ljava/lang/String;)V

    goto :goto_1

    .line 111
    :cond_a
    const-string v7, "GeoBroker"

    const-string v8, " Location Permission Denied"

    invoke-static {v7, v8}, Lcom/belkin/utils/LogUtils;->debugLog(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_1

    .line 115
    .end local v1    # "id":Ljava/lang/String;
    :cond_b
    const/4 v7, 0x0

    goto :goto_2

    .line 118
    :cond_c
    sget-object v6, Lorg/apache/cordova/PluginResult$Status;->NO_RESULT:Lorg/apache/cordova/PluginResult$Status;

    .line 119
    .local v6, "status":Lorg/apache/cordova/PluginResult$Status;
    const-string v4, "Location API is not available for this device."

    .line 120
    .local v4, "message":Ljava/lang/String;
    new-instance v5, Lorg/apache/cordova/PluginResult;

    invoke-direct {v5, v6, v4}, Lorg/apache/cordova/PluginResult;-><init>(Lorg/apache/cordova/PluginResult$Status;Ljava/lang/String;)V

    .line 121
    .restart local v5    # "result":Lorg/apache/cordova/PluginResult;
    invoke-virtual {p3, v5}, Lorg/apache/cordova/CallbackContext;->sendPluginResult(Lorg/apache/cordova/PluginResult;)V

    goto :goto_1
.end method

.method public fail(ILjava/lang/String;Lorg/apache/cordova/CallbackContext;Z)V
    .locals 7
    .param p1, "code"    # I
    .param p2, "msg"    # Ljava/lang/String;
    .param p3, "callbackContext"    # Lorg/apache/cordova/CallbackContext;
    .param p4, "keepCallback"    # Z

    .prologue
    .line 203
    new-instance v2, Lorg/json/JSONObject;

    invoke-direct {v2}, Lorg/json/JSONObject;-><init>()V

    .line 204
    .local v2, "obj":Lorg/json/JSONObject;
    const/4 v0, 0x0

    .line 206
    .local v0, "backup":Ljava/lang/String;
    :try_start_0
    const-string v4, "code"

    invoke-virtual {v2, v4, p1}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    .line 207
    const-string v4, "message"

    invoke-virtual {v2, v4, p2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 213
    :goto_0
    if-eqz v2, :cond_0

    .line 214
    new-instance v3, Lorg/apache/cordova/PluginResult;

    sget-object v4, Lorg/apache/cordova/PluginResult$Status;->ERROR:Lorg/apache/cordova/PluginResult$Status;

    invoke-direct {v3, v4, v2}, Lorg/apache/cordova/PluginResult;-><init>(Lorg/apache/cordova/PluginResult$Status;Lorg/json/JSONObject;)V

    .line 219
    .local v3, "result":Lorg/apache/cordova/PluginResult;
    :goto_1
    invoke-virtual {v3, p4}, Lorg/apache/cordova/PluginResult;->setKeepCallback(Z)V

    .line 220
    invoke-virtual {p3, v3}, Lorg/apache/cordova/CallbackContext;->sendPluginResult(Lorg/apache/cordova/PluginResult;)V

    .line 221
    return-void

    .line 208
    .end local v3    # "result":Lorg/apache/cordova/PluginResult;
    :catch_0
    move-exception v1

    .line 209
    .local v1, "e":Lorg/json/JSONException;
    const/4 v2, 0x0

    .line 210
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "{\'code\':"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, ",\'message\':\'"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, "\'"

    const-string v6, "\'"

    invoke-virtual {p2, v5, v6}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, "\'}"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    goto :goto_0

    .line 216
    .end local v1    # "e":Lorg/json/JSONException;
    :cond_0
    new-instance v3, Lorg/apache/cordova/PluginResult;

    sget-object v4, Lorg/apache/cordova/PluginResult$Status;->ERROR:Lorg/apache/cordova/PluginResult$Status;

    invoke-direct {v3, v4, v0}, Lorg/apache/cordova/PluginResult;-><init>(Lorg/apache/cordova/PluginResult$Status;Ljava/lang/String;)V

    .restart local v3    # "result":Lorg/apache/cordova/PluginResult;
    goto :goto_1
.end method

.method public initialize(Lorg/apache/cordova/CordovaInterface;Lorg/apache/cordova/CordovaWebView;)V
    .locals 1
    .param p1, "cordova"    # Lorg/apache/cordova/CordovaInterface;
    .param p2, "webView"    # Lorg/apache/cordova/CordovaWebView;

    .prologue
    .line 54
    invoke-super {p0, p1, p2}, Lorg/apache/cordova/CordovaPlugin;->initialize(Lorg/apache/cordova/CordovaInterface;Lorg/apache/cordova/CordovaWebView;)V

    .line 55
    invoke-interface {p1}, Lorg/apache/cordova/CordovaInterface;->getActivity()Landroid/app/Activity;

    move-result-object v0

    iput-object v0, p0, Lorg/apache/cordova/geolocation/GeoBroker;->mContext:Landroid/content/Context;

    .line 56
    iget-object v0, p0, Lorg/apache/cordova/geolocation/GeoBroker;->mContext:Landroid/content/Context;

    invoke-static {v0}, Lcom/belkin/wemo/Permissions;->getInstance(Landroid/content/Context;)Lcom/belkin/wemo/Permissions;

    move-result-object v0

    iput-object v0, p0, Lorg/apache/cordova/geolocation/GeoBroker;->permissions:Lcom/belkin/wemo/Permissions;

    .line 57
    return-void
.end method

.method public isGlobalListener(Lorg/apache/cordova/geolocation/CordovaLocationListener;)Z
    .locals 2
    .param p1, "listener"    # Lorg/apache/cordova/geolocation/CordovaLocationListener;

    .prologue
    const/4 v0, 0x0

    .line 225
    iget-object v1, p0, Lorg/apache/cordova/geolocation/GeoBroker;->gpsListener:Lorg/apache/cordova/geolocation/GPSListener;

    if-eqz v1, :cond_1

    iget-object v1, p0, Lorg/apache/cordova/geolocation/GeoBroker;->networkListener:Lorg/apache/cordova/geolocation/NetworkListener;

    if-eqz v1, :cond_1

    .line 227
    iget-object v1, p0, Lorg/apache/cordova/geolocation/GeoBroker;->gpsListener:Lorg/apache/cordova/geolocation/GPSListener;

    invoke-virtual {v1, p1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_0

    iget-object v1, p0, Lorg/apache/cordova/geolocation/GeoBroker;->networkListener:Lorg/apache/cordova/geolocation/NetworkListener;

    invoke-virtual {v1, p1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1

    :cond_0
    const/4 v0, 0x1

    .line 230
    :cond_1
    return v0
.end method

.method public onDestroy()V
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 152
    iget-object v0, p0, Lorg/apache/cordova/geolocation/GeoBroker;->networkListener:Lorg/apache/cordova/geolocation/NetworkListener;

    if-eqz v0, :cond_0

    .line 153
    iget-object v0, p0, Lorg/apache/cordova/geolocation/GeoBroker;->networkListener:Lorg/apache/cordova/geolocation/NetworkListener;

    invoke-virtual {v0}, Lorg/apache/cordova/geolocation/NetworkListener;->destroy()V

    .line 154
    iput-object v1, p0, Lorg/apache/cordova/geolocation/GeoBroker;->networkListener:Lorg/apache/cordova/geolocation/NetworkListener;

    .line 156
    :cond_0
    iget-object v0, p0, Lorg/apache/cordova/geolocation/GeoBroker;->gpsListener:Lorg/apache/cordova/geolocation/GPSListener;

    if-eqz v0, :cond_1

    .line 157
    iget-object v0, p0, Lorg/apache/cordova/geolocation/GeoBroker;->gpsListener:Lorg/apache/cordova/geolocation/GPSListener;

    invoke-virtual {v0}, Lorg/apache/cordova/geolocation/GPSListener;->destroy()V

    .line 158
    iput-object v1, p0, Lorg/apache/cordova/geolocation/GeoBroker;->gpsListener:Lorg/apache/cordova/geolocation/GPSListener;

    .line 160
    :cond_1
    return-void
.end method

.method public onReset()V
    .locals 0

    .prologue
    .line 167
    invoke-virtual {p0}, Lorg/apache/cordova/geolocation/GeoBroker;->onDestroy()V

    .line 168
    return-void
.end method

.method public returnLocationJSON(Landroid/location/Location;)Lorg/json/JSONObject;
    .locals 8
    .param p1, "loc"    # Landroid/location/Location;

    .prologue
    const/4 v2, 0x0

    .line 171
    new-instance v1, Lorg/json/JSONObject;

    invoke-direct {v1}, Lorg/json/JSONObject;-><init>()V

    .line 174
    .local v1, "o":Lorg/json/JSONObject;
    :try_start_0
    const-string v3, "latitude"

    invoke-virtual {p1}, Landroid/location/Location;->getLatitude()D

    move-result-wide v4

    invoke-virtual {v1, v3, v4, v5}, Lorg/json/JSONObject;->put(Ljava/lang/String;D)Lorg/json/JSONObject;

    .line 175
    const-string v3, "longitude"

    invoke-virtual {p1}, Landroid/location/Location;->getLongitude()D

    move-result-wide v4

    invoke-virtual {v1, v3, v4, v5}, Lorg/json/JSONObject;->put(Ljava/lang/String;D)Lorg/json/JSONObject;

    .line 176
    const-string v4, "altitude"

    invoke-virtual {p1}, Landroid/location/Location;->hasAltitude()Z

    move-result v3

    if-eqz v3, :cond_1

    invoke-virtual {p1}, Landroid/location/Location;->getAltitude()D

    move-result-wide v6

    invoke-static {v6, v7}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v3

    :goto_0
    invoke-virtual {v1, v4, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 177
    const-string v3, "accuracy"

    invoke-virtual {p1}, Landroid/location/Location;->getAccuracy()F

    move-result v4

    float-to-double v4, v4

    invoke-virtual {v1, v3, v4, v5}, Lorg/json/JSONObject;->put(Ljava/lang/String;D)Lorg/json/JSONObject;

    .line 178
    const-string v3, "heading"

    invoke-virtual {p1}, Landroid/location/Location;->hasBearing()Z

    move-result v4

    if-eqz v4, :cond_0

    invoke-virtual {p1}, Landroid/location/Location;->hasSpeed()Z

    move-result v4

    if-eqz v4, :cond_0

    invoke-virtual {p1}, Landroid/location/Location;->getBearing()F

    move-result v2

    invoke-static {v2}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v2

    :cond_0
    invoke-virtual {v1, v3, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 179
    const-string v2, "velocity"

    invoke-virtual {p1}, Landroid/location/Location;->getSpeed()F

    move-result v3

    float-to-double v4, v3

    invoke-virtual {v1, v2, v4, v5}, Lorg/json/JSONObject;->put(Ljava/lang/String;D)Lorg/json/JSONObject;

    .line 180
    const-string v2, "timestamp"

    invoke-virtual {p1}, Landroid/location/Location;->getTime()J

    move-result-wide v4

    invoke-virtual {v1, v2, v4, v5}, Lorg/json/JSONObject;->put(Ljava/lang/String;J)Lorg/json/JSONObject;
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 186
    :goto_1
    return-object v1

    :cond_1
    move-object v3, v2

    .line 176
    goto :goto_0

    .line 181
    :catch_0
    move-exception v0

    .line 183
    .local v0, "e":Lorg/json/JSONException;
    invoke-virtual {v0}, Lorg/json/JSONException;->printStackTrace()V

    goto :goto_1
.end method

.method public win(Landroid/location/Location;Lorg/apache/cordova/CallbackContext;Z)V
    .locals 3
    .param p1, "loc"    # Landroid/location/Location;
    .param p2, "callbackContext"    # Lorg/apache/cordova/CallbackContext;
    .param p3, "keepCallback"    # Z

    .prologue
    .line 190
    new-instance v0, Lorg/apache/cordova/PluginResult;

    sget-object v1, Lorg/apache/cordova/PluginResult$Status;->OK:Lorg/apache/cordova/PluginResult$Status;

    invoke-virtual {p0, p1}, Lorg/apache/cordova/geolocation/GeoBroker;->returnLocationJSON(Landroid/location/Location;)Lorg/json/JSONObject;

    move-result-object v2

    invoke-direct {v0, v1, v2}, Lorg/apache/cordova/PluginResult;-><init>(Lorg/apache/cordova/PluginResult$Status;Lorg/json/JSONObject;)V

    .line 191
    .local v0, "result":Lorg/apache/cordova/PluginResult;
    invoke-virtual {v0, p3}, Lorg/apache/cordova/PluginResult;->setKeepCallback(Z)V

    .line 192
    invoke-virtual {p2, v0}, Lorg/apache/cordova/CallbackContext;->sendPluginResult(Lorg/apache/cordova/PluginResult;)V

    .line 193
    return-void
.end method
