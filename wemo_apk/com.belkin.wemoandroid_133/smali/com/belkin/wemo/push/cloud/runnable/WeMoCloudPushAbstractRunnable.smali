.class public abstract Lcom/belkin/wemo/push/cloud/runnable/WeMoCloudPushAbstractRunnable;
.super Lcom/belkin/wemo/runnable/WeMoRunnable;
.source "WeMoCloudPushAbstractRunnable.java"


# instance fields
.field private context:Landroid/content/Context;

.field protected registrationId:Ljava/lang/String;


# direct methods
.method public constructor <init>(Landroid/content/Context;Ljava/lang/String;)V
    .locals 0
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "registrationId"    # Ljava/lang/String;

    .prologue
    .line 37
    invoke-direct {p0}, Lcom/belkin/wemo/runnable/WeMoRunnable;-><init>()V

    .line 38
    iput-object p1, p0, Lcom/belkin/wemo/push/cloud/runnable/WeMoCloudPushAbstractRunnable;->context:Landroid/content/Context;

    .line 39
    iput-object p2, p0, Lcom/belkin/wemo/push/cloud/runnable/WeMoCloudPushAbstractRunnable;->registrationId:Ljava/lang/String;

    .line 40
    return-void
.end method

.method private getAuthHeader()Ljava/lang/String;
    .locals 20
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/security/NoSuchAlgorithmException;,
            Ljava/security/InvalidKeyException;
        }
    .end annotation

    .prologue
    .line 95
    new-instance v7, Lcom/belkin/wemo/cache/utils/SharePreferences;

    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/belkin/wemo/push/cloud/runnable/WeMoCloudPushAbstractRunnable;->context:Landroid/content/Context;

    invoke-direct {v7, v15}, Lcom/belkin/wemo/cache/utils/SharePreferences;-><init>(Landroid/content/Context;)V

    .line 96
    .local v7, "sharePreference":Lcom/belkin/wemo/cache/utils/SharePreferences;
    new-instance v14, Lcom/belkin/utils/WiFiSecurityUtil;

    invoke-direct {v14}, Lcom/belkin/utils/WiFiSecurityUtil;-><init>()V

    .line 98
    .local v14, "wifiSecurityUtil":Lcom/belkin/utils/WiFiSecurityUtil;
    new-instance v9, Ljava/lang/String;

    invoke-direct {v9}, Ljava/lang/String;-><init>()V

    .line 99
    .local v9, "strAuthorizationHeader":Ljava/lang/String;
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v16

    const-wide/16 v18, 0x3e8

    div-long v16, v16, v18

    const-wide/16 v18, 0xc8

    add-long v4, v16, v18

    .line 100
    .local v4, "expirationTime":J
    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/belkin/wemo/push/cloud/runnable/WeMoCloudPushAbstractRunnable;->context:Landroid/content/Context;

    invoke-virtual {v14, v15}, Lcom/belkin/utils/WiFiSecurityUtil;->getDeviceID(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v13

    .line 101
    .local v13, "strUniqueID":Ljava/lang/String;
    new-instance v15, Ljava/lang/StringBuilder;

    invoke-direct {v15}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v15, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    const-string v16, "\n"

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    const-string v16, "\n"

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    invoke-virtual {v15, v4, v5}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v15

    invoke-virtual {v15}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    .line 102
    .local v10, "strBaseString":Ljava/lang/String;
    invoke-virtual {v7}, Lcom/belkin/wemo/cache/utils/SharePreferences;->getPrivateKey()Ljava/lang/String;

    move-result-object v12

    .line 103
    .local v12, "strPrivateKey":Ljava/lang/String;
    invoke-virtual {v7}, Lcom/belkin/wemo/cache/utils/SharePreferences;->getHomeId()Ljava/lang/String;

    move-result-object v11

    .line 104
    .local v11, "strHomeID":Ljava/lang/String;
    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/belkin/wemo/push/cloud/runnable/WeMoCloudPushAbstractRunnable;->TAG:Ljava/lang/String;

    new-instance v16, Ljava/lang/StringBuilder;

    invoke-direct/range {v16 .. v16}, Ljava/lang/StringBuilder;-><init>()V

    const-string v17, "Push Notification: UniqueID = "

    invoke-virtual/range {v16 .. v17}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v16

    move-object/from16 v0, v16

    invoke-virtual {v0, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v16

    const-string v17, ", Private Key = "

    invoke-virtual/range {v16 .. v17}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v16

    move-object/from16 v0, v16

    invoke-virtual {v0, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v16

    const-string v17, ", HomeID = "

    invoke-virtual/range {v16 .. v17}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v16

    move-object/from16 v0, v16

    invoke-virtual {v0, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v16

    invoke-virtual/range {v16 .. v16}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v16

    invoke-static/range {v15 .. v16}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 106
    invoke-static {v12}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v15

    if-nez v15, :cond_0

    .line 107
    const-string v15, "HmacSHA1"

    invoke-static {v15}, Ljavax/crypto/Mac;->getInstance(Ljava/lang/String;)Ljavax/crypto/Mac;

    move-result-object v3

    .line 108
    .local v3, "mac":Ljavax/crypto/Mac;
    new-instance v6, Ljavax/crypto/spec/SecretKeySpec;

    invoke-virtual {v12}, Ljava/lang/String;->getBytes()[B

    move-result-object v15

    invoke-virtual {v3}, Ljavax/crypto/Mac;->getAlgorithm()Ljava/lang/String;

    move-result-object v16

    move-object/from16 v0, v16

    invoke-direct {v6, v15, v0}, Ljavax/crypto/spec/SecretKeySpec;-><init>([BLjava/lang/String;)V

    .line 109
    .local v6, "secret":Ljavax/crypto/spec/SecretKeySpec;
    invoke-virtual {v3, v6}, Ljavax/crypto/Mac;->init(Ljava/security/Key;)V

    .line 110
    invoke-virtual {v10}, Ljava/lang/String;->getBytes()[B

    move-result-object v15

    invoke-virtual {v3, v15}, Ljavax/crypto/Mac;->doFinal([B)[B

    move-result-object v2

    .line 111
    .local v2, "digest":[B
    new-instance v15, Ljava/lang/String;

    const/16 v16, 0x0

    move/from16 v0, v16

    invoke-static {v2, v0}, Landroid/util/Base64;->encode([BI)[B

    move-result-object v16

    invoke-direct/range {v15 .. v16}, Ljava/lang/String;-><init>([B)V

    invoke-virtual {v15}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v8

    .line 112
    .local v8, "signature":Ljava/lang/String;
    new-instance v15, Ljava/lang/StringBuilder;

    invoke-direct {v15}, Ljava/lang/StringBuilder;-><init>()V

    const-string v16, "SDU "

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    invoke-virtual {v15, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    const-string v16, ":"

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    invoke-virtual {v15, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    const-string v16, ":"

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    invoke-virtual {v15, v4, v5}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v15

    invoke-virtual {v15}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    .line 115
    .end local v2    # "digest":[B
    .end local v3    # "mac":Ljavax/crypto/Mac;
    .end local v6    # "secret":Ljavax/crypto/spec/SecretKeySpec;
    .end local v8    # "signature":Ljava/lang/String;
    :cond_0
    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/belkin/wemo/push/cloud/runnable/WeMoCloudPushAbstractRunnable;->TAG:Ljava/lang/String;

    new-instance v16, Ljava/lang/StringBuilder;

    invoke-direct/range {v16 .. v16}, Ljava/lang/StringBuilder;-><init>()V

    const-string v17, "Push Notification: WeMo Cloud Push Sync: Authorization header: "

    invoke-virtual/range {v16 .. v17}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v16

    move-object/from16 v0, v16

    invoke-virtual {v0, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v16

    invoke-virtual/range {v16 .. v16}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v16

    invoke-static/range {v15 .. v16}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 116
    return-object v9
.end method

.method private getRequestStringEntity()Lorg/apache/http/entity/StringEntity;
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/UnsupportedEncodingException;
        }
    .end annotation

    .prologue
    .line 81
    invoke-virtual {p0}, Lcom/belkin/wemo/push/cloud/runnable/WeMoCloudPushAbstractRunnable;->getJSONBody()Ljava/lang/String;

    move-result-object v0

    .line 82
    .local v0, "jsonBody":Ljava/lang/String;
    new-instance v1, Lorg/apache/http/entity/StringEntity;

    invoke-direct {v1, v0}, Lorg/apache/http/entity/StringEntity;-><init>(Ljava/lang/String;)V

    .line 84
    .local v1, "stringEntity":Lorg/apache/http/entity/StringEntity;
    iget-object v2, p0, Lcom/belkin/wemo/push/cloud/runnable/WeMoCloudPushAbstractRunnable;->TAG:Ljava/lang/String;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Push Notification: wemo cloud push sync JSON body: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 85
    return-object v1
.end method

.method private sendHttpRequest(Ljava/lang/String;Lorg/apache/http/entity/StringEntity;Ljava/lang/String;)V
    .locals 7
    .param p1, "httpRequestURL"    # Ljava/lang/String;
    .param p2, "requestStringEntity"    # Lorg/apache/http/entity/StringEntity;
    .param p3, "authHeader"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/http/client/ClientProtocolException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 121
    invoke-static {p3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v4

    if-eqz v4, :cond_0

    .line 123
    iget-object v4, p0, Lcom/belkin/wemo/push/cloud/runnable/WeMoCloudPushAbstractRunnable;->TAG:Ljava/lang/String;

    const-string v5, "Push Notification: WeMo Cloud Push Sync: Generated Authorization header is empty."

    invoke-static {v4, v5}, Lcom/belkin/utils/LogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 124
    new-instance v4, Lcom/belkin/wemo/push/error/PushNotificationError;

    const/16 v5, -0x64

    const-string v6, "Error during register/unregister Push Notification!"

    invoke-direct {v4, v5, v6}, Lcom/belkin/wemo/push/error/PushNotificationError;-><init>(ILjava/lang/String;)V

    invoke-virtual {p0, v4}, Lcom/belkin/wemo/push/cloud/runnable/WeMoCloudPushAbstractRunnable;->onError(Lcom/belkin/wemo/push/error/PushNotificationError;)V

    .line 155
    :goto_0
    return-void

    .line 128
    :cond_0
    iget-object v4, p0, Lcom/belkin/wemo/push/cloud/runnable/WeMoCloudPushAbstractRunnable;->context:Landroid/content/Context;

    invoke-static {v4}, Lcom/belkin/cloud/utils/HTTPUtils;->getCloudNewHttpClient(Landroid/content/Context;)Lorg/apache/http/client/HttpClient;

    move-result-object v1

    .line 130
    .local v1, "httpclient":Lorg/apache/http/client/HttpClient;
    iget-object v4, p0, Lcom/belkin/wemo/push/cloud/runnable/WeMoCloudPushAbstractRunnable;->TAG:Ljava/lang/String;

    const-string v5, "Push Notification: WeMo Cloud Push Sync: Sending request to cloud"

    invoke-static {v4, v5}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 132
    new-instance v2, Lorg/apache/http/client/methods/HttpPost;

    invoke-direct {v2, p1}, Lorg/apache/http/client/methods/HttpPost;-><init>(Ljava/lang/String;)V

    .line 133
    .local v2, "httppost":Lorg/apache/http/client/methods/HttpPost;
    const-string v4, "accept"

    const-string v5, "application/json"

    invoke-virtual {v2, v4, v5}, Lorg/apache/http/client/methods/HttpPost;->addHeader(Ljava/lang/String;Ljava/lang/String;)V

    .line 134
    const-string v4, "Content-Type"

    const-string v5, "application/json"

    invoke-virtual {v2, v4, v5}, Lorg/apache/http/client/methods/HttpPost;->addHeader(Ljava/lang/String;Ljava/lang/String;)V

    .line 135
    const-string v4, "X-TransId"

    const-string v5, "PNApp"

    invoke-virtual {v2, v4, v5}, Lorg/apache/http/client/methods/HttpPost;->addHeader(Ljava/lang/String;Ljava/lang/String;)V

    .line 136
    const-string v4, "Authorization"

    invoke-virtual {v2, v4, p3}, Lorg/apache/http/client/methods/HttpPost;->addHeader(Ljava/lang/String;Ljava/lang/String;)V

    .line 137
    invoke-virtual {v2, p2}, Lorg/apache/http/client/methods/HttpPost;->setEntity(Lorg/apache/http/HttpEntity;)V

    .line 139
    invoke-interface {v1, v2}, Lorg/apache/http/client/HttpClient;->execute(Lorg/apache/http/client/methods/HttpUriRequest;)Lorg/apache/http/HttpResponse;

    move-result-object v3

    .line 140
    .local v3, "response":Lorg/apache/http/HttpResponse;
    invoke-interface {v3}, Lorg/apache/http/HttpResponse;->getStatusLine()Lorg/apache/http/StatusLine;

    move-result-object v4

    invoke-interface {v4}, Lorg/apache/http/StatusLine;->getStatusCode()I

    move-result v0

    .line 142
    .local v0, "code":I
    iget-object v4, p0, Lcom/belkin/wemo/push/cloud/runnable/WeMoCloudPushAbstractRunnable;->TAG:Ljava/lang/String;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "Push Notification: WeMo Cloud Push Sync: Cloud response for request: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 144
    const/16 v4, 0xc8

    if-ne v0, v4, :cond_1

    .line 146
    iget-object v4, p0, Lcom/belkin/wemo/push/cloud/runnable/WeMoCloudPushAbstractRunnable;->registrationId:Ljava/lang/String;

    invoke-virtual {p0, v4}, Lcom/belkin/wemo/push/cloud/runnable/WeMoCloudPushAbstractRunnable;->onSuccess(Ljava/lang/String;)V

    goto :goto_0

    .line 150
    :cond_1
    iget-object v4, p0, Lcom/belkin/wemo/push/cloud/runnable/WeMoCloudPushAbstractRunnable;->TAG:Ljava/lang/String;

    const-string v5, "Push Notification: WeMo Cloud Push Sync: Cloud response FAILED"

    invoke-static {v4, v5}, Lcom/belkin/utils/LogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 151
    new-instance v4, Lcom/belkin/wemo/push/error/PushNotificationError;

    invoke-interface {v3}, Lorg/apache/http/HttpResponse;->getStatusLine()Lorg/apache/http/StatusLine;

    move-result-object v5

    invoke-interface {v5}, Lorg/apache/http/StatusLine;->getReasonPhrase()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v0, v5}, Lcom/belkin/wemo/push/error/PushNotificationError;-><init>(ILjava/lang/String;)V

    invoke-virtual {p0, v4}, Lcom/belkin/wemo/push/cloud/runnable/WeMoCloudPushAbstractRunnable;->onError(Lcom/belkin/wemo/push/error/PushNotificationError;)V

    goto :goto_0
.end method


# virtual methods
.method protected abstract getJSONBody()Ljava/lang/String;
.end method

.method protected abstract getRequestURL()Ljava/lang/String;
.end method

.method protected abstract onError(Lcom/belkin/wemo/push/error/PushNotificationError;)V
.end method

.method protected abstract onSuccess(Ljava/lang/String;)V
.end method

.method public run()V
    .locals 5

    .prologue
    const/16 v4, -0x64

    .line 44
    iget-object v1, p0, Lcom/belkin/wemo/push/cloud/runnable/WeMoCloudPushAbstractRunnable;->TAG:Ljava/lang/String;

    const-string v2, "Push Notification: Sync with Wemo cloud. URL: https://api.xbcs.net:8443/apis/http/plugin/push/register"

    invoke-static {v1, v2}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 47
    :try_start_0
    invoke-virtual {p0}, Lcom/belkin/wemo/push/cloud/runnable/WeMoCloudPushAbstractRunnable;->getRequestURL()Ljava/lang/String;

    move-result-object v1

    invoke-direct {p0}, Lcom/belkin/wemo/push/cloud/runnable/WeMoCloudPushAbstractRunnable;->getRequestStringEntity()Lorg/apache/http/entity/StringEntity;

    move-result-object v2

    invoke-direct {p0}, Lcom/belkin/wemo/push/cloud/runnable/WeMoCloudPushAbstractRunnable;->getAuthHeader()Ljava/lang/String;

    move-result-object v3

    invoke-direct {p0, v1, v2, v3}, Lcom/belkin/wemo/push/cloud/runnable/WeMoCloudPushAbstractRunnable;->sendHttpRequest(Ljava/lang/String;Lorg/apache/http/entity/StringEntity;Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/security/InvalidKeyException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/security/NoSuchAlgorithmException; {:try_start_0 .. :try_end_0} :catch_2
    .catch Lorg/apache/http/client/ClientProtocolException; {:try_start_0 .. :try_end_0} :catch_3
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_4

    .line 74
    :goto_0
    return-void

    .line 48
    :catch_0
    move-exception v0

    .line 50
    .local v0, "e":Ljava/io/UnsupportedEncodingException;
    iget-object v1, p0, Lcom/belkin/wemo/push/cloud/runnable/WeMoCloudPushAbstractRunnable;->TAG:Ljava/lang/String;

    const-string v2, "Push Notification: UnsupportedEncodingException while syncing with WeMo Cloud. "

    invoke-static {v1, v2, v0}, Lcom/belkin/utils/LogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 51
    new-instance v1, Lcom/belkin/wemo/push/error/PushNotificationError;

    invoke-virtual {v0}, Ljava/io/UnsupportedEncodingException;->getMessage()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v4, v2}, Lcom/belkin/wemo/push/error/PushNotificationError;-><init>(ILjava/lang/String;)V

    invoke-virtual {p0, v1}, Lcom/belkin/wemo/push/cloud/runnable/WeMoCloudPushAbstractRunnable;->onError(Lcom/belkin/wemo/push/error/PushNotificationError;)V

    goto :goto_0

    .line 53
    .end local v0    # "e":Ljava/io/UnsupportedEncodingException;
    :catch_1
    move-exception v0

    .line 55
    .local v0, "e":Ljava/security/InvalidKeyException;
    iget-object v1, p0, Lcom/belkin/wemo/push/cloud/runnable/WeMoCloudPushAbstractRunnable;->TAG:Ljava/lang/String;

    const-string v2, "Push Notification: InvalidKeyException while syncing with WeMo Cloud. "

    invoke-static {v1, v2, v0}, Lcom/belkin/utils/LogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 56
    new-instance v1, Lcom/belkin/wemo/push/error/PushNotificationError;

    invoke-virtual {v0}, Ljava/security/InvalidKeyException;->getMessage()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v4, v2}, Lcom/belkin/wemo/push/error/PushNotificationError;-><init>(ILjava/lang/String;)V

    invoke-virtual {p0, v1}, Lcom/belkin/wemo/push/cloud/runnable/WeMoCloudPushAbstractRunnable;->onError(Lcom/belkin/wemo/push/error/PushNotificationError;)V

    goto :goto_0

    .line 58
    .end local v0    # "e":Ljava/security/InvalidKeyException;
    :catch_2
    move-exception v0

    .line 60
    .local v0, "e":Ljava/security/NoSuchAlgorithmException;
    iget-object v1, p0, Lcom/belkin/wemo/push/cloud/runnable/WeMoCloudPushAbstractRunnable;->TAG:Ljava/lang/String;

    const-string v2, "Push Notification: NoSuchAlgorithmException while syncing with WeMo Cloud. "

    invoke-static {v1, v2, v0}, Lcom/belkin/utils/LogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 61
    new-instance v1, Lcom/belkin/wemo/push/error/PushNotificationError;

    invoke-virtual {v0}, Ljava/security/NoSuchAlgorithmException;->getMessage()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v4, v2}, Lcom/belkin/wemo/push/error/PushNotificationError;-><init>(ILjava/lang/String;)V

    invoke-virtual {p0, v1}, Lcom/belkin/wemo/push/cloud/runnable/WeMoCloudPushAbstractRunnable;->onError(Lcom/belkin/wemo/push/error/PushNotificationError;)V

    goto :goto_0

    .line 63
    .end local v0    # "e":Ljava/security/NoSuchAlgorithmException;
    :catch_3
    move-exception v0

    .line 65
    .local v0, "e":Lorg/apache/http/client/ClientProtocolException;
    iget-object v1, p0, Lcom/belkin/wemo/push/cloud/runnable/WeMoCloudPushAbstractRunnable;->TAG:Ljava/lang/String;

    const-string v2, "Push Notification: ClientProtocolException while syncing with WeMo Cloud. "

    invoke-static {v1, v2, v0}, Lcom/belkin/utils/LogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 66
    new-instance v1, Lcom/belkin/wemo/push/error/PushNotificationError;

    invoke-virtual {v0}, Lorg/apache/http/client/ClientProtocolException;->getMessage()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v4, v2}, Lcom/belkin/wemo/push/error/PushNotificationError;-><init>(ILjava/lang/String;)V

    invoke-virtual {p0, v1}, Lcom/belkin/wemo/push/cloud/runnable/WeMoCloudPushAbstractRunnable;->onError(Lcom/belkin/wemo/push/error/PushNotificationError;)V

    goto :goto_0

    .line 68
    .end local v0    # "e":Lorg/apache/http/client/ClientProtocolException;
    :catch_4
    move-exception v0

    .line 70
    .local v0, "e":Ljava/io/IOException;
    iget-object v1, p0, Lcom/belkin/wemo/push/cloud/runnable/WeMoCloudPushAbstractRunnable;->TAG:Ljava/lang/String;

    const-string v2, "Push Notification: IOException while syncing with WeMo Cloud. "

    invoke-static {v1, v2, v0}, Lcom/belkin/utils/LogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 71
    new-instance v1, Lcom/belkin/wemo/push/error/PushNotificationError;

    invoke-virtual {v0}, Ljava/io/IOException;->getMessage()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v4, v2}, Lcom/belkin/wemo/push/error/PushNotificationError;-><init>(ILjava/lang/String;)V

    invoke-virtual {p0, v1}, Lcom/belkin/wemo/push/cloud/runnable/WeMoCloudPushAbstractRunnable;->onError(Lcom/belkin/wemo/push/error/PushNotificationError;)V

    goto :goto_0
.end method
