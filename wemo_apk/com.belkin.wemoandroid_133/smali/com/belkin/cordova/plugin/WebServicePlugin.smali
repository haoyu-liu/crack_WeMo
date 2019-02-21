.class public Lcom/belkin/cordova/plugin/WebServicePlugin;
.super Lorg/apache/cordova/CordovaPlugin;
.source "WebServicePlugin.java"


# static fields
.field public static final TAG:Ljava/lang/String; = "WebServicePlugin"


# instance fields
.field private final lExpirationDuration:J

.field private lExpirationTime:J

.field private mContext:Landroid/content/Context;

.field private mSharePreference:Lcom/belkin/wemo/cache/utils/SharePreferences;

.field private mWiFiSecurityUtil:Lcom/belkin/utils/WiFiSecurityUtil;

.field private strAuthorizationHeader:Ljava/lang/String;

.field private strBaseString:Ljava/lang/String;

.field private strHomeID:Ljava/lang/String;

.field private strPrivateKey:Ljava/lang/String;

.field private strReUnionKey:Ljava/lang/String;

.field private strSignature:Ljava/lang/String;

.field private strUniqueID:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 2

    .prologue
    .line 18
    invoke-direct {p0}, Lorg/apache/cordova/CordovaPlugin;-><init>()V

    .line 22
    const-wide/16 v0, 0x0

    iput-wide v0, p0, Lcom/belkin/cordova/plugin/WebServicePlugin;->lExpirationTime:J

    .line 23
    const-string v0, ""

    iput-object v0, p0, Lcom/belkin/cordova/plugin/WebServicePlugin;->strUniqueID:Ljava/lang/String;

    .line 24
    const-string v0, ""

    iput-object v0, p0, Lcom/belkin/cordova/plugin/WebServicePlugin;->strHomeID:Ljava/lang/String;

    .line 25
    const-string v0, ""

    iput-object v0, p0, Lcom/belkin/cordova/plugin/WebServicePlugin;->strBaseString:Ljava/lang/String;

    .line 26
    const-wide/16 v0, 0xc8

    iput-wide v0, p0, Lcom/belkin/cordova/plugin/WebServicePlugin;->lExpirationDuration:J

    .line 27
    const-string v0, ""

    iput-object v0, p0, Lcom/belkin/cordova/plugin/WebServicePlugin;->strAuthorizationHeader:Ljava/lang/String;

    .line 28
    const-string v0, ""

    iput-object v0, p0, Lcom/belkin/cordova/plugin/WebServicePlugin;->strPrivateKey:Ljava/lang/String;

    .line 29
    const-string v0, ""

    iput-object v0, p0, Lcom/belkin/cordova/plugin/WebServicePlugin;->strReUnionKey:Ljava/lang/String;

    .line 30
    const-string v0, ""

    iput-object v0, p0, Lcom/belkin/cordova/plugin/WebServicePlugin;->strSignature:Ljava/lang/String;

    return-void
.end method

.method private generateAuthCode(Z)Lorg/json/JSONArray;
    .locals 11
    .param p1, "isSmart"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .prologue
    const/4 v10, 0x0

    .line 54
    new-instance v0, Lorg/json/JSONArray;

    invoke-direct {v0}, Lorg/json/JSONArray;-><init>()V

    .line 56
    .local v0, "array":Lorg/json/JSONArray;
    iput-object v10, p0, Lcom/belkin/cordova/plugin/WebServicePlugin;->strAuthorizationHeader:Ljava/lang/String;

    .line 57
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v6

    const-wide/16 v8, 0x3e8

    div-long/2addr v6, v8

    const-wide/16 v8, 0xc8

    add-long/2addr v6, v8

    iput-wide v6, p0, Lcom/belkin/cordova/plugin/WebServicePlugin;->lExpirationTime:J

    .line 58
    iget-object v6, p0, Lcom/belkin/cordova/plugin/WebServicePlugin;->mWiFiSecurityUtil:Lcom/belkin/utils/WiFiSecurityUtil;

    iget-object v7, p0, Lcom/belkin/cordova/plugin/WebServicePlugin;->mContext:Landroid/content/Context;

    invoke-virtual {v6, v7}, Lcom/belkin/utils/WiFiSecurityUtil;->getDeviceID(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v6

    iput-object v6, p0, Lcom/belkin/cordova/plugin/WebServicePlugin;->strUniqueID:Ljava/lang/String;

    .line 59
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v7, p0, Lcom/belkin/cordova/plugin/WebServicePlugin;->strUniqueID:Ljava/lang/String;

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, "\n"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, "\n"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    iget-wide v8, p0, Lcom/belkin/cordova/plugin/WebServicePlugin;->lExpirationTime:J

    invoke-virtual {v6, v8, v9}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    iput-object v6, p0, Lcom/belkin/cordova/plugin/WebServicePlugin;->strBaseString:Ljava/lang/String;

    .line 60
    iget-object v6, p0, Lcom/belkin/cordova/plugin/WebServicePlugin;->mSharePreference:Lcom/belkin/wemo/cache/utils/SharePreferences;

    invoke-virtual {v6}, Lcom/belkin/wemo/cache/utils/SharePreferences;->getPrivateKey()Ljava/lang/String;

    move-result-object v6

    iput-object v6, p0, Lcom/belkin/cordova/plugin/WebServicePlugin;->strPrivateKey:Ljava/lang/String;

    .line 61
    iget-object v6, p0, Lcom/belkin/cordova/plugin/WebServicePlugin;->mSharePreference:Lcom/belkin/wemo/cache/utils/SharePreferences;

    invoke-virtual {v6}, Lcom/belkin/wemo/cache/utils/SharePreferences;->getReUnionKey()Ljava/lang/String;

    move-result-object v6

    iput-object v6, p0, Lcom/belkin/cordova/plugin/WebServicePlugin;->strReUnionKey:Ljava/lang/String;

    .line 62
    iget-object v6, p0, Lcom/belkin/cordova/plugin/WebServicePlugin;->mSharePreference:Lcom/belkin/wemo/cache/utils/SharePreferences;

    invoke-virtual {v6}, Lcom/belkin/wemo/cache/utils/SharePreferences;->getHomeId()Ljava/lang/String;

    move-result-object v6

    iput-object v6, p0, Lcom/belkin/cordova/plugin/WebServicePlugin;->strHomeID:Ljava/lang/String;

    .line 63
    iput-object v10, p0, Lcom/belkin/cordova/plugin/WebServicePlugin;->strSignature:Ljava/lang/String;

    .line 64
    if-eqz p1, :cond_1

    iget-object v3, p0, Lcom/belkin/cordova/plugin/WebServicePlugin;->strReUnionKey:Ljava/lang/String;

    .line 66
    .local v3, "key":Ljava/lang/String;
    :goto_0
    if-eqz v3, :cond_0

    .line 68
    :try_start_0
    const-string v6, "HmacSHA1"

    invoke-static {v6}, Ljavax/crypto/Mac;->getInstance(Ljava/lang/String;)Ljavax/crypto/Mac;

    move-result-object v4

    .line 69
    .local v4, "mac":Ljavax/crypto/Mac;
    new-instance v5, Ljavax/crypto/spec/SecretKeySpec;

    invoke-virtual {v3}, Ljava/lang/String;->getBytes()[B

    move-result-object v6

    invoke-virtual {v4}, Ljavax/crypto/Mac;->getAlgorithm()Ljava/lang/String;

    move-result-object v7

    invoke-direct {v5, v6, v7}, Ljavax/crypto/spec/SecretKeySpec;-><init>([BLjava/lang/String;)V

    .line 70
    .local v5, "secret":Ljavax/crypto/spec/SecretKeySpec;
    invoke-virtual {v4, v5}, Ljavax/crypto/Mac;->init(Ljava/security/Key;)V

    .line 71
    iget-object v6, p0, Lcom/belkin/cordova/plugin/WebServicePlugin;->strBaseString:Ljava/lang/String;

    invoke-virtual {v6}, Ljava/lang/String;->getBytes()[B

    move-result-object v6

    invoke-virtual {v4, v6}, Ljavax/crypto/Mac;->doFinal([B)[B

    move-result-object v1

    .line 72
    .local v1, "digest":[B
    new-instance v6, Ljava/lang/String;

    const/4 v7, 0x0

    invoke-static {v1, v7}, Landroid/util/Base64;->encode([BI)[B

    move-result-object v7

    invoke-direct {v6, v7}, Ljava/lang/String;-><init>([B)V

    invoke-virtual {v6}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v6

    iput-object v6, p0, Lcom/belkin/cordova/plugin/WebServicePlugin;->strSignature:Ljava/lang/String;

    .line 73
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "SDU "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    iget-object v7, p0, Lcom/belkin/cordova/plugin/WebServicePlugin;->strUniqueID:Ljava/lang/String;

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, ":"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    iget-object v7, p0, Lcom/belkin/cordova/plugin/WebServicePlugin;->strSignature:Ljava/lang/String;

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, ":"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    iget-wide v8, p0, Lcom/belkin/cordova/plugin/WebServicePlugin;->lExpirationTime:J

    invoke-virtual {v6, v8, v9}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    iput-object v6, p0, Lcom/belkin/cordova/plugin/WebServicePlugin;->strAuthorizationHeader:Ljava/lang/String;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 79
    .end local v1    # "digest":[B
    .end local v4    # "mac":Ljavax/crypto/Mac;
    .end local v5    # "secret":Ljavax/crypto/spec/SecretKeySpec;
    :cond_0
    :goto_1
    iget-object v6, p0, Lcom/belkin/cordova/plugin/WebServicePlugin;->strAuthorizationHeader:Ljava/lang/String;

    invoke-virtual {v0, v6}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;

    .line 80
    iget-object v6, p0, Lcom/belkin/cordova/plugin/WebServicePlugin;->strHomeID:Ljava/lang/String;

    invoke-virtual {v0, v6}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;

    .line 81
    invoke-virtual {v0, v3}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;

    .line 82
    return-object v0

    .line 64
    .end local v3    # "key":Ljava/lang/String;
    :cond_1
    iget-object v3, p0, Lcom/belkin/cordova/plugin/WebServicePlugin;->strPrivateKey:Ljava/lang/String;

    goto :goto_0

    .line 74
    .restart local v3    # "key":Ljava/lang/String;
    :catch_0
    move-exception v2

    .line 75
    .local v2, "excep":Ljava/lang/Exception;
    invoke-virtual {v2}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_1
.end method


# virtual methods
.method public execute(Ljava/lang/String;Lorg/json/JSONArray;Lorg/apache/cordova/CallbackContext;)Z
    .locals 4
    .param p1, "action"    # Ljava/lang/String;
    .param p2, "args"    # Lorg/json/JSONArray;
    .param p3, "callbackContext"    # Lorg/apache/cordova/CallbackContext;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .prologue
    const/4 v1, 0x1

    const/4 v0, 0x0

    .line 37
    const-string v2, "getAuthCode"

    invoke-virtual {p1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_3

    .line 38
    iget-object v2, p0, Lcom/belkin/cordova/plugin/WebServicePlugin;->cordova:Lorg/apache/cordova/CordovaInterface;

    invoke-interface {v2}, Lorg/apache/cordova/CordovaInterface;->getActivity()Landroid/app/Activity;

    move-result-object v2

    iput-object v2, p0, Lcom/belkin/cordova/plugin/WebServicePlugin;->mContext:Landroid/content/Context;

    .line 39
    new-instance v2, Lcom/belkin/wemo/cache/utils/SharePreferences;

    iget-object v3, p0, Lcom/belkin/cordova/plugin/WebServicePlugin;->mContext:Landroid/content/Context;

    invoke-direct {v2, v3}, Lcom/belkin/wemo/cache/utils/SharePreferences;-><init>(Landroid/content/Context;)V

    iput-object v2, p0, Lcom/belkin/cordova/plugin/WebServicePlugin;->mSharePreference:Lcom/belkin/wemo/cache/utils/SharePreferences;

    .line 40
    new-instance v2, Lcom/belkin/utils/WiFiSecurityUtil;

    invoke-direct {v2}, Lcom/belkin/utils/WiFiSecurityUtil;-><init>()V

    iput-object v2, p0, Lcom/belkin/cordova/plugin/WebServicePlugin;->mWiFiSecurityUtil:Lcom/belkin/utils/WiFiSecurityUtil;

    .line 41
    if-eqz p2, :cond_0

    invoke-virtual {p2}, Lorg/json/JSONArray;->length()I

    move-result v2

    if-lez v2, :cond_0

    invoke-virtual {p2, v0}, Lorg/json/JSONArray;->get(I)Ljava/lang/Object;

    move-result-object v2

    const-string v3, "F"

    invoke-virtual {v2, v3}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    move v0, v1

    .line 42
    .local v0, "isSmart":Z
    :cond_0
    iget-object v2, p0, Lcom/belkin/cordova/plugin/WebServicePlugin;->mSharePreference:Lcom/belkin/wemo/cache/utils/SharePreferences;

    invoke-virtual {v2}, Lcom/belkin/wemo/cache/utils/SharePreferences;->isRemoteEnabled()Z

    move-result v2

    if-nez v2, :cond_1

    if-eqz v0, :cond_2

    .line 43
    :cond_1
    invoke-direct {p0, v0}, Lcom/belkin/cordova/plugin/WebServicePlugin;->generateAuthCode(Z)Lorg/json/JSONArray;

    move-result-object v2

    invoke-virtual {p3, v2}, Lorg/apache/cordova/CallbackContext;->success(Lorg/json/JSONArray;)V

    .line 49
    .end local v0    # "isSmart":Z
    :goto_0
    return v1

    .line 45
    .restart local v0    # "isSmart":Z
    :cond_2
    invoke-virtual {p3, v1}, Lorg/apache/cordova/CallbackContext;->error(I)V

    goto :goto_0

    .end local v0    # "isSmart":Z
    :cond_3
    move v1, v0

    .line 49
    goto :goto_0
.end method
