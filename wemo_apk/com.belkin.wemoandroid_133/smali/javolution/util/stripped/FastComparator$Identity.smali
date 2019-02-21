.class final Ljavolution/util/stripped/FastComparator$Identity;
.super Ljavolution/util/stripped/FastComparator;
.source "FastComparator.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ljavolution/util/stripped/FastComparator;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "Identity"
.end annotation


# direct methods
.method private constructor <init>()V
    .locals 0

    .prologue
    .line 192
    invoke-direct {p0}, Ljavolution/util/stripped/FastComparator;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Ljavolution/util/stripped/FastComparator$1;)V
    .locals 0
    .param p1, "x0"    # Ljavolution/util/stripped/FastComparator$1;

    .prologue
    .line 192
    invoke-direct {p0}, Ljavolution/util/stripped/FastComparator$Identity;-><init>()V

    return-void
.end method


# virtual methods
.method public areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z
    .locals 1
    .param p1, "o1"    # Ljava/lang/Object;
    .param p2, "o2"    # Ljava/lang/Object;

    .prologue
    .line 206
    if-ne p1, p2, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public compare(Ljava/lang/Object;Ljava/lang/Object;)I
    .locals 1
    .param p1, "o1"    # Ljava/lang/Object;
    .param p2, "o2"    # Ljava/lang/Object;

    .prologue
    .line 210
    check-cast p1, Ljava/lang/Comparable;

    .end local p1    # "o1":Ljava/lang/Object;
    invoke-interface {p1, p2}, Ljava/lang/Comparable;->compareTo(Ljava/lang/Object;)I

    move-result v0

    return v0
.end method

.method public hashCodeOf(Ljava/lang/Object;)I
    .locals 2
    .param p1, "obj"    # Ljava/lang/Object;

    .prologue
    .line 195
    invoke-static {p1}, Ljava/lang/System;->identityHashCode(Ljava/lang/Object;)I

    move-result v0

    .line 196
    .local v0, "h":I
    sget-boolean v1, Ljavolution/util/stripped/FastComparator$Identity;->_Rehash:Z

    if-nez v1, :cond_0

    move v1, v0

    .line 201
    :goto_0
    return v1

    .line 198
    :cond_0
    shl-int/lit8 v1, v0, 0x9

    xor-int/lit8 v1, v1, -0x1

    add-int/2addr v0, v1

    .line 199
    ushr-int/lit8 v1, v0, 0xe

    xor-int/2addr v0, v1

    .line 200
    shl-int/lit8 v1, v0, 0x4

    add-int/2addr v0, v1

    .line 201
    ushr-int/lit8 v1, v0, 0xa

    xor-int/2addr v1, v0

    goto :goto_0
.end method

.method public readResolve()Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/ObjectStreamException;
        }
    .end annotation

    .prologue
    .line 218
    sget-object v0, Ljavolution/util/stripped/FastComparator$Identity;->IDENTITY:Ljavolution/util/stripped/FastComparator;

    return-object v0
.end method

.method public toString()Ljava/lang/String;
    .locals 1

    .prologue
    .line 214
    const-string v0, "Identity"

    return-object v0
.end method
