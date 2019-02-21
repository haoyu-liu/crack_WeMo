.class public Ljavolution/util/stripped/FastMap$Entry;
.super Ljava/lang/Object;
.source "FastMap.java"

# interfaces
.implements Ljava/util/Map$Entry;
.implements Ljavolution/util/stripped/FastCollection$Record;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ljavolution/util/stripped/FastMap;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Entry"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<K:",
        "Ljava/lang/Object;",
        "V:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;",
        "Ljava/util/Map$Entry",
        "<TK;TV;>;",
        "Ljavolution/util/stripped/FastCollection$Record;"
    }
.end annotation


# static fields
.field public static final NULL:Ljavolution/util/stripped/FastMap$Entry;


# instance fields
.field private _key:Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "TK;"
        }
    .end annotation
.end field

.field private _keyHash:I

.field private _next:Ljavolution/util/stripped/FastMap$Entry;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljavolution/util/stripped/FastMap$Entry",
            "<TK;TV;>;"
        }
    .end annotation
.end field

.field private _previous:Ljavolution/util/stripped/FastMap$Entry;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljavolution/util/stripped/FastMap$Entry",
            "<TK;TV;>;"
        }
    .end annotation
.end field

.field private _value:Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "TV;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 1445
    new-instance v0, Ljavolution/util/stripped/FastMap$Entry;

    invoke-direct {v0}, Ljavolution/util/stripped/FastMap$Entry;-><init>()V

    sput-object v0, Ljavolution/util/stripped/FastMap$Entry;->NULL:Ljavolution/util/stripped/FastMap$Entry;

    return-void
.end method

.method protected constructor <init>()V
    .locals 0

    .prologue
    .line 1470
    .local p0, "this":Ljavolution/util/stripped/FastMap$Entry;, "Ljavolution/util/stripped/FastMap$Entry<TK;TV;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 1471
    return-void
.end method

.method static synthetic access$000(Ljavolution/util/stripped/FastMap$Entry;)Ljavolution/util/stripped/FastMap$Entry;
    .locals 1
    .param p0, "x0"    # Ljavolution/util/stripped/FastMap$Entry;

    .prologue
    .line 1440
    iget-object v0, p0, Ljavolution/util/stripped/FastMap$Entry;->_next:Ljavolution/util/stripped/FastMap$Entry;

    return-object v0
.end method

.method static synthetic access$002(Ljavolution/util/stripped/FastMap$Entry;Ljavolution/util/stripped/FastMap$Entry;)Ljavolution/util/stripped/FastMap$Entry;
    .locals 0
    .param p0, "x0"    # Ljavolution/util/stripped/FastMap$Entry;
    .param p1, "x1"    # Ljavolution/util/stripped/FastMap$Entry;

    .prologue
    .line 1440
    iput-object p1, p0, Ljavolution/util/stripped/FastMap$Entry;->_next:Ljavolution/util/stripped/FastMap$Entry;

    return-object p1
.end method

.method static synthetic access$100(Ljavolution/util/stripped/FastMap$Entry;)Ljavolution/util/stripped/FastMap$Entry;
    .locals 1
    .param p0, "x0"    # Ljavolution/util/stripped/FastMap$Entry;

    .prologue
    .line 1440
    iget-object v0, p0, Ljavolution/util/stripped/FastMap$Entry;->_previous:Ljavolution/util/stripped/FastMap$Entry;

    return-object v0
.end method

.method static synthetic access$102(Ljavolution/util/stripped/FastMap$Entry;Ljavolution/util/stripped/FastMap$Entry;)Ljavolution/util/stripped/FastMap$Entry;
    .locals 0
    .param p0, "x0"    # Ljavolution/util/stripped/FastMap$Entry;
    .param p1, "x1"    # Ljavolution/util/stripped/FastMap$Entry;

    .prologue
    .line 1440
    iput-object p1, p0, Ljavolution/util/stripped/FastMap$Entry;->_previous:Ljavolution/util/stripped/FastMap$Entry;

    return-object p1
.end method

.method static synthetic access$200(Ljavolution/util/stripped/FastMap$Entry;)Ljava/lang/Object;
    .locals 1
    .param p0, "x0"    # Ljavolution/util/stripped/FastMap$Entry;

    .prologue
    .line 1440
    iget-object v0, p0, Ljavolution/util/stripped/FastMap$Entry;->_value:Ljava/lang/Object;

    return-object v0
.end method

.method static synthetic access$202(Ljavolution/util/stripped/FastMap$Entry;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0
    .param p0, "x0"    # Ljavolution/util/stripped/FastMap$Entry;
    .param p1, "x1"    # Ljava/lang/Object;

    .prologue
    .line 1440
    iput-object p1, p0, Ljavolution/util/stripped/FastMap$Entry;->_value:Ljava/lang/Object;

    return-object p1
.end method

.method static synthetic access$300(Ljavolution/util/stripped/FastMap$Entry;)Ljava/lang/Object;
    .locals 1
    .param p0, "x0"    # Ljavolution/util/stripped/FastMap$Entry;

    .prologue
    .line 1440
    iget-object v0, p0, Ljavolution/util/stripped/FastMap$Entry;->_key:Ljava/lang/Object;

    return-object v0
.end method

.method static synthetic access$302(Ljavolution/util/stripped/FastMap$Entry;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0
    .param p0, "x0"    # Ljavolution/util/stripped/FastMap$Entry;
    .param p1, "x1"    # Ljava/lang/Object;

    .prologue
    .line 1440
    iput-object p1, p0, Ljavolution/util/stripped/FastMap$Entry;->_key:Ljava/lang/Object;

    return-object p1
.end method

.method static synthetic access$400(Ljavolution/util/stripped/FastMap$Entry;)I
    .locals 1
    .param p0, "x0"    # Ljavolution/util/stripped/FastMap$Entry;

    .prologue
    .line 1440
    iget v0, p0, Ljavolution/util/stripped/FastMap$Entry;->_keyHash:I

    return v0
.end method

.method static synthetic access$402(Ljavolution/util/stripped/FastMap$Entry;I)I
    .locals 0
    .param p0, "x0"    # Ljavolution/util/stripped/FastMap$Entry;
    .param p1, "x1"    # I

    .prologue
    .line 1440
    iput p1, p0, Ljavolution/util/stripped/FastMap$Entry;->_keyHash:I

    return p1
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .locals 5
    .param p1, "that"    # Ljava/lang/Object;

    .prologue
    .local p0, "this":Ljavolution/util/stripped/FastMap$Entry;, "Ljavolution/util/stripped/FastMap$Entry<TK;TV;>;"
    const/4 v1, 0x0

    .line 1530
    instance-of v2, p1, Ljava/util/Map$Entry;

    if-eqz v2, :cond_0

    move-object v0, p1

    .line 1531
    check-cast v0, Ljava/util/Map$Entry;

    .line 1532
    .local v0, "entry":Ljava/util/Map$Entry;
    sget-object v2, Ljavolution/util/stripped/FastComparator;->DEFAULT:Ljavolution/util/stripped/FastComparator;

    iget-object v3, p0, Ljavolution/util/stripped/FastMap$Entry;->_key:Ljava/lang/Object;

    invoke-interface {v0}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v4

    invoke-virtual {v2, v3, v4}, Ljavolution/util/stripped/FastComparator;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    sget-object v2, Ljavolution/util/stripped/FastComparator;->DEFAULT:Ljavolution/util/stripped/FastComparator;

    iget-object v3, p0, Ljavolution/util/stripped/FastMap$Entry;->_value:Ljava/lang/Object;

    invoke-interface {v0}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v4

    invoke-virtual {v2, v3, v4}, Ljavolution/util/stripped/FastComparator;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    const/4 v1, 0x1

    .line 1534
    .end local v0    # "entry":Ljava/util/Map$Entry;
    :cond_0
    return v1
.end method

.method public final getKey()Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TK;"
        }
    .end annotation

    .prologue
    .line 1497
    .local p0, "this":Ljavolution/util/stripped/FastMap$Entry;, "Ljavolution/util/stripped/FastMap$Entry<TK;TV;>;"
    iget-object v0, p0, Ljavolution/util/stripped/FastMap$Entry;->_key:Ljava/lang/Object;

    return-object v0
.end method

.method public bridge synthetic getNext()Ljavolution/util/stripped/FastCollection$Record;
    .locals 1

    .prologue
    .line 1440
    .local p0, "this":Ljavolution/util/stripped/FastMap$Entry;, "Ljavolution/util/stripped/FastMap$Entry<TK;TV;>;"
    invoke-virtual {p0}, Ljavolution/util/stripped/FastMap$Entry;->getNext()Ljavolution/util/stripped/FastMap$Entry;

    move-result-object v0

    return-object v0
.end method

.method public final getNext()Ljavolution/util/stripped/FastMap$Entry;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljavolution/util/stripped/FastMap$Entry",
            "<TK;TV;>;"
        }
    .end annotation

    .prologue
    .line 1479
    .local p0, "this":Ljavolution/util/stripped/FastMap$Entry;, "Ljavolution/util/stripped/FastMap$Entry<TK;TV;>;"
    iget-object v0, p0, Ljavolution/util/stripped/FastMap$Entry;->_next:Ljavolution/util/stripped/FastMap$Entry;

    return-object v0
.end method

.method public bridge synthetic getPrevious()Ljavolution/util/stripped/FastCollection$Record;
    .locals 1

    .prologue
    .line 1440
    .local p0, "this":Ljavolution/util/stripped/FastMap$Entry;, "Ljavolution/util/stripped/FastMap$Entry<TK;TV;>;"
    invoke-virtual {p0}, Ljavolution/util/stripped/FastMap$Entry;->getPrevious()Ljavolution/util/stripped/FastMap$Entry;

    move-result-object v0

    return-object v0
.end method

.method public final getPrevious()Ljavolution/util/stripped/FastMap$Entry;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljavolution/util/stripped/FastMap$Entry",
            "<TK;TV;>;"
        }
    .end annotation

    .prologue
    .line 1488
    .local p0, "this":Ljavolution/util/stripped/FastMap$Entry;, "Ljavolution/util/stripped/FastMap$Entry<TK;TV;>;"
    iget-object v0, p0, Ljavolution/util/stripped/FastMap$Entry;->_previous:Ljavolution/util/stripped/FastMap$Entry;

    return-object v0
.end method

.method public final getValue()Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TV;"
        }
    .end annotation

    .prologue
    .line 1506
    .local p0, "this":Ljavolution/util/stripped/FastMap$Entry;, "Ljavolution/util/stripped/FastMap$Entry<TK;TV;>;"
    iget-object v0, p0, Ljavolution/util/stripped/FastMap$Entry;->_value:Ljava/lang/Object;

    return-object v0
.end method

.method public hashCode()I
    .locals 3

    .prologue
    .local p0, "this":Ljavolution/util/stripped/FastMap$Entry;, "Ljavolution/util/stripped/FastMap$Entry<TK;TV;>;"
    const/4 v1, 0x0

    .line 1544
    iget-object v0, p0, Ljavolution/util/stripped/FastMap$Entry;->_key:Ljava/lang/Object;

    if-eqz v0, :cond_1

    iget-object v0, p0, Ljavolution/util/stripped/FastMap$Entry;->_key:Ljava/lang/Object;

    invoke-virtual {v0}, Ljava/lang/Object;->hashCode()I

    move-result v0

    :goto_0
    iget-object v2, p0, Ljavolution/util/stripped/FastMap$Entry;->_value:Ljava/lang/Object;

    if-eqz v2, :cond_0

    iget-object v1, p0, Ljavolution/util/stripped/FastMap$Entry;->_value:Ljava/lang/Object;

    invoke-virtual {v1}, Ljava/lang/Object;->hashCode()I

    move-result v1

    :cond_0
    xor-int/2addr v0, v1

    return v0

    :cond_1
    move v0, v1

    goto :goto_0
.end method

.method public final setValue(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TV;)TV;"
        }
    .end annotation

    .prologue
    .line 1516
    .local p0, "this":Ljavolution/util/stripped/FastMap$Entry;, "Ljavolution/util/stripped/FastMap$Entry<TK;TV;>;"
    .local p1, "value":Ljava/lang/Object;, "TV;"
    iget-object v0, p0, Ljavolution/util/stripped/FastMap$Entry;->_value:Ljava/lang/Object;

    .line 1517
    .local v0, "old":Ljava/lang/Object;, "TV;"
    iput-object p1, p0, Ljavolution/util/stripped/FastMap$Entry;->_value:Ljava/lang/Object;

    .line 1518
    return-object v0
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .prologue
    .line 1552
    .local p0, "this":Ljavolution/util/stripped/FastMap$Entry;, "Ljavolution/util/stripped/FastMap$Entry<TK;TV;>;"
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v1, p0, Ljavolution/util/stripped/FastMap$Entry;->_key:Ljava/lang/Object;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Ljavolution/util/stripped/FastMap$Entry;->_value:Ljava/lang/Object;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
