.class public Lcom/belkin/upnp/parser/RegistrationDataResponseParser;
.super Lorg/xml/sax/helpers/DefaultHandler;
.source "RegistrationDataResponseParser.java"


# static fields
.field public static final TAG:Ljava/lang/String; = "RegistrationDataResponseParser"


# instance fields
.field arpMac:Z

.field homeId:Z

.field jsonObject:Lorg/json/JSONObject;

.field registrationData:Z

.field registrationStatus:Z

.field smartPrivateKey:Z

.field statusCode:Z


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    const/4 v0, 0x0

    .line 14
    invoke-direct {p0}, Lorg/xml/sax/helpers/DefaultHandler;-><init>()V

    .line 17
    iput-boolean v0, p0, Lcom/belkin/upnp/parser/RegistrationDataResponseParser;->registrationData:Z

    .line 18
    iput-boolean v0, p0, Lcom/belkin/upnp/parser/RegistrationDataResponseParser;->homeId:Z

    .line 19
    iput-boolean v0, p0, Lcom/belkin/upnp/parser/RegistrationDataResponseParser;->smartPrivateKey:Z

    .line 20
    iput-boolean v0, p0, Lcom/belkin/upnp/parser/RegistrationDataResponseParser;->statusCode:Z

    .line 21
    iput-boolean v0, p0, Lcom/belkin/upnp/parser/RegistrationDataResponseParser;->registrationStatus:Z

    .line 22
    iput-boolean v0, p0, Lcom/belkin/upnp/parser/RegistrationDataResponseParser;->arpMac:Z

    .line 24
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/belkin/upnp/parser/RegistrationDataResponseParser;->jsonObject:Lorg/json/JSONObject;

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
    .line 77
    :try_start_0
    iget-boolean v1, p0, Lcom/belkin/upnp/parser/RegistrationDataResponseParser;->homeId:Z

    if-eqz v1, :cond_1

    .line 79
    iget-object v1, p0, Lcom/belkin/upnp/parser/RegistrationDataResponseParser;->jsonObject:Lorg/json/JSONObject;

    const-string v2, "homeId"

    new-instance v3, Ljava/lang/String;

    invoke-direct {v3, p1, p2, p3}, Ljava/lang/String;-><init>([CII)V

    invoke-virtual {v1, v2, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 80
    const/4 v1, 0x0

    iput-boolean v1, p0, Lcom/belkin/upnp/parser/RegistrationDataResponseParser;->homeId:Z

    .line 107
    :cond_0
    :goto_0
    return-void

    .line 82
    :cond_1
    iget-boolean v1, p0, Lcom/belkin/upnp/parser/RegistrationDataResponseParser;->smartPrivateKey:Z

    if-eqz v1, :cond_2

    .line 84
    iget-object v1, p0, Lcom/belkin/upnp/parser/RegistrationDataResponseParser;->jsonObject:Lorg/json/JSONObject;

    const-string v2, "privateKeyPhone"

    new-instance v3, Ljava/lang/String;

    invoke-direct {v3, p1, p2, p3}, Ljava/lang/String;-><init>([CII)V

    invoke-virtual {v1, v2, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 85
    const/4 v1, 0x0

    iput-boolean v1, p0, Lcom/belkin/upnp/parser/RegistrationDataResponseParser;->smartPrivateKey:Z
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 103
    :catch_0
    move-exception v0

    .line 104
    .local v0, "e":Lorg/json/JSONException;
    invoke-virtual {v0}, Lorg/json/JSONException;->printStackTrace()V

    goto :goto_0

    .line 87
    .end local v0    # "e":Lorg/json/JSONException;
    :cond_2
    :try_start_1
    iget-boolean v1, p0, Lcom/belkin/upnp/parser/RegistrationDataResponseParser;->statusCode:Z

    if-eqz v1, :cond_3

    .line 89
    iget-object v1, p0, Lcom/belkin/upnp/parser/RegistrationDataResponseParser;->jsonObject:Lorg/json/JSONObject;

    const-string v2, "statusCode"

    new-instance v3, Ljava/lang/String;

    invoke-direct {v3, p1, p2, p3}, Ljava/lang/String;-><init>([CII)V

    invoke-virtual {v1, v2, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 90
    const/4 v1, 0x0

    iput-boolean v1, p0, Lcom/belkin/upnp/parser/RegistrationDataResponseParser;->statusCode:Z

    goto :goto_0

    .line 92
    :cond_3
    iget-boolean v1, p0, Lcom/belkin/upnp/parser/RegistrationDataResponseParser;->registrationStatus:Z

    if-eqz v1, :cond_4

    .line 94
    iget-object v1, p0, Lcom/belkin/upnp/parser/RegistrationDataResponseParser;->jsonObject:Lorg/json/JSONObject;

    const-string v2, "registrationStatus"

    new-instance v3, Ljava/lang/String;

    invoke-direct {v3, p1, p2, p3}, Ljava/lang/String;-><init>([CII)V

    invoke-virtual {v1, v2, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 95
    const/4 v1, 0x0

    iput-boolean v1, p0, Lcom/belkin/upnp/parser/RegistrationDataResponseParser;->registrationStatus:Z

    goto :goto_0

    .line 97
    :cond_4
    iget-boolean v1, p0, Lcom/belkin/upnp/parser/RegistrationDataResponseParser;->arpMac:Z

    if-eqz v1, :cond_0

    .line 99
    iget-object v1, p0, Lcom/belkin/upnp/parser/RegistrationDataResponseParser;->jsonObject:Lorg/json/JSONObject;

    const-string v2, "arpMac"

    new-instance v3, Ljava/lang/String;

    invoke-direct {v3, p1, p2, p3}, Ljava/lang/String;-><init>([CII)V

    invoke-virtual {v1, v2, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 100
    const/4 v1, 0x0

    iput-boolean v1, p0, Lcom/belkin/upnp/parser/RegistrationDataResponseParser;->arpMac:Z
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

    .line 110
    const-string v0, "HomeId"

    invoke-virtual {p3, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 112
    iput-boolean v1, p0, Lcom/belkin/upnp/parser/RegistrationDataResponseParser;->homeId:Z

    .line 130
    :cond_0
    :goto_0
    return-void

    .line 114
    :cond_1
    const-string v0, "SmartPrivateKey"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 116
    iput-boolean v1, p0, Lcom/belkin/upnp/parser/RegistrationDataResponseParser;->smartPrivateKey:Z

    goto :goto_0

    .line 118
    :cond_2
    const-string v0, "StatusCode"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_3

    .line 120
    iput-boolean v1, p0, Lcom/belkin/upnp/parser/RegistrationDataResponseParser;->statusCode:Z

    goto :goto_0

    .line 122
    :cond_3
    const-string v0, "RegistrationStatus"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_4

    .line 124
    iput-boolean v1, p0, Lcom/belkin/upnp/parser/RegistrationDataResponseParser;->registrationStatus:Z

    goto :goto_0

    .line 126
    :cond_4
    const-string v0, "ArpMac"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 128
    iput-boolean v1, p0, Lcom/belkin/upnp/parser/RegistrationDataResponseParser;->arpMac:Z

    goto :goto_0
.end method

.method public parseResponse(Ljava/lang/String;)Lorg/json/JSONObject;
    .locals 4
    .param p1, "str"    # Ljava/lang/String;

    .prologue
    .line 28
    const-string v1, "&lt;"

    const-string v2, "<"

    invoke-virtual {p1, v1, v2}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    .line 29
    const-string v1, "&gt;"

    const-string v2, ">"

    invoke-virtual {p1, v1, v2}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    .line 30
    const-string v1, "RegistrationDataResponseParser"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "response str: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 31
    new-instance v1, Lorg/json/JSONObject;

    invoke-direct {v1}, Lorg/json/JSONObject;-><init>()V

    iput-object v1, p0, Lcom/belkin/upnp/parser/RegistrationDataResponseParser;->jsonObject:Lorg/json/JSONObject;

    .line 34
    if-eqz p1, :cond_0

    .line 36
    :try_start_0
    invoke-static {p1, p0}, Landroid/util/Xml;->parse(Ljava/lang/String;Lorg/xml/sax/ContentHandler;)V
    :try_end_0
    .catch Lorg/xml/sax/SAXException; {:try_start_0 .. :try_end_0} :catch_0

    .line 43
    :cond_0
    :goto_0
    const-string v1, "RegistrationDataResponseParser"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "jsonObject: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p0, Lcom/belkin/upnp/parser/RegistrationDataResponseParser;->jsonObject:Lorg/json/JSONObject;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 45
    iget-object v1, p0, Lcom/belkin/upnp/parser/RegistrationDataResponseParser;->jsonObject:Lorg/json/JSONObject;

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

    .line 51
    const-string v0, "HomeId"

    invoke-virtual {p3, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 53
    iput-boolean v1, p0, Lcom/belkin/upnp/parser/RegistrationDataResponseParser;->homeId:Z

    .line 71
    :cond_0
    :goto_0
    return-void

    .line 55
    :cond_1
    const-string v0, "SmartPrivateKey"

    invoke-virtual {p3, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 57
    iput-boolean v1, p0, Lcom/belkin/upnp/parser/RegistrationDataResponseParser;->smartPrivateKey:Z

    goto :goto_0

    .line 59
    :cond_2
    const-string v0, "StatusCode"

    invoke-virtual {p3, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_3

    .line 61
    iput-boolean v1, p0, Lcom/belkin/upnp/parser/RegistrationDataResponseParser;->statusCode:Z

    goto :goto_0

    .line 63
    :cond_3
    const-string v0, "RegistrationStatus"

    invoke-virtual {p3, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_4

    .line 65
    iput-boolean v1, p0, Lcom/belkin/upnp/parser/RegistrationDataResponseParser;->registrationStatus:Z

    goto :goto_0

    .line 67
    :cond_4
    const-string v0, "ArpMac"

    invoke-virtual {p3, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 69
    iput-boolean v1, p0, Lcom/belkin/upnp/parser/RegistrationDataResponseParser;->arpMac:Z

    goto :goto_0
.end method
