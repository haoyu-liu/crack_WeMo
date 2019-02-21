.class public Lcom/belkin/utils/UploadFileUtil;
.super Ljava/lang/Object;
.source "UploadFileUtil.java"


# static fields
.field private static final TAG:Ljava/lang/String; = "UploadFile"


# instance fields
.field private ruleUtility:Lcom/belkin/utils/RuleUtility;


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 29
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static getByteArray(Landroid/graphics/Bitmap;)[B
    .locals 3
    .param p0, "mImage"    # Landroid/graphics/Bitmap;

    .prologue
    .line 225
    new-instance v0, Ljava/io/ByteArrayOutputStream;

    invoke-direct {v0}, Ljava/io/ByteArrayOutputStream;-><init>()V

    .line 226
    .local v0, "mystream":Ljava/io/ByteArrayOutputStream;
    if-eqz p0, :cond_0

    .line 227
    sget-object v1, Landroid/graphics/Bitmap$CompressFormat;->PNG:Landroid/graphics/Bitmap$CompressFormat;

    const/4 v2, 0x0

    invoke-virtual {p0, v1, v2, v0}, Landroid/graphics/Bitmap;->compress(Landroid/graphics/Bitmap$CompressFormat;ILjava/io/OutputStream;)Z

    .line 228
    invoke-virtual {v0}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    move-result-object v1

    .line 230
    :goto_0
    return-object v1

    :cond_0
    const/4 v1, 0x0

    goto :goto_0
.end method

.method public static readDBFromDevice(Ljava/lang/String;Ljava/lang/String;)V
    .locals 3
    .param p0, "dbPath"    # Ljava/lang/String;
    .param p1, "urlStr"    # Ljava/lang/String;

    .prologue
    .line 204
    if-eqz p0, :cond_0

    .line 206
    :try_start_0
    invoke-static {p1}, Lcom/belkin/utils/UploadFileUtil;->readFromURL(Ljava/lang/String;)[B

    move-result-object v0

    .line 207
    .local v0, "byteDataToSend":[B
    if-eqz v0, :cond_0

    array-length v2, v0

    if-lez v2, :cond_0

    .line 208
    invoke-static {p0, v0}, Lcom/belkin/utils/UploadFileUtil;->writeFile(Ljava/lang/String;[B)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 214
    .end local v0    # "byteDataToSend":[B
    :cond_0
    :goto_0
    return-void

    .line 210
    :catch_0
    move-exception v1

    .line 211
    .local v1, "excep":Ljava/lang/Exception;
    invoke-virtual {v1}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_0
.end method

.method public static readFile(Ljava/lang/String;)[B
    .locals 11
    .param p0, "filePath"    # Ljava/lang/String;

    .prologue
    .line 112
    const-string v8, "UploadFile"

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "readFile: file path is "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-static {v8, v9}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 113
    const/4 v4, 0x0

    .line 115
    .local v4, "fileData":[B
    :try_start_0
    new-instance v5, Ljava/io/File;

    invoke-direct {v5, p0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 116
    .local v5, "fileToRead":Ljava/io/File;
    invoke-virtual {v5}, Ljava/io/File;->exists()Z

    move-result v8

    if-eqz v8, :cond_1

    invoke-virtual {v5}, Ljava/io/File;->canRead()Z

    move-result v8

    if-eqz v8, :cond_1

    .line 117
    new-instance v6, Ljava/io/FileInputStream;

    invoke-direct {v6, v5}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V

    .line 119
    .local v6, "fisFileData":Ljava/io/FileInputStream;
    move-object v7, v6

    .line 120
    .local v7, "is":Ljava/io/InputStream;
    new-instance v1, Ljava/io/BufferedInputStream;

    invoke-direct {v1, v7}, Ljava/io/BufferedInputStream;-><init>(Ljava/io/InputStream;)V

    .line 121
    .local v1, "bis":Ljava/io/BufferedInputStream;
    new-instance v0, Lorg/apache/http/util/ByteArrayBuffer;

    const/16 v8, 0x32

    invoke-direct {v0, v8}, Lorg/apache/http/util/ByteArrayBuffer;-><init>(I)V

    .line 122
    .local v0, "baf":Lorg/apache/http/util/ByteArrayBuffer;
    const/4 v2, 0x0

    .line 123
    .local v2, "current":I
    :goto_0
    invoke-virtual {v1}, Ljava/io/BufferedInputStream;->read()I

    move-result v2

    const/4 v8, -0x1

    if-eq v2, v8, :cond_0

    .line 124
    int-to-byte v8, v2

    invoke-virtual {v0, v8}, Lorg/apache/http/util/ByteArrayBuffer;->append(I)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 131
    .end local v0    # "baf":Lorg/apache/http/util/ByteArrayBuffer;
    .end local v1    # "bis":Ljava/io/BufferedInputStream;
    .end local v2    # "current":I
    .end local v5    # "fileToRead":Ljava/io/File;
    .end local v6    # "fisFileData":Ljava/io/FileInputStream;
    .end local v7    # "is":Ljava/io/InputStream;
    :catch_0
    move-exception v3

    .line 132
    .local v3, "excep":Ljava/lang/Exception;
    const-string v8, "UploadFile"

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "Exception during readFile(): "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v3}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-static {v8, v9}, Lcom/belkin/utils/LogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 135
    .end local v3    # "excep":Ljava/lang/Exception;
    :goto_1
    return-object v4

    .line 126
    .restart local v0    # "baf":Lorg/apache/http/util/ByteArrayBuffer;
    .restart local v1    # "bis":Ljava/io/BufferedInputStream;
    .restart local v2    # "current":I
    .restart local v5    # "fileToRead":Ljava/io/File;
    .restart local v6    # "fisFileData":Ljava/io/FileInputStream;
    .restart local v7    # "is":Ljava/io/InputStream;
    :cond_0
    :try_start_1
    invoke-virtual {v1}, Ljava/io/BufferedInputStream;->close()V

    .line 127
    invoke-virtual {v0}, Lorg/apache/http/util/ByteArrayBuffer;->toByteArray()[B

    move-result-object v4

    .line 128
    goto :goto_1

    .line 129
    .end local v0    # "baf":Lorg/apache/http/util/ByteArrayBuffer;
    .end local v1    # "bis":Ljava/io/BufferedInputStream;
    .end local v2    # "current":I
    .end local v6    # "fisFileData":Ljava/io/FileInputStream;
    .end local v7    # "is":Ljava/io/InputStream;
    :cond_1
    const-string v8, "UploadFile"

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "readFile(): File at "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    const-string v10, " either does not exist or is not readable"

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-static {v8, v9}, Lcom/belkin/utils/LogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_1
.end method

.method public static readFromURL(Ljava/lang/String;)[B
    .locals 9
    .param p0, "urlStr"    # Ljava/lang/String;

    .prologue
    .line 51
    const/4 v4, 0x0

    .line 52
    .local v4, "dataToRead":[B
    if-eqz p0, :cond_0

    .line 54
    :try_start_0
    new-instance v7, Ljava/net/URL;

    invoke-direct {v7, p0}, Ljava/net/URL;-><init>(Ljava/lang/String;)V

    .line 55
    .local v7, "url":Ljava/net/URL;
    invoke-virtual {v7}, Ljava/net/URL;->openConnection()Ljava/net/URLConnection;

    move-result-object v2

    .line 57
    .local v2, "conn":Ljava/net/URLConnection;
    invoke-virtual {v2}, Ljava/net/URLConnection;->getInputStream()Ljava/io/InputStream;

    move-result-object v6

    .line 58
    .local v6, "is":Ljava/io/InputStream;
    new-instance v1, Ljava/io/BufferedInputStream;

    invoke-direct {v1, v6}, Ljava/io/BufferedInputStream;-><init>(Ljava/io/InputStream;)V

    .line 59
    .local v1, "bis":Ljava/io/BufferedInputStream;
    new-instance v0, Lorg/apache/http/util/ByteArrayBuffer;

    const/16 v8, 0x32

    invoke-direct {v0, v8}, Lorg/apache/http/util/ByteArrayBuffer;-><init>(I)V

    .line 60
    .local v0, "baf":Lorg/apache/http/util/ByteArrayBuffer;
    const/4 v3, 0x0

    .line 61
    .local v3, "current":I
    :goto_0
    invoke-virtual {v1}, Ljava/io/BufferedInputStream;->read()I

    move-result v3

    const/4 v8, -0x1

    if-eq v3, v8, :cond_1

    .line 62
    int-to-byte v8, v3

    invoke-virtual {v0, v8}, Lorg/apache/http/util/ByteArrayBuffer;->append(I)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 65
    .end local v0    # "baf":Lorg/apache/http/util/ByteArrayBuffer;
    .end local v1    # "bis":Ljava/io/BufferedInputStream;
    .end local v2    # "conn":Ljava/net/URLConnection;
    .end local v3    # "current":I
    .end local v6    # "is":Ljava/io/InputStream;
    .end local v7    # "url":Ljava/net/URL;
    :catch_0
    move-exception v5

    .line 66
    .local v5, "e":Ljava/lang/Exception;
    invoke-virtual {v5}, Ljava/lang/Exception;->printStackTrace()V

    .line 69
    .end local v5    # "e":Ljava/lang/Exception;
    :cond_0
    :goto_1
    return-object v4

    .line 64
    .restart local v0    # "baf":Lorg/apache/http/util/ByteArrayBuffer;
    .restart local v1    # "bis":Ljava/io/BufferedInputStream;
    .restart local v2    # "conn":Ljava/net/URLConnection;
    .restart local v3    # "current":I
    .restart local v6    # "is":Ljava/io/InputStream;
    .restart local v7    # "url":Ljava/net/URL;
    :cond_1
    :try_start_1
    invoke-virtual {v0}, Lorg/apache/http/util/ByteArrayBuffer;->toByteArray()[B
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    move-result-object v4

    goto :goto_1
.end method

.method public static uploadFileToDevice(Ljava/lang/String;[BI)V
    .locals 4
    .param p0, "urlStr"    # Ljava/lang/String;
    .param p1, "dataToUpload"    # [B
    .param p2, "timeout"    # I

    .prologue
    .line 39
    if-eqz p0, :cond_0

    .line 41
    :try_start_0
    new-instance v1, Ljava/net/URL;

    invoke-direct {v1, p0}, Ljava/net/URL;-><init>(Ljava/lang/String;)V

    .line 42
    .local v1, "url":Ljava/net/URL;
    invoke-static {v1, p1, p2}, Lcom/belkin/utils/UploadFileUtil;->writeDataToURL(Ljava/net/URL;[BI)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 48
    .end local v1    # "url":Ljava/net/URL;
    :cond_0
    :goto_0
    return-void

    .line 43
    :catch_0
    move-exception v0

    .line 44
    .local v0, "e":Ljava/lang/Exception;
    const-string v2, "4490"

    const-string v3, "Exception in uploadFileToDevice "

    invoke-static {v2, v3}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 45
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_0
.end method

.method public static writeDBToDevice(Ljava/lang/String;Ljava/lang/String;)V
    .locals 5
    .param p0, "dbPath"    # Ljava/lang/String;
    .param p1, "urlStr"    # Ljava/lang/String;

    .prologue
    .line 190
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

    invoke-static {v2, v3}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 191
    if-eqz p0, :cond_0

    .line 193
    :try_start_0
    invoke-static {p0}, Lcom/belkin/utils/UploadFileUtil;->readFile(Ljava/lang/String;)[B

    move-result-object v0

    .line 194
    .local v0, "byteDataToSend":[B
    if-eqz v0, :cond_0

    array-length v2, v0

    if-lez v2, :cond_0

    .line 195
    const v2, 0xea60

    invoke-static {p1, v0, v2}, Lcom/belkin/utils/UploadFileUtil;->uploadFileToDevice(Ljava/lang/String;[BI)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 201
    .end local v0    # "byteDataToSend":[B
    :cond_0
    :goto_0
    return-void

    .line 197
    :catch_0
    move-exception v1

    .line 198
    .local v1, "excep":Ljava/lang/Exception;
    invoke-virtual {v1}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_0
.end method

.method private static writeDataToURL(Ljava/net/URL;[BI)V
    .locals 11
    .param p0, "url"    # Ljava/net/URL;
    .param p1, "dataToUpload"    # [B
    .param p2, "timeout"    # I

    .prologue
    .line 73
    const/4 v7, 0x0

    .line 74
    .local v7, "os":Ljava/io/OutputStream;
    const/4 v0, 0x0

    .line 76
    .local v0, "buf":Ljava/io/BufferedOutputStream;
    :try_start_0
    invoke-virtual {p0}, Ljava/net/URL;->openConnection()Ljava/net/URLConnection;

    move-result-object v2

    check-cast v2, Ljava/net/HttpURLConnection;

    .line 78
    .local v2, "connection":Ljava/net/HttpURLConnection;
    const-string v8, "POST"

    invoke-virtual {v2, v8}, Ljava/net/HttpURLConnection;->setRequestMethod(Ljava/lang/String;)V

    .line 79
    const/4 v8, 0x0

    invoke-virtual {v2, v8}, Ljava/net/HttpURLConnection;->setChunkedStreamingMode(I)V

    .line 80
    const/4 v8, 0x1

    invoke-virtual {v2, v8}, Ljava/net/HttpURLConnection;->setDoOutput(Z)V

    .line 81
    invoke-virtual {v2, p2}, Ljava/net/HttpURLConnection;->setReadTimeout(I)V

    .line 82
    invoke-virtual {v2}, Ljava/net/HttpURLConnection;->getOutputStream()Ljava/io/OutputStream;

    move-result-object v7

    .line 83
    new-instance v1, Ljava/io/BufferedOutputStream;

    invoke-direct {v1, v7}, Ljava/io/BufferedOutputStream;-><init>(Ljava/io/OutputStream;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 84
    .end local v0    # "buf":Ljava/io/BufferedOutputStream;
    .local v1, "buf":Ljava/io/BufferedOutputStream;
    :try_start_1
    invoke-virtual {v1, p1}, Ljava/io/BufferedOutputStream;->write([B)V

    .line 85
    invoke-virtual {v1}, Ljava/io/BufferedOutputStream;->flush()V

    .line 87
    new-instance v6, Ljava/io/BufferedReader;

    new-instance v8, Ljava/io/InputStreamReader;

    invoke-virtual {v2}, Ljava/net/HttpURLConnection;->getInputStream()Ljava/io/InputStream;

    move-result-object v9

    invoke-direct {v8, v9}, Ljava/io/InputStreamReader;-><init>(Ljava/io/InputStream;)V

    invoke-direct {v6, v8}, Ljava/io/BufferedReader;-><init>(Ljava/io/Reader;)V

    .line 90
    .local v6, "in":Ljava/io/BufferedReader;
    const-string v4, ""

    .line 91
    .local v4, "decodedStringStr":Ljava/lang/String;
    :goto_0
    invoke-virtual {v6}, Ljava/io/BufferedReader;->readLine()Ljava/lang/String;

    move-result-object v3

    .local v3, "decodedString":Ljava/lang/String;
    if-eqz v3, :cond_0

    .line 93
    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v8, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, "\n"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    goto :goto_0

    .line 95
    :cond_0
    const-string v8, "UploadFile"

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "decodedStringStr: "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-static {v8, v9}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_4
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 100
    if-eqz v1, :cond_1

    .line 101
    :try_start_2
    invoke-virtual {v1}, Ljava/io/BufferedOutputStream;->close()V
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_0

    :cond_1
    move-object v0, v1

    .line 109
    .end local v1    # "buf":Ljava/io/BufferedOutputStream;
    .end local v2    # "connection":Ljava/net/HttpURLConnection;
    .end local v3    # "decodedString":Ljava/lang/String;
    .end local v4    # "decodedStringStr":Ljava/lang/String;
    .end local v6    # "in":Ljava/io/BufferedReader;
    .restart local v0    # "buf":Ljava/io/BufferedOutputStream;
    :cond_2
    :goto_1
    return-void

    .line 102
    .end local v0    # "buf":Ljava/io/BufferedOutputStream;
    .restart local v1    # "buf":Ljava/io/BufferedOutputStream;
    .restart local v2    # "connection":Ljava/net/HttpURLConnection;
    .restart local v3    # "decodedString":Ljava/lang/String;
    .restart local v4    # "decodedStringStr":Ljava/lang/String;
    .restart local v6    # "in":Ljava/io/BufferedReader;
    :catch_0
    move-exception v5

    .line 103
    .local v5, "e":Ljava/io/IOException;
    const-string v8, "UploadFile"

    const-string v9, "Error while closing the  op stream"

    invoke-static {v8, v9}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 104
    invoke-virtual {v5}, Ljava/io/IOException;->printStackTrace()V

    move-object v0, v1

    .line 107
    .end local v1    # "buf":Ljava/io/BufferedOutputStream;
    .restart local v0    # "buf":Ljava/io/BufferedOutputStream;
    goto :goto_1

    .line 96
    .end local v2    # "connection":Ljava/net/HttpURLConnection;
    .end local v3    # "decodedString":Ljava/lang/String;
    .end local v4    # "decodedStringStr":Ljava/lang/String;
    .end local v5    # "e":Ljava/io/IOException;
    .end local v6    # "in":Ljava/io/BufferedReader;
    :catch_1
    move-exception v5

    .line 97
    .local v5, "e":Ljava/lang/Exception;
    :goto_2
    :try_start_3
    invoke-virtual {v5}, Ljava/lang/Exception;->printStackTrace()V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 100
    if-eqz v0, :cond_2

    .line 101
    :try_start_4
    invoke-virtual {v0}, Ljava/io/BufferedOutputStream;->close()V
    :try_end_4
    .catch Ljava/io/IOException; {:try_start_4 .. :try_end_4} :catch_2

    goto :goto_1

    .line 102
    :catch_2
    move-exception v5

    .line 103
    .local v5, "e":Ljava/io/IOException;
    const-string v8, "UploadFile"

    const-string v9, "Error while closing the  op stream"

    invoke-static {v8, v9}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 104
    invoke-virtual {v5}, Ljava/io/IOException;->printStackTrace()V

    goto :goto_1

    .line 99
    .end local v5    # "e":Ljava/io/IOException;
    :catchall_0
    move-exception v8

    .line 100
    :goto_3
    if-eqz v0, :cond_3

    .line 101
    :try_start_5
    invoke-virtual {v0}, Ljava/io/BufferedOutputStream;->close()V
    :try_end_5
    .catch Ljava/io/IOException; {:try_start_5 .. :try_end_5} :catch_3

    .line 105
    :cond_3
    :goto_4
    throw v8

    .line 102
    :catch_3
    move-exception v5

    .line 103
    .restart local v5    # "e":Ljava/io/IOException;
    const-string v9, "UploadFile"

    const-string v10, "Error while closing the  op stream"

    invoke-static {v9, v10}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 104
    invoke-virtual {v5}, Ljava/io/IOException;->printStackTrace()V

    goto :goto_4

    .line 99
    .end local v0    # "buf":Ljava/io/BufferedOutputStream;
    .end local v5    # "e":Ljava/io/IOException;
    .restart local v1    # "buf":Ljava/io/BufferedOutputStream;
    .restart local v2    # "connection":Ljava/net/HttpURLConnection;
    :catchall_1
    move-exception v8

    move-object v0, v1

    .end local v1    # "buf":Ljava/io/BufferedOutputStream;
    .restart local v0    # "buf":Ljava/io/BufferedOutputStream;
    goto :goto_3

    .line 96
    .end local v0    # "buf":Ljava/io/BufferedOutputStream;
    .restart local v1    # "buf":Ljava/io/BufferedOutputStream;
    :catch_4
    move-exception v5

    move-object v0, v1

    .end local v1    # "buf":Ljava/io/BufferedOutputStream;
    .restart local v0    # "buf":Ljava/io/BufferedOutputStream;
    goto :goto_2
.end method

.method public static writeFile(Ljava/lang/String;[B)V
    .locals 4
    .param p0, "filePath"    # Ljava/lang/String;
    .param p1, "dataToWrite"    # [B

    .prologue
    .line 140
    :try_start_0
    new-instance v1, Ljava/io/File;

    invoke-direct {v1, p0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 141
    .local v1, "fileToRead":Ljava/io/File;
    invoke-virtual {v1}, Ljava/io/File;->canWrite()Z

    move-result v3

    if-eqz v3, :cond_0

    if-eqz p1, :cond_0

    .line 142
    new-instance v2, Ljava/io/BufferedOutputStream;

    new-instance v3, Ljava/io/FileOutputStream;

    invoke-direct {v3, v1}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V

    invoke-direct {v2, v3}, Ljava/io/BufferedOutputStream;-><init>(Ljava/io/OutputStream;)V

    .line 145
    .local v2, "out":Ljava/io/OutputStream;
    invoke-virtual {v2, p1}, Ljava/io/OutputStream;->write([B)V

    .line 146
    invoke-virtual {v2}, Ljava/io/OutputStream;->flush()V

    .line 147
    invoke-virtual {v2}, Ljava/io/OutputStream;->close()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 152
    .end local v1    # "fileToRead":Ljava/io/File;
    .end local v2    # "out":Ljava/io/OutputStream;
    :cond_0
    :goto_0
    return-void

    .line 149
    :catch_0
    move-exception v0

    .line 150
    .local v0, "excep":Ljava/lang/Exception;
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_0
.end method


# virtual methods
.method public getDBPath(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;
    .locals 2
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "strDbName"    # Ljava/lang/String;

    .prologue
    .line 34
    invoke-virtual {p1, p2}, Landroid/content/Context;->getDatabasePath(Ljava/lang/String;)Ljava/io/File;

    move-result-object v0

    .line 35
    .local v0, "dbFile":Ljava/io/File;
    invoke-virtual {v0}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method public writeFile([BLandroid/content/Context;)Ljava/lang/String;
    .locals 9
    .param p1, "dataToWrite"    # [B
    .param p2, "mContext"    # Landroid/content/Context;

    .prologue
    .line 156
    const-string v5, "MoreUtil"

    const-string v6, "Inside writeFile "

    invoke-static {v5, v6}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 157
    const-string v3, ""

    .line 159
    .local v3, "pragmaVersion":Ljava/lang/String;
    :try_start_0
    new-instance v5, Lcom/belkin/utils/RuleUtility;

    invoke-direct {v5, p2}, Lcom/belkin/utils/RuleUtility;-><init>(Landroid/content/Context;)V

    iput-object v5, p0, Lcom/belkin/utils/UploadFileUtil;->ruleUtility:Lcom/belkin/utils/RuleUtility;

    .line 160
    new-instance v4, Ljava/io/File;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v6, p0, Lcom/belkin/utils/UploadFileUtil;->ruleUtility:Lcom/belkin/utils/RuleUtility;

    invoke-static {}, Lcom/belkin/utils/RuleUtility;->getStoragePath()Ljava/io/File;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, "/databases/"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 161
    .local v4, "root":Ljava/io/File;
    invoke-virtual {v4}, Ljava/io/File;->exists()Z

    move-result v5

    if-nez v5, :cond_0

    .line 163
    invoke-virtual {v4}, Ljava/io/File;->mkdirs()Z

    .line 165
    :cond_0
    new-instance v1, Ljava/io/File;

    const-string v5, "cloudtemp.db"

    invoke-direct {v1, v4, v5}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 166
    .local v1, "fileToRead":Ljava/io/File;
    const-string v5, "MoreUtil"

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

    invoke-static {v5, v6}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 167
    const-string v5, "MoreUtil"

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "File data : "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 168
    const-string v5, "MoreUtil"

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

    invoke-static {v5, v6}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 170
    new-instance v2, Ljava/io/BufferedOutputStream;

    new-instance v5, Ljava/io/FileOutputStream;

    invoke-direct {v5, v1}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V

    invoke-direct {v2, v5}, Ljava/io/BufferedOutputStream;-><init>(Ljava/io/OutputStream;)V

    .line 171
    .local v2, "out":Ljava/io/OutputStream;
    invoke-virtual {v2, p1}, Ljava/io/OutputStream;->write([B)V

    .line 172
    invoke-virtual {v2}, Ljava/io/OutputStream;->flush()V

    .line 173
    invoke-virtual {v2}, Ljava/io/OutputStream;->close()V

    .line 174
    const-string v5, "MoreUtil"

    const-string v6, " Success "

    invoke-static {v5, v6}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 175
    iget-object v5, p0, Lcom/belkin/utils/UploadFileUtil;->ruleUtility:Lcom/belkin/utils/RuleUtility;

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v7, p0, Lcom/belkin/utils/UploadFileUtil;->ruleUtility:Lcom/belkin/utils/RuleUtility;

    invoke-static {}, Lcom/belkin/utils/RuleUtility;->getStoragePath()Ljava/io/File;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, "/databases/cloudtemp.db"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v8, p0, Lcom/belkin/utils/UploadFileUtil;->ruleUtility:Lcom/belkin/utils/RuleUtility;

    invoke-static {}, Lcom/belkin/utils/RuleUtility;->getLocalDBPath()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-static {}, Lcom/belkin/utils/RuleUtility;->getLocalDBName()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v5, v6, v7}, Lcom/belkin/utils/RuleUtility;->unzip(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v3

    .line 183
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

    .line 184
    return-object v3

    .line 180
    :catch_0
    move-exception v0

    .line 181
    .local v0, "excep":Ljava/lang/Exception;
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_0
.end method
