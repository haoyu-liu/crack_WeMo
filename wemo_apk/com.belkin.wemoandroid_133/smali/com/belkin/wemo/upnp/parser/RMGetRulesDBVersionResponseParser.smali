.class public Lcom/belkin/wemo/upnp/parser/RMGetRulesDBVersionResponseParser;
.super Lcom/belkin/wemo/upnp/parser/RMBaseUPNPResponseParser;
.source "RMGetRulesDBVersionResponseParser.java"


# instance fields
.field ruleDbVersion:Z


# direct methods
.method public constructor <init>(Lcom/belkin/wemo/upnp/response/RMBaseUpnpResponse;)V
    .locals 1
    .param p1, "responseObj"    # Lcom/belkin/wemo/upnp/response/RMBaseUpnpResponse;

    .prologue
    .line 58
    invoke-direct {p0, p1}, Lcom/belkin/wemo/upnp/parser/RMBaseUPNPResponseParser;-><init>(Lcom/belkin/wemo/upnp/response/RMBaseUpnpResponse;)V

    .line 55
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/belkin/wemo/upnp/parser/RMGetRulesDBVersionResponseParser;->ruleDbVersion:Z

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
    .line 77
    iget-boolean v0, p0, Lcom/belkin/wemo/upnp/parser/RMGetRulesDBVersionResponseParser;->ruleDbVersion:Z

    if-eqz v0, :cond_0

    .line 78
    iget-object v0, p0, Lcom/belkin/wemo/upnp/parser/RMGetRulesDBVersionResponseParser;->responseObj:Lcom/belkin/wemo/upnp/response/RMBaseUpnpResponse;

    check-cast v0, Lcom/belkin/wemo/upnp/response/RMRulesDBVersionResponse;

    new-instance v1, Ljava/lang/String;

    invoke-direct {v1, p1, p2, p3}, Ljava/lang/String;-><init>([CII)V

    invoke-virtual {v0, v1}, Lcom/belkin/wemo/upnp/response/RMRulesDBVersionResponse;->setRulesDBVersion(Ljava/lang/String;)V

    .line 79
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/belkin/wemo/upnp/parser/RMGetRulesDBVersionResponseParser;->ruleDbVersion:Z

    .line 81
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
    .line 88
    const-string v0, "ruleDbVersion"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 89
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/belkin/wemo/upnp/parser/RMGetRulesDBVersionResponseParser;->ruleDbVersion:Z

    .line 91
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
    .line 66
    const-string v0, "RulesDBVersion"

    invoke-virtual {p3, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 67
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/belkin/wemo/upnp/parser/RMGetRulesDBVersionResponseParser;->ruleDbVersion:Z

    .line 69
    :cond_0
    return-void
.end method
