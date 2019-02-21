.class final Lcom/almworks/sqlite4java/Internal;
.super Ljava/lang/Object;
.source "Internal.java"


# static fields
.field static final synthetic $assertionsDisabled:Z

.field private static final BASE_LIBRARY_NAME:Ljava/lang/String; = "sqlite4java"

.field private static final DEBUG_SUFFIXES:[Ljava/lang/String;

.field private static final LOG_PREFIX:Ljava/lang/String; = "[sqlite] "

.field private static final RELEASE_SUFFIXES:[Ljava/lang/String;

.field private static final lastConnectionNumber:Ljava/util/concurrent/atomic/AtomicInteger;

.field private static final logger:Ljava/util/logging/Logger;


# direct methods
.method static constructor <clinit>()V
    .locals 5

    .prologue
    const/4 v4, 0x2

    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 30
    const-class v0, Lcom/almworks/sqlite4java/Internal;

    invoke-virtual {v0}, Ljava/lang/Class;->desiredAssertionStatus()Z

    move-result v0

    if-nez v0, :cond_0

    move v0, v1

    :goto_0
    sput-boolean v0, Lcom/almworks/sqlite4java/Internal;->$assertionsDisabled:Z

    .line 31
    const-string v0, "com.almworks.sqlite4java"

    invoke-static {v0}, Ljava/util/logging/Logger;->getLogger(Ljava/lang/String;)Ljava/util/logging/Logger;

    move-result-object v0

    sput-object v0, Lcom/almworks/sqlite4java/Internal;->logger:Ljava/util/logging/Logger;

    .line 35
    new-array v0, v4, [Ljava/lang/String;

    const-string v3, "-d"

    aput-object v3, v0, v2

    const-string v3, ""

    aput-object v3, v0, v1

    sput-object v0, Lcom/almworks/sqlite4java/Internal;->DEBUG_SUFFIXES:[Ljava/lang/String;

    .line 36
    new-array v0, v4, [Ljava/lang/String;

    const-string v3, ""

    aput-object v3, v0, v2

    const-string v3, "-d"

    aput-object v3, v0, v1

    sput-object v0, Lcom/almworks/sqlite4java/Internal;->RELEASE_SUFFIXES:[Ljava/lang/String;

    .line 38
    new-instance v0, Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-direct {v0, v2}, Ljava/util/concurrent/atomic/AtomicInteger;-><init>(I)V

    sput-object v0, Lcom/almworks/sqlite4java/Internal;->lastConnectionNumber:Ljava/util/concurrent/atomic/AtomicInteger;

    return-void

    :cond_0
    move v0, v2

    .line 30
    goto :goto_0
.end method

.method constructor <init>()V
    .locals 0

    .prologue
    .line 30
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private static checkLoaded()Ljava/lang/LinkageError;
    .locals 1

    .prologue
    .line 393
    :try_start_0
    invoke-static {}, Lcom/almworks/sqlite4java/Internal;->getLibraryVersionMessage()Ljava/lang/String;
    :try_end_0
    .catch Ljava/lang/LinkageError; {:try_start_0 .. :try_end_0} :catch_0

    .line 394
    const/4 v0, 0x0

    .line 396
    .local v0, "e":Ljava/lang/LinkageError;
    :goto_0
    return-object v0

    .line 395
    .end local v0    # "e":Ljava/lang/LinkageError;
    :catch_0
    move-exception v0

    .line 396
    .restart local v0    # "e":Ljava/lang/LinkageError;
    goto :goto_0
.end method

.method private static collectBaseLibraryNames(Ljava/lang/String;Ljava/lang/String;)Ljava/util/List;
    .locals 5
    .param p0, "os"    # Ljava/lang/String;
    .param p1, "arch"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    const/4 v4, 0x5

    .line 161
    new-instance v1, Ljava/util/ArrayList;

    const/4 v2, 0x6

    invoke-direct {v1, v2}, Ljava/util/ArrayList;-><init>(I)V

    .line 162
    .local v1, "r":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "sqlite4java-"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 163
    .local v0, "base":Ljava/lang/String;
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "-"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 164
    const-string v2, "x86_64"

    invoke-virtual {p1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_0

    const-string v2, "x64"

    invoke-virtual {p1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_2

    .line 165
    :cond_0
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "-amd64"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 176
    :cond_1
    :goto_0
    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 177
    const-string v2, "sqlite4java"

    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 178
    return-object v1

    .line 166
    :cond_2
    const-string v2, "x86"

    invoke-virtual {p1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_3

    .line 167
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "-i386"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 168
    :cond_3
    const-string v2, "i386"

    invoke-virtual {p1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_4

    .line 169
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "-x86"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 170
    :cond_4
    const-string v2, "arm"

    invoke-virtual {p1, v2}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v2

    const/4 v3, 0x3

    if-le v2, v3, :cond_1

    .line 171
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v2

    if-le v2, v4, :cond_5

    const-string v2, "armv"

    invoke-virtual {p1, v2}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_5

    const/4 v2, 0x4

    invoke-virtual {p1, v2}, Ljava/lang/String;->charAt(I)C

    move-result v2

    invoke-static {v2}, Ljava/lang/Character;->isDigit(C)Z

    move-result v2

    if-eqz v2, :cond_5

    .line 172
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "-"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const/4 v3, 0x0

    invoke-virtual {p1, v3, v4}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 174
    :cond_5
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "-arm"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto/16 :goto_0
.end method

.method private static collectLibraryNames(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/util/List;
    .locals 10
    .param p0, "versionSuffix"    # Ljava/lang/String;
    .param p1, "os"    # Ljava/lang/String;
    .param p2, "arch"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    .line 142
    invoke-static {p1, p2}, Lcom/almworks/sqlite4java/Internal;->collectBaseLibraryNames(Ljava/lang/String;Ljava/lang/String;)Ljava/util/List;

    move-result-object v2

    .line 143
    .local v2, "baseSuffixes":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    new-instance v8, Ljava/util/ArrayList;

    const/16 v9, 0x18

    invoke-direct {v8, v9}, Ljava/util/ArrayList;-><init>(I)V

    .line 144
    .local v8, "r":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    invoke-static {}, Lcom/almworks/sqlite4java/SQLite;->isDebugBinaryPreferred()Z

    move-result v9

    if-eqz v9, :cond_0

    sget-object v4, Lcom/almworks/sqlite4java/Internal;->DEBUG_SUFFIXES:[Ljava/lang/String;

    .line 145
    .local v4, "configurationSuffixes":[Ljava/lang/String;
    :goto_0
    if-eqz p0, :cond_2

    .line 146
    move-object v0, v4

    .local v0, "arr$":[Ljava/lang/String;
    array-length v7, v0

    .local v7, "len$":I
    const/4 v5, 0x0

    .local v5, "i$":I
    move v6, v5

    .end local v5    # "i$":I
    .local v6, "i$":I
    :goto_1
    if-ge v6, v7, :cond_2

    aget-object v3, v0, v6

    .line 147
    .local v3, "configurationSuffix":Ljava/lang/String;
    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v5

    .end local v6    # "i$":I
    .local v5, "i$":Ljava/util/Iterator;
    :goto_2
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v9

    if-eqz v9, :cond_1

    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    .line 148
    .local v1, "baseSuffix":Ljava/lang/String;
    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v9, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_2

    .line 144
    .end local v0    # "arr$":[Ljava/lang/String;
    .end local v1    # "baseSuffix":Ljava/lang/String;
    .end local v3    # "configurationSuffix":Ljava/lang/String;
    .end local v4    # "configurationSuffixes":[Ljava/lang/String;
    .end local v5    # "i$":Ljava/util/Iterator;
    .end local v7    # "len$":I
    :cond_0
    sget-object v4, Lcom/almworks/sqlite4java/Internal;->RELEASE_SUFFIXES:[Ljava/lang/String;

    goto :goto_0

    .line 146
    .restart local v0    # "arr$":[Ljava/lang/String;
    .restart local v3    # "configurationSuffix":Ljava/lang/String;
    .restart local v4    # "configurationSuffixes":[Ljava/lang/String;
    .restart local v5    # "i$":Ljava/util/Iterator;
    .restart local v7    # "len$":I
    :cond_1
    add-int/lit8 v5, v6, 0x1

    .local v5, "i$":I
    move v6, v5

    .end local v5    # "i$":I
    .restart local v6    # "i$":I
    goto :goto_1

    .line 152
    .end local v0    # "arr$":[Ljava/lang/String;
    .end local v3    # "configurationSuffix":Ljava/lang/String;
    .end local v6    # "i$":I
    .end local v7    # "len$":I
    :cond_2
    move-object v0, v4

    .restart local v0    # "arr$":[Ljava/lang/String;
    array-length v7, v0

    .restart local v7    # "len$":I
    const/4 v5, 0x0

    .restart local v5    # "i$":I
    move v6, v5

    .end local v5    # "i$":I
    .restart local v6    # "i$":I
    :goto_3
    if-ge v6, v7, :cond_4

    aget-object v3, v0, v6

    .line 153
    .restart local v3    # "configurationSuffix":Ljava/lang/String;
    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v5

    .end local v6    # "i$":I
    .local v5, "i$":Ljava/util/Iterator;
    :goto_4
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v9

    if-eqz v9, :cond_3

    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    .line 154
    .restart local v1    # "baseSuffix":Ljava/lang/String;
    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v9, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_4

    .line 152
    .end local v1    # "baseSuffix":Ljava/lang/String;
    :cond_3
    add-int/lit8 v5, v6, 0x1

    .local v5, "i$":I
    move v6, v5

    .end local v5    # "i$":I
    .restart local v6    # "i$":I
    goto :goto_3

    .line 157
    .end local v3    # "configurationSuffix":Ljava/lang/String;
    :cond_4
    return-object v8
.end method

.method private static getArch(Ljava/lang/String;)Ljava/lang/String;
    .locals 4
    .param p0, "os"    # Ljava/lang/String;

    .prologue
    .line 205
    const-string v1, "os.arch"

    invoke-static {v1}, Ljava/lang/System;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 206
    .local v0, "arch":Ljava/lang/String;
    if-nez v0, :cond_1

    .line 207
    const-class v1, Lcom/almworks/sqlite4java/Internal;

    const-string v2, "os.arch is null"

    invoke-static {v1, v2}, Lcom/almworks/sqlite4java/Internal;->logWarn(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 208
    const-string v0, "x86"

    .line 215
    :cond_0
    :goto_0
    const-class v1, Lcom/almworks/sqlite4java/Internal;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "os.arch="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/almworks/sqlite4java/Internal;->logFine(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 216
    return-object v0

    .line 210
    :cond_1
    sget-object v1, Ljava/util/Locale;->US:Ljava/util/Locale;

    invoke-virtual {v0, v1}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v0

    .line 211
    const-string v1, "win32"

    invoke-virtual {v1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    const-string v1, "amd64"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 212
    const-string v0, "x64"

    goto :goto_0
.end method

.method private static getClassUrl()Ljava/lang/String;
    .locals 9

    .prologue
    .line 190
    const-class v0, Lcom/almworks/sqlite4java/Internal;

    .line 191
    .local v0, "c":Ljava/lang/Class;
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v6

    const/16 v7, 0x2e

    const/16 v8, 0x2f

    invoke-virtual {v6, v7, v8}, Ljava/lang/String;->replace(CC)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, ".class"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    .line 192
    .local v3, "name":Ljava/lang/String;
    invoke-virtual {v0}, Ljava/lang/Class;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object v5

    invoke-virtual {v5, v3}, Ljava/lang/ClassLoader;->getResource(Ljava/lang/String;)Ljava/net/URL;

    move-result-object v4

    .line 193
    .local v4, "url":Ljava/net/URL;
    if-nez v4, :cond_0

    .line 194
    const/4 v1, 0x0

    .line 200
    :goto_0
    return-object v1

    .line 195
    :cond_0
    invoke-virtual {v4}, Ljava/net/URL;->toString()Ljava/lang/String;

    move-result-object v1

    .line 197
    .local v1, "classUrl":Ljava/lang/String;
    :try_start_0
    const-string v5, "UTF-8"

    invoke-static {v1, v5}, Ljava/net/URLDecoder;->decode(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    :try_end_0
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v1

    goto :goto_0

    .line 198
    :catch_0
    move-exception v2

    .line 199
    .local v2, "e":Ljava/io/UnsupportedEncodingException;
    const-class v5, Lcom/almworks/sqlite4java/Internal;

    invoke-virtual {v2}, Ljava/io/UnsupportedEncodingException;->getMessage()Ljava/lang/String;

    move-result-object v6

    const/4 v7, 0x1

    invoke-static {v5, v6, v7}, Lcom/almworks/sqlite4java/Internal;->recoverableError(Ljava/lang/Object;Ljava/lang/String;Z)V

    goto :goto_0
.end method

.method private static getDefaultLibPath(Ljava/lang/String;)Ljava/lang/String;
    .locals 1
    .param p0, "classUrl"    # Ljava/lang/String;

    .prologue
    .line 245
    const-string v0, "java.library.path"

    invoke-static {v0}, Ljava/lang/System;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0, p0}, Lcom/almworks/sqlite4java/Internal;->getDefaultLibPath(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method static getDefaultLibPath(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 10
    .param p0, "libraryPath"    # Ljava/lang/String;
    .param p1, "classUrl"    # Ljava/lang/String;

    .prologue
    const/4 v7, 0x0

    .line 258
    invoke-static {p1}, Lcom/almworks/sqlite4java/Internal;->getJarFileFromClassUrl(Ljava/lang/String;)Ljava/io/File;

    move-result-object v1

    .line 259
    .local v1, "jar":Ljava/io/File;
    if-nez v1, :cond_1

    move-object v4, v7

    .line 286
    :cond_0
    :goto_0
    return-object v4

    .line 261
    :cond_1
    invoke-virtual {v1}, Ljava/io/File;->getParentFile()Ljava/io/File;

    move-result-object v3

    .line 262
    .local v3, "loadDir":Ljava/io/File;
    invoke-virtual {v3}, Ljava/io/File;->getPath()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/String;->length()I

    move-result v8

    if-eqz v8, :cond_2

    invoke-virtual {v3}, Ljava/io/File;->isDirectory()Z

    move-result v8

    if-nez v8, :cond_3

    :cond_2
    move-object v4, v7

    .line 263
    goto :goto_0

    .line 264
    :cond_3
    if-nez p0, :cond_4

    .line 265
    const-string p0, ""

    .line 266
    :cond_4
    const/4 v0, 0x0

    .line 267
    .local v0, "contains":Z
    sget-char v6, Ljava/io/File;->pathSeparatorChar:C

    .line 268
    .local v6, "sep":C
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v8

    if-lez v8, :cond_6

    .line 269
    const/4 v2, 0x0

    .line 270
    .local v2, "k":I
    :goto_1
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v8

    if-ge v2, v8, :cond_6

    .line 271
    invoke-virtual {p0, v6, v2}, Ljava/lang/String;->indexOf(II)I

    move-result v5

    .line 272
    .local v5, "p":I
    if-gez v5, :cond_5

    .line 273
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v5

    .line 275
    :cond_5
    new-instance v8, Ljava/io/File;

    invoke-virtual {p0, v2, v5}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v9

    invoke-direct {v8, v9}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3, v8}, Ljava/io/File;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_7

    .line 276
    const/4 v0, 0x1

    .line 282
    .end local v2    # "k":I
    .end local v5    # "p":I
    :cond_6
    invoke-virtual {v3}, Ljava/io/File;->getPath()Ljava/lang/String;

    move-result-object v4

    .line 283
    .local v4, "loadPath":Ljava/lang/String;
    if-eqz v0, :cond_0

    move-object v4, v7

    .line 284
    goto :goto_0

    .line 279
    .end local v4    # "loadPath":Ljava/lang/String;
    .restart local v2    # "k":I
    .restart local v5    # "p":I
    :cond_7
    add-int/lit8 v2, v5, 0x1

    .line 280
    goto :goto_1
.end method

.method private static getForcedPath()Ljava/lang/String;
    .locals 4

    .prologue
    .line 182
    const-string v1, "sqlite4java.library.path"

    invoke-static {v1}, Ljava/lang/System;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 183
    .local v0, "r":Ljava/lang/String;
    if-eqz v0, :cond_0

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v1

    if-nez v1, :cond_1

    .line 184
    :cond_0
    const/4 v0, 0x0

    .line 186
    :goto_0
    return-object v0

    .line 185
    :cond_1
    const/16 v1, 0x5c

    sget-char v2, Ljava/io/File;->separatorChar:C

    invoke-virtual {v0, v1, v2}, Ljava/lang/String;->replace(CC)Ljava/lang/String;

    move-result-object v1

    const/16 v2, 0x2f

    sget-char v3, Ljava/io/File;->separatorChar:C

    invoke-virtual {v1, v2, v3}, Ljava/lang/String;->replace(CC)Ljava/lang/String;

    move-result-object v0

    .line 186
    goto :goto_0
.end method

.method private static getJarFileFromClassUrl(Ljava/lang/String;)Ljava/io/File;
    .locals 6
    .param p0, "classUrl"    # Ljava/lang/String;

    .prologue
    const/4 v4, 0x0

    .line 291
    if-nez p0, :cond_1

    move-object v0, v4

    .line 304
    :cond_0
    :goto_0
    return-object v0

    .line 293
    :cond_1
    move-object v3, p0

    .line 294
    .local v3, "s":Ljava/lang/String;
    const-string v2, "jar:file:"

    .line 295
    .local v2, "prefix":Ljava/lang/String;
    invoke-virtual {v3, v2}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v5

    if-nez v5, :cond_2

    move-object v0, v4

    .line 296
    goto :goto_0

    .line 297
    :cond_2
    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v5

    invoke-virtual {v3, v5}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v3

    .line 298
    const/16 v5, 0x21

    invoke-virtual {v3, v5}, Ljava/lang/String;->lastIndexOf(I)I

    move-result v1

    .line 299
    .local v1, "k":I
    if-gez v1, :cond_3

    move-object v0, v4

    .line 300
    goto :goto_0

    .line 301
    :cond_3
    new-instance v0, Ljava/io/File;

    const/4 v5, 0x0

    invoke-virtual {v3, v5, v1}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v5

    invoke-direct {v0, v5}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 302
    .local v0, "jar":Ljava/io/File;
    invoke-virtual {v0}, Ljava/io/File;->isFile()Z

    move-result v5

    if-nez v5, :cond_0

    move-object v0, v4

    .line 303
    goto :goto_0
.end method

.method private static getLibraryVersionMessage()Ljava/lang/String;
    .locals 4

    .prologue
    .line 401
    invoke-static {}, Lcom/almworks/sqlite4java/_SQLiteSwigged;->sqlite3_libversion()Ljava/lang/String;

    move-result-object v0

    .line 402
    .local v0, "version":Ljava/lang/String;
    invoke-static {}, Lcom/almworks/sqlite4java/_SQLiteManual;->wrapper_version()Ljava/lang/String;

    move-result-object v1

    .line 403
    .local v1, "wrapper":Ljava/lang/String;
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "loaded sqlite "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, ", wrapper "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    return-object v2
.end method

.method private static getOs()Ljava/lang/String;
    .locals 6

    .prologue
    .line 220
    const-string v3, "os.name"

    invoke-static {v3}, Ljava/lang/System;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 222
    .local v1, "osname":Ljava/lang/String;
    if-nez v1, :cond_0

    .line 223
    const-class v3, Lcom/almworks/sqlite4java/Internal;

    const-string v4, "os.name is null"

    invoke-static {v3, v4}, Lcom/almworks/sqlite4java/Internal;->logWarn(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 224
    const-string v0, "linux"

    .line 240
    .local v0, "os":Ljava/lang/String;
    :goto_0
    const-class v3, Lcom/almworks/sqlite4java/Internal;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "os.name="

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, "; os="

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Lcom/almworks/sqlite4java/Internal;->logFine(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 241
    return-object v0

    .line 226
    .end local v0    # "os":Ljava/lang/String;
    :cond_0
    sget-object v3, Ljava/util/Locale;->US:Ljava/util/Locale;

    invoke-virtual {v1, v3}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v1

    .line 227
    const-string v3, "mac"

    invoke-virtual {v1, v3}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v3

    if-nez v3, :cond_1

    const-string v3, "darwin"

    invoke-virtual {v1, v3}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v3

    if-nez v3, :cond_1

    const-string v3, "os x"

    invoke-virtual {v1, v3}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_2

    .line 228
    :cond_1
    const-string v0, "osx"

    .restart local v0    # "os":Ljava/lang/String;
    goto :goto_0

    .line 229
    .end local v0    # "os":Ljava/lang/String;
    :cond_2
    const-string v3, "windows"

    invoke-virtual {v1, v3}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_3

    .line 230
    const-string v0, "win32"

    .restart local v0    # "os":Ljava/lang/String;
    goto :goto_0

    .line 232
    .end local v0    # "os":Ljava/lang/String;
    :cond_3
    const-string v3, "java.runtime.name"

    invoke-static {v3}, Ljava/lang/System;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 233
    .local v2, "runtimeName":Ljava/lang/String;
    if-eqz v2, :cond_4

    sget-object v3, Ljava/util/Locale;->US:Ljava/util/Locale;

    invoke-virtual {v2, v3}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v3

    const-string v4, "android"

    invoke-virtual {v3, v4}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v3

    if-eqz v3, :cond_4

    .line 234
    const-string v0, "android"

    .restart local v0    # "os":Ljava/lang/String;
    goto :goto_0

    .line 236
    .end local v0    # "os":Ljava/lang/String;
    :cond_4
    const-string v0, "linux"

    .restart local v0    # "os":Ljava/lang/String;
    goto :goto_0
.end method

.method static getVersionSuffix(Ljava/lang/String;)Ljava/lang/String;
    .locals 8
    .param p0, "classUrl"    # Ljava/lang/String;

    .prologue
    const/4 v5, 0x0

    .line 310
    invoke-static {p0}, Lcom/almworks/sqlite4java/Internal;->getJarFileFromClassUrl(Ljava/lang/String;)Ljava/io/File;

    move-result-object v1

    .line 311
    .local v1, "jar":Ljava/io/File;
    if-nez v1, :cond_1

    .line 321
    :cond_0
    :goto_0
    return-object v5

    .line 313
    :cond_1
    invoke-virtual {v1}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v3

    .line 314
    .local v3, "name":Ljava/lang/String;
    sget-object v6, Ljava/util/Locale;->US:Ljava/util/Locale;

    invoke-virtual {v3, v6}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v2

    .line 315
    .local v2, "lower":Ljava/lang/String;
    const-string v6, "sqlite4java"

    invoke-virtual {v2, v6}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v6

    if-eqz v6, :cond_0

    .line 317
    const-string v6, ".jar"

    invoke-virtual {v2, v6}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v6

    if-eqz v6, :cond_0

    .line 319
    const-string v6, "sqlite4java"

    invoke-virtual {v6}, Ljava/lang/String;->length()I

    move-result v0

    .line 320
    .local v0, "f":I
    invoke-virtual {v3}, Ljava/lang/String;->length()I

    move-result v6

    add-int/lit8 v4, v6, -0x4

    .line 321
    .local v4, "t":I
    add-int/lit8 v6, v0, 0x1

    if-ge v6, v4, :cond_0

    invoke-virtual {v3, v0}, Ljava/lang/String;->charAt(I)C

    move-result v6

    const/16 v7, 0x2d

    if-ne v6, v7, :cond_0

    invoke-virtual {v3, v0, v4}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v5

    goto :goto_0
.end method

.method static isFineLogging()Z
    .locals 2

    .prologue
    .line 81
    sget-object v0, Lcom/almworks/sqlite4java/Internal;->logger:Ljava/util/logging/Logger;

    sget-object v1, Ljava/util/logging/Level;->FINE:Ljava/util/logging/Level;

    invoke-virtual {v0, v1}, Ljava/util/logging/Logger;->isLoggable(Ljava/util/logging/Level;)Z

    move-result v0

    return v0
.end method

.method static loadLibraryX()Ljava/lang/Throwable;
    .locals 17

    .prologue
    .line 85
    invoke-static {}, Lcom/almworks/sqlite4java/Internal;->checkLoaded()Ljava/lang/LinkageError;

    move-result-object v13

    if-nez v13, :cond_1

    .line 86
    const/4 v11, 0x0

    .line 137
    .local v0, "arch":Ljava/lang/String;
    .local v1, "classUrl":Ljava/lang/String;
    .local v2, "defaultPath":Ljava/lang/String;
    .local v3, "failureReason":[Ljava/lang/Throwable;
    .local v4, "forcedPath":Ljava/lang/String;
    .local v6, "loaded":Z
    .local v9, "names":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    .local v10, "os":Ljava/lang/String;
    .local v12, "versionSuffix":Ljava/lang/String;
    :cond_0
    :goto_0
    return-object v11

    .line 87
    .end local v0    # "arch":Ljava/lang/String;
    .end local v1    # "classUrl":Ljava/lang/String;
    .end local v2    # "defaultPath":Ljava/lang/String;
    .end local v3    # "failureReason":[Ljava/lang/Throwable;
    .end local v4    # "forcedPath":Ljava/lang/String;
    .end local v6    # "loaded":Z
    .end local v9    # "names":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    .end local v10    # "os":Ljava/lang/String;
    .end local v12    # "versionSuffix":Ljava/lang/String;
    :cond_1
    const-string v13, "true"

    const-string v14, "sqlite4java.debug"

    invoke-static {v14}, Ljava/lang/System;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v14

    invoke-virtual {v13, v14}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v13

    if-eqz v13, :cond_2

    .line 88
    sget-object v13, Lcom/almworks/sqlite4java/Internal;->logger:Ljava/util/logging/Logger;

    sget-object v14, Ljava/util/logging/Level;->FINE:Ljava/util/logging/Level;

    invoke-virtual {v13, v14}, Ljava/util/logging/Logger;->setLevel(Ljava/util/logging/Level;)V

    .line 90
    :cond_2
    invoke-static {}, Lcom/almworks/sqlite4java/Internal;->getClassUrl()Ljava/lang/String;

    move-result-object v1

    .line 91
    .restart local v1    # "classUrl":Ljava/lang/String;
    invoke-static {v1}, Lcom/almworks/sqlite4java/Internal;->getDefaultLibPath(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 92
    .restart local v2    # "defaultPath":Ljava/lang/String;
    invoke-static {v1}, Lcom/almworks/sqlite4java/Internal;->getVersionSuffix(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v12

    .line 93
    .restart local v12    # "versionSuffix":Ljava/lang/String;
    invoke-static {}, Lcom/almworks/sqlite4java/Internal;->getForcedPath()Ljava/lang/String;

    move-result-object v4

    .line 94
    .restart local v4    # "forcedPath":Ljava/lang/String;
    invoke-static {}, Lcom/almworks/sqlite4java/Internal;->isFineLogging()Z

    move-result v13

    if-eqz v13, :cond_3

    .line 95
    const-class v13, Lcom/almworks/sqlite4java/Internal;

    const-string v14, "loading library"

    invoke-static {v13, v14}, Lcom/almworks/sqlite4java/Internal;->logFine(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 96
    const-class v13, Lcom/almworks/sqlite4java/Internal;

    new-instance v14, Ljava/lang/StringBuilder;

    invoke-direct {v14}, Ljava/lang/StringBuilder;-><init>()V

    const-string v15, "java.library.path="

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    const-string v15, "java.library.path"

    invoke-static {v15}, Ljava/lang/System;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v15

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v14

    invoke-static {v13, v14}, Lcom/almworks/sqlite4java/Internal;->logFine(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 97
    const-class v13, Lcom/almworks/sqlite4java/Internal;

    new-instance v14, Ljava/lang/StringBuilder;

    invoke-direct {v14}, Ljava/lang/StringBuilder;-><init>()V

    const-string v15, "sqlite4java.library.path="

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    const-string v15, "sqlite4java.library.path"

    invoke-static {v15}, Ljava/lang/System;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v15

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v14

    invoke-static {v13, v14}, Lcom/almworks/sqlite4java/Internal;->logFine(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 98
    const-class v13, Lcom/almworks/sqlite4java/Internal;

    new-instance v14, Ljava/lang/StringBuilder;

    invoke-direct {v14}, Ljava/lang/StringBuilder;-><init>()V

    const-string v15, "cwd="

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    new-instance v15, Ljava/io/File;

    const-string v16, "."

    invoke-direct/range {v15 .. v16}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v15}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v15

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v14

    invoke-static {v13, v14}, Lcom/almworks/sqlite4java/Internal;->logFine(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 99
    const-class v14, Lcom/almworks/sqlite4java/Internal;

    new-instance v13, Ljava/lang/StringBuilder;

    invoke-direct {v13}, Ljava/lang/StringBuilder;-><init>()V

    const-string v15, "default path="

    invoke-virtual {v13, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    if-nez v2, :cond_6

    const-string v13, "null "

    :goto_1
    invoke-virtual {v15, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v13

    invoke-static {v14, v13}, Lcom/almworks/sqlite4java/Internal;->logFine(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 100
    const-class v14, Lcom/almworks/sqlite4java/Internal;

    new-instance v13, Ljava/lang/StringBuilder;

    invoke-direct {v13}, Ljava/lang/StringBuilder;-><init>()V

    const-string v15, "forced path="

    invoke-virtual {v13, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    if-nez v4, :cond_7

    const-string v13, "null "

    :goto_2
    invoke-virtual {v15, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v13

    invoke-static {v14, v13}, Lcom/almworks/sqlite4java/Internal;->logFine(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 102
    :cond_3
    invoke-static {}, Lcom/almworks/sqlite4java/Internal;->getOs()Ljava/lang/String;

    move-result-object v10

    .line 103
    .restart local v10    # "os":Ljava/lang/String;
    invoke-static {v10}, Lcom/almworks/sqlite4java/Internal;->getArch(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 104
    .restart local v0    # "arch":Ljava/lang/String;
    invoke-static {v12, v10, v0}, Lcom/almworks/sqlite4java/Internal;->collectLibraryNames(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/util/List;

    move-result-object v9

    .line 105
    .restart local v9    # "names":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    const/4 v13, 0x1

    new-array v3, v13, [Ljava/lang/Throwable;

    const/4 v13, 0x0

    const/4 v14, 0x0

    aput-object v14, v3, v13

    .line 106
    .restart local v3    # "failureReason":[Ljava/lang/Throwable;
    const/4 v6, 0x0

    .line 107
    .restart local v6    # "loaded":Z
    if-eqz v4, :cond_8

    .line 109
    invoke-interface {v9}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v5

    .local v5, "i$":Ljava/util/Iterator;
    :cond_4
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v13

    if-eqz v13, :cond_5

    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Ljava/lang/String;

    .line 110
    .local v8, "name":Ljava/lang/String;
    invoke-static {v8, v10, v4, v3}, Lcom/almworks/sqlite4java/Internal;->tryLoadFromPath(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Throwable;)Z

    move-result v6

    .line 111
    if-eqz v6, :cond_4

    .line 130
    .end local v5    # "i$":Ljava/util/Iterator;
    .end local v8    # "name":Ljava/lang/String;
    :cond_5
    :goto_3
    if-eqz v6, :cond_c

    .line 131
    invoke-static {}, Lcom/almworks/sqlite4java/Internal;->getLibraryVersionMessage()Ljava/lang/String;

    move-result-object v7

    .line 132
    .local v7, "msg":Ljava/lang/String;
    const-class v13, Lcom/almworks/sqlite4java/Internal;

    invoke-static {v13, v7}, Lcom/almworks/sqlite4java/Internal;->logInfo(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 133
    const/4 v11, 0x0

    goto/16 :goto_0

    .line 99
    .end local v0    # "arch":Ljava/lang/String;
    .end local v3    # "failureReason":[Ljava/lang/Throwable;
    .end local v6    # "loaded":Z
    .end local v7    # "msg":Ljava/lang/String;
    .end local v9    # "names":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    .end local v10    # "os":Ljava/lang/String;
    :cond_6
    new-instance v13, Ljava/io/File;

    invoke-direct {v13, v2}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v13}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v13

    goto :goto_1

    .line 100
    :cond_7
    new-instance v13, Ljava/io/File;

    invoke-direct {v13, v4}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v13}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v13

    goto :goto_2

    .line 114
    .restart local v0    # "arch":Ljava/lang/String;
    .restart local v3    # "failureReason":[Ljava/lang/Throwable;
    .restart local v6    # "loaded":Z
    .restart local v9    # "names":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    .restart local v10    # "os":Ljava/lang/String;
    :cond_8
    if-eqz v2, :cond_a

    .line 116
    invoke-interface {v9}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v5

    .restart local v5    # "i$":Ljava/util/Iterator;
    :cond_9
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v13

    if-eqz v13, :cond_a

    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Ljava/lang/String;

    .line 117
    .restart local v8    # "name":Ljava/lang/String;
    invoke-static {v8, v10, v2, v3}, Lcom/almworks/sqlite4java/Internal;->tryLoadFromPath(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Throwable;)Z

    move-result v6

    .line 118
    if-eqz v6, :cond_9

    .line 121
    .end local v5    # "i$":Ljava/util/Iterator;
    .end local v8    # "name":Ljava/lang/String;
    :cond_a
    if-nez v6, :cond_5

    .line 123
    invoke-interface {v9}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v5

    .restart local v5    # "i$":Ljava/util/Iterator;
    :cond_b
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v13

    if-eqz v13, :cond_5

    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Ljava/lang/String;

    .line 124
    .restart local v8    # "name":Ljava/lang/String;
    invoke-static {v8, v3}, Lcom/almworks/sqlite4java/Internal;->tryLoadFromSystemPath(Ljava/lang/String;[Ljava/lang/Throwable;)Z

    move-result v6

    .line 125
    if-eqz v6, :cond_b

    goto :goto_3

    .line 135
    .end local v5    # "i$":Ljava/util/Iterator;
    .end local v8    # "name":Ljava/lang/String;
    :cond_c
    const/4 v13, 0x0

    aget-object v11, v3, v13

    .line 136
    .local v11, "t":Ljava/lang/Throwable;
    if-nez v11, :cond_0

    new-instance v11, Lcom/almworks/sqlite4java/SQLiteException;

    .end local v11    # "t":Ljava/lang/Throwable;
    const/16 v13, -0x5b

    const-string v14, "sqlite4java cannot find native library"

    invoke-direct {v11, v13, v14}, Lcom/almworks/sqlite4java/SQLiteException;-><init>(ILjava/lang/String;)V

    .restart local v11    # "t":Ljava/lang/Throwable;
    goto/16 :goto_0
.end method

.method static log(Ljava/util/logging/Level;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Throwable;)V
    .locals 4
    .param p0, "level"    # Ljava/util/logging/Level;
    .param p1, "source"    # Ljava/lang/Object;
    .param p2, "message"    # Ljava/lang/Object;
    .param p3, "exception"    # Ljava/lang/Throwable;

    .prologue
    .line 50
    sget-object v2, Lcom/almworks/sqlite4java/Internal;->logger:Ljava/util/logging/Logger;

    invoke-virtual {v2, p0}, Ljava/util/logging/Logger;->isLoggable(Ljava/util/logging/Level;)Z

    move-result v2

    if-nez v2, :cond_0

    .line 66
    .end local p1    # "source":Ljava/lang/Object;
    :goto_0
    return-void

    .line 53
    .restart local p1    # "source":Ljava/lang/Object;
    :cond_0
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v2, "[sqlite] "

    invoke-direct {v0, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 54
    .local v0, "builder":Ljava/lang/StringBuilder;
    if-eqz p1, :cond_1

    .line 55
    instance-of v2, p1, Ljava/lang/Class;

    if-eqz v2, :cond_3

    .line 56
    check-cast p1, Ljava/lang/Class;

    .end local p1    # "source":Ljava/lang/Object;
    invoke-virtual {p1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v1

    .line 57
    .local v1, "className":Ljava/lang/String;
    const/16 v2, 0x2e

    invoke-virtual {v1, v2}, Ljava/lang/String;->lastIndexOf(I)I

    move-result v2

    add-int/lit8 v2, v2, 0x1

    invoke-virtual {v1, v2}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 61
    .end local v1    # "className":Ljava/lang/String;
    :goto_1
    const-string v2, ": "

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 63
    :cond_1
    if-eqz p2, :cond_2

    .line 64
    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 65
    :cond_2
    sget-object v2, Lcom/almworks/sqlite4java/Internal;->logger:Ljava/util/logging/Logger;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, p0, v3, p3}, Ljava/util/logging/Logger;->log(Ljava/util/logging/Level;Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_0

    .line 59
    .restart local p1    # "source":Ljava/lang/Object;
    :cond_3
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    goto :goto_1
.end method

.method static logFine(Ljava/lang/Object;Ljava/lang/Object;)V
    .locals 2
    .param p0, "source"    # Ljava/lang/Object;
    .param p1, "message"    # Ljava/lang/Object;

    .prologue
    .line 69
    sget-object v0, Ljava/util/logging/Level;->FINE:Ljava/util/logging/Level;

    const/4 v1, 0x0

    invoke-static {v0, p0, p1, v1}, Lcom/almworks/sqlite4java/Internal;->log(Ljava/util/logging/Level;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Throwable;)V

    .line 70
    return-void
.end method

.method static logInfo(Ljava/lang/Object;Ljava/lang/Object;)V
    .locals 2
    .param p0, "source"    # Ljava/lang/Object;
    .param p1, "message"    # Ljava/lang/Object;

    .prologue
    .line 73
    sget-object v0, Ljava/util/logging/Level;->INFO:Ljava/util/logging/Level;

    const/4 v1, 0x0

    invoke-static {v0, p0, p1, v1}, Lcom/almworks/sqlite4java/Internal;->log(Ljava/util/logging/Level;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Throwable;)V

    .line 74
    return-void
.end method

.method static logWarn(Ljava/lang/Object;Ljava/lang/Object;)V
    .locals 2
    .param p0, "source"    # Ljava/lang/Object;
    .param p1, "message"    # Ljava/lang/Object;

    .prologue
    .line 77
    sget-object v0, Ljava/util/logging/Level;->WARNING:Ljava/util/logging/Level;

    const/4 v1, 0x0

    invoke-static {v0, p0, p1, v1}, Lcom/almworks/sqlite4java/Internal;->log(Ljava/util/logging/Level;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Throwable;)V

    .line 78
    return-void
.end method

.method static nextConnectionNumber()I
    .locals 1

    .prologue
    .line 41
    sget-object v0, Lcom/almworks/sqlite4java/Internal;->lastConnectionNumber:Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicInteger;->incrementAndGet()I

    move-result v0

    return v0
.end method

.method static recoverableError(Ljava/lang/Object;Ljava/lang/String;Z)V
    .locals 3
    .param p0, "source"    # Ljava/lang/Object;
    .param p1, "message"    # Ljava/lang/String;
    .param p2, "throwAssertion"    # Z

    .prologue
    .line 45
    invoke-static {p0, p1}, Lcom/almworks/sqlite4java/Internal;->logWarn(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 46
    sget-boolean v0, Lcom/almworks/sqlite4java/Internal;->$assertionsDisabled:Z

    if-nez v0, :cond_0

    if-eqz p2, :cond_0

    new-instance v0, Ljava/lang/AssertionError;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/AssertionError;-><init>(Ljava/lang/Object;)V

    throw v0

    .line 47
    :cond_0
    return-void
.end method

.method private static tryLoadFromPath(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Throwable;)Z
    .locals 10
    .param p0, "libname"    # Ljava/lang/String;
    .param p1, "os"    # Ljava/lang/String;
    .param p2, "path"    # Ljava/lang/String;
    .param p3, "failureReason"    # [Ljava/lang/Throwable;

    .prologue
    const/4 v6, 0x0

    .line 325
    invoke-static {p0}, Ljava/lang/System;->mapLibraryName(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 326
    .local v1, "libFile":Ljava/lang/String;
    const-string v7, "osx"

    invoke-virtual {p1, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_0

    .line 327
    const-string v4, ".jnilib"

    .line 328
    .local v4, "oldSuffix":Ljava/lang/String;
    invoke-virtual {v1, v4}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_0

    .line 329
    const-string v3, ".dylib"

    .line 330
    .local v3, "newSuffix":Ljava/lang/String;
    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v8

    invoke-virtual {v4}, Ljava/lang/String;->length()I

    move-result v9

    sub-int/2addr v8, v9

    invoke-virtual {v1, v6, v8}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 333
    .end local v3    # "newSuffix":Ljava/lang/String;
    .end local v4    # "oldSuffix":Ljava/lang/String;
    :cond_0
    new-instance v0, Ljava/io/File;

    new-instance v7, Ljava/io/File;

    invoke-direct {v7, p2}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-direct {v0, v7, v1}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 334
    .local v0, "lib":Ljava/io/File;
    const-class v7, Lcom/almworks/sqlite4java/Internal;

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "checking "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-static {v7, v8}, Lcom/almworks/sqlite4java/Internal;->logFine(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 335
    invoke-virtual {v0}, Ljava/io/File;->isFile()Z

    move-result v7

    if-eqz v7, :cond_1

    invoke-virtual {v0}, Ljava/io/File;->canRead()Z

    move-result v7

    if-nez v7, :cond_2

    .line 346
    :cond_1
    :goto_0
    return v6

    .line 337
    :cond_2
    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v7, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, " from "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    .line 338
    .local v2, "logname":Ljava/lang/String;
    const-class v7, Lcom/almworks/sqlite4java/Internal;

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "trying to load "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-static {v7, v8}, Lcom/almworks/sqlite4java/Internal;->logFine(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 340
    :try_start_0
    invoke-virtual {v0}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v7

    invoke-static {v7}, Ljava/lang/System;->load(Ljava/lang/String;)V

    .line 341
    invoke-static {p3, v2}, Lcom/almworks/sqlite4java/Internal;->verifyLoading([Ljava/lang/Throwable;Ljava/lang/String;)Z
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    move-result v6

    goto :goto_0

    .line 342
    :catch_0
    move-exception v5

    .line 343
    .local v5, "t":Ljava/lang/Throwable;
    const-class v7, Lcom/almworks/sqlite4java/Internal;

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "cannot load "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, ": "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-static {v7, v8}, Lcom/almworks/sqlite4java/Internal;->logFine(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 344
    invoke-static {p3, v5}, Lcom/almworks/sqlite4java/Internal;->updateLoadFailureReason([Ljava/lang/Throwable;Ljava/lang/Throwable;)V

    goto :goto_0
.end method

.method private static tryLoadFromSystemPath(Ljava/lang/String;[Ljava/lang/Throwable;)Z
    .locals 4
    .param p0, "libname"    # Ljava/lang/String;
    .param p1, "failureReason"    # [Ljava/lang/Throwable;

    .prologue
    .line 350
    const-class v1, Lcom/almworks/sqlite4java/Internal;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "trying to load "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/almworks/sqlite4java/Internal;->logFine(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 352
    :try_start_0
    invoke-static {p0}, Ljava/lang/System;->loadLibrary(Ljava/lang/String;)V

    .line 353
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " from system path"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {p1, v1}, Lcom/almworks/sqlite4java/Internal;->verifyLoading([Ljava/lang/Throwable;Ljava/lang/String;)Z
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    move-result v1

    .line 358
    :goto_0
    return v1

    .line 354
    :catch_0
    move-exception v0

    .line 355
    .local v0, "t":Ljava/lang/Throwable;
    const-class v1, Lcom/almworks/sqlite4java/Internal;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "cannot load "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, ": "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/almworks/sqlite4java/Internal;->logFine(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 356
    invoke-static {p1, v0}, Lcom/almworks/sqlite4java/Internal;->updateLoadFailureReason([Ljava/lang/Throwable;Ljava/lang/Throwable;)V

    .line 358
    const/4 v1, 0x0

    goto :goto_0
.end method

.method private static updateLoadFailureReason([Ljava/lang/Throwable;Ljava/lang/Throwable;)V
    .locals 4
    .param p0, "bestReason"    # [Ljava/lang/Throwable;
    .param p1, "currentReason"    # Ljava/lang/Throwable;

    .prologue
    const/4 v3, 0x0

    .line 378
    aget-object v2, p0, v3

    if-nez v2, :cond_1

    .line 379
    aput-object p1, p0, v3

    .line 389
    :cond_0
    :goto_0
    return-void

    .line 380
    :cond_1
    if-eqz p1, :cond_0

    .line 381
    aget-object v2, p0, v3

    invoke-virtual {v2}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object v0

    .line 382
    .local v0, "m1":Ljava/lang/String;
    if-eqz v0, :cond_0

    const-string v2, "java.library.path"

    invoke-virtual {v0, v2}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 383
    invoke-virtual {p1}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object v1

    .line 384
    .local v1, "m2":Ljava/lang/String;
    if-eqz v1, :cond_0

    const-string v2, "java.library.path"

    invoke-virtual {v1, v2}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v2

    if-nez v2, :cond_0

    .line 385
    aput-object p1, p0, v3

    goto :goto_0
.end method

.method private static verifyLoading([Ljava/lang/Throwable;Ljava/lang/String;)Z
    .locals 4
    .param p0, "failureReason"    # [Ljava/lang/Throwable;
    .param p1, "logname"    # Ljava/lang/String;

    .prologue
    .line 362
    const-class v1, Lcom/almworks/sqlite4java/Internal;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "loaded "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/almworks/sqlite4java/Internal;->logInfo(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 363
    invoke-static {}, Lcom/almworks/sqlite4java/Internal;->checkLoaded()Ljava/lang/LinkageError;

    move-result-object v0

    .line 364
    .local v0, "linkError":Ljava/lang/LinkageError;
    if-nez v0, :cond_0

    .line 365
    const/4 v1, 0x1

    .line 369
    :goto_0
    return v1

    .line 367
    :cond_0
    const-class v1, Lcom/almworks/sqlite4java/Internal;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "cannot use "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, ": "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/almworks/sqlite4java/Internal;->logFine(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 368
    invoke-static {p0, v0}, Lcom/almworks/sqlite4java/Internal;->updateLoadFailureReason([Ljava/lang/Throwable;Ljava/lang/Throwable;)V

    .line 369
    const/4 v1, 0x0

    goto :goto_0
.end method
