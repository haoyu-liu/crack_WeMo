.class public Lcom/belkin/wemo/rules/util/UploadFileUtil;
.super Ljava/lang/Object;
.source "UploadFileUtil.java"


# static fields
.field private static final TAG:Ljava/lang/String; = "UploadFile"


# instance fields
.field private ruleUtility:Lcom/belkin/wemo/rules/util/RuleUtility;


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 22
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static getFile(Ljava/lang/String;)Ljava/io/InputStream;
    .locals 7
    .param p0, "filePath"    # Ljava/lang/String;

    .prologue
    .line 118
    const/4 v5, 0x0

    .line 119
    .local v5, "is":Ljava/io/InputStream;
    const/4 v3, 0x0

    .line 121
    .local v3, "fisFileData":Ljava/io/FileInputStream;
    :try_start_0
    new-instance v2, Ljava/io/File;

    invoke-direct {v2, p0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 122
    .local v2, "fileToRead":Ljava/io/File;
    invoke-virtual {v2}, Ljava/io/File;->exists()Z

    move-result v6

    if-eqz v6, :cond_0

    invoke-virtual {v2}, Ljava/io/File;->canRead()Z

    move-result v6

    if-eqz v6, :cond_0

    .line 123
    new-instance v4, Ljava/io/FileInputStream;

    invoke-direct {v4, v2}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 125
    .end local v3    # "fisFileData":Ljava/io/FileInputStream;
    .local v4, "fisFileData":Ljava/io/FileInputStream;
    move-object v5, v4

    move-object v3, v4

    .line 135
    .end local v4    # "fisFileData":Ljava/io/FileInputStream;
    .restart local v3    # "fisFileData":Ljava/io/FileInputStream;
    :cond_0
    :try_start_1
    invoke-virtual {v5}, Ljava/io/InputStream;->close()V

    .line 136
    invoke-virtual {v3}, Ljava/io/FileInputStream;->close()V
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0

    .line 142
    .end local v2    # "fileToRead":Ljava/io/File;
    :goto_0
    return-object v5

    .line 137
    .restart local v2    # "fileToRead":Ljava/io/File;
    :catch_0
    move-exception v0

    .line 138
    .local v0, "e":Ljava/io/IOException;
    invoke-virtual {v0}, Ljava/io/IOException;->printStackTrace()V

    goto :goto_0

    .line 128
    .end local v0    # "e":Ljava/io/IOException;
    .end local v2    # "fileToRead":Ljava/io/File;
    :catch_1
    move-exception v1

    .line 129
    .local v1, "excep":Ljava/lang/Exception;
    :try_start_2
    invoke-virtual {v1}, Ljava/lang/Exception;->printStackTrace()V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 135
    :try_start_3
    invoke-virtual {v5}, Ljava/io/InputStream;->close()V

    .line 136
    invoke-virtual {v3}, Ljava/io/FileInputStream;->close()V
    :try_end_3
    .catch Ljava/io/IOException; {:try_start_3 .. :try_end_3} :catch_2

    goto :goto_0

    .line 137
    :catch_2
    move-exception v0

    .line 138
    .restart local v0    # "e":Ljava/io/IOException;
    invoke-virtual {v0}, Ljava/io/IOException;->printStackTrace()V

    goto :goto_0

    .line 134
    .end local v0    # "e":Ljava/io/IOException;
    .end local v1    # "excep":Ljava/lang/Exception;
    :catchall_0
    move-exception v6

    .line 135
    :try_start_4
    invoke-virtual {v5}, Ljava/io/InputStream;->close()V

    .line 136
    invoke-virtual {v3}, Ljava/io/FileInputStream;->close()V
    :try_end_4
    .catch Ljava/io/IOException; {:try_start_4 .. :try_end_4} :catch_3

    .line 139
    :goto_1
    throw v6

    .line 137
    :catch_3
    move-exception v0

    .line 138
    .restart local v0    # "e":Ljava/io/IOException;
    invoke-virtual {v0}, Ljava/io/IOException;->printStackTrace()V

    goto :goto_1
.end method

.method public static readFile(Ljava/lang/String;)[B
    .locals 11
    .param p0, "filePath"    # Ljava/lang/String;

    .prologue
    .line 79
    const/4 v6, 0x0

    .line 80
    .local v6, "fileData":[B
    const/4 v1, 0x0

    .line 82
    .local v1, "bis":Ljava/io/BufferedInputStream;
    :try_start_0
    new-instance v7, Ljava/io/File;

    invoke-direct {v7, p0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 83
    .local v7, "fileToRead":Ljava/io/File;
    invoke-virtual {v7}, Ljava/io/File;->exists()Z

    move-result v10

    if-eqz v10, :cond_1

    invoke-virtual {v7}, Ljava/io/File;->canRead()Z

    move-result v10

    if-eqz v10, :cond_1

    .line 84
    new-instance v8, Ljava/io/FileInputStream;

    invoke-direct {v8, v7}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V

    .line 86
    .local v8, "fisFileData":Ljava/io/FileInputStream;
    move-object v9, v8

    .line 87
    .local v9, "is":Ljava/io/InputStream;
    new-instance v2, Ljava/io/BufferedInputStream;

    invoke-direct {v2, v9}, Ljava/io/BufferedInputStream;-><init>(Ljava/io/InputStream;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_4
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 88
    .end local v1    # "bis":Ljava/io/BufferedInputStream;
    .local v2, "bis":Ljava/io/BufferedInputStream;
    :try_start_1
    new-instance v0, Lorg/apache/http/util/ByteArrayBuffer;

    const/16 v10, 0x32

    invoke-direct {v0, v10}, Lorg/apache/http/util/ByteArrayBuffer;-><init>(I)V

    .line 89
    .local v0, "baf":Lorg/apache/http/util/ByteArrayBuffer;
    const/4 v3, 0x0

    .line 90
    .local v3, "current":I
    :goto_0
    invoke-virtual {v2}, Ljava/io/BufferedInputStream;->read()I

    move-result v3

    const/4 v10, -0x1

    if-eq v3, v10, :cond_0

    .line 91
    int-to-byte v10, v3

    invoke-virtual {v0, v10}, Lorg/apache/http/util/ByteArrayBuffer;->append(I)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    goto :goto_0

    .line 95
    .end local v0    # "baf":Lorg/apache/http/util/ByteArrayBuffer;
    .end local v3    # "current":I
    :catch_0
    move-exception v5

    move-object v1, v2

    .line 96
    .end local v2    # "bis":Ljava/io/BufferedInputStream;
    .end local v7    # "fileToRead":Ljava/io/File;
    .end local v8    # "fisFileData":Ljava/io/FileInputStream;
    .end local v9    # "is":Ljava/io/InputStream;
    .restart local v1    # "bis":Ljava/io/BufferedInputStream;
    .local v5, "excep":Ljava/lang/Exception;
    :goto_1
    :try_start_2
    invoke-virtual {v5}, Ljava/lang/Exception;->printStackTrace()V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 101
    :try_start_3
    invoke-virtual {v1}, Ljava/io/BufferedInputStream;->close()V
    :try_end_3
    .catch Ljava/io/IOException; {:try_start_3 .. :try_end_3} :catch_2

    .line 107
    .end local v5    # "excep":Ljava/lang/Exception;
    :goto_2
    return-object v6

    .line 93
    .end local v1    # "bis":Ljava/io/BufferedInputStream;
    .restart local v0    # "baf":Lorg/apache/http/util/ByteArrayBuffer;
    .restart local v2    # "bis":Ljava/io/BufferedInputStream;
    .restart local v3    # "current":I
    .restart local v7    # "fileToRead":Ljava/io/File;
    .restart local v8    # "fisFileData":Ljava/io/FileInputStream;
    .restart local v9    # "is":Ljava/io/InputStream;
    :cond_0
    :try_start_4
    invoke-virtual {v0}, Lorg/apache/http/util/ByteArrayBuffer;->toByteArray()[B
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_0
    .catchall {:try_start_4 .. :try_end_4} :catchall_1

    move-result-object v6

    move-object v1, v2

    .line 101
    .end local v0    # "baf":Lorg/apache/http/util/ByteArrayBuffer;
    .end local v2    # "bis":Ljava/io/BufferedInputStream;
    .end local v3    # "current":I
    .end local v8    # "fisFileData":Ljava/io/FileInputStream;
    .end local v9    # "is":Ljava/io/InputStream;
    .restart local v1    # "bis":Ljava/io/BufferedInputStream;
    :cond_1
    :try_start_5
    invoke-virtual {v1}, Ljava/io/BufferedInputStream;->close()V
    :try_end_5
    .catch Ljava/io/IOException; {:try_start_5 .. :try_end_5} :catch_1

    goto :goto_2

    .line 102
    :catch_1
    move-exception v4

    .line 103
    .local v4, "e":Ljava/io/IOException;
    invoke-virtual {v4}, Ljava/io/IOException;->printStackTrace()V

    goto :goto_2

    .line 102
    .end local v4    # "e":Ljava/io/IOException;
    .end local v7    # "fileToRead":Ljava/io/File;
    .restart local v5    # "excep":Ljava/lang/Exception;
    :catch_2
    move-exception v4

    .line 103
    .restart local v4    # "e":Ljava/io/IOException;
    invoke-virtual {v4}, Ljava/io/IOException;->printStackTrace()V

    goto :goto_2

    .line 100
    .end local v4    # "e":Ljava/io/IOException;
    .end local v5    # "excep":Ljava/lang/Exception;
    :catchall_0
    move-exception v10

    .line 101
    :goto_3
    :try_start_6
    invoke-virtual {v1}, Ljava/io/BufferedInputStream;->close()V
    :try_end_6
    .catch Ljava/io/IOException; {:try_start_6 .. :try_end_6} :catch_3

    .line 104
    :goto_4
    throw v10

    .line 102
    :catch_3
    move-exception v4

    .line 103
    .restart local v4    # "e":Ljava/io/IOException;
    invoke-virtual {v4}, Ljava/io/IOException;->printStackTrace()V

    goto :goto_4

    .line 100
    .end local v1    # "bis":Ljava/io/BufferedInputStream;
    .end local v4    # "e":Ljava/io/IOException;
    .restart local v2    # "bis":Ljava/io/BufferedInputStream;
    .restart local v7    # "fileToRead":Ljava/io/File;
    .restart local v8    # "fisFileData":Ljava/io/FileInputStream;
    .restart local v9    # "is":Ljava/io/InputStream;
    :catchall_1
    move-exception v10

    move-object v1, v2

    .end local v2    # "bis":Ljava/io/BufferedInputStream;
    .restart local v1    # "bis":Ljava/io/BufferedInputStream;
    goto :goto_3

    .line 95
    .end local v7    # "fileToRead":Ljava/io/File;
    .end local v8    # "fisFileData":Ljava/io/FileInputStream;
    .end local v9    # "is":Ljava/io/InputStream;
    :catch_4
    move-exception v5

    goto :goto_1
.end method

.method public static writeDBToDevice(Ljava/lang/String;Ljava/lang/String;)V
    .locals 5
    .param p0, "dbPath"    # Ljava/lang/String;
    .param p1, "urlStr"    # Ljava/lang/String;

    .prologue
    .line 154
    const-string v2, "UploadFile"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "writeDBToDevice():: dbPath-->  urlStr--> "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 156
    if-eqz p0, :cond_0

    .line 158
    :try_start_0
    invoke-static {p0}, Lcom/belkin/wemo/rules/util/UploadFileUtil;->readFile(Ljava/lang/String;)[B

    move-result-object v0

    .line 159
    .local v0, "byteDataToSend":[B
    if-eqz v0, :cond_0

    array-length v2, v0

    if-lez v2, :cond_0

    .line 160
    new-instance v2, Ljava/net/URL;

    invoke-direct {v2, p1}, Ljava/net/URL;-><init>(Ljava/lang/String;)V

    invoke-static {v2, v0}, Lcom/belkin/wemo/rules/util/UploadFileUtil;->writeDataToURL(Ljava/net/URL;[B)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 166
    .end local v0    # "byteDataToSend":[B
    :cond_0
    :goto_0
    return-void

    .line 162
    :catch_0
    move-exception v1

    .line 163
    .local v1, "excep":Ljava/lang/Exception;
    invoke-virtual {v1}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_0
.end method

.method private static writeDataToURL(Ljava/net/URL;[B)V
    .locals 10
    .param p0, "url"    # Ljava/net/URL;
    .param p1, "dataToUpload"    # [B

    .prologue
    .line 36
    const/4 v6, 0x0

    .line 37
    .local v6, "os":Ljava/io/OutputStream;
    const/4 v0, 0x0

    .line 39
    .local v0, "buf":Ljava/io/BufferedOutputStream;
    :try_start_0
    invoke-virtual {p0}, Ljava/net/URL;->openConnection()Ljava/net/URLConnection;

    move-result-object v2

    check-cast v2, Ljava/net/HttpURLConnection;

    .line 41
    .local v2, "connection":Ljava/net/HttpURLConnection;
    const-string v7, "POST"

    invoke-virtual {v2, v7}, Ljava/net/HttpURLConnection;->setRequestMethod(Ljava/lang/String;)V

    .line 42
    const/4 v7, 0x0

    invoke-virtual {v2, v7}, Ljava/net/HttpURLConnection;->setChunkedStreamingMode(I)V

    .line 43
    const/4 v7, 0x1

    invoke-virtual {v2, v7}, Ljava/net/HttpURLConnection;->setDoOutput(Z)V

    .line 44
    invoke-virtual {v2}, Ljava/net/HttpURLConnection;->getOutputStream()Ljava/io/OutputStream;

    move-result-object v6

    .line 45
    new-instance v1, Ljava/io/BufferedOutputStream;

    invoke-direct {v1, v6}, Ljava/io/BufferedOutputStream;-><init>(Ljava/io/OutputStream;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_4
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 46
    .end local v0    # "buf":Ljava/io/BufferedOutputStream;
    .local v1, "buf":Ljava/io/BufferedOutputStream;
    :try_start_1
    invoke-virtual {v1, p1}, Ljava/io/BufferedOutputStream;->write([B)V

    .line 47
    invoke-virtual {v1}, Ljava/io/BufferedOutputStream;->flush()V

    .line 49
    new-instance v5, Ljava/io/BufferedReader;

    new-instance v7, Ljava/io/InputStreamReader;

    invoke-virtual {v2}, Ljava/net/HttpURLConnection;->getInputStream()Ljava/io/InputStream;

    move-result-object v8

    invoke-direct {v7, v8}, Ljava/io/InputStreamReader;-><init>(Ljava/io/InputStream;)V

    invoke-direct {v5, v7}, Ljava/io/BufferedReader;-><init>(Ljava/io/Reader;)V

    .line 53
    .local v5, "in":Ljava/io/BufferedReader;
    :goto_0
    invoke-virtual {v5}, Ljava/io/BufferedReader;->readLine()Ljava/lang/String;

    move-result-object v3

    .local v3, "decodedString":Ljava/lang/String;
    if-eqz v3, :cond_1

    .line 54
    const-string v7, "UploadFile"

    invoke-static {v7, v3}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    goto :goto_0

    .line 57
    .end local v3    # "decodedString":Ljava/lang/String;
    .end local v5    # "in":Ljava/io/BufferedReader;
    :catch_0
    move-exception v4

    move-object v0, v1

    .line 58
    .end local v1    # "buf":Ljava/io/BufferedOutputStream;
    .end local v2    # "connection":Ljava/net/HttpURLConnection;
    .restart local v0    # "buf":Ljava/io/BufferedOutputStream;
    .local v4, "e":Ljava/lang/Exception;
    :goto_1
    :try_start_2
    invoke-virtual {v4}, Ljava/lang/Exception;->printStackTrace()V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 61
    if-eqz v0, :cond_0

    .line 62
    :try_start_3
    invoke-virtual {v0}, Ljava/io/BufferedOutputStream;->close()V
    :try_end_3
    .catch Ljava/io/IOException; {:try_start_3 .. :try_end_3} :catch_2

    .line 70
    .end local v4    # "e":Ljava/lang/Exception;
    :cond_0
    :goto_2
    return-void

    .line 61
    .end local v0    # "buf":Ljava/io/BufferedOutputStream;
    .restart local v1    # "buf":Ljava/io/BufferedOutputStream;
    .restart local v2    # "connection":Ljava/net/HttpURLConnection;
    .restart local v3    # "decodedString":Ljava/lang/String;
    .restart local v5    # "in":Ljava/io/BufferedReader;
    :cond_1
    if-eqz v1, :cond_2

    .line 62
    :try_start_4
    invoke-virtual {v1}, Ljava/io/BufferedOutputStream;->close()V
    :try_end_4
    .catch Ljava/io/IOException; {:try_start_4 .. :try_end_4} :catch_1

    :cond_2
    move-object v0, v1

    .line 66
    .end local v1    # "buf":Ljava/io/BufferedOutputStream;
    .restart local v0    # "buf":Ljava/io/BufferedOutputStream;
    goto :goto_2

    .line 63
    .end local v0    # "buf":Ljava/io/BufferedOutputStream;
    .restart local v1    # "buf":Ljava/io/BufferedOutputStream;
    :catch_1
    move-exception v4

    .line 64
    .local v4, "e":Ljava/io/IOException;
    const-string v7, "UploadFile"

    const-string v8, "Error while closing the  op stream"

    invoke-static {v7, v8}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 65
    invoke-virtual {v4}, Ljava/io/IOException;->printStackTrace()V

    move-object v0, v1

    .line 68
    .end local v1    # "buf":Ljava/io/BufferedOutputStream;
    .restart local v0    # "buf":Ljava/io/BufferedOutputStream;
    goto :goto_2

    .line 63
    .end local v2    # "connection":Ljava/net/HttpURLConnection;
    .end local v3    # "decodedString":Ljava/lang/String;
    .end local v5    # "in":Ljava/io/BufferedReader;
    .local v4, "e":Ljava/lang/Exception;
    :catch_2
    move-exception v4

    .line 64
    .local v4, "e":Ljava/io/IOException;
    const-string v7, "UploadFile"

    const-string v8, "Error while closing the  op stream"

    invoke-static {v7, v8}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 65
    invoke-virtual {v4}, Ljava/io/IOException;->printStackTrace()V

    goto :goto_2

    .line 60
    .end local v4    # "e":Ljava/io/IOException;
    :catchall_0
    move-exception v7

    .line 61
    :goto_3
    if-eqz v0, :cond_3

    .line 62
    :try_start_5
    invoke-virtual {v0}, Ljava/io/BufferedOutputStream;->close()V
    :try_end_5
    .catch Ljava/io/IOException; {:try_start_5 .. :try_end_5} :catch_3

    .line 66
    :cond_3
    :goto_4
    throw v7

    .line 63
    :catch_3
    move-exception v4

    .line 64
    .restart local v4    # "e":Ljava/io/IOException;
    const-string v8, "UploadFile"

    const-string v9, "Error while closing the  op stream"

    invoke-static {v8, v9}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 65
    invoke-virtual {v4}, Ljava/io/IOException;->printStackTrace()V

    goto :goto_4

    .line 60
    .end local v0    # "buf":Ljava/io/BufferedOutputStream;
    .end local v4    # "e":Ljava/io/IOException;
    .restart local v1    # "buf":Ljava/io/BufferedOutputStream;
    .restart local v2    # "connection":Ljava/net/HttpURLConnection;
    :catchall_1
    move-exception v7

    move-object v0, v1

    .end local v1    # "buf":Ljava/io/BufferedOutputStream;
    .restart local v0    # "buf":Ljava/io/BufferedOutputStream;
    goto :goto_3

    .line 57
    .end local v2    # "connection":Ljava/net/HttpURLConnection;
    :catch_4
    move-exception v4

    goto :goto_1
.end method


# virtual methods
.method public writeFile([BLandroid/content/Context;)Ljava/lang/String;
    .locals 9
    .param p1, "dataToWrite"    # [B
    .param p2, "mContext"    # Landroid/content/Context;

    .prologue
    .line 176
    const-string v5, "UploadFile"

    const-string v6, "Inside writeFile "

    invoke-static {v5, v6}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 177
    const-string v3, ""

    .line 179
    .local v3, "pragmaVersion":Ljava/lang/String;
    :try_start_0
    new-instance v5, Lcom/belkin/wemo/rules/util/RuleUtility;

    invoke-direct {v5, p2}, Lcom/belkin/wemo/rules/util/RuleUtility;-><init>(Landroid/content/Context;)V

    iput-object v5, p0, Lcom/belkin/wemo/rules/util/UploadFileUtil;->ruleUtility:Lcom/belkin/wemo/rules/util/RuleUtility;

    .line 180
    new-instance v4, Ljava/io/File;

    iget-object v5, p0, Lcom/belkin/wemo/rules/util/UploadFileUtil;->ruleUtility:Lcom/belkin/wemo/rules/util/RuleUtility;

    invoke-virtual {v5}, Lcom/belkin/wemo/rules/util/RuleUtility;->getTempDBPath()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 181
    .local v4, "root":Ljava/io/File;
    invoke-virtual {v4}, Ljava/io/File;->exists()Z

    move-result v5

    if-nez v5, :cond_0

    .line 183
    invoke-virtual {v4}, Ljava/io/File;->mkdirs()Z

    .line 185
    :cond_0
    new-instance v1, Ljava/io/File;

    const-string v5, "cloudtemp.db"

    invoke-direct {v1, v4, v5}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 186
    .local v1, "fileToRead":Ljava/io/File;
    const-string v5, "UploadFile"

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "File Path : "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v1}, Ljava/io/File;->getPath()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 187
    const-string v5, "UploadFile"

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "File data : "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 188
    const-string v5, "UploadFile"

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "File data length: "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    array-length v7, p1

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 190
    new-instance v2, Ljava/io/BufferedOutputStream;

    new-instance v5, Ljava/io/FileOutputStream;

    invoke-direct {v5, v1}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V

    invoke-direct {v2, v5}, Ljava/io/BufferedOutputStream;-><init>(Ljava/io/OutputStream;)V

    .line 191
    .local v2, "out":Ljava/io/OutputStream;
    invoke-virtual {v2, p1}, Ljava/io/OutputStream;->write([B)V

    .line 192
    invoke-virtual {v2}, Ljava/io/OutputStream;->flush()V

    .line 193
    invoke-virtual {v2}, Ljava/io/OutputStream;->close()V

    .line 194
    const-string v5, "UploadFile"

    const-string v6, " Success "

    invoke-static {v5, v6}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 195
    iget-object v5, p0, Lcom/belkin/wemo/rules/util/UploadFileUtil;->ruleUtility:Lcom/belkin/wemo/rules/util/RuleUtility;

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v7, p0, Lcom/belkin/wemo/rules/util/UploadFileUtil;->ruleUtility:Lcom/belkin/wemo/rules/util/RuleUtility;

    invoke-virtual {v7}, Lcom/belkin/wemo/rules/util/RuleUtility;->getTempDBPath()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, "cloudtemp.db"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v8, p0, Lcom/belkin/wemo/rules/util/UploadFileUtil;->ruleUtility:Lcom/belkin/wemo/rules/util/RuleUtility;

    invoke-virtual {v8}, Lcom/belkin/wemo/rules/util/RuleUtility;->getTempDBPath()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, "/unzipped/"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v5, v6, v7}, Lcom/belkin/wemo/rules/util/RuleUtility;->unzip(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v3

    .line 200
    .end local v1    # "fileToRead":Ljava/io/File;
    .end local v2    # "out":Ljava/io/OutputStream;
    .end local v4    # "root":Ljava/io/File;
    :goto_0
    sget-object v5, Ljava/lang/System;->out:Ljava/io/PrintStream;

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, " pragma version = "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 201
    return-object v3

    .line 197
    :catch_0
    move-exception v0

    .line 198
    .local v0, "excep":Ljava/lang/Exception;
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_0
.end method
