.class public Lcom/belkin/rules/utils/RuleUtility;
.super Ljava/lang/Object;
.source "RuleUtility.java"


# static fields
.field private static BUFFER:I

.field private static final TAG:Ljava/lang/String;


# instance fields
.field private context:Landroid/content/Context;

.field private dbPath:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 72
    const/16 v0, 0x400

    sput v0, Lcom/belkin/rules/utils/RuleUtility;->BUFFER:I

    .line 74
    const-class v0, Lcom/belkin/rules/utils/RuleUtility;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/belkin/rules/utils/RuleUtility;->TAG:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .locals 0
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 77
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 78
    iput-object p1, p0, Lcom/belkin/rules/utils/RuleUtility;->context:Landroid/content/Context;

    .line 81
    return-void
.end method

.method public static download(Ljava/io/InputStream;Ljava/io/OutputStream;)V
    .locals 0
    .param p0, "is"    # Ljava/io/InputStream;
    .param p1, "outputStream"    # Ljava/io/OutputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 251
    invoke-static {p0, p1}, Lorg/apache/commons/io/IOUtils;->copy(Ljava/io/InputStream;Ljava/io/OutputStream;)I

    .line 252
    invoke-virtual {p0}, Ljava/io/InputStream;->close()V

    .line 253
    invoke-virtual {p1}, Ljava/io/OutputStream;->close()V

    .line 254
    return-void
.end method

.method public static downloadFromUrl([BLjava/lang/String;Landroid/content/Context;)V
    .locals 5
    .param p0, "fileByteArray"    # [B
    .param p1, "toFilenameWithPath"    # Ljava/lang/String;
    .param p2, "context2"    # Landroid/content/Context;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 202
    const-string v3, "rulesDBZippedTemp"

    const/4 v4, 0x0

    invoke-virtual {p2, v3, v4}, Landroid/content/Context;->openFileOutput(Ljava/lang/String;I)Ljava/io/FileOutputStream;

    move-result-object v1

    .line 204
    .local v1, "outputStream":Ljava/io/FileOutputStream;
    new-instance v0, Ljava/io/ByteArrayInputStream;

    invoke-direct {v0, p0}, Ljava/io/ByteArrayInputStream;-><init>([B)V

    .line 207
    .local v0, "is":Ljava/io/ByteArrayInputStream;
    invoke-static {v0, v1}, Lcom/belkin/rules/utils/RuleUtility;->download(Ljava/io/InputStream;Ljava/io/OutputStream;)V

    .line 210
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p2}, Landroid/content/Context;->getFilesDir()Ljava/io/File;

    move-result-object v4

    invoke-virtual {v4}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    sget-object v4, Ljava/io/File;->separator:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "rulesDBZippedTemp"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    .line 212
    .local v2, "tempZIPDBLocation":Ljava/lang/String;
    invoke-static {v2, p1}, Lcom/belkin/rules/utils/RuleUtility;->unzip(Ljava/lang/String;Ljava/lang/String;)V

    .line 213
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
    .line 217
    :try_start_0
    sget-object v9, Lcom/belkin/rules/utils/RuleUtility;->TAG:Ljava/lang/String;

    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    const-string v11, "Extracting file. \nFROM: "

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    const-string v11, "\nTO: "

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-static {v9, v10}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->debugLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 219
    const/4 v7, 0x0

    .line 220
    .local v7, "is":Ljava/io/InputStream;
    const/4 v6, 0x0

    .line 221
    .local v6, "fos":Ljava/io/FileOutputStream;
    const/4 v2, 0x0

    .line 222
    .local v2, "dest":Ljava/io/BufferedOutputStream;
    const/4 v8, 0x0

    .line 223
    .local v8, "zipfile":Ljava/util/zip/ZipFile;
    new-instance v8, Ljava/util/zip/ZipFile;

    .end local v8    # "zipfile":Ljava/util/zip/ZipFile;
    invoke-direct {v8, p0}, Ljava/util/zip/ZipFile;-><init>(Ljava/lang/String;)V

    .line 224
    .restart local v8    # "zipfile":Ljava/util/zip/ZipFile;
    invoke-virtual {v8}, Ljava/util/zip/ZipFile;->entries()Ljava/util/Enumeration;

    move-result-object v4

    .line 226
    .local v4, "e":Ljava/util/Enumeration;, "Ljava/util/Enumeration<+Ljava/util/zip/ZipEntry;>;"
    :goto_0
    invoke-interface {v4}, Ljava/util/Enumeration;->hasMoreElements()Z

    move-result v9

    if-eqz v9, :cond_1

    .line 227
    invoke-interface {v4}, Ljava/util/Enumeration;->nextElement()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/util/zip/ZipEntry;

    .line 228
    .local v5, "entry":Ljava/util/zip/ZipEntry;
    new-instance v7, Ljava/io/BufferedInputStream;

    .end local v7    # "is":Ljava/io/InputStream;
    invoke-virtual {v8, v5}, Ljava/util/zip/ZipFile;->getInputStream(Ljava/util/zip/ZipEntry;)Ljava/io/InputStream;

    move-result-object v9

    invoke-direct {v7, v9}, Ljava/io/BufferedInputStream;-><init>(Ljava/io/InputStream;)V

    .line 229
    .restart local v7    # "is":Ljava/io/InputStream;
    sget v9, Lcom/belkin/rules/utils/RuleUtility;->BUFFER:I

    new-array v1, v9, [B

    .line 230
    .local v1, "data":[B
    new-instance v6, Ljava/io/FileOutputStream;

    .end local v6    # "fos":Ljava/io/FileOutputStream;
    invoke-direct {v6, p1}, Ljava/io/FileOutputStream;-><init>(Ljava/lang/String;)V

    .line 232
    .restart local v6    # "fos":Ljava/io/FileOutputStream;
    new-instance v2, Ljava/io/BufferedOutputStream;

    .end local v2    # "dest":Ljava/io/BufferedOutputStream;
    sget v9, Lcom/belkin/rules/utils/RuleUtility;->BUFFER:I

    invoke-direct {v2, v6, v9}, Ljava/io/BufferedOutputStream;-><init>(Ljava/io/OutputStream;I)V

    .line 234
    .restart local v2    # "dest":Ljava/io/BufferedOutputStream;
    :goto_1
    const/4 v9, 0x0

    sget v10, Lcom/belkin/rules/utils/RuleUtility;->BUFFER:I

    invoke-virtual {v7, v1, v9, v10}, Ljava/io/InputStream;->read([BII)I

    move-result v0

    .local v0, "count":I
    const/4 v9, -0x1

    if-eq v0, v9, :cond_0

    .line 235
    const/4 v9, 0x0

    invoke-virtual {v2, v1, v9, v0}, Ljava/io/BufferedOutputStream;->write([BII)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_1

    .line 244
    .end local v0    # "count":I
    .end local v1    # "data":[B
    .end local v2    # "dest":Ljava/io/BufferedOutputStream;
    .end local v4    # "e":Ljava/util/Enumeration;, "Ljava/util/Enumeration<+Ljava/util/zip/ZipEntry;>;"
    .end local v5    # "entry":Ljava/util/zip/ZipEntry;
    .end local v6    # "fos":Ljava/io/FileOutputStream;
    .end local v7    # "is":Ljava/io/InputStream;
    .end local v8    # "zipfile":Ljava/util/zip/ZipFile;
    :catch_0
    move-exception v3

    .line 246
    .local v3, "e":Ljava/lang/Exception;
    invoke-virtual {v3}, Ljava/lang/Exception;->printStackTrace()V

    .line 248
    .end local v3    # "e":Ljava/lang/Exception;
    :goto_2
    return-void

    .line 237
    .restart local v0    # "count":I
    .restart local v1    # "data":[B
    .restart local v2    # "dest":Ljava/io/BufferedOutputStream;
    .restart local v4    # "e":Ljava/util/Enumeration;, "Ljava/util/Enumeration<+Ljava/util/zip/ZipEntry;>;"
    .restart local v5    # "entry":Ljava/util/zip/ZipEntry;
    .restart local v6    # "fos":Ljava/io/FileOutputStream;
    .restart local v7    # "is":Ljava/io/InputStream;
    .restart local v8    # "zipfile":Ljava/util/zip/ZipFile;
    :cond_0
    :try_start_1
    invoke-virtual {v2}, Ljava/io/BufferedOutputStream;->flush()V

    goto :goto_0

    .line 240
    .end local v0    # "count":I
    .end local v1    # "data":[B
    .end local v5    # "entry":Ljava/util/zip/ZipEntry;
    :cond_1
    invoke-virtual {v8}, Ljava/util/zip/ZipFile;->close()V

    .line 241
    invoke-virtual {v2}, Ljava/io/BufferedOutputStream;->close()V

    .line 242
    invoke-virtual {v6}, Ljava/io/FileOutputStream;->close()V

    .line 243
    invoke-virtual {v7}, Ljava/io/InputStream;->close()V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_2
.end method


# virtual methods
.method public copyDataBase(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 12
    .param p1, "storedPath"    # Ljava/lang/String;
    .param p2, "copiedPath"    # Ljava/lang/String;
    .param p3, "pragmaCheck"    # Ljava/lang/String;

    .prologue
    .line 116
    const-string v7, ""

    .line 118
    .local v7, "pragmaUserVersion":Ljava/lang/String;
    :try_start_0
    sget-object v9, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v10, "Inside copyDataBase"

    invoke-virtual {v9, v10}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 119
    new-instance v1, Ljava/io/File;

    invoke-direct {v1, p1}, Ljava/io/File;-><init>(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_3

    .line 120
    .local v1, "f":Ljava/io/File;
    const/4 v2, 0x0

    .line 121
    .local v2, "fis":Ljava/io/FileInputStream;
    const/4 v4, 0x0

    .line 123
    .local v4, "fos":Ljava/io/FileOutputStream;
    :try_start_1
    new-instance v3, Ljava/io/FileInputStream;

    invoke-direct {v3, v1}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 124
    .end local v2    # "fis":Ljava/io/FileInputStream;
    .local v3, "fis":Ljava/io/FileInputStream;
    :try_start_2
    new-instance v5, Ljava/io/FileOutputStream;

    invoke-direct {v5, p2}, Ljava/io/FileOutputStream;-><init>(Ljava/lang/String;)V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_5
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    .line 125
    .end local v4    # "fos":Ljava/io/FileOutputStream;
    .local v5, "fos":Ljava/io/FileOutputStream;
    :try_start_3
    invoke-static {v3, v5}, Lorg/apache/commons/io/IOUtils;->copy(Ljava/io/InputStream;Ljava/io/OutputStream;)I

    .line 126
    invoke-virtual {v5}, Ljava/io/FileOutputStream;->flush()V
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_6
    .catchall {:try_start_3 .. :try_end_3} :catchall_2

    .line 131
    :try_start_4
    invoke-virtual {v5}, Ljava/io/FileOutputStream;->close()V

    .line 132
    invoke-virtual {v3}, Ljava/io/FileInputStream;->close()V

    .line 133
    sget-object v9, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v10, "Copied sucssefully"

    invoke-virtual {v9, v10}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 134
    const-string v9, "true"

    invoke-virtual {p3, v9}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v9

    if-eqz v9, :cond_0

    .line 135
    invoke-virtual {p0}, Lcom/belkin/rules/utils/RuleUtility;->getPragmaVersion()Ljava/lang/String;
    :try_end_4
    .catch Ljava/io/IOException; {:try_start_4 .. :try_end_4} :catch_0
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_3

    move-result-object v7

    :cond_0
    move-object v4, v5

    .end local v5    # "fos":Ljava/io/FileOutputStream;
    .restart local v4    # "fos":Ljava/io/FileOutputStream;
    move-object v2, v3

    .end local v3    # "fis":Ljava/io/FileInputStream;
    .restart local v2    # "fis":Ljava/io/FileInputStream;
    :cond_1
    :goto_0
    move-object v8, v7

    .line 145
    .end local v1    # "f":Ljava/io/File;
    .end local v2    # "fis":Ljava/io/FileInputStream;
    .end local v4    # "fos":Ljava/io/FileOutputStream;
    .end local v7    # "pragmaUserVersion":Ljava/lang/String;
    .local v8, "pragmaUserVersion":Ljava/lang/String;
    :goto_1
    return-object v8

    .line 137
    .end local v8    # "pragmaUserVersion":Ljava/lang/String;
    .restart local v1    # "f":Ljava/io/File;
    .restart local v3    # "fis":Ljava/io/FileInputStream;
    .restart local v5    # "fos":Ljava/io/FileOutputStream;
    .restart local v7    # "pragmaUserVersion":Ljava/lang/String;
    :catch_0
    move-exception v6

    .line 138
    .local v6, "ioe":Ljava/io/IOException;
    :try_start_5
    invoke-virtual {v6}, Ljava/io/IOException;->printStackTrace()V
    :try_end_5
    .catch Ljava/lang/Exception; {:try_start_5 .. :try_end_5} :catch_3

    move-object v4, v5

    .end local v5    # "fos":Ljava/io/FileOutputStream;
    .restart local v4    # "fos":Ljava/io/FileOutputStream;
    move-object v2, v3

    .line 140
    .end local v3    # "fis":Ljava/io/FileInputStream;
    .restart local v2    # "fis":Ljava/io/FileInputStream;
    goto :goto_0

    .line 127
    .end local v6    # "ioe":Ljava/io/IOException;
    :catch_1
    move-exception v0

    .line 128
    .local v0, "e":Ljava/lang/Exception;
    :goto_2
    :try_start_6
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_0

    .line 131
    :try_start_7
    invoke-virtual {v4}, Ljava/io/FileOutputStream;->close()V

    .line 132
    invoke-virtual {v2}, Ljava/io/FileInputStream;->close()V

    .line 133
    sget-object v9, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v10, "Copied sucssefully"

    invoke-virtual {v9, v10}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 134
    const-string v9, "true"

    invoke-virtual {p3, v9}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v9

    if-eqz v9, :cond_1

    .line 135
    invoke-virtual {p0}, Lcom/belkin/rules/utils/RuleUtility;->getPragmaVersion()Ljava/lang/String;
    :try_end_7
    .catch Ljava/io/IOException; {:try_start_7 .. :try_end_7} :catch_2
    .catch Ljava/lang/Exception; {:try_start_7 .. :try_end_7} :catch_3

    move-result-object v7

    goto :goto_0

    .line 137
    :catch_2
    move-exception v6

    .line 138
    .restart local v6    # "ioe":Ljava/io/IOException;
    :try_start_8
    invoke-virtual {v6}, Ljava/io/IOException;->printStackTrace()V
    :try_end_8
    .catch Ljava/lang/Exception; {:try_start_8 .. :try_end_8} :catch_3

    goto :goto_0

    .line 142
    .end local v0    # "e":Ljava/lang/Exception;
    .end local v1    # "f":Ljava/io/File;
    .end local v2    # "fis":Ljava/io/FileInputStream;
    .end local v4    # "fos":Ljava/io/FileOutputStream;
    .end local v6    # "ioe":Ljava/io/IOException;
    :catch_3
    move-exception v9

    move-object v8, v7

    .line 145
    .end local v7    # "pragmaUserVersion":Ljava/lang/String;
    .restart local v8    # "pragmaUserVersion":Ljava/lang/String;
    goto :goto_1

    .line 130
    .end local v8    # "pragmaUserVersion":Ljava/lang/String;
    .restart local v1    # "f":Ljava/io/File;
    .restart local v2    # "fis":Ljava/io/FileInputStream;
    .restart local v4    # "fos":Ljava/io/FileOutputStream;
    .restart local v7    # "pragmaUserVersion":Ljava/lang/String;
    :catchall_0
    move-exception v9

    .line 131
    :goto_3
    :try_start_9
    invoke-virtual {v4}, Ljava/io/FileOutputStream;->close()V

    .line 132
    invoke-virtual {v2}, Ljava/io/FileInputStream;->close()V

    .line 133
    sget-object v10, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v11, "Copied sucssefully"

    invoke-virtual {v10, v11}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 134
    const-string v10, "true"

    invoke-virtual {p3, v10}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v10

    if-eqz v10, :cond_2

    .line 135
    invoke-virtual {p0}, Lcom/belkin/rules/utils/RuleUtility;->getPragmaVersion()Ljava/lang/String;
    :try_end_9
    .catch Ljava/io/IOException; {:try_start_9 .. :try_end_9} :catch_4
    .catch Ljava/lang/Exception; {:try_start_9 .. :try_end_9} :catch_3

    move-result-object v7

    .line 139
    :cond_2
    :goto_4
    :try_start_a
    throw v9

    .line 137
    :catch_4
    move-exception v6

    .line 138
    .restart local v6    # "ioe":Ljava/io/IOException;
    invoke-virtual {v6}, Ljava/io/IOException;->printStackTrace()V
    :try_end_a
    .catch Ljava/lang/Exception; {:try_start_a .. :try_end_a} :catch_3

    goto :goto_4

    .line 130
    .end local v2    # "fis":Ljava/io/FileInputStream;
    .end local v6    # "ioe":Ljava/io/IOException;
    .restart local v3    # "fis":Ljava/io/FileInputStream;
    :catchall_1
    move-exception v9

    move-object v2, v3

    .end local v3    # "fis":Ljava/io/FileInputStream;
    .restart local v2    # "fis":Ljava/io/FileInputStream;
    goto :goto_3

    .end local v2    # "fis":Ljava/io/FileInputStream;
    .end local v4    # "fos":Ljava/io/FileOutputStream;
    .restart local v3    # "fis":Ljava/io/FileInputStream;
    .restart local v5    # "fos":Ljava/io/FileOutputStream;
    :catchall_2
    move-exception v9

    move-object v4, v5

    .end local v5    # "fos":Ljava/io/FileOutputStream;
    .restart local v4    # "fos":Ljava/io/FileOutputStream;
    move-object v2, v3

    .end local v3    # "fis":Ljava/io/FileInputStream;
    .restart local v2    # "fis":Ljava/io/FileInputStream;
    goto :goto_3

    .line 127
    .end local v2    # "fis":Ljava/io/FileInputStream;
    .restart local v3    # "fis":Ljava/io/FileInputStream;
    :catch_5
    move-exception v0

    move-object v2, v3

    .end local v3    # "fis":Ljava/io/FileInputStream;
    .restart local v2    # "fis":Ljava/io/FileInputStream;
    goto :goto_2

    .end local v2    # "fis":Ljava/io/FileInputStream;
    .end local v4    # "fos":Ljava/io/FileOutputStream;
    .restart local v3    # "fis":Ljava/io/FileInputStream;
    .restart local v5    # "fos":Ljava/io/FileOutputStream;
    :catch_6
    move-exception v0

    move-object v4, v5

    .end local v5    # "fos":Ljava/io/FileOutputStream;
    .restart local v4    # "fos":Ljava/io/FileOutputStream;
    move-object v2, v3

    .end local v3    # "fis":Ljava/io/FileInputStream;
    .restart local v2    # "fis":Ljava/io/FileInputStream;
    goto :goto_2
.end method

.method public getLocalDBPath()Ljava/lang/String;
    .locals 1

    .prologue
    .line 168
    iget-object v0, p0, Lcom/belkin/rules/utils/RuleUtility;->dbPath:Ljava/lang/String;

    return-object v0
.end method

.method public getPragmaVersion()Ljava/lang/String;
    .locals 6

    .prologue
    .line 185
    const-string v2, ""

    .line 187
    .local v2, "pragmaVersion":Ljava/lang/String;
    :try_start_0
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p0}, Lcom/belkin/rules/utils/RuleUtility;->getLocalDBPath()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "pluginrules2.db"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    const/4 v4, 0x0

    const v5, 0x10000010

    invoke-static {v3, v4, v5}, Landroid/database/sqlite/SQLiteDatabase;->openDatabase(Ljava/lang/String;Landroid/database/sqlite/SQLiteDatabase$CursorFactory;I)Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v0

    .line 188
    .local v0, "db":Landroid/database/sqlite/SQLiteDatabase;
    invoke-virtual {v0}, Landroid/database/sqlite/SQLiteDatabase;->getVersion()I

    move-result v3

    if-nez v3, :cond_0

    .line 189
    const-string v3, "RuleUtility"

    const-string v4, "got DBVersion equal to 0"

    invoke-static {v3, v4}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 190
    const/16 v3, 0x9

    invoke-virtual {v0, v3}, Landroid/database/sqlite/SQLiteDatabase;->setVersion(I)V

    .line 192
    :cond_0
    invoke-virtual {v0}, Landroid/database/sqlite/SQLiteDatabase;->getVersion()I

    move-result v3

    invoke-static {v3}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v2

    .line 193
    const-string v3, "RuleUtility"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "getPragmaVersion Pragma version is : "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 194
    invoke-virtual {v0}, Landroid/database/sqlite/SQLiteDatabase;->close()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 198
    .end local v0    # "db":Landroid/database/sqlite/SQLiteDatabase;
    :goto_0
    return-object v2

    .line 195
    :catch_0
    move-exception v1

    .line 196
    .local v1, "e":Ljava/lang/Exception;
    sget-object v3, Lcom/belkin/rules/utils/RuleUtility;->TAG:Ljava/lang/String;

    const-string v4, "Exception while opening DB: "

    invoke-static {v3, v4, v1}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Exception;)V

    goto :goto_0
.end method

.method public setDBPath(Ljava/lang/String;)V
    .locals 0
    .param p1, "path"    # Ljava/lang/String;

    .prologue
    .line 157
    iput-object p1, p0, Lcom/belkin/rules/utils/RuleUtility;->dbPath:Ljava/lang/String;

    .line 158
    return-void
.end method

.method public zip([Ljava/lang/String;Ljava/lang/String;)V
    .locals 6
    .param p1, "zipFiles"    # [Ljava/lang/String;
    .param p2, "zipLocation"    # Ljava/lang/String;

    .prologue
    .line 89
    sget-object v3, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v4, "inside zip"

    invoke-virtual {v3, v4}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 91
    :try_start_0
    sget-object v3, Ljava/lang/System;->out:Ljava/io/PrintStream;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, " zipLocation : "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 93
    new-instance v2, Lnet/lingala/zip4j/core/ZipFile;

    invoke-direct {v2, p2}, Lnet/lingala/zip4j/core/ZipFile;-><init>(Ljava/lang/String;)V

    .line 94
    .local v2, "zipFile":Lnet/lingala/zip4j/core/ZipFile;
    new-instance v1, Lnet/lingala/zip4j/model/ZipParameters;

    invoke-direct {v1}, Lnet/lingala/zip4j/model/ZipParameters;-><init>()V

    .line 95
    .local v1, "parameters":Lnet/lingala/zip4j/model/ZipParameters;
    const/16 v3, 0x8

    invoke-virtual {v1, v3}, Lnet/lingala/zip4j/model/ZipParameters;->setCompressionMethod(I)V

    .line 96
    const/4 v3, 0x5

    invoke-virtual {v1, v3}, Lnet/lingala/zip4j/model/ZipParameters;->setCompressionLevel(I)V

    .line 97
    new-instance v3, Ljava/io/File;

    const/4 v4, 0x0

    aget-object v4, p1, v4

    invoke-direct {v3, v4}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, v3, v1}, Lnet/lingala/zip4j/core/ZipFile;->addFile(Ljava/io/File;Lnet/lingala/zip4j/model/ZipParameters;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 105
    .end local v1    # "parameters":Lnet/lingala/zip4j/model/ZipParameters;
    .end local v2    # "zipFile":Lnet/lingala/zip4j/core/ZipFile;
    :goto_0
    return-void

    .line 101
    :catch_0
    move-exception v0

    .line 102
    .local v0, "e":Ljava/lang/Exception;
    const-string v3, "RuleUtility"

    const-string v4, "zip"

    invoke-static {v3, v4, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 103
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_0
.end method
