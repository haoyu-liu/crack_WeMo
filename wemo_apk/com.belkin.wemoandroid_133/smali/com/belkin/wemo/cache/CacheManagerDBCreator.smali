.class public Lcom/belkin/wemo/cache/CacheManagerDBCreator;
.super Landroid/database/sqlite/SQLiteOpenHelper;
.source "CacheManagerDBCreator.java"


# static fields
.field private static final CACHE_DEVICES_ADD_COLUMNS_VER_TWO:[Ljava/lang/String;

.field private static final CREATE_TABLE_CACHE_DEVICES:Ljava/lang/String; = "CREATE TABLE cache_devices(id INTEGER PRIMARY KEY,udn TEXT,type TEXT,friendlyName TEXT,icon TEXT,iconVersion TEXT,state INTEGER,attributeList TEXT,inactive INTEGER,isDiscovered TEXT,ssid TEXT,modelName TEXT,customizedState TEXT,firmwareVersion TEXT,info TEXT,html TEXT,fwstatus INTEGER,lastSeen TEXT,lastTS TEXT,hide INTEGER,bridgeUDN TEXT,manufacturerName TEXT,wemoCertified TEXT,productType TEXT,productName TEXT,capabilityIDs TEXT,currentState TEXT,mac TEXT,hwVersion TEXT,statusTS INTEGER,groupID TEXT,groupName TEXT,groupIcon TEXT,rulesDBVersion INTEGER,parentExternalId TEXT,parentName TEXT)"

.field private static final CREATE_TABLE_CACHE_DISCOVERY_HIT:Ljava/lang/String; = "CREATE TABLE cache_discovery_hit(id INTEGER PRIMARY KEY,udn TEXT,datetime DATETIME,hit INTEGER,remote INTEGER)"

.field private static final CREATE_TABLE_CACHE_DISCOVERY_HIT_ZIGBEE:Ljava/lang/String; = "CREATE TABLE cache_discovery_hit_zigbee(id INTEGER PRIMARY KEY,bridgeUDN TEXT,uniqueID TEXT,datetime DATETIME,hit INTEGER, remote INTEGER)"

.field private static final CREATE_TABLE_CACHE_DISCOVERY_STAT:Ljava/lang/String; = "CREATE TABLE cache_discovery_stat(id INTEGER PRIMARY KEY,udn TEXT,datetime DATETIME,time INTEGER,status INTEGER,remote INTEGER)"

.field private static final CREATE_TABLE_CACHE_DISCOVERY_STAT_ZIGBEE:Ljava/lang/String; = "CREATE TABLE cache_discovery_stat_zigbee(id INTEGER PRIMARY KEY,bridgeUDN TEXT,uniqueID TEXT,datetime DATETIME,time INTEGER,status INTEGER, remote INTEGER)"

.field private static final CREATE_TABLE_CACHE_LOCAL:Ljava/lang/String; = "CREATE TABLE cache_local(id INTEGER PRIMARY KEY,udn TEXT,IP TEXT,port INTEGER)"

.field private static final CREATE_TABLE_CACHE_LOCATIONS:Ljava/lang/String; = "CREATE TABLE cache_locations(id INTEGER PRIMARY KEY,homeID TEXT,currentHomeID TEXT,locationName TEXT,rulesDB TEXT)"

.field private static final CREATE_TABLE_CACHE_LOCATION_ARPMACS:Ljava/lang/String; = "CREATE TABLE cache_location_arpmacs(id INTEGER PRIMARY KEY,homeID TEXT,arpMac TEXT)"

.field private static final CREATE_TABLE_CACHE_LOCATION_DEVICES:Ljava/lang/String; = "CREATE TABLE cache_location_devices(id INTEGER PRIMARY KEY,homeID TEXT,udn TEXT,type TEXT,friendlyName TEXT)"

.field private static final CREATE_TABLE_CACHE_LOCATION_SSIDS:Ljava/lang/String; = "CREATE TABLE cache_location_ssids(id INTEGER PRIMARY KEY,homeID TEXT,ssid TEXT)"

.field private static final CREATE_TABLE_CACHE_REMOTE:Ljava/lang/String; = "CREATE TABLE cache_remote(id INTEGER PRIMARY KEY,udn TEXT,homeID TEXT,mac TEXT,pluginID TEXT)"

.field private static final CREATE_TABLE_CACHE_ZIGBEE:Ljava/lang/String; = "CREATE TABLE cache_zigbee(id INTEGER PRIMARY KEY,bridgeUDN TEXT,uniqueID TEXT,state INTEGER,capabilities TEXT,icon TEXT,groupID INTEGER,groupName TEXT,groupCapability TEXT,firmwareVersion TEXT,modelName TEXT, friendlyName TEXT,manufacturerName TEXT,wemoCertified TEXT, uploadId TEXT)"

.field private static final CREATE_TABLE_SENSOR_EVENT_HISTORY:Ljava/lang/String; = "CREATE TABLE Event_History(deviceId TEXT,startTime TEXT,endTime TEXT,capabilityId TEXT,currentValue TEXT,statusTS TEXT,status TEXT,message TEXT,productName TEXT,eventIcon TEXT,eventState TEXT,modelCode TEXT,eventID TEXT PRIMARY KEY)"

.field private static dbCreator:Lcom/belkin/wemo/cache/CacheManagerDBCreator;


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .prologue
    .line 80
    const/4 v0, 0x2

    new-array v0, v0, [Ljava/lang/String;

    const/4 v1, 0x0

    const-string v2, "parentExternalId"

    aput-object v2, v0, v1

    const/4 v1, 0x1

    const-string v2, "parentName"

    aput-object v2, v0, v1

    sput-object v0, Lcom/belkin/wemo/cache/CacheManagerDBCreator;->CACHE_DEVICES_ADD_COLUMNS_VER_TWO:[Ljava/lang/String;

    .line 87
    const/4 v0, 0x0

    sput-object v0, Lcom/belkin/wemo/cache/CacheManagerDBCreator;->dbCreator:Lcom/belkin/wemo/cache/CacheManagerDBCreator;

    return-void
.end method

.method private constructor <init>(Landroid/content/Context;)V
    .locals 3
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 90
    const-string v0, "cache.db"

    const/4 v1, 0x0

    const/4 v2, 0x2

    invoke-direct {p0, p1, v0, v1, v2}, Landroid/database/sqlite/SQLiteOpenHelper;-><init>(Landroid/content/Context;Ljava/lang/String;Landroid/database/sqlite/SQLiteDatabase$CursorFactory;I)V

    .line 91
    return-void
.end method

.method private alterTableCacheDevices(Landroid/database/sqlite/SQLiteDatabase;)V
    .locals 2
    .param p1, "db"    # Landroid/database/sqlite/SQLiteDatabase;

    .prologue
    .line 158
    const-string v0, "cache_devices"

    sget-object v1, Lcom/belkin/wemo/cache/CacheManagerDBCreator;->CACHE_DEVICES_ADD_COLUMNS_VER_TWO:[Ljava/lang/String;

    invoke-direct {p0, p1, v0, v1}, Lcom/belkin/wemo/cache/CacheManagerDBCreator;->checkIfColumnsExist(Landroid/database/sqlite/SQLiteDatabase;Ljava/lang/String;[Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 159
    const-string v0, "Nest: "

    const-string v1, "alterTableCacheDevices column does not exists"

    invoke-static {v0, v1}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 160
    const-string v0, "ALTER TABLE cache_devices ADD COLUMN parentExternalId TEXT;"

    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 162
    const-string v0, "ALTER TABLE cache_devices ADD COLUMN parentName TEXT;"

    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 165
    :cond_0
    return-void
.end method

.method private checkIfColumnsExist(Landroid/database/sqlite/SQLiteDatabase;Ljava/lang/String;[Ljava/lang/String;)Z
    .locals 12
    .param p1, "db"    # Landroid/database/sqlite/SQLiteDatabase;
    .param p2, "tableName"    # Ljava/lang/String;
    .param p3, "columns"    # [Ljava/lang/String;

    .prologue
    const/4 v2, 0x0

    .line 169
    move-object v0, p1

    move-object v1, p2

    move-object v3, v2

    move-object v4, v2

    move-object v5, v2

    move-object v6, v2

    move-object v7, v2

    invoke-virtual/range {v0 .. v7}, Landroid/database/sqlite/SQLiteDatabase;->query(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v9

    .line 170
    .local v9, "cur":Landroid/database/Cursor;
    invoke-interface {v9}, Landroid/database/Cursor;->getColumnNames()[Ljava/lang/String;

    move-result-object v11

    .line 171
    .local v11, "dbColumns":[Ljava/lang/String;
    new-instance v10, Ljava/util/HashSet;

    invoke-static {v11}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v0

    invoke-direct {v10, v0}, Ljava/util/HashSet;-><init>(Ljava/util/Collection;)V

    .line 173
    .local v10, "dbColumnNameSet":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/String;>;"
    new-instance v8, Ljava/util/HashSet;

    invoke-static {p3}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v0

    invoke-direct {v8, v0}, Ljava/util/HashSet;-><init>(Ljava/util/Collection;)V

    .line 175
    .local v8, "columnsToFindSet":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/String;>;"
    invoke-interface {v8, v10}, Ljava/util/Set;->removeAll(Ljava/util/Collection;)Z

    .line 177
    invoke-interface {v8}, Ljava/util/Set;->size()I

    move-result v0

    if-gtz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public static declared-synchronized getInstance(Landroid/content/Context;)Lcom/belkin/wemo/cache/CacheManagerDBCreator;
    .locals 2
    .param p0, "context"    # Landroid/content/Context;

    .prologue
    .line 94
    const-class v1, Lcom/belkin/wemo/cache/CacheManagerDBCreator;

    monitor-enter v1

    :try_start_0
    sget-object v0, Lcom/belkin/wemo/cache/CacheManagerDBCreator;->dbCreator:Lcom/belkin/wemo/cache/CacheManagerDBCreator;

    if-nez v0, :cond_0

    .line 95
    new-instance v0, Lcom/belkin/wemo/cache/CacheManagerDBCreator;

    invoke-direct {v0, p0}, Lcom/belkin/wemo/cache/CacheManagerDBCreator;-><init>(Landroid/content/Context;)V

    sput-object v0, Lcom/belkin/wemo/cache/CacheManagerDBCreator;->dbCreator:Lcom/belkin/wemo/cache/CacheManagerDBCreator;

    .line 97
    :cond_0
    sget-object v0, Lcom/belkin/wemo/cache/CacheManagerDBCreator;->dbCreator:Lcom/belkin/wemo/cache/CacheManagerDBCreator;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit v1

    return-object v0

    .line 94
    :catchall_0
    move-exception v0

    monitor-exit v1

    throw v0
.end method


# virtual methods
.method public Nest_Changes(Landroid/database/sqlite/SQLiteDatabase;)V
    .locals 0
    .param p1, "db"    # Landroid/database/sqlite/SQLiteDatabase;

    .prologue
    .line 154
    invoke-direct {p0, p1}, Lcom/belkin/wemo/cache/CacheManagerDBCreator;->alterTableCacheDevices(Landroid/database/sqlite/SQLiteDatabase;)V

    .line 155
    return-void
.end method

.method public onCreate(Landroid/database/sqlite/SQLiteDatabase;)V
    .locals 2
    .param p1, "db"    # Landroid/database/sqlite/SQLiteDatabase;

    .prologue
    .line 103
    const-string v0, "Nest: "

    const-string v1, "ON CREATE of DB called"

    invoke-static {v0, v1}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 105
    const-string v0, "CREATE TABLE cache_local(id INTEGER PRIMARY KEY,udn TEXT,IP TEXT,port INTEGER)"

    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 106
    const-string v0, "CREATE TABLE cache_remote(id INTEGER PRIMARY KEY,udn TEXT,homeID TEXT,mac TEXT,pluginID TEXT)"

    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 107
    const-string v0, "CREATE TABLE cache_devices(id INTEGER PRIMARY KEY,udn TEXT,type TEXT,friendlyName TEXT,icon TEXT,iconVersion TEXT,state INTEGER,attributeList TEXT,inactive INTEGER,isDiscovered TEXT,ssid TEXT,modelName TEXT,customizedState TEXT,firmwareVersion TEXT,info TEXT,html TEXT,fwstatus INTEGER,lastSeen TEXT,lastTS TEXT,hide INTEGER,bridgeUDN TEXT,manufacturerName TEXT,wemoCertified TEXT,productType TEXT,productName TEXT,capabilityIDs TEXT,currentState TEXT,mac TEXT,hwVersion TEXT,statusTS INTEGER,groupID TEXT,groupName TEXT,groupIcon TEXT,rulesDBVersion INTEGER,parentExternalId TEXT,parentName TEXT)"

    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 108
    const-string v0, "CREATE TABLE cache_zigbee(id INTEGER PRIMARY KEY,bridgeUDN TEXT,uniqueID TEXT,state INTEGER,capabilities TEXT,icon TEXT,groupID INTEGER,groupName TEXT,groupCapability TEXT,firmwareVersion TEXT,modelName TEXT, friendlyName TEXT,manufacturerName TEXT,wemoCertified TEXT, uploadId TEXT)"

    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 109
    const-string v0, "CREATE TABLE cache_discovery_stat(id INTEGER PRIMARY KEY,udn TEXT,datetime DATETIME,time INTEGER,status INTEGER,remote INTEGER)"

    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 110
    const-string v0, "CREATE TABLE cache_discovery_stat_zigbee(id INTEGER PRIMARY KEY,bridgeUDN TEXT,uniqueID TEXT,datetime DATETIME,time INTEGER,status INTEGER, remote INTEGER)"

    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 111
    const-string v0, "CREATE TABLE cache_discovery_hit(id INTEGER PRIMARY KEY,udn TEXT,datetime DATETIME,hit INTEGER,remote INTEGER)"

    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 112
    const-string v0, "CREATE TABLE cache_discovery_hit_zigbee(id INTEGER PRIMARY KEY,bridgeUDN TEXT,uniqueID TEXT,datetime DATETIME,hit INTEGER, remote INTEGER)"

    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 113
    const-string v0, "CREATE TABLE cache_locations(id INTEGER PRIMARY KEY,homeID TEXT,currentHomeID TEXT,locationName TEXT,rulesDB TEXT)"

    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 114
    const-string v0, "CREATE TABLE cache_location_arpmacs(id INTEGER PRIMARY KEY,homeID TEXT,arpMac TEXT)"

    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 115
    const-string v0, "CREATE TABLE cache_location_ssids(id INTEGER PRIMARY KEY,homeID TEXT,ssid TEXT)"

    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 116
    const-string v0, "CREATE TABLE cache_location_devices(id INTEGER PRIMARY KEY,homeID TEXT,udn TEXT,type TEXT,friendlyName TEXT)"

    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 117
    const-string v0, "CREATE TABLE Event_History(deviceId TEXT,startTime TEXT,endTime TEXT,capabilityId TEXT,currentValue TEXT,statusTS TEXT,status TEXT,message TEXT,productName TEXT,eventIcon TEXT,eventState TEXT,modelCode TEXT,eventID TEXT PRIMARY KEY)"

    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 119
    return-void
.end method

.method public onDowngrade(Landroid/database/sqlite/SQLiteDatabase;II)V
    .locals 0
    .param p1, "db"    # Landroid/database/sqlite/SQLiteDatabase;
    .param p2, "oldVersion"    # I
    .param p3, "newVersion"    # I

    .prologue
    .line 183
    invoke-virtual {p0, p1, p2, p3}, Lcom/belkin/wemo/cache/CacheManagerDBCreator;->onUpgrade(Landroid/database/sqlite/SQLiteDatabase;II)V

    .line 184
    return-void
.end method

.method public onUpgrade(Landroid/database/sqlite/SQLiteDatabase;II)V
    .locals 2
    .param p1, "db"    # Landroid/database/sqlite/SQLiteDatabase;
    .param p2, "oldVersion"    # I
    .param p3, "newVersion"    # I

    .prologue
    .line 123
    const-string v0, "Nest: "

    const-string v1, "ON UPGRADE of DB called"

    invoke-static {v0, v1}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 140
    packed-switch p2, :pswitch_data_0

    .line 150
    :goto_0
    return-void

    .line 143
    :pswitch_0
    const-string v0, "Nest: "

    const-string v1, "ON UPGRADE of DB called case 2"

    invoke-static {v0, v1}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 144
    invoke-virtual {p0, p1}, Lcom/belkin/wemo/cache/CacheManagerDBCreator;->Nest_Changes(Landroid/database/sqlite/SQLiteDatabase;)V

    goto :goto_0

    .line 140
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
    .end packed-switch
.end method
