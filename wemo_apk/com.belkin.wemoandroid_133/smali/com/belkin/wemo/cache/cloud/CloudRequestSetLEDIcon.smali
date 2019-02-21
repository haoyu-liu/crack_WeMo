.class public Lcom/belkin/wemo/cache/cloud/CloudRequestSetLEDIcon;
.super Lcom/belkin/wemo/cache/cloud/AbstractMultipartCloudRequest;
.source "CloudRequestSetLEDIcon.java"


# static fields
.field private static final KEY_UPLOAD_ID_TAG:Ljava/lang/String; = "uploadId"

.field private static final KEY_UPLOAD_TAG:Ljava/lang/String; = "upload"


# instance fields
.field protected final QUERY_KEY:Ljava/lang/String;

.field private final TAG:Ljava/lang/String;

.field private TIMEOUT:I

.field private final TIMEOUT_LIMIT:I

.field private final URL:Ljava/lang/String;

.field private body:[B

.field private cloudURL:Ljava/lang/String;

.field protected context:Landroid/content/Context;

.field protected iconLocation:Ljava/lang/String;

.field protected udn:Ljava/lang/String;

.field protected uploadIdFromCloud:Ljava/lang/String;


# direct methods
.method public constructor <init>(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)V
    .locals 2
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "udn"    # Ljava/lang/String;
    .param p3, "iconLocation"    # Ljava/lang/String;

    .prologue
    const v1, 0xea60

    .line 40
    invoke-direct {p0}, Lcom/belkin/wemo/cache/cloud/AbstractMultipartCloudRequest;-><init>()V

    .line 26
    const-class v0, Lcom/belkin/wemo/cache/cloud/CloudRequestSetLEDIcon;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestSetLEDIcon;->TAG:Ljava/lang/String;

    .line 29
    iput v1, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestSetLEDIcon;->TIMEOUT_LIMIT:I

    .line 31
    iput v1, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestSetLEDIcon;->TIMEOUT:I

    .line 37
    const-string v0, "?uploadType="

    iput-object v0, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestSetLEDIcon;->QUERY_KEY:Ljava/lang/String;

    .line 38
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

    iput-object v0, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestSetLEDIcon;->URL:Ljava/lang/String;

    .line 41
    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    iput-object v0, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestSetLEDIcon;->context:Landroid/content/Context;

    .line 42
    iput-object p2, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestSetLEDIcon;->udn:Ljava/lang/String;

    .line 43
    iput-object p3, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestSetLEDIcon;->iconLocation:Ljava/lang/String;

    .line 44
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v1, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestSetLEDIcon;->URL:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {p0}, Lcom/belkin/wemo/cache/cloud/CloudRequestSetLEDIcon;->getURLSuffix()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestSetLEDIcon;->cloudURL:Ljava/lang/String;

    .line 45
    invoke-direct {p0}, Lcom/belkin/wemo/cache/cloud/CloudRequestSetLEDIcon;->buildBody()[B

    move-result-object v0

    iput-object v0, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestSetLEDIcon;->body:[B

    .line 46
    return-void
.end method

.method private buildBody()[B
    .locals 11

    .prologue
    .line 143
    new-instance v0, Ljava/io/ByteArrayOutputStream;

    invoke-direct {v0}, Ljava/io/ByteArrayOutputStream;-><init>()V

    .line 144
    .local v0, "bos":Ljava/io/ByteArrayOutputStream;
    new-instance v5, Ljava/io/DataOutputStream;

    invoke-direct {v5, v0}, Ljava/io/DataOutputStream;-><init>(Ljava/io/OutputStream;)V

    .line 146
    .local v5, "dos":Ljava/io/DataOutputStream;
    :try_start_0
    const-string v9, "--MULTIPART-FORM-DATA-BOUNDARY\r\n"

    invoke-virtual {v5, v9}, Ljava/io/DataOutputStream;->writeBytes(Ljava/lang/String;)V

    .line 147
    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "Content-Disposition: form-data; name=\"uploaded_icon\"; filename=\""

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    iget-object v10, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestSetLEDIcon;->iconLocation:Ljava/lang/String;

    invoke-static {v10}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v10

    invoke-virtual {v10}, Landroid/net/Uri;->getLastPathSegment()Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    const-string v10, "\""

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    const-string v10, "\r\n"

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v5, v9}, Ljava/io/DataOutputStream;->writeBytes(Ljava/lang/String;)V

    .line 149
    const-string v9, "Content-Type: image/jpeg\r\n"

    invoke-virtual {v5, v9}, Ljava/io/DataOutputStream;->writeBytes(Ljava/lang/String;)V

    .line 150
    const-string v9, "\r\n"

    invoke-virtual {v5, v9}, Ljava/io/DataOutputStream;->writeBytes(Ljava/lang/String;)V

    .line 152
    new-instance v7, Ljava/io/ByteArrayInputStream;

    iget-object v9, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestSetLEDIcon;->iconLocation:Ljava/lang/String;

    invoke-static {v9}, Lcom/belkin/wemo/cache/utils/UploadFileUtil;->readFile(Ljava/lang/String;)[B

    move-result-object v9

    invoke-direct {v7, v9}, Ljava/io/ByteArrayInputStream;-><init>([B)V

    .line 153
    .local v7, "fileInputStream":Ljava/io/ByteArrayInputStream;
    invoke-virtual {v7}, Ljava/io/ByteArrayInputStream;->available()I

    move-result v3

    .line 155
    .local v3, "bytesAvailable":I
    const/high16 v8, 0x100000

    .line 156
    .local v8, "maxBufferSize":I
    invoke-static {v3, v8}, Ljava/lang/Math;->min(II)I

    move-result v2

    .line 157
    .local v2, "bufferSize":I
    new-array v1, v2, [B

    .line 160
    .local v1, "buffer":[B
    const/4 v9, 0x0

    invoke-virtual {v7, v1, v9, v2}, Ljava/io/ByteArrayInputStream;->read([BII)I

    move-result v4

    .line 162
    .local v4, "bytesRead":I
    :goto_0
    if-lez v4, :cond_0

    .line 163
    const/4 v9, 0x0

    invoke-virtual {v5, v1, v9, v2}, Ljava/io/DataOutputStream;->write([BII)V

    .line 164
    invoke-virtual {v7}, Ljava/io/ByteArrayInputStream;->available()I

    move-result v3

    .line 165
    invoke-static {v3, v8}, Ljava/lang/Math;->min(II)I

    move-result v2

    .line 166
    const/4 v9, 0x0

    invoke-virtual {v7, v1, v9, v2}, Ljava/io/ByteArrayInputStream;->read([BII)I

    move-result v4

    goto :goto_0

    .line 168
    :cond_0
    const-string v9, "\r\n"

    invoke-virtual {v5, v9}, Ljava/io/DataOutputStream;->writeBytes(Ljava/lang/String;)V

    .line 169
    const-string v9, "--MULTIPART-FORM-DATA-BOUNDARY--\r\n"

    invoke-virtual {v5, v9}, Ljava/io/DataOutputStream;->writeBytes(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 173
    .end local v1    # "buffer":[B
    .end local v2    # "bufferSize":I
    .end local v3    # "bytesAvailable":I
    .end local v4    # "bytesRead":I
    .end local v7    # "fileInputStream":Ljava/io/ByteArrayInputStream;
    .end local v8    # "maxBufferSize":I
    :goto_1
    invoke-virtual {v0}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    move-result-object v9

    return-object v9

    .line 170
    :catch_0
    move-exception v6

    .line 171
    .local v6, "e":Ljava/io/IOException;
    invoke-virtual {v6}, Ljava/io/IOException;->printStackTrace()V

    goto :goto_1
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
    .line 196
    const/4 v0, 0x0

    return-object v0
.end method

.method public getBody()Ljava/lang/String;
    .locals 1

    .prologue
    .line 70
    const-string v0, ""

    return-object v0
.end method

.method public getContentType()Ljava/lang/String;
    .locals 1

    .prologue
    .line 139
    const-string v0, "multipart/form-data; boundary=MULTIPART-FORM-DATA-BOUNDARY"

    return-object v0
.end method

.method public getFileByteArray()[B
    .locals 1

    .prologue
    .line 75
    iget-object v0, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestSetLEDIcon;->body:[B

    return-object v0
.end method

.method public getRequestMethod()I
    .locals 1

    .prologue
    .line 50
    const/4 v0, 0x1

    return v0
.end method

.method public getTimeout()I
    .locals 1

    .prologue
    .line 55
    iget v0, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestSetLEDIcon;->TIMEOUT:I

    return v0
.end method

.method public getTimeoutLimit()I
    .locals 1

    .prologue
    .line 60
    const v0, 0xea60

    return v0
.end method

.method public getURL()Ljava/lang/String;
    .locals 1

    .prologue
    .line 65
    iget-object v0, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestSetLEDIcon;->cloudURL:Ljava/lang/String;

    return-object v0
.end method

.method protected getURLSuffix()Ljava/lang/String;
    .locals 1

    .prologue
    .line 191
    const-string v0, "?uploadType=WEMO_DEVICE_ICON"

    return-object v0
.end method

.method public getUploadFileName()Ljava/lang/String;
    .locals 1

    .prologue
    .line 80
    const/4 v0, 0x0

    return-object v0
.end method

.method public isAuthHeaderRequired()Z
    .locals 1

    .prologue
    .line 85
    const/4 v0, 0x1

    return v0
.end method

.method protected parseResponse(Ljava/lang/String;)Z
    .locals 7
    .param p1, "response"    # Ljava/lang/String;

    .prologue
    const/4 v4, 0x0

    .line 178
    :try_start_0
    new-instance v3, Lcom/belkin/wemo/cache/cloud/XMLParser;

    invoke-direct {v3}, Lcom/belkin/wemo/cache/cloud/XMLParser;-><init>()V

    .line 179
    .local v3, "parser":Lcom/belkin/wemo/cache/cloud/XMLParser;
    invoke-virtual {v3, p1}, Lcom/belkin/wemo/cache/cloud/XMLParser;->getDomElement(Ljava/lang/String;)Lorg/w3c/dom/Document;

    move-result-object v0

    .line 180
    .local v0, "doc":Lorg/w3c/dom/Document;
    const-string v5, "upload"

    invoke-interface {v0, v5}, Lorg/w3c/dom/Document;->getElementsByTagName(Ljava/lang/String;)Lorg/w3c/dom/NodeList;

    move-result-object v2

    .line 181
    .local v2, "nl":Lorg/w3c/dom/NodeList;
    const/4 v5, 0x0

    invoke-interface {v2, v5}, Lorg/w3c/dom/NodeList;->item(I)Lorg/w3c/dom/Node;

    move-result-object v1

    check-cast v1, Lorg/w3c/dom/Element;

    .line 182
    .local v1, "e":Lorg/w3c/dom/Element;
    const-string v5, "uploadId"

    invoke-virtual {v3, v1, v5}, Lcom/belkin/wemo/cache/cloud/XMLParser;->getValue(Lorg/w3c/dom/Element;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    iput-object v5, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestSetLEDIcon;->uploadIdFromCloud:Ljava/lang/String;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 183
    const/4 v4, 0x1

    .line 186
    .end local v0    # "doc":Lorg/w3c/dom/Document;
    .end local v1    # "e":Lorg/w3c/dom/Element;
    .end local v2    # "nl":Lorg/w3c/dom/NodeList;
    .end local v3    # "parser":Lcom/belkin/wemo/cache/cloud/XMLParser;
    :goto_0
    return v4

    .line 184
    :catch_0
    move-exception v1

    .line 185
    .local v1, "e":Ljava/lang/Exception;
    iget-object v5, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestSetLEDIcon;->TAG:Ljava/lang/String;

    const-string v6, "Exception while parsing xml response for set icon: "

    invoke-static {v5, v6, v1}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Exception;)V

    goto :goto_0
.end method

.method public requestComplete(ZI[B)V
    .locals 9
    .param p1, "success"    # Z
    .param p2, "statusCode"    # I
    .param p3, "response"    # [B

    .prologue
    .line 90
    iget-object v5, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestSetLEDIcon;->context:Landroid/content/Context;

    invoke-static {v5}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->getInstance(Landroid/content/Context;)Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    move-result-object v1

    .line 91
    .local v1, "deviceListManager":Lcom/belkin/wemo/cache/devicelist/DeviceListManager;
    iget-object v5, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestSetLEDIcon;->TAG:Ljava/lang/String;

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "requestComplete with success: "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, p1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, " statusCode: "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, " response: "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    new-instance v7, Ljava/lang/String;

    invoke-direct {v7, p3}, Ljava/lang/String;-><init>([B)V

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->debugLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 92
    if-eqz p1, :cond_6

    .line 94
    :try_start_0
    new-instance v4, Ljava/lang/String;

    const-string v5, "UTF-8"

    invoke-direct {v4, p3, v5}, Ljava/lang/String;-><init>([BLjava/lang/String;)V

    .line 95
    .local v4, "stringResponse":Ljava/lang/String;
    invoke-virtual {p0, v4}, Lcom/belkin/wemo/cache/cloud/CloudRequestSetLEDIcon;->parseResponse(Ljava/lang/String;)Z

    move-result v3

    .line 97
    .local v3, "responseParse":Z
    if-eqz v3, :cond_4

    .line 98
    invoke-virtual {v1}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->getDeviceInformationList()Ljava/util/Map;

    move-result-object v5

    iget-object v6, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestSetLEDIcon;->udn:Ljava/lang/String;

    invoke-interface {v5, v6}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/belkin/wemo/cache/data/DeviceInformation;

    .line 99
    .local v0, "deviceInfo":Lcom/belkin/wemo/cache/data/DeviceInformation;
    if-eqz v0, :cond_1

    .line 100
    iget-object v5, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestSetLEDIcon;->uploadIdFromCloud:Ljava/lang/String;

    invoke-virtual {v0, v5}, Lcom/belkin/wemo/cache/data/DeviceInformation;->setIconVersion(Ljava/lang/String;)V

    .line 101
    iget-object v5, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestSetLEDIcon;->iconLocation:Ljava/lang/String;

    invoke-virtual {v0, v5}, Lcom/belkin/wemo/cache/data/DeviceInformation;->setIcon(Ljava/lang/String;)V

    .line 102
    iget-object v5, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestSetLEDIcon;->context:Landroid/content/Context;

    invoke-static {v5}, Lcom/belkin/wemo/cache/data/DevicesArray;->getInstance(Landroid/content/Context;)Lcom/belkin/wemo/cache/data/DevicesArray;

    move-result-object v5

    invoke-virtual {v5, v0}, Lcom/belkin/wemo/cache/data/DevicesArray;->addOrUpdateDeviceInformation(Lcom/belkin/wemo/cache/data/DeviceInformation;)V

    .line 103
    iget-object v5, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestSetLEDIcon;->context:Landroid/content/Context;

    invoke-static {v5}, Lcom/belkin/wemo/cache/CacheManager;->getInstance(Landroid/content/Context;)Lcom/belkin/wemo/cache/CacheManager;

    move-result-object v5

    const/4 v6, 0x0

    const/4 v7, 0x0

    const/4 v8, 0x1

    invoke-virtual {v5, v0, v6, v7, v8}, Lcom/belkin/wemo/cache/CacheManager;->updateDB(Lcom/belkin/wemo/cache/data/DeviceInformation;ZZZ)V

    .line 105
    invoke-virtual {p0}, Lcom/belkin/wemo/cache/cloud/CloudRequestSetLEDIcon;->getOnCloudRequestCompletedListener()Lcom/belkin/wemo/cache/cloud/AbstractCloudRequest$OnCloudRequestCompleted;

    move-result-object v5

    if-eqz v5, :cond_0

    .line 106
    invoke-virtual {p0}, Lcom/belkin/wemo/cache/cloud/CloudRequestSetLEDIcon;->getOnCloudRequestCompletedListener()Lcom/belkin/wemo/cache/cloud/AbstractCloudRequest$OnCloudRequestCompleted;

    move-result-object v5

    invoke-interface {v5}, Lcom/belkin/wemo/cache/cloud/AbstractCloudRequest$OnCloudRequestCompleted;->onSuccess()V

    .line 108
    :cond_0
    const-string v5, "update"

    invoke-static {p1}, Ljava/lang/String;->valueOf(Z)Ljava/lang/String;

    move-result-object v6

    iget-object v7, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestSetLEDIcon;->udn:Ljava/lang/String;

    invoke-virtual {v1, v5, v6, v7}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->sendNotification(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 135
    .end local v0    # "deviceInfo":Lcom/belkin/wemo/cache/data/DeviceInformation;
    .end local v3    # "responseParse":Z
    .end local v4    # "stringResponse":Ljava/lang/String;
    :goto_0
    return-void

    .line 110
    .restart local v0    # "deviceInfo":Lcom/belkin/wemo/cache/data/DeviceInformation;
    .restart local v3    # "responseParse":Z
    .restart local v4    # "stringResponse":Ljava/lang/String;
    :cond_1
    invoke-virtual {p0}, Lcom/belkin/wemo/cache/cloud/CloudRequestSetLEDIcon;->getOnCloudRequestCompletedListener()Lcom/belkin/wemo/cache/cloud/AbstractCloudRequest$OnCloudRequestCompleted;

    move-result-object v5

    if-eqz v5, :cond_2

    .line 111
    invoke-virtual {p0}, Lcom/belkin/wemo/cache/cloud/CloudRequestSetLEDIcon;->getOnCloudRequestCompletedListener()Lcom/belkin/wemo/cache/cloud/AbstractCloudRequest$OnCloudRequestCompleted;

    move-result-object v5

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "DeviceInformation is null for udn of "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    iget-object v7, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestSetLEDIcon;->udn:Ljava/lang/String;

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-interface {v5, v6}, Lcom/belkin/wemo/cache/cloud/AbstractCloudRequest$OnCloudRequestCompleted;->onError(Ljava/lang/String;)V

    .line 113
    :cond_2
    const-string v5, "update"

    invoke-static {p1}, Ljava/lang/String;->valueOf(Z)Ljava/lang/String;

    move-result-object v6

    iget-object v7, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestSetLEDIcon;->udn:Ljava/lang/String;

    invoke-virtual {v1, v5, v6, v7}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->sendNotification(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 121
    .end local v0    # "deviceInfo":Lcom/belkin/wemo/cache/data/DeviceInformation;
    .end local v3    # "responseParse":Z
    .end local v4    # "stringResponse":Ljava/lang/String;
    :catch_0
    move-exception v2

    .line 122
    .local v2, "e":Ljava/io/UnsupportedEncodingException;
    iget-object v5, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestSetLEDIcon;->TAG:Ljava/lang/String;

    const-string v6, "UnsupportedEncodingException while parsing cloud response: "

    invoke-static {v5, v6, v2}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Exception;)V

    .line 123
    invoke-virtual {p0}, Lcom/belkin/wemo/cache/cloud/CloudRequestSetLEDIcon;->getOnCloudRequestCompletedListener()Lcom/belkin/wemo/cache/cloud/AbstractCloudRequest$OnCloudRequestCompleted;

    move-result-object v5

    if-eqz v5, :cond_3

    .line 124
    invoke-virtual {p0}, Lcom/belkin/wemo/cache/cloud/CloudRequestSetLEDIcon;->getOnCloudRequestCompletedListener()Lcom/belkin/wemo/cache/cloud/AbstractCloudRequest$OnCloudRequestCompleted;

    move-result-object v5

    invoke-virtual {v2}, Ljava/io/UnsupportedEncodingException;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-interface {v5, v6}, Lcom/belkin/wemo/cache/cloud/AbstractCloudRequest$OnCloudRequestCompleted;->onError(Ljava/lang/String;)V

    .line 126
    :cond_3
    const-string v5, "update"

    invoke-static {p1}, Ljava/lang/String;->valueOf(Z)Ljava/lang/String;

    move-result-object v6

    iget-object v7, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestSetLEDIcon;->udn:Ljava/lang/String;

    invoke-virtual {v1, v5, v6, v7}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->sendNotification(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    .line 116
    .end local v2    # "e":Ljava/io/UnsupportedEncodingException;
    .restart local v3    # "responseParse":Z
    .restart local v4    # "stringResponse":Ljava/lang/String;
    :cond_4
    :try_start_1
    invoke-virtual {p0}, Lcom/belkin/wemo/cache/cloud/CloudRequestSetLEDIcon;->getOnCloudRequestCompletedListener()Lcom/belkin/wemo/cache/cloud/AbstractCloudRequest$OnCloudRequestCompleted;

    move-result-object v5

    if-eqz v5, :cond_5

    .line 117
    invoke-virtual {p0}, Lcom/belkin/wemo/cache/cloud/CloudRequestSetLEDIcon;->getOnCloudRequestCompletedListener()Lcom/belkin/wemo/cache/cloud/AbstractCloudRequest$OnCloudRequestCompleted;

    move-result-object v5

    invoke-static {v3}, Ljava/lang/String;->valueOf(Z)Ljava/lang/String;

    move-result-object v6

    invoke-interface {v5, v6}, Lcom/belkin/wemo/cache/cloud/AbstractCloudRequest$OnCloudRequestCompleted;->onError(Ljava/lang/String;)V

    .line 119
    :cond_5
    const-string v5, "update"

    invoke-static {p1}, Ljava/lang/String;->valueOf(Z)Ljava/lang/String;

    move-result-object v6

    iget-object v7, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestSetLEDIcon;->udn:Ljava/lang/String;

    invoke-virtual {v1, v5, v6, v7}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->sendNotification(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    :try_end_1
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_0

    .line 130
    .end local v3    # "responseParse":Z
    .end local v4    # "stringResponse":Ljava/lang/String;
    :cond_6
    invoke-virtual {p0}, Lcom/belkin/wemo/cache/cloud/CloudRequestSetLEDIcon;->getOnCloudRequestCompletedListener()Lcom/belkin/wemo/cache/cloud/AbstractCloudRequest$OnCloudRequestCompleted;

    move-result-object v5

    if-eqz v5, :cond_7

    .line 131
    invoke-virtual {p0}, Lcom/belkin/wemo/cache/cloud/CloudRequestSetLEDIcon;->getOnCloudRequestCompletedListener()Lcom/belkin/wemo/cache/cloud/AbstractCloudRequest$OnCloudRequestCompleted;

    move-result-object v5

    invoke-static {p1}, Ljava/lang/String;->valueOf(Z)Ljava/lang/String;

    move-result-object v6

    invoke-interface {v5, v6}, Lcom/belkin/wemo/cache/cloud/AbstractCloudRequest$OnCloudRequestCompleted;->onError(Ljava/lang/String;)V

    .line 133
    :cond_7
    const-string v5, "update"

    invoke-static {p1}, Ljava/lang/String;->valueOf(Z)Ljava/lang/String;

    move-result-object v6

    iget-object v7, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestSetLEDIcon;->udn:Ljava/lang/String;

    invoke-virtual {v1, v5, v6, v7}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->sendNotification(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    goto/16 :goto_0
.end method
