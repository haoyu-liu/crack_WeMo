.class public Lcom/belkin/wemo/cache/cloud/CloudRequestChangeAttributes;
.super Ljava/lang/Object;
.source "CloudRequestChangeAttributes.java"

# interfaces
.implements Lcom/belkin/wemo/cache/cloud/CloudRequestInterface;


# instance fields
.field private final TAG:Ljava/lang/String;

.field private TIMEOUT:I

.field private final TIMEOUT_LIMIT:I

.field private final URL:Ljava/lang/String;

.field private changedAttributeList:Lorg/json/JSONObject;

.field private mCacheManager:Lcom/belkin/wemo/cache/CacheManager;

.field private mDevMgr:Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

.field private mDeviceInfo:Lcom/belkin/wemo/cache/data/DeviceInformation;

.field private mDevicesArray:Lcom/belkin/wemo/cache/data/DevicesArray;

.field private mac:Ljava/lang/String;

.field private pluginID:Ljava/lang/String;

.field private status:Ljava/lang/String;

.field private udn:Ljava/lang/String;


# direct methods
.method public constructor <init>(Landroid/content/Context;Ljava/lang/String;Lorg/json/JSONObject;)V
    .locals 2
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "udn"    # Ljava/lang/String;
    .param p3, "attributeList"    # Lorg/json/JSONObject;

    .prologue
    .line 38
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 23
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v1, Lcom/belkin/wemo/cache/cloud/CloudConstants;->CLOUD_URL:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "/apis/http/plugin/message/"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestChangeAttributes;->URL:Ljava/lang/String;

    .line 24
    const-string v0, "SDK_CloudRequestChangeAttributes"

    iput-object v0, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestChangeAttributes;->TAG:Ljava/lang/String;

    .line 25
    const/16 v0, 0x7530

    iput v0, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestChangeAttributes;->TIMEOUT_LIMIT:I

    .line 31
    const/16 v0, 0x2710

    iput v0, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestChangeAttributes;->TIMEOUT:I

    .line 39
    invoke-static {p1}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->getInstance(Landroid/content/Context;)Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    move-result-object v0

    iput-object v0, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestChangeAttributes;->mDevMgr:Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    .line 40
    invoke-static {}, Lcom/belkin/wemo/cache/data/DevicesArray;->getInstance()Lcom/belkin/wemo/cache/data/DevicesArray;

    move-result-object v0

    iput-object v0, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestChangeAttributes;->mDevicesArray:Lcom/belkin/wemo/cache/data/DevicesArray;

    .line 41
    invoke-static {p1}, Lcom/belkin/wemo/cache/CacheManager;->getInstance(Landroid/content/Context;)Lcom/belkin/wemo/cache/CacheManager;

    move-result-object v0

    iput-object v0, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestChangeAttributes;->mCacheManager:Lcom/belkin/wemo/cache/CacheManager;

    .line 42
    iget-object v0, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestChangeAttributes;->mDevicesArray:Lcom/belkin/wemo/cache/data/DevicesArray;

    invoke-virtual {v0, p2}, Lcom/belkin/wemo/cache/data/DevicesArray;->getDeviceInformation(Ljava/lang/String;)Lcom/belkin/wemo/cache/data/DeviceInformation;

    move-result-object v0

    iput-object v0, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestChangeAttributes;->mDeviceInfo:Lcom/belkin/wemo/cache/data/DeviceInformation;

    .line 43
    iget-object v0, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestChangeAttributes;->mDeviceInfo:Lcom/belkin/wemo/cache/data/DeviceInformation;

    invoke-virtual {v0}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getPluginID()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestChangeAttributes;->pluginID:Ljava/lang/String;

    .line 44
    iget-object v0, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestChangeAttributes;->mDeviceInfo:Lcom/belkin/wemo/cache/data/DeviceInformation;

    invoke-virtual {v0}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getMAC()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestChangeAttributes;->mac:Ljava/lang/String;

    .line 45
    iput-object p2, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestChangeAttributes;->udn:Ljava/lang/String;

    .line 46
    iput-object p3, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestChangeAttributes;->changedAttributeList:Lorg/json/JSONObject;

    .line 47
    return-void
.end method


# virtual methods
.method public getAdditionalHeaders()Ljava/util/Map;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    .line 174
    const/4 v0, 0x0

    return-object v0
.end method

.method public getBody()Ljava/lang/String;
    .locals 8

    .prologue
    .line 74
    const-string v3, ""

    .line 75
    .local v3, "key":Ljava/lang/String;
    const-string v5, ""

    .line 76
    .local v5, "value":Ljava/lang/String;
    new-instance v4, Ljava/lang/StringBuffer;

    invoke-direct {v4}, Ljava/lang/StringBuffer;-><init>()V

    .line 77
    .local v4, "str":Ljava/lang/StringBuffer;
    iget-object v6, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestChangeAttributes;->changedAttributeList:Lorg/json/JSONObject;

    invoke-virtual {v6}, Lorg/json/JSONObject;->keys()Ljava/util/Iterator;

    move-result-object v2

    .line 79
    .local v2, "itr":Ljava/util/Iterator;, "Ljava/util/Iterator<*>;"
    :goto_0
    :try_start_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_0

    .line 80
    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v6

    move-object v0, v6

    check-cast v0, Ljava/lang/String;

    move-object v3, v0

    .line 81
    iget-object v6, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestChangeAttributes;->changedAttributeList:Lorg/json/JSONObject;

    invoke-virtual {v6, v3}, Lorg/json/JSONObject;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v6

    invoke-static {v6}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    .line 83
    const-string v6, "<attribute>"

    invoke-virtual {v4, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 84
    const-string v6, "<name>"

    invoke-virtual {v4, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 85
    invoke-static {v3}, Lcom/belkin/wemo/cache/utils/StringUtils;->toUpperCamelCase(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v4, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 86
    const-string v6, "</name>"

    invoke-virtual {v4, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 87
    const-string v6, "<value>"

    invoke-virtual {v4, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 88
    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 89
    const-string v6, "</value>"

    invoke-virtual {v4, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 90
    const-string v6, "</attribute>"

    invoke-virtual {v4, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 92
    :catch_0
    move-exception v1

    .line 93
    .local v1, "e":Lorg/json/JSONException;
    invoke-virtual {v1}, Lorg/json/JSONException;->printStackTrace()V

    .line 96
    .end local v1    # "e":Lorg/json/JSONException;
    :cond_0
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "<plugins>\n    <plugin>                 \n        <recipientId>"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    iget-object v7, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestChangeAttributes;->pluginID:Ljava/lang/String;

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, "</recipientId>                    \n"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, "        <macAddress>"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    iget-object v7, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestChangeAttributes;->mac:Ljava/lang/String;

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, "</macAddress>\n"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, "        <content>                          \n"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, "            <![CDATA[ <pluginSetDeviceStatus>\n"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, "                            <plugin>                                               \n"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, "                                <pluginId>"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    iget-object v7, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestChangeAttributes;->pluginID:Ljava/lang/String;

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, "</pluginId>                                                 \n"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, "                                <macAddress>"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    iget-object v7, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestChangeAttributes;->mac:Ljava/lang/String;

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, "</macAddress> \n"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, "                                <status>"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    iget-object v7, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestChangeAttributes;->status:Ljava/lang/String;

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, "</status>\n"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, "                    <attributeLists action=\"SetAttributes\" >"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, "</attributeLists>\n"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, "                            </plugin>\n"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, "                      </pluginSetDeviceStatus > ]]>            \n"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, "        </content>    \n"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, "    </plugin>\n"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, "</plugins>"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    return-object v6
.end method

.method public getFileByteArray()[B
    .locals 1

    .prologue
    .line 159
    const/4 v0, 0x0

    return-object v0
.end method

.method public getRequestMethod()I
    .locals 1

    .prologue
    .line 51
    const/4 v0, 0x1

    return v0
.end method

.method public getTimeout()I
    .locals 1

    .prologue
    .line 56
    iget v0, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestChangeAttributes;->TIMEOUT:I

    return v0
.end method

.method public getTimeoutLimit()I
    .locals 1

    .prologue
    .line 61
    const/16 v0, 0x7530

    return v0
.end method

.method public getURL()Ljava/lang/String;
    .locals 1

    .prologue
    .line 66
    iget-object v0, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestChangeAttributes;->URL:Ljava/lang/String;

    return-object v0
.end method

.method public getUploadFileName()Ljava/lang/String;
    .locals 1

    .prologue
    .line 164
    const/4 v0, 0x0

    return-object v0
.end method

.method public isAuthHeaderRequired()Z
    .locals 1

    .prologue
    .line 169
    const/4 v0, 0x1

    return v0
.end method

.method public requestComplete(ZI[B)V
    .locals 12
    .param p1, "success"    # Z
    .param p2, "statusCode"    # I
    .param p3, "resp"    # [B

    .prologue
    .line 116
    const-string v7, "setNewAttributesForDevice: "

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "success: "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, p1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-static {v7, v8}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 117
    if-eqz p1, :cond_3

    .line 119
    :try_start_0
    new-instance v5, Ljava/lang/String;

    const-string v7, "UTF-8"

    invoke-direct {v5, p3, v7}, Ljava/lang/String;-><init>([BLjava/lang/String;)V

    .line 120
    .local v5, "response":Ljava/lang/String;
    const-string v7, "SDK_CloudRequestChangeAttributes"

    invoke-static {v7, v5}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 121
    if-eqz v5, :cond_2

    .line 122
    const-string v1, ""

    .line 123
    .local v1, "binaryState":Ljava/lang/String;
    iget-object v7, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestChangeAttributes;->mDeviceInfo:Lcom/belkin/wemo/cache/data/DeviceInformation;

    invoke-virtual {v7}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getAttributeList()Lorg/json/JSONObject;

    move-result-object v2

    .line 125
    .local v2, "deviceAttributes":Lorg/json/JSONObject;
    iget-object v7, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestChangeAttributes;->changedAttributeList:Lorg/json/JSONObject;

    invoke-virtual {v7}, Lorg/json/JSONObject;->keys()Ljava/util/Iterator;

    move-result-object v0

    .line 126
    .local v0, "attributeItr":Ljava/util/Iterator;, "Ljava/util/Iterator<*>;"
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v7

    if-eqz v7, :cond_0

    .line 127
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;
    :try_end_0
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_0 .. :try_end_0} :catch_1

    .line 129
    .local v4, "key":Ljava/lang/String;
    :try_start_1
    invoke-virtual {v2, v4}, Lorg/json/JSONObject;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lorg/json/JSONObject;

    .line 130
    .local v6, "valObject":Lorg/json/JSONObject;
    iget-object v7, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestChangeAttributes;->changedAttributeList:Lorg/json/JSONObject;

    invoke-virtual {v7, v4}, Lorg/json/JSONObject;->opt(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v7

    invoke-static {v7}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    .line 131
    const-string v7, "value"

    iget-object v8, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestChangeAttributes;->changedAttributeList:Lorg/json/JSONObject;

    invoke-virtual {v8, v4}, Lorg/json/JSONObject;->opt(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v8

    invoke-virtual {v6, v7, v8}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 132
    invoke-virtual {v2, v4, v6}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_1
    .catch Lorg/json/JSONException; {:try_start_1 .. :try_end_1} :catch_0
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_1 .. :try_end_1} :catch_1

    goto :goto_0

    .line 133
    .end local v6    # "valObject":Lorg/json/JSONObject;
    :catch_0
    move-exception v3

    .line 135
    .local v3, "e":Lorg/json/JSONException;
    :try_start_2
    invoke-virtual {v3}, Lorg/json/JSONException;->printStackTrace()V
    :try_end_2
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_2 .. :try_end_2} :catch_1

    goto :goto_0

    .line 149
    .end local v0    # "attributeItr":Ljava/util/Iterator;, "Ljava/util/Iterator<*>;"
    .end local v1    # "binaryState":Ljava/lang/String;
    .end local v2    # "deviceAttributes":Lorg/json/JSONObject;
    .end local v3    # "e":Lorg/json/JSONException;
    .end local v4    # "key":Ljava/lang/String;
    .end local v5    # "response":Ljava/lang/String;
    :catch_1
    move-exception v3

    .line 150
    .local v3, "e":Ljava/io/UnsupportedEncodingException;
    const-string v7, "SDK_CloudRequestChangeAttributes"

    const-string v8, "error in setattributes"

    invoke-static {v7, v8, v3}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Exception;)V

    .line 154
    .end local v3    # "e":Ljava/io/UnsupportedEncodingException;
    :goto_1
    return-void

    .line 138
    .restart local v0    # "attributeItr":Ljava/util/Iterator;, "Ljava/util/Iterator<*>;"
    .restart local v1    # "binaryState":Ljava/lang/String;
    .restart local v2    # "deviceAttributes":Lorg/json/JSONObject;
    .restart local v5    # "response":Ljava/lang/String;
    :cond_0
    :try_start_3
    iget-object v7, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestChangeAttributes;->mDeviceInfo:Lcom/belkin/wemo/cache/data/DeviceInformation;

    invoke-virtual {v7, v2}, Lcom/belkin/wemo/cache/data/DeviceInformation;->setAttributeList(Lorg/json/JSONObject;)V

    .line 139
    const-string v7, ""

    if-eq v1, v7, :cond_1

    .line 140
    iget-object v7, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestChangeAttributes;->mDeviceInfo:Lcom/belkin/wemo/cache/data/DeviceInformation;

    invoke-virtual {v7, v1}, Lcom/belkin/wemo/cache/data/DeviceInformation;->setBinaryState(Ljava/lang/String;)V

    .line 141
    iget-object v7, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestChangeAttributes;->mDeviceInfo:Lcom/belkin/wemo/cache/data/DeviceInformation;

    invoke-static {v1}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v8

    invoke-virtual {v7, v8}, Lcom/belkin/wemo/cache/data/DeviceInformation;->setState(I)V

    .line 143
    :cond_1
    iget-object v7, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestChangeAttributes;->mDevicesArray:Lcom/belkin/wemo/cache/data/DevicesArray;

    iget-object v8, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestChangeAttributes;->mDeviceInfo:Lcom/belkin/wemo/cache/data/DeviceInformation;

    invoke-virtual {v7, v8}, Lcom/belkin/wemo/cache/data/DevicesArray;->addOrUpdateDeviceInformation(Lcom/belkin/wemo/cache/data/DeviceInformation;)V

    .line 144
    iget-object v7, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestChangeAttributes;->mCacheManager:Lcom/belkin/wemo/cache/CacheManager;

    iget-object v8, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestChangeAttributes;->mDeviceInfo:Lcom/belkin/wemo/cache/data/DeviceInformation;

    const/4 v9, 0x0

    const/4 v10, 0x0

    const/4 v11, 0x1

    invoke-virtual {v7, v8, v9, v10, v11}, Lcom/belkin/wemo/cache/CacheManager;->updateDB(Lcom/belkin/wemo/cache/data/DeviceInformation;ZZZ)V

    .line 146
    .end local v0    # "attributeItr":Ljava/util/Iterator;, "Ljava/util/Iterator<*>;"
    .end local v1    # "binaryState":Ljava/lang/String;
    .end local v2    # "deviceAttributes":Lorg/json/JSONObject;
    :cond_2
    iget-object v7, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestChangeAttributes;->mDevMgr:Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    const-string v8, "set_state"

    invoke-static {p1}, Ljava/lang/Boolean;->toString(Z)Ljava/lang/String;

    move-result-object v9

    iget-object v10, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestChangeAttributes;->mDeviceInfo:Lcom/belkin/wemo/cache/data/DeviceInformation;

    invoke-virtual {v10}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getUDN()Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v7, v8, v9, v10}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->sendNotification(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    :try_end_3
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_3 .. :try_end_3} :catch_1

    goto :goto_1

    .line 153
    .end local v5    # "response":Ljava/lang/String;
    :cond_3
    iget-object v7, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestChangeAttributes;->mDevMgr:Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    const-string v8, "set_state"

    invoke-static {p1}, Ljava/lang/Boolean;->toString(Z)Ljava/lang/String;

    move-result-object v9

    iget-object v10, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestChangeAttributes;->mDeviceInfo:Lcom/belkin/wemo/cache/data/DeviceInformation;

    invoke-virtual {v10}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getUDN()Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v7, v8, v9, v10}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->sendNotification(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_1
.end method
