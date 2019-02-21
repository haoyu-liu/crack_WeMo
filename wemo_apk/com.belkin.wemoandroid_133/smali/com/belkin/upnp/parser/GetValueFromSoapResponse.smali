.class public Lcom/belkin/upnp/parser/GetValueFromSoapResponse;
.super Lorg/xml/sax/helpers/DefaultHandler;
.source "GetValueFromSoapResponse.java"


# instance fields
.field ATTRIBUTE:Ljava/lang/String;

.field processValue:Z

.field private responseBuffer:Ljava/lang/StringBuffer;


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 11
    invoke-direct {p0}, Lorg/xml/sax/helpers/DefaultHandler;-><init>()V

    .line 13
    const-string v0, ""

    iput-object v0, p0, Lcom/belkin/upnp/parser/GetValueFromSoapResponse;->ATTRIBUTE:Ljava/lang/String;

    .line 14
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/belkin/upnp/parser/GetValueFromSoapResponse;->processValue:Z

    return-void
.end method


# virtual methods
.method public characters([CII)V
    .locals 2
    .param p1, "ch"    # [C
    .param p2, "start"    # I
    .param p3, "length"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/xml/sax/SAXException;
        }
    .end annotation

    .prologue
    .line 52
    invoke-super {p0, p1, p2, p3}, Lorg/xml/sax/helpers/DefaultHandler;->characters([CII)V

    .line 53
    iget-boolean v0, p0, Lcom/belkin/upnp/parser/GetValueFromSoapResponse;->processValue:Z

    const/4 v1, 0x1

    if-ne v0, v1, :cond_0

    .line 54
    const/4 v0, 0x0

    aget-char v0, p1, v0

    const/16 v1, 0xa

    if-eq v0, v1, :cond_0

    .line 55
    iget-object v0, p0, Lcom/belkin/upnp/parser/GetValueFromSoapResponse;->responseBuffer:Ljava/lang/StringBuffer;

    new-instance v1, Ljava/lang/String;

    invoke-direct {v1, p1, p2, p3}, Ljava/lang/String;-><init>([CII)V

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 57
    :cond_0
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
    .line 62
    invoke-super {p0, p1, p2, p3}, Lorg/xml/sax/helpers/DefaultHandler;->endElement(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 63
    iget-object v0, p0, Lcom/belkin/upnp/parser/GetValueFromSoapResponse;->ATTRIBUTE:Ljava/lang/String;

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 64
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/belkin/upnp/parser/GetValueFromSoapResponse;->processValue:Z

    .line 66
    :cond_0
    return-void
.end method

.method public parseGetValueFromSOAP(Ljava/lang/Object;Ljava/lang/String;)Lcom/belkin/beans/ValueFromSoapResponse;
    .locals 3
    .param p1, "parcel"    # Ljava/lang/Object;
    .param p2, "response"    # Ljava/lang/String;

    .prologue
    .line 24
    new-instance v2, Ljava/lang/StringBuffer;

    invoke-direct {v2}, Ljava/lang/StringBuffer;-><init>()V

    iput-object v2, p0, Lcom/belkin/upnp/parser/GetValueFromSoapResponse;->responseBuffer:Ljava/lang/StringBuffer;

    .line 26
    if-eqz p2, :cond_0

    .line 27
    :try_start_0
    invoke-static {p2, p0}, Landroid/util/Xml;->parse(Ljava/lang/String;Lorg/xml/sax/ContentHandler;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    :cond_0
    :goto_0
    move-object v1, p1

    .line 33
    check-cast v1, Lcom/belkin/beans/ValueFromSoapResponse;

    .line 34
    .local v1, "object":Lcom/belkin/beans/ValueFromSoapResponse;
    iget-object v2, p0, Lcom/belkin/upnp/parser/GetValueFromSoapResponse;->responseBuffer:Ljava/lang/StringBuffer;

    if-eqz v2, :cond_1

    .line 35
    iget-object v2, p0, Lcom/belkin/upnp/parser/GetValueFromSoapResponse;->responseBuffer:Ljava/lang/StringBuffer;

    invoke-virtual {v2}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/belkin/beans/ValueFromSoapResponse;->setStrValue(Ljava/lang/String;)V

    .line 37
    :cond_1
    return-object v1

    .line 29
    .end local v1    # "object":Lcom/belkin/beans/ValueFromSoapResponse;
    :catch_0
    move-exception v0

    .line 30
    .local v0, "e":Ljava/lang/Exception;
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

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
    .line 43
    invoke-super {p0, p1, p2, p3, p4}, Lorg/xml/sax/helpers/DefaultHandler;->startElement(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lorg/xml/sax/Attributes;)V

    .line 44
    iget-object v0, p0, Lcom/belkin/upnp/parser/GetValueFromSoapResponse;->ATTRIBUTE:Ljava/lang/String;

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 45
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/belkin/upnp/parser/GetValueFromSoapResponse;->processValue:Z

    .line 47
    :cond_0
    return-void
.end method
