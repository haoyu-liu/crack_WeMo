.class public Lcom/belkin/rules/dbmigration/SensorDBMigrator;
.super Ljava/lang/Object;
.source "SensorDBMigrator.java"


# instance fields
.field private combinationTable:Lcom/belkin/rules/dbmigration/DeviceCombinationTable;

.field private context:Landroid/content/Context;

.field private devicesTable:Lcom/belkin/rules/dbmigration/RuleDevicesTable;

.field public mDeviceCombinationTables:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Lcom/belkin/rules/dbmigration/DeviceCombinationTable;",
            ">;"
        }
    .end annotation
.end field

.field public mRuleDevicesTables:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Lcom/belkin/rules/dbmigration/RuleDevicesTable;",
            ">;"
        }
    .end annotation
.end field

.field public mRulesTables:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Lcom/belkin/rules/dbmigration/RulesTable;",
            ">;"
        }
    .end annotation
.end field

.field private ruleDatabaseManager:Lcom/belkin/rules/dbmigration/RuleDatabaseManager;

.field private ruleHash:Ljava/util/Hashtable;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Hashtable",
            "<",
            "Ljava/lang/Integer;",
            "Ljava/util/Hashtable",
            "<",
            "Ljava/lang/String;",
            "Ljava/util/Vector",
            "<",
            "Lcom/belkin/rules/dbmigration/Sensor_1_X;",
            ">;>;>;"
        }
    .end annotation
.end field

.field private rules:Lcom/belkin/rules/dbmigration/RulesTable;

.field private sensorhList:Ljava/util/Vector;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Vector",
            "<",
            "Lcom/belkin/rules/dbmigration/Sensor_1_X;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Ljava/util/Vector;Landroid/content/Context;)V
    .locals 1
    .param p2, "context"    # Landroid/content/Context;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Vector",
            "<",
            "Lcom/belkin/rules/dbmigration/Sensor_1_X;",
            ">;",
            "Landroid/content/Context;",
            ")V"
        }
    .end annotation

    .prologue
    .line 59
    .local p1, "sensorhList":Ljava/util/Vector;, "Ljava/util/Vector<Lcom/belkin/rules/dbmigration/Sensor_1_X;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 52
    new-instance v0, Ljava/util/Vector;

    invoke-direct {v0}, Ljava/util/Vector;-><init>()V

    iput-object v0, p0, Lcom/belkin/rules/dbmigration/SensorDBMigrator;->sensorhList:Ljava/util/Vector;

    .line 53
    new-instance v0, Ljava/util/Hashtable;

    invoke-direct {v0}, Ljava/util/Hashtable;-><init>()V

    iput-object v0, p0, Lcom/belkin/rules/dbmigration/SensorDBMigrator;->ruleHash:Ljava/util/Hashtable;

    .line 60
    iput-object p1, p0, Lcom/belkin/rules/dbmigration/SensorDBMigrator;->sensorhList:Ljava/util/Vector;

    .line 61
    iput-object p2, p0, Lcom/belkin/rules/dbmigration/SensorDBMigrator;->context:Landroid/content/Context;

    .line 62
    return-void
.end method

.method static synthetic access$000(Lcom/belkin/rules/dbmigration/SensorDBMigrator;)V
    .locals 0
    .param p0, "x0"    # Lcom/belkin/rules/dbmigration/SensorDBMigrator;

    .prologue
    .line 51
    invoke-direct {p0}, Lcom/belkin/rules/dbmigration/SensorDBMigrator;->insertInToDataBase()V

    return-void
.end method

.method private getActiveDays(Lcom/belkin/rules/dbmigration/Sensor_1_X;)Ljava/util/Vector;
    .locals 3
    .param p1, "sensor_1_X"    # Lcom/belkin/rules/dbmigration/Sensor_1_X;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/belkin/rules/dbmigration/Sensor_1_X;",
            ")",
            "Ljava/util/Vector",
            "<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation

    .prologue
    .line 272
    new-instance v0, Ljava/util/Vector;

    invoke-direct {v0}, Ljava/util/Vector;-><init>()V

    .line 273
    .local v0, "strings":Ljava/util/Vector;, "Ljava/util/Vector<Ljava/lang/Integer;>;"
    invoke-virtual {p1}, Lcom/belkin/rules/dbmigration/Sensor_1_X;->getSun()Ljava/lang/String;

    move-result-object v1

    if-eqz v1, :cond_0

    invoke-virtual {p1}, Lcom/belkin/rules/dbmigration/Sensor_1_X;->getSun()Ljava/lang/String;

    move-result-object v1

    const-string v2, ""

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_0

    .line 274
    const/4 v1, 0x1

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/Vector;->add(Ljava/lang/Object;)Z

    .line 275
    :cond_0
    invoke-virtual {p1}, Lcom/belkin/rules/dbmigration/Sensor_1_X;->getMon()Ljava/lang/String;

    move-result-object v1

    if-eqz v1, :cond_1

    invoke-virtual {p1}, Lcom/belkin/rules/dbmigration/Sensor_1_X;->getMon()Ljava/lang/String;

    move-result-object v1

    const-string v2, ""

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_1

    .line 276
    const/4 v1, 0x2

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/Vector;->add(Ljava/lang/Object;)Z

    .line 277
    :cond_1
    invoke-virtual {p1}, Lcom/belkin/rules/dbmigration/Sensor_1_X;->getTue()Ljava/lang/String;

    move-result-object v1

    if-eqz v1, :cond_2

    invoke-virtual {p1}, Lcom/belkin/rules/dbmigration/Sensor_1_X;->getTue()Ljava/lang/String;

    move-result-object v1

    const-string v2, ""

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_2

    .line 278
    const/4 v1, 0x3

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/Vector;->add(Ljava/lang/Object;)Z

    .line 279
    :cond_2
    invoke-virtual {p1}, Lcom/belkin/rules/dbmigration/Sensor_1_X;->getWed()Ljava/lang/String;

    move-result-object v1

    if-eqz v1, :cond_3

    invoke-virtual {p1}, Lcom/belkin/rules/dbmigration/Sensor_1_X;->getWed()Ljava/lang/String;

    move-result-object v1

    const-string v2, ""

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_3

    .line 280
    const/4 v1, 0x4

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/Vector;->add(Ljava/lang/Object;)Z

    .line 281
    :cond_3
    invoke-virtual {p1}, Lcom/belkin/rules/dbmigration/Sensor_1_X;->getThu()Ljava/lang/String;

    move-result-object v1

    if-eqz v1, :cond_4

    invoke-virtual {p1}, Lcom/belkin/rules/dbmigration/Sensor_1_X;->getThu()Ljava/lang/String;

    move-result-object v1

    const-string v2, ""

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_4

    .line 282
    const/4 v1, 0x5

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/Vector;->add(Ljava/lang/Object;)Z

    .line 283
    :cond_4
    invoke-virtual {p1}, Lcom/belkin/rules/dbmigration/Sensor_1_X;->getFri()Ljava/lang/String;

    move-result-object v1

    if-eqz v1, :cond_5

    invoke-virtual {p1}, Lcom/belkin/rules/dbmigration/Sensor_1_X;->getFri()Ljava/lang/String;

    move-result-object v1

    const-string v2, ""

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_5

    .line 284
    const/4 v1, 0x6

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/Vector;->add(Ljava/lang/Object;)Z

    .line 285
    :cond_5
    invoke-virtual {p1}, Lcom/belkin/rules/dbmigration/Sensor_1_X;->getSat()Ljava/lang/String;

    move-result-object v1

    if-eqz v1, :cond_6

    invoke-virtual {p1}, Lcom/belkin/rules/dbmigration/Sensor_1_X;->getSat()Ljava/lang/String;

    move-result-object v1

    const-string v2, ""

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_6

    .line 286
    const/4 v1, 0x7

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/Vector;->add(Ljava/lang/Object;)Z

    .line 287
    :cond_6
    return-object v0
.end method

.method private getConveratedEndTime(Ljava/lang/String;)I
    .locals 8
    .param p1, "time"    # Ljava/lang/String;

    .prologue
    const/4 v5, 0x0

    .line 350
    :try_start_0
    const-string v6, "\\|"

    invoke-virtual {p1, v6}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v4

    .line 352
    .local v4, "startEndTime":[Ljava/lang/String;
    const/4 v6, 0x1

    aget-object v6, v4, v6

    const-string v7, ","

    invoke-virtual {v6, v7}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v6

    const/4 v7, 0x0

    aget-object v1, v6, v7

    .line 353
    .local v1, "endTime":Ljava/lang/String;
    const/4 v6, 0x0

    const-string v7, ":"

    invoke-virtual {v1, v7}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v7

    invoke-virtual {v1, v6, v7}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v6

    invoke-static {v6}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v2

    .line 355
    .local v2, "hour":I
    const-string v6, ":"

    invoke-virtual {v1, v6}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v6

    add-int/lit8 v6, v6, 0x1

    invoke-virtual {v1, v6}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v6

    invoke-static {v6}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result v3

    .line 358
    .local v3, "minute":I
    mul-int/lit8 v5, v2, 0x3c

    mul-int/lit8 v5, v5, 0x3c

    mul-int/lit8 v6, v3, 0x3c

    add-int/2addr v5, v6

    .line 360
    .end local v1    # "endTime":Ljava/lang/String;
    .end local v2    # "hour":I
    .end local v3    # "minute":I
    .end local v4    # "startEndTime":[Ljava/lang/String;
    :goto_0
    return v5

    .line 359
    :catch_0
    move-exception v0

    .line 360
    .local v0, "e":Ljava/lang/Exception;
    goto :goto_0
.end method

.method private getConveratedTime(Ljava/lang/String;)I
    .locals 7
    .param p1, "time"    # Ljava/lang/String;

    .prologue
    const/4 v6, 0x0

    .line 371
    const-string v4, "\\|"

    invoke-virtual {p1, v4}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v2

    .line 373
    .local v2, "startEndTime":[Ljava/lang/String;
    aget-object v4, v2, v6

    const-string v5, ","

    invoke-virtual {v4, v5}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v4

    aget-object v3, v4, v6

    .line 374
    .local v3, "startTime":Ljava/lang/String;
    const-string v4, ":"

    invoke-virtual {v3, v4}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v4

    invoke-virtual {v3, v6, v4}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v0

    .line 376
    .local v0, "hour":I
    const-string v4, ":"

    invoke-virtual {v3, v4}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v4

    add-int/lit8 v4, v4, 0x1

    invoke-virtual {v3, v4}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v1

    .line 379
    .local v1, "minute":I
    mul-int/lit8 v4, v0, 0x3c

    mul-int/lit8 v4, v4, 0x3c

    mul-int/lit8 v5, v1, 0x3c

    add-int/2addr v4, v5

    return v4
.end method

.method private getDayId(Lcom/belkin/rules/dbmigration/Sensor_1_X;)I
    .locals 1
    .param p1, "sensor_1_X"    # Lcom/belkin/rules/dbmigration/Sensor_1_X;

    .prologue
    .line 383
    invoke-direct {p0, p1}, Lcom/belkin/rules/dbmigration/SensorDBMigrator;->isEveryDay(Lcom/belkin/rules/dbmigration/Sensor_1_X;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 384
    const/4 v0, 0x0

    .line 402
    :goto_0
    return v0

    .line 385
    :cond_0
    invoke-direct {p0, p1}, Lcom/belkin/rules/dbmigration/SensorDBMigrator;->isSunday(Lcom/belkin/rules/dbmigration/Sensor_1_X;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 386
    const/4 v0, 0x1

    goto :goto_0

    .line 387
    :cond_1
    invoke-direct {p0, p1}, Lcom/belkin/rules/dbmigration/SensorDBMigrator;->isMonday(Lcom/belkin/rules/dbmigration/Sensor_1_X;)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 388
    const/4 v0, 0x2

    goto :goto_0

    .line 389
    :cond_2
    invoke-direct {p0, p1}, Lcom/belkin/rules/dbmigration/SensorDBMigrator;->isTuesday(Lcom/belkin/rules/dbmigration/Sensor_1_X;)Z

    move-result v0

    if-eqz v0, :cond_3

    .line 390
    const/4 v0, 0x3

    goto :goto_0

    .line 391
    :cond_3
    invoke-direct {p0, p1}, Lcom/belkin/rules/dbmigration/SensorDBMigrator;->isWednesDay(Lcom/belkin/rules/dbmigration/Sensor_1_X;)Z

    move-result v0

    if-eqz v0, :cond_4

    .line 392
    const/4 v0, 0x4

    goto :goto_0

    .line 393
    :cond_4
    invoke-direct {p0, p1}, Lcom/belkin/rules/dbmigration/SensorDBMigrator;->isThusDay(Lcom/belkin/rules/dbmigration/Sensor_1_X;)Z

    move-result v0

    if-eqz v0, :cond_5

    .line 394
    const/4 v0, 0x5

    goto :goto_0

    .line 395
    :cond_5
    invoke-direct {p0, p1}, Lcom/belkin/rules/dbmigration/SensorDBMigrator;->isFriDay(Lcom/belkin/rules/dbmigration/Sensor_1_X;)Z

    move-result v0

    if-eqz v0, :cond_6

    .line 396
    const/4 v0, 0x6

    goto :goto_0

    .line 397
    :cond_6
    invoke-direct {p0, p1}, Lcom/belkin/rules/dbmigration/SensorDBMigrator;->isSaturDay(Lcom/belkin/rules/dbmigration/Sensor_1_X;)Z

    move-result v0

    if-eqz v0, :cond_7

    .line 398
    const/4 v0, 0x7

    goto :goto_0

    .line 399
    :cond_7
    invoke-direct {p0, p1}, Lcom/belkin/rules/dbmigration/SensorDBMigrator;->isWeekDay(Lcom/belkin/rules/dbmigration/Sensor_1_X;)Z

    move-result v0

    if-eqz v0, :cond_8

    .line 400
    const/16 v0, 0x8

    goto :goto_0

    .line 402
    :cond_8
    const/4 v0, -0x1

    goto :goto_0
.end method

.method private getEndAction(Ljava/lang/String;)D
    .locals 7
    .param p1, "time"    # Ljava/lang/String;

    .prologue
    const-wide/high16 v4, 0x4000000000000000L    # 2.0

    .line 297
    :try_start_0
    const-string v3, "\\|"

    invoke-virtual {p1, v3}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v2

    .line 298
    .local v2, "startEndTime":[Ljava/lang/String;
    const/4 v3, 0x1

    aget-object v3, v2, v3

    const-string v6, ","

    invoke-virtual {v3, v6}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v3

    const/4 v6, 0x1

    aget-object v1, v3, v6

    .line 299
    .local v1, "endTime":Ljava/lang/String;
    invoke-virtual {v1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v3

    const-string v6, "1"

    invoke-virtual {v3, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_1

    .line 300
    const-wide/high16 v4, 0x3ff0000000000000L    # 1.0

    .line 306
    .end local v1    # "endTime":Ljava/lang/String;
    .end local v2    # "startEndTime":[Ljava/lang/String;
    :cond_0
    :goto_0
    return-wide v4

    .line 301
    .restart local v1    # "endTime":Ljava/lang/String;
    .restart local v2    # "startEndTime":[Ljava/lang/String;
    :cond_1
    invoke-virtual {v1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v3

    const-string v6, "0"

    invoke-virtual {v3, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result v3

    if-eqz v3, :cond_0

    .line 302
    const-wide/16 v4, 0x0

    goto :goto_0

    .line 305
    .end local v1    # "endTime":Ljava/lang/String;
    .end local v2    # "startEndTime":[Ljava/lang/String;
    :catch_0
    move-exception v0

    .line 306
    .local v0, "e":Ljava/lang/Exception;
    goto :goto_0
.end method

.method private getEndTime(Lcom/belkin/rules/dbmigration/Sensor_1_X;)I
    .locals 1
    .param p1, "sensor_1_X"    # Lcom/belkin/rules/dbmigration/Sensor_1_X;

    .prologue
    .line 343
    invoke-virtual {p1}, Lcom/belkin/rules/dbmigration/Sensor_1_X;->getEndTime()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/belkin/rules/dbmigration/SensorDBMigrator;->getConveratedEndTime(Ljava/lang/String;)I

    move-result v0

    return v0
.end method

.method private getRuleDuration(Lcom/belkin/rules/dbmigration/Sensor_1_X;)I
    .locals 3
    .param p1, "sensor_1_X"    # Lcom/belkin/rules/dbmigration/Sensor_1_X;

    .prologue
    .line 334
    invoke-direct {p0, p1}, Lcom/belkin/rules/dbmigration/SensorDBMigrator;->getStartTime(Lcom/belkin/rules/dbmigration/Sensor_1_X;)I

    move-result v1

    .line 335
    .local v1, "startTime":I
    invoke-direct {p0, p1}, Lcom/belkin/rules/dbmigration/SensorDBMigrator;->getEndTime(Lcom/belkin/rules/dbmigration/Sensor_1_X;)I

    move-result v0

    .line 336
    .local v0, "endTime":I
    if-lez v0, :cond_0

    .line 337
    sub-int v2, v0, v1

    .line 339
    :goto_0
    return v2

    :cond_0
    const/4 v2, 0x0

    goto :goto_0
.end method

.method private getRuleEndAction(Lcom/belkin/rules/dbmigration/Sensor_1_X;)D
    .locals 2
    .param p1, "sensor_1_X"    # Lcom/belkin/rules/dbmigration/Sensor_1_X;

    .prologue
    .line 291
    invoke-virtual {p1}, Lcom/belkin/rules/dbmigration/Sensor_1_X;->getEndTime()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/belkin/rules/dbmigration/SensorDBMigrator;->getEndAction(Ljava/lang/String;)D

    move-result-wide v0

    return-wide v0
.end method

.method private getRuleStartAction(Lcom/belkin/rules/dbmigration/Sensor_1_X;)D
    .locals 2
    .param p1, "sensor_1_X"    # Lcom/belkin/rules/dbmigration/Sensor_1_X;

    .prologue
    .line 312
    invoke-virtual {p1}, Lcom/belkin/rules/dbmigration/Sensor_1_X;->getStartTime()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/belkin/rules/dbmigration/SensorDBMigrator;->getStartAction(Ljava/lang/String;)D

    move-result-wide v0

    return-wide v0
.end method

.method private getSensorDuration(Lcom/belkin/rules/dbmigration/Sensor_1_X;)I
    .locals 3
    .param p1, "sensor_1_X"    # Lcom/belkin/rules/dbmigration/Sensor_1_X;

    .prologue
    const/4 v2, 0x1

    .line 232
    invoke-direct {p0, p1}, Lcom/belkin/rules/dbmigration/SensorDBMigrator;->getDayId(Lcom/belkin/rules/dbmigration/Sensor_1_X;)I

    move-result v0

    packed-switch v0, :pswitch_data_0

    .line 255
    const/4 v0, 0x0

    :goto_0
    return v0

    .line 234
    :pswitch_0
    invoke-virtual {p1}, Lcom/belkin/rules/dbmigration/Sensor_1_X;->getSun()Ljava/lang/String;

    move-result-object v0

    const-string v1, ","

    invoke-virtual {v0, v1}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v0

    aget-object v0, v0, v2

    invoke-static {v0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v0

    goto :goto_0

    .line 236
    :pswitch_1
    invoke-virtual {p1}, Lcom/belkin/rules/dbmigration/Sensor_1_X;->getSun()Ljava/lang/String;

    move-result-object v0

    const-string v1, ","

    invoke-virtual {v0, v1}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v0

    aget-object v0, v0, v2

    invoke-static {v0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v0

    goto :goto_0

    .line 238
    :pswitch_2
    invoke-virtual {p1}, Lcom/belkin/rules/dbmigration/Sensor_1_X;->getMon()Ljava/lang/String;

    move-result-object v0

    const-string v1, ","

    invoke-virtual {v0, v1}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v0

    aget-object v0, v0, v2

    invoke-static {v0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v0

    goto :goto_0

    .line 240
    :pswitch_3
    invoke-virtual {p1}, Lcom/belkin/rules/dbmigration/Sensor_1_X;->getTue()Ljava/lang/String;

    move-result-object v0

    const-string v1, ","

    invoke-virtual {v0, v1}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v0

    aget-object v0, v0, v2

    invoke-static {v0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v0

    goto :goto_0

    .line 242
    :pswitch_4
    invoke-virtual {p1}, Lcom/belkin/rules/dbmigration/Sensor_1_X;->getWed()Ljava/lang/String;

    move-result-object v0

    const-string v1, ","

    invoke-virtual {v0, v1}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v0

    aget-object v0, v0, v2

    invoke-static {v0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v0

    goto :goto_0

    .line 244
    :pswitch_5
    invoke-virtual {p1}, Lcom/belkin/rules/dbmigration/Sensor_1_X;->getThu()Ljava/lang/String;

    move-result-object v0

    const-string v1, ","

    invoke-virtual {v0, v1}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v0

    aget-object v0, v0, v2

    invoke-static {v0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v0

    goto :goto_0

    .line 246
    :pswitch_6
    invoke-virtual {p1}, Lcom/belkin/rules/dbmigration/Sensor_1_X;->getFri()Ljava/lang/String;

    move-result-object v0

    const-string v1, ","

    invoke-virtual {v0, v1}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v0

    aget-object v0, v0, v2

    invoke-static {v0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v0

    goto :goto_0

    .line 248
    :pswitch_7
    invoke-virtual {p1}, Lcom/belkin/rules/dbmigration/Sensor_1_X;->getSat()Ljava/lang/String;

    move-result-object v0

    const-string v1, ","

    invoke-virtual {v0, v1}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v0

    aget-object v0, v0, v2

    invoke-static {v0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v0

    goto/16 :goto_0

    .line 250
    :pswitch_8
    invoke-virtual {p1}, Lcom/belkin/rules/dbmigration/Sensor_1_X;->getMon()Ljava/lang/String;

    move-result-object v0

    const-string v1, ","

    invoke-virtual {v0, v1}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v0

    aget-object v0, v0, v2

    invoke-static {v0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v0

    goto/16 :goto_0

    .line 252
    :pswitch_9
    invoke-virtual {p1}, Lcom/belkin/rules/dbmigration/Sensor_1_X;->getSun()Ljava/lang/String;

    move-result-object v0

    const-string v1, ","

    invoke-virtual {v0, v1}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v0

    aget-object v0, v0, v2

    invoke-static {v0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v0

    goto/16 :goto_0

    .line 232
    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
        :pswitch_1
        :pswitch_2
        :pswitch_3
        :pswitch_4
        :pswitch_5
        :pswitch_6
        :pswitch_7
        :pswitch_8
        :pswitch_9
    .end packed-switch
.end method

.method private getStartAction(Ljava/lang/String;)D
    .locals 7
    .param p1, "time"    # Ljava/lang/String;

    .prologue
    const-wide/high16 v4, 0x4000000000000000L    # 2.0

    .line 319
    :try_start_0
    const-string v3, "\\|"

    invoke-virtual {p1, v3}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v2

    .line 321
    .local v2, "startEndTime":[Ljava/lang/String;
    const/4 v3, 0x0

    aget-object v3, v2, v3

    const-string v6, ","

    invoke-virtual {v3, v6}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v3

    const/4 v6, 0x1

    aget-object v1, v3, v6

    .line 322
    .local v1, "endTime":Ljava/lang/String;
    invoke-virtual {v1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v3

    const-string v6, "1"

    invoke-virtual {v3, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_1

    .line 323
    const-wide/high16 v4, 0x3ff0000000000000L    # 1.0

    .line 329
    .end local v1    # "endTime":Ljava/lang/String;
    .end local v2    # "startEndTime":[Ljava/lang/String;
    :cond_0
    :goto_0
    return-wide v4

    .line 324
    .restart local v1    # "endTime":Ljava/lang/String;
    .restart local v2    # "startEndTime":[Ljava/lang/String;
    :cond_1
    invoke-virtual {v1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v3

    const-string v6, "0"

    invoke-virtual {v3, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result v3

    if-eqz v3, :cond_0

    .line 325
    const-wide/16 v4, 0x0

    goto :goto_0

    .line 328
    .end local v1    # "endTime":Ljava/lang/String;
    .end local v2    # "startEndTime":[Ljava/lang/String;
    :catch_0
    move-exception v0

    .line 329
    .local v0, "e":Ljava/lang/Exception;
    goto :goto_0
.end method

.method private getStartTime(Lcom/belkin/rules/dbmigration/Sensor_1_X;)I
    .locals 1
    .param p1, "sensor_1_X"    # Lcom/belkin/rules/dbmigration/Sensor_1_X;

    .prologue
    .line 365
    invoke-virtual {p1}, Lcom/belkin/rules/dbmigration/Sensor_1_X;->getStartTime()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/belkin/rules/dbmigration/SensorDBMigrator;->getConveratedTime(Ljava/lang/String;)I

    move-result v0

    return v0
.end method

.method private getValue(Ljava/lang/String;)I
    .locals 2
    .param p1, "sensitivity"    # Ljava/lang/String;

    .prologue
    .line 259
    invoke-virtual {p1}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v0

    const-string v1, "low"

    invoke-virtual {v0, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 260
    const/16 v0, 0x19

    .line 268
    :goto_0
    return v0

    .line 261
    :cond_0
    invoke-virtual {p1}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v0

    const-string v1, "medium"

    invoke-virtual {v0, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 262
    const/16 v0, 0x32

    goto :goto_0

    .line 263
    :cond_1
    invoke-virtual {p1}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v0

    const-string v1, "very"

    invoke-virtual {v0, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 264
    const/16 v0, 0x64

    goto :goto_0

    .line 265
    :cond_2
    invoke-virtual {p1}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v0

    const-string v1, "high"

    invoke-virtual {v0, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_3

    .line 266
    const/16 v0, 0x4b

    goto :goto_0

    .line 268
    :cond_3
    const/4 v0, 0x0

    goto :goto_0
.end method

.method private insertInToDataBase()V
    .locals 6

    .prologue
    .line 621
    iget-object v2, p0, Lcom/belkin/rules/dbmigration/SensorDBMigrator;->ruleDatabaseManager:Lcom/belkin/rules/dbmigration/RuleDatabaseManager;

    iget-object v3, p0, Lcom/belkin/rules/dbmigration/SensorDBMigrator;->mRulesTables:Ljava/util/ArrayList;

    iget-object v4, p0, Lcom/belkin/rules/dbmigration/SensorDBMigrator;->mRuleDevicesTables:Ljava/util/ArrayList;

    iget-object v5, p0, Lcom/belkin/rules/dbmigration/SensorDBMigrator;->mDeviceCombinationTables:Ljava/util/ArrayList;

    invoke-virtual {v2, v3, v4, v5}, Lcom/belkin/rules/dbmigration/RuleDatabaseManager;->insert(Ljava/util/ArrayList;Ljava/util/ArrayList;Ljava/util/ArrayList;)Z

    .line 622
    new-instance v1, Lcom/belkin/utils/RuleUtility;

    iget-object v2, p0, Lcom/belkin/rules/dbmigration/SensorDBMigrator;->context:Landroid/content/Context;

    invoke-direct {v1, v2}, Lcom/belkin/utils/RuleUtility;-><init>(Landroid/content/Context;)V

    .line 623
    .local v1, "ruleUtility":Lcom/belkin/utils/RuleUtility;
    new-instance v0, Lcom/belkin/wemo/cache/utils/MoreUtil;

    invoke-direct {v0}, Lcom/belkin/wemo/cache/utils/MoreUtil;-><init>()V

    .line 624
    .local v0, "moreUtil":Lcom/belkin/wemo/cache/utils/MoreUtil;
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "/data/data/"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p0, Lcom/belkin/rules/dbmigration/SensorDBMigrator;->context:Landroid/content/Context;

    invoke-virtual {v0, v3}, Lcom/belkin/wemo/cache/utils/MoreUtil;->getPackageName(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "/databases/"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "pluginrules2.db"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-static {}, Lcom/belkin/utils/RuleUtility;->getLocalDBPath()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-static {}, Lcom/belkin/utils/RuleUtility;->getLocalDBName()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    const-string v4, "false"

    invoke-virtual {v1, v2, v3, v4}, Lcom/belkin/utils/RuleUtility;->copyDataBase(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 625
    return-void
.end method

.method private isEveryDay(Lcom/belkin/rules/dbmigration/Sensor_1_X;)Z
    .locals 3
    .param p1, "sensor_1_X"    # Lcom/belkin/rules/dbmigration/Sensor_1_X;

    .prologue
    const/4 v0, 0x0

    .line 412
    invoke-virtual {p1}, Lcom/belkin/rules/dbmigration/Sensor_1_X;->getSun()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v1

    if-eqz v1, :cond_0

    .line 413
    invoke-virtual {p1}, Lcom/belkin/rules/dbmigration/Sensor_1_X;->getSun()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1}, Lcom/belkin/rules/dbmigration/Sensor_1_X;->getMon()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-virtual {p1}, Lcom/belkin/rules/dbmigration/Sensor_1_X;->getSun()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1}, Lcom/belkin/rules/dbmigration/Sensor_1_X;->getTue()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-virtual {p1}, Lcom/belkin/rules/dbmigration/Sensor_1_X;->getSun()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1}, Lcom/belkin/rules/dbmigration/Sensor_1_X;->getWed()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-virtual {p1}, Lcom/belkin/rules/dbmigration/Sensor_1_X;->getSun()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1}, Lcom/belkin/rules/dbmigration/Sensor_1_X;->getThu()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-virtual {p1}, Lcom/belkin/rules/dbmigration/Sensor_1_X;->getSun()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1}, Lcom/belkin/rules/dbmigration/Sensor_1_X;->getFri()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-virtual {p1}, Lcom/belkin/rules/dbmigration/Sensor_1_X;->getSun()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1}, Lcom/belkin/rules/dbmigration/Sensor_1_X;->getSat()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 419
    const/4 v0, 0x1

    .line 423
    :cond_0
    return v0
.end method

.method private isFriDay(Lcom/belkin/rules/dbmigration/Sensor_1_X;)Z
    .locals 4
    .param p1, "sensor_1_X"    # Lcom/belkin/rules/dbmigration/Sensor_1_X;

    .prologue
    const/4 v0, 0x1

    const/4 v1, 0x0

    .line 538
    invoke-virtual {p1}, Lcom/belkin/rules/dbmigration/Sensor_1_X;->getFri()Ljava/lang/String;

    move-result-object v2

    if-eqz v2, :cond_3

    invoke-virtual {p1}, Lcom/belkin/rules/dbmigration/Sensor_1_X;->getFri()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v2

    if-eqz v2, :cond_3

    .line 539
    invoke-virtual {p1}, Lcom/belkin/rules/dbmigration/Sensor_1_X;->getSun()Ljava/lang/String;

    move-result-object v2

    const-string v3, ""

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-virtual {p1}, Lcom/belkin/rules/dbmigration/Sensor_1_X;->getMon()Ljava/lang/String;

    move-result-object v2

    const-string v3, ""

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-virtual {p1}, Lcom/belkin/rules/dbmigration/Sensor_1_X;->getTue()Ljava/lang/String;

    move-result-object v2

    const-string v3, ""

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-virtual {p1}, Lcom/belkin/rules/dbmigration/Sensor_1_X;->getWed()Ljava/lang/String;

    move-result-object v2

    const-string v3, ""

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-virtual {p1}, Lcom/belkin/rules/dbmigration/Sensor_1_X;->getThu()Ljava/lang/String;

    move-result-object v2

    const-string v3, ""

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-virtual {p1}, Lcom/belkin/rules/dbmigration/Sensor_1_X;->getSat()Ljava/lang/String;

    move-result-object v2

    const-string v3, ""

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 556
    :cond_0
    :goto_0
    return v0

    .line 546
    :cond_1
    invoke-virtual {p1}, Lcom/belkin/rules/dbmigration/Sensor_1_X;->getSun()Ljava/lang/String;

    move-result-object v2

    if-nez v2, :cond_2

    invoke-virtual {p1}, Lcom/belkin/rules/dbmigration/Sensor_1_X;->getMon()Ljava/lang/String;

    move-result-object v2

    if-nez v2, :cond_2

    invoke-virtual {p1}, Lcom/belkin/rules/dbmigration/Sensor_1_X;->getTue()Ljava/lang/String;

    move-result-object v2

    if-nez v2, :cond_2

    invoke-virtual {p1}, Lcom/belkin/rules/dbmigration/Sensor_1_X;->getWed()Ljava/lang/String;

    move-result-object v2

    if-nez v2, :cond_2

    invoke-virtual {p1}, Lcom/belkin/rules/dbmigration/Sensor_1_X;->getThu()Ljava/lang/String;

    move-result-object v2

    if-nez v2, :cond_2

    invoke-virtual {p1}, Lcom/belkin/rules/dbmigration/Sensor_1_X;->getSat()Ljava/lang/String;

    move-result-object v2

    if-eqz v2, :cond_0

    :cond_2
    move v0, v1

    .line 554
    goto :goto_0

    :cond_3
    move v0, v1

    .line 556
    goto :goto_0
.end method

.method private isMonday(Lcom/belkin/rules/dbmigration/Sensor_1_X;)Z
    .locals 4
    .param p1, "sensor_1_X"    # Lcom/belkin/rules/dbmigration/Sensor_1_X;

    .prologue
    const/4 v0, 0x1

    const/4 v1, 0x0

    .line 450
    invoke-virtual {p1}, Lcom/belkin/rules/dbmigration/Sensor_1_X;->getMon()Ljava/lang/String;

    move-result-object v2

    if-eqz v2, :cond_3

    invoke-virtual {p1}, Lcom/belkin/rules/dbmigration/Sensor_1_X;->getMon()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v2

    if-eqz v2, :cond_3

    .line 451
    invoke-virtual {p1}, Lcom/belkin/rules/dbmigration/Sensor_1_X;->getSun()Ljava/lang/String;

    move-result-object v2

    const-string v3, ""

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-virtual {p1}, Lcom/belkin/rules/dbmigration/Sensor_1_X;->getTue()Ljava/lang/String;

    move-result-object v2

    const-string v3, ""

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-virtual {p1}, Lcom/belkin/rules/dbmigration/Sensor_1_X;->getWed()Ljava/lang/String;

    move-result-object v2

    const-string v3, ""

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-virtual {p1}, Lcom/belkin/rules/dbmigration/Sensor_1_X;->getThu()Ljava/lang/String;

    move-result-object v2

    const-string v3, ""

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-virtual {p1}, Lcom/belkin/rules/dbmigration/Sensor_1_X;->getFri()Ljava/lang/String;

    move-result-object v2

    const-string v3, ""

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-virtual {p1}, Lcom/belkin/rules/dbmigration/Sensor_1_X;->getSat()Ljava/lang/String;

    move-result-object v2

    const-string v3, ""

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 468
    :cond_0
    :goto_0
    return v0

    .line 458
    :cond_1
    invoke-virtual {p1}, Lcom/belkin/rules/dbmigration/Sensor_1_X;->getSun()Ljava/lang/String;

    move-result-object v2

    if-nez v2, :cond_2

    invoke-virtual {p1}, Lcom/belkin/rules/dbmigration/Sensor_1_X;->getTue()Ljava/lang/String;

    move-result-object v2

    if-nez v2, :cond_2

    invoke-virtual {p1}, Lcom/belkin/rules/dbmigration/Sensor_1_X;->getWed()Ljava/lang/String;

    move-result-object v2

    if-nez v2, :cond_2

    invoke-virtual {p1}, Lcom/belkin/rules/dbmigration/Sensor_1_X;->getThu()Ljava/lang/String;

    move-result-object v2

    if-nez v2, :cond_2

    invoke-virtual {p1}, Lcom/belkin/rules/dbmigration/Sensor_1_X;->getFri()Ljava/lang/String;

    move-result-object v2

    if-nez v2, :cond_2

    invoke-virtual {p1}, Lcom/belkin/rules/dbmigration/Sensor_1_X;->getSat()Ljava/lang/String;

    move-result-object v2

    if-eqz v2, :cond_0

    :cond_2
    move v0, v1

    .line 466
    goto :goto_0

    :cond_3
    move v0, v1

    .line 468
    goto :goto_0
.end method

.method private isSaturDay(Lcom/belkin/rules/dbmigration/Sensor_1_X;)Z
    .locals 4
    .param p1, "sensor_1_X"    # Lcom/belkin/rules/dbmigration/Sensor_1_X;

    .prologue
    const/4 v0, 0x1

    const/4 v1, 0x0

    .line 560
    invoke-virtual {p1}, Lcom/belkin/rules/dbmigration/Sensor_1_X;->getSat()Ljava/lang/String;

    move-result-object v2

    if-eqz v2, :cond_3

    invoke-virtual {p1}, Lcom/belkin/rules/dbmigration/Sensor_1_X;->getSat()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v2

    if-eqz v2, :cond_3

    .line 561
    invoke-virtual {p1}, Lcom/belkin/rules/dbmigration/Sensor_1_X;->getSun()Ljava/lang/String;

    move-result-object v2

    const-string v3, ""

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-virtual {p1}, Lcom/belkin/rules/dbmigration/Sensor_1_X;->getMon()Ljava/lang/String;

    move-result-object v2

    const-string v3, ""

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-virtual {p1}, Lcom/belkin/rules/dbmigration/Sensor_1_X;->getTue()Ljava/lang/String;

    move-result-object v2

    const-string v3, ""

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-virtual {p1}, Lcom/belkin/rules/dbmigration/Sensor_1_X;->getWed()Ljava/lang/String;

    move-result-object v2

    const-string v3, ""

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-virtual {p1}, Lcom/belkin/rules/dbmigration/Sensor_1_X;->getThu()Ljava/lang/String;

    move-result-object v2

    const-string v3, ""

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-virtual {p1}, Lcom/belkin/rules/dbmigration/Sensor_1_X;->getFri()Ljava/lang/String;

    move-result-object v2

    const-string v3, ""

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 578
    :cond_0
    :goto_0
    return v0

    .line 568
    :cond_1
    invoke-virtual {p1}, Lcom/belkin/rules/dbmigration/Sensor_1_X;->getSun()Ljava/lang/String;

    move-result-object v2

    if-nez v2, :cond_2

    invoke-virtual {p1}, Lcom/belkin/rules/dbmigration/Sensor_1_X;->getMon()Ljava/lang/String;

    move-result-object v2

    if-nez v2, :cond_2

    invoke-virtual {p1}, Lcom/belkin/rules/dbmigration/Sensor_1_X;->getTue()Ljava/lang/String;

    move-result-object v2

    if-nez v2, :cond_2

    invoke-virtual {p1}, Lcom/belkin/rules/dbmigration/Sensor_1_X;->getWed()Ljava/lang/String;

    move-result-object v2

    if-nez v2, :cond_2

    invoke-virtual {p1}, Lcom/belkin/rules/dbmigration/Sensor_1_X;->getThu()Ljava/lang/String;

    move-result-object v2

    if-nez v2, :cond_2

    invoke-virtual {p1}, Lcom/belkin/rules/dbmigration/Sensor_1_X;->getFri()Ljava/lang/String;

    move-result-object v2

    if-eqz v2, :cond_0

    :cond_2
    move v0, v1

    .line 576
    goto :goto_0

    :cond_3
    move v0, v1

    .line 578
    goto :goto_0
.end method

.method private isSunday(Lcom/belkin/rules/dbmigration/Sensor_1_X;)Z
    .locals 4
    .param p1, "sensor_1_X"    # Lcom/belkin/rules/dbmigration/Sensor_1_X;

    .prologue
    const/4 v0, 0x1

    const/4 v1, 0x0

    .line 427
    invoke-virtual {p1}, Lcom/belkin/rules/dbmigration/Sensor_1_X;->getSun()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v2

    if-eqz v2, :cond_3

    .line 428
    invoke-virtual {p1}, Lcom/belkin/rules/dbmigration/Sensor_1_X;->getMon()Ljava/lang/String;

    move-result-object v2

    const-string v3, ""

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-virtual {p1}, Lcom/belkin/rules/dbmigration/Sensor_1_X;->getTue()Ljava/lang/String;

    move-result-object v2

    const-string v3, ""

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-virtual {p1}, Lcom/belkin/rules/dbmigration/Sensor_1_X;->getWed()Ljava/lang/String;

    move-result-object v2

    const-string v3, ""

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-virtual {p1}, Lcom/belkin/rules/dbmigration/Sensor_1_X;->getThu()Ljava/lang/String;

    move-result-object v2

    const-string v3, ""

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-virtual {p1}, Lcom/belkin/rules/dbmigration/Sensor_1_X;->getFri()Ljava/lang/String;

    move-result-object v2

    const-string v3, ""

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-virtual {p1}, Lcom/belkin/rules/dbmigration/Sensor_1_X;->getSat()Ljava/lang/String;

    move-result-object v2

    const-string v3, ""

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 446
    :cond_0
    :goto_0
    return v0

    .line 435
    :cond_1
    invoke-virtual {p1}, Lcom/belkin/rules/dbmigration/Sensor_1_X;->getMon()Ljava/lang/String;

    move-result-object v2

    if-nez v2, :cond_2

    invoke-virtual {p1}, Lcom/belkin/rules/dbmigration/Sensor_1_X;->getTue()Ljava/lang/String;

    move-result-object v2

    if-nez v2, :cond_2

    invoke-virtual {p1}, Lcom/belkin/rules/dbmigration/Sensor_1_X;->getWed()Ljava/lang/String;

    move-result-object v2

    if-nez v2, :cond_2

    invoke-virtual {p1}, Lcom/belkin/rules/dbmigration/Sensor_1_X;->getThu()Ljava/lang/String;

    move-result-object v2

    if-nez v2, :cond_2

    invoke-virtual {p1}, Lcom/belkin/rules/dbmigration/Sensor_1_X;->getFri()Ljava/lang/String;

    move-result-object v2

    if-nez v2, :cond_2

    invoke-virtual {p1}, Lcom/belkin/rules/dbmigration/Sensor_1_X;->getSat()Ljava/lang/String;

    move-result-object v2

    if-eqz v2, :cond_0

    :cond_2
    move v0, v1

    .line 444
    goto :goto_0

    :cond_3
    move v0, v1

    .line 446
    goto :goto_0
.end method

.method private isThusDay(Lcom/belkin/rules/dbmigration/Sensor_1_X;)Z
    .locals 4
    .param p1, "sensor_1_X"    # Lcom/belkin/rules/dbmigration/Sensor_1_X;

    .prologue
    const/4 v0, 0x1

    const/4 v1, 0x0

    .line 516
    invoke-virtual {p1}, Lcom/belkin/rules/dbmigration/Sensor_1_X;->getThu()Ljava/lang/String;

    move-result-object v2

    if-eqz v2, :cond_3

    invoke-virtual {p1}, Lcom/belkin/rules/dbmigration/Sensor_1_X;->getThu()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v2

    if-eqz v2, :cond_3

    .line 517
    invoke-virtual {p1}, Lcom/belkin/rules/dbmigration/Sensor_1_X;->getSun()Ljava/lang/String;

    move-result-object v2

    const-string v3, ""

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-virtual {p1}, Lcom/belkin/rules/dbmigration/Sensor_1_X;->getMon()Ljava/lang/String;

    move-result-object v2

    const-string v3, ""

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-virtual {p1}, Lcom/belkin/rules/dbmigration/Sensor_1_X;->getTue()Ljava/lang/String;

    move-result-object v2

    const-string v3, ""

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-virtual {p1}, Lcom/belkin/rules/dbmigration/Sensor_1_X;->getWed()Ljava/lang/String;

    move-result-object v2

    const-string v3, ""

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-virtual {p1}, Lcom/belkin/rules/dbmigration/Sensor_1_X;->getFri()Ljava/lang/String;

    move-result-object v2

    const-string v3, ""

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-virtual {p1}, Lcom/belkin/rules/dbmigration/Sensor_1_X;->getSat()Ljava/lang/String;

    move-result-object v2

    const-string v3, ""

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 534
    :cond_0
    :goto_0
    return v0

    .line 524
    :cond_1
    invoke-virtual {p1}, Lcom/belkin/rules/dbmigration/Sensor_1_X;->getSun()Ljava/lang/String;

    move-result-object v2

    if-nez v2, :cond_2

    invoke-virtual {p1}, Lcom/belkin/rules/dbmigration/Sensor_1_X;->getMon()Ljava/lang/String;

    move-result-object v2

    if-nez v2, :cond_2

    invoke-virtual {p1}, Lcom/belkin/rules/dbmigration/Sensor_1_X;->getTue()Ljava/lang/String;

    move-result-object v2

    if-nez v2, :cond_2

    invoke-virtual {p1}, Lcom/belkin/rules/dbmigration/Sensor_1_X;->getWed()Ljava/lang/String;

    move-result-object v2

    if-nez v2, :cond_2

    invoke-virtual {p1}, Lcom/belkin/rules/dbmigration/Sensor_1_X;->getFri()Ljava/lang/String;

    move-result-object v2

    if-nez v2, :cond_2

    invoke-virtual {p1}, Lcom/belkin/rules/dbmigration/Sensor_1_X;->getSat()Ljava/lang/String;

    move-result-object v2

    if-eqz v2, :cond_0

    :cond_2
    move v0, v1

    .line 532
    goto :goto_0

    :cond_3
    move v0, v1

    .line 534
    goto :goto_0
.end method

.method private isTuesday(Lcom/belkin/rules/dbmigration/Sensor_1_X;)Z
    .locals 4
    .param p1, "sensor_1_X"    # Lcom/belkin/rules/dbmigration/Sensor_1_X;

    .prologue
    const/4 v0, 0x1

    const/4 v1, 0x0

    .line 472
    invoke-virtual {p1}, Lcom/belkin/rules/dbmigration/Sensor_1_X;->getTue()Ljava/lang/String;

    move-result-object v2

    if-eqz v2, :cond_3

    invoke-virtual {p1}, Lcom/belkin/rules/dbmigration/Sensor_1_X;->getTue()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v2

    if-eqz v2, :cond_3

    .line 473
    invoke-virtual {p1}, Lcom/belkin/rules/dbmigration/Sensor_1_X;->getSun()Ljava/lang/String;

    move-result-object v2

    const-string v3, ""

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-virtual {p1}, Lcom/belkin/rules/dbmigration/Sensor_1_X;->getMon()Ljava/lang/String;

    move-result-object v2

    const-string v3, ""

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-virtual {p1}, Lcom/belkin/rules/dbmigration/Sensor_1_X;->getWed()Ljava/lang/String;

    move-result-object v2

    const-string v3, ""

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-virtual {p1}, Lcom/belkin/rules/dbmigration/Sensor_1_X;->getThu()Ljava/lang/String;

    move-result-object v2

    const-string v3, ""

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-virtual {p1}, Lcom/belkin/rules/dbmigration/Sensor_1_X;->getFri()Ljava/lang/String;

    move-result-object v2

    const-string v3, ""

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-virtual {p1}, Lcom/belkin/rules/dbmigration/Sensor_1_X;->getSat()Ljava/lang/String;

    move-result-object v2

    const-string v3, ""

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 490
    :cond_0
    :goto_0
    return v0

    .line 480
    :cond_1
    invoke-virtual {p1}, Lcom/belkin/rules/dbmigration/Sensor_1_X;->getSun()Ljava/lang/String;

    move-result-object v2

    if-nez v2, :cond_2

    invoke-virtual {p1}, Lcom/belkin/rules/dbmigration/Sensor_1_X;->getMon()Ljava/lang/String;

    move-result-object v2

    if-nez v2, :cond_2

    invoke-virtual {p1}, Lcom/belkin/rules/dbmigration/Sensor_1_X;->getWed()Ljava/lang/String;

    move-result-object v2

    if-nez v2, :cond_2

    invoke-virtual {p1}, Lcom/belkin/rules/dbmigration/Sensor_1_X;->getThu()Ljava/lang/String;

    move-result-object v2

    if-nez v2, :cond_2

    invoke-virtual {p1}, Lcom/belkin/rules/dbmigration/Sensor_1_X;->getFri()Ljava/lang/String;

    move-result-object v2

    if-nez v2, :cond_2

    invoke-virtual {p1}, Lcom/belkin/rules/dbmigration/Sensor_1_X;->getSat()Ljava/lang/String;

    move-result-object v2

    if-eqz v2, :cond_0

    :cond_2
    move v0, v1

    .line 488
    goto :goto_0

    :cond_3
    move v0, v1

    .line 490
    goto :goto_0
.end method

.method private isWednesDay(Lcom/belkin/rules/dbmigration/Sensor_1_X;)Z
    .locals 4
    .param p1, "sensor_1_X"    # Lcom/belkin/rules/dbmigration/Sensor_1_X;

    .prologue
    const/4 v0, 0x1

    const/4 v1, 0x0

    .line 494
    invoke-virtual {p1}, Lcom/belkin/rules/dbmigration/Sensor_1_X;->getWed()Ljava/lang/String;

    move-result-object v2

    if-eqz v2, :cond_3

    invoke-virtual {p1}, Lcom/belkin/rules/dbmigration/Sensor_1_X;->getWed()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v2

    if-eqz v2, :cond_3

    .line 495
    invoke-virtual {p1}, Lcom/belkin/rules/dbmigration/Sensor_1_X;->getSun()Ljava/lang/String;

    move-result-object v2

    const-string v3, ""

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-virtual {p1}, Lcom/belkin/rules/dbmigration/Sensor_1_X;->getMon()Ljava/lang/String;

    move-result-object v2

    const-string v3, ""

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-virtual {p1}, Lcom/belkin/rules/dbmigration/Sensor_1_X;->getTue()Ljava/lang/String;

    move-result-object v2

    const-string v3, ""

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-virtual {p1}, Lcom/belkin/rules/dbmigration/Sensor_1_X;->getThu()Ljava/lang/String;

    move-result-object v2

    const-string v3, ""

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-virtual {p1}, Lcom/belkin/rules/dbmigration/Sensor_1_X;->getFri()Ljava/lang/String;

    move-result-object v2

    const-string v3, ""

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-virtual {p1}, Lcom/belkin/rules/dbmigration/Sensor_1_X;->getSat()Ljava/lang/String;

    move-result-object v2

    const-string v3, ""

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 512
    :cond_0
    :goto_0
    return v0

    .line 502
    :cond_1
    invoke-virtual {p1}, Lcom/belkin/rules/dbmigration/Sensor_1_X;->getSun()Ljava/lang/String;

    move-result-object v2

    if-nez v2, :cond_2

    invoke-virtual {p1}, Lcom/belkin/rules/dbmigration/Sensor_1_X;->getMon()Ljava/lang/String;

    move-result-object v2

    if-nez v2, :cond_2

    invoke-virtual {p1}, Lcom/belkin/rules/dbmigration/Sensor_1_X;->getTue()Ljava/lang/String;

    move-result-object v2

    if-nez v2, :cond_2

    invoke-virtual {p1}, Lcom/belkin/rules/dbmigration/Sensor_1_X;->getThu()Ljava/lang/String;

    move-result-object v2

    if-nez v2, :cond_2

    invoke-virtual {p1}, Lcom/belkin/rules/dbmigration/Sensor_1_X;->getFri()Ljava/lang/String;

    move-result-object v2

    if-nez v2, :cond_2

    invoke-virtual {p1}, Lcom/belkin/rules/dbmigration/Sensor_1_X;->getSat()Ljava/lang/String;

    move-result-object v2

    if-eqz v2, :cond_0

    :cond_2
    move v0, v1

    .line 510
    goto :goto_0

    :cond_3
    move v0, v1

    .line 512
    goto :goto_0
.end method

.method private isWeekDay(Lcom/belkin/rules/dbmigration/Sensor_1_X;)Z
    .locals 3
    .param p1, "sensor_1_X"    # Lcom/belkin/rules/dbmigration/Sensor_1_X;

    .prologue
    const/4 v0, 0x0

    .line 583
    invoke-virtual {p1}, Lcom/belkin/rules/dbmigration/Sensor_1_X;->getSat()Ljava/lang/String;

    move-result-object v1

    if-eqz v1, :cond_0

    invoke-virtual {p1}, Lcom/belkin/rules/dbmigration/Sensor_1_X;->getSat()Ljava/lang/String;

    move-result-object v1

    const-string v2, ""

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1

    :cond_0
    invoke-virtual {p1}, Lcom/belkin/rules/dbmigration/Sensor_1_X;->getSun()Ljava/lang/String;

    move-result-object v1

    if-eqz v1, :cond_2

    :cond_1
    invoke-virtual {p1}, Lcom/belkin/rules/dbmigration/Sensor_1_X;->getSun()Ljava/lang/String;

    move-result-object v1

    const-string v2, ""

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_3

    .line 586
    :cond_2
    invoke-virtual {p1}, Lcom/belkin/rules/dbmigration/Sensor_1_X;->getMon()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v1

    if-eqz v1, :cond_3

    .line 587
    invoke-virtual {p1}, Lcom/belkin/rules/dbmigration/Sensor_1_X;->getMon()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1}, Lcom/belkin/rules/dbmigration/Sensor_1_X;->getTue()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_3

    invoke-virtual {p1}, Lcom/belkin/rules/dbmigration/Sensor_1_X;->getMon()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1}, Lcom/belkin/rules/dbmigration/Sensor_1_X;->getWed()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_3

    invoke-virtual {p1}, Lcom/belkin/rules/dbmigration/Sensor_1_X;->getMon()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1}, Lcom/belkin/rules/dbmigration/Sensor_1_X;->getThu()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_3

    invoke-virtual {p1}, Lcom/belkin/rules/dbmigration/Sensor_1_X;->getMon()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1}, Lcom/belkin/rules/dbmigration/Sensor_1_X;->getFri()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_3

    .line 591
    const/4 v0, 0x1

    .line 597
    :cond_3
    return v0
.end method


# virtual methods
.method public migrate()V
    .locals 28

    .prologue
    .line 71
    new-instance v24, Ljava/util/ArrayList;

    invoke-direct/range {v24 .. v24}, Ljava/util/ArrayList;-><init>()V

    move-object/from16 v0, v24

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/belkin/rules/dbmigration/SensorDBMigrator;->mRulesTables:Ljava/util/ArrayList;

    .line 72
    new-instance v24, Ljava/util/ArrayList;

    invoke-direct/range {v24 .. v24}, Ljava/util/ArrayList;-><init>()V

    move-object/from16 v0, v24

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/belkin/rules/dbmigration/SensorDBMigrator;->mRuleDevicesTables:Ljava/util/ArrayList;

    .line 73
    new-instance v24, Ljava/util/ArrayList;

    invoke-direct/range {v24 .. v24}, Ljava/util/ArrayList;-><init>()V

    move-object/from16 v0, v24

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/belkin/rules/dbmigration/SensorDBMigrator;->mDeviceCombinationTables:Ljava/util/ArrayList;

    .line 75
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/rules/dbmigration/SensorDBMigrator;->sensorhList:Ljava/util/Vector;

    move-object/from16 v24, v0

    invoke-virtual/range {v24 .. v24}, Ljava/util/Vector;->iterator()Ljava/util/Iterator;

    move-result-object v13

    .local v13, "i$":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v13}, Ljava/util/Iterator;->hasNext()Z

    move-result v24

    if-eqz v24, :cond_2

    invoke-interface {v13}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v21

    check-cast v21, Lcom/belkin/rules/dbmigration/Sensor_1_X;

    .line 78
    .local v21, "sensor_1_X":Lcom/belkin/rules/dbmigration/Sensor_1_X;
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/rules/dbmigration/SensorDBMigrator;->ruleHash:Ljava/util/Hashtable;

    move-object/from16 v24, v0

    invoke-virtual/range {v21 .. v21}, Lcom/belkin/rules/dbmigration/Sensor_1_X;->getId()I

    move-result v25

    invoke-static/range {v25 .. v25}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v25

    invoke-virtual/range {v24 .. v25}, Ljava/util/Hashtable;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v17

    check-cast v17, Ljava/util/Hashtable;

    .line 79
    .local v17, "ruleHashtable":Ljava/util/Hashtable;, "Ljava/util/Hashtable<Ljava/lang/String;Ljava/util/Vector<Lcom/belkin/rules/dbmigration/Sensor_1_X;>;>;"
    if-nez v17, :cond_0

    .line 80
    new-instance v17, Ljava/util/Hashtable;

    .end local v17    # "ruleHashtable":Ljava/util/Hashtable;, "Ljava/util/Hashtable<Ljava/lang/String;Ljava/util/Vector<Lcom/belkin/rules/dbmigration/Sensor_1_X;>;>;"
    invoke-direct/range {v17 .. v17}, Ljava/util/Hashtable;-><init>()V

    .line 81
    .restart local v17    # "ruleHashtable":Ljava/util/Hashtable;, "Ljava/util/Hashtable<Ljava/lang/String;Ljava/util/Vector<Lcom/belkin/rules/dbmigration/Sensor_1_X;>;>;"
    :cond_0
    invoke-virtual/range {v21 .. v21}, Lcom/belkin/rules/dbmigration/Sensor_1_X;->getSensorudn()Ljava/lang/String;

    move-result-object v24

    move-object/from16 v0, v17

    move-object/from16 v1, v24

    invoke-virtual {v0, v1}, Ljava/util/Hashtable;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v19

    check-cast v19, Ljava/util/Vector;

    .line 82
    .local v19, "sensorList":Ljava/util/Vector;, "Ljava/util/Vector<Lcom/belkin/rules/dbmigration/Sensor_1_X;>;"
    if-nez v19, :cond_1

    .line 83
    new-instance v19, Ljava/util/Vector;

    .end local v19    # "sensorList":Ljava/util/Vector;, "Ljava/util/Vector<Lcom/belkin/rules/dbmigration/Sensor_1_X;>;"
    invoke-direct/range {v19 .. v19}, Ljava/util/Vector;-><init>()V

    .line 84
    .restart local v19    # "sensorList":Ljava/util/Vector;, "Ljava/util/Vector<Lcom/belkin/rules/dbmigration/Sensor_1_X;>;"
    :cond_1
    move-object/from16 v0, v19

    move-object/from16 v1, v21

    invoke-virtual {v0, v1}, Ljava/util/Vector;->add(Ljava/lang/Object;)Z

    .line 85
    invoke-virtual/range {v21 .. v21}, Lcom/belkin/rules/dbmigration/Sensor_1_X;->getSensorudn()Ljava/lang/String;

    move-result-object v24

    move-object/from16 v0, v17

    move-object/from16 v1, v24

    move-object/from16 v2, v19

    invoke-virtual {v0, v1, v2}, Ljava/util/Hashtable;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 86
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/rules/dbmigration/SensorDBMigrator;->ruleHash:Ljava/util/Hashtable;

    move-object/from16 v24, v0

    invoke-virtual/range {v21 .. v21}, Lcom/belkin/rules/dbmigration/Sensor_1_X;->getId()I

    move-result v25

    invoke-static/range {v25 .. v25}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v25

    move-object/from16 v0, v24

    move-object/from16 v1, v25

    move-object/from16 v2, v17

    invoke-virtual {v0, v1, v2}, Ljava/util/Hashtable;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_0

    .line 89
    .end local v17    # "ruleHashtable":Ljava/util/Hashtable;, "Ljava/util/Hashtable<Ljava/lang/String;Ljava/util/Vector<Lcom/belkin/rules/dbmigration/Sensor_1_X;>;>;"
    .end local v19    # "sensorList":Ljava/util/Vector;, "Ljava/util/Vector<Lcom/belkin/rules/dbmigration/Sensor_1_X;>;"
    .end local v21    # "sensor_1_X":Lcom/belkin/rules/dbmigration/Sensor_1_X;
    :cond_2
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/rules/dbmigration/SensorDBMigrator;->ruleHash:Ljava/util/Hashtable;

    move-object/from16 v24, v0

    invoke-virtual/range {v24 .. v24}, Ljava/util/Hashtable;->keys()Ljava/util/Enumeration;

    move-result-object v9

    .line 91
    .end local v13    # "i$":Ljava/util/Iterator;
    .local v9, "e":Ljava/util/Enumeration;, "Ljava/util/Enumeration<Ljava/lang/Integer;>;"
    :cond_3
    invoke-interface {v9}, Ljava/util/Enumeration;->hasMoreElements()Z

    move-result v24

    if-eqz v24, :cond_a

    .line 92
    invoke-interface {v9}, Ljava/util/Enumeration;->nextElement()Ljava/lang/Object;

    move-result-object v24

    check-cast v24, Ljava/lang/Integer;

    invoke-virtual/range {v24 .. v24}, Ljava/lang/Integer;->toString()Ljava/lang/String;

    move-result-object v24

    invoke-static/range {v24 .. v24}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v15

    .line 93
    .local v15, "id":I
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/rules/dbmigration/SensorDBMigrator;->ruleHash:Ljava/util/Hashtable;

    move-object/from16 v24, v0

    invoke-static {v15}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v25

    invoke-virtual/range {v24 .. v25}, Ljava/util/Hashtable;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v17

    check-cast v17, Ljava/util/Hashtable;

    .line 94
    .restart local v17    # "ruleHashtable":Ljava/util/Hashtable;, "Ljava/util/Hashtable<Ljava/lang/String;Ljava/util/Vector<Lcom/belkin/rules/dbmigration/Sensor_1_X;>;>;"
    invoke-virtual/range {v17 .. v17}, Ljava/util/Hashtable;->size()I

    move-result v24

    if-lez v24, :cond_3

    .line 96
    invoke-virtual/range {v17 .. v17}, Ljava/util/Hashtable;->keys()Ljava/util/Enumeration;

    move-result-object v10

    .line 97
    .local v10, "e1":Ljava/util/Enumeration;, "Ljava/util/Enumeration<Ljava/lang/String;>;"
    const/16 v18, 0x0

    .line 98
    .local v18, "ruleTableinsert":Z
    :cond_4
    :goto_1
    invoke-interface {v10}, Ljava/util/Enumeration;->hasMoreElements()Z

    move-result v24

    if-eqz v24, :cond_3

    .line 99
    invoke-interface {v10}, Ljava/util/Enumeration;->nextElement()Ljava/lang/Object;

    move-result-object v24

    check-cast v24, Ljava/lang/String;

    invoke-virtual/range {v24 .. v24}, Ljava/lang/String;->toString()Ljava/lang/String;

    move-result-object v24

    move-object/from16 v0, v17

    move-object/from16 v1, v24

    invoke-virtual {v0, v1}, Ljava/util/Hashtable;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v20

    check-cast v20, Ljava/util/Vector;

    .line 100
    .local v20, "sensorVector":Ljava/util/Vector;, "Ljava/util/Vector<Lcom/belkin/rules/dbmigration/Sensor_1_X;>;"
    invoke-virtual/range {v20 .. v20}, Ljava/util/Vector;->iterator()Ljava/util/Iterator;

    move-result-object v13

    :cond_5
    :goto_2
    invoke-interface {v13}, Ljava/util/Iterator;->hasNext()Z

    move-result v24

    if-eqz v24, :cond_9

    invoke-interface {v13}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v21

    check-cast v21, Lcom/belkin/rules/dbmigration/Sensor_1_X;

    .line 101
    .restart local v21    # "sensor_1_X":Lcom/belkin/rules/dbmigration/Sensor_1_X;
    if-nez v18, :cond_6

    .line 102
    const/16 v18, 0x1

    .line 103
    new-instance v24, Lcom/belkin/rules/dbmigration/RulesTable;

    invoke-direct/range {v24 .. v24}, Lcom/belkin/rules/dbmigration/RulesTable;-><init>()V

    move-object/from16 v0, v24

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/belkin/rules/dbmigration/SensorDBMigrator;->rules:Lcom/belkin/rules/dbmigration/RulesTable;

    .line 104
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/rules/dbmigration/SensorDBMigrator;->rules:Lcom/belkin/rules/dbmigration/RulesTable;

    move-object/from16 v24, v0

    invoke-virtual/range {v21 .. v21}, Lcom/belkin/rules/dbmigration/Sensor_1_X;->getId()I

    move-result v25

    invoke-virtual/range {v24 .. v25}, Lcom/belkin/rules/dbmigration/RulesTable;->setRuleId(I)V

    .line 105
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/rules/dbmigration/SensorDBMigrator;->rules:Lcom/belkin/rules/dbmigration/RulesTable;

    move-object/from16 v24, v0

    invoke-virtual/range {v21 .. v21}, Lcom/belkin/rules/dbmigration/Sensor_1_X;->getName()Ljava/lang/String;

    move-result-object v25

    invoke-virtual/range {v24 .. v25}, Lcom/belkin/rules/dbmigration/RulesTable;->setName(Ljava/lang/String;)V

    .line 106
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/rules/dbmigration/SensorDBMigrator;->rules:Lcom/belkin/rules/dbmigration/RulesTable;

    move-object/from16 v24, v0

    invoke-virtual/range {v21 .. v21}, Lcom/belkin/rules/dbmigration/Sensor_1_X;->getType()Ljava/lang/String;

    move-result-object v25

    invoke-virtual/range {v24 .. v25}, Lcom/belkin/rules/dbmigration/RulesTable;->setType(Ljava/lang/String;)V

    .line 107
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/rules/dbmigration/SensorDBMigrator;->rules:Lcom/belkin/rules/dbmigration/RulesTable;

    move-object/from16 v24, v0

    new-instance v25, Ljava/lang/StringBuilder;

    invoke-direct/range {v25 .. v25}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual/range {v21 .. v21}, Lcom/belkin/rules/dbmigration/Sensor_1_X;->getEnable()Ljava/lang/String;

    move-result-object v26

    invoke-virtual/range {v25 .. v26}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v25

    const-string v26, ""

    invoke-virtual/range {v25 .. v26}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v25

    invoke-virtual/range {v25 .. v25}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v25

    invoke-virtual/range {v24 .. v25}, Lcom/belkin/rules/dbmigration/RulesTable;->setState(Ljava/lang/String;)V

    .line 110
    :cond_6
    sget-object v24, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v25, " %%%%%%%%%%%% Sensor Migration %%%%%%%%%%%%%%%%%%%%"

    invoke-virtual/range {v24 .. v25}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 111
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/rules/dbmigration/SensorDBMigrator;->mRulesTables:Ljava/util/ArrayList;

    move-object/from16 v24, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/rules/dbmigration/SensorDBMigrator;->rules:Lcom/belkin/rules/dbmigration/RulesTable;

    move-object/from16 v25, v0

    invoke-virtual/range {v24 .. v25}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 113
    new-instance v24, Lcom/belkin/rules/dbmigration/DeviceCombinationTable;

    invoke-direct/range {v24 .. v24}, Lcom/belkin/rules/dbmigration/DeviceCombinationTable;-><init>()V

    move-object/from16 v0, v24

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/belkin/rules/dbmigration/SensorDBMigrator;->combinationTable:Lcom/belkin/rules/dbmigration/DeviceCombinationTable;

    .line 114
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/rules/dbmigration/SensorDBMigrator;->combinationTable:Lcom/belkin/rules/dbmigration/DeviceCombinationTable;

    move-object/from16 v24, v0

    invoke-virtual/range {v21 .. v21}, Lcom/belkin/rules/dbmigration/Sensor_1_X;->getId()I

    move-result v25

    invoke-virtual/range {v24 .. v25}, Lcom/belkin/rules/dbmigration/DeviceCombinationTable;->setRuleId(I)V

    .line 115
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/rules/dbmigration/SensorDBMigrator;->combinationTable:Lcom/belkin/rules/dbmigration/DeviceCombinationTable;

    move-object/from16 v24, v0

    invoke-virtual/range {v21 .. v21}, Lcom/belkin/rules/dbmigration/Sensor_1_X;->getSensorudn()Ljava/lang/String;

    move-result-object v25

    invoke-virtual/range {v24 .. v25}, Lcom/belkin/rules/dbmigration/DeviceCombinationTable;->setSensorId(Ljava/lang/String;)V

    .line 116
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/rules/dbmigration/SensorDBMigrator;->combinationTable:Lcom/belkin/rules/dbmigration/DeviceCombinationTable;

    move-object/from16 v24, v0

    invoke-virtual/range {v21 .. v21}, Lcom/belkin/rules/dbmigration/Sensor_1_X;->getUdn()Ljava/lang/String;

    move-result-object v25

    invoke-virtual/range {v24 .. v25}, Lcom/belkin/rules/dbmigration/DeviceCombinationTable;->setDeviceId(Ljava/lang/String;)V

    .line 118
    sget-object v24, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v25, " %%%%%%%%%%%% Device sombination Migration %%%%%%%%%%%%%%%%%%%%"

    invoke-virtual/range {v24 .. v25}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 119
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/rules/dbmigration/SensorDBMigrator;->mDeviceCombinationTables:Ljava/util/ArrayList;

    move-object/from16 v24, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/rules/dbmigration/SensorDBMigrator;->combinationTable:Lcom/belkin/rules/dbmigration/DeviceCombinationTable;

    move-object/from16 v25, v0

    invoke-virtual/range {v24 .. v25}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 122
    new-instance v24, Lcom/belkin/rules/dbmigration/RuleDevicesTable;

    invoke-direct/range {v24 .. v24}, Lcom/belkin/rules/dbmigration/RuleDevicesTable;-><init>()V

    move-object/from16 v0, v24

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/belkin/rules/dbmigration/SensorDBMigrator;->devicesTable:Lcom/belkin/rules/dbmigration/RuleDevicesTable;

    .line 123
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/rules/dbmigration/SensorDBMigrator;->devicesTable:Lcom/belkin/rules/dbmigration/RuleDevicesTable;

    move-object/from16 v24, v0

    move-object/from16 v0, v24

    invoke-virtual {v0, v15}, Lcom/belkin/rules/dbmigration/RuleDevicesTable;->setRuleId(I)V

    .line 124
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/rules/dbmigration/SensorDBMigrator;->devicesTable:Lcom/belkin/rules/dbmigration/RuleDevicesTable;

    move-object/from16 v24, v0

    invoke-virtual/range {v21 .. v21}, Lcom/belkin/rules/dbmigration/Sensor_1_X;->getUdn()Ljava/lang/String;

    move-result-object v25

    invoke-virtual/range {v24 .. v25}, Lcom/belkin/rules/dbmigration/RuleDevicesTable;->setDeviceId(Ljava/lang/String;)V

    .line 126
    move-object/from16 v0, p0

    move-object/from16 v1, v21

    invoke-direct {v0, v1}, Lcom/belkin/rules/dbmigration/SensorDBMigrator;->getDayId(Lcom/belkin/rules/dbmigration/Sensor_1_X;)I

    move-result v7

    .line 128
    .local v7, "dayId":I
    const/16 v24, -0x1

    move/from16 v0, v24

    if-eq v7, v0, :cond_7

    .line 129
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/rules/dbmigration/SensorDBMigrator;->devicesTable:Lcom/belkin/rules/dbmigration/RuleDevicesTable;

    move-object/from16 v24, v0

    move-object/from16 v0, v24

    invoke-virtual {v0, v7}, Lcom/belkin/rules/dbmigration/RuleDevicesTable;->setDayId(I)V

    .line 130
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/rules/dbmigration/SensorDBMigrator;->devicesTable:Lcom/belkin/rules/dbmigration/RuleDevicesTable;

    move-object/from16 v24, v0

    move-object/from16 v0, p0

    move-object/from16 v1, v21

    invoke-direct {v0, v1}, Lcom/belkin/rules/dbmigration/SensorDBMigrator;->getStartTime(Lcom/belkin/rules/dbmigration/Sensor_1_X;)I

    move-result v25

    invoke-virtual/range {v24 .. v25}, Lcom/belkin/rules/dbmigration/RuleDevicesTable;->setStarttime(I)V

    .line 131
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/rules/dbmigration/SensorDBMigrator;->devicesTable:Lcom/belkin/rules/dbmigration/RuleDevicesTable;

    move-object/from16 v24, v0

    move-object/from16 v0, p0

    move-object/from16 v1, v21

    invoke-direct {v0, v1}, Lcom/belkin/rules/dbmigration/SensorDBMigrator;->getRuleDuration(Lcom/belkin/rules/dbmigration/Sensor_1_X;)I

    move-result v25

    invoke-virtual/range {v24 .. v25}, Lcom/belkin/rules/dbmigration/RuleDevicesTable;->setRuleDuration(I)V

    .line 132
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/rules/dbmigration/SensorDBMigrator;->devicesTable:Lcom/belkin/rules/dbmigration/RuleDevicesTable;

    move-object/from16 v24, v0

    move-object/from16 v0, p0

    move-object/from16 v1, v21

    invoke-direct {v0, v1}, Lcom/belkin/rules/dbmigration/SensorDBMigrator;->getRuleStartAction(Lcom/belkin/rules/dbmigration/Sensor_1_X;)D

    move-result-wide v26

    move-object/from16 v0, v24

    move-wide/from16 v1, v26

    invoke-virtual {v0, v1, v2}, Lcom/belkin/rules/dbmigration/RuleDevicesTable;->setStartAction(D)V

    .line 133
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/rules/dbmigration/SensorDBMigrator;->devicesTable:Lcom/belkin/rules/dbmigration/RuleDevicesTable;

    move-object/from16 v24, v0

    move-object/from16 v0, p0

    move-object/from16 v1, v21

    invoke-direct {v0, v1}, Lcom/belkin/rules/dbmigration/SensorDBMigrator;->getRuleEndAction(Lcom/belkin/rules/dbmigration/Sensor_1_X;)D

    move-result-wide v26

    move-object/from16 v0, v24

    move-wide/from16 v1, v26

    invoke-virtual {v0, v1, v2}, Lcom/belkin/rules/dbmigration/RuleDevicesTable;->setEndAction(D)V

    .line 135
    :try_start_0
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/rules/dbmigration/SensorDBMigrator;->devicesTable:Lcom/belkin/rules/dbmigration/RuleDevicesTable;

    move-object/from16 v24, v0

    move-object/from16 v0, p0

    move-object/from16 v1, v21

    invoke-direct {v0, v1}, Lcom/belkin/rules/dbmigration/SensorDBMigrator;->getSensorDuration(Lcom/belkin/rules/dbmigration/Sensor_1_X;)I

    move-result v25

    invoke-virtual/range {v24 .. v25}, Lcom/belkin/rules/dbmigration/RuleDevicesTable;->setSensorDuration(I)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 139
    :goto_3
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/rules/dbmigration/SensorDBMigrator;->devicesTable:Lcom/belkin/rules/dbmigration/RuleDevicesTable;

    move-object/from16 v24, v0

    const/16 v25, -0x1

    invoke-virtual/range {v24 .. v25}, Lcom/belkin/rules/dbmigration/RuleDevicesTable;->setType(I)V

    .line 140
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/rules/dbmigration/SensorDBMigrator;->devicesTable:Lcom/belkin/rules/dbmigration/RuleDevicesTable;

    move-object/from16 v24, v0

    const/16 v25, -0x1

    invoke-virtual/range {v24 .. v25}, Lcom/belkin/rules/dbmigration/RuleDevicesTable;->setLevel(I)V

    .line 141
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/rules/dbmigration/SensorDBMigrator;->devicesTable:Lcom/belkin/rules/dbmigration/RuleDevicesTable;

    move-object/from16 v24, v0

    const-string v25, "-1"

    invoke-virtual/range {v24 .. v25}, Lcom/belkin/rules/dbmigration/RuleDevicesTable;->setValue(Ljava/lang/String;)V

    .line 142
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/rules/dbmigration/SensorDBMigrator;->mRuleDevicesTables:Ljava/util/ArrayList;

    move-object/from16 v24, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/rules/dbmigration/SensorDBMigrator;->devicesTable:Lcom/belkin/rules/dbmigration/RuleDevicesTable;

    move-object/from16 v25, v0

    invoke-virtual/range {v24 .. v25}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto/16 :goto_2

    .line 136
    :catch_0
    move-exception v12

    .line 137
    .local v12, "ex":Ljava/lang/Exception;
    invoke-virtual {v12}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_3

    .line 147
    .end local v12    # "ex":Ljava/lang/Exception;
    :cond_7
    move-object/from16 v0, p0

    move-object/from16 v1, v21

    invoke-direct {v0, v1}, Lcom/belkin/rules/dbmigration/SensorDBMigrator;->getActiveDays(Lcom/belkin/rules/dbmigration/Sensor_1_X;)Ljava/util/Vector;

    move-result-object v23

    .line 148
    .local v23, "vector":Ljava/util/Vector;, "Ljava/util/Vector<Ljava/lang/Integer;>;"
    invoke-virtual/range {v23 .. v23}, Ljava/util/Vector;->iterator()Ljava/util/Iterator;

    move-result-object v14

    .local v14, "i$":Ljava/util/Iterator;
    :goto_4
    invoke-interface {v14}, Ljava/util/Iterator;->hasNext()Z

    move-result v24

    if-eqz v24, :cond_5

    invoke-interface {v14}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v16

    check-cast v16, Ljava/lang/Integer;

    .line 149
    .local v16, "integer":Ljava/lang/Integer;
    const-string v22, ""

    .line 150
    .local v22, "value":Ljava/lang/String;
    invoke-virtual/range {v16 .. v16}, Ljava/lang/Integer;->intValue()I

    move-result v24

    packed-switch v24, :pswitch_data_0

    .line 174
    :goto_5
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/rules/dbmigration/SensorDBMigrator;->devicesTable:Lcom/belkin/rules/dbmigration/RuleDevicesTable;

    move-object/from16 v24, v0

    invoke-virtual/range {v21 .. v21}, Lcom/belkin/rules/dbmigration/Sensor_1_X;->getStartTime()Ljava/lang/String;

    move-result-object v25

    move-object/from16 v0, p0

    move-object/from16 v1, v25

    invoke-direct {v0, v1}, Lcom/belkin/rules/dbmigration/SensorDBMigrator;->getConveratedTime(Ljava/lang/String;)I

    move-result v25

    invoke-virtual/range {v24 .. v25}, Lcom/belkin/rules/dbmigration/RuleDevicesTable;->setStarttime(I)V

    .line 175
    invoke-virtual/range {v21 .. v21}, Lcom/belkin/rules/dbmigration/Sensor_1_X;->getStartTime()Ljava/lang/String;

    move-result-object v24

    move-object/from16 v0, p0

    move-object/from16 v1, v24

    invoke-direct {v0, v1}, Lcom/belkin/rules/dbmigration/SensorDBMigrator;->getConveratedTime(Ljava/lang/String;)I

    move-result v5

    .line 176
    .local v5, "convertedStartTime":I
    invoke-virtual/range {v21 .. v21}, Lcom/belkin/rules/dbmigration/Sensor_1_X;->getEndTime()Ljava/lang/String;

    move-result-object v24

    move-object/from16 v0, p0

    move-object/from16 v1, v24

    invoke-direct {v0, v1}, Lcom/belkin/rules/dbmigration/SensorDBMigrator;->getConveratedEndTime(Ljava/lang/String;)I

    move-result v4

    .line 178
    .local v4, "convertedEndTime":I
    if-lez v4, :cond_8

    .line 179
    sub-int v6, v4, v5

    .line 183
    .local v6, "convertedTime":I
    :goto_6
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/rules/dbmigration/SensorDBMigrator;->devicesTable:Lcom/belkin/rules/dbmigration/RuleDevicesTable;

    move-object/from16 v24, v0

    move-object/from16 v0, v24

    invoke-virtual {v0, v6}, Lcom/belkin/rules/dbmigration/RuleDevicesTable;->setRuleDuration(I)V

    .line 184
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/rules/dbmigration/SensorDBMigrator;->devicesTable:Lcom/belkin/rules/dbmigration/RuleDevicesTable;

    move-object/from16 v24, v0

    invoke-virtual/range {v21 .. v21}, Lcom/belkin/rules/dbmigration/Sensor_1_X;->getStartTime()Ljava/lang/String;

    move-result-object v25

    move-object/from16 v0, p0

    move-object/from16 v1, v25

    invoke-direct {v0, v1}, Lcom/belkin/rules/dbmigration/SensorDBMigrator;->getStartAction(Ljava/lang/String;)D

    move-result-wide v26

    move-object/from16 v0, v24

    move-wide/from16 v1, v26

    invoke-virtual {v0, v1, v2}, Lcom/belkin/rules/dbmigration/RuleDevicesTable;->setStartAction(D)V

    .line 185
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/rules/dbmigration/SensorDBMigrator;->devicesTable:Lcom/belkin/rules/dbmigration/RuleDevicesTable;

    move-object/from16 v24, v0

    invoke-virtual/range {v21 .. v21}, Lcom/belkin/rules/dbmigration/Sensor_1_X;->getEndTime()Ljava/lang/String;

    move-result-object v25

    move-object/from16 v0, p0

    move-object/from16 v1, v25

    invoke-direct {v0, v1}, Lcom/belkin/rules/dbmigration/SensorDBMigrator;->getEndAction(Ljava/lang/String;)D

    move-result-wide v26

    move-object/from16 v0, v24

    move-wide/from16 v1, v26

    invoke-virtual {v0, v1, v2}, Lcom/belkin/rules/dbmigration/RuleDevicesTable;->setEndAction(D)V

    .line 187
    :try_start_1
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/rules/dbmigration/SensorDBMigrator;->devicesTable:Lcom/belkin/rules/dbmigration/RuleDevicesTable;

    move-object/from16 v24, v0

    const-string v25, ","

    move-object/from16 v0, v22

    move-object/from16 v1, v25

    invoke-virtual {v0, v1}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v25

    const/16 v26, 0x1

    aget-object v25, v25, v26

    invoke-static/range {v25 .. v25}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v25

    invoke-virtual/range {v24 .. v25}, Lcom/belkin/rules/dbmigration/RuleDevicesTable;->setSensorDuration(I)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    .line 191
    :goto_7
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/rules/dbmigration/SensorDBMigrator;->devicesTable:Lcom/belkin/rules/dbmigration/RuleDevicesTable;

    move-object/from16 v24, v0

    const/16 v25, -0x1

    invoke-virtual/range {v24 .. v25}, Lcom/belkin/rules/dbmigration/RuleDevicesTable;->setType(I)V

    .line 192
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/rules/dbmigration/SensorDBMigrator;->devicesTable:Lcom/belkin/rules/dbmigration/RuleDevicesTable;

    move-object/from16 v24, v0

    const/16 v25, -0x1

    invoke-virtual/range {v24 .. v25}, Lcom/belkin/rules/dbmigration/RuleDevicesTable;->setLevel(I)V

    .line 193
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/rules/dbmigration/SensorDBMigrator;->devicesTable:Lcom/belkin/rules/dbmigration/RuleDevicesTable;

    move-object/from16 v24, v0

    const-string v25, "-1"

    invoke-virtual/range {v24 .. v25}, Lcom/belkin/rules/dbmigration/RuleDevicesTable;->setValue(Ljava/lang/String;)V

    .line 194
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/rules/dbmigration/SensorDBMigrator;->mRuleDevicesTables:Ljava/util/ArrayList;

    move-object/from16 v24, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/rules/dbmigration/SensorDBMigrator;->devicesTable:Lcom/belkin/rules/dbmigration/RuleDevicesTable;

    move-object/from16 v25, v0

    invoke-virtual/range {v24 .. v25}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto/16 :goto_4

    .line 152
    .end local v4    # "convertedEndTime":I
    .end local v5    # "convertedStartTime":I
    .end local v6    # "convertedTime":I
    :pswitch_0
    invoke-virtual/range {v21 .. v21}, Lcom/belkin/rules/dbmigration/Sensor_1_X;->getSun()Ljava/lang/String;

    move-result-object v22

    .line 153
    goto/16 :goto_5

    .line 155
    :pswitch_1
    invoke-virtual/range {v21 .. v21}, Lcom/belkin/rules/dbmigration/Sensor_1_X;->getMon()Ljava/lang/String;

    move-result-object v22

    .line 156
    goto/16 :goto_5

    .line 158
    :pswitch_2
    invoke-virtual/range {v21 .. v21}, Lcom/belkin/rules/dbmigration/Sensor_1_X;->getTue()Ljava/lang/String;

    move-result-object v22

    .line 159
    goto/16 :goto_5

    .line 161
    :pswitch_3
    invoke-virtual/range {v21 .. v21}, Lcom/belkin/rules/dbmigration/Sensor_1_X;->getWed()Ljava/lang/String;

    move-result-object v22

    .line 162
    goto/16 :goto_5

    .line 164
    :pswitch_4
    invoke-virtual/range {v21 .. v21}, Lcom/belkin/rules/dbmigration/Sensor_1_X;->getThu()Ljava/lang/String;

    move-result-object v22

    .line 165
    goto/16 :goto_5

    .line 167
    :pswitch_5
    invoke-virtual/range {v21 .. v21}, Lcom/belkin/rules/dbmigration/Sensor_1_X;->getFri()Ljava/lang/String;

    move-result-object v22

    .line 168
    goto/16 :goto_5

    .line 170
    :pswitch_6
    invoke-virtual/range {v21 .. v21}, Lcom/belkin/rules/dbmigration/Sensor_1_X;->getSat()Ljava/lang/String;

    move-result-object v22

    goto/16 :goto_5

    .line 182
    .restart local v4    # "convertedEndTime":I
    .restart local v5    # "convertedStartTime":I
    :cond_8
    const/4 v6, 0x0

    .restart local v6    # "convertedTime":I
    goto/16 :goto_6

    .line 188
    :catch_1
    move-exception v11

    .line 189
    .local v11, "e2":Ljava/lang/Exception;
    invoke-virtual {v11}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_7

    .line 198
    .end local v4    # "convertedEndTime":I
    .end local v5    # "convertedStartTime":I
    .end local v6    # "convertedTime":I
    .end local v7    # "dayId":I
    .end local v11    # "e2":Ljava/lang/Exception;
    .end local v14    # "i$":Ljava/util/Iterator;
    .end local v16    # "integer":Ljava/lang/Integer;
    .end local v21    # "sensor_1_X":Lcom/belkin/rules/dbmigration/Sensor_1_X;
    .end local v22    # "value":Ljava/lang/String;
    .end local v23    # "vector":Ljava/util/Vector;, "Ljava/util/Vector<Ljava/lang/Integer;>;"
    :cond_9
    invoke-virtual/range {v20 .. v20}, Ljava/util/Vector;->size()I

    move-result v24

    if-lez v24, :cond_4

    .line 199
    const/16 v24, 0x0

    move-object/from16 v0, v20

    move/from16 v1, v24

    invoke-virtual {v0, v1}, Ljava/util/Vector;->elementAt(I)Ljava/lang/Object;

    move-result-object v21

    check-cast v21, Lcom/belkin/rules/dbmigration/Sensor_1_X;

    .line 200
    .restart local v21    # "sensor_1_X":Lcom/belkin/rules/dbmigration/Sensor_1_X;
    new-instance v8, Lcom/belkin/rules/dbmigration/RuleDevicesTable;

    invoke-direct {v8}, Lcom/belkin/rules/dbmigration/RuleDevicesTable;-><init>()V

    .line 201
    .local v8, "devicesTable":Lcom/belkin/rules/dbmigration/RuleDevicesTable;
    invoke-virtual/range {v21 .. v21}, Lcom/belkin/rules/dbmigration/Sensor_1_X;->getId()I

    move-result v24

    move/from16 v0, v24

    invoke-virtual {v8, v0}, Lcom/belkin/rules/dbmigration/RuleDevicesTable;->setRuleId(I)V

    .line 202
    invoke-virtual/range {v21 .. v21}, Lcom/belkin/rules/dbmigration/Sensor_1_X;->getSensorudn()Ljava/lang/String;

    move-result-object v24

    move-object/from16 v0, v24

    invoke-virtual {v8, v0}, Lcom/belkin/rules/dbmigration/RuleDevicesTable;->setDeviceId(Ljava/lang/String;)V

    .line 203
    const/16 v24, -0x1

    move/from16 v0, v24

    invoke-virtual {v8, v0}, Lcom/belkin/rules/dbmigration/RuleDevicesTable;->setDayId(I)V

    .line 204
    const/16 v24, -0x1

    move/from16 v0, v24

    invoke-virtual {v8, v0}, Lcom/belkin/rules/dbmigration/RuleDevicesTable;->setRuleDuration(I)V

    .line 205
    const/16 v24, -0x1

    move/from16 v0, v24

    invoke-virtual {v8, v0}, Lcom/belkin/rules/dbmigration/RuleDevicesTable;->setStarttime(I)V

    .line 206
    const-wide/high16 v24, -0x4010000000000000L    # -1.0

    move-wide/from16 v0, v24

    invoke-virtual {v8, v0, v1}, Lcom/belkin/rules/dbmigration/RuleDevicesTable;->setStartAction(D)V

    .line 207
    const-wide/high16 v24, -0x4010000000000000L    # -1.0

    move-wide/from16 v0, v24

    invoke-virtual {v8, v0, v1}, Lcom/belkin/rules/dbmigration/RuleDevicesTable;->setEndAction(D)V

    .line 208
    const/16 v24, -0x1

    move/from16 v0, v24

    invoke-virtual {v8, v0}, Lcom/belkin/rules/dbmigration/RuleDevicesTable;->setSensorDuration(I)V

    .line 209
    const/16 v24, 0x0

    move/from16 v0, v24

    invoke-virtual {v8, v0}, Lcom/belkin/rules/dbmigration/RuleDevicesTable;->setType(I)V

    .line 210
    const/16 v24, 0x2

    move/from16 v0, v24

    invoke-virtual {v8, v0}, Lcom/belkin/rules/dbmigration/RuleDevicesTable;->setLevel(I)V

    .line 211
    new-instance v24, Ljava/lang/StringBuilder;

    invoke-direct/range {v24 .. v24}, Ljava/lang/StringBuilder;-><init>()V

    const-string v25, ""

    invoke-virtual/range {v24 .. v25}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v24

    invoke-virtual/range {v21 .. v21}, Lcom/belkin/rules/dbmigration/Sensor_1_X;->getSensitivity()Ljava/lang/String;

    move-result-object v25

    move-object/from16 v0, p0

    move-object/from16 v1, v25

    invoke-direct {v0, v1}, Lcom/belkin/rules/dbmigration/SensorDBMigrator;->getValue(Ljava/lang/String;)I

    move-result v25

    invoke-virtual/range {v24 .. v25}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v24

    invoke-virtual/range {v24 .. v24}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v24

    move-object/from16 v0, v24

    invoke-virtual {v8, v0}, Lcom/belkin/rules/dbmigration/RuleDevicesTable;->setValue(Ljava/lang/String;)V

    .line 212
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/rules/dbmigration/SensorDBMigrator;->mRuleDevicesTables:Ljava/util/ArrayList;

    move-object/from16 v24, v0

    move-object/from16 v0, v24

    invoke-virtual {v0, v8}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto/16 :goto_1

    .line 219
    .end local v8    # "devicesTable":Lcom/belkin/rules/dbmigration/RuleDevicesTable;
    .end local v10    # "e1":Ljava/util/Enumeration;, "Ljava/util/Enumeration<Ljava/lang/String;>;"
    .end local v15    # "id":I
    .end local v17    # "ruleHashtable":Ljava/util/Hashtable;, "Ljava/util/Hashtable<Ljava/lang/String;Ljava/util/Vector<Lcom/belkin/rules/dbmigration/Sensor_1_X;>;>;"
    .end local v18    # "ruleTableinsert":Z
    .end local v20    # "sensorVector":Ljava/util/Vector;, "Ljava/util/Vector<Lcom/belkin/rules/dbmigration/Sensor_1_X;>;"
    .end local v21    # "sensor_1_X":Lcom/belkin/rules/dbmigration/Sensor_1_X;
    :cond_a
    :try_start_2
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/rules/dbmigration/SensorDBMigrator;->context:Landroid/content/Context;

    move-object/from16 v24, v0

    invoke-static/range {v24 .. v24}, Lcom/belkin/rules/dbmigration/RuleDatabaseManager;->getInstance(Landroid/content/Context;)Lcom/belkin/rules/dbmigration/RuleDatabaseManager;

    move-result-object v24

    move-object/from16 v0, v24

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/belkin/rules/dbmigration/SensorDBMigrator;->ruleDatabaseManager:Lcom/belkin/rules/dbmigration/RuleDatabaseManager;
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_2

    .line 224
    :goto_8
    new-instance v24, Lcom/belkin/rules/dbmigration/SensorDBMigrator$1;

    move-object/from16 v0, v24

    move-object/from16 v1, p0

    invoke-direct {v0, v1}, Lcom/belkin/rules/dbmigration/SensorDBMigrator$1;-><init>(Lcom/belkin/rules/dbmigration/SensorDBMigrator;)V

    invoke-virtual/range {v24 .. v24}, Lcom/belkin/rules/dbmigration/SensorDBMigrator$1;->start()V

    .line 229
    return-void

    .line 220
    :catch_2
    move-exception v12

    .line 221
    .restart local v12    # "ex":Ljava/lang/Exception;
    invoke-virtual {v12}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_8

    .line 150
    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_1
        :pswitch_2
        :pswitch_3
        :pswitch_4
        :pswitch_5
        :pswitch_6
    .end packed-switch
.end method
