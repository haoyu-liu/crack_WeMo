.class public Lcom/belkin/wemo/cache/cloud/CloudAuth;
.super Ljava/lang/Object;
.source "CloudAuth.java"


# static fields
.field private static final TAG:Ljava/lang/String; = "SDK_CloudAuth"


# instance fields
.field private final lExpirationDuration:J

.field private mContext:Landroid/content/Context;

.field private mSharePreference:Lcom/belkin/wemo/cache/utils/SharePreferences;

.field private mWiFiSecurityUtil:Lcom/belkin/wemo/cache/utils/WiFiSecurityUtil;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 2
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 20
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 15
    const-wide/16 v0, 0xc8

    iput-wide v0, p0, Lcom/belkin/wemo/cache/cloud/CloudAuth;->lExpirationDuration:J

    .line 22
    iput-object p1, p0, Lcom/belkin/wemo/cache/cloud/CloudAuth;->mContext:Landroid/content/Context;

    .line 23
    new-instance v0, Lcom/belkin/wemo/cache/utils/SharePreferences;

    iget-object v1, p0, Lcom/belkin/wemo/cache/cloud/CloudAuth;->mContext:Landroid/content/Context;

    invoke-direct {v0, v1}, Lcom/belkin/wemo/cache/utils/SharePreferences;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/belkin/wemo/cache/cloud/CloudAuth;->mSharePreference:Lcom/belkin/wemo/cache/utils/SharePreferences;

    .line 24
    new-instance v0, Lcom/belkin/wemo/cache/utils/WiFiSecurityUtil;

    invoke-direct {v0}, Lcom/belkin/wemo/cache/utils/WiFiSecurityUtil;-><init>()V

    iput-object v0, p0, Lcom/belkin/wemo/cache/cloud/CloudAuth;->mWiFiSecurityUtil:Lcom/belkin/wemo/cache/utils/WiFiSecurityUtil;

    .line 25
    return-void
.end method


# virtual methods
.method public generateAuthCode()Ljava/lang/String;
    .locals 18
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .prologue
    .line 37
    const/4 v9, 0x0

    .line 38
    .local v9, "strAuthorizationHeader":Ljava/lang/String;
    const-wide/16 v6, 0x0

    .line 39
    .local v6, "lExpirationTime":J
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v14

    const-wide/16 v16, 0x3e8

    div-long v14, v14, v16

    const-wide/16 v16, 0xc8

    add-long v6, v14, v16

    .line 40
    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/belkin/wemo/cache/cloud/CloudAuth;->mWiFiSecurityUtil:Lcom/belkin/wemo/cache/utils/WiFiSecurityUtil;

    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/belkin/wemo/cache/cloud/CloudAuth;->mContext:Landroid/content/Context;

    invoke-virtual {v14, v15}, Lcom/belkin/wemo/cache/utils/WiFiSecurityUtil;->getDeviceID(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v13

    .line 41
    .local v13, "strUniqueID":Ljava/lang/String;
    new-instance v14, Ljava/lang/StringBuilder;

    invoke-direct {v14}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v14, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    const-string v15, "\n"

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    const-string v15, "\n"

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14, v6, v7}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    .line 42
    .local v10, "strBaseString":Ljava/lang/String;
    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/belkin/wemo/cache/cloud/CloudAuth;->mSharePreference:Lcom/belkin/wemo/cache/utils/SharePreferences;

    invoke-virtual {v14}, Lcom/belkin/wemo/cache/utils/SharePreferences;->getPrivateKey()Ljava/lang/String;

    move-result-object v11

    .line 45
    .local v11, "strPrivateKey":Ljava/lang/String;
    const/4 v12, 0x0

    .line 46
    .local v12, "strSignature":Ljava/lang/String;
    move-object v4, v11

    .line 48
    .local v4, "key":Ljava/lang/String;
    if-eqz v4, :cond_0

    .line 50
    :try_start_0
    const-string v14, "HmacSHA1"

    invoke-static {v14}, Ljavax/crypto/Mac;->getInstance(Ljava/lang/String;)Ljavax/crypto/Mac;

    move-result-object v5

    .line 51
    .local v5, "mac":Ljavax/crypto/Mac;
    new-instance v8, Ljavax/crypto/spec/SecretKeySpec;

    invoke-virtual {v4}, Ljava/lang/String;->getBytes()[B

    move-result-object v14

    invoke-virtual {v5}, Ljavax/crypto/Mac;->getAlgorithm()Ljava/lang/String;

    move-result-object v15

    invoke-direct {v8, v14, v15}, Ljavax/crypto/spec/SecretKeySpec;-><init>([BLjava/lang/String;)V

    .line 52
    .local v8, "secret":Ljavax/crypto/spec/SecretKeySpec;
    invoke-virtual {v5, v8}, Ljavax/crypto/Mac;->init(Ljava/security/Key;)V

    .line 53
    invoke-virtual {v10}, Ljava/lang/String;->getBytes()[B

    move-result-object v14

    invoke-virtual {v5, v14}, Ljavax/crypto/Mac;->doFinal([B)[B

    move-result-object v2

    .line 54
    .local v2, "digest":[B
    new-instance v14, Ljava/lang/String;

    const/4 v15, 0x0

    invoke-static {v2, v15}, Landroid/util/Base64;->encode([BI)[B

    move-result-object v15

    invoke-direct {v14, v15}, Ljava/lang/String;-><init>([B)V

    invoke-virtual {v14}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v12

    .line 55
    new-instance v14, Ljava/lang/StringBuilder;

    invoke-direct {v14}, Ljava/lang/StringBuilder;-><init>()V

    const-string v15, "SDU "

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    const-string v15, ":"

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    const-string v15, ":"

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14, v6, v7}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v9

    .line 61
    .end local v2    # "digest":[B
    .end local v5    # "mac":Ljavax/crypto/Mac;
    .end local v8    # "secret":Ljavax/crypto/spec/SecretKeySpec;
    :cond_0
    :goto_0
    return-object v9

    .line 56
    :catch_0
    move-exception v3

    .line 57
    .local v3, "excep":Ljava/lang/Exception;
    invoke-virtual {v3}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_0
.end method

.method public getHomeID()Ljava/lang/String;
    .locals 2

    .prologue
    .line 29
    iget-object v1, p0, Lcom/belkin/wemo/cache/cloud/CloudAuth;->mSharePreference:Lcom/belkin/wemo/cache/utils/SharePreferences;

    invoke-virtual {v1}, Lcom/belkin/wemo/cache/utils/SharePreferences;->getCurrentLocationHomeId()Ljava/lang/String;

    move-result-object v0

    .line 30
    .local v0, "strHomeID":Ljava/lang/String;
    if-eqz v0, :cond_0

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v1

    if-nez v1, :cond_1

    .line 31
    :cond_0
    iget-object v1, p0, Lcom/belkin/wemo/cache/cloud/CloudAuth;->mSharePreference:Lcom/belkin/wemo/cache/utils/SharePreferences;

    invoke-virtual {v1}, Lcom/belkin/wemo/cache/utils/SharePreferences;->getHomeId()Ljava/lang/String;

    move-result-object v0

    .line 32
    :cond_1
    return-object v0
.end method
