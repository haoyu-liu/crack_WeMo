.class public Lcom/belkin/wemo/cache/cloud/CloudRequestUpdateDeviceList;
.super Ljava/lang/Object;
.source "CloudRequestUpdateDeviceList.java"

# interfaces
.implements Lcom/belkin/wemo/cache/cloud/CloudRequestInterface;


# static fields
.field private static final KEY_ATTRIBUTE_LISTS:Ljava/lang/String; = "attributeLists"

.field private static final KEY_CAPABILITIES:Ljava/lang/String; = "capabilities"

.field private static final KEY_CAPABILITY_ID:Ljava/lang/String; = "capabilityId"

.field private static final KEY_CAPABILITY_PROFILE:Ljava/lang/String; = "capabilityProfile"

.field private static final KEY_CAPABILITY_ROOT:Ljava/lang/String; = "deviceCapabilityProfiles"

.field private static final KEY_CAPABILITY_VALUE:Ljava/lang/String; = "currentValue"

.field private static final KEY_COOKED_TIME:Ljava/lang/String; = "cookedTime"

.field private static final KEY_DEVICE_TAG:Ljava/lang/String; = "device"

.field private static final KEY_EVENT_DURATION:Ljava/lang/String; = "eventDuration"

.field private static final KEY_FRIENDLY_NAME:Ljava/lang/String; = "friendlyName"

.field private static final KEY_FW_STATUS:Ljava/lang/String; = "fwUpgradeStatus"

.field private static final KEY_FW_VERSION:Ljava/lang/String; = "firmwareVersion"

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

.field private static final KEY_SERIAL_NUMBER:Ljava/lang/String; = "serialNumber"

.field private static final KEY_STATUS:Ljava/lang/String; = "status"

.field private static final KEY_STATUSTS:Ljava/lang/String; = "statusTS"

.field private static final KEY_STATUS_TIMESTAMP:Ljava/lang/String; = "statusTS"

.field private static final KEY_UDN:Ljava/lang/String; = "uniqueId"

.field private static final TAG:Ljava/lang/String; = "SDK_CloudRequestUpdateDeviceList"


# instance fields
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

.field private final endURL:Ljava/lang/String;

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


# direct methods
.method public constructor <init>(Lcom/belkin/wemo/cache/devicelist/DeviceListManager;Landroid/content/Context;)V
    .locals 3
    .param p1, "devMgr"    # Lcom/belkin/wemo/cache/devicelist/DeviceListManager;
    .param p2, "context"    # Landroid/content/Context;

    .prologue
    .line 93
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 66
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

    iput-object v1, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestUpdateDeviceList;->URL:Ljava/lang/String;

    .line 68
    const-string v1, "/remoteDataSynchronization"

    iput-object v1, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestUpdateDeviceList;->endURL:Ljava/lang/String;

    .line 70
    const v1, 0x9c40

    iput v1, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestUpdateDeviceList;->TIMEOUT_LIMIT:I

    .line 73
    const/16 v1, 0x4e20

    iput v1, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestUpdateDeviceList;->TIMEOUT:I

    .line 74
    const/4 v1, 0x0

    iput-object v1, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestUpdateDeviceList;->devicesList:Ljava/util/ArrayList;

    .line 94
    const-string v1, "SDK_CloudRequestUpdateDeviceList"

    const-string v2, "CloudRequestUpdateDeviceList Called"

    invoke-static {v1, v2}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 95
    iput-object p2, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestUpdateDeviceList;->mContext:Landroid/content/Context;

    .line 96
    iput-object p1, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestUpdateDeviceList;->mDevMgr:Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    .line 97
    new-instance v0, Lcom/belkin/wemo/cache/cloud/CloudAuth;

    iget-object v1, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestUpdateDeviceList;->mContext:Landroid/content/Context;

    invoke-direct {v0, v1}, Lcom/belkin/wemo/cache/cloud/CloudAuth;-><init>(Landroid/content/Context;)V

    .line 98
    .local v0, "cloudAuth":Lcom/belkin/wemo/cache/cloud/CloudAuth;
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v2, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestUpdateDeviceList;->URL:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v0}, Lcom/belkin/wemo/cache/cloud/CloudAuth;->getHomeID()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "/remoteDataSynchronization"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestUpdateDeviceList;->cloudURL:Ljava/lang/String;

    .line 99
    new-instance v1, Ljava/util/Hashtable;

    invoke-direct {v1}, Ljava/util/Hashtable;-><init>()V

    iput-object v1, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestUpdateDeviceList;->mBridgeList:Ljava/util/Hashtable;

    .line 100
    invoke-static {p2}, Lcom/belkin/wemo/cache/CacheManager;->getInstance(Landroid/content/Context;)Lcom/belkin/wemo/cache/CacheManager;

    move-result-object v1

    iput-object v1, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestUpdateDeviceList;->cacheManager:Lcom/belkin/wemo/cache/CacheManager;

    .line 101
    invoke-static {p2}, Lcom/belkin/wemo/cache/data/DevicesArray;->getInstance(Landroid/content/Context;)Lcom/belkin/wemo/cache/data/DevicesArray;

    move-result-object v1

    iput-object v1, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestUpdateDeviceList;->devicesArray:Lcom/belkin/wemo/cache/data/DevicesArray;

    .line 102
    return-void
.end method

.method private extractCapabilities(Lcom/belkin/wemo/cache/cloud/XMLParser;Lorg/w3c/dom/Element;I)Ljava/lang/String;
    .locals 12
    .param p1, "parser"    # Lcom/belkin/wemo/cache/cloud/XMLParser;
    .param p2, "e"    # Lorg/w3c/dom/Element;
    .param p3, "ledState"    # I

    .prologue
    .line 309
    new-instance v6, Lorg/json/JSONObject;

    invoke-direct {v6}, Lorg/json/JSONObject;-><init>()V

    .line 311
    .local v6, "res":Lorg/json/JSONObject;
    :try_start_0
    const-string v10, "capabilities"

    invoke-interface {p2, v10}, Lorg/w3c/dom/Element;->getElementsByTagName(Ljava/lang/String;)Lorg/w3c/dom/NodeList;

    move-result-object v10

    const/4 v11, 0x0

    invoke-interface {v10, v11}, Lorg/w3c/dom/NodeList;->item(I)Lorg/w3c/dom/Node;

    move-result-object v0

    .line 312
    .local v0, "capabilitiesRoot":Lorg/w3c/dom/Node;
    if-eqz v0, :cond_2

    .line 313
    const/4 v4, 0x0

    .local v4, "i":I
    :goto_0
    invoke-interface {v0}, Lorg/w3c/dom/Node;->getChildNodes()Lorg/w3c/dom/NodeList;

    move-result-object v10

    invoke-interface {v10}, Lorg/w3c/dom/NodeList;->getLength()I

    move-result v10

    if-ge v4, v10, :cond_5

    .line 314
    invoke-interface {v0}, Lorg/w3c/dom/Node;->getChildNodes()Lorg/w3c/dom/NodeList;

    move-result-object v10

    invoke-interface {v10, v4}, Lorg/w3c/dom/NodeList;->item(I)Lorg/w3c/dom/Node;

    move-result-object v2

    check-cast v2, Lorg/w3c/dom/Element;

    .line 315
    .local v2, "el":Lorg/w3c/dom/Element;
    const-string v10, "capabilityId"

    invoke-virtual {p1, v2, v10}, Lcom/belkin/wemo/cache/cloud/XMLParser;->getValue(Lorg/w3c/dom/Element;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    .line 316
    .local v5, "key":Ljava/lang/String;
    const-string v10, "currentValue"

    invoke-virtual {p1, v2, v10}, Lcom/belkin/wemo/cache/cloud/XMLParser;->getValue(Lorg/w3c/dom/Element;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v9

    .line 317
    .local v9, "value":Ljava/lang/String;
    sget-object v10, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->capabalityProfileList:Ljava/util/LinkedHashMap;

    if-nez v10, :cond_0

    .line 318
    invoke-static {}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->updateCapabilityProfileTable()V

    .line 320
    :cond_0
    sget-object v10, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->capabalityProfileList:Ljava/util/LinkedHashMap;

    invoke-virtual {v10, v5}, Ljava/util/LinkedHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    .line 321
    .local v1, "capabilityName":Ljava/lang/String;
    const-string v10, "10006"

    invoke-virtual {v5, v10}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v10

    if-eqz v10, :cond_1

    invoke-static {v9}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v10

    if-eqz v10, :cond_1

    .line 322
    invoke-static {p3}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v9

    .line 324
    :cond_1
    invoke-virtual {v6, v1, v9}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 313
    add-int/lit8 v4, v4, 0x1

    goto :goto_0

    .line 329
    .end local v1    # "capabilityName":Ljava/lang/String;
    .end local v2    # "el":Lorg/w3c/dom/Element;
    .end local v4    # "i":I
    .end local v5    # "key":Ljava/lang/String;
    .end local v9    # "value":Ljava/lang/String;
    :cond_2
    const-string v10, "deviceCapabilityProfiles"

    invoke-interface {p2, v10}, Lorg/w3c/dom/Element;->getElementsByTagName(Ljava/lang/String;)Lorg/w3c/dom/NodeList;

    move-result-object v10

    const/4 v11, 0x0

    invoke-interface {v10, v11}, Lorg/w3c/dom/NodeList;->item(I)Lorg/w3c/dom/Node;

    move-result-object v7

    .line 330
    .local v7, "root":Lorg/w3c/dom/Node;
    if-eqz v7, :cond_5

    .line 331
    const/4 v4, 0x0

    .restart local v4    # "i":I
    :goto_1
    invoke-interface {v7}, Lorg/w3c/dom/Node;->getChildNodes()Lorg/w3c/dom/NodeList;

    move-result-object v10

    invoke-interface {v10}, Lorg/w3c/dom/NodeList;->getLength()I

    move-result v10

    if-ge v4, v10, :cond_5

    .line 332
    invoke-interface {v7}, Lorg/w3c/dom/Node;->getChildNodes()Lorg/w3c/dom/NodeList;

    move-result-object v10

    invoke-interface {v10, v4}, Lorg/w3c/dom/NodeList;->item(I)Lorg/w3c/dom/Node;

    move-result-object v2

    check-cast v2, Lorg/w3c/dom/Element;

    .line 333
    .restart local v2    # "el":Lorg/w3c/dom/Element;
    const-string v10, "capabilityProfile"

    invoke-interface {v2, v10}, Lorg/w3c/dom/Element;->getElementsByTagName(Ljava/lang/String;)Lorg/w3c/dom/NodeList;

    move-result-object v10

    const/4 v11, 0x0

    invoke-interface {v10, v11}, Lorg/w3c/dom/NodeList;->item(I)Lorg/w3c/dom/Node;

    move-result-object v8

    check-cast v8, Lorg/w3c/dom/Element;

    .line 335
    .local v8, "subEl":Lorg/w3c/dom/Element;
    const-string v10, "capabilityId"

    invoke-virtual {p1, v8, v10}, Lcom/belkin/wemo/cache/cloud/XMLParser;->getValue(Lorg/w3c/dom/Element;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    .line 336
    .restart local v5    # "key":Ljava/lang/String;
    const-string v10, "currentValue"

    invoke-virtual {p1, v2, v10}, Lcom/belkin/wemo/cache/cloud/XMLParser;->getValue(Lorg/w3c/dom/Element;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v9

    .line 337
    .restart local v9    # "value":Ljava/lang/String;
    sget-object v10, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->capabalityProfileList:Ljava/util/LinkedHashMap;

    if-nez v10, :cond_3

    .line 338
    invoke-static {}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->updateCapabilityProfileTable()V

    .line 340
    :cond_3
    sget-object v10, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->capabalityProfileList:Ljava/util/LinkedHashMap;

    invoke-virtual {v10, v5}, Ljava/util/LinkedHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    .line 341
    .restart local v1    # "capabilityName":Ljava/lang/String;
    const-string v10, "10006"

    invoke-virtual {v5, v10}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v10

    if-eqz v10, :cond_4

    invoke-static {v9}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v10

    if-eqz v10, :cond_4

    .line 342
    invoke-static {p3}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v9

    .line 344
    :cond_4
    invoke-virtual {v6, v1, v9}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 331
    add-int/lit8 v4, v4, 0x1

    goto :goto_1

    .line 348
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

    .line 349
    .local v3, "ex":Ljava/lang/Exception;
    invoke-virtual {v3}, Ljava/lang/Exception;->printStackTrace()V

    .line 351
    .end local v3    # "ex":Ljava/lang/Exception;
    :cond_5
    invoke-virtual {v6}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v10

    return-object v10
.end method

.method private extractTimeStamp(Lcom/belkin/wemo/cache/cloud/XMLParser;Lorg/w3c/dom/Element;)Ljava/lang/String;
    .locals 10
    .param p1, "parser"    # Lcom/belkin/wemo/cache/cloud/XMLParser;
    .param p2, "e"    # Lorg/w3c/dom/Element;

    .prologue
    .line 355
    const-string v6, ""

    .line 357
    .local v6, "ts":Ljava/lang/String;
    :try_start_0
    const-string v7, "deviceCapabilityProfiles"

    invoke-interface {p2, v7}, Lorg/w3c/dom/Element;->getElementsByTagName(Ljava/lang/String;)Lorg/w3c/dom/NodeList;

    move-result-object v7

    const/4 v8, 0x0

    invoke-interface {v7, v8}, Lorg/w3c/dom/NodeList;->item(I)Lorg/w3c/dom/Node;

    move-result-object v4

    .line 358
    .local v4, "root":Lorg/w3c/dom/Node;
    if-eqz v4, :cond_1

    .line 359
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_0
    invoke-interface {v4}, Lorg/w3c/dom/Node;->getChildNodes()Lorg/w3c/dom/NodeList;

    move-result-object v7

    invoke-interface {v7}, Lorg/w3c/dom/NodeList;->getLength()I

    move-result v7

    if-ge v2, v7, :cond_1

    .line 360
    invoke-interface {v4}, Lorg/w3c/dom/Node;->getChildNodes()Lorg/w3c/dom/NodeList;

    move-result-object v7

    invoke-interface {v7, v2}, Lorg/w3c/dom/NodeList;->item(I)Lorg/w3c/dom/Node;

    move-result-object v0

    check-cast v0, Lorg/w3c/dom/Element;

    .line 361
    .local v0, "el":Lorg/w3c/dom/Element;
    const-string v7, "capabilityProfile"

    invoke-interface {v0, v7}, Lorg/w3c/dom/Element;->getElementsByTagName(Ljava/lang/String;)Lorg/w3c/dom/NodeList;

    move-result-object v7

    const/4 v8, 0x0

    invoke-interface {v7, v8}, Lorg/w3c/dom/NodeList;->item(I)Lorg/w3c/dom/Node;

    move-result-object v5

    check-cast v5, Lorg/w3c/dom/Element;

    .line 363
    .local v5, "subEl":Lorg/w3c/dom/Element;
    const-string v7, "capabilityId"

    invoke-virtual {p1, v5, v7}, Lcom/belkin/wemo/cache/cloud/XMLParser;->getValue(Lorg/w3c/dom/Element;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 364
    .local v3, "key":Ljava/lang/String;
    const-string v7, "10500"

    invoke-virtual {v3, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_0

    .line 365
    const-string v7, "ts"

    invoke-virtual {p1, v0, v7}, Lcom/belkin/wemo/cache/cloud/XMLParser;->getValue(Lorg/w3c/dom/Element;Ljava/lang/String;)Ljava/lang/String;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v6

    .line 359
    :cond_0
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 369
    .end local v0    # "el":Lorg/w3c/dom/Element;
    .end local v2    # "i":I
    .end local v3    # "key":Ljava/lang/String;
    .end local v4    # "root":Lorg/w3c/dom/Node;
    .end local v5    # "subEl":Lorg/w3c/dom/Element;
    :catch_0
    move-exception v1

    .line 370
    .local v1, "ex":Ljava/lang/Exception;
    const-string v7, "SDK_CloudRequestUpdateDeviceList"

    const-string v8, "Exception in extracting last event time stamp"

    invoke-static {v7, v8, v1}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Exception;)V

    .line 372
    .end local v1    # "ex":Ljava/lang/Exception;
    :cond_1
    const-string v7, "SDK_CloudRequestUpdateDeviceList"

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

    .line 373
    return-object v6
.end method

.method private getIconVersion(Ljava/lang/String;)I
    .locals 2
    .param p1, "versionStr"    # Ljava/lang/String;

    .prologue
    .line 696
    const-string v1, "0"

    invoke-static {v1}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v0

    .line 697
    .local v0, "defaultIconVersion":I
    invoke-direct {p0, p1}, Lcom/belkin/wemo/cache/cloud/CloudRequestUpdateDeviceList;->isEmptyOrNull(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 704
    .end local v0    # "defaultIconVersion":I
    :goto_0
    return v0

    .line 702
    .restart local v0    # "defaultIconVersion":I
    :cond_0
    :try_start_0
    invoke-static {p1}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result v0

    goto :goto_0

    .line 703
    :catch_0
    move-exception v1

    goto :goto_0
.end method

.method private isEmptyOrNull(Ljava/lang/String;)Z
    .locals 1
    .param p1, "str"    # Ljava/lang/String;

    .prologue
    .line 709
    if-eqz p1, :cond_0

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v0

    if-nez v0, :cond_1

    .line 711
    :cond_0
    const/4 v0, 0x1

    .line 713
    :goto_0
    return v0

    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method

.method private makeAttributeList(Lorg/w3c/dom/Node;)Ljava/lang/String;
    .locals 11
    .param p1, "attrNode"    # Lorg/w3c/dom/Node;

    .prologue
    .line 729
    invoke-interface {p1}, Lorg/w3c/dom/Node;->getChildNodes()Lorg/w3c/dom/NodeList;

    move-result-object v2

    .line 730
    .local v2, "childNodes":Lorg/w3c/dom/NodeList;
    new-instance v0, Ljava/lang/StringBuffer;

    invoke-direct {v0}, Ljava/lang/StringBuffer;-><init>()V

    .line 731
    .local v0, "attributeListSb":Ljava/lang/StringBuffer;
    const-string v8, "{"

    invoke-virtual {v0, v8}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 732
    const/4 v6, 0x0

    .local v6, "k":I
    :goto_0
    invoke-interface {v2}, Lorg/w3c/dom/NodeList;->getLength()I

    move-result v8

    if-ge v6, v8, :cond_4

    .line 735
    invoke-interface {v2, v6}, Lorg/w3c/dom/NodeList;->item(I)Lorg/w3c/dom/Node;

    move-result-object v7

    .line 736
    .local v7, "node":Lorg/w3c/dom/Node;
    instance-of v8, v7, Lorg/w3c/dom/Element;

    if-eqz v8, :cond_3

    .line 738
    invoke-interface {v7}, Lorg/w3c/dom/Node;->getChildNodes()Lorg/w3c/dom/NodeList;

    move-result-object v3

    .line 739
    .local v3, "childNodes1":Lorg/w3c/dom/NodeList;
    const/4 v5, 0x0

    .local v5, "j":I
    :goto_1
    invoke-interface {v3}, Lorg/w3c/dom/NodeList;->getLength()I

    move-result v8

    if-ge v5, v8, :cond_2

    .line 740
    invoke-interface {v3, v5}, Lorg/w3c/dom/NodeList;->item(I)Lorg/w3c/dom/Node;

    move-result-object v1

    .line 743
    .local v1, "cNode":Lorg/w3c/dom/Node;
    instance-of v8, v1, Lorg/w3c/dom/Element;

    if-eqz v8, :cond_1

    .line 744
    invoke-interface {v1}, Lorg/w3c/dom/Node;->getLastChild()Lorg/w3c/dom/Node;

    move-result-object v8

    invoke-interface {v8}, Lorg/w3c/dom/Node;->getTextContent()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v4

    .line 746
    .local v4, "content":Ljava/lang/String;
    invoke-static {v4}, Lcom/belkin/wemo/cache/utils/MoreUtil;->changeAttributes(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    .line 747
    invoke-interface {v1}, Lorg/w3c/dom/Node;->getNodeName()Ljava/lang/String;

    move-result-object v8

    const-string v9, "name"

    invoke-virtual {v8, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_0

    .line 748
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

    .line 750
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

    .line 739
    .end local v4    # "content":Ljava/lang/String;
    :cond_1
    add-int/lit8 v5, v5, 0x1

    goto :goto_1

    .line 755
    .end local v1    # "cNode":Lorg/w3c/dom/Node;
    :cond_2
    invoke-virtual {v0}, Ljava/lang/StringBuffer;->length()I

    move-result v8

    add-int/lit8 v8, v8, -0x1

    invoke-virtual {v0, v8}, Ljava/lang/StringBuffer;->setLength(I)V

    .line 756
    const-string v8, "},"

    invoke-virtual {v0, v8}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 732
    .end local v3    # "childNodes1":Lorg/w3c/dom/NodeList;
    .end local v5    # "j":I
    :cond_3
    add-int/lit8 v6, v6, 0x1

    goto/16 :goto_0

    .line 761
    .end local v7    # "node":Lorg/w3c/dom/Node;
    :cond_4
    invoke-virtual {v0}, Ljava/lang/StringBuffer;->length()I

    move-result v8

    add-int/lit8 v8, v8, -0x1

    invoke-virtual {v0, v8}, Ljava/lang/StringBuffer;->setLength(I)V

    .line 762
    const-string v8, "}"

    invoke-virtual {v0, v8}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 764
    const-string v8, "SDK_CloudRequestUpdateDeviceList"

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "Attributelist Update :"

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-static {v8, v9}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->verboseLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 765
    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v8

    return-object v8
.end method

.method private static nodeToString(Lorg/w3c/dom/Node;)Ljava/lang/String;
    .locals 5
    .param p0, "node"    # Lorg/w3c/dom/Node;

    .prologue
    .line 717
    new-instance v0, Ljava/io/StringWriter;

    invoke-direct {v0}, Ljava/io/StringWriter;-><init>()V

    .line 719
    .local v0, "sw":Ljava/io/StringWriter;
    :try_start_0
    invoke-static {}, Ljavax/xml/transform/TransformerFactory;->newInstance()Ljavax/xml/transform/TransformerFactory;

    move-result-object v3

    invoke-virtual {v3}, Ljavax/xml/transform/TransformerFactory;->newTransformer()Ljavax/xml/transform/Transformer;

    move-result-object v1

    .line 720
    .local v1, "t":Ljavax/xml/transform/Transformer;
    const-string v3, "omit-xml-declaration"

    const-string v4, "yes"

    invoke-virtual {v1, v3, v4}, Ljavax/xml/transform/Transformer;->setOutputProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 721
    const-string v3, "indent"

    const-string v4, "yes"

    invoke-virtual {v1, v3, v4}, Ljavax/xml/transform/Transformer;->setOutputProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 722
    new-instance v3, Ljavax/xml/transform/dom/DOMSource;

    invoke-direct {v3, p0}, Ljavax/xml/transform/dom/DOMSource;-><init>(Lorg/w3c/dom/Node;)V

    new-instance v4, Ljavax/xml/transform/stream/StreamResult;

    invoke-direct {v4, v0}, Ljavax/xml/transform/stream/StreamResult;-><init>(Ljava/io/Writer;)V

    invoke-virtual {v1, v3, v4}, Ljavax/xml/transform/Transformer;->transform(Ljavax/xml/transform/Source;Ljavax/xml/transform/Result;)V
    :try_end_0
    .catch Ljavax/xml/transform/TransformerException; {:try_start_0 .. :try_end_0} :catch_0

    .line 726
    .end local v1    # "t":Ljavax/xml/transform/Transformer;
    :goto_0
    invoke-virtual {v0}, Ljava/io/StringWriter;->toString()Ljava/lang/String;

    move-result-object v3

    return-object v3

    .line 723
    :catch_0
    move-exception v2

    .line 724
    .local v2, "te":Ljavax/xml/transform/TransformerException;
    sget-object v3, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v4, "nodeToString Transformer Exception"

    invoke-virtual {v3, v4}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    goto :goto_0
.end method

.method private parseResponse(Ljava/lang/String;)Z
    .locals 44
    .param p1, "response"    # Ljava/lang/String;

    .prologue
    .line 486
    :try_start_0
    new-instance v41, Ljava/util/ArrayList;

    invoke-direct/range {v41 .. v41}, Ljava/util/ArrayList;-><init>()V

    move-object/from16 v0, v41

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/belkin/wemo/cache/cloud/CloudRequestUpdateDeviceList;->devicesList:Ljava/util/ArrayList;

    .line 487
    const-string v7, ""

    .line 489
    .local v7, "bridgeUDN":Ljava/lang/String;
    new-instance v33, Lcom/belkin/wemo/cache/cloud/XMLParser;

    invoke-direct/range {v33 .. v33}, Lcom/belkin/wemo/cache/cloud/XMLParser;-><init>()V

    .line 490
    .local v33, "parser":Lcom/belkin/wemo/cache/cloud/XMLParser;
    move-object/from16 v0, v33

    move-object/from16 v1, p1

    invoke-virtual {v0, v1}, Lcom/belkin/wemo/cache/cloud/XMLParser;->getDomElement(Ljava/lang/String;)Lorg/w3c/dom/Document;

    move-result-object v16

    .line 491
    .local v16, "doc":Lorg/w3c/dom/Document;
    const-string v41, "device"

    move-object/from16 v0, v16

    move-object/from16 v1, v41

    invoke-interface {v0, v1}, Lorg/w3c/dom/Document;->getElementsByTagName(Ljava/lang/String;)Lorg/w3c/dom/NodeList;

    move-result-object v31

    .line 492
    .local v31, "nl":Lorg/w3c/dom/NodeList;
    const/4 v14, 0x0

    .line 494
    .local v14, "device":Lcom/belkin/wemo/cache/data/DeviceInformation;
    const/16 v22, 0x0

    .local v22, "i":I
    :goto_0
    invoke-interface/range {v31 .. v31}, Lorg/w3c/dom/NodeList;->getLength()I

    move-result v41

    move/from16 v0, v22

    move/from16 v1, v41

    if-ge v0, v1, :cond_1b

    .line 495
    move-object/from16 v0, v31

    move/from16 v1, v22

    invoke-interface {v0, v1}, Lorg/w3c/dom/NodeList;->item(I)Lorg/w3c/dom/Node;

    move-result-object v18

    check-cast v18, Lorg/w3c/dom/Element;

    .line 496
    .local v18, "e":Lorg/w3c/dom/Element;
    const-string v41, "modelCode"

    move-object/from16 v0, v33

    move-object/from16 v1, v18

    move-object/from16 v2, v41

    invoke-virtual {v0, v1, v2}, Lcom/belkin/wemo/cache/cloud/XMLParser;->getValue(Lorg/w3c/dom/Element;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v28

    .line 498
    .local v28, "modelCode":Ljava/lang/String;
    if-eqz v28, :cond_0

    invoke-virtual/range {v28 .. v28}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v41

    invoke-virtual/range {v41 .. v41}, Ljava/lang/String;->length()I

    move-result v41

    if-gtz v41, :cond_1

    .line 494
    :cond_0
    :goto_1
    add-int/lit8 v22, v22, 0x1

    goto :goto_0

    .line 502
    :cond_1
    const-string v41, "status"

    move-object/from16 v0, v33

    move-object/from16 v1, v18

    move-object/from16 v2, v41

    invoke-virtual {v0, v1, v2}, Lcom/belkin/wemo/cache/cloud/XMLParser;->getValue(Lorg/w3c/dom/Element;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v37

    .line 503
    .local v37, "status":Ljava/lang/String;
    const-string v41, "SDK_CloudRequestUpdateDeviceList"

    new-instance v42, Ljava/lang/StringBuilder;

    invoke-direct/range {v42 .. v42}, Ljava/lang/StringBuilder;-><init>()V

    const-string v43, "status----"

    invoke-virtual/range {v42 .. v43}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v42

    move-object/from16 v0, v42

    move-object/from16 v1, v37

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v42

    invoke-virtual/range {v42 .. v42}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v42

    invoke-static/range {v41 .. v42}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 504
    invoke-static/range {v28 .. v28}, Lcom/belkin/wemo/cache/utils/WemoUtils;->isLEDModelCodeSupported(Ljava/lang/String;)Z

    move-result v41

    if-nez v41, :cond_0

    .line 505
    const-string v41, "Bridge"

    move-object/from16 v0, v28

    move-object/from16 v1, v41

    invoke-virtual {v0, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v41

    if-eqz v41, :cond_5

    .line 506
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/wemo/cache/cloud/CloudRequestUpdateDeviceList;->mBridgeList:Ljava/util/Hashtable;

    move-object/from16 v41, v0

    invoke-virtual/range {v41 .. v41}, Ljava/util/Hashtable;->size()I

    move-result v41

    if-lez v41, :cond_4

    .line 507
    new-instance v9, Lorg/json/JSONObject;

    invoke-direct {v9}, Lorg/json/JSONObject;-><init>()V

    .line 508
    .local v9, "currentBridge":Lorg/json/JSONObject;
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/wemo/cache/cloud/CloudRequestUpdateDeviceList;->mBridgeList:Ljava/util/Hashtable;

    move-object/from16 v41, v0

    invoke-virtual/range {v41 .. v41}, Ljava/util/Hashtable;->keys()Ljava/util/Enumeration;

    move-result-object v27

    .line 509
    .local v27, "keys":Ljava/util/Enumeration;, "Ljava/util/Enumeration<Ljava/lang/String;>;"
    :goto_2
    invoke-interface/range {v27 .. v27}, Ljava/util/Enumeration;->hasMoreElements()Z

    move-result v41

    if-eqz v41, :cond_2

    .line 510
    invoke-interface/range {v27 .. v27}, Ljava/util/Enumeration;->nextElement()Ljava/lang/Object;

    move-result-object v26

    check-cast v26, Ljava/lang/String;

    .line 511
    .local v26, "key":Ljava/lang/String;
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/wemo/cache/cloud/CloudRequestUpdateDeviceList;->mBridgeList:Ljava/util/Hashtable;

    move-object/from16 v41, v0

    move-object/from16 v0, v41

    move-object/from16 v1, v26

    invoke-virtual {v0, v1}, Ljava/util/Hashtable;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v9

    .end local v9    # "currentBridge":Lorg/json/JSONObject;
    check-cast v9, Lorg/json/JSONObject;

    .line 512
    .restart local v9    # "currentBridge":Lorg/json/JSONObject;
    goto :goto_2

    .line 513
    .end local v26    # "key":Ljava/lang/String;
    :cond_2
    const-string v41, "status"

    move-object/from16 v0, v41

    invoke-virtual {v9, v0}, Lorg/json/JSONObject;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v41

    const-string v42, "3"

    invoke-virtual/range {v41 .. v42}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v41

    if-eqz v41, :cond_0

    .line 514
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/wemo/cache/cloud/CloudRequestUpdateDeviceList;->devicesList:Ljava/util/ArrayList;

    move-object/from16 v41, v0

    invoke-virtual/range {v41 .. v41}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v23

    .local v23, "i$":Ljava/util/Iterator;
    :cond_3
    invoke-interface/range {v23 .. v23}, Ljava/util/Iterator;->hasNext()Z

    move-result v41

    if-eqz v41, :cond_4

    invoke-interface/range {v23 .. v23}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v12

    check-cast v12, Lcom/belkin/wemo/cache/data/DeviceInformation;

    .line 515
    .local v12, "dev":Lcom/belkin/wemo/cache/data/DeviceInformation;
    invoke-virtual {v12}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getUDN()Ljava/lang/String;

    move-result-object v41

    const-string v42, "uniqueId"

    move-object/from16 v0, v42

    invoke-virtual {v9, v0}, Lorg/json/JSONObject;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v42

    invoke-virtual/range {v41 .. v42}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v41

    if-eqz v41, :cond_3

    .line 516
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/wemo/cache/cloud/CloudRequestUpdateDeviceList;->devicesList:Ljava/util/ArrayList;

    move-object/from16 v41, v0

    move-object/from16 v0, v41

    invoke-virtual {v0, v12}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    .line 525
    .end local v9    # "currentBridge":Lorg/json/JSONObject;
    .end local v12    # "dev":Lcom/belkin/wemo/cache/data/DeviceInformation;
    .end local v23    # "i$":Ljava/util/Iterator;
    .end local v27    # "keys":Ljava/util/Enumeration;, "Ljava/util/Enumeration<Ljava/lang/String;>;"
    :cond_4
    new-instance v6, Lorg/json/JSONObject;

    invoke-direct {v6}, Lorg/json/JSONObject;-><init>()V

    .line 526
    .local v6, "bridgeInfo":Lorg/json/JSONObject;
    const-string v41, "uniqueId"

    move-object/from16 v0, v33

    move-object/from16 v1, v18

    move-object/from16 v2, v41

    invoke-virtual {v0, v1, v2}, Lcom/belkin/wemo/cache/cloud/XMLParser;->getValue(Lorg/w3c/dom/Element;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    .line 527
    const-string v41, "uniqueId"

    move-object/from16 v0, v41

    invoke-virtual {v6, v0, v7}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 528
    const-string v41, "status"

    move-object/from16 v0, v41

    move-object/from16 v1, v37

    invoke-virtual {v6, v0, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 529
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/wemo/cache/cloud/CloudRequestUpdateDeviceList;->mBridgeList:Ljava/util/Hashtable;

    move-object/from16 v41, v0

    const-string v42, "pluginId"

    move-object/from16 v0, v33

    move-object/from16 v1, v18

    move-object/from16 v2, v42

    invoke-virtual {v0, v1, v2}, Lcom/belkin/wemo/cache/cloud/XMLParser;->getValue(Lorg/w3c/dom/Element;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v42

    move-object/from16 v0, v41

    move-object/from16 v1, v42

    invoke-virtual {v0, v1, v6}, Ljava/util/Hashtable;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 531
    .end local v6    # "bridgeInfo":Lorg/json/JSONObject;
    :cond_5
    new-instance v41, Lcom/belkin/wemo/cache/utils/SharePreferences;

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/wemo/cache/cloud/CloudRequestUpdateDeviceList;->mContext:Landroid/content/Context;

    move-object/from16 v42, v0

    invoke-direct/range {v41 .. v42}, Lcom/belkin/wemo/cache/utils/SharePreferences;-><init>(Landroid/content/Context;)V

    invoke-virtual/range {v41 .. v41}, Lcom/belkin/wemo/cache/utils/SharePreferences;->getHomeId()Ljava/lang/String;

    move-result-object v21

    .line 532
    .local v21, "homeId":Ljava/lang/String;
    const-string v41, "uniqueId"

    move-object/from16 v0, v33

    move-object/from16 v1, v18

    move-object/from16 v2, v41

    invoke-virtual {v0, v1, v2}, Lcom/belkin/wemo/cache/cloud/XMLParser;->getValue(Lorg/w3c/dom/Element;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v39

    .line 533
    .local v39, "udn":Ljava/lang/String;
    sget-object v13, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->devListManager:Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    .line 534
    .local v13, "devListManager":Lcom/belkin/wemo/cache/devicelist/DeviceListManager;
    if-nez v13, :cond_6

    .line 535
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/wemo/cache/cloud/CloudRequestUpdateDeviceList;->mContext:Landroid/content/Context;

    move-object/from16 v41, v0

    invoke-static/range {v41 .. v41}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->getInstance(Landroid/content/Context;)Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    move-result-object v13

    .line 537
    :cond_6
    invoke-virtual {v13}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->getDeviceInformationList()Ljava/util/Map;

    move-result-object v15

    .line 538
    .local v15, "deviceList":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Lcom/belkin/wemo/cache/data/DeviceInformation;>;"
    if-eqz v15, :cond_7

    .line 539
    move-object/from16 v0, v39

    invoke-interface {v15, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v14

    .end local v14    # "device":Lcom/belkin/wemo/cache/data/DeviceInformation;
    check-cast v14, Lcom/belkin/wemo/cache/data/DeviceInformation;

    .line 540
    .restart local v14    # "device":Lcom/belkin/wemo/cache/data/DeviceInformation;
    :cond_7
    if-nez v14, :cond_8

    .line 541
    const-string v41, "SDK_CloudRequestUpdateDeviceList"

    const-string v42, "device is null creating new object "

    invoke-static/range {v41 .. v42}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 542
    new-instance v14, Lcom/belkin/wemo/cache/data/DeviceInformation;

    .end local v14    # "device":Lcom/belkin/wemo/cache/data/DeviceInformation;
    const-string v41, "uniqueId"

    move-object/from16 v0, v33

    move-object/from16 v1, v18

    move-object/from16 v2, v41

    invoke-virtual {v0, v1, v2}, Lcom/belkin/wemo/cache/cloud/XMLParser;->getValue(Lorg/w3c/dom/Element;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v41

    const-string v42, "macAddress"

    move-object/from16 v0, v33

    move-object/from16 v1, v18

    move-object/from16 v2, v42

    invoke-virtual {v0, v1, v2}, Lcom/belkin/wemo/cache/cloud/XMLParser;->getValue(Lorg/w3c/dom/Element;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v42

    const-string v43, "pluginId"

    move-object/from16 v0, v33

    move-object/from16 v1, v18

    move-object/from16 v2, v43

    invoke-virtual {v0, v1, v2}, Lcom/belkin/wemo/cache/cloud/XMLParser;->getValue(Lorg/w3c/dom/Element;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v43

    move-object/from16 v0, v41

    move-object/from16 v1, v21

    move-object/from16 v2, v42

    move-object/from16 v3, v43

    invoke-direct {v14, v0, v1, v2, v3}, Lcom/belkin/wemo/cache/data/DeviceInformation;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 545
    .restart local v14    # "device":Lcom/belkin/wemo/cache/data/DeviceInformation;
    const-string v41, "friendlyName"

    move-object/from16 v0, v33

    move-object/from16 v1, v18

    move-object/from16 v2, v41

    invoke-virtual {v0, v1, v2}, Lcom/belkin/wemo/cache/cloud/XMLParser;->getValue(Lorg/w3c/dom/Element;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v41

    move-object/from16 v0, v41

    invoke-virtual {v14, v0}, Lcom/belkin/wemo/cache/data/DeviceInformation;->setFriendlyName(Ljava/lang/String;)V

    .line 546
    move-object/from16 v0, v28

    invoke-virtual {v14, v0}, Lcom/belkin/wemo/cache/data/DeviceInformation;->setModelCode(Ljava/lang/String;)V

    .line 547
    move-object/from16 v0, v28

    invoke-virtual {v14, v0}, Lcom/belkin/wemo/cache/data/DeviceInformation;->setType(Ljava/lang/String;)V

    .line 548
    const-string v41, "productName"

    move-object/from16 v0, v33

    move-object/from16 v1, v18

    move-object/from16 v2, v41

    invoke-virtual {v0, v1, v2}, Lcom/belkin/wemo/cache/cloud/XMLParser;->getValue(Lorg/w3c/dom/Element;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v35

    .line 549
    .local v35, "productName":Ljava/lang/String;
    invoke-virtual/range {v35 .. v35}, Ljava/lang/String;->isEmpty()Z

    move-result v41

    if-eqz v41, :cond_11

    .line 550
    sget-object v41, Lcom/belkin/wemo/cache/data/DevicesArray;->productNameMapping:Ljava/util/HashMap;

    invoke-virtual {v14}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getModelCode()Ljava/lang/String;

    move-result-object v42

    invoke-virtual/range {v41 .. v42}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v41

    check-cast v41, Ljava/lang/String;

    invoke-static/range {v41 .. v41}, Lcom/belkin/wemo/cache/utils/StringUtils;->toLowerCamelCase(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v41

    move-object/from16 v0, v41

    invoke-virtual {v14, v0}, Lcom/belkin/wemo/cache/data/DeviceInformation;->setProductName(Ljava/lang/String;)V

    .line 555
    :goto_3
    const-string v41, "productType"

    move-object/from16 v0, v33

    move-object/from16 v1, v18

    move-object/from16 v2, v41

    invoke-virtual {v0, v1, v2}, Lcom/belkin/wemo/cache/cloud/XMLParser;->getValue(Lorg/w3c/dom/Element;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v36

    .line 556
    .local v36, "productType":Ljava/lang/String;
    invoke-virtual/range {v36 .. v36}, Ljava/lang/String;->isEmpty()Z

    move-result v41

    if-eqz v41, :cond_12

    .line 557
    sget-object v41, Lcom/belkin/wemo/cache/data/DevicesArray;->productTypeMapping:Ljava/util/HashMap;

    invoke-virtual {v14}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getModelCode()Ljava/lang/String;

    move-result-object v42

    invoke-virtual/range {v41 .. v42}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v41

    check-cast v41, Ljava/lang/String;

    invoke-static/range {v41 .. v41}, Lcom/belkin/wemo/cache/utils/StringUtils;->toLowerCamelCase(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v41

    move-object/from16 v0, v41

    invoke-virtual {v14, v0}, Lcom/belkin/wemo/cache/data/DeviceInformation;->setProductType(Ljava/lang/String;)V

    .line 562
    .end local v35    # "productName":Ljava/lang/String;
    .end local v36    # "productType":Ljava/lang/String;
    :cond_8
    :goto_4
    if-eqz v14, :cond_0

    invoke-virtual {v14}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getUDN()Ljava/lang/String;

    move-result-object v41

    invoke-virtual/range {v41 .. v41}, Ljava/lang/String;->length()I

    move-result v41

    if-lez v41, :cond_0

    .line 563
    const-string v41, "fwUpgradeStatus"

    move-object/from16 v0, v33

    move-object/from16 v1, v18

    move-object/from16 v2, v41

    invoke-virtual {v0, v1, v2}, Lcom/belkin/wemo/cache/cloud/XMLParser;->getValue(Lorg/w3c/dom/Element;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v41

    move-object/from16 v0, v41

    invoke-virtual {v14, v0}, Lcom/belkin/wemo/cache/data/DeviceInformation;->setFwStatus(Ljava/lang/String;)V

    .line 566
    const-string v41, "firmwareVersion"

    move-object/from16 v0, v33

    move-object/from16 v1, v18

    move-object/from16 v2, v41

    invoke-virtual {v0, v1, v2}, Lcom/belkin/wemo/cache/cloud/XMLParser;->getValue(Lorg/w3c/dom/Element;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v41

    move-object/from16 v0, v41

    invoke-virtual {v14, v0}, Lcom/belkin/wemo/cache/data/DeviceInformation;->setFirmwareVersion(Ljava/lang/String;)V

    .line 568
    const-string v41, "statusTS"

    move-object/from16 v0, v33

    move-object/from16 v1, v18

    move-object/from16 v2, v41

    invoke-virtual {v0, v1, v2}, Lcom/belkin/wemo/cache/cloud/XMLParser;->getValue(Lorg/w3c/dom/Element;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v41

    move-object/from16 v0, v41

    invoke-virtual {v14, v0}, Lcom/belkin/wemo/cache/data/DeviceInformation;->setLastTimestamp(Ljava/lang/String;)V

    .line 570
    invoke-virtual {v14}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getIcon()Ljava/lang/String;

    move-result-object v24

    .line 571
    .local v24, "icon":Ljava/lang/String;
    const-string v41, "iconVersion"

    move-object/from16 v0, v33

    move-object/from16 v1, v18

    move-object/from16 v2, v41

    invoke-virtual {v0, v1, v2}, Lcom/belkin/wemo/cache/cloud/XMLParser;->getValue(Lorg/w3c/dom/Element;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v41

    move-object/from16 v0, p0

    move-object/from16 v1, v41

    invoke-direct {v0, v1}, Lcom/belkin/wemo/cache/cloud/CloudRequestUpdateDeviceList;->getIconVersion(Ljava/lang/String;)I

    move-result v30

    .line 572
    .local v30, "newIconVersion":I
    invoke-virtual {v14}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getIconVersion()Ljava/lang/String;

    move-result-object v41

    move-object/from16 v0, p0

    move-object/from16 v1, v41

    invoke-direct {v0, v1}, Lcom/belkin/wemo/cache/cloud/CloudRequestUpdateDeviceList;->getIconVersion(Ljava/lang/String;)I

    move-result v10

    .line 574
    .local v10, "currentIconVersion":I
    move/from16 v0, v30

    if-ge v10, v0, :cond_13

    const/16 v29, 0x1

    .line 575
    .local v29, "needIconUpdate":Z
    :goto_5
    if-nez v29, :cond_9

    invoke-virtual {v14}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getIconVersion()Ljava/lang/String;

    move-result-object v41

    move-object/from16 v0, p0

    move-object/from16 v1, v41

    invoke-direct {v0, v1}, Lcom/belkin/wemo/cache/cloud/CloudRequestUpdateDeviceList;->isEmptyOrNull(Ljava/lang/String;)Z

    move-result v41

    if-eqz v41, :cond_a

    .line 576
    :cond_9
    invoke-static/range {v30 .. v30}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v41

    move-object/from16 v0, v41

    invoke-virtual {v14, v0}, Lcom/belkin/wemo/cache/data/DeviceInformation;->setIconVersion(Ljava/lang/String;)V

    .line 579
    :cond_a
    const-string v41, "com.belkin.wemo.storage"

    move-object/from16 v0, v24

    move-object/from16 v1, v41

    invoke-virtual {v0, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v25

    .line 580
    .local v25, "iconValid":Z
    if-nez v25, :cond_b

    const-string v41, ""

    move-object/from16 v0, v24

    move-object/from16 v1, v41

    if-ne v0, v1, :cond_c

    .line 581
    :cond_b
    const/16 v29, 0x1

    .line 585
    :cond_c
    if-eqz v29, :cond_d

    .line 587
    invoke-static/range {v24 .. v24}, Lcom/belkin/wemo/storage/FileStorage;->doesCustomIconExistAtLocation(Ljava/lang/String;)Z

    move-result v17

    .line 588
    .local v17, "doesExist":Z
    const-string v41, "SDK_CloudRequestUpdateDeviceList"

    new-instance v42, Ljava/lang/StringBuilder;

    invoke-direct/range {v42 .. v42}, Ljava/lang/StringBuilder;-><init>()V

    const-string v43, "Remote Custom Icon - Does Icon Exist: "

    invoke-virtual/range {v42 .. v43}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v42

    move-object/from16 v0, v42

    move/from16 v1, v17

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v42

    const-string v43, "; Icon Location: "

    invoke-virtual/range {v42 .. v43}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v42

    move-object/from16 v0, v42

    move-object/from16 v1, v24

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v42

    const-string v43, "; UDN: "

    invoke-virtual/range {v42 .. v43}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v42

    move-object/from16 v0, v42

    move-object/from16 v1, v39

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v42

    const-string v43, "; Object: "

    invoke-virtual/range {v42 .. v43}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v42

    invoke-static/range {p0 .. p0}, Ljava/lang/System;->identityHashCode(Ljava/lang/Object;)I

    move-result v43

    invoke-virtual/range {v42 .. v43}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v42

    invoke-virtual/range {v42 .. v42}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v42

    invoke-static/range {v41 .. v42}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->debugLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 589
    if-eqz v17, :cond_d

    if-nez v25, :cond_d

    .line 590
    const/16 v29, 0x0

    .line 594
    .end local v17    # "doesExist":Z
    :cond_d
    move/from16 v0, v29

    invoke-virtual {v14, v0}, Lcom/belkin/wemo/cache/data/DeviceInformation;->setNeedIconUpdate(Z)V

    .line 596
    const-string v41, "SDK_CloudRequestUpdateDeviceList"

    new-instance v42, Ljava/lang/StringBuilder;

    invoke-direct/range {v42 .. v42}, Ljava/lang/StringBuilder;-><init>()V

    const-string v43, "Icon Update is needed:"

    invoke-virtual/range {v42 .. v43}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v42

    move-object/from16 v0, v42

    move/from16 v1, v29

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v42

    const-string v43, "; currentIconVersion: "

    invoke-virtual/range {v42 .. v43}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v42

    move-object/from16 v0, v42

    invoke-virtual {v0, v10}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v42

    const-string v43, ";newIconVersion: "

    invoke-virtual/range {v42 .. v43}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v42

    move-object/from16 v0, v42

    move/from16 v1, v30

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v42

    const-string v43, "UDN "

    invoke-virtual/range {v42 .. v43}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v42

    move-object/from16 v0, v42

    move-object/from16 v1, v39

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v42

    const-string v43, "; icon: "

    invoke-virtual/range {v42 .. v43}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v42

    move-object/from16 v0, v42

    move-object/from16 v1, v24

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v42

    invoke-virtual/range {v42 .. v42}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v42

    invoke-static/range {v41 .. v42}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->debugLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 599
    const-string v41, "serialNumber"

    move-object/from16 v0, v33

    move-object/from16 v1, v18

    move-object/from16 v2, v41

    invoke-virtual {v0, v1, v2}, Lcom/belkin/wemo/cache/cloud/XMLParser;->getValue(Lorg/w3c/dom/Element;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v41

    move-object/from16 v0, v41

    invoke-virtual {v14, v0}, Lcom/belkin/wemo/cache/data/DeviceInformation;->setSerialNumber(Ljava/lang/String;)V

    .line 600
    invoke-static/range {v37 .. v37}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result v41

    if-nez v41, :cond_14

    .line 603
    :try_start_1
    invoke-static/range {v37 .. v37}, Ljava/lang/Integer;->valueOf(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v41

    invoke-virtual/range {v41 .. v41}, Ljava/lang/Integer;->intValue()I

    move-result v41

    move/from16 v0, v41

    invoke-virtual {v14, v0}, Lcom/belkin/wemo/cache/data/DeviceInformation;->setState(I)V
    :try_end_1
    .catch Ljava/lang/NumberFormatException; {:try_start_1 .. :try_end_1} :catch_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    .line 612
    :goto_6
    :try_start_2
    const-string v41, "statusTS"

    move-object/from16 v0, v33

    move-object/from16 v1, v18

    move-object/from16 v2, v41

    invoke-virtual {v0, v1, v2}, Lcom/belkin/wemo/cache/cloud/XMLParser;->getValue(Lorg/w3c/dom/Element;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v41

    invoke-static/range {v41 .. v41}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0

    move-result v41

    if-nez v41, :cond_15

    .line 614
    :try_start_3
    const-string v41, "statusTS"

    move-object/from16 v0, v33

    move-object/from16 v1, v18

    move-object/from16 v2, v41

    invoke-virtual {v0, v1, v2}, Lcom/belkin/wemo/cache/cloud/XMLParser;->getValue(Lorg/w3c/dom/Element;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v41

    invoke-static/range {v41 .. v41}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v41

    move/from16 v0, v41

    invoke-virtual {v14, v0}, Lcom/belkin/wemo/cache/data/DeviceInformation;->setStatusTS(I)V
    :try_end_3
    .catch Ljava/lang/NumberFormatException; {:try_start_3 .. :try_end_3} :catch_2
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_0

    .line 623
    :goto_7
    :try_start_4
    const-string v41, "SDK_CloudRequestUpdateDeviceList"

    new-instance v42, Ljava/lang/StringBuilder;

    invoke-direct/range {v42 .. v42}, Ljava/lang/StringBuilder;-><init>()V

    const-string v43, "device name: "

    invoke-virtual/range {v42 .. v43}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v42

    invoke-virtual {v14}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getFriendlyName()Ljava/lang/String;

    move-result-object v43

    invoke-virtual/range {v42 .. v43}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v42

    const-string v43, " status: "

    invoke-virtual/range {v42 .. v43}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v42

    invoke-virtual {v14}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getState()I

    move-result v43

    invoke-virtual/range {v42 .. v43}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v42

    invoke-virtual/range {v42 .. v42}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v42

    invoke-static/range {v41 .. v42}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 625
    invoke-virtual {v14}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getState()I

    move-result v41

    const/16 v42, 0x3

    move/from16 v0, v41

    move/from16 v1, v42

    if-ne v0, v1, :cond_16

    .line 626
    const/16 v41, 0x1

    move/from16 v0, v41

    invoke-virtual {v14, v0}, Lcom/belkin/wemo/cache/data/DeviceInformation;->setInActive(I)V

    .line 627
    const/16 v41, 0x0

    move/from16 v0, v41

    invoke-virtual {v14, v0}, Lcom/belkin/wemo/cache/data/DeviceInformation;->setIsDiscovered(Z)V

    .line 632
    :goto_8
    invoke-virtual {v14}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getState()I

    move-result v41

    if-nez v41, :cond_17

    .line 633
    const-string v41, "0"

    move-object/from16 v0, v41

    invoke-virtual {v14, v0}, Lcom/belkin/wemo/cache/data/DeviceInformation;->setBinaryState(Ljava/lang/String;)V

    .line 638
    :cond_e
    :goto_9
    const/16 v41, 0x0

    move/from16 v0, v41

    invoke-virtual {v14, v0}, Lcom/belkin/wemo/cache/data/DeviceInformation;->setHide(I)V

    .line 639
    const-string v41, "pluginId"

    move-object/from16 v0, v33

    move-object/from16 v1, v18

    move-object/from16 v2, v41

    invoke-virtual {v0, v1, v2}, Lcom/belkin/wemo/cache/cloud/XMLParser;->getValue(Lorg/w3c/dom/Element;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v34

    .line 640
    .local v34, "pluginId":Ljava/lang/String;
    const-string v41, "SDK_CloudRequestUpdateDeviceList"

    new-instance v42, Ljava/lang/StringBuilder;

    invoke-direct/range {v42 .. v42}, Ljava/lang/StringBuilder;-><init>()V

    const-string v43, "Plugin ID: "

    invoke-virtual/range {v42 .. v43}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v42

    move-object/from16 v0, v42

    move-object/from16 v1, v34

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v42

    const-string v43, "; UDN: "

    invoke-virtual/range {v42 .. v43}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v42

    move-object/from16 v0, v42

    move-object/from16 v1, v39

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v42

    invoke-virtual/range {v42 .. v42}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v42

    invoke-static/range {v41 .. v42}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->debugLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 641
    move-object/from16 v0, v34

    invoke-virtual {v14, v0}, Lcom/belkin/wemo/cache/data/DeviceInformation;->setPluginId(Ljava/lang/String;)V

    .line 642
    const-string v41, "friendlyName"

    move-object/from16 v0, v33

    move-object/from16 v1, v18

    move-object/from16 v2, v41

    invoke-virtual {v0, v1, v2}, Lcom/belkin/wemo/cache/cloud/XMLParser;->getValue(Lorg/w3c/dom/Element;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v41

    move-object/from16 v0, v41

    invoke-virtual {v14, v0}, Lcom/belkin/wemo/cache/data/DeviceInformation;->setFriendlyName(Ljava/lang/String;)V

    .line 643
    const-string v41, "dbVersion"

    move-object/from16 v0, v33

    move-object/from16 v1, v18

    move-object/from16 v2, v41

    invoke-virtual {v0, v1, v2}, Lcom/belkin/wemo/cache/cloud/XMLParser;->getValue(Lorg/w3c/dom/Element;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v11

    .line 644
    .local v11, "dbVersion":Ljava/lang/String;
    const-string v41, ""

    move-object/from16 v0, v41

    invoke-virtual {v11, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v41

    if-nez v41, :cond_f

    .line 645
    invoke-static {v11}, Ljava/lang/Integer;->valueOf(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v41

    invoke-virtual/range {v41 .. v41}, Ljava/lang/Integer;->intValue()I

    move-result v41

    move/from16 v0, v41

    invoke-virtual {v14, v0}, Lcom/belkin/wemo/cache/data/DeviceInformation;->setRulesDBVersion(I)V

    .line 647
    :cond_f
    const/16 v41, 0x1

    move/from16 v0, v41

    invoke-virtual {v14, v0}, Lcom/belkin/wemo/cache/data/DeviceInformation;->setRemote(Z)V

    .line 648
    invoke-virtual {v14}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getUDN()Ljava/lang/String;

    move-result-object v41

    invoke-static/range {v41 .. v41}, Lcom/belkin/wemo/cache/utils/IsDevice;->Crockpot(Ljava/lang/String;)Z

    move-result v41

    if-eqz v41, :cond_19

    .line 649
    const-string v41, "cookedTime"

    move-object/from16 v0, v33

    move-object/from16 v1, v18

    move-object/from16 v2, v41

    invoke-virtual {v0, v1, v2}, Lcom/belkin/wemo/cache/cloud/XMLParser;->getValue(Lorg/w3c/dom/Element;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    .line 650
    .local v8, "cookedTime":Ljava/lang/String;
    const-string v41, "eventDuration"

    move-object/from16 v0, v33

    move-object/from16 v1, v18

    move-object/from16 v2, v41

    invoke-virtual {v0, v1, v2}, Lcom/belkin/wemo/cache/cloud/XMLParser;->getValue(Lorg/w3c/dom/Element;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v19

    .line 651
    .local v19, "eventDuration":Ljava/lang/String;
    const-string v41, "statusTS"

    move-object/from16 v0, v33

    move-object/from16 v1, v18

    move-object/from16 v2, v41

    invoke-virtual {v0, v1, v2}, Lcom/belkin/wemo/cache/cloud/XMLParser;->getValue(Lorg/w3c/dom/Element;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v38

    .line 653
    .local v38, "timeStamp":Ljava/lang/String;
    const-string v41, "SDK_CloudRequestUpdateDeviceList"

    new-instance v42, Ljava/lang/StringBuilder;

    invoke-direct/range {v42 .. v42}, Ljava/lang/StringBuilder;-><init>()V

    const-string v43, "Cooked Time: "

    invoke-virtual/range {v42 .. v43}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v42

    move-object/from16 v0, v42

    invoke-virtual {v0, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v42

    const-string v43, "; Event Duration / time: "

    invoke-virtual/range {v42 .. v43}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v42

    move-object/from16 v0, v42

    move-object/from16 v1, v19

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v42

    const-string v43, "; timeStamp: "

    invoke-virtual/range {v42 .. v43}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v42

    move-object/from16 v0, v42

    move-object/from16 v1, v38

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v42

    invoke-virtual/range {v42 .. v42}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v42

    invoke-static/range {v41 .. v42}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->debugLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 654
    const-string v41, "cookedTime"

    move-object/from16 v0, v41

    invoke-virtual {v14, v0, v8}, Lcom/belkin/wemo/cache/data/DeviceInformation;->setAttributeValue(Ljava/lang/String;Ljava/lang/String;)V

    .line 655
    const-string v41, "eventDuration"

    move-object/from16 v0, v41

    move-object/from16 v1, v19

    invoke-virtual {v14, v0, v1}, Lcom/belkin/wemo/cache/data/DeviceInformation;->setAttributeValue(Ljava/lang/String;Ljava/lang/String;)V

    .line 656
    const-string v41, "time"

    move-object/from16 v0, v41

    move-object/from16 v1, v19

    invoke-virtual {v14, v0, v1}, Lcom/belkin/wemo/cache/data/DeviceInformation;->setAttributeValue(Ljava/lang/String;Ljava/lang/String;)V

    .line 657
    const-string v41, "timeStamp"

    move-object/from16 v0, v41

    move-object/from16 v1, v38

    invoke-virtual {v14, v0, v1}, Lcom/belkin/wemo/cache/data/DeviceInformation;->setAttributeValue(Ljava/lang/String;Ljava/lang/String;)V

    .line 675
    .end local v8    # "cookedTime":Ljava/lang/String;
    .end local v19    # "eventDuration":Ljava/lang/String;
    .end local v38    # "timeStamp":Ljava/lang/String;
    :cond_10
    :goto_a
    if-eqz v14, :cond_0

    .line 676
    const-string v41, "RemoteMode:"

    new-instance v42, Ljava/lang/StringBuilder;

    invoke-direct/range {v42 .. v42}, Ljava/lang/StringBuilder;-><init>()V

    const-string v43, "device updated:"

    invoke-virtual/range {v42 .. v43}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v42

    move-object/from16 v0, v42

    invoke-virtual {v0, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v42

    invoke-virtual/range {v42 .. v42}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v42

    invoke-static/range {v41 .. v42}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 677
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/wemo/cache/cloud/CloudRequestUpdateDeviceList;->devicesList:Ljava/util/ArrayList;

    move-object/from16 v41, v0

    move-object/from16 v0, v41

    invoke-virtual {v0, v14}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_0

    goto/16 :goto_1

    .line 688
    .end local v7    # "bridgeUDN":Ljava/lang/String;
    .end local v10    # "currentIconVersion":I
    .end local v11    # "dbVersion":Ljava/lang/String;
    .end local v13    # "devListManager":Lcom/belkin/wemo/cache/devicelist/DeviceListManager;
    .end local v14    # "device":Lcom/belkin/wemo/cache/data/DeviceInformation;
    .end local v15    # "deviceList":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Lcom/belkin/wemo/cache/data/DeviceInformation;>;"
    .end local v16    # "doc":Lorg/w3c/dom/Document;
    .end local v18    # "e":Lorg/w3c/dom/Element;
    .end local v21    # "homeId":Ljava/lang/String;
    .end local v22    # "i":I
    .end local v24    # "icon":Ljava/lang/String;
    .end local v25    # "iconValid":Z
    .end local v28    # "modelCode":Ljava/lang/String;
    .end local v29    # "needIconUpdate":Z
    .end local v30    # "newIconVersion":I
    .end local v31    # "nl":Lorg/w3c/dom/NodeList;
    .end local v33    # "parser":Lcom/belkin/wemo/cache/cloud/XMLParser;
    .end local v34    # "pluginId":Ljava/lang/String;
    .end local v37    # "status":Ljava/lang/String;
    .end local v39    # "udn":Ljava/lang/String;
    :catch_0
    move-exception v20

    .line 689
    .local v20, "ex":Ljava/lang/Exception;
    invoke-virtual/range {v20 .. v20}, Ljava/lang/Exception;->printStackTrace()V

    .line 690
    const/16 v41, 0x0

    .end local v20    # "ex":Ljava/lang/Exception;
    :goto_b
    return v41

    .line 552
    .restart local v7    # "bridgeUDN":Ljava/lang/String;
    .restart local v13    # "devListManager":Lcom/belkin/wemo/cache/devicelist/DeviceListManager;
    .restart local v14    # "device":Lcom/belkin/wemo/cache/data/DeviceInformation;
    .restart local v15    # "deviceList":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Lcom/belkin/wemo/cache/data/DeviceInformation;>;"
    .restart local v16    # "doc":Lorg/w3c/dom/Document;
    .restart local v18    # "e":Lorg/w3c/dom/Element;
    .restart local v21    # "homeId":Ljava/lang/String;
    .restart local v22    # "i":I
    .restart local v28    # "modelCode":Ljava/lang/String;
    .restart local v31    # "nl":Lorg/w3c/dom/NodeList;
    .restart local v33    # "parser":Lcom/belkin/wemo/cache/cloud/XMLParser;
    .restart local v35    # "productName":Ljava/lang/String;
    .restart local v37    # "status":Ljava/lang/String;
    .restart local v39    # "udn":Ljava/lang/String;
    :cond_11
    :try_start_5
    invoke-static/range {v35 .. v35}, Lcom/belkin/wemo/cache/utils/StringUtils;->toLowerCamelCase(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v41

    move-object/from16 v0, v41

    invoke-virtual {v14, v0}, Lcom/belkin/wemo/cache/data/DeviceInformation;->setProductName(Ljava/lang/String;)V

    goto/16 :goto_3

    .line 559
    .restart local v36    # "productType":Ljava/lang/String;
    :cond_12
    invoke-static/range {v36 .. v36}, Lcom/belkin/wemo/cache/utils/StringUtils;->toLowerCamelCase(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v41

    move-object/from16 v0, v41

    invoke-virtual {v14, v0}, Lcom/belkin/wemo/cache/data/DeviceInformation;->setProductType(Ljava/lang/String;)V

    goto/16 :goto_4

    .line 574
    .end local v35    # "productName":Ljava/lang/String;
    .end local v36    # "productType":Ljava/lang/String;
    .restart local v10    # "currentIconVersion":I
    .restart local v24    # "icon":Ljava/lang/String;
    .restart local v30    # "newIconVersion":I
    :cond_13
    const/16 v29, 0x0

    goto/16 :goto_5

    .line 604
    .restart local v25    # "iconValid":Z
    .restart local v29    # "needIconUpdate":Z
    :catch_1
    move-exception v20

    .line 605
    .local v20, "ex":Ljava/lang/NumberFormatException;
    const-string v41, "SDK_CloudRequestUpdateDeviceList"

    new-instance v42, Ljava/lang/StringBuilder;

    invoke-direct/range {v42 .. v42}, Ljava/lang/StringBuilder;-><init>()V

    const-string v43, "Exception occured in parsing status ..setting status to 3"

    invoke-virtual/range {v42 .. v43}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v42

    move-object/from16 v0, v42

    move-object/from16 v1, v37

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v42

    invoke-virtual/range {v42 .. v42}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v42

    invoke-static/range {v41 .. v42}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 606
    const/16 v41, 0x3

    move/from16 v0, v41

    invoke-virtual {v14, v0}, Lcom/belkin/wemo/cache/data/DeviceInformation;->setState(I)V

    goto/16 :goto_6

    .line 609
    .end local v20    # "ex":Ljava/lang/NumberFormatException;
    :cond_14
    const-string v41, "SDK_CloudRequestUpdateDeviceList"

    new-instance v42, Ljava/lang/StringBuilder;

    invoke-direct/range {v42 .. v42}, Ljava/lang/StringBuilder;-><init>()V

    const-string v43, "Status is empty"

    invoke-virtual/range {v42 .. v43}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v42

    move-object/from16 v0, v42

    move-object/from16 v1, v37

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v42

    invoke-virtual/range {v42 .. v42}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v42

    invoke-static/range {v41 .. v42}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 610
    const/16 v41, 0x3

    move/from16 v0, v41

    invoke-virtual {v14, v0}, Lcom/belkin/wemo/cache/data/DeviceInformation;->setState(I)V

    goto/16 :goto_6

    .line 615
    :catch_2
    move-exception v20

    .line 616
    .restart local v20    # "ex":Ljava/lang/NumberFormatException;
    invoke-virtual/range {v20 .. v20}, Ljava/lang/NumberFormatException;->printStackTrace()V

    goto/16 :goto_7

    .line 619
    .end local v20    # "ex":Ljava/lang/NumberFormatException;
    :cond_15
    const-string v41, "SDK_CloudRequestUpdateDeviceList"

    const-string v42, "StatusTS is empty"

    invoke-static/range {v41 .. v42}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    goto/16 :goto_7

    .line 629
    :cond_16
    const/16 v41, 0x0

    move/from16 v0, v41

    invoke-virtual {v14, v0}, Lcom/belkin/wemo/cache/data/DeviceInformation;->setInActive(I)V

    .line 630
    const/16 v41, 0x1

    move/from16 v0, v41

    invoke-virtual {v14, v0}, Lcom/belkin/wemo/cache/data/DeviceInformation;->setIsDiscovered(Z)V

    goto/16 :goto_8

    .line 634
    :cond_17
    invoke-virtual {v14}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getState()I

    move-result v41

    const/16 v42, 0x1

    move/from16 v0, v41

    move/from16 v1, v42

    if-ne v0, v1, :cond_18

    .line 635
    const-string v41, "1"

    move-object/from16 v0, v41

    invoke-virtual {v14, v0}, Lcom/belkin/wemo/cache/data/DeviceInformation;->setBinaryState(Ljava/lang/String;)V

    goto/16 :goto_9

    .line 636
    :cond_18
    invoke-virtual {v14}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getState()I

    move-result v41

    const/16 v42, 0x8

    move/from16 v0, v41

    move/from16 v1, v42

    if-ne v0, v1, :cond_e

    .line 637
    const-string v41, "8"

    move-object/from16 v0, v41

    invoke-virtual {v14, v0}, Lcom/belkin/wemo/cache/data/DeviceInformation;->setBinaryState(Ljava/lang/String;)V

    goto/16 :goto_9

    .line 659
    .restart local v11    # "dbVersion":Ljava/lang/String;
    .restart local v34    # "pluginId":Ljava/lang/String;
    :cond_19
    const-string v41, "attributeLists"

    move-object/from16 v0, v18

    move-object/from16 v1, v41

    invoke-interface {v0, v1}, Lorg/w3c/dom/Element;->getElementsByTagName(Ljava/lang/String;)Lorg/w3c/dom/NodeList;

    move-result-object v32

    .line 660
    .local v32, "nodelist":Lorg/w3c/dom/NodeList;
    const/16 v40, 0x0

    .local v40, "y":I
    :goto_c
    invoke-interface/range {v32 .. v32}, Lorg/w3c/dom/NodeList;->getLength()I

    move-result v41

    move/from16 v0, v40

    move/from16 v1, v41

    if-ge v0, v1, :cond_1a

    .line 661
    const-string v41, "SDK_CloudRequestUpdateDeviceList"

    new-instance v42, Ljava/lang/StringBuilder;

    invoke-direct/range {v42 .. v42}, Ljava/lang/StringBuilder;-><init>()V

    const-string v43, "GET ATTRIBUTES. Attr: "

    invoke-virtual/range {v42 .. v43}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v42

    move-object/from16 v0, v32

    move/from16 v1, v40

    invoke-interface {v0, v1}, Lorg/w3c/dom/NodeList;->item(I)Lorg/w3c/dom/Node;

    move-result-object v43

    invoke-static/range {v43 .. v43}, Lcom/belkin/wemo/cache/cloud/CloudRequestUpdateDeviceList;->nodeToString(Lorg/w3c/dom/Node;)Ljava/lang/String;

    move-result-object v43

    invoke-virtual/range {v42 .. v43}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v42

    invoke-virtual/range {v42 .. v42}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v42

    invoke-static/range {v41 .. v42}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->debugLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 660
    add-int/lit8 v40, v40, 0x1

    goto :goto_c

    .line 663
    :cond_1a
    const-string v41, "attributeLists"

    move-object/from16 v0, v18

    move-object/from16 v1, v41

    invoke-interface {v0, v1}, Lorg/w3c/dom/Element;->getElementsByTagName(Ljava/lang/String;)Lorg/w3c/dom/NodeList;

    move-result-object v41

    if-eqz v41, :cond_10

    const-string v41, "attributeLists"

    move-object/from16 v0, v18

    move-object/from16 v1, v41

    invoke-interface {v0, v1}, Lorg/w3c/dom/Element;->getElementsByTagName(Ljava/lang/String;)Lorg/w3c/dom/NodeList;

    move-result-object v41

    invoke-interface/range {v41 .. v41}, Lorg/w3c/dom/NodeList;->getLength()I

    move-result v41

    if-lez v41, :cond_10

    .line 664
    const-string v41, "attributeLists"

    move-object/from16 v0, v18

    move-object/from16 v1, v41

    invoke-interface {v0, v1}, Lorg/w3c/dom/Element;->getElementsByTagName(Ljava/lang/String;)Lorg/w3c/dom/NodeList;

    move-result-object v41

    const/16 v42, 0x0

    invoke-interface/range {v41 .. v42}, Lorg/w3c/dom/NodeList;->item(I)Lorg/w3c/dom/Node;

    move-result-object v4

    .line 665
    .local v4, "attrNode":Lorg/w3c/dom/Node;
    if-eqz v4, :cond_10

    .line 666
    new-instance v41, Lcom/belkin/wemo/localsdk/parser/GetAttributeResponseParser;

    invoke-direct/range {v41 .. v41}, Lcom/belkin/wemo/localsdk/parser/GetAttributeResponseParser;-><init>()V

    invoke-static {v4}, Lcom/belkin/wemo/cache/cloud/CloudRequestUpdateDeviceList;->nodeToString(Lorg/w3c/dom/Node;)Ljava/lang/String;

    move-result-object v42

    invoke-virtual/range {v41 .. v42}, Lcom/belkin/wemo/localsdk/parser/GetAttributeResponseParser;->parseGetAttributeResponse(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v5

    .line 667
    .local v5, "attributes":Lorg/json/JSONObject;
    const-string v41, "SDK_CloudRequestUpdateDeviceList"

    new-instance v42, Ljava/lang/StringBuilder;

    invoke-direct/range {v42 .. v42}, Ljava/lang/StringBuilder;-><init>()V

    const-string v43, "attributeList"

    invoke-virtual/range {v42 .. v43}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v42

    move-object/from16 v0, v42

    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v42

    invoke-virtual/range {v42 .. v42}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v42

    invoke-static/range {v41 .. v42}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 668
    if-eqz v5, :cond_10

    .line 669
    invoke-virtual {v14, v5}, Lcom/belkin/wemo/cache/data/DeviceInformation;->setAttributeList(Lorg/json/JSONObject;)V

    goto/16 :goto_a

    .line 684
    .end local v4    # "attrNode":Lorg/w3c/dom/Node;
    .end local v5    # "attributes":Lorg/json/JSONObject;
    .end local v10    # "currentIconVersion":I
    .end local v11    # "dbVersion":Ljava/lang/String;
    .end local v13    # "devListManager":Lcom/belkin/wemo/cache/devicelist/DeviceListManager;
    .end local v15    # "deviceList":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Lcom/belkin/wemo/cache/data/DeviceInformation;>;"
    .end local v18    # "e":Lorg/w3c/dom/Element;
    .end local v21    # "homeId":Ljava/lang/String;
    .end local v24    # "icon":Ljava/lang/String;
    .end local v25    # "iconValid":Z
    .end local v28    # "modelCode":Ljava/lang/String;
    .end local v29    # "needIconUpdate":Z
    .end local v30    # "newIconVersion":I
    .end local v32    # "nodelist":Lorg/w3c/dom/NodeList;
    .end local v34    # "pluginId":Ljava/lang/String;
    .end local v37    # "status":Ljava/lang/String;
    .end local v39    # "udn":Ljava/lang/String;
    .end local v40    # "y":I
    :cond_1b
    const-string v41, ""

    move-object/from16 v0, v41

    if-eq v0, v7, :cond_1c

    .line 685
    move-object/from16 v0, p0

    move-object/from16 v1, p1

    invoke-direct {v0, v1, v7}, Lcom/belkin/wemo/cache/cloud/CloudRequestUpdateDeviceList;->searchForZigBee(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_5
    .catch Ljava/lang/Exception; {:try_start_5 .. :try_end_5} :catch_0

    .line 687
    :cond_1c
    const/16 v41, 0x1

    goto/16 :goto_b
.end method

.method public static parseResponseFromCloudByTagName(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lorg/json/JSONArray;
    .locals 11
    .param p0, "response"    # Ljava/lang/String;
    .param p1, "parentNode"    # Ljava/lang/String;
    .param p2, "childNode"    # Ljava/lang/String;

    .prologue
    .line 130
    :try_start_0
    new-instance v5, Lcom/belkin/wemo/cache/cloud/XMLParser;

    invoke-direct {v5}, Lcom/belkin/wemo/cache/cloud/XMLParser;-><init>()V

    .line 131
    .local v5, "parser":Lcom/belkin/wemo/cache/cloud/XMLParser;
    invoke-virtual {v5, p0}, Lcom/belkin/wemo/cache/cloud/XMLParser;->getDomElement(Ljava/lang/String;)Lorg/w3c/dom/Document;

    move-result-object v0

    .line 132
    .local v0, "doc":Lorg/w3c/dom/Document;
    invoke-interface {v0, p1}, Lorg/w3c/dom/Document;->getElementsByTagName(Ljava/lang/String;)Lorg/w3c/dom/NodeList;

    move-result-object v4

    .line 133
    .local v4, "nl":Lorg/w3c/dom/NodeList;
    const/4 v8, 0x0

    invoke-interface {v4, v8}, Lorg/w3c/dom/NodeList;->item(I)Lorg/w3c/dom/Node;

    move-result-object v1

    check-cast v1, Lorg/w3c/dom/Element;

    .line 134
    .local v1, "e":Lorg/w3c/dom/Element;
    invoke-interface {v1, p2}, Lorg/w3c/dom/Element;->getElementsByTagName(Ljava/lang/String;)Lorg/w3c/dom/NodeList;

    move-result-object v3

    .line 135
    .local v3, "n":Lorg/w3c/dom/NodeList;
    new-instance v6, Lorg/json/JSONArray;

    invoke-direct {v6}, Lorg/json/JSONArray;-><init>()V

    .line 136
    .local v6, "resultArray":Lorg/json/JSONArray;
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_0
    invoke-interface {v3}, Lorg/w3c/dom/NodeList;->getLength()I

    move-result v8

    if-ge v2, v8, :cond_0

    .line 137
    invoke-interface {v3, v2}, Lorg/w3c/dom/NodeList;->item(I)Lorg/w3c/dom/Node;

    move-result-object v8

    invoke-interface {v8}, Lorg/w3c/dom/Node;->getTextContent()Ljava/lang/String;

    move-result-object v7

    .line 138
    .local v7, "ssid":Ljava/lang/String;
    invoke-virtual {v6, v7}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;

    .line 136
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 140
    .end local v7    # "ssid":Ljava/lang/String;
    :cond_0
    const-string v8, "SDK_CloudRequestUpdateDeviceList"

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

    .line 144
    .end local v0    # "doc":Lorg/w3c/dom/Document;
    .end local v1    # "e":Lorg/w3c/dom/Element;
    .end local v2    # "i":I
    .end local v3    # "n":Lorg/w3c/dom/NodeList;
    .end local v4    # "nl":Lorg/w3c/dom/NodeList;
    .end local v5    # "parser":Lcom/belkin/wemo/cache/cloud/XMLParser;
    .end local v6    # "resultArray":Lorg/json/JSONArray;
    :goto_1
    return-object v6

    .line 142
    :catch_0
    move-exception v1

    .line 143
    .local v1, "e":Ljava/lang/Exception;
    const-string v8, "SDK_CloudRequestUpdateDeviceList"

    const-string v9, "Caught Exception in parseResponseFromCloudByTagName: "

    invoke-static {v8, v9, v1}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Exception;)V

    .line 144
    const/4 v6, 0x0

    goto :goto_1
.end method

.method private searchForZigBee(Ljava/lang/String;Ljava/lang/String;)V
    .locals 28
    .param p1, "response"    # Ljava/lang/String;
    .param p2, "bridgeUDN"    # Ljava/lang/String;

    .prologue
    .line 378
    :try_start_0
    const-string v3, "SDK_CloudRequestUpdateDeviceList"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "Searching for Zigbee Devices in CloudRequestUpdateDeviceList response. Bridge UDN: "

    invoke-virtual {v4, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    move-object/from16 v0, p2

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->debugLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 379
    new-instance v23, Lcom/belkin/wemo/cache/cloud/XMLParser;

    invoke-direct/range {v23 .. v23}, Lcom/belkin/wemo/cache/cloud/XMLParser;-><init>()V

    .line 380
    .local v23, "parser":Lcom/belkin/wemo/cache/cloud/XMLParser;
    move-object/from16 v0, v23

    move-object/from16 v1, p1

    invoke-virtual {v0, v1}, Lcom/belkin/wemo/cache/cloud/XMLParser;->getDomElement(Ljava/lang/String;)Lorg/w3c/dom/Document;

    move-result-object v13

    .line 381
    .local v13, "doc":Lorg/w3c/dom/Document;
    const-string v3, "device"

    invoke-interface {v13, v3}, Lorg/w3c/dom/Document;->getElementsByTagName(Ljava/lang/String;)Lorg/w3c/dom/NodeList;

    move-result-object v22

    .line 382
    .local v22, "nl":Lorg/w3c/dom/NodeList;
    sget-object v3, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->devListManager:Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    invoke-virtual {v3}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->getDeviceInformationList()Ljava/util/Map;

    move-result-object v12

    .line 384
    .local v12, "deviceList":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Lcom/belkin/wemo/cache/data/DeviceInformation;>;"
    const/16 v17, 0x0

    .local v17, "i":I
    :goto_0
    invoke-interface/range {v22 .. v22}, Lorg/w3c/dom/NodeList;->getLength()I

    move-result v3

    move/from16 v0, v17

    if-ge v0, v3, :cond_a

    .line 385
    move-object/from16 v0, v22

    move/from16 v1, v17

    invoke-interface {v0, v1}, Lorg/w3c/dom/NodeList;->item(I)Lorg/w3c/dom/Node;

    move-result-object v14

    check-cast v14, Lorg/w3c/dom/Element;

    .line 386
    .local v14, "e":Lorg/w3c/dom/Element;
    const-string v3, "modelCode"

    move-object/from16 v0, v23

    invoke-virtual {v0, v14, v3}, Lcom/belkin/wemo/cache/cloud/XMLParser;->getValue(Lorg/w3c/dom/Element;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v9

    .line 387
    .local v9, "modelCode":Ljava/lang/String;
    const-string v3, "status"

    move-object/from16 v0, v23

    invoke-virtual {v0, v14, v3}, Lcom/belkin/wemo/cache/cloud/XMLParser;->getValue(Lorg/w3c/dom/Element;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v5

    .line 390
    .local v5, "ledState":I
    invoke-static {v9}, Lcom/belkin/wemo/cache/utils/WemoUtils;->isLEDModelCodeSupported(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_6

    .line 391
    const/4 v2, 0x0

    .line 392
    .local v2, "device":Lcom/belkin/wemo/cache/data/DeviceInformation;
    move-object/from16 v0, p0

    move-object/from16 v1, v23

    invoke-direct {v0, v1, v14, v5}, Lcom/belkin/wemo/cache/cloud/CloudRequestUpdateDeviceList;->extractCapabilities(Lcom/belkin/wemo/cache/cloud/XMLParser;Lorg/w3c/dom/Element;I)Ljava/lang/String;

    move-result-object v6

    .line 393
    .local v6, "capabilities":Ljava/lang/String;
    move-object/from16 v0, p0

    move-object/from16 v1, v23

    invoke-direct {v0, v1, v14}, Lcom/belkin/wemo/cache/cloud/CloudRequestUpdateDeviceList;->extractTimeStamp(Lcom/belkin/wemo/cache/cloud/XMLParser;Lorg/w3c/dom/Element;)Ljava/lang/String;

    move-result-object v19

    .line 394
    .local v19, "lastEventTimeStamp":Ljava/lang/String;
    const-string v20, ""

    .line 395
    .local v20, "ledGroupId":Ljava/lang/String;
    const-string v21, ""
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1

    .line 397
    .local v21, "ledGroupName":Ljava/lang/String;
    :try_start_1
    const-string v3, "groupProfiles"

    invoke-interface {v14, v3}, Lorg/w3c/dom/Element;->getElementsByTagName(Ljava/lang/String;)Lorg/w3c/dom/NodeList;

    move-result-object v3

    const/4 v4, 0x0

    invoke-interface {v3, v4}, Lorg/w3c/dom/NodeList;->item(I)Lorg/w3c/dom/Node;

    move-result-object v26

    .line 399
    .local v26, "root":Lorg/w3c/dom/Node;
    if-eqz v26, :cond_0

    .line 400
    const/16 v18, 0x0

    .local v18, "j":I
    :goto_1
    invoke-interface/range {v26 .. v26}, Lorg/w3c/dom/Node;->getChildNodes()Lorg/w3c/dom/NodeList;

    move-result-object v3

    invoke-interface {v3}, Lorg/w3c/dom/NodeList;->getLength()I

    move-result v3

    move/from16 v0, v18

    if-ge v0, v3, :cond_0

    .line 402
    invoke-interface/range {v26 .. v26}, Lorg/w3c/dom/Node;->getChildNodes()Lorg/w3c/dom/NodeList;

    move-result-object v3

    move/from16 v0, v18

    invoke-interface {v3, v0}, Lorg/w3c/dom/NodeList;->item(I)Lorg/w3c/dom/Node;

    move-result-object v15

    check-cast v15, Lorg/w3c/dom/Element;

    .line 404
    .local v15, "el":Lorg/w3c/dom/Element;
    const-string v3, "referenceId"

    move-object/from16 v0, v23

    invoke-virtual {v0, v15, v3}, Lcom/belkin/wemo/cache/cloud/XMLParser;->getValue(Lorg/w3c/dom/Element;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v20

    .line 406
    const-string v3, "groupName"

    move-object/from16 v0, v23

    invoke-virtual {v0, v15, v3}, Lcom/belkin/wemo/cache/cloud/XMLParser;->getValue(Lorg/w3c/dom/Element;Ljava/lang/String;)Ljava/lang/String;
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    move-result-object v21

    .line 401
    add-int/lit8 v18, v18, 0x1

    goto :goto_1

    .line 411
    .end local v15    # "el":Lorg/w3c/dom/Element;
    .end local v18    # "j":I
    .end local v26    # "root":Lorg/w3c/dom/Node;
    :catch_0
    move-exception v16

    .line 412
    .local v16, "ex":Ljava/lang/Exception;
    :try_start_2
    const-string v3, "SDK_CloudRequestUpdateDeviceList"

    const-string v4, "Exception in searchForZigBee: "

    move-object/from16 v0, v16

    invoke-static {v3, v4, v0}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Exception;)V

    .line 414
    .end local v16    # "ex":Ljava/lang/Exception;
    :cond_0
    const-string v3, "RemoteMode:"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "groupID"

    invoke-virtual {v4, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    move-object/from16 v0, v20

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v7, "groupName:"

    invoke-virtual {v4, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    move-object/from16 v0, v21

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 416
    const-string v3, "macAddress"

    move-object/from16 v0, v23

    invoke-virtual {v0, v14, v3}, Lcom/belkin/wemo/cache/cloud/XMLParser;->getValue(Lorg/w3c/dom/Element;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v27

    .line 417
    .local v27, "uniqueID":Ljava/lang/String;
    const-string v3, "RemoteMode:"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, v27

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v7, " led state:"

    invoke-virtual {v4, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 418
    if-eqz v12, :cond_1

    .line 419
    move-object/from16 v0, v27

    invoke-interface {v12, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    .end local v2    # "device":Lcom/belkin/wemo/cache/data/DeviceInformation;
    check-cast v2, Lcom/belkin/wemo/cache/data/DeviceInformation;

    .line 420
    .restart local v2    # "device":Lcom/belkin/wemo/cache/data/DeviceInformation;
    :cond_1
    if-nez v2, :cond_2

    .line 421
    new-instance v2, Lcom/belkin/wemo/cache/data/DeviceInformation;

    .end local v2    # "device":Lcom/belkin/wemo/cache/data/DeviceInformation;
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/belkin/wemo/cache/cloud/CloudRequestUpdateDeviceList;->mBridgeList:Ljava/util/Hashtable;

    const-string v4, "parentPluginId"

    move-object/from16 v0, v23

    invoke-virtual {v0, v14, v4}, Lcom/belkin/wemo/cache/cloud/XMLParser;->getValue(Lorg/w3c/dom/Element;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/util/Hashtable;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lorg/json/JSONObject;

    const-string v4, "uniqueId"

    invoke-virtual {v3, v4}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

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

    .line 425
    .restart local v2    # "device":Lcom/belkin/wemo/cache/data/DeviceInformation;
    const-string v3, "productName"

    move-object/from16 v0, v23

    invoke-virtual {v0, v14, v3}, Lcom/belkin/wemo/cache/cloud/XMLParser;->getValue(Lorg/w3c/dom/Element;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v24

    .line 426
    .local v24, "productName":Ljava/lang/String;
    invoke-virtual/range {v24 .. v24}, Ljava/lang/String;->isEmpty()Z

    move-result v3

    if-eqz v3, :cond_7

    .line 427
    sget-object v3, Lcom/belkin/wemo/cache/data/DevicesArray;->productNameMapping:Ljava/util/HashMap;

    invoke-virtual {v2}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getModelCode()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    invoke-static {v3}, Lcom/belkin/wemo/cache/utils/StringUtils;->toLowerCamelCase(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Lcom/belkin/wemo/cache/data/DeviceInformation;->setProductName(Ljava/lang/String;)V

    .line 432
    :goto_2
    const-string v3, "productType"

    move-object/from16 v0, v23

    invoke-virtual {v0, v14, v3}, Lcom/belkin/wemo/cache/cloud/XMLParser;->getValue(Lorg/w3c/dom/Element;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v25

    .line 433
    .local v25, "productType":Ljava/lang/String;
    invoke-virtual/range {v25 .. v25}, Ljava/lang/String;->isEmpty()Z

    move-result v3

    if-eqz v3, :cond_8

    .line 434
    sget-object v3, Lcom/belkin/wemo/cache/data/DevicesArray;->productTypeMapping:Ljava/util/HashMap;

    invoke-virtual {v2}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getModelCode()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    invoke-static {v3}, Lcom/belkin/wemo/cache/utils/StringUtils;->toLowerCamelCase(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Lcom/belkin/wemo/cache/data/DeviceInformation;->setProductType(Ljava/lang/String;)V

    .line 438
    :goto_3
    move-object/from16 v0, v20

    invoke-virtual {v2, v0}, Lcom/belkin/wemo/cache/data/DeviceInformation;->setGroupID(Ljava/lang/String;)V

    .line 439
    move-object/from16 v0, v21

    invoke-virtual {v2, v0}, Lcom/belkin/wemo/cache/data/DeviceInformation;->setGroupName(Ljava/lang/String;)V

    .line 440
    move-object/from16 v0, v27

    invoke-virtual {v2, v0}, Lcom/belkin/wemo/cache/data/DeviceInformation;->setUDN(Ljava/lang/String;)V

    .line 441
    move-object/from16 v0, v27

    invoke-virtual {v2, v0}, Lcom/belkin/wemo/cache/data/DeviceInformation;->setMAC(Ljava/lang/String;)V

    .line 442
    const-string v3, "manufacturer"

    move-object/from16 v0, v23

    invoke-virtual {v0, v14, v3}, Lcom/belkin/wemo/cache/cloud/XMLParser;->getValue(Lorg/w3c/dom/Element;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-static {v3, v9}, Lcom/belkin/wemo/cache/utils/WemoUtils;->getZigbeeIcon(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Lcom/belkin/wemo/cache/data/DeviceInformation;->setIcon(Ljava/lang/String;)V

    .line 445
    .end local v24    # "productName":Ljava/lang/String;
    .end local v25    # "productType":Ljava/lang/String;
    :cond_2
    invoke-virtual {v2, v5}, Lcom/belkin/wemo/cache/data/DeviceInformation;->setState(I)V

    .line 446
    move-object/from16 v0, p2

    invoke-virtual {v2, v0}, Lcom/belkin/wemo/cache/data/DeviceInformation;->setBridgeUDN(Ljava/lang/String;)V

    .line 447
    invoke-virtual/range {v20 .. v20}, Ljava/lang/String;->isEmpty()Z

    move-result v3

    if-nez v3, :cond_3

    .line 448
    const-string v3, "manufacturer"

    move-object/from16 v0, v23

    invoke-virtual {v0, v14, v3}, Lcom/belkin/wemo/cache/cloud/XMLParser;->getValue(Lorg/w3c/dom/Element;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-static {v3, v9}, Lcom/belkin/wemo/cache/utils/WemoUtils;->getZigbeeIcon(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Lcom/belkin/wemo/cache/data/DeviceInformation;->setGroupIcon(Ljava/lang/String;)V

    .line 450
    :cond_3
    invoke-static/range {v19 .. v19}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v3

    if-nez v3, :cond_4

    .line 451
    invoke-static/range {v19 .. v19}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v3

    invoke-virtual {v2, v3}, Lcom/belkin/wemo/cache/data/DeviceInformation;->setStatusTS(I)V

    .line 452
    :cond_4
    invoke-virtual {v2, v6}, Lcom/belkin/wemo/cache/data/DeviceInformation;->setCapabilities(Ljava/lang/String;)V

    .line 453
    const/4 v3, 0x1

    invoke-virtual {v2, v3}, Lcom/belkin/wemo/cache/data/DeviceInformation;->setRemote(Z)V

    .line 454
    move-object/from16 v0, v20

    invoke-virtual {v2, v0}, Lcom/belkin/wemo/cache/data/DeviceInformation;->setGroupID(Ljava/lang/String;)V

    .line 455
    move-object/from16 v0, v21

    invoke-virtual {v2, v0}, Lcom/belkin/wemo/cache/data/DeviceInformation;->setGroupName(Ljava/lang/String;)V

    .line 456
    const-string v3, "pluginId"

    move-object/from16 v0, v23

    invoke-virtual {v0, v14, v3}, Lcom/belkin/wemo/cache/cloud/XMLParser;->getValue(Lorg/w3c/dom/Element;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Lcom/belkin/wemo/cache/data/DeviceInformation;->setPluginId(Ljava/lang/String;)V

    .line 457
    const-string v3, "friendlyName"

    move-object/from16 v0, v23

    invoke-virtual {v0, v14, v3}, Lcom/belkin/wemo/cache/cloud/XMLParser;->getValue(Lorg/w3c/dom/Element;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Lcom/belkin/wemo/cache/data/DeviceInformation;->setFriendlyName(Ljava/lang/String;)V

    .line 458
    const-string v3, "fwUpgradeStatus"

    move-object/from16 v0, v23

    invoke-virtual {v0, v14, v3}, Lcom/belkin/wemo/cache/cloud/XMLParser;->getValue(Lorg/w3c/dom/Element;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Lcom/belkin/wemo/cache/data/DeviceInformation;->setFwStatus(Ljava/lang/String;)V

    .line 459
    const-string v3, "firmwareVersion"

    move-object/from16 v0, v23

    invoke-virtual {v0, v14, v3}, Lcom/belkin/wemo/cache/cloud/XMLParser;->getValue(Lorg/w3c/dom/Element;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Lcom/belkin/wemo/cache/data/DeviceInformation;->setFirmwareVersion(Ljava/lang/String;)V

    .line 460
    const/4 v3, 0x3

    if-eq v5, v3, :cond_5

    const/4 v3, 0x4

    if-ne v5, v3, :cond_9

    .line 462
    :cond_5
    const-string v3, "SDK_CloudRequestUpdateDeviceList"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "not reachable: "

    invoke-virtual {v4, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 463
    const/4 v3, 0x1

    invoke-virtual {v2, v3}, Lcom/belkin/wemo/cache/data/DeviceInformation;->setInActive(I)V

    .line 464
    const/4 v3, 0x0

    invoke-virtual {v2, v3}, Lcom/belkin/wemo/cache/data/DeviceInformation;->setIsDiscovered(Z)V

    .line 471
    :goto_4
    const-string v3, "SDK_CloudRequestUpdateDeviceList"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "LED Device Found in Remote: "

    invoke-virtual {v4, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->debugLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 473
    if-eqz v2, :cond_6

    .line 474
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/belkin/wemo/cache/cloud/CloudRequestUpdateDeviceList;->devicesList:Ljava/util/ArrayList;

    invoke-virtual {v3, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 384
    .end local v2    # "device":Lcom/belkin/wemo/cache/data/DeviceInformation;
    .end local v6    # "capabilities":Ljava/lang/String;
    .end local v19    # "lastEventTimeStamp":Ljava/lang/String;
    .end local v20    # "ledGroupId":Ljava/lang/String;
    .end local v21    # "ledGroupName":Ljava/lang/String;
    .end local v27    # "uniqueID":Ljava/lang/String;
    :cond_6
    add-int/lit8 v17, v17, 0x1

    goto/16 :goto_0

    .line 429
    .restart local v2    # "device":Lcom/belkin/wemo/cache/data/DeviceInformation;
    .restart local v6    # "capabilities":Ljava/lang/String;
    .restart local v19    # "lastEventTimeStamp":Ljava/lang/String;
    .restart local v20    # "ledGroupId":Ljava/lang/String;
    .restart local v21    # "ledGroupName":Ljava/lang/String;
    .restart local v24    # "productName":Ljava/lang/String;
    .restart local v27    # "uniqueID":Ljava/lang/String;
    :cond_7
    invoke-static/range {v24 .. v24}, Lcom/belkin/wemo/cache/utils/StringUtils;->toLowerCamelCase(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Lcom/belkin/wemo/cache/data/DeviceInformation;->setProductName(Ljava/lang/String;)V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_1

    goto/16 :goto_2

    .line 479
    .end local v2    # "device":Lcom/belkin/wemo/cache/data/DeviceInformation;
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

    .line 480
    .local v14, "e":Ljava/lang/Exception;
    const-string v3, "SDK_CloudRequestUpdateDeviceList"

    const-string v4, "Exception in searchForZigBee: "

    invoke-static {v3, v4, v14}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Exception;)V

    .line 482
    .end local v14    # "e":Ljava/lang/Exception;
    :goto_5
    return-void

    .line 436
    .restart local v2    # "device":Lcom/belkin/wemo/cache/data/DeviceInformation;
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
    :cond_8
    :try_start_3
    invoke-static/range {v25 .. v25}, Lcom/belkin/wemo/cache/utils/StringUtils;->toLowerCamelCase(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Lcom/belkin/wemo/cache/data/DeviceInformation;->setProductType(Ljava/lang/String;)V

    goto/16 :goto_3

    .line 466
    .end local v24    # "productName":Ljava/lang/String;
    .end local v25    # "productType":Ljava/lang/String;
    :cond_9
    const/4 v3, 0x0

    invoke-virtual {v2, v3}, Lcom/belkin/wemo/cache/data/DeviceInformation;->setInActive(I)V

    .line 467
    const/4 v3, 0x1

    invoke-virtual {v2, v3}, Lcom/belkin/wemo/cache/data/DeviceInformation;->setIsDiscovered(Z)V

    .line 468
    const-string v3, "SDK_CloudRequestUpdateDeviceList"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "reachable: "

    invoke-virtual {v4, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_4

    .line 478
    .end local v2    # "device":Lcom/belkin/wemo/cache/data/DeviceInformation;
    .end local v5    # "ledState":I
    .end local v6    # "capabilities":Ljava/lang/String;
    .end local v9    # "modelCode":Ljava/lang/String;
    .end local v14    # "e":Lorg/w3c/dom/Element;
    .end local v19    # "lastEventTimeStamp":Ljava/lang/String;
    .end local v20    # "ledGroupId":Ljava/lang/String;
    .end local v21    # "ledGroupName":Ljava/lang/String;
    .end local v27    # "uniqueID":Ljava/lang/String;
    :cond_a
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/belkin/wemo/cache/cloud/CloudRequestUpdateDeviceList;->mDevMgr:Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    invoke-virtual {v3}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->getLEDDeviceIconInfo()V
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
    .line 798
    const/4 v0, 0x0

    return-object v0
.end method

.method public getBody()Ljava/lang/String;
    .locals 1

    .prologue
    .line 125
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
    .line 773
    iget-object v0, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestUpdateDeviceList;->devicesList:Ljava/util/ArrayList;

    return-object v0
.end method

.method public getFileByteArray()[B
    .locals 1

    .prologue
    .line 782
    const/4 v0, 0x0

    return-object v0
.end method

.method public getRequestMethod()I
    .locals 1

    .prologue
    .line 106
    const/4 v0, 0x1

    return v0
.end method

.method public getTimeout()I
    .locals 1

    .prologue
    .line 111
    iget v0, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestUpdateDeviceList;->TIMEOUT:I

    return v0
.end method

.method public getTimeoutLimit()I
    .locals 1

    .prologue
    .line 116
    const v0, 0x9c40

    return v0
.end method

.method public getURL()Ljava/lang/String;
    .locals 1

    .prologue
    .line 120
    iget-object v0, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestUpdateDeviceList;->cloudURL:Ljava/lang/String;

    return-object v0
.end method

.method public getUploadFileName()Ljava/lang/String;
    .locals 1

    .prologue
    .line 787
    const/4 v0, 0x0

    return-object v0
.end method

.method public isAuthHeaderRequired()Z
    .locals 1

    .prologue
    .line 792
    const/4 v0, 0x1

    return v0
.end method

.method public requestComplete(ZI[B)V
    .locals 26
    .param p1, "success"    # Z
    .param p2, "statusCode"    # I
    .param p3, "resp"    # [B

    .prologue
    .line 151
    invoke-static {}, Lcom/belkin/wemo/cache/utils/Locks;->getInstance()Lcom/belkin/wemo/cache/utils/Locks;

    move-result-object v21

    sget-object v22, Lcom/belkin/wemo/cache/utils/Locks;->LOCK_GET_DEVICE_LIST:Ljava/lang/Integer;

    invoke-virtual/range {v21 .. v22}, Lcom/belkin/wemo/cache/utils/Locks;->unsetLock(Ljava/lang/Integer;)V

    .line 152
    const-string v21, "SDK_CloudRequestUpdateDeviceList"

    new-instance v22, Ljava/lang/StringBuilder;

    invoke-direct/range {v22 .. v22}, Ljava/lang/StringBuilder;-><init>()V

    const-string v23, "Response success: "

    invoke-virtual/range {v22 .. v23}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v22

    move-object/from16 v0, v22

    move/from16 v1, p1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v22

    const-string v23, " isLocal: "

    invoke-virtual/range {v22 .. v23}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v22

    invoke-static {}, Lcom/belkin/wemo/cache/utils/NetworkMode;->isLocal()Z

    move-result v23

    invoke-virtual/range {v22 .. v23}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v22

    invoke-virtual/range {v22 .. v22}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v22

    invoke-static/range {v21 .. v22}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 155
    if-eqz p1, :cond_0

    .line 157
    :try_start_0
    new-instance v16, Ljava/lang/String;

    const-string v21, "UTF-8"

    move-object/from16 v0, v16

    move-object/from16 v1, p3

    move-object/from16 v2, v21

    invoke-direct {v0, v1, v2}, Ljava/lang/String;-><init>([BLjava/lang/String;)V

    .line 159
    .local v16, "response":Ljava/lang/String;
    const-string v21, "SDK_CloudRequestUpdateDeviceList"

    move-object/from16 v0, v21

    move-object/from16 v1, v16

    invoke-static {v0, v1}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 160
    move-object/from16 v0, p0

    move-object/from16 v1, v16

    invoke-direct {v0, v1}, Lcom/belkin/wemo/cache/cloud/CloudRequestUpdateDeviceList;->parseResponse(Ljava/lang/String;)Z

    move-result v17

    .line 161
    .local v17, "responseParse":Z
    const-string v21, "SDK_CloudRequestUpdateDeviceList"

    new-instance v22, Ljava/lang/StringBuilder;

    invoke-direct/range {v22 .. v22}, Ljava/lang/StringBuilder;-><init>()V

    const-string v23, "Response parse: "

    invoke-virtual/range {v22 .. v23}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v22

    invoke-static/range {v17 .. v17}, Ljava/lang/String;->valueOf(Z)Ljava/lang/String;

    move-result-object v23

    invoke-virtual/range {v22 .. v23}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v22

    invoke-virtual/range {v22 .. v22}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v22

    invoke-static/range {v21 .. v22}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 162
    const-string v21, "SDK_CloudRequestUpdateDeviceList"

    const-string v22, "printing parsed devicelist in cloudUpdateAPI"

    invoke-static/range {v21 .. v22}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 163
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/wemo/cache/cloud/CloudRequestUpdateDeviceList;->devicesList:Ljava/util/ArrayList;

    move-object/from16 v21, v0

    invoke-virtual/range {v21 .. v21}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v11

    .local v11, "i$":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v11}, Ljava/util/Iterator;->hasNext()Z

    move-result v21

    if-eqz v21, :cond_1

    invoke-interface {v11}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Lcom/belkin/wemo/cache/data/DeviceInformation;

    .line 164
    .local v8, "dev":Lcom/belkin/wemo/cache/data/DeviceInformation;
    const-string v21, "SDK_CloudRequestUpdateDeviceList"

    new-instance v22, Ljava/lang/StringBuilder;

    invoke-direct/range {v22 .. v22}, Ljava/lang/StringBuilder;-><init>()V

    const-string v23, "dev udn:"

    invoke-virtual/range {v22 .. v23}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v22

    invoke-virtual {v8}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getUDN()Ljava/lang/String;

    move-result-object v23

    invoke-virtual/range {v22 .. v23}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v22

    const-string v23, " isDiscovered:"

    invoke-virtual/range {v22 .. v23}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v22

    invoke-virtual {v8}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getIsDiscovered()Z

    move-result v23

    invoke-virtual/range {v22 .. v23}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v22

    invoke-virtual/range {v22 .. v22}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v22

    invoke-static/range {v21 .. v22}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 298
    .end local v8    # "dev":Lcom/belkin/wemo/cache/data/DeviceInformation;
    .end local v11    # "i$":Ljava/util/Iterator;
    .end local v16    # "response":Ljava/lang/String;
    .end local v17    # "responseParse":Z
    :catch_0
    move-exception v10

    .line 299
    .local v10, "e":Ljava/io/UnsupportedEncodingException;
    const-string v21, "SDK_CloudRequestUpdateDeviceList"

    const-string v22, "Request error: "

    move-object/from16 v0, v21

    move-object/from16 v1, v22

    invoke-static {v0, v1, v10}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Exception;)V

    .line 305
    .end local v10    # "e":Ljava/io/UnsupportedEncodingException;
    :cond_0
    :goto_1
    invoke-static {}, Lcom/belkin/wemo/cache/utils/Locks;->getInstance()Lcom/belkin/wemo/cache/utils/Locks;

    move-result-object v21

    sget-object v22, Lcom/belkin/wemo/cache/utils/Locks;->LOCK_GET_DEVICE_LIST:Ljava/lang/Integer;

    invoke-virtual/range {v21 .. v22}, Lcom/belkin/wemo/cache/utils/Locks;->unsetLock(Ljava/lang/Integer;)V

    .line 306
    return-void

    .line 166
    .restart local v11    # "i$":Ljava/util/Iterator;
    .restart local v16    # "response":Ljava/lang/String;
    .restart local v17    # "responseParse":Z
    :cond_1
    if-eqz v17, :cond_d

    .line 170
    :try_start_1
    const-string v21, "groupSSIDs"

    const-string v22, "ssid"

    move-object/from16 v0, v16

    move-object/from16 v1, v21

    move-object/from16 v2, v22

    invoke-static {v0, v1, v2}, Lcom/belkin/wemo/cache/cloud/CloudRequestUpdateDeviceList;->parseResponseFromCloudByTagName(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v18

    .line 171
    .local v18, "ssidArray":Lorg/json/JSONArray;
    const-string v21, "groupArpMacs"

    const-string v22, "arpMac"

    move-object/from16 v0, v16

    move-object/from16 v1, v21

    move-object/from16 v2, v22

    invoke-static {v0, v1, v2}, Lcom/belkin/wemo/cache/cloud/CloudRequestUpdateDeviceList;->parseResponseFromCloudByTagName(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v5

    .line 172
    .local v5, "arpArray":Lorg/json/JSONArray;
    const-string v21, "SDK_CloudRequestUpdateDeviceList"

    new-instance v22, Ljava/lang/StringBuilder;

    invoke-direct/range {v22 .. v22}, Ljava/lang/StringBuilder;-><init>()V

    const-string v23, "setDeviceListFromCloud: ssidArray: "

    invoke-virtual/range {v22 .. v23}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v22

    move-object/from16 v0, v22

    move-object/from16 v1, v18

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v22

    const-string v23, " arpArray: "

    invoke-virtual/range {v22 .. v23}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v22

    move-object/from16 v0, v22

    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v22

    invoke-virtual/range {v22 .. v22}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v22

    invoke-static/range {v21 .. v22}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 173
    if-eqz v18, :cond_2

    if-eqz v5, :cond_2

    .line 174
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/wemo/cache/cloud/CloudRequestUpdateDeviceList;->mDevMgr:Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    move-object/from16 v21, v0

    move-object/from16 v0, v21

    move-object/from16 v1, v18

    invoke-virtual {v0, v1, v5}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->setArpMacSSIDsFromCloud(Lorg/json/JSONArray;Lorg/json/JSONArray;)V

    .line 183
    :cond_2
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/wemo/cache/cloud/CloudRequestUpdateDeviceList;->mDevMgr:Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    move-object/from16 v21, v0

    invoke-virtual/range {v21 .. v21}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->getDeviceUDNListFromDB()Ljava/util/List;

    move-result-object v7

    .line 185
    .local v7, "dbDeviceUDNList":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/wemo/cache/cloud/CloudRequestUpdateDeviceList;->devicesList:Ljava/util/ArrayList;

    move-object/from16 v21, v0

    invoke-virtual/range {v21 .. v21}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v11

    :cond_3
    :goto_2
    invoke-interface {v11}, Ljava/util/Iterator;->hasNext()Z

    move-result v21

    if-eqz v21, :cond_b

    invoke-interface {v11}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Lcom/belkin/wemo/cache/data/DeviceInformation;

    .line 187
    .restart local v8    # "dev":Lcom/belkin/wemo/cache/data/DeviceInformation;
    invoke-virtual {v8}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getUDN()Ljava/lang/String;

    move-result-object v20

    .line 189
    .local v20, "udn":Ljava/lang/String;
    move-object/from16 v0, v20

    invoke-interface {v7, v0}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    .line 191
    const-string v21, "RemoteMode:"

    new-instance v22, Ljava/lang/StringBuilder;

    invoke-direct/range {v22 .. v22}, Ljava/lang/StringBuilder;-><init>()V

    const-string v23, " adding dev "

    invoke-virtual/range {v22 .. v23}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v22

    invoke-virtual {v8}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getUDN()Ljava/lang/String;

    move-result-object v23

    invoke-virtual/range {v22 .. v23}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v22

    const-string v23, "  "

    invoke-virtual/range {v22 .. v23}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v22

    invoke-virtual {v8}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getIsDiscovered()Z

    move-result v23

    invoke-virtual/range {v22 .. v23}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v22

    invoke-virtual/range {v22 .. v22}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v22

    invoke-static/range {v21 .. v22}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 192
    invoke-virtual {v8}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getUDN()Ljava/lang/String;

    move-result-object v21

    invoke-static/range {v21 .. v21}, Lcom/belkin/wemo/cache/utils/IsDevice;->Crockpot(Ljava/lang/String;)Z

    move-result v21

    if-eqz v21, :cond_4

    .line 193
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/wemo/cache/cloud/CloudRequestUpdateDeviceList;->devicesArray:Lcom/belkin/wemo/cache/data/DevicesArray;

    move-object/from16 v21, v0

    invoke-virtual {v8}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getUDN()Ljava/lang/String;

    move-result-object v22

    invoke-virtual/range {v21 .. v22}, Lcom/belkin/wemo/cache/data/DevicesArray;->getDeviceInformation(Ljava/lang/String;)Lcom/belkin/wemo/cache/data/DeviceInformation;

    move-result-object v9

    .line 194
    .local v9, "devInfo":Lcom/belkin/wemo/cache/data/DeviceInformation;
    if-eqz v9, :cond_4

    .line 195
    invoke-virtual {v9}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getAttributeList()Lorg/json/JSONObject;
    :try_end_1
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_1 .. :try_end_1} :catch_0

    move-result-object v6

    .line 198
    .local v6, "attributeList":Lorg/json/JSONObject;
    :try_start_2
    const-string v21, "mode"

    move-object/from16 v0, v21

    invoke-virtual {v6, v0}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v15

    .line 199
    .local v15, "modeObj":Lorg/json/JSONObject;
    const-string v21, "value"

    invoke-virtual {v8}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getState()I

    move-result v22

    move-object/from16 v0, v21

    move/from16 v1, v22

    invoke-virtual {v15, v0, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    .line 200
    const-string v21, "mode"

    move-object/from16 v0, v21

    invoke-virtual {v6, v0, v15}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 201
    invoke-virtual {v8, v6}, Lcom/belkin/wemo/cache/data/DeviceInformation;->setAttributeList(Lorg/json/JSONObject;)V
    :try_end_2
    .catch Lorg/json/JSONException; {:try_start_2 .. :try_end_2} :catch_1
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_2 .. :try_end_2} :catch_0

    .line 210
    .end local v6    # "attributeList":Lorg/json/JSONObject;
    .end local v9    # "devInfo":Lcom/belkin/wemo/cache/data/DeviceInformation;
    .end local v15    # "modeObj":Lorg/json/JSONObject;
    :cond_4
    :goto_3
    :try_start_3
    const-string v21, "SDK_CloudRequestUpdateDeviceList"

    new-instance v22, Ljava/lang/StringBuilder;

    invoke-direct/range {v22 .. v22}, Ljava/lang/StringBuilder;-><init>()V

    const-string v23, "Device found via remote: "

    invoke-virtual/range {v22 .. v23}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v22

    move-object/from16 v0, v22

    invoke-virtual {v0, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v22

    const-string v23, " iconUpdateflag: "

    invoke-virtual/range {v22 .. v23}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v22

    invoke-virtual {v8}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getNeedIconUpdate()Z

    move-result v23

    invoke-virtual/range {v22 .. v23}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v22

    invoke-virtual/range {v22 .. v22}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v22

    invoke-static/range {v21 .. v22}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->debugLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 211
    invoke-virtual {v8}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getState()I

    move-result v21

    const/16 v22, 0x3

    move/from16 v0, v21

    move/from16 v1, v22

    if-eq v0, v1, :cond_5

    .line 212
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/wemo/cache/cloud/CloudRequestUpdateDeviceList;->devicesArray:Lcom/belkin/wemo/cache/data/DevicesArray;

    move-object/from16 v21, v0

    invoke-virtual {v8}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getNeedIconUpdate()Z

    move-result v22

    move-object/from16 v0, v21

    move/from16 v1, v22

    invoke-virtual {v0, v8, v1}, Lcom/belkin/wemo/cache/data/DevicesArray;->updateDeviceCache(Lcom/belkin/wemo/cache/data/DeviceInformation;Z)V

    .line 213
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/wemo/cache/cloud/CloudRequestUpdateDeviceList;->devicesArray:Lcom/belkin/wemo/cache/data/DevicesArray;

    move-object/from16 v21, v0

    invoke-virtual {v8}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getUDN()Ljava/lang/String;

    move-result-object v22

    const/16 v23, 0x1

    invoke-virtual/range {v21 .. v23}, Lcom/belkin/wemo/cache/data/DevicesArray;->setDeviceDiscovered(Ljava/lang/String;Z)V

    .line 215
    :cond_5
    const/16 v19, 0x0

    .line 218
    .local v19, "tempDevice":Lcom/belkin/wemo/cache/data/DeviceInformation;
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/wemo/cache/cloud/CloudRequestUpdateDeviceList;->mDevMgr:Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    move-object/from16 v21, v0

    invoke-virtual {v8}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getUDN()Ljava/lang/String;

    move-result-object v22

    const/16 v23, 0x0

    const/16 v24, 0x1

    const/16 v25, 0x1

    invoke-virtual/range {v21 .. v25}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->getDeviceFromDBByUDN(Ljava/lang/String;ZZZ)Lcom/belkin/wemo/cache/data/DeviceInformation;

    move-result-object v19

    .line 219
    if-eqz v19, :cond_8

    .line 220
    invoke-virtual/range {v19 .. v19}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getID()I

    move-result v21

    move/from16 v0, v21

    invoke-virtual {v8, v0}, Lcom/belkin/wemo/cache/data/DeviceInformation;->setID(I)V

    .line 222
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/wemo/cache/cloud/CloudRequestUpdateDeviceList;->cacheManager:Lcom/belkin/wemo/cache/CacheManager;

    move-object/from16 v21, v0

    const/16 v22, 0x0

    const/16 v23, 0x1

    const/16 v24, 0x1

    move-object/from16 v0, v21

    move/from16 v1, v22

    move/from16 v2, v23

    move/from16 v3, v24

    invoke-virtual {v0, v8, v1, v2, v3}, Lcom/belkin/wemo/cache/CacheManager;->updateDB(Lcom/belkin/wemo/cache/data/DeviceInformation;ZZZ)V

    .line 223
    const/16 v19, 0x0

    .line 239
    :cond_6
    :goto_4
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/wemo/cache/cloud/CloudRequestUpdateDeviceList;->mDevMgr:Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    move-object/from16 v21, v0

    invoke-virtual {v8}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getUDN()Ljava/lang/String;

    move-result-object v22

    const/16 v23, 0x0

    const/16 v24, 0x0

    const/16 v25, 0x1

    invoke-virtual/range {v21 .. v25}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->getDeviceFromDBByUDN(Ljava/lang/String;ZZZ)Lcom/belkin/wemo/cache/data/DeviceInformation;

    move-result-object v19

    .line 240
    if-eqz v19, :cond_a

    .line 241
    invoke-virtual/range {v19 .. v19}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getID()I

    move-result v21

    move/from16 v0, v21

    invoke-virtual {v8, v0}, Lcom/belkin/wemo/cache/data/DeviceInformation;->setID(I)V

    .line 243
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/wemo/cache/cloud/CloudRequestUpdateDeviceList;->cacheManager:Lcom/belkin/wemo/cache/CacheManager;

    move-object/from16 v21, v0

    const/16 v22, 0x0

    const/16 v23, 0x0

    const/16 v24, 0x1

    move-object/from16 v0, v21

    move/from16 v1, v22

    move/from16 v2, v23

    move/from16 v3, v24

    invoke-virtual {v0, v8, v1, v2, v3}, Lcom/belkin/wemo/cache/CacheManager;->updateDB(Lcom/belkin/wemo/cache/data/DeviceInformation;ZZZ)V

    .line 244
    const-string v21, "RemoteMode:"

    new-instance v22, Ljava/lang/StringBuilder;

    invoke-direct/range {v22 .. v22}, Ljava/lang/StringBuilder;-><init>()V

    const-string v23, " sending update notification "

    invoke-virtual/range {v22 .. v23}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v22

    invoke-virtual {v8}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getUDN()Ljava/lang/String;

    move-result-object v23

    invoke-virtual/range {v22 .. v23}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v22

    const-string v23, " name:"

    invoke-virtual/range {v22 .. v23}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v22

    invoke-virtual {v8}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getFriendlyName()Ljava/lang/String;

    move-result-object v23

    invoke-virtual/range {v22 .. v23}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v22

    invoke-virtual/range {v22 .. v22}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v22

    invoke-static/range {v21 .. v22}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 245
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/wemo/cache/cloud/CloudRequestUpdateDeviceList;->mDevMgr:Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    move-object/from16 v21, v0

    const-string v22, "update"

    const-string v23, ""

    invoke-virtual {v8}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getUDN()Ljava/lang/String;

    move-result-object v24

    invoke-virtual/range {v21 .. v24}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->sendNotification(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 262
    :cond_7
    :goto_5
    invoke-static/range {v20 .. v20}, Lcom/belkin/wemo/cache/utils/IsDevice;->Insight(Ljava/lang/String;)Z

    move-result v21

    if-eqz v21, :cond_3

    .line 263
    new-instance v13, Lcom/belkin/wemo/cache/cloud/CloudRequestGetInsightParams;

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/wemo/cache/cloud/CloudRequestUpdateDeviceList;->mContext:Landroid/content/Context;

    move-object/from16 v21, v0

    move-object/from16 v0, v21

    invoke-direct {v13, v0, v8}, Lcom/belkin/wemo/cache/cloud/CloudRequestGetInsightParams;-><init>(Landroid/content/Context;Lcom/belkin/wemo/cache/data/DeviceInformation;)V

    .line 264
    .local v13, "insightParams":Lcom/belkin/wemo/cache/cloud/CloudRequestGetInsightParams;
    new-instance v12, Lcom/belkin/wemo/cache/cloud/CloudRequestManager;

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/wemo/cache/cloud/CloudRequestUpdateDeviceList;->mContext:Landroid/content/Context;

    move-object/from16 v21, v0

    move-object/from16 v0, v21

    invoke-direct {v12, v0}, Lcom/belkin/wemo/cache/cloud/CloudRequestManager;-><init>(Landroid/content/Context;)V

    .line 265
    .local v12, "insightMgr":Lcom/belkin/wemo/cache/cloud/CloudRequestManager;
    invoke-virtual {v12, v13}, Lcom/belkin/wemo/cache/cloud/CloudRequestManager;->makeRequest(Lcom/belkin/wemo/cache/cloud/CloudRequestInterface;)V

    goto/16 :goto_2

    .line 202
    .end local v12    # "insightMgr":Lcom/belkin/wemo/cache/cloud/CloudRequestManager;
    .end local v13    # "insightParams":Lcom/belkin/wemo/cache/cloud/CloudRequestGetInsightParams;
    .end local v19    # "tempDevice":Lcom/belkin/wemo/cache/data/DeviceInformation;
    .restart local v6    # "attributeList":Lorg/json/JSONObject;
    .restart local v9    # "devInfo":Lcom/belkin/wemo/cache/data/DeviceInformation;
    :catch_1
    move-exception v10

    .line 204
    .local v10, "e":Lorg/json/JSONException;
    invoke-virtual {v10}, Lorg/json/JSONException;->printStackTrace()V

    goto/16 :goto_3

    .line 226
    .end local v6    # "attributeList":Lorg/json/JSONObject;
    .end local v9    # "devInfo":Lcom/belkin/wemo/cache/data/DeviceInformation;
    .end local v10    # "e":Lorg/json/JSONException;
    .restart local v19    # "tempDevice":Lcom/belkin/wemo/cache/data/DeviceInformation;
    :cond_8
    invoke-virtual {v8}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getState()I

    move-result v21

    const/16 v22, 0x3

    move/from16 v0, v21

    move/from16 v1, v22

    if-eq v0, v1, :cond_9

    .line 227
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/wemo/cache/cloud/CloudRequestUpdateDeviceList;->cacheManager:Lcom/belkin/wemo/cache/CacheManager;

    move-object/from16 v21, v0

    const/16 v22, 0x0

    const/16 v23, 0x1

    const/16 v24, 0x1

    move-object/from16 v0, v21

    move/from16 v1, v22

    move/from16 v2, v23

    move/from16 v3, v24

    invoke-virtual {v0, v8, v1, v2, v3}, Lcom/belkin/wemo/cache/CacheManager;->addDeviceToDB(Lcom/belkin/wemo/cache/data/DeviceInformation;ZZZ)Z

    .line 231
    :cond_9
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/wemo/cache/cloud/CloudRequestUpdateDeviceList;->mDevMgr:Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    move-object/from16 v21, v0

    invoke-virtual {v8}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getUDN()Ljava/lang/String;

    move-result-object v22

    const/16 v23, 0x1

    const/16 v24, 0x0

    const/16 v25, 0x0

    invoke-virtual/range {v21 .. v25}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->getDeviceFromDBByUDN(Ljava/lang/String;ZZZ)Lcom/belkin/wemo/cache/data/DeviceInformation;

    move-result-object v21

    if-nez v21, :cond_6

    .line 233
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/wemo/cache/cloud/CloudRequestUpdateDeviceList;->mDevMgr:Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    move-object/from16 v21, v0

    invoke-virtual {v8}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getUDN()Ljava/lang/String;

    move-result-object v22

    const/16 v23, 0x1

    const/16 v24, 0x0

    invoke-virtual/range {v21 .. v24}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->addDeviceWithOnlyUDNToLocalOrRemoteTable(Ljava/lang/String;ZZ)V

    goto/16 :goto_4

    .line 247
    :cond_a
    invoke-virtual {v8}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getState()I

    move-result v21

    const/16 v22, 0x3

    move/from16 v0, v21

    move/from16 v1, v22

    if-eq v0, v1, :cond_7

    .line 248
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/wemo/cache/cloud/CloudRequestUpdateDeviceList;->cacheManager:Lcom/belkin/wemo/cache/CacheManager;

    move-object/from16 v21, v0

    const/16 v22, 0x0

    const/16 v23, 0x0

    const/16 v24, 0x1

    move-object/from16 v0, v21

    move/from16 v1, v22

    move/from16 v2, v23

    move/from16 v3, v24

    invoke-virtual {v0, v8, v1, v2, v3}, Lcom/belkin/wemo/cache/CacheManager;->addDeviceToDB(Lcom/belkin/wemo/cache/data/DeviceInformation;ZZZ)Z

    .line 249
    const-string v21, "RemoteMode:"

    new-instance v22, Ljava/lang/StringBuilder;

    invoke-direct/range {v22 .. v22}, Ljava/lang/StringBuilder;-><init>()V

    const-string v23, " sending add notification "

    invoke-virtual/range {v22 .. v23}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v22

    invoke-virtual {v8}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getUDN()Ljava/lang/String;

    move-result-object v23

    invoke-virtual/range {v22 .. v23}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v22

    const-string v23, " name:"

    invoke-virtual/range {v22 .. v23}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v22

    invoke-virtual {v8}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getFriendlyName()Ljava/lang/String;

    move-result-object v23

    invoke-virtual/range {v22 .. v23}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v22

    invoke-virtual/range {v22 .. v22}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v22

    invoke-static/range {v21 .. v22}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 250
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/wemo/cache/cloud/CloudRequestUpdateDeviceList;->mDevMgr:Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    move-object/from16 v21, v0

    const-string v22, "add"

    const-string v23, ""

    invoke-virtual {v8}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getUDN()Ljava/lang/String;

    move-result-object v24

    invoke-virtual/range {v21 .. v24}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->sendNotification(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    goto/16 :goto_5

    .line 270
    .end local v8    # "dev":Lcom/belkin/wemo/cache/data/DeviceInformation;
    .end local v19    # "tempDevice":Lcom/belkin/wemo/cache/data/DeviceInformation;
    .end local v20    # "udn":Ljava/lang/String;
    :cond_b
    invoke-interface {v7}, Ljava/util/List;->isEmpty()Z

    move-result v21

    if-nez v21, :cond_c

    .line 271
    invoke-interface {v7}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v11

    :goto_6
    invoke-interface {v11}, Ljava/util/Iterator;->hasNext()Z

    move-result v21

    if-eqz v21, :cond_c

    invoke-interface {v11}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v20

    check-cast v20, Ljava/lang/String;

    .line 272
    .restart local v20    # "udn":Ljava/lang/String;
    const-string v21, "SDK_CloudRequestUpdateDeviceList"

    new-instance v22, Ljava/lang/StringBuilder;

    invoke-direct/range {v22 .. v22}, Ljava/lang/StringBuilder;-><init>()V

    const-string v23, "DB Device NOT found in via CLOUD API. Device shall be removed from DB and device list. UDN: "

    invoke-virtual/range {v22 .. v23}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v22

    move-object/from16 v0, v22

    move-object/from16 v1, v20

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v22

    invoke-virtual/range {v22 .. v22}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v22

    invoke-static/range {v21 .. v22}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 275
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/wemo/cache/cloud/CloudRequestUpdateDeviceList;->mDevMgr:Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    move-object/from16 v21, v0

    const-string v22, "remove"

    const-string v23, ""

    move-object/from16 v0, v21

    move-object/from16 v1, v22

    move-object/from16 v2, v23

    move-object/from16 v3, v20

    invoke-virtual {v0, v1, v2, v3}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->sendNotification(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 277
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/wemo/cache/cloud/CloudRequestUpdateDeviceList;->mContext:Landroid/content/Context;

    move-object/from16 v21, v0

    invoke-static/range {v21 .. v21}, Lcom/belkin/wemo/cache/data/DevicesArray;->getInstance(Landroid/content/Context;)Lcom/belkin/wemo/cache/data/DevicesArray;

    move-result-object v21

    move-object/from16 v0, v21

    move-object/from16 v1, v20

    invoke-virtual {v0, v1}, Lcom/belkin/wemo/cache/data/DevicesArray;->deleteDeviceInformation(Ljava/lang/String;)Z

    .line 278
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/wemo/cache/cloud/CloudRequestUpdateDeviceList;->mContext:Landroid/content/Context;

    move-object/from16 v21, v0

    invoke-static/range {v21 .. v21}, Lcom/belkin/wemo/cache/CacheManager;->getInstance(Landroid/content/Context;)Lcom/belkin/wemo/cache/CacheManager;

    move-result-object v21

    const/16 v22, 0x1

    const/16 v23, 0x1

    const/16 v24, 0x1

    move-object/from16 v0, v21

    move-object/from16 v1, v20

    move/from16 v2, v22

    move/from16 v3, v23

    move/from16 v4, v24

    invoke-virtual {v0, v1, v2, v3, v4}, Lcom/belkin/wemo/cache/CacheManager;->deleteDeviceFromDB(Ljava/lang/String;ZZZ)Z

    goto :goto_6

    .line 282
    .end local v20    # "udn":Ljava/lang/String;
    :cond_c
    new-instance v14, Lcom/belkin/wemo/cache/utils/MoreUtil;

    invoke-direct {v14}, Lcom/belkin/wemo/cache/utils/MoreUtil;-><init>()V

    .line 283
    .local v14, "mU":Lcom/belkin/wemo/cache/utils/MoreUtil;
    const-string v21, "cache.db"

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/wemo/cache/cloud/CloudRequestUpdateDeviceList;->mContext:Landroid/content/Context;

    move-object/from16 v22, v0

    move-object/from16 v0, v21

    move-object/from16 v1, v22

    invoke-virtual {v14, v0, v1}, Lcom/belkin/wemo/cache/utils/MoreUtil;->copyDbToDownloadDirectory(Ljava/lang/String;Landroid/content/Context;)V

    goto/16 :goto_1

    .line 289
    .end local v5    # "arpArray":Lorg/json/JSONArray;
    .end local v7    # "dbDeviceUDNList":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    .end local v14    # "mU":Lcom/belkin/wemo/cache/utils/MoreUtil;
    .end local v18    # "ssidArray":Lorg/json/JSONArray;
    :cond_d
    const-string v21, "SDK_CloudRequestUpdateDeviceList"

    const-string v22, "DEVICELIST is NULL"

    invoke-static/range {v21 .. v22}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_3
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_3 .. :try_end_3} :catch_0

    goto/16 :goto_1
.end method
