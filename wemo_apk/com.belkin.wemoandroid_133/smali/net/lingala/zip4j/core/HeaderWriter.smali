.class public Lnet/lingala/zip4j/core/HeaderWriter;
.super Ljava/lang/Object;
.source "HeaderWriter.java"


# instance fields
.field private final ZIP64_EXTRA_BUF:I


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 37
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 39
    const/16 v0, 0x32

    iput v0, p0, Lnet/lingala/zip4j/core/HeaderWriter;->ZIP64_EXTRA_BUF:I

    .line 37
    return-void
.end method

.method private byteArrayListToByteArray(Ljava/util/List;)[B
    .locals 4
    .param p1, "arrayList"    # Ljava/util/List;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lnet/lingala/zip4j/exception/ZipException;
        }
    .end annotation

    .prologue
    .line 910
    if-nez p1, :cond_0

    .line 911
    new-instance v2, Lnet/lingala/zip4j/exception/ZipException;

    const-string v3, "input byte array list is null, cannot conver to byte array"

    invoke-direct {v2, v3}, Lnet/lingala/zip4j/exception/ZipException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 914
    :cond_0
    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v2

    if-gtz v2, :cond_2

    .line 915
    const/4 v1, 0x0

    .line 924
    :cond_1
    return-object v1

    .line 918
    :cond_2
    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v2

    new-array v1, v2, [B

    .line 920
    .local v1, "retBytes":[B
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v2

    if-ge v0, v2, :cond_1

    .line 921
    invoke-interface {p1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    invoke-static {v2}, Ljava/lang/Byte;->parseByte(Ljava/lang/String;)B

    move-result v2

    aput-byte v2, v1, v0

    .line 920
    add-int/lit8 v0, v0, 0x1

    goto :goto_0
.end method

.method private copyByteArrayToArrayList([BLjava/util/List;)V
    .locals 3
    .param p1, "byteArray"    # [B
    .param p2, "arrayList"    # Ljava/util/List;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lnet/lingala/zip4j/exception/ZipException;
        }
    .end annotation

    .prologue
    .line 900
    if-eqz p2, :cond_0

    if-nez p1, :cond_1

    .line 901
    :cond_0
    new-instance v1, Lnet/lingala/zip4j/exception/ZipException;

    const-string v2, "one of the input parameters is null, cannot copy byte array to array list"

    invoke-direct {v1, v2}, Lnet/lingala/zip4j/exception/ZipException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 904
    :cond_1
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    array-length v1, p1

    if-lt v0, v1, :cond_2

    .line 907
    return-void

    .line 905
    :cond_2
    aget-byte v1, p1, v0

    invoke-static {v1}, Ljava/lang/Byte;->toString(B)Ljava/lang/String;

    move-result-object v1

    invoke-interface {p2, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 904
    add-int/lit8 v0, v0, 0x1

    goto :goto_0
.end method

.method private countNumberOfFileHeaderEntriesOnDisk(Ljava/util/ArrayList;I)I
    .locals 5
    .param p1, "fileHeaders"    # Ljava/util/ArrayList;
    .param p2, "numOfDisk"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lnet/lingala/zip4j/exception/ZipException;
        }
    .end annotation

    .prologue
    .line 929
    if-nez p1, :cond_0

    .line 930
    new-instance v3, Lnet/lingala/zip4j/exception/ZipException;

    const-string v4, "file headers are null, cannot calculate number of entries on this disk"

    invoke-direct {v3, v4}, Lnet/lingala/zip4j/exception/ZipException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 933
    :cond_0
    const/4 v2, 0x0

    .line 934
    .local v2, "noEntries":I
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    move-result v3

    if-lt v1, v3, :cond_1

    .line 940
    return v2

    .line 935
    :cond_1
    invoke-virtual {p1, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lnet/lingala/zip4j/model/FileHeader;

    .line 936
    .local v0, "fileHeader":Lnet/lingala/zip4j/model/FileHeader;
    invoke-virtual {v0}, Lnet/lingala/zip4j/model/FileHeader;->getDiskNumberStart()I

    move-result v3

    if-ne v3, p2, :cond_2

    .line 937
    add-int/lit8 v2, v2, 0x1

    .line 934
    :cond_2
    add-int/lit8 v1, v1, 0x1

    goto :goto_0
.end method

.method private processHeaderData(Lnet/lingala/zip4j/model/ZipModel;Ljava/io/OutputStream;)V
    .locals 8
    .param p1, "zipModel"    # Lnet/lingala/zip4j/model/ZipModel;
    .param p2, "outputStream"    # Ljava/io/OutputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lnet/lingala/zip4j/exception/ZipException;
        }
    .end annotation

    .prologue
    .line 340
    const/4 v2, 0x0

    .line 341
    .local v2, "currSplitFileCounter":I
    :try_start_0
    instance-of v4, p2, Lnet/lingala/zip4j/io/SplitOutputStream;

    if-eqz v4, :cond_0

    .line 342
    invoke-virtual {p1}, Lnet/lingala/zip4j/model/ZipModel;->getEndCentralDirRecord()Lnet/lingala/zip4j/model/EndCentralDirRecord;

    move-result-object v5

    .line 343
    move-object v0, p2

    check-cast v0, Lnet/lingala/zip4j/io/SplitOutputStream;

    move-object v4, v0

    invoke-virtual {v4}, Lnet/lingala/zip4j/io/SplitOutputStream;->getFilePointer()J

    move-result-wide v6

    .line 342
    invoke-virtual {v5, v6, v7}, Lnet/lingala/zip4j/model/EndCentralDirRecord;->setOffsetOfStartOfCentralDir(J)V

    .line 344
    check-cast p2, Lnet/lingala/zip4j/io/SplitOutputStream;

    .end local p2    # "outputStream":Ljava/io/OutputStream;
    invoke-virtual {p2}, Lnet/lingala/zip4j/io/SplitOutputStream;->getCurrSplitFileCounter()I

    move-result v2

    .line 348
    :cond_0
    invoke-virtual {p1}, Lnet/lingala/zip4j/model/ZipModel;->isZip64Format()Z

    move-result v4

    if-eqz v4, :cond_3

    .line 349
    invoke-virtual {p1}, Lnet/lingala/zip4j/model/ZipModel;->getZip64EndCentralDirRecord()Lnet/lingala/zip4j/model/Zip64EndCentralDirRecord;

    move-result-object v4

    if-nez v4, :cond_1

    .line 350
    new-instance v4, Lnet/lingala/zip4j/model/Zip64EndCentralDirRecord;

    invoke-direct {v4}, Lnet/lingala/zip4j/model/Zip64EndCentralDirRecord;-><init>()V

    invoke-virtual {p1, v4}, Lnet/lingala/zip4j/model/ZipModel;->setZip64EndCentralDirRecord(Lnet/lingala/zip4j/model/Zip64EndCentralDirRecord;)V

    .line 352
    :cond_1
    invoke-virtual {p1}, Lnet/lingala/zip4j/model/ZipModel;->getZip64EndCentralDirLocator()Lnet/lingala/zip4j/model/Zip64EndCentralDirLocator;

    move-result-object v4

    if-nez v4, :cond_2

    .line 353
    new-instance v4, Lnet/lingala/zip4j/model/Zip64EndCentralDirLocator;

    invoke-direct {v4}, Lnet/lingala/zip4j/model/Zip64EndCentralDirLocator;-><init>()V

    invoke-virtual {p1, v4}, Lnet/lingala/zip4j/model/ZipModel;->setZip64EndCentralDirLocator(Lnet/lingala/zip4j/model/Zip64EndCentralDirLocator;)V

    .line 356
    :cond_2
    invoke-virtual {p1}, Lnet/lingala/zip4j/model/ZipModel;->getZip64EndCentralDirLocator()Lnet/lingala/zip4j/model/Zip64EndCentralDirLocator;

    move-result-object v4

    invoke-virtual {v4, v2}, Lnet/lingala/zip4j/model/Zip64EndCentralDirLocator;->setNoOfDiskStartOfZip64EndOfCentralDirRec(I)V

    .line 357
    invoke-virtual {p1}, Lnet/lingala/zip4j/model/ZipModel;->getZip64EndCentralDirLocator()Lnet/lingala/zip4j/model/Zip64EndCentralDirLocator;

    move-result-object v4

    add-int/lit8 v5, v2, 0x1

    invoke-virtual {v4, v5}, Lnet/lingala/zip4j/model/Zip64EndCentralDirLocator;->setTotNumberOfDiscs(I)V

    .line 359
    :cond_3
    invoke-virtual {p1}, Lnet/lingala/zip4j/model/ZipModel;->getEndCentralDirRecord()Lnet/lingala/zip4j/model/EndCentralDirRecord;

    move-result-object v4

    invoke-virtual {v4, v2}, Lnet/lingala/zip4j/model/EndCentralDirRecord;->setNoOfThisDisk(I)V

    .line 360
    invoke-virtual {p1}, Lnet/lingala/zip4j/model/ZipModel;->getEndCentralDirRecord()Lnet/lingala/zip4j/model/EndCentralDirRecord;

    move-result-object v4

    invoke-virtual {v4, v2}, Lnet/lingala/zip4j/model/EndCentralDirRecord;->setNoOfThisDiskStartOfCentralDir(I)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 364
    return-void

    .line 361
    :catch_0
    move-exception v3

    .line 362
    .local v3, "e":Ljava/io/IOException;
    new-instance v4, Lnet/lingala/zip4j/exception/ZipException;

    invoke-direct {v4, v3}, Lnet/lingala/zip4j/exception/ZipException;-><init>(Ljava/lang/Throwable;)V

    throw v4
.end method

.method private updateCompressedSizeInLocalFileHeader(Lnet/lingala/zip4j/io/SplitOutputStream;Lnet/lingala/zip4j/model/LocalFileHeader;JJ[BZ)V
    .locals 11
    .param p1, "outputStream"    # Lnet/lingala/zip4j/io/SplitOutputStream;
    .param p2, "localFileHeader"    # Lnet/lingala/zip4j/model/LocalFileHeader;
    .param p3, "offset"    # J
    .param p5, "toUpdate"    # J
    .param p7, "bytesToWrite"    # [B
    .param p8, "isZip64Format"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lnet/lingala/zip4j/exception/ZipException;
        }
    .end annotation

    .prologue
    .line 863
    if-nez p1, :cond_0

    .line 864
    new-instance v3, Lnet/lingala/zip4j/exception/ZipException;

    const-string v6, "invalid output stream, cannot update compressed size for local file header"

    invoke-direct {v3, v6}, Lnet/lingala/zip4j/exception/ZipException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 868
    :cond_0
    :try_start_0
    invoke-virtual {p2}, Lnet/lingala/zip4j/model/LocalFileHeader;->isWriteComprSizeInZip64ExtraRecord()Z

    move-result v3

    if-eqz v3, :cond_3

    .line 869
    move-object/from16 v0, p7

    array-length v3, v0

    const/16 v6, 0x8

    if-eq v3, v6, :cond_1

    .line 870
    new-instance v3, Lnet/lingala/zip4j/exception/ZipException;

    const-string v6, "attempting to write a non 8-byte compressed size block for a zip64 file"

    invoke-direct {v3, v6}, Lnet/lingala/zip4j/exception/ZipException;-><init>(Ljava/lang/String;)V

    throw v3
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 893
    :catch_0
    move-exception v2

    .line 894
    .local v2, "e":Ljava/io/IOException;
    new-instance v3, Lnet/lingala/zip4j/exception/ZipException;

    invoke-direct {v3, v2}, Lnet/lingala/zip4j/exception/ZipException;-><init>(Ljava/lang/Throwable;)V

    throw v3

    .line 883
    .end local v2    # "e":Ljava/io/IOException;
    :cond_1
    add-long v6, p3, p5

    const-wide/16 v8, 0x4

    add-long/2addr v6, v8

    const-wide/16 v8, 0x4

    add-long/2addr v6, v8

    const-wide/16 v8, 0x2

    add-long/2addr v6, v8

    const-wide/16 v8, 0x2

    add-long/2addr v6, v8

    :try_start_1
    invoke-virtual {p2}, Lnet/lingala/zip4j/model/LocalFileHeader;->getFileNameLength()I

    move-result v3

    int-to-long v8, v3

    add-long/2addr v6, v8

    const-wide/16 v8, 0x2

    add-long/2addr v6, v8

    const-wide/16 v8, 0x2

    add-long/2addr v6, v8

    const-wide/16 v8, 0x8

    add-long v4, v6, v8

    .line 884
    .local v4, "zip64CompressedSizeOffset":J
    const-wide/16 v6, 0x16

    cmp-long v3, p5, v6

    if-nez v3, :cond_2

    .line 885
    const-wide/16 v6, 0x8

    add-long/2addr v4, v6

    .line 887
    :cond_2
    invoke-virtual {p1, v4, v5}, Lnet/lingala/zip4j/io/SplitOutputStream;->seek(J)V

    .line 888
    move-object/from16 v0, p7

    invoke-virtual {p1, v0}, Lnet/lingala/zip4j/io/SplitOutputStream;->write([B)V

    .line 897
    .end local v4    # "zip64CompressedSizeOffset":J
    :goto_0
    return-void

    .line 890
    :cond_3
    add-long v6, p3, p5

    invoke-virtual {p1, v6, v7}, Lnet/lingala/zip4j/io/SplitOutputStream;->seek(J)V

    .line 891
    move-object/from16 v0, p7

    invoke-virtual {p1, v0}, Lnet/lingala/zip4j/io/SplitOutputStream;->write([B)V
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_0
.end method

.method private writeCentralDirectory(Lnet/lingala/zip4j/model/ZipModel;Ljava/io/OutputStream;Ljava/util/List;)I
    .locals 6
    .param p1, "zipModel"    # Lnet/lingala/zip4j/model/ZipModel;
    .param p2, "outputStream"    # Ljava/io/OutputStream;
    .param p3, "headerBytesList"    # Ljava/util/List;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lnet/lingala/zip4j/exception/ZipException;
        }
    .end annotation

    .prologue
    .line 376
    if-eqz p1, :cond_0

    if-nez p2, :cond_1

    .line 377
    :cond_0
    new-instance v4, Lnet/lingala/zip4j/exception/ZipException;

    const-string v5, "input parameters is null, cannot write central directory"

    invoke-direct {v4, v5}, Lnet/lingala/zip4j/exception/ZipException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 380
    :cond_1
    invoke-virtual {p1}, Lnet/lingala/zip4j/model/ZipModel;->getCentralDirectory()Lnet/lingala/zip4j/model/CentralDirectory;

    move-result-object v4

    if-eqz v4, :cond_2

    .line 381
    invoke-virtual {p1}, Lnet/lingala/zip4j/model/ZipModel;->getCentralDirectory()Lnet/lingala/zip4j/model/CentralDirectory;

    move-result-object v4

    invoke-virtual {v4}, Lnet/lingala/zip4j/model/CentralDirectory;->getFileHeaders()Ljava/util/ArrayList;

    move-result-object v4

    if-eqz v4, :cond_2

    .line 382
    invoke-virtual {p1}, Lnet/lingala/zip4j/model/ZipModel;->getCentralDirectory()Lnet/lingala/zip4j/model/CentralDirectory;

    move-result-object v4

    invoke-virtual {v4}, Lnet/lingala/zip4j/model/CentralDirectory;->getFileHeaders()Ljava/util/ArrayList;

    move-result-object v4

    invoke-virtual {v4}, Ljava/util/ArrayList;->size()I

    move-result v4

    if-gtz v4, :cond_4

    .line 383
    :cond_2
    const/4 v2, 0x0

    .line 392
    :cond_3
    return v2

    .line 386
    :cond_4
    const/4 v2, 0x0

    .line 387
    .local v2, "sizeOfCentralDir":I
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    invoke-virtual {p1}, Lnet/lingala/zip4j/model/ZipModel;->getCentralDirectory()Lnet/lingala/zip4j/model/CentralDirectory;

    move-result-object v4

    invoke-virtual {v4}, Lnet/lingala/zip4j/model/CentralDirectory;->getFileHeaders()Ljava/util/ArrayList;

    move-result-object v4

    invoke-virtual {v4}, Ljava/util/ArrayList;->size()I

    move-result v4

    if-ge v1, v4, :cond_3

    .line 388
    invoke-virtual {p1}, Lnet/lingala/zip4j/model/ZipModel;->getCentralDirectory()Lnet/lingala/zip4j/model/CentralDirectory;

    move-result-object v4

    invoke-virtual {v4}, Lnet/lingala/zip4j/model/CentralDirectory;->getFileHeaders()Ljava/util/ArrayList;

    move-result-object v4

    invoke-virtual {v4, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lnet/lingala/zip4j/model/FileHeader;

    .line 389
    .local v0, "fileHeader":Lnet/lingala/zip4j/model/FileHeader;
    invoke-direct {p0, p1, v0, p2, p3}, Lnet/lingala/zip4j/core/HeaderWriter;->writeFileHeader(Lnet/lingala/zip4j/model/ZipModel;Lnet/lingala/zip4j/model/FileHeader;Ljava/io/OutputStream;Ljava/util/List;)I

    move-result v3

    .line 390
    .local v3, "sizeOfFileHeader":I
    add-int/2addr v2, v3

    .line 387
    add-int/lit8 v1, v1, 0x1

    goto :goto_0
.end method

.method private writeEndOfCentralDirectoryRecord(Lnet/lingala/zip4j/model/ZipModel;Ljava/io/OutputStream;IJLjava/util/List;)V
    .locals 12
    .param p1, "zipModel"    # Lnet/lingala/zip4j/model/ZipModel;
    .param p2, "outputStream"    # Ljava/io/OutputStream;
    .param p3, "sizeOfCentralDir"    # I
    .param p4, "offsetCentralDir"    # J
    .param p6, "headrBytesList"    # Ljava/util/List;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lnet/lingala/zip4j/exception/ZipException;
        }
    .end annotation

    .prologue
    .line 729
    if-eqz p1, :cond_0

    if-nez p2, :cond_1

    .line 730
    :cond_0
    new-instance v9, Lnet/lingala/zip4j/exception/ZipException;

    const-string v10, "zip model or output stream is null, cannot write end of central directory record"

    invoke-direct {v9, v10}, Lnet/lingala/zip4j/exception/ZipException;-><init>(Ljava/lang/String;)V

    throw v9

    .line 735
    :cond_1
    const/4 v9, 0x2

    :try_start_0
    new-array v8, v9, [B

    .line 736
    .local v8, "shortByte":[B
    const/4 v9, 0x4

    new-array v4, v9, [B

    .line 737
    .local v4, "intByte":[B
    const/16 v9, 0x8

    new-array v5, v9, [B

    .line 740
    .local v5, "longByte":[B
    const/4 v9, 0x0

    invoke-virtual {p1}, Lnet/lingala/zip4j/model/ZipModel;->getEndCentralDirRecord()Lnet/lingala/zip4j/model/EndCentralDirRecord;

    move-result-object v10

    invoke-virtual {v10}, Lnet/lingala/zip4j/model/EndCentralDirRecord;->getSignature()J

    move-result-wide v10

    long-to-int v10, v10

    invoke-static {v4, v9, v10}, Lnet/lingala/zip4j/util/Raw;->writeIntLittleEndian([BII)V

    .line 741
    move-object/from16 v0, p6

    invoke-direct {p0, v4, v0}, Lnet/lingala/zip4j/core/HeaderWriter;->copyByteArrayToArrayList([BLjava/util/List;)V

    .line 744
    const/4 v9, 0x0

    invoke-virtual {p1}, Lnet/lingala/zip4j/model/ZipModel;->getEndCentralDirRecord()Lnet/lingala/zip4j/model/EndCentralDirRecord;

    move-result-object v10

    invoke-virtual {v10}, Lnet/lingala/zip4j/model/EndCentralDirRecord;->getNoOfThisDisk()I

    move-result v10

    int-to-short v10, v10

    invoke-static {v8, v9, v10}, Lnet/lingala/zip4j/util/Raw;->writeShortLittleEndian([BIS)V

    .line 745
    move-object/from16 v0, p6

    invoke-direct {p0, v8, v0}, Lnet/lingala/zip4j/core/HeaderWriter;->copyByteArrayToArrayList([BLjava/util/List;)V

    .line 748
    const/4 v9, 0x0

    invoke-virtual {p1}, Lnet/lingala/zip4j/model/ZipModel;->getEndCentralDirRecord()Lnet/lingala/zip4j/model/EndCentralDirRecord;

    move-result-object v10

    invoke-virtual {v10}, Lnet/lingala/zip4j/model/EndCentralDirRecord;->getNoOfThisDiskStartOfCentralDir()I

    move-result v10

    int-to-short v10, v10

    invoke-static {v8, v9, v10}, Lnet/lingala/zip4j/util/Raw;->writeShortLittleEndian([BIS)V

    .line 749
    move-object/from16 v0, p6

    invoke-direct {p0, v8, v0}, Lnet/lingala/zip4j/core/HeaderWriter;->copyByteArrayToArrayList([BLjava/util/List;)V

    .line 752
    const/4 v6, 0x0

    .line 753
    .local v6, "numEntries":I
    const/4 v7, 0x0

    .line 754
    .local v7, "numEntriesOnThisDisk":I
    invoke-virtual {p1}, Lnet/lingala/zip4j/model/ZipModel;->getCentralDirectory()Lnet/lingala/zip4j/model/CentralDirectory;

    move-result-object v9

    if-eqz v9, :cond_2

    .line 755
    invoke-virtual {p1}, Lnet/lingala/zip4j/model/ZipModel;->getCentralDirectory()Lnet/lingala/zip4j/model/CentralDirectory;

    move-result-object v9

    invoke-virtual {v9}, Lnet/lingala/zip4j/model/CentralDirectory;->getFileHeaders()Ljava/util/ArrayList;

    move-result-object v9

    if-nez v9, :cond_3

    .line 756
    :cond_2
    new-instance v9, Lnet/lingala/zip4j/exception/ZipException;

    const-string v10, "invalid central directory/file headers, cannot write end of central directory record"

    invoke-direct {v9, v10}, Lnet/lingala/zip4j/exception/ZipException;-><init>(Ljava/lang/String;)V

    throw v9
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 803
    .end local v4    # "intByte":[B
    .end local v5    # "longByte":[B
    .end local v6    # "numEntries":I
    .end local v7    # "numEntriesOnThisDisk":I
    .end local v8    # "shortByte":[B
    :catch_0
    move-exception v3

    .line 804
    .local v3, "e":Ljava/lang/Exception;
    new-instance v9, Lnet/lingala/zip4j/exception/ZipException;

    invoke-direct {v9, v3}, Lnet/lingala/zip4j/exception/ZipException;-><init>(Ljava/lang/Throwable;)V

    throw v9

    .line 759
    .end local v3    # "e":Ljava/lang/Exception;
    .restart local v4    # "intByte":[B
    .restart local v5    # "longByte":[B
    .restart local v6    # "numEntries":I
    .restart local v7    # "numEntriesOnThisDisk":I
    .restart local v8    # "shortByte":[B
    :cond_3
    :try_start_1
    invoke-virtual {p1}, Lnet/lingala/zip4j/model/ZipModel;->getCentralDirectory()Lnet/lingala/zip4j/model/CentralDirectory;

    move-result-object v9

    invoke-virtual {v9}, Lnet/lingala/zip4j/model/CentralDirectory;->getFileHeaders()Ljava/util/ArrayList;

    move-result-object v9

    invoke-virtual {v9}, Ljava/util/ArrayList;->size()I

    move-result v6

    .line 760
    invoke-virtual {p1}, Lnet/lingala/zip4j/model/ZipModel;->isSplitArchive()Z

    move-result v9

    if-eqz v9, :cond_6

    .line 761
    invoke-virtual {p1}, Lnet/lingala/zip4j/model/ZipModel;->getCentralDirectory()Lnet/lingala/zip4j/model/CentralDirectory;

    move-result-object v9

    invoke-virtual {v9}, Lnet/lingala/zip4j/model/CentralDirectory;->getFileHeaders()Ljava/util/ArrayList;

    move-result-object v9

    .line 762
    invoke-virtual {p1}, Lnet/lingala/zip4j/model/ZipModel;->getEndCentralDirRecord()Lnet/lingala/zip4j/model/EndCentralDirRecord;

    move-result-object v10

    invoke-virtual {v10}, Lnet/lingala/zip4j/model/EndCentralDirRecord;->getNoOfThisDisk()I

    move-result v10

    .line 761
    invoke-direct {p0, v9, v10}, Lnet/lingala/zip4j/core/HeaderWriter;->countNumberOfFileHeaderEntriesOnDisk(Ljava/util/ArrayList;I)I

    move-result v7

    .line 767
    :goto_0
    const/4 v9, 0x0

    int-to-short v10, v7

    invoke-static {v8, v9, v10}, Lnet/lingala/zip4j/util/Raw;->writeShortLittleEndian([BIS)V

    .line 768
    move-object/from16 v0, p6

    invoke-direct {p0, v8, v0}, Lnet/lingala/zip4j/core/HeaderWriter;->copyByteArrayToArrayList([BLjava/util/List;)V

    .line 771
    const/4 v9, 0x0

    int-to-short v10, v6

    invoke-static {v8, v9, v10}, Lnet/lingala/zip4j/util/Raw;->writeShortLittleEndian([BIS)V

    .line 772
    move-object/from16 v0, p6

    invoke-direct {p0, v8, v0}, Lnet/lingala/zip4j/core/HeaderWriter;->copyByteArrayToArrayList([BLjava/util/List;)V

    .line 775
    const/4 v9, 0x0

    invoke-static {v4, v9, p3}, Lnet/lingala/zip4j/util/Raw;->writeIntLittleEndian([BII)V

    .line 776
    move-object/from16 v0, p6

    invoke-direct {p0, v4, v0}, Lnet/lingala/zip4j/core/HeaderWriter;->copyByteArrayToArrayList([BLjava/util/List;)V

    .line 779
    const-wide v10, 0xffffffffL

    cmp-long v9, p4, v10

    if-lez v9, :cond_7

    .line 780
    const/4 v9, 0x0

    const-wide v10, 0xffffffffL

    invoke-static {v5, v9, v10, v11}, Lnet/lingala/zip4j/util/Raw;->writeLongLittleEndian([BIJ)V

    .line 781
    const/4 v9, 0x0

    const/4 v10, 0x0

    const/4 v11, 0x4

    invoke-static {v5, v9, v4, v10, v11}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 782
    move-object/from16 v0, p6

    invoke-direct {p0, v4, v0}, Lnet/lingala/zip4j/core/HeaderWriter;->copyByteArrayToArrayList([BLjava/util/List;)V

    .line 791
    :goto_1
    const/4 v2, 0x0

    .line 792
    .local v2, "commentLength":I
    invoke-virtual {p1}, Lnet/lingala/zip4j/model/ZipModel;->getEndCentralDirRecord()Lnet/lingala/zip4j/model/EndCentralDirRecord;

    move-result-object v9

    invoke-virtual {v9}, Lnet/lingala/zip4j/model/EndCentralDirRecord;->getComment()Ljava/lang/String;

    move-result-object v9

    if-eqz v9, :cond_4

    .line 793
    invoke-virtual {p1}, Lnet/lingala/zip4j/model/ZipModel;->getEndCentralDirRecord()Lnet/lingala/zip4j/model/EndCentralDirRecord;

    move-result-object v9

    invoke-virtual {v9}, Lnet/lingala/zip4j/model/EndCentralDirRecord;->getCommentLength()I

    move-result v2

    .line 795
    :cond_4
    const/4 v9, 0x0

    int-to-short v10, v2

    invoke-static {v8, v9, v10}, Lnet/lingala/zip4j/util/Raw;->writeShortLittleEndian([BIS)V

    .line 796
    move-object/from16 v0, p6

    invoke-direct {p0, v8, v0}, Lnet/lingala/zip4j/core/HeaderWriter;->copyByteArrayToArrayList([BLjava/util/List;)V

    .line 799
    if-lez v2, :cond_5

    .line 800
    invoke-virtual {p1}, Lnet/lingala/zip4j/model/ZipModel;->getEndCentralDirRecord()Lnet/lingala/zip4j/model/EndCentralDirRecord;

    move-result-object v9

    invoke-virtual {v9}, Lnet/lingala/zip4j/model/EndCentralDirRecord;->getCommentBytes()[B

    move-result-object v9

    move-object/from16 v0, p6

    invoke-direct {p0, v9, v0}, Lnet/lingala/zip4j/core/HeaderWriter;->copyByteArrayToArrayList([BLjava/util/List;)V

    .line 806
    :cond_5
    return-void

    .line 764
    .end local v2    # "commentLength":I
    :cond_6
    move v7, v6

    goto :goto_0

    .line 784
    :cond_7
    const/4 v9, 0x0

    move-wide/from16 v0, p4

    invoke-static {v5, v9, v0, v1}, Lnet/lingala/zip4j/util/Raw;->writeLongLittleEndian([BIJ)V

    .line 785
    const/4 v9, 0x0

    const/4 v10, 0x0

    const/4 v11, 0x4

    invoke-static {v5, v9, v4, v10, v11}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 787
    move-object/from16 v0, p6

    invoke-direct {p0, v4, v0}, Lnet/lingala/zip4j/core/HeaderWriter;->copyByteArrayToArrayList([BLjava/util/List;)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_1
.end method

.method private writeFileHeader(Lnet/lingala/zip4j/model/ZipModel;Lnet/lingala/zip4j/model/FileHeader;Ljava/io/OutputStream;Ljava/util/List;)I
    .locals 24
    .param p1, "zipModel"    # Lnet/lingala/zip4j/model/ZipModel;
    .param p2, "fileHeader"    # Lnet/lingala/zip4j/model/FileHeader;
    .param p3, "outputStream"    # Ljava/io/OutputStream;
    .param p4, "headerBytesList"    # Ljava/util/List;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lnet/lingala/zip4j/exception/ZipException;
        }
    .end annotation

    .prologue
    .line 398
    if-eqz p2, :cond_0

    if-nez p3, :cond_1

    .line 399
    :cond_0
    new-instance v20, Lnet/lingala/zip4j/exception/ZipException;

    const-string v21, "input parameters is null, cannot write local file header"

    invoke-direct/range {v20 .. v21}, Lnet/lingala/zip4j/exception/ZipException;-><init>(Ljava/lang/String;)V

    throw v20

    .line 403
    :cond_1
    const/16 v17, 0x0

    .line 405
    .local v17, "sizeOfFileHeader":I
    const/16 v20, 0x2

    :try_start_0
    move/from16 v0, v20

    new-array v0, v0, [B

    move-object/from16 v16, v0

    .line 406
    .local v16, "shortByte":[B
    const/16 v20, 0x4

    move/from16 v0, v20

    new-array v13, v0, [B

    .line 407
    .local v13, "intByte":[B
    const/16 v20, 0x8

    move/from16 v0, v20

    new-array v14, v0, [B

    .line 408
    .local v14, "longByte":[B
    const/16 v20, 0x2

    move/from16 v0, v20

    new-array v10, v0, [B

    .line 409
    .local v10, "emptyShortByte":[B
    const/16 v20, 0x4

    move/from16 v0, v20

    new-array v9, v0, [B

    .line 411
    .local v9, "emptyIntByte":[B
    const/16 v18, 0x0

    .line 412
    .local v18, "writeZip64FileSize":Z
    const/16 v19, 0x0

    .line 414
    .local v19, "writeZip64OffsetLocalHeader":Z
    const/16 v20, 0x0

    invoke-virtual/range {p2 .. p2}, Lnet/lingala/zip4j/model/FileHeader;->getSignature()I

    move-result v21

    move/from16 v0, v20

    move/from16 v1, v21

    invoke-static {v13, v0, v1}, Lnet/lingala/zip4j/util/Raw;->writeIntLittleEndian([BII)V

    .line 415
    move-object/from16 v0, p0

    move-object/from16 v1, p4

    invoke-direct {v0, v13, v1}, Lnet/lingala/zip4j/core/HeaderWriter;->copyByteArrayToArrayList([BLjava/util/List;)V

    .line 416
    add-int/lit8 v17, v17, 0x4

    .line 418
    const/16 v20, 0x0

    invoke-virtual/range {p2 .. p2}, Lnet/lingala/zip4j/model/FileHeader;->getVersionMadeBy()I

    move-result v21

    move/from16 v0, v21

    int-to-short v0, v0

    move/from16 v21, v0

    move-object/from16 v0, v16

    move/from16 v1, v20

    move/from16 v2, v21

    invoke-static {v0, v1, v2}, Lnet/lingala/zip4j/util/Raw;->writeShortLittleEndian([BIS)V

    .line 419
    move-object/from16 v0, p0

    move-object/from16 v1, v16

    move-object/from16 v2, p4

    invoke-direct {v0, v1, v2}, Lnet/lingala/zip4j/core/HeaderWriter;->copyByteArrayToArrayList([BLjava/util/List;)V

    .line 420
    add-int/lit8 v17, v17, 0x2

    .line 422
    const/16 v20, 0x0

    invoke-virtual/range {p2 .. p2}, Lnet/lingala/zip4j/model/FileHeader;->getVersionNeededToExtract()I

    move-result v21

    move/from16 v0, v21

    int-to-short v0, v0

    move/from16 v21, v0

    move-object/from16 v0, v16

    move/from16 v1, v20

    move/from16 v2, v21

    invoke-static {v0, v1, v2}, Lnet/lingala/zip4j/util/Raw;->writeShortLittleEndian([BIS)V

    .line 423
    move-object/from16 v0, p0

    move-object/from16 v1, v16

    move-object/from16 v2, p4

    invoke-direct {v0, v1, v2}, Lnet/lingala/zip4j/core/HeaderWriter;->copyByteArrayToArrayList([BLjava/util/List;)V

    .line 424
    add-int/lit8 v17, v17, 0x2

    .line 426
    invoke-virtual/range {p2 .. p2}, Lnet/lingala/zip4j/model/FileHeader;->getGeneralPurposeFlag()[B

    move-result-object v20

    move-object/from16 v0, p0

    move-object/from16 v1, v20

    move-object/from16 v2, p4

    invoke-direct {v0, v1, v2}, Lnet/lingala/zip4j/core/HeaderWriter;->copyByteArrayToArrayList([BLjava/util/List;)V

    .line 427
    add-int/lit8 v17, v17, 0x2

    .line 429
    const/16 v20, 0x0

    invoke-virtual/range {p2 .. p2}, Lnet/lingala/zip4j/model/FileHeader;->getCompressionMethod()I

    move-result v21

    move/from16 v0, v21

    int-to-short v0, v0

    move/from16 v21, v0

    move-object/from16 v0, v16

    move/from16 v1, v20

    move/from16 v2, v21

    invoke-static {v0, v1, v2}, Lnet/lingala/zip4j/util/Raw;->writeShortLittleEndian([BIS)V

    .line 430
    move-object/from16 v0, p0

    move-object/from16 v1, v16

    move-object/from16 v2, p4

    invoke-direct {v0, v1, v2}, Lnet/lingala/zip4j/core/HeaderWriter;->copyByteArrayToArrayList([BLjava/util/List;)V

    .line 431
    add-int/lit8 v17, v17, 0x2

    .line 433
    invoke-virtual/range {p2 .. p2}, Lnet/lingala/zip4j/model/FileHeader;->getLastModFileTime()I

    move-result v7

    .line 434
    .local v7, "dateTime":I
    const/16 v20, 0x0

    move/from16 v0, v20

    invoke-static {v13, v0, v7}, Lnet/lingala/zip4j/util/Raw;->writeIntLittleEndian([BII)V

    .line 435
    move-object/from16 v0, p0

    move-object/from16 v1, p4

    invoke-direct {v0, v13, v1}, Lnet/lingala/zip4j/core/HeaderWriter;->copyByteArrayToArrayList([BLjava/util/List;)V

    .line 436
    add-int/lit8 v17, v17, 0x4

    .line 438
    const/16 v20, 0x0

    invoke-virtual/range {p2 .. p2}, Lnet/lingala/zip4j/model/FileHeader;->getCrc32()J

    move-result-wide v22

    move-wide/from16 v0, v22

    long-to-int v0, v0

    move/from16 v21, v0

    move/from16 v0, v20

    move/from16 v1, v21

    invoke-static {v13, v0, v1}, Lnet/lingala/zip4j/util/Raw;->writeIntLittleEndian([BII)V

    .line 439
    move-object/from16 v0, p0

    move-object/from16 v1, p4

    invoke-direct {v0, v13, v1}, Lnet/lingala/zip4j/core/HeaderWriter;->copyByteArrayToArrayList([BLjava/util/List;)V

    .line 440
    add-int/lit8 v17, v17, 0x4

    .line 442
    invoke-virtual/range {p2 .. p2}, Lnet/lingala/zip4j/model/FileHeader;->getCompressedSize()J

    move-result-wide v20

    const-wide v22, 0xffffffffL

    cmp-long v20, v20, v22

    if-gez v20, :cond_2

    .line 443
    invoke-virtual/range {p2 .. p2}, Lnet/lingala/zip4j/model/FileHeader;->getUncompressedSize()J

    move-result-wide v20

    const-wide/16 v22, 0x32

    add-long v20, v20, v22

    const-wide v22, 0xffffffffL

    cmp-long v20, v20, v22

    if-ltz v20, :cond_d

    .line 444
    :cond_2
    const/16 v20, 0x0

    const-wide v22, 0xffffffffL

    move/from16 v0, v20

    move-wide/from16 v1, v22

    invoke-static {v14, v0, v1, v2}, Lnet/lingala/zip4j/util/Raw;->writeLongLittleEndian([BIJ)V

    .line 445
    const/16 v20, 0x0

    const/16 v21, 0x0

    const/16 v22, 0x4

    move/from16 v0, v20

    move/from16 v1, v21

    move/from16 v2, v22

    invoke-static {v14, v0, v13, v1, v2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 447
    move-object/from16 v0, p0

    move-object/from16 v1, p4

    invoke-direct {v0, v13, v1}, Lnet/lingala/zip4j/core/HeaderWriter;->copyByteArrayToArrayList([BLjava/util/List;)V

    .line 448
    add-int/lit8 v17, v17, 0x4

    .line 450
    move-object/from16 v0, p0

    move-object/from16 v1, p4

    invoke-direct {v0, v13, v1}, Lnet/lingala/zip4j/core/HeaderWriter;->copyByteArrayToArrayList([BLjava/util/List;)V

    .line 451
    add-int/lit8 v17, v17, 0x4

    .line 453
    const/16 v18, 0x1

    .line 468
    :goto_0
    const/16 v20, 0x0

    invoke-virtual/range {p2 .. p2}, Lnet/lingala/zip4j/model/FileHeader;->getFileNameLength()I

    move-result v21

    move/from16 v0, v21

    int-to-short v0, v0

    move/from16 v21, v0

    move-object/from16 v0, v16

    move/from16 v1, v20

    move/from16 v2, v21

    invoke-static {v0, v1, v2}, Lnet/lingala/zip4j/util/Raw;->writeShortLittleEndian([BIS)V

    .line 469
    move-object/from16 v0, p0

    move-object/from16 v1, v16

    move-object/from16 v2, p4

    invoke-direct {v0, v1, v2}, Lnet/lingala/zip4j/core/HeaderWriter;->copyByteArrayToArrayList([BLjava/util/List;)V

    .line 470
    add-int/lit8 v17, v17, 0x2

    .line 474
    const/16 v20, 0x4

    move/from16 v0, v20

    new-array v15, v0, [B

    .line 475
    .local v15, "offsetLocalHeaderBytes":[B
    invoke-virtual/range {p2 .. p2}, Lnet/lingala/zip4j/model/FileHeader;->getOffsetLocalHeader()J

    move-result-wide v20

    const-wide v22, 0xffffffffL

    cmp-long v20, v20, v22

    if-lez v20, :cond_e

    .line 476
    const/16 v20, 0x0

    const-wide v22, 0xffffffffL

    move/from16 v0, v20

    move-wide/from16 v1, v22

    invoke-static {v14, v0, v1, v2}, Lnet/lingala/zip4j/util/Raw;->writeLongLittleEndian([BIJ)V

    .line 477
    const/16 v20, 0x0

    const/16 v21, 0x0

    const/16 v22, 0x4

    move/from16 v0, v20

    move/from16 v1, v21

    move/from16 v2, v22

    invoke-static {v14, v0, v15, v1, v2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 478
    const/16 v19, 0x1

    .line 485
    :goto_1
    const/4 v11, 0x0

    .line 486
    .local v11, "extraFieldLength":I
    if-nez v18, :cond_3

    if-eqz v19, :cond_5

    .line 487
    :cond_3
    add-int/lit8 v11, v11, 0x4

    .line 488
    if-eqz v18, :cond_4

    .line 489
    add-int/lit8 v11, v11, 0x10

    .line 490
    :cond_4
    if-eqz v19, :cond_5

    .line 491
    add-int/lit8 v11, v11, 0x8

    .line 493
    :cond_5
    invoke-virtual/range {p2 .. p2}, Lnet/lingala/zip4j/model/FileHeader;->getAesExtraDataRecord()Lnet/lingala/zip4j/model/AESExtraDataRecord;

    move-result-object v20

    if-eqz v20, :cond_6

    .line 494
    add-int/lit8 v11, v11, 0xb

    .line 496
    :cond_6
    const/16 v20, 0x0

    int-to-short v0, v11

    move/from16 v21, v0

    move-object/from16 v0, v16

    move/from16 v1, v20

    move/from16 v2, v21

    invoke-static {v0, v1, v2}, Lnet/lingala/zip4j/util/Raw;->writeShortLittleEndian([BIS)V

    .line 497
    move-object/from16 v0, p0

    move-object/from16 v1, v16

    move-object/from16 v2, p4

    invoke-direct {v0, v1, v2}, Lnet/lingala/zip4j/core/HeaderWriter;->copyByteArrayToArrayList([BLjava/util/List;)V

    .line 498
    add-int/lit8 v17, v17, 0x2

    .line 501
    move-object/from16 v0, p0

    move-object/from16 v1, p4

    invoke-direct {v0, v10, v1}, Lnet/lingala/zip4j/core/HeaderWriter;->copyByteArrayToArrayList([BLjava/util/List;)V

    .line 502
    add-int/lit8 v17, v17, 0x2

    .line 505
    const/16 v20, 0x0

    invoke-virtual/range {p2 .. p2}, Lnet/lingala/zip4j/model/FileHeader;->getDiskNumberStart()I

    move-result v21

    move/from16 v0, v21

    int-to-short v0, v0

    move/from16 v21, v0

    move-object/from16 v0, v16

    move/from16 v1, v20

    move/from16 v2, v21

    invoke-static {v0, v1, v2}, Lnet/lingala/zip4j/util/Raw;->writeShortLittleEndian([BIS)V

    .line 506
    move-object/from16 v0, p0

    move-object/from16 v1, v16

    move-object/from16 v2, p4

    invoke-direct {v0, v1, v2}, Lnet/lingala/zip4j/core/HeaderWriter;->copyByteArrayToArrayList([BLjava/util/List;)V

    .line 507
    add-int/lit8 v17, v17, 0x2

    .line 510
    move-object/from16 v0, p0

    move-object/from16 v1, p4

    invoke-direct {v0, v10, v1}, Lnet/lingala/zip4j/core/HeaderWriter;->copyByteArrayToArrayList([BLjava/util/List;)V

    .line 511
    add-int/lit8 v17, v17, 0x2

    .line 514
    invoke-virtual/range {p2 .. p2}, Lnet/lingala/zip4j/model/FileHeader;->getExternalFileAttr()[B

    move-result-object v20

    if-eqz v20, :cond_f

    .line 515
    invoke-virtual/range {p2 .. p2}, Lnet/lingala/zip4j/model/FileHeader;->getExternalFileAttr()[B

    move-result-object v20

    move-object/from16 v0, p0

    move-object/from16 v1, v20

    move-object/from16 v2, p4

    invoke-direct {v0, v1, v2}, Lnet/lingala/zip4j/core/HeaderWriter;->copyByteArrayToArrayList([BLjava/util/List;)V

    .line 519
    :goto_2
    add-int/lit8 v17, v17, 0x4

    .line 523
    move-object/from16 v0, p0

    move-object/from16 v1, p4

    invoke-direct {v0, v15, v1}, Lnet/lingala/zip4j/core/HeaderWriter;->copyByteArrayToArrayList([BLjava/util/List;)V

    .line 524
    add-int/lit8 v17, v17, 0x4

    .line 526
    invoke-virtual/range {p1 .. p1}, Lnet/lingala/zip4j/model/ZipModel;->getFileNameCharset()Ljava/lang/String;

    move-result-object v20

    invoke-static/range {v20 .. v20}, Lnet/lingala/zip4j/util/Zip4jUtil;->isStringNotNullAndNotEmpty(Ljava/lang/String;)Z

    move-result v20

    if-eqz v20, :cond_10

    .line 527
    invoke-virtual/range {p2 .. p2}, Lnet/lingala/zip4j/model/FileHeader;->getFileName()Ljava/lang/String;

    move-result-object v20

    invoke-virtual/range {p1 .. p1}, Lnet/lingala/zip4j/model/ZipModel;->getFileNameCharset()Ljava/lang/String;

    move-result-object v21

    invoke-virtual/range {v20 .. v21}, Ljava/lang/String;->getBytes(Ljava/lang/String;)[B

    move-result-object v12

    .line 528
    .local v12, "fileNameBytes":[B
    move-object/from16 v0, p0

    move-object/from16 v1, p4

    invoke-direct {v0, v12, v1}, Lnet/lingala/zip4j/core/HeaderWriter;->copyByteArrayToArrayList([BLjava/util/List;)V

    .line 529
    array-length v0, v12

    move/from16 v20, v0

    add-int/lit8 v17, v20, 0x2e

    .line 535
    .end local v12    # "fileNameBytes":[B
    :goto_3
    if-nez v18, :cond_7

    if-eqz v19, :cond_b

    .line 536
    :cond_7
    const/16 v20, 0x1

    move-object/from16 v0, p1

    move/from16 v1, v20

    invoke-virtual {v0, v1}, Lnet/lingala/zip4j/model/ZipModel;->setZip64Format(Z)V

    .line 539
    const/16 v20, 0x0

    const/16 v21, 0x1

    move-object/from16 v0, v16

    move/from16 v1, v20

    move/from16 v2, v21

    invoke-static {v0, v1, v2}, Lnet/lingala/zip4j/util/Raw;->writeShortLittleEndian([BIS)V

    .line 540
    move-object/from16 v0, p0

    move-object/from16 v1, v16

    move-object/from16 v2, p4

    invoke-direct {v0, v1, v2}, Lnet/lingala/zip4j/core/HeaderWriter;->copyByteArrayToArrayList([BLjava/util/List;)V

    .line 541
    add-int/lit8 v17, v17, 0x2

    .line 544
    const/4 v6, 0x0

    .line 546
    .local v6, "dataSize":I
    if-eqz v18, :cond_8

    .line 547
    add-int/lit8 v6, v6, 0x10

    .line 549
    :cond_8
    if-eqz v19, :cond_9

    .line 550
    add-int/lit8 v6, v6, 0x8

    .line 553
    :cond_9
    const/16 v20, 0x0

    int-to-short v0, v6

    move/from16 v21, v0

    move-object/from16 v0, v16

    move/from16 v1, v20

    move/from16 v2, v21

    invoke-static {v0, v1, v2}, Lnet/lingala/zip4j/util/Raw;->writeShortLittleEndian([BIS)V

    .line 554
    move-object/from16 v0, p0

    move-object/from16 v1, v16

    move-object/from16 v2, p4

    invoke-direct {v0, v1, v2}, Lnet/lingala/zip4j/core/HeaderWriter;->copyByteArrayToArrayList([BLjava/util/List;)V

    .line 555
    add-int/lit8 v17, v17, 0x2

    .line 557
    if-eqz v18, :cond_a

    .line 558
    const/16 v20, 0x0

    invoke-virtual/range {p2 .. p2}, Lnet/lingala/zip4j/model/FileHeader;->getUncompressedSize()J

    move-result-wide v22

    move/from16 v0, v20

    move-wide/from16 v1, v22

    invoke-static {v14, v0, v1, v2}, Lnet/lingala/zip4j/util/Raw;->writeLongLittleEndian([BIJ)V

    .line 559
    move-object/from16 v0, p0

    move-object/from16 v1, p4

    invoke-direct {v0, v14, v1}, Lnet/lingala/zip4j/core/HeaderWriter;->copyByteArrayToArrayList([BLjava/util/List;)V

    .line 560
    add-int/lit8 v17, v17, 0x8

    .line 562
    const/16 v20, 0x0

    invoke-virtual/range {p2 .. p2}, Lnet/lingala/zip4j/model/FileHeader;->getCompressedSize()J

    move-result-wide v22

    move/from16 v0, v20

    move-wide/from16 v1, v22

    invoke-static {v14, v0, v1, v2}, Lnet/lingala/zip4j/util/Raw;->writeLongLittleEndian([BIJ)V

    .line 563
    move-object/from16 v0, p0

    move-object/from16 v1, p4

    invoke-direct {v0, v14, v1}, Lnet/lingala/zip4j/core/HeaderWriter;->copyByteArrayToArrayList([BLjava/util/List;)V

    .line 564
    add-int/lit8 v17, v17, 0x8

    .line 567
    :cond_a
    if-eqz v19, :cond_b

    .line 568
    const/16 v20, 0x0

    invoke-virtual/range {p2 .. p2}, Lnet/lingala/zip4j/model/FileHeader;->getOffsetLocalHeader()J

    move-result-wide v22

    move/from16 v0, v20

    move-wide/from16 v1, v22

    invoke-static {v14, v0, v1, v2}, Lnet/lingala/zip4j/util/Raw;->writeLongLittleEndian([BIJ)V

    .line 569
    move-object/from16 v0, p0

    move-object/from16 v1, p4

    invoke-direct {v0, v14, v1}, Lnet/lingala/zip4j/core/HeaderWriter;->copyByteArrayToArrayList([BLjava/util/List;)V

    .line 570
    add-int/lit8 v17, v17, 0x8

    .line 574
    .end local v6    # "dataSize":I
    :cond_b
    invoke-virtual/range {p2 .. p2}, Lnet/lingala/zip4j/model/FileHeader;->getAesExtraDataRecord()Lnet/lingala/zip4j/model/AESExtraDataRecord;

    move-result-object v20

    if-eqz v20, :cond_c

    .line 575
    invoke-virtual/range {p2 .. p2}, Lnet/lingala/zip4j/model/FileHeader;->getAesExtraDataRecord()Lnet/lingala/zip4j/model/AESExtraDataRecord;

    move-result-object v4

    .line 577
    .local v4, "aesExtraDataRecord":Lnet/lingala/zip4j/model/AESExtraDataRecord;
    const/16 v20, 0x0

    invoke-virtual {v4}, Lnet/lingala/zip4j/model/AESExtraDataRecord;->getSignature()J

    move-result-wide v22

    move-wide/from16 v0, v22

    long-to-int v0, v0

    move/from16 v21, v0

    move/from16 v0, v21

    int-to-short v0, v0

    move/from16 v21, v0

    move-object/from16 v0, v16

    move/from16 v1, v20

    move/from16 v2, v21

    invoke-static {v0, v1, v2}, Lnet/lingala/zip4j/util/Raw;->writeShortLittleEndian([BIS)V

    .line 578
    move-object/from16 v0, p0

    move-object/from16 v1, v16

    move-object/from16 v2, p4

    invoke-direct {v0, v1, v2}, Lnet/lingala/zip4j/core/HeaderWriter;->copyByteArrayToArrayList([BLjava/util/List;)V

    .line 580
    const/16 v20, 0x0

    invoke-virtual {v4}, Lnet/lingala/zip4j/model/AESExtraDataRecord;->getDataSize()I

    move-result v21

    move/from16 v0, v21

    int-to-short v0, v0

    move/from16 v21, v0

    move-object/from16 v0, v16

    move/from16 v1, v20

    move/from16 v2, v21

    invoke-static {v0, v1, v2}, Lnet/lingala/zip4j/util/Raw;->writeShortLittleEndian([BIS)V

    .line 581
    move-object/from16 v0, p0

    move-object/from16 v1, v16

    move-object/from16 v2, p4

    invoke-direct {v0, v1, v2}, Lnet/lingala/zip4j/core/HeaderWriter;->copyByteArrayToArrayList([BLjava/util/List;)V

    .line 583
    const/16 v20, 0x0

    invoke-virtual {v4}, Lnet/lingala/zip4j/model/AESExtraDataRecord;->getVersionNumber()I

    move-result v21

    move/from16 v0, v21

    int-to-short v0, v0

    move/from16 v21, v0

    move-object/from16 v0, v16

    move/from16 v1, v20

    move/from16 v2, v21

    invoke-static {v0, v1, v2}, Lnet/lingala/zip4j/util/Raw;->writeShortLittleEndian([BIS)V

    .line 584
    move-object/from16 v0, p0

    move-object/from16 v1, v16

    move-object/from16 v2, p4

    invoke-direct {v0, v1, v2}, Lnet/lingala/zip4j/core/HeaderWriter;->copyByteArrayToArrayList([BLjava/util/List;)V

    .line 586
    invoke-virtual {v4}, Lnet/lingala/zip4j/model/AESExtraDataRecord;->getVendorID()Ljava/lang/String;

    move-result-object v20

    invoke-virtual/range {v20 .. v20}, Ljava/lang/String;->getBytes()[B

    move-result-object v20

    move-object/from16 v0, p0

    move-object/from16 v1, v20

    move-object/from16 v2, p4

    invoke-direct {v0, v1, v2}, Lnet/lingala/zip4j/core/HeaderWriter;->copyByteArrayToArrayList([BLjava/util/List;)V

    .line 588
    const/16 v20, 0x1

    move/from16 v0, v20

    new-array v5, v0, [B

    .line 589
    .local v5, "aesStrengthBytes":[B
    const/16 v20, 0x0

    invoke-virtual {v4}, Lnet/lingala/zip4j/model/AESExtraDataRecord;->getAesStrength()I

    move-result v21

    move/from16 v0, v21

    int-to-byte v0, v0

    move/from16 v21, v0

    aput-byte v21, v5, v20

    .line 590
    move-object/from16 v0, p0

    move-object/from16 v1, p4

    invoke-direct {v0, v5, v1}, Lnet/lingala/zip4j/core/HeaderWriter;->copyByteArrayToArrayList([BLjava/util/List;)V

    .line 592
    const/16 v20, 0x0

    invoke-virtual {v4}, Lnet/lingala/zip4j/model/AESExtraDataRecord;->getCompressionMethod()I

    move-result v21

    move/from16 v0, v21

    int-to-short v0, v0

    move/from16 v21, v0

    move-object/from16 v0, v16

    move/from16 v1, v20

    move/from16 v2, v21

    invoke-static {v0, v1, v2}, Lnet/lingala/zip4j/util/Raw;->writeShortLittleEndian([BIS)V

    .line 593
    move-object/from16 v0, p0

    move-object/from16 v1, v16

    move-object/from16 v2, p4

    invoke-direct {v0, v1, v2}, Lnet/lingala/zip4j/core/HeaderWriter;->copyByteArrayToArrayList([BLjava/util/List;)V

    .line 595
    add-int/lit8 v17, v17, 0xb

    .line 600
    .end local v4    # "aesExtraDataRecord":Lnet/lingala/zip4j/model/AESExtraDataRecord;
    .end local v5    # "aesStrengthBytes":[B
    :cond_c
    return v17

    .line 455
    .end local v11    # "extraFieldLength":I
    .end local v15    # "offsetLocalHeaderBytes":[B
    :cond_d
    const/16 v20, 0x0

    invoke-virtual/range {p2 .. p2}, Lnet/lingala/zip4j/model/FileHeader;->getCompressedSize()J

    move-result-wide v22

    move/from16 v0, v20

    move-wide/from16 v1, v22

    invoke-static {v14, v0, v1, v2}, Lnet/lingala/zip4j/util/Raw;->writeLongLittleEndian([BIJ)V

    .line 456
    const/16 v20, 0x0

    const/16 v21, 0x0

    const/16 v22, 0x4

    move/from16 v0, v20

    move/from16 v1, v21

    move/from16 v2, v22

    invoke-static {v14, v0, v13, v1, v2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 458
    move-object/from16 v0, p0

    move-object/from16 v1, p4

    invoke-direct {v0, v13, v1}, Lnet/lingala/zip4j/core/HeaderWriter;->copyByteArrayToArrayList([BLjava/util/List;)V

    .line 459
    add-int/lit8 v17, v17, 0x4

    .line 461
    const/16 v20, 0x0

    invoke-virtual/range {p2 .. p2}, Lnet/lingala/zip4j/model/FileHeader;->getUncompressedSize()J

    move-result-wide v22

    move/from16 v0, v20

    move-wide/from16 v1, v22

    invoke-static {v14, v0, v1, v2}, Lnet/lingala/zip4j/util/Raw;->writeLongLittleEndian([BIJ)V

    .line 462
    const/16 v20, 0x0

    const/16 v21, 0x0

    const/16 v22, 0x4

    move/from16 v0, v20

    move/from16 v1, v21

    move/from16 v2, v22

    invoke-static {v14, v0, v13, v1, v2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 464
    move-object/from16 v0, p0

    move-object/from16 v1, p4

    invoke-direct {v0, v13, v1}, Lnet/lingala/zip4j/core/HeaderWriter;->copyByteArrayToArrayList([BLjava/util/List;)V

    .line 465
    add-int/lit8 v17, v17, 0x4

    goto/16 :goto_0

    .line 480
    .restart local v15    # "offsetLocalHeaderBytes":[B
    :cond_e
    const/16 v20, 0x0

    invoke-virtual/range {p2 .. p2}, Lnet/lingala/zip4j/model/FileHeader;->getOffsetLocalHeader()J

    move-result-wide v22

    move/from16 v0, v20

    move-wide/from16 v1, v22

    invoke-static {v14, v0, v1, v2}, Lnet/lingala/zip4j/util/Raw;->writeLongLittleEndian([BIJ)V

    .line 481
    const/16 v20, 0x0

    const/16 v21, 0x0

    const/16 v22, 0x4

    move/from16 v0, v20

    move/from16 v1, v21

    move/from16 v2, v22

    invoke-static {v14, v0, v15, v1, v2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto/16 :goto_1

    .line 601
    .end local v7    # "dateTime":I
    .end local v9    # "emptyIntByte":[B
    .end local v10    # "emptyShortByte":[B
    .end local v13    # "intByte":[B
    .end local v14    # "longByte":[B
    .end local v15    # "offsetLocalHeaderBytes":[B
    .end local v16    # "shortByte":[B
    .end local v18    # "writeZip64FileSize":Z
    .end local v19    # "writeZip64OffsetLocalHeader":Z
    :catch_0
    move-exception v8

    .line 602
    .local v8, "e":Ljava/lang/Exception;
    new-instance v20, Lnet/lingala/zip4j/exception/ZipException;

    move-object/from16 v0, v20

    invoke-direct {v0, v8}, Lnet/lingala/zip4j/exception/ZipException;-><init>(Ljava/lang/Throwable;)V

    throw v20

    .line 517
    .end local v8    # "e":Ljava/lang/Exception;
    .restart local v7    # "dateTime":I
    .restart local v9    # "emptyIntByte":[B
    .restart local v10    # "emptyShortByte":[B
    .restart local v11    # "extraFieldLength":I
    .restart local v13    # "intByte":[B
    .restart local v14    # "longByte":[B
    .restart local v15    # "offsetLocalHeaderBytes":[B
    .restart local v16    # "shortByte":[B
    .restart local v18    # "writeZip64FileSize":Z
    .restart local v19    # "writeZip64OffsetLocalHeader":Z
    :cond_f
    :try_start_1
    move-object/from16 v0, p0

    move-object/from16 v1, p4

    invoke-direct {v0, v9, v1}, Lnet/lingala/zip4j/core/HeaderWriter;->copyByteArrayToArrayList([BLjava/util/List;)V

    goto/16 :goto_2

    .line 531
    :cond_10
    invoke-virtual/range {p2 .. p2}, Lnet/lingala/zip4j/model/FileHeader;->getFileName()Ljava/lang/String;

    move-result-object v20

    invoke-static/range {v20 .. v20}, Lnet/lingala/zip4j/util/Zip4jUtil;->convertCharset(Ljava/lang/String;)[B

    move-result-object v20

    move-object/from16 v0, p0

    move-object/from16 v1, v20

    move-object/from16 v2, p4

    invoke-direct {v0, v1, v2}, Lnet/lingala/zip4j/core/HeaderWriter;->copyByteArrayToArrayList([BLjava/util/List;)V

    .line 532
    invoke-virtual/range {p2 .. p2}, Lnet/lingala/zip4j/model/FileHeader;->getFileName()Ljava/lang/String;

    move-result-object v20

    invoke-static/range {v20 .. v20}, Lnet/lingala/zip4j/util/Zip4jUtil;->getEncodedStringLength(Ljava/lang/String;)I
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    move-result v20

    add-int/lit8 v17, v20, 0x2e

    goto/16 :goto_3
.end method

.method private writeZip64EndOfCentralDirectoryLocator(Lnet/lingala/zip4j/model/ZipModel;Ljava/io/OutputStream;Ljava/util/List;)V
    .locals 8
    .param p1, "zipModel"    # Lnet/lingala/zip4j/model/ZipModel;
    .param p2, "outputStream"    # Ljava/io/OutputStream;
    .param p3, "headerBytesList"    # Ljava/util/List;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lnet/lingala/zip4j/exception/ZipException;
        }
    .end annotation

    .prologue
    .line 693
    if-eqz p1, :cond_0

    if-nez p2, :cond_1

    .line 694
    :cond_0
    new-instance v4, Lnet/lingala/zip4j/exception/ZipException;

    const-string v5, "zip model or output stream is null, cannot write zip64 end of central directory locator"

    invoke-direct {v4, v5}, Lnet/lingala/zip4j/exception/ZipException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 699
    :cond_1
    const/4 v4, 0x4

    :try_start_0
    new-array v1, v4, [B

    .line 700
    .local v1, "intByte":[B
    const/16 v4, 0x8

    new-array v2, v4, [B

    .line 703
    .local v2, "longByte":[B
    const/4 v4, 0x0

    const v5, 0x7064b50

    invoke-static {v1, v4, v5}, Lnet/lingala/zip4j/util/Raw;->writeIntLittleEndian([BII)V

    .line 704
    invoke-direct {p0, v1, p3}, Lnet/lingala/zip4j/core/HeaderWriter;->copyByteArrayToArrayList([BLjava/util/List;)V

    .line 707
    const/4 v4, 0x0

    invoke-virtual {p1}, Lnet/lingala/zip4j/model/ZipModel;->getZip64EndCentralDirLocator()Lnet/lingala/zip4j/model/Zip64EndCentralDirLocator;

    move-result-object v5

    invoke-virtual {v5}, Lnet/lingala/zip4j/model/Zip64EndCentralDirLocator;->getNoOfDiskStartOfZip64EndOfCentralDirRec()I

    move-result v5

    invoke-static {v1, v4, v5}, Lnet/lingala/zip4j/util/Raw;->writeIntLittleEndian([BII)V

    .line 708
    invoke-direct {p0, v1, p3}, Lnet/lingala/zip4j/core/HeaderWriter;->copyByteArrayToArrayList([BLjava/util/List;)V

    .line 711
    const/4 v4, 0x0

    invoke-virtual {p1}, Lnet/lingala/zip4j/model/ZipModel;->getZip64EndCentralDirLocator()Lnet/lingala/zip4j/model/Zip64EndCentralDirLocator;

    move-result-object v5

    invoke-virtual {v5}, Lnet/lingala/zip4j/model/Zip64EndCentralDirLocator;->getOffsetZip64EndOfCentralDirRec()J

    move-result-wide v6

    invoke-static {v2, v4, v6, v7}, Lnet/lingala/zip4j/util/Raw;->writeLongLittleEndian([BIJ)V

    .line 712
    invoke-direct {p0, v2, p3}, Lnet/lingala/zip4j/core/HeaderWriter;->copyByteArrayToArrayList([BLjava/util/List;)V

    .line 715
    const/4 v4, 0x0

    invoke-virtual {p1}, Lnet/lingala/zip4j/model/ZipModel;->getZip64EndCentralDirLocator()Lnet/lingala/zip4j/model/Zip64EndCentralDirLocator;

    move-result-object v5

    invoke-virtual {v5}, Lnet/lingala/zip4j/model/Zip64EndCentralDirLocator;->getTotNumberOfDiscs()I

    move-result v5

    invoke-static {v1, v4, v5}, Lnet/lingala/zip4j/util/Raw;->writeIntLittleEndian([BII)V

    .line 716
    invoke-direct {p0, v1, p3}, Lnet/lingala/zip4j/core/HeaderWriter;->copyByteArrayToArrayList([BLjava/util/List;)V
    :try_end_0
    .catch Lnet/lingala/zip4j/exception/ZipException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1

    .line 722
    return-void

    .line 717
    .end local v1    # "intByte":[B
    .end local v2    # "longByte":[B
    :catch_0
    move-exception v3

    .line 718
    .local v3, "zipException":Lnet/lingala/zip4j/exception/ZipException;
    throw v3

    .line 719
    .end local v3    # "zipException":Lnet/lingala/zip4j/exception/ZipException;
    :catch_1
    move-exception v0

    .line 720
    .local v0, "e":Ljava/lang/Exception;
    new-instance v4, Lnet/lingala/zip4j/exception/ZipException;

    invoke-direct {v4, v0}, Lnet/lingala/zip4j/exception/ZipException;-><init>(Ljava/lang/Throwable;)V

    throw v4
.end method

.method private writeZip64EndOfCentralDirectoryRecord(Lnet/lingala/zip4j/model/ZipModel;Ljava/io/OutputStream;IJLjava/util/List;)V
    .locals 14
    .param p1, "zipModel"    # Lnet/lingala/zip4j/model/ZipModel;
    .param p2, "outputStream"    # Ljava/io/OutputStream;
    .param p3, "sizeOfCentralDir"    # I
    .param p4, "offsetCentralDir"    # J
    .param p6, "headerBytesList"    # Ljava/util/List;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lnet/lingala/zip4j/exception/ZipException;
        }
    .end annotation

    .prologue
    .line 609
    if-eqz p1, :cond_0

    if-nez p2, :cond_1

    .line 610
    :cond_0
    new-instance v10, Lnet/lingala/zip4j/exception/ZipException;

    const-string v11, "zip model or output stream is null, cannot write zip64 end of central directory record"

    invoke-direct {v10, v11}, Lnet/lingala/zip4j/exception/ZipException;-><init>(Ljava/lang/String;)V

    throw v10

    .line 615
    :cond_1
    const/4 v10, 0x2

    :try_start_0
    new-array v8, v10, [B

    .line 616
    .local v8, "shortByte":[B
    const/4 v10, 0x2

    new-array v3, v10, [B

    .line 617
    .local v3, "emptyShortByte":[B
    const/4 v10, 0x4

    new-array v4, v10, [B

    .line 618
    .local v4, "intByte":[B
    const/16 v10, 0x8

    new-array v5, v10, [B

    .line 621
    .local v5, "longByte":[B
    const/4 v10, 0x0

    const v11, 0x6064b50

    invoke-static {v4, v10, v11}, Lnet/lingala/zip4j/util/Raw;->writeIntLittleEndian([BII)V

    .line 622
    move-object/from16 v0, p6

    invoke-direct {p0, v4, v0}, Lnet/lingala/zip4j/core/HeaderWriter;->copyByteArrayToArrayList([BLjava/util/List;)V

    .line 625
    const/4 v10, 0x0

    const-wide/16 v12, 0x2c

    invoke-static {v5, v10, v12, v13}, Lnet/lingala/zip4j/util/Raw;->writeLongLittleEndian([BIJ)V

    .line 626
    move-object/from16 v0, p6

    invoke-direct {p0, v5, v0}, Lnet/lingala/zip4j/core/HeaderWriter;->copyByteArrayToArrayList([BLjava/util/List;)V

    .line 630
    invoke-virtual {p1}, Lnet/lingala/zip4j/model/ZipModel;->getCentralDirectory()Lnet/lingala/zip4j/model/CentralDirectory;

    move-result-object v10

    if-eqz v10, :cond_3

    .line 631
    invoke-virtual {p1}, Lnet/lingala/zip4j/model/ZipModel;->getCentralDirectory()Lnet/lingala/zip4j/model/CentralDirectory;

    move-result-object v10

    invoke-virtual {v10}, Lnet/lingala/zip4j/model/CentralDirectory;->getFileHeaders()Ljava/util/ArrayList;

    move-result-object v10

    if-eqz v10, :cond_3

    .line 632
    invoke-virtual {p1}, Lnet/lingala/zip4j/model/ZipModel;->getCentralDirectory()Lnet/lingala/zip4j/model/CentralDirectory;

    move-result-object v10

    invoke-virtual {v10}, Lnet/lingala/zip4j/model/CentralDirectory;->getFileHeaders()Ljava/util/ArrayList;

    move-result-object v10

    invoke-virtual {v10}, Ljava/util/ArrayList;->size()I

    move-result v10

    if-lez v10, :cond_3

    .line 633
    const/4 v11, 0x0

    .line 634
    invoke-virtual {p1}, Lnet/lingala/zip4j/model/ZipModel;->getCentralDirectory()Lnet/lingala/zip4j/model/CentralDirectory;

    move-result-object v10

    invoke-virtual {v10}, Lnet/lingala/zip4j/model/CentralDirectory;->getFileHeaders()Ljava/util/ArrayList;

    move-result-object v10

    const/4 v12, 0x0

    invoke-virtual {v10, v12}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Lnet/lingala/zip4j/model/FileHeader;

    invoke-virtual {v10}, Lnet/lingala/zip4j/model/FileHeader;->getVersionMadeBy()I

    move-result v10

    int-to-short v10, v10

    .line 633
    invoke-static {v8, v11, v10}, Lnet/lingala/zip4j/util/Raw;->writeShortLittleEndian([BIS)V

    .line 635
    move-object/from16 v0, p6

    invoke-direct {p0, v8, v0}, Lnet/lingala/zip4j/core/HeaderWriter;->copyByteArrayToArrayList([BLjava/util/List;)V

    .line 637
    const/4 v11, 0x0

    .line 638
    invoke-virtual {p1}, Lnet/lingala/zip4j/model/ZipModel;->getCentralDirectory()Lnet/lingala/zip4j/model/CentralDirectory;

    move-result-object v10

    invoke-virtual {v10}, Lnet/lingala/zip4j/model/CentralDirectory;->getFileHeaders()Ljava/util/ArrayList;

    move-result-object v10

    const/4 v12, 0x0

    invoke-virtual {v10, v12}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Lnet/lingala/zip4j/model/FileHeader;

    invoke-virtual {v10}, Lnet/lingala/zip4j/model/FileHeader;->getVersionNeededToExtract()I

    move-result v10

    int-to-short v10, v10

    .line 637
    invoke-static {v8, v11, v10}, Lnet/lingala/zip4j/util/Raw;->writeShortLittleEndian([BIS)V

    .line 639
    move-object/from16 v0, p6

    invoke-direct {p0, v8, v0}, Lnet/lingala/zip4j/core/HeaderWriter;->copyByteArrayToArrayList([BLjava/util/List;)V

    .line 646
    :goto_0
    const/4 v10, 0x0

    invoke-virtual {p1}, Lnet/lingala/zip4j/model/ZipModel;->getEndCentralDirRecord()Lnet/lingala/zip4j/model/EndCentralDirRecord;

    move-result-object v11

    invoke-virtual {v11}, Lnet/lingala/zip4j/model/EndCentralDirRecord;->getNoOfThisDisk()I

    move-result v11

    invoke-static {v4, v10, v11}, Lnet/lingala/zip4j/util/Raw;->writeIntLittleEndian([BII)V

    .line 647
    move-object/from16 v0, p6

    invoke-direct {p0, v4, v0}, Lnet/lingala/zip4j/core/HeaderWriter;->copyByteArrayToArrayList([BLjava/util/List;)V

    .line 650
    const/4 v10, 0x0

    invoke-virtual {p1}, Lnet/lingala/zip4j/model/ZipModel;->getEndCentralDirRecord()Lnet/lingala/zip4j/model/EndCentralDirRecord;

    move-result-object v11

    invoke-virtual {v11}, Lnet/lingala/zip4j/model/EndCentralDirRecord;->getNoOfThisDiskStartOfCentralDir()I

    move-result v11

    invoke-static {v4, v10, v11}, Lnet/lingala/zip4j/util/Raw;->writeIntLittleEndian([BII)V

    .line 651
    move-object/from16 v0, p6

    invoke-direct {p0, v4, v0}, Lnet/lingala/zip4j/core/HeaderWriter;->copyByteArrayToArrayList([BLjava/util/List;)V

    .line 654
    const/4 v6, 0x0

    .line 655
    .local v6, "numEntries":I
    const/4 v7, 0x0

    .line 656
    .local v7, "numEntriesOnThisDisk":I
    invoke-virtual {p1}, Lnet/lingala/zip4j/model/ZipModel;->getCentralDirectory()Lnet/lingala/zip4j/model/CentralDirectory;

    move-result-object v10

    if-eqz v10, :cond_2

    .line 657
    invoke-virtual {p1}, Lnet/lingala/zip4j/model/ZipModel;->getCentralDirectory()Lnet/lingala/zip4j/model/CentralDirectory;

    move-result-object v10

    invoke-virtual {v10}, Lnet/lingala/zip4j/model/CentralDirectory;->getFileHeaders()Ljava/util/ArrayList;

    move-result-object v10

    if-nez v10, :cond_4

    .line 658
    :cond_2
    new-instance v10, Lnet/lingala/zip4j/exception/ZipException;

    const-string v11, "invalid central directory/file headers, cannot write end of central directory record"

    invoke-direct {v10, v11}, Lnet/lingala/zip4j/exception/ZipException;-><init>(Ljava/lang/String;)V

    throw v10
    :try_end_0
    .catch Lnet/lingala/zip4j/exception/ZipException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1

    .line 684
    .end local v3    # "emptyShortByte":[B
    .end local v4    # "intByte":[B
    .end local v5    # "longByte":[B
    .end local v6    # "numEntries":I
    .end local v7    # "numEntriesOnThisDisk":I
    .end local v8    # "shortByte":[B
    :catch_0
    move-exception v9

    .line 685
    .local v9, "zipException":Lnet/lingala/zip4j/exception/ZipException;
    throw v9

    .line 641
    .end local v9    # "zipException":Lnet/lingala/zip4j/exception/ZipException;
    .restart local v3    # "emptyShortByte":[B
    .restart local v4    # "intByte":[B
    .restart local v5    # "longByte":[B
    .restart local v8    # "shortByte":[B
    :cond_3
    :try_start_1
    move-object/from16 v0, p6

    invoke-direct {p0, v3, v0}, Lnet/lingala/zip4j/core/HeaderWriter;->copyByteArrayToArrayList([BLjava/util/List;)V

    .line 642
    move-object/from16 v0, p6

    invoke-direct {p0, v3, v0}, Lnet/lingala/zip4j/core/HeaderWriter;->copyByteArrayToArrayList([BLjava/util/List;)V
    :try_end_1
    .catch Lnet/lingala/zip4j/exception/ZipException; {:try_start_1 .. :try_end_1} :catch_0
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    goto :goto_0

    .line 686
    .end local v3    # "emptyShortByte":[B
    .end local v4    # "intByte":[B
    .end local v5    # "longByte":[B
    .end local v8    # "shortByte":[B
    :catch_1
    move-exception v2

    .line 687
    .local v2, "e":Ljava/lang/Exception;
    new-instance v10, Lnet/lingala/zip4j/exception/ZipException;

    invoke-direct {v10, v2}, Lnet/lingala/zip4j/exception/ZipException;-><init>(Ljava/lang/Throwable;)V

    throw v10

    .line 661
    .end local v2    # "e":Ljava/lang/Exception;
    .restart local v3    # "emptyShortByte":[B
    .restart local v4    # "intByte":[B
    .restart local v5    # "longByte":[B
    .restart local v6    # "numEntries":I
    .restart local v7    # "numEntriesOnThisDisk":I
    .restart local v8    # "shortByte":[B
    :cond_4
    :try_start_2
    invoke-virtual {p1}, Lnet/lingala/zip4j/model/ZipModel;->getCentralDirectory()Lnet/lingala/zip4j/model/CentralDirectory;

    move-result-object v10

    invoke-virtual {v10}, Lnet/lingala/zip4j/model/CentralDirectory;->getFileHeaders()Ljava/util/ArrayList;

    move-result-object v10

    invoke-virtual {v10}, Ljava/util/ArrayList;->size()I

    move-result v6

    .line 662
    invoke-virtual {p1}, Lnet/lingala/zip4j/model/ZipModel;->isSplitArchive()Z

    move-result v10

    if-eqz v10, :cond_5

    .line 663
    invoke-virtual {p1}, Lnet/lingala/zip4j/model/ZipModel;->getCentralDirectory()Lnet/lingala/zip4j/model/CentralDirectory;

    move-result-object v10

    invoke-virtual {v10}, Lnet/lingala/zip4j/model/CentralDirectory;->getFileHeaders()Ljava/util/ArrayList;

    move-result-object v10

    .line 664
    invoke-virtual {p1}, Lnet/lingala/zip4j/model/ZipModel;->getEndCentralDirRecord()Lnet/lingala/zip4j/model/EndCentralDirRecord;

    move-result-object v11

    invoke-virtual {v11}, Lnet/lingala/zip4j/model/EndCentralDirRecord;->getNoOfThisDisk()I

    move-result v11

    .line 663
    invoke-direct {p0, v10, v11}, Lnet/lingala/zip4j/core/HeaderWriter;->countNumberOfFileHeaderEntriesOnDisk(Ljava/util/ArrayList;I)I

    .line 669
    :goto_1
    const/4 v10, 0x0

    int-to-long v12, v7

    invoke-static {v5, v10, v12, v13}, Lnet/lingala/zip4j/util/Raw;->writeLongLittleEndian([BIJ)V

    .line 670
    move-object/from16 v0, p6

    invoke-direct {p0, v5, v0}, Lnet/lingala/zip4j/core/HeaderWriter;->copyByteArrayToArrayList([BLjava/util/List;)V

    .line 673
    const/4 v10, 0x0

    int-to-long v12, v6

    invoke-static {v5, v10, v12, v13}, Lnet/lingala/zip4j/util/Raw;->writeLongLittleEndian([BIJ)V

    .line 674
    move-object/from16 v0, p6

    invoke-direct {p0, v5, v0}, Lnet/lingala/zip4j/core/HeaderWriter;->copyByteArrayToArrayList([BLjava/util/List;)V

    .line 677
    const/4 v10, 0x0

    move/from16 v0, p3

    int-to-long v12, v0

    invoke-static {v5, v10, v12, v13}, Lnet/lingala/zip4j/util/Raw;->writeLongLittleEndian([BIJ)V

    .line 678
    move-object/from16 v0, p6

    invoke-direct {p0, v5, v0}, Lnet/lingala/zip4j/core/HeaderWriter;->copyByteArrayToArrayList([BLjava/util/List;)V

    .line 681
    const/4 v10, 0x0

    move-wide/from16 v0, p4

    invoke-static {v5, v10, v0, v1}, Lnet/lingala/zip4j/util/Raw;->writeLongLittleEndian([BIJ)V

    .line 682
    move-object/from16 v0, p6

    invoke-direct {p0, v5, v0}, Lnet/lingala/zip4j/core/HeaderWriter;->copyByteArrayToArrayList([BLjava/util/List;)V
    :try_end_2
    .catch Lnet/lingala/zip4j/exception/ZipException; {:try_start_2 .. :try_end_2} :catch_0
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_1

    .line 689
    return-void

    .line 666
    :cond_5
    move v7, v6

    goto :goto_1
.end method

.method private writeZipHeaderBytes(Lnet/lingala/zip4j/model/ZipModel;Ljava/io/OutputStream;[B)V
    .locals 4
    .param p1, "zipModel"    # Lnet/lingala/zip4j/model/ZipModel;
    .param p2, "outputStream"    # Ljava/io/OutputStream;
    .param p3, "buff"    # [B
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lnet/lingala/zip4j/exception/ZipException;
        }
    .end annotation

    .prologue
    .line 314
    if-nez p3, :cond_0

    .line 315
    new-instance v2, Lnet/lingala/zip4j/exception/ZipException;

    const-string v3, "invalid buff to write as zip headers"

    invoke-direct {v2, v3}, Lnet/lingala/zip4j/exception/ZipException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 319
    :cond_0
    :try_start_0
    instance-of v2, p2, Lnet/lingala/zip4j/io/SplitOutputStream;

    if-eqz v2, :cond_1

    .line 320
    move-object v0, p2

    check-cast v0, Lnet/lingala/zip4j/io/SplitOutputStream;

    move-object v2, v0

    array-length v3, p3

    invoke-virtual {v2, v3}, Lnet/lingala/zip4j/io/SplitOutputStream;->checkBuffSizeAndStartNextSplitFile(I)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 321
    invoke-virtual {p0, p1, p2}, Lnet/lingala/zip4j/core/HeaderWriter;->finalizeZipFile(Lnet/lingala/zip4j/model/ZipModel;Ljava/io/OutputStream;)V

    .line 330
    :goto_0
    return-void

    .line 326
    :cond_1
    invoke-virtual {p2, p3}, Ljava/io/OutputStream;->write([B)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 327
    :catch_0
    move-exception v1

    .line 328
    .local v1, "e":Ljava/io/IOException;
    new-instance v2, Lnet/lingala/zip4j/exception/ZipException;

    invoke-direct {v2, v1}, Lnet/lingala/zip4j/exception/ZipException;-><init>(Ljava/lang/Throwable;)V

    throw v2
.end method


# virtual methods
.method public finalizeZipFile(Lnet/lingala/zip4j/model/ZipModel;Ljava/io/OutputStream;)V
    .locals 12
    .param p1, "zipModel"    # Lnet/lingala/zip4j/model/ZipModel;
    .param p2, "outputStream"    # Ljava/io/OutputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lnet/lingala/zip4j/exception/ZipException;
        }
    .end annotation

    .prologue
    .line 216
    if-eqz p1, :cond_0

    if-nez p2, :cond_1

    .line 217
    :cond_0
    new-instance v2, Lnet/lingala/zip4j/exception/ZipException;

    const-string v3, "input parameters is null, cannot finalize zip file"

    invoke-direct {v2, v3}, Lnet/lingala/zip4j/exception/ZipException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 221
    :cond_1
    :try_start_0
    invoke-direct {p0, p1, p2}, Lnet/lingala/zip4j/core/HeaderWriter;->processHeaderData(Lnet/lingala/zip4j/model/ZipModel;Ljava/io/OutputStream;)V

    .line 223
    invoke-virtual {p1}, Lnet/lingala/zip4j/model/ZipModel;->getEndCentralDirRecord()Lnet/lingala/zip4j/model/EndCentralDirRecord;

    move-result-object v2

    invoke-virtual {v2}, Lnet/lingala/zip4j/model/EndCentralDirRecord;->getOffsetOfStartOfCentralDir()J

    move-result-wide v6

    .line 225
    .local v6, "offsetCentralDir":J
    new-instance v8, Ljava/util/ArrayList;

    invoke-direct {v8}, Ljava/util/ArrayList;-><init>()V

    .line 227
    .local v8, "headerBytesList":Ljava/util/List;
    invoke-direct {p0, p1, p2, v8}, Lnet/lingala/zip4j/core/HeaderWriter;->writeCentralDirectory(Lnet/lingala/zip4j/model/ZipModel;Ljava/io/OutputStream;Ljava/util/List;)I

    move-result v5

    .line 229
    .local v5, "sizeOfCentralDir":I
    invoke-virtual {p1}, Lnet/lingala/zip4j/model/ZipModel;->isZip64Format()Z

    move-result v2

    if-eqz v2, :cond_4

    .line 230
    invoke-virtual {p1}, Lnet/lingala/zip4j/model/ZipModel;->getZip64EndCentralDirRecord()Lnet/lingala/zip4j/model/Zip64EndCentralDirRecord;

    move-result-object v2

    if-nez v2, :cond_2

    .line 231
    new-instance v2, Lnet/lingala/zip4j/model/Zip64EndCentralDirRecord;

    invoke-direct {v2}, Lnet/lingala/zip4j/model/Zip64EndCentralDirRecord;-><init>()V

    invoke-virtual {p1, v2}, Lnet/lingala/zip4j/model/ZipModel;->setZip64EndCentralDirRecord(Lnet/lingala/zip4j/model/Zip64EndCentralDirRecord;)V

    .line 233
    :cond_2
    invoke-virtual {p1}, Lnet/lingala/zip4j/model/ZipModel;->getZip64EndCentralDirLocator()Lnet/lingala/zip4j/model/Zip64EndCentralDirLocator;

    move-result-object v2

    if-nez v2, :cond_3

    .line 234
    new-instance v2, Lnet/lingala/zip4j/model/Zip64EndCentralDirLocator;

    invoke-direct {v2}, Lnet/lingala/zip4j/model/Zip64EndCentralDirLocator;-><init>()V

    invoke-virtual {p1, v2}, Lnet/lingala/zip4j/model/ZipModel;->setZip64EndCentralDirLocator(Lnet/lingala/zip4j/model/Zip64EndCentralDirLocator;)V

    .line 237
    :cond_3
    invoke-virtual {p1}, Lnet/lingala/zip4j/model/ZipModel;->getZip64EndCentralDirLocator()Lnet/lingala/zip4j/model/Zip64EndCentralDirLocator;

    move-result-object v2

    int-to-long v10, v5

    add-long/2addr v10, v6

    invoke-virtual {v2, v10, v11}, Lnet/lingala/zip4j/model/Zip64EndCentralDirLocator;->setOffsetZip64EndOfCentralDirRec(J)V

    .line 238
    instance-of v2, p2, Lnet/lingala/zip4j/io/SplitOutputStream;

    if-eqz v2, :cond_5

    .line 239
    invoke-virtual {p1}, Lnet/lingala/zip4j/model/ZipModel;->getZip64EndCentralDirLocator()Lnet/lingala/zip4j/model/Zip64EndCentralDirLocator;

    move-result-object v3

    move-object v0, p2

    check-cast v0, Lnet/lingala/zip4j/io/SplitOutputStream;

    move-object v2, v0

    invoke-virtual {v2}, Lnet/lingala/zip4j/io/SplitOutputStream;->getCurrSplitFileCounter()I

    move-result v2

    invoke-virtual {v3, v2}, Lnet/lingala/zip4j/model/Zip64EndCentralDirLocator;->setNoOfDiskStartOfZip64EndOfCentralDirRec(I)V

    .line 240
    invoke-virtual {p1}, Lnet/lingala/zip4j/model/ZipModel;->getZip64EndCentralDirLocator()Lnet/lingala/zip4j/model/Zip64EndCentralDirLocator;

    move-result-object v3

    move-object v0, p2

    check-cast v0, Lnet/lingala/zip4j/io/SplitOutputStream;

    move-object v2, v0

    invoke-virtual {v2}, Lnet/lingala/zip4j/io/SplitOutputStream;->getCurrSplitFileCounter()I

    move-result v2

    add-int/lit8 v2, v2, 0x1

    invoke-virtual {v3, v2}, Lnet/lingala/zip4j/model/Zip64EndCentralDirLocator;->setTotNumberOfDiscs(I)V

    :goto_0
    move-object v2, p0

    move-object v3, p1

    move-object v4, p2

    .line 246
    invoke-direct/range {v2 .. v8}, Lnet/lingala/zip4j/core/HeaderWriter;->writeZip64EndOfCentralDirectoryRecord(Lnet/lingala/zip4j/model/ZipModel;Ljava/io/OutputStream;IJLjava/util/List;)V

    .line 248
    invoke-direct {p0, p1, p2, v8}, Lnet/lingala/zip4j/core/HeaderWriter;->writeZip64EndOfCentralDirectoryLocator(Lnet/lingala/zip4j/model/ZipModel;Ljava/io/OutputStream;Ljava/util/List;)V

    :cond_4
    move-object v2, p0

    move-object v3, p1

    move-object v4, p2

    .line 251
    invoke-direct/range {v2 .. v8}, Lnet/lingala/zip4j/core/HeaderWriter;->writeEndOfCentralDirectoryRecord(Lnet/lingala/zip4j/model/ZipModel;Ljava/io/OutputStream;IJLjava/util/List;)V

    .line 253
    invoke-direct {p0, v8}, Lnet/lingala/zip4j/core/HeaderWriter;->byteArrayListToByteArray(Ljava/util/List;)[B

    move-result-object v2

    invoke-direct {p0, p1, p2, v2}, Lnet/lingala/zip4j/core/HeaderWriter;->writeZipHeaderBytes(Lnet/lingala/zip4j/model/ZipModel;Ljava/io/OutputStream;[B)V

    .line 259
    return-void

    .line 242
    :cond_5
    invoke-virtual {p1}, Lnet/lingala/zip4j/model/ZipModel;->getZip64EndCentralDirLocator()Lnet/lingala/zip4j/model/Zip64EndCentralDirLocator;

    move-result-object v2

    const/4 v3, 0x0

    invoke-virtual {v2, v3}, Lnet/lingala/zip4j/model/Zip64EndCentralDirLocator;->setNoOfDiskStartOfZip64EndOfCentralDirRec(I)V

    .line 243
    invoke-virtual {p1}, Lnet/lingala/zip4j/model/ZipModel;->getZip64EndCentralDirLocator()Lnet/lingala/zip4j/model/Zip64EndCentralDirLocator;

    move-result-object v2

    const/4 v3, 0x1

    invoke-virtual {v2, v3}, Lnet/lingala/zip4j/model/Zip64EndCentralDirLocator;->setTotNumberOfDiscs(I)V
    :try_end_0
    .catch Lnet/lingala/zip4j/exception/ZipException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1

    goto :goto_0

    .line 254
    .end local v5    # "sizeOfCentralDir":I
    .end local v6    # "offsetCentralDir":J
    .end local v8    # "headerBytesList":Ljava/util/List;
    :catch_0
    move-exception v9

    .line 255
    .local v9, "e":Lnet/lingala/zip4j/exception/ZipException;
    throw v9

    .line 256
    .end local v9    # "e":Lnet/lingala/zip4j/exception/ZipException;
    :catch_1
    move-exception v9

    .line 257
    .local v9, "e":Ljava/lang/Exception;
    new-instance v2, Lnet/lingala/zip4j/exception/ZipException;

    invoke-direct {v2, v9}, Lnet/lingala/zip4j/exception/ZipException;-><init>(Ljava/lang/Throwable;)V

    throw v2
.end method

.method public finalizeZipFileWithoutValidations(Lnet/lingala/zip4j/model/ZipModel;Ljava/io/OutputStream;)V
    .locals 10
    .param p1, "zipModel"    # Lnet/lingala/zip4j/model/ZipModel;
    .param p2, "outputStream"    # Ljava/io/OutputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lnet/lingala/zip4j/exception/ZipException;
        }
    .end annotation

    .prologue
    .line 271
    if-eqz p1, :cond_0

    if-nez p2, :cond_1

    .line 272
    :cond_0
    new-instance v0, Lnet/lingala/zip4j/exception/ZipException;

    const-string v1, "input parameters is null, cannot finalize zip file without validations"

    invoke-direct {v0, v1}, Lnet/lingala/zip4j/exception/ZipException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 277
    :cond_1
    :try_start_0
    new-instance v6, Ljava/util/ArrayList;

    invoke-direct {v6}, Ljava/util/ArrayList;-><init>()V

    .line 279
    .local v6, "headerBytesList":Ljava/util/List;
    invoke-virtual {p1}, Lnet/lingala/zip4j/model/ZipModel;->getEndCentralDirRecord()Lnet/lingala/zip4j/model/EndCentralDirRecord;

    move-result-object v0

    invoke-virtual {v0}, Lnet/lingala/zip4j/model/EndCentralDirRecord;->getOffsetOfStartOfCentralDir()J

    move-result-wide v4

    .line 281
    .local v4, "offsetCentralDir":J
    invoke-direct {p0, p1, p2, v6}, Lnet/lingala/zip4j/core/HeaderWriter;->writeCentralDirectory(Lnet/lingala/zip4j/model/ZipModel;Ljava/io/OutputStream;Ljava/util/List;)I

    move-result v3

    .line 283
    .local v3, "sizeOfCentralDir":I
    invoke-virtual {p1}, Lnet/lingala/zip4j/model/ZipModel;->isZip64Format()Z

    move-result v0

    if-eqz v0, :cond_4

    .line 284
    invoke-virtual {p1}, Lnet/lingala/zip4j/model/ZipModel;->getZip64EndCentralDirRecord()Lnet/lingala/zip4j/model/Zip64EndCentralDirRecord;

    move-result-object v0

    if-nez v0, :cond_2

    .line 285
    new-instance v0, Lnet/lingala/zip4j/model/Zip64EndCentralDirRecord;

    invoke-direct {v0}, Lnet/lingala/zip4j/model/Zip64EndCentralDirRecord;-><init>()V

    invoke-virtual {p1, v0}, Lnet/lingala/zip4j/model/ZipModel;->setZip64EndCentralDirRecord(Lnet/lingala/zip4j/model/Zip64EndCentralDirRecord;)V

    .line 287
    :cond_2
    invoke-virtual {p1}, Lnet/lingala/zip4j/model/ZipModel;->getZip64EndCentralDirLocator()Lnet/lingala/zip4j/model/Zip64EndCentralDirLocator;

    move-result-object v0

    if-nez v0, :cond_3

    .line 288
    new-instance v0, Lnet/lingala/zip4j/model/Zip64EndCentralDirLocator;

    invoke-direct {v0}, Lnet/lingala/zip4j/model/Zip64EndCentralDirLocator;-><init>()V

    invoke-virtual {p1, v0}, Lnet/lingala/zip4j/model/ZipModel;->setZip64EndCentralDirLocator(Lnet/lingala/zip4j/model/Zip64EndCentralDirLocator;)V

    .line 291
    :cond_3
    invoke-virtual {p1}, Lnet/lingala/zip4j/model/ZipModel;->getZip64EndCentralDirLocator()Lnet/lingala/zip4j/model/Zip64EndCentralDirLocator;

    move-result-object v0

    int-to-long v8, v3

    add-long/2addr v8, v4

    invoke-virtual {v0, v8, v9}, Lnet/lingala/zip4j/model/Zip64EndCentralDirLocator;->setOffsetZip64EndOfCentralDirRec(J)V

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    .line 293
    invoke-direct/range {v0 .. v6}, Lnet/lingala/zip4j/core/HeaderWriter;->writeZip64EndOfCentralDirectoryRecord(Lnet/lingala/zip4j/model/ZipModel;Ljava/io/OutputStream;IJLjava/util/List;)V

    .line 294
    invoke-direct {p0, p1, p2, v6}, Lnet/lingala/zip4j/core/HeaderWriter;->writeZip64EndOfCentralDirectoryLocator(Lnet/lingala/zip4j/model/ZipModel;Ljava/io/OutputStream;Ljava/util/List;)V

    :cond_4
    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    .line 297
    invoke-direct/range {v0 .. v6}, Lnet/lingala/zip4j/core/HeaderWriter;->writeEndOfCentralDirectoryRecord(Lnet/lingala/zip4j/model/ZipModel;Ljava/io/OutputStream;IJLjava/util/List;)V

    .line 299
    invoke-direct {p0, v6}, Lnet/lingala/zip4j/core/HeaderWriter;->byteArrayListToByteArray(Ljava/util/List;)[B

    move-result-object v0

    invoke-direct {p0, p1, p2, v0}, Lnet/lingala/zip4j/core/HeaderWriter;->writeZipHeaderBytes(Lnet/lingala/zip4j/model/ZipModel;Ljava/io/OutputStream;[B)V
    :try_end_0
    .catch Lnet/lingala/zip4j/exception/ZipException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1

    .line 305
    return-void

    .line 300
    .end local v3    # "sizeOfCentralDir":I
    .end local v4    # "offsetCentralDir":J
    .end local v6    # "headerBytesList":Ljava/util/List;
    :catch_0
    move-exception v7

    .line 301
    .local v7, "e":Lnet/lingala/zip4j/exception/ZipException;
    throw v7

    .line 302
    .end local v7    # "e":Lnet/lingala/zip4j/exception/ZipException;
    :catch_1
    move-exception v7

    .line 303
    .local v7, "e":Ljava/lang/Exception;
    new-instance v0, Lnet/lingala/zip4j/exception/ZipException;

    invoke-direct {v0, v7}, Lnet/lingala/zip4j/exception/ZipException;-><init>(Ljava/lang/Throwable;)V

    throw v0
.end method

.method public updateLocalFileHeader(Lnet/lingala/zip4j/model/LocalFileHeader;JILnet/lingala/zip4j/model/ZipModel;[BILnet/lingala/zip4j/io/SplitOutputStream;)V
    .locals 20
    .param p1, "localFileHeader"    # Lnet/lingala/zip4j/model/LocalFileHeader;
    .param p2, "offset"    # J
    .param p4, "toUpdate"    # I
    .param p5, "zipModel"    # Lnet/lingala/zip4j/model/ZipModel;
    .param p6, "bytesToWrite"    # [B
    .param p7, "noOfDisk"    # I
    .param p8, "outputStream"    # Lnet/lingala/zip4j/io/SplitOutputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lnet/lingala/zip4j/exception/ZipException;
        }
    .end annotation

    .prologue
    .line 810
    if-eqz p1, :cond_0

    const-wide/16 v6, 0x0

    cmp-long v3, p2, v6

    if-ltz v3, :cond_0

    if-nez p5, :cond_1

    .line 811
    :cond_0
    new-instance v3, Lnet/lingala/zip4j/exception/ZipException;

    const-string v5, "invalid input parameters, cannot update local file header"

    invoke-direct {v3, v5}, Lnet/lingala/zip4j/exception/ZipException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 815
    :cond_1
    const/4 v2, 0x0

    .line 816
    .local v2, "closeFlag":Z
    const/4 v4, 0x0

    .line 818
    .local v4, "currOutputStream":Lnet/lingala/zip4j/io/SplitOutputStream;
    :try_start_0
    invoke-virtual/range {p8 .. p8}, Lnet/lingala/zip4j/io/SplitOutputStream;->getCurrSplitFileCounter()I

    move-result v3

    move/from16 v0, p7

    if-eq v0, v3, :cond_3

    .line 819
    new-instance v19, Ljava/io/File;

    invoke-virtual/range {p5 .. p5}, Lnet/lingala/zip4j/model/ZipModel;->getZipFile()Ljava/lang/String;

    move-result-object v3

    move-object/from16 v0, v19

    invoke-direct {v0, v3}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 820
    .local v19, "zipFile":Ljava/io/File;
    invoke-virtual/range {v19 .. v19}, Ljava/io/File;->getParent()Ljava/lang/String;

    move-result-object v18

    .line 821
    .local v18, "parentFile":Ljava/lang/String;
    invoke-virtual/range {v19 .. v19}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Lnet/lingala/zip4j/util/Zip4jUtil;->getZipFileNameWithoutExt(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v17

    .line 822
    .local v17, "fileNameWithoutExt":Ljava/lang/String;
    new-instance v3, Ljava/lang/StringBuffer;

    invoke-static/range {v18 .. v18}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    invoke-direct {v3, v5}, Ljava/lang/StringBuffer;-><init>(Ljava/lang/String;)V

    const-string v5, "file.separator"

    invoke-static {v5}, Ljava/lang/System;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v3, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v16

    .line 823
    .local v16, "fileName":Ljava/lang/String;
    const/16 v3, 0x9

    move/from16 v0, p7

    if-ge v0, v3, :cond_2

    .line 824
    new-instance v3, Ljava/lang/StringBuffer;

    invoke-static/range {v16 .. v16}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    invoke-direct {v3, v5}, Ljava/lang/StringBuffer;-><init>(Ljava/lang/String;)V

    move-object/from16 v0, v17

    invoke-virtual {v3, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    const-string v5, ".z0"

    invoke-virtual {v3, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    add-int/lit8 v5, p7, 0x1

    invoke-virtual {v3, v5}, Ljava/lang/StringBuffer;->append(I)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v16

    .line 828
    :goto_0
    new-instance v14, Lnet/lingala/zip4j/io/SplitOutputStream;

    new-instance v3, Ljava/io/File;

    move-object/from16 v0, v16

    invoke-direct {v3, v0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-direct {v14, v3}, Lnet/lingala/zip4j/io/SplitOutputStream;-><init>(Ljava/io/File;)V

    .line 829
    .end local v4    # "currOutputStream":Lnet/lingala/zip4j/io/SplitOutputStream;
    .local v14, "currOutputStream":Lnet/lingala/zip4j/io/SplitOutputStream;
    const/4 v2, 0x1

    move-object v4, v14

    .line 834
    .end local v14    # "currOutputStream":Lnet/lingala/zip4j/io/SplitOutputStream;
    .end local v16    # "fileName":Ljava/lang/String;
    .end local v17    # "fileNameWithoutExt":Ljava/lang/String;
    .end local v18    # "parentFile":Ljava/lang/String;
    .end local v19    # "zipFile":Ljava/io/File;
    .restart local v4    # "currOutputStream":Lnet/lingala/zip4j/io/SplitOutputStream;
    :goto_1
    invoke-virtual {v4}, Lnet/lingala/zip4j/io/SplitOutputStream;->getFilePointer()J

    move-result-wide v12

    .line 836
    .local v12, "currOffset":J
    sparse-switch p4, :sswitch_data_0

    .line 849
    :goto_2
    if-eqz v2, :cond_4

    .line 850
    invoke-virtual {v4}, Lnet/lingala/zip4j/io/SplitOutputStream;->close()V

    .line 858
    :goto_3
    return-void

    .line 826
    .end local v12    # "currOffset":J
    .restart local v16    # "fileName":Ljava/lang/String;
    .restart local v17    # "fileNameWithoutExt":Ljava/lang/String;
    .restart local v18    # "parentFile":Ljava/lang/String;
    .restart local v19    # "zipFile":Ljava/io/File;
    :cond_2
    new-instance v3, Ljava/lang/StringBuffer;

    invoke-static/range {v16 .. v16}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    invoke-direct {v3, v5}, Ljava/lang/StringBuffer;-><init>(Ljava/lang/String;)V

    move-object/from16 v0, v17

    invoke-virtual {v3, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    const-string v5, ".z"

    invoke-virtual {v3, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    add-int/lit8 v5, p7, 0x1

    invoke-virtual {v3, v5}, Ljava/lang/StringBuffer;->append(I)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v16

    goto :goto_0

    .line 831
    .end local v16    # "fileName":Ljava/lang/String;
    .end local v17    # "fileNameWithoutExt":Ljava/lang/String;
    .end local v18    # "parentFile":Ljava/lang/String;
    .end local v19    # "zipFile":Ljava/io/File;
    :cond_3
    move-object/from16 v4, p8

    goto :goto_1

    .line 838
    .restart local v12    # "currOffset":J
    :sswitch_0
    move/from16 v0, p4

    int-to-long v6, v0

    add-long v6, v6, p2

    invoke-virtual {v4, v6, v7}, Lnet/lingala/zip4j/io/SplitOutputStream;->seek(J)V

    .line 839
    move-object/from16 v0, p6

    invoke-virtual {v4, v0}, Lnet/lingala/zip4j/io/SplitOutputStream;->write([B)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_2

    .line 855
    .end local v12    # "currOffset":J
    :catch_0
    move-exception v15

    .line 856
    .local v15, "e":Ljava/lang/Exception;
    new-instance v3, Lnet/lingala/zip4j/exception/ZipException;

    invoke-direct {v3, v15}, Lnet/lingala/zip4j/exception/ZipException;-><init>(Ljava/lang/Throwable;)V

    throw v3

    .line 844
    .end local v15    # "e":Ljava/lang/Exception;
    .restart local v12    # "currOffset":J
    :sswitch_1
    move/from16 v0, p4

    int-to-long v8, v0

    :try_start_1
    invoke-virtual/range {p5 .. p5}, Lnet/lingala/zip4j/model/ZipModel;->isZip64Format()Z

    move-result v11

    move-object/from16 v3, p0

    move-object/from16 v5, p1

    move-wide/from16 v6, p2

    move-object/from16 v10, p6

    .line 843
    invoke-direct/range {v3 .. v11}, Lnet/lingala/zip4j/core/HeaderWriter;->updateCompressedSizeInLocalFileHeader(Lnet/lingala/zip4j/io/SplitOutputStream;Lnet/lingala/zip4j/model/LocalFileHeader;JJ[BZ)V

    goto :goto_2

    .line 852
    :cond_4
    move-object/from16 v0, p8

    invoke-virtual {v0, v12, v13}, Lnet/lingala/zip4j/io/SplitOutputStream;->seek(J)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_3

    .line 836
    nop

    :sswitch_data_0
    .sparse-switch
        0xe -> :sswitch_0
        0x12 -> :sswitch_1
        0x16 -> :sswitch_1
    .end sparse-switch
.end method

.method public writeExtendedLocalHeader(Lnet/lingala/zip4j/model/LocalFileHeader;Ljava/io/OutputStream;)I
    .locals 10
    .param p1, "localFileHeader"    # Lnet/lingala/zip4j/model/LocalFileHeader;
    .param p2, "outputStream"    # Ljava/io/OutputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lnet/lingala/zip4j/exception/ZipException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 172
    if-eqz p1, :cond_0

    if-nez p2, :cond_1

    .line 173
    :cond_0
    new-instance v5, Lnet/lingala/zip4j/exception/ZipException;

    const-string v8, "input parameters is null, cannot write extended local header"

    invoke-direct {v5, v8}, Lnet/lingala/zip4j/exception/ZipException;-><init>(Ljava/lang/String;)V

    throw v5

    .line 176
    :cond_1
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 177
    .local v0, "byteArrayList":Ljava/util/ArrayList;
    const/4 v5, 0x4

    new-array v4, v5, [B

    .line 180
    .local v4, "intByte":[B
    const/4 v5, 0x0

    const v8, 0x8074b50

    invoke-static {v4, v5, v8}, Lnet/lingala/zip4j/util/Raw;->writeIntLittleEndian([BII)V

    .line 181
    invoke-direct {p0, v4, v0}, Lnet/lingala/zip4j/core/HeaderWriter;->copyByteArrayToArrayList([BLjava/util/List;)V

    .line 184
    const/4 v5, 0x0

    invoke-virtual {p1}, Lnet/lingala/zip4j/model/LocalFileHeader;->getCrc32()J

    move-result-wide v8

    long-to-int v8, v8

    invoke-static {v4, v5, v8}, Lnet/lingala/zip4j/util/Raw;->writeIntLittleEndian([BII)V

    .line 185
    invoke-direct {p0, v4, v0}, Lnet/lingala/zip4j/core/HeaderWriter;->copyByteArrayToArrayList([BLjava/util/List;)V

    .line 188
    invoke-virtual {p1}, Lnet/lingala/zip4j/model/LocalFileHeader;->getCompressedSize()J

    move-result-wide v2

    .line 189
    .local v2, "compressedSize":J
    const-wide/32 v8, 0x7fffffff

    cmp-long v5, v2, v8

    if-ltz v5, :cond_2

    .line 190
    const-wide/32 v2, 0x7fffffff

    .line 192
    :cond_2
    const/4 v5, 0x0

    long-to-int v8, v2

    invoke-static {v4, v5, v8}, Lnet/lingala/zip4j/util/Raw;->writeIntLittleEndian([BII)V

    .line 193
    invoke-direct {p0, v4, v0}, Lnet/lingala/zip4j/core/HeaderWriter;->copyByteArrayToArrayList([BLjava/util/List;)V

    .line 196
    invoke-virtual {p1}, Lnet/lingala/zip4j/model/LocalFileHeader;->getUncompressedSize()J

    move-result-wide v6

    .line 197
    .local v6, "uncompressedSize":J
    const-wide/32 v8, 0x7fffffff

    cmp-long v5, v6, v8

    if-ltz v5, :cond_3

    .line 198
    const-wide/32 v6, 0x7fffffff

    .line 200
    :cond_3
    const/4 v5, 0x0

    long-to-int v8, v6

    invoke-static {v4, v5, v8}, Lnet/lingala/zip4j/util/Raw;->writeIntLittleEndian([BII)V

    .line 201
    invoke-direct {p0, v4, v0}, Lnet/lingala/zip4j/core/HeaderWriter;->copyByteArrayToArrayList([BLjava/util/List;)V

    .line 203
    invoke-direct {p0, v0}, Lnet/lingala/zip4j/core/HeaderWriter;->byteArrayListToByteArray(Ljava/util/List;)[B

    move-result-object v1

    .line 204
    .local v1, "extLocHdrBytes":[B
    invoke-virtual {p2, v1}, Ljava/io/OutputStream;->write([B)V

    .line 205
    array-length v5, v1

    return v5
.end method

.method public writeLocalFileHeader(Lnet/lingala/zip4j/model/ZipModel;Lnet/lingala/zip4j/model/LocalFileHeader;Ljava/io/OutputStream;)I
    .locals 24
    .param p1, "zipModel"    # Lnet/lingala/zip4j/model/ZipModel;
    .param p2, "localFileHeader"    # Lnet/lingala/zip4j/model/LocalFileHeader;
    .param p3, "outputStream"    # Ljava/io/OutputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lnet/lingala/zip4j/exception/ZipException;
        }
    .end annotation

    .prologue
    .line 43
    if-nez p2, :cond_0

    .line 44
    new-instance v19, Lnet/lingala/zip4j/exception/ZipException;

    const-string v20, "input parameters are null, cannot write local file header"

    invoke-direct/range {v19 .. v20}, Lnet/lingala/zip4j/exception/ZipException;-><init>(Ljava/lang/String;)V

    throw v19

    .line 48
    :cond_0
    :try_start_0
    new-instance v6, Ljava/util/ArrayList;

    invoke-direct {v6}, Ljava/util/ArrayList;-><init>()V

    .line 50
    .local v6, "byteArrayList":Ljava/util/ArrayList;
    const/16 v19, 0x2

    move/from16 v0, v19

    new-array v15, v0, [B

    .line 51
    .local v15, "shortByte":[B
    const/16 v19, 0x4

    move/from16 v0, v19

    new-array v12, v0, [B

    .line 52
    .local v12, "intByte":[B
    const/16 v19, 0x8

    move/from16 v0, v19

    new-array v14, v0, [B

    .line 53
    .local v14, "longByte":[B
    const/16 v19, 0x8

    move/from16 v0, v19

    new-array v9, v0, [B

    .line 55
    .local v9, "emptyLongByte":[B
    const/16 v19, 0x0

    invoke-virtual/range {p2 .. p2}, Lnet/lingala/zip4j/model/LocalFileHeader;->getSignature()I

    move-result v20

    move/from16 v0, v19

    move/from16 v1, v20

    invoke-static {v12, v0, v1}, Lnet/lingala/zip4j/util/Raw;->writeIntLittleEndian([BII)V

    .line 56
    move-object/from16 v0, p0

    invoke-direct {v0, v12, v6}, Lnet/lingala/zip4j/core/HeaderWriter;->copyByteArrayToArrayList([BLjava/util/List;)V

    .line 57
    const/16 v19, 0x0

    invoke-virtual/range {p2 .. p2}, Lnet/lingala/zip4j/model/LocalFileHeader;->getVersionNeededToExtract()I

    move-result v20

    move/from16 v0, v20

    int-to-short v0, v0

    move/from16 v20, v0

    move/from16 v0, v19

    move/from16 v1, v20

    invoke-static {v15, v0, v1}, Lnet/lingala/zip4j/util/Raw;->writeShortLittleEndian([BIS)V

    .line 58
    move-object/from16 v0, p0

    invoke-direct {v0, v15, v6}, Lnet/lingala/zip4j/core/HeaderWriter;->copyByteArrayToArrayList([BLjava/util/List;)V

    .line 60
    invoke-virtual/range {p2 .. p2}, Lnet/lingala/zip4j/model/LocalFileHeader;->getGeneralPurposeFlag()[B

    move-result-object v19

    move-object/from16 v0, p0

    move-object/from16 v1, v19

    invoke-direct {v0, v1, v6}, Lnet/lingala/zip4j/core/HeaderWriter;->copyByteArrayToArrayList([BLjava/util/List;)V

    .line 62
    const/16 v19, 0x0

    invoke-virtual/range {p2 .. p2}, Lnet/lingala/zip4j/model/LocalFileHeader;->getCompressionMethod()I

    move-result v20

    move/from16 v0, v20

    int-to-short v0, v0

    move/from16 v20, v0

    move/from16 v0, v19

    move/from16 v1, v20

    invoke-static {v15, v0, v1}, Lnet/lingala/zip4j/util/Raw;->writeShortLittleEndian([BIS)V

    .line 63
    move-object/from16 v0, p0

    invoke-direct {v0, v15, v6}, Lnet/lingala/zip4j/core/HeaderWriter;->copyByteArrayToArrayList([BLjava/util/List;)V

    .line 65
    invoke-virtual/range {p2 .. p2}, Lnet/lingala/zip4j/model/LocalFileHeader;->getLastModFileTime()I

    move-result v7

    .line 66
    .local v7, "dateTime":I
    const/16 v19, 0x0

    move/from16 v0, v19

    invoke-static {v12, v0, v7}, Lnet/lingala/zip4j/util/Raw;->writeIntLittleEndian([BII)V

    .line 67
    move-object/from16 v0, p0

    invoke-direct {v0, v12, v6}, Lnet/lingala/zip4j/core/HeaderWriter;->copyByteArrayToArrayList([BLjava/util/List;)V

    .line 69
    const/16 v19, 0x0

    invoke-virtual/range {p2 .. p2}, Lnet/lingala/zip4j/model/LocalFileHeader;->getCrc32()J

    move-result-wide v20

    move-wide/from16 v0, v20

    long-to-int v0, v0

    move/from16 v20, v0

    move/from16 v0, v19

    move/from16 v1, v20

    invoke-static {v12, v0, v1}, Lnet/lingala/zip4j/util/Raw;->writeIntLittleEndian([BII)V

    .line 70
    move-object/from16 v0, p0

    invoke-direct {v0, v12, v6}, Lnet/lingala/zip4j/core/HeaderWriter;->copyByteArrayToArrayList([BLjava/util/List;)V

    .line 71
    const/16 v18, 0x0

    .line 74
    .local v18, "writingZip64Rec":Z
    invoke-virtual/range {p2 .. p2}, Lnet/lingala/zip4j/model/LocalFileHeader;->getUncompressedSize()J

    move-result-wide v16

    .line 75
    .local v16, "uncompressedSize":J
    const-wide/16 v20, 0x32

    add-long v20, v20, v16

    const-wide v22, 0xffffffffL

    cmp-long v19, v20, v22

    if-ltz v19, :cond_5

    .line 76
    const/16 v19, 0x0

    const-wide v20, 0xffffffffL

    move/from16 v0, v19

    move-wide/from16 v1, v20

    invoke-static {v14, v0, v1, v2}, Lnet/lingala/zip4j/util/Raw;->writeLongLittleEndian([BIJ)V

    .line 77
    const/16 v19, 0x0

    const/16 v20, 0x0

    const/16 v21, 0x4

    move/from16 v0, v19

    move/from16 v1, v20

    move/from16 v2, v21

    invoke-static {v14, v0, v12, v1, v2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 81
    move-object/from16 v0, p0

    invoke-direct {v0, v12, v6}, Lnet/lingala/zip4j/core/HeaderWriter;->copyByteArrayToArrayList([BLjava/util/List;)V

    .line 83
    move-object/from16 v0, p0

    invoke-direct {v0, v12, v6}, Lnet/lingala/zip4j/core/HeaderWriter;->copyByteArrayToArrayList([BLjava/util/List;)V

    .line 84
    const/16 v19, 0x1

    move-object/from16 v0, p1

    move/from16 v1, v19

    invoke-virtual {v0, v1}, Lnet/lingala/zip4j/model/ZipModel;->setZip64Format(Z)V

    .line 85
    const/16 v18, 0x1

    .line 86
    const/16 v19, 0x1

    move-object/from16 v0, p2

    move/from16 v1, v19

    invoke-virtual {v0, v1}, Lnet/lingala/zip4j/model/LocalFileHeader;->setWriteComprSizeInZip64ExtraRecord(Z)V

    .line 99
    :goto_0
    const/16 v19, 0x0

    invoke-virtual/range {p2 .. p2}, Lnet/lingala/zip4j/model/LocalFileHeader;->getFileNameLength()I

    move-result v20

    move/from16 v0, v20

    int-to-short v0, v0

    move/from16 v20, v0

    move/from16 v0, v19

    move/from16 v1, v20

    invoke-static {v15, v0, v1}, Lnet/lingala/zip4j/util/Raw;->writeShortLittleEndian([BIS)V

    .line 100
    move-object/from16 v0, p0

    invoke-direct {v0, v15, v6}, Lnet/lingala/zip4j/core/HeaderWriter;->copyByteArrayToArrayList([BLjava/util/List;)V

    .line 102
    const/4 v10, 0x0

    .line 103
    .local v10, "extraFieldLength":I
    if-eqz v18, :cond_1

    .line 104
    add-int/lit8 v10, v10, 0x14

    .line 106
    :cond_1
    invoke-virtual/range {p2 .. p2}, Lnet/lingala/zip4j/model/LocalFileHeader;->getAesExtraDataRecord()Lnet/lingala/zip4j/model/AESExtraDataRecord;

    move-result-object v19

    if-eqz v19, :cond_2

    .line 107
    add-int/lit8 v10, v10, 0xb

    .line 109
    :cond_2
    const/16 v19, 0x0

    int-to-short v0, v10

    move/from16 v20, v0

    move/from16 v0, v19

    move/from16 v1, v20

    invoke-static {v15, v0, v1}, Lnet/lingala/zip4j/util/Raw;->writeShortLittleEndian([BIS)V

    .line 110
    move-object/from16 v0, p0

    invoke-direct {v0, v15, v6}, Lnet/lingala/zip4j/core/HeaderWriter;->copyByteArrayToArrayList([BLjava/util/List;)V

    .line 111
    invoke-virtual/range {p1 .. p1}, Lnet/lingala/zip4j/model/ZipModel;->getFileNameCharset()Ljava/lang/String;

    move-result-object v19

    invoke-static/range {v19 .. v19}, Lnet/lingala/zip4j/util/Zip4jUtil;->isStringNotNullAndNotEmpty(Ljava/lang/String;)Z

    move-result v19

    if-eqz v19, :cond_6

    .line 112
    invoke-virtual/range {p2 .. p2}, Lnet/lingala/zip4j/model/LocalFileHeader;->getFileName()Ljava/lang/String;

    move-result-object v19

    invoke-virtual/range {p1 .. p1}, Lnet/lingala/zip4j/model/ZipModel;->getFileNameCharset()Ljava/lang/String;

    move-result-object v20

    invoke-virtual/range {v19 .. v20}, Ljava/lang/String;->getBytes(Ljava/lang/String;)[B

    move-result-object v11

    .line 113
    .local v11, "fileNameBytes":[B
    move-object/from16 v0, p0

    invoke-direct {v0, v11, v6}, Lnet/lingala/zip4j/core/HeaderWriter;->copyByteArrayToArrayList([BLjava/util/List;)V

    .line 121
    .end local v11    # "fileNameBytes":[B
    :goto_1
    if-eqz v18, :cond_3

    .line 125
    const/16 v19, 0x0

    const/16 v20, 0x1

    move/from16 v0, v19

    move/from16 v1, v20

    invoke-static {v15, v0, v1}, Lnet/lingala/zip4j/util/Raw;->writeShortLittleEndian([BIS)V

    .line 126
    move-object/from16 v0, p0

    invoke-direct {v0, v15, v6}, Lnet/lingala/zip4j/core/HeaderWriter;->copyByteArrayToArrayList([BLjava/util/List;)V

    .line 130
    const/16 v19, 0x0

    const/16 v20, 0x10

    move/from16 v0, v19

    move/from16 v1, v20

    invoke-static {v15, v0, v1}, Lnet/lingala/zip4j/util/Raw;->writeShortLittleEndian([BIS)V

    .line 131
    move-object/from16 v0, p0

    invoke-direct {v0, v15, v6}, Lnet/lingala/zip4j/core/HeaderWriter;->copyByteArrayToArrayList([BLjava/util/List;)V

    .line 133
    const/16 v19, 0x0

    invoke-virtual/range {p2 .. p2}, Lnet/lingala/zip4j/model/LocalFileHeader;->getUncompressedSize()J

    move-result-wide v20

    move/from16 v0, v19

    move-wide/from16 v1, v20

    invoke-static {v14, v0, v1, v2}, Lnet/lingala/zip4j/util/Raw;->writeLongLittleEndian([BIJ)V

    .line 134
    move-object/from16 v0, p0

    invoke-direct {v0, v14, v6}, Lnet/lingala/zip4j/core/HeaderWriter;->copyByteArrayToArrayList([BLjava/util/List;)V

    .line 136
    move-object/from16 v0, p0

    invoke-direct {v0, v9, v6}, Lnet/lingala/zip4j/core/HeaderWriter;->copyByteArrayToArrayList([BLjava/util/List;)V

    .line 139
    :cond_3
    invoke-virtual/range {p2 .. p2}, Lnet/lingala/zip4j/model/LocalFileHeader;->getAesExtraDataRecord()Lnet/lingala/zip4j/model/AESExtraDataRecord;

    move-result-object v19

    if-eqz v19, :cond_4

    .line 140
    invoke-virtual/range {p2 .. p2}, Lnet/lingala/zip4j/model/LocalFileHeader;->getAesExtraDataRecord()Lnet/lingala/zip4j/model/AESExtraDataRecord;

    move-result-object v4

    .line 142
    .local v4, "aesExtraDataRecord":Lnet/lingala/zip4j/model/AESExtraDataRecord;
    const/16 v19, 0x0

    invoke-virtual {v4}, Lnet/lingala/zip4j/model/AESExtraDataRecord;->getSignature()J

    move-result-wide v20

    move-wide/from16 v0, v20

    long-to-int v0, v0

    move/from16 v20, v0

    move/from16 v0, v20

    int-to-short v0, v0

    move/from16 v20, v0

    move/from16 v0, v19

    move/from16 v1, v20

    invoke-static {v15, v0, v1}, Lnet/lingala/zip4j/util/Raw;->writeShortLittleEndian([BIS)V

    .line 143
    move-object/from16 v0, p0

    invoke-direct {v0, v15, v6}, Lnet/lingala/zip4j/core/HeaderWriter;->copyByteArrayToArrayList([BLjava/util/List;)V

    .line 145
    const/16 v19, 0x0

    invoke-virtual {v4}, Lnet/lingala/zip4j/model/AESExtraDataRecord;->getDataSize()I

    move-result v20

    move/from16 v0, v20

    int-to-short v0, v0

    move/from16 v20, v0

    move/from16 v0, v19

    move/from16 v1, v20

    invoke-static {v15, v0, v1}, Lnet/lingala/zip4j/util/Raw;->writeShortLittleEndian([BIS)V

    .line 146
    move-object/from16 v0, p0

    invoke-direct {v0, v15, v6}, Lnet/lingala/zip4j/core/HeaderWriter;->copyByteArrayToArrayList([BLjava/util/List;)V

    .line 148
    const/16 v19, 0x0

    invoke-virtual {v4}, Lnet/lingala/zip4j/model/AESExtraDataRecord;->getVersionNumber()I

    move-result v20

    move/from16 v0, v20

    int-to-short v0, v0

    move/from16 v20, v0

    move/from16 v0, v19

    move/from16 v1, v20

    invoke-static {v15, v0, v1}, Lnet/lingala/zip4j/util/Raw;->writeShortLittleEndian([BIS)V

    .line 149
    move-object/from16 v0, p0

    invoke-direct {v0, v15, v6}, Lnet/lingala/zip4j/core/HeaderWriter;->copyByteArrayToArrayList([BLjava/util/List;)V

    .line 151
    invoke-virtual {v4}, Lnet/lingala/zip4j/model/AESExtraDataRecord;->getVendorID()Ljava/lang/String;

    move-result-object v19

    invoke-virtual/range {v19 .. v19}, Ljava/lang/String;->getBytes()[B

    move-result-object v19

    move-object/from16 v0, p0

    move-object/from16 v1, v19

    invoke-direct {v0, v1, v6}, Lnet/lingala/zip4j/core/HeaderWriter;->copyByteArrayToArrayList([BLjava/util/List;)V

    .line 153
    const/16 v19, 0x1

    move/from16 v0, v19

    new-array v5, v0, [B

    .line 154
    .local v5, "aesStrengthBytes":[B
    const/16 v19, 0x0

    invoke-virtual {v4}, Lnet/lingala/zip4j/model/AESExtraDataRecord;->getAesStrength()I

    move-result v20

    move/from16 v0, v20

    int-to-byte v0, v0

    move/from16 v20, v0

    aput-byte v20, v5, v19

    .line 155
    move-object/from16 v0, p0

    invoke-direct {v0, v5, v6}, Lnet/lingala/zip4j/core/HeaderWriter;->copyByteArrayToArrayList([BLjava/util/List;)V

    .line 157
    const/16 v19, 0x0

    invoke-virtual {v4}, Lnet/lingala/zip4j/model/AESExtraDataRecord;->getCompressionMethod()I

    move-result v20

    move/from16 v0, v20

    int-to-short v0, v0

    move/from16 v20, v0

    move/from16 v0, v19

    move/from16 v1, v20

    invoke-static {v15, v0, v1}, Lnet/lingala/zip4j/util/Raw;->writeShortLittleEndian([BIS)V

    .line 158
    move-object/from16 v0, p0

    invoke-direct {v0, v15, v6}, Lnet/lingala/zip4j/core/HeaderWriter;->copyByteArrayToArrayList([BLjava/util/List;)V

    .line 160
    .end local v4    # "aesExtraDataRecord":Lnet/lingala/zip4j/model/AESExtraDataRecord;
    .end local v5    # "aesStrengthBytes":[B
    :cond_4
    move-object/from16 v0, p0

    invoke-direct {v0, v6}, Lnet/lingala/zip4j/core/HeaderWriter;->byteArrayListToByteArray(Ljava/util/List;)[B

    move-result-object v13

    .line 161
    .local v13, "lhBytes":[B
    move-object/from16 v0, p3

    invoke-virtual {v0, v13}, Ljava/io/OutputStream;->write([B)V

    .line 162
    array-length v0, v13

    move/from16 v19, v0

    return v19

    .line 88
    .end local v10    # "extraFieldLength":I
    .end local v13    # "lhBytes":[B
    :cond_5
    const/16 v19, 0x0

    invoke-virtual/range {p2 .. p2}, Lnet/lingala/zip4j/model/LocalFileHeader;->getCompressedSize()J

    move-result-wide v20

    move/from16 v0, v19

    move-wide/from16 v1, v20

    invoke-static {v14, v0, v1, v2}, Lnet/lingala/zip4j/util/Raw;->writeLongLittleEndian([BIJ)V

    .line 89
    const/16 v19, 0x0

    const/16 v20, 0x0

    const/16 v21, 0x4

    move/from16 v0, v19

    move/from16 v1, v20

    move/from16 v2, v21

    invoke-static {v14, v0, v12, v1, v2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 90
    move-object/from16 v0, p0

    invoke-direct {v0, v12, v6}, Lnet/lingala/zip4j/core/HeaderWriter;->copyByteArrayToArrayList([BLjava/util/List;)V

    .line 92
    const/16 v19, 0x0

    invoke-virtual/range {p2 .. p2}, Lnet/lingala/zip4j/model/LocalFileHeader;->getUncompressedSize()J

    move-result-wide v20

    move/from16 v0, v19

    move-wide/from16 v1, v20

    invoke-static {v14, v0, v1, v2}, Lnet/lingala/zip4j/util/Raw;->writeLongLittleEndian([BIJ)V

    .line 93
    const/16 v19, 0x0

    const/16 v20, 0x0

    const/16 v21, 0x4

    move/from16 v0, v19

    move/from16 v1, v20

    move/from16 v2, v21

    invoke-static {v14, v0, v12, v1, v2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 95
    move-object/from16 v0, p0

    invoke-direct {v0, v12, v6}, Lnet/lingala/zip4j/core/HeaderWriter;->copyByteArrayToArrayList([BLjava/util/List;)V

    .line 97
    const/16 v19, 0x0

    move-object/from16 v0, p2

    move/from16 v1, v19

    invoke-virtual {v0, v1}, Lnet/lingala/zip4j/model/LocalFileHeader;->setWriteComprSizeInZip64ExtraRecord(Z)V
    :try_end_0
    .catch Lnet/lingala/zip4j/exception/ZipException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1

    goto/16 :goto_0

    .line 163
    .end local v6    # "byteArrayList":Ljava/util/ArrayList;
    .end local v7    # "dateTime":I
    .end local v9    # "emptyLongByte":[B
    .end local v12    # "intByte":[B
    .end local v14    # "longByte":[B
    .end local v15    # "shortByte":[B
    .end local v16    # "uncompressedSize":J
    .end local v18    # "writingZip64Rec":Z
    :catch_0
    move-exception v8

    .line 164
    .local v8, "e":Lnet/lingala/zip4j/exception/ZipException;
    throw v8

    .line 115
    .end local v8    # "e":Lnet/lingala/zip4j/exception/ZipException;
    .restart local v6    # "byteArrayList":Ljava/util/ArrayList;
    .restart local v7    # "dateTime":I
    .restart local v9    # "emptyLongByte":[B
    .restart local v10    # "extraFieldLength":I
    .restart local v12    # "intByte":[B
    .restart local v14    # "longByte":[B
    .restart local v15    # "shortByte":[B
    .restart local v16    # "uncompressedSize":J
    .restart local v18    # "writingZip64Rec":Z
    :cond_6
    :try_start_1
    invoke-virtual/range {p2 .. p2}, Lnet/lingala/zip4j/model/LocalFileHeader;->getFileName()Ljava/lang/String;

    move-result-object v19

    invoke-static/range {v19 .. v19}, Lnet/lingala/zip4j/util/Zip4jUtil;->convertCharset(Ljava/lang/String;)[B

    move-result-object v19

    move-object/from16 v0, p0

    move-object/from16 v1, v19

    invoke-direct {v0, v1, v6}, Lnet/lingala/zip4j/core/HeaderWriter;->copyByteArrayToArrayList([BLjava/util/List;)V
    :try_end_1
    .catch Lnet/lingala/zip4j/exception/ZipException; {:try_start_1 .. :try_end_1} :catch_0
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    goto/16 :goto_1

    .line 165
    .end local v6    # "byteArrayList":Ljava/util/ArrayList;
    .end local v7    # "dateTime":I
    .end local v9    # "emptyLongByte":[B
    .end local v10    # "extraFieldLength":I
    .end local v12    # "intByte":[B
    .end local v14    # "longByte":[B
    .end local v15    # "shortByte":[B
    .end local v16    # "uncompressedSize":J
    .end local v18    # "writingZip64Rec":Z
    :catch_1
    move-exception v8

    .line 166
    .local v8, "e":Ljava/lang/Exception;
    new-instance v19, Lnet/lingala/zip4j/exception/ZipException;

    move-object/from16 v0, v19

    invoke-direct {v0, v8}, Lnet/lingala/zip4j/exception/ZipException;-><init>(Ljava/lang/Throwable;)V

    throw v19
.end method
