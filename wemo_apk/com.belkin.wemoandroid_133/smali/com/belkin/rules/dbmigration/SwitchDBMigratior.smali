.class public Lcom/belkin/rules/dbmigration/SwitchDBMigratior;
.super Ljava/lang/Object;
.source "SwitchDBMigratior.java"


# instance fields
.field private context:Landroid/content/Context;

.field devicesTable:Lcom/belkin/rules/dbmigration/RuleDevicesTable;

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
            "Ljava/util/Vector;",
            ">;"
        }
    .end annotation
.end field

.field private rules:Lcom/belkin/rules/dbmigration/RulesTable;

.field private switchList:Ljava/util/Vector;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Vector",
            "<",
            "Lcom/belkin/rules/dbmigration/Switch_1_X;",
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
            "Lcom/belkin/rules/dbmigration/Switch_1_X;",
            ">;",
            "Landroid/content/Context;",
            ")V"
        }
    .end annotation

    .prologue
    .line 57
    .local p1, "switchList":Ljava/util/Vector;, "Ljava/util/Vector<Lcom/belkin/rules/dbmigration/Switch_1_X;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 53
    new-instance v0, Ljava/util/Vector;

    invoke-direct {v0}, Ljava/util/Vector;-><init>()V

    iput-object v0, p0, Lcom/belkin/rules/dbmigration/SwitchDBMigratior;->switchList:Ljava/util/Vector;

    .line 54
    new-instance v0, Ljava/util/Hashtable;

    invoke-direct {v0}, Ljava/util/Hashtable;-><init>()V

    iput-object v0, p0, Lcom/belkin/rules/dbmigration/SwitchDBMigratior;->ruleHash:Ljava/util/Hashtable;

    .line 58
    iput-object p1, p0, Lcom/belkin/rules/dbmigration/SwitchDBMigratior;->switchList:Ljava/util/Vector;

    .line 59
    iput-object p2, p0, Lcom/belkin/rules/dbmigration/SwitchDBMigratior;->context:Landroid/content/Context;

    .line 60
    return-void
.end method

.method static synthetic access$000(Lcom/belkin/rules/dbmigration/SwitchDBMigratior;)V
    .locals 0
    .param p0, "x0"    # Lcom/belkin/rules/dbmigration/SwitchDBMigratior;

    .prologue
    .line 51
    invoke-direct {p0}, Lcom/belkin/rules/dbmigration/SwitchDBMigratior;->insertInToDataBase()V

    return-void
.end method

.method private getActiveDays(Lcom/belkin/rules/dbmigration/Switch_1_X;)Ljava/util/Vector;
    .locals 3
    .param p1, "switch_1_X"    # Lcom/belkin/rules/dbmigration/Switch_1_X;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/belkin/rules/dbmigration/Switch_1_X;",
            ")",
            "Ljava/util/Vector",
            "<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation

    .prologue
    .line 188
    new-instance v0, Ljava/util/Vector;

    invoke-direct {v0}, Ljava/util/Vector;-><init>()V

    .line 189
    .local v0, "strings":Ljava/util/Vector;, "Ljava/util/Vector<Ljava/lang/Integer;>;"
    invoke-virtual {p1}, Lcom/belkin/rules/dbmigration/Switch_1_X;->getSun()Ljava/lang/String;

    move-result-object v1

    if-eqz v1, :cond_0

    invoke-virtual {p1}, Lcom/belkin/rules/dbmigration/Switch_1_X;->getSun()Ljava/lang/String;

    move-result-object v1

    const-string v2, ""

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_0

    .line 190
    const/4 v1, 0x1

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/Vector;->add(Ljava/lang/Object;)Z

    .line 191
    :cond_0
    invoke-virtual {p1}, Lcom/belkin/rules/dbmigration/Switch_1_X;->getMon()Ljava/lang/String;

    move-result-object v1

    if-eqz v1, :cond_1

    invoke-virtual {p1}, Lcom/belkin/rules/dbmigration/Switch_1_X;->getMon()Ljava/lang/String;

    move-result-object v1

    const-string v2, ""

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_1

    .line 192
    const/4 v1, 0x2

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/Vector;->add(Ljava/lang/Object;)Z

    .line 193
    :cond_1
    invoke-virtual {p1}, Lcom/belkin/rules/dbmigration/Switch_1_X;->getTue()Ljava/lang/String;

    move-result-object v1

    if-eqz v1, :cond_2

    invoke-virtual {p1}, Lcom/belkin/rules/dbmigration/Switch_1_X;->getTue()Ljava/lang/String;

    move-result-object v1

    const-string v2, ""

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_2

    .line 194
    const/4 v1, 0x3

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/Vector;->add(Ljava/lang/Object;)Z

    .line 195
    :cond_2
    invoke-virtual {p1}, Lcom/belkin/rules/dbmigration/Switch_1_X;->getWed()Ljava/lang/String;

    move-result-object v1

    if-eqz v1, :cond_3

    invoke-virtual {p1}, Lcom/belkin/rules/dbmigration/Switch_1_X;->getWed()Ljava/lang/String;

    move-result-object v1

    const-string v2, ""

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_3

    .line 196
    const/4 v1, 0x4

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/Vector;->add(Ljava/lang/Object;)Z

    .line 197
    :cond_3
    invoke-virtual {p1}, Lcom/belkin/rules/dbmigration/Switch_1_X;->getThu()Ljava/lang/String;

    move-result-object v1

    if-eqz v1, :cond_4

    invoke-virtual {p1}, Lcom/belkin/rules/dbmigration/Switch_1_X;->getThu()Ljava/lang/String;

    move-result-object v1

    const-string v2, ""

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_4

    .line 198
    const/4 v1, 0x5

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/Vector;->add(Ljava/lang/Object;)Z

    .line 199
    :cond_4
    invoke-virtual {p1}, Lcom/belkin/rules/dbmigration/Switch_1_X;->getFri()Ljava/lang/String;

    move-result-object v1

    if-eqz v1, :cond_5

    invoke-virtual {p1}, Lcom/belkin/rules/dbmigration/Switch_1_X;->getFri()Ljava/lang/String;

    move-result-object v1

    const-string v2, ""

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_5

    .line 200
    const/4 v1, 0x6

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/Vector;->add(Ljava/lang/Object;)Z

    .line 201
    :cond_5
    invoke-virtual {p1}, Lcom/belkin/rules/dbmigration/Switch_1_X;->getSat()Ljava/lang/String;

    move-result-object v1

    if-eqz v1, :cond_6

    invoke-virtual {p1}, Lcom/belkin/rules/dbmigration/Switch_1_X;->getSat()Ljava/lang/String;

    move-result-object v1

    const-string v2, ""

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_6

    .line 202
    const/4 v1, 0x7

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/Vector;->add(Ljava/lang/Object;)Z

    .line 203
    :cond_6
    return-object v0
.end method

.method private getConveratedEndTime(Ljava/lang/String;)I
    .locals 8
    .param p1, "time"    # Ljava/lang/String;

    .prologue
    const/4 v5, 0x0

    .line 333
    :try_start_0
    const-string v6, "\\|"

    invoke-virtual {p1, v6}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v4

    .line 335
    .local v4, "startEndTime":[Ljava/lang/String;
    const/4 v6, 0x1

    aget-object v6, v4, v6

    const-string v7, ","

    invoke-virtual {v6, v7}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v6

    const/4 v7, 0x0

    aget-object v1, v6, v7

    .line 336
    .local v1, "endTime":Ljava/lang/String;
    const/4 v6, 0x0

    const-string v7, ":"

    invoke-virtual {v1, v7}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v7

    invoke-virtual {v1, v6, v7}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v6

    invoke-static {v6}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v2

    .line 338
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

    .line 341
    .local v3, "minute":I
    mul-int/lit8 v5, v2, 0x3c

    mul-int/lit8 v5, v5, 0x3c

    mul-int/lit8 v6, v3, 0x3c

    add-int/2addr v5, v6

    .line 343
    .end local v1    # "endTime":Ljava/lang/String;
    .end local v2    # "hour":I
    .end local v3    # "minute":I
    .end local v4    # "startEndTime":[Ljava/lang/String;
    :goto_0
    return v5

    .line 342
    :catch_0
    move-exception v0

    .line 343
    .local v0, "e":Ljava/lang/Exception;
    goto :goto_0
.end method

.method private getConveratedTime(Ljava/lang/String;)I
    .locals 7
    .param p1, "time"    # Ljava/lang/String;

    .prologue
    const/4 v6, 0x0

    .line 377
    const-string v4, "\\|"

    invoke-virtual {p1, v4}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v2

    .line 379
    .local v2, "startEndTime":[Ljava/lang/String;
    aget-object v4, v2, v6

    const-string v5, ","

    invoke-virtual {v4, v5}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v4

    aget-object v3, v4, v6

    .line 380
    .local v3, "startTime":Ljava/lang/String;
    const-string v4, ":"

    invoke-virtual {v3, v4}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v4

    invoke-virtual {v3, v6, v4}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v0

    .line 382
    .local v0, "hour":I
    const-string v4, ":"

    invoke-virtual {v3, v4}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v4

    add-int/lit8 v4, v4, 0x1

    invoke-virtual {v3, v4}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v1

    .line 385
    .local v1, "minute":I
    mul-int/lit8 v4, v0, 0x3c

    mul-int/lit8 v4, v4, 0x3c

    mul-int/lit8 v5, v1, 0x3c

    add-int/2addr v4, v5

    return v4
.end method

.method private getDayId(Lcom/belkin/rules/dbmigration/Switch_1_X;)I
    .locals 1
    .param p1, "switch_1_X"    # Lcom/belkin/rules/dbmigration/Switch_1_X;

    .prologue
    .line 389
    invoke-direct {p0, p1}, Lcom/belkin/rules/dbmigration/SwitchDBMigratior;->isEveryDay(Lcom/belkin/rules/dbmigration/Switch_1_X;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 390
    const/4 v0, 0x0

    .line 408
    :goto_0
    return v0

    .line 391
    :cond_0
    invoke-direct {p0, p1}, Lcom/belkin/rules/dbmigration/SwitchDBMigratior;->isSunday(Lcom/belkin/rules/dbmigration/Switch_1_X;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 392
    const/4 v0, 0x1

    goto :goto_0

    .line 393
    :cond_1
    invoke-direct {p0, p1}, Lcom/belkin/rules/dbmigration/SwitchDBMigratior;->isMonday(Lcom/belkin/rules/dbmigration/Switch_1_X;)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 394
    const/4 v0, 0x2

    goto :goto_0

    .line 395
    :cond_2
    invoke-direct {p0, p1}, Lcom/belkin/rules/dbmigration/SwitchDBMigratior;->isTuesday(Lcom/belkin/rules/dbmigration/Switch_1_X;)Z

    move-result v0

    if-eqz v0, :cond_3

    .line 396
    const/4 v0, 0x3

    goto :goto_0

    .line 397
    :cond_3
    invoke-direct {p0, p1}, Lcom/belkin/rules/dbmigration/SwitchDBMigratior;->isWednesDay(Lcom/belkin/rules/dbmigration/Switch_1_X;)Z

    move-result v0

    if-eqz v0, :cond_4

    .line 398
    const/4 v0, 0x4

    goto :goto_0

    .line 399
    :cond_4
    invoke-direct {p0, p1}, Lcom/belkin/rules/dbmigration/SwitchDBMigratior;->isThusDay(Lcom/belkin/rules/dbmigration/Switch_1_X;)Z

    move-result v0

    if-eqz v0, :cond_5

    .line 400
    const/4 v0, 0x5

    goto :goto_0

    .line 401
    :cond_5
    invoke-direct {p0, p1}, Lcom/belkin/rules/dbmigration/SwitchDBMigratior;->isFriDay(Lcom/belkin/rules/dbmigration/Switch_1_X;)Z

    move-result v0

    if-eqz v0, :cond_6

    .line 402
    const/4 v0, 0x6

    goto :goto_0

    .line 403
    :cond_6
    invoke-direct {p0, p1}, Lcom/belkin/rules/dbmigration/SwitchDBMigratior;->isSaturDay(Lcom/belkin/rules/dbmigration/Switch_1_X;)Z

    move-result v0

    if-eqz v0, :cond_7

    .line 404
    const/4 v0, 0x7

    goto :goto_0

    .line 405
    :cond_7
    invoke-direct {p0, p1}, Lcom/belkin/rules/dbmigration/SwitchDBMigratior;->isWeekDay(Lcom/belkin/rules/dbmigration/Switch_1_X;)Z

    move-result v0

    if-eqz v0, :cond_8

    .line 406
    const/16 v0, 0x8

    goto :goto_0

    .line 408
    :cond_8
    const/4 v0, -0x1

    goto :goto_0
.end method

.method private getEndAction(Ljava/lang/String;)D
    .locals 7
    .param p1, "time"    # Ljava/lang/String;

    .prologue
    const-wide/high16 v4, 0x4000000000000000L    # 2.0

    .line 236
    :try_start_0
    const-string v3, "\\|"

    invoke-virtual {p1, v3}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v2

    .line 237
    .local v2, "startEndTime":[Ljava/lang/String;
    const/4 v3, 0x1

    aget-object v3, v2, v3

    const-string v6, ","

    invoke-virtual {v3, v6}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v3

    const/4 v6, 0x1

    aget-object v1, v3, v6

    .line 238
    .local v1, "endTime":Ljava/lang/String;
    invoke-virtual {v1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v3

    const-string v6, "1"

    invoke-virtual {v3, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_1

    .line 239
    const-wide/high16 v4, 0x3ff0000000000000L    # 1.0

    .line 245
    .end local v1    # "endTime":Ljava/lang/String;
    .end local v2    # "startEndTime":[Ljava/lang/String;
    :cond_0
    :goto_0
    return-wide v4

    .line 240
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

    .line 241
    const-wide/16 v4, 0x0

    goto :goto_0

    .line 244
    .end local v1    # "endTime":Ljava/lang/String;
    .end local v2    # "startEndTime":[Ljava/lang/String;
    :catch_0
    move-exception v0

    .line 245
    .local v0, "e":Ljava/lang/Exception;
    goto :goto_0
.end method

.method private getEndTime(Lcom/belkin/rules/dbmigration/Switch_1_X;)I
    .locals 1
    .param p1, "switch_1_X"    # Lcom/belkin/rules/dbmigration/Switch_1_X;

    .prologue
    .line 303
    invoke-direct {p0, p1}, Lcom/belkin/rules/dbmigration/SwitchDBMigratior;->getDayId(Lcom/belkin/rules/dbmigration/Switch_1_X;)I

    move-result v0

    packed-switch v0, :pswitch_data_0

    .line 326
    const/4 v0, 0x0

    :goto_0
    return v0

    .line 305
    :pswitch_0
    invoke-virtual {p1}, Lcom/belkin/rules/dbmigration/Switch_1_X;->getSun()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/belkin/rules/dbmigration/SwitchDBMigratior;->getConveratedEndTime(Ljava/lang/String;)I

    move-result v0

    goto :goto_0

    .line 307
    :pswitch_1
    invoke-virtual {p1}, Lcom/belkin/rules/dbmigration/Switch_1_X;->getSun()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/belkin/rules/dbmigration/SwitchDBMigratior;->getConveratedEndTime(Ljava/lang/String;)I

    move-result v0

    goto :goto_0

    .line 309
    :pswitch_2
    invoke-virtual {p1}, Lcom/belkin/rules/dbmigration/Switch_1_X;->getMon()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/belkin/rules/dbmigration/SwitchDBMigratior;->getConveratedEndTime(Ljava/lang/String;)I

    move-result v0

    goto :goto_0

    .line 311
    :pswitch_3
    invoke-virtual {p1}, Lcom/belkin/rules/dbmigration/Switch_1_X;->getTue()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/belkin/rules/dbmigration/SwitchDBMigratior;->getConveratedEndTime(Ljava/lang/String;)I

    move-result v0

    goto :goto_0

    .line 313
    :pswitch_4
    invoke-virtual {p1}, Lcom/belkin/rules/dbmigration/Switch_1_X;->getWed()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/belkin/rules/dbmigration/SwitchDBMigratior;->getConveratedEndTime(Ljava/lang/String;)I

    move-result v0

    goto :goto_0

    .line 315
    :pswitch_5
    invoke-virtual {p1}, Lcom/belkin/rules/dbmigration/Switch_1_X;->getThu()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/belkin/rules/dbmigration/SwitchDBMigratior;->getConveratedEndTime(Ljava/lang/String;)I

    move-result v0

    goto :goto_0

    .line 317
    :pswitch_6
    invoke-virtual {p1}, Lcom/belkin/rules/dbmigration/Switch_1_X;->getFri()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/belkin/rules/dbmigration/SwitchDBMigratior;->getConveratedEndTime(Ljava/lang/String;)I

    move-result v0

    goto :goto_0

    .line 319
    :pswitch_7
    invoke-virtual {p1}, Lcom/belkin/rules/dbmigration/Switch_1_X;->getSat()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/belkin/rules/dbmigration/SwitchDBMigratior;->getConveratedEndTime(Ljava/lang/String;)I

    move-result v0

    goto :goto_0

    .line 321
    :pswitch_8
    invoke-virtual {p1}, Lcom/belkin/rules/dbmigration/Switch_1_X;->getMon()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/belkin/rules/dbmigration/SwitchDBMigratior;->getConveratedEndTime(Ljava/lang/String;)I

    move-result v0

    goto :goto_0

    .line 323
    :pswitch_9
    invoke-virtual {p1}, Lcom/belkin/rules/dbmigration/Switch_1_X;->getSun()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/belkin/rules/dbmigration/SwitchDBMigratior;->getConveratedEndTime(Ljava/lang/String;)I

    move-result v0

    goto :goto_0

    .line 303
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

.method private getRuleDuration(Lcom/belkin/rules/dbmigration/Switch_1_X;)I
    .locals 3
    .param p1, "switch_1_X"    # Lcom/belkin/rules/dbmigration/Switch_1_X;

    .prologue
    .line 294
    invoke-direct {p0, p1}, Lcom/belkin/rules/dbmigration/SwitchDBMigratior;->getStartTime(Lcom/belkin/rules/dbmigration/Switch_1_X;)I

    move-result v1

    .line 295
    .local v1, "startTime":I
    invoke-direct {p0, p1}, Lcom/belkin/rules/dbmigration/SwitchDBMigratior;->getEndTime(Lcom/belkin/rules/dbmigration/Switch_1_X;)I

    move-result v0

    .line 296
    .local v0, "endTime":I
    if-lez v0, :cond_0

    .line 297
    sub-int v2, v0, v1

    .line 299
    :goto_0
    return v2

    :cond_0
    const/4 v2, 0x0

    goto :goto_0
.end method

.method private getRuleEndAction(Lcom/belkin/rules/dbmigration/Switch_1_X;)D
    .locals 2
    .param p1, "switch_1_X"    # Lcom/belkin/rules/dbmigration/Switch_1_X;

    .prologue
    .line 207
    invoke-direct {p0, p1}, Lcom/belkin/rules/dbmigration/SwitchDBMigratior;->getDayId(Lcom/belkin/rules/dbmigration/Switch_1_X;)I

    move-result v0

    packed-switch v0, :pswitch_data_0

    .line 230
    const-wide/16 v0, 0x0

    :goto_0
    return-wide v0

    .line 209
    :pswitch_0
    invoke-virtual {p1}, Lcom/belkin/rules/dbmigration/Switch_1_X;->getSun()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/belkin/rules/dbmigration/SwitchDBMigratior;->getEndAction(Ljava/lang/String;)D

    move-result-wide v0

    goto :goto_0

    .line 211
    :pswitch_1
    invoke-virtual {p1}, Lcom/belkin/rules/dbmigration/Switch_1_X;->getSun()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/belkin/rules/dbmigration/SwitchDBMigratior;->getEndAction(Ljava/lang/String;)D

    move-result-wide v0

    goto :goto_0

    .line 213
    :pswitch_2
    invoke-virtual {p1}, Lcom/belkin/rules/dbmigration/Switch_1_X;->getMon()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/belkin/rules/dbmigration/SwitchDBMigratior;->getStartAction(Ljava/lang/String;)D

    move-result-wide v0

    goto :goto_0

    .line 215
    :pswitch_3
    invoke-virtual {p1}, Lcom/belkin/rules/dbmigration/Switch_1_X;->getTue()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/belkin/rules/dbmigration/SwitchDBMigratior;->getEndAction(Ljava/lang/String;)D

    move-result-wide v0

    goto :goto_0

    .line 217
    :pswitch_4
    invoke-virtual {p1}, Lcom/belkin/rules/dbmigration/Switch_1_X;->getWed()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/belkin/rules/dbmigration/SwitchDBMigratior;->getEndAction(Ljava/lang/String;)D

    move-result-wide v0

    goto :goto_0

    .line 219
    :pswitch_5
    invoke-virtual {p1}, Lcom/belkin/rules/dbmigration/Switch_1_X;->getThu()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/belkin/rules/dbmigration/SwitchDBMigratior;->getEndAction(Ljava/lang/String;)D

    move-result-wide v0

    goto :goto_0

    .line 221
    :pswitch_6
    invoke-virtual {p1}, Lcom/belkin/rules/dbmigration/Switch_1_X;->getFri()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/belkin/rules/dbmigration/SwitchDBMigratior;->getEndAction(Ljava/lang/String;)D

    move-result-wide v0

    goto :goto_0

    .line 223
    :pswitch_7
    invoke-virtual {p1}, Lcom/belkin/rules/dbmigration/Switch_1_X;->getSat()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/belkin/rules/dbmigration/SwitchDBMigratior;->getEndAction(Ljava/lang/String;)D

    move-result-wide v0

    goto :goto_0

    .line 225
    :pswitch_8
    invoke-virtual {p1}, Lcom/belkin/rules/dbmigration/Switch_1_X;->getMon()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/belkin/rules/dbmigration/SwitchDBMigratior;->getEndAction(Ljava/lang/String;)D

    move-result-wide v0

    goto :goto_0

    .line 227
    :pswitch_9
    invoke-virtual {p1}, Lcom/belkin/rules/dbmigration/Switch_1_X;->getSun()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/belkin/rules/dbmigration/SwitchDBMigratior;->getEndAction(Ljava/lang/String;)D

    move-result-wide v0

    goto :goto_0

    .line 207
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

.method private getRuleStartAction(Lcom/belkin/rules/dbmigration/Switch_1_X;)D
    .locals 2
    .param p1, "switch_1_X"    # Lcom/belkin/rules/dbmigration/Switch_1_X;

    .prologue
    .line 250
    invoke-direct {p0, p1}, Lcom/belkin/rules/dbmigration/SwitchDBMigratior;->getDayId(Lcom/belkin/rules/dbmigration/Switch_1_X;)I

    move-result v0

    packed-switch v0, :pswitch_data_0

    .line 273
    const-wide/16 v0, 0x0

    :goto_0
    return-wide v0

    .line 252
    :pswitch_0
    invoke-virtual {p1}, Lcom/belkin/rules/dbmigration/Switch_1_X;->getSun()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/belkin/rules/dbmigration/SwitchDBMigratior;->getStartAction(Ljava/lang/String;)D

    move-result-wide v0

    goto :goto_0

    .line 254
    :pswitch_1
    invoke-virtual {p1}, Lcom/belkin/rules/dbmigration/Switch_1_X;->getSun()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/belkin/rules/dbmigration/SwitchDBMigratior;->getStartAction(Ljava/lang/String;)D

    move-result-wide v0

    goto :goto_0

    .line 256
    :pswitch_2
    invoke-virtual {p1}, Lcom/belkin/rules/dbmigration/Switch_1_X;->getMon()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/belkin/rules/dbmigration/SwitchDBMigratior;->getStartAction(Ljava/lang/String;)D

    move-result-wide v0

    goto :goto_0

    .line 258
    :pswitch_3
    invoke-virtual {p1}, Lcom/belkin/rules/dbmigration/Switch_1_X;->getTue()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/belkin/rules/dbmigration/SwitchDBMigratior;->getStartAction(Ljava/lang/String;)D

    move-result-wide v0

    goto :goto_0

    .line 260
    :pswitch_4
    invoke-virtual {p1}, Lcom/belkin/rules/dbmigration/Switch_1_X;->getWed()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/belkin/rules/dbmigration/SwitchDBMigratior;->getStartAction(Ljava/lang/String;)D

    move-result-wide v0

    goto :goto_0

    .line 262
    :pswitch_5
    invoke-virtual {p1}, Lcom/belkin/rules/dbmigration/Switch_1_X;->getThu()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/belkin/rules/dbmigration/SwitchDBMigratior;->getStartAction(Ljava/lang/String;)D

    move-result-wide v0

    goto :goto_0

    .line 264
    :pswitch_6
    invoke-virtual {p1}, Lcom/belkin/rules/dbmigration/Switch_1_X;->getFri()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/belkin/rules/dbmigration/SwitchDBMigratior;->getStartAction(Ljava/lang/String;)D

    move-result-wide v0

    goto :goto_0

    .line 266
    :pswitch_7
    invoke-virtual {p1}, Lcom/belkin/rules/dbmigration/Switch_1_X;->getSat()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/belkin/rules/dbmigration/SwitchDBMigratior;->getStartAction(Ljava/lang/String;)D

    move-result-wide v0

    goto :goto_0

    .line 268
    :pswitch_8
    invoke-virtual {p1}, Lcom/belkin/rules/dbmigration/Switch_1_X;->getMon()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/belkin/rules/dbmigration/SwitchDBMigratior;->getStartAction(Ljava/lang/String;)D

    move-result-wide v0

    goto :goto_0

    .line 270
    :pswitch_9
    invoke-virtual {p1}, Lcom/belkin/rules/dbmigration/Switch_1_X;->getSun()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/belkin/rules/dbmigration/SwitchDBMigratior;->getStartAction(Ljava/lang/String;)D

    move-result-wide v0

    goto :goto_0

    .line 250
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

    .line 279
    :try_start_0
    const-string v3, "\\|"

    invoke-virtual {p1, v3}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v2

    .line 281
    .local v2, "startEndTime":[Ljava/lang/String;
    const/4 v3, 0x0

    aget-object v3, v2, v3

    const-string v6, ","

    invoke-virtual {v3, v6}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v3

    const/4 v6, 0x1

    aget-object v1, v3, v6

    .line 282
    .local v1, "endTime":Ljava/lang/String;
    invoke-virtual {v1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v3

    const-string v6, "1"

    invoke-virtual {v3, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_1

    .line 283
    const-wide/high16 v4, 0x3ff0000000000000L    # 1.0

    .line 289
    .end local v1    # "endTime":Ljava/lang/String;
    .end local v2    # "startEndTime":[Ljava/lang/String;
    :cond_0
    :goto_0
    return-wide v4

    .line 284
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

    .line 285
    const-wide/16 v4, 0x0

    goto :goto_0

    .line 288
    .end local v1    # "endTime":Ljava/lang/String;
    .end local v2    # "startEndTime":[Ljava/lang/String;
    :catch_0
    move-exception v0

    .line 289
    .local v0, "e":Ljava/lang/Exception;
    goto :goto_0
.end method

.method private getStartTime(Lcom/belkin/rules/dbmigration/Switch_1_X;)I
    .locals 1
    .param p1, "switch_1_X"    # Lcom/belkin/rules/dbmigration/Switch_1_X;

    .prologue
    .line 348
    invoke-direct {p0, p1}, Lcom/belkin/rules/dbmigration/SwitchDBMigratior;->getDayId(Lcom/belkin/rules/dbmigration/Switch_1_X;)I

    move-result v0

    packed-switch v0, :pswitch_data_0

    .line 371
    const/4 v0, 0x0

    :goto_0
    return v0

    .line 350
    :pswitch_0
    invoke-virtual {p1}, Lcom/belkin/rules/dbmigration/Switch_1_X;->getSun()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/belkin/rules/dbmigration/SwitchDBMigratior;->getConveratedTime(Ljava/lang/String;)I

    move-result v0

    goto :goto_0

    .line 352
    :pswitch_1
    invoke-virtual {p1}, Lcom/belkin/rules/dbmigration/Switch_1_X;->getSun()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/belkin/rules/dbmigration/SwitchDBMigratior;->getConveratedTime(Ljava/lang/String;)I

    move-result v0

    goto :goto_0

    .line 354
    :pswitch_2
    invoke-virtual {p1}, Lcom/belkin/rules/dbmigration/Switch_1_X;->getMon()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/belkin/rules/dbmigration/SwitchDBMigratior;->getConveratedTime(Ljava/lang/String;)I

    move-result v0

    goto :goto_0

    .line 356
    :pswitch_3
    invoke-virtual {p1}, Lcom/belkin/rules/dbmigration/Switch_1_X;->getTue()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/belkin/rules/dbmigration/SwitchDBMigratior;->getConveratedTime(Ljava/lang/String;)I

    move-result v0

    goto :goto_0

    .line 358
    :pswitch_4
    invoke-virtual {p1}, Lcom/belkin/rules/dbmigration/Switch_1_X;->getWed()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/belkin/rules/dbmigration/SwitchDBMigratior;->getConveratedTime(Ljava/lang/String;)I

    move-result v0

    goto :goto_0

    .line 360
    :pswitch_5
    invoke-virtual {p1}, Lcom/belkin/rules/dbmigration/Switch_1_X;->getThu()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/belkin/rules/dbmigration/SwitchDBMigratior;->getConveratedTime(Ljava/lang/String;)I

    move-result v0

    goto :goto_0

    .line 362
    :pswitch_6
    invoke-virtual {p1}, Lcom/belkin/rules/dbmigration/Switch_1_X;->getFri()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/belkin/rules/dbmigration/SwitchDBMigratior;->getConveratedTime(Ljava/lang/String;)I

    move-result v0

    goto :goto_0

    .line 364
    :pswitch_7
    invoke-virtual {p1}, Lcom/belkin/rules/dbmigration/Switch_1_X;->getSat()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/belkin/rules/dbmigration/SwitchDBMigratior;->getConveratedTime(Ljava/lang/String;)I

    move-result v0

    goto :goto_0

    .line 366
    :pswitch_8
    invoke-virtual {p1}, Lcom/belkin/rules/dbmigration/Switch_1_X;->getMon()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/belkin/rules/dbmigration/SwitchDBMigratior;->getConveratedTime(Ljava/lang/String;)I

    move-result v0

    goto :goto_0

    .line 368
    :pswitch_9
    invoke-virtual {p1}, Lcom/belkin/rules/dbmigration/Switch_1_X;->getSun()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/belkin/rules/dbmigration/SwitchDBMigratior;->getConveratedTime(Ljava/lang/String;)I

    move-result v0

    goto :goto_0

    .line 348
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

.method private insertInToDataBase()V
    .locals 6

    .prologue
    .line 627
    iget-object v2, p0, Lcom/belkin/rules/dbmigration/SwitchDBMigratior;->ruleDatabaseManager:Lcom/belkin/rules/dbmigration/RuleDatabaseManager;

    iget-object v3, p0, Lcom/belkin/rules/dbmigration/SwitchDBMigratior;->mRulesTables:Ljava/util/ArrayList;

    iget-object v4, p0, Lcom/belkin/rules/dbmigration/SwitchDBMigratior;->mRuleDevicesTables:Ljava/util/ArrayList;

    iget-object v5, p0, Lcom/belkin/rules/dbmigration/SwitchDBMigratior;->mDeviceCombinationTables:Ljava/util/ArrayList;

    invoke-virtual {v2, v3, v4, v5}, Lcom/belkin/rules/dbmigration/RuleDatabaseManager;->insert(Ljava/util/ArrayList;Ljava/util/ArrayList;Ljava/util/ArrayList;)Z

    .line 628
    new-instance v1, Lcom/belkin/utils/RuleUtility;

    iget-object v2, p0, Lcom/belkin/rules/dbmigration/SwitchDBMigratior;->context:Landroid/content/Context;

    invoke-direct {v1, v2}, Lcom/belkin/utils/RuleUtility;-><init>(Landroid/content/Context;)V

    .line 629
    .local v1, "ruleUtility":Lcom/belkin/utils/RuleUtility;
    new-instance v0, Lcom/belkin/wemo/cache/utils/MoreUtil;

    invoke-direct {v0}, Lcom/belkin/wemo/cache/utils/MoreUtil;-><init>()V

    .line 630
    .local v0, "moreUtil":Lcom/belkin/wemo/cache/utils/MoreUtil;
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "/data/data/"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p0, Lcom/belkin/rules/dbmigration/SwitchDBMigratior;->context:Landroid/content/Context;

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

    .line 632
    return-void
.end method

.method private isEveryDay(Lcom/belkin/rules/dbmigration/Switch_1_X;)Z
    .locals 3
    .param p1, "switch_1_X"    # Lcom/belkin/rules/dbmigration/Switch_1_X;

    .prologue
    const/4 v0, 0x0

    .line 418
    invoke-virtual {p1}, Lcom/belkin/rules/dbmigration/Switch_1_X;->getSun()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v1

    if-eqz v1, :cond_0

    .line 419
    invoke-virtual {p1}, Lcom/belkin/rules/dbmigration/Switch_1_X;->getSun()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1}, Lcom/belkin/rules/dbmigration/Switch_1_X;->getMon()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-virtual {p1}, Lcom/belkin/rules/dbmigration/Switch_1_X;->getSun()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1}, Lcom/belkin/rules/dbmigration/Switch_1_X;->getTue()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-virtual {p1}, Lcom/belkin/rules/dbmigration/Switch_1_X;->getSun()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1}, Lcom/belkin/rules/dbmigration/Switch_1_X;->getWed()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-virtual {p1}, Lcom/belkin/rules/dbmigration/Switch_1_X;->getSun()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1}, Lcom/belkin/rules/dbmigration/Switch_1_X;->getThu()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-virtual {p1}, Lcom/belkin/rules/dbmigration/Switch_1_X;->getSun()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1}, Lcom/belkin/rules/dbmigration/Switch_1_X;->getFri()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-virtual {p1}, Lcom/belkin/rules/dbmigration/Switch_1_X;->getSun()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1}, Lcom/belkin/rules/dbmigration/Switch_1_X;->getSat()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 425
    const/4 v0, 0x1

    .line 429
    :cond_0
    return v0
.end method

.method private isFriDay(Lcom/belkin/rules/dbmigration/Switch_1_X;)Z
    .locals 4
    .param p1, "switch_1_X"    # Lcom/belkin/rules/dbmigration/Switch_1_X;

    .prologue
    const/4 v0, 0x1

    const/4 v1, 0x0

    .line 544
    invoke-virtual {p1}, Lcom/belkin/rules/dbmigration/Switch_1_X;->getFri()Ljava/lang/String;

    move-result-object v2

    if-eqz v2, :cond_3

    invoke-virtual {p1}, Lcom/belkin/rules/dbmigration/Switch_1_X;->getFri()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v2

    if-eqz v2, :cond_3

    .line 545
    invoke-virtual {p1}, Lcom/belkin/rules/dbmigration/Switch_1_X;->getSun()Ljava/lang/String;

    move-result-object v2

    const-string v3, ""

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-virtual {p1}, Lcom/belkin/rules/dbmigration/Switch_1_X;->getMon()Ljava/lang/String;

    move-result-object v2

    const-string v3, ""

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-virtual {p1}, Lcom/belkin/rules/dbmigration/Switch_1_X;->getTue()Ljava/lang/String;

    move-result-object v2

    const-string v3, ""

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-virtual {p1}, Lcom/belkin/rules/dbmigration/Switch_1_X;->getWed()Ljava/lang/String;

    move-result-object v2

    const-string v3, ""

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-virtual {p1}, Lcom/belkin/rules/dbmigration/Switch_1_X;->getThu()Ljava/lang/String;

    move-result-object v2

    const-string v3, ""

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-virtual {p1}, Lcom/belkin/rules/dbmigration/Switch_1_X;->getSat()Ljava/lang/String;

    move-result-object v2

    const-string v3, ""

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 562
    :cond_0
    :goto_0
    return v0

    .line 552
    :cond_1
    invoke-virtual {p1}, Lcom/belkin/rules/dbmigration/Switch_1_X;->getSun()Ljava/lang/String;

    move-result-object v2

    if-nez v2, :cond_2

    invoke-virtual {p1}, Lcom/belkin/rules/dbmigration/Switch_1_X;->getMon()Ljava/lang/String;

    move-result-object v2

    if-nez v2, :cond_2

    invoke-virtual {p1}, Lcom/belkin/rules/dbmigration/Switch_1_X;->getTue()Ljava/lang/String;

    move-result-object v2

    if-nez v2, :cond_2

    invoke-virtual {p1}, Lcom/belkin/rules/dbmigration/Switch_1_X;->getWed()Ljava/lang/String;

    move-result-object v2

    if-nez v2, :cond_2

    invoke-virtual {p1}, Lcom/belkin/rules/dbmigration/Switch_1_X;->getThu()Ljava/lang/String;

    move-result-object v2

    if-nez v2, :cond_2

    invoke-virtual {p1}, Lcom/belkin/rules/dbmigration/Switch_1_X;->getSat()Ljava/lang/String;

    move-result-object v2

    if-eqz v2, :cond_0

    :cond_2
    move v0, v1

    .line 560
    goto :goto_0

    :cond_3
    move v0, v1

    .line 562
    goto :goto_0
.end method

.method private isMonday(Lcom/belkin/rules/dbmigration/Switch_1_X;)Z
    .locals 4
    .param p1, "switch_1_X"    # Lcom/belkin/rules/dbmigration/Switch_1_X;

    .prologue
    const/4 v0, 0x1

    const/4 v1, 0x0

    .line 456
    invoke-virtual {p1}, Lcom/belkin/rules/dbmigration/Switch_1_X;->getMon()Ljava/lang/String;

    move-result-object v2

    if-eqz v2, :cond_3

    invoke-virtual {p1}, Lcom/belkin/rules/dbmigration/Switch_1_X;->getMon()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v2

    if-eqz v2, :cond_3

    .line 457
    invoke-virtual {p1}, Lcom/belkin/rules/dbmigration/Switch_1_X;->getSun()Ljava/lang/String;

    move-result-object v2

    const-string v3, ""

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-virtual {p1}, Lcom/belkin/rules/dbmigration/Switch_1_X;->getTue()Ljava/lang/String;

    move-result-object v2

    const-string v3, ""

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-virtual {p1}, Lcom/belkin/rules/dbmigration/Switch_1_X;->getWed()Ljava/lang/String;

    move-result-object v2

    const-string v3, ""

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-virtual {p1}, Lcom/belkin/rules/dbmigration/Switch_1_X;->getThu()Ljava/lang/String;

    move-result-object v2

    const-string v3, ""

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-virtual {p1}, Lcom/belkin/rules/dbmigration/Switch_1_X;->getFri()Ljava/lang/String;

    move-result-object v2

    const-string v3, ""

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-virtual {p1}, Lcom/belkin/rules/dbmigration/Switch_1_X;->getSat()Ljava/lang/String;

    move-result-object v2

    const-string v3, ""

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 474
    :cond_0
    :goto_0
    return v0

    .line 464
    :cond_1
    invoke-virtual {p1}, Lcom/belkin/rules/dbmigration/Switch_1_X;->getSun()Ljava/lang/String;

    move-result-object v2

    if-nez v2, :cond_2

    invoke-virtual {p1}, Lcom/belkin/rules/dbmigration/Switch_1_X;->getTue()Ljava/lang/String;

    move-result-object v2

    if-nez v2, :cond_2

    invoke-virtual {p1}, Lcom/belkin/rules/dbmigration/Switch_1_X;->getWed()Ljava/lang/String;

    move-result-object v2

    if-nez v2, :cond_2

    invoke-virtual {p1}, Lcom/belkin/rules/dbmigration/Switch_1_X;->getThu()Ljava/lang/String;

    move-result-object v2

    if-nez v2, :cond_2

    invoke-virtual {p1}, Lcom/belkin/rules/dbmigration/Switch_1_X;->getFri()Ljava/lang/String;

    move-result-object v2

    if-nez v2, :cond_2

    invoke-virtual {p1}, Lcom/belkin/rules/dbmigration/Switch_1_X;->getSat()Ljava/lang/String;

    move-result-object v2

    if-eqz v2, :cond_0

    :cond_2
    move v0, v1

    .line 472
    goto :goto_0

    :cond_3
    move v0, v1

    .line 474
    goto :goto_0
.end method

.method private isSaturDay(Lcom/belkin/rules/dbmigration/Switch_1_X;)Z
    .locals 4
    .param p1, "switch_1_X"    # Lcom/belkin/rules/dbmigration/Switch_1_X;

    .prologue
    const/4 v0, 0x1

    const/4 v1, 0x0

    .line 566
    invoke-virtual {p1}, Lcom/belkin/rules/dbmigration/Switch_1_X;->getSat()Ljava/lang/String;

    move-result-object v2

    if-eqz v2, :cond_3

    invoke-virtual {p1}, Lcom/belkin/rules/dbmigration/Switch_1_X;->getSat()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v2

    if-eqz v2, :cond_3

    .line 567
    invoke-virtual {p1}, Lcom/belkin/rules/dbmigration/Switch_1_X;->getSun()Ljava/lang/String;

    move-result-object v2

    const-string v3, ""

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-virtual {p1}, Lcom/belkin/rules/dbmigration/Switch_1_X;->getMon()Ljava/lang/String;

    move-result-object v2

    const-string v3, ""

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-virtual {p1}, Lcom/belkin/rules/dbmigration/Switch_1_X;->getTue()Ljava/lang/String;

    move-result-object v2

    const-string v3, ""

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-virtual {p1}, Lcom/belkin/rules/dbmigration/Switch_1_X;->getWed()Ljava/lang/String;

    move-result-object v2

    const-string v3, ""

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-virtual {p1}, Lcom/belkin/rules/dbmigration/Switch_1_X;->getThu()Ljava/lang/String;

    move-result-object v2

    const-string v3, ""

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-virtual {p1}, Lcom/belkin/rules/dbmigration/Switch_1_X;->getFri()Ljava/lang/String;

    move-result-object v2

    const-string v3, ""

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 584
    :cond_0
    :goto_0
    return v0

    .line 574
    :cond_1
    invoke-virtual {p1}, Lcom/belkin/rules/dbmigration/Switch_1_X;->getSun()Ljava/lang/String;

    move-result-object v2

    if-nez v2, :cond_2

    invoke-virtual {p1}, Lcom/belkin/rules/dbmigration/Switch_1_X;->getMon()Ljava/lang/String;

    move-result-object v2

    if-nez v2, :cond_2

    invoke-virtual {p1}, Lcom/belkin/rules/dbmigration/Switch_1_X;->getTue()Ljava/lang/String;

    move-result-object v2

    if-nez v2, :cond_2

    invoke-virtual {p1}, Lcom/belkin/rules/dbmigration/Switch_1_X;->getWed()Ljava/lang/String;

    move-result-object v2

    if-nez v2, :cond_2

    invoke-virtual {p1}, Lcom/belkin/rules/dbmigration/Switch_1_X;->getThu()Ljava/lang/String;

    move-result-object v2

    if-nez v2, :cond_2

    invoke-virtual {p1}, Lcom/belkin/rules/dbmigration/Switch_1_X;->getFri()Ljava/lang/String;

    move-result-object v2

    if-eqz v2, :cond_0

    :cond_2
    move v0, v1

    .line 582
    goto :goto_0

    :cond_3
    move v0, v1

    .line 584
    goto :goto_0
.end method

.method private isSunday(Lcom/belkin/rules/dbmigration/Switch_1_X;)Z
    .locals 4
    .param p1, "switch_1_X"    # Lcom/belkin/rules/dbmigration/Switch_1_X;

    .prologue
    const/4 v0, 0x1

    const/4 v1, 0x0

    .line 433
    invoke-virtual {p1}, Lcom/belkin/rules/dbmigration/Switch_1_X;->getSun()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v2

    if-eqz v2, :cond_3

    .line 434
    invoke-virtual {p1}, Lcom/belkin/rules/dbmigration/Switch_1_X;->getMon()Ljava/lang/String;

    move-result-object v2

    const-string v3, ""

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-virtual {p1}, Lcom/belkin/rules/dbmigration/Switch_1_X;->getTue()Ljava/lang/String;

    move-result-object v2

    const-string v3, ""

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-virtual {p1}, Lcom/belkin/rules/dbmigration/Switch_1_X;->getWed()Ljava/lang/String;

    move-result-object v2

    const-string v3, ""

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-virtual {p1}, Lcom/belkin/rules/dbmigration/Switch_1_X;->getThu()Ljava/lang/String;

    move-result-object v2

    const-string v3, ""

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-virtual {p1}, Lcom/belkin/rules/dbmigration/Switch_1_X;->getFri()Ljava/lang/String;

    move-result-object v2

    const-string v3, ""

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-virtual {p1}, Lcom/belkin/rules/dbmigration/Switch_1_X;->getSat()Ljava/lang/String;

    move-result-object v2

    const-string v3, ""

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 452
    :cond_0
    :goto_0
    return v0

    .line 441
    :cond_1
    invoke-virtual {p1}, Lcom/belkin/rules/dbmigration/Switch_1_X;->getMon()Ljava/lang/String;

    move-result-object v2

    if-nez v2, :cond_2

    invoke-virtual {p1}, Lcom/belkin/rules/dbmigration/Switch_1_X;->getTue()Ljava/lang/String;

    move-result-object v2

    if-nez v2, :cond_2

    invoke-virtual {p1}, Lcom/belkin/rules/dbmigration/Switch_1_X;->getWed()Ljava/lang/String;

    move-result-object v2

    if-nez v2, :cond_2

    invoke-virtual {p1}, Lcom/belkin/rules/dbmigration/Switch_1_X;->getThu()Ljava/lang/String;

    move-result-object v2

    if-nez v2, :cond_2

    invoke-virtual {p1}, Lcom/belkin/rules/dbmigration/Switch_1_X;->getFri()Ljava/lang/String;

    move-result-object v2

    if-nez v2, :cond_2

    invoke-virtual {p1}, Lcom/belkin/rules/dbmigration/Switch_1_X;->getSat()Ljava/lang/String;

    move-result-object v2

    if-eqz v2, :cond_0

    :cond_2
    move v0, v1

    .line 450
    goto :goto_0

    :cond_3
    move v0, v1

    .line 452
    goto :goto_0
.end method

.method private isThusDay(Lcom/belkin/rules/dbmigration/Switch_1_X;)Z
    .locals 4
    .param p1, "switch_1_X"    # Lcom/belkin/rules/dbmigration/Switch_1_X;

    .prologue
    const/4 v0, 0x1

    const/4 v1, 0x0

    .line 522
    invoke-virtual {p1}, Lcom/belkin/rules/dbmigration/Switch_1_X;->getThu()Ljava/lang/String;

    move-result-object v2

    if-eqz v2, :cond_3

    invoke-virtual {p1}, Lcom/belkin/rules/dbmigration/Switch_1_X;->getThu()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v2

    if-eqz v2, :cond_3

    .line 523
    invoke-virtual {p1}, Lcom/belkin/rules/dbmigration/Switch_1_X;->getSun()Ljava/lang/String;

    move-result-object v2

    const-string v3, ""

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-virtual {p1}, Lcom/belkin/rules/dbmigration/Switch_1_X;->getMon()Ljava/lang/String;

    move-result-object v2

    const-string v3, ""

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-virtual {p1}, Lcom/belkin/rules/dbmigration/Switch_1_X;->getTue()Ljava/lang/String;

    move-result-object v2

    const-string v3, ""

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-virtual {p1}, Lcom/belkin/rules/dbmigration/Switch_1_X;->getWed()Ljava/lang/String;

    move-result-object v2

    const-string v3, ""

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-virtual {p1}, Lcom/belkin/rules/dbmigration/Switch_1_X;->getFri()Ljava/lang/String;

    move-result-object v2

    const-string v3, ""

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-virtual {p1}, Lcom/belkin/rules/dbmigration/Switch_1_X;->getSat()Ljava/lang/String;

    move-result-object v2

    const-string v3, ""

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 540
    :cond_0
    :goto_0
    return v0

    .line 530
    :cond_1
    invoke-virtual {p1}, Lcom/belkin/rules/dbmigration/Switch_1_X;->getSun()Ljava/lang/String;

    move-result-object v2

    if-nez v2, :cond_2

    invoke-virtual {p1}, Lcom/belkin/rules/dbmigration/Switch_1_X;->getMon()Ljava/lang/String;

    move-result-object v2

    if-nez v2, :cond_2

    invoke-virtual {p1}, Lcom/belkin/rules/dbmigration/Switch_1_X;->getTue()Ljava/lang/String;

    move-result-object v2

    if-nez v2, :cond_2

    invoke-virtual {p1}, Lcom/belkin/rules/dbmigration/Switch_1_X;->getWed()Ljava/lang/String;

    move-result-object v2

    if-nez v2, :cond_2

    invoke-virtual {p1}, Lcom/belkin/rules/dbmigration/Switch_1_X;->getFri()Ljava/lang/String;

    move-result-object v2

    if-nez v2, :cond_2

    invoke-virtual {p1}, Lcom/belkin/rules/dbmigration/Switch_1_X;->getSat()Ljava/lang/String;

    move-result-object v2

    if-eqz v2, :cond_0

    :cond_2
    move v0, v1

    .line 538
    goto :goto_0

    :cond_3
    move v0, v1

    .line 540
    goto :goto_0
.end method

.method private isTuesday(Lcom/belkin/rules/dbmigration/Switch_1_X;)Z
    .locals 4
    .param p1, "switch_1_X"    # Lcom/belkin/rules/dbmigration/Switch_1_X;

    .prologue
    const/4 v0, 0x1

    const/4 v1, 0x0

    .line 478
    invoke-virtual {p1}, Lcom/belkin/rules/dbmigration/Switch_1_X;->getTue()Ljava/lang/String;

    move-result-object v2

    if-eqz v2, :cond_3

    invoke-virtual {p1}, Lcom/belkin/rules/dbmigration/Switch_1_X;->getTue()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v2

    if-eqz v2, :cond_3

    .line 479
    invoke-virtual {p1}, Lcom/belkin/rules/dbmigration/Switch_1_X;->getSun()Ljava/lang/String;

    move-result-object v2

    const-string v3, ""

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-virtual {p1}, Lcom/belkin/rules/dbmigration/Switch_1_X;->getMon()Ljava/lang/String;

    move-result-object v2

    const-string v3, ""

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-virtual {p1}, Lcom/belkin/rules/dbmigration/Switch_1_X;->getWed()Ljava/lang/String;

    move-result-object v2

    const-string v3, ""

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-virtual {p1}, Lcom/belkin/rules/dbmigration/Switch_1_X;->getThu()Ljava/lang/String;

    move-result-object v2

    const-string v3, ""

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-virtual {p1}, Lcom/belkin/rules/dbmigration/Switch_1_X;->getFri()Ljava/lang/String;

    move-result-object v2

    const-string v3, ""

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-virtual {p1}, Lcom/belkin/rules/dbmigration/Switch_1_X;->getSat()Ljava/lang/String;

    move-result-object v2

    const-string v3, ""

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 496
    :cond_0
    :goto_0
    return v0

    .line 486
    :cond_1
    invoke-virtual {p1}, Lcom/belkin/rules/dbmigration/Switch_1_X;->getSun()Ljava/lang/String;

    move-result-object v2

    if-nez v2, :cond_2

    invoke-virtual {p1}, Lcom/belkin/rules/dbmigration/Switch_1_X;->getMon()Ljava/lang/String;

    move-result-object v2

    if-nez v2, :cond_2

    invoke-virtual {p1}, Lcom/belkin/rules/dbmigration/Switch_1_X;->getWed()Ljava/lang/String;

    move-result-object v2

    if-nez v2, :cond_2

    invoke-virtual {p1}, Lcom/belkin/rules/dbmigration/Switch_1_X;->getThu()Ljava/lang/String;

    move-result-object v2

    if-nez v2, :cond_2

    invoke-virtual {p1}, Lcom/belkin/rules/dbmigration/Switch_1_X;->getFri()Ljava/lang/String;

    move-result-object v2

    if-nez v2, :cond_2

    invoke-virtual {p1}, Lcom/belkin/rules/dbmigration/Switch_1_X;->getSat()Ljava/lang/String;

    move-result-object v2

    if-eqz v2, :cond_0

    :cond_2
    move v0, v1

    .line 494
    goto :goto_0

    :cond_3
    move v0, v1

    .line 496
    goto :goto_0
.end method

.method private isWednesDay(Lcom/belkin/rules/dbmigration/Switch_1_X;)Z
    .locals 4
    .param p1, "switch_1_X"    # Lcom/belkin/rules/dbmigration/Switch_1_X;

    .prologue
    const/4 v0, 0x1

    const/4 v1, 0x0

    .line 500
    invoke-virtual {p1}, Lcom/belkin/rules/dbmigration/Switch_1_X;->getWed()Ljava/lang/String;

    move-result-object v2

    if-eqz v2, :cond_3

    invoke-virtual {p1}, Lcom/belkin/rules/dbmigration/Switch_1_X;->getWed()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v2

    if-eqz v2, :cond_3

    .line 501
    invoke-virtual {p1}, Lcom/belkin/rules/dbmigration/Switch_1_X;->getSun()Ljava/lang/String;

    move-result-object v2

    const-string v3, ""

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-virtual {p1}, Lcom/belkin/rules/dbmigration/Switch_1_X;->getMon()Ljava/lang/String;

    move-result-object v2

    const-string v3, ""

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-virtual {p1}, Lcom/belkin/rules/dbmigration/Switch_1_X;->getTue()Ljava/lang/String;

    move-result-object v2

    const-string v3, ""

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-virtual {p1}, Lcom/belkin/rules/dbmigration/Switch_1_X;->getThu()Ljava/lang/String;

    move-result-object v2

    const-string v3, ""

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-virtual {p1}, Lcom/belkin/rules/dbmigration/Switch_1_X;->getFri()Ljava/lang/String;

    move-result-object v2

    const-string v3, ""

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-virtual {p1}, Lcom/belkin/rules/dbmigration/Switch_1_X;->getSat()Ljava/lang/String;

    move-result-object v2

    const-string v3, ""

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 518
    :cond_0
    :goto_0
    return v0

    .line 508
    :cond_1
    invoke-virtual {p1}, Lcom/belkin/rules/dbmigration/Switch_1_X;->getSun()Ljava/lang/String;

    move-result-object v2

    if-nez v2, :cond_2

    invoke-virtual {p1}, Lcom/belkin/rules/dbmigration/Switch_1_X;->getMon()Ljava/lang/String;

    move-result-object v2

    if-nez v2, :cond_2

    invoke-virtual {p1}, Lcom/belkin/rules/dbmigration/Switch_1_X;->getTue()Ljava/lang/String;

    move-result-object v2

    if-nez v2, :cond_2

    invoke-virtual {p1}, Lcom/belkin/rules/dbmigration/Switch_1_X;->getThu()Ljava/lang/String;

    move-result-object v2

    if-nez v2, :cond_2

    invoke-virtual {p1}, Lcom/belkin/rules/dbmigration/Switch_1_X;->getFri()Ljava/lang/String;

    move-result-object v2

    if-nez v2, :cond_2

    invoke-virtual {p1}, Lcom/belkin/rules/dbmigration/Switch_1_X;->getSat()Ljava/lang/String;

    move-result-object v2

    if-eqz v2, :cond_0

    :cond_2
    move v0, v1

    .line 516
    goto :goto_0

    :cond_3
    move v0, v1

    .line 518
    goto :goto_0
.end method

.method private isWeekDay(Lcom/belkin/rules/dbmigration/Switch_1_X;)Z
    .locals 3
    .param p1, "switch_1_X"    # Lcom/belkin/rules/dbmigration/Switch_1_X;

    .prologue
    const/4 v0, 0x0

    .line 589
    invoke-virtual {p1}, Lcom/belkin/rules/dbmigration/Switch_1_X;->getSat()Ljava/lang/String;

    move-result-object v1

    if-eqz v1, :cond_0

    invoke-virtual {p1}, Lcom/belkin/rules/dbmigration/Switch_1_X;->getSat()Ljava/lang/String;

    move-result-object v1

    const-string v2, ""

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1

    :cond_0
    invoke-virtual {p1}, Lcom/belkin/rules/dbmigration/Switch_1_X;->getSun()Ljava/lang/String;

    move-result-object v1

    if-eqz v1, :cond_2

    :cond_1
    invoke-virtual {p1}, Lcom/belkin/rules/dbmigration/Switch_1_X;->getSun()Ljava/lang/String;

    move-result-object v1

    const-string v2, ""

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_3

    .line 592
    :cond_2
    invoke-virtual {p1}, Lcom/belkin/rules/dbmigration/Switch_1_X;->getMon()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v1

    if-eqz v1, :cond_3

    .line 593
    invoke-virtual {p1}, Lcom/belkin/rules/dbmigration/Switch_1_X;->getMon()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1}, Lcom/belkin/rules/dbmigration/Switch_1_X;->getTue()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_3

    invoke-virtual {p1}, Lcom/belkin/rules/dbmigration/Switch_1_X;->getMon()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1}, Lcom/belkin/rules/dbmigration/Switch_1_X;->getWed()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_3

    invoke-virtual {p1}, Lcom/belkin/rules/dbmigration/Switch_1_X;->getMon()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1}, Lcom/belkin/rules/dbmigration/Switch_1_X;->getThu()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_3

    invoke-virtual {p1}, Lcom/belkin/rules/dbmigration/Switch_1_X;->getMon()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1}, Lcom/belkin/rules/dbmigration/Switch_1_X;->getFri()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_3

    .line 597
    const/4 v0, 0x1

    .line 603
    :cond_3
    return v0
.end method


# virtual methods
.method public migrate()V
    .locals 22

    .prologue
    .line 71
    new-instance v18, Ljava/util/ArrayList;

    invoke-direct/range {v18 .. v18}, Ljava/util/ArrayList;-><init>()V

    move-object/from16 v0, v18

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/belkin/rules/dbmigration/SwitchDBMigratior;->mRulesTables:Ljava/util/ArrayList;

    .line 72
    new-instance v18, Ljava/util/ArrayList;

    invoke-direct/range {v18 .. v18}, Ljava/util/ArrayList;-><init>()V

    move-object/from16 v0, v18

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/belkin/rules/dbmigration/SwitchDBMigratior;->mRuleDevicesTables:Ljava/util/ArrayList;

    .line 73
    new-instance v18, Ljava/util/ArrayList;

    invoke-direct/range {v18 .. v18}, Ljava/util/ArrayList;-><init>()V

    move-object/from16 v0, v18

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/belkin/rules/dbmigration/SwitchDBMigratior;->mDeviceCombinationTables:Ljava/util/ArrayList;

    .line 76
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/rules/dbmigration/SwitchDBMigratior;->switchList:Ljava/util/Vector;

    move-object/from16 v18, v0

    invoke-virtual/range {v18 .. v18}, Ljava/util/Vector;->iterator()Ljava/util/Iterator;

    move-result-object v10

    .local v10, "i$":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v10}, Ljava/util/Iterator;->hasNext()Z

    move-result v18

    if-eqz v18, :cond_1

    invoke-interface {v10}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v15

    check-cast v15, Lcom/belkin/rules/dbmigration/Switch_1_X;

    .line 77
    .local v15, "switch_1_X":Lcom/belkin/rules/dbmigration/Switch_1_X;
    new-instance v18, Lcom/belkin/rules/dbmigration/RulesTable;

    invoke-direct/range {v18 .. v18}, Lcom/belkin/rules/dbmigration/RulesTable;-><init>()V

    move-object/from16 v0, v18

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/belkin/rules/dbmigration/SwitchDBMigratior;->rules:Lcom/belkin/rules/dbmigration/RulesTable;

    .line 78
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/rules/dbmigration/SwitchDBMigratior;->rules:Lcom/belkin/rules/dbmigration/RulesTable;

    move-object/from16 v18, v0

    invoke-virtual {v15}, Lcom/belkin/rules/dbmigration/Switch_1_X;->getId()I

    move-result v19

    invoke-virtual/range {v18 .. v19}, Lcom/belkin/rules/dbmigration/RulesTable;->setRuleId(I)V

    .line 79
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/rules/dbmigration/SwitchDBMigratior;->rules:Lcom/belkin/rules/dbmigration/RulesTable;

    move-object/from16 v18, v0

    invoke-virtual {v15}, Lcom/belkin/rules/dbmigration/Switch_1_X;->getName()Ljava/lang/String;

    move-result-object v19

    invoke-virtual/range {v18 .. v19}, Lcom/belkin/rules/dbmigration/RulesTable;->setName(Ljava/lang/String;)V

    .line 80
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/rules/dbmigration/SwitchDBMigratior;->rules:Lcom/belkin/rules/dbmigration/RulesTable;

    move-object/from16 v18, v0

    invoke-virtual {v15}, Lcom/belkin/rules/dbmigration/Switch_1_X;->getType()Ljava/lang/String;

    move-result-object v19

    invoke-virtual/range {v18 .. v19}, Lcom/belkin/rules/dbmigration/RulesTable;->setType(Ljava/lang/String;)V

    .line 81
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/rules/dbmigration/SwitchDBMigratior;->rules:Lcom/belkin/rules/dbmigration/RulesTable;

    move-object/from16 v18, v0

    invoke-virtual {v15}, Lcom/belkin/rules/dbmigration/Switch_1_X;->getEnable()Ljava/lang/String;

    move-result-object v19

    invoke-virtual/range {v18 .. v19}, Lcom/belkin/rules/dbmigration/RulesTable;->setState(Ljava/lang/String;)V

    .line 82
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/rules/dbmigration/SwitchDBMigratior;->ruleHash:Ljava/util/Hashtable;

    move-object/from16 v18, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/rules/dbmigration/SwitchDBMigratior;->rules:Lcom/belkin/rules/dbmigration/RulesTable;

    move-object/from16 v19, v0

    invoke-virtual/range {v19 .. v19}, Lcom/belkin/rules/dbmigration/RulesTable;->getRuleId()I

    move-result v19

    invoke-static/range {v19 .. v19}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v19

    invoke-virtual/range {v18 .. v19}, Ljava/util/Hashtable;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v14

    check-cast v14, Ljava/util/Vector;

    .line 83
    .local v14, "rulesVector":Ljava/util/Vector;, "Ljava/util/Vector<Lcom/belkin/rules/dbmigration/Switch_1_X;>;"
    if-nez v14, :cond_0

    .line 84
    new-instance v14, Ljava/util/Vector;

    .end local v14    # "rulesVector":Ljava/util/Vector;, "Ljava/util/Vector<Lcom/belkin/rules/dbmigration/Switch_1_X;>;"
    invoke-direct {v14}, Ljava/util/Vector;-><init>()V

    .line 85
    .restart local v14    # "rulesVector":Ljava/util/Vector;, "Ljava/util/Vector<Lcom/belkin/rules/dbmigration/Switch_1_X;>;"
    :cond_0
    invoke-virtual {v14, v15}, Ljava/util/Vector;->add(Ljava/lang/Object;)Z

    .line 86
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/rules/dbmigration/SwitchDBMigratior;->ruleHash:Ljava/util/Hashtable;

    move-object/from16 v18, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/rules/dbmigration/SwitchDBMigratior;->rules:Lcom/belkin/rules/dbmigration/RulesTable;

    move-object/from16 v19, v0

    invoke-virtual/range {v19 .. v19}, Lcom/belkin/rules/dbmigration/RulesTable;->getRuleId()I

    move-result v19

    invoke-static/range {v19 .. v19}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v19

    move-object/from16 v0, v18

    move-object/from16 v1, v19

    invoke-virtual {v0, v1, v14}, Ljava/util/Hashtable;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 87
    sget-object v18, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v19, " %%%%%%%%%%%% Switch Migration %%%%%%%%%%%%%%%%%%%%"

    invoke-virtual/range {v18 .. v19}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 88
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/rules/dbmigration/SwitchDBMigratior;->mRulesTables:Ljava/util/ArrayList;

    move-object/from16 v18, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/rules/dbmigration/SwitchDBMigratior;->rules:Lcom/belkin/rules/dbmigration/RulesTable;

    move-object/from16 v19, v0

    invoke-virtual/range {v18 .. v19}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto/16 :goto_0

    .line 92
    .end local v14    # "rulesVector":Ljava/util/Vector;, "Ljava/util/Vector<Lcom/belkin/rules/dbmigration/Switch_1_X;>;"
    .end local v15    # "switch_1_X":Lcom/belkin/rules/dbmigration/Switch_1_X;
    :cond_1
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/rules/dbmigration/SwitchDBMigratior;->ruleHash:Ljava/util/Hashtable;

    move-object/from16 v18, v0

    invoke-virtual/range {v18 .. v18}, Ljava/util/Hashtable;->keys()Ljava/util/Enumeration;

    move-result-object v8

    .line 94
    .end local v10    # "i$":Ljava/util/Iterator;
    .local v8, "e":Ljava/util/Enumeration;, "Ljava/util/Enumeration<Ljava/lang/Integer;>;"
    :cond_2
    invoke-interface {v8}, Ljava/util/Enumeration;->hasMoreElements()Z

    move-result v18

    if-eqz v18, :cond_8

    .line 95
    invoke-interface {v8}, Ljava/util/Enumeration;->nextElement()Ljava/lang/Object;

    move-result-object v18

    check-cast v18, Ljava/lang/Integer;

    invoke-virtual/range {v18 .. v18}, Ljava/lang/Integer;->toString()Ljava/lang/String;

    move-result-object v18

    invoke-static/range {v18 .. v18}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v12

    .line 96
    .local v12, "id":I
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/rules/dbmigration/SwitchDBMigratior;->ruleHash:Ljava/util/Hashtable;

    move-object/from16 v18, v0

    invoke-static {v12}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v19

    invoke-virtual/range {v18 .. v19}, Ljava/util/Hashtable;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v14

    check-cast v14, Ljava/util/Vector;

    .line 97
    .restart local v14    # "rulesVector":Ljava/util/Vector;, "Ljava/util/Vector<Lcom/belkin/rules/dbmigration/Switch_1_X;>;"
    invoke-virtual {v14}, Ljava/util/Vector;->iterator()Ljava/util/Iterator;

    move-result-object v10

    :cond_3
    :goto_1
    invoke-interface {v10}, Ljava/util/Iterator;->hasNext()Z

    move-result v18

    if-eqz v18, :cond_2

    invoke-interface {v10}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v15

    check-cast v15, Lcom/belkin/rules/dbmigration/Switch_1_X;

    .line 98
    .restart local v15    # "switch_1_X":Lcom/belkin/rules/dbmigration/Switch_1_X;
    new-instance v18, Lcom/belkin/rules/dbmigration/RuleDevicesTable;

    invoke-direct/range {v18 .. v18}, Lcom/belkin/rules/dbmigration/RuleDevicesTable;-><init>()V

    move-object/from16 v0, v18

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/belkin/rules/dbmigration/SwitchDBMigratior;->devicesTable:Lcom/belkin/rules/dbmigration/RuleDevicesTable;

    .line 99
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/rules/dbmigration/SwitchDBMigratior;->devicesTable:Lcom/belkin/rules/dbmigration/RuleDevicesTable;

    move-object/from16 v18, v0

    move-object/from16 v0, v18

    invoke-virtual {v0, v12}, Lcom/belkin/rules/dbmigration/RuleDevicesTable;->setRuleId(I)V

    .line 100
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/rules/dbmigration/SwitchDBMigratior;->devicesTable:Lcom/belkin/rules/dbmigration/RuleDevicesTable;

    move-object/from16 v18, v0

    invoke-virtual {v15}, Lcom/belkin/rules/dbmigration/Switch_1_X;->getUdn()Ljava/lang/String;

    move-result-object v19

    invoke-virtual/range {v18 .. v19}, Lcom/belkin/rules/dbmigration/RuleDevicesTable;->setDeviceId(Ljava/lang/String;)V

    .line 101
    move-object/from16 v0, p0

    invoke-direct {v0, v15}, Lcom/belkin/rules/dbmigration/SwitchDBMigratior;->getDayId(Lcom/belkin/rules/dbmigration/Switch_1_X;)I

    move-result v7

    .line 102
    .local v7, "dayId":I
    const/16 v18, -0x1

    move/from16 v0, v18

    if-eq v7, v0, :cond_5

    .line 103
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/rules/dbmigration/SwitchDBMigratior;->devicesTable:Lcom/belkin/rules/dbmigration/RuleDevicesTable;

    move-object/from16 v18, v0

    move-object/from16 v0, v18

    invoke-virtual {v0, v7}, Lcom/belkin/rules/dbmigration/RuleDevicesTable;->setDayId(I)V

    .line 104
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/rules/dbmigration/SwitchDBMigratior;->devicesTable:Lcom/belkin/rules/dbmigration/RuleDevicesTable;

    move-object/from16 v18, v0

    move-object/from16 v0, p0

    invoke-direct {v0, v15}, Lcom/belkin/rules/dbmigration/SwitchDBMigratior;->getStartTime(Lcom/belkin/rules/dbmigration/Switch_1_X;)I

    move-result v19

    invoke-virtual/range {v18 .. v19}, Lcom/belkin/rules/dbmigration/RuleDevicesTable;->setStarttime(I)V

    .line 105
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/rules/dbmigration/SwitchDBMigratior;->devicesTable:Lcom/belkin/rules/dbmigration/RuleDevicesTable;

    move-object/from16 v18, v0

    move-object/from16 v0, p0

    invoke-direct {v0, v15}, Lcom/belkin/rules/dbmigration/SwitchDBMigratior;->getRuleDuration(Lcom/belkin/rules/dbmigration/Switch_1_X;)I

    move-result v19

    invoke-virtual/range {v18 .. v19}, Lcom/belkin/rules/dbmigration/RuleDevicesTable;->setRuleDuration(I)V

    .line 106
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/rules/dbmigration/SwitchDBMigratior;->devicesTable:Lcom/belkin/rules/dbmigration/RuleDevicesTable;

    move-object/from16 v18, v0

    move-object/from16 v0, p0

    invoke-direct {v0, v15}, Lcom/belkin/rules/dbmigration/SwitchDBMigratior;->getRuleStartAction(Lcom/belkin/rules/dbmigration/Switch_1_X;)D

    move-result-wide v20

    move-object/from16 v0, v18

    move-wide/from16 v1, v20

    invoke-virtual {v0, v1, v2}, Lcom/belkin/rules/dbmigration/RuleDevicesTable;->setStartAction(D)V

    .line 107
    invoke-virtual {v15}, Lcom/belkin/rules/dbmigration/Switch_1_X;->getType()Ljava/lang/String;

    move-result-object v18

    const-string v19, "Simple Switch"

    invoke-virtual/range {v18 .. v19}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v18

    if-eqz v18, :cond_4

    .line 108
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/rules/dbmigration/SwitchDBMigratior;->devicesTable:Lcom/belkin/rules/dbmigration/RuleDevicesTable;

    move-object/from16 v18, v0

    const-wide/16 v20, 0x0

    move-object/from16 v0, v18

    move-wide/from16 v1, v20

    invoke-virtual {v0, v1, v2}, Lcom/belkin/rules/dbmigration/RuleDevicesTable;->setEndAction(D)V

    .line 112
    :goto_2
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/rules/dbmigration/SwitchDBMigratior;->devicesTable:Lcom/belkin/rules/dbmigration/RuleDevicesTable;

    move-object/from16 v18, v0

    const/16 v19, -0x1

    invoke-virtual/range {v18 .. v19}, Lcom/belkin/rules/dbmigration/RuleDevicesTable;->setSensorDuration(I)V

    .line 113
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/rules/dbmigration/SwitchDBMigratior;->devicesTable:Lcom/belkin/rules/dbmigration/RuleDevicesTable;

    move-object/from16 v18, v0

    const/16 v19, -0x1

    invoke-virtual/range {v18 .. v19}, Lcom/belkin/rules/dbmigration/RuleDevicesTable;->setType(I)V

    .line 114
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/rules/dbmigration/SwitchDBMigratior;->devicesTable:Lcom/belkin/rules/dbmigration/RuleDevicesTable;

    move-object/from16 v18, v0

    const-string v19, "-1"

    invoke-virtual/range {v18 .. v19}, Lcom/belkin/rules/dbmigration/RuleDevicesTable;->setValue(Ljava/lang/String;)V

    .line 115
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/rules/dbmigration/SwitchDBMigratior;->devicesTable:Lcom/belkin/rules/dbmigration/RuleDevicesTable;

    move-object/from16 v18, v0

    const/16 v19, -0x1

    invoke-virtual/range {v18 .. v19}, Lcom/belkin/rules/dbmigration/RuleDevicesTable;->setLevel(I)V

    .line 116
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/rules/dbmigration/SwitchDBMigratior;->mRuleDevicesTables:Ljava/util/ArrayList;

    move-object/from16 v18, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/rules/dbmigration/SwitchDBMigratior;->devicesTable:Lcom/belkin/rules/dbmigration/RuleDevicesTable;

    move-object/from16 v19, v0

    invoke-virtual/range {v18 .. v19}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto/16 :goto_1

    .line 110
    :cond_4
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/rules/dbmigration/SwitchDBMigratior;->devicesTable:Lcom/belkin/rules/dbmigration/RuleDevicesTable;

    move-object/from16 v18, v0

    move-object/from16 v0, p0

    invoke-direct {v0, v15}, Lcom/belkin/rules/dbmigration/SwitchDBMigratior;->getRuleEndAction(Lcom/belkin/rules/dbmigration/Switch_1_X;)D

    move-result-wide v20

    move-object/from16 v0, v18

    move-wide/from16 v1, v20

    invoke-virtual {v0, v1, v2}, Lcom/belkin/rules/dbmigration/RuleDevicesTable;->setEndAction(D)V

    goto :goto_2

    .line 119
    :cond_5
    move-object/from16 v0, p0

    invoke-direct {v0, v15}, Lcom/belkin/rules/dbmigration/SwitchDBMigratior;->getActiveDays(Lcom/belkin/rules/dbmigration/Switch_1_X;)Ljava/util/Vector;

    move-result-object v17

    .line 120
    .local v17, "vector":Ljava/util/Vector;, "Ljava/util/Vector<Ljava/lang/Integer;>;"
    invoke-virtual/range {v17 .. v17}, Ljava/util/Vector;->iterator()Ljava/util/Iterator;

    move-result-object v11

    .local v11, "i$":Ljava/util/Iterator;
    :goto_3
    invoke-interface {v11}, Ljava/util/Iterator;->hasNext()Z

    move-result v18

    if-eqz v18, :cond_3

    invoke-interface {v11}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v13

    check-cast v13, Ljava/lang/Integer;

    .line 121
    .local v13, "integer":Ljava/lang/Integer;
    const-string v16, ""

    .line 122
    .local v16, "value":Ljava/lang/String;
    invoke-virtual {v13}, Ljava/lang/Integer;->intValue()I

    move-result v18

    packed-switch v18, :pswitch_data_0

    .line 146
    :goto_4
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/rules/dbmigration/SwitchDBMigratior;->devicesTable:Lcom/belkin/rules/dbmigration/RuleDevicesTable;

    move-object/from16 v18, v0

    move-object/from16 v0, p0

    move-object/from16 v1, v16

    invoke-direct {v0, v1}, Lcom/belkin/rules/dbmigration/SwitchDBMigratior;->getConveratedTime(Ljava/lang/String;)I

    move-result v19

    invoke-virtual/range {v18 .. v19}, Lcom/belkin/rules/dbmigration/RuleDevicesTable;->setStarttime(I)V

    .line 147
    move-object/from16 v0, p0

    move-object/from16 v1, v16

    invoke-direct {v0, v1}, Lcom/belkin/rules/dbmigration/SwitchDBMigratior;->getConveratedTime(Ljava/lang/String;)I

    move-result v5

    .line 148
    .local v5, "convertedStartTime":I
    move-object/from16 v0, p0

    move-object/from16 v1, v16

    invoke-direct {v0, v1}, Lcom/belkin/rules/dbmigration/SwitchDBMigratior;->getConveratedEndTime(Ljava/lang/String;)I

    move-result v4

    .line 150
    .local v4, "convertedEndTime":I
    if-lez v4, :cond_6

    .line 151
    sub-int v6, v4, v5

    .line 155
    .local v6, "convertedTime":I
    :goto_5
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/rules/dbmigration/SwitchDBMigratior;->devicesTable:Lcom/belkin/rules/dbmigration/RuleDevicesTable;

    move-object/from16 v18, v0

    move-object/from16 v0, v18

    invoke-virtual {v0, v6}, Lcom/belkin/rules/dbmigration/RuleDevicesTable;->setRuleDuration(I)V

    .line 156
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/rules/dbmigration/SwitchDBMigratior;->devicesTable:Lcom/belkin/rules/dbmigration/RuleDevicesTable;

    move-object/from16 v18, v0

    move-object/from16 v0, p0

    move-object/from16 v1, v16

    invoke-direct {v0, v1}, Lcom/belkin/rules/dbmigration/SwitchDBMigratior;->getStartAction(Ljava/lang/String;)D

    move-result-wide v20

    move-object/from16 v0, v18

    move-wide/from16 v1, v20

    invoke-virtual {v0, v1, v2}, Lcom/belkin/rules/dbmigration/RuleDevicesTable;->setStartAction(D)V

    .line 157
    invoke-virtual {v15}, Lcom/belkin/rules/dbmigration/Switch_1_X;->getType()Ljava/lang/String;

    move-result-object v18

    const-string v19, "Simple Switch"

    invoke-virtual/range {v18 .. v19}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v18

    if-eqz v18, :cond_7

    .line 158
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/rules/dbmigration/SwitchDBMigratior;->devicesTable:Lcom/belkin/rules/dbmigration/RuleDevicesTable;

    move-object/from16 v18, v0

    const-wide/16 v20, 0x0

    move-object/from16 v0, v18

    move-wide/from16 v1, v20

    invoke-virtual {v0, v1, v2}, Lcom/belkin/rules/dbmigration/RuleDevicesTable;->setEndAction(D)V

    .line 162
    :goto_6
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/rules/dbmigration/SwitchDBMigratior;->devicesTable:Lcom/belkin/rules/dbmigration/RuleDevicesTable;

    move-object/from16 v18, v0

    const/16 v19, -0x1

    invoke-virtual/range {v18 .. v19}, Lcom/belkin/rules/dbmigration/RuleDevicesTable;->setSensorDuration(I)V

    .line 163
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/rules/dbmigration/SwitchDBMigratior;->devicesTable:Lcom/belkin/rules/dbmigration/RuleDevicesTable;

    move-object/from16 v18, v0

    const/16 v19, -0x1

    invoke-virtual/range {v18 .. v19}, Lcom/belkin/rules/dbmigration/RuleDevicesTable;->setType(I)V

    .line 164
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/rules/dbmigration/SwitchDBMigratior;->devicesTable:Lcom/belkin/rules/dbmigration/RuleDevicesTable;

    move-object/from16 v18, v0

    const-string v19, "-1"

    invoke-virtual/range {v18 .. v19}, Lcom/belkin/rules/dbmigration/RuleDevicesTable;->setValue(Ljava/lang/String;)V

    .line 165
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/rules/dbmigration/SwitchDBMigratior;->devicesTable:Lcom/belkin/rules/dbmigration/RuleDevicesTable;

    move-object/from16 v18, v0

    const/16 v19, -0x1

    invoke-virtual/range {v18 .. v19}, Lcom/belkin/rules/dbmigration/RuleDevicesTable;->setLevel(I)V

    goto/16 :goto_3

    .line 124
    .end local v4    # "convertedEndTime":I
    .end local v5    # "convertedStartTime":I
    .end local v6    # "convertedTime":I
    :pswitch_0
    invoke-virtual {v15}, Lcom/belkin/rules/dbmigration/Switch_1_X;->getSun()Ljava/lang/String;

    move-result-object v16

    .line 125
    goto/16 :goto_4

    .line 127
    :pswitch_1
    invoke-virtual {v15}, Lcom/belkin/rules/dbmigration/Switch_1_X;->getMon()Ljava/lang/String;

    move-result-object v16

    .line 128
    goto/16 :goto_4

    .line 130
    :pswitch_2
    invoke-virtual {v15}, Lcom/belkin/rules/dbmigration/Switch_1_X;->getTue()Ljava/lang/String;

    move-result-object v16

    .line 131
    goto/16 :goto_4

    .line 133
    :pswitch_3
    invoke-virtual {v15}, Lcom/belkin/rules/dbmigration/Switch_1_X;->getWed()Ljava/lang/String;

    move-result-object v16

    .line 134
    goto/16 :goto_4

    .line 136
    :pswitch_4
    invoke-virtual {v15}, Lcom/belkin/rules/dbmigration/Switch_1_X;->getThu()Ljava/lang/String;

    move-result-object v16

    .line 137
    goto/16 :goto_4

    .line 139
    :pswitch_5
    invoke-virtual {v15}, Lcom/belkin/rules/dbmigration/Switch_1_X;->getFri()Ljava/lang/String;

    move-result-object v16

    .line 140
    goto/16 :goto_4

    .line 142
    :pswitch_6
    invoke-virtual {v15}, Lcom/belkin/rules/dbmigration/Switch_1_X;->getSat()Ljava/lang/String;

    move-result-object v16

    goto/16 :goto_4

    .line 154
    .restart local v4    # "convertedEndTime":I
    .restart local v5    # "convertedStartTime":I
    :cond_6
    const/4 v6, 0x0

    .restart local v6    # "convertedTime":I
    goto/16 :goto_5

    .line 160
    :cond_7
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/rules/dbmigration/SwitchDBMigratior;->devicesTable:Lcom/belkin/rules/dbmigration/RuleDevicesTable;

    move-object/from16 v18, v0

    move-object/from16 v0, p0

    invoke-direct {v0, v15}, Lcom/belkin/rules/dbmigration/SwitchDBMigratior;->getRuleEndAction(Lcom/belkin/rules/dbmigration/Switch_1_X;)D

    move-result-wide v20

    move-object/from16 v0, v18

    move-wide/from16 v1, v20

    invoke-virtual {v0, v1, v2}, Lcom/belkin/rules/dbmigration/RuleDevicesTable;->setEndAction(D)V

    goto :goto_6

    .line 175
    .end local v4    # "convertedEndTime":I
    .end local v5    # "convertedStartTime":I
    .end local v6    # "convertedTime":I
    .end local v7    # "dayId":I
    .end local v11    # "i$":Ljava/util/Iterator;
    .end local v12    # "id":I
    .end local v13    # "integer":Ljava/lang/Integer;
    .end local v14    # "rulesVector":Ljava/util/Vector;, "Ljava/util/Vector<Lcom/belkin/rules/dbmigration/Switch_1_X;>;"
    .end local v15    # "switch_1_X":Lcom/belkin/rules/dbmigration/Switch_1_X;
    .end local v16    # "value":Ljava/lang/String;
    .end local v17    # "vector":Ljava/util/Vector;, "Ljava/util/Vector<Ljava/lang/Integer;>;"
    :cond_8
    :try_start_0
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/rules/dbmigration/SwitchDBMigratior;->context:Landroid/content/Context;

    move-object/from16 v18, v0

    invoke-static/range {v18 .. v18}, Lcom/belkin/rules/dbmigration/RuleDatabaseManager;->getInstance(Landroid/content/Context;)Lcom/belkin/rules/dbmigration/RuleDatabaseManager;

    move-result-object v18

    move-object/from16 v0, v18

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/belkin/rules/dbmigration/SwitchDBMigratior;->ruleDatabaseManager:Lcom/belkin/rules/dbmigration/RuleDatabaseManager;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 180
    :goto_7
    new-instance v18, Lcom/belkin/rules/dbmigration/SwitchDBMigratior$1;

    move-object/from16 v0, v18

    move-object/from16 v1, p0

    invoke-direct {v0, v1}, Lcom/belkin/rules/dbmigration/SwitchDBMigratior$1;-><init>(Lcom/belkin/rules/dbmigration/SwitchDBMigratior;)V

    invoke-virtual/range {v18 .. v18}, Lcom/belkin/rules/dbmigration/SwitchDBMigratior$1;->start()V

    .line 185
    return-void

    .line 176
    :catch_0
    move-exception v9

    .line 177
    .local v9, "ex":Ljava/lang/Exception;
    invoke-virtual {v9}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_7

    .line 122
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
