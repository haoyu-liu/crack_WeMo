.class public abstract Ljavolution/util/stripped/FastComparator;
.super Ljava/lang/Object;
.source "FastComparator.java"

# interfaces
.implements Ljava/util/Comparator;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ljavolution/util/stripped/FastComparator$1;,
        Ljavolution/util/stripped/FastComparator$Lexical;,
        Ljavolution/util/stripped/FastComparator$Identity;,
        Ljavolution/util/stripped/FastComparator$StringComparator;,
        Ljavolution/util/stripped/FastComparator$Rehash;,
        Ljavolution/util/stripped/FastComparator$Direct;,
        Ljavolution/util/stripped/FastComparator$Default;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;",
        "Ljava/util/Comparator",
        "<TT;>;"
    }
.end annotation


# static fields
.field public static final DEFAULT:Ljavolution/util/stripped/FastComparator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljavolution/util/stripped/FastComparator",
            "<",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation
.end field

.field public static final DIRECT:Ljavolution/util/stripped/FastComparator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljavolution/util/stripped/FastComparator",
            "<",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation
.end field

.field public static final IDENTITY:Ljavolution/util/stripped/FastComparator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljavolution/util/stripped/FastComparator",
            "<",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation
.end field

.field public static final LEXICAL:Ljavolution/util/stripped/FastComparator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljavolution/util/stripped/FastComparator",
            "<",
            "Ljava/lang/CharSequence;",
            ">;"
        }
    .end annotation
.end field

.field public static final REHASH:Ljavolution/util/stripped/FastComparator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljavolution/util/stripped/FastComparator",
            "<",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation
.end field

.field public static final STRING:Ljavolution/util/stripped/FastComparator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljavolution/util/stripped/FastComparator",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field public static _Rehash:Z


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 31
    invoke-static {}, Ljavolution/util/stripped/FastComparator;->isPoorSystemHash()Z

    move-result v0

    sput-boolean v0, Ljavolution/util/stripped/FastComparator;->_Rehash:Z

    .line 51
    new-instance v0, Ljavolution/util/stripped/FastComparator$Default;

    invoke-direct {v0, v1}, Ljavolution/util/stripped/FastComparator$Default;-><init>(Ljavolution/util/stripped/FastComparator$1;)V

    sput-object v0, Ljavolution/util/stripped/FastComparator;->DEFAULT:Ljavolution/util/stripped/FastComparator;

    .line 82
    new-instance v0, Ljavolution/util/stripped/FastComparator$Direct;

    invoke-direct {v0, v1}, Ljavolution/util/stripped/FastComparator$Direct;-><init>(Ljavolution/util/stripped/FastComparator$1;)V

    sput-object v0, Ljavolution/util/stripped/FastComparator;->DIRECT:Ljavolution/util/stripped/FastComparator;

    .line 113
    new-instance v0, Ljavolution/util/stripped/FastComparator$Rehash;

    invoke-direct {v0, v1}, Ljavolution/util/stripped/FastComparator$Rehash;-><init>(Ljavolution/util/stripped/FastComparator$1;)V

    sput-object v0, Ljavolution/util/stripped/FastComparator;->REHASH:Ljavolution/util/stripped/FastComparator;

    .line 150
    new-instance v0, Ljavolution/util/stripped/FastComparator$StringComparator;

    invoke-direct {v0, v1}, Ljavolution/util/stripped/FastComparator$StringComparator;-><init>(Ljavolution/util/stripped/FastComparator$1;)V

    sput-object v0, Ljavolution/util/stripped/FastComparator;->STRING:Ljavolution/util/stripped/FastComparator;

    .line 190
    new-instance v0, Ljavolution/util/stripped/FastComparator$Identity;

    invoke-direct {v0, v1}, Ljavolution/util/stripped/FastComparator$Identity;-><init>(Ljavolution/util/stripped/FastComparator$1;)V

    sput-object v0, Ljavolution/util/stripped/FastComparator;->IDENTITY:Ljavolution/util/stripped/FastComparator;

    .line 229
    new-instance v0, Ljavolution/util/stripped/FastComparator$Lexical;

    invoke-direct {v0, v1}, Ljavolution/util/stripped/FastComparator$Lexical;-><init>(Ljavolution/util/stripped/FastComparator$1;)V

    sput-object v0, Ljavolution/util/stripped/FastComparator;->LEXICAL:Ljavolution/util/stripped/FastComparator;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 29
    .local p0, "this":Ljavolution/util/stripped/FastComparator;, "Ljavolution/util/stripped/FastComparator<TT;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private static isPoorSystemHash()Z
    .locals 8

    .prologue
    const/4 v6, 0x0

    const/4 v5, 0x1

    .line 34
    const/16 v4, 0x40

    new-array v0, v4, [Z

    .line 35
    .local v0, "dist":[Z
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    array-length v4, v0

    if-ge v1, v4, :cond_0

    .line 36
    new-instance v4, Ljava/lang/Object;

    invoke-direct {v4}, Ljava/lang/Object;-><init>()V

    invoke-virtual {v4}, Ljava/lang/Object;->hashCode()I

    move-result v4

    array-length v7, v0

    add-int/lit8 v7, v7, -0x1

    and-int/2addr v4, v7

    aput-boolean v5, v0, v4

    .line 35
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 38
    :cond_0
    const/4 v3, 0x0

    .line 39
    .local v3, "occupied":I
    const/4 v1, 0x0

    :goto_1
    array-length v4, v0

    if-ge v1, v4, :cond_2

    .line 40
    add-int/lit8 v2, v1, 0x1

    .end local v1    # "i":I
    .local v2, "i":I
    aget-boolean v4, v0, v1

    if-eqz v4, :cond_1

    move v4, v5

    :goto_2
    add-int/2addr v3, v4

    move v1, v2

    .end local v2    # "i":I
    .restart local v1    # "i":I
    goto :goto_1

    .end local v1    # "i":I
    .restart local v2    # "i":I
    :cond_1
    move v4, v6

    goto :goto_2

    .line 42
    .end local v2    # "i":I
    .restart local v1    # "i":I
    :cond_2
    array-length v4, v0

    shr-int/lit8 v4, v4, 0x2

    if-ge v3, v4, :cond_3

    :goto_3
    return v5

    :cond_3
    move v5, v6

    goto :goto_3
.end method


# virtual methods
.method public abstract areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;TT;)Z"
        }
    .end annotation
.end method

.method public abstract compare(Ljava/lang/Object;Ljava/lang/Object;)I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;TT;)I"
        }
    .end annotation
.end method

.method public abstract hashCodeOf(Ljava/lang/Object;)I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)I"
        }
    .end annotation
.end method
