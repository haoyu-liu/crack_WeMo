.class public Lcom/belkin/upnp/parser/ResetCustomizedResponseParser;
.super Lorg/xml/sax/helpers/DefaultHandler;
.source "ResetCustomizedResponseParser.java"


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

    .line 14
    const-string v0, "Status"

    iput-object v0, p0, Lcom/belkin/upnp/parser/ResetCustomizedResponseParser;->ATTRIBUTE:Ljava/lang/String;

    .line 15
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/belkin/upnp/parser/ResetCustomizedResponseParser;->processValue:Z

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
    .line 50
    invoke-super {p0, p1, p2, p3}, Lorg/xml/sax/helpers/DefaultHandler;->characters([CII)V

    .line 51
    iget-boolean v0, p0, Lcom/belkin/upnp/parser/ResetCustomizedResponseParser;->processValue:Z

    if-eqz v0, :cond_0

    .line 52
    iget-object v0, p0, Lcom/belkin/upnp/parser/ResetCustomizedResponseParser;->responseBuffer:Ljava/lang/StringBuffer;

    invoke-virtual {v0, p1}, Ljava/lang/StringBuffer;->append([C)Ljava/lang/StringBuffer;

    .line 55
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
    .line 60
    invoke-super {p0, p1, p2, p3}, Lorg/xml/sax/helpers/DefaultHandler;->endElement(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 61
    iget-object v0, p0, Lcom/belkin/upnp/parser/ResetCustomizedResponseParser;->ATTRIBUTE:Ljava/lang/String;

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 62
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/belkin/upnp/parser/ResetCustomizedResponseParser;->processValue:Z

    .line 64
    :cond_0
    return-void
.end method

.method public parseCustomizedResponse(Ljava/lang/String;)Lcom/belkin/beans/ResetCustomizedResponseBean;
    .locals 3
    .param p1, "response"    # Ljava/lang/String;

    .prologue
    .line 25
    new-instance v1, Lcom/belkin/beans/ResetCustomizedResponseBean;

    invoke-direct {v1}, Lcom/belkin/beans/ResetCustomizedResponseBean;-><init>()V

    .line 26
    .local v1, "resetObject":Lcom/belkin/beans/ResetCustomizedResponseBean;
    new-instance v2, Ljava/lang/StringBuffer;

    invoke-direct {v2}, Ljava/lang/StringBuffer;-><init>()V

    iput-object v2, p0, Lcom/belkin/upnp/parser/ResetCustomizedResponseParser;->responseBuffer:Ljava/lang/StringBuffer;

    .line 28
    :try_start_0
    invoke-static {p1, p0}, Landroid/util/Xml;->parse(Ljava/lang/String;Lorg/xml/sax/ContentHandler;)V
    :try_end_0
    .catch Lorg/xml/sax/SAXException; {:try_start_0 .. :try_end_0} :catch_0

    .line 32
    :goto_0
    iget-object v2, p0, Lcom/belkin/upnp/parser/ResetCustomizedResponseParser;->responseBuffer:Ljava/lang/StringBuffer;

    if-eqz v2, :cond_0

    .line 33
    iget-object v2, p0, Lcom/belkin/upnp/parser/ResetCustomizedResponseParser;->responseBuffer:Ljava/lang/StringBuffer;

    invoke-virtual {v2}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/belkin/beans/ResetCustomizedResponseBean;->setCustomizedState(Ljava/lang/String;)V

    .line 35
    :cond_0
    return-object v1

    .line 29
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
    .line 41
    invoke-super {p0, p1, p2, p3, p4}, Lorg/xml/sax/helpers/DefaultHandler;->startElement(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lorg/xml/sax/Attributes;)V

    .line 42
    iget-object v0, p0, Lcom/belkin/upnp/parser/ResetCustomizedResponseParser;->ATTRIBUTE:Ljava/lang/String;

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 43
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/belkin/upnp/parser/ResetCustomizedResponseParser;->processValue:Z

    .line 45
    :cond_0
    return-void
.end method
