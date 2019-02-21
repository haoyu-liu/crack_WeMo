.class public Lcom/belkin/upnp/parser/GetRulesDBVersionResponse;
.super Lorg/xml/sax/helpers/DefaultHandler;
.source "GetRulesDBVersionResponse.java"


# instance fields
.field ATTRIBUTE:Ljava/lang/String;

.field private parseField:I

.field processValue:Z

.field private responseBuffer:Ljava/lang/StringBuffer;


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 11
    invoke-direct {p0}, Lorg/xml/sax/helpers/DefaultHandler;-><init>()V

    .line 13
    const-string v0, "RulesDBVersion"

    iput-object v0, p0, Lcom/belkin/upnp/parser/GetRulesDBVersionResponse;->ATTRIBUTE:Ljava/lang/String;

    .line 14
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/belkin/upnp/parser/GetRulesDBVersionResponse;->processValue:Z

    .line 38
    const/4 v0, 0x1

    iput v0, p0, Lcom/belkin/upnp/parser/GetRulesDBVersionResponse;->parseField:I

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
    .line 54
    invoke-super {p0, p1, p2, p3}, Lorg/xml/sax/helpers/DefaultHandler;->characters([CII)V

    .line 55
    iget-boolean v0, p0, Lcom/belkin/upnp/parser/GetRulesDBVersionResponse;->processValue:Z

    if-eqz v0, :cond_0

    iget v0, p0, Lcom/belkin/upnp/parser/GetRulesDBVersionResponse;->parseField:I

    rem-int/lit8 v0, v0, 0x2

    if-nez v0, :cond_0

    .line 56
    iget-object v0, p0, Lcom/belkin/upnp/parser/GetRulesDBVersionResponse;->responseBuffer:Ljava/lang/StringBuffer;

    invoke-virtual {v0, p1}, Ljava/lang/StringBuffer;->append([C)Ljava/lang/StringBuffer;

    .line 59
    :cond_0
    iget v0, p0, Lcom/belkin/upnp/parser/GetRulesDBVersionResponse;->parseField:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lcom/belkin/upnp/parser/GetRulesDBVersionResponse;->parseField:I

    .line 60
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
    .line 65
    invoke-super {p0, p1, p2, p3}, Lorg/xml/sax/helpers/DefaultHandler;->endElement(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 66
    iget-object v0, p0, Lcom/belkin/upnp/parser/GetRulesDBVersionResponse;->ATTRIBUTE:Ljava/lang/String;

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 67
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/belkin/upnp/parser/GetRulesDBVersionResponse;->processValue:Z

    .line 69
    :cond_0
    return-void
.end method

.method public parseGetRulesDBVersionResponse(Ljava/lang/Object;Ljava/lang/String;)Lcom/belkin/rules/beans/RulesDBVersionResponseBean;
    .locals 3
    .param p1, "parcel"    # Ljava/lang/Object;
    .param p2, "response"    # Ljava/lang/String;

    .prologue
    .line 24
    new-instance v2, Ljava/lang/StringBuffer;

    invoke-direct {v2}, Ljava/lang/StringBuffer;-><init>()V

    iput-object v2, p0, Lcom/belkin/upnp/parser/GetRulesDBVersionResponse;->responseBuffer:Ljava/lang/StringBuffer;

    .line 26
    :try_start_0
    invoke-static {p2, p0}, Landroid/util/Xml;->parse(Ljava/lang/String;Lorg/xml/sax/ContentHandler;)V
    :try_end_0
    .catch Lorg/xml/sax/SAXException; {:try_start_0 .. :try_end_0} :catch_0

    :goto_0
    move-object v1, p1

    .line 31
    check-cast v1, Lcom/belkin/rules/beans/RulesDBVersionResponseBean;

    .line 32
    .local v1, "object":Lcom/belkin/rules/beans/RulesDBVersionResponseBean;
    iget-object v2, p0, Lcom/belkin/upnp/parser/GetRulesDBVersionResponse;->responseBuffer:Ljava/lang/StringBuffer;

    if-eqz v2, :cond_0

    .line 33
    iget-object v2, p0, Lcom/belkin/upnp/parser/GetRulesDBVersionResponse;->responseBuffer:Ljava/lang/StringBuffer;

    invoke-virtual {v2}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/belkin/rules/beans/RulesDBVersionResponseBean;->setStrRulesDBVersion(Ljava/lang/String;)V

    .line 35
    :cond_0
    return-object v1

    .line 27
    .end local v1    # "object":Lcom/belkin/rules/beans/RulesDBVersionResponseBean;
    :catch_0
    move-exception v0

    .line 28
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
    .line 43
    invoke-super {p0, p1, p2, p3, p4}, Lorg/xml/sax/helpers/DefaultHandler;->startElement(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lorg/xml/sax/Attributes;)V

    .line 44
    iget-object v0, p0, Lcom/belkin/upnp/parser/GetRulesDBVersionResponse;->ATTRIBUTE:Ljava/lang/String;

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 45
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/belkin/upnp/parser/GetRulesDBVersionResponse;->processValue:Z

    .line 47
    const/4 v0, 0x0

    iput v0, p0, Lcom/belkin/upnp/parser/GetRulesDBVersionResponse;->parseField:I

    .line 49
    :cond_0
    return-void
.end method
