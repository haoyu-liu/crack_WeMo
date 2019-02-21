.class public Lcom/belkin/wemo/rules/db/RMRulesDBManager;
.super Ljava/lang/Object;
.source "RMRulesDBManager.java"

# interfaces
.implements Lcom/belkin/wemo/rules/db/listener/RMOnRulesUpdatedListener;


# static fields
.field private static final TAG:Ljava/lang/String;

.field private static manager:Lcom/belkin/wemo/rules/db/RMRulesDBManager;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 66
    const-class v0, Lcom/belkin/wemo/rules/db/RMRulesDBManager;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/belkin/wemo/rules/db/RMRulesDBManager;->TAG:Ljava/lang/String;

    return-void
.end method

.method private constructor <init>()V
    .locals 2

    .prologue
    .line 70
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 72
    invoke-static {}, Lcom/belkin/wemo/rules/RMRulesSDK;->instance()Lcom/belkin/wemo/rules/RMRulesSDK;

    move-result-object v0

    .line 73
    .local v0, "sdk":Lcom/belkin/wemo/rules/RMRulesSDK;
    if-eqz v0, :cond_0

    .line 74
    invoke-virtual {v0}, Lcom/belkin/wemo/rules/RMRulesSDK;->getDependencyProvider()Lcom/belkin/wemo/rules/RMIRulesDependencyProvider;

    move-result-object v1

    invoke-interface {v1}, Lcom/belkin/wemo/rules/RMIRulesDependencyProvider;->provideRulesUpdateBroadcast()Lcom/belkin/wemo/rules/db/broadcast/RMIRulesUpdatedBroadcaster;

    move-result-object v1

    invoke-interface {v1, p0}, Lcom/belkin/wemo/rules/db/broadcast/RMIRulesUpdatedBroadcaster;->registerOnRulesUpdatedListener(Lcom/belkin/wemo/rules/db/listener/RMOnRulesUpdatedListener;)V

    .line 75
    const/4 v0, 0x0

    .line 77
    :cond_0
    invoke-virtual {p0}, Lcom/belkin/wemo/rules/db/RMRulesDBManager;->onRulesDBUpdated()V

    .line 78
    return-void
.end method

.method public static declared-synchronized cleanUp()V
    .locals 2

    .prologue
    .line 86
    const-class v1, Lcom/belkin/wemo/rules/db/RMRulesDBManager;

    monitor-enter v1

    :try_start_0
    sget-object v0, Lcom/belkin/wemo/rules/db/RMRulesDBManager;->manager:Lcom/belkin/wemo/rules/db/RMRulesDBManager;

    if-eqz v0, :cond_0

    .line 87
    sget-object v0, Lcom/belkin/wemo/rules/db/RMRulesDBManager;->manager:Lcom/belkin/wemo/rules/db/RMRulesDBManager;

    invoke-direct {v0}, Lcom/belkin/wemo/rules/db/RMRulesDBManager;->closeRulesDBInstance()V

    .line 88
    const/4 v0, 0x0

    sput-object v0, Lcom/belkin/wemo/rules/db/RMRulesDBManager;->manager:Lcom/belkin/wemo/rules/db/RMRulesDBManager;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 90
    :cond_0
    monitor-exit v1

    return-void

    .line 86
    :catchall_0
    move-exception v0

    monitor-exit v1

    throw v0
.end method

.method private closeRulesDBInstance()V
    .locals 1

    .prologue
    .line 55
    invoke-static {}, Lcom/belkin/wemo/rules/db/RMRulesDBHelper;->getInstance()Lcom/belkin/wemo/rules/db/RMRulesDBHelper;

    move-result-object v0

    invoke-virtual {v0}, Lcom/belkin/wemo/rules/db/RMRulesDBHelper;->close()V

    .line 64
    return-void
.end method

.method private varargs delete(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)I
    .locals 5
    .param p1, "tableName"    # Ljava/lang/String;
    .param p2, "whereClause"    # Ljava/lang/String;
    .param p3, "whereArgs"    # [Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/belkin/wemo/rules/operation/db/exception/RuleDBException;
        }
    .end annotation

    .prologue
    .line 525
    const/4 v1, 0x0

    .line 527
    .local v1, "rowsAffected":I
    :try_start_0
    invoke-direct {p0}, Lcom/belkin/wemo/rules/db/RMRulesDBManager;->getRuleDBInstance()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v2

    invoke-virtual {v2, p1, p2, p3}, Landroid/database/sqlite/SQLiteDatabase;->delete(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)I
    :try_end_0
    .catch Landroid/database/sqlite/SQLiteException; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result v1

    .line 531
    invoke-direct {p0}, Lcom/belkin/wemo/rules/db/RMRulesDBManager;->closeRulesDBInstance()V

    .line 534
    sget-object v2, Lcom/belkin/wemo/rules/db/RMRulesDBManager;->TAG:Ljava/lang/String;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "delete(): Table Name: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "; whereClause: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "; WhereArgs: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-static {p3}, Ljava/util/Arrays;->toString([Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "; Number of rows deleted: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->debugLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 535
    return v1

    .line 528
    :catch_0
    move-exception v0

    .line 529
    .local v0, "e":Landroid/database/sqlite/SQLiteException;
    :try_start_1
    new-instance v2, Lcom/belkin/wemo/rules/operation/db/exception/RuleDBException;

    invoke-virtual {v0}, Landroid/database/sqlite/SQLiteException;->getMessage()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Lcom/belkin/wemo/rules/operation/db/exception/RuleDBException;-><init>(Ljava/lang/String;)V

    throw v2
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 531
    .end local v0    # "e":Landroid/database/sqlite/SQLiteException;
    :catchall_0
    move-exception v2

    invoke-direct {p0}, Lcom/belkin/wemo/rules/db/RMRulesDBManager;->closeRulesDBInstance()V

    throw v2
.end method

.method public static final declared-synchronized getInstance()Lcom/belkin/wemo/rules/db/RMRulesDBManager;
    .locals 2

    .prologue
    .line 33
    const-class v1, Lcom/belkin/wemo/rules/db/RMRulesDBManager;

    monitor-enter v1

    :try_start_0
    sget-object v0, Lcom/belkin/wemo/rules/db/RMRulesDBManager;->manager:Lcom/belkin/wemo/rules/db/RMRulesDBManager;

    if-nez v0, :cond_0

    .line 34
    new-instance v0, Lcom/belkin/wemo/rules/db/RMRulesDBManager;

    invoke-direct {v0}, Lcom/belkin/wemo/rules/db/RMRulesDBManager;-><init>()V

    sput-object v0, Lcom/belkin/wemo/rules/db/RMRulesDBManager;->manager:Lcom/belkin/wemo/rules/db/RMRulesDBManager;

    .line 36
    :cond_0
    sget-object v0, Lcom/belkin/wemo/rules/db/RMRulesDBManager;->manager:Lcom/belkin/wemo/rules/db/RMRulesDBManager;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit v1

    return-object v0

    .line 33
    :catchall_0
    move-exception v0

    monitor-exit v1

    throw v0
.end method

.method private getRuleDBInstance()Landroid/database/sqlite/SQLiteDatabase;
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/database/SQLException;
        }
    .end annotation

    .prologue
    .line 46
    :try_start_0
    invoke-static {}, Lcom/belkin/wemo/rules/db/RMRulesDBHelper;->getInstance()Lcom/belkin/wemo/rules/db/RMRulesDBHelper;

    move-result-object v1

    invoke-virtual {v1}, Lcom/belkin/wemo/rules/db/RMRulesDBHelper;->getWritableDatabase()Landroid/database/sqlite/SQLiteDatabase;
    :try_end_0
    .catch Landroid/database/SQLException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v1

    return-object v1

    .line 47
    :catch_0
    move-exception v0

    .line 48
    .local v0, "e":Landroid/database/SQLException;
    sget-object v1, Lcom/belkin/wemo/rules/db/RMRulesDBManager;->TAG:Ljava/lang/String;

    const-string v2, "SQLException while getting writable DB: "

    invoke-static {v1, v2, v0}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Exception;)V

    .line 49
    invoke-static {}, Lcom/belkin/wemo/rules/db/RMRulesDBHelper;->getInstance()Lcom/belkin/wemo/rules/db/RMRulesDBHelper;

    move-result-object v1

    invoke-virtual {v1}, Lcom/belkin/wemo/rules/db/RMRulesDBHelper;->deleteDatabase()V

    .line 50
    throw v0
.end method

.method private readRule(Landroid/database/Cursor;)Lcom/belkin/wemo/rules/db/model/RMTRules;
    .locals 3
    .param p1, "rulesCursor"    # Landroid/database/Cursor;

    .prologue
    .line 245
    new-instance v0, Lcom/belkin/wemo/rules/db/model/RMTRules;

    invoke-direct {v0}, Lcom/belkin/wemo/rules/db/model/RMTRules;-><init>()V

    .line 246
    .local v0, "rules":Lcom/belkin/wemo/rules/db/model/RMTRules;
    sget-object v1, Lcom/belkin/wemo/rules/db/contract/RMRulesContract$Rules;->COLUMNS_LIST:Ljava/util/List;

    const-string v2, "RuleID"

    invoke-interface {v1, v2}, Ljava/util/List;->indexOf(Ljava/lang/Object;)I

    move-result v1

    invoke-interface {p1, v1}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/belkin/wemo/rules/db/model/RMTRules;->setRuleId(Ljava/lang/String;)V

    .line 247
    sget-object v1, Lcom/belkin/wemo/rules/db/contract/RMRulesContract$Rules;->COLUMNS_LIST:Ljava/util/List;

    const-string v2, "Name"

    invoke-interface {v1, v2}, Ljava/util/List;->indexOf(Ljava/lang/Object;)I

    move-result v1

    invoke-interface {p1, v1}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/belkin/wemo/rules/db/model/RMTRules;->setName(Ljava/lang/String;)V

    .line 248
    sget-object v1, Lcom/belkin/wemo/rules/db/contract/RMRulesContract$Rules;->COLUMNS_LIST:Ljava/util/List;

    const-string v2, "State"

    invoke-interface {v1, v2}, Ljava/util/List;->indexOf(Ljava/lang/Object;)I

    move-result v1

    invoke-interface {p1, v1}, Landroid/database/Cursor;->getInt(I)I

    move-result v1

    invoke-virtual {v0, v1}, Lcom/belkin/wemo/rules/db/model/RMTRules;->setState(I)V

    .line 249
    sget-object v1, Lcom/belkin/wemo/rules/db/contract/RMRulesContract$Rules;->COLUMNS_LIST:Ljava/util/List;

    const-string v2, "Type"

    invoke-interface {v1, v2}, Ljava/util/List;->indexOf(Ljava/lang/Object;)I

    move-result v1

    invoke-interface {p1, v1}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/belkin/wemo/rules/db/model/RMTRules;->setType(Ljava/lang/String;)V

    .line 251
    return-object v0
.end method

.method private readRuleDevices(Landroid/database/Cursor;)Lcom/belkin/wemo/rules/db/model/RMTRuleDevices;
    .locals 4
    .param p1, "rulesCursor"    # Landroid/database/Cursor;

    .prologue
    .line 344
    new-instance v0, Lcom/belkin/wemo/rules/db/model/RMTRuleDevices;

    invoke-direct {v0}, Lcom/belkin/wemo/rules/db/model/RMTRuleDevices;-><init>()V

    .line 346
    .local v0, "ruleDevices":Lcom/belkin/wemo/rules/db/model/RMTRuleDevices;
    sget-object v1, Lcom/belkin/wemo/rules/db/contract/RMRulesContract$RuleDevices;->COLUMNS_LIST:Ljava/util/List;

    const-string v2, "RuleID"

    invoke-interface {v1, v2}, Ljava/util/List;->indexOf(Ljava/lang/Object;)I

    move-result v1

    invoke-interface {p1, v1}, Landroid/database/Cursor;->getInt(I)I

    move-result v1

    invoke-virtual {v0, v1}, Lcom/belkin/wemo/rules/db/model/RMTRuleDevices;->setRuleID(I)V

    .line 347
    sget-object v1, Lcom/belkin/wemo/rules/db/contract/RMRulesContract$RuleDevices;->COLUMNS_LIST:Ljava/util/List;

    const-string v2, "DeviceID"

    invoke-interface {v1, v2}, Ljava/util/List;->indexOf(Ljava/lang/Object;)I

    move-result v1

    invoke-interface {p1, v1}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/belkin/wemo/rules/db/model/RMTRuleDevices;->setDeviceID(Ljava/lang/String;)V

    .line 348
    sget-object v1, Lcom/belkin/wemo/rules/db/contract/RMRulesContract$RuleDevices;->COLUMNS_LIST:Ljava/util/List;

    const-string v2, "GroupID"

    invoke-interface {v1, v2}, Ljava/util/List;->indexOf(Ljava/lang/Object;)I

    move-result v1

    invoke-interface {p1, v1}, Landroid/database/Cursor;->getInt(I)I

    move-result v1

    invoke-virtual {v0, v1}, Lcom/belkin/wemo/rules/db/model/RMTRuleDevices;->setGroupID(I)V

    .line 349
    sget-object v1, Lcom/belkin/wemo/rules/db/contract/RMRulesContract$RuleDevices;->COLUMNS_LIST:Ljava/util/List;

    const-string v2, "DayID"

    invoke-interface {v1, v2}, Ljava/util/List;->indexOf(Ljava/lang/Object;)I

    move-result v1

    invoke-interface {p1, v1}, Landroid/database/Cursor;->getInt(I)I

    move-result v1

    invoke-virtual {v0, v1}, Lcom/belkin/wemo/rules/db/model/RMTRuleDevices;->setDayID(I)V

    .line 350
    sget-object v1, Lcom/belkin/wemo/rules/db/contract/RMRulesContract$RuleDevices;->COLUMNS_LIST:Ljava/util/List;

    const-string v2, "StartTime"

    invoke-interface {v1, v2}, Ljava/util/List;->indexOf(Ljava/lang/Object;)I

    move-result v1

    invoke-interface {p1, v1}, Landroid/database/Cursor;->getInt(I)I

    move-result v1

    invoke-virtual {v0, v1}, Lcom/belkin/wemo/rules/db/model/RMTRuleDevices;->setStartTime(I)V

    .line 351
    sget-object v1, Lcom/belkin/wemo/rules/db/contract/RMRulesContract$RuleDevices;->COLUMNS_LIST:Ljava/util/List;

    const-string v2, "RuleDuration"

    invoke-interface {v1, v2}, Ljava/util/List;->indexOf(Ljava/lang/Object;)I

    move-result v1

    invoke-interface {p1, v1}, Landroid/database/Cursor;->getInt(I)I

    move-result v1

    invoke-virtual {v0, v1}, Lcom/belkin/wemo/rules/db/model/RMTRuleDevices;->setRuleDuration(I)V

    .line 352
    sget-object v1, Lcom/belkin/wemo/rules/db/contract/RMRulesContract$RuleDevices;->COLUMNS_LIST:Ljava/util/List;

    const-string v2, "StartAction"

    invoke-interface {v1, v2}, Ljava/util/List;->indexOf(Ljava/lang/Object;)I

    move-result v1

    invoke-interface {p1, v1}, Landroid/database/Cursor;->getFloat(I)F

    move-result v1

    invoke-virtual {v0, v1}, Lcom/belkin/wemo/rules/db/model/RMTRuleDevices;->setStartAction(F)V

    .line 353
    sget-object v1, Lcom/belkin/wemo/rules/db/contract/RMRulesContract$RuleDevices;->COLUMNS_LIST:Ljava/util/List;

    const-string v2, "EndAction"

    invoke-interface {v1, v2}, Ljava/util/List;->indexOf(Ljava/lang/Object;)I

    move-result v1

    invoke-interface {p1, v1}, Landroid/database/Cursor;->getFloat(I)F

    move-result v1

    invoke-virtual {v0, v1}, Lcom/belkin/wemo/rules/db/model/RMTRuleDevices;->setEndAction(F)V

    .line 354
    sget-object v1, Lcom/belkin/wemo/rules/db/contract/RMRulesContract$RuleDevices;->COLUMNS_LIST:Ljava/util/List;

    const-string v2, "SensorDuration"

    invoke-interface {v1, v2}, Ljava/util/List;->indexOf(Ljava/lang/Object;)I

    move-result v1

    invoke-interface {p1, v1}, Landroid/database/Cursor;->getInt(I)I

    move-result v1

    invoke-virtual {v0, v1}, Lcom/belkin/wemo/rules/db/model/RMTRuleDevices;->setSensorDuration(I)V

    .line 355
    sget-object v1, Lcom/belkin/wemo/rules/db/contract/RMRulesContract$RuleDevices;->COLUMNS_LIST:Ljava/util/List;

    const-string v2, "Type"

    invoke-interface {v1, v2}, Ljava/util/List;->indexOf(Ljava/lang/Object;)I

    move-result v1

    invoke-interface {p1, v1}, Landroid/database/Cursor;->getInt(I)I

    move-result v1

    invoke-virtual {v0, v1}, Lcom/belkin/wemo/rules/db/model/RMTRuleDevices;->setType(I)V

    .line 356
    sget-object v1, Lcom/belkin/wemo/rules/db/contract/RMRulesContract$RuleDevices;->COLUMNS_LIST:Ljava/util/List;

    const-string v2, "Value"

    invoke-interface {v1, v2}, Ljava/util/List;->indexOf(Ljava/lang/Object;)I

    move-result v1

    invoke-interface {p1, v1}, Landroid/database/Cursor;->getInt(I)I

    move-result v1

    invoke-virtual {v0, v1}, Lcom/belkin/wemo/rules/db/model/RMTRuleDevices;->setValue(I)V

    .line 357
    sget-object v1, Lcom/belkin/wemo/rules/db/contract/RMRulesContract$RuleDevices;->COLUMNS_LIST:Ljava/util/List;

    const-string v2, "Level"

    invoke-interface {v1, v2}, Ljava/util/List;->indexOf(Ljava/lang/Object;)I

    move-result v1

    invoke-interface {p1, v1}, Landroid/database/Cursor;->getInt(I)I

    move-result v1

    invoke-virtual {v0, v1}, Lcom/belkin/wemo/rules/db/model/RMTRuleDevices;->setLevel(I)V

    .line 358
    sget-object v1, Lcom/belkin/wemo/rules/db/contract/RMRulesContract$RuleDevices;->COLUMNS_LIST:Ljava/util/List;

    const-string v2, "StartTime"

    invoke-interface {v1, v2}, Ljava/util/List;->indexOf(Ljava/lang/Object;)I

    move-result v1

    invoke-interface {p1, v1}, Landroid/database/Cursor;->getInt(I)I

    move-result v1

    invoke-virtual {v0, v1}, Lcom/belkin/wemo/rules/db/model/RMTRuleDevices;->setStartTime(I)V

    .line 359
    sget-object v1, Lcom/belkin/wemo/rules/db/contract/RMRulesContract$RuleDevices;->COLUMNS_LIST:Ljava/util/List;

    const-string v2, "ZBCapabilityStart"

    invoke-interface {v1, v2}, Ljava/util/List;->indexOf(Ljava/lang/Object;)I

    move-result v1

    invoke-interface {p1, v1}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/belkin/wemo/rules/db/model/RMTRuleDevices;->setZBCapabilityStart(Ljava/lang/String;)V

    .line 360
    sget-object v1, Lcom/belkin/wemo/rules/db/contract/RMRulesContract$RuleDevices;->COLUMNS_LIST:Ljava/util/List;

    const-string v2, "ZBCapabilityEnd"

    invoke-interface {v1, v2}, Ljava/util/List;->indexOf(Ljava/lang/Object;)I

    move-result v1

    invoke-interface {p1, v1}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/belkin/wemo/rules/db/model/RMTRuleDevices;->setZBCapabilityEnd(Ljava/lang/String;)V

    .line 361
    sget-object v1, Lcom/belkin/wemo/rules/db/contract/RMRulesContract$RuleDevices;->COLUMNS_LIST:Ljava/util/List;

    const-string v2, "OnModeOffset"

    invoke-interface {v1, v2}, Ljava/util/List;->indexOf(Ljava/lang/Object;)I

    move-result v1

    invoke-interface {p1, v1}, Landroid/database/Cursor;->getInt(I)I

    move-result v1

    invoke-virtual {v0, v1}, Lcom/belkin/wemo/rules/db/model/RMTRuleDevices;->setOnModeOffset(I)V

    .line 362
    sget-object v1, Lcom/belkin/wemo/rules/db/contract/RMRulesContract$RuleDevices;->COLUMNS_LIST:Ljava/util/List;

    const-string v2, "CountdownTime"

    invoke-interface {v1, v2}, Ljava/util/List;->indexOf(Ljava/lang/Object;)I

    move-result v1

    invoke-interface {p1, v1}, Landroid/database/Cursor;->getInt(I)I

    move-result v1

    invoke-virtual {v0, v1}, Lcom/belkin/wemo/rules/db/model/RMTRuleDevices;->setCountdownTime(I)V

    .line 363
    sget-object v1, Lcom/belkin/wemo/rules/db/contract/RMRulesContract$RuleDevices;->COLUMNS_LIST:Ljava/util/List;

    const-string v2, "EndTime"

    invoke-interface {v1, v2}, Ljava/util/List;->indexOf(Ljava/lang/Object;)I

    move-result v1

    invoke-interface {p1, v1}, Landroid/database/Cursor;->getInt(I)I

    move-result v1

    invoke-virtual {v0, v1}, Lcom/belkin/wemo/rules/db/model/RMTRuleDevices;->setEndTime(I)V

    .line 366
    sget-object v1, Lcom/belkin/wemo/rules/db/RMRulesDBManager;->TAG:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Store Rules: READING entry from RULEDEVICES TABLE: CountDown Time = "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v0}, Lcom/belkin/wemo/rules/db/model/RMTRuleDevices;->getCountdownTime()I

    move-result v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "; DayID = "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v0}, Lcom/belkin/wemo/rules/db/model/RMTRuleDevices;->getDayID()I

    move-result v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "; DeviceId = "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v0}, Lcom/belkin/wemo/rules/db/model/RMTRuleDevices;->getDeviceID()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "; EndAction = "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v0}, Lcom/belkin/wemo/rules/db/model/RMTRuleDevices;->getEndAction()F

    move-result v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "; EndTime = "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v0}, Lcom/belkin/wemo/rules/db/model/RMTRuleDevices;->getEndTime()I

    move-result v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "; GroupID = "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v0}, Lcom/belkin/wemo/rules/db/model/RMTRuleDevices;->getGroupID()I

    move-result v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "; Level = "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v0}, Lcom/belkin/wemo/rules/db/model/RMTRuleDevices;->getLevel()I

    move-result v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "; OffModeOffset = "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v0}, Lcom/belkin/wemo/rules/db/model/RMTRuleDevices;->getOffModeOffset()I

    move-result v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "; OnModeOffset = "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v0}, Lcom/belkin/wemo/rules/db/model/RMTRuleDevices;->getOnModeOffset()I

    move-result v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "; RuleDuration = "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v0}, Lcom/belkin/wemo/rules/db/model/RMTRuleDevices;->getRuleDuration()I

    move-result v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "; RuleID = "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v0}, Lcom/belkin/wemo/rules/db/model/RMTRuleDevices;->getRuleID()I

    move-result v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "; SensorDuration = "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v0}, Lcom/belkin/wemo/rules/db/model/RMTRuleDevices;->getSensorDuration()I

    move-result v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "; StartAction = "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v0}, Lcom/belkin/wemo/rules/db/model/RMTRuleDevices;->getStartAction()F

    move-result v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "; StartTime = "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v0}, Lcom/belkin/wemo/rules/db/model/RMTRuleDevices;->getStartTime()I

    move-result v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "; Type = "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v0}, Lcom/belkin/wemo/rules/db/model/RMTRuleDevices;->getType()I

    move-result v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "; Level = "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v0}, Lcom/belkin/wemo/rules/db/model/RMTRuleDevices;->getValue()I

    move-result v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "; ZbCapabilityEnd = "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v0}, Lcom/belkin/wemo/rules/db/model/RMTRuleDevices;->getZBCapabilityEnd()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "; ZbCapabilityStart = "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v0}, Lcom/belkin/wemo/rules/db/model/RMTRuleDevices;->getZBCapabilityStart()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->debugLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 385
    return-object v0
.end method

.method private readSensorNotification(Landroid/database/Cursor;)Lcom/belkin/wemo/rules/db/model/RMTSensorNotification;
    .locals 3
    .param p1, "sensorNotificationCursor"    # Landroid/database/Cursor;

    .prologue
    .line 143
    new-instance v0, Lcom/belkin/wemo/rules/db/model/RMTSensorNotification;

    invoke-direct {v0}, Lcom/belkin/wemo/rules/db/model/RMTSensorNotification;-><init>()V

    .line 144
    .local v0, "sensorNotification":Lcom/belkin/wemo/rules/db/model/RMTSensorNotification;
    sget-object v1, Lcom/belkin/wemo/rules/db/contract/RMRulesContract$SensorNotification;->COLUMNS_LIST:Ljava/util/List;

    const-string v2, "RuleID"

    invoke-interface {v1, v2}, Ljava/util/List;->indexOf(Ljava/lang/Object;)I

    move-result v1

    invoke-interface {p1, v1}, Landroid/database/Cursor;->getInt(I)I

    move-result v1

    invoke-virtual {v0, v1}, Lcom/belkin/wemo/rules/db/model/RMTSensorNotification;->setRuleId(I)V

    .line 145
    sget-object v1, Lcom/belkin/wemo/rules/db/contract/RMRulesContract$SensorNotification;->COLUMNS_LIST:Ljava/util/List;

    const-string v2, "NotificationMessage"

    invoke-interface {v1, v2}, Ljava/util/List;->indexOf(Ljava/lang/Object;)I

    move-result v1

    invoke-interface {p1, v1}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/belkin/wemo/rules/db/model/RMTSensorNotification;->setNotificationMessage(Ljava/lang/String;)V

    .line 146
    sget-object v1, Lcom/belkin/wemo/rules/db/contract/RMRulesContract$SensorNotification;->COLUMNS_LIST:Ljava/util/List;

    const-string v2, "NotificationDuration"

    invoke-interface {v1, v2}, Ljava/util/List;->indexOf(Ljava/lang/Object;)I

    move-result v1

    invoke-interface {p1, v1}, Landroid/database/Cursor;->getInt(I)I

    move-result v1

    invoke-virtual {v0, v1}, Lcom/belkin/wemo/rules/db/model/RMTSensorNotification;->setNotificationDuration(I)V

    .line 147
    sget-object v1, Lcom/belkin/wemo/rules/db/contract/RMRulesContract$SensorNotification;->COLUMNS_LIST:Ljava/util/List;

    const-string v2, "NotifyRuleID"

    invoke-interface {v1, v2}, Ljava/util/List;->indexOf(Ljava/lang/Object;)I

    move-result v1

    invoke-interface {p1, v1}, Landroid/database/Cursor;->getInt(I)I

    move-result v1

    invoke-virtual {v0, v1}, Lcom/belkin/wemo/rules/db/model/RMTSensorNotification;->setNotifyRuleID(I)V

    .line 149
    return-object v0
.end method

.method private readTargetDevices(Landroid/database/Cursor;)Lcom/belkin/wemo/rules/db/model/RMTTargetDevices;
    .locals 3
    .param p1, "targetDevicesCursor"    # Landroid/database/Cursor;

    .prologue
    .line 235
    new-instance v0, Lcom/belkin/wemo/rules/db/model/RMTTargetDevices;

    invoke-direct {v0}, Lcom/belkin/wemo/rules/db/model/RMTTargetDevices;-><init>()V

    .line 236
    .local v0, "targetDevices":Lcom/belkin/wemo/rules/db/model/RMTTargetDevices;
    sget-object v1, Lcom/belkin/wemo/rules/db/contract/RMRulesContract$TargetDevices;->COLUMNS_LIST:Ljava/util/List;

    const-string v2, "RuleID"

    invoke-interface {v1, v2}, Ljava/util/List;->indexOf(Ljava/lang/Object;)I

    move-result v1

    invoke-interface {p1, v1}, Landroid/database/Cursor;->getInt(I)I

    move-result v1

    invoke-virtual {v0, v1}, Lcom/belkin/wemo/rules/db/model/RMTTargetDevices;->setRuleId(I)V

    .line 237
    sget-object v1, Lcom/belkin/wemo/rules/db/contract/RMRulesContract$TargetDevices;->COLUMNS_LIST:Ljava/util/List;

    const-string v2, "DeviceID"

    invoke-interface {v1, v2}, Ljava/util/List;->indexOf(Ljava/lang/Object;)I

    move-result v1

    invoke-interface {p1, v1}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/belkin/wemo/rules/db/model/RMTTargetDevices;->setDeviceID(Ljava/lang/String;)V

    .line 238
    sget-object v1, Lcom/belkin/wemo/rules/db/contract/RMRulesContract$TargetDevices;->COLUMNS_LIST:Ljava/util/List;

    const-string v2, "DeviceIndex"

    invoke-interface {v1, v2}, Ljava/util/List;->indexOf(Ljava/lang/Object;)I

    move-result v1

    invoke-interface {p1, v1}, Landroid/database/Cursor;->getInt(I)I

    move-result v1

    invoke-virtual {v0, v1}, Lcom/belkin/wemo/rules/db/model/RMTTargetDevices;->setDeviceIndex(I)V

    .line 240
    return-object v0
.end method


# virtual methods
.method protected clone()Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/CloneNotSupportedException;
        }
    .end annotation

    .prologue
    .line 82
    new-instance v0, Ljava/lang/CloneNotSupportedException;

    invoke-direct {v0}, Ljava/lang/CloneNotSupportedException;-><init>()V

    throw v0
.end method

.method public declared-synchronized deleteDeviceCombinationEnrtiesByUDN(Ljava/lang/String;)I
    .locals 4
    .param p1, "udn"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/belkin/wemo/rules/operation/db/exception/RuleDBException;
        }
    .end annotation

    .prologue
    .line 497
    monitor-enter p0

    :try_start_0
    const-string v0, "DEVICECOMBINATION"

    const-string v1, "DeviceID=?"

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/String;

    const/4 v3, 0x0

    aput-object p1, v2, v3

    invoke-direct {p0, v0, v1, v2}, Lcom/belkin/wemo/rules/db/RMRulesDBManager;->delete(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result v0

    monitor-exit p0

    return v0

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized deleteRowRuleDevices(I)I
    .locals 5
    .param p1, "ruleId"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/belkin/wemo/rules/operation/db/exception/RuleDBException;
        }
    .end annotation

    .prologue
    .line 513
    monitor-enter p0

    :try_start_0
    const-string v0, "RULEDEVICES"

    const-string v1, "RuleID=?"

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/String;

    const/4 v3, 0x0

    invoke-static {p1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v4

    aput-object v4, v2, v3

    invoke-direct {p0, v0, v1, v2}, Lcom/belkin/wemo/rules/db/RMRulesDBManager;->delete(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result v0

    monitor-exit p0

    return v0

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized deleteRowRules(I)I
    .locals 5
    .param p1, "ruleId"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/belkin/wemo/rules/operation/db/exception/RuleDBException;
        }
    .end annotation

    .prologue
    .line 517
    monitor-enter p0

    :try_start_0
    const-string v0, "RULES"

    const-string v1, "RuleID=?"

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/String;

    const/4 v3, 0x0

    invoke-static {p1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v4

    aput-object v4, v2, v3

    invoke-direct {p0, v0, v1, v2}, Lcom/belkin/wemo/rules/db/RMRulesDBManager;->delete(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result v0

    monitor-exit p0

    return v0

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized deleteRowTargetDevices(I)I
    .locals 5
    .param p1, "ruleId"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/belkin/wemo/rules/operation/db/exception/RuleDBException;
        }
    .end annotation

    .prologue
    .line 521
    monitor-enter p0

    :try_start_0
    const-string v0, "TARGETDEVICES"

    const-string v1, "RuleID=?"

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/String;

    const/4 v3, 0x0

    invoke-static {p1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v4

    aput-object v4, v2, v3

    invoke-direct {p0, v0, v1, v2}, Lcom/belkin/wemo/rules/db/RMRulesDBManager;->delete(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result v0

    monitor-exit p0

    return v0

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized deleteRuleDevicesEnrtiesByUDN(Ljava/lang/String;I)I
    .locals 5
    .param p1, "udn"    # Ljava/lang/String;
    .param p2, "ruleId"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/belkin/wemo/rules/operation/db/exception/RuleDBException;
        }
    .end annotation

    .prologue
    .line 505
    monitor-enter p0

    :try_start_0
    const-string v0, "RULEDEVICES"

    const-string v1, "DeviceID=? AND RuleID=?"

    const/4 v2, 0x2

    new-array v2, v2, [Ljava/lang/String;

    const/4 v3, 0x0

    aput-object p1, v2, v3

    const/4 v3, 0x1

    invoke-static {p2}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v4

    aput-object v4, v2, v3

    invoke-direct {p0, v0, v1, v2}, Lcom/belkin/wemo/rules/db/RMRulesDBManager;->delete(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result v0

    monitor-exit p0

    return v0

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized deleteRulesEnrtiesByUDN(Ljava/lang/String;)I
    .locals 4
    .param p1, "udn"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/belkin/wemo/rules/operation/db/exception/RuleDBException;
        }
    .end annotation

    .prologue
    .line 509
    monitor-enter p0

    :try_start_0
    const-string v0, "RULES"

    const-string v1, "DeviceID=?"

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/String;

    const/4 v3, 0x0

    aput-object p1, v2, v3

    invoke-direct {p0, v0, v1, v2}, Lcom/belkin/wemo/rules/db/RMRulesDBManager;->delete(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result v0

    monitor-exit p0

    return v0

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized deleteRulesNotifyMessageEnrties(I)I
    .locals 5
    .param p1, "ruleId"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/belkin/wemo/rules/operation/db/exception/RuleDBException;
        }
    .end annotation

    .prologue
    .line 493
    monitor-enter p0

    :try_start_0
    const-string v0, "RULESNOTIFYMESSAGE"

    const-string v1, "NotifyRuleID=?"

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/String;

    const/4 v3, 0x0

    invoke-static {p1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v4

    aput-object v4, v2, v3

    invoke-direct {p0, v0, v1, v2}, Lcom/belkin/wemo/rules/db/RMRulesDBManager;->delete(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result v0

    monitor-exit p0

    return v0

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized deleteSensorNotificationEnrties(I)I
    .locals 5
    .param p1, "ruleId"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/belkin/wemo/rules/operation/db/exception/RuleDBException;
        }
    .end annotation

    .prologue
    .line 489
    monitor-enter p0

    :try_start_0
    const-string v0, "SENSORNOTIFICATION"

    const-string v1, "NotifyRuleID=?"

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/String;

    const/4 v3, 0x0

    invoke-static {p1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v4

    aput-object v4, v2, v3

    invoke-direct {p0, v0, v1, v2}, Lcom/belkin/wemo/rules/db/RMRulesDBManager;->delete(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result v0

    monitor-exit p0

    return v0

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized deleteTargetDevicesEnrtiesByUDN(Ljava/lang/String;)I
    .locals 4
    .param p1, "udn"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/belkin/wemo/rules/operation/db/exception/RuleDBException;
        }
    .end annotation

    .prologue
    .line 501
    monitor-enter p0

    :try_start_0
    const-string v0, "TARGETDEVICES"

    const-string v1, "DeviceID=?"

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/String;

    const/4 v3, 0x0

    aput-object p1, v2, v3

    invoke-direct {p0, v0, v1, v2}, Lcom/belkin/wemo/rules/db/RMRulesDBManager;->delete(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result v0

    monitor-exit p0

    return v0

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public executeVacuum()V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/belkin/wemo/rules/operation/db/exception/RuleDBException;
        }
    .end annotation

    .prologue
    .line 613
    sget-object v1, Lcom/belkin/wemo/rules/db/RMRulesDBManager;->TAG:Ljava/lang/String;

    const-string v2, "Executing VACUUM on RULES DB."

    invoke-static {v1, v2}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->debugLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 615
    :try_start_0
    invoke-static {}, Lcom/belkin/wemo/rules/db/RMRulesDBHelper;->getInstance()Lcom/belkin/wemo/rules/db/RMRulesDBHelper;

    move-result-object v1

    invoke-virtual {v1}, Lcom/belkin/wemo/rules/db/RMRulesDBHelper;->closeRightAway()V

    .line 616
    invoke-static {}, Lcom/belkin/wemo/rules/db/RMRulesDBHelper;->getInstance()Lcom/belkin/wemo/rules/db/RMRulesDBHelper;

    move-result-object v1

    invoke-virtual {v1}, Lcom/belkin/wemo/rules/db/RMRulesDBHelper;->getWritableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v1

    const-string v2, "VACUUM"

    invoke-virtual {v1, v2}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V
    :try_end_0
    .catch Landroid/database/SQLException; {:try_start_0 .. :try_end_0} :catch_0

    .line 621
    return-void

    .line 617
    :catch_0
    move-exception v0

    .line 618
    .local v0, "e":Landroid/database/SQLException;
    sget-object v1, Lcom/belkin/wemo/rules/db/RMRulesDBManager;->TAG:Ljava/lang/String;

    const-string v2, "SQL Exception while executing VACUUM on rules DB: "

    invoke-static {v1, v2, v0}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Exception;)V

    .line 619
    new-instance v1, Lcom/belkin/wemo/rules/operation/db/exception/RuleDBException;

    invoke-virtual {v0}, Landroid/database/SQLException;->getMessage()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Lcom/belkin/wemo/rules/operation/db/exception/RuleDBException;-><init>(Ljava/lang/String;)V

    throw v1
.end method

.method public declared-synchronized getDBRuleType(I)Ljava/lang/String;
    .locals 12
    .param p1, "ruleId"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/belkin/wemo/rules/operation/db/exception/RuleDBException;
        }
    .end annotation

    .prologue
    .line 286
    monitor-enter p0

    const/4 v11, 0x0

    .line 288
    .local v11, "ruleType":Ljava/lang/String;
    :try_start_0
    invoke-direct {p0}, Lcom/belkin/wemo/rules/db/RMRulesDBManager;->getRuleDBInstance()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v0

    const-string v1, "RULES"

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/String;

    const/4 v3, 0x0

    const-string v4, "Type"

    aput-object v4, v2, v3

    const-string v3, "RuleID=?"

    const/4 v4, 0x1

    new-array v4, v4, [Ljava/lang/String;

    const/4 v5, 0x0

    invoke-static {p1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v6

    aput-object v6, v4, v5

    const/4 v5, 0x0

    const/4 v6, 0x0

    const/4 v7, 0x0

    const/4 v8, 0x0

    invoke-virtual/range {v0 .. v8}, Landroid/database/sqlite/SQLiteDatabase;->query(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v9

    .line 289
    .local v9, "cursor":Landroid/database/Cursor;
    invoke-interface {v9}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 291
    :cond_0
    sget-object v0, Lcom/belkin/wemo/rules/db/contract/RMRulesContract$Rules;->COLUMNS_LIST:Ljava/util/List;

    const-string v1, "RuleID"

    invoke-interface {v0, v1}, Ljava/util/List;->indexOf(Ljava/lang/Object;)I

    move-result v0

    invoke-interface {v9, v0}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v11

    .line 292
    invoke-interface {v9}, Landroid/database/Cursor;->moveToNext()Z

    move-result v0

    if-nez v0, :cond_0

    .line 294
    :cond_1
    invoke-interface {v9}, Landroid/database/Cursor;->close()V

    .line 295
    invoke-direct {p0}, Lcom/belkin/wemo/rules/db/RMRulesDBManager;->closeRulesDBInstance()V
    :try_end_0
    .catch Landroid/database/SQLException; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 300
    monitor-exit p0

    return-object v11

    .line 296
    .end local v9    # "cursor":Landroid/database/Cursor;
    :catch_0
    move-exception v10

    .line 297
    .local v10, "e":Landroid/database/SQLException;
    :try_start_1
    new-instance v0, Lcom/belkin/wemo/rules/operation/db/exception/RuleDBException;

    invoke-virtual {v10}, Landroid/database/SQLException;->getMessage()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/belkin/wemo/rules/operation/db/exception/RuleDBException;-><init>(Ljava/lang/String;)V

    throw v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 286
    .end local v10    # "e":Landroid/database/SQLException;
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized getRuleDevices(I)Ljava/util/List;
    .locals 11
    .param p1, "ruleId"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)",
            "Ljava/util/List",
            "<",
            "Lcom/belkin/wemo/rules/db/model/RMTRuleDevices;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/belkin/wemo/rules/operation/db/exception/RuleDBException;
        }
    .end annotation

    .prologue
    .line 323
    monitor-enter p0

    :try_start_0
    new-instance v8, Ljava/util/ArrayList;

    invoke-direct {v8}, Ljava/util/ArrayList;-><init>()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 326
    .local v8, "dbRuleDevicesList":Ljava/util/List;, "Ljava/util/List<Lcom/belkin/wemo/rules/db/model/RMTRuleDevices;>;"
    :try_start_1
    invoke-direct {p0}, Lcom/belkin/wemo/rules/db/RMRulesDBManager;->getRuleDBInstance()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v0

    const-string v1, "RULEDEVICES"

    sget-object v2, Lcom/belkin/wemo/rules/db/contract/RMRulesContract$RuleDevices;->COLUMNS:[Ljava/lang/String;

    const-string v3, "RuleID=?"

    const/4 v4, 0x1

    new-array v4, v4, [Ljava/lang/String;

    const/4 v5, 0x0

    invoke-static {p1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v6

    aput-object v6, v4, v5

    const/4 v5, 0x0

    const/4 v6, 0x0

    const-string v7, "DeviceID,DayID"

    invoke-virtual/range {v0 .. v7}, Landroid/database/sqlite/SQLiteDatabase;->query(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v10

    .line 330
    .local v10, "rulesCursor":Landroid/database/Cursor;
    invoke-interface {v10}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 332
    :cond_0
    invoke-direct {p0, v10}, Lcom/belkin/wemo/rules/db/RMRulesDBManager;->readRuleDevices(Landroid/database/Cursor;)Lcom/belkin/wemo/rules/db/model/RMTRuleDevices;

    move-result-object v0

    invoke-interface {v8, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 333
    invoke-interface {v10}, Landroid/database/Cursor;->moveToNext()Z

    move-result v0

    if-nez v0, :cond_0

    .line 335
    :cond_1
    invoke-interface {v10}, Landroid/database/Cursor;->close()V

    .line 336
    invoke-direct {p0}, Lcom/belkin/wemo/rules/db/RMRulesDBManager;->closeRulesDBInstance()V
    :try_end_1
    .catch Landroid/database/SQLException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 340
    monitor-exit p0

    return-object v8

    .line 337
    .end local v10    # "rulesCursor":Landroid/database/Cursor;
    :catch_0
    move-exception v9

    .line 338
    .local v9, "e":Landroid/database/SQLException;
    :try_start_2
    new-instance v0, Lcom/belkin/wemo/rules/operation/db/exception/RuleDBException;

    invoke-virtual {v9}, Landroid/database/SQLException;->getMessage()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/belkin/wemo/rules/operation/db/exception/RuleDBException;-><init>(Ljava/lang/String;)V

    throw v0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 323
    .end local v8    # "dbRuleDevicesList":Ljava/util/List;, "Ljava/util/List<Lcom/belkin/wemo/rules/db/model/RMTRuleDevices;>;"
    .end local v9    # "e":Landroid/database/SQLException;
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized getRuleDevicesCount(I)I
    .locals 14
    .param p1, "ruleId"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/belkin/wemo/rules/operation/db/exception/RuleDBException;
        }
    .end annotation

    .prologue
    .line 304
    monitor-enter p0

    const/4 v11, 0x0

    .line 306
    .local v11, "count":I
    :try_start_0
    invoke-direct {p0}, Lcom/belkin/wemo/rules/db/RMRulesDBManager;->getRuleDBInstance()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v0

    const/4 v1, 0x1

    const-string v2, "RULEDEVICES"

    const/4 v3, 0x1

    new-array v3, v3, [Ljava/lang/String;

    const/4 v4, 0x0

    const-string v5, "DeviceID"

    aput-object v5, v3, v4

    const-string v4, "RuleID=?"

    const/4 v5, 0x1

    new-array v5, v5, [Ljava/lang/String;

    const/4 v6, 0x0

    invoke-static {p1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v7

    aput-object v7, v5, v6

    const/4 v6, 0x0

    const/4 v7, 0x0

    const/4 v8, 0x0

    const/4 v9, 0x0

    const/4 v10, 0x0

    invoke-virtual/range {v0 .. v10}, Landroid/database/sqlite/SQLiteDatabase;->query(ZLjava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Landroid/os/CancellationSignal;)Landroid/database/Cursor;

    move-result-object v12

    .line 307
    .local v12, "cursor":Landroid/database/Cursor;
    invoke-interface {v12}, Landroid/database/Cursor;->getCount()I

    move-result v11

    .line 308
    invoke-interface {v12}, Landroid/database/Cursor;->close()V

    .line 310
    invoke-direct {p0}, Lcom/belkin/wemo/rules/db/RMRulesDBManager;->closeRulesDBInstance()V
    :try_end_0
    .catch Landroid/database/SQLException; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 314
    monitor-exit p0

    return v11

    .line 311
    .end local v12    # "cursor":Landroid/database/Cursor;
    :catch_0
    move-exception v13

    .line 312
    .local v13, "e":Landroid/database/SQLException;
    :try_start_1
    new-instance v0, Lcom/belkin/wemo/rules/operation/db/exception/RuleDBException;

    invoke-virtual {v13}, Landroid/database/SQLException;->getMessage()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/belkin/wemo/rules/operation/db/exception/RuleDBException;-><init>(Ljava/lang/String;)V

    throw v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 304
    .end local v13    # "e":Landroid/database/SQLException;
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized getRuleIDsForDevice(Ljava/lang/String;)Ljava/util/Set;
    .locals 16
    .param p1, "udn"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/Set",
            "<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/belkin/wemo/rules/operation/db/exception/RuleDBException;
        }
    .end annotation

    .prologue
    .line 255
    monitor-enter p0

    :try_start_0
    new-instance v15, Ljava/util/HashSet;

    invoke-direct {v15}, Ljava/util/HashSet;-><init>()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 259
    .local v15, "ruleIDSet":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/Integer;>;"
    :try_start_1
    invoke-direct/range {p0 .. p0}, Lcom/belkin/wemo/rules/db/RMRulesDBManager;->getRuleDBInstance()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v1

    const/4 v2, 0x1

    const-string v3, "RULEDEVICES"

    const/4 v4, 0x1

    new-array v4, v4, [Ljava/lang/String;

    const/4 v5, 0x0

    const-string v6, "RuleID"

    aput-object v6, v4, v5

    const-string v5, "DeviceID=?"

    const/4 v6, 0x1

    new-array v6, v6, [Ljava/lang/String;

    const/4 v7, 0x0

    aput-object p1, v6, v7

    const/4 v7, 0x0

    const/4 v8, 0x0

    const/4 v9, 0x0

    const/4 v10, 0x0

    const/4 v11, 0x0

    invoke-virtual/range {v1 .. v11}, Landroid/database/sqlite/SQLiteDatabase;->query(ZLjava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Landroid/os/CancellationSignal;)Landroid/database/Cursor;

    move-result-object v12

    .line 260
    .local v12, "cursor":Landroid/database/Cursor;
    invoke-interface {v12}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v1

    if-eqz v1, :cond_1

    .line 262
    :cond_0
    sget-object v1, Lcom/belkin/wemo/rules/db/contract/RMRulesContract$RuleDevices;->COLUMNS_LIST:Ljava/util/List;

    const-string v2, "RuleID"

    invoke-interface {v1, v2}, Ljava/util/List;->indexOf(Ljava/lang/Object;)I

    move-result v1

    invoke-interface {v12, v1}, Landroid/database/Cursor;->getInt(I)I

    move-result v1

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-interface {v15, v1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 263
    invoke-interface {v12}, Landroid/database/Cursor;->moveToNext()Z

    move-result v1

    if-nez v1, :cond_0

    .line 265
    :cond_1
    invoke-interface {v12}, Landroid/database/Cursor;->close()V

    .line 268
    invoke-direct/range {p0 .. p0}, Lcom/belkin/wemo/rules/db/RMRulesDBManager;->getRuleDBInstance()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v1

    const/4 v2, 0x1

    const-string v3, "TARGETDEVICES"

    const/4 v4, 0x1

    new-array v4, v4, [Ljava/lang/String;

    const/4 v5, 0x0

    const-string v6, "RuleID"

    aput-object v6, v4, v5

    const-string v5, "DeviceID=?"

    const/4 v6, 0x1

    new-array v6, v6, [Ljava/lang/String;

    const/4 v7, 0x0

    aput-object p1, v6, v7

    const/4 v7, 0x0

    const/4 v8, 0x0

    const/4 v9, 0x0

    const/4 v10, 0x0

    const/4 v11, 0x0

    invoke-virtual/range {v1 .. v11}, Landroid/database/sqlite/SQLiteDatabase;->query(ZLjava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Landroid/os/CancellationSignal;)Landroid/database/Cursor;

    move-result-object v13

    .line 269
    .local v13, "cursorLP":Landroid/database/Cursor;
    invoke-interface {v13}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v1

    if-eqz v1, :cond_3

    .line 271
    :cond_2
    sget-object v1, Lcom/belkin/wemo/rules/db/contract/RMRulesContract$TargetDevices;->COLUMNS_LIST:Ljava/util/List;

    const-string v2, "RuleID"

    invoke-interface {v1, v2}, Ljava/util/List;->indexOf(Ljava/lang/Object;)I

    move-result v1

    invoke-interface {v13, v1}, Landroid/database/Cursor;->getInt(I)I

    move-result v1

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-interface {v15, v1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 272
    invoke-interface {v13}, Landroid/database/Cursor;->moveToNext()Z

    move-result v1

    if-nez v1, :cond_2

    .line 274
    :cond_3
    invoke-interface {v13}, Landroid/database/Cursor;->close()V

    .line 276
    invoke-direct/range {p0 .. p0}, Lcom/belkin/wemo/rules/db/RMRulesDBManager;->closeRulesDBInstance()V
    :try_end_1
    .catch Landroid/database/SQLException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 281
    :try_start_2
    sget-object v1, Lcom/belkin/wemo/rules/db/RMRulesDBManager;->TAG:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "getRuleIDsForDevice(): Rule IDs count: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-interface {v15}, Ljava/util/Set;->size()I

    move-result v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "; UDN: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    move-object/from16 v0, p1

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->debugLog(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 282
    monitor-exit p0

    return-object v15

    .line 277
    .end local v12    # "cursor":Landroid/database/Cursor;
    .end local v13    # "cursorLP":Landroid/database/Cursor;
    :catch_0
    move-exception v14

    .line 278
    .local v14, "e":Landroid/database/SQLException;
    :try_start_3
    new-instance v1, Lcom/belkin/wemo/rules/operation/db/exception/RuleDBException;

    invoke-virtual {v14}, Landroid/database/SQLException;->getMessage()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Lcom/belkin/wemo/rules/operation/db/exception/RuleDBException;-><init>(Ljava/lang/String;)V

    throw v1
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 255
    .end local v14    # "e":Landroid/database/SQLException;
    .end local v15    # "ruleIDSet":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/Integer;>;"
    :catchall_0
    move-exception v1

    monitor-exit p0

    throw v1
.end method

.method public declared-synchronized getRules()Ljava/util/List;
    .locals 11
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Lcom/belkin/wemo/rules/db/model/RMTRules;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/belkin/wemo/rules/operation/db/exception/RuleDBException;
        }
    .end annotation

    .prologue
    .line 184
    monitor-enter p0

    :try_start_0
    new-instance v8, Ljava/util/ArrayList;

    invoke-direct {v8}, Ljava/util/ArrayList;-><init>()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 188
    .local v8, "dbRulesList":Ljava/util/List;, "Ljava/util/List<Lcom/belkin/wemo/rules/db/model/RMTRules;>;"
    :try_start_1
    invoke-direct {p0}, Lcom/belkin/wemo/rules/db/RMRulesDBManager;->getRuleDBInstance()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v0

    const-string v1, "RULES"

    sget-object v2, Lcom/belkin/wemo/rules/db/contract/RMRulesContract$Rules;->COLUMNS:[Ljava/lang/String;

    const/4 v3, 0x0

    const/4 v4, 0x0

    const/4 v5, 0x0

    const/4 v6, 0x0

    const-string v7, "RuleID"

    invoke-virtual/range {v0 .. v7}, Landroid/database/sqlite/SQLiteDatabase;->query(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v10

    .line 191
    .local v10, "rulesCursor":Landroid/database/Cursor;
    sget-object v0, Lcom/belkin/wemo/rules/db/RMRulesDBManager;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "getRules() Cursor count: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-interface {v10}, Landroid/database/Cursor;->getCount()I

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->debugLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 193
    invoke-interface {v10}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 195
    :cond_0
    invoke-direct {p0, v10}, Lcom/belkin/wemo/rules/db/RMRulesDBManager;->readRule(Landroid/database/Cursor;)Lcom/belkin/wemo/rules/db/model/RMTRules;

    move-result-object v0

    invoke-interface {v8, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 196
    invoke-interface {v10}, Landroid/database/Cursor;->moveToNext()Z

    move-result v0

    if-nez v0, :cond_0

    .line 198
    :cond_1
    invoke-interface {v10}, Landroid/database/Cursor;->close()V

    .line 199
    invoke-direct {p0}, Lcom/belkin/wemo/rules/db/RMRulesDBManager;->closeRulesDBInstance()V
    :try_end_1
    .catch Landroid/database/SQLException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 204
    monitor-exit p0

    return-object v8

    .line 200
    .end local v10    # "rulesCursor":Landroid/database/Cursor;
    :catch_0
    move-exception v9

    .line 201
    .local v9, "e":Landroid/database/SQLException;
    :try_start_2
    new-instance v0, Lcom/belkin/wemo/rules/operation/db/exception/RuleDBException;

    invoke-virtual {v9}, Landroid/database/SQLException;->getMessage()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/belkin/wemo/rules/operation/db/exception/RuleDBException;-><init>(Ljava/lang/String;)V

    throw v0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 184
    .end local v8    # "dbRulesList":Ljava/util/List;, "Ljava/util/List<Lcom/belkin/wemo/rules/db/model/RMTRules;>;"
    .end local v9    # "e":Landroid/database/SQLException;
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized getRulesEntry(I)Lcom/belkin/wemo/rules/db/model/RMTRules;
    .locals 11
    .param p1, "ruleId"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/belkin/wemo/rules/operation/db/exception/RuleDBException;
        }
    .end annotation

    .prologue
    .line 212
    monitor-enter p0

    const/4 v9, 0x0

    .line 216
    .local v9, "entry":Lcom/belkin/wemo/rules/db/model/RMTRules;
    :try_start_0
    invoke-direct {p0}, Lcom/belkin/wemo/rules/db/RMRulesDBManager;->getRuleDBInstance()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v0

    const-string v1, "RULES"

    sget-object v2, Lcom/belkin/wemo/rules/db/contract/RMRulesContract$Rules;->COLUMNS:[Ljava/lang/String;

    const-string v3, "RuleID=?"

    const/4 v4, 0x1

    new-array v4, v4, [Ljava/lang/String;

    const/4 v5, 0x0

    invoke-static {p1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v6

    aput-object v6, v4, v5

    const/4 v5, 0x0

    const/4 v6, 0x0

    const-string v7, "RuleID"

    invoke-virtual/range {v0 .. v7}, Landroid/database/sqlite/SQLiteDatabase;->query(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v10

    .line 221
    .local v10, "rulesCursor":Landroid/database/Cursor;
    invoke-interface {v10}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 222
    invoke-direct {p0, v10}, Lcom/belkin/wemo/rules/db/RMRulesDBManager;->readRule(Landroid/database/Cursor;)Lcom/belkin/wemo/rules/db/model/RMTRules;

    move-result-object v9

    .line 224
    :cond_0
    invoke-interface {v10}, Landroid/database/Cursor;->close()V

    .line 225
    invoke-direct {p0}, Lcom/belkin/wemo/rules/db/RMRulesDBManager;->closeRulesDBInstance()V
    :try_end_0
    .catch Landroid/database/SQLException; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 231
    monitor-exit p0

    return-object v9

    .line 226
    .end local v10    # "rulesCursor":Landroid/database/Cursor;
    :catch_0
    move-exception v8

    .line 227
    .local v8, "e":Landroid/database/SQLException;
    :try_start_1
    new-instance v0, Lcom/belkin/wemo/rules/operation/db/exception/RuleDBException;

    invoke-virtual {v8}, Landroid/database/SQLException;->getMessage()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/belkin/wemo/rules/operation/db/exception/RuleDBException;-><init>(Ljava/lang/String;)V

    throw v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 212
    .end local v8    # "e":Landroid/database/SQLException;
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized getSensorNotification(I)Ljava/util/List;
    .locals 11
    .param p1, "ruleId"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)",
            "Ljava/util/List",
            "<",
            "Lcom/belkin/wemo/rules/db/model/RMTSensorNotification;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/belkin/wemo/rules/operation/db/exception/RuleDBException;
        }
    .end annotation

    .prologue
    .line 120
    monitor-enter p0

    :try_start_0
    new-instance v10, Ljava/util/ArrayList;

    invoke-direct {v10}, Ljava/util/ArrayList;-><init>()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 124
    .local v10, "sensorNotificationEntryList":Ljava/util/List;, "Ljava/util/List<Lcom/belkin/wemo/rules/db/model/RMTSensorNotification;>;"
    :try_start_1
    invoke-direct {p0}, Lcom/belkin/wemo/rules/db/RMRulesDBManager;->getRuleDBInstance()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v0

    const-string v1, "SENSORNOTIFICATION"

    sget-object v2, Lcom/belkin/wemo/rules/db/contract/RMRulesContract$SensorNotification;->COLUMNS:[Ljava/lang/String;

    const-string v3, "RuleID=?"

    const/4 v4, 0x1

    new-array v4, v4, [Ljava/lang/String;

    const/4 v5, 0x0

    invoke-static {p1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v6

    aput-object v6, v4, v5

    const/4 v5, 0x0

    const/4 v6, 0x0

    const/4 v7, 0x0

    invoke-virtual/range {v0 .. v7}, Landroid/database/sqlite/SQLiteDatabase;->query(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v9

    .line 128
    .local v9, "sensorNotificationEntriesCursor":Landroid/database/Cursor;
    invoke-interface {v9}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 130
    :cond_0
    invoke-direct {p0, v9}, Lcom/belkin/wemo/rules/db/RMRulesDBManager;->readSensorNotification(Landroid/database/Cursor;)Lcom/belkin/wemo/rules/db/model/RMTSensorNotification;

    move-result-object v0

    invoke-interface {v10, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 131
    invoke-interface {v9}, Landroid/database/Cursor;->moveToNext()Z

    move-result v0

    if-nez v0, :cond_0

    .line 133
    :cond_1
    invoke-interface {v9}, Landroid/database/Cursor;->close()V

    .line 134
    invoke-direct {p0}, Lcom/belkin/wemo/rules/db/RMRulesDBManager;->closeRulesDBInstance()V
    :try_end_1
    .catch Landroid/database/SQLException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 139
    monitor-exit p0

    return-object v10

    .line 135
    .end local v9    # "sensorNotificationEntriesCursor":Landroid/database/Cursor;
    :catch_0
    move-exception v8

    .line 136
    .local v8, "e":Landroid/database/SQLException;
    :try_start_2
    new-instance v0, Lcom/belkin/wemo/rules/operation/db/exception/RuleDBException;

    invoke-virtual {v8}, Landroid/database/SQLException;->getMessage()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/belkin/wemo/rules/operation/db/exception/RuleDBException;-><init>(Ljava/lang/String;)V

    throw v0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 120
    .end local v8    # "e":Landroid/database/SQLException;
    .end local v10    # "sensorNotificationEntryList":Ljava/util/List;, "Ljava/util/List<Lcom/belkin/wemo/rules/db/model/RMTSensorNotification;>;"
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized getTargetDevices(I)Ljava/util/List;
    .locals 11
    .param p1, "ruleId"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)",
            "Ljava/util/List",
            "<",
            "Lcom/belkin/wemo/rules/db/model/RMTTargetDevices;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/belkin/wemo/rules/operation/db/exception/RuleDBException;
        }
    .end annotation

    .prologue
    .line 157
    monitor-enter p0

    :try_start_0
    new-instance v10, Ljava/util/ArrayList;

    invoke-direct {v10}, Ljava/util/ArrayList;-><init>()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 161
    .local v10, "targetDevicesList":Ljava/util/List;, "Ljava/util/List<Lcom/belkin/wemo/rules/db/model/RMTTargetDevices;>;"
    :try_start_1
    invoke-direct {p0}, Lcom/belkin/wemo/rules/db/RMRulesDBManager;->getRuleDBInstance()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v0

    const-string v1, "TARGETDEVICES"

    sget-object v2, Lcom/belkin/wemo/rules/db/contract/RMRulesContract$TargetDevices;->COLUMNS:[Ljava/lang/String;

    const-string v3, "RuleID=?"

    const/4 v4, 0x1

    new-array v4, v4, [Ljava/lang/String;

    const/4 v5, 0x0

    invoke-static {p1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v6

    aput-object v6, v4, v5

    const/4 v5, 0x0

    const/4 v6, 0x0

    const/4 v7, 0x0

    invoke-virtual/range {v0 .. v7}, Landroid/database/sqlite/SQLiteDatabase;->query(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v9

    .line 165
    .local v9, "targetDevicesCursor":Landroid/database/Cursor;
    invoke-interface {v9}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 167
    :cond_0
    invoke-direct {p0, v9}, Lcom/belkin/wemo/rules/db/RMRulesDBManager;->readTargetDevices(Landroid/database/Cursor;)Lcom/belkin/wemo/rules/db/model/RMTTargetDevices;

    move-result-object v0

    invoke-interface {v10, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 168
    invoke-interface {v9}, Landroid/database/Cursor;->moveToNext()Z

    move-result v0

    if-nez v0, :cond_0

    .line 170
    :cond_1
    invoke-interface {v9}, Landroid/database/Cursor;->close()V

    .line 171
    invoke-direct {p0}, Lcom/belkin/wemo/rules/db/RMRulesDBManager;->closeRulesDBInstance()V
    :try_end_1
    .catch Landroid/database/SQLException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 176
    monitor-exit p0

    return-object v10

    .line 172
    .end local v9    # "targetDevicesCursor":Landroid/database/Cursor;
    :catch_0
    move-exception v8

    .line 173
    .local v8, "e":Landroid/database/SQLException;
    :try_start_2
    new-instance v0, Lcom/belkin/wemo/rules/operation/db/exception/RuleDBException;

    invoke-virtual {v8}, Landroid/database/SQLException;->getMessage()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/belkin/wemo/rules/operation/db/exception/RuleDBException;-><init>(Ljava/lang/String;)V

    throw v0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 157
    .end local v8    # "e":Landroid/database/SQLException;
    .end local v10    # "targetDevicesList":Ljava/util/List;, "Ljava/util/List<Lcom/belkin/wemo/rules/db/model/RMTTargetDevices;>;"
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized insertRowRuleDevices(Lcom/belkin/wemo/rules/db/model/RMTRuleDevices;)J
    .locals 7
    .param p1, "ruleDevicesRow"    # Lcom/belkin/wemo/rules/db/model/RMTRuleDevices;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/belkin/wemo/rules/operation/db/exception/RuleDBException;
        }
    .end annotation

    .prologue
    .line 412
    monitor-enter p0

    :try_start_0
    new-instance v1, Landroid/content/ContentValues;

    invoke-direct {v1}, Landroid/content/ContentValues;-><init>()V

    .line 413
    .local v1, "values":Landroid/content/ContentValues;
    const-string v4, "CountdownTime"

    invoke-virtual {p1}, Lcom/belkin/wemo/rules/db/model/RMTRuleDevices;->getCountdownTime()I

    move-result v5

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    invoke-virtual {v1, v4, v5}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 414
    const-string v4, "DayID"

    invoke-virtual {p1}, Lcom/belkin/wemo/rules/db/model/RMTRuleDevices;->getDayID()I

    move-result v5

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    invoke-virtual {v1, v4, v5}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 415
    const-string v4, "DeviceID"

    invoke-virtual {p1}, Lcom/belkin/wemo/rules/db/model/RMTRuleDevices;->getDeviceID()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v1, v4, v5}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 416
    const-string v4, "EndAction"

    invoke-virtual {p1}, Lcom/belkin/wemo/rules/db/model/RMTRuleDevices;->getEndAction()F

    move-result v5

    invoke-static {v5}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v5

    invoke-virtual {v1, v4, v5}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Float;)V

    .line 417
    const-string v4, "EndTime"

    invoke-virtual {p1}, Lcom/belkin/wemo/rules/db/model/RMTRuleDevices;->getEndTime()I

    move-result v5

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    invoke-virtual {v1, v4, v5}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 418
    const-string v4, "GroupID"

    invoke-virtual {p1}, Lcom/belkin/wemo/rules/db/model/RMTRuleDevices;->getGroupID()I

    move-result v5

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    invoke-virtual {v1, v4, v5}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 419
    const-string v4, "Level"

    invoke-virtual {p1}, Lcom/belkin/wemo/rules/db/model/RMTRuleDevices;->getLevel()I

    move-result v5

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    invoke-virtual {v1, v4, v5}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 420
    const-string v4, "OffModeOffset"

    invoke-virtual {p1}, Lcom/belkin/wemo/rules/db/model/RMTRuleDevices;->getOffModeOffset()I

    move-result v5

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    invoke-virtual {v1, v4, v5}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 421
    const-string v4, "OnModeOffset"

    invoke-virtual {p1}, Lcom/belkin/wemo/rules/db/model/RMTRuleDevices;->getOnModeOffset()I

    move-result v5

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    invoke-virtual {v1, v4, v5}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 422
    const-string v4, "RuleDuration"

    invoke-virtual {p1}, Lcom/belkin/wemo/rules/db/model/RMTRuleDevices;->getRuleDuration()I

    move-result v5

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    invoke-virtual {v1, v4, v5}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 423
    const-string v4, "RuleID"

    invoke-virtual {p1}, Lcom/belkin/wemo/rules/db/model/RMTRuleDevices;->getRuleID()I

    move-result v5

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    invoke-virtual {v1, v4, v5}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 424
    const-string v4, "SensorDuration"

    invoke-virtual {p1}, Lcom/belkin/wemo/rules/db/model/RMTRuleDevices;->getSensorDuration()I

    move-result v5

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    invoke-virtual {v1, v4, v5}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 425
    const-string v4, "StartAction"

    invoke-virtual {p1}, Lcom/belkin/wemo/rules/db/model/RMTRuleDevices;->getStartAction()F

    move-result v5

    invoke-static {v5}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v5

    invoke-virtual {v1, v4, v5}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Float;)V

    .line 426
    const-string v4, "StartTime"

    invoke-virtual {p1}, Lcom/belkin/wemo/rules/db/model/RMTRuleDevices;->getStartTime()I

    move-result v5

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    invoke-virtual {v1, v4, v5}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 427
    const-string v4, "Type"

    invoke-virtual {p1}, Lcom/belkin/wemo/rules/db/model/RMTRuleDevices;->getType()I

    move-result v5

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    invoke-virtual {v1, v4, v5}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 428
    const-string v4, "Value"

    invoke-virtual {p1}, Lcom/belkin/wemo/rules/db/model/RMTRuleDevices;->getValue()I

    move-result v5

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    invoke-virtual {v1, v4, v5}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 429
    const-string v4, "ZBCapabilityEnd"

    invoke-virtual {p1}, Lcom/belkin/wemo/rules/db/model/RMTRuleDevices;->getZBCapabilityEnd()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v1, v4, v5}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 430
    const-string v4, "ZBCapabilityStart"

    invoke-virtual {p1}, Lcom/belkin/wemo/rules/db/model/RMTRuleDevices;->getZBCapabilityStart()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v1, v4, v5}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 433
    sget-object v4, Lcom/belkin/wemo/rules/db/RMRulesDBManager;->TAG:Ljava/lang/String;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "Store Rules: Replacing/Adding entry in RULEDEVICES TABLE: CountDown Time = "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {p1}, Lcom/belkin/wemo/rules/db/model/RMTRuleDevices;->getCountdownTime()I

    move-result v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, "; DayID = "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {p1}, Lcom/belkin/wemo/rules/db/model/RMTRuleDevices;->getDayID()I

    move-result v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, "; DeviceId = "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {p1}, Lcom/belkin/wemo/rules/db/model/RMTRuleDevices;->getDeviceID()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, "; EndAction = "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {p1}, Lcom/belkin/wemo/rules/db/model/RMTRuleDevices;->getEndAction()F

    move-result v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, "; EndTime = "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {p1}, Lcom/belkin/wemo/rules/db/model/RMTRuleDevices;->getEndTime()I

    move-result v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, "; GroupID = "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {p1}, Lcom/belkin/wemo/rules/db/model/RMTRuleDevices;->getGroupID()I

    move-result v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, "; Level = "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {p1}, Lcom/belkin/wemo/rules/db/model/RMTRuleDevices;->getLevel()I

    move-result v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, "; OffModeOffset = "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {p1}, Lcom/belkin/wemo/rules/db/model/RMTRuleDevices;->getOffModeOffset()I

    move-result v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, "; OnModeOffset = "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {p1}, Lcom/belkin/wemo/rules/db/model/RMTRuleDevices;->getOnModeOffset()I

    move-result v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, "; RuleDuration = "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {p1}, Lcom/belkin/wemo/rules/db/model/RMTRuleDevices;->getRuleDuration()I

    move-result v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, "; RuleID = "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {p1}, Lcom/belkin/wemo/rules/db/model/RMTRuleDevices;->getRuleID()I

    move-result v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, "; SensorDuration = "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {p1}, Lcom/belkin/wemo/rules/db/model/RMTRuleDevices;->getSensorDuration()I

    move-result v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, "; StartAction = "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {p1}, Lcom/belkin/wemo/rules/db/model/RMTRuleDevices;->getStartAction()F

    move-result v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, "; StartTime = "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {p1}, Lcom/belkin/wemo/rules/db/model/RMTRuleDevices;->getStartTime()I

    move-result v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, "; Type = "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {p1}, Lcom/belkin/wemo/rules/db/model/RMTRuleDevices;->getType()I

    move-result v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, "; Level = "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {p1}, Lcom/belkin/wemo/rules/db/model/RMTRuleDevices;->getValue()I

    move-result v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, "; ZbCapabilityEnd = "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {p1}, Lcom/belkin/wemo/rules/db/model/RMTRuleDevices;->getZBCapabilityEnd()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, "; ZbCapabilityStart = "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {p1}, Lcom/belkin/wemo/rules/db/model/RMTRuleDevices;->getZBCapabilityStart()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->debugLog(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 453
    const-wide/16 v2, -0x1

    .line 455
    .local v2, "rowId":J
    :try_start_1
    invoke-direct {p0}, Lcom/belkin/wemo/rules/db/RMRulesDBManager;->getRuleDBInstance()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v4

    const-string v5, "RULEDEVICES"

    const/4 v6, 0x0

    invoke-virtual {v4, v5, v6, v1}, Landroid/database/sqlite/SQLiteDatabase;->insertOrThrow(Ljava/lang/String;Ljava/lang/String;Landroid/content/ContentValues;)J
    :try_end_1
    .catch Landroid/database/SQLException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    move-result-wide v2

    .line 459
    :try_start_2
    invoke-direct {p0}, Lcom/belkin/wemo/rules/db/RMRulesDBManager;->closeRulesDBInstance()V

    .line 462
    sget-object v4, Lcom/belkin/wemo/rules/db/RMRulesDBManager;->TAG:Ljava/lang/String;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "insertRowRuleDevices(): ROW ID of the inserted row: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v2, v3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->debugLog(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    .line 463
    monitor-exit p0

    return-wide v2

    .line 456
    :catch_0
    move-exception v0

    .line 457
    .local v0, "e":Landroid/database/SQLException;
    :try_start_3
    new-instance v4, Lcom/belkin/wemo/rules/operation/db/exception/RuleDBException;

    invoke-virtual {v0}, Landroid/database/SQLException;->getMessage()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5}, Lcom/belkin/wemo/rules/operation/db/exception/RuleDBException;-><init>(Ljava/lang/String;)V

    throw v4
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 459
    .end local v0    # "e":Landroid/database/SQLException;
    :catchall_0
    move-exception v4

    :try_start_4
    invoke-direct {p0}, Lcom/belkin/wemo/rules/db/RMRulesDBManager;->closeRulesDBInstance()V

    throw v4
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_1

    .line 412
    .end local v1    # "values":Landroid/content/ContentValues;
    .end local v2    # "rowId":J
    :catchall_1
    move-exception v4

    monitor-exit p0

    throw v4
.end method

.method public declared-synchronized insertRowTargetDevices(Lcom/belkin/wemo/rules/db/model/RMTTargetDevices;)J
    .locals 7
    .param p1, "targetDevicesRow"    # Lcom/belkin/wemo/rules/db/model/RMTTargetDevices;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/belkin/wemo/rules/operation/db/exception/RuleDBException;
        }
    .end annotation

    .prologue
    .line 468
    monitor-enter p0

    :try_start_0
    new-instance v1, Landroid/content/ContentValues;

    invoke-direct {v1}, Landroid/content/ContentValues;-><init>()V

    .line 469
    .local v1, "values":Landroid/content/ContentValues;
    const-string v4, "DeviceID"

    invoke-virtual {p1}, Lcom/belkin/wemo/rules/db/model/RMTTargetDevices;->getDeviceID()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v1, v4, v5}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 470
    const-string v4, "DeviceIndex"

    invoke-virtual {p1}, Lcom/belkin/wemo/rules/db/model/RMTTargetDevices;->getDeviceIndex()I

    move-result v5

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    invoke-virtual {v1, v4, v5}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 471
    const-string v4, "RuleID"

    invoke-virtual {p1}, Lcom/belkin/wemo/rules/db/model/RMTTargetDevices;->getRuleId()I

    move-result v5

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    invoke-virtual {v1, v4, v5}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 475
    const-wide/16 v2, -0x1

    .line 477
    .local v2, "rowId":J
    :try_start_1
    invoke-direct {p0}, Lcom/belkin/wemo/rules/db/RMRulesDBManager;->getRuleDBInstance()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v4

    const-string v5, "TARGETDEVICES"

    const/4 v6, 0x0

    invoke-virtual {v4, v5, v6, v1}, Landroid/database/sqlite/SQLiteDatabase;->insertOrThrow(Ljava/lang/String;Ljava/lang/String;Landroid/content/ContentValues;)J
    :try_end_1
    .catch Landroid/database/SQLException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    move-result-wide v2

    .line 481
    :try_start_2
    invoke-direct {p0}, Lcom/belkin/wemo/rules/db/RMRulesDBManager;->closeRulesDBInstance()V

    .line 484
    sget-object v4, Lcom/belkin/wemo/rules/db/RMRulesDBManager;->TAG:Ljava/lang/String;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "insertRowTargetDevices(): ROW ID of the inserted row: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v2, v3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->debugLog(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    .line 485
    monitor-exit p0

    return-wide v2

    .line 478
    :catch_0
    move-exception v0

    .line 479
    .local v0, "e":Landroid/database/SQLException;
    :try_start_3
    new-instance v4, Lcom/belkin/wemo/rules/operation/db/exception/RuleDBException;

    invoke-virtual {v0}, Landroid/database/SQLException;->getMessage()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5}, Lcom/belkin/wemo/rules/operation/db/exception/RuleDBException;-><init>(Ljava/lang/String;)V

    throw v4
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 481
    .end local v0    # "e":Landroid/database/SQLException;
    :catchall_0
    move-exception v4

    :try_start_4
    invoke-direct {p0}, Lcom/belkin/wemo/rules/db/RMRulesDBManager;->closeRulesDBInstance()V

    throw v4
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_1

    .line 468
    .end local v1    # "values":Landroid/content/ContentValues;
    .end local v2    # "rowId":J
    :catchall_1
    move-exception v4

    monitor-exit p0

    throw v4
.end method

.method public declared-synchronized onRulesDBUpdated()V
    .locals 2

    .prologue
    .line 608
    monitor-enter p0

    :try_start_0
    sget-object v0, Lcom/belkin/wemo/rules/db/RMRulesDBManager;->TAG:Ljava/lang/String;

    const-string v1, "Refreshing Rules DB"

    invoke-static {v0, v1}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->debugLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 609
    invoke-static {}, Lcom/belkin/wemo/rules/db/RMRulesDBHelper;->getInstance()Lcom/belkin/wemo/rules/db/RMRulesDBHelper;

    move-result-object v0

    invoke-virtual {v0}, Lcom/belkin/wemo/rules/db/RMRulesDBHelper;->closeRightAway()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 610
    monitor-exit p0

    return-void

    .line 608
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized readLocationInfo()Lcom/belkin/wemo/rules/db/model/RMTLocationInfo;
    .locals 12
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/belkin/wemo/rules/operation/db/exception/RuleDBException;
        }
    .end annotation

    .prologue
    .line 557
    monitor-enter p0

    const/4 v9, 0x0

    .line 560
    .local v9, "locInfo":Lcom/belkin/wemo/rules/db/model/RMTLocationInfo;
    :try_start_0
    invoke-direct {p0}, Lcom/belkin/wemo/rules/db/RMRulesDBManager;->getRuleDBInstance()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v0

    const-string v1, "LOCATIONINFO"

    sget-object v2, Lcom/belkin/wemo/rules/db/contract/RMRulesContract$LocationInfo;->COLUMNS:[Ljava/lang/String;

    const/4 v3, 0x0

    const/4 v4, 0x0

    const/4 v5, 0x0

    const/4 v6, 0x0

    const-string v7, "countryCode"

    invoke-virtual/range {v0 .. v7}, Landroid/database/sqlite/SQLiteDatabase;->query(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v11

    .line 564
    .local v11, "locInfoCursor":Landroid/database/Cursor;
    invoke-interface {v11}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 565
    new-instance v10, Lcom/belkin/wemo/rules/db/model/RMTLocationInfo;

    invoke-direct {v10}, Lcom/belkin/wemo/rules/db/model/RMTLocationInfo;-><init>()V
    :try_end_0
    .catch Landroid/database/SQLException; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 566
    .end local v9    # "locInfo":Lcom/belkin/wemo/rules/db/model/RMTLocationInfo;
    .local v10, "locInfo":Lcom/belkin/wemo/rules/db/model/RMTLocationInfo;
    :try_start_1
    sget-object v0, Lcom/belkin/wemo/rules/db/contract/RMRulesContract$LocationInfo;->COLUMNS_LIST:Ljava/util/List;

    const-string v1, "cityName"

    invoke-interface {v0, v1}, Ljava/util/List;->indexOf(Ljava/lang/Object;)I

    move-result v0

    invoke-interface {v11, v0}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v10, v0}, Lcom/belkin/wemo/rules/db/model/RMTLocationInfo;->setCityName(Ljava/lang/String;)V

    .line 567
    sget-object v0, Lcom/belkin/wemo/rules/db/contract/RMRulesContract$LocationInfo;->COLUMNS_LIST:Ljava/util/List;

    const-string v1, "countryCode"

    invoke-interface {v0, v1}, Ljava/util/List;->indexOf(Ljava/lang/Object;)I

    move-result v0

    invoke-interface {v11, v0}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v10, v0}, Lcom/belkin/wemo/rules/db/model/RMTLocationInfo;->setCountryCode(Ljava/lang/String;)V

    .line 568
    sget-object v0, Lcom/belkin/wemo/rules/db/contract/RMRulesContract$LocationInfo;->COLUMNS_LIST:Ljava/util/List;

    const-string v1, "countryName"

    invoke-interface {v0, v1}, Ljava/util/List;->indexOf(Ljava/lang/Object;)I

    move-result v0

    invoke-interface {v11, v0}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v10, v0}, Lcom/belkin/wemo/rules/db/model/RMTLocationInfo;->setCountryName(Ljava/lang/String;)V

    .line 569
    sget-object v0, Lcom/belkin/wemo/rules/db/contract/RMRulesContract$LocationInfo;->COLUMNS_LIST:Ljava/util/List;

    const-string v1, "latitude"

    invoke-interface {v0, v1}, Ljava/util/List;->indexOf(Ljava/lang/Object;)I

    move-result v0

    invoke-interface {v11, v0}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v10, v0}, Lcom/belkin/wemo/rules/db/model/RMTLocationInfo;->setLatitude(Ljava/lang/String;)V

    .line 570
    sget-object v0, Lcom/belkin/wemo/rules/db/contract/RMRulesContract$LocationInfo;->COLUMNS_LIST:Ljava/util/List;

    const-string v1, "longitude"

    invoke-interface {v0, v1}, Ljava/util/List;->indexOf(Ljava/lang/Object;)I

    move-result v0

    invoke-interface {v11, v0}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v10, v0}, Lcom/belkin/wemo/rules/db/model/RMTLocationInfo;->setLongitude(Ljava/lang/String;)V

    .line 571
    sget-object v0, Lcom/belkin/wemo/rules/db/contract/RMRulesContract$LocationInfo;->COLUMNS_LIST:Ljava/util/List;

    const-string v1, "region"

    invoke-interface {v0, v1}, Ljava/util/List;->indexOf(Ljava/lang/Object;)I

    move-result v0

    invoke-interface {v11, v0}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v10, v0}, Lcom/belkin/wemo/rules/db/model/RMTLocationInfo;->setRegion(Ljava/lang/String;)V
    :try_end_1
    .catch Landroid/database/SQLException; {:try_start_1 .. :try_end_1} :catch_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    move-object v9, v10

    .line 573
    .end local v10    # "locInfo":Lcom/belkin/wemo/rules/db/model/RMTLocationInfo;
    .restart local v9    # "locInfo":Lcom/belkin/wemo/rules/db/model/RMTLocationInfo;
    :cond_0
    :try_start_2
    invoke-interface {v11}, Landroid/database/Cursor;->close()V

    .line 574
    invoke-direct {p0}, Lcom/belkin/wemo/rules/db/RMRulesDBManager;->closeRulesDBInstance()V
    :try_end_2
    .catch Landroid/database/SQLException; {:try_start_2 .. :try_end_2} :catch_0
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 579
    monitor-exit p0

    return-object v9

    .line 575
    .end local v11    # "locInfoCursor":Landroid/database/Cursor;
    :catch_0
    move-exception v8

    .line 576
    .local v8, "e":Landroid/database/SQLException;
    :goto_0
    :try_start_3
    new-instance v0, Lcom/belkin/wemo/rules/operation/db/exception/RuleDBException;

    invoke-virtual {v8}, Landroid/database/SQLException;->getMessage()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/belkin/wemo/rules/operation/db/exception/RuleDBException;-><init>(Ljava/lang/String;)V

    throw v0
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 557
    .end local v8    # "e":Landroid/database/SQLException;
    :catchall_0
    move-exception v0

    :goto_1
    monitor-exit p0

    throw v0

    .line 575
    .end local v9    # "locInfo":Lcom/belkin/wemo/rules/db/model/RMTLocationInfo;
    .restart local v10    # "locInfo":Lcom/belkin/wemo/rules/db/model/RMTLocationInfo;
    .restart local v11    # "locInfoCursor":Landroid/database/Cursor;
    :catch_1
    move-exception v8

    move-object v9, v10

    .end local v10    # "locInfo":Lcom/belkin/wemo/rules/db/model/RMTLocationInfo;
    .restart local v9    # "locInfo":Lcom/belkin/wemo/rules/db/model/RMTLocationInfo;
    goto :goto_0

    .line 557
    .end local v9    # "locInfo":Lcom/belkin/wemo/rules/db/model/RMTLocationInfo;
    .restart local v10    # "locInfo":Lcom/belkin/wemo/rules/db/model/RMTLocationInfo;
    :catchall_1
    move-exception v0

    move-object v9, v10

    .end local v10    # "locInfo":Lcom/belkin/wemo/rules/db/model/RMTLocationInfo;
    .restart local v9    # "locInfo":Lcom/belkin/wemo/rules/db/model/RMTLocationInfo;
    goto :goto_1
.end method

.method public replaceLocationInfo(Lcom/belkin/wemo/rules/db/model/RMTLocationInfo;)J
    .locals 7
    .param p1, "row"    # Lcom/belkin/wemo/rules/db/model/RMTLocationInfo;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/belkin/wemo/rules/operation/db/exception/RuleDBException;
        }
    .end annotation

    .prologue
    .line 583
    const-wide/16 v2, -0x1

    .line 586
    .local v2, "rowId":J
    new-instance v1, Landroid/content/ContentValues;

    invoke-direct {v1}, Landroid/content/ContentValues;-><init>()V

    .line 587
    .local v1, "values":Landroid/content/ContentValues;
    const-string v4, "cityName"

    invoke-virtual {p1}, Lcom/belkin/wemo/rules/db/model/RMTLocationInfo;->getCityName()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v1, v4, v5}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 588
    const-string v4, "countryCode"

    invoke-virtual {p1}, Lcom/belkin/wemo/rules/db/model/RMTLocationInfo;->getCountryCode()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v1, v4, v5}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 589
    const-string v4, "countryName"

    invoke-virtual {p1}, Lcom/belkin/wemo/rules/db/model/RMTLocationInfo;->getCountryName()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v1, v4, v5}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 590
    const-string v4, "latitude"

    invoke-virtual {p1}, Lcom/belkin/wemo/rules/db/model/RMTLocationInfo;->getLatitude()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v1, v4, v5}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 591
    const-string v4, "longitude"

    invoke-virtual {p1}, Lcom/belkin/wemo/rules/db/model/RMTLocationInfo;->getLongitude()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v1, v4, v5}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 592
    const-string v4, "region"

    invoke-virtual {p1}, Lcom/belkin/wemo/rules/db/model/RMTLocationInfo;->getRegion()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v1, v4, v5}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 593
    const-string v4, "LocationPk"

    invoke-virtual {p1}, Lcom/belkin/wemo/rules/db/model/RMTLocationInfo;->getLocationPk()I

    move-result v5

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    invoke-virtual {v1, v4, v5}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 596
    :try_start_0
    invoke-direct {p0}, Lcom/belkin/wemo/rules/db/RMRulesDBManager;->getRuleDBInstance()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v4

    const-string v5, "LOCATIONINFO"

    const/4 v6, 0x0

    invoke-virtual {v4, v5, v6, v1}, Landroid/database/sqlite/SQLiteDatabase;->replaceOrThrow(Ljava/lang/String;Ljava/lang/String;Landroid/content/ContentValues;)J
    :try_end_0
    .catch Landroid/database/SQLException; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result-wide v2

    .line 600
    invoke-direct {p0}, Lcom/belkin/wemo/rules/db/RMRulesDBManager;->closeRulesDBInstance()V

    .line 603
    return-wide v2

    .line 597
    :catch_0
    move-exception v0

    .line 598
    .local v0, "e":Landroid/database/SQLException;
    :try_start_1
    new-instance v4, Lcom/belkin/wemo/rules/operation/db/exception/RuleDBException;

    invoke-virtual {v0}, Landroid/database/SQLException;->getMessage()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5}, Lcom/belkin/wemo/rules/operation/db/exception/RuleDBException;-><init>(Ljava/lang/String;)V

    throw v4
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 600
    .end local v0    # "e":Landroid/database/SQLException;
    :catchall_0
    move-exception v4

    invoke-direct {p0}, Lcom/belkin/wemo/rules/db/RMRulesDBManager;->closeRulesDBInstance()V

    throw v4
.end method

.method public declared-synchronized replaceRowRules(Lcom/belkin/wemo/rules/db/model/RMTRules;)V
    .locals 5
    .param p1, "rulesRow"    # Lcom/belkin/wemo/rules/db/model/RMTRules;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/belkin/wemo/rules/operation/db/exception/RuleDBException;
        }
    .end annotation

    .prologue
    .line 390
    monitor-enter p0

    :try_start_0
    new-instance v1, Landroid/content/ContentValues;

    invoke-direct {v1}, Landroid/content/ContentValues;-><init>()V

    .line 391
    .local v1, "values":Landroid/content/ContentValues;
    const-string v2, "EndDate"

    invoke-virtual {p1}, Lcom/belkin/wemo/rules/db/model/RMTRules;->getEndDate()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v2, v3}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 392
    const-string v2, "Name"

    invoke-virtual {p1}, Lcom/belkin/wemo/rules/db/model/RMTRules;->getName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v2, v3}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 393
    const-string v2, "RuleID"

    invoke-virtual {p1}, Lcom/belkin/wemo/rules/db/model/RMTRules;->getRuleId()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v2, v3}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 394
    const-string v2, "RuleOrder"

    invoke-virtual {p1}, Lcom/belkin/wemo/rules/db/model/RMTRules;->getRuleOrder()I

    move-result v3

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v1, v2, v3}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 395
    const-string v2, "StartDate"

    invoke-virtual {p1}, Lcom/belkin/wemo/rules/db/model/RMTRules;->getStartDate()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v2, v3}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 396
    const-string v2, "State"

    invoke-virtual {p1}, Lcom/belkin/wemo/rules/db/model/RMTRules;->getState()I

    move-result v3

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v1, v2, v3}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 397
    const-string v2, "Sync"

    invoke-virtual {p1}, Lcom/belkin/wemo/rules/db/model/RMTRules;->getSync()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v2, v3}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 398
    const-string v2, "Type"

    invoke-virtual {p1}, Lcom/belkin/wemo/rules/db/model/RMTRules;->getType()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v2, v3}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 402
    :try_start_1
    invoke-direct {p0}, Lcom/belkin/wemo/rules/db/RMRulesDBManager;->getRuleDBInstance()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v2

    const-string v3, "RULES"

    const/4 v4, 0x0

    invoke-virtual {v2, v3, v4, v1}, Landroid/database/sqlite/SQLiteDatabase;->replaceOrThrow(Ljava/lang/String;Ljava/lang/String;Landroid/content/ContentValues;)J
    :try_end_1
    .catch Landroid/database/SQLException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 406
    :try_start_2
    invoke-direct {p0}, Lcom/belkin/wemo/rules/db/RMRulesDBManager;->closeRulesDBInstance()V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    .line 408
    monitor-exit p0

    return-void

    .line 403
    :catch_0
    move-exception v0

    .line 404
    .local v0, "e":Landroid/database/SQLException;
    :try_start_3
    new-instance v2, Lcom/belkin/wemo/rules/operation/db/exception/RuleDBException;

    invoke-virtual {v0}, Landroid/database/SQLException;->getMessage()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Lcom/belkin/wemo/rules/operation/db/exception/RuleDBException;-><init>(Ljava/lang/String;)V

    throw v2
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 406
    .end local v0    # "e":Landroid/database/SQLException;
    :catchall_0
    move-exception v2

    :try_start_4
    invoke-direct {p0}, Lcom/belkin/wemo/rules/db/RMRulesDBManager;->closeRulesDBInstance()V

    throw v2
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_1

    .line 390
    .end local v1    # "values":Landroid/content/ContentValues;
    :catchall_1
    move-exception v2

    monitor-exit p0

    throw v2
.end method

.method public declared-synchronized toggleRuleState(II)I
    .locals 9
    .param p1, "state"    # I
    .param p2, "ruleId"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/belkin/wemo/rules/operation/db/exception/RuleDBException;
        }
    .end annotation

    .prologue
    .line 539
    monitor-enter p0

    const/4 v1, 0x0

    .line 540
    .local v1, "rowsAffected":I
    :try_start_0
    new-instance v2, Landroid/content/ContentValues;

    invoke-direct {v2}, Landroid/content/ContentValues;-><init>()V

    .line 541
    .local v2, "values":Landroid/content/ContentValues;
    const-string v3, "State"

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {v2, v3, v4}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 545
    :try_start_1
    invoke-direct {p0}, Lcom/belkin/wemo/rules/db/RMRulesDBManager;->getRuleDBInstance()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v3

    const-string v4, "RULES"

    const-string v5, "RuleID=?"

    const/4 v6, 0x1

    new-array v6, v6, [Ljava/lang/String;

    const/4 v7, 0x0

    invoke-static {p2}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v8

    aput-object v8, v6, v7

    invoke-virtual {v3, v4, v2, v5, v6}, Landroid/database/sqlite/SQLiteDatabase;->update(Ljava/lang/String;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I
    :try_end_1
    .catch Landroid/database/SQLException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    move-result v1

    .line 549
    :try_start_2
    invoke-direct {p0}, Lcom/belkin/wemo/rules/db/RMRulesDBManager;->closeRulesDBInstance()V

    .line 552
    sget-object v3, Lcom/belkin/wemo/rules/db/RMRulesDBManager;->TAG:Ljava/lang/String;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "toggle(): Table name: RULES; Number of rows deleted: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->debugLog(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    .line 553
    monitor-exit p0

    return v1

    .line 546
    :catch_0
    move-exception v0

    .line 547
    .local v0, "e":Landroid/database/SQLException;
    :try_start_3
    new-instance v3, Lcom/belkin/wemo/rules/operation/db/exception/RuleDBException;

    invoke-virtual {v0}, Landroid/database/SQLException;->getMessage()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Lcom/belkin/wemo/rules/operation/db/exception/RuleDBException;-><init>(Ljava/lang/String;)V

    throw v3
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 549
    .end local v0    # "e":Landroid/database/SQLException;
    :catchall_0
    move-exception v3

    :try_start_4
    invoke-direct {p0}, Lcom/belkin/wemo/rules/db/RMRulesDBManager;->closeRulesDBInstance()V

    throw v3
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_1

    .line 539
    .end local v2    # "values":Landroid/content/ContentValues;
    :catchall_1
    move-exception v3

    monitor-exit p0

    throw v3
.end method
