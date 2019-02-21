.class public Lcom/belkin/wemo/utils/ZipUtility;
.super Ljava/lang/Object;
.source "ZipUtility.java"


# static fields
.field private static BUFFER:I

.field private static final TAG:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 25
    const/16 v0, 0x400

    sput v0, Lcom/belkin/wemo/utils/ZipUtility;->BUFFER:I

    .line 26
    const-class v0, Lcom/belkin/wemo/utils/ZipUtility;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/belkin/wemo/utils/ZipUtility;->TAG:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 23
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static unzip(Ljava/lang/String;Ljava/lang/String;)V
    .locals 10
    .param p0, "zipFileAbsolutePath"    # Ljava/lang/String;
    .param p1, "unZippedFileAbsolutePath"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v9, 0x0

    .line 35
    const/4 v6, 0x0

    .line 36
    .local v6, "is":Ljava/io/InputStream;
    const/4 v5, 0x0

    .line 37
    .local v5, "fos":Ljava/io/FileOutputStream;
    const/4 v2, 0x0

    .line 38
    .local v2, "dest":Ljava/io/BufferedOutputStream;
    const/4 v7, 0x0

    .line 39
    .local v7, "zipfile":Ljava/util/zip/ZipFile;
    new-instance v7, Ljava/util/zip/ZipFile;

    .end local v7    # "zipfile":Ljava/util/zip/ZipFile;
    invoke-direct {v7, p0}, Ljava/util/zip/ZipFile;-><init>(Ljava/lang/String;)V

    .line 40
    .restart local v7    # "zipfile":Ljava/util/zip/ZipFile;
    invoke-virtual {v7}, Ljava/util/zip/ZipFile;->entries()Ljava/util/Enumeration;

    move-result-object v3

    .line 42
    .local v3, "e":Ljava/util/Enumeration;, "Ljava/util/Enumeration<+Ljava/util/zip/ZipEntry;>;"
    :goto_0
    invoke-interface {v3}, Ljava/util/Enumeration;->hasMoreElements()Z

    move-result v8

    if-eqz v8, :cond_1

    .line 43
    invoke-interface {v3}, Ljava/util/Enumeration;->nextElement()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/util/zip/ZipEntry;

    .line 44
    .local v4, "entry":Ljava/util/zip/ZipEntry;
    new-instance v6, Ljava/io/BufferedInputStream;

    .end local v6    # "is":Ljava/io/InputStream;
    invoke-virtual {v7, v4}, Ljava/util/zip/ZipFile;->getInputStream(Ljava/util/zip/ZipEntry;)Ljava/io/InputStream;

    move-result-object v8

    invoke-direct {v6, v8}, Ljava/io/BufferedInputStream;-><init>(Ljava/io/InputStream;)V

    .line 45
    .restart local v6    # "is":Ljava/io/InputStream;
    sget v8, Lcom/belkin/wemo/utils/ZipUtility;->BUFFER:I

    new-array v1, v8, [B

    .line 46
    .local v1, "data":[B
    new-instance v5, Ljava/io/FileOutputStream;

    .end local v5    # "fos":Ljava/io/FileOutputStream;
    invoke-direct {v5, p1}, Ljava/io/FileOutputStream;-><init>(Ljava/lang/String;)V

    .line 48
    .restart local v5    # "fos":Ljava/io/FileOutputStream;
    new-instance v2, Ljava/io/BufferedOutputStream;

    .end local v2    # "dest":Ljava/io/BufferedOutputStream;
    sget v8, Lcom/belkin/wemo/utils/ZipUtility;->BUFFER:I

    invoke-direct {v2, v5, v8}, Ljava/io/BufferedOutputStream;-><init>(Ljava/io/OutputStream;I)V

    .line 50
    .restart local v2    # "dest":Ljava/io/BufferedOutputStream;
    :goto_1
    sget v8, Lcom/belkin/wemo/utils/ZipUtility;->BUFFER:I

    invoke-virtual {v6, v1, v9, v8}, Ljava/io/InputStream;->read([BII)I

    move-result v0

    .local v0, "count":I
    const/4 v8, -0x1

    if-eq v0, v8, :cond_0

    .line 51
    invoke-virtual {v2, v1, v9, v0}, Ljava/io/BufferedOutputStream;->write([BII)V

    goto :goto_1

    .line 53
    :cond_0
    invoke-virtual {v2}, Ljava/io/BufferedOutputStream;->flush()V

    goto :goto_0

    .line 56
    .end local v0    # "count":I
    .end local v1    # "data":[B
    .end local v4    # "entry":Ljava/util/zip/ZipEntry;
    :cond_1
    invoke-virtual {v7}, Ljava/util/zip/ZipFile;->close()V

    .line 57
    invoke-virtual {v2}, Ljava/io/BufferedOutputStream;->close()V

    .line 58
    invoke-virtual {v5}, Ljava/io/FileOutputStream;->close()V

    .line 59
    invoke-virtual {v6}, Ljava/io/InputStream;->close()V

    .line 60
    return-void
.end method

.method public static zip(Ljava/lang/String;Ljava/lang/String;)V
    .locals 9
    .param p0, "sourceFileAbsolutePath"    # Ljava/lang/String;
    .param p1, "zipFileAbsolutePath"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v8, 0x0

    .line 86
    const/4 v1, 0x0

    .line 87
    .local v1, "dest":Ljava/io/FileOutputStream;
    const/4 v5, 0x0

    .line 88
    .local v5, "out":Ljava/util/zip/ZipOutputStream;
    new-instance v1, Ljava/io/FileOutputStream;

    .end local v1    # "dest":Ljava/io/FileOutputStream;
    invoke-direct {v1, p1}, Ljava/io/FileOutputStream;-><init>(Ljava/lang/String;)V

    .line 89
    .restart local v1    # "dest":Ljava/io/FileOutputStream;
    new-instance v5, Ljava/util/zip/ZipOutputStream;

    .end local v5    # "out":Ljava/util/zip/ZipOutputStream;
    new-instance v7, Ljava/io/BufferedOutputStream;

    invoke-direct {v7, v1}, Ljava/io/BufferedOutputStream;-><init>(Ljava/io/OutputStream;)V

    invoke-direct {v5, v7}, Ljava/util/zip/ZipOutputStream;-><init>(Ljava/io/OutputStream;)V

    .line 91
    .restart local v5    # "out":Ljava/util/zip/ZipOutputStream;
    new-instance v4, Ljava/io/FileOutputStream;

    invoke-direct {v4, p1}, Ljava/io/FileOutputStream;-><init>(Ljava/lang/String;)V

    .line 92
    .local v4, "os":Ljava/io/FileOutputStream;
    new-instance v6, Ljava/util/zip/GZIPOutputStream;

    invoke-direct {v6, v4}, Ljava/util/zip/GZIPOutputStream;-><init>(Ljava/io/OutputStream;)V

    .line 93
    .local v6, "zipout":Ljava/util/zip/GZIPOutputStream;
    sget v7, Lcom/belkin/wemo/utils/ZipUtility;->BUFFER:I

    new-array v0, v7, [B

    .line 95
    .local v0, "buffer":[B
    new-instance v2, Ljava/io/FileInputStream;

    invoke-direct {v2, p0}, Ljava/io/FileInputStream;-><init>(Ljava/lang/String;)V

    .line 97
    .local v2, "in":Ljava/io/FileInputStream;
    :goto_0
    sget v7, Lcom/belkin/wemo/utils/ZipUtility;->BUFFER:I

    invoke-virtual {v2, v0, v8, v7}, Ljava/io/FileInputStream;->read([BII)I

    move-result v3

    .local v3, "length":I
    const/4 v7, -0x1

    if-eq v3, v7, :cond_0

    .line 98
    invoke-virtual {v6, v0, v8, v3}, Ljava/util/zip/GZIPOutputStream;->write([BII)V

    goto :goto_0

    .line 101
    :cond_0
    invoke-virtual {v2}, Ljava/io/FileInputStream;->close()V

    .line 102
    invoke-virtual {v6}, Ljava/util/zip/GZIPOutputStream;->close()V

    .line 103
    invoke-virtual {v5}, Ljava/util/zip/ZipOutputStream;->close()V

    .line 104
    invoke-virtual {v1}, Ljava/io/FileOutputStream;->close()V

    .line 105
    return-void
.end method

.method public static zip([Ljava/lang/String;Ljava/lang/String;)V
    .locals 6
    .param p0, "zipFiles"    # [Ljava/lang/String;
    .param p1, "zipLocation"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lnet/lingala/zip4j/exception/ZipException;
        }
    .end annotation

    .prologue
    .line 63
    sget-object v3, Lcom/belkin/wemo/utils/ZipUtility;->TAG:Ljava/lang/String;

    const-string v4, "inside zip"

    invoke-static {v3, v4}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 64
    sget-object v3, Lcom/belkin/wemo/utils/ZipUtility;->TAG:Ljava/lang/String;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, " zipLocation : "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 66
    new-instance v3, Ljava/io/File;

    invoke-direct {v3, p1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3}, Ljava/io/File;->delete()Z

    move-result v1

    .line 67
    .local v1, "status":Z
    sget-object v3, Lcom/belkin/wemo/utils/ZipUtility;->TAG:Ljava/lang/String;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, " Deleting Preview/old file at "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, "; STATUS = "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 69
    new-instance v2, Lnet/lingala/zip4j/core/ZipFile;

    invoke-direct {v2, p1}, Lnet/lingala/zip4j/core/ZipFile;-><init>(Ljava/lang/String;)V

    .line 70
    .local v2, "zipFile":Lnet/lingala/zip4j/core/ZipFile;
    new-instance v0, Lnet/lingala/zip4j/model/ZipParameters;

    invoke-direct {v0}, Lnet/lingala/zip4j/model/ZipParameters;-><init>()V

    .line 71
    .local v0, "parameters":Lnet/lingala/zip4j/model/ZipParameters;
    const/16 v3, 0x8

    invoke-virtual {v0, v3}, Lnet/lingala/zip4j/model/ZipParameters;->setCompressionMethod(I)V

    .line 72
    const/4 v3, 0x5

    invoke-virtual {v0, v3}, Lnet/lingala/zip4j/model/ZipParameters;->setCompressionLevel(I)V

    .line 73
    new-instance v3, Ljava/io/File;

    const/4 v4, 0x0

    aget-object v4, p0, v4

    invoke-direct {v3, v4}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, v3, v0}, Lnet/lingala/zip4j/core/ZipFile;->addFile(Ljava/io/File;Lnet/lingala/zip4j/model/ZipParameters;)V

    .line 74
    return-void
.end method
