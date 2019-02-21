.class Lcom/almworks/sqlite4java/SQLiteProfiler$SQLStat;
.super Ljava/lang/Object;
.source "SQLiteProfiler.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/almworks/sqlite4java/SQLiteProfiler;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "SQLStat"
.end annotation


# instance fields
.field private final mySQL:Ljava/lang/String;

.field private final myStats:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Lcom/almworks/sqlite4java/SQLiteProfiler$Stat;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Ljava/lang/String;)V
    .locals 1
    .param p1, "sql"    # Ljava/lang/String;

    .prologue
    .line 169
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 167
    new-instance v0, Ljava/util/TreeMap;

    invoke-direct {v0}, Ljava/util/TreeMap;-><init>()V

    iput-object v0, p0, Lcom/almworks/sqlite4java/SQLiteProfiler$SQLStat;->myStats:Ljava/util/Map;

    .line 170
    iput-object p1, p0, Lcom/almworks/sqlite4java/SQLiteProfiler$SQLStat;->mySQL:Ljava/lang/String;

    .line 171
    return-void
.end method

.method private addLeftColumn(Ljava/lang/StringBuilder;Ljava/lang/String;I)V
    .locals 3
    .param p1, "b"    # Ljava/lang/StringBuilder;
    .param p2, "name"    # Ljava/lang/String;
    .param p3, "maxPrefix"    # I

    .prologue
    .line 221
    const-string v1, "    "

    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 222
    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 223
    add-int/lit8 v1, p3, 0x4

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->length()I

    move-result v2

    sub-int v0, v1, v2

    .local v0, "add":I
    :goto_0
    if-lez v0, :cond_0

    const/16 v1, 0x20

    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    add-int/lit8 v0, v0, -0x1

    goto :goto_0

    .line 224
    :cond_0
    const-string v1, "   "

    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 225
    return-void
.end method


# virtual methods
.method public getSQL()Ljava/lang/String;
    .locals 1

    .prologue
    .line 174
    iget-object v0, p0, Lcom/almworks/sqlite4java/SQLiteProfiler$SQLStat;->mySQL:Ljava/lang/String;

    return-object v0
.end method

.method public getTotalTime()J
    .locals 6

    .prologue
    .line 187
    const-wide/16 v2, 0x0

    .line 188
    .local v2, "total":J
    iget-object v4, p0, Lcom/almworks/sqlite4java/SQLiteProfiler$SQLStat;->myStats:Ljava/util/Map;

    invoke-interface {v4}, Ljava/util/Map;->values()Ljava/util/Collection;

    move-result-object v4

    invoke-interface {v4}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "i$":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/almworks/sqlite4java/SQLiteProfiler$Stat;

    .line 189
    .local v1, "stat":Lcom/almworks/sqlite4java/SQLiteProfiler$Stat;
    invoke-static {v1}, Lcom/almworks/sqlite4java/SQLiteProfiler$Stat;->access$100(Lcom/almworks/sqlite4java/SQLiteProfiler$Stat;)J

    move-result-wide v4

    add-long/2addr v2, v4

    goto :goto_0

    .line 191
    .end local v1    # "stat":Lcom/almworks/sqlite4java/SQLiteProfiler$Stat;
    :cond_0
    return-wide v2
.end method

.method public printReport(Ljava/io/PrintWriter;)V
    .locals 12
    .param p1, "out"    # Ljava/io/PrintWriter;

    .prologue
    const/16 v11, 0x7c

    const/16 v10, 0x20

    .line 195
    const-string v7, "-----------------------------------------------------------------------------"

    invoke-virtual {p1, v7}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 196
    iget-object v7, p0, Lcom/almworks/sqlite4java/SQLiteProfiler$SQLStat;->mySQL:Ljava/lang/String;

    invoke-virtual {p1, v7}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 197
    const-string v7, "-----------------------------------------------------------------------------"

    invoke-virtual {p1, v7}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 198
    const-string v6, "total time"

    .line 199
    .local v6, "totalPrefix":Ljava/lang/String;
    invoke-virtual {v6}, Ljava/lang/String;->length()I

    move-result v3

    .line 200
    .local v3, "maxPrefix":I
    iget-object v7, p0, Lcom/almworks/sqlite4java/SQLiteProfiler$SQLStat;->myStats:Ljava/util/Map;

    invoke-interface {v7}, Ljava/util/Map;->keySet()Ljava/util/Set;

    move-result-object v7

    invoke-interface {v7}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v2

    .local v2, "i$":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v7

    if-eqz v7, :cond_0

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    .line 201
    .local v4, "s":Ljava/lang/String;
    invoke-virtual {v4}, Ljava/lang/String;->length()I

    move-result v7

    invoke-static {v3, v7}, Ljava/lang/Math;->max(II)I

    move-result v3

    goto :goto_0

    .line 203
    .end local v4    # "s":Ljava/lang/String;
    :cond_0
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 204
    .local v0, "b":Ljava/lang/StringBuilder;
    invoke-direct {p0, v0, v6, v3}, Lcom/almworks/sqlite4java/SQLiteProfiler$SQLStat;->addLeftColumn(Ljava/lang/StringBuilder;Ljava/lang/String;I)V

    .line 205
    invoke-virtual {p0}, Lcom/almworks/sqlite4java/SQLiteProfiler$SQLStat;->getTotalTime()J

    move-result-wide v8

    invoke-static {v8, v9}, Lcom/almworks/sqlite4java/SQLiteProfiler;->access$200(J)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v0, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 206
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {p1, v7}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 207
    iget-object v7, p0, Lcom/almworks/sqlite4java/SQLiteProfiler$SQLStat;->myStats:Ljava/util/Map;

    invoke-interface {v7}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v7

    invoke-interface {v7}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_1
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v7

    if-eqz v7, :cond_1

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/Map$Entry;

    .line 208
    .local v1, "e":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Lcom/almworks/sqlite4java/SQLiteProfiler$Stat;>;"
    const/4 v7, 0x0

    invoke-virtual {v0, v7}, Ljava/lang/StringBuilder;->setLength(I)V

    .line 209
    invoke-interface {v1}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Ljava/lang/String;

    invoke-direct {p0, v0, v7, v3}, Lcom/almworks/sqlite4java/SQLiteProfiler$SQLStat;->addLeftColumn(Ljava/lang/StringBuilder;Ljava/lang/String;I)V

    .line 210
    invoke-interface {v1}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/almworks/sqlite4java/SQLiteProfiler$Stat;

    .line 211
    .local v5, "stat":Lcom/almworks/sqlite4java/SQLiteProfiler$Stat;
    const-string v7, "total:"

    invoke-virtual {v0, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v5}, Lcom/almworks/sqlite4java/SQLiteProfiler$Stat;->getTotalNanos()J

    move-result-wide v8

    invoke-static {v8, v9}, Lcom/almworks/sqlite4java/SQLiteProfiler;->access$200(J)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v10}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 212
    const-string v7, "count:"

    invoke-virtual {v0, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v5}, Lcom/almworks/sqlite4java/SQLiteProfiler$Stat;->getTotalCount()I

    move-result v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v10}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 213
    const-string v7, "min|avg|max:"

    invoke-virtual {v0, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v5}, Lcom/almworks/sqlite4java/SQLiteProfiler$Stat;->getMinNanos()J

    move-result-wide v8

    invoke-static {v8, v9}, Lcom/almworks/sqlite4java/SQLiteProfiler;->access$200(J)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v11}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v5}, Lcom/almworks/sqlite4java/SQLiteProfiler$Stat;->getAvgNanos()J

    move-result-wide v8

    invoke-static {v8, v9}, Lcom/almworks/sqlite4java/SQLiteProfiler;->access$200(J)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v11}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v5}, Lcom/almworks/sqlite4java/SQLiteProfiler$Stat;->getMaxNanos()J

    move-result-wide v8

    invoke-static {v8, v9}, Lcom/almworks/sqlite4java/SQLiteProfiler;->access$200(J)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v10}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 214
    const-string v7, "freq:"

    invoke-virtual {v0, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v5}, Lcom/almworks/sqlite4java/SQLiteProfiler$Stat;->getFrequency()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 215
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {p1, v7}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    goto/16 :goto_1

    .line 217
    .end local v1    # "e":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Lcom/almworks/sqlite4java/SQLiteProfiler$Stat;>;"
    .end local v5    # "stat":Lcom/almworks/sqlite4java/SQLiteProfiler$Stat;
    :cond_1
    invoke-virtual {p1}, Ljava/io/PrintWriter;->println()V

    .line 218
    return-void
.end method

.method public report(Ljava/lang/String;JJ)V
    .locals 2
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "nfrom"    # J
    .param p4, "nto"    # J

    .prologue
    .line 178
    iget-object v1, p0, Lcom/almworks/sqlite4java/SQLiteProfiler$SQLStat;->myStats:Ljava/util/Map;

    invoke-interface {v1, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/almworks/sqlite4java/SQLiteProfiler$Stat;

    .line 179
    .local v0, "stat":Lcom/almworks/sqlite4java/SQLiteProfiler$Stat;
    if-nez v0, :cond_0

    .line 180
    new-instance v0, Lcom/almworks/sqlite4java/SQLiteProfiler$Stat;

    .end local v0    # "stat":Lcom/almworks/sqlite4java/SQLiteProfiler$Stat;
    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lcom/almworks/sqlite4java/SQLiteProfiler$Stat;-><init>(Lcom/almworks/sqlite4java/SQLiteProfiler$1;)V

    .line 181
    .restart local v0    # "stat":Lcom/almworks/sqlite4java/SQLiteProfiler$Stat;
    iget-object v1, p0, Lcom/almworks/sqlite4java/SQLiteProfiler$SQLStat;->myStats:Ljava/util/Map;

    invoke-interface {v1, p1, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 183
    :cond_0
    invoke-virtual {v0, p2, p3, p4, p5}, Lcom/almworks/sqlite4java/SQLiteProfiler$Stat;->report(JJ)V

    .line 184
    return-void
.end method
