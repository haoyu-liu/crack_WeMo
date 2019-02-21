.class Lcom/almworks/sqlite4java/SQLiteProfiler$1;
.super Ljava/lang/Object;
.source "SQLiteProfiler.java"

# interfaces
.implements Ljava/util/Comparator;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/almworks/sqlite4java/SQLiteProfiler;->printReport(Ljava/io/PrintWriter;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ljava/util/Comparator",
        "<",
        "Lcom/almworks/sqlite4java/SQLiteProfiler$SQLStat;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/almworks/sqlite4java/SQLiteProfiler;


# direct methods
.method constructor <init>(Lcom/almworks/sqlite4java/SQLiteProfiler;)V
    .locals 0

    .prologue
    .line 49
    iput-object p1, p0, Lcom/almworks/sqlite4java/SQLiteProfiler$1;->this$0:Lcom/almworks/sqlite4java/SQLiteProfiler;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public compare(Lcom/almworks/sqlite4java/SQLiteProfiler$SQLStat;Lcom/almworks/sqlite4java/SQLiteProfiler$SQLStat;)I
    .locals 4
    .param p1, "o1"    # Lcom/almworks/sqlite4java/SQLiteProfiler$SQLStat;
    .param p2, "o2"    # Lcom/almworks/sqlite4java/SQLiteProfiler$SQLStat;

    .prologue
    .line 51
    invoke-virtual {p1}, Lcom/almworks/sqlite4java/SQLiteProfiler$SQLStat;->getTotalTime()J

    move-result-wide v0

    invoke-virtual {p2}, Lcom/almworks/sqlite4java/SQLiteProfiler$SQLStat;->getTotalTime()J

    move-result-wide v2

    cmp-long v0, v0, v2

    if-gez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, -0x1

    goto :goto_0
.end method

.method public bridge synthetic compare(Ljava/lang/Object;Ljava/lang/Object;)I
    .locals 1
    .param p1, "x0"    # Ljava/lang/Object;
    .param p2, "x1"    # Ljava/lang/Object;

    .prologue
    .line 49
    check-cast p1, Lcom/almworks/sqlite4java/SQLiteProfiler$SQLStat;

    .end local p1    # "x0":Ljava/lang/Object;
    check-cast p2, Lcom/almworks/sqlite4java/SQLiteProfiler$SQLStat;

    .end local p2    # "x1":Ljava/lang/Object;
    invoke-virtual {p0, p1, p2}, Lcom/almworks/sqlite4java/SQLiteProfiler$1;->compare(Lcom/almworks/sqlite4java/SQLiteProfiler$SQLStat;Lcom/almworks/sqlite4java/SQLiteProfiler$SQLStat;)I

    move-result v0

    return v0
.end method
