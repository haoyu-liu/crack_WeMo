.class public Lcom/belkin/cloud/CloudServiceBase;
.super Ljava/lang/Object;
.source "CloudServiceBase.java"


# instance fields
.field private authHeader:Ljava/lang/String;

.field protected data:Ljava/lang/String;

.field private mWiFiSecurityUtil:Lcom/belkin/utils/WiFiSecurityUtil;

.field protected result:Ljava/lang/String;

.field protected urlStr:Ljava/lang/String;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1
    .param p1, "mContext"    # Landroid/content/Context;

    .prologue
    .line 23
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 24
    iget-object v0, p0, Lcom/belkin/cloud/CloudServiceBase;->mWiFiSecurityUtil:Lcom/belkin/utils/WiFiSecurityUtil;

    invoke-virtual {v0, p1}, Lcom/belkin/utils/WiFiSecurityUtil;->generateAuthCode(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/belkin/cloud/CloudServiceBase;->authHeader:Ljava/lang/String;

    .line 25
    new-instance v0, Lcom/belkin/utils/WiFiSecurityUtil;

    invoke-direct {v0}, Lcom/belkin/utils/WiFiSecurityUtil;-><init>()V

    iput-object v0, p0, Lcom/belkin/cloud/CloudServiceBase;->mWiFiSecurityUtil:Lcom/belkin/utils/WiFiSecurityUtil;

    .line 26
    return-void
.end method


# virtual methods
.method public makeRequest()Ljava/lang/Object;
    .locals 13

    .prologue
    const/4 v12, 0x0

    .line 29
    const/4 v7, 0x0

    .line 31
    .local v7, "url":Ljava/net/URL;
    :try_start_0
    iget-object v9, p0, Lcom/belkin/cloud/CloudServiceBase;->authHeader:Ljava/lang/String;

    const/4 v10, 0x2

    invoke-virtual {v9, v10}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v9

    iput-object v9, p0, Lcom/belkin/cloud/CloudServiceBase;->authHeader:Ljava/lang/String;

    .line 32
    new-instance v8, Ljava/net/URL;

    iget-object v9, p0, Lcom/belkin/cloud/CloudServiceBase;->urlStr:Ljava/lang/String;

    invoke-direct {v8, v9}, Ljava/net/URL;-><init>(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1

    .line 34
    .end local v7    # "url":Ljava/net/URL;
    .local v8, "url":Ljava/net/URL;
    :try_start_1
    const-string v9, "TLS"

    invoke-static {v9}, Ljavax/net/ssl/SSLContext;->getInstance(Ljava/lang/String;)Ljavax/net/ssl/SSLContext;

    move-result-object v5

    .line 35
    .local v5, "sc":Ljavax/net/ssl/SSLContext;
    const/4 v9, 0x0

    const/4 v10, 0x0

    new-instance v11, Ljava/security/SecureRandom;

    invoke-direct {v11}, Ljava/security/SecureRandom;-><init>()V

    invoke-virtual {v5, v9, v10, v11}, Ljavax/net/ssl/SSLContext;->init([Ljavax/net/ssl/KeyManager;[Ljavax/net/ssl/TrustManager;Ljava/security/SecureRandom;)V

    .line 37
    invoke-virtual {v8}, Ljava/net/URL;->openConnection()Ljava/net/URLConnection;

    move-result-object v0

    check-cast v0, Ljavax/net/ssl/HttpsURLConnection;

    .line 38
    .local v0, "connection":Ljavax/net/ssl/HttpsURLConnection;
    invoke-virtual {v5}, Ljavax/net/ssl/SSLContext;->getSocketFactory()Ljavax/net/ssl/SSLSocketFactory;

    move-result-object v9

    invoke-virtual {v0, v9}, Ljavax/net/ssl/HttpsURLConnection;->setSSLSocketFactory(Ljavax/net/ssl/SSLSocketFactory;)V

    .line 39
    const-string v9, "Content-type"

    const-string v10, "application/xml"

    invoke-virtual {v0, v9, v10}, Ljavax/net/ssl/HttpsURLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 40
    const-string v9, "Authorization"

    iget-object v10, p0, Lcom/belkin/cloud/CloudServiceBase;->authHeader:Ljava/lang/String;

    invoke-virtual {v0, v9, v10}, Ljavax/net/ssl/HttpsURLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 41
    const/4 v9, 0x1

    invoke-virtual {v0, v9}, Ljavax/net/ssl/HttpsURLConnection;->setDoOutput(Z)V

    .line 42
    const/4 v9, 0x0

    invoke-virtual {v0, v9}, Ljavax/net/ssl/HttpsURLConnection;->setChunkedStreamingMode(I)V

    .line 43
    const-string v9, "POST"

    invoke-virtual {v0, v9}, Ljavax/net/ssl/HttpsURLConnection;->setRequestMethod(Ljava/lang/String;)V

    .line 45
    invoke-virtual {v0}, Ljavax/net/ssl/HttpsURLConnection;->getOutputStream()Ljava/io/OutputStream;

    move-result-object v4

    .line 46
    .local v4, "os":Ljava/io/OutputStream;
    iget-object v9, p0, Lcom/belkin/cloud/CloudServiceBase;->data:Ljava/lang/String;

    invoke-virtual {v9}, Ljava/lang/String;->getBytes()[B

    move-result-object v9

    invoke-virtual {v4, v9}, Ljava/io/OutputStream;->write([B)V

    .line 47
    invoke-virtual {v4}, Ljava/io/OutputStream;->flush()V

    .line 48
    invoke-virtual {v4}, Ljava/io/OutputStream;->close()V

    .line 50
    invoke-virtual {v0}, Ljavax/net/ssl/HttpsURLConnection;->getResponseCode()I

    move-result v6

    .line 52
    .local v6, "status":I
    const/16 v9, 0xc8

    if-ne v6, v9, :cond_1

    .line 53
    new-instance v2, Ljava/io/BufferedReader;

    new-instance v9, Ljava/io/InputStreamReader;

    invoke-virtual {v0}, Ljavax/net/ssl/HttpsURLConnection;->getInputStream()Ljava/io/InputStream;

    move-result-object v10

    invoke-direct {v9, v10}, Ljava/io/InputStreamReader;-><init>(Ljava/io/InputStream;)V

    invoke-direct {v2, v9}, Ljava/io/BufferedReader;-><init>(Ljava/io/Reader;)V

    .line 56
    .local v2, "in":Ljava/io/BufferedReader;
    :goto_0
    invoke-virtual {v2}, Ljava/io/BufferedReader;->readLine()Ljava/lang/String;

    move-result-object v3

    .local v3, "inputLine":Ljava/lang/String;
    if-eqz v3, :cond_0

    .line 57
    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v10, p0, Lcom/belkin/cloud/CloudServiceBase;->result:Ljava/lang/String;

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    iput-object v9, p0, Lcom/belkin/cloud/CloudServiceBase;->result:Ljava/lang/String;
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_0

    .line 64
    .end local v0    # "connection":Ljavax/net/ssl/HttpsURLConnection;
    .end local v2    # "in":Ljava/io/BufferedReader;
    .end local v3    # "inputLine":Ljava/lang/String;
    .end local v4    # "os":Ljava/io/OutputStream;
    .end local v5    # "sc":Ljavax/net/ssl/SSLContext;
    .end local v6    # "status":I
    :catch_0
    move-exception v1

    move-object v7, v8

    .line 65
    .end local v8    # "url":Ljava/net/URL;
    .local v1, "e":Ljava/lang/Exception;
    .restart local v7    # "url":Ljava/net/URL;
    :goto_1
    invoke-virtual {v1}, Ljava/lang/Exception;->printStackTrace()V

    .line 68
    invoke-static {v12}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v9

    .end local v1    # "e":Ljava/lang/Exception;
    :goto_2
    return-object v9

    .line 59
    .end local v7    # "url":Ljava/net/URL;
    .restart local v0    # "connection":Ljavax/net/ssl/HttpsURLConnection;
    .restart local v2    # "in":Ljava/io/BufferedReader;
    .restart local v3    # "inputLine":Ljava/lang/String;
    .restart local v4    # "os":Ljava/io/OutputStream;
    .restart local v5    # "sc":Ljavax/net/ssl/SSLContext;
    .restart local v6    # "status":I
    .restart local v8    # "url":Ljava/net/URL;
    :cond_0
    :try_start_2
    invoke-virtual {v2}, Ljava/io/BufferedReader;->close()V

    .line 63
    .end local v2    # "in":Ljava/io/BufferedReader;
    .end local v3    # "inputLine":Ljava/lang/String;
    :cond_1
    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0

    move-result-object v9

    move-object v7, v8

    .end local v8    # "url":Ljava/net/URL;
    .restart local v7    # "url":Ljava/net/URL;
    goto :goto_2

    .line 64
    .end local v0    # "connection":Ljavax/net/ssl/HttpsURLConnection;
    .end local v4    # "os":Ljava/io/OutputStream;
    .end local v5    # "sc":Ljavax/net/ssl/SSLContext;
    .end local v6    # "status":I
    :catch_1
    move-exception v1

    goto :goto_1
.end method
