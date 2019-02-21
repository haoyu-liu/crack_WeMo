.class public Lcom/belkin/wemo/cache/devicelist/runnable/SetZigbeeDeviceStateRunnable;
.super Lcom/belkin/wemo/runnable/WeMoRunnable;
.source "SetZigbeeDeviceStateRunnable.java"


# instance fields
.field private bridgeUDN:Ljava/lang/String;

.field private capabilityID:Ljava/lang/String;

.field private capabilityName:Ljava/lang/String;

.field private capabilityValue:Ljava/lang/String;

.field private context:Landroid/content/Context;

.field private devListManager:Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

.field private deviceId:Ljava/lang/String;

.field private isGroupAction:Ljava/lang/String;

.field private mDeviceInfo:Lcom/belkin/wemo/cache/data/DeviceInformation;

.field private tag:Ljava/lang/String;


# direct methods
.method public constructor <init>(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "capabilityID"    # Ljava/lang/String;
    .param p3, "capabilityName"    # Ljava/lang/String;
    .param p4, "capabilityValue"    # Ljava/lang/String;
    .param p5, "bridgeUDN"    # Ljava/lang/String;
    .param p6, "deviceId"    # Ljava/lang/String;
    .param p7, "isGroupAction"    # Ljava/lang/String;

    .prologue
    .line 45
    invoke-direct {p0}, Lcom/belkin/wemo/runnable/WeMoRunnable;-><init>()V

    .line 38
    const-string v0, "NO"

    iput-object v0, p0, Lcom/belkin/wemo/cache/devicelist/runnable/SetZigbeeDeviceStateRunnable;->isGroupAction:Ljava/lang/String;

    .line 39
    const-string v0, "SetZigbeeDeviceStateRunnable"

    iput-object v0, p0, Lcom/belkin/wemo/cache/devicelist/runnable/SetZigbeeDeviceStateRunnable;->tag:Ljava/lang/String;

    .line 40
    const-string v0, ""

    iput-object v0, p0, Lcom/belkin/wemo/cache/devicelist/runnable/SetZigbeeDeviceStateRunnable;->bridgeUDN:Ljava/lang/String;

    .line 46
    invoke-static {p1}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->getInstance(Landroid/content/Context;)Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    move-result-object v0

    iput-object v0, p0, Lcom/belkin/wemo/cache/devicelist/runnable/SetZigbeeDeviceStateRunnable;->devListManager:Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    .line 47
    iput-object p1, p0, Lcom/belkin/wemo/cache/devicelist/runnable/SetZigbeeDeviceStateRunnable;->context:Landroid/content/Context;

    .line 48
    iput-object p2, p0, Lcom/belkin/wemo/cache/devicelist/runnable/SetZigbeeDeviceStateRunnable;->capabilityID:Ljava/lang/String;

    .line 49
    iput-object p3, p0, Lcom/belkin/wemo/cache/devicelist/runnable/SetZigbeeDeviceStateRunnable;->capabilityName:Ljava/lang/String;

    .line 50
    iput-object p4, p0, Lcom/belkin/wemo/cache/devicelist/runnable/SetZigbeeDeviceStateRunnable;->capabilityValue:Ljava/lang/String;

    .line 51
    iput-object p5, p0, Lcom/belkin/wemo/cache/devicelist/runnable/SetZigbeeDeviceStateRunnable;->bridgeUDN:Ljava/lang/String;

    .line 52
    iput-object p6, p0, Lcom/belkin/wemo/cache/devicelist/runnable/SetZigbeeDeviceStateRunnable;->deviceId:Ljava/lang/String;

    .line 53
    iput-object p7, p0, Lcom/belkin/wemo/cache/devicelist/runnable/SetZigbeeDeviceStateRunnable;->isGroupAction:Ljava/lang/String;

    .line 54
    return-void
.end method

.method private domXml(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 23
    .param p1, "onORoff"    # Ljava/lang/String;
    .param p2, "deviceId"    # Ljava/lang/String;
    .param p3, "capabilityID"    # Ljava/lang/String;
    .param p4, "isGroupAction"    # Ljava/lang/String;

    .prologue
    .line 153
    const/16 v16, 0x0

    .line 155
    .local v16, "tempxml":Ljava/lang/String;
    :try_start_0
    invoke-static {}, Ljavax/xml/parsers/DocumentBuilderFactory;->newInstance()Ljavax/xml/parsers/DocumentBuilderFactory;

    move-result-object v10

    .line 156
    .local v10, "docFactory":Ljavax/xml/parsers/DocumentBuilderFactory;
    invoke-virtual {v10}, Ljavax/xml/parsers/DocumentBuilderFactory;->newDocumentBuilder()Ljavax/xml/parsers/DocumentBuilder;

    move-result-object v9

    .line 159
    .local v9, "docBuilder":Ljavax/xml/parsers/DocumentBuilder;
    invoke-virtual {v9}, Ljavax/xml/parsers/DocumentBuilder;->newDocument()Lorg/w3c/dom/Document;

    move-result-object v8

    .line 161
    .local v8, "doc":Lorg/w3c/dom/Document;
    const-string v20, "DeviceStatus"

    move-object/from16 v0, v20

    invoke-interface {v8, v0}, Lorg/w3c/dom/Document;->createElement(Ljava/lang/String;)Lorg/w3c/dom/Element;

    move-result-object v7

    .line 162
    .local v7, "deviceStatusTag":Lorg/w3c/dom/Element;
    invoke-interface {v8, v7}, Lorg/w3c/dom/Document;->appendChild(Lorg/w3c/dom/Node;)Lorg/w3c/dom/Node;

    .line 165
    const-string v20, ","

    move-object/from16 v0, p2

    move-object/from16 v1, v20

    invoke-virtual {v0, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v20

    if-eqz v20, :cond_0

    .line 166
    const-string v20, ","

    move-object/from16 v0, p2

    move-object/from16 v1, v20

    invoke-virtual {v0, v1}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v5

    .line 167
    .local v5, "devIdslist":[Ljava/lang/String;
    const/4 v13, 0x0

    .local v13, "i":I
    :goto_0
    array-length v0, v5

    move/from16 v20, v0

    move/from16 v0, v20

    if-ge v13, v0, :cond_1

    .line 169
    const-string v20, "IsGroupAction"

    move-object/from16 v0, v20

    invoke-interface {v8, v0}, Lorg/w3c/dom/Document;->createElement(Ljava/lang/String;)Lorg/w3c/dom/Element;

    move-result-object v12

    .line 170
    .local v12, "groupAvailableTag1":Lorg/w3c/dom/Element;
    move-object/from16 v0, p4

    invoke-interface {v8, v0}, Lorg/w3c/dom/Document;->createTextNode(Ljava/lang/String;)Lorg/w3c/dom/Text;

    move-result-object v20

    move-object/from16 v0, v20

    invoke-interface {v12, v0}, Lorg/w3c/dom/Element;->appendChild(Lorg/w3c/dom/Node;)Lorg/w3c/dom/Node;

    .line 171
    invoke-interface {v7, v12}, Lorg/w3c/dom/Element;->appendChild(Lorg/w3c/dom/Node;)Lorg/w3c/dom/Node;

    .line 174
    const-string v20, "DeviceID"

    move-object/from16 v0, v20

    invoke-interface {v8, v0}, Lorg/w3c/dom/Document;->createElement(Ljava/lang/String;)Lorg/w3c/dom/Element;

    move-result-object v6

    .line 175
    .local v6, "deviceIdTag":Lorg/w3c/dom/Element;
    aget-object v20, v5, v13

    move-object/from16 v0, v20

    invoke-interface {v8, v0}, Lorg/w3c/dom/Document;->createTextNode(Ljava/lang/String;)Lorg/w3c/dom/Text;

    move-result-object v20

    move-object/from16 v0, v20

    invoke-interface {v6, v0}, Lorg/w3c/dom/Element;->appendChild(Lorg/w3c/dom/Node;)Lorg/w3c/dom/Node;

    .line 176
    invoke-interface {v7, v6}, Lorg/w3c/dom/Element;->appendChild(Lorg/w3c/dom/Node;)Lorg/w3c/dom/Node;

    .line 177
    const-string v20, "available"

    move-object/from16 v0, v20

    invoke-interface {v8, v0}, Lorg/w3c/dom/Document;->createAttribute(Ljava/lang/String;)Lorg/w3c/dom/Attr;

    move-result-object v2

    .line 178
    .local v2, "attr":Lorg/w3c/dom/Attr;
    const-string v20, "YES"

    move-object/from16 v0, v20

    invoke-interface {v2, v0}, Lorg/w3c/dom/Attr;->setValue(Ljava/lang/String;)V

    .line 179
    invoke-interface {v6, v2}, Lorg/w3c/dom/Element;->setAttributeNode(Lorg/w3c/dom/Attr;)Lorg/w3c/dom/Attr;

    .line 182
    const-string v20, "CapabilityID"

    move-object/from16 v0, v20

    invoke-interface {v8, v0}, Lorg/w3c/dom/Document;->createElement(Ljava/lang/String;)Lorg/w3c/dom/Element;

    move-result-object v3

    .line 183
    .local v3, "capabilityIdTag":Lorg/w3c/dom/Element;
    move-object/from16 v0, p3

    invoke-interface {v8, v0}, Lorg/w3c/dom/Document;->createTextNode(Ljava/lang/String;)Lorg/w3c/dom/Text;

    move-result-object v20

    move-object/from16 v0, v20

    invoke-interface {v3, v0}, Lorg/w3c/dom/Element;->appendChild(Lorg/w3c/dom/Node;)Lorg/w3c/dom/Node;

    .line 184
    invoke-interface {v7, v3}, Lorg/w3c/dom/Element;->appendChild(Lorg/w3c/dom/Node;)Lorg/w3c/dom/Node;

    .line 187
    const-string v20, "CapabilityValue"

    move-object/from16 v0, v20

    invoke-interface {v8, v0}, Lorg/w3c/dom/Document;->createElement(Ljava/lang/String;)Lorg/w3c/dom/Element;

    move-result-object v4

    .line 188
    .local v4, "capabilityValueTag":Lorg/w3c/dom/Element;
    move-object/from16 v0, p1

    invoke-interface {v8, v0}, Lorg/w3c/dom/Document;->createTextNode(Ljava/lang/String;)Lorg/w3c/dom/Text;

    move-result-object v20

    move-object/from16 v0, v20

    invoke-interface {v4, v0}, Lorg/w3c/dom/Element;->appendChild(Lorg/w3c/dom/Node;)Lorg/w3c/dom/Node;

    .line 189
    invoke-interface {v7, v4}, Lorg/w3c/dom/Element;->appendChild(Lorg/w3c/dom/Node;)Lorg/w3c/dom/Node;

    .line 167
    add-int/lit8 v13, v13, 0x1

    goto :goto_0

    .line 194
    .end local v2    # "attr":Lorg/w3c/dom/Attr;
    .end local v3    # "capabilityIdTag":Lorg/w3c/dom/Element;
    .end local v4    # "capabilityValueTag":Lorg/w3c/dom/Element;
    .end local v5    # "devIdslist":[Ljava/lang/String;
    .end local v6    # "deviceIdTag":Lorg/w3c/dom/Element;
    .end local v12    # "groupAvailableTag1":Lorg/w3c/dom/Element;
    .end local v13    # "i":I
    :cond_0
    const-string v20, "IsGroupAction"

    move-object/from16 v0, v20

    invoke-interface {v8, v0}, Lorg/w3c/dom/Document;->createElement(Ljava/lang/String;)Lorg/w3c/dom/Element;

    move-result-object v11

    .line 195
    .local v11, "groupAvailableTag":Lorg/w3c/dom/Element;
    move-object/from16 v0, p4

    invoke-interface {v8, v0}, Lorg/w3c/dom/Document;->createTextNode(Ljava/lang/String;)Lorg/w3c/dom/Text;

    move-result-object v20

    move-object/from16 v0, v20

    invoke-interface {v11, v0}, Lorg/w3c/dom/Element;->appendChild(Lorg/w3c/dom/Node;)Lorg/w3c/dom/Node;

    .line 196
    invoke-interface {v7, v11}, Lorg/w3c/dom/Element;->appendChild(Lorg/w3c/dom/Node;)Lorg/w3c/dom/Node;

    .line 199
    const-string v20, "DeviceID"

    move-object/from16 v0, v20

    invoke-interface {v8, v0}, Lorg/w3c/dom/Document;->createElement(Ljava/lang/String;)Lorg/w3c/dom/Element;

    move-result-object v6

    .line 200
    .restart local v6    # "deviceIdTag":Lorg/w3c/dom/Element;
    move-object/from16 v0, p2

    invoke-interface {v8, v0}, Lorg/w3c/dom/Document;->createTextNode(Ljava/lang/String;)Lorg/w3c/dom/Text;

    move-result-object v20

    move-object/from16 v0, v20

    invoke-interface {v6, v0}, Lorg/w3c/dom/Element;->appendChild(Lorg/w3c/dom/Node;)Lorg/w3c/dom/Node;

    .line 201
    invoke-interface {v7, v6}, Lorg/w3c/dom/Element;->appendChild(Lorg/w3c/dom/Node;)Lorg/w3c/dom/Node;

    .line 202
    const-string v20, "available"

    move-object/from16 v0, v20

    invoke-interface {v8, v0}, Lorg/w3c/dom/Document;->createAttribute(Ljava/lang/String;)Lorg/w3c/dom/Attr;

    move-result-object v2

    .line 203
    .restart local v2    # "attr":Lorg/w3c/dom/Attr;
    const-string v20, "YES"

    move-object/from16 v0, v20

    invoke-interface {v2, v0}, Lorg/w3c/dom/Attr;->setValue(Ljava/lang/String;)V

    .line 204
    invoke-interface {v6, v2}, Lorg/w3c/dom/Element;->setAttributeNode(Lorg/w3c/dom/Attr;)Lorg/w3c/dom/Attr;

    .line 207
    const-string v20, "CapabilityID"

    move-object/from16 v0, v20

    invoke-interface {v8, v0}, Lorg/w3c/dom/Document;->createElement(Ljava/lang/String;)Lorg/w3c/dom/Element;

    move-result-object v3

    .line 208
    .restart local v3    # "capabilityIdTag":Lorg/w3c/dom/Element;
    move-object/from16 v0, p3

    invoke-interface {v8, v0}, Lorg/w3c/dom/Document;->createTextNode(Ljava/lang/String;)Lorg/w3c/dom/Text;

    move-result-object v20

    move-object/from16 v0, v20

    invoke-interface {v3, v0}, Lorg/w3c/dom/Element;->appendChild(Lorg/w3c/dom/Node;)Lorg/w3c/dom/Node;

    .line 209
    invoke-interface {v7, v3}, Lorg/w3c/dom/Element;->appendChild(Lorg/w3c/dom/Node;)Lorg/w3c/dom/Node;

    .line 212
    const-string v20, "CapabilityValue"

    move-object/from16 v0, v20

    invoke-interface {v8, v0}, Lorg/w3c/dom/Document;->createElement(Ljava/lang/String;)Lorg/w3c/dom/Element;

    move-result-object v4

    .line 213
    .restart local v4    # "capabilityValueTag":Lorg/w3c/dom/Element;
    move-object/from16 v0, p1

    invoke-interface {v8, v0}, Lorg/w3c/dom/Document;->createTextNode(Ljava/lang/String;)Lorg/w3c/dom/Text;

    move-result-object v20

    move-object/from16 v0, v20

    invoke-interface {v4, v0}, Lorg/w3c/dom/Element;->appendChild(Lorg/w3c/dom/Node;)Lorg/w3c/dom/Node;

    .line 214
    invoke-interface {v7, v4}, Lorg/w3c/dom/Element;->appendChild(Lorg/w3c/dom/Node;)Lorg/w3c/dom/Node;

    .line 218
    .end local v2    # "attr":Lorg/w3c/dom/Attr;
    .end local v3    # "capabilityIdTag":Lorg/w3c/dom/Element;
    .end local v4    # "capabilityValueTag":Lorg/w3c/dom/Element;
    .end local v6    # "deviceIdTag":Lorg/w3c/dom/Element;
    .end local v11    # "groupAvailableTag":Lorg/w3c/dom/Element;
    :cond_1
    invoke-static {}, Ljavax/xml/transform/TransformerFactory;->newInstance()Ljavax/xml/transform/TransformerFactory;

    move-result-object v20

    invoke-virtual/range {v20 .. v20}, Ljavax/xml/transform/TransformerFactory;->newTransformer()Ljavax/xml/transform/Transformer;

    move-result-object v18

    .line 219
    .local v18, "transformer":Ljavax/xml/transform/Transformer;
    new-instance v19, Ljava/io/StringWriter;

    invoke-direct/range {v19 .. v19}, Ljava/io/StringWriter;-><init>()V

    .line 220
    .local v19, "writer":Ljava/io/StringWriter;
    new-instance v15, Ljavax/xml/transform/stream/StreamResult;

    move-object/from16 v0, v19

    invoke-direct {v15, v0}, Ljavax/xml/transform/stream/StreamResult;-><init>(Ljava/io/Writer;)V

    .line 221
    .local v15, "result":Ljavax/xml/transform/stream/StreamResult;
    new-instance v20, Ljavax/xml/transform/dom/DOMSource;

    move-object/from16 v0, v20

    invoke-direct {v0, v8}, Ljavax/xml/transform/dom/DOMSource;-><init>(Lorg/w3c/dom/Node;)V

    move-object/from16 v0, v18

    move-object/from16 v1, v20

    invoke-virtual {v0, v1, v15}, Ljavax/xml/transform/Transformer;->transform(Ljavax/xml/transform/Source;Ljavax/xml/transform/Result;)V

    .line 224
    invoke-virtual/range {v19 .. v19}, Ljava/io/StringWriter;->toString()Ljava/lang/String;

    move-result-object v16

    .line 225
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/wemo/cache/devicelist/runnable/SetZigbeeDeviceStateRunnable;->TAG:Ljava/lang/String;

    move-object/from16 v20, v0

    new-instance v21, Ljava/lang/StringBuilder;

    invoke-direct/range {v21 .. v21}, Ljava/lang/StringBuilder;-><init>()V

    const-string v22, "File saved!"

    invoke-virtual/range {v21 .. v22}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v21

    move-object/from16 v0, v21

    move-object/from16 v1, v16

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v21

    invoke-virtual/range {v21 .. v21}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v21

    invoke-static/range {v20 .. v21}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_0
    .catch Ljavax/xml/parsers/ParserConfigurationException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljavax/xml/transform/TransformerException; {:try_start_0 .. :try_end_0} :catch_1

    .line 231
    .end local v7    # "deviceStatusTag":Lorg/w3c/dom/Element;
    .end local v8    # "doc":Lorg/w3c/dom/Document;
    .end local v9    # "docBuilder":Ljavax/xml/parsers/DocumentBuilder;
    .end local v10    # "docFactory":Ljavax/xml/parsers/DocumentBuilderFactory;
    .end local v15    # "result":Ljavax/xml/transform/stream/StreamResult;
    .end local v18    # "transformer":Ljavax/xml/transform/Transformer;
    .end local v19    # "writer":Ljava/io/StringWriter;
    :goto_1
    return-object v16

    .line 226
    :catch_0
    move-exception v14

    .line 227
    .local v14, "pce":Ljavax/xml/parsers/ParserConfigurationException;
    invoke-virtual {v14}, Ljavax/xml/parsers/ParserConfigurationException;->printStackTrace()V

    goto :goto_1

    .line 228
    .end local v14    # "pce":Ljavax/xml/parsers/ParserConfigurationException;
    :catch_1
    move-exception v17

    .line 229
    .local v17, "tfe":Ljavax/xml/transform/TransformerException;
    invoke-virtual/range {v17 .. v17}, Ljavax/xml/transform/TransformerException;->printStackTrace()V

    goto :goto_1
.end method

.method private processResult(Ljava/lang/Boolean;)V
    .locals 8
    .param p1, "result"    # Ljava/lang/Boolean;

    .prologue
    .line 120
    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v4

    if-eqz v4, :cond_1

    .line 121
    iget-object v4, p0, Lcom/belkin/wemo/cache/devicelist/runnable/SetZigbeeDeviceStateRunnable;->isGroupAction:Ljava/lang/String;

    invoke-static {v4}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v4

    if-nez v4, :cond_3

    iget-object v4, p0, Lcom/belkin/wemo/cache/devicelist/runnable/SetZigbeeDeviceStateRunnable;->isGroupAction:Ljava/lang/String;

    const-string v5, "YES"

    invoke-virtual {v4, v5}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_3

    .line 122
    iget-object v4, p0, Lcom/belkin/wemo/cache/devicelist/runnable/SetZigbeeDeviceStateRunnable;->context:Landroid/content/Context;

    invoke-static {v4}, Lcom/belkin/wemo/cache/CacheManager;->getInstance(Landroid/content/Context;)Lcom/belkin/wemo/cache/CacheManager;

    move-result-object v4

    iget-object v5, p0, Lcom/belkin/wemo/cache/devicelist/runnable/SetZigbeeDeviceStateRunnable;->deviceId:Ljava/lang/String;

    invoke-virtual {v4, v5}, Lcom/belkin/wemo/cache/CacheManager;->getDevicesForGroup(Ljava/lang/String;)Ljava/util/ArrayList;

    move-result-object v1

    .line 123
    .local v1, "groupedLEDList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/belkin/wemo/cache/data/DeviceInformation;>;"
    iget-object v4, p0, Lcom/belkin/wemo/cache/devicelist/runnable/SetZigbeeDeviceStateRunnable;->TAG:Ljava/lang/String;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "grouped devices:"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 125
    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v4

    if-lez v4, :cond_2

    .line 126
    invoke-virtual {v1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v2

    .local v2, "i$":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_0

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/belkin/wemo/cache/data/DeviceInformation;

    .line 127
    .local v3, "ledDevice":Lcom/belkin/wemo/cache/data/DeviceInformation;
    iget-object v4, p0, Lcom/belkin/wemo/cache/devicelist/runnable/SetZigbeeDeviceStateRunnable;->devListManager:Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    invoke-virtual {v3}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getUDN()Ljava/lang/String;

    move-result-object v5

    iget-object v6, p0, Lcom/belkin/wemo/cache/devicelist/runnable/SetZigbeeDeviceStateRunnable;->capabilityID:Ljava/lang/String;

    iget-object v7, p0, Lcom/belkin/wemo/cache/devicelist/runnable/SetZigbeeDeviceStateRunnable;->capabilityValue:Ljava/lang/String;

    invoke-virtual {v4, v5, v6, v7}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->updateZigbeeCapability(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 128
    iget-object v4, p0, Lcom/belkin/wemo/cache/devicelist/runnable/SetZigbeeDeviceStateRunnable;->TAG:Ljava/lang/String;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "updated cache and db for :"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v3}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getUDN()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    .line 130
    .end local v3    # "ledDevice":Lcom/belkin/wemo/cache/data/DeviceInformation;
    :cond_0
    iget-object v4, p0, Lcom/belkin/wemo/cache/devicelist/runnable/SetZigbeeDeviceStateRunnable;->TAG:Ljava/lang/String;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "sending positive notification :"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 131
    iget-object v4, p0, Lcom/belkin/wemo/cache/devicelist/runnable/SetZigbeeDeviceStateRunnable;->devListManager:Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    iget-object v5, p0, Lcom/belkin/wemo/cache/devicelist/runnable/SetZigbeeDeviceStateRunnable;->devListManager:Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    const-string v5, "set_state"

    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v6

    invoke-static {v6}, Ljava/lang/Boolean;->toString(Z)Ljava/lang/String;

    move-result-object v6

    iget-object v7, p0, Lcom/belkin/wemo/cache/devicelist/runnable/SetZigbeeDeviceStateRunnable;->deviceId:Ljava/lang/String;

    invoke-virtual {v4, v5, v6, v7}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->sendNotification(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 150
    .end local v1    # "groupedLEDList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/belkin/wemo/cache/data/DeviceInformation;>;"
    .end local v2    # "i$":Ljava/util/Iterator;
    :cond_1
    :goto_1
    return-void

    .line 133
    .restart local v1    # "groupedLEDList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/belkin/wemo/cache/data/DeviceInformation;>;"
    :cond_2
    iget-object v4, p0, Lcom/belkin/wemo/cache/devicelist/runnable/SetZigbeeDeviceStateRunnable;->devListManager:Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    iget-object v5, p0, Lcom/belkin/wemo/cache/devicelist/runnable/SetZigbeeDeviceStateRunnable;->devListManager:Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    const-string v5, "set_state"

    const/4 v6, 0x0

    invoke-static {v6}, Ljava/lang/Boolean;->toString(Z)Ljava/lang/String;

    move-result-object v6

    iget-object v7, p0, Lcom/belkin/wemo/cache/devicelist/runnable/SetZigbeeDeviceStateRunnable;->deviceId:Ljava/lang/String;

    invoke-virtual {v4, v5, v6, v7}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->sendNotification(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_1

    .line 136
    .end local v1    # "groupedLEDList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/belkin/wemo/cache/data/DeviceInformation;>;"
    :cond_3
    iget-object v4, p0, Lcom/belkin/wemo/cache/devicelist/runnable/SetZigbeeDeviceStateRunnable;->context:Landroid/content/Context;

    invoke-static {v4}, Lcom/belkin/wemo/cache/data/DevicesArray;->getInstance(Landroid/content/Context;)Lcom/belkin/wemo/cache/data/DevicesArray;

    move-result-object v4

    iget-object v5, p0, Lcom/belkin/wemo/cache/devicelist/runnable/SetZigbeeDeviceStateRunnable;->deviceId:Ljava/lang/String;

    invoke-virtual {v4, v5}, Lcom/belkin/wemo/cache/data/DevicesArray;->getDeviceInformation(Ljava/lang/String;)Lcom/belkin/wemo/cache/data/DeviceInformation;

    move-result-object v3

    .line 137
    .restart local v3    # "ledDevice":Lcom/belkin/wemo/cache/data/DeviceInformation;
    iget-object v4, p0, Lcom/belkin/wemo/cache/devicelist/runnable/SetZigbeeDeviceStateRunnable;->TAG:Ljava/lang/String;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "device info :"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 138
    invoke-virtual {v3}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getCapabilities()Ljava/lang/String;

    move-result-object v0

    .line 140
    .local v0, "capabilitiesList":Ljava/lang/String;
    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v4

    if-nez v4, :cond_4

    .line 141
    iget-object v4, p0, Lcom/belkin/wemo/cache/devicelist/runnable/SetZigbeeDeviceStateRunnable;->devListManager:Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    invoke-virtual {v3}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getUDN()Ljava/lang/String;

    move-result-object v5

    iget-object v6, p0, Lcom/belkin/wemo/cache/devicelist/runnable/SetZigbeeDeviceStateRunnable;->capabilityID:Ljava/lang/String;

    iget-object v7, p0, Lcom/belkin/wemo/cache/devicelist/runnable/SetZigbeeDeviceStateRunnable;->capabilityValue:Ljava/lang/String;

    invoke-virtual {v4, v5, v6, v7}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->updateZigbeeCapability(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 146
    :goto_2
    iget-object v4, p0, Lcom/belkin/wemo/cache/devicelist/runnable/SetZigbeeDeviceStateRunnable;->devListManager:Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    iget-object v5, p0, Lcom/belkin/wemo/cache/devicelist/runnable/SetZigbeeDeviceStateRunnable;->devListManager:Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    const-string v5, "set_state"

    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v6

    invoke-static {v6}, Ljava/lang/Boolean;->toString(Z)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v3}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getUDN()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v4, v5, v6, v7}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->sendNotification(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_1

    .line 143
    :cond_4
    iget-object v4, p0, Lcom/belkin/wemo/cache/devicelist/runnable/SetZigbeeDeviceStateRunnable;->TAG:Ljava/lang/String;

    const-string v5, "capabilities or state is empty:"

    invoke-static {v4, v5}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_2
.end method


# virtual methods
.method public run()V
    .locals 15

    .prologue
    .line 58
    const/4 v7, 0x1

    invoke-static {v7}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v6

    .line 59
    .local v6, "result":Ljava/lang/Boolean;
    iget-object v7, p0, Lcom/belkin/wemo/cache/devicelist/runnable/SetZigbeeDeviceStateRunnable;->context:Landroid/content/Context;

    invoke-static {v7}, Lcom/belkin/wemo/cache/data/DevicesArray;->getInstance(Landroid/content/Context;)Lcom/belkin/wemo/cache/data/DevicesArray;

    move-result-object v7

    iget-object v8, p0, Lcom/belkin/wemo/cache/devicelist/runnable/SetZigbeeDeviceStateRunnable;->bridgeUDN:Ljava/lang/String;

    invoke-virtual {v7, v8}, Lcom/belkin/wemo/cache/data/DevicesArray;->getDeviceInformation(Ljava/lang/String;)Lcom/belkin/wemo/cache/data/DeviceInformation;

    move-result-object v7

    iput-object v7, p0, Lcom/belkin/wemo/cache/devicelist/runnable/SetZigbeeDeviceStateRunnable;->mDeviceInfo:Lcom/belkin/wemo/cache/data/DeviceInformation;

    .line 60
    iget-object v7, p0, Lcom/belkin/wemo/cache/devicelist/runnable/SetZigbeeDeviceStateRunnable;->mDeviceInfo:Lcom/belkin/wemo/cache/data/DeviceInformation;

    if-eqz v7, :cond_5

    .line 61
    iget-object v7, p0, Lcom/belkin/wemo/cache/devicelist/runnable/SetZigbeeDeviceStateRunnable;->mDeviceInfo:Lcom/belkin/wemo/cache/data/DeviceInformation;

    invoke-virtual {v7}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getDevice()Lorg/cybergarage/upnp/Device;

    move-result-object v3

    .line 62
    .local v3, "device":Lorg/cybergarage/upnp/Device;
    if-nez v3, :cond_0

    .line 63
    iget-object v7, p0, Lcom/belkin/wemo/cache/devicelist/runnable/SetZigbeeDeviceStateRunnable;->TAG:Ljava/lang/String;

    const-string v8, "ZigBeeDeviceStateSetter device is null"

    invoke-static {v7, v8}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 64
    iget-object v7, p0, Lcom/belkin/wemo/cache/devicelist/runnable/SetZigbeeDeviceStateRunnable;->devListManager:Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    invoke-virtual {v7}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->getUpnpControl()Lorg/cybergarage/upnp/ControlPoint;

    move-result-object v2

    .line 65
    .local v2, "cp":Lorg/cybergarage/upnp/ControlPoint;
    if-eqz v2, :cond_0

    .line 66
    iget-object v7, p0, Lcom/belkin/wemo/cache/devicelist/runnable/SetZigbeeDeviceStateRunnable;->bridgeUDN:Ljava/lang/String;

    invoke-virtual {v2, v7}, Lorg/cybergarage/upnp/ControlPoint;->getDevice(Ljava/lang/String;)Lorg/cybergarage/upnp/Device;

    move-result-object v3

    .line 69
    .end local v2    # "cp":Lorg/cybergarage/upnp/ControlPoint;
    :cond_0
    iget-object v7, p0, Lcom/belkin/wemo/cache/devicelist/runnable/SetZigbeeDeviceStateRunnable;->TAG:Ljava/lang/String;

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "ZigBeeDeviceStateSetter mDeviceInfo.getDevice()::"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    iget-object v9, p0, Lcom/belkin/wemo/cache/devicelist/runnable/SetZigbeeDeviceStateRunnable;->mDeviceInfo:Lcom/belkin/wemo/cache/data/DeviceInformation;

    invoke-virtual {v9}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getDevice()Lorg/cybergarage/upnp/Device;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, " UDN: "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    iget-object v9, p0, Lcom/belkin/wemo/cache/devicelist/runnable/SetZigbeeDeviceStateRunnable;->bridgeUDN:Ljava/lang/String;

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, " state:"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    iget-object v9, p0, Lcom/belkin/wemo/cache/devicelist/runnable/SetZigbeeDeviceStateRunnable;->capabilityValue:Ljava/lang/String;

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-static {v7, v8}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 72
    if-eqz v3, :cond_4

    .line 75
    :try_start_0
    const-string v7, "SetDeviceStatus"

    invoke-virtual {v3, v7}, Lorg/cybergarage/upnp/Device;->getAction(Ljava/lang/String;)Lorg/cybergarage/upnp/Action;

    move-result-object v0

    .line 76
    .local v0, "action":Lorg/cybergarage/upnp/Action;
    if-nez v0, :cond_1

    .line 77
    iget-object v7, p0, Lcom/belkin/wemo/cache/devicelist/runnable/SetZigbeeDeviceStateRunnable;->devListManager:Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    iget-object v8, p0, Lcom/belkin/wemo/cache/devicelist/runnable/SetZigbeeDeviceStateRunnable;->deviceId:Ljava/lang/String;

    invoke-virtual {v7, v8}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->updateDeviceDiscovery(Ljava/lang/String;)V

    .line 78
    const/4 v7, 0x0

    invoke-static {v7}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v6

    .line 79
    invoke-direct {p0, v6}, Lcom/belkin/wemo/cache/devicelist/runnable/SetZigbeeDeviceStateRunnable;->processResult(Ljava/lang/Boolean;)V

    .line 116
    .end local v0    # "action":Lorg/cybergarage/upnp/Action;
    .end local v3    # "device":Lorg/cybergarage/upnp/Device;
    :goto_0
    return-void

    .line 82
    .restart local v0    # "action":Lorg/cybergarage/upnp/Action;
    .restart local v3    # "device":Lorg/cybergarage/upnp/Device;
    :cond_1
    iget-object v7, p0, Lcom/belkin/wemo/cache/devicelist/runnable/SetZigbeeDeviceStateRunnable;->devListManager:Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    sget-object v8, Lcom/belkin/wemo/cache/devicelist/UpnpConstants;->SET_LED_DEVICE_STATUS_SINGLE:[Ljava/lang/String;

    const/4 v9, 0x1

    new-array v9, v9, [Ljava/lang/String;

    const/4 v10, 0x0

    iget-object v11, p0, Lcom/belkin/wemo/cache/devicelist/runnable/SetZigbeeDeviceStateRunnable;->capabilityValue:Ljava/lang/String;

    iget-object v12, p0, Lcom/belkin/wemo/cache/devicelist/runnable/SetZigbeeDeviceStateRunnable;->deviceId:Ljava/lang/String;

    iget-object v13, p0, Lcom/belkin/wemo/cache/devicelist/runnable/SetZigbeeDeviceStateRunnable;->capabilityID:Ljava/lang/String;

    iget-object v14, p0, Lcom/belkin/wemo/cache/devicelist/runnable/SetZigbeeDeviceStateRunnable;->isGroupAction:Ljava/lang/String;

    invoke-direct {p0, v11, v12, v13, v14}, Lcom/belkin/wemo/cache/devicelist/runnable/SetZigbeeDeviceStateRunnable;->domXml(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v11

    aput-object v11, v9, v10

    invoke-virtual {v7, v0, v8, v9}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->setArgument(Lorg/cybergarage/upnp/Action;[Ljava/lang/String;[Ljava/lang/String;)V

    .line 83
    iget-object v7, p0, Lcom/belkin/wemo/cache/devicelist/runnable/SetZigbeeDeviceStateRunnable;->TAG:Ljava/lang/String;

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "SetZigbeeDeviceStateRunnable Action:"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-static {v7, v8}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1

    .line 84
    const/4 v1, 0x0

    .line 86
    .local v1, "actionResult":Ljava/lang/String;
    :try_start_1
    invoke-virtual {v0}, Lorg/cybergarage/upnp/Action;->postControlAction()Ljava/lang/String;

    move-result-object v1

    .line 87
    iget-object v7, p0, Lcom/belkin/wemo/cache/devicelist/runnable/SetZigbeeDeviceStateRunnable;->TAG:Ljava/lang/String;

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "SetZigbeeDeviceStateRunnable action response)::"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-static {v7, v8}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 89
    if-eqz v1, :cond_2

    iget-object v7, p0, Lcom/belkin/wemo/cache/devicelist/runnable/SetZigbeeDeviceStateRunnable;->deviceId:Ljava/lang/String;

    invoke-virtual {v1, v7}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v7

    if-eqz v7, :cond_3

    .line 90
    :cond_2
    const/4 v7, 0x0

    invoke-static {v7}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    move-result-object v6

    .line 115
    .end local v0    # "action":Lorg/cybergarage/upnp/Action;
    .end local v1    # "actionResult":Ljava/lang/String;
    .end local v3    # "device":Lorg/cybergarage/upnp/Device;
    :goto_1
    invoke-direct {p0, v6}, Lcom/belkin/wemo/cache/devicelist/runnable/SetZigbeeDeviceStateRunnable;->processResult(Ljava/lang/Boolean;)V

    goto :goto_0

    .line 92
    .restart local v0    # "action":Lorg/cybergarage/upnp/Action;
    .restart local v1    # "actionResult":Ljava/lang/String;
    .restart local v3    # "device":Lorg/cybergarage/upnp/Device;
    :cond_3
    const/4 v7, 0x1

    :try_start_2
    invoke-static {v7}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0

    move-result-object v6

    goto :goto_1

    .line 94
    :catch_0
    move-exception v4

    .line 95
    .local v4, "e":Ljava/lang/Exception;
    :try_start_3
    iget-object v7, p0, Lcom/belkin/wemo/cache/devicelist/runnable/SetZigbeeDeviceStateRunnable;->TAG:Ljava/lang/String;

    const-string v8, "SetZigbeeDeviceStateRunnable postControlAction exception"

    invoke-static {v7, v8, v4}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Exception;)V

    .line 96
    const/4 v7, 0x0

    invoke-static {v7}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_1

    move-result-object v6

    goto :goto_1

    .line 99
    .end local v0    # "action":Lorg/cybergarage/upnp/Action;
    .end local v1    # "actionResult":Ljava/lang/String;
    .end local v4    # "e":Ljava/lang/Exception;
    :catch_1
    move-exception v5

    .line 100
    .local v5, "ex":Ljava/lang/Exception;
    invoke-virtual {v5}, Ljava/lang/Exception;->printStackTrace()V

    .line 101
    iget-object v7, p0, Lcom/belkin/wemo/cache/devicelist/runnable/SetZigbeeDeviceStateRunnable;->devListManager:Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    iget-object v8, p0, Lcom/belkin/wemo/cache/devicelist/runnable/SetZigbeeDeviceStateRunnable;->deviceId:Ljava/lang/String;

    invoke-virtual {v7, v8}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->updateDeviceDiscovery(Ljava/lang/String;)V

    .line 102
    const/4 v7, 0x0

    invoke-static {v7}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v6

    goto :goto_1

    .line 106
    .end local v5    # "ex":Ljava/lang/Exception;
    :cond_4
    iget-object v7, p0, Lcom/belkin/wemo/cache/devicelist/runnable/SetZigbeeDeviceStateRunnable;->TAG:Ljava/lang/String;

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "SetZigbeeDeviceStateRunnable: Device object is NULL for bridge UDN: "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    iget-object v9, p0, Lcom/belkin/wemo/cache/devicelist/runnable/SetZigbeeDeviceStateRunnable;->bridgeUDN:Ljava/lang/String;

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-static {v7, v8}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 107
    iget-object v7, p0, Lcom/belkin/wemo/cache/devicelist/runnable/SetZigbeeDeviceStateRunnable;->devListManager:Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    iget-object v8, p0, Lcom/belkin/wemo/cache/devicelist/runnable/SetZigbeeDeviceStateRunnable;->deviceId:Ljava/lang/String;

    invoke-virtual {v7, v8}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->updateDeviceDiscovery(Ljava/lang/String;)V

    .line 108
    const/4 v7, 0x0

    invoke-static {v7}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v6

    goto :goto_1

    .line 111
    .end local v3    # "device":Lorg/cybergarage/upnp/Device;
    :cond_5
    iget-object v7, p0, Lcom/belkin/wemo/cache/devicelist/runnable/SetZigbeeDeviceStateRunnable;->TAG:Ljava/lang/String;

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "SetZigbeeDeviceStateRunnable: DeviceInformation is NULL for bridge UDN: "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    iget-object v9, p0, Lcom/belkin/wemo/cache/devicelist/runnable/SetZigbeeDeviceStateRunnable;->bridgeUDN:Ljava/lang/String;

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-static {v7, v8}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 112
    const/4 v7, 0x0

    invoke-static {v7}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v6

    goto :goto_1
.end method
