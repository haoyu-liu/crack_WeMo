.class public Lcom/belkin/upnp/parser/GetDeviceCapabilitiesResponse;
.super Lorg/xml/sax/helpers/DefaultHandler;
.source "GetDeviceCapabilitiesResponse.java"


# instance fields
.field private capabilitiesIds:Z

.field private deviceCapability:Z

.field private deviceId:Z

.field private jsonArr:Lorg/json/JSONArray;

.field private jsonObject:Lorg/json/JSONObject;

.field private parentTag:Z

.field private responseBuffer:Ljava/lang/StringBuffer;

.field private tempVal:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    const/4 v0, 0x0

    .line 14
    invoke-direct {p0}, Lorg/xml/sax/helpers/DefaultHandler;-><init>()V

    .line 16
    iput-boolean v0, p0, Lcom/belkin/upnp/parser/GetDeviceCapabilitiesResponse;->parentTag:Z

    .line 19
    iput-boolean v0, p0, Lcom/belkin/upnp/parser/GetDeviceCapabilitiesResponse;->deviceCapability:Z

    .line 22
    iput-boolean v0, p0, Lcom/belkin/upnp/parser/GetDeviceCapabilitiesResponse;->deviceId:Z

    .line 23
    iput-boolean v0, p0, Lcom/belkin/upnp/parser/GetDeviceCapabilitiesResponse;->capabilitiesIds:Z

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
    .line 79
    invoke-super {p0, p1, p2, p3}, Lorg/xml/sax/helpers/DefaultHandler;->characters([CII)V

    .line 80
    iget-boolean v1, p0, Lcom/belkin/upnp/parser/GetDeviceCapabilitiesResponse;->parentTag:Z

    const/4 v2, 0x1

    if-ne v1, v2, :cond_0

    .line 81
    const/4 v1, 0x0

    aget-char v1, p1, v1

    const/16 v2, 0xa

    if-eq v1, v2, :cond_0

    .line 82
    iget-object v1, p0, Lcom/belkin/upnp/parser/GetDeviceCapabilitiesResponse;->responseBuffer:Ljava/lang/StringBuffer;

    new-instance v2, Ljava/lang/String;

    invoke-direct {v2, p1, p2, p3}, Ljava/lang/String;-><init>([CII)V

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 85
    :cond_0
    new-instance v1, Ljava/lang/String;

    invoke-direct {v1, p1, p2, p3}, Ljava/lang/String;-><init>([CII)V

    iput-object v1, p0, Lcom/belkin/upnp/parser/GetDeviceCapabilitiesResponse;->tempVal:Ljava/lang/String;

    .line 88
    :try_start_0
    iget-boolean v1, p0, Lcom/belkin/upnp/parser/GetDeviceCapabilitiesResponse;->deviceId:Z

    if-eqz v1, :cond_1

    .line 89
    iget-object v1, p0, Lcom/belkin/upnp/parser/GetDeviceCapabilitiesResponse;->jsonObject:Lorg/json/JSONObject;

    const-string v2, "deviceid"

    iget-object v3, p0, Lcom/belkin/upnp/parser/GetDeviceCapabilitiesResponse;->tempVal:Ljava/lang/String;

    invoke-virtual {v1, v2, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 90
    :cond_1
    iget-boolean v1, p0, Lcom/belkin/upnp/parser/GetDeviceCapabilitiesResponse;->capabilitiesIds:Z

    if-eqz v1, :cond_2

    .line 91
    iget-object v1, p0, Lcom/belkin/upnp/parser/GetDeviceCapabilitiesResponse;->jsonObject:Lorg/json/JSONObject;

    const-string v2, "deviceCapabilityIds"

    iget-object v3, p0, Lcom/belkin/upnp/parser/GetDeviceCapabilitiesResponse;->tempVal:Ljava/lang/String;

    invoke-virtual {v1, v2, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 98
    :cond_2
    :goto_0
    return-void

    .line 93
    :catch_0
    move-exception v0

    .line 95
    .local v0, "e":Lorg/json/JSONException;
    invoke-virtual {v0}, Lorg/json/JSONException;->printStackTrace()V

    goto :goto_0
.end method

.method public endElement(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 3
    .param p1, "uri"    # Ljava/lang/String;
    .param p2, "localName"    # Ljava/lang/String;
    .param p3, "qName"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/xml/sax/SAXException;
        }
    .end annotation

    .prologue
    const/4 v2, 0x0

    .line 103
    invoke-super {p0, p1, p2, p3}, Lorg/xml/sax/helpers/DefaultHandler;->endElement(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 105
    const-string v0, "CapabilityProfileList"

    invoke-virtual {p3, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 106
    iput-boolean v2, p0, Lcom/belkin/upnp/parser/GetDeviceCapabilitiesResponse;->parentTag:Z

    .line 108
    :cond_0
    const-string v0, "DeviceCapability"

    invoke-virtual {p3, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 109
    iput-boolean v2, p0, Lcom/belkin/upnp/parser/GetDeviceCapabilitiesResponse;->deviceCapability:Z

    .line 110
    iget-object v0, p0, Lcom/belkin/upnp/parser/GetDeviceCapabilitiesResponse;->jsonArr:Lorg/json/JSONArray;

    iget-object v1, p0, Lcom/belkin/upnp/parser/GetDeviceCapabilitiesResponse;->jsonObject:Lorg/json/JSONObject;

    invoke-virtual {v0, v1}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;

    .line 112
    :cond_1
    const-string v0, "DeviceID"

    invoke-virtual {p3, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 113
    iput-boolean v2, p0, Lcom/belkin/upnp/parser/GetDeviceCapabilitiesResponse;->deviceId:Z

    .line 115
    :cond_2
    const-string v0, "CapabilityIDs"

    invoke-virtual {p3, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_3

    .line 116
    iput-boolean v2, p0, Lcom/belkin/upnp/parser/GetDeviceCapabilitiesResponse;->capabilitiesIds:Z

    .line 118
    :cond_3
    return-void
.end method

.method public parseForDeviceCapabilitiesList(Ljava/lang/String;)Lorg/json/JSONArray;
    .locals 5
    .param p1, "response"    # Ljava/lang/String;

    .prologue
    .line 37
    new-instance v2, Lorg/json/JSONObject;

    invoke-direct {v2}, Lorg/json/JSONObject;-><init>()V

    iput-object v2, p0, Lcom/belkin/upnp/parser/GetDeviceCapabilitiesResponse;->jsonObject:Lorg/json/JSONObject;

    .line 38
    new-instance v2, Lorg/json/JSONArray;

    invoke-direct {v2}, Lorg/json/JSONArray;-><init>()V

    iput-object v2, p0, Lcom/belkin/upnp/parser/GetDeviceCapabilitiesResponse;->jsonArr:Lorg/json/JSONArray;

    .line 39
    new-instance v2, Ljava/lang/StringBuffer;

    invoke-direct {v2}, Ljava/lang/StringBuffer;-><init>()V

    iput-object v2, p0, Lcom/belkin/upnp/parser/GetDeviceCapabilitiesResponse;->responseBuffer:Ljava/lang/StringBuffer;

    .line 41
    :try_start_0
    invoke-static {p1, p0}, Landroid/util/Xml;->parse(Ljava/lang/String;Lorg/xml/sax/ContentHandler;)V
    :try_end_0
    .catch Lorg/xml/sax/SAXException; {:try_start_0 .. :try_end_0} :catch_0

    .line 45
    :goto_0
    new-instance v1, Ljava/lang/String;

    iget-object v2, p0, Lcom/belkin/upnp/parser/GetDeviceCapabilitiesResponse;->responseBuffer:Ljava/lang/StringBuffer;

    invoke-direct {v1, v2}, Ljava/lang/String;-><init>(Ljava/lang/StringBuffer;)V

    .line 46
    .local v1, "parsedResponse":Ljava/lang/String;
    sget-object v2, Ljava/lang/System;->out:Ljava/io/PrintStream;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "RESPONSE AFTER REPLACE*******"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 48
    :try_start_1
    invoke-static {v1, p0}, Landroid/util/Xml;->parse(Ljava/lang/String;Lorg/xml/sax/ContentHandler;)V
    :try_end_1
    .catch Lorg/xml/sax/SAXException; {:try_start_1 .. :try_end_1} :catch_1

    .line 53
    :goto_1
    iget-object v2, p0, Lcom/belkin/upnp/parser/GetDeviceCapabilitiesResponse;->jsonArr:Lorg/json/JSONArray;

    return-object v2

    .line 42
    .end local v1    # "parsedResponse":Ljava/lang/String;
    :catch_0
    move-exception v0

    .line 43
    .local v0, "e":Lorg/xml/sax/SAXException;
    invoke-virtual {v0}, Lorg/xml/sax/SAXException;->printStackTrace()V

    goto :goto_0

    .line 49
    .end local v0    # "e":Lorg/xml/sax/SAXException;
    .restart local v1    # "parsedResponse":Ljava/lang/String;
    :catch_1
    move-exception v0

    .line 50
    .restart local v0    # "e":Lorg/xml/sax/SAXException;
    invoke-virtual {v0}, Lorg/xml/sax/SAXException;->printStackTrace()V

    goto :goto_1
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

    .line 58
    invoke-super {p0, p1, p2, p3, p4}, Lorg/xml/sax/helpers/DefaultHandler;->startElement(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lorg/xml/sax/Attributes;)V

    .line 60
    const-string v0, "DeviceCapabilities"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 61
    iput-boolean v1, p0, Lcom/belkin/upnp/parser/GetDeviceCapabilitiesResponse;->parentTag:Z

    .line 63
    :cond_0
    const-string v0, "DeviceCapability"

    invoke-virtual {p3, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 64
    iput-boolean v1, p0, Lcom/belkin/upnp/parser/GetDeviceCapabilitiesResponse;->deviceCapability:Z

    .line 65
    new-instance v0, Lorg/json/JSONObject;

    invoke-direct {v0}, Lorg/json/JSONObject;-><init>()V

    iput-object v0, p0, Lcom/belkin/upnp/parser/GetDeviceCapabilitiesResponse;->jsonObject:Lorg/json/JSONObject;

    .line 67
    :cond_1
    const-string v0, "DeviceID"

    invoke-virtual {p3, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 68
    iput-boolean v1, p0, Lcom/belkin/upnp/parser/GetDeviceCapabilitiesResponse;->deviceId:Z

    .line 70
    :cond_2
    const-string v0, "CapabilityIDs"

    invoke-virtual {p3, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_3

    .line 71
    iput-boolean v1, p0, Lcom/belkin/upnp/parser/GetDeviceCapabilitiesResponse;->capabilitiesIds:Z

    .line 74
    :cond_3
    return-void
.end method
