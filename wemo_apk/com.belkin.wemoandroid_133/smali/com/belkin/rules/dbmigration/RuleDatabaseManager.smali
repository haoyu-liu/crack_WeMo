.class public Lcom/belkin/rules/dbmigration/RuleDatabaseManager;
.super Ljava/lang/Object;
.source "RuleDatabaseManager.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/belkin/rules/dbmigration/RuleDatabaseManager$OpenHelper;
    }
.end annotation


# static fields
.field public static final BLOCKEDRULES_PK:Ljava/lang/String; = "Primarykey"

.field public static final BLOCKEDRULES_RULEID:Ljava/lang/String; = "ruleId"

.field public static final DEVICECOMBINATION_DEVICE_GROUP_ID:Ljava/lang/String; = "DeviceGroupID"

.field public static final DEVICECOMBINATION_DEVICE_ID:Ljava/lang/String; = "DeviceID"

.field public static final DEVICECOMBINATION_PK:Ljava/lang/String; = "DeviceCombinationPK"

.field public static final DEVICECOMBINATION_RULE_ID:Ljava/lang/String; = "RuleID"

.field public static final DEVICECOMBINATION_SENSOR_GROUP_ID:Ljava/lang/String; = "SensorGroupID"

.field public static final DEVICECOMBINATION_SENSOR_ID:Ljava/lang/String; = "SensorID"

.field public static final LOCATIONINFO_CITY:Ljava/lang/String; = "cityName"

.field public static final LOCATIONINFO_COUNTRYCODE:Ljava/lang/String; = "countryCode"

.field public static final LOCATIONINFO_COUNTRYNAME:Ljava/lang/String; = "countryName"

.field public static final LOCATIONINFO_LAT:Ljava/lang/String; = "latitude"

.field public static final LOCATIONINFO_LONG:Ljava/lang/String; = "longitude"

.field public static final LOCATIONINFO_PK:Ljava/lang/String; = "LocationPk"

.field public static final LOCATIONINFO_REGION:Ljava/lang/String; = "region"

.field public static final RULEDEVICES_COUNTDOWN_TIMER:Ljava/lang/String; = "CountdownTime"

.field public static final RULEDEVICES_DAY_ID:Ljava/lang/String; = "DayID"

.field public static final RULEDEVICES_DEVICE_ID:Ljava/lang/String; = "DeviceID"

.field public static final RULEDEVICES_END_ACTION:Ljava/lang/String; = "EndAction"

.field public static final RULEDEVICES_END_TIME:Ljava/lang/String; = "EndTime"

.field public static final RULEDEVICES_GROUP_ID:Ljava/lang/String; = "GroupID"

.field public static final RULEDEVICES_LEVEL:Ljava/lang/String; = "Level"

.field public static final RULEDEVICES_OFF_MODE_OFFSET:Ljava/lang/String; = "OffModeOffset"

.field public static final RULEDEVICES_ON_MODE_OFFSET:Ljava/lang/String; = "OnModeOffset"

.field public static final RULEDEVICES_PK:Ljava/lang/String; = "RuleDevicePK"

.field public static final RULEDEVICES_PRODUCT_NAME:Ljava/lang/String; = "ProductName"

.field public static final RULEDEVICES_RULE_DURATION:Ljava/lang/String; = "RuleDuration"

.field public static final RULEDEVICES_RULE_ID:Ljava/lang/String; = "RuleID"

.field public static final RULEDEVICES_SENSOR_DURATION:Ljava/lang/String; = "SensorDuration"

.field public static final RULEDEVICES_START_ACTION:Ljava/lang/String; = "StartAction"

.field public static final RULEDEVICES_START_TIME:Ljava/lang/String; = "StartTime"

.field public static final RULEDEVICES_TYPE:Ljava/lang/String; = "Type"

.field public static final RULEDEVICES_VALUE:Ljava/lang/String; = "Value"

.field public static final RULEDEVICES_ZBCapabilityEnd:Ljava/lang/String; = "ZBCapabilityEnd"

.field public static final RULEDEVICES_ZBCapabilityStart:Ljava/lang/String; = "ZBCapabilityStart"

.field public static final RULENOTIFY_FREQUENCY:Ljava/lang/String; = "Frequency"

.field public static final RULENOTIFY_ID:Ljava/lang/String; = "RuleID"

.field public static final RULENOTIFY_MESSAGE:Ljava/lang/String; = "Message"

.field public static final RULENOTIFY_RULEID:Ljava/lang/String; = "NotifyRuleID"

.field public static final RULES_END_DATE:Ljava/lang/String; = "EndDate"

.field public static final RULES_ID:Ljava/lang/String; = "RuleID"

.field public static final RULES_NAME:Ljava/lang/String; = "Name"

.field public static final RULES_ORDER:Ljava/lang/String; = "RuleOrder"

.field public static final RULES_START_DATE:Ljava/lang/String; = "StartDate"

.field public static final RULES_STATE:Ljava/lang/String; = "State"

.field public static final RULES_SYNC:Ljava/lang/String; = "Sync"

.field public static final RULES_TYPE:Ljava/lang/String; = "Type"

.field public static final SENSORNOTIFY_ID:Ljava/lang/String; = "RuleID"

.field public static final SENSORNOTIFY_MESSAGE:Ljava/lang/String; = "NotificationMessage"

.field public static final SENSORNOTIFY_PK:Ljava/lang/String; = "SensorNotificationPK"

.field public static final SENSORNOTIFY_RULEID:Ljava/lang/String; = "NotifyRuleID"

.field public static final SENSOROTIFY_DURATION:Ljava/lang/String; = "NotificationDuration"

.field public static final TABLE_NAME_BLOCKEDRULES:Ljava/lang/String; = "BLOCKEDRULES"

.field public static final TABLE_NAME_DEVICE_COMBINATION:Ljava/lang/String; = "DEVICECOMBINATION"

.field public static final TABLE_NAME_GROUP_DEVICES:Ljava/lang/String; = "GROUPDEVICES"

.field public static final TABLE_NAME_LOCATIONINFO:Ljava/lang/String; = "LOCATIONINFO"

.field public static final TABLE_NAME_RULEDEVICES:Ljava/lang/String; = "RULEDEVICES"

.field public static final TABLE_NAME_RULES:Ljava/lang/String; = "RULES"

.field public static final TABLE_NAME_RULE_NOTIFY_MESSAGE:Ljava/lang/String; = "RULESNOTIFYMESSAGE"

.field public static final TABLE_NAME_SENSOR_RULE_NOTIFY_MESSAGE:Ljava/lang/String; = "SENSORNOTIFICATION"

.field private static final TAG:Ljava/lang/String; = "DatabaseManager"

.field private static mDBMgrinstance:Lcom/belkin/rules/dbmigration/RuleDatabaseManager;


# instance fields
.field private final DATABASE_NAME:Ljava/lang/String;

.field private final DATABASE_VERSION:I

.field private final GROUPDEVICES_DEVICE_ID:Ljava/lang/String;

.field private final GROUPDEVICES_GROUP_ID:Ljava/lang/String;

.field private final GROUPDEVICES_PK:Ljava/lang/String;

.field private mContext:Landroid/content/Context;

.field private mDBOpenHelper:Lcom/belkin/rules/dbmigration/RuleDatabaseManager$OpenHelper;

.field private mSqlDatabase:Landroid/database/sqlite/SQLiteDatabase;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 54
    const/4 v0, 0x0

    sput-object v0, Lcom/belkin/rules/dbmigration/RuleDatabaseManager;->mDBMgrinstance:Lcom/belkin/rules/dbmigration/RuleDatabaseManager;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .locals 7
    .param p1, "context"    # Landroid/content/Context;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    const/4 v5, 0x2

    .line 180
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 66
    const-string v0, "pluginrules2.db"

    iput-object v0, p0, Lcom/belkin/rules/dbmigration/RuleDatabaseManager;->DATABASE_NAME:Ljava/lang/String;

    .line 67
    iput v5, p0, Lcom/belkin/rules/dbmigration/RuleDatabaseManager;->DATABASE_VERSION:I

    .line 119
    const-string v0, "GroupDevicePK"

    iput-object v0, p0, Lcom/belkin/rules/dbmigration/RuleDatabaseManager;->GROUPDEVICES_PK:Ljava/lang/String;

    .line 120
    const-string v0, "GroupID"

    iput-object v0, p0, Lcom/belkin/rules/dbmigration/RuleDatabaseManager;->GROUPDEVICES_GROUP_ID:Ljava/lang/String;

    .line 121
    const-string v0, "DeviceID"

    iput-object v0, p0, Lcom/belkin/rules/dbmigration/RuleDatabaseManager;->GROUPDEVICES_DEVICE_ID:Ljava/lang/String;

    .line 181
    iput-object p1, p0, Lcom/belkin/rules/dbmigration/RuleDatabaseManager;->mContext:Landroid/content/Context;

    .line 182
    new-instance v0, Lcom/belkin/rules/dbmigration/RuleDatabaseManager$OpenHelper;

    const-string v3, "pluginrules2.db"

    const/4 v4, 0x0

    move-object v1, p0

    move-object v2, p1

    invoke-direct/range {v0 .. v5}, Lcom/belkin/rules/dbmigration/RuleDatabaseManager$OpenHelper;-><init>(Lcom/belkin/rules/dbmigration/RuleDatabaseManager;Landroid/content/Context;Ljava/lang/String;Landroid/database/sqlite/SQLiteDatabase$CursorFactory;I)V

    iput-object v0, p0, Lcom/belkin/rules/dbmigration/RuleDatabaseManager;->mDBOpenHelper:Lcom/belkin/rules/dbmigration/RuleDatabaseManager$OpenHelper;

    .line 185
    :try_start_0
    iget-object v0, p0, Lcom/belkin/rules/dbmigration/RuleDatabaseManager;->mDBOpenHelper:Lcom/belkin/rules/dbmigration/RuleDatabaseManager$OpenHelper;

    invoke-virtual {v0}, Lcom/belkin/rules/dbmigration/RuleDatabaseManager$OpenHelper;->getWritableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v0

    iput-object v0, p0, Lcom/belkin/rules/dbmigration/RuleDatabaseManager;->mSqlDatabase:Landroid/database/sqlite/SQLiteDatabase;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 191
    :goto_0
    return-void

    .line 186
    :catch_0
    move-exception v6

    .line 187
    .local v6, "e":Ljava/lang/Exception;
    sget-object v0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v1, "Can not create Database"

    invoke-virtual {v0, v1}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 188
    invoke-virtual {v6}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_0
.end method

.method static synthetic access$000(Lcom/belkin/rules/dbmigration/RuleDatabaseManager;)Landroid/database/sqlite/SQLiteDatabase;
    .locals 1
    .param p0, "x0"    # Lcom/belkin/rules/dbmigration/RuleDatabaseManager;

    .prologue
    .line 52
    iget-object v0, p0, Lcom/belkin/rules/dbmigration/RuleDatabaseManager;->mSqlDatabase:Landroid/database/sqlite/SQLiteDatabase;

    return-object v0
.end method

.method public static declared-synchronized getInstance(Landroid/content/Context;)Lcom/belkin/rules/dbmigration/RuleDatabaseManager;
    .locals 7
    .param p0, "context"    # Landroid/content/Context;

    .prologue
    .line 148
    const-class v5, Lcom/belkin/rules/dbmigration/RuleDatabaseManager;

    monitor-enter v5

    :try_start_0
    sget-object v4, Lcom/belkin/rules/dbmigration/RuleDatabaseManager;->mDBMgrinstance:Lcom/belkin/rules/dbmigration/RuleDatabaseManager;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-nez v4, :cond_0

    .line 150
    :try_start_1
    new-instance v4, Lcom/belkin/rules/dbmigration/RuleDatabaseManager;

    invoke-direct {v4, p0}, Lcom/belkin/rules/dbmigration/RuleDatabaseManager;-><init>(Landroid/content/Context;)V

    sput-object v4, Lcom/belkin/rules/dbmigration/RuleDatabaseManager;->mDBMgrinstance:Lcom/belkin/rules/dbmigration/RuleDatabaseManager;
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 154
    :cond_0
    :goto_0
    const/4 v3, 0x0

    .local v3, "status":Z
    const/4 v2, 0x0

    .line 156
    .local v2, "isLocked":Z
    :try_start_2
    sget-object v4, Lcom/belkin/rules/dbmigration/RuleDatabaseManager;->mDBMgrinstance:Lcom/belkin/rules/dbmigration/RuleDatabaseManager;

    iget-object v4, v4, Lcom/belkin/rules/dbmigration/RuleDatabaseManager;->mSqlDatabase:Landroid/database/sqlite/SQLiteDatabase;

    invoke-virtual {v4}, Landroid/database/sqlite/SQLiteDatabase;->isOpen()Z
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_1
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    move-result v3

    .line 162
    :goto_1
    :try_start_3
    sget-object v4, Lcom/belkin/rules/dbmigration/RuleDatabaseManager;->mDBMgrinstance:Lcom/belkin/rules/dbmigration/RuleDatabaseManager;

    iget-object v4, v4, Lcom/belkin/rules/dbmigration/RuleDatabaseManager;->mSqlDatabase:Landroid/database/sqlite/SQLiteDatabase;

    invoke-virtual {v4}, Landroid/database/sqlite/SQLiteDatabase;->isDbLockedByCurrentThread()Z
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_2
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    move-result v2

    .line 169
    :goto_2
    if-eqz v3, :cond_1

    const/4 v4, 0x1

    if-ne v2, v4, :cond_2

    .line 172
    :cond_1
    :try_start_4
    sget-object v4, Lcom/belkin/rules/dbmigration/RuleDatabaseManager;->mDBMgrinstance:Lcom/belkin/rules/dbmigration/RuleDatabaseManager;

    sget-object v6, Lcom/belkin/rules/dbmigration/RuleDatabaseManager;->mDBMgrinstance:Lcom/belkin/rules/dbmigration/RuleDatabaseManager;

    iget-object v6, v6, Lcom/belkin/rules/dbmigration/RuleDatabaseManager;->mDBOpenHelper:Lcom/belkin/rules/dbmigration/RuleDatabaseManager$OpenHelper;

    invoke-virtual {v6}, Lcom/belkin/rules/dbmigration/RuleDatabaseManager$OpenHelper;->getWritableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v6

    iput-object v6, v4, Lcom/belkin/rules/dbmigration/RuleDatabaseManager;->mSqlDatabase:Landroid/database/sqlite/SQLiteDatabase;
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_3
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    .line 177
    :cond_2
    :goto_3
    :try_start_5
    sget-object v4, Lcom/belkin/rules/dbmigration/RuleDatabaseManager;->mDBMgrinstance:Lcom/belkin/rules/dbmigration/RuleDatabaseManager;
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    monitor-exit v5

    return-object v4

    .line 151
    .end local v2    # "isLocked":Z
    .end local v3    # "status":Z
    :catch_0
    move-exception v1

    .line 152
    .local v1, "e1":Ljava/lang/Exception;
    :try_start_6
    invoke-virtual {v1}, Ljava/lang/Exception;->printStackTrace()V
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_0

    goto :goto_0

    .line 148
    .end local v1    # "e1":Ljava/lang/Exception;
    :catchall_0
    move-exception v4

    monitor-exit v5

    throw v4

    .line 157
    .restart local v2    # "isLocked":Z
    .restart local v3    # "status":Z
    :catch_1
    move-exception v0

    .line 158
    .local v0, "e":Ljava/lang/Exception;
    :try_start_7
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_1

    .line 163
    .end local v0    # "e":Ljava/lang/Exception;
    :catch_2
    move-exception v0

    .line 164
    .restart local v0    # "e":Ljava/lang/Exception;
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_2

    .line 173
    .end local v0    # "e":Ljava/lang/Exception;
    :catch_3
    move-exception v0

    .line 174
    .restart local v0    # "e":Ljava/lang/Exception;
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V
    :try_end_7
    .catchall {:try_start_7 .. :try_end_7} :catchall_0

    goto :goto_3
.end method


# virtual methods
.method protected clone()Ljava/lang/Object;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/CloneNotSupportedException;
        }
    .end annotation

    .prologue
    .line 330
    new-instance v0, Ljava/lang/CloneNotSupportedException;

    const-string v1, "Cannot create clone"

    invoke-direct {v0, v1}, Ljava/lang/CloneNotSupportedException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public close()V
    .locals 1

    .prologue
    .line 334
    iget-object v0, p0, Lcom/belkin/rules/dbmigration/RuleDatabaseManager;->mDBOpenHelper:Lcom/belkin/rules/dbmigration/RuleDatabaseManager$OpenHelper;

    if-eqz v0, :cond_0

    .line 335
    iget-object v0, p0, Lcom/belkin/rules/dbmigration/RuleDatabaseManager;->mDBOpenHelper:Lcom/belkin/rules/dbmigration/RuleDatabaseManager$OpenHelper;

    invoke-virtual {v0}, Lcom/belkin/rules/dbmigration/RuleDatabaseManager$OpenHelper;->close()V

    .line 336
    :cond_0
    return-void
.end method

.method public insert(Ljava/util/ArrayList;Ljava/util/ArrayList;Ljava/util/ArrayList;)Z
    .locals 10
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList",
            "<",
            "Lcom/belkin/rules/dbmigration/RulesTable;",
            ">;",
            "Ljava/util/ArrayList",
            "<",
            "Lcom/belkin/rules/dbmigration/RuleDevicesTable;",
            ">;",
            "Ljava/util/ArrayList",
            "<",
            "Lcom/belkin/rules/dbmigration/DeviceCombinationTable;",
            ">;)Z"
        }
    .end annotation

    .prologue
    .line 342
    .local p1, "rulesRowList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/belkin/rules/dbmigration/RulesTable;>;"
    .local p2, "deviceRowList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/belkin/rules/dbmigration/RuleDevicesTable;>;"
    .local p3, "deviceCombinationTablesArrayList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/belkin/rules/dbmigration/DeviceCombinationTable;>;"
    const/4 v5, 0x1

    .line 344
    .local v5, "result":Z
    :try_start_0
    iget-object v7, p0, Lcom/belkin/rules/dbmigration/RuleDatabaseManager;->mSqlDatabase:Landroid/database/sqlite/SQLiteDatabase;

    invoke-virtual {v7}, Landroid/database/sqlite/SQLiteDatabase;->beginTransaction()V

    .line 345
    new-instance v4, Landroid/content/ContentValues;

    invoke-direct {v4}, Landroid/content/ContentValues;-><init>()V

    .line 347
    .local v4, "newEntry":Landroid/content/ContentValues;
    const/4 v3, 0x0

    .local v3, "i":I
    :goto_0
    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    move-result v7

    if-ge v3, v7, :cond_0

    .line 349
    invoke-virtual {p1, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lcom/belkin/rules/dbmigration/RulesTable;

    .line 350
    .local v6, "rulesTableRow":Lcom/belkin/rules/dbmigration/RulesTable;
    new-instance v4, Landroid/content/ContentValues;

    .end local v4    # "newEntry":Landroid/content/ContentValues;
    invoke-direct {v4}, Landroid/content/ContentValues;-><init>()V

    .line 351
    .restart local v4    # "newEntry":Landroid/content/ContentValues;
    const-string v7, "RuleID"

    invoke-virtual {v6}, Lcom/belkin/rules/dbmigration/RulesTable;->getRuleId()I

    move-result v8

    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v8

    invoke-virtual {v4, v7, v8}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 352
    const-string v7, "Name"

    invoke-virtual {v6}, Lcom/belkin/rules/dbmigration/RulesTable;->getName()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v4, v7, v8}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 353
    const-string v7, "Type"

    invoke-virtual {v6}, Lcom/belkin/rules/dbmigration/RulesTable;->getType()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v4, v7, v8}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 354
    const-string v7, "RuleOrder"

    const/4 v8, 0x2

    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v8

    invoke-virtual {v4, v7, v8}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 355
    const-string v7, "StartDate"

    const-string v8, "12201983"

    invoke-virtual {v4, v7, v8}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 356
    const-string v7, "EndDate"

    const-string v8, "12201983"

    invoke-virtual {v4, v7, v8}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 357
    const-string v7, "State"

    invoke-virtual {v6}, Lcom/belkin/rules/dbmigration/RulesTable;->getState()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v4, v7, v8}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 358
    const-string v7, "Sync"

    const-string v8, "NOSYNC"

    invoke-virtual {v4, v7, v8}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 360
    iget-object v7, p0, Lcom/belkin/rules/dbmigration/RuleDatabaseManager;->mSqlDatabase:Landroid/database/sqlite/SQLiteDatabase;

    const-string v8, "RULES"

    const/4 v9, 0x0

    invoke-virtual {v7, v8, v9, v4}, Landroid/database/sqlite/SQLiteDatabase;->insertOrThrow(Ljava/lang/String;Ljava/lang/String;Landroid/content/ContentValues;)J

    .line 347
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 363
    .end local v6    # "rulesTableRow":Lcom/belkin/rules/dbmigration/RulesTable;
    :cond_0
    const/4 v3, 0x0

    :goto_1
    invoke-virtual {p2}, Ljava/util/ArrayList;->size()I

    move-result v7

    if-ge v3, v7, :cond_1

    .line 365
    invoke-virtual {p2, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/belkin/rules/dbmigration/RuleDevicesTable;

    .line 366
    .local v1, "devicesTableRow":Lcom/belkin/rules/dbmigration/RuleDevicesTable;
    new-instance v4, Landroid/content/ContentValues;

    .end local v4    # "newEntry":Landroid/content/ContentValues;
    invoke-direct {v4}, Landroid/content/ContentValues;-><init>()V

    .line 367
    .restart local v4    # "newEntry":Landroid/content/ContentValues;
    const-string v7, "RuleID"

    invoke-virtual {v1}, Lcom/belkin/rules/dbmigration/RuleDevicesTable;->getRuleId()I

    move-result v8

    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v8

    invoke-virtual {v4, v7, v8}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 368
    const-string v7, "DeviceID"

    invoke-virtual {v1}, Lcom/belkin/rules/dbmigration/RuleDevicesTable;->getDeviceId()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v4, v7, v8}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 369
    const-string v7, "GroupID"

    invoke-virtual {v1}, Lcom/belkin/rules/dbmigration/RuleDevicesTable;->getGroupId()I

    move-result v8

    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v8

    invoke-virtual {v4, v7, v8}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 370
    const-string v7, "DayID"

    invoke-virtual {v1}, Lcom/belkin/rules/dbmigration/RuleDevicesTable;->getDayId()I

    move-result v8

    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v8

    invoke-virtual {v4, v7, v8}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 371
    const-string v7, "StartTime"

    invoke-virtual {v1}, Lcom/belkin/rules/dbmigration/RuleDevicesTable;->getStarttime()I

    move-result v8

    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v8

    invoke-virtual {v4, v7, v8}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 372
    const-string v7, "RuleDuration"

    invoke-virtual {v1}, Lcom/belkin/rules/dbmigration/RuleDevicesTable;->getRuleDuration()I

    move-result v8

    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v8

    invoke-virtual {v4, v7, v8}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 373
    const-string v7, "StartAction"

    invoke-virtual {v1}, Lcom/belkin/rules/dbmigration/RuleDevicesTable;->getStartAction()D

    move-result-wide v8

    invoke-static {v8, v9}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v8

    invoke-virtual {v4, v7, v8}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Double;)V

    .line 374
    const-string v7, "EndAction"

    invoke-virtual {v1}, Lcom/belkin/rules/dbmigration/RuleDevicesTable;->getEndAction()D

    move-result-wide v8

    invoke-static {v8, v9}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v8

    invoke-virtual {v4, v7, v8}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Double;)V

    .line 375
    const-string v7, "SensorDuration"

    invoke-virtual {v1}, Lcom/belkin/rules/dbmigration/RuleDevicesTable;->getSensorDuration()I

    move-result v8

    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v8

    invoke-virtual {v4, v7, v8}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 376
    const-string v7, "Type"

    invoke-virtual {v1}, Lcom/belkin/rules/dbmigration/RuleDevicesTable;->getType()I

    move-result v8

    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v8

    invoke-virtual {v4, v7, v8}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 377
    const-string v7, "Value"

    invoke-virtual {v1}, Lcom/belkin/rules/dbmigration/RuleDevicesTable;->getValue()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v4, v7, v8}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 378
    const-string v7, "Level"

    invoke-virtual {v1}, Lcom/belkin/rules/dbmigration/RuleDevicesTable;->getLevel()I

    move-result v8

    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v8

    invoke-virtual {v4, v7, v8}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 380
    iget-object v7, p0, Lcom/belkin/rules/dbmigration/RuleDatabaseManager;->mSqlDatabase:Landroid/database/sqlite/SQLiteDatabase;

    const-string v8, "RULEDEVICES"

    const/4 v9, 0x0

    invoke-virtual {v7, v8, v9, v4}, Landroid/database/sqlite/SQLiteDatabase;->insertOrThrow(Ljava/lang/String;Ljava/lang/String;Landroid/content/ContentValues;)J

    .line 363
    add-int/lit8 v3, v3, 0x1

    goto/16 :goto_1

    .line 383
    .end local v1    # "devicesTableRow":Lcom/belkin/rules/dbmigration/RuleDevicesTable;
    :cond_1
    invoke-virtual {p3}, Ljava/util/ArrayList;->size()I

    move-result v7

    if-lez v7, :cond_2

    .line 384
    const/4 v3, 0x0

    :goto_2
    invoke-virtual {p3}, Ljava/util/ArrayList;->size()I

    move-result v7

    if-ge v3, v7, :cond_2

    .line 386
    invoke-virtual {p3, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/belkin/rules/dbmigration/DeviceCombinationTable;

    .line 387
    .local v0, "deviceCombinationTable":Lcom/belkin/rules/dbmigration/DeviceCombinationTable;
    new-instance v4, Landroid/content/ContentValues;

    .end local v4    # "newEntry":Landroid/content/ContentValues;
    invoke-direct {v4}, Landroid/content/ContentValues;-><init>()V

    .line 388
    .restart local v4    # "newEntry":Landroid/content/ContentValues;
    const-string v7, "RuleID"

    invoke-virtual {v0}, Lcom/belkin/rules/dbmigration/DeviceCombinationTable;->getRuleId()I

    move-result v8

    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v8

    invoke-virtual {v4, v7, v8}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 389
    const-string v7, "SensorID"

    invoke-virtual {v0}, Lcom/belkin/rules/dbmigration/DeviceCombinationTable;->getSensorId()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v4, v7, v8}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 390
    const-string v7, "SensorGroupID"

    const/4 v8, 0x0

    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v8

    invoke-virtual {v4, v7, v8}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 391
    const-string v7, "DeviceID"

    invoke-virtual {v0}, Lcom/belkin/rules/dbmigration/DeviceCombinationTable;->getDeviceId()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v4, v7, v8}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 392
    const-string v7, "DeviceGroupID"

    const/4 v8, 0x0

    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v8

    invoke-virtual {v4, v7, v8}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 394
    iget-object v7, p0, Lcom/belkin/rules/dbmigration/RuleDatabaseManager;->mSqlDatabase:Landroid/database/sqlite/SQLiteDatabase;

    const-string v8, "DEVICECOMBINATION"

    const/4 v9, 0x0

    invoke-virtual {v7, v8, v9, v4}, Landroid/database/sqlite/SQLiteDatabase;->insertOrThrow(Ljava/lang/String;Ljava/lang/String;Landroid/content/ContentValues;)J

    .line 384
    add-int/lit8 v3, v3, 0x1

    goto :goto_2

    .line 398
    .end local v0    # "deviceCombinationTable":Lcom/belkin/rules/dbmigration/DeviceCombinationTable;
    :cond_2
    iget-object v7, p0, Lcom/belkin/rules/dbmigration/RuleDatabaseManager;->mSqlDatabase:Landroid/database/sqlite/SQLiteDatabase;

    invoke-virtual {v7}, Landroid/database/sqlite/SQLiteDatabase;->setTransactionSuccessful()V
    :try_end_0
    .catch Landroid/database/SQLException; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 404
    iget-object v7, p0, Lcom/belkin/rules/dbmigration/RuleDatabaseManager;->mSqlDatabase:Landroid/database/sqlite/SQLiteDatabase;

    invoke-virtual {v7}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    .line 406
    .end local v3    # "i":I
    .end local v4    # "newEntry":Landroid/content/ContentValues;
    :goto_3
    return v5

    .line 400
    :catch_0
    move-exception v2

    .line 401
    .local v2, "e":Landroid/database/SQLException;
    :try_start_1
    invoke-virtual {v2}, Landroid/database/SQLException;->printStackTrace()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 402
    const/4 v5, 0x0

    .line 404
    iget-object v7, p0, Lcom/belkin/rules/dbmigration/RuleDatabaseManager;->mSqlDatabase:Landroid/database/sqlite/SQLiteDatabase;

    invoke-virtual {v7}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    goto :goto_3

    .end local v2    # "e":Landroid/database/SQLException;
    :catchall_0
    move-exception v7

    iget-object v8, p0, Lcom/belkin/rules/dbmigration/RuleDatabaseManager;->mSqlDatabase:Landroid/database/sqlite/SQLiteDatabase;

    invoke-virtual {v8}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    throw v7
.end method

.method public openDBForOperations()V
    .locals 3

    .prologue
    .line 318
    iget-object v1, p0, Lcom/belkin/rules/dbmigration/RuleDatabaseManager;->mSqlDatabase:Landroid/database/sqlite/SQLiteDatabase;

    if-eqz v1, :cond_0

    iget-object v1, p0, Lcom/belkin/rules/dbmigration/RuleDatabaseManager;->mSqlDatabase:Landroid/database/sqlite/SQLiteDatabase;

    invoke-virtual {v1}, Landroid/database/sqlite/SQLiteDatabase;->isOpen()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 320
    :try_start_0
    sget-object v1, Lcom/belkin/rules/dbmigration/RuleDatabaseManager;->mDBMgrinstance:Lcom/belkin/rules/dbmigration/RuleDatabaseManager;

    sget-object v2, Lcom/belkin/rules/dbmigration/RuleDatabaseManager;->mDBMgrinstance:Lcom/belkin/rules/dbmigration/RuleDatabaseManager;

    iget-object v2, v2, Lcom/belkin/rules/dbmigration/RuleDatabaseManager;->mDBOpenHelper:Lcom/belkin/rules/dbmigration/RuleDatabaseManager$OpenHelper;

    invoke-virtual {v2}, Lcom/belkin/rules/dbmigration/RuleDatabaseManager$OpenHelper;->getWritableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v2

    iput-object v2, v1, Lcom/belkin/rules/dbmigration/RuleDatabaseManager;->mSqlDatabase:Landroid/database/sqlite/SQLiteDatabase;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 326
    :cond_0
    :goto_0
    return-void

    .line 322
    :catch_0
    move-exception v0

    .line 323
    .local v0, "e":Ljava/lang/Exception;
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_0
.end method
