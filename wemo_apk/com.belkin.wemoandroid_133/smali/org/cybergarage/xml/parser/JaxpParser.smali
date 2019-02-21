.class public Lorg/cybergarage/xml/parser/JaxpParser;
.super Lorg/cybergarage/xml/Parser;
.source "JaxpParser.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 48
    invoke-direct {p0}, Lorg/cybergarage/xml/Parser;-><init>()V

    .line 49
    return-void
.end method


# virtual methods
.method public getStringFromDocument(Lorg/w3c/dom/Document;)Ljava/lang/String;
    .locals 7
    .param p1, "doc"    # Lorg/w3c/dom/Document;

    .prologue
    .line 154
    :try_start_0
    new-instance v0, Ljavax/xml/transform/dom/DOMSource;

    invoke-direct {v0, p1}, Ljavax/xml/transform/dom/DOMSource;-><init>(Lorg/w3c/dom/Node;)V

    .line 155
    .local v0, "domSource":Ljavax/xml/transform/dom/DOMSource;
    new-instance v5, Ljava/io/StringWriter;

    invoke-direct {v5}, Ljava/io/StringWriter;-><init>()V

    .line 156
    .local v5, "writer":Ljava/io/StringWriter;
    new-instance v2, Ljavax/xml/transform/stream/StreamResult;

    invoke-direct {v2, v5}, Ljavax/xml/transform/stream/StreamResult;-><init>(Ljava/io/Writer;)V

    .line 157
    .local v2, "result":Ljavax/xml/transform/stream/StreamResult;
    invoke-static {}, Ljavax/xml/transform/TransformerFactory;->newInstance()Ljavax/xml/transform/TransformerFactory;

    move-result-object v3

    .line 158
    .local v3, "tf":Ljavax/xml/transform/TransformerFactory;
    invoke-virtual {v3}, Ljavax/xml/transform/TransformerFactory;->newTransformer()Ljavax/xml/transform/Transformer;

    move-result-object v4

    .line 159
    .local v4, "transformer":Ljavax/xml/transform/Transformer;
    invoke-virtual {v4, v0, v2}, Ljavax/xml/transform/Transformer;->transform(Ljavax/xml/transform/Source;Ljavax/xml/transform/Result;)V

    .line 160
    invoke-virtual {v5}, Ljava/io/StringWriter;->toString()Ljava/lang/String;
    :try_end_0
    .catch Ljavax/xml/transform/TransformerException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v6

    .line 165
    .end local v0    # "domSource":Ljavax/xml/transform/dom/DOMSource;
    .end local v2    # "result":Ljavax/xml/transform/stream/StreamResult;
    .end local v3    # "tf":Ljavax/xml/transform/TransformerFactory;
    .end local v4    # "transformer":Ljavax/xml/transform/Transformer;
    .end local v5    # "writer":Ljava/io/StringWriter;
    :goto_0
    return-object v6

    .line 162
    :catch_0
    move-exception v1

    .line 164
    .local v1, "ex":Ljavax/xml/transform/TransformerException;
    invoke-virtual {v1}, Ljavax/xml/transform/TransformerException;->printStackTrace()V

    .line 165
    const/4 v6, 0x0

    goto :goto_0
.end method

.method public parse(Ljava/io/InputStream;)Lorg/cybergarage/xml/Node;
    .locals 9
    .param p1, "inStream"    # Ljava/io/InputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/cybergarage/xml/ParserException;
        }
    .end annotation

    .prologue
    .line 120
    const/4 v7, 0x0

    .line 123
    .local v7, "root":Lorg/cybergarage/xml/Node;
    :try_start_0
    invoke-static {}, Ljavax/xml/parsers/DocumentBuilderFactory;->newInstance()Ljavax/xml/parsers/DocumentBuilderFactory;

    move-result-object v5

    .line 124
    .local v5, "factory":Ljavax/xml/parsers/DocumentBuilderFactory;
    invoke-virtual {v5}, Ljavax/xml/parsers/DocumentBuilderFactory;->newDocumentBuilder()Ljavax/xml/parsers/DocumentBuilder;

    move-result-object v0

    .line 125
    .local v0, "builder":Ljavax/xml/parsers/DocumentBuilder;
    new-instance v6, Lorg/xml/sax/InputSource;

    invoke-direct {v6, p1}, Lorg/xml/sax/InputSource;-><init>(Ljava/io/InputStream;)V

    .line 126
    .local v6, "inSrc":Lorg/xml/sax/InputSource;
    invoke-virtual {v0, v6}, Ljavax/xml/parsers/DocumentBuilder;->parse(Lorg/xml/sax/InputSource;)Lorg/w3c/dom/Document;

    move-result-object v2

    .line 128
    .local v2, "doc":Lorg/w3c/dom/Document;
    invoke-interface {v2}, Lorg/w3c/dom/Document;->getDocumentElement()Lorg/w3c/dom/Element;

    move-result-object v3

    .line 130
    .local v3, "docElem":Lorg/w3c/dom/Element;
    invoke-virtual {p0, v2}, Lorg/cybergarage/xml/parser/JaxpParser;->getStringFromDocument(Lorg/w3c/dom/Document;)Ljava/lang/String;

    move-result-object v1

    .line 133
    .local v1, "data":Ljava/lang/String;
    if-eqz v3, :cond_0

    .line 134
    invoke-virtual {p0, v7, v3}, Lorg/cybergarage/xml/parser/JaxpParser;->parse(Lorg/cybergarage/xml/Node;Lorg/w3c/dom/Node;)Lorg/cybergarage/xml/Node;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v7

    .line 147
    :cond_0
    return-object v7

    .line 143
    .end local v0    # "builder":Ljavax/xml/parsers/DocumentBuilder;
    .end local v1    # "data":Ljava/lang/String;
    .end local v2    # "doc":Lorg/w3c/dom/Document;
    .end local v3    # "docElem":Lorg/w3c/dom/Element;
    .end local v5    # "factory":Ljavax/xml/parsers/DocumentBuilderFactory;
    .end local v6    # "inSrc":Lorg/xml/sax/InputSource;
    :catch_0
    move-exception v4

    .line 144
    .local v4, "e":Ljava/lang/Exception;
    new-instance v8, Lorg/cybergarage/xml/ParserException;

    invoke-direct {v8, v4}, Lorg/cybergarage/xml/ParserException;-><init>(Ljava/lang/Exception;)V

    throw v8
.end method

.method public parse(Lorg/cybergarage/xml/Node;Lorg/w3c/dom/Node;)Lorg/cybergarage/xml/Node;
    .locals 1
    .param p1, "parentNode"    # Lorg/cybergarage/xml/Node;
    .param p2, "domNode"    # Lorg/w3c/dom/Node;

    .prologue
    .line 112
    const/4 v0, 0x0

    invoke-virtual {p0, p1, p2, v0}, Lorg/cybergarage/xml/parser/JaxpParser;->parse(Lorg/cybergarage/xml/Node;Lorg/w3c/dom/Node;I)Lorg/cybergarage/xml/Node;

    move-result-object v0

    return-object v0
.end method

.method public parse(Lorg/cybergarage/xml/Node;Lorg/w3c/dom/Node;I)Lorg/cybergarage/xml/Node;
    .locals 12
    .param p1, "parentNode"    # Lorg/cybergarage/xml/Node;
    .param p2, "domNode"    # Lorg/w3c/dom/Node;
    .param p3, "rank"    # I

    .prologue
    .line 57
    invoke-interface {p2}, Lorg/w3c/dom/Node;->getNodeType()S

    move-result v7

    .line 61
    .local v7, "domNodeType":I
    invoke-interface {p2}, Lorg/w3c/dom/Node;->getNodeName()Ljava/lang/String;

    move-result-object v6

    .line 62
    .local v6, "domNodeName":Ljava/lang/String;
    invoke-interface {p2}, Lorg/w3c/dom/Node;->getNodeValue()Ljava/lang/String;

    move-result-object v8

    .line 68
    .local v8, "domNodeValue":Ljava/lang/String;
    const/4 v11, 0x3

    if-ne v7, v11, :cond_1

    .line 71
    invoke-virtual {p1, v8}, Lorg/cybergarage/xml/Node;->addValue(Ljava/lang/String;)V

    .line 107
    .end local p1    # "parentNode":Lorg/cybergarage/xml/Node;
    :cond_0
    :goto_0
    return-object p1

    .line 75
    .restart local p1    # "parentNode":Lorg/cybergarage/xml/Node;
    :cond_1
    const/4 v11, 0x1

    if-ne v7, v11, :cond_0

    .line 78
    new-instance v10, Lorg/cybergarage/xml/Node;

    invoke-direct {v10}, Lorg/cybergarage/xml/Node;-><init>()V

    .line 79
    .local v10, "node":Lorg/cybergarage/xml/Node;
    invoke-virtual {v10, v6}, Lorg/cybergarage/xml/Node;->setName(Ljava/lang/String;)V

    .line 80
    invoke-virtual {v10, v8}, Lorg/cybergarage/xml/Node;->setValue(Ljava/lang/String;)V

    .line 82
    if-eqz p1, :cond_2

    .line 83
    invoke-virtual {p1, v10}, Lorg/cybergarage/xml/Node;->addNode(Lorg/cybergarage/xml/Node;)V

    .line 85
    :cond_2
    invoke-interface {p2}, Lorg/w3c/dom/Node;->getAttributes()Lorg/w3c/dom/NamedNodeMap;

    move-result-object v2

    .line 86
    .local v2, "attrMap":Lorg/w3c/dom/NamedNodeMap;
    if-eqz v2, :cond_3

    .line 87
    invoke-interface {v2}, Lorg/w3c/dom/NamedNodeMap;->getLength()I

    move-result v1

    .line 89
    .local v1, "attrLen":I
    const/4 v9, 0x0

    .local v9, "n":I
    :goto_1
    if-ge v9, v1, :cond_3

    .line 90
    invoke-interface {v2, v9}, Lorg/w3c/dom/NamedNodeMap;->item(I)Lorg/w3c/dom/Node;

    move-result-object v0

    .line 91
    .local v0, "attr":Lorg/w3c/dom/Node;
    invoke-interface {v0}, Lorg/w3c/dom/Node;->getNodeName()Ljava/lang/String;

    move-result-object v3

    .line 92
    .local v3, "attrName":Ljava/lang/String;
    invoke-interface {v0}, Lorg/w3c/dom/Node;->getNodeValue()Ljava/lang/String;

    move-result-object v4

    .line 93
    .local v4, "attrValue":Ljava/lang/String;
    invoke-virtual {v10, v3, v4}, Lorg/cybergarage/xml/Node;->setAttribute(Ljava/lang/String;Ljava/lang/String;)V

    .line 89
    add-int/lit8 v9, v9, 0x1

    goto :goto_1

    .line 97
    .end local v0    # "attr":Lorg/w3c/dom/Node;
    .end local v1    # "attrLen":I
    .end local v3    # "attrName":Ljava/lang/String;
    .end local v4    # "attrValue":Ljava/lang/String;
    .end local v9    # "n":I
    :cond_3
    invoke-interface {p2}, Lorg/w3c/dom/Node;->getFirstChild()Lorg/w3c/dom/Node;

    move-result-object v5

    .line 98
    .local v5, "child":Lorg/w3c/dom/Node;
    if-nez v5, :cond_4

    .line 99
    const-string v11, ""

    invoke-virtual {v10, v11}, Lorg/cybergarage/xml/Node;->setValue(Ljava/lang/String;)V

    move-object p1, v10

    .line 100
    goto :goto_0

    .line 103
    :cond_4
    add-int/lit8 v11, p3, 0x1

    invoke-virtual {p0, v10, v5, v11}, Lorg/cybergarage/xml/parser/JaxpParser;->parse(Lorg/cybergarage/xml/Node;Lorg/w3c/dom/Node;I)Lorg/cybergarage/xml/Node;

    .line 104
    invoke-interface {v5}, Lorg/w3c/dom/Node;->getNextSibling()Lorg/w3c/dom/Node;

    move-result-object v5

    .line 105
    if-nez v5, :cond_4

    move-object p1, v10

    .line 107
    goto :goto_0
.end method
