.class public Lcom/belkin/remoteservice/BridgeAPI;
.super Ljava/lang/Object;
.source "BridgeAPI.java"


# static fields
.field private static final TAG:Ljava/lang/String;


# instance fields
.field private SERVICE_URL:Ljava/lang/String;

.field private context:Landroid/content/Context;

.field protected data:Ljava/lang/String;

.field private mSharePreference:Lcom/belkin/wemo/cache/utils/SharePreferences;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 20
    const-class v0, Lcom/belkin/remoteservice/BridgeAPI;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/belkin/remoteservice/BridgeAPI;->TAG:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .locals 1
    .param p1, "mContext"    # Landroid/content/Context;

    .prologue
    .line 26
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 21
    const-string v0, "http://"

    iput-object v0, p0, Lcom/belkin/remoteservice/BridgeAPI;->SERVICE_URL:Ljava/lang/String;

    .line 27
    iput-object p1, p0, Lcom/belkin/remoteservice/BridgeAPI;->context:Landroid/content/Context;

    .line 28
    new-instance v0, Lcom/belkin/wemo/cache/utils/SharePreferences;

    invoke-direct {v0, p1}, Lcom/belkin/wemo/cache/utils/SharePreferences;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/belkin/remoteservice/BridgeAPI;->mSharePreference:Lcom/belkin/wemo/cache/utils/SharePreferences;

    .line 29
    return-void
.end method

.method private getIpAdress()Ljava/lang/String;
    .locals 1

    .prologue
    .line 33
    iget-object v0, p0, Lcom/belkin/remoteservice/BridgeAPI;->mSharePreference:Lcom/belkin/wemo/cache/utils/SharePreferences;

    invoke-virtual {v0}, Lcom/belkin/wemo/cache/utils/SharePreferences;->getWemoBridgeIp()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method private isLocalNetwork()Z
    .locals 1

    .prologue
    .line 95
    invoke-static {}, Lcom/belkin/wemo/cache/utils/NetworkMode;->isLocal()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 96
    const/4 v0, 0x1

    .line 98
    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method


# virtual methods
.method public makeRequstToBridge(Ljava/lang/String;)V
    .locals 14
    .param p1, "udn"    # Ljava/lang/String;

    .prologue
    .line 38
    invoke-direct {p0}, Lcom/belkin/remoteservice/BridgeAPI;->getIpAdress()Ljava/lang/String;

    move-result-object v11

    const-string v12, ""

    if-eq v11, v12, :cond_3

    invoke-direct {p0}, Lcom/belkin/remoteservice/BridgeAPI;->isLocalNetwork()Z

    move-result v11

    if-eqz v11, :cond_3

    .line 40
    const/4 v9, 0x0

    .line 41
    .local v9, "url":Ljava/net/URL;
    new-instance v11, Ljava/lang/StringBuilder;

    invoke-direct {v11}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v12, p0, Lcom/belkin/remoteservice/BridgeAPI;->SERVICE_URL:Ljava/lang/String;

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-direct {p0}, Lcom/belkin/remoteservice/BridgeAPI;->getIpAdress()Ljava/lang/String;

    move-result-object v12

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    const-string v12, ":8888/removeDevice"

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 42
    .local v0, "bridge_url":Ljava/lang/String;
    move-object v2, p1

    .line 43
    .local v2, "data":Ljava/lang/String;
    const/4 v4, 0x0

    .line 45
    .local v4, "in":Ljava/io/BufferedInputStream;
    sget-object v11, Lcom/belkin/remoteservice/BridgeAPI;->TAG:Ljava/lang/String;

    new-instance v12, Ljava/lang/StringBuilder;

    invoke-direct {v12}, Ljava/lang/StringBuilder;-><init>()V

    const-string v13, "API call to remove device with UDN: "

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    const-string v13, " url "

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v12

    invoke-static {v11, v12}, Lcom/belkin/utils/LogUtils;->debugLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 48
    :try_start_0
    new-instance v10, Ljava/net/URL;

    invoke-direct {v10, v0}, Ljava/net/URL;-><init>(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1

    .line 49
    .end local v9    # "url":Ljava/net/URL;
    .local v10, "url":Ljava/net/URL;
    :try_start_1
    invoke-virtual {v10}, Ljava/net/URL;->openConnection()Ljava/net/URLConnection;

    move-result-object v1

    check-cast v1, Ljava/net/HttpURLConnection;

    .line 50
    .local v1, "connection":Ljava/net/HttpURLConnection;
    const-string v11, "Host"

    new-instance v12, Ljava/lang/StringBuilder;

    invoke-direct {v12}, Ljava/lang/StringBuilder;-><init>()V

    invoke-direct {p0}, Lcom/belkin/remoteservice/BridgeAPI;->getIpAdress()Ljava/lang/String;

    move-result-object v13

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    const-string v13, ":8888"

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v12

    invoke-virtual {v1, v11, v12}, Ljava/net/HttpURLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 51
    const-string v11, "POST"

    invoke-virtual {v1, v11}, Ljava/net/HttpURLConnection;->setRequestMethod(Ljava/lang/String;)V

    .line 52
    const-string v11, "Content-Type"

    const-string v12, "application/xml"

    invoke-virtual {v1, v11, v12}, Ljava/net/HttpURLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 54
    const v11, 0xea60

    invoke-virtual {v1, v11}, Ljava/net/HttpURLConnection;->setConnectTimeout(I)V

    .line 55
    const v11, 0xea60

    invoke-virtual {v1, v11}, Ljava/net/HttpURLConnection;->setReadTimeout(I)V

    .line 56
    const-string v11, "UDN"

    invoke-virtual {v1, v11, p1}, Ljava/net/HttpURLConnection;->addRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 57
    const-string v11, "Connection"

    const-string v12, "keep-alive"

    invoke-virtual {v1, v11, v12}, Ljava/net/HttpURLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 58
    const-string v11, "Proxy-Connection"

    const-string v12, "keep-alive"

    invoke-virtual {v1, v11, v12}, Ljava/net/HttpURLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 59
    const-string v11, "User-Agent"

    const-string v12, "Wemo/Brooklyn CFNetwork/889.9 Darwin/17.2.0"

    invoke-virtual {v1, v11, v12}, Ljava/net/HttpURLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 60
    const-string v11, "Accept"

    const-string v12, "application/xml"

    invoke-virtual {v1, v11, v12}, Ljava/net/HttpURLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 61
    const-string v11, "Accept-Language"

    const-string v12, "en-us"

    invoke-virtual {v1, v11, v12}, Ljava/net/HttpURLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 62
    const-string v11, "Accept-Encoding"

    const-string v12, "gzip, deflate"

    invoke-virtual {v1, v11, v12}, Ljava/net/HttpURLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 63
    const-string v11, "Content-Length"

    const-string v12, "0"

    invoke-virtual {v1, v11, v12}, Ljava/net/HttpURLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 66
    invoke-virtual {v1}, Ljava/net/HttpURLConnection;->getResponseCode()I

    move-result v8

    .line 67
    .local v8, "status":I
    sget-object v11, Lcom/belkin/remoteservice/BridgeAPI;->TAG:Ljava/lang/String;

    new-instance v12, Ljava/lang/StringBuilder;

    invoke-direct {v12}, Ljava/lang/StringBuilder;-><init>()V

    const-string v13, " status : "

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12, v8}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v12

    invoke-static {v11, v12}, Lcom/belkin/utils/LogUtils;->debugLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 69
    const/16 v11, 0xc8

    if-ne v8, v11, :cond_1

    .line 70
    sget-object v11, Lcom/belkin/remoteservice/BridgeAPI;->TAG:Ljava/lang/String;

    const-string v12, "Device Removed from HomeKitBridge"

    invoke-static {v11, v12}, Lcom/belkin/utils/LogUtils;->debugLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 71
    new-instance v5, Ljava/io/BufferedInputStream;

    invoke-virtual {v1}, Ljava/net/HttpURLConnection;->getInputStream()Ljava/io/InputStream;

    move-result-object v11

    invoke-direct {v5, v11}, Ljava/io/BufferedInputStream;-><init>(Ljava/io/InputStream;)V

    .end local v4    # "in":Ljava/io/BufferedInputStream;
    .local v5, "in":Ljava/io/BufferedInputStream;
    move-object v4, v5

    .line 78
    .end local v5    # "in":Ljava/io/BufferedInputStream;
    .restart local v4    # "in":Ljava/io/BufferedInputStream;
    :cond_0
    :goto_0
    new-instance v7, Ljava/io/BufferedReader;

    new-instance v11, Ljava/io/InputStreamReader;

    invoke-direct {v11, v4}, Ljava/io/InputStreamReader;-><init>(Ljava/io/InputStream;)V

    invoke-direct {v7, v11}, Ljava/io/BufferedReader;-><init>(Ljava/io/Reader;)V

    .line 79
    .local v7, "reader":Ljava/io/BufferedReader;
    const-string v6, ""

    .line 80
    .local v6, "line":Ljava/lang/String;
    :goto_1
    invoke-virtual {v7}, Ljava/io/BufferedReader;->readLine()Ljava/lang/String;

    move-result-object v6

    if-eqz v6, :cond_2

    .line 81
    sget-object v11, Lcom/belkin/remoteservice/BridgeAPI;->TAG:Ljava/lang/String;

    invoke-static {v11, v6}, Lcom/belkin/utils/LogUtils;->debugLog(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_1

    .line 84
    .end local v1    # "connection":Ljava/net/HttpURLConnection;
    .end local v6    # "line":Ljava/lang/String;
    .end local v7    # "reader":Ljava/io/BufferedReader;
    .end local v8    # "status":I
    :catch_0
    move-exception v3

    move-object v9, v10

    .line 85
    .end local v10    # "url":Ljava/net/URL;
    .local v3, "e":Ljava/lang/Exception;
    .restart local v9    # "url":Ljava/net/URL;
    :goto_2
    invoke-virtual {v3}, Ljava/lang/Exception;->printStackTrace()V

    .line 86
    sget-object v11, Lcom/belkin/remoteservice/BridgeAPI;->TAG:Ljava/lang/String;

    invoke-virtual {v3}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v12

    invoke-static {v11, v12}, Lcom/belkin/utils/LogUtils;->debugLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 92
    .end local v0    # "bridge_url":Ljava/lang/String;
    .end local v2    # "data":Ljava/lang/String;
    .end local v3    # "e":Ljava/lang/Exception;
    .end local v4    # "in":Ljava/io/BufferedInputStream;
    .end local v9    # "url":Ljava/net/URL;
    :goto_3
    return-void

    .line 73
    .restart local v0    # "bridge_url":Ljava/lang/String;
    .restart local v1    # "connection":Ljava/net/HttpURLConnection;
    .restart local v2    # "data":Ljava/lang/String;
    .restart local v4    # "in":Ljava/io/BufferedInputStream;
    .restart local v8    # "status":I
    .restart local v10    # "url":Ljava/net/URL;
    :cond_1
    const/16 v11, 0x190

    if-ne v8, v11, :cond_0

    .line 74
    :try_start_2
    new-instance v5, Ljava/io/BufferedInputStream;

    invoke-virtual {v1}, Ljava/net/HttpURLConnection;->getErrorStream()Ljava/io/InputStream;

    move-result-object v11

    invoke-direct {v5, v11}, Ljava/io/BufferedInputStream;-><init>(Ljava/io/InputStream;)V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0

    .end local v4    # "in":Ljava/io/BufferedInputStream;
    .restart local v5    # "in":Ljava/io/BufferedInputStream;
    move-object v4, v5

    .end local v5    # "in":Ljava/io/BufferedInputStream;
    .restart local v4    # "in":Ljava/io/BufferedInputStream;
    goto :goto_0

    .restart local v6    # "line":Ljava/lang/String;
    .restart local v7    # "reader":Ljava/io/BufferedReader;
    :cond_2
    move-object v9, v10

    .line 87
    .end local v10    # "url":Ljava/net/URL;
    .restart local v9    # "url":Ljava/net/URL;
    goto :goto_3

    .line 90
    .end local v0    # "bridge_url":Ljava/lang/String;
    .end local v1    # "connection":Ljava/net/HttpURLConnection;
    .end local v2    # "data":Ljava/lang/String;
    .end local v4    # "in":Ljava/io/BufferedInputStream;
    .end local v6    # "line":Ljava/lang/String;
    .end local v7    # "reader":Ljava/io/BufferedReader;
    .end local v8    # "status":I
    .end local v9    # "url":Ljava/net/URL;
    :cond_3
    sget-object v11, Lcom/belkin/remoteservice/BridgeAPI;->TAG:Ljava/lang/String;

    const-string v12, "NO BRIDGE IN NETWORK or NOT SUPPORTED DEVICE or REMOTE MODE"

    invoke-static {v11, v12}, Lcom/belkin/utils/LogUtils;->debugLog(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_3

    .line 84
    .restart local v0    # "bridge_url":Ljava/lang/String;
    .restart local v2    # "data":Ljava/lang/String;
    .restart local v4    # "in":Ljava/io/BufferedInputStream;
    .restart local v9    # "url":Ljava/net/URL;
    :catch_1
    move-exception v3

    goto :goto_2
.end method
