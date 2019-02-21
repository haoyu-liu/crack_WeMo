.class public Lcom/belkin/wemo/cache/location/CacheLocationsManager;
.super Ljava/lang/Object;
.source "CacheLocationsManager.java"


# static fields
.field private static cacheManager:Lcom/belkin/wemo/cache/location/CacheLocationsManager;


# instance fields
.field private dbCreator:Lcom/belkin/wemo/cache/CacheManagerDBCreator;

.field private locationsByHomeIdMap:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Lcom/belkin/wemo/cache/location/Location;",
            ">;"
        }
    .end annotation
.end field

.field private locationsFromMemory:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set",
            "<",
            "Lcom/belkin/wemo/cache/location/Location;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 25
    const/4 v0, 0x0

    sput-object v0, Lcom/belkin/wemo/cache/location/CacheLocationsManager;->cacheManager:Lcom/belkin/wemo/cache/location/CacheLocationsManager;

    return-void
.end method

.method private constructor <init>(Landroid/content/Context;)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    const/4 v0, 0x0

    .line 35
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 29
    iput-object v0, p0, Lcom/belkin/wemo/cache/location/CacheLocationsManager;->dbCreator:Lcom/belkin/wemo/cache/CacheManagerDBCreator;

    .line 30
    iput-object v0, p0, Lcom/belkin/wemo/cache/location/CacheLocationsManager;->locationsByHomeIdMap:Ljava/util/HashMap;

    .line 31
    iput-object v0, p0, Lcom/belkin/wemo/cache/location/CacheLocationsManager;->locationsFromMemory:Ljava/util/Set;

    .line 36
    invoke-static {p1}, Lcom/belkin/wemo/cache/CacheManagerDBCreator;->getInstance(Landroid/content/Context;)Lcom/belkin/wemo/cache/CacheManagerDBCreator;

    move-result-object v0

    iput-object v0, p0, Lcom/belkin/wemo/cache/location/CacheLocationsManager;->dbCreator:Lcom/belkin/wemo/cache/CacheManagerDBCreator;

    .line 37
    invoke-virtual {p0}, Lcom/belkin/wemo/cache/location/CacheLocationsManager;->updateLocationMap()V

    .line 38
    return-void
.end method

.method private deleteLocationFromMemory(Ljava/lang/String;)V
    .locals 3
    .param p1, "locationHomeId"    # Ljava/lang/String;

    .prologue
    .line 128
    iget-object v2, p0, Lcom/belkin/wemo/cache/location/CacheLocationsManager;->locationsByHomeIdMap:Ljava/util/HashMap;

    invoke-virtual {v2, p1}, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 129
    iget-object v2, p0, Lcom/belkin/wemo/cache/location/CacheLocationsManager;->locationsFromMemory:Ljava/util/Set;

    invoke-interface {v2}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "iterator":Ljava/util/Iterator;, "Ljava/util/Iterator<Lcom/belkin/wemo/cache/location/Location;>;"
    :cond_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    .line 130
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/belkin/wemo/cache/location/Location;

    .line 131
    .local v1, "l":Lcom/belkin/wemo/cache/location/Location;
    invoke-virtual {v1}, Lcom/belkin/wemo/cache/location/Location;->getHomeId()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 133
    iget-object v2, p0, Lcom/belkin/wemo/cache/location/CacheLocationsManager;->locationsFromMemory:Ljava/util/Set;

    invoke-interface {v2, v1}, Ljava/util/Set;->remove(Ljava/lang/Object;)Z

    .line 137
    .end local v1    # "l":Lcom/belkin/wemo/cache/location/Location;
    :cond_1
    return-void
.end method

.method private getDeviceFromCacheLocationDevicesTableCursor(Landroid/database/Cursor;)Lcom/belkin/wemo/cache/data/DeviceInformation;
    .locals 4
    .param p1, "cursor"    # Landroid/database/Cursor;

    .prologue
    .line 267
    new-instance v0, Lcom/belkin/wemo/cache/data/DeviceInformation;

    const-string v1, "udn"

    invoke-interface {p1, v1}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v1

    invoke-interface {p1, v1}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v1

    const/4 v2, 0x0

    const/4 v3, 0x0

    invoke-direct {v0, v1, v2, v3}, Lcom/belkin/wemo/cache/data/DeviceInformation;-><init>(Ljava/lang/String;Ljava/lang/String;I)V

    .line 268
    .local v0, "devInfo":Lcom/belkin/wemo/cache/data/DeviceInformation;
    const-string v1, "type"

    invoke-interface {p1, v1}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v1

    invoke-interface {p1, v1}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/belkin/wemo/cache/data/DeviceInformation;->setFriendlyName(Ljava/lang/String;)V

    .line 269
    const-string v1, "friendlyName"

    invoke-interface {p1, v1}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v1

    invoke-interface {p1, v1}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/belkin/wemo/cache/data/DeviceInformation;->setFriendlyName(Ljava/lang/String;)V

    .line 270
    const-string v1, "id"

    invoke-interface {p1, v1}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v1

    invoke-interface {p1, v1}, Landroid/database/Cursor;->getInt(I)I

    move-result v1

    invoke-virtual {v0, v1}, Lcom/belkin/wemo/cache/data/DeviceInformation;->setID(I)V

    .line 271
    return-object v0
.end method

.method public static getInstance(Landroid/content/Context;)Lcom/belkin/wemo/cache/location/CacheLocationsManager;
    .locals 1
    .param p0, "context"    # Landroid/content/Context;

    .prologue
    .line 59
    sget-object v0, Lcom/belkin/wemo/cache/location/CacheLocationsManager;->cacheManager:Lcom/belkin/wemo/cache/location/CacheLocationsManager;

    if-nez v0, :cond_0

    .line 60
    new-instance v0, Lcom/belkin/wemo/cache/location/CacheLocationsManager;

    invoke-direct {v0, p0}, Lcom/belkin/wemo/cache/location/CacheLocationsManager;-><init>(Landroid/content/Context;)V

    sput-object v0, Lcom/belkin/wemo/cache/location/CacheLocationsManager;->cacheManager:Lcom/belkin/wemo/cache/location/CacheLocationsManager;

    .line 62
    :cond_0
    sget-object v0, Lcom/belkin/wemo/cache/location/CacheLocationsManager;->cacheManager:Lcom/belkin/wemo/cache/location/CacheLocationsManager;

    return-object v0
.end method

.method private getLocationArpMacsFromDB(Ljava/lang/String;)Ljava/util/Set;
    .locals 6
    .param p1, "homeId"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/Set",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    .line 204
    iget-object v4, p0, Lcom/belkin/wemo/cache/location/CacheLocationsManager;->dbCreator:Lcom/belkin/wemo/cache/CacheManagerDBCreator;

    invoke-virtual {v4}, Lcom/belkin/wemo/cache/CacheManagerDBCreator;->getReadableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v3

    .line 205
    .local v3, "sqlDatabase":Landroid/database/sqlite/SQLiteDatabase;
    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    .line 207
    .local v0, "arpMacs":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/String;>;"
    invoke-virtual {v3}, Landroid/database/sqlite/SQLiteDatabase;->beginTransaction()V

    .line 209
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "SELECT * FROM cache_location_arpmacs WHERE homeID=\'"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, "\'"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    .line 210
    .local v2, "selectQuery":Ljava/lang/String;
    const/4 v4, 0x0

    invoke-virtual {v3, v2, v4}, Landroid/database/sqlite/SQLiteDatabase;->rawQuery(Ljava/lang/String;[Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v1

    .line 211
    .local v1, "cursor":Landroid/database/Cursor;
    invoke-interface {v1}, Landroid/database/Cursor;->moveToFirst()Z

    .line 212
    :goto_0
    invoke-interface {v1}, Landroid/database/Cursor;->isAfterLast()Z

    move-result v4

    if-nez v4, :cond_0

    .line 213
    const-string v4, "arpMac"

    invoke-interface {v1, v4}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v4

    invoke-interface {v1, v4}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v4

    invoke-interface {v0, v4}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 214
    invoke-interface {v1}, Landroid/database/Cursor;->moveToNext()Z

    goto :goto_0

    .line 216
    :cond_0
    invoke-interface {v1}, Landroid/database/Cursor;->close()V

    .line 217
    invoke-virtual {v3}, Landroid/database/sqlite/SQLiteDatabase;->setTransactionSuccessful()V

    .line 218
    invoke-virtual {v3}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    .line 219
    return-object v0
.end method

.method private getLocationDeviceListFromDB(Ljava/lang/String;)Ljava/util/Set;
    .locals 7
    .param p1, "homeId"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/Set",
            "<",
            "Lcom/belkin/wemo/cache/data/DeviceInformation;",
            ">;"
        }
    .end annotation

    .prologue
    .line 240
    iget-object v5, p0, Lcom/belkin/wemo/cache/location/CacheLocationsManager;->dbCreator:Lcom/belkin/wemo/cache/CacheManagerDBCreator;

    invoke-virtual {v5}, Lcom/belkin/wemo/cache/CacheManagerDBCreator;->getReadableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v4

    .line 241
    .local v4, "sqlDatabase":Landroid/database/sqlite/SQLiteDatabase;
    new-instance v2, Ljava/util/HashSet;

    invoke-direct {v2}, Ljava/util/HashSet;-><init>()V

    .line 243
    .local v2, "devInfos":Ljava/util/Set;, "Ljava/util/Set<Lcom/belkin/wemo/cache/data/DeviceInformation;>;"
    invoke-virtual {v4}, Landroid/database/sqlite/SQLiteDatabase;->beginTransaction()V

    .line 245
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "SELECT * FROM cache_location_devices WHERE homeID=\'"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, "\'"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    .line 246
    .local v3, "selectQuery":Ljava/lang/String;
    const/4 v5, 0x0

    invoke-virtual {v4, v3, v5}, Landroid/database/sqlite/SQLiteDatabase;->rawQuery(Ljava/lang/String;[Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v0

    .line 247
    .local v0, "cursor":Landroid/database/Cursor;
    invoke-interface {v0}, Landroid/database/Cursor;->moveToFirst()Z

    .line 248
    :goto_0
    invoke-interface {v0}, Landroid/database/Cursor;->isAfterLast()Z

    move-result v5

    if-nez v5, :cond_0

    .line 249
    invoke-direct {p0, v0}, Lcom/belkin/wemo/cache/location/CacheLocationsManager;->getDeviceFromCacheLocationDevicesTableCursor(Landroid/database/Cursor;)Lcom/belkin/wemo/cache/data/DeviceInformation;

    move-result-object v1

    .line 250
    .local v1, "devInfo":Lcom/belkin/wemo/cache/data/DeviceInformation;
    invoke-interface {v2, v1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 251
    invoke-interface {v0}, Landroid/database/Cursor;->moveToNext()Z

    goto :goto_0

    .line 253
    .end local v1    # "devInfo":Lcom/belkin/wemo/cache/data/DeviceInformation;
    :cond_0
    invoke-interface {v0}, Landroid/database/Cursor;->close()V

    .line 254
    invoke-virtual {v4}, Landroid/database/sqlite/SQLiteDatabase;->setTransactionSuccessful()V

    .line 255
    invoke-virtual {v4}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    .line 256
    return-object v2
.end method

.method private getLocationFromCacheLocationTableCursor(Landroid/database/Cursor;)Lcom/belkin/wemo/cache/location/Location;
    .locals 3
    .param p1, "cursor"    # Landroid/database/Cursor;

    .prologue
    .line 260
    new-instance v0, Lcom/belkin/wemo/cache/location/Location;

    const-string v1, "homeID"

    invoke-interface {p1, v1}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v1

    invoke-interface {p1, v1}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v1

    const-string v2, "locationName"

    invoke-interface {p1, v2}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v2

    invoke-interface {p1, v2}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-direct {v0, v1, v2}, Lcom/belkin/wemo/cache/location/Location;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 263
    .local v0, "location":Lcom/belkin/wemo/cache/location/Location;
    const-string v1, "id"

    invoke-interface {p1, v1}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v1

    invoke-interface {p1, v1}, Landroid/database/Cursor;->getInt(I)I

    move-result v1

    invoke-virtual {v0, v1}, Lcom/belkin/wemo/cache/location/Location;->setID(I)V

    .line 264
    return-object v0
.end method

.method private getLocationSsidsFromDB(Ljava/lang/String;)Ljava/util/Set;
    .locals 6
    .param p1, "homeId"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/Set",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    .line 222
    iget-object v4, p0, Lcom/belkin/wemo/cache/location/CacheLocationsManager;->dbCreator:Lcom/belkin/wemo/cache/CacheManagerDBCreator;

    invoke-virtual {v4}, Lcom/belkin/wemo/cache/CacheManagerDBCreator;->getReadableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v2

    .line 223
    .local v2, "sqlDatabase":Landroid/database/sqlite/SQLiteDatabase;
    new-instance v3, Ljava/util/HashSet;

    invoke-direct {v3}, Ljava/util/HashSet;-><init>()V

    .line 225
    .local v3, "ssids":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/String;>;"
    invoke-virtual {v2}, Landroid/database/sqlite/SQLiteDatabase;->beginTransaction()V

    .line 227
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "SELECT * FROM cache_location_ssids WHERE homeID=\'"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, "\'"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 228
    .local v1, "selectQuery":Ljava/lang/String;
    const/4 v4, 0x0

    invoke-virtual {v2, v1, v4}, Landroid/database/sqlite/SQLiteDatabase;->rawQuery(Ljava/lang/String;[Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v0

    .line 229
    .local v0, "cursor":Landroid/database/Cursor;
    invoke-interface {v0}, Landroid/database/Cursor;->moveToFirst()Z

    .line 230
    :goto_0
    invoke-interface {v0}, Landroid/database/Cursor;->isAfterLast()Z

    move-result v4

    if-nez v4, :cond_0

    .line 231
    const-string v4, "ssid"

    invoke-interface {v0, v4}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v4

    invoke-interface {v0, v4}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v4

    invoke-interface {v3, v4}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 232
    invoke-interface {v0}, Landroid/database/Cursor;->moveToNext()Z

    goto :goto_0

    .line 234
    :cond_0
    invoke-interface {v0}, Landroid/database/Cursor;->close()V

    .line 235
    invoke-virtual {v2}, Landroid/database/sqlite/SQLiteDatabase;->setTransactionSuccessful()V

    .line 236
    invoke-virtual {v2}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    .line 237
    return-object v3
.end method

.method private setLocationArpMacForCacheLocationArpMacsDB(Ljava/lang/String;Ljava/lang/String;Landroid/content/ContentValues;)Landroid/content/ContentValues;
    .locals 1
    .param p1, "homeId"    # Ljava/lang/String;
    .param p2, "arpMac"    # Ljava/lang/String;
    .param p3, "value"    # Landroid/content/ContentValues;

    .prologue
    .line 279
    const-string v0, "homeID"

    invoke-virtual {p3, v0, p1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 280
    const-string v0, "arpMac"

    invoke-virtual {p3, v0, p2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 281
    return-object p3
.end method

.method private setLocationDeviceInfoForCacheLocationDevicesDB(Ljava/lang/String;Lcom/belkin/wemo/cache/data/DeviceInformation;Landroid/content/ContentValues;)Landroid/content/ContentValues;
    .locals 2
    .param p1, "homeId"    # Ljava/lang/String;
    .param p2, "devInfo"    # Lcom/belkin/wemo/cache/data/DeviceInformation;
    .param p3, "value"    # Landroid/content/ContentValues;

    .prologue
    .line 289
    const-string v0, "homeID"

    invoke-virtual {p3, v0, p1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 290
    const-string v0, "udn"

    invoke-virtual {p2}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getUDN()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p3, v0, v1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 291
    const-string v0, "type"

    invoke-virtual {p2}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getType()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p3, v0, v1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 292
    const-string v0, "friendlyName"

    invoke-virtual {p2}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getFriendlyName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p3, v0, v1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 293
    return-object p3
.end method

.method private setLocationInfoForCacheLocationsDB(Lcom/belkin/wemo/cache/location/Location;Landroid/content/ContentValues;)Landroid/content/ContentValues;
    .locals 2
    .param p1, "location"    # Lcom/belkin/wemo/cache/location/Location;
    .param p2, "value"    # Landroid/content/ContentValues;

    .prologue
    .line 274
    const-string v0, "homeID"

    invoke-virtual {p1}, Lcom/belkin/wemo/cache/location/Location;->getHomeId()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p2, v0, v1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 275
    const-string v0, "locationName"

    invoke-virtual {p1}, Lcom/belkin/wemo/cache/location/Location;->getName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p2, v0, v1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 276
    return-object p2
.end method

.method private setLocationSsidForCacheLocationSsidsDB(Ljava/lang/String;Ljava/lang/String;Landroid/content/ContentValues;)Landroid/content/ContentValues;
    .locals 1
    .param p1, "homeId"    # Ljava/lang/String;
    .param p2, "ssid"    # Ljava/lang/String;
    .param p3, "value"    # Landroid/content/ContentValues;

    .prologue
    .line 284
    const-string v0, "homeID"

    invoke-virtual {p3, v0, p1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 285
    const-string v0, "ssid"

    invoke-virtual {p3, v0, p2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 286
    return-object p3
.end method


# virtual methods
.method public addLocationToDB(Lcom/belkin/wemo/cache/location/Location;)Z
    .locals 14
    .param p1, "location"    # Lcom/belkin/wemo/cache/location/Location;

    .prologue
    .line 70
    const/4 v6, 0x1

    .line 71
    .local v6, "result":Z
    iget-object v9, p0, Lcom/belkin/wemo/cache/location/CacheLocationsManager;->dbCreator:Lcom/belkin/wemo/cache/CacheManagerDBCreator;

    invoke-virtual {v9}, Lcom/belkin/wemo/cache/CacheManagerDBCreator;->getWritableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v7

    .line 72
    .local v7, "sqlDatabase":Landroid/database/sqlite/SQLiteDatabase;
    invoke-virtual {v7}, Landroid/database/sqlite/SQLiteDatabase;->beginTransaction()V

    .line 74
    :try_start_0
    const-string v9, "cache_locations"

    const/4 v10, 0x0

    new-instance v11, Landroid/content/ContentValues;

    invoke-direct {v11}, Landroid/content/ContentValues;-><init>()V

    invoke-direct {p0, p1, v11}, Lcom/belkin/wemo/cache/location/CacheLocationsManager;->setLocationInfoForCacheLocationsDB(Lcom/belkin/wemo/cache/location/Location;Landroid/content/ContentValues;)Landroid/content/ContentValues;

    move-result-object v11

    invoke-virtual {v7, v9, v10, v11}, Landroid/database/sqlite/SQLiteDatabase;->insertOrThrow(Ljava/lang/String;Ljava/lang/String;Landroid/content/ContentValues;)J

    .line 77
    invoke-virtual {p1}, Lcom/belkin/wemo/cache/location/Location;->getArpMacs()Ljava/util/Set;

    move-result-object v0

    .line 78
    .local v0, "arpMacs":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/String;>;"
    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v5

    .local v5, "iterator":Ljava/util/Iterator;, "Ljava/util/Iterator<Ljava/lang/String;>;"
    :goto_0
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v9

    if-eqz v9, :cond_0

    .line 79
    const-string v10, "cache_location_arpmacs"

    const/4 v11, 0x0

    invoke-virtual {p1}, Lcom/belkin/wemo/cache/location/Location;->getHomeId()Ljava/lang/String;

    move-result-object v12

    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Ljava/lang/String;

    new-instance v13, Landroid/content/ContentValues;

    invoke-direct {v13}, Landroid/content/ContentValues;-><init>()V

    invoke-direct {p0, v12, v9, v13}, Lcom/belkin/wemo/cache/location/CacheLocationsManager;->setLocationArpMacForCacheLocationArpMacsDB(Ljava/lang/String;Ljava/lang/String;Landroid/content/ContentValues;)Landroid/content/ContentValues;

    move-result-object v9

    invoke-virtual {v7, v10, v11, v9}, Landroid/database/sqlite/SQLiteDatabase;->insertOrThrow(Ljava/lang/String;Ljava/lang/String;Landroid/content/ContentValues;)J
    :try_end_0
    .catch Landroid/database/SQLException; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_0

    .line 97
    .end local v0    # "arpMacs":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/String;>;"
    .end local v5    # "iterator":Ljava/util/Iterator;, "Ljava/util/Iterator<Ljava/lang/String;>;"
    :catch_0
    move-exception v3

    .line 98
    .local v3, "ex":Landroid/database/SQLException;
    :try_start_1
    invoke-virtual {v3}, Landroid/database/SQLException;->printStackTrace()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 99
    const/4 v6, 0x0

    .line 101
    invoke-virtual {v7}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    .line 103
    .end local v3    # "ex":Landroid/database/SQLException;
    :goto_1
    return v6

    .line 81
    .restart local v0    # "arpMacs":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/String;>;"
    .restart local v5    # "iterator":Ljava/util/Iterator;, "Ljava/util/Iterator<Ljava/lang/String;>;"
    :cond_0
    :try_start_2
    invoke-virtual {p1}, Lcom/belkin/wemo/cache/location/Location;->getSsids()Ljava/util/Set;

    move-result-object v8

    .line 82
    .local v8, "ssids":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/String;>;"
    invoke-interface {v8}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v5

    :goto_2
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v9

    if-eqz v9, :cond_1

    .line 83
    const-string v10, "cache_location_ssids"

    const/4 v11, 0x0

    invoke-virtual {p1}, Lcom/belkin/wemo/cache/location/Location;->getHomeId()Ljava/lang/String;

    move-result-object v12

    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Ljava/lang/String;

    new-instance v13, Landroid/content/ContentValues;

    invoke-direct {v13}, Landroid/content/ContentValues;-><init>()V

    invoke-direct {p0, v12, v9, v13}, Lcom/belkin/wemo/cache/location/CacheLocationsManager;->setLocationSsidForCacheLocationSsidsDB(Ljava/lang/String;Ljava/lang/String;Landroid/content/ContentValues;)Landroid/content/ContentValues;

    move-result-object v9

    invoke-virtual {v7, v10, v11, v9}, Landroid/database/sqlite/SQLiteDatabase;->insertOrThrow(Ljava/lang/String;Ljava/lang/String;Landroid/content/ContentValues;)J
    :try_end_2
    .catch Landroid/database/SQLException; {:try_start_2 .. :try_end_2} :catch_0
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    goto :goto_2

    .line 101
    .end local v0    # "arpMacs":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/String;>;"
    .end local v5    # "iterator":Ljava/util/Iterator;, "Ljava/util/Iterator<Ljava/lang/String;>;"
    .end local v8    # "ssids":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/String;>;"
    :catchall_0
    move-exception v9

    invoke-virtual {v7}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    throw v9

    .line 86
    .restart local v0    # "arpMacs":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/String;>;"
    .restart local v5    # "iterator":Ljava/util/Iterator;, "Ljava/util/Iterator<Ljava/lang/String;>;"
    .restart local v8    # "ssids":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/String;>;"
    :cond_1
    :try_start_3
    invoke-virtual {p1}, Lcom/belkin/wemo/cache/location/Location;->getDeviceList()Ljava/util/Set;

    move-result-object v2

    .line 87
    .local v2, "deviceList":Ljava/util/Set;, "Ljava/util/Set<Lcom/belkin/wemo/cache/data/DeviceInformation;>;"
    if-eqz v2, :cond_2

    .line 89
    invoke-interface {v2}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v4

    .local v4, "iterator":Ljava/util/Iterator;, "Ljava/util/Iterator<Lcom/belkin/wemo/cache/data/DeviceInformation;>;"
    :goto_3
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v9

    if-eqz v9, :cond_2

    .line 90
    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/belkin/wemo/cache/data/DeviceInformation;

    .line 91
    .local v1, "devInfo":Lcom/belkin/wemo/cache/data/DeviceInformation;
    const-string v9, "cache_location_devices"

    const/4 v10, 0x0

    invoke-virtual {p1}, Lcom/belkin/wemo/cache/location/Location;->getHomeId()Ljava/lang/String;

    move-result-object v11

    new-instance v12, Landroid/content/ContentValues;

    invoke-direct {v12}, Landroid/content/ContentValues;-><init>()V

    invoke-direct {p0, v11, v1, v12}, Lcom/belkin/wemo/cache/location/CacheLocationsManager;->setLocationDeviceInfoForCacheLocationDevicesDB(Ljava/lang/String;Lcom/belkin/wemo/cache/data/DeviceInformation;Landroid/content/ContentValues;)Landroid/content/ContentValues;

    move-result-object v11

    invoke-virtual {v7, v9, v10, v11}, Landroid/database/sqlite/SQLiteDatabase;->insertOrThrow(Ljava/lang/String;Ljava/lang/String;Landroid/content/ContentValues;)J

    goto :goto_3

    .line 94
    .end local v1    # "devInfo":Lcom/belkin/wemo/cache/data/DeviceInformation;
    .end local v4    # "iterator":Ljava/util/Iterator;, "Ljava/util/Iterator<Lcom/belkin/wemo/cache/data/DeviceInformation;>;"
    :cond_2
    invoke-virtual {v7}, Landroid/database/sqlite/SQLiteDatabase;->setTransactionSuccessful()V

    .line 95
    iget-object v9, p0, Lcom/belkin/wemo/cache/location/CacheLocationsManager;->locationsByHomeIdMap:Ljava/util/HashMap;

    invoke-virtual {p1}, Lcom/belkin/wemo/cache/location/Location;->getHomeId()Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v9, v10, p1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 96
    iget-object v9, p0, Lcom/belkin/wemo/cache/location/CacheLocationsManager;->locationsFromMemory:Ljava/util/Set;

    invoke-interface {v9, p1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z
    :try_end_3
    .catch Landroid/database/SQLException; {:try_start_3 .. :try_end_3} :catch_0
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 101
    invoke-virtual {v7}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    goto :goto_1
.end method

.method public deleteAllLocationFromDB()Z
    .locals 6

    .prologue
    .line 139
    const/4 v1, 0x1

    .line 140
    .local v1, "result":Z
    iget-object v3, p0, Lcom/belkin/wemo/cache/location/CacheLocationsManager;->dbCreator:Lcom/belkin/wemo/cache/CacheManagerDBCreator;

    invoke-virtual {v3}, Lcom/belkin/wemo/cache/CacheManagerDBCreator;->getWritableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v2

    .line 141
    .local v2, "sqlDatabase":Landroid/database/sqlite/SQLiteDatabase;
    invoke-virtual {v2}, Landroid/database/sqlite/SQLiteDatabase;->beginTransaction()V

    .line 143
    :try_start_0
    const-string v3, "cache_locations"

    const/4 v4, 0x0

    const/4 v5, 0x0

    invoke-virtual {v2, v3, v4, v5}, Landroid/database/sqlite/SQLiteDatabase;->delete(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)I

    .line 145
    const-string v3, "cache_location_arpmacs"

    const/4 v4, 0x0

    const/4 v5, 0x0

    invoke-virtual {v2, v3, v4, v5}, Landroid/database/sqlite/SQLiteDatabase;->delete(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)I

    .line 146
    const-string v3, "cache_location_ssids"

    const/4 v4, 0x0

    const/4 v5, 0x0

    invoke-virtual {v2, v3, v4, v5}, Landroid/database/sqlite/SQLiteDatabase;->delete(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)I

    .line 147
    const-string v3, "cache_location_devices"

    const/4 v4, 0x0

    const/4 v5, 0x0

    invoke-virtual {v2, v3, v4, v5}, Landroid/database/sqlite/SQLiteDatabase;->delete(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)I

    .line 148
    invoke-virtual {v2}, Landroid/database/sqlite/SQLiteDatabase;->setTransactionSuccessful()V

    .line 149
    iget-object v3, p0, Lcom/belkin/wemo/cache/location/CacheLocationsManager;->locationsByHomeIdMap:Ljava/util/HashMap;

    invoke-virtual {v3}, Ljava/util/HashMap;->clear()V

    .line 150
    iget-object v3, p0, Lcom/belkin/wemo/cache/location/CacheLocationsManager;->locationsFromMemory:Ljava/util/Set;

    invoke-interface {v3}, Ljava/util/Set;->clear()V
    :try_end_0
    .catch Landroid/database/SQLException; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 155
    invoke-virtual {v2}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    .line 157
    :goto_0
    return v1

    .line 151
    :catch_0
    move-exception v0

    .line 152
    .local v0, "ex":Landroid/database/SQLException;
    :try_start_1
    invoke-virtual {v0}, Landroid/database/SQLException;->printStackTrace()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 153
    const/4 v1, 0x0

    .line 155
    invoke-virtual {v2}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    goto :goto_0

    .end local v0    # "ex":Landroid/database/SQLException;
    :catchall_0
    move-exception v3

    invoke-virtual {v2}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    throw v3
.end method

.method public deleteLocationFromDB(Ljava/lang/String;)Z
    .locals 7
    .param p1, "locationHomeId"    # Ljava/lang/String;

    .prologue
    .line 106
    const/4 v1, 0x1

    .line 107
    .local v1, "result":Z
    iget-object v3, p0, Lcom/belkin/wemo/cache/location/CacheLocationsManager;->dbCreator:Lcom/belkin/wemo/cache/CacheManagerDBCreator;

    invoke-virtual {v3}, Lcom/belkin/wemo/cache/CacheManagerDBCreator;->getWritableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v2

    .line 108
    .local v2, "sqlDatabase":Landroid/database/sqlite/SQLiteDatabase;
    invoke-virtual {v2}, Landroid/database/sqlite/SQLiteDatabase;->beginTransaction()V

    .line 110
    :try_start_0
    const-string v3, "cache_locations"

    const-string v4, "homeID = ?"

    const/4 v5, 0x1

    new-array v5, v5, [Ljava/lang/String;

    const/4 v6, 0x0

    aput-object p1, v5, v6

    invoke-virtual {v2, v3, v4, v5}, Landroid/database/sqlite/SQLiteDatabase;->delete(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)I

    .line 113
    const-string v3, "cache_location_arpmacs"

    const-string v4, "homeID = ?"

    const/4 v5, 0x1

    new-array v5, v5, [Ljava/lang/String;

    const/4 v6, 0x0

    aput-object p1, v5, v6

    invoke-virtual {v2, v3, v4, v5}, Landroid/database/sqlite/SQLiteDatabase;->delete(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)I

    .line 114
    const-string v3, "cache_location_ssids"

    const-string v4, "homeID = ?"

    const/4 v5, 0x1

    new-array v5, v5, [Ljava/lang/String;

    const/4 v6, 0x0

    aput-object p1, v5, v6

    invoke-virtual {v2, v3, v4, v5}, Landroid/database/sqlite/SQLiteDatabase;->delete(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)I

    .line 115
    const-string v3, "cache_location_devices"

    const-string v4, "homeID = ?"

    const/4 v5, 0x1

    new-array v5, v5, [Ljava/lang/String;

    const/4 v6, 0x0

    aput-object p1, v5, v6

    invoke-virtual {v2, v3, v4, v5}, Landroid/database/sqlite/SQLiteDatabase;->delete(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)I

    .line 116
    invoke-virtual {v2}, Landroid/database/sqlite/SQLiteDatabase;->setTransactionSuccessful()V

    .line 117
    invoke-direct {p0, p1}, Lcom/belkin/wemo/cache/location/CacheLocationsManager;->deleteLocationFromMemory(Ljava/lang/String;)V
    :try_end_0
    .catch Landroid/database/SQLException; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 122
    invoke-virtual {v2}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    .line 124
    :goto_0
    return v1

    .line 118
    :catch_0
    move-exception v0

    .line 119
    .local v0, "ex":Landroid/database/SQLException;
    :try_start_1
    invoke-virtual {v0}, Landroid/database/SQLException;->printStackTrace()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 120
    const/4 v1, 0x0

    .line 122
    invoke-virtual {v2}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    goto :goto_0

    .end local v0    # "ex":Landroid/database/SQLException;
    :catchall_0
    move-exception v3

    invoke-virtual {v2}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    throw v3
.end method

.method public getLocationByHomeIdFromDB(Ljava/lang/String;)Lcom/belkin/wemo/cache/location/Location;
    .locals 6
    .param p1, "homeId"    # Ljava/lang/String;

    .prologue
    .line 160
    iget-object v4, p0, Lcom/belkin/wemo/cache/location/CacheLocationsManager;->dbCreator:Lcom/belkin/wemo/cache/CacheManagerDBCreator;

    invoke-virtual {v4}, Lcom/belkin/wemo/cache/CacheManagerDBCreator;->getReadableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v3

    .line 162
    .local v3, "sqlDatabase":Landroid/database/sqlite/SQLiteDatabase;
    invoke-virtual {v3}, Landroid/database/sqlite/SQLiteDatabase;->beginTransaction()V

    .line 163
    const/4 v1, 0x0

    .line 164
    .local v1, "location":Lcom/belkin/wemo/cache/location/Location;
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "SELECT * FROM cache_locations WHERE homeID=\'"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, "\'"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    .line 165
    .local v2, "selectQuery":Ljava/lang/String;
    const/4 v4, 0x0

    invoke-virtual {v3, v2, v4}, Landroid/database/sqlite/SQLiteDatabase;->rawQuery(Ljava/lang/String;[Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v0

    .line 166
    .local v0, "cursor":Landroid/database/Cursor;
    invoke-interface {v0}, Landroid/database/Cursor;->moveToFirst()Z

    .line 167
    :goto_0
    invoke-interface {v0}, Landroid/database/Cursor;->isAfterLast()Z

    move-result v4

    if-nez v4, :cond_0

    .line 168
    invoke-direct {p0, v0}, Lcom/belkin/wemo/cache/location/CacheLocationsManager;->getLocationFromCacheLocationTableCursor(Landroid/database/Cursor;)Lcom/belkin/wemo/cache/location/Location;

    move-result-object v1

    .line 169
    invoke-virtual {v1}, Lcom/belkin/wemo/cache/location/Location;->getHomeId()Ljava/lang/String;

    move-result-object v4

    invoke-direct {p0, v4}, Lcom/belkin/wemo/cache/location/CacheLocationsManager;->getLocationDeviceListFromDB(Ljava/lang/String;)Ljava/util/Set;

    move-result-object v4

    invoke-virtual {v1, v4}, Lcom/belkin/wemo/cache/location/Location;->setDeviceList(Ljava/util/Set;)V

    .line 170
    invoke-virtual {v1}, Lcom/belkin/wemo/cache/location/Location;->getHomeId()Ljava/lang/String;

    move-result-object v4

    invoke-direct {p0, v4}, Lcom/belkin/wemo/cache/location/CacheLocationsManager;->getLocationArpMacsFromDB(Ljava/lang/String;)Ljava/util/Set;

    move-result-object v4

    invoke-virtual {v1, v4}, Lcom/belkin/wemo/cache/location/Location;->setArpMacs(Ljava/util/Set;)V

    .line 171
    invoke-virtual {v1}, Lcom/belkin/wemo/cache/location/Location;->getHomeId()Ljava/lang/String;

    move-result-object v4

    invoke-direct {p0, v4}, Lcom/belkin/wemo/cache/location/CacheLocationsManager;->getLocationSsidsFromDB(Ljava/lang/String;)Ljava/util/Set;

    move-result-object v4

    invoke-virtual {v1, v4}, Lcom/belkin/wemo/cache/location/Location;->setSsids(Ljava/util/Set;)V

    .line 172
    invoke-interface {v0}, Landroid/database/Cursor;->moveToNext()Z

    goto :goto_0

    .line 174
    :cond_0
    invoke-interface {v0}, Landroid/database/Cursor;->close()V

    .line 175
    invoke-virtual {v3}, Landroid/database/sqlite/SQLiteDatabase;->setTransactionSuccessful()V

    .line 176
    invoke-virtual {v3}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    .line 178
    return-object v1
.end method

.method public getLocationListFromDB()Ljava/util/Set;
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Set",
            "<",
            "Lcom/belkin/wemo/cache/location/Location;",
            ">;"
        }
    .end annotation

    .prologue
    .line 181
    iget-object v5, p0, Lcom/belkin/wemo/cache/location/CacheLocationsManager;->dbCreator:Lcom/belkin/wemo/cache/CacheManagerDBCreator;

    invoke-virtual {v5}, Lcom/belkin/wemo/cache/CacheManagerDBCreator;->getReadableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v4

    .line 182
    .local v4, "sqlDatabase":Landroid/database/sqlite/SQLiteDatabase;
    new-instance v2, Ljava/util/HashSet;

    invoke-direct {v2}, Ljava/util/HashSet;-><init>()V

    .line 184
    .local v2, "locations":Ljava/util/Set;, "Ljava/util/Set<Lcom/belkin/wemo/cache/location/Location;>;"
    invoke-virtual {v4}, Landroid/database/sqlite/SQLiteDatabase;->beginTransaction()V

    .line 186
    const-string v3, "SELECT * FROM cache_locations"

    .line 187
    .local v3, "selectQuery":Ljava/lang/String;
    const/4 v5, 0x0

    invoke-virtual {v4, v3, v5}, Landroid/database/sqlite/SQLiteDatabase;->rawQuery(Ljava/lang/String;[Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v0

    .line 188
    .local v0, "cursor":Landroid/database/Cursor;
    invoke-interface {v0}, Landroid/database/Cursor;->moveToFirst()Z

    .line 189
    :goto_0
    invoke-interface {v0}, Landroid/database/Cursor;->isAfterLast()Z

    move-result v5

    if-nez v5, :cond_0

    .line 190
    invoke-direct {p0, v0}, Lcom/belkin/wemo/cache/location/CacheLocationsManager;->getLocationFromCacheLocationTableCursor(Landroid/database/Cursor;)Lcom/belkin/wemo/cache/location/Location;

    move-result-object v1

    .line 191
    .local v1, "location":Lcom/belkin/wemo/cache/location/Location;
    invoke-virtual {v1}, Lcom/belkin/wemo/cache/location/Location;->getHomeId()Ljava/lang/String;

    move-result-object v5

    invoke-direct {p0, v5}, Lcom/belkin/wemo/cache/location/CacheLocationsManager;->getLocationDeviceListFromDB(Ljava/lang/String;)Ljava/util/Set;

    move-result-object v5

    invoke-virtual {v1, v5}, Lcom/belkin/wemo/cache/location/Location;->setDeviceList(Ljava/util/Set;)V

    .line 192
    invoke-virtual {v1}, Lcom/belkin/wemo/cache/location/Location;->getHomeId()Ljava/lang/String;

    move-result-object v5

    invoke-direct {p0, v5}, Lcom/belkin/wemo/cache/location/CacheLocationsManager;->getLocationArpMacsFromDB(Ljava/lang/String;)Ljava/util/Set;

    move-result-object v5

    invoke-virtual {v1, v5}, Lcom/belkin/wemo/cache/location/Location;->setArpMacs(Ljava/util/Set;)V

    .line 193
    invoke-virtual {v1}, Lcom/belkin/wemo/cache/location/Location;->getHomeId()Ljava/lang/String;

    move-result-object v5

    invoke-direct {p0, v5}, Lcom/belkin/wemo/cache/location/CacheLocationsManager;->getLocationSsidsFromDB(Ljava/lang/String;)Ljava/util/Set;

    move-result-object v5

    invoke-virtual {v1, v5}, Lcom/belkin/wemo/cache/location/Location;->setSsids(Ljava/util/Set;)V

    .line 194
    invoke-interface {v2, v1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 195
    invoke-interface {v0}, Landroid/database/Cursor;->moveToNext()Z

    goto :goto_0

    .line 197
    .end local v1    # "location":Lcom/belkin/wemo/cache/location/Location;
    :cond_0
    invoke-interface {v0}, Landroid/database/Cursor;->close()V

    .line 198
    invoke-virtual {v4}, Landroid/database/sqlite/SQLiteDatabase;->setTransactionSuccessful()V

    .line 199
    invoke-virtual {v4}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    .line 201
    return-object v2
.end method

.method public getLocationsByHomeIdMap()Ljava/util/HashMap;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Lcom/belkin/wemo/cache/location/Location;",
            ">;"
        }
    .end annotation

    .prologue
    .line 296
    iget-object v0, p0, Lcom/belkin/wemo/cache/location/CacheLocationsManager;->locationsByHomeIdMap:Ljava/util/HashMap;

    return-object v0
.end method

.method public getLocationsFromMemory()Ljava/util/Set;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Set",
            "<",
            "Lcom/belkin/wemo/cache/location/Location;",
            ">;"
        }
    .end annotation

    .prologue
    .line 302
    iget-object v0, p0, Lcom/belkin/wemo/cache/location/CacheLocationsManager;->locationsFromMemory:Ljava/util/Set;

    return-object v0
.end method

.method public setLocationsByHomeIdMap(Ljava/util/HashMap;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Lcom/belkin/wemo/cache/location/Location;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 299
    .local p1, "locationsByHomeIdMap":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Lcom/belkin/wemo/cache/location/Location;>;"
    iput-object p1, p0, Lcom/belkin/wemo/cache/location/CacheLocationsManager;->locationsByHomeIdMap:Ljava/util/HashMap;

    .line 300
    return-void
.end method

.method public setLocationsFromMemory(Ljava/util/Set;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Set",
            "<",
            "Lcom/belkin/wemo/cache/location/Location;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 305
    .local p1, "locationsFromMemory":Ljava/util/Set;, "Ljava/util/Set<Lcom/belkin/wemo/cache/location/Location;>;"
    iput-object p1, p0, Lcom/belkin/wemo/cache/location/CacheLocationsManager;->locationsFromMemory:Ljava/util/Set;

    .line 306
    return-void
.end method

.method public updateLocationMap()V
    .locals 5

    .prologue
    .line 42
    :try_start_0
    iget-object v3, p0, Lcom/belkin/wemo/cache/location/CacheLocationsManager;->locationsByHomeIdMap:Ljava/util/HashMap;

    if-nez v3, :cond_0

    .line 43
    new-instance v3, Ljava/util/HashMap;

    const/16 v4, 0x10

    invoke-direct {v3, v4}, Ljava/util/HashMap;-><init>(I)V

    iput-object v3, p0, Lcom/belkin/wemo/cache/location/CacheLocationsManager;->locationsByHomeIdMap:Ljava/util/HashMap;

    .line 44
    :cond_0
    invoke-virtual {p0}, Lcom/belkin/wemo/cache/location/CacheLocationsManager;->getLocationListFromDB()Ljava/util/Set;

    move-result-object v3

    iput-object v3, p0, Lcom/belkin/wemo/cache/location/CacheLocationsManager;->locationsFromMemory:Ljava/util/Set;

    .line 45
    iget-object v3, p0, Lcom/belkin/wemo/cache/location/CacheLocationsManager;->locationsFromMemory:Ljava/util/Set;

    invoke-interface {v3}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "iterator":Ljava/util/Iterator;, "Ljava/util/Iterator<Lcom/belkin/wemo/cache/location/Location;>;"
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_1

    .line 46
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/belkin/wemo/cache/location/Location;

    .line 47
    .local v2, "location":Lcom/belkin/wemo/cache/location/Location;
    iget-object v3, p0, Lcom/belkin/wemo/cache/location/CacheLocationsManager;->locationsByHomeIdMap:Ljava/util/HashMap;

    invoke-virtual {v2}, Lcom/belkin/wemo/cache/location/Location;->getHomeId()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 49
    .end local v1    # "iterator":Ljava/util/Iterator;, "Ljava/util/Iterator<Lcom/belkin/wemo/cache/location/Location;>;"
    .end local v2    # "location":Lcom/belkin/wemo/cache/location/Location;
    :catch_0
    move-exception v0

    .line 51
    .local v0, "e":Ljava/lang/Exception;
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    .line 53
    .end local v0    # "e":Ljava/lang/Exception;
    :cond_1
    return-void
.end method
