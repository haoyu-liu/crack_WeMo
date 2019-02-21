.class public Lcom/belkin/wemo/cache/cloud/CloudRequestSetNightModeConfiguration;
.super Ljava/lang/Object;
.source "CloudRequestSetNightModeConfiguration.java"

# interfaces
.implements Lcom/belkin/wemo/cache/cloud/CloudRequestInterface;


# instance fields
.field private final TAG:Ljava/lang/String;

.field private TIMEOUT:I

.field private final TIMEOUT_LIMIT:I

.field private final URL:Ljava/lang/String;

.field private context:Landroid/content/Context;

.field private deviceInfo:Lcom/belkin/wemo/cache/data/DeviceInformation;

.field private endTime:I

.field private errorCallback:Lcom/belkin/wemo/cache/devicelist/callback/SetNightModeErrorCallback;

.field private nightMode:I

.field private nightModeBrightness:I

.field private startTime:I

.field private successCallback:Lcom/belkin/wemo/cache/devicelist/callback/SetNightModeSuccessCallback;


# direct methods
.method public constructor <init>(Landroid/content/Context;Lcom/belkin/wemo/cache/data/DeviceInformation;IIIILcom/belkin/wemo/cache/devicelist/callback/SetNightModeSuccessCallback;Lcom/belkin/wemo/cache/devicelist/callback/SetNightModeErrorCallback;)V
    .locals 2
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "deviceInfo"    # Lcom/belkin/wemo/cache/data/DeviceInformation;
    .param p3, "nightMode"    # I
    .param p4, "nightModeBrightness"    # I
    .param p5, "startTime"    # I
    .param p6, "endTime"    # I
    .param p7, "successCallback"    # Lcom/belkin/wemo/cache/devicelist/callback/SetNightModeSuccessCallback;
    .param p8, "errorCallback"    # Lcom/belkin/wemo/cache/devicelist/callback/SetNightModeErrorCallback;

    .prologue
    .line 51
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 28
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

    iput-object v0, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestSetNightModeConfiguration;->URL:Ljava/lang/String;

    .line 30
    const-class v0, Lcom/belkin/wemo/cache/cloud/CloudRequestSetNightModeConfiguration;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestSetNightModeConfiguration;->TAG:Ljava/lang/String;

    .line 31
    const v0, 0xafc8

    iput v0, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestSetNightModeConfiguration;->TIMEOUT_LIMIT:I

    .line 32
    const/16 v0, 0x7530

    iput v0, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestSetNightModeConfiguration;->TIMEOUT:I

    .line 52
    iput-object p1, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestSetNightModeConfiguration;->context:Landroid/content/Context;

    .line 53
    iput-object p2, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestSetNightModeConfiguration;->deviceInfo:Lcom/belkin/wemo/cache/data/DeviceInformation;

    .line 54
    iput p5, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestSetNightModeConfiguration;->startTime:I

    .line 55
    iput p6, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestSetNightModeConfiguration;->endTime:I

    .line 56
    iput p3, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestSetNightModeConfiguration;->nightMode:I

    .line 57
    iput p4, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestSetNightModeConfiguration;->nightModeBrightness:I

    .line 59
    iput-object p7, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestSetNightModeConfiguration;->successCallback:Lcom/belkin/wemo/cache/devicelist/callback/SetNightModeSuccessCallback;

    .line 60
    iput-object p8, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestSetNightModeConfiguration;->errorCallback:Lcom/belkin/wemo/cache/devicelist/callback/SetNightModeErrorCallback;

    .line 61
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
    .line 173
    const/4 v0, 0x0

    return-object v0
.end method

.method public getBody()Ljava/lang/String;
    .locals 2

    .prologue
    .line 87
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "<plugins><plugin><recipientid>"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestSetNightModeConfiguration;->deviceInfo:Lcom/belkin/wemo/cache/data/DeviceInformation;

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

    iget-object v1, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestSetNightModeConfiguration;->deviceInfo:Lcom/belkin/wemo/cache/data/DeviceInformation;

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

    const-string v1, "NightModeConfiguration"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ">"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "<"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "nightMode"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ">"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v1, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestSetNightModeConfiguration;->nightMode:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "</"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "nightMode"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ">"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "<"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "endTime"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ">"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v1, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestSetNightModeConfiguration;->endTime:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "</"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "endTime"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ">"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "<"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "startTime"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ">"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v1, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestSetNightModeConfiguration;->startTime:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "</"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "startTime"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ">"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "<"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "nightModeBrightness"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ">"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v1, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestSetNightModeConfiguration;->nightModeBrightness:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "</"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "nightModeBrightness"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ">"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "</"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "NightModeConfiguration"

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
    .line 105
    const/4 v0, 0x0

    return-object v0
.end method

.method public getRequestMethod()I
    .locals 1

    .prologue
    .line 67
    const/4 v0, 0x1

    return v0
.end method

.method public getTimeout()I
    .locals 1

    .prologue
    .line 72
    iget v0, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestSetNightModeConfiguration;->TIMEOUT:I

    return v0
.end method

.method public getTimeoutLimit()I
    .locals 1

    .prologue
    .line 77
    const v0, 0xafc8

    return v0
.end method

.method public getURL()Ljava/lang/String;
    .locals 1

    .prologue
    .line 82
    iget-object v0, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestSetNightModeConfiguration;->URL:Ljava/lang/String;

    return-object v0
.end method

.method public getUploadFileName()Ljava/lang/String;
    .locals 1

    .prologue
    .line 110
    const/4 v0, 0x0

    return-object v0
.end method

.method public isAuthHeaderRequired()Z
    .locals 1

    .prologue
    .line 167
    const/4 v0, 0x1

    return v0
.end method

.method public requestComplete(ZI[B)V
    .locals 14
    .param p1, "success"    # Z
    .param p2, "statusCode"    # I
    .param p3, "resp"    # [B

    .prologue
    .line 118
    iget-object v9, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestSetNightModeConfiguration;->TAG:Ljava/lang/String;

    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    const-string v11, "isSuccess: "

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10, p1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-static {v9, v10}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 119
    if-eqz p1, :cond_2

    .line 121
    :try_start_0
    new-instance v8, Ljava/lang/String;

    const-string v9, "UTF-8"

    move-object/from16 v0, p3

    invoke-direct {v8, v0, v9}, Ljava/lang/String;-><init>([BLjava/lang/String;)V

    .line 122
    .local v8, "response":Ljava/lang/String;
    iget-object v9, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestSetNightModeConfiguration;->TAG:Ljava/lang/String;

    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    const-string v11, "Response: "

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-static {v9, v10}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 124
    iget-object v9, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestSetNightModeConfiguration;->deviceInfo:Lcom/belkin/wemo/cache/data/DeviceInformation;

    const-string v10, "nightMode"

    iget v11, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestSetNightModeConfiguration;->nightMode:I

    invoke-static {v11}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v9, v10, v11}, Lcom/belkin/wemo/cache/data/DeviceInformation;->setAttributeValue(Ljava/lang/String;Ljava/lang/String;)V

    .line 125
    iget-object v9, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestSetNightModeConfiguration;->deviceInfo:Lcom/belkin/wemo/cache/data/DeviceInformation;

    const-string v10, "startTime"

    iget v11, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestSetNightModeConfiguration;->startTime:I

    invoke-static {v11}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v9, v10, v11}, Lcom/belkin/wemo/cache/data/DeviceInformation;->setAttributeValue(Ljava/lang/String;Ljava/lang/String;)V

    .line 126
    iget-object v9, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestSetNightModeConfiguration;->deviceInfo:Lcom/belkin/wemo/cache/data/DeviceInformation;

    const-string v10, "endTime"

    iget v11, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestSetNightModeConfiguration;->endTime:I

    invoke-static {v11}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v9, v10, v11}, Lcom/belkin/wemo/cache/data/DeviceInformation;->setAttributeValue(Ljava/lang/String;Ljava/lang/String;)V

    .line 127
    iget-object v9, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestSetNightModeConfiguration;->deviceInfo:Lcom/belkin/wemo/cache/data/DeviceInformation;

    const-string v10, "nightModeBrightness"

    iget v11, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestSetNightModeConfiguration;->nightModeBrightness:I

    invoke-static {v11}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v9, v10, v11}, Lcom/belkin/wemo/cache/data/DeviceInformation;->setAttributeValue(Ljava/lang/String;Ljava/lang/String;)V

    .line 130
    new-instance v7, Lcom/belkin/wemo/cache/cloud/XMLParser;

    invoke-direct {v7}, Lcom/belkin/wemo/cache/cloud/XMLParser;-><init>()V

    .line 131
    .local v7, "parser":Lcom/belkin/wemo/cache/cloud/XMLParser;
    invoke-virtual {v7, v8}, Lcom/belkin/wemo/cache/cloud/XMLParser;->getDomElement(Ljava/lang/String;)Lorg/w3c/dom/Document;

    move-result-object v2

    .line 132
    .local v2, "doc":Lorg/w3c/dom/Document;
    const-string v9, "plugin"

    invoke-interface {v2, v9}, Lorg/w3c/dom/Document;->getElementsByTagName(Ljava/lang/String;)Lorg/w3c/dom/NodeList;

    move-result-object v6

    .line 134
    .local v6, "nl":Lorg/w3c/dom/NodeList;
    const/4 v9, 0x0

    invoke-interface {v6, v9}, Lorg/w3c/dom/NodeList;->item(I)Lorg/w3c/dom/Node;

    move-result-object v3

    check-cast v3, Lorg/w3c/dom/Element;

    .line 136
    .local v3, "e":Lorg/w3c/dom/Element;
    const-string v9, "brightness"

    invoke-virtual {v7, v3, v9}, Lcom/belkin/wemo/cache/cloud/XMLParser;->getValue(Lorg/w3c/dom/Element;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 137
    .local v1, "brightnessFromCloud":Ljava/lang/String;
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v9

    if-nez v9, :cond_0

    .line 138
    iget-object v9, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestSetNightModeConfiguration;->deviceInfo:Lcom/belkin/wemo/cache/data/DeviceInformation;

    const-string v10, "brightness"

    invoke-virtual {v9, v10, v1}, Lcom/belkin/wemo/cache/data/DeviceInformation;->setAttributeValue(Ljava/lang/String;Ljava/lang/String;)V

    .line 140
    :cond_0
    iget-object v9, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestSetNightModeConfiguration;->context:Landroid/content/Context;

    invoke-static {v9}, Lcom/belkin/wemo/cache/data/DevicesArray;->getInstance(Landroid/content/Context;)Lcom/belkin/wemo/cache/data/DevicesArray;

    move-result-object v9

    iget-object v10, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestSetNightModeConfiguration;->deviceInfo:Lcom/belkin/wemo/cache/data/DeviceInformation;

    invoke-virtual {v9, v10}, Lcom/belkin/wemo/cache/data/DevicesArray;->addOrUpdateDeviceInformation(Lcom/belkin/wemo/cache/data/DeviceInformation;)V

    .line 141
    iget-object v9, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestSetNightModeConfiguration;->context:Landroid/content/Context;

    invoke-static {v9}, Lcom/belkin/wemo/cache/CacheManager;->getInstance(Landroid/content/Context;)Lcom/belkin/wemo/cache/CacheManager;

    move-result-object v9

    iget-object v10, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestSetNightModeConfiguration;->deviceInfo:Lcom/belkin/wemo/cache/data/DeviceInformation;

    const/4 v11, 0x1

    const/4 v12, 0x1

    const/4 v13, 0x1

    invoke-virtual {v9, v10, v11, v12, v13}, Lcom/belkin/wemo/cache/CacheManager;->updateDB(Lcom/belkin/wemo/cache/data/DeviceInformation;ZZZ)V
    :try_end_0
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_1

    .line 161
    .end local v1    # "brightnessFromCloud":Ljava/lang/String;
    .end local v2    # "doc":Lorg/w3c/dom/Document;
    .end local v3    # "e":Lorg/w3c/dom/Element;
    .end local v6    # "nl":Lorg/w3c/dom/NodeList;
    .end local v7    # "parser":Lcom/belkin/wemo/cache/cloud/XMLParser;
    .end local v8    # "response":Ljava/lang/String;
    :cond_1
    :goto_0
    iget-object v9, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestSetNightModeConfiguration;->context:Landroid/content/Context;

    invoke-static {v9}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->getInstance(Landroid/content/Context;)Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    move-result-object v9

    const-string v10, "change_state"

    invoke-static {p1}, Ljava/lang/String;->valueOf(Z)Ljava/lang/String;

    move-result-object v11

    iget-object v12, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestSetNightModeConfiguration;->deviceInfo:Lcom/belkin/wemo/cache/data/DeviceInformation;

    invoke-virtual {v12}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getUDN()Ljava/lang/String;

    move-result-object v12

    invoke-virtual {v9, v10, v11, v12}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->sendNotification(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 162
    return-void

    .line 143
    :catch_0
    move-exception v3

    .line 144
    .local v3, "e":Ljava/io/UnsupportedEncodingException;
    iget-object v9, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestSetNightModeConfiguration;->TAG:Ljava/lang/String;

    const-string v10, "UnsupportedEncodingException while parsing response: "

    invoke-static {v9, v10, v3}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Exception;)V

    .line 145
    iget-object v9, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestSetNightModeConfiguration;->errorCallback:Lcom/belkin/wemo/cache/devicelist/callback/SetNightModeErrorCallback;

    if-eqz v9, :cond_1

    .line 146
    iget-object v9, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestSetNightModeConfiguration;->errorCallback:Lcom/belkin/wemo/cache/devicelist/callback/SetNightModeErrorCallback;

    invoke-virtual {v3}, Ljava/io/UnsupportedEncodingException;->getMessage()Ljava/lang/String;

    move-result-object v10

    invoke-interface {v9, v10}, Lcom/belkin/wemo/cache/devicelist/callback/SetNightModeErrorCallback;->onNightModeConfigurationFailed(Ljava/lang/String;)V

    goto :goto_0

    .line 148
    .end local v3    # "e":Ljava/io/UnsupportedEncodingException;
    :catch_1
    move-exception v4

    .line 149
    .local v4, "e1":Lorg/json/JSONException;
    iget-object v9, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestSetNightModeConfiguration;->TAG:Ljava/lang/String;

    const-string v10, "JSONException while updating deviceInfo object and DB: "

    invoke-static {v9, v10, v4}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Exception;)V

    .line 150
    iget-object v9, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestSetNightModeConfiguration;->errorCallback:Lcom/belkin/wemo/cache/devicelist/callback/SetNightModeErrorCallback;

    if-eqz v9, :cond_1

    .line 151
    iget-object v9, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestSetNightModeConfiguration;->errorCallback:Lcom/belkin/wemo/cache/devicelist/callback/SetNightModeErrorCallback;

    invoke-virtual {v4}, Lorg/json/JSONException;->getMessage()Ljava/lang/String;

    move-result-object v10

    invoke-interface {v9, v10}, Lcom/belkin/wemo/cache/devicelist/callback/SetNightModeErrorCallback;->onNightModeConfigurationFailed(Ljava/lang/String;)V

    goto :goto_0

    .line 155
    .end local v4    # "e1":Lorg/json/JSONException;
    :cond_2
    const-string v5, "CloudRequestSetNightModeConfiguration failed."

    .line 156
    .local v5, "error":Ljava/lang/String;
    iget-object v9, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestSetNightModeConfiguration;->TAG:Ljava/lang/String;

    invoke-static {v9, v5}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 157
    iget-object v9, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestSetNightModeConfiguration;->errorCallback:Lcom/belkin/wemo/cache/devicelist/callback/SetNightModeErrorCallback;

    if-eqz v9, :cond_1

    .line 158
    iget-object v9, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestSetNightModeConfiguration;->errorCallback:Lcom/belkin/wemo/cache/devicelist/callback/SetNightModeErrorCallback;

    invoke-interface {v9, v5}, Lcom/belkin/wemo/cache/devicelist/callback/SetNightModeErrorCallback;->onNightModeConfigurationFailed(Ljava/lang/String;)V

    goto :goto_0
.end method
