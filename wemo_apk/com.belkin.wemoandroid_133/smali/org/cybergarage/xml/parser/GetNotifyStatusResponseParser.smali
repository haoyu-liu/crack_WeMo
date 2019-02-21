.class public Lorg/cybergarage/xml/parser/GetNotifyStatusResponseParser;
.super Lorg/xml/sax/helpers/DefaultHandler;
.source "GetNotifyStatusResponseParser.java"


# static fields
.field private static final STATUS_TS_TAG:Ljava/lang/String; = "statusTS"


# instance fields
.field private ATTRIBUTE:Ljava/lang/String;

.field private NOTIFY_CAPABILITYID:Ljava/lang/String;

.field private NOTIFY_DEVICEID:Ljava/lang/String;

.field private NOTIFY_VALUE:Ljava/lang/String;

.field private capabilityId:Z

.field private deviceId:Z

.field private deviceIdAvailablity:Ljava/lang/String;

.field private jsonArray:Lorg/json/JSONArray;

.field private jsonObject:Lorg/json/JSONObject;

.field private processValue:Z

.field private statusTS:Z

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

    iput-object v0, p0, Lorg/cybergarage/xml/parser/GetNotifyStatusResponseParser;->ATTRIBUTE:Ljava/lang/String;

    .line 18
    const-string v0, "DeviceID"

    iput-object v0, p0, Lorg/cybergarage/xml/parser/GetNotifyStatusResponseParser;->NOTIFY_DEVICEID:Ljava/lang/String;

    .line 19
    const-string v0, "CapabilityId"

    iput-object v0, p0, Lorg/cybergarage/xml/parser/GetNotifyStatusResponseParser;->NOTIFY_CAPABILITYID:Ljava/lang/String;

    .line 20
    const-string v0, "Value"

    iput-object v0, p0, Lorg/cybergarage/xml/parser/GetNotifyStatusResponseParser;->NOTIFY_VALUE:Ljava/lang/String;

    .line 22
    iput-boolean v1, p0, Lorg/cybergarage/xml/parser/GetNotifyStatusResponseParser;->processValue:Z

    .line 23
    iput-boolean v1, p0, Lorg/cybergarage/xml/parser/GetNotifyStatusResponseParser;->deviceId:Z

    .line 24
    iput-boolean v1, p0, Lorg/cybergarage/xml/parser/GetNotifyStatusResponseParser;->capabilityId:Z

    .line 25
    iput-boolean v1, p0, Lorg/cybergarage/xml/parser/GetNotifyStatusResponseParser;->value:Z

    .line 26
    iput-boolean v1, p0, Lorg/cybergarage/xml/parser/GetNotifyStatusResponseParser;->statusTS:Z

    .line 29
    const-string v0, ""

    iput-object v0, p0, Lorg/cybergarage/xml/parser/GetNotifyStatusResponseParser;->deviceIdAvailablity:Ljava/lang/String;

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
    .line 74
    invoke-super {p0, p1, p2, p3}, Lorg/xml/sax/helpers/DefaultHandler;->characters([CII)V

    .line 75
    const-string v1, ""

    .line 76
    .local v1, "tempStr":Ljava/lang/String;
    new-instance v1, Ljava/lang/String;

    .end local v1    # "tempStr":Ljava/lang/String;
    invoke-direct {v1, p1, p2, p3}, Ljava/lang/String;-><init>([CII)V

    .line 78
    .restart local v1    # "tempStr":Ljava/lang/String;
    :try_start_0
    iget-boolean v2, p0, Lorg/cybergarage/xml/parser/GetNotifyStatusResponseParser;->processValue:Z

    if-eqz v2, :cond_3

    .line 79
    iget-object v2, p0, Lorg/cybergarage/xml/parser/GetNotifyStatusResponseParser;->jsonObject:Lorg/json/JSONObject;

    const-string v3, "Availability"

    iget-object v4, p0, Lorg/cybergarage/xml/parser/GetNotifyStatusResponseParser;->deviceIdAvailablity:Ljava/lang/String;

    invoke-virtual {v2, v3, v4}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 80
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

    .line 81
    iget-boolean v2, p0, Lorg/cybergarage/xml/parser/GetNotifyStatusResponseParser;->deviceId:Z

    if-eqz v2, :cond_0

    .line 82
    iget-object v2, p0, Lorg/cybergarage/xml/parser/GetNotifyStatusResponseParser;->jsonObject:Lorg/json/JSONObject;

    sget-object v3, Lcom/belkin/wemo/cache/devicelist/JSONConstants;->NOTIFY_DEVICE_ID:Ljava/lang/String;

    invoke-virtual {v2, v3, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 83
    :cond_0
    iget-boolean v2, p0, Lorg/cybergarage/xml/parser/GetNotifyStatusResponseParser;->capabilityId:Z

    if-eqz v2, :cond_1

    .line 84
    iget-object v2, p0, Lorg/cybergarage/xml/parser/GetNotifyStatusResponseParser;->jsonObject:Lorg/json/JSONObject;

    sget-object v3, Lcom/belkin/wemo/cache/devicelist/JSONConstants;->NOTIFY_CAPABILITY_ID:Ljava/lang/String;

    invoke-virtual {v2, v3, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 85
    :cond_1
    iget-boolean v2, p0, Lorg/cybergarage/xml/parser/GetNotifyStatusResponseParser;->value:Z

    if-eqz v2, :cond_2

    .line 86
    iget-object v2, p0, Lorg/cybergarage/xml/parser/GetNotifyStatusResponseParser;->jsonObject:Lorg/json/JSONObject;

    sget-object v3, Lcom/belkin/wemo/cache/devicelist/JSONConstants;->NOTIFY_VALUE:Ljava/lang/String;

    invoke-virtual {v2, v3, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 87
    :cond_2
    iget-boolean v2, p0, Lorg/cybergarage/xml/parser/GetNotifyStatusResponseParser;->statusTS:Z

    if-eqz v2, :cond_3

    .line 88
    iget-object v2, p0, Lorg/cybergarage/xml/parser/GetNotifyStatusResponseParser;->jsonObject:Lorg/json/JSONObject;

    const-string v3, "statusTS"

    invoke-virtual {v2, v3, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 96
    :cond_3
    :goto_0
    return-void

    .line 91
    :catch_0
    move-exception v0

    .line 93
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

    .line 101
    invoke-super {p0, p1, p2, p3}, Lorg/xml/sax/helpers/DefaultHandler;->endElement(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 102
    iget-object v0, p0, Lorg/cybergarage/xml/parser/GetNotifyStatusResponseParser;->ATTRIBUTE:Ljava/lang/String;

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 103
    iput-boolean v2, p0, Lorg/cybergarage/xml/parser/GetNotifyStatusResponseParser;->processValue:Z

    .line 104
    iget-object v0, p0, Lorg/cybergarage/xml/parser/GetNotifyStatusResponseParser;->jsonArray:Lorg/json/JSONArray;

    iget-object v1, p0, Lorg/cybergarage/xml/parser/GetNotifyStatusResponseParser;->jsonObject:Lorg/json/JSONObject;

    invoke-virtual {v0, v1}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;

    .line 106
    :cond_0
    iget-object v0, p0, Lorg/cybergarage/xml/parser/GetNotifyStatusResponseParser;->NOTIFY_DEVICEID:Ljava/lang/String;

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 107
    iput-boolean v2, p0, Lorg/cybergarage/xml/parser/GetNotifyStatusResponseParser;->deviceId:Z

    .line 108
    :cond_1
    iget-object v0, p0, Lorg/cybergarage/xml/parser/GetNotifyStatusResponseParser;->NOTIFY_CAPABILITYID:Ljava/lang/String;

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 109
    iput-boolean v2, p0, Lorg/cybergarage/xml/parser/GetNotifyStatusResponseParser;->capabilityId:Z

    .line 110
    :cond_2
    iget-object v0, p0, Lorg/cybergarage/xml/parser/GetNotifyStatusResponseParser;->NOTIFY_VALUE:Ljava/lang/String;

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_3

    .line 111
    iput-boolean v2, p0, Lorg/cybergarage/xml/parser/GetNotifyStatusResponseParser;->value:Z

    .line 112
    :cond_3
    const-string v0, "statusTS"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_4

    .line 113
    const/4 v0, 0x1

    iput-boolean v0, p0, Lorg/cybergarage/xml/parser/GetNotifyStatusResponseParser;->statusTS:Z

    .line 115
    :cond_4
    return-void
.end method

.method public parseNotifyStatusResponse(Ljava/lang/String;)Lorg/json/JSONArray;
    .locals 2
    .param p1, "response"    # Ljava/lang/String;

    .prologue
    .line 37
    new-instance v1, Lorg/json/JSONArray;

    invoke-direct {v1}, Lorg/json/JSONArray;-><init>()V

    iput-object v1, p0, Lorg/cybergarage/xml/parser/GetNotifyStatusResponseParser;->jsonArray:Lorg/json/JSONArray;

    .line 39
    :try_start_0
    invoke-static {p1, p0}, Landroid/util/Xml;->parse(Ljava/lang/String;Lorg/xml/sax/ContentHandler;)V
    :try_end_0
    .catch Lorg/xml/sax/SAXException; {:try_start_0 .. :try_end_0} :catch_0

    .line 44
    :goto_0
    iget-object v1, p0, Lorg/cybergarage/xml/parser/GetNotifyStatusResponseParser;->jsonArray:Lorg/json/JSONArray;

    return-object v1

    .line 40
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

    .line 50
    invoke-super {p0, p1, p2, p3, p4}, Lorg/xml/sax/helpers/DefaultHandler;->startElement(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lorg/xml/sax/Attributes;)V

    .line 51
    iget-object v0, p0, Lorg/cybergarage/xml/parser/GetNotifyStatusResponseParser;->ATTRIBUTE:Ljava/lang/String;

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 52
    iput-boolean v1, p0, Lorg/cybergarage/xml/parser/GetNotifyStatusResponseParser;->processValue:Z

    .line 53
    new-instance v0, Lorg/json/JSONObject;

    invoke-direct {v0}, Lorg/json/JSONObject;-><init>()V

    iput-object v0, p0, Lorg/cybergarage/xml/parser/GetNotifyStatusResponseParser;->jsonObject:Lorg/json/JSONObject;

    .line 55
    :cond_0
    iget-object v0, p0, Lorg/cybergarage/xml/parser/GetNotifyStatusResponseParser;->NOTIFY_DEVICEID:Ljava/lang/String;

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 56
    iput-boolean v1, p0, Lorg/cybergarage/xml/parser/GetNotifyStatusResponseParser;->deviceId:Z

    .line 57
    const-string v0, "available"

    invoke-interface {p4, v0}, Lorg/xml/sax/Attributes;->getValue(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lorg/cybergarage/xml/parser/GetNotifyStatusResponseParser;->deviceIdAvailablity:Ljava/lang/String;

    .line 59
    :cond_1
    iget-object v0, p0, Lorg/cybergarage/xml/parser/GetNotifyStatusResponseParser;->NOTIFY_CAPABILITYID:Ljava/lang/String;

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 60
    iput-boolean v1, p0, Lorg/cybergarage/xml/parser/GetNotifyStatusResponseParser;->capabilityId:Z

    .line 62
    :cond_2
    iget-object v0, p0, Lorg/cybergarage/xml/parser/GetNotifyStatusResponseParser;->NOTIFY_VALUE:Ljava/lang/String;

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_3

    .line 63
    iput-boolean v1, p0, Lorg/cybergarage/xml/parser/GetNotifyStatusResponseParser;->value:Z

    .line 65
    :cond_3
    const-string v0, "statusTS"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_4

    .line 66
    iput-boolean v1, p0, Lorg/cybergarage/xml/parser/GetNotifyStatusResponseParser;->statusTS:Z

    .line 69
    :cond_4
    return-void
.end method
