.class public Lcom/belkin/wemo/cache/zigbee/GetDeviceListStatusResponse;
.super Lorg/xml/sax/helpers/DefaultHandler;
.source "GetDeviceListStatusResponse.java"


# instance fields
.field private capabilityId:Z

.field private capabilityValue:Z

.field private deviceIdAvailablity:Ljava/lang/String;

.field private deviceStatus:Z

.field private devidId:Z

.field private isGroupAction:Z

.field private lastEventTimeStamp:Z

.field private processValue:Z

.field private responseBuffer:Ljava/lang/StringBuffer;

.field private tempVal:Ljava/lang/String;

.field private zbResp:Lcom/belkin/wemo/cache/zigbee/ZigBeeGetDeviceListStatusResponse;

.field private zbRespList:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Lcom/belkin/wemo/cache/zigbee/ZigBeeGetDeviceListStatusResponse;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    const/4 v0, 0x0

    .line 17
    invoke-direct {p0}, Lorg/xml/sax/helpers/DefaultHandler;-><init>()V

    .line 19
    iput-boolean v0, p0, Lcom/belkin/wemo/cache/zigbee/GetDeviceListStatusResponse;->processValue:Z

    .line 22
    iput-boolean v0, p0, Lcom/belkin/wemo/cache/zigbee/GetDeviceListStatusResponse;->deviceStatus:Z

    .line 25
    iput-boolean v0, p0, Lcom/belkin/wemo/cache/zigbee/GetDeviceListStatusResponse;->isGroupAction:Z

    .line 26
    iput-boolean v0, p0, Lcom/belkin/wemo/cache/zigbee/GetDeviceListStatusResponse;->devidId:Z

    .line 27
    iput-boolean v0, p0, Lcom/belkin/wemo/cache/zigbee/GetDeviceListStatusResponse;->capabilityId:Z

    .line 28
    iput-boolean v0, p0, Lcom/belkin/wemo/cache/zigbee/GetDeviceListStatusResponse;->capabilityValue:Z

    .line 29
    iput-boolean v0, p0, Lcom/belkin/wemo/cache/zigbee/GetDeviceListStatusResponse;->lastEventTimeStamp:Z

    .line 34
    const-string v0, ""

    iput-object v0, p0, Lcom/belkin/wemo/cache/zigbee/GetDeviceListStatusResponse;->deviceIdAvailablity:Ljava/lang/String;

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
    .line 106
    invoke-super {p0, p1, p2, p3}, Lorg/xml/sax/helpers/DefaultHandler;->characters([CII)V

    .line 107
    const-string v0, ""

    .line 108
    .local v0, "replaceString":Ljava/lang/String;
    new-instance v1, Ljava/lang/String;

    invoke-direct {v1, p1, p2, p3}, Ljava/lang/String;-><init>([CII)V

    iput-object v1, p0, Lcom/belkin/wemo/cache/zigbee/GetDeviceListStatusResponse;->tempVal:Ljava/lang/String;

    .line 109
    iget-boolean v1, p0, Lcom/belkin/wemo/cache/zigbee/GetDeviceListStatusResponse;->processValue:Z

    const/4 v2, 0x1

    if-ne v1, v2, :cond_2

    .line 110
    const/4 v1, 0x0

    aget-char v1, p1, v1

    const/16 v2, 0xa

    if-eq v1, v2, :cond_0

    .line 111
    new-instance v0, Ljava/lang/String;

    .end local v0    # "replaceString":Ljava/lang/String;
    invoke-direct {v0, p1, p2, p3}, Ljava/lang/String;-><init>([CII)V

    .line 112
    .restart local v0    # "replaceString":Ljava/lang/String;
    :cond_0
    const-string v1, "available="

    invoke-virtual {v0, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 113
    iget-object v1, p0, Lcom/belkin/wemo/cache/zigbee/GetDeviceListStatusResponse;->responseBuffer:Ljava/lang/StringBuffer;

    const-string v2, " "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 114
    :cond_1
    iget-object v1, p0, Lcom/belkin/wemo/cache/zigbee/GetDeviceListStatusResponse;->responseBuffer:Ljava/lang/StringBuffer;

    new-instance v2, Ljava/lang/String;

    invoke-direct {v2, p1, p2, p3}, Ljava/lang/String;-><init>([CII)V

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 117
    :cond_2
    iget-object v1, p0, Lcom/belkin/wemo/cache/zigbee/GetDeviceListStatusResponse;->zbResp:Lcom/belkin/wemo/cache/zigbee/ZigBeeGetDeviceListStatusResponse;

    iget-object v2, p0, Lcom/belkin/wemo/cache/zigbee/GetDeviceListStatusResponse;->deviceIdAvailablity:Ljava/lang/String;

    invoke-virtual {v1, v2}, Lcom/belkin/wemo/cache/zigbee/ZigBeeGetDeviceListStatusResponse;->setAvability(Ljava/lang/String;)V

    .line 118
    iget-boolean v1, p0, Lcom/belkin/wemo/cache/zigbee/GetDeviceListStatusResponse;->isGroupAction:Z

    if-eqz v1, :cond_3

    .line 119
    iget-object v1, p0, Lcom/belkin/wemo/cache/zigbee/GetDeviceListStatusResponse;->zbResp:Lcom/belkin/wemo/cache/zigbee/ZigBeeGetDeviceListStatusResponse;

    iget-object v2, p0, Lcom/belkin/wemo/cache/zigbee/GetDeviceListStatusResponse;->tempVal:Ljava/lang/String;

    invoke-virtual {v1, v2}, Lcom/belkin/wemo/cache/zigbee/ZigBeeGetDeviceListStatusResponse;->setIsGroupAction(Ljava/lang/String;)V

    .line 120
    :cond_3
    iget-boolean v1, p0, Lcom/belkin/wemo/cache/zigbee/GetDeviceListStatusResponse;->devidId:Z

    if-eqz v1, :cond_4

    .line 121
    iget-object v1, p0, Lcom/belkin/wemo/cache/zigbee/GetDeviceListStatusResponse;->zbResp:Lcom/belkin/wemo/cache/zigbee/ZigBeeGetDeviceListStatusResponse;

    iget-object v2, p0, Lcom/belkin/wemo/cache/zigbee/GetDeviceListStatusResponse;->tempVal:Ljava/lang/String;

    invoke-virtual {v1, v2}, Lcom/belkin/wemo/cache/zigbee/ZigBeeGetDeviceListStatusResponse;->setDeviceIDLED(Ljava/lang/String;)V

    .line 122
    :cond_4
    iget-boolean v1, p0, Lcom/belkin/wemo/cache/zigbee/GetDeviceListStatusResponse;->capabilityId:Z

    if-eqz v1, :cond_5

    .line 123
    iget-object v1, p0, Lcom/belkin/wemo/cache/zigbee/GetDeviceListStatusResponse;->zbResp:Lcom/belkin/wemo/cache/zigbee/ZigBeeGetDeviceListStatusResponse;

    iget-object v2, p0, Lcom/belkin/wemo/cache/zigbee/GetDeviceListStatusResponse;->tempVal:Ljava/lang/String;

    invoke-virtual {v1, v2}, Lcom/belkin/wemo/cache/zigbee/ZigBeeGetDeviceListStatusResponse;->setCapabilityid(Ljava/lang/String;)V

    .line 124
    :cond_5
    iget-boolean v1, p0, Lcom/belkin/wemo/cache/zigbee/GetDeviceListStatusResponse;->capabilityValue:Z

    if-eqz v1, :cond_6

    .line 125
    iget-object v1, p0, Lcom/belkin/wemo/cache/zigbee/GetDeviceListStatusResponse;->zbResp:Lcom/belkin/wemo/cache/zigbee/ZigBeeGetDeviceListStatusResponse;

    iget-object v2, p0, Lcom/belkin/wemo/cache/zigbee/GetDeviceListStatusResponse;->tempVal:Ljava/lang/String;

    invoke-virtual {v1, v2}, Lcom/belkin/wemo/cache/zigbee/ZigBeeGetDeviceListStatusResponse;->setCapabilityvalue(Ljava/lang/String;)V

    .line 126
    :cond_6
    iget-boolean v1, p0, Lcom/belkin/wemo/cache/zigbee/GetDeviceListStatusResponse;->lastEventTimeStamp:Z

    if-eqz v1, :cond_7

    .line 127
    iget-object v1, p0, Lcom/belkin/wemo/cache/zigbee/GetDeviceListStatusResponse;->zbResp:Lcom/belkin/wemo/cache/zigbee/ZigBeeGetDeviceListStatusResponse;

    iget-object v2, p0, Lcom/belkin/wemo/cache/zigbee/GetDeviceListStatusResponse;->tempVal:Ljava/lang/String;

    invoke-static {v2}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v2

    invoke-virtual {v1, v2}, Lcom/belkin/wemo/cache/zigbee/ZigBeeGetDeviceListStatusResponse;->setLastEventTimeStamp(I)V

    .line 130
    :cond_7
    return-void
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

    .line 135
    invoke-super {p0, p1, p2, p3}, Lorg/xml/sax/helpers/DefaultHandler;->endElement(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 137
    const-string v0, "DeviceStatus"

    invoke-virtual {p3, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 138
    iput-boolean v2, p0, Lcom/belkin/wemo/cache/zigbee/GetDeviceListStatusResponse;->deviceStatus:Z

    .line 140
    :cond_0
    const-string v0, "IsGroupAction"

    invoke-virtual {p3, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 141
    iput-boolean v2, p0, Lcom/belkin/wemo/cache/zigbee/GetDeviceListStatusResponse;->isGroupAction:Z

    .line 143
    :cond_1
    const-string v0, "DeviceID"

    invoke-virtual {p3, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 144
    iput-boolean v2, p0, Lcom/belkin/wemo/cache/zigbee/GetDeviceListStatusResponse;->devidId:Z

    .line 146
    :cond_2
    const-string v0, "CapabilityID"

    invoke-virtual {p3, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_3

    .line 147
    iput-boolean v2, p0, Lcom/belkin/wemo/cache/zigbee/GetDeviceListStatusResponse;->capabilityId:Z

    .line 149
    :cond_3
    const-string v0, "CapabilityValue"

    invoke-virtual {p3, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_4

    .line 150
    iput-boolean v2, p0, Lcom/belkin/wemo/cache/zigbee/GetDeviceListStatusResponse;->capabilityValue:Z

    .line 151
    iget-object v0, p0, Lcom/belkin/wemo/cache/zigbee/GetDeviceListStatusResponse;->zbRespList:Ljava/util/ArrayList;

    iget-object v1, p0, Lcom/belkin/wemo/cache/zigbee/GetDeviceListStatusResponse;->zbResp:Lcom/belkin/wemo/cache/zigbee/ZigBeeGetDeviceListStatusResponse;

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 153
    :cond_4
    const-string v0, "LastEventTimeStamp"

    invoke-virtual {p3, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_5

    .line 154
    iput-boolean v2, p0, Lcom/belkin/wemo/cache/zigbee/GetDeviceListStatusResponse;->lastEventTimeStamp:Z

    .line 157
    :cond_5
    return-void
.end method

.method public parseForDeviceListStatus(Ljava/lang/String;)Ljava/util/ArrayList;
    .locals 5
    .param p1, "response"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/ArrayList",
            "<",
            "Lcom/belkin/wemo/cache/zigbee/ZigBeeGetDeviceListStatusResponse;",
            ">;"
        }
    .end annotation

    .prologue
    .line 44
    const-string v2, "ZigbeeScan"

    const-string v3, "MSearch Device Added: parseForDeviceListStatus"

    invoke-static {v2, v3}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 45
    new-instance v2, Lcom/belkin/wemo/cache/zigbee/ZigBeeGetDeviceListStatusResponse;

    invoke-direct {v2}, Lcom/belkin/wemo/cache/zigbee/ZigBeeGetDeviceListStatusResponse;-><init>()V

    iput-object v2, p0, Lcom/belkin/wemo/cache/zigbee/GetDeviceListStatusResponse;->zbResp:Lcom/belkin/wemo/cache/zigbee/ZigBeeGetDeviceListStatusResponse;

    .line 46
    new-instance v2, Ljava/lang/StringBuffer;

    invoke-direct {v2}, Ljava/lang/StringBuffer;-><init>()V

    iput-object v2, p0, Lcom/belkin/wemo/cache/zigbee/GetDeviceListStatusResponse;->responseBuffer:Ljava/lang/StringBuffer;

    .line 47
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    iput-object v2, p0, Lcom/belkin/wemo/cache/zigbee/GetDeviceListStatusResponse;->zbRespList:Ljava/util/ArrayList;

    .line 50
    :try_start_0
    invoke-static {p1, p0}, Landroid/util/Xml;->parse(Ljava/lang/String;Lorg/xml/sax/ContentHandler;)V
    :try_end_0
    .catch Lorg/xml/sax/SAXException; {:try_start_0 .. :try_end_0} :catch_0

    .line 55
    :goto_0
    new-instance v1, Ljava/lang/String;

    iget-object v2, p0, Lcom/belkin/wemo/cache/zigbee/GetDeviceListStatusResponse;->responseBuffer:Ljava/lang/StringBuffer;

    invoke-direct {v1, v2}, Ljava/lang/String;-><init>(Ljava/lang/StringBuffer;)V

    .line 56
    .local v1, "parsedResponse":Ljava/lang/String;
    const-string v2, "&lt;"

    const-string v3, "<"

    invoke-virtual {v1, v2, v3}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    .line 57
    const-string v2, "&gt;"

    const-string v3, ">"

    invoke-virtual {v1, v2, v3}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    .line 58
    const-string v2, "&quot;"

    const-string v3, "\"\""

    invoke-virtual {v1, v2, v3}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    .line 61
    :try_start_1
    invoke-static {v1, p0}, Landroid/util/Xml;->parse(Ljava/lang/String;Lorg/xml/sax/ContentHandler;)V
    :try_end_1
    .catch Lorg/xml/sax/SAXException; {:try_start_1 .. :try_end_1} :catch_1

    .line 67
    :goto_1
    const-string v2, "ZigbeeScan"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "MSearch Device Added: status response after parse"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 68
    const-string v2, "ZigbeeScan"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "MSearch Device Added: GetdeviceResponse"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-object v4, p0, Lcom/belkin/wemo/cache/zigbee/GetDeviceListStatusResponse;->zbRespList:Ljava/util/ArrayList;

    invoke-virtual {v4}, Ljava/util/ArrayList;->size()I

    move-result v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 70
    iget-object v2, p0, Lcom/belkin/wemo/cache/zigbee/GetDeviceListStatusResponse;->zbRespList:Ljava/util/ArrayList;

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

    .line 75
    invoke-super {p0, p1, p2, p3, p4}, Lorg/xml/sax/helpers/DefaultHandler;->startElement(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lorg/xml/sax/Attributes;)V

    .line 76
    const-string v0, "DeviceStatusList"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 77
    iput-boolean v1, p0, Lcom/belkin/wemo/cache/zigbee/GetDeviceListStatusResponse;->processValue:Z

    .line 79
    :cond_0
    const-string v0, "DeviceStatus"

    invoke-virtual {p3, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 80
    iput-boolean v1, p0, Lcom/belkin/wemo/cache/zigbee/GetDeviceListStatusResponse;->deviceStatus:Z

    .line 81
    new-instance v0, Lcom/belkin/wemo/cache/zigbee/ZigBeeGetDeviceListStatusResponse;

    invoke-direct {v0}, Lcom/belkin/wemo/cache/zigbee/ZigBeeGetDeviceListStatusResponse;-><init>()V

    iput-object v0, p0, Lcom/belkin/wemo/cache/zigbee/GetDeviceListStatusResponse;->zbResp:Lcom/belkin/wemo/cache/zigbee/ZigBeeGetDeviceListStatusResponse;

    .line 83
    :cond_1
    const-string v0, "IsGroupAction"

    invoke-virtual {p3, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 84
    iput-boolean v1, p0, Lcom/belkin/wemo/cache/zigbee/GetDeviceListStatusResponse;->isGroupAction:Z

    .line 86
    :cond_2
    const-string v0, "DeviceID"

    invoke-virtual {p3, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_3

    .line 87
    iput-boolean v1, p0, Lcom/belkin/wemo/cache/zigbee/GetDeviceListStatusResponse;->devidId:Z

    .line 88
    const-string v0, "available"

    invoke-interface {p4, v0}, Lorg/xml/sax/Attributes;->getValue(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/belkin/wemo/cache/zigbee/GetDeviceListStatusResponse;->deviceIdAvailablity:Ljava/lang/String;

    .line 90
    :cond_3
    const-string v0, "CapabilityID"

    invoke-virtual {p3, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_4

    .line 91
    iput-boolean v1, p0, Lcom/belkin/wemo/cache/zigbee/GetDeviceListStatusResponse;->capabilityId:Z

    .line 93
    :cond_4
    const-string v0, "CapabilityValue"

    invoke-virtual {p3, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_5

    .line 94
    iput-boolean v1, p0, Lcom/belkin/wemo/cache/zigbee/GetDeviceListStatusResponse;->capabilityValue:Z

    .line 96
    :cond_5
    const-string v0, "LastEventTimeStamp"

    invoke-virtual {p3, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_6

    .line 97
    iput-boolean v1, p0, Lcom/belkin/wemo/cache/zigbee/GetDeviceListStatusResponse;->lastEventTimeStamp:Z

    .line 101
    :cond_6
    return-void
.end method
