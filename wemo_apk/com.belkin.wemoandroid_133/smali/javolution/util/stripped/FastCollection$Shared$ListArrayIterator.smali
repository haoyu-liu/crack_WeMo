.class Ljavolution/util/stripped/FastCollection$Shared$ListArrayIterator;
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
    name = "ListArrayIterator"
.end annotation


# instance fields
.field private final _elements:[Ljava/lang/Object;

.field private _index:I

.field private _removed:I

.field final synthetic this$1:Ljavolution/util/stripped/FastCollection$Shared;


# direct methods
.method public constructor <init>(Ljavolution/util/stripped/FastCollection$Shared;[Ljava/lang/Object;)V
    .locals 0
    .param p2, "elements"    # [Ljava/lang/Object;

    .prologue
    .line 639
    .local p0, "this":Ljavolution/util/stripped/FastCollection$Shared$ListArrayIterator;, "Ljavolution/util/stripped/FastCollection<TE;>.Shared.ListArrayIterator;"
    iput-object p1, p0, Ljavolution/util/stripped/FastCollection$Shared$ListArrayIterator;->this$1:Ljavolution/util/stripped/FastCollection$Shared;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 640
    iput-object p2, p0, Ljavolution/util/stripped/FastCollection$Shared$ListArrayIterator;->_elements:[Ljava/lang/Object;

    .line 641
    return-void
.end method


# virtual methods
.method public hasNext()Z
    .locals 2

    .prologue
    .line 644
    .local p0, "this":Ljavolution/util/stripped/FastCollection$Shared$ListArrayIterator;, "Ljavolution/util/stripped/FastCollection<TE;>.Shared.ListArrayIterator;"
    iget v0, p0, Ljavolution/util/stripped/FastCollection$Shared$ListArrayIterator;->_index:I

    iget-object v1, p0, Ljavolution/util/stripped/FastCollection$Shared$ListArrayIterator;->_elements:[Ljava/lang/Object;

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
    .line 648
    .local p0, "this":Ljavolution/util/stripped/FastCollection$Shared$ListArrayIterator;, "Ljavolution/util/stripped/FastCollection<TE;>.Shared.ListArrayIterator;"
    iget-object v0, p0, Ljavolution/util/stripped/FastCollection$Shared$ListArrayIterator;->_elements:[Ljava/lang/Object;

    iget v1, p0, Ljavolution/util/stripped/FastCollection$Shared$ListArrayIterator;->_index:I

    add-int/lit8 v2, v1, 0x1

    iput v2, p0, Ljavolution/util/stripped/FastCollection$Shared$ListArrayIterator;->_index:I

    aget-object v0, v0, v1

    return-object v0
.end method

.method public remove()V
    .locals 5

    .prologue
    .line 652
    .local p0, "this":Ljavolution/util/stripped/FastCollection$Shared$ListArrayIterator;, "Ljavolution/util/stripped/FastCollection<TE;>.Shared.ListArrayIterator;"
    iget v1, p0, Ljavolution/util/stripped/FastCollection$Shared$ListArrayIterator;->_index:I

    if-nez v1, :cond_0

    .line 653
    new-instance v1, Ljava/lang/IllegalStateException;

    invoke-direct {v1}, Ljava/lang/IllegalStateException;-><init>()V

    throw v1

    .line 654
    :cond_0
    iget-object v1, p0, Ljavolution/util/stripped/FastCollection$Shared$ListArrayIterator;->_elements:[Ljava/lang/Object;

    iget v2, p0, Ljavolution/util/stripped/FastCollection$Shared$ListArrayIterator;->_index:I

    add-int/lit8 v2, v2, -0x1

    aget-object v0, v1, v2

    .line 655
    .local v0, "removed":Ljava/lang/Object;
    invoke-static {}, Ljavolution/util/stripped/FastCollection;->access$100()Ljava/lang/Object;

    move-result-object v1

    if-ne v0, v1, :cond_1

    .line 656
    new-instance v1, Ljava/lang/IllegalStateException;

    invoke-direct {v1}, Ljava/lang/IllegalStateException;-><init>()V

    throw v1

    .line 657
    :cond_1
    iget-object v1, p0, Ljavolution/util/stripped/FastCollection$Shared$ListArrayIterator;->_elements:[Ljava/lang/Object;

    iget v2, p0, Ljavolution/util/stripped/FastCollection$Shared$ListArrayIterator;->_index:I

    add-int/lit8 v2, v2, -0x1

    invoke-static {}, Ljavolution/util/stripped/FastCollection;->access$100()Ljava/lang/Object;

    move-result-object v3

    aput-object v3, v1, v2

    .line 658
    iget v1, p0, Ljavolution/util/stripped/FastCollection$Shared$ListArrayIterator;->_removed:I

    add-int/lit8 v1, v1, 0x1

    iput v1, p0, Ljavolution/util/stripped/FastCollection$Shared$ListArrayIterator;->_removed:I

    .line 659
    iget-object v2, p0, Ljavolution/util/stripped/FastCollection$Shared$ListArrayIterator;->this$1:Ljavolution/util/stripped/FastCollection$Shared;

    monitor-enter v2

    .line 660
    :try_start_0
    iget-object v1, p0, Ljavolution/util/stripped/FastCollection$Shared$ListArrayIterator;->this$1:Ljavolution/util/stripped/FastCollection$Shared;

    iget-object v1, v1, Ljavolution/util/stripped/FastCollection$Shared;->this$0:Ljavolution/util/stripped/FastCollection;

    check-cast v1, Ljava/util/List;

    iget v3, p0, Ljavolution/util/stripped/FastCollection$Shared$ListArrayIterator;->_index:I

    iget v4, p0, Ljavolution/util/stripped/FastCollection$Shared$ListArrayIterator;->_removed:I

    sub-int/2addr v3, v4

    invoke-interface {v1, v3}, Ljava/util/List;->remove(I)Ljava/lang/Object;

    .line 661
    monitor-exit v2

    .line 662
    return-void

    .line 661
    :catchall_0
    move-exception v1

    monitor-exit v2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method
