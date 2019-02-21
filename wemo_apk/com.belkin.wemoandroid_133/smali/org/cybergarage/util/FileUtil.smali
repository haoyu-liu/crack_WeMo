.class public final Lorg/cybergarage/util/FileUtil;
.super Ljava/lang/Object;
.source "FileUtil.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 22
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static final isXMLFileName(Ljava/lang/String;)Z
    .locals 2
    .param p0, "name"    # Ljava/lang/String;

    .prologue
    .line 73
    invoke-static {p0}, Lorg/cybergarage/util/StringUtil;->hasData(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_0

    .line 74
    const/4 v1, 0x0

    .line 76
    :goto_0
    return v1

    .line 75
    :cond_0
    invoke-virtual {p0}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v0

    .line 76
    .local v0, "lowerName":Ljava/lang/String;
    const-string v1, "xml"

    invoke-virtual {v0, v1}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v1

    goto :goto_0
.end method

.method public static final load(Ljava/io/File;)[B
    .locals 3
    .param p0, "file"    # Ljava/io/File;

    .prologue
    .line 39
    :try_start_0
    new-instance v1, Ljava/io/FileInputStream;

    invoke-direct {v1, p0}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V

    .line 40
    .local v1, "fin":Ljava/io/FileInputStream;
    invoke-static {v1}, Lorg/cybergarage/util/FileUtil;->load(Ljava/io/FileInputStream;)[B
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v2

    .line 44
    .end local v1    # "fin":Ljava/io/FileInputStream;
    :goto_0
    return-object v2

    .line 42
    :catch_0
    move-exception v0

    .line 43
    .local v0, "e":Ljava/lang/Exception;
    invoke-static {v0}, Lorg/cybergarage/util/Debug;->warning(Ljava/lang/Exception;)V

    .line 44
    const/4 v2, 0x0

    new-array v2, v2, [B

    goto :goto_0
.end method

.method public static final load(Ljava/io/FileInputStream;)[B
    .locals 6
    .param p0, "fin"    # Ljava/io/FileInputStream;

    .prologue
    const/4 v5, 0x0

    .line 50
    const/high16 v4, 0x80000

    new-array v2, v4, [B

    .line 53
    .local v2, "readBuf":[B
    :try_start_0
    new-instance v0, Ljava/io/ByteArrayOutputStream;

    invoke-direct {v0}, Ljava/io/ByteArrayOutputStream;-><init>()V

    .line 55
    .local v0, "bout":Ljava/io/ByteArrayOutputStream;
    invoke-virtual {p0, v2}, Ljava/io/FileInputStream;->read([B)I

    move-result v3

    .line 56
    .local v3, "readCnt":I
    :goto_0
    if-lez v3, :cond_0

    .line 57
    const/4 v4, 0x0

    invoke-virtual {v0, v2, v4, v3}, Ljava/io/ByteArrayOutputStream;->write([BII)V

    .line 58
    invoke-virtual {p0, v2}, Ljava/io/FileInputStream;->read([B)I

    move-result v3

    goto :goto_0

    .line 61
    :cond_0
    invoke-virtual {p0}, Ljava/io/FileInputStream;->close()V

    .line 63
    invoke-virtual {v0}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v4

    .line 67
    .end local v0    # "bout":Ljava/io/ByteArrayOutputStream;
    .end local v3    # "readCnt":I
    :goto_1
    return-object v4

    .line 65
    :catch_0
    move-exception v1

    .line 66
    .local v1, "e":Ljava/lang/Exception;
    invoke-static {v1}, Lorg/cybergarage/util/Debug;->warning(Ljava/lang/Exception;)V

    .line 67
    new-array v4, v5, [B

    goto :goto_1
.end method

.method public static final load(Ljava/lang/String;)[B
    .locals 3
    .param p0, "fileName"    # Ljava/lang/String;

    .prologue
    .line 27
    :try_start_0
    new-instance v1, Ljava/io/FileInputStream;

    invoke-direct {v1, p0}, Ljava/io/FileInputStream;-><init>(Ljava/lang/String;)V

    .line 28
    .local v1, "fin":Ljava/io/FileInputStream;
    invoke-static {v1}, Lorg/cybergarage/util/FileUtil;->load(Ljava/io/FileInputStream;)[B
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v2

    .line 32
    .end local v1    # "fin":Ljava/io/FileInputStream;
    :goto_0
    return-object v2

    .line 30
    :catch_0
    move-exception v0

    .line 31
    .local v0, "e":Ljava/lang/Exception;
    invoke-static {v0}, Lorg/cybergarage/util/Debug;->warning(Ljava/lang/Exception;)V

    .line 32
    const/4 v2, 0x0

    new-array v2, v2, [B

    goto :goto_0
.end method
