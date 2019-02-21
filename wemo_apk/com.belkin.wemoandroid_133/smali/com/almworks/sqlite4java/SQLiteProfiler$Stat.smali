.class Lcom/almworks/sqlite4java/SQLiteProfiler$Stat;
.super Ljava/lang/Object;
.source "SQLiteProfiler.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/almworks/sqlite4java/SQLiteProfiler;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "Stat"
.end annotation


# instance fields
.field private myFirstTime:J

.field private myLastTime:J

.field private myMaxNanos:J

.field private myMinNanos:J

.field private myTotalCount:I

.field private myTotalNanos:J


# direct methods
.method private constructor <init>()V
    .locals 2

    .prologue
    const-wide/16 v0, -0x1

    .line 228
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 231
    iput-wide v0, p0, Lcom/almworks/sqlite4java/SQLiteProfiler$Stat;->myMinNanos:J

    .line 232
    iput-wide v0, p0, Lcom/almworks/sqlite4java/SQLiteProfiler$Stat;->myMaxNanos:J

    return-void
.end method

.method synthetic constructor <init>(Lcom/almworks/sqlite4java/SQLiteProfiler$1;)V
    .locals 0
    .param p1, "x0"    # Lcom/almworks/sqlite4java/SQLiteProfiler$1;

    .prologue
    .line 228
    invoke-direct {p0}, Lcom/almworks/sqlite4java/SQLiteProfiler$Stat;-><init>()V

    return-void
.end method

.method static synthetic access$100(Lcom/almworks/sqlite4java/SQLiteProfiler$Stat;)J
    .locals 2
    .param p0, "x0"    # Lcom/almworks/sqlite4java/SQLiteProfiler$Stat;

    .prologue
    .line 228
    iget-wide v0, p0, Lcom/almworks/sqlite4java/SQLiteProfiler$Stat;->myTotalNanos:J

    return-wide v0
.end method


# virtual methods
.method public getAvgNanos()J
    .locals 4

    .prologue
    .line 263
    iget v0, p0, Lcom/almworks/sqlite4java/SQLiteProfiler$Stat;->myTotalCount:I

    if-lez v0, :cond_0

    iget-wide v0, p0, Lcom/almworks/sqlite4java/SQLiteProfiler$Stat;->myTotalNanos:J

    iget v2, p0, Lcom/almworks/sqlite4java/SQLiteProfiler$Stat;->myTotalCount:I

    int-to-long v2, v2

    div-long/2addr v0, v2

    :goto_0
    return-wide v0

    :cond_0
    const-wide/16 v0, 0x0

    goto :goto_0
.end method

.method public getFrequency()Ljava/lang/String;
    .locals 8

    .prologue
    .line 271
    iget v4, p0, Lcom/almworks/sqlite4java/SQLiteProfiler$Stat;->myTotalCount:I

    const/16 v5, 0xa

    if-ge v4, v5, :cond_0

    const-string v4, "-"

    .line 275
    :goto_0
    return-object v4

    .line 272
    :cond_0
    iget-wide v4, p0, Lcom/almworks/sqlite4java/SQLiteProfiler$Stat;->myLastTime:J

    iget-wide v6, p0, Lcom/almworks/sqlite4java/SQLiteProfiler$Stat;->myFirstTime:J

    sub-long v0, v4, v6

    .line 273
    .local v0, "millis":J
    iget v4, p0, Lcom/almworks/sqlite4java/SQLiteProfiler$Stat;->myTotalCount:I

    int-to-long v4, v4

    div-long v2, v0, v4

    .line 274
    .local v2, "t":J
    const-wide/16 v4, 0x0

    cmp-long v4, v2, v4

    if-nez v4, :cond_1

    const-string v4, "-"

    goto :goto_0

    .line 275
    :cond_1
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "1/"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-wide/32 v6, 0xf4240

    mul-long/2addr v6, v2

    invoke-static {v6, v7}, Lcom/almworks/sqlite4java/SQLiteProfiler;->access$200(J)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    goto :goto_0
.end method

.method public getMaxNanos()J
    .locals 2

    .prologue
    .line 267
    iget-wide v0, p0, Lcom/almworks/sqlite4java/SQLiteProfiler$Stat;->myMaxNanos:J

    return-wide v0
.end method

.method public getMinNanos()J
    .locals 2

    .prologue
    .line 259
    iget-wide v0, p0, Lcom/almworks/sqlite4java/SQLiteProfiler$Stat;->myMinNanos:J

    return-wide v0
.end method

.method public getTotalCount()I
    .locals 1

    .prologue
    .line 255
    iget v0, p0, Lcom/almworks/sqlite4java/SQLiteProfiler$Stat;->myTotalCount:I

    return v0
.end method

.method public getTotalNanos()J
    .locals 2

    .prologue
    .line 251
    iget-wide v0, p0, Lcom/almworks/sqlite4java/SQLiteProfiler$Stat;->myTotalNanos:J

    return-wide v0
.end method

.method public report(JJ)V
    .locals 7
    .param p1, "nfrom"    # J
    .param p3, "nto"    # J

    .prologue
    const-wide/16 v4, 0x0

    .line 237
    sub-long v0, p3, p1

    .line 238
    .local v0, "duration":J
    cmp-long v2, v0, v4

    if-gez v2, :cond_1

    .line 248
    :cond_0
    :goto_0
    return-void

    .line 239
    :cond_1
    iget v2, p0, Lcom/almworks/sqlite4java/SQLiteProfiler$Stat;->myTotalCount:I

    add-int/lit8 v2, v2, 0x1

    iput v2, p0, Lcom/almworks/sqlite4java/SQLiteProfiler$Stat;->myTotalCount:I

    .line 240
    iget-wide v2, p0, Lcom/almworks/sqlite4java/SQLiteProfiler$Stat;->myTotalNanos:J

    add-long/2addr v2, v0

    iput-wide v2, p0, Lcom/almworks/sqlite4java/SQLiteProfiler$Stat;->myTotalNanos:J

    .line 241
    iget-wide v2, p0, Lcom/almworks/sqlite4java/SQLiteProfiler$Stat;->myMinNanos:J

    cmp-long v2, v2, v4

    if-ltz v2, :cond_2

    iget-wide v2, p0, Lcom/almworks/sqlite4java/SQLiteProfiler$Stat;->myMinNanos:J

    cmp-long v2, v0, v2

    if-gez v2, :cond_3

    .line 242
    :cond_2
    iput-wide v0, p0, Lcom/almworks/sqlite4java/SQLiteProfiler$Stat;->myMinNanos:J

    .line 243
    :cond_3
    iget-wide v2, p0, Lcom/almworks/sqlite4java/SQLiteProfiler$Stat;->myMaxNanos:J

    cmp-long v2, v2, v4

    if-ltz v2, :cond_4

    iget-wide v2, p0, Lcom/almworks/sqlite4java/SQLiteProfiler$Stat;->myMaxNanos:J

    cmp-long v2, v0, v2

    if-lez v2, :cond_5

    .line 244
    :cond_4
    iput-wide v0, p0, Lcom/almworks/sqlite4java/SQLiteProfiler$Stat;->myMaxNanos:J

    .line 245
    :cond_5
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    iput-wide v2, p0, Lcom/almworks/sqlite4java/SQLiteProfiler$Stat;->myLastTime:J

    .line 246
    iget-wide v2, p0, Lcom/almworks/sqlite4java/SQLiteProfiler$Stat;->myFirstTime:J

    cmp-long v2, v2, v4

    if-nez v2, :cond_0

    .line 247
    iget-wide v2, p0, Lcom/almworks/sqlite4java/SQLiteProfiler$Stat;->myLastTime:J

    iput-wide v2, p0, Lcom/almworks/sqlite4java/SQLiteProfiler$Stat;->myFirstTime:J

    goto :goto_0
.end method
