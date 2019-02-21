.class public Lcom/almworks/sqlite4java/SQLiteProfiler;
.super Ljava/lang/Object;
.source "SQLiteProfiler.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/almworks/sqlite4java/SQLiteProfiler$Stat;,
        Lcom/almworks/sqlite4java/SQLiteProfiler$SQLStat;
    }
.end annotation


# static fields
.field private static final HEADER:Ljava/lang/String; = "-----------------------------------------------------------------------------"


# instance fields
.field private final myStats:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Lcom/almworks/sqlite4java/SQLiteProfiler$SQLStat;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 38
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 40
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/almworks/sqlite4java/SQLiteProfiler;->myStats:Ljava/util/Map;

    .line 228
    return-void
.end method

.method static synthetic access$200(J)Ljava/lang/String;
    .locals 2
    .param p0, "x0"    # J

    .prologue
    .line 38
    invoke-static {p0, p1}, Lcom/almworks/sqlite4java/SQLiteProfiler;->formatDuration(J)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method private static formatDuration(J)Ljava/lang/String;
    .locals 10
    .param p0, "nanos"    # J

    .prologue
    const-wide v6, 0x412e848000000000L    # 1000000.0

    const/4 v2, 0x1

    const/4 v8, 0x0

    .line 151
    const-wide/32 v0, 0x3b9aca00

    cmp-long v0, p0, v0

    if-lez v0, :cond_0

    .line 152
    sget-object v0, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v1, "%.1fs"

    new-array v2, v2, [Ljava/lang/Object;

    long-to-double v4, p0

    const-wide v6, 0x41cdcd6500000000L    # 1.0E9

    div-double/2addr v4, v6

    invoke-static {v4, v5}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v3

    aput-object v3, v2, v8

    invoke-static {v0, v1, v2}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    .line 160
    :goto_0
    return-object v0

    .line 153
    :cond_0
    const-wide/32 v0, 0x5f5e100

    cmp-long v0, p0, v0

    if-lez v0, :cond_1

    .line 154
    sget-object v0, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v1, "%dms"

    new-array v2, v2, [Ljava/lang/Object;

    const-wide/32 v4, 0xf4240

    div-long v4, p0, v4

    invoke-static {v4, v5}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v3

    aput-object v3, v2, v8

    invoke-static {v0, v1, v2}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    goto :goto_0

    .line 155
    :cond_1
    const-wide/32 v0, 0x989680

    cmp-long v0, p0, v0

    if-lez v0, :cond_2

    .line 156
    sget-object v0, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v1, "%.1fms"

    new-array v2, v2, [Ljava/lang/Object;

    long-to-double v4, p0

    div-double/2addr v4, v6

    invoke-static {v4, v5}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v3

    aput-object v3, v2, v8

    invoke-static {v0, v1, v2}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    goto :goto_0

    .line 157
    :cond_2
    const-wide/32 v0, 0x186a0

    cmp-long v0, p0, v0

    if-lez v0, :cond_3

    .line 158
    sget-object v0, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v1, "%.2fms"

    new-array v2, v2, [Ljava/lang/Object;

    long-to-double v4, p0

    div-double/2addr v4, v6

    invoke-static {v4, v5}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v3

    aput-object v3, v2, v8

    invoke-static {v0, v1, v2}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    goto :goto_0

    .line 160
    :cond_3
    sget-object v0, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v1, "%.2fmks"

    new-array v2, v2, [Ljava/lang/Object;

    long-to-double v4, p0

    const-wide v6, 0x408f400000000000L    # 1000.0

    div-double/2addr v4, v6

    invoke-static {v4, v5}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v3

    aput-object v3, v2, v8

    invoke-static {v0, v1, v2}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    goto :goto_0
.end method

.method private getStat(Ljava/lang/String;)Lcom/almworks/sqlite4java/SQLiteProfiler$SQLStat;
    .locals 2
    .param p1, "sql"    # Ljava/lang/String;

    .prologue
    .line 142
    iget-object v1, p0, Lcom/almworks/sqlite4java/SQLiteProfiler;->myStats:Ljava/util/Map;

    invoke-interface {v1, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/almworks/sqlite4java/SQLiteProfiler$SQLStat;

    .line 143
    .local v0, "stat":Lcom/almworks/sqlite4java/SQLiteProfiler$SQLStat;
    if-nez v0, :cond_0

    .line 144
    new-instance v0, Lcom/almworks/sqlite4java/SQLiteProfiler$SQLStat;

    .end local v0    # "stat":Lcom/almworks/sqlite4java/SQLiteProfiler$SQLStat;
    invoke-direct {v0, p1}, Lcom/almworks/sqlite4java/SQLiteProfiler$SQLStat;-><init>(Ljava/lang/String;)V

    .line 145
    .restart local v0    # "stat":Lcom/almworks/sqlite4java/SQLiteProfiler$SQLStat;
    iget-object v1, p0, Lcom/almworks/sqlite4java/SQLiteProfiler;->myStats:Ljava/util/Map;

    invoke-interface {v1, p1, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 147
    :cond_0
    return-object v0
.end method


# virtual methods
.method public printReport()Ljava/lang/String;
    .locals 2

    .prologue
    .line 65
    new-instance v0, Ljava/io/StringWriter;

    invoke-direct {v0}, Ljava/io/StringWriter;-><init>()V

    .line 66
    .local v0, "sw":Ljava/io/StringWriter;
    new-instance v1, Ljava/io/PrintWriter;

    invoke-direct {v1, v0}, Ljava/io/PrintWriter;-><init>(Ljava/io/Writer;)V

    invoke-virtual {p0, v1}, Lcom/almworks/sqlite4java/SQLiteProfiler;->printReport(Ljava/io/PrintWriter;)V

    .line 67
    invoke-virtual {v0}, Ljava/io/StringWriter;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method public printReport(Ljava/io/PrintWriter;)V
    .locals 4
    .param p1, "out"    # Ljava/io/PrintWriter;

    .prologue
    .line 48
    new-instance v2, Ljava/util/ArrayList;

    iget-object v3, p0, Lcom/almworks/sqlite4java/SQLiteProfiler;->myStats:Ljava/util/Map;

    invoke-interface {v3}, Ljava/util/Map;->values()Ljava/util/Collection;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 49
    .local v2, "stats":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/almworks/sqlite4java/SQLiteProfiler$SQLStat;>;"
    new-instance v3, Lcom/almworks/sqlite4java/SQLiteProfiler$1;

    invoke-direct {v3, p0}, Lcom/almworks/sqlite4java/SQLiteProfiler$1;-><init>(Lcom/almworks/sqlite4java/SQLiteProfiler;)V

    invoke-static {v2, v3}, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V

    .line 54
    invoke-virtual {v2}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "i$":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/almworks/sqlite4java/SQLiteProfiler$SQLStat;

    .line 55
    .local v1, "stat":Lcom/almworks/sqlite4java/SQLiteProfiler$SQLStat;
    invoke-virtual {v1, p1}, Lcom/almworks/sqlite4java/SQLiteProfiler$SQLStat;->printReport(Ljava/io/PrintWriter;)V

    goto :goto_0

    .line 57
    .end local v1    # "stat":Lcom/almworks/sqlite4java/SQLiteProfiler$SQLStat;
    :cond_0
    return-void
.end method

.method public printReport(Ljava/lang/String;)V
    .locals 6
    .param p1, "file"    # Ljava/lang/String;

    .prologue
    .line 76
    const/4 v1, 0x0

    .line 78
    .local v1, "fos":Ljava/io/FileOutputStream;
    :try_start_0
    new-instance v2, Ljava/io/FileOutputStream;

    invoke-direct {v2, p1}, Ljava/io/FileOutputStream;-><init>(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_1
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 79
    .end local v1    # "fos":Ljava/io/FileOutputStream;
    .local v2, "fos":Ljava/io/FileOutputStream;
    :try_start_1
    new-instance v3, Ljava/io/PrintWriter;

    new-instance v4, Ljava/io/OutputStreamWriter;

    invoke-direct {v4, v2}, Ljava/io/OutputStreamWriter;-><init>(Ljava/io/OutputStream;)V

    invoke-direct {v3, v4}, Ljava/io/PrintWriter;-><init>(Ljava/io/Writer;)V

    .line 80
    .local v3, "writer":Ljava/io/PrintWriter;
    invoke-virtual {p0, v3}, Lcom/almworks/sqlite4java/SQLiteProfiler;->printReport(Ljava/io/PrintWriter;)V

    .line 81
    invoke-virtual {v3}, Ljava/io/PrintWriter;->close()V
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_4
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 85
    if-eqz v2, :cond_2

    .line 87
    :try_start_2
    invoke-virtual {v2}, Ljava/io/FileOutputStream;->close()V
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_0

    move-object v1, v2

    .line 93
    .end local v2    # "fos":Ljava/io/FileOutputStream;
    .end local v3    # "writer":Ljava/io/PrintWriter;
    .restart local v1    # "fos":Ljava/io/FileOutputStream;
    :cond_0
    :goto_0
    return-void

    .line 88
    .end local v1    # "fos":Ljava/io/FileOutputStream;
    .restart local v2    # "fos":Ljava/io/FileOutputStream;
    .restart local v3    # "writer":Ljava/io/PrintWriter;
    :catch_0
    move-exception v4

    move-object v1, v2

    .line 90
    .end local v2    # "fos":Ljava/io/FileOutputStream;
    .restart local v1    # "fos":Ljava/io/FileOutputStream;
    goto :goto_0

    .line 82
    .end local v3    # "writer":Ljava/io/PrintWriter;
    :catch_1
    move-exception v0

    .line 83
    .local v0, "e":Ljava/io/IOException;
    :goto_1
    :try_start_3
    invoke-static {p0, v0}, Lcom/almworks/sqlite4java/Internal;->logWarn(Ljava/lang/Object;Ljava/lang/Object;)V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 85
    if-eqz v1, :cond_0

    .line 87
    :try_start_4
    invoke-virtual {v1}, Ljava/io/FileOutputStream;->close()V
    :try_end_4
    .catch Ljava/io/IOException; {:try_start_4 .. :try_end_4} :catch_2

    goto :goto_0

    .line 88
    :catch_2
    move-exception v4

    goto :goto_0

    .line 85
    .end local v0    # "e":Ljava/io/IOException;
    :catchall_0
    move-exception v4

    :goto_2
    if-eqz v1, :cond_1

    .line 87
    :try_start_5
    invoke-virtual {v1}, Ljava/io/FileOutputStream;->close()V
    :try_end_5
    .catch Ljava/io/IOException; {:try_start_5 .. :try_end_5} :catch_3

    .line 90
    :cond_1
    :goto_3
    throw v4

    .line 88
    :catch_3
    move-exception v5

    goto :goto_3

    .line 85
    .end local v1    # "fos":Ljava/io/FileOutputStream;
    .restart local v2    # "fos":Ljava/io/FileOutputStream;
    :catchall_1
    move-exception v4

    move-object v1, v2

    .end local v2    # "fos":Ljava/io/FileOutputStream;
    .restart local v1    # "fos":Ljava/io/FileOutputStream;
    goto :goto_2

    .line 82
    .end local v1    # "fos":Ljava/io/FileOutputStream;
    .restart local v2    # "fos":Ljava/io/FileOutputStream;
    :catch_4
    move-exception v0

    move-object v1, v2

    .end local v2    # "fos":Ljava/io/FileOutputStream;
    .restart local v1    # "fos":Ljava/io/FileOutputStream;
    goto :goto_1

    .end local v1    # "fos":Ljava/io/FileOutputStream;
    .restart local v2    # "fos":Ljava/io/FileOutputStream;
    .restart local v3    # "writer":Ljava/io/PrintWriter;
    :cond_2
    move-object v1, v2

    .end local v2    # "fos":Ljava/io/FileOutputStream;
    .restart local v1    # "fos":Ljava/io/FileOutputStream;
    goto :goto_0
.end method

.method reportExec(Ljava/lang/String;JJI)V
    .locals 6
    .param p1, "sql"    # Ljava/lang/String;
    .param p2, "nfrom"    # J
    .param p4, "nto"    # J
    .param p6, "rc"    # I

    .prologue
    .line 96
    invoke-direct {p0, p1}, Lcom/almworks/sqlite4java/SQLiteProfiler;->getStat(Ljava/lang/String;)Lcom/almworks/sqlite4java/SQLiteProfiler$SQLStat;

    move-result-object v0

    if-nez p6, :cond_0

    const-string v1, "exec"

    :goto_0
    move-wide v2, p2

    move-wide v4, p4

    invoke-virtual/range {v0 .. v5}, Lcom/almworks/sqlite4java/SQLiteProfiler$SQLStat;->report(Ljava/lang/String;JJ)V

    .line 97
    return-void

    .line 96
    :cond_0
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "exec:error("

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ")"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    goto :goto_0
.end method

.method reportLoadInts(ZLjava/lang/String;JJII)V
    .locals 7
    .param p1, "alreadyStepped"    # Z
    .param p2, "sql"    # Ljava/lang/String;
    .param p3, "nfrom"    # J
    .param p5, "nto"    # J
    .param p7, "rc"    # I
    .param p8, "count"    # I

    .prologue
    const/16 v6, 0x64

    .line 116
    invoke-direct {p0, p2}, Lcom/almworks/sqlite4java/SQLiteProfiler;->getStat(Ljava/lang/String;)Lcom/almworks/sqlite4java/SQLiteProfiler$SQLStat;

    move-result-object v0

    .line 117
    .local v0, "stat":Lcom/almworks/sqlite4java/SQLiteProfiler$SQLStat;
    if-eq p7, v6, :cond_1

    const/16 v1, 0x65

    if-eq p7, v1, :cond_1

    .line 118
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "loadInts:error("

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p7}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ")"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    move-wide v2, p3

    move-wide v4, p5

    invoke-virtual/range {v0 .. v5}, Lcom/almworks/sqlite4java/SQLiteProfiler$SQLStat;->report(Ljava/lang/String;JJ)V

    .line 126
    :cond_0
    :goto_0
    return-void

    .line 121
    :cond_1
    const-string v1, "loadInts"

    move-wide v2, p3

    move-wide v4, p5

    invoke-virtual/range {v0 .. v5}, Lcom/almworks/sqlite4java/SQLiteProfiler$SQLStat;->report(Ljava/lang/String;JJ)V

    .line 122
    if-nez p1, :cond_2

    if-ne p7, v6, :cond_0

    .line 123
    :cond_2
    if-eqz p1, :cond_3

    const-string v1, "loadInts:next"

    :goto_1
    move-wide v2, p3

    move-wide v4, p5

    invoke-virtual/range {v0 .. v5}, Lcom/almworks/sqlite4java/SQLiteProfiler$SQLStat;->report(Ljava/lang/String;JJ)V

    goto :goto_0

    :cond_3
    const-string v1, "loadInts:first"

    goto :goto_1
.end method

.method reportLoadLongs(ZLjava/lang/String;JJII)V
    .locals 7
    .param p1, "alreadyStepped"    # Z
    .param p2, "sql"    # Ljava/lang/String;
    .param p3, "nfrom"    # J
    .param p5, "nto"    # J
    .param p7, "rc"    # I
    .param p8, "count"    # I

    .prologue
    const/16 v6, 0x64

    .line 129
    invoke-direct {p0, p2}, Lcom/almworks/sqlite4java/SQLiteProfiler;->getStat(Ljava/lang/String;)Lcom/almworks/sqlite4java/SQLiteProfiler$SQLStat;

    move-result-object v0

    .line 130
    .local v0, "stat":Lcom/almworks/sqlite4java/SQLiteProfiler$SQLStat;
    if-eq p7, v6, :cond_1

    const/16 v1, 0x65

    if-eq p7, v1, :cond_1

    .line 131
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "loadLongs:error("

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p7}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ")"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    move-wide v2, p3

    move-wide v4, p5

    invoke-virtual/range {v0 .. v5}, Lcom/almworks/sqlite4java/SQLiteProfiler$SQLStat;->report(Ljava/lang/String;JJ)V

    .line 139
    :cond_0
    :goto_0
    return-void

    .line 134
    :cond_1
    const-string v1, "loadLongs"

    move-wide v2, p3

    move-wide v4, p5

    invoke-virtual/range {v0 .. v5}, Lcom/almworks/sqlite4java/SQLiteProfiler$SQLStat;->report(Ljava/lang/String;JJ)V

    .line 135
    if-nez p1, :cond_2

    if-ne p7, v6, :cond_0

    .line 136
    :cond_2
    if-eqz p1, :cond_3

    const-string v1, "loadLongs:next"

    :goto_1
    move-wide v2, p3

    move-wide v4, p5

    invoke-virtual/range {v0 .. v5}, Lcom/almworks/sqlite4java/SQLiteProfiler$SQLStat;->report(Ljava/lang/String;JJ)V

    goto :goto_0

    :cond_3
    const-string v1, "loadLongs:first"

    goto :goto_1
.end method

.method reportPrepare(Ljava/lang/String;JJI)V
    .locals 6
    .param p1, "sql"    # Ljava/lang/String;
    .param p2, "nfrom"    # J
    .param p4, "nto"    # J
    .param p6, "rc"    # I

    .prologue
    .line 100
    invoke-direct {p0, p1}, Lcom/almworks/sqlite4java/SQLiteProfiler;->getStat(Ljava/lang/String;)Lcom/almworks/sqlite4java/SQLiteProfiler$SQLStat;

    move-result-object v0

    if-nez p6, :cond_0

    const-string v1, "prepare"

    :goto_0
    move-wide v2, p2

    move-wide v4, p4

    invoke-virtual/range {v0 .. v5}, Lcom/almworks/sqlite4java/SQLiteProfiler$SQLStat;->report(Ljava/lang/String;JJ)V

    .line 101
    return-void

    .line 100
    :cond_0
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "prepare:error("

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ")"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    goto :goto_0
.end method

.method reportStep(ZLjava/lang/String;JJI)V
    .locals 7
    .param p1, "alreadyStepped"    # Z
    .param p2, "sql"    # Ljava/lang/String;
    .param p3, "nfrom"    # J
    .param p5, "nto"    # J
    .param p7, "rc"    # I

    .prologue
    const/16 v6, 0x64

    .line 104
    invoke-direct {p0, p2}, Lcom/almworks/sqlite4java/SQLiteProfiler;->getStat(Ljava/lang/String;)Lcom/almworks/sqlite4java/SQLiteProfiler$SQLStat;

    move-result-object v0

    .line 105
    .local v0, "stat":Lcom/almworks/sqlite4java/SQLiteProfiler$SQLStat;
    if-eq p7, v6, :cond_1

    const/16 v1, 0x65

    if-eq p7, v1, :cond_1

    .line 106
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "step:error("

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p7}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ")"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    move-wide v2, p3

    move-wide v4, p5

    invoke-virtual/range {v0 .. v5}, Lcom/almworks/sqlite4java/SQLiteProfiler$SQLStat;->report(Ljava/lang/String;JJ)V

    .line 113
    :cond_0
    :goto_0
    return-void

    .line 109
    :cond_1
    const-string v1, "step"

    move-wide v2, p3

    move-wide v4, p5

    invoke-virtual/range {v0 .. v5}, Lcom/almworks/sqlite4java/SQLiteProfiler$SQLStat;->report(Ljava/lang/String;JJ)V

    .line 110
    if-nez p1, :cond_2

    if-ne p7, v6, :cond_0

    .line 111
    :cond_2
    if-eqz p1, :cond_3

    const-string v1, "step:next"

    :goto_1
    move-wide v2, p3

    move-wide v4, p5

    invoke-virtual/range {v0 .. v5}, Lcom/almworks/sqlite4java/SQLiteProfiler$SQLStat;->report(Ljava/lang/String;JJ)V

    goto :goto_0

    :cond_3
    const-string v1, "step:first"

    goto :goto_1
.end method
