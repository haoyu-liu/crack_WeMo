.class public Lcom/belkin/wemo/cache/cloud/CloudRequestGetLEDIconInfo;
.super Ljava/lang/Object;
.source "CloudRequestGetLEDIconInfo.java"

# interfaces
.implements Lcom/belkin/wemo/cache/cloud/CloudRequestInterface;


# static fields
.field private static final KEY_REFERENCE_ID_TAG:Ljava/lang/String; = "referenceId"

.field private static final KEY_UPLOAD_ID_TAG:Ljava/lang/String; = "uploadId"

.field private static final KEY_UPLOAD_TAG:Ljava/lang/String; = "upload"


# instance fields
.field private final TAG:Ljava/lang/String;

.field private TIMEOUT:I

.field private final TIMEOUT_LIMIT:I

.field private final URL:Ljava/lang/String;

.field private cloudURL:Ljava/lang/String;

.field private mDevListMan:Lcom/belkin/wemo/cache/devicelist/DeviceListManager;


# direct methods
.method public constructor <init>(Lcom/belkin/wemo/cache/devicelist/DeviceListManager;Ljava/lang/String;)V
    .locals 2
    .param p1, "devListMan"    # Lcom/belkin/wemo/cache/devicelist/DeviceListManager;
    .param p2, "homeID"    # Ljava/lang/String;

    .prologue
    .line 24
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 17
    const v0, 0x3a980

    iput v0, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestGetLEDIconInfo;->TIMEOUT_LIMIT:I

    .line 20
    const v0, 0xea60

    iput v0, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestGetLEDIconInfo;->TIMEOUT:I

    .line 21
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v1, Lcom/belkin/wemo/cache/cloud/CloudConstants;->CLOUD_URL:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "/apis/http/device/homeUploads/"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestGetLEDIconInfo;->URL:Ljava/lang/String;

    .line 22
    const-string v0, "SDK_CloudRequestGetLEDIconInfo"

    iput-object v0, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestGetLEDIconInfo;->TAG:Ljava/lang/String;

    .line 25
    iput-object p1, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestGetLEDIconInfo;->mDevListMan:Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    .line 26
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v1, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestGetLEDIconInfo;->URL:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestGetLEDIconInfo;->cloudURL:Ljava/lang/String;

    .line 27
    return-void
.end method

.method private parseResponse(Ljava/lang/String;)Z
    .locals 11
    .param p1, "response"    # Ljava/lang/String;

    .prologue
    .line 72
    new-instance v5, Lcom/belkin/wemo/cache/cloud/XMLParser;

    invoke-direct {v5}, Lcom/belkin/wemo/cache/cloud/XMLParser;-><init>()V

    .line 73
    .local v5, "parser":Lcom/belkin/wemo/cache/cloud/XMLParser;
    invoke-virtual {v5, p1}, Lcom/belkin/wemo/cache/cloud/XMLParser;->getDomElement(Ljava/lang/String;)Lorg/w3c/dom/Document;

    move-result-object v0

    .line 74
    .local v0, "doc":Lorg/w3c/dom/Document;
    const-string v8, "upload"

    invoke-interface {v0, v8}, Lorg/w3c/dom/Document;->getElementsByTagName(Ljava/lang/String;)Lorg/w3c/dom/NodeList;

    move-result-object v3

    .line 76
    .local v3, "nl":Lorg/w3c/dom/NodeList;
    invoke-interface {v3}, Lorg/w3c/dom/NodeList;->getLength()I

    move-result v4

    .line 77
    .local v4, "nlLength":I
    const-string v8, "SDK_CloudRequestGetLEDIconInfo"

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "LED ICONINFO: uploadIDs count: "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-static {v8, v9}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 79
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_0
    if-ge v2, v4, :cond_1

    .line 80
    invoke-interface {v3, v2}, Lorg/w3c/dom/NodeList;->item(I)Lorg/w3c/dom/Node;

    move-result-object v1

    check-cast v1, Lorg/w3c/dom/Element;

    .line 82
    .local v1, "e":Lorg/w3c/dom/Element;
    const-string v8, "uploadId"

    invoke-virtual {v5, v1, v8}, Lcom/belkin/wemo/cache/cloud/XMLParser;->getValue(Lorg/w3c/dom/Element;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    .line 83
    .local v7, "uploadID":Ljava/lang/String;
    const-string v8, "referenceId"

    invoke-virtual {v5, v1, v8}, Lcom/belkin/wemo/cache/cloud/XMLParser;->getValue(Lorg/w3c/dom/Element;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    .line 84
    .local v6, "referenceID":Ljava/lang/String;
    const-string v8, "SDK_CloudRequestGetLEDIconInfo"

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "LED ICONINFO: uploadID: "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    const-string v10, " referenceID: "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-static {v8, v9}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 86
    if-eqz v7, :cond_0

    invoke-virtual {v7}, Ljava/lang/String;->isEmpty()Z

    move-result v8

    if-nez v8, :cond_0

    if-eqz v6, :cond_0

    invoke-virtual {v6}, Ljava/lang/String;->isEmpty()Z

    move-result v8

    if-nez v8, :cond_0

    .line 87
    iget-object v8, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestGetLEDIconInfo;->mDevListMan:Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    invoke-virtual {v8, v6, v7}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->getLEDDeviceIcon(Ljava/lang/String;Ljava/lang/String;)V

    .line 79
    :cond_0
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 91
    .end local v1    # "e":Lorg/w3c/dom/Element;
    .end local v6    # "referenceID":Ljava/lang/String;
    .end local v7    # "uploadID":Ljava/lang/String;
    :cond_1
    const/4 v8, 0x1

    return v8
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
    .line 110
    const/4 v0, 0x0

    return-object v0
.end method

.method public getBody()Ljava/lang/String;
    .locals 1

    .prologue
    .line 49
    const-string v0, ""

    return-object v0
.end method

.method public getFileByteArray()[B
    .locals 1

    .prologue
    .line 97
    const/4 v0, 0x0

    return-object v0
.end method

.method public getRequestMethod()I
    .locals 1

    .prologue
    .line 29
    const/4 v0, 0x2

    return v0
.end method

.method public getTimeout()I
    .locals 1

    .prologue
    .line 34
    iget v0, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestGetLEDIconInfo;->TIMEOUT:I

    return v0
.end method

.method public getTimeoutLimit()I
    .locals 1

    .prologue
    .line 39
    const v0, 0x3a980

    return v0
.end method

.method public getURL()Ljava/lang/String;
    .locals 1

    .prologue
    .line 44
    iget-object v0, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestGetLEDIconInfo;->cloudURL:Ljava/lang/String;

    return-object v0
.end method

.method public getUploadFileName()Ljava/lang/String;
    .locals 1

    .prologue
    .line 102
    const/4 v0, 0x0

    return-object v0
.end method

.method public isAuthHeaderRequired()Z
    .locals 1

    .prologue
    .line 106
    const/4 v0, 0x1

    return v0
.end method

.method public requestComplete(ZI[B)V
    .locals 6
    .param p1, "success"    # Z
    .param p2, "statusCode"    # I
    .param p3, "resp"    # [B

    .prologue
    .line 54
    if-eqz p1, :cond_0

    .line 55
    const-string v1, ""

    .line 58
    .local v1, "response":Ljava/lang/String;
    :try_start_0
    new-instance v2, Ljava/lang/String;

    const-string v3, "UTF-8"

    invoke-direct {v2, p3, v3}, Ljava/lang/String;-><init>([BLjava/lang/String;)V
    :try_end_0
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_0 .. :try_end_0} :catch_0

    .line 60
    .end local v1    # "response":Ljava/lang/String;
    .local v2, "response":Ljava/lang/String;
    :try_start_1
    const-string v3, "SDK_CloudRequestGetLEDIconInfo"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "LED ICONINFO"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 62
    invoke-direct {p0, v2}, Lcom/belkin/wemo/cache/cloud/CloudRequestGetLEDIconInfo;->parseResponse(Ljava/lang/String;)Z
    :try_end_1
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_1 .. :try_end_1} :catch_1

    .line 69
    .end local v2    # "response":Ljava/lang/String;
    :cond_0
    :goto_0
    return-void

    .line 64
    .restart local v1    # "response":Ljava/lang/String;
    :catch_0
    move-exception v0

    .line 65
    .local v0, "e":Ljava/io/UnsupportedEncodingException;
    :goto_1
    const-string v3, "SDK_CloudRequestGetLEDIconInfo"

    const-string v4, "UnsupportedEncodingException while getting LED iconinfo"

    invoke-static {v3, v4, v0}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Exception;)V

    goto :goto_0

    .line 64
    .end local v0    # "e":Ljava/io/UnsupportedEncodingException;
    .end local v1    # "response":Ljava/lang/String;
    .restart local v2    # "response":Ljava/lang/String;
    :catch_1
    move-exception v0

    move-object v1, v2

    .end local v2    # "response":Ljava/lang/String;
    .restart local v1    # "response":Ljava/lang/String;
    goto :goto_1
.end method
