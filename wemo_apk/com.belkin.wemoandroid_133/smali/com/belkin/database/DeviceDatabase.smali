.class public Lcom/belkin/database/DeviceDatabase;
.super Ljava/lang/Object;
.source "DeviceDatabase.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/belkin/database/DeviceDatabase$DatabaseHelper;
    }
.end annotation


# static fields
.field public static final DEVICE_DATABASE_NAME:Ljava/lang/String; = "plugin.db"

.field public static final DEVICE_DATABASE_VERSION:I = 0x1

.field public static final TABLE_ALL_DEVICES:Ljava/lang/String; = "devices"

.field private static mDeviceDatabaseInstance:Lcom/belkin/database/DeviceDatabase;


# instance fields
.field private helper:Lcom/belkin/database/DeviceDatabase$DatabaseHelper;

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
    .line 48
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 49
    new-instance v1, Lcom/belkin/database/DeviceDatabase$DatabaseHelper;

    const-string v2, "plugin.db"

    const/4 v3, 0x1

    invoke-direct {v1, p0, p1, v2, v3}, Lcom/belkin/database/DeviceDatabase$DatabaseHelper;-><init>(Lcom/belkin/database/DeviceDatabase;Landroid/content/Context;Ljava/lang/String;I)V

    iput-object v1, p0, Lcom/belkin/database/DeviceDatabase;->helper:Lcom/belkin/database/DeviceDatabase$DatabaseHelper;

    .line 53
    :try_start_0
    iget-object v1, p0, Lcom/belkin/database/DeviceDatabase;->helper:Lcom/belkin/database/DeviceDatabase$DatabaseHelper;

    invoke-virtual {v1}, Lcom/belkin/database/DeviceDatabase$DatabaseHelper;->getWritableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v1

    iput-object v1, p0, Lcom/belkin/database/DeviceDatabase;->mDatabse:Landroid/database/sqlite/SQLiteDatabase;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 59
    return-void

    .line 54
    :catch_0
    move-exception v0

    .line 56
    .local v0, "e":Ljava/lang/Exception;
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    .line 57
    new-instance v1, Ljava/lang/Exception;

    const-string v2, "Can not create Action Database"

    invoke-direct {v1, v2}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    throw v1
.end method

.method public static declared-synchronized getDeviceDatabase(Landroid/content/Context;)Lcom/belkin/database/DeviceDatabase;
    .locals 5
    .param p0, "context"    # Landroid/content/Context;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/belkin/exception/DatabaseException;
        }
    .end annotation

    .prologue
    .line 36
    const-class v3, Lcom/belkin/database/DeviceDatabase;

    monitor-enter v3

    :try_start_0
    sget-object v2, Lcom/belkin/database/DeviceDatabase;->mDeviceDatabaseInstance:Lcom/belkin/database/DeviceDatabase;

    if-nez v2, :cond_0

    .line 37
    new-instance v2, Lcom/belkin/database/DeviceDatabase;

    invoke-direct {v2, p0}, Lcom/belkin/database/DeviceDatabase;-><init>(Landroid/content/Context;)V

    sput-object v2, Lcom/belkin/database/DeviceDatabase;->mDeviceDatabaseInstance:Lcom/belkin/database/DeviceDatabase;

    .line 38
    :cond_0
    sget-object v2, Lcom/belkin/database/DeviceDatabase;->mDeviceDatabaseInstance:Lcom/belkin/database/DeviceDatabase;

    iget-object v2, v2, Lcom/belkin/database/DeviceDatabase;->mDatabse:Landroid/database/sqlite/SQLiteDatabase;

    invoke-virtual {v2}, Landroid/database/sqlite/SQLiteDatabase;->isOpen()Z

    move-result v1

    .line 39
    .local v1, "status":Z
    if-nez v1, :cond_1

    .line 40
    sget-object v2, Lcom/belkin/database/DeviceDatabase;->mDeviceDatabaseInstance:Lcom/belkin/database/DeviceDatabase;

    sget-object v4, Lcom/belkin/database/DeviceDatabase;->mDeviceDatabaseInstance:Lcom/belkin/database/DeviceDatabase;

    iget-object v4, v4, Lcom/belkin/database/DeviceDatabase;->helper:Lcom/belkin/database/DeviceDatabase$DatabaseHelper;

    invoke-virtual {v4}, Lcom/belkin/database/DeviceDatabase$DatabaseHelper;->getWritableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v4

    iput-object v4, v2, Lcom/belkin/database/DeviceDatabase;->mDatabse:Landroid/database/sqlite/SQLiteDatabase;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 45
    :cond_1
    :try_start_1
    sget-object v2, Lcom/belkin/database/DeviceDatabase;->mDeviceDatabaseInstance:Lcom/belkin/database/DeviceDatabase;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    monitor-exit v3

    return-object v2

    .line 42
    .end local v1    # "status":Z
    :catch_0
    move-exception v0

    .line 43
    .local v0, "e":Ljava/lang/Exception;
    :try_start_2
    new-instance v2, Lcom/belkin/exception/DatabaseException;

    const-string v4, "Can not create Database"

    invoke-direct {v2, v4, v0}, Lcom/belkin/exception/DatabaseException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v2
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 36
    .end local v0    # "e":Ljava/lang/Exception;
    :catchall_0
    move-exception v2

    monitor-exit v3

    throw v2
.end method


# virtual methods
.method public checkData(Ljava/lang/String;)Landroid/database/Cursor;
    .locals 11
    .param p1, "switchUdn"    # Ljava/lang/String;

    .prologue
    const/4 v10, 0x0

    .line 228
    if-eqz p1, :cond_0

    .line 230
    :try_start_0
    iget-object v0, p0, Lcom/belkin/database/DeviceDatabase;->mDatabse:Landroid/database/sqlite/SQLiteDatabase;

    const-string v1, "devices"

    const/4 v2, 0x0

    const-string v3, "deviceudn=?"

    const/4 v4, 0x1

    new-array v4, v4, [Ljava/lang/String;

    const/4 v5, 0x0

    aput-object p1, v4, v5

    const/4 v5, 0x0

    const/4 v6, 0x0

    const/4 v7, 0x0

    invoke-virtual/range {v0 .. v7}, Landroid/database/sqlite/SQLiteDatabase;->query(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v8

    .line 232
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

    .line 238
    .end local v8    # "cursor":Landroid/database/Cursor;
    :goto_0
    return-object v8

    .line 234
    :catch_0
    move-exception v9

    .local v9, "e":Ljava/lang/Exception;
    move-object v8, v10

    .line 235
    goto :goto_0

    .end local v9    # "e":Ljava/lang/Exception;
    :cond_0
    move-object v8, v10

    .line 238
    goto :goto_0
.end method

.method public closeDatabse()V
    .locals 1

    .prologue
    .line 63
    :try_start_0
    iget-object v0, p0, Lcom/belkin/database/DeviceDatabase;->mDatabse:Landroid/database/sqlite/SQLiteDatabase;

    invoke-virtual {v0}, Landroid/database/sqlite/SQLiteDatabase;->close()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 67
    :goto_0
    return-void

    .line 64
    :catch_0
    move-exception v0

    goto :goto_0
.end method

.method public deleteAllRecords(Ljava/lang/String;)I
    .locals 7
    .param p1, "type"    # Ljava/lang/String;

    .prologue
    const/4 v1, 0x0

    .line 243
    :try_start_0
    iget-object v2, p0, Lcom/belkin/database/DeviceDatabase;->mDatabse:Landroid/database/sqlite/SQLiteDatabase;

    const-string v3, "devices"

    const-string v4, "device_type=?"

    const/4 v5, 0x1

    new-array v5, v5, [Ljava/lang/String;

    const/4 v6, 0x0

    aput-object p1, v5, v6

    invoke-virtual {v2, v3, v4, v5}, Landroid/database/sqlite/SQLiteDatabase;->delete(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)I
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result v1

    .line 246
    :goto_0
    return v1

    .line 245
    :catch_0
    move-exception v0

    .line 246
    .local v0, "e":Ljava/lang/Exception;
    goto :goto_0
.end method

.method public deleteDevice(Ljava/lang/String;)I
    .locals 9
    .param p1, "udn"    # Ljava/lang/String;

    .prologue
    const/4 v1, 0x0

    .line 170
    :try_start_0
    iget-object v2, p0, Lcom/belkin/database/DeviceDatabase;->mDatabse:Landroid/database/sqlite/SQLiteDatabase;

    const-string v3, "devices"

    const-string v4, "deviceudn= ?"

    const/4 v5, 0x1

    new-array v5, v5, [Ljava/lang/String;

    const/4 v6, 0x0

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, ""

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    aput-object v7, v5, v6

    invoke-virtual {v2, v3, v4, v5}, Landroid/database/sqlite/SQLiteDatabase;->delete(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)I
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result v1

    .line 173
    :goto_0
    return v1

    .line 172
    :catch_0
    move-exception v0

    .line 173
    .local v0, "e":Ljava/lang/Exception;
    goto :goto_0
.end method

.method public getFriendlyNameByUdnDatabase(Ljava/lang/String;)Ljava/lang/String;
    .locals 10
    .param p1, "udn"    # Ljava/lang/String;

    .prologue
    .line 85
    const-string v8, ""

    .line 87
    .local v8, "friendlyName":Ljava/lang/String;
    :try_start_0
    iget-object v0, p0, Lcom/belkin/database/DeviceDatabase;->mDatabse:Landroid/database/sqlite/SQLiteDatabase;

    const-string v1, "devices"

    const/4 v2, 0x0

    const-string v3, "deviceudn = ?"

    const/4 v4, 0x1

    new-array v4, v4, [Ljava/lang/String;

    const/4 v5, 0x0

    aput-object p1, v4, v5

    const/4 v5, 0x0

    const/4 v6, 0x0

    const/4 v7, 0x0

    invoke-virtual/range {v0 .. v7}, Landroid/database/sqlite/SQLiteDatabase;->query(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v9

    .line 90
    .local v9, "mCursor":Landroid/database/Cursor;
    if-eqz v9, :cond_2

    .line 91
    invoke-interface {v9}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 93
    :cond_0
    const/4 v0, 0x1

    invoke-interface {v9, v0}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v8

    .line 94
    invoke-interface {v9}, Landroid/database/Cursor;->moveToNext()Z

    move-result v0

    if-nez v0, :cond_0

    .line 96
    :cond_1
    if-eqz v9, :cond_2

    invoke-interface {v9}, Landroid/database/Cursor;->isClosed()Z

    move-result v0

    if-nez v0, :cond_2

    .line 97
    invoke-interface {v9}, Landroid/database/Cursor;->close()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 102
    .end local v9    # "mCursor":Landroid/database/Cursor;
    :cond_2
    :goto_0
    return-object v8

    .line 99
    :catch_0
    move-exception v0

    goto :goto_0
.end method

.method public getIconByUdn(Ljava/lang/String;)[B
    .locals 12
    .param p1, "udn"    # Ljava/lang/String;

    .prologue
    .line 127
    const/4 v10, 0x0

    .line 129
    .local v10, "icon":[B
    :try_start_0
    iget-object v1, p0, Lcom/belkin/database/DeviceDatabase;->mDatabse:Landroid/database/sqlite/SQLiteDatabase;

    const-string v2, "devices"

    const/4 v3, 0x0

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "deviceudn = \'"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, "\'"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    const/4 v5, 0x0

    const/4 v6, 0x0

    const/4 v7, 0x0

    const/4 v8, 0x0

    invoke-virtual/range {v1 .. v8}, Landroid/database/sqlite/SQLiteDatabase;->query(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v11

    .line 132
    .local v11, "mCursor":Landroid/database/Cursor;
    if-eqz v11, :cond_3

    .line 133
    invoke-interface {v11}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v1

    if-eqz v1, :cond_2

    .line 135
    :cond_0
    const-string v1, "image_raw"

    invoke-interface {v11, v1}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v1

    invoke-interface {v11, v1}, Landroid/database/Cursor;->getBlob(I)[B

    move-result-object v1

    if-eqz v1, :cond_1

    .line 136
    const-string v1, "image_raw"

    invoke-interface {v11, v1}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v1

    invoke-interface {v11, v1}, Landroid/database/Cursor;->getBlob(I)[B

    move-result-object v1

    invoke-virtual {v1}, [B->clone()Ljava/lang/Object;

    move-result-object v1

    move-object v0, v1

    check-cast v0, [B

    move-object v10, v0

    .line 139
    :cond_1
    invoke-interface {v11}, Landroid/database/Cursor;->moveToNext()Z

    move-result v1

    if-nez v1, :cond_0

    .line 141
    :cond_2
    if-eqz v11, :cond_3

    invoke-interface {v11}, Landroid/database/Cursor;->isClosed()Z

    move-result v1

    if-nez v1, :cond_3

    .line 142
    invoke-interface {v11}, Landroid/database/Cursor;->close()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 148
    .end local v11    # "mCursor":Landroid/database/Cursor;
    :cond_3
    :goto_0
    const/4 v1, 0x2

    array-length v2, v10

    add-int/lit8 v2, v2, -0x2

    invoke-static {v10, v1, v2}, Ljava/util/Arrays;->copyOfRange([BII)[B

    move-result-object v10

    .line 150
    return-object v10

    .line 144
    :catch_0
    move-exception v9

    .line 145
    .local v9, "e":Ljava/lang/Exception;
    sget-object v1, Ljava/lang/System;->out:Ljava/io/PrintStream;

    invoke-virtual {v9}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    goto :goto_0
.end method

.method public insertSwitches(Landroid/content/ContentValues;)J
    .locals 4
    .param p1, "contentValues"    # Landroid/content/ContentValues;

    .prologue
    .line 209
    :try_start_0
    const-string v1, "DataBase"

    const-string v2, "insertSwitches() : insertSwitches()"

    invoke-static {v1, v2}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 210
    iget-object v1, p0, Lcom/belkin/database/DeviceDatabase;->mDatabse:Landroid/database/sqlite/SQLiteDatabase;

    const-string v2, "devices"

    const/4 v3, 0x0

    invoke-virtual {v1, v2, v3, p1}, Landroid/database/sqlite/SQLiteDatabase;->insert(Ljava/lang/String;Ljava/lang/String;Landroid/content/ContentValues;)J
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result-wide v2

    .line 212
    :goto_0
    return-wide v2

    .line 211
    :catch_0
    move-exception v0

    .line 212
    .local v0, "e":Ljava/lang/Exception;
    const-wide/16 v2, -0x1

    goto :goto_0
.end method

.method public insertSwitches(Ljava/lang/String;Ljava/lang/String;[BILjava/lang/String;)J
    .locals 5
    .param p1, "switchName"    # Ljava/lang/String;
    .param p2, "switchUdn"    # Ljava/lang/String;
    .param p3, "imageRaw"    # [B
    .param p4, "status"    # I
    .param p5, "deviceType"    # Ljava/lang/String;

    .prologue
    .line 194
    :try_start_0
    new-instance v1, Landroid/content/ContentValues;

    invoke-direct {v1}, Landroid/content/ContentValues;-><init>()V

    .line 195
    .local v1, "values":Landroid/content/ContentValues;
    const-string v2, "friendlyname"

    invoke-virtual {v1, v2, p1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 196
    const-string v2, "deviceudn"

    invoke-virtual {v1, v2, p2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 197
    const-string v2, "image_raw"

    invoke-virtual {v1, v2, p3}, Landroid/content/ContentValues;->put(Ljava/lang/String;[B)V

    .line 199
    const-string v2, "device_type"

    invoke-virtual {v1, v2, p5}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 201
    iget-object v2, p0, Lcom/belkin/database/DeviceDatabase;->mDatabse:Landroid/database/sqlite/SQLiteDatabase;

    const-string v3, "devices"

    const/4 v4, 0x0

    invoke-virtual {v2, v3, v4, v1}, Landroid/database/sqlite/SQLiteDatabase;->insert(Ljava/lang/String;Ljava/lang/String;Landroid/content/ContentValues;)J
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result-wide v2

    .line 203
    .end local v1    # "values":Landroid/content/ContentValues;
    :goto_0
    return-wide v2

    .line 202
    :catch_0
    move-exception v0

    .line 203
    .local v0, "e":Ljava/lang/Exception;
    const-wide/16 v2, -0x1

    goto :goto_0
.end method

.method public insertSwitches(Ljava/lang/String;Ljava/lang/String;[BILjava/lang/String;Ljava/lang/String;)J
    .locals 6
    .param p1, "switchName"    # Ljava/lang/String;
    .param p2, "switchUdn"    # Ljava/lang/String;
    .param p3, "imageRaw"    # [B
    .param p4, "status"    # I
    .param p5, "deviceType"    # Ljava/lang/String;
    .param p6, "state"    # Ljava/lang/String;

    .prologue
    .line 179
    :try_start_0
    new-instance v1, Landroid/content/ContentValues;

    invoke-direct {v1}, Landroid/content/ContentValues;-><init>()V

    .line 180
    .local v1, "values":Landroid/content/ContentValues;
    const-string v2, "friendlyname"

    invoke-virtual {v1, v2, p1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 181
    const-string v2, "deviceudn"

    invoke-virtual {v1, v2, p2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 182
    const-string v2, "image_raw"

    invoke-virtual {v1, v2, p3}, Landroid/content/ContentValues;->put(Ljava/lang/String;[B)V

    .line 183
    const-string v2, "status"

    invoke-virtual {v1, v2, p6}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 184
    const-string v2, "device_type"

    invoke-virtual {v1, v2, p5}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 186
    iget-object v2, p0, Lcom/belkin/database/DeviceDatabase;->mDatabse:Landroid/database/sqlite/SQLiteDatabase;

    const-string v3, "devices"

    const/4 v4, 0x0

    const/4 v5, 0x5

    invoke-virtual {v2, v3, v4, v1, v5}, Landroid/database/sqlite/SQLiteDatabase;->insertWithOnConflict(Ljava/lang/String;Ljava/lang/String;Landroid/content/ContentValues;I)J
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result-wide v2

    .line 188
    .end local v1    # "values":Landroid/content/ContentValues;
    :goto_0
    return-wide v2

    .line 187
    :catch_0
    move-exception v0

    .line 188
    .local v0, "e":Ljava/lang/Exception;
    const-wide/16 v2, -0x1

    goto :goto_0
.end method

.method public isDeviceExists(Ljava/lang/String;)Z
    .locals 12
    .param p1, "udn"    # Ljava/lang/String;

    .prologue
    const/4 v10, 0x1

    const/4 v11, 0x0

    .line 71
    :try_start_0
    iget-object v0, p0, Lcom/belkin/database/DeviceDatabase;->mDatabse:Landroid/database/sqlite/SQLiteDatabase;

    const-string v1, "devices"

    const/4 v2, 0x0

    const-string v3, "deviceudn=?"

    const/4 v4, 0x1

    new-array v4, v4, [Ljava/lang/String;

    const/4 v5, 0x0

    aput-object p1, v4, v5

    const/4 v5, 0x0

    const/4 v6, 0x0

    const/4 v7, 0x0

    invoke-virtual/range {v0 .. v7}, Landroid/database/sqlite/SQLiteDatabase;->query(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v9

    .line 73
    .local v9, "mCursor":Landroid/database/Cursor;
    invoke-interface {v9}, Landroid/database/Cursor;->getCount()I

    move-result v0

    if-lez v0, :cond_0

    .line 74
    invoke-interface {v9}, Landroid/database/Cursor;->close()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move v0, v10

    .line 81
    .end local v9    # "mCursor":Landroid/database/Cursor;
    :goto_0
    return v0

    .line 77
    :catch_0
    move-exception v8

    .line 78
    .local v8, "e":Ljava/lang/Exception;
    invoke-virtual {v8}, Ljava/lang/Exception;->printStackTrace()V

    .end local v8    # "e":Ljava/lang/Exception;
    :cond_0
    move v0, v11

    .line 81
    goto :goto_0
.end method

.method public setIconByUdn([BLjava/lang/String;)I
    .locals 9
    .param p1, "icon"    # [B
    .param p2, "udn"    # Ljava/lang/String;

    .prologue
    const/4 v3, 0x0

    .line 107
    const/4 v4, 0x0

    :try_start_0
    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    .line 108
    .local v1, "res":Ljava/lang/Integer;
    new-instance v2, Landroid/content/ContentValues;

    invoke-direct {v2}, Landroid/content/ContentValues;-><init>()V

    .line 109
    .local v2, "values":Landroid/content/ContentValues;
    const-string v4, "deviceudn"

    invoke-virtual {v2, v4, p2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 110
    const-string v4, "image_raw"

    invoke-virtual {v2, v4, p1}, Landroid/content/ContentValues;->put(Ljava/lang/String;[B)V

    .line 111
    invoke-virtual {p0, p2}, Lcom/belkin/database/DeviceDatabase;->isDeviceExists(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_0

    .line 113
    iget-object v4, p0, Lcom/belkin/database/DeviceDatabase;->mDatabse:Landroid/database/sqlite/SQLiteDatabase;

    const-string v5, "devices"

    const-string v6, "deviceudn=?"

    const/4 v7, 0x1

    new-array v7, v7, [Ljava/lang/String;

    const/4 v8, 0x0

    aput-object p2, v7, v8

    invoke-virtual {v4, v5, v2, v6, v7}, Landroid/database/sqlite/SQLiteDatabase;->update(Ljava/lang/String;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I

    move-result v4

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    .line 119
    :goto_0
    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v3

    .line 123
    .end local v1    # "res":Ljava/lang/Integer;
    .end local v2    # "values":Landroid/content/ContentValues;
    :goto_1
    return v3

    .line 117
    .restart local v1    # "res":Ljava/lang/Integer;
    .restart local v2    # "values":Landroid/content/ContentValues;
    :cond_0
    iget-object v4, p0, Lcom/belkin/database/DeviceDatabase;->mDatabse:Landroid/database/sqlite/SQLiteDatabase;

    const-string v5, "devices"

    const/4 v6, 0x0

    invoke-virtual {v4, v5, v6, v2}, Landroid/database/sqlite/SQLiteDatabase;->insert(Ljava/lang/String;Ljava/lang/String;Landroid/content/ContentValues;)J

    move-result-wide v4

    long-to-int v4, v4

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v1

    goto :goto_0

    .line 120
    .end local v1    # "res":Ljava/lang/Integer;
    .end local v2    # "values":Landroid/content/ContentValues;
    :catch_0
    move-exception v0

    .line 121
    .local v0, "e":Ljava/lang/Exception;
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_1
.end method

.method public updateDeviceStatusByUdn(Ljava/lang/String;Ljava/lang/String;)I
    .locals 10
    .param p1, "status"    # Ljava/lang/String;
    .param p2, "udn"    # Ljava/lang/String;

    .prologue
    const/4 v2, 0x0

    .line 156
    :try_start_0
    new-instance v1, Landroid/content/ContentValues;

    invoke-direct {v1}, Landroid/content/ContentValues;-><init>()V

    .line 158
    .local v1, "values":Landroid/content/ContentValues;
    const-string v3, "status"

    invoke-virtual {v1, v3, p1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 160
    iget-object v3, p0, Lcom/belkin/database/DeviceDatabase;->mDatabse:Landroid/database/sqlite/SQLiteDatabase;

    const-string v4, "devices"

    const-string v5, "deviceudn= ?"

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

    .line 164
    .end local v1    # "values":Landroid/content/ContentValues;
    :goto_0
    return v2

    .line 162
    :catch_0
    move-exception v0

    .line 163
    .local v0, "e":Ljava/lang/Exception;
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_0
.end method

.method public updateSwitches(Landroid/content/ContentValues;)I
    .locals 7
    .param p1, "contentValues"    # Landroid/content/ContentValues;

    .prologue
    .line 220
    :try_start_0
    iget-object v1, p0, Lcom/belkin/database/DeviceDatabase;->mDatabse:Landroid/database/sqlite/SQLiteDatabase;

    const-string v2, "devices"

    const-string v3, "deviceudn=?"

    const/4 v4, 0x1

    new-array v4, v4, [Ljava/lang/String;

    const/4 v5, 0x0

    const-string v6, "deviceudn"

    invoke-virtual {p1, v6}, Landroid/content/ContentValues;->getAsString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    aput-object v6, v4, v5

    invoke-virtual {v1, v2, p1, v3, v4}, Landroid/database/sqlite/SQLiteDatabase;->update(Ljava/lang/String;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result v1

    .line 223
    :goto_0
    return v1

    .line 221
    :catch_0
    move-exception v0

    .line 222
    .local v0, "e":Ljava/lang/Exception;
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    .line 223
    const/4 v1, -0x1

    goto :goto_0
.end method
