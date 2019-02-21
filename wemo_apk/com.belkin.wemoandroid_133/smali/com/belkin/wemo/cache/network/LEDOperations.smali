.class public Lcom/belkin/wemo/cache/network/LEDOperations;
.super Lcom/belkin/wemo/runnable/WeMoRunnable;
.source "LEDOperations.java"


# instance fields
.field private final CREATE_GROUP:Ljava/lang/String;

.field private final REMOVE_GROUP:Ljava/lang/String;

.field private bridgeUDN:Ljava/lang/String;

.field private capabilityIDs:Ljava/lang/StringBuilder;

.field private capabilityValues:Ljava/lang/StringBuilder;

.field private device:Lorg/cybergarage/upnp/Device;

.field private deviceCapabilities:Lorg/json/JSONObject;

.field private deviceIDs:Lorg/json/JSONArray;

.field private groupIcon:Ljava/lang/String;

.field private groupName:Ljava/lang/String;

.field private groupProperties:Lorg/json/JSONObject;

.field private isNewGroup:Z

.field private mCacheManager:Lcom/belkin/wemo/cache/CacheManager;

.field private mDeviceInfo:Lcom/belkin/wemo/cache/data/DeviceInformation;

.field private mDeviceListManager:Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

.field private mDevicesArray:Lcom/belkin/wemo/cache/data/DevicesArray;

.field private mGroupId:Ljava/lang/String;

.field private operation:Ljava/lang/String;

.field private removedDeviceID:Ljava/lang/String;

.field private tag:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;I)V
    .locals 1
    .param p1, "operation"    # Ljava/lang/String;
    .param p2, "bridgeUDN"    # Ljava/lang/String;
    .param p3, "groupId"    # I

    .prologue
    .line 68
    invoke-direct {p0}, Lcom/belkin/wemo/runnable/WeMoRunnable;-><init>()V

    .line 43
    const-string v0, "LEDOperations"

    iput-object v0, p0, Lcom/belkin/wemo/cache/network/LEDOperations;->tag:Ljava/lang/String;

    .line 46
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/belkin/wemo/cache/network/LEDOperations;->mDeviceListManager:Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    .line 55
    const-string v0, "CreateGroup"

    iput-object v0, p0, Lcom/belkin/wemo/cache/network/LEDOperations;->CREATE_GROUP:Ljava/lang/String;

    .line 56
    const-string v0, "RemoveGroup"

    iput-object v0, p0, Lcom/belkin/wemo/cache/network/LEDOperations;->REMOVE_GROUP:Ljava/lang/String;

    .line 57
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/belkin/wemo/cache/network/LEDOperations;->isNewGroup:Z

    .line 58
    const-string v0, ""

    iput-object v0, p0, Lcom/belkin/wemo/cache/network/LEDOperations;->removedDeviceID:Ljava/lang/String;

    .line 69
    iput-object p1, p0, Lcom/belkin/wemo/cache/network/LEDOperations;->operation:Ljava/lang/String;

    .line 70
    iput-object p2, p0, Lcom/belkin/wemo/cache/network/LEDOperations;->bridgeUDN:Ljava/lang/String;

    .line 71
    invoke-static {p3}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/belkin/wemo/cache/network/LEDOperations;->mGroupId:Ljava/lang/String;

    .line 72
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;Lorg/json/JSONObject;Ljava/lang/Boolean;)V
    .locals 1
    .param p1, "operation"    # Ljava/lang/String;
    .param p2, "bridgeUDN"    # Ljava/lang/String;
    .param p3, "groupProperties"    # Lorg/json/JSONObject;
    .param p4, "isNewGroup"    # Ljava/lang/Boolean;

    .prologue
    .line 61
    invoke-direct {p0}, Lcom/belkin/wemo/runnable/WeMoRunnable;-><init>()V

    .line 43
    const-string v0, "LEDOperations"

    iput-object v0, p0, Lcom/belkin/wemo/cache/network/LEDOperations;->tag:Ljava/lang/String;

    .line 46
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/belkin/wemo/cache/network/LEDOperations;->mDeviceListManager:Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    .line 55
    const-string v0, "CreateGroup"

    iput-object v0, p0, Lcom/belkin/wemo/cache/network/LEDOperations;->CREATE_GROUP:Ljava/lang/String;

    .line 56
    const-string v0, "RemoveGroup"

    iput-object v0, p0, Lcom/belkin/wemo/cache/network/LEDOperations;->REMOVE_GROUP:Ljava/lang/String;

    .line 57
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/belkin/wemo/cache/network/LEDOperations;->isNewGroup:Z

    .line 58
    const-string v0, ""

    iput-object v0, p0, Lcom/belkin/wemo/cache/network/LEDOperations;->removedDeviceID:Ljava/lang/String;

    .line 62
    iput-object p1, p0, Lcom/belkin/wemo/cache/network/LEDOperations;->operation:Ljava/lang/String;

    .line 63
    iput-object p2, p0, Lcom/belkin/wemo/cache/network/LEDOperations;->bridgeUDN:Ljava/lang/String;

    .line 64
    iput-object p3, p0, Lcom/belkin/wemo/cache/network/LEDOperations;->groupProperties:Lorg/json/JSONObject;

    .line 65
    invoke-virtual {p4}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    iput-boolean v0, p0, Lcom/belkin/wemo/cache/network/LEDOperations;->isNewGroup:Z

    .line 66
    return-void
.end method

.method private generateActionXMLInput(Lorg/json/JSONArray;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 25
    .param p1, "deviceIds"    # Lorg/json/JSONArray;
    .param p2, "GroupCapabilityIDs"    # Ljava/lang/String;
    .param p3, "GroupCapabilityValues"    # Ljava/lang/String;
    .param p4, "groupName"    # Ljava/lang/String;
    .param p5, "groupId"    # Ljava/lang/String;

    .prologue
    .line 267
    const/16 v18, 0x0

    .line 269
    .local v18, "tempxml":Ljava/lang/String;
    :try_start_0
    new-instance v17, Ljava/util/ArrayList;

    invoke-direct/range {v17 .. v17}, Ljava/util/ArrayList;-><init>()V

    .line 271
    .local v17, "strtemp":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    new-instance v4, Ljava/lang/StringBuffer;

    invoke-direct {v4}, Ljava/lang/StringBuffer;-><init>()V

    .line 272
    .local v4, "devIds":Ljava/lang/StringBuffer;
    const/4 v13, 0x0

    .local v13, "i":I
    :goto_0
    invoke-virtual/range {p1 .. p1}, Lorg/json/JSONArray;->length()I

    move-result v22

    move/from16 v0, v22

    if-ge v13, v0, :cond_1

    .line 273
    move-object/from16 v0, p1

    invoke-virtual {v0, v13}, Lorg/json/JSONArray;->get(I)Ljava/lang/Object;

    move-result-object v22

    invoke-virtual/range {v22 .. v22}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v22

    move-object/from16 v0, v22

    invoke-virtual {v4, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 274
    invoke-virtual/range {p1 .. p1}, Lorg/json/JSONArray;->length()I

    move-result v22

    add-int/lit8 v22, v22, -0x1

    move/from16 v0, v22

    if-ge v13, v0, :cond_0

    .line 275
    const-string v22, ","

    move-object/from16 v0, v22

    invoke-virtual {v4, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 276
    :cond_0
    move-object/from16 v0, p1

    invoke-virtual {v0, v13}, Lorg/json/JSONArray;->get(I)Ljava/lang/Object;

    move-result-object v22

    invoke-virtual/range {v22 .. v22}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v22

    move-object/from16 v0, v17

    move-object/from16 v1, v22

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 272
    add-int/lit8 v13, v13, 0x1

    goto :goto_0

    .line 279
    :cond_1
    invoke-virtual {v4}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v16

    .line 281
    .local v16, "strDevIds":Ljava/lang/String;
    invoke-static {}, Ljavax/xml/parsers/DocumentBuilderFactory;->newInstance()Ljavax/xml/parsers/DocumentBuilderFactory;

    move-result-object v9

    .line 282
    .local v9, "docFactory":Ljavax/xml/parsers/DocumentBuilderFactory;
    invoke-virtual {v9}, Ljavax/xml/parsers/DocumentBuilderFactory;->newDocumentBuilder()Ljavax/xml/parsers/DocumentBuilder;

    move-result-object v8

    .line 285
    .local v8, "docBuilder":Ljavax/xml/parsers/DocumentBuilder;
    invoke-virtual {v8}, Ljavax/xml/parsers/DocumentBuilder;->newDocument()Lorg/w3c/dom/Document;

    move-result-object v7

    .line 287
    .local v7, "doc":Lorg/w3c/dom/Document;
    const-string v22, "CreateGroup"

    move-object/from16 v0, v22

    invoke-interface {v7, v0}, Lorg/w3c/dom/Document;->createElement(Ljava/lang/String;)Lorg/w3c/dom/Element;

    move-result-object v6

    .line 288
    .local v6, "deviceStatusTag":Lorg/w3c/dom/Element;
    invoke-interface {v7, v6}, Lorg/w3c/dom/Document;->appendChild(Lorg/w3c/dom/Node;)Lorg/w3c/dom/Node;

    .line 290
    const-string v22, "GroupID"

    move-object/from16 v0, v22

    invoke-interface {v7, v0}, Lorg/w3c/dom/Document;->createElement(Ljava/lang/String;)Lorg/w3c/dom/Element;

    move-result-object v11

    .line 292
    .local v11, "groupAvailableTag":Lorg/w3c/dom/Element;
    move-object/from16 v0, p5

    invoke-interface {v7, v0}, Lorg/w3c/dom/Document;->createTextNode(Ljava/lang/String;)Lorg/w3c/dom/Text;

    move-result-object v22

    move-object/from16 v0, v22

    invoke-interface {v11, v0}, Lorg/w3c/dom/Element;->appendChild(Lorg/w3c/dom/Node;)Lorg/w3c/dom/Node;

    .line 293
    invoke-interface {v6, v11}, Lorg/w3c/dom/Element;->appendChild(Lorg/w3c/dom/Node;)Lorg/w3c/dom/Node;

    .line 296
    const-string v22, "GroupName"

    move-object/from16 v0, v22

    invoke-interface {v7, v0}, Lorg/w3c/dom/Document;->createElement(Ljava/lang/String;)Lorg/w3c/dom/Element;

    move-result-object v5

    .line 297
    .local v5, "deviceIdTag":Lorg/w3c/dom/Element;
    move-object/from16 v0, p4

    invoke-interface {v7, v0}, Lorg/w3c/dom/Document;->createTextNode(Ljava/lang/String;)Lorg/w3c/dom/Text;

    move-result-object v22

    move-object/from16 v0, v22

    invoke-interface {v5, v0}, Lorg/w3c/dom/Element;->appendChild(Lorg/w3c/dom/Node;)Lorg/w3c/dom/Node;

    .line 298
    invoke-interface {v6, v5}, Lorg/w3c/dom/Element;->appendChild(Lorg/w3c/dom/Node;)Lorg/w3c/dom/Node;

    .line 301
    const-string v22, "DeviceIDList"

    move-object/from16 v0, v22

    invoke-interface {v7, v0}, Lorg/w3c/dom/Document;->createElement(Ljava/lang/String;)Lorg/w3c/dom/Element;

    move-result-object v2

    .line 302
    .local v2, "capabilityIdTag":Lorg/w3c/dom/Element;
    move-object/from16 v0, v16

    invoke-interface {v7, v0}, Lorg/w3c/dom/Document;->createTextNode(Ljava/lang/String;)Lorg/w3c/dom/Text;

    move-result-object v22

    move-object/from16 v0, v22

    invoke-interface {v2, v0}, Lorg/w3c/dom/Element;->appendChild(Lorg/w3c/dom/Node;)Lorg/w3c/dom/Node;

    .line 303
    invoke-interface {v6, v2}, Lorg/w3c/dom/Element;->appendChild(Lorg/w3c/dom/Node;)Lorg/w3c/dom/Node;

    .line 306
    const-string v22, "GroupCapabilityIDs"

    move-object/from16 v0, v22

    invoke-interface {v7, v0}, Lorg/w3c/dom/Document;->createElement(Ljava/lang/String;)Lorg/w3c/dom/Element;

    move-result-object v3

    .line 307
    .local v3, "capabilityValueTag":Lorg/w3c/dom/Element;
    move-object/from16 v0, p2

    invoke-interface {v7, v0}, Lorg/w3c/dom/Document;->createTextNode(Ljava/lang/String;)Lorg/w3c/dom/Text;

    move-result-object v22

    move-object/from16 v0, v22

    invoke-interface {v3, v0}, Lorg/w3c/dom/Element;->appendChild(Lorg/w3c/dom/Node;)Lorg/w3c/dom/Node;

    .line 308
    invoke-interface {v6, v3}, Lorg/w3c/dom/Element;->appendChild(Lorg/w3c/dom/Node;)Lorg/w3c/dom/Node;

    .line 311
    const-string v22, "GroupCapabilityValues"

    move-object/from16 v0, v22

    invoke-interface {v7, v0}, Lorg/w3c/dom/Document;->createElement(Ljava/lang/String;)Lorg/w3c/dom/Element;

    move-result-object v12

    .line 312
    .local v12, "groupCapabilityIdTag":Lorg/w3c/dom/Element;
    move-object/from16 v0, p3

    invoke-interface {v7, v0}, Lorg/w3c/dom/Document;->createTextNode(Ljava/lang/String;)Lorg/w3c/dom/Text;

    move-result-object v22

    move-object/from16 v0, v22

    invoke-interface {v12, v0}, Lorg/w3c/dom/Element;->appendChild(Lorg/w3c/dom/Node;)Lorg/w3c/dom/Node;

    .line 313
    invoke-interface {v6, v12}, Lorg/w3c/dom/Element;->appendChild(Lorg/w3c/dom/Node;)Lorg/w3c/dom/Node;

    .line 315
    invoke-static {}, Ljavax/xml/transform/TransformerFactory;->newInstance()Ljavax/xml/transform/TransformerFactory;

    move-result-object v22

    invoke-virtual/range {v22 .. v22}, Ljavax/xml/transform/TransformerFactory;->newTransformer()Ljavax/xml/transform/Transformer;

    move-result-object v20

    .line 316
    .local v20, "transformer":Ljavax/xml/transform/Transformer;
    new-instance v21, Ljava/io/StringWriter;

    invoke-direct/range {v21 .. v21}, Ljava/io/StringWriter;-><init>()V

    .line 317
    .local v21, "writer":Ljava/io/StringWriter;
    new-instance v15, Ljavax/xml/transform/stream/StreamResult;

    move-object/from16 v0, v21

    invoke-direct {v15, v0}, Ljavax/xml/transform/stream/StreamResult;-><init>(Ljava/io/Writer;)V

    .line 318
    .local v15, "result":Ljavax/xml/transform/stream/StreamResult;
    new-instance v22, Ljavax/xml/transform/dom/DOMSource;

    move-object/from16 v0, v22

    invoke-direct {v0, v7}, Ljavax/xml/transform/dom/DOMSource;-><init>(Lorg/w3c/dom/Node;)V

    move-object/from16 v0, v20

    move-object/from16 v1, v22

    invoke-virtual {v0, v1, v15}, Ljavax/xml/transform/Transformer;->transform(Ljavax/xml/transform/Source;Ljavax/xml/transform/Result;)V

    .line 321
    invoke-virtual/range {v21 .. v21}, Ljava/io/StringWriter;->toString()Ljava/lang/String;

    move-result-object v18

    .line 322
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/wemo/cache/network/LEDOperations;->tag:Ljava/lang/String;

    move-object/from16 v22, v0

    new-instance v23, Ljava/lang/StringBuilder;

    invoke-direct/range {v23 .. v23}, Ljava/lang/StringBuilder;-><init>()V

    const-string v24, "File saved!"

    invoke-virtual/range {v23 .. v24}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v23

    move-object/from16 v0, v23

    move-object/from16 v1, v18

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v23

    invoke-virtual/range {v23 .. v23}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v23

    invoke-static/range {v22 .. v23}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->debugLog(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catch Ljavax/xml/parsers/ParserConfigurationException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljavax/xml/transform/TransformerException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_2

    .line 331
    .end local v2    # "capabilityIdTag":Lorg/w3c/dom/Element;
    .end local v3    # "capabilityValueTag":Lorg/w3c/dom/Element;
    .end local v4    # "devIds":Ljava/lang/StringBuffer;
    .end local v5    # "deviceIdTag":Lorg/w3c/dom/Element;
    .end local v6    # "deviceStatusTag":Lorg/w3c/dom/Element;
    .end local v7    # "doc":Lorg/w3c/dom/Document;
    .end local v8    # "docBuilder":Ljavax/xml/parsers/DocumentBuilder;
    .end local v9    # "docFactory":Ljavax/xml/parsers/DocumentBuilderFactory;
    .end local v11    # "groupAvailableTag":Lorg/w3c/dom/Element;
    .end local v12    # "groupCapabilityIdTag":Lorg/w3c/dom/Element;
    .end local v13    # "i":I
    .end local v15    # "result":Ljavax/xml/transform/stream/StreamResult;
    .end local v16    # "strDevIds":Ljava/lang/String;
    .end local v17    # "strtemp":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    .end local v20    # "transformer":Ljavax/xml/transform/Transformer;
    .end local v21    # "writer":Ljava/io/StringWriter;
    :goto_1
    return-object v18

    .line 323
    :catch_0
    move-exception v14

    .line 324
    .local v14, "pce":Ljavax/xml/parsers/ParserConfigurationException;
    invoke-virtual {v14}, Ljavax/xml/parsers/ParserConfigurationException;->printStackTrace()V

    goto :goto_1

    .line 325
    .end local v14    # "pce":Ljavax/xml/parsers/ParserConfigurationException;
    :catch_1
    move-exception v19

    .line 326
    .local v19, "tfe":Ljavax/xml/transform/TransformerException;
    invoke-virtual/range {v19 .. v19}, Ljavax/xml/transform/TransformerException;->printStackTrace()V

    goto :goto_1

    .line 327
    .end local v19    # "tfe":Ljavax/xml/transform/TransformerException;
    :catch_2
    move-exception v10

    .line 329
    .local v10, "e":Lorg/json/JSONException;
    invoke-virtual {v10}, Lorg/json/JSONException;->printStackTrace()V

    goto :goto_1
.end method

.method private processResult(Ljava/lang/Boolean;)V
    .locals 13
    .param p1, "result"    # Ljava/lang/Boolean;

    .prologue
    const/4 v12, 0x1

    const/4 v11, 0x0

    .line 218
    iget-object v7, p0, Lcom/belkin/wemo/cache/network/LEDOperations;->tag:Ljava/lang/String;

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "result is :"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-static {v7, v8}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 219
    iget-object v7, p0, Lcom/belkin/wemo/cache/network/LEDOperations;->operation:Ljava/lang/String;

    const-string v8, "CreateGroup"

    invoke-virtual {v7, v8}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_4

    .line 220
    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v7

    if-eqz v7, :cond_2

    .line 222
    const/4 v4, 0x0

    .local v4, "i":I
    :goto_0
    iget-object v7, p0, Lcom/belkin/wemo/cache/network/LEDOperations;->deviceIDs:Lorg/json/JSONArray;

    invoke-virtual {v7}, Lorg/json/JSONArray;->length()I

    move-result v7

    if-ge v4, v7, :cond_1

    .line 225
    :try_start_0
    iget-object v7, p0, Lcom/belkin/wemo/cache/network/LEDOperations;->deviceIDs:Lorg/json/JSONArray;

    invoke-virtual {v7, v4}, Lorg/json/JSONArray;->getString(I)Ljava/lang/String;

    move-result-object v0

    .line 226
    .local v0, "deviceID":Ljava/lang/String;
    iget-object v7, p0, Lcom/belkin/wemo/cache/network/LEDOperations;->mDeviceListManager:Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    iget-object v8, p0, Lcom/belkin/wemo/cache/network/LEDOperations;->deviceCapabilities:Lorg/json/JSONObject;

    invoke-virtual {v7, v0, v8}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->updateZigbeeCapabilities(Ljava/lang/String;Lorg/json/JSONObject;)Lcom/belkin/wemo/cache/data/DeviceInformation;

    move-result-object v6

    .line 227
    .local v6, "ledDevice":Lcom/belkin/wemo/cache/data/DeviceInformation;
    iget-object v7, p0, Lcom/belkin/wemo/cache/network/LEDOperations;->mGroupId:Ljava/lang/String;

    invoke-virtual {v6, v7}, Lcom/belkin/wemo/cache/data/DeviceInformation;->setGroupID(Ljava/lang/String;)V

    .line 228
    iget-object v7, p0, Lcom/belkin/wemo/cache/network/LEDOperations;->groupName:Ljava/lang/String;

    invoke-virtual {v6, v7}, Lcom/belkin/wemo/cache/data/DeviceInformation;->setGroupName(Ljava/lang/String;)V

    .line 229
    iget-object v7, p0, Lcom/belkin/wemo/cache/network/LEDOperations;->groupIcon:Ljava/lang/String;

    invoke-virtual {v7}, Ljava/lang/String;->isEmpty()Z

    move-result v7

    if-eqz v7, :cond_0

    .line 230
    invoke-virtual {v6}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getManufacturerName()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getModelCode()Ljava/lang/String;

    move-result-object v8

    invoke-static {v7, v8}, Lcom/belkin/wemo/cache/utils/WemoUtils;->getZigbeeIcon(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    iput-object v7, p0, Lcom/belkin/wemo/cache/network/LEDOperations;->groupIcon:Ljava/lang/String;

    .line 231
    :cond_0
    iget-object v7, p0, Lcom/belkin/wemo/cache/network/LEDOperations;->groupIcon:Ljava/lang/String;

    invoke-virtual {v6, v7}, Lcom/belkin/wemo/cache/data/DeviceInformation;->setGroupIcon(Ljava/lang/String;)V

    .line 232
    iget-object v7, p0, Lcom/belkin/wemo/cache/network/LEDOperations;->mDevicesArray:Lcom/belkin/wemo/cache/data/DevicesArray;

    invoke-virtual {v7, v6}, Lcom/belkin/wemo/cache/data/DevicesArray;->addOrUpdateDeviceInformation(Lcom/belkin/wemo/cache/data/DeviceInformation;)V

    .line 233
    iget-object v7, p0, Lcom/belkin/wemo/cache/network/LEDOperations;->mCacheManager:Lcom/belkin/wemo/cache/CacheManager;

    const/4 v8, 0x0

    const/4 v9, 0x0

    const/4 v10, 0x1

    invoke-virtual {v7, v6, v8, v9, v10}, Lcom/belkin/wemo/cache/CacheManager;->updateDB(Lcom/belkin/wemo/cache/data/DeviceInformation;ZZZ)V
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 222
    .end local v0    # "deviceID":Ljava/lang/String;
    .end local v6    # "ledDevice":Lcom/belkin/wemo/cache/data/DeviceInformation;
    :goto_1
    add-int/lit8 v4, v4, 0x1

    goto :goto_0

    .line 235
    :catch_0
    move-exception v1

    .line 237
    .local v1, "e":Lorg/json/JSONException;
    invoke-virtual {v1}, Lorg/json/JSONException;->printStackTrace()V

    goto :goto_1

    .line 240
    .end local v1    # "e":Lorg/json/JSONException;
    :cond_1
    iget-object v7, p0, Lcom/belkin/wemo/cache/network/LEDOperations;->removedDeviceID:Ljava/lang/String;

    if-eqz v7, :cond_2

    iget-object v7, p0, Lcom/belkin/wemo/cache/network/LEDOperations;->removedDeviceID:Ljava/lang/String;

    invoke-virtual {v7}, Ljava/lang/String;->isEmpty()Z

    move-result v7

    if-nez v7, :cond_2

    .line 241
    iget-object v7, p0, Lcom/belkin/wemo/cache/network/LEDOperations;->mDeviceListManager:Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    iget-object v8, p0, Lcom/belkin/wemo/cache/network/LEDOperations;->removedDeviceID:Ljava/lang/String;

    invoke-virtual {v7, v8}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->getDeviceInformationFromDevicesArray(Ljava/lang/String;)Lcom/belkin/wemo/cache/data/DeviceInformation;

    move-result-object v2

    .line 242
    .local v2, "editedDevice":Lcom/belkin/wemo/cache/data/DeviceInformation;
    const-string v7, ""

    invoke-virtual {v2, v7}, Lcom/belkin/wemo/cache/data/DeviceInformation;->setGroupID(Ljava/lang/String;)V

    .line 243
    const-string v7, ""

    invoke-virtual {v2, v7}, Lcom/belkin/wemo/cache/data/DeviceInformation;->setGroupName(Ljava/lang/String;)V

    .line 244
    iget-object v7, p0, Lcom/belkin/wemo/cache/network/LEDOperations;->mDevicesArray:Lcom/belkin/wemo/cache/data/DevicesArray;

    invoke-virtual {v7, v2}, Lcom/belkin/wemo/cache/data/DevicesArray;->addOrUpdateDeviceInformation(Lcom/belkin/wemo/cache/data/DeviceInformation;)V

    .line 245
    iget-object v7, p0, Lcom/belkin/wemo/cache/network/LEDOperations;->mCacheManager:Lcom/belkin/wemo/cache/CacheManager;

    invoke-virtual {v7, v2, v11, v11, v12}, Lcom/belkin/wemo/cache/CacheManager;->updateDB(Lcom/belkin/wemo/cache/data/DeviceInformation;ZZZ)V

    .line 248
    .end local v2    # "editedDevice":Lcom/belkin/wemo/cache/data/DeviceInformation;
    .end local v4    # "i":I
    :cond_2
    iget-object v7, p0, Lcom/belkin/wemo/cache/network/LEDOperations;->mDeviceListManager:Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    const-string v8, "set_state"

    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v9

    invoke-static {v9}, Ljava/lang/Boolean;->toString(Z)Ljava/lang/String;

    move-result-object v9

    iget-object v10, p0, Lcom/belkin/wemo/cache/network/LEDOperations;->bridgeUDN:Ljava/lang/String;

    invoke-virtual {v7, v8, v9, v10}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->sendNotification(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 264
    :cond_3
    :goto_2
    return-void

    .line 249
    :cond_4
    iget-object v7, p0, Lcom/belkin/wemo/cache/network/LEDOperations;->operation:Ljava/lang/String;

    const-string v8, "RemoveGroup"

    invoke-virtual {v7, v8}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_3

    .line 250
    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v7

    if-eqz v7, :cond_5

    .line 252
    iget-object v7, p0, Lcom/belkin/wemo/cache/network/LEDOperations;->mCacheManager:Lcom/belkin/wemo/cache/CacheManager;

    iget-object v8, p0, Lcom/belkin/wemo/cache/network/LEDOperations;->mGroupId:Ljava/lang/String;

    invoke-virtual {v7, v8}, Lcom/belkin/wemo/cache/CacheManager;->getDevicesForGroup(Ljava/lang/String;)Ljava/util/ArrayList;

    move-result-object v3

    .line 253
    .local v3, "groupedLEDList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/belkin/wemo/cache/data/DeviceInformation;>;"
    iget-object v7, p0, Lcom/belkin/wemo/cache/network/LEDOperations;->tag:Ljava/lang/String;

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "removing devices:"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    move-result v9

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-static {v7, v8}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 254
    invoke-virtual {v3}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v5

    .local v5, "i$":Ljava/util/Iterator;
    :goto_3
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v7

    if-eqz v7, :cond_5

    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lcom/belkin/wemo/cache/data/DeviceInformation;

    .line 255
    .restart local v6    # "ledDevice":Lcom/belkin/wemo/cache/data/DeviceInformation;
    const-string v7, ""

    invoke-virtual {v6, v7}, Lcom/belkin/wemo/cache/data/DeviceInformation;->setGroupID(Ljava/lang/String;)V

    .line 256
    const-string v7, ""

    invoke-virtual {v6, v7}, Lcom/belkin/wemo/cache/data/DeviceInformation;->setGroupName(Ljava/lang/String;)V

    .line 257
    iget-object v7, p0, Lcom/belkin/wemo/cache/network/LEDOperations;->mDevicesArray:Lcom/belkin/wemo/cache/data/DevicesArray;

    invoke-virtual {v7, v6}, Lcom/belkin/wemo/cache/data/DevicesArray;->addOrUpdateDeviceInformation(Lcom/belkin/wemo/cache/data/DeviceInformation;)V

    .line 258
    iget-object v7, p0, Lcom/belkin/wemo/cache/network/LEDOperations;->mCacheManager:Lcom/belkin/wemo/cache/CacheManager;

    invoke-virtual {v7, v6, v11, v11, v12}, Lcom/belkin/wemo/cache/CacheManager;->updateDB(Lcom/belkin/wemo/cache/data/DeviceInformation;ZZZ)V

    .line 259
    iget-object v7, p0, Lcom/belkin/wemo/cache/network/LEDOperations;->tag:Ljava/lang/String;

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "updated cache and db for :"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v6}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getUDN()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-static {v7, v8}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_3

    .line 262
    .end local v3    # "groupedLEDList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/belkin/wemo/cache/data/DeviceInformation;>;"
    .end local v5    # "i$":Ljava/util/Iterator;
    .end local v6    # "ledDevice":Lcom/belkin/wemo/cache/data/DeviceInformation;
    :cond_5
    iget-object v7, p0, Lcom/belkin/wemo/cache/network/LEDOperations;->mDeviceListManager:Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    const-string v8, "set_state"

    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v9

    invoke-static {v9}, Ljava/lang/Boolean;->toString(Z)Ljava/lang/String;

    move-result-object v9

    iget-object v10, p0, Lcom/belkin/wemo/cache/network/LEDOperations;->bridgeUDN:Ljava/lang/String;

    invoke-virtual {v7, v8, v9, v10}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->sendNotification(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    goto/16 :goto_2
.end method

.method private setArgument(Lorg/cybergarage/upnp/Action;[Ljava/lang/String;[Ljava/lang/String;)V
    .locals 4
    .param p1, "action"    # Lorg/cybergarage/upnp/Action;
    .param p2, "keys"    # [Ljava/lang/String;
    .param p3, "values"    # [Ljava/lang/String;

    .prologue
    .line 346
    iget-object v1, p0, Lcom/belkin/wemo/cache/network/LEDOperations;->tag:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "in setArguments::"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    array-length v3, p2

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "::values len:"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    array-length v3, p3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 347
    if-eqz p1, :cond_0

    if-eqz p2, :cond_0

    if-eqz p3, :cond_0

    .line 348
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    array-length v1, p2

    if-ge v0, v1, :cond_0

    .line 349
    iget-object v1, p0, Lcom/belkin/wemo/cache/network/LEDOperations;->tag:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "setArguments key:"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    aget-object v3, p2, v0

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "::values:"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    aget-object v3, p3, v0

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 350
    aget-object v1, p2, v0

    aget-object v2, p3, v0

    invoke-virtual {p1, v1, v2}, Lorg/cybergarage/upnp/Action;->setArgumentValue(Ljava/lang/String;Ljava/lang/String;)V

    .line 348
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 353
    .end local v0    # "i":I
    :cond_0
    return-void
.end method

.method private updateCapabilities()V
    .locals 10

    .prologue
    .line 356
    new-instance v7, Ljava/lang/StringBuilder;

    const-string v8, ""

    invoke-direct {v7, v8}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iput-object v7, p0, Lcom/belkin/wemo/cache/network/LEDOperations;->capabilityIDs:Ljava/lang/StringBuilder;

    .line 357
    new-instance v7, Ljava/lang/StringBuilder;

    const-string v8, ""

    invoke-direct {v7, v8}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iput-object v7, p0, Lcom/belkin/wemo/cache/network/LEDOperations;->capabilityValues:Ljava/lang/StringBuilder;

    .line 358
    sget-object v4, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->capabalityProfileList:Ljava/util/LinkedHashMap;

    .line 360
    .local v4, "entrySet":Ljava/util/LinkedHashMap;, "Ljava/util/LinkedHashMap<Ljava/lang/String;Ljava/lang/String;>;"
    :try_start_0
    new-instance v0, Ljava/util/ArrayList;

    const/16 v7, 0xb

    new-array v7, v7, [Ljava/lang/String;

    const/4 v8, 0x0

    const-string v9, "10008"

    aput-object v9, v7, v8

    const/4 v8, 0x1

    const-string v9, "10006"

    aput-object v9, v7, v8

    const/4 v8, 0x2

    const-string v9, "10300"

    aput-object v9, v7, v8

    const/4 v8, 0x3

    const-string v9, "30008"

    aput-object v9, v7, v8

    const/4 v8, 0x4

    const-string v9, "30009"

    aput-object v9, v7, v8

    const/4 v8, 0x5

    const-string v9, "3000A"

    aput-object v9, v7, v8

    const/4 v8, 0x6

    const-string v9, "30301"

    aput-object v9, v7, v8

    const/4 v8, 0x7

    const-string v9, "10500"

    aput-object v9, v7, v8

    const/16 v8, 0x8

    const-string v9, "20500"

    aput-object v9, v7, v8

    const/16 v8, 0x9

    const-string v9, "30501"

    aput-object v9, v7, v8

    const/16 v8, 0xa

    const-string v9, "20502"

    aput-object v9, v7, v8

    invoke-static {v7}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v7

    invoke-direct {v0, v7}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 361
    .local v0, "capabilityIDOrder":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v5

    .local v5, "i$":Ljava/util/Iterator;
    :cond_0
    :goto_0
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v7

    if-eqz v7, :cond_2

    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    .line 362
    .local v1, "capabilityId":Ljava/lang/String;
    invoke-virtual {v4, v1}, Ljava/util/LinkedHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    .line 363
    .local v2, "capabilityName":Ljava/lang/String;
    const-string v6, ""

    .line 364
    .local v6, "value":Ljava/lang/String;
    iget-object v7, p0, Lcom/belkin/wemo/cache/network/LEDOperations;->deviceCapabilities:Lorg/json/JSONObject;

    invoke-virtual {v7, v2}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_0

    .line 365
    iget-object v7, p0, Lcom/belkin/wemo/cache/network/LEDOperations;->capabilityIDs:Ljava/lang/StringBuilder;

    invoke-virtual {v7, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, ","

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    iput-object v7, p0, Lcom/belkin/wemo/cache/network/LEDOperations;->capabilityIDs:Ljava/lang/StringBuilder;

    .line 366
    iget-object v7, p0, Lcom/belkin/wemo/cache/network/LEDOperations;->deviceCapabilities:Lorg/json/JSONObject;

    invoke-virtual {v7, v2}, Lorg/json/JSONObject;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v6

    .end local v6    # "value":Ljava/lang/String;
    check-cast v6, Ljava/lang/String;

    .line 367
    .restart local v6    # "value":Ljava/lang/String;
    iget-object v7, p0, Lcom/belkin/wemo/cache/network/LEDOperations;->capabilityValues:Ljava/lang/StringBuilder;

    invoke-virtual {v7, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, ","

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    iput-object v7, p0, Lcom/belkin/wemo/cache/network/LEDOperations;->capabilityValues:Ljava/lang/StringBuilder;
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 378
    .end local v0    # "capabilityIDOrder":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    .end local v1    # "capabilityId":Ljava/lang/String;
    .end local v2    # "capabilityName":Ljava/lang/String;
    .end local v5    # "i$":Ljava/util/Iterator;
    .end local v6    # "value":Ljava/lang/String;
    :catch_0
    move-exception v3

    .line 380
    .local v3, "e":Lorg/json/JSONException;
    invoke-virtual {v3}, Lorg/json/JSONException;->printStackTrace()V

    .line 383
    .end local v3    # "e":Lorg/json/JSONException;
    :cond_1
    :goto_1
    return-void

    .line 371
    .restart local v0    # "capabilityIDOrder":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    .restart local v5    # "i$":Ljava/util/Iterator;
    :cond_2
    :try_start_1
    iget-object v7, p0, Lcom/belkin/wemo/cache/network/LEDOperations;->capabilityIDs:Ljava/lang/StringBuilder;

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->length()I

    move-result v7

    if-lez v7, :cond_3

    .line 372
    iget-object v7, p0, Lcom/belkin/wemo/cache/network/LEDOperations;->capabilityIDs:Ljava/lang/StringBuilder;

    iget-object v8, p0, Lcom/belkin/wemo/cache/network/LEDOperations;->capabilityIDs:Ljava/lang/StringBuilder;

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->length()I

    move-result v8

    add-int/lit8 v8, v8, -0x1

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->deleteCharAt(I)Ljava/lang/StringBuilder;

    .line 374
    :cond_3
    iget-object v7, p0, Lcom/belkin/wemo/cache/network/LEDOperations;->capabilityValues:Ljava/lang/StringBuilder;

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->length()I

    move-result v7

    if-lez v7, :cond_1

    .line 375
    iget-object v7, p0, Lcom/belkin/wemo/cache/network/LEDOperations;->capabilityValues:Ljava/lang/StringBuilder;

    iget-object v8, p0, Lcom/belkin/wemo/cache/network/LEDOperations;->capabilityValues:Ljava/lang/StringBuilder;

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->length()I

    move-result v8

    add-int/lit8 v8, v8, -0x1

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->deleteCharAt(I)Ljava/lang/StringBuilder;
    :try_end_1
    .catch Lorg/json/JSONException; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_1
.end method


# virtual methods
.method public run()V
    .locals 24

    .prologue
    .line 76
    sget-object v3, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->devListManager:Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    move-object/from16 v0, p0

    iput-object v3, v0, Lcom/belkin/wemo/cache/network/LEDOperations;->mDeviceListManager:Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    .line 77
    sget-object v3, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->context:Landroid/content/Context;

    invoke-static {v3}, Lcom/belkin/wemo/cache/CacheManager;->getInstance(Landroid/content/Context;)Lcom/belkin/wemo/cache/CacheManager;

    move-result-object v3

    move-object/from16 v0, p0

    iput-object v3, v0, Lcom/belkin/wemo/cache/network/LEDOperations;->mCacheManager:Lcom/belkin/wemo/cache/CacheManager;

    .line 79
    const/4 v3, 0x1

    invoke-static {v3}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v20

    .line 80
    .local v20, "result":Ljava/lang/Boolean;
    invoke-static {}, Lcom/belkin/wemo/cache/data/DevicesArray;->getInstance()Lcom/belkin/wemo/cache/data/DevicesArray;

    move-result-object v3

    move-object/from16 v0, p0

    iput-object v3, v0, Lcom/belkin/wemo/cache/network/LEDOperations;->mDevicesArray:Lcom/belkin/wemo/cache/data/DevicesArray;

    .line 81
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/belkin/wemo/cache/network/LEDOperations;->mDevicesArray:Lcom/belkin/wemo/cache/data/DevicesArray;

    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/belkin/wemo/cache/network/LEDOperations;->bridgeUDN:Ljava/lang/String;

    invoke-virtual {v3, v4}, Lcom/belkin/wemo/cache/data/DevicesArray;->getDeviceInformation(Ljava/lang/String;)Lcom/belkin/wemo/cache/data/DeviceInformation;

    move-result-object v3

    move-object/from16 v0, p0

    iput-object v3, v0, Lcom/belkin/wemo/cache/network/LEDOperations;->mDeviceInfo:Lcom/belkin/wemo/cache/data/DeviceInformation;

    .line 82
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/belkin/wemo/cache/network/LEDOperations;->mDeviceInfo:Lcom/belkin/wemo/cache/data/DeviceInformation;

    if-eqz v3, :cond_4

    .line 83
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/belkin/wemo/cache/network/LEDOperations;->mDeviceInfo:Lcom/belkin/wemo/cache/data/DeviceInformation;

    invoke-virtual {v3}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getDevice()Lorg/cybergarage/upnp/Device;

    move-result-object v3

    move-object/from16 v0, p0

    iput-object v3, v0, Lcom/belkin/wemo/cache/network/LEDOperations;->device:Lorg/cybergarage/upnp/Device;

    .line 84
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/belkin/wemo/cache/network/LEDOperations;->device:Lorg/cybergarage/upnp/Device;

    if-nez v3, :cond_0

    .line 85
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/belkin/wemo/cache/network/LEDOperations;->tag:Ljava/lang/String;

    const-string v4, "device is null"

    invoke-static {v3, v4}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 86
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/belkin/wemo/cache/network/LEDOperations;->mDeviceListManager:Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    invoke-virtual {v3}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->getUpnpControl()Lorg/cybergarage/upnp/ControlPoint;

    move-result-object v3

    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/belkin/wemo/cache/network/LEDOperations;->bridgeUDN:Ljava/lang/String;

    invoke-virtual {v3, v4}, Lorg/cybergarage/upnp/ControlPoint;->getDevice(Ljava/lang/String;)Lorg/cybergarage/upnp/Device;

    move-result-object v3

    move-object/from16 v0, p0

    iput-object v3, v0, Lcom/belkin/wemo/cache/network/LEDOperations;->device:Lorg/cybergarage/upnp/Device;

    .line 93
    :cond_0
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/belkin/wemo/cache/network/LEDOperations;->operation:Ljava/lang/String;

    const-string v4, "CreateGroup"

    invoke-virtual {v3, v4}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_9

    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/belkin/wemo/cache/network/LEDOperations;->groupProperties:Lorg/json/JSONObject;

    if-eqz v3, :cond_9

    .line 95
    :try_start_0
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/belkin/wemo/cache/network/LEDOperations;->groupProperties:Lorg/json/JSONObject;

    const-string v4, "groupName"

    invoke-virtual {v3, v4}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    move-object/from16 v0, p0

    iput-object v3, v0, Lcom/belkin/wemo/cache/network/LEDOperations;->groupName:Ljava/lang/String;

    .line 96
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/belkin/wemo/cache/network/LEDOperations;->groupProperties:Lorg/json/JSONObject;

    const-string v4, "groupID"

    invoke-virtual {v3, v4}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    move-object/from16 v0, p0

    iput-object v3, v0, Lcom/belkin/wemo/cache/network/LEDOperations;->mGroupId:Ljava/lang/String;

    .line 97
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/belkin/wemo/cache/network/LEDOperations;->groupProperties:Lorg/json/JSONObject;

    const-string v4, "groupIcon"

    invoke-virtual {v3, v4}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    move-object/from16 v0, p0

    iput-object v3, v0, Lcom/belkin/wemo/cache/network/LEDOperations;->groupIcon:Ljava/lang/String;

    .line 98
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/belkin/wemo/cache/network/LEDOperations;->groupProperties:Lorg/json/JSONObject;

    const-string v4, "deviceCapabilities"

    invoke-virtual {v3, v4}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v3

    move-object/from16 v0, p0

    iput-object v3, v0, Lcom/belkin/wemo/cache/network/LEDOperations;->deviceCapabilities:Lorg/json/JSONObject;

    .line 100
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/belkin/wemo/cache/network/LEDOperations;->groupProperties:Lorg/json/JSONObject;

    const-string v4, "deviceID"

    invoke-virtual {v3, v4}, Lorg/json/JSONObject;->getJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v3

    move-object/from16 v0, p0

    iput-object v3, v0, Lcom/belkin/wemo/cache/network/LEDOperations;->deviceIDs:Lorg/json/JSONArray;

    .line 102
    move-object/from16 v0, p0

    iget-boolean v3, v0, Lcom/belkin/wemo/cache/network/LEDOperations;->isNewGroup:Z

    if-nez v3, :cond_3

    .line 104
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/belkin/wemo/cache/network/LEDOperations;->mCacheManager:Lcom/belkin/wemo/cache/CacheManager;

    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/belkin/wemo/cache/network/LEDOperations;->mGroupId:Ljava/lang/String;

    invoke-virtual {v3, v4}, Lcom/belkin/wemo/cache/CacheManager;->getDevicesForGroup(Ljava/lang/String;)Ljava/util/ArrayList;

    move-result-object v19

    .line 106
    .local v19, "list":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/belkin/wemo/cache/data/DeviceInformation;>;"
    if-eqz v19, :cond_3

    invoke-virtual/range {v19 .. v19}, Ljava/util/ArrayList;->size()I

    move-result v3

    if-lez v3, :cond_3

    .line 108
    invoke-virtual/range {v19 .. v19}, Ljava/util/ArrayList;->size()I

    move-result v3

    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/belkin/wemo/cache/network/LEDOperations;->deviceIDs:Lorg/json/JSONArray;

    invoke-virtual {v4}, Lorg/json/JSONArray;->length()I

    move-result v4

    if-le v3, v4, :cond_3

    .line 109
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/belkin/wemo/cache/network/LEDOperations;->tag:Ljava/lang/String;

    const-string v4, "removing device from existing group"

    invoke-static {v3, v4}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 111
    invoke-virtual/range {v19 .. v19}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v17

    .local v17, "i$":Ljava/util/Iterator;
    :cond_1
    invoke-interface/range {v17 .. v17}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_3

    invoke-interface/range {v17 .. v17}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v11

    check-cast v11, Lcom/belkin/wemo/cache/data/DeviceInformation;

    .line 112
    .local v11, "dev":Lcom/belkin/wemo/cache/data/DeviceInformation;
    const/4 v15, 0x0

    .line 113
    .local v15, "found":Z
    const/16 v16, 0x0

    .local v16, "i":I
    :goto_0
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/belkin/wemo/cache/network/LEDOperations;->deviceIDs:Lorg/json/JSONArray;

    invoke-virtual {v3}, Lorg/json/JSONArray;->length()I

    move-result v3

    move/from16 v0, v16

    if-ge v0, v3, :cond_2

    .line 114
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/belkin/wemo/cache/network/LEDOperations;->deviceIDs:Lorg/json/JSONArray;

    move/from16 v0, v16

    invoke-virtual {v3, v0}, Lorg/json/JSONArray;->getString(I)Ljava/lang/String;

    move-result-object v18

    .line 115
    .local v18, "id":Ljava/lang/String;
    invoke-virtual {v11}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getUDN()Ljava/lang/String;

    move-result-object v3

    move-object/from16 v0, v18

    invoke-virtual {v0, v3}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_5

    .line 116
    const/4 v15, 0x1

    .line 120
    .end local v18    # "id":Ljava/lang/String;
    :cond_2
    if-nez v15, :cond_1

    .line 121
    invoke-virtual {v11}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getUDN()Ljava/lang/String;

    move-result-object v3

    move-object/from16 v0, p0

    iput-object v3, v0, Lcom/belkin/wemo/cache/network/LEDOperations;->removedDeviceID:Ljava/lang/String;

    .line 122
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/belkin/wemo/cache/network/LEDOperations;->tag:Ljava/lang/String;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "removedDeviceID:"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/belkin/wemo/cache/network/LEDOperations;->removedDeviceID:Ljava/lang/String;

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 135
    .end local v11    # "dev":Lcom/belkin/wemo/cache/data/DeviceInformation;
    .end local v15    # "found":Z
    .end local v16    # "i":I
    .end local v17    # "i$":Ljava/util/Iterator;
    .end local v19    # "list":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/belkin/wemo/cache/data/DeviceInformation;>;"
    :cond_3
    :goto_1
    invoke-direct/range {p0 .. p0}, Lcom/belkin/wemo/cache/network/LEDOperations;->updateCapabilities()V

    .line 137
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/belkin/wemo/cache/network/LEDOperations;->device:Lorg/cybergarage/upnp/Device;

    if-eqz v3, :cond_8

    .line 140
    :try_start_1
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/belkin/wemo/cache/network/LEDOperations;->device:Lorg/cybergarage/upnp/Device;

    const-string v4, "CreateGroup"

    invoke-virtual {v3, v4}, Lorg/cybergarage/upnp/Device;->getAction(Ljava/lang/String;)Lorg/cybergarage/upnp/Action;

    move-result-object v9

    .line 141
    .local v9, "action":Lorg/cybergarage/upnp/Action;
    if-nez v9, :cond_6

    .line 142
    const/4 v3, 0x0

    invoke-static {v3}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v20

    .line 143
    move-object/from16 v0, p0

    move-object/from16 v1, v20

    invoke-direct {v0, v1}, Lcom/belkin/wemo/cache/network/LEDOperations;->processResult(Ljava/lang/Boolean;)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    .line 214
    .end local v9    # "action":Lorg/cybergarage/upnp/Action;
    :goto_2
    return-void

    .line 89
    :cond_4
    const/4 v3, 0x0

    invoke-static {v3}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v20

    .line 90
    move-object/from16 v0, p0

    move-object/from16 v1, v20

    invoke-direct {v0, v1}, Lcom/belkin/wemo/cache/network/LEDOperations;->processResult(Ljava/lang/Boolean;)V

    goto :goto_2

    .line 113
    .restart local v11    # "dev":Lcom/belkin/wemo/cache/data/DeviceInformation;
    .restart local v15    # "found":Z
    .restart local v16    # "i":I
    .restart local v17    # "i$":Ljava/util/Iterator;
    .restart local v18    # "id":Ljava/lang/String;
    .restart local v19    # "list":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/belkin/wemo/cache/data/DeviceInformation;>;"
    :cond_5
    add-int/lit8 v16, v16, 0x1

    goto :goto_0

    .line 131
    .end local v11    # "dev":Lcom/belkin/wemo/cache/data/DeviceInformation;
    .end local v15    # "found":Z
    .end local v16    # "i":I
    .end local v17    # "i$":Ljava/util/Iterator;
    .end local v18    # "id":Ljava/lang/String;
    .end local v19    # "list":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/belkin/wemo/cache/data/DeviceInformation;>;"
    :catch_0
    move-exception v13

    .line 133
    .local v13, "e1":Lorg/json/JSONException;
    invoke-virtual {v13}, Lorg/json/JSONException;->printStackTrace()V

    goto :goto_1

    .line 146
    .end local v13    # "e1":Lorg/json/JSONException;
    .restart local v9    # "action":Lorg/cybergarage/upnp/Action;
    :cond_6
    :try_start_2
    sget-object v21, Lcom/belkin/wemo/cache/devicelist/UpnpConstants;->CREATE_GROUP_ARGS:[Ljava/lang/String;

    const/4 v3, 0x1

    new-array v0, v3, [Ljava/lang/String;

    move-object/from16 v22, v0

    const/16 v23, 0x0

    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/belkin/wemo/cache/network/LEDOperations;->deviceIDs:Lorg/json/JSONArray;

    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/belkin/wemo/cache/network/LEDOperations;->capabilityIDs:Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/belkin/wemo/cache/network/LEDOperations;->capabilityValues:Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    move-object/from16 v0, p0

    iget-object v7, v0, Lcom/belkin/wemo/cache/network/LEDOperations;->groupName:Ljava/lang/String;

    move-object/from16 v0, p0

    iget-object v8, v0, Lcom/belkin/wemo/cache/network/LEDOperations;->mGroupId:Ljava/lang/String;

    move-object/from16 v3, p0

    invoke-direct/range {v3 .. v8}, Lcom/belkin/wemo/cache/network/LEDOperations;->generateActionXMLInput(Lorg/json/JSONArray;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    aput-object v3, v22, v23

    move-object/from16 v0, p0

    move-object/from16 v1, v21

    move-object/from16 v2, v22

    invoke-direct {v0, v9, v1, v2}, Lcom/belkin/wemo/cache/network/LEDOperations;->setArgument(Lorg/cybergarage/upnp/Action;[Ljava/lang/String;[Ljava/lang/String;)V

    .line 147
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/belkin/wemo/cache/network/LEDOperations;->tag:Ljava/lang/String;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Action:"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_1

    .line 148
    const/4 v10, 0x0

    .line 150
    .local v10, "actionResult":Ljava/lang/String;
    :try_start_3
    invoke-virtual {v9}, Lorg/cybergarage/upnp/Action;->postControlAction()Ljava/lang/String;

    move-result-object v10

    .line 151
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/belkin/wemo/cache/network/LEDOperations;->tag:Ljava/lang/String;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "action response)::"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_2

    .line 157
    if-eqz v10, :cond_7

    :try_start_4
    const-string v3, "0"

    invoke-virtual {v10, v3}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v3

    if-eqz v3, :cond_c

    .line 158
    :cond_7
    const/4 v3, 0x0

    invoke-static {v3}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v20

    .line 159
    move-object/from16 v0, p0

    move-object/from16 v1, v20

    invoke-direct {v0, v1}, Lcom/belkin/wemo/cache/network/LEDOperations;->processResult(Ljava/lang/Boolean;)V
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_1

    goto/16 :goto_2

    .line 162
    .end local v9    # "action":Lorg/cybergarage/upnp/Action;
    .end local v10    # "actionResult":Ljava/lang/String;
    :catch_1
    move-exception v14

    .line 163
    .local v14, "ex":Ljava/lang/Exception;
    invoke-virtual {v14}, Ljava/lang/Exception;->printStackTrace()V

    .line 164
    const/4 v3, 0x0

    invoke-static {v3}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v20

    .line 165
    move-object/from16 v0, p0

    move-object/from16 v1, v20

    invoke-direct {v0, v1}, Lcom/belkin/wemo/cache/network/LEDOperations;->processResult(Ljava/lang/Boolean;)V

    goto/16 :goto_2

    .line 152
    .end local v14    # "ex":Ljava/lang/Exception;
    .restart local v9    # "action":Lorg/cybergarage/upnp/Action;
    .restart local v10    # "actionResult":Ljava/lang/String;
    :catch_2
    move-exception v12

    .line 153
    .local v12, "e":Ljava/lang/Exception;
    const/4 v3, 0x0

    :try_start_5
    invoke-static {v3}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v20

    .line 154
    move-object/from16 v0, p0

    move-object/from16 v1, v20

    invoke-direct {v0, v1}, Lcom/belkin/wemo/cache/network/LEDOperations;->processResult(Ljava/lang/Boolean;)V
    :try_end_5
    .catch Ljava/lang/Exception; {:try_start_5 .. :try_end_5} :catch_1

    goto/16 :goto_2

    .line 170
    .end local v9    # "action":Lorg/cybergarage/upnp/Action;
    .end local v10    # "actionResult":Ljava/lang/String;
    .end local v12    # "e":Ljava/lang/Exception;
    :cond_8
    const/4 v3, 0x0

    invoke-static {v3}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v20

    .line 171
    move-object/from16 v0, p0

    move-object/from16 v1, v20

    invoke-direct {v0, v1}, Lcom/belkin/wemo/cache/network/LEDOperations;->processResult(Ljava/lang/Boolean;)V

    goto/16 :goto_2

    .line 175
    :cond_9
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/belkin/wemo/cache/network/LEDOperations;->operation:Ljava/lang/String;

    const-string v4, "RemoveGroup"

    invoke-virtual {v3, v4}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_c

    .line 177
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/belkin/wemo/cache/network/LEDOperations;->device:Lorg/cybergarage/upnp/Device;

    if-eqz v3, :cond_d

    .line 180
    :try_start_6
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/belkin/wemo/cache/network/LEDOperations;->device:Lorg/cybergarage/upnp/Device;

    const-string v4, "DeleteGroup"

    invoke-virtual {v3, v4}, Lorg/cybergarage/upnp/Device;->getAction(Ljava/lang/String;)Lorg/cybergarage/upnp/Action;

    move-result-object v9

    .line 181
    .restart local v9    # "action":Lorg/cybergarage/upnp/Action;
    if-nez v9, :cond_a

    .line 182
    const/4 v3, 0x0

    invoke-static {v3}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v20

    .line 183
    move-object/from16 v0, p0

    move-object/from16 v1, v20

    invoke-direct {v0, v1}, Lcom/belkin/wemo/cache/network/LEDOperations;->processResult(Ljava/lang/Boolean;)V
    :try_end_6
    .catch Ljava/lang/Exception; {:try_start_6 .. :try_end_6} :catch_3

    goto/16 :goto_2

    .line 200
    .end local v9    # "action":Lorg/cybergarage/upnp/Action;
    :catch_3
    move-exception v14

    .line 201
    .restart local v14    # "ex":Ljava/lang/Exception;
    invoke-virtual {v14}, Ljava/lang/Exception;->printStackTrace()V

    .line 202
    const/4 v3, 0x0

    invoke-static {v3}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v20

    .line 203
    move-object/from16 v0, p0

    move-object/from16 v1, v20

    invoke-direct {v0, v1}, Lcom/belkin/wemo/cache/network/LEDOperations;->processResult(Ljava/lang/Boolean;)V

    goto/16 :goto_2

    .line 186
    .end local v14    # "ex":Ljava/lang/Exception;
    .restart local v9    # "action":Lorg/cybergarage/upnp/Action;
    :cond_a
    :try_start_7
    sget-object v3, Lcom/belkin/wemo/cache/devicelist/UpnpConstants;->ARGS_GROUPID:[Ljava/lang/String;

    const/4 v4, 0x1

    new-array v4, v4, [Ljava/lang/String;

    const/4 v5, 0x0

    move-object/from16 v0, p0

    iget-object v6, v0, Lcom/belkin/wemo/cache/network/LEDOperations;->mGroupId:Ljava/lang/String;

    aput-object v6, v4, v5

    move-object/from16 v0, p0

    invoke-direct {v0, v9, v3, v4}, Lcom/belkin/wemo/cache/network/LEDOperations;->setArgument(Lorg/cybergarage/upnp/Action;[Ljava/lang/String;[Ljava/lang/String;)V

    .line 187
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/belkin/wemo/cache/network/LEDOperations;->tag:Ljava/lang/String;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Action:"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_7
    .catch Ljava/lang/Exception; {:try_start_7 .. :try_end_7} :catch_3

    .line 188
    const/4 v10, 0x0

    .line 190
    .restart local v10    # "actionResult":Ljava/lang/String;
    :try_start_8
    invoke-virtual {v9}, Lorg/cybergarage/upnp/Action;->postControlAction()Ljava/lang/String;

    move-result-object v10

    .line 191
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/belkin/wemo/cache/network/LEDOperations;->tag:Ljava/lang/String;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "action response::"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_8
    .catch Ljava/lang/Exception; {:try_start_8 .. :try_end_8} :catch_4

    .line 197
    if-eqz v10, :cond_b

    :try_start_9
    const-string v3, "0"

    invoke-virtual {v10, v3}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v3

    if-eqz v3, :cond_c

    .line 198
    :cond_b
    const/4 v3, 0x0

    invoke-static {v3}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;
    :try_end_9
    .catch Ljava/lang/Exception; {:try_start_9 .. :try_end_9} :catch_3

    move-result-object v20

    .line 213
    .end local v9    # "action":Lorg/cybergarage/upnp/Action;
    .end local v10    # "actionResult":Ljava/lang/String;
    :cond_c
    move-object/from16 v0, p0

    move-object/from16 v1, v20

    invoke-direct {v0, v1}, Lcom/belkin/wemo/cache/network/LEDOperations;->processResult(Ljava/lang/Boolean;)V

    goto/16 :goto_2

    .line 192
    .restart local v9    # "action":Lorg/cybergarage/upnp/Action;
    .restart local v10    # "actionResult":Ljava/lang/String;
    :catch_4
    move-exception v12

    .line 193
    .restart local v12    # "e":Ljava/lang/Exception;
    const/4 v3, 0x0

    :try_start_a
    invoke-static {v3}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v20

    .line 194
    move-object/from16 v0, p0

    move-object/from16 v1, v20

    invoke-direct {v0, v1}, Lcom/belkin/wemo/cache/network/LEDOperations;->processResult(Ljava/lang/Boolean;)V
    :try_end_a
    .catch Ljava/lang/Exception; {:try_start_a .. :try_end_a} :catch_3

    goto/16 :goto_2

    .line 208
    .end local v9    # "action":Lorg/cybergarage/upnp/Action;
    .end local v10    # "actionResult":Ljava/lang/String;
    .end local v12    # "e":Ljava/lang/Exception;
    :cond_d
    const/4 v3, 0x0

    invoke-static {v3}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v20

    .line 209
    move-object/from16 v0, p0

    move-object/from16 v1, v20

    invoke-direct {v0, v1}, Lcom/belkin/wemo/cache/network/LEDOperations;->processResult(Ljava/lang/Boolean;)V

    goto/16 :goto_2
.end method
