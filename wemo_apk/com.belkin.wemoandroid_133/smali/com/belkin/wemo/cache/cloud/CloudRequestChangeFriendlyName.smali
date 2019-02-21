.class public Lcom/belkin/wemo/cache/cloud/CloudRequestChangeFriendlyName;
.super Ljava/lang/Object;
.source "CloudRequestChangeFriendlyName.java"

# interfaces
.implements Lcom/belkin/wemo/cache/cloud/CloudRequestInterface;


# static fields
.field private static final KEY_FRIENDLY_NAME:Ljava/lang/String; = "friendlyName"

.field private static final KEY_PLUGIN_TAG:Ljava/lang/String; = "plugin"


# instance fields
.field private final TAG:Ljava/lang/String;

.field private TIMEOUT:I

.field private final TIMEOUT_LIMIT:I

.field private final URL:Ljava/lang/String;

.field private bridgeMac:Ljava/lang/String;

.field private bridgePluginID:Ljava/lang/String;

.field private devName:Ljava/lang/String;

.field private friendlyName:Ljava/lang/String;

.field private mDevMgr:Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

.field private mac:Ljava/lang/String;

.field private pluginID:Ljava/lang/String;

.field private postOperationNotification:Ljava/lang/String;

.field private udn:Ljava/lang/String;


# direct methods
.method public varargs constructor <init>(Lcom/belkin/wemo/cache/devicelist/DeviceListManager;Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V
    .locals 5
    .param p1, "devMgr"    # Lcom/belkin/wemo/cache/devicelist/DeviceListManager;
    .param p2, "context"    # Landroid/content/Context;
    .param p3, "udn"    # Ljava/lang/String;
    .param p4, "pluginID"    # Ljava/lang/String;
    .param p5, "mac"    # Ljava/lang/String;
    .param p6, "name"    # Ljava/lang/String;
    .param p7, "extraProps"    # [Ljava/lang/Object;

    .prologue
    const/4 v4, 0x0

    .line 40
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 26
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v3, Lcom/belkin/wemo/cache/cloud/CloudConstants;->CLOUD_URL:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "/apis/http/plugin/message/"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    iput-object v2, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestChangeFriendlyName;->URL:Ljava/lang/String;

    .line 27
    const-string v2, "SDK_CloudRequestChangeFriendlyName"

    iput-object v2, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestChangeFriendlyName;->TAG:Ljava/lang/String;

    .line 28
    const v2, 0xafc8

    iput v2, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestChangeFriendlyName;->TIMEOUT_LIMIT:I

    .line 34
    const v2, 0xea60

    iput v2, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestChangeFriendlyName;->TIMEOUT:I

    .line 36
    iput-object v4, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestChangeFriendlyName;->postOperationNotification:Ljava/lang/String;

    .line 37
    iput-object v4, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestChangeFriendlyName;->bridgePluginID:Ljava/lang/String;

    .line 38
    iput-object v4, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestChangeFriendlyName;->bridgeMac:Ljava/lang/String;

    .line 41
    iput-object p1, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestChangeFriendlyName;->mDevMgr:Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    .line 42
    iput-object p4, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestChangeFriendlyName;->pluginID:Ljava/lang/String;

    .line 43
    iput-object p5, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestChangeFriendlyName;->mac:Ljava/lang/String;

    .line 44
    iput-object p6, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestChangeFriendlyName;->friendlyName:Ljava/lang/String;

    .line 45
    iput-object p3, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestChangeFriendlyName;->udn:Ljava/lang/String;

    .line 47
    if-eqz p7, :cond_1

    .line 48
    array-length v2, p7

    if-lez v2, :cond_1

    .line 49
    const/4 v2, 0x0

    aget-object v1, p7, v2

    check-cast v1, Lorg/json/JSONObject;

    .line 51
    .local v1, "props":Lorg/json/JSONObject;
    :try_start_0
    const-string v2, "notificationName"

    invoke-virtual {v1, v2}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 52
    const-string v2, "notificationName"

    invoke-virtual {v1, v2}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    iput-object v2, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestChangeFriendlyName;->postOperationNotification:Ljava/lang/String;

    .line 55
    :cond_0
    const-string v2, "bridgeudn"

    invoke-virtual {v1, v2}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_1

    const-string v2, "bridgeMacAddress"

    invoke-virtual {v1, v2}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 56
    const-string v2, "bridgeudn"

    invoke-virtual {v1, v2}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    iput-object v2, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestChangeFriendlyName;->bridgePluginID:Ljava/lang/String;

    .line 57
    const-string v2, "bridgeMacAddress"

    invoke-virtual {v1, v2}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    iput-object v2, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestChangeFriendlyName;->bridgeMac:Ljava/lang/String;
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 65
    .end local v1    # "props":Lorg/json/JSONObject;
    :cond_1
    :goto_0
    return-void

    .line 59
    .restart local v1    # "props":Lorg/json/JSONObject;
    :catch_0
    move-exception v0

    .line 60
    .local v0, "e":Lorg/json/JSONException;
    const-string v2, "SDK_CloudRequestChangeFriendlyName"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Exception in extra params e: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0
.end method

.method private parseResponse(Ljava/lang/String;)Z
    .locals 6
    .param p1, "response"    # Ljava/lang/String;

    .prologue
    const/4 v4, 0x0

    .line 140
    :try_start_0
    new-instance v3, Lcom/belkin/wemo/cache/cloud/XMLParser;

    invoke-direct {v3}, Lcom/belkin/wemo/cache/cloud/XMLParser;-><init>()V

    .line 141
    .local v3, "parser":Lcom/belkin/wemo/cache/cloud/XMLParser;
    invoke-virtual {v3, p1}, Lcom/belkin/wemo/cache/cloud/XMLParser;->getDomElement(Ljava/lang/String;)Lorg/w3c/dom/Document;

    move-result-object v0

    .line 142
    .local v0, "doc":Lorg/w3c/dom/Document;
    const-string v5, "plugin"

    invoke-interface {v0, v5}, Lorg/w3c/dom/Document;->getElementsByTagName(Ljava/lang/String;)Lorg/w3c/dom/NodeList;

    move-result-object v2

    .line 143
    .local v2, "nl":Lorg/w3c/dom/NodeList;
    const/4 v5, 0x0

    invoke-interface {v2, v5}, Lorg/w3c/dom/NodeList;->item(I)Lorg/w3c/dom/Node;

    move-result-object v1

    check-cast v1, Lorg/w3c/dom/Element;

    .line 144
    .local v1, "e":Lorg/w3c/dom/Element;
    const-string v5, "friendlyName"

    invoke-virtual {v3, v1, v5}, Lcom/belkin/wemo/cache/cloud/XMLParser;->getValue(Lorg/w3c/dom/Element;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    iput-object v5, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestChangeFriendlyName;->devName:Ljava/lang/String;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 145
    const/4 v4, 0x1

    .line 148
    .end local v0    # "doc":Lorg/w3c/dom/Document;
    .end local v1    # "e":Lorg/w3c/dom/Element;
    .end local v2    # "nl":Lorg/w3c/dom/NodeList;
    .end local v3    # "parser":Lcom/belkin/wemo/cache/cloud/XMLParser;
    :goto_0
    return v4

    .line 146
    :catch_0
    move-exception v1

    .line 147
    .local v1, "e":Ljava/lang/Exception;
    invoke-virtual {v1}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_0
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
    .line 169
    const/4 v0, 0x0

    return-object v0
.end method

.method public getBody()Ljava/lang/String;
    .locals 4

    .prologue
    .line 89
    iget-object v1, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestChangeFriendlyName;->pluginID:Ljava/lang/String;

    .line 90
    .local v1, "recipientId":Ljava/lang/String;
    iget-object v0, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestChangeFriendlyName;->mac:Ljava/lang/String;

    .line 91
    .local v0, "macAddress":Ljava/lang/String;
    iget-object v2, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestChangeFriendlyName;->bridgePluginID:Ljava/lang/String;

    if-eqz v2, :cond_0

    iget-object v2, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestChangeFriendlyName;->bridgeMac:Ljava/lang/String;

    if-eqz v2, :cond_0

    .line 92
    iget-object v1, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestChangeFriendlyName;->bridgePluginID:Ljava/lang/String;

    .line 93
    iget-object v0, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestChangeFriendlyName;->bridgeMac:Ljava/lang/String;

    .line 95
    :cond_0
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "<plugins>\n    <plugin>                 \n        <recipientId>"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "</recipientId>                    \n"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "        <macAddress>"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "</macAddress>\n"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "  <content><![CDATA[<changeFriendlyName>\n"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "  <plugin>\n"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "  <pluginId>"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestChangeFriendlyName;->pluginID:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "</pluginId>\n"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "  <macAddress>"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestChangeFriendlyName;->mac:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "</macAddress>\n"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "  <friendlyName>"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestChangeFriendlyName;->friendlyName:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "</friendlyName>\n"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "  </plugin\n>"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "</changeFriendlyName>]]></content>\n"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "    </plugin>\n"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "</plugins>"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    return-object v2
.end method

.method public getFileByteArray()[B
    .locals 1

    .prologue
    .line 154
    const/4 v0, 0x0

    return-object v0
.end method

.method public getRequestMethod()I
    .locals 1

    .prologue
    .line 69
    const/4 v0, 0x1

    return v0
.end method

.method public getTimeout()I
    .locals 1

    .prologue
    .line 74
    iget v0, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestChangeFriendlyName;->TIMEOUT:I

    return v0
.end method

.method public getTimeoutLimit()I
    .locals 1

    .prologue
    .line 79
    const v0, 0xafc8

    return v0
.end method

.method public getURL()Ljava/lang/String;
    .locals 1

    .prologue
    .line 84
    iget-object v0, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestChangeFriendlyName;->URL:Ljava/lang/String;

    return-object v0
.end method

.method public getUploadFileName()Ljava/lang/String;
    .locals 1

    .prologue
    .line 159
    const/4 v0, 0x0

    return-object v0
.end method

.method public isAuthHeaderRequired()Z
    .locals 1

    .prologue
    .line 164
    const/4 v0, 0x1

    return v0
.end method

.method public requestComplete(ZI[B)V
    .locals 8
    .param p1, "success"    # Z
    .param p2, "statusCode"    # I
    .param p3, "resp"    # [B

    .prologue
    .line 112
    const-string v4, "updateFriendlyName: "

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "success: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, p1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 113
    if-eqz p1, :cond_0

    .line 115
    :try_start_0
    new-instance v2, Ljava/lang/String;

    const-string v4, "UTF-8"

    invoke-direct {v2, p3, v4}, Ljava/lang/String;-><init>([BLjava/lang/String;)V

    .line 116
    .local v2, "response":Ljava/lang/String;
    const-string v4, "SDK_CloudRequestChangeFriendlyName"

    invoke-static {v4, v2}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 117
    invoke-direct {p0, v2}, Lcom/belkin/wemo/cache/cloud/CloudRequestChangeFriendlyName;->parseResponse(Ljava/lang/String;)Z

    move-result v3

    .line 118
    .local v3, "responseParse":Z
    const-string v4, "SDK_CloudRequestChangeFriendlyName"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "Response parse: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-static {v3}, Ljava/lang/String;->valueOf(Z)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 119
    if-eqz v3, :cond_0

    .line 120
    iget-object v4, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestChangeFriendlyName;->mDevMgr:Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    iget-object v5, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestChangeFriendlyName;->udn:Ljava/lang/String;

    invoke-virtual {v4, v5}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->getDeviceInformationFromDevicesArray(Ljava/lang/String;)Lcom/belkin/wemo/cache/data/DeviceInformation;

    move-result-object v0

    .line 121
    .local v0, "device":Lcom/belkin/wemo/cache/data/DeviceInformation;
    if-eqz v0, :cond_0

    .line 122
    iget-object v4, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestChangeFriendlyName;->friendlyName:Ljava/lang/String;

    invoke-virtual {v0, v4}, Lcom/belkin/wemo/cache/data/DeviceInformation;->setFriendlyName(Ljava/lang/String;)V

    .line 123
    iget-object v4, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestChangeFriendlyName;->mDevMgr:Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    const/4 v5, 0x0

    invoke-virtual {v4, v0, v5}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->setDeviceInformationToDevicesArray(Lcom/belkin/wemo/cache/data/DeviceInformation;Z)V

    .line 124
    iget-object v4, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestChangeFriendlyName;->postOperationNotification:Ljava/lang/String;

    if-eqz v4, :cond_0

    .line 125
    iget-object v4, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestChangeFriendlyName;->postOperationNotification:Ljava/lang/String;

    invoke-static {v4}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v4

    if-nez v4, :cond_0

    .line 126
    iget-object v4, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestChangeFriendlyName;->mDevMgr:Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    iget-object v5, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestChangeFriendlyName;->postOperationNotification:Ljava/lang/String;

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v6, v3}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, ""

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    iget-object v7, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestChangeFriendlyName;->udn:Ljava/lang/String;

    invoke-virtual {v4, v5, v6, v7}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->sendNotification(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 136
    .end local v0    # "device":Lcom/belkin/wemo/cache/data/DeviceInformation;
    .end local v2    # "response":Ljava/lang/String;
    .end local v3    # "responseParse":Z
    :cond_0
    :goto_0
    return-void

    .line 132
    :catch_0
    move-exception v1

    .line 133
    .local v1, "e":Ljava/lang/Exception;
    const-string v4, "SDK_CloudRequestChangeFriendlyName"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "Exception in requestComplete e:"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0
.end method
