.class public Lcom/belkin/wemo/cache/cloud/CloudRequestGetDeviceList;
.super Ljava/lang/Object;
.source "CloudRequestGetDeviceList.java"

# interfaces
.implements Lcom/belkin/wemo/cache/cloud/CloudRequestInterface;


# static fields
.field private static final KEY_ARPMAC:Ljava/lang/String; = "arpMac"

.field private static final KEY_ATTRIBUTE_LISTS:Ljava/lang/String; = "attributeLists"

.field private static final KEY_CAPABILITIES:Ljava/lang/String; = "capabilities"

.field private static final KEY_CAPABILITY_ID:Ljava/lang/String; = "capabilityId"

.field private static final KEY_CAPABILITY_PROFILE:Ljava/lang/String; = "capabilityProfile"

.field private static final KEY_CAPABILITY_ROOT:Ljava/lang/String; = "deviceCapabilityProfiles"

.field private static final KEY_CAPABILITY_VALUE:Ljava/lang/String; = "currentValue"

.field private static final KEY_DEVICE_TAG:Ljava/lang/String; = "device"

.field private static final KEY_FRIENDLY_NAME:Ljava/lang/String; = "friendlyName"

.field private static final KEY_FW_STATUS:Ljava/lang/String; = "fwUpgradeStatus"

.field private static final KEY_FW_VERSION:Ljava/lang/String; = "firmwareVersion"

.field private static final KEY_GROUP_ARPMAC:Ljava/lang/String; = "groupArpMacs"

.field private static final KEY_GROUP_SSID:Ljava/lang/String; = "groupSSIDs"

.field private static final KEY_LED_GROUP_ID:Ljava/lang/String; = "id"

.field private static final KEY_LED_GROUP_NAME:Ljava/lang/String; = "groupName"

.field private static final KEY_LED_GROUP_PROFILES:Ljava/lang/String; = "groupProfiles"

.field private static final KEY_MAC_ADDRESS:Ljava/lang/String; = "macAddress"

.field private static final KEY_MANUFACTURER:Ljava/lang/String; = "manufacturer"

.field private static final KEY_MODEL_CODE:Ljava/lang/String; = "modelCode"

.field private static final KEY_PARENT_PLUGIN_ID:Ljava/lang/String; = "parentPluginId"

.field private static final KEY_PLUGIN_ID:Ljava/lang/String; = "pluginId"

.field private static final KEY_PRODUCT_NAME:Ljava/lang/String; = "productName"

.field private static final KEY_PRODUCT_TYPE:Ljava/lang/String; = "productType"

.field private static final KEY_REFERENCEID:Ljava/lang/String; = "referenceId"

.field private static final KEY_RULES_DB_VERSION:Ljava/lang/String; = "dbVersion"

.field private static final KEY_SSID:Ljava/lang/String; = "ssid"

.field private static final KEY_STATUS:Ljava/lang/String; = "status"

.field private static final KEY_STATUSTS:Ljava/lang/String; = "statusTS"

.field private static final KEY_UDN:Ljava/lang/String; = "uniqueId"


# instance fields
.field private final TAG:Ljava/lang/String;

.field private TIMEOUT:I

.field private final TIMEOUT_LIMIT:I

.field private final URL:Ljava/lang/String;

.field private cacheManager:Lcom/belkin/wemo/cache/CacheManager;

.field private cloudURL:Ljava/lang/String;

.field private devicesArray:Lcom/belkin/wemo/cache/data/DevicesArray;

.field private devicesList:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Lcom/belkin/wemo/cache/data/DeviceInformation;",
            ">;"
        }
    .end annotation
.end field

.field private mBridgeList:Ljava/util/Hashtable;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Hashtable",
            "<",
            "Ljava/lang/String;",
            "Lorg/json/JSONObject;",
            ">;"
        }
    .end annotation
.end field

.field private mContext:Landroid/content/Context;

.field private mDevMgr:Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

.field private mWemoAppRecovery:Lcom/belkin/wemo/cache/utils/WemoAppRecovery;


# direct methods
.method public constructor <init>(Lcom/belkin/wemo/cache/devicelist/DeviceListManager;Landroid/content/Context;)V
    .locals 3
    .param p1, "devMgr"    # Lcom/belkin/wemo/cache/devicelist/DeviceListManager;
    .param p2, "context"    # Landroid/content/Context;

    .prologue
    .line 90
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 67
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v2, Lcom/belkin/wemo/cache/cloud/CloudConstants;->CLOUD_URL:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "/apis/http/device/homeDevices/"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestGetDeviceList;->URL:Ljava/lang/String;

    .line 69
    const-string v1, "SDK_CloudRequestGetDeviceList"

    iput-object v1, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestGetDeviceList;->TAG:Ljava/lang/String;

    .line 70
    const v1, 0x9c40

    iput v1, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestGetDeviceList;->TIMEOUT_LIMIT:I

    .line 73
    const/16 v1, 0x2710

    iput v1, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestGetDeviceList;->TIMEOUT:I

    .line 74
    const/4 v1, 0x0

    iput-object v1, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestGetDeviceList;->devicesList:Ljava/util/ArrayList;

    .line 91
    iput-object p2, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestGetDeviceList;->mContext:Landroid/content/Context;

    .line 92
    iput-object p1, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestGetDeviceList;->mDevMgr:Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    .line 93
    invoke-static {p2}, Lcom/belkin/wemo/cache/CacheManager;->getInstance(Landroid/content/Context;)Lcom/belkin/wemo/cache/CacheManager;

    move-result-object v1

    iput-object v1, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestGetDeviceList;->cacheManager:Lcom/belkin/wemo/cache/CacheManager;

    .line 94
    invoke-static {p2}, Lcom/belkin/wemo/cache/data/DevicesArray;->getInstance(Landroid/content/Context;)Lcom/belkin/wemo/cache/data/DevicesArray;

    move-result-object v1

    iput-object v1, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestGetDeviceList;->devicesArray:Lcom/belkin/wemo/cache/data/DevicesArray;

    .line 95
    new-instance v0, Lcom/belkin/wemo/cache/cloud/CloudAuth;

    iget-object v1, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestGetDeviceList;->mContext:Landroid/content/Context;

    invoke-direct {v0, v1}, Lcom/belkin/wemo/cache/cloud/CloudAuth;-><init>(Landroid/content/Context;)V

    .line 96
    .local v0, "cloudAuth":Lcom/belkin/wemo/cache/cloud/CloudAuth;
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v2, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestGetDeviceList;->URL:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v0}, Lcom/belkin/wemo/cache/cloud/CloudAuth;->getHomeID()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestGetDeviceList;->cloudURL:Ljava/lang/String;

    .line 97
    new-instance v1, Ljava/util/Hashtable;

    invoke-direct {v1}, Ljava/util/Hashtable;-><init>()V

    iput-object v1, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestGetDeviceList;->mBridgeList:Ljava/util/Hashtable;

    .line 98
    invoke-static {p2}, Lcom/belkin/wemo/cache/utils/WemoAppRecovery;->getInstance(Landroid/content/Context;)Lcom/belkin/wemo/cache/utils/WemoAppRecovery;

    move-result-object v1

    iput-object v1, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestGetDeviceList;->mWemoAppRecovery:Lcom/belkin/wemo/cache/utils/WemoAppRecovery;

    .line 99
    return-void
.end method

.method private extractCapabilities(Lcom/belkin/wemo/cache/cloud/XMLParser;Lorg/w3c/dom/Element;)Ljava/lang/String;
    .locals 12
    .param p1, "parser"    # Lcom/belkin/wemo/cache/cloud/XMLParser;
    .param p2, "e"    # Lorg/w3c/dom/Element;

    .prologue
    .line 257
    new-instance v6, Lorg/json/JSONObject;

    invoke-direct {v6}, Lorg/json/JSONObject;-><init>()V

    .line 259
    .local v6, "res":Lorg/json/JSONObject;
    :try_start_0
    const-string v10, "capabilities"

    invoke-interface {p2, v10}, Lorg/w3c/dom/Element;->getElementsByTagName(Ljava/lang/String;)Lorg/w3c/dom/NodeList;

    move-result-object v10

    const/4 v11, 0x0

    invoke-interface {v10, v11}, Lorg/w3c/dom/NodeList;->item(I)Lorg/w3c/dom/Node;

    move-result-object v0

    .line 260
    .local v0, "capabilitiesRoot":Lorg/w3c/dom/Node;
    if-eqz v0, :cond_1

    .line 261
    const/4 v4, 0x0

    .local v4, "i":I
    :goto_0
    invoke-interface {v0}, Lorg/w3c/dom/Node;->getChildNodes()Lorg/w3c/dom/NodeList;

    move-result-object v10

    invoke-interface {v10}, Lorg/w3c/dom/NodeList;->getLength()I

    move-result v10

    if-ge v4, v10, :cond_3

    .line 262
    invoke-interface {v0}, Lorg/w3c/dom/Node;->getChildNodes()Lorg/w3c/dom/NodeList;

    move-result-object v10

    invoke-interface {v10, v4}, Lorg/w3c/dom/NodeList;->item(I)Lorg/w3c/dom/Node;

    move-result-object v2

    check-cast v2, Lorg/w3c/dom/Element;

    .line 263
    .local v2, "el":Lorg/w3c/dom/Element;
    const-string v10, "capabilityId"

    invoke-virtual {p1, v2, v10}, Lcom/belkin/wemo/cache/cloud/XMLParser;->getValue(Lorg/w3c/dom/Element;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    .line 264
    .local v5, "key":Ljava/lang/String;
    const-string v10, "currentValue"

    invoke-virtual {p1, v2, v10}, Lcom/belkin/wemo/cache/cloud/XMLParser;->getValue(Lorg/w3c/dom/Element;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v9

    .line 265
    .local v9, "value":Ljava/lang/String;
    sget-object v10, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->capabalityProfileList:Ljava/util/LinkedHashMap;

    if-nez v10, :cond_0

    .line 266
    invoke-static {}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->updateCapabilityProfileTable()V

    .line 268
    :cond_0
    sget-object v10, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->capabalityProfileList:Ljava/util/LinkedHashMap;

    invoke-virtual {v10, v5}, Ljava/util/LinkedHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    .line 269
    .local v1, "capabilityName":Ljava/lang/String;
    invoke-virtual {v6, v1, v9}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 261
    add-int/lit8 v4, v4, 0x1

    goto :goto_0

    .line 274
    .end local v1    # "capabilityName":Ljava/lang/String;
    .end local v2    # "el":Lorg/w3c/dom/Element;
    .end local v4    # "i":I
    .end local v5    # "key":Ljava/lang/String;
    .end local v9    # "value":Ljava/lang/String;
    :cond_1
    const-string v10, "deviceCapabilityProfiles"

    invoke-interface {p2, v10}, Lorg/w3c/dom/Element;->getElementsByTagName(Ljava/lang/String;)Lorg/w3c/dom/NodeList;

    move-result-object v10

    const/4 v11, 0x0

    invoke-interface {v10, v11}, Lorg/w3c/dom/NodeList;->item(I)Lorg/w3c/dom/Node;

    move-result-object v7

    .line 275
    .local v7, "root":Lorg/w3c/dom/Node;
    if-eqz v7, :cond_3

    .line 276
    const/4 v4, 0x0

    .restart local v4    # "i":I
    :goto_1
    invoke-interface {v7}, Lorg/w3c/dom/Node;->getChildNodes()Lorg/w3c/dom/NodeList;

    move-result-object v10

    invoke-interface {v10}, Lorg/w3c/dom/NodeList;->getLength()I

    move-result v10

    if-ge v4, v10, :cond_3

    .line 277
    invoke-interface {v7}, Lorg/w3c/dom/Node;->getChildNodes()Lorg/w3c/dom/NodeList;

    move-result-object v10

    invoke-interface {v10, v4}, Lorg/w3c/dom/NodeList;->item(I)Lorg/w3c/dom/Node;

    move-result-object v2

    check-cast v2, Lorg/w3c/dom/Element;

    .line 278
    .restart local v2    # "el":Lorg/w3c/dom/Element;
    const-string v10, "capabilityProfile"

    invoke-interface {v2, v10}, Lorg/w3c/dom/Element;->getElementsByTagName(Ljava/lang/String;)Lorg/w3c/dom/NodeList;

    move-result-object v10

    const/4 v11, 0x0

    invoke-interface {v10, v11}, Lorg/w3c/dom/NodeList;->item(I)Lorg/w3c/dom/Node;

    move-result-object v8

    check-cast v8, Lorg/w3c/dom/Element;

    .line 280
    .local v8, "subEl":Lorg/w3c/dom/Element;
    const-string v10, "capabilityId"

    invoke-virtual {p1, v8, v10}, Lcom/belkin/wemo/cache/cloud/XMLParser;->getValue(Lorg/w3c/dom/Element;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    .line 281
    .restart local v5    # "key":Ljava/lang/String;
    const-string v10, "currentValue"

    invoke-virtual {p1, v2, v10}, Lcom/belkin/wemo/cache/cloud/XMLParser;->getValue(Lorg/w3c/dom/Element;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v9

    .line 282
    .restart local v9    # "value":Ljava/lang/String;
    sget-object v10, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->capabalityProfileList:Ljava/util/LinkedHashMap;

    if-nez v10, :cond_2

    .line 283
    invoke-static {}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->updateCapabilityProfileTable()V

    .line 285
    :cond_2
    sget-object v10, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->capabalityProfileList:Ljava/util/LinkedHashMap;

    invoke-virtual {v10, v5}, Ljava/util/LinkedHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    .line 286
    .restart local v1    # "capabilityName":Ljava/lang/String;
    invoke-virtual {v6, v1, v9}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 276
    add-int/lit8 v4, v4, 0x1

    goto :goto_1

    .line 290
    .end local v0    # "capabilitiesRoot":Lorg/w3c/dom/Node;
    .end local v1    # "capabilityName":Ljava/lang/String;
    .end local v2    # "el":Lorg/w3c/dom/Element;
    .end local v4    # "i":I
    .end local v5    # "key":Ljava/lang/String;
    .end local v7    # "root":Lorg/w3c/dom/Node;
    .end local v8    # "subEl":Lorg/w3c/dom/Element;
    .end local v9    # "value":Ljava/lang/String;
    :catch_0
    move-exception v3

    .line 291
    .local v3, "ex":Ljava/lang/Exception;
    const-string v10, "SDK_CloudRequestGetDeviceList"

    const-string v11, "Exception in extractCapabilities: "

    invoke-static {v10, v11, v3}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Exception;)V

    .line 293
    .end local v3    # "ex":Ljava/lang/Exception;
    :cond_3
    invoke-virtual {v6}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v10

    return-object v10
.end method

.method private extractTimeStamp(Lcom/belkin/wemo/cache/cloud/XMLParser;Lorg/w3c/dom/Element;)Ljava/lang/String;
    .locals 10
    .param p1, "parser"    # Lcom/belkin/wemo/cache/cloud/XMLParser;
    .param p2, "e"    # Lorg/w3c/dom/Element;

    .prologue
    .line 297
    const-string v6, ""

    .line 299
    .local v6, "ts":Ljava/lang/String;
    :try_start_0
    const-string v7, "deviceCapabilityProfiles"

    invoke-interface {p2, v7}, Lorg/w3c/dom/Element;->getElementsByTagName(Ljava/lang/String;)Lorg/w3c/dom/NodeList;

    move-result-object v7

    const/4 v8, 0x0

    invoke-interface {v7, v8}, Lorg/w3c/dom/NodeList;->item(I)Lorg/w3c/dom/Node;

    move-result-object v4

    .line 300
    .local v4, "root":Lorg/w3c/dom/Node;
    if-eqz v4, :cond_1

    .line 301
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_0
    invoke-interface {v4}, Lorg/w3c/dom/Node;->getChildNodes()Lorg/w3c/dom/NodeList;

    move-result-object v7

    invoke-interface {v7}, Lorg/w3c/dom/NodeList;->getLength()I

    move-result v7

    if-ge v2, v7, :cond_1

    .line 302
    invoke-interface {v4}, Lorg/w3c/dom/Node;->getChildNodes()Lorg/w3c/dom/NodeList;

    move-result-object v7

    invoke-interface {v7, v2}, Lorg/w3c/dom/NodeList;->item(I)Lorg/w3c/dom/Node;

    move-result-object v0

    check-cast v0, Lorg/w3c/dom/Element;

    .line 303
    .local v0, "el":Lorg/w3c/dom/Element;
    const-string v7, "capabilityProfile"

    invoke-interface {v0, v7}, Lorg/w3c/dom/Element;->getElementsByTagName(Ljava/lang/String;)Lorg/w3c/dom/NodeList;

    move-result-object v7

    const/4 v8, 0x0

    invoke-interface {v7, v8}, Lorg/w3c/dom/NodeList;->item(I)Lorg/w3c/dom/Node;

    move-result-object v5

    check-cast v5, Lorg/w3c/dom/Element;

    .line 305
    .local v5, "subEl":Lorg/w3c/dom/Element;
    const-string v7, "capabilityId"

    invoke-virtual {p1, v5, v7}, Lcom/belkin/wemo/cache/cloud/XMLParser;->getValue(Lorg/w3c/dom/Element;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 306
    .local v3, "key":Ljava/lang/String;
    const-string v7, "10500"

    invoke-virtual {v3, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_0

    .line 307
    const-string v7, "ts"

    invoke-virtual {p1, v0, v7}, Lcom/belkin/wemo/cache/cloud/XMLParser;->getValue(Lorg/w3c/dom/Element;Ljava/lang/String;)Ljava/lang/String;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v6

    .line 301
    :cond_0
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 311
    .end local v0    # "el":Lorg/w3c/dom/Element;
    .end local v2    # "i":I
    .end local v3    # "key":Ljava/lang/String;
    .end local v4    # "root":Lorg/w3c/dom/Node;
    .end local v5    # "subEl":Lorg/w3c/dom/Element;
    :catch_0
    move-exception v1

    .line 312
    .local v1, "ex":Ljava/lang/Exception;
    const-string v7, "SDK_CloudRequestGetDeviceList"

    const-string v8, "Exception in extracting last event time stamp"

    invoke-static {v7, v8, v1}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Exception;)V

    .line 314
    .end local v1    # "ex":Ljava/lang/Exception;
    :cond_1
    const-string v7, "SDK_CloudRequestGetDeviceList"

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "extractTimeStamp:: ts--> "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-static {v7, v8}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 315
    return-object v6
.end method

.method private makeAttributeList(Lorg/w3c/dom/Node;)Ljava/lang/String;
    .locals 11
    .param p1, "attrNode"    # Lorg/w3c/dom/Node;

    .prologue
    .line 618
    invoke-interface {p1}, Lorg/w3c/dom/Node;->getChildNodes()Lorg/w3c/dom/NodeList;

    move-result-object v2

    .line 619
    .local v2, "childNodes":Lorg/w3c/dom/NodeList;
    new-instance v0, Ljava/lang/StringBuffer;

    invoke-direct {v0}, Ljava/lang/StringBuffer;-><init>()V

    .line 620
    .local v0, "attributeListSb":Ljava/lang/StringBuffer;
    const-string v8, "{"

    invoke-virtual {v0, v8}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 621
    const/4 v6, 0x0

    .local v6, "k":I
    :goto_0
    invoke-interface {v2}, Lorg/w3c/dom/NodeList;->getLength()I

    move-result v8

    if-ge v6, v8, :cond_4

    .line 624
    invoke-interface {v2, v6}, Lorg/w3c/dom/NodeList;->item(I)Lorg/w3c/dom/Node;

    move-result-object v7

    .line 625
    .local v7, "node":Lorg/w3c/dom/Node;
    instance-of v8, v7, Lorg/w3c/dom/Element;

    if-eqz v8, :cond_3

    .line 627
    invoke-interface {v7}, Lorg/w3c/dom/Node;->getChildNodes()Lorg/w3c/dom/NodeList;

    move-result-object v3

    .line 628
    .local v3, "childNodes1":Lorg/w3c/dom/NodeList;
    const/4 v5, 0x0

    .local v5, "j":I
    :goto_1
    invoke-interface {v3}, Lorg/w3c/dom/NodeList;->getLength()I

    move-result v8

    if-ge v5, v8, :cond_2

    .line 629
    invoke-interface {v3, v5}, Lorg/w3c/dom/NodeList;->item(I)Lorg/w3c/dom/Node;

    move-result-object v1

    .line 632
    .local v1, "cNode":Lorg/w3c/dom/Node;
    instance-of v8, v1, Lorg/w3c/dom/Element;

    if-eqz v8, :cond_1

    .line 633
    invoke-interface {v1}, Lorg/w3c/dom/Node;->getLastChild()Lorg/w3c/dom/Node;

    move-result-object v8

    invoke-interface {v8}, Lorg/w3c/dom/Node;->getTextContent()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v4

    .line 635
    .local v4, "content":Ljava/lang/String;
    invoke-static {v4}, Lcom/belkin/wemo/cache/utils/MoreUtil;->changeAttributes(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    .line 636
    invoke-interface {v1}, Lorg/w3c/dom/Node;->getNodeName()Ljava/lang/String;

    move-result-object v8

    const-string v9, "name"

    invoke-virtual {v8, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_0

    .line 637
    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "\""

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, "\":{"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v0, v8}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 639
    :cond_0
    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "\""

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-interface {v1}, Lorg/w3c/dom/Node;->getNodeName()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, "\":"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, "\""

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, "\","

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v0, v8}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 628
    .end local v4    # "content":Ljava/lang/String;
    :cond_1
    add-int/lit8 v5, v5, 0x1

    goto :goto_1

    .line 644
    .end local v1    # "cNode":Lorg/w3c/dom/Node;
    :cond_2
    invoke-virtual {v0}, Ljava/lang/StringBuffer;->length()I

    move-result v8

    add-int/lit8 v8, v8, -0x1

    invoke-virtual {v0, v8}, Ljava/lang/StringBuffer;->setLength(I)V

    .line 645
    const-string v8, "},"

    invoke-virtual {v0, v8}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 621
    .end local v3    # "childNodes1":Lorg/w3c/dom/NodeList;
    .end local v5    # "j":I
    :cond_3
    add-int/lit8 v6, v6, 0x1

    goto/16 :goto_0

    .line 650
    .end local v7    # "node":Lorg/w3c/dom/Node;
    :cond_4
    invoke-virtual {v0}, Ljava/lang/StringBuffer;->length()I

    move-result v8

    add-int/lit8 v8, v8, -0x1

    invoke-virtual {v0, v8}, Ljava/lang/StringBuffer;->setLength(I)V

    .line 651
    const-string v8, "}"

    invoke-virtual {v0, v8}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 653
    const-string v8, "SDK_CloudRequestGetDeviceList"

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "Attributelist Get :"

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-static {v8, v9}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 654
    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v8

    return-object v8
.end method

.method private static nodeToString(Lorg/w3c/dom/Node;)Ljava/lang/String;
    .locals 5
    .param p0, "node"    # Lorg/w3c/dom/Node;

    .prologue
    .line 605
    new-instance v0, Ljava/io/StringWriter;

    invoke-direct {v0}, Ljava/io/StringWriter;-><init>()V

    .line 607
    .local v0, "sw":Ljava/io/StringWriter;
    :try_start_0
    invoke-static {}, Ljavax/xml/transform/TransformerFactory;->newInstance()Ljavax/xml/transform/TransformerFactory;

    move-result-object v3

    invoke-virtual {v3}, Ljavax/xml/transform/TransformerFactory;->newTransformer()Ljavax/xml/transform/Transformer;

    move-result-object v1

    .line 608
    .local v1, "t":Ljavax/xml/transform/Transformer;
    const-string v3, "omit-xml-declaration"

    const-string v4, "yes"

    invoke-virtual {v1, v3, v4}, Ljavax/xml/transform/Transformer;->setOutputProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 609
    const-string v3, "indent"

    const-string v4, "yes"

    invoke-virtual {v1, v3, v4}, Ljavax/xml/transform/Transformer;->setOutputProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 610
    new-instance v3, Ljavax/xml/transform/dom/DOMSource;

    invoke-direct {v3, p0}, Ljavax/xml/transform/dom/DOMSource;-><init>(Lorg/w3c/dom/Node;)V

    new-instance v4, Ljavax/xml/transform/stream/StreamResult;

    invoke-direct {v4, v0}, Ljavax/xml/transform/stream/StreamResult;-><init>(Ljava/io/Writer;)V

    invoke-virtual {v1, v3, v4}, Ljavax/xml/transform/Transformer;->transform(Ljavax/xml/transform/Source;Ljavax/xml/transform/Result;)V
    :try_end_0
    .catch Ljavax/xml/transform/TransformerException; {:try_start_0 .. :try_end_0} :catch_0

    .line 614
    .end local v1    # "t":Ljavax/xml/transform/Transformer;
    :goto_0
    invoke-virtual {v0}, Ljava/io/StringWriter;->toString()Ljava/lang/String;

    move-result-object v3

    return-object v3

    .line 611
    :catch_0
    move-exception v2

    .line 612
    .local v2, "te":Ljavax/xml/transform/TransformerException;
    sget-object v3, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v4, "nodeToString Transformer Exception"

    invoke-virtual {v3, v4}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    goto :goto_0
.end method

.method private parseErrorCode(Ljava/lang/String;)Ljava/lang/String;
    .locals 8
    .param p1, "response"    # Ljava/lang/String;

    .prologue
    .line 437
    :try_start_0
    new-instance v3, Lcom/belkin/wemo/cache/cloud/XMLParser;

    invoke-direct {v3}, Lcom/belkin/wemo/cache/cloud/XMLParser;-><init>()V

    .line 438
    .local v3, "parser":Lcom/belkin/wemo/cache/cloud/XMLParser;
    invoke-virtual {v3, p1}, Lcom/belkin/wemo/cache/cloud/XMLParser;->getDomElement(Ljava/lang/String;)Lorg/w3c/dom/Document;

    move-result-object v0

    .line 439
    .local v0, "doc":Lorg/w3c/dom/Document;
    const-string v5, "code"

    invoke-interface {v0, v5}, Lorg/w3c/dom/Document;->getElementsByTagName(Ljava/lang/String;)Lorg/w3c/dom/NodeList;

    move-result-object v2

    .line 440
    .local v2, "nl":Lorg/w3c/dom/NodeList;
    const/4 v5, 0x0

    invoke-interface {v2, v5}, Lorg/w3c/dom/NodeList;->item(I)Lorg/w3c/dom/Node;

    move-result-object v5

    invoke-interface {v5}, Lorg/w3c/dom/Node;->getTextContent()Ljava/lang/String;

    move-result-object v4

    .line 441
    .local v4, "resultCode":Ljava/lang/String;
    const-string v5, "SDK_CloudRequestGetDeviceList"

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "parseErrorCode: resultCode: "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 445
    .end local v0    # "doc":Lorg/w3c/dom/Document;
    .end local v2    # "nl":Lorg/w3c/dom/NodeList;
    .end local v3    # "parser":Lcom/belkin/wemo/cache/cloud/XMLParser;
    .end local v4    # "resultCode":Ljava/lang/String;
    :goto_0
    return-object v4

    .line 443
    :catch_0
    move-exception v1

    .line 444
    .local v1, "e":Ljava/lang/Exception;
    const-string v5, "SDK_CloudRequestGetDeviceList"

    const-string v6, "Caught Exception in parseErrorCode: "

    invoke-static {v5, v6, v1}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Exception;)V

    .line 445
    const/4 v4, 0x0

    goto :goto_0
.end method

.method private parseResponse(Ljava/lang/String;)Z
    .locals 29
    .param p1, "response"    # Ljava/lang/String;

    .prologue
    .line 451
    :try_start_0
    const-string v26, "SDK_CloudRequestGetDeviceList"

    new-instance v27, Ljava/lang/StringBuilder;

    invoke-direct/range {v27 .. v27}, Ljava/lang/StringBuilder;-><init>()V

    const-string v28, "in parseResponse :: RESPONSE is---"

    invoke-virtual/range {v27 .. v28}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v27

    move-object/from16 v0, v27

    move-object/from16 v1, p1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v27

    invoke-virtual/range {v27 .. v27}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v27

    invoke-static/range {v26 .. v27}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 452
    new-instance v26, Ljava/util/ArrayList;

    invoke-direct/range {v26 .. v26}, Ljava/util/ArrayList;-><init>()V

    move-object/from16 v0, v26

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/belkin/wemo/cache/cloud/CloudRequestGetDeviceList;->devicesList:Ljava/util/ArrayList;

    .line 453
    new-instance v23, Lcom/belkin/wemo/cache/cloud/XMLParser;

    invoke-direct/range {v23 .. v23}, Lcom/belkin/wemo/cache/cloud/XMLParser;-><init>()V

    .line 454
    .local v23, "parser":Lcom/belkin/wemo/cache/cloud/XMLParser;
    move-object/from16 v0, v23

    move-object/from16 v1, p1

    invoke-virtual {v0, v1}, Lcom/belkin/wemo/cache/cloud/XMLParser;->getDomElement(Ljava/lang/String;)Lorg/w3c/dom/Document;

    move-result-object v11

    .line 455
    .local v11, "doc":Lorg/w3c/dom/Document;
    const-string v26, "device"

    move-object/from16 v0, v26

    invoke-interface {v11, v0}, Lorg/w3c/dom/Document;->getElementsByTagName(Ljava/lang/String;)Lorg/w3c/dom/NodeList;

    move-result-object v22

    .line 456
    .local v22, "nl":Lorg/w3c/dom/NodeList;
    const/4 v9, 0x0

    .line 458
    .local v9, "device":Lcom/belkin/wemo/cache/data/DeviceInformation;
    const/4 v15, 0x0

    .local v15, "i":I
    :goto_0
    invoke-interface/range {v22 .. v22}, Lorg/w3c/dom/NodeList;->getLength()I

    move-result v26

    move/from16 v0, v26

    if-ge v15, v0, :cond_12

    .line 459
    move-object/from16 v0, v22

    invoke-interface {v0, v15}, Lorg/w3c/dom/NodeList;->item(I)Lorg/w3c/dom/Node;

    move-result-object v12

    check-cast v12, Lorg/w3c/dom/Element;

    .line 460
    .local v12, "e":Lorg/w3c/dom/Element;
    const-string v26, "modelCode"

    move-object/from16 v0, v23

    move-object/from16 v1, v26

    invoke-virtual {v0, v12, v1}, Lcom/belkin/wemo/cache/cloud/XMLParser;->getValue(Lorg/w3c/dom/Element;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v19

    .line 462
    .local v19, "modelCode":Ljava/lang/String;
    const-string v26, "SDK_CloudRequestGetDeviceList"

    new-instance v27, Ljava/lang/StringBuilder;

    invoke-direct/range {v27 .. v27}, Ljava/lang/StringBuilder;-><init>()V

    const-string v28, "model code----"

    invoke-virtual/range {v27 .. v28}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v27

    move-object/from16 v0, v27

    move-object/from16 v1, v19

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v27

    invoke-virtual/range {v27 .. v27}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v27

    invoke-static/range {v26 .. v27}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 464
    if-eqz v19, :cond_0

    invoke-virtual/range {v19 .. v19}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v26

    invoke-virtual/range {v26 .. v26}, Ljava/lang/String;->length()I

    move-result v26

    if-gtz v26, :cond_1

    .line 458
    :cond_0
    :goto_1
    add-int/lit8 v15, v15, 0x1

    goto :goto_0

    .line 467
    :cond_1
    const-string v26, "status"

    move-object/from16 v0, v23

    move-object/from16 v1, v26

    invoke-virtual {v0, v12, v1}, Lcom/belkin/wemo/cache/cloud/XMLParser;->getValue(Lorg/w3c/dom/Element;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v24

    .line 468
    .local v24, "status":Ljava/lang/String;
    const-string v26, "SDK_CloudRequestGetDeviceList"

    new-instance v27, Ljava/lang/StringBuilder;

    invoke-direct/range {v27 .. v27}, Ljava/lang/StringBuilder;-><init>()V

    const-string v28, "status----"

    invoke-virtual/range {v27 .. v28}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v27

    move-object/from16 v0, v27

    move-object/from16 v1, v24

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v27

    invoke-virtual/range {v27 .. v27}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v27

    invoke-static/range {v26 .. v27}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 469
    invoke-static/range {v19 .. v19}, Lcom/belkin/wemo/cache/utils/WemoUtils;->isLEDModelCodeSupported(Ljava/lang/String;)Z

    move-result v26

    if-nez v26, :cond_0

    .line 471
    const-string v26, "Bridge"

    move-object/from16 v0, v19

    move-object/from16 v1, v26

    invoke-virtual {v0, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v26

    if-eqz v26, :cond_5

    .line 472
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/wemo/cache/cloud/CloudRequestGetDeviceList;->mBridgeList:Ljava/util/Hashtable;

    move-object/from16 v26, v0

    invoke-virtual/range {v26 .. v26}, Ljava/util/Hashtable;->size()I

    move-result v26

    if-lez v26, :cond_4

    .line 473
    new-instance v6, Lorg/json/JSONObject;

    invoke-direct {v6}, Lorg/json/JSONObject;-><init>()V

    .line 474
    .local v6, "currentBridge":Lorg/json/JSONObject;
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/wemo/cache/cloud/CloudRequestGetDeviceList;->mBridgeList:Ljava/util/Hashtable;

    move-object/from16 v26, v0

    invoke-virtual/range {v26 .. v26}, Ljava/util/Hashtable;->keys()Ljava/util/Enumeration;

    move-result-object v18

    .line 475
    .local v18, "keys":Ljava/util/Enumeration;, "Ljava/util/Enumeration<Ljava/lang/String;>;"
    :goto_2
    invoke-interface/range {v18 .. v18}, Ljava/util/Enumeration;->hasMoreElements()Z

    move-result v26

    if-eqz v26, :cond_2

    .line 476
    invoke-interface/range {v18 .. v18}, Ljava/util/Enumeration;->nextElement()Ljava/lang/Object;

    move-result-object v17

    check-cast v17, Ljava/lang/String;

    .line 477
    .local v17, "key":Ljava/lang/String;
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/wemo/cache/cloud/CloudRequestGetDeviceList;->mBridgeList:Ljava/util/Hashtable;

    move-object/from16 v26, v0

    move-object/from16 v0, v26

    move-object/from16 v1, v17

    invoke-virtual {v0, v1}, Ljava/util/Hashtable;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v6

    .end local v6    # "currentBridge":Lorg/json/JSONObject;
    check-cast v6, Lorg/json/JSONObject;

    .line 478
    .restart local v6    # "currentBridge":Lorg/json/JSONObject;
    goto :goto_2

    .line 479
    .end local v17    # "key":Ljava/lang/String;
    :cond_2
    const-string v26, "status"

    move-object/from16 v0, v26

    invoke-virtual {v6, v0}, Lorg/json/JSONObject;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v26

    const-string v27, "3"

    invoke-virtual/range {v26 .. v27}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v26

    if-eqz v26, :cond_0

    .line 480
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/wemo/cache/cloud/CloudRequestGetDeviceList;->devicesList:Ljava/util/ArrayList;

    move-object/from16 v26, v0

    invoke-virtual/range {v26 .. v26}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v16

    .local v16, "i$":Ljava/util/Iterator;
    :cond_3
    invoke-interface/range {v16 .. v16}, Ljava/util/Iterator;->hasNext()Z

    move-result v26

    if-eqz v26, :cond_4

    invoke-interface/range {v16 .. v16}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Lcom/belkin/wemo/cache/data/DeviceInformation;

    .line 481
    .local v8, "dev":Lcom/belkin/wemo/cache/data/DeviceInformation;
    invoke-virtual {v8}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getUDN()Ljava/lang/String;

    move-result-object v26

    const-string v27, "uniqueId"

    move-object/from16 v0, v27

    invoke-virtual {v6, v0}, Lorg/json/JSONObject;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v27

    invoke-virtual/range {v26 .. v27}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v26

    if-eqz v26, :cond_3

    .line 482
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/wemo/cache/cloud/CloudRequestGetDeviceList;->devicesList:Ljava/util/ArrayList;

    move-object/from16 v26, v0

    move-object/from16 v0, v26

    invoke-virtual {v0, v8}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    .line 490
    .end local v6    # "currentBridge":Lorg/json/JSONObject;
    .end local v8    # "dev":Lcom/belkin/wemo/cache/data/DeviceInformation;
    .end local v16    # "i$":Ljava/util/Iterator;
    .end local v18    # "keys":Ljava/util/Enumeration;, "Ljava/util/Enumeration<Ljava/lang/String;>;"
    :cond_4
    new-instance v5, Lorg/json/JSONObject;

    invoke-direct {v5}, Lorg/json/JSONObject;-><init>()V

    .line 491
    .local v5, "bridgeInfo":Lorg/json/JSONObject;
    const-string v26, "uniqueId"

    const-string v27, "uniqueId"

    move-object/from16 v0, v23

    move-object/from16 v1, v27

    invoke-virtual {v0, v12, v1}, Lcom/belkin/wemo/cache/cloud/XMLParser;->getValue(Lorg/w3c/dom/Element;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v27

    move-object/from16 v0, v26

    move-object/from16 v1, v27

    invoke-virtual {v5, v0, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 492
    const-string v26, "status"

    move-object/from16 v0, v26

    move-object/from16 v1, v24

    invoke-virtual {v5, v0, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 493
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/wemo/cache/cloud/CloudRequestGetDeviceList;->mBridgeList:Ljava/util/Hashtable;

    move-object/from16 v26, v0

    const-string v27, "pluginId"

    move-object/from16 v0, v23

    move-object/from16 v1, v27

    invoke-virtual {v0, v12, v1}, Lcom/belkin/wemo/cache/cloud/XMLParser;->getValue(Lorg/w3c/dom/Element;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v27

    move-object/from16 v0, v26

    move-object/from16 v1, v27

    invoke-virtual {v0, v1, v5}, Ljava/util/Hashtable;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 495
    .end local v5    # "bridgeInfo":Lorg/json/JSONObject;
    :cond_5
    const-string v26, "uniqueId"

    move-object/from16 v0, v23

    move-object/from16 v1, v26

    invoke-virtual {v0, v12, v1}, Lcom/belkin/wemo/cache/cloud/XMLParser;->getValue(Lorg/w3c/dom/Element;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v25

    .line 496
    .local v25, "udn":Ljava/lang/String;
    new-instance v26, Lcom/belkin/wemo/cache/utils/SharePreferences;

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/wemo/cache/cloud/CloudRequestGetDeviceList;->mContext:Landroid/content/Context;

    move-object/from16 v27, v0

    invoke-direct/range {v26 .. v27}, Lcom/belkin/wemo/cache/utils/SharePreferences;-><init>(Landroid/content/Context;)V

    invoke-virtual/range {v26 .. v26}, Lcom/belkin/wemo/cache/utils/SharePreferences;->getHomeId()Ljava/lang/String;

    move-result-object v14

    .line 497
    .local v14, "homeId":Ljava/lang/String;
    sget-object v26, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->devListManager:Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    invoke-virtual/range {v26 .. v26}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->getDeviceInformationList()Ljava/util/Map;

    move-result-object v10

    .line 498
    .local v10, "deviceList":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Lcom/belkin/wemo/cache/data/DeviceInformation;>;"
    if-eqz v10, :cond_6

    .line 499
    move-object/from16 v0, v25

    invoke-interface {v10, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v9

    .end local v9    # "device":Lcom/belkin/wemo/cache/data/DeviceInformation;
    check-cast v9, Lcom/belkin/wemo/cache/data/DeviceInformation;

    .line 500
    .restart local v9    # "device":Lcom/belkin/wemo/cache/data/DeviceInformation;
    :cond_6
    if-nez v9, :cond_7

    .line 501
    const-string v26, "SDK_CloudRequestGetDeviceList"

    const-string v27, "device is null creating new object "

    invoke-static/range {v26 .. v27}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 502
    new-instance v9, Lcom/belkin/wemo/cache/data/DeviceInformation;

    .end local v9    # "device":Lcom/belkin/wemo/cache/data/DeviceInformation;
    const-string v26, "macAddress"

    move-object/from16 v0, v23

    move-object/from16 v1, v26

    invoke-virtual {v0, v12, v1}, Lcom/belkin/wemo/cache/cloud/XMLParser;->getValue(Lorg/w3c/dom/Element;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v26

    const-string v27, "pluginId"

    move-object/from16 v0, v23

    move-object/from16 v1, v27

    invoke-virtual {v0, v12, v1}, Lcom/belkin/wemo/cache/cloud/XMLParser;->getValue(Lorg/w3c/dom/Element;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v27

    move-object/from16 v0, v25

    move-object/from16 v1, v26

    move-object/from16 v2, v27

    invoke-direct {v9, v0, v14, v1, v2}, Lcom/belkin/wemo/cache/data/DeviceInformation;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 505
    .restart local v9    # "device":Lcom/belkin/wemo/cache/data/DeviceInformation;
    const-string v26, "friendlyName"

    move-object/from16 v0, v23

    move-object/from16 v1, v26

    invoke-virtual {v0, v12, v1}, Lcom/belkin/wemo/cache/cloud/XMLParser;->getValue(Lorg/w3c/dom/Element;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v26

    move-object/from16 v0, v26

    invoke-virtual {v9, v0}, Lcom/belkin/wemo/cache/data/DeviceInformation;->setFriendlyName(Ljava/lang/String;)V

    .line 506
    move-object/from16 v0, v19

    invoke-virtual {v9, v0}, Lcom/belkin/wemo/cache/data/DeviceInformation;->setModelCode(Ljava/lang/String;)V

    .line 507
    move-object/from16 v0, v19

    invoke-virtual {v9, v0}, Lcom/belkin/wemo/cache/data/DeviceInformation;->setType(Ljava/lang/String;)V

    .line 508
    sget-object v26, Lcom/belkin/wemo/cache/data/DevicesArray;->productTypeMapping:Ljava/util/HashMap;

    move-object/from16 v0, v26

    move-object/from16 v1, v19

    invoke-virtual {v0, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v26

    check-cast v26, Ljava/lang/String;

    invoke-static/range {v26 .. v26}, Lcom/belkin/wemo/cache/utils/StringUtils;->toLowerCamelCase(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v26

    move-object/from16 v0, v26

    invoke-virtual {v9, v0}, Lcom/belkin/wemo/cache/data/DeviceInformation;->setProductType(Ljava/lang/String;)V

    .line 509
    sget-object v26, Lcom/belkin/wemo/cache/data/DevicesArray;->productNameMapping:Ljava/util/HashMap;

    move-object/from16 v0, v26

    move-object/from16 v1, v19

    invoke-virtual {v0, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v26

    check-cast v26, Ljava/lang/String;

    invoke-static/range {v26 .. v26}, Lcom/belkin/wemo/cache/utils/StringUtils;->toLowerCamelCase(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v26

    move-object/from16 v0, v26

    invoke-virtual {v9, v0}, Lcom/belkin/wemo/cache/data/DeviceInformation;->setProductName(Ljava/lang/String;)V

    .line 513
    :cond_7
    if-eqz v9, :cond_0

    invoke-virtual {v9}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getUDN()Ljava/lang/String;

    move-result-object v26

    invoke-virtual/range {v26 .. v26}, Ljava/lang/String;->length()I

    move-result v26

    if-lez v26, :cond_0

    .line 515
    const/16 v26, 0x1

    move/from16 v0, v26

    invoke-virtual {v9, v0}, Lcom/belkin/wemo/cache/data/DeviceInformation;->setRemote(Z)V

    .line 516
    const-string v26, "fwUpgradeStatus"

    move-object/from16 v0, v23

    move-object/from16 v1, v26

    invoke-virtual {v0, v12, v1}, Lcom/belkin/wemo/cache/cloud/XMLParser;->getValue(Lorg/w3c/dom/Element;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v26

    move-object/from16 v0, v26

    invoke-virtual {v9, v0}, Lcom/belkin/wemo/cache/data/DeviceInformation;->setFwStatus(Ljava/lang/String;)V

    .line 519
    const-string v26, "firmwareVersion"

    move-object/from16 v0, v23

    move-object/from16 v1, v26

    invoke-virtual {v0, v12, v1}, Lcom/belkin/wemo/cache/cloud/XMLParser;->getValue(Lorg/w3c/dom/Element;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v26

    move-object/from16 v0, v26

    invoke-virtual {v9, v0}, Lcom/belkin/wemo/cache/data/DeviceInformation;->setFirmwareVersion(Ljava/lang/String;)V

    .line 521
    const-string v26, "iconVersion"

    move-object/from16 v0, v23

    move-object/from16 v1, v26

    invoke-virtual {v0, v12, v1}, Lcom/belkin/wemo/cache/cloud/XMLParser;->getValue(Lorg/w3c/dom/Element;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v21

    .line 522
    .local v21, "newIconVersion":Ljava/lang/String;
    invoke-virtual {v9}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getIconVersion()Ljava/lang/String;

    move-result-object v26

    move-object/from16 v0, v26

    move-object/from16 v1, v21

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v26

    if-eqz v26, :cond_c

    const/16 v20, 0x0

    .line 523
    .local v20, "needIconUpdate":Z
    :goto_3
    const-string v26, "0"

    move-object/from16 v0, v21

    move-object/from16 v1, v26

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v26

    if-eqz v26, :cond_8

    .line 524
    const-string v26, ""

    move-object/from16 v0, v26

    invoke-virtual {v9, v0}, Lcom/belkin/wemo/cache/data/DeviceInformation;->setIcon(Ljava/lang/String;)V

    .line 525
    const/16 v20, 0x0

    .line 527
    :cond_8
    move/from16 v0, v20

    invoke-virtual {v9, v0}, Lcom/belkin/wemo/cache/data/DeviceInformation;->setNeedIconUpdate(Z)V

    .line 528
    move-object/from16 v0, v21

    invoke-virtual {v9, v0}, Lcom/belkin/wemo/cache/data/DeviceInformation;->setIconVersion(Ljava/lang/String;)V

    .line 529
    const-string v26, "dbVersion"

    move-object/from16 v0, v23

    move-object/from16 v1, v26

    invoke-virtual {v0, v12, v1}, Lcom/belkin/wemo/cache/cloud/XMLParser;->getValue(Lorg/w3c/dom/Element;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    .line 530
    .local v7, "dbVersion":Ljava/lang/String;
    const-string v26, ""

    move-object/from16 v0, v26

    invoke-virtual {v7, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v26

    if-nez v26, :cond_9

    .line 531
    invoke-static {v7}, Ljava/lang/Integer;->valueOf(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v26

    invoke-virtual/range {v26 .. v26}, Ljava/lang/Integer;->intValue()I

    move-result v26

    move/from16 v0, v26

    invoke-virtual {v9, v0}, Lcom/belkin/wemo/cache/data/DeviceInformation;->setRulesDBVersion(I)V

    .line 533
    :cond_9
    invoke-static/range {v24 .. v24}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result v26

    if-nez v26, :cond_d

    .line 536
    :try_start_1
    invoke-static/range {v24 .. v24}, Ljava/lang/Integer;->valueOf(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v26

    invoke-virtual/range {v26 .. v26}, Ljava/lang/Integer;->intValue()I

    move-result v26

    move/from16 v0, v26

    invoke-virtual {v9, v0}, Lcom/belkin/wemo/cache/data/DeviceInformation;->setState(I)V
    :try_end_1
    .catch Ljava/lang/NumberFormatException; {:try_start_1 .. :try_end_1} :catch_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    .line 545
    :goto_4
    :try_start_2
    const-string v26, "statusTS"

    move-object/from16 v0, v23

    move-object/from16 v1, v26

    invoke-virtual {v0, v12, v1}, Lcom/belkin/wemo/cache/cloud/XMLParser;->getValue(Lorg/w3c/dom/Element;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v26

    invoke-static/range {v26 .. v26}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0

    move-result v26

    if-nez v26, :cond_e

    .line 547
    :try_start_3
    const-string v26, "statusTS"

    move-object/from16 v0, v23

    move-object/from16 v1, v26

    invoke-virtual {v0, v12, v1}, Lcom/belkin/wemo/cache/cloud/XMLParser;->getValue(Lorg/w3c/dom/Element;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v26

    invoke-static/range {v26 .. v26}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v26

    move/from16 v0, v26

    invoke-virtual {v9, v0}, Lcom/belkin/wemo/cache/data/DeviceInformation;->setStatusTS(I)V
    :try_end_3
    .catch Ljava/lang/NumberFormatException; {:try_start_3 .. :try_end_3} :catch_2
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_0

    .line 556
    :goto_5
    :try_start_4
    invoke-virtual {v9}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getState()I

    move-result v26

    const/16 v27, 0x3

    move/from16 v0, v26

    move/from16 v1, v27

    if-ne v0, v1, :cond_f

    .line 557
    const/16 v26, 0x1

    move/from16 v0, v26

    invoke-virtual {v9, v0}, Lcom/belkin/wemo/cache/data/DeviceInformation;->setInActive(I)V

    .line 558
    const/16 v26, 0x0

    move/from16 v0, v26

    invoke-virtual {v9, v0}, Lcom/belkin/wemo/cache/data/DeviceInformation;->setIsDiscovered(Z)V

    .line 563
    :goto_6
    invoke-virtual {v9}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getState()I

    move-result v26

    if-nez v26, :cond_10

    .line 564
    const-string v26, "0"

    move-object/from16 v0, v26

    invoke-virtual {v9, v0}, Lcom/belkin/wemo/cache/data/DeviceInformation;->setBinaryState(Ljava/lang/String;)V

    .line 569
    :cond_a
    :goto_7
    const/16 v26, 0x0

    move/from16 v0, v26

    invoke-virtual {v9, v0}, Lcom/belkin/wemo/cache/data/DeviceInformation;->setHide(I)V

    .line 570
    const-string v26, "pluginId"

    move-object/from16 v0, v23

    move-object/from16 v1, v26

    invoke-virtual {v0, v12, v1}, Lcom/belkin/wemo/cache/cloud/XMLParser;->getValue(Lorg/w3c/dom/Element;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v26

    move-object/from16 v0, v26

    invoke-virtual {v9, v0}, Lcom/belkin/wemo/cache/data/DeviceInformation;->setPluginId(Ljava/lang/String;)V

    .line 571
    const-string v26, "friendlyName"

    move-object/from16 v0, v23

    move-object/from16 v1, v26

    invoke-virtual {v0, v12, v1}, Lcom/belkin/wemo/cache/cloud/XMLParser;->getValue(Lorg/w3c/dom/Element;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v26

    move-object/from16 v0, v26

    invoke-virtual {v9, v0}, Lcom/belkin/wemo/cache/data/DeviceInformation;->setFriendlyName(Ljava/lang/String;)V

    .line 572
    invoke-virtual {v9}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getUDN()Ljava/lang/String;

    move-result-object v26

    invoke-static/range {v26 .. v26}, Lcom/belkin/wemo/cache/utils/IsDevice;->Crockpot(Ljava/lang/String;)Z

    move-result v26

    if-nez v26, :cond_b

    .line 573
    const-string v26, "attributeLists"

    move-object/from16 v0, v26

    invoke-interface {v12, v0}, Lorg/w3c/dom/Element;->getElementsByTagName(Ljava/lang/String;)Lorg/w3c/dom/NodeList;

    move-result-object v26

    if-eqz v26, :cond_b

    const-string v26, "attributeLists"

    move-object/from16 v0, v26

    invoke-interface {v12, v0}, Lorg/w3c/dom/Element;->getElementsByTagName(Ljava/lang/String;)Lorg/w3c/dom/NodeList;

    move-result-object v26

    invoke-interface/range {v26 .. v26}, Lorg/w3c/dom/NodeList;->getLength()I

    move-result v26

    if-lez v26, :cond_b

    .line 574
    const-string v26, "attributeLists"

    move-object/from16 v0, v26

    invoke-interface {v12, v0}, Lorg/w3c/dom/Element;->getElementsByTagName(Ljava/lang/String;)Lorg/w3c/dom/NodeList;

    move-result-object v26

    const/16 v27, 0x0

    invoke-interface/range {v26 .. v27}, Lorg/w3c/dom/NodeList;->item(I)Lorg/w3c/dom/Node;

    move-result-object v3

    .line 575
    .local v3, "attrNode":Lorg/w3c/dom/Node;
    if-eqz v3, :cond_b

    .line 576
    new-instance v26, Lcom/belkin/wemo/localsdk/parser/GetAttributeResponseParser;

    invoke-direct/range {v26 .. v26}, Lcom/belkin/wemo/localsdk/parser/GetAttributeResponseParser;-><init>()V

    invoke-static {v3}, Lcom/belkin/wemo/cache/cloud/CloudRequestGetDeviceList;->nodeToString(Lorg/w3c/dom/Node;)Ljava/lang/String;

    move-result-object v27

    invoke-virtual/range {v26 .. v27}, Lcom/belkin/wemo/localsdk/parser/GetAttributeResponseParser;->parseGetAttributeResponse(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v4

    .line 577
    .local v4, "attributes":Lorg/json/JSONObject;
    const-string v26, "SDK_CloudRequestGetDeviceList"

    new-instance v27, Ljava/lang/StringBuilder;

    invoke-direct/range {v27 .. v27}, Ljava/lang/StringBuilder;-><init>()V

    const-string v28, "attributeList"

    invoke-virtual/range {v27 .. v28}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v27

    move-object/from16 v0, v27

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v27

    invoke-virtual/range {v27 .. v27}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v27

    invoke-static/range {v26 .. v27}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 578
    if-eqz v4, :cond_b

    .line 579
    invoke-virtual {v9, v4}, Lcom/belkin/wemo/cache/data/DeviceInformation;->setAttributeList(Lorg/json/JSONObject;)V

    .line 585
    .end local v3    # "attrNode":Lorg/w3c/dom/Node;
    .end local v4    # "attributes":Lorg/json/JSONObject;
    :cond_b
    if-eqz v9, :cond_0

    .line 586
    const-string v26, "SDK_CloudRequestGetDeviceList"

    new-instance v27, Ljava/lang/StringBuilder;

    invoke-direct/range {v27 .. v27}, Ljava/lang/StringBuilder;-><init>()V

    const-string v28, "device added:"

    invoke-virtual/range {v27 .. v28}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v27

    move-object/from16 v0, v27

    invoke-virtual {v0, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v27

    invoke-virtual/range {v27 .. v27}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v27

    invoke-static/range {v26 .. v27}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 587
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/wemo/cache/cloud/CloudRequestGetDeviceList;->devicesList:Ljava/util/ArrayList;

    move-object/from16 v26, v0

    move-object/from16 v0, v26

    invoke-virtual {v0, v9}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_0

    goto/16 :goto_1

    .line 598
    .end local v7    # "dbVersion":Ljava/lang/String;
    .end local v9    # "device":Lcom/belkin/wemo/cache/data/DeviceInformation;
    .end local v10    # "deviceList":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Lcom/belkin/wemo/cache/data/DeviceInformation;>;"
    .end local v11    # "doc":Lorg/w3c/dom/Document;
    .end local v12    # "e":Lorg/w3c/dom/Element;
    .end local v14    # "homeId":Ljava/lang/String;
    .end local v15    # "i":I
    .end local v19    # "modelCode":Ljava/lang/String;
    .end local v20    # "needIconUpdate":Z
    .end local v21    # "newIconVersion":Ljava/lang/String;
    .end local v22    # "nl":Lorg/w3c/dom/NodeList;
    .end local v23    # "parser":Lcom/belkin/wemo/cache/cloud/XMLParser;
    .end local v24    # "status":Ljava/lang/String;
    .end local v25    # "udn":Ljava/lang/String;
    :catch_0
    move-exception v13

    .line 599
    .local v13, "ex":Ljava/lang/Exception;
    invoke-virtual {v13}, Ljava/lang/Exception;->printStackTrace()V

    .line 600
    const/16 v26, 0x0

    .end local v13    # "ex":Ljava/lang/Exception;
    :goto_8
    return v26

    .line 522
    .restart local v9    # "device":Lcom/belkin/wemo/cache/data/DeviceInformation;
    .restart local v10    # "deviceList":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Lcom/belkin/wemo/cache/data/DeviceInformation;>;"
    .restart local v11    # "doc":Lorg/w3c/dom/Document;
    .restart local v12    # "e":Lorg/w3c/dom/Element;
    .restart local v14    # "homeId":Ljava/lang/String;
    .restart local v15    # "i":I
    .restart local v19    # "modelCode":Ljava/lang/String;
    .restart local v21    # "newIconVersion":Ljava/lang/String;
    .restart local v22    # "nl":Lorg/w3c/dom/NodeList;
    .restart local v23    # "parser":Lcom/belkin/wemo/cache/cloud/XMLParser;
    .restart local v24    # "status":Ljava/lang/String;
    .restart local v25    # "udn":Ljava/lang/String;
    :cond_c
    const/16 v20, 0x1

    goto/16 :goto_3

    .line 537
    .restart local v7    # "dbVersion":Ljava/lang/String;
    .restart local v20    # "needIconUpdate":Z
    :catch_1
    move-exception v13

    .line 538
    .local v13, "ex":Ljava/lang/NumberFormatException;
    :try_start_5
    const-string v26, "SDK_CloudRequestGetDeviceList"

    new-instance v27, Ljava/lang/StringBuilder;

    invoke-direct/range {v27 .. v27}, Ljava/lang/StringBuilder;-><init>()V

    const-string v28, "Exception occured in parsing status ..setting status to 3"

    invoke-virtual/range {v27 .. v28}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v27

    move-object/from16 v0, v27

    move-object/from16 v1, v24

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v27

    invoke-virtual/range {v27 .. v27}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v27

    invoke-static/range {v26 .. v27}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 539
    const/16 v26, 0x3

    move/from16 v0, v26

    invoke-virtual {v9, v0}, Lcom/belkin/wemo/cache/data/DeviceInformation;->setState(I)V

    goto/16 :goto_4

    .line 542
    .end local v13    # "ex":Ljava/lang/NumberFormatException;
    :cond_d
    const-string v26, "SDK_CloudRequestGetDeviceList"

    new-instance v27, Ljava/lang/StringBuilder;

    invoke-direct/range {v27 .. v27}, Ljava/lang/StringBuilder;-><init>()V

    const-string v28, "Status is empty"

    invoke-virtual/range {v27 .. v28}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v27

    move-object/from16 v0, v27

    move-object/from16 v1, v24

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v27

    invoke-virtual/range {v27 .. v27}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v27

    invoke-static/range {v26 .. v27}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 543
    const/16 v26, 0x3

    move/from16 v0, v26

    invoke-virtual {v9, v0}, Lcom/belkin/wemo/cache/data/DeviceInformation;->setState(I)V

    goto/16 :goto_4

    .line 548
    :catch_2
    move-exception v13

    .line 549
    .restart local v13    # "ex":Ljava/lang/NumberFormatException;
    invoke-virtual {v13}, Ljava/lang/NumberFormatException;->printStackTrace()V

    goto/16 :goto_5

    .line 552
    .end local v13    # "ex":Ljava/lang/NumberFormatException;
    :cond_e
    const-string v26, "SDK_CloudRequestGetDeviceList"

    const-string v27, "StatusTS is empty"

    invoke-static/range {v26 .. v27}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    goto/16 :goto_5

    .line 560
    :cond_f
    const/16 v26, 0x0

    move/from16 v0, v26

    invoke-virtual {v9, v0}, Lcom/belkin/wemo/cache/data/DeviceInformation;->setInActive(I)V

    .line 561
    const/16 v26, 0x1

    move/from16 v0, v26

    invoke-virtual {v9, v0}, Lcom/belkin/wemo/cache/data/DeviceInformation;->setIsDiscovered(Z)V

    goto/16 :goto_6

    .line 565
    :cond_10
    invoke-virtual {v9}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getState()I

    move-result v26

    const/16 v27, 0x1

    move/from16 v0, v26

    move/from16 v1, v27

    if-ne v0, v1, :cond_11

    .line 566
    const-string v26, "1"

    move-object/from16 v0, v26

    invoke-virtual {v9, v0}, Lcom/belkin/wemo/cache/data/DeviceInformation;->setBinaryState(Ljava/lang/String;)V

    goto/16 :goto_7

    .line 567
    :cond_11
    invoke-virtual {v9}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getState()I

    move-result v26

    const/16 v27, 0x8

    move/from16 v0, v26

    move/from16 v1, v27

    if-ne v0, v1, :cond_a

    .line 568
    const-string v26, "8"

    move-object/from16 v0, v26

    invoke-virtual {v9, v0}, Lcom/belkin/wemo/cache/data/DeviceInformation;->setBinaryState(Ljava/lang/String;)V

    goto/16 :goto_7

    .line 595
    .end local v7    # "dbVersion":Ljava/lang/String;
    .end local v10    # "deviceList":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Lcom/belkin/wemo/cache/data/DeviceInformation;>;"
    .end local v12    # "e":Lorg/w3c/dom/Element;
    .end local v14    # "homeId":Ljava/lang/String;
    .end local v19    # "modelCode":Ljava/lang/String;
    .end local v20    # "needIconUpdate":Z
    .end local v21    # "newIconVersion":Ljava/lang/String;
    .end local v24    # "status":Ljava/lang/String;
    .end local v25    # "udn":Ljava/lang/String;
    :cond_12
    invoke-direct/range {p0 .. p1}, Lcom/belkin/wemo/cache/cloud/CloudRequestGetDeviceList;->searchForZigBee(Ljava/lang/String;)V
    :try_end_5
    .catch Ljava/lang/Exception; {:try_start_5 .. :try_end_5} :catch_0

    .line 596
    const/16 v26, 0x1

    goto/16 :goto_8
.end method

.method public static parseResponseFromCloudByTagName(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lorg/json/JSONArray;
    .locals 11
    .param p0, "response"    # Ljava/lang/String;
    .param p1, "parentNode"    # Ljava/lang/String;
    .param p2, "childNode"    # Ljava/lang/String;

    .prologue
    .line 417
    :try_start_0
    new-instance v5, Lcom/belkin/wemo/cache/cloud/XMLParser;

    invoke-direct {v5}, Lcom/belkin/wemo/cache/cloud/XMLParser;-><init>()V

    .line 418
    .local v5, "parser":Lcom/belkin/wemo/cache/cloud/XMLParser;
    invoke-virtual {v5, p0}, Lcom/belkin/wemo/cache/cloud/XMLParser;->getDomElement(Ljava/lang/String;)Lorg/w3c/dom/Document;

    move-result-object v0

    .line 419
    .local v0, "doc":Lorg/w3c/dom/Document;
    invoke-interface {v0, p1}, Lorg/w3c/dom/Document;->getElementsByTagName(Ljava/lang/String;)Lorg/w3c/dom/NodeList;

    move-result-object v4

    .line 420
    .local v4, "nl":Lorg/w3c/dom/NodeList;
    const/4 v8, 0x0

    invoke-interface {v4, v8}, Lorg/w3c/dom/NodeList;->item(I)Lorg/w3c/dom/Node;

    move-result-object v1

    check-cast v1, Lorg/w3c/dom/Element;

    .line 421
    .local v1, "e":Lorg/w3c/dom/Element;
    invoke-interface {v1, p2}, Lorg/w3c/dom/Element;->getElementsByTagName(Ljava/lang/String;)Lorg/w3c/dom/NodeList;

    move-result-object v3

    .line 422
    .local v3, "n":Lorg/w3c/dom/NodeList;
    new-instance v6, Lorg/json/JSONArray;

    invoke-direct {v6}, Lorg/json/JSONArray;-><init>()V

    .line 423
    .local v6, "resultArray":Lorg/json/JSONArray;
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_0
    invoke-interface {v3}, Lorg/w3c/dom/NodeList;->getLength()I

    move-result v8

    if-ge v2, v8, :cond_0

    .line 424
    invoke-interface {v3, v2}, Lorg/w3c/dom/NodeList;->item(I)Lorg/w3c/dom/Node;

    move-result-object v8

    invoke-interface {v8}, Lorg/w3c/dom/Node;->getTextContent()Ljava/lang/String;

    move-result-object v7

    .line 425
    .local v7, "ssid":Ljava/lang/String;
    invoke-virtual {v6, v7}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;

    .line 423
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 427
    .end local v7    # "ssid":Ljava/lang/String;
    :cond_0
    const-string v8, "SDK_CloudRequestGetDeviceList"

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "parseResponseFromCloudByTagName: resultArray: "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-static {v8, v9}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 431
    .end local v0    # "doc":Lorg/w3c/dom/Document;
    .end local v1    # "e":Lorg/w3c/dom/Element;
    .end local v2    # "i":I
    .end local v3    # "n":Lorg/w3c/dom/NodeList;
    .end local v4    # "nl":Lorg/w3c/dom/NodeList;
    .end local v5    # "parser":Lcom/belkin/wemo/cache/cloud/XMLParser;
    .end local v6    # "resultArray":Lorg/json/JSONArray;
    :goto_1
    return-object v6

    .line 429
    :catch_0
    move-exception v1

    .line 430
    .local v1, "e":Ljava/lang/Exception;
    const-string v8, "SDK_CloudRequestGetDeviceList"

    const-string v9, "Caught Exception in parseResponseFromCloudByTagName: "

    invoke-static {v8, v9, v1}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Exception;)V

    .line 431
    const/4 v6, 0x0

    goto :goto_1
.end method

.method private searchForZigBee(Ljava/lang/String;)V
    .locals 28
    .param p1, "response"    # Ljava/lang/String;

    .prologue
    .line 319
    :try_start_0
    new-instance v23, Lcom/belkin/wemo/cache/cloud/XMLParser;

    invoke-direct/range {v23 .. v23}, Lcom/belkin/wemo/cache/cloud/XMLParser;-><init>()V

    .line 320
    .local v23, "parser":Lcom/belkin/wemo/cache/cloud/XMLParser;
    move-object/from16 v0, v23

    move-object/from16 v1, p1

    invoke-virtual {v0, v1}, Lcom/belkin/wemo/cache/cloud/XMLParser;->getDomElement(Ljava/lang/String;)Lorg/w3c/dom/Document;

    move-result-object v13

    .line 321
    .local v13, "doc":Lorg/w3c/dom/Document;
    const-string v4, "device"

    invoke-interface {v13, v4}, Lorg/w3c/dom/Document;->getElementsByTagName(Ljava/lang/String;)Lorg/w3c/dom/NodeList;

    move-result-object v22

    .line 322
    .local v22, "nl":Lorg/w3c/dom/NodeList;
    sget-object v4, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->devListManager:Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    invoke-virtual {v4}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->getDeviceInformationList()Ljava/util/Map;

    move-result-object v12

    .line 324
    .local v12, "deviceList":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Lcom/belkin/wemo/cache/data/DeviceInformation;>;"
    const/16 v17, 0x0

    .local v17, "i":I
    :goto_0
    invoke-interface/range {v22 .. v22}, Lorg/w3c/dom/NodeList;->getLength()I

    move-result v4

    move/from16 v0, v17

    if-ge v0, v4, :cond_8

    .line 325
    move-object/from16 v0, v22

    move/from16 v1, v17

    invoke-interface {v0, v1}, Lorg/w3c/dom/NodeList;->item(I)Lorg/w3c/dom/Node;

    move-result-object v14

    check-cast v14, Lorg/w3c/dom/Element;

    .line 326
    .local v14, "e":Lorg/w3c/dom/Element;
    const-string v4, "modelCode"

    move-object/from16 v0, v23

    invoke-virtual {v0, v14, v4}, Lcom/belkin/wemo/cache/cloud/XMLParser;->getValue(Lorg/w3c/dom/Element;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v9

    .line 327
    .local v9, "modelCode":Ljava/lang/String;
    invoke-static {v9}, Lcom/belkin/wemo/cache/utils/WemoUtils;->isLEDModelCodeSupported(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_6

    .line 328
    const/4 v2, 0x0

    .line 329
    .local v2, "device":Lcom/belkin/wemo/cache/data/DeviceInformation;
    move-object/from16 v0, p0

    move-object/from16 v1, v23

    invoke-direct {v0, v1, v14}, Lcom/belkin/wemo/cache/cloud/CloudRequestGetDeviceList;->extractCapabilities(Lcom/belkin/wemo/cache/cloud/XMLParser;Lorg/w3c/dom/Element;)Ljava/lang/String;

    move-result-object v6

    .line 330
    .local v6, "capabilities":Ljava/lang/String;
    const-string v20, ""

    .line 331
    .local v20, "ledGroupId":Ljava/lang/String;
    move-object/from16 v0, p0

    move-object/from16 v1, v23

    invoke-direct {v0, v1, v14}, Lcom/belkin/wemo/cache/cloud/CloudRequestGetDeviceList;->extractTimeStamp(Lcom/belkin/wemo/cache/cloud/XMLParser;Lorg/w3c/dom/Element;)Ljava/lang/String;

    move-result-object v19

    .line 332
    .local v19, "lastEventTimeStamp":Ljava/lang/String;
    const-string v21, ""
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1

    .line 334
    .local v21, "ledGroupName":Ljava/lang/String;
    :try_start_1
    const-string v4, "groupProfiles"

    invoke-interface {v14, v4}, Lorg/w3c/dom/Element;->getElementsByTagName(Ljava/lang/String;)Lorg/w3c/dom/NodeList;

    move-result-object v4

    const/4 v7, 0x0

    invoke-interface {v4, v7}, Lorg/w3c/dom/NodeList;->item(I)Lorg/w3c/dom/Node;

    move-result-object v26

    .line 336
    .local v26, "root":Lorg/w3c/dom/Node;
    if-eqz v26, :cond_0

    .line 337
    const-string v4, "SDK_CloudRequestGetDeviceList"

    const-string v7, "Grouped device exist"

    invoke-static {v4, v7}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 338
    const/16 v18, 0x0

    .local v18, "j":I
    :goto_1
    invoke-interface/range {v26 .. v26}, Lorg/w3c/dom/Node;->getChildNodes()Lorg/w3c/dom/NodeList;

    move-result-object v4

    invoke-interface {v4}, Lorg/w3c/dom/NodeList;->getLength()I

    move-result v4

    move/from16 v0, v18

    if-ge v0, v4, :cond_0

    .line 340
    invoke-interface/range {v26 .. v26}, Lorg/w3c/dom/Node;->getChildNodes()Lorg/w3c/dom/NodeList;

    move-result-object v4

    move/from16 v0, v18

    invoke-interface {v4, v0}, Lorg/w3c/dom/NodeList;->item(I)Lorg/w3c/dom/Node;

    move-result-object v15

    check-cast v15, Lorg/w3c/dom/Element;

    .line 342
    .local v15, "el":Lorg/w3c/dom/Element;
    const-string v4, "referenceId"

    move-object/from16 v0, v23

    invoke-virtual {v0, v15, v4}, Lcom/belkin/wemo/cache/cloud/XMLParser;->getValue(Lorg/w3c/dom/Element;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v20

    .line 344
    const-string v4, "groupName"

    move-object/from16 v0, v23

    invoke-virtual {v0, v15, v4}, Lcom/belkin/wemo/cache/cloud/XMLParser;->getValue(Lorg/w3c/dom/Element;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v21

    .line 346
    const-string v4, "SDK_CloudRequestGetDeviceList"

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "ledGroupId:"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    move-object/from16 v0, v20

    invoke-virtual {v7, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, "ledGroupName:"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    move-object/from16 v0, v21

    invoke-virtual {v7, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v4, v7}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    .line 339
    add-int/lit8 v18, v18, 0x1

    goto :goto_1

    .line 349
    .end local v15    # "el":Lorg/w3c/dom/Element;
    .end local v18    # "j":I
    .end local v26    # "root":Lorg/w3c/dom/Node;
    :catch_0
    move-exception v16

    .line 350
    .local v16, "ex":Ljava/lang/Exception;
    :try_start_2
    const-string v4, "SDK_CloudRequestGetDeviceList"

    const-string v7, "Exception while searching for ZB: "

    move-object/from16 v0, v16

    invoke-static {v4, v7, v0}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Exception;)V

    .line 353
    .end local v16    # "ex":Ljava/lang/Exception;
    :cond_0
    const-string v4, "status"

    move-object/from16 v0, v23

    invoke-virtual {v0, v14, v4}, Lcom/belkin/wemo/cache/cloud/XMLParser;->getValue(Lorg/w3c/dom/Element;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v5

    .line 355
    .local v5, "ledState":I
    const-string v4, "macAddress"

    move-object/from16 v0, v23

    invoke-virtual {v0, v14, v4}, Lcom/belkin/wemo/cache/cloud/XMLParser;->getValue(Lorg/w3c/dom/Element;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v27

    .line 356
    .local v27, "uniqueID":Ljava/lang/String;
    const-string v4, "SDK_CloudRequestGetDeviceList"

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, v27

    invoke-virtual {v7, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, " led state:"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v4, v7}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 357
    if-eqz v12, :cond_1

    .line 358
    move-object/from16 v0, v27

    invoke-interface {v12, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    .end local v2    # "device":Lcom/belkin/wemo/cache/data/DeviceInformation;
    check-cast v2, Lcom/belkin/wemo/cache/data/DeviceInformation;

    .line 359
    .restart local v2    # "device":Lcom/belkin/wemo/cache/data/DeviceInformation;
    :cond_1
    if-nez v2, :cond_2

    .line 360
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/belkin/wemo/cache/cloud/CloudRequestGetDeviceList;->mBridgeList:Ljava/util/Hashtable;

    const-string v7, "parentPluginId"

    move-object/from16 v0, v23

    invoke-virtual {v0, v14, v7}, Lcom/belkin/wemo/cache/cloud/XMLParser;->getValue(Lorg/w3c/dom/Element;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v4, v7}, Ljava/util/Hashtable;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lorg/json/JSONObject;

    const-string v7, "uniqueId"

    invoke-virtual {v4, v7}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 361
    .local v3, "bridgeUDN":Ljava/lang/String;
    new-instance v2, Lcom/belkin/wemo/cache/data/DeviceInformation;

    .end local v2    # "device":Lcom/belkin/wemo/cache/data/DeviceInformation;
    const-string v4, "macAddress"

    move-object/from16 v0, v23

    invoke-virtual {v0, v14, v4}, Lcom/belkin/wemo/cache/cloud/XMLParser;->getValue(Lorg/w3c/dom/Element;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    const-string v7, ""

    const-string v8, "firmwareVersion"

    move-object/from16 v0, v23

    invoke-virtual {v0, v14, v8}, Lcom/belkin/wemo/cache/cloud/XMLParser;->getValue(Lorg/w3c/dom/Element;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    const-string v10, "friendlyName"

    move-object/from16 v0, v23

    invoke-virtual {v0, v14, v10}, Lcom/belkin/wemo/cache/cloud/XMLParser;->getValue(Lorg/w3c/dom/Element;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v10

    const-string v11, "pluginId"

    move-object/from16 v0, v23

    invoke-virtual {v0, v14, v11}, Lcom/belkin/wemo/cache/cloud/XMLParser;->getValue(Lorg/w3c/dom/Element;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v11

    invoke-direct/range {v2 .. v11}, Lcom/belkin/wemo/cache/data/DeviceInformation;-><init>(Ljava/lang/String;Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 364
    .restart local v2    # "device":Lcom/belkin/wemo/cache/data/DeviceInformation;
    const-string v4, "productName"

    move-object/from16 v0, v23

    invoke-virtual {v0, v14, v4}, Lcom/belkin/wemo/cache/cloud/XMLParser;->getValue(Lorg/w3c/dom/Element;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v24

    .line 365
    .local v24, "productName":Ljava/lang/String;
    invoke-virtual/range {v24 .. v24}, Ljava/lang/String;->isEmpty()Z

    move-result v4

    if-eqz v4, :cond_7

    .line 366
    sget-object v4, Lcom/belkin/wemo/cache/data/DevicesArray;->productNameMapping:Ljava/util/HashMap;

    invoke-virtual {v2}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getModelCode()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v4, v7}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    invoke-static {v4}, Lcom/belkin/wemo/cache/utils/StringUtils;->toLowerCamelCase(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v2, v4}, Lcom/belkin/wemo/cache/data/DeviceInformation;->setProductName(Ljava/lang/String;)V

    .line 371
    :goto_2
    const-string v4, "productType"

    move-object/from16 v0, v23

    invoke-virtual {v0, v14, v4}, Lcom/belkin/wemo/cache/cloud/XMLParser;->getValue(Lorg/w3c/dom/Element;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v25

    .line 372
    .local v25, "productType":Ljava/lang/String;
    invoke-virtual/range {v25 .. v25}, Ljava/lang/String;->isEmpty()Z

    move-result v4

    if-eqz v4, :cond_9

    .line 373
    sget-object v4, Lcom/belkin/wemo/cache/data/DevicesArray;->productTypeMapping:Ljava/util/HashMap;

    invoke-virtual {v2}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getModelCode()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v4, v7}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    invoke-static {v4}, Lcom/belkin/wemo/cache/utils/StringUtils;->toLowerCamelCase(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v2, v4}, Lcom/belkin/wemo/cache/data/DeviceInformation;->setProductType(Ljava/lang/String;)V

    .line 377
    :goto_3
    move-object/from16 v0, v20

    invoke-virtual {v2, v0}, Lcom/belkin/wemo/cache/data/DeviceInformation;->setGroupID(Ljava/lang/String;)V

    .line 378
    move-object/from16 v0, v27

    invoke-virtual {v2, v0}, Lcom/belkin/wemo/cache/data/DeviceInformation;->setUDN(Ljava/lang/String;)V

    .line 379
    move-object/from16 v0, v27

    invoke-virtual {v2, v0}, Lcom/belkin/wemo/cache/data/DeviceInformation;->setMAC(Ljava/lang/String;)V

    .line 380
    invoke-virtual/range {v21 .. v21}, Ljava/lang/String;->length()I

    move-result v4

    if-lez v4, :cond_a

    move-object/from16 v4, v21

    :goto_4
    invoke-virtual {v2, v4}, Lcom/belkin/wemo/cache/data/DeviceInformation;->setGroupName(Ljava/lang/String;)V

    .line 381
    const-string v4, "manufacturer"

    move-object/from16 v0, v23

    invoke-virtual {v0, v14, v4}, Lcom/belkin/wemo/cache/cloud/XMLParser;->getValue(Lorg/w3c/dom/Element;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-static {v4, v9}, Lcom/belkin/wemo/cache/utils/WemoUtils;->getZigbeeIcon(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v2, v4}, Lcom/belkin/wemo/cache/data/DeviceInformation;->setIcon(Ljava/lang/String;)V

    .line 384
    .end local v3    # "bridgeUDN":Ljava/lang/String;
    .end local v24    # "productName":Ljava/lang/String;
    .end local v25    # "productType":Ljava/lang/String;
    :cond_2
    invoke-virtual/range {v20 .. v20}, Ljava/lang/String;->isEmpty()Z

    move-result v4

    if-nez v4, :cond_3

    .line 385
    const-string v4, "manufacturer"

    move-object/from16 v0, v23

    invoke-virtual {v0, v14, v4}, Lcom/belkin/wemo/cache/cloud/XMLParser;->getValue(Lorg/w3c/dom/Element;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-static {v4, v9}, Lcom/belkin/wemo/cache/utils/WemoUtils;->getZigbeeIcon(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v2, v4}, Lcom/belkin/wemo/cache/data/DeviceInformation;->setGroupIcon(Ljava/lang/String;)V

    .line 387
    :cond_3
    invoke-static/range {v19 .. v19}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v4

    if-nez v4, :cond_4

    .line 388
    invoke-static/range {v19 .. v19}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v4

    invoke-virtual {v2, v4}, Lcom/belkin/wemo/cache/data/DeviceInformation;->setStatusTS(I)V

    .line 389
    :cond_4
    invoke-virtual {v2, v6}, Lcom/belkin/wemo/cache/data/DeviceInformation;->setCapabilities(Ljava/lang/String;)V

    .line 390
    const/4 v4, 0x1

    invoke-virtual {v2, v4}, Lcom/belkin/wemo/cache/data/DeviceInformation;->setRemote(Z)V

    .line 391
    move-object/from16 v0, v20

    invoke-virtual {v2, v0}, Lcom/belkin/wemo/cache/data/DeviceInformation;->setGroupID(Ljava/lang/String;)V

    .line 392
    move-object/from16 v0, v21

    invoke-virtual {v2, v0}, Lcom/belkin/wemo/cache/data/DeviceInformation;->setGroupName(Ljava/lang/String;)V

    .line 393
    const-string v4, "pluginId"

    move-object/from16 v0, v23

    invoke-virtual {v0, v14, v4}, Lcom/belkin/wemo/cache/cloud/XMLParser;->getValue(Lorg/w3c/dom/Element;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v2, v4}, Lcom/belkin/wemo/cache/data/DeviceInformation;->setPluginId(Ljava/lang/String;)V

    .line 394
    const-string v4, "friendlyName"

    move-object/from16 v0, v23

    invoke-virtual {v0, v14, v4}, Lcom/belkin/wemo/cache/cloud/XMLParser;->getValue(Lorg/w3c/dom/Element;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v2, v4}, Lcom/belkin/wemo/cache/data/DeviceInformation;->setFriendlyName(Ljava/lang/String;)V

    .line 395
    const-string v4, "fwUpgradeStatus"

    move-object/from16 v0, v23

    invoke-virtual {v0, v14, v4}, Lcom/belkin/wemo/cache/cloud/XMLParser;->getValue(Lorg/w3c/dom/Element;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v2, v4}, Lcom/belkin/wemo/cache/data/DeviceInformation;->setFwStatus(Ljava/lang/String;)V

    .line 396
    const-string v4, "firmwareVersion"

    move-object/from16 v0, v23

    invoke-virtual {v0, v14, v4}, Lcom/belkin/wemo/cache/cloud/XMLParser;->getValue(Lorg/w3c/dom/Element;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v2, v4}, Lcom/belkin/wemo/cache/data/DeviceInformation;->setFirmwareVersion(Ljava/lang/String;)V

    .line 397
    const/4 v4, 0x3

    if-eq v5, v4, :cond_5

    const/4 v4, 0x4

    if-ne v5, v4, :cond_b

    .line 399
    :cond_5
    const/4 v4, 0x1

    invoke-virtual {v2, v4}, Lcom/belkin/wemo/cache/data/DeviceInformation;->setInActive(I)V

    .line 400
    const/4 v4, 0x0

    invoke-virtual {v2, v4}, Lcom/belkin/wemo/cache/data/DeviceInformation;->setIsDiscovered(Z)V

    .line 406
    :goto_5
    const-string v4, "SDK_CloudRequestGetDeviceList"

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "device added:"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v4, v7}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 407
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/belkin/wemo/cache/cloud/CloudRequestGetDeviceList;->devicesList:Ljava/util/ArrayList;

    invoke-virtual {v4, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 324
    .end local v2    # "device":Lcom/belkin/wemo/cache/data/DeviceInformation;
    .end local v5    # "ledState":I
    .end local v6    # "capabilities":Ljava/lang/String;
    .end local v19    # "lastEventTimeStamp":Ljava/lang/String;
    .end local v20    # "ledGroupId":Ljava/lang/String;
    .end local v21    # "ledGroupName":Ljava/lang/String;
    .end local v27    # "uniqueID":Ljava/lang/String;
    :cond_6
    add-int/lit8 v17, v17, 0x1

    goto/16 :goto_0

    .line 368
    .restart local v2    # "device":Lcom/belkin/wemo/cache/data/DeviceInformation;
    .restart local v3    # "bridgeUDN":Ljava/lang/String;
    .restart local v5    # "ledState":I
    .restart local v6    # "capabilities":Ljava/lang/String;
    .restart local v19    # "lastEventTimeStamp":Ljava/lang/String;
    .restart local v20    # "ledGroupId":Ljava/lang/String;
    .restart local v21    # "ledGroupName":Ljava/lang/String;
    .restart local v24    # "productName":Ljava/lang/String;
    .restart local v27    # "uniqueID":Ljava/lang/String;
    :cond_7
    invoke-static/range {v24 .. v24}, Lcom/belkin/wemo/cache/utils/StringUtils;->toLowerCamelCase(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v2, v4}, Lcom/belkin/wemo/cache/data/DeviceInformation;->setProductName(Ljava/lang/String;)V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_1

    goto/16 :goto_2

    .line 410
    .end local v2    # "device":Lcom/belkin/wemo/cache/data/DeviceInformation;
    .end local v3    # "bridgeUDN":Ljava/lang/String;
    .end local v5    # "ledState":I
    .end local v6    # "capabilities":Ljava/lang/String;
    .end local v9    # "modelCode":Ljava/lang/String;
    .end local v12    # "deviceList":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Lcom/belkin/wemo/cache/data/DeviceInformation;>;"
    .end local v13    # "doc":Lorg/w3c/dom/Document;
    .end local v14    # "e":Lorg/w3c/dom/Element;
    .end local v17    # "i":I
    .end local v19    # "lastEventTimeStamp":Ljava/lang/String;
    .end local v20    # "ledGroupId":Ljava/lang/String;
    .end local v21    # "ledGroupName":Ljava/lang/String;
    .end local v22    # "nl":Lorg/w3c/dom/NodeList;
    .end local v23    # "parser":Lcom/belkin/wemo/cache/cloud/XMLParser;
    .end local v24    # "productName":Ljava/lang/String;
    .end local v27    # "uniqueID":Ljava/lang/String;
    :catch_1
    move-exception v14

    .line 411
    .local v14, "e":Ljava/lang/Exception;
    invoke-virtual {v14}, Ljava/lang/Exception;->printStackTrace()V

    .line 413
    .end local v14    # "e":Ljava/lang/Exception;
    :cond_8
    return-void

    .line 375
    .restart local v2    # "device":Lcom/belkin/wemo/cache/data/DeviceInformation;
    .restart local v3    # "bridgeUDN":Ljava/lang/String;
    .restart local v5    # "ledState":I
    .restart local v6    # "capabilities":Ljava/lang/String;
    .restart local v9    # "modelCode":Ljava/lang/String;
    .restart local v12    # "deviceList":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Lcom/belkin/wemo/cache/data/DeviceInformation;>;"
    .restart local v13    # "doc":Lorg/w3c/dom/Document;
    .local v14, "e":Lorg/w3c/dom/Element;
    .restart local v17    # "i":I
    .restart local v19    # "lastEventTimeStamp":Ljava/lang/String;
    .restart local v20    # "ledGroupId":Ljava/lang/String;
    .restart local v21    # "ledGroupName":Ljava/lang/String;
    .restart local v22    # "nl":Lorg/w3c/dom/NodeList;
    .restart local v23    # "parser":Lcom/belkin/wemo/cache/cloud/XMLParser;
    .restart local v24    # "productName":Ljava/lang/String;
    .restart local v25    # "productType":Ljava/lang/String;
    .restart local v27    # "uniqueID":Ljava/lang/String;
    :cond_9
    :try_start_3
    invoke-static/range {v25 .. v25}, Lcom/belkin/wemo/cache/utils/StringUtils;->toLowerCamelCase(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v2, v4}, Lcom/belkin/wemo/cache/data/DeviceInformation;->setProductType(Ljava/lang/String;)V

    goto/16 :goto_3

    .line 380
    :cond_a
    const-string v4, ""

    goto/16 :goto_4

    .line 402
    .end local v3    # "bridgeUDN":Ljava/lang/String;
    .end local v24    # "productName":Ljava/lang/String;
    .end local v25    # "productType":Ljava/lang/String;
    :cond_b
    const/4 v4, 0x0

    invoke-virtual {v2, v4}, Lcom/belkin/wemo/cache/data/DeviceInformation;->setInActive(I)V

    .line 403
    const/4 v4, 0x1

    invoke-virtual {v2, v4}, Lcom/belkin/wemo/cache/data/DeviceInformation;->setIsDiscovered(Z)V
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_1

    goto :goto_5
.end method


# virtual methods
.method public getAdditionalHeaders()Ljava/util/Map;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    .line 684
    const/4 v0, 0x0

    return-object v0
.end method

.method public getBody()Ljava/lang/String;
    .locals 1

    .prologue
    .line 122
    const/4 v0, 0x0

    return-object v0
.end method

.method public getDevicesList()Ljava/util/ArrayList;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/ArrayList",
            "<",
            "Lcom/belkin/wemo/cache/data/DeviceInformation;",
            ">;"
        }
    .end annotation

    .prologue
    .line 662
    iget-object v0, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestGetDeviceList;->devicesList:Ljava/util/ArrayList;

    return-object v0
.end method

.method public getFileByteArray()[B
    .locals 1

    .prologue
    .line 669
    const/4 v0, 0x0

    return-object v0
.end method

.method public getRequestMethod()I
    .locals 1

    .prologue
    .line 103
    const/4 v0, 0x2

    return v0
.end method

.method public getTimeout()I
    .locals 1

    .prologue
    .line 108
    iget v0, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestGetDeviceList;->TIMEOUT:I

    return v0
.end method

.method public getTimeoutLimit()I
    .locals 1

    .prologue
    .line 113
    const v0, 0x9c40

    return v0
.end method

.method public getURL()Ljava/lang/String;
    .locals 1

    .prologue
    .line 117
    iget-object v0, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestGetDeviceList;->cloudURL:Ljava/lang/String;

    return-object v0
.end method

.method public getUploadFileName()Ljava/lang/String;
    .locals 1

    .prologue
    .line 674
    const/4 v0, 0x0

    return-object v0
.end method

.method public isAuthHeaderRequired()Z
    .locals 1

    .prologue
    .line 679
    const/4 v0, 0x1

    return v0
.end method

.method public requestComplete(ZI[B)V
    .locals 24
    .param p1, "success"    # Z
    .param p2, "statusCode"    # I
    .param p3, "resp"    # [B

    .prologue
    .line 127
    const/4 v14, 0x0

    .line 128
    .local v14, "response":Ljava/lang/String;
    const/4 v10, 0x0

    .line 129
    .local v10, "errorCode":Ljava/lang/String;
    invoke-static {}, Lcom/belkin/wemo/cache/utils/Locks;->getInstance()Lcom/belkin/wemo/cache/utils/Locks;

    move-result-object v19

    sget-object v20, Lcom/belkin/wemo/cache/utils/Locks;->LOCK_GET_DEVICE_LIST:Ljava/lang/Integer;

    invoke-virtual/range {v19 .. v20}, Lcom/belkin/wemo/cache/utils/Locks;->unsetLock(Ljava/lang/Integer;)V

    .line 130
    const-string v19, "SDK_CloudRequestGetDeviceList"

    new-instance v20, Ljava/lang/StringBuilder;

    invoke-direct/range {v20 .. v20}, Ljava/lang/StringBuilder;-><init>()V

    const-string v21, "in requestComplete :: Response success is :: "

    invoke-virtual/range {v20 .. v21}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v20

    move-object/from16 v0, v20

    move/from16 v1, p1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v20

    const-string v21, " :: statusCode is :: "

    invoke-virtual/range {v20 .. v21}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v20

    move-object/from16 v0, v20

    move/from16 v1, p2

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v20

    invoke-virtual/range {v20 .. v20}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v20

    invoke-static/range {v19 .. v20}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 132
    if-eqz p3, :cond_0

    .line 133
    :try_start_0
    new-instance v15, Ljava/lang/String;

    const-string v19, "UTF-8"

    move-object/from16 v0, p3

    move-object/from16 v1, v19

    invoke-direct {v15, v0, v1}, Ljava/lang/String;-><init>([BLjava/lang/String;)V
    :try_end_0
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_0 .. :try_end_0} :catch_0

    .end local v14    # "response":Ljava/lang/String;
    .local v15, "response":Ljava/lang/String;
    move-object v14, v15

    .line 137
    .end local v15    # "response":Ljava/lang/String;
    .restart local v14    # "response":Ljava/lang/String;
    :cond_0
    :goto_0
    const-string v19, "SDK_CloudRequestGetDeviceList"

    new-instance v20, Ljava/lang/StringBuilder;

    invoke-direct/range {v20 .. v20}, Ljava/lang/StringBuilder;-><init>()V

    const-string v21, ":: cloud response of getDeviceList is :: "

    invoke-virtual/range {v20 .. v21}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v20

    invoke-static {v14}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v21

    invoke-virtual/range {v20 .. v21}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v20

    invoke-virtual/range {v20 .. v20}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v20

    invoke-static/range {v19 .. v20}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 138
    if-eqz p1, :cond_9

    .line 139
    const/16 v19, 0x0

    sput-boolean v19, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->firstRemoteCall:Z

    .line 140
    move-object/from16 v0, p0

    invoke-direct {v0, v14}, Lcom/belkin/wemo/cache/cloud/CloudRequestGetDeviceList;->parseResponse(Ljava/lang/String;)Z

    move-result v16

    .line 141
    .local v16, "responseParse":Z
    if-eqz v16, :cond_8

    .line 142
    const-string v19, "SDK_CloudRequestGetDeviceList"

    new-instance v20, Ljava/lang/StringBuilder;

    invoke-direct/range {v20 .. v20}, Ljava/lang/StringBuilder;-><init>()V

    const-string v21, "Response in success case : deviceList size ::  "

    invoke-virtual/range {v20 .. v21}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v20

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/wemo/cache/cloud/CloudRequestGetDeviceList;->devicesList:Ljava/util/ArrayList;

    move-object/from16 v21, v0

    invoke-virtual/range {v21 .. v21}, Ljava/util/ArrayList;->size()I

    move-result v21

    invoke-virtual/range {v20 .. v21}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v20

    invoke-virtual/range {v20 .. v20}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v20

    invoke-static/range {v19 .. v20}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 143
    const-string v19, "SDK_CloudRequestGetDeviceList"

    const-string v20, "printing parsed devicelist in cloudGetAPI  "

    invoke-static/range {v19 .. v20}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 144
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/wemo/cache/cloud/CloudRequestGetDeviceList;->devicesList:Ljava/util/ArrayList;

    move-object/from16 v19, v0

    invoke-virtual/range {v19 .. v19}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v11

    .local v11, "i$":Ljava/util/Iterator;
    :goto_1
    invoke-interface {v11}, Ljava/util/Iterator;->hasNext()Z

    move-result v19

    if-eqz v19, :cond_1

    invoke-interface {v11}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lcom/belkin/wemo/cache/data/DeviceInformation;

    .line 145
    .local v6, "dev":Lcom/belkin/wemo/cache/data/DeviceInformation;
    const-string v19, "SDK_CloudRequestGetDeviceList"

    new-instance v20, Ljava/lang/StringBuilder;

    invoke-direct/range {v20 .. v20}, Ljava/lang/StringBuilder;-><init>()V

    const-string v21, "dev udn:"

    invoke-virtual/range {v20 .. v21}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v20

    invoke-virtual {v6}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getUDN()Ljava/lang/String;

    move-result-object v21

    invoke-virtual/range {v20 .. v21}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v20

    const-string v21, " isDiscovered:"

    invoke-virtual/range {v20 .. v21}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v20

    invoke-virtual {v6}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getIsDiscovered()Z

    move-result v21

    invoke-virtual/range {v20 .. v21}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v20

    invoke-virtual/range {v20 .. v20}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v20

    invoke-static/range {v19 .. v20}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_1

    .line 134
    .end local v6    # "dev":Lcom/belkin/wemo/cache/data/DeviceInformation;
    .end local v11    # "i$":Ljava/util/Iterator;
    .end local v16    # "responseParse":Z
    :catch_0
    move-exception v9

    .line 135
    .local v9, "e1":Ljava/io/UnsupportedEncodingException;
    const-string v19, "SDK_CloudRequestGetDeviceList"

    const-string v20, " ::Exception during encoding of cloud getDeviceList response :: "

    move-object/from16 v0, v19

    move-object/from16 v1, v20

    invoke-static {v0, v1, v9}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Exception;)V

    goto/16 :goto_0

    .line 150
    .end local v9    # "e1":Ljava/io/UnsupportedEncodingException;
    .restart local v11    # "i$":Ljava/util/Iterator;
    .restart local v16    # "responseParse":Z
    :cond_1
    const-string v19, "groupSSIDs"

    const-string v20, "ssid"

    move-object/from16 v0, v19

    move-object/from16 v1, v20

    invoke-static {v14, v0, v1}, Lcom/belkin/wemo/cache/cloud/CloudRequestGetDeviceList;->parseResponseFromCloudByTagName(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v17

    .line 151
    .local v17, "ssidArray":Lorg/json/JSONArray;
    const-string v19, "groupArpMacs"

    const-string v20, "arpMac"

    move-object/from16 v0, v19

    move-object/from16 v1, v20

    invoke-static {v14, v0, v1}, Lcom/belkin/wemo/cache/cloud/CloudRequestGetDeviceList;->parseResponseFromCloudByTagName(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v4

    .line 152
    .local v4, "arpArray":Lorg/json/JSONArray;
    const-string v19, "SDK_CloudRequestGetDeviceList"

    new-instance v20, Ljava/lang/StringBuilder;

    invoke-direct/range {v20 .. v20}, Ljava/lang/StringBuilder;-><init>()V

    const-string v21, "setDeviceListFromCloud: ssidArray: "

    invoke-virtual/range {v20 .. v21}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v20

    move-object/from16 v0, v20

    move-object/from16 v1, v17

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v20

    const-string v21, " arpArray: "

    invoke-virtual/range {v20 .. v21}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v20

    move-object/from16 v0, v20

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v20

    invoke-virtual/range {v20 .. v20}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v20

    invoke-static/range {v19 .. v20}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 153
    if-eqz v17, :cond_2

    if-eqz v4, :cond_2

    .line 154
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/wemo/cache/cloud/CloudRequestGetDeviceList;->mDevMgr:Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    move-object/from16 v19, v0

    move-object/from16 v0, v19

    move-object/from16 v1, v17

    invoke-virtual {v0, v1, v4}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->setArpMacSSIDsFromCloud(Lorg/json/JSONArray;Lorg/json/JSONArray;)V

    .line 156
    :cond_2
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/wemo/cache/cloud/CloudRequestGetDeviceList;->devicesList:Ljava/util/ArrayList;

    move-object/from16 v19, v0

    invoke-virtual/range {v19 .. v19}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v11

    :goto_2
    invoke-interface {v11}, Ljava/util/Iterator;->hasNext()Z

    move-result v19

    if-eqz v19, :cond_7

    invoke-interface {v11}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lcom/belkin/wemo/cache/data/DeviceInformation;

    .line 157
    .restart local v6    # "dev":Lcom/belkin/wemo/cache/data/DeviceInformation;
    const-string v19, "RemoteMode:"

    new-instance v20, Ljava/lang/StringBuilder;

    invoke-direct/range {v20 .. v20}, Ljava/lang/StringBuilder;-><init>()V

    const-string v21, " adding dev "

    invoke-virtual/range {v20 .. v21}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v20

    invoke-virtual {v6}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getUDN()Ljava/lang/String;

    move-result-object v21

    invoke-virtual/range {v20 .. v21}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v20

    const-string v21, "  "

    invoke-virtual/range {v20 .. v21}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v20

    invoke-virtual {v6}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getIsDiscovered()Z

    move-result v21

    invoke-virtual/range {v20 .. v21}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v20

    invoke-virtual/range {v20 .. v20}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v20

    invoke-static/range {v19 .. v20}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 158
    invoke-virtual {v6}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getUDN()Ljava/lang/String;

    move-result-object v19

    invoke-static/range {v19 .. v19}, Lcom/belkin/wemo/cache/utils/IsDevice;->Crockpot(Ljava/lang/String;)Z

    move-result v19

    if-eqz v19, :cond_3

    .line 159
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/wemo/cache/cloud/CloudRequestGetDeviceList;->devicesArray:Lcom/belkin/wemo/cache/data/DevicesArray;

    move-object/from16 v19, v0

    invoke-virtual {v6}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getUDN()Ljava/lang/String;

    move-result-object v20

    invoke-virtual/range {v19 .. v20}, Lcom/belkin/wemo/cache/data/DevicesArray;->getDeviceInformation(Ljava/lang/String;)Lcom/belkin/wemo/cache/data/DeviceInformation;

    move-result-object v7

    .line 160
    .local v7, "devInfo":Lcom/belkin/wemo/cache/data/DeviceInformation;
    if-eqz v7, :cond_3

    .line 161
    invoke-virtual {v7}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getAttributeList()Lorg/json/JSONObject;

    move-result-object v5

    .line 162
    .local v5, "attributeList":Lorg/json/JSONObject;
    const-string v19, "SDK_CloudRequestGetDeviceList"

    new-instance v20, Ljava/lang/StringBuilder;

    invoke-direct/range {v20 .. v20}, Ljava/lang/StringBuilder;-><init>()V

    const-string v21, "attributeList"

    invoke-virtual/range {v20 .. v21}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v20

    move-object/from16 v0, v20

    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v20

    invoke-virtual/range {v20 .. v20}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v20

    invoke-static/range {v19 .. v20}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 165
    :try_start_1
    const-string v19, "mode"

    move-object/from16 v0, v19

    invoke-virtual {v5, v0}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v13

    .line 166
    .local v13, "modeObj":Lorg/json/JSONObject;
    const-string v19, "value"

    invoke-virtual {v6}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getState()I

    move-result v20

    move-object/from16 v0, v19

    move/from16 v1, v20

    invoke-virtual {v13, v0, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    .line 167
    const-string v19, "mode"

    move-object/from16 v0, v19

    invoke-virtual {v5, v0, v13}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 168
    invoke-virtual {v6, v5}, Lcom/belkin/wemo/cache/data/DeviceInformation;->setAttributeList(Lorg/json/JSONObject;)V
    :try_end_1
    .catch Lorg/json/JSONException; {:try_start_1 .. :try_end_1} :catch_1

    .line 176
    .end local v5    # "attributeList":Lorg/json/JSONObject;
    .end local v7    # "devInfo":Lcom/belkin/wemo/cache/data/DeviceInformation;
    .end local v13    # "modeObj":Lorg/json/JSONObject;
    :cond_3
    :goto_3
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/wemo/cache/cloud/CloudRequestGetDeviceList;->devicesArray:Lcom/belkin/wemo/cache/data/DevicesArray;

    move-object/from16 v19, v0

    invoke-virtual {v6}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getNeedIconUpdate()Z

    move-result v20

    move-object/from16 v0, v19

    move/from16 v1, v20

    invoke-virtual {v0, v6, v1}, Lcom/belkin/wemo/cache/data/DevicesArray;->updateDeviceCache(Lcom/belkin/wemo/cache/data/DeviceInformation;Z)V

    .line 177
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/wemo/cache/cloud/CloudRequestGetDeviceList;->devicesArray:Lcom/belkin/wemo/cache/data/DevicesArray;

    move-object/from16 v19, v0

    invoke-virtual {v6}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getUDN()Ljava/lang/String;

    move-result-object v20

    const/16 v21, 0x1

    invoke-virtual/range {v19 .. v21}, Lcom/belkin/wemo/cache/data/DevicesArray;->setDeviceDiscovered(Ljava/lang/String;Z)V

    .line 178
    const/16 v18, 0x0

    .line 181
    .local v18, "tempDevice":Lcom/belkin/wemo/cache/data/DeviceInformation;
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/wemo/cache/cloud/CloudRequestGetDeviceList;->mDevMgr:Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    move-object/from16 v19, v0

    invoke-virtual {v6}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getUDN()Ljava/lang/String;

    move-result-object v20

    const/16 v21, 0x0

    const/16 v22, 0x1

    const/16 v23, 0x0

    invoke-virtual/range {v19 .. v23}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->getDeviceFromDBByUDN(Ljava/lang/String;ZZZ)Lcom/belkin/wemo/cache/data/DeviceInformation;

    move-result-object v18

    .line 182
    if-eqz v18, :cond_5

    .line 183
    invoke-virtual/range {v18 .. v18}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getID()I

    move-result v19

    move/from16 v0, v19

    invoke-virtual {v6, v0}, Lcom/belkin/wemo/cache/data/DeviceInformation;->setID(I)V

    .line 185
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/wemo/cache/cloud/CloudRequestGetDeviceList;->cacheManager:Lcom/belkin/wemo/cache/CacheManager;

    move-object/from16 v19, v0

    const/16 v20, 0x0

    const/16 v21, 0x1

    const/16 v22, 0x1

    move-object/from16 v0, v19

    move/from16 v1, v20

    move/from16 v2, v21

    move/from16 v3, v22

    invoke-virtual {v0, v6, v1, v2, v3}, Lcom/belkin/wemo/cache/CacheManager;->updateDB(Lcom/belkin/wemo/cache/data/DeviceInformation;ZZZ)V

    .line 186
    const/16 v18, 0x0

    .line 200
    :cond_4
    :goto_4
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/wemo/cache/cloud/CloudRequestGetDeviceList;->mDevMgr:Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    move-object/from16 v19, v0

    invoke-virtual {v6}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getUDN()Ljava/lang/String;

    move-result-object v20

    const/16 v21, 0x0

    const/16 v22, 0x0

    const/16 v23, 0x1

    invoke-virtual/range {v19 .. v23}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->getDeviceFromDBByUDN(Ljava/lang/String;ZZZ)Lcom/belkin/wemo/cache/data/DeviceInformation;

    move-result-object v18

    .line 201
    if-eqz v18, :cond_6

    .line 202
    invoke-virtual/range {v18 .. v18}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getID()I

    move-result v19

    move/from16 v0, v19

    invoke-virtual {v6, v0}, Lcom/belkin/wemo/cache/data/DeviceInformation;->setID(I)V

    .line 204
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/wemo/cache/cloud/CloudRequestGetDeviceList;->cacheManager:Lcom/belkin/wemo/cache/CacheManager;

    move-object/from16 v19, v0

    const/16 v20, 0x0

    const/16 v21, 0x0

    const/16 v22, 0x1

    move-object/from16 v0, v19

    move/from16 v1, v20

    move/from16 v2, v21

    move/from16 v3, v22

    invoke-virtual {v0, v6, v1, v2, v3}, Lcom/belkin/wemo/cache/CacheManager;->updateDB(Lcom/belkin/wemo/cache/data/DeviceInformation;ZZZ)V

    .line 205
    const-string v19, "RemoteMode:"

    new-instance v20, Ljava/lang/StringBuilder;

    invoke-direct/range {v20 .. v20}, Ljava/lang/StringBuilder;-><init>()V

    const-string v21, " sending update notification "

    invoke-virtual/range {v20 .. v21}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v20

    invoke-virtual {v6}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getUDN()Ljava/lang/String;

    move-result-object v21

    invoke-virtual/range {v20 .. v21}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v20

    const-string v21, " name:"

    invoke-virtual/range {v20 .. v21}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v20

    invoke-virtual {v6}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getFriendlyName()Ljava/lang/String;

    move-result-object v21

    invoke-virtual/range {v20 .. v21}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v20

    invoke-virtual/range {v20 .. v20}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v20

    invoke-static/range {v19 .. v20}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 206
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/wemo/cache/cloud/CloudRequestGetDeviceList;->mDevMgr:Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    move-object/from16 v19, v0

    const-string v20, "update"

    const-string v21, ""

    invoke-virtual {v6}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getUDN()Ljava/lang/String;

    move-result-object v22

    invoke-virtual/range {v19 .. v22}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->sendNotification(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    goto/16 :goto_2

    .line 169
    .end local v18    # "tempDevice":Lcom/belkin/wemo/cache/data/DeviceInformation;
    .restart local v5    # "attributeList":Lorg/json/JSONObject;
    .restart local v7    # "devInfo":Lcom/belkin/wemo/cache/data/DeviceInformation;
    :catch_1
    move-exception v8

    .line 171
    .local v8, "e":Lorg/json/JSONException;
    invoke-virtual {v8}, Lorg/json/JSONException;->printStackTrace()V

    goto/16 :goto_3

    .line 189
    .end local v5    # "attributeList":Lorg/json/JSONObject;
    .end local v7    # "devInfo":Lcom/belkin/wemo/cache/data/DeviceInformation;
    .end local v8    # "e":Lorg/json/JSONException;
    .restart local v18    # "tempDevice":Lcom/belkin/wemo/cache/data/DeviceInformation;
    :cond_5
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/wemo/cache/cloud/CloudRequestGetDeviceList;->cacheManager:Lcom/belkin/wemo/cache/CacheManager;

    move-object/from16 v19, v0

    const/16 v20, 0x0

    const/16 v21, 0x1

    const/16 v22, 0x0

    move-object/from16 v0, v19

    move/from16 v1, v20

    move/from16 v2, v21

    move/from16 v3, v22

    invoke-virtual {v0, v6, v1, v2, v3}, Lcom/belkin/wemo/cache/CacheManager;->addDeviceToDB(Lcom/belkin/wemo/cache/data/DeviceInformation;ZZZ)Z

    .line 192
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/wemo/cache/cloud/CloudRequestGetDeviceList;->mDevMgr:Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    move-object/from16 v19, v0

    invoke-virtual {v6}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getUDN()Ljava/lang/String;

    move-result-object v20

    const/16 v21, 0x1

    const/16 v22, 0x0

    const/16 v23, 0x0

    invoke-virtual/range {v19 .. v23}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->getDeviceFromDBByUDN(Ljava/lang/String;ZZZ)Lcom/belkin/wemo/cache/data/DeviceInformation;

    move-result-object v19

    if-nez v19, :cond_4

    .line 194
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/wemo/cache/cloud/CloudRequestGetDeviceList;->mDevMgr:Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    move-object/from16 v19, v0

    invoke-virtual {v6}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getUDN()Ljava/lang/String;

    move-result-object v20

    const/16 v21, 0x1

    const/16 v22, 0x0

    invoke-virtual/range {v19 .. v22}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->addDeviceWithOnlyUDNToLocalOrRemoteTable(Ljava/lang/String;ZZ)V

    goto/16 :goto_4

    .line 208
    :cond_6
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/wemo/cache/cloud/CloudRequestGetDeviceList;->cacheManager:Lcom/belkin/wemo/cache/CacheManager;

    move-object/from16 v19, v0

    const/16 v20, 0x0

    const/16 v21, 0x0

    const/16 v22, 0x1

    move-object/from16 v0, v19

    move/from16 v1, v20

    move/from16 v2, v21

    move/from16 v3, v22

    invoke-virtual {v0, v6, v1, v2, v3}, Lcom/belkin/wemo/cache/CacheManager;->addDeviceToDB(Lcom/belkin/wemo/cache/data/DeviceInformation;ZZZ)Z

    .line 209
    const-string v19, "RemoteMode:"

    new-instance v20, Ljava/lang/StringBuilder;

    invoke-direct/range {v20 .. v20}, Ljava/lang/StringBuilder;-><init>()V

    const-string v21, " sending add notification "

    invoke-virtual/range {v20 .. v21}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v20

    invoke-virtual {v6}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getUDN()Ljava/lang/String;

    move-result-object v21

    invoke-virtual/range {v20 .. v21}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v20

    const-string v21, " name:"

    invoke-virtual/range {v20 .. v21}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v20

    invoke-virtual {v6}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getFriendlyName()Ljava/lang/String;

    move-result-object v21

    invoke-virtual/range {v20 .. v21}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v20

    invoke-virtual/range {v20 .. v20}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v20

    invoke-static/range {v19 .. v20}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 210
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/wemo/cache/cloud/CloudRequestGetDeviceList;->mDevMgr:Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    move-object/from16 v19, v0

    const-string v20, "add"

    const-string v21, ""

    invoke-virtual {v6}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getUDN()Ljava/lang/String;

    move-result-object v22

    invoke-virtual/range {v19 .. v22}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->sendNotification(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    goto/16 :goto_2

    .line 221
    .end local v6    # "dev":Lcom/belkin/wemo/cache/data/DeviceInformation;
    .end local v18    # "tempDevice":Lcom/belkin/wemo/cache/data/DeviceInformation;
    :cond_7
    new-instance v12, Lcom/belkin/wemo/cache/utils/MoreUtil;

    invoke-direct {v12}, Lcom/belkin/wemo/cache/utils/MoreUtil;-><init>()V

    .line 222
    .local v12, "mU":Lcom/belkin/wemo/cache/utils/MoreUtil;
    const-string v19, "cache.db"

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/wemo/cache/cloud/CloudRequestGetDeviceList;->mContext:Landroid/content/Context;

    move-object/from16 v20, v0

    move-object/from16 v0, v19

    move-object/from16 v1, v20

    invoke-virtual {v12, v0, v1}, Lcom/belkin/wemo/cache/utils/MoreUtil;->copyDbToDownloadDirectory(Ljava/lang/String;Landroid/content/Context;)V

    .line 229
    .end local v4    # "arpArray":Lorg/json/JSONArray;
    .end local v11    # "i$":Ljava/util/Iterator;
    .end local v12    # "mU":Lcom/belkin/wemo/cache/utils/MoreUtil;
    .end local v17    # "ssidArray":Lorg/json/JSONArray;
    :cond_8
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/wemo/cache/cloud/CloudRequestGetDeviceList;->mWemoAppRecovery:Lcom/belkin/wemo/cache/utils/WemoAppRecovery;

    move-object/from16 v19, v0

    const/16 v20, 0x1

    move/from16 v0, v20

    move-object/from16 v1, v19

    iput-boolean v0, v1, Lcom/belkin/wemo/cache/utils/WemoAppRecovery;->consistentFlag:Z

    .line 230
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/wemo/cache/cloud/CloudRequestGetDeviceList;->mWemoAppRecovery:Lcom/belkin/wemo/cache/utils/WemoAppRecovery;

    move-object/from16 v19, v0

    const/16 v20, 0x0

    move/from16 v0, v20

    move-object/from16 v1, v19

    iput v0, v1, Lcom/belkin/wemo/cache/utils/WemoAppRecovery;->counter:I

    .line 231
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/wemo/cache/cloud/CloudRequestGetDeviceList;->mWemoAppRecovery:Lcom/belkin/wemo/cache/utils/WemoAppRecovery;

    move-object/from16 v19, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/wemo/cache/cloud/CloudRequestGetDeviceList;->mWemoAppRecovery:Lcom/belkin/wemo/cache/utils/WemoAppRecovery;

    move-object/from16 v20, v0

    invoke-virtual/range {v19 .. v20}, Lcom/belkin/wemo/cache/utils/WemoAppRecovery;->setAppRecoveryData(Lcom/belkin/wemo/cache/utils/WemoAppRecovery;)V

    .line 232
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/wemo/cache/cloud/CloudRequestGetDeviceList;->mDevMgr:Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    move-object/from16 v19, v0

    invoke-virtual/range {v19 .. v19}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->makeCloudRequestForUpdateDeviceList()V

    .line 253
    .end local v16    # "responseParse":Z
    :goto_5
    invoke-static {}, Lcom/belkin/wemo/cache/utils/Locks;->getInstance()Lcom/belkin/wemo/cache/utils/Locks;

    move-result-object v19

    sget-object v20, Lcom/belkin/wemo/cache/utils/Locks;->LOCK_GET_DEVICE_LIST:Ljava/lang/Integer;

    invoke-virtual/range {v19 .. v20}, Lcom/belkin/wemo/cache/utils/Locks;->unsetLock(Ljava/lang/Integer;)V

    .line 254
    return-void

    .line 234
    :cond_9
    const/16 v19, 0x193

    move/from16 v0, p2

    move/from16 v1, v19

    if-eq v0, v1, :cond_a

    const/16 v19, 0x190

    move/from16 v0, p2

    move/from16 v1, v19

    if-ne v0, v1, :cond_e

    .line 235
    :cond_a
    move-object/from16 v0, p0

    invoke-direct {v0, v14}, Lcom/belkin/wemo/cache/cloud/CloudRequestGetDeviceList;->parseErrorCode(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v10

    .line 236
    invoke-static {v10}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v19

    if-nez v19, :cond_e

    const-string v19, "ERR_002"

    move-object/from16 v0, v19

    invoke-virtual {v10, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v19

    if-eqz v19, :cond_b

    const/16 v19, 0x193

    move/from16 v0, p2

    move/from16 v1, v19

    if-eq v0, v1, :cond_d

    :cond_b
    const-string v19, "WEMO_415"

    move-object/from16 v0, v19

    invoke-virtual {v10, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v19

    if-nez v19, :cond_c

    const-string v19, "WEMO_414"

    move-object/from16 v0, v19

    invoke-virtual {v10, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v19

    if-eqz v19, :cond_e

    :cond_c
    const/16 v19, 0x190

    move/from16 v0, p2

    move/from16 v1, v19

    if-ne v0, v1, :cond_e

    .line 237
    :cond_d
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/wemo/cache/cloud/CloudRequestGetDeviceList;->mWemoAppRecovery:Lcom/belkin/wemo/cache/utils/WemoAppRecovery;

    move-object/from16 v19, v0

    const/16 v20, 0x0

    move/from16 v0, v20

    move-object/from16 v1, v19

    iput-boolean v0, v1, Lcom/belkin/wemo/cache/utils/WemoAppRecovery;->consistentFlag:Z

    .line 238
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/wemo/cache/cloud/CloudRequestGetDeviceList;->mWemoAppRecovery:Lcom/belkin/wemo/cache/utils/WemoAppRecovery;

    move-object/from16 v19, v0

    move-object/from16 v0, v19

    iget v0, v0, Lcom/belkin/wemo/cache/utils/WemoAppRecovery;->counter:I

    move/from16 v20, v0

    add-int/lit8 v20, v20, 0x1

    move/from16 v0, v20

    move-object/from16 v1, v19

    iput v0, v1, Lcom/belkin/wemo/cache/utils/WemoAppRecovery;->counter:I

    .line 239
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/wemo/cache/cloud/CloudRequestGetDeviceList;->mWemoAppRecovery:Lcom/belkin/wemo/cache/utils/WemoAppRecovery;

    move-object/from16 v19, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/wemo/cache/cloud/CloudRequestGetDeviceList;->mWemoAppRecovery:Lcom/belkin/wemo/cache/utils/WemoAppRecovery;

    move-object/from16 v20, v0

    invoke-virtual/range {v19 .. v20}, Lcom/belkin/wemo/cache/utils/WemoAppRecovery;->setAppRecoveryData(Lcom/belkin/wemo/cache/utils/WemoAppRecovery;)V

    .line 244
    :cond_e
    const-string v19, "SDK_CloudRequestGetDeviceList"

    const-string v20, "DEVICELIST is NULL"

    invoke-static/range {v19 .. v20}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    goto/16 :goto_5
.end method
