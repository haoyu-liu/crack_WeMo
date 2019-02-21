.class public Lcom/belkin/cloud/CloudServices;
.super Ljava/lang/Object;
.source "CloudServices.java"


# static fields
.field public static final TAG:Ljava/lang/String; = "CloudServices"

.field private static final URL_GET_ICON:Ljava/lang/String; = "https://api.xbcs.net:8443/apis/http/plugin/ext/deviceIcon/"

.field private static final URL_INSIGHT_PARAMS:Ljava/lang/String; = "https://api.xbcs.net:8443/apis/http/plugin/insight/message/"

.field private static final URL_SET_ICON:Ljava/lang/String; = "https://api.xbcs.net:8443/apis/http/plugin/ext/deviceIcon/"

.field private static mCloudServicesInstance:Lcom/belkin/cloud/CloudServices;

.field private static urlRulesTng:Ljava/lang/String;

.field private static urlSerializationTracking:Ljava/lang/String;


# instance fields
.field private mClient:Lorg/apache/http/client/HttpClient;

.field private mContext:Landroid/content/Context;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 59
    const/4 v0, 0x0

    sput-object v0, Lcom/belkin/cloud/CloudServices;->mCloudServicesInstance:Lcom/belkin/cloud/CloudServices;

    .line 66
    const-string v0, "/apis/http/plugin/message/"

    sput-object v0, Lcom/belkin/cloud/CloudServices;->urlRulesTng:Ljava/lang/String;

    .line 68
    const-string v0, "/apis/http/device/retailerFilter"

    sput-object v0, Lcom/belkin/cloud/CloudServices;->urlSerializationTracking:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 72
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 69
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/belkin/cloud/CloudServices;->mClient:Lorg/apache/http/client/HttpClient;

    .line 73
    iput-object p1, p0, Lcom/belkin/cloud/CloudServices;->mContext:Landroid/content/Context;

    .line 74
    return-void
.end method

.method private buildCloudUrl(Ljava/lang/String;)Ljava/lang/String;
    .locals 3
    .param p1, "urlPrefix"    # Ljava/lang/String;

    .prologue
    .line 494
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "https://api.xbcs.net:8443"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 495
    .local v0, "finalUrl":Ljava/lang/String;
    return-object v0
.end method

.method private buildPost(Ljava/lang/String;Ljava/lang/String;)Lorg/apache/http/client/methods/HttpPost;
    .locals 3
    .param p1, "url"    # Ljava/lang/String;
    .param p2, "Auth"    # Ljava/lang/String;

    .prologue
    .line 418
    new-instance v0, Lorg/apache/http/client/methods/HttpPost;

    invoke-direct {v0, p1}, Lorg/apache/http/client/methods/HttpPost;-><init>(Ljava/lang/String;)V

    .line 419
    .local v0, "request":Lorg/apache/http/client/methods/HttpPost;
    const-string v1, "Authorization"

    invoke-virtual {v0, v1, p2}, Lorg/apache/http/client/methods/HttpPost;->setHeader(Ljava/lang/String;Ljava/lang/String;)V

    .line 420
    const-string v1, "Content-Type"

    const-string v2, "application/xml"

    invoke-virtual {v0, v1, v2}, Lorg/apache/http/client/methods/HttpPost;->setHeader(Ljava/lang/String;Ljava/lang/String;)V

    .line 422
    return-object v0
.end method

.method private ensureClient()V
    .locals 1

    .prologue
    .line 411
    iget-object v0, p0, Lcom/belkin/cloud/CloudServices;->mClient:Lorg/apache/http/client/HttpClient;

    if-nez v0, :cond_0

    .line 412
    iget-object v0, p0, Lcom/belkin/cloud/CloudServices;->mContext:Landroid/content/Context;

    invoke-static {v0}, Lcom/belkin/cloud/utils/HTTPUtils;->getCloudNewHttpClient(Landroid/content/Context;)Lorg/apache/http/client/HttpClient;

    move-result-object v0

    iput-object v0, p0, Lcom/belkin/cloud/CloudServices;->mClient:Lorg/apache/http/client/HttpClient;

    .line 414
    :cond_0
    return-void
.end method

.method private generateResetRequestNameIconRules(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 3
    .param p1, "mac"    # Ljava/lang/String;
    .param p2, "pluginID"    # Ljava/lang/String;

    .prologue
    .line 290
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "<plugins><plugin><recipientId>"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "</recipientId>"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "<macAddress>"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "</macAddress>"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "<content>"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "<![CDATA[<resetNameRulesData><plugin><macAddress>"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "</macAddress><resetType>1</resetType></plugin></resetNameRulesData>]]>"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "</content>"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "</plugin></plugins>"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 298
    .local v0, "xmlString":Ljava/lang/String;
    return-object v0
.end method

.method private generateXMLRequest(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 4
    .param p1, "xmlBody"    # Ljava/lang/String;
    .param p2, "pluginId"    # Ljava/lang/String;
    .param p3, "mac"    # Ljava/lang/String;

    .prologue
    .line 473
    const-string v1, "<!"

    const-string v2, "&lt;!"

    invoke-virtual {p1, v1, v2}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object p1

    .line 474
    const-string v1, "]>"

    const-string v2, "]&gt;"

    invoke-virtual {p1, v1, v2}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object p1

    .line 476
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "<plugins><plugin><recipientId>"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "</recipientId>"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "<macAddress>"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "</macAddress>"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "<content>"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "<![CDATA[ "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "<pluginId>"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "</pluginId>"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "<macAddress>"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "</macAddress>"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "<status>0</status>"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "]]>"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "</content>"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "</plugin></plugins>"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 489
    .local v0, "xmlString":Ljava/lang/String;
    const-string v1, "REMOTE"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "REQUEST: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 490
    return-object v0
.end method

.method private generateXMLSerTrackingRequest(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 4
    .param p1, "xmlBody"    # Ljava/lang/String;
    .param p2, "pluginId"    # Ljava/lang/String;
    .param p3, "mac"    # Ljava/lang/String;

    .prologue
    .line 499
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "<?xml version=\"1.0\" encoding=\"UTF-8\"?>"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 500
    .local v0, "xmlString":Ljava/lang/String;
    const-string v1, "REMOTE"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "REQUEST: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 501
    return-object v0
.end method

.method public static declared-synchronized getInstance(Landroid/content/Context;)Lcom/belkin/cloud/CloudServices;
    .locals 2
    .param p0, "context"    # Landroid/content/Context;

    .prologue
    .line 77
    const-class v1, Lcom/belkin/cloud/CloudServices;

    monitor-enter v1

    :try_start_0
    sget-object v0, Lcom/belkin/cloud/CloudServices;->mCloudServicesInstance:Lcom/belkin/cloud/CloudServices;

    if-nez v0, :cond_0

    .line 78
    new-instance v0, Lcom/belkin/cloud/CloudServices;

    invoke-direct {v0, p0}, Lcom/belkin/cloud/CloudServices;-><init>(Landroid/content/Context;)V

    sput-object v0, Lcom/belkin/cloud/CloudServices;->mCloudServicesInstance:Lcom/belkin/cloud/CloudServices;

    .line 80
    :cond_0
    sget-object v0, Lcom/belkin/cloud/CloudServices;->mCloudServicesInstance:Lcom/belkin/cloud/CloudServices;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit v1

    return-object v0

    .line 77
    :catchall_0
    move-exception v0

    monitor-exit v1

    throw v0
.end method

.method private getResponseString(Lorg/apache/http/HttpResponse;)Ljava/lang/String;
    .locals 11
    .param p1, "response"    # Lorg/apache/http/HttpResponse;

    .prologue
    .line 426
    const/4 v6, 0x0

    .line 428
    .local v6, "is":Ljava/io/InputStream;
    const/4 v4, 0x0

    .line 429
    .local v4, "bytesRead":I
    const/16 v1, 0x400

    .line 430
    .local v1, "bufferSize":I
    const/4 v0, 0x0

    .line 432
    .local v0, "buffer":[B
    const/4 v2, 0x0

    .line 433
    .local v2, "byteStream":Ljava/io/ByteArrayOutputStream;
    const/4 v8, 0x0

    .line 436
    .local v8, "xmlString":Ljava/lang/String;
    :try_start_0
    invoke-interface {p1}, Lorg/apache/http/HttpResponse;->getEntity()Lorg/apache/http/HttpEntity;

    move-result-object v9

    invoke-interface {v9}, Lorg/apache/http/HttpEntity;->getContent()Ljava/io/InputStream;

    move-result-object v6

    .line 438
    new-instance v3, Ljava/io/ByteArrayOutputStream;

    invoke-direct {v3}, Ljava/io/ByteArrayOutputStream;-><init>()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_2

    .line 439
    .end local v2    # "byteStream":Ljava/io/ByteArrayOutputStream;
    .local v3, "byteStream":Ljava/io/ByteArrayOutputStream;
    :try_start_1
    new-array v0, v1, [B

    .line 441
    :goto_0
    invoke-virtual {v6, v0}, Ljava/io/InputStream;->read([B)I

    move-result v4

    const/4 v9, -0x1

    if-eq v4, v9, :cond_1

    .line 442
    const/4 v9, 0x0

    invoke-virtual {v3, v0, v9, v4}, Ljava/io/ByteArrayOutputStream;->write([BII)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_0

    .line 458
    :catch_0
    move-exception v5

    move-object v2, v3

    .line 459
    .end local v3    # "byteStream":Ljava/io/ByteArrayOutputStream;
    .restart local v2    # "byteStream":Ljava/io/ByteArrayOutputStream;
    .local v5, "e":Ljava/lang/Exception;
    :goto_1
    const/4 v8, 0x0

    .line 462
    .end local v5    # "e":Ljava/lang/Exception;
    :goto_2
    if-eqz v6, :cond_0

    .line 464
    :try_start_2
    invoke-virtual {v6}, Ljava/io/InputStream;->close()V
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_1

    .line 468
    :cond_0
    :goto_3
    return-object v8

    .line 446
    .end local v2    # "byteStream":Ljava/io/ByteArrayOutputStream;
    .restart local v3    # "byteStream":Ljava/io/ByteArrayOutputStream;
    :cond_1
    :try_start_3
    const-string v9, "UTF-8"

    invoke-static {v9}, Ljava/nio/charset/Charset;->forName(Ljava/lang/String;)Ljava/nio/charset/Charset;

    move-result-object v9

    invoke-virtual {v9}, Ljava/nio/charset/Charset;->newDecoder()Ljava/nio/charset/CharsetDecoder;

    move-result-object v7

    .line 447
    .local v7, "utf8Decoder":Ljava/nio/charset/CharsetDecoder;
    sget-object v9, Ljava/nio/charset/CodingErrorAction;->IGNORE:Ljava/nio/charset/CodingErrorAction;

    invoke-virtual {v7, v9}, Ljava/nio/charset/CharsetDecoder;->onMalformedInput(Ljava/nio/charset/CodingErrorAction;)Ljava/nio/charset/CharsetDecoder;

    .line 448
    sget-object v9, Ljava/nio/charset/CodingErrorAction;->IGNORE:Ljava/nio/charset/CodingErrorAction;

    invoke-virtual {v7, v9}, Ljava/nio/charset/CharsetDecoder;->onUnmappableCharacter(Ljava/nio/charset/CodingErrorAction;)Ljava/nio/charset/CharsetDecoder;

    .line 450
    invoke-virtual {v3}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    move-result-object v9

    invoke-static {v9}, Ljava/nio/ByteBuffer;->wrap([B)Ljava/nio/ByteBuffer;

    move-result-object v9

    invoke-virtual {v7, v9}, Ljava/nio/charset/CharsetDecoder;->decode(Ljava/nio/ByteBuffer;)Ljava/nio/CharBuffer;

    move-result-object v9

    invoke-virtual {v9}, Ljava/nio/CharBuffer;->toString()Ljava/lang/String;

    move-result-object v8

    .line 452
    const-string v9, "\r"

    const-string v10, ""

    invoke-virtual {v8, v9, v10}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v8

    .line 453
    const-string v9, "\n"

    const-string v10, ""

    invoke-virtual {v8, v9, v10}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v8

    .line 454
    const-string v9, "&lt;"

    const-string v10, "<"

    invoke-virtual {v8, v9, v10}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v8

    .line 455
    const-string v9, "&gt;"

    const-string v10, ">"

    invoke-virtual {v8, v9, v10}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v8

    .line 457
    invoke-virtual {v3}, Ljava/io/ByteArrayOutputStream;->close()V
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_0

    move-object v2, v3

    .line 460
    .end local v3    # "byteStream":Ljava/io/ByteArrayOutputStream;
    .restart local v2    # "byteStream":Ljava/io/ByteArrayOutputStream;
    goto :goto_2

    .line 465
    .end local v7    # "utf8Decoder":Ljava/nio/charset/CharsetDecoder;
    :catch_1
    move-exception v9

    goto :goto_3

    .line 458
    :catch_2
    move-exception v5

    goto :goto_1
.end method

.method private get_trust_mgr()[Ljavax/net/ssl/TrustManager;
    .locals 3

    .prologue
    .line 159
    const/4 v1, 0x1

    new-array v0, v1, [Ljavax/net/ssl/TrustManager;

    const/4 v1, 0x0

    new-instance v2, Lcom/belkin/cloud/CloudServices$1;

    invoke-direct {v2, p0}, Lcom/belkin/cloud/CloudServices$1;-><init>(Lcom/belkin/cloud/CloudServices;)V

    aput-object v2, v0, v1

    .line 176
    .local v0, "certs":[Ljavax/net/ssl/TrustManager;
    return-object v0
.end method

.method private makeRequest(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I
    .locals 10
    .param p1, "urlStr"    # Ljava/lang/String;
    .param p2, "data"    # Ljava/lang/String;
    .param p3, "authHeader"    # Ljava/lang/String;

    .prologue
    const/4 v4, 0x0

    .line 314
    const/4 v5, 0x0

    .line 316
    .local v5, "url":Ljava/net/URL;
    const/4 v7, 0x2

    :try_start_0
    invoke-virtual {p3, v7}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object p3

    .line 317
    new-instance v6, Ljava/net/URL;

    invoke-direct {v6, p1}, Ljava/net/URL;-><init>(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 319
    .end local v5    # "url":Ljava/net/URL;
    .local v6, "url":Ljava/net/URL;
    :try_start_1
    const-string v7, "TLS"

    invoke-static {v7}, Ljavax/net/ssl/SSLContext;->getInstance(Ljava/lang/String;)Ljavax/net/ssl/SSLContext;

    move-result-object v3

    .line 320
    .local v3, "sc":Ljavax/net/ssl/SSLContext;
    const/4 v7, 0x0

    const/4 v8, 0x0

    new-instance v9, Ljava/security/SecureRandom;

    invoke-direct {v9}, Ljava/security/SecureRandom;-><init>()V

    invoke-virtual {v3, v7, v8, v9}, Ljavax/net/ssl/SSLContext;->init([Ljavax/net/ssl/KeyManager;[Ljavax/net/ssl/TrustManager;Ljava/security/SecureRandom;)V

    .line 322
    invoke-virtual {v6}, Ljava/net/URL;->openConnection()Ljava/net/URLConnection;

    move-result-object v0

    check-cast v0, Ljavax/net/ssl/HttpsURLConnection;

    .line 323
    .local v0, "connection":Ljavax/net/ssl/HttpsURLConnection;
    invoke-virtual {v3}, Ljavax/net/ssl/SSLContext;->getSocketFactory()Ljavax/net/ssl/SSLSocketFactory;

    move-result-object v7

    invoke-virtual {v0, v7}, Ljavax/net/ssl/HttpsURLConnection;->setSSLSocketFactory(Ljavax/net/ssl/SSLSocketFactory;)V

    .line 324
    const-string v7, "Content-type"

    const-string v8, "application/xml"

    invoke-virtual {v0, v7, v8}, Ljavax/net/ssl/HttpsURLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 325
    const-string v7, "Authorization"

    invoke-virtual {v0, v7, p3}, Ljavax/net/ssl/HttpsURLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 326
    const/4 v7, 0x1

    invoke-virtual {v0, v7}, Ljavax/net/ssl/HttpsURLConnection;->setDoOutput(Z)V

    .line 327
    const/4 v7, 0x0

    invoke-virtual {v0, v7}, Ljavax/net/ssl/HttpsURLConnection;->setChunkedStreamingMode(I)V

    .line 328
    const-string v7, "POST"

    invoke-virtual {v0, v7}, Ljavax/net/ssl/HttpsURLConnection;->setRequestMethod(Ljava/lang/String;)V

    .line 330
    invoke-virtual {v0}, Ljavax/net/ssl/HttpsURLConnection;->getOutputStream()Ljava/io/OutputStream;

    move-result-object v2

    .line 331
    .local v2, "os":Ljava/io/OutputStream;
    invoke-virtual {p2}, Ljava/lang/String;->getBytes()[B

    move-result-object v7

    invoke-virtual {v2, v7}, Ljava/io/OutputStream;->write([B)V

    .line 332
    invoke-virtual {v2}, Ljava/io/OutputStream;->flush()V

    .line 333
    invoke-virtual {v2}, Ljava/io/OutputStream;->close()V

    .line 335
    invoke-virtual {v0}, Ljavax/net/ssl/HttpsURLConnection;->getResponseCode()I
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    move-result v4

    .local v4, "status":I
    move-object v5, v6

    .line 341
    .end local v0    # "connection":Ljavax/net/ssl/HttpsURLConnection;
    .end local v2    # "os":Ljava/io/OutputStream;
    .end local v3    # "sc":Ljavax/net/ssl/SSLContext;
    .end local v4    # "status":I
    .end local v6    # "url":Ljava/net/URL;
    .restart local v5    # "url":Ljava/net/URL;
    :goto_0
    return v4

    .line 337
    :catch_0
    move-exception v1

    .line 338
    .local v1, "e":Ljava/lang/Exception;
    :goto_1
    invoke-virtual {v1}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_0

    .line 337
    .end local v1    # "e":Ljava/lang/Exception;
    .end local v5    # "url":Ljava/net/URL;
    .restart local v6    # "url":Ljava/net/URL;
    :catch_1
    move-exception v1

    move-object v5, v6

    .end local v6    # "url":Ljava/net/URL;
    .restart local v5    # "url":Ljava/net/URL;
    goto :goto_1
.end method


# virtual methods
.method public getDeviceIconBase64(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 15
    .param p1, "mac"    # Ljava/lang/String;
    .param p2, "authHeader"    # Ljava/lang/String;

    .prologue
    .line 179
    const-string v8, ""

    .line 180
    .local v8, "result":Ljava/lang/String;
    const/4 v1, 0x0

    .line 182
    .local v1, "connection":Ljavax/net/ssl/HttpsURLConnection;
    :try_start_0
    new-instance v12, Ljava/net/URL;

    new-instance v13, Ljava/lang/StringBuilder;

    invoke-direct {v13}, Ljava/lang/StringBuilder;-><init>()V

    const-string v14, "https://api.xbcs.net:8443/apis/http/plugin/ext/deviceIcon/"

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    move-object/from16 v0, p1

    invoke-virtual {v13, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v13

    invoke-direct {v12, v13}, Ljava/net/URL;-><init>(Ljava/lang/String;)V

    .line 183
    .local v12, "url":Ljava/net/URL;
    const-string v13, "TLS"

    invoke-static {v13}, Ljavax/net/ssl/SSLContext;->getInstance(Ljava/lang/String;)Ljavax/net/ssl/SSLContext;

    move-result-object v9

    .line 184
    .local v9, "ssl_ctx":Ljavax/net/ssl/SSLContext;
    invoke-direct {p0}, Lcom/belkin/cloud/CloudServices;->get_trust_mgr()[Ljavax/net/ssl/TrustManager;

    move-result-object v11

    .line 185
    .local v11, "trust_mgr":[Ljavax/net/ssl/TrustManager;
    const/4 v13, 0x0

    new-instance v14, Ljava/security/SecureRandom;

    invoke-direct {v14}, Ljava/security/SecureRandom;-><init>()V

    invoke-virtual {v9, v13, v11, v14}, Ljavax/net/ssl/SSLContext;->init([Ljavax/net/ssl/KeyManager;[Ljavax/net/ssl/TrustManager;Ljava/security/SecureRandom;)V

    .line 188
    invoke-virtual {v9}, Ljavax/net/ssl/SSLContext;->getSocketFactory()Ljavax/net/ssl/SSLSocketFactory;

    move-result-object v13

    invoke-static {v13}, Ljavax/net/ssl/HttpsURLConnection;->setDefaultSSLSocketFactory(Ljavax/net/ssl/SSLSocketFactory;)V

    .line 191
    invoke-virtual {v12}, Ljava/net/URL;->getHost()Ljava/lang/String;

    move-result-object v4

    .line 192
    .local v4, "hostName":Ljava/lang/String;
    invoke-virtual {v12}, Ljava/net/URL;->openConnection()Ljava/net/URLConnection;

    move-result-object v13

    move-object v0, v13

    check-cast v0, Ljavax/net/ssl/HttpsURLConnection;

    move-object v1, v0

    .line 193
    const-string v13, "GET"

    invoke-virtual {v1, v13}, Ljavax/net/ssl/HttpsURLConnection;->setRequestMethod(Ljava/lang/String;)V

    .line 196
    new-instance v13, Lcom/belkin/cloud/CloudServices$2;

    invoke-direct {v13, p0, v4}, Lcom/belkin/cloud/CloudServices$2;-><init>(Lcom/belkin/cloud/CloudServices;Ljava/lang/String;)V

    invoke-virtual {v1, v13}, Ljavax/net/ssl/HttpsURLConnection;->setHostnameVerifier(Ljavax/net/ssl/HostnameVerifier;)V

    .line 202
    const-string v13, "Content-type"

    const-string v14, "application/xml"

    invoke-virtual {v1, v13, v14}, Ljavax/net/ssl/HttpsURLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 203
    const-string v13, "Authorization"

    move-object/from16 v0, p2

    invoke-virtual {v1, v13, v0}, Ljavax/net/ssl/HttpsURLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 204
    const/4 v13, 0x1

    invoke-virtual {v1, v13}, Ljavax/net/ssl/HttpsURLConnection;->setDoOutput(Z)V

    .line 206
    invoke-virtual {v1}, Ljavax/net/ssl/HttpsURLConnection;->getResponseCode()I

    move-result v10

    .line 208
    .local v10, "status":I
    const/16 v13, 0xc8

    if-ne v10, v13, :cond_1

    .line 209
    invoke-virtual {v1}, Ljavax/net/ssl/HttpsURLConnection;->getContentLength()I

    move-result v13

    new-array v2, v13, [B

    .line 210
    .local v2, "dataBuf":[B
    new-instance v6, Ljava/io/BufferedInputStream;

    invoke-virtual {v1}, Ljavax/net/ssl/HttpsURLConnection;->getInputStream()Ljava/io/InputStream;

    move-result-object v13

    invoke-direct {v6, v13}, Ljava/io/BufferedInputStream;-><init>(Ljava/io/InputStream;)V

    .line 211
    .local v6, "in":Ljava/io/BufferedInputStream;
    const/4 v7, 0x0

    .line 212
    .local v7, "j":I
    :goto_0
    invoke-virtual {v6}, Ljava/io/BufferedInputStream;->read()I

    move-result v5

    .local v5, "i":I
    const/4 v13, -0x1

    if-eq v5, v13, :cond_0

    .line 213
    int-to-byte v13, v5

    aput-byte v13, v2, v7

    .line 214
    add-int/lit8 v7, v7, 0x1

    goto :goto_0

    .line 217
    :cond_0
    invoke-virtual {v6}, Ljava/io/BufferedInputStream;->close()V

    .line 219
    const/4 v13, 0x2

    invoke-static {v2, v13}, Landroid/util/Base64;->encodeToString([BI)Ljava/lang/String;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result-object v8

    .line 226
    .end local v2    # "dataBuf":[B
    .end local v5    # "i":I
    .end local v6    # "in":Ljava/io/BufferedInputStream;
    .end local v7    # "j":I
    :cond_1
    if-eqz v1, :cond_2

    .line 227
    invoke-virtual {v1}, Ljavax/net/ssl/HttpsURLConnection;->disconnect()V

    .line 230
    .end local v4    # "hostName":Ljava/lang/String;
    .end local v9    # "ssl_ctx":Ljavax/net/ssl/SSLContext;
    .end local v10    # "status":I
    .end local v11    # "trust_mgr":[Ljavax/net/ssl/TrustManager;
    .end local v12    # "url":Ljava/net/URL;
    :cond_2
    :goto_1
    return-object v8

    .line 222
    :catch_0
    move-exception v3

    .line 223
    .local v3, "e":Ljava/lang/Exception;
    :try_start_1
    invoke-virtual {v3}, Ljava/lang/Exception;->printStackTrace()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 226
    if-eqz v1, :cond_2

    .line 227
    invoke-virtual {v1}, Ljavax/net/ssl/HttpsURLConnection;->disconnect()V

    goto :goto_1

    .line 226
    .end local v3    # "e":Ljava/lang/Exception;
    :catchall_0
    move-exception v13

    if-eqz v1, :cond_3

    .line 227
    invoke-virtual {v1}, Ljavax/net/ssl/HttpsURLConnection;->disconnect()V

    :cond_3
    throw v13
.end method

.method public getDeviceIconFromCloudURL(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 24
    .param p1, "mac"    # Ljava/lang/String;
    .param p2, "version"    # Ljava/lang/String;
    .param p3, "serialNumber"    # Ljava/lang/String;
    .param p4, "authHeader"    # Ljava/lang/String;

    .prologue
    .line 234
    const-string v18, ""

    .line 237
    .local v18, "result":Ljava/lang/String;
    :try_start_0
    new-instance v4, Lorg/apache/http/impl/client/DefaultHttpClient;

    invoke-direct {v4}, Lorg/apache/http/impl/client/DefaultHttpClient;-><init>()V

    .line 239
    .local v4, "client":Lorg/apache/http/client/HttpClient;
    new-instance v15, Lorg/apache/http/conn/scheme/SchemeRegistry;

    invoke-direct {v15}, Lorg/apache/http/conn/scheme/SchemeRegistry;-><init>()V

    .line 241
    .local v15, "registry":Lorg/apache/http/conn/scheme/SchemeRegistry;
    invoke-static {}, Lorg/apache/http/conn/ssl/SSLSocketFactory;->getSocketFactory()Lorg/apache/http/conn/ssl/SSLSocketFactory;

    move-result-object v19

    .line 243
    .local v19, "socketFactory":Lorg/apache/http/conn/ssl/SSLSocketFactory;
    invoke-static {}, Lcom/belkin/wemo/cache/utils/Constants;->isStaging()Z

    move-result v21

    if-eqz v21, :cond_0

    .line 244
    sget-object v9, Lorg/apache/http/conn/ssl/SSLSocketFactory;->ALLOW_ALL_HOSTNAME_VERIFIER:Lorg/apache/http/conn/ssl/X509HostnameVerifier;

    .line 245
    .local v9, "hostnameVerifier":Ljavax/net/ssl/HostnameVerifier;
    move-object v0, v9

    check-cast v0, Lorg/apache/http/conn/ssl/X509HostnameVerifier;

    move-object/from16 v21, v0

    move-object/from16 v0, v19

    move-object/from16 v1, v21

    invoke-virtual {v0, v1}, Lorg/apache/http/conn/ssl/SSLSocketFactory;->setHostnameVerifier(Lorg/apache/http/conn/ssl/X509HostnameVerifier;)V

    .line 246
    invoke-static {v9}, Ljavax/net/ssl/HttpsURLConnection;->setDefaultHostnameVerifier(Ljavax/net/ssl/HostnameVerifier;)V

    .line 249
    .end local v9    # "hostnameVerifier":Ljavax/net/ssl/HostnameVerifier;
    :cond_0
    new-instance v21, Lorg/apache/http/conn/scheme/Scheme;

    const-string v22, "https"

    const/16 v23, 0x20fb

    move-object/from16 v0, v21

    move-object/from16 v1, v22

    move-object/from16 v2, v19

    move/from16 v3, v23

    invoke-direct {v0, v1, v2, v3}, Lorg/apache/http/conn/scheme/Scheme;-><init>(Ljava/lang/String;Lorg/apache/http/conn/scheme/SocketFactory;I)V

    move-object/from16 v0, v21

    invoke-virtual {v15, v0}, Lorg/apache/http/conn/scheme/SchemeRegistry;->register(Lorg/apache/http/conn/scheme/Scheme;)Lorg/apache/http/conn/scheme/Scheme;

    .line 250
    new-instance v14, Lorg/apache/http/impl/conn/SingleClientConnManager;

    invoke-interface {v4}, Lorg/apache/http/client/HttpClient;->getParams()Lorg/apache/http/params/HttpParams;

    move-result-object v21

    move-object/from16 v0, v21

    invoke-direct {v14, v0, v15}, Lorg/apache/http/impl/conn/SingleClientConnManager;-><init>(Lorg/apache/http/params/HttpParams;Lorg/apache/http/conn/scheme/SchemeRegistry;)V

    .line 251
    .local v14, "mgr":Lorg/apache/http/impl/conn/SingleClientConnManager;
    new-instance v10, Lorg/apache/http/impl/client/DefaultHttpClient;

    invoke-interface {v4}, Lorg/apache/http/client/HttpClient;->getParams()Lorg/apache/http/params/HttpParams;

    move-result-object v21

    move-object/from16 v0, v21

    invoke-direct {v10, v14, v0}, Lorg/apache/http/impl/client/DefaultHttpClient;-><init>(Lorg/apache/http/conn/ClientConnectionManager;Lorg/apache/http/params/HttpParams;)V

    .line 253
    .local v10, "httpClient":Lorg/apache/http/impl/client/DefaultHttpClient;
    new-instance v16, Lorg/apache/http/client/methods/HttpGet;

    invoke-direct/range {v16 .. v16}, Lorg/apache/http/client/methods/HttpGet;-><init>()V

    .line 254
    .local v16, "request":Lorg/apache/http/client/methods/HttpGet;
    new-instance v21, Ljava/net/URI;

    new-instance v22, Ljava/lang/StringBuilder;

    invoke-direct/range {v22 .. v22}, Ljava/lang/StringBuilder;-><init>()V

    const-string v23, "https://api.xbcs.net:8443/apis/http/plugin/ext/deviceIcon/"

    invoke-virtual/range {v22 .. v23}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v22

    move-object/from16 v0, v22

    move-object/from16 v1, p1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v22

    invoke-virtual/range {v22 .. v22}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v22

    invoke-direct/range {v21 .. v22}, Ljava/net/URI;-><init>(Ljava/lang/String;)V

    move-object/from16 v0, v16

    move-object/from16 v1, v21

    invoke-virtual {v0, v1}, Lorg/apache/http/client/methods/HttpGet;->setURI(Ljava/net/URI;)V

    .line 255
    const-string v21, "content-type"

    const-string v22, "application/xml"

    move-object/from16 v0, v16

    move-object/from16 v1, v21

    move-object/from16 v2, v22

    invoke-virtual {v0, v1, v2}, Lorg/apache/http/client/methods/HttpGet;->addHeader(Ljava/lang/String;Ljava/lang/String;)V

    .line 256
    const-string v21, "Authorization"

    move-object/from16 v0, v16

    move-object/from16 v1, v21

    move-object/from16 v2, p4

    invoke-virtual {v0, v1, v2}, Lorg/apache/http/client/methods/HttpGet;->addHeader(Ljava/lang/String;Ljava/lang/String;)V

    .line 257
    const-string v21, "Accept"

    const-string v22, "application/xml"

    move-object/from16 v0, v16

    move-object/from16 v1, v21

    move-object/from16 v2, v22

    invoke-virtual {v0, v1, v2}, Lorg/apache/http/client/methods/HttpGet;->addHeader(Ljava/lang/String;Ljava/lang/String;)V

    .line 258
    move-object/from16 v0, v16

    invoke-virtual {v10, v0}, Lorg/apache/http/impl/client/DefaultHttpClient;->execute(Lorg/apache/http/client/methods/HttpUriRequest;)Lorg/apache/http/HttpResponse;

    move-result-object v17

    .line 259
    .local v17, "response":Lorg/apache/http/HttpResponse;
    invoke-interface/range {v17 .. v17}, Lorg/apache/http/HttpResponse;->getEntity()Lorg/apache/http/HttpEntity;

    move-result-object v21

    invoke-interface/range {v21 .. v21}, Lorg/apache/http/HttpEntity;->getContentLength()J

    move-result-wide v22

    move-wide/from16 v0, v22

    long-to-int v5, v0

    .line 260
    .local v5, "contentLen":I
    invoke-interface/range {v17 .. v17}, Lorg/apache/http/HttpResponse;->getStatusLine()Lorg/apache/http/StatusLine;

    move-result-object v21

    invoke-interface/range {v21 .. v21}, Lorg/apache/http/StatusLine;->getStatusCode()I

    move-result v20

    .line 261
    .local v20, "status":I
    sget-object v21, Ljava/lang/System;->out:Ljava/io/PrintStream;

    new-instance v22, Ljava/lang/StringBuilder;

    invoke-direct/range {v22 .. v22}, Ljava/lang/StringBuilder;-><init>()V

    const-string v23, "ACTION_GET_ICON_FROM_CLOUD contentLen:: "

    invoke-virtual/range {v22 .. v23}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v22

    move-object/from16 v0, v22

    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v22

    const-string v23, " mac: "

    invoke-virtual/range {v22 .. v23}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v22

    move-object/from16 v0, v22

    move-object/from16 v1, p1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v22

    const-string v23, " status:"

    invoke-virtual/range {v22 .. v23}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v22

    move-object/from16 v0, v22

    move/from16 v1, v20

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v22

    invoke-virtual/range {v22 .. v22}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v22

    invoke-virtual/range {v21 .. v22}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 263
    const/16 v21, 0xc8

    move/from16 v0, v20

    move/from16 v1, v21

    if-ne v0, v1, :cond_2

    .line 264
    new-array v6, v5, [B

    .line 265
    .local v6, "dataBuf":[B
    new-instance v12, Ljava/io/BufferedInputStream;

    invoke-interface/range {v17 .. v17}, Lorg/apache/http/HttpResponse;->getEntity()Lorg/apache/http/HttpEntity;

    move-result-object v21

    invoke-interface/range {v21 .. v21}, Lorg/apache/http/HttpEntity;->getContent()Ljava/io/InputStream;

    move-result-object v21

    move-object/from16 v0, v21

    invoke-direct {v12, v0}, Ljava/io/BufferedInputStream;-><init>(Ljava/io/InputStream;)V

    .line 266
    .local v12, "in":Ljava/io/BufferedInputStream;
    const/4 v13, 0x0

    .line 267
    .local v13, "j":I
    :goto_0
    invoke-virtual {v12}, Ljava/io/BufferedInputStream;->read()I

    move-result v11

    .local v11, "i":I
    const/16 v21, -0x1

    move/from16 v0, v21

    if-eq v11, v0, :cond_1

    .line 268
    int-to-byte v0, v11

    move/from16 v21, v0

    aput-byte v21, v6, v13

    .line 269
    add-int/lit8 v13, v13, 0x1

    goto :goto_0

    .line 271
    :cond_1
    invoke-virtual {v12}, Ljava/io/BufferedInputStream;->close()V

    .line 273
    new-array v7, v13, [B

    .line 274
    .local v7, "dataBuf1":[B
    const/16 v21, 0x0

    const/16 v22, 0x0

    move/from16 v0, v21

    move/from16 v1, v22

    invoke-static {v6, v0, v7, v1, v13}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 275
    sget-object v21, Ljava/lang/System;->out:Ljava/io/PrintStream;

    new-instance v22, Ljava/lang/StringBuilder;

    invoke-direct/range {v22 .. v22}, Ljava/lang/StringBuilder;-><init>()V

    const-string v23, "dataBuf1 length:: "

    invoke-virtual/range {v22 .. v23}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v22

    array-length v0, v7

    move/from16 v23, v0

    invoke-virtual/range {v22 .. v23}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v22

    const-string v23, " j: "

    invoke-virtual/range {v22 .. v23}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v22

    move-object/from16 v0, v22

    invoke-virtual {v0, v13}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v22

    invoke-virtual/range {v22 .. v22}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v22

    invoke-virtual/range {v21 .. v22}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 278
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/cloud/CloudServices;->mContext:Landroid/content/Context;

    move-object/from16 v21, v0

    invoke-static/range {v21 .. v21}, Lcom/belkin/wemo/storage/FileStorage;->getInstance(Landroid/content/Context;)Lcom/belkin/wemo/storage/FileStorage;

    move-result-object v21

    move-object/from16 v0, v21

    move-object/from16 v1, p2

    move-object/from16 v2, p3

    invoke-virtual {v0, v6, v1, v2}, Lcom/belkin/wemo/storage/FileStorage;->storeIcon([BLjava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v18

    .line 279
    const-string v21, "CloudServices"

    new-instance v22, Ljava/lang/StringBuilder;

    invoke-direct/range {v22 .. v22}, Ljava/lang/StringBuilder;-><init>()V

    const-string v23, "ACTION_GET_ICON_FROM_CLOUD: "

    invoke-virtual/range {v22 .. v23}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v22

    move-object/from16 v0, v22

    move-object/from16 v1, p1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v22

    const-string v23, " status: "

    invoke-virtual/range {v22 .. v23}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v22

    move-object/from16 v0, v22

    move/from16 v1, v20

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v22

    const-string v23, " result: "

    invoke-virtual/range {v22 .. v23}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v22

    move-object/from16 v0, v22

    move-object/from16 v1, v18

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v22

    invoke-virtual/range {v22 .. v22}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v22

    invoke-static/range {v21 .. v22}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 287
    .end local v4    # "client":Lorg/apache/http/client/HttpClient;
    .end local v5    # "contentLen":I
    .end local v6    # "dataBuf":[B
    .end local v7    # "dataBuf1":[B
    .end local v10    # "httpClient":Lorg/apache/http/impl/client/DefaultHttpClient;
    .end local v11    # "i":I
    .end local v12    # "in":Ljava/io/BufferedInputStream;
    .end local v13    # "j":I
    .end local v14    # "mgr":Lorg/apache/http/impl/conn/SingleClientConnManager;
    .end local v15    # "registry":Lorg/apache/http/conn/scheme/SchemeRegistry;
    .end local v16    # "request":Lorg/apache/http/client/methods/HttpGet;
    .end local v17    # "response":Lorg/apache/http/HttpResponse;
    .end local v19    # "socketFactory":Lorg/apache/http/conn/ssl/SSLSocketFactory;
    .end local v20    # "status":I
    :cond_2
    :goto_1
    return-object v18

    .line 282
    :catch_0
    move-exception v8

    .line 283
    .local v8, "e":Ljava/lang/Exception;
    :try_start_1
    const-string v21, "CloudServices"

    new-instance v22, Ljava/lang/StringBuilder;

    invoke-direct/range {v22 .. v22}, Ljava/lang/StringBuilder;-><init>()V

    const-string v23, "ACTION_GET_ICON_FROM_CLOUD exception: "

    invoke-virtual/range {v22 .. v23}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v22

    invoke-virtual {v8}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v23

    invoke-virtual/range {v22 .. v23}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v22

    const-string v23, " mac: "

    invoke-virtual/range {v22 .. v23}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v22

    move-object/from16 v0, v22

    move-object/from16 v1, p1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v22

    invoke-virtual/range {v22 .. v22}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v22

    invoke-static/range {v21 .. v22}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 284
    invoke-virtual {v8}, Ljava/lang/Exception;->printStackTrace()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_1

    .line 286
    .end local v8    # "e":Ljava/lang/Exception;
    :catchall_0
    move-exception v21

    throw v21
.end method

.method public getSerializationTracking(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 7
    .param p1, "xmlBody"    # Ljava/lang/String;
    .param p2, "authHeader"    # Ljava/lang/String;
    .param p3, "pluginId"    # Ljava/lang/String;
    .param p4, "mac"    # Ljava/lang/String;
    .param p5, "url"    # Ljava/lang/String;

    .prologue
    .line 399
    const-string v6, ""

    .line 400
    .local v6, "strResponse":Ljava/lang/String;
    const-string v5, ""

    .line 401
    .local v5, "urlRequestString":Ljava/lang/String;
    const-string v0, ""

    invoke-virtual {p5, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 402
    sget-object v0, Lcom/belkin/cloud/CloudServices;->urlSerializationTracking:Ljava/lang/String;

    invoke-direct {p0, v0}, Lcom/belkin/cloud/CloudServices;->buildCloudUrl(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    :goto_0
    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move-object v3, p3

    move-object v4, p4

    .line 406
    invoke-virtual/range {v0 .. v5}, Lcom/belkin/cloud/CloudServices;->sendRequestGeneric(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    .line 407
    return-object v6

    .line 404
    :cond_0
    move-object v5, p5

    goto :goto_0
.end method

.method public putDeviceIcon(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Z
    .locals 21
    .param p1, "mac"    # Ljava/lang/String;
    .param p2, "uri"    # Ljava/lang/String;
    .param p3, "authHeader"    # Ljava/lang/String;

    .prologue
    .line 84
    const/4 v12, 0x0

    .line 85
    .local v12, "result":Z
    new-instance v4, Landroid/graphics/BitmapFactory$Options;

    invoke-direct {v4}, Landroid/graphics/BitmapFactory$Options;-><init>()V

    .line 86
    .local v4, "bfo":Landroid/graphics/BitmapFactory$Options;
    const/16 v17, 0x1

    move/from16 v0, v17

    iput v0, v4, Landroid/graphics/BitmapFactory$Options;->inSampleSize:I

    .line 87
    const/16 v17, 0x0

    move/from16 v0, v17

    iput-boolean v0, v4, Landroid/graphics/BitmapFactory$Options;->inDither:Z

    .line 88
    const/4 v5, 0x0

    .line 89
    .local v5, "bitmap":Landroid/graphics/Bitmap;
    const/4 v11, 0x0

    .line 90
    .local v11, "os":Ljava/io/OutputStream;
    const/4 v8, 0x0

    .line 91
    .local v8, "connection":Ljavax/net/ssl/HttpsURLConnection;
    const/16 v17, 0x2

    move-object/from16 v0, p3

    move/from16 v1, v17

    invoke-virtual {v0, v1}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object p3

    .line 92
    const-string v3, "=======djfsdfjscvjsdvjsd2367213======"

    .line 96
    .local v3, "BOUNDARY":Ljava/lang/String;
    :try_start_0
    invoke-virtual/range {p2 .. p2}, Ljava/lang/String;->toString()Ljava/lang/String;

    move-result-object v17

    const-string v18, "file:///android_asset/"

    invoke-virtual/range {v17 .. v18}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v17

    if-eqz v17, :cond_0

    .line 97
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/cloud/CloudServices;->mContext:Landroid/content/Context;

    move-object/from16 v17, v0

    invoke-virtual/range {v17 .. v17}, Landroid/content/Context;->getAssets()Landroid/content/res/AssetManager;

    move-result-object v17

    invoke-virtual/range {p2 .. p2}, Ljava/lang/String;->toString()Ljava/lang/String;

    move-result-object v18

    const-string v19, "file:///android_asset/"

    const-string v20, ""

    invoke-virtual/range {v18 .. v20}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v18

    invoke-virtual/range {v17 .. v18}, Landroid/content/res/AssetManager;->open(Ljava/lang/String;)Ljava/io/InputStream;

    move-result-object v17

    const/16 v18, 0x0

    move-object/from16 v0, v17

    move-object/from16 v1, v18

    invoke-static {v0, v1, v4}, Landroid/graphics/BitmapFactory;->decodeStream(Ljava/io/InputStream;Landroid/graphics/Rect;Landroid/graphics/BitmapFactory$Options;)Landroid/graphics/Bitmap;

    move-result-object v5

    .line 102
    :goto_0
    new-instance v15, Ljava/net/URL;

    new-instance v17, Ljava/lang/StringBuilder;

    invoke-direct/range {v17 .. v17}, Ljava/lang/StringBuilder;-><init>()V

    const-string v18, "https://api.xbcs.net:8443/apis/http/plugin/ext/deviceIcon/"

    invoke-virtual/range {v17 .. v18}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v17

    move-object/from16 v0, v17

    move-object/from16 v1, p1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v17

    invoke-virtual/range {v17 .. v17}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v17

    move-object/from16 v0, v17

    invoke-direct {v15, v0}, Ljava/net/URL;-><init>(Ljava/lang/String;)V

    .line 104
    .local v15, "url":Ljava/net/URL;
    const-string v17, "TLS"

    invoke-static/range {v17 .. v17}, Ljavax/net/ssl/SSLContext;->getInstance(Ljava/lang/String;)Ljavax/net/ssl/SSLContext;

    move-result-object v13

    .line 105
    .local v13, "sc":Ljavax/net/ssl/SSLContext;
    const/16 v17, 0x0

    const/16 v18, 0x0

    new-instance v19, Ljava/security/SecureRandom;

    invoke-direct/range {v19 .. v19}, Ljava/security/SecureRandom;-><init>()V

    move-object/from16 v0, v17

    move-object/from16 v1, v18

    move-object/from16 v2, v19

    invoke-virtual {v13, v0, v1, v2}, Ljavax/net/ssl/SSLContext;->init([Ljavax/net/ssl/KeyManager;[Ljavax/net/ssl/TrustManager;Ljava/security/SecureRandom;)V

    .line 107
    invoke-virtual {v15}, Ljava/net/URL;->openConnection()Ljava/net/URLConnection;

    move-result-object v17

    move-object/from16 v0, v17

    check-cast v0, Ljavax/net/ssl/HttpsURLConnection;

    move-object v8, v0

    .line 108
    invoke-virtual {v13}, Ljavax/net/ssl/SSLContext;->getSocketFactory()Ljavax/net/ssl/SSLSocketFactory;

    move-result-object v17

    move-object/from16 v0, v17

    invoke-virtual {v8, v0}, Ljavax/net/ssl/HttpsURLConnection;->setSSLSocketFactory(Ljavax/net/ssl/SSLSocketFactory;)V

    .line 109
    const-string v17, "Authorization"

    move-object/from16 v0, v17

    move-object/from16 v1, p3

    invoke-virtual {v8, v0, v1}, Ljavax/net/ssl/HttpsURLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 110
    const-string v17, "Connection"

    const-string v18, "Keep-Alive"

    move-object/from16 v0, v17

    move-object/from16 v1, v18

    invoke-virtual {v8, v0, v1}, Ljavax/net/ssl/HttpsURLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 111
    const-string v17, "Content-Type"

    new-instance v18, Ljava/lang/StringBuilder;

    invoke-direct/range {v18 .. v18}, Ljava/lang/StringBuilder;-><init>()V

    const-string v19, "multipart/form-data;boundary="

    invoke-virtual/range {v18 .. v19}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v18

    move-object/from16 v0, v18

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v18

    invoke-virtual/range {v18 .. v18}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v18

    move-object/from16 v0, v17

    move-object/from16 v1, v18

    invoke-virtual {v8, v0, v1}, Ljavax/net/ssl/HttpsURLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 112
    const/16 v17, 0x1

    move/from16 v0, v17

    invoke-virtual {v8, v0}, Ljavax/net/ssl/HttpsURLConnection;->setDoOutput(Z)V

    .line 113
    const/16 v17, 0x0

    move/from16 v0, v17

    invoke-virtual {v8, v0}, Ljavax/net/ssl/HttpsURLConnection;->setChunkedStreamingMode(I)V

    .line 114
    const-string v17, "POST"

    move-object/from16 v0, v17

    invoke-virtual {v8, v0}, Ljavax/net/ssl/HttpsURLConnection;->setRequestMethod(Ljava/lang/String;)V

    .line 117
    invoke-virtual {v8}, Ljavax/net/ssl/HttpsURLConnection;->getOutputStream()Ljava/io/OutputStream;

    move-result-object v11

    .line 118
    new-instance v7, Ljava/io/BufferedOutputStream;

    invoke-direct {v7, v11}, Ljava/io/BufferedOutputStream;-><init>(Ljava/io/OutputStream;)V

    .line 119
    .local v7, "buf":Ljava/io/BufferedOutputStream;
    invoke-static {v5}, Lcom/belkin/utils/UploadFileUtil;->getByteArray(Landroid/graphics/Bitmap;)[B

    move-result-object v17

    move-object/from16 v0, v17

    invoke-virtual {v7, v0}, Ljava/io/BufferedOutputStream;->write([B)V

    .line 120
    invoke-virtual {v8}, Ljavax/net/ssl/HttpsURLConnection;->getResponseCode()I

    move-result v14

    .line 123
    .local v14, "status":I
    const/16 v17, 0xc8

    move/from16 v0, v17

    if-ne v14, v0, :cond_2

    .line 124
    new-instance v6, Ljava/io/BufferedReader;

    new-instance v17, Ljava/io/InputStreamReader;

    invoke-virtual {v8}, Ljavax/net/ssl/HttpsURLConnection;->getInputStream()Ljava/io/InputStream;

    move-result-object v18

    invoke-direct/range {v17 .. v18}, Ljava/io/InputStreamReader;-><init>(Ljava/io/InputStream;)V

    move-object/from16 v0, v17

    invoke-direct {v6, v0}, Ljava/io/BufferedReader;-><init>(Ljava/io/Reader;)V

    .line 127
    .local v6, "br":Ljava/io/BufferedReader;
    const-string v16, ""

    .line 128
    .local v16, "xmlStrigResp":Ljava/lang/String;
    :goto_1
    invoke-virtual {v6}, Ljava/io/BufferedReader;->readLine()Ljava/lang/String;

    move-result-object v10

    .local v10, "input":Ljava/lang/String;
    if-eqz v10, :cond_1

    .line 129
    new-instance v17, Ljava/lang/StringBuilder;

    invoke-direct/range {v17 .. v17}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, v17

    move-object/from16 v1, v16

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v17

    move-object/from16 v0, v17

    invoke-virtual {v0, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v17

    invoke-virtual/range {v17 .. v17}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v16

    goto :goto_1

    .line 99
    .end local v6    # "br":Ljava/io/BufferedReader;
    .end local v7    # "buf":Ljava/io/BufferedOutputStream;
    .end local v10    # "input":Ljava/lang/String;
    .end local v13    # "sc":Ljavax/net/ssl/SSLContext;
    .end local v14    # "status":I
    .end local v15    # "url":Ljava/net/URL;
    .end local v16    # "xmlStrigResp":Ljava/lang/String;
    :cond_0
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/cloud/CloudServices;->mContext:Landroid/content/Context;

    move-object/from16 v17, v0

    invoke-virtual/range {v17 .. v17}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v17

    invoke-static/range {p2 .. p2}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v18

    invoke-virtual/range {v17 .. v18}, Landroid/content/ContentResolver;->openInputStream(Landroid/net/Uri;)Ljava/io/InputStream;

    move-result-object v17

    const/16 v18, 0x0

    move-object/from16 v0, v17

    move-object/from16 v1, v18

    invoke-static {v0, v1, v4}, Landroid/graphics/BitmapFactory;->decodeStream(Ljava/io/InputStream;Landroid/graphics/Rect;Landroid/graphics/BitmapFactory$Options;)Landroid/graphics/Bitmap;

    move-result-object v5

    goto/16 :goto_0

    .line 131
    .restart local v6    # "br":Ljava/io/BufferedReader;
    .restart local v7    # "buf":Ljava/io/BufferedOutputStream;
    .restart local v10    # "input":Ljava/lang/String;
    .restart local v13    # "sc":Ljavax/net/ssl/SSLContext;
    .restart local v14    # "status":I
    .restart local v15    # "url":Ljava/net/URL;
    .restart local v16    # "xmlStrigResp":Ljava/lang/String;
    :cond_1
    invoke-virtual {v6}, Ljava/io/BufferedReader;->close()V

    .line 132
    const-string v17, "CloudServices"

    new-instance v18, Ljava/lang/StringBuilder;

    invoke-direct/range {v18 .. v18}, Ljava/lang/StringBuilder;-><init>()V

    const-string v19, "ACTION_SET_ICON_TO_CLOUD: XML RESULT "

    invoke-virtual/range {v18 .. v19}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v18

    move-object/from16 v0, v18

    move-object/from16 v1, v16

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v18

    const-string v19, " code: "

    invoke-virtual/range {v18 .. v19}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v18

    move-object/from16 v0, v18

    invoke-virtual {v0, v14}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v18

    invoke-virtual/range {v18 .. v18}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v18

    invoke-static/range {v17 .. v18}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 138
    .end local v6    # "br":Ljava/io/BufferedReader;
    .end local v10    # "input":Ljava/lang/String;
    .end local v16    # "xmlStrigResp":Ljava/lang/String;
    :cond_2
    invoke-virtual {v7}, Ljava/io/BufferedOutputStream;->flush()V

    .line 139
    invoke-virtual {v11}, Ljava/io/OutputStream;->flush()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 143
    if-eqz v8, :cond_3

    .line 144
    invoke-virtual {v8}, Ljavax/net/ssl/HttpsURLConnection;->disconnect()V

    .line 147
    :cond_3
    if-eqz v11, :cond_4

    .line 148
    :try_start_1
    invoke-virtual {v11}, Ljava/io/OutputStream;->close()V
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0

    .line 155
    .end local v7    # "buf":Ljava/io/BufferedOutputStream;
    .end local v13    # "sc":Ljavax/net/ssl/SSLContext;
    .end local v14    # "status":I
    .end local v15    # "url":Ljava/net/URL;
    :cond_4
    :goto_2
    return v12

    .line 150
    .restart local v7    # "buf":Ljava/io/BufferedOutputStream;
    .restart local v13    # "sc":Ljavax/net/ssl/SSLContext;
    .restart local v14    # "status":I
    .restart local v15    # "url":Ljava/net/URL;
    :catch_0
    move-exception v9

    .line 151
    .local v9, "e":Ljava/io/IOException;
    invoke-virtual {v9}, Ljava/io/IOException;->printStackTrace()V

    goto :goto_2

    .line 140
    .end local v7    # "buf":Ljava/io/BufferedOutputStream;
    .end local v9    # "e":Ljava/io/IOException;
    .end local v13    # "sc":Ljavax/net/ssl/SSLContext;
    .end local v14    # "status":I
    .end local v15    # "url":Ljava/net/URL;
    :catch_1
    move-exception v9

    .line 141
    .local v9, "e":Ljava/lang/Exception;
    :try_start_2
    invoke-virtual {v9}, Ljava/lang/Exception;->printStackTrace()V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 143
    if-eqz v8, :cond_5

    .line 144
    invoke-virtual {v8}, Ljavax/net/ssl/HttpsURLConnection;->disconnect()V

    .line 147
    :cond_5
    if-eqz v11, :cond_4

    .line 148
    :try_start_3
    invoke-virtual {v11}, Ljava/io/OutputStream;->close()V
    :try_end_3
    .catch Ljava/io/IOException; {:try_start_3 .. :try_end_3} :catch_2

    goto :goto_2

    .line 150
    :catch_2
    move-exception v9

    .line 151
    .local v9, "e":Ljava/io/IOException;
    invoke-virtual {v9}, Ljava/io/IOException;->printStackTrace()V

    goto :goto_2

    .line 143
    .end local v9    # "e":Ljava/io/IOException;
    :catchall_0
    move-exception v17

    if-eqz v8, :cond_6

    .line 144
    invoke-virtual {v8}, Ljavax/net/ssl/HttpsURLConnection;->disconnect()V

    .line 147
    :cond_6
    if-eqz v11, :cond_7

    .line 148
    :try_start_4
    invoke-virtual {v11}, Ljava/io/OutputStream;->close()V
    :try_end_4
    .catch Ljava/io/IOException; {:try_start_4 .. :try_end_4} :catch_3

    .line 152
    :cond_7
    :goto_3
    throw v17

    .line 150
    :catch_3
    move-exception v9

    .line 151
    .restart local v9    # "e":Ljava/io/IOException;
    invoke-virtual {v9}, Ljava/io/IOException;->printStackTrace()V

    goto :goto_3
.end method

.method public resetNameIconRules(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Z
    .locals 3
    .param p1, "mac"    # Ljava/lang/String;
    .param p2, "pluginID"    # Ljava/lang/String;
    .param p3, "authHeader"    # Ljava/lang/String;

    .prologue
    .line 302
    invoke-direct {p0, p1, p2}, Lcom/belkin/cloud/CloudServices;->generateResetRequestNameIconRules(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 303
    .local v0, "request":Ljava/lang/String;
    const-string v2, "https://api.xbcs.net:8443/apis/http/plugin/insight/message/"

    invoke-direct {p0, v2, v0, p3}, Lcom/belkin/cloud/CloudServices;->makeRequest(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    move-result v1

    .line 304
    .local v1, "result":I
    const/16 v2, 0xc8

    if-ne v1, v2, :cond_0

    .line 306
    const/4 v2, 0x1

    .line 309
    :goto_0
    return v2

    :cond_0
    const/4 v2, 0x0

    goto :goto_0
.end method

.method public sendRequest(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 7
    .param p1, "xmlBody"    # Ljava/lang/String;
    .param p2, "authHeader"    # Ljava/lang/String;
    .param p3, "pluginId"    # Ljava/lang/String;
    .param p4, "mac"    # Ljava/lang/String;

    .prologue
    .line 392
    const-string v6, ""

    .line 393
    .local v6, "strResponse":Ljava/lang/String;
    sget-object v0, Lcom/belkin/cloud/CloudServices;->urlRulesTng:Ljava/lang/String;

    invoke-direct {p0, v0}, Lcom/belkin/cloud/CloudServices;->buildCloudUrl(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    .local v5, "urlRequestString":Ljava/lang/String;
    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move-object v3, p3

    move-object v4, p4

    .line 394
    invoke-virtual/range {v0 .. v5}, Lcom/belkin/cloud/CloudServices;->sendRequestGeneric(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    .line 395
    return-object v6
.end method

.method public sendRequestGeneric(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 8
    .param p1, "xmlBody"    # Ljava/lang/String;
    .param p2, "authHeader"    # Ljava/lang/String;
    .param p3, "pluginId"    # Ljava/lang/String;
    .param p4, "mac"    # Ljava/lang/String;
    .param p5, "urlRequestString"    # Ljava/lang/String;

    .prologue
    .line 354
    const-string v5, ""

    .line 355
    .local v5, "strResponse":Ljava/lang/String;
    const/4 v4, 0x0

    .line 358
    .local v4, "resp":Lorg/apache/http/HttpResponse;
    :try_start_0
    invoke-direct {p0}, Lcom/belkin/cloud/CloudServices;->ensureClient()V

    .line 359
    const-string v1, ""

    .line 360
    .local v1, "data":Ljava/lang/String;
    sget-object v6, Lcom/belkin/cloud/CloudServices;->urlSerializationTracking:Ljava/lang/String;

    invoke-virtual {p5, v6}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v6

    if-eqz v6, :cond_3

    .line 362
    invoke-direct {p0, p1, p3, p4}, Lcom/belkin/cloud/CloudServices;->generateXMLSerTrackingRequest(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 367
    :cond_0
    :goto_0
    invoke-direct {p0, p5, p2}, Lcom/belkin/cloud/CloudServices;->buildPost(Ljava/lang/String;Ljava/lang/String;)Lorg/apache/http/client/methods/HttpPost;

    move-result-object v3

    .line 368
    .local v3, "post":Lorg/apache/http/client/methods/HttpPost;
    new-instance v6, Lorg/apache/http/entity/StringEntity;

    const-string v7, "UTF-8"

    invoke-direct {v6, v1, v7}, Lorg/apache/http/entity/StringEntity;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v3, v6}, Lorg/apache/http/client/methods/HttpPost;->setEntity(Lorg/apache/http/HttpEntity;)V

    .line 369
    iget-object v6, p0, Lcom/belkin/cloud/CloudServices;->mClient:Lorg/apache/http/client/HttpClient;

    invoke-interface {v6, v3}, Lorg/apache/http/client/HttpClient;->execute(Lorg/apache/http/client/methods/HttpUriRequest;)Lorg/apache/http/HttpResponse;

    move-result-object v4

    .line 370
    invoke-interface {v4}, Lorg/apache/http/HttpResponse;->getStatusLine()Lorg/apache/http/StatusLine;

    move-result-object v6

    invoke-interface {v6}, Lorg/apache/http/StatusLine;->getStatusCode()I

    move-result v0

    .line 371
    .local v0, "code":I
    const/16 v6, 0xc8

    if-ne v0, v6, :cond_4

    .line 372
    invoke-direct {p0, v4}, Lcom/belkin/cloud/CloudServices;->getResponseString(Lorg/apache/http/HttpResponse;)Ljava/lang/String;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result-object v5

    .line 380
    if-eqz v4, :cond_1

    .line 382
    :try_start_1
    invoke-interface {v4}, Lorg/apache/http/HttpResponse;->getEntity()Lorg/apache/http/HttpEntity;

    move-result-object v6

    invoke-interface {v6}, Lorg/apache/http/HttpEntity;->consumeContent()V
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_4

    .end local v0    # "code":I
    .end local v1    # "data":Ljava/lang/String;
    .end local v3    # "post":Lorg/apache/http/client/methods/HttpPost;
    :cond_1
    :goto_1
    move-object v6, v5

    .line 387
    :cond_2
    :goto_2
    return-object v6

    .line 363
    .restart local v1    # "data":Ljava/lang/String;
    :cond_3
    :try_start_2
    sget-object v6, Lcom/belkin/cloud/CloudServices;->urlRulesTng:Ljava/lang/String;

    invoke-virtual {p5, v6}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v6

    if-eqz v6, :cond_0

    .line 365
    invoke-direct {p0, p1, p3, p4}, Lcom/belkin/cloud/CloudServices;->generateXMLRequest(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_1
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    move-result-object v1

    goto :goto_0

    .line 374
    .restart local v0    # "code":I
    .restart local v3    # "post":Lorg/apache/http/client/methods/HttpPost;
    :cond_4
    const/4 v6, 0x0

    .line 380
    if-eqz v4, :cond_2

    .line 382
    :try_start_3
    invoke-interface {v4}, Lorg/apache/http/HttpResponse;->getEntity()Lorg/apache/http/HttpEntity;

    move-result-object v7

    invoke-interface {v7}, Lorg/apache/http/HttpEntity;->consumeContent()V
    :try_end_3
    .catch Ljava/io/IOException; {:try_start_3 .. :try_end_3} :catch_0

    goto :goto_2

    .line 383
    :catch_0
    move-exception v7

    goto :goto_2

    .line 377
    .end local v0    # "code":I
    .end local v1    # "data":Ljava/lang/String;
    .end local v3    # "post":Lorg/apache/http/client/methods/HttpPost;
    :catch_1
    move-exception v2

    .line 378
    .local v2, "exception":Ljava/lang/Exception;
    :try_start_4
    invoke-virtual {v2}, Ljava/lang/Exception;->printStackTrace()V
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    .line 380
    if-eqz v4, :cond_1

    .line 382
    :try_start_5
    invoke-interface {v4}, Lorg/apache/http/HttpResponse;->getEntity()Lorg/apache/http/HttpEntity;

    move-result-object v6

    invoke-interface {v6}, Lorg/apache/http/HttpEntity;->consumeContent()V
    :try_end_5
    .catch Ljava/io/IOException; {:try_start_5 .. :try_end_5} :catch_2

    goto :goto_1

    .line 383
    :catch_2
    move-exception v6

    goto :goto_1

    .line 380
    .end local v2    # "exception":Ljava/lang/Exception;
    :catchall_0
    move-exception v6

    if-eqz v4, :cond_5

    .line 382
    :try_start_6
    invoke-interface {v4}, Lorg/apache/http/HttpResponse;->getEntity()Lorg/apache/http/HttpEntity;

    move-result-object v7

    invoke-interface {v7}, Lorg/apache/http/HttpEntity;->consumeContent()V
    :try_end_6
    .catch Ljava/io/IOException; {:try_start_6 .. :try_end_6} :catch_3

    .line 384
    :cond_5
    :goto_3
    throw v6

    .line 383
    :catch_3
    move-exception v7

    goto :goto_3

    .restart local v0    # "code":I
    .restart local v1    # "data":Ljava/lang/String;
    .restart local v3    # "post":Lorg/apache/http/client/methods/HttpPost;
    :catch_4
    move-exception v6

    goto :goto_1
.end method
