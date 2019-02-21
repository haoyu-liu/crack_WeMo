.class Lcom/belkin/wemo/cache/devicelist/UnicastDeviceDiscovery$XMLParser;
.super Ljava/lang/Object;
.source "UnicastDeviceDiscovery.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/belkin/wemo/cache/devicelist/UnicastDeviceDiscovery;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "XMLParser"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/belkin/wemo/cache/devicelist/UnicastDeviceDiscovery;


# direct methods
.method private constructor <init>(Lcom/belkin/wemo/cache/devicelist/UnicastDeviceDiscovery;)V
    .locals 0

    .prologue
    .line 158
    iput-object p1, p0, Lcom/belkin/wemo/cache/devicelist/UnicastDeviceDiscovery$XMLParser;->this$0:Lcom/belkin/wemo/cache/devicelist/UnicastDeviceDiscovery;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/belkin/wemo/cache/devicelist/UnicastDeviceDiscovery;Lcom/belkin/wemo/cache/devicelist/UnicastDeviceDiscovery$1;)V
    .locals 0
    .param p1, "x0"    # Lcom/belkin/wemo/cache/devicelist/UnicastDeviceDiscovery;
    .param p2, "x1"    # Lcom/belkin/wemo/cache/devicelist/UnicastDeviceDiscovery$1;

    .prologue
    .line 158
    invoke-direct {p0, p1}, Lcom/belkin/wemo/cache/devicelist/UnicastDeviceDiscovery$XMLParser;-><init>(Lcom/belkin/wemo/cache/devicelist/UnicastDeviceDiscovery;)V

    return-void
.end method

.method private final getElementValue(Lorg/w3c/dom/Node;)Ljava/lang/String;
    .locals 3
    .param p1, "element"    # Lorg/w3c/dom/Node;

    .prologue
    .line 189
    if-eqz p1, :cond_1

    invoke-interface {p1}, Lorg/w3c/dom/Node;->hasChildNodes()Z

    move-result v1

    if-eqz v1, :cond_1

    .line 190
    invoke-interface {p1}, Lorg/w3c/dom/Node;->getFirstChild()Lorg/w3c/dom/Node;

    move-result-object v0

    .local v0, "child":Lorg/w3c/dom/Node;
    :goto_0
    if-eqz v0, :cond_1

    .line 191
    invoke-interface {v0}, Lorg/w3c/dom/Node;->getNodeType()S

    move-result v1

    const/4 v2, 0x3

    if-ne v1, v2, :cond_0

    .line 192
    invoke-interface {v0}, Lorg/w3c/dom/Node;->getNodeValue()Ljava/lang/String;

    move-result-object v1

    .line 196
    .end local v0    # "child":Lorg/w3c/dom/Node;
    :goto_1
    return-object v1

    .line 190
    .restart local v0    # "child":Lorg/w3c/dom/Node;
    :cond_0
    invoke-interface {v0}, Lorg/w3c/dom/Node;->getNextSibling()Lorg/w3c/dom/Node;

    move-result-object v0

    goto :goto_0

    .line 196
    .end local v0    # "child":Lorg/w3c/dom/Node;
    :cond_1
    const-string v1, ""

    goto :goto_1
.end method


# virtual methods
.method public getDomElement(Ljava/lang/String;)Lorg/w3c/dom/Document;
    .locals 8
    .param p1, "xml"    # Ljava/lang/String;

    .prologue
    const/4 v5, 0x0

    .line 161
    const/4 v2, 0x0

    .line 162
    .local v2, "doc":Lorg/w3c/dom/Document;
    invoke-static {}, Ljavax/xml/parsers/DocumentBuilderFactory;->newInstance()Ljavax/xml/parsers/DocumentBuilderFactory;

    move-result-object v1

    .line 164
    .local v1, "dbf":Ljavax/xml/parsers/DocumentBuilderFactory;
    :try_start_0
    invoke-virtual {v1}, Ljavax/xml/parsers/DocumentBuilderFactory;->newDocumentBuilder()Ljavax/xml/parsers/DocumentBuilder;

    move-result-object v0

    .line 165
    .local v0, "db":Ljavax/xml/parsers/DocumentBuilder;
    new-instance v4, Lorg/xml/sax/InputSource;

    invoke-direct {v4}, Lorg/xml/sax/InputSource;-><init>()V

    .line 166
    .local v4, "is":Lorg/xml/sax/InputSource;
    new-instance v6, Ljava/io/StringReader;

    invoke-direct {v6, p1}, Ljava/io/StringReader;-><init>(Ljava/lang/String;)V

    invoke-virtual {v4, v6}, Lorg/xml/sax/InputSource;->setCharacterStream(Ljava/io/Reader;)V

    .line 167
    invoke-virtual {v0, v4}, Ljavax/xml/parsers/DocumentBuilder;->parse(Lorg/xml/sax/InputSource;)Lorg/w3c/dom/Document;
    :try_end_0
    .catch Ljavax/xml/parsers/ParserConfigurationException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Lorg/xml/sax/SAXException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_2

    move-result-object v2

    move-object v5, v2

    .line 179
    .end local v0    # "db":Ljavax/xml/parsers/DocumentBuilder;
    .end local v4    # "is":Lorg/xml/sax/InputSource;
    :goto_0
    return-object v5

    .line 168
    :catch_0
    move-exception v3

    .line 169
    .local v3, "e":Ljavax/xml/parsers/ParserConfigurationException;
    const-string v6, "Error: "

    invoke-virtual {v3}, Ljavax/xml/parsers/ParserConfigurationException;->getMessage()Ljava/lang/String;

    move-result-object v7

    invoke-static {v6, v7}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0

    .line 171
    .end local v3    # "e":Ljavax/xml/parsers/ParserConfigurationException;
    :catch_1
    move-exception v3

    .line 172
    .local v3, "e":Lorg/xml/sax/SAXException;
    const-string v6, "Error: "

    invoke-virtual {v3}, Lorg/xml/sax/SAXException;->getMessage()Ljava/lang/String;

    move-result-object v7

    invoke-static {v6, v7}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0

    .line 174
    .end local v3    # "e":Lorg/xml/sax/SAXException;
    :catch_2
    move-exception v3

    .line 175
    .local v3, "e":Ljava/io/IOException;
    const-string v6, "Error: "

    invoke-virtual {v3}, Ljava/io/IOException;->getMessage()Ljava/lang/String;

    move-result-object v7

    invoke-static {v6, v7}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0
.end method

.method public getValue(Lorg/w3c/dom/Element;Ljava/lang/String;)Ljava/lang/String;
    .locals 2
    .param p1, "item"    # Lorg/w3c/dom/Element;
    .param p2, "str"    # Ljava/lang/String;

    .prologue
    .line 183
    invoke-interface {p1, p2}, Lorg/w3c/dom/Element;->getElementsByTagName(Ljava/lang/String;)Lorg/w3c/dom/NodeList;

    move-result-object v0

    .line 184
    .local v0, "n":Lorg/w3c/dom/NodeList;
    const/4 v1, 0x0

    invoke-interface {v0, v1}, Lorg/w3c/dom/NodeList;->item(I)Lorg/w3c/dom/Node;

    move-result-object v1

    invoke-direct {p0, v1}, Lcom/belkin/wemo/cache/devicelist/UnicastDeviceDiscovery$XMLParser;->getElementValue(Lorg/w3c/dom/Node;)Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method
