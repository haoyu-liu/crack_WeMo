.class final Ljavolution/util/stripped/FastComparator$StringComparator;
.super Ljavolution/util/stripped/FastComparator;
.source "FastComparator.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ljavolution/util/stripped/FastComparator;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "StringComparator"
.end annotation


# direct methods
.method private constructor <init>()V
    .locals 0

    .prologue
    .line 152
    invoke-direct {p0}, Ljavolution/util/stripped/FastComparator;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Ljavolution/util/stripped/FastComparator$1;)V
    .locals 0
    .param p1, "x0"    # Ljavolution/util/stripped/FastComparator$1;

    .prologue
    .line 152
    invoke-direct {p0}, Ljavolution/util/stripped/FastComparator$StringComparator;-><init>()V

    return-void
.end method


# virtual methods
.method public areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z
    .locals 3
    .param p1, "o1"    # Ljava/lang/Object;
    .param p2, "o2"    # Ljava/lang/Object;

    .prologue
    const/4 v0, 0x1

    const/4 v1, 0x0

    .line 168
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
    .param p1, "o1"    # Ljava/lang/Object;
    .param p2, "o2"    # Ljava/lang/Object;

    .prologue
    .line 172
    check-cast p1, Ljava/lang/String;

    .end local p1    # "o1":Ljava/lang/Object;
    check-cast p2, Ljava/lang/String;

    .end local p2    # "o2":Ljava/lang/Object;
    invoke-virtual {p1, p2}, Ljava/lang/String;->compareTo(Ljava/lang/String;)I

    move-result v0

    return v0
.end method

.method public hashCodeOf(Ljava/lang/Object;)I
    .locals 5
    .param p1, "obj"    # Ljava/lang/Object;

    .prologue
    const/4 v2, 0x0

    .line 155
    if-nez p1, :cond_1

    .line 161
    :cond_0
    :goto_0
    return v2

    :cond_1
    move-object v1, p1

    .line 157
    check-cast v1, Ljava/lang/String;

    .line 158
    .local v1, "str":Ljava/lang/String;
    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v0

    .line 159
    .local v0, "length":I
    if-eqz v0, :cond_0

    .line 161
    invoke-virtual {v1, v2}, Ljava/lang/String;->charAt(I)C

    move-result v2

    add-int/lit8 v3, v0, -0x1

    invoke-virtual {v1, v3}, Ljava/lang/String;->charAt(I)C

    move-result v3

    mul-int/lit8 v3, v3, 0x1f

    add-int/2addr v2, v3

    shr-int/lit8 v3, v0, 0x1

    invoke-virtual {v1, v3}, Ljava/lang/String;->charAt(I)C

    move-result v3

    mul-int/lit16 v3, v3, 0x3f1

    add-int/2addr v2, v3

    shr-int/lit8 v3, v0, 0x2

    invoke-virtual {v1, v3}, Ljava/lang/String;->charAt(I)C

    move-result v3

    mul-int/lit16 v3, v3, 0x6bbf

    add-int/2addr v2, v3

    add-int/lit8 v3, v0, -0x1

    shr-int/lit8 v4, v0, 0x2

    sub-int/2addr v3, v4

    invoke-virtual {v1, v3}, Ljava/lang/String;->charAt(I)C

    move-result v3

    const v4, 0x460215b

    mul-int/2addr v3, v4

    add-int/2addr v2, v3

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
    .line 180
    sget-object v0, Ljavolution/util/stripped/FastComparator$StringComparator;->STRING:Ljavolution/util/stripped/FastComparator;

    return-object v0
.end method

.method public toString()Ljava/lang/String;
    .locals 1

    .prologue
    .line 176
    const-string v0, "String"

    return-object v0
.end method
