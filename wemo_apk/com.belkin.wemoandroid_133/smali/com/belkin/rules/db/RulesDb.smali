.class public Lcom/belkin/rules/db/RulesDb;
.super Ljava/lang/Object;
.source "RulesDb.java"


# static fields
.field private static TAG:Ljava/lang/String;

.field private static mRulesDatabaseInstance:Lcom/belkin/rules/db/RulesDb;


# instance fields
.field private db:Landroid/database/sqlite/SQLiteDatabase;

.field private ruleUtility:Lcom/belkin/utils/RuleUtility;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 22
    const-string v0, "RulesDb"

    sput-object v0, Lcom/belkin/rules/db/RulesDb;->TAG:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .locals 1
    .param p1, "mContext"    # Landroid/content/Context;

    .prologue
    .line 24
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 25
    new-instance v0, Lcom/belkin/utils/RuleUtility;

    invoke-direct {v0, p1}, Lcom/belkin/utils/RuleUtility;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/belkin/rules/db/RulesDb;->ruleUtility:Lcom/belkin/utils/RuleUtility;

    .line 26
    return-void
.end method

.method private cursorToRuleDevicesTable(Landroid/database/Cursor;)Lcom/belkin/rules/dbmigration/RuleDevicesTable;
    .locals 4
    .param p1, "cursor"    # Landroid/database/Cursor;

    .prologue
    .line 45
    new-instance v0, Lcom/belkin/rules/dbmigration/RuleDevicesTable;

    invoke-direct {v0}, Lcom/belkin/rules/dbmigration/RuleDevicesTable;-><init>()V

    .line 46
    .local v0, "result":Lcom/belkin/rules/dbmigration/RuleDevicesTable;
    const-string v1, "RuleID"

    invoke-interface {p1, v1}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v1

    invoke-interface {p1, v1}, Landroid/database/Cursor;->getInt(I)I

    move-result v1

    invoke-virtual {v0, v1}, Lcom/belkin/rules/dbmigration/RuleDevicesTable;->setRuleId(I)V

    .line 47
    const-string v1, "DeviceID"

    invoke-interface {p1, v1}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v1

    invoke-interface {p1, v1}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/belkin/rules/dbmigration/RuleDevicesTable;->setDeviceId(Ljava/lang/String;)V

    .line 48
    const-string v1, "GroupID"

    invoke-interface {p1, v1}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v1

    invoke-interface {p1, v1}, Landroid/database/Cursor;->getInt(I)I

    move-result v1

    invoke-virtual {v0, v1}, Lcom/belkin/rules/dbmigration/RuleDevicesTable;->setGroupId(I)V

    .line 49
    const-string v1, "DayID"

    invoke-interface {p1, v1}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v1

    invoke-interface {p1, v1}, Landroid/database/Cursor;->getInt(I)I

    move-result v1

    invoke-virtual {v0, v1}, Lcom/belkin/rules/dbmigration/RuleDevicesTable;->setDayId(I)V

    .line 50
    const-string v1, "StartTime"

    invoke-interface {p1, v1}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v1

    invoke-interface {p1, v1}, Landroid/database/Cursor;->getInt(I)I

    move-result v1

    invoke-virtual {v0, v1}, Lcom/belkin/rules/dbmigration/RuleDevicesTable;->setStarttime(I)V

    .line 51
    const-string v1, "RuleDuration"

    invoke-interface {p1, v1}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v1

    invoke-interface {p1, v1}, Landroid/database/Cursor;->getInt(I)I

    move-result v1

    invoke-virtual {v0, v1}, Lcom/belkin/rules/dbmigration/RuleDevicesTable;->setRuleDuration(I)V

    .line 52
    const-string v1, "StartAction"

    invoke-interface {p1, v1}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v1

    invoke-interface {p1, v1}, Landroid/database/Cursor;->getDouble(I)D

    move-result-wide v2

    invoke-virtual {v0, v2, v3}, Lcom/belkin/rules/dbmigration/RuleDevicesTable;->setStartAction(D)V

    .line 53
    const-string v1, "EndAction"

    invoke-interface {p1, v1}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v1

    invoke-interface {p1, v1}, Landroid/database/Cursor;->getDouble(I)D

    move-result-wide v2

    invoke-virtual {v0, v2, v3}, Lcom/belkin/rules/dbmigration/RuleDevicesTable;->setEndAction(D)V

    .line 54
    const-string v1, "SensorDuration"

    invoke-interface {p1, v1}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v1

    invoke-interface {p1, v1}, Landroid/database/Cursor;->getInt(I)I

    move-result v1

    invoke-virtual {v0, v1}, Lcom/belkin/rules/dbmigration/RuleDevicesTable;->setSensorDuration(I)V

    .line 55
    const-string v1, "Type"

    invoke-interface {p1, v1}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v1

    invoke-interface {p1, v1}, Landroid/database/Cursor;->getInt(I)I

    move-result v1

    invoke-virtual {v0, v1}, Lcom/belkin/rules/dbmigration/RuleDevicesTable;->setType(I)V

    .line 56
    const-string v1, "Value"

    invoke-interface {p1, v1}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v1

    invoke-interface {p1, v1}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/belkin/rules/dbmigration/RuleDevicesTable;->setValue(Ljava/lang/String;)V

    .line 57
    const-string v1, "Level"

    invoke-interface {p1, v1}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v1

    invoke-interface {p1, v1}, Landroid/database/Cursor;->getInt(I)I

    move-result v1

    invoke-virtual {v0, v1}, Lcom/belkin/rules/dbmigration/RuleDevicesTable;->setLevel(I)V

    .line 58
    const-string v1, "OnModeOffset"

    invoke-interface {p1, v1}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v1

    invoke-interface {p1, v1}, Landroid/database/Cursor;->getInt(I)I

    move-result v1

    invoke-virtual {v0, v1}, Lcom/belkin/rules/dbmigration/RuleDevicesTable;->setOnModeOffset(I)V

    .line 59
    const-string v1, "OffModeOffset"

    invoke-interface {p1, v1}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v1

    invoke-interface {p1, v1}, Landroid/database/Cursor;->getInt(I)I

    move-result v1

    invoke-virtual {v0, v1}, Lcom/belkin/rules/dbmigration/RuleDevicesTable;->setOffModeOffset(I)V

    .line 60
    const-string v1, "ZBCapabilityStart"

    invoke-interface {p1, v1}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v1

    invoke-interface {p1, v1}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/belkin/rules/dbmigration/RuleDevicesTable;->setZBCapabilityStart(Ljava/lang/String;)V

    .line 61
    const-string v1, "ZBCapabilityEnd"

    invoke-interface {p1, v1}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v1

    invoke-interface {p1, v1}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/belkin/rules/dbmigration/RuleDevicesTable;->setZBCapabilityEnd(Ljava/lang/String;)V

    .line 63
    return-object v0
.end method

.method public static declared-synchronized getRulesDatabase(Landroid/content/Context;)Lcom/belkin/rules/db/RulesDb;
    .locals 7
    .param p0, "context"    # Landroid/content/Context;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/belkin/exception/DatabaseException;
        }
    .end annotation

    .prologue
    .line 31
    const-class v3, Lcom/belkin/rules/db/RulesDb;

    monitor-enter v3

    :try_start_0
    sget-object v2, Lcom/belkin/rules/db/RulesDb;->mRulesDatabaseInstance:Lcom/belkin/rules/db/RulesDb;

    if-nez v2, :cond_0

    .line 32
    new-instance v2, Lcom/belkin/rules/db/RulesDb;

    invoke-direct {v2, p0}, Lcom/belkin/rules/db/RulesDb;-><init>(Landroid/content/Context;)V

    sput-object v2, Lcom/belkin/rules/db/RulesDb;->mRulesDatabaseInstance:Lcom/belkin/rules/db/RulesDb;

    .line 33
    :cond_0
    sget-object v2, Lcom/belkin/rules/db/RulesDb;->mRulesDatabaseInstance:Lcom/belkin/rules/db/RulesDb;

    iget-object v2, v2, Lcom/belkin/rules/db/RulesDb;->db:Landroid/database/sqlite/SQLiteDatabase;

    if-nez v2, :cond_1

    .line 34
    new-instance v1, Lcom/belkin/utils/RuleUtility;

    invoke-direct {v1, p0}, Lcom/belkin/utils/RuleUtility;-><init>(Landroid/content/Context;)V

    .line 36
    .local v1, "ruleUtility":Lcom/belkin/utils/RuleUtility;
    sget-object v2, Lcom/belkin/rules/db/RulesDb;->mRulesDatabaseInstance:Lcom/belkin/rules/db/RulesDb;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v5, Lcom/belkin/rules/db/RulesDb;->mRulesDatabaseInstance:Lcom/belkin/rules/db/RulesDb;

    iget-object v5, v5, Lcom/belkin/rules/db/RulesDb;->ruleUtility:Lcom/belkin/utils/RuleUtility;

    invoke-static {}, Lcom/belkin/utils/RuleUtility;->getLocalDBPath()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-static {}, Lcom/belkin/utils/RuleUtility;->getLocalDBName()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    const/4 v5, 0x0

    const/4 v6, 0x0

    invoke-static {v4, v5, v6}, Landroid/database/sqlite/SQLiteDatabase;->openDatabase(Ljava/lang/String;Landroid/database/sqlite/SQLiteDatabase$CursorFactory;I)Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v4

    iput-object v4, v2, Lcom/belkin/rules/db/RulesDb;->db:Landroid/database/sqlite/SQLiteDatabase;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 41
    .end local v1    # "ruleUtility":Lcom/belkin/utils/RuleUtility;
    :cond_1
    :try_start_1
    sget-object v2, Lcom/belkin/rules/db/RulesDb;->mRulesDatabaseInstance:Lcom/belkin/rules/db/RulesDb;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    monitor-exit v3

    return-object v2

    .line 38
    :catch_0
    move-exception v0

    .line 39
    .local v0, "e":Ljava/lang/Exception;
    :try_start_2
    new-instance v2, Lcom/belkin/exception/DatabaseException;

    const-string v4, "Can not create Database"

    invoke-direct {v2, v4, v0}, Lcom/belkin/exception/DatabaseException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v2
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 31
    .end local v0    # "e":Ljava/lang/Exception;
    :catchall_0
    move-exception v2

    monitor-exit v3

    throw v2
.end method


# virtual methods
.method public getDeviceTableItems(Ljava/lang/String;Ljava/lang/Integer;)Ljava/util/ArrayList;
    .locals 12
    .param p1, "udn"    # Ljava/lang/String;
    .param p2, "dayID"    # Ljava/lang/Integer;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/lang/Integer;",
            ")",
            "Ljava/util/ArrayList",
            "<",
            "Lcom/belkin/rules/dbmigration/RuleDevicesTable;",
            ">;"
        }
    .end annotation

    .prologue
    .line 84
    new-instance v11, Ljava/util/ArrayList;

    invoke-direct {v11}, Ljava/util/ArrayList;-><init>()V

    .line 87
    .local v11, "lstResult":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/belkin/rules/dbmigration/RuleDevicesTable;>;"
    :try_start_0
    const-string v3, "DeviceID=? AND DayID = ?"

    .line 88
    .local v3, "whereClause":Ljava/lang/String;
    const/4 v0, 0x2

    new-array v4, v0, [Ljava/lang/String;

    const/4 v0, 0x0

    aput-object p1, v4, v0

    const/4 v0, 0x1

    invoke-virtual {p2}, Ljava/lang/Integer;->toString()Ljava/lang/String;

    move-result-object v1

    aput-object v1, v4, v0

    .line 91
    .local v4, "whereArgs":[Ljava/lang/String;
    iget-object v0, p0, Lcom/belkin/rules/db/RulesDb;->db:Landroid/database/sqlite/SQLiteDatabase;

    const-string v1, "RULEDEVICES"

    const/4 v2, 0x0

    const/4 v5, 0x0

    const/4 v6, 0x0

    const/4 v7, 0x0

    const/4 v8, 0x0

    invoke-virtual/range {v0 .. v8}, Landroid/database/sqlite/SQLiteDatabase;->query(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v9

    .line 93
    .local v9, "cursor":Landroid/database/Cursor;
    invoke-interface {v9}, Landroid/database/Cursor;->moveToFirst()Z

    .line 94
    :goto_0
    invoke-interface {v9}, Landroid/database/Cursor;->isAfterLast()Z

    move-result v0

    if-nez v0, :cond_1

    .line 95
    invoke-direct {p0, v9}, Lcom/belkin/rules/db/RulesDb;->cursorToRuleDevicesTable(Landroid/database/Cursor;)Lcom/belkin/rules/dbmigration/RuleDevicesTable;

    move-result-object v0

    invoke-virtual {v11, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 96
    invoke-interface {v9}, Landroid/database/Cursor;->moveToNext()Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 101
    .end local v3    # "whereClause":Ljava/lang/String;
    .end local v4    # "whereArgs":[Ljava/lang/String;
    .end local v9    # "cursor":Landroid/database/Cursor;
    :catch_0
    move-exception v10

    .line 102
    .local v10, "e":Ljava/lang/Exception;
    invoke-virtual {v10}, Ljava/lang/Exception;->printStackTrace()V

    .line 105
    .end local v10    # "e":Ljava/lang/Exception;
    :cond_0
    :goto_1
    return-object v11

    .line 98
    .restart local v3    # "whereClause":Ljava/lang/String;
    .restart local v4    # "whereArgs":[Ljava/lang/String;
    .restart local v9    # "cursor":Landroid/database/Cursor;
    :cond_1
    if-eqz v9, :cond_0

    :try_start_1
    invoke-interface {v9}, Landroid/database/Cursor;->isClosed()Z

    move-result v0

    if-nez v0, :cond_0

    .line 99
    invoke-interface {v9}, Landroid/database/Cursor;->close()V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_1
.end method

.method public getDeviceTableItemsBySensor(Ljava/lang/String;Ljava/lang/Integer;)Ljava/util/ArrayList;
    .locals 21
    .param p1, "udn"    # Ljava/lang/String;
    .param p2, "schdDay"    # Ljava/lang/Integer;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/lang/Integer;",
            ")",
            "Ljava/util/ArrayList",
            "<",
            "Lcom/belkin/rules/dbmigration/RuleDevicesTable;",
            ">;"
        }
    .end annotation

    .prologue
    .line 219
    new-instance v20, Ljava/util/ArrayList;

    invoke-direct/range {v20 .. v20}, Ljava/util/ArrayList;-><init>()V

    .line 222
    .local v20, "lstResult":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/belkin/rules/dbmigration/RuleDevicesTable;>;"
    :try_start_0
    const-string v6, "DeviceID=? AND DayID = ?"

    .line 223
    .local v6, "whereClause":Ljava/lang/String;
    const/4 v2, 0x2

    new-array v7, v2, [Ljava/lang/String;

    const/4 v2, 0x0

    aput-object p1, v7, v2

    const/4 v2, 0x1

    const-string v3, "-1"

    aput-object v3, v7, v2

    .line 226
    .local v7, "whereArgs":[Ljava/lang/String;
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/belkin/rules/db/RulesDb;->db:Landroid/database/sqlite/SQLiteDatabase;

    const/4 v3, 0x1

    const-string v4, "RULEDEVICES"

    const/4 v5, 0x1

    new-array v5, v5, [Ljava/lang/String;

    const/4 v8, 0x0

    const-string v9, "RuleID"

    aput-object v9, v5, v8

    const/4 v8, 0x0

    const/4 v9, 0x0

    const/4 v10, 0x0

    const/4 v11, 0x0

    invoke-virtual/range {v2 .. v11}, Landroid/database/sqlite/SQLiteDatabase;->query(ZLjava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v17

    .line 228
    .local v17, "cursor":Landroid/database/Cursor;
    invoke-interface/range {v17 .. v17}, Landroid/database/Cursor;->moveToFirst()Z

    .line 229
    :goto_0
    invoke-interface/range {v17 .. v17}, Landroid/database/Cursor;->isAfterLast()Z

    move-result v2

    if-nez v2, :cond_2

    .line 230
    const-string v11, "DayID =? AND RuleID=?"

    .line 231
    .local v11, "whereClauseD":Ljava/lang/String;
    const/4 v2, 0x2

    new-array v12, v2, [Ljava/lang/String;

    const/4 v2, 0x0

    invoke-virtual/range {p2 .. p2}, Ljava/lang/Integer;->toString()Ljava/lang/String;

    move-result-object v3

    aput-object v3, v12, v2

    const/4 v2, 0x1

    const-string v3, "RuleID"

    move-object/from16 v0, v17

    invoke-interface {v0, v3}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v3

    move-object/from16 v0, v17

    invoke-interface {v0, v3}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v3

    aput-object v3, v12, v2

    .line 234
    .local v12, "whereArgsD":[Ljava/lang/String;
    move-object/from16 v0, p0

    iget-object v8, v0, Lcom/belkin/rules/db/RulesDb;->db:Landroid/database/sqlite/SQLiteDatabase;

    const-string v9, "RULEDEVICES"

    const/4 v10, 0x0

    const-string v13, "DayID"

    const/4 v14, 0x0

    const-string v15, "StartTime"

    const/16 v16, 0x0

    invoke-virtual/range {v8 .. v16}, Landroid/database/sqlite/SQLiteDatabase;->query(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v18

    .line 236
    .local v18, "cursorD":Landroid/database/Cursor;
    invoke-interface/range {v18 .. v18}, Landroid/database/Cursor;->moveToFirst()Z

    .line 237
    :goto_1
    invoke-interface/range {v18 .. v18}, Landroid/database/Cursor;->isAfterLast()Z

    move-result v2

    if-nez v2, :cond_1

    .line 238
    move-object/from16 v0, p0

    move-object/from16 v1, v18

    invoke-direct {v0, v1}, Lcom/belkin/rules/db/RulesDb;->cursorToRuleDevicesTable(Landroid/database/Cursor;)Lcom/belkin/rules/dbmigration/RuleDevicesTable;

    move-result-object v2

    move-object/from16 v0, v20

    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 239
    invoke-interface/range {v18 .. v18}, Landroid/database/Cursor;->moveToNext()Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_1

    .line 246
    .end local v6    # "whereClause":Ljava/lang/String;
    .end local v7    # "whereArgs":[Ljava/lang/String;
    .end local v11    # "whereClauseD":Ljava/lang/String;
    .end local v12    # "whereArgsD":[Ljava/lang/String;
    .end local v17    # "cursor":Landroid/database/Cursor;
    .end local v18    # "cursorD":Landroid/database/Cursor;
    :catch_0
    move-exception v19

    .line 247
    .local v19, "e":Ljava/lang/Exception;
    invoke-virtual/range {v19 .. v19}, Ljava/lang/Exception;->printStackTrace()V

    .line 250
    .end local v19    # "e":Ljava/lang/Exception;
    :cond_0
    :goto_2
    return-object v20

    .line 241
    .restart local v6    # "whereClause":Ljava/lang/String;
    .restart local v7    # "whereArgs":[Ljava/lang/String;
    .restart local v11    # "whereClauseD":Ljava/lang/String;
    .restart local v12    # "whereArgsD":[Ljava/lang/String;
    .restart local v17    # "cursor":Landroid/database/Cursor;
    .restart local v18    # "cursorD":Landroid/database/Cursor;
    :cond_1
    :try_start_1
    invoke-interface/range {v17 .. v17}, Landroid/database/Cursor;->moveToNext()Z

    goto :goto_0

    .line 243
    .end local v11    # "whereClauseD":Ljava/lang/String;
    .end local v12    # "whereArgsD":[Ljava/lang/String;
    .end local v18    # "cursorD":Landroid/database/Cursor;
    :cond_2
    if-eqz v17, :cond_0

    invoke-interface/range {v17 .. v17}, Landroid/database/Cursor;->isClosed()Z

    move-result v2

    if-nez v2, :cond_0

    .line 244
    invoke-interface/range {v17 .. v17}, Landroid/database/Cursor;->close()V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_2
.end method

.method public getExtendedFeatureStr(Ljava/lang/Integer;)Ljava/lang/String;
    .locals 11
    .param p1, "ruleId"    # Ljava/lang/Integer;

    .prologue
    const/4 v2, 0x0

    .line 109
    const-string v10, ""

    .line 111
    .local v10, "result":Ljava/lang/String;
    const-string v3, "RuleID=? AND DayID=-1"

    .line 112
    .local v3, "whereClause":Ljava/lang/String;
    const/4 v0, 0x1

    new-array v4, v0, [Ljava/lang/String;

    const/4 v0, 0x0

    invoke-virtual {p1}, Ljava/lang/Integer;->toString()Ljava/lang/String;

    move-result-object v1

    aput-object v1, v4, v0

    .line 115
    .local v4, "whereArgs":[Ljava/lang/String;
    iget-object v0, p0, Lcom/belkin/rules/db/RulesDb;->db:Landroid/database/sqlite/SQLiteDatabase;

    const-string v1, "RULEDEVICES"

    move-object v5, v2

    move-object v6, v2

    move-object v7, v2

    move-object v8, v2

    invoke-virtual/range {v0 .. v8}, Landroid/database/sqlite/SQLiteDatabase;->query(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v9

    .line 117
    .local v9, "cursor":Landroid/database/Cursor;
    invoke-interface {v9}, Landroid/database/Cursor;->moveToFirst()Z

    .line 118
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "Type"

    invoke-interface {v9, v1}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v1

    invoke-interface {v9, v1}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ":"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "Value"

    invoke-interface {v9, v1}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v1

    invoke-interface {v9, v1}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ":"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "Level"

    invoke-interface {v9, v1}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v1

    invoke-interface {v9, v1}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    .line 121
    if-eqz v9, :cond_0

    invoke-interface {v9}, Landroid/database/Cursor;->isClosed()Z

    move-result v0

    if-nez v0, :cond_0

    .line 122
    invoke-interface {v9}, Landroid/database/Cursor;->close()V

    .line 123
    :cond_0
    return-object v10
.end method

.method public getLocation()Lcom/belkin/cloud/objects/CloudObjectLocation;
    .locals 14

    .prologue
    const/4 v13, 0x0

    .line 328
    :try_start_0
    iget-object v0, p0, Lcom/belkin/rules/db/RulesDb;->db:Landroid/database/sqlite/SQLiteDatabase;

    const/4 v1, 0x1

    const-string v2, "LOCATIONINFO"

    const/4 v3, 0x3

    new-array v3, v3, [Ljava/lang/String;

    const/4 v4, 0x0

    const-string v5, "cityName"

    aput-object v5, v3, v4

    const/4 v4, 0x1

    const-string v5, "latitude"

    aput-object v5, v3, v4

    const/4 v4, 0x2

    const-string v5, "longitude"

    aput-object v5, v3, v4

    const/4 v4, 0x0

    const/4 v5, 0x0

    const/4 v6, 0x0

    const/4 v7, 0x0

    const/4 v8, 0x0

    const/4 v9, 0x0

    invoke-virtual/range {v0 .. v9}, Landroid/database/sqlite/SQLiteDatabase;->query(ZLjava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v10

    .line 330
    .local v10, "cursor":Landroid/database/Cursor;
    invoke-interface {v10}, Landroid/database/Cursor;->moveToFirst()Z

    .line 332
    new-instance v12, Lcom/belkin/cloud/objects/CloudObjectLocation;

    invoke-direct {v12}, Lcom/belkin/cloud/objects/CloudObjectLocation;-><init>()V

    .line 333
    .local v12, "objectLocation":Lcom/belkin/cloud/objects/CloudObjectLocation;
    const-string v0, "cityName"

    invoke-interface {v10, v0}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v0

    invoke-interface {v10, v0}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v12, v0}, Lcom/belkin/cloud/objects/CloudObjectLocation;->setCityName(Ljava/lang/String;)V

    .line 334
    const-string v0, "latitude"

    invoke-interface {v10, v0}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v0

    invoke-interface {v10, v0}, Landroid/database/Cursor;->getDouble(I)D

    move-result-wide v0

    invoke-static {v0, v1}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v0

    invoke-virtual {v12, v0}, Lcom/belkin/cloud/objects/CloudObjectLocation;->setLatitude(Ljava/lang/Double;)V

    .line 335
    const-string v0, "longitude"

    invoke-interface {v10, v0}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v0

    invoke-interface {v10, v0}, Landroid/database/Cursor;->getDouble(I)D

    move-result-wide v0

    invoke-static {v0, v1}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v0

    invoke-virtual {v12, v0}, Lcom/belkin/cloud/objects/CloudObjectLocation;->setLongitude(Ljava/lang/Double;)V

    .line 337
    if-eqz v10, :cond_0

    invoke-interface {v10}, Landroid/database/Cursor;->isClosed()Z

    move-result v0

    if-nez v0, :cond_0

    .line 338
    invoke-interface {v10}, Landroid/database/Cursor;->close()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 346
    .end local v10    # "cursor":Landroid/database/Cursor;
    .end local v12    # "objectLocation":Lcom/belkin/cloud/objects/CloudObjectLocation;
    :cond_0
    :goto_0
    return-object v12

    .line 342
    :catch_0
    move-exception v11

    .line 343
    .local v11, "e":Ljava/lang/Exception;
    invoke-virtual {v11}, Ljava/lang/Exception;->printStackTrace()V

    move-object v12, v13

    .line 346
    goto :goto_0
.end method

.method public getMergedSensorDevices(Lcom/belkin/rules/dbmigration/RuleDevicesTable;Ljava/util/ArrayList;)Ljava/lang/String;
    .locals 20
    .param p1, "rule"    # Lcom/belkin/rules/dbmigration/RuleDevicesTable;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/belkin/rules/dbmigration/RuleDevicesTable;",
            "Ljava/util/ArrayList",
            "<",
            "Ljava/lang/String;",
            ">;)",
            "Ljava/lang/String;"
        }
    .end annotation

    .prologue
    .line 158
    .local p2, "ruleGroup":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    sget-object v2, Lcom/belkin/rules/db/RulesDb;->TAG:Ljava/lang/String;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "THE rule getValue is:::"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual/range {p1 .. p1}, Lcom/belkin/rules/dbmigration/RuleDevicesTable;->getValue()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 159
    const-string v16, ""

    .line 160
    .local v16, "result":Ljava/lang/String;
    new-instance v18, Ljava/util/ArrayList;

    invoke-direct/range {v18 .. v18}, Ljava/util/ArrayList;-><init>()V

    .line 161
    .local v18, "tempArray":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    new-instance v19, Ljava/util/ArrayList;

    invoke-direct/range {v19 .. v19}, Ljava/util/ArrayList;-><init>()V

    .line 162
    .local v19, "uniqueDevices":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    const-string v6, "StartTime=? AND RuleDuration=? AND Value=? AND DayID = ?"

    .line 163
    .local v6, "whereClause":Ljava/lang/String;
    const/4 v2, 0x4

    new-array v7, v2, [Ljava/lang/String;

    const/4 v2, 0x0

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, ""

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual/range {p1 .. p1}, Lcom/belkin/rules/dbmigration/RuleDevicesTable;->getStarttime()I

    move-result v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    aput-object v3, v7, v2

    const/4 v2, 0x1

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, ""

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual/range {p1 .. p1}, Lcom/belkin/rules/dbmigration/RuleDevicesTable;->getRuleDuration()I

    move-result v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    aput-object v3, v7, v2

    const/4 v2, 0x2

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, ""

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual/range {p1 .. p1}, Lcom/belkin/rules/dbmigration/RuleDevicesTable;->getValue()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    aput-object v3, v7, v2

    const/4 v2, 0x3

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, ""

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual/range {p1 .. p1}, Lcom/belkin/rules/dbmigration/RuleDevicesTable;->getDayId()I

    move-result v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    aput-object v3, v7, v2

    .line 166
    .local v7, "whereArgs":[Ljava/lang/String;
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/belkin/rules/db/RulesDb;->db:Landroid/database/sqlite/SQLiteDatabase;

    const/4 v3, 0x1

    const-string v4, "RULEDEVICES"

    const/4 v5, 0x5

    new-array v5, v5, [Ljava/lang/String;

    const/4 v8, 0x0

    const-string v9, "RuleID"

    aput-object v9, v5, v8

    const/4 v8, 0x1

    const-string v9, "DeviceID"

    aput-object v9, v5, v8

    const/4 v8, 0x2

    const-string v9, "StartAction"

    aput-object v9, v5, v8

    const/4 v8, 0x3

    const-string v9, "EndAction"

    aput-object v9, v5, v8

    const/4 v8, 0x4

    const-string v9, "SensorDuration"

    aput-object v9, v5, v8

    const/4 v8, 0x0

    const/4 v9, 0x0

    const/4 v10, 0x0

    const/4 v11, 0x0

    invoke-virtual/range {v2 .. v11}, Landroid/database/sqlite/SQLiteDatabase;->query(ZLjava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v12

    .line 168
    .local v12, "cursor":Landroid/database/Cursor;
    invoke-interface {v12}, Landroid/database/Cursor;->moveToFirst()Z

    .line 169
    const/4 v2, 0x0

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v13

    .line 171
    .local v13, "devCount":Ljava/lang/Integer;
    :goto_0
    invoke-interface {v12}, Landroid/database/Cursor;->isAfterLast()Z

    move-result v2

    if-nez v2, :cond_7

    .line 172
    new-instance v17, Ljava/lang/Integer;

    const-string v2, "RuleID"

    invoke-interface {v12, v2}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v2

    invoke-interface {v12, v2}, Landroid/database/Cursor;->getFloat(I)F

    move-result v2

    float-to-int v2, v2

    move-object/from16 v0, v17

    invoke-direct {v0, v2}, Ljava/lang/Integer;-><init>(I)V

    .line 173
    .local v17, "ruleId":Ljava/lang/Integer;
    const-string v2, "DeviceID"

    invoke-interface {v12, v2}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v2

    invoke-interface {v12, v2}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v14

    .line 174
    .local v14, "deviceID":Ljava/lang/String;
    move-object/from16 v0, p0

    move-object/from16 v1, v17

    invoke-virtual {v0, v1}, Lcom/belkin/rules/db/RulesDb;->getRuleType(Ljava/lang/Integer;)Ljava/lang/String;

    move-result-object v2

    sget-object v3, Lcom/belkin/rules/utils/RulesConstants;->RULE_MAKER_MOTION:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_0

    move-object/from16 v0, p0

    move-object/from16 v1, v17

    invoke-virtual {v0, v1}, Lcom/belkin/rules/db/RulesDb;->getRuleType(Ljava/lang/Integer;)Ljava/lang/String;

    move-result-object v2

    sget-object v3, Lcom/belkin/rules/utils/RulesConstants;->RULE_MAKER_MOTION_NOTIFICATION:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 175
    :cond_0
    invoke-interface {v12}, Landroid/database/Cursor;->moveToNext()Z

    goto :goto_0

    .line 178
    :cond_1
    move-object/from16 v0, v19

    invoke-virtual {v0, v14}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_5

    .line 179
    move-object/from16 v0, v19

    invoke-virtual {v0, v14}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 180
    invoke-virtual {v13}, Ljava/lang/Integer;->intValue()I

    move-result v2

    if-lez v2, :cond_2

    .line 181
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, v16

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    sget-char v3, Lcom/belkin/rules/utils/RulesConstants;->SEMICOLUMN:C

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v16

    .line 183
    :cond_2
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, v16

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    sget-char v3, Lcom/belkin/rules/utils/RulesConstants;->COMMA:C

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v16

    .line 185
    move-object/from16 v0, p0

    move-object/from16 v1, v17

    invoke-virtual {v0, v1}, Lcom/belkin/rules/db/RulesDb;->getRuleType(Ljava/lang/Integer;)Ljava/lang/String;

    move-result-object v2

    sget-object v3, Lcom/belkin/rules/utils/RulesConstants;->RULE_SENSOR_NOTIFICATION:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_3

    move-object/from16 v0, p0

    move-object/from16 v1, v17

    invoke-virtual {v0, v1}, Lcom/belkin/rules/db/RulesDb;->getRuleType(Ljava/lang/Integer;)Ljava/lang/String;

    move-result-object v2

    sget-object v3, Lcom/belkin/rules/utils/RulesConstants;->RULE_INSIGHT:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_6

    .line 187
    :cond_3
    move-object/from16 v0, p0

    move-object/from16 v1, v17

    invoke-virtual {v0, v1}, Lcom/belkin/rules/db/RulesDb;->getNotifyRuleID(Ljava/lang/Integer;)Ljava/lang/String;

    move-result-object v15

    .line 188
    .local v15, "notifyRuleID":Ljava/lang/String;
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, v16

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "9"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    sget-char v3, Lcom/belkin/rules/utils/RulesConstants;->COMMA:C

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    sget-char v3, Lcom/belkin/rules/utils/RulesConstants;->COMMA:C

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "0"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v16

    .line 195
    .end local v15    # "notifyRuleID":Ljava/lang/String;
    :goto_1
    invoke-virtual/range {v17 .. v17}, Ljava/lang/Integer;->toString()Ljava/lang/String;

    move-result-object v2

    move-object/from16 v0, v18

    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_4

    .line 196
    invoke-virtual/range {v17 .. v17}, Ljava/lang/Integer;->toString()Ljava/lang/String;

    move-result-object v2

    move-object/from16 v0, v18

    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 197
    :cond_4
    invoke-virtual {v13}, Ljava/lang/Integer;->intValue()I

    move-result v2

    add-int/lit8 v2, v2, 0x1

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v13

    .line 199
    :cond_5
    invoke-interface {v12}, Landroid/database/Cursor;->moveToNext()Z

    goto/16 :goto_0

    .line 191
    :cond_6
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, v16

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    new-instance v3, Ljava/lang/Integer;

    const-string v4, "StartAction"

    invoke-interface {v12, v4}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v4

    invoke-interface {v12, v4}, Landroid/database/Cursor;->getFloat(I)F

    move-result v4

    float-to-int v4, v4

    invoke-direct {v3, v4}, Ljava/lang/Integer;-><init>(I)V

    invoke-virtual {v3}, Ljava/lang/Integer;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    sget-char v3, Lcom/belkin/rules/utils/RulesConstants;->COMMA:C

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v16

    .line 192
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, v16

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    new-instance v3, Ljava/lang/Integer;

    const-string v4, "SensorDuration"

    invoke-interface {v12, v4}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v4

    invoke-interface {v12, v4}, Landroid/database/Cursor;->getFloat(I)F

    move-result v4

    float-to-int v4, v4

    invoke-direct {v3, v4}, Ljava/lang/Integer;-><init>(I)V

    invoke-virtual {v3}, Ljava/lang/Integer;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    sget-char v3, Lcom/belkin/rules/utils/RulesConstants;->COMMA:C

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v16

    .line 193
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, v16

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    new-instance v3, Ljava/lang/Integer;

    const-string v4, "EndAction"

    invoke-interface {v12, v4}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v4

    invoke-interface {v12, v4}, Landroid/database/Cursor;->getFloat(I)F

    move-result v4

    float-to-int v4, v4

    invoke-direct {v3, v4}, Ljava/lang/Integer;-><init>(I)V

    invoke-virtual {v3}, Ljava/lang/Integer;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v16

    goto/16 :goto_1

    .line 201
    .end local v14    # "deviceID":Ljava/lang/String;
    .end local v17    # "ruleId":Ljava/lang/Integer;
    :cond_7
    invoke-virtual {v13}, Ljava/lang/Integer;->intValue()I

    move-result v2

    const/4 v3, 0x1

    if-gt v2, v3, :cond_8

    .line 203
    sget-object v2, Lcom/belkin/rules/db/RulesDb;->TAG:Ljava/lang/String;

    const-string v3, "Returing NULL"

    invoke-static {v2, v3}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 204
    const/4 v2, 0x0

    .line 215
    :goto_2
    return-object v2

    .line 208
    :cond_8
    move-object/from16 v0, p2

    move-object/from16 v1, v18

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    .line 210
    if-eqz v12, :cond_9

    invoke-interface {v12}, Landroid/database/Cursor;->isClosed()Z

    move-result v2

    if-nez v2, :cond_9

    .line 211
    invoke-interface {v12}, Landroid/database/Cursor;->close()V

    .line 213
    :cond_9
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v13}, Ljava/lang/Integer;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    sget-char v3, Lcom/belkin/rules/utils/RulesConstants;->SEMICOLUMN:C

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "0"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    sget-char v3, Lcom/belkin/rules/utils/RulesConstants;->SEMICOLUMN:C

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "0"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    sget-char v3, Lcom/belkin/rules/utils/RulesConstants;->SEMICOLUMN:C

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v2

    move-object/from16 v0, v16

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v16

    .line 214
    sget-object v2, Lcom/belkin/rules/db/RulesDb;->TAG:Ljava/lang/String;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Value of FINAL RESULT IS:: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    move-object/from16 v0, v16

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    move-object/from16 v2, v16

    .line 215
    goto :goto_2
.end method

.method public getNotifyRuleID(Ljava/lang/Integer;)Ljava/lang/String;
    .locals 11
    .param p1, "ruleId"    # Ljava/lang/Integer;

    .prologue
    const/4 v2, 0x0

    .line 350
    const-string v10, ""

    .line 351
    .local v10, "result":Ljava/lang/String;
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "RuleID="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    .line 352
    .local v3, "whereClause":Ljava/lang/String;
    iget-object v0, p0, Lcom/belkin/rules/db/RulesDb;->db:Landroid/database/sqlite/SQLiteDatabase;

    const-string v1, "SENSORNOTIFICATION"

    move-object v4, v2

    move-object v5, v2

    move-object v6, v2

    move-object v7, v2

    move-object v8, v2

    invoke-virtual/range {v0 .. v8}, Landroid/database/sqlite/SQLiteDatabase;->query(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v9

    .line 353
    .local v9, "cursor":Landroid/database/Cursor;
    invoke-interface {v9}, Landroid/database/Cursor;->moveToFirst()Z

    .line 354
    const-string v0, "NotifyRuleID"

    invoke-interface {v9, v0}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v0

    invoke-interface {v9, v0}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v10

    .line 355
    sget-object v0, Lcom/belkin/rules/db/RulesDb;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "getNotifyRuleID is ::"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 356
    if-eqz v9, :cond_0

    invoke-interface {v9}, Landroid/database/Cursor;->isClosed()Z

    move-result v0

    if-nez v0, :cond_0

    .line 357
    invoke-interface {v9}, Landroid/database/Cursor;->close()V

    .line 358
    :cond_0
    return-object v10
.end method

.method public getRuleType(Ljava/lang/Integer;)Ljava/lang/String;
    .locals 11
    .param p1, "ruleId"    # Ljava/lang/Integer;

    .prologue
    const/4 v2, 0x0

    .line 67
    const-string v10, ""

    .line 69
    .local v10, "result":Ljava/lang/String;
    const-string v3, "RuleID=?"

    .line 70
    .local v3, "whereClause":Ljava/lang/String;
    const/4 v0, 0x1

    new-array v4, v0, [Ljava/lang/String;

    const/4 v0, 0x0

    invoke-virtual {p1}, Ljava/lang/Integer;->toString()Ljava/lang/String;

    move-result-object v1

    aput-object v1, v4, v0

    .line 73
    .local v4, "whereArgs":[Ljava/lang/String;
    iget-object v0, p0, Lcom/belkin/rules/db/RulesDb;->db:Landroid/database/sqlite/SQLiteDatabase;

    const-string v1, "RULES"

    move-object v5, v2

    move-object v6, v2

    move-object v7, v2

    move-object v8, v2

    invoke-virtual/range {v0 .. v8}, Landroid/database/sqlite/SQLiteDatabase;->query(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v9

    .line 75
    .local v9, "cursor":Landroid/database/Cursor;
    invoke-interface {v9}, Landroid/database/Cursor;->moveToFirst()Z

    .line 76
    const-string v0, "Type"

    invoke-interface {v9, v0}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v0

    invoke-interface {v9, v0}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v10

    .line 77
    if-eqz v9, :cond_0

    invoke-interface {v9}, Landroid/database/Cursor;->isClosed()Z

    move-result v0

    if-nez v0, :cond_0

    .line 78
    invoke-interface {v9}, Landroid/database/Cursor;->close()V

    .line 80
    :cond_0
    return-object v10
.end method

.method public getSensorDevicesStr(Ljava/lang/Integer;)Ljava/lang/String;
    .locals 14
    .param p1, "ruleId"    # Ljava/lang/Integer;

    .prologue
    const/4 v8, 0x2

    const/4 v1, 0x1

    const/4 v13, 0x0

    const/4 v6, 0x0

    .line 127
    const-string v12, ""

    .line 129
    .local v12, "result":Ljava/lang/String;
    const-string v4, "RuleID=? AND DayID != ?"

    .line 130
    .local v4, "whereClause":Ljava/lang/String;
    new-array v5, v8, [Ljava/lang/String;

    invoke-virtual {p1}, Ljava/lang/Integer;->toString()Ljava/lang/String;

    move-result-object v0

    aput-object v0, v5, v13

    const-string v0, "-1"

    aput-object v0, v5, v1

    .line 133
    .local v5, "whereArgs":[Ljava/lang/String;
    iget-object v0, p0, Lcom/belkin/rules/db/RulesDb;->db:Landroid/database/sqlite/SQLiteDatabase;

    const-string v2, "RULEDEVICES"

    const/4 v3, 0x4

    new-array v3, v3, [Ljava/lang/String;

    const-string v7, "DeviceID"

    aput-object v7, v3, v13

    const-string v7, "StartAction"

    aput-object v7, v3, v1

    const-string v7, "EndAction"

    aput-object v7, v3, v8

    const/4 v7, 0x3

    const-string v8, "SensorDuration"

    aput-object v8, v3, v7

    move-object v7, v6

    move-object v8, v6

    move-object v9, v6

    invoke-virtual/range {v0 .. v9}, Landroid/database/sqlite/SQLiteDatabase;->query(ZLjava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v10

    .line 135
    .local v10, "cursor":Landroid/database/Cursor;
    invoke-interface {v10}, Landroid/database/Cursor;->moveToFirst()Z

    .line 137
    invoke-static {v13}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v11

    .line 139
    .local v11, "devCount":Ljava/lang/Integer;
    :goto_0
    invoke-interface {v10}, Landroid/database/Cursor;->isAfterLast()Z

    move-result v0

    if-nez v0, :cond_1

    .line 140
    invoke-virtual {v11}, Ljava/lang/Integer;->intValue()I

    move-result v0

    if-lez v0, :cond_0

    .line 141
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    sget-char v1, Lcom/belkin/rules/utils/RulesConstants;->SEMICOLUMN:C

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v12

    .line 143
    :cond_0
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "DeviceID"

    invoke-interface {v10, v1}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v1

    invoke-interface {v10, v1}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    sget-char v1, Lcom/belkin/rules/utils/RulesConstants;->COMMA:C

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v12

    .line 144
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    new-instance v1, Ljava/lang/Integer;

    const-string v2, "StartAction"

    invoke-interface {v10, v2}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v2

    invoke-interface {v10, v2}, Landroid/database/Cursor;->getFloat(I)F

    move-result v2

    float-to-int v2, v2

    invoke-direct {v1, v2}, Ljava/lang/Integer;-><init>(I)V

    invoke-virtual {v1}, Ljava/lang/Integer;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    sget-char v1, Lcom/belkin/rules/utils/RulesConstants;->COMMA:C

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v12

    .line 145
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    new-instance v1, Ljava/lang/Integer;

    const-string v2, "SensorDuration"

    invoke-interface {v10, v2}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v2

    invoke-interface {v10, v2}, Landroid/database/Cursor;->getFloat(I)F

    move-result v2

    float-to-int v2, v2

    invoke-direct {v1, v2}, Ljava/lang/Integer;-><init>(I)V

    invoke-virtual {v1}, Ljava/lang/Integer;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    sget-char v1, Lcom/belkin/rules/utils/RulesConstants;->COMMA:C

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v12

    .line 146
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    new-instance v1, Ljava/lang/Integer;

    const-string v2, "EndAction"

    invoke-interface {v10, v2}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v2

    invoke-interface {v10, v2}, Landroid/database/Cursor;->getFloat(I)F

    move-result v2

    float-to-int v2, v2

    invoke-direct {v1, v2}, Ljava/lang/Integer;-><init>(I)V

    invoke-virtual {v1}, Ljava/lang/Integer;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v12

    .line 147
    invoke-virtual {v11}, Ljava/lang/Integer;->intValue()I

    move-result v0

    add-int/lit8 v0, v0, 0x1

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v11

    .line 148
    invoke-interface {v10}, Landroid/database/Cursor;->moveToNext()Z

    goto/16 :goto_0

    .line 150
    :cond_1
    if-eqz v10, :cond_2

    invoke-interface {v10}, Landroid/database/Cursor;->isClosed()Z

    move-result v0

    if-nez v0, :cond_2

    .line 151
    invoke-interface {v10}, Landroid/database/Cursor;->close()V

    .line 153
    :cond_2
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v11}, Ljava/lang/Integer;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    sget-char v1, Lcom/belkin/rules/utils/RulesConstants;->SEMICOLUMN:C

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "0"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    sget-char v1, Lcom/belkin/rules/utils/RulesConstants;->SEMICOLUMN:C

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "0"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    sget-char v1, Lcom/belkin/rules/utils/RulesConstants;->SEMICOLUMN:C

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v12

    .line 154
    return-object v12
.end method

.method public isDisabled(Ljava/lang/Integer;)Z
    .locals 11
    .param p1, "ruleId"    # Ljava/lang/Integer;

    .prologue
    const/4 v2, 0x1

    const/4 v7, 0x0

    const/4 v5, 0x0

    .line 254
    const/4 v10, 0x0

    .line 256
    .local v10, "result":Z
    const-string v3, "RuleID =?"

    .line 257
    .local v3, "whereClause":Ljava/lang/String;
    new-array v4, v2, [Ljava/lang/String;

    invoke-virtual {p1}, Ljava/lang/Integer;->toString()Ljava/lang/String;

    move-result-object v0

    aput-object v0, v4, v7

    .line 260
    .local v4, "whereArgs":[Ljava/lang/String;
    iget-object v0, p0, Lcom/belkin/rules/db/RulesDb;->db:Landroid/database/sqlite/SQLiteDatabase;

    const-string v1, "RULES"

    new-array v2, v2, [Ljava/lang/String;

    const-string v6, "State"

    aput-object v6, v2, v7

    move-object v6, v5

    move-object v7, v5

    move-object v8, v5

    invoke-virtual/range {v0 .. v8}, Landroid/database/sqlite/SQLiteDatabase;->query(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v9

    .line 262
    .local v9, "cursor":Landroid/database/Cursor;
    invoke-interface {v9}, Landroid/database/Cursor;->moveToFirst()Z

    .line 263
    const-string v0, "State"

    invoke-interface {v9, v0}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v0

    invoke-interface {v9, v0}, Landroid/database/Cursor;->getInt(I)I

    move-result v0

    if-nez v0, :cond_0

    .line 264
    const/4 v10, 0x1

    .line 266
    :cond_0
    if-eqz v9, :cond_1

    invoke-interface {v9}, Landroid/database/Cursor;->isClosed()Z

    move-result v0

    if-nez v0, :cond_1

    .line 267
    invoke-interface {v9}, Landroid/database/Cursor;->close()V

    .line 269
    :cond_1
    return v10
.end method

.method public removeRulesByUDN(Ljava/lang/String;)V
    .locals 13
    .param p1, "udn"    # Ljava/lang/String;

    .prologue
    .line 274
    const-string v12, "DeviceID =?"

    .line 275
    .local v12, "whereClause":Ljava/lang/String;
    const/4 v0, 0x1

    new-array v11, v0, [Ljava/lang/String;

    const/4 v0, 0x0

    aput-object p1, v11, v0

    .line 279
    .local v11, "whereArgs":[Ljava/lang/String;
    iget-object v0, p0, Lcom/belkin/rules/db/RulesDb;->db:Landroid/database/sqlite/SQLiteDatabase;

    const-string v1, "RULEDEVICES"

    invoke-virtual {v0, v1, v12, v11}, Landroid/database/sqlite/SQLiteDatabase;->delete(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)I

    .line 282
    const-string v12, "DeviceID =? OR SensorID =?"

    .line 283
    const/4 v0, 0x2

    new-array v11, v0, [Ljava/lang/String;

    .end local v11    # "whereArgs":[Ljava/lang/String;
    const/4 v0, 0x0

    aput-object p1, v11, v0

    const/4 v0, 0x1

    aput-object p1, v11, v0

    .line 287
    .restart local v11    # "whereArgs":[Ljava/lang/String;
    iget-object v0, p0, Lcom/belkin/rules/db/RulesDb;->db:Landroid/database/sqlite/SQLiteDatabase;

    const-string v1, "DEVICECOMBINATION"

    invoke-virtual {v0, v1, v12, v11}, Landroid/database/sqlite/SQLiteDatabase;->delete(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)I

    .line 289
    iget-object v0, p0, Lcom/belkin/rules/db/RulesDb;->db:Landroid/database/sqlite/SQLiteDatabase;

    const-string v1, "RULEDEVICES"

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/String;

    const/4 v3, 0x0

    const-string v4, "RuleID"

    aput-object v4, v2, v3

    const/4 v3, 0x0

    const/4 v4, 0x0

    const-string v5, "RuleID"

    const/4 v6, 0x0

    const/4 v7, 0x0

    const/4 v8, 0x0

    invoke-virtual/range {v0 .. v8}, Landroid/database/sqlite/SQLiteDatabase;->query(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v10

    .line 290
    .local v10, "cursor":Landroid/database/Cursor;
    const-string v9, ""

    .line 292
    .local v9, "activeRules":Ljava/lang/String;
    invoke-interface {v10}, Landroid/database/Cursor;->moveToFirst()Z

    .line 293
    :goto_0
    invoke-interface {v10}, Landroid/database/Cursor;->isAfterLast()Z

    move-result v0

    if-nez v0, :cond_1

    .line 294
    invoke-virtual {v9}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_0

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    sget-char v1, Lcom/belkin/rules/utils/RulesConstants;->COMMA:C

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    .line 295
    :cond_0
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "RuleID"

    invoke-interface {v10, v1}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v1

    invoke-interface {v10, v1}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    .line 296
    invoke-interface {v10}, Landroid/database/Cursor;->moveToNext()Z

    goto :goto_0

    .line 298
    :cond_1
    if-eqz v10, :cond_2

    invoke-interface {v10}, Landroid/database/Cursor;->isClosed()Z

    move-result v0

    if-nez v0, :cond_2

    .line 299
    invoke-interface {v10}, Landroid/database/Cursor;->close()V

    .line 302
    :cond_2
    const-string v12, "RuleID NOT IN (?)"

    .line 303
    const/4 v0, 0x1

    new-array v11, v0, [Ljava/lang/String;

    .end local v11    # "whereArgs":[Ljava/lang/String;
    const/4 v0, 0x0

    aput-object v9, v11, v0

    .line 307
    .restart local v11    # "whereArgs":[Ljava/lang/String;
    iget-object v0, p0, Lcom/belkin/rules/db/RulesDb;->db:Landroid/database/sqlite/SQLiteDatabase;

    const-string v1, "RULES"

    invoke-virtual {v0, v1, v12, v11}, Landroid/database/sqlite/SQLiteDatabase;->delete(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)I

    .line 310
    const-string v12, "NotifyRuleID NOT IN (?)"

    .line 311
    const/4 v0, 0x1

    new-array v11, v0, [Ljava/lang/String;

    .end local v11    # "whereArgs":[Ljava/lang/String;
    const/4 v0, 0x0

    aput-object v9, v11, v0

    .line 315
    .restart local v11    # "whereArgs":[Ljava/lang/String;
    iget-object v0, p0, Lcom/belkin/rules/db/RulesDb;->db:Landroid/database/sqlite/SQLiteDatabase;

    const-string v1, "RULESNOTIFYMESSAGE"

    invoke-virtual {v0, v1, v12, v11}, Landroid/database/sqlite/SQLiteDatabase;->delete(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)I

    .line 318
    const-string v12, "NotifyRuleID NOT IN (?)"

    .line 319
    const/4 v0, 0x1

    new-array v11, v0, [Ljava/lang/String;

    .end local v11    # "whereArgs":[Ljava/lang/String;
    const/4 v0, 0x0

    aput-object v9, v11, v0

    .line 323
    .restart local v11    # "whereArgs":[Ljava/lang/String;
    iget-object v0, p0, Lcom/belkin/rules/db/RulesDb;->db:Landroid/database/sqlite/SQLiteDatabase;

    const-string v1, "SENSORNOTIFICATION"

    invoke-virtual {v0, v1, v12, v11}, Landroid/database/sqlite/SQLiteDatabase;->delete(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)I

    .line 324
    return-void
.end method
