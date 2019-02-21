.class public Lnet/lingala/zip4j/model/FileHeader;
.super Ljava/lang/Object;
.source "FileHeader.java"


# instance fields
.field private aesExtraDataRecord:Lnet/lingala/zip4j/model/AESExtraDataRecord;

.field private compressedSize:J

.field private compressionMethod:I

.field private crc32:J

.field private crcBuff:[B

.field private dataDescriptorExists:Z

.field private diskNumberStart:I

.field private encryptionMethod:I

.field private externalFileAttr:[B

.field private extraDataRecords:Ljava/util/ArrayList;

.field private extraFieldLength:I

.field private fileComment:Ljava/lang/String;

.field private fileCommentLength:I

.field private fileName:Ljava/lang/String;

.field private fileNameLength:I

.field private fileNameUTF8Encoded:Z

.field private generalPurposeFlag:[B

.field private internalFileAttr:[B

.field private isDirectory:Z

.field private isEncrypted:Z

.field private lastModFileTime:I

.field private offsetLocalHeader:J

.field private password:[C

.field private signature:I

.field private uncompressedSize:J

.field private versionMadeBy:I

.field private versionNeededToExtract:I

.field private zip64ExtendedInfo:Lnet/lingala/zip4j/model/Zip64ExtendedInfo;


# direct methods
.method public constructor <init>()V
    .locals 4

    .prologue
    const-wide/16 v2, 0x0

    .line 84
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 85
    const/4 v0, -0x1

    iput v0, p0, Lnet/lingala/zip4j/model/FileHeader;->encryptionMethod:I

    .line 86
    iput-wide v2, p0, Lnet/lingala/zip4j/model/FileHeader;->crc32:J

    .line 87
    iput-wide v2, p0, Lnet/lingala/zip4j/model/FileHeader;->uncompressedSize:J

    .line 88
    return-void
.end method


# virtual methods
.method public extractFile(Lnet/lingala/zip4j/model/ZipModel;Ljava/lang/String;Lnet/lingala/zip4j/model/UnzipParameters;Ljava/lang/String;Lnet/lingala/zip4j/progress/ProgressMonitor;Z)V
    .locals 7
    .param p1, "zipModel"    # Lnet/lingala/zip4j/model/ZipModel;
    .param p2, "outPath"    # Ljava/lang/String;
    .param p3, "unzipParameters"    # Lnet/lingala/zip4j/model/UnzipParameters;
    .param p4, "newFileName"    # Ljava/lang/String;
    .param p5, "progressMonitor"    # Lnet/lingala/zip4j/progress/ProgressMonitor;
    .param p6, "runInThread"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lnet/lingala/zip4j/exception/ZipException;
        }
    .end annotation

    .prologue
    .line 280
    if-nez p1, :cond_0

    .line 281
    new-instance v1, Lnet/lingala/zip4j/exception/ZipException;

    const-string v2, "input zipModel is null"

    invoke-direct {v1, v2}, Lnet/lingala/zip4j/exception/ZipException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 284
    :cond_0
    invoke-static {p2}, Lnet/lingala/zip4j/util/Zip4jUtil;->checkOutputFolder(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_1

    .line 285
    new-instance v1, Lnet/lingala/zip4j/exception/ZipException;

    const-string v2, "Invalid output path"

    invoke-direct {v1, v2}, Lnet/lingala/zip4j/exception/ZipException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 288
    :cond_1
    if-nez p0, :cond_2

    .line 289
    new-instance v1, Lnet/lingala/zip4j/exception/ZipException;

    const-string v2, "invalid file header"

    invoke-direct {v1, v2}, Lnet/lingala/zip4j/exception/ZipException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 291
    :cond_2
    new-instance v0, Lnet/lingala/zip4j/unzip/Unzip;

    invoke-direct {v0, p1}, Lnet/lingala/zip4j/unzip/Unzip;-><init>(Lnet/lingala/zip4j/model/ZipModel;)V

    .local v0, "unzip":Lnet/lingala/zip4j/unzip/Unzip;
    move-object v1, p0

    move-object v2, p2

    move-object v3, p3

    move-object v4, p4

    move-object v5, p5

    move v6, p6

    .line 292
    invoke-virtual/range {v0 .. v6}, Lnet/lingala/zip4j/unzip/Unzip;->extractFile(Lnet/lingala/zip4j/model/FileHeader;Ljava/lang/String;Lnet/lingala/zip4j/model/UnzipParameters;Ljava/lang/String;Lnet/lingala/zip4j/progress/ProgressMonitor;Z)V

    .line 293
    return-void
.end method

.method public extractFile(Lnet/lingala/zip4j/model/ZipModel;Ljava/lang/String;Lnet/lingala/zip4j/model/UnzipParameters;Lnet/lingala/zip4j/progress/ProgressMonitor;Z)V
    .locals 7
    .param p1, "zipModel"    # Lnet/lingala/zip4j/model/ZipModel;
    .param p2, "outPath"    # Ljava/lang/String;
    .param p3, "unzipParameters"    # Lnet/lingala/zip4j/model/UnzipParameters;
    .param p4, "progressMonitor"    # Lnet/lingala/zip4j/progress/ProgressMonitor;
    .param p5, "runInThread"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lnet/lingala/zip4j/exception/ZipException;
        }
    .end annotation

    .prologue
    .line 263
    const/4 v4, 0x0

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move-object v3, p3

    move-object v5, p4

    move v6, p5

    invoke-virtual/range {v0 .. v6}, Lnet/lingala/zip4j/model/FileHeader;->extractFile(Lnet/lingala/zip4j/model/ZipModel;Ljava/lang/String;Lnet/lingala/zip4j/model/UnzipParameters;Ljava/lang/String;Lnet/lingala/zip4j/progress/ProgressMonitor;Z)V

    .line 264
    return-void
.end method

.method public extractFile(Lnet/lingala/zip4j/model/ZipModel;Ljava/lang/String;Lnet/lingala/zip4j/progress/ProgressMonitor;Z)V
    .locals 6
    .param p1, "zipModel"    # Lnet/lingala/zip4j/model/ZipModel;
    .param p2, "outPath"    # Ljava/lang/String;
    .param p3, "progressMonitor"    # Lnet/lingala/zip4j/progress/ProgressMonitor;
    .param p4, "runInThread"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lnet/lingala/zip4j/exception/ZipException;
        }
    .end annotation

    .prologue
    .line 250
    const/4 v3, 0x0

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move-object v4, p3

    move v5, p4

    invoke-virtual/range {v0 .. v5}, Lnet/lingala/zip4j/model/FileHeader;->extractFile(Lnet/lingala/zip4j/model/ZipModel;Ljava/lang/String;Lnet/lingala/zip4j/model/UnzipParameters;Lnet/lingala/zip4j/progress/ProgressMonitor;Z)V

    .line 251
    return-void
.end method

.method public getAesExtraDataRecord()Lnet/lingala/zip4j/model/AESExtraDataRecord;
    .locals 1

    .prologue
    .line 352
    iget-object v0, p0, Lnet/lingala/zip4j/model/FileHeader;->aesExtraDataRecord:Lnet/lingala/zip4j/model/AESExtraDataRecord;

    return-object v0
.end method

.method public getCompressedSize()J
    .locals 2

    .prologue
    .line 147
    iget-wide v0, p0, Lnet/lingala/zip4j/model/FileHeader;->compressedSize:J

    return-wide v0
.end method

.method public getCompressionMethod()I
    .locals 1

    .prologue
    .line 123
    iget v0, p0, Lnet/lingala/zip4j/model/FileHeader;->compressionMethod:I

    return v0
.end method

.method public getCrc32()J
    .locals 4

    .prologue
    .line 139
    iget-wide v0, p0, Lnet/lingala/zip4j/model/FileHeader;->crc32:J

    const-wide v2, 0xffffffffL

    and-long/2addr v0, v2

    return-wide v0
.end method

.method public getCrcBuff()[B
    .locals 1

    .prologue
    .line 320
    iget-object v0, p0, Lnet/lingala/zip4j/model/FileHeader;->crcBuff:[B

    return-object v0
.end method

.method public getDiskNumberStart()I
    .locals 1

    .prologue
    .line 187
    iget v0, p0, Lnet/lingala/zip4j/model/FileHeader;->diskNumberStart:I

    return v0
.end method

.method public getEncryptionMethod()I
    .locals 1

    .prologue
    .line 304
    iget v0, p0, Lnet/lingala/zip4j/model/FileHeader;->encryptionMethod:I

    return v0
.end method

.method public getExternalFileAttr()[B
    .locals 1

    .prologue
    .line 203
    iget-object v0, p0, Lnet/lingala/zip4j/model/FileHeader;->externalFileAttr:[B

    return-object v0
.end method

.method public getExtraDataRecords()Ljava/util/ArrayList;
    .locals 1

    .prologue
    .line 328
    iget-object v0, p0, Lnet/lingala/zip4j/model/FileHeader;->extraDataRecords:Ljava/util/ArrayList;

    return-object v0
.end method

.method public getExtraFieldLength()I
    .locals 1

    .prologue
    .line 171
    iget v0, p0, Lnet/lingala/zip4j/model/FileHeader;->extraFieldLength:I

    return v0
.end method

.method public getFileComment()Ljava/lang/String;
    .locals 1

    .prologue
    .line 227
    iget-object v0, p0, Lnet/lingala/zip4j/model/FileHeader;->fileComment:Ljava/lang/String;

    return-object v0
.end method

.method public getFileCommentLength()I
    .locals 1

    .prologue
    .line 179
    iget v0, p0, Lnet/lingala/zip4j/model/FileHeader;->fileCommentLength:I

    return v0
.end method

.method public getFileName()Ljava/lang/String;
    .locals 1

    .prologue
    .line 219
    iget-object v0, p0, Lnet/lingala/zip4j/model/FileHeader;->fileName:Ljava/lang/String;

    return-object v0
.end method

.method public getFileNameLength()I
    .locals 1

    .prologue
    .line 163
    iget v0, p0, Lnet/lingala/zip4j/model/FileHeader;->fileNameLength:I

    return v0
.end method

.method public getGeneralPurposeFlag()[B
    .locals 1

    .prologue
    .line 115
    iget-object v0, p0, Lnet/lingala/zip4j/model/FileHeader;->generalPurposeFlag:[B

    return-object v0
.end method

.method public getInternalFileAttr()[B
    .locals 1

    .prologue
    .line 195
    iget-object v0, p0, Lnet/lingala/zip4j/model/FileHeader;->internalFileAttr:[B

    return-object v0
.end method

.method public getLastModFileTime()I
    .locals 1

    .prologue
    .line 131
    iget v0, p0, Lnet/lingala/zip4j/model/FileHeader;->lastModFileTime:I

    return v0
.end method

.method public getOffsetLocalHeader()J
    .locals 2

    .prologue
    .line 211
    iget-wide v0, p0, Lnet/lingala/zip4j/model/FileHeader;->offsetLocalHeader:J

    return-wide v0
.end method

.method public getPassword()[C
    .locals 1

    .prologue
    .line 312
    iget-object v0, p0, Lnet/lingala/zip4j/model/FileHeader;->password:[C

    return-object v0
.end method

.method public getSignature()I
    .locals 1

    .prologue
    .line 91
    iget v0, p0, Lnet/lingala/zip4j/model/FileHeader;->signature:I

    return v0
.end method

.method public getUncompressedSize()J
    .locals 2

    .prologue
    .line 155
    iget-wide v0, p0, Lnet/lingala/zip4j/model/FileHeader;->uncompressedSize:J

    return-wide v0
.end method

.method public getVersionMadeBy()I
    .locals 1

    .prologue
    .line 99
    iget v0, p0, Lnet/lingala/zip4j/model/FileHeader;->versionMadeBy:I

    return v0
.end method

.method public getVersionNeededToExtract()I
    .locals 1

    .prologue
    .line 107
    iget v0, p0, Lnet/lingala/zip4j/model/FileHeader;->versionNeededToExtract:I

    return v0
.end method

.method public getZip64ExtendedInfo()Lnet/lingala/zip4j/model/Zip64ExtendedInfo;
    .locals 1

    .prologue
    .line 344
    iget-object v0, p0, Lnet/lingala/zip4j/model/FileHeader;->zip64ExtendedInfo:Lnet/lingala/zip4j/model/Zip64ExtendedInfo;

    return-object v0
.end method

.method public isDataDescriptorExists()Z
    .locals 1

    .prologue
    .line 336
    iget-boolean v0, p0, Lnet/lingala/zip4j/model/FileHeader;->dataDescriptorExists:Z

    return v0
.end method

.method public isDirectory()Z
    .locals 1

    .prologue
    .line 235
    iget-boolean v0, p0, Lnet/lingala/zip4j/model/FileHeader;->isDirectory:Z

    return v0
.end method

.method public isEncrypted()Z
    .locals 1

    .prologue
    .line 296
    iget-boolean v0, p0, Lnet/lingala/zip4j/model/FileHeader;->isEncrypted:Z

    return v0
.end method

.method public isFileNameUTF8Encoded()Z
    .locals 1

    .prologue
    .line 360
    iget-boolean v0, p0, Lnet/lingala/zip4j/model/FileHeader;->fileNameUTF8Encoded:Z

    return v0
.end method

.method public setAesExtraDataRecord(Lnet/lingala/zip4j/model/AESExtraDataRecord;)V
    .locals 0
    .param p1, "aesExtraDataRecord"    # Lnet/lingala/zip4j/model/AESExtraDataRecord;

    .prologue
    .line 356
    iput-object p1, p0, Lnet/lingala/zip4j/model/FileHeader;->aesExtraDataRecord:Lnet/lingala/zip4j/model/AESExtraDataRecord;

    .line 357
    return-void
.end method

.method public setCompressedSize(J)V
    .locals 1
    .param p1, "compressedSize"    # J

    .prologue
    .line 151
    iput-wide p1, p0, Lnet/lingala/zip4j/model/FileHeader;->compressedSize:J

    .line 152
    return-void
.end method

.method public setCompressionMethod(I)V
    .locals 0
    .param p1, "compressionMethod"    # I

    .prologue
    .line 127
    iput p1, p0, Lnet/lingala/zip4j/model/FileHeader;->compressionMethod:I

    .line 128
    return-void
.end method

.method public setCrc32(J)V
    .locals 1
    .param p1, "crc32"    # J

    .prologue
    .line 143
    iput-wide p1, p0, Lnet/lingala/zip4j/model/FileHeader;->crc32:J

    .line 144
    return-void
.end method

.method public setCrcBuff([B)V
    .locals 0
    .param p1, "crcBuff"    # [B

    .prologue
    .line 324
    iput-object p1, p0, Lnet/lingala/zip4j/model/FileHeader;->crcBuff:[B

    .line 325
    return-void
.end method

.method public setDataDescriptorExists(Z)V
    .locals 0
    .param p1, "dataDescriptorExists"    # Z

    .prologue
    .line 340
    iput-boolean p1, p0, Lnet/lingala/zip4j/model/FileHeader;->dataDescriptorExists:Z

    .line 341
    return-void
.end method

.method public setDirectory(Z)V
    .locals 0
    .param p1, "isDirectory"    # Z

    .prologue
    .line 239
    iput-boolean p1, p0, Lnet/lingala/zip4j/model/FileHeader;->isDirectory:Z

    .line 240
    return-void
.end method

.method public setDiskNumberStart(I)V
    .locals 0
    .param p1, "diskNumberStart"    # I

    .prologue
    .line 191
    iput p1, p0, Lnet/lingala/zip4j/model/FileHeader;->diskNumberStart:I

    .line 192
    return-void
.end method

.method public setEncrypted(Z)V
    .locals 0
    .param p1, "isEncrypted"    # Z

    .prologue
    .line 300
    iput-boolean p1, p0, Lnet/lingala/zip4j/model/FileHeader;->isEncrypted:Z

    .line 301
    return-void
.end method

.method public setEncryptionMethod(I)V
    .locals 0
    .param p1, "encryptionMethod"    # I

    .prologue
    .line 308
    iput p1, p0, Lnet/lingala/zip4j/model/FileHeader;->encryptionMethod:I

    .line 309
    return-void
.end method

.method public setExternalFileAttr([B)V
    .locals 0
    .param p1, "externalFileAttr"    # [B

    .prologue
    .line 207
    iput-object p1, p0, Lnet/lingala/zip4j/model/FileHeader;->externalFileAttr:[B

    .line 208
    return-void
.end method

.method public setExtraDataRecords(Ljava/util/ArrayList;)V
    .locals 0
    .param p1, "extraDataRecords"    # Ljava/util/ArrayList;

    .prologue
    .line 332
    iput-object p1, p0, Lnet/lingala/zip4j/model/FileHeader;->extraDataRecords:Ljava/util/ArrayList;

    .line 333
    return-void
.end method

.method public setExtraFieldLength(I)V
    .locals 0
    .param p1, "extraFieldLength"    # I

    .prologue
    .line 175
    iput p1, p0, Lnet/lingala/zip4j/model/FileHeader;->extraFieldLength:I

    .line 176
    return-void
.end method

.method public setFileComment(Ljava/lang/String;)V
    .locals 0
    .param p1, "fileComment"    # Ljava/lang/String;

    .prologue
    .line 231
    iput-object p1, p0, Lnet/lingala/zip4j/model/FileHeader;->fileComment:Ljava/lang/String;

    .line 232
    return-void
.end method

.method public setFileCommentLength(I)V
    .locals 0
    .param p1, "fileCommentLength"    # I

    .prologue
    .line 183
    iput p1, p0, Lnet/lingala/zip4j/model/FileHeader;->fileCommentLength:I

    .line 184
    return-void
.end method

.method public setFileName(Ljava/lang/String;)V
    .locals 0
    .param p1, "fileName"    # Ljava/lang/String;

    .prologue
    .line 223
    iput-object p1, p0, Lnet/lingala/zip4j/model/FileHeader;->fileName:Ljava/lang/String;

    .line 224
    return-void
.end method

.method public setFileNameLength(I)V
    .locals 0
    .param p1, "fileNameLength"    # I

    .prologue
    .line 167
    iput p1, p0, Lnet/lingala/zip4j/model/FileHeader;->fileNameLength:I

    .line 168
    return-void
.end method

.method public setFileNameUTF8Encoded(Z)V
    .locals 0
    .param p1, "fileNameUTF8Encoded"    # Z

    .prologue
    .line 364
    iput-boolean p1, p0, Lnet/lingala/zip4j/model/FileHeader;->fileNameUTF8Encoded:Z

    .line 365
    return-void
.end method

.method public setGeneralPurposeFlag([B)V
    .locals 0
    .param p1, "generalPurposeFlag"    # [B

    .prologue
    .line 119
    iput-object p1, p0, Lnet/lingala/zip4j/model/FileHeader;->generalPurposeFlag:[B

    .line 120
    return-void
.end method

.method public setInternalFileAttr([B)V
    .locals 0
    .param p1, "internalFileAttr"    # [B

    .prologue
    .line 199
    iput-object p1, p0, Lnet/lingala/zip4j/model/FileHeader;->internalFileAttr:[B

    .line 200
    return-void
.end method

.method public setLastModFileTime(I)V
    .locals 0
    .param p1, "lastModFileTime"    # I

    .prologue
    .line 135
    iput p1, p0, Lnet/lingala/zip4j/model/FileHeader;->lastModFileTime:I

    .line 136
    return-void
.end method

.method public setOffsetLocalHeader(J)V
    .locals 1
    .param p1, "offsetLocalHeader"    # J

    .prologue
    .line 215
    iput-wide p1, p0, Lnet/lingala/zip4j/model/FileHeader;->offsetLocalHeader:J

    .line 216
    return-void
.end method

.method public setPassword([C)V
    .locals 0
    .param p1, "password"    # [C

    .prologue
    .line 316
    iput-object p1, p0, Lnet/lingala/zip4j/model/FileHeader;->password:[C

    .line 317
    return-void
.end method

.method public setSignature(I)V
    .locals 0
    .param p1, "signature"    # I

    .prologue
    .line 95
    iput p1, p0, Lnet/lingala/zip4j/model/FileHeader;->signature:I

    .line 96
    return-void
.end method

.method public setUncompressedSize(J)V
    .locals 1
    .param p1, "uncompressedSize"    # J

    .prologue
    .line 159
    iput-wide p1, p0, Lnet/lingala/zip4j/model/FileHeader;->uncompressedSize:J

    .line 160
    return-void
.end method

.method public setVersionMadeBy(I)V
    .locals 0
    .param p1, "versionMadeBy"    # I

    .prologue
    .line 103
    iput p1, p0, Lnet/lingala/zip4j/model/FileHeader;->versionMadeBy:I

    .line 104
    return-void
.end method

.method public setVersionNeededToExtract(I)V
    .locals 0
    .param p1, "versionNeededToExtract"    # I

    .prologue
    .line 111
    iput p1, p0, Lnet/lingala/zip4j/model/FileHeader;->versionNeededToExtract:I

    .line 112
    return-void
.end method

.method public setZip64ExtendedInfo(Lnet/lingala/zip4j/model/Zip64ExtendedInfo;)V
    .locals 0
    .param p1, "zip64ExtendedInfo"    # Lnet/lingala/zip4j/model/Zip64ExtendedInfo;

    .prologue
    .line 348
    iput-object p1, p0, Lnet/lingala/zip4j/model/FileHeader;->zip64ExtendedInfo:Lnet/lingala/zip4j/model/Zip64ExtendedInfo;

    .line 349
    return-void
.end method
