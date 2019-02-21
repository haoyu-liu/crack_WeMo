.class Ljavolution/util/stripped/FastCollection$Shared$CollectionArrayIterator;
.super Ljava/lang/Object;
.source "FastCollection.java"

# interfaces
.implements Ljava/util/Iterator;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ljavolution/util/stripped/FastCollection$Shared;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "CollectionArrayIterator"
.end annotation


# instance fields
.field private final _elements:[Ljava/lang/Object;

.field private _index:I

.field private _next:Ljava/lang/Object;

.field final synthetic this$1:Ljavolution/util/stripped/FastCollection$Shared;


# direct methods
.method public constructor <init>(Ljavolution/util/stripped/FastCollection$Shared;[Ljava/lang/Object;)V
    .locals 0
    .param p2, "elements"    # [Ljava/lang/Object;

    .prologue
    .line 673
    .local p0, "this":Ljavolution/util/stripped/FastCollection$Shared$CollectionArrayIterator;, "Ljavolution/util/stripped/FastCollection<TE;>.Shared.CollectionArrayIterator;"
    iput-object p1, p0, Ljavolution/util/stripped/FastCollection$Shared$CollectionArrayIterator;->this$1:Ljavolution/util/stripped/FastCollection$Shared;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 674
    iput-object p2, p0, Ljavolution/util/stripped/FastCollection$Shared$CollectionArrayIterator;->_elements:[Ljava/lang/Object;

    .line 675
    return-void
.end method


# virtual methods
.method public hasNext()Z
    .locals 2

    .prologue
    .line 678
    .local p0, "this":Ljavolution/util/stripped/FastCollection$Shared$CollectionArrayIterator;, "Ljavolution/util/stripped/FastCollection<TE;>.Shared.CollectionArrayIterator;"
    iget v0, p0, Ljavolution/util/stripped/FastCollection$Shared$CollectionArrayIterator;->_index:I

    iget-object v1, p0, Ljavolution/util/stripped/FastCollection$Shared$CollectionArrayIterator;->_elements:[Ljava/lang/Object;

    array-length v1, v1

    if-ge v0, v1, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public next()Ljava/lang/Object;
    .locals 3

    .prologue
    .line 682
    .local p0, "this":Ljavolution/util/stripped/FastCollection$Shared$CollectionArrayIterator;, "Ljavolution/util/stripped/FastCollection<TE;>.Shared.CollectionArrayIterator;"
    iget-object v0, p0, Ljavolution/util/stripped/FastCollection$Shared$CollectionArrayIterator;->_elements:[Ljava/lang/Object;

    iget v1, p0, Ljavolution/util/stripped/FastCollection$Shared$CollectionArrayIterator;->_index:I

    add-int/lit8 v2, v1, 0x1

    iput v2, p0, Ljavolution/util/stripped/FastCollection$Shared$CollectionArrayIterator;->_index:I

    aget-object v0, v0, v1

    iput-object v0, p0, Ljavolution/util/stripped/FastCollection$Shared$CollectionArrayIterator;->_next:Ljava/lang/Object;

    return-object v0
.end method

.method public remove()V
    .locals 2

    .prologue
    .line 686
    .local p0, "this":Ljavolution/util/stripped/FastCollection$Shared$CollectionArrayIterator;, "Ljavolution/util/stripped/FastCollection<TE;>.Shared.CollectionArrayIterator;"
    iget-object v0, p0, Ljavolution/util/stripped/FastCollection$Shared$CollectionArrayIterator;->_next:Ljava/lang/Object;

    if-nez v0, :cond_0

    .line 687
    new-instance v0, Ljava/lang/IllegalStateException;

    invoke-direct {v0}, Ljava/lang/IllegalStateException;-><init>()V

    throw v0

    .line 688
    :cond_0
    iget-object v0, p0, Ljavolution/util/stripped/FastCollection$Shared$CollectionArrayIterator;->this$1:Ljavolution/util/stripped/FastCollection$Shared;

    iget-object v1, p0, Ljavolution/util/stripped/FastCollection$Shared$CollectionArrayIterator;->_next:Ljava/lang/Object;

    invoke-virtual {v0, v1}, Ljavolution/util/stripped/FastCollection$Shared;->remove(Ljava/lang/Object;)Z

    .line 689
    const/4 v0, 0x0

    iput-object v0, p0, Ljavolution/util/stripped/FastCollection$Shared$CollectionArrayIterator;->_next:Ljava/lang/Object;

    .line 690
    return-void
.end method
