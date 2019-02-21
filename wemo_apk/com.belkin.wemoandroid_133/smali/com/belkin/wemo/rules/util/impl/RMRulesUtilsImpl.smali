.class public Lcom/belkin/wemo/rules/util/impl/RMRulesUtilsImpl;
.super Ljava/lang/Object;
.source "RMRulesUtilsImpl.java"

# interfaces
.implements Lcom/belkin/wemo/rules/util/RMIRulesUtils;


# static fields
.field public static final TAG:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 50
    const-class v0, Lcom/belkin/wemo/rules/util/impl/RMRulesUtilsImpl;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/belkin/wemo/rules/util/impl/RMRulesUtilsImpl;->TAG:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 48
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private isFetchStoreSupportedLocal(Lorg/cybergarage/upnp/Device;)Z
    .locals 5
    .param p1, "upnpDevice"    # Lorg/cybergarage/upnp/Device;

    .prologue
    .line 100
    const/4 v1, 0x0

    .line 101
    .local v1, "isSupported":Z
    const-string v3, "FetchRules"

    invoke-virtual {p1, v3}, Lorg/cybergarage/upnp/Device;->getAction(Ljava/lang/String;)Lorg/cybergarage/upnp/Action;

    move-result-object v0

    .line 102
    .local v0, "fetchAction":Lorg/cybergarage/upnp/Action;
    const-string v3, "StoreRules"

    invoke-virtual {p1, v3}, Lorg/cybergarage/upnp/Device;->getAction(Ljava/lang/String;)Lorg/cybergarage/upnp/Action;

    move-result-object v2

    .line 104
    .local v2, "storeAction":Lorg/cybergarage/upnp/Action;
    if-eqz v0, :cond_0

    if-eqz v2, :cond_0

    .line 105
    sget-object v3, Lcom/belkin/wemo/rules/util/impl/RMRulesUtilsImpl;->TAG:Ljava/lang/String;

    const-string v4, "Fetch & Store Support Verification (Local): WeMo device SUPPORTS fecthRules() and storeRules() API."

    invoke-static {v3, v4}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 106
    const/4 v1, 0x1

    .line 110
    :goto_0
    return v1

    .line 108
    :cond_0
    sget-object v3, Lcom/belkin/wemo/rules/util/impl/RMRulesUtilsImpl;->TAG:Ljava/lang/String;

    const-string v4, "Fetch & Store Support Verification (Local): WeMo device DOES NOT SUPPORT fecthRules() and storeRules() API."

    invoke-static {v3, v4}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0
.end method


# virtual methods
.method public copyRulesDB(Ljava/lang/String;Ljava/lang/String;)V
    .locals 3
    .param p1, "from"    # Ljava/lang/String;
    .param p2, "to"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/FileNotFoundException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 441
    const-string v0, "0"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 442
    invoke-virtual {p0}, Lcom/belkin/wemo/rules/util/impl/RMRulesUtilsImpl;->getDBFilePathWithNameInApp()Ljava/lang/String;

    move-result-object p1

    .line 447
    :cond_0
    :goto_0
    const-string v0, "0"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_3

    .line 448
    invoke-virtual {p0}, Lcom/belkin/wemo/rules/util/impl/RMRulesUtilsImpl;->getDBFilePathWithNameInApp()Ljava/lang/String;

    move-result-object p2

    .line 453
    :cond_1
    :goto_1
    sget-object v0, Lcom/belkin/wemo/rules/util/impl/RMRulesUtilsImpl;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Copy rules DB FROM: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "; TO: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->debugLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 454
    new-instance v0, Ljava/io/FileInputStream;

    new-instance v1, Ljava/io/File;

    invoke-direct {v1, p1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-direct {v0, v1}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V

    new-instance v1, Ljava/io/FileOutputStream;

    new-instance v2, Ljava/io/File;

    invoke-direct {v2, p2}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-direct {v1, v2}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V

    invoke-static {v0, v1}, Lorg/apache/commons/io/IOUtils;->copy(Ljava/io/InputStream;Ljava/io/OutputStream;)I

    .line 455
    return-void

    .line 443
    :cond_2
    const-string v0, "1"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 444
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p0}, Lcom/belkin/wemo/rules/util/impl/RMRulesUtilsImpl;->getRulesDBPath()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "pluginrules2Copy.db"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    goto :goto_0

    .line 449
    :cond_3
    const-string v0, "1"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 450
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p0}, Lcom/belkin/wemo/rules/util/impl/RMRulesUtilsImpl;->getRulesDBPath()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "pluginrules2Copy.db"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    goto :goto_1
.end method

.method public createZipFileInApp(Ljava/lang/String;Ljava/lang/String;)V
    .locals 4
    .param p1, "toZip"    # Ljava/lang/String;
    .param p2, "newZip"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 282
    sget-object v1, Lcom/belkin/wemo/rules/util/impl/RMRulesUtilsImpl;->TAG:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Creating ZIP file. File to ZIP: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "\n ZIP file to create: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 283
    const/4 v1, 0x1

    new-array v0, v1, [Ljava/lang/String;

    const/4 v1, 0x0

    aput-object p1, v0, v1

    .line 284
    .local v0, "filesToBeZipped":[Ljava/lang/String;
    invoke-static {v0, p2}, Lcom/belkin/wemo/utils/RMZipUtility;->zip([Ljava/lang/String;Ljava/lang/String;)V

    .line 285
    return-void
.end method

.method public deleteRulesDBFileInApp()Z
    .locals 5

    .prologue
    .line 154
    const/4 v1, 0x0

    .line 155
    .local v1, "isDeleted":Z
    new-instance v0, Ljava/io/File;

    invoke-virtual {p0}, Lcom/belkin/wemo/rules/util/impl/RMRulesUtilsImpl;->getDBFilePathWithNameInApp()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v0, v2}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 156
    .local v0, "file":Ljava/io/File;
    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 157
    invoke-virtual {v0}, Ljava/io/File;->delete()Z

    move-result v1

    .line 159
    :cond_0
    sget-object v2, Lcom/belkin/wemo/rules/util/impl/RMRulesUtilsImpl;->TAG:Ljava/lang/String;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "RULES.DB file delete status: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "; Location: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {p0}, Lcom/belkin/wemo/rules/util/impl/RMRulesUtilsImpl;->getDBFilePathWithNameInApp()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->debugLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 160
    return v1
.end method

.method public doesRulesDBFileExist()Z
    .locals 2

    .prologue
    .line 144
    new-instance v0, Ljava/io/File;

    invoke-virtual {p0}, Lcom/belkin/wemo/rules/util/impl/RMRulesUtilsImpl;->getDBFilePathWithNameInApp()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 145
    .local v0, "file":Ljava/io/File;
    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 146
    const/4 v1, 0x1

    .line 148
    :goto_0
    return v1

    :cond_0
    const/4 v1, 0x0

    goto :goto_0
.end method

.method public download(Ljava/io/InputStream;Ljava/io/OutputStream;)V
    .locals 0
    .param p1, "is"    # Ljava/io/InputStream;
    .param p2, "outputStream"    # Ljava/io/OutputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 180
    invoke-static {p1, p2}, Lorg/apache/commons/io/IOUtils;->copy(Ljava/io/InputStream;Ljava/io/OutputStream;)I

    .line 181
    invoke-virtual {p1}, Ljava/io/InputStream;->close()V

    .line 182
    invoke-virtual {p2}, Ljava/io/OutputStream;->close()V

    .line 183
    return-void
.end method

.method public downloadFromUrl(Ljava/lang/String;Ljava/lang/String;)V
    .locals 10
    .param p1, "downloadUrl"    # Ljava/lang/String;
    .param p2, "toFilenameWithPath"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Ljava/io/FileNotFoundException;
        }
    .end annotation

    .prologue
    .line 189
    new-instance v6, Ljava/net/URL;

    invoke-direct {v6, p1}, Ljava/net/URL;-><init>(Ljava/lang/String;)V

    .line 190
    .local v6, "url":Ljava/net/URL;
    invoke-virtual {v6}, Ljava/net/URL;->openConnection()Ljava/net/URLConnection;

    move-result-object v5

    .line 191
    .local v5, "ucon":Ljava/net/URLConnection;
    invoke-virtual {v5}, Ljava/net/URLConnection;->getInputStream()Ljava/io/InputStream;

    move-result-object v2

    .line 193
    .local v2, "is":Ljava/io/InputStream;
    sget-object v7, Lcom/belkin/wemo/rules/util/impl/RMRulesUtilsImpl;->TAG:Ljava/lang/String;

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "Downloading file from URL. URL: "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-static {v7, v8}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->debugLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 201
    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    invoke-static {}, Lcom/belkin/wemo/storage/FileStorage;->getStoragePath()Ljava/io/File;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, "/databases/"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, "rulesDBZippedTemp"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    .line 203
    .local v4, "tempZIPDBLocation":Ljava/lang/String;
    new-instance v0, Ljava/io/File;

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    invoke-static {}, Lcom/belkin/wemo/storage/FileStorage;->getStoragePath()Ljava/io/File;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, "/databases/"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-direct {v0, v7}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 204
    .local v0, "f":Ljava/io/File;
    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result v7

    if-nez v7, :cond_0

    .line 205
    invoke-virtual {v0}, Ljava/io/File;->mkdir()Z

    .line 208
    :cond_0
    new-instance v1, Ljava/io/File;

    const-string v7, "rulesDBZippedTemp"

    invoke-direct {v1, v0, v7}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 209
    .local v1, "file":Ljava/io/File;
    new-instance v3, Ljava/io/FileOutputStream;

    invoke-direct {v3, v1}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V

    .line 212
    .local v3, "outputStream":Ljava/io/FileOutputStream;
    invoke-virtual {p0, v2, v3}, Lcom/belkin/wemo/rules/util/impl/RMRulesUtilsImpl;->download(Ljava/io/InputStream;Ljava/io/OutputStream;)V

    .line 217
    invoke-static {v4, p2}, Lcom/belkin/wemo/utils/RMZipUtility;->unzip(Ljava/lang/String;Ljava/lang/String;)V

    .line 218
    return-void
.end method

.method public downloadFromUrl([BLjava/lang/String;)V
    .locals 6
    .param p1, "fileByteArray"    # [B
    .param p2, "toFilenameWithPath"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 165
    sget-object v3, Lcom/belkin/wemo/WeMo;->INSTANCE:Lcom/belkin/wemo/WeMo;

    invoke-virtual {v3}, Lcom/belkin/wemo/WeMo;->getContext()Landroid/content/Context;

    move-result-object v3

    const-string v4, "rulesDBZippedTemp"

    const/4 v5, 0x0

    invoke-virtual {v3, v4, v5}, Landroid/content/Context;->openFileOutput(Ljava/lang/String;I)Ljava/io/FileOutputStream;

    move-result-object v1

    .line 167
    .local v1, "outputStream":Ljava/io/FileOutputStream;
    new-instance v0, Ljava/io/ByteArrayInputStream;

    invoke-direct {v0, p1}, Ljava/io/ByteArrayInputStream;-><init>([B)V

    .line 170
    .local v0, "is":Ljava/io/ByteArrayInputStream;
    invoke-virtual {p0, v0, v1}, Lcom/belkin/wemo/rules/util/impl/RMRulesUtilsImpl;->download(Ljava/io/InputStream;Ljava/io/OutputStream;)V

    .line 173
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v4, Lcom/belkin/wemo/WeMo;->INSTANCE:Lcom/belkin/wemo/WeMo;

    invoke-virtual {v4}, Lcom/belkin/wemo/WeMo;->getContext()Landroid/content/Context;

    move-result-object v4

    invoke-virtual {v4}, Landroid/content/Context;->getFilesDir()Ljava/io/File;

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

    .line 175
    .local v2, "tempZIPDBLocation":Ljava/lang/String;
    invoke-static {v2, p2}, Lcom/belkin/wemo/utils/RMZipUtility;->unzip(Ljava/lang/String;Ljava/lang/String;)V

    .line 176
    return-void
.end method

.method public getCloudRequestManager()Lcom/belkin/wemo/cache/cloud/CloudRequestManager;
    .locals 2

    .prologue
    .line 404
    new-instance v0, Lcom/belkin/wemo/cache/cloud/CloudRequestManager;

    sget-object v1, Lcom/belkin/wemo/WeMo;->INSTANCE:Lcom/belkin/wemo/WeMo;

    invoke-virtual {v1}, Lcom/belkin/wemo/WeMo;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/belkin/wemo/cache/cloud/CloudRequestManager;-><init>(Landroid/content/Context;)V

    return-object v0
.end method

.method public getDBFilePathWithNameInApp()Ljava/lang/String;
    .locals 4

    .prologue
    .line 243
    const-string v0, ""

    .line 248
    .local v0, "file":Ljava/lang/String;
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-static {}, Lcom/belkin/wemo/storage/FileStorage;->getStoragePath()Ljava/io/File;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "/unzipped/"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "pluginrules2.db"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 249
    new-instance v1, Ljava/io/File;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-static {}, Lcom/belkin/wemo/storage/FileStorage;->getStoragePath()Ljava/io/File;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "/unzipped/"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 250
    .local v1, "folder":Ljava/io/File;
    invoke-virtual {v1}, Ljava/io/File;->exists()Z

    move-result v2

    if-nez v2, :cond_0

    .line 251
    invoke-virtual {v1}, Ljava/io/File;->mkdirs()Z

    .line 258
    :cond_0
    return-object v0
.end method

.method public getDeviceInformationByUDNFromMemory(Ljava/lang/String;)Lcom/belkin/wemo/cache/data/DeviceInformation;
    .locals 1
    .param p1, "udn"    # Ljava/lang/String;

    .prologue
    .line 399
    sget-object v0, Lcom/belkin/wemo/WeMo;->INSTANCE:Lcom/belkin/wemo/WeMo;

    invoke-virtual {v0}, Lcom/belkin/wemo/WeMo;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->getInstance(Landroid/content/Context;)Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->getDeviceInformationByUDNFromMemory(Ljava/lang/String;)Lcom/belkin/wemo/cache/data/DeviceInformation;

    move-result-object v0

    return-object v0
.end method

.method public getFileInBase64Encoding(Ljava/lang/String;)Ljava/lang/String;
    .locals 6
    .param p1, "filename"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/belkin/wemo/exception/InvalidArgumentsException;
        }
    .end annotation

    .prologue
    .line 289
    const-string v0, ""

    .line 291
    .local v0, "base64EncodedFile":Ljava/lang/String;
    invoke-static {p1}, Lcom/belkin/wemo/rules/util/UploadFileUtil;->readFile(Ljava/lang/String;)[B

    move-result-object v1

    .line 292
    .local v1, "dbByteArray":[B
    if-eqz v1, :cond_0

    .line 293
    new-instance v3, Ljava/lang/String;

    const/4 v4, 0x0

    invoke-static {v1, v4}, Landroid/util/Base64;->encode([BI)[B

    move-result-object v4

    invoke-direct {v3, v4}, Ljava/lang/String;-><init>([B)V

    invoke-virtual {v3}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v3

    const-string v4, "\n"

    const-string v5, ""

    invoke-virtual {v3, v4, v5}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    const-string v4, "\\n"

    const-string v5, ""

    invoke-virtual {v3, v4, v5}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    const-string v4, "\n\r"

    const-string v5, ""

    invoke-virtual {v3, v4, v5}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 297
    .local v2, "encodedDB":Ljava/lang/String;
    sget-object v3, Lcom/belkin/wemo/rules/util/impl/RMRulesUtilsImpl;->TAG:Ljava/lang/String;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Base 64 encoded file lenght: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 299
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "<![CDATA["

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "]]>"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 303
    return-object v0

    .line 301
    .end local v2    # "encodedDB":Ljava/lang/String;
    :cond_0
    new-instance v3, Lcom/belkin/wemo/exception/InvalidArgumentsException;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Converting file to Base64 encoding: Input fule is NULL at location: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Lcom/belkin/wemo/exception/InvalidArgumentsException;-><init>(Ljava/lang/String;)V

    throw v3
.end method

.method public getFileSizeInByte(Ljava/lang/String;)I
    .locals 5
    .param p1, "fileWithPath"    # Ljava/lang/String;

    .prologue
    .line 418
    new-instance v0, Ljava/io/File;

    invoke-direct {v0, p1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 419
    .local v0, "filenew":Ljava/io/File;
    invoke-virtual {v0}, Ljava/io/File;->length()J

    move-result-wide v2

    invoke-static {v2, v3}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v1

    .line 420
    .local v1, "filesize":I
    sget-object v2, Lcom/belkin/wemo/rules/util/impl/RMRulesUtilsImpl;->TAG:Ljava/lang/String;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "FILE = "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "; SIZE = "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->debugLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 421
    return v1
.end method

.method public getFirmwareVersionRevisionNumber(Ljava/lang/String;)I
    .locals 6
    .param p1, "fwVersionStr"    # Ljava/lang/String;

    .prologue
    const/4 v5, 0x2

    .line 426
    const/4 v1, -0x1

    .line 428
    .local v1, "revisionNumber":I
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v2

    if-nez v2, :cond_0

    .line 429
    sget-object v2, Lcom/belkin/wemo/rules/util/impl/RMRulesUtilsImpl;->TAG:Ljava/lang/String;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "getFirmwareVersionRevisionNumber: FW Version String = "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 430
    const-string v2, "\\."

    invoke-virtual {p1, v2}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v0

    .line 431
    .local v0, "fwArray":[Ljava/lang/String;
    array-length v2, v0

    if-lt v2, v5, :cond_0

    .line 432
    aget-object v2, v0, v5

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v1

    .line 435
    .end local v0    # "fwArray":[Ljava/lang/String;
    :cond_0
    sget-object v2, Lcom/belkin/wemo/rules/util/impl/RMRulesUtilsImpl;->TAG:Ljava/lang/String;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "getFirmwareVersionRevisionNumber. Revision number: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 436
    return v1
.end method

.method public getOnlineDeviceInformationList()Ljava/util/List;
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Lcom/belkin/wemo/cache/data/DeviceInformation;",
            ">;"
        }
    .end annotation

    .prologue
    .line 375
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 377
    .local v2, "list":Ljava/util/List;, "Ljava/util/List<Lcom/belkin/wemo/cache/data/DeviceInformation;>;"
    sget-object v3, Lcom/belkin/wemo/WeMo;->INSTANCE:Lcom/belkin/wemo/WeMo;

    invoke-virtual {v3}, Lcom/belkin/wemo/WeMo;->getContext()Landroid/content/Context;

    move-result-object v3

    invoke-static {v3}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->getInstance(Landroid/content/Context;)Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    move-result-object v3

    invoke-virtual {v3}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->getActiveDeviceInfoList()Ljava/util/ArrayList;

    move-result-object v3

    invoke-virtual {v3}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "i$":Ljava/util/Iterator;
    :cond_0
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/belkin/wemo/cache/data/DeviceInformation;

    .line 380
    .local v0, "devInfo":Lcom/belkin/wemo/cache/data/DeviceInformation;
    invoke-virtual {v0}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getUDN()Ljava/lang/String;

    move-result-object v3

    const-string v4, "uuid"

    invoke-virtual {v3, v4}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 381
    invoke-interface {v2, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 384
    .end local v0    # "devInfo":Lcom/belkin/wemo/cache/data/DeviceInformation;
    :cond_1
    return-object v2
.end method

.method public getRulesDBName()Ljava/lang/String;
    .locals 1

    .prologue
    .line 238
    const-string v0, "pluginrules2.db"

    return-object v0
.end method

.method public getRulesDBPath()Ljava/lang/String;
    .locals 4

    .prologue
    .line 222
    const-string v0, ""

    .line 228
    .local v0, "file":Ljava/lang/String;
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-static {}, Lcom/belkin/wemo/storage/FileStorage;->getStoragePath()Ljava/io/File;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "/unzipped/"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 229
    new-instance v1, Ljava/io/File;

    invoke-direct {v1, v0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 230
    .local v1, "folder":Ljava/io/File;
    invoke-virtual {v1}, Ljava/io/File;->exists()Z

    move-result v2

    if-nez v2, :cond_0

    .line 231
    invoke-virtual {v1}, Ljava/io/File;->mkdirs()Z

    .line 233
    :cond_0
    return-object v0
.end method

.method public getRulesDBPathInDevice(Ljava/lang/String;)Ljava/lang/String;
    .locals 6
    .param p1, "deviceUdn"    # Ljava/lang/String;

    .prologue
    .line 389
    invoke-static {p1}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->getIPForDevice(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 390
    .local v0, "ip":Ljava/lang/String;
    invoke-static {p1}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->getPortForDevice(Ljava/lang/String;)I

    move-result v1

    .line 391
    .local v1, "port":I
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "http://"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, ":"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "/"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "rules.db"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    .line 392
    .local v2, "rulesDBPathInDevice":Ljava/lang/String;
    sget-object v3, Lcom/belkin/wemo/rules/util/impl/RMRulesUtilsImpl;->TAG:Ljava/lang/String;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Device: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, "; Rules DB Path: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->debugLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 394
    return-object v2
.end method

.method public getRulesDBVerion()Ljava/lang/String;
    .locals 4

    .prologue
    .line 274
    invoke-static {}, Lcom/belkin/wemo/utils/RMRulesSharedPreferences;->instance()Lcom/belkin/wemo/utils/RMRulesSharedPreferences;

    move-result-object v1

    const-string v2, "rules_db_version"

    const-string v3, "0"

    invoke-virtual {v1, v2, v3}, Lcom/belkin/wemo/utils/RMRulesSharedPreferences;->getPlainString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 275
    .local v0, "rulesDBVersion":Ljava/lang/String;
    sget-object v1, Lcom/belkin/wemo/rules/util/impl/RMRulesUtilsImpl;->TAG:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "get rules DB version: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->debugLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 277
    return-object v0
.end method

.method public getZippedDBFilePathWithNameInApp()Ljava/lang/String;
    .locals 4

    .prologue
    .line 263
    const-string v1, ""

    .line 264
    .local v1, "file":Ljava/lang/String;
    sget-object v2, Lcom/belkin/wemo/WeMo;->INSTANCE:Lcom/belkin/wemo/WeMo;

    invoke-virtual {v2}, Lcom/belkin/wemo/WeMo;->getContext()Landroid/content/Context;

    move-result-object v0

    .line 265
    .local v0, "context":Landroid/content/Context;
    if-eqz v0, :cond_0

    .line 266
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0}, Landroid/content/Context;->getFilesDir()Ljava/io/File;

    move-result-object v3

    invoke-virtual {v3}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    sget-object v3, Ljava/io/File;->separator:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "rulesDBZip.db"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 267
    const/4 v0, 0x0

    .line 269
    :cond_0
    return-object v1
.end method

.method public isFetchStoreRulesSupportedInDevice(Lcom/belkin/wemo/cache/data/DeviceInformation;)Z
    .locals 2
    .param p1, "device"    # Lcom/belkin/wemo/cache/data/DeviceInformation;

    .prologue
    .line 55
    invoke-static {}, Lcom/belkin/wemo/cache/utils/NetworkMode;->isLocal()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 56
    sget-object v0, Lcom/belkin/wemo/rules/util/impl/RMRulesUtilsImpl;->TAG:Ljava/lang/String;

    const-string v1, "Fetch & Store Support Verification: Type - Local"

    invoke-static {v0, v1}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 57
    invoke-virtual {p0, p1}, Lcom/belkin/wemo/rules/util/impl/RMRulesUtilsImpl;->isFetchStoreRulesSupportedInLocalDev(Lcom/belkin/wemo/cache/data/DeviceInformation;)Z

    move-result v0

    .line 60
    :goto_0
    return v0

    .line 59
    :cond_0
    sget-object v0, Lcom/belkin/wemo/rules/util/impl/RMRulesUtilsImpl;->TAG:Ljava/lang/String;

    const-string v1, "Fetch & Store Support Verification: Type - Remote"

    invoke-static {v0, v1}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 60
    invoke-virtual {p0, p1}, Lcom/belkin/wemo/rules/util/impl/RMRulesUtilsImpl;->isFetchStoreRulesSupportedInRemoteDev(Lcom/belkin/wemo/cache/data/DeviceInformation;)Z

    move-result v0

    goto :goto_0
.end method

.method public isFetchStoreRulesSupportedInLocalDev(Lcom/belkin/wemo/cache/data/DeviceInformation;)Z
    .locals 7
    .param p1, "device"    # Lcom/belkin/wemo/cache/data/DeviceInformation;

    .prologue
    .line 66
    const/4 v2, 0x0

    .line 67
    .local v2, "isSupported":Z
    if-eqz p1, :cond_3

    .line 69
    invoke-virtual {p1}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getType()Ljava/lang/String;

    move-result-object v1

    .line 70
    .local v1, "deviceType":Ljava/lang/String;
    invoke-virtual {p1}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getUDN()Ljava/lang/String;

    move-result-object v0

    .line 71
    .local v0, "UDN":Ljava/lang/String;
    sget-object v4, Lcom/belkin/wemo/rules/util/impl/RMRulesUtilsImpl;->TAG:Ljava/lang/String;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "Fetch & Store Support Verification (Local): Device type: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, ", UDN: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 73
    invoke-virtual {p0, v1}, Lcom/belkin/wemo/rules/util/impl/RMRulesUtilsImpl;->isSmartDevice(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_0

    .line 75
    sget-object v4, Lcom/belkin/wemo/rules/util/impl/RMRulesUtilsImpl;->TAG:Ljava/lang/String;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "Fetch & Store Support Verification (Local): WeMo device with device type: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, " is a SMART DEVICE."

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 95
    .end local v0    # "UDN":Ljava/lang/String;
    .end local v1    # "deviceType":Ljava/lang/String;
    :goto_0
    sget-object v4, Lcom/belkin/wemo/rules/util/impl/RMRulesUtilsImpl;->TAG:Ljava/lang/String;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "Fetch & Store Support Verification (Local): isSupported = "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 96
    return v2

    .line 78
    .restart local v0    # "UDN":Ljava/lang/String;
    .restart local v1    # "deviceType":Ljava/lang/String;
    :cond_0
    invoke-virtual {p1}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getDevice()Lorg/cybergarage/upnp/Device;

    move-result-object v3

    .line 79
    .local v3, "upnpDevice":Lorg/cybergarage/upnp/Device;
    if-eqz v3, :cond_1

    .line 80
    invoke-direct {p0, v3}, Lcom/belkin/wemo/rules/util/impl/RMRulesUtilsImpl;->isFetchStoreSupportedLocal(Lorg/cybergarage/upnp/Device;)Z

    move-result v2

    goto :goto_0

    .line 82
    :cond_1
    sget-object v4, Lcom/belkin/wemo/rules/util/impl/RMRulesUtilsImpl;->TAG:Ljava/lang/String;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "Fetch & Store Support Verification (Local): Control Point Device NOT FOUND for UDN: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, "; Trying via ControlPoint directly."

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 83
    sget-object v4, Lcom/belkin/wemo/WeMo;->INSTANCE:Lcom/belkin/wemo/WeMo;

    invoke-virtual {v4}, Lcom/belkin/wemo/WeMo;->getContext()Landroid/content/Context;

    move-result-object v4

    invoke-static {v4}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->getInstance(Landroid/content/Context;)Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    move-result-object v4

    invoke-virtual {v4}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->getUpnpControl()Lorg/cybergarage/upnp/ControlPoint;

    move-result-object v4

    invoke-virtual {v4, v0}, Lorg/cybergarage/upnp/ControlPoint;->getDevice(Ljava/lang/String;)Lorg/cybergarage/upnp/Device;

    move-result-object v3

    .line 84
    if-eqz v3, :cond_2

    .line 85
    const/4 v4, 0x0

    invoke-virtual {p1, v3, v4}, Lcom/belkin/wemo/cache/data/DeviceInformation;->setDevice(Lorg/cybergarage/upnp/Device;Z)V

    .line 86
    invoke-direct {p0, v3}, Lcom/belkin/wemo/rules/util/impl/RMRulesUtilsImpl;->isFetchStoreSupportedLocal(Lorg/cybergarage/upnp/Device;)Z

    move-result v2

    goto :goto_0

    .line 88
    :cond_2
    sget-object v4, Lcom/belkin/wemo/rules/util/impl/RMRulesUtilsImpl;->TAG:Ljava/lang/String;

    const-string v5, "Fetch & Store Support Verification (Local): Device could not be found even in Control Point. UDN: "

    invoke-static {v4, v5}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    .line 93
    .end local v0    # "UDN":Ljava/lang/String;
    .end local v1    # "deviceType":Ljava/lang/String;
    .end local v3    # "upnpDevice":Lorg/cybergarage/upnp/Device;
    :cond_3
    sget-object v4, Lcom/belkin/wemo/rules/util/impl/RMRulesUtilsImpl;->TAG:Ljava/lang/String;

    const-string v5, "Fetch & Store Support Verification (Local): DeviceInformation Object is NULL: "

    invoke-static {v4, v5}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0
.end method

.method public isFetchStoreRulesSupportedInRemoteDev(Lcom/belkin/wemo/cache/data/DeviceInformation;)Z
    .locals 6
    .param p1, "device"    # Lcom/belkin/wemo/cache/data/DeviceInformation;

    .prologue
    .line 115
    const/4 v1, 0x0

    .line 117
    .local v1, "isSupported":Z
    invoke-virtual {p1}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getFirmwareVersion()Ljava/lang/String;

    move-result-object v0

    .line 118
    .local v0, "fwVersionStr":Ljava/lang/String;
    invoke-virtual {p0, v0}, Lcom/belkin/wemo/rules/util/impl/RMRulesUtilsImpl;->getFirmwareVersionRevisionNumber(Ljava/lang/String;)I

    move-result v2

    .line 119
    .local v2, "revisionNumber":I
    const/16 v3, 0x2215

    if-lt v2, v3, :cond_0

    .line 120
    const/4 v1, 0x1

    .line 123
    :cond_0
    sget-object v3, Lcom/belkin/wemo/rules/util/impl/RMRulesUtilsImpl;->TAG:Ljava/lang/String;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Fetch & Store Support Verification (Remote): isSupported = "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 124
    return v1
.end method

.method public isLongPressRuleSupported(Lcom/belkin/wemo/cache/data/DeviceInformation;)Z
    .locals 2
    .param p1, "deviceInformation"    # Lcom/belkin/wemo/cache/data/DeviceInformation;

    .prologue
    .line 409
    const/4 v0, 0x0

    .line 410
    .local v0, "isSupported":Z
    const-string v1, "longPressRuleDeviceCnt"

    invoke-virtual {p1, v1}, Lcom/belkin/wemo/cache/data/DeviceInformation;->isAttributePresent(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 411
    const/4 v0, 0x1

    .line 413
    :cond_0
    return v0
.end method

.method public isSmartDevice(Ljava/lang/String;)Z
    .locals 2
    .param p1, "deviceType"    # Ljava/lang/String;

    .prologue
    .line 129
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_1

    .line 130
    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    move-result-object v1

    invoke-virtual {p1, v1}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v0

    .line 131
    .local v0, "deviceTypeLC":Ljava/lang/String;
    const-string v1, "heater"

    invoke-virtual {v0, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_0

    const-string v1, "airpurifier"

    invoke-virtual {v0, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_0

    const-string v1, "humidifier"

    invoke-virtual {v0, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_0

    const-string v1, "crockpot"

    invoke-virtual {v0, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_0

    const-string v1, "coffeemaker"

    invoke-virtual {v0, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 136
    :cond_0
    const/4 v1, 0x1

    .line 139
    .end local v0    # "deviceTypeLC":Ljava/lang/String;
    :goto_0
    return v1

    :cond_1
    const/4 v1, 0x0

    goto :goto_0
.end method

.method public readFile(Ljava/lang/String;)[B
    .locals 11
    .param p1, "filePath"    # Ljava/lang/String;

    .prologue
    .line 319
    sget-object v8, Lcom/belkin/wemo/rules/util/impl/RMRulesUtilsImpl;->TAG:Ljava/lang/String;

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "readFile: file path = "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-static {v8, v9}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->debugLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 320
    const/4 v4, 0x0

    .line 322
    .local v4, "fileData":[B
    :try_start_0
    new-instance v5, Ljava/io/File;

    invoke-direct {v5, p1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 323
    .local v5, "fileToRead":Ljava/io/File;
    invoke-virtual {v5}, Ljava/io/File;->exists()Z

    move-result v8

    if-eqz v8, :cond_1

    invoke-virtual {v5}, Ljava/io/File;->canRead()Z

    move-result v8

    if-eqz v8, :cond_1

    .line 324
    new-instance v6, Ljava/io/FileInputStream;

    invoke-direct {v6, v5}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V

    .line 326
    .local v6, "fisFileData":Ljava/io/FileInputStream;
    move-object v7, v6

    .line 327
    .local v7, "is":Ljava/io/InputStream;
    new-instance v1, Ljava/io/BufferedInputStream;

    invoke-direct {v1, v7}, Ljava/io/BufferedInputStream;-><init>(Ljava/io/InputStream;)V

    .line 328
    .local v1, "bis":Ljava/io/BufferedInputStream;
    new-instance v0, Lorg/apache/http/util/ByteArrayBuffer;

    const/16 v8, 0x32

    invoke-direct {v0, v8}, Lorg/apache/http/util/ByteArrayBuffer;-><init>(I)V

    .line 329
    .local v0, "baf":Lorg/apache/http/util/ByteArrayBuffer;
    const/4 v2, 0x0

    .line 330
    .local v2, "current":I
    :goto_0
    invoke-virtual {v1}, Ljava/io/BufferedInputStream;->read()I

    move-result v2

    const/4 v8, -0x1

    if-eq v2, v8, :cond_0

    .line 331
    int-to-byte v8, v2

    invoke-virtual {v0, v8}, Lorg/apache/http/util/ByteArrayBuffer;->append(I)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 338
    .end local v0    # "baf":Lorg/apache/http/util/ByteArrayBuffer;
    .end local v1    # "bis":Ljava/io/BufferedInputStream;
    .end local v2    # "current":I
    .end local v5    # "fileToRead":Ljava/io/File;
    .end local v6    # "fisFileData":Ljava/io/FileInputStream;
    .end local v7    # "is":Ljava/io/InputStream;
    :catch_0
    move-exception v3

    .line 339
    .local v3, "excep":Ljava/lang/Exception;
    sget-object v8, Lcom/belkin/wemo/rules/util/impl/RMRulesUtilsImpl;->TAG:Ljava/lang/String;

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "Exception during readFile(): "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v3}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-static {v8, v9}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 342
    .end local v3    # "excep":Ljava/lang/Exception;
    :goto_1
    return-object v4

    .line 333
    .restart local v0    # "baf":Lorg/apache/http/util/ByteArrayBuffer;
    .restart local v1    # "bis":Ljava/io/BufferedInputStream;
    .restart local v2    # "current":I
    .restart local v5    # "fileToRead":Ljava/io/File;
    .restart local v6    # "fisFileData":Ljava/io/FileInputStream;
    .restart local v7    # "is":Ljava/io/InputStream;
    :cond_0
    :try_start_1
    invoke-virtual {v1}, Ljava/io/BufferedInputStream;->close()V

    .line 334
    invoke-virtual {v0}, Lorg/apache/http/util/ByteArrayBuffer;->toByteArray()[B

    move-result-object v4

    .line 335
    goto :goto_1

    .line 336
    .end local v0    # "baf":Lorg/apache/http/util/ByteArrayBuffer;
    .end local v1    # "bis":Ljava/io/BufferedInputStream;
    .end local v2    # "current":I
    .end local v6    # "fisFileData":Ljava/io/FileInputStream;
    .end local v7    # "is":Ljava/io/InputStream;
    :cond_1
    sget-object v8, Lcom/belkin/wemo/rules/util/impl/RMRulesUtilsImpl;->TAG:Ljava/lang/String;

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "readFile(): File at "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    const-string v10, " either does not exist or is not readable"

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-static {v8, v9}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_1
.end method

.method public setRulesDBVersion(Ljava/lang/String;)V
    .locals 3
    .param p1, "dbVersion"    # Ljava/lang/String;

    .prologue
    .line 308
    sget-object v0, Lcom/belkin/wemo/rules/util/impl/RMRulesUtilsImpl;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Set Rules DB Version to "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->debugLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 309
    invoke-static {}, Lcom/belkin/wemo/utils/RMRulesSharedPreferences;->instance()Lcom/belkin/wemo/utils/RMRulesSharedPreferences;

    move-result-object v0

    const-string v1, "rules_db_version"

    invoke-virtual {v0, v1, p1}, Lcom/belkin/wemo/utils/RMRulesSharedPreferences;->setPlainString(Ljava/lang/String;Ljava/lang/String;)V

    .line 310
    return-void
.end method

.method public writeDBToDevice(Ljava/lang/String;Ljava/lang/String;I)V
    .locals 2
    .param p1, "dbFilePath"    # Ljava/lang/String;
    .param p2, "deviceUrl"    # Ljava/lang/String;
    .param p3, "timeout"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 314
    new-instance v0, Ljava/net/URL;

    invoke-direct {v0, p2}, Ljava/net/URL;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0, p1}, Lcom/belkin/wemo/rules/util/impl/RMRulesUtilsImpl;->readFile(Ljava/lang/String;)[B

    move-result-object v1

    invoke-virtual {p0, v0, v1, p3}, Lcom/belkin/wemo/rules/util/impl/RMRulesUtilsImpl;->writeDataToURL(Ljava/net/URL;[BI)V

    .line 315
    return-void
.end method

.method public writeDataToURL(Ljava/net/URL;[BI)V
    .locals 9
    .param p1, "url"    # Ljava/net/URL;
    .param p2, "dataToUpload"    # [B
    .param p3, "timeout"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 348
    const/4 v5, 0x0

    .line 349
    .local v5, "os":Ljava/io/OutputStream;
    const/4 v0, 0x0

    .line 350
    .local v0, "buf":Ljava/io/BufferedOutputStream;
    invoke-virtual {p1}, Ljava/net/URL;->openConnection()Ljava/net/URLConnection;

    move-result-object v1

    check-cast v1, Ljava/net/HttpURLConnection;

    .line 352
    .local v1, "connection":Ljava/net/HttpURLConnection;
    const-string v6, "POST"

    invoke-virtual {v1, v6}, Ljava/net/HttpURLConnection;->setRequestMethod(Ljava/lang/String;)V

    .line 353
    const/4 v6, 0x0

    invoke-virtual {v1, v6}, Ljava/net/HttpURLConnection;->setChunkedStreamingMode(I)V

    .line 354
    const/4 v6, 0x1

    invoke-virtual {v1, v6}, Ljava/net/HttpURLConnection;->setDoOutput(Z)V

    .line 355
    invoke-virtual {v1, p3}, Ljava/net/HttpURLConnection;->setReadTimeout(I)V

    .line 356
    invoke-virtual {v1}, Ljava/net/HttpURLConnection;->getOutputStream()Ljava/io/OutputStream;

    move-result-object v5

    .line 357
    new-instance v0, Ljava/io/BufferedOutputStream;

    .end local v0    # "buf":Ljava/io/BufferedOutputStream;
    invoke-direct {v0, v5}, Ljava/io/BufferedOutputStream;-><init>(Ljava/io/OutputStream;)V

    .line 358
    .restart local v0    # "buf":Ljava/io/BufferedOutputStream;
    invoke-virtual {v0, p2}, Ljava/io/BufferedOutputStream;->write([B)V

    .line 359
    invoke-virtual {v0}, Ljava/io/BufferedOutputStream;->flush()V

    .line 361
    new-instance v4, Ljava/io/BufferedReader;

    new-instance v6, Ljava/io/InputStreamReader;

    invoke-virtual {v1}, Ljava/net/HttpURLConnection;->getInputStream()Ljava/io/InputStream;

    move-result-object v7

    invoke-direct {v6, v7}, Ljava/io/InputStreamReader;-><init>(Ljava/io/InputStream;)V

    invoke-direct {v4, v6}, Ljava/io/BufferedReader;-><init>(Ljava/io/Reader;)V

    .line 364
    .local v4, "in":Ljava/io/BufferedReader;
    const-string v3, ""

    .line 365
    .local v3, "decodedStringStr":Ljava/lang/String;
    :goto_0
    invoke-virtual {v4}, Ljava/io/BufferedReader;->readLine()Ljava/lang/String;

    move-result-object v2

    .local v2, "decodedString":Ljava/lang/String;
    if-eqz v2, :cond_0

    .line 366
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v6, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, "\n"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    goto :goto_0

    .line 369
    :cond_0
    invoke-virtual {v0}, Ljava/io/BufferedOutputStream;->close()V

    .line 370
    sget-object v6, Lcom/belkin/wemo/rules/util/impl/RMRulesUtilsImpl;->TAG:Ljava/lang/String;

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "writeDataToURL: decoded string = "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v6, v7}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->debugLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 371
    return-void
.end method
