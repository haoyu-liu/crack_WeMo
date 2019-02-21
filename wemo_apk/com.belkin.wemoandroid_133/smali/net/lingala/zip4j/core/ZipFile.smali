.class public Lnet/lingala/zip4j/core/ZipFile;
.super Ljava/lang/Object;
.source "ZipFile.java"


# instance fields
.field private file:Ljava/lang/String;

.field private fileNameCharset:Ljava/lang/String;

.field private isEncrypted:Z

.field private mode:I

.field private progressMonitor:Lnet/lingala/zip4j/progress/ProgressMonitor;

.field private runInThread:Z

.field private zipModel:Lnet/lingala/zip4j/model/ZipModel;


# direct methods
.method public constructor <init>(Ljava/io/File;)V
    .locals 3
    .param p1, "zipFile"    # Ljava/io/File;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lnet/lingala/zip4j/exception/ZipException;
        }
    .end annotation

    .prologue
    .line 81
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 82
    if-nez p1, :cond_0

    .line 83
    new-instance v0, Lnet/lingala/zip4j/exception/ZipException;

    const-string v1, "Input zip file parameter is not null"

    .line 84
    const/4 v2, 0x1

    .line 83
    invoke-direct {v0, v1, v2}, Lnet/lingala/zip4j/exception/ZipException;-><init>(Ljava/lang/String;I)V

    throw v0

    .line 87
    :cond_0
    invoke-virtual {p1}, Ljava/io/File;->getPath()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lnet/lingala/zip4j/core/ZipFile;->file:Ljava/lang/String;

    .line 88
    const/4 v0, 0x2

    iput v0, p0, Lnet/lingala/zip4j/core/ZipFile;->mode:I

    .line 89
    new-instance v0, Lnet/lingala/zip4j/progress/ProgressMonitor;

    invoke-direct {v0}, Lnet/lingala/zip4j/progress/ProgressMonitor;-><init>()V

    iput-object v0, p0, Lnet/lingala/zip4j/core/ZipFile;->progressMonitor:Lnet/lingala/zip4j/progress/ProgressMonitor;

    .line 90
    const/4 v0, 0x0

    iput-boolean v0, p0, Lnet/lingala/zip4j/core/ZipFile;->runInThread:Z

    .line 91
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;)V
    .locals 1
    .param p1, "zipFile"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lnet/lingala/zip4j/exception/ZipException;
        }
    .end annotation

    .prologue
    .line 72
    new-instance v0, Ljava/io/File;

    invoke-direct {v0, p1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-direct {p0, v0}, Lnet/lingala/zip4j/core/ZipFile;-><init>(Ljava/io/File;)V

    .line 73
    return-void
.end method

.method private addFolder(Ljava/io/File;Lnet/lingala/zip4j/model/ZipParameters;Z)V
    .locals 3
    .param p1, "path"    # Ljava/io/File;
    .param p2, "parameters"    # Lnet/lingala/zip4j/model/ZipParameters;
    .param p3, "checkSplitArchive"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lnet/lingala/zip4j/exception/ZipException;
        }
    .end annotation

    .prologue
    .line 343
    invoke-direct {p0}, Lnet/lingala/zip4j/core/ZipFile;->checkZipModel()V

    .line 345
    iget-object v1, p0, Lnet/lingala/zip4j/core/ZipFile;->zipModel:Lnet/lingala/zip4j/model/ZipModel;

    if-nez v1, :cond_0

    .line 346
    new-instance v1, Lnet/lingala/zip4j/exception/ZipException;

    const-string v2, "internal error: zip model is null"

    invoke-direct {v1, v2}, Lnet/lingala/zip4j/exception/ZipException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 349
    :cond_0
    if-eqz p3, :cond_1

    .line 350
    iget-object v1, p0, Lnet/lingala/zip4j/core/ZipFile;->zipModel:Lnet/lingala/zip4j/model/ZipModel;

    invoke-virtual {v1}, Lnet/lingala/zip4j/model/ZipModel;->isSplitArchive()Z

    move-result v1

    if-eqz v1, :cond_1

    .line 351
    new-instance v1, Lnet/lingala/zip4j/exception/ZipException;

    const-string v2, "This is a split archive. Zip file format does not allow updating split/spanned files"

    invoke-direct {v1, v2}, Lnet/lingala/zip4j/exception/ZipException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 355
    :cond_1
    new-instance v0, Lnet/lingala/zip4j/zip/ZipEngine;

    iget-object v1, p0, Lnet/lingala/zip4j/core/ZipFile;->zipModel:Lnet/lingala/zip4j/model/ZipModel;

    invoke-direct {v0, v1}, Lnet/lingala/zip4j/zip/ZipEngine;-><init>(Lnet/lingala/zip4j/model/ZipModel;)V

    .line 356
    .local v0, "zipEngine":Lnet/lingala/zip4j/zip/ZipEngine;
    iget-object v1, p0, Lnet/lingala/zip4j/core/ZipFile;->progressMonitor:Lnet/lingala/zip4j/progress/ProgressMonitor;

    iget-boolean v2, p0, Lnet/lingala/zip4j/core/ZipFile;->runInThread:Z

    invoke-virtual {v0, p1, p2, v1, v2}, Lnet/lingala/zip4j/zip/ZipEngine;->addFolderToZip(Ljava/io/File;Lnet/lingala/zip4j/model/ZipParameters;Lnet/lingala/zip4j/progress/ProgressMonitor;Z)V

    .line 358
    return-void
.end method

.method private checkZipModel()V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lnet/lingala/zip4j/exception/ZipException;
        }
    .end annotation

    .prologue
    .line 933
    iget-object v0, p0, Lnet/lingala/zip4j/core/ZipFile;->zipModel:Lnet/lingala/zip4j/model/ZipModel;

    if-nez v0, :cond_0

    .line 934
    iget-object v0, p0, Lnet/lingala/zip4j/core/ZipFile;->file:Ljava/lang/String;

    invoke-static {v0}, Lnet/lingala/zip4j/util/Zip4jUtil;->checkFileExists(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 935
    invoke-direct {p0}, Lnet/lingala/zip4j/core/ZipFile;->readZipInfo()V

    .line 940
    :cond_0
    :goto_0
    return-void

    .line 937
    :cond_1
    invoke-direct {p0}, Lnet/lingala/zip4j/core/ZipFile;->createNewZipModel()V

    goto :goto_0
.end method

.method private createNewZipModel()V
    .locals 2

    .prologue
    .line 947
    new-instance v0, Lnet/lingala/zip4j/model/ZipModel;

    invoke-direct {v0}, Lnet/lingala/zip4j/model/ZipModel;-><init>()V

    iput-object v0, p0, Lnet/lingala/zip4j/core/ZipFile;->zipModel:Lnet/lingala/zip4j/model/ZipModel;

    .line 948
    iget-object v0, p0, Lnet/lingala/zip4j/core/ZipFile;->zipModel:Lnet/lingala/zip4j/model/ZipModel;

    iget-object v1, p0, Lnet/lingala/zip4j/core/ZipFile;->file:Ljava/lang/String;

    invoke-virtual {v0, v1}, Lnet/lingala/zip4j/model/ZipModel;->setZipFile(Ljava/lang/String;)V

    .line 949
    iget-object v0, p0, Lnet/lingala/zip4j/core/ZipFile;->zipModel:Lnet/lingala/zip4j/model/ZipModel;

    iget-object v1, p0, Lnet/lingala/zip4j/core/ZipFile;->fileNameCharset:Ljava/lang/String;

    invoke-virtual {v0, v1}, Lnet/lingala/zip4j/model/ZipModel;->setFileNameCharset(Ljava/lang/String;)V

    .line 950
    return-void
.end method

.method private readZipInfo()V
    .locals 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lnet/lingala/zip4j/exception/ZipException;
        }
    .end annotation

    .prologue
    .line 406
    iget-object v4, p0, Lnet/lingala/zip4j/core/ZipFile;->file:Ljava/lang/String;

    invoke-static {v4}, Lnet/lingala/zip4j/util/Zip4jUtil;->checkFileExists(Ljava/lang/String;)Z

    move-result v4

    if-nez v4, :cond_0

    .line 407
    new-instance v4, Lnet/lingala/zip4j/exception/ZipException;

    const-string v5, "zip file does not exist"

    invoke-direct {v4, v5}, Lnet/lingala/zip4j/exception/ZipException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 410
    :cond_0
    iget-object v4, p0, Lnet/lingala/zip4j/core/ZipFile;->file:Ljava/lang/String;

    invoke-static {v4}, Lnet/lingala/zip4j/util/Zip4jUtil;->checkFileReadAccess(Ljava/lang/String;)Z

    move-result v4

    if-nez v4, :cond_1

    .line 411
    new-instance v4, Lnet/lingala/zip4j/exception/ZipException;

    const-string v5, "no read access for the input zip file"

    invoke-direct {v4, v5}, Lnet/lingala/zip4j/exception/ZipException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 414
    :cond_1
    iget v4, p0, Lnet/lingala/zip4j/core/ZipFile;->mode:I

    const/4 v5, 0x2

    if-eq v4, v5, :cond_2

    .line 415
    new-instance v4, Lnet/lingala/zip4j/exception/ZipException;

    const-string v5, "Invalid mode"

    invoke-direct {v4, v5}, Lnet/lingala/zip4j/exception/ZipException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 418
    :cond_2
    const/4 v2, 0x0

    .line 420
    .local v2, "raf":Ljava/io/RandomAccessFile;
    :try_start_0
    new-instance v3, Ljava/io/RandomAccessFile;

    new-instance v4, Ljava/io/File;

    iget-object v5, p0, Lnet/lingala/zip4j/core/ZipFile;->file:Ljava/lang/String;

    invoke-direct {v4, v5}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    const-string v5, "r"

    invoke-direct {v3, v4, v5}, Ljava/io/RandomAccessFile;-><init>(Ljava/io/File;Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/io/FileNotFoundException; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 422
    .end local v2    # "raf":Ljava/io/RandomAccessFile;
    .local v3, "raf":Ljava/io/RandomAccessFile;
    :try_start_1
    iget-object v4, p0, Lnet/lingala/zip4j/core/ZipFile;->zipModel:Lnet/lingala/zip4j/model/ZipModel;

    if-nez v4, :cond_3

    .line 424
    new-instance v1, Lnet/lingala/zip4j/core/HeaderReader;

    invoke-direct {v1, v3}, Lnet/lingala/zip4j/core/HeaderReader;-><init>(Ljava/io/RandomAccessFile;)V

    .line 425
    .local v1, "headerReader":Lnet/lingala/zip4j/core/HeaderReader;
    iget-object v4, p0, Lnet/lingala/zip4j/core/ZipFile;->fileNameCharset:Ljava/lang/String;

    invoke-virtual {v1, v4}, Lnet/lingala/zip4j/core/HeaderReader;->readAllHeaders(Ljava/lang/String;)Lnet/lingala/zip4j/model/ZipModel;

    move-result-object v4

    iput-object v4, p0, Lnet/lingala/zip4j/core/ZipFile;->zipModel:Lnet/lingala/zip4j/model/ZipModel;

    .line 426
    iget-object v4, p0, Lnet/lingala/zip4j/core/ZipFile;->zipModel:Lnet/lingala/zip4j/model/ZipModel;

    if-eqz v4, :cond_3

    .line 427
    iget-object v4, p0, Lnet/lingala/zip4j/core/ZipFile;->zipModel:Lnet/lingala/zip4j/model/ZipModel;

    iget-object v5, p0, Lnet/lingala/zip4j/core/ZipFile;->file:Ljava/lang/String;

    invoke-virtual {v4, v5}, Lnet/lingala/zip4j/model/ZipModel;->setZipFile(Ljava/lang/String;)V
    :try_end_1
    .catch Ljava/io/FileNotFoundException; {:try_start_1 .. :try_end_1} :catch_3
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 433
    .end local v1    # "headerReader":Lnet/lingala/zip4j/core/HeaderReader;
    :cond_3
    if-eqz v3, :cond_4

    .line 435
    :try_start_2
    invoke-virtual {v3}, Ljava/io/RandomAccessFile;->close()V
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_2

    .line 441
    :cond_4
    :goto_0
    return-void

    .line 430
    .end local v3    # "raf":Ljava/io/RandomAccessFile;
    .restart local v2    # "raf":Ljava/io/RandomAccessFile;
    :catch_0
    move-exception v0

    .line 431
    .local v0, "e":Ljava/io/FileNotFoundException;
    :goto_1
    :try_start_3
    new-instance v4, Lnet/lingala/zip4j/exception/ZipException;

    invoke-direct {v4, v0}, Lnet/lingala/zip4j/exception/ZipException;-><init>(Ljava/lang/Throwable;)V

    throw v4
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 432
    .end local v0    # "e":Ljava/io/FileNotFoundException;
    :catchall_0
    move-exception v4

    .line 433
    :goto_2
    if-eqz v2, :cond_5

    .line 435
    :try_start_4
    invoke-virtual {v2}, Ljava/io/RandomAccessFile;->close()V
    :try_end_4
    .catch Ljava/io/IOException; {:try_start_4 .. :try_end_4} :catch_1

    .line 440
    :cond_5
    :goto_3
    throw v4

    .line 436
    :catch_1
    move-exception v5

    goto :goto_3

    .end local v2    # "raf":Ljava/io/RandomAccessFile;
    .restart local v3    # "raf":Ljava/io/RandomAccessFile;
    :catch_2
    move-exception v4

    goto :goto_0

    .line 432
    :catchall_1
    move-exception v4

    move-object v2, v3

    .end local v3    # "raf":Ljava/io/RandomAccessFile;
    .restart local v2    # "raf":Ljava/io/RandomAccessFile;
    goto :goto_2

    .line 430
    .end local v2    # "raf":Ljava/io/RandomAccessFile;
    .restart local v3    # "raf":Ljava/io/RandomAccessFile;
    :catch_3
    move-exception v0

    move-object v2, v3

    .end local v3    # "raf":Ljava/io/RandomAccessFile;
    .restart local v2    # "raf":Ljava/io/RandomAccessFile;
    goto :goto_1
.end method


# virtual methods
.method public addFile(Ljava/io/File;Lnet/lingala/zip4j/model/ZipParameters;)V
    .locals 1
    .param p1, "sourceFile"    # Ljava/io/File;
    .param p2, "parameters"    # Lnet/lingala/zip4j/model/ZipParameters;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lnet/lingala/zip4j/exception/ZipException;
        }
    .end annotation

    .prologue
    .line 248
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 249
    .local v0, "sourceFileList":Ljava/util/ArrayList;
    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 250
    invoke-virtual {p0, v0, p2}, Lnet/lingala/zip4j/core/ZipFile;->addFiles(Ljava/util/ArrayList;Lnet/lingala/zip4j/model/ZipParameters;)V

    .line 251
    return-void
.end method

.method public addFiles(Ljava/util/ArrayList;Lnet/lingala/zip4j/model/ZipParameters;)V
    .locals 3
    .param p1, "sourceFileList"    # Ljava/util/ArrayList;
    .param p2, "parameters"    # Lnet/lingala/zip4j/model/ZipParameters;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lnet/lingala/zip4j/exception/ZipException;
        }
    .end annotation

    .prologue
    const/4 v2, 0x1

    .line 263
    invoke-direct {p0}, Lnet/lingala/zip4j/core/ZipFile;->checkZipModel()V

    .line 265
    iget-object v1, p0, Lnet/lingala/zip4j/core/ZipFile;->zipModel:Lnet/lingala/zip4j/model/ZipModel;

    if-nez v1, :cond_0

    .line 266
    new-instance v1, Lnet/lingala/zip4j/exception/ZipException;

    const-string v2, "internal error: zip model is null"

    invoke-direct {v1, v2}, Lnet/lingala/zip4j/exception/ZipException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 269
    :cond_0
    if-nez p1, :cond_1

    .line 270
    new-instance v1, Lnet/lingala/zip4j/exception/ZipException;

    const-string v2, "input file ArrayList is null, cannot add files"

    invoke-direct {v1, v2}, Lnet/lingala/zip4j/exception/ZipException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 273
    :cond_1
    invoke-static {p1, v2}, Lnet/lingala/zip4j/util/Zip4jUtil;->checkArrayListTypes(Ljava/util/ArrayList;I)Z

    move-result v1

    if-nez v1, :cond_2

    .line 274
    new-instance v1, Lnet/lingala/zip4j/exception/ZipException;

    const-string v2, "One or more elements in the input ArrayList is not of type File"

    invoke-direct {v1, v2}, Lnet/lingala/zip4j/exception/ZipException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 277
    :cond_2
    if-nez p2, :cond_3

    .line 278
    new-instance v1, Lnet/lingala/zip4j/exception/ZipException;

    const-string v2, "input parameters are null, cannot add files to zip"

    invoke-direct {v1, v2}, Lnet/lingala/zip4j/exception/ZipException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 281
    :cond_3
    iget-object v1, p0, Lnet/lingala/zip4j/core/ZipFile;->progressMonitor:Lnet/lingala/zip4j/progress/ProgressMonitor;

    invoke-virtual {v1}, Lnet/lingala/zip4j/progress/ProgressMonitor;->getState()I

    move-result v1

    if-ne v1, v2, :cond_4

    .line 282
    new-instance v1, Lnet/lingala/zip4j/exception/ZipException;

    const-string v2, "invalid operation - Zip4j is in busy state"

    invoke-direct {v1, v2}, Lnet/lingala/zip4j/exception/ZipException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 285
    :cond_4
    iget-object v1, p0, Lnet/lingala/zip4j/core/ZipFile;->file:Ljava/lang/String;

    invoke-static {v1}, Lnet/lingala/zip4j/util/Zip4jUtil;->checkFileExists(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_5

    .line 286
    iget-object v1, p0, Lnet/lingala/zip4j/core/ZipFile;->zipModel:Lnet/lingala/zip4j/model/ZipModel;

    invoke-virtual {v1}, Lnet/lingala/zip4j/model/ZipModel;->isSplitArchive()Z

    move-result v1

    if-eqz v1, :cond_5

    .line 287
    new-instance v1, Lnet/lingala/zip4j/exception/ZipException;

    const-string v2, "Zip file already exists. Zip file format does not allow updating split/spanned files"

    invoke-direct {v1, v2}, Lnet/lingala/zip4j/exception/ZipException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 291
    :cond_5
    new-instance v0, Lnet/lingala/zip4j/zip/ZipEngine;

    iget-object v1, p0, Lnet/lingala/zip4j/core/ZipFile;->zipModel:Lnet/lingala/zip4j/model/ZipModel;

    invoke-direct {v0, v1}, Lnet/lingala/zip4j/zip/ZipEngine;-><init>(Lnet/lingala/zip4j/model/ZipModel;)V

    .line 292
    .local v0, "zipEngine":Lnet/lingala/zip4j/zip/ZipEngine;
    iget-object v1, p0, Lnet/lingala/zip4j/core/ZipFile;->progressMonitor:Lnet/lingala/zip4j/progress/ProgressMonitor;

    iget-boolean v2, p0, Lnet/lingala/zip4j/core/ZipFile;->runInThread:Z

    invoke-virtual {v0, p1, p2, v1, v2}, Lnet/lingala/zip4j/zip/ZipEngine;->addFiles(Ljava/util/ArrayList;Lnet/lingala/zip4j/model/ZipParameters;Lnet/lingala/zip4j/progress/ProgressMonitor;Z)V

    .line 293
    return-void
.end method

.method public addFolder(Ljava/io/File;Lnet/lingala/zip4j/model/ZipParameters;)V
    .locals 2
    .param p1, "path"    # Ljava/io/File;
    .param p2, "parameters"    # Lnet/lingala/zip4j/model/ZipParameters;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lnet/lingala/zip4j/exception/ZipException;
        }
    .end annotation

    .prologue
    .line 322
    if-nez p1, :cond_0

    .line 323
    new-instance v0, Lnet/lingala/zip4j/exception/ZipException;

    const-string v1, "input path is null, cannot add folder to zip file"

    invoke-direct {v0, v1}, Lnet/lingala/zip4j/exception/ZipException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 326
    :cond_0
    if-nez p2, :cond_1

    .line 327
    new-instance v0, Lnet/lingala/zip4j/exception/ZipException;

    const-string v1, "input parameters are null, cannot add folder to zip file"

    invoke-direct {v0, v1}, Lnet/lingala/zip4j/exception/ZipException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 330
    :cond_1
    const/4 v0, 0x1

    invoke-direct {p0, p1, p2, v0}, Lnet/lingala/zip4j/core/ZipFile;->addFolder(Ljava/io/File;Lnet/lingala/zip4j/model/ZipParameters;Z)V

    .line 331
    return-void
.end method

.method public addFolder(Ljava/lang/String;Lnet/lingala/zip4j/model/ZipParameters;)V
    .locals 2
    .param p1, "path"    # Ljava/lang/String;
    .param p2, "parameters"    # Lnet/lingala/zip4j/model/ZipParameters;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lnet/lingala/zip4j/exception/ZipException;
        }
    .end annotation

    .prologue
    .line 305
    invoke-static {p1}, Lnet/lingala/zip4j/util/Zip4jUtil;->isStringNotNullAndNotEmpty(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 306
    new-instance v0, Lnet/lingala/zip4j/exception/ZipException;

    const-string v1, "input path is null or empty, cannot add folder to zip file"

    invoke-direct {v0, v1}, Lnet/lingala/zip4j/exception/ZipException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 309
    :cond_0
    new-instance v0, Ljava/io/File;

    invoke-direct {v0, p1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0, v0, p2}, Lnet/lingala/zip4j/core/ZipFile;->addFolder(Ljava/io/File;Lnet/lingala/zip4j/model/ZipParameters;)V

    .line 310
    return-void
.end method

.method public addStream(Ljava/io/InputStream;Lnet/lingala/zip4j/model/ZipParameters;)V
    .locals 3
    .param p1, "inputStream"    # Ljava/io/InputStream;
    .param p2, "parameters"    # Lnet/lingala/zip4j/model/ZipParameters;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lnet/lingala/zip4j/exception/ZipException;
        }
    .end annotation

    .prologue
    .line 372
    if-nez p1, :cond_0

    .line 373
    new-instance v1, Lnet/lingala/zip4j/exception/ZipException;

    const-string v2, "inputstream is null, cannot add file to zip"

    invoke-direct {v1, v2}, Lnet/lingala/zip4j/exception/ZipException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 376
    :cond_0
    if-nez p2, :cond_1

    .line 377
    new-instance v1, Lnet/lingala/zip4j/exception/ZipException;

    const-string v2, "zip parameters are null"

    invoke-direct {v1, v2}, Lnet/lingala/zip4j/exception/ZipException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 380
    :cond_1
    const/4 v1, 0x0

    invoke-virtual {p0, v1}, Lnet/lingala/zip4j/core/ZipFile;->setRunInThread(Z)V

    .line 382
    invoke-direct {p0}, Lnet/lingala/zip4j/core/ZipFile;->checkZipModel()V

    .line 384
    iget-object v1, p0, Lnet/lingala/zip4j/core/ZipFile;->zipModel:Lnet/lingala/zip4j/model/ZipModel;

    if-nez v1, :cond_2

    .line 385
    new-instance v1, Lnet/lingala/zip4j/exception/ZipException;

    const-string v2, "internal error: zip model is null"

    invoke-direct {v1, v2}, Lnet/lingala/zip4j/exception/ZipException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 388
    :cond_2
    iget-object v1, p0, Lnet/lingala/zip4j/core/ZipFile;->file:Ljava/lang/String;

    invoke-static {v1}, Lnet/lingala/zip4j/util/Zip4jUtil;->checkFileExists(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_3

    .line 389
    iget-object v1, p0, Lnet/lingala/zip4j/core/ZipFile;->zipModel:Lnet/lingala/zip4j/model/ZipModel;

    invoke-virtual {v1}, Lnet/lingala/zip4j/model/ZipModel;->isSplitArchive()Z

    move-result v1

    if-eqz v1, :cond_3

    .line 390
    new-instance v1, Lnet/lingala/zip4j/exception/ZipException;

    const-string v2, "Zip file already exists. Zip file format does not allow updating split/spanned files"

    invoke-direct {v1, v2}, Lnet/lingala/zip4j/exception/ZipException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 394
    :cond_3
    new-instance v0, Lnet/lingala/zip4j/zip/ZipEngine;

    iget-object v1, p0, Lnet/lingala/zip4j/core/ZipFile;->zipModel:Lnet/lingala/zip4j/model/ZipModel;

    invoke-direct {v0, v1}, Lnet/lingala/zip4j/zip/ZipEngine;-><init>(Lnet/lingala/zip4j/model/ZipModel;)V

    .line 395
    .local v0, "zipEngine":Lnet/lingala/zip4j/zip/ZipEngine;
    invoke-virtual {v0, p1, p2}, Lnet/lingala/zip4j/zip/ZipEngine;->addStreamToZip(Ljava/io/InputStream;Lnet/lingala/zip4j/model/ZipParameters;)V

    .line 396
    return-void
.end method

.method public createZipFile(Ljava/io/File;Lnet/lingala/zip4j/model/ZipParameters;)V
    .locals 6
    .param p1, "sourceFile"    # Ljava/io/File;
    .param p2, "parameters"    # Lnet/lingala/zip4j/model/ZipParameters;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lnet/lingala/zip4j/exception/ZipException;
        }
    .end annotation

    .prologue
    .line 102
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 103
    .local v1, "sourceFileList":Ljava/util/ArrayList;
    invoke-virtual {v1, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 104
    const/4 v3, 0x0

    const-wide/16 v4, -0x1

    move-object v0, p0

    move-object v2, p2

    invoke-virtual/range {v0 .. v5}, Lnet/lingala/zip4j/core/ZipFile;->createZipFile(Ljava/util/ArrayList;Lnet/lingala/zip4j/model/ZipParameters;ZJ)V

    .line 105
    return-void
.end method

.method public createZipFile(Ljava/io/File;Lnet/lingala/zip4j/model/ZipParameters;ZJ)V
    .locals 6
    .param p1, "sourceFile"    # Ljava/io/File;
    .param p2, "parameters"    # Lnet/lingala/zip4j/model/ZipParameters;
    .param p3, "splitArchive"    # Z
    .param p4, "splitLength"    # J
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lnet/lingala/zip4j/exception/ZipException;
        }
    .end annotation

    .prologue
    .line 123
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 124
    .local v1, "sourceFileList":Ljava/util/ArrayList;
    invoke-virtual {v1, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    move-object v0, p0

    move-object v2, p2

    move v3, p3

    move-wide v4, p4

    .line 125
    invoke-virtual/range {v0 .. v5}, Lnet/lingala/zip4j/core/ZipFile;->createZipFile(Ljava/util/ArrayList;Lnet/lingala/zip4j/model/ZipParameters;ZJ)V

    .line 126
    return-void
.end method

.method public createZipFile(Ljava/util/ArrayList;Lnet/lingala/zip4j/model/ZipParameters;)V
    .locals 6
    .param p1, "sourceFileList"    # Ljava/util/ArrayList;
    .param p2, "parameters"    # Lnet/lingala/zip4j/model/ZipParameters;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lnet/lingala/zip4j/exception/ZipException;
        }
    .end annotation

    .prologue
    .line 138
    const/4 v3, 0x0

    const-wide/16 v4, -0x1

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    invoke-virtual/range {v0 .. v5}, Lnet/lingala/zip4j/core/ZipFile;->createZipFile(Ljava/util/ArrayList;Lnet/lingala/zip4j/model/ZipParameters;ZJ)V

    .line 139
    return-void
.end method

.method public createZipFile(Ljava/util/ArrayList;Lnet/lingala/zip4j/model/ZipParameters;ZJ)V
    .locals 4
    .param p1, "sourceFileList"    # Ljava/util/ArrayList;
    .param p2, "parameters"    # Lnet/lingala/zip4j/model/ZipParameters;
    .param p3, "splitArchive"    # Z
    .param p4, "splitLength"    # J
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lnet/lingala/zip4j/exception/ZipException;
        }
    .end annotation

    .prologue
    .line 157
    iget-object v0, p0, Lnet/lingala/zip4j/core/ZipFile;->file:Ljava/lang/String;

    invoke-static {v0}, Lnet/lingala/zip4j/util/Zip4jUtil;->isStringNotNullAndNotEmpty(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 158
    new-instance v0, Lnet/lingala/zip4j/exception/ZipException;

    const-string v1, "zip file path is empty"

    invoke-direct {v0, v1}, Lnet/lingala/zip4j/exception/ZipException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 161
    :cond_0
    iget-object v0, p0, Lnet/lingala/zip4j/core/ZipFile;->file:Ljava/lang/String;

    invoke-static {v0}, Lnet/lingala/zip4j/util/Zip4jUtil;->checkFileExists(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 162
    new-instance v0, Lnet/lingala/zip4j/exception/ZipException;

    new-instance v1, Ljava/lang/StringBuffer;

    const-string v2, "zip file: "

    invoke-direct {v1, v2}, Ljava/lang/StringBuffer;-><init>(Ljava/lang/String;)V

    iget-object v2, p0, Lnet/lingala/zip4j/core/ZipFile;->file:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    const-string v2, " already exists. To add files to existing zip file use addFile method"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Lnet/lingala/zip4j/exception/ZipException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 165
    :cond_1
    if-nez p1, :cond_2

    .line 166
    new-instance v0, Lnet/lingala/zip4j/exception/ZipException;

    const-string v1, "input file ArrayList is null, cannot create zip file"

    invoke-direct {v0, v1}, Lnet/lingala/zip4j/exception/ZipException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 169
    :cond_2
    const/4 v0, 0x1

    invoke-static {p1, v0}, Lnet/lingala/zip4j/util/Zip4jUtil;->checkArrayListTypes(Ljava/util/ArrayList;I)Z

    move-result v0

    if-nez v0, :cond_3

    .line 170
    new-instance v0, Lnet/lingala/zip4j/exception/ZipException;

    const-string v1, "One or more elements in the input ArrayList is not of type File"

    invoke-direct {v0, v1}, Lnet/lingala/zip4j/exception/ZipException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 173
    :cond_3
    invoke-direct {p0}, Lnet/lingala/zip4j/core/ZipFile;->createNewZipModel()V

    .line 174
    iget-object v0, p0, Lnet/lingala/zip4j/core/ZipFile;->zipModel:Lnet/lingala/zip4j/model/ZipModel;

    invoke-virtual {v0, p3}, Lnet/lingala/zip4j/model/ZipModel;->setSplitArchive(Z)V

    .line 175
    iget-object v0, p0, Lnet/lingala/zip4j/core/ZipFile;->zipModel:Lnet/lingala/zip4j/model/ZipModel;

    invoke-virtual {v0, p4, p5}, Lnet/lingala/zip4j/model/ZipModel;->setSplitLength(J)V

    .line 176
    invoke-virtual {p0, p1, p2}, Lnet/lingala/zip4j/core/ZipFile;->addFiles(Ljava/util/ArrayList;Lnet/lingala/zip4j/model/ZipParameters;)V

    .line 177
    return-void
.end method

.method public createZipFileFromFolder(Ljava/io/File;Lnet/lingala/zip4j/model/ZipParameters;ZJ)V
    .locals 4
    .param p1, "folderToAdd"    # Ljava/io/File;
    .param p2, "parameters"    # Lnet/lingala/zip4j/model/ZipParameters;
    .param p3, "splitArchive"    # Z
    .param p4, "splitLength"    # J
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lnet/lingala/zip4j/exception/ZipException;
        }
    .end annotation

    .prologue
    .line 219
    if-nez p1, :cond_0

    .line 220
    new-instance v0, Lnet/lingala/zip4j/exception/ZipException;

    const-string v1, "folderToAdd is null, cannot create zip file from folder"

    invoke-direct {v0, v1}, Lnet/lingala/zip4j/exception/ZipException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 223
    :cond_0
    if-nez p2, :cond_1

    .line 224
    new-instance v0, Lnet/lingala/zip4j/exception/ZipException;

    const-string v1, "input parameters are null, cannot create zip file from folder"

    invoke-direct {v0, v1}, Lnet/lingala/zip4j/exception/ZipException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 227
    :cond_1
    iget-object v0, p0, Lnet/lingala/zip4j/core/ZipFile;->file:Ljava/lang/String;

    invoke-static {v0}, Lnet/lingala/zip4j/util/Zip4jUtil;->checkFileExists(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 228
    new-instance v0, Lnet/lingala/zip4j/exception/ZipException;

    new-instance v1, Ljava/lang/StringBuffer;

    const-string v2, "zip file: "

    invoke-direct {v1, v2}, Ljava/lang/StringBuffer;-><init>(Ljava/lang/String;)V

    iget-object v2, p0, Lnet/lingala/zip4j/core/ZipFile;->file:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    const-string v2, " already exists. To add files to existing zip file use addFolder method"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Lnet/lingala/zip4j/exception/ZipException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 231
    :cond_2
    invoke-direct {p0}, Lnet/lingala/zip4j/core/ZipFile;->createNewZipModel()V

    .line 232
    iget-object v0, p0, Lnet/lingala/zip4j/core/ZipFile;->zipModel:Lnet/lingala/zip4j/model/ZipModel;

    invoke-virtual {v0, p3}, Lnet/lingala/zip4j/model/ZipModel;->setSplitArchive(Z)V

    .line 233
    if-eqz p3, :cond_3

    .line 234
    iget-object v0, p0, Lnet/lingala/zip4j/core/ZipFile;->zipModel:Lnet/lingala/zip4j/model/ZipModel;

    invoke-virtual {v0, p4, p5}, Lnet/lingala/zip4j/model/ZipModel;->setSplitLength(J)V

    .line 236
    :cond_3
    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, v0}, Lnet/lingala/zip4j/core/ZipFile;->addFolder(Ljava/io/File;Lnet/lingala/zip4j/model/ZipParameters;Z)V

    .line 237
    return-void
.end method

.method public createZipFileFromFolder(Ljava/lang/String;Lnet/lingala/zip4j/model/ZipParameters;ZJ)V
    .locals 6
    .param p1, "folderToAdd"    # Ljava/lang/String;
    .param p2, "parameters"    # Lnet/lingala/zip4j/model/ZipParameters;
    .param p3, "splitArchive"    # Z
    .param p4, "splitLength"    # J
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lnet/lingala/zip4j/exception/ZipException;
        }
    .end annotation

    .prologue
    .line 195
    invoke-static {p1}, Lnet/lingala/zip4j/util/Zip4jUtil;->isStringNotNullAndNotEmpty(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 196
    new-instance v0, Lnet/lingala/zip4j/exception/ZipException;

    const-string v1, "folderToAdd is empty or null, cannot create Zip File from folder"

    invoke-direct {v0, v1}, Lnet/lingala/zip4j/exception/ZipException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 199
    :cond_0
    new-instance v1, Ljava/io/File;

    invoke-direct {v1, p1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    move-object v0, p0

    move-object v2, p2

    move v3, p3

    move-wide v4, p4

    invoke-virtual/range {v0 .. v5}, Lnet/lingala/zip4j/core/ZipFile;->createZipFileFromFolder(Ljava/io/File;Lnet/lingala/zip4j/model/ZipParameters;ZJ)V

    .line 201
    return-void
.end method

.method public extractAll(Ljava/lang/String;)V
    .locals 1
    .param p1, "destPath"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lnet/lingala/zip4j/exception/ZipException;
        }
    .end annotation

    .prologue
    .line 451
    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0}, Lnet/lingala/zip4j/core/ZipFile;->extractAll(Ljava/lang/String;Lnet/lingala/zip4j/model/UnzipParameters;)V

    .line 453
    return-void
.end method

.method public extractAll(Ljava/lang/String;Lnet/lingala/zip4j/model/UnzipParameters;)V
    .locals 3
    .param p1, "destPath"    # Ljava/lang/String;
    .param p2, "unzipParameters"    # Lnet/lingala/zip4j/model/UnzipParameters;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lnet/lingala/zip4j/exception/ZipException;
        }
    .end annotation

    .prologue
    .line 466
    invoke-static {p1}, Lnet/lingala/zip4j/util/Zip4jUtil;->isStringNotNullAndNotEmpty(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_0

    .line 467
    new-instance v1, Lnet/lingala/zip4j/exception/ZipException;

    const-string v2, "output path is null or invalid"

    invoke-direct {v1, v2}, Lnet/lingala/zip4j/exception/ZipException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 470
    :cond_0
    invoke-static {p1}, Lnet/lingala/zip4j/util/Zip4jUtil;->checkOutputFolder(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_1

    .line 471
    new-instance v1, Lnet/lingala/zip4j/exception/ZipException;

    const-string v2, "invalid output path"

    invoke-direct {v1, v2}, Lnet/lingala/zip4j/exception/ZipException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 474
    :cond_1
    iget-object v1, p0, Lnet/lingala/zip4j/core/ZipFile;->zipModel:Lnet/lingala/zip4j/model/ZipModel;

    if-nez v1, :cond_2

    .line 475
    invoke-direct {p0}, Lnet/lingala/zip4j/core/ZipFile;->readZipInfo()V

    .line 479
    :cond_2
    iget-object v1, p0, Lnet/lingala/zip4j/core/ZipFile;->zipModel:Lnet/lingala/zip4j/model/ZipModel;

    if-nez v1, :cond_3

    .line 480
    new-instance v1, Lnet/lingala/zip4j/exception/ZipException;

    const-string v2, "Internal error occurred when extracting zip file"

    invoke-direct {v1, v2}, Lnet/lingala/zip4j/exception/ZipException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 483
    :cond_3
    iget-object v1, p0, Lnet/lingala/zip4j/core/ZipFile;->progressMonitor:Lnet/lingala/zip4j/progress/ProgressMonitor;

    invoke-virtual {v1}, Lnet/lingala/zip4j/progress/ProgressMonitor;->getState()I

    move-result v1

    const/4 v2, 0x1

    if-ne v1, v2, :cond_4

    .line 484
    new-instance v1, Lnet/lingala/zip4j/exception/ZipException;

    const-string v2, "invalid operation - Zip4j is in busy state"

    invoke-direct {v1, v2}, Lnet/lingala/zip4j/exception/ZipException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 487
    :cond_4
    new-instance v0, Lnet/lingala/zip4j/unzip/Unzip;

    iget-object v1, p0, Lnet/lingala/zip4j/core/ZipFile;->zipModel:Lnet/lingala/zip4j/model/ZipModel;

    invoke-direct {v0, v1}, Lnet/lingala/zip4j/unzip/Unzip;-><init>(Lnet/lingala/zip4j/model/ZipModel;)V

    .line 488
    .local v0, "unzip":Lnet/lingala/zip4j/unzip/Unzip;
    iget-object v1, p0, Lnet/lingala/zip4j/core/ZipFile;->progressMonitor:Lnet/lingala/zip4j/progress/ProgressMonitor;

    iget-boolean v2, p0, Lnet/lingala/zip4j/core/ZipFile;->runInThread:Z

    invoke-virtual {v0, p2, p1, v1, v2}, Lnet/lingala/zip4j/unzip/Unzip;->extractAll(Lnet/lingala/zip4j/model/UnzipParameters;Ljava/lang/String;Lnet/lingala/zip4j/progress/ProgressMonitor;Z)V

    .line 490
    return-void
.end method

.method public extractFile(Ljava/lang/String;Ljava/lang/String;)V
    .locals 1
    .param p1, "fileName"    # Ljava/lang/String;
    .param p2, "destPath"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lnet/lingala/zip4j/exception/ZipException;
        }
    .end annotation

    .prologue
    .line 566
    const/4 v0, 0x0

    invoke-virtual {p0, p1, p2, v0}, Lnet/lingala/zip4j/core/ZipFile;->extractFile(Ljava/lang/String;Ljava/lang/String;Lnet/lingala/zip4j/model/UnzipParameters;)V

    .line 567
    return-void
.end method

.method public extractFile(Ljava/lang/String;Ljava/lang/String;Lnet/lingala/zip4j/model/UnzipParameters;)V
    .locals 1
    .param p1, "fileName"    # Ljava/lang/String;
    .param p2, "destPath"    # Ljava/lang/String;
    .param p3, "unzipParameters"    # Lnet/lingala/zip4j/model/UnzipParameters;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lnet/lingala/zip4j/exception/ZipException;
        }
    .end annotation

    .prologue
    .line 587
    const/4 v0, 0x0

    invoke-virtual {p0, p1, p2, p3, v0}, Lnet/lingala/zip4j/core/ZipFile;->extractFile(Ljava/lang/String;Ljava/lang/String;Lnet/lingala/zip4j/model/UnzipParameters;Ljava/lang/String;)V

    .line 588
    return-void
.end method

.method public extractFile(Ljava/lang/String;Ljava/lang/String;Lnet/lingala/zip4j/model/UnzipParameters;Ljava/lang/String;)V
    .locals 7
    .param p1, "fileName"    # Ljava/lang/String;
    .param p2, "destPath"    # Ljava/lang/String;
    .param p3, "unzipParameters"    # Lnet/lingala/zip4j/model/UnzipParameters;
    .param p4, "newFileName"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lnet/lingala/zip4j/exception/ZipException;
        }
    .end annotation

    .prologue
    .line 614
    invoke-static {p1}, Lnet/lingala/zip4j/util/Zip4jUtil;->isStringNotNullAndNotEmpty(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_0

    .line 615
    new-instance v1, Lnet/lingala/zip4j/exception/ZipException;

    const-string v2, "file to extract is null or empty, cannot extract file"

    invoke-direct {v1, v2}, Lnet/lingala/zip4j/exception/ZipException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 618
    :cond_0
    invoke-static {p2}, Lnet/lingala/zip4j/util/Zip4jUtil;->isStringNotNullAndNotEmpty(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_1

    .line 619
    new-instance v1, Lnet/lingala/zip4j/exception/ZipException;

    const-string v2, "destination string path is empty or null, cannot extract file"

    invoke-direct {v1, v2}, Lnet/lingala/zip4j/exception/ZipException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 622
    :cond_1
    invoke-direct {p0}, Lnet/lingala/zip4j/core/ZipFile;->readZipInfo()V

    .line 624
    iget-object v1, p0, Lnet/lingala/zip4j/core/ZipFile;->zipModel:Lnet/lingala/zip4j/model/ZipModel;

    invoke-static {v1, p1}, Lnet/lingala/zip4j/util/Zip4jUtil;->getFileHeader(Lnet/lingala/zip4j/model/ZipModel;Ljava/lang/String;)Lnet/lingala/zip4j/model/FileHeader;

    move-result-object v0

    .line 626
    .local v0, "fileHeader":Lnet/lingala/zip4j/model/FileHeader;
    if-nez v0, :cond_2

    .line 627
    new-instance v1, Lnet/lingala/zip4j/exception/ZipException;

    const-string v2, "file header not found for given file name, cannot extract file"

    invoke-direct {v1, v2}, Lnet/lingala/zip4j/exception/ZipException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 630
    :cond_2
    iget-object v1, p0, Lnet/lingala/zip4j/core/ZipFile;->progressMonitor:Lnet/lingala/zip4j/progress/ProgressMonitor;

    invoke-virtual {v1}, Lnet/lingala/zip4j/progress/ProgressMonitor;->getState()I

    move-result v1

    const/4 v2, 0x1

    if-ne v1, v2, :cond_3

    .line 631
    new-instance v1, Lnet/lingala/zip4j/exception/ZipException;

    const-string v2, "invalid operation - Zip4j is in busy state"

    invoke-direct {v1, v2}, Lnet/lingala/zip4j/exception/ZipException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 634
    :cond_3
    iget-object v1, p0, Lnet/lingala/zip4j/core/ZipFile;->zipModel:Lnet/lingala/zip4j/model/ZipModel;

    iget-object v5, p0, Lnet/lingala/zip4j/core/ZipFile;->progressMonitor:Lnet/lingala/zip4j/progress/ProgressMonitor;

    iget-boolean v6, p0, Lnet/lingala/zip4j/core/ZipFile;->runInThread:Z

    move-object v2, p2

    move-object v3, p3

    move-object v4, p4

    invoke-virtual/range {v0 .. v6}, Lnet/lingala/zip4j/model/FileHeader;->extractFile(Lnet/lingala/zip4j/model/ZipModel;Ljava/lang/String;Lnet/lingala/zip4j/model/UnzipParameters;Ljava/lang/String;Lnet/lingala/zip4j/progress/ProgressMonitor;Z)V

    .line 636
    return-void
.end method

.method public extractFile(Lnet/lingala/zip4j/model/FileHeader;Ljava/lang/String;)V
    .locals 1
    .param p1, "fileHeader"    # Lnet/lingala/zip4j/model/FileHeader;
    .param p2, "destPath"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lnet/lingala/zip4j/exception/ZipException;
        }
    .end annotation

    .prologue
    .line 500
    const/4 v0, 0x0

    invoke-virtual {p0, p1, p2, v0}, Lnet/lingala/zip4j/core/ZipFile;->extractFile(Lnet/lingala/zip4j/model/FileHeader;Ljava/lang/String;Lnet/lingala/zip4j/model/UnzipParameters;)V

    .line 501
    return-void
.end method

.method public extractFile(Lnet/lingala/zip4j/model/FileHeader;Ljava/lang/String;Lnet/lingala/zip4j/model/UnzipParameters;)V
    .locals 1
    .param p1, "fileHeader"    # Lnet/lingala/zip4j/model/FileHeader;
    .param p2, "destPath"    # Ljava/lang/String;
    .param p3, "unzipParameters"    # Lnet/lingala/zip4j/model/UnzipParameters;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lnet/lingala/zip4j/exception/ZipException;
        }
    .end annotation

    .prologue
    .line 517
    const/4 v0, 0x0

    invoke-virtual {p0, p1, p2, p3, v0}, Lnet/lingala/zip4j/core/ZipFile;->extractFile(Lnet/lingala/zip4j/model/FileHeader;Ljava/lang/String;Lnet/lingala/zip4j/model/UnzipParameters;Ljava/lang/String;)V

    .line 518
    return-void
.end method

.method public extractFile(Lnet/lingala/zip4j/model/FileHeader;Ljava/lang/String;Lnet/lingala/zip4j/model/UnzipParameters;Ljava/lang/String;)V
    .locals 7
    .param p1, "fileHeader"    # Lnet/lingala/zip4j/model/FileHeader;
    .param p2, "destPath"    # Ljava/lang/String;
    .param p3, "unzipParameters"    # Lnet/lingala/zip4j/model/UnzipParameters;
    .param p4, "newFileName"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lnet/lingala/zip4j/exception/ZipException;
        }
    .end annotation

    .prologue
    .line 532
    if-nez p1, :cond_0

    .line 533
    new-instance v0, Lnet/lingala/zip4j/exception/ZipException;

    const-string v1, "input file header is null, cannot extract file"

    invoke-direct {v0, v1}, Lnet/lingala/zip4j/exception/ZipException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 536
    :cond_0
    invoke-static {p2}, Lnet/lingala/zip4j/util/Zip4jUtil;->isStringNotNullAndNotEmpty(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_1

    .line 537
    new-instance v0, Lnet/lingala/zip4j/exception/ZipException;

    const-string v1, "destination path is empty or null, cannot extract file"

    invoke-direct {v0, v1}, Lnet/lingala/zip4j/exception/ZipException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 540
    :cond_1
    invoke-direct {p0}, Lnet/lingala/zip4j/core/ZipFile;->readZipInfo()V

    .line 542
    iget-object v0, p0, Lnet/lingala/zip4j/core/ZipFile;->progressMonitor:Lnet/lingala/zip4j/progress/ProgressMonitor;

    invoke-virtual {v0}, Lnet/lingala/zip4j/progress/ProgressMonitor;->getState()I

    move-result v0

    const/4 v1, 0x1

    if-ne v0, v1, :cond_2

    .line 543
    new-instance v0, Lnet/lingala/zip4j/exception/ZipException;

    const-string v1, "invalid operation - Zip4j is in busy state"

    invoke-direct {v0, v1}, Lnet/lingala/zip4j/exception/ZipException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 546
    :cond_2
    iget-object v1, p0, Lnet/lingala/zip4j/core/ZipFile;->zipModel:Lnet/lingala/zip4j/model/ZipModel;

    iget-object v5, p0, Lnet/lingala/zip4j/core/ZipFile;->progressMonitor:Lnet/lingala/zip4j/progress/ProgressMonitor;

    iget-boolean v6, p0, Lnet/lingala/zip4j/core/ZipFile;->runInThread:Z

    move-object v0, p1

    move-object v2, p2

    move-object v3, p3

    move-object v4, p4

    invoke-virtual/range {v0 .. v6}, Lnet/lingala/zip4j/model/FileHeader;->extractFile(Lnet/lingala/zip4j/model/ZipModel;Ljava/lang/String;Lnet/lingala/zip4j/model/UnzipParameters;Ljava/lang/String;Lnet/lingala/zip4j/progress/ProgressMonitor;Z)V

    .line 548
    return-void
.end method

.method public getComment()Ljava/lang/String;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lnet/lingala/zip4j/exception/ZipException;
        }
    .end annotation

    .prologue
    .line 884
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lnet/lingala/zip4j/core/ZipFile;->getComment(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getComment(Ljava/lang/String;)Ljava/lang/String;
    .locals 3
    .param p1, "encoding"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lnet/lingala/zip4j/exception/ZipException;
        }
    .end annotation

    .prologue
    .line 894
    if-nez p1, :cond_0

    .line 895
    const-string v1, "windows-1254"

    invoke-static {v1}, Lnet/lingala/zip4j/util/Zip4jUtil;->isSupportedCharset(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 896
    const-string p1, "windows-1254"

    .line 902
    :cond_0
    :goto_0
    iget-object v1, p0, Lnet/lingala/zip4j/core/ZipFile;->file:Ljava/lang/String;

    invoke-static {v1}, Lnet/lingala/zip4j/util/Zip4jUtil;->checkFileExists(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_2

    .line 903
    invoke-direct {p0}, Lnet/lingala/zip4j/core/ZipFile;->checkZipModel()V

    .line 908
    iget-object v1, p0, Lnet/lingala/zip4j/core/ZipFile;->zipModel:Lnet/lingala/zip4j/model/ZipModel;

    if-nez v1, :cond_3

    .line 909
    new-instance v1, Lnet/lingala/zip4j/exception/ZipException;

    const-string v2, "zip model is null, cannot read comment"

    invoke-direct {v1, v2}, Lnet/lingala/zip4j/exception/ZipException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 898
    :cond_1
    sget-object p1, Lnet/lingala/zip4j/util/InternalZipConstants;->CHARSET_DEFAULT:Ljava/lang/String;

    goto :goto_0

    .line 905
    :cond_2
    new-instance v1, Lnet/lingala/zip4j/exception/ZipException;

    const-string v2, "zip file does not exist, cannot read comment"

    invoke-direct {v1, v2}, Lnet/lingala/zip4j/exception/ZipException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 912
    :cond_3
    iget-object v1, p0, Lnet/lingala/zip4j/core/ZipFile;->zipModel:Lnet/lingala/zip4j/model/ZipModel;

    invoke-virtual {v1}, Lnet/lingala/zip4j/model/ZipModel;->getEndCentralDirRecord()Lnet/lingala/zip4j/model/EndCentralDirRecord;

    move-result-object v1

    if-nez v1, :cond_4

    .line 913
    new-instance v1, Lnet/lingala/zip4j/exception/ZipException;

    const-string v2, "end of central directory record is null, cannot read comment"

    invoke-direct {v1, v2}, Lnet/lingala/zip4j/exception/ZipException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 916
    :cond_4
    iget-object v1, p0, Lnet/lingala/zip4j/core/ZipFile;->zipModel:Lnet/lingala/zip4j/model/ZipModel;

    invoke-virtual {v1}, Lnet/lingala/zip4j/model/ZipModel;->getEndCentralDirRecord()Lnet/lingala/zip4j/model/EndCentralDirRecord;

    move-result-object v1

    invoke-virtual {v1}, Lnet/lingala/zip4j/model/EndCentralDirRecord;->getCommentBytes()[B

    move-result-object v1

    if-eqz v1, :cond_5

    .line 917
    iget-object v1, p0, Lnet/lingala/zip4j/core/ZipFile;->zipModel:Lnet/lingala/zip4j/model/ZipModel;

    invoke-virtual {v1}, Lnet/lingala/zip4j/model/ZipModel;->getEndCentralDirRecord()Lnet/lingala/zip4j/model/EndCentralDirRecord;

    move-result-object v1

    invoke-virtual {v1}, Lnet/lingala/zip4j/model/EndCentralDirRecord;->getCommentBytes()[B

    move-result-object v1

    array-length v1, v1

    if-gtz v1, :cond_6

    .line 918
    :cond_5
    const/4 v1, 0x0

    .line 922
    :goto_1
    return-object v1

    :cond_6
    :try_start_0
    new-instance v1, Ljava/lang/String;

    iget-object v2, p0, Lnet/lingala/zip4j/core/ZipFile;->zipModel:Lnet/lingala/zip4j/model/ZipModel;

    invoke-virtual {v2}, Lnet/lingala/zip4j/model/ZipModel;->getEndCentralDirRecord()Lnet/lingala/zip4j/model/EndCentralDirRecord;

    move-result-object v2

    invoke-virtual {v2}, Lnet/lingala/zip4j/model/EndCentralDirRecord;->getCommentBytes()[B

    move-result-object v2

    invoke-direct {v1, v2, p1}, Ljava/lang/String;-><init>([BLjava/lang/String;)V
    :try_end_0
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_1

    .line 923
    :catch_0
    move-exception v0

    .line 924
    .local v0, "e":Ljava/io/UnsupportedEncodingException;
    new-instance v1, Lnet/lingala/zip4j/exception/ZipException;

    invoke-direct {v1, v0}, Lnet/lingala/zip4j/exception/ZipException;-><init>(Ljava/lang/Throwable;)V

    throw v1
.end method

.method public getFile()Ljava/io/File;
    .locals 2

    .prologue
    .line 1039
    new-instance v0, Ljava/io/File;

    iget-object v1, p0, Lnet/lingala/zip4j/core/ZipFile;->file:Ljava/lang/String;

    invoke-direct {v0, v1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    return-object v0
.end method

.method public getFileHeader(Ljava/lang/String;)Lnet/lingala/zip4j/model/FileHeader;
    .locals 2
    .param p1, "fileName"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lnet/lingala/zip4j/exception/ZipException;
        }
    .end annotation

    .prologue
    .line 703
    invoke-static {p1}, Lnet/lingala/zip4j/util/Zip4jUtil;->isStringNotNullAndNotEmpty(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 704
    new-instance v0, Lnet/lingala/zip4j/exception/ZipException;

    const-string v1, "input file name is emtpy or null, cannot get FileHeader"

    invoke-direct {v0, v1}, Lnet/lingala/zip4j/exception/ZipException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 707
    :cond_0
    invoke-direct {p0}, Lnet/lingala/zip4j/core/ZipFile;->readZipInfo()V

    .line 708
    iget-object v0, p0, Lnet/lingala/zip4j/core/ZipFile;->zipModel:Lnet/lingala/zip4j/model/ZipModel;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lnet/lingala/zip4j/core/ZipFile;->zipModel:Lnet/lingala/zip4j/model/ZipModel;

    invoke-virtual {v0}, Lnet/lingala/zip4j/model/ZipModel;->getCentralDirectory()Lnet/lingala/zip4j/model/CentralDirectory;

    move-result-object v0

    if-nez v0, :cond_2

    .line 709
    :cond_1
    const/4 v0, 0x0

    .line 712
    :goto_0
    return-object v0

    :cond_2
    iget-object v0, p0, Lnet/lingala/zip4j/core/ZipFile;->zipModel:Lnet/lingala/zip4j/model/ZipModel;

    invoke-static {v0, p1}, Lnet/lingala/zip4j/util/Zip4jUtil;->getFileHeader(Lnet/lingala/zip4j/model/ZipModel;Ljava/lang/String;)Lnet/lingala/zip4j/model/FileHeader;

    move-result-object v0

    goto :goto_0
.end method

.method public getFileHeaders()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lnet/lingala/zip4j/exception/ZipException;
        }
    .end annotation

    .prologue
    .line 688
    invoke-direct {p0}, Lnet/lingala/zip4j/core/ZipFile;->readZipInfo()V

    .line 689
    iget-object v0, p0, Lnet/lingala/zip4j/core/ZipFile;->zipModel:Lnet/lingala/zip4j/model/ZipModel;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lnet/lingala/zip4j/core/ZipFile;->zipModel:Lnet/lingala/zip4j/model/ZipModel;

    invoke-virtual {v0}, Lnet/lingala/zip4j/model/ZipModel;->getCentralDirectory()Lnet/lingala/zip4j/model/CentralDirectory;

    move-result-object v0

    if-nez v0, :cond_1

    .line 690
    :cond_0
    const/4 v0, 0x0

    .line 692
    :goto_0
    return-object v0

    :cond_1
    iget-object v0, p0, Lnet/lingala/zip4j/core/ZipFile;->zipModel:Lnet/lingala/zip4j/model/ZipModel;

    invoke-virtual {v0}, Lnet/lingala/zip4j/model/ZipModel;->getCentralDirectory()Lnet/lingala/zip4j/model/CentralDirectory;

    move-result-object v0

    invoke-virtual {v0}, Lnet/lingala/zip4j/model/CentralDirectory;->getFileHeaders()Ljava/util/ArrayList;

    move-result-object v0

    goto :goto_0
.end method

.method public getInputStream(Lnet/lingala/zip4j/model/FileHeader;)Lnet/lingala/zip4j/io/ZipInputStream;
    .locals 3
    .param p1, "fileHeader"    # Lnet/lingala/zip4j/model/FileHeader;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lnet/lingala/zip4j/exception/ZipException;
        }
    .end annotation

    .prologue
    .line 979
    if-nez p1, :cond_0

    .line 980
    new-instance v1, Lnet/lingala/zip4j/exception/ZipException;

    const-string v2, "FileHeader is null, cannot get InputStream"

    invoke-direct {v1, v2}, Lnet/lingala/zip4j/exception/ZipException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 983
    :cond_0
    invoke-direct {p0}, Lnet/lingala/zip4j/core/ZipFile;->checkZipModel()V

    .line 985
    iget-object v1, p0, Lnet/lingala/zip4j/core/ZipFile;->zipModel:Lnet/lingala/zip4j/model/ZipModel;

    if-nez v1, :cond_1

    .line 986
    new-instance v1, Lnet/lingala/zip4j/exception/ZipException;

    const-string v2, "zip model is null, cannot get inputstream"

    invoke-direct {v1, v2}, Lnet/lingala/zip4j/exception/ZipException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 989
    :cond_1
    new-instance v0, Lnet/lingala/zip4j/unzip/Unzip;

    iget-object v1, p0, Lnet/lingala/zip4j/core/ZipFile;->zipModel:Lnet/lingala/zip4j/model/ZipModel;

    invoke-direct {v0, v1}, Lnet/lingala/zip4j/unzip/Unzip;-><init>(Lnet/lingala/zip4j/model/ZipModel;)V

    .line 990
    .local v0, "unzip":Lnet/lingala/zip4j/unzip/Unzip;
    invoke-virtual {v0, p1}, Lnet/lingala/zip4j/unzip/Unzip;->getInputStream(Lnet/lingala/zip4j/model/FileHeader;)Lnet/lingala/zip4j/io/ZipInputStream;

    move-result-object v1

    return-object v1
.end method

.method public getProgressMonitor()Lnet/lingala/zip4j/progress/ProgressMonitor;
    .locals 1

    .prologue
    .line 1023
    iget-object v0, p0, Lnet/lingala/zip4j/core/ZipFile;->progressMonitor:Lnet/lingala/zip4j/progress/ProgressMonitor;

    return-object v0
.end method

.method public getSplitZipFiles()Ljava/util/ArrayList;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lnet/lingala/zip4j/exception/ZipException;
        }
    .end annotation

    .prologue
    .line 1018
    invoke-direct {p0}, Lnet/lingala/zip4j/core/ZipFile;->checkZipModel()V

    .line 1019
    iget-object v0, p0, Lnet/lingala/zip4j/core/ZipFile;->zipModel:Lnet/lingala/zip4j/model/ZipModel;

    invoke-static {v0}, Lnet/lingala/zip4j/util/Zip4jUtil;->getSplitZipFiles(Lnet/lingala/zip4j/model/ZipModel;)Ljava/util/ArrayList;

    move-result-object v0

    return-object v0
.end method

.method public isEncrypted()Z
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lnet/lingala/zip4j/exception/ZipException;
        }
    .end annotation

    .prologue
    .line 721
    iget-object v3, p0, Lnet/lingala/zip4j/core/ZipFile;->zipModel:Lnet/lingala/zip4j/model/ZipModel;

    if-nez v3, :cond_0

    .line 722
    invoke-direct {p0}, Lnet/lingala/zip4j/core/ZipFile;->readZipInfo()V

    .line 723
    iget-object v3, p0, Lnet/lingala/zip4j/core/ZipFile;->zipModel:Lnet/lingala/zip4j/model/ZipModel;

    if-nez v3, :cond_0

    .line 724
    new-instance v3, Lnet/lingala/zip4j/exception/ZipException;

    const-string v4, "Zip Model is null"

    invoke-direct {v3, v4}, Lnet/lingala/zip4j/exception/ZipException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 728
    :cond_0
    iget-object v3, p0, Lnet/lingala/zip4j/core/ZipFile;->zipModel:Lnet/lingala/zip4j/model/ZipModel;

    invoke-virtual {v3}, Lnet/lingala/zip4j/model/ZipModel;->getCentralDirectory()Lnet/lingala/zip4j/model/CentralDirectory;

    move-result-object v3

    if-eqz v3, :cond_1

    iget-object v3, p0, Lnet/lingala/zip4j/core/ZipFile;->zipModel:Lnet/lingala/zip4j/model/ZipModel;

    invoke-virtual {v3}, Lnet/lingala/zip4j/model/ZipModel;->getCentralDirectory()Lnet/lingala/zip4j/model/CentralDirectory;

    move-result-object v3

    invoke-virtual {v3}, Lnet/lingala/zip4j/model/CentralDirectory;->getFileHeaders()Ljava/util/ArrayList;

    move-result-object v3

    if-nez v3, :cond_2

    .line 729
    :cond_1
    new-instance v3, Lnet/lingala/zip4j/exception/ZipException;

    const-string v4, "invalid zip file"

    invoke-direct {v3, v4}, Lnet/lingala/zip4j/exception/ZipException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 732
    :cond_2
    iget-object v3, p0, Lnet/lingala/zip4j/core/ZipFile;->zipModel:Lnet/lingala/zip4j/model/ZipModel;

    invoke-virtual {v3}, Lnet/lingala/zip4j/model/ZipModel;->getCentralDirectory()Lnet/lingala/zip4j/model/CentralDirectory;

    move-result-object v3

    invoke-virtual {v3}, Lnet/lingala/zip4j/model/CentralDirectory;->getFileHeaders()Ljava/util/ArrayList;

    move-result-object v1

    .line 733
    .local v1, "fileHeaderList":Ljava/util/ArrayList;
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_0
    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v3

    if-lt v2, v3, :cond_3

    .line 743
    :goto_1
    iget-boolean v3, p0, Lnet/lingala/zip4j/core/ZipFile;->isEncrypted:Z

    return v3

    .line 734
    :cond_3
    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lnet/lingala/zip4j/model/FileHeader;

    .line 735
    .local v0, "fileHeader":Lnet/lingala/zip4j/model/FileHeader;
    if-eqz v0, :cond_4

    .line 736
    invoke-virtual {v0}, Lnet/lingala/zip4j/model/FileHeader;->isEncrypted()Z

    move-result v3

    if-eqz v3, :cond_4

    .line 737
    const/4 v3, 0x1

    iput-boolean v3, p0, Lnet/lingala/zip4j/core/ZipFile;->isEncrypted:Z

    goto :goto_1

    .line 733
    :cond_4
    add-int/lit8 v2, v2, 0x1

    goto :goto_0
.end method

.method public isRunInThread()Z
    .locals 1

    .prologue
    .line 1027
    iget-boolean v0, p0, Lnet/lingala/zip4j/core/ZipFile;->runInThread:Z

    return v0
.end method

.method public isSplitArchive()Z
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lnet/lingala/zip4j/exception/ZipException;
        }
    .end annotation

    .prologue
    .line 753
    iget-object v0, p0, Lnet/lingala/zip4j/core/ZipFile;->zipModel:Lnet/lingala/zip4j/model/ZipModel;

    if-nez v0, :cond_0

    .line 754
    invoke-direct {p0}, Lnet/lingala/zip4j/core/ZipFile;->readZipInfo()V

    .line 755
    iget-object v0, p0, Lnet/lingala/zip4j/core/ZipFile;->zipModel:Lnet/lingala/zip4j/model/ZipModel;

    if-nez v0, :cond_0

    .line 756
    new-instance v0, Lnet/lingala/zip4j/exception/ZipException;

    const-string v1, "Zip Model is null"

    invoke-direct {v0, v1}, Lnet/lingala/zip4j/exception/ZipException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 760
    :cond_0
    iget-object v0, p0, Lnet/lingala/zip4j/core/ZipFile;->zipModel:Lnet/lingala/zip4j/model/ZipModel;

    invoke-virtual {v0}, Lnet/lingala/zip4j/model/ZipModel;->isSplitArchive()Z

    move-result v0

    return v0
.end method

.method public isValidZipFile()Z
    .locals 2

    .prologue
    .line 1002
    :try_start_0
    invoke-direct {p0}, Lnet/lingala/zip4j/core/ZipFile;->readZipInfo()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 1003
    const/4 v1, 0x1

    .line 1005
    :goto_0
    return v1

    .line 1004
    :catch_0
    move-exception v0

    .line 1005
    .local v0, "e":Ljava/lang/Exception;
    const/4 v1, 0x0

    goto :goto_0
.end method

.method public mergeSplitFiles(Ljava/io/File;)V
    .locals 4
    .param p1, "outputZipFile"    # Ljava/io/File;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lnet/lingala/zip4j/exception/ZipException;
        }
    .end annotation

    .prologue
    .line 831
    if-nez p1, :cond_0

    .line 832
    new-instance v1, Lnet/lingala/zip4j/exception/ZipException;

    const-string v2, "outputZipFile is null, cannot merge split files"

    invoke-direct {v1, v2}, Lnet/lingala/zip4j/exception/ZipException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 835
    :cond_0
    invoke-virtual {p1}, Ljava/io/File;->exists()Z

    move-result v1

    if-eqz v1, :cond_1

    .line 836
    new-instance v1, Lnet/lingala/zip4j/exception/ZipException;

    const-string v2, "output Zip File already exists"

    invoke-direct {v1, v2}, Lnet/lingala/zip4j/exception/ZipException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 839
    :cond_1
    invoke-direct {p0}, Lnet/lingala/zip4j/core/ZipFile;->checkZipModel()V

    .line 841
    iget-object v1, p0, Lnet/lingala/zip4j/core/ZipFile;->zipModel:Lnet/lingala/zip4j/model/ZipModel;

    if-nez v1, :cond_2

    .line 842
    new-instance v1, Lnet/lingala/zip4j/exception/ZipException;

    const-string v2, "zip model is null, corrupt zip file?"

    invoke-direct {v1, v2}, Lnet/lingala/zip4j/exception/ZipException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 845
    :cond_2
    new-instance v0, Lnet/lingala/zip4j/util/ArchiveMaintainer;

    invoke-direct {v0}, Lnet/lingala/zip4j/util/ArchiveMaintainer;-><init>()V

    .line 846
    .local v0, "archiveMaintainer":Lnet/lingala/zip4j/util/ArchiveMaintainer;
    iget-object v1, p0, Lnet/lingala/zip4j/core/ZipFile;->zipModel:Lnet/lingala/zip4j/model/ZipModel;

    iget-object v2, p0, Lnet/lingala/zip4j/core/ZipFile;->progressMonitor:Lnet/lingala/zip4j/progress/ProgressMonitor;

    invoke-virtual {v0, v1, v2}, Lnet/lingala/zip4j/util/ArchiveMaintainer;->initProgressMonitorForMergeOp(Lnet/lingala/zip4j/model/ZipModel;Lnet/lingala/zip4j/progress/ProgressMonitor;)V

    .line 847
    iget-object v1, p0, Lnet/lingala/zip4j/core/ZipFile;->zipModel:Lnet/lingala/zip4j/model/ZipModel;

    iget-object v2, p0, Lnet/lingala/zip4j/core/ZipFile;->progressMonitor:Lnet/lingala/zip4j/progress/ProgressMonitor;

    iget-boolean v3, p0, Lnet/lingala/zip4j/core/ZipFile;->runInThread:Z

    invoke-virtual {v0, v1, p1, v2, v3}, Lnet/lingala/zip4j/util/ArchiveMaintainer;->mergeSplitZipFiles(Lnet/lingala/zip4j/model/ZipModel;Ljava/io/File;Lnet/lingala/zip4j/progress/ProgressMonitor;Z)V

    .line 848
    return-void
.end method

.method public removeFile(Ljava/lang/String;)V
    .locals 4
    .param p1, "fileName"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lnet/lingala/zip4j/exception/ZipException;
        }
    .end annotation

    .prologue
    .line 775
    invoke-static {p1}, Lnet/lingala/zip4j/util/Zip4jUtil;->isStringNotNullAndNotEmpty(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_0

    .line 776
    new-instance v1, Lnet/lingala/zip4j/exception/ZipException;

    const-string v2, "file name is empty or null, cannot remove file"

    invoke-direct {v1, v2}, Lnet/lingala/zip4j/exception/ZipException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 779
    :cond_0
    iget-object v1, p0, Lnet/lingala/zip4j/core/ZipFile;->zipModel:Lnet/lingala/zip4j/model/ZipModel;

    if-nez v1, :cond_1

    .line 780
    iget-object v1, p0, Lnet/lingala/zip4j/core/ZipFile;->file:Ljava/lang/String;

    invoke-static {v1}, Lnet/lingala/zip4j/util/Zip4jUtil;->checkFileExists(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 781
    invoke-direct {p0}, Lnet/lingala/zip4j/core/ZipFile;->readZipInfo()V

    .line 785
    :cond_1
    iget-object v1, p0, Lnet/lingala/zip4j/core/ZipFile;->zipModel:Lnet/lingala/zip4j/model/ZipModel;

    invoke-virtual {v1}, Lnet/lingala/zip4j/model/ZipModel;->isSplitArchive()Z

    move-result v1

    if-eqz v1, :cond_2

    .line 786
    new-instance v1, Lnet/lingala/zip4j/exception/ZipException;

    const-string v2, "Zip file format does not allow updating split/spanned files"

    invoke-direct {v1, v2}, Lnet/lingala/zip4j/exception/ZipException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 789
    :cond_2
    iget-object v1, p0, Lnet/lingala/zip4j/core/ZipFile;->zipModel:Lnet/lingala/zip4j/model/ZipModel;

    invoke-static {v1, p1}, Lnet/lingala/zip4j/util/Zip4jUtil;->getFileHeader(Lnet/lingala/zip4j/model/ZipModel;Ljava/lang/String;)Lnet/lingala/zip4j/model/FileHeader;

    move-result-object v0

    .line 790
    .local v0, "fileHeader":Lnet/lingala/zip4j/model/FileHeader;
    if-nez v0, :cond_3

    .line 791
    new-instance v1, Lnet/lingala/zip4j/exception/ZipException;

    new-instance v2, Ljava/lang/StringBuffer;

    const-string v3, "could not find file header for file: "

    invoke-direct {v2, v3}, Ljava/lang/StringBuffer;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, p1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Lnet/lingala/zip4j/exception/ZipException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 794
    :cond_3
    invoke-virtual {p0, v0}, Lnet/lingala/zip4j/core/ZipFile;->removeFile(Lnet/lingala/zip4j/model/FileHeader;)V

    .line 795
    return-void
.end method

.method public removeFile(Lnet/lingala/zip4j/model/FileHeader;)V
    .locals 4
    .param p1, "fileHeader"    # Lnet/lingala/zip4j/model/FileHeader;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lnet/lingala/zip4j/exception/ZipException;
        }
    .end annotation

    .prologue
    .line 805
    if-nez p1, :cond_0

    .line 806
    new-instance v1, Lnet/lingala/zip4j/exception/ZipException;

    const-string v2, "file header is null, cannot remove file"

    invoke-direct {v1, v2}, Lnet/lingala/zip4j/exception/ZipException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 809
    :cond_0
    iget-object v1, p0, Lnet/lingala/zip4j/core/ZipFile;->zipModel:Lnet/lingala/zip4j/model/ZipModel;

    if-nez v1, :cond_1

    .line 810
    iget-object v1, p0, Lnet/lingala/zip4j/core/ZipFile;->file:Ljava/lang/String;

    invoke-static {v1}, Lnet/lingala/zip4j/util/Zip4jUtil;->checkFileExists(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 811
    invoke-direct {p0}, Lnet/lingala/zip4j/core/ZipFile;->readZipInfo()V

    .line 815
    :cond_1
    iget-object v1, p0, Lnet/lingala/zip4j/core/ZipFile;->zipModel:Lnet/lingala/zip4j/model/ZipModel;

    invoke-virtual {v1}, Lnet/lingala/zip4j/model/ZipModel;->isSplitArchive()Z

    move-result v1

    if-eqz v1, :cond_2

    .line 816
    new-instance v1, Lnet/lingala/zip4j/exception/ZipException;

    const-string v2, "Zip file format does not allow updating split/spanned files"

    invoke-direct {v1, v2}, Lnet/lingala/zip4j/exception/ZipException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 819
    :cond_2
    new-instance v0, Lnet/lingala/zip4j/util/ArchiveMaintainer;

    invoke-direct {v0}, Lnet/lingala/zip4j/util/ArchiveMaintainer;-><init>()V

    .line 820
    .local v0, "archiveMaintainer":Lnet/lingala/zip4j/util/ArchiveMaintainer;
    iget-object v1, p0, Lnet/lingala/zip4j/core/ZipFile;->zipModel:Lnet/lingala/zip4j/model/ZipModel;

    iget-object v2, p0, Lnet/lingala/zip4j/core/ZipFile;->progressMonitor:Lnet/lingala/zip4j/progress/ProgressMonitor;

    invoke-virtual {v0, v1, p1, v2}, Lnet/lingala/zip4j/util/ArchiveMaintainer;->initProgressMonitorForRemoveOp(Lnet/lingala/zip4j/model/ZipModel;Lnet/lingala/zip4j/model/FileHeader;Lnet/lingala/zip4j/progress/ProgressMonitor;)V

    .line 821
    iget-object v1, p0, Lnet/lingala/zip4j/core/ZipFile;->zipModel:Lnet/lingala/zip4j/model/ZipModel;

    iget-object v2, p0, Lnet/lingala/zip4j/core/ZipFile;->progressMonitor:Lnet/lingala/zip4j/progress/ProgressMonitor;

    iget-boolean v3, p0, Lnet/lingala/zip4j/core/ZipFile;->runInThread:Z

    invoke-virtual {v0, v1, p1, v2, v3}, Lnet/lingala/zip4j/util/ArchiveMaintainer;->removeZipFile(Lnet/lingala/zip4j/model/ZipModel;Lnet/lingala/zip4j/model/FileHeader;Lnet/lingala/zip4j/progress/ProgressMonitor;Z)Ljava/util/HashMap;

    .line 822
    return-void
.end method

.method public setComment(Ljava/lang/String;)V
    .locals 3
    .param p1, "comment"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lnet/lingala/zip4j/exception/ZipException;
        }
    .end annotation

    .prologue
    .line 856
    if-nez p1, :cond_0

    .line 857
    new-instance v1, Lnet/lingala/zip4j/exception/ZipException;

    const-string v2, "input comment is null, cannot update zip file"

    invoke-direct {v1, v2}, Lnet/lingala/zip4j/exception/ZipException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 860
    :cond_0
    iget-object v1, p0, Lnet/lingala/zip4j/core/ZipFile;->file:Ljava/lang/String;

    invoke-static {v1}, Lnet/lingala/zip4j/util/Zip4jUtil;->checkFileExists(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_1

    .line 861
    new-instance v1, Lnet/lingala/zip4j/exception/ZipException;

    const-string v2, "zip file does not exist, cannot set comment for zip file"

    invoke-direct {v1, v2}, Lnet/lingala/zip4j/exception/ZipException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 864
    :cond_1
    invoke-direct {p0}, Lnet/lingala/zip4j/core/ZipFile;->readZipInfo()V

    .line 866
    iget-object v1, p0, Lnet/lingala/zip4j/core/ZipFile;->zipModel:Lnet/lingala/zip4j/model/ZipModel;

    if-nez v1, :cond_2

    .line 867
    new-instance v1, Lnet/lingala/zip4j/exception/ZipException;

    const-string v2, "zipModel is null, cannot update zip file"

    invoke-direct {v1, v2}, Lnet/lingala/zip4j/exception/ZipException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 870
    :cond_2
    iget-object v1, p0, Lnet/lingala/zip4j/core/ZipFile;->zipModel:Lnet/lingala/zip4j/model/ZipModel;

    invoke-virtual {v1}, Lnet/lingala/zip4j/model/ZipModel;->getEndCentralDirRecord()Lnet/lingala/zip4j/model/EndCentralDirRecord;

    move-result-object v1

    if-nez v1, :cond_3

    .line 871
    new-instance v1, Lnet/lingala/zip4j/exception/ZipException;

    const-string v2, "end of central directory is null, cannot set comment"

    invoke-direct {v1, v2}, Lnet/lingala/zip4j/exception/ZipException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 874
    :cond_3
    new-instance v0, Lnet/lingala/zip4j/util/ArchiveMaintainer;

    invoke-direct {v0}, Lnet/lingala/zip4j/util/ArchiveMaintainer;-><init>()V

    .line 875
    .local v0, "archiveMaintainer":Lnet/lingala/zip4j/util/ArchiveMaintainer;
    iget-object v1, p0, Lnet/lingala/zip4j/core/ZipFile;->zipModel:Lnet/lingala/zip4j/model/ZipModel;

    invoke-virtual {v0, v1, p1}, Lnet/lingala/zip4j/util/ArchiveMaintainer;->setComment(Lnet/lingala/zip4j/model/ZipModel;Ljava/lang/String;)V

    .line 876
    return-void
.end method

.method public setFileNameCharset(Ljava/lang/String;)V
    .locals 3
    .param p1, "charsetName"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lnet/lingala/zip4j/exception/ZipException;
        }
    .end annotation

    .prologue
    .line 959
    invoke-static {p1}, Lnet/lingala/zip4j/util/Zip4jUtil;->isStringNotNullAndNotEmpty(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 960
    new-instance v0, Lnet/lingala/zip4j/exception/ZipException;

    const-string v1, "null or empty charset name"

    invoke-direct {v0, v1}, Lnet/lingala/zip4j/exception/ZipException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 963
    :cond_0
    invoke-static {p1}, Lnet/lingala/zip4j/util/Zip4jUtil;->isSupportedCharset(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_1

    .line 964
    new-instance v0, Lnet/lingala/zip4j/exception/ZipException;

    new-instance v1, Ljava/lang/StringBuffer;

    const-string v2, "unsupported charset: "

    invoke-direct {v1, v2}, Ljava/lang/StringBuffer;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Lnet/lingala/zip4j/exception/ZipException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 967
    :cond_1
    iput-object p1, p0, Lnet/lingala/zip4j/core/ZipFile;->fileNameCharset:Ljava/lang/String;

    .line 968
    return-void
.end method

.method public setPassword(Ljava/lang/String;)V
    .locals 1
    .param p1, "password"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lnet/lingala/zip4j/exception/ZipException;
        }
    .end annotation

    .prologue
    .line 649
    invoke-static {p1}, Lnet/lingala/zip4j/util/Zip4jUtil;->isStringNotNullAndNotEmpty(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 650
    new-instance v0, Ljava/lang/NullPointerException;

    invoke-direct {v0}, Ljava/lang/NullPointerException;-><init>()V

    throw v0

    .line 652
    :cond_0
    invoke-virtual {p1}, Ljava/lang/String;->toCharArray()[C

    move-result-object v0

    invoke-virtual {p0, v0}, Lnet/lingala/zip4j/core/ZipFile;->setPassword([C)V

    .line 653
    return-void
.end method

.method public setPassword([C)V
    .locals 3
    .param p1, "password"    # [C
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lnet/lingala/zip4j/exception/ZipException;
        }
    .end annotation

    .prologue
    .line 661
    iget-object v1, p0, Lnet/lingala/zip4j/core/ZipFile;->zipModel:Lnet/lingala/zip4j/model/ZipModel;

    if-nez v1, :cond_0

    .line 662
    invoke-direct {p0}, Lnet/lingala/zip4j/core/ZipFile;->readZipInfo()V

    .line 663
    iget-object v1, p0, Lnet/lingala/zip4j/core/ZipFile;->zipModel:Lnet/lingala/zip4j/model/ZipModel;

    if-nez v1, :cond_0

    .line 664
    new-instance v1, Lnet/lingala/zip4j/exception/ZipException;

    const-string v2, "Zip Model is null"

    invoke-direct {v1, v2}, Lnet/lingala/zip4j/exception/ZipException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 668
    :cond_0
    iget-object v1, p0, Lnet/lingala/zip4j/core/ZipFile;->zipModel:Lnet/lingala/zip4j/model/ZipModel;

    invoke-virtual {v1}, Lnet/lingala/zip4j/model/ZipModel;->getCentralDirectory()Lnet/lingala/zip4j/model/CentralDirectory;

    move-result-object v1

    if-eqz v1, :cond_1

    iget-object v1, p0, Lnet/lingala/zip4j/core/ZipFile;->zipModel:Lnet/lingala/zip4j/model/ZipModel;

    invoke-virtual {v1}, Lnet/lingala/zip4j/model/ZipModel;->getCentralDirectory()Lnet/lingala/zip4j/model/CentralDirectory;

    move-result-object v1

    invoke-virtual {v1}, Lnet/lingala/zip4j/model/CentralDirectory;->getFileHeaders()Ljava/util/ArrayList;

    move-result-object v1

    if-nez v1, :cond_2

    .line 669
    :cond_1
    new-instance v1, Lnet/lingala/zip4j/exception/ZipException;

    const-string v2, "invalid zip file"

    invoke-direct {v1, v2}, Lnet/lingala/zip4j/exception/ZipException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 672
    :cond_2
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    iget-object v1, p0, Lnet/lingala/zip4j/core/ZipFile;->zipModel:Lnet/lingala/zip4j/model/ZipModel;

    invoke-virtual {v1}, Lnet/lingala/zip4j/model/ZipModel;->getCentralDirectory()Lnet/lingala/zip4j/model/CentralDirectory;

    move-result-object v1

    invoke-virtual {v1}, Lnet/lingala/zip4j/model/CentralDirectory;->getFileHeaders()Ljava/util/ArrayList;

    move-result-object v1

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    if-lt v0, v1, :cond_3

    .line 679
    return-void

    .line 673
    :cond_3
    iget-object v1, p0, Lnet/lingala/zip4j/core/ZipFile;->zipModel:Lnet/lingala/zip4j/model/ZipModel;

    invoke-virtual {v1}, Lnet/lingala/zip4j/model/ZipModel;->getCentralDirectory()Lnet/lingala/zip4j/model/CentralDirectory;

    move-result-object v1

    invoke-virtual {v1}, Lnet/lingala/zip4j/model/CentralDirectory;->getFileHeaders()Ljava/util/ArrayList;

    move-result-object v1

    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    if-eqz v1, :cond_4

    .line 674
    iget-object v1, p0, Lnet/lingala/zip4j/core/ZipFile;->zipModel:Lnet/lingala/zip4j/model/ZipModel;

    invoke-virtual {v1}, Lnet/lingala/zip4j/model/ZipModel;->getCentralDirectory()Lnet/lingala/zip4j/model/CentralDirectory;

    move-result-object v1

    invoke-virtual {v1}, Lnet/lingala/zip4j/model/CentralDirectory;->getFileHeaders()Ljava/util/ArrayList;

    move-result-object v1

    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lnet/lingala/zip4j/model/FileHeader;

    invoke-virtual {v1}, Lnet/lingala/zip4j/model/FileHeader;->isEncrypted()Z

    move-result v1

    if-eqz v1, :cond_4

    .line 675
    iget-object v1, p0, Lnet/lingala/zip4j/core/ZipFile;->zipModel:Lnet/lingala/zip4j/model/ZipModel;

    invoke-virtual {v1}, Lnet/lingala/zip4j/model/ZipModel;->getCentralDirectory()Lnet/lingala/zip4j/model/CentralDirectory;

    move-result-object v1

    invoke-virtual {v1}, Lnet/lingala/zip4j/model/CentralDirectory;->getFileHeaders()Ljava/util/ArrayList;

    move-result-object v1

    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lnet/lingala/zip4j/model/FileHeader;

    invoke-virtual {v1, p1}, Lnet/lingala/zip4j/model/FileHeader;->setPassword([C)V

    .line 672
    :cond_4
    add-int/lit8 v0, v0, 0x1

    goto :goto_0
.end method

.method public setRunInThread(Z)V
    .locals 0
    .param p1, "runInThread"    # Z

    .prologue
    .line 1031
    iput-boolean p1, p0, Lnet/lingala/zip4j/core/ZipFile;->runInThread:Z

    .line 1032
    return-void
.end method
