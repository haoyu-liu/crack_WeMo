.class public Lcom/synconset/HttpRequest;
.super Ljava/lang/Object;
.source "HttpRequest.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/synconset/HttpRequest$RequestOutputStream;,
        Lcom/synconset/HttpRequest$FlushOperation;,
        Lcom/synconset/HttpRequest$CloseOperation;,
        Lcom/synconset/HttpRequest$Operation;,
        Lcom/synconset/HttpRequest$HttpRequestException;,
        Lcom/synconset/HttpRequest$Base64;,
        Lcom/synconset/HttpRequest$UploadProgress;,
        Lcom/synconset/HttpRequest$ConnectionFactory;
    }
.end annotation


# static fields
.field private static final BOUNDARY:Ljava/lang/String; = "00content0boundary00"

.field public static final CHARSET_UTF8:Ljava/lang/String; = "UTF-8"

.field private static CONNECTION_FACTORY:Lcom/synconset/HttpRequest$ConnectionFactory; = null

.field public static final CONTENT_TYPE_FORM:Ljava/lang/String; = "application/x-www-form-urlencoded"

.field public static final CONTENT_TYPE_JSON:Ljava/lang/String; = "application/json"

.field private static final CONTENT_TYPE_MULTIPART:Ljava/lang/String; = "multipart/form-data; boundary=00content0boundary00"

.field private static final CRLF:Ljava/lang/String; = "\r\n"

.field private static final EMPTY_STRINGS:[Ljava/lang/String;

.field public static final ENCODING_GZIP:Ljava/lang/String; = "gzip"

.field public static final HEADER_ACCEPT:Ljava/lang/String; = "Accept"

.field public static final HEADER_ACCEPT_CHARSET:Ljava/lang/String; = "Accept-Charset"

.field public static final HEADER_ACCEPT_ENCODING:Ljava/lang/String; = "Accept-Encoding"

.field public static final HEADER_AUTHORIZATION:Ljava/lang/String; = "Authorization"

.field public static final HEADER_CACHE_CONTROL:Ljava/lang/String; = "Cache-Control"

.field public static final HEADER_CONTENT_ENCODING:Ljava/lang/String; = "Content-Encoding"

.field public static final HEADER_CONTENT_LENGTH:Ljava/lang/String; = "Content-Length"

.field public static final HEADER_CONTENT_TYPE:Ljava/lang/String; = "Content-Type"

.field public static final HEADER_DATE:Ljava/lang/String; = "Date"

.field public static final HEADER_ETAG:Ljava/lang/String; = "ETag"

.field public static final HEADER_EXPIRES:Ljava/lang/String; = "Expires"

.field public static final HEADER_IF_NONE_MATCH:Ljava/lang/String; = "If-None-Match"

.field public static final HEADER_LAST_MODIFIED:Ljava/lang/String; = "Last-Modified"

.field public static final HEADER_LOCATION:Ljava/lang/String; = "Location"

.field public static final HEADER_PROXY_AUTHORIZATION:Ljava/lang/String; = "Proxy-Authorization"

.field public static final HEADER_REFERER:Ljava/lang/String; = "Referer"

.field public static final HEADER_SERVER:Ljava/lang/String; = "Server"

.field public static final HEADER_USER_AGENT:Ljava/lang/String; = "User-Agent"

.field public static final METHOD_DELETE:Ljava/lang/String; = "DELETE"

.field public static final METHOD_GET:Ljava/lang/String; = "GET"

.field public static final METHOD_HEAD:Ljava/lang/String; = "HEAD"

.field public static final METHOD_OPTIONS:Ljava/lang/String; = "OPTIONS"

.field public static final METHOD_POST:Ljava/lang/String; = "POST"

.field public static final METHOD_PUT:Ljava/lang/String; = "PUT"

.field public static final METHOD_TRACE:Ljava/lang/String; = "TRACE"

.field public static final PARAM_CHARSET:Ljava/lang/String; = "charset"

.field private static PINNED_CERTS:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Ljava/security/cert/Certificate;",
            ">;"
        }
    .end annotation
.end field

.field private static PINNED_FACTORY:Ljavax/net/ssl/SSLSocketFactory;

.field private static final TAG:Ljava/lang/String;

.field private static TRUSTED_FACTORY:Ljavax/net/ssl/SSLSocketFactory;

.field private static TRUSTED_VERIFIER:Ljavax/net/ssl/HostnameVerifier;


# instance fields
.field private bufferSize:I

.field private connection:Ljava/net/HttpURLConnection;

.field private form:Z

.field private httpProxyHost:Ljava/lang/String;

.field private httpProxyPort:I

.field private ignoreCloseExceptions:Z

.field private multipart:Z

.field private output:Lcom/synconset/HttpRequest$RequestOutputStream;

.field private progress:Lcom/synconset/HttpRequest$UploadProgress;

.field private final requestMethod:Ljava/lang/String;

.field private totalSize:J

.field private totalWritten:J

.field private uncompress:Z

.field private final url:Ljava/net/URL;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 265
    const/4 v0, 0x0

    new-array v0, v0, [Ljava/lang/String;

    sput-object v0, Lcom/synconset/HttpRequest;->EMPTY_STRINGS:[Ljava/lang/String;

    .line 274
    const-class v0, Lcom/synconset/HttpRequest;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/synconset/HttpRequest;->TAG:Ljava/lang/String;

    .line 403
    sget-object v0, Lcom/synconset/HttpRequest$ConnectionFactory;->DEFAULT:Lcom/synconset/HttpRequest$ConnectionFactory;

    sput-object v0, Lcom/synconset/HttpRequest;->CONNECTION_FACTORY:Lcom/synconset/HttpRequest$ConnectionFactory;

    return-void
.end method

.method public constructor <init>(Ljava/lang/CharSequence;Ljava/lang/String;)V
    .locals 4
    .param p1, "url"    # Ljava/lang/CharSequence;
    .param p2, "method"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/synconset/HttpRequest$HttpRequestException;
        }
    .end annotation

    .prologue
    .line 1516
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 1480
    const/4 v1, 0x0

    iput-object v1, p0, Lcom/synconset/HttpRequest;->connection:Ljava/net/HttpURLConnection;

    .line 1492
    const/4 v1, 0x1

    iput-boolean v1, p0, Lcom/synconset/HttpRequest;->ignoreCloseExceptions:Z

    .line 1494
    const/4 v1, 0x0

    iput-boolean v1, p0, Lcom/synconset/HttpRequest;->uncompress:Z

    .line 1496
    const/16 v1, 0x2000

    iput v1, p0, Lcom/synconset/HttpRequest;->bufferSize:I

    .line 1498
    const-wide/16 v2, -0x1

    iput-wide v2, p0, Lcom/synconset/HttpRequest;->totalSize:J

    .line 1500
    const-wide/16 v2, 0x0

    iput-wide v2, p0, Lcom/synconset/HttpRequest;->totalWritten:J

    .line 1506
    sget-object v1, Lcom/synconset/HttpRequest$UploadProgress;->DEFAULT:Lcom/synconset/HttpRequest$UploadProgress;

    iput-object v1, p0, Lcom/synconset/HttpRequest;->progress:Lcom/synconset/HttpRequest$UploadProgress;

    .line 1518
    :try_start_0
    new-instance v1, Ljava/net/URL;

    invoke-interface {p1}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/net/URL;-><init>(Ljava/lang/String;)V

    iput-object v1, p0, Lcom/synconset/HttpRequest;->url:Ljava/net/URL;
    :try_end_0
    .catch Ljava/net/MalformedURLException; {:try_start_0 .. :try_end_0} :catch_0

    .line 1522
    iput-object p2, p0, Lcom/synconset/HttpRequest;->requestMethod:Ljava/lang/String;

    .line 1523
    return-void

    .line 1519
    :catch_0
    move-exception v0

    .line 1520
    .local v0, "e":Ljava/net/MalformedURLException;
    new-instance v1, Lcom/synconset/HttpRequest$HttpRequestException;

    invoke-direct {v1, v0}, Lcom/synconset/HttpRequest$HttpRequestException;-><init>(Ljava/io/IOException;)V

    throw v1
.end method

.method public constructor <init>(Ljava/net/URL;Ljava/lang/String;)V
    .locals 2
    .param p1, "url"    # Ljava/net/URL;
    .param p2, "method"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/synconset/HttpRequest$HttpRequestException;
        }
    .end annotation

    .prologue
    .line 1533
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 1480
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/synconset/HttpRequest;->connection:Ljava/net/HttpURLConnection;

    .line 1492
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/synconset/HttpRequest;->ignoreCloseExceptions:Z

    .line 1494
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/synconset/HttpRequest;->uncompress:Z

    .line 1496
    const/16 v0, 0x2000

    iput v0, p0, Lcom/synconset/HttpRequest;->bufferSize:I

    .line 1498
    const-wide/16 v0, -0x1

    iput-wide v0, p0, Lcom/synconset/HttpRequest;->totalSize:J

    .line 1500
    const-wide/16 v0, 0x0

    iput-wide v0, p0, Lcom/synconset/HttpRequest;->totalWritten:J

    .line 1506
    sget-object v0, Lcom/synconset/HttpRequest$UploadProgress;->DEFAULT:Lcom/synconset/HttpRequest$UploadProgress;

    iput-object v0, p0, Lcom/synconset/HttpRequest;->progress:Lcom/synconset/HttpRequest$UploadProgress;

    .line 1534
    iput-object p1, p0, Lcom/synconset/HttpRequest;->url:Ljava/net/URL;

    .line 1535
    iput-object p2, p0, Lcom/synconset/HttpRequest;->requestMethod:Ljava/lang/String;

    .line 1536
    return-void
.end method

.method static synthetic access$000()Ljava/lang/String;
    .locals 1

    .prologue
    .line 106
    sget-object v0, Lcom/synconset/HttpRequest;->TAG:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$100(Ljava/lang/String;)Ljava/lang/String;
    .locals 1
    .param p0, "x0"    # Ljava/lang/String;

    .prologue
    .line 106
    invoke-static {p0}, Lcom/synconset/HttpRequest;->getValidCharset(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$200(Lcom/synconset/HttpRequest;)I
    .locals 1
    .param p0, "x0"    # Lcom/synconset/HttpRequest;

    .prologue
    .line 106
    iget v0, p0, Lcom/synconset/HttpRequest;->bufferSize:I

    return v0
.end method

.method static synthetic access$300(Lcom/synconset/HttpRequest;)J
    .locals 2
    .param p0, "x0"    # Lcom/synconset/HttpRequest;

    .prologue
    .line 106
    iget-wide v0, p0, Lcom/synconset/HttpRequest;->totalWritten:J

    return-wide v0
.end method

.method static synthetic access$314(Lcom/synconset/HttpRequest;J)J
    .locals 3
    .param p0, "x0"    # Lcom/synconset/HttpRequest;
    .param p1, "x1"    # J

    .prologue
    .line 106
    iget-wide v0, p0, Lcom/synconset/HttpRequest;->totalWritten:J

    add-long/2addr v0, p1

    iput-wide v0, p0, Lcom/synconset/HttpRequest;->totalWritten:J

    return-wide v0
.end method

.method static synthetic access$400(Lcom/synconset/HttpRequest;)J
    .locals 2
    .param p0, "x0"    # Lcom/synconset/HttpRequest;

    .prologue
    .line 106
    iget-wide v0, p0, Lcom/synconset/HttpRequest;->totalSize:J

    return-wide v0
.end method

.method static synthetic access$500(Lcom/synconset/HttpRequest;)Lcom/synconset/HttpRequest$UploadProgress;
    .locals 1
    .param p0, "x0"    # Lcom/synconset/HttpRequest;

    .prologue
    .line 106
    iget-object v0, p0, Lcom/synconset/HttpRequest;->progress:Lcom/synconset/HttpRequest$UploadProgress;

    return-object v0
.end method

.method public static addCert(Ljava/io/InputStream;)V
    .locals 3
    .param p0, "in"    # Ljava/io/InputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/security/GeneralSecurityException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 457
    const-string v2, "X.509"

    invoke-static {v2}, Ljava/security/cert/CertificateFactory;->getInstance(Ljava/lang/String;)Ljava/security/cert/CertificateFactory;

    move-result-object v1

    .line 460
    .local v1, "cf":Ljava/security/cert/CertificateFactory;
    :try_start_0
    invoke-virtual {v1, p0}, Ljava/security/cert/CertificateFactory;->generateCertificate(Ljava/io/InputStream;)Ljava/security/cert/Certificate;

    move-result-object v0

    .line 461
    .local v0, "ca":Ljava/security/cert/Certificate;
    invoke-static {v0}, Lcom/synconset/HttpRequest;->addCert(Ljava/security/cert/Certificate;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 463
    invoke-virtual {p0}, Ljava/io/InputStream;->close()V

    .line 465
    return-void

    .line 463
    .end local v0    # "ca":Ljava/security/cert/Certificate;
    :catchall_0
    move-exception v2

    invoke-virtual {p0}, Ljava/io/InputStream;->close()V

    throw v2
.end method

.method public static addCert(Ljava/security/cert/Certificate;)V
    .locals 9
    .param p0, "ca"    # Ljava/security/cert/Certificate;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/security/GeneralSecurityException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v8, 0x0

    .line 425
    sget-object v6, Lcom/synconset/HttpRequest;->PINNED_CERTS:Ljava/util/ArrayList;

    if-nez v6, :cond_0

    .line 426
    new-instance v6, Ljava/util/ArrayList;

    invoke-direct {v6}, Ljava/util/ArrayList;-><init>()V

    sput-object v6, Lcom/synconset/HttpRequest;->PINNED_CERTS:Ljava/util/ArrayList;

    .line 428
    :cond_0
    sget-object v6, Lcom/synconset/HttpRequest;->PINNED_CERTS:Ljava/util/ArrayList;

    invoke-virtual {v6, p0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 429
    invoke-static {}, Ljava/security/KeyStore;->getDefaultType()Ljava/lang/String;

    move-result-object v2

    .line 430
    .local v2, "keyStoreType":Ljava/lang/String;
    invoke-static {v2}, Ljava/security/KeyStore;->getInstance(Ljava/lang/String;)Ljava/security/KeyStore;

    move-result-object v1

    .line 431
    .local v1, "keyStore":Ljava/security/KeyStore;
    invoke-virtual {v1, v8, v8}, Ljava/security/KeyStore;->load(Ljava/io/InputStream;[C)V

    .line 433
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    sget-object v6, Lcom/synconset/HttpRequest;->PINNED_CERTS:Ljava/util/ArrayList;

    invoke-virtual {v6}, Ljava/util/ArrayList;->size()I

    move-result v6

    if-ge v0, v6, :cond_1

    .line 434
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "CA"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    sget-object v6, Lcom/synconset/HttpRequest;->PINNED_CERTS:Ljava/util/ArrayList;

    invoke-virtual {v6, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/security/cert/Certificate;

    invoke-virtual {v1, v7, v6}, Ljava/security/KeyStore;->setCertificateEntry(Ljava/lang/String;Ljava/security/cert/Certificate;)V

    .line 433
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 438
    :cond_1
    invoke-static {}, Ljavax/net/ssl/TrustManagerFactory;->getDefaultAlgorithm()Ljava/lang/String;

    move-result-object v5

    .line 439
    .local v5, "tmfAlgorithm":Ljava/lang/String;
    invoke-static {v5}, Ljavax/net/ssl/TrustManagerFactory;->getInstance(Ljava/lang/String;)Ljavax/net/ssl/TrustManagerFactory;

    move-result-object v4

    .line 440
    .local v4, "tmf":Ljavax/net/ssl/TrustManagerFactory;
    invoke-virtual {v4, v1}, Ljavax/net/ssl/TrustManagerFactory;->init(Ljava/security/KeyStore;)V

    .line 443
    const-string v6, "TLS"

    invoke-static {v6}, Ljavax/net/ssl/SSLContext;->getInstance(Ljava/lang/String;)Ljavax/net/ssl/SSLContext;

    move-result-object v3

    .line 444
    .local v3, "sslContext":Ljavax/net/ssl/SSLContext;
    invoke-virtual {v4}, Ljavax/net/ssl/TrustManagerFactory;->getTrustManagers()[Ljavax/net/ssl/TrustManager;

    move-result-object v6

    invoke-virtual {v3, v8, v6, v8}, Ljavax/net/ssl/SSLContext;->init([Ljavax/net/ssl/KeyManager;[Ljavax/net/ssl/TrustManager;Ljava/security/SecureRandom;)V

    .line 445
    invoke-virtual {v3}, Ljavax/net/ssl/SSLContext;->getSocketFactory()Ljavax/net/ssl/SSLSocketFactory;

    move-result-object v6

    sput-object v6, Lcom/synconset/HttpRequest;->PINNED_FACTORY:Ljavax/net/ssl/SSLSocketFactory;

    .line 446
    return-void
.end method

.method private static addParamPrefix(Ljava/lang/String;Ljava/lang/StringBuilder;)Ljava/lang/StringBuilder;
    .locals 5
    .param p0, "baseUrl"    # Ljava/lang/String;
    .param p1, "result"    # Ljava/lang/StringBuilder;

    .prologue
    const/16 v4, 0x3f

    const/16 v3, 0x26

    .line 359
    invoke-virtual {p0, v4}, Ljava/lang/String;->indexOf(I)I

    move-result v1

    .line 360
    .local v1, "queryStart":I
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->length()I

    move-result v2

    add-int/lit8 v0, v2, -0x1

    .line 361
    .local v0, "lastChar":I
    const/4 v2, -0x1

    if-ne v1, v2, :cond_1

    .line 362
    invoke-virtual {p1, v4}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 365
    :cond_0
    :goto_0
    return-object p1

    .line 363
    :cond_1
    if-ge v1, v0, :cond_0

    invoke-virtual {p0, v0}, Ljava/lang/String;->charAt(I)C

    move-result v2

    if-eq v2, v3, :cond_0

    .line 364
    invoke-virtual {p1, v3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    goto :goto_0
.end method

.method private static addPathSeparator(Ljava/lang/String;Ljava/lang/StringBuilder;)Ljava/lang/StringBuilder;
    .locals 3
    .param p0, "baseUrl"    # Ljava/lang/String;
    .param p1, "result"    # Ljava/lang/StringBuilder;

    .prologue
    const/16 v2, 0x2f

    .line 351
    const/16 v0, 0x3a

    invoke-virtual {p0, v0}, Ljava/lang/String;->indexOf(I)I

    move-result v0

    add-int/lit8 v0, v0, 0x2

    invoke-virtual {p0, v2}, Ljava/lang/String;->lastIndexOf(I)I

    move-result v1

    if-ne v0, v1, :cond_0

    .line 352
    invoke-virtual {p1, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 353
    :cond_0
    return-object p1
.end method

.method public static append(Ljava/lang/CharSequence;Ljava/util/Map;)Ljava/lang/String;
    .locals 7
    .param p0, "url"    # Ljava/lang/CharSequence;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/CharSequence;",
            "Ljava/util/Map",
            "<**>;)",
            "Ljava/lang/String;"
        }
    .end annotation

    .prologue
    .local p1, "params":Ljava/util/Map;, "Ljava/util/Map<**>;"
    const/16 v6, 0x3d

    .line 940
    invoke-interface {p0}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v0

    .line 941
    .local v0, "baseUrl":Ljava/lang/String;
    if-eqz p1, :cond_0

    invoke-interface {p1}, Ljava/util/Map;->isEmpty()Z

    move-result v5

    if-eqz v5, :cond_1

    .line 969
    .end local v0    # "baseUrl":Ljava/lang/String;
    :cond_0
    :goto_0
    return-object v0

    .line 944
    .restart local v0    # "baseUrl":Ljava/lang/String;
    :cond_1
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 946
    .local v3, "result":Ljava/lang/StringBuilder;
    invoke-static {v0, v3}, Lcom/synconset/HttpRequest;->addPathSeparator(Ljava/lang/String;Ljava/lang/StringBuilder;)Ljava/lang/StringBuilder;

    .line 947
    invoke-static {v0, v3}, Lcom/synconset/HttpRequest;->addParamPrefix(Ljava/lang/String;Ljava/lang/StringBuilder;)Ljava/lang/StringBuilder;

    .line 951
    invoke-interface {p1}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v5

    invoke-interface {v5}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v2

    .line 952
    .local v2, "iterator":Ljava/util/Iterator;, "Ljava/util/Iterator<*>;"
    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/Map$Entry;

    .line 953
    .local v1, "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<**>;"
    invoke-interface {v1}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 954
    invoke-virtual {v3, v6}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 955
    invoke-interface {v1}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v4

    .line 956
    .local v4, "value":Ljava/lang/Object;
    if-eqz v4, :cond_2

    .line 957
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 959
    :cond_2
    :goto_1
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_3

    .line 960
    const/16 v5, 0x26

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 961
    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    .end local v1    # "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<**>;"
    check-cast v1, Ljava/util/Map$Entry;

    .line 962
    .restart local v1    # "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<**>;"
    invoke-interface {v1}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 963
    invoke-virtual {v3, v6}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 964
    invoke-interface {v1}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v4

    .line 965
    if-eqz v4, :cond_2

    .line 966
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    goto :goto_1

    .line 969
    :cond_3
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    goto :goto_0
.end method

.method public static varargs append(Ljava/lang/CharSequence;[Ljava/lang/Object;)Ljava/lang/String;
    .locals 6
    .param p0, "url"    # Ljava/lang/CharSequence;
    .param p1, "params"    # [Ljava/lang/Object;

    .prologue
    const/16 v5, 0x3d

    .line 984
    invoke-interface {p0}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v0

    .line 985
    .local v0, "baseUrl":Ljava/lang/String;
    if-eqz p1, :cond_0

    array-length v4, p1

    if-nez v4, :cond_1

    .line 1013
    .end local v0    # "baseUrl":Ljava/lang/String;
    :cond_0
    :goto_0
    return-object v0

    .line 988
    .restart local v0    # "baseUrl":Ljava/lang/String;
    :cond_1
    array-length v4, p1

    rem-int/lit8 v4, v4, 0x2

    if-eqz v4, :cond_2

    .line 989
    new-instance v4, Ljava/lang/IllegalArgumentException;

    const-string v5, "Must specify an even number of parameter names/values"

    invoke-direct {v4, v5}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 992
    :cond_2
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 994
    .local v2, "result":Ljava/lang/StringBuilder;
    invoke-static {v0, v2}, Lcom/synconset/HttpRequest;->addPathSeparator(Ljava/lang/String;Ljava/lang/StringBuilder;)Ljava/lang/StringBuilder;

    .line 995
    invoke-static {v0, v2}, Lcom/synconset/HttpRequest;->addParamPrefix(Ljava/lang/String;Ljava/lang/StringBuilder;)Ljava/lang/StringBuilder;

    .line 998
    const/4 v4, 0x0

    aget-object v4, p1, v4

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 999
    invoke-virtual {v2, v5}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 1000
    const/4 v4, 0x1

    aget-object v3, p1, v4

    .line 1001
    .local v3, "value":Ljava/lang/Object;
    if-eqz v3, :cond_3

    .line 1002
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 1004
    :cond_3
    const/4 v1, 0x2

    .local v1, "i":I
    :goto_1
    array-length v4, p1

    if-ge v1, v4, :cond_5

    .line 1005
    const/16 v4, 0x26

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 1006
    aget-object v4, p1, v1

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 1007
    invoke-virtual {v2, v5}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 1008
    add-int/lit8 v4, v1, 0x1

    aget-object v3, p1, v4

    .line 1009
    if-eqz v3, :cond_4

    .line 1010
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 1004
    :cond_4
    add-int/lit8 v1, v1, 0x2

    goto :goto_1

    .line 1013
    :cond_5
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    goto :goto_0
.end method

.method private createConnection()Ljava/net/HttpURLConnection;
    .locals 5

    .prologue
    .line 1545
    :try_start_0
    iget-object v2, p0, Lcom/synconset/HttpRequest;->httpProxyHost:Ljava/lang/String;

    if-eqz v2, :cond_0

    .line 1546
    sget-object v2, Lcom/synconset/HttpRequest;->CONNECTION_FACTORY:Lcom/synconset/HttpRequest$ConnectionFactory;

    iget-object v3, p0, Lcom/synconset/HttpRequest;->url:Ljava/net/URL;

    invoke-direct {p0}, Lcom/synconset/HttpRequest;->createProxy()Ljava/net/Proxy;

    move-result-object v4

    invoke-interface {v2, v3, v4}, Lcom/synconset/HttpRequest$ConnectionFactory;->create(Ljava/net/URL;Ljava/net/Proxy;)Ljava/net/HttpURLConnection;

    move-result-object v0

    .line 1549
    .local v0, "connection":Ljava/net/HttpURLConnection;
    :goto_0
    iget-object v2, p0, Lcom/synconset/HttpRequest;->requestMethod:Ljava/lang/String;

    invoke-virtual {v0, v2}, Ljava/net/HttpURLConnection;->setRequestMethod(Ljava/lang/String;)V

    .line 1550
    return-object v0

    .line 1548
    .end local v0    # "connection":Ljava/net/HttpURLConnection;
    :cond_0
    sget-object v2, Lcom/synconset/HttpRequest;->CONNECTION_FACTORY:Lcom/synconset/HttpRequest$ConnectionFactory;

    iget-object v3, p0, Lcom/synconset/HttpRequest;->url:Ljava/net/URL;

    invoke-interface {v2, v3}, Lcom/synconset/HttpRequest$ConnectionFactory;->create(Ljava/net/URL;)Ljava/net/HttpURLConnection;
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v0

    .restart local v0    # "connection":Ljava/net/HttpURLConnection;
    goto :goto_0

    .line 1551
    .end local v0    # "connection":Ljava/net/HttpURLConnection;
    :catch_0
    move-exception v1

    .line 1552
    .local v1, "e":Ljava/io/IOException;
    new-instance v2, Lcom/synconset/HttpRequest$HttpRequestException;

    invoke-direct {v2, v1}, Lcom/synconset/HttpRequest$HttpRequestException;-><init>(Ljava/io/IOException;)V

    throw v2
.end method

.method private createProxy()Ljava/net/Proxy;
    .locals 5

    .prologue
    .line 1539
    new-instance v0, Ljava/net/Proxy;

    sget-object v1, Ljava/net/Proxy$Type;->HTTP:Ljava/net/Proxy$Type;

    new-instance v2, Ljava/net/InetSocketAddress;

    iget-object v3, p0, Lcom/synconset/HttpRequest;->httpProxyHost:Ljava/lang/String;

    iget v4, p0, Lcom/synconset/HttpRequest;->httpProxyPort:I

    invoke-direct {v2, v3, v4}, Ljava/net/InetSocketAddress;-><init>(Ljava/lang/String;I)V

    invoke-direct {v0, v1, v2}, Ljava/net/Proxy;-><init>(Ljava/net/Proxy$Type;Ljava/net/SocketAddress;)V

    return-object v0
.end method

.method public static delete(Ljava/lang/CharSequence;)Lcom/synconset/HttpRequest;
    .locals 2
    .param p0, "url"    # Ljava/lang/CharSequence;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/synconset/HttpRequest$HttpRequestException;
        }
    .end annotation

    .prologue
    .line 1217
    new-instance v0, Lcom/synconset/HttpRequest;

    const-string v1, "DELETE"

    invoke-direct {v0, p0, v1}, Lcom/synconset/HttpRequest;-><init>(Ljava/lang/CharSequence;Ljava/lang/String;)V

    return-object v0
.end method

.method public static delete(Ljava/lang/CharSequence;Ljava/util/Map;Z)Lcom/synconset/HttpRequest;
    .locals 2
    .param p0, "baseUrl"    # Ljava/lang/CharSequence;
    .param p2, "encode"    # Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/CharSequence;",
            "Ljava/util/Map",
            "<**>;Z)",
            "Lcom/synconset/HttpRequest;"
        }
    .end annotation

    .prologue
    .line 1247
    .local p1, "params":Ljava/util/Map;, "Ljava/util/Map<**>;"
    invoke-static {p0, p1}, Lcom/synconset/HttpRequest;->append(Ljava/lang/CharSequence;Ljava/util/Map;)Ljava/lang/String;

    move-result-object v0

    .line 1248
    .local v0, "url":Ljava/lang/String;
    if-eqz p2, :cond_0

    invoke-static {v0}, Lcom/synconset/HttpRequest;->encode(Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v0

    .end local v0    # "url":Ljava/lang/String;
    :cond_0
    invoke-static {v0}, Lcom/synconset/HttpRequest;->delete(Ljava/lang/CharSequence;)Lcom/synconset/HttpRequest;

    move-result-object v1

    return-object v1
.end method

.method public static varargs delete(Ljava/lang/CharSequence;Z[Ljava/lang/Object;)Lcom/synconset/HttpRequest;
    .locals 2
    .param p0, "baseUrl"    # Ljava/lang/CharSequence;
    .param p1, "encode"    # Z
    .param p2, "params"    # [Ljava/lang/Object;

    .prologue
    .line 1268
    invoke-static {p0, p2}, Lcom/synconset/HttpRequest;->append(Ljava/lang/CharSequence;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    .line 1269
    .local v0, "url":Ljava/lang/String;
    if-eqz p1, :cond_0

    invoke-static {v0}, Lcom/synconset/HttpRequest;->encode(Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v0

    .end local v0    # "url":Ljava/lang/String;
    :cond_0
    invoke-static {v0}, Lcom/synconset/HttpRequest;->delete(Ljava/lang/CharSequence;)Lcom/synconset/HttpRequest;

    move-result-object v1

    return-object v1
.end method

.method public static delete(Ljava/net/URL;)Lcom/synconset/HttpRequest;
    .locals 2
    .param p0, "url"    # Ljava/net/URL;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/synconset/HttpRequest$HttpRequestException;
        }
    .end annotation

    .prologue
    .line 1228
    new-instance v0, Lcom/synconset/HttpRequest;

    const-string v1, "DELETE"

    invoke-direct {v0, p0, v1}, Lcom/synconset/HttpRequest;-><init>(Ljava/net/URL;Ljava/lang/String;)V

    return-object v0
.end method

.method public static encode(Ljava/lang/CharSequence;)Ljava/lang/String;
    .locals 12
    .param p0, "url"    # Ljava/lang/CharSequence;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/synconset/HttpRequest$HttpRequestException;
        }
    .end annotation

    .prologue
    .line 904
    :try_start_0
    new-instance v10, Ljava/net/URL;

    invoke-interface {p0}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {v10, v0}, Ljava/net/URL;-><init>(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 909
    .local v10, "parsed":Ljava/net/URL;
    invoke-virtual {v10}, Ljava/net/URL;->getHost()Ljava/lang/String;

    move-result-object v2

    .line 910
    .local v2, "host":Ljava/lang/String;
    invoke-virtual {v10}, Ljava/net/URL;->getPort()I

    move-result v11

    .line 911
    .local v11, "port":I
    const/4 v0, -0x1

    if-eq v11, v0, :cond_0

    .line 912
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const/16 v1, 0x3a

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-static {v11}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    .line 915
    :cond_0
    :try_start_1
    new-instance v0, Ljava/net/URI;

    invoke-virtual {v10}, Ljava/net/URL;->getProtocol()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v10}, Ljava/net/URL;->getPath()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v10}, Ljava/net/URL;->getQuery()Ljava/lang/String;

    move-result-object v4

    const/4 v5, 0x0

    invoke-direct/range {v0 .. v5}, Ljava/net/URI;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/net/URI;->toASCIIString()Ljava/lang/String;

    move-result-object v7

    .line 917
    .local v7, "encoded":Ljava/lang/String;
    const/16 v0, 0x3f

    invoke-virtual {v7, v0}, Ljava/lang/String;->indexOf(I)I

    move-result v9

    .line 918
    .local v9, "paramsStart":I
    if-lez v9, :cond_1

    add-int/lit8 v0, v9, 0x1

    invoke-virtual {v7}, Ljava/lang/String;->length()I

    move-result v1

    if-ge v0, v1, :cond_1

    .line 919
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const/4 v1, 0x0

    add-int/lit8 v3, v9, 0x1

    invoke-virtual {v7, v1, v3}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    add-int/lit8 v1, v9, 0x1

    invoke-virtual {v7, v1}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v1

    const-string v3, "+"

    const-string v4, "%2B"

    invoke-virtual {v1, v3, v4}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    :try_end_1
    .catch Ljava/net/URISyntaxException; {:try_start_1 .. :try_end_1} :catch_1

    move-result-object v7

    .line 921
    :cond_1
    return-object v7

    .line 905
    .end local v2    # "host":Ljava/lang/String;
    .end local v7    # "encoded":Ljava/lang/String;
    .end local v9    # "paramsStart":I
    .end local v10    # "parsed":Ljava/net/URL;
    .end local v11    # "port":I
    :catch_0
    move-exception v6

    .line 906
    .local v6, "e":Ljava/io/IOException;
    new-instance v0, Lcom/synconset/HttpRequest$HttpRequestException;

    invoke-direct {v0, v6}, Lcom/synconset/HttpRequest$HttpRequestException;-><init>(Ljava/io/IOException;)V

    throw v0

    .line 922
    .end local v6    # "e":Ljava/io/IOException;
    .restart local v2    # "host":Ljava/lang/String;
    .restart local v10    # "parsed":Ljava/net/URL;
    .restart local v11    # "port":I
    :catch_1
    move-exception v6

    .line 923
    .local v6, "e":Ljava/net/URISyntaxException;
    new-instance v8, Ljava/io/IOException;

    const-string v0, "Parsing URI failed"

    invoke-direct {v8, v0}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    .line 924
    .local v8, "io":Ljava/io/IOException;
    invoke-virtual {v8, v6}, Ljava/io/IOException;->initCause(Ljava/lang/Throwable;)Ljava/lang/Throwable;

    .line 925
    new-instance v0, Lcom/synconset/HttpRequest$HttpRequestException;

    invoke-direct {v0, v8}, Lcom/synconset/HttpRequest$HttpRequestException;-><init>(Ljava/io/IOException;)V

    throw v0
.end method

.method public static get(Ljava/lang/CharSequence;)Lcom/synconset/HttpRequest;
    .locals 2
    .param p0, "url"    # Ljava/lang/CharSequence;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/synconset/HttpRequest$HttpRequestException;
        }
    .end annotation

    .prologue
    .line 1025
    new-instance v0, Lcom/synconset/HttpRequest;

    const-string v1, "GET"

    invoke-direct {v0, p0, v1}, Lcom/synconset/HttpRequest;-><init>(Ljava/lang/CharSequence;Ljava/lang/String;)V

    return-object v0
.end method

.method public static get(Ljava/lang/CharSequence;Ljava/util/Map;Z)Lcom/synconset/HttpRequest;
    .locals 2
    .param p0, "baseUrl"    # Ljava/lang/CharSequence;
    .param p2, "encode"    # Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/CharSequence;",
            "Ljava/util/Map",
            "<**>;Z)",
            "Lcom/synconset/HttpRequest;"
        }
    .end annotation

    .prologue
    .line 1055
    .local p1, "params":Ljava/util/Map;, "Ljava/util/Map<**>;"
    invoke-static {p0, p1}, Lcom/synconset/HttpRequest;->append(Ljava/lang/CharSequence;Ljava/util/Map;)Ljava/lang/String;

    move-result-object v0

    .line 1056
    .local v0, "url":Ljava/lang/String;
    if-eqz p2, :cond_0

    invoke-static {v0}, Lcom/synconset/HttpRequest;->encode(Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v0

    .end local v0    # "url":Ljava/lang/String;
    :cond_0
    invoke-static {v0}, Lcom/synconset/HttpRequest;->get(Ljava/lang/CharSequence;)Lcom/synconset/HttpRequest;

    move-result-object v1

    return-object v1
.end method

.method public static varargs get(Ljava/lang/CharSequence;Z[Ljava/lang/Object;)Lcom/synconset/HttpRequest;
    .locals 2
    .param p0, "baseUrl"    # Ljava/lang/CharSequence;
    .param p1, "encode"    # Z
    .param p2, "params"    # [Ljava/lang/Object;

    .prologue
    .line 1076
    invoke-static {p0, p2}, Lcom/synconset/HttpRequest;->append(Ljava/lang/CharSequence;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    .line 1077
    .local v0, "url":Ljava/lang/String;
    if-eqz p1, :cond_0

    invoke-static {v0}, Lcom/synconset/HttpRequest;->encode(Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v0

    .end local v0    # "url":Ljava/lang/String;
    :cond_0
    invoke-static {v0}, Lcom/synconset/HttpRequest;->get(Ljava/lang/CharSequence;)Lcom/synconset/HttpRequest;

    move-result-object v1

    return-object v1
.end method

.method public static get(Ljava/net/URL;)Lcom/synconset/HttpRequest;
    .locals 2
    .param p0, "url"    # Ljava/net/URL;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/synconset/HttpRequest$HttpRequestException;
        }
    .end annotation

    .prologue
    .line 1036
    new-instance v0, Lcom/synconset/HttpRequest;

    const-string v1, "GET"

    invoke-direct {v0, p0, v1}, Lcom/synconset/HttpRequest;-><init>(Ljava/net/URL;Ljava/lang/String;)V

    return-object v0
.end method

.method private static getPinnedFactory()Ljavax/net/ssl/SSLSocketFactory;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/synconset/HttpRequest$HttpRequestException;
        }
    .end annotation

    .prologue
    .line 285
    sget-object v1, Lcom/synconset/HttpRequest;->PINNED_FACTORY:Ljavax/net/ssl/SSLSocketFactory;

    if-eqz v1, :cond_0

    .line 286
    sget-object v1, Lcom/synconset/HttpRequest;->PINNED_FACTORY:Ljavax/net/ssl/SSLSocketFactory;

    return-object v1

    .line 288
    :cond_0
    new-instance v0, Ljava/io/IOException;

    const-string v1, "You must add at least 1 certificate in order to pin to certificates"

    invoke-direct {v0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    .line 289
    .local v0, "e":Ljava/io/IOException;
    new-instance v1, Lcom/synconset/HttpRequest$HttpRequestException;

    invoke-direct {v1, v0}, Lcom/synconset/HttpRequest$HttpRequestException;-><init>(Ljava/io/IOException;)V

    throw v1
.end method

.method private static getTrustedFactory()Ljavax/net/ssl/SSLSocketFactory;
    .locals 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/synconset/HttpRequest$HttpRequestException;
        }
    .end annotation

    .prologue
    .line 295
    sget-object v4, Lcom/synconset/HttpRequest;->TRUSTED_FACTORY:Ljavax/net/ssl/SSLSocketFactory;

    if-nez v4, :cond_0

    .line 296
    const/4 v4, 0x1

    new-array v3, v4, [Ljavax/net/ssl/TrustManager;

    const/4 v4, 0x0

    new-instance v5, Lcom/synconset/HttpRequest$1;

    invoke-direct {v5}, Lcom/synconset/HttpRequest$1;-><init>()V

    aput-object v5, v3, v4

    .line 319
    .local v3, "trustAllCerts":[Ljavax/net/ssl/TrustManager;
    :try_start_0
    const-string v4, "TLS"

    invoke-static {v4}, Ljavax/net/ssl/SSLContext;->getInstance(Ljava/lang/String;)Ljavax/net/ssl/SSLContext;

    move-result-object v0

    .line 320
    .local v0, "context":Ljavax/net/ssl/SSLContext;
    const/4 v4, 0x0

    new-instance v5, Ljava/security/SecureRandom;

    invoke-direct {v5}, Ljava/security/SecureRandom;-><init>()V

    invoke-virtual {v0, v4, v3, v5}, Ljavax/net/ssl/SSLContext;->init([Ljavax/net/ssl/KeyManager;[Ljavax/net/ssl/TrustManager;Ljava/security/SecureRandom;)V

    .line 321
    invoke-virtual {v0}, Ljavax/net/ssl/SSLContext;->getSocketFactory()Ljavax/net/ssl/SSLSocketFactory;

    move-result-object v4

    sput-object v4, Lcom/synconset/HttpRequest;->TRUSTED_FACTORY:Ljavax/net/ssl/SSLSocketFactory;
    :try_end_0
    .catch Ljava/security/GeneralSecurityException; {:try_start_0 .. :try_end_0} :catch_0

    .line 330
    :cond_0
    sget-object v4, Lcom/synconset/HttpRequest;->TRUSTED_FACTORY:Ljavax/net/ssl/SSLSocketFactory;

    return-object v4

    .line 322
    .end local v0    # "context":Ljavax/net/ssl/SSLContext;
    :catch_0
    move-exception v1

    .line 323
    .local v1, "e":Ljava/security/GeneralSecurityException;
    new-instance v2, Ljava/io/IOException;

    const-string v4, "Security exception configuring SSL context"

    invoke-direct {v2, v4}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    .line 325
    .local v2, "ioException":Ljava/io/IOException;
    invoke-virtual {v2, v1}, Ljava/io/IOException;->initCause(Ljava/lang/Throwable;)Ljava/lang/Throwable;

    .line 326
    new-instance v4, Lcom/synconset/HttpRequest$HttpRequestException;

    invoke-direct {v4, v2}, Lcom/synconset/HttpRequest$HttpRequestException;-><init>(Ljava/io/IOException;)V

    throw v4
.end method

.method private static getTrustedVerifier()Ljavax/net/ssl/HostnameVerifier;
    .locals 1

    .prologue
    .line 334
    sget-object v0, Lcom/synconset/HttpRequest;->TRUSTED_VERIFIER:Ljavax/net/ssl/HostnameVerifier;

    if-nez v0, :cond_0

    .line 335
    new-instance v0, Lcom/synconset/HttpRequest$2;

    invoke-direct {v0}, Lcom/synconset/HttpRequest$2;-><init>()V

    sput-object v0, Lcom/synconset/HttpRequest;->TRUSTED_VERIFIER:Ljavax/net/ssl/HostnameVerifier;

    .line 342
    :cond_0
    sget-object v0, Lcom/synconset/HttpRequest;->TRUSTED_VERIFIER:Ljavax/net/ssl/HostnameVerifier;

    return-object v0
.end method

.method private static getValidCharset(Ljava/lang/String;)Ljava/lang/String;
    .locals 1
    .param p0, "charset"    # Ljava/lang/String;

    .prologue
    .line 277
    if-eqz p0, :cond_0

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v0

    if-lez v0, :cond_0

    .line 280
    .end local p0    # "charset":Ljava/lang/String;
    :goto_0
    return-object p0

    .restart local p0    # "charset":Ljava/lang/String;
    :cond_0
    const-string p0, "UTF-8"

    goto :goto_0
.end method

.method public static head(Ljava/lang/CharSequence;)Lcom/synconset/HttpRequest;
    .locals 2
    .param p0, "url"    # Ljava/lang/CharSequence;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/synconset/HttpRequest$HttpRequestException;
        }
    .end annotation

    .prologue
    .line 1281
    new-instance v0, Lcom/synconset/HttpRequest;

    const-string v1, "HEAD"

    invoke-direct {v0, p0, v1}, Lcom/synconset/HttpRequest;-><init>(Ljava/lang/CharSequence;Ljava/lang/String;)V

    return-object v0
.end method

.method public static head(Ljava/lang/CharSequence;Ljava/util/Map;Z)Lcom/synconset/HttpRequest;
    .locals 2
    .param p0, "baseUrl"    # Ljava/lang/CharSequence;
    .param p2, "encode"    # Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/CharSequence;",
            "Ljava/util/Map",
            "<**>;Z)",
            "Lcom/synconset/HttpRequest;"
        }
    .end annotation

    .prologue
    .line 1311
    .local p1, "params":Ljava/util/Map;, "Ljava/util/Map<**>;"
    invoke-static {p0, p1}, Lcom/synconset/HttpRequest;->append(Ljava/lang/CharSequence;Ljava/util/Map;)Ljava/lang/String;

    move-result-object v0

    .line 1312
    .local v0, "url":Ljava/lang/String;
    if-eqz p2, :cond_0

    invoke-static {v0}, Lcom/synconset/HttpRequest;->encode(Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v0

    .end local v0    # "url":Ljava/lang/String;
    :cond_0
    invoke-static {v0}, Lcom/synconset/HttpRequest;->head(Ljava/lang/CharSequence;)Lcom/synconset/HttpRequest;

    move-result-object v1

    return-object v1
.end method

.method public static varargs head(Ljava/lang/CharSequence;Z[Ljava/lang/Object;)Lcom/synconset/HttpRequest;
    .locals 2
    .param p0, "baseUrl"    # Ljava/lang/CharSequence;
    .param p1, "encode"    # Z
    .param p2, "params"    # [Ljava/lang/Object;

    .prologue
    .line 1332
    invoke-static {p0, p2}, Lcom/synconset/HttpRequest;->append(Ljava/lang/CharSequence;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    .line 1333
    .local v0, "url":Ljava/lang/String;
    if-eqz p1, :cond_0

    invoke-static {v0}, Lcom/synconset/HttpRequest;->encode(Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v0

    .end local v0    # "url":Ljava/lang/String;
    :cond_0
    invoke-static {v0}, Lcom/synconset/HttpRequest;->head(Ljava/lang/CharSequence;)Lcom/synconset/HttpRequest;

    move-result-object v1

    return-object v1
.end method

.method public static head(Ljava/net/URL;)Lcom/synconset/HttpRequest;
    .locals 2
    .param p0, "url"    # Ljava/net/URL;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/synconset/HttpRequest$HttpRequestException;
        }
    .end annotation

    .prologue
    .line 1292
    new-instance v0, Lcom/synconset/HttpRequest;

    const-string v1, "HEAD"

    invoke-direct {v0, p0, v1}, Lcom/synconset/HttpRequest;-><init>(Ljava/net/URL;Ljava/lang/String;)V

    return-object v0
.end method

.method private incrementTotalSize(J)Lcom/synconset/HttpRequest;
    .locals 5
    .param p1, "size"    # J

    .prologue
    .line 2715
    iget-wide v0, p0, Lcom/synconset/HttpRequest;->totalSize:J

    const-wide/16 v2, -0x1

    cmp-long v0, v0, v2

    if-nez v0, :cond_0

    .line 2716
    const-wide/16 v0, 0x0

    iput-wide v0, p0, Lcom/synconset/HttpRequest;->totalSize:J

    .line 2717
    :cond_0
    iget-wide v0, p0, Lcom/synconset/HttpRequest;->totalSize:J

    add-long/2addr v0, p1

    iput-wide v0, p0, Lcom/synconset/HttpRequest;->totalSize:J

    .line 2718
    return-object p0
.end method

.method public static keepAlive(Z)V
    .locals 2
    .param p0, "keepAlive"    # Z

    .prologue
    .line 1390
    const-string v0, "http.keepAlive"

    invoke-static {p0}, Ljava/lang/Boolean;->toString(Z)Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/synconset/HttpRequest;->setProperty(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 1391
    return-void
.end method

.method public static maxConnections(I)V
    .locals 2
    .param p0, "maxConnections"    # I

    .prologue
    .line 1401
    const-string v0, "http.maxConnections"

    invoke-static {p0}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/synconset/HttpRequest;->setProperty(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 1402
    return-void
.end method

.method public static varargs nonProxyHosts([Ljava/lang/String;)V
    .locals 5
    .param p0, "hosts"    # [Ljava/lang/String;

    .prologue
    .line 1441
    if-eqz p0, :cond_1

    array-length v3, p0

    if-lez v3, :cond_1

    .line 1442
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 1443
    .local v2, "separated":Ljava/lang/StringBuilder;
    array-length v3, p0

    add-int/lit8 v1, v3, -0x1

    .line 1444
    .local v1, "last":I
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    if-ge v0, v1, :cond_0

    .line 1445
    aget-object v3, p0, v0

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const/16 v4, 0x7c

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 1444
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 1446
    :cond_0
    aget-object v3, p0, v1

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1447
    const-string v3, "http.nonProxyHosts"

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Lcom/synconset/HttpRequest;->setProperty(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 1450
    .end local v0    # "i":I
    .end local v1    # "last":I
    .end local v2    # "separated":Ljava/lang/StringBuilder;
    :goto_1
    return-void

    .line 1449
    :cond_1
    const-string v3, "http.nonProxyHosts"

    const/4 v4, 0x0

    invoke-static {v3, v4}, Lcom/synconset/HttpRequest;->setProperty(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    goto :goto_1
.end method

.method public static options(Ljava/lang/CharSequence;)Lcom/synconset/HttpRequest;
    .locals 2
    .param p0, "url"    # Ljava/lang/CharSequence;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/synconset/HttpRequest$HttpRequestException;
        }
    .end annotation

    .prologue
    .line 1345
    new-instance v0, Lcom/synconset/HttpRequest;

    const-string v1, "OPTIONS"

    invoke-direct {v0, p0, v1}, Lcom/synconset/HttpRequest;-><init>(Ljava/lang/CharSequence;Ljava/lang/String;)V

    return-object v0
.end method

.method public static options(Ljava/net/URL;)Lcom/synconset/HttpRequest;
    .locals 2
    .param p0, "url"    # Ljava/net/URL;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/synconset/HttpRequest$HttpRequestException;
        }
    .end annotation

    .prologue
    .line 1356
    new-instance v0, Lcom/synconset/HttpRequest;

    const-string v1, "OPTIONS"

    invoke-direct {v0, p0, v1}, Lcom/synconset/HttpRequest;-><init>(Ljava/net/URL;Ljava/lang/String;)V

    return-object v0
.end method

.method public static post(Ljava/lang/CharSequence;)Lcom/synconset/HttpRequest;
    .locals 2
    .param p0, "url"    # Ljava/lang/CharSequence;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/synconset/HttpRequest$HttpRequestException;
        }
    .end annotation

    .prologue
    .line 1089
    new-instance v0, Lcom/synconset/HttpRequest;

    const-string v1, "POST"

    invoke-direct {v0, p0, v1}, Lcom/synconset/HttpRequest;-><init>(Ljava/lang/CharSequence;Ljava/lang/String;)V

    return-object v0
.end method

.method public static post(Ljava/lang/CharSequence;Ljava/util/Map;Z)Lcom/synconset/HttpRequest;
    .locals 2
    .param p0, "baseUrl"    # Ljava/lang/CharSequence;
    .param p2, "encode"    # Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/CharSequence;",
            "Ljava/util/Map",
            "<**>;Z)",
            "Lcom/synconset/HttpRequest;"
        }
    .end annotation

    .prologue
    .line 1119
    .local p1, "params":Ljava/util/Map;, "Ljava/util/Map<**>;"
    invoke-static {p0, p1}, Lcom/synconset/HttpRequest;->append(Ljava/lang/CharSequence;Ljava/util/Map;)Ljava/lang/String;

    move-result-object v0

    .line 1120
    .local v0, "url":Ljava/lang/String;
    if-eqz p2, :cond_0

    invoke-static {v0}, Lcom/synconset/HttpRequest;->encode(Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v0

    .end local v0    # "url":Ljava/lang/String;
    :cond_0
    invoke-static {v0}, Lcom/synconset/HttpRequest;->post(Ljava/lang/CharSequence;)Lcom/synconset/HttpRequest;

    move-result-object v1

    return-object v1
.end method

.method public static varargs post(Ljava/lang/CharSequence;Z[Ljava/lang/Object;)Lcom/synconset/HttpRequest;
    .locals 2
    .param p0, "baseUrl"    # Ljava/lang/CharSequence;
    .param p1, "encode"    # Z
    .param p2, "params"    # [Ljava/lang/Object;

    .prologue
    .line 1140
    invoke-static {p0, p2}, Lcom/synconset/HttpRequest;->append(Ljava/lang/CharSequence;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    .line 1141
    .local v0, "url":Ljava/lang/String;
    if-eqz p1, :cond_0

    invoke-static {v0}, Lcom/synconset/HttpRequest;->encode(Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v0

    .end local v0    # "url":Ljava/lang/String;
    :cond_0
    invoke-static {v0}, Lcom/synconset/HttpRequest;->post(Ljava/lang/CharSequence;)Lcom/synconset/HttpRequest;

    move-result-object v1

    return-object v1
.end method

.method public static post(Ljava/net/URL;)Lcom/synconset/HttpRequest;
    .locals 2
    .param p0, "url"    # Ljava/net/URL;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/synconset/HttpRequest$HttpRequestException;
        }
    .end annotation

    .prologue
    .line 1100
    new-instance v0, Lcom/synconset/HttpRequest;

    const-string v1, "POST"

    invoke-direct {v0, p0, v1}, Lcom/synconset/HttpRequest;-><init>(Ljava/net/URL;Ljava/lang/String;)V

    return-object v0
.end method

.method public static proxyHost(Ljava/lang/String;)V
    .locals 1
    .param p0, "host"    # Ljava/lang/String;

    .prologue
    .line 1413
    const-string v0, "http.proxyHost"

    invoke-static {v0, p0}, Lcom/synconset/HttpRequest;->setProperty(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 1414
    const-string v0, "https.proxyHost"

    invoke-static {v0, p0}, Lcom/synconset/HttpRequest;->setProperty(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 1415
    return-void
.end method

.method public static proxyPort(I)V
    .locals 2
    .param p0, "port"    # I

    .prologue
    .line 1426
    invoke-static {p0}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v0

    .line 1427
    .local v0, "portValue":Ljava/lang/String;
    const-string v1, "http.proxyPort"

    invoke-static {v1, v0}, Lcom/synconset/HttpRequest;->setProperty(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 1428
    const-string v1, "https.proxyPort"

    invoke-static {v1, v0}, Lcom/synconset/HttpRequest;->setProperty(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 1429
    return-void
.end method

.method public static put(Ljava/lang/CharSequence;)Lcom/synconset/HttpRequest;
    .locals 2
    .param p0, "url"    # Ljava/lang/CharSequence;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/synconset/HttpRequest$HttpRequestException;
        }
    .end annotation

    .prologue
    .line 1153
    new-instance v0, Lcom/synconset/HttpRequest;

    const-string v1, "PUT"

    invoke-direct {v0, p0, v1}, Lcom/synconset/HttpRequest;-><init>(Ljava/lang/CharSequence;Ljava/lang/String;)V

    return-object v0
.end method

.method public static put(Ljava/lang/CharSequence;Ljava/util/Map;Z)Lcom/synconset/HttpRequest;
    .locals 2
    .param p0, "baseUrl"    # Ljava/lang/CharSequence;
    .param p2, "encode"    # Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/CharSequence;",
            "Ljava/util/Map",
            "<**>;Z)",
            "Lcom/synconset/HttpRequest;"
        }
    .end annotation

    .prologue
    .line 1183
    .local p1, "params":Ljava/util/Map;, "Ljava/util/Map<**>;"
    invoke-static {p0, p1}, Lcom/synconset/HttpRequest;->append(Ljava/lang/CharSequence;Ljava/util/Map;)Ljava/lang/String;

    move-result-object v0

    .line 1184
    .local v0, "url":Ljava/lang/String;
    if-eqz p2, :cond_0

    invoke-static {v0}, Lcom/synconset/HttpRequest;->encode(Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v0

    .end local v0    # "url":Ljava/lang/String;
    :cond_0
    invoke-static {v0}, Lcom/synconset/HttpRequest;->put(Ljava/lang/CharSequence;)Lcom/synconset/HttpRequest;

    move-result-object v1

    return-object v1
.end method

.method public static varargs put(Ljava/lang/CharSequence;Z[Ljava/lang/Object;)Lcom/synconset/HttpRequest;
    .locals 2
    .param p0, "baseUrl"    # Ljava/lang/CharSequence;
    .param p1, "encode"    # Z
    .param p2, "params"    # [Ljava/lang/Object;

    .prologue
    .line 1204
    invoke-static {p0, p2}, Lcom/synconset/HttpRequest;->append(Ljava/lang/CharSequence;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    .line 1205
    .local v0, "url":Ljava/lang/String;
    if-eqz p1, :cond_0

    invoke-static {v0}, Lcom/synconset/HttpRequest;->encode(Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v0

    .end local v0    # "url":Ljava/lang/String;
    :cond_0
    invoke-static {v0}, Lcom/synconset/HttpRequest;->put(Ljava/lang/CharSequence;)Lcom/synconset/HttpRequest;

    move-result-object v1

    return-object v1
.end method

.method public static put(Ljava/net/URL;)Lcom/synconset/HttpRequest;
    .locals 2
    .param p0, "url"    # Ljava/net/URL;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/synconset/HttpRequest$HttpRequestException;
        }
    .end annotation

    .prologue
    .line 1164
    new-instance v0, Lcom/synconset/HttpRequest;

    const-string v1, "PUT"

    invoke-direct {v0, p0, v1}, Lcom/synconset/HttpRequest;-><init>(Ljava/net/URL;Ljava/lang/String;)V

    return-object v0
.end method

.method public static setConnectionFactory(Lcom/synconset/HttpRequest$ConnectionFactory;)V
    .locals 1
    .param p0, "connectionFactory"    # Lcom/synconset/HttpRequest$ConnectionFactory;

    .prologue
    .line 409
    if-nez p0, :cond_0

    .line 410
    sget-object v0, Lcom/synconset/HttpRequest$ConnectionFactory;->DEFAULT:Lcom/synconset/HttpRequest$ConnectionFactory;

    sput-object v0, Lcom/synconset/HttpRequest;->CONNECTION_FACTORY:Lcom/synconset/HttpRequest$ConnectionFactory;

    .line 413
    :goto_0
    return-void

    .line 412
    :cond_0
    sput-object p0, Lcom/synconset/HttpRequest;->CONNECTION_FACTORY:Lcom/synconset/HttpRequest$ConnectionFactory;

    goto :goto_0
.end method

.method private static setProperty(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 2
    .param p0, "name"    # Ljava/lang/String;
    .param p1, "value"    # Ljava/lang/String;

    .prologue
    .line 1463
    if-eqz p1, :cond_0

    .line 1464
    new-instance v0, Lcom/synconset/HttpRequest$3;

    invoke-direct {v0, p0, p1}, Lcom/synconset/HttpRequest$3;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 1477
    .local v0, "action":Ljava/security/PrivilegedAction;, "Ljava/security/PrivilegedAction<Ljava/lang/String;>;"
    :goto_0
    invoke-static {v0}, Ljava/security/AccessController;->doPrivileged(Ljava/security/PrivilegedAction;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    return-object v1

    .line 1471
    .end local v0    # "action":Ljava/security/PrivilegedAction;, "Ljava/security/PrivilegedAction<Ljava/lang/String;>;"
    :cond_0
    new-instance v0, Lcom/synconset/HttpRequest$4;

    invoke-direct {v0, p0}, Lcom/synconset/HttpRequest$4;-><init>(Ljava/lang/String;)V

    .restart local v0    # "action":Ljava/security/PrivilegedAction;, "Ljava/security/PrivilegedAction<Ljava/lang/String;>;"
    goto :goto_0
.end method

.method public static trace(Ljava/lang/CharSequence;)Lcom/synconset/HttpRequest;
    .locals 2
    .param p0, "url"    # Ljava/lang/CharSequence;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/synconset/HttpRequest$HttpRequestException;
        }
    .end annotation

    .prologue
    .line 1368
    new-instance v0, Lcom/synconset/HttpRequest;

    const-string v1, "TRACE"

    invoke-direct {v0, p0, v1}, Lcom/synconset/HttpRequest;-><init>(Ljava/lang/CharSequence;Ljava/lang/String;)V

    return-object v0
.end method

.method public static trace(Ljava/net/URL;)Lcom/synconset/HttpRequest;
    .locals 2
    .param p0, "url"    # Ljava/net/URL;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/synconset/HttpRequest$HttpRequestException;
        }
    .end annotation

    .prologue
    .line 1379
    new-instance v0, Lcom/synconset/HttpRequest;

    const-string v1, "TRACE"

    invoke-direct {v0, p0, v1}, Lcom/synconset/HttpRequest;-><init>(Ljava/net/URL;Ljava/lang/String;)V

    return-object v0
.end method


# virtual methods
.method public accept(Ljava/lang/String;)Lcom/synconset/HttpRequest;
    .locals 1
    .param p1, "accept"    # Ljava/lang/String;

    .prologue
    .line 2636
    const-string v0, "Accept"

    invoke-virtual {p0, v0, p1}, Lcom/synconset/HttpRequest;->header(Ljava/lang/String;Ljava/lang/String;)Lcom/synconset/HttpRequest;

    move-result-object v0

    return-object v0
.end method

.method public acceptCharset(Ljava/lang/String;)Lcom/synconset/HttpRequest;
    .locals 1
    .param p1, "acceptCharset"    # Ljava/lang/String;

    .prologue
    .line 2425
    const-string v0, "Accept-Charset"

    invoke-virtual {p0, v0, p1}, Lcom/synconset/HttpRequest;->header(Ljava/lang/String;Ljava/lang/String;)Lcom/synconset/HttpRequest;

    move-result-object v0

    return-object v0
.end method

.method public acceptEncoding(Ljava/lang/String;)Lcom/synconset/HttpRequest;
    .locals 1
    .param p1, "acceptEncoding"    # Ljava/lang/String;

    .prologue
    .line 2405
    const-string v0, "Accept-Encoding"

    invoke-virtual {p0, v0, p1}, Lcom/synconset/HttpRequest;->header(Ljava/lang/String;Ljava/lang/String;)Lcom/synconset/HttpRequest;

    move-result-object v0

    return-object v0
.end method

.method public acceptGzipEncoding()Lcom/synconset/HttpRequest;
    .locals 1

    .prologue
    .line 2415
    const-string v0, "gzip"

    invoke-virtual {p0, v0}, Lcom/synconset/HttpRequest;->acceptEncoding(Ljava/lang/String;)Lcom/synconset/HttpRequest;

    move-result-object v0

    return-object v0
.end method

.method public acceptJson()Lcom/synconset/HttpRequest;
    .locals 1

    .prologue
    .line 2645
    const-string v0, "application/json"

    invoke-virtual {p0, v0}, Lcom/synconset/HttpRequest;->accept(Ljava/lang/String;)Lcom/synconset/HttpRequest;

    move-result-object v0

    return-object v0
.end method

.method public authorization(Ljava/lang/String;)Lcom/synconset/HttpRequest;
    .locals 1
    .param p1, "authorization"    # Ljava/lang/String;

    .prologue
    .line 2507
    const-string v0, "Authorization"

    invoke-virtual {p0, v0, p1}, Lcom/synconset/HttpRequest;->header(Ljava/lang/String;Ljava/lang/String;)Lcom/synconset/HttpRequest;

    move-result-object v0

    return-object v0
.end method

.method public badRequest()Z
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/synconset/HttpRequest$HttpRequestException;
        }
    .end annotation

    .prologue
    .line 1672
    const/16 v0, 0x190

    invoke-virtual {p0}, Lcom/synconset/HttpRequest;->code()I

    move-result v1

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public basic(Ljava/lang/String;Ljava/lang/String;)Lcom/synconset/HttpRequest;
    .locals 3
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "password"    # Ljava/lang/String;

    .prologue
    .line 2529
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "Basic "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const/16 v2, 0x3a

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lcom/synconset/HttpRequest$Base64;->encode(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/synconset/HttpRequest;->authorization(Ljava/lang/String;)Lcom/synconset/HttpRequest;

    move-result-object v0

    return-object v0
.end method

.method public body(Ljava/util/concurrent/atomic/AtomicReference;)Lcom/synconset/HttpRequest;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/concurrent/atomic/AtomicReference",
            "<",
            "Ljava/lang/String;",
            ">;)",
            "Lcom/synconset/HttpRequest;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/synconset/HttpRequest$HttpRequestException;
        }
    .end annotation

    .prologue
    .line 1836
    .local p1, "output":Ljava/util/concurrent/atomic/AtomicReference;, "Ljava/util/concurrent/atomic/AtomicReference<Ljava/lang/String;>;"
    invoke-virtual {p0}, Lcom/synconset/HttpRequest;->body()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Ljava/util/concurrent/atomic/AtomicReference;->set(Ljava/lang/Object;)V

    .line 1837
    return-object p0
.end method

.method public body(Ljava/util/concurrent/atomic/AtomicReference;Ljava/lang/String;)Lcom/synconset/HttpRequest;
    .locals 1
    .param p2, "charset"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/concurrent/atomic/AtomicReference",
            "<",
            "Ljava/lang/String;",
            ">;",
            "Ljava/lang/String;",
            ")",
            "Lcom/synconset/HttpRequest;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/synconset/HttpRequest$HttpRequestException;
        }
    .end annotation

    .prologue
    .line 1850
    .local p1, "output":Ljava/util/concurrent/atomic/AtomicReference;, "Ljava/util/concurrent/atomic/AtomicReference<Ljava/lang/String;>;"
    invoke-virtual {p0, p2}, Lcom/synconset/HttpRequest;->body(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Ljava/util/concurrent/atomic/AtomicReference;->set(Ljava/lang/Object;)V

    .line 1851
    return-object p0
.end method

.method public body()Ljava/lang/String;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/synconset/HttpRequest$HttpRequestException;
        }
    .end annotation

    .prologue
    .line 1824
    invoke-virtual {p0}, Lcom/synconset/HttpRequest;->charset()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/synconset/HttpRequest;->body(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public body(Ljava/lang/String;)Ljava/lang/String;
    .locals 3
    .param p1, "charset"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/synconset/HttpRequest$HttpRequestException;
        }
    .end annotation

    .prologue
    .line 1807
    invoke-virtual {p0}, Lcom/synconset/HttpRequest;->byteStream()Ljava/io/ByteArrayOutputStream;

    move-result-object v1

    .line 1809
    .local v1, "output":Ljava/io/ByteArrayOutputStream;
    :try_start_0
    invoke-virtual {p0}, Lcom/synconset/HttpRequest;->buffer()Ljava/io/BufferedInputStream;

    move-result-object v2

    invoke-virtual {p0, v2, v1}, Lcom/synconset/HttpRequest;->copy(Ljava/io/InputStream;Ljava/io/OutputStream;)Lcom/synconset/HttpRequest;

    .line 1810
    invoke-static {p1}, Lcom/synconset/HttpRequest;->getValidCharset(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/io/ByteArrayOutputStream;->toString(Ljava/lang/String;)Ljava/lang/String;
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v2

    return-object v2

    .line 1811
    :catch_0
    move-exception v0

    .line 1812
    .local v0, "e":Ljava/io/IOException;
    new-instance v2, Lcom/synconset/HttpRequest$HttpRequestException;

    invoke-direct {v2, v0}, Lcom/synconset/HttpRequest$HttpRequestException;-><init>(Ljava/io/IOException;)V

    throw v2
.end method

.method public buffer()Ljava/io/BufferedInputStream;
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/synconset/HttpRequest$HttpRequestException;
        }
    .end annotation

    .prologue
    .line 1889
    new-instance v0, Ljava/io/BufferedInputStream;

    invoke-virtual {p0}, Lcom/synconset/HttpRequest;->stream()Ljava/io/InputStream;

    move-result-object v1

    iget v2, p0, Lcom/synconset/HttpRequest;->bufferSize:I

    invoke-direct {v0, v1, v2}, Ljava/io/BufferedInputStream;-><init>(Ljava/io/InputStream;I)V

    return-object v0
.end method

.method public bufferSize()I
    .locals 1

    .prologue
    .line 1757
    iget v0, p0, Lcom/synconset/HttpRequest;->bufferSize:I

    return v0
.end method

.method public bufferSize(I)Lcom/synconset/HttpRequest;
    .locals 2
    .param p1, "size"    # I

    .prologue
    .line 1743
    const/4 v0, 0x1

    if-ge p1, v0, :cond_0

    .line 1744
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "Size must be greater than zero"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 1745
    :cond_0
    iput p1, p0, Lcom/synconset/HttpRequest;->bufferSize:I

    .line 1746
    return-object p0
.end method

.method public bufferedReader()Ljava/io/BufferedReader;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/synconset/HttpRequest$HttpRequestException;
        }
    .end annotation

    .prologue
    .line 1983
    invoke-virtual {p0}, Lcom/synconset/HttpRequest;->charset()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/synconset/HttpRequest;->bufferedReader(Ljava/lang/String;)Ljava/io/BufferedReader;

    move-result-object v0

    return-object v0
.end method

.method public bufferedReader(Ljava/lang/String;)Ljava/io/BufferedReader;
    .locals 3
    .param p1, "charset"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/synconset/HttpRequest$HttpRequestException;
        }
    .end annotation

    .prologue
    .line 1971
    new-instance v0, Ljava/io/BufferedReader;

    invoke-virtual {p0, p1}, Lcom/synconset/HttpRequest;->reader(Ljava/lang/String;)Ljava/io/InputStreamReader;

    move-result-object v1

    iget v2, p0, Lcom/synconset/HttpRequest;->bufferSize:I

    invoke-direct {v0, v1, v2}, Ljava/io/BufferedReader;-><init>(Ljava/io/Reader;I)V

    return-object v0
.end method

.method protected byteStream()Ljava/io/ByteArrayOutputStream;
    .locals 2

    .prologue
    .line 1789
    invoke-virtual {p0}, Lcom/synconset/HttpRequest;->contentLength()I

    move-result v0

    .line 1790
    .local v0, "size":I
    if-lez v0, :cond_0

    .line 1791
    new-instance v1, Ljava/io/ByteArrayOutputStream;

    invoke-direct {v1, v0}, Ljava/io/ByteArrayOutputStream;-><init>(I)V

    .line 1793
    :goto_0
    return-object v1

    :cond_0
    new-instance v1, Ljava/io/ByteArrayOutputStream;

    invoke-direct {v1}, Ljava/io/ByteArrayOutputStream;-><init>()V

    goto :goto_0
.end method

.method public bytes()[B
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/synconset/HttpRequest$HttpRequestException;
        }
    .end annotation

    .prologue
    .line 1872
    invoke-virtual {p0}, Lcom/synconset/HttpRequest;->byteStream()Ljava/io/ByteArrayOutputStream;

    move-result-object v1

    .line 1874
    .local v1, "output":Ljava/io/ByteArrayOutputStream;
    :try_start_0
    invoke-virtual {p0}, Lcom/synconset/HttpRequest;->buffer()Ljava/io/BufferedInputStream;

    move-result-object v2

    invoke-virtual {p0, v2, v1}, Lcom/synconset/HttpRequest;->copy(Ljava/io/InputStream;Ljava/io/OutputStream;)Lcom/synconset/HttpRequest;
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 1878
    invoke-virtual {v1}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    move-result-object v2

    return-object v2

    .line 1875
    :catch_0
    move-exception v0

    .line 1876
    .local v0, "e":Ljava/io/IOException;
    new-instance v2, Lcom/synconset/HttpRequest$HttpRequestException;

    invoke-direct {v2, v0}, Lcom/synconset/HttpRequest$HttpRequestException;-><init>(Ljava/io/IOException;)V

    throw v2
.end method

.method public cacheControl()Ljava/lang/String;
    .locals 1

    .prologue
    .line 2461
    const-string v0, "Cache-Control"

    invoke-virtual {p0, v0}, Lcom/synconset/HttpRequest;->header(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public charset()Ljava/lang/String;
    .locals 2

    .prologue
    .line 2364
    const-string v0, "Content-Type"

    const-string v1, "charset"

    invoke-virtual {p0, v0, v1}, Lcom/synconset/HttpRequest;->parameter(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public chunk(I)Lcom/synconset/HttpRequest;
    .locals 1
    .param p1, "size"    # I

    .prologue
    .line 1727
    invoke-virtual {p0}, Lcom/synconset/HttpRequest;->getConnection()Ljava/net/HttpURLConnection;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/net/HttpURLConnection;->setChunkedStreamingMode(I)V

    .line 1728
    return-object p0
.end method

.method protected closeOutput()Lcom/synconset/HttpRequest;
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v2, 0x0

    .line 2729
    invoke-virtual {p0, v2}, Lcom/synconset/HttpRequest;->progress(Lcom/synconset/HttpRequest$UploadProgress;)Lcom/synconset/HttpRequest;

    .line 2730
    iget-object v0, p0, Lcom/synconset/HttpRequest;->output:Lcom/synconset/HttpRequest$RequestOutputStream;

    if-nez v0, :cond_0

    .line 2743
    :goto_0
    return-object p0

    .line 2732
    :cond_0
    iget-boolean v0, p0, Lcom/synconset/HttpRequest;->multipart:Z

    if-eqz v0, :cond_1

    .line 2733
    iget-object v0, p0, Lcom/synconset/HttpRequest;->output:Lcom/synconset/HttpRequest$RequestOutputStream;

    const-string v1, "\r\n--00content0boundary00--\r\n"

    invoke-virtual {v0, v1}, Lcom/synconset/HttpRequest$RequestOutputStream;->write(Ljava/lang/String;)Lcom/synconset/HttpRequest$RequestOutputStream;

    .line 2734
    :cond_1
    iget-boolean v0, p0, Lcom/synconset/HttpRequest;->ignoreCloseExceptions:Z

    if-eqz v0, :cond_2

    .line 2736
    :try_start_0
    iget-object v0, p0, Lcom/synconset/HttpRequest;->output:Lcom/synconset/HttpRequest$RequestOutputStream;

    invoke-virtual {v0}, Lcom/synconset/HttpRequest$RequestOutputStream;->close()V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 2742
    :goto_1
    iput-object v2, p0, Lcom/synconset/HttpRequest;->output:Lcom/synconset/HttpRequest$RequestOutputStream;

    goto :goto_0

    .line 2741
    :cond_2
    iget-object v0, p0, Lcom/synconset/HttpRequest;->output:Lcom/synconset/HttpRequest$RequestOutputStream;

    invoke-virtual {v0}, Lcom/synconset/HttpRequest$RequestOutputStream;->close()V

    goto :goto_1

    .line 2737
    :catch_0
    move-exception v0

    goto :goto_1
.end method

.method protected closeOutputQuietly()Lcom/synconset/HttpRequest;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/synconset/HttpRequest$HttpRequestException;
        }
    .end annotation

    .prologue
    .line 2755
    :try_start_0
    invoke-virtual {p0}, Lcom/synconset/HttpRequest;->closeOutput()Lcom/synconset/HttpRequest;
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v1

    return-object v1

    .line 2756
    :catch_0
    move-exception v0

    .line 2757
    .local v0, "e":Ljava/io/IOException;
    new-instance v1, Lcom/synconset/HttpRequest$HttpRequestException;

    invoke-direct {v1, v0}, Lcom/synconset/HttpRequest$HttpRequestException;-><init>(Ljava/io/IOException;)V

    throw v1
.end method

.method public code()I
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/synconset/HttpRequest$HttpRequestException;
        }
    .end annotation

    .prologue
    .line 1604
    :try_start_0
    invoke-virtual {p0}, Lcom/synconset/HttpRequest;->closeOutput()Lcom/synconset/HttpRequest;

    .line 1605
    invoke-virtual {p0}, Lcom/synconset/HttpRequest;->getConnection()Ljava/net/HttpURLConnection;

    move-result-object v1

    invoke-virtual {v1}, Ljava/net/HttpURLConnection;->getResponseCode()I
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    move-result v1

    return v1

    .line 1606
    :catch_0
    move-exception v0

    .line 1607
    .local v0, "e":Ljava/io/IOException;
    new-instance v1, Lcom/synconset/HttpRequest$HttpRequestException;

    invoke-direct {v1, v0}, Lcom/synconset/HttpRequest$HttpRequestException;-><init>(Ljava/io/IOException;)V

    throw v1
.end method

.method public code(Ljava/util/concurrent/atomic/AtomicInteger;)Lcom/synconset/HttpRequest;
    .locals 1
    .param p1, "output"    # Ljava/util/concurrent/atomic/AtomicInteger;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/synconset/HttpRequest$HttpRequestException;
        }
    .end annotation

    .prologue
    .line 1621
    invoke-virtual {p0}, Lcom/synconset/HttpRequest;->code()I

    move-result v0

    invoke-virtual {p1, v0}, Ljava/util/concurrent/atomic/AtomicInteger;->set(I)V

    .line 1622
    return-object p0
.end method

.method public connectTimeout(I)Lcom/synconset/HttpRequest;
    .locals 1
    .param p1, "timeout"    # I

    .prologue
    .line 2099
    invoke-virtual {p0}, Lcom/synconset/HttpRequest;->getConnection()Ljava/net/HttpURLConnection;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/net/HttpURLConnection;->setConnectTimeout(I)V

    .line 2100
    return-object p0
.end method

.method public contentEncoding()Ljava/lang/String;
    .locals 1

    .prologue
    .line 2434
    const-string v0, "Content-Encoding"

    invoke-virtual {p0, v0}, Lcom/synconset/HttpRequest;->header(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public contentLength()I
    .locals 1

    .prologue
    .line 2605
    const-string v0, "Content-Length"

    invoke-virtual {p0, v0}, Lcom/synconset/HttpRequest;->intHeader(Ljava/lang/String;)I

    move-result v0

    return v0
.end method

.method public contentLength(I)Lcom/synconset/HttpRequest;
    .locals 1
    .param p1, "contentLength"    # I

    .prologue
    .line 2625
    invoke-virtual {p0}, Lcom/synconset/HttpRequest;->getConnection()Ljava/net/HttpURLConnection;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/net/HttpURLConnection;->setFixedLengthStreamingMode(I)V

    .line 2626
    return-object p0
.end method

.method public contentLength(Ljava/lang/String;)Lcom/synconset/HttpRequest;
    .locals 1
    .param p1, "contentLength"    # Ljava/lang/String;

    .prologue
    .line 2615
    invoke-static {p1}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v0

    invoke-virtual {p0, v0}, Lcom/synconset/HttpRequest;->contentLength(I)Lcom/synconset/HttpRequest;

    move-result-object v0

    return-object v0
.end method

.method public contentType(Ljava/lang/String;)Lcom/synconset/HttpRequest;
    .locals 1
    .param p1, "contentType"    # Ljava/lang/String;

    .prologue
    .line 2572
    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0}, Lcom/synconset/HttpRequest;->contentType(Ljava/lang/String;Ljava/lang/String;)Lcom/synconset/HttpRequest;

    move-result-object v0

    return-object v0
.end method

.method public contentType(Ljava/lang/String;Ljava/lang/String;)Lcom/synconset/HttpRequest;
    .locals 4
    .param p1, "contentType"    # Ljava/lang/String;
    .param p2, "charset"    # Ljava/lang/String;

    .prologue
    .line 2583
    if-eqz p2, :cond_0

    invoke-virtual {p2}, Ljava/lang/String;->length()I

    move-result v1

    if-lez v1, :cond_0

    .line 2584
    const-string v0, "; charset="

    .line 2585
    .local v0, "separator":Ljava/lang/String;
    const-string v1, "Content-Type"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "; charset="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p0, v1, v2}, Lcom/synconset/HttpRequest;->header(Ljava/lang/String;Ljava/lang/String;)Lcom/synconset/HttpRequest;

    move-result-object v1

    .line 2587
    .end local v0    # "separator":Ljava/lang/String;
    :goto_0
    return-object v1

    :cond_0
    const-string v1, "Content-Type"

    invoke-virtual {p0, v1, p1}, Lcom/synconset/HttpRequest;->header(Ljava/lang/String;Ljava/lang/String;)Lcom/synconset/HttpRequest;

    move-result-object v1

    goto :goto_0
.end method

.method public contentType()Ljava/lang/String;
    .locals 1

    .prologue
    .line 2596
    const-string v0, "Content-Type"

    invoke-virtual {p0, v0}, Lcom/synconset/HttpRequest;->header(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method protected copy(Ljava/io/InputStream;Ljava/io/OutputStream;)Lcom/synconset/HttpRequest;
    .locals 6
    .param p1, "input"    # Ljava/io/InputStream;
    .param p2, "output"    # Ljava/io/OutputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 2658
    new-instance v0, Lcom/synconset/HttpRequest$8;

    iget-boolean v3, p0, Lcom/synconset/HttpRequest;->ignoreCloseExceptions:Z

    move-object v1, p0

    move-object v2, p1

    move-object v4, p1

    move-object v5, p2

    invoke-direct/range {v0 .. v5}, Lcom/synconset/HttpRequest$8;-><init>(Lcom/synconset/HttpRequest;Ljava/io/Closeable;ZLjava/io/InputStream;Ljava/io/OutputStream;)V

    invoke-virtual {v0}, Lcom/synconset/HttpRequest$8;->call()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/synconset/HttpRequest;

    return-object v0
.end method

.method protected copy(Ljava/io/Reader;Ljava/io/Writer;)Lcom/synconset/HttpRequest;
    .locals 6
    .param p1, "input"    # Ljava/io/Reader;
    .param p2, "output"    # Ljava/io/Writer;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 2684
    new-instance v0, Lcom/synconset/HttpRequest$9;

    iget-boolean v3, p0, Lcom/synconset/HttpRequest;->ignoreCloseExceptions:Z

    move-object v1, p0

    move-object v2, p1

    move-object v4, p1

    move-object v5, p2

    invoke-direct/range {v0 .. v5}, Lcom/synconset/HttpRequest$9;-><init>(Lcom/synconset/HttpRequest;Ljava/io/Closeable;ZLjava/io/Reader;Ljava/io/Writer;)V

    invoke-virtual {v0}, Lcom/synconset/HttpRequest$9;->call()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/synconset/HttpRequest;

    return-object v0
.end method

.method public created()Z
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/synconset/HttpRequest$HttpRequestException;
        }
    .end annotation

    .prologue
    .line 1642
    const/16 v0, 0xc9

    invoke-virtual {p0}, Lcom/synconset/HttpRequest;->code()I

    move-result v1

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public date()J
    .locals 2

    .prologue
    .line 2452
    const-string v0, "Date"

    invoke-virtual {p0, v0}, Lcom/synconset/HttpRequest;->dateHeader(Ljava/lang/String;)J

    move-result-wide v0

    return-wide v0
.end method

.method public dateHeader(Ljava/lang/String;)J
    .locals 2
    .param p1, "name"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/synconset/HttpRequest$HttpRequestException;
        }
    .end annotation

    .prologue
    .line 2182
    const-wide/16 v0, -0x1

    invoke-virtual {p0, p1, v0, v1}, Lcom/synconset/HttpRequest;->dateHeader(Ljava/lang/String;J)J

    move-result-wide v0

    return-wide v0
.end method

.method public dateHeader(Ljava/lang/String;J)J
    .locals 2
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "defaultValue"    # J
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/synconset/HttpRequest$HttpRequestException;
        }
    .end annotation

    .prologue
    .line 2196
    invoke-virtual {p0}, Lcom/synconset/HttpRequest;->closeOutputQuietly()Lcom/synconset/HttpRequest;

    .line 2197
    invoke-virtual {p0}, Lcom/synconset/HttpRequest;->getConnection()Ljava/net/HttpURLConnection;

    move-result-object v0

    invoke-virtual {v0, p1, p2, p3}, Ljava/net/HttpURLConnection;->getHeaderFieldDate(Ljava/lang/String;J)J

    move-result-wide v0

    return-wide v0
.end method

.method public disconnect()Lcom/synconset/HttpRequest;
    .locals 1

    .prologue
    .line 1716
    invoke-virtual {p0}, Lcom/synconset/HttpRequest;->getConnection()Ljava/net/HttpURLConnection;

    move-result-object v0

    invoke-virtual {v0}, Ljava/net/HttpURLConnection;->disconnect()V

    .line 1717
    return-object p0
.end method

.method public eTag()Ljava/lang/String;
    .locals 1

    .prologue
    .line 2470
    const-string v0, "ETag"

    invoke-virtual {p0, v0}, Lcom/synconset/HttpRequest;->header(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public expires()J
    .locals 2

    .prologue
    .line 2479
    const-string v0, "Expires"

    invoke-virtual {p0, v0}, Lcom/synconset/HttpRequest;->dateHeader(Ljava/lang/String;)J

    move-result-wide v0

    return-wide v0
.end method

.method public followRedirects(Z)Lcom/synconset/HttpRequest;
    .locals 1
    .param p1, "followRedirects"    # Z

    .prologue
    .line 3320
    invoke-virtual {p0}, Lcom/synconset/HttpRequest;->getConnection()Ljava/net/HttpURLConnection;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/net/HttpURLConnection;->setInstanceFollowRedirects(Z)V

    .line 3321
    return-object p0
.end method

.method public form(Ljava/lang/Object;Ljava/lang/Object;)Lcom/synconset/HttpRequest;
    .locals 1
    .param p1, "name"    # Ljava/lang/Object;
    .param p2, "value"    # Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/synconset/HttpRequest$HttpRequestException;
        }
    .end annotation

    .prologue
    .line 3172
    const-string v0, "UTF-8"

    invoke-virtual {p0, p1, p2, v0}, Lcom/synconset/HttpRequest;->form(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/String;)Lcom/synconset/HttpRequest;

    move-result-object v0

    return-object v0
.end method

.method public form(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/String;)Lcom/synconset/HttpRequest;
    .locals 4
    .param p1, "name"    # Ljava/lang/Object;
    .param p2, "value"    # Ljava/lang/Object;
    .param p3, "charset"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/synconset/HttpRequest$HttpRequestException;
        }
    .end annotation

    .prologue
    const/4 v2, 0x1

    .line 3189
    iget-boolean v3, p0, Lcom/synconset/HttpRequest;->form:Z

    if-nez v3, :cond_3

    move v1, v2

    .line 3190
    .local v1, "first":Z
    :goto_0
    if-eqz v1, :cond_0

    .line 3191
    const-string v3, "application/x-www-form-urlencoded"

    invoke-virtual {p0, v3, p3}, Lcom/synconset/HttpRequest;->contentType(Ljava/lang/String;Ljava/lang/String;)Lcom/synconset/HttpRequest;

    .line 3192
    iput-boolean v2, p0, Lcom/synconset/HttpRequest;->form:Z

    .line 3194
    :cond_0
    invoke-static {p3}, Lcom/synconset/HttpRequest;->getValidCharset(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p3

    .line 3196
    :try_start_0
    invoke-virtual {p0}, Lcom/synconset/HttpRequest;->openOutput()Lcom/synconset/HttpRequest;

    .line 3197
    if-nez v1, :cond_1

    .line 3198
    iget-object v2, p0, Lcom/synconset/HttpRequest;->output:Lcom/synconset/HttpRequest$RequestOutputStream;

    const/16 v3, 0x26

    invoke-virtual {v2, v3}, Lcom/synconset/HttpRequest$RequestOutputStream;->write(I)V

    .line 3199
    :cond_1
    iget-object v2, p0, Lcom/synconset/HttpRequest;->output:Lcom/synconset/HttpRequest$RequestOutputStream;

    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v3, p3}, Ljava/net/URLEncoder;->encode(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Lcom/synconset/HttpRequest$RequestOutputStream;->write(Ljava/lang/String;)Lcom/synconset/HttpRequest$RequestOutputStream;

    .line 3200
    iget-object v2, p0, Lcom/synconset/HttpRequest;->output:Lcom/synconset/HttpRequest$RequestOutputStream;

    const/16 v3, 0x3d

    invoke-virtual {v2, v3}, Lcom/synconset/HttpRequest$RequestOutputStream;->write(I)V

    .line 3201
    if-eqz p2, :cond_2

    .line 3202
    iget-object v2, p0, Lcom/synconset/HttpRequest;->output:Lcom/synconset/HttpRequest$RequestOutputStream;

    invoke-virtual {p2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v3, p3}, Ljava/net/URLEncoder;->encode(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Lcom/synconset/HttpRequest$RequestOutputStream;->write(Ljava/lang/String;)Lcom/synconset/HttpRequest$RequestOutputStream;
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 3206
    :cond_2
    return-object p0

    .line 3189
    .end local v1    # "first":Z
    :cond_3
    const/4 v1, 0x0

    goto :goto_0

    .line 3203
    .restart local v1    # "first":Z
    :catch_0
    move-exception v0

    .line 3204
    .local v0, "e":Ljava/io/IOException;
    new-instance v2, Lcom/synconset/HttpRequest$HttpRequestException;

    invoke-direct {v2, v0}, Lcom/synconset/HttpRequest$HttpRequestException;-><init>(Ljava/io/IOException;)V

    throw v2
.end method

.method public form(Ljava/util/Map$Entry;)Lcom/synconset/HttpRequest;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map$Entry",
            "<**>;)",
            "Lcom/synconset/HttpRequest;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/synconset/HttpRequest$HttpRequestException;
        }
    .end annotation

    .prologue
    .line 3140
    .local p1, "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<**>;"
    const-string v0, "UTF-8"

    invoke-virtual {p0, p1, v0}, Lcom/synconset/HttpRequest;->form(Ljava/util/Map$Entry;Ljava/lang/String;)Lcom/synconset/HttpRequest;

    move-result-object v0

    return-object v0
.end method

.method public form(Ljava/util/Map$Entry;Ljava/lang/String;)Lcom/synconset/HttpRequest;
    .locals 2
    .param p2, "charset"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map$Entry",
            "<**>;",
            "Ljava/lang/String;",
            ")",
            "Lcom/synconset/HttpRequest;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/synconset/HttpRequest$HttpRequestException;
        }
    .end annotation

    .prologue
    .line 3156
    .local p1, "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<**>;"
    invoke-interface {p1}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v0

    invoke-interface {p1}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v1

    invoke-virtual {p0, v0, v1, p2}, Lcom/synconset/HttpRequest;->form(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/String;)Lcom/synconset/HttpRequest;

    move-result-object v0

    return-object v0
.end method

.method public form(Ljava/util/Map;)Lcom/synconset/HttpRequest;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map",
            "<**>;)",
            "Lcom/synconset/HttpRequest;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/synconset/HttpRequest$HttpRequestException;
        }
    .end annotation

    .prologue
    .line 3126
    .local p1, "values":Ljava/util/Map;, "Ljava/util/Map<**>;"
    const-string v0, "UTF-8"

    invoke-virtual {p0, p1, v0}, Lcom/synconset/HttpRequest;->form(Ljava/util/Map;Ljava/lang/String;)Lcom/synconset/HttpRequest;

    move-result-object v0

    return-object v0
.end method

.method public form(Ljava/util/Map;Ljava/lang/String;)Lcom/synconset/HttpRequest;
    .locals 3
    .param p2, "charset"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map",
            "<**>;",
            "Ljava/lang/String;",
            ")",
            "Lcom/synconset/HttpRequest;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/synconset/HttpRequest$HttpRequestException;
        }
    .end annotation

    .prologue
    .line 3219
    .local p1, "values":Ljava/util/Map;, "Ljava/util/Map<**>;"
    invoke-interface {p1}, Ljava/util/Map;->isEmpty()Z

    move-result v2

    if-nez v2, :cond_0

    .line 3220
    invoke-interface {p1}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "i$":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Map$Entry;

    .line 3221
    .local v0, "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<**>;"
    invoke-virtual {p0, v0, p2}, Lcom/synconset/HttpRequest;->form(Ljava/util/Map$Entry;Ljava/lang/String;)Lcom/synconset/HttpRequest;

    goto :goto_0

    .line 3222
    .end local v0    # "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<**>;"
    .end local v1    # "i$":Ljava/util/Iterator;
    :cond_0
    return-object p0
.end method

.method public getConnection()Ljava/net/HttpURLConnection;
    .locals 1

    .prologue
    .line 1567
    iget-object v0, p0, Lcom/synconset/HttpRequest;->connection:Ljava/net/HttpURLConnection;

    if-nez v0, :cond_0

    .line 1568
    invoke-direct {p0}, Lcom/synconset/HttpRequest;->createConnection()Ljava/net/HttpURLConnection;

    move-result-object v0

    iput-object v0, p0, Lcom/synconset/HttpRequest;->connection:Ljava/net/HttpURLConnection;

    .line 1569
    :cond_0
    iget-object v0, p0, Lcom/synconset/HttpRequest;->connection:Ljava/net/HttpURLConnection;

    return-object v0
.end method

.method protected getParam(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 11
    .param p1, "value"    # Ljava/lang/String;
    .param p2, "paramName"    # Ljava/lang/String;

    .prologue
    const/16 v10, 0x22

    const/4 v6, 0x0

    const/16 v9, 0x3b

    const/4 v8, -0x1

    .line 2323
    if-eqz p1, :cond_0

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v7

    if-nez v7, :cond_2

    :cond_0
    move-object v3, v6

    .line 2355
    :cond_1
    :goto_0
    return-object v3

    .line 2326
    :cond_2
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v1

    .line 2327
    .local v1, "length":I
    invoke-virtual {p1, v9}, Ljava/lang/String;->indexOf(I)I

    move-result v7

    add-int/lit8 v4, v7, 0x1

    .line 2328
    .local v4, "start":I
    if-eqz v4, :cond_3

    if-ne v4, v1, :cond_4

    :cond_3
    move-object v3, v6

    .line 2329
    goto :goto_0

    .line 2331
    :cond_4
    invoke-virtual {p1, v9, v4}, Ljava/lang/String;->indexOf(II)I

    move-result v0

    .line 2332
    .local v0, "end":I
    if-ne v0, v8, :cond_5

    .line 2333
    move v0, v1

    .line 2335
    :cond_5
    :goto_1
    if-ge v4, v0, :cond_7

    .line 2336
    const/16 v7, 0x3d

    invoke-virtual {p1, v7, v4}, Ljava/lang/String;->indexOf(II)I

    move-result v2

    .line 2337
    .local v2, "nameEnd":I
    if-eq v2, v8, :cond_6

    if-ge v2, v0, :cond_6

    invoke-virtual {p1, v4, v2}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {p2, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_6

    .line 2339
    add-int/lit8 v7, v2, 0x1

    invoke-virtual {p1, v7, v0}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v3

    .line 2340
    .local v3, "paramValue":Ljava/lang/String;
    invoke-virtual {v3}, Ljava/lang/String;->length()I

    move-result v5

    .line 2341
    .local v5, "valueLength":I
    if-eqz v5, :cond_6

    .line 2342
    const/4 v6, 0x2

    if-le v5, v6, :cond_1

    const/4 v6, 0x0

    invoke-virtual {v3, v6}, Ljava/lang/String;->charAt(I)C

    move-result v6

    if-ne v10, v6, :cond_1

    add-int/lit8 v6, v5, -0x1

    invoke-virtual {v3, v6}, Ljava/lang/String;->charAt(I)C

    move-result v6

    if-ne v10, v6, :cond_1

    .line 2344
    const/4 v6, 0x1

    add-int/lit8 v7, v5, -0x1

    invoke-virtual {v3, v6, v7}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v3

    goto :goto_0

    .line 2349
    .end local v3    # "paramValue":Ljava/lang/String;
    .end local v5    # "valueLength":I
    :cond_6
    add-int/lit8 v4, v0, 0x1

    .line 2350
    invoke-virtual {p1, v9, v4}, Ljava/lang/String;->indexOf(II)I

    move-result v0

    .line 2351
    if-ne v0, v8, :cond_5

    .line 2352
    move v0, v1

    goto :goto_1

    .end local v2    # "nameEnd":I
    :cond_7
    move-object v3, v6

    .line 2355
    goto :goto_0
.end method

.method protected getParams(Ljava/lang/String;)Ljava/util/Map;
    .locals 13
    .param p1, "header"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    const/16 v12, 0x22

    const/16 v11, 0x3b

    const/4 v10, -0x1

    .line 2277
    if-eqz p1, :cond_0

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v8

    if-nez v8, :cond_2

    .line 2278
    :cond_0
    invoke-static {}, Ljava/util/Collections;->emptyMap()Ljava/util/Map;

    move-result-object v5

    .line 2312
    :cond_1
    :goto_0
    return-object v5

    .line 2280
    :cond_2
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v1

    .line 2281
    .local v1, "headerLength":I
    invoke-virtual {p1, v11}, Ljava/lang/String;->indexOf(I)I

    move-result v8

    add-int/lit8 v6, v8, 0x1

    .line 2282
    .local v6, "start":I
    if-eqz v6, :cond_3

    if-ne v6, v1, :cond_4

    .line 2283
    :cond_3
    invoke-static {}, Ljava/util/Collections;->emptyMap()Ljava/util/Map;

    move-result-object v5

    goto :goto_0

    .line 2285
    :cond_4
    invoke-virtual {p1, v11, v6}, Ljava/lang/String;->indexOf(II)I

    move-result v0

    .line 2286
    .local v0, "end":I
    if-ne v0, v10, :cond_5

    .line 2287
    move v0, v1

    .line 2289
    :cond_5
    new-instance v5, Ljava/util/LinkedHashMap;

    invoke-direct {v5}, Ljava/util/LinkedHashMap;-><init>()V

    .line 2290
    .local v5, "params":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    :cond_6
    :goto_1
    if-ge v6, v0, :cond_1

    .line 2291
    const/16 v8, 0x3d

    invoke-virtual {p1, v8, v6}, Ljava/lang/String;->indexOf(II)I

    move-result v4

    .line 2292
    .local v4, "nameEnd":I
    if-eq v4, v10, :cond_7

    if-ge v4, v0, :cond_7

    .line 2293
    invoke-virtual {p1, v6, v4}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v3

    .line 2294
    .local v3, "name":Ljava/lang/String;
    invoke-virtual {v3}, Ljava/lang/String;->length()I

    move-result v8

    if-lez v8, :cond_7

    .line 2295
    add-int/lit8 v8, v4, 0x1

    invoke-virtual {p1, v8, v0}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v7

    .line 2296
    .local v7, "value":Ljava/lang/String;
    invoke-virtual {v7}, Ljava/lang/String;->length()I

    move-result v2

    .line 2297
    .local v2, "length":I
    if-eqz v2, :cond_7

    .line 2298
    const/4 v8, 0x2

    if-le v2, v8, :cond_8

    const/4 v8, 0x0

    invoke-virtual {v7, v8}, Ljava/lang/String;->charAt(I)C

    move-result v8

    if-ne v12, v8, :cond_8

    add-int/lit8 v8, v2, -0x1

    invoke-virtual {v7, v8}, Ljava/lang/String;->charAt(I)C

    move-result v8

    if-ne v12, v8, :cond_8

    .line 2300
    const/4 v8, 0x1

    add-int/lit8 v9, v2, -0x1

    invoke-virtual {v7, v8, v9}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v8

    invoke-interface {v5, v3, v8}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2306
    .end local v2    # "length":I
    .end local v3    # "name":Ljava/lang/String;
    .end local v7    # "value":Ljava/lang/String;
    :cond_7
    :goto_2
    add-int/lit8 v6, v0, 0x1

    .line 2307
    invoke-virtual {p1, v11, v6}, Ljava/lang/String;->indexOf(II)I

    move-result v0

    .line 2308
    if-ne v0, v10, :cond_6

    .line 2309
    move v0, v1

    goto :goto_1

    .line 2302
    .restart local v2    # "length":I
    .restart local v3    # "name":Ljava/lang/String;
    .restart local v7    # "value":Ljava/lang/String;
    :cond_8
    invoke-interface {v5, v3, v7}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_2
.end method

.method public header(Ljava/lang/String;Ljava/lang/Number;)Lcom/synconset/HttpRequest;
    .locals 1
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "value"    # Ljava/lang/Number;

    .prologue
    .line 2123
    if-eqz p2, :cond_0

    invoke-virtual {p2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    :goto_0
    invoke-virtual {p0, p1, v0}, Lcom/synconset/HttpRequest;->header(Ljava/lang/String;Ljava/lang/String;)Lcom/synconset/HttpRequest;

    move-result-object v0

    return-object v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public header(Ljava/lang/String;Ljava/lang/String;)Lcom/synconset/HttpRequest;
    .locals 1
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "value"    # Ljava/lang/String;

    .prologue
    .line 2111
    invoke-virtual {p0}, Lcom/synconset/HttpRequest;->getConnection()Ljava/net/HttpURLConnection;

    move-result-object v0

    invoke-virtual {v0, p1, p2}, Ljava/net/HttpURLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 2112
    return-object p0
.end method

.method public header(Ljava/util/Map$Entry;)Lcom/synconset/HttpRequest;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map$Entry",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)",
            "Lcom/synconset/HttpRequest;"
        }
    .end annotation

    .prologue
    .line 2147
    .local p1, "header":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Ljava/lang/String;>;"
    invoke-interface {p1}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    invoke-interface {p1}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    invoke-virtual {p0, v0, v1}, Lcom/synconset/HttpRequest;->header(Ljava/lang/String;Ljava/lang/String;)Lcom/synconset/HttpRequest;

    move-result-object v0

    return-object v0
.end method

.method public header(Ljava/lang/String;)Ljava/lang/String;
    .locals 1
    .param p1, "name"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/synconset/HttpRequest$HttpRequestException;
        }
    .end annotation

    .prologue
    .line 2158
    invoke-virtual {p0}, Lcom/synconset/HttpRequest;->closeOutputQuietly()Lcom/synconset/HttpRequest;

    .line 2159
    invoke-virtual {p0}, Lcom/synconset/HttpRequest;->getConnection()Ljava/net/HttpURLConnection;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/net/HttpURLConnection;->getHeaderField(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public headers(Ljava/util/Map;)Lcom/synconset/HttpRequest;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)",
            "Lcom/synconset/HttpRequest;"
        }
    .end annotation

    .prologue
    .line 2134
    .local p1, "headers":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    invoke-interface {p1}, Ljava/util/Map;->isEmpty()Z

    move-result v2

    if-nez v2, :cond_0

    .line 2135
    invoke-interface {p1}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "i$":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Map$Entry;

    .line 2136
    .local v0, "header":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Ljava/lang/String;>;"
    invoke-virtual {p0, v0}, Lcom/synconset/HttpRequest;->header(Ljava/util/Map$Entry;)Lcom/synconset/HttpRequest;

    goto :goto_0

    .line 2137
    .end local v0    # "header":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Ljava/lang/String;>;"
    .end local v1    # "i$":Ljava/util/Iterator;
    :cond_0
    return-object p0
.end method

.method public headers()Ljava/util/Map;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;>;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/synconset/HttpRequest$HttpRequestException;
        }
    .end annotation

    .prologue
    .line 2169
    invoke-virtual {p0}, Lcom/synconset/HttpRequest;->closeOutputQuietly()Lcom/synconset/HttpRequest;

    .line 2170
    invoke-virtual {p0}, Lcom/synconset/HttpRequest;->getConnection()Ljava/net/HttpURLConnection;

    move-result-object v0

    invoke-virtual {v0}, Ljava/net/HttpURLConnection;->getHeaderFields()Ljava/util/Map;

    move-result-object v0

    return-object v0
.end method

.method public headers(Ljava/lang/String;)[Ljava/lang/String;
    .locals 3
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    .line 2235
    invoke-virtual {p0}, Lcom/synconset/HttpRequest;->headers()Ljava/util/Map;

    move-result-object v0

    .line 2236
    .local v0, "headers":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/util/List<Ljava/lang/String;>;>;"
    if-eqz v0, :cond_0

    invoke-interface {v0}, Ljava/util/Map;->isEmpty()Z

    move-result v2

    if-eqz v2, :cond_1

    .line 2237
    :cond_0
    sget-object v2, Lcom/synconset/HttpRequest;->EMPTY_STRINGS:[Ljava/lang/String;

    .line 2243
    :goto_0
    return-object v2

    .line 2239
    :cond_1
    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/List;

    .line 2240
    .local v1, "values":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    if-eqz v1, :cond_2

    invoke-interface {v1}, Ljava/util/List;->isEmpty()Z

    move-result v2

    if-nez v2, :cond_2

    .line 2241
    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v2

    new-array v2, v2, [Ljava/lang/String;

    invoke-interface {v1, v2}, Ljava/util/List;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v2

    check-cast v2, [Ljava/lang/String;

    goto :goto_0

    .line 2243
    :cond_2
    sget-object v2, Lcom/synconset/HttpRequest;->EMPTY_STRINGS:[Ljava/lang/String;

    goto :goto_0
.end method

.method public ifModifiedSince(J)Lcom/synconset/HttpRequest;
    .locals 1
    .param p1, "ifModifiedSince"    # J

    .prologue
    .line 2551
    invoke-virtual {p0}, Lcom/synconset/HttpRequest;->getConnection()Ljava/net/HttpURLConnection;

    move-result-object v0

    invoke-virtual {v0, p1, p2}, Ljava/net/HttpURLConnection;->setIfModifiedSince(J)V

    .line 2552
    return-object p0
.end method

.method public ifNoneMatch(Ljava/lang/String;)Lcom/synconset/HttpRequest;
    .locals 1
    .param p1, "ifNoneMatch"    # Ljava/lang/String;

    .prologue
    .line 2562
    const-string v0, "If-None-Match"

    invoke-virtual {p0, v0, p1}, Lcom/synconset/HttpRequest;->header(Ljava/lang/String;Ljava/lang/String;)Lcom/synconset/HttpRequest;

    move-result-object v0

    return-object v0
.end method

.method public ignoreCloseExceptions(Z)Lcom/synconset/HttpRequest;
    .locals 0
    .param p1, "ignore"    # Z

    .prologue
    .line 1582
    iput-boolean p1, p0, Lcom/synconset/HttpRequest;->ignoreCloseExceptions:Z

    .line 1583
    return-object p0
.end method

.method public ignoreCloseExceptions()Z
    .locals 1

    .prologue
    .line 1593
    iget-boolean v0, p0, Lcom/synconset/HttpRequest;->ignoreCloseExceptions:Z

    return v0
.end method

.method public intHeader(Ljava/lang/String;)I
    .locals 1
    .param p1, "name"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/synconset/HttpRequest$HttpRequestException;
        }
    .end annotation

    .prologue
    .line 2209
    const/4 v0, -0x1

    invoke-virtual {p0, p1, v0}, Lcom/synconset/HttpRequest;->intHeader(Ljava/lang/String;I)I

    move-result v0

    return v0
.end method

.method public intHeader(Ljava/lang/String;I)I
    .locals 1
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "defaultValue"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/synconset/HttpRequest$HttpRequestException;
        }
    .end annotation

    .prologue
    .line 2224
    invoke-virtual {p0}, Lcom/synconset/HttpRequest;->closeOutputQuietly()Lcom/synconset/HttpRequest;

    .line 2225
    invoke-virtual {p0}, Lcom/synconset/HttpRequest;->getConnection()Ljava/net/HttpURLConnection;

    move-result-object v0

    invoke-virtual {v0, p1, p2}, Ljava/net/HttpURLConnection;->getHeaderFieldInt(Ljava/lang/String;I)I

    move-result v0

    return v0
.end method

.method public isBodyEmpty()Z
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/synconset/HttpRequest$HttpRequestException;
        }
    .end annotation

    .prologue
    .line 1862
    invoke-virtual {p0}, Lcom/synconset/HttpRequest;->contentLength()I

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public lastModified()J
    .locals 2

    .prologue
    .line 2488
    const-string v0, "Last-Modified"

    invoke-virtual {p0, v0}, Lcom/synconset/HttpRequest;->dateHeader(Ljava/lang/String;)J

    move-result-wide v0

    return-wide v0
.end method

.method public location()Ljava/lang/String;
    .locals 1

    .prologue
    .line 2497
    const-string v0, "Location"

    invoke-virtual {p0, v0}, Lcom/synconset/HttpRequest;->header(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public message()Ljava/lang/String;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/synconset/HttpRequest$HttpRequestException;
        }
    .end annotation

    .prologue
    .line 1703
    :try_start_0
    invoke-virtual {p0}, Lcom/synconset/HttpRequest;->closeOutput()Lcom/synconset/HttpRequest;

    .line 1704
    invoke-virtual {p0}, Lcom/synconset/HttpRequest;->getConnection()Ljava/net/HttpURLConnection;

    move-result-object v1

    invoke-virtual {v1}, Ljava/net/HttpURLConnection;->getResponseMessage()Ljava/lang/String;
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v1

    return-object v1

    .line 1705
    :catch_0
    move-exception v0

    .line 1706
    .local v0, "e":Ljava/io/IOException;
    new-instance v1, Lcom/synconset/HttpRequest$HttpRequestException;

    invoke-direct {v1, v0}, Lcom/synconset/HttpRequest$HttpRequestException;-><init>(Ljava/io/IOException;)V

    throw v1
.end method

.method public method()Ljava/lang/String;
    .locals 1

    .prologue
    .line 3292
    invoke-virtual {p0}, Lcom/synconset/HttpRequest;->getConnection()Ljava/net/HttpURLConnection;

    move-result-object v0

    invoke-virtual {v0}, Ljava/net/HttpURLConnection;->getRequestMethod()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public noContent()Z
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/synconset/HttpRequest$HttpRequestException;
        }
    .end annotation

    .prologue
    .line 1652
    const/16 v0, 0xcc

    invoke-virtual {p0}, Lcom/synconset/HttpRequest;->code()I

    move-result v1

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public notFound()Z
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/synconset/HttpRequest$HttpRequestException;
        }
    .end annotation

    .prologue
    .line 1682
    const/16 v0, 0x194

    invoke-virtual {p0}, Lcom/synconset/HttpRequest;->code()I

    move-result v1

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public notModified()Z
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/synconset/HttpRequest$HttpRequestException;
        }
    .end annotation

    .prologue
    .line 1692
    const/16 v0, 0x130

    invoke-virtual {p0}, Lcom/synconset/HttpRequest;->code()I

    move-result v1

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public ok()Z
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/synconset/HttpRequest$HttpRequestException;
        }
    .end annotation

    .prologue
    .line 1632
    const/16 v0, 0xc8

    invoke-virtual {p0}, Lcom/synconset/HttpRequest;->code()I

    move-result v1

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method protected openOutput()Lcom/synconset/HttpRequest;
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 2768
    iget-object v1, p0, Lcom/synconset/HttpRequest;->output:Lcom/synconset/HttpRequest$RequestOutputStream;

    if-eqz v1, :cond_0

    .line 2775
    :goto_0
    return-object p0

    .line 2770
    :cond_0
    invoke-virtual {p0}, Lcom/synconset/HttpRequest;->getConnection()Ljava/net/HttpURLConnection;

    move-result-object v1

    const/4 v2, 0x1

    invoke-virtual {v1, v2}, Ljava/net/HttpURLConnection;->setDoOutput(Z)V

    .line 2771
    invoke-virtual {p0}, Lcom/synconset/HttpRequest;->getConnection()Ljava/net/HttpURLConnection;

    move-result-object v1

    const-string v2, "Content-Type"

    invoke-virtual {v1, v2}, Ljava/net/HttpURLConnection;->getRequestProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    const-string v2, "charset"

    invoke-virtual {p0, v1, v2}, Lcom/synconset/HttpRequest;->getParam(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 2773
    .local v0, "charset":Ljava/lang/String;
    new-instance v1, Lcom/synconset/HttpRequest$RequestOutputStream;

    invoke-virtual {p0}, Lcom/synconset/HttpRequest;->getConnection()Ljava/net/HttpURLConnection;

    move-result-object v2

    invoke-virtual {v2}, Ljava/net/HttpURLConnection;->getOutputStream()Ljava/io/OutputStream;

    move-result-object v2

    iget v3, p0, Lcom/synconset/HttpRequest;->bufferSize:I

    invoke-direct {v1, v2, v0, v3}, Lcom/synconset/HttpRequest$RequestOutputStream;-><init>(Ljava/io/OutputStream;Ljava/lang/String;I)V

    iput-object v1, p0, Lcom/synconset/HttpRequest;->output:Lcom/synconset/HttpRequest$RequestOutputStream;

    goto :goto_0
.end method

.method public parameter(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 1
    .param p1, "headerName"    # Ljava/lang/String;
    .param p2, "paramName"    # Ljava/lang/String;

    .prologue
    .line 2254
    invoke-virtual {p0, p1}, Lcom/synconset/HttpRequest;->header(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0, p2}, Lcom/synconset/HttpRequest;->getParam(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public parameters(Ljava/lang/String;)Ljava/util/Map;
    .locals 1
    .param p1, "headerName"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    .line 2267
    invoke-virtual {p0, p1}, Lcom/synconset/HttpRequest;->header(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/synconset/HttpRequest;->getParams(Ljava/lang/String;)Ljava/util/Map;

    move-result-object v0

    return-object v0
.end method

.method public part(Ljava/lang/String;Ljava/io/File;)Lcom/synconset/HttpRequest;
    .locals 1
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "part"    # Ljava/io/File;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/synconset/HttpRequest$HttpRequestException;
        }
    .end annotation

    .prologue
    .line 2914
    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0, p2}, Lcom/synconset/HttpRequest;->part(Ljava/lang/String;Ljava/lang/String;Ljava/io/File;)Lcom/synconset/HttpRequest;

    move-result-object v0

    return-object v0
.end method

.method public part(Ljava/lang/String;Ljava/io/InputStream;)Lcom/synconset/HttpRequest;
    .locals 1
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "part"    # Ljava/io/InputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/synconset/HttpRequest$HttpRequestException;
        }
    .end annotation

    .prologue
    const/4 v0, 0x0

    .line 2964
    invoke-virtual {p0, p1, v0, v0, p2}, Lcom/synconset/HttpRequest;->part(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/io/InputStream;)Lcom/synconset/HttpRequest;

    move-result-object v0

    return-object v0
.end method

.method public part(Ljava/lang/String;Ljava/lang/Number;)Lcom/synconset/HttpRequest;
    .locals 1
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "part"    # Ljava/lang/Number;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/synconset/HttpRequest$HttpRequestException;
        }
    .end annotation

    .prologue
    .line 2887
    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0, p2}, Lcom/synconset/HttpRequest;->part(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Number;)Lcom/synconset/HttpRequest;

    move-result-object v0

    return-object v0
.end method

.method public part(Ljava/lang/String;Ljava/lang/String;)Lcom/synconset/HttpRequest;
    .locals 1
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "part"    # Ljava/lang/String;

    .prologue
    .line 2837
    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0, p2}, Lcom/synconset/HttpRequest;->part(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lcom/synconset/HttpRequest;

    move-result-object v0

    return-object v0
.end method

.method public part(Ljava/lang/String;Ljava/lang/String;Ljava/io/File;)Lcom/synconset/HttpRequest;
    .locals 1
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "filename"    # Ljava/lang/String;
    .param p3, "part"    # Ljava/io/File;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/synconset/HttpRequest$HttpRequestException;
        }
    .end annotation

    .prologue
    .line 2928
    const/4 v0, 0x0

    invoke-virtual {p0, p1, p2, v0, p3}, Lcom/synconset/HttpRequest;->part(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/io/File;)Lcom/synconset/HttpRequest;

    move-result-object v0

    return-object v0
.end method

.method public part(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Number;)Lcom/synconset/HttpRequest;
    .locals 1
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "filename"    # Ljava/lang/String;
    .param p3, "part"    # Ljava/lang/Number;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/synconset/HttpRequest$HttpRequestException;
        }
    .end annotation

    .prologue
    .line 2901
    if-eqz p3, :cond_0

    invoke-virtual {p3}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    :goto_0
    invoke-virtual {p0, p1, p2, v0}, Lcom/synconset/HttpRequest;->part(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lcom/synconset/HttpRequest;

    move-result-object v0

    return-object v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public part(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lcom/synconset/HttpRequest;
    .locals 1
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "filename"    # Ljava/lang/String;
    .param p3, "part"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/synconset/HttpRequest$HttpRequestException;
        }
    .end annotation

    .prologue
    .line 2851
    const/4 v0, 0x0

    invoke-virtual {p0, p1, p2, v0, p3}, Lcom/synconset/HttpRequest;->part(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lcom/synconset/HttpRequest;

    move-result-object v0

    return-object v0
.end method

.method public part(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/io/File;)Lcom/synconset/HttpRequest;
    .locals 4
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "filename"    # Ljava/lang/String;
    .param p3, "contentType"    # Ljava/lang/String;
    .param p4, "part"    # Ljava/io/File;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/synconset/HttpRequest$HttpRequestException;
        }
    .end annotation

    .prologue
    .line 2946
    :try_start_0
    new-instance v1, Ljava/io/BufferedInputStream;

    new-instance v2, Ljava/io/FileInputStream;

    invoke-direct {v2, p4}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V

    invoke-direct {v1, v2}, Ljava/io/BufferedInputStream;-><init>(Ljava/io/InputStream;)V

    .line 2947
    .local v1, "stream":Ljava/io/InputStream;
    invoke-virtual {p4}, Ljava/io/File;->length()J

    move-result-wide v2

    invoke-direct {p0, v2, v3}, Lcom/synconset/HttpRequest;->incrementTotalSize(J)Lcom/synconset/HttpRequest;
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 2951
    invoke-virtual {p0, p1, p2, p3, v1}, Lcom/synconset/HttpRequest;->part(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/io/InputStream;)Lcom/synconset/HttpRequest;

    move-result-object v2

    return-object v2

    .line 2948
    .end local v1    # "stream":Ljava/io/InputStream;
    :catch_0
    move-exception v0

    .line 2949
    .local v0, "e":Ljava/io/IOException;
    new-instance v2, Lcom/synconset/HttpRequest$HttpRequestException;

    invoke-direct {v2, v0}, Lcom/synconset/HttpRequest$HttpRequestException;-><init>(Ljava/io/IOException;)V

    throw v2
.end method

.method public part(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/io/InputStream;)Lcom/synconset/HttpRequest;
    .locals 2
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "filename"    # Ljava/lang/String;
    .param p3, "contentType"    # Ljava/lang/String;
    .param p4, "part"    # Ljava/io/InputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/synconset/HttpRequest$HttpRequestException;
        }
    .end annotation

    .prologue
    .line 2982
    :try_start_0
    invoke-virtual {p0}, Lcom/synconset/HttpRequest;->startPart()Lcom/synconset/HttpRequest;

    .line 2983
    invoke-virtual {p0, p1, p2, p3}, Lcom/synconset/HttpRequest;->writePartHeader(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lcom/synconset/HttpRequest;

    .line 2984
    iget-object v1, p0, Lcom/synconset/HttpRequest;->output:Lcom/synconset/HttpRequest$RequestOutputStream;

    invoke-virtual {p0, p4, v1}, Lcom/synconset/HttpRequest;->copy(Ljava/io/InputStream;Ljava/io/OutputStream;)Lcom/synconset/HttpRequest;
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 2988
    return-object p0

    .line 2985
    :catch_0
    move-exception v0

    .line 2986
    .local v0, "e":Ljava/io/IOException;
    new-instance v1, Lcom/synconset/HttpRequest$HttpRequestException;

    invoke-direct {v1, v0}, Lcom/synconset/HttpRequest$HttpRequestException;-><init>(Ljava/io/IOException;)V

    throw v1
.end method

.method public part(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lcom/synconset/HttpRequest;
    .locals 2
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "filename"    # Ljava/lang/String;
    .param p3, "contentType"    # Ljava/lang/String;
    .param p4, "part"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/synconset/HttpRequest$HttpRequestException;
        }
    .end annotation

    .prologue
    .line 2868
    :try_start_0
    invoke-virtual {p0}, Lcom/synconset/HttpRequest;->startPart()Lcom/synconset/HttpRequest;

    .line 2869
    invoke-virtual {p0, p1, p2, p3}, Lcom/synconset/HttpRequest;->writePartHeader(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lcom/synconset/HttpRequest;

    .line 2870
    iget-object v1, p0, Lcom/synconset/HttpRequest;->output:Lcom/synconset/HttpRequest$RequestOutputStream;

    invoke-virtual {v1, p4}, Lcom/synconset/HttpRequest$RequestOutputStream;->write(Ljava/lang/String;)Lcom/synconset/HttpRequest$RequestOutputStream;
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 2874
    return-object p0

    .line 2871
    :catch_0
    move-exception v0

    .line 2872
    .local v0, "e":Ljava/io/IOException;
    new-instance v1, Lcom/synconset/HttpRequest$HttpRequestException;

    invoke-direct {v1, v0}, Lcom/synconset/HttpRequest$HttpRequestException;-><init>(Ljava/io/IOException;)V

    throw v1
.end method

.method public partHeader(Ljava/lang/String;Ljava/lang/String;)Lcom/synconset/HttpRequest;
    .locals 2
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "value"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/synconset/HttpRequest$HttpRequestException;
        }
    .end annotation

    .prologue
    .line 3001
    invoke-virtual {p0, p1}, Lcom/synconset/HttpRequest;->send(Ljava/lang/CharSequence;)Lcom/synconset/HttpRequest;

    move-result-object v0

    const-string v1, ": "

    invoke-virtual {v0, v1}, Lcom/synconset/HttpRequest;->send(Ljava/lang/CharSequence;)Lcom/synconset/HttpRequest;

    move-result-object v0

    invoke-virtual {v0, p2}, Lcom/synconset/HttpRequest;->send(Ljava/lang/CharSequence;)Lcom/synconset/HttpRequest;

    move-result-object v0

    const-string v1, "\r\n"

    invoke-virtual {v0, v1}, Lcom/synconset/HttpRequest;->send(Ljava/lang/CharSequence;)Lcom/synconset/HttpRequest;

    move-result-object v0

    return-object v0
.end method

.method public pinToCerts()Lcom/synconset/HttpRequest;
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/synconset/HttpRequest$HttpRequestException;
        }
    .end annotation

    .prologue
    .line 3234
    invoke-virtual {p0}, Lcom/synconset/HttpRequest;->getConnection()Ljava/net/HttpURLConnection;

    move-result-object v0

    .line 3235
    .local v0, "connection":Ljava/net/HttpURLConnection;
    instance-of v2, v0, Ljavax/net/ssl/HttpsURLConnection;

    if-eqz v2, :cond_0

    .line 3236
    check-cast v0, Ljavax/net/ssl/HttpsURLConnection;

    .end local v0    # "connection":Ljava/net/HttpURLConnection;
    invoke-static {}, Lcom/synconset/HttpRequest;->getPinnedFactory()Ljavax/net/ssl/SSLSocketFactory;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljavax/net/ssl/HttpsURLConnection;->setSSLSocketFactory(Ljavax/net/ssl/SSLSocketFactory;)V

    .line 3241
    return-object p0

    .line 3238
    .restart local v0    # "connection":Ljava/net/HttpURLConnection;
    :cond_0
    new-instance v1, Ljava/io/IOException;

    const-string v2, "You must use a https url to use ssl pinning"

    invoke-direct {v1, v2}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    .line 3239
    .local v1, "e":Ljava/io/IOException;
    new-instance v2, Lcom/synconset/HttpRequest$HttpRequestException;

    invoke-direct {v2, v1}, Lcom/synconset/HttpRequest$HttpRequestException;-><init>(Ljava/io/IOException;)V

    throw v2
.end method

.method public progress(Lcom/synconset/HttpRequest$UploadProgress;)Lcom/synconset/HttpRequest;
    .locals 1
    .param p1, "callback"    # Lcom/synconset/HttpRequest$UploadProgress;

    .prologue
    .line 2707
    if-nez p1, :cond_0

    .line 2708
    sget-object v0, Lcom/synconset/HttpRequest$UploadProgress;->DEFAULT:Lcom/synconset/HttpRequest$UploadProgress;

    iput-object v0, p0, Lcom/synconset/HttpRequest;->progress:Lcom/synconset/HttpRequest$UploadProgress;

    .line 2711
    :goto_0
    return-object p0

    .line 2710
    :cond_0
    iput-object p1, p0, Lcom/synconset/HttpRequest;->progress:Lcom/synconset/HttpRequest$UploadProgress;

    goto :goto_0
.end method

.method public proxyAuthorization(Ljava/lang/String;)Lcom/synconset/HttpRequest;
    .locals 1
    .param p1, "proxyAuthorization"    # Ljava/lang/String;

    .prologue
    .line 2517
    const-string v0, "Proxy-Authorization"

    invoke-virtual {p0, v0, p1}, Lcom/synconset/HttpRequest;->header(Ljava/lang/String;Ljava/lang/String;)Lcom/synconset/HttpRequest;

    move-result-object v0

    return-object v0
.end method

.method public proxyBasic(Ljava/lang/String;Ljava/lang/String;)Lcom/synconset/HttpRequest;
    .locals 3
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "password"    # Ljava/lang/String;

    .prologue
    .line 2541
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "Basic "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const/16 v2, 0x3a

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lcom/synconset/HttpRequest$Base64;->encode(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/synconset/HttpRequest;->proxyAuthorization(Ljava/lang/String;)Lcom/synconset/HttpRequest;

    move-result-object v0

    return-object v0
.end method

.method public readTimeout(I)Lcom/synconset/HttpRequest;
    .locals 1
    .param p1, "timeout"    # I

    .prologue
    .line 2088
    invoke-virtual {p0}, Lcom/synconset/HttpRequest;->getConnection()Ljava/net/HttpURLConnection;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/net/HttpURLConnection;->setReadTimeout(I)V

    .line 2089
    return-object p0
.end method

.method public reader()Ljava/io/InputStreamReader;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/synconset/HttpRequest$HttpRequestException;
        }
    .end annotation

    .prologue
    .line 1956
    invoke-virtual {p0}, Lcom/synconset/HttpRequest;->charset()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/synconset/HttpRequest;->reader(Ljava/lang/String;)Ljava/io/InputStreamReader;

    move-result-object v0

    return-object v0
.end method

.method public reader(Ljava/lang/String;)Ljava/io/InputStreamReader;
    .locals 4
    .param p1, "charset"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/synconset/HttpRequest$HttpRequestException;
        }
    .end annotation

    .prologue
    .line 1942
    :try_start_0
    new-instance v1, Ljava/io/InputStreamReader;

    invoke-virtual {p0}, Lcom/synconset/HttpRequest;->stream()Ljava/io/InputStream;

    move-result-object v2

    invoke-static {p1}, Lcom/synconset/HttpRequest;->getValidCharset(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-direct {v1, v2, v3}, Ljava/io/InputStreamReader;-><init>(Ljava/io/InputStream;Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_0 .. :try_end_0} :catch_0

    return-object v1

    .line 1943
    :catch_0
    move-exception v0

    .line 1944
    .local v0, "e":Ljava/io/UnsupportedEncodingException;
    new-instance v1, Lcom/synconset/HttpRequest$HttpRequestException;

    invoke-direct {v1, v0}, Lcom/synconset/HttpRequest$HttpRequestException;-><init>(Ljava/io/IOException;)V

    throw v1
.end method

.method public receive(Ljava/io/File;)Lcom/synconset/HttpRequest;
    .locals 4
    .param p1, "file"    # Ljava/io/File;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/synconset/HttpRequest$HttpRequestException;
        }
    .end annotation

    .prologue
    .line 1996
    :try_start_0
    new-instance v1, Ljava/io/BufferedOutputStream;

    new-instance v2, Ljava/io/FileOutputStream;

    invoke-direct {v2, p1}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V

    iget v3, p0, Lcom/synconset/HttpRequest;->bufferSize:I

    invoke-direct {v1, v2, v3}, Ljava/io/BufferedOutputStream;-><init>(Ljava/io/OutputStream;I)V
    :try_end_0
    .catch Ljava/io/FileNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    .line 2000
    .local v1, "output":Ljava/io/OutputStream;
    new-instance v2, Lcom/synconset/HttpRequest$5;

    iget-boolean v3, p0, Lcom/synconset/HttpRequest;->ignoreCloseExceptions:Z

    invoke-direct {v2, p0, v1, v3, v1}, Lcom/synconset/HttpRequest$5;-><init>(Lcom/synconset/HttpRequest;Ljava/io/Closeable;ZLjava/io/OutputStream;)V

    invoke-virtual {v2}, Lcom/synconset/HttpRequest$5;->call()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/synconset/HttpRequest;

    return-object v2

    .line 1997
    .end local v1    # "output":Ljava/io/OutputStream;
    :catch_0
    move-exception v0

    .line 1998
    .local v0, "e":Ljava/io/FileNotFoundException;
    new-instance v2, Lcom/synconset/HttpRequest$HttpRequestException;

    invoke-direct {v2, v0}, Lcom/synconset/HttpRequest$HttpRequestException;-><init>(Ljava/io/IOException;)V

    throw v2
.end method

.method public receive(Ljava/io/OutputStream;)Lcom/synconset/HttpRequest;
    .locals 2
    .param p1, "output"    # Ljava/io/OutputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/synconset/HttpRequest$HttpRequestException;
        }
    .end annotation

    .prologue
    .line 2019
    :try_start_0
    invoke-virtual {p0}, Lcom/synconset/HttpRequest;->buffer()Ljava/io/BufferedInputStream;

    move-result-object v1

    invoke-virtual {p0, v1, p1}, Lcom/synconset/HttpRequest;->copy(Ljava/io/InputStream;Ljava/io/OutputStream;)Lcom/synconset/HttpRequest;
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v1

    return-object v1

    .line 2020
    :catch_0
    move-exception v0

    .line 2021
    .local v0, "e":Ljava/io/IOException;
    new-instance v1, Lcom/synconset/HttpRequest$HttpRequestException;

    invoke-direct {v1, v0}, Lcom/synconset/HttpRequest$HttpRequestException;-><init>(Ljava/io/IOException;)V

    throw v1
.end method

.method public receive(Ljava/io/PrintStream;)Lcom/synconset/HttpRequest;
    .locals 1
    .param p1, "output"    # Ljava/io/PrintStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/synconset/HttpRequest$HttpRequestException;
        }
    .end annotation

    .prologue
    .line 2034
    invoke-virtual {p0, p1}, Lcom/synconset/HttpRequest;->receive(Ljava/io/OutputStream;)Lcom/synconset/HttpRequest;

    move-result-object v0

    return-object v0
.end method

.method public receive(Ljava/io/Writer;)Lcom/synconset/HttpRequest;
    .locals 6
    .param p1, "writer"    # Ljava/io/Writer;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/synconset/HttpRequest$HttpRequestException;
        }
    .end annotation

    .prologue
    .line 2071
    invoke-virtual {p0}, Lcom/synconset/HttpRequest;->bufferedReader()Ljava/io/BufferedReader;

    move-result-object v2

    .line 2072
    .local v2, "reader":Ljava/io/BufferedReader;
    new-instance v0, Lcom/synconset/HttpRequest$7;

    iget-boolean v3, p0, Lcom/synconset/HttpRequest;->ignoreCloseExceptions:Z

    move-object v1, p0

    move-object v4, v2

    move-object v5, p1

    invoke-direct/range {v0 .. v5}, Lcom/synconset/HttpRequest$7;-><init>(Lcom/synconset/HttpRequest;Ljava/io/Closeable;ZLjava/io/BufferedReader;Ljava/io/Writer;)V

    invoke-virtual {v0}, Lcom/synconset/HttpRequest$7;->call()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/synconset/HttpRequest;

    return-object v0
.end method

.method public receive(Ljava/lang/Appendable;)Lcom/synconset/HttpRequest;
    .locals 6
    .param p1, "appendable"    # Ljava/lang/Appendable;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/synconset/HttpRequest$HttpRequestException;
        }
    .end annotation

    .prologue
    .line 2046
    invoke-virtual {p0}, Lcom/synconset/HttpRequest;->bufferedReader()Ljava/io/BufferedReader;

    move-result-object v2

    .line 2047
    .local v2, "reader":Ljava/io/BufferedReader;
    new-instance v0, Lcom/synconset/HttpRequest$6;

    iget-boolean v3, p0, Lcom/synconset/HttpRequest;->ignoreCloseExceptions:Z

    move-object v1, p0

    move-object v4, v2

    move-object v5, p1

    invoke-direct/range {v0 .. v5}, Lcom/synconset/HttpRequest$6;-><init>(Lcom/synconset/HttpRequest;Ljava/io/Closeable;ZLjava/io/BufferedReader;Ljava/lang/Appendable;)V

    invoke-virtual {v0}, Lcom/synconset/HttpRequest$6;->call()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/synconset/HttpRequest;

    return-object v0
.end method

.method public referer(Ljava/lang/String;)Lcom/synconset/HttpRequest;
    .locals 1
    .param p1, "referer"    # Ljava/lang/String;

    .prologue
    .line 2384
    const-string v0, "Referer"

    invoke-virtual {p0, v0, p1}, Lcom/synconset/HttpRequest;->header(Ljava/lang/String;Ljava/lang/String;)Lcom/synconset/HttpRequest;

    move-result-object v0

    return-object v0
.end method

.method public send(Ljava/io/File;)Lcom/synconset/HttpRequest;
    .locals 4
    .param p1, "input"    # Ljava/io/File;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/synconset/HttpRequest$HttpRequestException;
        }
    .end annotation

    .prologue
    .line 3014
    :try_start_0
    new-instance v1, Ljava/io/BufferedInputStream;

    new-instance v2, Ljava/io/FileInputStream;

    invoke-direct {v2, p1}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V

    invoke-direct {v1, v2}, Ljava/io/BufferedInputStream;-><init>(Ljava/io/InputStream;)V

    .line 3015
    .local v1, "stream":Ljava/io/InputStream;
    invoke-virtual {p1}, Ljava/io/File;->length()J

    move-result-wide v2

    invoke-direct {p0, v2, v3}, Lcom/synconset/HttpRequest;->incrementTotalSize(J)Lcom/synconset/HttpRequest;
    :try_end_0
    .catch Ljava/io/FileNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    .line 3019
    invoke-virtual {p0, v1}, Lcom/synconset/HttpRequest;->send(Ljava/io/InputStream;)Lcom/synconset/HttpRequest;

    move-result-object v2

    return-object v2

    .line 3016
    .end local v1    # "stream":Ljava/io/InputStream;
    :catch_0
    move-exception v0

    .line 3017
    .local v0, "e":Ljava/io/FileNotFoundException;
    new-instance v2, Lcom/synconset/HttpRequest$HttpRequestException;

    invoke-direct {v2, v0}, Lcom/synconset/HttpRequest$HttpRequestException;-><init>(Ljava/io/IOException;)V

    throw v2
.end method

.method public send(Ljava/io/InputStream;)Lcom/synconset/HttpRequest;
    .locals 2
    .param p1, "input"    # Ljava/io/InputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/synconset/HttpRequest$HttpRequestException;
        }
    .end annotation

    .prologue
    .line 3046
    :try_start_0
    invoke-virtual {p0}, Lcom/synconset/HttpRequest;->openOutput()Lcom/synconset/HttpRequest;

    .line 3047
    iget-object v1, p0, Lcom/synconset/HttpRequest;->output:Lcom/synconset/HttpRequest$RequestOutputStream;

    invoke-virtual {p0, p1, v1}, Lcom/synconset/HttpRequest;->copy(Ljava/io/InputStream;Ljava/io/OutputStream;)Lcom/synconset/HttpRequest;
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 3051
    return-object p0

    .line 3048
    :catch_0
    move-exception v0

    .line 3049
    .local v0, "e":Ljava/io/IOException;
    new-instance v1, Lcom/synconset/HttpRequest$HttpRequestException;

    invoke-direct {v1, v0}, Lcom/synconset/HttpRequest$HttpRequestException;-><init>(Ljava/io/IOException;)V

    throw v1
.end method

.method public send(Ljava/io/Reader;)Lcom/synconset/HttpRequest;
    .locals 4
    .param p1, "input"    # Ljava/io/Reader;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/synconset/HttpRequest$HttpRequestException;
        }
    .end annotation

    .prologue
    .line 3065
    :try_start_0
    invoke-virtual {p0}, Lcom/synconset/HttpRequest;->openOutput()Lcom/synconset/HttpRequest;
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 3069
    new-instance v1, Ljava/io/OutputStreamWriter;

    iget-object v2, p0, Lcom/synconset/HttpRequest;->output:Lcom/synconset/HttpRequest$RequestOutputStream;

    iget-object v3, p0, Lcom/synconset/HttpRequest;->output:Lcom/synconset/HttpRequest$RequestOutputStream;

    invoke-static {v3}, Lcom/synconset/HttpRequest$RequestOutputStream;->access$600(Lcom/synconset/HttpRequest$RequestOutputStream;)Ljava/nio/charset/CharsetEncoder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/nio/charset/CharsetEncoder;->charset()Ljava/nio/charset/Charset;

    move-result-object v3

    invoke-direct {v1, v2, v3}, Ljava/io/OutputStreamWriter;-><init>(Ljava/io/OutputStream;Ljava/nio/charset/Charset;)V

    .line 3071
    .local v1, "writer":Ljava/io/Writer;
    new-instance v2, Lcom/synconset/HttpRequest$10;

    invoke-direct {v2, p0, v1, p1, v1}, Lcom/synconset/HttpRequest$10;-><init>(Lcom/synconset/HttpRequest;Ljava/io/Flushable;Ljava/io/Reader;Ljava/io/Writer;)V

    invoke-virtual {v2}, Lcom/synconset/HttpRequest$10;->call()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/synconset/HttpRequest;

    return-object v2

    .line 3066
    .end local v1    # "writer":Ljava/io/Writer;
    :catch_0
    move-exception v0

    .line 3067
    .local v0, "e":Ljava/io/IOException;
    new-instance v2, Lcom/synconset/HttpRequest$HttpRequestException;

    invoke-direct {v2, v0}, Lcom/synconset/HttpRequest$HttpRequestException;-><init>(Ljava/io/IOException;)V

    throw v2
.end method

.method public send(Ljava/lang/CharSequence;)Lcom/synconset/HttpRequest;
    .locals 3
    .param p1, "value"    # Ljava/lang/CharSequence;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/synconset/HttpRequest$HttpRequestException;
        }
    .end annotation

    .prologue
    .line 3092
    :try_start_0
    invoke-virtual {p0}, Lcom/synconset/HttpRequest;->openOutput()Lcom/synconset/HttpRequest;

    .line 3093
    iget-object v1, p0, Lcom/synconset/HttpRequest;->output:Lcom/synconset/HttpRequest$RequestOutputStream;

    invoke-interface {p1}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/synconset/HttpRequest$RequestOutputStream;->write(Ljava/lang/String;)Lcom/synconset/HttpRequest$RequestOutputStream;
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 3097
    return-object p0

    .line 3094
    :catch_0
    move-exception v0

    .line 3095
    .local v0, "e":Ljava/io/IOException;
    new-instance v1, Lcom/synconset/HttpRequest$HttpRequestException;

    invoke-direct {v1, v0}, Lcom/synconset/HttpRequest$HttpRequestException;-><init>(Ljava/io/IOException;)V

    throw v1
.end method

.method public send([B)Lcom/synconset/HttpRequest;
    .locals 2
    .param p1, "input"    # [B
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/synconset/HttpRequest$HttpRequestException;
        }
    .end annotation

    .prologue
    .line 3030
    if-eqz p1, :cond_0

    .line 3031
    array-length v0, p1

    int-to-long v0, v0

    invoke-direct {p0, v0, v1}, Lcom/synconset/HttpRequest;->incrementTotalSize(J)Lcom/synconset/HttpRequest;

    .line 3032
    :cond_0
    new-instance v0, Ljava/io/ByteArrayInputStream;

    invoke-direct {v0, p1}, Ljava/io/ByteArrayInputStream;-><init>([B)V

    invoke-virtual {p0, v0}, Lcom/synconset/HttpRequest;->send(Ljava/io/InputStream;)Lcom/synconset/HttpRequest;

    move-result-object v0

    return-object v0
.end method

.method public server()Ljava/lang/String;
    .locals 1

    .prologue
    .line 2443
    const-string v0, "Server"

    invoke-virtual {p0, v0}, Lcom/synconset/HttpRequest;->header(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public serverError()Z
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/synconset/HttpRequest$HttpRequestException;
        }
    .end annotation

    .prologue
    .line 1662
    const/16 v0, 0x1f4

    invoke-virtual {p0}, Lcom/synconset/HttpRequest;->code()I

    move-result v1

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method protected startPart()Lcom/synconset/HttpRequest;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 2785
    iget-boolean v0, p0, Lcom/synconset/HttpRequest;->multipart:Z

    if-nez v0, :cond_0

    .line 2786
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/synconset/HttpRequest;->multipart:Z

    .line 2787
    const-string v0, "multipart/form-data; boundary=00content0boundary00"

    invoke-virtual {p0, v0}, Lcom/synconset/HttpRequest;->contentType(Ljava/lang/String;)Lcom/synconset/HttpRequest;

    move-result-object v0

    invoke-virtual {v0}, Lcom/synconset/HttpRequest;->openOutput()Lcom/synconset/HttpRequest;

    .line 2788
    iget-object v0, p0, Lcom/synconset/HttpRequest;->output:Lcom/synconset/HttpRequest$RequestOutputStream;

    const-string v1, "--00content0boundary00\r\n"

    invoke-virtual {v0, v1}, Lcom/synconset/HttpRequest$RequestOutputStream;->write(Ljava/lang/String;)Lcom/synconset/HttpRequest$RequestOutputStream;

    .line 2791
    :goto_0
    return-object p0

    .line 2790
    :cond_0
    iget-object v0, p0, Lcom/synconset/HttpRequest;->output:Lcom/synconset/HttpRequest$RequestOutputStream;

    const-string v1, "\r\n--00content0boundary00\r\n"

    invoke-virtual {v0, v1}, Lcom/synconset/HttpRequest$RequestOutputStream;->write(Ljava/lang/String;)Lcom/synconset/HttpRequest$RequestOutputStream;

    goto :goto_0
.end method

.method public stream()Ljava/io/InputStream;
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/synconset/HttpRequest$HttpRequestException;
        }
    .end annotation

    .prologue
    .line 1900
    invoke-virtual {p0}, Lcom/synconset/HttpRequest;->code()I

    move-result v2

    const/16 v3, 0x190

    if-ge v2, v3, :cond_2

    .line 1902
    :try_start_0
    invoke-virtual {p0}, Lcom/synconset/HttpRequest;->getConnection()Ljava/net/HttpURLConnection;

    move-result-object v2

    invoke-virtual {v2}, Ljava/net/HttpURLConnection;->getInputStream()Ljava/io/InputStream;
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v1

    .line 1919
    .local v1, "stream":Ljava/io/InputStream;
    :cond_0
    :goto_0
    iget-boolean v2, p0, Lcom/synconset/HttpRequest;->uncompress:Z

    if-eqz v2, :cond_1

    const-string v2, "gzip"

    invoke-virtual {p0}, Lcom/synconset/HttpRequest;->contentEncoding()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_4

    .line 1923
    .end local v1    # "stream":Ljava/io/InputStream;
    :cond_1
    :goto_1
    return-object v1

    .line 1903
    :catch_0
    move-exception v0

    .line 1904
    .local v0, "e":Ljava/io/IOException;
    new-instance v2, Lcom/synconset/HttpRequest$HttpRequestException;

    invoke-direct {v2, v0}, Lcom/synconset/HttpRequest$HttpRequestException;-><init>(Ljava/io/IOException;)V

    throw v2

    .line 1907
    .end local v0    # "e":Ljava/io/IOException;
    :cond_2
    invoke-virtual {p0}, Lcom/synconset/HttpRequest;->getConnection()Ljava/net/HttpURLConnection;

    move-result-object v2

    invoke-virtual {v2}, Ljava/net/HttpURLConnection;->getErrorStream()Ljava/io/InputStream;

    move-result-object v1

    .line 1908
    .restart local v1    # "stream":Ljava/io/InputStream;
    if-nez v1, :cond_0

    .line 1910
    :try_start_1
    invoke-virtual {p0}, Lcom/synconset/HttpRequest;->getConnection()Ljava/net/HttpURLConnection;

    move-result-object v2

    invoke-virtual {v2}, Ljava/net/HttpURLConnection;->getInputStream()Ljava/io/InputStream;
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_1

    move-result-object v1

    goto :goto_0

    .line 1911
    :catch_1
    move-exception v0

    .line 1912
    .restart local v0    # "e":Ljava/io/IOException;
    invoke-virtual {p0}, Lcom/synconset/HttpRequest;->contentLength()I

    move-result v2

    if-lez v2, :cond_3

    .line 1913
    new-instance v2, Lcom/synconset/HttpRequest$HttpRequestException;

    invoke-direct {v2, v0}, Lcom/synconset/HttpRequest$HttpRequestException;-><init>(Ljava/io/IOException;)V

    throw v2

    .line 1915
    :cond_3
    new-instance v1, Ljava/io/ByteArrayInputStream;

    .end local v1    # "stream":Ljava/io/InputStream;
    const/4 v2, 0x0

    new-array v2, v2, [B

    invoke-direct {v1, v2}, Ljava/io/ByteArrayInputStream;-><init>([B)V

    .restart local v1    # "stream":Ljava/io/InputStream;
    goto :goto_0

    .line 1923
    .end local v0    # "e":Ljava/io/IOException;
    :cond_4
    :try_start_2
    new-instance v2, Ljava/util/zip/GZIPInputStream;

    invoke-direct {v2, v1}, Ljava/util/zip/GZIPInputStream;-><init>(Ljava/io/InputStream;)V
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_2

    move-object v1, v2

    goto :goto_1

    .line 1924
    :catch_2
    move-exception v0

    .line 1925
    .restart local v0    # "e":Ljava/io/IOException;
    new-instance v2, Lcom/synconset/HttpRequest$HttpRequestException;

    invoke-direct {v2, v0}, Lcom/synconset/HttpRequest$HttpRequestException;-><init>(Ljava/io/IOException;)V

    throw v2
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .prologue
    .line 1558
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p0}, Lcom/synconset/HttpRequest;->method()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const/16 v1, 0x20

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {p0}, Lcom/synconset/HttpRequest;->url()Ljava/net/URL;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public trustAllCerts()Lcom/synconset/HttpRequest;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/synconset/HttpRequest$HttpRequestException;
        }
    .end annotation

    .prologue
    .line 3253
    invoke-virtual {p0}, Lcom/synconset/HttpRequest;->getConnection()Ljava/net/HttpURLConnection;

    move-result-object v0

    .line 3254
    .local v0, "connection":Ljava/net/HttpURLConnection;
    instance-of v1, v0, Ljavax/net/ssl/HttpsURLConnection;

    if-eqz v1, :cond_0

    .line 3255
    check-cast v0, Ljavax/net/ssl/HttpsURLConnection;

    .end local v0    # "connection":Ljava/net/HttpURLConnection;
    invoke-static {}, Lcom/synconset/HttpRequest;->getTrustedFactory()Ljavax/net/ssl/SSLSocketFactory;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljavax/net/ssl/HttpsURLConnection;->setSSLSocketFactory(Ljavax/net/ssl/SSLSocketFactory;)V

    .line 3257
    :cond_0
    return-object p0
.end method

.method public trustAllHosts()Lcom/synconset/HttpRequest;
    .locals 2

    .prologue
    .line 3270
    invoke-virtual {p0}, Lcom/synconset/HttpRequest;->getConnection()Ljava/net/HttpURLConnection;

    move-result-object v0

    .line 3271
    .local v0, "connection":Ljava/net/HttpURLConnection;
    instance-of v1, v0, Ljavax/net/ssl/HttpsURLConnection;

    if-eqz v1, :cond_0

    .line 3272
    check-cast v0, Ljavax/net/ssl/HttpsURLConnection;

    .end local v0    # "connection":Ljava/net/HttpURLConnection;
    invoke-static {}, Lcom/synconset/HttpRequest;->getTrustedVerifier()Ljavax/net/ssl/HostnameVerifier;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljavax/net/ssl/HttpsURLConnection;->setHostnameVerifier(Ljavax/net/ssl/HostnameVerifier;)V

    .line 3274
    :cond_0
    return-object p0
.end method

.method public uncompress(Z)Lcom/synconset/HttpRequest;
    .locals 0
    .param p1, "uncompress"    # Z

    .prologue
    .line 1779
    iput-boolean p1, p0, Lcom/synconset/HttpRequest;->uncompress:Z

    .line 1780
    return-object p0
.end method

.method public url()Ljava/net/URL;
    .locals 1

    .prologue
    .line 3283
    invoke-virtual {p0}, Lcom/synconset/HttpRequest;->getConnection()Ljava/net/HttpURLConnection;

    move-result-object v0

    invoke-virtual {v0}, Ljava/net/HttpURLConnection;->getURL()Ljava/net/URL;

    move-result-object v0

    return-object v0
.end method

.method public useCaches(Z)Lcom/synconset/HttpRequest;
    .locals 1
    .param p1, "useCaches"    # Z

    .prologue
    .line 2394
    invoke-virtual {p0}, Lcom/synconset/HttpRequest;->getConnection()Ljava/net/HttpURLConnection;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/net/HttpURLConnection;->setUseCaches(Z)V

    .line 2395
    return-object p0
.end method

.method public useProxy(Ljava/lang/String;I)Lcom/synconset/HttpRequest;
    .locals 2
    .param p1, "proxyHost"    # Ljava/lang/String;
    .param p2, "proxyPort"    # I

    .prologue
    .line 3304
    iget-object v0, p0, Lcom/synconset/HttpRequest;->connection:Ljava/net/HttpURLConnection;

    if-eqz v0, :cond_0

    .line 3305
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "The connection has already been created. This method must be called before reading or writing to the request."

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 3307
    :cond_0
    iput-object p1, p0, Lcom/synconset/HttpRequest;->httpProxyHost:Ljava/lang/String;

    .line 3308
    iput p2, p0, Lcom/synconset/HttpRequest;->httpProxyPort:I

    .line 3309
    return-object p0
.end method

.method public userAgent(Ljava/lang/String;)Lcom/synconset/HttpRequest;
    .locals 1
    .param p1, "userAgent"    # Ljava/lang/String;

    .prologue
    .line 2374
    const-string v0, "User-Agent"

    invoke-virtual {p0, v0, p1}, Lcom/synconset/HttpRequest;->header(Ljava/lang/String;Ljava/lang/String;)Lcom/synconset/HttpRequest;

    move-result-object v0

    return-object v0
.end method

.method protected writePartHeader(Ljava/lang/String;Ljava/lang/String;)Lcom/synconset/HttpRequest;
    .locals 1
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "filename"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 2804
    const/4 v0, 0x0

    invoke-virtual {p0, p1, p2, v0}, Lcom/synconset/HttpRequest;->writePartHeader(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lcom/synconset/HttpRequest;

    move-result-object v0

    return-object v0
.end method

.method protected writePartHeader(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lcom/synconset/HttpRequest;
    .locals 3
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "filename"    # Ljava/lang/String;
    .param p3, "contentType"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 2818
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 2819
    .local v0, "partBuffer":Ljava/lang/StringBuilder;
    const-string v1, "form-data; name=\""

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 2820
    if-eqz p2, :cond_0

    .line 2821
    const-string v1, "\"; filename=\""

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 2822
    :cond_0
    const/16 v1, 0x22

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 2823
    const-string v1, "Content-Disposition"

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p0, v1, v2}, Lcom/synconset/HttpRequest;->partHeader(Ljava/lang/String;Ljava/lang/String;)Lcom/synconset/HttpRequest;

    .line 2824
    if-eqz p3, :cond_1

    .line 2825
    const-string v1, "Content-Type"

    invoke-virtual {p0, v1, p3}, Lcom/synconset/HttpRequest;->partHeader(Ljava/lang/String;Ljava/lang/String;)Lcom/synconset/HttpRequest;

    .line 2826
    :cond_1
    const-string v1, "\r\n"

    invoke-virtual {p0, v1}, Lcom/synconset/HttpRequest;->send(Ljava/lang/CharSequence;)Lcom/synconset/HttpRequest;

    move-result-object v1

    return-object v1
.end method

.method public writer()Ljava/io/OutputStreamWriter;
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/synconset/HttpRequest$HttpRequestException;
        }
    .end annotation

    .prologue
    .line 3108
    :try_start_0
    invoke-virtual {p0}, Lcom/synconset/HttpRequest;->openOutput()Lcom/synconset/HttpRequest;

    .line 3109
    new-instance v1, Ljava/io/OutputStreamWriter;

    iget-object v2, p0, Lcom/synconset/HttpRequest;->output:Lcom/synconset/HttpRequest$RequestOutputStream;

    iget-object v3, p0, Lcom/synconset/HttpRequest;->output:Lcom/synconset/HttpRequest$RequestOutputStream;

    invoke-static {v3}, Lcom/synconset/HttpRequest$RequestOutputStream;->access$600(Lcom/synconset/HttpRequest$RequestOutputStream;)Ljava/nio/charset/CharsetEncoder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/nio/charset/CharsetEncoder;->charset()Ljava/nio/charset/Charset;

    move-result-object v3

    invoke-direct {v1, v2, v3}, Ljava/io/OutputStreamWriter;-><init>(Ljava/io/OutputStream;Ljava/nio/charset/Charset;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    return-object v1

    .line 3110
    :catch_0
    move-exception v0

    .line 3111
    .local v0, "e":Ljava/io/IOException;
    new-instance v1, Lcom/synconset/HttpRequest$HttpRequestException;

    invoke-direct {v1, v0}, Lcom/synconset/HttpRequest$HttpRequestException;-><init>(Ljava/io/IOException;)V

    throw v1
.end method
