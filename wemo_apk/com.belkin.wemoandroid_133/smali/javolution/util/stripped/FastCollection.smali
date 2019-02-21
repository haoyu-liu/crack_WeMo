.class public abstract Ljavolution/util/stripped/FastCollection;
.super Ljava/lang/Object;
.source "FastCollection.java"

# interfaces
.implements Ljava/util/Collection;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ljavolution/util/stripped/FastCollection$1;,
        Ljavolution/util/stripped/FastCollection$Shared;,
        Ljavolution/util/stripped/FastCollection$Unmodifiable;,
        Ljavolution/util/stripped/FastCollection$Record;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<E:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;",
        "Ljava/util/Collection",
        "<TE;>;"
    }
.end annotation


# static fields
.field private static final NULL:Ljava/lang/Object;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 693
    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    sput-object v0, Ljavolution/util/stripped/FastCollection;->NULL:Ljava/lang/Object;

    return-void
.end method

.method protected constructor <init>()V
    .locals 0

    .prologue
    .line 74
    .local p0, "this":Ljavolution/util/stripped/FastCollection;, "Ljavolution/util/stripped/FastCollection<TE;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 75
    return-void
.end method

.method static synthetic access$100()Ljava/lang/Object;
    .locals 1

    .prologue
    .line 68
    sget-object v0, Ljavolution/util/stripped/FastCollection;->NULL:Ljava/lang/Object;

    return-object v0
.end method

.method private static contains(Ljava/util/Collection;Ljava/lang/Object;Ljavolution/util/stripped/FastComparator;)Z
    .locals 2
    .param p0, "c"    # Ljava/util/Collection;
    .param p1, "obj"    # Ljava/lang/Object;
    .param p2, "cmp"    # Ljavolution/util/stripped/FastComparator;

    .prologue
    .line 305
    instance-of v1, p0, Ljavolution/util/stripped/FastCollection;

    if-eqz v1, :cond_0

    move-object v1, p0

    check-cast v1, Ljavolution/util/stripped/FastCollection;

    invoke-virtual {v1}, Ljavolution/util/stripped/FastCollection;->getValueComparator()Ljavolution/util/stripped/FastComparator;

    move-result-object v1

    invoke-virtual {v1, p2}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 307
    invoke-interface {p0, p1}, Ljava/util/Collection;->contains(Ljava/lang/Object;)Z

    move-result v1

    .line 313
    :goto_0
    return v1

    .line 308
    :cond_0
    invoke-interface {p0}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .line 309
    .local v0, "itr":Ljava/util/Iterator;, "Ljava/util/Iterator<*>;"
    :cond_1
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_2

    .line 310
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    invoke-virtual {p2, p1, v1}, Ljavolution/util/stripped/FastComparator;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 311
    const/4 v1, 0x1

    goto :goto_0

    .line 313
    :cond_2
    const/4 v1, 0x0

    goto :goto_0
.end method

.method private equalsOrder(Ljava/util/List;)Z
    .locals 10
    .param p1, "that"    # Ljava/util/List;

    .prologue
    .local p0, "this":Ljavolution/util/stripped/FastCollection;, "Ljavolution/util/stripped/FastCollection<TE;>;"
    const/4 v6, 0x1

    const/4 v7, 0x0

    .line 403
    if-ne p1, p0, :cond_1

    .line 415
    :cond_0
    :goto_0
    return v6

    .line 405
    :cond_1
    invoke-virtual {p0}, Ljavolution/util/stripped/FastCollection;->size()I

    move-result v8

    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v9

    if-eq v8, v9, :cond_2

    move v6, v7

    .line 406
    goto :goto_0

    .line 407
    :cond_2
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v5

    .line 408
    .local v5, "thatIterator":Ljava/util/Iterator;
    invoke-virtual {p0}, Ljavolution/util/stripped/FastCollection;->getValueComparator()Ljavolution/util/stripped/FastComparator;

    move-result-object v0

    .line 409
    .local v0, "comp":Ljavolution/util/stripped/FastComparator;
    invoke-virtual {p0}, Ljavolution/util/stripped/FastCollection;->head()Ljavolution/util/stripped/FastCollection$Record;

    move-result-object v4

    .local v4, "r":Ljavolution/util/stripped/FastCollection$Record;
    invoke-virtual {p0}, Ljavolution/util/stripped/FastCollection;->tail()Ljavolution/util/stripped/FastCollection$Record;

    move-result-object v1

    .local v1, "end":Ljavolution/util/stripped/FastCollection$Record;
    :cond_3
    invoke-interface {v4}, Ljavolution/util/stripped/FastCollection$Record;->getNext()Ljavolution/util/stripped/FastCollection$Record;

    move-result-object v4

    if-eq v4, v1, :cond_0

    .line 410
    invoke-virtual {p0, v4}, Ljavolution/util/stripped/FastCollection;->valueOf(Ljavolution/util/stripped/FastCollection$Record;)Ljava/lang/Object;

    move-result-object v2

    .line 411
    .local v2, "o1":Ljava/lang/Object;
    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    .line 412
    .local v3, "o2":Ljava/lang/Object;
    invoke-virtual {v0, v2, v3}, Ljavolution/util/stripped/FastComparator;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v8

    if-nez v8, :cond_3

    move v6, v7

    .line 413
    goto :goto_0
.end method

.method private hashCodeList()I
    .locals 6

    .prologue
    .line 437
    .local p0, "this":Ljavolution/util/stripped/FastCollection;, "Ljavolution/util/stripped/FastCollection<TE;>;"
    invoke-virtual {p0}, Ljavolution/util/stripped/FastCollection;->getValueComparator()Ljavolution/util/stripped/FastComparator;

    move-result-object v0

    .line 438
    .local v0, "comp":Ljavolution/util/stripped/FastComparator;
    const/4 v2, 0x1

    .line 439
    .local v2, "h":I
    invoke-virtual {p0}, Ljavolution/util/stripped/FastCollection;->head()Ljavolution/util/stripped/FastCollection$Record;

    move-result-object v3

    .local v3, "r":Ljavolution/util/stripped/FastCollection$Record;
    invoke-virtual {p0}, Ljavolution/util/stripped/FastCollection;->tail()Ljavolution/util/stripped/FastCollection$Record;

    move-result-object v1

    .local v1, "end":Ljavolution/util/stripped/FastCollection$Record;
    :goto_0
    invoke-interface {v3}, Ljavolution/util/stripped/FastCollection$Record;->getNext()Ljavolution/util/stripped/FastCollection$Record;

    move-result-object v3

    if-eq v3, v1, :cond_0

    .line 440
    mul-int/lit8 v4, v2, 0x1f

    invoke-virtual {p0, v3}, Ljavolution/util/stripped/FastCollection;->valueOf(Ljavolution/util/stripped/FastCollection$Record;)Ljava/lang/Object;

    move-result-object v5

    invoke-virtual {v0, v5}, Ljavolution/util/stripped/FastComparator;->hashCodeOf(Ljava/lang/Object;)I

    move-result v5

    add-int v2, v4, v5

    goto :goto_0

    .line 442
    :cond_0
    return v2
.end method


# virtual methods
.method public add(Ljava/lang/Object;)Z
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TE;)Z"
        }
    .end annotation

    .prologue
    .line 183
    .local p0, "this":Ljavolution/util/stripped/FastCollection;, "Ljavolution/util/stripped/FastCollection<TE;>;"
    .local p1, "value":Ljava/lang/Object;, "TE;"
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    invoke-direct {v0}, Ljava/lang/UnsupportedOperationException;-><init>()V

    throw v0
.end method

.method public addAll(Ljava/util/Collection;)Z
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Collection",
            "<+TE;>;)Z"
        }
    .end annotation

    .prologue
    .line 255
    .local p0, "this":Ljavolution/util/stripped/FastCollection;, "Ljavolution/util/stripped/FastCollection<TE;>;"
    .local p1, "c":Ljava/util/Collection;, "Ljava/util/Collection<+TE;>;"
    const/4 v1, 0x0

    .line 256
    .local v1, "modified":Z
    invoke-interface {p1}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .line 257
    .local v0, "itr":Ljava/util/Iterator;, "Ljava/util/Iterator<+TE;>;"
    :cond_0
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    .line 258
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    invoke-virtual {p0, v2}, Ljavolution/util/stripped/FastCollection;->add(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 259
    const/4 v1, 0x1

    goto :goto_0

    .line 262
    :cond_1
    return v1
.end method

.method public clear()V
    .locals 3

    .prologue
    .line 213
    .local p0, "this":Ljavolution/util/stripped/FastCollection;, "Ljavolution/util/stripped/FastCollection<TE;>;"
    invoke-virtual {p0}, Ljavolution/util/stripped/FastCollection;->head()Ljavolution/util/stripped/FastCollection$Record;

    move-result-object v0

    .local v0, "head":Ljavolution/util/stripped/FastCollection$Record;
    invoke-virtual {p0}, Ljavolution/util/stripped/FastCollection;->tail()Ljavolution/util/stripped/FastCollection$Record;

    move-result-object v2

    invoke-interface {v2}, Ljavolution/util/stripped/FastCollection$Record;->getPrevious()Ljavolution/util/stripped/FastCollection$Record;

    move-result-object v1

    .local v1, "r":Ljavolution/util/stripped/FastCollection$Record;
    :goto_0
    if-eq v1, v0, :cond_0

    .line 214
    invoke-virtual {p0, v1}, Ljavolution/util/stripped/FastCollection;->delete(Ljavolution/util/stripped/FastCollection$Record;)V

    .line 213
    invoke-interface {v1}, Ljavolution/util/stripped/FastCollection$Record;->getPrevious()Ljavolution/util/stripped/FastCollection$Record;

    move-result-object v1

    goto :goto_0

    .line 216
    :cond_0
    return-void
.end method

.method public contains(Ljava/lang/Object;)Z
    .locals 4
    .param p1, "value"    # Ljava/lang/Object;

    .prologue
    .line 237
    .local p0, "this":Ljavolution/util/stripped/FastCollection;, "Ljavolution/util/stripped/FastCollection<TE;>;"
    invoke-virtual {p0}, Ljavolution/util/stripped/FastCollection;->getValueComparator()Ljavolution/util/stripped/FastComparator;

    move-result-object v2

    .line 238
    .local v2, "valueComp":Ljavolution/util/stripped/FastComparator;
    invoke-virtual {p0}, Ljavolution/util/stripped/FastCollection;->head()Ljavolution/util/stripped/FastCollection$Record;

    move-result-object v1

    .local v1, "r":Ljavolution/util/stripped/FastCollection$Record;
    invoke-virtual {p0}, Ljavolution/util/stripped/FastCollection;->tail()Ljavolution/util/stripped/FastCollection$Record;

    move-result-object v0

    .local v0, "end":Ljavolution/util/stripped/FastCollection$Record;
    :cond_0
    invoke-interface {v1}, Ljavolution/util/stripped/FastCollection$Record;->getNext()Ljavolution/util/stripped/FastCollection$Record;

    move-result-object v1

    if-eq v1, v0, :cond_1

    .line 239
    invoke-virtual {p0, v1}, Ljavolution/util/stripped/FastCollection;->valueOf(Ljavolution/util/stripped/FastCollection$Record;)Ljava/lang/Object;

    move-result-object v3

    invoke-virtual {v2, p1, v3}, Ljavolution/util/stripped/FastComparator;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 240
    const/4 v3, 0x1

    .line 242
    :goto_0
    return v3

    :cond_1
    const/4 v3, 0x0

    goto :goto_0
.end method

.method public containsAll(Ljava/util/Collection;)Z
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Collection",
            "<*>;)Z"
        }
    .end annotation

    .prologue
    .line 274
    .local p0, "this":Ljavolution/util/stripped/FastCollection;, "Ljavolution/util/stripped/FastCollection<TE;>;"
    .local p1, "c":Ljava/util/Collection;, "Ljava/util/Collection<*>;"
    invoke-interface {p1}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .line 275
    .local v0, "itr":Ljava/util/Iterator;, "Ljava/util/Iterator<*>;"
    :cond_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1

    .line 276
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    invoke-virtual {p0, v1}, Ljavolution/util/stripped/FastCollection;->contains(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_0

    .line 277
    const/4 v1, 0x0

    .line 279
    :goto_0
    return v1

    :cond_1
    const/4 v1, 0x1

    goto :goto_0
.end method

.method public abstract delete(Ljavolution/util/stripped/FastCollection$Record;)V
.end method

.method public equals(Ljava/lang/Object;)Z
    .locals 4
    .param p1, "obj"    # Ljava/lang/Object;

    .prologue
    .local p0, "this":Ljavolution/util/stripped/FastCollection;, "Ljavolution/util/stripped/FastCollection<TE;>;"
    const/4 v1, 0x0

    .line 392
    instance-of v2, p0, Ljava/util/List;

    if-eqz v2, :cond_1

    .line 393
    instance-of v2, p1, Ljava/util/List;

    if-eqz v2, :cond_0

    check-cast p1, Ljava/util/List;

    .end local p1    # "obj":Ljava/lang/Object;
    invoke-direct {p0, p1}, Ljavolution/util/stripped/FastCollection;->equalsOrder(Ljava/util/List;)Z

    move-result v1

    .line 399
    :cond_0
    :goto_0
    return v1

    .line 394
    .restart local p1    # "obj":Ljava/lang/Object;
    :cond_1
    instance-of v2, p1, Ljava/util/List;

    if-nez v2, :cond_0

    .line 396
    instance-of v2, p1, Ljava/util/Collection;

    if-eqz v2, :cond_0

    move-object v0, p1

    .line 398
    check-cast v0, Ljava/util/Collection;

    .line 399
    .local v0, "that":Ljava/util/Collection;
    if-eq p0, v0, :cond_2

    invoke-virtual {p0}, Ljavolution/util/stripped/FastCollection;->size()I

    move-result v2

    invoke-interface {v0}, Ljava/util/Collection;->size()I

    move-result v3

    if-ne v2, v3, :cond_0

    invoke-virtual {p0, v0}, Ljavolution/util/stripped/FastCollection;->containsAll(Ljava/util/Collection;)Z

    move-result v2

    if-eqz v2, :cond_0

    :cond_2
    const/4 v1, 0x1

    goto :goto_0
.end method

.method public getValueComparator()Ljavolution/util/stripped/FastComparator;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljavolution/util/stripped/FastComparator",
            "<-TE;>;"
        }
    .end annotation

    .prologue
    .line 167
    .local p0, "this":Ljavolution/util/stripped/FastCollection;, "Ljavolution/util/stripped/FastCollection<TE;>;"
    sget-object v0, Ljavolution/util/stripped/FastComparator;->DEFAULT:Ljavolution/util/stripped/FastComparator;

    return-object v0
.end method

.method public hashCode()I
    .locals 5

    .prologue
    .line 426
    .local p0, "this":Ljavolution/util/stripped/FastCollection;, "Ljavolution/util/stripped/FastCollection<TE;>;"
    instance-of v4, p0, Ljava/util/List;

    if-eqz v4, :cond_1

    .line 427
    invoke-direct {p0}, Ljavolution/util/stripped/FastCollection;->hashCodeList()I

    move-result v1

    .line 433
    :cond_0
    return v1

    .line 428
    :cond_1
    invoke-virtual {p0}, Ljavolution/util/stripped/FastCollection;->getValueComparator()Ljavolution/util/stripped/FastComparator;

    move-result-object v3

    .line 429
    .local v3, "valueComp":Ljavolution/util/stripped/FastComparator;
    const/4 v1, 0x0

    .line 430
    .local v1, "hash":I
    invoke-virtual {p0}, Ljavolution/util/stripped/FastCollection;->head()Ljavolution/util/stripped/FastCollection$Record;

    move-result-object v2

    .local v2, "r":Ljavolution/util/stripped/FastCollection$Record;
    invoke-virtual {p0}, Ljavolution/util/stripped/FastCollection;->tail()Ljavolution/util/stripped/FastCollection$Record;

    move-result-object v0

    .local v0, "end":Ljavolution/util/stripped/FastCollection$Record;
    :goto_0
    invoke-interface {v2}, Ljavolution/util/stripped/FastCollection$Record;->getNext()Ljavolution/util/stripped/FastCollection$Record;

    move-result-object v2

    if-eq v2, v0, :cond_0

    .line 431
    invoke-virtual {p0, v2}, Ljavolution/util/stripped/FastCollection;->valueOf(Ljavolution/util/stripped/FastCollection$Record;)Ljava/lang/Object;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljavolution/util/stripped/FastComparator;->hashCodeOf(Ljava/lang/Object;)I

    move-result v4

    add-int/2addr v1, v4

    goto :goto_0
.end method

.method public abstract head()Ljavolution/util/stripped/FastCollection$Record;
.end method

.method public final isEmpty()Z
    .locals 1

    .prologue
    .line 225
    .local p0, "this":Ljavolution/util/stripped/FastCollection;, "Ljavolution/util/stripped/FastCollection<TE;>;"
    invoke-virtual {p0}, Ljavolution/util/stripped/FastCollection;->size()I

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public iterator()Ljava/util/Iterator;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Iterator",
            "<TE;>;"
        }
    .end annotation

    .prologue
    .line 156
    .local p0, "this":Ljavolution/util/stripped/FastCollection;, "Ljavolution/util/stripped/FastCollection<TE;>;"
    invoke-static {p0}, Ljavolution/util/stripped/FastIterator;->valueOf(Ljavolution/util/stripped/FastCollection;)Ljavolution/util/stripped/FastIterator;

    move-result-object v0

    return-object v0
.end method

.method public remove(Ljava/lang/Object;)Z
    .locals 4
    .param p1, "value"    # Ljava/lang/Object;

    .prologue
    .line 196
    .local p0, "this":Ljavolution/util/stripped/FastCollection;, "Ljavolution/util/stripped/FastCollection<TE;>;"
    invoke-virtual {p0}, Ljavolution/util/stripped/FastCollection;->getValueComparator()Ljavolution/util/stripped/FastComparator;

    move-result-object v2

    .line 197
    .local v2, "valueComp":Ljavolution/util/stripped/FastComparator;
    invoke-virtual {p0}, Ljavolution/util/stripped/FastCollection;->head()Ljavolution/util/stripped/FastCollection$Record;

    move-result-object v1

    .local v1, "r":Ljavolution/util/stripped/FastCollection$Record;
    invoke-virtual {p0}, Ljavolution/util/stripped/FastCollection;->tail()Ljavolution/util/stripped/FastCollection$Record;

    move-result-object v0

    .local v0, "end":Ljavolution/util/stripped/FastCollection$Record;
    :cond_0
    invoke-interface {v1}, Ljavolution/util/stripped/FastCollection$Record;->getNext()Ljavolution/util/stripped/FastCollection$Record;

    move-result-object v1

    if-eq v1, v0, :cond_1

    .line 198
    invoke-virtual {p0, v1}, Ljavolution/util/stripped/FastCollection;->valueOf(Ljavolution/util/stripped/FastCollection$Record;)Ljava/lang/Object;

    move-result-object v3

    invoke-virtual {v2, p1, v3}, Ljavolution/util/stripped/FastComparator;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 199
    invoke-virtual {p0, v1}, Ljavolution/util/stripped/FastCollection;->delete(Ljavolution/util/stripped/FastCollection$Record;)V

    .line 200
    const/4 v3, 0x1

    .line 203
    :goto_0
    return v3

    :cond_1
    const/4 v3, 0x0

    goto :goto_0
.end method

.method public removeAll(Ljava/util/Collection;)Z
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Collection",
            "<*>;)Z"
        }
    .end annotation

    .prologue
    .line 292
    .local p0, "this":Ljavolution/util/stripped/FastCollection;, "Ljavolution/util/stripped/FastCollection<TE;>;"
    .local p1, "c":Ljava/util/Collection;, "Ljava/util/Collection<*>;"
    const/4 v1, 0x0

    .line 294
    .local v1, "modified":Z
    invoke-virtual {p0}, Ljavolution/util/stripped/FastCollection;->head()Ljavolution/util/stripped/FastCollection$Record;

    move-result-object v0

    .local v0, "head":Ljavolution/util/stripped/FastCollection$Record;
    invoke-virtual {p0}, Ljavolution/util/stripped/FastCollection;->tail()Ljavolution/util/stripped/FastCollection$Record;

    move-result-object v4

    invoke-interface {v4}, Ljavolution/util/stripped/FastCollection$Record;->getPrevious()Ljavolution/util/stripped/FastCollection$Record;

    move-result-object v3

    .local v3, "r":Ljavolution/util/stripped/FastCollection$Record;
    :goto_0
    if-eq v3, v0, :cond_1

    .line 295
    invoke-interface {v3}, Ljavolution/util/stripped/FastCollection$Record;->getPrevious()Ljavolution/util/stripped/FastCollection$Record;

    move-result-object v2

    .line 296
    .local v2, "previous":Ljavolution/util/stripped/FastCollection$Record;
    invoke-virtual {p0, v3}, Ljavolution/util/stripped/FastCollection;->valueOf(Ljavolution/util/stripped/FastCollection$Record;)Ljava/lang/Object;

    move-result-object v4

    invoke-virtual {p0}, Ljavolution/util/stripped/FastCollection;->getValueComparator()Ljavolution/util/stripped/FastComparator;

    move-result-object v5

    invoke-static {p1, v4, v5}, Ljavolution/util/stripped/FastCollection;->contains(Ljava/util/Collection;Ljava/lang/Object;Ljavolution/util/stripped/FastComparator;)Z

    move-result v4

    if-eqz v4, :cond_0

    .line 297
    invoke-virtual {p0, v3}, Ljavolution/util/stripped/FastCollection;->delete(Ljavolution/util/stripped/FastCollection$Record;)V

    .line 298
    const/4 v1, 0x1

    .line 294
    :cond_0
    move-object v3, v2

    goto :goto_0

    .line 301
    .end local v2    # "previous":Ljavolution/util/stripped/FastCollection$Record;
    :cond_1
    return v1
.end method

.method public retainAll(Ljava/util/Collection;)Z
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Collection",
            "<*>;)Z"
        }
    .end annotation

    .prologue
    .line 325
    .local p0, "this":Ljavolution/util/stripped/FastCollection;, "Ljavolution/util/stripped/FastCollection<TE;>;"
    .local p1, "c":Ljava/util/Collection;, "Ljava/util/Collection<*>;"
    const/4 v1, 0x0

    .line 327
    .local v1, "modified":Z
    invoke-virtual {p0}, Ljavolution/util/stripped/FastCollection;->head()Ljavolution/util/stripped/FastCollection$Record;

    move-result-object v0

    .local v0, "head":Ljavolution/util/stripped/FastCollection$Record;
    invoke-virtual {p0}, Ljavolution/util/stripped/FastCollection;->tail()Ljavolution/util/stripped/FastCollection$Record;

    move-result-object v4

    invoke-interface {v4}, Ljavolution/util/stripped/FastCollection$Record;->getPrevious()Ljavolution/util/stripped/FastCollection$Record;

    move-result-object v3

    .local v3, "r":Ljavolution/util/stripped/FastCollection$Record;
    :goto_0
    if-eq v3, v0, :cond_1

    .line 328
    invoke-interface {v3}, Ljavolution/util/stripped/FastCollection$Record;->getPrevious()Ljavolution/util/stripped/FastCollection$Record;

    move-result-object v2

    .line 329
    .local v2, "previous":Ljavolution/util/stripped/FastCollection$Record;
    invoke-virtual {p0, v3}, Ljavolution/util/stripped/FastCollection;->valueOf(Ljavolution/util/stripped/FastCollection$Record;)Ljava/lang/Object;

    move-result-object v4

    invoke-virtual {p0}, Ljavolution/util/stripped/FastCollection;->getValueComparator()Ljavolution/util/stripped/FastComparator;

    move-result-object v5

    invoke-static {p1, v4, v5}, Ljavolution/util/stripped/FastCollection;->contains(Ljava/util/Collection;Ljava/lang/Object;Ljavolution/util/stripped/FastComparator;)Z

    move-result v4

    if-nez v4, :cond_0

    .line 330
    invoke-virtual {p0, v3}, Ljavolution/util/stripped/FastCollection;->delete(Ljavolution/util/stripped/FastCollection$Record;)V

    .line 331
    const/4 v1, 0x1

    .line 327
    :cond_0
    move-object v3, v2

    goto :goto_0

    .line 334
    .end local v2    # "previous":Ljavolution/util/stripped/FastCollection$Record;
    :cond_1
    return v1
.end method

.method public shared()Ljava/util/Collection;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Collection",
            "<TE;>;"
        }
    .end annotation

    .prologue
    .line 146
    .local p0, "this":Ljavolution/util/stripped/FastCollection;, "Ljavolution/util/stripped/FastCollection<TE;>;"
    new-instance v0, Ljavolution/util/stripped/FastCollection$Shared;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Ljavolution/util/stripped/FastCollection$Shared;-><init>(Ljavolution/util/stripped/FastCollection;Ljavolution/util/stripped/FastCollection$1;)V

    return-object v0
.end method

.method public abstract size()I
.end method

.method public abstract tail()Ljavolution/util/stripped/FastCollection$Record;
.end method

.method public toArray()[Ljava/lang/Object;
    .locals 1

    .prologue
    .line 345
    .local p0, "this":Ljavolution/util/stripped/FastCollection;, "Ljavolution/util/stripped/FastCollection<TE;>;"
    invoke-virtual {p0}, Ljavolution/util/stripped/FastCollection;->size()I

    move-result v0

    new-array v0, v0, [Ljava/lang/Object;

    invoke-virtual {p0, v0}, Ljavolution/util/stripped/FastCollection;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public toArray([Ljava/lang/Object;)[Ljava/lang/Object;
    .locals 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">([TT;)[TT;"
        }
    .end annotation

    .prologue
    .line 363
    .local p0, "this":Ljavolution/util/stripped/FastCollection;, "Ljavolution/util/stripped/FastCollection<TE;>;"
    .local p1, "array":[Ljava/lang/Object;, "[TT;"
    invoke-virtual {p0}, Ljavolution/util/stripped/FastCollection;->size()I

    move-result v5

    .line 364
    .local v5, "size":I
    array-length v6, p1

    if-ge v6, v5, :cond_0

    .line 365
    new-instance v6, Ljava/lang/UnsupportedOperationException;

    const-string v7, "Destination array too small"

    invoke-direct {v6, v7}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v6

    .line 367
    :cond_0
    array-length v6, p1

    if-le v6, v5, :cond_1

    .line 368
    const/4 v6, 0x0

    aput-object v6, p1, v5

    .line 370
    :cond_1
    const/4 v2, 0x0

    .line 371
    .local v2, "i":I
    move-object v0, p1

    .line 372
    .local v0, "arrayView":[Ljava/lang/Object;
    invoke-virtual {p0}, Ljavolution/util/stripped/FastCollection;->head()Ljavolution/util/stripped/FastCollection$Record;

    move-result-object v4

    .local v4, "r":Ljavolution/util/stripped/FastCollection$Record;
    invoke-virtual {p0}, Ljavolution/util/stripped/FastCollection;->tail()Ljavolution/util/stripped/FastCollection$Record;

    move-result-object v1

    .local v1, "end":Ljavolution/util/stripped/FastCollection$Record;
    :goto_0
    invoke-interface {v4}, Ljavolution/util/stripped/FastCollection$Record;->getNext()Ljavolution/util/stripped/FastCollection$Record;

    move-result-object v4

    if-eq v4, v1, :cond_2

    .line 373
    add-int/lit8 v3, v2, 0x1

    .end local v2    # "i":I
    .local v3, "i":I
    invoke-virtual {p0, v4}, Ljavolution/util/stripped/FastCollection;->valueOf(Ljavolution/util/stripped/FastCollection$Record;)Ljava/lang/Object;

    move-result-object v6

    aput-object v6, v0, v2

    move v2, v3

    .end local v3    # "i":I
    .restart local v2    # "i":I
    goto :goto_0

    .line 375
    :cond_2
    return-object p1
.end method

.method public unmodifiable()Ljava/util/Collection;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Collection",
            "<TE;>;"
        }
    .end annotation

    .prologue
    .line 130
    .local p0, "this":Ljavolution/util/stripped/FastCollection;, "Ljavolution/util/stripped/FastCollection<TE;>;"
    new-instance v0, Ljavolution/util/stripped/FastCollection$Unmodifiable;

    invoke-direct {v0, p0}, Ljavolution/util/stripped/FastCollection$Unmodifiable;-><init>(Ljavolution/util/stripped/FastCollection;)V

    return-object v0
.end method

.method public abstract valueOf(Ljavolution/util/stripped/FastCollection$Record;)Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljavolution/util/stripped/FastCollection$Record;",
            ")TE;"
        }
    .end annotation
.end method
