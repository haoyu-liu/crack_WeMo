.class public Ljavolution/util/stripped/FastMap;
.super Ljava/lang/Object;
.source "FastMap.java"

# interfaces
.implements Ljava/util/Map;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ljavolution/util/stripped/FastMap$1;,
        Ljavolution/util/stripped/FastMap$Unmodifiable;,
        Ljavolution/util/stripped/FastMap$Entry;,
        Ljavolution/util/stripped/FastMap$KeyIterator;,
        Ljavolution/util/stripped/FastMap$KeySet;,
        Ljavolution/util/stripped/FastMap$EntryIterator;,
        Ljavolution/util/stripped/FastMap$EntrySet;,
        Ljavolution/util/stripped/FastMap$ValueIterator;,
        Ljavolution/util/stripped/FastMap$Values;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<K:",
        "Ljava/lang/Object;",
        "V:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;",
        "Ljava/util/Map",
        "<TK;TV;>;"
    }
.end annotation


# static fields
.field private static final B0:I = 0x4

.field private static final B1:I = 0xa

.field private static final B2:I = 0x6

.field private static final C0:I = 0x10

.field private static final C1:I = 0x400

.field private static final C2:I = 0x40

.field private static final NULL_ENTRIES:[Ljavolution/util/stripped/FastMap$Entry;

.field static volatile ONE_VOLATILE:I = 0x0

.field public static final logger:Ljava/util/logging/Logger;

.field private static final serialVersionUID:J = 0x1L


# instance fields
.field private transient _entries:[Ljavolution/util/stripped/FastMap$Entry;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "[",
            "Ljavolution/util/stripped/FastMap$Entry",
            "<TK;TV;>;"
        }
    .end annotation
.end field

.field private transient _entryCount:I

.field private transient _entrySet:Ljavolution/util/stripped/FastMap$EntrySet;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljavolution/util/stripped/FastMap",
            "<TK;TV;>.EntrySet;"
        }
    .end annotation
.end field

.field private transient _head:Ljavolution/util/stripped/FastMap$Entry;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljavolution/util/stripped/FastMap$Entry",
            "<TK;TV;>;"
        }
    .end annotation
.end field

.field private transient _isDirectKeyComparator:Z

.field private transient _isShared:Z

.field private transient _keyComparator:Ljavolution/util/stripped/FastComparator;

.field private transient _keySet:Ljavolution/util/stripped/FastMap$KeySet;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljavolution/util/stripped/FastMap",
            "<TK;TV;>.KeySet;"
        }
    .end annotation
.end field

.field private transient _keyShift:I

.field private transient _nullCount:I

.field private transient _subMaps:[Ljavolution/util/stripped/FastMap;

.field private transient _tail:Ljavolution/util/stripped/FastMap$Entry;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljavolution/util/stripped/FastMap$Entry",
            "<TK;TV;>;"
        }
    .end annotation
.end field

.field private transient _unmodifiable:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<TK;TV;>;"
        }
    .end annotation
.end field

.field private transient _useSubMaps:Z

.field private transient _valueComparator:Ljavolution/util/stripped/FastComparator;

.field private transient _values:Ljavolution/util/stripped/FastMap$Values;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljavolution/util/stripped/FastMap",
            "<TK;TV;>.Values;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 112
    const-string v0, "javolution.util"

    invoke-static {v0}, Ljava/util/logging/Logger;->getLogger(Ljava/lang/String;)Ljava/util/logging/Logger;

    move-result-object v0

    sput-object v0, Ljavolution/util/stripped/FastMap;->logger:Ljava/util/logging/Logger;

    .line 1629
    const/16 v0, 0x400

    new-array v0, v0, [Ljavolution/util/stripped/FastMap$Entry;

    sput-object v0, Ljavolution/util/stripped/FastMap;->NULL_ENTRIES:[Ljavolution/util/stripped/FastMap$Entry;

    .line 1630
    const/4 v0, 0x1

    sput v0, Ljavolution/util/stripped/FastMap;->ONE_VOLATILE:I

    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .prologue
    .line 195
    .local p0, "this":Ljavolution/util/stripped/FastMap;, "Ljavolution/util/stripped/FastMap<TK;TV;>;"
    const/4 v0, 0x4

    invoke-direct {p0, v0}, Ljavolution/util/stripped/FastMap;-><init>(I)V

    .line 196
    return-void
.end method

.method public constructor <init>(I)V
    .locals 1
    .param p1, "capacity"    # I

    .prologue
    .line 204
    .local p0, "this":Ljavolution/util/stripped/FastMap;, "Ljavolution/util/stripped/FastMap<TK;TV;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 205
    sget-object v0, Ljavolution/util/stripped/FastComparator;->DEFAULT:Ljavolution/util/stripped/FastComparator;

    invoke-virtual {p0, v0}, Ljavolution/util/stripped/FastMap;->setKeyComparator(Ljavolution/util/stripped/FastComparator;)Ljavolution/util/stripped/FastMap;

    .line 206
    sget-object v0, Ljavolution/util/stripped/FastComparator;->DEFAULT:Ljavolution/util/stripped/FastComparator;

    invoke-virtual {p0, v0}, Ljavolution/util/stripped/FastMap;->setValueComparator(Ljavolution/util/stripped/FastComparator;)Ljavolution/util/stripped/FastMap;

    .line 207
    invoke-direct {p0, p1}, Ljavolution/util/stripped/FastMap;->setup(I)V

    .line 208
    return-void
.end method

.method public constructor <init>(Ljava/util/Map;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map",
            "<+TK;+TV;>;)V"
        }
    .end annotation

    .prologue
    .line 236
    .local p0, "this":Ljavolution/util/stripped/FastMap;, "Ljavolution/util/stripped/FastMap<TK;TV;>;"
    .local p1, "map":Ljava/util/Map;, "Ljava/util/Map<+TK;+TV;>;"
    invoke-interface {p1}, Ljava/util/Map;->size()I

    move-result v0

    invoke-direct {p0, v0}, Ljavolution/util/stripped/FastMap;-><init>(I)V

    .line 237
    invoke-virtual {p0, p1}, Ljavolution/util/stripped/FastMap;->putAll(Ljava/util/Map;)V

    .line 238
    return-void
.end method

.method private constructor <init>([Ljavolution/util/stripped/FastMap$Entry;)V
    .locals 0
    .param p1, "entries"    # [Ljavolution/util/stripped/FastMap$Entry;

    .prologue
    .line 243
    .local p0, "this":Ljavolution/util/stripped/FastMap;, "Ljavolution/util/stripped/FastMap<TK;TV;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 244
    iput-object p1, p0, Ljavolution/util/stripped/FastMap;->_entries:[Ljavolution/util/stripped/FastMap$Entry;

    .line 245
    return-void
.end method

.method static synthetic access$1000(Ljavolution/util/stripped/FastMap;)Ljavolution/util/stripped/FastComparator;
    .locals 1
    .param p0, "x0"    # Ljavolution/util/stripped/FastMap;

    .prologue
    .line 111
    iget-object v0, p0, Ljavolution/util/stripped/FastMap;->_keyComparator:Ljavolution/util/stripped/FastComparator;

    return-object v0
.end method

.method static synthetic access$600(Ljavolution/util/stripped/FastMap;)Ljavolution/util/stripped/FastMap$Entry;
    .locals 1
    .param p0, "x0"    # Ljavolution/util/stripped/FastMap;

    .prologue
    .line 111
    iget-object v0, p0, Ljavolution/util/stripped/FastMap;->_head:Ljavolution/util/stripped/FastMap$Entry;

    return-object v0
.end method

.method static synthetic access$700(Ljavolution/util/stripped/FastMap;)Ljavolution/util/stripped/FastMap$Entry;
    .locals 1
    .param p0, "x0"    # Ljavolution/util/stripped/FastMap;

    .prologue
    .line 111
    iget-object v0, p0, Ljavolution/util/stripped/FastMap;->_tail:Ljavolution/util/stripped/FastMap$Entry;

    return-object v0
.end method

.method static synthetic access$800(Ljavolution/util/stripped/FastMap;)Ljavolution/util/stripped/FastComparator;
    .locals 1
    .param p0, "x0"    # Ljavolution/util/stripped/FastMap;

    .prologue
    .line 111
    iget-object v0, p0, Ljavolution/util/stripped/FastMap;->_valueComparator:Ljavolution/util/stripped/FastComparator;

    return-object v0
.end method

.method private declared-synchronized clearShared()V
    .locals 2

    .prologue
    .line 855
    .local p0, "this":Ljavolution/util/stripped/FastMap;, "Ljavolution/util/stripped/FastMap<TK;TV;>;"
    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Ljavolution/util/stripped/FastMap;->_head:Ljavolution/util/stripped/FastMap$Entry;

    iget-object v1, p0, Ljavolution/util/stripped/FastMap;->_tail:Ljavolution/util/stripped/FastMap$Entry;

    invoke-static {v0, v1}, Ljavolution/util/stripped/FastMap$Entry;->access$002(Ljavolution/util/stripped/FastMap$Entry;Ljavolution/util/stripped/FastMap$Entry;)Ljavolution/util/stripped/FastMap$Entry;

    .line 856
    iget-object v0, p0, Ljavolution/util/stripped/FastMap;->_tail:Ljavolution/util/stripped/FastMap$Entry;

    iget-object v1, p0, Ljavolution/util/stripped/FastMap;->_head:Ljavolution/util/stripped/FastMap$Entry;

    invoke-static {v0, v1}, Ljavolution/util/stripped/FastMap$Entry;->access$102(Ljavolution/util/stripped/FastMap$Entry;Ljavolution/util/stripped/FastMap$Entry;)Ljavolution/util/stripped/FastMap$Entry;

    .line 859
    const/16 v0, 0x10

    new-array v0, v0, [Ljavolution/util/stripped/FastMap$Entry;

    check-cast v0, [Ljavolution/util/stripped/FastMap$Entry;

    iput-object v0, p0, Ljavolution/util/stripped/FastMap;->_entries:[Ljavolution/util/stripped/FastMap$Entry;

    .line 860
    iget-boolean v0, p0, Ljavolution/util/stripped/FastMap;->_useSubMaps:Z

    if-eqz v0, :cond_0

    .line 861
    const/4 v0, 0x0

    iput-boolean v0, p0, Ljavolution/util/stripped/FastMap;->_useSubMaps:Z

    .line 862
    const/16 v0, 0x10

    invoke-direct {p0, v0}, Ljavolution/util/stripped/FastMap;->newSubMaps(I)[Ljavolution/util/stripped/FastMap;

    move-result-object v0

    iput-object v0, p0, Ljavolution/util/stripped/FastMap;->_subMaps:[Ljavolution/util/stripped/FastMap;

    .line 864
    :cond_0
    const/4 v0, 0x0

    iput v0, p0, Ljavolution/util/stripped/FastMap;->_entryCount:I

    .line 865
    const/4 v0, 0x0

    iput v0, p0, Ljavolution/util/stripped/FastMap;->_nullCount:I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 866
    monitor-exit p0

    return-void

    .line 855
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method private clearTables()V
    .locals 4

    .prologue
    .local p0, "this":Ljavolution/util/stripped/FastMap;, "Ljavolution/util/stripped/FastMap<TK;TV;>;"
    const/4 v3, 0x0

    .line 839
    iget-boolean v2, p0, Ljavolution/util/stripped/FastMap;->_useSubMaps:Z

    if-eqz v2, :cond_1

    .line 840
    const/4 v0, 0x0

    .local v0, "i":I
    move v1, v0

    .end local v0    # "i":I
    .local v1, "i":I
    :goto_0
    const/16 v2, 0x40

    if-ge v1, v2, :cond_0

    .line 841
    iget-object v2, p0, Ljavolution/util/stripped/FastMap;->_subMaps:[Ljavolution/util/stripped/FastMap;

    add-int/lit8 v0, v1, 0x1

    .end local v1    # "i":I
    .restart local v0    # "i":I
    aget-object v2, v2, v1

    invoke-direct {v2}, Ljavolution/util/stripped/FastMap;->clearTables()V

    move v1, v0

    .end local v0    # "i":I
    .restart local v1    # "i":I
    goto :goto_0

    .line 843
    :cond_0
    iput-boolean v3, p0, Ljavolution/util/stripped/FastMap;->_useSubMaps:Z

    .line 845
    .end local v1    # "i":I
    :cond_1
    iget-object v2, p0, Ljavolution/util/stripped/FastMap;->_entries:[Ljavolution/util/stripped/FastMap$Entry;

    invoke-static {v2}, Ljavolution/util/stripped/FastMap;->reset([Ljava/lang/Object;)V

    .line 846
    iput v3, p0, Ljavolution/util/stripped/FastMap;->_nullCount:I

    .line 847
    iput v3, p0, Ljavolution/util/stripped/FastMap;->_entryCount:I

    .line 848
    return-void
.end method

.method private copyEntries([Ljava/lang/Object;[Ljavolution/util/stripped/FastMap$Entry;I)V
    .locals 8
    .param p1, "from"    # [Ljava/lang/Object;
    .param p2, "to"    # [Ljavolution/util/stripped/FastMap$Entry;
    .param p3, "count"    # I

    .prologue
    .line 592
    .local p0, "this":Ljavolution/util/stripped/FastMap;, "Ljavolution/util/stripped/FastMap<TK;TV;>;"
    array-length v6, p2

    add-int/lit8 v4, v6, -0x1

    .line 593
    .local v4, "mask":I
    const/4 v1, 0x0

    .local v1, "i":I
    move v2, v1

    .end local v1    # "i":I
    .local v2, "i":I
    :goto_0
    if-ge v2, p3, :cond_2

    .line 594
    add-int/lit8 v1, v2, 0x1

    .end local v2    # "i":I
    .restart local v1    # "i":I
    aget-object v0, p1, v2

    check-cast v0, Ljavolution/util/stripped/FastMap$Entry;

    .line 595
    .local v0, "entry":Ljavolution/util/stripped/FastMap$Entry;
    if-eqz v0, :cond_3

    sget-object v6, Ljavolution/util/stripped/FastMap$Entry;->NULL:Ljavolution/util/stripped/FastMap$Entry;

    if-ne v0, v6, :cond_0

    move v2, v1

    .line 596
    .end local v1    # "i":I
    .restart local v2    # "i":I
    goto :goto_0

    .line 598
    .end local v2    # "i":I
    .restart local v1    # "i":I
    :cond_0
    invoke-static {v0}, Ljavolution/util/stripped/FastMap$Entry;->access$400(Ljavolution/util/stripped/FastMap$Entry;)I

    move-result v6

    iget v7, p0, Ljavolution/util/stripped/FastMap;->_keyShift:I

    shr-int v3, v6, v7

    .line 599
    .local v3, "j":I
    :goto_1
    and-int v6, v3, v4

    aget-object v5, p2, v6

    .line 600
    .local v5, "tmp":Ljavolution/util/stripped/FastMap$Entry;
    if-nez v5, :cond_1

    .line 601
    and-int v6, v3, v4

    aput-object v0, p2, v6

    move v2, v1

    .line 605
    .end local v1    # "i":I
    .restart local v2    # "i":I
    goto :goto_0

    .line 598
    .end local v2    # "i":I
    .restart local v1    # "i":I
    :cond_1
    add-int/lit8 v3, v3, 0x1

    goto :goto_1

    .line 606
    .end local v0    # "entry":Ljavolution/util/stripped/FastMap$Entry;
    .end local v1    # "i":I
    .end local v3    # "j":I
    .end local v5    # "tmp":Ljavolution/util/stripped/FastMap$Entry;
    .restart local v2    # "i":I
    :cond_2
    return-void

    .end local v2    # "i":I
    .restart local v0    # "entry":Ljavolution/util/stripped/FastMap$Entry;
    .restart local v1    # "i":I
    :cond_3
    move v2, v1

    .end local v1    # "i":I
    .restart local v2    # "i":I
    goto :goto_0
.end method

.method private createNewEntries()V
    .locals 4

    .prologue
    .line 491
    .local p0, "this":Ljavolution/util/stripped/FastMap;, "Ljavolution/util/stripped/FastMap<TK;TV;>;"
    iget-object v2, p0, Ljavolution/util/stripped/FastMap;->_tail:Ljavolution/util/stripped/FastMap$Entry;

    .line 492
    .local v2, "previous":Ljavolution/util/stripped/FastMap$Entry;
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    const/16 v3, 0x8

    if-ge v0, v3, :cond_0

    .line 493
    invoke-virtual {p0}, Ljavolution/util/stripped/FastMap;->newEntry()Ljavolution/util/stripped/FastMap$Entry;

    move-result-object v1

    .line 494
    .local v1, "newEntry":Ljavolution/util/stripped/FastMap$Entry;, "Ljavolution/util/stripped/FastMap$Entry<TK;TV;>;"
    invoke-static {v1, v2}, Ljavolution/util/stripped/FastMap$Entry;->access$102(Ljavolution/util/stripped/FastMap$Entry;Ljavolution/util/stripped/FastMap$Entry;)Ljavolution/util/stripped/FastMap$Entry;

    .line 495
    invoke-static {v2, v1}, Ljavolution/util/stripped/FastMap$Entry;->access$002(Ljavolution/util/stripped/FastMap$Entry;Ljavolution/util/stripped/FastMap$Entry;)Ljavolution/util/stripped/FastMap$Entry;

    .line 496
    move-object v2, v1

    .line 492
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 498
    .end local v1    # "newEntry":Ljavolution/util/stripped/FastMap$Entry;, "Ljavolution/util/stripped/FastMap$Entry<TK;TV;>;"
    :cond_0
    return-void
.end method

.method private getCapacity()I
    .locals 3

    .prologue
    .line 952
    .local p0, "this":Ljavolution/util/stripped/FastMap;, "Ljavolution/util/stripped/FastMap<TK;TV;>;"
    const/4 v0, 0x0

    .line 953
    .local v0, "capacity":I
    iget-object v1, p0, Ljavolution/util/stripped/FastMap;->_head:Ljavolution/util/stripped/FastMap$Entry;

    .local v1, "e":Ljavolution/util/stripped/FastMap$Entry;
    :goto_0
    invoke-static {v1}, Ljavolution/util/stripped/FastMap$Entry;->access$000(Ljavolution/util/stripped/FastMap$Entry;)Ljavolution/util/stripped/FastMap$Entry;

    move-result-object v1

    if-eqz v1, :cond_0

    .line 954
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 956
    :cond_0
    add-int/lit8 v2, v0, -0x1

    return v2
.end method

.method private final getEntry(Ljava/lang/Object;I)Ljavolution/util/stripped/FastMap$Entry;
    .locals 7
    .param p1, "key"    # Ljava/lang/Object;
    .param p2, "keyHash"    # I

    .prologue
    .line 372
    .local p0, "this":Ljavolution/util/stripped/FastMap;, "Ljavolution/util/stripped/FastMap<TK;TV;>;"
    invoke-direct {p0, p2}, Ljavolution/util/stripped/FastMap;->getSubMap(I)Ljavolution/util/stripped/FastMap;

    move-result-object v3

    .line 373
    .local v3, "map":Ljavolution/util/stripped/FastMap;
    iget-object v0, v3, Ljavolution/util/stripped/FastMap;->_entries:[Ljavolution/util/stripped/FastMap$Entry;

    .line 374
    .local v0, "entries":[Ljavolution/util/stripped/FastMap$Entry;
    array-length v5, v0

    add-int/lit8 v4, v5, -0x1

    .line 375
    .local v4, "mask":I
    iget v5, v3, Ljavolution/util/stripped/FastMap;->_keyShift:I

    shr-int v2, p2, v5

    .line 376
    .local v2, "i":I
    :goto_0
    and-int v5, v2, v4

    aget-object v1, v0, v5

    .line 377
    .local v1, "entry":Ljavolution/util/stripped/FastMap$Entry;
    if-nez v1, :cond_1

    .line 378
    const/4 v1, 0x0

    .line 383
    .end local v1    # "entry":Ljavolution/util/stripped/FastMap$Entry;
    :cond_0
    :goto_1
    return-object v1

    .line 380
    .restart local v1    # "entry":Ljavolution/util/stripped/FastMap$Entry;
    :cond_1
    invoke-static {v1}, Ljavolution/util/stripped/FastMap$Entry;->access$300(Ljavolution/util/stripped/FastMap$Entry;)Ljava/lang/Object;

    move-result-object v5

    if-eq p1, v5, :cond_0

    invoke-static {v1}, Ljavolution/util/stripped/FastMap$Entry;->access$400(Ljavolution/util/stripped/FastMap$Entry;)I

    move-result v5

    if-ne p2, v5, :cond_2

    iget-boolean v5, p0, Ljavolution/util/stripped/FastMap;->_isDirectKeyComparator:Z

    if-eqz v5, :cond_3

    invoke-static {v1}, Ljavolution/util/stripped/FastMap$Entry;->access$300(Ljavolution/util/stripped/FastMap$Entry;)Ljava/lang/Object;

    move-result-object v5

    invoke-virtual {p1, v5}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-nez v5, :cond_0

    .line 375
    :cond_2
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 380
    :cond_3
    iget-object v5, p0, Ljavolution/util/stripped/FastMap;->_keyComparator:Ljavolution/util/stripped/FastComparator;

    invoke-static {v1}, Ljavolution/util/stripped/FastMap$Entry;->access$300(Ljavolution/util/stripped/FastMap$Entry;)Ljava/lang/Object;

    move-result-object v6

    invoke-virtual {v5, p1, v6}, Ljavolution/util/stripped/FastComparator;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_2

    goto :goto_1
.end method

.method private getMaximumDistance()I
    .locals 9

    .prologue
    .line 960
    .local p0, "this":Ljavolution/util/stripped/FastMap;, "Ljavolution/util/stripped/FastMap<TK;TV;>;"
    const/4 v3, 0x0

    .line 961
    .local v3, "max":I
    iget-boolean v7, p0, Ljavolution/util/stripped/FastMap;->_useSubMaps:Z

    if-eqz v7, :cond_1

    .line 962
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_0
    const/16 v7, 0x40

    if-ge v2, v7, :cond_0

    .line 963
    iget-object v7, p0, Ljavolution/util/stripped/FastMap;->_subMaps:[Ljavolution/util/stripped/FastMap;

    aget-object v7, v7, v2

    invoke-direct {v7}, Ljavolution/util/stripped/FastMap;->getMaximumDistance()I

    move-result v6

    .line 964
    .local v6, "subMapMax":I
    invoke-static {v3, v6}, Ljava/lang/Math;->max(II)I

    move-result v3

    .line 962
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .end local v6    # "subMapMax":I
    :cond_0
    move v4, v3

    .line 981
    .end local v3    # "max":I
    .local v4, "max":I
    :goto_1
    return v4

    .line 968
    .end local v2    # "i":I
    .end local v4    # "max":I
    .restart local v3    # "max":I
    :cond_1
    const/4 v2, 0x0

    .restart local v2    # "i":I
    :goto_2
    iget-object v7, p0, Ljavolution/util/stripped/FastMap;->_entries:[Ljavolution/util/stripped/FastMap$Entry;

    array-length v7, v7

    if-ge v2, v7, :cond_4

    .line 969
    iget-object v7, p0, Ljavolution/util/stripped/FastMap;->_entries:[Ljavolution/util/stripped/FastMap$Entry;

    aget-object v1, v7, v2

    .line 970
    .local v1, "entry":Ljavolution/util/stripped/FastMap$Entry;
    if-eqz v1, :cond_3

    sget-object v7, Ljavolution/util/stripped/FastMap$Entry;->NULL:Ljavolution/util/stripped/FastMap$Entry;

    if-eq v1, v7, :cond_3

    .line 971
    invoke-static {v1}, Ljavolution/util/stripped/FastMap$Entry;->access$400(Ljavolution/util/stripped/FastMap$Entry;)I

    move-result v7

    iget v8, p0, Ljavolution/util/stripped/FastMap;->_keyShift:I

    shr-int/2addr v7, v8

    iget-object v8, p0, Ljavolution/util/stripped/FastMap;->_entries:[Ljavolution/util/stripped/FastMap$Entry;

    array-length v8, v8

    add-int/lit8 v8, v8, -0x1

    and-int v5, v7, v8

    .line 972
    .local v5, "slot":I
    sub-int v0, v2, v5

    .line 973
    .local v0, "distanceToSlot":I
    if-gez v0, :cond_2

    .line 974
    iget-object v7, p0, Ljavolution/util/stripped/FastMap;->_entries:[Ljavolution/util/stripped/FastMap$Entry;

    array-length v7, v7

    add-int/2addr v0, v7

    .line 976
    :cond_2
    if-le v0, v3, :cond_3

    .line 977
    move v3, v0

    .line 968
    .end local v0    # "distanceToSlot":I
    .end local v5    # "slot":I
    :cond_3
    add-int/lit8 v2, v2, 0x1

    goto :goto_2

    .end local v1    # "entry":Ljavolution/util/stripped/FastMap$Entry;
    :cond_4
    move v4, v3

    .line 981
    .end local v3    # "max":I
    .restart local v4    # "max":I
    goto :goto_1
.end method

.method private final getSubMap(I)Ljavolution/util/stripped/FastMap;
    .locals 2
    .param p1, "keyHash"    # I

    .prologue
    .line 389
    .local p0, "this":Ljavolution/util/stripped/FastMap;, "Ljavolution/util/stripped/FastMap<TK;TV;>;"
    iget-boolean v0, p0, Ljavolution/util/stripped/FastMap;->_useSubMaps:Z

    if-eqz v0, :cond_0

    iget-object v0, p0, Ljavolution/util/stripped/FastMap;->_subMaps:[Ljavolution/util/stripped/FastMap;

    and-int/lit8 v1, p1, 0x3f

    aget-object v0, v0, v1

    shr-int/lit8 v1, p1, 0x6

    invoke-direct {v0, v1}, Ljavolution/util/stripped/FastMap;->getSubMap(I)Ljavolution/util/stripped/FastMap;

    move-result-object p0

    .end local p0    # "this":Ljavolution/util/stripped/FastMap;, "Ljavolution/util/stripped/FastMap<TK;TV;>;"
    :cond_0
    return-object p0
.end method

.method private getSubMapDepth()I
    .locals 4

    .prologue
    .line 1007
    .local p0, "this":Ljavolution/util/stripped/FastMap;, "Ljavolution/util/stripped/FastMap<TK;TV;>;"
    iget-boolean v3, p0, Ljavolution/util/stripped/FastMap;->_useSubMaps:Z

    if-eqz v3, :cond_1

    .line 1008
    const/4 v0, 0x0

    .line 1009
    .local v0, "depth":I
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    const/16 v3, 0x40

    if-ge v1, v3, :cond_0

    .line 1010
    iget-object v3, p0, Ljavolution/util/stripped/FastMap;->_subMaps:[Ljavolution/util/stripped/FastMap;

    aget-object v3, v3, v1

    invoke-direct {v3}, Ljavolution/util/stripped/FastMap;->getSubMapDepth()I

    move-result v2

    .line 1011
    .local v2, "subMapDepth":I
    invoke-static {v0, v2}, Ljava/lang/Math;->max(II)I

    move-result v0

    .line 1009
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 1013
    .end local v2    # "subMapDepth":I
    :cond_0
    add-int/lit8 v3, v0, 0x1

    .line 1015
    .end local v0    # "depth":I
    .end local v1    # "i":I
    :goto_1
    return v3

    :cond_1
    const/4 v3, 0x0

    goto :goto_1
.end method

.method private getSumDistance()J
    .locals 10

    .prologue
    .line 985
    .local p0, "this":Ljavolution/util/stripped/FastMap;, "Ljavolution/util/stripped/FastMap<TK;TV;>;"
    const-wide/16 v4, 0x0

    .line 986
    .local v4, "sum":J
    iget-boolean v8, p0, Ljavolution/util/stripped/FastMap;->_useSubMaps:Z

    if-eqz v8, :cond_1

    .line 987
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_0
    const/16 v8, 0x40

    if-ge v2, v8, :cond_0

    .line 988
    iget-object v8, p0, Ljavolution/util/stripped/FastMap;->_subMaps:[Ljavolution/util/stripped/FastMap;

    aget-object v8, v8, v2

    invoke-direct {v8}, Ljavolution/util/stripped/FastMap;->getSumDistance()J

    move-result-wide v8

    add-long/2addr v4, v8

    .line 987
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    :cond_0
    move-wide v6, v4

    .line 1003
    .end local v4    # "sum":J
    .local v6, "sum":J
    :goto_1
    return-wide v6

    .line 992
    .end local v2    # "i":I
    .end local v6    # "sum":J
    .restart local v4    # "sum":J
    :cond_1
    const/4 v2, 0x0

    .restart local v2    # "i":I
    :goto_2
    iget-object v8, p0, Ljavolution/util/stripped/FastMap;->_entries:[Ljavolution/util/stripped/FastMap$Entry;

    array-length v8, v8

    if-ge v2, v8, :cond_4

    .line 993
    iget-object v8, p0, Ljavolution/util/stripped/FastMap;->_entries:[Ljavolution/util/stripped/FastMap$Entry;

    aget-object v1, v8, v2

    .line 994
    .local v1, "entry":Ljavolution/util/stripped/FastMap$Entry;
    if-eqz v1, :cond_3

    sget-object v8, Ljavolution/util/stripped/FastMap$Entry;->NULL:Ljavolution/util/stripped/FastMap$Entry;

    if-eq v1, v8, :cond_3

    .line 995
    invoke-static {v1}, Ljavolution/util/stripped/FastMap$Entry;->access$400(Ljavolution/util/stripped/FastMap$Entry;)I

    move-result v8

    iget v9, p0, Ljavolution/util/stripped/FastMap;->_keyShift:I

    shr-int/2addr v8, v9

    iget-object v9, p0, Ljavolution/util/stripped/FastMap;->_entries:[Ljavolution/util/stripped/FastMap$Entry;

    array-length v9, v9

    add-int/lit8 v9, v9, -0x1

    and-int v3, v8, v9

    .line 996
    .local v3, "slot":I
    sub-int v0, v2, v3

    .line 997
    .local v0, "distanceToSlot":I
    if-gez v0, :cond_2

    .line 998
    iget-object v8, p0, Ljavolution/util/stripped/FastMap;->_entries:[Ljavolution/util/stripped/FastMap$Entry;

    array-length v8, v8

    add-int/2addr v0, v8

    .line 1000
    :cond_2
    int-to-long v8, v0

    add-long/2addr v4, v8

    .line 992
    .end local v0    # "distanceToSlot":I
    .end local v3    # "slot":I
    :cond_3
    add-int/lit8 v2, v2, 0x1

    goto :goto_2

    .end local v1    # "entry":Ljavolution/util/stripped/FastMap$Entry;
    :cond_4
    move-wide v6, v4

    .line 1003
    .end local v4    # "sum":J
    .restart local v6    # "sum":J
    goto :goto_1
.end method

.method private getTableLength()I
    .locals 3

    .prologue
    .line 940
    .local p0, "this":Ljavolution/util/stripped/FastMap;, "Ljavolution/util/stripped/FastMap<TK;TV;>;"
    iget-boolean v2, p0, Ljavolution/util/stripped/FastMap;->_useSubMaps:Z

    if-eqz v2, :cond_0

    .line 941
    const/4 v1, 0x0

    .line 942
    .local v1, "sum":I
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    const/16 v2, 0x40

    if-ge v0, v2, :cond_1

    .line 943
    iget-object v2, p0, Ljavolution/util/stripped/FastMap;->_subMaps:[Ljavolution/util/stripped/FastMap;

    aget-object v2, v2, v0

    invoke-direct {v2}, Ljavolution/util/stripped/FastMap;->getTableLength()I

    move-result v2

    add-int/2addr v1, v2

    .line 942
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 947
    .end local v0    # "i":I
    .end local v1    # "sum":I
    :cond_0
    iget-object v2, p0, Ljavolution/util/stripped/FastMap;->_entries:[Ljavolution/util/stripped/FastMap$Entry;

    array-length v1, v2

    :cond_1
    return v1
.end method

.method private mapEntry(Ljavolution/util/stripped/FastMap$Entry;)V
    .locals 5
    .param p1, "entry"    # Ljavolution/util/stripped/FastMap$Entry;

    .prologue
    .line 578
    .local p0, "this":Ljavolution/util/stripped/FastMap;, "Ljavolution/util/stripped/FastMap<TK;TV;>;"
    iget-object v3, p0, Ljavolution/util/stripped/FastMap;->_entries:[Ljavolution/util/stripped/FastMap$Entry;

    array-length v3, v3

    add-int/lit8 v2, v3, -0x1

    .line 579
    .local v2, "mask":I
    invoke-static {p1}, Ljavolution/util/stripped/FastMap$Entry;->access$400(Ljavolution/util/stripped/FastMap$Entry;)I

    move-result v3

    iget v4, p0, Ljavolution/util/stripped/FastMap;->_keyShift:I

    shr-int v1, v3, v4

    .line 580
    .local v1, "i":I
    :goto_0
    iget-object v3, p0, Ljavolution/util/stripped/FastMap;->_entries:[Ljavolution/util/stripped/FastMap$Entry;

    and-int v4, v1, v2

    aget-object v0, v3, v4

    .line 581
    .local v0, "e":Ljavolution/util/stripped/FastMap$Entry;
    if-nez v0, :cond_0

    .line 582
    iget-object v3, p0, Ljavolution/util/stripped/FastMap;->_entries:[Ljavolution/util/stripped/FastMap$Entry;

    and-int v4, v1, v2

    aput-object p1, v3, v4

    .line 586
    iget v3, p0, Ljavolution/util/stripped/FastMap;->_entryCount:I

    add-int/lit8 v3, v3, 0x1

    iput v3, p0, Ljavolution/util/stripped/FastMap;->_entryCount:I

    .line 587
    return-void

    .line 579
    :cond_0
    add-int/lit8 v1, v1, 0x1

    goto :goto_0
.end method

.method public static newInstance()Ljavolution/util/stripped/FastMap;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<K:",
            "Ljava/lang/Object;",
            "V:",
            "Ljava/lang/Object;",
            ">()",
            "Ljavolution/util/stripped/FastMap",
            "<TK;TV;>;"
        }
    .end annotation

    .prologue
    .line 253
    new-instance v0, Ljavolution/util/stripped/FastMap;

    invoke-direct {v0}, Ljavolution/util/stripped/FastMap;-><init>()V

    return-object v0
.end method

.method private newSubMaps(I)[Ljavolution/util/stripped/FastMap;
    .locals 5
    .param p1, "capacity"    # I

    .prologue
    .local p0, "this":Ljavolution/util/stripped/FastMap;, "Ljavolution/util/stripped/FastMap<TK;TV;>;"
    const/16 v4, 0x40

    .line 566
    new-array v2, v4, [Ljavolution/util/stripped/FastMap;

    .line 567
    .local v2, "subMaps":[Ljavolution/util/stripped/FastMap;
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    if-ge v0, v4, :cond_0

    .line 568
    new-instance v1, Ljavolution/util/stripped/FastMap;

    new-array v3, p1, [Ljavolution/util/stripped/FastMap$Entry;

    invoke-direct {v1, v3}, Ljavolution/util/stripped/FastMap;-><init>([Ljavolution/util/stripped/FastMap$Entry;)V

    .line 569
    .local v1, "subMap":Ljavolution/util/stripped/FastMap;
    iget v3, p0, Ljavolution/util/stripped/FastMap;->_keyShift:I

    add-int/lit8 v3, v3, 0x6

    iput v3, v1, Ljavolution/util/stripped/FastMap;->_keyShift:I

    .line 570
    aput-object v1, v2, v0

    .line 567
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 572
    .end local v1    # "subMap":Ljavolution/util/stripped/FastMap;
    :cond_0
    return-object v2
.end method

.method private final put(Ljava/lang/Object;Ljava/lang/Object;IZZZ)Ljava/lang/Object;
    .locals 15
    .param p1, "key"    # Ljava/lang/Object;
    .param p2, "value"    # Ljava/lang/Object;
    .param p3, "keyHash"    # I
    .param p4, "concurrent"    # Z
    .param p5, "noReplace"    # Z
    .param p6, "returnEntry"    # Z

    .prologue
    .line 414
    .local p0, "this":Ljavolution/util/stripped/FastMap;, "Ljavolution/util/stripped/FastMap<TK;TV;>;"
    move/from16 v0, p3

    invoke-direct {p0, v0}, Ljavolution/util/stripped/FastMap;->getSubMap(I)Ljavolution/util/stripped/FastMap;

    move-result-object v11

    .line 415
    .local v11, "map":Ljavolution/util/stripped/FastMap;
    iget-object v8, v11, Ljavolution/util/stripped/FastMap;->_entries:[Ljavolution/util/stripped/FastMap$Entry;

    .line 416
    .local v8, "entries":[Ljavolution/util/stripped/FastMap$Entry;
    array-length v1, v8

    add-int/lit8 v12, v1, -0x1

    .line 417
    .local v12, "mask":I
    const/4 v14, -0x1

    .line 418
    .local v14, "slot":I
    iget v1, v11, Ljavolution/util/stripped/FastMap;->_keyShift:I

    shr-int v10, p3, v1

    .line 419
    .local v10, "i":I
    :goto_0
    and-int v1, v10, v12

    aget-object v9, v8, v1

    .line 420
    .local v9, "entry":Ljavolution/util/stripped/FastMap$Entry;
    if-nez v9, :cond_2

    .line 421
    if-gez v14, :cond_0

    and-int v14, v10, v12

    .line 438
    :cond_0
    if-eqz p4, :cond_8

    .line 439
    monitor-enter p0

    .line 440
    const/4 v5, 0x0

    move-object v1, p0

    move-object/from16 v2, p1

    move-object/from16 v3, p2

    move/from16 v4, p3

    move/from16 v6, p5

    move/from16 v7, p6

    :try_start_0
    invoke-direct/range {v1 .. v7}, Ljavolution/util/stripped/FastMap;->put(Ljava/lang/Object;Ljava/lang/Object;IZZZ)Ljava/lang/Object;

    move-result-object v9

    .end local v9    # "entry":Ljavolution/util/stripped/FastMap$Entry;
    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 487
    :cond_1
    :goto_1
    return-object v9

    .line 423
    .restart local v9    # "entry":Ljavolution/util/stripped/FastMap$Entry;
    :cond_2
    sget-object v1, Ljavolution/util/stripped/FastMap$Entry;->NULL:Ljavolution/util/stripped/FastMap$Entry;

    if-ne v9, v1, :cond_4

    .line 424
    if-gez v14, :cond_3

    and-int v14, v10, v12

    .line 418
    :cond_3
    add-int/lit8 v10, v10, 0x1

    goto :goto_0

    .line 425
    :cond_4
    invoke-static {v9}, Ljavolution/util/stripped/FastMap$Entry;->access$300(Ljavolution/util/stripped/FastMap$Entry;)Ljava/lang/Object;

    move-result-object v1

    move-object/from16 v0, p1

    if-eq v0, v1, :cond_5

    invoke-static {v9}, Ljavolution/util/stripped/FastMap$Entry;->access$400(Ljavolution/util/stripped/FastMap$Entry;)I

    move-result v1

    move/from16 v0, p3

    if-ne v0, v1, :cond_3

    iget-boolean v1, p0, Ljavolution/util/stripped/FastMap;->_isDirectKeyComparator:Z

    if-eqz v1, :cond_6

    invoke-static {v9}, Ljavolution/util/stripped/FastMap$Entry;->access$300(Ljavolution/util/stripped/FastMap$Entry;)Ljava/lang/Object;

    move-result-object v1

    move-object/from16 v0, p1

    invoke-virtual {v0, v1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_3

    .line 428
    :cond_5
    :goto_2
    if-eqz p5, :cond_7

    .line 429
    if-nez p6, :cond_1

    invoke-static {v9}, Ljavolution/util/stripped/FastMap$Entry;->access$200(Ljavolution/util/stripped/FastMap$Entry;)Ljava/lang/Object;

    move-result-object v9

    goto :goto_1

    .line 425
    :cond_6
    iget-object v1, p0, Ljavolution/util/stripped/FastMap;->_keyComparator:Ljavolution/util/stripped/FastComparator;

    invoke-static {v9}, Ljavolution/util/stripped/FastMap$Entry;->access$300(Ljavolution/util/stripped/FastMap$Entry;)Ljava/lang/Object;

    move-result-object v2

    move-object/from16 v0, p1

    invoke-virtual {v1, v0, v2}, Ljavolution/util/stripped/FastComparator;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_3

    goto :goto_2

    .line 431
    :cond_7
    invoke-static {v9}, Ljavolution/util/stripped/FastMap$Entry;->access$200(Ljavolution/util/stripped/FastMap$Entry;)Ljava/lang/Object;

    move-result-object v13

    .line 432
    .local v13, "prevValue":Ljava/lang/Object;
    move-object/from16 v0, p2

    invoke-static {v9, v0}, Ljavolution/util/stripped/FastMap$Entry;->access$202(Ljavolution/util/stripped/FastMap$Entry;Ljava/lang/Object;)Ljava/lang/Object;

    .line 433
    if-nez p6, :cond_1

    move-object v9, v13

    goto :goto_1

    .line 441
    .end local v9    # "entry":Ljavolution/util/stripped/FastMap$Entry;
    .end local v13    # "prevValue":Ljava/lang/Object;
    :catchall_0
    move-exception v1

    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v1

    .line 446
    .restart local v9    # "entry":Ljavolution/util/stripped/FastMap$Entry;
    :cond_8
    iget-boolean v1, p0, Ljavolution/util/stripped/FastMap;->_isShared:Z

    if-nez v1, :cond_b

    .line 447
    iget-object v9, p0, Ljavolution/util/stripped/FastMap;->_tail:Ljavolution/util/stripped/FastMap$Entry;

    .line 448
    move-object/from16 v0, p1

    invoke-static {v9, v0}, Ljavolution/util/stripped/FastMap$Entry;->access$302(Ljavolution/util/stripped/FastMap$Entry;Ljava/lang/Object;)Ljava/lang/Object;

    .line 449
    move-object/from16 v0, p2

    invoke-static {v9, v0}, Ljavolution/util/stripped/FastMap$Entry;->access$202(Ljavolution/util/stripped/FastMap$Entry;Ljava/lang/Object;)Ljava/lang/Object;

    .line 450
    move/from16 v0, p3

    invoke-static {v9, v0}, Ljavolution/util/stripped/FastMap$Entry;->access$402(Ljavolution/util/stripped/FastMap$Entry;I)I

    .line 451
    invoke-static {v9}, Ljavolution/util/stripped/FastMap$Entry;->access$000(Ljavolution/util/stripped/FastMap$Entry;)Ljavolution/util/stripped/FastMap$Entry;

    move-result-object v1

    if-nez v1, :cond_9

    .line 452
    invoke-direct {p0}, Ljavolution/util/stripped/FastMap;->createNewEntries()V

    .line 454
    :cond_9
    aput-object v9, v8, v14

    .line 455
    iget v1, v11, Ljavolution/util/stripped/FastMap;->_entryCount:I

    sget v2, Ljavolution/util/stripped/FastMap;->ONE_VOLATILE:I

    add-int/2addr v1, v2

    iput v1, v11, Ljavolution/util/stripped/FastMap;->_entryCount:I

    .line 456
    iget-object v1, p0, Ljavolution/util/stripped/FastMap;->_tail:Ljavolution/util/stripped/FastMap$Entry;

    invoke-static {v1}, Ljavolution/util/stripped/FastMap$Entry;->access$000(Ljavolution/util/stripped/FastMap$Entry;)Ljavolution/util/stripped/FastMap$Entry;

    move-result-object v1

    iput-object v1, p0, Ljavolution/util/stripped/FastMap;->_tail:Ljavolution/util/stripped/FastMap$Entry;

    .line 484
    :goto_3
    iget v1, v11, Ljavolution/util/stripped/FastMap;->_entryCount:I

    iget v2, v11, Ljavolution/util/stripped/FastMap;->_nullCount:I

    add-int/2addr v1, v2

    array-length v2, v8

    shr-int/lit8 v2, v2, 0x1

    if-le v1, v2, :cond_a

    .line 485
    iget-boolean v1, p0, Ljavolution/util/stripped/FastMap;->_isShared:Z

    invoke-direct {v11, v1}, Ljavolution/util/stripped/FastMap;->resizeTable(Z)V

    .line 487
    :cond_a
    if-nez p6, :cond_1

    const/4 v9, 0x0

    goto/16 :goto_1

    .line 460
    :cond_b
    iget-object v1, p0, Ljavolution/util/stripped/FastMap;->_tail:Ljavolution/util/stripped/FastMap$Entry;

    invoke-static {v1}, Ljavolution/util/stripped/FastMap$Entry;->access$000(Ljavolution/util/stripped/FastMap$Entry;)Ljavolution/util/stripped/FastMap$Entry;

    move-result-object v1

    if-nez v1, :cond_c

    .line 461
    invoke-direct {p0}, Ljavolution/util/stripped/FastMap;->createNewEntries()V

    .line 464
    :cond_c
    iget-object v1, p0, Ljavolution/util/stripped/FastMap;->_tail:Ljavolution/util/stripped/FastMap$Entry;

    invoke-static {v1}, Ljavolution/util/stripped/FastMap$Entry;->access$000(Ljavolution/util/stripped/FastMap$Entry;)Ljavolution/util/stripped/FastMap$Entry;

    move-result-object v9

    .line 467
    iget-object v1, p0, Ljavolution/util/stripped/FastMap;->_tail:Ljavolution/util/stripped/FastMap$Entry;

    invoke-static {v9}, Ljavolution/util/stripped/FastMap$Entry;->access$000(Ljavolution/util/stripped/FastMap$Entry;)Ljavolution/util/stripped/FastMap$Entry;

    move-result-object v2

    invoke-static {v1, v2}, Ljavolution/util/stripped/FastMap$Entry;->access$002(Ljavolution/util/stripped/FastMap$Entry;Ljavolution/util/stripped/FastMap$Entry;)Ljavolution/util/stripped/FastMap$Entry;

    .line 470
    move-object/from16 v0, p1

    invoke-static {v9, v0}, Ljavolution/util/stripped/FastMap$Entry;->access$302(Ljavolution/util/stripped/FastMap$Entry;Ljava/lang/Object;)Ljava/lang/Object;

    .line 471
    move-object/from16 v0, p2

    invoke-static {v9, v0}, Ljavolution/util/stripped/FastMap$Entry;->access$202(Ljavolution/util/stripped/FastMap$Entry;Ljava/lang/Object;)Ljava/lang/Object;

    .line 472
    move/from16 v0, p3

    invoke-static {v9, v0}, Ljavolution/util/stripped/FastMap$Entry;->access$402(Ljavolution/util/stripped/FastMap$Entry;I)I

    .line 473
    iget-object v1, p0, Ljavolution/util/stripped/FastMap;->_tail:Ljavolution/util/stripped/FastMap$Entry;

    invoke-static {v9, v1}, Ljavolution/util/stripped/FastMap$Entry;->access$002(Ljavolution/util/stripped/FastMap$Entry;Ljavolution/util/stripped/FastMap$Entry;)Ljavolution/util/stripped/FastMap$Entry;

    .line 474
    iget-object v1, p0, Ljavolution/util/stripped/FastMap;->_tail:Ljavolution/util/stripped/FastMap$Entry;

    invoke-static {v1}, Ljavolution/util/stripped/FastMap$Entry;->access$100(Ljavolution/util/stripped/FastMap$Entry;)Ljavolution/util/stripped/FastMap$Entry;

    move-result-object v1

    invoke-static {v9, v1}, Ljavolution/util/stripped/FastMap$Entry;->access$102(Ljavolution/util/stripped/FastMap$Entry;Ljavolution/util/stripped/FastMap$Entry;)Ljavolution/util/stripped/FastMap$Entry;

    .line 477
    aput-object v9, v8, v14

    .line 478
    iget v1, v11, Ljavolution/util/stripped/FastMap;->_entryCount:I

    sget v2, Ljavolution/util/stripped/FastMap;->ONE_VOLATILE:I

    add-int/2addr v1, v2

    iput v1, v11, Ljavolution/util/stripped/FastMap;->_entryCount:I

    .line 480
    invoke-static {v9}, Ljavolution/util/stripped/FastMap$Entry;->access$000(Ljavolution/util/stripped/FastMap$Entry;)Ljavolution/util/stripped/FastMap$Entry;

    move-result-object v1

    invoke-static {v1, v9}, Ljavolution/util/stripped/FastMap$Entry;->access$102(Ljavolution/util/stripped/FastMap$Entry;Ljavolution/util/stripped/FastMap$Entry;)Ljavolution/util/stripped/FastMap$Entry;

    .line 481
    invoke-static {v9}, Ljavolution/util/stripped/FastMap$Entry;->access$100(Ljavolution/util/stripped/FastMap$Entry;)Ljavolution/util/stripped/FastMap$Entry;

    move-result-object v1

    invoke-static {v1, v9}, Ljavolution/util/stripped/FastMap$Entry;->access$002(Ljavolution/util/stripped/FastMap$Entry;Ljavolution/util/stripped/FastMap$Entry;)Ljavolution/util/stripped/FastMap$Entry;

    goto :goto_3
.end method

.method private readObject(Ljava/io/ObjectInputStream;)V
    .locals 5
    .param p1, "stream"    # Ljava/io/ObjectInputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Ljava/lang/ClassNotFoundException;
        }
    .end annotation

    .prologue
    .line 1398
    .local p0, "this":Ljavolution/util/stripped/FastMap;, "Ljavolution/util/stripped/FastMap<TK;TV;>;"
    invoke-virtual {p1}, Ljava/io/ObjectInputStream;->readObject()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljavolution/util/stripped/FastComparator;

    invoke-virtual {p0, v4}, Ljavolution/util/stripped/FastMap;->setKeyComparator(Ljavolution/util/stripped/FastComparator;)Ljavolution/util/stripped/FastMap;

    .line 1399
    invoke-virtual {p1}, Ljava/io/ObjectInputStream;->readObject()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljavolution/util/stripped/FastComparator;

    invoke-virtual {p0, v4}, Ljavolution/util/stripped/FastMap;->setValueComparator(Ljavolution/util/stripped/FastComparator;)Ljavolution/util/stripped/FastMap;

    .line 1400
    invoke-virtual {p1}, Ljava/io/ObjectInputStream;->readBoolean()Z

    move-result v4

    iput-boolean v4, p0, Ljavolution/util/stripped/FastMap;->_isShared:Z

    .line 1401
    invoke-virtual {p1}, Ljava/io/ObjectInputStream;->readInt()I

    move-result v2

    .line 1402
    .local v2, "size":I
    invoke-direct {p0, v2}, Ljavolution/util/stripped/FastMap;->setup(I)V

    .line 1403
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    if-ge v0, v2, :cond_0

    .line 1404
    invoke-virtual {p1}, Ljava/io/ObjectInputStream;->readObject()Ljava/lang/Object;

    move-result-object v1

    .line 1405
    .local v1, "key":Ljava/lang/Object;, "TK;"
    invoke-virtual {p1}, Ljava/io/ObjectInputStream;->readObject()Ljava/lang/Object;

    move-result-object v3

    .line 1406
    .local v3, "value":Ljava/lang/Object;, "TV;"
    invoke-virtual {p0, v1, v3}, Ljavolution/util/stripped/FastMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1403
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 1408
    .end local v1    # "key":Ljava/lang/Object;, "TK;"
    .end local v3    # "value":Ljava/lang/Object;, "TV;"
    :cond_0
    return-void
.end method

.method private final remove(Ljava/lang/Object;IZ)Ljava/lang/Object;
    .locals 10
    .param p1, "key"    # Ljava/lang/Object;
    .param p2, "keyHash"    # I
    .param p3, "concurrent"    # Z

    .prologue
    .local p0, "this":Ljavolution/util/stripped/FastMap;, "Ljavolution/util/stripped/FastMap<TK;TV;>;"
    const/4 v7, 0x0

    .line 684
    invoke-direct {p0, p2}, Ljavolution/util/stripped/FastMap;->getSubMap(I)Ljavolution/util/stripped/FastMap;

    move-result-object v3

    .line 685
    .local v3, "map":Ljavolution/util/stripped/FastMap;
    iget-object v0, v3, Ljavolution/util/stripped/FastMap;->_entries:[Ljavolution/util/stripped/FastMap$Entry;

    .line 686
    .local v0, "entries":[Ljavolution/util/stripped/FastMap$Entry;
    array-length v8, v0

    add-int/lit8 v4, v8, -0x1

    .line 687
    .local v4, "mask":I
    iget v8, v3, Ljavolution/util/stripped/FastMap;->_keyShift:I

    shr-int v2, p2, v8

    .line 688
    .local v2, "i":I
    :goto_0
    and-int v8, v2, v4

    aget-object v1, v0, v8

    .line 689
    .local v1, "entry":Ljavolution/util/stripped/FastMap$Entry;
    if-nez v1, :cond_1

    move-object v6, v7

    .line 726
    :cond_0
    :goto_1
    return-object v6

    .line 692
    :cond_1
    invoke-static {v1}, Ljavolution/util/stripped/FastMap$Entry;->access$300(Ljavolution/util/stripped/FastMap$Entry;)Ljava/lang/Object;

    move-result-object v8

    if-eq p1, v8, :cond_2

    invoke-static {v1}, Ljavolution/util/stripped/FastMap$Entry;->access$400(Ljavolution/util/stripped/FastMap$Entry;)I

    move-result v8

    if-ne p2, v8, :cond_4

    iget-boolean v8, p0, Ljavolution/util/stripped/FastMap;->_isDirectKeyComparator:Z

    if-eqz v8, :cond_3

    invoke-static {v1}, Ljavolution/util/stripped/FastMap$Entry;->access$300(Ljavolution/util/stripped/FastMap$Entry;)Ljava/lang/Object;

    move-result-object v8

    invoke-virtual {p1, v8}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_4

    .line 696
    :cond_2
    if-eqz p3, :cond_5

    .line 697
    monitor-enter p0

    .line 698
    const/4 v7, 0x0

    :try_start_0
    invoke-direct {p0, p1, p2, v7}, Ljavolution/util/stripped/FastMap;->remove(Ljava/lang/Object;IZ)Ljava/lang/Object;

    move-result-object v6

    monitor-exit p0

    goto :goto_1

    .line 699
    :catchall_0
    move-exception v7

    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v7

    .line 692
    :cond_3
    iget-object v8, p0, Ljavolution/util/stripped/FastMap;->_keyComparator:Ljavolution/util/stripped/FastComparator;

    invoke-static {v1}, Ljavolution/util/stripped/FastMap$Entry;->access$300(Ljavolution/util/stripped/FastMap$Entry;)Ljava/lang/Object;

    move-result-object v9

    invoke-virtual {v8, p1, v9}, Ljavolution/util/stripped/FastComparator;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v8

    if-nez v8, :cond_2

    .line 687
    :cond_4
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 703
    :cond_5
    invoke-static {v1}, Ljavolution/util/stripped/FastMap$Entry;->access$100(Ljavolution/util/stripped/FastMap$Entry;)Ljavolution/util/stripped/FastMap$Entry;

    move-result-object v8

    invoke-static {v1}, Ljavolution/util/stripped/FastMap$Entry;->access$000(Ljavolution/util/stripped/FastMap$Entry;)Ljavolution/util/stripped/FastMap$Entry;

    move-result-object v9

    invoke-static {v8, v9}, Ljavolution/util/stripped/FastMap$Entry;->access$002(Ljavolution/util/stripped/FastMap$Entry;Ljavolution/util/stripped/FastMap$Entry;)Ljavolution/util/stripped/FastMap$Entry;

    .line 704
    invoke-static {v1}, Ljavolution/util/stripped/FastMap$Entry;->access$000(Ljavolution/util/stripped/FastMap$Entry;)Ljavolution/util/stripped/FastMap$Entry;

    move-result-object v8

    invoke-static {v1}, Ljavolution/util/stripped/FastMap$Entry;->access$100(Ljavolution/util/stripped/FastMap$Entry;)Ljavolution/util/stripped/FastMap$Entry;

    move-result-object v9

    invoke-static {v8, v9}, Ljavolution/util/stripped/FastMap$Entry;->access$102(Ljavolution/util/stripped/FastMap$Entry;Ljavolution/util/stripped/FastMap$Entry;)Ljavolution/util/stripped/FastMap$Entry;

    .line 707
    and-int v8, v2, v4

    sget-object v9, Ljavolution/util/stripped/FastMap$Entry;->NULL:Ljavolution/util/stripped/FastMap$Entry;

    aput-object v9, v0, v8

    .line 708
    iget v8, v3, Ljavolution/util/stripped/FastMap;->_nullCount:I

    add-int/lit8 v8, v8, 0x1

    iput v8, v3, Ljavolution/util/stripped/FastMap;->_nullCount:I

    .line 709
    iget v8, v3, Ljavolution/util/stripped/FastMap;->_entryCount:I

    add-int/lit8 v8, v8, -0x1

    iput v8, v3, Ljavolution/util/stripped/FastMap;->_entryCount:I

    .line 711
    invoke-static {v1}, Ljavolution/util/stripped/FastMap$Entry;->access$200(Ljavolution/util/stripped/FastMap$Entry;)Ljava/lang/Object;

    move-result-object v6

    .line 712
    .local v6, "prevValue":Ljava/lang/Object;
    iget-boolean v8, p0, Ljavolution/util/stripped/FastMap;->_isShared:Z

    if-nez v8, :cond_0

    .line 713
    invoke-static {v1, v7}, Ljavolution/util/stripped/FastMap$Entry;->access$302(Ljavolution/util/stripped/FastMap$Entry;Ljava/lang/Object;)Ljava/lang/Object;

    .line 714
    invoke-static {v1, v7}, Ljavolution/util/stripped/FastMap$Entry;->access$202(Ljavolution/util/stripped/FastMap$Entry;Ljava/lang/Object;)Ljava/lang/Object;

    .line 716
    iget-object v7, p0, Ljavolution/util/stripped/FastMap;->_tail:Ljavolution/util/stripped/FastMap$Entry;

    invoke-static {v7}, Ljavolution/util/stripped/FastMap$Entry;->access$000(Ljavolution/util/stripped/FastMap$Entry;)Ljavolution/util/stripped/FastMap$Entry;

    move-result-object v5

    .line 717
    .local v5, "next":Ljavolution/util/stripped/FastMap$Entry;
    iget-object v7, p0, Ljavolution/util/stripped/FastMap;->_tail:Ljavolution/util/stripped/FastMap$Entry;

    invoke-static {v1, v7}, Ljavolution/util/stripped/FastMap$Entry;->access$102(Ljavolution/util/stripped/FastMap$Entry;Ljavolution/util/stripped/FastMap$Entry;)Ljavolution/util/stripped/FastMap$Entry;

    .line 718
    invoke-static {v1, v5}, Ljavolution/util/stripped/FastMap$Entry;->access$002(Ljavolution/util/stripped/FastMap$Entry;Ljavolution/util/stripped/FastMap$Entry;)Ljavolution/util/stripped/FastMap$Entry;

    .line 719
    iget-object v7, p0, Ljavolution/util/stripped/FastMap;->_tail:Ljavolution/util/stripped/FastMap$Entry;

    invoke-static {v7, v1}, Ljavolution/util/stripped/FastMap$Entry;->access$002(Ljavolution/util/stripped/FastMap$Entry;Ljavolution/util/stripped/FastMap$Entry;)Ljavolution/util/stripped/FastMap$Entry;

    .line 720
    if-eqz v5, :cond_0

    .line 721
    invoke-static {v5, v1}, Ljavolution/util/stripped/FastMap$Entry;->access$102(Ljavolution/util/stripped/FastMap$Entry;Ljavolution/util/stripped/FastMap$Entry;)Ljavolution/util/stripped/FastMap$Entry;

    goto/16 :goto_1
.end method

.method private static reset([Ljava/lang/Object;)V
    .locals 4
    .param p0, "entries"    # [Ljava/lang/Object;

    .prologue
    .line 1622
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    array-length v2, p0

    if-ge v1, v2, :cond_0

    .line 1623
    array-length v2, p0

    sub-int/2addr v2, v1

    const/16 v3, 0x400

    invoke-static {v2, v3}, Ljava/lang/Math;->min(II)I

    move-result v0

    .line 1624
    .local v0, "count":I
    sget-object v2, Ljavolution/util/stripped/FastMap;->NULL_ENTRIES:[Ljavolution/util/stripped/FastMap$Entry;

    const/4 v3, 0x0

    invoke-static {v2, v3, p0, v1, v0}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 1625
    add-int/2addr v1, v0

    .line 1626
    goto :goto_0

    .line 1627
    .end local v0    # "count":I
    :cond_0
    return-void
.end method

.method private resizeTable(Z)V
    .locals 12
    .param p1, "isShared"    # Z

    .prologue
    .local p0, "this":Ljavolution/util/stripped/FastMap;, "Ljavolution/util/stripped/FastMap<TK;TV;>;"
    const/4 v7, 0x1

    const/4 v8, 0x0

    .line 504
    iget v3, p0, Ljavolution/util/stripped/FastMap;->_nullCount:I

    .line 505
    .local v3, "nullCount":I
    iput v8, p0, Ljavolution/util/stripped/FastMap;->_nullCount:I

    .line 508
    iget v9, p0, Ljavolution/util/stripped/FastMap;->_entryCount:I

    if-le v3, v9, :cond_1

    .line 509
    if-eqz p1, :cond_0

    .line 510
    iget-object v7, p0, Ljavolution/util/stripped/FastMap;->_entries:[Ljavolution/util/stripped/FastMap$Entry;

    array-length v7, v7

    new-array v6, v7, [Ljavolution/util/stripped/FastMap$Entry;

    .line 511
    .local v6, "tmp":[Ljavolution/util/stripped/FastMap$Entry;
    iget-object v7, p0, Ljavolution/util/stripped/FastMap;->_entries:[Ljavolution/util/stripped/FastMap$Entry;

    iget-object v8, p0, Ljavolution/util/stripped/FastMap;->_entries:[Ljavolution/util/stripped/FastMap$Entry;

    array-length v8, v8

    invoke-direct {p0, v7, v6, v8}, Ljavolution/util/stripped/FastMap;->copyEntries([Ljava/lang/Object;[Ljavolution/util/stripped/FastMap$Entry;I)V

    .line 512
    iput-object v6, p0, Ljavolution/util/stripped/FastMap;->_entries:[Ljavolution/util/stripped/FastMap$Entry;

    .line 563
    .end local v6    # "tmp":[Ljavolution/util/stripped/FastMap$Entry;
    :goto_0
    return-void

    .line 514
    :cond_0
    iget-object v7, p0, Ljavolution/util/stripped/FastMap;->_entries:[Ljavolution/util/stripped/FastMap$Entry;

    array-length v7, v7

    new-array v6, v7, [Ljava/lang/Object;

    check-cast v6, [Ljava/lang/Object;

    .line 515
    .local v6, "tmp":[Ljava/lang/Object;
    iget-object v7, p0, Ljavolution/util/stripped/FastMap;->_entries:[Ljavolution/util/stripped/FastMap$Entry;

    iget-object v9, p0, Ljavolution/util/stripped/FastMap;->_entries:[Ljavolution/util/stripped/FastMap$Entry;

    array-length v9, v9

    invoke-static {v7, v8, v6, v8, v9}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 516
    iget-object v7, p0, Ljavolution/util/stripped/FastMap;->_entries:[Ljavolution/util/stripped/FastMap$Entry;

    invoke-static {v7}, Ljavolution/util/stripped/FastMap;->reset([Ljava/lang/Object;)V

    .line 517
    iget-object v7, p0, Ljavolution/util/stripped/FastMap;->_entries:[Ljavolution/util/stripped/FastMap$Entry;

    iget-object v8, p0, Ljavolution/util/stripped/FastMap;->_entries:[Ljavolution/util/stripped/FastMap$Entry;

    array-length v8, v8

    invoke-direct {p0, v6, v7, v8}, Ljavolution/util/stripped/FastMap;->copyEntries([Ljava/lang/Object;[Ljavolution/util/stripped/FastMap$Entry;I)V

    goto :goto_0

    .line 523
    .end local v6    # "tmp":[Ljava/lang/Object;
    :cond_1
    iget-object v9, p0, Ljavolution/util/stripped/FastMap;->_entries:[Ljavolution/util/stripped/FastMap$Entry;

    array-length v9, v9

    shl-int/lit8 v5, v9, 0x1

    .line 524
    .local v5, "tableLength":I
    const/16 v9, 0x400

    if-gt v5, v9, :cond_2

    .line 525
    new-array v6, v5, [Ljavolution/util/stripped/FastMap$Entry;

    .line 526
    .local v6, "tmp":[Ljavolution/util/stripped/FastMap$Entry;
    iget-object v7, p0, Ljavolution/util/stripped/FastMap;->_entries:[Ljavolution/util/stripped/FastMap$Entry;

    iget-object v8, p0, Ljavolution/util/stripped/FastMap;->_entries:[Ljavolution/util/stripped/FastMap$Entry;

    array-length v8, v8

    invoke-direct {p0, v7, v6, v8}, Ljavolution/util/stripped/FastMap;->copyEntries([Ljava/lang/Object;[Ljavolution/util/stripped/FastMap$Entry;I)V

    .line 527
    iput-object v6, p0, Ljavolution/util/stripped/FastMap;->_entries:[Ljavolution/util/stripped/FastMap$Entry;

    goto :goto_0

    .line 532
    .end local v6    # "tmp":[Ljavolution/util/stripped/FastMap$Entry;
    :cond_2
    iget-object v9, p0, Ljavolution/util/stripped/FastMap;->_subMaps:[Ljavolution/util/stripped/FastMap;

    if-nez v9, :cond_3

    .line 533
    shr-int/lit8 v9, v5, 0x5

    invoke-direct {p0, v9}, Ljavolution/util/stripped/FastMap;->newSubMaps(I)[Ljavolution/util/stripped/FastMap;

    move-result-object v9

    iput-object v9, p0, Ljavolution/util/stripped/FastMap;->_subMaps:[Ljavolution/util/stripped/FastMap;

    .line 537
    :cond_3
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_1
    iget-object v9, p0, Ljavolution/util/stripped/FastMap;->_entries:[Ljavolution/util/stripped/FastMap$Entry;

    array-length v9, v9

    if-ge v1, v9, :cond_6

    .line 538
    iget-object v9, p0, Ljavolution/util/stripped/FastMap;->_entries:[Ljavolution/util/stripped/FastMap$Entry;

    add-int/lit8 v2, v1, 0x1

    .end local v1    # "i":I
    .local v2, "i":I
    aget-object v0, v9, v1

    .line 539
    .local v0, "entry":Ljavolution/util/stripped/FastMap$Entry;
    if-eqz v0, :cond_9

    sget-object v9, Ljavolution/util/stripped/FastMap$Entry;->NULL:Ljavolution/util/stripped/FastMap$Entry;

    if-ne v0, v9, :cond_4

    move v1, v2

    .line 540
    .end local v2    # "i":I
    .restart local v1    # "i":I
    goto :goto_1

    .line 542
    .end local v1    # "i":I
    .restart local v2    # "i":I
    :cond_4
    iget-object v9, p0, Ljavolution/util/stripped/FastMap;->_subMaps:[Ljavolution/util/stripped/FastMap;

    invoke-static {v0}, Ljavolution/util/stripped/FastMap$Entry;->access$400(Ljavolution/util/stripped/FastMap$Entry;)I

    move-result v10

    iget v11, p0, Ljavolution/util/stripped/FastMap;->_keyShift:I

    shr-int/2addr v10, v11

    and-int/lit8 v10, v10, 0x3f

    aget-object v4, v9, v10

    .line 543
    .local v4, "subMap":Ljavolution/util/stripped/FastMap;
    invoke-direct {v4, v0}, Ljavolution/util/stripped/FastMap;->mapEntry(Ljavolution/util/stripped/FastMap$Entry;)V

    .line 544
    iget v9, v4, Ljavolution/util/stripped/FastMap;->_entryCount:I

    iget v10, v4, Ljavolution/util/stripped/FastMap;->_nullCount:I

    add-int/2addr v9, v10

    shl-int/lit8 v9, v9, 0x1

    iget-object v10, v4, Ljavolution/util/stripped/FastMap;->_entries:[Ljavolution/util/stripped/FastMap$Entry;

    array-length v10, v10

    if-lt v9, v10, :cond_5

    .line 546
    sget-object v7, Ljavolution/util/stripped/FastMap;->logger:Ljava/util/logging/Logger;

    const-string v8, "Unevenly distributed hash code - Degraded Preformance"

    invoke-virtual {v7, v8}, Ljava/util/logging/Logger;->warning(Ljava/lang/String;)V

    .line 547
    new-array v6, v5, [Ljavolution/util/stripped/FastMap$Entry;

    .line 548
    .restart local v6    # "tmp":[Ljavolution/util/stripped/FastMap$Entry;
    iget-object v7, p0, Ljavolution/util/stripped/FastMap;->_entries:[Ljavolution/util/stripped/FastMap$Entry;

    iget-object v8, p0, Ljavolution/util/stripped/FastMap;->_entries:[Ljavolution/util/stripped/FastMap$Entry;

    array-length v8, v8

    invoke-direct {p0, v7, v6, v8}, Ljavolution/util/stripped/FastMap;->copyEntries([Ljava/lang/Object;[Ljavolution/util/stripped/FastMap$Entry;I)V

    .line 549
    iput-object v6, p0, Ljavolution/util/stripped/FastMap;->_entries:[Ljavolution/util/stripped/FastMap$Entry;

    .line 550
    const/4 v7, 0x0

    iput-object v7, p0, Ljavolution/util/stripped/FastMap;->_subMaps:[Ljavolution/util/stripped/FastMap;

    goto/16 :goto_0

    .end local v6    # "tmp":[Ljavolution/util/stripped/FastMap$Entry;
    :cond_5
    move v1, v2

    .line 553
    .end local v2    # "i":I
    .restart local v1    # "i":I
    goto :goto_1

    .line 555
    .end local v0    # "entry":Ljavolution/util/stripped/FastMap$Entry;
    .end local v4    # "subMap":Ljavolution/util/stripped/FastMap;
    :cond_6
    if-eqz p1, :cond_7

    .line 557
    iget-object v9, p0, Ljavolution/util/stripped/FastMap;->_entries:[Ljavolution/util/stripped/FastMap$Entry;

    invoke-static {v9}, Ljavolution/util/stripped/FastMap;->reset([Ljava/lang/Object;)V

    .line 558
    iput v8, p0, Ljavolution/util/stripped/FastMap;->_nullCount:I

    .line 559
    iput v8, p0, Ljavolution/util/stripped/FastMap;->_entryCount:I

    .line 562
    :cond_7
    sget v9, Ljavolution/util/stripped/FastMap;->ONE_VOLATILE:I

    if-ne v9, v7, :cond_8

    :goto_2
    iput-boolean v7, p0, Ljavolution/util/stripped/FastMap;->_useSubMaps:Z

    goto/16 :goto_0

    :cond_8
    move v7, v8

    goto :goto_2

    .end local v1    # "i":I
    .restart local v0    # "entry":Ljavolution/util/stripped/FastMap$Entry;
    .restart local v2    # "i":I
    :cond_9
    move v1, v2

    .end local v2    # "i":I
    .restart local v1    # "i":I
    goto :goto_1
.end method

.method private setup(I)V
    .locals 7
    .param p1, "capacity"    # I

    .prologue
    .line 211
    .local p0, "this":Ljavolution/util/stripped/FastMap;, "Ljavolution/util/stripped/FastMap<TK;TV;>;"
    const/16 v4, 0x10

    .line 212
    .local v4, "tableLength":I
    :goto_0
    if-ge v4, p1, :cond_0

    .line 213
    shl-int/lit8 v4, v4, 0x1

    goto :goto_0

    .line 215
    :cond_0
    shl-int/lit8 v5, v4, 0x1

    new-array v5, v5, [Ljavolution/util/stripped/FastMap$Entry;

    check-cast v5, [Ljavolution/util/stripped/FastMap$Entry;

    iput-object v5, p0, Ljavolution/util/stripped/FastMap;->_entries:[Ljavolution/util/stripped/FastMap$Entry;

    .line 216
    invoke-virtual {p0}, Ljavolution/util/stripped/FastMap;->newEntry()Ljavolution/util/stripped/FastMap$Entry;

    move-result-object v5

    iput-object v5, p0, Ljavolution/util/stripped/FastMap;->_head:Ljavolution/util/stripped/FastMap$Entry;

    .line 217
    invoke-virtual {p0}, Ljavolution/util/stripped/FastMap;->newEntry()Ljavolution/util/stripped/FastMap$Entry;

    move-result-object v5

    iput-object v5, p0, Ljavolution/util/stripped/FastMap;->_tail:Ljavolution/util/stripped/FastMap$Entry;

    .line 218
    iget-object v5, p0, Ljavolution/util/stripped/FastMap;->_head:Ljavolution/util/stripped/FastMap$Entry;

    iget-object v6, p0, Ljavolution/util/stripped/FastMap;->_tail:Ljavolution/util/stripped/FastMap$Entry;

    invoke-static {v5, v6}, Ljavolution/util/stripped/FastMap$Entry;->access$002(Ljavolution/util/stripped/FastMap$Entry;Ljavolution/util/stripped/FastMap$Entry;)Ljavolution/util/stripped/FastMap$Entry;

    .line 219
    iget-object v5, p0, Ljavolution/util/stripped/FastMap;->_tail:Ljavolution/util/stripped/FastMap$Entry;

    iget-object v6, p0, Ljavolution/util/stripped/FastMap;->_head:Ljavolution/util/stripped/FastMap$Entry;

    invoke-static {v5, v6}, Ljavolution/util/stripped/FastMap$Entry;->access$102(Ljavolution/util/stripped/FastMap$Entry;Ljavolution/util/stripped/FastMap$Entry;)Ljavolution/util/stripped/FastMap$Entry;

    .line 220
    iget-object v3, p0, Ljavolution/util/stripped/FastMap;->_tail:Ljavolution/util/stripped/FastMap$Entry;

    .line 221
    .local v3, "previous":Ljavolution/util/stripped/FastMap$Entry;
    const/4 v0, 0x0

    .local v0, "i":I
    move v1, v0

    .end local v0    # "i":I
    .local v1, "i":I
    :goto_1
    add-int/lit8 v0, v1, 0x1

    .end local v1    # "i":I
    .restart local v0    # "i":I
    if-ge v1, p1, :cond_1

    .line 222
    invoke-virtual {p0}, Ljavolution/util/stripped/FastMap;->newEntry()Ljavolution/util/stripped/FastMap$Entry;

    move-result-object v2

    .line 223
    .local v2, "newEntry":Ljavolution/util/stripped/FastMap$Entry;
    invoke-static {v2, v3}, Ljavolution/util/stripped/FastMap$Entry;->access$102(Ljavolution/util/stripped/FastMap$Entry;Ljavolution/util/stripped/FastMap$Entry;)Ljavolution/util/stripped/FastMap$Entry;

    .line 224
    invoke-static {v3, v2}, Ljavolution/util/stripped/FastMap$Entry;->access$002(Ljavolution/util/stripped/FastMap$Entry;Ljavolution/util/stripped/FastMap$Entry;)Ljavolution/util/stripped/FastMap$Entry;

    .line 225
    move-object v3, v2

    move v1, v0

    .line 226
    .end local v0    # "i":I
    .restart local v1    # "i":I
    goto :goto_1

    .line 227
    .end local v1    # "i":I
    .end local v2    # "newEntry":Ljavolution/util/stripped/FastMap$Entry;
    .restart local v0    # "i":I
    :cond_1
    return-void
.end method

.method private writeObject(Ljava/io/ObjectOutputStream;)V
    .locals 3
    .param p1, "stream"    # Ljava/io/ObjectOutputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 1417
    .local p0, "this":Ljavolution/util/stripped/FastMap;, "Ljavolution/util/stripped/FastMap<TK;TV;>;"
    invoke-virtual {p0}, Ljavolution/util/stripped/FastMap;->getKeyComparator()Ljavolution/util/stripped/FastComparator;

    move-result-object v2

    invoke-virtual {p1, v2}, Ljava/io/ObjectOutputStream;->writeObject(Ljava/lang/Object;)V

    .line 1418
    invoke-virtual {p0}, Ljavolution/util/stripped/FastMap;->getValueComparator()Ljavolution/util/stripped/FastComparator;

    move-result-object v2

    invoke-virtual {p1, v2}, Ljava/io/ObjectOutputStream;->writeObject(Ljava/lang/Object;)V

    .line 1419
    iget-boolean v2, p0, Ljavolution/util/stripped/FastMap;->_isShared:Z

    invoke-virtual {p1, v2}, Ljava/io/ObjectOutputStream;->writeBoolean(Z)V

    .line 1420
    invoke-virtual {p0}, Ljavolution/util/stripped/FastMap;->size()I

    move-result v2

    invoke-virtual {p1, v2}, Ljava/io/ObjectOutputStream;->writeInt(I)V

    .line 1421
    iget-object v0, p0, Ljavolution/util/stripped/FastMap;->_head:Ljavolution/util/stripped/FastMap$Entry;

    .local v0, "e":Ljavolution/util/stripped/FastMap$Entry;
    iget-object v1, p0, Ljavolution/util/stripped/FastMap;->_tail:Ljavolution/util/stripped/FastMap$Entry;

    .local v1, "end":Ljavolution/util/stripped/FastMap$Entry;
    :goto_0
    invoke-static {v0}, Ljavolution/util/stripped/FastMap$Entry;->access$000(Ljavolution/util/stripped/FastMap$Entry;)Ljavolution/util/stripped/FastMap$Entry;

    move-result-object v0

    if-eq v0, v1, :cond_0

    .line 1422
    invoke-static {v0}, Ljavolution/util/stripped/FastMap$Entry;->access$300(Ljavolution/util/stripped/FastMap$Entry;)Ljava/lang/Object;

    move-result-object v2

    invoke-virtual {p1, v2}, Ljava/io/ObjectOutputStream;->writeObject(Ljava/lang/Object;)V

    .line 1423
    invoke-static {v0}, Ljavolution/util/stripped/FastMap$Entry;->access$200(Ljavolution/util/stripped/FastMap$Entry;)Ljava/lang/Object;

    move-result-object v2

    invoke-virtual {p1, v2}, Ljava/io/ObjectOutputStream;->writeObject(Ljava/lang/Object;)V

    goto :goto_0

    .line 1425
    :cond_0
    return-void
.end method


# virtual methods
.method public final clear()V
    .locals 4

    .prologue
    .local p0, "this":Ljavolution/util/stripped/FastMap;, "Ljavolution/util/stripped/FastMap<TK;TV;>;"
    const/4 v3, 0x0

    .line 825
    iget-boolean v2, p0, Ljavolution/util/stripped/FastMap;->_isShared:Z

    if-eqz v2, :cond_0

    .line 826
    invoke-direct {p0}, Ljavolution/util/stripped/FastMap;->clearShared()V

    .line 836
    :goto_0
    return-void

    .line 830
    :cond_0
    iget-object v0, p0, Ljavolution/util/stripped/FastMap;->_head:Ljavolution/util/stripped/FastMap$Entry;

    .local v0, "e":Ljavolution/util/stripped/FastMap$Entry;
    iget-object v1, p0, Ljavolution/util/stripped/FastMap;->_tail:Ljavolution/util/stripped/FastMap$Entry;

    .local v1, "end":Ljavolution/util/stripped/FastMap$Entry;
    :goto_1
    invoke-static {v0}, Ljavolution/util/stripped/FastMap$Entry;->access$000(Ljavolution/util/stripped/FastMap$Entry;)Ljavolution/util/stripped/FastMap$Entry;

    move-result-object v0

    if-eq v0, v1, :cond_1

    .line 831
    invoke-static {v0, v3}, Ljavolution/util/stripped/FastMap$Entry;->access$302(Ljavolution/util/stripped/FastMap$Entry;Ljava/lang/Object;)Ljava/lang/Object;

    .line 832
    invoke-static {v0, v3}, Ljavolution/util/stripped/FastMap$Entry;->access$202(Ljavolution/util/stripped/FastMap$Entry;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_1

    .line 834
    :cond_1
    iget-object v2, p0, Ljavolution/util/stripped/FastMap;->_head:Ljavolution/util/stripped/FastMap$Entry;

    invoke-static {v2}, Ljavolution/util/stripped/FastMap$Entry;->access$000(Ljavolution/util/stripped/FastMap$Entry;)Ljavolution/util/stripped/FastMap$Entry;

    move-result-object v2

    iput-object v2, p0, Ljavolution/util/stripped/FastMap;->_tail:Ljavolution/util/stripped/FastMap$Entry;

    .line 835
    invoke-direct {p0}, Ljavolution/util/stripped/FastMap;->clearTables()V

    goto :goto_0
.end method

.method public final containsKey(Ljava/lang/Object;)Z
    .locals 1
    .param p1, "key"    # Ljava/lang/Object;

    .prologue
    .line 329
    .local p0, "this":Ljavolution/util/stripped/FastMap;, "Ljavolution/util/stripped/FastMap<TK;TV;>;"
    invoke-virtual {p0, p1}, Ljavolution/util/stripped/FastMap;->getEntry(Ljava/lang/Object;)Ljavolution/util/stripped/FastMap$Entry;

    move-result-object v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public final containsValue(Ljava/lang/Object;)Z
    .locals 1
    .param p1, "value"    # Ljava/lang/Object;

    .prologue
    .line 341
    .local p0, "this":Ljavolution/util/stripped/FastMap;, "Ljavolution/util/stripped/FastMap<TK;TV;>;"
    invoke-virtual {p0}, Ljavolution/util/stripped/FastMap;->values()Ljava/util/Collection;

    move-result-object v0

    invoke-interface {v0, p1}, Ljava/util/Collection;->contains(Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method public final entrySet()Ljava/util/Set;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Set",
            "<",
            "Ljava/util/Map$Entry",
            "<TK;TV;>;>;"
        }
    .end annotation

    .prologue
    .line 1133
    .local p0, "this":Ljavolution/util/stripped/FastMap;, "Ljavolution/util/stripped/FastMap<TK;TV;>;"
    iget-object v0, p0, Ljavolution/util/stripped/FastMap;->_entrySet:Ljavolution/util/stripped/FastMap$EntrySet;

    if-nez v0, :cond_0

    .line 1134
    new-instance v0, Ljavolution/util/stripped/FastMap$EntrySet;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Ljavolution/util/stripped/FastMap$EntrySet;-><init>(Ljavolution/util/stripped/FastMap;Ljavolution/util/stripped/FastMap$1;)V

    iput-object v0, p0, Ljavolution/util/stripped/FastMap;->_entrySet:Ljavolution/util/stripped/FastMap$EntrySet;

    .line 1136
    :cond_0
    iget-object v0, p0, Ljavolution/util/stripped/FastMap;->_entrySet:Ljavolution/util/stripped/FastMap$EntrySet;

    return-object v0
.end method

.method public equals(Ljava/lang/Object;)Z
    .locals 3
    .param p1, "obj"    # Ljava/lang/Object;

    .prologue
    .line 879
    .local p0, "this":Ljavolution/util/stripped/FastMap;, "Ljavolution/util/stripped/FastMap<TK;TV;>;"
    if-ne p1, p0, :cond_0

    .line 880
    const/4 v1, 0x1

    .line 885
    :goto_0
    return v1

    .line 881
    :cond_0
    instance-of v1, p1, Ljava/util/Map;

    if-eqz v1, :cond_1

    move-object v0, p1

    .line 882
    check-cast v0, Ljava/util/Map;

    .line 883
    .local v0, "that":Ljava/util/Map;, "Ljava/util/Map<**>;"
    invoke-virtual {p0}, Ljavolution/util/stripped/FastMap;->entrySet()Ljava/util/Set;

    move-result-object v1

    invoke-interface {v0}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v1

    goto :goto_0

    .line 885
    .end local v0    # "that":Ljava/util/Map;, "Ljava/util/Map<**>;"
    :cond_1
    const/4 v1, 0x0

    goto :goto_0
.end method

.method public final get(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 2
    .param p1, "key"    # Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Object;",
            ")TV;"
        }
    .end annotation

    .prologue
    .line 355
    .local p0, "this":Ljavolution/util/stripped/FastMap;, "Ljavolution/util/stripped/FastMap<TK;TV;>;"
    invoke-virtual {p0, p1}, Ljavolution/util/stripped/FastMap;->getEntry(Ljava/lang/Object;)Ljavolution/util/stripped/FastMap$Entry;

    move-result-object v0

    .line 356
    .local v0, "entry":Ljavolution/util/stripped/FastMap$Entry;, "Ljavolution/util/stripped/FastMap$Entry<TK;TV;>;"
    if-eqz v0, :cond_0

    invoke-static {v0}, Ljavolution/util/stripped/FastMap$Entry;->access$200(Ljavolution/util/stripped/FastMap$Entry;)Ljava/lang/Object;

    move-result-object v1

    :goto_0
    return-object v1

    :cond_0
    const/4 v1, 0x0

    goto :goto_0
.end method

.method public final getEntry(Ljava/lang/Object;)Ljavolution/util/stripped/FastMap$Entry;
    .locals 1
    .param p1, "key"    # Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Object;",
            ")",
            "Ljavolution/util/stripped/FastMap$Entry",
            "<TK;TV;>;"
        }
    .end annotation

    .prologue
    .line 367
    .local p0, "this":Ljavolution/util/stripped/FastMap;, "Ljavolution/util/stripped/FastMap<TK;TV;>;"
    iget-boolean v0, p0, Ljavolution/util/stripped/FastMap;->_isDirectKeyComparator:Z

    if-eqz v0, :cond_0

    invoke-virtual {p1}, Ljava/lang/Object;->hashCode()I

    move-result v0

    :goto_0
    invoke-direct {p0, p1, v0}, Ljavolution/util/stripped/FastMap;->getEntry(Ljava/lang/Object;I)Ljavolution/util/stripped/FastMap$Entry;

    move-result-object v0

    return-object v0

    :cond_0
    iget-object v0, p0, Ljavolution/util/stripped/FastMap;->_keyComparator:Ljavolution/util/stripped/FastComparator;

    invoke-virtual {v0, p1}, Ljavolution/util/stripped/FastComparator;->hashCodeOf(Ljava/lang/Object;)I

    move-result v0

    goto :goto_0
.end method

.method public getKeyComparator()Ljavolution/util/stripped/FastComparator;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljavolution/util/stripped/FastComparator",
            "<-TK;>;"
        }
    .end annotation

    .prologue
    .line 789
    .local p0, "this":Ljavolution/util/stripped/FastMap;, "Ljavolution/util/stripped/FastMap<TK;TV;>;"
    iget-object v0, p0, Ljavolution/util/stripped/FastMap;->_keyComparator:Ljavolution/util/stripped/FastComparator;

    return-object v0
.end method

.method public getValueComparator()Ljavolution/util/stripped/FastComparator;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljavolution/util/stripped/FastComparator",
            "<-TV;>;"
        }
    .end annotation

    .prologue
    .line 811
    .local p0, "this":Ljavolution/util/stripped/FastMap;, "Ljavolution/util/stripped/FastMap<TK;TV;>;"
    iget-object v0, p0, Ljavolution/util/stripped/FastMap;->_valueComparator:Ljavolution/util/stripped/FastComparator;

    return-object v0
.end method

.method public hashCode()I
    .locals 4

    .prologue
    .line 895
    .local p0, "this":Ljavolution/util/stripped/FastMap;, "Ljavolution/util/stripped/FastMap<TK;TV;>;"
    const/4 v0, 0x0

    .line 896
    .local v0, "code":I
    iget-object v1, p0, Ljavolution/util/stripped/FastMap;->_head:Ljavolution/util/stripped/FastMap$Entry;

    .local v1, "e":Ljavolution/util/stripped/FastMap$Entry;
    iget-object v2, p0, Ljavolution/util/stripped/FastMap;->_tail:Ljavolution/util/stripped/FastMap$Entry;

    .local v2, "end":Ljavolution/util/stripped/FastMap$Entry;
    :goto_0
    invoke-static {v1}, Ljavolution/util/stripped/FastMap$Entry;->access$000(Ljavolution/util/stripped/FastMap$Entry;)Ljavolution/util/stripped/FastMap$Entry;

    move-result-object v1

    if-eq v1, v2, :cond_0

    .line 897
    invoke-virtual {v1}, Ljavolution/util/stripped/FastMap$Entry;->hashCode()I

    move-result v3

    add-int/2addr v0, v3

    goto :goto_0

    .line 899
    :cond_0
    return v0
.end method

.method public final head()Ljavolution/util/stripped/FastMap$Entry;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljavolution/util/stripped/FastMap$Entry",
            "<TK;TV;>;"
        }
    .end annotation

    .prologue
    .line 278
    .local p0, "this":Ljavolution/util/stripped/FastMap;, "Ljavolution/util/stripped/FastMap<TK;TV;>;"
    iget-object v0, p0, Ljavolution/util/stripped/FastMap;->_head:Ljavolution/util/stripped/FastMap$Entry;

    return-object v0
.end method

.method public final isEmpty()Z
    .locals 2

    .prologue
    .line 317
    .local p0, "this":Ljavolution/util/stripped/FastMap;, "Ljavolution/util/stripped/FastMap<TK;TV;>;"
    iget-object v0, p0, Ljavolution/util/stripped/FastMap;->_head:Ljavolution/util/stripped/FastMap$Entry;

    invoke-static {v0}, Ljavolution/util/stripped/FastMap$Entry;->access$000(Ljavolution/util/stripped/FastMap$Entry;)Ljavolution/util/stripped/FastMap$Entry;

    move-result-object v0

    iget-object v1, p0, Ljavolution/util/stripped/FastMap;->_tail:Ljavolution/util/stripped/FastMap$Entry;

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public isShared()Z
    .locals 1

    .prologue
    .line 766
    .local p0, "this":Ljavolution/util/stripped/FastMap;, "Ljavolution/util/stripped/FastMap<TK;TV;>;"
    iget-boolean v0, p0, Ljavolution/util/stripped/FastMap;->_isShared:Z

    return v0
.end method

.method public final keySet()Ljava/util/Set;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Set",
            "<TK;>;"
        }
    .end annotation

    .prologue
    .line 1267
    .local p0, "this":Ljavolution/util/stripped/FastMap;, "Ljavolution/util/stripped/FastMap<TK;TV;>;"
    iget-object v0, p0, Ljavolution/util/stripped/FastMap;->_keySet:Ljavolution/util/stripped/FastMap$KeySet;

    if-nez v0, :cond_0

    .line 1268
    new-instance v0, Ljavolution/util/stripped/FastMap$KeySet;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Ljavolution/util/stripped/FastMap$KeySet;-><init>(Ljavolution/util/stripped/FastMap;Ljavolution/util/stripped/FastMap$1;)V

    iput-object v0, p0, Ljavolution/util/stripped/FastMap;->_keySet:Ljavolution/util/stripped/FastMap$KeySet;

    .line 1270
    :cond_0
    iget-object v0, p0, Ljavolution/util/stripped/FastMap;->_keySet:Ljavolution/util/stripped/FastMap$KeySet;

    return-object v0
.end method

.method protected newEntry()Ljavolution/util/stripped/FastMap$Entry;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljavolution/util/stripped/FastMap$Entry",
            "<TK;TV;>;"
        }
    .end annotation

    .prologue
    .line 910
    .local p0, "this":Ljavolution/util/stripped/FastMap;, "Ljavolution/util/stripped/FastMap<TK;TV;>;"
    new-instance v0, Ljavolution/util/stripped/FastMap$Entry;

    invoke-direct {v0}, Ljavolution/util/stripped/FastMap$Entry;-><init>()V

    return-object v0
.end method

.method public printStatistics(Ljava/io/PrintStream;)V
    .locals 8
    .param p1, "out"    # Ljava/io/PrintStream;

    .prologue
    .line 922
    .local p0, "this":Ljavolution/util/stripped/FastMap;, "Ljavolution/util/stripped/FastMap<TK;TV;>;"
    invoke-direct {p0}, Ljavolution/util/stripped/FastMap;->getSumDistance()J

    move-result-wide v2

    .line 923
    .local v2, "sum":J
    invoke-virtual {p0}, Ljavolution/util/stripped/FastMap;->size()I

    move-result v1

    .line 924
    .local v1, "size":I
    if-eqz v1, :cond_0

    const-wide/16 v4, 0x64

    mul-long/2addr v4, v2

    int-to-long v6, v1

    div-long/2addr v4, v6

    long-to-int v0, v4

    .line 925
    .local v0, "avgDistancePercent":I
    :goto_0
    monitor-enter p1

    .line 926
    :try_start_0
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "SIZE: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {p1, v4}, Ljava/io/PrintStream;->print(Ljava/lang/String;)V

    .line 927
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, ", ENTRIES: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-direct {p0}, Ljavolution/util/stripped/FastMap;->getCapacity()I

    move-result v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {p1, v4}, Ljava/io/PrintStream;->print(Ljava/lang/String;)V

    .line 928
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, ", SLOTS: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-direct {p0}, Ljavolution/util/stripped/FastMap;->getTableLength()I

    move-result v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {p1, v4}, Ljava/io/PrintStream;->print(Ljava/lang/String;)V

    .line 929
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, ", USE SUB-MAPS: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget-boolean v5, p0, Ljavolution/util/stripped/FastMap;->_useSubMaps:Z

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {p1, v4}, Ljava/io/PrintStream;->print(Ljava/lang/String;)V

    .line 930
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, ", SUB-MAPS DEPTH: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-direct {p0}, Ljavolution/util/stripped/FastMap;->getSubMapDepth()I

    move-result v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {p1, v4}, Ljava/io/PrintStream;->print(Ljava/lang/String;)V

    .line 931
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, ", NULL COUNT: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget v5, p0, Ljavolution/util/stripped/FastMap;->_nullCount:I

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {p1, v4}, Ljava/io/PrintStream;->print(Ljava/lang/String;)V

    .line 932
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, ", IS SHARED: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget-boolean v5, p0, Ljavolution/util/stripped/FastMap;->_isShared:Z

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {p1, v4}, Ljava/io/PrintStream;->print(Ljava/lang/String;)V

    .line 933
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, ", AVG DISTANCE: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, "%"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {p1, v4}, Ljava/io/PrintStream;->print(Ljava/lang/String;)V

    .line 934
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, ", MAX DISTANCE: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-direct {p0}, Ljavolution/util/stripped/FastMap;->getMaximumDistance()I

    move-result v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {p1, v4}, Ljava/io/PrintStream;->print(Ljava/lang/String;)V

    .line 935
    invoke-virtual {p1}, Ljava/io/PrintStream;->println()V

    .line 936
    monitor-exit p1

    .line 937
    return-void

    .line 924
    .end local v0    # "avgDistancePercent":I
    :cond_0
    const/4 v0, 0x0

    goto/16 :goto_0

    .line 936
    .restart local v0    # "avgDistancePercent":I
    :catchall_0
    move-exception v4

    monitor-exit p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v4
.end method

.method public final put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TK;TV;)TV;"
        }
    .end annotation

    .prologue
    .local p0, "this":Ljavolution/util/stripped/FastMap;, "Ljavolution/util/stripped/FastMap<TK;TV;>;"
    .local p1, "key":Ljava/lang/Object;, "TK;"
    .local p2, "value":Ljava/lang/Object;, "TV;"
    const/4 v5, 0x0

    .line 407
    iget-boolean v0, p0, Ljavolution/util/stripped/FastMap;->_isDirectKeyComparator:Z

    if-eqz v0, :cond_0

    invoke-virtual {p1}, Ljava/lang/Object;->hashCode()I

    move-result v3

    :goto_0
    iget-boolean v4, p0, Ljavolution/util/stripped/FastMap;->_isShared:Z

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move v6, v5

    invoke-direct/range {v0 .. v6}, Ljavolution/util/stripped/FastMap;->put(Ljava/lang/Object;Ljava/lang/Object;IZZZ)Ljava/lang/Object;

    move-result-object v0

    return-object v0

    :cond_0
    iget-object v0, p0, Ljavolution/util/stripped/FastMap;->_keyComparator:Ljavolution/util/stripped/FastComparator;

    invoke-virtual {v0, p1}, Ljavolution/util/stripped/FastComparator;->hashCodeOf(Ljava/lang/Object;)I

    move-result v3

    goto :goto_0
.end method

.method public final putAll(Ljava/util/Map;)V
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map",
            "<+TK;+TV;>;)V"
        }
    .end annotation

    .prologue
    .line 630
    .local p0, "this":Ljavolution/util/stripped/FastMap;, "Ljavolution/util/stripped/FastMap<TK;TV;>;"
    .local p1, "map":Ljava/util/Map;, "Ljava/util/Map<+TK;+TV;>;"
    invoke-interface {p1}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "i":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 631
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Map$Entry;

    .line 632
    .local v0, "e":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<TK;TV;>;"
    invoke-interface {v0}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v2

    invoke-interface {v0}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v3

    invoke-virtual {p0, v2, v3}, Ljavolution/util/stripped/FastMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_0

    .line 634
    .end local v0    # "e":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<TK;TV;>;"
    :cond_0
    return-void
.end method

.method public final putEntry(Ljava/lang/Object;Ljava/lang/Object;)Ljavolution/util/stripped/FastMap$Entry;
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TK;TV;)",
            "Ljavolution/util/stripped/FastMap$Entry",
            "<TK;TV;>;"
        }
    .end annotation

    .prologue
    .line 618
    .local p0, "this":Ljavolution/util/stripped/FastMap;, "Ljavolution/util/stripped/FastMap<TK;TV;>;"
    .local p1, "key":Ljava/lang/Object;, "TK;"
    .local p2, "value":Ljava/lang/Object;, "TV;"
    iget-boolean v0, p0, Ljavolution/util/stripped/FastMap;->_isDirectKeyComparator:Z

    if-eqz v0, :cond_0

    invoke-virtual {p1}, Ljava/lang/Object;->hashCode()I

    move-result v3

    :goto_0
    iget-boolean v4, p0, Ljavolution/util/stripped/FastMap;->_isShared:Z

    const/4 v5, 0x0

    const/4 v6, 0x1

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    invoke-direct/range {v0 .. v6}, Ljavolution/util/stripped/FastMap;->put(Ljava/lang/Object;Ljava/lang/Object;IZZZ)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljavolution/util/stripped/FastMap$Entry;

    return-object v0

    :cond_0
    iget-object v0, p0, Ljavolution/util/stripped/FastMap;->_keyComparator:Ljavolution/util/stripped/FastComparator;

    invoke-virtual {v0, p1}, Ljavolution/util/stripped/FastComparator;->hashCodeOf(Ljava/lang/Object;)I

    move-result v3

    goto :goto_0
.end method

.method public final putIfAbsent(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TK;TV;)TV;"
        }
    .end annotation

    .prologue
    .line 658
    .local p0, "this":Ljavolution/util/stripped/FastMap;, "Ljavolution/util/stripped/FastMap<TK;TV;>;"
    .local p1, "key":Ljava/lang/Object;, "TK;"
    .local p2, "value":Ljava/lang/Object;, "TV;"
    iget-boolean v0, p0, Ljavolution/util/stripped/FastMap;->_isDirectKeyComparator:Z

    if-eqz v0, :cond_0

    invoke-virtual {p1}, Ljava/lang/Object;->hashCode()I

    move-result v3

    :goto_0
    iget-boolean v4, p0, Ljavolution/util/stripped/FastMap;->_isShared:Z

    const/4 v5, 0x1

    const/4 v6, 0x0

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    invoke-direct/range {v0 .. v6}, Ljavolution/util/stripped/FastMap;->put(Ljava/lang/Object;Ljava/lang/Object;IZZZ)Ljava/lang/Object;

    move-result-object v0

    return-object v0

    :cond_0
    iget-object v0, p0, Ljavolution/util/stripped/FastMap;->_keyComparator:Ljavolution/util/stripped/FastComparator;

    invoke-virtual {v0, p1}, Ljavolution/util/stripped/FastComparator;->hashCodeOf(Ljava/lang/Object;)I

    move-result v3

    goto :goto_0
.end method

.method public final remove(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 2
    .param p1, "key"    # Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Object;",
            ")TV;"
        }
    .end annotation

    .prologue
    .line 680
    .local p0, "this":Ljavolution/util/stripped/FastMap;, "Ljavolution/util/stripped/FastMap<TK;TV;>;"
    iget-boolean v0, p0, Ljavolution/util/stripped/FastMap;->_isDirectKeyComparator:Z

    if-eqz v0, :cond_0

    invoke-virtual {p1}, Ljava/lang/Object;->hashCode()I

    move-result v0

    :goto_0
    iget-boolean v1, p0, Ljavolution/util/stripped/FastMap;->_isShared:Z

    invoke-direct {p0, p1, v0, v1}, Ljavolution/util/stripped/FastMap;->remove(Ljava/lang/Object;IZ)Ljava/lang/Object;

    move-result-object v0

    return-object v0

    :cond_0
    iget-object v0, p0, Ljavolution/util/stripped/FastMap;->_keyComparator:Ljavolution/util/stripped/FastComparator;

    invoke-virtual {v0, p1}, Ljavolution/util/stripped/FastComparator;->hashCodeOf(Ljava/lang/Object;)I

    move-result v0

    goto :goto_0
.end method

.method public reset()V
    .locals 1

    .prologue
    .line 1381
    .local p0, "this":Ljavolution/util/stripped/FastMap;, "Ljavolution/util/stripped/FastMap<TK;TV;>;"
    const/4 v0, 0x0

    iput-boolean v0, p0, Ljavolution/util/stripped/FastMap;->_isShared:Z

    .line 1382
    invoke-virtual {p0}, Ljavolution/util/stripped/FastMap;->clear()V

    .line 1383
    sget-object v0, Ljavolution/util/stripped/FastComparator;->DEFAULT:Ljavolution/util/stripped/FastComparator;

    invoke-virtual {p0, v0}, Ljavolution/util/stripped/FastMap;->setKeyComparator(Ljavolution/util/stripped/FastComparator;)Ljavolution/util/stripped/FastMap;

    .line 1384
    sget-object v0, Ljavolution/util/stripped/FastComparator;->DEFAULT:Ljavolution/util/stripped/FastComparator;

    invoke-virtual {p0, v0}, Ljavolution/util/stripped/FastMap;->setValueComparator(Ljavolution/util/stripped/FastComparator;)Ljavolution/util/stripped/FastMap;

    .line 1385
    return-void
.end method

.method public final reverse()Ljavolution/util/stripped/FastMap;
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljavolution/util/stripped/FastMap",
            "<TV;TK;>;"
        }
    .end annotation

    .prologue
    .line 264
    .local p0, "this":Ljavolution/util/stripped/FastMap;, "Ljavolution/util/stripped/FastMap<TK;TV;>;"
    new-instance v1, Ljavolution/util/stripped/FastMap;

    invoke-direct {v1}, Ljavolution/util/stripped/FastMap;-><init>()V

    .line 265
    .local v1, "map":Ljavolution/util/stripped/FastMap;, "Ljavolution/util/stripped/FastMap<TV;TK;>;"
    iget-object v0, p0, Ljavolution/util/stripped/FastMap;->_head:Ljavolution/util/stripped/FastMap$Entry;

    .local v0, "e":Ljavolution/util/stripped/FastMap$Entry;, "Ljavolution/util/stripped/FastMap$Entry<TK;TV;>;"
    iget-object v2, p0, Ljavolution/util/stripped/FastMap;->_tail:Ljavolution/util/stripped/FastMap$Entry;

    .local v2, "n":Ljavolution/util/stripped/FastMap$Entry;, "Ljavolution/util/stripped/FastMap$Entry<TK;TV;>;"
    :goto_0
    invoke-static {v0}, Ljavolution/util/stripped/FastMap$Entry;->access$000(Ljavolution/util/stripped/FastMap$Entry;)Ljavolution/util/stripped/FastMap$Entry;

    move-result-object v0

    if-eq v0, v2, :cond_0

    .line 266
    invoke-static {v0}, Ljavolution/util/stripped/FastMap$Entry;->access$200(Ljavolution/util/stripped/FastMap$Entry;)Ljava/lang/Object;

    move-result-object v3

    invoke-static {v0}, Ljavolution/util/stripped/FastMap$Entry;->access$300(Ljavolution/util/stripped/FastMap$Entry;)Ljava/lang/Object;

    move-result-object v4

    invoke-virtual {v1, v3, v4}, Ljavolution/util/stripped/FastMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_0

    .line 268
    :cond_0
    return-object v1
.end method

.method public setKeyComparator(Ljavolution/util/stripped/FastComparator;)Ljavolution/util/stripped/FastMap;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljavolution/util/stripped/FastComparator",
            "<-TK;>;)",
            "Ljavolution/util/stripped/FastMap",
            "<TK;TV;>;"
        }
    .end annotation

    .prologue
    .line 778
    .local p0, "this":Ljavolution/util/stripped/FastMap;, "Ljavolution/util/stripped/FastMap<TK;TV;>;"
    .local p1, "keyComparator":Ljavolution/util/stripped/FastComparator;, "Ljavolution/util/stripped/FastComparator<-TK;>;"
    iput-object p1, p0, Ljavolution/util/stripped/FastMap;->_keyComparator:Ljavolution/util/stripped/FastComparator;

    .line 779
    sget-object v0, Ljavolution/util/stripped/FastComparator;->DIRECT:Ljavolution/util/stripped/FastComparator;

    if-eq p1, v0, :cond_0

    iget-object v0, p0, Ljavolution/util/stripped/FastMap;->_keyComparator:Ljavolution/util/stripped/FastComparator;

    sget-object v1, Ljavolution/util/stripped/FastComparator;->DEFAULT:Ljavolution/util/stripped/FastComparator;

    if-ne v0, v1, :cond_1

    sget-boolean v0, Ljavolution/util/stripped/FastComparator;->_Rehash:Z

    if-nez v0, :cond_1

    :cond_0
    const/4 v0, 0x1

    :goto_0
    iput-boolean v0, p0, Ljavolution/util/stripped/FastMap;->_isDirectKeyComparator:Z

    .line 780
    return-object p0

    .line 779
    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public setShared(Z)Ljavolution/util/stripped/FastMap;
    .locals 0
    .param p1, "isShared"    # Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(Z)",
            "Ljavolution/util/stripped/FastMap",
            "<TK;TV;>;"
        }
    .end annotation

    .prologue
    .line 754
    .local p0, "this":Ljavolution/util/stripped/FastMap;, "Ljavolution/util/stripped/FastMap<TK;TV;>;"
    iput-boolean p1, p0, Ljavolution/util/stripped/FastMap;->_isShared:Z

    .line 755
    return-object p0
.end method

.method public setValueComparator(Ljavolution/util/stripped/FastComparator;)Ljavolution/util/stripped/FastMap;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljavolution/util/stripped/FastComparator",
            "<-TV;>;)",
            "Ljavolution/util/stripped/FastMap",
            "<TK;TV;>;"
        }
    .end annotation

    .prologue
    .line 801
    .local p0, "this":Ljavolution/util/stripped/FastMap;, "Ljavolution/util/stripped/FastMap<TK;TV;>;"
    .local p1, "valueComparator":Ljavolution/util/stripped/FastComparator;, "Ljavolution/util/stripped/FastComparator<-TV;>;"
    iput-object p1, p0, Ljavolution/util/stripped/FastMap;->_valueComparator:Ljavolution/util/stripped/FastComparator;

    .line 802
    return-object p0
.end method

.method public shared()Ljavolution/util/stripped/FastMap;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljavolution/util/stripped/FastMap",
            "<TK;TV;>;"
        }
    .end annotation

    .prologue
    .line 746
    .local p0, "this":Ljavolution/util/stripped/FastMap;, "Ljavolution/util/stripped/FastMap<TK;TV;>;"
    const/4 v0, 0x1

    iput-boolean v0, p0, Ljavolution/util/stripped/FastMap;->_isShared:Z

    .line 747
    return-object p0
.end method

.method public final size()I
    .locals 4

    .prologue
    .line 300
    .local p0, "this":Ljavolution/util/stripped/FastMap;, "Ljavolution/util/stripped/FastMap<TK;TV;>;"
    iget-boolean v3, p0, Ljavolution/util/stripped/FastMap;->_useSubMaps:Z

    if-nez v3, :cond_1

    .line 301
    iget v2, p0, Ljavolution/util/stripped/FastMap;->_entryCount:I

    .line 307
    :cond_0
    return v2

    .line 303
    :cond_1
    const/4 v2, 0x0

    .line 304
    .local v2, "sum":I
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    iget-object v3, p0, Ljavolution/util/stripped/FastMap;->_subMaps:[Ljavolution/util/stripped/FastMap;

    array-length v3, v3

    if-ge v0, v3, :cond_0

    .line 305
    iget-object v3, p0, Ljavolution/util/stripped/FastMap;->_subMaps:[Ljavolution/util/stripped/FastMap;

    add-int/lit8 v1, v0, 0x1

    .end local v0    # "i":I
    .local v1, "i":I
    aget-object v3, v3, v0

    invoke-virtual {v3}, Ljavolution/util/stripped/FastMap;->size()I

    move-result v3

    add-int/2addr v2, v3

    move v0, v1

    .end local v1    # "i":I
    .restart local v0    # "i":I
    goto :goto_0
.end method

.method public final tail()Ljavolution/util/stripped/FastMap$Entry;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljavolution/util/stripped/FastMap$Entry",
            "<TK;TV;>;"
        }
    .end annotation

    .prologue
    .line 288
    .local p0, "this":Ljavolution/util/stripped/FastMap;, "Ljavolution/util/stripped/FastMap<TK;TV;>;"
    iget-object v0, p0, Ljavolution/util/stripped/FastMap;->_tail:Ljavolution/util/stripped/FastMap$Entry;

    return-object v0
.end method

.method public final unmodifiable()Ljava/util/Map;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map",
            "<TK;TV;>;"
        }
    .end annotation

    .prologue
    .line 1372
    .local p0, "this":Ljavolution/util/stripped/FastMap;, "Ljavolution/util/stripped/FastMap<TK;TV;>;"
    iget-object v0, p0, Ljavolution/util/stripped/FastMap;->_unmodifiable:Ljava/util/Map;

    if-nez v0, :cond_0

    .line 1373
    new-instance v0, Ljavolution/util/stripped/FastMap$Unmodifiable;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Ljavolution/util/stripped/FastMap$Unmodifiable;-><init>(Ljavolution/util/stripped/FastMap;Ljavolution/util/stripped/FastMap$1;)V

    iput-object v0, p0, Ljavolution/util/stripped/FastMap;->_unmodifiable:Ljava/util/Map;

    .line 1375
    :cond_0
    iget-object v0, p0, Ljavolution/util/stripped/FastMap;->_unmodifiable:Ljava/util/Map;

    return-object v0
.end method

.method public final values()Ljava/util/Collection;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Collection",
            "<TV;>;"
        }
    .end annotation

    .prologue
    .line 1034
    .local p0, "this":Ljavolution/util/stripped/FastMap;, "Ljavolution/util/stripped/FastMap<TK;TV;>;"
    iget-object v0, p0, Ljavolution/util/stripped/FastMap;->_values:Ljavolution/util/stripped/FastMap$Values;

    if-nez v0, :cond_0

    .line 1035
    new-instance v0, Ljavolution/util/stripped/FastMap$Values;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Ljavolution/util/stripped/FastMap$Values;-><init>(Ljavolution/util/stripped/FastMap;Ljavolution/util/stripped/FastMap$1;)V

    iput-object v0, p0, Ljavolution/util/stripped/FastMap;->_values:Ljavolution/util/stripped/FastMap$Values;

    .line 1037
    :cond_0
    iget-object v0, p0, Ljavolution/util/stripped/FastMap;->_values:Ljavolution/util/stripped/FastMap$Values;

    return-object v0
.end method
