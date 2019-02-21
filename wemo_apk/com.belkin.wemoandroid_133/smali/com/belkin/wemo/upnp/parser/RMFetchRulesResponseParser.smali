.class public Lcom/belkin/wemo/upnp/parser/RMFetchRulesResponseParser;
.super Lcom/belkin/wemo/upnp/parser/RMBaseUPNPResponseParser;
.source "RMFetchRulesResponseParser.java"


# instance fields
.field errorCode:Z

.field ruleDbPath:Z

.field ruleDbVersion:Z


# direct methods
.method public constructor <init>(Lcom/belkin/wemo/upnp/response/RMBaseUpnpResponse;)V
    .locals 1
    .param p1, "responseObj"    # Lcom/belkin/wemo/upnp/response/RMBaseUpnpResponse;

    .prologue
    const/4 v0, 0x0

    .line 61
    invoke-direct {p0, p1}, Lcom/belkin/wemo/upnp/parser/RMBaseUPNPResponseParser;-><init>(Lcom/belkin/wemo/upnp/response/RMBaseUpnpResponse;)V

    .line 56
    iput-boolean v0, p0, Lcom/belkin/wemo/upnp/parser/RMFetchRulesResponseParser;->ruleDbPath:Z

    .line 57
    iput-boolean v0, p0, Lcom/belkin/wemo/upnp/parser/RMFetchRulesResponseParser;->ruleDbVersion:Z

    .line 58
    iput-boolean v0, p0, Lcom/belkin/wemo/upnp/parser/RMFetchRulesResponseParser;->errorCode:Z

    .line 63
    return-void
.end method


# virtual methods
.method public characters([CII)V
    .locals 4
    .param p1, "ch"    # [C
    .param p2, "start"    # I
    .param p3, "length"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/xml/sax/SAXException;
        }
    .end annotation

    .prologue
    const/4 v3, 0x0

    .line 85
    iget-boolean v1, p0, Lcom/belkin/wemo/upnp/parser/RMFetchRulesResponseParser;->ruleDbPath:Z

    if-eqz v1, :cond_1

    .line 86
    iget-object v1, p0, Lcom/belkin/wemo/upnp/parser/RMFetchRulesResponseParser;->responseObj:Lcom/belkin/wemo/upnp/response/RMBaseUpnpResponse;

    check-cast v1, Lcom/belkin/wemo/upnp/response/RMFetchRulesResponse;

    new-instance v2, Ljava/lang/String;

    invoke-direct {v2, p1, p2, p3}, Ljava/lang/String;-><init>([CII)V

    invoke-virtual {v1, v2}, Lcom/belkin/wemo/upnp/response/RMFetchRulesResponse;->setRuleDBPath(Ljava/lang/String;)V

    .line 87
    iput-boolean v3, p0, Lcom/belkin/wemo/upnp/parser/RMFetchRulesResponseParser;->ruleDbPath:Z

    .line 103
    :cond_0
    :goto_0
    return-void

    .line 91
    :cond_1
    :try_start_0
    iget-boolean v1, p0, Lcom/belkin/wemo/upnp/parser/RMFetchRulesResponseParser;->ruleDbVersion:Z

    if-eqz v1, :cond_2

    .line 92
    iget-object v1, p0, Lcom/belkin/wemo/upnp/parser/RMFetchRulesResponseParser;->responseObj:Lcom/belkin/wemo/upnp/response/RMBaseUpnpResponse;

    check-cast v1, Lcom/belkin/wemo/upnp/response/RMFetchRulesResponse;

    new-instance v2, Ljava/lang/String;

    invoke-direct {v2, p1, p2, p3}, Ljava/lang/String;-><init>([CII)V

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v2

    invoke-virtual {v1, v2}, Lcom/belkin/wemo/upnp/response/RMFetchRulesResponse;->setRuleDBVersion(I)V

    .line 93
    const/4 v1, 0x0

    iput-boolean v1, p0, Lcom/belkin/wemo/upnp/parser/RMFetchRulesResponseParser;->ruleDbVersion:Z
    :try_end_0
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 99
    :catch_0
    move-exception v0

    .line 100
    .local v0, "e":Ljava/lang/NumberFormatException;
    iget-object v1, p0, Lcom/belkin/wemo/upnp/parser/RMFetchRulesResponseParser;->TAG:Ljava/lang/String;

    const-string v2, "NumberFormatException during XML parsing for uPnP response: "

    invoke-static {v1, v2, v0}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Exception;)V

    goto :goto_0

    .line 95
    .end local v0    # "e":Ljava/lang/NumberFormatException;
    :cond_2
    :try_start_1
    iget-boolean v1, p0, Lcom/belkin/wemo/upnp/parser/RMFetchRulesResponseParser;->errorCode:Z

    if-eqz v1, :cond_0

    .line 96
    iget-object v1, p0, Lcom/belkin/wemo/upnp/parser/RMFetchRulesResponseParser;->responseObj:Lcom/belkin/wemo/upnp/response/RMBaseUpnpResponse;

    check-cast v1, Lcom/belkin/wemo/upnp/response/RMFetchRulesResponse;

    new-instance v2, Ljava/lang/String;

    invoke-direct {v2, p1, p2, p3}, Ljava/lang/String;-><init>([CII)V

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v2

    invoke-virtual {v1, v2}, Lcom/belkin/wemo/upnp/response/RMFetchRulesResponse;->setErrorCode(I)V

    .line 97
    const/4 v1, 0x0

    iput-boolean v1, p0, Lcom/belkin/wemo/upnp/parser/RMFetchRulesResponseParser;->errorCode:Z
    :try_end_1
    .catch Ljava/lang/NumberFormatException; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_0
.end method

.method public endElement(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 2
    .param p1, "uri"    # Ljava/lang/String;
    .param p2, "localName"    # Ljava/lang/String;
    .param p3, "qName"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/xml/sax/SAXException;
        }
    .end annotation

    .prologue
    const/4 v1, 0x0

    .line 110
    const-string v0, "ruleDbPath"

    invoke-virtual {p3, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 111
    iput-boolean v1, p0, Lcom/belkin/wemo/upnp/parser/RMFetchRulesResponseParser;->ruleDbPath:Z

    .line 117
    :cond_0
    :goto_0
    return-void

    .line 112
    :cond_1
    const-string v0, "ruleDbVersion"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 113
    iput-boolean v1, p0, Lcom/belkin/wemo/upnp/parser/RMFetchRulesResponseParser;->ruleDbVersion:Z

    goto :goto_0

    .line 114
    :cond_2
    const-string v0, "errorCode"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 115
    iput-boolean v1, p0, Lcom/belkin/wemo/upnp/parser/RMFetchRulesResponseParser;->errorCode:Z

    goto :goto_0
.end method

.method public startElement(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lorg/xml/sax/Attributes;)V
    .locals 2
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
    const/4 v1, 0x1

    .line 70
    const-string v0, "ruleDbPath"

    invoke-virtual {p3, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 71
    iput-boolean v1, p0, Lcom/belkin/wemo/upnp/parser/RMFetchRulesResponseParser;->ruleDbPath:Z

    .line 77
    :cond_0
    :goto_0
    return-void

    .line 72
    :cond_1
    const-string v0, "ruleDbVersion"

    invoke-virtual {p3, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 73
    iput-boolean v1, p0, Lcom/belkin/wemo/upnp/parser/RMFetchRulesResponseParser;->ruleDbVersion:Z

    goto :goto_0

    .line 74
    :cond_2
    const-string v0, "errorCode"

    invoke-virtual {p3, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 75
    iput-boolean v1, p0, Lcom/belkin/wemo/upnp/parser/RMFetchRulesResponseParser;->errorCode:Z

    goto :goto_0
.end method
