.class public Lcom/belkin/cloud/utils/HTTPUtils;
.super Ljava/lang/Object;
.source "HTTPUtils.java"


# static fields
.field public static final STR_HTTP:Ljava/lang/String; = "http"

.field public static final STR_HTTPS:Ljava/lang/String; = "https"

.field public static final TAG:Ljava/lang/String; = "HTTPUtils"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 25
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private static getCertUnSecureHttpClient(Landroid/content/Context;)Lorg/apache/http/client/HttpClient;
    .locals 10
    .param p0, "context"    # Landroid/content/Context;

    .prologue
    .line 39
    :try_start_0
    const-string v6, "HTTPUtils"

    const-string v7, "getCertUnSecureHttpClient"

    invoke-static {v6, v7}, Lcom/belkin/utils/LogUtils;->verboseLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 40
    invoke-static {}, Ljava/security/KeyStore;->getDefaultType()Ljava/lang/String;

    move-result-object v6

    invoke-static {v6}, Ljava/security/KeyStore;->getInstance(Ljava/lang/String;)Ljava/security/KeyStore;

    move-result-object v5

    .line 41
    .local v5, "trustStore":Ljava/security/KeyStore;
    const/4 v6, 0x0

    const/4 v7, 0x0

    invoke-virtual {v5, v6, v7}, Ljava/security/KeyStore;->load(Ljava/io/InputStream;[C)V

    .line 42
    new-instance v4, Lcom/belkin/cloud/utils/EasySSLSocketFactory;

    invoke-direct {v4, v5}, Lcom/belkin/cloud/utils/EasySSLSocketFactory;-><init>(Ljava/security/KeyStore;)V

    .line 43
    .local v4, "sf":Lorg/apache/http/conn/ssl/SSLSocketFactory;
    invoke-static {}, Lcom/belkin/wemo/cache/utils/Constants;->isStaging()Z

    move-result v6

    if-eqz v6, :cond_0

    .line 44
    sget-object v6, Lorg/apache/http/conn/ssl/SSLSocketFactory;->ALLOW_ALL_HOSTNAME_VERIFIER:Lorg/apache/http/conn/ssl/X509HostnameVerifier;

    invoke-virtual {v4, v6}, Lorg/apache/http/conn/ssl/SSLSocketFactory;->setHostnameVerifier(Lorg/apache/http/conn/ssl/X509HostnameVerifier;)V

    .line 46
    :cond_0
    new-instance v2, Lorg/apache/http/params/BasicHttpParams;

    invoke-direct {v2}, Lorg/apache/http/params/BasicHttpParams;-><init>()V

    .line 47
    .local v2, "params":Lorg/apache/http/params/HttpParams;
    sget-object v6, Lorg/apache/http/HttpVersion;->HTTP_1_1:Lorg/apache/http/HttpVersion;

    invoke-static {v2, v6}, Lorg/apache/http/params/HttpProtocolParams;->setVersion(Lorg/apache/http/params/HttpParams;Lorg/apache/http/ProtocolVersion;)V

    .line 48
    const-string v6, "UTF-8"

    invoke-static {v2, v6}, Lorg/apache/http/params/HttpProtocolParams;->setContentCharset(Lorg/apache/http/params/HttpParams;Ljava/lang/String;)V

    .line 49
    new-instance v3, Lorg/apache/http/conn/scheme/SchemeRegistry;

    invoke-direct {v3}, Lorg/apache/http/conn/scheme/SchemeRegistry;-><init>()V

    .line 50
    .local v3, "registry":Lorg/apache/http/conn/scheme/SchemeRegistry;
    new-instance v6, Lorg/apache/http/conn/scheme/Scheme;

    const-string v7, "http"

    invoke-static {}, Lorg/apache/http/conn/scheme/PlainSocketFactory;->getSocketFactory()Lorg/apache/http/conn/scheme/PlainSocketFactory;

    move-result-object v8

    const/16 v9, 0x50

    invoke-direct {v6, v7, v8, v9}, Lorg/apache/http/conn/scheme/Scheme;-><init>(Ljava/lang/String;Lorg/apache/http/conn/scheme/SocketFactory;I)V

    invoke-virtual {v3, v6}, Lorg/apache/http/conn/scheme/SchemeRegistry;->register(Lorg/apache/http/conn/scheme/Scheme;)Lorg/apache/http/conn/scheme/Scheme;

    .line 51
    new-instance v6, Lorg/apache/http/conn/scheme/Scheme;

    const-string v7, "https"

    const/16 v8, 0x1bb

    invoke-direct {v6, v7, v4, v8}, Lorg/apache/http/conn/scheme/Scheme;-><init>(Ljava/lang/String;Lorg/apache/http/conn/scheme/SocketFactory;I)V

    invoke-virtual {v3, v6}, Lorg/apache/http/conn/scheme/SchemeRegistry;->register(Lorg/apache/http/conn/scheme/Scheme;)Lorg/apache/http/conn/scheme/Scheme;

    .line 52
    new-instance v0, Lorg/apache/http/impl/conn/tsccm/ThreadSafeClientConnManager;

    invoke-direct {v0, v2, v3}, Lorg/apache/http/impl/conn/tsccm/ThreadSafeClientConnManager;-><init>(Lorg/apache/http/params/HttpParams;Lorg/apache/http/conn/scheme/SchemeRegistry;)V

    .line 53
    .local v0, "ccm":Lorg/apache/http/conn/ClientConnectionManager;
    new-instance v6, Lorg/apache/http/impl/client/DefaultHttpClient;

    invoke-direct {v6, v0, v2}, Lorg/apache/http/impl/client/DefaultHttpClient;-><init>(Lorg/apache/http/conn/ClientConnectionManager;Lorg/apache/http/params/HttpParams;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 56
    .end local v0    # "ccm":Lorg/apache/http/conn/ClientConnectionManager;
    .end local v2    # "params":Lorg/apache/http/params/HttpParams;
    .end local v3    # "registry":Lorg/apache/http/conn/scheme/SchemeRegistry;
    .end local v4    # "sf":Lorg/apache/http/conn/ssl/SSLSocketFactory;
    .end local v5    # "trustStore":Ljava/security/KeyStore;
    :goto_0
    return-object v6

    .line 54
    :catch_0
    move-exception v1

    .line 55
    .local v1, "e":Ljava/lang/Exception;
    const-string v6, "HTTPUtils"

    const-string v7, "Exception in getCertUnSecureHttpClient()"

    invoke-static {v6, v7, v1}, Lcom/belkin/utils/LogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 56
    new-instance v6, Lorg/apache/http/impl/client/DefaultHttpClient;

    invoke-direct {v6}, Lorg/apache/http/impl/client/DefaultHttpClient;-><init>()V

    goto :goto_0
.end method

.method private static getCloudCertSecureHttpClient(Landroid/content/Context;)Lorg/apache/http/client/HttpClient;
    .locals 11
    .param p0, "context"    # Landroid/content/Context;

    .prologue
    .line 62
    :try_start_0
    sget-object v7, Lcom/belkin/wemo/cache/utils/Constants;->KEY_STORE_TYPE:Ljava/lang/String;

    invoke-static {v7}, Ljava/security/KeyStore;->getInstance(Ljava/lang/String;)Ljava/security/KeyStore;

    move-result-object v6

    .line 64
    .local v6, "trustStore":Ljava/security/KeyStore;
    const-string v4, "https://api.xbcs.net:8443"

    .line 65
    .local v4, "setup":Ljava/lang/String;
    const/4 v5, 0x0

    .line 66
    .local v5, "sf":Lorg/apache/http/conn/ssl/SSLSocketFactory;
    const-string v7, "https://api.xbcs.net:8443"

    if-ne v4, v7, :cond_0

    .line 68
    invoke-virtual {p0}, Landroid/content/Context;->getAssets()Landroid/content/res/AssetManager;

    move-result-object v7

    sget-object v8, Lcom/belkin/wemo/cache/utils/Constants;->KEY_FILE_PRODUCTION:Ljava/lang/String;

    invoke-virtual {v7, v8}, Landroid/content/res/AssetManager;->open(Ljava/lang/String;)Ljava/io/InputStream;

    move-result-object v7

    sget-object v8, Lcom/belkin/wemo/cache/utils/Constants;->KEY_FILE_PRODUCTION_PASSWD:Ljava/lang/String;

    invoke-virtual {v8}, Ljava/lang/String;->toCharArray()[C

    move-result-object v8

    invoke-virtual {v6, v7, v8}, Ljava/security/KeyStore;->load(Ljava/io/InputStream;[C)V

    .line 69
    new-instance v5, Lcom/belkin/cloud/utils/EasySSLSocketFactory;

    .end local v5    # "sf":Lorg/apache/http/conn/ssl/SSLSocketFactory;
    invoke-direct {v5, v6}, Lcom/belkin/cloud/utils/EasySSLSocketFactory;-><init>(Ljava/security/KeyStore;)V

    .line 84
    .restart local v5    # "sf":Lorg/apache/http/conn/ssl/SSLSocketFactory;
    :goto_0
    const-string v7, "HTTPUtils"

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "getCloudCertSecureHttpClient: "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v5}, Lorg/apache/http/conn/ssl/SSLSocketFactory;->getHostnameVerifier()Lorg/apache/http/conn/ssl/X509HostnameVerifier;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-static {v7, v8}, Lcom/belkin/utils/LogUtils;->verboseLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 85
    new-instance v2, Lorg/apache/http/params/BasicHttpParams;

    invoke-direct {v2}, Lorg/apache/http/params/BasicHttpParams;-><init>()V

    .line 86
    .local v2, "params":Lorg/apache/http/params/HttpParams;
    sget-object v7, Lorg/apache/http/HttpVersion;->HTTP_1_1:Lorg/apache/http/HttpVersion;

    invoke-static {v2, v7}, Lorg/apache/http/params/HttpProtocolParams;->setVersion(Lorg/apache/http/params/HttpParams;Lorg/apache/http/ProtocolVersion;)V

    .line 87
    const-string v7, "UTF-8"

    invoke-static {v2, v7}, Lorg/apache/http/params/HttpProtocolParams;->setContentCharset(Lorg/apache/http/params/HttpParams;Ljava/lang/String;)V

    .line 89
    const/16 v7, 0x2710

    invoke-static {v2, v7}, Lorg/apache/http/params/HttpConnectionParams;->setConnectionTimeout(Lorg/apache/http/params/HttpParams;I)V

    .line 90
    const v7, 0x1d4c0

    invoke-static {v2, v7}, Lorg/apache/http/params/HttpConnectionParams;->setSoTimeout(Lorg/apache/http/params/HttpParams;I)V

    .line 91
    const/16 v7, 0x2000

    invoke-static {v2, v7}, Lorg/apache/http/params/HttpConnectionParams;->setSocketBufferSize(Lorg/apache/http/params/HttpParams;I)V

    .line 93
    new-instance v3, Lorg/apache/http/conn/scheme/SchemeRegistry;

    invoke-direct {v3}, Lorg/apache/http/conn/scheme/SchemeRegistry;-><init>()V

    .line 94
    .local v3, "registry":Lorg/apache/http/conn/scheme/SchemeRegistry;
    new-instance v7, Lorg/apache/http/conn/scheme/Scheme;

    const-string v8, "http"

    invoke-static {}, Lorg/apache/http/conn/scheme/PlainSocketFactory;->getSocketFactory()Lorg/apache/http/conn/scheme/PlainSocketFactory;

    move-result-object v9

    const/16 v10, 0x50

    invoke-direct {v7, v8, v9, v10}, Lorg/apache/http/conn/scheme/Scheme;-><init>(Ljava/lang/String;Lorg/apache/http/conn/scheme/SocketFactory;I)V

    invoke-virtual {v3, v7}, Lorg/apache/http/conn/scheme/SchemeRegistry;->register(Lorg/apache/http/conn/scheme/Scheme;)Lorg/apache/http/conn/scheme/Scheme;

    .line 95
    new-instance v7, Lorg/apache/http/conn/scheme/Scheme;

    const-string v8, "https"

    const/16 v9, 0x1bb

    invoke-direct {v7, v8, v5, v9}, Lorg/apache/http/conn/scheme/Scheme;-><init>(Ljava/lang/String;Lorg/apache/http/conn/scheme/SocketFactory;I)V

    invoke-virtual {v3, v7}, Lorg/apache/http/conn/scheme/SchemeRegistry;->register(Lorg/apache/http/conn/scheme/Scheme;)Lorg/apache/http/conn/scheme/Scheme;

    .line 96
    new-instance v7, Lorg/apache/http/conn/scheme/Scheme;

    const-string v8, "https"

    const/16 v9, 0x20fb

    invoke-direct {v7, v8, v5, v9}, Lorg/apache/http/conn/scheme/Scheme;-><init>(Ljava/lang/String;Lorg/apache/http/conn/scheme/SocketFactory;I)V

    invoke-virtual {v3, v7}, Lorg/apache/http/conn/scheme/SchemeRegistry;->register(Lorg/apache/http/conn/scheme/Scheme;)Lorg/apache/http/conn/scheme/Scheme;

    .line 97
    new-instance v0, Lorg/apache/http/impl/conn/tsccm/ThreadSafeClientConnManager;

    invoke-direct {v0, v2, v3}, Lorg/apache/http/impl/conn/tsccm/ThreadSafeClientConnManager;-><init>(Lorg/apache/http/params/HttpParams;Lorg/apache/http/conn/scheme/SchemeRegistry;)V

    .line 98
    .local v0, "ccm":Lorg/apache/http/conn/ClientConnectionManager;
    new-instance v7, Lorg/apache/http/impl/client/DefaultHttpClient;

    invoke-direct {v7, v0, v2}, Lorg/apache/http/impl/client/DefaultHttpClient;-><init>(Lorg/apache/http/conn/ClientConnectionManager;Lorg/apache/http/params/HttpParams;)V

    .line 101
    .end local v0    # "ccm":Lorg/apache/http/conn/ClientConnectionManager;
    .end local v2    # "params":Lorg/apache/http/params/HttpParams;
    .end local v3    # "registry":Lorg/apache/http/conn/scheme/SchemeRegistry;
    .end local v4    # "setup":Ljava/lang/String;
    .end local v5    # "sf":Lorg/apache/http/conn/ssl/SSLSocketFactory;
    .end local v6    # "trustStore":Ljava/security/KeyStore;
    :goto_1
    return-object v7

    .line 72
    .restart local v4    # "setup":Ljava/lang/String;
    .restart local v5    # "sf":Lorg/apache/http/conn/ssl/SSLSocketFactory;
    .restart local v6    # "trustStore":Ljava/security/KeyStore;
    :cond_0
    const-string v7, "https://bcsstag.lswf.net:8443"

    if-ne v4, v7, :cond_1

    .line 74
    invoke-virtual {p0}, Landroid/content/Context;->getAssets()Landroid/content/res/AssetManager;

    move-result-object v7

    sget-object v8, Lcom/belkin/wemo/cache/utils/Constants;->KEY_FILE_STAGING:Ljava/lang/String;

    invoke-virtual {v7, v8}, Landroid/content/res/AssetManager;->open(Ljava/lang/String;)Ljava/io/InputStream;

    move-result-object v7

    sget-object v8, Lcom/belkin/wemo/cache/utils/Constants;->KEY_FILE_STAGING_PASSWD:Ljava/lang/String;

    invoke-virtual {v8}, Ljava/lang/String;->toCharArray()[C

    move-result-object v8

    invoke-virtual {v6, v7, v8}, Ljava/security/KeyStore;->load(Ljava/io/InputStream;[C)V

    .line 75
    new-instance v5, Lcom/belkin/cloud/utils/EasySSLSocketFactory;

    .end local v5    # "sf":Lorg/apache/http/conn/ssl/SSLSocketFactory;
    invoke-direct {v5, v6}, Lcom/belkin/cloud/utils/EasySSLSocketFactory;-><init>(Ljava/security/KeyStore;)V

    .restart local v5    # "sf":Lorg/apache/http/conn/ssl/SSLSocketFactory;
    goto/16 :goto_0

    .line 80
    :cond_1
    invoke-virtual {p0}, Landroid/content/Context;->getAssets()Landroid/content/res/AssetManager;

    move-result-object v7

    sget-object v8, Lcom/belkin/wemo/cache/utils/Constants;->KEY_FILE_MINICLOUD:Ljava/lang/String;

    invoke-virtual {v7, v8}, Landroid/content/res/AssetManager;->open(Ljava/lang/String;)Ljava/io/InputStream;

    move-result-object v7

    sget-object v8, Lcom/belkin/wemo/cache/utils/Constants;->KEY_FILE_MCLOUD_PASSWD:Ljava/lang/String;

    invoke-virtual {v8}, Ljava/lang/String;->toCharArray()[C

    move-result-object v8

    invoke-virtual {v6, v7, v8}, Ljava/security/KeyStore;->load(Ljava/io/InputStream;[C)V

    .line 81
    new-instance v5, Lcom/belkin/cloud/utils/EasySSLSocketFactory;

    .end local v5    # "sf":Lorg/apache/http/conn/ssl/SSLSocketFactory;
    invoke-direct {v5, v6}, Lcom/belkin/cloud/utils/EasySSLSocketFactory;-><init>(Ljava/security/KeyStore;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .restart local v5    # "sf":Lorg/apache/http/conn/ssl/SSLSocketFactory;
    goto/16 :goto_0

    .line 99
    .end local v4    # "setup":Ljava/lang/String;
    .end local v5    # "sf":Lorg/apache/http/conn/ssl/SSLSocketFactory;
    .end local v6    # "trustStore":Ljava/security/KeyStore;
    :catch_0
    move-exception v1

    .line 100
    .local v1, "e":Ljava/lang/Exception;
    const-string v7, "HTTPUtils"

    const-string v8, "Exception in getCloudCertSecureHttpClient()"

    invoke-static {v7, v8, v1}, Lcom/belkin/utils/LogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 101
    new-instance v7, Lorg/apache/http/impl/client/DefaultHttpClient;

    invoke-direct {v7}, Lorg/apache/http/impl/client/DefaultHttpClient;-><init>()V

    goto :goto_1
.end method

.method public static getCloudNewHttpClient(Landroid/content/Context;)Lorg/apache/http/client/HttpClient;
    .locals 1
    .param p0, "context"    # Landroid/content/Context;

    .prologue
    .line 32
    sget-boolean v0, Lcom/belkin/wemo/cache/utils/Constants;->IS_CERT_VALIDATE_REQUIRED:Z

    if-eqz v0, :cond_0

    invoke-static {p0}, Lcom/belkin/cloud/utils/HTTPUtils;->getCloudCertSecureHttpClient(Landroid/content/Context;)Lorg/apache/http/client/HttpClient;

    move-result-object v0

    .line 33
    :goto_0
    return-object v0

    :cond_0
    invoke-static {p0}, Lcom/belkin/cloud/utils/HTTPUtils;->getCertUnSecureHttpClient(Landroid/content/Context;)Lorg/apache/http/client/HttpClient;

    move-result-object v0

    goto :goto_0
.end method
