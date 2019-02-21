.class public Lcom/belkin/upnp/parser/GetDeviceListStatusResponse;
.super Lorg/xml/sax/helpers/DefaultHandler;
.source "GetDeviceListStatusResponse.java"


# instance fields
.field private capabilityId:Z

.field private capabilityValue:Z

.field private deviceIdAvailablity:Ljava/lang/String;

.field private deviceStatus:Z

.field private devidId:Z

.field endList:Lcom/belkin/beans/GetEndDeviceListResponseBean;

.field private isGroupAction:Z

.field private jsonArr:Lorg/json/JSONArray;

.field jsonObject:Lorg/json/JSONObject;

.field private lastEventTimeStamp:Z

.field private processValue:Z

.field private responseBuffer:Ljava/lang/StringBuffer;

.field private tempVal:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    const/4 v0, 0x0

    .line 18
    invoke-direct {p0}, Lorg/xml/sax/helpers/DefaultHandler;-><init>()V

    .line 20
    iput-boolean v0, p0, Lcom/belkin/upnp/parser/GetDeviceListStatusResponse;->processValue:Z

    .line 23
    iput-boolean v0, p0, Lcom/belkin/upnp/parser/GetDeviceListStatusResponse;->deviceStatus:Z

    .line 26
    iput-boolean v0, p0, Lcom/belkin/upnp/parser/GetDeviceListStatusResponse;->isGroupAction:Z

    .line 27
    iput-boolean v0, p0, Lcom/belkin/upnp/parser/GetDeviceListStatusResponse;->devidId:Z

    .line 28
    iput-boolean v0, p0, Lcom/belkin/upnp/parser/GetDeviceListStatusResponse;->capabilityId:Z

    .line 29
    iput-boolean v0, p0, Lcom/belkin/upnp/parser/GetDeviceListStatusResponse;->capabilityValue:Z

    .line 30
    iput-boolean v0, p0, Lcom/belkin/upnp/parser/GetDeviceListStatusResponse;->lastEventTimeStamp:Z

    .line 34
    new-instance v0, Lorg/json/JSONObject;

    invoke-direct {v0}, Lorg/json/JSONObject;-><init>()V

    iput-object v0, p0, Lcom/belkin/upnp/parser/GetDeviceListStatusResponse;->jsonObject:Lorg/json/JSONObject;

    .line 36
    const-string v0, ""

    iput-object v0, p0, Lcom/belkin/upnp/parser/GetDeviceListStatusResponse;->deviceIdAvailablity:Ljava/lang/String;

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
    .line 104
    invoke-super {p0, p1, p2, p3}, Lorg/xml/sax/helpers/DefaultHandler;->characters([CII)V

    .line 105
    const-string v1, ""

    .line 106
    .local v1, "replaceString":Ljava/lang/String;
    new-instance v2, Ljava/lang/String;

    invoke-direct {v2, p1, p2, p3}, Ljava/lang/String;-><init>([CII)V

    iput-object v2, p0, Lcom/belkin/upnp/parser/GetDeviceListStatusResponse;->tempVal:Ljava/lang/String;

    .line 107
    iget-boolean v2, p0, Lcom/belkin/upnp/parser/GetDeviceListStatusResponse;->processValue:Z

    const/4 v3, 0x1

    if-ne v2, v3, :cond_2

    .line 108
    const/4 v2, 0x0

    aget-char v2, p1, v2

    const/16 v3, 0xa

    if-eq v2, v3, :cond_0

    .line 109
    new-instance v1, Ljava/lang/String;

    .end local v1    # "replaceString":Ljava/lang/String;
    invoke-direct {v1, p1, p2, p3}, Ljava/lang/String;-><init>([CII)V

    .line 110
    .restart local v1    # "replaceString":Ljava/lang/String;
    :cond_0
    const-string v2, "available="

    invoke-virtual {v1, v2}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 111
    iget-object v2, p0, Lcom/belkin/upnp/parser/GetDeviceListStatusResponse;->responseBuffer:Ljava/lang/StringBuffer;

    const-string v3, " "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 112
    :cond_1
    iget-object v2, p0, Lcom/belkin/upnp/parser/GetDeviceListStatusResponse;->responseBuffer:Ljava/lang/StringBuffer;

    new-instance v3, Ljava/lang/String;

    invoke-direct {v3, p1, p2, p3}, Ljava/lang/String;-><init>([CII)V

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 116
    :cond_2
    :try_start_0
    iget-object v2, p0, Lcom/belkin/upnp/parser/GetDeviceListStatusResponse;->jsonObject:Lorg/json/JSONObject;

    const-string v3, "Availability"

    iget-object v4, p0, Lcom/belkin/upnp/parser/GetDeviceListStatusResponse;->deviceIdAvailablity:Ljava/lang/String;

    invoke-virtual {v2, v3, v4}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 117
    iget-boolean v2, p0, Lcom/belkin/upnp/parser/GetDeviceListStatusResponse;->isGroupAction:Z

    if-eqz v2, :cond_3

    .line 118
    iget-object v2, p0, Lcom/belkin/upnp/parser/GetDeviceListStatusResponse;->jsonObject:Lorg/json/JSONObject;

    const-string v3, "IsGroupAction"

    iget-object v4, p0, Lcom/belkin/upnp/parser/GetDeviceListStatusResponse;->tempVal:Ljava/lang/String;

    invoke-virtual {v2, v3, v4}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 119
    :cond_3
    iget-boolean v2, p0, Lcom/belkin/upnp/parser/GetDeviceListStatusResponse;->devidId:Z

    if-eqz v2, :cond_4

    .line 120
    iget-object v2, p0, Lcom/belkin/upnp/parser/GetDeviceListStatusResponse;->jsonObject:Lorg/json/JSONObject;

    const-string v3, "DeviceIDLED"

    iget-object v4, p0, Lcom/belkin/upnp/parser/GetDeviceListStatusResponse;->tempVal:Ljava/lang/String;

    invoke-virtual {v2, v3, v4}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 121
    :cond_4
    iget-boolean v2, p0, Lcom/belkin/upnp/parser/GetDeviceListStatusResponse;->capabilityId:Z

    if-eqz v2, :cond_5

    .line 122
    iget-object v2, p0, Lcom/belkin/upnp/parser/GetDeviceListStatusResponse;->jsonObject:Lorg/json/JSONObject;

    const-string v3, "capabilityid"

    iget-object v4, p0, Lcom/belkin/upnp/parser/GetDeviceListStatusResponse;->tempVal:Ljava/lang/String;

    invoke-virtual {v2, v3, v4}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 123
    :cond_5
    iget-boolean v2, p0, Lcom/belkin/upnp/parser/GetDeviceListStatusResponse;->capabilityValue:Z

    if-eqz v2, :cond_6

    .line 124
    iget-object v2, p0, Lcom/belkin/upnp/parser/GetDeviceListStatusResponse;->jsonObject:Lorg/json/JSONObject;

    const-string v3, "capabilityvalue"

    iget-object v4, p0, Lcom/belkin/upnp/parser/GetDeviceListStatusResponse;->tempVal:Ljava/lang/String;

    invoke-virtual {v2, v3, v4}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 125
    :cond_6
    iget-boolean v2, p0, Lcom/belkin/upnp/parser/GetDeviceListStatusResponse;->lastEventTimeStamp:Z

    if-eqz v2, :cond_7

    .line 126
    iget-object v2, p0, Lcom/belkin/upnp/parser/GetDeviceListStatusResponse;->jsonObject:Lorg/json/JSONObject;

    const-string v3, "lastEventTimeStamp"

    iget-object v4, p0, Lcom/belkin/upnp/parser/GetDeviceListStatusResponse;->tempVal:Ljava/lang/String;

    invoke-virtual {v2, v3, v4}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 135
    :cond_7
    :goto_0
    return-void

    .line 130
    :catch_0
    move-exception v0

    .line 132
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

    .line 140
    invoke-super {p0, p1, p2, p3}, Lorg/xml/sax/helpers/DefaultHandler;->endElement(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 142
    const-string v0, "DeviceStatus"

    invoke-virtual {p3, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 143
    iput-boolean v2, p0, Lcom/belkin/upnp/parser/GetDeviceListStatusResponse;->deviceStatus:Z

    .line 145
    :cond_0
    const-string v0, "IsGroupAction"

    invoke-virtual {p3, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 146
    iput-boolean v2, p0, Lcom/belkin/upnp/parser/GetDeviceListStatusResponse;->isGroupAction:Z

    .line 148
    :cond_1
    const-string v0, "DeviceID"

    invoke-virtual {p3, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 149
    iput-boolean v2, p0, Lcom/belkin/upnp/parser/GetDeviceListStatusResponse;->devidId:Z

    .line 151
    :cond_2
    const-string v0, "CapabilityID"

    invoke-virtual {p3, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_3

    .line 152
    iput-boolean v2, p0, Lcom/belkin/upnp/parser/GetDeviceListStatusResponse;->capabilityId:Z

    .line 154
    :cond_3
    const-string v0, "CapabilityValue"

    invoke-virtual {p3, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_4

    .line 155
    iput-boolean v2, p0, Lcom/belkin/upnp/parser/GetDeviceListStatusResponse;->capabilityValue:Z

    .line 156
    iget-object v0, p0, Lcom/belkin/upnp/parser/GetDeviceListStatusResponse;->jsonArr:Lorg/json/JSONArray;

    iget-object v1, p0, Lcom/belkin/upnp/parser/GetDeviceListStatusResponse;->jsonObject:Lorg/json/JSONObject;

    invoke-virtual {v0, v1}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;

    .line 158
    :cond_4
    const-string v0, "LastEventTimeStamp"

    invoke-virtual {p3, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_5

    .line 159
    iput-boolean v2, p0, Lcom/belkin/upnp/parser/GetDeviceListStatusResponse;->lastEventTimeStamp:Z

    .line 162
    :cond_5
    return-void
.end method

.method public parseForDeviceListStatus(Ljava/lang/String;)Lorg/json/JSONArray;
    .locals 5
    .param p1, "response"    # Ljava/lang/String;

    .prologue
    .line 44
    new-instance v2, Lcom/belkin/beans/GetEndDeviceListResponseBean;

    invoke-direct {v2}, Lcom/belkin/beans/GetEndDeviceListResponseBean;-><init>()V

    iput-object v2, p0, Lcom/belkin/upnp/parser/GetDeviceListStatusResponse;->endList:Lcom/belkin/beans/GetEndDeviceListResponseBean;

    .line 45
    new-instance v2, Lorg/json/JSONObject;

    invoke-direct {v2}, Lorg/json/JSONObject;-><init>()V

    iput-object v2, p0, Lcom/belkin/upnp/parser/GetDeviceListStatusResponse;->jsonObject:Lorg/json/JSONObject;

    .line 46
    new-instance v2, Ljava/lang/StringBuffer;

    invoke-direct {v2}, Ljava/lang/StringBuffer;-><init>()V

    iput-object v2, p0, Lcom/belkin/upnp/parser/GetDeviceListStatusResponse;->responseBuffer:Ljava/lang/StringBuffer;

    .line 47
    new-instance v2, Lorg/json/JSONArray;

    invoke-direct {v2}, Lorg/json/JSONArray;-><init>()V

    iput-object v2, p0, Lcom/belkin/upnp/parser/GetDeviceListStatusResponse;->jsonArr:Lorg/json/JSONArray;

    .line 50
    :try_start_0
    invoke-static {p1, p0}, Landroid/util/Xml;->parse(Ljava/lang/String;Lorg/xml/sax/ContentHandler;)V
    :try_end_0
    .catch Lorg/xml/sax/SAXException; {:try_start_0 .. :try_end_0} :catch_0

    .line 54
    :goto_0
    new-instance v1, Ljava/lang/String;

    iget-object v2, p0, Lcom/belkin/upnp/parser/GetDeviceListStatusResponse;->responseBuffer:Ljava/lang/StringBuffer;

    invoke-direct {v1, v2}, Ljava/lang/String;-><init>(Ljava/lang/StringBuffer;)V

    .line 55
    .local v1, "parsedResponse":Ljava/lang/String;
    const-string v2, "&lt;"

    const-string v3, "<"

    invoke-virtual {v1, v2, v3}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    .line 56
    const-string v2, "&gt;"

    const-string v3, ">"

    invoke-virtual {v1, v2, v3}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    .line 57
    const-string v2, "&quot;"

    const-string v3, "\"\""

    invoke-virtual {v1, v2, v3}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    .line 58
    sget-object v2, Ljava/lang/System;->out:Ljava/io/PrintStream;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "LED AFTER REPLACE *******"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 61
    :try_start_1
    invoke-static {v1, p0}, Landroid/util/Xml;->parse(Ljava/lang/String;Lorg/xml/sax/ContentHandler;)V
    :try_end_1
    .catch Lorg/xml/sax/SAXException; {:try_start_1 .. :try_end_1} :catch_1

    .line 67
    :goto_1
    const-string v2, "GetDeviceresponse"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "GetdeviceResponse: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-object v4, p0, Lcom/belkin/upnp/parser/GetDeviceListStatusResponse;->jsonArr:Lorg/json/JSONArray;

    invoke-virtual {v4}, Lorg/json/JSONArray;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 68
    iget-object v2, p0, Lcom/belkin/upnp/parser/GetDeviceListStatusResponse;->jsonArr:Lorg/json/JSONArray;

    return-object v2

    .line 51
    .end local v1    # "parsedResponse":Ljava/lang/String;
    :catch_0
    move-exception v0

    .line 52
    .local v0, "e":Lorg/xml/sax/SAXException;
    invoke-virtual {v0}, Lorg/xml/sax/SAXException;->printStackTrace()V

    goto :goto_0

    .line 62
    .end local v0    # "e":Lorg/xml/sax/SAXException;
    .restart local v1    # "parsedResponse":Ljava/lang/String;
    :catch_1
    move-exception v0

    .line 63
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

    .line 73
    invoke-super {p0, p1, p2, p3, p4}, Lorg/xml/sax/helpers/DefaultHandler;->startElement(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lorg/xml/sax/Attributes;)V

    .line 74
    const-string v0, "DeviceStatusList"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 75
    iput-boolean v1, p0, Lcom/belkin/upnp/parser/GetDeviceListStatusResponse;->processValue:Z

    .line 77
    :cond_0
    const-string v0, "DeviceStatus"

    invoke-virtual {p3, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 78
    iput-boolean v1, p0, Lcom/belkin/upnp/parser/GetDeviceListStatusResponse;->deviceStatus:Z

    .line 79
    new-instance v0, Lorg/json/JSONObject;

    invoke-direct {v0}, Lorg/json/JSONObject;-><init>()V

    iput-object v0, p0, Lcom/belkin/upnp/parser/GetDeviceListStatusResponse;->jsonObject:Lorg/json/JSONObject;

    .line 81
    :cond_1
    const-string v0, "IsGroupAction"

    invoke-virtual {p3, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 82
    iput-boolean v1, p0, Lcom/belkin/upnp/parser/GetDeviceListStatusResponse;->isGroupAction:Z

    .line 84
    :cond_2
    const-string v0, "DeviceID"

    invoke-virtual {p3, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_3

    .line 85
    iput-boolean v1, p0, Lcom/belkin/upnp/parser/GetDeviceListStatusResponse;->devidId:Z

    .line 86
    const-string v0, "available"

    invoke-interface {p4, v0}, Lorg/xml/sax/Attributes;->getValue(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/belkin/upnp/parser/GetDeviceListStatusResponse;->deviceIdAvailablity:Ljava/lang/String;

    .line 88
    :cond_3
    const-string v0, "CapabilityID"

    invoke-virtual {p3, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_4

    .line 89
    iput-boolean v1, p0, Lcom/belkin/upnp/parser/GetDeviceListStatusResponse;->capabilityId:Z

    .line 91
    :cond_4
    const-string v0, "CapabilityValue"

    invoke-virtual {p3, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_5

    .line 92
    iput-boolean v1, p0, Lcom/belkin/upnp/parser/GetDeviceListStatusResponse;->capabilityValue:Z

    .line 94
    :cond_5
    const-string v0, "LastEventTimeStamp"

    invoke-virtual {p3, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_6

    .line 95
    iput-boolean v1, p0, Lcom/belkin/upnp/parser/GetDeviceListStatusResponse;->lastEventTimeStamp:Z

    .line 99
    :cond_6
    return-void
.end method
