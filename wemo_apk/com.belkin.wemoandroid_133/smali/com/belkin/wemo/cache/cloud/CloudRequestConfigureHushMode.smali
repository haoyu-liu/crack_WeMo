.class public Lcom/belkin/wemo/cache/cloud/CloudRequestConfigureHushMode;
.super Ljava/lang/Object;
.source "CloudRequestConfigureHushMode.java"

# interfaces
.implements Lcom/belkin/wemo/cache/cloud/CloudRequestInterface;


# instance fields
.field private final TAG:Ljava/lang/String;

.field private TIMEOUT:I

.field private final TIMEOUT_LIMIT:I

.field private final URL:Ljava/lang/String;

.field private context:Landroid/content/Context;

.field private deviceInfo:Lcom/belkin/wemo/cache/data/DeviceInformation;

.field private errorCallback:Lcom/belkin/wemo/cache/devicelist/callback/ConfigureHushModeErrorCallback;

.field private hushModeValue:Ljava/lang/String;

.field private successCallback:Lcom/belkin/wemo/cache/devicelist/callback/ConfigureHushModeSuccessCallback;


# direct methods
.method public constructor <init>(Landroid/content/Context;Lcom/belkin/wemo/cache/data/DeviceInformation;Ljava/lang/String;Lcom/belkin/wemo/cache/devicelist/callback/ConfigureHushModeSuccessCallback;Lcom/belkin/wemo/cache/devicelist/callback/ConfigureHushModeErrorCallback;)V
    .locals 2
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "deviceInfo"    # Lcom/belkin/wemo/cache/data/DeviceInformation;
    .param p3, "hushModeValue"    # Ljava/lang/String;
    .param p4, "successCallback"    # Lcom/belkin/wemo/cache/devicelist/callback/ConfigureHushModeSuccessCallback;
    .param p5, "errorCallback"    # Lcom/belkin/wemo/cache/devicelist/callback/ConfigureHushModeErrorCallback;

    .prologue
    .line 45
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 29
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

    iput-object v0, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestConfigureHushMode;->URL:Ljava/lang/String;

    .line 31
    const-class v0, Lcom/belkin/wemo/cache/cloud/CloudRequestConfigureHushMode;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestConfigureHushMode;->TAG:Ljava/lang/String;

    .line 32
    const v0, 0xafc8

    iput v0, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestConfigureHushMode;->TIMEOUT_LIMIT:I

    .line 33
    const/16 v0, 0x7530

    iput v0, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestConfigureHushMode;->TIMEOUT:I

    .line 46
    iput-object p1, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestConfigureHushMode;->context:Landroid/content/Context;

    .line 47
    iput-object p2, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestConfigureHushMode;->deviceInfo:Lcom/belkin/wemo/cache/data/DeviceInformation;

    .line 48
    iput-object p3, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestConfigureHushMode;->hushModeValue:Ljava/lang/String;

    .line 49
    iput-object p4, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestConfigureHushMode;->successCallback:Lcom/belkin/wemo/cache/devicelist/callback/ConfigureHushModeSuccessCallback;

    .line 50
    iput-object p5, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestConfigureHushMode;->errorCallback:Lcom/belkin/wemo/cache/devicelist/callback/ConfigureHushModeErrorCallback;

    .line 52
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
    .line 105
    const/4 v0, 0x0

    return-object v0
.end method

.method public getBody()Ljava/lang/String;
    .locals 2

    .prologue
    .line 75
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "<plugins><plugin><recipientid>"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestConfigureHushMode;->deviceInfo:Lcom/belkin/wemo/cache/data/DeviceInformation;

    invoke-virtual {v1}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getPluginID()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "</recipientid>"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "<macAddress>"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestConfigureHushMode;->deviceInfo:Lcom/belkin/wemo/cache/data/DeviceInformation;

    invoke-virtual {v1}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getMAC()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "</macAddress>"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "<content>"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "<![CDATA[ <"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "ConfigureHushMode"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ">"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "<"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "hushMode"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ">"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestConfigureHushMode;->hushModeValue:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "</"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "hushMode"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ">"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "</"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "ConfigureHushMode"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "> ]]>"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "</content>"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "</plugin>"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "</plugins>"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getFileByteArray()[B
    .locals 1

    .prologue
    .line 90
    const/4 v0, 0x0

    return-object v0
.end method

.method public getRequestMethod()I
    .locals 1

    .prologue
    .line 55
    const/4 v0, 0x1

    return v0
.end method

.method public getTimeout()I
    .locals 1

    .prologue
    .line 60
    iget v0, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestConfigureHushMode;->TIMEOUT:I

    return v0
.end method

.method public getTimeoutLimit()I
    .locals 1

    .prologue
    .line 65
    const v0, 0xafc8

    return v0
.end method

.method public getURL()Ljava/lang/String;
    .locals 1

    .prologue
    .line 70
    iget-object v0, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestConfigureHushMode;->URL:Ljava/lang/String;

    return-object v0
.end method

.method public getUploadFileName()Ljava/lang/String;
    .locals 1

    .prologue
    .line 95
    const/4 v0, 0x0

    return-object v0
.end method

.method public isAuthHeaderRequired()Z
    .locals 1

    .prologue
    .line 100
    const/4 v0, 0x1

    return v0
.end method

.method public requestComplete(ZI[B)V
    .locals 12
    .param p1, "success"    # Z
    .param p2, "statusCode"    # I
    .param p3, "resp"    # [B

    .prologue
    .line 111
    iget-object v7, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestConfigureHushMode;->TAG:Ljava/lang/String;

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "isSuccess: "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, p1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-static {v7, v8}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 113
    if-eqz p1, :cond_1

    .line 115
    :try_start_0
    new-instance v6, Ljava/lang/String;

    const-string v7, "UTF-8"

    invoke-direct {v6, p3, v7}, Ljava/lang/String;-><init>([BLjava/lang/String;)V

    .line 116
    .local v6, "response":Ljava/lang/String;
    iget-object v7, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestConfigureHushMode;->TAG:Ljava/lang/String;

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "Response: "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-static {v7, v8}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 118
    iget-object v7, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestConfigureHushMode;->deviceInfo:Lcom/belkin/wemo/cache/data/DeviceInformation;

    const-string v8, "hushMode"

    iget-object v9, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestConfigureHushMode;->hushModeValue:Ljava/lang/String;

    invoke-static {v9}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v7, v8, v9}, Lcom/belkin/wemo/cache/data/DeviceInformation;->setAttributeValue(Ljava/lang/String;Ljava/lang/String;)V

    .line 121
    new-instance v5, Lcom/belkin/wemo/cache/cloud/XMLParser;

    invoke-direct {v5}, Lcom/belkin/wemo/cache/cloud/XMLParser;-><init>()V

    .line 122
    .local v5, "parser":Lcom/belkin/wemo/cache/cloud/XMLParser;
    invoke-virtual {v5, v6}, Lcom/belkin/wemo/cache/cloud/XMLParser;->getDomElement(Ljava/lang/String;)Lorg/w3c/dom/Document;

    move-result-object v0

    .line 123
    .local v0, "doc":Lorg/w3c/dom/Document;
    const-string v7, "plugin"

    invoke-interface {v0, v7}, Lorg/w3c/dom/Document;->getElementsByTagName(Ljava/lang/String;)Lorg/w3c/dom/NodeList;

    move-result-object v4

    .line 125
    .local v4, "nl":Lorg/w3c/dom/NodeList;
    const/4 v7, 0x0

    invoke-interface {v4, v7}, Lorg/w3c/dom/NodeList;->item(I)Lorg/w3c/dom/Node;

    move-result-object v1

    check-cast v1, Lorg/w3c/dom/Element;

    .line 131
    .local v1, "e":Lorg/w3c/dom/Element;
    iget-object v7, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestConfigureHushMode;->context:Landroid/content/Context;

    invoke-static {v7}, Lcom/belkin/wemo/cache/data/DevicesArray;->getInstance(Landroid/content/Context;)Lcom/belkin/wemo/cache/data/DevicesArray;

    move-result-object v7

    iget-object v8, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestConfigureHushMode;->deviceInfo:Lcom/belkin/wemo/cache/data/DeviceInformation;

    invoke-virtual {v7, v8}, Lcom/belkin/wemo/cache/data/DevicesArray;->addOrUpdateDeviceInformation(Lcom/belkin/wemo/cache/data/DeviceInformation;)V

    .line 132
    iget-object v7, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestConfigureHushMode;->context:Landroid/content/Context;

    invoke-static {v7}, Lcom/belkin/wemo/cache/CacheManager;->getInstance(Landroid/content/Context;)Lcom/belkin/wemo/cache/CacheManager;

    move-result-object v7

    iget-object v8, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestConfigureHushMode;->deviceInfo:Lcom/belkin/wemo/cache/data/DeviceInformation;

    const/4 v9, 0x1

    const/4 v10, 0x1

    const/4 v11, 0x1

    invoke-virtual {v7, v8, v9, v10, v11}, Lcom/belkin/wemo/cache/CacheManager;->updateDB(Lcom/belkin/wemo/cache/data/DeviceInformation;ZZZ)V
    :try_end_0
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_1

    .line 154
    .end local v0    # "doc":Lorg/w3c/dom/Document;
    .end local v1    # "e":Lorg/w3c/dom/Element;
    .end local v4    # "nl":Lorg/w3c/dom/NodeList;
    .end local v5    # "parser":Lcom/belkin/wemo/cache/cloud/XMLParser;
    .end local v6    # "response":Ljava/lang/String;
    :cond_0
    :goto_0
    iget-object v7, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestConfigureHushMode;->context:Landroid/content/Context;

    invoke-static {v7}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->getInstance(Landroid/content/Context;)Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    move-result-object v7

    const-string v8, "change_state"

    invoke-static {p1}, Ljava/lang/String;->valueOf(Z)Ljava/lang/String;

    move-result-object v9

    iget-object v10, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestConfigureHushMode;->deviceInfo:Lcom/belkin/wemo/cache/data/DeviceInformation;

    invoke-virtual {v10}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getUDN()Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v7, v8, v9, v10}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->sendNotification(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 156
    return-void

    .line 134
    :catch_0
    move-exception v1

    .line 135
    .local v1, "e":Ljava/io/UnsupportedEncodingException;
    iget-object v7, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestConfigureHushMode;->TAG:Ljava/lang/String;

    const-string v8, "UnsupportedEncodingException while parsing response: "

    invoke-static {v7, v8, v1}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Exception;)V

    .line 136
    iget-object v7, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestConfigureHushMode;->errorCallback:Lcom/belkin/wemo/cache/devicelist/callback/ConfigureHushModeErrorCallback;

    if-eqz v7, :cond_0

    .line 137
    iget-object v7, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestConfigureHushMode;->errorCallback:Lcom/belkin/wemo/cache/devicelist/callback/ConfigureHushModeErrorCallback;

    invoke-virtual {v1}, Ljava/io/UnsupportedEncodingException;->getMessage()Ljava/lang/String;

    move-result-object v8

    invoke-interface {v7, v8}, Lcom/belkin/wemo/cache/devicelist/callback/ConfigureHushModeErrorCallback;->onConfigureHushModeFailed(Ljava/lang/String;)V

    goto :goto_0

    .line 139
    .end local v1    # "e":Ljava/io/UnsupportedEncodingException;
    :catch_1
    move-exception v2

    .line 140
    .local v2, "e1":Lorg/json/JSONException;
    iget-object v7, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestConfigureHushMode;->TAG:Ljava/lang/String;

    const-string v8, "JSONException while updating deviceInfo object and DB: "

    invoke-static {v7, v8, v2}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Exception;)V

    .line 141
    iget-object v7, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestConfigureHushMode;->errorCallback:Lcom/belkin/wemo/cache/devicelist/callback/ConfigureHushModeErrorCallback;

    if-eqz v7, :cond_0

    .line 142
    iget-object v7, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestConfigureHushMode;->errorCallback:Lcom/belkin/wemo/cache/devicelist/callback/ConfigureHushModeErrorCallback;

    invoke-virtual {v2}, Lorg/json/JSONException;->getMessage()Ljava/lang/String;

    move-result-object v8

    invoke-interface {v7, v8}, Lcom/belkin/wemo/cache/devicelist/callback/ConfigureHushModeErrorCallback;->onConfigureHushModeFailed(Ljava/lang/String;)V

    goto :goto_0

    .line 147
    .end local v2    # "e1":Lorg/json/JSONException;
    :cond_1
    const-string v3, "CloudRequestConfigureHushMode failed."

    .line 148
    .local v3, "error":Ljava/lang/String;
    iget-object v7, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestConfigureHushMode;->TAG:Ljava/lang/String;

    invoke-static {v7, v3}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 149
    iget-object v7, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestConfigureHushMode;->errorCallback:Lcom/belkin/wemo/cache/devicelist/callback/ConfigureHushModeErrorCallback;

    if-eqz v7, :cond_0

    .line 150
    iget-object v7, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestConfigureHushMode;->errorCallback:Lcom/belkin/wemo/cache/devicelist/callback/ConfigureHushModeErrorCallback;

    invoke-interface {v7, v3}, Lcom/belkin/wemo/cache/devicelist/callback/ConfigureHushModeErrorCallback;->onConfigureHushModeFailed(Ljava/lang/String;)V

    goto :goto_0
.end method
