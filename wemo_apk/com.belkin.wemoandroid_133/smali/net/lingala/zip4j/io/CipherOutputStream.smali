.class public Lnet/lingala/zip4j/io/CipherOutputStream;
.super Lnet/lingala/zip4j/io/BaseOutputStream;
.source "CipherOutputStream.java"


# instance fields
.field private bytesWrittenForThisFile:J

.field protected crc:Ljava/util/zip/CRC32;

.field private encrypter:Lnet/lingala/zip4j/crypto/IEncrypter;

.field protected fileHeader:Lnet/lingala/zip4j/model/FileHeader;

.field protected localFileHeader:Lnet/lingala/zip4j/model/LocalFileHeader;

.field protected outputStream:Ljava/io/OutputStream;

.field private pendingBuffer:[B

.field private pendingBufferLength:I

.field private sourceFile:Ljava/io/File;

.field private totalBytesRead:J

.field private totalBytesWritten:J

.field protected zipModel:Lnet/lingala/zip4j/model/ZipModel;

.field protected zipParameters:Lnet/lingala/zip4j/model/ZipParameters;


# direct methods
.method public constructor <init>(Ljava/io/OutputStream;Lnet/lingala/zip4j/model/ZipModel;)V
    .locals 4
    .param p1, "outputStream"    # Ljava/io/OutputStream;
    .param p2, "zipModel"    # Lnet/lingala/zip4j/model/ZipModel;

    .prologue
    const-wide/16 v2, 0x0

    .line 58
    invoke-direct {p0}, Lnet/lingala/zip4j/io/BaseOutputStream;-><init>()V

    .line 59
    iput-object p1, p0, Lnet/lingala/zip4j/io/CipherOutputStream;->outputStream:Ljava/io/OutputStream;

    .line 60
    invoke-direct {p0, p2}, Lnet/lingala/zip4j/io/CipherOutputStream;->initZipModel(Lnet/lingala/zip4j/model/ZipModel;)V

    .line 61
    new-instance v0, Ljava/util/zip/CRC32;

    invoke-direct {v0}, Ljava/util/zip/CRC32;-><init>()V

    iput-object v0, p0, Lnet/lingala/zip4j/io/CipherOutputStream;->crc:Ljava/util/zip/CRC32;

    .line 62
    iput-wide v2, p0, Lnet/lingala/zip4j/io/CipherOutputStream;->totalBytesWritten:J

    .line 63
    iput-wide v2, p0, Lnet/lingala/zip4j/io/CipherOutputStream;->bytesWrittenForThisFile:J

    .line 64
    const/16 v0, 0x10

    new-array v0, v0, [B

    iput-object v0, p0, Lnet/lingala/zip4j/io/CipherOutputStream;->pendingBuffer:[B

    .line 65
    const/4 v0, 0x0

    iput v0, p0, Lnet/lingala/zip4j/io/CipherOutputStream;->pendingBufferLength:I

    .line 66
    iput-wide v2, p0, Lnet/lingala/zip4j/io/CipherOutputStream;->totalBytesRead:J

    .line 67
    return-void
.end method

.method private createFileHeader()V
    .locals 14
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lnet/lingala/zip4j/exception/ZipException;
        }
    .end annotation

    .prologue
    .line 335
    new-instance v8, Lnet/lingala/zip4j/model/FileHeader;

    invoke-direct {v8}, Lnet/lingala/zip4j/model/FileHeader;-><init>()V

    iput-object v8, p0, Lnet/lingala/zip4j/io/CipherOutputStream;->fileHeader:Lnet/lingala/zip4j/model/FileHeader;

    .line 336
    iget-object v8, p0, Lnet/lingala/zip4j/io/CipherOutputStream;->fileHeader:Lnet/lingala/zip4j/model/FileHeader;

    const v9, 0x2014b50

    invoke-virtual {v8, v9}, Lnet/lingala/zip4j/model/FileHeader;->setSignature(I)V

    .line 337
    iget-object v8, p0, Lnet/lingala/zip4j/io/CipherOutputStream;->fileHeader:Lnet/lingala/zip4j/model/FileHeader;

    const/16 v9, 0x14

    invoke-virtual {v8, v9}, Lnet/lingala/zip4j/model/FileHeader;->setVersionMadeBy(I)V

    .line 338
    iget-object v8, p0, Lnet/lingala/zip4j/io/CipherOutputStream;->fileHeader:Lnet/lingala/zip4j/model/FileHeader;

    const/16 v9, 0x14

    invoke-virtual {v8, v9}, Lnet/lingala/zip4j/model/FileHeader;->setVersionNeededToExtract(I)V

    .line 339
    iget-object v8, p0, Lnet/lingala/zip4j/io/CipherOutputStream;->zipParameters:Lnet/lingala/zip4j/model/ZipParameters;

    invoke-virtual {v8}, Lnet/lingala/zip4j/model/ZipParameters;->isEncryptFiles()Z

    move-result v8

    if-eqz v8, :cond_1

    .line 340
    iget-object v8, p0, Lnet/lingala/zip4j/io/CipherOutputStream;->zipParameters:Lnet/lingala/zip4j/model/ZipParameters;

    invoke-virtual {v8}, Lnet/lingala/zip4j/model/ZipParameters;->getEncryptionMethod()I

    move-result v8

    const/16 v9, 0x63

    if-ne v8, v9, :cond_1

    .line 341
    iget-object v8, p0, Lnet/lingala/zip4j/io/CipherOutputStream;->fileHeader:Lnet/lingala/zip4j/model/FileHeader;

    const/16 v9, 0x63

    invoke-virtual {v8, v9}, Lnet/lingala/zip4j/model/FileHeader;->setCompressionMethod(I)V

    .line 342
    iget-object v8, p0, Lnet/lingala/zip4j/io/CipherOutputStream;->fileHeader:Lnet/lingala/zip4j/model/FileHeader;

    iget-object v9, p0, Lnet/lingala/zip4j/io/CipherOutputStream;->zipParameters:Lnet/lingala/zip4j/model/ZipParameters;

    invoke-direct {p0, v9}, Lnet/lingala/zip4j/io/CipherOutputStream;->generateAESExtraDataRecord(Lnet/lingala/zip4j/model/ZipParameters;)Lnet/lingala/zip4j/model/AESExtraDataRecord;

    move-result-object v9

    invoke-virtual {v8, v9}, Lnet/lingala/zip4j/model/FileHeader;->setAesExtraDataRecord(Lnet/lingala/zip4j/model/AESExtraDataRecord;)V

    .line 346
    :goto_0
    iget-object v8, p0, Lnet/lingala/zip4j/io/CipherOutputStream;->zipParameters:Lnet/lingala/zip4j/model/ZipParameters;

    invoke-virtual {v8}, Lnet/lingala/zip4j/model/ZipParameters;->isEncryptFiles()Z

    move-result v8

    if-eqz v8, :cond_0

    .line 347
    iget-object v8, p0, Lnet/lingala/zip4j/io/CipherOutputStream;->fileHeader:Lnet/lingala/zip4j/model/FileHeader;

    const/4 v9, 0x1

    invoke-virtual {v8, v9}, Lnet/lingala/zip4j/model/FileHeader;->setEncrypted(Z)V

    .line 348
    iget-object v8, p0, Lnet/lingala/zip4j/io/CipherOutputStream;->fileHeader:Lnet/lingala/zip4j/model/FileHeader;

    iget-object v9, p0, Lnet/lingala/zip4j/io/CipherOutputStream;->zipParameters:Lnet/lingala/zip4j/model/ZipParameters;

    invoke-virtual {v9}, Lnet/lingala/zip4j/model/ZipParameters;->getEncryptionMethod()I

    move-result v9

    invoke-virtual {v8, v9}, Lnet/lingala/zip4j/model/FileHeader;->setEncryptionMethod(I)V

    .line 350
    :cond_0
    const/4 v2, 0x0

    .line 351
    .local v2, "fileName":Ljava/lang/String;
    iget-object v8, p0, Lnet/lingala/zip4j/io/CipherOutputStream;->zipParameters:Lnet/lingala/zip4j/model/ZipParameters;

    invoke-virtual {v8}, Lnet/lingala/zip4j/model/ZipParameters;->isSourceExternalStream()Z

    move-result v8

    if-eqz v8, :cond_3

    .line 352
    iget-object v8, p0, Lnet/lingala/zip4j/io/CipherOutputStream;->fileHeader:Lnet/lingala/zip4j/model/FileHeader;

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v10

    invoke-static {v10, v11}, Lnet/lingala/zip4j/util/Zip4jUtil;->javaToDosTime(J)J

    move-result-wide v10

    long-to-int v9, v10

    invoke-virtual {v8, v9}, Lnet/lingala/zip4j/model/FileHeader;->setLastModFileTime(I)V

    .line 353
    iget-object v8, p0, Lnet/lingala/zip4j/io/CipherOutputStream;->zipParameters:Lnet/lingala/zip4j/model/ZipParameters;

    invoke-virtual {v8}, Lnet/lingala/zip4j/model/ZipParameters;->getFileNameInZip()Ljava/lang/String;

    move-result-object v8

    invoke-static {v8}, Lnet/lingala/zip4j/util/Zip4jUtil;->isStringNotNullAndNotEmpty(Ljava/lang/String;)Z

    move-result v8

    if-nez v8, :cond_2

    .line 354
    new-instance v8, Lnet/lingala/zip4j/exception/ZipException;

    const-string v9, "fileNameInZip is null or empty"

    invoke-direct {v8, v9}, Lnet/lingala/zip4j/exception/ZipException;-><init>(Ljava/lang/String;)V

    throw v8

    .line 344
    .end local v2    # "fileName":Ljava/lang/String;
    :cond_1
    iget-object v8, p0, Lnet/lingala/zip4j/io/CipherOutputStream;->fileHeader:Lnet/lingala/zip4j/model/FileHeader;

    iget-object v9, p0, Lnet/lingala/zip4j/io/CipherOutputStream;->zipParameters:Lnet/lingala/zip4j/model/ZipParameters;

    invoke-virtual {v9}, Lnet/lingala/zip4j/model/ZipParameters;->getCompressionMethod()I

    move-result v9

    invoke-virtual {v8, v9}, Lnet/lingala/zip4j/model/FileHeader;->setCompressionMethod(I)V

    goto :goto_0

    .line 356
    .restart local v2    # "fileName":Ljava/lang/String;
    :cond_2
    iget-object v8, p0, Lnet/lingala/zip4j/io/CipherOutputStream;->zipParameters:Lnet/lingala/zip4j/model/ZipParameters;

    invoke-virtual {v8}, Lnet/lingala/zip4j/model/ZipParameters;->getFileNameInZip()Ljava/lang/String;

    move-result-object v2

    .line 366
    :goto_1
    invoke-static {v2}, Lnet/lingala/zip4j/util/Zip4jUtil;->isStringNotNullAndNotEmpty(Ljava/lang/String;)Z

    move-result v8

    if-nez v8, :cond_4

    .line 367
    new-instance v8, Lnet/lingala/zip4j/exception/ZipException;

    const-string v9, "fileName is null or empty. unable to create file header"

    invoke-direct {v8, v9}, Lnet/lingala/zip4j/exception/ZipException;-><init>(Ljava/lang/String;)V

    throw v8

    .line 358
    :cond_3
    iget-object v8, p0, Lnet/lingala/zip4j/io/CipherOutputStream;->fileHeader:Lnet/lingala/zip4j/model/FileHeader;

    .line 359
    iget-object v9, p0, Lnet/lingala/zip4j/io/CipherOutputStream;->sourceFile:Ljava/io/File;

    iget-object v10, p0, Lnet/lingala/zip4j/io/CipherOutputStream;->zipParameters:Lnet/lingala/zip4j/model/ZipParameters;

    invoke-virtual {v10}, Lnet/lingala/zip4j/model/ZipParameters;->getTimeZone()Ljava/util/TimeZone;

    move-result-object v10

    .line 358
    invoke-static {v9, v10}, Lnet/lingala/zip4j/util/Zip4jUtil;->getLastModifiedFileTime(Ljava/io/File;Ljava/util/TimeZone;)J

    move-result-wide v10

    invoke-static {v10, v11}, Lnet/lingala/zip4j/util/Zip4jUtil;->javaToDosTime(J)J

    move-result-wide v10

    long-to-int v9, v10

    invoke-virtual {v8, v9}, Lnet/lingala/zip4j/model/FileHeader;->setLastModFileTime(I)V

    .line 360
    iget-object v8, p0, Lnet/lingala/zip4j/io/CipherOutputStream;->fileHeader:Lnet/lingala/zip4j/model/FileHeader;

    iget-object v9, p0, Lnet/lingala/zip4j/io/CipherOutputStream;->sourceFile:Ljava/io/File;

    invoke-virtual {v9}, Ljava/io/File;->length()J

    move-result-wide v10

    invoke-virtual {v8, v10, v11}, Lnet/lingala/zip4j/model/FileHeader;->setUncompressedSize(J)V

    .line 362
    iget-object v8, p0, Lnet/lingala/zip4j/io/CipherOutputStream;->sourceFile:Ljava/io/File;

    invoke-virtual {v8}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v8

    iget-object v9, p0, Lnet/lingala/zip4j/io/CipherOutputStream;->zipParameters:Lnet/lingala/zip4j/model/ZipParameters;

    invoke-virtual {v9}, Lnet/lingala/zip4j/model/ZipParameters;->getRootFolderInZip()Ljava/lang/String;

    move-result-object v9

    iget-object v10, p0, Lnet/lingala/zip4j/io/CipherOutputStream;->zipParameters:Lnet/lingala/zip4j/model/ZipParameters;

    invoke-virtual {v10}, Lnet/lingala/zip4j/model/ZipParameters;->getDefaultFolderPath()Ljava/lang/String;

    move-result-object v10

    .line 361
    invoke-static {v8, v9, v10}, Lnet/lingala/zip4j/util/Zip4jUtil;->getRelativeFileName(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    goto :goto_1

    .line 370
    :cond_4
    iget-object v8, p0, Lnet/lingala/zip4j/io/CipherOutputStream;->fileHeader:Lnet/lingala/zip4j/model/FileHeader;

    invoke-virtual {v8, v2}, Lnet/lingala/zip4j/model/FileHeader;->setFileName(Ljava/lang/String;)V

    .line 372
    iget-object v8, p0, Lnet/lingala/zip4j/io/CipherOutputStream;->zipModel:Lnet/lingala/zip4j/model/ZipModel;

    invoke-virtual {v8}, Lnet/lingala/zip4j/model/ZipModel;->getFileNameCharset()Ljava/lang/String;

    move-result-object v8

    invoke-static {v8}, Lnet/lingala/zip4j/util/Zip4jUtil;->isStringNotNullAndNotEmpty(Ljava/lang/String;)Z

    move-result v8

    if-eqz v8, :cond_a

    .line 373
    iget-object v8, p0, Lnet/lingala/zip4j/io/CipherOutputStream;->fileHeader:Lnet/lingala/zip4j/model/FileHeader;

    .line 374
    iget-object v9, p0, Lnet/lingala/zip4j/io/CipherOutputStream;->zipModel:Lnet/lingala/zip4j/model/ZipModel;

    invoke-virtual {v9}, Lnet/lingala/zip4j/model/ZipModel;->getFileNameCharset()Ljava/lang/String;

    move-result-object v9

    .line 373
    invoke-static {v2, v9}, Lnet/lingala/zip4j/util/Zip4jUtil;->getEncodedStringLength(Ljava/lang/String;Ljava/lang/String;)I

    move-result v9

    invoke-virtual {v8, v9}, Lnet/lingala/zip4j/model/FileHeader;->setFileNameLength(I)V

    .line 379
    :goto_2
    iget-object v8, p0, Lnet/lingala/zip4j/io/CipherOutputStream;->outputStream:Ljava/io/OutputStream;

    instance-of v8, v8, Lnet/lingala/zip4j/io/SplitOutputStream;

    if-eqz v8, :cond_b

    .line 380
    iget-object v9, p0, Lnet/lingala/zip4j/io/CipherOutputStream;->fileHeader:Lnet/lingala/zip4j/model/FileHeader;

    iget-object v8, p0, Lnet/lingala/zip4j/io/CipherOutputStream;->outputStream:Ljava/io/OutputStream;

    check-cast v8, Lnet/lingala/zip4j/io/SplitOutputStream;

    invoke-virtual {v8}, Lnet/lingala/zip4j/io/SplitOutputStream;->getCurrSplitFileCounter()I

    move-result v8

    invoke-virtual {v9, v8}, Lnet/lingala/zip4j/model/FileHeader;->setDiskNumberStart(I)V

    .line 385
    :goto_3
    const/4 v1, 0x0

    .line 386
    .local v1, "fileAttrs":I
    iget-object v8, p0, Lnet/lingala/zip4j/io/CipherOutputStream;->zipParameters:Lnet/lingala/zip4j/model/ZipParameters;

    invoke-virtual {v8}, Lnet/lingala/zip4j/model/ZipParameters;->isSourceExternalStream()Z

    move-result v8

    if-nez v8, :cond_5

    .line 387
    iget-object v8, p0, Lnet/lingala/zip4j/io/CipherOutputStream;->sourceFile:Ljava/io/File;

    invoke-direct {p0, v8}, Lnet/lingala/zip4j/io/CipherOutputStream;->getFileAttributes(Ljava/io/File;)I

    move-result v1

    .line 388
    :cond_5
    const/4 v8, 0x4

    new-array v0, v8, [B

    const/4 v8, 0x0

    int-to-byte v9, v1

    aput-byte v9, v0, v8

    .line 389
    .local v0, "externalFileAttrs":[B
    iget-object v8, p0, Lnet/lingala/zip4j/io/CipherOutputStream;->fileHeader:Lnet/lingala/zip4j/model/FileHeader;

    invoke-virtual {v8, v0}, Lnet/lingala/zip4j/model/FileHeader;->setExternalFileAttr([B)V

    .line 391
    iget-object v8, p0, Lnet/lingala/zip4j/io/CipherOutputStream;->zipParameters:Lnet/lingala/zip4j/model/ZipParameters;

    invoke-virtual {v8}, Lnet/lingala/zip4j/model/ZipParameters;->isSourceExternalStream()Z

    move-result v8

    if-eqz v8, :cond_d

    .line 392
    iget-object v9, p0, Lnet/lingala/zip4j/io/CipherOutputStream;->fileHeader:Lnet/lingala/zip4j/model/FileHeader;

    const-string v8, "/"

    invoke-virtual {v2, v8}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v8

    if-nez v8, :cond_c

    const-string v8, "\\"

    invoke-virtual {v2, v8}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v8

    if-nez v8, :cond_c

    const/4 v8, 0x0

    :goto_4
    invoke-virtual {v9, v8}, Lnet/lingala/zip4j/model/FileHeader;->setDirectory(Z)V

    .line 396
    :goto_5
    iget-object v8, p0, Lnet/lingala/zip4j/io/CipherOutputStream;->fileHeader:Lnet/lingala/zip4j/model/FileHeader;

    invoke-virtual {v8}, Lnet/lingala/zip4j/model/FileHeader;->isDirectory()Z

    move-result v8

    if-eqz v8, :cond_e

    .line 397
    iget-object v8, p0, Lnet/lingala/zip4j/io/CipherOutputStream;->fileHeader:Lnet/lingala/zip4j/model/FileHeader;

    const-wide/16 v10, 0x0

    invoke-virtual {v8, v10, v11}, Lnet/lingala/zip4j/model/FileHeader;->setCompressedSize(J)V

    .line 398
    iget-object v8, p0, Lnet/lingala/zip4j/io/CipherOutputStream;->fileHeader:Lnet/lingala/zip4j/model/FileHeader;

    const-wide/16 v10, 0x0

    invoke-virtual {v8, v10, v11}, Lnet/lingala/zip4j/model/FileHeader;->setUncompressedSize(J)V

    .line 429
    :cond_6
    :goto_6
    iget-object v8, p0, Lnet/lingala/zip4j/io/CipherOutputStream;->zipParameters:Lnet/lingala/zip4j/model/ZipParameters;

    invoke-virtual {v8}, Lnet/lingala/zip4j/model/ZipParameters;->isEncryptFiles()Z

    move-result v8

    if-eqz v8, :cond_7

    .line 430
    iget-object v8, p0, Lnet/lingala/zip4j/io/CipherOutputStream;->zipParameters:Lnet/lingala/zip4j/model/ZipParameters;

    invoke-virtual {v8}, Lnet/lingala/zip4j/model/ZipParameters;->getEncryptionMethod()I

    move-result v8

    if-nez v8, :cond_7

    .line 431
    iget-object v8, p0, Lnet/lingala/zip4j/io/CipherOutputStream;->fileHeader:Lnet/lingala/zip4j/model/FileHeader;

    iget-object v9, p0, Lnet/lingala/zip4j/io/CipherOutputStream;->zipParameters:Lnet/lingala/zip4j/model/ZipParameters;

    invoke-virtual {v9}, Lnet/lingala/zip4j/model/ZipParameters;->getSourceFileCRC()I

    move-result v9

    int-to-long v10, v9

    invoke-virtual {v8, v10, v11}, Lnet/lingala/zip4j/model/FileHeader;->setCrc32(J)V

    .line 433
    :cond_7
    const/4 v8, 0x2

    new-array v7, v8, [B

    .line 434
    .local v7, "shortByte":[B
    const/4 v8, 0x0

    .line 435
    iget-object v9, p0, Lnet/lingala/zip4j/io/CipherOutputStream;->fileHeader:Lnet/lingala/zip4j/model/FileHeader;

    invoke-virtual {v9}, Lnet/lingala/zip4j/model/FileHeader;->isEncrypted()Z

    move-result v9

    iget-object v10, p0, Lnet/lingala/zip4j/io/CipherOutputStream;->zipParameters:Lnet/lingala/zip4j/model/ZipParameters;

    invoke-virtual {v10}, Lnet/lingala/zip4j/model/ZipParameters;->getCompressionMethod()I

    move-result v10

    .line 434
    invoke-direct {p0, v9, v10}, Lnet/lingala/zip4j/io/CipherOutputStream;->generateGeneralPurposeBitArray(ZI)[I

    move-result-object v9

    invoke-static {v9}, Lnet/lingala/zip4j/util/Raw;->bitArrayToByte([I)B

    move-result v9

    aput-byte v9, v7, v8

    .line 436
    iget-object v8, p0, Lnet/lingala/zip4j/io/CipherOutputStream;->zipModel:Lnet/lingala/zip4j/model/ZipModel;

    invoke-virtual {v8}, Lnet/lingala/zip4j/model/ZipModel;->getFileNameCharset()Ljava/lang/String;

    move-result-object v8

    invoke-static {v8}, Lnet/lingala/zip4j/util/Zip4jUtil;->isStringNotNullAndNotEmpty(Ljava/lang/String;)Z

    move-result v3

    .line 437
    .local v3, "isFileNameCharsetSet":Z
    if-eqz v3, :cond_8

    .line 438
    iget-object v8, p0, Lnet/lingala/zip4j/io/CipherOutputStream;->zipModel:Lnet/lingala/zip4j/model/ZipModel;

    invoke-virtual {v8}, Lnet/lingala/zip4j/model/ZipModel;->getFileNameCharset()Ljava/lang/String;

    move-result-object v8

    const-string v9, "UTF8"

    invoke-virtual {v8, v9}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v8

    if-nez v8, :cond_9

    .line 439
    :cond_8
    if-nez v3, :cond_12

    .line 440
    iget-object v8, p0, Lnet/lingala/zip4j/io/CipherOutputStream;->fileHeader:Lnet/lingala/zip4j/model/FileHeader;

    invoke-virtual {v8}, Lnet/lingala/zip4j/model/FileHeader;->getFileName()Ljava/lang/String;

    move-result-object v8

    invoke-static {v8}, Lnet/lingala/zip4j/util/Zip4jUtil;->detectCharSet(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    const-string v9, "UTF8"

    invoke-virtual {v8, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_12

    .line 441
    :cond_9
    const/4 v8, 0x1

    const/16 v9, 0x8

    aput-byte v9, v7, v8

    .line 445
    :goto_7
    iget-object v8, p0, Lnet/lingala/zip4j/io/CipherOutputStream;->fileHeader:Lnet/lingala/zip4j/model/FileHeader;

    invoke-virtual {v8, v7}, Lnet/lingala/zip4j/model/FileHeader;->setGeneralPurposeFlag([B)V

    .line 446
    return-void

    .line 376
    .end local v0    # "externalFileAttrs":[B
    .end local v1    # "fileAttrs":I
    .end local v3    # "isFileNameCharsetSet":Z
    .end local v7    # "shortByte":[B
    :cond_a
    iget-object v8, p0, Lnet/lingala/zip4j/io/CipherOutputStream;->fileHeader:Lnet/lingala/zip4j/model/FileHeader;

    invoke-static {v2}, Lnet/lingala/zip4j/util/Zip4jUtil;->getEncodedStringLength(Ljava/lang/String;)I

    move-result v9

    invoke-virtual {v8, v9}, Lnet/lingala/zip4j/model/FileHeader;->setFileNameLength(I)V

    goto/16 :goto_2

    .line 382
    :cond_b
    iget-object v8, p0, Lnet/lingala/zip4j/io/CipherOutputStream;->fileHeader:Lnet/lingala/zip4j/model/FileHeader;

    const/4 v9, 0x0

    invoke-virtual {v8, v9}, Lnet/lingala/zip4j/model/FileHeader;->setDiskNumberStart(I)V

    goto/16 :goto_3

    .line 392
    .restart local v0    # "externalFileAttrs":[B
    .restart local v1    # "fileAttrs":I
    :cond_c
    const/4 v8, 0x1

    goto/16 :goto_4

    .line 394
    :cond_d
    iget-object v8, p0, Lnet/lingala/zip4j/io/CipherOutputStream;->fileHeader:Lnet/lingala/zip4j/model/FileHeader;

    iget-object v9, p0, Lnet/lingala/zip4j/io/CipherOutputStream;->sourceFile:Ljava/io/File;

    invoke-virtual {v9}, Ljava/io/File;->isDirectory()Z

    move-result v9

    invoke-virtual {v8, v9}, Lnet/lingala/zip4j/model/FileHeader;->setDirectory(Z)V

    goto/16 :goto_5

    .line 400
    :cond_e
    iget-object v8, p0, Lnet/lingala/zip4j/io/CipherOutputStream;->zipParameters:Lnet/lingala/zip4j/model/ZipParameters;

    invoke-virtual {v8}, Lnet/lingala/zip4j/model/ZipParameters;->isSourceExternalStream()Z

    move-result v8

    if-nez v8, :cond_6

    .line 401
    iget-object v8, p0, Lnet/lingala/zip4j/io/CipherOutputStream;->sourceFile:Ljava/io/File;

    invoke-static {v8}, Lnet/lingala/zip4j/util/Zip4jUtil;->getFileLengh(Ljava/io/File;)J

    move-result-wide v4

    .line 402
    .local v4, "fileSize":J
    iget-object v8, p0, Lnet/lingala/zip4j/io/CipherOutputStream;->zipParameters:Lnet/lingala/zip4j/model/ZipParameters;

    invoke-virtual {v8}, Lnet/lingala/zip4j/model/ZipParameters;->getCompressionMethod()I

    move-result v8

    if-nez v8, :cond_11

    .line 403
    iget-object v8, p0, Lnet/lingala/zip4j/io/CipherOutputStream;->zipParameters:Lnet/lingala/zip4j/model/ZipParameters;

    invoke-virtual {v8}, Lnet/lingala/zip4j/model/ZipParameters;->getEncryptionMethod()I

    move-result v8

    if-nez v8, :cond_f

    .line 404
    iget-object v8, p0, Lnet/lingala/zip4j/io/CipherOutputStream;->fileHeader:Lnet/lingala/zip4j/model/FileHeader;

    .line 405
    const-wide/16 v10, 0xc

    add-long/2addr v10, v4

    .line 404
    invoke-virtual {v8, v10, v11}, Lnet/lingala/zip4j/model/FileHeader;->setCompressedSize(J)V

    .line 426
    :goto_8
    iget-object v8, p0, Lnet/lingala/zip4j/io/CipherOutputStream;->fileHeader:Lnet/lingala/zip4j/model/FileHeader;

    invoke-virtual {v8, v4, v5}, Lnet/lingala/zip4j/model/FileHeader;->setUncompressedSize(J)V

    goto/16 :goto_6

    .line 406
    :cond_f
    iget-object v8, p0, Lnet/lingala/zip4j/io/CipherOutputStream;->zipParameters:Lnet/lingala/zip4j/model/ZipParameters;

    invoke-virtual {v8}, Lnet/lingala/zip4j/model/ZipParameters;->getEncryptionMethod()I

    move-result v8

    const/16 v9, 0x63

    if-ne v8, v9, :cond_10

    .line 407
    const/4 v6, 0x0

    .line 408
    .local v6, "saltLength":I
    iget-object v8, p0, Lnet/lingala/zip4j/io/CipherOutputStream;->zipParameters:Lnet/lingala/zip4j/model/ZipParameters;

    invoke-virtual {v8}, Lnet/lingala/zip4j/model/ZipParameters;->getAesKeyStrength()I

    move-result v8

    packed-switch v8, :pswitch_data_0

    .line 416
    :pswitch_0
    new-instance v8, Lnet/lingala/zip4j/exception/ZipException;

    const-string v9, "invalid aes key strength, cannot determine key sizes"

    invoke-direct {v8, v9}, Lnet/lingala/zip4j/exception/ZipException;-><init>(Ljava/lang/String;)V

    throw v8

    .line 410
    :pswitch_1
    const/16 v6, 0x8

    .line 418
    :goto_9
    iget-object v8, p0, Lnet/lingala/zip4j/io/CipherOutputStream;->fileHeader:Lnet/lingala/zip4j/model/FileHeader;

    int-to-long v10, v6

    add-long/2addr v10, v4

    .line 419
    const-wide/16 v12, 0xa

    add-long/2addr v10, v12

    const-wide/16 v12, 0x2

    add-long/2addr v10, v12

    .line 418
    invoke-virtual {v8, v10, v11}, Lnet/lingala/zip4j/model/FileHeader;->setCompressedSize(J)V

    goto :goto_8

    .line 413
    :pswitch_2
    const/16 v6, 0x10

    .line 414
    goto :goto_9

    .line 421
    .end local v6    # "saltLength":I
    :cond_10
    iget-object v8, p0, Lnet/lingala/zip4j/io/CipherOutputStream;->fileHeader:Lnet/lingala/zip4j/model/FileHeader;

    const-wide/16 v10, 0x0

    invoke-virtual {v8, v10, v11}, Lnet/lingala/zip4j/model/FileHeader;->setCompressedSize(J)V

    goto :goto_8

    .line 424
    :cond_11
    iget-object v8, p0, Lnet/lingala/zip4j/io/CipherOutputStream;->fileHeader:Lnet/lingala/zip4j/model/FileHeader;

    const-wide/16 v10, 0x0

    invoke-virtual {v8, v10, v11}, Lnet/lingala/zip4j/model/FileHeader;->setCompressedSize(J)V

    goto :goto_8

    .line 443
    .end local v4    # "fileSize":J
    .restart local v3    # "isFileNameCharsetSet":Z
    .restart local v7    # "shortByte":[B
    :cond_12
    const/4 v8, 0x1

    const/4 v9, 0x0

    aput-byte v9, v7, v8

    goto/16 :goto_7

    .line 408
    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_1
        :pswitch_0
        :pswitch_2
    .end packed-switch
.end method

.method private createLocalFileHeader()V
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lnet/lingala/zip4j/exception/ZipException;
        }
    .end annotation

    .prologue
    .line 449
    iget-object v0, p0, Lnet/lingala/zip4j/io/CipherOutputStream;->fileHeader:Lnet/lingala/zip4j/model/FileHeader;

    if-nez v0, :cond_0

    .line 450
    new-instance v0, Lnet/lingala/zip4j/exception/ZipException;

    const-string v1, "file header is null, cannot create local file header"

    invoke-direct {v0, v1}, Lnet/lingala/zip4j/exception/ZipException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 452
    :cond_0
    new-instance v0, Lnet/lingala/zip4j/model/LocalFileHeader;

    invoke-direct {v0}, Lnet/lingala/zip4j/model/LocalFileHeader;-><init>()V

    iput-object v0, p0, Lnet/lingala/zip4j/io/CipherOutputStream;->localFileHeader:Lnet/lingala/zip4j/model/LocalFileHeader;

    .line 453
    iget-object v0, p0, Lnet/lingala/zip4j/io/CipherOutputStream;->localFileHeader:Lnet/lingala/zip4j/model/LocalFileHeader;

    const v1, 0x4034b50

    invoke-virtual {v0, v1}, Lnet/lingala/zip4j/model/LocalFileHeader;->setSignature(I)V

    .line 454
    iget-object v0, p0, Lnet/lingala/zip4j/io/CipherOutputStream;->localFileHeader:Lnet/lingala/zip4j/model/LocalFileHeader;

    iget-object v1, p0, Lnet/lingala/zip4j/io/CipherOutputStream;->fileHeader:Lnet/lingala/zip4j/model/FileHeader;

    invoke-virtual {v1}, Lnet/lingala/zip4j/model/FileHeader;->getVersionNeededToExtract()I

    move-result v1

    invoke-virtual {v0, v1}, Lnet/lingala/zip4j/model/LocalFileHeader;->setVersionNeededToExtract(I)V

    .line 455
    iget-object v0, p0, Lnet/lingala/zip4j/io/CipherOutputStream;->localFileHeader:Lnet/lingala/zip4j/model/LocalFileHeader;

    iget-object v1, p0, Lnet/lingala/zip4j/io/CipherOutputStream;->fileHeader:Lnet/lingala/zip4j/model/FileHeader;

    invoke-virtual {v1}, Lnet/lingala/zip4j/model/FileHeader;->getCompressionMethod()I

    move-result v1

    invoke-virtual {v0, v1}, Lnet/lingala/zip4j/model/LocalFileHeader;->setCompressionMethod(I)V

    .line 456
    iget-object v0, p0, Lnet/lingala/zip4j/io/CipherOutputStream;->localFileHeader:Lnet/lingala/zip4j/model/LocalFileHeader;

    iget-object v1, p0, Lnet/lingala/zip4j/io/CipherOutputStream;->fileHeader:Lnet/lingala/zip4j/model/FileHeader;

    invoke-virtual {v1}, Lnet/lingala/zip4j/model/FileHeader;->getLastModFileTime()I

    move-result v1

    invoke-virtual {v0, v1}, Lnet/lingala/zip4j/model/LocalFileHeader;->setLastModFileTime(I)V

    .line 457
    iget-object v0, p0, Lnet/lingala/zip4j/io/CipherOutputStream;->localFileHeader:Lnet/lingala/zip4j/model/LocalFileHeader;

    iget-object v1, p0, Lnet/lingala/zip4j/io/CipherOutputStream;->fileHeader:Lnet/lingala/zip4j/model/FileHeader;

    invoke-virtual {v1}, Lnet/lingala/zip4j/model/FileHeader;->getUncompressedSize()J

    move-result-wide v2

    invoke-virtual {v0, v2, v3}, Lnet/lingala/zip4j/model/LocalFileHeader;->setUncompressedSize(J)V

    .line 458
    iget-object v0, p0, Lnet/lingala/zip4j/io/CipherOutputStream;->localFileHeader:Lnet/lingala/zip4j/model/LocalFileHeader;

    iget-object v1, p0, Lnet/lingala/zip4j/io/CipherOutputStream;->fileHeader:Lnet/lingala/zip4j/model/FileHeader;

    invoke-virtual {v1}, Lnet/lingala/zip4j/model/FileHeader;->getFileNameLength()I

    move-result v1

    invoke-virtual {v0, v1}, Lnet/lingala/zip4j/model/LocalFileHeader;->setFileNameLength(I)V

    .line 459
    iget-object v0, p0, Lnet/lingala/zip4j/io/CipherOutputStream;->localFileHeader:Lnet/lingala/zip4j/model/LocalFileHeader;

    iget-object v1, p0, Lnet/lingala/zip4j/io/CipherOutputStream;->fileHeader:Lnet/lingala/zip4j/model/FileHeader;

    invoke-virtual {v1}, Lnet/lingala/zip4j/model/FileHeader;->getFileName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lnet/lingala/zip4j/model/LocalFileHeader;->setFileName(Ljava/lang/String;)V

    .line 460
    iget-object v0, p0, Lnet/lingala/zip4j/io/CipherOutputStream;->localFileHeader:Lnet/lingala/zip4j/model/LocalFileHeader;

    iget-object v1, p0, Lnet/lingala/zip4j/io/CipherOutputStream;->fileHeader:Lnet/lingala/zip4j/model/FileHeader;

    invoke-virtual {v1}, Lnet/lingala/zip4j/model/FileHeader;->isEncrypted()Z

    move-result v1

    invoke-virtual {v0, v1}, Lnet/lingala/zip4j/model/LocalFileHeader;->setEncrypted(Z)V

    .line 461
    iget-object v0, p0, Lnet/lingala/zip4j/io/CipherOutputStream;->localFileHeader:Lnet/lingala/zip4j/model/LocalFileHeader;

    iget-object v1, p0, Lnet/lingala/zip4j/io/CipherOutputStream;->fileHeader:Lnet/lingala/zip4j/model/FileHeader;

    invoke-virtual {v1}, Lnet/lingala/zip4j/model/FileHeader;->getEncryptionMethod()I

    move-result v1

    invoke-virtual {v0, v1}, Lnet/lingala/zip4j/model/LocalFileHeader;->setEncryptionMethod(I)V

    .line 462
    iget-object v0, p0, Lnet/lingala/zip4j/io/CipherOutputStream;->localFileHeader:Lnet/lingala/zip4j/model/LocalFileHeader;

    iget-object v1, p0, Lnet/lingala/zip4j/io/CipherOutputStream;->fileHeader:Lnet/lingala/zip4j/model/FileHeader;

    invoke-virtual {v1}, Lnet/lingala/zip4j/model/FileHeader;->getAesExtraDataRecord()Lnet/lingala/zip4j/model/AESExtraDataRecord;

    move-result-object v1

    invoke-virtual {v0, v1}, Lnet/lingala/zip4j/model/LocalFileHeader;->setAesExtraDataRecord(Lnet/lingala/zip4j/model/AESExtraDataRecord;)V

    .line 463
    iget-object v0, p0, Lnet/lingala/zip4j/io/CipherOutputStream;->localFileHeader:Lnet/lingala/zip4j/model/LocalFileHeader;

    iget-object v1, p0, Lnet/lingala/zip4j/io/CipherOutputStream;->fileHeader:Lnet/lingala/zip4j/model/FileHeader;

    invoke-virtual {v1}, Lnet/lingala/zip4j/model/FileHeader;->getCrc32()J

    move-result-wide v2

    invoke-virtual {v0, v2, v3}, Lnet/lingala/zip4j/model/LocalFileHeader;->setCrc32(J)V

    .line 464
    iget-object v0, p0, Lnet/lingala/zip4j/io/CipherOutputStream;->localFileHeader:Lnet/lingala/zip4j/model/LocalFileHeader;

    iget-object v1, p0, Lnet/lingala/zip4j/io/CipherOutputStream;->fileHeader:Lnet/lingala/zip4j/model/FileHeader;

    invoke-virtual {v1}, Lnet/lingala/zip4j/model/FileHeader;->getCompressedSize()J

    move-result-wide v2

    invoke-virtual {v0, v2, v3}, Lnet/lingala/zip4j/model/LocalFileHeader;->setCompressedSize(J)V

    .line 465
    iget-object v1, p0, Lnet/lingala/zip4j/io/CipherOutputStream;->localFileHeader:Lnet/lingala/zip4j/model/LocalFileHeader;

    iget-object v0, p0, Lnet/lingala/zip4j/io/CipherOutputStream;->fileHeader:Lnet/lingala/zip4j/model/FileHeader;

    invoke-virtual {v0}, Lnet/lingala/zip4j/model/FileHeader;->getGeneralPurposeFlag()[B

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Object;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [B

    invoke-virtual {v1, v0}, Lnet/lingala/zip4j/model/LocalFileHeader;->setGeneralPurposeFlag([B)V

    .line 466
    return-void
.end method

.method private encryptAndWrite([BII)V
    .locals 6
    .param p1, "b"    # [B
    .param p2, "off"    # I
    .param p3, "len"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 255
    iget-object v1, p0, Lnet/lingala/zip4j/io/CipherOutputStream;->encrypter:Lnet/lingala/zip4j/crypto/IEncrypter;

    if-eqz v1, :cond_0

    .line 257
    :try_start_0
    iget-object v1, p0, Lnet/lingala/zip4j/io/CipherOutputStream;->encrypter:Lnet/lingala/zip4j/crypto/IEncrypter;

    invoke-interface {v1, p1, p2, p3}, Lnet/lingala/zip4j/crypto/IEncrypter;->encryptData([BII)I
    :try_end_0
    .catch Lnet/lingala/zip4j/exception/ZipException; {:try_start_0 .. :try_end_0} :catch_0

    .line 262
    :cond_0
    iget-object v1, p0, Lnet/lingala/zip4j/io/CipherOutputStream;->outputStream:Ljava/io/OutputStream;

    invoke-virtual {v1, p1, p2, p3}, Ljava/io/OutputStream;->write([BII)V

    .line 263
    iget-wide v2, p0, Lnet/lingala/zip4j/io/CipherOutputStream;->totalBytesWritten:J

    int-to-long v4, p3

    add-long/2addr v2, v4

    iput-wide v2, p0, Lnet/lingala/zip4j/io/CipherOutputStream;->totalBytesWritten:J

    .line 264
    iget-wide v2, p0, Lnet/lingala/zip4j/io/CipherOutputStream;->bytesWrittenForThisFile:J

    int-to-long v4, p3

    add-long/2addr v2, v4

    iput-wide v2, p0, Lnet/lingala/zip4j/io/CipherOutputStream;->bytesWrittenForThisFile:J

    .line 265
    return-void

    .line 258
    :catch_0
    move-exception v0

    .line 259
    .local v0, "e":Lnet/lingala/zip4j/exception/ZipException;
    new-instance v1, Ljava/io/IOException;

    invoke-virtual {v0}, Lnet/lingala/zip4j/exception/ZipException;->getMessage()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v1
.end method

.method private generateAESExtraDataRecord(Lnet/lingala/zip4j/model/ZipParameters;)Lnet/lingala/zip4j/model/AESExtraDataRecord;
    .locals 6
    .param p1, "parameters"    # Lnet/lingala/zip4j/model/ZipParameters;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lnet/lingala/zip4j/exception/ZipException;
        }
    .end annotation

    .prologue
    const/4 v5, 0x3

    const/4 v4, 0x1

    .line 525
    if-nez p1, :cond_0

    .line 526
    new-instance v1, Lnet/lingala/zip4j/exception/ZipException;

    const-string v2, "zip parameters are null, cannot generate AES Extra Data record"

    invoke-direct {v1, v2}, Lnet/lingala/zip4j/exception/ZipException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 529
    :cond_0
    new-instance v0, Lnet/lingala/zip4j/model/AESExtraDataRecord;

    invoke-direct {v0}, Lnet/lingala/zip4j/model/AESExtraDataRecord;-><init>()V

    .line 530
    .local v0, "aesDataRecord":Lnet/lingala/zip4j/model/AESExtraDataRecord;
    const-wide/32 v2, 0x9901

    invoke-virtual {v0, v2, v3}, Lnet/lingala/zip4j/model/AESExtraDataRecord;->setSignature(J)V

    .line 531
    const/4 v1, 0x7

    invoke-virtual {v0, v1}, Lnet/lingala/zip4j/model/AESExtraDataRecord;->setDataSize(I)V

    .line 532
    const-string v1, "AE"

    invoke-virtual {v0, v1}, Lnet/lingala/zip4j/model/AESExtraDataRecord;->setVendorID(Ljava/lang/String;)V

    .line 536
    const/4 v1, 0x2

    invoke-virtual {v0, v1}, Lnet/lingala/zip4j/model/AESExtraDataRecord;->setVersionNumber(I)V

    .line 537
    invoke-virtual {p1}, Lnet/lingala/zip4j/model/ZipParameters;->getAesKeyStrength()I

    move-result v1

    if-ne v1, v4, :cond_1

    .line 538
    invoke-virtual {v0, v4}, Lnet/lingala/zip4j/model/AESExtraDataRecord;->setAesStrength(I)V

    .line 544
    :goto_0
    invoke-virtual {p1}, Lnet/lingala/zip4j/model/ZipParameters;->getCompressionMethod()I

    move-result v1

    invoke-virtual {v0, v1}, Lnet/lingala/zip4j/model/AESExtraDataRecord;->setCompressionMethod(I)V

    .line 546
    return-object v0

    .line 539
    :cond_1
    invoke-virtual {p1}, Lnet/lingala/zip4j/model/ZipParameters;->getAesKeyStrength()I

    move-result v1

    if-ne v1, v5, :cond_2

    .line 540
    invoke-virtual {v0, v5}, Lnet/lingala/zip4j/model/AESExtraDataRecord;->setAesStrength(I)V

    goto :goto_0

    .line 542
    :cond_2
    new-instance v1, Lnet/lingala/zip4j/exception/ZipException;

    const-string v2, "invalid AES key strength, cannot generate AES Extra data record"

    invoke-direct {v1, v2}, Lnet/lingala/zip4j/exception/ZipException;-><init>(Ljava/lang/String;)V

    throw v1
.end method

.method private generateGeneralPurposeBitArray(ZI)[I
    .locals 4
    .param p1, "isEncrpyted"    # Z
    .param p2, "compressionMethod"    # I

    .prologue
    const/16 v1, 0x8

    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 504
    new-array v0, v1, [I

    .line 505
    .local v0, "generalPurposeBits":[I
    if-eqz p1, :cond_1

    .line 506
    aput v3, v0, v2

    .line 511
    :goto_0
    if-eq p2, v1, :cond_0

    .line 514
    aput v2, v0, v3

    .line 515
    const/4 v1, 0x2

    aput v2, v0, v1

    .line 518
    :cond_0
    const/4 v1, 0x3

    aput v3, v0, v1

    .line 520
    return-object v0

    .line 508
    :cond_1
    aput v2, v0, v2

    goto :goto_0
.end method

.method private getFileAttributes(Ljava/io/File;)I
    .locals 2
    .param p1, "file"    # Ljava/io/File;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lnet/lingala/zip4j/exception/ZipException;
        }
    .end annotation

    .prologue
    const/4 v0, 0x0

    .line 475
    if-nez p1, :cond_0

    .line 476
    new-instance v0, Lnet/lingala/zip4j/exception/ZipException;

    const-string v1, "input file is null, cannot get file attributes"

    invoke-direct {v0, v1}, Lnet/lingala/zip4j/exception/ZipException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 479
    :cond_0
    invoke-virtual {p1}, Ljava/io/File;->exists()Z

    move-result v1

    if-nez v1, :cond_2

    .line 497
    :cond_1
    :goto_0
    return v0

    .line 483
    :cond_2
    invoke-virtual {p1}, Ljava/io/File;->isDirectory()Z

    move-result v1

    if-eqz v1, :cond_4

    .line 484
    invoke-virtual {p1}, Ljava/io/File;->isHidden()Z

    move-result v0

    if-eqz v0, :cond_3

    .line 485
    const/16 v0, 0x12

    goto :goto_0

    .line 487
    :cond_3
    const/16 v0, 0x10

    goto :goto_0

    .line 490
    :cond_4
    invoke-virtual {p1}, Ljava/io/File;->canWrite()Z

    move-result v1

    if-nez v1, :cond_5

    invoke-virtual {p1}, Ljava/io/File;->isHidden()Z

    move-result v1

    if-eqz v1, :cond_5

    .line 491
    const/4 v0, 0x3

    goto :goto_0

    .line 492
    :cond_5
    invoke-virtual {p1}, Ljava/io/File;->canWrite()Z

    move-result v1

    if-nez v1, :cond_6

    .line 493
    const/4 v0, 0x1

    goto :goto_0

    .line 494
    :cond_6
    invoke-virtual {p1}, Ljava/io/File;->isHidden()Z

    move-result v1

    if-eqz v1, :cond_1

    .line 495
    const/4 v0, 0x2

    goto :goto_0
.end method

.method private initEncrypter()V
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lnet/lingala/zip4j/exception/ZipException;
        }
    .end annotation

    .prologue
    .line 162
    iget-object v0, p0, Lnet/lingala/zip4j/io/CipherOutputStream;->zipParameters:Lnet/lingala/zip4j/model/ZipParameters;

    invoke-virtual {v0}, Lnet/lingala/zip4j/model/ZipParameters;->isEncryptFiles()Z

    move-result v0

    if-nez v0, :cond_0

    .line 163
    const/4 v0, 0x0

    iput-object v0, p0, Lnet/lingala/zip4j/io/CipherOutputStream;->encrypter:Lnet/lingala/zip4j/crypto/IEncrypter;

    .line 178
    :goto_0
    return-void

    .line 167
    :cond_0
    iget-object v0, p0, Lnet/lingala/zip4j/io/CipherOutputStream;->zipParameters:Lnet/lingala/zip4j/model/ZipParameters;

    invoke-virtual {v0}, Lnet/lingala/zip4j/model/ZipParameters;->getEncryptionMethod()I

    move-result v0

    sparse-switch v0, :sswitch_data_0

    .line 176
    new-instance v0, Lnet/lingala/zip4j/exception/ZipException;

    const-string v1, "invalid encprytion method"

    invoke-direct {v0, v1}, Lnet/lingala/zip4j/exception/ZipException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 170
    :sswitch_0
    new-instance v0, Lnet/lingala/zip4j/crypto/StandardEncrypter;

    iget-object v1, p0, Lnet/lingala/zip4j/io/CipherOutputStream;->zipParameters:Lnet/lingala/zip4j/model/ZipParameters;

    invoke-virtual {v1}, Lnet/lingala/zip4j/model/ZipParameters;->getPassword()[C

    move-result-object v1

    iget-object v2, p0, Lnet/lingala/zip4j/io/CipherOutputStream;->localFileHeader:Lnet/lingala/zip4j/model/LocalFileHeader;

    invoke-virtual {v2}, Lnet/lingala/zip4j/model/LocalFileHeader;->getLastModFileTime()I

    move-result v2

    const v3, 0xffff

    and-int/2addr v2, v3

    shl-int/lit8 v2, v2, 0x10

    invoke-direct {v0, v1, v2}, Lnet/lingala/zip4j/crypto/StandardEncrypter;-><init>([CI)V

    iput-object v0, p0, Lnet/lingala/zip4j/io/CipherOutputStream;->encrypter:Lnet/lingala/zip4j/crypto/IEncrypter;

    goto :goto_0

    .line 173
    :sswitch_1
    new-instance v0, Lnet/lingala/zip4j/crypto/AESEncrpyter;

    iget-object v1, p0, Lnet/lingala/zip4j/io/CipherOutputStream;->zipParameters:Lnet/lingala/zip4j/model/ZipParameters;

    invoke-virtual {v1}, Lnet/lingala/zip4j/model/ZipParameters;->getPassword()[C

    move-result-object v1

    iget-object v2, p0, Lnet/lingala/zip4j/io/CipherOutputStream;->zipParameters:Lnet/lingala/zip4j/model/ZipParameters;

    invoke-virtual {v2}, Lnet/lingala/zip4j/model/ZipParameters;->getAesKeyStrength()I

    move-result v2

    invoke-direct {v0, v1, v2}, Lnet/lingala/zip4j/crypto/AESEncrpyter;-><init>([CI)V

    iput-object v0, p0, Lnet/lingala/zip4j/io/CipherOutputStream;->encrypter:Lnet/lingala/zip4j/crypto/IEncrypter;

    goto :goto_0

    .line 167
    nop

    :sswitch_data_0
    .sparse-switch
        0x0 -> :sswitch_0
        0x63 -> :sswitch_1
    .end sparse-switch
.end method

.method private initZipModel(Lnet/lingala/zip4j/model/ZipModel;)V
    .locals 4
    .param p1, "zipModel"    # Lnet/lingala/zip4j/model/ZipModel;

    .prologue
    .line 181
    if-nez p1, :cond_5

    .line 182
    new-instance v0, Lnet/lingala/zip4j/model/ZipModel;

    invoke-direct {v0}, Lnet/lingala/zip4j/model/ZipModel;-><init>()V

    iput-object v0, p0, Lnet/lingala/zip4j/io/CipherOutputStream;->zipModel:Lnet/lingala/zip4j/model/ZipModel;

    .line 187
    :goto_0
    iget-object v0, p0, Lnet/lingala/zip4j/io/CipherOutputStream;->zipModel:Lnet/lingala/zip4j/model/ZipModel;

    invoke-virtual {v0}, Lnet/lingala/zip4j/model/ZipModel;->getEndCentralDirRecord()Lnet/lingala/zip4j/model/EndCentralDirRecord;

    move-result-object v0

    if-nez v0, :cond_0

    .line 188
    iget-object v0, p0, Lnet/lingala/zip4j/io/CipherOutputStream;->zipModel:Lnet/lingala/zip4j/model/ZipModel;

    new-instance v1, Lnet/lingala/zip4j/model/EndCentralDirRecord;

    invoke-direct {v1}, Lnet/lingala/zip4j/model/EndCentralDirRecord;-><init>()V

    invoke-virtual {v0, v1}, Lnet/lingala/zip4j/model/ZipModel;->setEndCentralDirRecord(Lnet/lingala/zip4j/model/EndCentralDirRecord;)V

    .line 190
    :cond_0
    iget-object v0, p0, Lnet/lingala/zip4j/io/CipherOutputStream;->zipModel:Lnet/lingala/zip4j/model/ZipModel;

    invoke-virtual {v0}, Lnet/lingala/zip4j/model/ZipModel;->getCentralDirectory()Lnet/lingala/zip4j/model/CentralDirectory;

    move-result-object v0

    if-nez v0, :cond_1

    .line 191
    iget-object v0, p0, Lnet/lingala/zip4j/io/CipherOutputStream;->zipModel:Lnet/lingala/zip4j/model/ZipModel;

    new-instance v1, Lnet/lingala/zip4j/model/CentralDirectory;

    invoke-direct {v1}, Lnet/lingala/zip4j/model/CentralDirectory;-><init>()V

    invoke-virtual {v0, v1}, Lnet/lingala/zip4j/model/ZipModel;->setCentralDirectory(Lnet/lingala/zip4j/model/CentralDirectory;)V

    .line 193
    :cond_1
    iget-object v0, p0, Lnet/lingala/zip4j/io/CipherOutputStream;->zipModel:Lnet/lingala/zip4j/model/ZipModel;

    invoke-virtual {v0}, Lnet/lingala/zip4j/model/ZipModel;->getCentralDirectory()Lnet/lingala/zip4j/model/CentralDirectory;

    move-result-object v0

    invoke-virtual {v0}, Lnet/lingala/zip4j/model/CentralDirectory;->getFileHeaders()Ljava/util/ArrayList;

    move-result-object v0

    if-nez v0, :cond_2

    .line 194
    iget-object v0, p0, Lnet/lingala/zip4j/io/CipherOutputStream;->zipModel:Lnet/lingala/zip4j/model/ZipModel;

    invoke-virtual {v0}, Lnet/lingala/zip4j/model/ZipModel;->getCentralDirectory()Lnet/lingala/zip4j/model/CentralDirectory;

    move-result-object v0

    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    invoke-virtual {v0, v1}, Lnet/lingala/zip4j/model/CentralDirectory;->setFileHeaders(Ljava/util/ArrayList;)V

    .line 196
    :cond_2
    iget-object v0, p0, Lnet/lingala/zip4j/io/CipherOutputStream;->zipModel:Lnet/lingala/zip4j/model/ZipModel;

    invoke-virtual {v0}, Lnet/lingala/zip4j/model/ZipModel;->getLocalFileHeaderList()Ljava/util/List;

    move-result-object v0

    if-nez v0, :cond_3

    .line 197
    iget-object v0, p0, Lnet/lingala/zip4j/io/CipherOutputStream;->zipModel:Lnet/lingala/zip4j/model/ZipModel;

    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    invoke-virtual {v0, v1}, Lnet/lingala/zip4j/model/ZipModel;->setLocalFileHeaderList(Ljava/util/List;)V

    .line 199
    :cond_3
    iget-object v0, p0, Lnet/lingala/zip4j/io/CipherOutputStream;->outputStream:Ljava/io/OutputStream;

    instance-of v0, v0, Lnet/lingala/zip4j/io/SplitOutputStream;

    if-eqz v0, :cond_4

    .line 200
    iget-object v0, p0, Lnet/lingala/zip4j/io/CipherOutputStream;->outputStream:Ljava/io/OutputStream;

    check-cast v0, Lnet/lingala/zip4j/io/SplitOutputStream;

    invoke-virtual {v0}, Lnet/lingala/zip4j/io/SplitOutputStream;->isSplitZipFile()Z

    move-result v0

    if-eqz v0, :cond_4

    .line 201
    iget-object v0, p0, Lnet/lingala/zip4j/io/CipherOutputStream;->zipModel:Lnet/lingala/zip4j/model/ZipModel;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Lnet/lingala/zip4j/model/ZipModel;->setSplitArchive(Z)V

    .line 202
    iget-object v1, p0, Lnet/lingala/zip4j/io/CipherOutputStream;->zipModel:Lnet/lingala/zip4j/model/ZipModel;

    iget-object v0, p0, Lnet/lingala/zip4j/io/CipherOutputStream;->outputStream:Ljava/io/OutputStream;

    check-cast v0, Lnet/lingala/zip4j/io/SplitOutputStream;

    invoke-virtual {v0}, Lnet/lingala/zip4j/io/SplitOutputStream;->getSplitLength()J

    move-result-wide v2

    invoke-virtual {v1, v2, v3}, Lnet/lingala/zip4j/model/ZipModel;->setSplitLength(J)V

    .line 206
    :cond_4
    iget-object v0, p0, Lnet/lingala/zip4j/io/CipherOutputStream;->zipModel:Lnet/lingala/zip4j/model/ZipModel;

    invoke-virtual {v0}, Lnet/lingala/zip4j/model/ZipModel;->getEndCentralDirRecord()Lnet/lingala/zip4j/model/EndCentralDirRecord;

    move-result-object v0

    const-wide/32 v2, 0x6054b50

    invoke-virtual {v0, v2, v3}, Lnet/lingala/zip4j/model/EndCentralDirRecord;->setSignature(J)V

    .line 207
    return-void

    .line 184
    :cond_5
    iput-object p1, p0, Lnet/lingala/zip4j/io/CipherOutputStream;->zipModel:Lnet/lingala/zip4j/model/ZipModel;

    goto/16 :goto_0
.end method


# virtual methods
.method public close()V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 330
    iget-object v0, p0, Lnet/lingala/zip4j/io/CipherOutputStream;->outputStream:Ljava/io/OutputStream;

    if-eqz v0, :cond_0

    .line 331
    iget-object v0, p0, Lnet/lingala/zip4j/io/CipherOutputStream;->outputStream:Ljava/io/OutputStream;

    invoke-virtual {v0}, Ljava/io/OutputStream;->close()V

    .line 332
    :cond_0
    return-void
.end method

.method public closeEntry()V
    .locals 11
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lnet/lingala/zip4j/exception/ZipException;
        }
    .end annotation

    .prologue
    const-wide/16 v6, 0xa

    const/4 v5, 0x0

    const/16 v10, 0x63

    const-wide/16 v8, 0x0

    .line 269
    iget v3, p0, Lnet/lingala/zip4j/io/CipherOutputStream;->pendingBufferLength:I

    if-eqz v3, :cond_0

    .line 270
    iget-object v3, p0, Lnet/lingala/zip4j/io/CipherOutputStream;->pendingBuffer:[B

    iget v4, p0, Lnet/lingala/zip4j/io/CipherOutputStream;->pendingBufferLength:I

    invoke-direct {p0, v3, v5, v4}, Lnet/lingala/zip4j/io/CipherOutputStream;->encryptAndWrite([BII)V

    .line 271
    iput v5, p0, Lnet/lingala/zip4j/io/CipherOutputStream;->pendingBufferLength:I

    .line 274
    :cond_0
    iget-object v3, p0, Lnet/lingala/zip4j/io/CipherOutputStream;->zipParameters:Lnet/lingala/zip4j/model/ZipParameters;

    invoke-virtual {v3}, Lnet/lingala/zip4j/model/ZipParameters;->isEncryptFiles()Z

    move-result v3

    if-eqz v3, :cond_1

    .line 275
    iget-object v3, p0, Lnet/lingala/zip4j/io/CipherOutputStream;->zipParameters:Lnet/lingala/zip4j/model/ZipParameters;

    invoke-virtual {v3}, Lnet/lingala/zip4j/model/ZipParameters;->getEncryptionMethod()I

    move-result v3

    if-ne v3, v10, :cond_1

    .line 276
    iget-object v3, p0, Lnet/lingala/zip4j/io/CipherOutputStream;->encrypter:Lnet/lingala/zip4j/crypto/IEncrypter;

    instance-of v3, v3, Lnet/lingala/zip4j/crypto/AESEncrpyter;

    if-eqz v3, :cond_4

    .line 277
    iget-object v4, p0, Lnet/lingala/zip4j/io/CipherOutputStream;->outputStream:Ljava/io/OutputStream;

    iget-object v3, p0, Lnet/lingala/zip4j/io/CipherOutputStream;->encrypter:Lnet/lingala/zip4j/crypto/IEncrypter;

    check-cast v3, Lnet/lingala/zip4j/crypto/AESEncrpyter;

    invoke-virtual {v3}, Lnet/lingala/zip4j/crypto/AESEncrpyter;->getFinalMac()[B

    move-result-object v3

    invoke-virtual {v4, v3}, Ljava/io/OutputStream;->write([B)V

    .line 278
    iget-wide v4, p0, Lnet/lingala/zip4j/io/CipherOutputStream;->bytesWrittenForThisFile:J

    add-long/2addr v4, v6

    iput-wide v4, p0, Lnet/lingala/zip4j/io/CipherOutputStream;->bytesWrittenForThisFile:J

    .line 279
    iget-wide v4, p0, Lnet/lingala/zip4j/io/CipherOutputStream;->totalBytesWritten:J

    add-long/2addr v4, v6

    iput-wide v4, p0, Lnet/lingala/zip4j/io/CipherOutputStream;->totalBytesWritten:J

    .line 284
    :cond_1
    iget-object v3, p0, Lnet/lingala/zip4j/io/CipherOutputStream;->fileHeader:Lnet/lingala/zip4j/model/FileHeader;

    iget-wide v4, p0, Lnet/lingala/zip4j/io/CipherOutputStream;->bytesWrittenForThisFile:J

    invoke-virtual {v3, v4, v5}, Lnet/lingala/zip4j/model/FileHeader;->setCompressedSize(J)V

    .line 285
    iget-object v3, p0, Lnet/lingala/zip4j/io/CipherOutputStream;->localFileHeader:Lnet/lingala/zip4j/model/LocalFileHeader;

    iget-wide v4, p0, Lnet/lingala/zip4j/io/CipherOutputStream;->bytesWrittenForThisFile:J

    invoke-virtual {v3, v4, v5}, Lnet/lingala/zip4j/model/LocalFileHeader;->setCompressedSize(J)V

    .line 287
    iget-object v3, p0, Lnet/lingala/zip4j/io/CipherOutputStream;->zipParameters:Lnet/lingala/zip4j/model/ZipParameters;

    invoke-virtual {v3}, Lnet/lingala/zip4j/model/ZipParameters;->isSourceExternalStream()Z

    move-result v3

    if-eqz v3, :cond_2

    .line 288
    iget-object v3, p0, Lnet/lingala/zip4j/io/CipherOutputStream;->fileHeader:Lnet/lingala/zip4j/model/FileHeader;

    iget-wide v4, p0, Lnet/lingala/zip4j/io/CipherOutputStream;->totalBytesRead:J

    invoke-virtual {v3, v4, v5}, Lnet/lingala/zip4j/model/FileHeader;->setUncompressedSize(J)V

    .line 289
    iget-object v3, p0, Lnet/lingala/zip4j/io/CipherOutputStream;->localFileHeader:Lnet/lingala/zip4j/model/LocalFileHeader;

    invoke-virtual {v3}, Lnet/lingala/zip4j/model/LocalFileHeader;->getUncompressedSize()J

    move-result-wide v4

    iget-wide v6, p0, Lnet/lingala/zip4j/io/CipherOutputStream;->totalBytesRead:J

    cmp-long v3, v4, v6

    if-eqz v3, :cond_2

    .line 290
    iget-object v3, p0, Lnet/lingala/zip4j/io/CipherOutputStream;->localFileHeader:Lnet/lingala/zip4j/model/LocalFileHeader;

    iget-wide v4, p0, Lnet/lingala/zip4j/io/CipherOutputStream;->totalBytesRead:J

    invoke-virtual {v3, v4, v5}, Lnet/lingala/zip4j/model/LocalFileHeader;->setUncompressedSize(J)V

    .line 294
    :cond_2
    iget-object v3, p0, Lnet/lingala/zip4j/io/CipherOutputStream;->crc:Ljava/util/zip/CRC32;

    invoke-virtual {v3}, Ljava/util/zip/CRC32;->getValue()J

    move-result-wide v0

    .line 295
    .local v0, "crc32":J
    iget-object v3, p0, Lnet/lingala/zip4j/io/CipherOutputStream;->fileHeader:Lnet/lingala/zip4j/model/FileHeader;

    invoke-virtual {v3}, Lnet/lingala/zip4j/model/FileHeader;->isEncrypted()Z

    move-result v3

    if-eqz v3, :cond_3

    .line 296
    iget-object v3, p0, Lnet/lingala/zip4j/io/CipherOutputStream;->fileHeader:Lnet/lingala/zip4j/model/FileHeader;

    invoke-virtual {v3}, Lnet/lingala/zip4j/model/FileHeader;->getEncryptionMethod()I

    move-result v3

    if-ne v3, v10, :cond_3

    .line 297
    const-wide/16 v0, 0x0

    .line 301
    :cond_3
    iget-object v3, p0, Lnet/lingala/zip4j/io/CipherOutputStream;->zipParameters:Lnet/lingala/zip4j/model/ZipParameters;

    invoke-virtual {v3}, Lnet/lingala/zip4j/model/ZipParameters;->isEncryptFiles()Z

    move-result v3

    if-eqz v3, :cond_5

    .line 302
    iget-object v3, p0, Lnet/lingala/zip4j/io/CipherOutputStream;->zipParameters:Lnet/lingala/zip4j/model/ZipParameters;

    invoke-virtual {v3}, Lnet/lingala/zip4j/model/ZipParameters;->getEncryptionMethod()I

    move-result v3

    if-ne v3, v10, :cond_5

    .line 303
    iget-object v3, p0, Lnet/lingala/zip4j/io/CipherOutputStream;->fileHeader:Lnet/lingala/zip4j/model/FileHeader;

    invoke-virtual {v3, v8, v9}, Lnet/lingala/zip4j/model/FileHeader;->setCrc32(J)V

    .line 304
    iget-object v3, p0, Lnet/lingala/zip4j/io/CipherOutputStream;->localFileHeader:Lnet/lingala/zip4j/model/LocalFileHeader;

    invoke-virtual {v3, v8, v9}, Lnet/lingala/zip4j/model/LocalFileHeader;->setCrc32(J)V

    .line 310
    :goto_0
    iget-object v3, p0, Lnet/lingala/zip4j/io/CipherOutputStream;->zipModel:Lnet/lingala/zip4j/model/ZipModel;

    invoke-virtual {v3}, Lnet/lingala/zip4j/model/ZipModel;->getLocalFileHeaderList()Ljava/util/List;

    move-result-object v3

    iget-object v4, p0, Lnet/lingala/zip4j/io/CipherOutputStream;->localFileHeader:Lnet/lingala/zip4j/model/LocalFileHeader;

    invoke-interface {v3, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 311
    iget-object v3, p0, Lnet/lingala/zip4j/io/CipherOutputStream;->zipModel:Lnet/lingala/zip4j/model/ZipModel;

    invoke-virtual {v3}, Lnet/lingala/zip4j/model/ZipModel;->getCentralDirectory()Lnet/lingala/zip4j/model/CentralDirectory;

    move-result-object v3

    invoke-virtual {v3}, Lnet/lingala/zip4j/model/CentralDirectory;->getFileHeaders()Ljava/util/ArrayList;

    move-result-object v3

    iget-object v4, p0, Lnet/lingala/zip4j/io/CipherOutputStream;->fileHeader:Lnet/lingala/zip4j/model/FileHeader;

    invoke-virtual {v3, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 313
    new-instance v2, Lnet/lingala/zip4j/core/HeaderWriter;

    invoke-direct {v2}, Lnet/lingala/zip4j/core/HeaderWriter;-><init>()V

    .line 314
    .local v2, "headerWriter":Lnet/lingala/zip4j/core/HeaderWriter;
    iget-wide v4, p0, Lnet/lingala/zip4j/io/CipherOutputStream;->totalBytesWritten:J

    iget-object v3, p0, Lnet/lingala/zip4j/io/CipherOutputStream;->localFileHeader:Lnet/lingala/zip4j/model/LocalFileHeader;

    iget-object v6, p0, Lnet/lingala/zip4j/io/CipherOutputStream;->outputStream:Ljava/io/OutputStream;

    invoke-virtual {v2, v3, v6}, Lnet/lingala/zip4j/core/HeaderWriter;->writeExtendedLocalHeader(Lnet/lingala/zip4j/model/LocalFileHeader;Ljava/io/OutputStream;)I

    move-result v3

    int-to-long v6, v3

    add-long/2addr v4, v6

    iput-wide v4, p0, Lnet/lingala/zip4j/io/CipherOutputStream;->totalBytesWritten:J

    .line 316
    iget-object v3, p0, Lnet/lingala/zip4j/io/CipherOutputStream;->crc:Ljava/util/zip/CRC32;

    invoke-virtual {v3}, Ljava/util/zip/CRC32;->reset()V

    .line 317
    iput-wide v8, p0, Lnet/lingala/zip4j/io/CipherOutputStream;->bytesWrittenForThisFile:J

    .line 318
    const/4 v3, 0x0

    iput-object v3, p0, Lnet/lingala/zip4j/io/CipherOutputStream;->encrypter:Lnet/lingala/zip4j/crypto/IEncrypter;

    .line 319
    iput-wide v8, p0, Lnet/lingala/zip4j/io/CipherOutputStream;->totalBytesRead:J

    .line 320
    return-void

    .line 281
    .end local v0    # "crc32":J
    .end local v2    # "headerWriter":Lnet/lingala/zip4j/core/HeaderWriter;
    :cond_4
    new-instance v3, Lnet/lingala/zip4j/exception/ZipException;

    const-string v4, "invalid encrypter for AES encrypted file"

    invoke-direct {v3, v4}, Lnet/lingala/zip4j/exception/ZipException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 306
    .restart local v0    # "crc32":J
    :cond_5
    iget-object v3, p0, Lnet/lingala/zip4j/io/CipherOutputStream;->fileHeader:Lnet/lingala/zip4j/model/FileHeader;

    invoke-virtual {v3, v0, v1}, Lnet/lingala/zip4j/model/FileHeader;->setCrc32(J)V

    .line 307
    iget-object v3, p0, Lnet/lingala/zip4j/io/CipherOutputStream;->localFileHeader:Lnet/lingala/zip4j/model/LocalFileHeader;

    invoke-virtual {v3, v0, v1}, Lnet/lingala/zip4j/model/LocalFileHeader;->setCrc32(J)V

    goto :goto_0
.end method

.method public decrementCompressedFileSize(I)V
    .locals 4
    .param p1, "value"    # I

    .prologue
    .line 550
    if-gtz p1, :cond_1

    .line 555
    :cond_0
    :goto_0
    return-void

    .line 552
    :cond_1
    int-to-long v0, p1

    iget-wide v2, p0, Lnet/lingala/zip4j/io/CipherOutputStream;->bytesWrittenForThisFile:J

    cmp-long v0, v0, v2

    if-gtz v0, :cond_0

    .line 553
    iget-wide v0, p0, Lnet/lingala/zip4j/io/CipherOutputStream;->bytesWrittenForThisFile:J

    int-to-long v2, p1

    sub-long/2addr v0, v2

    iput-wide v0, p0, Lnet/lingala/zip4j/io/CipherOutputStream;->bytesWrittenForThisFile:J

    goto :goto_0
.end method

.method public finish()V
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lnet/lingala/zip4j/exception/ZipException;
        }
    .end annotation

    .prologue
    .line 323
    iget-object v1, p0, Lnet/lingala/zip4j/io/CipherOutputStream;->zipModel:Lnet/lingala/zip4j/model/ZipModel;

    invoke-virtual {v1}, Lnet/lingala/zip4j/model/ZipModel;->getEndCentralDirRecord()Lnet/lingala/zip4j/model/EndCentralDirRecord;

    move-result-object v1

    iget-wide v2, p0, Lnet/lingala/zip4j/io/CipherOutputStream;->totalBytesWritten:J

    invoke-virtual {v1, v2, v3}, Lnet/lingala/zip4j/model/EndCentralDirRecord;->setOffsetOfStartOfCentralDir(J)V

    .line 325
    new-instance v0, Lnet/lingala/zip4j/core/HeaderWriter;

    invoke-direct {v0}, Lnet/lingala/zip4j/core/HeaderWriter;-><init>()V

    .line 326
    .local v0, "headerWriter":Lnet/lingala/zip4j/core/HeaderWriter;
    iget-object v1, p0, Lnet/lingala/zip4j/io/CipherOutputStream;->zipModel:Lnet/lingala/zip4j/model/ZipModel;

    iget-object v2, p0, Lnet/lingala/zip4j/io/CipherOutputStream;->outputStream:Ljava/io/OutputStream;

    invoke-virtual {v0, v1, v2}, Lnet/lingala/zip4j/core/HeaderWriter;->finalizeZipFile(Lnet/lingala/zip4j/model/ZipModel;Ljava/io/OutputStream;)V

    .line 327
    return-void
.end method

.method public getSourceFile()Ljava/io/File;
    .locals 1

    .prologue
    .line 568
    iget-object v0, p0, Lnet/lingala/zip4j/io/CipherOutputStream;->sourceFile:Ljava/io/File;

    return-object v0
.end method

.method public putNextEntry(Ljava/io/File;Lnet/lingala/zip4j/model/ZipParameters;)V
    .locals 11
    .param p1, "file"    # Ljava/io/File;
    .param p2, "zipParameters"    # Lnet/lingala/zip4j/model/ZipParameters;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lnet/lingala/zip4j/exception/ZipException;
        }
    .end annotation

    .prologue
    const-wide/16 v8, 0x4

    .line 70
    invoke-virtual {p2}, Lnet/lingala/zip4j/model/ZipParameters;->isSourceExternalStream()Z

    move-result v6

    if-nez v6, :cond_0

    if-nez p1, :cond_0

    .line 71
    new-instance v6, Lnet/lingala/zip4j/exception/ZipException;

    const-string v7, "input file is null"

    invoke-direct {v6, v7}, Lnet/lingala/zip4j/exception/ZipException;-><init>(Ljava/lang/String;)V

    throw v6

    .line 74
    :cond_0
    invoke-virtual {p2}, Lnet/lingala/zip4j/model/ZipParameters;->isSourceExternalStream()Z

    move-result v6

    if-nez v6, :cond_1

    invoke-static {p1}, Lnet/lingala/zip4j/util/Zip4jUtil;->checkFileExists(Ljava/io/File;)Z

    move-result v6

    if-nez v6, :cond_1

    .line 75
    new-instance v6, Lnet/lingala/zip4j/exception/ZipException;

    const-string v7, "input file does not exist"

    invoke-direct {v6, v7}, Lnet/lingala/zip4j/exception/ZipException;-><init>(Ljava/lang/String;)V

    throw v6

    .line 79
    :cond_1
    :try_start_0
    iput-object p1, p0, Lnet/lingala/zip4j/io/CipherOutputStream;->sourceFile:Ljava/io/File;

    .line 81
    invoke-virtual {p2}, Lnet/lingala/zip4j/model/ZipParameters;->clone()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lnet/lingala/zip4j/model/ZipParameters;

    iput-object v6, p0, Lnet/lingala/zip4j/io/CipherOutputStream;->zipParameters:Lnet/lingala/zip4j/model/ZipParameters;

    .line 83
    invoke-virtual {p2}, Lnet/lingala/zip4j/model/ZipParameters;->isSourceExternalStream()Z

    move-result v6

    if-nez v6, :cond_6

    .line 84
    iget-object v6, p0, Lnet/lingala/zip4j/io/CipherOutputStream;->sourceFile:Ljava/io/File;

    invoke-virtual {v6}, Ljava/io/File;->isDirectory()Z

    move-result v6

    if-eqz v6, :cond_2

    .line 85
    iget-object v6, p0, Lnet/lingala/zip4j/io/CipherOutputStream;->zipParameters:Lnet/lingala/zip4j/model/ZipParameters;

    const/4 v7, 0x0

    invoke-virtual {v6, v7}, Lnet/lingala/zip4j/model/ZipParameters;->setEncryptFiles(Z)V

    .line 86
    iget-object v6, p0, Lnet/lingala/zip4j/io/CipherOutputStream;->zipParameters:Lnet/lingala/zip4j/model/ZipParameters;

    const/4 v7, -0x1

    invoke-virtual {v6, v7}, Lnet/lingala/zip4j/model/ZipParameters;->setEncryptionMethod(I)V

    .line 87
    iget-object v6, p0, Lnet/lingala/zip4j/io/CipherOutputStream;->zipParameters:Lnet/lingala/zip4j/model/ZipParameters;

    const/4 v7, 0x0

    invoke-virtual {v6, v7}, Lnet/lingala/zip4j/model/ZipParameters;->setCompressionMethod(I)V

    .line 101
    :cond_2
    :goto_0
    invoke-direct {p0}, Lnet/lingala/zip4j/io/CipherOutputStream;->createFileHeader()V

    .line 102
    invoke-direct {p0}, Lnet/lingala/zip4j/io/CipherOutputStream;->createLocalFileHeader()V

    .line 104
    iget-object v6, p0, Lnet/lingala/zip4j/io/CipherOutputStream;->zipModel:Lnet/lingala/zip4j/model/ZipModel;

    invoke-virtual {v6}, Lnet/lingala/zip4j/model/ZipModel;->isSplitArchive()Z

    move-result v6

    if-eqz v6, :cond_4

    .line 105
    iget-object v6, p0, Lnet/lingala/zip4j/io/CipherOutputStream;->zipModel:Lnet/lingala/zip4j/model/ZipModel;

    invoke-virtual {v6}, Lnet/lingala/zip4j/model/ZipModel;->getCentralDirectory()Lnet/lingala/zip4j/model/CentralDirectory;

    move-result-object v6

    if-eqz v6, :cond_3

    .line 106
    iget-object v6, p0, Lnet/lingala/zip4j/io/CipherOutputStream;->zipModel:Lnet/lingala/zip4j/model/ZipModel;

    invoke-virtual {v6}, Lnet/lingala/zip4j/model/ZipModel;->getCentralDirectory()Lnet/lingala/zip4j/model/CentralDirectory;

    move-result-object v6

    invoke-virtual {v6}, Lnet/lingala/zip4j/model/CentralDirectory;->getFileHeaders()Ljava/util/ArrayList;

    move-result-object v6

    if-eqz v6, :cond_3

    .line 107
    iget-object v6, p0, Lnet/lingala/zip4j/io/CipherOutputStream;->zipModel:Lnet/lingala/zip4j/model/ZipModel;

    invoke-virtual {v6}, Lnet/lingala/zip4j/model/ZipModel;->getCentralDirectory()Lnet/lingala/zip4j/model/CentralDirectory;

    move-result-object v6

    invoke-virtual {v6}, Lnet/lingala/zip4j/model/CentralDirectory;->getFileHeaders()Ljava/util/ArrayList;

    move-result-object v6

    invoke-virtual {v6}, Ljava/util/ArrayList;->size()I

    move-result v6

    if-nez v6, :cond_4

    .line 108
    :cond_3
    const/4 v6, 0x4

    new-array v3, v6, [B

    .line 109
    .local v3, "intByte":[B
    const/4 v6, 0x0

    const v7, 0x8074b50

    invoke-static {v3, v6, v7}, Lnet/lingala/zip4j/util/Raw;->writeIntLittleEndian([BII)V

    .line 110
    iget-object v6, p0, Lnet/lingala/zip4j/io/CipherOutputStream;->outputStream:Ljava/io/OutputStream;

    invoke-virtual {v6, v3}, Ljava/io/OutputStream;->write([B)V

    .line 111
    iget-wide v6, p0, Lnet/lingala/zip4j/io/CipherOutputStream;->totalBytesWritten:J

    add-long/2addr v6, v8

    iput-wide v6, p0, Lnet/lingala/zip4j/io/CipherOutputStream;->totalBytesWritten:J

    .line 115
    .end local v3    # "intByte":[B
    :cond_4
    iget-object v6, p0, Lnet/lingala/zip4j/io/CipherOutputStream;->outputStream:Ljava/io/OutputStream;

    instance-of v6, v6, Lnet/lingala/zip4j/io/SplitOutputStream;

    if-eqz v6, :cond_a

    .line 116
    iget-wide v6, p0, Lnet/lingala/zip4j/io/CipherOutputStream;->totalBytesWritten:J

    cmp-long v6, v6, v8

    if-nez v6, :cond_9

    .line 117
    iget-object v6, p0, Lnet/lingala/zip4j/io/CipherOutputStream;->fileHeader:Lnet/lingala/zip4j/model/FileHeader;

    const-wide/16 v8, 0x4

    invoke-virtual {v6, v8, v9}, Lnet/lingala/zip4j/model/FileHeader;->setOffsetLocalHeader(J)V

    .line 129
    :goto_1
    new-instance v2, Lnet/lingala/zip4j/core/HeaderWriter;

    invoke-direct {v2}, Lnet/lingala/zip4j/core/HeaderWriter;-><init>()V

    .line 130
    .local v2, "headerWriter":Lnet/lingala/zip4j/core/HeaderWriter;
    iget-wide v6, p0, Lnet/lingala/zip4j/io/CipherOutputStream;->totalBytesWritten:J

    iget-object v8, p0, Lnet/lingala/zip4j/io/CipherOutputStream;->zipModel:Lnet/lingala/zip4j/model/ZipModel;

    iget-object v9, p0, Lnet/lingala/zip4j/io/CipherOutputStream;->localFileHeader:Lnet/lingala/zip4j/model/LocalFileHeader;

    iget-object v10, p0, Lnet/lingala/zip4j/io/CipherOutputStream;->outputStream:Ljava/io/OutputStream;

    invoke-virtual {v2, v8, v9, v10}, Lnet/lingala/zip4j/core/HeaderWriter;->writeLocalFileHeader(Lnet/lingala/zip4j/model/ZipModel;Lnet/lingala/zip4j/model/LocalFileHeader;Ljava/io/OutputStream;)I

    move-result v8

    int-to-long v8, v8

    add-long/2addr v6, v8

    iput-wide v6, p0, Lnet/lingala/zip4j/io/CipherOutputStream;->totalBytesWritten:J

    .line 132
    iget-object v6, p0, Lnet/lingala/zip4j/io/CipherOutputStream;->zipParameters:Lnet/lingala/zip4j/model/ZipParameters;

    invoke-virtual {v6}, Lnet/lingala/zip4j/model/ZipParameters;->isEncryptFiles()Z

    move-result v6

    if-eqz v6, :cond_5

    .line 133
    invoke-direct {p0}, Lnet/lingala/zip4j/io/CipherOutputStream;->initEncrypter()V

    .line 134
    iget-object v6, p0, Lnet/lingala/zip4j/io/CipherOutputStream;->encrypter:Lnet/lingala/zip4j/crypto/IEncrypter;

    if-eqz v6, :cond_5

    .line 135
    invoke-virtual {p2}, Lnet/lingala/zip4j/model/ZipParameters;->getEncryptionMethod()I

    move-result v6

    if-nez v6, :cond_c

    .line 136
    iget-object v6, p0, Lnet/lingala/zip4j/io/CipherOutputStream;->encrypter:Lnet/lingala/zip4j/crypto/IEncrypter;

    check-cast v6, Lnet/lingala/zip4j/crypto/StandardEncrypter;

    invoke-virtual {v6}, Lnet/lingala/zip4j/crypto/StandardEncrypter;->getHeaderBytes()[B

    move-result-object v1

    .line 137
    .local v1, "headerBytes":[B
    iget-object v6, p0, Lnet/lingala/zip4j/io/CipherOutputStream;->outputStream:Ljava/io/OutputStream;

    invoke-virtual {v6, v1}, Ljava/io/OutputStream;->write([B)V

    .line 138
    iget-wide v6, p0, Lnet/lingala/zip4j/io/CipherOutputStream;->totalBytesWritten:J

    array-length v8, v1

    int-to-long v8, v8

    add-long/2addr v6, v8

    iput-wide v6, p0, Lnet/lingala/zip4j/io/CipherOutputStream;->totalBytesWritten:J

    .line 139
    iget-wide v6, p0, Lnet/lingala/zip4j/io/CipherOutputStream;->bytesWrittenForThisFile:J

    array-length v8, v1

    int-to-long v8, v8

    add-long/2addr v6, v8

    iput-wide v6, p0, Lnet/lingala/zip4j/io/CipherOutputStream;->bytesWrittenForThisFile:J

    .line 151
    .end local v1    # "headerBytes":[B
    :cond_5
    :goto_2
    iget-object v6, p0, Lnet/lingala/zip4j/io/CipherOutputStream;->crc:Ljava/util/zip/CRC32;

    invoke-virtual {v6}, Ljava/util/zip/CRC32;->reset()V

    .line 159
    return-void

    .line 90
    .end local v2    # "headerWriter":Lnet/lingala/zip4j/core/HeaderWriter;
    :cond_6
    iget-object v6, p0, Lnet/lingala/zip4j/io/CipherOutputStream;->zipParameters:Lnet/lingala/zip4j/model/ZipParameters;

    invoke-virtual {v6}, Lnet/lingala/zip4j/model/ZipParameters;->getFileNameInZip()Ljava/lang/String;

    move-result-object v6

    invoke-static {v6}, Lnet/lingala/zip4j/util/Zip4jUtil;->isStringNotNullAndNotEmpty(Ljava/lang/String;)Z

    move-result v6

    if-nez v6, :cond_7

    .line 91
    new-instance v6, Lnet/lingala/zip4j/exception/ZipException;

    const-string v7, "file name is empty for external stream"

    invoke-direct {v6, v7}, Lnet/lingala/zip4j/exception/ZipException;-><init>(Ljava/lang/String;)V

    throw v6
    :try_end_0
    .catch Ljava/lang/CloneNotSupportedException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Lnet/lingala/zip4j/exception/ZipException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_2

    .line 152
    :catch_0
    move-exception v0

    .line 153
    .local v0, "e":Ljava/lang/CloneNotSupportedException;
    new-instance v6, Lnet/lingala/zip4j/exception/ZipException;

    invoke-direct {v6, v0}, Lnet/lingala/zip4j/exception/ZipException;-><init>(Ljava/lang/Throwable;)V

    throw v6

    .line 93
    .end local v0    # "e":Ljava/lang/CloneNotSupportedException;
    :cond_7
    :try_start_1
    iget-object v6, p0, Lnet/lingala/zip4j/io/CipherOutputStream;->zipParameters:Lnet/lingala/zip4j/model/ZipParameters;

    invoke-virtual {v6}, Lnet/lingala/zip4j/model/ZipParameters;->getFileNameInZip()Ljava/lang/String;

    move-result-object v6

    const-string v7, "/"

    invoke-virtual {v6, v7}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v6

    if-nez v6, :cond_8

    .line 94
    iget-object v6, p0, Lnet/lingala/zip4j/io/CipherOutputStream;->zipParameters:Lnet/lingala/zip4j/model/ZipParameters;

    invoke-virtual {v6}, Lnet/lingala/zip4j/model/ZipParameters;->getFileNameInZip()Ljava/lang/String;

    move-result-object v6

    const-string v7, "\\"

    invoke-virtual {v6, v7}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v6

    if-eqz v6, :cond_2

    .line 95
    :cond_8
    iget-object v6, p0, Lnet/lingala/zip4j/io/CipherOutputStream;->zipParameters:Lnet/lingala/zip4j/model/ZipParameters;

    const/4 v7, 0x0

    invoke-virtual {v6, v7}, Lnet/lingala/zip4j/model/ZipParameters;->setEncryptFiles(Z)V

    .line 96
    iget-object v6, p0, Lnet/lingala/zip4j/io/CipherOutputStream;->zipParameters:Lnet/lingala/zip4j/model/ZipParameters;

    const/4 v7, -0x1

    invoke-virtual {v6, v7}, Lnet/lingala/zip4j/model/ZipParameters;->setEncryptionMethod(I)V

    .line 97
    iget-object v6, p0, Lnet/lingala/zip4j/io/CipherOutputStream;->zipParameters:Lnet/lingala/zip4j/model/ZipParameters;

    const/4 v7, 0x0

    invoke-virtual {v6, v7}, Lnet/lingala/zip4j/model/ZipParameters;->setCompressionMethod(I)V
    :try_end_1
    .catch Ljava/lang/CloneNotSupportedException; {:try_start_1 .. :try_end_1} :catch_0
    .catch Lnet/lingala/zip4j/exception/ZipException; {:try_start_1 .. :try_end_1} :catch_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_2

    goto/16 :goto_0

    .line 154
    :catch_1
    move-exception v0

    .line 155
    .local v0, "e":Lnet/lingala/zip4j/exception/ZipException;
    throw v0

    .line 119
    .end local v0    # "e":Lnet/lingala/zip4j/exception/ZipException;
    :cond_9
    :try_start_2
    iget-object v7, p0, Lnet/lingala/zip4j/io/CipherOutputStream;->fileHeader:Lnet/lingala/zip4j/model/FileHeader;

    iget-object v6, p0, Lnet/lingala/zip4j/io/CipherOutputStream;->outputStream:Ljava/io/OutputStream;

    check-cast v6, Lnet/lingala/zip4j/io/SplitOutputStream;

    invoke-virtual {v6}, Lnet/lingala/zip4j/io/SplitOutputStream;->getFilePointer()J

    move-result-wide v8

    invoke-virtual {v7, v8, v9}, Lnet/lingala/zip4j/model/FileHeader;->setOffsetLocalHeader(J)V
    :try_end_2
    .catch Ljava/lang/CloneNotSupportedException; {:try_start_2 .. :try_end_2} :catch_0
    .catch Lnet/lingala/zip4j/exception/ZipException; {:try_start_2 .. :try_end_2} :catch_1
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_2

    goto/16 :goto_1

    .line 156
    :catch_2
    move-exception v0

    .line 157
    .local v0, "e":Ljava/lang/Exception;
    new-instance v6, Lnet/lingala/zip4j/exception/ZipException;

    invoke-direct {v6, v0}, Lnet/lingala/zip4j/exception/ZipException;-><init>(Ljava/lang/Throwable;)V

    throw v6

    .line 122
    .end local v0    # "e":Ljava/lang/Exception;
    :cond_a
    :try_start_3
    iget-wide v6, p0, Lnet/lingala/zip4j/io/CipherOutputStream;->totalBytesWritten:J

    cmp-long v6, v6, v8

    if-nez v6, :cond_b

    .line 123
    iget-object v6, p0, Lnet/lingala/zip4j/io/CipherOutputStream;->fileHeader:Lnet/lingala/zip4j/model/FileHeader;

    const-wide/16 v8, 0x4

    invoke-virtual {v6, v8, v9}, Lnet/lingala/zip4j/model/FileHeader;->setOffsetLocalHeader(J)V

    goto/16 :goto_1

    .line 125
    :cond_b
    iget-object v6, p0, Lnet/lingala/zip4j/io/CipherOutputStream;->fileHeader:Lnet/lingala/zip4j/model/FileHeader;

    iget-wide v8, p0, Lnet/lingala/zip4j/io/CipherOutputStream;->totalBytesWritten:J

    invoke-virtual {v6, v8, v9}, Lnet/lingala/zip4j/model/FileHeader;->setOffsetLocalHeader(J)V

    goto/16 :goto_1

    .line 140
    .restart local v2    # "headerWriter":Lnet/lingala/zip4j/core/HeaderWriter;
    :cond_c
    invoke-virtual {p2}, Lnet/lingala/zip4j/model/ZipParameters;->getEncryptionMethod()I

    move-result v6

    const/16 v7, 0x63

    if-ne v6, v7, :cond_5

    .line 141
    iget-object v6, p0, Lnet/lingala/zip4j/io/CipherOutputStream;->encrypter:Lnet/lingala/zip4j/crypto/IEncrypter;

    check-cast v6, Lnet/lingala/zip4j/crypto/AESEncrpyter;

    invoke-virtual {v6}, Lnet/lingala/zip4j/crypto/AESEncrpyter;->getSaltBytes()[B

    move-result-object v5

    .line 142
    .local v5, "saltBytes":[B
    iget-object v6, p0, Lnet/lingala/zip4j/io/CipherOutputStream;->encrypter:Lnet/lingala/zip4j/crypto/IEncrypter;

    check-cast v6, Lnet/lingala/zip4j/crypto/AESEncrpyter;

    invoke-virtual {v6}, Lnet/lingala/zip4j/crypto/AESEncrpyter;->getDerivedPasswordVerifier()[B

    move-result-object v4

    .line 143
    .local v4, "passwordVerifier":[B
    iget-object v6, p0, Lnet/lingala/zip4j/io/CipherOutputStream;->outputStream:Ljava/io/OutputStream;

    invoke-virtual {v6, v5}, Ljava/io/OutputStream;->write([B)V

    .line 144
    iget-object v6, p0, Lnet/lingala/zip4j/io/CipherOutputStream;->outputStream:Ljava/io/OutputStream;

    invoke-virtual {v6, v4}, Ljava/io/OutputStream;->write([B)V

    .line 145
    iget-wide v6, p0, Lnet/lingala/zip4j/io/CipherOutputStream;->totalBytesWritten:J

    array-length v8, v5

    array-length v9, v4

    add-int/2addr v8, v9

    int-to-long v8, v8

    add-long/2addr v6, v8

    iput-wide v6, p0, Lnet/lingala/zip4j/io/CipherOutputStream;->totalBytesWritten:J

    .line 146
    iget-wide v6, p0, Lnet/lingala/zip4j/io/CipherOutputStream;->bytesWrittenForThisFile:J

    array-length v8, v5

    array-length v9, v4

    add-int/2addr v8, v9

    int-to-long v8, v8

    add-long/2addr v6, v8

    iput-wide v6, p0, Lnet/lingala/zip4j/io/CipherOutputStream;->bytesWrittenForThisFile:J
    :try_end_3
    .catch Ljava/lang/CloneNotSupportedException; {:try_start_3 .. :try_end_3} :catch_0
    .catch Lnet/lingala/zip4j/exception/ZipException; {:try_start_3 .. :try_end_3} :catch_1
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_2

    goto/16 :goto_2
.end method

.method public setSourceFile(Ljava/io/File;)V
    .locals 0
    .param p1, "sourceFile"    # Ljava/io/File;

    .prologue
    .line 564
    iput-object p1, p0, Lnet/lingala/zip4j/io/CipherOutputStream;->sourceFile:Ljava/io/File;

    .line 565
    return-void
.end method

.method protected updateTotalBytesRead(I)V
    .locals 4
    .param p1, "toUpdate"    # I

    .prologue
    .line 558
    if-lez p1, :cond_0

    .line 559
    iget-wide v0, p0, Lnet/lingala/zip4j/io/CipherOutputStream;->totalBytesRead:J

    int-to-long v2, p1

    add-long/2addr v0, v2

    iput-wide v0, p0, Lnet/lingala/zip4j/io/CipherOutputStream;->totalBytesRead:J

    .line 561
    :cond_0
    return-void
.end method

.method public write(I)V
    .locals 4
    .param p1, "bval"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 210
    new-array v0, v3, [B

    .line 211
    .local v0, "b":[B
    int-to-byte v1, p1

    aput-byte v1, v0, v2

    .line 212
    invoke-virtual {p0, v0, v2, v3}, Lnet/lingala/zip4j/io/CipherOutputStream;->write([BII)V

    .line 213
    return-void
.end method

.method public write([B)V
    .locals 2
    .param p1, "b"    # [B
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 216
    if-nez p1, :cond_0

    .line 217
    new-instance v0, Ljava/lang/NullPointerException;

    invoke-direct {v0}, Ljava/lang/NullPointerException;-><init>()V

    throw v0

    .line 219
    :cond_0
    array-length v0, p1

    if-nez v0, :cond_1

    .line 222
    :goto_0
    return-void

    .line 221
    :cond_1
    const/4 v0, 0x0

    array-length v1, p1

    invoke-virtual {p0, p1, v0, v1}, Lnet/lingala/zip4j/io/CipherOutputStream;->write([BII)V

    goto :goto_0
.end method

.method public write([BII)V
    .locals 4
    .param p1, "b"    # [B
    .param p2, "off"    # I
    .param p3, "len"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v3, 0x0

    .line 225
    if-nez p3, :cond_1

    .line 252
    :cond_0
    :goto_0
    return-void

    .line 227
    :cond_1
    iget-object v0, p0, Lnet/lingala/zip4j/io/CipherOutputStream;->zipParameters:Lnet/lingala/zip4j/model/ZipParameters;

    invoke-virtual {v0}, Lnet/lingala/zip4j/model/ZipParameters;->isEncryptFiles()Z

    move-result v0

    if-eqz v0, :cond_3

    .line 228
    iget-object v0, p0, Lnet/lingala/zip4j/io/CipherOutputStream;->zipParameters:Lnet/lingala/zip4j/model/ZipParameters;

    invoke-virtual {v0}, Lnet/lingala/zip4j/model/ZipParameters;->getEncryptionMethod()I

    move-result v0

    const/16 v1, 0x63

    if-ne v0, v1, :cond_3

    .line 229
    iget v0, p0, Lnet/lingala/zip4j/io/CipherOutputStream;->pendingBufferLength:I

    if-eqz v0, :cond_2

    .line 230
    iget v0, p0, Lnet/lingala/zip4j/io/CipherOutputStream;->pendingBufferLength:I

    rsub-int/lit8 v0, v0, 0x10

    if-lt p3, v0, :cond_4

    .line 231
    iget-object v0, p0, Lnet/lingala/zip4j/io/CipherOutputStream;->pendingBuffer:[B

    iget v1, p0, Lnet/lingala/zip4j/io/CipherOutputStream;->pendingBufferLength:I

    .line 232
    iget v2, p0, Lnet/lingala/zip4j/io/CipherOutputStream;->pendingBufferLength:I

    rsub-int/lit8 v2, v2, 0x10

    .line 231
    invoke-static {p1, p2, v0, v1, v2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 233
    iget-object v0, p0, Lnet/lingala/zip4j/io/CipherOutputStream;->pendingBuffer:[B

    iget-object v1, p0, Lnet/lingala/zip4j/io/CipherOutputStream;->pendingBuffer:[B

    array-length v1, v1

    invoke-direct {p0, v0, v3, v1}, Lnet/lingala/zip4j/io/CipherOutputStream;->encryptAndWrite([BII)V

    .line 234
    iget v0, p0, Lnet/lingala/zip4j/io/CipherOutputStream;->pendingBufferLength:I

    rsub-int/lit8 p2, v0, 0x10

    .line 235
    sub-int/2addr p3, p2

    .line 236
    iput v3, p0, Lnet/lingala/zip4j/io/CipherOutputStream;->pendingBufferLength:I

    .line 244
    :cond_2
    if-eqz p3, :cond_3

    rem-int/lit8 v0, p3, 0x10

    if-eqz v0, :cond_3

    .line 245
    add-int v0, p3, p2

    rem-int/lit8 v1, p3, 0x10

    sub-int/2addr v0, v1

    iget-object v1, p0, Lnet/lingala/zip4j/io/CipherOutputStream;->pendingBuffer:[B

    rem-int/lit8 v2, p3, 0x10

    invoke-static {p1, v0, v1, v3, v2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 246
    rem-int/lit8 v0, p3, 0x10

    iput v0, p0, Lnet/lingala/zip4j/io/CipherOutputStream;->pendingBufferLength:I

    .line 247
    iget v0, p0, Lnet/lingala/zip4j/io/CipherOutputStream;->pendingBufferLength:I

    sub-int/2addr p3, v0

    .line 250
    :cond_3
    if-eqz p3, :cond_0

    .line 251
    invoke-direct {p0, p1, p2, p3}, Lnet/lingala/zip4j/io/CipherOutputStream;->encryptAndWrite([BII)V

    goto :goto_0

    .line 238
    :cond_4
    iget-object v0, p0, Lnet/lingala/zip4j/io/CipherOutputStream;->pendingBuffer:[B

    iget v1, p0, Lnet/lingala/zip4j/io/CipherOutputStream;->pendingBufferLength:I

    invoke-static {p1, p2, v0, v1, p3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 240
    iget v0, p0, Lnet/lingala/zip4j/io/CipherOutputStream;->pendingBufferLength:I

    add-int/2addr v0, p3

    iput v0, p0, Lnet/lingala/zip4j/io/CipherOutputStream;->pendingBufferLength:I

    goto :goto_0
.end method
