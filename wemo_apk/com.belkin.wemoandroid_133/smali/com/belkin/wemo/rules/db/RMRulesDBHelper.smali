.class public final Lcom/belkin/wemo/rules/db/RMRulesDBHelper;
.super Lcom/belkin/wemo/sqlite/WeMoSqliteOpenHelper;
.source "RMRulesDBHelper.java"


# static fields
.field private static final TAG:Ljava/lang/String;

.field private static rulesDBHelperIns:Lcom/belkin/wemo/rules/db/RMRulesDBHelper;


# instance fields
.field private connectionCounter:I


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 16
    const-class v0, Lcom/belkin/wemo/rules/db/RMRulesDBHelper;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/belkin/wemo/rules/db/RMRulesDBHelper;->TAG:Ljava/lang/String;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;)V
    .locals 3
    .param p1, "dbName"    # Ljava/lang/String;

    .prologue
    .line 38
    sget-object v0, Lcom/belkin/wemo/WeMo;->INSTANCE:Lcom/belkin/wemo/WeMo;

    invoke-virtual {v0}, Lcom/belkin/wemo/WeMo;->getContext()Landroid/content/Context;

    move-result-object v0

    const/4 v1, 0x0

    const/16 v2, 0x9

    invoke-direct {p0, v0, p1, v1, v2}, Lcom/belkin/wemo/sqlite/WeMoSqliteOpenHelper;-><init>(Landroid/content/Context;Ljava/lang/String;Landroid/database/sqlite/SQLiteDatabase$CursorFactory;I)V

    .line 39
    return-void
.end method

.method public static declared-synchronized destroy()V
    .locals 2

    .prologue
    .line 42
    const-class v1, Lcom/belkin/wemo/rules/db/RMRulesDBHelper;

    monitor-enter v1

    :try_start_0
    sget-object v0, Lcom/belkin/wemo/rules/db/RMRulesDBHelper;->rulesDBHelperIns:Lcom/belkin/wemo/rules/db/RMRulesDBHelper;

    if-eqz v0, :cond_0

    .line 43
    sget-object v0, Lcom/belkin/wemo/rules/db/RMRulesDBHelper;->rulesDBHelperIns:Lcom/belkin/wemo/rules/db/RMRulesDBHelper;

    invoke-virtual {v0}, Lcom/belkin/wemo/rules/db/RMRulesDBHelper;->close()V

    .line 45
    :cond_0
    const/4 v0, 0x0

    sput-object v0, Lcom/belkin/wemo/rules/db/RMRulesDBHelper;->rulesDBHelperIns:Lcom/belkin/wemo/rules/db/RMRulesDBHelper;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 46
    monitor-exit v1

    return-void

    .line 42
    :catchall_0
    move-exception v0

    monitor-exit v1

    throw v0
.end method

.method private static getDBFilename()Ljava/lang/String;
    .locals 5

    .prologue
    .line 27
    const-string v0, "temppluginRules.db"

    .line 28
    .local v0, "dbName":Ljava/lang/String;
    invoke-static {}, Lcom/belkin/wemo/rules/RMRulesSDK;->instance()Lcom/belkin/wemo/rules/RMRulesSDK;

    move-result-object v1

    .line 29
    .local v1, "sdk":Lcom/belkin/wemo/rules/RMRulesSDK;
    if-eqz v1, :cond_0

    .line 30
    invoke-virtual {v1}, Lcom/belkin/wemo/rules/RMRulesSDK;->getDependencyProvider()Lcom/belkin/wemo/rules/RMIRulesDependencyProvider;

    move-result-object v2

    invoke-interface {v2}, Lcom/belkin/wemo/rules/RMIRulesDependencyProvider;->provideIRulesUtils()Lcom/belkin/wemo/rules/util/RMIRulesUtils;

    move-result-object v2

    invoke-interface {v2}, Lcom/belkin/wemo/rules/util/RMIRulesUtils;->getDBFilePathWithNameInApp()Ljava/lang/String;

    move-result-object v0

    .line 31
    const/4 v1, 0x0

    .line 33
    :cond_0
    sget-object v2, Lcom/belkin/wemo/rules/db/RMRulesDBHelper;->TAG:Ljava/lang/String;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "RulesDBHelper Init: DB Filename fetched = "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->debugLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 34
    return-object v0
.end method

.method public static declared-synchronized getInstance()Lcom/belkin/wemo/rules/db/RMRulesDBHelper;
    .locals 3

    .prologue
    .line 20
    const-class v1, Lcom/belkin/wemo/rules/db/RMRulesDBHelper;

    monitor-enter v1

    :try_start_0
    sget-object v0, Lcom/belkin/wemo/rules/db/RMRulesDBHelper;->rulesDBHelperIns:Lcom/belkin/wemo/rules/db/RMRulesDBHelper;

    if-nez v0, :cond_0

    .line 21
    new-instance v0, Lcom/belkin/wemo/rules/db/RMRulesDBHelper;

    invoke-static {}, Lcom/belkin/wemo/rules/db/RMRulesDBHelper;->getDBFilename()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v0, v2}, Lcom/belkin/wemo/rules/db/RMRulesDBHelper;-><init>(Ljava/lang/String;)V

    sput-object v0, Lcom/belkin/wemo/rules/db/RMRulesDBHelper;->rulesDBHelperIns:Lcom/belkin/wemo/rules/db/RMRulesDBHelper;

    .line 23
    :cond_0
    sget-object v0, Lcom/belkin/wemo/rules/db/RMRulesDBHelper;->rulesDBHelperIns:Lcom/belkin/wemo/rules/db/RMRulesDBHelper;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit v1

    return-object v0

    .line 20
    :catchall_0
    move-exception v0

    monitor-exit v1

    throw v0
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
    .line 165
    new-instance v0, Ljava/lang/CloneNotSupportedException;

    invoke-direct {v0}, Ljava/lang/CloneNotSupportedException;-><init>()V

    return-object v0
.end method

.method public declared-synchronized close()V
    .locals 3

    .prologue
    .line 143
    monitor-enter p0

    :try_start_0
    iget v0, p0, Lcom/belkin/wemo/rules/db/RMRulesDBHelper;->connectionCounter:I

    add-int/lit8 v0, v0, -0x1

    iput v0, p0, Lcom/belkin/wemo/rules/db/RMRulesDBHelper;->connectionCounter:I

    .line 144
    sget-object v0, Lcom/belkin/wemo/rules/db/RMRulesDBHelper;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Close database request. connection counter: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget v2, p0, Lcom/belkin/wemo/rules/db/RMRulesDBHelper;->connectionCounter:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->debugLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 145
    iget v0, p0, Lcom/belkin/wemo/rules/db/RMRulesDBHelper;->connectionCounter:I

    if-gtz v0, :cond_0

    .line 149
    const/4 v0, 0x0

    iput v0, p0, Lcom/belkin/wemo/rules/db/RMRulesDBHelper;->connectionCounter:I

    .line 150
    invoke-super {p0}, Lcom/belkin/wemo/sqlite/WeMoSqliteOpenHelper;->close()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 152
    :cond_0
    monitor-exit p0

    return-void

    .line 143
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public closeRightAway()V
    .locals 1

    .prologue
    .line 169
    const/4 v0, 0x0

    iput v0, p0, Lcom/belkin/wemo/rules/db/RMRulesDBHelper;->connectionCounter:I

    .line 170
    invoke-super {p0}, Lcom/belkin/wemo/sqlite/WeMoSqliteOpenHelper;->close()V

    .line 171
    return-void
.end method

.method public declared-synchronized deleteDatabase()V
    .locals 2

    .prologue
    .line 174
    monitor-enter p0

    :try_start_0
    sget-object v0, Lcom/belkin/wemo/rules/db/RMRulesDBHelper;->TAG:Ljava/lang/String;

    const-string v1, "Deleting database"

    invoke-static {v0, v1}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->debugLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 175
    const/4 v0, 0x0

    iput v0, p0, Lcom/belkin/wemo/rules/db/RMRulesDBHelper;->connectionCounter:I

    .line 176
    invoke-virtual {p0}, Lcom/belkin/wemo/rules/db/RMRulesDBHelper;->close()V

    .line 177
    sget-object v0, Lcom/belkin/wemo/WeMo;->INSTANCE:Lcom/belkin/wemo/WeMo;

    invoke-virtual {v0}, Lcom/belkin/wemo/WeMo;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {}, Lcom/belkin/wemo/rules/db/RMRulesDBHelper;->getDBFilename()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/content/Context;->deleteDatabase(Ljava/lang/String;)Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 178
    monitor-exit p0

    return-void

    .line 174
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized getWritableDatabase()Landroid/database/sqlite/SQLiteDatabase;
    .locals 3

    .prologue
    .line 156
    monitor-enter p0

    :try_start_0
    iget v0, p0, Lcom/belkin/wemo/rules/db/RMRulesDBHelper;->connectionCounter:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lcom/belkin/wemo/rules/db/RMRulesDBHelper;->connectionCounter:I

    .line 158
    sget-object v0, Lcom/belkin/wemo/rules/db/RMRulesDBHelper;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Get Writable database. connection counter: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget v2, p0, Lcom/belkin/wemo/rules/db/RMRulesDBHelper;->connectionCounter:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->debugLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 159
    invoke-super {p0}, Lcom/belkin/wemo/sqlite/WeMoSqliteOpenHelper;->getWritableDatabase()Landroid/database/sqlite/SQLiteDatabase;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result-object v0

    monitor-exit p0

    return-object v0

    .line 156
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public onCreate(Landroid/database/sqlite/SQLiteDatabase;)V
    .locals 1
    .param p1, "db"    # Landroid/database/sqlite/SQLiteDatabase;

    .prologue
    .line 51
    const-string v0, "CREATE TABLE IF NOT EXISTS RULES ( RuleID PRIMARY KEY, Name TEXT NOT NULL, Type TEXT NOT NULL, RuleOrder INTEGER, StartDate TEXT, EndDate TEXT, State TEXT, Sync INTEGER)"

    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 52
    const-string v0, "CREATE TABLE IF NOT EXISTS RULEDEVICES(RuleDevicePK INTEGER PRIMARY KEY AUTOINCREMENT, RuleID INTEGER , DeviceID TEXT , GroupID INTEGER , DayID INTEGER , StartTime INTEGER, RuleDuration INTEGER , StartAction REAL, EndAction REAL, SensorDuration INTEGER , Type INTEGER , Value INTEGER , Level INTEGER, ZBCapabilityStart TEXT, ZBCapabilityEnd TEXT,OnModeOffset INTEGER, OffModeOffset INTEGER, CountdownTime INTEGER, EndTime INTEGER)"

    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 53
    const-string v0, "CREATE TABLE IF NOT EXISTS DEVICECOMBINATION(DeviceCombinationPK INTEGER PRIMARY KEY AUTOINCREMENT, RuleID INTEGER , SensorID TEXT , SensorGroupID INTEGER , DeviceID TEXT , DeviceGroupID INTEGER )"

    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 54
    const-string v0, "CREATE TABLE IF NOT EXISTS GROUPDEVICES(GroupDevicePK INTEGER PRIMARY KEY AUTOINCREMENT, GroupID INTEGER , DeviceID TEXT )"

    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 55
    const-string v0, "CREATE TABLE IF NOT EXISTS LOCATIONINFO(LocationPk INTEGER PRIMARY KEY AUTOINCREMENT, cityName TEXT, countryName TEXT, latitude TEXT, longitude TEXT, countryCode TEXT, region TEXT )"

    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 56
    const-string v0, "CREATE TABLE IF NOT EXISTS BLOCKEDRULES(Primarykey INTEGER PRIMARY KEY AUTOINCREMENT, ruleId TEXT )"

    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 57
    const-string v0, "CREATE TABLE IF NOT EXISTS RULESNOTIFYMESSAGE(RuleID INTEGER PRIMARY KEY AUTOINCREMENT, NotifyRuleID INTEGER , Message TEXT , Frequency INTEGER )"

    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 58
    const-string v0, "CREATE TABLE IF NOT EXISTS SENSORNOTIFICATION(SensorNotificationPK INTEGER PRIMARY KEY AUTOINCREMENT, RuleID INTEGER , NotifyRuleID INTEGER , NotificationMessage TEXT , NotificationDuration INTEGER )"

    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 59
    const-string v0, "CREATE TABLE IF NOT EXISTS TARGETDEVICES(TargetDevicesPK INTEGER PRIMARY KEY AUTOINCREMENT, RuleID INTEGER, DeviceID TEXT, DeviceIndex INTEGER )"

    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 60
    return-void
.end method

.method public onDowngrade(Landroid/database/sqlite/SQLiteDatabase;II)V
    .locals 0
    .param p1, "db"    # Landroid/database/sqlite/SQLiteDatabase;
    .param p2, "oldVersion"    # I
    .param p3, "newVersion"    # I

    .prologue
    .line 64
    invoke-super {p0, p1, p2, p3}, Lcom/belkin/wemo/sqlite/WeMoSqliteOpenHelper;->onDowngrade(Landroid/database/sqlite/SQLiteDatabase;II)V

    .line 65
    return-void
.end method

.method public onOpen(Landroid/database/sqlite/SQLiteDatabase;)V
    .locals 0
    .param p1, "db"    # Landroid/database/sqlite/SQLiteDatabase;

    .prologue
    .line 132
    invoke-super {p0, p1}, Lcom/belkin/wemo/sqlite/WeMoSqliteOpenHelper;->onOpen(Landroid/database/sqlite/SQLiteDatabase;)V

    .line 134
    return-void
.end method

.method public onUpgrade(Landroid/database/sqlite/SQLiteDatabase;II)V
    .locals 4
    .param p1, "db"    # Landroid/database/sqlite/SQLiteDatabase;
    .param p2, "oldVersion"    # I
    .param p3, "newVersion"    # I

    .prologue
    .line 70
    sget-object v1, Lcom/belkin/wemo/rules/db/RMRulesDBHelper;->TAG:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "ON UPGRADE (RULES.DB) old version: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "; new version: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->debugLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 74
    :try_start_0
    const-string v1, "CREATE TABLE IF NOT EXISTS TARGETDEVICES(TargetDevicesPK INTEGER PRIMARY KEY AUTOINCREMENT, RuleID INTEGER, DeviceID TEXT, DeviceIndex INTEGER )"

    invoke-virtual {p1, v1}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 77
    packed-switch p2, :pswitch_data_0

    .line 128
    :goto_0
    :pswitch_0
    return-void

    .line 80
    :pswitch_1
    const-string v1, "ALTER TABLE RULEDEVICES DROP COLUMN ProductName"

    invoke-virtual {p1, v1}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V
    :try_end_0
    .catch Landroid/database/SQLException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 100
    :catch_0
    move-exception v0

    .line 101
    .local v0, "e":Landroid/database/SQLException;
    sget-object v1, Lcom/belkin/wemo/rules/db/RMRulesDBHelper;->TAG:Ljava/lang/String;

    const-string v2, "SQLITE Exception in ON UPGRADE (RULES.DB). Dropping all tables and creating new RULES.DB: "

    invoke-static {v1, v2, v0}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Exception;)V

    .line 103
    const-string v1, "DROP TABLE IF EXISTS RULES"

    invoke-virtual {p1, v1}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 104
    const-string v1, "DROP TABLE IF EXISTS RULEDEVICES"

    invoke-virtual {p1, v1}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 105
    const-string v1, "DROP TABLE IF EXISTS DEVICECOMBINATION"

    invoke-virtual {p1, v1}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 106
    const-string v1, "DROP TABLE IF EXISTS GROUPDEVICES"

    invoke-virtual {p1, v1}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 107
    const-string v1, "DROP TABLE IF EXISTS LOCATIONINFO"

    invoke-virtual {p1, v1}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 108
    const-string v1, "DROP TABLE IF EXISTS BLOCKEDRULES"

    invoke-virtual {p1, v1}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 109
    const-string v1, "DROP TABLE IF EXISTS RULESNOTIFYMESSAGE"

    invoke-virtual {p1, v1}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 110
    const-string v1, "DROP TABLE IF EXISTS SENSORNOTIFICATION"

    invoke-virtual {p1, v1}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 111
    const-string v1, "DROP TABLE IF EXISTS TARGETDEVICES"

    invoke-virtual {p1, v1}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 113
    invoke-virtual {p0, p1}, Lcom/belkin/wemo/rules/db/RMRulesDBHelper;->onCreate(Landroid/database/sqlite/SQLiteDatabase;)V

    goto :goto_0

    .line 84
    .end local v0    # "e":Landroid/database/SQLException;
    :pswitch_2
    :try_start_1
    const-string v1, "ALTER TABLE RULEDEVICES DROP COLUMN ProductName"

    invoke-virtual {p1, v1}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    goto :goto_0

    .line 87
    :pswitch_3
    const-string v1, "ALTER TABLE RULEDEVICES ADD COLUMN CountdownTime INTEGER"

    invoke-virtual {p1, v1}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    goto :goto_0

    .line 90
    :pswitch_4
    const-string v1, "ALTER TABLE RULEDEVICES ADD COLUMN OffModeOffset INTEGER"

    invoke-virtual {p1, v1}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 91
    const-string v1, "ALTER TABLE RULEDEVICES ADD COLUMN OnModeOffset INTEGER"

    invoke-virtual {p1, v1}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 92
    const-string v1, "ALTER TABLE RULEDEVICES ADD COLUMN ZBCapabilityStart TEXT"

    invoke-virtual {p1, v1}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 93
    const-string v1, "ALTER TABLE RULEDEVICES ADD COLUMN ZBCapabilityEnd TEXT"

    invoke-virtual {p1, v1}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 95
    const-string v1, "ALTER TABLE RULEDEVICES ADD COLUMN CountdownTime INTEGER"

    invoke-virtual {p1, v1}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V
    :try_end_1
    .catch Landroid/database/SQLException; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_0

    .line 77
    :pswitch_data_0
    .packed-switch 0x4
        :pswitch_4
        :pswitch_3
        :pswitch_0
        :pswitch_2
        :pswitch_1
    .end packed-switch
.end method
