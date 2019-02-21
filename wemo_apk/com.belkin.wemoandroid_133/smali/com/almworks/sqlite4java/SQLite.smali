.class public final Lcom/almworks/sqlite4java/SQLite;
.super Ljava/lang/Object;
.source "SQLite.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/almworks/sqlite4java/SQLite$1;,
        Lcom/almworks/sqlite4java/SQLite$NiceFormatter;
    }
.end annotation


# static fields
.field public static final LIBRARY_PATH_PROPERTY:Ljava/lang/String; = "sqlite4java.library.path"

.field private static debugBinaryPreferred:Z

.field private static jarVersion:Ljava/lang/String;

.field private static libraryLoaded:Z

.field private static threadSafe:Ljava/lang/Boolean;


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .prologue
    const/4 v2, 0x0

    .line 45
    const-string v0, "true"

    const-string v1, "sqlite4java.debug.binary.preferred"

    invoke-static {v1}, Ljava/lang/System;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    sput-boolean v0, Lcom/almworks/sqlite4java/SQLite;->debugBinaryPreferred:Z

    .line 46
    const/4 v0, 0x0

    sput-boolean v0, Lcom/almworks/sqlite4java/SQLite;->libraryLoaded:Z

    .line 47
    sput-object v2, Lcom/almworks/sqlite4java/SQLite;->jarVersion:Ljava/lang/String;

    .line 48
    sput-object v2, Lcom/almworks/sqlite4java/SQLite;->threadSafe:Ljava/lang/Boolean;

    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .prologue
    .line 341
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 342
    return-void
.end method

.method public static declared-synchronized getLibraryVersion()Ljava/lang/String;
    .locals 15

    .prologue
    const/4 v9, 0x0

    .line 278
    const-class v10, Lcom/almworks/sqlite4java/SQLite;

    monitor-enter v10

    :try_start_0
    sget-object v11, Lcom/almworks/sqlite4java/SQLite;->jarVersion:Ljava/lang/String;

    if-nez v11, :cond_4

    .line 279
    new-instance v11, Ljava/lang/StringBuilder;

    invoke-direct {v11}, Ljava/lang/StringBuilder;-><init>()V

    const-class v12, Lcom/almworks/sqlite4java/SQLite;

    invoke-virtual {v12}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v12

    const/16 v13, 0x2e

    const/16 v14, 0x2f

    invoke-virtual {v12, v13, v14}, Ljava/lang/String;->replace(CC)Ljava/lang/String;

    move-result-object v12

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    const-string v12, ".class"

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    .line 280
    .local v6, "name":Ljava/lang/String;
    const-class v11, Lcom/almworks/sqlite4java/SQLite;

    invoke-virtual {v11}, Ljava/lang/Class;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object v11

    invoke-virtual {v11, v6}, Ljava/lang/ClassLoader;->getResource(Ljava/lang/String;)Ljava/net/URL;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    move-result-object v8

    .line 281
    .local v8, "url":Ljava/net/URL;
    if-nez v8, :cond_1

    .line 310
    :cond_0
    :goto_0
    monitor-exit v10

    return-object v9

    .line 283
    :cond_1
    :try_start_1
    invoke-virtual {v8}, Ljava/net/URL;->toString()Ljava/lang/String;

    move-result-object v7

    .line 284
    .local v7, "s":Ljava/lang/String;
    const-string v11, "jar:"

    invoke-virtual {v7, v11}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v11

    if-eqz v11, :cond_0

    .line 286
    const/16 v11, 0x21

    invoke-virtual {v7, v11}, Ljava/lang/String;->lastIndexOf(I)I

    move-result v3

    .line 287
    .local v3, "k":I
    if-ltz v3, :cond_0

    .line 289
    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const/4 v11, 0x0

    add-int/lit8 v12, v3, 0x1

    invoke-virtual {v7, v11, v12}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v9, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    const-string v11, "/META-INF/MANIFEST.MF"

    invoke-virtual {v9, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    move-result-object v7

    .line 290
    const/4 v2, 0x0

    .line 291
    .local v2, "input":Ljava/io/InputStream;
    const/4 v4, 0x0

    .line 293
    .local v4, "manifest":Ljava/util/jar/Manifest;
    :try_start_2
    new-instance v9, Ljava/net/URL;

    invoke-direct {v9, v7}, Ljava/net/URL;-><init>(Ljava/lang/String;)V

    invoke-virtual {v9}, Ljava/net/URL;->openStream()Ljava/io/InputStream;

    move-result-object v2

    .line 294
    new-instance v5, Ljava/util/jar/Manifest;

    invoke-direct {v5, v2}, Ljava/util/jar/Manifest;-><init>(Ljava/io/InputStream;)V
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_1
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 299
    .end local v4    # "manifest":Ljava/util/jar/Manifest;
    .local v5, "manifest":Ljava/util/jar/Manifest;
    if-eqz v2, :cond_2

    :try_start_3
    invoke-virtual {v2}, Ljava/io/InputStream;->close()V
    :try_end_3
    .catch Ljava/io/IOException; {:try_start_3 .. :try_end_3} :catch_0
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    :cond_2
    move-object v4, v5

    .line 302
    .end local v5    # "manifest":Ljava/util/jar/Manifest;
    .restart local v4    # "manifest":Ljava/util/jar/Manifest;
    :cond_3
    :goto_1
    if-eqz v4, :cond_4

    .line 303
    :try_start_4
    invoke-virtual {v4}, Ljava/util/jar/Manifest;->getMainAttributes()Ljava/util/jar/Attributes;

    move-result-object v0

    .line 304
    .local v0, "attr":Ljava/util/jar/Attributes;
    const-string v9, "Implementation-Version"

    invoke-virtual {v0, v9}, Ljava/util/jar/Attributes;->getValue(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v9

    sput-object v9, Lcom/almworks/sqlite4java/SQLite;->jarVersion:Ljava/lang/String;

    .line 307
    .end local v0    # "attr":Ljava/util/jar/Attributes;
    :cond_4
    sget-object v9, Lcom/almworks/sqlite4java/SQLite;->jarVersion:Ljava/lang/String;

    if-nez v9, :cond_5

    .line 308
    const-class v9, Lcom/almworks/sqlite4java/SQLite;

    const-string v11, "unknown jar version"

    invoke-static {v9, v11}, Lcom/almworks/sqlite4java/Internal;->logWarn(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 310
    :cond_5
    sget-object v9, Lcom/almworks/sqlite4java/SQLite;->jarVersion:Ljava/lang/String;
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_1

    goto :goto_0

    .line 300
    .end local v4    # "manifest":Ljava/util/jar/Manifest;
    .restart local v5    # "manifest":Ljava/util/jar/Manifest;
    :catch_0
    move-exception v9

    move-object v4, v5

    .line 301
    .end local v5    # "manifest":Ljava/util/jar/Manifest;
    .restart local v4    # "manifest":Ljava/util/jar/Manifest;
    goto :goto_1

    .line 295
    :catch_1
    move-exception v1

    .line 296
    .local v1, "e":Ljava/io/IOException;
    :try_start_5
    const-class v9, Lcom/almworks/sqlite4java/SQLite;

    new-instance v11, Ljava/lang/StringBuilder;

    invoke-direct {v11}, Ljava/lang/StringBuilder;-><init>()V

    const-string v12, "error reading jar manifest"

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v11

    invoke-static {v9, v11}, Lcom/almworks/sqlite4java/Internal;->logWarn(Ljava/lang/Object;Ljava/lang/Object;)V
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    .line 299
    if-eqz v2, :cond_3

    :try_start_6
    invoke-virtual {v2}, Ljava/io/InputStream;->close()V
    :try_end_6
    .catch Ljava/io/IOException; {:try_start_6 .. :try_end_6} :catch_2
    .catchall {:try_start_6 .. :try_end_6} :catchall_1

    goto :goto_1

    .line 300
    :catch_2
    move-exception v9

    goto :goto_1

    .line 298
    .end local v1    # "e":Ljava/io/IOException;
    :catchall_0
    move-exception v9

    .line 299
    if-eqz v2, :cond_6

    :try_start_7
    invoke-virtual {v2}, Ljava/io/InputStream;->close()V
    :try_end_7
    .catch Ljava/io/IOException; {:try_start_7 .. :try_end_7} :catch_3
    .catchall {:try_start_7 .. :try_end_7} :catchall_1

    .line 300
    :cond_6
    :goto_2
    :try_start_8
    throw v9
    :try_end_8
    .catchall {:try_start_8 .. :try_end_8} :catchall_1

    .line 278
    .end local v2    # "input":Ljava/io/InputStream;
    .end local v3    # "k":I
    .end local v4    # "manifest":Ljava/util/jar/Manifest;
    .end local v7    # "s":Ljava/lang/String;
    .end local v8    # "url":Ljava/net/URL;
    :catchall_1
    move-exception v9

    monitor-exit v10

    throw v9

    .line 300
    .restart local v2    # "input":Ljava/io/InputStream;
    .restart local v3    # "k":I
    .restart local v4    # "manifest":Ljava/util/jar/Manifest;
    .restart local v7    # "s":Ljava/lang/String;
    .restart local v8    # "url":Ljava/net/URL;
    :catch_3
    move-exception v11

    goto :goto_2
.end method

.method public static getMemoryHighwater(Z)J
    .locals 2
    .param p0, "reset"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/almworks/sqlite4java/SQLiteException;
        }
    .end annotation

    .prologue
    .line 206
    invoke-static {}, Lcom/almworks/sqlite4java/SQLite;->loadLibrary()V

    .line 207
    if-eqz p0, :cond_0

    const/4 v0, 0x1

    :goto_0
    invoke-static {v0}, Lcom/almworks/sqlite4java/_SQLiteSwigged;->sqlite3_memory_highwater(I)J

    move-result-wide v0

    return-wide v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public static getMemoryUsed()J
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/almworks/sqlite4java/SQLiteException;
        }
    .end annotation

    .prologue
    .line 191
    invoke-static {}, Lcom/almworks/sqlite4java/SQLite;->loadLibrary()V

    .line 192
    invoke-static {}, Lcom/almworks/sqlite4java/_SQLiteSwigged;->sqlite3_memory_used()J

    move-result-wide v0

    return-wide v0
.end method

.method public static getSQLiteCompileOptions()Ljava/lang/String;
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/almworks/sqlite4java/SQLiteException;
        }
    .end annotation

    .prologue
    .line 126
    invoke-static {}, Lcom/almworks/sqlite4java/SQLite;->loadLibrary()V

    .line 127
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 128
    .local v0, "b":Ljava/lang/StringBuilder;
    const/4 v1, 0x0

    .line 130
    .local v1, "i":I
    :goto_0
    add-int/lit8 v2, v1, 0x1

    .end local v1    # "i":I
    .local v2, "i":I
    invoke-static {v1}, Lcom/almworks/sqlite4java/_SQLiteSwigged;->sqlite3_compileoption_get(I)Ljava/lang/String;

    move-result-object v3

    .line 131
    .local v3, "option":Ljava/lang/String;
    if-eqz v3, :cond_0

    invoke-virtual {v3}, Ljava/lang/String;->length()I

    move-result v4

    if-nez v4, :cond_1

    .line 135
    :cond_0
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    return-object v4

    .line 132
    :cond_1
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->length()I

    move-result v4

    if-lez v4, :cond_2

    const/16 v4, 0x20

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 133
    :cond_2
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move v1, v2

    .line 134
    .end local v2    # "i":I
    .restart local v1    # "i":I
    goto :goto_0
.end method

.method public static getSQLiteVersion()Ljava/lang/String;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/almworks/sqlite4java/SQLiteException;
        }
    .end annotation

    .prologue
    .line 114
    invoke-static {}, Lcom/almworks/sqlite4java/SQLite;->loadLibrary()V

    .line 115
    invoke-static {}, Lcom/almworks/sqlite4java/_SQLiteSwigged;->sqlite3_libversion()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static getSQLiteVersionNumber()I
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/almworks/sqlite4java/SQLiteException;
        }
    .end annotation

    .prologue
    .line 146
    invoke-static {}, Lcom/almworks/sqlite4java/SQLite;->loadLibrary()V

    .line 147
    invoke-static {}, Lcom/almworks/sqlite4java/_SQLiteSwigged;->sqlite3_libversion_number()I

    move-result v0

    return v0
.end method

.method public static isComplete(Ljava/lang/String;)Z
    .locals 1
    .param p0, "sql"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/almworks/sqlite4java/SQLiteException;
        }
    .end annotation

    .prologue
    .line 176
    invoke-static {}, Lcom/almworks/sqlite4java/SQLite;->loadLibrary()V

    .line 177
    invoke-static {p0}, Lcom/almworks/sqlite4java/_SQLiteSwigged;->sqlite3_complete(Ljava/lang/String;)I

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public static declared-synchronized isDebugBinaryPreferred()Z
    .locals 2

    .prologue
    .line 83
    const-class v0, Lcom/almworks/sqlite4java/SQLite;

    monitor-enter v0

    :try_start_0
    sget-boolean v1, Lcom/almworks/sqlite4java/SQLite;->debugBinaryPreferred:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit v0

    return v1

    :catchall_0
    move-exception v1

    monitor-exit v0

    throw v1
.end method

.method public static isThreadSafe()Z
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/almworks/sqlite4java/SQLiteException;
        }
    .end annotation

    .prologue
    .line 159
    sget-object v0, Lcom/almworks/sqlite4java/SQLite;->threadSafe:Ljava/lang/Boolean;

    .line 160
    .local v0, "cachedResult":Ljava/lang/Boolean;
    if-eqz v0, :cond_0

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v1

    .line 164
    :goto_0
    return v1

    .line 161
    :cond_0
    invoke-static {}, Lcom/almworks/sqlite4java/SQLite;->loadLibrary()V

    .line 162
    invoke-static {}, Lcom/almworks/sqlite4java/_SQLiteSwigged;->sqlite3_threadsafe()I

    move-result v2

    if-eqz v2, :cond_1

    const/4 v1, 0x1

    .line 163
    .local v1, "r":Z
    :goto_1
    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v2

    sput-object v2, Lcom/almworks/sqlite4java/SQLite;->threadSafe:Ljava/lang/Boolean;

    goto :goto_0

    .line 162
    .end local v1    # "r":Z
    :cond_1
    const/4 v1, 0x0

    goto :goto_1
.end method

.method public static declared-synchronized loadLibrary()V
    .locals 7
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/almworks/sqlite4java/SQLiteException;
        }
    .end annotation

    .prologue
    .line 94
    const-class v3, Lcom/almworks/sqlite4java/SQLite;

    monitor-enter v3

    :try_start_0
    sget-boolean v2, Lcom/almworks/sqlite4java/SQLite;->libraryLoaded:Z

    if-nez v2, :cond_1

    .line 95
    invoke-static {}, Lcom/almworks/sqlite4java/Internal;->loadLibraryX()Ljava/lang/Throwable;

    move-result-object v0

    .line 96
    .local v0, "t":Ljava/lang/Throwable;
    if-eqz v0, :cond_0

    .line 97
    new-instance v2, Lcom/almworks/sqlite4java/SQLiteException;

    const/16 v4, -0x5b

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "cannot load library: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v2, v4, v5, v0}, Lcom/almworks/sqlite4java/SQLiteException;-><init>(ILjava/lang/String;Ljava/lang/Throwable;)V

    throw v2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 94
    :catchall_0
    move-exception v2

    monitor-exit v3

    throw v2

    .line 98
    :cond_0
    const/4 v2, 0x1

    :try_start_1
    sput-boolean v2, Lcom/almworks/sqlite4java/SQLite;->libraryLoaded:Z

    .line 99
    invoke-static {}, Lcom/almworks/sqlite4java/_SQLiteSwigged;->sqlite3_threadsafe()I

    move-result v1

    .line 100
    .local v1, "threadSafe":I
    if-nez v1, :cond_1

    .line 101
    const-class v2, Lcom/almworks/sqlite4java/SQLite;

    const-string v4, "library is not thread-safe"

    invoke-static {v2, v4}, Lcom/almworks/sqlite4java/Internal;->logWarn(Ljava/lang/Object;Ljava/lang/Object;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 104
    :cond_1
    monitor-exit v3

    return-void
.end method

.method public static main([Ljava/lang/String;)V
    .locals 11
    .param p0, "args"    # [Ljava/lang/String;

    .prologue
    const/4 v6, 0x0

    .line 352
    array-length v8, p0

    if-lez v8, :cond_1

    const-string v8, "-d"

    const/4 v9, 0x0

    aget-object v9, p0, v9

    invoke-virtual {v8, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_1

    .line 354
    const-string v8, "com.almworks.sqlite4java"

    invoke-static {v8}, Ljava/util/logging/Logger;->getLogger(Ljava/lang/String;)Ljava/util/logging/Logger;

    move-result-object v8

    sget-object v9, Ljava/util/logging/Level;->FINE:Ljava/util/logging/Level;

    invoke-virtual {v8, v9}, Ljava/util/logging/Logger;->setLevel(Ljava/util/logging/Level;)V

    .line 355
    const-string v8, ""

    invoke-static {v8}, Ljava/util/logging/Logger;->getLogger(Ljava/lang/String;)Ljava/util/logging/Logger;

    move-result-object v8

    invoke-virtual {v8}, Ljava/util/logging/Logger;->getHandlers()[Ljava/util/logging/Handler;

    move-result-object v3

    .line 356
    .local v3, "handlers":[Ljava/util/logging/Handler;
    move-object v0, v3

    .local v0, "arr$":[Ljava/util/logging/Handler;
    array-length v5, v0

    .local v5, "len$":I
    const/4 v4, 0x0

    .local v4, "i$":I
    :goto_0
    if-ge v4, v5, :cond_2

    aget-object v2, v0, v4

    .line 357
    .local v2, "handler":Ljava/util/logging/Handler;
    instance-of v8, v2, Ljava/util/logging/ConsoleHandler;

    if-eqz v8, :cond_0

    .line 358
    sget-object v8, Ljava/util/logging/Level;->FINE:Ljava/util/logging/Level;

    invoke-virtual {v2, v8}, Ljava/util/logging/Handler;->setLevel(Ljava/util/logging/Level;)V

    .line 359
    new-instance v8, Lcom/almworks/sqlite4java/SQLite$NiceFormatter;

    invoke-direct {v8, v6}, Lcom/almworks/sqlite4java/SQLite$NiceFormatter;-><init>(Lcom/almworks/sqlite4java/SQLite$1;)V

    invoke-virtual {v2, v8}, Ljava/util/logging/Handler;->setFormatter(Ljava/util/logging/Formatter;)V

    .line 356
    :cond_0
    add-int/lit8 v4, v4, 0x1

    goto :goto_0

    .line 363
    .end local v0    # "arr$":[Ljava/util/logging/Handler;
    .end local v2    # "handler":Ljava/util/logging/Handler;
    .end local v3    # "handlers":[Ljava/util/logging/Handler;
    .end local v4    # "i$":I
    .end local v5    # "len$":I
    :cond_1
    const-string v8, "com.almworks.sqlite4java"

    invoke-static {v8}, Ljava/util/logging/Logger;->getLogger(Ljava/lang/String;)Ljava/util/logging/Logger;

    move-result-object v8

    sget-object v9, Ljava/util/logging/Level;->SEVERE:Ljava/util/logging/Level;

    invoke-virtual {v8, v9}, Ljava/util/logging/Logger;->setLevel(Ljava/util/logging/Level;)V

    .line 365
    :cond_2
    invoke-static {}, Lcom/almworks/sqlite4java/SQLite;->getLibraryVersion()Ljava/lang/String;

    move-result-object v7

    .line 366
    .local v7, "v":Ljava/lang/String;
    if-nez v7, :cond_3

    const-string v7, "(UNKNOWN VERSION)"

    .line 367
    :cond_3
    sget-object v8, Ljava/lang/System;->out:Ljava/io/PrintStream;

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "sqlite4java "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 368
    sget-boolean v8, Lcom/almworks/sqlite4java/SQLite;->libraryLoaded:Z

    if-eqz v8, :cond_4

    .line 369
    .local v6, "t":Ljava/lang/Throwable;
    :goto_1
    if-eqz v6, :cond_5

    .line 370
    sget-object v8, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v9, "Error: cannot load SQLite"

    invoke-virtual {v8, v9}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 371
    invoke-virtual {v6}, Ljava/lang/Throwable;->printStackTrace()V

    .line 380
    :goto_2
    return-void

    .line 368
    .end local v6    # "t":Ljava/lang/Throwable;
    :cond_4
    invoke-static {}, Lcom/almworks/sqlite4java/Internal;->loadLibraryX()Ljava/lang/Throwable;

    move-result-object v6

    goto :goto_1

    .line 374
    .restart local v6    # "t":Ljava/lang/Throwable;
    :cond_5
    :try_start_0
    sget-object v8, Ljava/lang/System;->out:Ljava/io/PrintStream;

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "SQLite "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-static {}, Lcom/almworks/sqlite4java/SQLite;->getSQLiteVersion()Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 375
    sget-object v8, Ljava/lang/System;->out:Ljava/io/PrintStream;

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "Compile-time options: "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-static {}, Lcom/almworks/sqlite4java/SQLite;->getSQLiteCompileOptions()Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V
    :try_end_0
    .catch Lcom/almworks/sqlite4java/SQLiteException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_2

    .line 376
    :catch_0
    move-exception v1

    .line 377
    .local v1, "e":Lcom/almworks/sqlite4java/SQLiteException;
    invoke-virtual {v1}, Lcom/almworks/sqlite4java/SQLiteException;->printStackTrace()V

    goto :goto_2
.end method

.method public static releaseMemory(I)I
    .locals 1
    .param p0, "bytes"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/almworks/sqlite4java/SQLiteException;
        }
    .end annotation

    .prologue
    .line 219
    invoke-static {}, Lcom/almworks/sqlite4java/SQLite;->loadLibrary()V

    .line 220
    invoke-static {p0}, Lcom/almworks/sqlite4java/_SQLiteSwigged;->sqlite3_release_memory(I)I

    move-result v0

    return v0
.end method

.method public static declared-synchronized setDebugBinaryPreferred(Z)V
    .locals 3
    .param p0, "debug"    # Z

    .prologue
    .line 69
    const-class v1, Lcom/almworks/sqlite4java/SQLite;

    monitor-enter v1

    :try_start_0
    sget-boolean v0, Lcom/almworks/sqlite4java/SQLite;->libraryLoaded:Z

    if-eqz v0, :cond_0

    .line 70
    const-class v0, Lcom/almworks/sqlite4java/SQLite;

    const-string v2, "cannot set library preference, library already loaded"

    invoke-static {v0, v2}, Lcom/almworks/sqlite4java/Internal;->logWarn(Ljava/lang/Object;Ljava/lang/Object;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 74
    :goto_0
    monitor-exit v1

    return-void

    .line 73
    :cond_0
    :try_start_1
    sput-boolean p0, Lcom/almworks/sqlite4java/SQLite;->debugBinaryPreferred:Z
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    .line 69
    :catchall_0
    move-exception v0

    monitor-exit v1

    throw v0
.end method

.method public static declared-synchronized setLibraryPath(Ljava/lang/String;)V
    .locals 3
    .param p0, "path"    # Ljava/lang/String;

    .prologue
    .line 334
    const-class v1, Lcom/almworks/sqlite4java/SQLite;

    monitor-enter v1

    :try_start_0
    sget-boolean v0, Lcom/almworks/sqlite4java/SQLite;->libraryLoaded:Z

    if-eqz v0, :cond_0

    .line 335
    const-class v0, Lcom/almworks/sqlite4java/SQLite;

    const-string v2, "cannot set library path, library already loaded"

    invoke-static {v0, v2}, Lcom/almworks/sqlite4java/Internal;->logWarn(Ljava/lang/Object;Ljava/lang/Object;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 339
    :goto_0
    monitor-exit v1

    return-void

    .line 338
    :cond_0
    :try_start_1
    const-string v0, "sqlite4java.library.path"

    invoke-static {v0, p0}, Ljava/lang/System;->setProperty(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    .line 334
    :catchall_0
    move-exception v0

    monitor-exit v1

    throw v0
.end method

.method public static setSharedCache(Z)V
    .locals 4
    .param p0, "enabled"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/almworks/sqlite4java/SQLiteException;
        }
    .end annotation

    .prologue
    .line 262
    invoke-static {}, Lcom/almworks/sqlite4java/SQLite;->loadLibrary()V

    .line 263
    if-eqz p0, :cond_0

    const/4 v1, 0x1

    :goto_0
    invoke-static {v1}, Lcom/almworks/sqlite4java/_SQLiteSwigged;->sqlite3_enable_shared_cache(I)I

    move-result v0

    .line 264
    .local v0, "rc":I
    if-eqz v0, :cond_1

    .line 265
    new-instance v1, Lcom/almworks/sqlite4java/SQLiteException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "SQLite: cannot set shared_cache to "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v0, v2}, Lcom/almworks/sqlite4java/SQLiteException;-><init>(ILjava/lang/String;)V

    throw v1

    .line 263
    .end local v0    # "rc":I
    :cond_0
    const/4 v1, 0x0

    goto :goto_0

    .line 266
    .restart local v0    # "rc":I
    :cond_1
    return-void
.end method

.method public static setSoftHeapLimit(I)V
    .locals 2
    .param p0, "limit"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/almworks/sqlite4java/SQLiteException;
        }
    .end annotation

    .prologue
    .line 232
    invoke-static {}, Lcom/almworks/sqlite4java/SQLite;->loadLibrary()V

    .line 233
    int-to-long v0, p0

    invoke-static {v0, v1}, Lcom/almworks/sqlite4java/_SQLiteSwigged;->sqlite3_soft_heap_limit64(J)J

    .line 234
    return-void
.end method

.method public static softHeapLimit(J)J
    .locals 2
    .param p0, "limit"    # J
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/almworks/sqlite4java/SQLiteException;
        }
    .end annotation

    .prologue
    .line 246
    invoke-static {}, Lcom/almworks/sqlite4java/SQLite;->loadLibrary()V

    .line 247
    invoke-static {p0, p1}, Lcom/almworks/sqlite4java/_SQLiteSwigged;->sqlite3_soft_heap_limit64(J)J

    move-result-wide v0

    return-wide v0
.end method
