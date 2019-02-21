.class public Lcom/belkin/rules/utils/WeeklyCalenderStringsCreator;
.super Ljava/lang/Object;
.source "WeeklyCalenderStringsCreator.java"


# static fields
.field private static TAG:Ljava/lang/String;


# instance fields
.field private endTmpOK:Z

.field private lstSRSSOffset:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field private rDB:Lcom/belkin/rules/db/RulesDb;

.field private rulesCount:Ljava/lang/Integer;

.field private scheduleStringActions:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Lcom/belkin/rules/utils/ScheduleStringAction;",
            ">;"
        }
    .end annotation
.end field

.field private startTmpOK:Z


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 19
    const-string v0, "ScheduleStringConstructor"

    sput-object v0, Lcom/belkin/rules/utils/WeeklyCalenderStringsCreator;->TAG:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .locals 3
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    const/4 v2, 0x0

    .line 23
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 15
    const/4 v1, 0x0

    iput-object v1, p0, Lcom/belkin/rules/utils/WeeklyCalenderStringsCreator;->rDB:Lcom/belkin/rules/db/RulesDb;

    .line 16
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    iput-object v1, p0, Lcom/belkin/rules/utils/WeeklyCalenderStringsCreator;->rulesCount:Ljava/lang/Integer;

    .line 20
    iput-boolean v2, p0, Lcom/belkin/rules/utils/WeeklyCalenderStringsCreator;->startTmpOK:Z

    .line 21
    iput-boolean v2, p0, Lcom/belkin/rules/utils/WeeklyCalenderStringsCreator;->endTmpOK:Z

    .line 25
    :try_start_0
    invoke-static {p1}, Lcom/belkin/rules/db/RulesDb;->getRulesDatabase(Landroid/content/Context;)Lcom/belkin/rules/db/RulesDb;

    move-result-object v1

    iput-object v1, p0, Lcom/belkin/rules/utils/WeeklyCalenderStringsCreator;->rDB:Lcom/belkin/rules/db/RulesDb;

    .line 26
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    iput-object v1, p0, Lcom/belkin/rules/utils/WeeklyCalenderStringsCreator;->lstSRSSOffset:Ljava/util/ArrayList;

    .line 27
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    iput-object v1, p0, Lcom/belkin/rules/utils/WeeklyCalenderStringsCreator;->scheduleStringActions:Ljava/util/ArrayList;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 31
    :goto_0
    return-void

    .line 28
    :catch_0
    move-exception v0

    .line 29
    .local v0, "e":Ljava/lang/Exception;
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_0
.end method

.method private getParentNotifyRule(Lcom/belkin/rules/dbmigration/RuleDevicesTable;I)Lcom/belkin/rules/dbmigration/RuleDevicesTable;
    .locals 9
    .param p1, "rule"    # Lcom/belkin/rules/dbmigration/RuleDevicesTable;
    .param p2, "schdDayNum"    # I

    .prologue
    const/4 v8, 0x1

    .line 264
    iget-object v5, p0, Lcom/belkin/rules/utils/WeeklyCalenderStringsCreator;->rDB:Lcom/belkin/rules/db/RulesDb;

    invoke-virtual {p1}, Lcom/belkin/rules/dbmigration/RuleDevicesTable;->getDeviceId()Ljava/lang/String;

    move-result-object v6

    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    invoke-virtual {v5, v6, v7}, Lcom/belkin/rules/db/RulesDb;->getDeviceTableItems(Ljava/lang/String;Ljava/lang/Integer;)Ljava/util/ArrayList;

    move-result-object v1

    .line 265
    .local v1, "resRules":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/belkin/rules/dbmigration/RuleDevicesTable;>;"
    iget-object v5, p0, Lcom/belkin/rules/utils/WeeklyCalenderStringsCreator;->rDB:Lcom/belkin/rules/db/RulesDb;

    invoke-virtual {p1}, Lcom/belkin/rules/dbmigration/RuleDevicesTable;->getDeviceId()Ljava/lang/String;

    move-result-object v6

    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    invoke-direct {p0, v7}, Lcom/belkin/rules/utils/WeeklyCalenderStringsCreator;->getPreviousDay(Ljava/lang/Integer;)Ljava/lang/Integer;

    move-result-object v7

    invoke-virtual {v5, v6, v7}, Lcom/belkin/rules/db/RulesDb;->getDeviceTableItemsBySensor(Ljava/lang/String;Ljava/lang/Integer;)Ljava/util/ArrayList;

    move-result-object v5

    invoke-virtual {v1, v5}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    .line 267
    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v5

    if-lez v5, :cond_3

    .line 268
    invoke-virtual {v1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "i$":Ljava/util/Iterator;
    :cond_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_3

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/belkin/rules/dbmigration/RuleDevicesTable;

    .line 269
    .local v3, "ruleObj":Lcom/belkin/rules/dbmigration/RuleDevicesTable;
    iget-object v5, p0, Lcom/belkin/rules/utils/WeeklyCalenderStringsCreator;->rDB:Lcom/belkin/rules/db/RulesDb;

    invoke-virtual {v3}, Lcom/belkin/rules/dbmigration/RuleDevicesTable;->getRuleId()I

    move-result v6

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    invoke-virtual {v5, v6}, Lcom/belkin/rules/db/RulesDb;->isDisabled(Ljava/lang/Integer;)Z

    move-result v5

    if-nez v5, :cond_0

    iget-object v5, p0, Lcom/belkin/rules/utils/WeeklyCalenderStringsCreator;->rDB:Lcom/belkin/rules/db/RulesDb;

    invoke-virtual {v3}, Lcom/belkin/rules/dbmigration/RuleDevicesTable;->getRuleId()I

    move-result v6

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    invoke-virtual {v5, v6}, Lcom/belkin/rules/db/RulesDb;->getRuleType(Ljava/lang/Integer;)Ljava/lang/String;

    move-result-object v5

    sget-object v6, Lcom/belkin/rules/utils/RulesConstants;->RULE_INSIGHT:Ljava/lang/String;

    invoke-virtual {v5, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_0

    invoke-virtual {p1}, Lcom/belkin/rules/dbmigration/RuleDevicesTable;->getRuleId()I

    move-result v5

    invoke-virtual {v3}, Lcom/belkin/rules/dbmigration/RuleDevicesTable;->getRuleId()I

    move-result v6

    if-eq v5, v6, :cond_0

    .line 270
    invoke-virtual {p1}, Lcom/belkin/rules/dbmigration/RuleDevicesTable;->getStarttime()I

    move-result v5

    invoke-virtual {p1}, Lcom/belkin/rules/dbmigration/RuleDevicesTable;->getRuleDuration()I

    move-result v6

    add-int v2, v5, v6

    .line 271
    .local v2, "ruleEndTime":I
    invoke-virtual {v3}, Lcom/belkin/rules/dbmigration/RuleDevicesTable;->getStarttime()I

    move-result v5

    invoke-virtual {v3}, Lcom/belkin/rules/dbmigration/RuleDevicesTable;->getRuleDuration()I

    move-result v6

    add-int v4, v5, v6

    .line 273
    .local v4, "ruleObjEndTime":I
    invoke-virtual {v3}, Lcom/belkin/rules/dbmigration/RuleDevicesTable;->getStarttime()I

    move-result v5

    invoke-virtual {p1}, Lcom/belkin/rules/dbmigration/RuleDevicesTable;->getStarttime()I

    move-result v6

    if-ge v5, v6, :cond_1

    if-le v4, v2, :cond_1

    .line 274
    iput-boolean v8, p0, Lcom/belkin/rules/utils/WeeklyCalenderStringsCreator;->startTmpOK:Z

    .line 275
    iput-boolean v8, p0, Lcom/belkin/rules/utils/WeeklyCalenderStringsCreator;->endTmpOK:Z

    .line 290
    .end local v0    # "i$":Ljava/util/Iterator;
    .end local v2    # "ruleEndTime":I
    .end local v3    # "ruleObj":Lcom/belkin/rules/dbmigration/RuleDevicesTable;
    .end local v4    # "ruleObjEndTime":I
    :goto_0
    return-object v3

    .line 278
    .restart local v0    # "i$":Ljava/util/Iterator;
    .restart local v2    # "ruleEndTime":I
    .restart local v3    # "ruleObj":Lcom/belkin/rules/dbmigration/RuleDevicesTable;
    .restart local v4    # "ruleObjEndTime":I
    :cond_1
    invoke-virtual {v3}, Lcom/belkin/rules/dbmigration/RuleDevicesTable;->getStarttime()I

    move-result v5

    invoke-virtual {p1}, Lcom/belkin/rules/dbmigration/RuleDevicesTable;->getStarttime()I

    move-result v6

    if-le v5, v6, :cond_2

    invoke-virtual {v3}, Lcom/belkin/rules/dbmigration/RuleDevicesTable;->getStarttime()I

    move-result v5

    if-ge v5, v2, :cond_2

    if-le v4, v2, :cond_2

    .line 279
    iput-boolean v8, p0, Lcom/belkin/rules/utils/WeeklyCalenderStringsCreator;->endTmpOK:Z

    goto :goto_0

    .line 282
    :cond_2
    invoke-virtual {v3}, Lcom/belkin/rules/dbmigration/RuleDevicesTable;->getStarttime()I

    move-result v5

    invoke-virtual {p1}, Lcom/belkin/rules/dbmigration/RuleDevicesTable;->getStarttime()I

    move-result v6

    if-ge v5, v6, :cond_0

    invoke-virtual {p1}, Lcom/belkin/rules/dbmigration/RuleDevicesTable;->getStarttime()I

    move-result v5

    if-le v4, v5, :cond_0

    if-ge v4, v2, :cond_0

    .line 283
    iput-boolean v8, p0, Lcom/belkin/rules/utils/WeeklyCalenderStringsCreator;->startTmpOK:Z

    goto :goto_0

    .line 290
    .end local v0    # "i$":Ljava/util/Iterator;
    .end local v2    # "ruleEndTime":I
    .end local v3    # "ruleObj":Lcom/belkin/rules/dbmigration/RuleDevicesTable;
    .end local v4    # "ruleObjEndTime":I
    :cond_3
    const/4 v3, 0x0

    goto :goto_0
.end method

.method private getPreviousDay(Ljava/lang/Integer;)Ljava/lang/Integer;
    .locals 3
    .param p1, "day"    # Ljava/lang/Integer;

    .prologue
    .line 352
    const/4 v1, 0x0

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    .line 354
    .local v0, "result":Ljava/lang/Integer;
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    const/4 v2, 0x1

    if-ne v1, v2, :cond_0

    .line 355
    const/4 v1, 0x7

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    .line 360
    :goto_0
    return-object v0

    .line 357
    :cond_0
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    add-int/lit8 v1, v1, -0x1

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    goto :goto_0
.end method

.method private getSRSSTail()Ljava/lang/String;
    .locals 6

    .prologue
    const-wide/16 v4, 0x0

    .line 34
    const-string v3, ""

    .line 35
    .local v3, "result":Ljava/lang/String;
    invoke-static {v4, v5}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v0

    .line 36
    .local v0, "latitude":Ljava/lang/Double;
    invoke-static {v4, v5}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v1

    .line 38
    .local v1, "longitude":Ljava/lang/Double;
    iget-object v4, p0, Lcom/belkin/rules/utils/WeeklyCalenderStringsCreator;->rDB:Lcom/belkin/rules/db/RulesDb;

    invoke-virtual {v4}, Lcom/belkin/rules/db/RulesDb;->getLocation()Lcom/belkin/cloud/objects/CloudObjectLocation;

    move-result-object v2

    .line 40
    .local v2, "objectLocation":Lcom/belkin/cloud/objects/CloudObjectLocation;
    if-eqz v2, :cond_0

    .line 42
    invoke-virtual {v2}, Lcom/belkin/cloud/objects/CloudObjectLocation;->getLatitude()Ljava/lang/Double;

    move-result-object v0

    .line 43
    invoke-virtual {v2}, Lcom/belkin/cloud/objects/CloudObjectLocation;->getLongitude()Ljava/lang/Double;

    move-result-object v1

    .line 46
    :cond_0
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    sget-char v5, Lcom/belkin/rules/utils/RulesConstants;->SHARP:C

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v0}, Ljava/lang/Double;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    sget-char v5, Lcom/belkin/rules/utils/RulesConstants;->COMMA:C

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v1}, Ljava/lang/Double;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    .line 48
    return-object v3
.end method

.method private getStringByRuleType(Lcom/belkin/rules/dbmigration/RuleDevicesTable;I)Ljava/lang/String;
    .locals 28
    .param p1, "rule"    # Lcom/belkin/rules/dbmigration/RuleDevicesTable;
    .param p2, "dayID"    # I

    .prologue
    .line 52
    const-string v13, ""

    .line 53
    .local v13, "result":Ljava/lang/String;
    const/16 v16, 0x0

    .line 54
    .local v16, "startOK":Z
    const/4 v8, 0x0

    .line 55
    .local v8, "endOK":Z
    const/4 v10, 0x0

    .line 57
    .local v10, "flagSimpleRule":Z
    const/16 v25, 0x0

    move/from16 v0, v25

    move-object/from16 v1, p0

    iput-boolean v0, v1, Lcom/belkin/rules/utils/WeeklyCalenderStringsCreator;->startTmpOK:Z

    .line 58
    const/16 v25, 0x0

    move/from16 v0, v25

    move-object/from16 v1, p0

    iput-boolean v0, v1, Lcom/belkin/rules/utils/WeeklyCalenderStringsCreator;->endTmpOK:Z

    .line 61
    :try_start_0
    invoke-virtual/range {p1 .. p1}, Lcom/belkin/rules/dbmigration/RuleDevicesTable;->getStarttime()I

    move-result v25

    invoke-static/range {v25 .. v25}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v17

    .line 62
    .local v17, "startTime":Ljava/lang/Integer;
    invoke-virtual/range {p1 .. p1}, Lcom/belkin/rules/dbmigration/RuleDevicesTable;->getRuleDuration()I

    move-result v25

    invoke-static/range {v25 .. v25}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    .line 63
    .local v4, "duration":Ljava/lang/Integer;
    invoke-virtual/range {v17 .. v17}, Ljava/lang/Integer;->intValue()I

    move-result v25

    invoke-virtual {v4}, Ljava/lang/Integer;->intValue()I

    move-result v26

    add-int v25, v25, v26

    invoke-static/range {v25 .. v25}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v9

    .line 65
    .local v9, "endTime":Ljava/lang/Integer;
    invoke-virtual/range {p1 .. p1}, Lcom/belkin/rules/dbmigration/RuleDevicesTable;->getStartAction()D

    move-result-wide v26

    move-wide/from16 v0, v26

    double-to-int v0, v0

    move/from16 v25, v0

    invoke-static/range {v25 .. v25}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v25

    invoke-virtual/range {v25 .. v25}, Ljava/lang/Integer;->toString()Ljava/lang/String;

    move-result-object v15

    .line 66
    .local v15, "startAct":Ljava/lang/String;
    invoke-virtual/range {p1 .. p1}, Lcom/belkin/rules/dbmigration/RuleDevicesTable;->getEndAction()D

    move-result-wide v26

    move-wide/from16 v0, v26

    double-to-int v0, v0

    move/from16 v25, v0

    invoke-static/range {v25 .. v25}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v25

    invoke-virtual/range {v25 .. v25}, Ljava/lang/Integer;->toString()Ljava/lang/String;

    move-result-object v7

    .line 68
    .local v7, "endAct":Ljava/lang/String;
    if-ne v15, v7, :cond_0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/rules/utils/WeeklyCalenderStringsCreator;->rDB:Lcom/belkin/rules/db/RulesDb;

    move-object/from16 v25, v0

    invoke-virtual/range {p1 .. p1}, Lcom/belkin/rules/dbmigration/RuleDevicesTable;->getRuleId()I

    move-result v26

    invoke-static/range {v26 .. v26}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v26

    invoke-virtual/range {v25 .. v26}, Lcom/belkin/rules/db/RulesDb;->getRuleType(Ljava/lang/Integer;)Ljava/lang/String;

    move-result-object v25

    sget-object v26, Lcom/belkin/rules/utils/RulesConstants;->RULE_TIME_INTERVAL:Ljava/lang/String;

    invoke-virtual/range {v25 .. v26}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v25

    if-eqz v25, :cond_0

    .line 69
    const/4 v10, 0x1

    .line 72
    :cond_0
    invoke-direct/range {p0 .. p2}, Lcom/belkin/rules/utils/WeeklyCalenderStringsCreator;->getParentNotifyRule(Lcom/belkin/rules/dbmigration/RuleDevicesTable;I)Lcom/belkin/rules/dbmigration/RuleDevicesTable;

    move-result-object v12

    .line 74
    .local v12, "parentNotifyRule":Lcom/belkin/rules/dbmigration/RuleDevicesTable;
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/rules/utils/WeeklyCalenderStringsCreator;->rDB:Lcom/belkin/rules/db/RulesDb;

    move-object/from16 v25, v0

    invoke-virtual/range {p1 .. p1}, Lcom/belkin/rules/dbmigration/RuleDevicesTable;->getRuleId()I

    move-result v26

    invoke-static/range {v26 .. v26}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v26

    invoke-virtual/range {v25 .. v26}, Lcom/belkin/rules/db/RulesDb;->getRuleType(Ljava/lang/Integer;)Ljava/lang/String;

    move-result-object v25

    sget-object v26, Lcom/belkin/rules/utils/RulesConstants;->RULE_MOTION:Ljava/lang/String;

    invoke-virtual/range {v25 .. v26}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v25

    if-nez v25, :cond_2

    if-eqz v12, :cond_2

    invoke-virtual/range {p1 .. p1}, Lcom/belkin/rules/dbmigration/RuleDevicesTable;->getDayId()I

    move-result v25

    move/from16 v0, p2

    move/from16 v1, v25

    if-ne v0, v1, :cond_2

    .line 75
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lcom/belkin/rules/utils/WeeklyCalenderStringsCreator;->startTmpOK:Z

    move/from16 v25, v0

    if-eqz v25, :cond_1

    .line 76
    invoke-virtual/range {p1 .. p1}, Lcom/belkin/rules/dbmigration/RuleDevicesTable;->getStarttime()I

    move-result v25

    add-int/lit8 v25, v25, -0xa

    invoke-static/range {v25 .. v25}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v18

    .line 77
    .local v18, "tmpEndTimeA":Ljava/lang/Integer;
    new-instance v25, Ljava/lang/StringBuilder;

    invoke-direct/range {v25 .. v25}, Ljava/lang/StringBuilder;-><init>()V

    sget-char v26, Lcom/belkin/rules/utils/RulesConstants;->SCHD_SEP:C

    invoke-virtual/range {v25 .. v26}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v25

    invoke-virtual/range {v18 .. v18}, Ljava/lang/Integer;->toString()Ljava/lang/String;

    move-result-object v26

    invoke-virtual/range {v25 .. v26}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v25

    sget-char v26, Lcom/belkin/rules/utils/RulesConstants;->COMMA:C

    invoke-virtual/range {v25 .. v26}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v25

    sget v26, Lcom/belkin/rules/utils/RulesConstants;->ACTION_OFF:I

    invoke-virtual/range {v25 .. v26}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v25

    invoke-virtual/range {v25 .. v25}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v23

    .line 78
    .local v23, "tmpStrA":Ljava/lang/String;
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/rules/utils/WeeklyCalenderStringsCreator;->scheduleStringActions:Ljava/util/ArrayList;

    move-object/from16 v25, v0

    new-instance v26, Lcom/belkin/rules/utils/ScheduleStringAction;

    invoke-virtual/range {v18 .. v18}, Ljava/lang/Integer;->intValue()I

    move-result v27

    move-object/from16 v0, v26

    move/from16 v1, v27

    move-object/from16 v2, v23

    invoke-direct {v0, v1, v2}, Lcom/belkin/rules/utils/ScheduleStringAction;-><init>(ILjava/lang/String;)V

    invoke-virtual/range {v25 .. v26}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 79
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/rules/utils/WeeklyCalenderStringsCreator;->lstSRSSOffset:Ljava/util/ArrayList;

    move-object/from16 v25, v0

    invoke-virtual/range {p1 .. p1}, Lcom/belkin/rules/dbmigration/RuleDevicesTable;->getOffModeOffset()I

    move-result v26

    invoke-static/range {v26 .. v26}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v26

    invoke-virtual/range {v25 .. v26}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 80
    new-instance v25, Ljava/lang/StringBuilder;

    invoke-direct/range {v25 .. v25}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, v25

    invoke-virtual {v0, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v25

    move-object/from16 v0, v25

    move-object/from16 v1, v23

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v25

    invoke-virtual/range {v25 .. v25}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v13

    .line 81
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/rules/utils/WeeklyCalenderStringsCreator;->rulesCount:Ljava/lang/Integer;

    move-object/from16 v25, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/rules/utils/WeeklyCalenderStringsCreator;->rulesCount:Ljava/lang/Integer;

    move-object/from16 v25, v0

    invoke-virtual/range {v25 .. v25}, Ljava/lang/Integer;->intValue()I

    move-result v25

    add-int/lit8 v25, v25, 0x1

    invoke-static/range {v25 .. v25}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v25

    move-object/from16 v0, v25

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/belkin/rules/utils/WeeklyCalenderStringsCreator;->rulesCount:Ljava/lang/Integer;

    .line 83
    .end local v18    # "tmpEndTimeA":Ljava/lang/Integer;
    .end local v23    # "tmpStrA":Ljava/lang/String;
    :cond_1
    invoke-virtual/range {p1 .. p1}, Lcom/belkin/rules/dbmigration/RuleDevicesTable;->getRuleDuration()I

    move-result v25

    if-lez v25, :cond_2

    move-object/from16 v0, p0

    iget-boolean v0, v0, Lcom/belkin/rules/utils/WeeklyCalenderStringsCreator;->endTmpOK:Z

    move/from16 v25, v0

    if-eqz v25, :cond_2

    .line 84
    invoke-virtual/range {p1 .. p1}, Lcom/belkin/rules/dbmigration/RuleDevicesTable;->getStarttime()I

    move-result v25

    invoke-virtual/range {p1 .. p1}, Lcom/belkin/rules/dbmigration/RuleDevicesTable;->getRuleDuration()I

    move-result v26

    add-int v25, v25, v26

    add-int/lit8 v25, v25, -0xa

    invoke-static/range {v25 .. v25}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v19

    .line 85
    .local v19, "tmpEndTimeB":Ljava/lang/Integer;
    new-instance v25, Ljava/lang/StringBuilder;

    invoke-direct/range {v25 .. v25}, Ljava/lang/StringBuilder;-><init>()V

    sget-char v26, Lcom/belkin/rules/utils/RulesConstants;->SCHD_SEP:C

    invoke-virtual/range {v25 .. v26}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v25

    invoke-virtual/range {v19 .. v19}, Ljava/lang/Integer;->toString()Ljava/lang/String;

    move-result-object v26

    invoke-virtual/range {v25 .. v26}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v25

    sget-char v26, Lcom/belkin/rules/utils/RulesConstants;->COMMA:C

    invoke-virtual/range {v25 .. v26}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v25

    sget v26, Lcom/belkin/rules/utils/RulesConstants;->ACTION_OFF:I

    invoke-virtual/range {v25 .. v26}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v25

    invoke-virtual/range {v25 .. v25}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v24

    .line 86
    .local v24, "tmpStrB":Ljava/lang/String;
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/rules/utils/WeeklyCalenderStringsCreator;->scheduleStringActions:Ljava/util/ArrayList;

    move-object/from16 v25, v0

    new-instance v26, Lcom/belkin/rules/utils/ScheduleStringAction;

    invoke-virtual/range {v19 .. v19}, Ljava/lang/Integer;->intValue()I

    move-result v27

    move-object/from16 v0, v26

    move/from16 v1, v27

    move-object/from16 v2, v24

    invoke-direct {v0, v1, v2}, Lcom/belkin/rules/utils/ScheduleStringAction;-><init>(ILjava/lang/String;)V

    invoke-virtual/range {v25 .. v26}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 87
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/rules/utils/WeeklyCalenderStringsCreator;->lstSRSSOffset:Ljava/util/ArrayList;

    move-object/from16 v25, v0

    invoke-virtual/range {p1 .. p1}, Lcom/belkin/rules/dbmigration/RuleDevicesTable;->getOffModeOffset()I

    move-result v26

    invoke-static/range {v26 .. v26}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v26

    invoke-virtual/range {v25 .. v26}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 88
    new-instance v25, Ljava/lang/StringBuilder;

    invoke-direct/range {v25 .. v25}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, v25

    invoke-virtual {v0, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v25

    move-object/from16 v0, v25

    move-object/from16 v1, v24

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v25

    invoke-virtual/range {v25 .. v25}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v13

    .line 89
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/rules/utils/WeeklyCalenderStringsCreator;->rulesCount:Ljava/lang/Integer;

    move-object/from16 v25, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/rules/utils/WeeklyCalenderStringsCreator;->rulesCount:Ljava/lang/Integer;

    move-object/from16 v25, v0

    invoke-virtual/range {v25 .. v25}, Ljava/lang/Integer;->intValue()I

    move-result v25

    add-int/lit8 v25, v25, 0x1

    invoke-static/range {v25 .. v25}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v25

    move-object/from16 v0, v25

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/belkin/rules/utils/WeeklyCalenderStringsCreator;->rulesCount:Ljava/lang/Integer;

    .line 93
    .end local v19    # "tmpEndTimeB":Ljava/lang/Integer;
    .end local v24    # "tmpStrB":Ljava/lang/String;
    :cond_2
    invoke-virtual/range {p1 .. p1}, Lcom/belkin/rules/dbmigration/RuleDevicesTable;->getDayId()I

    move-result v25

    move/from16 v0, p2

    move/from16 v1, v25

    if-ne v0, v1, :cond_3

    .line 94
    invoke-virtual {v9}, Ljava/lang/Integer;->intValue()I

    move-result v25

    sget v26, Lcom/belkin/rules/utils/RulesConstants;->MAX_HOUR:I

    move/from16 v0, v25

    move/from16 v1, v26

    if-gt v0, v1, :cond_16

    .line 95
    const/4 v8, 0x1

    .line 100
    :goto_0
    const/16 v16, 0x1

    .line 103
    :cond_3
    invoke-virtual/range {p1 .. p1}, Lcom/belkin/rules/dbmigration/RuleDevicesTable;->getDayId()I

    move-result v25

    move/from16 v0, p2

    move/from16 v1, v25

    if-eq v0, v1, :cond_4

    .line 104
    invoke-virtual {v9}, Ljava/lang/Integer;->intValue()I

    move-result v25

    sget v26, Lcom/belkin/rules/utils/RulesConstants;->MAX_HOUR:I

    move/from16 v0, v25

    move/from16 v1, v26

    if-le v0, v1, :cond_4

    .line 105
    invoke-virtual {v9}, Ljava/lang/Integer;->intValue()I

    move-result v25

    sget v26, Lcom/belkin/rules/utils/RulesConstants;->MAX_HOUR:I

    sub-int v25, v25, v26

    invoke-static/range {v25 .. v25}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v9

    .line 106
    const/4 v8, 0x1

    .line 107
    sget v25, Lcom/belkin/rules/utils/RulesConstants;->MIN_TIME:I

    invoke-static/range {v25 .. v25}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v17

    .line 108
    const/16 v16, 0x1

    .line 112
    :cond_4
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/rules/utils/WeeklyCalenderStringsCreator;->rDB:Lcom/belkin/rules/db/RulesDb;

    move-object/from16 v25, v0

    invoke-virtual/range {p1 .. p1}, Lcom/belkin/rules/dbmigration/RuleDevicesTable;->getRuleId()I

    move-result v26

    invoke-static/range {v26 .. v26}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v26

    invoke-virtual/range {v25 .. v26}, Lcom/belkin/rules/db/RulesDb;->getRuleType(Ljava/lang/Integer;)Ljava/lang/String;

    move-result-object v25

    sget-object v26, Lcom/belkin/rules/utils/RulesConstants;->RULE_SIMPLE_TIMER:Ljava/lang/String;

    invoke-virtual/range {v25 .. v26}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v25

    if-nez v25, :cond_5

    if-eqz v10, :cond_6

    .line 113
    :cond_5
    if-eqz v16, :cond_6

    .line 114
    new-instance v25, Ljava/lang/StringBuilder;

    invoke-direct/range {v25 .. v25}, Ljava/lang/StringBuilder;-><init>()V

    sget-char v26, Lcom/belkin/rules/utils/RulesConstants;->SCHD_SEP:C

    invoke-virtual/range {v25 .. v26}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v25

    invoke-virtual/range {v17 .. v17}, Ljava/lang/Integer;->toString()Ljava/lang/String;

    move-result-object v26

    invoke-virtual/range {v25 .. v26}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v25

    sget-char v26, Lcom/belkin/rules/utils/RulesConstants;->COMMA:C

    invoke-virtual/range {v25 .. v26}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v25

    invoke-virtual/range {p1 .. p1}, Lcom/belkin/rules/dbmigration/RuleDevicesTable;->getStartAction()D

    move-result-wide v26

    move-wide/from16 v0, v26

    double-to-int v0, v0

    move/from16 v26, v0

    invoke-static/range {v26 .. v26}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v26

    invoke-virtual/range {v26 .. v26}, Ljava/lang/Integer;->toString()Ljava/lang/String;

    move-result-object v26

    invoke-virtual/range {v25 .. v26}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v25

    invoke-virtual/range {v25 .. v25}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v22

    .line 115
    .local v22, "tmpStr":Ljava/lang/String;
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/rules/utils/WeeklyCalenderStringsCreator;->scheduleStringActions:Ljava/util/ArrayList;

    move-object/from16 v25, v0

    new-instance v26, Lcom/belkin/rules/utils/ScheduleStringAction;

    invoke-virtual/range {v17 .. v17}, Ljava/lang/Integer;->intValue()I

    move-result v27

    move-object/from16 v0, v26

    move/from16 v1, v27

    move-object/from16 v2, v22

    invoke-direct {v0, v1, v2}, Lcom/belkin/rules/utils/ScheduleStringAction;-><init>(ILjava/lang/String;)V

    invoke-virtual/range {v25 .. v26}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 116
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/rules/utils/WeeklyCalenderStringsCreator;->lstSRSSOffset:Ljava/util/ArrayList;

    move-object/from16 v25, v0

    invoke-virtual/range {p1 .. p1}, Lcom/belkin/rules/dbmigration/RuleDevicesTable;->getOnModeOffset()I

    move-result v26

    invoke-static/range {v26 .. v26}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v26

    invoke-virtual/range {v25 .. v26}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 117
    new-instance v25, Ljava/lang/StringBuilder;

    invoke-direct/range {v25 .. v25}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, v25

    invoke-virtual {v0, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v25

    move-object/from16 v0, v25

    move-object/from16 v1, v22

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v25

    invoke-virtual/range {v25 .. v25}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v13

    .line 118
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/rules/utils/WeeklyCalenderStringsCreator;->rulesCount:Ljava/lang/Integer;

    move-object/from16 v25, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/rules/utils/WeeklyCalenderStringsCreator;->rulesCount:Ljava/lang/Integer;

    move-object/from16 v25, v0

    invoke-virtual/range {v25 .. v25}, Ljava/lang/Integer;->intValue()I

    move-result v25

    add-int/lit8 v25, v25, 0x1

    invoke-static/range {v25 .. v25}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v25

    move-object/from16 v0, v25

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/belkin/rules/utils/WeeklyCalenderStringsCreator;->rulesCount:Ljava/lang/Integer;

    .line 122
    .end local v22    # "tmpStr":Ljava/lang/String;
    :cond_6
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/rules/utils/WeeklyCalenderStringsCreator;->rDB:Lcom/belkin/rules/db/RulesDb;

    move-object/from16 v25, v0

    invoke-virtual/range {p1 .. p1}, Lcom/belkin/rules/dbmigration/RuleDevicesTable;->getRuleId()I

    move-result v26

    invoke-static/range {v26 .. v26}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v26

    invoke-virtual/range {v25 .. v26}, Lcom/belkin/rules/db/RulesDb;->getRuleType(Ljava/lang/Integer;)Ljava/lang/String;

    move-result-object v25

    sget-object v26, Lcom/belkin/rules/utils/RulesConstants;->RULE_TIME_INTERVAL:Ljava/lang/String;

    invoke-virtual/range {v25 .. v26}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v25

    if-eqz v25, :cond_8

    if-nez v10, :cond_8

    .line 123
    if-eqz v16, :cond_7

    .line 124
    new-instance v25, Ljava/lang/StringBuilder;

    invoke-direct/range {v25 .. v25}, Ljava/lang/StringBuilder;-><init>()V

    sget-char v26, Lcom/belkin/rules/utils/RulesConstants;->SCHD_SEP:C

    invoke-virtual/range {v25 .. v26}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v25

    invoke-virtual/range {v17 .. v17}, Ljava/lang/Integer;->toString()Ljava/lang/String;

    move-result-object v26

    invoke-virtual/range {v25 .. v26}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v25

    sget-char v26, Lcom/belkin/rules/utils/RulesConstants;->COMMA:C

    invoke-virtual/range {v25 .. v26}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v25

    invoke-virtual/range {p1 .. p1}, Lcom/belkin/rules/dbmigration/RuleDevicesTable;->getStartAction()D

    move-result-wide v26

    move-wide/from16 v0, v26

    double-to-int v0, v0

    move/from16 v26, v0

    invoke-static/range {v26 .. v26}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v26

    invoke-virtual/range {v26 .. v26}, Ljava/lang/Integer;->toString()Ljava/lang/String;

    move-result-object v26

    invoke-virtual/range {v25 .. v26}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v25

    invoke-virtual/range {v25 .. v25}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v22

    .line 125
    .restart local v22    # "tmpStr":Ljava/lang/String;
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/rules/utils/WeeklyCalenderStringsCreator;->scheduleStringActions:Ljava/util/ArrayList;

    move-object/from16 v25, v0

    new-instance v26, Lcom/belkin/rules/utils/ScheduleStringAction;

    invoke-virtual/range {v17 .. v17}, Ljava/lang/Integer;->intValue()I

    move-result v27

    move-object/from16 v0, v26

    move/from16 v1, v27

    move-object/from16 v2, v22

    invoke-direct {v0, v1, v2}, Lcom/belkin/rules/utils/ScheduleStringAction;-><init>(ILjava/lang/String;)V

    invoke-virtual/range {v25 .. v26}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 126
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/rules/utils/WeeklyCalenderStringsCreator;->lstSRSSOffset:Ljava/util/ArrayList;

    move-object/from16 v25, v0

    invoke-virtual/range {p1 .. p1}, Lcom/belkin/rules/dbmigration/RuleDevicesTable;->getOnModeOffset()I

    move-result v26

    invoke-static/range {v26 .. v26}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v26

    invoke-virtual/range {v25 .. v26}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 127
    new-instance v25, Ljava/lang/StringBuilder;

    invoke-direct/range {v25 .. v25}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, v25

    invoke-virtual {v0, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v25

    move-object/from16 v0, v25

    move-object/from16 v1, v22

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v25

    invoke-virtual/range {v25 .. v25}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v13

    .line 128
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/rules/utils/WeeklyCalenderStringsCreator;->rulesCount:Ljava/lang/Integer;

    move-object/from16 v25, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/rules/utils/WeeklyCalenderStringsCreator;->rulesCount:Ljava/lang/Integer;

    move-object/from16 v25, v0

    invoke-virtual/range {v25 .. v25}, Ljava/lang/Integer;->intValue()I

    move-result v25

    add-int/lit8 v25, v25, 0x1

    invoke-static/range {v25 .. v25}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v25

    move-object/from16 v0, v25

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/belkin/rules/utils/WeeklyCalenderStringsCreator;->rulesCount:Ljava/lang/Integer;

    .line 130
    .end local v22    # "tmpStr":Ljava/lang/String;
    :cond_7
    if-eqz v8, :cond_8

    .line 131
    new-instance v25, Ljava/lang/StringBuilder;

    invoke-direct/range {v25 .. v25}, Ljava/lang/StringBuilder;-><init>()V

    sget-char v26, Lcom/belkin/rules/utils/RulesConstants;->SCHD_SEP:C

    invoke-virtual/range {v25 .. v26}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v25

    invoke-virtual {v9}, Ljava/lang/Integer;->toString()Ljava/lang/String;

    move-result-object v26

    invoke-virtual/range {v25 .. v26}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v25

    sget-char v26, Lcom/belkin/rules/utils/RulesConstants;->COMMA:C

    invoke-virtual/range {v25 .. v26}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v25

    invoke-virtual/range {p1 .. p1}, Lcom/belkin/rules/dbmigration/RuleDevicesTable;->getEndAction()D

    move-result-wide v26

    move-wide/from16 v0, v26

    double-to-int v0, v0

    move/from16 v26, v0

    invoke-static/range {v26 .. v26}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v26

    invoke-virtual/range {v26 .. v26}, Ljava/lang/Integer;->toString()Ljava/lang/String;

    move-result-object v26

    invoke-virtual/range {v25 .. v26}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v25

    invoke-virtual/range {v25 .. v25}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v22

    .line 132
    .restart local v22    # "tmpStr":Ljava/lang/String;
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/rules/utils/WeeklyCalenderStringsCreator;->scheduleStringActions:Ljava/util/ArrayList;

    move-object/from16 v25, v0

    new-instance v26, Lcom/belkin/rules/utils/ScheduleStringAction;

    invoke-virtual {v9}, Ljava/lang/Integer;->intValue()I

    move-result v27

    move-object/from16 v0, v26

    move/from16 v1, v27

    move-object/from16 v2, v22

    invoke-direct {v0, v1, v2}, Lcom/belkin/rules/utils/ScheduleStringAction;-><init>(ILjava/lang/String;)V

    invoke-virtual/range {v25 .. v26}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 133
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/rules/utils/WeeklyCalenderStringsCreator;->lstSRSSOffset:Ljava/util/ArrayList;

    move-object/from16 v25, v0

    invoke-virtual/range {p1 .. p1}, Lcom/belkin/rules/dbmigration/RuleDevicesTable;->getOffModeOffset()I

    move-result v26

    invoke-static/range {v26 .. v26}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v26

    invoke-virtual/range {v25 .. v26}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 134
    new-instance v25, Ljava/lang/StringBuilder;

    invoke-direct/range {v25 .. v25}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, v25

    invoke-virtual {v0, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v25

    move-object/from16 v0, v25

    move-object/from16 v1, v22

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v25

    invoke-virtual/range {v25 .. v25}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v13

    .line 135
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/rules/utils/WeeklyCalenderStringsCreator;->rulesCount:Ljava/lang/Integer;

    move-object/from16 v25, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/rules/utils/WeeklyCalenderStringsCreator;->rulesCount:Ljava/lang/Integer;

    move-object/from16 v25, v0

    invoke-virtual/range {v25 .. v25}, Ljava/lang/Integer;->intValue()I

    move-result v25

    add-int/lit8 v25, v25, 0x1

    invoke-static/range {v25 .. v25}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v25

    move-object/from16 v0, v25

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/belkin/rules/utils/WeeklyCalenderStringsCreator;->rulesCount:Ljava/lang/Integer;

    .line 138
    .end local v22    # "tmpStr":Ljava/lang/String;
    :cond_8
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/rules/utils/WeeklyCalenderStringsCreator;->rDB:Lcom/belkin/rules/db/RulesDb;

    move-object/from16 v25, v0

    invoke-virtual/range {p1 .. p1}, Lcom/belkin/rules/dbmigration/RuleDevicesTable;->getRuleId()I

    move-result v26

    invoke-static/range {v26 .. v26}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v26

    invoke-virtual/range {v25 .. v26}, Lcom/belkin/rules/db/RulesDb;->getRuleType(Ljava/lang/Integer;)Ljava/lang/String;

    move-result-object v25

    sget-object v26, Lcom/belkin/rules/utils/RulesConstants;->AWAY_MODE:Ljava/lang/String;

    invoke-virtual/range {v25 .. v26}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v25

    if-eqz v25, :cond_a

    .line 139
    if-eqz v16, :cond_9

    .line 140
    invoke-virtual/range {v17 .. v17}, Ljava/lang/Integer;->intValue()I

    move-result v25

    add-int/lit8 v25, v25, 0x3

    invoke-static/range {v25 .. v25}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v17

    .line 141
    new-instance v25, Ljava/lang/StringBuilder;

    invoke-direct/range {v25 .. v25}, Ljava/lang/StringBuilder;-><init>()V

    sget-char v26, Lcom/belkin/rules/utils/RulesConstants;->SCHD_SEP:C

    invoke-virtual/range {v25 .. v26}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v25

    invoke-virtual/range {v17 .. v17}, Ljava/lang/Integer;->toString()Ljava/lang/String;

    move-result-object v26

    invoke-virtual/range {v25 .. v26}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v25

    sget-char v26, Lcom/belkin/rules/utils/RulesConstants;->COMMA:C

    invoke-virtual/range {v25 .. v26}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v25

    invoke-virtual/range {p1 .. p1}, Lcom/belkin/rules/dbmigration/RuleDevicesTable;->getStartAction()D

    move-result-wide v26

    move-wide/from16 v0, v26

    double-to-int v0, v0

    move/from16 v26, v0

    invoke-static/range {v26 .. v26}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v26

    invoke-virtual/range {v26 .. v26}, Ljava/lang/Integer;->toString()Ljava/lang/String;

    move-result-object v26

    invoke-virtual/range {v25 .. v26}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v25

    invoke-virtual/range {v25 .. v25}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v22

    .line 142
    .restart local v22    # "tmpStr":Ljava/lang/String;
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/rules/utils/WeeklyCalenderStringsCreator;->scheduleStringActions:Ljava/util/ArrayList;

    move-object/from16 v25, v0

    new-instance v26, Lcom/belkin/rules/utils/ScheduleStringAction;

    invoke-virtual/range {v17 .. v17}, Ljava/lang/Integer;->intValue()I

    move-result v27

    move-object/from16 v0, v26

    move/from16 v1, v27

    move-object/from16 v2, v22

    invoke-direct {v0, v1, v2}, Lcom/belkin/rules/utils/ScheduleStringAction;-><init>(ILjava/lang/String;)V

    invoke-virtual/range {v25 .. v26}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 143
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/rules/utils/WeeklyCalenderStringsCreator;->lstSRSSOffset:Ljava/util/ArrayList;

    move-object/from16 v25, v0

    invoke-virtual/range {p1 .. p1}, Lcom/belkin/rules/dbmigration/RuleDevicesTable;->getOnModeOffset()I

    move-result v26

    invoke-static/range {v26 .. v26}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v26

    invoke-virtual/range {v25 .. v26}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 144
    new-instance v25, Ljava/lang/StringBuilder;

    invoke-direct/range {v25 .. v25}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, v25

    invoke-virtual {v0, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v25

    move-object/from16 v0, v25

    move-object/from16 v1, v22

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v25

    invoke-virtual/range {v25 .. v25}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v13

    .line 145
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/rules/utils/WeeklyCalenderStringsCreator;->rulesCount:Ljava/lang/Integer;

    move-object/from16 v25, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/rules/utils/WeeklyCalenderStringsCreator;->rulesCount:Ljava/lang/Integer;

    move-object/from16 v25, v0

    invoke-virtual/range {v25 .. v25}, Ljava/lang/Integer;->intValue()I

    move-result v25

    add-int/lit8 v25, v25, 0x1

    invoke-static/range {v25 .. v25}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v25

    move-object/from16 v0, v25

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/belkin/rules/utils/WeeklyCalenderStringsCreator;->rulesCount:Ljava/lang/Integer;

    .line 147
    .end local v22    # "tmpStr":Ljava/lang/String;
    :cond_9
    if-eqz v8, :cond_a

    .line 148
    invoke-virtual {v9}, Ljava/lang/Integer;->intValue()I

    move-result v25

    sget v26, Lcom/belkin/rules/utils/RulesConstants;->MIDNIGHT_END_TIME:I

    move/from16 v0, v25

    move/from16 v1, v26

    if-ne v0, v1, :cond_17

    sget v25, Lcom/belkin/rules/utils/RulesConstants;->MAX_HOUR:I

    :goto_1
    add-int/lit8 v25, v25, 0x3

    invoke-static/range {v25 .. v25}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v9

    .line 149
    new-instance v25, Ljava/lang/StringBuilder;

    invoke-direct/range {v25 .. v25}, Ljava/lang/StringBuilder;-><init>()V

    sget-char v26, Lcom/belkin/rules/utils/RulesConstants;->SCHD_SEP:C

    invoke-virtual/range {v25 .. v26}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v25

    invoke-virtual {v9}, Ljava/lang/Integer;->toString()Ljava/lang/String;

    move-result-object v26

    invoke-virtual/range {v25 .. v26}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v25

    sget-char v26, Lcom/belkin/rules/utils/RulesConstants;->COMMA:C

    invoke-virtual/range {v25 .. v26}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v25

    invoke-virtual/range {p1 .. p1}, Lcom/belkin/rules/dbmigration/RuleDevicesTable;->getEndAction()D

    move-result-wide v26

    move-wide/from16 v0, v26

    double-to-int v0, v0

    move/from16 v26, v0

    invoke-static/range {v26 .. v26}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v26

    invoke-virtual/range {v26 .. v26}, Ljava/lang/Integer;->toString()Ljava/lang/String;

    move-result-object v26

    invoke-virtual/range {v25 .. v26}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v25

    invoke-virtual/range {v25 .. v25}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v22

    .line 150
    .restart local v22    # "tmpStr":Ljava/lang/String;
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/rules/utils/WeeklyCalenderStringsCreator;->scheduleStringActions:Ljava/util/ArrayList;

    move-object/from16 v25, v0

    new-instance v26, Lcom/belkin/rules/utils/ScheduleStringAction;

    invoke-virtual {v9}, Ljava/lang/Integer;->intValue()I

    move-result v27

    move-object/from16 v0, v26

    move/from16 v1, v27

    move-object/from16 v2, v22

    invoke-direct {v0, v1, v2}, Lcom/belkin/rules/utils/ScheduleStringAction;-><init>(ILjava/lang/String;)V

    invoke-virtual/range {v25 .. v26}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 151
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/rules/utils/WeeklyCalenderStringsCreator;->lstSRSSOffset:Ljava/util/ArrayList;

    move-object/from16 v25, v0

    invoke-virtual/range {p1 .. p1}, Lcom/belkin/rules/dbmigration/RuleDevicesTable;->getOffModeOffset()I

    move-result v26

    invoke-static/range {v26 .. v26}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v26

    invoke-virtual/range {v25 .. v26}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 152
    new-instance v25, Ljava/lang/StringBuilder;

    invoke-direct/range {v25 .. v25}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, v25

    invoke-virtual {v0, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v25

    move-object/from16 v0, v25

    move-object/from16 v1, v22

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v25

    invoke-virtual/range {v25 .. v25}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v13

    .line 153
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/rules/utils/WeeklyCalenderStringsCreator;->rulesCount:Ljava/lang/Integer;

    move-object/from16 v25, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/rules/utils/WeeklyCalenderStringsCreator;->rulesCount:Ljava/lang/Integer;

    move-object/from16 v25, v0

    invoke-virtual/range {v25 .. v25}, Ljava/lang/Integer;->intValue()I

    move-result v25

    add-int/lit8 v25, v25, 0x1

    invoke-static/range {v25 .. v25}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v25

    move-object/from16 v0, v25

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/belkin/rules/utils/WeeklyCalenderStringsCreator;->rulesCount:Ljava/lang/Integer;

    .line 157
    .end local v22    # "tmpStr":Ljava/lang/String;
    :cond_a
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/rules/utils/WeeklyCalenderStringsCreator;->rDB:Lcom/belkin/rules/db/RulesDb;

    move-object/from16 v25, v0

    invoke-virtual/range {p1 .. p1}, Lcom/belkin/rules/dbmigration/RuleDevicesTable;->getRuleId()I

    move-result v26

    invoke-static/range {v26 .. v26}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v26

    invoke-virtual/range {v25 .. v26}, Lcom/belkin/rules/db/RulesDb;->getRuleType(Ljava/lang/Integer;)Ljava/lang/String;

    move-result-object v25

    sget-object v26, Lcom/belkin/rules/utils/RulesConstants;->RULE_INSIGHT:Ljava/lang/String;

    invoke-virtual/range {v25 .. v26}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v25

    if-eqz v25, :cond_c

    .line 158
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/rules/utils/WeeklyCalenderStringsCreator;->rDB:Lcom/belkin/rules/db/RulesDb;

    move-object/from16 v25, v0

    invoke-virtual/range {p1 .. p1}, Lcom/belkin/rules/dbmigration/RuleDevicesTable;->getRuleId()I

    move-result v26

    invoke-static/range {v26 .. v26}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v26

    invoke-virtual/range {v25 .. v26}, Lcom/belkin/rules/db/RulesDb;->getExtendedFeatureStr(Ljava/lang/Integer;)Ljava/lang/String;

    move-result-object v6

    .line 159
    .local v6, "efString":Ljava/lang/String;
    if-eqz v16, :cond_b

    .line 160
    new-instance v25, Ljava/lang/StringBuilder;

    invoke-direct/range {v25 .. v25}, Ljava/lang/StringBuilder;-><init>()V

    sget-char v26, Lcom/belkin/rules/utils/RulesConstants;->SCHD_SEP:C

    invoke-virtual/range {v25 .. v26}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v25

    invoke-virtual/range {v17 .. v17}, Ljava/lang/Integer;->toString()Ljava/lang/String;

    move-result-object v26

    invoke-virtual/range {v25 .. v26}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v25

    sget-char v26, Lcom/belkin/rules/utils/RulesConstants;->COMMA:C

    invoke-virtual/range {v25 .. v26}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v25

    const-string v26, "1"

    invoke-virtual/range {v25 .. v26}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v25

    const-string v26, ",[1"

    invoke-virtual/range {v25 .. v26}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v25

    sget-char v26, Lcom/belkin/rules/utils/RulesConstants;->SEMICOLUMN:C

    invoke-virtual/range {v25 .. v26}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v25

    const-string v26, "0"

    invoke-virtual/range {v25 .. v26}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v25

    sget-char v26, Lcom/belkin/rules/utils/RulesConstants;->SEMICOLUMN:C

    invoke-virtual/range {v25 .. v26}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v25

    const-string v26, "0"

    invoke-virtual/range {v25 .. v26}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v25

    sget-char v26, Lcom/belkin/rules/utils/RulesConstants;->SEMICOLUMN:C

    invoke-virtual/range {v25 .. v26}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v25

    invoke-virtual/range {p1 .. p1}, Lcom/belkin/rules/dbmigration/RuleDevicesTable;->getDeviceId()Ljava/lang/String;

    move-result-object v26

    invoke-virtual/range {v25 .. v26}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v25

    const-string v26, ",9,"

    invoke-virtual/range {v25 .. v26}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v25

    invoke-virtual/range {p1 .. p1}, Lcom/belkin/rules/dbmigration/RuleDevicesTable;->getSensorDuration()I

    move-result v26

    invoke-virtual/range {v25 .. v26}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v25

    const-string v26, ",0@"

    invoke-virtual/range {v25 .. v26}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v25

    move-object/from16 v0, v25

    invoke-virtual {v0, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v25

    const-string v26, "@]"

    invoke-virtual/range {v25 .. v26}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v25

    invoke-virtual/range {v25 .. v25}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v22

    .line 162
    .restart local v22    # "tmpStr":Ljava/lang/String;
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/rules/utils/WeeklyCalenderStringsCreator;->scheduleStringActions:Ljava/util/ArrayList;

    move-object/from16 v25, v0

    new-instance v26, Lcom/belkin/rules/utils/ScheduleStringAction;

    invoke-virtual/range {v17 .. v17}, Ljava/lang/Integer;->intValue()I

    move-result v27

    move-object/from16 v0, v26

    move/from16 v1, v27

    move-object/from16 v2, v22

    invoke-direct {v0, v1, v2}, Lcom/belkin/rules/utils/ScheduleStringAction;-><init>(ILjava/lang/String;)V

    invoke-virtual/range {v25 .. v26}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 163
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/rules/utils/WeeklyCalenderStringsCreator;->lstSRSSOffset:Ljava/util/ArrayList;

    move-object/from16 v25, v0

    invoke-virtual/range {p1 .. p1}, Lcom/belkin/rules/dbmigration/RuleDevicesTable;->getOnModeOffset()I

    move-result v26

    invoke-static/range {v26 .. v26}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v26

    invoke-virtual/range {v25 .. v26}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 164
    new-instance v25, Ljava/lang/StringBuilder;

    invoke-direct/range {v25 .. v25}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, v25

    invoke-virtual {v0, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v25

    move-object/from16 v0, v25

    move-object/from16 v1, v22

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v25

    invoke-virtual/range {v25 .. v25}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v13

    .line 165
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/rules/utils/WeeklyCalenderStringsCreator;->rulesCount:Ljava/lang/Integer;

    move-object/from16 v25, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/rules/utils/WeeklyCalenderStringsCreator;->rulesCount:Ljava/lang/Integer;

    move-object/from16 v25, v0

    invoke-virtual/range {v25 .. v25}, Ljava/lang/Integer;->intValue()I

    move-result v25

    add-int/lit8 v25, v25, 0x1

    invoke-static/range {v25 .. v25}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v25

    move-object/from16 v0, v25

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/belkin/rules/utils/WeeklyCalenderStringsCreator;->rulesCount:Ljava/lang/Integer;

    .line 167
    .end local v22    # "tmpStr":Ljava/lang/String;
    :cond_b
    if-eqz v8, :cond_c

    .line 168
    new-instance v25, Ljava/lang/StringBuilder;

    invoke-direct/range {v25 .. v25}, Ljava/lang/StringBuilder;-><init>()V

    sget-char v26, Lcom/belkin/rules/utils/RulesConstants;->SCHD_SEP:C

    invoke-virtual/range {v25 .. v26}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v25

    invoke-virtual {v9}, Ljava/lang/Integer;->toString()Ljava/lang/String;

    move-result-object v26

    invoke-virtual/range {v25 .. v26}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v25

    sget-char v26, Lcom/belkin/rules/utils/RulesConstants;->COMMA:C

    invoke-virtual/range {v25 .. v26}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v25

    invoke-virtual/range {p1 .. p1}, Lcom/belkin/rules/dbmigration/RuleDevicesTable;->getEndAction()D

    move-result-wide v26

    move-wide/from16 v0, v26

    double-to-int v0, v0

    move/from16 v26, v0

    invoke-static/range {v26 .. v26}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v26

    invoke-virtual/range {v26 .. v26}, Ljava/lang/Integer;->toString()Ljava/lang/String;

    move-result-object v26

    invoke-virtual/range {v25 .. v26}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v25

    invoke-virtual/range {v25 .. v25}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v22

    .line 169
    .restart local v22    # "tmpStr":Ljava/lang/String;
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/rules/utils/WeeklyCalenderStringsCreator;->scheduleStringActions:Ljava/util/ArrayList;

    move-object/from16 v25, v0

    new-instance v26, Lcom/belkin/rules/utils/ScheduleStringAction;

    invoke-virtual {v9}, Ljava/lang/Integer;->intValue()I

    move-result v27

    move-object/from16 v0, v26

    move/from16 v1, v27

    move-object/from16 v2, v22

    invoke-direct {v0, v1, v2}, Lcom/belkin/rules/utils/ScheduleStringAction;-><init>(ILjava/lang/String;)V

    invoke-virtual/range {v25 .. v26}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 170
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/rules/utils/WeeklyCalenderStringsCreator;->lstSRSSOffset:Ljava/util/ArrayList;

    move-object/from16 v25, v0

    invoke-virtual/range {p1 .. p1}, Lcom/belkin/rules/dbmigration/RuleDevicesTable;->getOffModeOffset()I

    move-result v26

    invoke-static/range {v26 .. v26}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v26

    invoke-virtual/range {v25 .. v26}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 171
    new-instance v25, Ljava/lang/StringBuilder;

    invoke-direct/range {v25 .. v25}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, v25

    invoke-virtual {v0, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v25

    move-object/from16 v0, v25

    move-object/from16 v1, v22

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v25

    invoke-virtual/range {v25 .. v25}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v13

    .line 172
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/rules/utils/WeeklyCalenderStringsCreator;->rulesCount:Ljava/lang/Integer;

    move-object/from16 v25, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/rules/utils/WeeklyCalenderStringsCreator;->rulesCount:Ljava/lang/Integer;

    move-object/from16 v25, v0

    invoke-virtual/range {v25 .. v25}, Ljava/lang/Integer;->intValue()I

    move-result v25

    add-int/lit8 v25, v25, 0x1

    invoke-static/range {v25 .. v25}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v25

    move-object/from16 v0, v25

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/belkin/rules/utils/WeeklyCalenderStringsCreator;->rulesCount:Ljava/lang/Integer;

    .line 176
    .end local v6    # "efString":Ljava/lang/String;
    .end local v22    # "tmpStr":Ljava/lang/String;
    :cond_c
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/rules/utils/WeeklyCalenderStringsCreator;->rDB:Lcom/belkin/rules/db/RulesDb;

    move-object/from16 v25, v0

    invoke-virtual/range {p1 .. p1}, Lcom/belkin/rules/dbmigration/RuleDevicesTable;->getRuleId()I

    move-result v26

    invoke-static/range {v26 .. v26}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v26

    invoke-virtual/range {v25 .. v26}, Lcom/belkin/rules/db/RulesDb;->getRuleType(Ljava/lang/Integer;)Ljava/lang/String;

    move-result-object v25

    sget-object v26, Lcom/belkin/rules/utils/RulesConstants;->RULE_SENSOR_NOTIFICATION:Ljava/lang/String;

    invoke-virtual/range {v25 .. v26}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v25

    if-eqz v25, :cond_e

    .line 177
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/rules/utils/WeeklyCalenderStringsCreator;->rDB:Lcom/belkin/rules/db/RulesDb;

    move-object/from16 v25, v0

    invoke-virtual/range {p1 .. p1}, Lcom/belkin/rules/dbmigration/RuleDevicesTable;->getRuleId()I

    move-result v26

    invoke-static/range {v26 .. v26}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v26

    invoke-virtual/range {v25 .. v26}, Lcom/belkin/rules/db/RulesDb;->getNotifyRuleID(Ljava/lang/Integer;)Ljava/lang/String;

    move-result-object v11

    .line 178
    .local v11, "notifyRuleID":Ljava/lang/String;
    if-eqz v16, :cond_d

    .line 179
    new-instance v25, Ljava/lang/StringBuilder;

    invoke-direct/range {v25 .. v25}, Ljava/lang/StringBuilder;-><init>()V

    sget-char v26, Lcom/belkin/rules/utils/RulesConstants;->SCHD_SEP:C

    invoke-virtual/range {v25 .. v26}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v25

    invoke-virtual/range {v17 .. v17}, Ljava/lang/Integer;->toString()Ljava/lang/String;

    move-result-object v26

    invoke-virtual/range {v25 .. v26}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v25

    sget-char v26, Lcom/belkin/rules/utils/RulesConstants;->COMMA:C

    invoke-virtual/range {v25 .. v26}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v25

    const-string v26, "1"

    invoke-virtual/range {v25 .. v26}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v25

    const-string v26, ",[1"

    invoke-virtual/range {v25 .. v26}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v25

    sget-char v26, Lcom/belkin/rules/utils/RulesConstants;->SEMICOLUMN:C

    invoke-virtual/range {v25 .. v26}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v25

    const-string v26, "0"

    invoke-virtual/range {v25 .. v26}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v25

    sget-char v26, Lcom/belkin/rules/utils/RulesConstants;->SEMICOLUMN:C

    invoke-virtual/range {v25 .. v26}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v25

    const-string v26, "0"

    invoke-virtual/range {v25 .. v26}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v25

    sget-char v26, Lcom/belkin/rules/utils/RulesConstants;->SEMICOLUMN:C

    invoke-virtual/range {v25 .. v26}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v25

    invoke-virtual/range {p1 .. p1}, Lcom/belkin/rules/dbmigration/RuleDevicesTable;->getDeviceId()Ljava/lang/String;

    move-result-object v26

    invoke-virtual/range {v25 .. v26}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v25

    const-string v26, ",9,"

    invoke-virtual/range {v25 .. v26}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v25

    move-object/from16 v0, v25

    invoke-virtual {v0, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v25

    const-string v26, ",0]"

    invoke-virtual/range {v25 .. v26}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v25

    invoke-virtual/range {v25 .. v25}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v22

    .line 181
    .restart local v22    # "tmpStr":Ljava/lang/String;
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/rules/utils/WeeklyCalenderStringsCreator;->scheduleStringActions:Ljava/util/ArrayList;

    move-object/from16 v25, v0

    new-instance v26, Lcom/belkin/rules/utils/ScheduleStringAction;

    invoke-virtual/range {v17 .. v17}, Ljava/lang/Integer;->intValue()I

    move-result v27

    move-object/from16 v0, v26

    move/from16 v1, v27

    move-object/from16 v2, v22

    invoke-direct {v0, v1, v2}, Lcom/belkin/rules/utils/ScheduleStringAction;-><init>(ILjava/lang/String;)V

    invoke-virtual/range {v25 .. v26}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 182
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/rules/utils/WeeklyCalenderStringsCreator;->lstSRSSOffset:Ljava/util/ArrayList;

    move-object/from16 v25, v0

    invoke-virtual/range {p1 .. p1}, Lcom/belkin/rules/dbmigration/RuleDevicesTable;->getOnModeOffset()I

    move-result v26

    invoke-static/range {v26 .. v26}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v26

    invoke-virtual/range {v25 .. v26}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 183
    new-instance v25, Ljava/lang/StringBuilder;

    invoke-direct/range {v25 .. v25}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, v25

    invoke-virtual {v0, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v25

    move-object/from16 v0, v25

    move-object/from16 v1, v22

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v25

    invoke-virtual/range {v25 .. v25}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v13

    .line 184
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/rules/utils/WeeklyCalenderStringsCreator;->rulesCount:Ljava/lang/Integer;

    move-object/from16 v25, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/rules/utils/WeeklyCalenderStringsCreator;->rulesCount:Ljava/lang/Integer;

    move-object/from16 v25, v0

    invoke-virtual/range {v25 .. v25}, Ljava/lang/Integer;->intValue()I

    move-result v25

    add-int/lit8 v25, v25, 0x1

    invoke-static/range {v25 .. v25}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v25

    move-object/from16 v0, v25

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/belkin/rules/utils/WeeklyCalenderStringsCreator;->rulesCount:Ljava/lang/Integer;

    .line 186
    .end local v22    # "tmpStr":Ljava/lang/String;
    :cond_d
    if-eqz v8, :cond_e

    .line 187
    new-instance v25, Ljava/lang/StringBuilder;

    invoke-direct/range {v25 .. v25}, Ljava/lang/StringBuilder;-><init>()V

    sget-char v26, Lcom/belkin/rules/utils/RulesConstants;->SCHD_SEP:C

    invoke-virtual/range {v25 .. v26}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v25

    invoke-virtual {v9}, Ljava/lang/Integer;->toString()Ljava/lang/String;

    move-result-object v26

    invoke-virtual/range {v25 .. v26}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v25

    sget-char v26, Lcom/belkin/rules/utils/RulesConstants;->COMMA:C

    invoke-virtual/range {v25 .. v26}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v25

    invoke-virtual/range {p1 .. p1}, Lcom/belkin/rules/dbmigration/RuleDevicesTable;->getEndAction()D

    move-result-wide v26

    move-wide/from16 v0, v26

    double-to-int v0, v0

    move/from16 v26, v0

    invoke-static/range {v26 .. v26}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v26

    invoke-virtual/range {v26 .. v26}, Ljava/lang/Integer;->toString()Ljava/lang/String;

    move-result-object v26

    invoke-virtual/range {v25 .. v26}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v25

    invoke-virtual/range {v25 .. v25}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v22

    .line 188
    .restart local v22    # "tmpStr":Ljava/lang/String;
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/rules/utils/WeeklyCalenderStringsCreator;->scheduleStringActions:Ljava/util/ArrayList;

    move-object/from16 v25, v0

    new-instance v26, Lcom/belkin/rules/utils/ScheduleStringAction;

    invoke-virtual {v9}, Ljava/lang/Integer;->intValue()I

    move-result v27

    move-object/from16 v0, v26

    move/from16 v1, v27

    move-object/from16 v2, v22

    invoke-direct {v0, v1, v2}, Lcom/belkin/rules/utils/ScheduleStringAction;-><init>(ILjava/lang/String;)V

    invoke-virtual/range {v25 .. v26}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 189
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/rules/utils/WeeklyCalenderStringsCreator;->lstSRSSOffset:Ljava/util/ArrayList;

    move-object/from16 v25, v0

    invoke-virtual/range {p1 .. p1}, Lcom/belkin/rules/dbmigration/RuleDevicesTable;->getOffModeOffset()I

    move-result v26

    invoke-static/range {v26 .. v26}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v26

    invoke-virtual/range {v25 .. v26}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 190
    new-instance v25, Ljava/lang/StringBuilder;

    invoke-direct/range {v25 .. v25}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, v25

    invoke-virtual {v0, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v25

    move-object/from16 v0, v25

    move-object/from16 v1, v22

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v25

    invoke-virtual/range {v25 .. v25}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v13

    .line 191
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/rules/utils/WeeklyCalenderStringsCreator;->rulesCount:Ljava/lang/Integer;

    move-object/from16 v25, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/rules/utils/WeeklyCalenderStringsCreator;->rulesCount:Ljava/lang/Integer;

    move-object/from16 v25, v0

    invoke-virtual/range {v25 .. v25}, Ljava/lang/Integer;->intValue()I

    move-result v25

    add-int/lit8 v25, v25, 0x1

    invoke-static/range {v25 .. v25}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v25

    move-object/from16 v0, v25

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/belkin/rules/utils/WeeklyCalenderStringsCreator;->rulesCount:Ljava/lang/Integer;

    .line 195
    .end local v11    # "notifyRuleID":Ljava/lang/String;
    .end local v22    # "tmpStr":Ljava/lang/String;
    :cond_e
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/rules/utils/WeeklyCalenderStringsCreator;->rDB:Lcom/belkin/rules/db/RulesDb;

    move-object/from16 v25, v0

    invoke-virtual/range {p1 .. p1}, Lcom/belkin/rules/dbmigration/RuleDevicesTable;->getRuleId()I

    move-result v26

    invoke-static/range {v26 .. v26}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v26

    invoke-virtual/range {v25 .. v26}, Lcom/belkin/rules/db/RulesDb;->getRuleType(Ljava/lang/Integer;)Ljava/lang/String;

    move-result-object v25

    sget-object v26, Lcom/belkin/rules/utils/RulesConstants;->RULE_MAKER_MOTION_NOTIFICATION:Ljava/lang/String;

    invoke-virtual/range {v25 .. v26}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v25

    if-eqz v25, :cond_10

    .line 196
    sget-object v25, Lcom/belkin/rules/utils/WeeklyCalenderStringsCreator;->TAG:Ljava/lang/String;

    new-instance v26, Ljava/lang/StringBuilder;

    invoke-direct/range {v26 .. v26}, Ljava/lang/StringBuilder;-><init>()V

    const-string v27, "rule.getRuleId() :: "

    invoke-virtual/range {v26 .. v27}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v26

    invoke-virtual/range {p1 .. p1}, Lcom/belkin/rules/dbmigration/RuleDevicesTable;->getRuleId()I

    move-result v27

    invoke-virtual/range {v26 .. v27}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v26

    invoke-virtual/range {v26 .. v26}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v26

    invoke-static/range {v25 .. v26}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 197
    if-eqz v16, :cond_f

    .line 198
    new-instance v25, Ljava/lang/StringBuilder;

    invoke-direct/range {v25 .. v25}, Ljava/lang/StringBuilder;-><init>()V

    sget-char v26, Lcom/belkin/rules/utils/RulesConstants;->SCHD_SEP:C

    invoke-virtual/range {v25 .. v26}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v25

    invoke-virtual/range {v17 .. v17}, Ljava/lang/Integer;->toString()Ljava/lang/String;

    move-result-object v26

    invoke-virtual/range {v25 .. v26}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v25

    sget-char v26, Lcom/belkin/rules/utils/RulesConstants;->COMMA:C

    invoke-virtual/range {v25 .. v26}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v25

    const-string v26, "1"

    invoke-virtual/range {v25 .. v26}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v25

    const-string v26, ",[1"

    invoke-virtual/range {v25 .. v26}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v25

    sget-char v26, Lcom/belkin/rules/utils/RulesConstants;->SEMICOLUMN:C

    invoke-virtual/range {v25 .. v26}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v25

    const-string v26, "0"

    invoke-virtual/range {v25 .. v26}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v25

    sget-char v26, Lcom/belkin/rules/utils/RulesConstants;->SEMICOLUMN:C

    invoke-virtual/range {v25 .. v26}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v25

    const-string v26, "0"

    invoke-virtual/range {v25 .. v26}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v25

    sget-char v26, Lcom/belkin/rules/utils/RulesConstants;->SEMICOLUMN:C

    invoke-virtual/range {v25 .. v26}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v25

    invoke-virtual/range {p1 .. p1}, Lcom/belkin/rules/dbmigration/RuleDevicesTable;->getDeviceId()Ljava/lang/String;

    move-result-object v26

    invoke-virtual/range {v25 .. v26}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v25

    const-string v26, ",9,"

    invoke-virtual/range {v25 .. v26}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v25

    invoke-virtual/range {p1 .. p1}, Lcom/belkin/rules/dbmigration/RuleDevicesTable;->getSensorDuration()I

    move-result v26

    invoke-virtual/range {v25 .. v26}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v25

    const-string v26, ",0@"

    invoke-virtual/range {v25 .. v26}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v25

    invoke-virtual/range {p1 .. p1}, Lcom/belkin/rules/dbmigration/RuleDevicesTable;->getType()I

    move-result v26

    invoke-static/range {v26 .. v26}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v26

    invoke-virtual/range {v26 .. v26}, Ljava/lang/Integer;->toString()Ljava/lang/String;

    move-result-object v26

    invoke-virtual/range {v25 .. v26}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v25

    const-string v26, "@]"

    invoke-virtual/range {v25 .. v26}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v25

    invoke-virtual/range {v25 .. v25}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v22

    .line 200
    .restart local v22    # "tmpStr":Ljava/lang/String;
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/rules/utils/WeeklyCalenderStringsCreator;->scheduleStringActions:Ljava/util/ArrayList;

    move-object/from16 v25, v0

    new-instance v26, Lcom/belkin/rules/utils/ScheduleStringAction;

    invoke-virtual/range {v17 .. v17}, Ljava/lang/Integer;->intValue()I

    move-result v27

    move-object/from16 v0, v26

    move/from16 v1, v27

    move-object/from16 v2, v22

    invoke-direct {v0, v1, v2}, Lcom/belkin/rules/utils/ScheduleStringAction;-><init>(ILjava/lang/String;)V

    invoke-virtual/range {v25 .. v26}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 201
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/rules/utils/WeeklyCalenderStringsCreator;->lstSRSSOffset:Ljava/util/ArrayList;

    move-object/from16 v25, v0

    invoke-virtual/range {p1 .. p1}, Lcom/belkin/rules/dbmigration/RuleDevicesTable;->getOnModeOffset()I

    move-result v26

    invoke-static/range {v26 .. v26}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v26

    invoke-virtual/range {v25 .. v26}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 202
    new-instance v25, Ljava/lang/StringBuilder;

    invoke-direct/range {v25 .. v25}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, v25

    invoke-virtual {v0, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v25

    move-object/from16 v0, v25

    move-object/from16 v1, v22

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v25

    invoke-virtual/range {v25 .. v25}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v13

    .line 203
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/rules/utils/WeeklyCalenderStringsCreator;->rulesCount:Ljava/lang/Integer;

    move-object/from16 v25, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/rules/utils/WeeklyCalenderStringsCreator;->rulesCount:Ljava/lang/Integer;

    move-object/from16 v25, v0

    invoke-virtual/range {v25 .. v25}, Ljava/lang/Integer;->intValue()I

    move-result v25

    add-int/lit8 v25, v25, 0x1

    invoke-static/range {v25 .. v25}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v25

    move-object/from16 v0, v25

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/belkin/rules/utils/WeeklyCalenderStringsCreator;->rulesCount:Ljava/lang/Integer;

    .line 205
    .end local v22    # "tmpStr":Ljava/lang/String;
    :cond_f
    if-eqz v8, :cond_10

    .line 206
    new-instance v25, Ljava/lang/StringBuilder;

    invoke-direct/range {v25 .. v25}, Ljava/lang/StringBuilder;-><init>()V

    sget-char v26, Lcom/belkin/rules/utils/RulesConstants;->SCHD_SEP:C

    invoke-virtual/range {v25 .. v26}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v25

    invoke-virtual {v9}, Ljava/lang/Integer;->toString()Ljava/lang/String;

    move-result-object v26

    invoke-virtual/range {v25 .. v26}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v25

    sget-char v26, Lcom/belkin/rules/utils/RulesConstants;->COMMA:C

    invoke-virtual/range {v25 .. v26}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v25

    invoke-virtual/range {p1 .. p1}, Lcom/belkin/rules/dbmigration/RuleDevicesTable;->getEndAction()D

    move-result-wide v26

    move-wide/from16 v0, v26

    double-to-int v0, v0

    move/from16 v26, v0

    invoke-static/range {v26 .. v26}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v26

    invoke-virtual/range {v26 .. v26}, Ljava/lang/Integer;->toString()Ljava/lang/String;

    move-result-object v26

    invoke-virtual/range {v25 .. v26}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v25

    invoke-virtual/range {v25 .. v25}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v22

    .line 207
    .restart local v22    # "tmpStr":Ljava/lang/String;
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/rules/utils/WeeklyCalenderStringsCreator;->scheduleStringActions:Ljava/util/ArrayList;

    move-object/from16 v25, v0

    new-instance v26, Lcom/belkin/rules/utils/ScheduleStringAction;

    invoke-virtual {v9}, Ljava/lang/Integer;->intValue()I

    move-result v27

    move-object/from16 v0, v26

    move/from16 v1, v27

    move-object/from16 v2, v22

    invoke-direct {v0, v1, v2}, Lcom/belkin/rules/utils/ScheduleStringAction;-><init>(ILjava/lang/String;)V

    invoke-virtual/range {v25 .. v26}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 208
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/rules/utils/WeeklyCalenderStringsCreator;->lstSRSSOffset:Ljava/util/ArrayList;

    move-object/from16 v25, v0

    invoke-virtual/range {p1 .. p1}, Lcom/belkin/rules/dbmigration/RuleDevicesTable;->getOffModeOffset()I

    move-result v26

    invoke-static/range {v26 .. v26}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v26

    invoke-virtual/range {v25 .. v26}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 209
    new-instance v25, Ljava/lang/StringBuilder;

    invoke-direct/range {v25 .. v25}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, v25

    invoke-virtual {v0, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v25

    move-object/from16 v0, v25

    move-object/from16 v1, v22

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v25

    invoke-virtual/range {v25 .. v25}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v13

    .line 210
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/rules/utils/WeeklyCalenderStringsCreator;->rulesCount:Ljava/lang/Integer;

    move-object/from16 v25, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/rules/utils/WeeklyCalenderStringsCreator;->rulesCount:Ljava/lang/Integer;

    move-object/from16 v25, v0

    invoke-virtual/range {v25 .. v25}, Ljava/lang/Integer;->intValue()I

    move-result v25

    add-int/lit8 v25, v25, 0x1

    invoke-static/range {v25 .. v25}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v25

    move-object/from16 v0, v25

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/belkin/rules/utils/WeeklyCalenderStringsCreator;->rulesCount:Ljava/lang/Integer;

    .line 214
    .end local v22    # "tmpStr":Ljava/lang/String;
    :cond_10
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/rules/utils/WeeklyCalenderStringsCreator;->rDB:Lcom/belkin/rules/db/RulesDb;

    move-object/from16 v25, v0

    invoke-virtual/range {p1 .. p1}, Lcom/belkin/rules/dbmigration/RuleDevicesTable;->getRuleId()I

    move-result v26

    invoke-static/range {v26 .. v26}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v26

    invoke-virtual/range {v25 .. v26}, Lcom/belkin/rules/db/RulesDb;->getRuleType(Ljava/lang/Integer;)Ljava/lang/String;

    move-result-object v25

    sget-object v26, Lcom/belkin/rules/utils/RulesConstants;->RULE_MOTION:Ljava/lang/String;

    invoke-virtual/range {v25 .. v26}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v25

    if-nez v25, :cond_11

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/rules/utils/WeeklyCalenderStringsCreator;->rDB:Lcom/belkin/rules/db/RulesDb;

    move-object/from16 v25, v0

    invoke-virtual/range {p1 .. p1}, Lcom/belkin/rules/dbmigration/RuleDevicesTable;->getRuleId()I

    move-result v26

    invoke-static/range {v26 .. v26}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v26

    invoke-virtual/range {v25 .. v26}, Lcom/belkin/rules/db/RulesDb;->getRuleType(Ljava/lang/Integer;)Ljava/lang/String;

    move-result-object v25

    sget-object v26, Lcom/belkin/rules/utils/RulesConstants;->RULE_MAKER_MOTION:Ljava/lang/String;

    invoke-virtual/range {v25 .. v26}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v25

    if-eqz v25, :cond_13

    .line 215
    :cond_11
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/rules/utils/WeeklyCalenderStringsCreator;->rDB:Lcom/belkin/rules/db/RulesDb;

    move-object/from16 v25, v0

    invoke-virtual/range {p1 .. p1}, Lcom/belkin/rules/dbmigration/RuleDevicesTable;->getRuleId()I

    move-result v26

    invoke-static/range {v26 .. v26}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v26

    invoke-virtual/range {v25 .. v26}, Lcom/belkin/rules/db/RulesDb;->getSensorDevicesStr(Ljava/lang/Integer;)Ljava/lang/String;

    move-result-object v14

    .line 216
    .local v14, "sensorDevStr":Ljava/lang/String;
    if-eqz v16, :cond_12

    .line 217
    new-instance v25, Ljava/lang/StringBuilder;

    invoke-direct/range {v25 .. v25}, Ljava/lang/StringBuilder;-><init>()V

    sget-char v26, Lcom/belkin/rules/utils/RulesConstants;->SCHD_SEP:C

    invoke-virtual/range {v25 .. v26}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v25

    invoke-virtual/range {v17 .. v17}, Ljava/lang/Integer;->toString()Ljava/lang/String;

    move-result-object v26

    invoke-virtual/range {v25 .. v26}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v25

    sget-char v26, Lcom/belkin/rules/utils/RulesConstants;->COMMA:C

    invoke-virtual/range {v25 .. v26}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v25

    sget-char v26, Lcom/belkin/rules/utils/RulesConstants;->RULE_ACTIVATE:C

    invoke-virtual/range {v25 .. v26}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v25

    const-string v26, ",["

    invoke-virtual/range {v25 .. v26}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v25

    move-object/from16 v0, v25

    invoke-virtual {v0, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v25

    const-string v26, "]"

    invoke-virtual/range {v25 .. v26}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v25

    invoke-virtual/range {v25 .. v25}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v22

    .line 219
    .restart local v22    # "tmpStr":Ljava/lang/String;
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/rules/utils/WeeklyCalenderStringsCreator;->scheduleStringActions:Ljava/util/ArrayList;

    move-object/from16 v25, v0

    new-instance v26, Lcom/belkin/rules/utils/ScheduleStringAction;

    invoke-virtual/range {v17 .. v17}, Ljava/lang/Integer;->intValue()I

    move-result v27

    move-object/from16 v0, v26

    move/from16 v1, v27

    move-object/from16 v2, v22

    invoke-direct {v0, v1, v2}, Lcom/belkin/rules/utils/ScheduleStringAction;-><init>(ILjava/lang/String;)V

    invoke-virtual/range {v25 .. v26}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 220
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/rules/utils/WeeklyCalenderStringsCreator;->lstSRSSOffset:Ljava/util/ArrayList;

    move-object/from16 v25, v0

    invoke-virtual/range {p1 .. p1}, Lcom/belkin/rules/dbmigration/RuleDevicesTable;->getOnModeOffset()I

    move-result v26

    invoke-static/range {v26 .. v26}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v26

    invoke-virtual/range {v25 .. v26}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 221
    new-instance v25, Ljava/lang/StringBuilder;

    invoke-direct/range {v25 .. v25}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, v25

    invoke-virtual {v0, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v25

    move-object/from16 v0, v25

    move-object/from16 v1, v22

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v25

    invoke-virtual/range {v25 .. v25}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v13

    .line 222
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/rules/utils/WeeklyCalenderStringsCreator;->rulesCount:Ljava/lang/Integer;

    move-object/from16 v25, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/rules/utils/WeeklyCalenderStringsCreator;->rulesCount:Ljava/lang/Integer;

    move-object/from16 v25, v0

    invoke-virtual/range {v25 .. v25}, Ljava/lang/Integer;->intValue()I

    move-result v25

    add-int/lit8 v25, v25, 0x1

    invoke-static/range {v25 .. v25}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v25

    move-object/from16 v0, v25

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/belkin/rules/utils/WeeklyCalenderStringsCreator;->rulesCount:Ljava/lang/Integer;

    .line 224
    .end local v22    # "tmpStr":Ljava/lang/String;
    :cond_12
    if-eqz v8, :cond_13

    .line 225
    new-instance v25, Ljava/lang/StringBuilder;

    invoke-direct/range {v25 .. v25}, Ljava/lang/StringBuilder;-><init>()V

    sget-char v26, Lcom/belkin/rules/utils/RulesConstants;->SCHD_SEP:C

    invoke-virtual/range {v25 .. v26}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v25

    invoke-virtual {v9}, Ljava/lang/Integer;->toString()Ljava/lang/String;

    move-result-object v26

    invoke-virtual/range {v25 .. v26}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v25

    sget-char v26, Lcom/belkin/rules/utils/RulesConstants;->COMMA:C

    invoke-virtual/range {v25 .. v26}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v25

    sget-char v26, Lcom/belkin/rules/utils/RulesConstants;->RULE_DEACTIVATE:C

    invoke-virtual/range {v25 .. v26}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v25

    invoke-virtual/range {v25 .. v25}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v22

    .line 226
    .restart local v22    # "tmpStr":Ljava/lang/String;
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/rules/utils/WeeklyCalenderStringsCreator;->scheduleStringActions:Ljava/util/ArrayList;

    move-object/from16 v25, v0

    new-instance v26, Lcom/belkin/rules/utils/ScheduleStringAction;

    invoke-virtual {v9}, Ljava/lang/Integer;->intValue()I

    move-result v27

    move-object/from16 v0, v26

    move/from16 v1, v27

    move-object/from16 v2, v22

    invoke-direct {v0, v1, v2}, Lcom/belkin/rules/utils/ScheduleStringAction;-><init>(ILjava/lang/String;)V

    invoke-virtual/range {v25 .. v26}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 227
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/rules/utils/WeeklyCalenderStringsCreator;->lstSRSSOffset:Ljava/util/ArrayList;

    move-object/from16 v25, v0

    invoke-virtual/range {p1 .. p1}, Lcom/belkin/rules/dbmigration/RuleDevicesTable;->getOffModeOffset()I

    move-result v26

    invoke-static/range {v26 .. v26}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v26

    invoke-virtual/range {v25 .. v26}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 228
    new-instance v25, Ljava/lang/StringBuilder;

    invoke-direct/range {v25 .. v25}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, v25

    invoke-virtual {v0, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v25

    move-object/from16 v0, v25

    move-object/from16 v1, v22

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v25

    invoke-virtual/range {v25 .. v25}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v13

    .line 229
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/rules/utils/WeeklyCalenderStringsCreator;->rulesCount:Ljava/lang/Integer;

    move-object/from16 v25, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/rules/utils/WeeklyCalenderStringsCreator;->rulesCount:Ljava/lang/Integer;

    move-object/from16 v25, v0

    invoke-virtual/range {v25 .. v25}, Ljava/lang/Integer;->intValue()I

    move-result v25

    add-int/lit8 v25, v25, 0x1

    invoke-static/range {v25 .. v25}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v25

    move-object/from16 v0, v25

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/belkin/rules/utils/WeeklyCalenderStringsCreator;->rulesCount:Ljava/lang/Integer;

    .line 233
    .end local v14    # "sensorDevStr":Ljava/lang/String;
    .end local v22    # "tmpStr":Ljava/lang/String;
    :cond_13
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/rules/utils/WeeklyCalenderStringsCreator;->rDB:Lcom/belkin/rules/db/RulesDb;

    move-object/from16 v25, v0

    invoke-virtual/range {p1 .. p1}, Lcom/belkin/rules/dbmigration/RuleDevicesTable;->getRuleId()I

    move-result v26

    invoke-static/range {v26 .. v26}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v26

    invoke-virtual/range {v25 .. v26}, Lcom/belkin/rules/db/RulesDb;->getRuleType(Ljava/lang/Integer;)Ljava/lang/String;

    move-result-object v25

    sget-object v26, Lcom/belkin/rules/utils/RulesConstants;->RULE_MOTION:Ljava/lang/String;

    invoke-virtual/range {v25 .. v26}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v25

    if-nez v25, :cond_15

    if-eqz v12, :cond_15

    invoke-virtual/range {p1 .. p1}, Lcom/belkin/rules/dbmigration/RuleDevicesTable;->getDayId()I

    move-result v25

    move/from16 v0, p2

    move/from16 v1, v25

    if-ne v0, v1, :cond_15

    .line 234
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/rules/utils/WeeklyCalenderStringsCreator;->rDB:Lcom/belkin/rules/db/RulesDb;

    move-object/from16 v25, v0

    invoke-virtual {v12}, Lcom/belkin/rules/dbmigration/RuleDevicesTable;->getRuleId()I

    move-result v26

    invoke-static/range {v26 .. v26}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v26

    invoke-virtual/range {v25 .. v26}, Lcom/belkin/rules/db/RulesDb;->getExtendedFeatureStr(Ljava/lang/Integer;)Ljava/lang/String;

    move-result-object v6

    .line 235
    .restart local v6    # "efString":Ljava/lang/String;
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lcom/belkin/rules/utils/WeeklyCalenderStringsCreator;->startTmpOK:Z

    move/from16 v25, v0

    if-eqz v25, :cond_14

    .line 236
    invoke-virtual/range {p1 .. p1}, Lcom/belkin/rules/dbmigration/RuleDevicesTable;->getStarttime()I

    move-result v25

    add-int/lit8 v25, v25, 0x14

    invoke-static/range {v25 .. v25}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v20

    .line 237
    .local v20, "tmpStartTimeA":Ljava/lang/Integer;
    new-instance v25, Ljava/lang/StringBuilder;

    invoke-direct/range {v25 .. v25}, Ljava/lang/StringBuilder;-><init>()V

    sget-char v26, Lcom/belkin/rules/utils/RulesConstants;->SCHD_SEP:C

    invoke-virtual/range {v25 .. v26}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v25

    invoke-virtual/range {v20 .. v20}, Ljava/lang/Integer;->toString()Ljava/lang/String;

    move-result-object v26

    invoke-virtual/range {v25 .. v26}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v25

    sget-char v26, Lcom/belkin/rules/utils/RulesConstants;->COMMA:C

    invoke-virtual/range {v25 .. v26}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v25

    const-string v26, "1"

    invoke-virtual/range {v25 .. v26}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v25

    const-string v26, ",[1"

    invoke-virtual/range {v25 .. v26}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v25

    sget-char v26, Lcom/belkin/rules/utils/RulesConstants;->SEMICOLUMN:C

    invoke-virtual/range {v25 .. v26}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v25

    const-string v26, "0"

    invoke-virtual/range {v25 .. v26}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v25

    sget-char v26, Lcom/belkin/rules/utils/RulesConstants;->SEMICOLUMN:C

    invoke-virtual/range {v25 .. v26}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v25

    const-string v26, "0"

    invoke-virtual/range {v25 .. v26}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v25

    sget-char v26, Lcom/belkin/rules/utils/RulesConstants;->SEMICOLUMN:C

    invoke-virtual/range {v25 .. v26}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v25

    invoke-virtual {v12}, Lcom/belkin/rules/dbmigration/RuleDevicesTable;->getDeviceId()Ljava/lang/String;

    move-result-object v26

    invoke-virtual/range {v25 .. v26}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v25

    const-string v26, ",9,"

    invoke-virtual/range {v25 .. v26}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v25

    invoke-virtual {v12}, Lcom/belkin/rules/dbmigration/RuleDevicesTable;->getSensorDuration()I

    move-result v26

    invoke-virtual/range {v25 .. v26}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v25

    const-string v26, ",0@"

    invoke-virtual/range {v25 .. v26}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v25

    move-object/from16 v0, v25

    invoke-virtual {v0, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v25

    const-string v26, "@]"

    invoke-virtual/range {v25 .. v26}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v25

    invoke-virtual/range {v25 .. v25}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v23

    .line 239
    .restart local v23    # "tmpStrA":Ljava/lang/String;
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/rules/utils/WeeklyCalenderStringsCreator;->scheduleStringActions:Ljava/util/ArrayList;

    move-object/from16 v25, v0

    new-instance v26, Lcom/belkin/rules/utils/ScheduleStringAction;

    invoke-virtual/range {v20 .. v20}, Ljava/lang/Integer;->intValue()I

    move-result v27

    move-object/from16 v0, v26

    move/from16 v1, v27

    move-object/from16 v2, v23

    invoke-direct {v0, v1, v2}, Lcom/belkin/rules/utils/ScheduleStringAction;-><init>(ILjava/lang/String;)V

    invoke-virtual/range {v25 .. v26}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 240
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/rules/utils/WeeklyCalenderStringsCreator;->lstSRSSOffset:Ljava/util/ArrayList;

    move-object/from16 v25, v0

    invoke-virtual {v12}, Lcom/belkin/rules/dbmigration/RuleDevicesTable;->getOnModeOffset()I

    move-result v26

    invoke-static/range {v26 .. v26}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v26

    invoke-virtual/range {v25 .. v26}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 241
    new-instance v25, Ljava/lang/StringBuilder;

    invoke-direct/range {v25 .. v25}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, v25

    invoke-virtual {v0, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v25

    move-object/from16 v0, v25

    move-object/from16 v1, v23

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v25

    invoke-virtual/range {v25 .. v25}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v13

    .line 242
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/rules/utils/WeeklyCalenderStringsCreator;->rulesCount:Ljava/lang/Integer;

    move-object/from16 v25, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/rules/utils/WeeklyCalenderStringsCreator;->rulesCount:Ljava/lang/Integer;

    move-object/from16 v25, v0

    invoke-virtual/range {v25 .. v25}, Ljava/lang/Integer;->intValue()I

    move-result v25

    add-int/lit8 v25, v25, 0x1

    invoke-static/range {v25 .. v25}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v25

    move-object/from16 v0, v25

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/belkin/rules/utils/WeeklyCalenderStringsCreator;->rulesCount:Ljava/lang/Integer;

    .line 244
    .end local v20    # "tmpStartTimeA":Ljava/lang/Integer;
    .end local v23    # "tmpStrA":Ljava/lang/String;
    :cond_14
    invoke-virtual/range {p1 .. p1}, Lcom/belkin/rules/dbmigration/RuleDevicesTable;->getRuleDuration()I

    move-result v25

    if-lez v25, :cond_15

    move-object/from16 v0, p0

    iget-boolean v0, v0, Lcom/belkin/rules/utils/WeeklyCalenderStringsCreator;->endTmpOK:Z

    move/from16 v25, v0

    if-eqz v25, :cond_15

    .line 246
    invoke-virtual/range {p1 .. p1}, Lcom/belkin/rules/dbmigration/RuleDevicesTable;->getStarttime()I

    move-result v25

    invoke-virtual/range {p1 .. p1}, Lcom/belkin/rules/dbmigration/RuleDevicesTable;->getRuleDuration()I

    move-result v26

    add-int v25, v25, v26

    add-int/lit8 v25, v25, 0x14

    invoke-static/range {v25 .. v25}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v21

    .line 247
    .local v21, "tmpStartTimeB":Ljava/lang/Integer;
    new-instance v25, Ljava/lang/StringBuilder;

    invoke-direct/range {v25 .. v25}, Ljava/lang/StringBuilder;-><init>()V

    sget-char v26, Lcom/belkin/rules/utils/RulesConstants;->SCHD_SEP:C

    invoke-virtual/range {v25 .. v26}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v25

    invoke-virtual/range {v21 .. v21}, Ljava/lang/Integer;->toString()Ljava/lang/String;

    move-result-object v26

    invoke-virtual/range {v25 .. v26}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v25

    sget-char v26, Lcom/belkin/rules/utils/RulesConstants;->COMMA:C

    invoke-virtual/range {v25 .. v26}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v25

    const-string v26, "1"

    invoke-virtual/range {v25 .. v26}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v25

    const-string v26, ",[1"

    invoke-virtual/range {v25 .. v26}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v25

    sget-char v26, Lcom/belkin/rules/utils/RulesConstants;->SEMICOLUMN:C

    invoke-virtual/range {v25 .. v26}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v25

    const-string v26, "0"

    invoke-virtual/range {v25 .. v26}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v25

    sget-char v26, Lcom/belkin/rules/utils/RulesConstants;->SEMICOLUMN:C

    invoke-virtual/range {v25 .. v26}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v25

    const-string v26, "0"

    invoke-virtual/range {v25 .. v26}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v25

    sget-char v26, Lcom/belkin/rules/utils/RulesConstants;->SEMICOLUMN:C

    invoke-virtual/range {v25 .. v26}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v25

    invoke-virtual {v12}, Lcom/belkin/rules/dbmigration/RuleDevicesTable;->getDeviceId()Ljava/lang/String;

    move-result-object v26

    invoke-virtual/range {v25 .. v26}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v25

    const-string v26, ",9,"

    invoke-virtual/range {v25 .. v26}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v25

    invoke-virtual {v12}, Lcom/belkin/rules/dbmigration/RuleDevicesTable;->getSensorDuration()I

    move-result v26

    invoke-virtual/range {v25 .. v26}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v25

    const-string v26, ",0@"

    invoke-virtual/range {v25 .. v26}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v25

    move-object/from16 v0, v25

    invoke-virtual {v0, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v25

    const-string v26, "@]"

    invoke-virtual/range {v25 .. v26}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v25

    invoke-virtual/range {v25 .. v25}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v24

    .line 249
    .restart local v24    # "tmpStrB":Ljava/lang/String;
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/rules/utils/WeeklyCalenderStringsCreator;->scheduleStringActions:Ljava/util/ArrayList;

    move-object/from16 v25, v0

    new-instance v26, Lcom/belkin/rules/utils/ScheduleStringAction;

    invoke-virtual/range {v21 .. v21}, Ljava/lang/Integer;->intValue()I

    move-result v27

    move-object/from16 v0, v26

    move/from16 v1, v27

    move-object/from16 v2, v24

    invoke-direct {v0, v1, v2}, Lcom/belkin/rules/utils/ScheduleStringAction;-><init>(ILjava/lang/String;)V

    invoke-virtual/range {v25 .. v26}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 250
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/rules/utils/WeeklyCalenderStringsCreator;->lstSRSSOffset:Ljava/util/ArrayList;

    move-object/from16 v25, v0

    invoke-virtual {v12}, Lcom/belkin/rules/dbmigration/RuleDevicesTable;->getOnModeOffset()I

    move-result v26

    invoke-static/range {v26 .. v26}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v26

    invoke-virtual/range {v25 .. v26}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 251
    new-instance v25, Ljava/lang/StringBuilder;

    invoke-direct/range {v25 .. v25}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, v25

    invoke-virtual {v0, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v25

    move-object/from16 v0, v25

    move-object/from16 v1, v24

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v25

    invoke-virtual/range {v25 .. v25}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v13

    .line 252
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/rules/utils/WeeklyCalenderStringsCreator;->rulesCount:Ljava/lang/Integer;

    move-object/from16 v25, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/rules/utils/WeeklyCalenderStringsCreator;->rulesCount:Ljava/lang/Integer;

    move-object/from16 v25, v0

    invoke-virtual/range {v25 .. v25}, Ljava/lang/Integer;->intValue()I

    move-result v25

    add-int/lit8 v25, v25, 0x1

    invoke-static/range {v25 .. v25}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v25

    move-object/from16 v0, v25

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/belkin/rules/utils/WeeklyCalenderStringsCreator;->rulesCount:Ljava/lang/Integer;

    .line 258
    .end local v4    # "duration":Ljava/lang/Integer;
    .end local v6    # "efString":Ljava/lang/String;
    .end local v7    # "endAct":Ljava/lang/String;
    .end local v9    # "endTime":Ljava/lang/Integer;
    .end local v12    # "parentNotifyRule":Lcom/belkin/rules/dbmigration/RuleDevicesTable;
    .end local v15    # "startAct":Ljava/lang/String;
    .end local v17    # "startTime":Ljava/lang/Integer;
    .end local v21    # "tmpStartTimeB":Ljava/lang/Integer;
    .end local v24    # "tmpStrB":Ljava/lang/String;
    :cond_15
    :goto_2
    return-object v13

    .line 97
    .restart local v4    # "duration":Ljava/lang/Integer;
    .restart local v7    # "endAct":Ljava/lang/String;
    .restart local v9    # "endTime":Ljava/lang/Integer;
    .restart local v12    # "parentNotifyRule":Lcom/belkin/rules/dbmigration/RuleDevicesTable;
    .restart local v15    # "startAct":Ljava/lang/String;
    .restart local v17    # "startTime":Ljava/lang/Integer;
    :cond_16
    sget v25, Lcom/belkin/rules/utils/RulesConstants;->MAX_HOUR:I

    invoke-static/range {v25 .. v25}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v9

    .line 98
    const/4 v8, 0x1

    goto/16 :goto_0

    .line 148
    :cond_17
    invoke-virtual {v9}, Ljava/lang/Integer;->intValue()I
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result v25

    goto/16 :goto_1

    .line 255
    .end local v4    # "duration":Ljava/lang/Integer;
    .end local v7    # "endAct":Ljava/lang/String;
    .end local v9    # "endTime":Ljava/lang/Integer;
    .end local v12    # "parentNotifyRule":Lcom/belkin/rules/dbmigration/RuleDevicesTable;
    .end local v15    # "startAct":Ljava/lang/String;
    .end local v17    # "startTime":Ljava/lang/Integer;
    :catch_0
    move-exception v5

    .line 256
    .local v5, "e":Ljava/lang/Exception;
    invoke-virtual {v5}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_2
.end method

.method private mergeSensorString(Lcom/belkin/rules/dbmigration/RuleDevicesTable;Ljava/lang/String;I)Ljava/lang/String;
    .locals 12
    .param p1, "rule"    # Lcom/belkin/rules/dbmigration/RuleDevicesTable;
    .param p2, "sensorDevStr"    # Ljava/lang/String;
    .param p3, "dayID"    # I

    .prologue
    .line 294
    const-string v6, ""

    .line 296
    .local v6, "result":Ljava/lang/String;
    :try_start_0
    iget-object v9, p0, Lcom/belkin/rules/utils/WeeklyCalenderStringsCreator;->rDB:Lcom/belkin/rules/db/RulesDb;

    invoke-virtual {p1}, Lcom/belkin/rules/dbmigration/RuleDevicesTable;->getRuleId()I

    move-result v10

    invoke-static {v10}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v10

    invoke-virtual {v9, v10}, Lcom/belkin/rules/db/RulesDb;->getRuleType(Ljava/lang/Integer;)Ljava/lang/String;

    move-result-object v9

    sget-object v10, Lcom/belkin/rules/utils/RulesConstants;->RULE_MOTION:Ljava/lang/String;

    invoke-virtual {v9, v10}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_4

    .line 297
    invoke-virtual {p1}, Lcom/belkin/rules/dbmigration/RuleDevicesTable;->getStarttime()I

    move-result v9

    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v8

    .line 298
    .local v8, "startTime":Ljava/lang/Integer;
    invoke-virtual {p1}, Lcom/belkin/rules/dbmigration/RuleDevicesTable;->getRuleDuration()I

    move-result v9

    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    .line 299
    .local v0, "duration":Ljava/lang/Integer;
    invoke-virtual {p1}, Lcom/belkin/rules/dbmigration/RuleDevicesTable;->getOnModeOffset()I

    move-result v9

    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    .line 300
    .local v5, "onModeOffset":Ljava/lang/Integer;
    invoke-virtual {p1}, Lcom/belkin/rules/dbmigration/RuleDevicesTable;->getOffModeOffset()I

    move-result v9

    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    .line 301
    .local v4, "offModeOffset":Ljava/lang/Integer;
    invoke-virtual {v8}, Ljava/lang/Integer;->intValue()I

    move-result v9

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v10

    add-int/2addr v9, v10

    invoke-virtual {v4}, Ljava/lang/Integer;->intValue()I

    move-result v10

    add-int/2addr v9, v10

    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    .line 302
    .local v3, "endTime":Ljava/lang/Integer;
    const/4 v2, 0x0

    .line 303
    .local v2, "endOK":Z
    const/4 v7, 0x0

    .line 305
    .local v7, "startOK":Z
    invoke-virtual {v8}, Ljava/lang/Integer;->intValue()I

    move-result v9

    invoke-virtual {v5}, Ljava/lang/Integer;->intValue()I

    move-result v10

    add-int/2addr v9, v10

    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v8

    .line 306
    sget-object v9, Lcom/belkin/rules/utils/WeeklyCalenderStringsCreator;->TAG:Ljava/lang/String;

    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    const-string v11, "dayID is :: "

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v10

    const-string v11, "rule.getDayId() :: "

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {p1}, Lcom/belkin/rules/dbmigration/RuleDevicesTable;->getDayId()I

    move-result v11

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-static {v9, v10}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 307
    invoke-virtual {p1}, Lcom/belkin/rules/dbmigration/RuleDevicesTable;->getDayId()I

    move-result v9

    if-ne p3, v9, :cond_0

    .line 308
    sget-object v9, Lcom/belkin/rules/utils/WeeklyCalenderStringsCreator;->TAG:Ljava/lang/String;

    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    const-string v11, "dayID == rule.getDayId() endTime :: "

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v10

    const-string v11, "startTime ::  "

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-static {v9, v10}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 309
    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    move-result v9

    sget v10, Lcom/belkin/rules/utils/RulesConstants;->MAX_HOUR:I

    if-gt v9, v10, :cond_5

    .line 310
    const/4 v2, 0x1

    .line 315
    :goto_0
    const/4 v7, 0x1

    .line 318
    :cond_0
    invoke-virtual {p1}, Lcom/belkin/rules/dbmigration/RuleDevicesTable;->getDayId()I

    move-result v9

    if-eq p3, v9, :cond_1

    .line 319
    sget-object v9, Lcom/belkin/rules/utils/WeeklyCalenderStringsCreator;->TAG:Ljava/lang/String;

    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    const-string v11, "dayID != rule.getDayId()endTime :: "

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v10

    const-string v11, "startTime ::  "

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-static {v9, v10}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 320
    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    move-result v9

    sget v10, Lcom/belkin/rules/utils/RulesConstants;->MAX_HOUR:I

    if-le v9, v10, :cond_1

    .line 321
    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    move-result v9

    sget v10, Lcom/belkin/rules/utils/RulesConstants;->MAX_HOUR:I

    sub-int/2addr v9, v10

    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    .line 322
    const/4 v2, 0x1

    .line 323
    sget v9, Lcom/belkin/rules/utils/RulesConstants;->MIN_TIME:I

    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v8

    .line 324
    const/4 v7, 0x1

    .line 328
    :cond_1
    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    move-result v9

    sget v10, Lcom/belkin/rules/utils/RulesConstants;->MAX_HOUR:I

    if-le v9, v10, :cond_2

    sget v9, Lcom/belkin/rules/utils/RulesConstants;->MAX_HOUR:I

    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    .line 330
    :cond_2
    sget-object v9, Lcom/belkin/rules/utils/WeeklyCalenderStringsCreator;->TAG:Ljava/lang/String;

    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    const-string v11, "the sensorDevStr is :: "

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    const-string v11, "startOK :: "

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10, v7}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v10

    const-string v11, "endOK :: "

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10, v2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-static {v9, v10}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 331
    if-eqz v7, :cond_3

    .line 332
    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v9, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    sget-char v10, Lcom/belkin/rules/utils/RulesConstants;->SCHD_SEP:C

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v8}, Ljava/lang/Integer;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    sget-char v10, Lcom/belkin/rules/utils/RulesConstants;->COMMA:C

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v9

    sget-char v10, Lcom/belkin/rules/utils/RulesConstants;->RULE_ACTIVATE:C

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    .line 333
    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v9, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    const-string v10, ",["

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    const-string v10, "]"

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    .line 334
    iget-object v9, p0, Lcom/belkin/rules/utils/WeeklyCalenderStringsCreator;->lstSRSSOffset:Ljava/util/ArrayList;

    invoke-virtual {p1}, Lcom/belkin/rules/dbmigration/RuleDevicesTable;->getOnModeOffset()I

    move-result v10

    invoke-static {v10}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v10

    invoke-virtual {v9, v10}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 335
    iget-object v9, p0, Lcom/belkin/rules/utils/WeeklyCalenderStringsCreator;->rulesCount:Ljava/lang/Integer;

    iget-object v9, p0, Lcom/belkin/rules/utils/WeeklyCalenderStringsCreator;->rulesCount:Ljava/lang/Integer;

    invoke-virtual {v9}, Ljava/lang/Integer;->intValue()I

    move-result v9

    add-int/lit8 v9, v9, 0x1

    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v9

    iput-object v9, p0, Lcom/belkin/rules/utils/WeeklyCalenderStringsCreator;->rulesCount:Ljava/lang/Integer;

    .line 338
    :cond_3
    if-eqz v2, :cond_4

    .line 339
    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v9, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    sget-char v10, Lcom/belkin/rules/utils/RulesConstants;->SCHD_SEP:C

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v3}, Ljava/lang/Integer;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    sget-char v10, Lcom/belkin/rules/utils/RulesConstants;->COMMA:C

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v9

    sget-char v10, Lcom/belkin/rules/utils/RulesConstants;->RULE_DEACTIVATE:C

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    .line 340
    iget-object v9, p0, Lcom/belkin/rules/utils/WeeklyCalenderStringsCreator;->lstSRSSOffset:Ljava/util/ArrayList;

    invoke-virtual {p1}, Lcom/belkin/rules/dbmigration/RuleDevicesTable;->getOffModeOffset()I

    move-result v10

    invoke-static {v10}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v10

    invoke-virtual {v9, v10}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 341
    iget-object v9, p0, Lcom/belkin/rules/utils/WeeklyCalenderStringsCreator;->rulesCount:Ljava/lang/Integer;

    iget-object v9, p0, Lcom/belkin/rules/utils/WeeklyCalenderStringsCreator;->rulesCount:Ljava/lang/Integer;

    invoke-virtual {v9}, Ljava/lang/Integer;->intValue()I

    move-result v9

    add-int/lit8 v9, v9, 0x1

    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v9

    iput-object v9, p0, Lcom/belkin/rules/utils/WeeklyCalenderStringsCreator;->rulesCount:Ljava/lang/Integer;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 347
    .end local v0    # "duration":Ljava/lang/Integer;
    .end local v2    # "endOK":Z
    .end local v3    # "endTime":Ljava/lang/Integer;
    .end local v4    # "offModeOffset":Ljava/lang/Integer;
    .end local v5    # "onModeOffset":Ljava/lang/Integer;
    .end local v7    # "startOK":Z
    .end local v8    # "startTime":Ljava/lang/Integer;
    :cond_4
    :goto_1
    sget-object v9, Lcom/belkin/rules/utils/WeeklyCalenderStringsCreator;->TAG:Ljava/lang/String;

    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    const-string v11, "the result of mergeSensorString  is :: "

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-static {v9, v10}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 348
    return-object v6

    .line 312
    .restart local v0    # "duration":Ljava/lang/Integer;
    .restart local v2    # "endOK":Z
    .restart local v3    # "endTime":Ljava/lang/Integer;
    .restart local v4    # "offModeOffset":Ljava/lang/Integer;
    .restart local v5    # "onModeOffset":Ljava/lang/Integer;
    .restart local v7    # "startOK":Z
    .restart local v8    # "startTime":Ljava/lang/Integer;
    :cond_5
    :try_start_1
    sget v9, Lcom/belkin/rules/utils/RulesConstants;->MAX_HOUR:I

    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    move-result-object v3

    .line 313
    const/4 v2, 0x1

    goto/16 :goto_0

    .line 344
    .end local v0    # "duration":Ljava/lang/Integer;
    .end local v2    # "endOK":Z
    .end local v3    # "endTime":Ljava/lang/Integer;
    .end local v4    # "offModeOffset":Ljava/lang/Integer;
    .end local v5    # "onModeOffset":Ljava/lang/Integer;
    .end local v7    # "startOK":Z
    .end local v8    # "startTime":Ljava/lang/Integer;
    :catch_0
    move-exception v1

    .line 345
    .local v1, "e":Ljava/lang/Exception;
    invoke-virtual {v1}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_1
.end method


# virtual methods
.method public declared-synchronized getScheduleString(Ljava/lang/Integer;Ljava/lang/String;)Ljava/lang/String;
    .locals 16
    .param p1, "schdDayNum"    # Ljava/lang/Integer;
    .param p2, "schdDevice"    # Ljava/lang/String;

    .prologue
    .line 364
    monitor-enter p0

    const/4 v2, 0x0

    .line 365
    .local v2, "SRSS":Z
    :try_start_0
    const-string v9, "0"
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 368
    .local v9, "result":Ljava/lang/String;
    :try_start_1
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/belkin/rules/utils/WeeklyCalenderStringsCreator;->rDB:Lcom/belkin/rules/db/RulesDb;

    move-object/from16 v0, p2

    move-object/from16 v1, p1

    invoke-virtual {v13, v0, v1}, Lcom/belkin/rules/db/RulesDb;->getDeviceTableItems(Ljava/lang/String;Ljava/lang/Integer;)Ljava/util/ArrayList;

    move-result-object v8

    .line 370
    .local v8, "resRules":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/belkin/rules/dbmigration/RuleDevicesTable;>;"
    invoke-virtual {v8}, Ljava/util/ArrayList;->size()I

    move-result v13

    if-lez v13, :cond_1

    .line 371
    invoke-virtual {v8}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v5

    .local v5, "i$":Ljava/util/Iterator;
    :cond_0
    :goto_0
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v13

    if-eqz v13, :cond_1

    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Lcom/belkin/rules/dbmigration/RuleDevicesTable;

    .line 372
    .local v10, "rule":Lcom/belkin/rules/dbmigration/RuleDevicesTable;
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/belkin/rules/utils/WeeklyCalenderStringsCreator;->rDB:Lcom/belkin/rules/db/RulesDb;

    invoke-virtual {v10}, Lcom/belkin/rules/dbmigration/RuleDevicesTable;->getRuleId()I

    move-result v14

    invoke-static {v14}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v14

    invoke-virtual {v13, v14}, Lcom/belkin/rules/db/RulesDb;->isDisabled(Ljava/lang/Integer;)Z

    move-result v13

    if-nez v13, :cond_0

    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/belkin/rules/utils/WeeklyCalenderStringsCreator;->rDB:Lcom/belkin/rules/db/RulesDb;

    invoke-virtual {v10}, Lcom/belkin/rules/dbmigration/RuleDevicesTable;->getRuleId()I

    move-result v14

    invoke-static {v14}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v14

    invoke-virtual {v13, v14}, Lcom/belkin/rules/db/RulesDb;->getRuleType(Ljava/lang/Integer;)Ljava/lang/String;

    move-result-object v13

    sget-object v14, Lcom/belkin/rules/utils/RulesConstants;->RULE_MOTION:Ljava/lang/String;

    invoke-virtual {v13, v14}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v13

    if-nez v13, :cond_0

    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/belkin/rules/utils/WeeklyCalenderStringsCreator;->rDB:Lcom/belkin/rules/db/RulesDb;

    invoke-virtual {v10}, Lcom/belkin/rules/dbmigration/RuleDevicesTable;->getRuleId()I

    move-result v14

    invoke-static {v14}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v14

    invoke-virtual {v13, v14}, Lcom/belkin/rules/db/RulesDb;->getRuleType(Ljava/lang/Integer;)Ljava/lang/String;

    move-result-object v13

    sget-object v14, Lcom/belkin/rules/utils/RulesConstants;->RULE_MAKER_MOTION:Ljava/lang/String;

    invoke-virtual {v13, v14}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v13

    if-nez v13, :cond_0

    .line 373
    invoke-virtual/range {p1 .. p1}, Ljava/lang/Integer;->intValue()I

    move-result v13

    move-object/from16 v0, p0

    invoke-direct {v0, v10, v13}, Lcom/belkin/rules/utils/WeeklyCalenderStringsCreator;->getStringByRuleType(Lcom/belkin/rules/dbmigration/RuleDevicesTable;I)Ljava/lang/String;

    .line 374
    invoke-virtual {v10}, Lcom/belkin/rules/dbmigration/RuleDevicesTable;->haveSRSS()Z

    move-result v2

    goto :goto_0

    .line 379
    .end local v5    # "i$":Ljava/util/Iterator;
    .end local v10    # "rule":Lcom/belkin/rules/dbmigration/RuleDevicesTable;
    :cond_1
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/belkin/rules/utils/WeeklyCalenderStringsCreator;->rDB:Lcom/belkin/rules/db/RulesDb;

    invoke-direct/range {p0 .. p1}, Lcom/belkin/rules/utils/WeeklyCalenderStringsCreator;->getPreviousDay(Ljava/lang/Integer;)Ljava/lang/Integer;

    move-result-object v14

    move-object/from16 v0, p2

    invoke-virtual {v13, v0, v14}, Lcom/belkin/rules/db/RulesDb;->getDeviceTableItems(Ljava/lang/String;Ljava/lang/Integer;)Ljava/util/ArrayList;

    move-result-object v7

    .line 380
    .local v7, "resPrevRules":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/belkin/rules/dbmigration/RuleDevicesTable;>;"
    invoke-virtual {v7}, Ljava/util/ArrayList;->size()I

    move-result v13

    if-lez v13, :cond_3

    .line 381
    invoke-virtual {v7}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v5

    .restart local v5    # "i$":Ljava/util/Iterator;
    :cond_2
    :goto_1
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v13

    if-eqz v13, :cond_3

    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v12

    check-cast v12, Lcom/belkin/rules/dbmigration/RuleDevicesTable;

    .line 382
    .local v12, "rulePrev":Lcom/belkin/rules/dbmigration/RuleDevicesTable;
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/belkin/rules/utils/WeeklyCalenderStringsCreator;->rDB:Lcom/belkin/rules/db/RulesDb;

    invoke-virtual {v12}, Lcom/belkin/rules/dbmigration/RuleDevicesTable;->getRuleId()I

    move-result v14

    invoke-static {v14}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v14

    invoke-virtual {v13, v14}, Lcom/belkin/rules/db/RulesDb;->isDisabled(Ljava/lang/Integer;)Z

    move-result v13

    if-nez v13, :cond_2

    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/belkin/rules/utils/WeeklyCalenderStringsCreator;->rDB:Lcom/belkin/rules/db/RulesDb;

    invoke-virtual {v12}, Lcom/belkin/rules/dbmigration/RuleDevicesTable;->getRuleId()I

    move-result v14

    invoke-static {v14}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v14

    invoke-virtual {v13, v14}, Lcom/belkin/rules/db/RulesDb;->getRuleType(Ljava/lang/Integer;)Ljava/lang/String;

    move-result-object v13

    sget-object v14, Lcom/belkin/rules/utils/RulesConstants;->RULE_MOTION:Ljava/lang/String;

    invoke-virtual {v13, v14}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v13

    if-nez v13, :cond_2

    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/belkin/rules/utils/WeeklyCalenderStringsCreator;->rDB:Lcom/belkin/rules/db/RulesDb;

    invoke-virtual {v12}, Lcom/belkin/rules/dbmigration/RuleDevicesTable;->getRuleId()I

    move-result v14

    invoke-static {v14}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v14

    invoke-virtual {v13, v14}, Lcom/belkin/rules/db/RulesDb;->getRuleType(Ljava/lang/Integer;)Ljava/lang/String;

    move-result-object v13

    sget-object v14, Lcom/belkin/rules/utils/RulesConstants;->RULE_MAKER_MOTION:Ljava/lang/String;

    invoke-virtual {v13, v14}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v13

    if-nez v13, :cond_2

    .line 383
    invoke-virtual/range {p1 .. p1}, Ljava/lang/Integer;->intValue()I

    move-result v13

    move-object/from16 v0, p0

    invoke-direct {v0, v12, v13}, Lcom/belkin/rules/utils/WeeklyCalenderStringsCreator;->getStringByRuleType(Lcom/belkin/rules/dbmigration/RuleDevicesTable;I)Ljava/lang/String;

    .line 384
    invoke-virtual {v12}, Lcom/belkin/rules/dbmigration/RuleDevicesTable;->haveSRSS()Z

    move-result v2

    goto :goto_1

    .line 389
    .end local v5    # "i$":Ljava/util/Iterator;
    .end local v12    # "rulePrev":Lcom/belkin/rules/dbmigration/RuleDevicesTable;
    :cond_3
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/belkin/rules/utils/WeeklyCalenderStringsCreator;->scheduleStringActions:Ljava/util/ArrayList;

    invoke-virtual {v13}, Ljava/util/ArrayList;->size()I

    move-result v13

    if-lez v13, :cond_8

    .line 390
    const-string v9, ""

    .line 392
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/belkin/rules/utils/WeeklyCalenderStringsCreator;->scheduleStringActions:Ljava/util/ArrayList;

    new-instance v14, Lcom/belkin/rules/utils/ScheduleStringActionComparator;

    invoke-direct {v14}, Lcom/belkin/rules/utils/ScheduleStringActionComparator;-><init>()V

    invoke-static {v13, v14}, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V

    .line 394
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/belkin/rules/utils/WeeklyCalenderStringsCreator;->scheduleStringActions:Ljava/util/ArrayList;

    invoke-virtual {v13}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v5

    .restart local v5    # "i$":Ljava/util/Iterator;
    :goto_2
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v13

    if-eqz v13, :cond_4

    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v11

    check-cast v11, Lcom/belkin/rules/utils/ScheduleStringAction;

    .line 395
    .local v11, "ruleAction":Lcom/belkin/rules/utils/ScheduleStringAction;
    new-instance v13, Ljava/lang/StringBuilder;

    invoke-direct {v13}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v13, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v11}, Lcom/belkin/rules/utils/ScheduleStringAction;->getSchedule()Ljava/lang/String;

    move-result-object v14

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    .line 396
    goto :goto_2

    .line 398
    .end local v11    # "ruleAction":Lcom/belkin/rules/utils/ScheduleStringAction;
    :cond_4
    if-eqz v2, :cond_5

    .line 399
    new-instance v13, Ljava/lang/StringBuilder;

    invoke-direct {v13}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v13, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-direct/range {p0 .. p0}, Lcom/belkin/rules/utils/WeeklyCalenderStringsCreator;->getSRSSTail()Ljava/lang/String;

    move-result-object v14

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    .line 402
    :cond_5
    new-instance v13, Ljava/lang/StringBuilder;

    invoke-direct {v13}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v13, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    sget-char v14, Lcom/belkin/rules/utils/RulesConstants;->OFFSET_SEP:C

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    .line 403
    const/4 v4, 0x0

    .line 404
    .local v4, "i":I
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/belkin/rules/utils/WeeklyCalenderStringsCreator;->lstSRSSOffset:Ljava/util/ArrayList;

    invoke-virtual {v13}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v5

    :goto_3
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v13

    if-eqz v13, :cond_7

    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/lang/Integer;

    .line 405
    .local v6, "offset":Ljava/lang/Integer;
    if-lez v4, :cond_6

    new-instance v13, Ljava/lang/StringBuilder;

    invoke-direct {v13}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v13, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    sget-char v14, Lcom/belkin/rules/utils/RulesConstants;->COMMA:C

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    .line 406
    :cond_6
    new-instance v13, Ljava/lang/StringBuilder;

    invoke-direct {v13}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v13, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    .line 407
    add-int/lit8 v4, v4, 0x1

    .line 408
    goto :goto_3

    .line 410
    .end local v6    # "offset":Ljava/lang/Integer;
    :cond_7
    new-instance v13, Ljava/lang/StringBuilder;

    invoke-direct {v13}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/belkin/rules/utils/WeeklyCalenderStringsCreator;->scheduleStringActions:Ljava/util/ArrayList;

    invoke-virtual {v14}, Ljava/util/ArrayList;->size()I

    move-result v14

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    .line 412
    sget-object v13, Lcom/belkin/rules/utils/WeeklyCalenderStringsCreator;->TAG:Ljava/lang/String;

    new-instance v14, Ljava/lang/StringBuilder;

    invoke-direct {v14}, Ljava/lang/StringBuilder;-><init>()V

    const-string v15, "Generate Normal Schedule String. DAY: "

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    move-object/from16 v0, p1

    invoke-virtual {v14, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v14

    const-string v15, "; SCH STR: "

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v14

    invoke-static {v13, v14}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 418
    .end local v4    # "i":I
    .end local v5    # "i$":Ljava/util/Iterator;
    .end local v7    # "resPrevRules":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/belkin/rules/dbmigration/RuleDevicesTable;>;"
    .end local v8    # "resRules":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/belkin/rules/dbmigration/RuleDevicesTable;>;"
    :cond_8
    :goto_4
    monitor-exit p0

    return-object v9

    .line 414
    :catch_0
    move-exception v3

    .line 415
    .local v3, "e":Ljava/lang/Exception;
    :try_start_2
    sget-object v13, Lcom/belkin/rules/utils/WeeklyCalenderStringsCreator;->TAG:Ljava/lang/String;

    new-instance v14, Ljava/lang/StringBuilder;

    invoke-direct {v14}, Ljava/lang/StringBuilder;-><init>()V

    const-string v15, "Exception while creating schedule string for device: "

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    move-object/from16 v0, p2

    invoke-virtual {v14, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    const-string v15, ", on day: "

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    move-object/from16 v0, p1

    invoke-virtual {v14, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v14

    invoke-static {v13, v14, v3}, Lcom/belkin/utils/LogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    goto :goto_4

    .line 364
    .end local v3    # "e":Ljava/lang/Exception;
    .end local v9    # "result":Ljava/lang/String;
    :catchall_0
    move-exception v13

    monitor-exit p0

    throw v13
.end method

.method public getSensorScheduleString(Ljava/lang/Integer;Ljava/lang/String;)Ljava/lang/String;
    .locals 16
    .param p1, "schdDayNum"    # Ljava/lang/Integer;
    .param p2, "schdDevice"    # Ljava/lang/String;

    .prologue
    .line 422
    const-string v8, "0"

    .line 423
    .local v8, "result":Ljava/lang/String;
    const/4 v2, 0x0

    .line 426
    .local v2, "SRSS":Z
    :try_start_0
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/belkin/rules/utils/WeeklyCalenderStringsCreator;->rDB:Lcom/belkin/rules/db/RulesDb;

    move-object/from16 v0, p2

    move-object/from16 v1, p1

    invoke-virtual {v13, v0, v1}, Lcom/belkin/rules/db/RulesDb;->getDeviceTableItemsBySensor(Ljava/lang/String;Ljava/lang/Integer;)Ljava/util/ArrayList;

    move-result-object v7

    .line 427
    .local v7, "resRules":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/belkin/rules/dbmigration/RuleDevicesTable;>;"
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/belkin/rules/utils/WeeklyCalenderStringsCreator;->rDB:Lcom/belkin/rules/db/RulesDb;

    invoke-direct/range {p0 .. p1}, Lcom/belkin/rules/utils/WeeklyCalenderStringsCreator;->getPreviousDay(Ljava/lang/Integer;)Ljava/lang/Integer;

    move-result-object v14

    move-object/from16 v0, p2

    invoke-virtual {v13, v0, v14}, Lcom/belkin/rules/db/RulesDb;->getDeviceTableItemsBySensor(Ljava/lang/String;Ljava/lang/Integer;)Ljava/util/ArrayList;

    move-result-object v13

    invoke-virtual {v7, v13}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    .line 428
    new-instance v10, Ljava/util/ArrayList;

    invoke-direct {v10}, Ljava/util/ArrayList;-><init>()V

    .line 429
    .local v10, "ruleGrpID":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    invoke-virtual {v7}, Ljava/util/ArrayList;->size()I

    move-result v13

    if-lez v13, :cond_3

    .line 430
    const-string v8, ""

    .line 431
    invoke-virtual {v7}, Ljava/util/ArrayList;->size()I

    move-result v13

    add-int/lit8 v4, v13, -0x1

    .local v4, "i":I
    :goto_0
    if-ltz v4, :cond_1

    .line 432
    invoke-virtual {v7, v4}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v11

    check-cast v11, Lcom/belkin/rules/dbmigration/RuleDevicesTable;

    .line 433
    .local v11, "ruleRow":Lcom/belkin/rules/dbmigration/RuleDevicesTable;
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/belkin/rules/utils/WeeklyCalenderStringsCreator;->rDB:Lcom/belkin/rules/db/RulesDb;

    invoke-virtual {v13, v11, v10}, Lcom/belkin/rules/db/RulesDb;->getMergedSensorDevices(Lcom/belkin/rules/dbmigration/RuleDevicesTable;Ljava/util/ArrayList;)Ljava/lang/String;

    move-result-object v12

    .line 434
    .local v12, "sensorDevStr":Ljava/lang/String;
    if-eqz v12, :cond_0

    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/belkin/rules/utils/WeeklyCalenderStringsCreator;->rDB:Lcom/belkin/rules/db/RulesDb;

    invoke-virtual {v11}, Lcom/belkin/rules/dbmigration/RuleDevicesTable;->getRuleId()I

    move-result v14

    invoke-static {v14}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v14

    invoke-virtual {v13, v14}, Lcom/belkin/rules/db/RulesDb;->isDisabled(Ljava/lang/Integer;)Z

    move-result v13

    if-nez v13, :cond_0

    .line 435
    new-instance v13, Ljava/lang/StringBuilder;

    invoke-direct {v13}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v13, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual/range {p1 .. p1}, Ljava/lang/Integer;->intValue()I

    move-result v14

    move-object/from16 v0, p0

    invoke-direct {v0, v11, v12, v14}, Lcom/belkin/rules/utils/WeeklyCalenderStringsCreator;->mergeSensorString(Lcom/belkin/rules/dbmigration/RuleDevicesTable;Ljava/lang/String;I)Ljava/lang/String;

    move-result-object v14

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    .line 436
    invoke-virtual {v11}, Lcom/belkin/rules/dbmigration/RuleDevicesTable;->haveSRSS()Z

    move-result v2

    .line 431
    :cond_0
    add-int/lit8 v4, v4, -0x1

    goto :goto_0

    .line 440
    .end local v11    # "ruleRow":Lcom/belkin/rules/dbmigration/RuleDevicesTable;
    .end local v12    # "sensorDevStr":Ljava/lang/String;
    :cond_1
    invoke-virtual {v7}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v5

    .local v5, "i$":Ljava/util/Iterator;
    :cond_2
    :goto_1
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v13

    if-eqz v13, :cond_3

    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Lcom/belkin/rules/dbmigration/RuleDevicesTable;

    .line 441
    .local v9, "rule":Lcom/belkin/rules/dbmigration/RuleDevicesTable;
    sget-object v13, Lcom/belkin/rules/utils/WeeklyCalenderStringsCreator;->TAG:Ljava/lang/String;

    new-instance v14, Ljava/lang/StringBuilder;

    invoke-direct {v14}, Ljava/lang/StringBuilder;-><init>()V

    const-string v15, "the value of rule is::  RuleID "

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v9}, Lcom/belkin/rules/dbmigration/RuleDevicesTable;->getRuleId()I

    move-result v15

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v14

    const-string v15, "getDeviceId is: "

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v9}, Lcom/belkin/rules/dbmigration/RuleDevicesTable;->getDeviceId()Ljava/lang/String;

    move-result-object v15

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v14

    invoke-static {v13, v14}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 442
    new-instance v13, Ljava/lang/StringBuilder;

    invoke-direct {v13}, Ljava/lang/StringBuilder;-><init>()V

    const-string v14, ""

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v9}, Lcom/belkin/rules/dbmigration/RuleDevicesTable;->getRuleId()I

    move-result v14

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v13

    invoke-virtual {v10, v13}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    move-result v13

    if-nez v13, :cond_2

    .line 445
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/belkin/rules/utils/WeeklyCalenderStringsCreator;->rDB:Lcom/belkin/rules/db/RulesDb;

    invoke-virtual {v9}, Lcom/belkin/rules/dbmigration/RuleDevicesTable;->getRuleId()I

    move-result v14

    invoke-static {v14}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v14

    invoke-virtual {v13, v14}, Lcom/belkin/rules/db/RulesDb;->isDisabled(Ljava/lang/Integer;)Z

    move-result v13

    if-nez v13, :cond_2

    .line 446
    new-instance v13, Ljava/lang/StringBuilder;

    invoke-direct {v13}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v13, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual/range {p1 .. p1}, Ljava/lang/Integer;->intValue()I

    move-result v14

    move-object/from16 v0, p0

    invoke-direct {v0, v9, v14}, Lcom/belkin/rules/utils/WeeklyCalenderStringsCreator;->getStringByRuleType(Lcom/belkin/rules/dbmigration/RuleDevicesTable;I)Ljava/lang/String;

    move-result-object v14

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    .line 447
    invoke-virtual {v9}, Lcom/belkin/rules/dbmigration/RuleDevicesTable;->haveSRSS()Z

    move-result v2

    goto/16 :goto_1

    .line 453
    .end local v4    # "i":I
    .end local v5    # "i$":Ljava/util/Iterator;
    .end local v9    # "rule":Lcom/belkin/rules/dbmigration/RuleDevicesTable;
    :cond_3
    if-eqz v2, :cond_4

    const-string v13, "0"

    invoke-virtual {v8, v13}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v13

    if-nez v13, :cond_4

    .line 454
    new-instance v13, Ljava/lang/StringBuilder;

    invoke-direct {v13}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v13, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-direct/range {p0 .. p0}, Lcom/belkin/rules/utils/WeeklyCalenderStringsCreator;->getSRSSTail()Ljava/lang/String;

    move-result-object v14

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    .line 457
    :cond_4
    const-string v13, "0"

    invoke-virtual {v8, v13}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v13

    if-nez v13, :cond_6

    .line 458
    new-instance v13, Ljava/lang/StringBuilder;

    invoke-direct {v13}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v13, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    sget-char v14, Lcom/belkin/rules/utils/RulesConstants;->OFFSET_SEP:C

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    .line 459
    const/4 v4, 0x0

    .line 460
    .restart local v4    # "i":I
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/belkin/rules/utils/WeeklyCalenderStringsCreator;->lstSRSSOffset:Ljava/util/ArrayList;

    invoke-virtual {v13}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v5

    .restart local v5    # "i$":Ljava/util/Iterator;
    :goto_2
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v13

    if-eqz v13, :cond_6

    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/lang/Integer;

    .line 461
    .local v6, "offset":Ljava/lang/Integer;
    if-lez v4, :cond_5

    new-instance v13, Ljava/lang/StringBuilder;

    invoke-direct {v13}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v13, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    sget-char v14, Lcom/belkin/rules/utils/RulesConstants;->COMMA:C

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    .line 462
    :cond_5
    new-instance v13, Ljava/lang/StringBuilder;

    invoke-direct {v13}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v13, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v8

    .line 463
    add-int/lit8 v4, v4, 0x1

    .line 464
    goto :goto_2

    .line 466
    .end local v4    # "i":I
    .end local v5    # "i$":Ljava/util/Iterator;
    .end local v6    # "offset":Ljava/lang/Integer;
    .end local v7    # "resRules":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/belkin/rules/dbmigration/RuleDevicesTable;>;"
    .end local v10    # "ruleGrpID":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    :catch_0
    move-exception v3

    .line 467
    .local v3, "e":Ljava/lang/Exception;
    invoke-virtual {v3}, Ljava/lang/Exception;->printStackTrace()V

    .line 470
    .end local v3    # "e":Ljava/lang/Exception;
    :cond_6
    const-string v13, "0"

    invoke-virtual {v8, v13}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v13

    if-nez v13, :cond_7

    .line 471
    new-instance v13, Ljava/lang/StringBuilder;

    invoke-direct {v13}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/belkin/rules/utils/WeeklyCalenderStringsCreator;->rulesCount:Ljava/lang/Integer;

    invoke-virtual {v14}, Ljava/lang/Integer;->toString()Ljava/lang/String;

    move-result-object v14

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    .line 474
    :cond_7
    sget-object v13, Lcom/belkin/rules/utils/WeeklyCalenderStringsCreator;->TAG:Ljava/lang/String;

    new-instance v14, Ljava/lang/StringBuilder;

    invoke-direct {v14}, Ljava/lang/StringBuilder;-><init>()V

    const-string v15, "Generate Sensor Schedule String. DAY: "

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    move-object/from16 v0, p1

    invoke-virtual {v14, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v14

    const-string v15, "; SCH STR: "

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v14

    invoke-static {v13, v14}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 475
    return-object v8
.end method
