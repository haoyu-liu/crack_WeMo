.class public Lcom/belkin/wemo/push/adm/ADMMD5ChecksumCalculator;
.super Ljava/lang/Object;
.source "ADMMD5ChecksumCalculator.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/belkin/wemo/push/adm/ADMMD5ChecksumCalculator$1;,
        Lcom/belkin/wemo/push/adm/ADMMD5ChecksumCalculator$UTF8CodeUnitStringComparator;
    }
.end annotation


# static fields
.field private static final ALGORITHM:Ljava/lang/String; = "MD5"

.field private static final ENCODING:Ljava/lang/String; = "UTF-8"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 15
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 103
    return-void
.end method

.method private getMd5Bytes(Ljava/lang/String;)[B
    .locals 5
    .param p1, "input"    # Ljava/lang/String;

    .prologue
    .line 85
    :try_start_0
    const-string v3, "UTF-8"

    invoke-virtual {p1, v3}, Ljava/lang/String;->getBytes(Ljava/lang/String;)[B
    :try_end_0
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v2

    .line 91
    .local v2, "serializedBytes":[B
    :try_start_1
    const-string v3, "MD5"

    invoke-static {v3}, Ljava/security/MessageDigest;->getInstance(Ljava/lang/String;)Ljava/security/MessageDigest;
    :try_end_1
    .catch Ljava/security/NoSuchAlgorithmException; {:try_start_1 .. :try_end_1} :catch_1

    move-result-object v0

    .line 95
    .local v0, "digest":Ljava/security/MessageDigest;
    invoke-virtual {v0, v2}, Ljava/security/MessageDigest;->update([B)V

    .line 96
    invoke-virtual {v0}, Ljava/security/MessageDigest;->digest()[B

    move-result-object v3

    return-object v3

    .line 86
    .end local v0    # "digest":Ljava/security/MessageDigest;
    .end local v2    # "serializedBytes":[B
    :catch_0
    move-exception v1

    .line 87
    .local v1, "e":Ljava/io/UnsupportedEncodingException;
    new-instance v3, Ljava/lang/RuntimeException;

    const-string v4, "UTF-8 not supported!"

    invoke-direct {v3, v4, v1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v3

    .line 92
    .end local v1    # "e":Ljava/io/UnsupportedEncodingException;
    .restart local v2    # "serializedBytes":[B
    :catch_1
    move-exception v1

    .line 93
    .local v1, "e":Ljava/security/NoSuchAlgorithmException;
    new-instance v3, Ljava/lang/RuntimeException;

    const-string v4, "MD5 not supported!"

    invoke-direct {v3, v4, v1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v3
.end method

.method private getSerializedMap(Ljava/util/Map;)Ljava/lang/String;
    .locals 10
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)",
            "Ljava/lang/String;"
        }
    .end annotation

    .prologue
    .line 60
    .local p1, "input":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    new-instance v5, Ljava/util/TreeMap;

    new-instance v6, Lcom/belkin/wemo/push/adm/ADMMD5ChecksumCalculator$UTF8CodeUnitStringComparator;

    const/4 v7, 0x0

    invoke-direct {v6, p0, v7}, Lcom/belkin/wemo/push/adm/ADMMD5ChecksumCalculator$UTF8CodeUnitStringComparator;-><init>(Lcom/belkin/wemo/push/adm/ADMMD5ChecksumCalculator;Lcom/belkin/wemo/push/adm/ADMMD5ChecksumCalculator$1;)V

    invoke-direct {v5, v6}, Ljava/util/TreeMap;-><init>(Ljava/util/Comparator;)V

    .line 62
    .local v5, "sortedMap":Ljava/util/SortedMap;, "Ljava/util/SortedMap<Ljava/lang/String;Ljava/lang/String;>;"
    invoke-interface {v5, p1}, Ljava/util/SortedMap;->putAll(Ljava/util/Map;)V

    .line 64
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 65
    .local v0, "builder":Ljava/lang/StringBuilder;
    const/4 v3, 0x1

    .line 66
    .local v3, "numElements":I
    invoke-interface {v5}, Ljava/util/SortedMap;->entrySet()Ljava/util/Set;

    move-result-object v6

    invoke-interface {v6}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v2

    .local v2, "i$":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_1

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/Map$Entry;

    .line 67
    .local v1, "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Ljava/lang/String;>;"
    const-string v6, "%s:%s"

    const/4 v7, 0x2

    new-array v7, v7, [Ljava/lang/Object;

    const/4 v8, 0x0

    invoke-interface {v1}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v9

    aput-object v9, v7, v8

    const/4 v8, 0x1

    invoke-interface {v1}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v9

    aput-object v9, v7, v8

    invoke-static {v6, v7}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v0, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 68
    add-int/lit8 v4, v3, 0x1

    .end local v3    # "numElements":I
    .local v4, "numElements":I
    invoke-interface {v5}, Ljava/util/SortedMap;->size()I

    move-result v6

    if-ge v3, v6, :cond_0

    .line 69
    const-string v6, ","

    invoke-virtual {v0, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    :cond_0
    move v3, v4

    .line 71
    .end local v4    # "numElements":I
    .restart local v3    # "numElements":I
    goto :goto_0

    .line 72
    .end local v1    # "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Ljava/lang/String;>;"
    :cond_1
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    return-object v6
.end method


# virtual methods
.method public calculateChecksum(Ljava/util/Map;)Ljava/lang/String;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)",
            "Ljava/lang/String;"
        }
    .end annotation

    .prologue
    .line 45
    .local p1, "input":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    invoke-direct {p0, p1}, Lcom/belkin/wemo/push/adm/ADMMD5ChecksumCalculator;->getSerializedMap(Ljava/util/Map;)Ljava/lang/String;

    move-result-object v2

    .line 46
    .local v2, "serializedMapData":Ljava/lang/String;
    invoke-direct {p0, v2}, Lcom/belkin/wemo/push/adm/ADMMD5ChecksumCalculator;->getMd5Bytes(Ljava/lang/String;)[B

    move-result-object v1

    .line 47
    .local v1, "md5Bytes":[B
    new-instance v0, Ljava/lang/String;

    const/4 v3, 0x0

    invoke-static {v1, v3}, Landroid/util/Base64;->encode([BI)[B

    move-result-object v3

    invoke-direct {v0, v3}, Ljava/lang/String;-><init>([B)V

    .line 48
    .local v0, "base64Digest":Ljava/lang/String;
    return-object v0
.end method
