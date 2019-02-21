.class Lcom/belkin/rules/dbmigration/RuleDatabaseManager$OpenHelper;
.super Landroid/database/sqlite/SQLiteOpenHelper;
.source "RuleDatabaseManager.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/belkin/rules/dbmigration/RuleDatabaseManager;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "OpenHelper"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/belkin/rules/dbmigration/RuleDatabaseManager;


# direct methods
.method constructor <init>(Lcom/belkin/rules/dbmigration/RuleDatabaseManager;Landroid/content/Context;)V
    .locals 3
    .param p2, "context"    # Landroid/content/Context;

    .prologue
    .line 207
    iput-object p1, p0, Lcom/belkin/rules/dbmigration/RuleDatabaseManager$OpenHelper;->this$0:Lcom/belkin/rules/dbmigration/RuleDatabaseManager;

    .line 208
    const-string v0, "pluginrules2.db"

    const/4 v1, 0x0

    const/4 v2, 0x2

    invoke-direct {p0, p2, v0, v1, v2}, Landroid/database/sqlite/SQLiteOpenHelper;-><init>(Landroid/content/Context;Ljava/lang/String;Landroid/database/sqlite/SQLiteDatabase$CursorFactory;I)V

    .line 210
    return-void
.end method

.method public constructor <init>(Lcom/belkin/rules/dbmigration/RuleDatabaseManager;Landroid/content/Context;Ljava/lang/String;Landroid/database/sqlite/SQLiteDatabase$CursorFactory;I)V
    .locals 3
    .param p2, "context"    # Landroid/content/Context;
    .param p3, "name"    # Ljava/lang/String;
    .param p4, "factory"    # Landroid/database/sqlite/SQLiteDatabase$CursorFactory;
    .param p5, "version"    # I

    .prologue
    .line 203
    iput-object p1, p0, Lcom/belkin/rules/dbmigration/RuleDatabaseManager$OpenHelper;->this$0:Lcom/belkin/rules/dbmigration/RuleDatabaseManager;

    .line 204
    const-string v0, "pluginrules2.db"

    const/4 v1, 0x0

    const/4 v2, 0x2

    invoke-direct {p0, p2, v0, v1, v2}, Landroid/database/sqlite/SQLiteOpenHelper;-><init>(Landroid/content/Context;Ljava/lang/String;Landroid/database/sqlite/SQLiteDatabase$CursorFactory;I)V

    .line 205
    return-void
.end method


# virtual methods
.method public declared-synchronized close()V
    .locals 1

    .prologue
    .line 197
    monitor-enter p0

    :try_start_0
    invoke-super {p0}, Landroid/database/sqlite/SQLiteOpenHelper;->close()V

    .line 198
    iget-object v0, p0, Lcom/belkin/rules/dbmigration/RuleDatabaseManager$OpenHelper;->this$0:Lcom/belkin/rules/dbmigration/RuleDatabaseManager;

    invoke-static {v0}, Lcom/belkin/rules/dbmigration/RuleDatabaseManager;->access$000(Lcom/belkin/rules/dbmigration/RuleDatabaseManager;)Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 199
    iget-object v0, p0, Lcom/belkin/rules/dbmigration/RuleDatabaseManager$OpenHelper;->this$0:Lcom/belkin/rules/dbmigration/RuleDatabaseManager;

    invoke-static {v0}, Lcom/belkin/rules/dbmigration/RuleDatabaseManager;->access$000(Lcom/belkin/rules/dbmigration/RuleDatabaseManager;)Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v0

    invoke-virtual {v0}, Landroid/database/sqlite/SQLiteDatabase;->close()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 200
    :cond_0
    monitor-exit p0

    return-void

    .line 197
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public onCreate(Landroid/database/sqlite/SQLiteDatabase;)V
    .locals 2
    .param p1, "db"    # Landroid/database/sqlite/SQLiteDatabase;

    .prologue
    .line 216
    :try_start_0
    const-string v1, "CREATE TABLE IF NOT EXISTS RULES ( RuleID PRIMARY KEY, Name TEXT NOT NULL, Type TEXT NOT NULL, RuleOrder INTEGER, StartDate TEXT, EndDate TEXT, State TEXT, Sync INTEGER)"

    invoke-virtual {p1, v1}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 227
    const-string v1, "CREATE TABLE IF NOT EXISTS RULEDEVICES(RuleDevicePK INTEGER PRIMARY KEY AUTOINCREMENT, RuleID INTEGER , DeviceID TEXT , GroupID INTEGER , DayID INTEGER , StartTime INTEGER, RuleDuration INTEGER , StartAction REAL, EndAction REAL, SensorDuration INTEGER , Type INTEGER , Value INTEGER , Level INTEGER, ZBCapabilityStart TEXT, ZBCapabilityEnd TEXT,OnModeOffset INTEGER, OffModeOffset INTEGER, CountdownTime INTEGER, EndTime INTEGER, ProductName TEXT)"

    invoke-virtual {p1, v1}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 250
    const-string v1, "CREATE TABLE IF NOT EXISTS DEVICECOMBINATION(DeviceCombinationPK INTEGER PRIMARY KEY AUTOINCREMENT, RuleID INTEGER , SensorID TEXT , SensorGroupID INTEGER , DeviceID TEXT , DeviceGroupID INTEGER )"

    invoke-virtual {p1, v1}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 259
    const-string v1, "CREATE TABLE IF NOT EXISTS GROUPDEVICES(GroupDevicePK INTEGER PRIMARY KEY AUTOINCREMENT, GroupID INTEGER , DeviceID TEXT )"

    invoke-virtual {p1, v1}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 265
    const-string v1, "CREATE TABLE IF NOT EXISTS LOCATIONINFO(LocationPk INTEGER PRIMARY KEY AUTOINCREMENT, cityName TEXT, countryName TEXT, latitude TEXT, longitude TEXT, countryCode TEXT, region TEXT )"

    invoke-virtual {p1, v1}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 275
    const-string v1, "CREATE TABLE IF NOT EXISTS BLOCKEDRULES(Primarykey INTEGER PRIMARY KEY AUTOINCREMENT, ruleId TEXT )"

    invoke-virtual {p1, v1}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 280
    const-string v1, "CREATE TABLE IF NOT EXISTS RULESNOTIFYMESSAGE(RuleID INTEGER PRIMARY KEY AUTOINCREMENT, NotifyRuleID INTEGER , Message TEXT )Frequency INTEGER )"

    invoke-virtual {p1, v1}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 286
    const-string v1, "CREATE TABLE IF NOT EXISTS SENSORNOTIFICATION(SensorNotificationPK INTEGER PRIMARY KEY AUTOINCREMENT, RuleID INTEGER , NotifyRuleID INTEGER , NotificationMessage TEXT )NotificationDuration INTEGER )"

    invoke-virtual {p1, v1}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V
    :try_end_0
    .catch Landroid/database/SQLException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1

    .line 300
    :goto_0
    return-void

    .line 294
    :catch_0
    move-exception v0

    .line 295
    .local v0, "e":Landroid/database/SQLException;
    invoke-virtual {v0}, Landroid/database/SQLException;->printStackTrace()V

    goto :goto_0

    .line 296
    .end local v0    # "e":Landroid/database/SQLException;
    :catch_1
    move-exception v0

    .line 297
    .local v0, "e":Ljava/lang/Exception;
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_0
.end method

.method public onUpgrade(Landroid/database/sqlite/SQLiteDatabase;II)V
    .locals 3
    .param p1, "db"    # Landroid/database/sqlite/SQLiteDatabase;
    .param p2, "oldVersion"    # I
    .param p3, "newVersion"    # I

    .prologue
    .line 305
    :try_start_0
    iget-object v1, p0, Lcom/belkin/rules/dbmigration/RuleDatabaseManager$OpenHelper;->this$0:Lcom/belkin/rules/dbmigration/RuleDatabaseManager;

    invoke-static {v1}, Lcom/belkin/rules/dbmigration/RuleDatabaseManager;->access$000(Lcom/belkin/rules/dbmigration/RuleDatabaseManager;)Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v1

    const-string v2, "DROP TABLE IF EXISTS RULES"

    invoke-virtual {v1, v2}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 306
    iget-object v1, p0, Lcom/belkin/rules/dbmigration/RuleDatabaseManager$OpenHelper;->this$0:Lcom/belkin/rules/dbmigration/RuleDatabaseManager;

    invoke-static {v1}, Lcom/belkin/rules/dbmigration/RuleDatabaseManager;->access$000(Lcom/belkin/rules/dbmigration/RuleDatabaseManager;)Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v1

    const-string v2, "DROP TABLE IF EXISTS RULEDEVICES"

    invoke-virtual {v1, v2}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 307
    iget-object v1, p0, Lcom/belkin/rules/dbmigration/RuleDatabaseManager$OpenHelper;->this$0:Lcom/belkin/rules/dbmigration/RuleDatabaseManager;

    invoke-static {v1}, Lcom/belkin/rules/dbmigration/RuleDatabaseManager;->access$000(Lcom/belkin/rules/dbmigration/RuleDatabaseManager;)Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v1

    const-string v2, "DROP TABLE IF EXISTS DEVICECOMBINATION"

    invoke-virtual {v1, v2}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 308
    iget-object v1, p0, Lcom/belkin/rules/dbmigration/RuleDatabaseManager$OpenHelper;->this$0:Lcom/belkin/rules/dbmigration/RuleDatabaseManager;

    invoke-static {v1}, Lcom/belkin/rules/dbmigration/RuleDatabaseManager;->access$000(Lcom/belkin/rules/dbmigration/RuleDatabaseManager;)Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v1

    const-string v2, "DROP TABLE IF EXISTS GROUPDEVICES"

    invoke-virtual {v1, v2}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 309
    invoke-virtual {p0, p1}, Lcom/belkin/rules/dbmigration/RuleDatabaseManager$OpenHelper;->onCreate(Landroid/database/sqlite/SQLiteDatabase;)V
    :try_end_0
    .catch Landroid/database/SQLException; {:try_start_0 .. :try_end_0} :catch_0

    .line 314
    :goto_0
    return-void

    .line 310
    :catch_0
    move-exception v0

    .line 311
    .local v0, "e":Landroid/database/SQLException;
    invoke-virtual {v0}, Landroid/database/SQLException;->printStackTrace()V

    goto :goto_0
.end method
