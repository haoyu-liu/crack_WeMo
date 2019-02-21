.class public Lcom/belkin/upnp/parser/GetLedProfileIDResponseParser;
.super Lorg/xml/sax/helpers/DefaultHandler;
.source "GetLedProfileIDResponseParser.java"


# instance fields
.field ATTRIBUTE:Ljava/lang/String;

.field private jsonArray:Lorg/json/JSONArray;

.field private jsonObject:Lorg/json/JSONObject;

.field processValue:Z


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 14
    invoke-direct {p0}, Lorg/xml/sax/helpers/DefaultHandler;-><init>()V

    .line 17
    const-string v0, "CapabilityProfileIDList"

    iput-object v0, p0, Lcom/belkin/upnp/parser/GetLedProfileIDResponseParser;->ATTRIBUTE:Ljava/lang/String;

    .line 18
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/belkin/upnp/parser/GetLedProfileIDResponseParser;->processValue:Z

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
    .line 52
    invoke-super {p0, p1, p2, p3}, Lorg/xml/sax/helpers/DefaultHandler;->characters([CII)V

    .line 53
    const-string v1, ""

    .line 54
    .local v1, "tempStr":Ljava/lang/String;
    new-instance v1, Ljava/lang/String;

    .end local v1    # "tempStr":Ljava/lang/String;
    invoke-direct {v1, p1, p2, p3}, Ljava/lang/String;-><init>([CII)V

    .line 55
    .restart local v1    # "tempStr":Ljava/lang/String;
    iget-boolean v2, p0, Lcom/belkin/upnp/parser/GetLedProfileIDResponseParser;->processValue:Z

    if-eqz v2, :cond_0

    .line 57
    :try_start_0
    iget-object v2, p0, Lcom/belkin/upnp/parser/GetLedProfileIDResponseParser;->jsonObject:Lorg/json/JSONObject;

    const-string v3, "CapabilityProfileIDList"

    invoke-virtual {v2, v3, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 63
    :cond_0
    :goto_0
    return-void

    .line 58
    :catch_0
    move-exception v0

    .line 60
    .local v0, "e":Lorg/json/JSONException;
    invoke-virtual {v0}, Lorg/json/JSONException;->printStackTrace()V

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
    .line 68
    invoke-super {p0, p1, p2, p3}, Lorg/xml/sax/helpers/DefaultHandler;->endElement(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 69
    iget-object v0, p0, Lcom/belkin/upnp/parser/GetLedProfileIDResponseParser;->ATTRIBUTE:Ljava/lang/String;

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 70
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/belkin/upnp/parser/GetLedProfileIDResponseParser;->processValue:Z

    .line 71
    iget-object v0, p0, Lcom/belkin/upnp/parser/GetLedProfileIDResponseParser;->jsonArray:Lorg/json/JSONArray;

    iget-object v1, p0, Lcom/belkin/upnp/parser/GetLedProfileIDResponseParser;->jsonObject:Lorg/json/JSONObject;

    invoke-virtual {v0, v1}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;

    .line 73
    :cond_0
    return-void
.end method

.method public parseProfileIdListResponse(Ljava/lang/String;)Lorg/json/JSONArray;
    .locals 2
    .param p1, "response"    # Ljava/lang/String;

    .prologue
    .line 28
    new-instance v1, Lorg/json/JSONArray;

    invoke-direct {v1}, Lorg/json/JSONArray;-><init>()V

    iput-object v1, p0, Lcom/belkin/upnp/parser/GetLedProfileIDResponseParser;->jsonArray:Lorg/json/JSONArray;

    .line 30
    :try_start_0
    invoke-static {p1, p0}, Landroid/util/Xml;->parse(Ljava/lang/String;Lorg/xml/sax/ContentHandler;)V
    :try_end_0
    .catch Lorg/xml/sax/SAXException; {:try_start_0 .. :try_end_0} :catch_0

    .line 35
    :goto_0
    iget-object v1, p0, Lcom/belkin/upnp/parser/GetLedProfileIDResponseParser;->jsonArray:Lorg/json/JSONArray;

    return-object v1

    .line 31
    :catch_0
    move-exception v0

    .line 32
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
    iget-object v0, p0, Lcom/belkin/upnp/parser/GetLedProfileIDResponseParser;->ATTRIBUTE:Ljava/lang/String;

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 43
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/belkin/upnp/parser/GetLedProfileIDResponseParser;->processValue:Z

    .line 45
    new-instance v0, Lorg/json/JSONObject;

    invoke-direct {v0}, Lorg/json/JSONObject;-><init>()V

    iput-object v0, p0, Lcom/belkin/upnp/parser/GetLedProfileIDResponseParser;->jsonObject:Lorg/json/JSONObject;

    .line 47
    :cond_0
    return-void
.end method
