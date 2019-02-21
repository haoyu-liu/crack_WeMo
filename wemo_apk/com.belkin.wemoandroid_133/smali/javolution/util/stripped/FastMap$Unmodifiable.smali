.class final Ljavolution/util/stripped/FastMap$Unmodifiable;
.super Ljava/lang/Object;
.source "FastMap.java"

# interfaces
.implements Ljava/util/Map;
.implements Ljava/io/Serializable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ljavolution/util/stripped/FastMap;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x12
    name = "Unmodifiable"
.end annotation


# instance fields
.field final synthetic this$0:Ljavolution/util/stripped/FastMap;


# direct methods
.method private constructor <init>(Ljavolution/util/stripped/FastMap;)V
    .locals 0

    .prologue
    .line 1559
    .local p0, "this":Ljavolution/util/stripped/FastMap$Unmodifiable;, "Ljavolution/util/stripped/FastMap<TK;TV;>.Unmodifiable;"
    iput-object p1, p0, Ljavolution/util/stripped/FastMap$Unmodifiable;->this$0:Ljavolution/util/stripped/FastMap;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Ljavolution/util/stripped/FastMap;Ljavolution/util/stripped/FastMap$1;)V
    .locals 0
    .param p1, "x0"    # Ljavolution/util/stripped/FastMap;
    .param p2, "x1"    # Ljavolution/util/stripped/FastMap$1;

    .prologue
    .line 1559
    .local p0, "this":Ljavolution/util/stripped/FastMap$Unmodifiable;, "Ljavolution/util/stripped/FastMap<TK;TV;>.Unmodifiable;"
    invoke-direct {p0, p1}, Ljavolution/util/stripped/FastMap$Unmodifiable;-><init>(Ljavolution/util/stripped/FastMap;)V

    return-void
.end method


# virtual methods
.method public clear()V
    .locals 2

    .prologue
    .line 1602
    .local p0, "this":Ljavolution/util/stripped/FastMap$Unmodifiable;, "Ljavolution/util/stripped/FastMap<TK;TV;>.Unmodifiable;"
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    const-string v1, "Unmodifiable map"

    invoke-direct {v0, v1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public containsKey(Ljava/lang/Object;)Z
    .locals 1
    .param p1, "key"    # Ljava/lang/Object;

    .prologue
    .line 1578
    .local p0, "this":Ljavolution/util/stripped/FastMap$Unmodifiable;, "Ljavolution/util/stripped/FastMap<TK;TV;>.Unmodifiable;"
    iget-object v0, p0, Ljavolution/util/stripped/FastMap$Unmodifiable;->this$0:Ljavolution/util/stripped/FastMap;

    invoke-virtual {v0, p1}, Ljavolution/util/stripped/FastMap;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method public containsValue(Ljava/lang/Object;)Z
    .locals 1
    .param p1, "value"    # Ljava/lang/Object;

    .prologue
    .line 1582
    .local p0, "this":Ljavolution/util/stripped/FastMap$Unmodifiable;, "Ljavolution/util/stripped/FastMap<TK;TV;>.Unmodifiable;"
    iget-object v0, p0, Ljavolution/util/stripped/FastMap$Unmodifiable;->this$0:Ljavolution/util/stripped/FastMap;

    invoke-virtual {v0, p1}, Ljavolution/util/stripped/FastMap;->containsValue(Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method public entrySet()Ljava/util/Set;
    .locals 2

    .prologue
    .line 1614
    .local p0, "this":Ljavolution/util/stripped/FastMap$Unmodifiable;, "Ljavolution/util/stripped/FastMap<TK;TV;>.Unmodifiable;"
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    const-string v1, "Direct view over unmodifiable map entries is not supported  (to prevent access to Entry.setValue(Object) method). To iterate over unmodifiable map entries, applications may use the keySet() and values() fast collection views in conjonction."

    invoke-direct {v0, v1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public equals(Ljava/lang/Object;)Z
    .locals 1
    .param p1, "obj"    # Ljava/lang/Object;

    .prologue
    .line 1562
    .local p0, "this":Ljavolution/util/stripped/FastMap$Unmodifiable;, "Ljavolution/util/stripped/FastMap<TK;TV;>.Unmodifiable;"
    iget-object v0, p0, Ljavolution/util/stripped/FastMap$Unmodifiable;->this$0:Ljavolution/util/stripped/FastMap;

    invoke-virtual {v0, p1}, Ljavolution/util/stripped/FastMap;->equals(Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method public get(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1
    .param p1, "key"    # Ljava/lang/Object;

    .prologue
    .line 1586
    .local p0, "this":Ljavolution/util/stripped/FastMap$Unmodifiable;, "Ljavolution/util/stripped/FastMap<TK;TV;>.Unmodifiable;"
    iget-object v0, p0, Ljavolution/util/stripped/FastMap$Unmodifiable;->this$0:Ljavolution/util/stripped/FastMap;

    invoke-virtual {v0, p1}, Ljavolution/util/stripped/FastMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public hashCode()I
    .locals 1

    .prologue
    .line 1566
    .local p0, "this":Ljavolution/util/stripped/FastMap$Unmodifiable;, "Ljavolution/util/stripped/FastMap<TK;TV;>.Unmodifiable;"
    iget-object v0, p0, Ljavolution/util/stripped/FastMap$Unmodifiable;->this$0:Ljavolution/util/stripped/FastMap;

    invoke-virtual {v0}, Ljavolution/util/stripped/FastMap;->hashCode()I

    move-result v0

    return v0
.end method

.method public isEmpty()Z
    .locals 1

    .prologue
    .line 1574
    .local p0, "this":Ljavolution/util/stripped/FastMap$Unmodifiable;, "Ljavolution/util/stripped/FastMap<TK;TV;>.Unmodifiable;"
    iget-object v0, p0, Ljavolution/util/stripped/FastMap$Unmodifiable;->this$0:Ljavolution/util/stripped/FastMap;

    invoke-virtual {v0}, Ljavolution/util/stripped/FastMap;->isEmpty()Z

    move-result v0

    return v0
.end method

.method public keySet()Ljava/util/Set;
    .locals 1

    .prologue
    .line 1606
    .local p0, "this":Ljavolution/util/stripped/FastMap$Unmodifiable;, "Ljavolution/util/stripped/FastMap<TK;TV;>.Unmodifiable;"
    iget-object v0, p0, Ljavolution/util/stripped/FastMap$Unmodifiable;->this$0:Ljavolution/util/stripped/FastMap;

    invoke-virtual {v0}, Ljavolution/util/stripped/FastMap;->keySet()Ljava/util/Set;

    move-result-object v0

    check-cast v0, Ljavolution/util/stripped/FastMap$KeySet;

    invoke-virtual {v0}, Ljavolution/util/stripped/FastMap$KeySet;->unmodifiable()Ljava/util/Collection;

    move-result-object v0

    check-cast v0, Ljava/util/Set;

    return-object v0
.end method

.method public put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 2
    .param p1, "key"    # Ljava/lang/Object;
    .param p2, "value"    # Ljava/lang/Object;

    .prologue
    .line 1590
    .local p0, "this":Ljavolution/util/stripped/FastMap$Unmodifiable;, "Ljavolution/util/stripped/FastMap<TK;TV;>.Unmodifiable;"
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    const-string v1, "Unmodifiable map"

    invoke-direct {v0, v1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public putAll(Ljava/util/Map;)V
    .locals 2
    .param p1, "map"    # Ljava/util/Map;

    .prologue
    .line 1598
    .local p0, "this":Ljavolution/util/stripped/FastMap$Unmodifiable;, "Ljavolution/util/stripped/FastMap<TK;TV;>.Unmodifiable;"
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    const-string v1, "Unmodifiable map"

    invoke-direct {v0, v1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public remove(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 2
    .param p1, "key"    # Ljava/lang/Object;

    .prologue
    .line 1594
    .local p0, "this":Ljavolution/util/stripped/FastMap$Unmodifiable;, "Ljavolution/util/stripped/FastMap<TK;TV;>.Unmodifiable;"
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    const-string v1, "Unmodifiable map"

    invoke-direct {v0, v1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public size()I
    .locals 1

    .prologue
    .line 1570
    .local p0, "this":Ljavolution/util/stripped/FastMap$Unmodifiable;, "Ljavolution/util/stripped/FastMap<TK;TV;>.Unmodifiable;"
    iget-object v0, p0, Ljavolution/util/stripped/FastMap$Unmodifiable;->this$0:Ljavolution/util/stripped/FastMap;

    invoke-virtual {v0}, Ljavolution/util/stripped/FastMap;->size()I

    move-result v0

    return v0
.end method

.method public values()Ljava/util/Collection;
    .locals 1

    .prologue
    .line 1610
    .local p0, "this":Ljavolution/util/stripped/FastMap$Unmodifiable;, "Ljavolution/util/stripped/FastMap<TK;TV;>.Unmodifiable;"
    iget-object v0, p0, Ljavolution/util/stripped/FastMap$Unmodifiable;->this$0:Ljavolution/util/stripped/FastMap;

    invoke-virtual {v0}, Ljavolution/util/stripped/FastMap;->values()Ljava/util/Collection;

    move-result-object v0

    check-cast v0, Ljavolution/util/stripped/FastMap$Values;

    invoke-virtual {v0}, Ljavolution/util/stripped/FastMap$Values;->unmodifiable()Ljava/util/Collection;

    move-result-object v0

    return-object v0
.end method
