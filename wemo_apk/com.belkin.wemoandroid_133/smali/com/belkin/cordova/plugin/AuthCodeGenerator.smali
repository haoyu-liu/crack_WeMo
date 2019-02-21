.class public Lcom/belkin/cordova/plugin/AuthCodeGenerator;
.super Ljava/lang/Object;
.source "AuthCodeGenerator.java"


# static fields
.field public static final TAG:Ljava/lang/String; = "AuthCodeGenerator"


# instance fields
.field private final lExpirationDuration:J

.field private mContext:Landroid/content/Context;

.field private mSharePreference:Lcom/belkin/wemo/cache/utils/SharePreferences;

.field private mWiFiSecurityUtil:Lcom/belkin/utils/WiFiSecurityUtil;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 2
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 23
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 21
    const-wide/16 v0, 0xc8

    iput-wide v0, p0, Lcom/belkin/cordova/plugin/AuthCodeGenerator;->lExpirationDuration:J

    .line 24
    iput-object p1, p0, Lcom/belkin/cordova/plugin/AuthCodeGenerator;->mContext:Landroid/content/Context;

    .line 25
    new-instance v0, Lcom/belkin/wemo/cache/utils/SharePreferences;

    iget-object v1, p0, Lcom/belkin/cordova/plugin/AuthCodeGenerator;->mContext:Landroid/content/Context;

    invoke-direct {v0, v1}, Lcom/belkin/wemo/cache/utils/SharePreferences;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/belkin/cordova/plugin/AuthCodeGenerator;->mSharePreference:Lcom/belkin/wemo/cache/utils/SharePreferences;

    .line 26
    new-instance v0, Lcom/belkin/utils/WiFiSecurityUtil;

    invoke-direct {v0}, Lcom/belkin/utils/WiFiSecurityUtil;-><init>()V

    iput-object v0, p0, Lcom/belkin/cordova/plugin/AuthCodeGenerator;->mWiFiSecurityUtil:Lcom/belkin/utils/WiFiSecurityUtil;

    .line 27
    return-void
.end method


# virtual methods
.method public getCode()Ljava/lang/String;
    .locals 18

    .prologue
    .line 37
    const/4 v8, 0x0

    .line 38
    .local v8, "strAuthorizationHeader":Ljava/lang/String;
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v14

    const-wide/16 v16, 0x3e8

    div-long v14, v14, v16

    const-wide/16 v16, 0xc8

    add-long v4, v14, v16

    .line 39
    .local v4, "lExpirationTime":J
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/belkin/cordova/plugin/AuthCodeGenerator;->mWiFiSecurityUtil:Lcom/belkin/utils/WiFiSecurityUtil;

    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/belkin/cordova/plugin/AuthCodeGenerator;->mContext:Landroid/content/Context;

    invoke-virtual {v13, v14}, Lcom/belkin/utils/WiFiSecurityUtil;->getDeviceID(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v12

    .line 40
    .local v12, "strUniqueID":Ljava/lang/String;
    new-instance v13, Ljava/lang/StringBuilder;

    invoke-direct {v13}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v13, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    const-string v14, "\n"

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    const-string v14, "\n"

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13, v4, v5}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    .line 41
    .local v9, "strBaseString":Ljava/lang/String;
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/belkin/cordova/plugin/AuthCodeGenerator;->mSharePreference:Lcom/belkin/wemo/cache/utils/SharePreferences;

    invoke-virtual {v13}, Lcom/belkin/wemo/cache/utils/SharePreferences;->getPrivateKey()Ljava/lang/String;

    move-result-object v10

    .line 42
    .local v10, "strPrivateKey":Ljava/lang/String;
    const-string v13, "AuthCodeGenerator"

    new-instance v14, Ljava/lang/StringBuilder;

    invoke-direct {v14}, Ljava/lang/StringBuilder;-><init>()V

    const-string v15, "strUniqueID"

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v14

    invoke-static {v13, v14}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 43
    const-string v13, "AuthCodeGenerator"

    new-instance v14, Ljava/lang/StringBuilder;

    invoke-direct {v14}, Ljava/lang/StringBuilder;-><init>()V

    const-string v15, "private key: "

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v14

    invoke-static {v13, v14}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 44
    const/4 v11, 0x0

    .line 46
    .local v11, "strSignature":Ljava/lang/String;
    if-eqz v10, :cond_0

    .line 48
    :try_start_0
    const-string v13, "HmacSHA1"

    invoke-static {v13}, Ljavax/crypto/Mac;->getInstance(Ljava/lang/String;)Ljavax/crypto/Mac;

    move-result-object v6

    .line 49
    .local v6, "mac":Ljavax/crypto/Mac;
    new-instance v7, Ljavax/crypto/spec/SecretKeySpec;

    invoke-virtual {v10}, Ljava/lang/String;->getBytes()[B

    move-result-object v13

    invoke-virtual {v6}, Ljavax/crypto/Mac;->getAlgorithm()Ljava/lang/String;

    move-result-object v14

    invoke-direct {v7, v13, v14}, Ljavax/crypto/spec/SecretKeySpec;-><init>([BLjava/lang/String;)V

    .line 50
    .local v7, "secret":Ljavax/crypto/spec/SecretKeySpec;
    invoke-virtual {v6, v7}, Ljavax/crypto/Mac;->init(Ljava/security/Key;)V

    .line 51
    invoke-virtual {v9}, Ljava/lang/String;->getBytes()[B

    move-result-object v13

    invoke-virtual {v6, v13}, Ljavax/crypto/Mac;->doFinal([B)[B

    move-result-object v2

    .line 52
    .local v2, "digest":[B
    new-instance v13, Ljava/lang/String;

    const/4 v14, 0x0

    invoke-static {v2, v14}, Landroid/util/Base64;->encode([BI)[B

    move-result-object v14

    invoke-direct {v13, v14}, Ljava/lang/String;-><init>([B)V

    invoke-virtual {v13}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v11

    .line 53
    new-instance v13, Ljava/lang/StringBuilder;

    invoke-direct {v13}, Ljava/lang/StringBuilder;-><init>()V

    const-string v14, "SDU "

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    const-string v14, ":"

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    const-string v14, ":"

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13, v4, v5}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v8

    .line 59
    .end local v2    # "digest":[B
    .end local v6    # "mac":Ljavax/crypto/Mac;
    .end local v7    # "secret":Ljavax/crypto/spec/SecretKeySpec;
    :cond_0
    :goto_0
    return-object v8

    .line 54
    :catch_0
    move-exception v3

    .line 55
    .local v3, "excep":Ljava/lang/Exception;
    invoke-virtual {v3}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_0
.end method

.method public getHomeId()Ljava/lang/String;
    .locals 1

    .prologue
    .line 63
    iget-object v0, p0, Lcom/belkin/cordova/plugin/AuthCodeGenerator;->mSharePreference:Lcom/belkin/wemo/cache/utils/SharePreferences;

    invoke-virtual {v0}, Lcom/belkin/wemo/cache/utils/SharePreferences;->getHomeId()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public isRemoteEnabled()Z
    .locals 1

    .prologue
    .line 30
    iget-object v0, p0, Lcom/belkin/cordova/plugin/AuthCodeGenerator;->mSharePreference:Lcom/belkin/wemo/cache/utils/SharePreferences;

    invoke-virtual {v0}, Lcom/belkin/wemo/cache/utils/SharePreferences;->isRemoteEnabled()Z

    move-result v0

    return v0
.end method
