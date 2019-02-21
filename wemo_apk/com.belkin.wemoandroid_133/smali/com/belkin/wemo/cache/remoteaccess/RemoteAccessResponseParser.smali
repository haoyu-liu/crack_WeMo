.class public Lcom/belkin/wemo/cache/remoteaccess/RemoteAccessResponseParser;
.super Lorg/xml/sax/helpers/DefaultHandler;
.source "RemoteAccessResponseParser.java"


# instance fields
.field homeId:Z

.field jsonObject:Lorg/json/JSONObject;

.field object:Lcom/belkin/wemo/cache/remoteaccess/RemoteAccessResponseBean;

.field privateKeyphone:Z

.field privateKeyplugin:Z

.field statusCode:Z


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    const/4 v0, 0x0

    .line 13
    invoke-direct {p0}, Lorg/xml/sax/helpers/DefaultHandler;-><init>()V

    .line 16
    iput-boolean v0, p0, Lcom/belkin/wemo/cache/remoteaccess/RemoteAccessResponseParser;->privateKeyplugin:Z

    .line 17
    iput-boolean v0, p0, Lcom/belkin/wemo/cache/remoteaccess/RemoteAccessResponseParser;->privateKeyphone:Z

    .line 18
    iput-boolean v0, p0, Lcom/belkin/wemo/cache/remoteaccess/RemoteAccessResponseParser;->homeId:Z

    .line 19
    iput-boolean v0, p0, Lcom/belkin/wemo/cache/remoteaccess/RemoteAccessResponseParser;->statusCode:Z

    .line 21
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/belkin/wemo/cache/remoteaccess/RemoteAccessResponseParser;->object:Lcom/belkin/wemo/cache/remoteaccess/RemoteAccessResponseBean;

    .line 22
    new-instance v0, Lorg/json/JSONObject;

    invoke-direct {v0}, Lorg/json/JSONObject;-><init>()V

    iput-object v0, p0, Lcom/belkin/wemo/cache/remoteaccess/RemoteAccessResponseParser;->jsonObject:Lorg/json/JSONObject;

    return-void
.end method


# virtual methods
.method public characters([CII)V
    .locals 3
    .param p1, "ch"    # [C
    .param p2, "start"    # I
    .param p3, "length"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/xml/sax/SAXException;
        }
    .end annotation

    .prologue
    .line 69
    :try_start_0
    iget-boolean v0, p0, Lcom/belkin/wemo/cache/remoteaccess/RemoteAccessResponseParser;->privateKeyplugin:Z

    if-eqz v0, :cond_0

    .line 72
    iget-object v0, p0, Lcom/belkin/wemo/cache/remoteaccess/RemoteAccessResponseParser;->jsonObject:Lorg/json/JSONObject;

    const-string v1, "privateKeyPlugIn"

    new-instance v2, Ljava/lang/String;

    invoke-direct {v2, p1, p2, p3}, Ljava/lang/String;-><init>([CII)V

    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 73
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/belkin/wemo/cache/remoteaccess/RemoteAccessResponseParser;->privateKeyplugin:Z

    .line 75
    :cond_0
    iget-boolean v0, p0, Lcom/belkin/wemo/cache/remoteaccess/RemoteAccessResponseParser;->privateKeyphone:Z

    if-eqz v0, :cond_1

    .line 78
    iget-object v0, p0, Lcom/belkin/wemo/cache/remoteaccess/RemoteAccessResponseParser;->jsonObject:Lorg/json/JSONObject;

    const-string v1, "privateKeyPhone"

    new-instance v2, Ljava/lang/String;

    invoke-direct {v2, p1, p2, p3}, Ljava/lang/String;-><init>([CII)V

    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 79
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/belkin/wemo/cache/remoteaccess/RemoteAccessResponseParser;->privateKeyphone:Z

    .line 81
    :cond_1
    iget-boolean v0, p0, Lcom/belkin/wemo/cache/remoteaccess/RemoteAccessResponseParser;->homeId:Z

    if-eqz v0, :cond_2

    .line 84
    iget-object v0, p0, Lcom/belkin/wemo/cache/remoteaccess/RemoteAccessResponseParser;->jsonObject:Lorg/json/JSONObject;

    const-string v1, "homeId"

    new-instance v2, Ljava/lang/String;

    invoke-direct {v2, p1, p2, p3}, Ljava/lang/String;-><init>([CII)V

    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 85
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/belkin/wemo/cache/remoteaccess/RemoteAccessResponseParser;->homeId:Z

    .line 87
    :cond_2
    iget-boolean v0, p0, Lcom/belkin/wemo/cache/remoteaccess/RemoteAccessResponseParser;->statusCode:Z

    if-eqz v0, :cond_3

    .line 90
    iget-object v0, p0, Lcom/belkin/wemo/cache/remoteaccess/RemoteAccessResponseParser;->jsonObject:Lorg/json/JSONObject;

    const-string v1, "statusCode"

    new-instance v2, Ljava/lang/String;

    invoke-direct {v2, p1, p2, p3}, Ljava/lang/String;-><init>([CII)V

    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 91
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/belkin/wemo/cache/remoteaccess/RemoteAccessResponseParser;->statusCode:Z
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 98
    :cond_3
    :goto_0
    return-void

    .line 94
    :catch_0
    move-exception v0

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

    .line 103
    const-string v0, "statusCode"

    invoke-virtual {p3, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 105
    iput-boolean v1, p0, Lcom/belkin/wemo/cache/remoteaccess/RemoteAccessResponseParser;->statusCode:Z

    .line 107
    :cond_0
    const-string v0, "pluginprivateKey"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 109
    iput-boolean v1, p0, Lcom/belkin/wemo/cache/remoteaccess/RemoteAccessResponseParser;->privateKeyplugin:Z

    .line 111
    :cond_1
    const-string v0, "smartprivateKey"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 113
    iput-boolean v1, p0, Lcom/belkin/wemo/cache/remoteaccess/RemoteAccessResponseParser;->privateKeyphone:Z

    .line 115
    :cond_2
    const-string v0, "homeId"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_3

    .line 117
    iput-boolean v1, p0, Lcom/belkin/wemo/cache/remoteaccess/RemoteAccessResponseParser;->homeId:Z

    .line 119
    :cond_3
    return-void
.end method

.method public parseRemoteAccessRespone(Ljava/lang/String;)Lorg/json/JSONObject;
    .locals 2
    .param p1, "response"    # Ljava/lang/String;

    .prologue
    .line 27
    new-instance v1, Lorg/json/JSONObject;

    invoke-direct {v1}, Lorg/json/JSONObject;-><init>()V

    iput-object v1, p0, Lcom/belkin/wemo/cache/remoteaccess/RemoteAccessResponseParser;->jsonObject:Lorg/json/JSONObject;

    .line 30
    if-eqz p1, :cond_0

    .line 32
    :try_start_0
    invoke-static {p1, p0}, Landroid/util/Xml;->parse(Ljava/lang/String;Lorg/xml/sax/ContentHandler;)V
    :try_end_0
    .catch Lorg/xml/sax/SAXException; {:try_start_0 .. :try_end_0} :catch_0

    .line 41
    :cond_0
    :goto_0
    iget-object v1, p0, Lcom/belkin/wemo/cache/remoteaccess/RemoteAccessResponseParser;->jsonObject:Lorg/json/JSONObject;

    return-object v1

    .line 35
    :catch_0
    move-exception v0

    .line 37
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

    .line 47
    const-string v0, "pluginprivateKey"

    invoke-virtual {p3, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 49
    iput-boolean v1, p0, Lcom/belkin/wemo/cache/remoteaccess/RemoteAccessResponseParser;->privateKeyplugin:Z

    .line 51
    :cond_0
    const-string v0, "smartprivateKey"

    invoke-virtual {p3, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 53
    iput-boolean v1, p0, Lcom/belkin/wemo/cache/remoteaccess/RemoteAccessResponseParser;->privateKeyphone:Z

    .line 55
    :cond_1
    const-string v0, "homeId"

    invoke-virtual {p3, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 57
    iput-boolean v1, p0, Lcom/belkin/wemo/cache/remoteaccess/RemoteAccessResponseParser;->homeId:Z

    .line 59
    :cond_2
    const-string v0, "statusCode"

    invoke-virtual {p3, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_3

    .line 61
    iput-boolean v1, p0, Lcom/belkin/wemo/cache/remoteaccess/RemoteAccessResponseParser;->statusCode:Z

    .line 63
    :cond_3
    return-void
.end method
