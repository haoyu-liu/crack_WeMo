.class Lcom/almworks/sqlite4java/SQLite$NiceFormatter;
.super Ljava/util/logging/Formatter;
.source "SQLite.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/almworks/sqlite4java/SQLite;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "NiceFormatter"
.end annotation


# static fields
.field private static final DATE_FORMAT:Ljava/text/DateFormat;

.field private static final LINE_SEPARATOR:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 4

    .prologue
    .line 383
    new-instance v1, Ljava/text/SimpleDateFormat;

    const-string v2, "yyMMdd:HHmmss.SSS"

    sget-object v3, Ljava/util/Locale;->US:Ljava/util/Locale;

    invoke-direct {v1, v2, v3}, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;Ljava/util/Locale;)V

    sput-object v1, Lcom/almworks/sqlite4java/SQLite$NiceFormatter;->DATE_FORMAT:Ljava/text/DateFormat;

    .line 386
    const-string v1, "line.separator"

    invoke-static {v1}, Ljava/lang/System;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 387
    .local v0, "s":Ljava/lang/String;
    if-nez v0, :cond_0

    const-string v0, "\n"

    .line 388
    :cond_0
    sput-object v0, Lcom/almworks/sqlite4java/SQLite$NiceFormatter;->LINE_SEPARATOR:Ljava/lang/String;

    .line 389
    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .prologue
    .line 382
    invoke-direct {p0}, Ljava/util/logging/Formatter;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/almworks/sqlite4java/SQLite$1;)V
    .locals 0
    .param p1, "x0"    # Lcom/almworks/sqlite4java/SQLite$1;

    .prologue
    .line 382
    invoke-direct {p0}, Lcom/almworks/sqlite4java/SQLite$NiceFormatter;-><init>()V

    return-void
.end method


# virtual methods
.method public format(Ljava/util/logging/LogRecord;)Ljava/lang/String;
    .locals 7
    .param p1, "record"    # Ljava/util/logging/LogRecord;

    .prologue
    const/16 v6, 0x20

    .line 393
    if-nez p1, :cond_0

    const-string v2, ""

    .line 401
    :goto_0
    return-object v2

    .line 394
    :cond_0
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 395
    .local v1, "r":Ljava/lang/StringBuilder;
    sget-object v2, Lcom/almworks/sqlite4java/SQLite$NiceFormatter;->DATE_FORMAT:Ljava/text/DateFormat;

    invoke-virtual {p1}, Ljava/util/logging/LogRecord;->getMillis()J

    move-result-wide v4

    invoke-static {v4, v5}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/text/DateFormat;->format(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v6}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 396
    invoke-virtual {p1}, Ljava/util/logging/LogRecord;->getLevel()Ljava/util/logging/Level;

    move-result-object v0

    .line 397
    .local v0, "level":Ljava/util/logging/Level;
    if-nez v0, :cond_1

    sget-object v0, Ljava/util/logging/Level;->ALL:Ljava/util/logging/Level;

    .line 398
    :cond_1
    invoke-virtual {v0}, Ljava/util/logging/Level;->getName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v6}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 399
    invoke-virtual {p1}, Ljava/util/logging/LogRecord;->getMessage()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 400
    sget-object v2, Lcom/almworks/sqlite4java/SQLite$NiceFormatter;->LINE_SEPARATOR:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 401
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    goto :goto_0
.end method
