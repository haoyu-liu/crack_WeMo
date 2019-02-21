.class final Lcom/localytics/android/MarketingDownloader;
.super Lcom/localytics/android/BaseUploadThread;
.source "MarketingDownloader.java"


# static fields
.field private static final MARKETING_URL_HTTP:Ljava/lang/String; = "http://%s/api/v2/applications/%s/amp"

.field private static final MARKETING_URL_HTTPS:Ljava/lang/String; = "https://%s/api/v2/applications/%s/amp"


# direct methods
.method constructor <init>(Lcom/localytics/android/BaseHandler;Ljava/util/TreeMap;Ljava/lang/String;Lcom/localytics/android/LocalyticsDao;)V
    .locals 0
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
    .line 46
    .local p2, "data":Ljava/util/TreeMap;, "Ljava/util/TreeMap<Ljava/lang/Integer;Ljava/lang/Object;>;"
    invoke-direct {p0, p1, p2, p3, p4}, Lcom/localytics/android/BaseUploadThread;-><init>(Lcom/localytics/android/BaseHandler;Ljava/util/TreeMap;Ljava/lang/String;Lcom/localytics/android/LocalyticsDao;)V

    .line 47
    return-void
.end method

.method static downloadFile(Ljava/lang/String;Ljava/lang/String;ZLjava/net/Proxy;)Ljava/lang/String;
    .locals 18
    .param p0, "remoteFilePath"    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p1, "localFilePath"    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2, "isOverwrite"    # Z
    .param p3, "proxy"    # Ljava/net/Proxy;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation

    .prologue
    .line 61
    move-object/from16 v10, p1

    .line 63
    .local v10, "result":Ljava/lang/String;
    new-instance v6, Ljava/io/File;

    move-object/from16 v0, p1

    invoke-direct {v6, v0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 64
    .local v6, "file":Ljava/io/File;
    invoke-virtual {v6}, Ljava/io/File;->exists()Z

    move-result v14

    if-eqz v14, :cond_0

    if-nez p2, :cond_0

    .line 66
    const-string v14, "The file %s does exist and overwrite is turned off."

    const/4 v15, 0x1

    new-array v15, v15, [Ljava/lang/Object;

    const/16 v16, 0x0

    invoke-virtual {v6}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v17

    aput-object v17, v15, v16

    invoke-static {v14, v15}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v14

    invoke-static {v14}, Lcom/localytics/android/Localytics$Log;->w(Ljava/lang/String;)I

    .line 115
    .end local p1    # "localFilePath":Ljava/lang/String;
    :goto_0
    return-object p1

    .line 70
    .restart local p1    # "localFilePath":Ljava/lang/String;
    :cond_0
    invoke-virtual {v6}, Ljava/io/File;->getParentFile()Ljava/io/File;

    move-result-object v4

    .line 71
    .local v4, "dir":Ljava/io/File;
    invoke-virtual {v4}, Ljava/io/File;->mkdirs()Z

    move-result v14

    if-nez v14, :cond_1

    invoke-virtual {v4}, Ljava/io/File;->isDirectory()Z

    move-result v14

    if-nez v14, :cond_1

    .line 73
    const-string v14, "Could not create the directory %s for saving file."

    const/4 v15, 0x1

    new-array v15, v15, [Ljava/lang/Object;

    const/16 v16, 0x0

    invoke-virtual {v4}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v17

    aput-object v17, v15, v16

    invoke-static {v14, v15}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v14

    invoke-static {v14}, Lcom/localytics/android/Localytics$Log;->w(Ljava/lang/String;)I

    .line 74
    const/16 p1, 0x0

    goto :goto_0

    .line 80
    :cond_1
    :try_start_0
    new-instance v11, Ljava/io/File;

    const-string v14, "%s_temp"

    const/4 v15, 0x1

    new-array v15, v15, [Ljava/lang/Object;

    const/16 v16, 0x0

    aput-object p1, v15, v16

    invoke-static {v14, v15}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v14

    invoke-direct {v11, v14}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 81
    .local v11, "tempFile":Ljava/io/File;
    invoke-virtual {v11}, Ljava/io/File;->createNewFile()Z

    .line 83
    new-instance v13, Ljava/net/URL;

    move-object/from16 v0, p0

    invoke-direct {v13, v0}, Ljava/net/URL;-><init>(Ljava/lang/String;)V

    .line 84
    .local v13, "url":Ljava/net/URL;
    move-object/from16 v0, p3

    invoke-static {v13, v0}, Lcom/localytics/android/BaseUploadThread;->createURLConnection(Ljava/net/URL;Ljava/net/Proxy;)Ljava/net/URLConnection;

    move-result-object v12

    .line 89
    .local v12, "ucon":Ljava/net/URLConnection;
    const/16 v1, 0x2000

    .line 90
    .local v1, "BUF_SIZE":I
    invoke-virtual {v12}, Ljava/net/URLConnection;->getInputStream()Ljava/io/InputStream;

    move-result-object v8

    .line 91
    .local v8, "is":Ljava/io/InputStream;
    new-instance v2, Ljava/io/BufferedInputStream;

    const/16 v14, 0x4000

    invoke-direct {v2, v8, v14}, Ljava/io/BufferedInputStream;-><init>(Ljava/io/InputStream;I)V

    .line 92
    .local v2, "bis":Ljava/io/BufferedInputStream;
    new-instance v7, Ljava/io/FileOutputStream;

    invoke-virtual {v11}, Ljava/io/File;->getPath()Ljava/lang/String;

    move-result-object v14

    invoke-direct {v7, v14}, Ljava/io/FileOutputStream;-><init>(Ljava/lang/String;)V

    .line 95
    .local v7, "fos":Ljava/io/FileOutputStream;
    const/16 v14, 0x2000

    new-array v3, v14, [B

    .line 97
    .local v3, "buffer":[B
    :goto_1
    invoke-virtual {v2, v3}, Ljava/io/BufferedInputStream;->read([B)I

    move-result v9

    .local v9, "read":I
    const/4 v14, -0x1

    if-eq v9, v14, :cond_3

    .line 99
    const/4 v14, 0x0

    invoke-virtual {v7, v3, v14, v9}, Ljava/io/FileOutputStream;->write([BII)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_1

    .line 109
    .end local v1    # "BUF_SIZE":I
    .end local v2    # "bis":Ljava/io/BufferedInputStream;
    .end local v3    # "buffer":[B
    .end local v7    # "fos":Ljava/io/FileOutputStream;
    .end local v8    # "is":Ljava/io/InputStream;
    .end local v9    # "read":I
    .end local v11    # "tempFile":Ljava/io/File;
    .end local v12    # "ucon":Ljava/net/URLConnection;
    .end local v13    # "url":Ljava/net/URL;
    :catch_0
    move-exception v5

    .line 111
    .local v5, "e":Ljava/io/IOException;
    const-string v14, "In-app campaign not found. Creating a new one."

    invoke-static {v14}, Lcom/localytics/android/Localytics$Log;->w(Ljava/lang/String;)I

    .line 112
    const/4 v10, 0x0

    .end local v5    # "e":Ljava/io/IOException;
    :cond_2
    move-object/from16 p1, v10

    .line 115
    goto :goto_0

    .line 101
    .restart local v1    # "BUF_SIZE":I
    .restart local v2    # "bis":Ljava/io/BufferedInputStream;
    .restart local v3    # "buffer":[B
    .restart local v7    # "fos":Ljava/io/FileOutputStream;
    .restart local v8    # "is":Ljava/io/InputStream;
    .restart local v9    # "read":I
    .restart local v11    # "tempFile":Ljava/io/File;
    .restart local v12    # "ucon":Ljava/net/URLConnection;
    .restart local v13    # "url":Ljava/net/URL;
    :cond_3
    :try_start_1
    invoke-virtual {v7}, Ljava/io/FileOutputStream;->close()V

    .line 103
    invoke-virtual {v11, v6}, Ljava/io/File;->renameTo(Ljava/io/File;)Z

    move-result v14

    if-nez v14, :cond_2

    .line 105
    invoke-virtual {v11}, Ljava/io/File;->delete()Z
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0

    .line 106
    const/16 p1, 0x0

    goto/16 :goto_0
.end method

.method static getLocalFileURL(JZLandroid/content/Context;Ljava/lang/String;)Ljava/lang/String;
    .locals 8
    .param p0, "ruleId"    # J
    .param p2, "isZipped"    # Z
    .param p3, "appContext"    # Landroid/content/Context;
    .param p4, "apiKey"    # Ljava/lang/String;

    .prologue
    const/4 v7, 0x1

    const/4 v6, 0x0

    .line 154
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 156
    .local v0, "builder":Ljava/lang/StringBuilder;
    invoke-static {p3, p4}, Lcom/localytics/android/MarketingDownloader;->getMarketingDataDirectory(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 157
    sget-object v3, Ljava/io/File;->separator:Ljava/lang/String;

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 159
    if-eqz p2, :cond_0

    .line 161
    const-string v3, "amp_rule_%d.zip"

    new-array v4, v7, [Ljava/lang/Object;

    invoke-static {p0, p1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v5

    aput-object v5, v4, v6

    invoke-static {v3, v4}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 185
    :goto_0
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    :goto_1
    return-object v3

    .line 165
    :cond_0
    const-string v3, "marketing_rule_%d"

    new-array v4, v7, [Ljava/lang/Object;

    invoke-static {p0, p1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v5

    aput-object v5, v4, v6

    invoke-static {v3, v4}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 167
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    .line 169
    .local v2, "path":Ljava/lang/String;
    new-instance v1, Ljava/io/File;

    invoke-direct {v1, v2}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 172
    .local v1, "file":Ljava/io/File;
    invoke-virtual {v1}, Ljava/io/File;->exists()Z

    move-result v3

    if-eqz v3, :cond_1

    invoke-virtual {v1}, Ljava/io/File;->isDirectory()Z

    move-result v3

    if-nez v3, :cond_2

    .line 174
    :cond_1
    invoke-virtual {v1}, Ljava/io/File;->mkdirs()Z

    move-result v3

    if-nez v3, :cond_2

    .line 176
    const-string v3, "Could not create the directory %s for saving the HTML file."

    new-array v4, v7, [Ljava/lang/Object;

    invoke-virtual {v1}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v5

    aput-object v5, v4, v6

    invoke-static {v3, v4}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Lcom/localytics/android/Localytics$Log;->w(Ljava/lang/String;)I

    .line 177
    const/4 v3, 0x0

    goto :goto_1

    .line 181
    :cond_2
    sget-object v3, Ljava/io/File;->separator:Ljava/lang/String;

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 182
    const-string v3, "index.html"

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_0
.end method

.method static getMarketingDataDirectory(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;
    .locals 2
    .param p0, "appContext"    # Landroid/content/Context;
    .param p1, "apiKey"    # Ljava/lang/String;

    .prologue
    .line 195
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 203
    .local v0, "builder":Ljava/lang/StringBuilder;
    invoke-virtual {p0}, Landroid/content/Context;->getFilesDir()Ljava/io/File;

    move-result-object v1

    invoke-virtual {v1}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 205
    sget-object v1, Ljava/io/File;->separator:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 206
    const-string v1, ".localytics"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 207
    sget-object v1, Ljava/io/File;->separator:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 208
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 210
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method static getRemoteFileURL(Lcom/localytics/android/MarketingMessage;)Ljava/lang/String;
    .locals 3
    .param p0, "marketingMessage"    # Lcom/localytics/android/MarketingMessage;

    .prologue
    .line 126
    const-string v2, "phone_location"

    invoke-static {p0, v2}, Lcom/localytics/android/JsonHelper;->getSafeStringFromMap(Ljava/util/Map;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 128
    .local v1, "url":Ljava/lang/String;
    const-string v2, "devices"

    invoke-static {p0, v2}, Lcom/localytics/android/JsonHelper;->getSafeStringFromMap(Ljava/util/Map;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 130
    .local v0, "devices":Ljava/lang/String;
    if-eqz v0, :cond_0

    .line 132
    const-string v2, "tablet"

    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 134
    const-string v2, "tablet_location"

    invoke-static {p0, v2}, Lcom/localytics/android/JsonHelper;->getSafeStringFromMap(Ljava/util/Map;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 142
    :cond_0
    :goto_0
    return-object v1

    .line 136
    :cond_1
    const-string v2, "both"

    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 138
    const-string v2, "phone_location"

    invoke-static {p0, v2}, Lcom/localytics/android/JsonHelper;->getSafeStringFromMap(Ljava/util/Map;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    goto :goto_0
.end method


# virtual methods
.method uploadData()I
    .locals 7

    .prologue
    const/4 v6, 0x1

    const/4 v5, 0x0

    .line 216
    invoke-virtual {p0}, Lcom/localytics/android/MarketingDownloader;->getApiKey()Ljava/lang/String;

    move-result-object v0

    .line 217
    .local v0, "apiKey":Ljava/lang/String;
    sget-object v2, Lcom/localytics/android/BaseUploadThread$UploadType;->MARKETING:Lcom/localytics/android/BaseUploadThread$UploadType;

    sget-boolean v1, Lcom/localytics/android/Constants;->USE_HTTPS:Z

    if-eqz v1, :cond_0

    const-string v1, "https://%s/api/v2/applications/%s/amp"

    :goto_0
    const/4 v3, 0x2

    new-array v3, v3, [Ljava/lang/Object;

    sget-object v4, Lcom/localytics/android/Constants;->MARKETING_HOST:Ljava/lang/String;

    aput-object v4, v3, v5

    aput-object v0, v3, v6

    invoke-static {v1, v3}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    const-string v3, ""

    invoke-virtual {p0, v2, v1, v3, v5}, Lcom/localytics/android/MarketingDownloader;->upload(Lcom/localytics/android/BaseUploadThread$UploadType;Ljava/lang/String;Ljava/lang/String;I)Z

    .line 218
    return v6

    .line 217
    :cond_0
    const-string v1, "http://%s/api/v2/applications/%s/amp"

    goto :goto_0
.end method
