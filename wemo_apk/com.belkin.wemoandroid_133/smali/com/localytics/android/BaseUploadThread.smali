.class abstract Lcom/localytics/android/BaseUploadThread;
.super Ljava/lang/Thread;
.source "BaseUploadThread.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/localytics/android/BaseUploadThread$UploadType;
    }
.end annotation


# instance fields
.field customerID:Ljava/lang/String;

.field final mData:Ljava/util/TreeMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/TreeMap",
            "<",
            "Ljava/lang/Integer;",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation
.end field

.field mLocalyticsDao:Lcom/localytics/android/LocalyticsDao;

.field private final mSessionHandler:Lcom/localytics/android/BaseHandler;

.field private uploadResponseString:Ljava/lang/String;


# direct methods
.method constructor <init>(Lcom/localytics/android/BaseHandler;Ljava/util/TreeMap;Ljava/lang/String;Lcom/localytics/android/LocalyticsDao;)V
    .locals 1
    .param p1, "sessionHandler"    # Lcom/localytics/android/BaseHandler;
    .param p3, "customerId"    # Ljava/lang/String;
    .param p4, "localyticsDao"    # Lcom/localytics/android/LocalyticsDao;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/localytics/android/BaseHandler;",
            "Ljava/util/TreeMap",
            "<",
            "Ljava/lang/Integer;",
            "Ljava/lang/Object;",
            ">;",
            "Ljava/lang/String;",
            "Lcom/localytics/android/LocalyticsDao;",
            ")V"
        }
    .end annotation

    .prologue
    .line 54
    .local p2, "data":Ljava/util/TreeMap;, "Ljava/util/TreeMap<Ljava/lang/Integer;Ljava/lang/Object;>;"
    invoke-direct {p0}, Ljava/lang/Thread;-><init>()V

    .line 39
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/localytics/android/BaseUploadThread;->uploadResponseString:Ljava/lang/String;

    .line 55
    iput-object p1, p0, Lcom/localytics/android/BaseUploadThread;->mSessionHandler:Lcom/localytics/android/BaseHandler;

    .line 56
    iput-object p2, p0, Lcom/localytics/android/BaseUploadThread;->mData:Ljava/util/TreeMap;

    .line 57
    iput-object p3, p0, Lcom/localytics/android/BaseUploadThread;->customerID:Ljava/lang/String;

    .line 58
    iput-object p4, p0, Lcom/localytics/android/BaseUploadThread;->mLocalyticsDao:Lcom/localytics/android/LocalyticsDao;

    .line 59
    return-void
.end method

.method static createURLConnection(Ljava/net/URL;Ljava/net/Proxy;)Ljava/net/URLConnection;
    .locals 1
    .param p0, "url"    # Ljava/net/URL;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p1, "proxy"    # Ljava/net/Proxy;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 367
    if-nez p1, :cond_0

    .line 369
    invoke-virtual {p0}, Ljava/net/URL;->openConnection()Ljava/net/URLConnection;

    move-result-object v0

    .line 373
    :goto_0
    return-object v0

    :cond_0
    invoke-virtual {p0, p1}, Ljava/net/URL;->openConnection(Ljava/net/Proxy;)Ljava/net/URLConnection;

    move-result-object v0

    goto :goto_0
.end method

.method private static formatUploadBody(Ljava/lang/String;)Ljava/lang/String;
    .locals 3
    .param p0, "body"    # Ljava/lang/String;

    .prologue
    .line 93
    :try_start_0
    new-instance v1, Lorg/json/JSONObject;

    invoke-direct {v1, p0}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    const/4 v2, 0x3

    invoke-virtual {v1, v2}, Lorg/json/JSONObject;->toString(I)Ljava/lang/String;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object p0

    .line 97
    .local v0, "e":Ljava/lang/Exception;
    :goto_0
    return-object p0

    .line 95
    .end local v0    # "e":Ljava/lang/Exception;
    :catch_0
    move-exception v0

    .line 97
    .restart local v0    # "e":Ljava/lang/Exception;
    goto :goto_0
.end method

.method private retrieveHttpResponse(Ljava/io/InputStream;)V
    .locals 6
    .param p1, "input"    # Ljava/io/InputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 329
    new-instance v2, Ljava/io/BufferedReader;

    new-instance v4, Ljava/io/InputStreamReader;

    const-string v5, "UTF-8"

    invoke-direct {v4, p1, v5}, Ljava/io/InputStreamReader;-><init>(Ljava/io/InputStream;Ljava/lang/String;)V

    invoke-direct {v2, v4}, Ljava/io/BufferedReader;-><init>(Ljava/io/Reader;)V

    .line 330
    .local v2, "reader":Ljava/io/BufferedReader;
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 333
    .local v0, "builder":Ljava/lang/StringBuilder;
    :goto_0
    invoke-virtual {v2}, Ljava/io/BufferedReader;->readLine()Ljava/lang/String;

    move-result-object v1

    .local v1, "line":Ljava/lang/String;
    if-eqz v1, :cond_0

    .line 335
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_0

    .line 338
    :cond_0
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    .line 339
    .local v3, "response":Ljava/lang/String;
    invoke-static {v3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v4

    if-nez v4, :cond_1

    .line 341
    invoke-virtual {p0, v3}, Lcom/localytics/android/BaseUploadThread;->onUploadResponded(Ljava/lang/String;)V

    .line 344
    :cond_1
    invoke-virtual {v2}, Ljava/io/BufferedReader;->close()V

    .line 345
    return-void
.end method


# virtual methods
.method getApiKey()Ljava/lang/String;
    .locals 3

    .prologue
    .line 63
    iget-object v2, p0, Lcom/localytics/android/BaseUploadThread;->mLocalyticsDao:Lcom/localytics/android/LocalyticsDao;

    invoke-interface {v2}, Lcom/localytics/android/LocalyticsDao;->getApiKey()Ljava/lang/String;

    move-result-object v0

    .line 64
    .local v0, "apiKey":Ljava/lang/String;
    iget-object v2, p0, Lcom/localytics/android/BaseUploadThread;->mLocalyticsDao:Lcom/localytics/android/LocalyticsDao;

    invoke-interface {v2}, Lcom/localytics/android/LocalyticsDao;->getAppContext()Landroid/content/Context;

    move-result-object v2

    invoke-static {v2}, Lcom/localytics/android/DatapointHelper;->getLocalyticsRollupKeyOrNull(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v1

    .line 65
    .local v1, "rollupKey":Ljava/lang/String;
    if-eqz v1, :cond_0

    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v2

    if-nez v2, :cond_0

    .line 67
    move-object v0, v1

    .line 70
    :cond_0
    return-object v0
.end method

.method onUploadResponded(Ljava/lang/String;)V
    .locals 4
    .param p1, "response"    # Ljava/lang/String;

    .prologue
    .line 354
    const-string v0, "%s upload response: \n%s"

    const/4 v1, 0x2

    new-array v1, v1, [Ljava/lang/Object;

    const/4 v2, 0x0

    iget-object v3, p0, Lcom/localytics/android/BaseUploadThread;->mSessionHandler:Lcom/localytics/android/BaseHandler;

    iget-object v3, v3, Lcom/localytics/android/BaseHandler;->siloName:Ljava/lang/String;

    aput-object v3, v1, v2

    const/4 v2, 0x1

    aput-object p1, v1, v2

    invoke-static {v0, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/localytics/android/Localytics$Log;->w(Ljava/lang/String;)I

    .line 355
    iput-object p1, p0, Lcom/localytics/android/BaseUploadThread;->uploadResponseString:Ljava/lang/String;

    .line 356
    return-void
.end method

.method public run()V
    .locals 9

    .prologue
    const/4 v8, 0x4

    const/4 v4, 0x2

    const/4 v7, 0x1

    const/4 v6, 0x0

    .line 76
    const/4 v0, 0x0

    .line 79
    .local v0, "deleteRows":I
    :try_start_0
    invoke-virtual {p0}, Lcom/localytics/android/BaseUploadThread;->uploadData()I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result v0

    .line 83
    iget-object v1, p0, Lcom/localytics/android/BaseUploadThread;->mSessionHandler:Lcom/localytics/android/BaseHandler;

    iget-object v2, p0, Lcom/localytics/android/BaseUploadThread;->mSessionHandler:Lcom/localytics/android/BaseHandler;

    new-array v3, v4, [Ljava/lang/Object;

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    aput-object v4, v3, v6

    iget-object v4, p0, Lcom/localytics/android/BaseUploadThread;->uploadResponseString:Ljava/lang/String;

    aput-object v4, v3, v7

    invoke-virtual {v2, v8, v3}, Lcom/localytics/android/BaseHandler;->obtainMessage(ILjava/lang/Object;)Landroid/os/Message;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/localytics/android/BaseHandler;->sendMessage(Landroid/os/Message;)Z

    .line 85
    return-void

    .line 83
    :catchall_0
    move-exception v1

    iget-object v2, p0, Lcom/localytics/android/BaseUploadThread;->mSessionHandler:Lcom/localytics/android/BaseHandler;

    iget-object v3, p0, Lcom/localytics/android/BaseUploadThread;->mSessionHandler:Lcom/localytics/android/BaseHandler;

    new-array v4, v4, [Ljava/lang/Object;

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    aput-object v5, v4, v6

    iget-object v5, p0, Lcom/localytics/android/BaseUploadThread;->uploadResponseString:Ljava/lang/String;

    aput-object v5, v4, v7

    invoke-virtual {v3, v8, v4}, Lcom/localytics/android/BaseHandler;->obtainMessage(ILjava/lang/Object;)Landroid/os/Message;

    move-result-object v3

    invoke-virtual {v2, v3}, Lcom/localytics/android/BaseHandler;->sendMessage(Landroid/os/Message;)Z

    throw v1
.end method

.method upload(Lcom/localytics/android/BaseUploadThread$UploadType;Ljava/lang/String;Ljava/lang/String;I)Z
    .locals 6
    .param p1, "uploadType"    # Lcom/localytics/android/BaseUploadThread$UploadType;
    .param p2, "url"    # Ljava/lang/String;
    .param p3, "body"    # Ljava/lang/String;
    .param p4, "attempt"    # I

    .prologue
    .line 103
    const/4 v5, 0x0

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move-object v3, p3

    move v4, p4

    invoke-virtual/range {v0 .. v5}, Lcom/localytics/android/BaseUploadThread;->upload(Lcom/localytics/android/BaseUploadThread$UploadType;Ljava/lang/String;Ljava/lang/String;IZ)Z

    move-result v0

    return v0
.end method

.method upload(Lcom/localytics/android/BaseUploadThread$UploadType;Ljava/lang/String;Ljava/lang/String;IZ)Z
    .locals 18
    .param p1, "uploadType"    # Lcom/localytics/android/BaseUploadThread$UploadType;
    .param p2, "url"    # Ljava/lang/String;
    .param p3, "body"    # Ljava/lang/String;
    .param p4, "attempt"    # I
    .param p5, "noDelay"    # Z

    .prologue
    .line 118
    if-nez p2, :cond_0

    .line 120
    new-instance v2, Ljava/lang/IllegalArgumentException;

    const-string v3, "url cannot be null"

    invoke-direct {v2, v3}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 123
    :cond_0
    if-nez p3, :cond_1

    .line 125
    new-instance v2, Ljava/lang/IllegalArgumentException;

    const-string v3, "body cannot be null"

    invoke-direct {v2, v3}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 128
    :cond_1
    sget-object v2, Lcom/localytics/android/BaseUploadThread$UploadType;->ANALYTICS:Lcom/localytics/android/BaseUploadThread$UploadType;

    move-object/from16 v0, p1

    if-ne v0, v2, :cond_9

    .line 130
    const-string v2, "Analytics upload body before compression is: \n%s"

    const/4 v3, 0x1

    new-array v3, v3, [Ljava/lang/Object;

    const/4 v4, 0x0

    aput-object p3, v3, v4

    invoke-static {v2, v3}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Lcom/localytics/android/Localytics$Log;->v(Ljava/lang/String;)I

    .line 140
    :cond_2
    :goto_0
    const/4 v11, 0x0

    .line 143
    .local v11, "gos":Ljava/util/zip/GZIPOutputStream;
    :try_start_0
    const-string v2, "UTF-8"

    move-object/from16 v0, p3

    invoke-virtual {v0, v2}, Ljava/lang/String;->getBytes(Ljava/lang/String;)[B

    move-result-object v13

    .line 144
    .local v13, "originalBytes":[B
    sget-object v2, Lcom/localytics/android/BaseUploadThread$UploadType;->ANALYTICS:Lcom/localytics/android/BaseUploadThread$UploadType;

    move-object/from16 v0, p1

    if-ne v0, v2, :cond_a

    .line 152
    new-instance v8, Ljava/io/ByteArrayOutputStream;

    array-length v2, v13

    invoke-direct {v8, v2}, Ljava/io/ByteArrayOutputStream;-><init>(I)V

    .line 153
    .local v8, "baos":Ljava/io/ByteArrayOutputStream;
    new-instance v12, Ljava/util/zip/GZIPOutputStream;

    invoke-direct {v12, v8}, Ljava/util/zip/GZIPOutputStream;-><init>(Ljava/io/OutputStream;)V
    :try_end_0
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_3
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 154
    .end local v11    # "gos":Ljava/util/zip/GZIPOutputStream;
    .local v12, "gos":Ljava/util/zip/GZIPOutputStream;
    :try_start_1
    invoke-virtual {v12, v13}, Ljava/util/zip/GZIPOutputStream;->write([B)V

    .line 155
    invoke-virtual {v12}, Ljava/util/zip/GZIPOutputStream;->finish()V

    .line 161
    invoke-static {}, Lcom/localytics/android/DatapointHelper;->getApiLevel()I

    move-result v2

    const/16 v3, 0x13

    if-ge v2, v3, :cond_3

    .line 163
    invoke-virtual {v12}, Ljava/util/zip/GZIPOutputStream;->flush()V

    .line 166
    :cond_3
    invoke-virtual {v8}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B
    :try_end_1
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_1 .. :try_end_1} :catch_a
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_9
    .catchall {:try_start_1 .. :try_end_1} :catchall_3

    move-result-object v17

    .local v17, "uploadData":[B
    move-object v11, v12

    .line 185
    .end local v8    # "baos":Ljava/io/ByteArrayOutputStream;
    .end local v12    # "gos":Ljava/util/zip/GZIPOutputStream;
    .restart local v11    # "gos":Ljava/util/zip/GZIPOutputStream;
    :goto_1
    if-eqz v11, :cond_4

    .line 189
    :try_start_2
    invoke-virtual {v11}, Ljava/util/zip/GZIPOutputStream;->close()V
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_0

    .line 190
    const/4 v11, 0x0

    .line 201
    :cond_4
    const/4 v9, 0x0

    .line 204
    .local v9, "connection":Ljava/net/HttpURLConnection;
    :try_start_3
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/localytics/android/BaseUploadThread;->mLocalyticsDao:Lcom/localytics/android/LocalyticsDao;

    invoke-interface {v2}, Lcom/localytics/android/LocalyticsDao;->getProxy()Ljava/net/Proxy;

    move-result-object v14

    .line 205
    .local v14, "proxy":Ljava/net/Proxy;
    new-instance v2, Ljava/net/URL;

    move-object/from16 v0, p2

    invoke-direct {v2, v0}, Ljava/net/URL;-><init>(Ljava/lang/String;)V

    invoke-static {v2, v14}, Lcom/localytics/android/BaseUploadThread;->createURLConnection(Ljava/net/URL;Ljava/net/Proxy;)Ljava/net/URLConnection;

    move-result-object v2

    move-object v0, v2

    check-cast v0, Ljava/net/HttpURLConnection;

    move-object v9, v0

    .line 207
    const v2, 0xea60

    invoke-virtual {v9, v2}, Ljava/net/HttpURLConnection;->setConnectTimeout(I)V

    .line 208
    const v2, 0xea60

    invoke-virtual {v9, v2}, Ljava/net/HttpURLConnection;->setReadTimeout(I)V

    .line 209
    sget-object v2, Lcom/localytics/android/BaseUploadThread$UploadType;->MARKETING:Lcom/localytics/android/BaseUploadThread$UploadType;

    move-object/from16 v0, p1

    if-eq v0, v2, :cond_c

    const/4 v2, 0x1

    :goto_2
    invoke-virtual {v9, v2}, Ljava/net/HttpURLConnection;->setDoOutput(Z)V

    .line 210
    sget-object v2, Lcom/localytics/android/BaseUploadThread$UploadType;->ANALYTICS:Lcom/localytics/android/BaseUploadThread$UploadType;

    move-object/from16 v0, p1

    if-ne v0, v2, :cond_d

    .line 212
    const-string v2, "Content-Type"

    const-string v3, "application/x-gzip"

    invoke-virtual {v9, v2, v3}, Ljava/net/HttpURLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 213
    const-string v2, "Content-Encoding"

    const-string v3, "gzip"

    invoke-virtual {v9, v2, v3}, Ljava/net/HttpURLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 214
    const-string v2, "X-DONT-SEND-AMP"

    const-string v3, "1"

    invoke-virtual {v9, v2, v3}, Ljava/net/HttpURLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 220
    :goto_3
    sget-object v2, Lcom/localytics/android/BaseUploadThread$UploadType;->MARKETING:Lcom/localytics/android/BaseUploadThread$UploadType;

    move-object/from16 v0, p1

    if-ne v0, v2, :cond_5

    invoke-static {}, Lcom/localytics/android/Constants;->isTestModeEnabled()Z

    move-result v2

    if-eqz v2, :cond_5

    .line 222
    const-string v2, "AMP-Test-Mode"

    const-string v3, "1"

    invoke-virtual {v9, v2, v3}, Ljava/net/HttpURLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 224
    :cond_5
    if-eqz p5, :cond_6

    .line 226
    const-string v2, "X-NO-DELAY"

    const-string v3, "1"

    invoke-virtual {v9, v2, v3}, Ljava/net/HttpURLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 232
    :cond_6
    const-string v2, "Accept-Encoding"

    const-string v3, ""

    invoke-virtual {v9, v2, v3}, Ljava/net/HttpURLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 233
    const-string v2, "x-upload-time"

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v4

    long-to-double v4, v4

    const-wide v6, 0x408f400000000000L    # 1000.0

    div-double/2addr v4, v6

    invoke-static {v4, v5}, Ljava/lang/Math;->round(D)J

    move-result-wide v4

    invoke-static {v4, v5}, Ljava/lang/Long;->toString(J)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v9, v2, v3}, Ljava/net/HttpURLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 234
    const-string v2, "x-install-id"

    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/localytics/android/BaseUploadThread;->mLocalyticsDao:Lcom/localytics/android/LocalyticsDao;

    invoke-interface {v3}, Lcom/localytics/android/LocalyticsDao;->getInstallationId()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v9, v2, v3}, Ljava/net/HttpURLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 235
    const-string v2, "x-app-id"

    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/localytics/android/BaseUploadThread;->mLocalyticsDao:Lcom/localytics/android/LocalyticsDao;

    invoke-interface {v3}, Lcom/localytics/android/LocalyticsDao;->getApiKey()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v9, v2, v3}, Ljava/net/HttpURLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 236
    const-string v2, "x-client-version"

    const-string v3, "androida_3.4.0"

    invoke-virtual {v9, v2, v3}, Ljava/net/HttpURLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 237
    const-string v2, "x-app-version"

    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/localytics/android/BaseUploadThread;->mLocalyticsDao:Lcom/localytics/android/LocalyticsDao;

    invoke-interface {v3}, Lcom/localytics/android/LocalyticsDao;->getAppContext()Landroid/content/Context;

    move-result-object v3

    invoke-static {v3}, Lcom/localytics/android/DatapointHelper;->getAppVersion(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v9, v2, v3}, Ljava/net/HttpURLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 238
    const-string v2, "x-customer-id"

    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/localytics/android/BaseUploadThread;->customerID:Ljava/lang/String;

    invoke-virtual {v9, v2, v3}, Ljava/net/HttpURLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 240
    sget-object v2, Lcom/localytics/android/BaseUploadThread$UploadType;->MARKETING:Lcom/localytics/android/BaseUploadThread$UploadType;

    move-object/from16 v0, p1

    if-eq v0, v2, :cond_7

    .line 242
    move-object/from16 v0, v17

    array-length v2, v0

    invoke-virtual {v9, v2}, Ljava/net/HttpURLConnection;->setFixedLengthStreamingMode(I)V
    :try_end_3
    .catch Ljava/io/EOFException; {:try_start_3 .. :try_end_3} :catch_6
    .catch Ljava/net/MalformedURLException; {:try_start_3 .. :try_end_3} :catch_7
    .catch Ljava/io/IOException; {:try_start_3 .. :try_end_3} :catch_8
    .catchall {:try_start_3 .. :try_end_3} :catchall_2

    .line 243
    const/16 v16, 0x0

    .line 246
    .local v16, "stream":Ljava/io/OutputStream;
    :try_start_4
    invoke-virtual {v9}, Ljava/net/HttpURLConnection;->getOutputStream()Ljava/io/OutputStream;

    move-result-object v16

    .line 247
    invoke-virtual/range {v16 .. v17}, Ljava/io/OutputStream;->write([B)V
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_1

    .line 251
    if-eqz v16, :cond_7

    .line 253
    :try_start_5
    invoke-virtual/range {v16 .. v16}, Ljava/io/OutputStream;->flush()V

    .line 254
    invoke-virtual/range {v16 .. v16}, Ljava/io/OutputStream;->close()V

    .line 255
    const/16 v16, 0x0

    .line 260
    .end local v16    # "stream":Ljava/io/OutputStream;
    :cond_7
    invoke-virtual {v9}, Ljava/net/HttpURLConnection;->getResponseCode()I

    move-result v15

    .line 262
    .local v15, "statusCode":I
    const-string v2, "%s upload complete with status %d"

    const/4 v3, 0x2

    new-array v3, v3, [Ljava/lang/Object;

    const/4 v4, 0x0

    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/localytics/android/BaseUploadThread;->mSessionHandler:Lcom/localytics/android/BaseHandler;

    iget-object v5, v5, Lcom/localytics/android/BaseHandler;->siloName:Ljava/lang/String;

    aput-object v5, v3, v4

    const/4 v4, 0x1

    invoke-static {v15}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    aput-object v5, v3, v4

    invoke-static {v2, v3}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Lcom/localytics/android/Localytics$Log;->v(Ljava/lang/String;)I
    :try_end_5
    .catch Ljava/io/EOFException; {:try_start_5 .. :try_end_5} :catch_6
    .catch Ljava/net/MalformedURLException; {:try_start_5 .. :try_end_5} :catch_7
    .catch Ljava/io/IOException; {:try_start_5 .. :try_end_5} :catch_8
    .catchall {:try_start_5 .. :try_end_5} :catchall_2

    .line 264
    const/16 v2, 0x1ad

    if-ne v15, v2, :cond_f

    .line 266
    const/4 v2, 0x0

    .line 312
    if-eqz v9, :cond_8

    .line 314
    invoke-virtual {v9}, Ljava/net/HttpURLConnection;->disconnect()V

    .line 315
    const/4 v9, 0x0

    .line 319
    .end local v9    # "connection":Ljava/net/HttpURLConnection;
    .end local v13    # "originalBytes":[B
    .end local v14    # "proxy":Ljava/net/Proxy;
    .end local v15    # "statusCode":I
    .end local v17    # "uploadData":[B
    :cond_8
    :goto_4
    return v2

    .line 132
    .end local v11    # "gos":Ljava/util/zip/GZIPOutputStream;
    :cond_9
    sget-object v2, Lcom/localytics/android/BaseUploadThread$UploadType;->PROFILES:Lcom/localytics/android/BaseUploadThread$UploadType;

    move-object/from16 v0, p1

    if-ne v0, v2, :cond_2

    .line 134
    const-string v2, "Profile upload body is: \n%s"

    const/4 v3, 0x1

    new-array v3, v3, [Ljava/lang/Object;

    const/4 v4, 0x0

    invoke-static/range {p3 .. p3}, Lcom/localytics/android/BaseUploadThread;->formatUploadBody(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    aput-object v5, v3, v4

    invoke-static {v2, v3}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Lcom/localytics/android/Localytics$Log;->v(Ljava/lang/String;)I

    goto/16 :goto_0

    .line 170
    .restart local v11    # "gos":Ljava/util/zip/GZIPOutputStream;
    .restart local v13    # "originalBytes":[B
    :cond_a
    move-object/from16 v17, v13

    .restart local v17    # "uploadData":[B
    goto/16 :goto_1

    .line 192
    :catch_0
    move-exception v10

    .line 194
    .local v10, "e":Ljava/io/IOException;
    const-string v2, "Caught exception"

    invoke-static {v2, v10}, Lcom/localytics/android/Localytics$Log;->w(Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 195
    const/4 v2, 0x0

    goto :goto_4

    .line 173
    .end local v10    # "e":Ljava/io/IOException;
    .end local v13    # "originalBytes":[B
    .end local v17    # "uploadData":[B
    :catch_1
    move-exception v10

    .line 175
    .local v10, "e":Ljava/io/UnsupportedEncodingException;
    :goto_5
    :try_start_6
    const-string v2, "UnsupportedEncodingException"

    invoke-static {v2, v10}, Lcom/localytics/android/Localytics$Log;->w(Ljava/lang/String;Ljava/lang/Throwable;)I
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_0

    .line 176
    const/4 v2, 0x0

    .line 185
    if-eqz v11, :cond_8

    .line 189
    :try_start_7
    invoke-virtual {v11}, Ljava/util/zip/GZIPOutputStream;->close()V
    :try_end_7
    .catch Ljava/io/IOException; {:try_start_7 .. :try_end_7} :catch_2

    .line 190
    const/4 v11, 0x0

    goto :goto_4

    .line 192
    :catch_2
    move-exception v10

    .line 194
    .local v10, "e":Ljava/io/IOException;
    const-string v2, "Caught exception"

    invoke-static {v2, v10}, Lcom/localytics/android/Localytics$Log;->w(Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 195
    const/4 v2, 0x0

    goto :goto_4

    .line 178
    .end local v10    # "e":Ljava/io/IOException;
    :catch_3
    move-exception v10

    .line 180
    .restart local v10    # "e":Ljava/io/IOException;
    :goto_6
    :try_start_8
    const-string v2, "IOException"

    invoke-static {v2, v10}, Lcom/localytics/android/Localytics$Log;->w(Ljava/lang/String;Ljava/lang/Throwable;)I
    :try_end_8
    .catchall {:try_start_8 .. :try_end_8} :catchall_0

    .line 181
    const/4 v2, 0x0

    .line 185
    if-eqz v11, :cond_8

    .line 189
    :try_start_9
    invoke-virtual {v11}, Ljava/util/zip/GZIPOutputStream;->close()V
    :try_end_9
    .catch Ljava/io/IOException; {:try_start_9 .. :try_end_9} :catch_4

    .line 190
    const/4 v11, 0x0

    goto :goto_4

    .line 192
    :catch_4
    move-exception v10

    .line 194
    const-string v2, "Caught exception"

    invoke-static {v2, v10}, Lcom/localytics/android/Localytics$Log;->w(Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 195
    const/4 v2, 0x0

    goto :goto_4

    .line 185
    .end local v10    # "e":Ljava/io/IOException;
    :catchall_0
    move-exception v2

    :goto_7
    if-eqz v11, :cond_b

    .line 189
    :try_start_a
    invoke-virtual {v11}, Ljava/util/zip/GZIPOutputStream;->close()V
    :try_end_a
    .catch Ljava/io/IOException; {:try_start_a .. :try_end_a} :catch_5

    .line 190
    const/4 v11, 0x0

    .line 195
    :cond_b
    throw v2

    .line 192
    :catch_5
    move-exception v10

    .line 194
    .restart local v10    # "e":Ljava/io/IOException;
    const-string v2, "Caught exception"

    invoke-static {v2, v10}, Lcom/localytics/android/Localytics$Log;->w(Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 195
    const/4 v2, 0x0

    goto :goto_4

    .line 209
    .end local v10    # "e":Ljava/io/IOException;
    .restart local v9    # "connection":Ljava/net/HttpURLConnection;
    .restart local v13    # "originalBytes":[B
    .restart local v14    # "proxy":Ljava/net/Proxy;
    .restart local v17    # "uploadData":[B
    :cond_c
    const/4 v2, 0x0

    goto/16 :goto_2

    .line 218
    :cond_d
    :try_start_b
    const-string v2, "Content-Type"

    const-string v3, "application/json; charset=utf-8"

    invoke-virtual {v9, v2, v3}, Ljava/net/HttpURLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_b
    .catch Ljava/io/EOFException; {:try_start_b .. :try_end_b} :catch_6
    .catch Ljava/net/MalformedURLException; {:try_start_b .. :try_end_b} :catch_7
    .catch Ljava/io/IOException; {:try_start_b .. :try_end_b} :catch_8
    .catchall {:try_start_b .. :try_end_b} :catchall_2

    goto/16 :goto_3

    .line 288
    .end local v14    # "proxy":Ljava/net/Proxy;
    :catch_6
    move-exception v10

    .line 290
    .local v10, "e":Ljava/io/EOFException;
    const/4 v2, 0x2

    move/from16 v0, p4

    if-ne v0, v2, :cond_13

    .line 292
    :try_start_c
    const-string v2, "ClientProtocolException"

    invoke-static {v2, v10}, Lcom/localytics/android/Localytics$Log;->w(Ljava/lang/String;Ljava/lang/Throwable;)I
    :try_end_c
    .catchall {:try_start_c .. :try_end_c} :catchall_2

    .line 293
    const/4 v2, 0x0

    .line 312
    if-eqz v9, :cond_8

    .line 314
    invoke-virtual {v9}, Ljava/net/HttpURLConnection;->disconnect()V

    .line 315
    const/4 v9, 0x0

    goto/16 :goto_4

    .line 251
    .end local v10    # "e":Ljava/io/EOFException;
    .restart local v14    # "proxy":Ljava/net/Proxy;
    .restart local v16    # "stream":Ljava/io/OutputStream;
    :catchall_1
    move-exception v2

    if-eqz v16, :cond_e

    .line 253
    :try_start_d
    invoke-virtual/range {v16 .. v16}, Ljava/io/OutputStream;->flush()V

    .line 254
    invoke-virtual/range {v16 .. v16}, Ljava/io/OutputStream;->close()V

    .line 255
    const/16 v16, 0x0

    :cond_e
    throw v2
    :try_end_d
    .catch Ljava/io/EOFException; {:try_start_d .. :try_end_d} :catch_6
    .catch Ljava/net/MalformedURLException; {:try_start_d .. :try_end_d} :catch_7
    .catch Ljava/io/IOException; {:try_start_d .. :try_end_d} :catch_8
    .catchall {:try_start_d .. :try_end_d} :catchall_2

    .line 300
    .end local v14    # "proxy":Ljava/net/Proxy;
    .end local v16    # "stream":Ljava/io/OutputStream;
    :catch_7
    move-exception v10

    .line 302
    .local v10, "e":Ljava/net/MalformedURLException;
    :try_start_e
    const-string v2, "ClientProtocolException"

    invoke-static {v2, v10}, Lcom/localytics/android/Localytics$Log;->w(Ljava/lang/String;Ljava/lang/Throwable;)I
    :try_end_e
    .catchall {:try_start_e .. :try_end_e} :catchall_2

    .line 303
    const/4 v2, 0x0

    .line 312
    if-eqz v9, :cond_8

    .line 314
    invoke-virtual {v9}, Ljava/net/HttpURLConnection;->disconnect()V

    .line 315
    const/4 v9, 0x0

    goto/16 :goto_4

    .line 271
    .end local v10    # "e":Ljava/net/MalformedURLException;
    .restart local v14    # "proxy":Ljava/net/Proxy;
    .restart local v15    # "statusCode":I
    :cond_f
    const/16 v2, 0x190

    if-lt v15, v2, :cond_10

    const/16 v2, 0x1f3

    if-gt v15, v2, :cond_10

    .line 273
    const/4 v2, 0x1

    .line 312
    if-eqz v9, :cond_8

    .line 314
    invoke-virtual {v9}, Ljava/net/HttpURLConnection;->disconnect()V

    .line 315
    const/4 v9, 0x0

    goto/16 :goto_4

    .line 278
    :cond_10
    const/16 v2, 0x1f4

    if-lt v15, v2, :cond_11

    const/16 v2, 0x257

    if-gt v15, v2, :cond_11

    .line 280
    const/4 v2, 0x0

    .line 312
    if-eqz v9, :cond_8

    .line 314
    invoke-virtual {v9}, Ljava/net/HttpURLConnection;->disconnect()V

    .line 315
    const/4 v9, 0x0

    goto/16 :goto_4

    .line 286
    :cond_11
    :try_start_f
    invoke-virtual {v9}, Ljava/net/HttpURLConnection;->getInputStream()Ljava/io/InputStream;

    move-result-object v2

    move-object/from16 v0, p0

    invoke-direct {v0, v2}, Lcom/localytics/android/BaseUploadThread;->retrieveHttpResponse(Ljava/io/InputStream;)V
    :try_end_f
    .catch Ljava/io/EOFException; {:try_start_f .. :try_end_f} :catch_6
    .catch Ljava/net/MalformedURLException; {:try_start_f .. :try_end_f} :catch_7
    .catch Ljava/io/IOException; {:try_start_f .. :try_end_f} :catch_8
    .catchall {:try_start_f .. :try_end_f} :catchall_2

    .line 312
    if-eqz v9, :cond_12

    .line 314
    invoke-virtual {v9}, Ljava/net/HttpURLConnection;->disconnect()V

    .line 315
    const/4 v9, 0x0

    .line 319
    :cond_12
    const/4 v2, 0x1

    goto/16 :goto_4

    .line 297
    .end local v14    # "proxy":Ljava/net/Proxy;
    .end local v15    # "statusCode":I
    .local v10, "e":Ljava/io/EOFException;
    :cond_13
    add-int/lit8 v6, p4, 0x1

    move-object/from16 v2, p0

    move-object/from16 v3, p1

    move-object/from16 v4, p2

    move-object/from16 v5, p3

    move/from16 v7, p5

    :try_start_10
    invoke-virtual/range {v2 .. v7}, Lcom/localytics/android/BaseUploadThread;->upload(Lcom/localytics/android/BaseUploadThread$UploadType;Ljava/lang/String;Ljava/lang/String;IZ)Z
    :try_end_10
    .catchall {:try_start_10 .. :try_end_10} :catchall_2

    move-result v2

    .line 312
    if-eqz v9, :cond_8

    .line 314
    invoke-virtual {v9}, Ljava/net/HttpURLConnection;->disconnect()V

    .line 315
    const/4 v9, 0x0

    goto/16 :goto_4

    .line 305
    .end local v10    # "e":Ljava/io/EOFException;
    :catch_8
    move-exception v10

    .line 307
    .local v10, "e":Ljava/io/IOException;
    :try_start_11
    const-string v2, "ClientProtocolException"

    invoke-static {v2, v10}, Lcom/localytics/android/Localytics$Log;->w(Ljava/lang/String;Ljava/lang/Throwable;)I
    :try_end_11
    .catchall {:try_start_11 .. :try_end_11} :catchall_2

    .line 308
    const/4 v2, 0x0

    .line 312
    if-eqz v9, :cond_8

    .line 314
    invoke-virtual {v9}, Ljava/net/HttpURLConnection;->disconnect()V

    .line 315
    const/4 v9, 0x0

    goto/16 :goto_4

    .line 312
    .end local v10    # "e":Ljava/io/IOException;
    :catchall_2
    move-exception v2

    if-eqz v9, :cond_14

    .line 314
    invoke-virtual {v9}, Ljava/net/HttpURLConnection;->disconnect()V

    .line 315
    const/4 v9, 0x0

    :cond_14
    throw v2

    .line 185
    .end local v9    # "connection":Ljava/net/HttpURLConnection;
    .end local v11    # "gos":Ljava/util/zip/GZIPOutputStream;
    .end local v17    # "uploadData":[B
    .restart local v8    # "baos":Ljava/io/ByteArrayOutputStream;
    .restart local v12    # "gos":Ljava/util/zip/GZIPOutputStream;
    :catchall_3
    move-exception v2

    move-object v11, v12

    .end local v12    # "gos":Ljava/util/zip/GZIPOutputStream;
    .restart local v11    # "gos":Ljava/util/zip/GZIPOutputStream;
    goto/16 :goto_7

    .line 178
    .end local v11    # "gos":Ljava/util/zip/GZIPOutputStream;
    .restart local v12    # "gos":Ljava/util/zip/GZIPOutputStream;
    :catch_9
    move-exception v10

    move-object v11, v12

    .end local v12    # "gos":Ljava/util/zip/GZIPOutputStream;
    .restart local v11    # "gos":Ljava/util/zip/GZIPOutputStream;
    goto/16 :goto_6

    .line 173
    .end local v11    # "gos":Ljava/util/zip/GZIPOutputStream;
    .restart local v12    # "gos":Ljava/util/zip/GZIPOutputStream;
    :catch_a
    move-exception v10

    move-object v11, v12

    .end local v12    # "gos":Ljava/util/zip/GZIPOutputStream;
    .restart local v11    # "gos":Ljava/util/zip/GZIPOutputStream;
    goto/16 :goto_5
.end method

.method abstract uploadData()I
.end method
