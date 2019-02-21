.class public Lcom/belkin/wemo/cache/cloud/CloudRequestGetLEDIcon;
.super Ljava/lang/Object;
.source "CloudRequestGetLEDIcon.java"

# interfaces
.implements Lcom/belkin/wemo/cache/cloud/CloudRequestInterface;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/belkin/wemo/cache/cloud/CloudRequestGetLEDIcon$1;,
        Lcom/belkin/wemo/cache/cloud/CloudRequestGetLEDIcon$IconDownloader;
    }
.end annotation


# static fields
.field private static final KEY_UPLOAD_ID_TAG:Ljava/lang/String; = "uploadId"

.field private static final KEY_UPLOAD_TAG:Ljava/lang/String; = "upload"

.field private static final KEY_URL_TAG:Ljava/lang/String; = "url"


# instance fields
.field private final TAG:Ljava/lang/String;

.field private TIMEOUT:I

.field private final TIMEOUT_LIMIT:I

.field private final URL:Ljava/lang/String;

.field private cloudURL:Ljava/lang/String;

.field private mDevListMan:Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

.field private mDeviceID:Ljava/lang/String;


# direct methods
.method public constructor <init>(Lcom/belkin/wemo/cache/devicelist/DeviceListManager;Ljava/lang/String;Ljava/lang/String;)V
    .locals 2
    .param p1, "devListMan"    # Lcom/belkin/wemo/cache/devicelist/DeviceListManager;
    .param p2, "deviceID"    # Ljava/lang/String;
    .param p3, "uploadID"    # Ljava/lang/String;

    .prologue
    .line 34
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 26
    const v0, 0x3a980

    iput v0, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestGetLEDIcon;->TIMEOUT_LIMIT:I

    .line 29
    const v0, 0xea60

    iput v0, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestGetLEDIcon;->TIMEOUT:I

    .line 30
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v1, Lcom/belkin/wemo/cache/cloud/CloudConstants;->CLOUD_URL:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "/apis/http/lswf/uploads/"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestGetLEDIcon;->URL:Ljava/lang/String;

    .line 31
    const-string v0, "SDK_CloudRequestGetLEDIcon"

    iput-object v0, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestGetLEDIcon;->TAG:Ljava/lang/String;

    .line 35
    iput-object p1, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestGetLEDIcon;->mDevListMan:Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    .line 36
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v1, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestGetLEDIcon;->URL:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestGetLEDIcon;->cloudURL:Ljava/lang/String;

    .line 37
    iput-object p2, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestGetLEDIcon;->mDeviceID:Ljava/lang/String;

    .line 38
    return-void
.end method

.method static synthetic access$100(Lcom/belkin/wemo/cache/cloud/CloudRequestGetLEDIcon;)Lcom/belkin/wemo/cache/devicelist/DeviceListManager;
    .locals 1
    .param p0, "x0"    # Lcom/belkin/wemo/cache/cloud/CloudRequestGetLEDIcon;

    .prologue
    .line 22
    iget-object v0, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestGetLEDIcon;->mDevListMan:Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    return-object v0
.end method

.method private parseResponse(Ljava/lang/String;)Z
    .locals 13
    .param p1, "response"    # Ljava/lang/String;

    .prologue
    .line 84
    :try_start_0
    new-instance v6, Lcom/belkin/wemo/cache/cloud/XMLParser;

    invoke-direct {v6}, Lcom/belkin/wemo/cache/cloud/XMLParser;-><init>()V

    .line 85
    .local v6, "parser":Lcom/belkin/wemo/cache/cloud/XMLParser;
    invoke-virtual {v6, p1}, Lcom/belkin/wemo/cache/cloud/XMLParser;->getDomElement(Ljava/lang/String;)Lorg/w3c/dom/Document;

    move-result-object v0

    .line 86
    .local v0, "doc":Lorg/w3c/dom/Document;
    const-string v8, "upload"

    invoke-interface {v0, v8}, Lorg/w3c/dom/Document;->getElementsByTagName(Ljava/lang/String;)Lorg/w3c/dom/NodeList;

    move-result-object v5

    .line 88
    .local v5, "nl":Lorg/w3c/dom/NodeList;
    const/4 v3, 0x0

    .local v3, "i":I
    :goto_0
    invoke-interface {v5}, Lorg/w3c/dom/NodeList;->getLength()I

    move-result v8

    if-ge v3, v8, :cond_2

    .line 89
    invoke-interface {v5, v3}, Lorg/w3c/dom/NodeList;->item(I)Lorg/w3c/dom/Node;

    move-result-object v1

    check-cast v1, Lorg/w3c/dom/Element;

    .line 91
    .local v1, "e":Lorg/w3c/dom/Element;
    const-string v8, "uploadId"

    invoke-virtual {v6, v1, v8}, Lcom/belkin/wemo/cache/cloud/XMLParser;->getValue(Lorg/w3c/dom/Element;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    .line 92
    .local v7, "uploadID":Ljava/lang/String;
    const-string v8, "url"

    invoke-virtual {v6, v1, v8}, Lcom/belkin/wemo/cache/cloud/XMLParser;->getValue(Lorg/w3c/dom/Element;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    .line 93
    .local v4, "iconUrl":Ljava/lang/String;
    const-string v8, "SDK_CloudRequestGetLEDIcon"

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "LED ICONINFO: uploadID: "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    const-string v10, " url: "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-static {v8, v9}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 95
    if-eqz v7, :cond_0

    invoke-virtual {v7}, Ljava/lang/String;->isEmpty()Z

    move-result v8

    if-nez v8, :cond_0

    if-eqz v4, :cond_0

    invoke-virtual {v4}, Ljava/lang/String;->isEmpty()Z

    move-result v8

    if-nez v8, :cond_0

    .line 96
    sget v8, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v9, 0xb

    if-lt v8, v9, :cond_1

    .line 97
    new-instance v8, Lcom/belkin/wemo/cache/cloud/CloudRequestGetLEDIcon$IconDownloader;

    const/4 v9, 0x0

    invoke-direct {v8, p0, v9}, Lcom/belkin/wemo/cache/cloud/CloudRequestGetLEDIcon$IconDownloader;-><init>(Lcom/belkin/wemo/cache/cloud/CloudRequestGetLEDIcon;Lcom/belkin/wemo/cache/cloud/CloudRequestGetLEDIcon$1;)V

    sget-object v9, Landroid/os/AsyncTask;->THREAD_POOL_EXECUTOR:Ljava/util/concurrent/Executor;

    const/4 v10, 0x3

    new-array v10, v10, [Ljava/lang/Object;

    const/4 v11, 0x0

    aput-object v4, v10, v11

    const/4 v11, 0x1

    iget-object v12, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestGetLEDIcon;->mDeviceID:Ljava/lang/String;

    aput-object v12, v10, v11

    const/4 v11, 0x2

    aput-object v7, v10, v11

    invoke-virtual {v8, v9, v10}, Lcom/belkin/wemo/cache/cloud/CloudRequestGetLEDIcon$IconDownloader;->executeOnExecutor(Ljava/util/concurrent/Executor;[Ljava/lang/Object;)Landroid/os/AsyncTask;

    .line 88
    :cond_0
    :goto_1
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 100
    :cond_1
    new-instance v8, Lcom/belkin/wemo/cache/cloud/CloudRequestGetLEDIcon$IconDownloader;

    const/4 v9, 0x0

    invoke-direct {v8, p0, v9}, Lcom/belkin/wemo/cache/cloud/CloudRequestGetLEDIcon$IconDownloader;-><init>(Lcom/belkin/wemo/cache/cloud/CloudRequestGetLEDIcon;Lcom/belkin/wemo/cache/cloud/CloudRequestGetLEDIcon$1;)V

    const/4 v9, 0x3

    new-array v9, v9, [Ljava/lang/Object;

    const/4 v10, 0x0

    aput-object v4, v9, v10

    const/4 v10, 0x1

    iget-object v11, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestGetLEDIcon;->mDeviceID:Ljava/lang/String;

    aput-object v11, v9, v10

    const/4 v10, 0x2

    aput-object v7, v9, v10

    invoke-virtual {v8, v9}, Lcom/belkin/wemo/cache/cloud/CloudRequestGetLEDIcon$IconDownloader;->execute([Ljava/lang/Object;)Landroid/os/AsyncTask;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_1

    .line 107
    .end local v0    # "doc":Lorg/w3c/dom/Document;
    .end local v1    # "e":Lorg/w3c/dom/Element;
    .end local v3    # "i":I
    .end local v4    # "iconUrl":Ljava/lang/String;
    .end local v5    # "nl":Lorg/w3c/dom/NodeList;
    .end local v6    # "parser":Lcom/belkin/wemo/cache/cloud/XMLParser;
    .end local v7    # "uploadID":Ljava/lang/String;
    :catch_0
    move-exception v2

    .line 108
    .local v2, "ex":Ljava/lang/Exception;
    const-string v8, "SDK_CloudRequestGetLEDIcon"

    const-string v9, "Exception while getting LED icon"

    invoke-static {v8, v9, v2}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Exception;)V

    .line 109
    const/4 v8, 0x0

    .end local v2    # "ex":Ljava/lang/Exception;
    :goto_2
    return v8

    .line 105
    .restart local v0    # "doc":Lorg/w3c/dom/Document;
    .restart local v3    # "i":I
    .restart local v5    # "nl":Lorg/w3c/dom/NodeList;
    .restart local v6    # "parser":Lcom/belkin/wemo/cache/cloud/XMLParser;
    :cond_2
    const/4 v8, 0x1

    goto :goto_2
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
    .line 156
    const/4 v0, 0x0

    return-object v0
.end method

.method public getBody()Ljava/lang/String;
    .locals 1

    .prologue
    .line 60
    const-string v0, ""

    return-object v0
.end method

.method public getFileByteArray()[B
    .locals 1

    .prologue
    .line 143
    const/4 v0, 0x0

    return-object v0
.end method

.method public getRequestMethod()I
    .locals 1

    .prologue
    .line 40
    const/4 v0, 0x2

    return v0
.end method

.method public getTimeout()I
    .locals 1

    .prologue
    .line 45
    iget v0, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestGetLEDIcon;->TIMEOUT:I

    return v0
.end method

.method public getTimeoutLimit()I
    .locals 1

    .prologue
    .line 50
    const v0, 0x3a980

    return v0
.end method

.method public getURL()Ljava/lang/String;
    .locals 1

    .prologue
    .line 55
    iget-object v0, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestGetLEDIcon;->cloudURL:Ljava/lang/String;

    return-object v0
.end method

.method public getUploadFileName()Ljava/lang/String;
    .locals 1

    .prologue
    .line 148
    const/4 v0, 0x0

    return-object v0
.end method

.method public isAuthHeaderRequired()Z
    .locals 1

    .prologue
    .line 152
    const/4 v0, 0x1

    return v0
.end method

.method public requestComplete(ZI[B)V
    .locals 6
    .param p1, "success"    # Z
    .param p2, "statusCode"    # I
    .param p3, "resp"    # [B

    .prologue
    .line 65
    if-eqz p1, :cond_0

    .line 66
    const-string v1, ""

    .line 69
    .local v1, "response":Ljava/lang/String;
    :try_start_0
    new-instance v2, Ljava/lang/String;

    const-string v3, "UTF-8"

    invoke-direct {v2, p3, v3}, Ljava/lang/String;-><init>([BLjava/lang/String;)V
    :try_end_0
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_0 .. :try_end_0} :catch_0

    .line 71
    .end local v1    # "response":Ljava/lang/String;
    .local v2, "response":Ljava/lang/String;
    :try_start_1
    const-string v3, "SDK_CloudRequestGetLEDIcon"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "LED Upload: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 73
    invoke-direct {p0, v2}, Lcom/belkin/wemo/cache/cloud/CloudRequestGetLEDIcon;->parseResponse(Ljava/lang/String;)Z
    :try_end_1
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_1 .. :try_end_1} :catch_1

    .line 80
    .end local v2    # "response":Ljava/lang/String;
    :cond_0
    :goto_0
    return-void

    .line 75
    .restart local v1    # "response":Ljava/lang/String;
    :catch_0
    move-exception v0

    .line 76
    .local v0, "e":Ljava/io/UnsupportedEncodingException;
    :goto_1
    const-string v3, "SDK_CloudRequestGetLEDIcon"

    const-string v4, "UnsupportedEncodingException while getting LED icon"

    invoke-static {v3, v4, v0}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Exception;)V

    goto :goto_0

    .line 75
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
