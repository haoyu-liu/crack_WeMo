.class public Lcom/belkin/upnp/parser/GetNotifyStatusResponseParser;
.super Lorg/xml/sax/helpers/DefaultHandler;
.source "GetNotifyStatusResponseParser.java"


# instance fields
.field private ATTRIBUTE:Ljava/lang/String;

.field private NOTIFY_CAPABILITYID:Ljava/lang/String;

.field private NOTIFY_DEVICEID:Ljava/lang/String;

.field private NOTIFY_VALUE:Ljava/lang/String;

.field private capabilityId:Z

.field private deviceId:Z

.field private jsonArray:Lorg/json/JSONArray;

.field private jsonObject:Lorg/json/JSONObject;

.field private processValue:Z

.field private value:Z


# direct methods
.method public constructor <init>()V
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 14
    invoke-direct {p0}, Lorg/xml/sax/helpers/DefaultHandler;-><init>()V

    .line 17
    const-string v0, "StateEvent"

    iput-object v0, p0, Lcom/belkin/upnp/parser/GetNotifyStatusResponseParser;->ATTRIBUTE:Ljava/lang/String;

    .line 18
    const-string v0, "DeviceID"

    iput-object v0, p0, Lcom/belkin/upnp/parser/GetNotifyStatusResponseParser;->NOTIFY_DEVICEID:Ljava/lang/String;

    .line 19
    const-string v0, "CapabilityId"

    iput-object v0, p0, Lcom/belkin/upnp/parser/GetNotifyStatusResponseParser;->NOTIFY_CAPABILITYID:Ljava/lang/String;

    .line 20
    const-string v0, "Value"

    iput-object v0, p0, Lcom/belkin/upnp/parser/GetNotifyStatusResponseParser;->NOTIFY_VALUE:Ljava/lang/String;

    .line 21
    iput-boolean v1, p0, Lcom/belkin/upnp/parser/GetNotifyStatusResponseParser;->processValue:Z

    .line 22
    iput-boolean v1, p0, Lcom/belkin/upnp/parser/GetNotifyStatusResponseParser;->deviceId:Z

    .line 23
    iput-boolean v1, p0, Lcom/belkin/upnp/parser/GetNotifyStatusResponseParser;->capabilityId:Z

    .line 24
    iput-boolean v1, p0, Lcom/belkin/upnp/parser/GetNotifyStatusResponseParser;->value:Z

    return-void
.end method


# virtual methods
.method public characters([CII)V
    .locals 5
    .param p1, "ch"    # [C
    .param p2, "start"    # I
    .param p3, "length"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/xml/sax/SAXException;
        }
    .end annotation

    .prologue
    .line 67
    invoke-super {p0, p1, p2, p3}, Lorg/xml/sax/helpers/DefaultHandler;->characters([CII)V

    .line 68
    const-string v1, ""

    .line 69
    .local v1, "tempStr":Ljava/lang/String;
    new-instance v1, Ljava/lang/String;

    .end local v1    # "tempStr":Ljava/lang/String;
    invoke-direct {v1, p1, p2, p3}, Ljava/lang/String;-><init>([CII)V

    .line 71
    .restart local v1    # "tempStr":Ljava/lang/String;
    :try_start_0
    iget-boolean v2, p0, Lcom/belkin/upnp/parser/GetNotifyStatusResponseParser;->processValue:Z

    if-eqz v2, :cond_2

    .line 72
    sget-object v2, Ljava/lang/System;->out:Ljava/io/PrintStream;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Status change response: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 73
    iget-boolean v2, p0, Lcom/belkin/upnp/parser/GetNotifyStatusResponseParser;->deviceId:Z

    if-eqz v2, :cond_0

    .line 74
    iget-object v2, p0, Lcom/belkin/upnp/parser/GetNotifyStatusResponseParser;->jsonObject:Lorg/json/JSONObject;

    sget-object v3, Lcom/belkin/wemo/cache/devicelist/JSONConstants;->NOTIFY_DEVICE_ID:Ljava/lang/String;

    invoke-virtual {v2, v3, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 75
    :cond_0
    iget-boolean v2, p0, Lcom/belkin/upnp/parser/GetNotifyStatusResponseParser;->capabilityId:Z

    if-eqz v2, :cond_1

    .line 76
    iget-object v2, p0, Lcom/belkin/upnp/parser/GetNotifyStatusResponseParser;->jsonObject:Lorg/json/JSONObject;

    sget-object v3, Lcom/belkin/wemo/cache/devicelist/JSONConstants;->NOTIFY_CAPABILITY_ID:Ljava/lang/String;

    invoke-virtual {v2, v3, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 77
    :cond_1
    iget-boolean v2, p0, Lcom/belkin/upnp/parser/GetNotifyStatusResponseParser;->value:Z

    if-eqz v2, :cond_2

    .line 78
    iget-object v2, p0, Lcom/belkin/upnp/parser/GetNotifyStatusResponseParser;->jsonObject:Lorg/json/JSONObject;

    sget-object v3, Lcom/belkin/wemo/cache/devicelist/JSONConstants;->NOTIFY_VALUE:Ljava/lang/String;

    invoke-virtual {v2, v3, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 86
    :cond_2
    :goto_0
    return-void

    .line 81
    :catch_0
    move-exception v0

    .line 83
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

    .line 91
    invoke-super {p0, p1, p2, p3}, Lorg/xml/sax/helpers/DefaultHandler;->endElement(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 92
    iget-object v0, p0, Lcom/belkin/upnp/parser/GetNotifyStatusResponseParser;->ATTRIBUTE:Ljava/lang/String;

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 93
    iput-boolean v2, p0, Lcom/belkin/upnp/parser/GetNotifyStatusResponseParser;->processValue:Z

    .line 94
    iget-object v0, p0, Lcom/belkin/upnp/parser/GetNotifyStatusResponseParser;->jsonArray:Lorg/json/JSONArray;

    iget-object v1, p0, Lcom/belkin/upnp/parser/GetNotifyStatusResponseParser;->jsonObject:Lorg/json/JSONObject;

    invoke-virtual {v0, v1}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;

    .line 96
    :cond_0
    iget-object v0, p0, Lcom/belkin/upnp/parser/GetNotifyStatusResponseParser;->NOTIFY_DEVICEID:Ljava/lang/String;

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 97
    iput-boolean v2, p0, Lcom/belkin/upnp/parser/GetNotifyStatusResponseParser;->deviceId:Z

    .line 98
    :cond_1
    iget-object v0, p0, Lcom/belkin/upnp/parser/GetNotifyStatusResponseParser;->NOTIFY_CAPABILITYID:Ljava/lang/String;

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 99
    iput-boolean v2, p0, Lcom/belkin/upnp/parser/GetNotifyStatusResponseParser;->capabilityId:Z

    .line 100
    :cond_2
    iget-object v0, p0, Lcom/belkin/upnp/parser/GetNotifyStatusResponseParser;->NOTIFY_VALUE:Ljava/lang/String;

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_3

    .line 101
    iput-boolean v2, p0, Lcom/belkin/upnp/parser/GetNotifyStatusResponseParser;->value:Z

    .line 103
    :cond_3
    return-void
.end method

.method public parseNotifyStatusResponse(Ljava/lang/String;)Lorg/json/JSONArray;
    .locals 2
    .param p1, "response"    # Ljava/lang/String;

    .prologue
    .line 34
    new-instance v1, Lorg/json/JSONArray;

    invoke-direct {v1}, Lorg/json/JSONArray;-><init>()V

    iput-object v1, p0, Lcom/belkin/upnp/parser/GetNotifyStatusResponseParser;->jsonArray:Lorg/json/JSONArray;

    .line 36
    :try_start_0
    invoke-static {p1, p0}, Landroid/util/Xml;->parse(Ljava/lang/String;Lorg/xml/sax/ContentHandler;)V
    :try_end_0
    .catch Lorg/xml/sax/SAXException; {:try_start_0 .. :try_end_0} :catch_0

    .line 41
    :goto_0
    iget-object v1, p0, Lcom/belkin/upnp/parser/GetNotifyStatusResponseParser;->jsonArray:Lorg/json/JSONArray;

    return-object v1

    .line 37
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

    .line 47
    invoke-super {p0, p1, p2, p3, p4}, Lorg/xml/sax/helpers/DefaultHandler;->startElement(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lorg/xml/sax/Attributes;)V

    .line 48
    iget-object v0, p0, Lcom/belkin/upnp/parser/GetNotifyStatusResponseParser;->ATTRIBUTE:Ljava/lang/String;

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 49
    iput-boolean v1, p0, Lcom/belkin/upnp/parser/GetNotifyStatusResponseParser;->processValue:Z

    .line 50
    new-instance v0, Lorg/json/JSONObject;

    invoke-direct {v0}, Lorg/json/JSONObject;-><init>()V

    iput-object v0, p0, Lcom/belkin/upnp/parser/GetNotifyStatusResponseParser;->jsonObject:Lorg/json/JSONObject;

    .line 52
    :cond_0
    iget-object v0, p0, Lcom/belkin/upnp/parser/GetNotifyStatusResponseParser;->NOTIFY_DEVICEID:Ljava/lang/String;

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 53
    iput-boolean v1, p0, Lcom/belkin/upnp/parser/GetNotifyStatusResponseParser;->deviceId:Z

    .line 55
    :cond_1
    iget-object v0, p0, Lcom/belkin/upnp/parser/GetNotifyStatusResponseParser;->NOTIFY_CAPABILITYID:Ljava/lang/String;

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 56
    iput-boolean v1, p0, Lcom/belkin/upnp/parser/GetNotifyStatusResponseParser;->capabilityId:Z

    .line 58
    :cond_2
    iget-object v0, p0, Lcom/belkin/upnp/parser/GetNotifyStatusResponseParser;->NOTIFY_VALUE:Ljava/lang/String;

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_3

    .line 59
    iput-boolean v1, p0, Lcom/belkin/upnp/parser/GetNotifyStatusResponseParser;->value:Z

    .line 62
    :cond_3
    return-void
.end method
