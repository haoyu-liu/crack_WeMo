.class Ljavolution/util/stripped/FastCollection$Shared;
.super Ljava/lang/Object;
.source "FastCollection.java"

# interfaces
.implements Ljava/util/Collection;
.implements Ljava/io/Serializable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ljavolution/util/stripped/FastCollection;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "Shared"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ljavolution/util/stripped/FastCollection$Shared$CollectionArrayIterator;,
        Ljavolution/util/stripped/FastCollection$Shared$ListArrayIterator;
    }
.end annotation


# instance fields
.field final synthetic this$0:Ljavolution/util/stripped/FastCollection;


# direct methods
.method private constructor <init>(Ljavolution/util/stripped/FastCollection;)V
    .locals 0

    .prologue
    .line 567
    .local p0, "this":Ljavolution/util/stripped/FastCollection$Shared;, "Ljavolution/util/stripped/FastCollection<TE;>.Shared;"
    iput-object p1, p0, Ljavolution/util/stripped/FastCollection$Shared;->this$0:Ljavolution/util/stripped/FastCollection;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 665
    return-void
.end method

.method synthetic constructor <init>(Ljavolution/util/stripped/FastCollection;Ljavolution/util/stripped/FastCollection$1;)V
    .locals 0
    .param p1, "x0"    # Ljavolution/util/stripped/FastCollection;
    .param p2, "x1"    # Ljavolution/util/stripped/FastCollection$1;

    .prologue
    .line 567
    .local p0, "this":Ljavolution/util/stripped/FastCollection$Shared;, "Ljavolution/util/stripped/FastCollection<TE;>.Shared;"
    invoke-direct {p0, p1}, Ljavolution/util/stripped/FastCollection$Shared;-><init>(Ljavolution/util/stripped/FastCollection;)V

    return-void
.end method

.method private declared-synchronized writeObject(Ljava/io/ObjectOutputStream;)V
    .locals 1
    .param p1, "s"    # Ljava/io/ObjectOutputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 628
    .local p0, "this":Ljavolution/util/stripped/FastCollection$Shared;, "Ljavolution/util/stripped/FastCollection<TE;>.Shared;"
    monitor-enter p0

    :try_start_0
    invoke-virtual {p1}, Ljava/io/ObjectOutputStream;->defaultWriteObject()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 629
    monitor-exit p0

    return-void

    .line 628
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method


# virtual methods
.method public declared-synchronized add(Ljava/lang/Object;)Z
    .locals 1
    .param p1, "e"    # Ljava/lang/Object;

    .prologue
    .line 596
    .local p0, "this":Ljavolution/util/stripped/FastCollection$Shared;, "Ljavolution/util/stripped/FastCollection<TE;>.Shared;"
    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Ljavolution/util/stripped/FastCollection$Shared;->this$0:Ljavolution/util/stripped/FastCollection;

    invoke-virtual {v0, p1}, Ljavolution/util/stripped/FastCollection;->add(Ljava/lang/Object;)Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result v0

    monitor-exit p0

    return v0

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized addAll(Ljava/util/Collection;)Z
    .locals 1
    .param p1, "c"    # Ljava/util/Collection;

    .prologue
    .line 608
    .local p0, "this":Ljavolution/util/stripped/FastCollection$Shared;, "Ljavolution/util/stripped/FastCollection<TE;>.Shared;"
    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Ljavolution/util/stripped/FastCollection$Shared;->this$0:Ljavolution/util/stripped/FastCollection;

    invoke-virtual {v0, p1}, Ljavolution/util/stripped/FastCollection;->addAll(Ljava/util/Collection;)Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result v0

    monitor-exit p0

    return v0

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized clear()V
    .locals 1

    .prologue
    .line 620
    .local p0, "this":Ljavolution/util/stripped/FastCollection$Shared;, "Ljavolution/util/stripped/FastCollection<TE;>.Shared;"
    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Ljavolution/util/stripped/FastCollection$Shared;->this$0:Ljavolution/util/stripped/FastCollection;

    invoke-virtual {v0}, Ljavolution/util/stripped/FastCollection;->clear()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 621
    monitor-exit p0

    return-void

    .line 620
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized contains(Ljava/lang/Object;)Z
    .locals 1
    .param p1, "o"    # Ljava/lang/Object;

    .prologue
    .line 578
    .local p0, "this":Ljavolution/util/stripped/FastCollection$Shared;, "Ljavolution/util/stripped/FastCollection<TE;>.Shared;"
    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Ljavolution/util/stripped/FastCollection$Shared;->this$0:Ljavolution/util/stripped/FastCollection;

    invoke-virtual {v0, p1}, Ljavolution/util/stripped/FastCollection;->contains(Ljava/lang/Object;)Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result v0

    monitor-exit p0

    return v0

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized containsAll(Ljava/util/Collection;)Z
    .locals 1
    .param p1, "c"    # Ljava/util/Collection;

    .prologue
    .line 604
    .local p0, "this":Ljavolution/util/stripped/FastCollection$Shared;, "Ljavolution/util/stripped/FastCollection<TE;>.Shared;"
    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Ljavolution/util/stripped/FastCollection$Shared;->this$0:Ljavolution/util/stripped/FastCollection;

    invoke-virtual {v0, p1}, Ljavolution/util/stripped/FastCollection;->containsAll(Ljava/util/Collection;)Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result v0

    monitor-exit p0

    return v0

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized isEmpty()Z
    .locals 1

    .prologue
    .line 574
    .local p0, "this":Ljavolution/util/stripped/FastCollection$Shared;, "Ljavolution/util/stripped/FastCollection<TE;>.Shared;"
    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Ljavolution/util/stripped/FastCollection$Shared;->this$0:Ljavolution/util/stripped/FastCollection;

    invoke-virtual {v0}, Ljavolution/util/stripped/FastCollection;->isEmpty()Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result v0

    monitor-exit p0

    return v0

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized iterator()Ljava/util/Iterator;
    .locals 2

    .prologue
    .line 590
    .local p0, "this":Ljavolution/util/stripped/FastCollection$Shared;, "Ljavolution/util/stripped/FastCollection<TE;>.Shared;"
    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Ljavolution/util/stripped/FastCollection$Shared;->this$0:Ljavolution/util/stripped/FastCollection;

    instance-of v0, v0, Ljava/util/List;

    if-eqz v0, :cond_0

    .line 591
    new-instance v0, Ljavolution/util/stripped/FastCollection$Shared$ListArrayIterator;

    iget-object v1, p0, Ljavolution/util/stripped/FastCollection$Shared;->this$0:Ljavolution/util/stripped/FastCollection;

    invoke-virtual {v1}, Ljavolution/util/stripped/FastCollection;->toArray()[Ljava/lang/Object;

    move-result-object v1

    invoke-direct {v0, p0, v1}, Ljavolution/util/stripped/FastCollection$Shared$ListArrayIterator;-><init>(Ljavolution/util/stripped/FastCollection$Shared;[Ljava/lang/Object;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 592
    :goto_0
    monitor-exit p0

    return-object v0

    :cond_0
    :try_start_1
    new-instance v0, Ljavolution/util/stripped/FastCollection$Shared$CollectionArrayIterator;

    iget-object v1, p0, Ljavolution/util/stripped/FastCollection$Shared;->this$0:Ljavolution/util/stripped/FastCollection;

    invoke-virtual {v1}, Ljavolution/util/stripped/FastCollection;->toArray()[Ljava/lang/Object;

    move-result-object v1

    invoke-direct {v0, p0, v1}, Ljavolution/util/stripped/FastCollection$Shared$CollectionArrayIterator;-><init>(Ljavolution/util/stripped/FastCollection$Shared;[Ljava/lang/Object;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    .line 590
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized remove(Ljava/lang/Object;)Z
    .locals 1
    .param p1, "o"    # Ljava/lang/Object;

    .prologue
    .line 600
    .local p0, "this":Ljavolution/util/stripped/FastCollection$Shared;, "Ljavolution/util/stripped/FastCollection<TE;>.Shared;"
    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Ljavolution/util/stripped/FastCollection$Shared;->this$0:Ljavolution/util/stripped/FastCollection;

    invoke-virtual {v0, p1}, Ljavolution/util/stripped/FastCollection;->remove(Ljava/lang/Object;)Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result v0

    monitor-exit p0

    return v0

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized removeAll(Ljava/util/Collection;)Z
    .locals 1
    .param p1, "c"    # Ljava/util/Collection;

    .prologue
    .line 612
    .local p0, "this":Ljavolution/util/stripped/FastCollection$Shared;, "Ljavolution/util/stripped/FastCollection<TE;>.Shared;"
    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Ljavolution/util/stripped/FastCollection$Shared;->this$0:Ljavolution/util/stripped/FastCollection;

    invoke-virtual {v0, p1}, Ljavolution/util/stripped/FastCollection;->removeAll(Ljava/util/Collection;)Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result v0

    monitor-exit p0

    return v0

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized retainAll(Ljava/util/Collection;)Z
    .locals 1
    .param p1, "c"    # Ljava/util/Collection;

    .prologue
    .line 616
    .local p0, "this":Ljavolution/util/stripped/FastCollection$Shared;, "Ljavolution/util/stripped/FastCollection<TE;>.Shared;"
    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Ljavolution/util/stripped/FastCollection$Shared;->this$0:Ljavolution/util/stripped/FastCollection;

    invoke-virtual {v0, p1}, Ljavolution/util/stripped/FastCollection;->retainAll(Ljava/util/Collection;)Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result v0

    monitor-exit p0

    return v0

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized size()I
    .locals 1

    .prologue
    .line 570
    .local p0, "this":Ljavolution/util/stripped/FastCollection$Shared;, "Ljavolution/util/stripped/FastCollection<TE;>.Shared;"
    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Ljavolution/util/stripped/FastCollection$Shared;->this$0:Ljavolution/util/stripped/FastCollection;

    invoke-virtual {v0}, Ljavolution/util/stripped/FastCollection;->size()I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result v0

    monitor-exit p0

    return v0

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized toArray()[Ljava/lang/Object;
    .locals 1

    .prologue
    .line 582
    .local p0, "this":Ljavolution/util/stripped/FastCollection$Shared;, "Ljavolution/util/stripped/FastCollection<TE;>.Shared;"
    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Ljavolution/util/stripped/FastCollection$Shared;->this$0:Ljavolution/util/stripped/FastCollection;

    invoke-virtual {v0}, Ljavolution/util/stripped/FastCollection;->toArray()[Ljava/lang/Object;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result-object v0

    monitor-exit p0

    return-object v0

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized toArray([Ljava/lang/Object;)[Ljava/lang/Object;
    .locals 1
    .param p1, "a"    # [Ljava/lang/Object;

    .prologue
    .line 586
    .local p0, "this":Ljavolution/util/stripped/FastCollection$Shared;, "Ljavolution/util/stripped/FastCollection<TE;>.Shared;"
    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Ljavolution/util/stripped/FastCollection$Shared;->this$0:Ljavolution/util/stripped/FastCollection;

    invoke-virtual {v0, p1}, Ljavolution/util/stripped/FastCollection;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result-object v0

    monitor-exit p0

    return-object v0

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized toString()Ljava/lang/String;
    .locals 1

    .prologue
    .line 624
    .local p0, "this":Ljavolution/util/stripped/FastCollection$Shared;, "Ljavolution/util/stripped/FastCollection<TE;>.Shared;"
    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Ljavolution/util/stripped/FastCollection$Shared;->this$0:Ljavolution/util/stripped/FastCollection;

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result-object v0

    monitor-exit p0

    return-object v0

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method
