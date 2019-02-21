.class public Lcom/belkin/wemo/cache/cloud/CloudRequestGetLEDGroupIcon;
.super Ljava/lang/Object;
.source "CloudRequestGetLEDGroupIcon.java"

# interfaces
.implements Lcom/belkin/wemo/cache/cloud/CloudRequestInterface;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/belkin/wemo/cache/cloud/CloudRequestGetLEDGroupIcon$1;,
        Lcom/belkin/wemo/cache/cloud/CloudRequestGetLEDGroupIcon$IconDownloader;
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

.field private udnList:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lcom/belkin/wemo/cache/devicelist/DeviceListManager;Ljava/util/List;Ljava/lang/String;Ljava/lang/String;)V
    .locals 2
    .param p1, "devListMan"    # Lcom/belkin/wemo/cache/devicelist/DeviceListManager;
    .param p3, "uploadID"    # Ljava/lang/String;
    .param p4, "deviceID"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/belkin/wemo/cache/devicelist/DeviceListManager;",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    .prologue
    .line 36
    .local p2, "udnList":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 27
    const v0, 0x3a980

    iput v0, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestGetLEDGroupIcon;->TIMEOUT_LIMIT:I

    .line 30
    const v0, 0xea60

    iput v0, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestGetLEDGroupIcon;->TIMEOUT:I

    .line 31
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

    iput-object v0, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestGetLEDGroupIcon;->URL:Ljava/lang/String;

    .line 32
    const-string v0, "SDK_CloudRequestGetLEDGroupIcon"

    iput-object v0, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestGetLEDGroupIcon;->TAG:Ljava/lang/String;

    .line 37
    iput-object p1, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestGetLEDGroupIcon;->mDevListMan:Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    .line 38
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v1, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestGetLEDGroupIcon;->URL:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestGetLEDGroupIcon;->cloudURL:Ljava/lang/String;

    .line 39
    iput-object p2, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestGetLEDGroupIcon;->udnList:Ljava/util/List;

    .line 40
    iput-object p4, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestGetLEDGroupIcon;->mDeviceID:Ljava/lang/String;

    .line 41
    return-void
.end method

.method static synthetic access$100(Lcom/belkin/wemo/cache/cloud/CloudRequestGetLEDGroupIcon;)Ljava/util/List;
    .locals 1
    .param p0, "x0"    # Lcom/belkin/wemo/cache/cloud/CloudRequestGetLEDGroupIcon;

    .prologue
    .line 23
    iget-object v0, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestGetLEDGroupIcon;->udnList:Ljava/util/List;

    return-object v0
.end method

.method static synthetic access$200(Lcom/belkin/wemo/cache/cloud/CloudRequestGetLEDGroupIcon;)Lcom/belkin/wemo/cache/devicelist/DeviceListManager;
    .locals 1
    .param p0, "x0"    # Lcom/belkin/wemo/cache/cloud/CloudRequestGetLEDGroupIcon;

    .prologue
    .line 23
    iget-object v0, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestGetLEDGroupIcon;->mDevListMan:Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    return-object v0
.end method

.method private parseResponse(Ljava/lang/String;)Z
    .locals 13
    .param p1, "response"    # Ljava/lang/String;

    .prologue
    .line 87
    :try_start_0
    new-instance v6, Lcom/belkin/wemo/cache/cloud/XMLParser;

    invoke-direct {v6}, Lcom/belkin/wemo/cache/cloud/XMLParser;-><init>()V

    .line 88
    .local v6, "parser":Lcom/belkin/wemo/cache/cloud/XMLParser;
    invoke-virtual {v6, p1}, Lcom/belkin/wemo/cache/cloud/XMLParser;->getDomElement(Ljava/lang/String;)Lorg/w3c/dom/Document;

    move-result-object v0

    .line 89
    .local v0, "doc":Lorg/w3c/dom/Document;
    const-string v8, "upload"

    invoke-interface {v0, v8}, Lorg/w3c/dom/Document;->getElementsByTagName(Ljava/lang/String;)Lorg/w3c/dom/NodeList;

    move-result-object v5

    .line 91
    .local v5, "nl":Lorg/w3c/dom/NodeList;
    const/4 v3, 0x0

    .local v3, "i":I
    :goto_0
    invoke-interface {v5}, Lorg/w3c/dom/NodeList;->getLength()I

    move-result v8

    if-ge v3, v8, :cond_2

    .line 92
    invoke-interface {v5, v3}, Lorg/w3c/dom/NodeList;->item(I)Lorg/w3c/dom/Node;

    move-result-object v1

    check-cast v1, Lorg/w3c/dom/Element;

    .line 94
    .local v1, "e":Lorg/w3c/dom/Element;
    const-string v8, "uploadId"

    invoke-virtual {v6, v1, v8}, Lcom/belkin/wemo/cache/cloud/XMLParser;->getValue(Lorg/w3c/dom/Element;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    .line 95
    .local v7, "uploadID":Ljava/lang/String;
    const-string v8, "url"

    invoke-virtual {v6, v1, v8}, Lcom/belkin/wemo/cache/cloud/XMLParser;->getValue(Lorg/w3c/dom/Element;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    .line 96
    .local v4, "iconUrl":Ljava/lang/String;
    const-string v8, "SDK_CloudRequestGetLEDGroupIcon"

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

    const-string v10, " ;udnList: "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    iget-object v10, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestGetLEDGroupIcon;->udnList:Ljava/util/List;

    invoke-virtual {v10}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-static {v8, v9}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 98
    if-eqz v7, :cond_0

    invoke-virtual {v7}, Ljava/lang/String;->isEmpty()Z

    move-result v8

    if-nez v8, :cond_0

    if-eqz v4, :cond_0

    invoke-virtual {v4}, Ljava/lang/String;->isEmpty()Z

    move-result v8

    if-nez v8, :cond_0

    .line 100
    sget v8, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v9, 0xb

    if-lt v8, v9, :cond_1

    .line 101
    new-instance v8, Lcom/belkin/wemo/cache/cloud/CloudRequestGetLEDGroupIcon$IconDownloader;

    const/4 v9, 0x0

    invoke-direct {v8, p0, v9}, Lcom/belkin/wemo/cache/cloud/CloudRequestGetLEDGroupIcon$IconDownloader;-><init>(Lcom/belkin/wemo/cache/cloud/CloudRequestGetLEDGroupIcon;Lcom/belkin/wemo/cache/cloud/CloudRequestGetLEDGroupIcon$1;)V

    sget-object v9, Landroid/os/AsyncTask;->THREAD_POOL_EXECUTOR:Ljava/util/concurrent/Executor;

    const/4 v10, 0x3

    new-array v10, v10, [Ljava/lang/Object;

    const/4 v11, 0x0

    aput-object v4, v10, v11

    const/4 v11, 0x1

    iget-object v12, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestGetLEDGroupIcon;->mDeviceID:Ljava/lang/String;

    aput-object v12, v10, v11

    const/4 v11, 0x2

    aput-object v7, v10, v11

    invoke-virtual {v8, v9, v10}, Lcom/belkin/wemo/cache/cloud/CloudRequestGetLEDGroupIcon$IconDownloader;->executeOnExecutor(Ljava/util/concurrent/Executor;[Ljava/lang/Object;)Landroid/os/AsyncTask;

    .line 91
    :cond_0
    :goto_1
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 104
    :cond_1
    new-instance v8, Lcom/belkin/wemo/cache/cloud/CloudRequestGetLEDGroupIcon$IconDownloader;

    const/4 v9, 0x0

    invoke-direct {v8, p0, v9}, Lcom/belkin/wemo/cache/cloud/CloudRequestGetLEDGroupIcon$IconDownloader;-><init>(Lcom/belkin/wemo/cache/cloud/CloudRequestGetLEDGroupIcon;Lcom/belkin/wemo/cache/cloud/CloudRequestGetLEDGroupIcon$1;)V

    const/4 v9, 0x3

    new-array v9, v9, [Ljava/lang/Object;

    const/4 v10, 0x0

    aput-object v4, v9, v10

    const/4 v10, 0x1

    iget-object v11, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestGetLEDGroupIcon;->mDeviceID:Ljava/lang/String;

    aput-object v11, v9, v10

    const/4 v10, 0x2

    aput-object v7, v9, v10

    invoke-virtual {v8, v9}, Lcom/belkin/wemo/cache/cloud/CloudRequestGetLEDGroupIcon$IconDownloader;->execute([Ljava/lang/Object;)Landroid/os/AsyncTask;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_1

    .line 114
    .end local v0    # "doc":Lorg/w3c/dom/Document;
    .end local v1    # "e":Lorg/w3c/dom/Element;
    .end local v3    # "i":I
    .end local v4    # "iconUrl":Ljava/lang/String;
    .end local v5    # "nl":Lorg/w3c/dom/NodeList;
    .end local v6    # "parser":Lcom/belkin/wemo/cache/cloud/XMLParser;
    .end local v7    # "uploadID":Ljava/lang/String;
    :catch_0
    move-exception v2

    .line 115
    .local v2, "ex":Ljava/lang/Exception;
    const-string v8, "SDK_CloudRequestGetLEDGroupIcon"

    const-string v9, "Exception while getting LED icon"

    invoke-static {v8, v9, v2}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Exception;)V

    .line 116
    const/4 v8, 0x0

    .end local v2    # "ex":Ljava/lang/Exception;
    :goto_2
    return v8

    .line 112
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
    .line 166
    const/4 v0, 0x0

    return-object v0
.end method

.method public getBody()Ljava/lang/String;
    .locals 1

    .prologue
    .line 63
    const-string v0, ""

    return-object v0
.end method

.method public getFileByteArray()[B
    .locals 1

    .prologue
    .line 153
    const/4 v0, 0x0

    return-object v0
.end method

.method public getRequestMethod()I
    .locals 1

    .prologue
    .line 43
    const/4 v0, 0x2

    return v0
.end method

.method public getTimeout()I
    .locals 1

    .prologue
    .line 48
    iget v0, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestGetLEDGroupIcon;->TIMEOUT:I

    return v0
.end method

.method public getTimeoutLimit()I
    .locals 1

    .prologue
    .line 53
    const v0, 0x3a980

    return v0
.end method

.method public getURL()Ljava/lang/String;
    .locals 1

    .prologue
    .line 58
    iget-object v0, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestGetLEDGroupIcon;->cloudURL:Ljava/lang/String;

    return-object v0
.end method

.method public getUploadFileName()Ljava/lang/String;
    .locals 1

    .prologue
    .line 158
    const/4 v0, 0x0

    return-object v0
.end method

.method public isAuthHeaderRequired()Z
    .locals 1

    .prologue
    .line 162
    const/4 v0, 0x1

    return v0
.end method

.method public requestComplete(ZI[B)V
    .locals 6
    .param p1, "success"    # Z
    .param p2, "statusCode"    # I
    .param p3, "resp"    # [B

    .prologue
    .line 68
    if-eqz p1, :cond_0

    .line 69
    const-string v1, ""

    .line 72
    .local v1, "response":Ljava/lang/String;
    :try_start_0
    new-instance v2, Ljava/lang/String;

    const-string v3, "UTF-8"

    invoke-direct {v2, p3, v3}, Ljava/lang/String;-><init>([BLjava/lang/String;)V
    :try_end_0
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_0 .. :try_end_0} :catch_0

    .line 74
    .end local v1    # "response":Ljava/lang/String;
    .local v2, "response":Ljava/lang/String;
    :try_start_1
    const-string v3, "SDK_CloudRequestGetLEDGroupIcon"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "LED ICONINFO: CloudRequestGetLEDGroupIcon response: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 76
    invoke-direct {p0, v2}, Lcom/belkin/wemo/cache/cloud/CloudRequestGetLEDGroupIcon;->parseResponse(Ljava/lang/String;)Z
    :try_end_1
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_1 .. :try_end_1} :catch_1

    .line 83
    .end local v2    # "response":Ljava/lang/String;
    :cond_0
    :goto_0
    return-void

    .line 78
    .restart local v1    # "response":Ljava/lang/String;
    :catch_0
    move-exception v0

    .line 79
    .local v0, "e":Ljava/io/UnsupportedEncodingException;
    :goto_1
    const-string v3, "SDK_CloudRequestGetLEDGroupIcon"

    const-string v4, "UnsupportedEncodingException while getting LED icon"

    invoke-static {v3, v4, v0}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Exception;)V

    goto :goto_0

    .line 78
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
