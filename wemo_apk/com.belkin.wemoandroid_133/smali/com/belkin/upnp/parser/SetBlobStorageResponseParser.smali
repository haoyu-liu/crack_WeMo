.class public Lcom/belkin/upnp/parser/SetBlobStorageResponseParser;
.super Lorg/xml/sax/helpers/DefaultHandler;
.source "SetBlobStorageResponseParser.java"


# instance fields
.field private jsonAttribute:Lorg/json/JSONObject;

.field private tmpValue:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 13
    invoke-direct {p0}, Lorg/xml/sax/helpers/DefaultHandler;-><init>()V

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
    .line 37
    new-instance v0, Ljava/lang/String;

    invoke-direct {v0, p1, p2, p3}, Ljava/lang/String;-><init>([CII)V

    iput-object v0, p0, Lcom/belkin/upnp/parser/SetBlobStorageResponseParser;->tmpValue:Ljava/lang/String;

    .line 39
    return-void
.end method

.method public endElement(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 3
    .param p1, "uri"    # Ljava/lang/String;
    .param p2, "localName"    # Ljava/lang/String;
    .param p3, "elementName"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/xml/sax/SAXException;
        }
    .end annotation

    .prologue
    .line 44
    const-string v1, "attributeList"

    invoke-virtual {p3, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 47
    :try_start_0
    iget-object v1, p0, Lcom/belkin/upnp/parser/SetBlobStorageResponseParser;->tmpValue:Ljava/lang/String;

    const-string v2, "0"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 48
    iget-object v1, p0, Lcom/belkin/upnp/parser/SetBlobStorageResponseParser;->jsonAttribute:Lorg/json/JSONObject;

    const/4 v2, 0x1

    invoke-virtual {v1, p3, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Z)Lorg/json/JSONObject;

    .line 56
    :cond_0
    :goto_0
    return-void

    .line 50
    :cond_1
    iget-object v1, p0, Lcom/belkin/upnp/parser/SetBlobStorageResponseParser;->jsonAttribute:Lorg/json/JSONObject;

    const/4 v2, 0x0

    invoke-virtual {v1, p3, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Z)Lorg/json/JSONObject;
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 51
    :catch_0
    move-exception v0

    .line 52
    .local v0, "e":Lorg/json/JSONException;
    invoke-virtual {v0}, Lorg/json/JSONException;->printStackTrace()V

    goto :goto_0
.end method

.method public parseSetlobStorageRespone(Ljava/lang/String;)Lorg/json/JSONObject;
    .locals 2
    .param p1, "response"    # Ljava/lang/String;

    .prologue
    .line 20
    new-instance v1, Lorg/json/JSONObject;

    invoke-direct {v1}, Lorg/json/JSONObject;-><init>()V

    iput-object v1, p0, Lcom/belkin/upnp/parser/SetBlobStorageResponseParser;->jsonAttribute:Lorg/json/JSONObject;

    .line 23
    if-eqz p1, :cond_0

    .line 25
    :try_start_0
    invoke-static {p1, p0}, Landroid/util/Xml;->parse(Ljava/lang/String;Lorg/xml/sax/ContentHandler;)V
    :try_end_0
    .catch Lorg/xml/sax/SAXException; {:try_start_0 .. :try_end_0} :catch_0

    .line 32
    :cond_0
    :goto_0
    iget-object v1, p0, Lcom/belkin/upnp/parser/SetBlobStorageResponseParser;->jsonAttribute:Lorg/json/JSONObject;

    return-object v1

    .line 28
    :catch_0
    move-exception v0

    .line 30
    .local v0, "e":Lorg/xml/sax/SAXException;
    invoke-virtual {v0}, Lorg/xml/sax/SAXException;->printStackTrace()V

    goto :goto_0
.end method
