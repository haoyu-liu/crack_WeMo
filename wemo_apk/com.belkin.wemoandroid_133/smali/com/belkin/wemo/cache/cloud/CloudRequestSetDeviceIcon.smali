.class public Lcom/belkin/wemo/cache/cloud/CloudRequestSetDeviceIcon;
.super Lcom/belkin/wemo/cache/cloud/AbstractMultipartCloudRequest;
.source "CloudRequestSetDeviceIcon.java"


# static fields
.field private static final KEY_ICON_VERSION_TAG:Ljava/lang/String; = "iconVersion"

.field private static final KEY_PLUGIN_TAG:Ljava/lang/String; = "plugin"


# instance fields
.field private final TAG:Ljava/lang/String;

.field private TIMEOUT:I

.field private final TIMEOUT_LIMIT:I

.field private final URL:Ljava/lang/String;

.field private cloudURL:Ljava/lang/String;

.field private context:Landroid/content/Context;

.field private iconLocation:Ljava/lang/String;

.field private iconVersionFromCloud:Ljava/lang/String;

.field private udn:Ljava/lang/String;


# direct methods
.method public constructor <init>(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 2
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "udn"    # Ljava/lang/String;
    .param p3, "macAddress"    # Ljava/lang/String;
    .param p4, "iconLocation"    # Ljava/lang/String;

    .prologue
    const v1, 0xea60

    .line 33
    invoke-direct {p0}, Lcom/belkin/wemo/cache/cloud/AbstractMultipartCloudRequest;-><init>()V

    .line 23
    const-class v0, Lcom/belkin/wemo/cache/cloud/CloudRequestSetDeviceIcon;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestSetDeviceIcon;->TAG:Ljava/lang/String;

    .line 24
    iput v1, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestSetDeviceIcon;->TIMEOUT_LIMIT:I

    .line 26
    iput v1, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestSetDeviceIcon;->TIMEOUT:I

    .line 31
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v1, Lcom/belkin/wemo/cache/cloud/CloudConstants;->CLOUD_URL:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "/apis/http/plugin/ext/deviceIcon/"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestSetDeviceIcon;->URL:Ljava/lang/String;

    .line 34
    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    iput-object v0, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestSetDeviceIcon;->context:Landroid/content/Context;

    .line 35
    iput-object p2, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestSetDeviceIcon;->udn:Ljava/lang/String;

    .line 36
    iput-object p4, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestSetDeviceIcon;->iconLocation:Ljava/lang/String;

    .line 37
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v1, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestSetDeviceIcon;->URL:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestSetDeviceIcon;->cloudURL:Ljava/lang/String;

    .line 38
    return-void
.end method

.method private parseResponse(Ljava/lang/String;)Z
    .locals 7
    .param p1, "response"    # Ljava/lang/String;

    .prologue
    const/4 v4, 0x0

    .line 135
    :try_start_0
    new-instance v3, Lcom/belkin/wemo/cache/cloud/XMLParser;

    invoke-direct {v3}, Lcom/belkin/wemo/cache/cloud/XMLParser;-><init>()V

    .line 136
    .local v3, "parser":Lcom/belkin/wemo/cache/cloud/XMLParser;
    invoke-virtual {v3, p1}, Lcom/belkin/wemo/cache/cloud/XMLParser;->getDomElement(Ljava/lang/String;)Lorg/w3c/dom/Document;

    move-result-object v0

    .line 137
    .local v0, "doc":Lorg/w3c/dom/Document;
    const-string v5, "plugin"

    invoke-interface {v0, v5}, Lorg/w3c/dom/Document;->getElementsByTagName(Ljava/lang/String;)Lorg/w3c/dom/NodeList;

    move-result-object v2

    .line 138
    .local v2, "nl":Lorg/w3c/dom/NodeList;
    const/4 v5, 0x0

    invoke-interface {v2, v5}, Lorg/w3c/dom/NodeList;->item(I)Lorg/w3c/dom/Node;

    move-result-object v1

    check-cast v1, Lorg/w3c/dom/Element;

    .line 139
    .local v1, "e":Lorg/w3c/dom/Element;
    const-string v5, "iconVersion"

    invoke-virtual {v3, v1, v5}, Lcom/belkin/wemo/cache/cloud/XMLParser;->getValue(Lorg/w3c/dom/Element;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    iput-object v5, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestSetDeviceIcon;->iconVersionFromCloud:Ljava/lang/String;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 140
    const/4 v4, 0x1

    .line 143
    .end local v0    # "doc":Lorg/w3c/dom/Document;
    .end local v1    # "e":Lorg/w3c/dom/Element;
    .end local v2    # "nl":Lorg/w3c/dom/NodeList;
    .end local v3    # "parser":Lcom/belkin/wemo/cache/cloud/XMLParser;
    :goto_0
    return v4

    .line 141
    :catch_0
    move-exception v1

    .line 142
    .local v1, "e":Ljava/lang/Exception;
    iget-object v5, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestSetDeviceIcon;->TAG:Ljava/lang/String;

    const-string v6, "Exception while parsing xml response for set icon: "

    invoke-static {v5, v6, v1}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Exception;)V

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
    .line 149
    const/4 v0, 0x0

    return-object v0
.end method

.method public getBody()Ljava/lang/String;
    .locals 1

    .prologue
    .line 62
    const-string v0, ""

    return-object v0
.end method

.method public getContentType()Ljava/lang/String;
    .locals 1

    .prologue
    .line 130
    const-string v0, "multipart/form-data"

    return-object v0
.end method

.method public getFileByteArray()[B
    .locals 1

    .prologue
    .line 67
    iget-object v0, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestSetDeviceIcon;->iconLocation:Ljava/lang/String;

    invoke-static {v0}, Lcom/belkin/wemo/cache/utils/UploadFileUtil;->readFile(Ljava/lang/String;)[B

    move-result-object v0

    return-object v0
.end method

.method public getRequestMethod()I
    .locals 1

    .prologue
    .line 42
    const/4 v0, 0x1

    return v0
.end method

.method public getTimeout()I
    .locals 1

    .prologue
    .line 47
    iget v0, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestSetDeviceIcon;->TIMEOUT:I

    return v0
.end method

.method public getTimeoutLimit()I
    .locals 1

    .prologue
    .line 52
    const v0, 0xea60

    return v0
.end method

.method public getURL()Ljava/lang/String;
    .locals 1

    .prologue
    .line 57
    iget-object v0, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestSetDeviceIcon;->cloudURL:Ljava/lang/String;

    return-object v0
.end method

.method public getUploadFileName()Ljava/lang/String;
    .locals 1

    .prologue
    .line 72
    const/4 v0, 0x0

    return-object v0
.end method

.method public isAuthHeaderRequired()Z
    .locals 1

    .prologue
    .line 77
    const/4 v0, 0x1

    return v0
.end method

.method public requestComplete(ZI[B)V
    .locals 9
    .param p1, "success"    # Z
    .param p2, "statusCode"    # I
    .param p3, "response"    # [B

    .prologue
    .line 82
    iget-object v5, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestSetDeviceIcon;->context:Landroid/content/Context;

    invoke-static {v5}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->getInstance(Landroid/content/Context;)Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    move-result-object v1

    .line 83
    .local v1, "deviceListManager":Lcom/belkin/wemo/cache/devicelist/DeviceListManager;
    if-eqz p1, :cond_6

    .line 85
    :try_start_0
    new-instance v4, Ljava/lang/String;

    const-string v5, "UTF-8"

    invoke-direct {v4, p3, v5}, Ljava/lang/String;-><init>([BLjava/lang/String;)V

    .line 86
    .local v4, "stringResponse":Ljava/lang/String;
    invoke-direct {p0, v4}, Lcom/belkin/wemo/cache/cloud/CloudRequestSetDeviceIcon;->parseResponse(Ljava/lang/String;)Z

    move-result v3

    .line 88
    .local v3, "responseParse":Z
    if-eqz v3, :cond_4

    .line 89
    invoke-virtual {v1}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->getDeviceInformationList()Ljava/util/Map;

    move-result-object v5

    iget-object v6, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestSetDeviceIcon;->udn:Ljava/lang/String;

    invoke-interface {v5, v6}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/belkin/wemo/cache/data/DeviceInformation;

    .line 90
    .local v0, "deviceInfo":Lcom/belkin/wemo/cache/data/DeviceInformation;
    if-eqz v0, :cond_1

    .line 91
    iget-object v5, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestSetDeviceIcon;->iconVersionFromCloud:Ljava/lang/String;

    invoke-virtual {v0, v5}, Lcom/belkin/wemo/cache/data/DeviceInformation;->setIconVersion(Ljava/lang/String;)V

    .line 92
    iget-object v5, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestSetDeviceIcon;->iconLocation:Ljava/lang/String;

    invoke-virtual {v0, v5}, Lcom/belkin/wemo/cache/data/DeviceInformation;->setIcon(Ljava/lang/String;)V

    .line 93
    iget-object v5, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestSetDeviceIcon;->context:Landroid/content/Context;

    invoke-static {v5}, Lcom/belkin/wemo/cache/data/DevicesArray;->getInstance(Landroid/content/Context;)Lcom/belkin/wemo/cache/data/DevicesArray;

    move-result-object v5

    invoke-virtual {v5, v0}, Lcom/belkin/wemo/cache/data/DevicesArray;->addOrUpdateDeviceInformation(Lcom/belkin/wemo/cache/data/DeviceInformation;)V

    .line 94
    iget-object v5, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestSetDeviceIcon;->context:Landroid/content/Context;

    invoke-static {v5}, Lcom/belkin/wemo/cache/CacheManager;->getInstance(Landroid/content/Context;)Lcom/belkin/wemo/cache/CacheManager;

    move-result-object v5

    const/4 v6, 0x0

    const/4 v7, 0x0

    const/4 v8, 0x1

    invoke-virtual {v5, v0, v6, v7, v8}, Lcom/belkin/wemo/cache/CacheManager;->updateDB(Lcom/belkin/wemo/cache/data/DeviceInformation;ZZZ)V

    .line 96
    invoke-virtual {p0}, Lcom/belkin/wemo/cache/cloud/CloudRequestSetDeviceIcon;->getOnCloudRequestCompletedListener()Lcom/belkin/wemo/cache/cloud/AbstractCloudRequest$OnCloudRequestCompleted;

    move-result-object v5

    if-eqz v5, :cond_0

    .line 97
    invoke-virtual {p0}, Lcom/belkin/wemo/cache/cloud/CloudRequestSetDeviceIcon;->getOnCloudRequestCompletedListener()Lcom/belkin/wemo/cache/cloud/AbstractCloudRequest$OnCloudRequestCompleted;

    move-result-object v5

    invoke-interface {v5}, Lcom/belkin/wemo/cache/cloud/AbstractCloudRequest$OnCloudRequestCompleted;->onSuccess()V

    .line 99
    :cond_0
    const-string v5, "update"

    invoke-static {p1}, Ljava/lang/String;->valueOf(Z)Ljava/lang/String;

    move-result-object v6

    iget-object v7, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestSetDeviceIcon;->udn:Ljava/lang/String;

    invoke-virtual {v1, v5, v6, v7}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->sendNotification(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 126
    .end local v0    # "deviceInfo":Lcom/belkin/wemo/cache/data/DeviceInformation;
    .end local v3    # "responseParse":Z
    .end local v4    # "stringResponse":Ljava/lang/String;
    :goto_0
    return-void

    .line 101
    .restart local v0    # "deviceInfo":Lcom/belkin/wemo/cache/data/DeviceInformation;
    .restart local v3    # "responseParse":Z
    .restart local v4    # "stringResponse":Ljava/lang/String;
    :cond_1
    invoke-virtual {p0}, Lcom/belkin/wemo/cache/cloud/CloudRequestSetDeviceIcon;->getOnCloudRequestCompletedListener()Lcom/belkin/wemo/cache/cloud/AbstractCloudRequest$OnCloudRequestCompleted;

    move-result-object v5

    if-eqz v5, :cond_2

    .line 102
    invoke-virtual {p0}, Lcom/belkin/wemo/cache/cloud/CloudRequestSetDeviceIcon;->getOnCloudRequestCompletedListener()Lcom/belkin/wemo/cache/cloud/AbstractCloudRequest$OnCloudRequestCompleted;

    move-result-object v5

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "DeviceInformation is null for udn of "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    iget-object v7, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestSetDeviceIcon;->udn:Ljava/lang/String;

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-interface {v5, v6}, Lcom/belkin/wemo/cache/cloud/AbstractCloudRequest$OnCloudRequestCompleted;->onError(Ljava/lang/String;)V

    .line 104
    :cond_2
    const-string v5, "update"

    invoke-static {p1}, Ljava/lang/String;->valueOf(Z)Ljava/lang/String;

    move-result-object v6

    iget-object v7, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestSetDeviceIcon;->udn:Ljava/lang/String;

    invoke-virtual {v1, v5, v6, v7}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->sendNotification(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 113
    .end local v0    # "deviceInfo":Lcom/belkin/wemo/cache/data/DeviceInformation;
    .end local v3    # "responseParse":Z
    .end local v4    # "stringResponse":Ljava/lang/String;
    :catch_0
    move-exception v2

    .line 114
    .local v2, "e":Ljava/io/UnsupportedEncodingException;
    iget-object v5, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestSetDeviceIcon;->TAG:Ljava/lang/String;

    const-string v6, "UnsupportedEncodingException while parsing cloud response: "

    invoke-static {v5, v6, v2}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Exception;)V

    .line 115
    invoke-virtual {p0}, Lcom/belkin/wemo/cache/cloud/CloudRequestSetDeviceIcon;->getOnCloudRequestCompletedListener()Lcom/belkin/wemo/cache/cloud/AbstractCloudRequest$OnCloudRequestCompleted;

    move-result-object v5

    if-eqz v5, :cond_3

    .line 116
    invoke-virtual {p0}, Lcom/belkin/wemo/cache/cloud/CloudRequestSetDeviceIcon;->getOnCloudRequestCompletedListener()Lcom/belkin/wemo/cache/cloud/AbstractCloudRequest$OnCloudRequestCompleted;

    move-result-object v5

    invoke-virtual {v2}, Ljava/io/UnsupportedEncodingException;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-interface {v5, v6}, Lcom/belkin/wemo/cache/cloud/AbstractCloudRequest$OnCloudRequestCompleted;->onError(Ljava/lang/String;)V

    .line 118
    :cond_3
    const-string v5, "update"

    invoke-static {p1}, Ljava/lang/String;->valueOf(Z)Ljava/lang/String;

    move-result-object v6

    iget-object v7, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestSetDeviceIcon;->udn:Ljava/lang/String;

    invoke-virtual {v1, v5, v6, v7}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->sendNotification(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    .line 107
    .end local v2    # "e":Ljava/io/UnsupportedEncodingException;
    .restart local v3    # "responseParse":Z
    .restart local v4    # "stringResponse":Ljava/lang/String;
    :cond_4
    :try_start_1
    invoke-virtual {p0}, Lcom/belkin/wemo/cache/cloud/CloudRequestSetDeviceIcon;->getOnCloudRequestCompletedListener()Lcom/belkin/wemo/cache/cloud/AbstractCloudRequest$OnCloudRequestCompleted;

    move-result-object v5

    if-eqz v5, :cond_5

    .line 108
    invoke-virtual {p0}, Lcom/belkin/wemo/cache/cloud/CloudRequestSetDeviceIcon;->getOnCloudRequestCompletedListener()Lcom/belkin/wemo/cache/cloud/AbstractCloudRequest$OnCloudRequestCompleted;

    move-result-object v5

    invoke-static {v3}, Ljava/lang/String;->valueOf(Z)Ljava/lang/String;

    move-result-object v6

    invoke-interface {v5, v6}, Lcom/belkin/wemo/cache/cloud/AbstractCloudRequest$OnCloudRequestCompleted;->onError(Ljava/lang/String;)V

    .line 110
    :cond_5
    const-string v5, "update"

    invoke-static {p1}, Ljava/lang/String;->valueOf(Z)Ljava/lang/String;

    move-result-object v6

    iget-object v7, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestSetDeviceIcon;->udn:Ljava/lang/String;

    invoke-virtual {v1, v5, v6, v7}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->sendNotification(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    :try_end_1
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_0

    .line 121
    .end local v3    # "responseParse":Z
    .end local v4    # "stringResponse":Ljava/lang/String;
    :cond_6
    invoke-virtual {p0}, Lcom/belkin/wemo/cache/cloud/CloudRequestSetDeviceIcon;->getOnCloudRequestCompletedListener()Lcom/belkin/wemo/cache/cloud/AbstractCloudRequest$OnCloudRequestCompleted;

    move-result-object v5

    if-eqz v5, :cond_7

    .line 122
    invoke-virtual {p0}, Lcom/belkin/wemo/cache/cloud/CloudRequestSetDeviceIcon;->getOnCloudRequestCompletedListener()Lcom/belkin/wemo/cache/cloud/AbstractCloudRequest$OnCloudRequestCompleted;

    move-result-object v5

    invoke-static {p1}, Ljava/lang/String;->valueOf(Z)Ljava/lang/String;

    move-result-object v6

    invoke-interface {v5, v6}, Lcom/belkin/wemo/cache/cloud/AbstractCloudRequest$OnCloudRequestCompleted;->onError(Ljava/lang/String;)V

    .line 124
    :cond_7
    const-string v5, "update"

    invoke-static {p1}, Ljava/lang/String;->valueOf(Z)Ljava/lang/String;

    move-result-object v6

    iget-object v7, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestSetDeviceIcon;->udn:Ljava/lang/String;

    invoke-virtual {v1, v5, v6, v7}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->sendNotification(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    goto/16 :goto_0
.end method
