.class final Ljavolution/util/stripped/FastMap$KeyIterator;
.super Ljava/lang/Object;
.source "FastMap.java"

# interfaces
.implements Ljava/util/Iterator;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ljavolution/util/stripped/FastMap;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "KeyIterator"
.end annotation


# instance fields
.field private _current:Ljavolution/util/stripped/FastMap$Entry;

.field private _map:Ljavolution/util/stripped/FastMap;

.field private _next:Ljavolution/util/stripped/FastMap$Entry;

.field private _tail:Ljavolution/util/stripped/FastMap$Entry;


# direct methods
.method private constructor <init>()V
    .locals 0

    .prologue
    .line 1333
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 1334
    return-void
.end method

.method public static valueOf(Ljavolution/util/stripped/FastMap;)Ljavolution/util/stripped/FastMap$KeyIterator;
    .locals 2
    .param p0, "map"    # Ljavolution/util/stripped/FastMap;

    .prologue
    .line 1326
    new-instance v0, Ljavolution/util/stripped/FastMap$KeyIterator;

    invoke-direct {v0}, Ljavolution/util/stripped/FastMap$KeyIterator;-><init>()V

    .line 1327
    .local v0, "iterator":Ljavolution/util/stripped/FastMap$KeyIterator;
    iput-object p0, v0, Ljavolution/util/stripped/FastMap$KeyIterator;->_map:Ljavolution/util/stripped/FastMap;

    .line 1328
    invoke-static {p0}, Ljavolution/util/stripped/FastMap;->access$600(Ljavolution/util/stripped/FastMap;)Ljavolution/util/stripped/FastMap$Entry;

    move-result-object v1

    invoke-static {v1}, Ljavolution/util/stripped/FastMap$Entry;->access$000(Ljavolution/util/stripped/FastMap$Entry;)Ljavolution/util/stripped/FastMap$Entry;

    move-result-object v1

    iput-object v1, v0, Ljavolution/util/stripped/FastMap$KeyIterator;->_next:Ljavolution/util/stripped/FastMap$Entry;

    .line 1329
    invoke-static {p0}, Ljavolution/util/stripped/FastMap;->access$700(Ljavolution/util/stripped/FastMap;)Ljavolution/util/stripped/FastMap$Entry;

    move-result-object v1

    iput-object v1, v0, Ljavolution/util/stripped/FastMap$KeyIterator;->_tail:Ljavolution/util/stripped/FastMap$Entry;

    .line 1330
    return-object v0
.end method


# virtual methods
.method public hasNext()Z
    .locals 2

    .prologue
    .line 1337
    iget-object v0, p0, Ljavolution/util/stripped/FastMap$KeyIterator;->_next:Ljavolution/util/stripped/FastMap$Entry;

    iget-object v1, p0, Ljavolution/util/stripped/FastMap$KeyIterator;->_tail:Ljavolution/util/stripped/FastMap$Entry;

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
    .line 1341
    iget-object v0, p0, Ljavolution/util/stripped/FastMap$KeyIterator;->_next:Ljavolution/util/stripped/FastMap$Entry;

    iget-object v1, p0, Ljavolution/util/stripped/FastMap$KeyIterator;->_tail:Ljavolution/util/stripped/FastMap$Entry;

    if-ne v0, v1, :cond_0

    .line 1342
    new-instance v0, Ljava/util/NoSuchElementException;

    invoke-direct {v0}, Ljava/util/NoSuchElementException;-><init>()V

    throw v0

    .line 1344
    :cond_0
    iget-object v0, p0, Ljavolution/util/stripped/FastMap$KeyIterator;->_next:Ljavolution/util/stripped/FastMap$Entry;

    iput-object v0, p0, Ljavolution/util/stripped/FastMap$KeyIterator;->_current:Ljavolution/util/stripped/FastMap$Entry;

    .line 1345
    iget-object v0, p0, Ljavolution/util/stripped/FastMap$KeyIterator;->_next:Ljavolution/util/stripped/FastMap$Entry;

    invoke-static {v0}, Ljavolution/util/stripped/FastMap$Entry;->access$000(Ljavolution/util/stripped/FastMap$Entry;)Ljavolution/util/stripped/FastMap$Entry;

    move-result-object v0

    iput-object v0, p0, Ljavolution/util/stripped/FastMap$KeyIterator;->_next:Ljavolution/util/stripped/FastMap$Entry;

    .line 1346
    iget-object v0, p0, Ljavolution/util/stripped/FastMap$KeyIterator;->_current:Ljavolution/util/stripped/FastMap$Entry;

    invoke-static {v0}, Ljavolution/util/stripped/FastMap$Entry;->access$300(Ljavolution/util/stripped/FastMap$Entry;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public remove()V
    .locals 2

    .prologue
    .line 1350
    iget-object v0, p0, Ljavolution/util/stripped/FastMap$KeyIterator;->_current:Ljavolution/util/stripped/FastMap$Entry;

    if-eqz v0, :cond_0

    .line 1351
    iget-object v0, p0, Ljavolution/util/stripped/FastMap$KeyIterator;->_current:Ljavolution/util/stripped/FastMap$Entry;

    invoke-static {v0}, Ljavolution/util/stripped/FastMap$Entry;->access$000(Ljavolution/util/stripped/FastMap$Entry;)Ljavolution/util/stripped/FastMap$Entry;

    move-result-object v0

    iput-object v0, p0, Ljavolution/util/stripped/FastMap$KeyIterator;->_next:Ljavolution/util/stripped/FastMap$Entry;

    .line 1352
    iget-object v0, p0, Ljavolution/util/stripped/FastMap$KeyIterator;->_map:Ljavolution/util/stripped/FastMap;

    iget-object v1, p0, Ljavolution/util/stripped/FastMap$KeyIterator;->_current:Ljavolution/util/stripped/FastMap$Entry;

    invoke-static {v1}, Ljavolution/util/stripped/FastMap$Entry;->access$300(Ljavolution/util/stripped/FastMap$Entry;)Ljava/lang/Object;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljavolution/util/stripped/FastMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 1353
    const/4 v0, 0x0

    iput-object v0, p0, Ljavolution/util/stripped/FastMap$KeyIterator;->_current:Ljavolution/util/stripped/FastMap$Entry;

    .line 1357
    return-void

    .line 1355
    :cond_0
    new-instance v0, Ljava/lang/IllegalStateException;

    invoke-direct {v0}, Ljava/lang/IllegalStateException;-><init>()V

    throw v0
.end method
