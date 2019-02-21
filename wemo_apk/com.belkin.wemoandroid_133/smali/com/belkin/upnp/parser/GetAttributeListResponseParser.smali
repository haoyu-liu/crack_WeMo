.class public Lcom/belkin/upnp/parser/GetAttributeListResponseParser;
.super Lorg/xml/sax/helpers/DefaultHandler;
.source "GetAttributeListResponseParser.java"


# static fields
.field private static TAG:Ljava/lang/String;


# instance fields
.field private jsonAllowedValueList:Lorg/json/JSONArray;

.field private jsonAttribute:Lorg/json/JSONObject;

.field private jsonAttributeList:Lorg/json/JSONObject;

.field private tmpValue:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 18
    const-string v0, "GetAttributeListResponseParser"

    sput-object v0, Lcom/belkin/upnp/parser/GetAttributeListResponseParser;->TAG:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .prologue
    .line 15
    invoke-direct {p0}, Lorg/xml/sax/helpers/DefaultHandler;-><init>()V

    .line 21
    new-instance v0, Lorg/json/JSONArray;

    invoke-direct {v0}, Lorg/json/JSONArray;-><init>()V

    iput-object v0, p0, Lcom/belkin/upnp/parser/GetAttributeListResponseParser;->jsonAllowedValueList:Lorg/json/JSONArray;

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
    .line 57
    new-instance v0, Ljava/lang/String;

    invoke-direct {v0, p1, p2, p3}, Ljava/lang/String;-><init>([CII)V

    iput-object v0, p0, Lcom/belkin/upnp/parser/GetAttributeListResponseParser;->tmpValue:Ljava/lang/String;

    .line 58
    return-void
.end method

.method public endElement(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 4
    .param p1, "uri"    # Ljava/lang/String;
    .param p2, "localName"    # Ljava/lang/String;
    .param p3, "elementName"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/xml/sax/SAXException;
        }
    .end annotation

    .prologue
    .line 64
    :try_start_0
    const-string v1, "attribute"

    invoke-virtual {p3, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 65
    iget-object v1, p0, Lcom/belkin/upnp/parser/GetAttributeListResponseParser;->jsonAttributeList:Lorg/json/JSONObject;

    iget-object v2, p0, Lcom/belkin/upnp/parser/GetAttributeListResponseParser;->jsonAttribute:Lorg/json/JSONObject;

    const-string v3, "name"

    invoke-virtual {v2, v3}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    iget-object v3, p0, Lcom/belkin/upnp/parser/GetAttributeListResponseParser;->jsonAttribute:Lorg/json/JSONObject;

    invoke-virtual {v1, v2, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 67
    :cond_0
    const-string v1, "name"

    invoke-virtual {p3, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 68
    iget-object v1, p0, Lcom/belkin/upnp/parser/GetAttributeListResponseParser;->jsonAttribute:Lorg/json/JSONObject;

    iget-object v2, p0, Lcom/belkin/upnp/parser/GetAttributeListResponseParser;->tmpValue:Ljava/lang/String;

    invoke-virtual {v1, p3, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 70
    :cond_1
    const-string v1, "dataType"

    invoke-virtual {p3, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_2

    .line 71
    iget-object v1, p0, Lcom/belkin/upnp/parser/GetAttributeListResponseParser;->jsonAttribute:Lorg/json/JSONObject;

    iget-object v2, p0, Lcom/belkin/upnp/parser/GetAttributeListResponseParser;->tmpValue:Ljava/lang/String;

    invoke-virtual {v1, p3, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 73
    :cond_2
    const-string v1, "defaultValue"

    invoke-virtual {p3, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_3

    .line 74
    iget-object v1, p0, Lcom/belkin/upnp/parser/GetAttributeListResponseParser;->jsonAttribute:Lorg/json/JSONObject;

    const-string v2, "value"

    iget-object v3, p0, Lcom/belkin/upnp/parser/GetAttributeListResponseParser;->tmpValue:Ljava/lang/String;

    invoke-virtual {v1, v2, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 76
    :cond_3
    const-string v1, "attrAccessType"

    invoke-virtual {p3, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_4

    .line 77
    iget-object v1, p0, Lcom/belkin/upnp/parser/GetAttributeListResponseParser;->jsonAttribute:Lorg/json/JSONObject;

    iget-object v2, p0, Lcom/belkin/upnp/parser/GetAttributeListResponseParser;->tmpValue:Ljava/lang/String;

    invoke-virtual {v1, p3, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 79
    :cond_4
    const-string v1, "allowedValue"

    invoke-virtual {p3, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_5

    .line 80
    iget-object v1, p0, Lcom/belkin/upnp/parser/GetAttributeListResponseParser;->jsonAllowedValueList:Lorg/json/JSONArray;

    iget-object v2, p0, Lcom/belkin/upnp/parser/GetAttributeListResponseParser;->tmpValue:Ljava/lang/String;

    invoke-virtual {v1, v2}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;

    .line 82
    :cond_5
    const-string v1, "allowedValueList"

    invoke-virtual {p3, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_6

    .line 83
    iget-object v1, p0, Lcom/belkin/upnp/parser/GetAttributeListResponseParser;->jsonAttribute:Lorg/json/JSONObject;

    iget-object v2, p0, Lcom/belkin/upnp/parser/GetAttributeListResponseParser;->jsonAllowedValueList:Lorg/json/JSONArray;

    invoke-virtual {v1, p3, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 88
    :cond_6
    :goto_0
    return-void

    .line 85
    :catch_0
    move-exception v0

    .line 86
    .local v0, "e":Lorg/json/JSONException;
    invoke-virtual {v0}, Lorg/json/JSONException;->printStackTrace()V

    goto :goto_0
.end method

.method public parseGetAttributeListRespone(Ljava/lang/String;)Lorg/json/JSONObject;
    .locals 4
    .param p1, "response"    # Ljava/lang/String;

    .prologue
    .line 26
    const-string v1, "&amp;lt;"

    const-string v2, "<"

    invoke-virtual {p1, v1, v2}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    .line 27
    const-string v1, "&amp;gt;"

    const-string v2, ">"

    invoke-virtual {p1, v1, v2}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    .line 28
    sget-object v1, Lcom/belkin/upnp/parser/GetAttributeListResponseParser;->TAG:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "GetAttributeListResponse str: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 30
    new-instance v1, Lorg/json/JSONObject;

    invoke-direct {v1}, Lorg/json/JSONObject;-><init>()V

    iput-object v1, p0, Lcom/belkin/upnp/parser/GetAttributeListResponseParser;->jsonAttributeList:Lorg/json/JSONObject;

    .line 34
    if-eqz p1, :cond_0

    .line 36
    :try_start_0
    invoke-static {p1, p0}, Landroid/util/Xml;->parse(Ljava/lang/String;Lorg/xml/sax/ContentHandler;)V
    :try_end_0
    .catch Lorg/xml/sax/SAXException; {:try_start_0 .. :try_end_0} :catch_0

    .line 44
    :cond_0
    :goto_0
    iget-object v1, p0, Lcom/belkin/upnp/parser/GetAttributeListResponseParser;->jsonAttributeList:Lorg/json/JSONObject;

    return-object v1

    .line 39
    :catch_0
    move-exception v0

    .line 41
    .local v0, "e":Lorg/xml/sax/SAXException;
    invoke-virtual {v0}, Lorg/xml/sax/SAXException;->printStackTrace()V

    goto :goto_0
.end method

.method public startElement(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lorg/xml/sax/Attributes;)V
    .locals 1
    .param p1, "uri"    # Ljava/lang/String;
    .param p2, "localName"    # Ljava/lang/String;
    .param p3, "elementName"    # Ljava/lang/String;
    .param p4, "attributes"    # Lorg/xml/sax/Attributes;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/xml/sax/SAXException;
        }
    .end annotation

    .prologue
    .line 50
    const-string v0, "attribute"

    invoke-virtual {p3, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 51
    new-instance v0, Lorg/json/JSONObject;

    invoke-direct {v0}, Lorg/json/JSONObject;-><init>()V

    iput-object v0, p0, Lcom/belkin/upnp/parser/GetAttributeListResponseParser;->jsonAttribute:Lorg/json/JSONObject;

    .line 53
    :cond_0
    return-void
.end method
