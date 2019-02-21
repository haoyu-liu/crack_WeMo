.class public Lcom/belkin/wemo/cache/utils/SDKNetworkUtils;
.super Ljava/lang/Object;
.source "SDKNetworkUtils.java"


# static fields
.field private static final TAG:Ljava/lang/String; = "SDK_NetworkUtils"

.field public static mDLM:Lcom/belkin/wemo/cache/devicelist/DeviceListManager;


# instance fields
.field final MAX_DISCOVERY_ATTEMPT:I

.field final SLEEP_TIME:I

.field private mContext:Landroid/content/Context;

.field private sharePreference:Lcom/belkin/wemo/cache/utils/SharePreferences;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 35
    const/4 v0, 0x0

    sput-object v0, Lcom/belkin/wemo/cache/utils/SDKNetworkUtils;->mDLM:Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 39
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 36
    const/4 v0, 0x1

    iput v0, p0, Lcom/belkin/wemo/cache/utils/SDKNetworkUtils;->MAX_DISCOVERY_ATTEMPT:I

    .line 37
    const/16 v0, 0x190

    iput v0, p0, Lcom/belkin/wemo/cache/utils/SDKNetworkUtils;->SLEEP_TIME:I

    .line 40
    iput-object p1, p0, Lcom/belkin/wemo/cache/utils/SDKNetworkUtils;->mContext:Landroid/content/Context;

    .line 41
    new-instance v0, Lcom/belkin/wemo/cache/utils/SharePreferences;

    invoke-direct {v0, p1}, Lcom/belkin/wemo/cache/utils/SharePreferences;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/belkin/wemo/cache/utils/SDKNetworkUtils;->sharePreference:Lcom/belkin/wemo/cache/utils/SharePreferences;

    .line 42
    return-void
.end method

.method private static getMacFromArpCache(Ljava/lang/String;)Ljava/lang/String;
    .locals 9
    .param p0, "ip"    # Ljava/lang/String;

    .prologue
    const/4 v6, 0x0

    .line 228
    if-nez p0, :cond_1

    .line 259
    :cond_0
    :goto_0
    return-object v6

    .line 230
    :cond_1
    const/4 v0, 0x0

    .line 232
    .local v0, "br":Ljava/io/BufferedReader;
    :try_start_0
    new-instance v1, Ljava/io/BufferedReader;

    new-instance v7, Ljava/io/FileReader;

    const-string v8, "/proc/net/arp"

    invoke-direct {v7, v8}, Ljava/io/FileReader;-><init>(Ljava/lang/String;)V

    invoke-direct {v1, v7}, Ljava/io/BufferedReader;-><init>(Ljava/io/Reader;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_3
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 234
    .end local v0    # "br":Ljava/io/BufferedReader;
    .local v1, "br":Ljava/io/BufferedReader;
    :cond_2
    :try_start_1
    invoke-virtual {v1}, Ljava/io/BufferedReader;->readLine()Ljava/lang/String;

    move-result-object v3

    .local v3, "line":Ljava/lang/String;
    if-eqz v3, :cond_4

    .line 235
    const-string v7, " +"

    invoke-virtual {v3, v7}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v5

    .line 236
    .local v5, "splitted":[Ljava/lang/String;
    if-eqz v5, :cond_2

    array-length v7, v5

    const/4 v8, 0x4

    if-lt v7, v8, :cond_2

    const/4 v7, 0x0

    aget-object v7, v5, v7

    invoke-virtual {p0, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_2

    .line 238
    const/4 v7, 0x3

    aget-object v4, v5, v7

    .line 239
    .local v4, "mac":Ljava/lang/String;
    const-string v7, "..:..:..:..:..:.."

    invoke-virtual {v4, v7}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_3

    .line 240
    invoke-virtual {v1}, Ljava/io/BufferedReader;->close()V

    .line 241
    const-string v7, ":"

    const-string v8, ""

    invoke-virtual {v4, v7, v8}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/String;->toUpperCase()Ljava/lang/String;
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_6
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    move-result-object v6

    .line 251
    if-eqz v1, :cond_0

    .line 253
    :try_start_2
    invoke-virtual {v1}, Ljava/io/BufferedReader;->close()V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0

    goto :goto_0

    .line 254
    :catch_0
    move-exception v2

    .line 255
    .local v2, "e":Ljava/lang/Exception;
    invoke-virtual {v2}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_0

    .line 243
    .end local v2    # "e":Ljava/lang/Exception;
    :cond_3
    :try_start_3
    invoke-virtual {v1}, Ljava/io/BufferedReader;->close()V
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_6
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    .line 251
    if-eqz v1, :cond_0

    .line 253
    :try_start_4
    invoke-virtual {v1}, Ljava/io/BufferedReader;->close()V
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_1

    goto :goto_0

    .line 254
    :catch_1
    move-exception v2

    .line 255
    .restart local v2    # "e":Ljava/lang/Exception;
    invoke-virtual {v2}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_0

    .line 251
    .end local v2    # "e":Ljava/lang/Exception;
    .end local v4    # "mac":Ljava/lang/String;
    .end local v5    # "splitted":[Ljava/lang/String;
    :cond_4
    if-eqz v1, :cond_6

    .line 253
    :try_start_5
    invoke-virtual {v1}, Ljava/io/BufferedReader;->close()V
    :try_end_5
    .catch Ljava/lang/Exception; {:try_start_5 .. :try_end_5} :catch_2

    move-object v0, v1

    .line 256
    .end local v1    # "br":Ljava/io/BufferedReader;
    .restart local v0    # "br":Ljava/io/BufferedReader;
    goto :goto_0

    .line 254
    .end local v0    # "br":Ljava/io/BufferedReader;
    .restart local v1    # "br":Ljava/io/BufferedReader;
    :catch_2
    move-exception v2

    .line 255
    .restart local v2    # "e":Ljava/lang/Exception;
    invoke-virtual {v2}, Ljava/lang/Exception;->printStackTrace()V

    move-object v0, v1

    .line 256
    .end local v1    # "br":Ljava/io/BufferedReader;
    .restart local v0    # "br":Ljava/io/BufferedReader;
    goto :goto_0

    .line 248
    .end local v2    # "e":Ljava/lang/Exception;
    .end local v3    # "line":Ljava/lang/String;
    :catch_3
    move-exception v2

    .line 249
    .restart local v2    # "e":Ljava/lang/Exception;
    :goto_1
    :try_start_6
    invoke-virtual {v2}, Ljava/lang/Exception;->printStackTrace()V
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_0

    .line 251
    if-eqz v0, :cond_0

    .line 253
    :try_start_7
    invoke-virtual {v0}, Ljava/io/BufferedReader;->close()V
    :try_end_7
    .catch Ljava/lang/Exception; {:try_start_7 .. :try_end_7} :catch_4

    goto :goto_0

    .line 254
    :catch_4
    move-exception v2

    .line 255
    invoke-virtual {v2}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_0

    .line 251
    .end local v2    # "e":Ljava/lang/Exception;
    :catchall_0
    move-exception v6

    :goto_2
    if-eqz v0, :cond_5

    .line 253
    :try_start_8
    invoke-virtual {v0}, Ljava/io/BufferedReader;->close()V
    :try_end_8
    .catch Ljava/lang/Exception; {:try_start_8 .. :try_end_8} :catch_5

    .line 256
    :cond_5
    :goto_3
    throw v6

    .line 254
    :catch_5
    move-exception v2

    .line 255
    .restart local v2    # "e":Ljava/lang/Exception;
    invoke-virtual {v2}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_3

    .line 251
    .end local v0    # "br":Ljava/io/BufferedReader;
    .end local v2    # "e":Ljava/lang/Exception;
    .restart local v1    # "br":Ljava/io/BufferedReader;
    :catchall_1
    move-exception v6

    move-object v0, v1

    .end local v1    # "br":Ljava/io/BufferedReader;
    .restart local v0    # "br":Ljava/io/BufferedReader;
    goto :goto_2

    .line 248
    .end local v0    # "br":Ljava/io/BufferedReader;
    .restart local v1    # "br":Ljava/io/BufferedReader;
    :catch_6
    move-exception v2

    move-object v0, v1

    .end local v1    # "br":Ljava/io/BufferedReader;
    .restart local v0    # "br":Ljava/io/BufferedReader;
    goto :goto_1

    .end local v0    # "br":Ljava/io/BufferedReader;
    .restart local v1    # "br":Ljava/io/BufferedReader;
    .restart local v3    # "line":Ljava/lang/String;
    :cond_6
    move-object v0, v1

    .end local v1    # "br":Ljava/io/BufferedReader;
    .restart local v0    # "br":Ljava/io/BufferedReader;
    goto/16 :goto_0
.end method

.method private static intToIp(I)Ljava/lang/String;
    .locals 4
    .param p0, "ip"    # I

    .prologue
    .line 206
    const-string v0, "%d.%d.%d.%d"

    const/4 v1, 0x4

    new-array v1, v1, [Ljava/lang/Object;

    const/4 v2, 0x0

    and-int/lit16 v3, p0, 0xff

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    aput-object v3, v1, v2

    const/4 v2, 0x1

    shr-int/lit8 v3, p0, 0x8

    and-int/lit16 v3, v3, 0xff

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    aput-object v3, v1, v2

    const/4 v2, 0x2

    shr-int/lit8 v3, p0, 0x10

    and-int/lit16 v3, v3, 0xff

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    aput-object v3, v1, v2

    const/4 v2, 0x3

    shr-int/lit8 v3, p0, 0x18

    and-int/lit16 v3, v3, 0xff

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    aput-object v3, v1, v2

    invoke-static {v0, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method


# virtual methods
.method public bindToNetwork()V
    .locals 5

    .prologue
    .line 322
    iget-object v3, p0, Lcom/belkin/wemo/cache/utils/SDKNetworkUtils;->mContext:Landroid/content/Context;

    const-string v4, "connectivity"

    invoke-virtual {v3, v4}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/net/ConnectivityManager;

    .line 323
    .local v0, "connectivityManager":Landroid/net/ConnectivityManager;
    sget v3, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v4, 0x17

    if-lt v3, v4, :cond_0

    .line 324
    new-instance v2, Landroid/net/NetworkRequest$Builder;

    invoke-direct {v2}, Landroid/net/NetworkRequest$Builder;-><init>()V

    .line 325
    .local v2, "request":Landroid/net/NetworkRequest$Builder;
    const/4 v3, 0x1

    invoke-virtual {v2, v3}, Landroid/net/NetworkRequest$Builder;->addTransportType(I)Landroid/net/NetworkRequest$Builder;

    .line 328
    :try_start_0
    invoke-virtual {v2}, Landroid/net/NetworkRequest$Builder;->build()Landroid/net/NetworkRequest;

    move-result-object v3

    new-instance v4, Lcom/belkin/wemo/cache/utils/SDKNetworkUtils$1;

    invoke-direct {v4, p0, v0}, Lcom/belkin/wemo/cache/utils/SDKNetworkUtils$1;-><init>(Lcom/belkin/wemo/cache/utils/SDKNetworkUtils;Landroid/net/ConnectivityManager;)V

    invoke-virtual {v0, v3, v4}, Landroid/net/ConnectivityManager;->requestNetwork(Landroid/net/NetworkRequest;Landroid/net/ConnectivityManager$NetworkCallback;)V
    :try_end_0
    .catch Ljava/lang/SecurityException; {:try_start_0 .. :try_end_0} :catch_0

    .line 348
    .end local v2    # "request":Landroid/net/NetworkRequest$Builder;
    :cond_0
    :goto_0
    return-void

    .line 343
    .restart local v2    # "request":Landroid/net/NetworkRequest$Builder;
    :catch_0
    move-exception v1

    .line 344
    .local v1, "e":Ljava/lang/SecurityException;
    invoke-virtual {v1}, Ljava/lang/SecurityException;->printStackTrace()V

    goto :goto_0
.end method

.method public deviceNetworkType()Ljava/lang/String;
    .locals 4

    .prologue
    .line 371
    invoke-virtual {p0}, Lcom/belkin/wemo/cache/utils/SDKNetworkUtils;->getSSID()Ljava/lang/String;

    move-result-object v1

    .line 372
    .local v1, "ssid":Ljava/lang/String;
    iget-object v2, p0, Lcom/belkin/wemo/cache/utils/SDKNetworkUtils;->mContext:Landroid/content/Context;

    invoke-static {v2}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->getInstance(Landroid/content/Context;)Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    move-result-object v2

    sput-object v2, Lcom/belkin/wemo/cache/utils/SDKNetworkUtils;->mDLM:Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    .line 373
    const/4 v0, 0x0

    .line 374
    .local v0, "size":I
    if-eqz v1, :cond_3

    .line 375
    const-string v2, "Home"

    invoke-virtual {p0}, Lcom/belkin/wemo/cache/utils/SDKNetworkUtils;->getNetworkType()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 391
    const-string v2, "devices"

    .line 398
    :goto_0
    return-object v2

    .line 392
    :cond_0
    const-string v2, "Remote_WiFi"

    invoke-virtual {p0}, Lcom/belkin/wemo/cache/utils/SDKNetworkUtils;->getNetworkType()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_1

    const-string v2, "Remote_Mobile"

    invoke-virtual {p0}, Lcom/belkin/wemo/cache/utils/SDKNetworkUtils;->getNetworkType()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_2

    .line 393
    :cond_1
    const-string v2, "devices"

    goto :goto_0

    .line 395
    :cond_2
    const-string v2, "index"

    goto :goto_0

    .line 398
    :cond_3
    const-string v2, "index"

    goto :goto_0
.end method

.method public forceConnectToAP(Ljava/lang/String;Z)Z
    .locals 8
    .param p1, "accessPoint"    # Ljava/lang/String;
    .param p2, "isSmart"    # Z

    .prologue
    const/4 v3, 0x1

    const/4 v4, 0x0

    .line 474
    invoke-virtual {p0}, Lcom/belkin/wemo/cache/utils/SDKNetworkUtils;->getSSID()Ljava/lang/String;

    move-result-object v0

    .line 475
    .local v0, "currentSSID":Ljava/lang/String;
    if-nez p2, :cond_2

    .line 477
    invoke-virtual {p1, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_1

    .line 500
    :cond_0
    :goto_0
    return v3

    :cond_1
    move v3, v4

    .line 482
    goto :goto_0

    .line 485
    :cond_2
    const-string v2, ""

    .line 486
    .local v2, "networkType":Ljava/lang/String;
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_1
    const/4 v5, 0x5

    if-ge v1, v5, :cond_4

    .line 488
    invoke-virtual {p0}, Lcom/belkin/wemo/cache/utils/SDKNetworkUtils;->getNetworkType()Ljava/lang/String;

    move-result-object v2

    .line 489
    invoke-virtual {p0}, Lcom/belkin/wemo/cache/utils/SDKNetworkUtils;->getSSID()Ljava/lang/String;

    move-result-object v0

    .line 492
    const-string v5, "WEMO"

    invoke-virtual {v5, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_3

    invoke-virtual {p1, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v5

    if-nez v5, :cond_0

    .line 497
    :cond_3
    const-wide/16 v6, 0x7d0

    :try_start_0
    invoke-static {v6, v7}, Ljava/lang/Thread;->sleep(J)V
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0

    .line 486
    :goto_2
    add-int/lit8 v1, v1, 0x1

    goto :goto_1

    :cond_4
    move v3, v4

    .line 500
    goto :goto_0

    .line 498
    :catch_0
    move-exception v5

    goto :goto_2
.end method

.method public generateAuthCode()Lorg/json/JSONArray;
    .locals 20

    .prologue
    .line 437
    new-instance v2, Lorg/json/JSONArray;

    invoke-direct {v2}, Lorg/json/JSONArray;-><init>()V

    .line 439
    .local v2, "array":Lorg/json/JSONArray;
    const/4 v9, 0x0

    .line 440
    .local v9, "strAuthorizationHeader":Ljava/lang/String;
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v16

    const-wide/16 v18, 0x3e8

    div-long v16, v16, v18

    const-wide/16 v18, 0xc8

    add-long v6, v16, v18

    .line 442
    .local v6, "lExpirationTime":J
    new-instance v15, Lcom/belkin/wemo/cache/utils/WiFiSecurityUtil;

    invoke-direct {v15}, Lcom/belkin/wemo/cache/utils/WiFiSecurityUtil;-><init>()V

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/wemo/cache/utils/SDKNetworkUtils;->mContext:Landroid/content/Context;

    move-object/from16 v16, v0

    invoke-virtual/range {v15 .. v16}, Lcom/belkin/wemo/cache/utils/WiFiSecurityUtil;->getDeviceID(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v14

    .line 444
    .local v14, "strUniqueID":Ljava/lang/String;
    new-instance v15, Ljava/lang/StringBuilder;

    invoke-direct {v15}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v15, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    const-string v16, "\n"

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    const-string v16, "\n"

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    invoke-virtual {v15, v6, v7}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v15

    invoke-virtual {v15}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    .line 445
    .local v10, "strBaseString":Ljava/lang/String;
    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/belkin/wemo/cache/utils/SDKNetworkUtils;->sharePreference:Lcom/belkin/wemo/cache/utils/SharePreferences;

    invoke-virtual {v15}, Lcom/belkin/wemo/cache/utils/SharePreferences;->getCurrentLocationHomeId()Ljava/lang/String;

    move-result-object v11

    .line 446
    .local v11, "strHomeID":Ljava/lang/String;
    if-eqz v11, :cond_0

    invoke-virtual {v11}, Ljava/lang/String;->length()I

    move-result v15

    if-nez v15, :cond_1

    .line 447
    :cond_0
    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/belkin/wemo/cache/utils/SDKNetworkUtils;->sharePreference:Lcom/belkin/wemo/cache/utils/SharePreferences;

    invoke-virtual {v15}, Lcom/belkin/wemo/cache/utils/SharePreferences;->getHomeId()Ljava/lang/String;

    move-result-object v11

    .line 449
    :cond_1
    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/belkin/wemo/cache/utils/SDKNetworkUtils;->sharePreference:Lcom/belkin/wemo/cache/utils/SharePreferences;

    invoke-virtual {v15}, Lcom/belkin/wemo/cache/utils/SharePreferences;->getPrivateKey()Ljava/lang/String;

    move-result-object v12

    .line 452
    .local v12, "strPrivateKey":Ljava/lang/String;
    const/4 v13, 0x0

    .line 454
    .local v13, "strSignature":Ljava/lang/String;
    if-eqz v12, :cond_2

    .line 456
    :try_start_0
    const-string v15, "HmacSHA1"

    invoke-static {v15}, Ljavax/crypto/Mac;->getInstance(Ljava/lang/String;)Ljavax/crypto/Mac;

    move-result-object v5

    .line 457
    .local v5, "mac":Ljavax/crypto/Mac;
    new-instance v8, Ljavax/crypto/spec/SecretKeySpec;

    invoke-virtual {v12}, Ljava/lang/String;->getBytes()[B

    move-result-object v15

    invoke-virtual {v5}, Ljavax/crypto/Mac;->getAlgorithm()Ljava/lang/String;

    move-result-object v16

    move-object/from16 v0, v16

    invoke-direct {v8, v15, v0}, Ljavax/crypto/spec/SecretKeySpec;-><init>([BLjava/lang/String;)V

    .line 458
    .local v8, "secret":Ljavax/crypto/spec/SecretKeySpec;
    invoke-virtual {v5, v8}, Ljavax/crypto/Mac;->init(Ljava/security/Key;)V

    .line 459
    invoke-virtual {v10}, Ljava/lang/String;->getBytes()[B

    move-result-object v15

    invoke-virtual {v5, v15}, Ljavax/crypto/Mac;->doFinal([B)[B

    move-result-object v3

    .line 460
    .local v3, "digest":[B
    new-instance v15, Ljava/lang/String;

    const/16 v16, 0x0

    move/from16 v0, v16

    invoke-static {v3, v0}, Landroid/util/Base64;->encode([BI)[B

    move-result-object v16

    invoke-direct/range {v15 .. v16}, Ljava/lang/String;-><init>([B)V

    invoke-virtual {v15}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v13

    .line 461
    new-instance v15, Ljava/lang/StringBuilder;

    invoke-direct {v15}, Ljava/lang/StringBuilder;-><init>()V

    const-string v16, "SDU "

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    invoke-virtual {v15, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    const-string v16, ":"

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    invoke-virtual {v15, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    const-string v16, ":"

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    invoke-virtual {v15, v6, v7}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v15

    invoke-virtual {v15}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v9

    .line 467
    .end local v3    # "digest":[B
    .end local v5    # "mac":Ljavax/crypto/Mac;
    .end local v8    # "secret":Ljavax/crypto/spec/SecretKeySpec;
    :cond_2
    :goto_0
    invoke-virtual {v2, v9}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;

    .line 468
    invoke-virtual {v2, v11}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;

    .line 469
    return-object v2

    .line 462
    :catch_0
    move-exception v4

    .line 463
    .local v4, "excep":Ljava/lang/Exception;
    invoke-virtual {v4}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_0
.end method

.method public getAPData()Ljava/lang/String;
    .locals 7

    .prologue
    const/16 v6, 0x1e

    const/4 v5, 0x1

    .line 511
    const-string v0, ""

    .line 512
    .local v0, "apValues":Ljava/lang/String;
    const-string v2, ""

    .line 513
    .local v2, "friendlyName":Ljava/lang/String;
    const/16 v3, 0x64

    .line 515
    .local v3, "signalStrength":I
    iget-object v4, p0, Lcom/belkin/wemo/cache/utils/SDKNetworkUtils;->sharePreference:Lcom/belkin/wemo/cache/utils/SharePreferences;

    invoke-virtual {v4}, Lcom/belkin/wemo/cache/utils/SharePreferences;->getAPValues()Ljava/lang/String;

    move-result-object v0

    .line 516
    const-string v4, "\\|"

    invoke-virtual {v0, v4}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v1

    .line 517
    .local v1, "dataArray":[Ljava/lang/String;
    array-length v4, v1

    if-le v4, v5, :cond_0

    .line 518
    const/4 v4, 0x0

    aget-object v4, v1, v4

    invoke-static {v4}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v3

    .line 520
    aget-object v2, v1, v5

    .line 524
    :cond_0
    if-le v3, v6, :cond_2

    .line 525
    const-string v2, ""

    .line 531
    .end local v2    # "friendlyName":Ljava/lang/String;
    :cond_1
    :goto_0
    return-object v2

    .line 527
    .restart local v2    # "friendlyName":Ljava/lang/String;
    :cond_2
    if-lt v3, v6, :cond_1

    .line 530
    iget-object v4, p0, Lcom/belkin/wemo/cache/utils/SDKNetworkUtils;->sharePreference:Lcom/belkin/wemo/cache/utils/SharePreferences;

    const-string v5, "100"

    invoke-virtual {v4, v5}, Lcom/belkin/wemo/cache/utils/SharePreferences;->saveAPValues(Ljava/lang/String;)V

    goto :goto_0
.end method

.method public getArpMac()Ljava/lang/String;
    .locals 1

    .prologue
    .line 431
    invoke-virtual {p0}, Lcom/belkin/wemo/cache/utils/SDKNetworkUtils;->getMacFromArpCache()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getCurrentLocationHomeId()Ljava/lang/String;
    .locals 1

    .prologue
    .line 547
    iget-object v0, p0, Lcom/belkin/wemo/cache/utils/SDKNetworkUtils;->sharePreference:Lcom/belkin/wemo/cache/utils/SharePreferences;

    invoke-virtual {v0}, Lcom/belkin/wemo/cache/utils/SharePreferences;->getCurrentLocationHomeId()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getDefaultGatewayIP()Ljava/lang/String;
    .locals 6

    .prologue
    .line 191
    const/4 v2, 0x0

    .line 193
    .local v2, "ip":Ljava/lang/String;
    :try_start_0
    iget-object v4, p0, Lcom/belkin/wemo/cache/utils/SDKNetworkUtils;->mContext:Landroid/content/Context;

    const-string v5, "wifi"

    invoke-virtual {v4, v5}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroid/net/wifi/WifiManager;

    .line 194
    .local v3, "wifiMgr":Landroid/net/wifi/WifiManager;
    invoke-virtual {v3}, Landroid/net/wifi/WifiManager;->getDhcpInfo()Landroid/net/DhcpInfo;

    move-result-object v0

    .line 196
    .local v0, "dInfo":Landroid/net/DhcpInfo;
    iget v4, v0, Landroid/net/DhcpInfo;->gateway:I

    invoke-static {v4}, Lcom/belkin/wemo/cache/utils/SDKNetworkUtils;->intToIp(I)Ljava/lang/String;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v2

    .line 201
    .end local v0    # "dInfo":Landroid/net/DhcpInfo;
    .end local v3    # "wifiMgr":Landroid/net/wifi/WifiManager;
    :goto_0
    return-object v2

    .line 197
    :catch_0
    move-exception v1

    .line 199
    .local v1, "e":Ljava/lang/Exception;
    invoke-virtual {v1}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_0
.end method

.method public getMacFromArpCache()Ljava/lang/String;
    .locals 7

    .prologue
    .line 171
    invoke-virtual {p0}, Lcom/belkin/wemo/cache/utils/SDKNetworkUtils;->getDefaultGatewayIP()Ljava/lang/String;

    move-result-object v0

    .line 172
    .local v0, "defaultGtwIP":Ljava/lang/String;
    invoke-static {v0}, Lcom/belkin/wemo/cache/utils/SDKNetworkUtils;->getMacFromArpCache(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 173
    .local v2, "mac":Ljava/lang/String;
    const/4 v3, 0x0

    .line 174
    .local v3, "tries":I
    :goto_0
    if-eqz v2, :cond_0

    sget-object v4, Lcom/belkin/wemo/cache/utils/Constants;->DEFAULT_MAC:Ljava/lang/String;

    invoke-virtual {v4, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_0

    sget v4, Lcom/belkin/wemo/cache/utils/Constants;->ARPMAC_RETRIES:I

    if-ge v3, v4, :cond_0

    .line 176
    add-int/lit8 v3, v3, 0x1

    .line 178
    :try_start_0
    sget v4, Lcom/belkin/wemo/cache/utils/Constants;->ARPMAC_RETRIES_INTERVAL:I

    int-to-long v4, v4

    invoke-static {v4, v5}, Ljava/lang/Thread;->sleep(J)V

    .line 179
    invoke-static {v0}, Lcom/belkin/wemo/cache/utils/SDKNetworkUtils;->getMacFromArpCache(Ljava/lang/String;)Ljava/lang/String;
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v2

    goto :goto_0

    .line 180
    :catch_0
    move-exception v1

    .line 182
    .local v1, "e":Ljava/lang/InterruptedException;
    invoke-virtual {v1}, Ljava/lang/InterruptedException;->printStackTrace()V

    goto :goto_0

    .line 185
    .end local v1    # "e":Ljava/lang/InterruptedException;
    :cond_0
    if-eqz v2, :cond_1

    sget-object v4, Lcom/belkin/wemo/cache/utils/Constants;->DEFAULT_MAC:Ljava/lang/String;

    invoke-virtual {v4, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_1

    const/4 v2, 0x0

    .line 186
    :cond_1
    const-string v4, "SDK_NetworkUtils"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "getMacFromArpCach mac: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, " defaultGtwIP: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, " tries: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 187
    return-object v2
.end method

.method public getNetworkName()Ljava/lang/String;
    .locals 7

    .prologue
    .line 263
    const-string v4, "No Network"

    .line 265
    .local v4, "noNetwork":Ljava/lang/String;
    :try_start_0
    invoke-virtual {p0}, Lcom/belkin/wemo/cache/utils/SDKNetworkUtils;->isPluginConnected()Z

    move-result v5

    if-nez v5, :cond_3

    .line 266
    iget-object v5, p0, Lcom/belkin/wemo/cache/utils/SDKNetworkUtils;->mContext:Landroid/content/Context;

    const-string v6, "connectivity"

    invoke-virtual {v5, v6}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/net/ConnectivityManager;

    .line 267
    .local v0, "connectivityManager":Landroid/net/ConnectivityManager;
    invoke-virtual {v0}, Landroid/net/ConnectivityManager;->getActiveNetworkInfo()Landroid/net/NetworkInfo;

    move-result-object v2

    .line 268
    .local v2, "networkInfo":Landroid/net/NetworkInfo;
    if-nez v2, :cond_1

    .line 284
    .end local v0    # "connectivityManager":Landroid/net/ConnectivityManager;
    .end local v2    # "networkInfo":Landroid/net/NetworkInfo;
    .end local v4    # "noNetwork":Ljava/lang/String;
    :cond_0
    :goto_0
    return-object v4

    .line 270
    .restart local v0    # "connectivityManager":Landroid/net/ConnectivityManager;
    .restart local v2    # "networkInfo":Landroid/net/NetworkInfo;
    .restart local v4    # "noNetwork":Ljava/lang/String;
    :cond_1
    invoke-virtual {v2}, Landroid/net/NetworkInfo;->isConnected()Z

    move-result v5

    if-eqz v5, :cond_0

    .line 271
    invoke-virtual {v2}, Landroid/net/NetworkInfo;->getTypeName()Ljava/lang/String;

    move-result-object v3

    .line 273
    .local v3, "networkType":Ljava/lang/String;
    const-string v5, "MOBILE"

    invoke-virtual {v3, v5}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_2

    .line 274
    const-string v4, "Cellular"

    goto :goto_0

    .line 276
    :cond_2
    invoke-virtual {p0}, Lcom/belkin/wemo/cache/utils/SDKNetworkUtils;->getSSID()Ljava/lang/String;

    move-result-object v4

    goto :goto_0

    .line 279
    .end local v0    # "connectivityManager":Landroid/net/ConnectivityManager;
    .end local v2    # "networkInfo":Landroid/net/NetworkInfo;
    .end local v3    # "networkType":Ljava/lang/String;
    :cond_3
    invoke-virtual {p0}, Lcom/belkin/wemo/cache/utils/SDKNetworkUtils;->getSSID()Ljava/lang/String;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v4

    goto :goto_0

    .line 281
    :catch_0
    move-exception v1

    .line 282
    .local v1, "e":Ljava/lang/Exception;
    invoke-virtual {v1}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_0
.end method

.method public getNetworkType()Ljava/lang/String;
    .locals 17

    .prologue
    .line 64
    const/4 v1, 0x0

    .line 65
    .local v1, "appNetworkType":Ljava/lang/String;
    const/4 v9, 0x0

    .line 66
    .local v9, "networkType":Ljava/lang/String;
    const/4 v10, 0x1

    .line 68
    .local v10, "onRemote":Z
    :try_start_0
    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/belkin/wemo/cache/utils/SDKNetworkUtils;->mContext:Landroid/content/Context;

    const-string v15, "connectivity"

    invoke-virtual {v14, v15}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/net/ConnectivityManager;

    .line 69
    .local v2, "connectivityManager":Landroid/net/ConnectivityManager;
    invoke-virtual {v2}, Landroid/net/ConnectivityManager;->getActiveNetworkInfo()Landroid/net/NetworkInfo;

    move-result-object v8

    .line 70
    .local v8, "networkInfo":Landroid/net/NetworkInfo;
    if-nez v8, :cond_4

    .line 71
    const-string v1, "No_Network"
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 154
    .end local v2    # "connectivityManager":Landroid/net/ConnectivityManager;
    .end local v8    # "networkInfo":Landroid/net/NetworkInfo;
    :cond_0
    :goto_0
    const-string v14, "SDK_NetworkUtils"

    new-instance v15, Ljava/lang/StringBuilder;

    invoke-direct {v15}, Ljava/lang/StringBuilder;-><init>()V

    const-string v16, "Forced Remote: appNetworkType: "

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    invoke-virtual {v15, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    const-string v16, " SmartDiscovery.isForcedRemoteEnabled: "

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    sget-boolean v16, Lcom/belkin/wemo/cache/cloud/SmartDiscovery;->isForcedRemoteEnabled:Z

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v15

    invoke-virtual {v15}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v15

    invoke-static {v14, v15}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 155
    if-nez v1, :cond_1

    .line 156
    const-string v1, "No_Network"

    .line 157
    :cond_1
    const-string v14, "Remote_Mobile"

    invoke-virtual {v14, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v14

    if-nez v14, :cond_2

    const-string v14, "Remote_WiFi"

    invoke-virtual {v14, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v14

    if-eqz v14, :cond_13

    .line 158
    :cond_2
    const/4 v14, 0x0

    invoke-static {v14}, Lcom/belkin/wemo/cache/utils/NetworkMode;->setLocal(Z)V

    .line 163
    :goto_1
    sget-boolean v14, Lcom/belkin/wemo/cache/cloud/SmartDiscovery;->isForcedRemoteEnabled:Z

    if-eqz v14, :cond_3

    .line 164
    const/4 v14, 0x0

    invoke-static {v14}, Lcom/belkin/wemo/cache/utils/NetworkMode;->setLocal(Z)V

    .line 165
    :cond_3
    const-string v14, "SDK_NetworkUtils"

    new-instance v15, Ljava/lang/StringBuilder;

    invoke-direct {v15}, Ljava/lang/StringBuilder;-><init>()V

    const-string v16, "Forced Remote: NetworkMode.setLocal(false): "

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    invoke-static {}, Lcom/belkin/wemo/cache/utils/NetworkMode;->isLocal()Z

    move-result v16

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v15

    invoke-virtual {v15}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v15

    invoke-static {v14, v15}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 166
    return-object v1

    .line 72
    .restart local v2    # "connectivityManager":Landroid/net/ConnectivityManager;
    .restart local v8    # "networkInfo":Landroid/net/NetworkInfo;
    :cond_4
    :try_start_1
    invoke-virtual/range {p0 .. p0}, Lcom/belkin/wemo/cache/utils/SDKNetworkUtils;->isPluginConnected()Z

    move-result v14

    if-nez v14, :cond_12

    .line 74
    invoke-virtual {v8}, Landroid/net/NetworkInfo;->isConnected()Z

    move-result v14

    if-eqz v14, :cond_0

    .line 75
    invoke-virtual {v8}, Landroid/net/NetworkInfo;->getTypeName()Ljava/lang/String;

    move-result-object v9

    .line 76
    const-string v14, "MOBILE"

    invoke-virtual {v9, v14}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v14

    if-eqz v14, :cond_5

    .line 77
    const-string v1, "Remote_Mobile"

    goto :goto_0

    .line 81
    :cond_5
    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/belkin/wemo/cache/utils/SDKNetworkUtils;->sharePreference:Lcom/belkin/wemo/cache/utils/SharePreferences;

    invoke-virtual {v14}, Lcom/belkin/wemo/cache/utils/SharePreferences;->getHomeSSIDs()Ljava/util/Set;

    move-result-object v11

    .line 82
    .local v11, "ssids":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/String;>;"
    invoke-virtual/range {p0 .. p0}, Lcom/belkin/wemo/cache/utils/SDKNetworkUtils;->getSSID()Ljava/lang/String;

    move-result-object v4

    .line 83
    .local v4, "currentWiFiNetwork":Ljava/lang/String;
    const-string v14, "WIFI"

    invoke-virtual {v9, v14}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v14

    if-eqz v14, :cond_0

    .line 84
    if-eqz v4, :cond_0

    .line 85
    invoke-virtual {v4}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v14

    const-string v15, "wemo."

    invoke-virtual {v14, v15}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v14

    if-eqz v14, :cond_6

    .line 86
    const-string v1, "WEMO"

    goto/16 :goto_0

    .line 87
    :cond_6
    const-string v14, "NetCam"

    invoke-virtual {v4, v14}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v14

    if-eqz v14, :cond_7

    .line 88
    const-string v1, "net_cam"

    goto/16 :goto_0

    .line 89
    :cond_7
    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/belkin/wemo/cache/utils/SDKNetworkUtils;->sharePreference:Lcom/belkin/wemo/cache/utils/SharePreferences;

    invoke-virtual {v14}, Lcom/belkin/wemo/cache/utils/SharePreferences;->isRemoteEnabled()Z

    move-result v14

    if-eqz v14, :cond_11

    .line 90
    const/4 v6, 0x1

    .line 91
    .local v6, "isRemoteMode":Z
    const-string v14, "SDK_NetworkUtils"

    new-instance v15, Ljava/lang/StringBuilder;

    invoke-direct {v15}, Ljava/lang/StringBuilder;-><init>()V

    const-string v16, "Forced Remote: isRemoteMode: "

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    invoke-virtual {v15, v6}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v15

    invoke-virtual {v15}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v15

    invoke-static {v14, v15}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 92
    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/belkin/wemo/cache/utils/SDKNetworkUtils;->sharePreference:Lcom/belkin/wemo/cache/utils/SharePreferences;

    invoke-virtual {v14}, Lcom/belkin/wemo/cache/utils/SharePreferences;->getARPMacs()Ljava/util/Set;

    move-result-object v12

    .line 93
    .local v12, "storedArpMacs":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/String;>;"
    invoke-virtual/range {p0 .. p0}, Lcom/belkin/wemo/cache/utils/SDKNetworkUtils;->getArpMac()Ljava/lang/String;

    move-result-object v3

    .line 95
    .local v3, "currentArpMac":Ljava/lang/String;
    if-eqz v12, :cond_8

    invoke-interface {v12}, Ljava/util/Set;->size()I

    move-result v14

    if-nez v14, :cond_9

    :cond_8
    if-eqz v3, :cond_9

    invoke-virtual {v3}, Ljava/lang/String;->isEmpty()Z

    move-result v14

    if-nez v14, :cond_9

    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/belkin/wemo/cache/utils/SDKNetworkUtils;->sharePreference:Lcom/belkin/wemo/cache/utils/SharePreferences;

    invoke-virtual {v14}, Lcom/belkin/wemo/cache/utils/SharePreferences;->getRemoteAccessSSID()Ljava/lang/String;

    move-result-object v14

    invoke-virtual {v4, v14}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v14

    if-eqz v14, :cond_9

    .line 97
    new-instance v12, Ljava/util/HashSet;

    .end local v12    # "storedArpMacs":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/String;>;"
    invoke-direct {v12}, Ljava/util/HashSet;-><init>()V

    .line 98
    .restart local v12    # "storedArpMacs":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/String;>;"
    invoke-interface {v12, v3}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 99
    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/belkin/wemo/cache/utils/SDKNetworkUtils;->sharePreference:Lcom/belkin/wemo/cache/utils/SharePreferences;

    invoke-virtual {v14, v12}, Lcom/belkin/wemo/cache/utils/SharePreferences;->setARPMacs(Ljava/util/Set;)Z

    .line 101
    :cond_9
    const-string v14, "SDK_NetworkUtils"

    new-instance v15, Ljava/lang/StringBuilder;

    invoke-direct {v15}, Ljava/lang/StringBuilder;-><init>()V

    const-string v16, "Forced Remote: currentArpMac: "

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    invoke-virtual {v15, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    const-string v16, " :storedArpMacs: "

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    invoke-virtual {v15, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v15

    invoke-virtual {v15}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v15

    invoke-static {v14, v15}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 102
    if-eqz v3, :cond_b

    invoke-virtual {v3}, Ljava/lang/String;->isEmpty()Z

    move-result v14

    if-nez v14, :cond_b

    if-eqz v12, :cond_b

    invoke-interface {v12}, Ljava/util/Set;->size()I

    move-result v14

    if-lez v14, :cond_b

    .line 104
    invoke-interface {v12}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v7

    .line 105
    .local v7, "iterator":Ljava/util/Iterator;, "Ljava/util/Iterator<Ljava/lang/String;>;"
    :cond_a
    :goto_2
    invoke-interface {v7}, Ljava/util/Iterator;->hasNext()Z

    move-result v14

    if-eqz v14, :cond_d

    .line 106
    invoke-interface {v7}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v13

    check-cast v13, Ljava/lang/String;

    .line 107
    .local v13, "string":Ljava/lang/String;
    const-string v14, "SDK_NetworkUtils"

    new-instance v15, Ljava/lang/StringBuilder;

    invoke-direct {v15}, Ljava/lang/StringBuilder;-><init>()V

    const-string v16, "Forced Remote: string: "

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    invoke-virtual {v15, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    invoke-virtual {v15}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v15

    invoke-static {v14, v15}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 108
    if-eqz v13, :cond_a

    invoke-virtual {v13}, Ljava/lang/String;->isEmpty()Z

    move-result v14

    if-nez v14, :cond_a

    .line 109
    invoke-virtual {v13, v3}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v14

    if-eqz v14, :cond_a

    .line 110
    const/4 v6, 0x0

    .line 111
    const/4 v10, 0x0

    goto :goto_2

    .line 118
    .end local v7    # "iterator":Ljava/util/Iterator;, "Ljava/util/Iterator<Ljava/lang/String;>;"
    .end local v13    # "string":Ljava/lang/String;
    :cond_b
    invoke-interface {v11}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v7

    .line 119
    .restart local v7    # "iterator":Ljava/util/Iterator;, "Ljava/util/Iterator<Ljava/lang/String;>;"
    :cond_c
    :goto_3
    invoke-interface {v7}, Ljava/util/Iterator;->hasNext()Z

    move-result v14

    if-eqz v14, :cond_d

    .line 120
    invoke-interface {v7}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v13

    check-cast v13, Ljava/lang/String;

    .line 121
    .restart local v13    # "string":Ljava/lang/String;
    const-string v14, "SDK_NetworkUtils"

    new-instance v15, Ljava/lang/StringBuilder;

    invoke-direct {v15}, Ljava/lang/StringBuilder;-><init>()V

    const-string v16, "Forced Remote: string1: "

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    invoke-virtual {v15, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    invoke-virtual {v15}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v15

    invoke-static {v14, v15}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 122
    if-eqz v13, :cond_c

    invoke-virtual {v13}, Ljava/lang/String;->isEmpty()Z

    move-result v14

    if-nez v14, :cond_c

    .line 123
    invoke-virtual {v13, v4}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v14

    if-eqz v14, :cond_c

    .line 124
    const/4 v6, 0x0

    .line 125
    const/4 v10, 0x0

    goto :goto_3

    .line 131
    .end local v13    # "string":Ljava/lang/String;
    :cond_d
    sget-boolean v14, Lcom/belkin/wemo/cache/cloud/SmartDiscovery;->isForcedRemoteEnabled:Z

    if-nez v14, :cond_e

    if-eqz v10, :cond_f

    .line 132
    :cond_e
    const/4 v6, 0x1

    .line 136
    :goto_4
    const-string v14, "SDK_NetworkUtils"

    new-instance v15, Ljava/lang/StringBuilder;

    invoke-direct {v15}, Ljava/lang/StringBuilder;-><init>()V

    const-string v16, "Forced Remote: isRemoteMode1: "

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    invoke-virtual {v15, v6}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v15

    const-string v16, " :onRemote: "

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    invoke-virtual {v15, v10}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v15

    invoke-virtual {v15}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v15

    invoke-static {v14, v15}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 137
    if-eqz v6, :cond_10

    .line 138
    const-string v1, "Remote_WiFi"

    goto/16 :goto_0

    .line 134
    :cond_f
    const/4 v6, 0x0

    goto :goto_4

    .line 140
    :cond_10
    const-string v1, "Home"

    goto/16 :goto_0

    .line 143
    .end local v3    # "currentArpMac":Ljava/lang/String;
    .end local v6    # "isRemoteMode":Z
    .end local v7    # "iterator":Ljava/util/Iterator;, "Ljava/util/Iterator<Ljava/lang/String;>;"
    .end local v12    # "storedArpMacs":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/String;>;"
    :cond_11
    const-string v1, "Home"

    goto/16 :goto_0

    .line 149
    .end local v4    # "currentWiFiNetwork":Ljava/lang/String;
    .end local v11    # "ssids":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/String;>;"
    :cond_12
    const-string v1, "WEMO"
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    goto/16 :goto_0

    .line 151
    .end local v2    # "connectivityManager":Landroid/net/ConnectivityManager;
    .end local v8    # "networkInfo":Landroid/net/NetworkInfo;
    :catch_0
    move-exception v5

    .line 152
    .local v5, "e":Ljava/lang/Exception;
    invoke-virtual {v5}, Ljava/lang/Exception;->printStackTrace()V

    goto/16 :goto_0

    .line 160
    .end local v5    # "e":Ljava/lang/Exception;
    :cond_13
    const/4 v14, 0x1

    invoke-static {v14}, Lcom/belkin/wemo/cache/utils/NetworkMode;->setLocal(Z)V

    goto/16 :goto_1
.end method

.method public getSSID()Ljava/lang/String;
    .locals 7

    .prologue
    .line 411
    :try_start_0
    iget-object v4, p0, Lcom/belkin/wemo/cache/utils/SDKNetworkUtils;->mContext:Landroid/content/Context;

    const-string v5, "wifi"

    invoke-virtual {v4, v5}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroid/net/wifi/WifiManager;

    .line 413
    .local v3, "wifiMgr":Landroid/net/wifi/WifiManager;
    invoke-virtual {v3}, Landroid/net/wifi/WifiManager;->getConnectionInfo()Landroid/net/wifi/WifiInfo;

    move-result-object v2

    .line 415
    .local v2, "wifiInfo":Landroid/net/wifi/WifiInfo;
    invoke-virtual {v2}, Landroid/net/wifi/WifiInfo;->getSSID()Ljava/lang/String;

    move-result-object v1

    .line 417
    .local v1, "resultString":Ljava/lang/String;
    const-string v4, "\""

    invoke-virtual {v1, v4}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_0

    const-string v4, "\""

    invoke-virtual {v1, v4}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_0

    .line 419
    const/4 v4, 0x1

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v5

    add-int/lit8 v5, v5, -0x1

    invoke-virtual {v1, v4, v5}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v1

    .line 422
    :cond_0
    invoke-virtual {v1}, Ljava/lang/String;->trim()Ljava/lang/String;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v4

    .line 427
    .end local v1    # "resultString":Ljava/lang/String;
    .end local v2    # "wifiInfo":Landroid/net/wifi/WifiInfo;
    .end local v3    # "wifiMgr":Landroid/net/wifi/WifiManager;
    :goto_0
    return-object v4

    .line 423
    :catch_0
    move-exception v0

    .line 425
    .local v0, "e":Ljava/lang/Exception;
    sget-object v4, Ljava/lang/System;->out:Ljava/io/PrintStream;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "exception occured :"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v0}, Ljava/lang/Exception;->getStackTrace()[Ljava/lang/StackTraceElement;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 427
    const/4 v4, 0x0

    goto :goto_0
.end method

.method public isHomeNetwork()Z
    .locals 2

    .prologue
    .line 294
    const-string v0, "Home"

    invoke-virtual {p0}, Lcom/belkin/wemo/cache/utils/SDKNetworkUtils;->getNetworkType()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 295
    const/4 v0, 0x1

    .line 297
    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public isNetworkConnected()Z
    .locals 4

    .prologue
    .line 51
    iget-object v2, p0, Lcom/belkin/wemo/cache/utils/SDKNetworkUtils;->mContext:Landroid/content/Context;

    const-string v3, "connectivity"

    invoke-virtual {v2, v3}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/net/ConnectivityManager;

    .line 52
    .local v0, "connectivityManager":Landroid/net/ConnectivityManager;
    invoke-virtual {v0}, Landroid/net/ConnectivityManager;->getActiveNetworkInfo()Landroid/net/NetworkInfo;

    move-result-object v1

    .line 54
    .local v1, "networkInfo":Landroid/net/NetworkInfo;
    if-nez v1, :cond_0

    .line 55
    const/4 v2, 0x0

    .line 56
    :goto_0
    return v2

    :cond_0
    const/4 v2, 0x1

    goto :goto_0
.end method

.method public isPluginConnected()Z
    .locals 4

    .prologue
    const/4 v1, 0x0

    .line 308
    invoke-virtual {p0}, Lcom/belkin/wemo/cache/utils/SDKNetworkUtils;->getSSID()Ljava/lang/String;

    move-result-object v0

    .line 309
    .local v0, "ssid":Ljava/lang/String;
    if-eqz v0, :cond_0

    .line 310
    invoke-virtual {v0}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v2

    const-string v3, "wemo."

    invoke-virtual {v2, v3}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 311
    const/4 v1, 0x1

    .line 316
    :cond_0
    return v1
.end method

.method public mergeArpMacs(Ljava/util/Set;Ljava/util/Set;)Ljava/util/Set;
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Set",
            "<",
            "Ljava/lang/String;",
            ">;",
            "Ljava/util/Set",
            "<",
            "Ljava/lang/String;",
            ">;)",
            "Ljava/util/Set",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    .line 553
    .local p1, "storedArpMacs":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/String;>;"
    .local p2, "groupArpMacs":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/String;>;"
    if-nez p1, :cond_0

    .line 555
    new-instance p1, Ljava/util/HashSet;

    .end local p1    # "storedArpMacs":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/String;>;"
    invoke-direct {p1}, Ljava/util/HashSet;-><init>()V

    .line 558
    .restart local p1    # "storedArpMacs":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/String;>;"
    :cond_0
    const/4 v1, 0x1

    .line 559
    .local v1, "isNewHomeMerge":Z
    :try_start_0
    invoke-interface {p2}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v2

    .local v2, "iterator":Ljava/util/Iterator;, "Ljava/util/Iterator<Ljava/lang/String;>;"
    :cond_1
    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_4

    .line 560
    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    .line 561
    .local v4, "string":Ljava/lang/String;
    if-eqz v4, :cond_1

    invoke-virtual {v4}, Ljava/lang/String;->isEmpty()Z

    move-result v6

    if-nez v6, :cond_1

    .line 562
    invoke-interface {p1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v3

    .line 563
    .local v3, "iterator2":Ljava/util/Iterator;, "Ljava/util/Iterator<Ljava/lang/String;>;"
    :cond_2
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_3

    .line 564
    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/String;

    .line 565
    .local v5, "string2":Ljava/lang/String;
    if-eqz v5, :cond_2

    invoke-virtual {v5}, Ljava/lang/String;->isEmpty()Z

    move-result v6

    if-nez v6, :cond_2

    .line 566
    invoke-virtual {v5, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_2

    .line 567
    const/4 v1, 0x0

    .line 572
    .end local v5    # "string2":Ljava/lang/String;
    :cond_3
    if-eqz v1, :cond_1

    .line 573
    invoke-interface {p1, v4}, Ljava/util/Set;->add(Ljava/lang/Object;)Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 577
    .end local v2    # "iterator":Ljava/util/Iterator;, "Ljava/util/Iterator<Ljava/lang/String;>;"
    .end local v3    # "iterator2":Ljava/util/Iterator;, "Ljava/util/Iterator<Ljava/lang/String;>;"
    .end local v4    # "string":Ljava/lang/String;
    :catch_0
    move-exception v0

    .line 578
    .local v0, "e":Ljava/lang/Exception;
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    .line 580
    .end local v0    # "e":Ljava/lang/Exception;
    :cond_4
    return-object p1
.end method

.method public mergeHomeSsid(Ljava/util/Set;)Ljava/util/Set;
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Set",
            "<",
            "Ljava/lang/String;",
            ">;)",
            "Ljava/util/Set",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    .line 585
    .local p1, "groupSsid":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/String;>;"
    iget-object v6, p0, Lcom/belkin/wemo/cache/utils/SDKNetworkUtils;->sharePreference:Lcom/belkin/wemo/cache/utils/SharePreferences;

    invoke-virtual {v6}, Lcom/belkin/wemo/cache/utils/SharePreferences;->getHomeSSIDs()Ljava/util/Set;

    move-result-object v3

    .line 586
    .local v3, "newHomeSsid":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/String;>;"
    const/4 v0, 0x1

    .line 587
    .local v0, "isNewHomeMerge":Z
    invoke-interface {p1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "iterator":Ljava/util/Iterator;, "Ljava/util/Iterator<Ljava/lang/String;>;"
    :cond_0
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_3

    .line 588
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    .line 589
    .local v4, "string":Ljava/lang/String;
    invoke-interface {v3}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v2

    .line 590
    .local v2, "iterator2":Ljava/util/Iterator;, "Ljava/util/Iterator<Ljava/lang/String;>;"
    :cond_1
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_2

    .line 591
    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/String;

    .line 592
    .local v5, "string2":Ljava/lang/String;
    invoke-virtual {v5, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_1

    .line 594
    const/4 v0, 0x0

    .line 598
    .end local v5    # "string2":Ljava/lang/String;
    :cond_2
    if-eqz v0, :cond_0

    .line 600
    invoke-interface {v3, v4}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 603
    .end local v2    # "iterator2":Ljava/util/Iterator;, "Ljava/util/Iterator<Ljava/lang/String;>;"
    .end local v4    # "string":Ljava/lang/String;
    :cond_3
    return-object v3
.end method

.method public setCurrentLocationHomeId(Ljava/lang/String;)V
    .locals 1
    .param p1, "currentLocationHomeId"    # Ljava/lang/String;

    .prologue
    .line 539
    iget-object v0, p0, Lcom/belkin/wemo/cache/utils/SDKNetworkUtils;->sharePreference:Lcom/belkin/wemo/cache/utils/SharePreferences;

    invoke-virtual {v0, p1}, Lcom/belkin/wemo/cache/utils/SharePreferences;->setCurrentLocationHomeId(Ljava/lang/String;)V

    .line 540
    return-void
.end method

.method public unRegisterNetwork()V
    .locals 3
    .annotation build Landroid/annotation/TargetApi;
        value = 0x15
    .end annotation

    .prologue
    .line 352
    iget-object v1, p0, Lcom/belkin/wemo/cache/utils/SDKNetworkUtils;->mContext:Landroid/content/Context;

    const-string v2, "connectivity"

    invoke-virtual {v1, v2}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/net/ConnectivityManager;

    .line 353
    .local v0, "connectivityManager":Landroid/net/ConnectivityManager;
    sget v1, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v2, 0x17

    if-lt v1, v2, :cond_0

    .line 354
    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/net/ConnectivityManager;->bindProcessToNetwork(Landroid/net/Network;)Z

    .line 362
    :cond_0
    return-void
.end method
