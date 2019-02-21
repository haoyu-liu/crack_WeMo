.class public Lio/liteglue/SQLitePlugin;
.super Lorg/apache/cordova/CordovaPlugin;
.source "SQLitePlugin.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lio/liteglue/SQLitePlugin$1;,
        Lio/liteglue/SQLitePlugin$Action;,
        Lio/liteglue/SQLitePlugin$DBQuery;,
        Lio/liteglue/SQLitePlugin$DBRunner;,
        Lio/liteglue/SQLitePlugin$SQLiteDatabaseNDK;
    }
.end annotation


# static fields
.field static dbrmap:Ljava/util/concurrent/ConcurrentHashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/ConcurrentHashMap",
            "<",
            "Ljava/lang/String;",
            "Lio/liteglue/SQLitePlugin$DBRunner;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 45
    new-instance v0, Ljava/util/concurrent/ConcurrentHashMap;

    invoke-direct {v0}, Ljava/util/concurrent/ConcurrentHashMap;-><init>()V

    sput-object v0, Lio/liteglue/SQLitePlugin;->dbrmap:Ljava/util/concurrent/ConcurrentHashMap;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 38
    invoke-direct {p0}, Lorg/apache/cordova/CordovaPlugin;-><init>()V

    .line 698
    return-void
.end method

.method static synthetic access$000(Lio/liteglue/SQLitePlugin;Ljava/lang/String;ZLorg/apache/cordova/CallbackContext;Z)Lio/liteglue/SQLiteAndroidDatabase;
    .locals 1
    .param p0, "x0"    # Lio/liteglue/SQLitePlugin;
    .param p1, "x1"    # Ljava/lang/String;
    .param p2, "x2"    # Z
    .param p3, "x3"    # Lorg/apache/cordova/CallbackContext;
    .param p4, "x4"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 38
    invoke-direct {p0, p1, p2, p3, p4}, Lio/liteglue/SQLitePlugin;->openDatabase(Ljava/lang/String;ZLorg/apache/cordova/CallbackContext;Z)Lio/liteglue/SQLiteAndroidDatabase;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$100(Lio/liteglue/SQLitePlugin;Ljava/lang/String;)V
    .locals 0
    .param p0, "x0"    # Lio/liteglue/SQLitePlugin;
    .param p1, "x1"    # Ljava/lang/String;

    .prologue
    .line 38
    invoke-direct {p0, p1}, Lio/liteglue/SQLitePlugin;->closeDatabaseNow(Ljava/lang/String;)V

    return-void
.end method

.method static synthetic access$200(Lio/liteglue/SQLitePlugin;Ljava/lang/String;)Z
    .locals 1
    .param p0, "x0"    # Lio/liteglue/SQLitePlugin;
    .param p1, "x1"    # Ljava/lang/String;

    .prologue
    .line 38
    invoke-direct {p0, p1}, Lio/liteglue/SQLitePlugin;->deleteDatabaseNow(Ljava/lang/String;)Z

    move-result v0

    return v0
.end method

.method private closeDatabase(Ljava/lang/String;Lorg/apache/cordova/CallbackContext;)V
    .locals 5
    .param p1, "dbname"    # Ljava/lang/String;
    .param p2, "cbc"    # Lorg/apache/cordova/CallbackContext;

    .prologue
    .line 292
    sget-object v2, Lio/liteglue/SQLitePlugin;->dbrmap:Ljava/util/concurrent/ConcurrentHashMap;

    invoke-virtual {v2, p1}, Ljava/util/concurrent/ConcurrentHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lio/liteglue/SQLitePlugin$DBRunner;

    .line 293
    .local v1, "r":Lio/liteglue/SQLitePlugin$DBRunner;
    if-eqz v1, :cond_2

    .line 295
    :try_start_0
    iget-object v2, v1, Lio/liteglue/SQLitePlugin$DBRunner;->q:Ljava/util/concurrent/BlockingQueue;

    new-instance v3, Lio/liteglue/SQLitePlugin$DBQuery;

    const/4 v4, 0x0

    invoke-direct {v3, p0, v4, p2}, Lio/liteglue/SQLitePlugin$DBQuery;-><init>(Lio/liteglue/SQLitePlugin;ZLorg/apache/cordova/CallbackContext;)V

    invoke-interface {v2, v3}, Ljava/util/concurrent/BlockingQueue;->put(Ljava/lang/Object;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 307
    :cond_0
    :goto_0
    return-void

    .line 296
    :catch_0
    move-exception v0

    .line 297
    .local v0, "e":Ljava/lang/Exception;
    if-eqz p2, :cond_1

    .line 298
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "couldn\'t close database"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p2, v2}, Lorg/apache/cordova/CallbackContext;->error(Ljava/lang/String;)V

    .line 300
    :cond_1
    const-class v2, Lio/liteglue/SQLitePlugin;

    invoke-virtual {v2}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v2

    const-string v3, "couldn\'t close database"

    invoke-static {v2, v3, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_0

    .line 303
    .end local v0    # "e":Ljava/lang/Exception;
    :cond_2
    if-eqz p2, :cond_0

    .line 304
    invoke-virtual {p2}, Lorg/apache/cordova/CallbackContext;->success()V

    goto :goto_0
.end method

.method private closeDatabaseNow(Ljava/lang/String;)V
    .locals 3
    .param p1, "dbname"    # Ljava/lang/String;

    .prologue
    .line 315
    sget-object v2, Lio/liteglue/SQLitePlugin;->dbrmap:Ljava/util/concurrent/ConcurrentHashMap;

    invoke-virtual {v2, p1}, Ljava/util/concurrent/ConcurrentHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lio/liteglue/SQLitePlugin$DBRunner;

    .line 317
    .local v1, "r":Lio/liteglue/SQLitePlugin$DBRunner;
    if-eqz v1, :cond_0

    .line 318
    iget-object v0, v1, Lio/liteglue/SQLitePlugin$DBRunner;->mydb:Lio/liteglue/SQLiteAndroidDatabase;

    .line 320
    .local v0, "mydb":Lio/liteglue/SQLiteAndroidDatabase;
    if-eqz v0, :cond_0

    .line 321
    invoke-virtual {v0}, Lio/liteglue/SQLiteAndroidDatabase;->closeDatabaseNow()V

    .line 323
    .end local v0    # "mydb":Lio/liteglue/SQLiteAndroidDatabase;
    :cond_0
    return-void
.end method

.method private createFromAssets(Ljava/lang/String;Ljava/io/File;)V
    .locals 12
    .param p1, "myDBName"    # Ljava/lang/String;
    .param p2, "dbfile"    # Ljava/io/File;

    .prologue
    .line 244
    const/4 v4, 0x0

    .line 245
    .local v4, "in":Ljava/io/InputStream;
    const/4 v7, 0x0

    .line 248
    .local v7, "out":Ljava/io/OutputStream;
    :try_start_0
    iget-object v9, p0, Lio/liteglue/SQLitePlugin;->cordova:Lorg/apache/cordova/CordovaInterface;

    invoke-interface {v9}, Lorg/apache/cordova/CordovaInterface;->getActivity()Landroid/app/Activity;

    move-result-object v9

    invoke-virtual {v9}, Landroid/app/Activity;->getAssets()Landroid/content/res/AssetManager;

    move-result-object v9

    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    const-string v11, "www/"

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v9, v10}, Landroid/content/res/AssetManager;->open(Ljava/lang/String;)Ljava/io/InputStream;

    move-result-object v4

    .line 249
    invoke-virtual {p2}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v1

    .line 250
    .local v1, "dbPath":Ljava/lang/String;
    const/4 v9, 0x0

    const-string v10, "/"

    invoke-virtual {v1, v10}, Ljava/lang/String;->lastIndexOf(Ljava/lang/String;)I

    move-result v10

    add-int/lit8 v10, v10, 0x1

    invoke-virtual {v1, v9, v10}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v1

    .line 252
    new-instance v2, Ljava/io/File;

    invoke-direct {v2, v1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 253
    .local v2, "dbPathFile":Ljava/io/File;
    invoke-virtual {v2}, Ljava/io/File;->exists()Z

    move-result v9

    if-nez v9, :cond_0

    .line 254
    invoke-virtual {v2}, Ljava/io/File;->mkdirs()Z

    .line 256
    :cond_0
    new-instance v6, Ljava/io/File;

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v9, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-direct {v6, v9}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 257
    .local v6, "newDbFile":Ljava/io/File;
    new-instance v8, Ljava/io/FileOutputStream;

    invoke-direct {v8, v6}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_7
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 261
    .end local v7    # "out":Ljava/io/OutputStream;
    .local v8, "out":Ljava/io/OutputStream;
    const/16 v9, 0x400

    :try_start_1
    new-array v0, v9, [B

    .line 263
    .local v0, "buf":[B
    :goto_0
    invoke-virtual {v4, v0}, Ljava/io/InputStream;->read([B)I

    move-result v5

    .local v5, "len":I
    if-lez v5, :cond_3

    .line 264
    const/4 v9, 0x0

    invoke-virtual {v8, v0, v9, v5}, Ljava/io/OutputStream;->write([BII)V
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    goto :goto_0

    .line 267
    .end local v0    # "buf":[B
    .end local v5    # "len":I
    :catch_0
    move-exception v3

    move-object v7, v8

    .line 268
    .end local v1    # "dbPath":Ljava/lang/String;
    .end local v2    # "dbPathFile":Ljava/io/File;
    .end local v6    # "newDbFile":Ljava/io/File;
    .end local v8    # "out":Ljava/io/OutputStream;
    .local v3, "e":Ljava/io/IOException;
    .restart local v7    # "out":Ljava/io/OutputStream;
    :goto_1
    :try_start_2
    const-string v9, "createFromAssets"

    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    const-string v11, "No prepopulated DB found, Error="

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v3}, Ljava/io/IOException;->getMessage()Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-static {v9, v10}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 270
    if-eqz v4, :cond_1

    .line 272
    :try_start_3
    invoke-virtual {v4}, Ljava/io/InputStream;->close()V
    :try_end_3
    .catch Ljava/io/IOException; {:try_start_3 .. :try_end_3} :catch_3

    .line 277
    :cond_1
    :goto_2
    if-eqz v7, :cond_2

    .line 279
    :try_start_4
    invoke-virtual {v7}, Ljava/io/OutputStream;->close()V
    :try_end_4
    .catch Ljava/io/IOException; {:try_start_4 .. :try_end_4} :catch_4

    .line 284
    .end local v3    # "e":Ljava/io/IOException;
    :cond_2
    :goto_3
    return-void

    .line 266
    .end local v7    # "out":Ljava/io/OutputStream;
    .restart local v0    # "buf":[B
    .restart local v1    # "dbPath":Ljava/lang/String;
    .restart local v2    # "dbPathFile":Ljava/io/File;
    .restart local v5    # "len":I
    .restart local v6    # "newDbFile":Ljava/io/File;
    .restart local v8    # "out":Ljava/io/OutputStream;
    :cond_3
    :try_start_5
    const-string v9, "info"

    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    const-string v11, "Copied prepopulated DB content to: "

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v6}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-static {v9, v10}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_5
    .catch Ljava/io/IOException; {:try_start_5 .. :try_end_5} :catch_0
    .catchall {:try_start_5 .. :try_end_5} :catchall_1

    .line 270
    if-eqz v4, :cond_4

    .line 272
    :try_start_6
    invoke-virtual {v4}, Ljava/io/InputStream;->close()V
    :try_end_6
    .catch Ljava/io/IOException; {:try_start_6 .. :try_end_6} :catch_2

    .line 277
    :cond_4
    :goto_4
    if-eqz v8, :cond_7

    .line 279
    :try_start_7
    invoke-virtual {v8}, Ljava/io/OutputStream;->close()V
    :try_end_7
    .catch Ljava/io/IOException; {:try_start_7 .. :try_end_7} :catch_1

    move-object v7, v8

    .line 281
    .end local v8    # "out":Ljava/io/OutputStream;
    .restart local v7    # "out":Ljava/io/OutputStream;
    goto :goto_3

    .line 280
    .end local v7    # "out":Ljava/io/OutputStream;
    .restart local v8    # "out":Ljava/io/OutputStream;
    :catch_1
    move-exception v9

    move-object v7, v8

    .line 281
    .end local v8    # "out":Ljava/io/OutputStream;
    .restart local v7    # "out":Ljava/io/OutputStream;
    goto :goto_3

    .line 270
    .end local v0    # "buf":[B
    .end local v1    # "dbPath":Ljava/lang/String;
    .end local v2    # "dbPathFile":Ljava/io/File;
    .end local v5    # "len":I
    .end local v6    # "newDbFile":Ljava/io/File;
    :catchall_0
    move-exception v9

    :goto_5
    if-eqz v4, :cond_5

    .line 272
    :try_start_8
    invoke-virtual {v4}, Ljava/io/InputStream;->close()V
    :try_end_8
    .catch Ljava/io/IOException; {:try_start_8 .. :try_end_8} :catch_5

    .line 277
    :cond_5
    :goto_6
    if-eqz v7, :cond_6

    .line 279
    :try_start_9
    invoke-virtual {v7}, Ljava/io/OutputStream;->close()V
    :try_end_9
    .catch Ljava/io/IOException; {:try_start_9 .. :try_end_9} :catch_6

    .line 281
    :cond_6
    :goto_7
    throw v9

    .line 273
    .end local v7    # "out":Ljava/io/OutputStream;
    .restart local v0    # "buf":[B
    .restart local v1    # "dbPath":Ljava/lang/String;
    .restart local v2    # "dbPathFile":Ljava/io/File;
    .restart local v5    # "len":I
    .restart local v6    # "newDbFile":Ljava/io/File;
    .restart local v8    # "out":Ljava/io/OutputStream;
    :catch_2
    move-exception v9

    goto :goto_4

    .end local v0    # "buf":[B
    .end local v1    # "dbPath":Ljava/lang/String;
    .end local v2    # "dbPathFile":Ljava/io/File;
    .end local v5    # "len":I
    .end local v6    # "newDbFile":Ljava/io/File;
    .end local v8    # "out":Ljava/io/OutputStream;
    .restart local v3    # "e":Ljava/io/IOException;
    .restart local v7    # "out":Ljava/io/OutputStream;
    :catch_3
    move-exception v9

    goto :goto_2

    .line 280
    :catch_4
    move-exception v9

    goto :goto_3

    .line 273
    .end local v3    # "e":Ljava/io/IOException;
    :catch_5
    move-exception v10

    goto :goto_6

    .line 280
    :catch_6
    move-exception v10

    goto :goto_7

    .line 270
    .end local v7    # "out":Ljava/io/OutputStream;
    .restart local v1    # "dbPath":Ljava/lang/String;
    .restart local v2    # "dbPathFile":Ljava/io/File;
    .restart local v6    # "newDbFile":Ljava/io/File;
    .restart local v8    # "out":Ljava/io/OutputStream;
    :catchall_1
    move-exception v9

    move-object v7, v8

    .end local v8    # "out":Ljava/io/OutputStream;
    .restart local v7    # "out":Ljava/io/OutputStream;
    goto :goto_5

    .line 267
    .end local v1    # "dbPath":Ljava/lang/String;
    .end local v2    # "dbPathFile":Ljava/io/File;
    .end local v6    # "newDbFile":Ljava/io/File;
    :catch_7
    move-exception v3

    goto :goto_1

    .end local v7    # "out":Ljava/io/OutputStream;
    .restart local v0    # "buf":[B
    .restart local v1    # "dbPath":Ljava/lang/String;
    .restart local v2    # "dbPathFile":Ljava/io/File;
    .restart local v5    # "len":I
    .restart local v6    # "newDbFile":Ljava/io/File;
    .restart local v8    # "out":Ljava/io/OutputStream;
    :cond_7
    move-object v7, v8

    .end local v8    # "out":Ljava/io/OutputStream;
    .restart local v7    # "out":Ljava/io/OutputStream;
    goto :goto_3
.end method

.method private deleteDatabase(Ljava/lang/String;Lorg/apache/cordova/CallbackContext;)V
    .locals 6
    .param p1, "dbname"    # Ljava/lang/String;
    .param p2, "cbc"    # Lorg/apache/cordova/CallbackContext;

    .prologue
    .line 326
    sget-object v3, Lio/liteglue/SQLitePlugin;->dbrmap:Ljava/util/concurrent/ConcurrentHashMap;

    invoke-virtual {v3, p1}, Ljava/util/concurrent/ConcurrentHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lio/liteglue/SQLitePlugin$DBRunner;

    .line 327
    .local v2, "r":Lio/liteglue/SQLitePlugin$DBRunner;
    if-eqz v2, :cond_1

    .line 329
    :try_start_0
    iget-object v3, v2, Lio/liteglue/SQLitePlugin$DBRunner;->q:Ljava/util/concurrent/BlockingQueue;

    new-instance v4, Lio/liteglue/SQLitePlugin$DBQuery;

    const/4 v5, 0x1

    invoke-direct {v4, p0, v5, p2}, Lio/liteglue/SQLitePlugin$DBQuery;-><init>(Lio/liteglue/SQLitePlugin;ZLorg/apache/cordova/CallbackContext;)V

    invoke-interface {v3, v4}, Ljava/util/concurrent/BlockingQueue;->put(Ljava/lang/Object;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 344
    :goto_0
    return-void

    .line 330
    :catch_0
    move-exception v1

    .line 331
    .local v1, "e":Ljava/lang/Exception;
    if-eqz p2, :cond_0

    .line 332
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "couldn\'t close database"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p2, v3}, Lorg/apache/cordova/CallbackContext;->error(Ljava/lang/String;)V

    .line 334
    :cond_0
    const-class v3, Lio/liteglue/SQLitePlugin;

    invoke-virtual {v3}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v3

    const-string v4, "couldn\'t close database"

    invoke-static {v3, v4, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_0

    .line 337
    .end local v1    # "e":Ljava/lang/Exception;
    :cond_1
    invoke-direct {p0, p1}, Lio/liteglue/SQLitePlugin;->deleteDatabaseNow(Ljava/lang/String;)Z

    move-result v0

    .line 338
    .local v0, "deleteResult":Z
    if-eqz v0, :cond_2

    .line 339
    invoke-virtual {p2}, Lorg/apache/cordova/CallbackContext;->success()V

    goto :goto_0

    .line 341
    :cond_2
    const-string v3, "couldn\'t delete database"

    invoke-virtual {p2, v3}, Lorg/apache/cordova/CallbackContext;->error(Ljava/lang/String;)V

    goto :goto_0
.end method

.method private deleteDatabaseNow(Ljava/lang/String;)Z
    .locals 5
    .param p1, "dbname"    # Ljava/lang/String;

    .prologue
    .line 354
    iget-object v2, p0, Lio/liteglue/SQLitePlugin;->cordova:Lorg/apache/cordova/CordovaInterface;

    invoke-interface {v2}, Lorg/apache/cordova/CordovaInterface;->getActivity()Landroid/app/Activity;

    move-result-object v2

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, ".db"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Landroid/app/Activity;->getDatabasePath(Ljava/lang/String;)Ljava/io/File;

    move-result-object v0

    .line 357
    .local v0, "dbfile":Ljava/io/File;
    :try_start_0
    iget-object v2, p0, Lio/liteglue/SQLitePlugin;->cordova:Lorg/apache/cordova/CordovaInterface;

    invoke-interface {v2}, Lorg/apache/cordova/CordovaInterface;->getActivity()Landroid/app/Activity;

    move-result-object v2

    invoke-virtual {v0}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Landroid/app/Activity;->deleteDatabase(Ljava/lang/String;)Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result v2

    .line 360
    :goto_0
    return v2

    .line 358
    :catch_0
    move-exception v1

    .line 359
    .local v1, "e":Ljava/lang/Exception;
    const-class v2, Lio/liteglue/SQLitePlugin;

    invoke-virtual {v2}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v2

    const-string v3, "couldn\'t delete database"

    invoke-static {v2, v3, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 360
    const/4 v2, 0x0

    goto :goto_0
.end method

.method private executeAndPossiblyThrow(Lio/liteglue/SQLitePlugin$Action;Lorg/json/JSONArray;Lorg/apache/cordova/CallbackContext;)Z
    .locals 22
    .param p1, "action"    # Lio/liteglue/SQLitePlugin$Action;
    .param p2, "args"    # Lorg/json/JSONArray;
    .param p3, "cbc"    # Lorg/apache/cordova/CallbackContext;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .prologue
    .line 83
    const/16 v20, 0x1

    .line 87
    .local v20, "status":Z
    sget-object v4, Lio/liteglue/SQLitePlugin$1;->$SwitchMap$io$liteglue$SQLitePlugin$Action:[I

    invoke-virtual/range {p1 .. p1}, Lio/liteglue/SQLitePlugin$Action;->ordinal()I

    move-result v8

    aget v4, v4, v8

    packed-switch v4, :pswitch_data_0

    .line 158
    :goto_0
    return v20

    .line 89
    :pswitch_0
    const/4 v4, 0x0

    move-object/from16 v0, p2

    invoke-virtual {v0, v4}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v17

    .line 90
    .local v17, "o":Lorg/json/JSONObject;
    const-string v4, "name"

    move-object/from16 v0, v17

    invoke-virtual {v0, v4}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v12

    .line 92
    .local v12, "dbname":Ljava/lang/String;
    move-object/from16 v0, p0

    move-object/from16 v1, v17

    move-object/from16 v2, p3

    invoke-direct {v0, v12, v1, v2}, Lio/liteglue/SQLitePlugin;->startDatabase(Ljava/lang/String;Lorg/json/JSONObject;Lorg/apache/cordova/CallbackContext;)V

    goto :goto_0

    .line 96
    .end local v12    # "dbname":Ljava/lang/String;
    .end local v17    # "o":Lorg/json/JSONObject;
    :pswitch_1
    const/4 v4, 0x0

    move-object/from16 v0, p2

    invoke-virtual {v0, v4}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v17

    .line 97
    .restart local v17    # "o":Lorg/json/JSONObject;
    const-string v4, "path"

    move-object/from16 v0, v17

    invoke-virtual {v0, v4}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v12

    .line 99
    .restart local v12    # "dbname":Ljava/lang/String;
    move-object/from16 v0, p0

    move-object/from16 v1, p3

    invoke-direct {v0, v12, v1}, Lio/liteglue/SQLitePlugin;->closeDatabase(Ljava/lang/String;Lorg/apache/cordova/CallbackContext;)V

    goto :goto_0

    .line 103
    .end local v12    # "dbname":Ljava/lang/String;
    .end local v17    # "o":Lorg/json/JSONObject;
    :pswitch_2
    const/4 v4, 0x0

    move-object/from16 v0, p2

    invoke-virtual {v0, v4}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v17

    .line 104
    .restart local v17    # "o":Lorg/json/JSONObject;
    const-string v4, "path"

    move-object/from16 v0, v17

    invoke-virtual {v0, v4}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v12

    .line 106
    .restart local v12    # "dbname":Ljava/lang/String;
    move-object/from16 v0, p0

    move-object/from16 v1, p3

    invoke-direct {v0, v12, v1}, Lio/liteglue/SQLitePlugin;->deleteDatabase(Ljava/lang/String;Lorg/apache/cordova/CallbackContext;)V

    goto :goto_0

    .line 112
    .end local v12    # "dbname":Ljava/lang/String;
    .end local v17    # "o":Lorg/json/JSONObject;
    :pswitch_3
    const/4 v5, 0x0

    .line 113
    .local v5, "queries":[Ljava/lang/String;
    const/4 v6, 0x0

    .line 115
    .local v6, "queryIDs":[Ljava/lang/String;
    const/4 v15, 0x0

    .line 116
    .local v15, "jsonArr":Lorg/json/JSONArray;
    const/16 v18, 0x0

    .line 117
    .local v18, "paramLen":I
    const/4 v7, 0x0

    .line 119
    .local v7, "jsonparams":[Lorg/json/JSONArray;
    const/4 v4, 0x0

    move-object/from16 v0, p2

    invoke-virtual {v0, v4}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v10

    .line 120
    .local v10, "allargs":Lorg/json/JSONObject;
    const-string v4, "dbargs"

    invoke-virtual {v10, v4}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v11

    .line 121
    .local v11, "dbargs":Lorg/json/JSONObject;
    const-string v4, "dbname"

    invoke-virtual {v11, v4}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v12

    .line 122
    .restart local v12    # "dbname":Ljava/lang/String;
    const-string v4, "executes"

    invoke-virtual {v10, v4}, Lorg/json/JSONObject;->getJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v21

    .line 124
    .local v21, "txargs":Lorg/json/JSONArray;
    const/4 v4, 0x0

    move-object/from16 v0, v21

    invoke-virtual {v0, v4}, Lorg/json/JSONArray;->isNull(I)Z

    move-result v4

    if-eqz v4, :cond_1

    .line 125
    const/4 v4, 0x0

    new-array v5, v4, [Ljava/lang/String;

    .line 143
    :cond_0
    new-instance v3, Lio/liteglue/SQLitePlugin$DBQuery;

    move-object/from16 v4, p0

    move-object/from16 v8, p3

    invoke-direct/range {v3 .. v8}, Lio/liteglue/SQLitePlugin$DBQuery;-><init>(Lio/liteglue/SQLitePlugin;[Ljava/lang/String;[Ljava/lang/String;[Lorg/json/JSONArray;Lorg/apache/cordova/CallbackContext;)V

    .line 144
    .local v3, "q":Lio/liteglue/SQLitePlugin$DBQuery;
    sget-object v4, Lio/liteglue/SQLitePlugin;->dbrmap:Ljava/util/concurrent/ConcurrentHashMap;

    invoke-virtual {v4, v12}, Ljava/util/concurrent/ConcurrentHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v19

    check-cast v19, Lio/liteglue/SQLitePlugin$DBRunner;

    .line 145
    .local v19, "r":Lio/liteglue/SQLitePlugin$DBRunner;
    if-eqz v19, :cond_2

    .line 147
    :try_start_0
    move-object/from16 v0, v19

    iget-object v4, v0, Lio/liteglue/SQLitePlugin$DBRunner;->q:Ljava/util/concurrent/BlockingQueue;

    invoke-interface {v4, v3}, Ljava/util/concurrent/BlockingQueue;->put(Ljava/lang/Object;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto/16 :goto_0

    .line 148
    :catch_0
    move-exception v13

    .line 149
    .local v13, "e":Ljava/lang/Exception;
    const-class v4, Lio/liteglue/SQLitePlugin;

    invoke-virtual {v4}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v4

    const-string v8, "couldn\'t add to queue"

    invoke-static {v4, v8, v13}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 150
    const-string v4, "couldn\'t add to queue"

    move-object/from16 v0, p3

    invoke-virtual {v0, v4}, Lorg/apache/cordova/CallbackContext;->error(Ljava/lang/String;)V

    goto/16 :goto_0

    .line 127
    .end local v3    # "q":Lio/liteglue/SQLitePlugin$DBQuery;
    .end local v13    # "e":Ljava/lang/Exception;
    .end local v19    # "r":Lio/liteglue/SQLitePlugin$DBRunner;
    :cond_1
    invoke-virtual/range {v21 .. v21}, Lorg/json/JSONArray;->length()I

    move-result v16

    .line 128
    .local v16, "len":I
    move/from16 v0, v16

    new-array v5, v0, [Ljava/lang/String;

    .line 129
    move/from16 v0, v16

    new-array v6, v0, [Ljava/lang/String;

    .line 130
    move/from16 v0, v16

    new-array v7, v0, [Lorg/json/JSONArray;

    .line 132
    const/4 v14, 0x0

    .local v14, "i":I
    :goto_1
    move/from16 v0, v16

    if-ge v14, v0, :cond_0

    .line 133
    move-object/from16 v0, v21

    invoke-virtual {v0, v14}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v9

    .line 134
    .local v9, "a":Lorg/json/JSONObject;
    const-string v4, "sql"

    invoke-virtual {v9, v4}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    aput-object v4, v5, v14

    .line 135
    const-string v4, "qid"

    invoke-virtual {v9, v4}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    aput-object v4, v6, v14

    .line 136
    const-string v4, "params"

    invoke-virtual {v9, v4}, Lorg/json/JSONObject;->getJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v15

    .line 137
    invoke-virtual {v15}, Lorg/json/JSONArray;->length()I

    move-result v18

    .line 138
    aput-object v15, v7, v14

    .line 132
    add-int/lit8 v14, v14, 0x1

    goto :goto_1

    .line 153
    .end local v9    # "a":Lorg/json/JSONObject;
    .end local v14    # "i":I
    .end local v16    # "len":I
    .restart local v3    # "q":Lio/liteglue/SQLitePlugin$DBQuery;
    .restart local v19    # "r":Lio/liteglue/SQLitePlugin$DBRunner;
    :cond_2
    const-string v4, "database not open"

    move-object/from16 v0, p3

    invoke-virtual {v0, v4}, Lorg/apache/cordova/CallbackContext;->error(Ljava/lang/String;)V

    goto/16 :goto_0

    .line 87
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_1
        :pswitch_2
        :pswitch_3
        :pswitch_3
    .end packed-switch
.end method

.method private openDatabase(Ljava/lang/String;ZLorg/apache/cordova/CallbackContext;Z)Lio/liteglue/SQLiteAndroidDatabase;
    .locals 7
    .param p1, "dbname"    # Ljava/lang/String;
    .param p2, "createFromAssets"    # Z
    .param p3, "cbc"    # Lorg/apache/cordova/CallbackContext;
    .param p4, "old_impl"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 215
    :try_start_0
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-static {}, Lcom/belkin/utils/RuleUtility;->getLocalDBPath()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-static {}, Lcom/belkin/utils/RuleUtility;->getLocalDBName()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 216
    .local v1, "dbfilePath":Ljava/lang/String;
    new-instance v0, Ljava/io/File;

    invoke-direct {v0, v1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 218
    .local v0, "dbfile":Ljava/io/File;
    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result v4

    if-nez v4, :cond_0

    .line 219
    invoke-virtual {v0}, Ljava/io/File;->getParentFile()Ljava/io/File;

    move-result-object v4

    invoke-virtual {v4}, Ljava/io/File;->mkdirs()Z

    .line 222
    :cond_0
    const-string v4, "info"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "Open sqlite db: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v0}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 224
    if-eqz p4, :cond_2

    new-instance v3, Lio/liteglue/SQLiteAndroidDatabase;

    invoke-direct {v3}, Lio/liteglue/SQLiteAndroidDatabase;-><init>()V

    .line 225
    .local v3, "mydb":Lio/liteglue/SQLiteAndroidDatabase;
    :goto_0
    invoke-virtual {v3, v0}, Lio/liteglue/SQLiteAndroidDatabase;->open(Ljava/io/File;)V

    .line 227
    if-eqz p3, :cond_1

    .line 228
    invoke-virtual {p3}, Lorg/apache/cordova/CallbackContext;->success()V

    .line 230
    :cond_1
    return-object v3

    .line 224
    .end local v3    # "mydb":Lio/liteglue/SQLiteAndroidDatabase;
    :cond_2
    new-instance v3, Lio/liteglue/SQLitePlugin$SQLiteDatabaseNDK;

    invoke-direct {v3, p0}, Lio/liteglue/SQLitePlugin$SQLiteDatabaseNDK;-><init>(Lio/liteglue/SQLitePlugin;)V
    :try_end_0
    .catch Lcom/almworks/sqlite4java/SQLiteException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 231
    .end local v0    # "dbfile":Ljava/io/File;
    .end local v1    # "dbfilePath":Ljava/lang/String;
    :catch_0
    move-exception v2

    .line 232
    .local v2, "e":Lcom/almworks/sqlite4java/SQLiteException;
    if-eqz p3, :cond_3

    .line 233
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "can\'t open database "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {p3, v4}, Lorg/apache/cordova/CallbackContext;->error(Ljava/lang/String;)V

    .line 234
    :cond_3
    throw v2
.end method

.method private startDatabase(Ljava/lang/String;Lorg/json/JSONObject;Lorg/apache/cordova/CallbackContext;)V
    .locals 2
    .param p1, "dbname"    # Ljava/lang/String;
    .param p2, "options"    # Lorg/json/JSONObject;
    .param p3, "cbc"    # Lorg/apache/cordova/CallbackContext;

    .prologue
    .line 189
    sget-object v1, Lio/liteglue/SQLitePlugin;->dbrmap:Ljava/util/concurrent/ConcurrentHashMap;

    invoke-virtual {v1, p1}, Ljava/util/concurrent/ConcurrentHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lio/liteglue/SQLitePlugin$DBRunner;

    .line 192
    .local v0, "r":Lio/liteglue/SQLitePlugin$DBRunner;
    if-eqz v0, :cond_0

    .line 196
    invoke-virtual {p3}, Lorg/apache/cordova/CallbackContext;->success()V

    .line 202
    :goto_0
    return-void

    .line 198
    :cond_0
    new-instance v0, Lio/liteglue/SQLitePlugin$DBRunner;

    .end local v0    # "r":Lio/liteglue/SQLitePlugin$DBRunner;
    invoke-direct {v0, p0, p1, p2, p3}, Lio/liteglue/SQLitePlugin$DBRunner;-><init>(Lio/liteglue/SQLitePlugin;Ljava/lang/String;Lorg/json/JSONObject;Lorg/apache/cordova/CallbackContext;)V

    .line 199
    .restart local v0    # "r":Lio/liteglue/SQLitePlugin$DBRunner;
    sget-object v1, Lio/liteglue/SQLitePlugin;->dbrmap:Ljava/util/concurrent/ConcurrentHashMap;

    invoke-virtual {v1, p1, v0}, Ljava/util/concurrent/ConcurrentHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 200
    iget-object v1, p0, Lio/liteglue/SQLitePlugin;->cordova:Lorg/apache/cordova/CordovaInterface;

    invoke-interface {v1}, Lorg/apache/cordova/CordovaInterface;->getThreadPool()Ljava/util/concurrent/ExecutorService;

    move-result-object v1

    invoke-interface {v1, v0}, Ljava/util/concurrent/ExecutorService;->execute(Ljava/lang/Runnable;)V

    goto :goto_0
.end method


# virtual methods
.method public execute(Ljava/lang/String;Lorg/json/JSONArray;Lorg/apache/cordova/CallbackContext;)Z
    .locals 5
    .param p1, "actionAsString"    # Ljava/lang/String;
    .param p2, "args"    # Lorg/json/JSONArray;
    .param p3, "cbc"    # Lorg/apache/cordova/CallbackContext;

    .prologue
    const/4 v2, 0x0

    .line 64
    :try_start_0
    invoke-static {p1}, Lio/liteglue/SQLitePlugin$Action;->valueOf(Ljava/lang/String;)Lio/liteglue/SQLitePlugin$Action;
    :try_end_0
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v0

    .line 72
    .local v0, "action":Lio/liteglue/SQLitePlugin$Action;
    :try_start_1
    invoke-direct {p0, v0, p2, p3}, Lio/liteglue/SQLitePlugin;->executeAndPossiblyThrow(Lio/liteglue/SQLitePlugin$Action;Lorg/json/JSONArray;Lorg/apache/cordova/CallbackContext;)Z
    :try_end_1
    .catch Lorg/json/JSONException; {:try_start_1 .. :try_end_1} :catch_1

    move-result v2

    .line 76
    .end local v0    # "action":Lio/liteglue/SQLitePlugin$Action;
    :goto_0
    return v2

    .line 65
    :catch_0
    move-exception v1

    .line 67
    .local v1, "e":Ljava/lang/IllegalArgumentException;
    const-class v3, Lio/liteglue/SQLitePlugin;

    invoke-virtual {v3}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v3

    const-string v4, "unexpected error"

    invoke-static {v3, v4, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_0

    .line 73
    .end local v1    # "e":Ljava/lang/IllegalArgumentException;
    .restart local v0    # "action":Lio/liteglue/SQLitePlugin$Action;
    :catch_1
    move-exception v1

    .line 75
    .local v1, "e":Lorg/json/JSONException;
    const-class v3, Lio/liteglue/SQLitePlugin;

    invoke-virtual {v3}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v3

    const-string v4, "unexpected error"

    invoke-static {v3, v4, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_0
.end method

.method public onDestroy()V
    .locals 5

    .prologue
    .line 166
    :goto_0
    sget-object v3, Lio/liteglue/SQLitePlugin;->dbrmap:Ljava/util/concurrent/ConcurrentHashMap;

    invoke-virtual {v3}, Ljava/util/concurrent/ConcurrentHashMap;->isEmpty()Z

    move-result v3

    if-nez v3, :cond_0

    .line 167
    sget-object v3, Lio/liteglue/SQLitePlugin;->dbrmap:Ljava/util/concurrent/ConcurrentHashMap;

    invoke-virtual {v3}, Ljava/util/concurrent/ConcurrentHashMap;->keySet()Ljava/util/Set;

    move-result-object v3

    invoke-interface {v3}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v3

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    .line 169
    .local v0, "dbname":Ljava/lang/String;
    invoke-direct {p0, v0}, Lio/liteglue/SQLitePlugin;->closeDatabaseNow(Ljava/lang/String;)V

    .line 171
    sget-object v3, Lio/liteglue/SQLitePlugin;->dbrmap:Ljava/util/concurrent/ConcurrentHashMap;

    invoke-virtual {v3, v0}, Ljava/util/concurrent/ConcurrentHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lio/liteglue/SQLitePlugin$DBRunner;

    .line 174
    .local v2, "r":Lio/liteglue/SQLitePlugin$DBRunner;
    :try_start_0
    iget-object v3, v2, Lio/liteglue/SQLitePlugin$DBRunner;->q:Ljava/util/concurrent/BlockingQueue;

    new-instance v4, Lio/liteglue/SQLitePlugin$DBQuery;

    invoke-direct {v4, p0}, Lio/liteglue/SQLitePlugin$DBQuery;-><init>(Lio/liteglue/SQLitePlugin;)V

    invoke-interface {v3, v4}, Ljava/util/concurrent/BlockingQueue;->put(Ljava/lang/Object;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 178
    :goto_1
    sget-object v3, Lio/liteglue/SQLitePlugin;->dbrmap:Ljava/util/concurrent/ConcurrentHashMap;

    invoke-virtual {v3, v0}, Ljava/util/concurrent/ConcurrentHashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_0

    .line 175
    :catch_0
    move-exception v1

    .line 176
    .local v1, "e":Ljava/lang/Exception;
    const-class v3, Lio/liteglue/SQLitePlugin;

    invoke-virtual {v3}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v3

    const-string v4, "couldn\'t stop db thread"

    invoke-static {v3, v4, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_1

    .line 180
    .end local v0    # "dbname":Ljava/lang/String;
    .end local v1    # "e":Ljava/lang/Exception;
    .end local v2    # "r":Lio/liteglue/SQLitePlugin$DBRunner;
    :cond_0
    return-void
.end method
