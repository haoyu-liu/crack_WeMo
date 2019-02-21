.class public Lcom/belkin/wemo/utils/WeMoUtils;
.super Ljava/lang/Object;
.source "WeMoUtils.java"


# static fields
.field public static final DELIMITER_COLON:Ljava/lang/String; = ":"

.field public static final DEVICE_TYPE_AIR_PURIFIER:Ljava/lang/String; = "airpurifier"

.field public static final DEVICE_TYPE_COFFEE_MAKER:Ljava/lang/String; = "coffeemaker"

.field public static final DEVICE_TYPE_CROCKPOT:Ljava/lang/String; = "crockpot"

.field public static final DEVICE_TYPE_HEATER:Ljava/lang/String; = "heater"

.field public static final DEVICE_TYPE_HUMIDIFIER:Ljava/lang/String; = "humidifier"

.field public static final TAG:Ljava/lang/String; = "WeMoUtils"


# direct methods
.method private constructor <init>()V
    .locals 0

    .prologue
    .line 97
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 99
    return-void
.end method

.method public static areFetchStoreAPIsSupportedInLocal(Ljava/lang/String;Landroid/content/Context;)Z
    .locals 3
    .param p0, "UDN"    # Ljava/lang/String;
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 319
    const/4 v0, 0x0

    .line 320
    .local v0, "areSupported":Z
    if-eqz p1, :cond_0

    .line 321
    invoke-static {p1}, Lcom/belkin/wemo/localsdk/WeMoSDKContext;->getInstance(Landroid/content/Context;)Lcom/belkin/wemo/localsdk/WeMoSDKContext;

    move-result-object v2

    invoke-virtual {v2}, Lcom/belkin/wemo/localsdk/WeMoSDKContext;->getUpnpControl()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/cybergarage/upnp/ControlPoint;

    .line 322
    .local v1, "controlPoint":Lorg/cybergarage/upnp/ControlPoint;
    if-eqz v1, :cond_0

    .line 323
    invoke-virtual {v1, p0}, Lorg/cybergarage/upnp/ControlPoint;->getDevice(Ljava/lang/String;)Lorg/cybergarage/upnp/Device;

    move-result-object v2

    invoke-static {v2}, Lcom/belkin/wemo/utils/WeMoUtils;->areFetchStoreAPIsSupportedInLocal(Lorg/cybergarage/upnp/Device;)Z

    move-result v0

    .line 326
    .end local v1    # "controlPoint":Lorg/cybergarage/upnp/ControlPoint;
    :cond_0
    return v0
.end method

.method public static areFetchStoreAPIsSupportedInLocal(Lorg/cybergarage/upnp/Device;)Z
    .locals 8
    .param p0, "device"    # Lorg/cybergarage/upnp/Device;

    .prologue
    .line 289
    const/4 v1, 0x0

    .line 290
    .local v1, "areSupported":Z
    if-eqz p0, :cond_0

    .line 292
    invoke-virtual {p0}, Lorg/cybergarage/upnp/Device;->getDeviceType()Ljava/lang/String;

    move-result-object v2

    .line 293
    .local v2, "deviceType":Ljava/lang/String;
    invoke-virtual {p0}, Lorg/cybergarage/upnp/Device;->getUDN()Ljava/lang/String;

    move-result-object v0

    .line 294
    .local v0, "UDN":Ljava/lang/String;
    const-string v5, "WeMoUtils"

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "Fetch and Store Support Verification: Device type: "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, ", UDN: "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 296
    invoke-static {v2}, Lcom/belkin/wemo/utils/WeMoUtils;->isSmartDevice(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_1

    .line 298
    const-string v5, "WeMoUtils"

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "Fetch and Store Support Verification: WeMo device with device type: "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, " is a SMART DEVICE."

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 315
    .end local v0    # "UDN":Ljava/lang/String;
    .end local v2    # "deviceType":Ljava/lang/String;
    :cond_0
    :goto_0
    return v1

    .line 302
    .restart local v0    # "UDN":Ljava/lang/String;
    .restart local v2    # "deviceType":Ljava/lang/String;
    :cond_1
    const-string v5, "FetchRules"

    invoke-virtual {p0, v5}, Lorg/cybergarage/upnp/Device;->getAction(Ljava/lang/String;)Lorg/cybergarage/upnp/Action;

    move-result-object v3

    .line 303
    .local v3, "fetchAction":Lorg/cybergarage/upnp/Action;
    const-string v5, "StoreRules"

    invoke-virtual {p0, v5}, Lorg/cybergarage/upnp/Device;->getAction(Ljava/lang/String;)Lorg/cybergarage/upnp/Action;

    move-result-object v4

    .line 305
    .local v4, "storeAction":Lorg/cybergarage/upnp/Action;
    if-eqz v3, :cond_2

    if-eqz v4, :cond_2

    .line 307
    const-string v5, "WeMoUtils"

    const-string v6, "Fetch and Store Support Verification: WeMo device SUPPORTS fecthRules() and storeRules() API."

    invoke-static {v5, v6}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 308
    const/4 v1, 0x1

    goto :goto_0

    .line 311
    :cond_2
    const-string v5, "WeMoUtils"

    const-string v6, "Fetch and Store Support Verification: WeMo device DOES NOT SUPPORT fecthRules() and storeRules() API."

    invoke-static {v5, v6}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0
.end method

.method public static convertDpToPixels(ILandroid/content/Context;)I
    .locals 5
    .param p0, "dp"    # I
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 348
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    invoke-virtual {v2}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v0

    .line 349
    .local v0, "displayMetrics":Landroid/util/DisplayMetrics;
    int-to-float v2, p0

    iget v3, v0, Landroid/util/DisplayMetrics;->xdpi:F

    const/high16 v4, 0x43200000    # 160.0f

    div-float/2addr v3, v4

    mul-float/2addr v2, v3

    invoke-static {v2}, Ljava/lang/Math;->round(F)I

    move-result v1

    .line 350
    .local v1, "px":I
    return v1
.end method

.method public static convertSpToPixels(ILandroid/content/Context;)I
    .locals 4
    .param p0, "sp"    # I
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 354
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    invoke-virtual {v2}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v0

    .line 355
    .local v0, "displayMetrics":Landroid/util/DisplayMetrics;
    const/4 v2, 0x2

    int-to-float v3, p0

    invoke-static {v2, v3, v0}, Landroid/util/TypedValue;->applyDimension(IFLandroid/util/DisplayMetrics;)F

    move-result v2

    float-to-int v1, v2

    .line 356
    .local v1, "px":I
    return v1
.end method

.method public static createWeeklyCalendarListString([Ljava/lang/String;)Ljava/lang/String;
    .locals 26
    .param p0, "weeklyCalendar"    # [Ljava/lang/String;

    .prologue
    .line 152
    const/16 v16, 0x0

    .line 155
    .local v16, "tempxml":Ljava/lang/String;
    :try_start_0
    invoke-static {}, Ljavax/xml/parsers/DocumentBuilderFactory;->newInstance()Ljavax/xml/parsers/DocumentBuilderFactory;

    move-result-object v7

    .line 156
    .local v7, "docFactory":Ljavax/xml/parsers/DocumentBuilderFactory;
    invoke-virtual {v7}, Ljavax/xml/parsers/DocumentBuilderFactory;->newDocumentBuilder()Ljavax/xml/parsers/DocumentBuilder;

    move-result-object v6

    .line 159
    .local v6, "docBuilder":Ljavax/xml/parsers/DocumentBuilder;
    invoke-virtual {v6}, Ljavax/xml/parsers/DocumentBuilder;->newDocument()Lorg/w3c/dom/Document;

    move-result-object v5

    .line 161
    .local v5, "doc":Lorg/w3c/dom/Document;
    const-string v23, "CalendarList"

    move-object/from16 v0, v23

    invoke-interface {v5, v0}, Lorg/w3c/dom/Document;->createElement(Ljava/lang/String;)Lorg/w3c/dom/Element;

    move-result-object v3

    .line 162
    .local v3, "CalendarList":Lorg/w3c/dom/Element;
    invoke-interface {v5, v3}, Lorg/w3c/dom/Document;->appendChild(Lorg/w3c/dom/Node;)Lorg/w3c/dom/Node;

    .line 164
    const-string v23, "Calendar"

    move-object/from16 v0, v23

    invoke-interface {v5, v0}, Lorg/w3c/dom/Document;->createElement(Ljava/lang/String;)Lorg/w3c/dom/Element;

    move-result-object v2

    .line 165
    .local v2, "Calendar":Lorg/w3c/dom/Element;
    invoke-interface {v3, v2}, Lorg/w3c/dom/Element;->appendChild(Lorg/w3c/dom/Node;)Lorg/w3c/dom/Node;

    .line 167
    const-string v23, "([0-9]*)"

    invoke-static/range {v23 .. v23}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v11

    .line 169
    .local v11, "p":Ljava/util/regex/Pattern;
    const/16 v23, 0x0

    aget-object v23, p0, v23

    move-object/from16 v0, v23

    invoke-virtual {v11, v0}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v9

    .line 171
    .local v9, "m":Ljava/util/regex/Matcher;
    invoke-virtual {v9}, Ljava/util/regex/Matcher;->matches()Z

    move-result v23

    if-eqz v23, :cond_0

    .line 172
    const-string v23, "GroupID"

    move-object/from16 v0, v23

    invoke-interface {v5, v0}, Lorg/w3c/dom/Document;->createElement(Ljava/lang/String;)Lorg/w3c/dom/Element;

    move-result-object v4

    .line 173
    .local v4, "deviceIdTag":Lorg/w3c/dom/Element;
    const/16 v23, 0x0

    aget-object v23, p0, v23

    move-object/from16 v0, v23

    invoke-interface {v5, v0}, Lorg/w3c/dom/Document;->createTextNode(Ljava/lang/String;)Lorg/w3c/dom/Text;

    move-result-object v23

    move-object/from16 v0, v23

    invoke-interface {v4, v0}, Lorg/w3c/dom/Element;->appendChild(Lorg/w3c/dom/Node;)Lorg/w3c/dom/Node;

    .line 174
    invoke-interface {v2, v4}, Lorg/w3c/dom/Element;->appendChild(Lorg/w3c/dom/Node;)Lorg/w3c/dom/Node;

    .line 182
    :goto_0
    const-string v23, "Mon"

    move-object/from16 v0, v23

    invoke-interface {v5, v0}, Lorg/w3c/dom/Document;->createElement(Ljava/lang/String;)Lorg/w3c/dom/Element;

    move-result-object v10

    .line 183
    .local v10, "monTag":Lorg/w3c/dom/Element;
    const/16 v23, 0x1

    aget-object v23, p0, v23

    move-object/from16 v0, v23

    invoke-interface {v5, v0}, Lorg/w3c/dom/Document;->createTextNode(Ljava/lang/String;)Lorg/w3c/dom/Text;

    move-result-object v23

    move-object/from16 v0, v23

    invoke-interface {v10, v0}, Lorg/w3c/dom/Element;->appendChild(Lorg/w3c/dom/Node;)Lorg/w3c/dom/Node;

    .line 184
    invoke-interface {v2, v10}, Lorg/w3c/dom/Element;->appendChild(Lorg/w3c/dom/Node;)Lorg/w3c/dom/Node;

    .line 186
    const-string v23, "Tues"

    move-object/from16 v0, v23

    invoke-interface {v5, v0}, Lorg/w3c/dom/Document;->createElement(Ljava/lang/String;)Lorg/w3c/dom/Element;

    move-result-object v20

    .line 187
    .local v20, "tuesTag":Lorg/w3c/dom/Element;
    const/16 v23, 0x2

    aget-object v23, p0, v23

    move-object/from16 v0, v23

    invoke-interface {v5, v0}, Lorg/w3c/dom/Document;->createTextNode(Ljava/lang/String;)Lorg/w3c/dom/Text;

    move-result-object v23

    move-object/from16 v0, v20

    move-object/from16 v1, v23

    invoke-interface {v0, v1}, Lorg/w3c/dom/Element;->appendChild(Lorg/w3c/dom/Node;)Lorg/w3c/dom/Node;

    .line 188
    move-object/from16 v0, v20

    invoke-interface {v2, v0}, Lorg/w3c/dom/Element;->appendChild(Lorg/w3c/dom/Node;)Lorg/w3c/dom/Node;

    .line 190
    const-string v23, "Wed"

    move-object/from16 v0, v23

    invoke-interface {v5, v0}, Lorg/w3c/dom/Document;->createElement(Ljava/lang/String;)Lorg/w3c/dom/Element;

    move-result-object v21

    .line 191
    .local v21, "wedTag":Lorg/w3c/dom/Element;
    const/16 v23, 0x3

    aget-object v23, p0, v23

    move-object/from16 v0, v23

    invoke-interface {v5, v0}, Lorg/w3c/dom/Document;->createTextNode(Ljava/lang/String;)Lorg/w3c/dom/Text;

    move-result-object v23

    move-object/from16 v0, v21

    move-object/from16 v1, v23

    invoke-interface {v0, v1}, Lorg/w3c/dom/Element;->appendChild(Lorg/w3c/dom/Node;)Lorg/w3c/dom/Node;

    .line 192
    move-object/from16 v0, v21

    invoke-interface {v2, v0}, Lorg/w3c/dom/Element;->appendChild(Lorg/w3c/dom/Node;)Lorg/w3c/dom/Node;

    .line 194
    const-string v23, "Thurs"

    move-object/from16 v0, v23

    invoke-interface {v5, v0}, Lorg/w3c/dom/Document;->createElement(Ljava/lang/String;)Lorg/w3c/dom/Element;

    move-result-object v18

    .line 195
    .local v18, "thursTag":Lorg/w3c/dom/Element;
    const/16 v23, 0x4

    aget-object v23, p0, v23

    move-object/from16 v0, v23

    invoke-interface {v5, v0}, Lorg/w3c/dom/Document;->createTextNode(Ljava/lang/String;)Lorg/w3c/dom/Text;

    move-result-object v23

    move-object/from16 v0, v18

    move-object/from16 v1, v23

    invoke-interface {v0, v1}, Lorg/w3c/dom/Element;->appendChild(Lorg/w3c/dom/Node;)Lorg/w3c/dom/Node;

    .line 196
    move-object/from16 v0, v18

    invoke-interface {v2, v0}, Lorg/w3c/dom/Element;->appendChild(Lorg/w3c/dom/Node;)Lorg/w3c/dom/Node;

    .line 198
    const-string v23, "Fri"

    move-object/from16 v0, v23

    invoke-interface {v5, v0}, Lorg/w3c/dom/Document;->createElement(Ljava/lang/String;)Lorg/w3c/dom/Element;

    move-result-object v8

    .line 199
    .local v8, "friTag":Lorg/w3c/dom/Element;
    const/16 v23, 0x5

    aget-object v23, p0, v23

    move-object/from16 v0, v23

    invoke-interface {v5, v0}, Lorg/w3c/dom/Document;->createTextNode(Ljava/lang/String;)Lorg/w3c/dom/Text;

    move-result-object v23

    move-object/from16 v0, v23

    invoke-interface {v8, v0}, Lorg/w3c/dom/Element;->appendChild(Lorg/w3c/dom/Node;)Lorg/w3c/dom/Node;

    .line 200
    invoke-interface {v2, v8}, Lorg/w3c/dom/Element;->appendChild(Lorg/w3c/dom/Node;)Lorg/w3c/dom/Node;

    .line 202
    const-string v23, "Sat"

    move-object/from16 v0, v23

    invoke-interface {v5, v0}, Lorg/w3c/dom/Document;->createElement(Ljava/lang/String;)Lorg/w3c/dom/Element;

    move-result-object v14

    .line 203
    .local v14, "satTag":Lorg/w3c/dom/Element;
    const/16 v23, 0x6

    aget-object v23, p0, v23

    move-object/from16 v0, v23

    invoke-interface {v5, v0}, Lorg/w3c/dom/Document;->createTextNode(Ljava/lang/String;)Lorg/w3c/dom/Text;

    move-result-object v23

    move-object/from16 v0, v23

    invoke-interface {v14, v0}, Lorg/w3c/dom/Element;->appendChild(Lorg/w3c/dom/Node;)Lorg/w3c/dom/Node;

    .line 204
    invoke-interface {v2, v14}, Lorg/w3c/dom/Element;->appendChild(Lorg/w3c/dom/Node;)Lorg/w3c/dom/Node;

    .line 206
    const-string v23, "Sun"

    move-object/from16 v0, v23

    invoke-interface {v5, v0}, Lorg/w3c/dom/Document;->createElement(Ljava/lang/String;)Lorg/w3c/dom/Element;

    move-result-object v15

    .line 207
    .local v15, "sunTag":Lorg/w3c/dom/Element;
    const/16 v23, 0x7

    aget-object v23, p0, v23

    move-object/from16 v0, v23

    invoke-interface {v5, v0}, Lorg/w3c/dom/Document;->createTextNode(Ljava/lang/String;)Lorg/w3c/dom/Text;

    move-result-object v23

    move-object/from16 v0, v23

    invoke-interface {v15, v0}, Lorg/w3c/dom/Element;->appendChild(Lorg/w3c/dom/Node;)Lorg/w3c/dom/Node;

    .line 208
    invoke-interface {v2, v15}, Lorg/w3c/dom/Element;->appendChild(Lorg/w3c/dom/Node;)Lorg/w3c/dom/Node;

    .line 210
    invoke-static {}, Ljavax/xml/transform/TransformerFactory;->newInstance()Ljavax/xml/transform/TransformerFactory;

    move-result-object v23

    invoke-virtual/range {v23 .. v23}, Ljavax/xml/transform/TransformerFactory;->newTransformer()Ljavax/xml/transform/Transformer;

    move-result-object v19

    .line 211
    .local v19, "transformer":Ljavax/xml/transform/Transformer;
    new-instance v22, Ljava/io/StringWriter;

    invoke-direct/range {v22 .. v22}, Ljava/io/StringWriter;-><init>()V

    .line 212
    .local v22, "writer":Ljava/io/StringWriter;
    new-instance v13, Ljavax/xml/transform/stream/StreamResult;

    move-object/from16 v0, v22

    invoke-direct {v13, v0}, Ljavax/xml/transform/stream/StreamResult;-><init>(Ljava/io/Writer;)V

    .line 213
    .local v13, "result":Ljavax/xml/transform/stream/StreamResult;
    new-instance v23, Ljavax/xml/transform/dom/DOMSource;

    move-object/from16 v0, v23

    invoke-direct {v0, v5}, Ljavax/xml/transform/dom/DOMSource;-><init>(Lorg/w3c/dom/Node;)V

    move-object/from16 v0, v19

    move-object/from16 v1, v23

    invoke-virtual {v0, v1, v13}, Ljavax/xml/transform/Transformer;->transform(Ljavax/xml/transform/Source;Ljavax/xml/transform/Result;)V

    .line 215
    invoke-virtual/range {v22 .. v22}, Ljava/io/StringWriter;->toString()Ljava/lang/String;

    move-result-object v16

    .line 216
    const-string v23, "WeMoUtils"

    new-instance v24, Ljava/lang/StringBuilder;

    invoke-direct/range {v24 .. v24}, Ljava/lang/StringBuilder;-><init>()V

    const-string v25, "File saved calendar!"

    invoke-virtual/range {v24 .. v25}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v24

    move-object/from16 v0, v24

    move-object/from16 v1, v16

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v24

    invoke-virtual/range {v24 .. v24}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v24

    invoke-static/range {v23 .. v24}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 222
    .end local v2    # "Calendar":Lorg/w3c/dom/Element;
    .end local v3    # "CalendarList":Lorg/w3c/dom/Element;
    .end local v4    # "deviceIdTag":Lorg/w3c/dom/Element;
    .end local v5    # "doc":Lorg/w3c/dom/Document;
    .end local v6    # "docBuilder":Ljavax/xml/parsers/DocumentBuilder;
    .end local v7    # "docFactory":Ljavax/xml/parsers/DocumentBuilderFactory;
    .end local v8    # "friTag":Lorg/w3c/dom/Element;
    .end local v9    # "m":Ljava/util/regex/Matcher;
    .end local v10    # "monTag":Lorg/w3c/dom/Element;
    .end local v11    # "p":Ljava/util/regex/Pattern;
    .end local v13    # "result":Ljavax/xml/transform/stream/StreamResult;
    .end local v14    # "satTag":Lorg/w3c/dom/Element;
    .end local v15    # "sunTag":Lorg/w3c/dom/Element;
    .end local v18    # "thursTag":Lorg/w3c/dom/Element;
    .end local v19    # "transformer":Ljavax/xml/transform/Transformer;
    .end local v20    # "tuesTag":Lorg/w3c/dom/Element;
    .end local v21    # "wedTag":Lorg/w3c/dom/Element;
    .end local v22    # "writer":Ljava/io/StringWriter;
    :goto_1
    return-object v16

    .line 176
    .restart local v2    # "Calendar":Lorg/w3c/dom/Element;
    .restart local v3    # "CalendarList":Lorg/w3c/dom/Element;
    .restart local v5    # "doc":Lorg/w3c/dom/Document;
    .restart local v6    # "docBuilder":Ljavax/xml/parsers/DocumentBuilder;
    .restart local v7    # "docFactory":Ljavax/xml/parsers/DocumentBuilderFactory;
    .restart local v9    # "m":Ljava/util/regex/Matcher;
    .restart local v11    # "p":Ljava/util/regex/Pattern;
    :cond_0
    const-string v23, "DeviceID"

    move-object/from16 v0, v23

    invoke-interface {v5, v0}, Lorg/w3c/dom/Document;->createElement(Ljava/lang/String;)Lorg/w3c/dom/Element;

    move-result-object v4

    .line 177
    .restart local v4    # "deviceIdTag":Lorg/w3c/dom/Element;
    const/16 v23, 0x0

    aget-object v23, p0, v23

    move-object/from16 v0, v23

    invoke-interface {v5, v0}, Lorg/w3c/dom/Document;->createTextNode(Ljava/lang/String;)Lorg/w3c/dom/Text;

    move-result-object v23

    move-object/from16 v0, v23

    invoke-interface {v4, v0}, Lorg/w3c/dom/Element;->appendChild(Lorg/w3c/dom/Node;)Lorg/w3c/dom/Node;

    .line 178
    invoke-interface {v2, v4}, Lorg/w3c/dom/Element;->appendChild(Lorg/w3c/dom/Node;)Lorg/w3c/dom/Node;
    :try_end_0
    .catch Ljavax/xml/parsers/ParserConfigurationException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljavax/xml/transform/TransformerException; {:try_start_0 .. :try_end_0} :catch_1

    goto/16 :goto_0

    .line 217
    .end local v2    # "Calendar":Lorg/w3c/dom/Element;
    .end local v3    # "CalendarList":Lorg/w3c/dom/Element;
    .end local v4    # "deviceIdTag":Lorg/w3c/dom/Element;
    .end local v5    # "doc":Lorg/w3c/dom/Document;
    .end local v6    # "docBuilder":Ljavax/xml/parsers/DocumentBuilder;
    .end local v7    # "docFactory":Ljavax/xml/parsers/DocumentBuilderFactory;
    .end local v9    # "m":Ljava/util/regex/Matcher;
    .end local v11    # "p":Ljava/util/regex/Pattern;
    :catch_0
    move-exception v12

    .line 218
    .local v12, "pce":Ljavax/xml/parsers/ParserConfigurationException;
    invoke-virtual {v12}, Ljavax/xml/parsers/ParserConfigurationException;->printStackTrace()V

    goto :goto_1

    .line 219
    .end local v12    # "pce":Ljavax/xml/parsers/ParserConfigurationException;
    :catch_1
    move-exception v17

    .line 220
    .local v17, "tfe":Ljavax/xml/transform/TransformerException;
    invoke-virtual/range {v17 .. v17}, Ljavax/xml/transform/TransformerException;->printStackTrace()V

    goto :goto_1
.end method

.method public static createXMLString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 2
    .param p0, "attributeName"    # Ljava/lang/String;
    .param p1, "attributeValue"    # Ljava/lang/String;

    .prologue
    .line 142
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "<"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ">"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "</"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ">"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static getByteArray(Ljava/io/InputStream;)[B
    .locals 8
    .param p0, "ipstrmToRead"    # Ljava/io/InputStream;

    .prologue
    .line 241
    const/4 v3, 0x0

    .line 243
    .local v3, "dataToRead":[B
    move-object v5, p0

    .line 244
    .local v5, "is":Ljava/io/InputStream;
    :try_start_0
    new-instance v1, Ljava/io/BufferedInputStream;

    invoke-direct {v1, v5}, Ljava/io/BufferedInputStream;-><init>(Ljava/io/InputStream;)V

    .line 245
    .local v1, "bis":Ljava/io/BufferedInputStream;
    new-instance v0, Lorg/apache/http/util/ByteArrayBuffer;

    const/16 v6, 0x32

    invoke-direct {v0, v6}, Lorg/apache/http/util/ByteArrayBuffer;-><init>(I)V

    .line 246
    .local v0, "baf":Lorg/apache/http/util/ByteArrayBuffer;
    const/4 v2, 0x0

    .line 247
    .local v2, "current":I
    :goto_0
    invoke-virtual {v1}, Ljava/io/BufferedInputStream;->read()I

    move-result v2

    const/4 v6, -0x1

    if-eq v2, v6, :cond_0

    .line 248
    int-to-byte v6, v2

    invoke-virtual {v0, v6}, Lorg/apache/http/util/ByteArrayBuffer;->append(I)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 255
    .end local v0    # "baf":Lorg/apache/http/util/ByteArrayBuffer;
    .end local v1    # "bis":Ljava/io/BufferedInputStream;
    .end local v2    # "current":I
    :catch_0
    move-exception v4

    .line 256
    .local v4, "e":Ljava/lang/Exception;
    const-string v6, "WeMoUtils"

    const-string v7, "Exception while reading from InputStream: "

    invoke-static {v6, v7, v4}, Lcom/belkin/utils/LogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 259
    .end local v4    # "e":Ljava/lang/Exception;
    :goto_1
    return-object v3

    .line 250
    .restart local v0    # "baf":Lorg/apache/http/util/ByteArrayBuffer;
    .restart local v1    # "bis":Ljava/io/BufferedInputStream;
    .restart local v2    # "current":I
    :cond_0
    :try_start_1
    invoke-virtual {v1}, Ljava/io/BufferedInputStream;->close()V

    .line 251
    const/4 v1, 0x0

    .line 252
    invoke-virtual {v5}, Ljava/io/InputStream;->close()V

    .line 253
    const/4 v5, 0x0

    .line 254
    invoke-virtual {v0}, Lorg/apache/http/util/ByteArrayBuffer;->toByteArray()[B
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    move-result-object v3

    goto :goto_1
.end method

.method public static getMakerUDNComparisonString(Ljava/lang/String;)Ljava/lang/String;
    .locals 5
    .param p0, "makerUDN"    # Ljava/lang/String;

    .prologue
    .line 277
    const/4 v0, 0x0

    .line 278
    .local v0, "comparisonUDN":Ljava/lang/String;
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v2

    if-nez v2, :cond_0

    .line 279
    const-string v2, ":"

    invoke-virtual {p0, v2}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v1

    .line 280
    .local v1, "udnArr":[Ljava/lang/String;
    array-length v2, v1

    const/4 v3, 0x2

    if-lt v2, v3, :cond_0

    .line 281
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const/4 v3, 0x0

    aget-object v3, v1, v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, ":"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const/4 v3, 0x1

    aget-object v3, v1, v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 284
    .end local v1    # "udnArr":[Ljava/lang/String;
    :cond_0
    const-string v2, "WeMoUtils"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "UDN for comparison: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 285
    return-object v0
.end method

.method public static getWiFiDeviceList(Landroid/content/Context;)Ljava/util/List;
    .locals 5
    .param p0, "context"    # Landroid/content/Context;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            ")",
            "Ljava/util/List",
            "<",
            "Lcom/belkin/wemo/cache/data/DeviceInformation;",
            ">;"
        }
    .end annotation

    .prologue
    .line 227
    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    .line 229
    .local v3, "wifiDeviceList":Ljava/util/List;, "Ljava/util/List<Lcom/belkin/wemo/cache/data/DeviceInformation;>;"
    invoke-static {p0}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->getInstance(Landroid/content/Context;)Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    move-result-object v4

    invoke-virtual {v4}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->getActiveDeviceInfoList()Ljava/util/ArrayList;

    move-result-object v1

    .line 230
    .local v1, "fullDeviceList":Ljava/util/List;, "Ljava/util/List<Lcom/belkin/wemo/cache/data/DeviceInformation;>;"
    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    .local v2, "i$":Ljava/util/Iterator;
    :cond_0
    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_1

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/belkin/wemo/cache/data/DeviceInformation;

    .line 231
    .local v0, "devInfo":Lcom/belkin/wemo/cache/data/DeviceInformation;
    invoke-virtual {v0}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getType()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/String;->isEmpty()Z

    move-result v4

    if-nez v4, :cond_0

    .line 233
    invoke-interface {v3, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 237
    .end local v0    # "devInfo":Lcom/belkin/wemo/cache/data/DeviceInformation;
    :cond_1
    return-object v3
.end method

.method public static isLEDModelCodeSupported(Ljava/lang/String;)Z
    .locals 6
    .param p0, "modelCode"    # Ljava/lang/String;

    .prologue
    .line 336
    const/4 v2, 0x0

    .line 337
    .local v2, "isSupported":Z
    sget-object v0, Lcom/belkin/wemo/cache/utils/Constants;->SUPPORTED_LED_MODELCODE_ARRAY:[Ljava/lang/String;

    .local v0, "arr$":[Ljava/lang/String;
    array-length v3, v0

    .local v3, "len$":I
    const/4 v1, 0x0

    .local v1, "i$":I
    :goto_0
    if-ge v1, v3, :cond_0

    aget-object v4, v0, v1

    .line 338
    .local v4, "supportedModelCode":Ljava/lang/String;
    invoke-virtual {p0, v4}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_1

    .line 339
    const/4 v2, 0x1

    .line 344
    .end local v4    # "supportedModelCode":Ljava/lang/String;
    :cond_0
    return v2

    .line 337
    .restart local v4    # "supportedModelCode":Ljava/lang/String;
    :cond_1
    add-int/lit8 v1, v1, 0x1

    goto :goto_0
.end method

.method public static isSmartDevice(Ljava/lang/String;)Z
    .locals 2
    .param p0, "deviceType"    # Ljava/lang/String;

    .prologue
    .line 263
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_1

    .line 264
    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    move-result-object v1

    invoke-virtual {p0, v1}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v0

    .line 265
    .local v0, "deviceTypeLC":Ljava/lang/String;
    const-string v1, "heater"

    invoke-virtual {v0, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_0

    const-string v1, "airpurifier"

    invoke-virtual {v0, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_0

    const-string v1, "humidifier"

    invoke-virtual {v0, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_0

    const-string v1, "coffeemaker"

    invoke-virtual {v0, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_0

    const-string v1, "crockpot"

    invoke-virtual {v0, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 270
    :cond_0
    const/4 v1, 0x1

    .line 273
    .end local v0    # "deviceTypeLC":Ljava/lang/String;
    :goto_0
    return v1

    :cond_1
    const/4 v1, 0x0

    goto :goto_0
.end method

.method public static setActionArguments(Lorg/cybergarage/upnp/Action;[Ljava/lang/String;[Ljava/lang/String;)Z
    .locals 4
    .param p0, "action"    # Lorg/cybergarage/upnp/Action;
    .param p1, "keyList"    # [Ljava/lang/String;
    .param p2, "argList"    # [Ljava/lang/String;

    .prologue
    .line 111
    if-eqz p2, :cond_1

    if-eqz p1, :cond_1

    .line 112
    const/4 v0, 0x0

    .local v0, "counter":I
    :goto_0
    array-length v1, p1

    if-ge v0, v1, :cond_0

    .line 113
    const-string v1, "WeMoUtils"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "SetActioArguments - Key: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    aget-object v3, p1, v0

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, ", Value: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    aget-object v3, p2, v0

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 114
    aget-object v1, p1, v0

    aget-object v2, p2, v0

    invoke-virtual {p0, v1, v2}, Lorg/cybergarage/upnp/Action;->setArgumentValue(Ljava/lang/String;Ljava/lang/String;)V

    .line 112
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 116
    :cond_0
    const/4 v1, 0x1

    .line 118
    .end local v0    # "counter":I
    :goto_1
    return v1

    :cond_1
    const/4 v1, 0x0

    goto :goto_1
.end method

.method public static final syncAppDBVersion(Lorg/cybergarage/upnp/DeviceList;Landroid/content/Context;)V
    .locals 0
    .param p0, "devicesList"    # Lorg/cybergarage/upnp/DeviceList;
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 129
    return-void
.end method
