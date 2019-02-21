.class public Lcom/belkin/upnp/parser/GetFirmwareResponse;
.super Lorg/xml/sax/helpers/DefaultHandler;
.source "GetFirmwareResponse.java"


# instance fields
.field ATTRIBUTE:Ljava/lang/String;

.field private parseField:I

.field processValue:Z

.field private responseBuffer:Ljava/lang/StringBuffer;


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 12
    invoke-direct {p0}, Lorg/xml/sax/helpers/DefaultHandler;-><init>()V

    .line 15
    const-string v0, "FirmwareVersion"

    iput-object v0, p0, Lcom/belkin/upnp/parser/GetFirmwareResponse;->ATTRIBUTE:Ljava/lang/String;

    .line 16
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/belkin/upnp/parser/GetFirmwareResponse;->processValue:Z

    .line 45
    const/4 v0, 0x1

    iput v0, p0, Lcom/belkin/upnp/parser/GetFirmwareResponse;->parseField:I

    return-void
.end method


# virtual methods
.method public characters([CII)V
    .locals 1
    .param p1, "ch"    # [C
    .param p2, "start"    # I
    .param p3, "length"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/xml/sax/SAXException;
        }
    .end annotation

    .prologue
    .line 60
    invoke-super {p0, p1, p2, p3}, Lorg/xml/sax/helpers/DefaultHandler;->characters([CII)V

    .line 61
    iget-boolean v0, p0, Lcom/belkin/upnp/parser/GetFirmwareResponse;->processValue:Z

    if-eqz v0, :cond_0

    iget v0, p0, Lcom/belkin/upnp/parser/GetFirmwareResponse;->parseField:I

    rem-int/lit8 v0, v0, 0x2

    if-nez v0, :cond_0

    .line 62
    iget-object v0, p0, Lcom/belkin/upnp/parser/GetFirmwareResponse;->responseBuffer:Ljava/lang/StringBuffer;

    invoke-virtual {v0, p1}, Ljava/lang/StringBuffer;->append([C)Ljava/lang/StringBuffer;

    .line 64
    :cond_0
    iget v0, p0, Lcom/belkin/upnp/parser/GetFirmwareResponse;->parseField:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lcom/belkin/upnp/parser/GetFirmwareResponse;->parseField:I

    .line 65
    return-void
.end method

.method public endElement(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 1
    .param p1, "uri"    # Ljava/lang/String;
    .param p2, "localName"    # Ljava/lang/String;
    .param p3, "qName"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/xml/sax/SAXException;
        }
    .end annotation

    .prologue
    .line 70
    invoke-super {p0, p1, p2, p3}, Lorg/xml/sax/helpers/DefaultHandler;->endElement(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 71
    iget-object v0, p0, Lcom/belkin/upnp/parser/GetFirmwareResponse;->ATTRIBUTE:Ljava/lang/String;

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 72
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/belkin/upnp/parser/GetFirmwareResponse;->processValue:Z

    .line 74
    :cond_0
    return-void
.end method

.method public parseGetFirmwareResponse(Ljava/lang/Object;Ljava/lang/String;)Lcom/belkin/beans/FirmwareVersionResponseBean;
    .locals 8
    .param p1, "parcel"    # Ljava/lang/Object;
    .param p2, "response"    # Ljava/lang/String;

    .prologue
    const/4 v7, 0x1

    .line 26
    new-instance v5, Ljava/lang/StringBuffer;

    invoke-direct {v5}, Ljava/lang/StringBuffer;-><init>()V

    iput-object v5, p0, Lcom/belkin/upnp/parser/GetFirmwareResponse;->responseBuffer:Ljava/lang/StringBuffer;

    .line 28
    :try_start_0
    invoke-static {p2, p0}, Landroid/util/Xml;->parse(Ljava/lang/String;Lorg/xml/sax/ContentHandler;)V
    :try_end_0
    .catch Lorg/xml/sax/SAXException; {:try_start_0 .. :try_end_0} :catch_0

    :goto_0
    move-object v2, p1

    .line 33
    check-cast v2, Lcom/belkin/beans/FirmwareVersionResponseBean;

    .line 34
    .local v2, "object":Lcom/belkin/beans/FirmwareVersionResponseBean;
    iget-object v5, p0, Lcom/belkin/upnp/parser/GetFirmwareResponse;->responseBuffer:Ljava/lang/StringBuffer;

    if-eqz v5, :cond_0

    .line 35
    iget-object v5, p0, Lcom/belkin/upnp/parser/GetFirmwareResponse;->responseBuffer:Ljava/lang/StringBuffer;

    invoke-virtual {v5}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v5

    const-string v6, "\\|"

    invoke-virtual {v5, v6}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v3

    .line 37
    .local v3, "respStrings":[Ljava/lang/String;
    const/4 v5, 0x0

    aget-object v5, v3, v5

    invoke-virtual {v5}, Ljava/lang/String;->toString()Ljava/lang/String;

    move-result-object v5

    const-string v6, ":"

    invoke-virtual {v5, v6}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v1

    .line 38
    .local v1, "firmware":[Ljava/lang/String;
    aget-object v5, v1, v7

    invoke-virtual {v2, v5}, Lcom/belkin/beans/FirmwareVersionResponseBean;->setFirmwareVersion(Ljava/lang/String;)V

    .line 39
    aget-object v5, v3, v7

    invoke-virtual {v5}, Ljava/lang/String;->toString()Ljava/lang/String;

    move-result-object v5

    const-string v6, ":"

    invoke-virtual {v5, v6}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v4

    .line 40
    .local v4, "skuNumber":[Ljava/lang/String;
    aget-object v5, v4, v7

    invoke-virtual {v2, v5}, Lcom/belkin/beans/FirmwareVersionResponseBean;->setSkuNumber(Ljava/lang/String;)V

    .line 42
    .end local v1    # "firmware":[Ljava/lang/String;
    .end local v3    # "respStrings":[Ljava/lang/String;
    .end local v4    # "skuNumber":[Ljava/lang/String;
    :cond_0
    return-object v2

    .line 29
    .end local v2    # "object":Lcom/belkin/beans/FirmwareVersionResponseBean;
    :catch_0
    move-exception v0

    .line 30
    .local v0, "e":Lorg/xml/sax/SAXException;
    invoke-virtual {v0}, Lorg/xml/sax/SAXException;->printStackTrace()V

    goto :goto_0
.end method

.method public startElement(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lorg/xml/sax/Attributes;)V
    .locals 1
    .param p1, "uri"    # Ljava/lang/String;
    .param p2, "localName"    # Ljava/lang/String;
    .param p3, "qName"    # Ljava/lang/String;
    .param p4, "attributes"    # Lorg/xml/sax/Attributes;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/xml/sax/SAXException;
        }
    .end annotation

    .prologue
    .line 50
    invoke-super {p0, p1, p2, p3, p4}, Lorg/xml/sax/helpers/DefaultHandler;->startElement(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lorg/xml/sax/Attributes;)V

    .line 51
    iget-object v0, p0, Lcom/belkin/upnp/parser/GetFirmwareResponse;->ATTRIBUTE:Ljava/lang/String;

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 52
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/belkin/upnp/parser/GetFirmwareResponse;->processValue:Z

    .line 53
    const/4 v0, 0x0

    iput v0, p0, Lcom/belkin/upnp/parser/GetFirmwareResponse;->parseField:I

    .line 55
    :cond_0
    return-void
.end method
