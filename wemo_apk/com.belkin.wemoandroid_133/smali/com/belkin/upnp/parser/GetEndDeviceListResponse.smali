.class public Lcom/belkin/upnp/parser/GetEndDeviceListResponse;
.super Lorg/xml/sax/helpers/DefaultHandler;
.source "GetEndDeviceListResponse.java"


# static fields
.field private static deviceListTyp:Ljava/lang/String;


# instance fields
.field private capabilityId:Z

.field private currenState:Z

.field private deviceId:Z

.field private deviceIdAvailablity:Ljava/lang/String;

.field private deviceIndex:Z

.field private deviceInfo:Z

.field private deviceInfos:Z

.field private deviceListType:Z

.field endList:Lcom/belkin/beans/GetEndDeviceListResponseBean;

.field private firmwareVersion:Z

.field private friendlyName:Z

.field private groupCapabilityId:Z

.field private groupCapabilityValues:Z

.field private groupId:Z

.field private groupInfo:Z

.field private groupName:Z

.field private iconVersion:Z

.field private jsonArr:Lorg/json/JSONArray;

.field private jsonGroupArray:Lorg/json/JSONArray;

.field jsonGroupObj:Lorg/json/JSONObject;

.field jsonObject:Lorg/json/JSONObject;

.field private manufacturerName:Z

.field private modelCode:Z

.field private processValue:Z

.field private productName:Z

.field private responseBuffer:Ljava/lang/StringBuffer;

.field private rtmFW:Z

.field private tempVal:Ljava/lang/String;

.field private wemoCertified:Z


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    const/4 v0, 0x0

    .line 17
    invoke-direct {p0}, Lorg/xml/sax/helpers/DefaultHandler;-><init>()V

    .line 19
    iput-boolean v0, p0, Lcom/belkin/upnp/parser/GetEndDeviceListResponse;->processValue:Z

    .line 20
    iput-boolean v0, p0, Lcom/belkin/upnp/parser/GetEndDeviceListResponse;->friendlyName:Z

    .line 23
    iput-boolean v0, p0, Lcom/belkin/upnp/parser/GetEndDeviceListResponse;->deviceInfo:Z

    .line 27
    iput-boolean v0, p0, Lcom/belkin/upnp/parser/GetEndDeviceListResponse;->deviceInfos:Z

    .line 30
    iput-boolean v0, p0, Lcom/belkin/upnp/parser/GetEndDeviceListResponse;->deviceId:Z

    .line 31
    iput-boolean v0, p0, Lcom/belkin/upnp/parser/GetEndDeviceListResponse;->deviceIndex:Z

    .line 32
    iput-boolean v0, p0, Lcom/belkin/upnp/parser/GetEndDeviceListResponse;->iconVersion:Z

    .line 33
    iput-boolean v0, p0, Lcom/belkin/upnp/parser/GetEndDeviceListResponse;->firmwareVersion:Z

    .line 34
    iput-boolean v0, p0, Lcom/belkin/upnp/parser/GetEndDeviceListResponse;->capabilityId:Z

    .line 35
    iput-boolean v0, p0, Lcom/belkin/upnp/parser/GetEndDeviceListResponse;->currenState:Z

    .line 36
    iput-boolean v0, p0, Lcom/belkin/upnp/parser/GetEndDeviceListResponse;->deviceListType:Z

    .line 37
    iput-boolean v0, p0, Lcom/belkin/upnp/parser/GetEndDeviceListResponse;->groupInfo:Z

    .line 38
    iput-boolean v0, p0, Lcom/belkin/upnp/parser/GetEndDeviceListResponse;->groupId:Z

    .line 39
    iput-boolean v0, p0, Lcom/belkin/upnp/parser/GetEndDeviceListResponse;->groupName:Z

    .line 40
    iput-boolean v0, p0, Lcom/belkin/upnp/parser/GetEndDeviceListResponse;->groupCapabilityId:Z

    .line 41
    iput-boolean v0, p0, Lcom/belkin/upnp/parser/GetEndDeviceListResponse;->groupCapabilityValues:Z

    .line 42
    iput-boolean v0, p0, Lcom/belkin/upnp/parser/GetEndDeviceListResponse;->manufacturerName:Z

    .line 43
    iput-boolean v0, p0, Lcom/belkin/upnp/parser/GetEndDeviceListResponse;->modelCode:Z

    .line 44
    iput-boolean v0, p0, Lcom/belkin/upnp/parser/GetEndDeviceListResponse;->productName:Z

    .line 45
    iput-boolean v0, p0, Lcom/belkin/upnp/parser/GetEndDeviceListResponse;->wemoCertified:Z

    .line 46
    iput-boolean v0, p0, Lcom/belkin/upnp/parser/GetEndDeviceListResponse;->rtmFW:Z

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
    .line 164
    invoke-super {p0, p1, p2, p3}, Lorg/xml/sax/helpers/DefaultHandler;->characters([CII)V

    .line 165
    const-string v1, " "

    .line 166
    .local v1, "replaceString":Ljava/lang/String;
    iget-boolean v2, p0, Lcom/belkin/upnp/parser/GetEndDeviceListResponse;->processValue:Z

    const/4 v3, 0x1

    if-ne v2, v3, :cond_1

    .line 167
    const/4 v2, 0x0

    aget-char v2, p1, v2

    const/16 v3, 0xa

    if-eq v2, v3, :cond_1

    .line 168
    new-instance v1, Ljava/lang/String;

    .end local v1    # "replaceString":Ljava/lang/String;
    invoke-direct {v1, p1, p2, p3}, Ljava/lang/String;-><init>([CII)V

    .line 169
    .restart local v1    # "replaceString":Ljava/lang/String;
    const-string v2, "available="

    invoke-virtual {v1, v2}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 170
    iget-object v2, p0, Lcom/belkin/upnp/parser/GetEndDeviceListResponse;->responseBuffer:Ljava/lang/StringBuffer;

    const-string v3, " "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 171
    :cond_0
    iget-object v2, p0, Lcom/belkin/upnp/parser/GetEndDeviceListResponse;->responseBuffer:Ljava/lang/StringBuffer;

    new-instance v3, Ljava/lang/String;

    invoke-direct {v3, p1, p2, p3}, Ljava/lang/String;-><init>([CII)V

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 174
    :cond_1
    new-instance v2, Ljava/lang/String;

    invoke-direct {v2, p1, p2, p3}, Ljava/lang/String;-><init>([CII)V

    iput-object v2, p0, Lcom/belkin/upnp/parser/GetEndDeviceListResponse;->tempVal:Ljava/lang/String;

    .line 176
    :try_start_0
    iget-object v2, p0, Lcom/belkin/upnp/parser/GetEndDeviceListResponse;->jsonObject:Lorg/json/JSONObject;

    const-string v3, "Availability"

    iget-object v4, p0, Lcom/belkin/upnp/parser/GetEndDeviceListResponse;->deviceIdAvailablity:Ljava/lang/String;

    invoke-virtual {v2, v3, v4}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 178
    iget-boolean v2, p0, Lcom/belkin/upnp/parser/GetEndDeviceListResponse;->groupInfo:Z

    if-eqz v2, :cond_12

    .line 179
    iget-boolean v2, p0, Lcom/belkin/upnp/parser/GetEndDeviceListResponse;->deviceIndex:Z

    if-eqz v2, :cond_2

    .line 180
    iget-object v2, p0, Lcom/belkin/upnp/parser/GetEndDeviceListResponse;->jsonObject:Lorg/json/JSONObject;

    const-string v3, "DeviceIndex"

    iget-object v4, p0, Lcom/belkin/upnp/parser/GetEndDeviceListResponse;->tempVal:Ljava/lang/String;

    invoke-virtual {v2, v3, v4}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 182
    :cond_2
    iget-boolean v2, p0, Lcom/belkin/upnp/parser/GetEndDeviceListResponse;->deviceListType:Z

    if-eqz v2, :cond_3

    .line 183
    iget-object v2, p0, Lcom/belkin/upnp/parser/GetEndDeviceListResponse;->jsonObject:Lorg/json/JSONObject;

    const-string v3, "DeviceListType"

    iget-object v4, p0, Lcom/belkin/upnp/parser/GetEndDeviceListResponse;->tempVal:Ljava/lang/String;

    invoke-virtual {v2, v3, v4}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 184
    iget-object v2, p0, Lcom/belkin/upnp/parser/GetEndDeviceListResponse;->tempVal:Ljava/lang/String;

    sput-object v2, Lcom/belkin/upnp/parser/GetEndDeviceListResponse;->deviceListTyp:Ljava/lang/String;

    .line 186
    :cond_3
    iget-boolean v2, p0, Lcom/belkin/upnp/parser/GetEndDeviceListResponse;->deviceId:Z

    if-eqz v2, :cond_4

    .line 187
    iget-object v2, p0, Lcom/belkin/upnp/parser/GetEndDeviceListResponse;->jsonObject:Lorg/json/JSONObject;

    const-string v3, "DeviceID"

    iget-object v4, p0, Lcom/belkin/upnp/parser/GetEndDeviceListResponse;->tempVal:Ljava/lang/String;

    invoke-virtual {v2, v3, v4}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 188
    :cond_4
    iget-boolean v2, p0, Lcom/belkin/upnp/parser/GetEndDeviceListResponse;->friendlyName:Z

    if-eqz v2, :cond_5

    .line 189
    iget-object v2, p0, Lcom/belkin/upnp/parser/GetEndDeviceListResponse;->jsonObject:Lorg/json/JSONObject;

    const-string v3, "FriendlyName"

    iget-object v4, p0, Lcom/belkin/upnp/parser/GetEndDeviceListResponse;->tempVal:Ljava/lang/String;

    invoke-virtual {v2, v3, v4}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 190
    :cond_5
    iget-boolean v2, p0, Lcom/belkin/upnp/parser/GetEndDeviceListResponse;->iconVersion:Z

    if-eqz v2, :cond_6

    .line 191
    iget-object v2, p0, Lcom/belkin/upnp/parser/GetEndDeviceListResponse;->jsonObject:Lorg/json/JSONObject;

    const-string v3, "IconVersion"

    iget-object v4, p0, Lcom/belkin/upnp/parser/GetEndDeviceListResponse;->tempVal:Ljava/lang/String;

    invoke-virtual {v2, v3, v4}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 192
    :cond_6
    iget-boolean v2, p0, Lcom/belkin/upnp/parser/GetEndDeviceListResponse;->firmwareVersion:Z

    if-eqz v2, :cond_7

    .line 193
    iget-object v2, p0, Lcom/belkin/upnp/parser/GetEndDeviceListResponse;->jsonObject:Lorg/json/JSONObject;

    const-string v3, "FirmwareVersion"

    iget-object v4, p0, Lcom/belkin/upnp/parser/GetEndDeviceListResponse;->tempVal:Ljava/lang/String;

    invoke-virtual {v2, v3, v4}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 194
    :cond_7
    iget-boolean v2, p0, Lcom/belkin/upnp/parser/GetEndDeviceListResponse;->capabilityId:Z

    if-eqz v2, :cond_8

    .line 195
    iget-object v2, p0, Lcom/belkin/upnp/parser/GetEndDeviceListResponse;->jsonObject:Lorg/json/JSONObject;

    const-string v3, "CapabilityIDs"

    iget-object v4, p0, Lcom/belkin/upnp/parser/GetEndDeviceListResponse;->tempVal:Ljava/lang/String;

    invoke-virtual {v2, v3, v4}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 196
    iget-object v2, p0, Lcom/belkin/upnp/parser/GetEndDeviceListResponse;->jsonObject:Lorg/json/JSONObject;

    const-string v3, "DeviceListType"

    sget-object v4, Lcom/belkin/upnp/parser/GetEndDeviceListResponse;->deviceListTyp:Ljava/lang/String;

    invoke-virtual {v2, v3, v4}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 197
    const-string v2, "device list type:"

    sget-object v3, Lcom/belkin/upnp/parser/GetEndDeviceListResponse;->deviceListTyp:Ljava/lang/String;

    invoke-static {v2, v3}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 198
    iget-object v2, p0, Lcom/belkin/upnp/parser/GetEndDeviceListResponse;->jsonGroupArray:Lorg/json/JSONArray;

    iget-object v3, p0, Lcom/belkin/upnp/parser/GetEndDeviceListResponse;->jsonObject:Lorg/json/JSONObject;

    invoke-virtual {v2, v3}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;

    .line 200
    :cond_8
    iget-boolean v2, p0, Lcom/belkin/upnp/parser/GetEndDeviceListResponse;->currenState:Z

    if-eqz v2, :cond_9

    .line 201
    iget-object v2, p0, Lcom/belkin/upnp/parser/GetEndDeviceListResponse;->jsonObject:Lorg/json/JSONObject;

    const-string v3, "CurrentState"

    iget-object v4, p0, Lcom/belkin/upnp/parser/GetEndDeviceListResponse;->tempVal:Ljava/lang/String;

    invoke-virtual {v2, v3, v4}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 206
    :cond_9
    iget-boolean v2, p0, Lcom/belkin/upnp/parser/GetEndDeviceListResponse;->manufacturerName:Z

    if-eqz v2, :cond_a

    .line 207
    iget-object v2, p0, Lcom/belkin/upnp/parser/GetEndDeviceListResponse;->jsonObject:Lorg/json/JSONObject;

    const-string v3, "ManufacturerName"

    iget-object v4, p0, Lcom/belkin/upnp/parser/GetEndDeviceListResponse;->tempVal:Ljava/lang/String;

    invoke-virtual {v2, v3, v4}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 208
    :cond_a
    iget-boolean v2, p0, Lcom/belkin/upnp/parser/GetEndDeviceListResponse;->modelCode:Z

    if-eqz v2, :cond_b

    .line 209
    iget-object v2, p0, Lcom/belkin/upnp/parser/GetEndDeviceListResponse;->jsonObject:Lorg/json/JSONObject;

    const-string v3, "ModelCode"

    iget-object v4, p0, Lcom/belkin/upnp/parser/GetEndDeviceListResponse;->tempVal:Ljava/lang/String;

    invoke-virtual {v2, v3, v4}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 210
    :cond_b
    iget-boolean v2, p0, Lcom/belkin/upnp/parser/GetEndDeviceListResponse;->productName:Z

    if-eqz v2, :cond_c

    .line 211
    iget-object v2, p0, Lcom/belkin/upnp/parser/GetEndDeviceListResponse;->jsonObject:Lorg/json/JSONObject;

    const-string v3, "ProductName"

    iget-object v4, p0, Lcom/belkin/upnp/parser/GetEndDeviceListResponse;->tempVal:Ljava/lang/String;

    invoke-virtual {v2, v3, v4}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 212
    :cond_c
    iget-boolean v2, p0, Lcom/belkin/upnp/parser/GetEndDeviceListResponse;->wemoCertified:Z

    if-eqz v2, :cond_d

    .line 213
    iget-object v2, p0, Lcom/belkin/upnp/parser/GetEndDeviceListResponse;->jsonObject:Lorg/json/JSONObject;

    const-string v3, "WemoCertified"

    iget-object v4, p0, Lcom/belkin/upnp/parser/GetEndDeviceListResponse;->tempVal:Ljava/lang/String;

    invoke-virtual {v2, v3, v4}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 214
    :cond_d
    iget-boolean v2, p0, Lcom/belkin/upnp/parser/GetEndDeviceListResponse;->groupId:Z

    if-eqz v2, :cond_e

    .line 215
    iget-object v2, p0, Lcom/belkin/upnp/parser/GetEndDeviceListResponse;->jsonGroupObj:Lorg/json/JSONObject;

    const-string v3, "GroupID"

    iget-object v4, p0, Lcom/belkin/upnp/parser/GetEndDeviceListResponse;->tempVal:Ljava/lang/String;

    invoke-virtual {v2, v3, v4}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 216
    :cond_e
    iget-boolean v2, p0, Lcom/belkin/upnp/parser/GetEndDeviceListResponse;->groupName:Z

    if-eqz v2, :cond_f

    .line 217
    iget-object v2, p0, Lcom/belkin/upnp/parser/GetEndDeviceListResponse;->jsonGroupObj:Lorg/json/JSONObject;

    const-string v3, "GroupName"

    iget-object v4, p0, Lcom/belkin/upnp/parser/GetEndDeviceListResponse;->tempVal:Ljava/lang/String;

    invoke-virtual {v2, v3, v4}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 218
    :cond_f
    iget-boolean v2, p0, Lcom/belkin/upnp/parser/GetEndDeviceListResponse;->groupCapabilityId:Z

    if-eqz v2, :cond_10

    .line 219
    iget-object v2, p0, Lcom/belkin/upnp/parser/GetEndDeviceListResponse;->jsonGroupObj:Lorg/json/JSONObject;

    const-string v3, "GroupCapabilityIDs"

    iget-object v4, p0, Lcom/belkin/upnp/parser/GetEndDeviceListResponse;->tempVal:Ljava/lang/String;

    invoke-virtual {v2, v3, v4}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 220
    :cond_10
    iget-boolean v2, p0, Lcom/belkin/upnp/parser/GetEndDeviceListResponse;->groupCapabilityValues:Z

    if-eqz v2, :cond_11

    .line 221
    iget-object v2, p0, Lcom/belkin/upnp/parser/GetEndDeviceListResponse;->jsonGroupObj:Lorg/json/JSONObject;

    const-string v3, "GroupCapabilityValues"

    iget-object v4, p0, Lcom/belkin/upnp/parser/GetEndDeviceListResponse;->tempVal:Ljava/lang/String;

    invoke-virtual {v2, v3, v4}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 268
    :cond_11
    :goto_0
    return-void

    .line 223
    :cond_12
    iget-boolean v2, p0, Lcom/belkin/upnp/parser/GetEndDeviceListResponse;->deviceIndex:Z

    if-eqz v2, :cond_13

    .line 224
    iget-object v2, p0, Lcom/belkin/upnp/parser/GetEndDeviceListResponse;->jsonObject:Lorg/json/JSONObject;

    const-string v3, "DeviceIndex"

    iget-object v4, p0, Lcom/belkin/upnp/parser/GetEndDeviceListResponse;->tempVal:Ljava/lang/String;

    invoke-virtual {v2, v3, v4}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 226
    :cond_13
    iget-boolean v2, p0, Lcom/belkin/upnp/parser/GetEndDeviceListResponse;->deviceListType:Z

    if-eqz v2, :cond_14

    .line 228
    iget-object v2, p0, Lcom/belkin/upnp/parser/GetEndDeviceListResponse;->tempVal:Ljava/lang/String;

    sput-object v2, Lcom/belkin/upnp/parser/GetEndDeviceListResponse;->deviceListTyp:Ljava/lang/String;

    .line 230
    :cond_14
    iget-boolean v2, p0, Lcom/belkin/upnp/parser/GetEndDeviceListResponse;->deviceId:Z

    if-eqz v2, :cond_15

    .line 231
    iget-object v2, p0, Lcom/belkin/upnp/parser/GetEndDeviceListResponse;->jsonObject:Lorg/json/JSONObject;

    const-string v3, "DeviceID"

    iget-object v4, p0, Lcom/belkin/upnp/parser/GetEndDeviceListResponse;->tempVal:Ljava/lang/String;

    invoke-virtual {v2, v3, v4}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 232
    :cond_15
    iget-boolean v2, p0, Lcom/belkin/upnp/parser/GetEndDeviceListResponse;->friendlyName:Z

    if-eqz v2, :cond_16

    .line 233
    iget-object v2, p0, Lcom/belkin/upnp/parser/GetEndDeviceListResponse;->jsonObject:Lorg/json/JSONObject;

    const-string v3, "FriendlyName"

    iget-object v4, p0, Lcom/belkin/upnp/parser/GetEndDeviceListResponse;->tempVal:Ljava/lang/String;

    invoke-virtual {v2, v3, v4}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 235
    :cond_16
    iget-boolean v2, p0, Lcom/belkin/upnp/parser/GetEndDeviceListResponse;->iconVersion:Z

    if-eqz v2, :cond_17

    .line 236
    iget-object v2, p0, Lcom/belkin/upnp/parser/GetEndDeviceListResponse;->jsonObject:Lorg/json/JSONObject;

    const-string v3, "IconVersion"

    iget-object v4, p0, Lcom/belkin/upnp/parser/GetEndDeviceListResponse;->tempVal:Ljava/lang/String;

    invoke-virtual {v2, v3, v4}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 237
    :cond_17
    iget-boolean v2, p0, Lcom/belkin/upnp/parser/GetEndDeviceListResponse;->firmwareVersion:Z

    if-eqz v2, :cond_18

    .line 238
    iget-object v2, p0, Lcom/belkin/upnp/parser/GetEndDeviceListResponse;->jsonObject:Lorg/json/JSONObject;

    const-string v3, "FirmwareVersion"

    iget-object v4, p0, Lcom/belkin/upnp/parser/GetEndDeviceListResponse;->tempVal:Ljava/lang/String;

    invoke-virtual {v2, v3, v4}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 239
    :cond_18
    iget-boolean v2, p0, Lcom/belkin/upnp/parser/GetEndDeviceListResponse;->capabilityId:Z

    if-eqz v2, :cond_19

    .line 240
    iget-object v2, p0, Lcom/belkin/upnp/parser/GetEndDeviceListResponse;->jsonObject:Lorg/json/JSONObject;

    const-string v3, "CapabilityIDs"

    iget-object v4, p0, Lcom/belkin/upnp/parser/GetEndDeviceListResponse;->tempVal:Ljava/lang/String;

    invoke-virtual {v2, v3, v4}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 242
    :cond_19
    iget-boolean v2, p0, Lcom/belkin/upnp/parser/GetEndDeviceListResponse;->manufacturerName:Z

    if-eqz v2, :cond_1a

    .line 243
    iget-object v2, p0, Lcom/belkin/upnp/parser/GetEndDeviceListResponse;->jsonObject:Lorg/json/JSONObject;

    const-string v3, "ManufacturerName"

    iget-object v4, p0, Lcom/belkin/upnp/parser/GetEndDeviceListResponse;->tempVal:Ljava/lang/String;

    invoke-virtual {v2, v3, v4}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 244
    :cond_1a
    iget-boolean v2, p0, Lcom/belkin/upnp/parser/GetEndDeviceListResponse;->modelCode:Z

    if-eqz v2, :cond_1b

    .line 245
    iget-object v2, p0, Lcom/belkin/upnp/parser/GetEndDeviceListResponse;->jsonObject:Lorg/json/JSONObject;

    const-string v3, "ModelCode"

    iget-object v4, p0, Lcom/belkin/upnp/parser/GetEndDeviceListResponse;->tempVal:Ljava/lang/String;

    invoke-virtual {v2, v3, v4}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 246
    :cond_1b
    iget-boolean v2, p0, Lcom/belkin/upnp/parser/GetEndDeviceListResponse;->productName:Z

    if-eqz v2, :cond_1c

    .line 247
    iget-object v2, p0, Lcom/belkin/upnp/parser/GetEndDeviceListResponse;->jsonObject:Lorg/json/JSONObject;

    const-string v3, "ProductName"

    iget-object v4, p0, Lcom/belkin/upnp/parser/GetEndDeviceListResponse;->tempVal:Ljava/lang/String;

    invoke-virtual {v2, v3, v4}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 248
    :cond_1c
    iget-boolean v2, p0, Lcom/belkin/upnp/parser/GetEndDeviceListResponse;->wemoCertified:Z

    if-eqz v2, :cond_1d

    .line 249
    iget-object v2, p0, Lcom/belkin/upnp/parser/GetEndDeviceListResponse;->jsonObject:Lorg/json/JSONObject;

    const-string v3, "WemoCertified"

    iget-object v4, p0, Lcom/belkin/upnp/parser/GetEndDeviceListResponse;->tempVal:Ljava/lang/String;

    invoke-virtual {v2, v3, v4}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 250
    iget-boolean v2, p0, Lcom/belkin/upnp/parser/GetEndDeviceListResponse;->rtmFW:Z

    if-nez v2, :cond_1d

    .line 251
    iget-object v2, p0, Lcom/belkin/upnp/parser/GetEndDeviceListResponse;->jsonObject:Lorg/json/JSONObject;

    const-string v3, "DeviceListType"

    sget-object v4, Lcom/belkin/upnp/parser/GetEndDeviceListResponse;->deviceListTyp:Ljava/lang/String;

    invoke-virtual {v2, v3, v4}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 252
    iget-object v2, p0, Lcom/belkin/upnp/parser/GetEndDeviceListResponse;->jsonArr:Lorg/json/JSONArray;

    iget-object v3, p0, Lcom/belkin/upnp/parser/GetEndDeviceListResponse;->jsonObject:Lorg/json/JSONObject;

    invoke-virtual {v2, v3}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;

    .line 255
    :cond_1d
    iget-boolean v2, p0, Lcom/belkin/upnp/parser/GetEndDeviceListResponse;->currenState:Z

    if-eqz v2, :cond_11

    .line 256
    iget-object v2, p0, Lcom/belkin/upnp/parser/GetEndDeviceListResponse;->jsonObject:Lorg/json/JSONObject;

    const-string v3, "CurrentState"

    iget-object v4, p0, Lcom/belkin/upnp/parser/GetEndDeviceListResponse;->tempVal:Ljava/lang/String;

    invoke-virtual {v2, v3, v4}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 257
    iget-boolean v2, p0, Lcom/belkin/upnp/parser/GetEndDeviceListResponse;->rtmFW:Z

    if-eqz v2, :cond_11

    .line 258
    iget-object v2, p0, Lcom/belkin/upnp/parser/GetEndDeviceListResponse;->jsonObject:Lorg/json/JSONObject;

    const-string v3, "DeviceListType"

    sget-object v4, Lcom/belkin/upnp/parser/GetEndDeviceListResponse;->deviceListTyp:Ljava/lang/String;

    invoke-virtual {v2, v3, v4}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 259
    iget-object v2, p0, Lcom/belkin/upnp/parser/GetEndDeviceListResponse;->jsonArr:Lorg/json/JSONArray;

    iget-object v3, p0, Lcom/belkin/upnp/parser/GetEndDeviceListResponse;->jsonObject:Lorg/json/JSONObject;

    invoke-virtual {v2, v3}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    goto/16 :goto_0

    .line 263
    :catch_0
    move-exception v0

    .line 265
    .local v0, "e":Lorg/json/JSONException;
    invoke-virtual {v0}, Lorg/json/JSONException;->printStackTrace()V

    goto/16 :goto_0
.end method

.method public endElement(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 5
    .param p1, "uri"    # Ljava/lang/String;
    .param p2, "localName"    # Ljava/lang/String;
    .param p3, "qName"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/xml/sax/SAXException;
        }
    .end annotation

    .prologue
    const/4 v4, 0x0

    .line 272
    invoke-super {p0, p1, p2, p3}, Lorg/xml/sax/helpers/DefaultHandler;->endElement(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 273
    const-string v1, "DeviceInfo"

    invoke-virtual {p3, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 274
    iput-boolean v4, p0, Lcom/belkin/upnp/parser/GetEndDeviceListResponse;->deviceInfo:Z

    .line 276
    :cond_0
    const-string v1, "DeviceInfos"

    invoke-virtual {p3, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 277
    iput-boolean v4, p0, Lcom/belkin/upnp/parser/GetEndDeviceListResponse;->deviceInfos:Z

    .line 279
    :cond_1
    const-string v1, "DeviceListType"

    invoke-virtual {p3, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    .line 280
    iput-boolean v4, p0, Lcom/belkin/upnp/parser/GetEndDeviceListResponse;->deviceListType:Z

    .line 281
    :cond_2
    const-string v1, "DeviceIndex"

    invoke-virtual {p3, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_3

    .line 282
    iput-boolean v4, p0, Lcom/belkin/upnp/parser/GetEndDeviceListResponse;->deviceIndex:Z

    .line 283
    :cond_3
    const-string v1, "DeviceID"

    invoke-virtual {p3, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_4

    .line 284
    iput-boolean v4, p0, Lcom/belkin/upnp/parser/GetEndDeviceListResponse;->deviceId:Z

    .line 285
    :cond_4
    const-string v1, "FriendlyName"

    invoke-virtual {p3, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_5

    .line 286
    iput-boolean v4, p0, Lcom/belkin/upnp/parser/GetEndDeviceListResponse;->friendlyName:Z

    .line 287
    :cond_5
    const-string v1, "IconVersion"

    invoke-virtual {p3, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_6

    .line 288
    iput-boolean v4, p0, Lcom/belkin/upnp/parser/GetEndDeviceListResponse;->iconVersion:Z

    .line 289
    :cond_6
    const-string v1, "FirmwareVersion"

    invoke-virtual {p3, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_7

    .line 290
    iput-boolean v4, p0, Lcom/belkin/upnp/parser/GetEndDeviceListResponse;->firmwareVersion:Z

    .line 291
    :cond_7
    const-string v1, "CapabilityIDs"

    invoke-virtual {p3, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_8

    .line 292
    iput-boolean v4, p0, Lcom/belkin/upnp/parser/GetEndDeviceListResponse;->capabilityId:Z

    .line 293
    :cond_8
    const-string v1, "CurrentState"

    invoke-virtual {p3, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_9

    .line 294
    iput-boolean v4, p0, Lcom/belkin/upnp/parser/GetEndDeviceListResponse;->currenState:Z

    .line 296
    :cond_9
    const-string v1, "Manufacturer"

    invoke-virtual {p3, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_a

    .line 297
    iput-boolean v4, p0, Lcom/belkin/upnp/parser/GetEndDeviceListResponse;->manufacturerName:Z

    .line 299
    :cond_a
    const-string v1, "ModelCode"

    invoke-virtual {p3, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_b

    .line 300
    iput-boolean v4, p0, Lcom/belkin/upnp/parser/GetEndDeviceListResponse;->modelCode:Z

    .line 302
    :cond_b
    const-string v1, "productName"

    invoke-virtual {p3, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_c

    .line 303
    iput-boolean v4, p0, Lcom/belkin/upnp/parser/GetEndDeviceListResponse;->productName:Z

    .line 305
    :cond_c
    const-string v1, "WeMoCertified"

    invoke-virtual {p3, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_d

    .line 306
    iput-boolean v4, p0, Lcom/belkin/upnp/parser/GetEndDeviceListResponse;->wemoCertified:Z

    .line 308
    :cond_d
    const-string v1, "GroupInfo"

    invoke-virtual {p3, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_e

    .line 310
    :try_start_0
    iget-object v1, p0, Lcom/belkin/upnp/parser/GetEndDeviceListResponse;->jsonGroupObj:Lorg/json/JSONObject;

    const-string v2, "GroupIDS"

    iget-object v3, p0, Lcom/belkin/upnp/parser/GetEndDeviceListResponse;->jsonGroupArray:Lorg/json/JSONArray;

    invoke-virtual {v1, v2, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 314
    :goto_0
    iget-object v1, p0, Lcom/belkin/upnp/parser/GetEndDeviceListResponse;->jsonArr:Lorg/json/JSONArray;

    iget-object v2, p0, Lcom/belkin/upnp/parser/GetEndDeviceListResponse;->jsonGroupObj:Lorg/json/JSONObject;

    invoke-virtual {v1, v2}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;

    .line 315
    iput-boolean v4, p0, Lcom/belkin/upnp/parser/GetEndDeviceListResponse;->groupInfo:Z

    .line 318
    :cond_e
    const-string v1, "GroupID"

    invoke-virtual {p3, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_f

    .line 319
    iput-boolean v4, p0, Lcom/belkin/upnp/parser/GetEndDeviceListResponse;->groupId:Z

    .line 321
    :cond_f
    const-string v1, "GroupName"

    invoke-virtual {p3, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_10

    .line 322
    iput-boolean v4, p0, Lcom/belkin/upnp/parser/GetEndDeviceListResponse;->groupName:Z

    .line 324
    :cond_10
    const-string v1, "GroupCapabilityIDs"

    invoke-virtual {p3, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_11

    .line 325
    iput-boolean v4, p0, Lcom/belkin/upnp/parser/GetEndDeviceListResponse;->groupCapabilityId:Z

    .line 327
    :cond_11
    const-string v1, "GroupCapabilityValues"

    invoke-virtual {p3, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_12

    .line 328
    iput-boolean v4, p0, Lcom/belkin/upnp/parser/GetEndDeviceListResponse;->groupCapabilityValues:Z

    .line 331
    :cond_12
    return-void

    .line 311
    :catch_0
    move-exception v0

    .line 312
    .local v0, "e":Lorg/json/JSONException;
    invoke-virtual {v0}, Lorg/json/JSONException;->printStackTrace()V

    goto :goto_0
.end method

.method public parseForGetEndDeviceList(Ljava/lang/String;)Lorg/json/JSONArray;
    .locals 5
    .param p1, "response"    # Ljava/lang/String;

    .prologue
    .line 62
    new-instance v2, Lcom/belkin/beans/GetEndDeviceListResponseBean;

    invoke-direct {v2}, Lcom/belkin/beans/GetEndDeviceListResponseBean;-><init>()V

    iput-object v2, p0, Lcom/belkin/upnp/parser/GetEndDeviceListResponse;->endList:Lcom/belkin/beans/GetEndDeviceListResponseBean;

    .line 63
    new-instance v2, Lorg/json/JSONObject;

    invoke-direct {v2}, Lorg/json/JSONObject;-><init>()V

    iput-object v2, p0, Lcom/belkin/upnp/parser/GetEndDeviceListResponse;->jsonObject:Lorg/json/JSONObject;

    .line 64
    new-instance v2, Lorg/json/JSONObject;

    invoke-direct {v2}, Lorg/json/JSONObject;-><init>()V

    iput-object v2, p0, Lcom/belkin/upnp/parser/GetEndDeviceListResponse;->jsonGroupObj:Lorg/json/JSONObject;

    .line 65
    new-instance v2, Lorg/json/JSONArray;

    invoke-direct {v2}, Lorg/json/JSONArray;-><init>()V

    iput-object v2, p0, Lcom/belkin/upnp/parser/GetEndDeviceListResponse;->jsonArr:Lorg/json/JSONArray;

    .line 66
    new-instance v2, Lorg/json/JSONArray;

    invoke-direct {v2}, Lorg/json/JSONArray;-><init>()V

    iput-object v2, p0, Lcom/belkin/upnp/parser/GetEndDeviceListResponse;->jsonGroupArray:Lorg/json/JSONArray;

    .line 67
    new-instance v2, Ljava/lang/StringBuffer;

    invoke-direct {v2}, Ljava/lang/StringBuffer;-><init>()V

    iput-object v2, p0, Lcom/belkin/upnp/parser/GetEndDeviceListResponse;->responseBuffer:Ljava/lang/StringBuffer;

    .line 70
    :try_start_0
    invoke-static {p1, p0}, Landroid/util/Xml;->parse(Ljava/lang/String;Lorg/xml/sax/ContentHandler;)V
    :try_end_0
    .catch Lorg/xml/sax/SAXException; {:try_start_0 .. :try_end_0} :catch_0

    .line 74
    :goto_0
    new-instance v1, Ljava/lang/String;

    iget-object v2, p0, Lcom/belkin/upnp/parser/GetEndDeviceListResponse;->responseBuffer:Ljava/lang/StringBuffer;

    invoke-direct {v1, v2}, Ljava/lang/String;-><init>(Ljava/lang/StringBuffer;)V

    .line 75
    .local v1, "parsedResponse":Ljava/lang/String;
    const-string v2, "&lt;"

    const-string v3, "<"

    invoke-virtual {v1, v2, v3}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    .line 76
    const-string v2, "&gt;"

    const-string v3, ">"

    invoke-virtual {v1, v2, v3}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    .line 77
    const-string v2, "&quot;"

    const-string v3, "\"\""

    invoke-virtual {v1, v2, v3}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    .line 78
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

    .line 79
    const-string v2, "ModelCode"

    invoke-virtual {v1, v2}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v2

    if-nez v2, :cond_0

    .line 80
    const/4 v2, 0x1

    iput-boolean v2, p0, Lcom/belkin/upnp/parser/GetEndDeviceListResponse;->rtmFW:Z

    .line 83
    :cond_0
    :try_start_1
    invoke-static {v1, p0}, Landroid/util/Xml;->parse(Ljava/lang/String;Lorg/xml/sax/ContentHandler;)V
    :try_end_1
    .catch Lorg/xml/sax/SAXException; {:try_start_1 .. :try_end_1} :catch_1

    .line 89
    :goto_1
    iget-object v2, p0, Lcom/belkin/upnp/parser/GetEndDeviceListResponse;->jsonArr:Lorg/json/JSONArray;

    return-object v2

    .line 71
    .end local v1    # "parsedResponse":Ljava/lang/String;
    :catch_0
    move-exception v0

    .line 72
    .local v0, "e":Lorg/xml/sax/SAXException;
    invoke-virtual {v0}, Lorg/xml/sax/SAXException;->printStackTrace()V

    goto :goto_0

    .line 85
    .end local v0    # "e":Lorg/xml/sax/SAXException;
    .restart local v1    # "parsedResponse":Ljava/lang/String;
    :catch_1
    move-exception v0

    .line 86
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

    .line 94
    invoke-super {p0, p1, p2, p3, p4}, Lorg/xml/sax/helpers/DefaultHandler;->startElement(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lorg/xml/sax/Attributes;)V

    .line 95
    const-string v0, "DeviceLists"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 96
    iput-boolean v1, p0, Lcom/belkin/upnp/parser/GetEndDeviceListResponse;->processValue:Z

    .line 98
    :cond_0
    const-string v0, "DeviceListType"

    invoke-virtual {p3, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 99
    iput-boolean v1, p0, Lcom/belkin/upnp/parser/GetEndDeviceListResponse;->deviceListType:Z

    .line 101
    :cond_1
    const-string v0, "DeviceInfo"

    invoke-virtual {p3, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 102
    iput-boolean v1, p0, Lcom/belkin/upnp/parser/GetEndDeviceListResponse;->deviceInfo:Z

    .line 103
    new-instance v0, Lorg/json/JSONObject;

    invoke-direct {v0}, Lorg/json/JSONObject;-><init>()V

    iput-object v0, p0, Lcom/belkin/upnp/parser/GetEndDeviceListResponse;->jsonObject:Lorg/json/JSONObject;

    .line 105
    :cond_2
    const-string v0, "DeviceInfos"

    invoke-virtual {p3, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_3

    .line 106
    iput-boolean v1, p0, Lcom/belkin/upnp/parser/GetEndDeviceListResponse;->deviceInfos:Z

    .line 108
    :cond_3
    const-string v0, "DeviceIndex"

    invoke-virtual {p3, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_4

    .line 109
    iput-boolean v1, p0, Lcom/belkin/upnp/parser/GetEndDeviceListResponse;->deviceIndex:Z

    .line 111
    :cond_4
    const-string v0, "DeviceID"

    invoke-virtual {p3, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_5

    .line 112
    iput-boolean v1, p0, Lcom/belkin/upnp/parser/GetEndDeviceListResponse;->deviceId:Z

    .line 113
    const-string v0, "available"

    invoke-interface {p4, v0}, Lorg/xml/sax/Attributes;->getValue(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/belkin/upnp/parser/GetEndDeviceListResponse;->deviceIdAvailablity:Ljava/lang/String;

    .line 115
    :cond_5
    const-string v0, "FriendlyName"

    invoke-virtual {p3, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_6

    .line 116
    iput-boolean v1, p0, Lcom/belkin/upnp/parser/GetEndDeviceListResponse;->friendlyName:Z

    .line 118
    :cond_6
    const-string v0, "IconVersion"

    invoke-virtual {p3, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_7

    .line 119
    iput-boolean v1, p0, Lcom/belkin/upnp/parser/GetEndDeviceListResponse;->iconVersion:Z

    .line 121
    :cond_7
    const-string v0, "FirmwareVersion"

    invoke-virtual {p3, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_8

    .line 122
    iput-boolean v1, p0, Lcom/belkin/upnp/parser/GetEndDeviceListResponse;->firmwareVersion:Z

    .line 124
    :cond_8
    const-string v0, "CapabilityIDs"

    invoke-virtual {p3, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_9

    .line 125
    iput-boolean v1, p0, Lcom/belkin/upnp/parser/GetEndDeviceListResponse;->capabilityId:Z

    .line 127
    :cond_9
    const-string v0, "CurrentState"

    invoke-virtual {p3, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_a

    .line 128
    iput-boolean v1, p0, Lcom/belkin/upnp/parser/GetEndDeviceListResponse;->currenState:Z

    .line 130
    :cond_a
    const-string v0, "GroupInfo"

    invoke-virtual {p3, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_b

    .line 131
    iput-boolean v1, p0, Lcom/belkin/upnp/parser/GetEndDeviceListResponse;->groupInfo:Z

    .line 132
    new-instance v0, Lorg/json/JSONObject;

    invoke-direct {v0}, Lorg/json/JSONObject;-><init>()V

    iput-object v0, p0, Lcom/belkin/upnp/parser/GetEndDeviceListResponse;->jsonGroupObj:Lorg/json/JSONObject;

    .line 133
    new-instance v0, Lorg/json/JSONArray;

    invoke-direct {v0}, Lorg/json/JSONArray;-><init>()V

    iput-object v0, p0, Lcom/belkin/upnp/parser/GetEndDeviceListResponse;->jsonGroupArray:Lorg/json/JSONArray;

    .line 135
    :cond_b
    const-string v0, "GroupID"

    invoke-virtual {p3, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_c

    .line 136
    iput-boolean v1, p0, Lcom/belkin/upnp/parser/GetEndDeviceListResponse;->groupId:Z

    .line 138
    :cond_c
    const-string v0, "GroupName"

    invoke-virtual {p3, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_d

    .line 139
    iput-boolean v1, p0, Lcom/belkin/upnp/parser/GetEndDeviceListResponse;->groupName:Z

    .line 141
    :cond_d
    const-string v0, "GroupCapabilityIDs"

    invoke-virtual {p3, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_e

    .line 142
    iput-boolean v1, p0, Lcom/belkin/upnp/parser/GetEndDeviceListResponse;->groupCapabilityId:Z

    .line 144
    :cond_e
    const-string v0, "GroupCapabilityValues"

    invoke-virtual {p3, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_f

    .line 145
    iput-boolean v1, p0, Lcom/belkin/upnp/parser/GetEndDeviceListResponse;->groupCapabilityValues:Z

    .line 147
    :cond_f
    const-string v0, "Manufacturer"

    invoke-virtual {p3, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_10

    .line 148
    iput-boolean v1, p0, Lcom/belkin/upnp/parser/GetEndDeviceListResponse;->manufacturerName:Z

    .line 150
    :cond_10
    const-string v0, "ModelCode"

    invoke-virtual {p3, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_11

    .line 151
    iput-boolean v1, p0, Lcom/belkin/upnp/parser/GetEndDeviceListResponse;->modelCode:Z

    .line 153
    :cond_11
    const-string v0, "productName"

    invoke-virtual {p3, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_12

    .line 154
    iput-boolean v1, p0, Lcom/belkin/upnp/parser/GetEndDeviceListResponse;->productName:Z

    .line 156
    :cond_12
    const-string v0, "WeMoCertified"

    invoke-virtual {p3, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_13

    .line 157
    iput-boolean v1, p0, Lcom/belkin/upnp/parser/GetEndDeviceListResponse;->wemoCertified:Z

    .line 159
    :cond_13
    return-void
.end method
