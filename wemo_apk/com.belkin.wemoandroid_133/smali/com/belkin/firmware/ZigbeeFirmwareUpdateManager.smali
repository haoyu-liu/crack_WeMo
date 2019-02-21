.class public Lcom/belkin/firmware/ZigbeeFirmwareUpdateManager;
.super Ljava/lang/Object;
.source "ZigbeeFirmwareUpdateManager.java"


# static fields
.field private static final ACTION_ARGS_DEVICELIST:Ljava/lang/String; = "DeviceList"

.field private static final ACTION_ARGS_FIRMWARELINK:Ljava/lang/String; = "FirmwareLink"

.field private static final ACTION_ARGS_UPGRADEPOLICY:Ljava/lang/String; = "UpgradePolicy"

.field private static final DEVICE_CURRENT_FW:Ljava/lang/String; = "devicefirmware"

.field private static final DEVICE_TYPE:Ljava/lang/String; = "type"

.field private static final DEVICE_UDN:Ljava/lang/String; = "udn"

.field private static final FW_MD5:Ljava/lang/String; = "newFirmwareSignature"

.field private static final FW_URL:Ljava/lang/String; = "newFirmwareURL"

.field private static final NEW_FW_VERSION:Ljava/lang/String; = "newFirmwareVersion"

.field private static final UPGRADE:Ljava/lang/String; = "0"

.field private static bridgeMacAddress:Ljava/lang/String;

.field private static currentDevice:Lcom/belkin/firmware/FirmwareDetails;

.field public static currentlyUpdating:Ljava/lang/String;

.field public static firmwareUpdateQueue:Ljava/util/LinkedHashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/LinkedHashMap",
            "<",
            "Ljava/lang/String;",
            "Lcom/belkin/firmware/FirmwareDetails;",
            ">;"
        }
    .end annotation
.end field

.field private static firmwareUpgradeURL:Ljava/lang/String;

.field private static isUpdating:Z

.field private static pluginID:Ljava/lang/String;

.field public static tag:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 36
    const-string v0, "FirmwareUpdate"

    sput-object v0, Lcom/belkin/firmware/ZigbeeFirmwareUpdateManager;->tag:Ljava/lang/String;

    .line 37
    sput-object v1, Lcom/belkin/firmware/ZigbeeFirmwareUpdateManager;->firmwareUpdateQueue:Ljava/util/LinkedHashMap;

    .line 38
    const-string v0, ""

    sput-object v0, Lcom/belkin/firmware/ZigbeeFirmwareUpdateManager;->currentlyUpdating:Ljava/lang/String;

    .line 39
    sput-object v1, Lcom/belkin/firmware/ZigbeeFirmwareUpdateManager;->currentDevice:Lcom/belkin/firmware/FirmwareDetails;

    .line 40
    const/4 v0, 0x0

    sput-boolean v0, Lcom/belkin/firmware/ZigbeeFirmwareUpdateManager;->isUpdating:Z

    .line 52
    const-string v0, ""

    sput-object v0, Lcom/belkin/firmware/ZigbeeFirmwareUpdateManager;->pluginID:Ljava/lang/String;

    .line 53
    const-string v0, ""

    sput-object v0, Lcom/belkin/firmware/ZigbeeFirmwareUpdateManager;->bridgeMacAddress:Ljava/lang/String;

    .line 54
    const-string v0, "https://api.xbcs.net:8443/apis/http/plugin/upgradeFwVersion"

    sput-object v0, Lcom/belkin/firmware/ZigbeeFirmwareUpdateManager;->firmwareUpgradeURL:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 35
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static synthetic access$000()Ljava/lang/String;
    .locals 1

    .prologue
    .line 35
    invoke-static {}, Lcom/belkin/firmware/ZigbeeFirmwareUpdateManager;->generateAuthHeader()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$100(Lcom/belkin/firmware/FirmwareDetails;)Ljava/lang/String;
    .locals 1
    .param p0, "x0"    # Lcom/belkin/firmware/FirmwareDetails;

    .prologue
    .line 35
    invoke-static {p0}, Lcom/belkin/firmware/ZigbeeFirmwareUpdateManager;->generateRequestXML(Lcom/belkin/firmware/FirmwareDetails;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$200()Ljava/lang/String;
    .locals 1

    .prologue
    .line 35
    sget-object v0, Lcom/belkin/firmware/ZigbeeFirmwareUpdateManager;->firmwareUpgradeURL:Ljava/lang/String;

    return-object v0
.end method

.method public static addTofirmwareUpdateQueue(Lorg/json/JSONArray;)V
    .locals 13
    .param p0, "deviceDetails"    # Lorg/json/JSONArray;

    .prologue
    const/4 v2, 0x1

    .line 68
    if-nez p0, :cond_1

    .line 91
    :cond_0
    :goto_0
    return-void

    .line 72
    :cond_1
    const/4 v1, 0x0

    :try_start_0
    invoke-virtual {p0, v1}, Lorg/json/JSONArray;->get(I)Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Lorg/json/JSONArray;

    .line 73
    .local v10, "deviceArray":Lorg/json/JSONArray;
    invoke-virtual {p0}, Lorg/json/JSONArray;->length()I

    move-result v1

    if-le v1, v2, :cond_2

    .line 74
    const/4 v1, 0x1

    invoke-virtual {p0, v1}, Lorg/json/JSONArray;->get(I)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Lorg/json/JSONArray;

    .line 75
    .local v7, "bridgeDetails":Lorg/json/JSONArray;
    const/4 v1, 0x0

    invoke-virtual {v7, v1}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v8

    .line 76
    .local v8, "bridgeObject":Lorg/json/JSONObject;
    const-string v1, "macAddress"

    invoke-virtual {v8, v1}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    sput-object v1, Lcom/belkin/firmware/ZigbeeFirmwareUpdateManager;->bridgeMacAddress:Ljava/lang/String;

    .line 77
    const-string v1, "pluginId"

    invoke-virtual {v8, v1}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    sput-object v1, Lcom/belkin/firmware/ZigbeeFirmwareUpdateManager;->pluginID:Ljava/lang/String;

    .line 78
    sget-object v1, Lcom/belkin/firmware/ZigbeeFirmwareUpdateManager;->tag:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "bridge details:"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v7}, Lorg/json/JSONArray;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 81
    .end local v7    # "bridgeDetails":Lorg/json/JSONArray;
    .end local v8    # "bridgeObject":Lorg/json/JSONObject;
    :cond_2
    const/4 v12, 0x0

    .local v12, "i":I
    :goto_1
    invoke-virtual {v10}, Lorg/json/JSONArray;->length()I

    move-result v1

    if-ge v12, v1, :cond_0

    .line 82
    invoke-virtual {v10, v12}, Lorg/json/JSONArray;->get(I)Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Lorg/json/JSONObject;

    .line 83
    .local v9, "device":Lorg/json/JSONObject;
    sget-object v1, Lcom/belkin/firmware/ZigbeeFirmwareUpdateManager;->tag:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "device details:"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v9}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 84
    new-instance v0, Lcom/belkin/firmware/FirmwareDetails;

    const-string v1, "udn"

    invoke-virtual {v9, v1}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    const-string v2, "devicefirmware"

    invoke-virtual {v9, v2}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    const-string v3, "newFirmwareURL"

    invoke-virtual {v9, v3}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    const-string v4, "newFirmwareVersion"

    invoke-virtual {v9, v4}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    const-string v5, "newFirmwareSignature"

    invoke-virtual {v9, v5}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    const-string v6, "type"

    invoke-virtual {v9, v6}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    invoke-direct/range {v0 .. v6}, Lcom/belkin/firmware/FirmwareDetails;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 85
    .local v0, "deviceFw":Lcom/belkin/firmware/FirmwareDetails;
    const-string v1, "udn"

    invoke-virtual {v9, v1}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v1, v0}, Lcom/belkin/firmware/ZigbeeFirmwareUpdateManager;->updateQueue(Ljava/lang/String;Lcom/belkin/firmware/FirmwareDetails;)V
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 81
    add-int/lit8 v12, v12, 0x1

    goto :goto_1

    .line 87
    .end local v0    # "deviceFw":Lcom/belkin/firmware/FirmwareDetails;
    .end local v9    # "device":Lorg/json/JSONObject;
    .end local v10    # "deviceArray":Lorg/json/JSONArray;
    .end local v12    # "i":I
    :catch_0
    move-exception v11

    .line 89
    .local v11, "e":Lorg/json/JSONException;
    invoke-virtual {v11}, Lorg/json/JSONException;->printStackTrace()V

    goto/16 :goto_0
.end method

.method private static generateAuthHeader()Ljava/lang/String;
    .locals 3

    .prologue
    .line 274
    const-string v0, ""

    .line 275
    .local v0, "authHeader":Ljava/lang/String;
    new-instance v1, Lcom/belkin/utils/WiFiSecurityUtil;

    invoke-direct {v1}, Lcom/belkin/utils/WiFiSecurityUtil;-><init>()V

    .line 276
    .local v1, "webServicePlugin":Lcom/belkin/utils/WiFiSecurityUtil;
    sget-object v2, Lcom/belkin/cordova/plugin/DevicePlugin;->mContext:Landroid/content/Context;

    invoke-virtual {v1, v2}, Lcom/belkin/utils/WiFiSecurityUtil;->generateAuthCode(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v0

    .line 277
    return-object v0
.end method

.method private static generateRequestXML(Lcom/belkin/firmware/FirmwareDetails;)Ljava/lang/String;
    .locals 4
    .param p0, "firmwareDetails"    # Lcom/belkin/firmware/FirmwareDetails;

    .prologue
    .line 285
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "<plugins><plugin><recipientId>"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    sget-object v2, Lcom/belkin/firmware/ZigbeeFirmwareUpdateManager;->pluginID:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "</recipientId>"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "<macAddress>"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    sget-object v2, Lcom/belkin/firmware/ZigbeeFirmwareUpdateManager;->bridgeMacAddress:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "</macAddress>"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "<content><![CDATA[<upgradeFwVersion>"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "<plugins><plugin>"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "  <downloadStartTime>"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    invoke-virtual {v1, v2, v3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "</downloadStartTime>"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "  <macAddress>"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p0}, Lcom/belkin/firmware/FirmwareDetails;->getUniqueID()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "</macAddress>"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "  <signature>"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p0}, Lcom/belkin/firmware/FirmwareDetails;->getMd5()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "</signature>"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "  <firmwareDownloadUrl>"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p0}, Lcom/belkin/firmware/FirmwareDetails;->getUpdateURL()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "</firmwareDownloadUrl>"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "  </plugin></plugins></upgradeFwVersion>]]></content></plugin></plugins>"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 291
    .local v0, "requestXML":Ljava/lang/String;
    return-object v0
.end method

.method private static startNextUpdate()V
    .locals 4

    .prologue
    .line 223
    sget-object v1, Lcom/belkin/firmware/ZigbeeFirmwareUpdateManager;->firmwareUpdateQueue:Ljava/util/LinkedHashMap;

    if-eqz v1, :cond_0

    .line 224
    sget-object v1, Lcom/belkin/firmware/ZigbeeFirmwareUpdateManager;->currentDevice:Lcom/belkin/firmware/FirmwareDetails;

    invoke-virtual {v1}, Lcom/belkin/firmware/FirmwareDetails;->getUniqueID()Ljava/lang/String;

    move-result-object v0

    .line 225
    .local v0, "id":Ljava/lang/String;
    sget-object v1, Lcom/belkin/firmware/ZigbeeFirmwareUpdateManager;->tag:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "removing from queue:"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 226
    sget-object v1, Lcom/belkin/firmware/ZigbeeFirmwareUpdateManager;->firmwareUpdateQueue:Ljava/util/LinkedHashMap;

    invoke-virtual {v1, v0}, Ljava/util/LinkedHashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 227
    const/4 v1, 0x0

    sput-boolean v1, Lcom/belkin/firmware/ZigbeeFirmwareUpdateManager;->isUpdating:Z

    .line 228
    const-string v1, ""

    sput-object v1, Lcom/belkin/firmware/ZigbeeFirmwareUpdateManager;->currentlyUpdating:Ljava/lang/String;

    .line 229
    invoke-static {}, Lcom/belkin/firmware/ZigbeeFirmwareUpdateManager;->startUpdate()V

    .line 231
    :cond_0
    return-void
.end method

.method private static startUpdate()V
    .locals 5

    .prologue
    .line 200
    sget-object v3, Lcom/belkin/firmware/ZigbeeFirmwareUpdateManager;->firmwareUpdateQueue:Ljava/util/LinkedHashMap;

    invoke-virtual {v3}, Ljava/util/LinkedHashMap;->isEmpty()Z

    move-result v3

    if-nez v3, :cond_1

    .line 201
    sget-object v3, Lcom/belkin/firmware/ZigbeeFirmwareUpdateManager;->tag:Ljava/lang/String;

    const-string v4, "starting update :"

    invoke-static {v3, v4}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 202
    sget-object v3, Lcom/belkin/firmware/ZigbeeFirmwareUpdateManager;->firmwareUpdateQueue:Ljava/util/LinkedHashMap;

    invoke-virtual {v3}, Ljava/util/LinkedHashMap;->keySet()Ljava/util/Set;

    move-result-object v3

    invoke-interface {v3}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v3

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    .line 203
    .local v1, "key":Ljava/lang/String;
    sget-object v3, Lcom/belkin/firmware/ZigbeeFirmwareUpdateManager;->firmwareUpdateQueue:Ljava/util/LinkedHashMap;

    invoke-virtual {v3, v1}, Ljava/util/LinkedHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/belkin/firmware/FirmwareDetails;

    .line 204
    .local v0, "fwDetail":Lcom/belkin/firmware/FirmwareDetails;
    sput-object v0, Lcom/belkin/firmware/ZigbeeFirmwareUpdateManager;->currentDevice:Lcom/belkin/firmware/FirmwareDetails;

    .line 206
    new-instance v2, Lcom/belkin/wemo/cache/utils/SDKNetworkUtils;

    sget-object v3, Lcom/belkin/cordova/plugin/DevicePlugin;->mContext:Landroid/content/Context;

    invoke-direct {v2, v3}, Lcom/belkin/wemo/cache/utils/SDKNetworkUtils;-><init>(Landroid/content/Context;)V

    .line 207
    .local v2, "mNetworkUtil":Lcom/belkin/wemo/cache/utils/SDKNetworkUtils;
    invoke-virtual {v2}, Lcom/belkin/wemo/cache/utils/SDKNetworkUtils;->isHomeNetwork()Z

    move-result v3

    if-eqz v3, :cond_0

    .line 208
    sget-object v3, Lcom/belkin/firmware/ZigbeeFirmwareUpdateManager;->tag:Ljava/lang/String;

    const-string v4, "local fw update :"

    invoke-static {v3, v4}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 209
    invoke-static {v0}, Lcom/belkin/firmware/ZigbeeFirmwareUpdateManager;->updateSubDeviceFirmware(Lcom/belkin/firmware/FirmwareDetails;)Z

    .line 217
    .end local v0    # "fwDetail":Lcom/belkin/firmware/FirmwareDetails;
    .end local v1    # "key":Ljava/lang/String;
    .end local v2    # "mNetworkUtil":Lcom/belkin/wemo/cache/utils/SDKNetworkUtils;
    :goto_0
    return-void

    .line 211
    .restart local v0    # "fwDetail":Lcom/belkin/firmware/FirmwareDetails;
    .restart local v1    # "key":Ljava/lang/String;
    .restart local v2    # "mNetworkUtil":Lcom/belkin/wemo/cache/utils/SDKNetworkUtils;
    :cond_0
    sget-object v3, Lcom/belkin/firmware/ZigbeeFirmwareUpdateManager;->tag:Ljava/lang/String;

    const-string v4, "remote fw update :"

    invoke-static {v3, v4}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 212
    invoke-static {v0}, Lcom/belkin/firmware/ZigbeeFirmwareUpdateManager;->updateSubDeviceFirmwareRequest(Lcom/belkin/firmware/FirmwareDetails;)V

    goto :goto_0

    .line 215
    .end local v0    # "fwDetail":Lcom/belkin/firmware/FirmwareDetails;
    .end local v1    # "key":Ljava/lang/String;
    .end local v2    # "mNetworkUtil":Lcom/belkin/wemo/cache/utils/SDKNetworkUtils;
    :cond_1
    sget-object v3, Lcom/belkin/firmware/ZigbeeFirmwareUpdateManager;->tag:Ljava/lang/String;

    const-string v4, "queue is empty"

    invoke-static {v3, v4}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0
.end method

.method private static updateQueue(Ljava/lang/String;Lcom/belkin/firmware/FirmwareDetails;)V
    .locals 3
    .param p0, "key"    # Ljava/lang/String;
    .param p1, "firmwareDetails"    # Lcom/belkin/firmware/FirmwareDetails;

    .prologue
    .line 97
    sget-object v0, Lcom/belkin/firmware/ZigbeeFirmwareUpdateManager;->firmwareUpdateQueue:Ljava/util/LinkedHashMap;

    if-nez v0, :cond_0

    .line 98
    new-instance v0, Ljava/util/LinkedHashMap;

    invoke-direct {v0}, Ljava/util/LinkedHashMap;-><init>()V

    sput-object v0, Lcom/belkin/firmware/ZigbeeFirmwareUpdateManager;->firmwareUpdateQueue:Ljava/util/LinkedHashMap;

    .line 100
    :cond_0
    sget-object v0, Lcom/belkin/firmware/ZigbeeFirmwareUpdateManager;->tag:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "adding to queue"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 101
    sget-object v0, Lcom/belkin/firmware/ZigbeeFirmwareUpdateManager;->firmwareUpdateQueue:Ljava/util/LinkedHashMap;

    invoke-virtual {v0, p0, p1}, Ljava/util/LinkedHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 102
    sget-object v0, Lcom/belkin/firmware/ZigbeeFirmwareUpdateManager;->tag:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "queue size"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    sget-object v2, Lcom/belkin/firmware/ZigbeeFirmwareUpdateManager;->firmwareUpdateQueue:Ljava/util/LinkedHashMap;

    invoke-virtual {v2}, Ljava/util/LinkedHashMap;->size()I

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 104
    sget-boolean v0, Lcom/belkin/firmware/ZigbeeFirmwareUpdateManager;->isUpdating:Z

    if-nez v0, :cond_1

    .line 105
    const/4 v0, 0x1

    sput-boolean v0, Lcom/belkin/firmware/ZigbeeFirmwareUpdateManager;->isUpdating:Z

    .line 106
    invoke-static {}, Lcom/belkin/firmware/ZigbeeFirmwareUpdateManager;->startUpdate()V

    .line 108
    :cond_1
    return-void
.end method

.method private static updateSubDeviceFirmware(Lcom/belkin/firmware/FirmwareDetails;)Z
    .locals 13
    .param p0, "firmwareDetails"    # Lcom/belkin/firmware/FirmwareDetails;

    .prologue
    const/4 v9, 0x0

    .line 117
    sget-object v10, Lcom/belkin/firmware/ZigbeeFirmwareUpdateManager;->tag:Ljava/lang/String;

    new-instance v11, Ljava/lang/StringBuilder;

    invoke-direct {v11}, Ljava/lang/StringBuilder;-><init>()V

    const-string v12, "in updateSubDeviceFirmware"

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {p0}, Lcom/belkin/firmware/FirmwareDetails;->getUniqueID()Ljava/lang/String;

    move-result-object v12

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v11

    invoke-static {v10, v11}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 118
    const/4 v2, 0x0

    .line 119
    .local v2, "controlPoint":Lorg/cybergarage/upnp/ControlPoint;
    const/4 v1, 0x0

    .line 120
    .local v1, "bridgeDevice":Lorg/cybergarage/upnp/Device;
    sget-object v10, Lcom/belkin/cordova/plugin/DevicePlugin;->mWeMoSDKContext:Lcom/belkin/wemo/localsdk/WeMoSDKContext;

    if-eqz v10, :cond_0

    .line 121
    sget-object v10, Lcom/belkin/cordova/plugin/DevicePlugin;->mWeMoSDKContext:Lcom/belkin/wemo/localsdk/WeMoSDKContext;

    invoke-virtual {v10}, Lcom/belkin/wemo/localsdk/WeMoSDKContext;->getUpnpControl()Ljava/lang/Object;

    move-result-object v2

    .end local v2    # "controlPoint":Lorg/cybergarage/upnp/ControlPoint;
    check-cast v2, Lorg/cybergarage/upnp/ControlPoint;

    .line 123
    .restart local v2    # "controlPoint":Lorg/cybergarage/upnp/ControlPoint;
    :cond_0
    if-nez v2, :cond_2

    .line 156
    :cond_1
    :goto_0
    return v9

    .line 125
    :cond_2
    invoke-virtual {v2}, Lorg/cybergarage/upnp/ControlPoint;->getDeviceList()Lorg/cybergarage/upnp/DeviceList;

    move-result-object v4

    .line 127
    .local v4, "deviceList":Lorg/cybergarage/upnp/DeviceList;
    if-eqz v4, :cond_1

    .line 130
    const/4 v6, 0x0

    .local v6, "i":I
    :goto_1
    invoke-virtual {v4}, Lorg/cybergarage/upnp/DeviceList;->size()I

    move-result v10

    if-ge v6, v10, :cond_3

    .line 131
    invoke-virtual {v4, v6}, Lorg/cybergarage/upnp/DeviceList;->getDevice(I)Lorg/cybergarage/upnp/Device;

    move-result-object v3

    .line 132
    .local v3, "device":Lorg/cybergarage/upnp/Device;
    if-eqz v3, :cond_1

    .line 134
    invoke-virtual {v3}, Lorg/cybergarage/upnp/Device;->getUDN()Ljava/lang/String;

    move-result-object v8

    .line 135
    .local v8, "udn":Ljava/lang/String;
    if-eqz v8, :cond_4

    const-string v10, "Bridge"

    invoke-virtual {v8, v10}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v10

    if-eqz v10, :cond_4

    .line 136
    move-object v1, v3

    .line 141
    .end local v3    # "device":Lorg/cybergarage/upnp/Device;
    .end local v8    # "udn":Ljava/lang/String;
    :cond_3
    :try_start_0
    const-string v10, "UpgradeSubDeviceFirmware"

    invoke-virtual {v1, v10}, Lorg/cybergarage/upnp/Device;->getAction(Ljava/lang/String;)Lorg/cybergarage/upnp/Action;

    move-result-object v0

    .line 142
    .local v0, "action":Lorg/cybergarage/upnp/Action;
    const-string v10, "DeviceList"

    invoke-virtual {p0}, Lcom/belkin/firmware/FirmwareDetails;->getUniqueID()Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v0, v10, v11}, Lorg/cybergarage/upnp/Action;->setArgumentValue(Ljava/lang/String;Ljava/lang/String;)V

    .line 143
    const-string v10, "FirmwareLink"

    invoke-virtual {p0}, Lcom/belkin/firmware/FirmwareDetails;->getUpdateURL()Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v0, v10, v11}, Lorg/cybergarage/upnp/Action;->setArgumentValue(Ljava/lang/String;Ljava/lang/String;)V

    .line 144
    const-string v10, "UpgradePolicy"

    const-string v11, "0"

    invoke-virtual {v0, v10, v11}, Lorg/cybergarage/upnp/Action;->setArgumentValue(Ljava/lang/String;Ljava/lang/String;)V

    .line 145
    sget-object v10, Lcom/belkin/firmware/ZigbeeFirmwareUpdateManager;->tag:Ljava/lang/String;

    new-instance v11, Ljava/lang/StringBuilder;

    invoke-direct {v11}, Ljava/lang/StringBuilder;-><init>()V

    const-string v12, "action arguements: "

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    const-string v12, "DeviceList"

    invoke-virtual {v0, v12}, Lorg/cybergarage/upnp/Action;->getArgumentValue(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v12

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v11

    invoke-static {v10, v11}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 146
    sget-object v10, Lcom/belkin/firmware/ZigbeeFirmwareUpdateManager;->tag:Ljava/lang/String;

    new-instance v11, Ljava/lang/StringBuilder;

    invoke-direct {v11}, Ljava/lang/StringBuilder;-><init>()V

    const-string v12, "action arguements: "

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    const-string v12, "FirmwareLink"

    invoke-virtual {v0, v12}, Lorg/cybergarage/upnp/Action;->getArgumentValue(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v12

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v11

    invoke-static {v10, v11}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 147
    sget-object v10, Lcom/belkin/firmware/ZigbeeFirmwareUpdateManager;->tag:Ljava/lang/String;

    new-instance v11, Ljava/lang/StringBuilder;

    invoke-direct {v11}, Ljava/lang/StringBuilder;-><init>()V

    const-string v12, "action arguements: "

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    const-string v12, "UpgradePolicy"

    invoke-virtual {v0, v12}, Lorg/cybergarage/upnp/Action;->getArgumentValue(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v12

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v11

    invoke-static {v10, v11}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 148
    invoke-virtual {v0}, Lorg/cybergarage/upnp/Action;->postControlAction()Ljava/lang/String;

    move-result-object v7

    .line 149
    .local v7, "response":Ljava/lang/String;
    sget-object v10, Lcom/belkin/firmware/ZigbeeFirmwareUpdateManager;->tag:Ljava/lang/String;

    new-instance v11, Ljava/lang/StringBuilder;

    invoke-direct {v11}, Ljava/lang/StringBuilder;-><init>()V

    const-string v12, "BULB FIRMWARE RESPONSE: "

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v11

    invoke-static {v10, v11}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 150
    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    move-result-object v10

    invoke-virtual {v7, v10}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v10

    const-string v11, "success"

    invoke-virtual {v10, v11}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result v10

    if-eqz v10, :cond_1

    .line 151
    const/4 v9, 0x1

    goto/16 :goto_0

    .line 130
    .end local v0    # "action":Lorg/cybergarage/upnp/Action;
    .end local v7    # "response":Ljava/lang/String;
    .restart local v3    # "device":Lorg/cybergarage/upnp/Device;
    .restart local v8    # "udn":Ljava/lang/String;
    :cond_4
    add-int/lit8 v6, v6, 0x1

    goto/16 :goto_1

    .line 153
    .end local v3    # "device":Lorg/cybergarage/upnp/Device;
    .end local v8    # "udn":Ljava/lang/String;
    :catch_0
    move-exception v5

    .line 154
    .local v5, "e":Ljava/lang/Exception;
    invoke-virtual {v5}, Ljava/lang/Exception;->printStackTrace()V

    goto/16 :goto_0
.end method

.method private static updateSubDeviceFirmwareRequest(Lcom/belkin/firmware/FirmwareDetails;)V
    .locals 2
    .param p0, "firmwareDetails"    # Lcom/belkin/firmware/FirmwareDetails;

    .prologue
    .line 237
    new-instance v0, Lcom/belkin/firmware/ZigbeeFirmwareUpdateManager$1;

    invoke-direct {v0, p0}, Lcom/belkin/firmware/ZigbeeFirmwareUpdateManager$1;-><init>(Lcom/belkin/firmware/FirmwareDetails;)V

    const/4 v1, 0x0

    new-array v1, v1, [Ljava/lang/Void;

    invoke-virtual {v0, v1}, Lcom/belkin/firmware/ZigbeeFirmwareUpdateManager$1;->execute([Ljava/lang/Object;)Landroid/os/AsyncTask;

    .line 269
    return-void
.end method

.method public static updateUpgradeStatus(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 3
    .param p0, "id"    # Ljava/lang/String;
    .param p1, "value"    # Ljava/lang/String;
    .param p2, "deviceFWVersion"    # Ljava/lang/String;

    .prologue
    .line 164
    if-eqz p0, :cond_0

    if-eqz p1, :cond_0

    invoke-virtual {p0}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_0

    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 193
    :cond_0
    :goto_0
    return-void

    .line 167
    :cond_1
    sget-object v0, Lcom/belkin/firmware/ZigbeeFirmwareUpdateManager;->tag:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "upgrade status: id: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " value:"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 169
    const-string v0, "0"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 170
    sget-object v0, Lcom/belkin/firmware/ZigbeeFirmwareUpdateManager;->tag:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "upgrade started :"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 171
    const/4 v0, 0x1

    sput-boolean v0, Lcom/belkin/firmware/ZigbeeFirmwareUpdateManager;->isUpdating:Z

    .line 172
    sput-object p0, Lcom/belkin/firmware/ZigbeeFirmwareUpdateManager;->currentlyUpdating:Ljava/lang/String;

    goto :goto_0

    .line 173
    :cond_2
    const-string v0, "4"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_4

    .line 175
    sget-object v0, Lcom/belkin/firmware/ZigbeeFirmwareUpdateManager;->tag:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "upgrade completed :"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " deviceFWVersion:"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 176
    invoke-virtual {p2}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_3

    .line 177
    sget-object v0, Lcom/belkin/firmware/ZigbeeFirmwareUpdateManager;->currentDevice:Lcom/belkin/firmware/FirmwareDetails;

    iget-object v0, v0, Lcom/belkin/firmware/FirmwareDetails;->updateVersion:Ljava/lang/String;

    invoke-virtual {v0, p2}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 178
    invoke-static {}, Lcom/belkin/firmware/ZigbeeFirmwareUpdateManager;->startNextUpdate()V

    goto/16 :goto_0

    .line 181
    :cond_3
    invoke-static {}, Lcom/belkin/firmware/ZigbeeFirmwareUpdateManager;->startNextUpdate()V

    goto/16 :goto_0

    .line 183
    :cond_4
    const-string v0, "2"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_5

    .line 184
    sget-object v0, Lcom/belkin/firmware/ZigbeeFirmwareUpdateManager;->tag:Ljava/lang/String;

    const-string v1, "error :Firmware Download Failure"

    invoke-static {v0, v1}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 185
    invoke-static {}, Lcom/belkin/firmware/ZigbeeFirmwareUpdateManager;->startNextUpdate()V

    goto/16 :goto_0

    .line 186
    :cond_5
    const-string v0, "5"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_6

    .line 187
    sget-object v0, Lcom/belkin/firmware/ZigbeeFirmwareUpdateManager;->tag:Ljava/lang/String;

    const-string v1, "error :Invalid Firmware Image"

    invoke-static {v0, v1}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 188
    invoke-static {}, Lcom/belkin/firmware/ZigbeeFirmwareUpdateManager;->startNextUpdate()V

    goto/16 :goto_0

    .line 189
    :cond_6
    const-string v0, "6"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 190
    sget-object v0, Lcom/belkin/firmware/ZigbeeFirmwareUpdateManager;->tag:Ljava/lang/String;

    const-string v1, "error :Firmware not upgraded"

    invoke-static {v0, v1}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 191
    invoke-static {}, Lcom/belkin/firmware/ZigbeeFirmwareUpdateManager;->startNextUpdate()V

    goto/16 :goto_0
.end method


# virtual methods
.method public getFirmwareUpdateQueue()Ljava/util/LinkedHashMap;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/LinkedHashMap",
            "<",
            "Ljava/lang/String;",
            "Lcom/belkin/firmware/FirmwareDetails;",
            ">;"
        }
    .end annotation

    .prologue
    .line 61
    sget-object v0, Lcom/belkin/firmware/ZigbeeFirmwareUpdateManager;->firmwareUpdateQueue:Ljava/util/LinkedHashMap;

    return-object v0
.end method
