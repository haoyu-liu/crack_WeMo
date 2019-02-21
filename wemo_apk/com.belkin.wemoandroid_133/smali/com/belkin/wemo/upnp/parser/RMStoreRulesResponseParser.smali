.class public Lcom/belkin/wemo/upnp/parser/RMStoreRulesResponseParser;
.super Lcom/belkin/wemo/upnp/parser/RMBaseUPNPResponseParser;
.source "RMStoreRulesResponseParser.java"


# instance fields
.field errorInfo:Z


# direct methods
.method public constructor <init>(Lcom/belkin/wemo/upnp/response/RMBaseUpnpResponse;)V
    .locals 1
    .param p1, "responseObj"    # Lcom/belkin/wemo/upnp/response/RMBaseUpnpResponse;

    .prologue
    .line 58
    invoke-direct {p0, p1}, Lcom/belkin/wemo/upnp/parser/RMBaseUPNPResponseParser;-><init>(Lcom/belkin/wemo/upnp/response/RMBaseUpnpResponse;)V

    .line 55
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/belkin/wemo/upnp/parser/RMStoreRulesResponseParser;->errorInfo:Z

    .line 59
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
    .line 82
    iget-boolean v0, p0, Lcom/belkin/wemo/upnp/parser/RMStoreRulesResponseParser;->errorInfo:Z

    if-eqz v0, :cond_0

    .line 83
    iget-object v0, p0, Lcom/belkin/wemo/upnp/parser/RMStoreRulesResponseParser;->responseObj:Lcom/belkin/wemo/upnp/response/RMBaseUpnpResponse;

    check-cast v0, Lcom/belkin/wemo/upnp/response/RMStoreRulesResponse;

    new-instance v1, Ljava/lang/String;

    invoke-direct {v1, p1, p2, p3}, Ljava/lang/String;-><init>([CII)V

    invoke-virtual {v0, v1}, Lcom/belkin/wemo/upnp/response/RMStoreRulesResponse;->setErrorInfo(Ljava/lang/String;)V

    .line 85
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/belkin/wemo/upnp/parser/RMStoreRulesResponseParser;->errorInfo:Z

    .line 87
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
    .line 97
    const-string v0, "errorInfo"

    invoke-virtual {p3, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 98
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/belkin/wemo/upnp/parser/RMStoreRulesResponseParser;->errorInfo:Z

    .line 100
    :cond_0
    return-void
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
    .line 69
    const-string v0, "errorInfo"

    invoke-virtual {p3, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 70
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/belkin/wemo/upnp/parser/RMStoreRulesResponseParser;->errorInfo:Z

    .line 73
    :cond_0
    return-void
.end method
