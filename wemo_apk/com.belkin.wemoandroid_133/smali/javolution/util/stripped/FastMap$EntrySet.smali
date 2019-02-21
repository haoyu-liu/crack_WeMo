.class final Ljavolution/util/stripped/FastMap$EntrySet;
.super Ljavolution/util/stripped/FastCollection;
.source "FastMap.java"

# interfaces
.implements Ljava/util/Set;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ljavolution/util/stripped/FastMap;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x12
    name = "EntrySet"
.end annotation


# instance fields
.field private final _entryComparator:Ljavolution/util/stripped/FastComparator;

.field final synthetic this$0:Ljavolution/util/stripped/FastMap;


# direct methods
.method private constructor <init>(Ljavolution/util/stripped/FastMap;)V
    .locals 1

    .prologue
    .line 1139
    .local p0, "this":Ljavolution/util/stripped/FastMap$EntrySet;, "Ljavolution/util/stripped/FastMap<TK;TV;>.EntrySet;"
    iput-object p1, p0, Ljavolution/util/stripped/FastMap$EntrySet;->this$0:Ljavolution/util/stripped/FastMap;

    invoke-direct {p0}, Ljavolution/util/stripped/FastCollection;-><init>()V

    .line 1183
    new-instance v0, Ljavolution/util/stripped/FastMap$EntrySet$1;

    invoke-direct {v0, p0}, Ljavolution/util/stripped/FastMap$EntrySet$1;-><init>(Ljavolution/util/stripped/FastMap$EntrySet;)V

    iput-object v0, p0, Ljavolution/util/stripped/FastMap$EntrySet;->_entryComparator:Ljavolution/util/stripped/FastComparator;

    return-void
.end method

.method synthetic constructor <init>(Ljavolution/util/stripped/FastMap;Ljavolution/util/stripped/FastMap$1;)V
    .locals 0
    .param p1, "x0"    # Ljavolution/util/stripped/FastMap;
    .param p2, "x1"    # Ljavolution/util/stripped/FastMap$1;

    .prologue
    .line 1139
    .local p0, "this":Ljavolution/util/stripped/FastMap$EntrySet;, "Ljavolution/util/stripped/FastMap<TK;TV;>.EntrySet;"
    invoke-direct {p0, p1}, Ljavolution/util/stripped/FastMap$EntrySet;-><init>(Ljavolution/util/stripped/FastMap;)V

    return-void
.end method


# virtual methods
.method public clear()V
    .locals 1

    .prologue
    .line 1146
    .local p0, "this":Ljavolution/util/stripped/FastMap$EntrySet;, "Ljavolution/util/stripped/FastMap<TK;TV;>.EntrySet;"
    iget-object v0, p0, Ljavolution/util/stripped/FastMap$EntrySet;->this$0:Ljavolution/util/stripped/FastMap;

    invoke-virtual {v0}, Ljavolution/util/stripped/FastMap;->clear()V

    .line 1147
    return-void
.end method

.method public contains(Ljava/lang/Object;)Z
    .locals 5
    .param p1, "obj"    # Ljava/lang/Object;

    .prologue
    .local p0, "this":Ljavolution/util/stripped/FastMap$EntrySet;, "Ljavolution/util/stripped/FastMap<TK;TV;>.EntrySet;"
    const/4 v2, 0x0

    .line 1150
    instance-of v3, p1, Ljava/util/Map$Entry;

    if-eqz v3, :cond_0

    move-object v0, p1

    .line 1151
    check-cast v0, Ljava/util/Map$Entry;

    .line 1152
    .local v0, "thatEntry":Ljava/util/Map$Entry;
    iget-object v3, p0, Ljavolution/util/stripped/FastMap$EntrySet;->this$0:Ljavolution/util/stripped/FastMap;

    invoke-interface {v0}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljavolution/util/stripped/FastMap;->getEntry(Ljava/lang/Object;)Ljavolution/util/stripped/FastMap$Entry;

    move-result-object v1

    .line 1153
    .local v1, "thisEntry":Ljavolution/util/stripped/FastMap$Entry;
    if-nez v1, :cond_1

    .line 1159
    .end local v0    # "thatEntry":Ljava/util/Map$Entry;
    .end local v1    # "thisEntry":Ljavolution/util/stripped/FastMap$Entry;
    :cond_0
    :goto_0
    return v2

    .line 1156
    .restart local v0    # "thatEntry":Ljava/util/Map$Entry;
    .restart local v1    # "thisEntry":Ljavolution/util/stripped/FastMap$Entry;
    :cond_1
    iget-object v2, p0, Ljavolution/util/stripped/FastMap$EntrySet;->this$0:Ljavolution/util/stripped/FastMap;

    invoke-static {v2}, Ljavolution/util/stripped/FastMap;->access$800(Ljavolution/util/stripped/FastMap;)Ljavolution/util/stripped/FastComparator;

    move-result-object v2

    invoke-virtual {v1}, Ljavolution/util/stripped/FastMap$Entry;->getValue()Ljava/lang/Object;

    move-result-object v3

    invoke-interface {v0}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v4

    invoke-virtual {v2, v3, v4}, Ljavolution/util/stripped/FastComparator;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v2

    goto :goto_0
.end method

.method public delete(Ljavolution/util/stripped/FastCollection$Record;)V
    .locals 2
    .param p1, "record"    # Ljavolution/util/stripped/FastCollection$Record;

    .prologue
    .line 1176
    .local p0, "this":Ljavolution/util/stripped/FastMap$EntrySet;, "Ljavolution/util/stripped/FastMap<TK;TV;>.EntrySet;"
    iget-object v0, p0, Ljavolution/util/stripped/FastMap$EntrySet;->this$0:Ljavolution/util/stripped/FastMap;

    check-cast p1, Ljavolution/util/stripped/FastMap$Entry;

    .end local p1    # "record":Ljavolution/util/stripped/FastCollection$Record;
    invoke-virtual {p1}, Ljavolution/util/stripped/FastMap$Entry;->getKey()Ljava/lang/Object;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljavolution/util/stripped/FastMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 1177
    return-void
.end method

.method public getValueComparator()Ljavolution/util/stripped/FastComparator;
    .locals 1

    .prologue
    .line 1180
    .local p0, "this":Ljavolution/util/stripped/FastMap$EntrySet;, "Ljavolution/util/stripped/FastMap<TK;TV;>.EntrySet;"
    iget-object v0, p0, Ljavolution/util/stripped/FastMap$EntrySet;->_entryComparator:Ljavolution/util/stripped/FastComparator;

    return-object v0
.end method

.method public head()Ljavolution/util/stripped/FastCollection$Record;
    .locals 1

    .prologue
    .line 1164
    .local p0, "this":Ljavolution/util/stripped/FastMap$EntrySet;, "Ljavolution/util/stripped/FastMap<TK;TV;>.EntrySet;"
    iget-object v0, p0, Ljavolution/util/stripped/FastMap$EntrySet;->this$0:Ljavolution/util/stripped/FastMap;

    invoke-static {v0}, Ljavolution/util/stripped/FastMap;->access$600(Ljavolution/util/stripped/FastMap;)Ljavolution/util/stripped/FastMap$Entry;

    move-result-object v0

    return-object v0
.end method

.method public iterator()Ljava/util/Iterator;
    .locals 1

    .prologue
    .line 1205
    .local p0, "this":Ljavolution/util/stripped/FastMap$EntrySet;, "Ljavolution/util/stripped/FastMap<TK;TV;>.EntrySet;"
    iget-object v0, p0, Ljavolution/util/stripped/FastMap$EntrySet;->this$0:Ljavolution/util/stripped/FastMap;

    invoke-static {v0}, Ljavolution/util/stripped/FastMap$EntryIterator;->valueOf(Ljavolution/util/stripped/FastMap;)Ljavolution/util/stripped/FastMap$EntryIterator;

    move-result-object v0

    return-object v0
.end method

.method public size()I
    .locals 1

    .prologue
    .line 1142
    .local p0, "this":Ljavolution/util/stripped/FastMap$EntrySet;, "Ljavolution/util/stripped/FastMap<TK;TV;>.EntrySet;"
    iget-object v0, p0, Ljavolution/util/stripped/FastMap$EntrySet;->this$0:Ljavolution/util/stripped/FastMap;

    invoke-virtual {v0}, Ljavolution/util/stripped/FastMap;->size()I

    move-result v0

    return v0
.end method

.method public tail()Ljavolution/util/stripped/FastCollection$Record;
    .locals 1

    .prologue
    .line 1168
    .local p0, "this":Ljavolution/util/stripped/FastMap$EntrySet;, "Ljavolution/util/stripped/FastMap<TK;TV;>.EntrySet;"
    iget-object v0, p0, Ljavolution/util/stripped/FastMap$EntrySet;->this$0:Ljavolution/util/stripped/FastMap;

    invoke-static {v0}, Ljavolution/util/stripped/FastMap;->access$700(Ljavolution/util/stripped/FastMap;)Ljavolution/util/stripped/FastMap$Entry;

    move-result-object v0

    return-object v0
.end method

.method public valueOf(Ljavolution/util/stripped/FastCollection$Record;)Ljava/lang/Object;
    .locals 0
    .param p1, "record"    # Ljavolution/util/stripped/FastCollection$Record;

    .prologue
    .line 1172
    .local p0, "this":Ljavolution/util/stripped/FastMap$EntrySet;, "Ljavolution/util/stripped/FastMap<TK;TV;>.EntrySet;"
    check-cast p1, Ljava/util/Map$Entry;

    .end local p1    # "record":Ljavolution/util/stripped/FastCollection$Record;
    return-object p1
.end method
