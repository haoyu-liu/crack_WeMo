.class Ljavolution/util/stripped/FastCollection$Unmodifiable;
.super Ljavolution/util/stripped/FastCollection;
.source "FastCollection.java"

# interfaces
.implements Ljava/util/List;
.implements Ljava/util/Set;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ljavolution/util/stripped/FastCollection;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "Unmodifiable"
.end annotation


# instance fields
.field final synthetic this$0:Ljavolution/util/stripped/FastCollection;


# direct methods
.method constructor <init>(Ljavolution/util/stripped/FastCollection;)V
    .locals 0

    .prologue
    .line 469
    .local p0, "this":Ljavolution/util/stripped/FastCollection$Unmodifiable;, "Ljavolution/util/stripped/FastCollection<TE;>.Unmodifiable;"
    iput-object p1, p0, Ljavolution/util/stripped/FastCollection$Unmodifiable;->this$0:Ljavolution/util/stripped/FastCollection;

    invoke-direct {p0}, Ljavolution/util/stripped/FastCollection;-><init>()V

    return-void
.end method


# virtual methods
.method public add(ILjava/lang/Object;)V
    .locals 2
    .param p1, "index"    # I
    .param p2, "element"    # Ljava/lang/Object;

    .prologue
    .line 532
    .local p0, "this":Ljavolution/util/stripped/FastCollection$Unmodifiable;, "Ljavolution/util/stripped/FastCollection<TE;>.Unmodifiable;"
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    const-string v1, "Unmodifiable"

    invoke-direct {v0, v1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public add(Ljava/lang/Object;)Z
    .locals 2
    .param p1, "obj"    # Ljava/lang/Object;

    .prologue
    .line 508
    .local p0, "this":Ljavolution/util/stripped/FastCollection$Unmodifiable;, "Ljavolution/util/stripped/FastCollection<TE;>.Unmodifiable;"
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    const-string v1, "Unmodifiable"

    invoke-direct {v0, v1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public addAll(ILjava/util/Collection;)Z
    .locals 2
    .param p1, "index"    # I
    .param p2, "c"    # Ljava/util/Collection;

    .prologue
    .line 520
    .local p0, "this":Ljavolution/util/stripped/FastCollection$Unmodifiable;, "Ljavolution/util/stripped/FastCollection<TE;>.Unmodifiable;"
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    const-string v1, "Unmodifiable"

    invoke-direct {v0, v1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public contains(Ljava/lang/Object;)Z
    .locals 1
    .param p1, "value"    # Ljava/lang/Object;

    .prologue
    .line 493
    .local p0, "this":Ljavolution/util/stripped/FastCollection$Unmodifiable;, "Ljavolution/util/stripped/FastCollection<TE;>.Unmodifiable;"
    iget-object v0, p0, Ljavolution/util/stripped/FastCollection$Unmodifiable;->this$0:Ljavolution/util/stripped/FastCollection;

    invoke-virtual {v0, p1}, Ljavolution/util/stripped/FastCollection;->contains(Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method public containsAll(Ljava/util/Collection;)Z
    .locals 1
    .param p1, "c"    # Ljava/util/Collection;

    .prologue
    .line 498
    .local p0, "this":Ljavolution/util/stripped/FastCollection$Unmodifiable;, "Ljavolution/util/stripped/FastCollection<TE;>.Unmodifiable;"
    iget-object v0, p0, Ljavolution/util/stripped/FastCollection$Unmodifiable;->this$0:Ljavolution/util/stripped/FastCollection;

    invoke-virtual {v0, p1}, Ljavolution/util/stripped/FastCollection;->containsAll(Ljava/util/Collection;)Z

    move-result v0

    return v0
.end method

.method public delete(Ljavolution/util/stripped/FastCollection$Record;)V
    .locals 2
    .param p1, "node"    # Ljavolution/util/stripped/FastCollection$Record;

    .prologue
    .line 513
    .local p0, "this":Ljavolution/util/stripped/FastCollection$Unmodifiable;, "Ljavolution/util/stripped/FastCollection<TE;>.Unmodifiable;"
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    const-string v1, "Unmodifiable"

    invoke-direct {v0, v1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public get(I)Ljava/lang/Object;
    .locals 1
    .param p1, "index"    # I

    .prologue
    .line 524
    .local p0, "this":Ljavolution/util/stripped/FastCollection$Unmodifiable;, "Ljavolution/util/stripped/FastCollection<TE;>.Unmodifiable;"
    iget-object v0, p0, Ljavolution/util/stripped/FastCollection$Unmodifiable;->this$0:Ljavolution/util/stripped/FastCollection;

    check-cast v0, Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public getValueComparator()Ljavolution/util/stripped/FastComparator;
    .locals 1

    .prologue
    .line 503
    .local p0, "this":Ljavolution/util/stripped/FastCollection$Unmodifiable;, "Ljavolution/util/stripped/FastCollection<TE;>.Unmodifiable;"
    iget-object v0, p0, Ljavolution/util/stripped/FastCollection$Unmodifiable;->this$0:Ljavolution/util/stripped/FastCollection;

    invoke-virtual {v0}, Ljavolution/util/stripped/FastCollection;->getValueComparator()Ljavolution/util/stripped/FastComparator;

    move-result-object v0

    return-object v0
.end method

.method public head()Ljavolution/util/stripped/FastCollection$Record;
    .locals 1

    .prologue
    .line 478
    .local p0, "this":Ljavolution/util/stripped/FastCollection$Unmodifiable;, "Ljavolution/util/stripped/FastCollection<TE;>.Unmodifiable;"
    iget-object v0, p0, Ljavolution/util/stripped/FastCollection$Unmodifiable;->this$0:Ljavolution/util/stripped/FastCollection;

    invoke-virtual {v0}, Ljavolution/util/stripped/FastCollection;->head()Ljavolution/util/stripped/FastCollection$Record;

    move-result-object v0

    return-object v0
.end method

.method public indexOf(Ljava/lang/Object;)I
    .locals 1
    .param p1, "o"    # Ljava/lang/Object;

    .prologue
    .line 540
    .local p0, "this":Ljavolution/util/stripped/FastCollection$Unmodifiable;, "Ljavolution/util/stripped/FastCollection<TE;>.Unmodifiable;"
    iget-object v0, p0, Ljavolution/util/stripped/FastCollection$Unmodifiable;->this$0:Ljavolution/util/stripped/FastCollection;

    check-cast v0, Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->indexOf(Ljava/lang/Object;)I

    move-result v0

    return v0
.end method

.method public lastIndexOf(Ljava/lang/Object;)I
    .locals 1
    .param p1, "o"    # Ljava/lang/Object;

    .prologue
    .line 544
    .local p0, "this":Ljavolution/util/stripped/FastCollection$Unmodifiable;, "Ljavolution/util/stripped/FastCollection<TE;>.Unmodifiable;"
    iget-object v0, p0, Ljavolution/util/stripped/FastCollection$Unmodifiable;->this$0:Ljavolution/util/stripped/FastCollection;

    check-cast v0, Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->lastIndexOf(Ljava/lang/Object;)I

    move-result v0

    return v0
.end method

.method public listIterator()Ljava/util/ListIterator;
    .locals 2

    .prologue
    .line 548
    .local p0, "this":Ljavolution/util/stripped/FastCollection$Unmodifiable;, "Ljavolution/util/stripped/FastCollection<TE;>.Unmodifiable;"
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    const-string v1, "List iterator not supported for unmodifiable collection"

    invoke-direct {v0, v1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public listIterator(I)Ljava/util/ListIterator;
    .locals 2
    .param p1, "index"    # I

    .prologue
    .line 553
    .local p0, "this":Ljavolution/util/stripped/FastCollection$Unmodifiable;, "Ljavolution/util/stripped/FastCollection<TE;>.Unmodifiable;"
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    const-string v1, "List iterator not supported for unmodifiable collection"

    invoke-direct {v0, v1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public remove(I)Ljava/lang/Object;
    .locals 2
    .param p1, "index"    # I

    .prologue
    .line 536
    .local p0, "this":Ljavolution/util/stripped/FastCollection$Unmodifiable;, "Ljavolution/util/stripped/FastCollection<TE;>.Unmodifiable;"
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    const-string v1, "Unmodifiable"

    invoke-direct {v0, v1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public set(ILjava/lang/Object;)Ljava/lang/Object;
    .locals 2
    .param p1, "index"    # I
    .param p2, "element"    # Ljava/lang/Object;

    .prologue
    .line 528
    .local p0, "this":Ljavolution/util/stripped/FastCollection$Unmodifiable;, "Ljavolution/util/stripped/FastCollection<TE;>.Unmodifiable;"
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    const-string v1, "Unmodifiable"

    invoke-direct {v0, v1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public size()I
    .locals 1

    .prologue
    .line 473
    .local p0, "this":Ljavolution/util/stripped/FastCollection$Unmodifiable;, "Ljavolution/util/stripped/FastCollection<TE;>.Unmodifiable;"
    iget-object v0, p0, Ljavolution/util/stripped/FastCollection$Unmodifiable;->this$0:Ljavolution/util/stripped/FastCollection;

    invoke-virtual {v0}, Ljavolution/util/stripped/FastCollection;->size()I

    move-result v0

    return v0
.end method

.method public subList(II)Ljava/util/List;
    .locals 2
    .param p1, "fromIndex"    # I
    .param p2, "toIndex"    # I

    .prologue
    .line 558
    .local p0, "this":Ljavolution/util/stripped/FastCollection$Unmodifiable;, "Ljavolution/util/stripped/FastCollection<TE;>.Unmodifiable;"
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    const-string v1, "Sub-List not supported for unmodifiable collection"

    invoke-direct {v0, v1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public tail()Ljavolution/util/stripped/FastCollection$Record;
    .locals 1

    .prologue
    .line 483
    .local p0, "this":Ljavolution/util/stripped/FastCollection$Unmodifiable;, "Ljavolution/util/stripped/FastCollection<TE;>.Unmodifiable;"
    iget-object v0, p0, Ljavolution/util/stripped/FastCollection$Unmodifiable;->this$0:Ljavolution/util/stripped/FastCollection;

    invoke-virtual {v0}, Ljavolution/util/stripped/FastCollection;->tail()Ljavolution/util/stripped/FastCollection$Record;

    move-result-object v0

    return-object v0
.end method

.method public valueOf(Ljavolution/util/stripped/FastCollection$Record;)Ljava/lang/Object;
    .locals 1
    .param p1, "record"    # Ljavolution/util/stripped/FastCollection$Record;

    .prologue
    .line 488
    .local p0, "this":Ljavolution/util/stripped/FastCollection$Unmodifiable;, "Ljavolution/util/stripped/FastCollection<TE;>.Unmodifiable;"
    iget-object v0, p0, Ljavolution/util/stripped/FastCollection$Unmodifiable;->this$0:Ljavolution/util/stripped/FastCollection;

    invoke-virtual {v0, p1}, Ljavolution/util/stripped/FastCollection;->valueOf(Ljavolution/util/stripped/FastCollection$Record;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method
