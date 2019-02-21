.class public Lcom/belkin/utils/ZIPUtility;
.super Ljava/lang/Object;
.source "ZIPUtility.java"


# static fields
.field private static BUFFER:I = 0x0

.field public static final TAG:Ljava/lang/String; = "ZIPUtility"


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 52
    const/16 v0, 0x400

    sput v0, Lcom/belkin/utils/ZIPUtility;->BUFFER:I

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 51
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static unzip(Ljava/lang/String;Ljava/lang/String;)V
    .locals 17
    .param p0, "zipFileAbsolutePath"    # Ljava/lang/String;
    .param p1, "unZippedFileAbsolutePath"    # Ljava/lang/String;

    .prologue
    .line 60
    const/4 v10, 0x0

    .line 61
    .local v10, "is":Ljava/io/InputStream;
    const/4 v8, 0x0

    .line 62
    .local v8, "fos":Ljava/io/FileOutputStream;
    const/4 v3, 0x0

    .line 63
    .local v3, "dest":Ljava/io/BufferedOutputStream;
    const/4 v12, 0x0

    .line 65
    .local v12, "zipfile":Ljava/util/zip/ZipFile;
    :try_start_0
    new-instance v13, Ljava/util/zip/ZipFile;

    move-object/from16 v0, p0

    invoke-direct {v13, v0}, Ljava/util/zip/ZipFile;-><init>(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_4
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 66
    .end local v12    # "zipfile":Ljava/util/zip/ZipFile;
    .local v13, "zipfile":Ljava/util/zip/ZipFile;
    :try_start_1
    invoke-virtual {v13}, Ljava/util/zip/ZipFile;->entries()Ljava/util/Enumeration;
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    move-result-object v6

    .local v6, "e":Ljava/util/Enumeration;, "Ljava/util/Enumeration<+Ljava/util/zip/ZipEntry;>;"
    move-object v4, v3

    .end local v3    # "dest":Ljava/io/BufferedOutputStream;
    .local v4, "dest":Ljava/io/BufferedOutputStream;
    move-object v9, v8

    .end local v8    # "fos":Ljava/io/FileOutputStream;
    .local v9, "fos":Ljava/io/FileOutputStream;
    move-object v11, v10

    .line 68
    .end local v10    # "is":Ljava/io/InputStream;
    .local v11, "is":Ljava/io/InputStream;
    :goto_0
    :try_start_2
    invoke-interface {v6}, Ljava/util/Enumeration;->hasMoreElements()Z

    move-result v14

    if-eqz v14, :cond_5

    .line 69
    invoke-interface {v6}, Ljava/util/Enumeration;->nextElement()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Ljava/util/zip/ZipEntry;

    .line 70
    .local v7, "entry":Ljava/util/zip/ZipEntry;
    new-instance v10, Ljava/io/BufferedInputStream;

    invoke-virtual {v13, v7}, Ljava/util/zip/ZipFile;->getInputStream(Ljava/util/zip/ZipEntry;)Ljava/io/InputStream;

    move-result-object v14

    invoke-direct {v10, v14}, Ljava/io/BufferedInputStream;-><init>(Ljava/io/InputStream;)V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_5
    .catchall {:try_start_2 .. :try_end_2} :catchall_2

    .line 71
    .end local v11    # "is":Ljava/io/InputStream;
    .restart local v10    # "is":Ljava/io/InputStream;
    :try_start_3
    sget v14, Lcom/belkin/utils/ZIPUtility;->BUFFER:I

    new-array v2, v14, [B

    .line 72
    .local v2, "data":[B
    new-instance v8, Ljava/io/FileOutputStream;

    move-object/from16 v0, p1

    invoke-direct {v8, v0}, Ljava/io/FileOutputStream;-><init>(Ljava/lang/String;)V
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_6
    .catchall {:try_start_3 .. :try_end_3} :catchall_3

    .line 74
    .end local v9    # "fos":Ljava/io/FileOutputStream;
    .restart local v8    # "fos":Ljava/io/FileOutputStream;
    :try_start_4
    new-instance v3, Ljava/io/BufferedOutputStream;

    sget v14, Lcom/belkin/utils/ZIPUtility;->BUFFER:I

    invoke-direct {v3, v8, v14}, Ljava/io/BufferedOutputStream;-><init>(Ljava/io/OutputStream;I)V
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_7
    .catchall {:try_start_4 .. :try_end_4} :catchall_4

    .line 76
    .end local v4    # "dest":Ljava/io/BufferedOutputStream;
    .restart local v3    # "dest":Ljava/io/BufferedOutputStream;
    :goto_1
    const/4 v14, 0x0

    :try_start_5
    sget v15, Lcom/belkin/utils/ZIPUtility;->BUFFER:I

    invoke-virtual {v10, v2, v14, v15}, Ljava/io/InputStream;->read([BII)I

    move-result v1

    .local v1, "count":I
    const/4 v14, -0x1

    if-eq v1, v14, :cond_4

    .line 77
    const/4 v14, 0x0

    invoke-virtual {v3, v2, v14, v1}, Ljava/io/BufferedOutputStream;->write([BII)V
    :try_end_5
    .catch Ljava/lang/Exception; {:try_start_5 .. :try_end_5} :catch_0
    .catchall {:try_start_5 .. :try_end_5} :catchall_1

    goto :goto_1

    .line 81
    .end local v1    # "count":I
    .end local v2    # "data":[B
    .end local v6    # "e":Ljava/util/Enumeration;, "Ljava/util/Enumeration<+Ljava/util/zip/ZipEntry;>;"
    .end local v7    # "entry":Ljava/util/zip/ZipEntry;
    :catch_0
    move-exception v5

    move-object v12, v13

    .line 82
    .end local v13    # "zipfile":Ljava/util/zip/ZipFile;
    .local v5, "e":Ljava/lang/Exception;
    .restart local v12    # "zipfile":Ljava/util/zip/ZipFile;
    :goto_2
    :try_start_6
    const-string v14, "ZIPUtility"

    new-instance v15, Ljava/lang/StringBuilder;

    invoke-direct {v15}, Ljava/lang/StringBuilder;-><init>()V

    const-string v16, "unzip Exception e: "

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    invoke-virtual {v15, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v15

    invoke-virtual {v15}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v15

    invoke-static {v14, v15}, Lcom/belkin/utils/LogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_0

    .line 88
    if-eqz v12, :cond_0

    .line 89
    :try_start_7
    invoke-virtual {v12}, Ljava/util/zip/ZipFile;->close()V

    .line 90
    :cond_0
    if-eqz v3, :cond_1

    .line 91
    invoke-virtual {v3}, Ljava/io/BufferedOutputStream;->close()V

    .line 92
    :cond_1
    if-eqz v8, :cond_2

    .line 93
    invoke-virtual {v8}, Ljava/io/FileOutputStream;->close()V

    .line 94
    :cond_2
    if-eqz v10, :cond_3

    .line 95
    invoke-virtual {v10}, Ljava/io/InputStream;->close()V
    :try_end_7
    .catch Ljava/lang/Exception; {:try_start_7 .. :try_end_7} :catch_3

    .line 99
    .end local v5    # "e":Ljava/lang/Exception;
    :cond_3
    :goto_3
    return-void

    .line 79
    .end local v12    # "zipfile":Ljava/util/zip/ZipFile;
    .restart local v1    # "count":I
    .restart local v2    # "data":[B
    .restart local v6    # "e":Ljava/util/Enumeration;, "Ljava/util/Enumeration<+Ljava/util/zip/ZipEntry;>;"
    .restart local v7    # "entry":Ljava/util/zip/ZipEntry;
    .restart local v13    # "zipfile":Ljava/util/zip/ZipFile;
    :cond_4
    :try_start_8
    invoke-virtual {v3}, Ljava/io/BufferedOutputStream;->flush()V
    :try_end_8
    .catch Ljava/lang/Exception; {:try_start_8 .. :try_end_8} :catch_0
    .catchall {:try_start_8 .. :try_end_8} :catchall_1

    move-object v4, v3

    .end local v3    # "dest":Ljava/io/BufferedOutputStream;
    .restart local v4    # "dest":Ljava/io/BufferedOutputStream;
    move-object v9, v8

    .end local v8    # "fos":Ljava/io/FileOutputStream;
    .restart local v9    # "fos":Ljava/io/FileOutputStream;
    move-object v11, v10

    .line 80
    .end local v10    # "is":Ljava/io/InputStream;
    .restart local v11    # "is":Ljava/io/InputStream;
    goto :goto_0

    .line 88
    .end local v1    # "count":I
    .end local v2    # "data":[B
    .end local v7    # "entry":Ljava/util/zip/ZipEntry;
    :cond_5
    if-eqz v13, :cond_6

    .line 89
    :try_start_9
    invoke-virtual {v13}, Ljava/util/zip/ZipFile;->close()V

    .line 90
    :cond_6
    if-eqz v4, :cond_7

    .line 91
    invoke-virtual {v4}, Ljava/io/BufferedOutputStream;->close()V

    .line 92
    :cond_7
    if-eqz v9, :cond_8

    .line 93
    invoke-virtual {v9}, Ljava/io/FileOutputStream;->close()V

    .line 94
    :cond_8
    if-eqz v11, :cond_9

    .line 95
    invoke-virtual {v11}, Ljava/io/InputStream;->close()V
    :try_end_9
    .catch Ljava/lang/Exception; {:try_start_9 .. :try_end_9} :catch_1

    :cond_9
    move-object v12, v13

    .end local v13    # "zipfile":Ljava/util/zip/ZipFile;
    .restart local v12    # "zipfile":Ljava/util/zip/ZipFile;
    move-object v3, v4

    .end local v4    # "dest":Ljava/io/BufferedOutputStream;
    .restart local v3    # "dest":Ljava/io/BufferedOutputStream;
    move-object v8, v9

    .end local v9    # "fos":Ljava/io/FileOutputStream;
    .restart local v8    # "fos":Ljava/io/FileOutputStream;
    move-object v10, v11

    .line 96
    .end local v11    # "is":Ljava/io/InputStream;
    .restart local v10    # "is":Ljava/io/InputStream;
    goto :goto_3

    .end local v3    # "dest":Ljava/io/BufferedOutputStream;
    .end local v8    # "fos":Ljava/io/FileOutputStream;
    .end local v10    # "is":Ljava/io/InputStream;
    .end local v12    # "zipfile":Ljava/util/zip/ZipFile;
    .restart local v4    # "dest":Ljava/io/BufferedOutputStream;
    .restart local v9    # "fos":Ljava/io/FileOutputStream;
    .restart local v11    # "is":Ljava/io/InputStream;
    .restart local v13    # "zipfile":Ljava/util/zip/ZipFile;
    :catch_1
    move-exception v14

    move-object v12, v13

    .end local v13    # "zipfile":Ljava/util/zip/ZipFile;
    .restart local v12    # "zipfile":Ljava/util/zip/ZipFile;
    move-object v3, v4

    .end local v4    # "dest":Ljava/io/BufferedOutputStream;
    .restart local v3    # "dest":Ljava/io/BufferedOutputStream;
    move-object v8, v9

    .end local v9    # "fos":Ljava/io/FileOutputStream;
    .restart local v8    # "fos":Ljava/io/FileOutputStream;
    move-object v10, v11

    .line 98
    .end local v11    # "is":Ljava/io/InputStream;
    .restart local v10    # "is":Ljava/io/InputStream;
    goto :goto_3

    .line 87
    .end local v6    # "e":Ljava/util/Enumeration;, "Ljava/util/Enumeration<+Ljava/util/zip/ZipEntry;>;"
    :catchall_0
    move-exception v14

    .line 88
    :goto_4
    if-eqz v12, :cond_a

    .line 89
    :try_start_a
    invoke-virtual {v12}, Ljava/util/zip/ZipFile;->close()V

    .line 90
    :cond_a
    if-eqz v3, :cond_b

    .line 91
    invoke-virtual {v3}, Ljava/io/BufferedOutputStream;->close()V

    .line 92
    :cond_b
    if-eqz v8, :cond_c

    .line 93
    invoke-virtual {v8}, Ljava/io/FileOutputStream;->close()V

    .line 94
    :cond_c
    if-eqz v10, :cond_d

    .line 95
    invoke-virtual {v10}, Ljava/io/InputStream;->close()V
    :try_end_a
    .catch Ljava/lang/Exception; {:try_start_a .. :try_end_a} :catch_2

    .line 96
    :cond_d
    :goto_5
    throw v14

    :catch_2
    move-exception v15

    goto :goto_5

    .line 87
    .end local v12    # "zipfile":Ljava/util/zip/ZipFile;
    .restart local v13    # "zipfile":Ljava/util/zip/ZipFile;
    :catchall_1
    move-exception v14

    move-object v12, v13

    .end local v13    # "zipfile":Ljava/util/zip/ZipFile;
    .restart local v12    # "zipfile":Ljava/util/zip/ZipFile;
    goto :goto_4

    .end local v3    # "dest":Ljava/io/BufferedOutputStream;
    .end local v8    # "fos":Ljava/io/FileOutputStream;
    .end local v10    # "is":Ljava/io/InputStream;
    .end local v12    # "zipfile":Ljava/util/zip/ZipFile;
    .restart local v4    # "dest":Ljava/io/BufferedOutputStream;
    .restart local v6    # "e":Ljava/util/Enumeration;, "Ljava/util/Enumeration<+Ljava/util/zip/ZipEntry;>;"
    .restart local v9    # "fos":Ljava/io/FileOutputStream;
    .restart local v11    # "is":Ljava/io/InputStream;
    .restart local v13    # "zipfile":Ljava/util/zip/ZipFile;
    :catchall_2
    move-exception v14

    move-object v12, v13

    .end local v13    # "zipfile":Ljava/util/zip/ZipFile;
    .restart local v12    # "zipfile":Ljava/util/zip/ZipFile;
    move-object v3, v4

    .end local v4    # "dest":Ljava/io/BufferedOutputStream;
    .restart local v3    # "dest":Ljava/io/BufferedOutputStream;
    move-object v8, v9

    .end local v9    # "fos":Ljava/io/FileOutputStream;
    .restart local v8    # "fos":Ljava/io/FileOutputStream;
    move-object v10, v11

    .end local v11    # "is":Ljava/io/InputStream;
    .restart local v10    # "is":Ljava/io/InputStream;
    goto :goto_4

    .end local v3    # "dest":Ljava/io/BufferedOutputStream;
    .end local v8    # "fos":Ljava/io/FileOutputStream;
    .end local v12    # "zipfile":Ljava/util/zip/ZipFile;
    .restart local v4    # "dest":Ljava/io/BufferedOutputStream;
    .restart local v7    # "entry":Ljava/util/zip/ZipEntry;
    .restart local v9    # "fos":Ljava/io/FileOutputStream;
    .restart local v13    # "zipfile":Ljava/util/zip/ZipFile;
    :catchall_3
    move-exception v14

    move-object v12, v13

    .end local v13    # "zipfile":Ljava/util/zip/ZipFile;
    .restart local v12    # "zipfile":Ljava/util/zip/ZipFile;
    move-object v3, v4

    .end local v4    # "dest":Ljava/io/BufferedOutputStream;
    .restart local v3    # "dest":Ljava/io/BufferedOutputStream;
    move-object v8, v9

    .end local v9    # "fos":Ljava/io/FileOutputStream;
    .restart local v8    # "fos":Ljava/io/FileOutputStream;
    goto :goto_4

    .end local v3    # "dest":Ljava/io/BufferedOutputStream;
    .end local v12    # "zipfile":Ljava/util/zip/ZipFile;
    .restart local v2    # "data":[B
    .restart local v4    # "dest":Ljava/io/BufferedOutputStream;
    .restart local v13    # "zipfile":Ljava/util/zip/ZipFile;
    :catchall_4
    move-exception v14

    move-object v12, v13

    .end local v13    # "zipfile":Ljava/util/zip/ZipFile;
    .restart local v12    # "zipfile":Ljava/util/zip/ZipFile;
    move-object v3, v4

    .end local v4    # "dest":Ljava/io/BufferedOutputStream;
    .restart local v3    # "dest":Ljava/io/BufferedOutputStream;
    goto :goto_4

    .line 96
    .end local v2    # "data":[B
    .end local v6    # "e":Ljava/util/Enumeration;, "Ljava/util/Enumeration<+Ljava/util/zip/ZipEntry;>;"
    .end local v7    # "entry":Ljava/util/zip/ZipEntry;
    .restart local v5    # "e":Ljava/lang/Exception;
    :catch_3
    move-exception v14

    goto :goto_3

    .line 81
    .end local v5    # "e":Ljava/lang/Exception;
    :catch_4
    move-exception v5

    goto :goto_2

    .end local v3    # "dest":Ljava/io/BufferedOutputStream;
    .end local v8    # "fos":Ljava/io/FileOutputStream;
    .end local v10    # "is":Ljava/io/InputStream;
    .end local v12    # "zipfile":Ljava/util/zip/ZipFile;
    .restart local v4    # "dest":Ljava/io/BufferedOutputStream;
    .restart local v6    # "e":Ljava/util/Enumeration;, "Ljava/util/Enumeration<+Ljava/util/zip/ZipEntry;>;"
    .restart local v9    # "fos":Ljava/io/FileOutputStream;
    .restart local v11    # "is":Ljava/io/InputStream;
    .restart local v13    # "zipfile":Ljava/util/zip/ZipFile;
    :catch_5
    move-exception v5

    move-object v12, v13

    .end local v13    # "zipfile":Ljava/util/zip/ZipFile;
    .restart local v12    # "zipfile":Ljava/util/zip/ZipFile;
    move-object v3, v4

    .end local v4    # "dest":Ljava/io/BufferedOutputStream;
    .restart local v3    # "dest":Ljava/io/BufferedOutputStream;
    move-object v8, v9

    .end local v9    # "fos":Ljava/io/FileOutputStream;
    .restart local v8    # "fos":Ljava/io/FileOutputStream;
    move-object v10, v11

    .end local v11    # "is":Ljava/io/InputStream;
    .restart local v10    # "is":Ljava/io/InputStream;
    goto/16 :goto_2

    .end local v3    # "dest":Ljava/io/BufferedOutputStream;
    .end local v8    # "fos":Ljava/io/FileOutputStream;
    .end local v12    # "zipfile":Ljava/util/zip/ZipFile;
    .restart local v4    # "dest":Ljava/io/BufferedOutputStream;
    .restart local v7    # "entry":Ljava/util/zip/ZipEntry;
    .restart local v9    # "fos":Ljava/io/FileOutputStream;
    .restart local v13    # "zipfile":Ljava/util/zip/ZipFile;
    :catch_6
    move-exception v5

    move-object v12, v13

    .end local v13    # "zipfile":Ljava/util/zip/ZipFile;
    .restart local v12    # "zipfile":Ljava/util/zip/ZipFile;
    move-object v3, v4

    .end local v4    # "dest":Ljava/io/BufferedOutputStream;
    .restart local v3    # "dest":Ljava/io/BufferedOutputStream;
    move-object v8, v9

    .end local v9    # "fos":Ljava/io/FileOutputStream;
    .restart local v8    # "fos":Ljava/io/FileOutputStream;
    goto/16 :goto_2

    .end local v3    # "dest":Ljava/io/BufferedOutputStream;
    .end local v12    # "zipfile":Ljava/util/zip/ZipFile;
    .restart local v2    # "data":[B
    .restart local v4    # "dest":Ljava/io/BufferedOutputStream;
    .restart local v13    # "zipfile":Ljava/util/zip/ZipFile;
    :catch_7
    move-exception v5

    move-object v12, v13

    .end local v13    # "zipfile":Ljava/util/zip/ZipFile;
    .restart local v12    # "zipfile":Ljava/util/zip/ZipFile;
    move-object v3, v4

    .end local v4    # "dest":Ljava/io/BufferedOutputStream;
    .restart local v3    # "dest":Ljava/io/BufferedOutputStream;
    goto/16 :goto_2
.end method

.method public static zip(Ljava/lang/String;Ljava/lang/String;)V
    .locals 18
    .param p0, "sourceFileAbsolutePath"    # Ljava/lang/String;
    .param p1, "zipFileAbsolutePath"    # Ljava/lang/String;

    .prologue
    .line 106
    const/4 v11, 0x0

    .line 107
    .local v11, "origin":Ljava/io/BufferedInputStream;
    const/4 v3, 0x0

    .line 108
    .local v3, "dest":Ljava/io/FileOutputStream;
    const/4 v13, 0x0

    .line 110
    .local v13, "out":Ljava/util/zip/ZipOutputStream;
    :try_start_0
    new-instance v4, Ljava/io/FileOutputStream;

    move-object/from16 v0, p1

    invoke-direct {v4, v0}, Ljava/io/FileOutputStream;-><init>(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_4
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 111
    .end local v3    # "dest":Ljava/io/FileOutputStream;
    .local v4, "dest":Ljava/io/FileOutputStream;
    :try_start_1
    new-instance v14, Ljava/util/zip/ZipOutputStream;

    new-instance v15, Ljava/io/BufferedOutputStream;

    invoke-direct {v15, v4}, Ljava/io/BufferedOutputStream;-><init>(Ljava/io/OutputStream;)V

    invoke-direct {v14, v15}, Ljava/util/zip/ZipOutputStream;-><init>(Ljava/io/OutputStream;)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_5
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 113
    .end local v13    # "out":Ljava/util/zip/ZipOutputStream;
    .local v14, "out":Ljava/util/zip/ZipOutputStream;
    :try_start_2
    sget v15, Lcom/belkin/utils/ZIPUtility;->BUFFER:I

    new-array v2, v15, [B

    .line 115
    .local v2, "data":[B
    new-instance v7, Ljava/io/File;

    move-object/from16 v0, p0

    invoke-direct {v7, v0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 116
    .local v7, "f":Ljava/io/File;
    invoke-virtual {v7}, Ljava/io/File;->list()[Ljava/lang/String;
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0
    .catchall {:try_start_2 .. :try_end_2} :catchall_2

    move-result-object v9

    .line 118
    .local v9, "files":[Ljava/lang/String;
    const/4 v10, 0x0

    .local v10, "i":I
    move-object v12, v11

    .end local v11    # "origin":Ljava/io/BufferedInputStream;
    .local v12, "origin":Ljava/io/BufferedInputStream;
    :goto_0
    :try_start_3
    array-length v15, v9

    if-ge v10, v15, :cond_4

    .line 119
    new-instance v8, Ljava/io/FileInputStream;

    aget-object v15, v9, v10

    invoke-direct {v8, v15}, Ljava/io/FileInputStream;-><init>(Ljava/lang/String;)V

    .line 121
    .local v8, "fi":Ljava/io/FileInputStream;
    new-instance v11, Ljava/io/BufferedInputStream;

    sget v15, Lcom/belkin/utils/ZIPUtility;->BUFFER:I

    invoke-direct {v11, v8, v15}, Ljava/io/BufferedInputStream;-><init>(Ljava/io/InputStream;I)V
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_6
    .catchall {:try_start_3 .. :try_end_3} :catchall_3

    .line 123
    .end local v12    # "origin":Ljava/io/BufferedInputStream;
    .restart local v11    # "origin":Ljava/io/BufferedInputStream;
    :try_start_4
    new-instance v6, Ljava/util/zip/ZipEntry;

    aget-object v15, v9, v10

    invoke-direct {v6, v15}, Ljava/util/zip/ZipEntry;-><init>(Ljava/lang/String;)V

    .line 124
    .local v6, "entry":Ljava/util/zip/ZipEntry;
    invoke-virtual {v14, v6}, Ljava/util/zip/ZipOutputStream;->putNextEntry(Ljava/util/zip/ZipEntry;)V

    .line 127
    :goto_1
    const/4 v15, 0x0

    sget v16, Lcom/belkin/utils/ZIPUtility;->BUFFER:I

    move/from16 v0, v16

    invoke-virtual {v11, v2, v15, v0}, Ljava/io/BufferedInputStream;->read([BII)I

    move-result v1

    .local v1, "count":I
    const/4 v15, -0x1

    if-eq v1, v15, :cond_3

    .line 128
    const/4 v15, 0x0

    invoke-virtual {v14, v2, v15, v1}, Ljava/util/zip/ZipOutputStream;->write([BII)V
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_0
    .catchall {:try_start_4 .. :try_end_4} :catchall_2

    goto :goto_1

    .line 132
    .end local v1    # "count":I
    .end local v2    # "data":[B
    .end local v6    # "entry":Ljava/util/zip/ZipEntry;
    .end local v7    # "f":Ljava/io/File;
    .end local v8    # "fi":Ljava/io/FileInputStream;
    .end local v9    # "files":[Ljava/lang/String;
    .end local v10    # "i":I
    :catch_0
    move-exception v5

    move-object v13, v14

    .end local v14    # "out":Ljava/util/zip/ZipOutputStream;
    .restart local v13    # "out":Ljava/util/zip/ZipOutputStream;
    move-object v3, v4

    .line 133
    .end local v4    # "dest":Ljava/io/FileOutputStream;
    .restart local v3    # "dest":Ljava/io/FileOutputStream;
    .local v5, "e":Ljava/lang/Exception;
    :goto_2
    :try_start_5
    const-string v15, "ZIPUtility"

    new-instance v16, Ljava/lang/StringBuilder;

    invoke-direct/range {v16 .. v16}, Ljava/lang/StringBuilder;-><init>()V

    const-string v17, "zip Exception e: "

    invoke-virtual/range {v16 .. v17}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v16

    move-object/from16 v0, v16

    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v16

    invoke-virtual/range {v16 .. v16}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v16

    invoke-static/range {v15 .. v16}, Lcom/belkin/utils/LogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    .line 139
    if-eqz v13, :cond_0

    .line 140
    :try_start_6
    invoke-virtual {v13}, Ljava/util/zip/ZipOutputStream;->close()V

    .line 141
    :cond_0
    if-eqz v3, :cond_1

    .line 142
    invoke-virtual {v3}, Ljava/io/FileOutputStream;->close()V

    .line 143
    :cond_1
    if-eqz v11, :cond_2

    .line 144
    invoke-virtual {v11}, Ljava/io/BufferedInputStream;->close()V
    :try_end_6
    .catch Ljava/lang/Exception; {:try_start_6 .. :try_end_6} :catch_3

    .line 148
    .end local v5    # "e":Ljava/lang/Exception;
    :cond_2
    :goto_3
    return-void

    .line 130
    .end local v3    # "dest":Ljava/io/FileOutputStream;
    .end local v13    # "out":Ljava/util/zip/ZipOutputStream;
    .restart local v1    # "count":I
    .restart local v2    # "data":[B
    .restart local v4    # "dest":Ljava/io/FileOutputStream;
    .restart local v6    # "entry":Ljava/util/zip/ZipEntry;
    .restart local v7    # "f":Ljava/io/File;
    .restart local v8    # "fi":Ljava/io/FileInputStream;
    .restart local v9    # "files":[Ljava/lang/String;
    .restart local v10    # "i":I
    .restart local v14    # "out":Ljava/util/zip/ZipOutputStream;
    :cond_3
    :try_start_7
    invoke-virtual {v11}, Ljava/io/BufferedInputStream;->close()V
    :try_end_7
    .catch Ljava/lang/Exception; {:try_start_7 .. :try_end_7} :catch_0
    .catchall {:try_start_7 .. :try_end_7} :catchall_2

    .line 118
    add-int/lit8 v10, v10, 0x1

    move-object v12, v11

    .end local v11    # "origin":Ljava/io/BufferedInputStream;
    .restart local v12    # "origin":Ljava/io/BufferedInputStream;
    goto :goto_0

    .line 139
    .end local v1    # "count":I
    .end local v6    # "entry":Ljava/util/zip/ZipEntry;
    .end local v8    # "fi":Ljava/io/FileInputStream;
    :cond_4
    if-eqz v14, :cond_5

    .line 140
    :try_start_8
    invoke-virtual {v14}, Ljava/util/zip/ZipOutputStream;->close()V

    .line 141
    :cond_5
    if-eqz v4, :cond_6

    .line 142
    invoke-virtual {v4}, Ljava/io/FileOutputStream;->close()V

    .line 143
    :cond_6
    if-eqz v12, :cond_7

    .line 144
    invoke-virtual {v12}, Ljava/io/BufferedInputStream;->close()V
    :try_end_8
    .catch Ljava/lang/Exception; {:try_start_8 .. :try_end_8} :catch_1

    :cond_7
    move-object v13, v14

    .end local v14    # "out":Ljava/util/zip/ZipOutputStream;
    .restart local v13    # "out":Ljava/util/zip/ZipOutputStream;
    move-object v3, v4

    .end local v4    # "dest":Ljava/io/FileOutputStream;
    .restart local v3    # "dest":Ljava/io/FileOutputStream;
    move-object v11, v12

    .line 145
    .end local v12    # "origin":Ljava/io/BufferedInputStream;
    .restart local v11    # "origin":Ljava/io/BufferedInputStream;
    goto :goto_3

    .end local v3    # "dest":Ljava/io/FileOutputStream;
    .end local v11    # "origin":Ljava/io/BufferedInputStream;
    .end local v13    # "out":Ljava/util/zip/ZipOutputStream;
    .restart local v4    # "dest":Ljava/io/FileOutputStream;
    .restart local v12    # "origin":Ljava/io/BufferedInputStream;
    .restart local v14    # "out":Ljava/util/zip/ZipOutputStream;
    :catch_1
    move-exception v15

    move-object v13, v14

    .end local v14    # "out":Ljava/util/zip/ZipOutputStream;
    .restart local v13    # "out":Ljava/util/zip/ZipOutputStream;
    move-object v3, v4

    .end local v4    # "dest":Ljava/io/FileOutputStream;
    .restart local v3    # "dest":Ljava/io/FileOutputStream;
    move-object v11, v12

    .line 147
    .end local v12    # "origin":Ljava/io/BufferedInputStream;
    .restart local v11    # "origin":Ljava/io/BufferedInputStream;
    goto :goto_3

    .line 138
    .end local v2    # "data":[B
    .end local v7    # "f":Ljava/io/File;
    .end local v9    # "files":[Ljava/lang/String;
    .end local v10    # "i":I
    :catchall_0
    move-exception v15

    .line 139
    :goto_4
    if-eqz v13, :cond_8

    .line 140
    :try_start_9
    invoke-virtual {v13}, Ljava/util/zip/ZipOutputStream;->close()V

    .line 141
    :cond_8
    if-eqz v3, :cond_9

    .line 142
    invoke-virtual {v3}, Ljava/io/FileOutputStream;->close()V

    .line 143
    :cond_9
    if-eqz v11, :cond_a

    .line 144
    invoke-virtual {v11}, Ljava/io/BufferedInputStream;->close()V
    :try_end_9
    .catch Ljava/lang/Exception; {:try_start_9 .. :try_end_9} :catch_2

    .line 145
    :cond_a
    :goto_5
    throw v15

    :catch_2
    move-exception v16

    goto :goto_5

    .line 138
    .end local v3    # "dest":Ljava/io/FileOutputStream;
    .restart local v4    # "dest":Ljava/io/FileOutputStream;
    :catchall_1
    move-exception v15

    move-object v3, v4

    .end local v4    # "dest":Ljava/io/FileOutputStream;
    .restart local v3    # "dest":Ljava/io/FileOutputStream;
    goto :goto_4

    .end local v3    # "dest":Ljava/io/FileOutputStream;
    .end local v13    # "out":Ljava/util/zip/ZipOutputStream;
    .restart local v4    # "dest":Ljava/io/FileOutputStream;
    .restart local v14    # "out":Ljava/util/zip/ZipOutputStream;
    :catchall_2
    move-exception v15

    move-object v13, v14

    .end local v14    # "out":Ljava/util/zip/ZipOutputStream;
    .restart local v13    # "out":Ljava/util/zip/ZipOutputStream;
    move-object v3, v4

    .end local v4    # "dest":Ljava/io/FileOutputStream;
    .restart local v3    # "dest":Ljava/io/FileOutputStream;
    goto :goto_4

    .end local v3    # "dest":Ljava/io/FileOutputStream;
    .end local v11    # "origin":Ljava/io/BufferedInputStream;
    .end local v13    # "out":Ljava/util/zip/ZipOutputStream;
    .restart local v2    # "data":[B
    .restart local v4    # "dest":Ljava/io/FileOutputStream;
    .restart local v7    # "f":Ljava/io/File;
    .restart local v9    # "files":[Ljava/lang/String;
    .restart local v10    # "i":I
    .restart local v12    # "origin":Ljava/io/BufferedInputStream;
    .restart local v14    # "out":Ljava/util/zip/ZipOutputStream;
    :catchall_3
    move-exception v15

    move-object v13, v14

    .end local v14    # "out":Ljava/util/zip/ZipOutputStream;
    .restart local v13    # "out":Ljava/util/zip/ZipOutputStream;
    move-object v3, v4

    .end local v4    # "dest":Ljava/io/FileOutputStream;
    .restart local v3    # "dest":Ljava/io/FileOutputStream;
    move-object v11, v12

    .end local v12    # "origin":Ljava/io/BufferedInputStream;
    .restart local v11    # "origin":Ljava/io/BufferedInputStream;
    goto :goto_4

    .line 145
    .end local v2    # "data":[B
    .end local v7    # "f":Ljava/io/File;
    .end local v9    # "files":[Ljava/lang/String;
    .end local v10    # "i":I
    .restart local v5    # "e":Ljava/lang/Exception;
    :catch_3
    move-exception v15

    goto :goto_3

    .line 132
    .end local v5    # "e":Ljava/lang/Exception;
    :catch_4
    move-exception v5

    goto :goto_2

    .end local v3    # "dest":Ljava/io/FileOutputStream;
    .restart local v4    # "dest":Ljava/io/FileOutputStream;
    :catch_5
    move-exception v5

    move-object v3, v4

    .end local v4    # "dest":Ljava/io/FileOutputStream;
    .restart local v3    # "dest":Ljava/io/FileOutputStream;
    goto :goto_2

    .end local v3    # "dest":Ljava/io/FileOutputStream;
    .end local v11    # "origin":Ljava/io/BufferedInputStream;
    .end local v13    # "out":Ljava/util/zip/ZipOutputStream;
    .restart local v2    # "data":[B
    .restart local v4    # "dest":Ljava/io/FileOutputStream;
    .restart local v7    # "f":Ljava/io/File;
    .restart local v9    # "files":[Ljava/lang/String;
    .restart local v10    # "i":I
    .restart local v12    # "origin":Ljava/io/BufferedInputStream;
    .restart local v14    # "out":Ljava/util/zip/ZipOutputStream;
    :catch_6
    move-exception v5

    move-object v13, v14

    .end local v14    # "out":Ljava/util/zip/ZipOutputStream;
    .restart local v13    # "out":Ljava/util/zip/ZipOutputStream;
    move-object v3, v4

    .end local v4    # "dest":Ljava/io/FileOutputStream;
    .restart local v3    # "dest":Ljava/io/FileOutputStream;
    move-object v11, v12

    .end local v12    # "origin":Ljava/io/BufferedInputStream;
    .restart local v11    # "origin":Ljava/io/BufferedInputStream;
    goto :goto_2
.end method
