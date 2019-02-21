.class public Lcom/belkin/upnp/parser/RemoteAccessResponseParser;
.super Lorg/xml/sax/helpers/DefaultHandler;
.source "RemoteAccessResponseParser.java"


# instance fields
.field arpMac:Z

.field homeId:Z

.field jsonObject:Lorg/json/JSONObject;

.field object:Lcom/belkin/beans/RemoteAccessResponseBean;

.field privateKeyphone:Z

.field privateKeyplugin:Z

.field statusCode:Z


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    const/4 v0, 0x0

    .line 14
    invoke-direct {p0}, Lorg/xml/sax/helpers/DefaultHandler;-><init>()V

    .line 17
    iput-boolean v0, p0, Lcom/belkin/upnp/parser/RemoteAccessResponseParser;->privateKeyplugin:Z

    .line 18
    iput-boolean v0, p0, Lcom/belkin/upnp/parser/RemoteAccessResponseParser;->privateKeyphone:Z

    .line 19
    iput-boolean v0, p0, Lcom/belkin/upnp/parser/RemoteAccessResponseParser;->homeId:Z

    .line 20
    iput-boolean v0, p0, Lcom/belkin/upnp/parser/RemoteAccessResponseParser;->statusCode:Z

    .line 21
    iput-boolean v0, p0, Lcom/belkin/upnp/parser/RemoteAccessResponseParser;->arpMac:Z

    .line 22
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/belkin/upnp/parser/RemoteAccessResponseParser;->object:Lcom/belkin/beans/RemoteAccessResponseBean;

    .line 23
    new-instance v0, Lorg/json/JSONObject;

    invoke-direct {v0}, Lorg/json/JSONObject;-><init>()V

    iput-object v0, p0, Lcom/belkin/upnp/parser/RemoteAccessResponseParser;->jsonObject:Lorg/json/JSONObject;

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
    .line 74
    :try_start_0
    iget-boolean v1, p0, Lcom/belkin/upnp/parser/RemoteAccessResponseParser;->privateKeyplugin:Z

    if-eqz v1, :cond_1

    .line 77
    iget-object v1, p0, Lcom/belkin/upnp/parser/RemoteAccessResponseParser;->jsonObject:Lorg/json/JSONObject;

    const-string v2, "privateKeyPlugIn"

    new-instance v3, Ljava/lang/String;

    invoke-direct {v3, p1, p2, p3}, Ljava/lang/String;-><init>([CII)V

    invoke-virtual {v1, v2, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 78
    const/4 v1, 0x0

    iput-boolean v1, p0, Lcom/belkin/upnp/parser/RemoteAccessResponseParser;->privateKeyplugin:Z

    .line 108
    :cond_0
    :goto_0
    return-void

    .line 80
    :cond_1
    iget-boolean v1, p0, Lcom/belkin/upnp/parser/RemoteAccessResponseParser;->privateKeyphone:Z

    if-eqz v1, :cond_2

    .line 83
    iget-object v1, p0, Lcom/belkin/upnp/parser/RemoteAccessResponseParser;->jsonObject:Lorg/json/JSONObject;

    const-string v2, "privateKeyPhone"

    new-instance v3, Ljava/lang/String;

    invoke-direct {v3, p1, p2, p3}, Ljava/lang/String;-><init>([CII)V

    invoke-virtual {v1, v2, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 84
    const/4 v1, 0x0

    iput-boolean v1, p0, Lcom/belkin/upnp/parser/RemoteAccessResponseParser;->privateKeyphone:Z
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 104
    :catch_0
    move-exception v0

    .line 105
    .local v0, "e":Lorg/json/JSONException;
    invoke-virtual {v0}, Lorg/json/JSONException;->printStackTrace()V

    goto :goto_0

    .line 86
    .end local v0    # "e":Lorg/json/JSONException;
    :cond_2
    :try_start_1
    iget-boolean v1, p0, Lcom/belkin/upnp/parser/RemoteAccessResponseParser;->homeId:Z

    if-eqz v1, :cond_3

    .line 89
    iget-object v1, p0, Lcom/belkin/upnp/parser/RemoteAccessResponseParser;->jsonObject:Lorg/json/JSONObject;

    const-string v2, "homeId"

    new-instance v3, Ljava/lang/String;

    invoke-direct {v3, p1, p2, p3}, Ljava/lang/String;-><init>([CII)V

    invoke-virtual {v1, v2, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 90
    const/4 v1, 0x0

    iput-boolean v1, p0, Lcom/belkin/upnp/parser/RemoteAccessResponseParser;->homeId:Z

    goto :goto_0

    .line 92
    :cond_3
    iget-boolean v1, p0, Lcom/belkin/upnp/parser/RemoteAccessResponseParser;->statusCode:Z

    if-eqz v1, :cond_4

    .line 95
    iget-object v1, p0, Lcom/belkin/upnp/parser/RemoteAccessResponseParser;->jsonObject:Lorg/json/JSONObject;

    const-string v2, "statusCode"

    new-instance v3, Ljava/lang/String;

    invoke-direct {v3, p1, p2, p3}, Ljava/lang/String;-><init>([CII)V

    invoke-virtual {v1, v2, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 96
    const/4 v1, 0x0

    iput-boolean v1, p0, Lcom/belkin/upnp/parser/RemoteAccessResponseParser;->statusCode:Z

    goto :goto_0

    .line 98
    :cond_4
    iget-boolean v1, p0, Lcom/belkin/upnp/parser/RemoteAccessResponseParser;->arpMac:Z

    if-eqz v1, :cond_0

    .line 100
    iget-object v1, p0, Lcom/belkin/upnp/parser/RemoteAccessResponseParser;->jsonObject:Lorg/json/JSONObject;

    const-string v2, "arpMac"

    new-instance v3, Ljava/lang/String;

    invoke-direct {v3, p1, p2, p3}, Ljava/lang/String;-><init>([CII)V

    invoke-virtual {v1, v2, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 101
    const/4 v1, 0x0

    iput-boolean v1, p0, Lcom/belkin/upnp/parser/RemoteAccessResponseParser;->arpMac:Z
    :try_end_1
    .catch Lorg/json/JSONException; {:try_start_1 .. :try_end_1} :catch_0

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

    .line 113
    const-string v0, "statusCode"

    invoke-virtual {p3, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 115
    iput-boolean v1, p0, Lcom/belkin/upnp/parser/RemoteAccessResponseParser;->statusCode:Z

    .line 133
    :cond_0
    :goto_0
    return-void

    .line 117
    :cond_1
    const-string v0, "pluginprivateKey"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 119
    iput-boolean v1, p0, Lcom/belkin/upnp/parser/RemoteAccessResponseParser;->privateKeyplugin:Z

    goto :goto_0

    .line 121
    :cond_2
    const-string v0, "smartprivateKey"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_3

    .line 123
    iput-boolean v1, p0, Lcom/belkin/upnp/parser/RemoteAccessResponseParser;->privateKeyphone:Z

    goto :goto_0

    .line 125
    :cond_3
    const-string v0, "homeId"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_4

    .line 127
    iput-boolean v1, p0, Lcom/belkin/upnp/parser/RemoteAccessResponseParser;->homeId:Z

    goto :goto_0

    .line 129
    :cond_4
    const-string v0, "ArpMac"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 131
    iput-boolean v1, p0, Lcom/belkin/upnp/parser/RemoteAccessResponseParser;->arpMac:Z

    goto :goto_0
.end method

.method public parseRemoteAccessRespone(Ljava/lang/String;)Lorg/json/JSONObject;
    .locals 2
    .param p1, "response"    # Ljava/lang/String;

    .prologue
    .line 28
    new-instance v1, Lorg/json/JSONObject;

    invoke-direct {v1}, Lorg/json/JSONObject;-><init>()V

    iput-object v1, p0, Lcom/belkin/upnp/parser/RemoteAccessResponseParser;->jsonObject:Lorg/json/JSONObject;

    .line 31
    if-eqz p1, :cond_0

    .line 33
    :try_start_0
    invoke-static {p1, p0}, Landroid/util/Xml;->parse(Ljava/lang/String;Lorg/xml/sax/ContentHandler;)V
    :try_end_0
    .catch Lorg/xml/sax/SAXException; {:try_start_0 .. :try_end_0} :catch_0

    .line 42
    :cond_0
    :goto_0
    iget-object v1, p0, Lcom/belkin/upnp/parser/RemoteAccessResponseParser;->jsonObject:Lorg/json/JSONObject;

    return-object v1

    .line 36
    :catch_0
    move-exception v0

    .line 38
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

    .line 48
    const-string v0, "pluginprivateKey"

    invoke-virtual {p3, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 50
    iput-boolean v1, p0, Lcom/belkin/upnp/parser/RemoteAccessResponseParser;->privateKeyplugin:Z

    .line 68
    :cond_0
    :goto_0
    return-void

    .line 52
    :cond_1
    const-string v0, "smartprivateKey"

    invoke-virtual {p3, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 54
    iput-boolean v1, p0, Lcom/belkin/upnp/parser/RemoteAccessResponseParser;->privateKeyphone:Z

    goto :goto_0

    .line 56
    :cond_2
    const-string v0, "homeId"

    invoke-virtual {p3, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_3

    .line 58
    iput-boolean v1, p0, Lcom/belkin/upnp/parser/RemoteAccessResponseParser;->homeId:Z

    goto :goto_0

    .line 60
    :cond_3
    const-string v0, "statusCode"

    invoke-virtual {p3, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_4

    .line 62
    iput-boolean v1, p0, Lcom/belkin/upnp/parser/RemoteAccessResponseParser;->statusCode:Z

    goto :goto_0

    .line 64
    :cond_4
    const-string v0, "ArpMac"

    invoke-virtual {p3, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 66
    iput-boolean v1, p0, Lcom/belkin/upnp/parser/RemoteAccessResponseParser;->arpMac:Z

    goto :goto_0
.end method
