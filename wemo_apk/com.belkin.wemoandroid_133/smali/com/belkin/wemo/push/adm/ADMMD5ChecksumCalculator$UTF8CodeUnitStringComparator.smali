.class Lcom/belkin/wemo/push/adm/ADMMD5ChecksumCalculator$UTF8CodeUnitStringComparator;
.super Ljava/lang/Object;
.source "ADMMD5ChecksumCalculator.java"

# interfaces
.implements Ljava/util/Comparator;
.implements Ljava/io/Serializable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/belkin/wemo/push/adm/ADMMD5ChecksumCalculator;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "UTF8CodeUnitStringComparator"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ljava/util/Comparator",
        "<",
        "Ljava/lang/String;",
        ">;",
        "Ljava/io/Serializable;"
    }
.end annotation


# static fields
.field private static final serialVersionUID:J = -0x6b9cc222aa6642aaL


# instance fields
.field final synthetic this$0:Lcom/belkin/wemo/push/adm/ADMMD5ChecksumCalculator;


# direct methods
.method private constructor <init>(Lcom/belkin/wemo/push/adm/ADMMD5ChecksumCalculator;)V
    .locals 0

    .prologue
    .line 103
    iput-object p1, p0, Lcom/belkin/wemo/push/adm/ADMMD5ChecksumCalculator$UTF8CodeUnitStringComparator;->this$0:Lcom/belkin/wemo/push/adm/ADMMD5ChecksumCalculator;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/belkin/wemo/push/adm/ADMMD5ChecksumCalculator;Lcom/belkin/wemo/push/adm/ADMMD5ChecksumCalculator$1;)V
    .locals 0
    .param p1, "x0"    # Lcom/belkin/wemo/push/adm/ADMMD5ChecksumCalculator;
    .param p2, "x1"    # Lcom/belkin/wemo/push/adm/ADMMD5ChecksumCalculator$1;

    .prologue
    .line 103
    invoke-direct {p0, p1}, Lcom/belkin/wemo/push/adm/ADMMD5ChecksumCalculator$UTF8CodeUnitStringComparator;-><init>(Lcom/belkin/wemo/push/adm/ADMMD5ChecksumCalculator;)V

    return-void
.end method


# virtual methods
.method public bridge synthetic compare(Ljava/lang/Object;Ljava/lang/Object;)I
    .locals 1
    .param p1, "x0"    # Ljava/lang/Object;
    .param p2, "x1"    # Ljava/lang/Object;

    .prologue
    .line 103
    check-cast p1, Ljava/lang/String;

    .end local p1    # "x0":Ljava/lang/Object;
    check-cast p2, Ljava/lang/String;

    .end local p2    # "x1":Ljava/lang/Object;
    invoke-virtual {p0, p1, p2}, Lcom/belkin/wemo/push/adm/ADMMD5ChecksumCalculator$UTF8CodeUnitStringComparator;->compare(Ljava/lang/String;Ljava/lang/String;)I

    move-result v0

    return v0
.end method

.method public compare(Ljava/lang/String;Ljava/lang/String;)I
    .locals 9
    .param p1, "str1"    # Ljava/lang/String;
    .param p2, "str2"    # Ljava/lang/String;

    .prologue
    .line 116
    :try_start_0
    const-string v7, "UTF-8"

    invoke-virtual {p1, v7}, Ljava/lang/String;->getBytes(Ljava/lang/String;)[B

    move-result-object v0

    .line 117
    .local v0, "bytes1":[B
    const-string v7, "UTF-8"

    invoke-virtual {p2, v7}, Ljava/lang/String;->getBytes(Ljava/lang/String;)[B

    move-result-object v1

    .line 119
    .local v1, "bytes2":[B
    array-length v7, v0

    array-length v8, v1

    invoke-static {v7, v8}, Ljava/lang/Math;->min(II)I

    move-result v4

    .line 120
    .local v4, "loopBounds":I
    const/4 v3, 0x0

    .local v3, "i":I
    :goto_0
    if-ge v3, v4, :cond_1

    .line 122
    aget-byte v7, v0, v3

    and-int/lit16 v5, v7, 0xff

    .line 123
    .local v5, "ub1":I
    aget-byte v7, v1, v3

    and-int/lit16 v6, v7, 0xff

    .line 125
    .local v6, "ub2":I
    if-eq v5, v6, :cond_0

    .line 126
    sub-int v7, v5, v6

    .line 132
    .end local v5    # "ub1":I
    .end local v6    # "ub2":I
    :goto_1
    return v7

    .line 120
    .restart local v5    # "ub1":I
    .restart local v6    # "ub2":I
    :cond_0
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 132
    .end local v5    # "ub1":I
    .end local v6    # "ub2":I
    :cond_1
    array-length v7, v0

    array-length v8, v1
    :try_end_0
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_0 .. :try_end_0} :catch_0

    sub-int/2addr v7, v8

    goto :goto_1

    .line 133
    .end local v0    # "bytes1":[B
    .end local v1    # "bytes2":[B
    .end local v3    # "i":I
    .end local v4    # "loopBounds":I
    :catch_0
    move-exception v2

    .line 134
    .local v2, "e":Ljava/io/UnsupportedEncodingException;
    new-instance v7, Ljava/lang/RuntimeException;

    const-string v8, "UTF-8 not supported!"

    invoke-direct {v7, v8, v2}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v7
.end method
