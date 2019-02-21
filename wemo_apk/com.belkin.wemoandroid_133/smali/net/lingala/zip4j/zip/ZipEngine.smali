.class public Lnet/lingala/zip4j/zip/ZipEngine;
.super Ljava/lang/Object;
.source "ZipEngine.java"


# instance fields
.field private zipModel:Lnet/lingala/zip4j/model/ZipModel;


# direct methods
.method public constructor <init>(Lnet/lingala/zip4j/model/ZipModel;)V
    .locals 2
    .param p1, "zipModel"    # Lnet/lingala/zip4j/model/ZipModel;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lnet/lingala/zip4j/exception/ZipException;
        }
    .end annotation

    .prologue
    .line 46
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 48
    if-nez p1, :cond_0

    .line 49
    new-instance v0, Lnet/lingala/zip4j/exception/ZipException;

    const-string v1, "zip model is null in ZipEngine constructor"

    invoke-direct {v0, v1}, Lnet/lingala/zip4j/exception/ZipException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 52
    :cond_0
    iput-object p1, p0, Lnet/lingala/zip4j/zip/ZipEngine;->zipModel:Lnet/lingala/zip4j/model/ZipModel;

    .line 53
    return-void
.end method

.method static access$0(Lnet/lingala/zip4j/zip/ZipEngine;Ljava/util/ArrayList;Lnet/lingala/zip4j/model/ZipParameters;Lnet/lingala/zip4j/progress/ProgressMonitor;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lnet/lingala/zip4j/exception/ZipException;
        }
    .end annotation

    .prologue
    .line 89
    invoke-direct {p0, p1, p2, p3}, Lnet/lingala/zip4j/zip/ZipEngine;->initAddFiles(Ljava/util/ArrayList;Lnet/lingala/zip4j/model/ZipParameters;Lnet/lingala/zip4j/progress/ProgressMonitor;)V

    return-void
.end method

.method private calculateTotalWork(Ljava/util/ArrayList;Lnet/lingala/zip4j/model/ZipParameters;)J
    .locals 10
    .param p1, "fileList"    # Ljava/util/ArrayList;
    .param p2, "parameters"    # Lnet/lingala/zip4j/model/ZipParameters;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lnet/lingala/zip4j/exception/ZipException;
        }
    .end annotation

    .prologue
    .line 453
    if-nez p1, :cond_0

    .line 454
    new-instance v3, Lnet/lingala/zip4j/exception/ZipException;

    const-string v6, "file list is null, cannot calculate total work"

    invoke-direct {v3, v6}, Lnet/lingala/zip4j/exception/ZipException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 457
    :cond_0
    const-wide/16 v4, 0x0

    .line 459
    .local v4, "totalWork":J
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    move-result v3

    if-lt v1, v3, :cond_1

    .line 483
    return-wide v4

    .line 460
    :cond_1
    invoke-virtual {p1, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v3

    instance-of v3, v3, Ljava/io/File;

    if-eqz v3, :cond_2

    .line 461
    invoke-virtual {p1, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/io/File;

    invoke-virtual {v3}, Ljava/io/File;->exists()Z

    move-result v3

    if-eqz v3, :cond_2

    .line 462
    invoke-virtual {p2}, Lnet/lingala/zip4j/model/ZipParameters;->isEncryptFiles()Z

    move-result v3

    if-eqz v3, :cond_3

    .line 463
    invoke-virtual {p2}, Lnet/lingala/zip4j/model/ZipParameters;->getEncryptionMethod()I

    move-result v3

    if-nez v3, :cond_3

    .line 464
    invoke-virtual {p1, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/io/File;

    invoke-static {v3}, Lnet/lingala/zip4j/util/Zip4jUtil;->getFileLengh(Ljava/io/File;)J

    move-result-wide v6

    const-wide/16 v8, 0x2

    mul-long/2addr v6, v8

    add-long/2addr v4, v6

    .line 469
    :goto_1
    iget-object v3, p0, Lnet/lingala/zip4j/zip/ZipEngine;->zipModel:Lnet/lingala/zip4j/model/ZipModel;

    invoke-virtual {v3}, Lnet/lingala/zip4j/model/ZipModel;->getCentralDirectory()Lnet/lingala/zip4j/model/CentralDirectory;

    move-result-object v3

    if-eqz v3, :cond_2

    .line 470
    iget-object v3, p0, Lnet/lingala/zip4j/zip/ZipEngine;->zipModel:Lnet/lingala/zip4j/model/ZipModel;

    invoke-virtual {v3}, Lnet/lingala/zip4j/model/ZipModel;->getCentralDirectory()Lnet/lingala/zip4j/model/CentralDirectory;

    move-result-object v3

    invoke-virtual {v3}, Lnet/lingala/zip4j/model/CentralDirectory;->getFileHeaders()Ljava/util/ArrayList;

    move-result-object v3

    if-eqz v3, :cond_2

    .line 471
    iget-object v3, p0, Lnet/lingala/zip4j/zip/ZipEngine;->zipModel:Lnet/lingala/zip4j/model/ZipModel;

    invoke-virtual {v3}, Lnet/lingala/zip4j/model/ZipModel;->getCentralDirectory()Lnet/lingala/zip4j/model/CentralDirectory;

    move-result-object v3

    invoke-virtual {v3}, Lnet/lingala/zip4j/model/CentralDirectory;->getFileHeaders()Ljava/util/ArrayList;

    move-result-object v3

    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    move-result v3

    if-lez v3, :cond_2

    .line 473
    invoke-virtual {p1, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/io/File;

    invoke-virtual {v3}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p2}, Lnet/lingala/zip4j/model/ZipParameters;->getRootFolderInZip()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {p2}, Lnet/lingala/zip4j/model/ZipParameters;->getDefaultFolderPath()Ljava/lang/String;

    move-result-object v7

    .line 472
    invoke-static {v3, v6, v7}, Lnet/lingala/zip4j/util/Zip4jUtil;->getRelativeFileName(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 474
    .local v2, "relativeFileName":Ljava/lang/String;
    iget-object v3, p0, Lnet/lingala/zip4j/zip/ZipEngine;->zipModel:Lnet/lingala/zip4j/model/ZipModel;

    invoke-static {v3, v2}, Lnet/lingala/zip4j/util/Zip4jUtil;->getFileHeader(Lnet/lingala/zip4j/model/ZipModel;Ljava/lang/String;)Lnet/lingala/zip4j/model/FileHeader;

    move-result-object v0

    .line 475
    .local v0, "fileHeader":Lnet/lingala/zip4j/model/FileHeader;
    if-eqz v0, :cond_2

    .line 476
    new-instance v3, Ljava/io/File;

    iget-object v6, p0, Lnet/lingala/zip4j/zip/ZipEngine;->zipModel:Lnet/lingala/zip4j/model/ZipModel;

    invoke-virtual {v6}, Lnet/lingala/zip4j/model/ZipModel;->getZipFile()Ljava/lang/String;

    move-result-object v6

    invoke-direct {v3, v6}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-static {v3}, Lnet/lingala/zip4j/util/Zip4jUtil;->getFileLengh(Ljava/io/File;)J

    move-result-wide v6

    invoke-virtual {v0}, Lnet/lingala/zip4j/model/FileHeader;->getCompressedSize()J

    move-result-wide v8

    sub-long/2addr v6, v8

    add-long/2addr v4, v6

    .line 459
    .end local v0    # "fileHeader":Lnet/lingala/zip4j/model/FileHeader;
    .end local v2    # "relativeFileName":Ljava/lang/String;
    :cond_2
    add-int/lit8 v1, v1, 0x1

    goto/16 :goto_0

    .line 466
    :cond_3
    invoke-virtual {p1, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/io/File;

    invoke-static {v3}, Lnet/lingala/zip4j/util/Zip4jUtil;->getFileLengh(Ljava/io/File;)J

    move-result-wide v6

    add-long/2addr v4, v6

    goto :goto_1
.end method

.method private checkParameters(Lnet/lingala/zip4j/model/ZipParameters;)V
    .locals 3
    .param p1, "parameters"    # Lnet/lingala/zip4j/model/ZipParameters;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lnet/lingala/zip4j/exception/ZipException;
        }
    .end annotation

    .prologue
    const/16 v1, 0x8

    const/4 v2, -0x1

    .line 303
    if-nez p1, :cond_0

    .line 304
    new-instance v0, Lnet/lingala/zip4j/exception/ZipException;

    const-string v1, "cannot validate zip parameters"

    invoke-direct {v0, v1}, Lnet/lingala/zip4j/exception/ZipException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 307
    :cond_0
    invoke-virtual {p1}, Lnet/lingala/zip4j/model/ZipParameters;->getCompressionMethod()I

    move-result v0

    if-eqz v0, :cond_1

    .line 308
    invoke-virtual {p1}, Lnet/lingala/zip4j/model/ZipParameters;->getCompressionMethod()I

    move-result v0

    if-eq v0, v1, :cond_1

    .line 309
    new-instance v0, Lnet/lingala/zip4j/exception/ZipException;

    const-string v1, "unsupported compression type"

    invoke-direct {v0, v1}, Lnet/lingala/zip4j/exception/ZipException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 312
    :cond_1
    invoke-virtual {p1}, Lnet/lingala/zip4j/model/ZipParameters;->getCompressionMethod()I

    move-result v0

    if-ne v0, v1, :cond_2

    .line 313
    invoke-virtual {p1}, Lnet/lingala/zip4j/model/ZipParameters;->getCompressionLevel()I

    move-result v0

    if-gez v0, :cond_2

    invoke-virtual {p1}, Lnet/lingala/zip4j/model/ZipParameters;->getCompressionLevel()I

    move-result v0

    const/16 v1, 0x9

    if-le v0, v1, :cond_2

    .line 314
    new-instance v0, Lnet/lingala/zip4j/exception/ZipException;

    const-string v1, "invalid compression level. compression level dor deflate should be in the range of 0-9"

    invoke-direct {v0, v1}, Lnet/lingala/zip4j/exception/ZipException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 318
    :cond_2
    invoke-virtual {p1}, Lnet/lingala/zip4j/model/ZipParameters;->isEncryptFiles()Z

    move-result v0

    if-eqz v0, :cond_5

    .line 319
    invoke-virtual {p1}, Lnet/lingala/zip4j/model/ZipParameters;->getEncryptionMethod()I

    move-result v0

    if-eqz v0, :cond_3

    .line 320
    invoke-virtual {p1}, Lnet/lingala/zip4j/model/ZipParameters;->getEncryptionMethod()I

    move-result v0

    const/16 v1, 0x63

    if-eq v0, v1, :cond_3

    .line 321
    new-instance v0, Lnet/lingala/zip4j/exception/ZipException;

    const-string v1, "unsupported encryption method"

    invoke-direct {v0, v1}, Lnet/lingala/zip4j/exception/ZipException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 324
    :cond_3
    invoke-virtual {p1}, Lnet/lingala/zip4j/model/ZipParameters;->getPassword()[C

    move-result-object v0

    if-eqz v0, :cond_4

    invoke-virtual {p1}, Lnet/lingala/zip4j/model/ZipParameters;->getPassword()[C

    move-result-object v0

    array-length v0, v0

    if-gtz v0, :cond_6

    .line 325
    :cond_4
    new-instance v0, Lnet/lingala/zip4j/exception/ZipException;

    const-string v1, "input password is empty or null"

    invoke-direct {v0, v1}, Lnet/lingala/zip4j/exception/ZipException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 328
    :cond_5
    invoke-virtual {p1, v2}, Lnet/lingala/zip4j/model/ZipParameters;->setAesKeyStrength(I)V

    .line 329
    invoke-virtual {p1, v2}, Lnet/lingala/zip4j/model/ZipParameters;->setEncryptionMethod(I)V

    .line 332
    :cond_6
    return-void
.end method

.method private createEndOfCentralDirectoryRecord()Lnet/lingala/zip4j/model/EndCentralDirRecord;
    .locals 4

    .prologue
    const/4 v1, 0x0

    .line 443
    new-instance v0, Lnet/lingala/zip4j/model/EndCentralDirRecord;

    invoke-direct {v0}, Lnet/lingala/zip4j/model/EndCentralDirRecord;-><init>()V

    .line 444
    .local v0, "endCentralDirRecord":Lnet/lingala/zip4j/model/EndCentralDirRecord;
    const-wide/32 v2, 0x6054b50

    invoke-virtual {v0, v2, v3}, Lnet/lingala/zip4j/model/EndCentralDirRecord;->setSignature(J)V

    .line 445
    invoke-virtual {v0, v1}, Lnet/lingala/zip4j/model/EndCentralDirRecord;->setNoOfThisDisk(I)V

    .line 446
    invoke-virtual {v0, v1}, Lnet/lingala/zip4j/model/EndCentralDirRecord;->setTotNoOfEntriesInCentralDir(I)V

    .line 447
    invoke-virtual {v0, v1}, Lnet/lingala/zip4j/model/EndCentralDirRecord;->setTotNoOfEntriesInCentralDirOnThisDisk(I)V

    .line 448
    const-wide/16 v2, 0x0

    invoke-virtual {v0, v2, v3}, Lnet/lingala/zip4j/model/EndCentralDirRecord;->setOffsetOfStartOfCentralDir(J)V

    .line 449
    return-object v0
.end method

.method private initAddFiles(Ljava/util/ArrayList;Lnet/lingala/zip4j/model/ZipParameters;Lnet/lingala/zip4j/progress/ProgressMonitor;)V
    .locals 18
    .param p1, "fileList"    # Ljava/util/ArrayList;
    .param p2, "parameters"    # Lnet/lingala/zip4j/model/ZipParameters;
    .param p3, "progressMonitor"    # Lnet/lingala/zip4j/progress/ProgressMonitor;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lnet/lingala/zip4j/exception/ZipException;
        }
    .end annotation

    .prologue
    .line 92
    if-eqz p1, :cond_0

    if-nez p2, :cond_1

    .line 93
    :cond_0
    new-instance v13, Lnet/lingala/zip4j/exception/ZipException;

    const-string v14, "one of the input parameters is null when adding files"

    invoke-direct {v13, v14}, Lnet/lingala/zip4j/exception/ZipException;-><init>(Ljava/lang/String;)V

    throw v13

    .line 96
    :cond_1
    invoke-virtual/range {p1 .. p1}, Ljava/util/ArrayList;->size()I

    move-result v13

    if-gtz v13, :cond_2

    .line 97
    new-instance v13, Lnet/lingala/zip4j/exception/ZipException;

    const-string v14, "no files to add"

    invoke-direct {v13, v14}, Lnet/lingala/zip4j/exception/ZipException;-><init>(Ljava/lang/String;)V

    throw v13

    .line 100
    :cond_2
    move-object/from16 v0, p0

    iget-object v13, v0, Lnet/lingala/zip4j/zip/ZipEngine;->zipModel:Lnet/lingala/zip4j/model/ZipModel;

    invoke-virtual {v13}, Lnet/lingala/zip4j/model/ZipModel;->getEndCentralDirRecord()Lnet/lingala/zip4j/model/EndCentralDirRecord;

    move-result-object v13

    if-nez v13, :cond_3

    .line 101
    move-object/from16 v0, p0

    iget-object v13, v0, Lnet/lingala/zip4j/zip/ZipEngine;->zipModel:Lnet/lingala/zip4j/model/ZipModel;

    invoke-direct/range {p0 .. p0}, Lnet/lingala/zip4j/zip/ZipEngine;->createEndOfCentralDirectoryRecord()Lnet/lingala/zip4j/model/EndCentralDirRecord;

    move-result-object v14

    invoke-virtual {v13, v14}, Lnet/lingala/zip4j/model/ZipModel;->setEndCentralDirRecord(Lnet/lingala/zip4j/model/EndCentralDirRecord;)V

    .line 104
    :cond_3
    const/4 v8, 0x0

    .line 105
    .local v8, "outputStream":Lnet/lingala/zip4j/io/ZipOutputStream;
    const/4 v5, 0x0

    .line 107
    .local v5, "inputStream":Ljava/io/InputStream;
    :try_start_0
    move-object/from16 v0, p0

    move-object/from16 v1, p2

    invoke-direct {v0, v1}, Lnet/lingala/zip4j/zip/ZipEngine;->checkParameters(Lnet/lingala/zip4j/model/ZipParameters;)V

    .line 109
    invoke-direct/range {p0 .. p3}, Lnet/lingala/zip4j/zip/ZipEngine;->removeFilesIfExists(Ljava/util/ArrayList;Lnet/lingala/zip4j/model/ZipParameters;Lnet/lingala/zip4j/progress/ProgressMonitor;)V

    .line 111
    move-object/from16 v0, p0

    iget-object v13, v0, Lnet/lingala/zip4j/zip/ZipEngine;->zipModel:Lnet/lingala/zip4j/model/ZipModel;

    invoke-virtual {v13}, Lnet/lingala/zip4j/model/ZipModel;->getZipFile()Ljava/lang/String;

    move-result-object v13

    invoke-static {v13}, Lnet/lingala/zip4j/util/Zip4jUtil;->checkFileExists(Ljava/lang/String;)Z

    move-result v7

    .line 113
    .local v7, "isZipFileAlreadExists":Z
    new-instance v12, Lnet/lingala/zip4j/io/SplitOutputStream;

    new-instance v13, Ljava/io/File;

    move-object/from16 v0, p0

    iget-object v14, v0, Lnet/lingala/zip4j/zip/ZipEngine;->zipModel:Lnet/lingala/zip4j/model/ZipModel;

    invoke-virtual {v14}, Lnet/lingala/zip4j/model/ZipModel;->getZipFile()Ljava/lang/String;

    move-result-object v14

    invoke-direct {v13, v14}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    move-object/from16 v0, p0

    iget-object v14, v0, Lnet/lingala/zip4j/zip/ZipEngine;->zipModel:Lnet/lingala/zip4j/model/ZipModel;

    invoke-virtual {v14}, Lnet/lingala/zip4j/model/ZipModel;->getSplitLength()J

    move-result-wide v14

    invoke-direct {v12, v13, v14, v15}, Lnet/lingala/zip4j/io/SplitOutputStream;-><init>(Ljava/io/File;J)V

    .line 114
    .local v12, "splitOutputStream":Lnet/lingala/zip4j/io/SplitOutputStream;
    new-instance v9, Lnet/lingala/zip4j/io/ZipOutputStream;

    move-object/from16 v0, p0

    iget-object v13, v0, Lnet/lingala/zip4j/zip/ZipEngine;->zipModel:Lnet/lingala/zip4j/model/ZipModel;

    invoke-direct {v9, v12, v13}, Lnet/lingala/zip4j/io/ZipOutputStream;-><init>(Ljava/io/OutputStream;Lnet/lingala/zip4j/model/ZipModel;)V
    :try_end_0
    .catch Lnet/lingala/zip4j/exception/ZipException; {:try_start_0 .. :try_end_0} :catch_e
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_c
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 116
    .end local v8    # "outputStream":Lnet/lingala/zip4j/io/ZipOutputStream;
    .local v9, "outputStream":Lnet/lingala/zip4j/io/ZipOutputStream;
    if-eqz v7, :cond_7

    .line 117
    :try_start_1
    move-object/from16 v0, p0

    iget-object v13, v0, Lnet/lingala/zip4j/zip/ZipEngine;->zipModel:Lnet/lingala/zip4j/model/ZipModel;

    invoke-virtual {v13}, Lnet/lingala/zip4j/model/ZipModel;->getEndCentralDirRecord()Lnet/lingala/zip4j/model/EndCentralDirRecord;

    move-result-object v13

    if-nez v13, :cond_6

    .line 118
    new-instance v13, Lnet/lingala/zip4j/exception/ZipException;

    const-string v14, "invalid end of central directory record"

    invoke-direct {v13, v14}, Lnet/lingala/zip4j/exception/ZipException;-><init>(Ljava/lang/String;)V

    throw v13
    :try_end_1
    .catch Lnet/lingala/zip4j/exception/ZipException; {:try_start_1 .. :try_end_1} :catch_0
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 182
    :catch_0
    move-exception v2

    move-object v8, v9

    .line 183
    .end local v7    # "isZipFileAlreadExists":Z
    .end local v9    # "outputStream":Lnet/lingala/zip4j/io/ZipOutputStream;
    .end local v12    # "splitOutputStream":Lnet/lingala/zip4j/io/SplitOutputStream;
    .local v2, "e":Lnet/lingala/zip4j/exception/ZipException;
    .restart local v8    # "outputStream":Lnet/lingala/zip4j/io/ZipOutputStream;
    :goto_0
    :try_start_2
    move-object/from16 v0, p3

    invoke-virtual {v0, v2}, Lnet/lingala/zip4j/progress/ProgressMonitor;->endProgressMonitorError(Ljava/lang/Throwable;)V

    .line 184
    throw v2
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 188
    .end local v2    # "e":Lnet/lingala/zip4j/exception/ZipException;
    :catchall_0
    move-exception v13

    .line 189
    :goto_1
    if-eqz v5, :cond_4

    .line 191
    :try_start_3
    invoke-virtual {v5}, Ljava/io/InputStream;->close()V
    :try_end_3
    .catch Ljava/io/IOException; {:try_start_3 .. :try_end_3} :catch_8

    .line 196
    :cond_4
    :goto_2
    if-eqz v8, :cond_5

    .line 198
    :try_start_4
    invoke-virtual {v8}, Lnet/lingala/zip4j/io/ZipOutputStream;->close()V
    :try_end_4
    .catch Ljava/io/IOException; {:try_start_4 .. :try_end_4} :catch_9

    .line 202
    :cond_5
    :goto_3
    throw v13

    .line 120
    .end local v8    # "outputStream":Lnet/lingala/zip4j/io/ZipOutputStream;
    .restart local v7    # "isZipFileAlreadExists":Z
    .restart local v9    # "outputStream":Lnet/lingala/zip4j/io/ZipOutputStream;
    .restart local v12    # "splitOutputStream":Lnet/lingala/zip4j/io/SplitOutputStream;
    :cond_6
    :try_start_5
    move-object/from16 v0, p0

    iget-object v13, v0, Lnet/lingala/zip4j/zip/ZipEngine;->zipModel:Lnet/lingala/zip4j/model/ZipModel;

    invoke-virtual {v13}, Lnet/lingala/zip4j/model/ZipModel;->getEndCentralDirRecord()Lnet/lingala/zip4j/model/EndCentralDirRecord;

    move-result-object v13

    invoke-virtual {v13}, Lnet/lingala/zip4j/model/EndCentralDirRecord;->getOffsetOfStartOfCentralDir()J

    move-result-wide v14

    invoke-virtual {v12, v14, v15}, Lnet/lingala/zip4j/io/SplitOutputStream;->seek(J)V

    .line 122
    :cond_7
    const/16 v13, 0x1000

    new-array v10, v13, [B
    :try_end_5
    .catch Lnet/lingala/zip4j/exception/ZipException; {:try_start_5 .. :try_end_5} :catch_0
    .catch Ljava/lang/Exception; {:try_start_5 .. :try_end_5} :catch_1
    .catchall {:try_start_5 .. :try_end_5} :catchall_1

    .line 123
    .local v10, "readBuff":[B
    const/4 v11, -0x1

    .line 124
    .local v11, "readLen":I
    const/4 v4, 0x0

    .local v4, "i":I
    move-object v6, v5

    .end local v5    # "inputStream":Ljava/io/InputStream;
    .local v6, "inputStream":Ljava/io/InputStream;
    :goto_4
    :try_start_6
    invoke-virtual/range {p1 .. p1}, Ljava/util/ArrayList;->size()I

    move-result v13

    if-lt v4, v13, :cond_b

    .line 180
    invoke-virtual {v9}, Lnet/lingala/zip4j/io/ZipOutputStream;->finish()V

    .line 181
    invoke-virtual/range {p3 .. p3}, Lnet/lingala/zip4j/progress/ProgressMonitor;->endProgressMonitorSuccess()V
    :try_end_6
    .catch Lnet/lingala/zip4j/exception/ZipException; {:try_start_6 .. :try_end_6} :catch_f
    .catch Ljava/lang/Exception; {:try_start_6 .. :try_end_6} :catch_d
    .catchall {:try_start_6 .. :try_end_6} :catchall_2

    .line 189
    if-eqz v6, :cond_8

    .line 191
    :try_start_7
    invoke-virtual {v6}, Ljava/io/InputStream;->close()V
    :try_end_7
    .catch Ljava/io/IOException; {:try_start_7 .. :try_end_7} :catch_a

    .line 196
    :cond_8
    :goto_5
    if-eqz v9, :cond_9

    .line 198
    :try_start_8
    invoke-virtual {v9}, Lnet/lingala/zip4j/io/ZipOutputStream;->close()V
    :try_end_8
    .catch Ljava/io/IOException; {:try_start_8 .. :try_end_8} :catch_b

    :cond_9
    :goto_6
    move-object v5, v6

    .line 203
    .end local v6    # "inputStream":Ljava/io/InputStream;
    .restart local v5    # "inputStream":Ljava/io/InputStream;
    :cond_a
    :goto_7
    return-void

    .line 126
    .end local v5    # "inputStream":Ljava/io/InputStream;
    .restart local v6    # "inputStream":Ljava/io/InputStream;
    :cond_b
    :try_start_9
    invoke-virtual/range {p3 .. p3}, Lnet/lingala/zip4j/progress/ProgressMonitor;->isCancelAllTasks()Z

    move-result v13

    if-eqz v13, :cond_e

    .line 127
    const/4 v13, 0x3

    move-object/from16 v0, p3

    invoke-virtual {v0, v13}, Lnet/lingala/zip4j/progress/ProgressMonitor;->setResult(I)V

    .line 128
    const/4 v13, 0x0

    move-object/from16 v0, p3

    invoke-virtual {v0, v13}, Lnet/lingala/zip4j/progress/ProgressMonitor;->setState(I)V
    :try_end_9
    .catch Lnet/lingala/zip4j/exception/ZipException; {:try_start_9 .. :try_end_9} :catch_f
    .catch Ljava/lang/Exception; {:try_start_9 .. :try_end_9} :catch_d
    .catchall {:try_start_9 .. :try_end_9} :catchall_2

    .line 189
    if-eqz v6, :cond_c

    .line 191
    :try_start_a
    invoke-virtual {v6}, Ljava/io/InputStream;->close()V
    :try_end_a
    .catch Ljava/io/IOException; {:try_start_a .. :try_end_a} :catch_3

    .line 196
    :cond_c
    :goto_8
    if-eqz v9, :cond_d

    .line 198
    :try_start_b
    invoke-virtual {v9}, Lnet/lingala/zip4j/io/ZipOutputStream;->close()V
    :try_end_b
    .catch Ljava/io/IOException; {:try_start_b .. :try_end_b} :catch_4

    :cond_d
    :goto_9
    move-object v5, v6

    .line 129
    .end local v6    # "inputStream":Ljava/io/InputStream;
    .restart local v5    # "inputStream":Ljava/io/InputStream;
    goto :goto_7

    .line 132
    .end local v5    # "inputStream":Ljava/io/InputStream;
    .restart local v6    # "inputStream":Ljava/io/InputStream;
    :cond_e
    :try_start_c
    invoke-virtual/range {p2 .. p2}, Lnet/lingala/zip4j/model/ZipParameters;->clone()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lnet/lingala/zip4j/model/ZipParameters;

    .line 134
    .local v3, "fileParameters":Lnet/lingala/zip4j/model/ZipParameters;
    move-object/from16 v0, p1

    invoke-virtual {v0, v4}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v13

    check-cast v13, Ljava/io/File;

    invoke-virtual {v13}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v13

    move-object/from16 v0, p3

    invoke-virtual {v0, v13}, Lnet/lingala/zip4j/progress/ProgressMonitor;->setFileName(Ljava/lang/String;)V

    .line 136
    move-object/from16 v0, p1

    invoke-virtual {v0, v4}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v13

    check-cast v13, Ljava/io/File;

    invoke-virtual {v13}, Ljava/io/File;->isDirectory()Z

    move-result v13

    if-nez v13, :cond_12

    .line 137
    invoke-virtual {v3}, Lnet/lingala/zip4j/model/ZipParameters;->isEncryptFiles()Z

    move-result v13

    if-eqz v13, :cond_11

    invoke-virtual {v3}, Lnet/lingala/zip4j/model/ZipParameters;->getEncryptionMethod()I

    move-result v13

    if-nez v13, :cond_11

    .line 138
    const/4 v13, 0x3

    move-object/from16 v0, p3

    invoke-virtual {v0, v13}, Lnet/lingala/zip4j/progress/ProgressMonitor;->setCurrentOperation(I)V

    .line 139
    move-object/from16 v0, p1

    invoke-virtual {v0, v4}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v13

    check-cast v13, Ljava/io/File;

    invoke-virtual {v13}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v13

    move-object/from16 v0, p3

    invoke-static {v13, v0}, Lnet/lingala/zip4j/util/CRCUtil;->computeFileCRC(Ljava/lang/String;Lnet/lingala/zip4j/progress/ProgressMonitor;)J

    move-result-wide v14

    long-to-int v13, v14

    invoke-virtual {v3, v13}, Lnet/lingala/zip4j/model/ZipParameters;->setSourceFileCRC(I)V

    .line 140
    const/4 v13, 0x0

    move-object/from16 v0, p3

    invoke-virtual {v0, v13}, Lnet/lingala/zip4j/progress/ProgressMonitor;->setCurrentOperation(I)V

    .line 142
    invoke-virtual/range {p3 .. p3}, Lnet/lingala/zip4j/progress/ProgressMonitor;->isCancelAllTasks()Z

    move-result v13

    if-eqz v13, :cond_11

    .line 143
    const/4 v13, 0x3

    move-object/from16 v0, p3

    invoke-virtual {v0, v13}, Lnet/lingala/zip4j/progress/ProgressMonitor;->setResult(I)V

    .line 144
    const/4 v13, 0x0

    move-object/from16 v0, p3

    invoke-virtual {v0, v13}, Lnet/lingala/zip4j/progress/ProgressMonitor;->setState(I)V
    :try_end_c
    .catch Lnet/lingala/zip4j/exception/ZipException; {:try_start_c .. :try_end_c} :catch_f
    .catch Ljava/lang/Exception; {:try_start_c .. :try_end_c} :catch_d
    .catchall {:try_start_c .. :try_end_c} :catchall_2

    .line 189
    if-eqz v6, :cond_f

    .line 191
    :try_start_d
    invoke-virtual {v6}, Ljava/io/InputStream;->close()V
    :try_end_d
    .catch Ljava/io/IOException; {:try_start_d .. :try_end_d} :catch_5

    .line 196
    :cond_f
    :goto_a
    if-eqz v9, :cond_10

    .line 198
    :try_start_e
    invoke-virtual {v9}, Lnet/lingala/zip4j/io/ZipOutputStream;->close()V
    :try_end_e
    .catch Ljava/io/IOException; {:try_start_e .. :try_end_e} :catch_6

    :cond_10
    :goto_b
    move-object v5, v6

    .line 145
    .end local v6    # "inputStream":Ljava/io/InputStream;
    .restart local v5    # "inputStream":Ljava/io/InputStream;
    goto/16 :goto_7

    .line 149
    .end local v5    # "inputStream":Ljava/io/InputStream;
    .restart local v6    # "inputStream":Ljava/io/InputStream;
    :cond_11
    :try_start_f
    move-object/from16 v0, p1

    invoke-virtual {v0, v4}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v13

    check-cast v13, Ljava/io/File;

    invoke-static {v13}, Lnet/lingala/zip4j/util/Zip4jUtil;->getFileLengh(Ljava/io/File;)J

    move-result-wide v14

    const-wide/16 v16, 0x0

    cmp-long v13, v14, v16

    if-nez v13, :cond_12

    .line 150
    const/4 v13, 0x0

    invoke-virtual {v3, v13}, Lnet/lingala/zip4j/model/ZipParameters;->setCompressionMethod(I)V

    .line 154
    :cond_12
    move-object/from16 v0, p1

    invoke-virtual {v0, v4}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v13

    check-cast v13, Ljava/io/File;

    invoke-virtual {v9, v13, v3}, Lnet/lingala/zip4j/io/ZipOutputStream;->putNextEntry(Ljava/io/File;Lnet/lingala/zip4j/model/ZipParameters;)V

    .line 155
    move-object/from16 v0, p1

    invoke-virtual {v0, v4}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v13

    check-cast v13, Ljava/io/File;

    invoke-virtual {v13}, Ljava/io/File;->isDirectory()Z

    move-result v13

    if-eqz v13, :cond_14

    .line 156
    invoke-virtual {v9}, Lnet/lingala/zip4j/io/ZipOutputStream;->closeEntry()V

    move-object v5, v6

    .line 124
    .end local v6    # "inputStream":Ljava/io/InputStream;
    .restart local v5    # "inputStream":Ljava/io/InputStream;
    :cond_13
    :goto_c
    add-int/lit8 v4, v4, 0x1

    move-object v6, v5

    .end local v5    # "inputStream":Ljava/io/InputStream;
    .restart local v6    # "inputStream":Ljava/io/InputStream;
    goto/16 :goto_4

    .line 160
    :cond_14
    new-instance v5, Ljava/io/FileInputStream;

    move-object/from16 v0, p1

    invoke-virtual {v0, v4}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v13

    check-cast v13, Ljava/io/File;

    invoke-direct {v5, v13}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V
    :try_end_f
    .catch Lnet/lingala/zip4j/exception/ZipException; {:try_start_f .. :try_end_f} :catch_f
    .catch Ljava/lang/Exception; {:try_start_f .. :try_end_f} :catch_d
    .catchall {:try_start_f .. :try_end_f} :catchall_2

    .line 162
    .end local v6    # "inputStream":Ljava/io/InputStream;
    .restart local v5    # "inputStream":Ljava/io/InputStream;
    :goto_d
    :try_start_10
    invoke-virtual {v5, v10}, Ljava/io/InputStream;->read([B)I

    move-result v11

    const/4 v13, -0x1

    if-ne v11, v13, :cond_15

    .line 173
    invoke-virtual {v9}, Lnet/lingala/zip4j/io/ZipOutputStream;->closeEntry()V

    .line 175
    if-eqz v5, :cond_13

    .line 176
    invoke-virtual {v5}, Ljava/io/InputStream;->close()V
    :try_end_10
    .catch Lnet/lingala/zip4j/exception/ZipException; {:try_start_10 .. :try_end_10} :catch_0
    .catch Ljava/lang/Exception; {:try_start_10 .. :try_end_10} :catch_1
    .catchall {:try_start_10 .. :try_end_10} :catchall_1

    goto :goto_c

    .line 185
    .end local v3    # "fileParameters":Lnet/lingala/zip4j/model/ZipParameters;
    .end local v4    # "i":I
    .end local v10    # "readBuff":[B
    .end local v11    # "readLen":I
    :catch_1
    move-exception v2

    move-object v8, v9

    .line 186
    .end local v7    # "isZipFileAlreadExists":Z
    .end local v9    # "outputStream":Lnet/lingala/zip4j/io/ZipOutputStream;
    .end local v12    # "splitOutputStream":Lnet/lingala/zip4j/io/SplitOutputStream;
    .local v2, "e":Ljava/lang/Exception;
    .restart local v8    # "outputStream":Lnet/lingala/zip4j/io/ZipOutputStream;
    :goto_e
    :try_start_11
    move-object/from16 v0, p3

    invoke-virtual {v0, v2}, Lnet/lingala/zip4j/progress/ProgressMonitor;->endProgressMonitorError(Ljava/lang/Throwable;)V

    .line 187
    new-instance v13, Lnet/lingala/zip4j/exception/ZipException;

    invoke-direct {v13, v2}, Lnet/lingala/zip4j/exception/ZipException;-><init>(Ljava/lang/Throwable;)V

    throw v13
    :try_end_11
    .catchall {:try_start_11 .. :try_end_11} :catchall_0

    .line 163
    .end local v2    # "e":Ljava/lang/Exception;
    .end local v8    # "outputStream":Lnet/lingala/zip4j/io/ZipOutputStream;
    .restart local v3    # "fileParameters":Lnet/lingala/zip4j/model/ZipParameters;
    .restart local v4    # "i":I
    .restart local v7    # "isZipFileAlreadExists":Z
    .restart local v9    # "outputStream":Lnet/lingala/zip4j/io/ZipOutputStream;
    .restart local v10    # "readBuff":[B
    .restart local v11    # "readLen":I
    .restart local v12    # "splitOutputStream":Lnet/lingala/zip4j/io/SplitOutputStream;
    :cond_15
    :try_start_12
    invoke-virtual/range {p3 .. p3}, Lnet/lingala/zip4j/progress/ProgressMonitor;->isCancelAllTasks()Z

    move-result v13

    if-eqz v13, :cond_17

    .line 164
    const/4 v13, 0x3

    move-object/from16 v0, p3

    invoke-virtual {v0, v13}, Lnet/lingala/zip4j/progress/ProgressMonitor;->setResult(I)V

    .line 165
    const/4 v13, 0x0

    move-object/from16 v0, p3

    invoke-virtual {v0, v13}, Lnet/lingala/zip4j/progress/ProgressMonitor;->setState(I)V
    :try_end_12
    .catch Lnet/lingala/zip4j/exception/ZipException; {:try_start_12 .. :try_end_12} :catch_0
    .catch Ljava/lang/Exception; {:try_start_12 .. :try_end_12} :catch_1
    .catchall {:try_start_12 .. :try_end_12} :catchall_1

    .line 189
    if-eqz v5, :cond_16

    .line 191
    :try_start_13
    invoke-virtual {v5}, Ljava/io/InputStream;->close()V
    :try_end_13
    .catch Ljava/io/IOException; {:try_start_13 .. :try_end_13} :catch_7

    .line 196
    :cond_16
    :goto_f
    if-eqz v9, :cond_a

    .line 198
    :try_start_14
    invoke-virtual {v9}, Lnet/lingala/zip4j/io/ZipOutputStream;->close()V
    :try_end_14
    .catch Ljava/io/IOException; {:try_start_14 .. :try_end_14} :catch_2

    goto/16 :goto_7

    .line 199
    :catch_2
    move-exception v13

    goto/16 :goto_7

    .line 169
    :cond_17
    const/4 v13, 0x0

    :try_start_15
    invoke-virtual {v9, v10, v13, v11}, Lnet/lingala/zip4j/io/ZipOutputStream;->write([BII)V

    .line 170
    int-to-long v14, v11

    move-object/from16 v0, p3

    invoke-virtual {v0, v14, v15}, Lnet/lingala/zip4j/progress/ProgressMonitor;->updateWorkCompleted(J)V
    :try_end_15
    .catch Lnet/lingala/zip4j/exception/ZipException; {:try_start_15 .. :try_end_15} :catch_0
    .catch Ljava/lang/Exception; {:try_start_15 .. :try_end_15} :catch_1
    .catchall {:try_start_15 .. :try_end_15} :catchall_1

    goto :goto_d

    .line 188
    .end local v3    # "fileParameters":Lnet/lingala/zip4j/model/ZipParameters;
    .end local v4    # "i":I
    .end local v10    # "readBuff":[B
    .end local v11    # "readLen":I
    :catchall_1
    move-exception v13

    move-object v8, v9

    .end local v9    # "outputStream":Lnet/lingala/zip4j/io/ZipOutputStream;
    .restart local v8    # "outputStream":Lnet/lingala/zip4j/io/ZipOutputStream;
    goto/16 :goto_1

    .line 192
    .end local v5    # "inputStream":Ljava/io/InputStream;
    .end local v8    # "outputStream":Lnet/lingala/zip4j/io/ZipOutputStream;
    .restart local v4    # "i":I
    .restart local v6    # "inputStream":Ljava/io/InputStream;
    .restart local v9    # "outputStream":Lnet/lingala/zip4j/io/ZipOutputStream;
    .restart local v10    # "readBuff":[B
    .restart local v11    # "readLen":I
    :catch_3
    move-exception v13

    goto/16 :goto_8

    .line 199
    :catch_4
    move-exception v13

    goto/16 :goto_9

    .line 192
    .restart local v3    # "fileParameters":Lnet/lingala/zip4j/model/ZipParameters;
    :catch_5
    move-exception v13

    goto/16 :goto_a

    .line 199
    :catch_6
    move-exception v13

    goto/16 :goto_b

    .line 192
    .end local v6    # "inputStream":Ljava/io/InputStream;
    .restart local v5    # "inputStream":Ljava/io/InputStream;
    :catch_7
    move-exception v13

    goto :goto_f

    .end local v3    # "fileParameters":Lnet/lingala/zip4j/model/ZipParameters;
    .end local v4    # "i":I
    .end local v7    # "isZipFileAlreadExists":Z
    .end local v9    # "outputStream":Lnet/lingala/zip4j/io/ZipOutputStream;
    .end local v10    # "readBuff":[B
    .end local v11    # "readLen":I
    .end local v12    # "splitOutputStream":Lnet/lingala/zip4j/io/SplitOutputStream;
    .restart local v8    # "outputStream":Lnet/lingala/zip4j/io/ZipOutputStream;
    :catch_8
    move-exception v14

    goto/16 :goto_2

    .line 199
    :catch_9
    move-exception v14

    goto/16 :goto_3

    .line 192
    .end local v5    # "inputStream":Ljava/io/InputStream;
    .end local v8    # "outputStream":Lnet/lingala/zip4j/io/ZipOutputStream;
    .restart local v4    # "i":I
    .restart local v6    # "inputStream":Ljava/io/InputStream;
    .restart local v7    # "isZipFileAlreadExists":Z
    .restart local v9    # "outputStream":Lnet/lingala/zip4j/io/ZipOutputStream;
    .restart local v10    # "readBuff":[B
    .restart local v11    # "readLen":I
    .restart local v12    # "splitOutputStream":Lnet/lingala/zip4j/io/SplitOutputStream;
    :catch_a
    move-exception v13

    goto/16 :goto_5

    .line 199
    :catch_b
    move-exception v13

    goto/16 :goto_6

    .line 188
    :catchall_2
    move-exception v13

    move-object v5, v6

    .end local v6    # "inputStream":Ljava/io/InputStream;
    .restart local v5    # "inputStream":Ljava/io/InputStream;
    move-object v8, v9

    .end local v9    # "outputStream":Lnet/lingala/zip4j/io/ZipOutputStream;
    .restart local v8    # "outputStream":Lnet/lingala/zip4j/io/ZipOutputStream;
    goto/16 :goto_1

    .line 185
    .end local v4    # "i":I
    .end local v7    # "isZipFileAlreadExists":Z
    .end local v10    # "readBuff":[B
    .end local v11    # "readLen":I
    .end local v12    # "splitOutputStream":Lnet/lingala/zip4j/io/SplitOutputStream;
    :catch_c
    move-exception v2

    goto :goto_e

    .end local v5    # "inputStream":Ljava/io/InputStream;
    .end local v8    # "outputStream":Lnet/lingala/zip4j/io/ZipOutputStream;
    .restart local v4    # "i":I
    .restart local v6    # "inputStream":Ljava/io/InputStream;
    .restart local v7    # "isZipFileAlreadExists":Z
    .restart local v9    # "outputStream":Lnet/lingala/zip4j/io/ZipOutputStream;
    .restart local v10    # "readBuff":[B
    .restart local v11    # "readLen":I
    .restart local v12    # "splitOutputStream":Lnet/lingala/zip4j/io/SplitOutputStream;
    :catch_d
    move-exception v2

    move-object v5, v6

    .end local v6    # "inputStream":Ljava/io/InputStream;
    .restart local v5    # "inputStream":Ljava/io/InputStream;
    move-object v8, v9

    .end local v9    # "outputStream":Lnet/lingala/zip4j/io/ZipOutputStream;
    .restart local v8    # "outputStream":Lnet/lingala/zip4j/io/ZipOutputStream;
    goto :goto_e

    .line 182
    .end local v4    # "i":I
    .end local v7    # "isZipFileAlreadExists":Z
    .end local v10    # "readBuff":[B
    .end local v11    # "readLen":I
    .end local v12    # "splitOutputStream":Lnet/lingala/zip4j/io/SplitOutputStream;
    :catch_e
    move-exception v2

    goto/16 :goto_0

    .end local v5    # "inputStream":Ljava/io/InputStream;
    .end local v8    # "outputStream":Lnet/lingala/zip4j/io/ZipOutputStream;
    .restart local v4    # "i":I
    .restart local v6    # "inputStream":Ljava/io/InputStream;
    .restart local v7    # "isZipFileAlreadExists":Z
    .restart local v9    # "outputStream":Lnet/lingala/zip4j/io/ZipOutputStream;
    .restart local v10    # "readBuff":[B
    .restart local v11    # "readLen":I
    .restart local v12    # "splitOutputStream":Lnet/lingala/zip4j/io/SplitOutputStream;
    :catch_f
    move-exception v2

    move-object v5, v6

    .end local v6    # "inputStream":Ljava/io/InputStream;
    .restart local v5    # "inputStream":Ljava/io/InputStream;
    move-object v8, v9

    .end local v9    # "outputStream":Lnet/lingala/zip4j/io/ZipOutputStream;
    .restart local v8    # "outputStream":Lnet/lingala/zip4j/io/ZipOutputStream;
    goto/16 :goto_0
.end method

.method private prepareFileOutputStream()Ljava/io/RandomAccessFile;
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lnet/lingala/zip4j/exception/ZipException;
        }
    .end annotation

    .prologue
    .line 426
    iget-object v3, p0, Lnet/lingala/zip4j/zip/ZipEngine;->zipModel:Lnet/lingala/zip4j/model/ZipModel;

    invoke-virtual {v3}, Lnet/lingala/zip4j/model/ZipModel;->getZipFile()Ljava/lang/String;

    move-result-object v2

    .line 427
    .local v2, "outPath":Ljava/lang/String;
    invoke-static {v2}, Lnet/lingala/zip4j/util/Zip4jUtil;->isStringNotNullAndNotEmpty(Ljava/lang/String;)Z

    move-result v3

    if-nez v3, :cond_0

    .line 428
    new-instance v3, Lnet/lingala/zip4j/exception/ZipException;

    const-string v4, "invalid output path"

    invoke-direct {v3, v4}, Lnet/lingala/zip4j/exception/ZipException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 432
    :cond_0
    :try_start_0
    new-instance v1, Ljava/io/File;

    invoke-direct {v1, v2}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 433
    .local v1, "outFile":Ljava/io/File;
    invoke-virtual {v1}, Ljava/io/File;->getParentFile()Ljava/io/File;

    move-result-object v3

    invoke-virtual {v3}, Ljava/io/File;->exists()Z

    move-result v3

    if-nez v3, :cond_1

    .line 434
    invoke-virtual {v1}, Ljava/io/File;->getParentFile()Ljava/io/File;

    move-result-object v3

    invoke-virtual {v3}, Ljava/io/File;->mkdirs()Z

    .line 436
    :cond_1
    new-instance v3, Ljava/io/RandomAccessFile;

    const-string v4, "rw"

    invoke-direct {v3, v1, v4}, Ljava/io/RandomAccessFile;-><init>(Ljava/io/File;Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/io/FileNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    return-object v3

    .line 437
    .end local v1    # "outFile":Ljava/io/File;
    :catch_0
    move-exception v0

    .line 438
    .local v0, "e":Ljava/io/FileNotFoundException;
    new-instance v3, Lnet/lingala/zip4j/exception/ZipException;

    invoke-direct {v3, v0}, Lnet/lingala/zip4j/exception/ZipException;-><init>(Ljava/lang/Throwable;)V

    throw v3
.end method

.method private removeFilesIfExists(Ljava/util/ArrayList;Lnet/lingala/zip4j/model/ZipParameters;Lnet/lingala/zip4j/progress/ProgressMonitor;)V
    .locals 15
    .param p1, "fileList"    # Ljava/util/ArrayList;
    .param p2, "parameters"    # Lnet/lingala/zip4j/model/ZipParameters;
    .param p3, "progressMonitor"    # Lnet/lingala/zip4j/progress/ProgressMonitor;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lnet/lingala/zip4j/exception/ZipException;
        }
    .end annotation

    .prologue
    .line 347
    iget-object v12, p0, Lnet/lingala/zip4j/zip/ZipEngine;->zipModel:Lnet/lingala/zip4j/model/ZipModel;

    if-eqz v12, :cond_0

    iget-object v12, p0, Lnet/lingala/zip4j/zip/ZipEngine;->zipModel:Lnet/lingala/zip4j/model/ZipModel;

    invoke-virtual {v12}, Lnet/lingala/zip4j/model/ZipModel;->getCentralDirectory()Lnet/lingala/zip4j/model/CentralDirectory;

    move-result-object v12

    if-eqz v12, :cond_0

    .line 348
    iget-object v12, p0, Lnet/lingala/zip4j/zip/ZipEngine;->zipModel:Lnet/lingala/zip4j/model/ZipModel;

    invoke-virtual {v12}, Lnet/lingala/zip4j/model/ZipModel;->getCentralDirectory()Lnet/lingala/zip4j/model/CentralDirectory;

    move-result-object v12

    invoke-virtual {v12}, Lnet/lingala/zip4j/model/CentralDirectory;->getFileHeaders()Ljava/util/ArrayList;

    move-result-object v12

    if-eqz v12, :cond_0

    .line 349
    iget-object v12, p0, Lnet/lingala/zip4j/zip/ZipEngine;->zipModel:Lnet/lingala/zip4j/model/ZipModel;

    invoke-virtual {v12}, Lnet/lingala/zip4j/model/ZipModel;->getCentralDirectory()Lnet/lingala/zip4j/model/CentralDirectory;

    move-result-object v12

    invoke-virtual {v12}, Lnet/lingala/zip4j/model/CentralDirectory;->getFileHeaders()Ljava/util/ArrayList;

    move-result-object v12

    invoke-virtual {v12}, Ljava/util/ArrayList;->size()I

    move-result v12

    if-gtz v12, :cond_1

    .line 423
    :cond_0
    :goto_0
    return-void

    .line 353
    :cond_1
    const/4 v10, 0x0

    .line 356
    .local v10, "outputStream":Ljava/io/RandomAccessFile;
    const/4 v7, 0x0

    .local v7, "i":I
    :goto_1
    :try_start_0
    invoke-virtual/range {p1 .. p1}, Ljava/util/ArrayList;->size()I
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_3
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result v12

    if-lt v7, v12, :cond_2

    .line 415
    if-eqz v10, :cond_0

    .line 417
    :try_start_1
    invoke-virtual {v10}, Ljava/io/RandomAccessFile;->close()V
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_0

    .line 418
    :catch_0
    move-exception v12

    goto :goto_0

    .line 357
    :cond_2
    :try_start_2
    move-object/from16 v0, p1

    invoke-virtual {v0, v7}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/io/File;

    .line 359
    .local v4, "file":Ljava/io/File;
    invoke-virtual {v4}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v12

    .line 360
    invoke-virtual/range {p2 .. p2}, Lnet/lingala/zip4j/model/ZipParameters;->getRootFolderInZip()Ljava/lang/String;

    move-result-object v13

    invoke-virtual/range {p2 .. p2}, Lnet/lingala/zip4j/model/ZipParameters;->getDefaultFolderPath()Ljava/lang/String;

    move-result-object v14

    .line 359
    invoke-static {v12, v13, v14}, Lnet/lingala/zip4j/util/Zip4jUtil;->getRelativeFileName(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    .line 362
    .local v6, "fileName":Ljava/lang/String;
    iget-object v12, p0, Lnet/lingala/zip4j/zip/ZipEngine;->zipModel:Lnet/lingala/zip4j/model/ZipModel;

    invoke-static {v12, v6}, Lnet/lingala/zip4j/util/Zip4jUtil;->getFileHeader(Lnet/lingala/zip4j/model/ZipModel;Ljava/lang/String;)Lnet/lingala/zip4j/model/FileHeader;

    move-result-object v5

    .line 363
    .local v5, "fileHeader":Lnet/lingala/zip4j/model/FileHeader;
    if-eqz v5, :cond_5

    .line 365
    if-eqz v10, :cond_3

    .line 366
    invoke-virtual {v10}, Ljava/io/RandomAccessFile;->close()V

    .line 367
    const/4 v10, 0x0

    .line 370
    :cond_3
    new-instance v2, Lnet/lingala/zip4j/util/ArchiveMaintainer;

    invoke-direct {v2}, Lnet/lingala/zip4j/util/ArchiveMaintainer;-><init>()V

    .line 371
    .local v2, "archiveMaintainer":Lnet/lingala/zip4j/util/ArchiveMaintainer;
    const/4 v12, 0x2

    move-object/from16 v0, p3

    invoke-virtual {v0, v12}, Lnet/lingala/zip4j/progress/ProgressMonitor;->setCurrentOperation(I)V

    .line 372
    iget-object v12, p0, Lnet/lingala/zip4j/zip/ZipEngine;->zipModel:Lnet/lingala/zip4j/model/ZipModel;

    move-object/from16 v0, p3

    invoke-virtual {v2, v12, v5, v0}, Lnet/lingala/zip4j/util/ArchiveMaintainer;->initRemoveZipFile(Lnet/lingala/zip4j/model/ZipModel;Lnet/lingala/zip4j/model/FileHeader;Lnet/lingala/zip4j/progress/ProgressMonitor;)Ljava/util/HashMap;

    move-result-object v11

    .line 375
    .local v11, "retMap":Ljava/util/HashMap;
    invoke-virtual/range {p3 .. p3}, Lnet/lingala/zip4j/progress/ProgressMonitor;->isCancelAllTasks()Z

    move-result v12

    if-eqz v12, :cond_4

    .line 376
    const/4 v12, 0x3

    move-object/from16 v0, p3

    invoke-virtual {v0, v12}, Lnet/lingala/zip4j/progress/ProgressMonitor;->setResult(I)V

    .line 377
    const/4 v12, 0x0

    move-object/from16 v0, p3

    invoke-virtual {v0, v12}, Lnet/lingala/zip4j/progress/ProgressMonitor;->setState(I)V
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_3
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 415
    if-eqz v10, :cond_0

    .line 417
    :try_start_3
    invoke-virtual {v10}, Ljava/io/RandomAccessFile;->close()V
    :try_end_3
    .catch Ljava/io/IOException; {:try_start_3 .. :try_end_3} :catch_1

    goto :goto_0

    .line 418
    :catch_1
    move-exception v12

    goto :goto_0

    .line 382
    :cond_4
    const/4 v12, 0x0

    :try_start_4
    move-object/from16 v0, p3

    invoke-virtual {v0, v12}, Lnet/lingala/zip4j/progress/ProgressMonitor;->setCurrentOperation(I)V

    .line 384
    if-nez v10, :cond_5

    .line 385
    invoke-direct {p0}, Lnet/lingala/zip4j/zip/ZipEngine;->prepareFileOutputStream()Ljava/io/RandomAccessFile;

    move-result-object v10

    .line 387
    if-eqz v11, :cond_5

    .line 388
    const-string v12, "offsetCentralDir"

    invoke-virtual {v11, v12}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_4
    .catch Ljava/io/IOException; {:try_start_4 .. :try_end_4} :catch_3
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    move-result-object v12

    if-eqz v12, :cond_5

    .line 389
    const-wide/16 v8, -0x1

    .line 393
    .local v8, "offsetCentralDir":J
    :try_start_5
    const-string v12, "offsetCentralDir"

    invoke-virtual {v11, v12}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v12

    .line 392
    check-cast v12, Ljava/lang/String;

    invoke-static {v12}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J
    :try_end_5
    .catch Ljava/lang/NumberFormatException; {:try_start_5 .. :try_end_5} :catch_2
    .catch Ljava/lang/Exception; {:try_start_5 .. :try_end_5} :catch_4
    .catch Ljava/io/IOException; {:try_start_5 .. :try_end_5} :catch_3
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    move-result-wide v8

    .line 404
    const-wide/16 v12, 0x0

    cmp-long v12, v8, v12

    if-ltz v12, :cond_5

    .line 405
    :try_start_6
    invoke-virtual {v10, v8, v9}, Ljava/io/RandomAccessFile;->seek(J)V

    .line 356
    .end local v2    # "archiveMaintainer":Lnet/lingala/zip4j/util/ArchiveMaintainer;
    .end local v8    # "offsetCentralDir":J
    .end local v11    # "retMap":Ljava/util/HashMap;
    :cond_5
    add-int/lit8 v7, v7, 0x1

    goto/16 :goto_1

    .line 394
    .restart local v2    # "archiveMaintainer":Lnet/lingala/zip4j/util/ArchiveMaintainer;
    .restart local v8    # "offsetCentralDir":J
    .restart local v11    # "retMap":Ljava/util/HashMap;
    :catch_2
    move-exception v3

    .line 395
    .local v3, "e":Ljava/lang/NumberFormatException;
    new-instance v12, Lnet/lingala/zip4j/exception/ZipException;

    .line 396
    const-string v13, "NumberFormatException while parsing offset central directory. Cannot update already existing file header"

    .line 395
    invoke-direct {v12, v13}, Lnet/lingala/zip4j/exception/ZipException;-><init>(Ljava/lang/String;)V

    throw v12
    :try_end_6
    .catch Ljava/io/IOException; {:try_start_6 .. :try_end_6} :catch_3
    .catchall {:try_start_6 .. :try_end_6} :catchall_0

    .line 412
    .end local v2    # "archiveMaintainer":Lnet/lingala/zip4j/util/ArchiveMaintainer;
    .end local v3    # "e":Ljava/lang/NumberFormatException;
    .end local v4    # "file":Ljava/io/File;
    .end local v5    # "fileHeader":Lnet/lingala/zip4j/model/FileHeader;
    .end local v6    # "fileName":Ljava/lang/String;
    .end local v8    # "offsetCentralDir":J
    .end local v11    # "retMap":Ljava/util/HashMap;
    :catch_3
    move-exception v3

    .line 413
    .local v3, "e":Ljava/io/IOException;
    :try_start_7
    new-instance v12, Lnet/lingala/zip4j/exception/ZipException;

    invoke-direct {v12, v3}, Lnet/lingala/zip4j/exception/ZipException;-><init>(Ljava/lang/Throwable;)V

    throw v12
    :try_end_7
    .catchall {:try_start_7 .. :try_end_7} :catchall_0

    .line 414
    .end local v3    # "e":Ljava/io/IOException;
    :catchall_0
    move-exception v12

    .line 415
    if-eqz v10, :cond_6

    .line 417
    :try_start_8
    invoke-virtual {v10}, Ljava/io/RandomAccessFile;->close()V
    :try_end_8
    .catch Ljava/io/IOException; {:try_start_8 .. :try_end_8} :catch_5

    .line 422
    :cond_6
    :goto_2
    throw v12

    .line 398
    .restart local v2    # "archiveMaintainer":Lnet/lingala/zip4j/util/ArchiveMaintainer;
    .restart local v4    # "file":Ljava/io/File;
    .restart local v5    # "fileHeader":Lnet/lingala/zip4j/model/FileHeader;
    .restart local v6    # "fileName":Ljava/lang/String;
    .restart local v8    # "offsetCentralDir":J
    .restart local v11    # "retMap":Ljava/util/HashMap;
    :catch_4
    move-exception v3

    .line 399
    .local v3, "e":Ljava/lang/Exception;
    :try_start_9
    new-instance v12, Lnet/lingala/zip4j/exception/ZipException;

    .line 400
    const-string v13, "Error while parsing offset central directory. Cannot update already existing file header"

    .line 399
    invoke-direct {v12, v13}, Lnet/lingala/zip4j/exception/ZipException;-><init>(Ljava/lang/String;)V

    throw v12
    :try_end_9
    .catch Ljava/io/IOException; {:try_start_9 .. :try_end_9} :catch_3
    .catchall {:try_start_9 .. :try_end_9} :catchall_0

    .line 418
    .end local v2    # "archiveMaintainer":Lnet/lingala/zip4j/util/ArchiveMaintainer;
    .end local v3    # "e":Ljava/lang/Exception;
    .end local v4    # "file":Ljava/io/File;
    .end local v5    # "fileHeader":Lnet/lingala/zip4j/model/FileHeader;
    .end local v6    # "fileName":Ljava/lang/String;
    .end local v8    # "offsetCentralDir":J
    .end local v11    # "retMap":Ljava/util/HashMap;
    :catch_5
    move-exception v13

    goto :goto_2
.end method


# virtual methods
.method public addFiles(Ljava/util/ArrayList;Lnet/lingala/zip4j/model/ZipParameters;Lnet/lingala/zip4j/progress/ProgressMonitor;Z)V
    .locals 6
    .param p1, "fileList"    # Ljava/util/ArrayList;
    .param p2, "parameters"    # Lnet/lingala/zip4j/model/ZipParameters;
    .param p3, "progressMonitor"    # Lnet/lingala/zip4j/progress/ProgressMonitor;
    .param p4, "runInThread"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lnet/lingala/zip4j/exception/ZipException;
        }
    .end annotation

    .prologue
    const/4 v2, 0x1

    const/4 v4, 0x0

    .line 58
    if-eqz p1, :cond_0

    if-nez p2, :cond_1

    .line 59
    :cond_0
    new-instance v1, Lnet/lingala/zip4j/exception/ZipException;

    const-string v2, "one of the input parameters is null when adding files"

    invoke-direct {v1, v2}, Lnet/lingala/zip4j/exception/ZipException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 62
    :cond_1
    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    move-result v1

    if-gtz v1, :cond_2

    .line 63
    new-instance v1, Lnet/lingala/zip4j/exception/ZipException;

    const-string v2, "no files to add"

    invoke-direct {v1, v2}, Lnet/lingala/zip4j/exception/ZipException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 66
    :cond_2
    invoke-virtual {p3, v4}, Lnet/lingala/zip4j/progress/ProgressMonitor;->setCurrentOperation(I)V

    .line 67
    invoke-virtual {p3, v2}, Lnet/lingala/zip4j/progress/ProgressMonitor;->setState(I)V

    .line 68
    invoke-virtual {p3, v2}, Lnet/lingala/zip4j/progress/ProgressMonitor;->setResult(I)V

    .line 70
    if-eqz p4, :cond_3

    .line 71
    invoke-direct {p0, p1, p2}, Lnet/lingala/zip4j/zip/ZipEngine;->calculateTotalWork(Ljava/util/ArrayList;Lnet/lingala/zip4j/model/ZipParameters;)J

    move-result-wide v2

    invoke-virtual {p3, v2, v3}, Lnet/lingala/zip4j/progress/ProgressMonitor;->setTotalWork(J)V

    .line 72
    invoke-virtual {p1, v4}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/io/File;

    invoke-virtual {v1}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p3, v1}, Lnet/lingala/zip4j/progress/ProgressMonitor;->setFileName(Ljava/lang/String;)V

    .line 74
    new-instance v0, Lnet/lingala/zip4j/zip/ZipEngine$1;

    const-string v2, "Zip4j"

    move-object v1, p0

    move-object v3, p1

    move-object v4, p2

    move-object v5, p3

    invoke-direct/range {v0 .. v5}, Lnet/lingala/zip4j/zip/ZipEngine$1;-><init>(Lnet/lingala/zip4j/zip/ZipEngine;Ljava/lang/String;Ljava/util/ArrayList;Lnet/lingala/zip4j/model/ZipParameters;Lnet/lingala/zip4j/progress/ProgressMonitor;)V

    .line 82
    .local v0, "thread":Ljava/lang/Thread;
    invoke-virtual {v0}, Ljava/lang/Thread;->start()V

    .line 87
    .end local v0    # "thread":Ljava/lang/Thread;
    :goto_0
    return-void

    .line 85
    :cond_3
    invoke-direct {p0, p1, p2, p3}, Lnet/lingala/zip4j/zip/ZipEngine;->initAddFiles(Ljava/util/ArrayList;Lnet/lingala/zip4j/model/ZipParameters;Lnet/lingala/zip4j/progress/ProgressMonitor;)V

    goto :goto_0
.end method

.method public addFolderToZip(Ljava/io/File;Lnet/lingala/zip4j/model/ZipParameters;Lnet/lingala/zip4j/progress/ProgressMonitor;Z)V
    .locals 5
    .param p1, "file"    # Ljava/io/File;
    .param p2, "parameters"    # Lnet/lingala/zip4j/model/ZipParameters;
    .param p3, "progressMonitor"    # Lnet/lingala/zip4j/progress/ProgressMonitor;
    .param p4, "runInThread"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lnet/lingala/zip4j/exception/ZipException;
        }
    .end annotation

    .prologue
    .line 259
    if-eqz p1, :cond_0

    if-nez p2, :cond_1

    .line 260
    :cond_0
    new-instance v2, Lnet/lingala/zip4j/exception/ZipException;

    const-string v3, "one of the input parameters is null, cannot add folder to zip"

    invoke-direct {v2, v3}, Lnet/lingala/zip4j/exception/ZipException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 263
    :cond_1
    invoke-virtual {p1}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Lnet/lingala/zip4j/util/Zip4jUtil;->checkFileExists(Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_2

    .line 264
    new-instance v2, Lnet/lingala/zip4j/exception/ZipException;

    const-string v3, "input folder does not exist"

    invoke-direct {v2, v3}, Lnet/lingala/zip4j/exception/ZipException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 267
    :cond_2
    invoke-virtual {p1}, Ljava/io/File;->isDirectory()Z

    move-result v2

    if-nez v2, :cond_3

    .line 268
    new-instance v2, Lnet/lingala/zip4j/exception/ZipException;

    const-string v3, "input file is not a folder, user addFileToZip method to add files"

    invoke-direct {v2, v3}, Lnet/lingala/zip4j/exception/ZipException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 271
    :cond_3
    invoke-virtual {p1}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Lnet/lingala/zip4j/util/Zip4jUtil;->checkFileReadAccess(Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_4

    .line 272
    new-instance v2, Lnet/lingala/zip4j/exception/ZipException;

    new-instance v3, Ljava/lang/StringBuffer;

    const-string v4, "cannot read folder: "

    invoke-direct {v3, v4}, Ljava/lang/StringBuffer;-><init>(Ljava/lang/String;)V

    invoke-virtual {p1}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Lnet/lingala/zip4j/exception/ZipException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 275
    :cond_4
    const/4 v1, 0x0

    .line 276
    .local v1, "rootFolderPath":Ljava/lang/String;
    invoke-virtual {p2}, Lnet/lingala/zip4j/model/ZipParameters;->isIncludeRootFolder()Z

    move-result v2

    if-eqz v2, :cond_a

    .line 277
    invoke-virtual {p1}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v2

    if-eqz v2, :cond_8

    .line 278
    invoke-virtual {p1}, Ljava/io/File;->getAbsoluteFile()Ljava/io/File;

    move-result-object v2

    invoke-virtual {v2}, Ljava/io/File;->getParentFile()Ljava/io/File;

    move-result-object v2

    if-eqz v2, :cond_7

    invoke-virtual {p1}, Ljava/io/File;->getAbsoluteFile()Ljava/io/File;

    move-result-object v2

    invoke-virtual {v2}, Ljava/io/File;->getParentFile()Ljava/io/File;

    move-result-object v2

    invoke-virtual {v2}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v1

    .line 286
    :goto_0
    invoke-virtual {p2, v1}, Lnet/lingala/zip4j/model/ZipParameters;->setDefaultFolderPath(Ljava/lang/String;)V

    .line 288
    invoke-virtual {p2}, Lnet/lingala/zip4j/model/ZipParameters;->isReadHiddenFiles()Z

    move-result v2

    invoke-static {p1, v2}, Lnet/lingala/zip4j/util/Zip4jUtil;->getFilesInDirectoryRec(Ljava/io/File;Z)Ljava/util/ArrayList;

    move-result-object v0

    .line 290
    .local v0, "fileList":Ljava/util/ArrayList;
    invoke-virtual {p2}, Lnet/lingala/zip4j/model/ZipParameters;->isIncludeRootFolder()Z

    move-result v2

    if-eqz v2, :cond_6

    .line 291
    if-nez v0, :cond_5

    .line 292
    new-instance v0, Ljava/util/ArrayList;

    .end local v0    # "fileList":Ljava/util/ArrayList;
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 294
    .restart local v0    # "fileList":Ljava/util/ArrayList;
    :cond_5
    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 297
    :cond_6
    invoke-virtual {p0, v0, p2, p3, p4}, Lnet/lingala/zip4j/zip/ZipEngine;->addFiles(Ljava/util/ArrayList;Lnet/lingala/zip4j/model/ZipParameters;Lnet/lingala/zip4j/progress/ProgressMonitor;Z)V

    .line 298
    return-void

    .line 278
    .end local v0    # "fileList":Ljava/util/ArrayList;
    :cond_7
    const-string v1, ""

    goto :goto_0

    .line 280
    :cond_8
    invoke-virtual {p1}, Ljava/io/File;->getParentFile()Ljava/io/File;

    move-result-object v2

    if-eqz v2, :cond_9

    invoke-virtual {p1}, Ljava/io/File;->getParentFile()Ljava/io/File;

    move-result-object v2

    invoke-virtual {v2}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v1

    :goto_1
    goto :goto_0

    :cond_9
    const-string v1, ""

    goto :goto_1

    .line 283
    :cond_a
    invoke-virtual {p1}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v1

    goto :goto_0
.end method

.method public addStreamToZip(Ljava/io/InputStream;Lnet/lingala/zip4j/model/ZipParameters;)V
    .locals 10
    .param p1, "inputStream"    # Ljava/io/InputStream;
    .param p2, "parameters"    # Lnet/lingala/zip4j/model/ZipParameters;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lnet/lingala/zip4j/exception/ZipException;
        }
    .end annotation

    .prologue
    .line 206
    if-eqz p1, :cond_0

    if-nez p2, :cond_1

    .line 207
    :cond_0
    new-instance v7, Lnet/lingala/zip4j/exception/ZipException;

    const-string v8, "one of the input parameters is null, cannot add stream to zip"

    invoke-direct {v7, v8}, Lnet/lingala/zip4j/exception/ZipException;-><init>(Ljava/lang/String;)V

    throw v7

    .line 210
    :cond_1
    const/4 v2, 0x0

    .line 213
    .local v2, "outputStream":Lnet/lingala/zip4j/io/ZipOutputStream;
    :try_start_0
    invoke-direct {p0, p2}, Lnet/lingala/zip4j/zip/ZipEngine;->checkParameters(Lnet/lingala/zip4j/model/ZipParameters;)V

    .line 215
    iget-object v7, p0, Lnet/lingala/zip4j/zip/ZipEngine;->zipModel:Lnet/lingala/zip4j/model/ZipModel;

    invoke-virtual {v7}, Lnet/lingala/zip4j/model/ZipModel;->getZipFile()Ljava/lang/String;

    move-result-object v7

    invoke-static {v7}, Lnet/lingala/zip4j/util/Zip4jUtil;->checkFileExists(Ljava/lang/String;)Z

    move-result v1

    .line 217
    .local v1, "isZipFileAlreadExists":Z
    new-instance v6, Lnet/lingala/zip4j/io/SplitOutputStream;

    new-instance v7, Ljava/io/File;

    iget-object v8, p0, Lnet/lingala/zip4j/zip/ZipEngine;->zipModel:Lnet/lingala/zip4j/model/ZipModel;

    invoke-virtual {v8}, Lnet/lingala/zip4j/model/ZipModel;->getZipFile()Ljava/lang/String;

    move-result-object v8

    invoke-direct {v7, v8}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    iget-object v8, p0, Lnet/lingala/zip4j/zip/ZipEngine;->zipModel:Lnet/lingala/zip4j/model/ZipModel;

    invoke-virtual {v8}, Lnet/lingala/zip4j/model/ZipModel;->getSplitLength()J

    move-result-wide v8

    invoke-direct {v6, v7, v8, v9}, Lnet/lingala/zip4j/io/SplitOutputStream;-><init>(Ljava/io/File;J)V

    .line 218
    .local v6, "splitOutputStream":Lnet/lingala/zip4j/io/SplitOutputStream;
    new-instance v3, Lnet/lingala/zip4j/io/ZipOutputStream;

    iget-object v7, p0, Lnet/lingala/zip4j/zip/ZipEngine;->zipModel:Lnet/lingala/zip4j/model/ZipModel;

    invoke-direct {v3, v6, v7}, Lnet/lingala/zip4j/io/ZipOutputStream;-><init>(Ljava/io/OutputStream;Lnet/lingala/zip4j/model/ZipModel;)V
    :try_end_0
    .catch Lnet/lingala/zip4j/exception/ZipException; {:try_start_0 .. :try_end_0} :catch_5
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_4
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 220
    .end local v2    # "outputStream":Lnet/lingala/zip4j/io/ZipOutputStream;
    .local v3, "outputStream":Lnet/lingala/zip4j/io/ZipOutputStream;
    if-eqz v1, :cond_4

    .line 221
    :try_start_1
    iget-object v7, p0, Lnet/lingala/zip4j/zip/ZipEngine;->zipModel:Lnet/lingala/zip4j/model/ZipModel;

    invoke-virtual {v7}, Lnet/lingala/zip4j/model/ZipModel;->getEndCentralDirRecord()Lnet/lingala/zip4j/model/EndCentralDirRecord;

    move-result-object v7

    if-nez v7, :cond_3

    .line 222
    new-instance v7, Lnet/lingala/zip4j/exception/ZipException;

    const-string v8, "invalid end of central directory record"

    invoke-direct {v7, v8}, Lnet/lingala/zip4j/exception/ZipException;-><init>(Ljava/lang/String;)V

    throw v7
    :try_end_1
    .catch Lnet/lingala/zip4j/exception/ZipException; {:try_start_1 .. :try_end_1} :catch_0
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 242
    :catch_0
    move-exception v0

    move-object v2, v3

    .line 243
    .end local v1    # "isZipFileAlreadExists":Z
    .end local v3    # "outputStream":Lnet/lingala/zip4j/io/ZipOutputStream;
    .end local v6    # "splitOutputStream":Lnet/lingala/zip4j/io/SplitOutputStream;
    .local v0, "e":Lnet/lingala/zip4j/exception/ZipException;
    .restart local v2    # "outputStream":Lnet/lingala/zip4j/io/ZipOutputStream;
    :goto_0
    :try_start_2
    throw v0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 246
    .end local v0    # "e":Lnet/lingala/zip4j/exception/ZipException;
    :catchall_0
    move-exception v7

    .line 247
    :goto_1
    if-eqz v2, :cond_2

    .line 249
    :try_start_3
    invoke-virtual {v2}, Lnet/lingala/zip4j/io/ZipOutputStream;->close()V
    :try_end_3
    .catch Ljava/io/IOException; {:try_start_3 .. :try_end_3} :catch_2

    .line 254
    :cond_2
    :goto_2
    throw v7

    .line 224
    .end local v2    # "outputStream":Lnet/lingala/zip4j/io/ZipOutputStream;
    .restart local v1    # "isZipFileAlreadExists":Z
    .restart local v3    # "outputStream":Lnet/lingala/zip4j/io/ZipOutputStream;
    .restart local v6    # "splitOutputStream":Lnet/lingala/zip4j/io/SplitOutputStream;
    :cond_3
    :try_start_4
    iget-object v7, p0, Lnet/lingala/zip4j/zip/ZipEngine;->zipModel:Lnet/lingala/zip4j/model/ZipModel;

    invoke-virtual {v7}, Lnet/lingala/zip4j/model/ZipModel;->getEndCentralDirRecord()Lnet/lingala/zip4j/model/EndCentralDirRecord;

    move-result-object v7

    invoke-virtual {v7}, Lnet/lingala/zip4j/model/EndCentralDirRecord;->getOffsetOfStartOfCentralDir()J

    move-result-wide v8

    invoke-virtual {v6, v8, v9}, Lnet/lingala/zip4j/io/SplitOutputStream;->seek(J)V

    .line 227
    :cond_4
    const/16 v7, 0x1000

    new-array v4, v7, [B

    .line 228
    .local v4, "readBuff":[B
    const/4 v5, -0x1

    .line 230
    .local v5, "readLen":I
    const/4 v7, 0x0

    invoke-virtual {v3, v7, p2}, Lnet/lingala/zip4j/io/ZipOutputStream;->putNextEntry(Ljava/io/File;Lnet/lingala/zip4j/model/ZipParameters;)V

    .line 232
    invoke-virtual {p2}, Lnet/lingala/zip4j/model/ZipParameters;->getFileNameInZip()Ljava/lang/String;

    move-result-object v7

    const-string v8, "/"

    invoke-virtual {v7, v8}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v7

    if-nez v7, :cond_5

    .line 233
    invoke-virtual {p2}, Lnet/lingala/zip4j/model/ZipParameters;->getFileNameInZip()Ljava/lang/String;

    move-result-object v7

    const-string v8, "\\"

    invoke-virtual {v7, v8}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v7

    if-nez v7, :cond_5

    .line 234
    :goto_3
    invoke-virtual {p1, v4}, Ljava/io/InputStream;->read([B)I

    move-result v5

    const/4 v7, -0x1

    if-ne v5, v7, :cond_7

    .line 239
    :cond_5
    invoke-virtual {v3}, Lnet/lingala/zip4j/io/ZipOutputStream;->closeEntry()V

    .line 240
    invoke-virtual {v3}, Lnet/lingala/zip4j/io/ZipOutputStream;->finish()V
    :try_end_4
    .catch Lnet/lingala/zip4j/exception/ZipException; {:try_start_4 .. :try_end_4} :catch_0
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_1
    .catchall {:try_start_4 .. :try_end_4} :catchall_1

    .line 247
    if-eqz v3, :cond_6

    .line 249
    :try_start_5
    invoke-virtual {v3}, Lnet/lingala/zip4j/io/ZipOutputStream;->close()V
    :try_end_5
    .catch Ljava/io/IOException; {:try_start_5 .. :try_end_5} :catch_3

    .line 255
    :cond_6
    :goto_4
    return-void

    .line 235
    :cond_7
    const/4 v7, 0x0

    :try_start_6
    invoke-virtual {v3, v4, v7, v5}, Lnet/lingala/zip4j/io/ZipOutputStream;->write([BII)V
    :try_end_6
    .catch Lnet/lingala/zip4j/exception/ZipException; {:try_start_6 .. :try_end_6} :catch_0
    .catch Ljava/lang/Exception; {:try_start_6 .. :try_end_6} :catch_1
    .catchall {:try_start_6 .. :try_end_6} :catchall_1

    goto :goto_3

    .line 244
    .end local v4    # "readBuff":[B
    .end local v5    # "readLen":I
    :catch_1
    move-exception v0

    move-object v2, v3

    .line 245
    .end local v1    # "isZipFileAlreadExists":Z
    .end local v3    # "outputStream":Lnet/lingala/zip4j/io/ZipOutputStream;
    .end local v6    # "splitOutputStream":Lnet/lingala/zip4j/io/SplitOutputStream;
    .local v0, "e":Ljava/lang/Exception;
    .restart local v2    # "outputStream":Lnet/lingala/zip4j/io/ZipOutputStream;
    :goto_5
    :try_start_7
    new-instance v7, Lnet/lingala/zip4j/exception/ZipException;

    invoke-direct {v7, v0}, Lnet/lingala/zip4j/exception/ZipException;-><init>(Ljava/lang/Throwable;)V

    throw v7
    :try_end_7
    .catchall {:try_start_7 .. :try_end_7} :catchall_0

    .line 250
    .end local v0    # "e":Ljava/lang/Exception;
    :catch_2
    move-exception v8

    goto :goto_2

    .end local v2    # "outputStream":Lnet/lingala/zip4j/io/ZipOutputStream;
    .restart local v1    # "isZipFileAlreadExists":Z
    .restart local v3    # "outputStream":Lnet/lingala/zip4j/io/ZipOutputStream;
    .restart local v4    # "readBuff":[B
    .restart local v5    # "readLen":I
    .restart local v6    # "splitOutputStream":Lnet/lingala/zip4j/io/SplitOutputStream;
    :catch_3
    move-exception v7

    goto :goto_4

    .line 246
    .end local v4    # "readBuff":[B
    .end local v5    # "readLen":I
    :catchall_1
    move-exception v7

    move-object v2, v3

    .end local v3    # "outputStream":Lnet/lingala/zip4j/io/ZipOutputStream;
    .restart local v2    # "outputStream":Lnet/lingala/zip4j/io/ZipOutputStream;
    goto :goto_1

    .line 244
    .end local v1    # "isZipFileAlreadExists":Z
    .end local v6    # "splitOutputStream":Lnet/lingala/zip4j/io/SplitOutputStream;
    :catch_4
    move-exception v0

    goto :goto_5

    .line 242
    :catch_5
    move-exception v0

    goto :goto_0
.end method
