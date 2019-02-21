.class public Lcom/belkin/database/BridgeLocalDatabase;
.super Ljava/lang/Object;
.source "BridgeLocalDatabase.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/belkin/database/BridgeLocalDatabase$BridgeDatabaseHelper;
    }
.end annotation


# static fields
.field public static final BRIDGE_DATABASE_NAME:Ljava/lang/String; = "bridge_iconstore.db"

.field public static final BRIDGE_DATABASE_VERSION:I = 0x1

.field public static final TABLE_LED_DEVICES:Ljava/lang/String; = "leddevices"

.field private static mDeviceDatabaseInstance:Lcom/belkin/database/BridgeLocalDatabase;


# instance fields
.field private helper:Lcom/belkin/database/BridgeLocalDatabase$BridgeDatabaseHelper;

.field private mDatabse:Landroid/database/sqlite/SQLiteDatabase;


# direct methods
.method private constructor <init>()V
    .locals 0

    .prologue
    .line 30
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 31
    return-void
.end method

.method private constructor <init>(Landroid/content/Context;)V
    .locals 4
    .param p1, "mContext"    # Landroid/content/Context;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 51
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 52
    new-instance v1, Lcom/belkin/database/BridgeLocalDatabase$BridgeDatabaseHelper;

    const-string v2, "bridge_iconstore.db"

    const/4 v3, 0x1

    invoke-direct {v1, p0, p1, v2, v3}, Lcom/belkin/database/BridgeLocalDatabase$BridgeDatabaseHelper;-><init>(Lcom/belkin/database/BridgeLocalDatabase;Landroid/content/Context;Ljava/lang/String;I)V

    iput-object v1, p0, Lcom/belkin/database/BridgeLocalDatabase;->helper:Lcom/belkin/database/BridgeLocalDatabase$BridgeDatabaseHelper;

    .line 56
    :try_start_0
    iget-object v1, p0, Lcom/belkin/database/BridgeLocalDatabase;->helper:Lcom/belkin/database/BridgeLocalDatabase$BridgeDatabaseHelper;

    invoke-virtual {v1}, Lcom/belkin/database/BridgeLocalDatabase$BridgeDatabaseHelper;->getWritableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v1

    iput-object v1, p0, Lcom/belkin/database/BridgeLocalDatabase;->mDatabse:Landroid/database/sqlite/SQLiteDatabase;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 62
    return-void

    .line 57
    :catch_0
    move-exception v0

    .line 59
    .local v0, "e":Ljava/lang/Exception;
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    .line 60
    new-instance v1, Ljava/lang/Exception;

    const-string v2, "Can not create Action Database"

    invoke-direct {v1, v2}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    throw v1
.end method

.method public static declared-synchronized getLedDeviceDatabase(Landroid/content/Context;)Lcom/belkin/database/BridgeLocalDatabase;
    .locals 5
    .param p0, "context"    # Landroid/content/Context;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/belkin/exception/DatabaseException;
        }
    .end annotation

    .prologue
    .line 39
    const-class v3, Lcom/belkin/database/BridgeLocalDatabase;

    monitor-enter v3

    :try_start_0
    sget-object v2, Lcom/belkin/database/BridgeLocalDatabase;->mDeviceDatabaseInstance:Lcom/belkin/database/BridgeLocalDatabase;

    if-nez v2, :cond_0

    .line 40
    new-instance v2, Lcom/belkin/database/BridgeLocalDatabase;

    invoke-direct {v2, p0}, Lcom/belkin/database/BridgeLocalDatabase;-><init>(Landroid/content/Context;)V

    sput-object v2, Lcom/belkin/database/BridgeLocalDatabase;->mDeviceDatabaseInstance:Lcom/belkin/database/BridgeLocalDatabase;

    .line 41
    :cond_0
    sget-object v2, Lcom/belkin/database/BridgeLocalDatabase;->mDeviceDatabaseInstance:Lcom/belkin/database/BridgeLocalDatabase;

    iget-object v2, v2, Lcom/belkin/database/BridgeLocalDatabase;->mDatabse:Landroid/database/sqlite/SQLiteDatabase;

    invoke-virtual {v2}, Landroid/database/sqlite/SQLiteDatabase;->isOpen()Z

    move-result v1

    .line 42
    .local v1, "status":Z
    if-nez v1, :cond_1

    .line 43
    sget-object v2, Lcom/belkin/database/BridgeLocalDatabase;->mDeviceDatabaseInstance:Lcom/belkin/database/BridgeLocalDatabase;

    sget-object v4, Lcom/belkin/database/BridgeLocalDatabase;->mDeviceDatabaseInstance:Lcom/belkin/database/BridgeLocalDatabase;

    iget-object v4, v4, Lcom/belkin/database/BridgeLocalDatabase;->helper:Lcom/belkin/database/BridgeLocalDatabase$BridgeDatabaseHelper;

    invoke-virtual {v4}, Lcom/belkin/database/BridgeLocalDatabase$BridgeDatabaseHelper;->getWritableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v4

    iput-object v4, v2, Lcom/belkin/database/BridgeLocalDatabase;->mDatabse:Landroid/database/sqlite/SQLiteDatabase;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 48
    :cond_1
    :try_start_1
    sget-object v2, Lcom/belkin/database/BridgeLocalDatabase;->mDeviceDatabaseInstance:Lcom/belkin/database/BridgeLocalDatabase;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    monitor-exit v3

    return-object v2

    .line 45
    .end local v1    # "status":Z
    :catch_0
    move-exception v0

    .line 46
    .local v0, "e":Ljava/lang/Exception;
    :try_start_2
    new-instance v2, Lcom/belkin/exception/DatabaseException;

    const-string v4, "Can not create Database"

    invoke-direct {v2, v4, v0}, Lcom/belkin/exception/DatabaseException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v2
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 39
    .end local v0    # "e":Ljava/lang/Exception;
    :catchall_0
    move-exception v2

    monitor-exit v3

    throw v2
.end method


# virtual methods
.method public checkData(Ljava/lang/String;)Landroid/database/Cursor;
    .locals 11
    .param p1, "deviceId"    # Ljava/lang/String;

    .prologue
    const/4 v10, 0x0

    .line 138
    if-eqz p1, :cond_0

    .line 141
    :try_start_0
    iget-object v0, p0, Lcom/belkin/database/BridgeLocalDatabase;->mDatabse:Landroid/database/sqlite/SQLiteDatabase;

    const-string v1, "leddevices"

    const/4 v2, 0x0

    const-string v3, "led_deviceid=?"

    const/4 v4, 0x1

    new-array v4, v4, [Ljava/lang/String;

    const/4 v5, 0x0

    aput-object p1, v4, v5

    const/4 v5, 0x0

    const/4 v6, 0x0

    const/4 v7, 0x0

    invoke-virtual/range {v0 .. v7}, Landroid/database/sqlite/SQLiteDatabase;->query(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v8

    .line 143
    .local v8, "cursor":Landroid/database/Cursor;
    const-string v0, "DataBase"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "checkData() : "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-interface {v8}, Landroid/database/Cursor;->getCount()I

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 150
    .end local v8    # "cursor":Landroid/database/Cursor;
    :goto_0
    return-object v8

    .line 145
    :catch_0
    move-exception v9

    .local v9, "e":Ljava/lang/Exception;
    move-object v8, v10

    .line 146
    goto :goto_0

    .end local v9    # "e":Ljava/lang/Exception;
    :cond_0
    move-object v8, v10

    .line 150
    goto :goto_0
.end method

.method public closeDatabse()V
    .locals 1

    .prologue
    .line 66
    :try_start_0
    iget-object v0, p0, Lcom/belkin/database/BridgeLocalDatabase;->mDatabse:Landroid/database/sqlite/SQLiteDatabase;

    invoke-virtual {v0}, Landroid/database/sqlite/SQLiteDatabase;->close()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 70
    :goto_0
    return-void

    .line 67
    :catch_0
    move-exception v0

    goto :goto_0
.end method

.method public deleteRecordById(Ljava/lang/String;)I
    .locals 7
    .param p1, "deviceId"    # Ljava/lang/String;

    .prologue
    const/4 v1, 0x0

    .line 155
    :try_start_0
    iget-object v2, p0, Lcom/belkin/database/BridgeLocalDatabase;->mDatabse:Landroid/database/sqlite/SQLiteDatabase;

    const-string v3, "leddevices"

    const-string v4, "led_deviceid=?"

    const/4 v5, 0x1

    new-array v5, v5, [Ljava/lang/String;

    const/4 v6, 0x0

    aput-object p1, v5, v6

    invoke-virtual {v2, v3, v4, v5}, Landroid/database/sqlite/SQLiteDatabase;->delete(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)I
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result v1

    .line 158
    :goto_0
    return v1

    .line 157
    :catch_0
    move-exception v0

    .line 158
    .local v0, "e":Ljava/lang/Exception;
    goto :goto_0
.end method

.method public getIconByLedDeviceId(Ljava/lang/String;)Lorg/json/JSONArray;
    .locals 12
    .param p1, "deviceid"    # Ljava/lang/String;

    .prologue
    .line 73
    new-instance v9, Lorg/json/JSONArray;

    invoke-direct {v9}, Lorg/json/JSONArray;-><init>()V

    .line 74
    .local v9, "deviceList":Lorg/json/JSONArray;
    const/4 v10, 0x0

    .local v10, "icon":Ljava/lang/String;
    const/4 v8, 0x0

    .line 76
    .local v8, "cloudId":Ljava/lang/String;
    :try_start_0
    iget-object v0, p0, Lcom/belkin/database/BridgeLocalDatabase;->mDatabse:Landroid/database/sqlite/SQLiteDatabase;

    const-string v1, "leddevices"

    const/4 v2, 0x0

    const-string v3, "led_deviceid = ?"

    const/4 v4, 0x1

    new-array v4, v4, [Ljava/lang/String;

    const/4 v5, 0x0

    aput-object p1, v4, v5

    const/4 v5, 0x0

    const/4 v6, 0x0

    const/4 v7, 0x0

    invoke-virtual/range {v0 .. v7}, Landroid/database/sqlite/SQLiteDatabase;->query(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v11

    .line 79
    .local v11, "mCursor":Landroid/database/Cursor;
    if-eqz v11, :cond_3

    .line 80
    invoke-interface {v11}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v0

    if-eqz v0, :cond_2

    .line 82
    :cond_0
    const-string v0, "led_image_raw"

    invoke-interface {v11, v0}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v0

    invoke-interface {v11, v0}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_1

    const-string v0, "led_cloudid"

    invoke-interface {v11, v0}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v0

    invoke-interface {v11, v0}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_1

    .line 83
    const-string v0, "led_image_raw"

    invoke-interface {v11, v0}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v0

    invoke-interface {v11, v0}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v10

    .line 84
    :cond_1
    const-string v0, "led_cloudid"

    invoke-interface {v11, v0}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v0

    invoke-interface {v11, v0}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v8

    .line 85
    invoke-virtual {v9, v10}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;

    .line 86
    invoke-virtual {v9, v8}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;

    .line 87
    invoke-interface {v11}, Landroid/database/Cursor;->moveToNext()Z

    move-result v0

    if-nez v0, :cond_0

    .line 89
    :cond_2
    if-eqz v11, :cond_3

    invoke-interface {v11}, Landroid/database/Cursor;->isClosed()Z

    move-result v0

    if-nez v0, :cond_3

    .line 90
    invoke-interface {v11}, Landroid/database/Cursor;->close()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 95
    .end local v11    # "mCursor":Landroid/database/Cursor;
    :cond_3
    :goto_0
    return-object v9

    .line 92
    :catch_0
    move-exception v0

    goto :goto_0
.end method

.method public insertLedDeviceIcon(Landroid/content/ContentValues;)J
    .locals 4
    .param p1, "contentValues"    # Landroid/content/ContentValues;

    .prologue
    .line 130
    :try_start_0
    const-string v1, "DataBase"

    const-string v2, "insertLedDevices() : insertLedDevices()"

    invoke-static {v1, v2}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 131
    iget-object v1, p0, Lcom/belkin/database/BridgeLocalDatabase;->mDatabse:Landroid/database/sqlite/SQLiteDatabase;

    const-string v2, "leddevices"

    const/4 v3, 0x0

    invoke-virtual {v1, v2, v3, p1}, Landroid/database/sqlite/SQLiteDatabase;->insert(Ljava/lang/String;Ljava/lang/String;Landroid/content/ContentValues;)J
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result-wide v2

    .line 133
    :goto_0
    return-wide v2

    .line 132
    :catch_0
    move-exception v0

    .line 133
    .local v0, "e":Ljava/lang/Exception;
    const-wide/16 v2, -0x1

    goto :goto_0
.end method

.method public insertLedDeviceIcon(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)J
    .locals 5
    .param p1, "leddeviceId"    # Ljava/lang/String;
    .param p2, "imageString"    # Ljava/lang/String;
    .param p3, "cloudId"    # Ljava/lang/String;

    .prologue
    .line 117
    :try_start_0
    new-instance v1, Landroid/content/ContentValues;

    invoke-direct {v1}, Landroid/content/ContentValues;-><init>()V

    .line 118
    .local v1, "values":Landroid/content/ContentValues;
    const-string v2, "led_deviceid"

    invoke-virtual {v1, v2, p1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 119
    const-string v2, "led_image_raw"

    invoke-virtual {v1, v2, p2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 120
    const-string v2, "led_cloudid"

    invoke-virtual {v1, v2, p3}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 122
    iget-object v2, p0, Lcom/belkin/database/BridgeLocalDatabase;->mDatabse:Landroid/database/sqlite/SQLiteDatabase;

    const-string v3, "leddevices"

    const/4 v4, 0x0

    invoke-virtual {v2, v3, v4, v1}, Landroid/database/sqlite/SQLiteDatabase;->insert(Ljava/lang/String;Ljava/lang/String;Landroid/content/ContentValues;)J
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result-wide v2

    .line 124
    .end local v1    # "values":Landroid/content/ContentValues;
    :goto_0
    return-wide v2

    .line 123
    :catch_0
    move-exception v0

    .line 124
    .local v0, "e":Ljava/lang/Exception;
    const-wide/16 v2, -0x1

    goto :goto_0
.end method

.method public updateLedIconByDeviceId(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I
    .locals 10
    .param p1, "imagestring"    # Ljava/lang/String;
    .param p2, "deviceid"    # Ljava/lang/String;
    .param p3, "cloudId"    # Ljava/lang/String;

    .prologue
    const/4 v2, 0x0

    .line 101
    :try_start_0
    new-instance v1, Landroid/content/ContentValues;

    invoke-direct {v1}, Landroid/content/ContentValues;-><init>()V

    .line 103
    .local v1, "values":Landroid/content/ContentValues;
    const-string v3, "led_image_raw"

    invoke-virtual {v1, v3, p1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 104
    const-string v3, "led_cloudid"

    invoke-virtual {v1, v3, p3}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 106
    iget-object v3, p0, Lcom/belkin/database/BridgeLocalDatabase;->mDatabse:Landroid/database/sqlite/SQLiteDatabase;

    const-string v4, "leddevices"

    const-string v5, "led_deviceid= ?"

    const/4 v6, 0x1

    new-array v6, v6, [Ljava/lang/String;

    const/4 v7, 0x0

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, ""

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    aput-object v8, v6, v7

    invoke-virtual {v3, v4, v1, v5, v6}, Landroid/database/sqlite/SQLiteDatabase;->update(Ljava/lang/String;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result v2

    .line 110
    .end local v1    # "values":Landroid/content/ContentValues;
    :goto_0
    return v2

    .line 108
    :catch_0
    move-exception v0

    .line 109
    .local v0, "e":Ljava/lang/Exception;
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_0
.end method
