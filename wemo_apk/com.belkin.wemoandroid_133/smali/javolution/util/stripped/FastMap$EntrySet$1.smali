.class Ljavolution/util/stripped/FastMap$EntrySet$1;
.super Ljavolution/util/stripped/FastComparator;
.source "FastMap.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ljavolution/util/stripped/FastMap$EntrySet;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Ljavolution/util/stripped/FastMap$EntrySet;


# direct methods
.method constructor <init>(Ljavolution/util/stripped/FastMap$EntrySet;)V
    .locals 0

    .prologue
    .line 1183
    .local p0, "this":Ljavolution/util/stripped/FastMap$EntrySet$1;, "Ljavolution/util/stripped/FastMap$EntrySet.1;"
    iput-object p1, p0, Ljavolution/util/stripped/FastMap$EntrySet$1;->this$1:Ljavolution/util/stripped/FastMap$EntrySet;

    invoke-direct {p0}, Ljavolution/util/stripped/FastComparator;-><init>()V

    return-void
.end method


# virtual methods
.method public areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z
    .locals 7
    .param p1, "o1"    # Ljava/lang/Object;
    .param p2, "o2"    # Ljava/lang/Object;

    .prologue
    .local p0, "this":Ljavolution/util/stripped/FastMap$EntrySet$1;, "Ljavolution/util/stripped/FastMap$EntrySet.1;"
    const/4 v2, 0x1

    const/4 v3, 0x0

    .line 1186
    instance-of v4, p1, Ljava/util/Map$Entry;

    if-eqz v4, :cond_2

    instance-of v4, p2, Ljava/util/Map$Entry;

    if-eqz v4, :cond_2

    move-object v0, p1

    .line 1187
    check-cast v0, Ljava/util/Map$Entry;

    .local v0, "e1":Ljava/util/Map$Entry;
    move-object v1, p2

    .line 1188
    check-cast v1, Ljava/util/Map$Entry;

    .line 1189
    .local v1, "e2":Ljava/util/Map$Entry;
    iget-object v4, p0, Ljavolution/util/stripped/FastMap$EntrySet$1;->this$1:Ljavolution/util/stripped/FastMap$EntrySet;

    iget-object v4, v4, Ljavolution/util/stripped/FastMap$EntrySet;->this$0:Ljavolution/util/stripped/FastMap;

    invoke-static {v4}, Ljavolution/util/stripped/FastMap;->access$1000(Ljavolution/util/stripped/FastMap;)Ljavolution/util/stripped/FastComparator;

    move-result-object v4

    invoke-interface {v0}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v5

    invoke-interface {v1}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v6

    invoke-virtual {v4, v5, v6}, Ljavolution/util/stripped/FastComparator;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_1

    iget-object v4, p0, Ljavolution/util/stripped/FastMap$EntrySet$1;->this$1:Ljavolution/util/stripped/FastMap$EntrySet;

    iget-object v4, v4, Ljavolution/util/stripped/FastMap$EntrySet;->this$0:Ljavolution/util/stripped/FastMap;

    invoke-static {v4}, Ljavolution/util/stripped/FastMap;->access$800(Ljavolution/util/stripped/FastMap;)Ljavolution/util/stripped/FastComparator;

    move-result-object v4

    invoke-interface {v0}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v5

    invoke-interface {v1}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v6

    invoke-virtual {v4, v5, v6}, Ljavolution/util/stripped/FastComparator;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_1

    .line 1191
    .end local v0    # "e1":Ljava/util/Map$Entry;
    .end local v1    # "e2":Ljava/util/Map$Entry;
    :cond_0
    :goto_0
    return v2

    .restart local v0    # "e1":Ljava/util/Map$Entry;
    .restart local v1    # "e2":Ljava/util/Map$Entry;
    :cond_1
    move v2, v3

    .line 1189
    goto :goto_0

    .line 1191
    .end local v0    # "e1":Ljava/util/Map$Entry;
    .end local v1    # "e2":Ljava/util/Map$Entry;
    :cond_2
    if-nez p1, :cond_3

    if-eqz p2, :cond_0

    :cond_3
    move v2, v3

    goto :goto_0
.end method

.method public compare(Ljava/lang/Object;Ljava/lang/Object;)I
    .locals 1
    .param p1, "o1"    # Ljava/lang/Object;
    .param p2, "o2"    # Ljava/lang/Object;

    .prologue
    .line 1195
    .local p0, "this":Ljavolution/util/stripped/FastMap$EntrySet$1;, "Ljavolution/util/stripped/FastMap$EntrySet.1;"
    iget-object v0, p0, Ljavolution/util/stripped/FastMap$EntrySet$1;->this$1:Ljavolution/util/stripped/FastMap$EntrySet;

    iget-object v0, v0, Ljavolution/util/stripped/FastMap$EntrySet;->this$0:Ljavolution/util/stripped/FastMap;

    invoke-static {v0}, Ljavolution/util/stripped/FastMap;->access$1000(Ljavolution/util/stripped/FastMap;)Ljavolution/util/stripped/FastComparator;

    move-result-object v0

    invoke-virtual {v0, p1, p2}, Ljavolution/util/stripped/FastComparator;->compare(Ljava/lang/Object;Ljava/lang/Object;)I

    move-result v0

    return v0
.end method

.method public hashCodeOf(Ljava/lang/Object;)I
    .locals 4
    .param p1, "obj"    # Ljava/lang/Object;

    .prologue
    .line 1199
    .local p0, "this":Ljavolution/util/stripped/FastMap$EntrySet$1;, "Ljavolution/util/stripped/FastMap$EntrySet.1;"
    move-object v0, p1

    check-cast v0, Ljava/util/Map$Entry;

    .line 1200
    .local v0, "entry":Ljava/util/Map$Entry;
    iget-object v1, p0, Ljavolution/util/stripped/FastMap$EntrySet$1;->this$1:Ljavolution/util/stripped/FastMap$EntrySet;

    iget-object v1, v1, Ljavolution/util/stripped/FastMap$EntrySet;->this$0:Ljavolution/util/stripped/FastMap;

    invoke-static {v1}, Ljavolution/util/stripped/FastMap;->access$1000(Ljavolution/util/stripped/FastMap;)Ljavolution/util/stripped/FastComparator;

    move-result-object v1

    invoke-interface {v0}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljavolution/util/stripped/FastComparator;->hashCodeOf(Ljava/lang/Object;)I

    move-result v1

    iget-object v2, p0, Ljavolution/util/stripped/FastMap$EntrySet$1;->this$1:Ljavolution/util/stripped/FastMap$EntrySet;

    iget-object v2, v2, Ljavolution/util/stripped/FastMap$EntrySet;->this$0:Ljavolution/util/stripped/FastMap;

    invoke-static {v2}, Ljavolution/util/stripped/FastMap;->access$800(Ljavolution/util/stripped/FastMap;)Ljavolution/util/stripped/FastComparator;

    move-result-object v2

    invoke-interface {v0}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljavolution/util/stripped/FastComparator;->hashCodeOf(Ljava/lang/Object;)I

    move-result v2

    add-int/2addr v1, v2

    return v1
.end method
