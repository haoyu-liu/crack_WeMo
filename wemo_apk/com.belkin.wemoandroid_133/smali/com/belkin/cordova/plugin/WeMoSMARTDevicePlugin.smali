.class public Lcom/belkin/cordova/plugin/WeMoSMARTDevicePlugin;
.super Lorg/apache/cordova/CordovaPlugin;
.source "WeMoSMARTDevicePlugin.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/belkin/cordova/plugin/WeMoSMARTDevicePlugin$DeviceChangeReceiver;
    }
.end annotation


# static fields
.field public static final ACTION_CALL_ACTION:Ljava/lang/String; = "callAction"

.field public static final ACTION_CALL_ACTION_REMOTE:Ljava/lang/String; = "callActionRemote"

.field public static final ACTION_FETCH_RULES:Ljava/lang/String; = "fetchRules"

.field public static final ACTION_GET_ALL_DEVICES:Ljava/lang/String; = "getAllDevices"

.field public static final ACTION_GET_AUTHORIZATION_CODE:Ljava/lang/String; = "getAuthorizationCode"

.field public static final ACTION_GET_BLOB_STORAGE:Ljava/lang/String; = "GetBlobStorage"

.field public static final ACTION_GET_DEVICE:Ljava/lang/String; = "getDevice"

.field public static final ACTION_SET_BLOB_STORAGE:Ljava/lang/String; = "SetBlobStorage"

.field public static final ACTION_SUBSCRIBE_DEVICE_CHANGE:Ljava/lang/String; = "subscribeDeviceChange"

.field public static final ACTION_UNSUBSCRIBE_DEVICE_CHANGE:Ljava/lang/String; = "unsubscribeDeviceChange"

.field public static final ACTION_UPDATE_RULE:Ljava/lang/String; = "updateRule"

.field public static final DEFAULT_ERROR:Ljava/lang/String; = "Unexpected error"

.field public static final GET_RETAILER_DETAILS:Ljava/lang/String; = "GetRetailerDetails"

.field public static final GET_RULES:Ljava/lang/String; = "GetRules"

.field public static final GET_TEMPLATES:Ljava/lang/String; = "GetTemplates"

.field public static final INVALID_UDN:Ljava/lang/String; = "Invalid UDN"

.field public static final MISSING_PARAMETERS:Ljava/lang/String; = "Missing parameters"

.field public static final SET_RULES:Ljava/lang/String; = "SetRules"

.field public static final SET_TEMPLATES:Ljava/lang/String; = "SetTemplates"

.field private static final TAG:Ljava/lang/String; = "WeMoSMARTDevicePlugin"

.field public static mWeMoSDKContext:Lcom/belkin/wemo/localsdk/WeMoSDKContext;


# instance fields
.field private mAuthCodeGenerator:Lcom/belkin/cordova/plugin/AuthCodeGenerator;

.field private mContext:Landroid/content/Context;

.field private mDeviceChangeReceiver:Lcom/belkin/cordova/plugin/WeMoSMARTDevicePlugin$DeviceChangeReceiver;

.field private mNetworkUtil:Lcom/belkin/wemo/cache/utils/SDKNetworkUtils;

.field private mSharePreference:Lcom/belkin/wemo/cache/utils/SharePreferences;

.field private mUpnpDeviceList:Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;

.field private mWiFiSecurityUtil:Lcom/belkin/utils/WiFiSecurityUtil;

.field private registered:Z


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 65
    const/4 v0, 0x0

    sput-object v0, Lcom/belkin/cordova/plugin/WeMoSMARTDevicePlugin;->mWeMoSDKContext:Lcom/belkin/wemo/localsdk/WeMoSDKContext;

    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .prologue
    const/4 v0, 0x0

    .line 35
    invoke-direct {p0}, Lorg/apache/cordova/CordovaPlugin;-><init>()V

    .line 69
    iput-object v0, p0, Lcom/belkin/cordova/plugin/WeMoSMARTDevicePlugin;->mDeviceChangeReceiver:Lcom/belkin/cordova/plugin/WeMoSMARTDevicePlugin$DeviceChangeReceiver;

    .line 70
    iput-object v0, p0, Lcom/belkin/cordova/plugin/WeMoSMARTDevicePlugin;->mAuthCodeGenerator:Lcom/belkin/cordova/plugin/AuthCodeGenerator;

    .line 74
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/belkin/cordova/plugin/WeMoSMARTDevicePlugin;->registered:Z

    .line 507
    return-void
.end method

.method static synthetic access$100(Lcom/belkin/cordova/plugin/WeMoSMARTDevicePlugin;)Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;
    .locals 1
    .param p0, "x0"    # Lcom/belkin/cordova/plugin/WeMoSMARTDevicePlugin;

    .prologue
    .line 35
    iget-object v0, p0, Lcom/belkin/cordova/plugin/WeMoSMARTDevicePlugin;->mUpnpDeviceList:Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;

    return-object v0
.end method

.method static synthetic access$102(Lcom/belkin/cordova/plugin/WeMoSMARTDevicePlugin;Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;)Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;
    .locals 0
    .param p0, "x0"    # Lcom/belkin/cordova/plugin/WeMoSMARTDevicePlugin;
    .param p1, "x1"    # Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;

    .prologue
    .line 35
    iput-object p1, p0, Lcom/belkin/cordova/plugin/WeMoSMARTDevicePlugin;->mUpnpDeviceList:Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;

    return-object p1
.end method

.method static synthetic access$200(Lcom/belkin/cordova/plugin/WeMoSMARTDevicePlugin;)Landroid/content/Context;
    .locals 1
    .param p0, "x0"    # Lcom/belkin/cordova/plugin/WeMoSMARTDevicePlugin;

    .prologue
    .line 35
    iget-object v0, p0, Lcom/belkin/cordova/plugin/WeMoSMARTDevicePlugin;->mContext:Landroid/content/Context;

    return-object v0
.end method

.method static synthetic access$300(Lcom/belkin/cordova/plugin/WeMoSMARTDevicePlugin;Lorg/json/JSONObject;Ljava/lang/String;)Ljava/lang/String;
    .locals 1
    .param p0, "x0"    # Lcom/belkin/cordova/plugin/WeMoSMARTDevicePlugin;
    .param p1, "x1"    # Lorg/json/JSONObject;
    .param p2, "x2"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .prologue
    .line 35
    invoke-direct {p0, p1, p2}, Lcom/belkin/cordova/plugin/WeMoSMARTDevicePlugin;->createAttributeList(Lorg/json/JSONObject;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$400(Lcom/belkin/cordova/plugin/WeMoSMARTDevicePlugin;Lorg/json/JSONObject;)Ljava/lang/String;
    .locals 1
    .param p0, "x0"    # Lcom/belkin/cordova/plugin/WeMoSMARTDevicePlugin;
    .param p1, "x1"    # Lorg/json/JSONObject;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .prologue
    .line 35
    invoke-direct {p0, p1}, Lcom/belkin/cordova/plugin/WeMoSMARTDevicePlugin;->createArgumentList(Lorg/json/JSONObject;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$500(Lcom/belkin/cordova/plugin/WeMoSMARTDevicePlugin;)Lcom/belkin/utils/WiFiSecurityUtil;
    .locals 1
    .param p0, "x0"    # Lcom/belkin/cordova/plugin/WeMoSMARTDevicePlugin;

    .prologue
    .line 35
    iget-object v0, p0, Lcom/belkin/cordova/plugin/WeMoSMARTDevicePlugin;->mWiFiSecurityUtil:Lcom/belkin/utils/WiFiSecurityUtil;

    return-object v0
.end method

.method static synthetic access$602(Lcom/belkin/cordova/plugin/WeMoSMARTDevicePlugin;Z)Z
    .locals 0
    .param p0, "x0"    # Lcom/belkin/cordova/plugin/WeMoSMARTDevicePlugin;
    .param p1, "x1"    # Z

    .prologue
    .line 35
    iput-boolean p1, p0, Lcom/belkin/cordova/plugin/WeMoSMARTDevicePlugin;->registered:Z

    return p1
.end method

.method static synthetic access$800(Lcom/belkin/cordova/plugin/WeMoSMARTDevicePlugin;Ljava/lang/String;)Lcom/belkin/wemo/localsdk/WeMoDevice;
    .locals 1
    .param p0, "x0"    # Lcom/belkin/cordova/plugin/WeMoSMARTDevicePlugin;
    .param p1, "x1"    # Ljava/lang/String;

    .prologue
    .line 35
    invoke-direct {p0, p1}, Lcom/belkin/cordova/plugin/WeMoSMARTDevicePlugin;->getWemoDevice(Ljava/lang/String;)Lcom/belkin/wemo/localsdk/WeMoDevice;

    move-result-object v0

    return-object v0
.end method

.method private callAction(Lorg/json/JSONArray;Lorg/apache/cordova/CallbackContext;)Z
    .locals 2
    .param p1, "args"    # Lorg/json/JSONArray;
    .param p2, "callbackContext"    # Lorg/apache/cordova/CallbackContext;

    .prologue
    .line 292
    iget-object v0, p0, Lcom/belkin/cordova/plugin/WeMoSMARTDevicePlugin;->mSharePreference:Lcom/belkin/wemo/cache/utils/SharePreferences;

    invoke-virtual {v0}, Lcom/belkin/wemo/cache/utils/SharePreferences;->isRemoteEnabled()Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/belkin/cordova/plugin/WeMoSMARTDevicePlugin;->mNetworkUtil:Lcom/belkin/wemo/cache/utils/SDKNetworkUtils;

    invoke-virtual {v0}, Lcom/belkin/wemo/cache/utils/SDKNetworkUtils;->isHomeNetwork()Z

    move-result v0

    if-nez v0, :cond_0

    .line 293
    invoke-direct {p0, p1, p2}, Lcom/belkin/cordova/plugin/WeMoSMARTDevicePlugin;->callActionRemote(Lorg/json/JSONArray;Lorg/apache/cordova/CallbackContext;)Z

    .line 372
    :goto_0
    const/4 v0, 0x1

    return v0

    .line 296
    :cond_0
    iget-object v0, p0, Lcom/belkin/cordova/plugin/WeMoSMARTDevicePlugin;->cordova:Lorg/apache/cordova/CordovaInterface;

    invoke-interface {v0}, Lorg/apache/cordova/CordovaInterface;->getThreadPool()Ljava/util/concurrent/ExecutorService;

    move-result-object v0

    new-instance v1, Lcom/belkin/cordova/plugin/WeMoSMARTDevicePlugin$3;

    invoke-direct {v1, p0, p1, p2}, Lcom/belkin/cordova/plugin/WeMoSMARTDevicePlugin$3;-><init>(Lcom/belkin/cordova/plugin/WeMoSMARTDevicePlugin;Lorg/json/JSONArray;Lorg/apache/cordova/CallbackContext;)V

    invoke-interface {v0, v1}, Ljava/util/concurrent/ExecutorService;->execute(Ljava/lang/Runnable;)V

    goto :goto_0
.end method

.method private callActionRemote(Lorg/json/JSONArray;Lorg/apache/cordova/CallbackContext;)Z
    .locals 2
    .param p1, "args"    # Lorg/json/JSONArray;
    .param p2, "callbackContext"    # Lorg/apache/cordova/CallbackContext;

    .prologue
    .line 376
    iget-object v0, p0, Lcom/belkin/cordova/plugin/WeMoSMARTDevicePlugin;->cordova:Lorg/apache/cordova/CordovaInterface;

    invoke-interface {v0}, Lorg/apache/cordova/CordovaInterface;->getThreadPool()Ljava/util/concurrent/ExecutorService;

    move-result-object v0

    new-instance v1, Lcom/belkin/cordova/plugin/WeMoSMARTDevicePlugin$4;

    invoke-direct {v1, p0, p1, p2}, Lcom/belkin/cordova/plugin/WeMoSMARTDevicePlugin$4;-><init>(Lcom/belkin/cordova/plugin/WeMoSMARTDevicePlugin;Lorg/json/JSONArray;Lorg/apache/cordova/CallbackContext;)V

    invoke-interface {v0, v1}, Ljava/util/concurrent/ExecutorService;->execute(Ljava/lang/Runnable;)V

    .line 425
    const/4 v0, 0x1

    return v0
.end method

.method private createArgumentList(Lorg/json/JSONObject;)Ljava/lang/String;
    .locals 6
    .param p1, "argumentList"    # Lorg/json/JSONObject;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .prologue
    .line 271
    new-instance v2, Ljava/lang/StringBuffer;

    invoke-direct {v2}, Ljava/lang/StringBuffer;-><init>()V

    .line 272
    .local v2, "str":Ljava/lang/StringBuffer;
    invoke-virtual {p1}, Lorg/json/JSONObject;->keys()Ljava/util/Iterator;

    move-result-object v1

    .line 273
    .local v1, "getterKeyIterator":Ljava/util/Iterator;, "Ljava/util/Iterator<*>;"
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_0

    .line 274
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    .line 276
    .local v0, "argumentKey":Ljava/lang/String;
    const-string v3, "<attribute>"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 277
    const-string v3, "<name>"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 278
    invoke-virtual {v2, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 279
    const-string v3, "</name>"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 280
    const-string v3, "<value>"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 281
    invoke-virtual {p1, v0}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 282
    const-string v3, "</value>"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 283
    const-string v3, "</attribute>"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    goto :goto_0

    .line 286
    .end local v0    # "argumentKey":Ljava/lang/String;
    :cond_0
    const-string v3, "createArgumentList"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "str.toString():::::::;"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v2}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 287
    invoke-virtual {v2}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v3

    return-object v3
.end method

.method private createAttributeList(Lorg/json/JSONObject;Ljava/lang/String;)Ljava/lang/String;
    .locals 11
    .param p1, "attributeList"    # Lorg/json/JSONObject;
    .param p2, "udn"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .prologue
    .line 237
    iget-object v8, p0, Lcom/belkin/cordova/plugin/WeMoSMARTDevicePlugin;->mUpnpDeviceList:Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;

    invoke-virtual {v8, p2}, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->getDevice(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v2

    .line 238
    .local v2, "device":Lorg/json/JSONObject;
    new-instance v0, Lorg/json/JSONObject;

    const-string v8, "attributeList"

    invoke-virtual {v2, v8}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    invoke-direct {v0, v8}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 241
    .local v0, "attrList":Lorg/json/JSONObject;
    new-instance v6, Ljava/lang/StringBuffer;

    invoke-direct {v6}, Ljava/lang/StringBuffer;-><init>()V

    .line 243
    .local v6, "str":Ljava/lang/StringBuffer;
    invoke-virtual {v0}, Lorg/json/JSONObject;->keys()Ljava/util/Iterator;

    move-result-object v4

    .line 245
    .local v4, "deviceKeyIterator":Ljava/util/Iterator;, "Ljava/util/Iterator<*>;"
    :goto_0
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v8

    if-eqz v8, :cond_2

    .line 247
    const-string v7, "NULL"

    .line 248
    .local v7, "value":Ljava/lang/String;
    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    .line 249
    .local v1, "attributeKey":Ljava/lang/String;
    invoke-virtual {p1}, Lorg/json/JSONObject;->keys()Ljava/util/Iterator;

    move-result-object v5

    .line 250
    .local v5, "getterKeyIterator":Ljava/util/Iterator;, "Ljava/util/Iterator<*>;"
    :cond_0
    :goto_1
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v8

    if-eqz v8, :cond_1

    .line 251
    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    .line 252
    .local v3, "deviceAttributeKey":Ljava/lang/String;
    invoke-virtual {v3, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_0

    .line 253
    invoke-virtual {p1, v1}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    goto :goto_1

    .line 256
    .end local v3    # "deviceAttributeKey":Ljava/lang/String;
    :cond_1
    const-string v8, "<attribute>"

    invoke-virtual {v6, v8}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 257
    const-string v8, "<name>"

    invoke-virtual {v6, v8}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 258
    invoke-virtual {v6, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 259
    const-string v8, "</name>"

    invoke-virtual {v6, v8}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 260
    const-string v8, "<value>"

    invoke-virtual {v6, v8}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 261
    invoke-virtual {v6, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 262
    const-string v8, "</value>"

    invoke-virtual {v6, v8}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 263
    const-string v8, "</attribute>"

    invoke-virtual {v6, v8}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    goto :goto_0

    .line 265
    .end local v1    # "attributeKey":Ljava/lang/String;
    .end local v5    # "getterKeyIterator":Ljava/util/Iterator;, "Ljava/util/Iterator<*>;"
    .end local v7    # "value":Ljava/lang/String;
    :cond_2
    const-string v8, "setAttriuteState"

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "str.toString():::::::;"

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v6}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-static {v8, v9}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 266
    invoke-virtual {v6}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v8

    return-object v8
.end method

.method private fetchRules(Lorg/json/JSONArray;Lorg/apache/cordova/CallbackContext;)Z
    .locals 5
    .param p1, "args"    # Lorg/json/JSONArray;
    .param p2, "callbackContext"    # Lorg/apache/cordova/CallbackContext;

    .prologue
    const/4 v4, 0x1

    .line 455
    const/4 v1, 0x0

    .line 458
    .local v1, "error":Ljava/lang/String;
    :try_start_0
    invoke-virtual {p1}, Lorg/json/JSONArray;->length()I

    move-result v3

    if-lt v3, v4, :cond_0

    .line 460
    const/4 v3, 0x0

    invoke-virtual {p1, v3}, Lorg/json/JSONArray;->getString(I)Ljava/lang/String;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v2

    .line 470
    :goto_0
    if-eqz v1, :cond_1

    .line 471
    invoke-virtual {p2, v1}, Lorg/apache/cordova/CallbackContext;->error(Ljava/lang/String;)V

    .line 475
    :goto_1
    return v4

    .line 464
    :cond_0
    :try_start_1
    const-string v1, "Missing parameters"
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_0

    .line 466
    :catch_0
    move-exception v0

    .line 467
    .local v0, "e":Ljava/lang/Exception;
    invoke-virtual {v0}, Ljava/lang/Exception;->toString()Ljava/lang/String;

    move-result-object v1

    goto :goto_0

    .line 473
    .end local v0    # "e":Ljava/lang/Exception;
    :cond_1
    invoke-virtual {p2}, Lorg/apache/cordova/CallbackContext;->success()V

    goto :goto_1
.end method

.method private getAllDevices(Lorg/json/JSONArray;Lorg/apache/cordova/CallbackContext;)Z
    .locals 2
    .param p1, "args"    # Lorg/json/JSONArray;
    .param p2, "callbackContext"    # Lorg/apache/cordova/CallbackContext;

    .prologue
    .line 199
    iget-object v0, p0, Lcom/belkin/cordova/plugin/WeMoSMARTDevicePlugin;->cordova:Lorg/apache/cordova/CordovaInterface;

    invoke-interface {v0}, Lorg/apache/cordova/CordovaInterface;->getThreadPool()Ljava/util/concurrent/ExecutorService;

    move-result-object v0

    new-instance v1, Lcom/belkin/cordova/plugin/WeMoSMARTDevicePlugin$2;

    invoke-direct {v1, p0, p2}, Lcom/belkin/cordova/plugin/WeMoSMARTDevicePlugin$2;-><init>(Lcom/belkin/cordova/plugin/WeMoSMARTDevicePlugin;Lorg/apache/cordova/CallbackContext;)V

    invoke-interface {v0, v1}, Ljava/util/concurrent/ExecutorService;->execute(Ljava/lang/Runnable;)V

    .line 232
    const/4 v0, 0x1

    return v0
.end method

.method private getAuthorizationCode(Lorg/json/JSONArray;Lorg/apache/cordova/CallbackContext;)Z
    .locals 5
    .param p1, "args"    # Lorg/json/JSONArray;
    .param p2, "callbackContext"    # Lorg/apache/cordova/CallbackContext;

    .prologue
    .line 429
    const/4 v0, 0x0

    .line 430
    .local v0, "code":Ljava/lang/String;
    const/4 v2, 0x0

    .line 433
    .local v2, "error":Ljava/lang/String;
    :try_start_0
    iget-object v3, p0, Lcom/belkin/cordova/plugin/WeMoSMARTDevicePlugin;->mAuthCodeGenerator:Lcom/belkin/cordova/plugin/AuthCodeGenerator;

    if-nez v3, :cond_0

    .line 434
    new-instance v3, Lcom/belkin/cordova/plugin/AuthCodeGenerator;

    iget-object v4, p0, Lcom/belkin/cordova/plugin/WeMoSMARTDevicePlugin;->cordova:Lorg/apache/cordova/CordovaInterface;

    invoke-interface {v4}, Lorg/apache/cordova/CordovaInterface;->getActivity()Landroid/app/Activity;

    move-result-object v4

    invoke-direct {v3, v4}, Lcom/belkin/cordova/plugin/AuthCodeGenerator;-><init>(Landroid/content/Context;)V

    iput-object v3, p0, Lcom/belkin/cordova/plugin/WeMoSMARTDevicePlugin;->mAuthCodeGenerator:Lcom/belkin/cordova/plugin/AuthCodeGenerator;

    .line 436
    :cond_0
    iget-object v3, p0, Lcom/belkin/cordova/plugin/WeMoSMARTDevicePlugin;->mAuthCodeGenerator:Lcom/belkin/cordova/plugin/AuthCodeGenerator;

    invoke-virtual {v3}, Lcom/belkin/cordova/plugin/AuthCodeGenerator;->getCode()Ljava/lang/String;

    move-result-object v0

    .line 437
    if-nez v0, :cond_1

    .line 438
    const-string v2, "No code generated"
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 444
    :cond_1
    :goto_0
    if-eqz v2, :cond_2

    .line 445
    invoke-virtual {p2, v2}, Lorg/apache/cordova/CallbackContext;->error(Ljava/lang/String;)V

    .line 449
    :goto_1
    const/4 v3, 0x1

    return v3

    .line 440
    :catch_0
    move-exception v1

    .line 441
    .local v1, "e":Ljava/lang/Exception;
    invoke-virtual {v1}, Ljava/lang/Exception;->toString()Ljava/lang/String;

    move-result-object v2

    goto :goto_0

    .line 447
    .end local v1    # "e":Ljava/lang/Exception;
    :cond_2
    invoke-virtual {p2, v0}, Lorg/apache/cordova/CallbackContext;->success(Ljava/lang/String;)V

    goto :goto_1
.end method

.method private getDevice(Lorg/json/JSONArray;Lorg/apache/cordova/CallbackContext;)Z
    .locals 3
    .param p1, "args"    # Lorg/json/JSONArray;
    .param p2, "callbackContext"    # Lorg/apache/cordova/CallbackContext;

    .prologue
    const/4 v2, 0x1

    .line 160
    invoke-static {}, Lcom/belkin/wemo/cache/utils/NetworkMode;->isLocal()Z

    move-result v0

    if-nez v0, :cond_0

    .line 194
    :goto_0
    return v2

    .line 161
    :cond_0
    iget-object v0, p0, Lcom/belkin/cordova/plugin/WeMoSMARTDevicePlugin;->cordova:Lorg/apache/cordova/CordovaInterface;

    invoke-interface {v0}, Lorg/apache/cordova/CordovaInterface;->getThreadPool()Ljava/util/concurrent/ExecutorService;

    move-result-object v0

    new-instance v1, Lcom/belkin/cordova/plugin/WeMoSMARTDevicePlugin$1;

    invoke-direct {v1, p0, p1, p2}, Lcom/belkin/cordova/plugin/WeMoSMARTDevicePlugin$1;-><init>(Lcom/belkin/cordova/plugin/WeMoSMARTDevicePlugin;Lorg/json/JSONArray;Lorg/apache/cordova/CallbackContext;)V

    invoke-interface {v0, v1}, Ljava/util/concurrent/ExecutorService;->execute(Ljava/lang/Runnable;)V

    goto :goto_0
.end method

.method private getWemoDevice(Ljava/lang/String;)Lcom/belkin/wemo/localsdk/WeMoDevice;
    .locals 2
    .param p1, "udn"    # Ljava/lang/String;

    .prologue
    .line 597
    const/4 v0, 0x0

    .line 598
    .local v0, "wemoDevice":Lcom/belkin/wemo/localsdk/WeMoDevice;
    sget-object v1, Lcom/belkin/cordova/plugin/WeMoSMARTDevicePlugin;->mWeMoSDKContext:Lcom/belkin/wemo/localsdk/WeMoSDKContext;

    if-eqz v1, :cond_0

    .line 599
    sget-object v1, Lcom/belkin/cordova/plugin/WeMoSMARTDevicePlugin;->mWeMoSDKContext:Lcom/belkin/wemo/localsdk/WeMoSDKContext;

    invoke-virtual {v1, p1}, Lcom/belkin/wemo/localsdk/WeMoSDKContext;->getWeMoDeviceByUDN(Ljava/lang/String;)Lcom/belkin/wemo/localsdk/WeMoDevice;

    move-result-object v0

    .line 601
    :cond_0
    return-object v0
.end method

.method private subscribeDeviceChange(Lorg/json/JSONArray;Lorg/apache/cordova/CallbackContext;)Z
    .locals 7
    .param p1, "args"    # Lorg/json/JSONArray;
    .param p2, "callbackContext"    # Lorg/apache/cordova/CallbackContext;

    .prologue
    const/4 v6, 0x1

    .line 606
    const/4 v1, 0x0

    .line 607
    .local v1, "error":Ljava/lang/String;
    const/4 v2, 0x0

    .line 610
    .local v2, "pluginResult":Lorg/apache/cordova/PluginResult;
    :try_start_0
    invoke-virtual {p1}, Lorg/json/JSONArray;->length()I

    move-result v5

    if-lt v5, v6, :cond_3

    .line 611
    const/4 v5, 0x0

    invoke-virtual {p1, v5}, Lorg/json/JSONArray;->getString(I)Ljava/lang/String;

    move-result-object v4

    .line 612
    .local v4, "udn":Ljava/lang/String;
    if-eqz v4, :cond_2

    invoke-virtual {v4}, Ljava/lang/String;->length()I

    move-result v5

    if-lez v5, :cond_2

    .line 613
    iget-object v5, p0, Lcom/belkin/cordova/plugin/WeMoSMARTDevicePlugin;->mDeviceChangeReceiver:Lcom/belkin/cordova/plugin/WeMoSMARTDevicePlugin$DeviceChangeReceiver;

    if-nez v5, :cond_0

    .line 614
    new-instance v5, Lcom/belkin/cordova/plugin/WeMoSMARTDevicePlugin$DeviceChangeReceiver;

    invoke-direct {v5, p0}, Lcom/belkin/cordova/plugin/WeMoSMARTDevicePlugin$DeviceChangeReceiver;-><init>(Lcom/belkin/cordova/plugin/WeMoSMARTDevicePlugin;)V

    iput-object v5, p0, Lcom/belkin/cordova/plugin/WeMoSMARTDevicePlugin;->mDeviceChangeReceiver:Lcom/belkin/cordova/plugin/WeMoSMARTDevicePlugin$DeviceChangeReceiver;

    .line 615
    :cond_0
    iget-object v5, p0, Lcom/belkin/cordova/plugin/WeMoSMARTDevicePlugin;->mDeviceChangeReceiver:Lcom/belkin/cordova/plugin/WeMoSMARTDevicePlugin$DeviceChangeReceiver;

    invoke-virtual {v5, v4, p2}, Lcom/belkin/cordova/plugin/WeMoSMARTDevicePlugin$DeviceChangeReceiver;->addDevice(Ljava/lang/String;Lorg/apache/cordova/CallbackContext;)V

    .line 617
    new-instance v3, Lorg/apache/cordova/PluginResult;

    sget-object v5, Lorg/apache/cordova/PluginResult$Status;->OK:Lorg/apache/cordova/PluginResult$Status;

    invoke-direct {v3, v5}, Lorg/apache/cordova/PluginResult;-><init>(Lorg/apache/cordova/PluginResult$Status;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 618
    .end local v2    # "pluginResult":Lorg/apache/cordova/PluginResult;
    .local v3, "pluginResult":Lorg/apache/cordova/PluginResult;
    const/4 v5, 0x1

    :try_start_1
    invoke-virtual {v3, v5}, Lorg/apache/cordova/PluginResult;->setKeepCallback(Z)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    move-object v2, v3

    .line 630
    .end local v3    # "pluginResult":Lorg/apache/cordova/PluginResult;
    .end local v4    # "udn":Ljava/lang/String;
    .restart local v2    # "pluginResult":Lorg/apache/cordova/PluginResult;
    :goto_0
    if-nez v1, :cond_1

    if-nez v2, :cond_4

    .line 631
    :cond_1
    invoke-virtual {p2, v1}, Lorg/apache/cordova/CallbackContext;->error(Ljava/lang/String;)V

    .line 637
    :goto_1
    return v6

    .line 621
    .restart local v4    # "udn":Ljava/lang/String;
    :cond_2
    :try_start_2
    const-string v1, "Invalid UDN"

    goto :goto_0

    .line 624
    .end local v4    # "udn":Ljava/lang/String;
    :cond_3
    const-string v1, "Missing parameters"
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0

    goto :goto_0

    .line 626
    :catch_0
    move-exception v0

    .line 627
    .local v0, "e":Ljava/lang/Exception;
    :goto_2
    invoke-virtual {v0}, Ljava/lang/Exception;->toString()Ljava/lang/String;

    move-result-object v1

    goto :goto_0

    .line 634
    .end local v0    # "e":Ljava/lang/Exception;
    :cond_4
    invoke-virtual {p2, v2}, Lorg/apache/cordova/CallbackContext;->sendPluginResult(Lorg/apache/cordova/PluginResult;)V

    goto :goto_1

    .line 626
    .end local v2    # "pluginResult":Lorg/apache/cordova/PluginResult;
    .restart local v3    # "pluginResult":Lorg/apache/cordova/PluginResult;
    .restart local v4    # "udn":Ljava/lang/String;
    :catch_1
    move-exception v0

    move-object v2, v3

    .end local v3    # "pluginResult":Lorg/apache/cordova/PluginResult;
    .restart local v2    # "pluginResult":Lorg/apache/cordova/PluginResult;
    goto :goto_2
.end method

.method private unsubscribeDeviceChange(Lorg/json/JSONArray;Lorg/apache/cordova/CallbackContext;)Z
    .locals 5
    .param p1, "args"    # Lorg/json/JSONArray;
    .param p2, "callbackContext"    # Lorg/apache/cordova/CallbackContext;

    .prologue
    const/4 v4, 0x1

    .line 642
    const/4 v1, 0x0

    .line 645
    .local v1, "error":Ljava/lang/String;
    :try_start_0
    invoke-virtual {p1}, Lorg/json/JSONArray;->length()I

    move-result v3

    if-lt v3, v4, :cond_1

    .line 646
    const/4 v3, 0x0

    invoke-virtual {p1, v3}, Lorg/json/JSONArray;->getString(I)Ljava/lang/String;

    move-result-object v2

    .line 648
    .local v2, "udn":Ljava/lang/String;
    if-eqz v2, :cond_0

    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v3

    if-lez v3, :cond_0

    .line 649
    iget-object v3, p0, Lcom/belkin/cordova/plugin/WeMoSMARTDevicePlugin;->mDeviceChangeReceiver:Lcom/belkin/cordova/plugin/WeMoSMARTDevicePlugin$DeviceChangeReceiver;

    invoke-virtual {v3, v2}, Lcom/belkin/cordova/plugin/WeMoSMARTDevicePlugin$DeviceChangeReceiver;->removeDevice(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 661
    .end local v2    # "udn":Ljava/lang/String;
    :goto_0
    if-eqz v1, :cond_2

    .line 662
    invoke-virtual {p2, v1}, Lorg/apache/cordova/CallbackContext;->error(Ljava/lang/String;)V

    .line 666
    :goto_1
    return v4

    .line 652
    .restart local v2    # "udn":Ljava/lang/String;
    :cond_0
    :try_start_1
    const-string v1, "Invalid UDN"

    goto :goto_0

    .line 655
    .end local v2    # "udn":Ljava/lang/String;
    :cond_1
    const-string v1, "Missing parameters"
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_0

    .line 657
    :catch_0
    move-exception v0

    .line 658
    .local v0, "e":Ljava/lang/Exception;
    invoke-virtual {v0}, Ljava/lang/Exception;->toString()Ljava/lang/String;

    move-result-object v1

    goto :goto_0

    .line 664
    .end local v0    # "e":Ljava/lang/Exception;
    :cond_2
    invoke-virtual {p2}, Lorg/apache/cordova/CallbackContext;->success()V

    goto :goto_1
.end method

.method private updateRule(Lorg/json/JSONArray;Lorg/apache/cordova/CallbackContext;)Z
    .locals 7
    .param p1, "args"    # Lorg/json/JSONArray;
    .param p2, "callbackContext"    # Lorg/apache/cordova/CallbackContext;

    .prologue
    const/4 v6, 0x1

    .line 483
    const/4 v1, 0x0

    .line 486
    .local v1, "error":Ljava/lang/String;
    :try_start_0
    invoke-virtual {p1}, Lorg/json/JSONArray;->length()I

    move-result v4

    const/4 v5, 0x2

    if-lt v4, v5, :cond_0

    .line 488
    const/4 v4, 0x0

    invoke-virtual {p1, v4}, Lorg/json/JSONArray;->getString(I)Ljava/lang/String;

    move-result-object v3

    .line 489
    .local v3, "udn":Ljava/lang/String;
    const/4 v4, 0x1

    invoke-virtual {p1, v4}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v2

    .line 499
    .end local v3    # "udn":Ljava/lang/String;
    :goto_0
    if-eqz v1, :cond_1

    .line 500
    invoke-virtual {p2, v1}, Lorg/apache/cordova/CallbackContext;->error(Ljava/lang/String;)V

    .line 504
    :goto_1
    return v6

    .line 493
    :cond_0
    :try_start_1
    const-string v1, "Missing parameters"
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_0

    .line 495
    :catch_0
    move-exception v0

    .line 496
    .local v0, "e":Ljava/lang/Exception;
    invoke-virtual {v0}, Ljava/lang/Exception;->toString()Ljava/lang/String;

    move-result-object v1

    goto :goto_0

    .line 502
    .end local v0    # "e":Ljava/lang/Exception;
    :cond_1
    invoke-virtual {p2}, Lorg/apache/cordova/CallbackContext;->success()V

    goto :goto_1
.end method


# virtual methods
.method public execute(Ljava/lang/String;Lorg/json/JSONArray;Lorg/apache/cordova/CallbackContext;)Z
    .locals 3
    .param p1, "action"    # Ljava/lang/String;
    .param p2, "args"    # Lorg/json/JSONArray;
    .param p3, "callbackContext"    # Lorg/apache/cordova/CallbackContext;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .prologue
    .line 121
    const-string v0, "WeMoSMARTDevicePlugin"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "actionID: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " args: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 122
    const-string v0, "getDevice"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 123
    invoke-direct {p0, p2, p3}, Lcom/belkin/cordova/plugin/WeMoSMARTDevicePlugin;->getDevice(Lorg/json/JSONArray;Lorg/apache/cordova/CallbackContext;)Z

    move-result v0

    .line 156
    :goto_0
    return v0

    .line 125
    :cond_0
    const-string v0, "getAllDevices"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 126
    invoke-direct {p0, p2, p3}, Lcom/belkin/cordova/plugin/WeMoSMARTDevicePlugin;->getAllDevices(Lorg/json/JSONArray;Lorg/apache/cordova/CallbackContext;)Z

    move-result v0

    goto :goto_0

    .line 128
    :cond_1
    const-string v0, "callAction"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 129
    invoke-direct {p0, p2, p3}, Lcom/belkin/cordova/plugin/WeMoSMARTDevicePlugin;->callAction(Lorg/json/JSONArray;Lorg/apache/cordova/CallbackContext;)Z

    move-result v0

    goto :goto_0

    .line 131
    :cond_2
    const-string v0, "callActionRemote"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_3

    .line 132
    invoke-direct {p0, p2, p3}, Lcom/belkin/cordova/plugin/WeMoSMARTDevicePlugin;->callActionRemote(Lorg/json/JSONArray;Lorg/apache/cordova/CallbackContext;)Z

    move-result v0

    goto :goto_0

    .line 134
    :cond_3
    const-string v0, "getAuthorizationCode"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_4

    .line 135
    invoke-direct {p0, p2, p3}, Lcom/belkin/cordova/plugin/WeMoSMARTDevicePlugin;->getAuthorizationCode(Lorg/json/JSONArray;Lorg/apache/cordova/CallbackContext;)Z

    move-result v0

    goto :goto_0

    .line 137
    :cond_4
    const-string v0, "fetchRules"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_5

    .line 138
    invoke-direct {p0, p2, p3}, Lcom/belkin/cordova/plugin/WeMoSMARTDevicePlugin;->fetchRules(Lorg/json/JSONArray;Lorg/apache/cordova/CallbackContext;)Z

    move-result v0

    goto :goto_0

    .line 140
    :cond_5
    const-string v0, "updateRule"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_6

    .line 141
    invoke-direct {p0, p2, p3}, Lcom/belkin/cordova/plugin/WeMoSMARTDevicePlugin;->updateRule(Lorg/json/JSONArray;Lorg/apache/cordova/CallbackContext;)Z

    move-result v0

    goto :goto_0

    .line 143
    :cond_6
    const-string v0, "subscribeDeviceChange"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_7

    .line 144
    invoke-direct {p0, p2, p3}, Lcom/belkin/cordova/plugin/WeMoSMARTDevicePlugin;->subscribeDeviceChange(Lorg/json/JSONArray;Lorg/apache/cordova/CallbackContext;)Z

    move-result v0

    goto :goto_0

    .line 146
    :cond_7
    const-string v0, "unsubscribeDeviceChange"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_8

    .line 147
    invoke-direct {p0, p2, p3}, Lcom/belkin/cordova/plugin/WeMoSMARTDevicePlugin;->unsubscribeDeviceChange(Lorg/json/JSONArray;Lorg/apache/cordova/CallbackContext;)Z

    move-result v0

    goto :goto_0

    .line 149
    :cond_8
    const-string v0, "GetBlobStorage"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_9

    .line 150
    invoke-direct {p0, p2, p3}, Lcom/belkin/cordova/plugin/WeMoSMARTDevicePlugin;->callAction(Lorg/json/JSONArray;Lorg/apache/cordova/CallbackContext;)Z

    move-result v0

    goto :goto_0

    .line 152
    :cond_9
    const-string v0, "SetBlobStorage"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_a

    .line 153
    invoke-direct {p0, p2, p3}, Lcom/belkin/cordova/plugin/WeMoSMARTDevicePlugin;->callAction(Lorg/json/JSONArray;Lorg/apache/cordova/CallbackContext;)Z

    move-result v0

    goto/16 :goto_0

    .line 156
    :cond_a
    const/4 v0, 0x0

    goto/16 :goto_0
.end method

.method public initialize(Lorg/apache/cordova/CordovaInterface;Lorg/apache/cordova/CordovaWebView;)V
    .locals 2
    .param p1, "cordova"    # Lorg/apache/cordova/CordovaInterface;
    .param p2, "webView"    # Lorg/apache/cordova/CordovaWebView;

    .prologue
    .line 79
    invoke-super {p0, p1, p2}, Lorg/apache/cordova/CordovaPlugin;->initialize(Lorg/apache/cordova/CordovaInterface;Lorg/apache/cordova/CordovaWebView;)V

    .line 80
    invoke-interface {p1}, Lorg/apache/cordova/CordovaInterface;->getActivity()Landroid/app/Activity;

    move-result-object v0

    iput-object v0, p0, Lcom/belkin/cordova/plugin/WeMoSMARTDevicePlugin;->mContext:Landroid/content/Context;

    .line 81
    iget-object v0, p0, Lcom/belkin/cordova/plugin/WeMoSMARTDevicePlugin;->mContext:Landroid/content/Context;

    invoke-static {v0}, Lcom/belkin/wemo/localsdk/WeMoSDKContext;->getInstance(Landroid/content/Context;)Lcom/belkin/wemo/localsdk/WeMoSDKContext;

    move-result-object v0

    sput-object v0, Lcom/belkin/cordova/plugin/WeMoSMARTDevicePlugin;->mWeMoSDKContext:Lcom/belkin/wemo/localsdk/WeMoSDKContext;

    .line 82
    iget-object v0, p0, Lcom/belkin/cordova/plugin/WeMoSMARTDevicePlugin;->mContext:Landroid/content/Context;

    invoke-static {v0}, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->getInstance(Landroid/content/Context;)Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;

    move-result-object v0

    iput-object v0, p0, Lcom/belkin/cordova/plugin/WeMoSMARTDevicePlugin;->mUpnpDeviceList:Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;

    .line 83
    new-instance v0, Lcom/belkin/utils/WiFiSecurityUtil;

    invoke-direct {v0}, Lcom/belkin/utils/WiFiSecurityUtil;-><init>()V

    iput-object v0, p0, Lcom/belkin/cordova/plugin/WeMoSMARTDevicePlugin;->mWiFiSecurityUtil:Lcom/belkin/utils/WiFiSecurityUtil;

    .line 84
    new-instance v0, Lcom/belkin/wemo/cache/utils/SharePreferences;

    iget-object v1, p0, Lcom/belkin/cordova/plugin/WeMoSMARTDevicePlugin;->mContext:Landroid/content/Context;

    invoke-direct {v0, v1}, Lcom/belkin/wemo/cache/utils/SharePreferences;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/belkin/cordova/plugin/WeMoSMARTDevicePlugin;->mSharePreference:Lcom/belkin/wemo/cache/utils/SharePreferences;

    .line 85
    new-instance v0, Lcom/belkin/wemo/cache/utils/SDKNetworkUtils;

    iget-object v1, p0, Lcom/belkin/cordova/plugin/WeMoSMARTDevicePlugin;->mContext:Landroid/content/Context;

    invoke-direct {v0, v1}, Lcom/belkin/wemo/cache/utils/SDKNetworkUtils;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/belkin/cordova/plugin/WeMoSMARTDevicePlugin;->mNetworkUtil:Lcom/belkin/wemo/cache/utils/SDKNetworkUtils;

    .line 86
    return-void
.end method

.method public onPause(Z)V
    .locals 4
    .param p1, "multitasking"    # Z

    .prologue
    .line 94
    invoke-super {p0, p1}, Lorg/apache/cordova/CordovaPlugin;->onPause(Z)V

    .line 95
    iget-object v1, p0, Lcom/belkin/cordova/plugin/WeMoSMARTDevicePlugin;->mDeviceChangeReceiver:Lcom/belkin/cordova/plugin/WeMoSMARTDevicePlugin$DeviceChangeReceiver;

    if-eqz v1, :cond_0

    iget-boolean v1, p0, Lcom/belkin/cordova/plugin/WeMoSMARTDevicePlugin;->registered:Z

    if-eqz v1, :cond_0

    .line 97
    :try_start_0
    iget-object v1, p0, Lcom/belkin/cordova/plugin/WeMoSMARTDevicePlugin;->cordova:Lorg/apache/cordova/CordovaInterface;

    invoke-interface {v1}, Lorg/apache/cordova/CordovaInterface;->getActivity()Landroid/app/Activity;

    move-result-object v1

    iget-object v2, p0, Lcom/belkin/cordova/plugin/WeMoSMARTDevicePlugin;->mDeviceChangeReceiver:Lcom/belkin/cordova/plugin/WeMoSMARTDevicePlugin$DeviceChangeReceiver;

    invoke-virtual {v1, v2}, Landroid/app/Activity;->unregisterReceiver(Landroid/content/BroadcastReceiver;)V

    .line 98
    const/4 v1, 0x0

    iput-boolean v1, p0, Lcom/belkin/cordova/plugin/WeMoSMARTDevicePlugin;->registered:Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 103
    :cond_0
    :goto_0
    return-void

    .line 99
    :catch_0
    move-exception v0

    .line 100
    .local v0, "e":Ljava/lang/Exception;
    const-string v1, "WeMoSMARTDevicePlugin"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Error unregistering network receiver: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v0}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/belkin/utils/LogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0
.end method

.method public onResume(Z)V
    .locals 4
    .param p1, "multitasking"    # Z

    .prologue
    .line 107
    invoke-super {p0, p1}, Lorg/apache/cordova/CordovaPlugin;->onResume(Z)V

    .line 108
    iget-object v1, p0, Lcom/belkin/cordova/plugin/WeMoSMARTDevicePlugin;->mDeviceChangeReceiver:Lcom/belkin/cordova/plugin/WeMoSMARTDevicePlugin$DeviceChangeReceiver;

    if-eqz v1, :cond_0

    iget-boolean v1, p0, Lcom/belkin/cordova/plugin/WeMoSMARTDevicePlugin;->registered:Z

    if-nez v1, :cond_0

    .line 110
    :try_start_0
    iget-object v1, p0, Lcom/belkin/cordova/plugin/WeMoSMARTDevicePlugin;->cordova:Lorg/apache/cordova/CordovaInterface;

    invoke-interface {v1}, Lorg/apache/cordova/CordovaInterface;->getActivity()Landroid/app/Activity;

    move-result-object v1

    iget-object v2, p0, Lcom/belkin/cordova/plugin/WeMoSMARTDevicePlugin;->mDeviceChangeReceiver:Lcom/belkin/cordova/plugin/WeMoSMARTDevicePlugin$DeviceChangeReceiver;

    iget-object v3, p0, Lcom/belkin/cordova/plugin/WeMoSMARTDevicePlugin;->mDeviceChangeReceiver:Lcom/belkin/cordova/plugin/WeMoSMARTDevicePlugin$DeviceChangeReceiver;

    invoke-static {v3}, Lcom/belkin/cordova/plugin/WeMoSMARTDevicePlugin$DeviceChangeReceiver;->access$000(Lcom/belkin/cordova/plugin/WeMoSMARTDevicePlugin$DeviceChangeReceiver;)Landroid/content/IntentFilter;

    move-result-object v3

    invoke-virtual {v1, v2, v3}, Landroid/app/Activity;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)Landroid/content/Intent;

    .line 111
    const/4 v1, 0x1

    iput-boolean v1, p0, Lcom/belkin/cordova/plugin/WeMoSMARTDevicePlugin;->registered:Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 117
    :cond_0
    :goto_0
    return-void

    .line 112
    :catch_0
    move-exception v0

    .line 113
    .local v0, "e":Ljava/lang/Exception;
    const-string v1, "WeMoSMARTDevicePlugin"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Error registering network receiver: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v0}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/belkin/utils/LogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0
.end method
