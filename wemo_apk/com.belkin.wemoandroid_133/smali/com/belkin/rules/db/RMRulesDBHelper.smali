.class public final Lcom/belkin/rules/db/RMRulesDBHelper;
.super Landroid/database/sqlite/SQLiteOpenHelper;
.source "RMRulesDBHelper.java"


# static fields
.field private static final TAG:Ljava/lang/String;

.field private static rulesDBHelperIns:Lcom/belkin/rules/db/RMRulesDBHelper;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 15
    const-class v0, Lcom/belkin/rules/db/RMRulesDBHelper;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/belkin/rules/db/RMRulesDBHelper;->TAG:Ljava/lang/String;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;Landroid/content/Context;)V
    .locals 2
    .param p1, "dbName"    # Ljava/lang/String;
    .param p2, "context"    # Landroid/content/Context;

    .prologue
    .line 33
    const/4 v0, 0x0

    const/16 v1, 0x9

    invoke-direct {p0, p2, p1, v0, v1}, Landroid/database/sqlite/SQLiteOpenHelper;-><init>(Landroid/content/Context;Ljava/lang/String;Landroid/database/sqlite/SQLiteDatabase$CursorFactory;I)V

    .line 34
    return-void
.end method

.method public static declared-synchronized destroy()V
    .locals 2

    .prologue
    .line 37
    const-class v1, Lcom/belkin/rules/db/RMRulesDBHelper;

    monitor-enter v1

    :try_start_0
    sget-object v0, Lcom/belkin/rules/db/RMRulesDBHelper;->rulesDBHelperIns:Lcom/belkin/rules/db/RMRulesDBHelper;

    if-eqz v0, :cond_0

    .line 38
    sget-object v0, Lcom/belkin/rules/db/RMRulesDBHelper;->rulesDBHelperIns:Lcom/belkin/rules/db/RMRulesDBHelper;

    invoke-virtual {v0}, Lcom/belkin/rules/db/RMRulesDBHelper;->close()V

    .line 40
    :cond_0
    const/4 v0, 0x0

    sput-object v0, Lcom/belkin/rules/db/RMRulesDBHelper;->rulesDBHelperIns:Lcom/belkin/rules/db/RMRulesDBHelper;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 41
    monitor-exit v1

    return-void

    .line 37
    :catchall_0
    move-exception v0

    monitor-exit v1

    throw v0
.end method

.method private static getDBFilename()Ljava/lang/String;
    .locals 4

    .prologue
    .line 25
    const-string v0, "temppluginRules.db"

    .line 27
    .local v0, "dbName":Ljava/lang/String;
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-static {}, Lcom/belkin/utils/RuleUtility;->getLocalDBPath()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "/"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-static {}, Lcom/belkin/utils/RuleUtility;->getLocalDBName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 28
    sget-object v1, Lcom/belkin/rules/db/RMRulesDBHelper;->TAG:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "dbName: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 29
    return-object v0
.end method

.method public static declared-synchronized getInstance(Landroid/content/Context;)Lcom/belkin/rules/db/RMRulesDBHelper;
    .locals 3
    .param p0, "context"    # Landroid/content/Context;

    .prologue
    .line 19
    const-class v1, Lcom/belkin/rules/db/RMRulesDBHelper;

    monitor-enter v1

    :try_start_0
    new-instance v0, Lcom/belkin/rules/db/RMRulesDBHelper;

    invoke-static {}, Lcom/belkin/rules/db/RMRulesDBHelper;->getDBFilename()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v0, v2, p0}, Lcom/belkin/rules/db/RMRulesDBHelper;-><init>(Ljava/lang/String;Landroid/content/Context;)V

    sput-object v0, Lcom/belkin/rules/db/RMRulesDBHelper;->rulesDBHelperIns:Lcom/belkin/rules/db/RMRulesDBHelper;

    .line 21
    sget-object v0, Lcom/belkin/rules/db/RMRulesDBHelper;->rulesDBHelperIns:Lcom/belkin/rules/db/RMRulesDBHelper;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit v1

    return-object v0

    .line 19
    :catchall_0
    move-exception v0

    monitor-exit v1

    throw v0
.end method


# virtual methods
.method public onCreate(Landroid/database/sqlite/SQLiteDatabase;)V
    .locals 1
    .param p1, "db"    # Landroid/database/sqlite/SQLiteDatabase;

    .prologue
    .line 46
    const-string v0, "CREATE TABLE IF NOT EXISTS RULES ( RuleID PRIMARY KEY, Name TEXT NOT NULL, Type TEXT NOT NULL, RuleOrder INTEGER, StartDate TEXT, EndDate TEXT, State TEXT, Sync INTEGER)"

    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 47
    const-string v0, "CREATE TABLE IF NOT EXISTS RULEDEVICES(RuleDevicePK INTEGER PRIMARY KEY AUTOINCREMENT, RuleID INTEGER , DeviceID TEXT , GroupID INTEGER , DayID INTEGER , StartTime INTEGER, RuleDuration INTEGER , StartAction REAL, EndAction REAL, SensorDuration INTEGER , Type INTEGER , Value INTEGER , Level INTEGER, ZBCapabilityStart TEXT, ZBCapabilityEnd TEXT,OnModeOffset INTEGER, OffModeOffset INTEGER, CountdownTime INTEGER, EndTime INTEGER)"

    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 48
    const-string v0, "CREATE TABLE IF NOT EXISTS DEVICECOMBINATION(DeviceCombinationPK INTEGER PRIMARY KEY AUTOINCREMENT, RuleID INTEGER , SensorID TEXT , SensorGroupID INTEGER , DeviceID TEXT , DeviceGroupID INTEGER )"

    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 49
    const-string v0, "CREATE TABLE IF NOT EXISTS GROUPDEVICES(GroupDevicePK INTEGER PRIMARY KEY AUTOINCREMENT, GroupID INTEGER , DeviceID TEXT )"

    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 50
    const-string v0, "CREATE TABLE IF NOT EXISTS LOCATIONINFO(LocationPk INTEGER PRIMARY KEY AUTOINCREMENT, cityName TEXT, countryName TEXT, latitude TEXT, longitude TEXT, countryCode TEXT, region TEXT )"

    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 51
    const-string v0, "CREATE TABLE IF NOT EXISTS BLOCKEDRULES(Primarykey INTEGER PRIMARY KEY AUTOINCREMENT, ruleId TEXT )"

    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 52
    const-string v0, "CREATE TABLE IF NOT EXISTS RULESNOTIFYMESSAGE(RuleID INTEGER PRIMARY KEY AUTOINCREMENT, NotifyRuleID INTEGER , Message TEXT , Frequency INTEGER )"

    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 53
    const-string v0, "CREATE TABLE IF NOT EXISTS SENSORNOTIFICATION(SensorNotificationPK INTEGER PRIMARY KEY AUTOINCREMENT, RuleID INTEGER , NotifyRuleID INTEGER , NotificationMessage TEXT , NotificationDuration INTEGER )"

    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 54
    return-void
.end method

.method public onUpgrade(Landroid/database/sqlite/SQLiteDatabase;II)V
    .locals 0
    .param p1, "db"    # Landroid/database/sqlite/SQLiteDatabase;
    .param p2, "oldVersion"    # I
    .param p3, "newVersion"    # I

    .prologue
    .line 70
    return-void
.end method

.method public openDatabase()Landroid/database/sqlite/SQLiteDatabase;
    .locals 5

    .prologue
    .line 74
    const/4 v1, 0x0

    .line 78
    .local v1, "mydb":Landroid/database/sqlite/SQLiteDatabase;
    :try_start_0
    invoke-static {}, Lcom/belkin/rules/db/RMRulesDBHelper;->getDBFilename()Ljava/lang/String;

    move-result-object v2

    const/4 v3, 0x0

    const/16 v4, 0x10

    invoke-static {v2, v3, v4}, Landroid/database/sqlite/SQLiteDatabase;->openDatabase(Ljava/lang/String;Landroid/database/sqlite/SQLiteDatabase$CursorFactory;I)Landroid/database/sqlite/SQLiteDatabase;
    :try_end_0
    .catch Landroid/database/sqlite/SQLiteException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v1

    .line 83
    :goto_0
    return-object v1

    .line 80
    :catch_0
    move-exception v0

    .line 81
    .local v0, "e":Landroid/database/sqlite/SQLiteException;
    sget-object v2, Lcom/belkin/rules/db/RMRulesDBHelper;->TAG:Ljava/lang/String;

    const-string v3, "SQLiteException while opening DB: "

    invoke-static {v2, v3, v0}, Lcom/belkin/utils/LogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_0
.end method
