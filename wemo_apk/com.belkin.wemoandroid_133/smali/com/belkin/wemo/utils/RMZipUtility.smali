.class public Lcom/belkin/wemo/utils/RMZipUtility;
.super Ljava/lang/Object;
.source "RMZipUtility.java"


# static fields
.field private static BUFFER:I

.field private static final TAG:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 20
    const/16 v0, 0x400

    sput v0, Lcom/belkin/wemo/utils/RMZipUtility;->BUFFER:I

    .line 21
    const-class v0, Lcom/belkin/wemo/utils/RMZipUtility;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/belkin/wemo/utils/RMZipUtility;->TAG:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 18
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static unzip(Ljava/lang/String;Ljava/lang/String;)V
    .locals 12
    .param p0, "zipFileAbsolutePath"    # Ljava/lang/String;
    .param p1, "unZippedFileAbsolutePath"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v11, 0x0

    .line 30
    sget-object v8, Lcom/belkin/wemo/utils/RMZipUtility;->TAG:Ljava/lang/String;

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "Extracting file. \nFROM: "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    const-string v10, "\nTO: "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-static {v8, v9}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->debugLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 32
    const/4 v6, 0x0

    .line 33
    .local v6, "is":Ljava/io/InputStream;
    const/4 v5, 0x0

    .line 34
    .local v5, "fos":Ljava/io/FileOutputStream;
    const/4 v2, 0x0

    .line 35
    .local v2, "dest":Ljava/io/BufferedOutputStream;
    const/4 v7, 0x0

    .line 36
    .local v7, "zipfile":Ljava/util/zip/ZipFile;
    new-instance v7, Ljava/util/zip/ZipFile;

    .end local v7    # "zipfile":Ljava/util/zip/ZipFile;
    invoke-direct {v7, p0}, Ljava/util/zip/ZipFile;-><init>(Ljava/lang/String;)V

    .line 37
    .restart local v7    # "zipfile":Ljava/util/zip/ZipFile;
    invoke-virtual {v7}, Ljava/util/zip/ZipFile;->entries()Ljava/util/Enumeration;

    move-result-object v3

    .line 39
    .local v3, "e":Ljava/util/Enumeration;, "Ljava/util/Enumeration<+Ljava/util/zip/ZipEntry;>;"
    :goto_0
    invoke-interface {v3}, Ljava/util/Enumeration;->hasMoreElements()Z

    move-result v8

    if-eqz v8, :cond_1

    .line 40
    invoke-interface {v3}, Ljava/util/Enumeration;->nextElement()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/util/zip/ZipEntry;

    .line 41
    .local v4, "entry":Ljava/util/zip/ZipEntry;
    new-instance v6, Ljava/io/BufferedInputStream;

    .end local v6    # "is":Ljava/io/InputStream;
    invoke-virtual {v7, v4}, Ljava/util/zip/ZipFile;->getInputStream(Ljava/util/zip/ZipEntry;)Ljava/io/InputStream;

    move-result-object v8

    invoke-direct {v6, v8}, Ljava/io/BufferedInputStream;-><init>(Ljava/io/InputStream;)V

    .line 42
    .restart local v6    # "is":Ljava/io/InputStream;
    sget v8, Lcom/belkin/wemo/utils/RMZipUtility;->BUFFER:I

    new-array v1, v8, [B

    .line 43
    .local v1, "data":[B
    new-instance v5, Ljava/io/FileOutputStream;

    .end local v5    # "fos":Ljava/io/FileOutputStream;
    invoke-direct {v5, p1}, Ljava/io/FileOutputStream;-><init>(Ljava/lang/String;)V

    .line 45
    .restart local v5    # "fos":Ljava/io/FileOutputStream;
    new-instance v2, Ljava/io/BufferedOutputStream;

    .end local v2    # "dest":Ljava/io/BufferedOutputStream;
    sget v8, Lcom/belkin/wemo/utils/RMZipUtility;->BUFFER:I

    invoke-direct {v2, v5, v8}, Ljava/io/BufferedOutputStream;-><init>(Ljava/io/OutputStream;I)V

    .line 47
    .restart local v2    # "dest":Ljava/io/BufferedOutputStream;
    :goto_1
    sget v8, Lcom/belkin/wemo/utils/RMZipUtility;->BUFFER:I

    invoke-virtual {v6, v1, v11, v8}, Ljava/io/InputStream;->read([BII)I

    move-result v0

    .local v0, "count":I
    const/4 v8, -0x1

    if-eq v0, v8, :cond_0

    .line 48
    invoke-virtual {v2, v1, v11, v0}, Ljava/io/BufferedOutputStream;->write([BII)V

    goto :goto_1

    .line 50
    :cond_0
    invoke-virtual {v2}, Ljava/io/BufferedOutputStream;->flush()V

    goto :goto_0

    .line 53
    .end local v0    # "count":I
    .end local v1    # "data":[B
    .end local v4    # "entry":Ljava/util/zip/ZipEntry;
    :cond_1
    invoke-virtual {v7}, Ljava/util/zip/ZipFile;->close()V

    .line 54
    invoke-virtual {v2}, Ljava/io/BufferedOutputStream;->close()V

    .line 55
    invoke-virtual {v5}, Ljava/io/FileOutputStream;->close()V

    .line 56
    invoke-virtual {v6}, Ljava/io/InputStream;->close()V

    .line 57
    return-void
.end method

.method public static zip(Ljava/lang/String;Ljava/lang/String;)V
    .locals 8
    .param p0, "sourceFileAbsolutePath"    # Ljava/lang/String;
    .param p1, "zipFileAbsolutePath"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v7, 0x0

    .line 94
    const/4 v1, 0x0

    .line 95
    .local v1, "dest":Ljava/io/FileOutputStream;
    new-instance v1, Ljava/io/FileOutputStream;

    .end local v1    # "dest":Ljava/io/FileOutputStream;
    invoke-direct {v1, p1}, Ljava/io/FileOutputStream;-><init>(Ljava/lang/String;)V

    .line 97
    .restart local v1    # "dest":Ljava/io/FileOutputStream;
    new-instance v4, Ljava/io/FileOutputStream;

    invoke-direct {v4, p1}, Ljava/io/FileOutputStream;-><init>(Ljava/lang/String;)V

    .line 98
    .local v4, "os":Ljava/io/FileOutputStream;
    new-instance v5, Ljava/util/zip/GZIPOutputStream;

    invoke-direct {v5, v4}, Ljava/util/zip/GZIPOutputStream;-><init>(Ljava/io/OutputStream;)V

    .line 99
    .local v5, "zipout":Ljava/util/zip/GZIPOutputStream;
    sget v6, Lcom/belkin/wemo/utils/RMZipUtility;->BUFFER:I

    new-array v0, v6, [B

    .line 101
    .local v0, "buffer":[B
    new-instance v2, Ljava/io/FileInputStream;

    invoke-direct {v2, p0}, Ljava/io/FileInputStream;-><init>(Ljava/lang/String;)V

    .line 103
    .local v2, "in":Ljava/io/FileInputStream;
    :goto_0
    sget v6, Lcom/belkin/wemo/utils/RMZipUtility;->BUFFER:I

    invoke-virtual {v2, v0, v7, v6}, Ljava/io/FileInputStream;->read([BII)I

    move-result v3

    .local v3, "length":I
    const/4 v6, -0x1

    if-eq v3, v6, :cond_0

    .line 104
    invoke-virtual {v5, v0, v7, v3}, Ljava/util/zip/GZIPOutputStream;->write([BII)V

    goto :goto_0

    .line 107
    :cond_0
    invoke-virtual {v2}, Ljava/io/FileInputStream;->close()V

    .line 108
    invoke-virtual {v5}, Ljava/util/zip/GZIPOutputStream;->close()V

    .line 109
    invoke-virtual {v1}, Ljava/io/FileOutputStream;->close()V

    .line 110
    return-void
.end method

.method public static zip([Ljava/lang/String;Ljava/lang/String;)V
    .locals 12
    .param p0, "zipFiles"    # [Ljava/lang/String;
    .param p1, "zipLocation"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v11, 0x0

    .line 60
    new-instance v8, Ljava/io/File;

    invoke-direct {v8, p1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v8}, Ljava/io/File;->delete()Z

    move-result v4

    .line 61
    .local v4, "status":Z
    sget-object v8, Lcom/belkin/wemo/utils/RMZipUtility;->TAG:Ljava/lang/String;

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, " Deleting Preview/old file at "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    const-string v10, "; STATUS = "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, v4}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-static {v8, v9}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 64
    new-instance v1, Ljava/io/FileOutputStream;

    invoke-direct {v1, p1}, Ljava/io/FileOutputStream;-><init>(Ljava/lang/String;)V

    .line 65
    .local v1, "fos":Ljava/io/FileOutputStream;
    new-instance v7, Ljava/util/zip/ZipOutputStream;

    invoke-direct {v7, v1}, Ljava/util/zip/ZipOutputStream;-><init>(Ljava/io/OutputStream;)V

    .line 66
    .local v7, "zos":Ljava/util/zip/ZipOutputStream;
    new-instance v8, Ljava/io/File;

    aget-object v9, p0, v11

    invoke-direct {v8, v9}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v8}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v6

    .line 67
    .local v6, "zipFileName":Ljava/lang/String;
    new-instance v5, Ljava/util/zip/ZipEntry;

    const-string v8, "temppluginRules.db"

    invoke-direct {v5, v8}, Ljava/util/zip/ZipEntry;-><init>(Ljava/lang/String;)V

    .line 68
    .local v5, "ze":Ljava/util/zip/ZipEntry;
    sget-object v8, Lcom/belkin/wemo/utils/RMZipUtility;->TAG:Ljava/lang/String;

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, " File name in zip entry: "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-static {v8, v9}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 69
    invoke-virtual {v7, v5}, Ljava/util/zip/ZipOutputStream;->putNextEntry(Ljava/util/zip/ZipEntry;)V

    .line 70
    new-instance v2, Ljava/io/FileInputStream;

    aget-object v8, p0, v11

    invoke-direct {v2, v8}, Ljava/io/FileInputStream;-><init>(Ljava/lang/String;)V

    .line 72
    .local v2, "in":Ljava/io/FileInputStream;
    const/4 v3, 0x0

    .line 73
    .local v3, "length":I
    const/16 v8, 0x400

    new-array v0, v8, [B

    .line 75
    .local v0, "buffer":[B
    :goto_0
    invoke-virtual {v2, v0}, Ljava/io/FileInputStream;->read([B)I

    move-result v3

    if-lez v3, :cond_0

    .line 76
    invoke-virtual {v7, v0, v11, v3}, Ljava/util/zip/ZipOutputStream;->write([BII)V

    goto :goto_0

    .line 79
    :cond_0
    invoke-virtual {v2}, Ljava/io/FileInputStream;->close()V

    .line 80
    invoke-virtual {v7}, Ljava/util/zip/ZipOutputStream;->closeEntry()V

    .line 81
    invoke-virtual {v7}, Ljava/util/zip/ZipOutputStream;->close()V

    .line 82
    return-void
.end method
