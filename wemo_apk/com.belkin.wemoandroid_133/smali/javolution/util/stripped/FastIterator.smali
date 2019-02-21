.class final Ljavolution/util/stripped/FastIterator;
.super Ljava/lang/Object;
.source "FastIterator.java"

# interfaces
.implements Ljava/util/Iterator;


# instance fields
.field private _collection:Ljavolution/util/stripped/FastCollection;

.field private _current:Ljavolution/util/stripped/FastCollection$Record;

.field private _next:Ljavolution/util/stripped/FastCollection$Record;

.field private _tail:Ljavolution/util/stripped/FastCollection$Record;


# direct methods
.method private constructor <init>()V
    .locals 0

    .prologue
    .line 44
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 45
    return-void
.end method

.method public static valueOf(Ljavolution/util/stripped/FastCollection;)Ljavolution/util/stripped/FastIterator;
    .locals 2
    .param p0, "collection"    # Ljavolution/util/stripped/FastCollection;

    .prologue
    .line 37
    new-instance v0, Ljavolution/util/stripped/FastIterator;

    invoke-direct {v0}, Ljavolution/util/stripped/FastIterator;-><init>()V

    .line 38
    .local v0, "iterator":Ljavolution/util/stripped/FastIterator;
    iput-object p0, v0, Ljavolution/util/stripped/FastIterator;->_collection:Ljavolution/util/stripped/FastCollection;

    .line 39
    invoke-virtual {p0}, Ljavolution/util/stripped/FastCollection;->head()Ljavolution/util/stripped/FastCollection$Record;

    move-result-object v1

    invoke-interface {v1}, Ljavolution/util/stripped/FastCollection$Record;->getNext()Ljavolution/util/stripped/FastCollection$Record;

    move-result-object v1

    iput-object v1, v0, Ljavolution/util/stripped/FastIterator;->_next:Ljavolution/util/stripped/FastCollection$Record;

    .line 40
    invoke-virtual {p0}, Ljavolution/util/stripped/FastCollection;->tail()Ljavolution/util/stripped/FastCollection$Record;

    move-result-object v1

    iput-object v1, v0, Ljavolution/util/stripped/FastIterator;->_tail:Ljavolution/util/stripped/FastCollection$Record;

    .line 41
    return-object v0
.end method


# virtual methods
.method public hasNext()Z
    .locals 2

    .prologue
    .line 48
    iget-object v0, p0, Ljavolution/util/stripped/FastIterator;->_next:Ljavolution/util/stripped/FastCollection$Record;

    iget-object v1, p0, Ljavolution/util/stripped/FastIterator;->_tail:Ljavolution/util/stripped/FastCollection$Record;

    if-eq v0, v1, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public next()Ljava/lang/Object;
    .locals 2

    .prologue
    .line 52
    iget-object v0, p0, Ljavolution/util/stripped/FastIterator;->_next:Ljavolution/util/stripped/FastCollection$Record;

    iget-object v1, p0, Ljavolution/util/stripped/FastIterator;->_tail:Ljavolution/util/stripped/FastCollection$Record;

    if-ne v0, v1, :cond_0

    .line 53
    new-instance v0, Ljava/util/NoSuchElementException;

    invoke-direct {v0}, Ljava/util/NoSuchElementException;-><init>()V

    throw v0

    .line 54
    :cond_0
    iget-object v0, p0, Ljavolution/util/stripped/FastIterator;->_next:Ljavolution/util/stripped/FastCollection$Record;

    iput-object v0, p0, Ljavolution/util/stripped/FastIterator;->_current:Ljavolution/util/stripped/FastCollection$Record;

    .line 55
    iget-object v0, p0, Ljavolution/util/stripped/FastIterator;->_next:Ljavolution/util/stripped/FastCollection$Record;

    invoke-interface {v0}, Ljavolution/util/stripped/FastCollection$Record;->getNext()Ljavolution/util/stripped/FastCollection$Record;

    move-result-object v0

    iput-object v0, p0, Ljavolution/util/stripped/FastIterator;->_next:Ljavolution/util/stripped/FastCollection$Record;

    .line 56
    iget-object v0, p0, Ljavolution/util/stripped/FastIterator;->_collection:Ljavolution/util/stripped/FastCollection;

    iget-object v1, p0, Ljavolution/util/stripped/FastIterator;->_current:Ljavolution/util/stripped/FastCollection$Record;

    invoke-virtual {v0, v1}, Ljavolution/util/stripped/FastCollection;->valueOf(Ljavolution/util/stripped/FastCollection$Record;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public remove()V
    .locals 3

    .prologue
    .line 60
    iget-object v1, p0, Ljavolution/util/stripped/FastIterator;->_current:Ljavolution/util/stripped/FastCollection$Record;

    if-eqz v1, :cond_0

    .line 63
    iget-object v1, p0, Ljavolution/util/stripped/FastIterator;->_current:Ljavolution/util/stripped/FastCollection$Record;

    invoke-interface {v1}, Ljavolution/util/stripped/FastCollection$Record;->getPrevious()Ljavolution/util/stripped/FastCollection$Record;

    move-result-object v0

    .line 64
    .local v0, "previous":Ljavolution/util/stripped/FastCollection$Record;
    iget-object v1, p0, Ljavolution/util/stripped/FastIterator;->_collection:Ljavolution/util/stripped/FastCollection;

    iget-object v2, p0, Ljavolution/util/stripped/FastIterator;->_current:Ljavolution/util/stripped/FastCollection$Record;

    invoke-virtual {v1, v2}, Ljavolution/util/stripped/FastCollection;->delete(Ljavolution/util/stripped/FastCollection$Record;)V

    .line 65
    const/4 v1, 0x0

    iput-object v1, p0, Ljavolution/util/stripped/FastIterator;->_current:Ljavolution/util/stripped/FastCollection$Record;

    .line 66
    invoke-interface {v0}, Ljavolution/util/stripped/FastCollection$Record;->getNext()Ljavolution/util/stripped/FastCollection$Record;

    move-result-object v1

    iput-object v1, p0, Ljavolution/util/stripped/FastIterator;->_next:Ljavolution/util/stripped/FastCollection$Record;

    .line 70
    return-void

    .line 68
    .end local v0    # "previous":Ljavolution/util/stripped/FastCollection$Record;
    :cond_0
    new-instance v1, Ljava/lang/IllegalStateException;

    invoke-direct {v1}, Ljava/lang/IllegalStateException;-><init>()V

    throw v1
.end method
