.class public Lcom/belkin/upnp/parser/GetAttributeResponseParser;
.super Lorg/xml/sax/helpers/DefaultHandler;
.source "GetAttributeResponseParser.java"


# instance fields
.field ATTRIBUTE_MODE:Ljava/lang/String;

.field ATTRIBUTE_MODETIME:Ljava/lang/String;

.field ATTRIBUTE_TIME_REMAINING:Ljava/lang/String;

.field private jsonArray:Lorg/json/JSONArray;

.field private jsonObject:Lorg/json/JSONObject;

.field modeTimeValue:Z

.field modeValue:Z

.field timeRemainingValue:Z


# direct methods
.method public constructor <init>()V
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 14
    invoke-direct {p0}, Lorg/xml/sax/helpers/DefaultHandler;-><init>()V

    .line 17
    const-string v0, "Mode"

    iput-object v0, p0, Lcom/belkin/upnp/parser/GetAttributeResponseParser;->ATTRIBUTE_MODE:Ljava/lang/String;

    .line 18
    const-string v0, "ModeTime"

    iput-object v0, p0, Lcom/belkin/upnp/parser/GetAttributeResponseParser;->ATTRIBUTE_MODETIME:Ljava/lang/String;

    .line 19
    const-string v0, "TimeRemaining"

    iput-object v0, p0, Lcom/belkin/upnp/parser/GetAttributeResponseParser;->ATTRIBUTE_TIME_REMAINING:Ljava/lang/String;

    .line 20
    iput-boolean v1, p0, Lcom/belkin/upnp/parser/GetAttributeResponseParser;->modeValue:Z

    .line 21
    iput-boolean v1, p0, Lcom/belkin/upnp/parser/GetAttributeResponseParser;->modeTimeValue:Z

    .line 22
    iput-boolean v1, p0, Lcom/belkin/upnp/parser/GetAttributeResponseParser;->timeRemainingValue:Z

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
    .line 61
    invoke-super {p0, p1, p2, p3}, Lorg/xml/sax/helpers/DefaultHandler;->characters([CII)V

    .line 62
    const-string v1, ""

    .line 63
    .local v1, "tempStr":Ljava/lang/String;
    new-instance v1, Ljava/lang/String;

    .end local v1    # "tempStr":Ljava/lang/String;
    invoke-direct {v1, p1, p2, p3}, Ljava/lang/String;-><init>([CII)V

    .line 65
    .restart local v1    # "tempStr":Ljava/lang/String;
    :try_start_0
    iget-boolean v2, p0, Lcom/belkin/upnp/parser/GetAttributeResponseParser;->modeValue:Z

    if-eqz v2, :cond_0

    .line 66
    iget-object v2, p0, Lcom/belkin/upnp/parser/GetAttributeResponseParser;->jsonObject:Lorg/json/JSONObject;

    sget-object v3, Lcom/belkin/wemo/cache/devicelist/JSONConstants;->GET_MODE:Ljava/lang/String;

    invoke-virtual {v2, v3, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 68
    :cond_0
    iget-boolean v2, p0, Lcom/belkin/upnp/parser/GetAttributeResponseParser;->modeTimeValue:Z

    if-eqz v2, :cond_1

    .line 69
    iget-object v2, p0, Lcom/belkin/upnp/parser/GetAttributeResponseParser;->jsonObject:Lorg/json/JSONObject;

    sget-object v3, Lcom/belkin/wemo/cache/devicelist/JSONConstants;->GET_MODETIME:Ljava/lang/String;

    invoke-virtual {v2, v3, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 71
    :cond_1
    iget-boolean v2, p0, Lcom/belkin/upnp/parser/GetAttributeResponseParser;->timeRemainingValue:Z

    if-eqz v2, :cond_2

    .line 72
    iget-object v2, p0, Lcom/belkin/upnp/parser/GetAttributeResponseParser;->jsonObject:Lorg/json/JSONObject;

    sget-object v3, Lcom/belkin/wemo/cache/devicelist/JSONConstants;->GET_TIME_REMAINING:Ljava/lang/String;

    invoke-virtual {v2, v3, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 79
    :cond_2
    :goto_0
    return-void

    .line 74
    :catch_0
    move-exception v0

    .line 76
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
    const/4 v1, 0x1

    .line 84
    invoke-super {p0, p1, p2, p3}, Lorg/xml/sax/helpers/DefaultHandler;->endElement(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 85
    iget-object v0, p0, Lcom/belkin/upnp/parser/GetAttributeResponseParser;->ATTRIBUTE_MODE:Ljava/lang/String;

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 86
    iput-boolean v1, p0, Lcom/belkin/upnp/parser/GetAttributeResponseParser;->modeValue:Z

    .line 88
    :cond_0
    iget-object v0, p0, Lcom/belkin/upnp/parser/GetAttributeResponseParser;->ATTRIBUTE_MODETIME:Ljava/lang/String;

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 89
    iput-boolean v1, p0, Lcom/belkin/upnp/parser/GetAttributeResponseParser;->modeTimeValue:Z

    .line 91
    :cond_1
    iget-object v0, p0, Lcom/belkin/upnp/parser/GetAttributeResponseParser;->ATTRIBUTE_TIME_REMAINING:Ljava/lang/String;

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 92
    iput-boolean v1, p0, Lcom/belkin/upnp/parser/GetAttributeResponseParser;->timeRemainingValue:Z

    .line 93
    iget-object v0, p0, Lcom/belkin/upnp/parser/GetAttributeResponseParser;->jsonArray:Lorg/json/JSONArray;

    iget-object v1, p0, Lcom/belkin/upnp/parser/GetAttributeResponseParser;->jsonObject:Lorg/json/JSONObject;

    invoke-virtual {v0, v1}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;

    .line 95
    :cond_2
    return-void
.end method

.method public parseGetAttributeResponse(Ljava/lang/String;)Lorg/json/JSONArray;
    .locals 2
    .param p1, "response"    # Ljava/lang/String;

    .prologue
    .line 32
    new-instance v1, Lorg/json/JSONArray;

    invoke-direct {v1}, Lorg/json/JSONArray;-><init>()V

    iput-object v1, p0, Lcom/belkin/upnp/parser/GetAttributeResponseParser;->jsonArray:Lorg/json/JSONArray;

    .line 34
    :try_start_0
    invoke-static {p1, p0}, Landroid/util/Xml;->parse(Ljava/lang/String;Lorg/xml/sax/ContentHandler;)V
    :try_end_0
    .catch Lorg/xml/sax/SAXException; {:try_start_0 .. :try_end_0} :catch_0

    .line 39
    :goto_0
    iget-object v1, p0, Lcom/belkin/upnp/parser/GetAttributeResponseParser;->jsonArray:Lorg/json/JSONArray;

    return-object v1

    .line 35
    :catch_0
    move-exception v0

    .line 36
    .local v0, "e":Lorg/xml/sax/SAXException;
    invoke-virtual {v0}, Lorg/xml/sax/SAXException;->printStackTrace()V

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

    .line 45
    invoke-super {p0, p1, p2, p3, p4}, Lorg/xml/sax/helpers/DefaultHandler;->startElement(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lorg/xml/sax/Attributes;)V

    .line 46
    iget-object v0, p0, Lcom/belkin/upnp/parser/GetAttributeResponseParser;->ATTRIBUTE_MODE:Ljava/lang/String;

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 47
    iput-boolean v1, p0, Lcom/belkin/upnp/parser/GetAttributeResponseParser;->modeValue:Z

    .line 48
    new-instance v0, Lorg/json/JSONObject;

    invoke-direct {v0}, Lorg/json/JSONObject;-><init>()V

    iput-object v0, p0, Lcom/belkin/upnp/parser/GetAttributeResponseParser;->jsonObject:Lorg/json/JSONObject;

    .line 50
    :cond_0
    iget-object v0, p0, Lcom/belkin/upnp/parser/GetAttributeResponseParser;->ATTRIBUTE_MODETIME:Ljava/lang/String;

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 51
    iput-boolean v1, p0, Lcom/belkin/upnp/parser/GetAttributeResponseParser;->modeTimeValue:Z

    .line 53
    :cond_1
    iget-object v0, p0, Lcom/belkin/upnp/parser/GetAttributeResponseParser;->ATTRIBUTE_TIME_REMAINING:Ljava/lang/String;

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 54
    iput-boolean v1, p0, Lcom/belkin/upnp/parser/GetAttributeResponseParser;->timeRemainingValue:Z

    .line 56
    :cond_2
    return-void
.end method
