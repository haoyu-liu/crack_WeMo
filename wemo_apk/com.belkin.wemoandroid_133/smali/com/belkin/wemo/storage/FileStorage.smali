.class public Lcom/belkin/wemo/storage/FileStorage;
.super Ljava/lang/Object;
.source "FileStorage.java"


# static fields
.field public static CACHE_FOLDER:Ljava/lang/String;

.field public static FILE_FOLDER:Ljava/lang/String;

.field public static LOGO_FOLDER:Ljava/lang/String;

.field public static PACKET_FOLDER:Ljava/lang/String;

.field private static TAG:Ljava/lang/String;

.field public static TEMP_ICON_FOLDER:Ljava/lang/String;

.field private static mDBStorage:Lcom/belkin/wemo/storage/DBStorage;

.field private static mStorage:Lcom/belkin/wemo/storage/FileStorage;


# instance fields
.field private mContext:Landroid/content/Context;

.field private reload:Z


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 50
    const-class v0, Lcom/belkin/wemo/storage/FileStorage;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/belkin/wemo/storage/FileStorage;->TAG:Ljava/lang/String;

    .line 55
    sput-object v1, Lcom/belkin/wemo/storage/FileStorage;->mStorage:Lcom/belkin/wemo/storage/FileStorage;

    .line 60
    sput-object v1, Lcom/belkin/wemo/storage/FileStorage;->mDBStorage:Lcom/belkin/wemo/storage/DBStorage;

    return-void
.end method

.method private constructor <init>(Landroid/content/Context;)V
    .locals 6
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 70
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 65
    const/4 v4, 0x0

    iput-boolean v4, p0, Lcom/belkin/wemo/storage/FileStorage;->reload:Z

    .line 71
    iput-object p1, p0, Lcom/belkin/wemo/storage/FileStorage;->mContext:Landroid/content/Context;

    .line 72
    const-string v1, ""

    .line 73
    .local v1, "folder":Ljava/lang/String;
    const-string v3, ""

    .line 74
    .local v3, "temp_icon_folder":Ljava/lang/String;
    invoke-virtual {p1}, Landroid/content/Context;->getFilesDir()Ljava/io/File;

    move-result-object v4

    invoke-virtual {v4}, Ljava/io/File;->toString()Ljava/lang/String;

    move-result-object v2

    .line 75
    .local v2, "logoFolder":Ljava/lang/String;
    invoke-static {}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->isDebug()Z

    move-result v4

    if-eqz v4, :cond_1

    .line 77
    const-string v4, "Wemo"

    invoke-virtual {p1, v4}, Landroid/content/Context;->getExternalFilesDir(Ljava/lang/String;)Ljava/io/File;

    move-result-object v4

    invoke-virtual {v4}, Ljava/io/File;->toString()Ljava/lang/String;

    move-result-object v1

    .line 83
    :goto_0
    invoke-static {}, Landroid/os/Environment;->getExternalStorageState()Ljava/lang/String;

    move-result-object v4

    const-string v5, "mounted"

    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_0

    .line 85
    const/4 v4, 0x0

    invoke-virtual {p1, v4}, Landroid/content/Context;->getExternalFilesDir(Ljava/lang/String;)Ljava/io/File;

    move-result-object v4

    invoke-virtual {v4}, Ljava/io/File;->toString()Ljava/lang/String;

    move-result-object v3

    .line 87
    :cond_0
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, "/files/"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    sput-object v4, Lcom/belkin/wemo/storage/FileStorage;->FILE_FOLDER:Ljava/lang/String;

    .line 88
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, "/packets/"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    sput-object v4, Lcom/belkin/wemo/storage/FileStorage;->PACKET_FOLDER:Ljava/lang/String;

    .line 90
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, "/logo/"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    sput-object v4, Lcom/belkin/wemo/storage/FileStorage;->LOGO_FOLDER:Ljava/lang/String;

    .line 91
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, "/cache/"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    sput-object v4, Lcom/belkin/wemo/storage/FileStorage;->CACHE_FOLDER:Ljava/lang/String;

    .line 92
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, "/temp_icon/"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    sput-object v4, Lcom/belkin/wemo/storage/FileStorage;->TEMP_ICON_FOLDER:Ljava/lang/String;

    .line 94
    new-instance v0, Ljava/io/File;

    sget-object v4, Lcom/belkin/wemo/storage/FileStorage;->FILE_FOLDER:Ljava/lang/String;

    invoke-direct {v0, v4}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 95
    .local v0, "file":Ljava/io/File;
    invoke-virtual {v0}, Ljava/io/File;->mkdirs()Z

    .line 96
    new-instance v0, Ljava/io/File;

    .end local v0    # "file":Ljava/io/File;
    sget-object v4, Lcom/belkin/wemo/storage/FileStorage;->PACKET_FOLDER:Ljava/lang/String;

    invoke-direct {v0, v4}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 97
    .restart local v0    # "file":Ljava/io/File;
    invoke-virtual {v0}, Ljava/io/File;->mkdirs()Z

    .line 98
    new-instance v0, Ljava/io/File;

    .end local v0    # "file":Ljava/io/File;
    sget-object v4, Lcom/belkin/wemo/storage/FileStorage;->LOGO_FOLDER:Ljava/lang/String;

    invoke-direct {v0, v4}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 99
    .restart local v0    # "file":Ljava/io/File;
    invoke-virtual {v0}, Ljava/io/File;->mkdirs()Z

    .line 100
    new-instance v0, Ljava/io/File;

    .end local v0    # "file":Ljava/io/File;
    sget-object v4, Lcom/belkin/wemo/storage/FileStorage;->CACHE_FOLDER:Ljava/lang/String;

    invoke-direct {v0, v4}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 101
    .restart local v0    # "file":Ljava/io/File;
    invoke-virtual {v0}, Ljava/io/File;->mkdirs()Z

    .line 102
    new-instance v0, Ljava/io/File;

    .end local v0    # "file":Ljava/io/File;
    sget-object v4, Lcom/belkin/wemo/storage/FileStorage;->TEMP_ICON_FOLDER:Ljava/lang/String;

    invoke-direct {v0, v4}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 103
    .restart local v0    # "file":Ljava/io/File;
    invoke-virtual {v0}, Ljava/io/File;->mkdirs()Z

    .line 104
    return-void

    .line 81
    .end local v0    # "file":Ljava/io/File;
    :cond_1
    invoke-virtual {p1}, Landroid/content/Context;->getFilesDir()Ljava/io/File;

    move-result-object v4

    invoke-virtual {v4}, Ljava/io/File;->toString()Ljava/lang/String;

    move-result-object v1

    goto/16 :goto_0
.end method

.method private clear(Ljava/io/File;)V
    .locals 5
    .param p1, "file"    # Ljava/io/File;

    .prologue
    .line 609
    invoke-virtual {p1}, Ljava/io/File;->isDirectory()Z

    move-result v4

    if-eqz v4, :cond_0

    .line 610
    invoke-virtual {p1}, Ljava/io/File;->listFiles()[Ljava/io/File;

    move-result-object v0

    .local v0, "arr$":[Ljava/io/File;
    array-length v3, v0

    .local v3, "len$":I
    const/4 v2, 0x0

    .local v2, "i$":I
    :goto_0
    if-ge v2, v3, :cond_0

    aget-object v1, v0, v2

    .line 611
    .local v1, "child":Ljava/io/File;
    invoke-direct {p0, v1}, Lcom/belkin/wemo/storage/FileStorage;->clear(Ljava/io/File;)V

    .line 610
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 614
    .end local v0    # "arr$":[Ljava/io/File;
    .end local v1    # "child":Ljava/io/File;
    .end local v2    # "i$":I
    .end local v3    # "len$":I
    :cond_0
    invoke-virtual {p1}, Ljava/io/File;->delete()Z

    .line 615
    return-void
.end method

.method private deleteIcon(Ljava/lang/String;)V
    .locals 9
    .param p1, "mac"    # Ljava/lang/String;

    .prologue
    .line 561
    sget-object v6, Lcom/belkin/wemo/storage/FileStorage;->TAG:Ljava/lang/String;

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "Deleting Icon for MAC: "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v6, v7}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->debugLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 562
    new-instance v4, Ljava/io/File;

    sget-object v6, Lcom/belkin/wemo/storage/FileStorage;->LOGO_FOLDER:Ljava/lang/String;

    invoke-direct {v4, v6}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 563
    .local v4, "iconsDir":Ljava/io/File;
    invoke-virtual {v4}, Ljava/io/File;->listFiles()[Ljava/io/File;

    move-result-object v3

    .line 565
    .local v3, "iconsArray":[Ljava/io/File;
    if-eqz v3, :cond_1

    .line 566
    move-object v0, v3

    .local v0, "arr$":[Ljava/io/File;
    array-length v5, v0

    .local v5, "len$":I
    const/4 v1, 0x0

    .local v1, "i$":I
    :goto_0
    if-ge v1, v5, :cond_1

    aget-object v2, v0, v1

    .line 567
    .local v2, "icon":Ljava/io/File;
    invoke-virtual {v2}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v6, p1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v6

    if-eqz v6, :cond_0

    .line 568
    invoke-virtual {v2}, Ljava/io/File;->delete()Z

    .line 566
    :cond_0
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 572
    .end local v0    # "arr$":[Ljava/io/File;
    .end local v1    # "i$":I
    .end local v2    # "icon":Ljava/io/File;
    .end local v5    # "len$":I
    :cond_1
    return-void
.end method

.method public static doesCustomIconExistAtLocation(Ljava/lang/String;)Z
    .locals 3
    .param p0, "iconLocation"    # Ljava/lang/String;

    .prologue
    .line 215
    const/4 v0, 0x0

    .line 217
    .local v0, "doesExist":Z
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v2

    if-nez v2, :cond_0

    .line 218
    new-instance v1, Ljava/io/File;

    invoke-direct {v1, p0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 219
    .local v1, "file":Ljava/io/File;
    invoke-virtual {v1}, Ljava/io/File;->exists()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 220
    const/4 v0, 0x1

    .line 223
    .end local v1    # "file":Ljava/io/File;
    :cond_0
    return v0
.end method

.method public static declared-synchronized getInstance(Landroid/content/Context;)Lcom/belkin/wemo/storage/FileStorage;
    .locals 2
    .param p0, "context"    # Landroid/content/Context;

    .prologue
    .line 120
    const-class v1, Lcom/belkin/wemo/storage/FileStorage;

    monitor-enter v1

    if-eqz p0, :cond_0

    .line 121
    :try_start_0
    invoke-static {p0}, Lcom/belkin/wemo/storage/DBStorage;->getInstance(Landroid/content/Context;)Lcom/belkin/wemo/storage/DBStorage;

    move-result-object v0

    sput-object v0, Lcom/belkin/wemo/storage/FileStorage;->mDBStorage:Lcom/belkin/wemo/storage/DBStorage;

    .line 123
    :cond_0
    sget-object v0, Lcom/belkin/wemo/storage/FileStorage;->mStorage:Lcom/belkin/wemo/storage/FileStorage;

    if-nez v0, :cond_1

    .line 124
    new-instance v0, Lcom/belkin/wemo/storage/FileStorage;

    invoke-direct {v0, p0}, Lcom/belkin/wemo/storage/FileStorage;-><init>(Landroid/content/Context;)V

    sput-object v0, Lcom/belkin/wemo/storage/FileStorage;->mStorage:Lcom/belkin/wemo/storage/FileStorage;

    .line 127
    :cond_1
    sget-object v0, Lcom/belkin/wemo/storage/FileStorage;->mStorage:Lcom/belkin/wemo/storage/FileStorage;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit v1

    return-object v0

    .line 120
    :catchall_0
    move-exception v0

    monitor-exit v1

    throw v0
.end method

.method private getMaxIconVersion(Ljava/io/File;Ljava/lang/String;)I
    .locals 10
    .param p1, "file"    # Ljava/io/File;
    .param p2, "serialNo"    # Ljava/lang/String;

    .prologue
    .line 617
    const/4 v5, 0x0

    .line 619
    .local v5, "max":I
    invoke-virtual {p1}, Ljava/io/File;->listFiles()[Ljava/io/File;

    move-result-object v0

    .local v0, "arr$":[Ljava/io/File;
    array-length v4, v0

    .local v4, "len$":I
    const/4 v3, 0x0

    .local v3, "i$":I
    :goto_0
    if-ge v3, v4, :cond_1

    aget-object v1, v0, v3

    .line 621
    .local v1, "child":Ljava/io/File;
    invoke-virtual {v1}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v2

    .local v2, "fileName":Ljava/lang/String;
    invoke-virtual {v2, p2}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v8

    const/4 v9, -0x1

    if-eq v8, v9, :cond_0

    .line 624
    const/4 v8, 0x0

    :try_start_0
    const-string v9, " "

    invoke-virtual {v2, v9}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v9

    invoke-virtual {v2, v8, v9}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v6

    .line 625
    .local v6, "maxStr":Ljava/lang/String;
    if-eqz v6, :cond_0

    .line 627
    invoke-virtual {v6}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v8

    invoke-static {v8}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result v7

    .line 628
    .local v7, "tempMax":I
    if-le v7, v5, :cond_0

    .line 629
    move v5, v7

    .line 619
    .end local v6    # "maxStr":Ljava/lang/String;
    .end local v7    # "tempMax":I
    :cond_0
    :goto_1
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 635
    .end local v1    # "child":Ljava/io/File;
    .end local v2    # "fileName":Ljava/lang/String;
    :cond_1
    return v5

    .line 631
    .restart local v1    # "child":Ljava/io/File;
    .restart local v2    # "fileName":Ljava/lang/String;
    :catch_0
    move-exception v8

    goto :goto_1
.end method

.method public static getStoragePath()Ljava/io/File;
    .locals 3

    .prologue
    .line 156
    const/4 v1, 0x0

    .line 158
    .local v1, "file":Ljava/io/File;
    sget-object v2, Lcom/belkin/wemo/WeMo;->INSTANCE:Lcom/belkin/wemo/WeMo;

    invoke-virtual {v2}, Lcom/belkin/wemo/WeMo;->getContext()Landroid/content/Context;

    move-result-object v0

    .line 159
    .local v0, "context":Landroid/content/Context;
    invoke-static {}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->isDebug()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 161
    const-string v2, "Wemo"

    invoke-virtual {v0, v2}, Landroid/content/Context;->getExternalFilesDir(Ljava/lang/String;)Ljava/io/File;

    move-result-object v1

    .line 165
    :goto_0
    return-object v1

    .line 163
    :cond_0
    invoke-virtual {v0}, Landroid/content/Context;->getFilesDir()Ljava/io/File;

    move-result-object v1

    goto :goto_0
.end method

.method private saveFile(Ljava/lang/String;Ljava/lang/String;Ljava/net/URL;)Ljava/io/File;
    .locals 12
    .param p1, "folder"    # Ljava/lang/String;
    .param p2, "fileName"    # Ljava/lang/String;
    .param p3, "url"    # Ljava/net/URL;
    .annotation build Landroid/annotation/TargetApi;
        value = 0x15
    .end annotation

    .prologue
    .line 518
    const/4 v5, 0x0

    .line 520
    .local v5, "file":Ljava/io/File;
    :try_start_0
    new-instance v6, Ljava/io/File;

    invoke-direct {v6, p1, p2}, Ljava/io/File;-><init>(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_1

    .line 521
    .end local v5    # "file":Ljava/io/File;
    .local v6, "file":Ljava/io/File;
    :try_start_1
    sget-object v10, Lcom/belkin/wemo/storage/FileStorage;->TAG:Ljava/lang/String;

    const-string v11, "save method"

    invoke-static {v10, v11}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->debugLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 523
    invoke-virtual {p3}, Ljava/net/URL;->openConnection()Ljava/net/URLConnection;

    move-result-object v2

    .line 524
    .local v2, "connection":Ljava/net/URLConnection;
    invoke-virtual {p3}, Ljava/net/URL;->getHost()Ljava/lang/String;

    move-result-object v10

    if-eqz v10, :cond_0

    instance-of v10, v2, Ljava/net/HttpURLConnection;

    if-eqz v10, :cond_0

    .line 525
    move-object v0, v2

    check-cast v0, Ljava/net/HttpURLConnection;

    move-object v10, v0

    const-string v11, "GET"

    invoke-virtual {v10, v11}, Ljava/net/HttpURLConnection;->setRequestMethod(Ljava/lang/String;)V

    .line 526
    const-string v10, "Content-Length"

    const-string v11, "0"

    invoke-virtual {v2, v10, v11}, Ljava/net/URLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 527
    const-string v10, "HOST"

    invoke-virtual {p3}, Ljava/net/URL;->getHost()Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v2, v10, v11}, Ljava/net/URLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 529
    :cond_0
    sget-object v10, Lcom/belkin/wemo/storage/FileStorage;->TAG:Ljava/lang/String;

    const-string v11, "save method2"

    invoke-static {v10, v11}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->debugLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 530
    const/16 v10, 0x400

    new-array v1, v10, [B

    .line 532
    .local v1, "buffer":[B
    const/4 v7, 0x0

    .line 533
    .local v7, "inputStream":Ljava/io/InputStream;
    invoke-virtual {p3}, Ljava/net/URL;->toString()Ljava/lang/String;

    move-result-object v10

    const-string v11, "file:///android_asset/"

    invoke-virtual {v10, v11}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v10

    if-eqz v10, :cond_1

    .line 534
    invoke-virtual {p3}, Ljava/net/URL;->getPath()Ljava/lang/String;

    move-result-object v10

    const/16 v11, 0xf

    invoke-virtual {v10, v11}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v9

    .line 535
    .local v9, "relativePath":Ljava/lang/String;
    iget-object v10, p0, Lcom/belkin/wemo/storage/FileStorage;->mContext:Landroid/content/Context;

    invoke-virtual {v10}, Landroid/content/Context;->getAssets()Landroid/content/res/AssetManager;

    move-result-object v10

    invoke-virtual {v10, v9}, Landroid/content/res/AssetManager;->open(Ljava/lang/String;)Ljava/io/InputStream;

    move-result-object v7

    .line 539
    .end local v9    # "relativePath":Ljava/lang/String;
    :goto_0
    sget-object v10, Lcom/belkin/wemo/storage/FileStorage;->TAG:Ljava/lang/String;

    const-string v11, "save method3"

    invoke-static {v10, v11}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->debugLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 540
    if-eqz v7, :cond_3

    .line 542
    new-instance v8, Ljava/io/FileOutputStream;

    invoke-direct {v8, v6}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V

    .line 544
    .local v8, "outputStream":Ljava/io/FileOutputStream;
    :goto_1
    invoke-virtual {v7, v1}, Ljava/io/InputStream;->read([B)I

    move-result v3

    .local v3, "count":I
    const/4 v10, -0x1

    if-eq v3, v10, :cond_2

    .line 545
    const/4 v10, 0x0

    invoke-virtual {v8, v1, v10, v3}, Ljava/io/FileOutputStream;->write([BII)V
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_1

    .line 553
    .end local v1    # "buffer":[B
    .end local v2    # "connection":Ljava/net/URLConnection;
    .end local v3    # "count":I
    .end local v7    # "inputStream":Ljava/io/InputStream;
    .end local v8    # "outputStream":Ljava/io/FileOutputStream;
    :catch_0
    move-exception v4

    move-object v5, v6

    .line 554
    .end local v6    # "file":Ljava/io/File;
    .local v4, "e":Ljava/io/IOException;
    .restart local v5    # "file":Ljava/io/File;
    :goto_2
    sget-object v10, Lcom/belkin/wemo/storage/FileStorage;->TAG:Ljava/lang/String;

    const-string v11, "Download file error "

    invoke-static {v10, v11, v4}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Exception;)V

    .line 557
    .end local v4    # "e":Ljava/io/IOException;
    :goto_3
    return-object v5

    .line 538
    .end local v5    # "file":Ljava/io/File;
    .restart local v1    # "buffer":[B
    .restart local v2    # "connection":Ljava/net/URLConnection;
    .restart local v6    # "file":Ljava/io/File;
    .restart local v7    # "inputStream":Ljava/io/InputStream;
    :cond_1
    :try_start_2
    invoke-virtual {v2}, Ljava/net/URLConnection;->getInputStream()Ljava/io/InputStream;

    move-result-object v7

    goto :goto_0

    .line 548
    .restart local v3    # "count":I
    .restart local v8    # "outputStream":Ljava/io/FileOutputStream;
    :cond_2
    invoke-virtual {v7}, Ljava/io/InputStream;->close()V

    .line 549
    invoke-virtual {v8}, Ljava/io/FileOutputStream;->close()V

    .line 551
    .end local v3    # "count":I
    .end local v8    # "outputStream":Ljava/io/FileOutputStream;
    :cond_3
    instance-of v10, v2, Ljava/net/HttpURLConnection;

    if-eqz v10, :cond_4

    check-cast v2, Ljava/net/HttpURLConnection;

    .end local v2    # "connection":Ljava/net/URLConnection;
    invoke-virtual {v2}, Ljava/net/HttpURLConnection;->disconnect()V
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_0

    :cond_4
    move-object v5, v6

    .line 555
    .end local v6    # "file":Ljava/io/File;
    .restart local v5    # "file":Ljava/io/File;
    goto :goto_3

    .line 553
    .end local v1    # "buffer":[B
    .end local v7    # "inputStream":Ljava/io/InputStream;
    :catch_1
    move-exception v4

    goto :goto_2
.end method

.method private saveIconInMemory(Ljava/lang/String;Ljava/lang/String;Ljava/io/InputStream;)Ljava/io/File;
    .locals 7
    .param p1, "folder"    # Ljava/lang/String;
    .param p2, "fileName"    # Ljava/lang/String;
    .param p3, "inputStream"    # Ljava/io/InputStream;

    .prologue
    .line 380
    :try_start_0
    new-instance v2, Ljava/io/File;

    invoke-direct {v2, p1, p2}, Ljava/io/File;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 381
    .local v2, "file":Ljava/io/File;
    new-instance v4, Ljava/io/FileOutputStream;

    invoke-direct {v4, v2}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V

    .line 382
    .local v4, "outputStream":Ljava/io/OutputStream;
    const/16 v5, 0x400

    new-array v0, v5, [B

    .line 383
    .local v0, "buffer":[B
    const/4 v3, 0x0

    .line 385
    .local v3, "length":I
    :goto_0
    invoke-virtual {p3, v0}, Ljava/io/InputStream;->read([B)I

    move-result v3

    if-lez v3, :cond_0

    .line 386
    const/4 v5, 0x0

    invoke-virtual {v4, v0, v5, v3}, Ljava/io/OutputStream;->write([BII)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 392
    .end local v0    # "buffer":[B
    .end local v2    # "file":Ljava/io/File;
    .end local v3    # "length":I
    .end local v4    # "outputStream":Ljava/io/OutputStream;
    :catch_0
    move-exception v1

    .line 393
    .local v1, "e":Ljava/lang/Exception;
    sget-object v5, Lcom/belkin/wemo/storage/FileStorage;->TAG:Ljava/lang/String;

    const-string v6, "Exception: createFileFromInputStream--> "

    invoke-static {v5, v6, v1}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Exception;)V

    .line 396
    const/4 v2, 0x0

    .end local v1    # "e":Ljava/lang/Exception;
    :goto_1
    return-object v2

    .line 389
    .restart local v0    # "buffer":[B
    .restart local v2    # "file":Ljava/io/File;
    .restart local v3    # "length":I
    .restart local v4    # "outputStream":Ljava/io/OutputStream;
    :cond_0
    :try_start_1
    invoke-virtual {v4}, Ljava/io/OutputStream;->close()V

    .line 390
    invoke-virtual {p3}, Ljava/io/InputStream;->close()V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_1
.end method


# virtual methods
.method public clear(Ljava/lang/String;)V
    .locals 2
    .param p1, "fileName"    # Ljava/lang/String;

    .prologue
    .line 602
    new-instance v0, Ljava/io/File;

    invoke-direct {v0, p1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 603
    .local v0, "file":Ljava/io/File;
    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 604
    invoke-direct {p0, v0}, Lcom/belkin/wemo/storage/FileStorage;->clear(Ljava/io/File;)V

    .line 606
    :cond_0
    return-void
.end method

.method public clearAll()V
    .locals 2

    .prologue
    .line 593
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-static {}, Lcom/belkin/wemo/storage/FileStorage;->getStoragePath()Ljava/io/File;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "/Android/data/com.belkin.wemo.storage/"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/belkin/wemo/storage/FileStorage;->clear(Ljava/lang/String;)V

    .line 594
    return-void
.end method

.method public emptyTempIconFolder()V
    .locals 9

    .prologue
    .line 310
    sget-object v6, Lcom/belkin/wemo/storage/FileStorage;->TAG:Ljava/lang/String;

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "Deleting all files inside "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    sget-object v8, Lcom/belkin/wemo/storage/FileStorage;->TEMP_ICON_FOLDER:Ljava/lang/String;

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v6, v7}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->debugLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 311
    new-instance v4, Ljava/io/File;

    sget-object v6, Lcom/belkin/wemo/storage/FileStorage;->TEMP_ICON_FOLDER:Ljava/lang/String;

    invoke-direct {v4, v6}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 312
    .local v4, "iconsDir":Ljava/io/File;
    invoke-virtual {v4}, Ljava/io/File;->listFiles()[Ljava/io/File;

    move-result-object v3

    .line 313
    .local v3, "iconsArray":[Ljava/io/File;
    move-object v0, v3

    .local v0, "arr$":[Ljava/io/File;
    array-length v5, v0

    .local v5, "len$":I
    const/4 v1, 0x0

    .local v1, "i$":I
    :goto_0
    if-ge v1, v5, :cond_0

    aget-object v2, v0, v1

    .line 314
    .local v2, "icon":Ljava/io/File;
    invoke-virtual {v2}, Ljava/io/File;->delete()Z

    .line 313
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 316
    .end local v2    # "icon":Ljava/io/File;
    :cond_0
    return-void
.end method

.method public getDefaultIconFileUrl(Ljava/lang/String;)Ljava/lang/String;
    .locals 5
    .param p1, "serialNumber"    # Ljava/lang/String;

    .prologue
    .line 196
    new-instance v3, Ljava/io/File;

    sget-object v4, Lcom/belkin/wemo/storage/FileStorage;->LOGO_FOLDER:Ljava/lang/String;

    invoke-direct {v3, v4}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-direct {p0, v3, p1}, Lcom/belkin/wemo/storage/FileStorage;->getMaxIconVersion(Ljava/io/File;Ljava/lang/String;)I

    move-result v2

    .line 197
    .local v2, "maxVersion":I
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, " "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, " icon.jpg"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 198
    .local v1, "fileName":Ljava/lang/String;
    new-instance v0, Ljava/io/File;

    sget-object v3, Lcom/belkin/wemo/storage/FileStorage;->LOGO_FOLDER:Ljava/lang/String;

    invoke-direct {v0, v3, v1}, Ljava/io/File;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 199
    .local v0, "file":Ljava/io/File;
    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result v3

    if-nez v3, :cond_0

    .line 200
    const-string v3, ""

    .line 202
    :goto_0
    return-object v3

    :cond_0
    invoke-virtual {v0}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v3

    goto :goto_0
.end method

.method public getDescriptionFile(Ljava/net/URL;Ljava/lang/String;)Ljava/io/File;
    .locals 6
    .param p1, "url"    # Ljava/net/URL;
    .param p2, "version"    # Ljava/lang/String;

    .prologue
    .line 139
    sget-object v3, Lcom/belkin/wemo/storage/FileStorage;->TAG:Ljava/lang/String;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "getDescriptionFile "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {p1}, Ljava/net/URL;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, " "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {p2}, Ljava/lang/String;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->debugLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 140
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v3, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, " "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {p1}, Ljava/net/URL;->getPath()Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v4

    invoke-virtual {v4}, Landroid/net/Uri;->getLastPathSegment()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 141
    .local v1, "fileName":Ljava/lang/String;
    new-instance v0, Ljava/io/File;

    sget-object v3, Lcom/belkin/wemo/storage/FileStorage;->FILE_FOLDER:Ljava/lang/String;

    invoke-direct {v0, v3, v1}, Ljava/io/File;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 142
    .local v0, "file":Ljava/io/File;
    new-instance v2, Lcom/belkin/wemo/cache/utils/SDKNetworkUtils;

    iget-object v3, p0, Lcom/belkin/wemo/storage/FileStorage;->mContext:Landroid/content/Context;

    invoke-direct {v2, v3}, Lcom/belkin/wemo/cache/utils/SDKNetworkUtils;-><init>(Landroid/content/Context;)V

    .line 143
    .local v2, "mNetworkUtils":Lcom/belkin/wemo/cache/utils/SDKNetworkUtils;
    sget-object v3, Lcom/belkin/wemo/storage/FileStorage;->TAG:Ljava/lang/String;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "getDescriptionFile file: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v0}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, " reload: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget-boolean v5, p0, Lcom/belkin/wemo/storage/FileStorage;->reload:Z

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, " :: filename::"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 144
    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result v3

    if-eqz v3, :cond_0

    const-string v3, ""

    invoke-virtual {p2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_0

    iget-boolean v3, p0, Lcom/belkin/wemo/storage/FileStorage;->reload:Z

    if-nez v3, :cond_0

    invoke-virtual {v2}, Lcom/belkin/wemo/cache/utils/SDKNetworkUtils;->isPluginConnected()Z

    move-result v3

    if-eqz v3, :cond_1

    .line 145
    :cond_0
    const-string v3, "FileStorage"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "getDescriptionFile fileName: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, " reload: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget-boolean v5, p0, Lcom/belkin/wemo/storage/FileStorage;->reload:Z

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->verboseLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 146
    sget-object v3, Lcom/belkin/wemo/storage/FileStorage;->FILE_FOLDER:Ljava/lang/String;

    invoke-direct {p0, v3, v1, p1}, Lcom/belkin/wemo/storage/FileStorage;->saveFile(Ljava/lang/String;Ljava/lang/String;Ljava/net/URL;)Ljava/io/File;

    move-result-object v0

    .line 149
    :cond_1
    sget-object v3, Lcom/belkin/wemo/storage/FileStorage;->mDBStorage:Lcom/belkin/wemo/storage/DBStorage;

    if-eqz v3, :cond_2

    .line 150
    sget-object v3, Lcom/belkin/wemo/storage/FileStorage;->mDBStorage:Lcom/belkin/wemo/storage/DBStorage;

    invoke-virtual {v0}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Lcom/belkin/wemo/storage/DBStorage;->putData(Ljava/lang/String;)V

    .line 152
    :cond_2
    return-object v0
.end method

.method public getDeviceCache()Ljava/lang/String;
    .locals 9

    .prologue
    .line 484
    const-string v4, ""

    .line 486
    .local v4, "json":Ljava/lang/String;
    :try_start_0
    new-instance v2, Ljava/io/File;

    sget-object v7, Lcom/belkin/wemo/storage/FileStorage;->CACHE_FOLDER:Ljava/lang/String;

    const-string v8, "cache"

    invoke-direct {v2, v7, v8}, Ljava/io/File;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 487
    .local v2, "file":Ljava/io/File;
    invoke-virtual {v2}, Ljava/io/File;->exists()Z

    move-result v7

    if-eqz v7, :cond_0

    .line 488
    new-instance v3, Ljava/io/FileInputStream;

    invoke-direct {v3, v2}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V

    .line 489
    .local v3, "inputStream":Ljava/io/FileInputStream;
    new-instance v6, Ljava/io/BufferedReader;

    new-instance v7, Ljava/io/InputStreamReader;

    invoke-direct {v7, v3}, Ljava/io/InputStreamReader;-><init>(Ljava/io/InputStream;)V

    invoke-direct {v6, v7}, Ljava/io/BufferedReader;-><init>(Ljava/io/Reader;)V

    .line 490
    .local v6, "reader":Ljava/io/BufferedReader;
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 491
    .local v0, "builder":Ljava/lang/StringBuilder;
    const/4 v5, 0x0

    .line 492
    .local v5, "line":Ljava/lang/String;
    :goto_0
    invoke-virtual {v6}, Ljava/io/BufferedReader;->readLine()Ljava/lang/String;

    move-result-object v5

    if-eqz v5, :cond_1

    .line 493
    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 501
    .end local v0    # "builder":Ljava/lang/StringBuilder;
    .end local v2    # "file":Ljava/io/File;
    .end local v3    # "inputStream":Ljava/io/FileInputStream;
    .end local v5    # "line":Ljava/lang/String;
    .end local v6    # "reader":Ljava/io/BufferedReader;
    :catch_0
    move-exception v1

    .line 502
    .local v1, "e":Ljava/io/IOException;
    sget-object v7, Lcom/belkin/wemo/storage/FileStorage;->TAG:Ljava/lang/String;

    const-string v8, "Read cache error "

    invoke-static {v7, v8, v1}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Exception;)V

    .line 504
    .end local v1    # "e":Ljava/io/IOException;
    :cond_0
    :goto_1
    return-object v4

    .line 496
    .restart local v0    # "builder":Ljava/lang/StringBuilder;
    .restart local v2    # "file":Ljava/io/File;
    .restart local v3    # "inputStream":Ljava/io/FileInputStream;
    .restart local v5    # "line":Ljava/lang/String;
    .restart local v6    # "reader":Ljava/io/BufferedReader;
    :cond_1
    :try_start_1
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    .line 498
    invoke-virtual {v6}, Ljava/io/BufferedReader;->close()V

    .line 499
    invoke-virtual {v3}, Ljava/io/FileInputStream;->close()V
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_1
.end method

.method public getEditedIconFile()Ljava/io/File;
    .locals 4

    .prologue
    .line 305
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "icon_"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p0}, Lcom/belkin/wemo/storage/FileStorage;->getRandomNumber()J

    move-result-wide v2

    invoke-virtual {v1, v2, v3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "_TEMP.jpg"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 306
    .local v0, "fileName":Ljava/lang/String;
    new-instance v1, Ljava/io/File;

    sget-object v2, Lcom/belkin/wemo/storage/FileStorage;->TEMP_ICON_FOLDER:Ljava/lang/String;

    invoke-direct {v1, v2, v0}, Ljava/io/File;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    return-object v1
.end method

.method public getIconFile(Ljava/net/URL;Ljava/lang/String;Ljava/lang/String;)Ljava/io/File;
    .locals 6
    .param p1, "url"    # Ljava/net/URL;
    .param p2, "version"    # Ljava/lang/String;
    .param p3, "number"    # Ljava/lang/String;

    .prologue
    .line 178
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "icon_"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "_"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "_"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {p0}, Lcom/belkin/wemo/storage/FileStorage;->getRandomNumber()J

    move-result-wide v4

    invoke-virtual {v2, v4, v5}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, ".jpg"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 179
    .local v1, "fileName":Ljava/lang/String;
    new-instance v0, Ljava/io/File;

    sget-object v2, Lcom/belkin/wemo/storage/FileStorage;->LOGO_FOLDER:Ljava/lang/String;

    invoke-direct {v0, v2, v1}, Ljava/io/File;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 182
    .local v0, "file":Ljava/io/File;
    invoke-direct {p0, p3}, Lcom/belkin/wemo/storage/FileStorage;->deleteIcon(Ljava/lang/String;)V

    .line 186
    sget-object v2, Lcom/belkin/wemo/storage/FileStorage;->LOGO_FOLDER:Ljava/lang/String;

    invoke-direct {p0, v2, v1, p1}, Lcom/belkin/wemo/storage/FileStorage;->saveFile(Ljava/lang/String;Ljava/lang/String;Ljava/net/URL;)Ljava/io/File;

    move-result-object v0

    .line 187
    sget-object v2, Lcom/belkin/wemo/storage/FileStorage;->mDBStorage:Lcom/belkin/wemo/storage/DBStorage;

    if-eqz v2, :cond_0

    .line 188
    sget-object v2, Lcom/belkin/wemo/storage/FileStorage;->mDBStorage:Lcom/belkin/wemo/storage/DBStorage;

    invoke-virtual {v0}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Lcom/belkin/wemo/storage/DBStorage;->putData(Ljava/lang/String;)V

    .line 190
    :cond_0
    sget-object v2, Lcom/belkin/wemo/storage/FileStorage;->TAG:Ljava/lang/String;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "ICON Location in phone: getIconFile(): "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "; ID/UDN: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "; Version: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->debugLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 192
    return-object v0
.end method

.method public getIconFileUrl(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 4
    .param p1, "version"    # Ljava/lang/String;
    .param p2, "serialNumber"    # Ljava/lang/String;

    .prologue
    .line 206
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " icon.jpg"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 207
    .local v1, "fileName":Ljava/lang/String;
    new-instance v0, Ljava/io/File;

    sget-object v2, Lcom/belkin/wemo/storage/FileStorage;->LOGO_FOLDER:Ljava/lang/String;

    invoke-direct {v0, v2, v1}, Ljava/io/File;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 208
    .local v0, "file":Ljava/io/File;
    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result v2

    if-nez v2, :cond_0

    .line 209
    const-string v2, ""

    .line 211
    :goto_0
    return-object v2

    :cond_0
    invoke-virtual {v0}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v2

    goto :goto_0
.end method

.method public getRandomNumber()J
    .locals 6

    .prologue
    .line 107
    new-instance v2, Ljava/util/Random;

    invoke-direct {v2}, Ljava/util/Random;-><init>()V

    .line 108
    .local v2, "random":Ljava/util/Random;
    invoke-virtual {v2}, Ljava/util/Random;->nextLong()J

    move-result-wide v4

    invoke-static {v4, v5}, Ljava/lang/Math;->abs(J)J

    move-result-wide v0

    .line 110
    .local v0, "number":J
    sget-object v3, Lcom/belkin/wemo/storage/FileStorage;->TAG:Ljava/lang/String;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Random number used for next icon: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v0, v1}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->debugLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 111
    return-wide v0
.end method

.method public getSSDPPacket(Ljava/lang/String;)Lorg/cybergarage/upnp/ssdp/SSDPPacket;
    .locals 8
    .param p1, "packetName"    # Ljava/lang/String;

    .prologue
    .line 436
    new-instance v2, Ljava/io/File;

    sget-object v5, Lcom/belkin/wemo/storage/FileStorage;->PACKET_FOLDER:Ljava/lang/String;

    invoke-direct {v2, v5, p1}, Ljava/io/File;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 437
    .local v2, "file":Ljava/io/File;
    invoke-virtual {v2}, Ljava/io/File;->exists()Z

    move-result v5

    if-eqz v5, :cond_0

    .line 438
    invoke-virtual {v2}, Ljava/io/File;->length()J

    move-result-wide v6

    long-to-int v4, v6

    .line 439
    .local v4, "length":I
    new-array v0, v4, [B

    .line 442
    .local v0, "buf":[B
    :try_start_0
    new-instance v3, Ljava/io/BufferedInputStream;

    new-instance v5, Ljava/io/FileInputStream;

    invoke-direct {v5, v2}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V

    invoke-direct {v3, v5}, Ljava/io/BufferedInputStream;-><init>(Ljava/io/InputStream;)V

    .line 443
    .local v3, "inputStream":Ljava/io/BufferedInputStream;
    const/4 v5, 0x0

    invoke-virtual {v3, v0, v5, v4}, Ljava/io/BufferedInputStream;->read([BII)I

    .line 444
    invoke-virtual {v3}, Ljava/io/BufferedInputStream;->close()V

    .line 445
    new-instance v5, Lorg/cybergarage/upnp/ssdp/SSDPPacket;

    invoke-direct {v5, v0, v4}, Lorg/cybergarage/upnp/ssdp/SSDPPacket;-><init>([BI)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 451
    .end local v0    # "buf":[B
    .end local v3    # "inputStream":Ljava/io/BufferedInputStream;
    .end local v4    # "length":I
    :goto_0
    return-object v5

    .line 446
    .restart local v0    # "buf":[B
    .restart local v4    # "length":I
    :catch_0
    move-exception v1

    .line 447
    .local v1, "e":Ljava/io/IOException;
    sget-object v5, Lcom/belkin/wemo/storage/FileStorage;->TAG:Ljava/lang/String;

    const-string v6, "Read packet error "

    invoke-static {v5, v6, v1}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Exception;)V

    .line 451
    .end local v0    # "buf":[B
    .end local v1    # "e":Ljava/io/IOException;
    .end local v4    # "length":I
    :cond_0
    const/4 v5, 0x0

    goto :goto_0
.end method

.method public getSSDPPacketNames()[Ljava/lang/String;
    .locals 2

    .prologue
    .line 426
    new-instance v0, Ljava/io/File;

    sget-object v1, Lcom/belkin/wemo/storage/FileStorage;->PACKET_FOLDER:Ljava/lang/String;

    invoke-direct {v0, v1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 428
    .local v0, "file":Ljava/io/File;
    invoke-virtual {v0}, Ljava/io/File;->list()[Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method public getSSDPPacketParameters(Ljava/lang/String;)[Ljava/lang/String;
    .locals 1
    .param p1, "packetName"    # Ljava/lang/String;

    .prologue
    .line 459
    const-string v0, " "

    invoke-virtual {p1, v0}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public isReload()Z
    .locals 1

    .prologue
    .line 638
    iget-boolean v0, p0, Lcom/belkin/wemo/storage/FileStorage;->reload:Z

    return v0
.end method

.method public saveDeviceCache(Ljava/lang/String;)V
    .locals 8
    .param p1, "json"    # Ljava/lang/String;

    .prologue
    .line 464
    :try_start_0
    new-instance v3, Ljava/io/File;

    sget-object v6, Lcom/belkin/wemo/storage/FileStorage;->CACHE_FOLDER:Ljava/lang/String;

    const-string v7, "cache"

    invoke-direct {v3, v6, v7}, Ljava/io/File;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 465
    .local v3, "file":Ljava/io/File;
    new-instance v5, Ljava/io/FileOutputStream;

    invoke-direct {v5, v3}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V

    .line 466
    .local v5, "outputStream":Ljava/io/FileOutputStream;
    new-instance v4, Ljava/io/ByteArrayInputStream;

    invoke-virtual {p1}, Ljava/lang/String;->getBytes()[B

    move-result-object v6

    invoke-direct {v4, v6}, Ljava/io/ByteArrayInputStream;-><init>([B)V

    .line 468
    .local v4, "inputStream":Ljava/io/ByteArrayInputStream;
    const/16 v6, 0x400

    new-array v0, v6, [B

    .line 470
    .local v0, "buffer":[B
    :goto_0
    invoke-virtual {v4, v0}, Ljava/io/ByteArrayInputStream;->read([B)I

    move-result v1

    .local v1, "count":I
    const/4 v6, -0x1

    if-eq v1, v6, :cond_0

    .line 471
    const/4 v6, 0x0

    invoke-virtual {v5, v0, v6, v1}, Ljava/io/FileOutputStream;->write([BII)V
    :try_end_0
    .catch Ljava/io/FileNotFoundException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_1

    goto :goto_0

    .line 476
    .end local v0    # "buffer":[B
    .end local v1    # "count":I
    .end local v3    # "file":Ljava/io/File;
    .end local v4    # "inputStream":Ljava/io/ByteArrayInputStream;
    .end local v5    # "outputStream":Ljava/io/FileOutputStream;
    :catch_0
    move-exception v2

    .line 477
    .local v2, "e":Ljava/io/FileNotFoundException;
    sget-object v6, Lcom/belkin/wemo/storage/FileStorage;->TAG:Ljava/lang/String;

    const-string v7, "Save cache error "

    invoke-static {v6, v7, v2}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Exception;)V

    .line 481
    .end local v2    # "e":Ljava/io/FileNotFoundException;
    :goto_1
    return-void

    .line 474
    .restart local v0    # "buffer":[B
    .restart local v1    # "count":I
    .restart local v3    # "file":Ljava/io/File;
    .restart local v4    # "inputStream":Ljava/io/ByteArrayInputStream;
    .restart local v5    # "outputStream":Ljava/io/FileOutputStream;
    :cond_0
    :try_start_1
    invoke-virtual {v4}, Ljava/io/ByteArrayInputStream;->close()V

    .line 475
    invoke-virtual {v5}, Ljava/io/FileOutputStream;->close()V
    :try_end_1
    .catch Ljava/io/FileNotFoundException; {:try_start_1 .. :try_end_1} :catch_0
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_1

    goto :goto_1

    .line 478
    .end local v0    # "buffer":[B
    .end local v1    # "count":I
    .end local v3    # "file":Ljava/io/File;
    .end local v4    # "inputStream":Ljava/io/ByteArrayInputStream;
    .end local v5    # "outputStream":Ljava/io/FileOutputStream;
    :catch_1
    move-exception v2

    .line 479
    .local v2, "e":Ljava/io/IOException;
    sget-object v6, Lcom/belkin/wemo/storage/FileStorage;->TAG:Ljava/lang/String;

    const-string v7, "Save cache error "

    invoke-static {v6, v7, v2}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Exception;)V

    goto :goto_1
.end method

.method public saveIconFile(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/io/File;
    .locals 7
    .param p1, "urlStr"    # Ljava/lang/String;
    .param p2, "version"    # Ljava/lang/String;
    .param p3, "number"    # Ljava/lang/String;

    .prologue
    .line 359
    const/4 v1, 0x0

    .line 361
    .local v1, "file":Ljava/io/File;
    :try_start_0
    new-instance v4, Ljava/net/URL;

    invoke-direct {v4, p1}, Ljava/net/URL;-><init>(Ljava/lang/String;)V

    .line 362
    .local v4, "url":Ljava/net/URL;
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v5, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, " "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, " "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v4}, Ljava/net/URL;->getPath()Ljava/lang/String;

    move-result-object v6

    invoke-static {v6}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v6

    invoke-virtual {v6}, Landroid/net/Uri;->getLastPathSegment()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    .line 363
    .local v3, "fileName":Ljava/lang/String;
    new-instance v2, Ljava/io/File;

    sget-object v5, Lcom/belkin/wemo/storage/FileStorage;->LOGO_FOLDER:Ljava/lang/String;

    invoke-direct {v2, v5, v3}, Ljava/io/File;-><init>(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 364
    .end local v1    # "file":Ljava/io/File;
    .local v2, "file":Ljava/io/File;
    :try_start_1
    invoke-virtual {v2}, Ljava/io/File;->exists()Z

    move-result v5

    if-eqz v5, :cond_0

    .line 365
    invoke-virtual {v2}, Ljava/io/File;->delete()Z

    .line 366
    :cond_0
    sget-object v5, Lcom/belkin/wemo/storage/FileStorage;->LOGO_FOLDER:Ljava/lang/String;

    invoke-direct {p0, v5, v3, v4}, Lcom/belkin/wemo/storage/FileStorage;->saveFile(Ljava/lang/String;Ljava/lang/String;Ljava/net/URL;)Ljava/io/File;
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    move-result-object v1

    .line 368
    .end local v2    # "file":Ljava/io/File;
    .restart local v1    # "file":Ljava/io/File;
    :try_start_2
    sget-object v5, Lcom/belkin/wemo/storage/FileStorage;->mDBStorage:Lcom/belkin/wemo/storage/DBStorage;

    if-eqz v5, :cond_1

    .line 369
    sget-object v5, Lcom/belkin/wemo/storage/FileStorage;->mDBStorage:Lcom/belkin/wemo/storage/DBStorage;

    invoke-virtual {v1}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Lcom/belkin/wemo/storage/DBStorage;->putData(Ljava/lang/String;)V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0

    .line 375
    .end local v3    # "fileName":Ljava/lang/String;
    .end local v4    # "url":Ljava/net/URL;
    :cond_1
    :goto_0
    return-object v1

    .line 371
    :catch_0
    move-exception v0

    .line 372
    .local v0, "e":Ljava/lang/Exception;
    :goto_1
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_0

    .line 371
    .end local v0    # "e":Ljava/lang/Exception;
    .end local v1    # "file":Ljava/io/File;
    .restart local v2    # "file":Ljava/io/File;
    .restart local v3    # "fileName":Ljava/lang/String;
    .restart local v4    # "url":Ljava/net/URL;
    :catch_1
    move-exception v0

    move-object v1, v2

    .end local v2    # "file":Ljava/io/File;
    .restart local v1    # "file":Ljava/io/File;
    goto :goto_1
.end method

.method public saveSSDPPacket(Lorg/cybergarage/upnp/ssdp/SSDPPacket;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 6
    .param p1, "packet"    # Lorg/cybergarage/upnp/ssdp/SSDPPacket;
    .param p2, "macaddress"    # Ljava/lang/String;
    .param p3, "version"    # Ljava/lang/String;
    .param p4, "ssid"    # Ljava/lang/String;

    .prologue
    .line 407
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v4, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, " "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, " "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    .line 408
    .local v2, "fileName":Ljava/lang/String;
    new-instance v1, Ljava/io/File;

    sget-object v4, Lcom/belkin/wemo/storage/FileStorage;->PACKET_FOLDER:Ljava/lang/String;

    invoke-direct {v1, v4, v2}, Ljava/io/File;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 410
    .local v1, "file":Ljava/io/File;
    invoke-virtual {v1}, Ljava/io/File;->exists()Z

    move-result v4

    if-nez v4, :cond_0

    const-string v4, ""

    invoke-virtual {p3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_0

    const-string v4, ""

    invoke-virtual {p2, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_0

    .line 412
    :try_start_0
    new-instance v3, Ljava/io/FileOutputStream;

    invoke-direct {v3, v1}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V

    .line 413
    .local v3, "outputStream":Ljava/io/FileOutputStream;
    iget-object v4, p1, Lorg/cybergarage/upnp/ssdp/SSDPPacket;->packetBytes:[B

    invoke-virtual {v3, v4}, Ljava/io/FileOutputStream;->write([B)V

    .line 415
    invoke-virtual {v3}, Ljava/io/FileOutputStream;->close()V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 420
    .end local v3    # "outputStream":Ljava/io/FileOutputStream;
    :cond_0
    :goto_0
    return-void

    .line 416
    :catch_0
    move-exception v0

    .line 417
    .local v0, "e":Ljava/io/IOException;
    sget-object v4, Lcom/belkin/wemo/storage/FileStorage;->TAG:Ljava/lang/String;

    const-string v5, "Download file error "

    invoke-static {v4, v5, v0}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Exception;)V

    goto :goto_0
.end method

.method public setReload(Z)V
    .locals 0
    .param p1, "reload"    # Z

    .prologue
    .line 642
    iput-boolean p1, p0, Lcom/belkin/wemo/storage/FileStorage;->reload:Z

    .line 643
    return-void
.end method

.method public storeDefaultIcon(Ljava/net/URL;Ljava/lang/String;Ljava/lang/String;)Ljava/io/File;
    .locals 8
    .param p1, "url"    # Ljava/net/URL;
    .param p2, "version"    # Ljava/lang/String;
    .param p3, "number"    # Ljava/lang/String;

    .prologue
    .line 328
    const/4 v2, 0x0

    .line 330
    .local v2, "file":Ljava/io/File;
    :try_start_0
    iget-object v6, p0, Lcom/belkin/wemo/storage/FileStorage;->mContext:Landroid/content/Context;

    invoke-virtual {v6}, Landroid/content/Context;->getAssets()Landroid/content/res/AssetManager;

    move-result-object v0

    .line 331
    .local v0, "am":Landroid/content/res/AssetManager;
    const-string v6, "www/img/belkin_maker_small.png"

    invoke-virtual {v0, v6}, Landroid/content/res/AssetManager;->open(Ljava/lang/String;)Ljava/io/InputStream;

    move-result-object v5

    .line 333
    .local v5, "inputStream":Ljava/io/InputStream;
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v6, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, " "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, " "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {p1}, Ljava/net/URL;->getPath()Ljava/lang/String;

    move-result-object v7

    invoke-static {v7}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v7

    invoke-virtual {v7}, Landroid/net/Uri;->getLastPathSegment()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    .line 334
    .local v4, "fileName":Ljava/lang/String;
    new-instance v3, Ljava/io/File;

    sget-object v6, Lcom/belkin/wemo/storage/FileStorage;->LOGO_FOLDER:Ljava/lang/String;

    invoke-direct {v3, v6, v4}, Ljava/io/File;-><init>(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 336
    .end local v2    # "file":Ljava/io/File;
    .local v3, "file":Ljava/io/File;
    :try_start_1
    invoke-virtual {v3}, Ljava/io/File;->exists()Z

    move-result v6

    if-eqz v6, :cond_0

    const-string v6, ""

    invoke-virtual {p2, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_2

    .line 337
    :cond_0
    sget-object v6, Lcom/belkin/wemo/storage/FileStorage;->LOGO_FOLDER:Ljava/lang/String;

    invoke-direct {p0, v6, v4, v5}, Lcom/belkin/wemo/storage/FileStorage;->saveIconInMemory(Ljava/lang/String;Ljava/lang/String;Ljava/io/InputStream;)Ljava/io/File;
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    move-result-object v2

    .line 341
    .end local v3    # "file":Ljava/io/File;
    .restart local v2    # "file":Ljava/io/File;
    :goto_0
    :try_start_2
    sget-object v6, Lcom/belkin/wemo/storage/FileStorage;->mDBStorage:Lcom/belkin/wemo/storage/DBStorage;

    if-eqz v6, :cond_1

    .line 342
    sget-object v6, Lcom/belkin/wemo/storage/FileStorage;->mDBStorage:Lcom/belkin/wemo/storage/DBStorage;

    invoke-virtual {v2}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Lcom/belkin/wemo/storage/DBStorage;->putData(Ljava/lang/String;)V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0

    .line 347
    .end local v0    # "am":Landroid/content/res/AssetManager;
    .end local v4    # "fileName":Ljava/lang/String;
    .end local v5    # "inputStream":Ljava/io/InputStream;
    :cond_1
    :goto_1
    return-object v2

    .line 344
    :catch_0
    move-exception v1

    .line 345
    .local v1, "e":Ljava/lang/Exception;
    :goto_2
    sget-object v6, Lcom/belkin/wemo/storage/FileStorage;->TAG:Ljava/lang/String;

    const-string v7, "Exception: "

    invoke-static {v6, v7, v1}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Exception;)V

    goto :goto_1

    .line 344
    .end local v1    # "e":Ljava/lang/Exception;
    .end local v2    # "file":Ljava/io/File;
    .restart local v0    # "am":Landroid/content/res/AssetManager;
    .restart local v3    # "file":Ljava/io/File;
    .restart local v4    # "fileName":Ljava/lang/String;
    .restart local v5    # "inputStream":Ljava/io/InputStream;
    :catch_1
    move-exception v1

    move-object v2, v3

    .end local v3    # "file":Ljava/io/File;
    .restart local v2    # "file":Ljava/io/File;
    goto :goto_2

    .end local v2    # "file":Ljava/io/File;
    .restart local v3    # "file":Ljava/io/File;
    :cond_2
    move-object v2, v3

    .end local v3    # "file":Ljava/io/File;
    .restart local v2    # "file":Ljava/io/File;
    goto :goto_0
.end method

.method public storeEditedIcon(Landroid/graphics/Bitmap;)Ljava/lang/String;
    .locals 6
    .param p1, "bmp"    # Landroid/graphics/Bitmap;

    .prologue
    .line 286
    invoke-virtual {p0}, Lcom/belkin/wemo/storage/FileStorage;->getEditedIconFile()Ljava/io/File;

    move-result-object v1

    .line 290
    .local v1, "file":Ljava/io/File;
    :try_start_0
    new-instance v2, Ljava/io/FileOutputStream;

    invoke-direct {v2, v1}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V

    .line 291
    .local v2, "outputStream":Ljava/io/OutputStream;
    sget-object v3, Landroid/graphics/Bitmap$CompressFormat;->PNG:Landroid/graphics/Bitmap$CompressFormat;

    const/16 v4, 0x5a

    invoke-virtual {p1, v3, v4, v2}, Landroid/graphics/Bitmap;->compress(Landroid/graphics/Bitmap$CompressFormat;ILjava/io/OutputStream;)Z

    .line 292
    sget-object v3, Lcom/belkin/wemo/storage/FileStorage;->TAG:Ljava/lang/String;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "ICON Location in phone: storeEditedIcon(): "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v1}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->debugLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 293
    invoke-virtual {v1}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v3

    .line 301
    .end local v2    # "outputStream":Ljava/io/OutputStream;
    :goto_0
    return-object v3

    .line 294
    :catch_0
    move-exception v0

    .line 295
    .local v0, "e":Ljava/lang/Exception;
    :try_start_1
    sget-object v3, Lcom/belkin/wemo/storage/FileStorage;->TAG:Ljava/lang/String;

    const-string v4, "Exception: createFileFromInputStream "

    invoke-static {v3, v4, v0}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Exception;)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    .line 301
    :goto_1
    const-string v3, ""

    goto :goto_0

    .line 298
    :catch_1
    move-exception v0

    .line 299
    sget-object v3, Lcom/belkin/wemo/storage/FileStorage;->TAG:Ljava/lang/String;

    const-string v4, "storeIcon Exception: "

    invoke-static {v3, v4, v0}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Exception;)V

    goto :goto_1
.end method

.method public storeIcon([BLjava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 6
    .param p1, "iconData"    # [B
    .param p2, "version"    # Ljava/lang/String;
    .param p3, "serialNumber"    # Ljava/lang/String;

    .prologue
    .line 228
    :try_start_0
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v4, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, " "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, " icon.jpg"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    .line 229
    .local v2, "fileName":Ljava/lang/String;
    new-instance v1, Ljava/io/File;

    sget-object v4, Lcom/belkin/wemo/storage/FileStorage;->LOGO_FOLDER:Ljava/lang/String;

    invoke-direct {v1, v4, v2}, Ljava/io/File;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 231
    .local v1, "file":Ljava/io/File;
    invoke-virtual {v1}, Ljava/io/File;->exists()Z

    move-result v4

    if-eqz v4, :cond_0

    const-string v4, ""

    invoke-virtual {p2, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1

    move-result v4

    if-eqz v4, :cond_2

    .line 233
    :cond_0
    :try_start_1
    new-instance v3, Ljava/io/FileOutputStream;

    invoke-direct {v3, v1}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V

    .line 234
    .local v3, "outputStream":Ljava/io/OutputStream;
    const/4 v4, 0x0

    array-length v5, p1

    invoke-virtual {v3, p1, v4, v5}, Ljava/io/OutputStream;->write([BII)V

    .line 235
    invoke-virtual {v3}, Ljava/io/OutputStream;->close()V

    .line 236
    invoke-virtual {v1}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    move-result-object v4

    .line 251
    .end local v1    # "file":Ljava/io/File;
    .end local v2    # "fileName":Ljava/lang/String;
    .end local v3    # "outputStream":Ljava/io/OutputStream;
    :goto_0
    return-object v4

    .line 237
    .restart local v1    # "file":Ljava/io/File;
    .restart local v2    # "fileName":Ljava/lang/String;
    :catch_0
    move-exception v0

    .line 238
    .local v0, "e":Ljava/lang/Exception;
    :try_start_2
    sget-object v4, Lcom/belkin/wemo/storage/FileStorage;->TAG:Ljava/lang/String;

    const-string v5, "Exception: createFileFromInputStream--> "

    invoke-static {v4, v5, v0}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Exception;)V

    .line 245
    sget-object v4, Lcom/belkin/wemo/storage/FileStorage;->mDBStorage:Lcom/belkin/wemo/storage/DBStorage;

    if-eqz v4, :cond_1

    .line 246
    sget-object v4, Lcom/belkin/wemo/storage/FileStorage;->mDBStorage:Lcom/belkin/wemo/storage/DBStorage;

    invoke-virtual {v1}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Lcom/belkin/wemo/storage/DBStorage;->putData(Ljava/lang/String;)V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_1

    .line 251
    .end local v1    # "file":Ljava/io/File;
    .end local v2    # "fileName":Ljava/lang/String;
    :cond_1
    :goto_1
    const-string v4, ""

    goto :goto_0

    .line 243
    .end local v0    # "e":Ljava/lang/Exception;
    .restart local v1    # "file":Ljava/io/File;
    .restart local v2    # "fileName":Ljava/lang/String;
    :cond_2
    :try_start_3
    invoke-virtual {v1}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_1

    move-result-object v4

    goto :goto_0

    .line 248
    .end local v1    # "file":Ljava/io/File;
    .end local v2    # "fileName":Ljava/lang/String;
    :catch_1
    move-exception v0

    .line 249
    .restart local v0    # "e":Ljava/lang/Exception;
    sget-object v4, Lcom/belkin/wemo/storage/FileStorage;->TAG:Ljava/lang/String;

    const-string v5, "storeIcon Exception: "

    invoke-static {v4, v5, v0}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Exception;)V

    goto :goto_1
.end method

.method public storeRemoteIcon(Landroid/graphics/Bitmap;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 8
    .param p1, "bmp"    # Landroid/graphics/Bitmap;
    .param p2, "macAddress"    # Ljava/lang/String;
    .param p3, "uploadID"    # Ljava/lang/String;

    .prologue
    .line 262
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v4, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, "_"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, "icon"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, "_"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, "_"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {p0}, Lcom/belkin/wemo/storage/FileStorage;->getRandomNumber()J

    move-result-wide v6

    invoke-virtual {v4, v6, v7}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, ".jpg"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    .line 263
    .local v2, "fileName":Ljava/lang/String;
    new-instance v1, Ljava/io/File;

    sget-object v4, Lcom/belkin/wemo/storage/FileStorage;->LOGO_FOLDER:Ljava/lang/String;

    invoke-direct {v1, v4, v2}, Ljava/io/File;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 266
    .local v1, "file":Ljava/io/File;
    :try_start_0
    invoke-direct {p0, p2}, Lcom/belkin/wemo/storage/FileStorage;->deleteIcon(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1

    .line 270
    :try_start_1
    new-instance v3, Ljava/io/FileOutputStream;

    invoke-direct {v3, v1}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V

    .line 271
    .local v3, "outputStream":Ljava/io/OutputStream;
    sget-object v4, Landroid/graphics/Bitmap$CompressFormat;->PNG:Landroid/graphics/Bitmap$CompressFormat;

    const/16 v5, 0x5a

    invoke-virtual {p1, v4, v5, v3}, Landroid/graphics/Bitmap;->compress(Landroid/graphics/Bitmap$CompressFormat;ILjava/io/OutputStream;)Z

    .line 272
    sget-object v4, Lcom/belkin/wemo/storage/FileStorage;->TAG:Ljava/lang/String;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "ICON Location in phone: storeRemoteIcon(): "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, "; ID/UDN: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, "; Version: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->debugLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 273
    invoke-virtual {v1}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    move-result-object v4

    .line 281
    .end local v3    # "outputStream":Ljava/io/OutputStream;
    :goto_0
    return-object v4

    .line 274
    :catch_0
    move-exception v0

    .line 275
    .local v0, "e":Ljava/lang/Exception;
    :try_start_2
    sget-object v4, Lcom/belkin/wemo/storage/FileStorage;->TAG:Ljava/lang/String;

    const-string v5, "Exception: createFileFromInputStream "

    invoke-static {v4, v5, v0}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Exception;)V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_1

    .line 281
    :goto_1
    const-string v4, ""

    goto :goto_0

    .line 278
    .end local v0    # "e":Ljava/lang/Exception;
    :catch_1
    move-exception v0

    .line 279
    .restart local v0    # "e":Ljava/lang/Exception;
    sget-object v4, Lcom/belkin/wemo/storage/FileStorage;->TAG:Ljava/lang/String;

    const-string v5, "storeIcon Exception: "

    invoke-static {v4, v5, v0}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Exception;)V

    goto :goto_1
.end method
