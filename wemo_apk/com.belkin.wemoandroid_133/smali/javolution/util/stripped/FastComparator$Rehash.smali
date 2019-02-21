.class final Ljavolution/util/stripped/FastComparator$Rehash;
.super Ljavolution/util/stripped/FastComparator;
.source "FastComparator.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ljavolution/util/stripped/FastComparator;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "Rehash"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Ljavolution/util/stripped/FastComparator",
        "<TT;>;"
    }
.end annotation


# direct methods
.method private constructor <init>()V
    .locals 0

    .prologue
    .line 115
    .local p0, "this":Ljavolution/util/stripped/FastComparator$Rehash;, "Ljavolution/util/stripped/FastComparator$Rehash<TT;>;"
    invoke-direct {p0}, Ljavolution/util/stripped/FastComparator;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Ljavolution/util/stripped/FastComparator$1;)V
    .locals 0
    .param p1, "x0"    # Ljavolution/util/stripped/FastComparator$1;

    .prologue
    .line 115
    .local p0, "this":Ljavolution/util/stripped/FastComparator$Rehash;, "Ljavolution/util/stripped/FastComparator$Rehash<TT;>;"
    invoke-direct {p0}, Ljavolution/util/stripped/FastComparator$Rehash;-><init>()V

    return-void
.end method


# virtual methods
.method public areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;TT;)Z"
        }
    .end annotation

    .prologue
    .local p0, "this":Ljavolution/util/stripped/FastComparator$Rehash;, "Ljavolution/util/stripped/FastComparator$Rehash<TT;>;"
    .local p1, "o1":Ljava/lang/Object;, "TT;"
    .local p2, "o2":Ljava/lang/Object;, "TT;"
    const/4 v0, 0x1

    const/4 v1, 0x0

    .line 130
    if-nez p1, :cond_2

    if-nez p2, :cond_1

    :cond_0
    :goto_0
    return v0

    :cond_1
    move v0, v1

    goto :goto_0

    :cond_2
    if-eq p1, p2, :cond_0

    invoke-virtual {p1, p2}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_0

    move v0, v1

    goto :goto_0
.end method

.method public compare(Ljava/lang/Object;Ljava/lang/Object;)I
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;TT;)I"
        }
    .end annotation

    .prologue
    .line 134
    .local p0, "this":Ljavolution/util/stripped/FastComparator$Rehash;, "Ljavolution/util/stripped/FastComparator$Rehash<TT;>;"
    .local p1, "o1":Ljava/lang/Object;, "TT;"
    .local p2, "o2":Ljava/lang/Object;, "TT;"
    check-cast p1, Ljava/lang/Comparable;

    .end local p1    # "o1":Ljava/lang/Object;, "TT;"
    invoke-interface {p1, p2}, Ljava/lang/Comparable;->compareTo(Ljava/lang/Object;)I

    move-result v0

    return v0
.end method

.method public hashCodeOf(Ljava/lang/Object;)I
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)I"
        }
    .end annotation

    .prologue
    .line 118
    .local p0, "this":Ljavolution/util/stripped/FastComparator$Rehash;, "Ljavolution/util/stripped/FastComparator$Rehash<TT;>;"
    .local p1, "obj":Ljava/lang/Object;, "TT;"
    if-nez p1, :cond_0

    .line 119
    const/4 v1, 0x0

    .line 126
    :goto_0
    return v1

    .line 122
    :cond_0
    invoke-virtual {p1}, Ljava/lang/Object;->hashCode()I

    move-result v0

    .line 123
    .local v0, "h":I
    shl-int/lit8 v1, v0, 0x9

    xor-int/lit8 v1, v1, -0x1

    add-int/2addr v0, v1

    .line 124
    ushr-int/lit8 v1, v0, 0xe

    xor-int/2addr v0, v1

    .line 125
    shl-int/lit8 v1, v0, 0x4

    add-int/2addr v0, v1

    .line 126
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
    .line 142
    .local p0, "this":Ljavolution/util/stripped/FastComparator$Rehash;, "Ljavolution/util/stripped/FastComparator$Rehash<TT;>;"
    sget-object v0, Ljavolution/util/stripped/FastComparator$Rehash;->REHASH:Ljavolution/util/stripped/FastComparator;

    return-object v0
.end method

.method public toString()Ljava/lang/String;
    .locals 1

    .prologue
    .line 138
    .local p0, "this":Ljavolution/util/stripped/FastComparator$Rehash;, "Ljavolution/util/stripped/FastComparator$Rehash<TT;>;"
    const-string v0, "Rehash"

    return-object v0
.end method
