.class public Lcom/belkin/wemo/cache/cloud/CloudRequestGetNestDevice;
.super Ljava/lang/Object;
.source "CloudRequestGetNestDevice.java"

# interfaces
.implements Lcom/belkin/wemo/cache/cloud/CloudRequestInterface;


# static fields
.field private static final KEY_ATTRIBUTE_LISTS:Ljava/lang/String; = "attributeLists"

.field private static final KEY_CUSTOMIZED_STATE:Ljava/lang/String; = "customizedState"

.field private static final KEY_DB_VERSION:Ljava/lang/String; = "dbVersion"

.field private static final KEY_DEVICE_TAG:Ljava/lang/String; = "device"

.field private static final KEY_FRIENDLY_NAME:Ljava/lang/String; = "friendlyName"

.field private static final KEY_FW_STATUS:Ljava/lang/String; = "fwUpgradeStatus"

.field private static final KEY_FW_VERSION:Ljava/lang/String; = "firmwareVersion"

.field private static final KEY_HW_VERSION:Ljava/lang/String; = "hwVersion"

.field private static final KEY_MAC_ADDRESS:Ljava/lang/String; = "macAddress"

.field private static final KEY_MODEL_CODE:Ljava/lang/String; = "modelCode"

.field private static final KEY_NOTIFICATION_TYPE:Ljava/lang/String; = "notificationType"

.field private static final KEY_PARENT_EXTERNAL_ID:Ljava/lang/String; = "parentExternalId"

.field private static final KEY_PARENT_NAME:Ljava/lang/String; = "parentName"

.field private static final KEY_PLUGIN_ID:Ljava/lang/String; = "pluginId"

.field private static final KEY_PRODUCT_NAME:Ljava/lang/String; = "productName"

.field private static final KEY_PRODUCT_TYPE:Ljava/lang/String; = "productType"

.field private static final KEY_SERIAL_NUMBER:Ljava/lang/String; = "serialNumber"

.field private static final KEY_SIGNAL_STRENGTH:Ljava/lang/String; = "signalStrength"

.field private static final KEY_STATUS:Ljava/lang/String; = "status"

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

.field private mContext:Landroid/content/Context;

.field private mDevMgr:Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

.field public mSharePreference:Lcom/belkin/wemo/cache/utils/SharePreferences;


# direct methods
.method public constructor <init>(Lcom/belkin/wemo/cache/devicelist/DeviceListManager;Landroid/content/Context;)V
    .locals 4
    .param p1, "devMgr"    # Lcom/belkin/wemo/cache/devicelist/DeviceListManager;
    .param p2, "context"    # Landroid/content/Context;

    .prologue
    .line 74
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 60
    const/4 v1, 0x0

    iput-object v1, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestGetNestDevice;->devicesList:Ljava/util/ArrayList;

    .line 63
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v2, Lcom/belkin/wemo/cache/cloud/CloudConstants;->CLOUD_URL:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "/apis/http/device/remoteHomeDevices/"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestGetNestDevice;->URL:Ljava/lang/String;

    .line 66
    const-class v1, Lcom/belkin/wemo/cache/cloud/CloudRequestGetNestDevice;

    invoke-virtual {v1}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestGetNestDevice;->TAG:Ljava/lang/String;

    .line 67
    const v1, 0x9c40

    iput v1, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestGetNestDevice;->TIMEOUT_LIMIT:I

    .line 70
    const/16 v1, 0x4e20

    iput v1, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestGetNestDevice;->TIMEOUT:I

    .line 75
    iput-object p2, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestGetNestDevice;->mContext:Landroid/content/Context;

    .line 76
    iput-object p1, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestGetNestDevice;->mDevMgr:Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    .line 77
    new-instance v0, Lcom/belkin/wemo/cache/cloud/CloudAuth;

    iget-object v1, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestGetNestDevice;->mContext:Landroid/content/Context;

    invoke-direct {v0, v1}, Lcom/belkin/wemo/cache/cloud/CloudAuth;-><init>(Landroid/content/Context;)V

    .line 78
    .local v0, "cloudAuth":Lcom/belkin/wemo/cache/cloud/CloudAuth;
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v2, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestGetNestDevice;->URL:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v0}, Lcom/belkin/wemo/cache/cloud/CloudAuth;->getHomeID()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestGetNestDevice;->cloudURL:Ljava/lang/String;

    .line 79
    invoke-static {p2}, Lcom/belkin/wemo/cache/CacheManager;->getInstance(Landroid/content/Context;)Lcom/belkin/wemo/cache/CacheManager;

    move-result-object v1

    iput-object v1, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestGetNestDevice;->cacheManager:Lcom/belkin/wemo/cache/CacheManager;

    .line 80
    invoke-static {p2}, Lcom/belkin/wemo/cache/data/DevicesArray;->getInstance(Landroid/content/Context;)Lcom/belkin/wemo/cache/data/DevicesArray;

    move-result-object v1

    iput-object v1, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestGetNestDevice;->devicesArray:Lcom/belkin/wemo/cache/data/DevicesArray;

    .line 81
    iget-object v1, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestGetNestDevice;->TAG:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Nest URL "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestGetNestDevice;->cloudURL:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 82
    new-instance v1, Lcom/belkin/wemo/cache/utils/SharePreferences;

    iget-object v2, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestGetNestDevice;->mContext:Landroid/content/Context;

    invoke-direct {v1, v2}, Lcom/belkin/wemo/cache/utils/SharePreferences;-><init>(Landroid/content/Context;)V

    iput-object v1, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestGetNestDevice;->mSharePreference:Lcom/belkin/wemo/cache/utils/SharePreferences;

    .line 83
    return-void
.end method

.method private static nodeToString(Lorg/w3c/dom/Node;)Ljava/lang/String;
    .locals 5
    .param p0, "node"    # Lorg/w3c/dom/Node;

    .prologue
    .line 324
    new-instance v0, Ljava/io/StringWriter;

    invoke-direct {v0}, Ljava/io/StringWriter;-><init>()V

    .line 326
    .local v0, "sw":Ljava/io/StringWriter;
    :try_start_0
    invoke-static {}, Ljavax/xml/transform/TransformerFactory;->newInstance()Ljavax/xml/transform/TransformerFactory;

    move-result-object v3

    invoke-virtual {v3}, Ljavax/xml/transform/TransformerFactory;->newTransformer()Ljavax/xml/transform/Transformer;

    move-result-object v1

    .line 327
    .local v1, "t":Ljavax/xml/transform/Transformer;
    const-string v3, "omit-xml-declaration"

    const-string v4, "yes"

    invoke-virtual {v1, v3, v4}, Ljavax/xml/transform/Transformer;->setOutputProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 328
    const-string v3, "indent"

    const-string v4, "yes"

    invoke-virtual {v1, v3, v4}, Ljavax/xml/transform/Transformer;->setOutputProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 329
    new-instance v3, Ljavax/xml/transform/dom/DOMSource;

    invoke-direct {v3, p0}, Ljavax/xml/transform/dom/DOMSource;-><init>(Lorg/w3c/dom/Node;)V

    new-instance v4, Ljavax/xml/transform/stream/StreamResult;

    invoke-direct {v4, v0}, Ljavax/xml/transform/stream/StreamResult;-><init>(Ljava/io/Writer;)V

    invoke-virtual {v1, v3, v4}, Ljavax/xml/transform/Transformer;->transform(Ljavax/xml/transform/Source;Ljavax/xml/transform/Result;)V
    :try_end_0
    .catch Ljavax/xml/transform/TransformerException; {:try_start_0 .. :try_end_0} :catch_0

    .line 333
    .end local v1    # "t":Ljavax/xml/transform/Transformer;
    :goto_0
    invoke-virtual {v0}, Ljava/io/StringWriter;->toString()Ljava/lang/String;

    move-result-object v3

    return-object v3

    .line 330
    :catch_0
    move-exception v2

    .line 331
    .local v2, "te":Ljavax/xml/transform/TransformerException;
    sget-object v3, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v4, "nodeToString Transformer Exception"

    invoke-virtual {v3, v4}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    goto :goto_0
.end method

.method private parseResponse(Ljava/lang/String;)Z
    .locals 39
    .param p1, "response"    # Ljava/lang/String;

    .prologue
    .line 219
    :try_start_0
    new-instance v36, Ljava/util/ArrayList;

    invoke-direct/range {v36 .. v36}, Ljava/util/ArrayList;-><init>()V

    move-object/from16 v0, v36

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/belkin/wemo/cache/cloud/CloudRequestGetNestDevice;->devicesList:Ljava/util/ArrayList;

    .line 220
    new-instance v27, Lcom/belkin/wemo/cache/cloud/XMLParser;

    invoke-direct/range {v27 .. v27}, Lcom/belkin/wemo/cache/cloud/XMLParser;-><init>()V

    .line 221
    .local v27, "parser":Lcom/belkin/wemo/cache/cloud/XMLParser;
    move-object/from16 v0, v27

    move-object/from16 v1, p1

    invoke-virtual {v0, v1}, Lcom/belkin/wemo/cache/cloud/XMLParser;->getDomElement(Ljava/lang/String;)Lorg/w3c/dom/Document;

    move-result-object v11

    .line 222
    .local v11, "doc":Lorg/w3c/dom/Document;
    const-string v36, "device"

    move-object/from16 v0, v36

    invoke-interface {v11, v0}, Lorg/w3c/dom/Document;->getElementsByTagName(Ljava/lang/String;)Lorg/w3c/dom/NodeList;

    move-result-object v22

    .line 223
    .local v22, "nl":Lorg/w3c/dom/NodeList;
    const/4 v9, 0x0

    .line 225
    .local v9, "device":Lcom/belkin/wemo/cache/data/DeviceInformation;
    const/16 v19, 0x0

    .local v19, "i":I
    :goto_0
    invoke-interface/range {v22 .. v22}, Lorg/w3c/dom/NodeList;->getLength()I

    move-result v36

    move/from16 v0, v19

    move/from16 v1, v36

    if-ge v0, v1, :cond_8

    .line 226
    move-object/from16 v0, v22

    move/from16 v1, v19

    invoke-interface {v0, v1}, Lorg/w3c/dom/NodeList;->item(I)Lorg/w3c/dom/Node;

    move-result-object v12

    check-cast v12, Lorg/w3c/dom/Element;

    .line 227
    .local v12, "e":Lorg/w3c/dom/Element;
    const-string v36, "modelCode"

    move-object/from16 v0, v27

    move-object/from16 v1, v36

    invoke-virtual {v0, v12, v1}, Lcom/belkin/wemo/cache/cloud/XMLParser;->getValue(Lorg/w3c/dom/Element;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v21

    .line 228
    .local v21, "modelCode":Ljava/lang/String;
    const-string v36, "pluginId"

    move-object/from16 v0, v27

    move-object/from16 v1, v36

    invoke-virtual {v0, v12, v1}, Lcom/belkin/wemo/cache/cloud/XMLParser;->getValue(Lorg/w3c/dom/Element;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v28

    .line 229
    .local v28, "pluginId":Ljava/lang/String;
    const-string v36, "uniqueId"

    move-object/from16 v0, v27

    move-object/from16 v1, v36

    invoke-virtual {v0, v12, v1}, Lcom/belkin/wemo/cache/cloud/XMLParser;->getValue(Lorg/w3c/dom/Element;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v34

    .line 230
    .local v34, "udn":Ljava/lang/String;
    const-string v36, "macAddress"

    move-object/from16 v0, v27

    move-object/from16 v1, v36

    invoke-virtual {v0, v12, v1}, Lcom/belkin/wemo/cache/cloud/XMLParser;->getValue(Lorg/w3c/dom/Element;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v20

    .line 231
    .local v20, "macAddress":Ljava/lang/String;
    const-string v36, "serialNumber"

    move-object/from16 v0, v27

    move-object/from16 v1, v36

    invoke-virtual {v0, v12, v1}, Lcom/belkin/wemo/cache/cloud/XMLParser;->getValue(Lorg/w3c/dom/Element;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v31

    .line 232
    .local v31, "serialNumber":Ljava/lang/String;
    const-string v36, "productType"

    move-object/from16 v0, v27

    move-object/from16 v1, v36

    invoke-virtual {v0, v12, v1}, Lcom/belkin/wemo/cache/cloud/XMLParser;->getValue(Lorg/w3c/dom/Element;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v30

    .line 233
    .local v30, "productType":Ljava/lang/String;
    const-string v36, "productName"

    move-object/from16 v0, v27

    move-object/from16 v1, v36

    invoke-virtual {v0, v12, v1}, Lcom/belkin/wemo/cache/cloud/XMLParser;->getValue(Lorg/w3c/dom/Element;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v29

    .line 234
    .local v29, "productName":Ljava/lang/String;
    const-string v36, "notificationType"

    move-object/from16 v0, v27

    move-object/from16 v1, v36

    invoke-virtual {v0, v12, v1}, Lcom/belkin/wemo/cache/cloud/XMLParser;->getValue(Lorg/w3c/dom/Element;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v24

    .line 235
    .local v24, "notificationType":Ljava/lang/String;
    const-string v36, "hwVersion"

    move-object/from16 v0, v27

    move-object/from16 v1, v36

    invoke-virtual {v0, v12, v1}, Lcom/belkin/wemo/cache/cloud/XMLParser;->getValue(Lorg/w3c/dom/Element;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v18

    .line 236
    .local v18, "hwVersion":Ljava/lang/String;
    const-string v36, "signalStrength"

    move-object/from16 v0, v27

    move-object/from16 v1, v36

    invoke-virtual {v0, v12, v1}, Lcom/belkin/wemo/cache/cloud/XMLParser;->getValue(Lorg/w3c/dom/Element;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v32

    .line 237
    .local v32, "signalStrength":Ljava/lang/String;
    const-string v36, "dbVersion"

    move-object/from16 v0, v27

    move-object/from16 v1, v36

    invoke-virtual {v0, v12, v1}, Lcom/belkin/wemo/cache/cloud/XMLParser;->getValue(Lorg/w3c/dom/Element;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    .line 238
    .local v7, "dbVersion":Ljava/lang/String;
    const-string v36, "friendlyName"

    move-object/from16 v0, v27

    move-object/from16 v1, v36

    invoke-virtual {v0, v12, v1}, Lcom/belkin/wemo/cache/cloud/XMLParser;->getValue(Lorg/w3c/dom/Element;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v15

    .line 239
    .local v15, "friendlyName":Ljava/lang/String;
    const-string v36, "fwUpgradeStatus"

    move-object/from16 v0, v27

    move-object/from16 v1, v36

    invoke-virtual {v0, v12, v1}, Lcom/belkin/wemo/cache/cloud/XMLParser;->getValue(Lorg/w3c/dom/Element;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v16

    .line 240
    .local v16, "fwStatus":Ljava/lang/String;
    const-string v36, "firmwareVersion"

    move-object/from16 v0, v27

    move-object/from16 v1, v36

    invoke-virtual {v0, v12, v1}, Lcom/belkin/wemo/cache/cloud/XMLParser;->getValue(Lorg/w3c/dom/Element;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v14

    .line 241
    .local v14, "firmwareVersion":Ljava/lang/String;
    const-string v36, "status"

    move-object/from16 v0, v27

    move-object/from16 v1, v36

    invoke-virtual {v0, v12, v1}, Lcom/belkin/wemo/cache/cloud/XMLParser;->getValue(Lorg/w3c/dom/Element;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v33

    .line 242
    .local v33, "status":Ljava/lang/String;
    const-string v36, "customizedState"

    move-object/from16 v0, v27

    move-object/from16 v1, v36

    invoke-virtual {v0, v12, v1}, Lcom/belkin/wemo/cache/cloud/XMLParser;->getValue(Lorg/w3c/dom/Element;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    .line 243
    .local v6, "customizedState":Ljava/lang/String;
    const-string v36, "parentName"

    move-object/from16 v0, v27

    move-object/from16 v1, v36

    invoke-virtual {v0, v12, v1}, Lcom/belkin/wemo/cache/cloud/XMLParser;->getValue(Lorg/w3c/dom/Element;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v26

    .line 244
    .local v26, "parentName":Ljava/lang/String;
    const-string v36, "parentExternalId"

    move-object/from16 v0, v27

    move-object/from16 v1, v36

    invoke-virtual {v0, v12, v1}, Lcom/belkin/wemo/cache/cloud/XMLParser;->getValue(Lorg/w3c/dom/Element;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v25

    .line 246
    .local v25, "parentExternalId":Ljava/lang/String;
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/wemo/cache/cloud/CloudRequestGetNestDevice;->TAG:Ljava/lang/String;

    move-object/from16 v36, v0

    new-instance v37, Ljava/lang/StringBuilder;

    invoke-direct/range {v37 .. v37}, Ljava/lang/StringBuilder;-><init>()V

    const-string v38, " friendlyName: "

    invoke-virtual/range {v37 .. v38}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v37

    move-object/from16 v0, v37

    invoke-virtual {v0, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v37

    invoke-virtual/range {v37 .. v37}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v37

    invoke-static/range {v36 .. v37}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 247
    const-string v36, "\'"

    const-string v37, "&#39;"

    move-object/from16 v0, v36

    move-object/from16 v1, v37

    invoke-virtual {v15, v0, v1}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v15

    .line 248
    const-string v36, "\'"

    const-string v37, "&#39;"

    move-object/from16 v0, v26

    move-object/from16 v1, v36

    move-object/from16 v2, v37

    invoke-virtual {v0, v1, v2}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v26

    .line 249
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/wemo/cache/cloud/CloudRequestGetNestDevice;->TAG:Ljava/lang/String;

    move-object/from16 v36, v0

    new-instance v37, Ljava/lang/StringBuilder;

    invoke-direct/range {v37 .. v37}, Ljava/lang/StringBuilder;-><init>()V

    const-string v38, " friendlyName: "

    invoke-virtual/range {v37 .. v38}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v37

    move-object/from16 v0, v37

    invoke-virtual {v0, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v37

    invoke-virtual/range {v37 .. v37}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v37

    invoke-static/range {v36 .. v37}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 250
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/wemo/cache/cloud/CloudRequestGetNestDevice;->TAG:Ljava/lang/String;

    move-object/from16 v36, v0

    new-instance v37, Ljava/lang/StringBuilder;

    invoke-direct/range {v37 .. v37}, Ljava/lang/StringBuilder;-><init>()V

    const-string v38, "Nest modelCode: "

    invoke-virtual/range {v37 .. v38}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v37

    move-object/from16 v0, v37

    move-object/from16 v1, v21

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v37

    const-string v38, " :pluginId: "

    invoke-virtual/range {v37 .. v38}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v37

    move-object/from16 v0, v37

    move-object/from16 v1, v28

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v37

    const-string v38, " :macAddress: "

    invoke-virtual/range {v37 .. v38}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v37

    move-object/from16 v0, v37

    move-object/from16 v1, v20

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v37

    const-string v38, " :serialNumber: "

    invoke-virtual/range {v37 .. v38}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v37

    move-object/from16 v0, v37

    move-object/from16 v1, v31

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v37

    const-string v38, " :productType: "

    invoke-virtual/range {v37 .. v38}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v37

    move-object/from16 v0, v37

    move-object/from16 v1, v30

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v37

    const-string v38, " :productName: "

    invoke-virtual/range {v37 .. v38}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v37

    move-object/from16 v0, v37

    move-object/from16 v1, v29

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v37

    const-string v38, " :notificationType: "

    invoke-virtual/range {v37 .. v38}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v37

    move-object/from16 v0, v37

    move-object/from16 v1, v24

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v37

    const-string v38, " :hwVersion: "

    invoke-virtual/range {v37 .. v38}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v37

    move-object/from16 v0, v37

    move-object/from16 v1, v18

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v37

    const-string v38, " :signalStrength: "

    invoke-virtual/range {v37 .. v38}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v37

    move-object/from16 v0, v37

    move-object/from16 v1, v32

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v37

    const-string v38, " :dbVersion: "

    invoke-virtual/range {v37 .. v38}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v37

    move-object/from16 v0, v37

    invoke-virtual {v0, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v37

    const-string v38, " :udn: "

    invoke-virtual/range {v37 .. v38}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v37

    move-object/from16 v0, v37

    move-object/from16 v1, v34

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v37

    invoke-virtual/range {v37 .. v37}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v37

    invoke-static/range {v36 .. v37}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 254
    new-instance v36, Lcom/belkin/wemo/cache/utils/SharePreferences;

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/wemo/cache/cloud/CloudRequestGetNestDevice;->mContext:Landroid/content/Context;

    move-object/from16 v37, v0

    invoke-direct/range {v36 .. v37}, Lcom/belkin/wemo/cache/utils/SharePreferences;-><init>(Landroid/content/Context;)V

    invoke-virtual/range {v36 .. v36}, Lcom/belkin/wemo/cache/utils/SharePreferences;->getHomeId()Ljava/lang/String;

    move-result-object v17

    .line 256
    .local v17, "homeId":Ljava/lang/String;
    sget-object v8, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->devListManager:Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    .line 257
    .local v8, "devListManager":Lcom/belkin/wemo/cache/devicelist/DeviceListManager;
    if-nez v8, :cond_0

    .line 258
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/wemo/cache/cloud/CloudRequestGetNestDevice;->mContext:Landroid/content/Context;

    move-object/from16 v36, v0

    invoke-static/range {v36 .. v36}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->getInstance(Landroid/content/Context;)Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    move-result-object v8

    .line 260
    :cond_0
    invoke-virtual {v8}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->getDeviceInformationList()Ljava/util/Map;

    move-result-object v10

    .line 261
    .local v10, "deviceList":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Lcom/belkin/wemo/cache/data/DeviceInformation;>;"
    if-eqz v10, :cond_1

    .line 262
    move-object/from16 v0, v34

    invoke-interface {v10, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v9

    .end local v9    # "device":Lcom/belkin/wemo/cache/data/DeviceInformation;
    check-cast v9, Lcom/belkin/wemo/cache/data/DeviceInformation;

    .line 263
    .restart local v9    # "device":Lcom/belkin/wemo/cache/data/DeviceInformation;
    :cond_1
    if-nez v9, :cond_2

    .line 264
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/wemo/cache/cloud/CloudRequestGetNestDevice;->TAG:Ljava/lang/String;

    move-object/from16 v36, v0

    const-string v37, "Nest device is null creating new object "

    invoke-static/range {v36 .. v37}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 265
    new-instance v9, Lcom/belkin/wemo/cache/data/DeviceInformation;

    .end local v9    # "device":Lcom/belkin/wemo/cache/data/DeviceInformation;
    move-object/from16 v0, v34

    move-object/from16 v1, v17

    move-object/from16 v2, v20

    move-object/from16 v3, v28

    invoke-direct {v9, v0, v1, v2, v3}, Lcom/belkin/wemo/cache/data/DeviceInformation;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 267
    .restart local v9    # "device":Lcom/belkin/wemo/cache/data/DeviceInformation;
    :cond_2
    if-eqz v9, :cond_4

    invoke-virtual {v9}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getUDN()Ljava/lang/String;

    move-result-object v36

    invoke-virtual/range {v36 .. v36}, Ljava/lang/String;->length()I

    move-result v36

    if-lez v36, :cond_4

    .line 269
    invoke-virtual {v9, v15}, Lcom/belkin/wemo/cache/data/DeviceInformation;->setFriendlyName(Ljava/lang/String;)V

    .line 270
    move-object/from16 v0, v21

    invoke-virtual {v9, v0}, Lcom/belkin/wemo/cache/data/DeviceInformation;->setModelCode(Ljava/lang/String;)V

    .line 271
    move-object/from16 v0, v21

    invoke-virtual {v9, v0}, Lcom/belkin/wemo/cache/data/DeviceInformation;->setType(Ljava/lang/String;)V

    .line 272
    move-object/from16 v0, v29

    invoke-virtual {v9, v0}, Lcom/belkin/wemo/cache/data/DeviceInformation;->setProductName(Ljava/lang/String;)V

    .line 273
    move-object/from16 v0, v30

    invoke-virtual {v9, v0}, Lcom/belkin/wemo/cache/data/DeviceInformation;->setProductType(Ljava/lang/String;)V

    .line 274
    move-object/from16 v0, v18

    invoke-virtual {v9, v0}, Lcom/belkin/wemo/cache/data/DeviceInformation;->setHwVersion(Ljava/lang/String;)V

    .line 275
    const-string v36, ""

    move-object/from16 v0, v36

    invoke-virtual {v7, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v36

    if-nez v36, :cond_3

    .line 276
    invoke-static {v7}, Ljava/lang/Integer;->valueOf(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v36

    invoke-virtual/range {v36 .. v36}, Ljava/lang/Integer;->intValue()I

    move-result v36

    move/from16 v0, v36

    invoke-virtual {v9, v0}, Lcom/belkin/wemo/cache/data/DeviceInformation;->setRulesDBVersion(I)V

    .line 278
    :cond_3
    move-object/from16 v0, v32

    invoke-virtual {v9, v0}, Lcom/belkin/wemo/cache/data/DeviceInformation;->setSignalStrength(Ljava/lang/String;)V

    .line 279
    move-object/from16 v0, v24

    invoke-virtual {v9, v0}, Lcom/belkin/wemo/cache/data/DeviceInformation;->setNotificationType(Ljava/lang/String;)V

    .line 280
    move-object/from16 v0, v31

    invoke-virtual {v9, v0}, Lcom/belkin/wemo/cache/data/DeviceInformation;->setSerialNumber(Ljava/lang/String;)V

    .line 281
    move-object/from16 v0, v26

    invoke-virtual {v9, v0}, Lcom/belkin/wemo/cache/data/DeviceInformation;->setParentName(Ljava/lang/String;)V

    .line 282
    move-object/from16 v0, v25

    invoke-virtual {v9, v0}, Lcom/belkin/wemo/cache/data/DeviceInformation;->setParentExternalId(Ljava/lang/String;)V

    .line 284
    move-object/from16 v0, v16

    invoke-virtual {v9, v0}, Lcom/belkin/wemo/cache/data/DeviceInformation;->setFwStatus(Ljava/lang/String;)V

    .line 285
    invoke-virtual {v9, v14}, Lcom/belkin/wemo/cache/data/DeviceInformation;->setFirmwareVersion(Ljava/lang/String;)V

    .line 286
    invoke-static/range {v33 .. v33}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v36

    move/from16 v0, v36

    invoke-virtual {v9, v0}, Lcom/belkin/wemo/cache/data/DeviceInformation;->setStatusTS(I)V

    .line 287
    move-object/from16 v0, v28

    invoke-virtual {v9, v0}, Lcom/belkin/wemo/cache/data/DeviceInformation;->setPluginId(Ljava/lang/String;)V

    .line 288
    invoke-virtual {v9, v15}, Lcom/belkin/wemo/cache/data/DeviceInformation;->setFriendlyName(Ljava/lang/String;)V

    .line 289
    invoke-virtual {v9, v6}, Lcom/belkin/wemo/cache/data/DeviceInformation;->setCustomizedState(Ljava/lang/String;)V

    .line 290
    move-object/from16 v0, v18

    invoke-virtual {v9, v0}, Lcom/belkin/wemo/cache/data/DeviceInformation;->setHwVersion(Ljava/lang/String;)V

    .line 291
    const/16 v36, 0x1

    move/from16 v0, v36

    invoke-virtual {v9, v0}, Lcom/belkin/wemo/cache/data/DeviceInformation;->setIsDiscovered(Z)V

    .line 292
    const/16 v36, 0x0

    move/from16 v0, v36

    invoke-virtual {v9, v0}, Lcom/belkin/wemo/cache/data/DeviceInformation;->setInActive(I)V

    .line 296
    :cond_4
    const-string v36, "attributeLists"

    move-object/from16 v0, v36

    invoke-interface {v12, v0}, Lorg/w3c/dom/Element;->getElementsByTagName(Ljava/lang/String;)Lorg/w3c/dom/NodeList;

    move-result-object v23

    .line 297
    .local v23, "nodelist":Lorg/w3c/dom/NodeList;
    const/16 v35, 0x0

    .local v35, "y":I
    :goto_1
    invoke-interface/range {v23 .. v23}, Lorg/w3c/dom/NodeList;->getLength()I

    move-result v36

    move/from16 v0, v35

    move/from16 v1, v36

    if-ge v0, v1, :cond_5

    .line 298
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/wemo/cache/cloud/CloudRequestGetNestDevice;->TAG:Ljava/lang/String;

    move-object/from16 v36, v0

    new-instance v37, Ljava/lang/StringBuilder;

    invoke-direct/range {v37 .. v37}, Ljava/lang/StringBuilder;-><init>()V

    const-string v38, "Nest GET ATTRIBUTES. Attr: "

    invoke-virtual/range {v37 .. v38}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v37

    move-object/from16 v0, v23

    move/from16 v1, v35

    invoke-interface {v0, v1}, Lorg/w3c/dom/NodeList;->item(I)Lorg/w3c/dom/Node;

    move-result-object v38

    invoke-static/range {v38 .. v38}, Lcom/belkin/wemo/cache/cloud/CloudRequestGetNestDevice;->nodeToString(Lorg/w3c/dom/Node;)Ljava/lang/String;

    move-result-object v38

    invoke-virtual/range {v37 .. v38}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v37

    invoke-virtual/range {v37 .. v37}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v37

    invoke-static/range {v36 .. v37}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->debugLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 297
    add-int/lit8 v35, v35, 0x1

    goto :goto_1

    .line 300
    :cond_5
    const-string v36, "attributeLists"

    move-object/from16 v0, v36

    invoke-interface {v12, v0}, Lorg/w3c/dom/Element;->getElementsByTagName(Ljava/lang/String;)Lorg/w3c/dom/NodeList;

    move-result-object v36

    if-eqz v36, :cond_6

    const-string v36, "attributeLists"

    move-object/from16 v0, v36

    invoke-interface {v12, v0}, Lorg/w3c/dom/Element;->getElementsByTagName(Ljava/lang/String;)Lorg/w3c/dom/NodeList;

    move-result-object v36

    invoke-interface/range {v36 .. v36}, Lorg/w3c/dom/NodeList;->getLength()I

    move-result v36

    if-lez v36, :cond_6

    .line 301
    const-string v36, "attributeLists"

    move-object/from16 v0, v36

    invoke-interface {v12, v0}, Lorg/w3c/dom/Element;->getElementsByTagName(Ljava/lang/String;)Lorg/w3c/dom/NodeList;

    move-result-object v36

    const/16 v37, 0x0

    invoke-interface/range {v36 .. v37}, Lorg/w3c/dom/NodeList;->item(I)Lorg/w3c/dom/Node;

    move-result-object v4

    .line 302
    .local v4, "attrNode":Lorg/w3c/dom/Node;
    if-eqz v4, :cond_6

    .line 303
    new-instance v36, Lcom/belkin/wemo/localsdk/parser/GetAttributeResponseParser;

    invoke-direct/range {v36 .. v36}, Lcom/belkin/wemo/localsdk/parser/GetAttributeResponseParser;-><init>()V

    invoke-static {v4}, Lcom/belkin/wemo/cache/cloud/CloudRequestGetNestDevice;->nodeToString(Lorg/w3c/dom/Node;)Ljava/lang/String;

    move-result-object v37

    invoke-virtual/range {v36 .. v37}, Lcom/belkin/wemo/localsdk/parser/GetAttributeResponseParser;->parseGetAttributeResponse(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v5

    .line 304
    .local v5, "attributes":Lorg/json/JSONObject;
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/wemo/cache/cloud/CloudRequestGetNestDevice;->TAG:Ljava/lang/String;

    move-object/from16 v36, v0

    new-instance v37, Ljava/lang/StringBuilder;

    invoke-direct/range {v37 .. v37}, Ljava/lang/StringBuilder;-><init>()V

    const-string v38, "Nest attributeList"

    invoke-virtual/range {v37 .. v38}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v37

    move-object/from16 v0, v37

    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v37

    invoke-virtual/range {v37 .. v37}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v37

    invoke-static/range {v36 .. v37}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 305
    if-eqz v5, :cond_6

    .line 306
    invoke-virtual {v9, v5}, Lcom/belkin/wemo/cache/data/DeviceInformation;->setAttributeList(Lorg/json/JSONObject;)V

    .line 310
    .end local v4    # "attrNode":Lorg/w3c/dom/Node;
    .end local v5    # "attributes":Lorg/json/JSONObject;
    :cond_6
    if-eqz v9, :cond_7

    .line 311
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/wemo/cache/cloud/CloudRequestGetNestDevice;->TAG:Ljava/lang/String;

    move-object/from16 v36, v0

    new-instance v37, Ljava/lang/StringBuilder;

    invoke-direct/range {v37 .. v37}, Ljava/lang/StringBuilder;-><init>()V

    const-string v38, "Nest device updated:"

    invoke-virtual/range {v37 .. v38}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v37

    move-object/from16 v0, v37

    invoke-virtual {v0, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v37

    invoke-virtual/range {v37 .. v37}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v37

    invoke-static/range {v36 .. v37}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 312
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/wemo/cache/cloud/CloudRequestGetNestDevice;->devicesList:Ljava/util/ArrayList;

    move-object/from16 v36, v0

    move-object/from16 v0, v36

    invoke-virtual {v0, v9}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 225
    :cond_7
    add-int/lit8 v19, v19, 0x1

    goto/16 :goto_0

    .line 316
    .end local v6    # "customizedState":Ljava/lang/String;
    .end local v7    # "dbVersion":Ljava/lang/String;
    .end local v8    # "devListManager":Lcom/belkin/wemo/cache/devicelist/DeviceListManager;
    .end local v10    # "deviceList":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Lcom/belkin/wemo/cache/data/DeviceInformation;>;"
    .end local v12    # "e":Lorg/w3c/dom/Element;
    .end local v14    # "firmwareVersion":Ljava/lang/String;
    .end local v15    # "friendlyName":Ljava/lang/String;
    .end local v16    # "fwStatus":Ljava/lang/String;
    .end local v17    # "homeId":Ljava/lang/String;
    .end local v18    # "hwVersion":Ljava/lang/String;
    .end local v20    # "macAddress":Ljava/lang/String;
    .end local v21    # "modelCode":Ljava/lang/String;
    .end local v23    # "nodelist":Lorg/w3c/dom/NodeList;
    .end local v24    # "notificationType":Ljava/lang/String;
    .end local v25    # "parentExternalId":Ljava/lang/String;
    .end local v26    # "parentName":Ljava/lang/String;
    .end local v28    # "pluginId":Ljava/lang/String;
    .end local v29    # "productName":Ljava/lang/String;
    .end local v30    # "productType":Ljava/lang/String;
    .end local v31    # "serialNumber":Ljava/lang/String;
    .end local v32    # "signalStrength":Ljava/lang/String;
    .end local v33    # "status":Ljava/lang/String;
    .end local v34    # "udn":Ljava/lang/String;
    .end local v35    # "y":I
    :cond_8
    const/16 v36, 0x1

    .line 319
    .end local v9    # "device":Lcom/belkin/wemo/cache/data/DeviceInformation;
    .end local v11    # "doc":Lorg/w3c/dom/Document;
    .end local v19    # "i":I
    .end local v22    # "nl":Lorg/w3c/dom/NodeList;
    .end local v27    # "parser":Lcom/belkin/wemo/cache/cloud/XMLParser;
    :goto_2
    return v36

    .line 317
    :catch_0
    move-exception v13

    .line 318
    .local v13, "ex":Ljava/lang/Exception;
    invoke-virtual {v13}, Ljava/lang/Exception;->printStackTrace()V

    .line 319
    const/16 v36, 0x0

    goto :goto_2
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
    .line 353
    const/4 v0, 0x0

    return-object v0
.end method

.method public getBody()Ljava/lang/String;
    .locals 1

    .prologue
    .line 106
    const/4 v0, 0x0

    return-object v0
.end method

.method public getFileByteArray()[B
    .locals 1

    .prologue
    .line 338
    const/4 v0, 0x0

    return-object v0
.end method

.method public getRequestMethod()I
    .locals 1

    .prologue
    .line 87
    const/4 v0, 0x2

    return v0
.end method

.method public getTimeout()I
    .locals 1

    .prologue
    .line 92
    iget v0, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestGetNestDevice;->TIMEOUT:I

    return v0
.end method

.method public getTimeoutLimit()I
    .locals 1

    .prologue
    .line 97
    const v0, 0x9c40

    return v0
.end method

.method public getURL()Ljava/lang/String;
    .locals 1

    .prologue
    .line 101
    iget-object v0, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestGetNestDevice;->cloudURL:Ljava/lang/String;

    return-object v0
.end method

.method public getUploadFileName()Ljava/lang/String;
    .locals 1

    .prologue
    .line 343
    const/4 v0, 0x0

    return-object v0
.end method

.method public isAuthHeaderRequired()Z
    .locals 1

    .prologue
    .line 348
    const/4 v0, 0x1

    return v0
.end method

.method public requestComplete(ZI[B)V
    .locals 16
    .param p1, "success"    # Z
    .param p2, "statusCode"    # I
    .param p3, "resp"    # [B

    .prologue
    .line 112
    move-object/from16 v0, p0

    iget-object v11, v0, Lcom/belkin/wemo/cache/cloud/CloudRequestGetNestDevice;->TAG:Ljava/lang/String;

    new-instance v12, Ljava/lang/StringBuilder;

    invoke-direct {v12}, Ljava/lang/StringBuilder;-><init>()V

    const-string v13, "Nest Response success: "

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    move/from16 v0, p1

    invoke-virtual {v12, v0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v12

    invoke-static {v11, v12}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 113
    if-eqz p1, :cond_9

    .line 115
    :try_start_0
    new-instance v7, Ljava/lang/String;

    const-string v11, "UTF-8"

    move-object/from16 v0, p3

    invoke-direct {v7, v0, v11}, Ljava/lang/String;-><init>([BLjava/lang/String;)V

    .line 117
    .local v7, "response":Ljava/lang/String;
    move-object/from16 v0, p0

    iget-object v11, v0, Lcom/belkin/wemo/cache/cloud/CloudRequestGetNestDevice;->TAG:Ljava/lang/String;

    new-instance v12, Ljava/lang/StringBuilder;

    invoke-direct {v12}, Ljava/lang/StringBuilder;-><init>()V

    const-string v13, "Nest: "

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v12

    invoke-static {v11, v12}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 118
    move-object/from16 v0, p0

    invoke-direct {v0, v7}, Lcom/belkin/wemo/cache/cloud/CloudRequestGetNestDevice;->parseResponse(Ljava/lang/String;)Z

    move-result v8

    .line 119
    .local v8, "responseParse":Z
    move-object/from16 v0, p0

    iget-object v11, v0, Lcom/belkin/wemo/cache/cloud/CloudRequestGetNestDevice;->TAG:Ljava/lang/String;

    new-instance v12, Ljava/lang/StringBuilder;

    invoke-direct {v12}, Ljava/lang/StringBuilder;-><init>()V

    const-string v13, "Nest Response parse: "

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-static {v8}, Ljava/lang/String;->valueOf(Z)Ljava/lang/String;

    move-result-object v13

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v12

    invoke-static {v11, v12}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 120
    move-object/from16 v0, p0

    iget-object v11, v0, Lcom/belkin/wemo/cache/cloud/CloudRequestGetNestDevice;->devicesList:Ljava/util/ArrayList;

    invoke-virtual {v11}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v5

    .local v5, "i$":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v11

    if-eqz v11, :cond_1

    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/belkin/wemo/cache/data/DeviceInformation;

    .line 121
    .local v2, "dev":Lcom/belkin/wemo/cache/data/DeviceInformation;
    move-object/from16 v0, p0

    iget-object v11, v0, Lcom/belkin/wemo/cache/cloud/CloudRequestGetNestDevice;->TAG:Ljava/lang/String;

    new-instance v12, Ljava/lang/StringBuilder;

    invoke-direct {v12}, Ljava/lang/StringBuilder;-><init>()V

    const-string v13, "Nest dev udn:"

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v2}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getUDN()Ljava/lang/String;

    move-result-object v13

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    const-string v13, " isDiscovered:"

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v2}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getIsDiscovered()Z

    move-result v13

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v12

    invoke-static {v11, v12}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 194
    .end local v2    # "dev":Lcom/belkin/wemo/cache/data/DeviceInformation;
    .end local v5    # "i$":Ljava/util/Iterator;
    .end local v7    # "response":Ljava/lang/String;
    .end local v8    # "responseParse":Z
    :catch_0
    move-exception v4

    .line 195
    .local v4, "e":Ljava/io/UnsupportedEncodingException;
    move-object/from16 v0, p0

    iget-object v11, v0, Lcom/belkin/wemo/cache/cloud/CloudRequestGetNestDevice;->TAG:Ljava/lang/String;

    const-string v12, "Nest Request error: "

    invoke-static {v11, v12, v4}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Exception;)V

    .line 215
    .end local v4    # "e":Ljava/io/UnsupportedEncodingException;
    :cond_0
    :goto_1
    return-void

    .line 123
    .restart local v5    # "i$":Ljava/util/Iterator;
    .restart local v7    # "response":Ljava/lang/String;
    .restart local v8    # "responseParse":Z
    :cond_1
    if-eqz v8, :cond_8

    .line 125
    :try_start_1
    move-object/from16 v0, p0

    iget-object v11, v0, Lcom/belkin/wemo/cache/cloud/CloudRequestGetNestDevice;->mDevMgr:Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    invoke-virtual {v11}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->getDeviceUDNListFromDB()Ljava/util/List;

    move-result-object v1

    .line 126
    .local v1, "dbDeviceUDNList":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    move-object/from16 v0, p0

    iget-object v11, v0, Lcom/belkin/wemo/cache/cloud/CloudRequestGetNestDevice;->TAG:Ljava/lang/String;

    new-instance v12, Ljava/lang/StringBuilder;

    invoke-direct {v12}, Ljava/lang/StringBuilder;-><init>()V

    const-string v13, "No. of nest devices in home : "

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/belkin/wemo/cache/cloud/CloudRequestGetNestDevice;->devicesList:Ljava/util/ArrayList;

    invoke-virtual {v13}, Ljava/util/ArrayList;->size()I

    move-result v13

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v12

    invoke-static {v11, v12}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 127
    move-object/from16 v0, p0

    iget-object v11, v0, Lcom/belkin/wemo/cache/cloud/CloudRequestGetNestDevice;->devicesList:Ljava/util/ArrayList;

    invoke-virtual {v11}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v5

    :goto_2
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v11

    if-eqz v11, :cond_5

    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/belkin/wemo/cache/data/DeviceInformation;

    .line 129
    .restart local v2    # "dev":Lcom/belkin/wemo/cache/data/DeviceInformation;
    invoke-virtual {v2}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getUDN()Ljava/lang/String;

    move-result-object v10

    .line 131
    .local v10, "udn":Ljava/lang/String;
    invoke-interface {v1, v10}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    .line 135
    move-object/from16 v0, p0

    iget-object v11, v0, Lcom/belkin/wemo/cache/cloud/CloudRequestGetNestDevice;->devicesArray:Lcom/belkin/wemo/cache/data/DevicesArray;

    invoke-virtual {v11, v2}, Lcom/belkin/wemo/cache/data/DevicesArray;->addOrUpdateDeviceInformation(Lcom/belkin/wemo/cache/data/DeviceInformation;)V

    .line 136
    const/4 v9, 0x0

    .line 139
    .local v9, "tempDevice":Lcom/belkin/wemo/cache/data/DeviceInformation;
    move-object/from16 v0, p0

    iget-object v11, v0, Lcom/belkin/wemo/cache/cloud/CloudRequestGetNestDevice;->mDevMgr:Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    invoke-virtual {v2}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getUDN()Ljava/lang/String;

    move-result-object v12

    const/4 v13, 0x0

    const/4 v14, 0x1

    const/4 v15, 0x1

    invoke-virtual {v11, v12, v13, v14, v15}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->getDeviceFromDBByUDN(Ljava/lang/String;ZZZ)Lcom/belkin/wemo/cache/data/DeviceInformation;

    move-result-object v9

    .line 140
    if-eqz v9, :cond_3

    .line 141
    invoke-virtual {v9}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getID()I

    move-result v11

    invoke-virtual {v2, v11}, Lcom/belkin/wemo/cache/data/DeviceInformation;->setID(I)V

    .line 143
    move-object/from16 v0, p0

    iget-object v11, v0, Lcom/belkin/wemo/cache/cloud/CloudRequestGetNestDevice;->cacheManager:Lcom/belkin/wemo/cache/CacheManager;

    const/4 v12, 0x0

    const/4 v13, 0x1

    const/4 v14, 0x1

    invoke-virtual {v11, v2, v12, v13, v14}, Lcom/belkin/wemo/cache/CacheManager;->updateDB(Lcom/belkin/wemo/cache/data/DeviceInformation;ZZZ)V

    .line 144
    const/4 v9, 0x0

    .line 158
    :cond_2
    :goto_3
    move-object/from16 v0, p0

    iget-object v11, v0, Lcom/belkin/wemo/cache/cloud/CloudRequestGetNestDevice;->mDevMgr:Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    invoke-virtual {v2}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getUDN()Ljava/lang/String;

    move-result-object v12

    const/4 v13, 0x0

    const/4 v14, 0x0

    const/4 v15, 0x1

    invoke-virtual {v11, v12, v13, v14, v15}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->getDeviceFromDBByUDN(Ljava/lang/String;ZZZ)Lcom/belkin/wemo/cache/data/DeviceInformation;

    move-result-object v9

    .line 159
    if-eqz v9, :cond_4

    .line 160
    invoke-virtual {v9}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getID()I

    move-result v11

    invoke-virtual {v2, v11}, Lcom/belkin/wemo/cache/data/DeviceInformation;->setID(I)V

    .line 162
    move-object/from16 v0, p0

    iget-object v11, v0, Lcom/belkin/wemo/cache/cloud/CloudRequestGetNestDevice;->cacheManager:Lcom/belkin/wemo/cache/CacheManager;

    const/4 v12, 0x0

    const/4 v13, 0x0

    const/4 v14, 0x1

    invoke-virtual {v11, v2, v12, v13, v14}, Lcom/belkin/wemo/cache/CacheManager;->updateDB(Lcom/belkin/wemo/cache/data/DeviceInformation;ZZZ)V

    .line 163
    move-object/from16 v0, p0

    iget-object v11, v0, Lcom/belkin/wemo/cache/cloud/CloudRequestGetNestDevice;->TAG:Ljava/lang/String;

    new-instance v12, Ljava/lang/StringBuilder;

    invoke-direct {v12}, Ljava/lang/StringBuilder;-><init>()V

    const-string v13, "Nest sending update notification "

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v2}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getUDN()Ljava/lang/String;

    move-result-object v13

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    const-string v13, " name:"

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v2}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getFriendlyName()Ljava/lang/String;

    move-result-object v13

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v12

    invoke-static {v11, v12}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 164
    move-object/from16 v0, p0

    iget-object v11, v0, Lcom/belkin/wemo/cache/cloud/CloudRequestGetNestDevice;->mDevMgr:Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    const-string v12, "update"

    const-string v13, ""

    invoke-virtual {v2}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getUDN()Ljava/lang/String;

    move-result-object v14

    invoke-virtual {v11, v12, v13, v14}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->sendNotification(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    goto/16 :goto_2

    .line 147
    :cond_3
    move-object/from16 v0, p0

    iget-object v11, v0, Lcom/belkin/wemo/cache/cloud/CloudRequestGetNestDevice;->cacheManager:Lcom/belkin/wemo/cache/CacheManager;

    const/4 v12, 0x0

    const/4 v13, 0x1

    const/4 v14, 0x1

    invoke-virtual {v11, v2, v12, v13, v14}, Lcom/belkin/wemo/cache/CacheManager;->addDeviceToDB(Lcom/belkin/wemo/cache/data/DeviceInformation;ZZZ)Z

    .line 150
    move-object/from16 v0, p0

    iget-object v11, v0, Lcom/belkin/wemo/cache/cloud/CloudRequestGetNestDevice;->mDevMgr:Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    invoke-virtual {v2}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getUDN()Ljava/lang/String;

    move-result-object v12

    const/4 v13, 0x1

    const/4 v14, 0x0

    const/4 v15, 0x0

    invoke-virtual {v11, v12, v13, v14, v15}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->getDeviceFromDBByUDN(Ljava/lang/String;ZZZ)Lcom/belkin/wemo/cache/data/DeviceInformation;

    move-result-object v11

    if-nez v11, :cond_2

    .line 152
    move-object/from16 v0, p0

    iget-object v11, v0, Lcom/belkin/wemo/cache/cloud/CloudRequestGetNestDevice;->mDevMgr:Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    invoke-virtual {v2}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getUDN()Ljava/lang/String;

    move-result-object v12

    const/4 v13, 0x1

    const/4 v14, 0x0

    invoke-virtual {v11, v12, v13, v14}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->addDeviceWithOnlyUDNToLocalOrRemoteTable(Ljava/lang/String;ZZ)V

    goto/16 :goto_3

    .line 166
    :cond_4
    move-object/from16 v0, p0

    iget-object v11, v0, Lcom/belkin/wemo/cache/cloud/CloudRequestGetNestDevice;->cacheManager:Lcom/belkin/wemo/cache/CacheManager;

    const/4 v12, 0x0

    const/4 v13, 0x0

    const/4 v14, 0x1

    invoke-virtual {v11, v2, v12, v13, v14}, Lcom/belkin/wemo/cache/CacheManager;->addDeviceToDB(Lcom/belkin/wemo/cache/data/DeviceInformation;ZZZ)Z

    .line 167
    move-object/from16 v0, p0

    iget-object v11, v0, Lcom/belkin/wemo/cache/cloud/CloudRequestGetNestDevice;->TAG:Ljava/lang/String;

    new-instance v12, Ljava/lang/StringBuilder;

    invoke-direct {v12}, Ljava/lang/StringBuilder;-><init>()V

    const-string v13, " Nest sending add notification "

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v2}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getUDN()Ljava/lang/String;

    move-result-object v13

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    const-string v13, " name:"

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v2}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getFriendlyName()Ljava/lang/String;

    move-result-object v13

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v12

    invoke-static {v11, v12}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 168
    move-object/from16 v0, p0

    iget-object v11, v0, Lcom/belkin/wemo/cache/cloud/CloudRequestGetNestDevice;->mDevMgr:Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    const-string v12, "add"

    const-string v13, ""

    invoke-virtual {v2}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getUDN()Ljava/lang/String;

    move-result-object v14

    invoke-virtual {v11, v12, v13, v14}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->sendNotification(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    goto/16 :goto_2

    .line 173
    .end local v2    # "dev":Lcom/belkin/wemo/cache/data/DeviceInformation;
    .end local v9    # "tempDevice":Lcom/belkin/wemo/cache/data/DeviceInformation;
    .end local v10    # "udn":Ljava/lang/String;
    :cond_5
    invoke-interface {v1}, Ljava/util/List;->isEmpty()Z

    move-result v11

    if-nez v11, :cond_7

    .line 174
    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v5

    :cond_6
    :goto_4
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v11

    if-eqz v11, :cond_7

    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Ljava/lang/String;

    .line 175
    .restart local v10    # "udn":Ljava/lang/String;
    const-string v11, "WEMO00"

    invoke-virtual {v10, v11}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v11

    if-eqz v11, :cond_6

    .line 176
    move-object/from16 v0, p0

    iget-object v11, v0, Lcom/belkin/wemo/cache/cloud/CloudRequestGetNestDevice;->TAG:Ljava/lang/String;

    new-instance v12, Ljava/lang/StringBuilder;

    invoke-direct {v12}, Ljava/lang/StringBuilder;-><init>()V

    const-string v13, "Nest DB Device NOT found in via CLOUD API. Device shall be removed from DB and device list. UDN: "

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v12

    invoke-static {v11, v12}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 179
    move-object/from16 v0, p0

    iget-object v11, v0, Lcom/belkin/wemo/cache/cloud/CloudRequestGetNestDevice;->mDevMgr:Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    const-string v12, "remove"

    const-string v13, ""

    invoke-virtual {v11, v12, v13, v10}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->sendNotification(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 181
    move-object/from16 v0, p0

    iget-object v11, v0, Lcom/belkin/wemo/cache/cloud/CloudRequestGetNestDevice;->mContext:Landroid/content/Context;

    invoke-static {v11}, Lcom/belkin/wemo/cache/data/DevicesArray;->getInstance(Landroid/content/Context;)Lcom/belkin/wemo/cache/data/DevicesArray;

    move-result-object v11

    invoke-virtual {v11, v10}, Lcom/belkin/wemo/cache/data/DevicesArray;->deleteDeviceInformation(Ljava/lang/String;)Z

    .line 182
    move-object/from16 v0, p0

    iget-object v11, v0, Lcom/belkin/wemo/cache/cloud/CloudRequestGetNestDevice;->mContext:Landroid/content/Context;

    invoke-static {v11}, Lcom/belkin/wemo/cache/CacheManager;->getInstance(Landroid/content/Context;)Lcom/belkin/wemo/cache/CacheManager;

    move-result-object v11

    const/4 v12, 0x1

    const/4 v13, 0x1

    const/4 v14, 0x1

    invoke-virtual {v11, v10, v12, v13, v14}, Lcom/belkin/wemo/cache/CacheManager;->deleteDeviceFromDB(Ljava/lang/String;ZZZ)Z

    goto :goto_4

    .line 187
    .end local v10    # "udn":Ljava/lang/String;
    :cond_7
    new-instance v6, Lcom/belkin/wemo/cache/utils/MoreUtil;

    invoke-direct {v6}, Lcom/belkin/wemo/cache/utils/MoreUtil;-><init>()V

    .line 188
    .local v6, "mU":Lcom/belkin/wemo/cache/utils/MoreUtil;
    const-string v11, "cache.db"

    move-object/from16 v0, p0

    iget-object v12, v0, Lcom/belkin/wemo/cache/cloud/CloudRequestGetNestDevice;->mContext:Landroid/content/Context;

    invoke-virtual {v6, v11, v12}, Lcom/belkin/wemo/cache/utils/MoreUtil;->copyDbToDownloadDirectory(Ljava/lang/String;Landroid/content/Context;)V

    goto/16 :goto_1

    .line 192
    .end local v1    # "dbDeviceUDNList":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    .end local v6    # "mU":Lcom/belkin/wemo/cache/utils/MoreUtil;
    :cond_8
    move-object/from16 v0, p0

    iget-object v11, v0, Lcom/belkin/wemo/cache/cloud/CloudRequestGetNestDevice;->TAG:Ljava/lang/String;

    const-string v12, "DEVICELIST is NULL"

    invoke-static {v11, v12}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_1
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_1 .. :try_end_1} :catch_0

    goto/16 :goto_1

    .line 200
    .end local v5    # "i$":Ljava/util/Iterator;
    .end local v7    # "response":Ljava/lang/String;
    .end local v8    # "responseParse":Z
    :cond_9
    move-object/from16 v0, p0

    iget-object v11, v0, Lcom/belkin/wemo/cache/cloud/CloudRequestGetNestDevice;->mDevMgr:Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    const/4 v12, 0x0

    const/4 v13, 0x0

    const/4 v14, 0x1

    invoke-virtual {v11, v12, v13, v14}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->getDeviceInformationFromDB(ZZZ)Ljava/util/ArrayList;

    move-result-object v3

    .line 201
    .local v3, "devInfo":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/belkin/wemo/cache/data/DeviceInformation;>;"
    if-eqz v3, :cond_0

    .line 202
    invoke-virtual {v3}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v5

    .restart local v5    # "i$":Ljava/util/Iterator;
    :cond_a
    :goto_5
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v11

    if-eqz v11, :cond_0

    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/belkin/wemo/cache/data/DeviceInformation;

    .line 203
    .restart local v2    # "dev":Lcom/belkin/wemo/cache/data/DeviceInformation;
    move-object/from16 v0, p0

    iget-object v11, v0, Lcom/belkin/wemo/cache/cloud/CloudRequestGetNestDevice;->TAG:Ljava/lang/String;

    new-instance v12, Ljava/lang/StringBuilder;

    invoke-direct {v12}, Ljava/lang/StringBuilder;-><init>()V

    const-string v13, "Nest dev udn:"

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v2}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getUDN()Ljava/lang/String;

    move-result-object v13

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    const-string v13, " isDiscovered:"

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v2}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getIsDiscovered()Z

    move-result v13

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v12

    invoke-static {v11, v12}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 204
    invoke-virtual {v2}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getUDN()Ljava/lang/String;

    move-result-object v11

    const-string v12, "WEMO00"

    invoke-virtual {v11, v12}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v11

    if-eqz v11, :cond_a

    .line 205
    const/4 v11, 0x0

    invoke-virtual {v2, v11}, Lcom/belkin/wemo/cache/data/DeviceInformation;->setIsDiscovered(Z)V

    .line 206
    const/4 v11, 0x1

    invoke-virtual {v2, v11}, Lcom/belkin/wemo/cache/data/DeviceInformation;->setInActive(I)V

    .line 207
    move-object/from16 v0, p0

    iget-object v11, v0, Lcom/belkin/wemo/cache/cloud/CloudRequestGetNestDevice;->devicesArray:Lcom/belkin/wemo/cache/data/DevicesArray;

    invoke-virtual {v11, v2}, Lcom/belkin/wemo/cache/data/DevicesArray;->addOrUpdateDeviceInformation(Lcom/belkin/wemo/cache/data/DeviceInformation;)V

    .line 208
    move-object/from16 v0, p0

    iget-object v11, v0, Lcom/belkin/wemo/cache/cloud/CloudRequestGetNestDevice;->cacheManager:Lcom/belkin/wemo/cache/CacheManager;

    const/4 v12, 0x0

    const/4 v13, 0x0

    const/4 v14, 0x1

    invoke-virtual {v11, v2, v12, v13, v14}, Lcom/belkin/wemo/cache/CacheManager;->updateDB(Lcom/belkin/wemo/cache/data/DeviceInformation;ZZZ)V

    .line 209
    move-object/from16 v0, p0

    iget-object v11, v0, Lcom/belkin/wemo/cache/cloud/CloudRequestGetNestDevice;->mDevMgr:Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    const/4 v12, 0x1

    invoke-virtual {v11, v12}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->setUnicastFailedForAnyDevice(Z)V

    .line 210
    move-object/from16 v0, p0

    iget-object v11, v0, Lcom/belkin/wemo/cache/cloud/CloudRequestGetNestDevice;->mDevMgr:Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    const-string v12, "update"

    const-string v13, ""

    invoke-virtual {v2}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getUDN()Ljava/lang/String;

    move-result-object v14

    invoke-virtual {v11, v12, v13, v14}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->sendNotification(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_5
.end method
