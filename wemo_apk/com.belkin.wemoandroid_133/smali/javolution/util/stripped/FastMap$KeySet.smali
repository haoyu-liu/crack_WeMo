.class final Ljavolution/util/stripped/FastMap$KeySet;
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
    name = "KeySet"
.end annotation


# instance fields
.field final synthetic this$0:Ljavolution/util/stripped/FastMap;


# direct methods
.method private constructor <init>(Ljavolution/util/stripped/FastMap;)V
    .locals 0

    .prologue
    .line 1273
    .local p0, "this":Ljavolution/util/stripped/FastMap$KeySet;, "Ljavolution/util/stripped/FastMap<TK;TV;>.KeySet;"
    iput-object p1, p0, Ljavolution/util/stripped/FastMap$KeySet;->this$0:Ljavolution/util/stripped/FastMap;

    invoke-direct {p0}, Ljavolution/util/stripped/FastCollection;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Ljavolution/util/stripped/FastMap;Ljavolution/util/stripped/FastMap$1;)V
    .locals 0
    .param p1, "x0"    # Ljavolution/util/stripped/FastMap;
    .param p2, "x1"    # Ljavolution/util/stripped/FastMap$1;

    .prologue
    .line 1273
    .local p0, "this":Ljavolution/util/stripped/FastMap$KeySet;, "Ljavolution/util/stripped/FastMap<TK;TV;>.KeySet;"
    invoke-direct {p0, p1}, Ljavolution/util/stripped/FastMap$KeySet;-><init>(Ljavolution/util/stripped/FastMap;)V

    return-void
.end method


# virtual methods
.method public clear()V
    .locals 1

    .prologue
    .line 1280
    .local p0, "this":Ljavolution/util/stripped/FastMap$KeySet;, "Ljavolution/util/stripped/FastMap<TK;TV;>.KeySet;"
    iget-object v0, p0, Ljavolution/util/stripped/FastMap$KeySet;->this$0:Ljavolution/util/stripped/FastMap;

    invoke-virtual {v0}, Ljavolution/util/stripped/FastMap;->clear()V

    .line 1281
    return-void
.end method

.method public contains(Ljava/lang/Object;)Z
    .locals 1
    .param p1, "obj"    # Ljava/lang/Object;

    .prologue
    .line 1284
    .local p0, "this":Ljavolution/util/stripped/FastMap$KeySet;, "Ljavolution/util/stripped/FastMap<TK;TV;>.KeySet;"
    iget-object v0, p0, Ljavolution/util/stripped/FastMap$KeySet;->this$0:Ljavolution/util/stripped/FastMap;

    invoke-virtual {v0, p1}, Ljavolution/util/stripped/FastMap;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method public delete(Ljavolution/util/stripped/FastCollection$Record;)V
    .locals 2
    .param p1, "record"    # Ljavolution/util/stripped/FastCollection$Record;

    .prologue
    .line 1304
    .local p0, "this":Ljavolution/util/stripped/FastMap$KeySet;, "Ljavolution/util/stripped/FastMap<TK;TV;>.KeySet;"
    iget-object v0, p0, Ljavolution/util/stripped/FastMap$KeySet;->this$0:Ljavolution/util/stripped/FastMap;

    check-cast p1, Ljavolution/util/stripped/FastMap$Entry;

    .end local p1    # "record":Ljavolution/util/stripped/FastCollection$Record;
    invoke-virtual {p1}, Ljavolution/util/stripped/FastMap$Entry;->getKey()Ljava/lang/Object;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljavolution/util/stripped/FastMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 1305
    return-void
.end method

.method public getValueComparator()Ljavolution/util/stripped/FastComparator;
    .locals 1

    .prologue
    .line 1308
    .local p0, "this":Ljavolution/util/stripped/FastMap$KeySet;, "Ljavolution/util/stripped/FastMap<TK;TV;>.KeySet;"
    iget-object v0, p0, Ljavolution/util/stripped/FastMap$KeySet;->this$0:Ljavolution/util/stripped/FastMap;

    invoke-static {v0}, Ljavolution/util/stripped/FastMap;->access$1000(Ljavolution/util/stripped/FastMap;)Ljavolution/util/stripped/FastComparator;

    move-result-object v0

    return-object v0
.end method

.method public head()Ljavolution/util/stripped/FastCollection$Record;
    .locals 1

    .prologue
    .line 1292
    .local p0, "this":Ljavolution/util/stripped/FastMap$KeySet;, "Ljavolution/util/stripped/FastMap<TK;TV;>.KeySet;"
    iget-object v0, p0, Ljavolution/util/stripped/FastMap$KeySet;->this$0:Ljavolution/util/stripped/FastMap;

    invoke-static {v0}, Ljavolution/util/stripped/FastMap;->access$600(Ljavolution/util/stripped/FastMap;)Ljavolution/util/stripped/FastMap$Entry;

    move-result-object v0

    return-object v0
.end method

.method public iterator()Ljava/util/Iterator;
    .locals 1

    .prologue
    .line 1312
    .local p0, "this":Ljavolution/util/stripped/FastMap$KeySet;, "Ljavolution/util/stripped/FastMap<TK;TV;>.KeySet;"
    iget-object v0, p0, Ljavolution/util/stripped/FastMap$KeySet;->this$0:Ljavolution/util/stripped/FastMap;

    invoke-static {v0}, Ljavolution/util/stripped/FastMap$KeyIterator;->valueOf(Ljavolution/util/stripped/FastMap;)Ljavolution/util/stripped/FastMap$KeyIterator;

    move-result-object v0

    return-object v0
.end method

.method public remove(Ljava/lang/Object;)Z
    .locals 1
    .param p1, "obj"    # Ljava/lang/Object;

    .prologue
    .line 1288
    .local p0, "this":Ljavolution/util/stripped/FastMap$KeySet;, "Ljavolution/util/stripped/FastMap<TK;TV;>.KeySet;"
    iget-object v0, p0, Ljavolution/util/stripped/FastMap$KeySet;->this$0:Ljavolution/util/stripped/FastMap;

    invoke-virtual {v0, p1}, Ljavolution/util/stripped/FastMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public size()I
    .locals 1

    .prologue
    .line 1276
    .local p0, "this":Ljavolution/util/stripped/FastMap$KeySet;, "Ljavolution/util/stripped/FastMap<TK;TV;>.KeySet;"
    iget-object v0, p0, Ljavolution/util/stripped/FastMap$KeySet;->this$0:Ljavolution/util/stripped/FastMap;

    invoke-virtual {v0}, Ljavolution/util/stripped/FastMap;->size()I

    move-result v0

    return v0
.end method

.method public tail()Ljavolution/util/stripped/FastCollection$Record;
    .locals 1

    .prologue
    .line 1296
    .local p0, "this":Ljavolution/util/stripped/FastMap$KeySet;, "Ljavolution/util/stripped/FastMap<TK;TV;>.KeySet;"
    iget-object v0, p0, Ljavolution/util/stripped/FastMap$KeySet;->this$0:Ljavolution/util/stripped/FastMap;

    invoke-static {v0}, Ljavolution/util/stripped/FastMap;->access$700(Ljavolution/util/stripped/FastMap;)Ljavolution/util/stripped/FastMap$Entry;

    move-result-object v0

    return-object v0
.end method

.method public valueOf(Ljavolution/util/stripped/FastCollection$Record;)Ljava/lang/Object;
    .locals 1
    .param p1, "record"    # Ljavolution/util/stripped/FastCollection$Record;

    .prologue
    .line 1300
    .local p0, "this":Ljavolution/util/stripped/FastMap$KeySet;, "Ljavolution/util/stripped/FastMap<TK;TV;>.KeySet;"
    check-cast p1, Ljavolution/util/stripped/FastMap$Entry;

    .end local p1    # "record":Ljavolution/util/stripped/FastCollection$Record;
    invoke-static {p1}, Ljavolution/util/stripped/FastMap$Entry;->access$300(Ljavolution/util/stripped/FastMap$Entry;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method
