.class Lcom/localytics/android/AnalyticsProvider$AnalyticsDatabaseHelper;
.super Lcom/localytics/android/BaseProvider$LocalyticsDatabaseHelper;
.source "AnalyticsProvider.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/localytics/android/AnalyticsProvider;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "AnalyticsDatabaseHelper"
.end annotation


# direct methods
.method constructor <init>(Ljava/lang/String;ILcom/localytics/android/LocalyticsDao;)V
    .locals 0
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "version"    # I
    .param p3, "localyticsDao"    # Lcom/localytics/android/LocalyticsDao;

    .prologue
    .line 354
    invoke-direct {p0, p1, p2, p3}, Lcom/localytics/android/BaseProvider$LocalyticsDatabaseHelper;-><init>(Ljava/lang/String;ILcom/localytics/android/LocalyticsDao;)V

    .line 355
    return-void
.end method


# virtual methods
.method protected addFirstOpenEventToInfoTable(Landroid/database/sqlite/SQLiteDatabase;)V
    .locals 4
    .param p1, "db"    # Landroid/database/sqlite/SQLiteDatabase;

    .prologue
    .line 768
    const-string v0, "ALTER TABLE %s ADD COLUMN %s TEXT;"

    const/4 v1, 0x2

    new-array v1, v1, [Ljava/lang/Object;

    const/4 v2, 0x0

    const-string v3, "info"

    aput-object v3, v1, v2

    const/4 v2, 0x1

    const-string v3, "first_open_event_blob"

    aput-object v3, v1, v2

    invoke-static {v0, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 769
    return-void
.end method

.method protected migrateV2ToV3(Landroid/database/sqlite/SQLiteDatabase;)V
    .locals 46
    .param p1, "db"    # Landroid/database/sqlite/SQLiteDatabase;

    .prologue
    .line 382
    const-string v4, "CREATE TABLE %s (%s INTEGER PRIMARY KEY AUTOINCREMENT, %s TEXT NOT NULL, %s INTEGER NOT NULL);"

    const/4 v5, 0x4

    new-array v5, v5, [Ljava/lang/Object;

    const/4 v6, 0x0

    const-string v7, "events"

    aput-object v7, v5, v6

    const/4 v6, 0x1

    const-string v7, "_id"

    aput-object v7, v5, v6

    const/4 v6, 0x2

    const-string v7, "blob"

    aput-object v7, v5, v6

    const/4 v6, 0x3

    const-string v7, "upload_format"

    aput-object v7, v5, v6

    invoke-static {v4, v5}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    move-object/from16 v0, p1

    invoke-virtual {v0, v4}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 392
    const-string v4, "CREATE TABLE %s (%s TEXT PRIMARY KEY, %s TEXT NOT NULL);"

    const/4 v5, 0x3

    new-array v5, v5, [Ljava/lang/Object;

    const/4 v6, 0x0

    const-string v7, "identifiers"

    aput-object v7, v5, v6

    const/4 v6, 0x1

    const-string v7, "key"

    aput-object v7, v5, v6

    const/4 v6, 0x2

    const-string v7, "value"

    aput-object v7, v5, v6

    invoke-static {v4, v5}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    move-object/from16 v0, p1

    invoke-virtual {v0, v4}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 400
    const-string v4, "CREATE TABLE %s (%s TEXT PRIMARY KEY, %s TEXT NOT NULL);"

    const/4 v5, 0x3

    new-array v5, v5, [Ljava/lang/Object;

    const/4 v6, 0x0

    const-string v7, "custom_dimensions"

    aput-object v7, v5, v6

    const/4 v6, 0x1

    const-string v7, "custom_dimension_key"

    aput-object v7, v5, v6

    const/4 v6, 0x2

    const-string v7, "custom_dimension_value"

    aput-object v7, v5, v6

    invoke-static {v4, v5}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    move-object/from16 v0, p1

    invoke-virtual {v0, v4}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 437
    const-string v4, "CREATE TABLE %s (%s INTEGER PRIMARY KEY AUTOINCREMENT, %s TEXT UNIQUE NOT NULL, %s TEXT UNIQUE NOT NULL, %s INTEGER NOT NULL CHECK (%s >= 0), %s INTEGER NOT NULL CHECK(%s IN (%s, %s)), %s INTEGER NOT NULL CHECK(%s IN (%s, %s)), %s TEXT, %s TEXT, %s TEXT, %s TEXT, %s TEXT, %s TEXT, %s TEXT, %s TEXT, %s TEXT, %s TEXT, %s TEXT, %s TEXT, %s INTEGER CHECK (%s >= 0), %s INTEGER CHECK (%s >= 0), %s INTEGER NOT NULL CHECK (%s >= 0), %s INTEGER NOT NULL CHECK (%s >= 0), %s TEXT, %s INTEGER);"

    const/16 v5, 0x24

    new-array v5, v5, [Ljava/lang/Object;

    const/4 v6, 0x0

    const-string v7, "info"

    aput-object v7, v5, v6

    const/4 v6, 0x1

    const-string v7, "_id"

    aput-object v7, v5, v6

    const/4 v6, 0x2

    const-string v7, "api_key"

    aput-object v7, v5, v6

    const/4 v6, 0x3

    const-string v7, "uuid"

    aput-object v7, v5, v6

    const/4 v6, 0x4

    const-string v7, "created_time"

    aput-object v7, v5, v6

    const/4 v6, 0x5

    const-string v7, "created_time"

    aput-object v7, v5, v6

    const/4 v6, 0x6

    const-string v7, "opt_out"

    aput-object v7, v5, v6

    const/4 v6, 0x7

    const-string v7, "opt_out"

    aput-object v7, v5, v6

    const/16 v6, 0x8

    const-string v7, "0"

    aput-object v7, v5, v6

    const/16 v6, 0x9

    const-string v7, "1"

    aput-object v7, v5, v6

    const/16 v6, 0xa

    const-string v7, "push_disabled"

    aput-object v7, v5, v6

    const/16 v6, 0xb

    const-string v7, "push_disabled"

    aput-object v7, v5, v6

    const/16 v6, 0xc

    const-string v7, "0"

    aput-object v7, v5, v6

    const/16 v6, 0xd

    const-string v7, "1"

    aput-object v7, v5, v6

    const/16 v6, 0xe

    const-string v7, "sender_id"

    aput-object v7, v5, v6

    const/16 v6, 0xf

    const-string v7, "registration_id"

    aput-object v7, v5, v6

    const/16 v6, 0x10

    const-string v7, "registration_version"

    aput-object v7, v5, v6

    const/16 v6, 0x11

    const-string v7, "customer_id"

    aput-object v7, v5, v6

    const/16 v6, 0x12

    const-string v7, "user_type"

    aput-object v7, v5, v6

    const/16 v6, 0x13

    const-string v7, "fb_attribution"

    aput-object v7, v5, v6

    const/16 v6, 0x14

    const-string v7, "play_attribution"

    aput-object v7, v5, v6

    const/16 v6, 0x15

    const-string v7, "first_android_id"

    aput-object v7, v5, v6

    const/16 v6, 0x16

    const-string v7, "first_advertising_id"

    aput-object v7, v5, v6

    const/16 v6, 0x17

    const-string v7, "package_name"

    aput-object v7, v5, v6

    const/16 v6, 0x18

    const-string v7, "app_version"

    aput-object v7, v5, v6

    const/16 v6, 0x19

    const-string v7, "current_session_uuid"

    aput-object v7, v5, v6

    const/16 v6, 0x1a

    const-string v7, "last_session_open_time"

    aput-object v7, v5, v6

    const/16 v6, 0x1b

    const-string v7, "last_session_open_time"

    aput-object v7, v5, v6

    const/16 v6, 0x1c

    const-string v7, "last_session_close_time"

    aput-object v7, v5, v6

    const/16 v6, 0x1d

    const-string v7, "last_session_close_time"

    aput-object v7, v5, v6

    const/16 v6, 0x1e

    const-string v7, "next_session_number"

    aput-object v7, v5, v6

    const/16 v6, 0x1f

    const-string v7, "next_session_number"

    aput-object v7, v5, v6

    const/16 v6, 0x20

    const-string v7, "next_header_number"

    aput-object v7, v5, v6

    const/16 v6, 0x21

    const-string v7, "next_header_number"

    aput-object v7, v5, v6

    const/16 v6, 0x22

    const-string v7, "queued_close_session_blob"

    aput-object v7, v5, v6

    const/16 v6, 0x23

    const-string v7, "queued_close_session_blob_upload_format"

    aput-object v7, v5, v6

    invoke-static {v4, v5}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    move-object/from16 v0, p1

    invoke-virtual {v0, v4}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 488
    sget-object v4, Lcom/localytics/android/AnalyticsProvider$AnalyticsDatabaseHelper;->oldDB:Landroid/database/sqlite/SQLiteDatabase;

    if-eqz v4, :cond_f

    .line 490
    sget-object v45, Lcom/localytics/android/AnalyticsProvider$AnalyticsDatabaseHelper;->oldDB:Landroid/database/sqlite/SQLiteDatabase;

    monitor-enter v45

    .line 492
    const/16 v22, 0x0

    .line 493
    .local v22, "cursor":Landroid/database/Cursor;
    :try_start_0
    new-instance v44, Landroid/content/ContentValues;

    invoke-direct/range {v44 .. v44}, Landroid/content/ContentValues;-><init>()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 495
    .local v44, "values":Landroid/content/ContentValues;
    const/4 v12, 0x0

    .line 496
    .local v12, "apiKey":Ljava/lang/String;
    const/16 v42, 0x0

    .line 497
    .local v42, "uuid":Ljava/lang/String;
    const-wide/16 v16, 0x0

    .line 498
    .local v16, "createdTime":J
    const/16 v38, 0x0

    .line 499
    .local v38, "optedOut":Z
    const-wide/16 v26, 0x1

    .line 500
    .local v26, "headerNumber":J
    const-wide/16 v40, 0x1

    .line 501
    .local v40, "sessionNumber":J
    const/16 v33, 0x0

    .line 502
    .local v33, "newestCloseSessionTag":Ljava/lang/String;
    const-wide/16 v36, 0x0

    .line 503
    .local v36, "newestCloseSessionTime":J
    const/16 v19, 0x0

    .line 504
    .local v19, "currentSessionUUID":Ljava/lang/String;
    const/16 v23, 0x0

    .line 505
    .local v23, "customerID":Ljava/lang/String;
    const/16 v39, 0x0

    .line 509
    .local v39, "screenFlow":Ljava/lang/String;
    :try_start_1
    sget-object v4, Lcom/localytics/android/AnalyticsProvider$AnalyticsDatabaseHelper;->oldDB:Landroid/database/sqlite/SQLiteDatabase;

    const-string v5, "api_keys"

    const/4 v6, 0x0

    const/4 v7, 0x0

    const/4 v8, 0x0

    const/4 v9, 0x0

    const/4 v10, 0x0

    const/4 v11, 0x0

    invoke-virtual/range {v4 .. v11}, Landroid/database/sqlite/SQLiteDatabase;->query(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v22

    .line 510
    invoke-interface/range {v22 .. v22}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v4

    if-eqz v4, :cond_0

    .line 512
    const-string v4, "api_key"

    move-object/from16 v0, v22

    invoke-interface {v0, v4}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v4

    move-object/from16 v0, v22

    invoke-interface {v0, v4}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v12

    .line 513
    const-string v4, "uuid"

    move-object/from16 v0, v22

    invoke-interface {v0, v4}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v4

    move-object/from16 v0, v22

    invoke-interface {v0, v4}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v42

    .line 514
    const-string v4, "created_time"

    move-object/from16 v0, v22

    invoke-interface {v0, v4}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v4

    move-object/from16 v0, v22

    invoke-interface {v0, v4}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v16

    .line 515
    const-string v4, "opt_out"

    move-object/from16 v0, v22

    invoke-interface {v0, v4}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v4

    move-object/from16 v0, v22

    invoke-interface {v0, v4}, Landroid/database/Cursor;->getInt(I)I

    move-result v4

    const-string v5, "1"

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/Integer;->intValue()I
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_2

    move-result v5

    if-ne v4, v5, :cond_4

    const/16 v38, 0x1

    .line 520
    :cond_0
    :goto_0
    if-eqz v22, :cond_1

    .line 522
    :try_start_2
    invoke-interface/range {v22 .. v22}, Landroid/database/Cursor;->close()V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    .line 523
    const/16 v22, 0x0

    .line 529
    :cond_1
    :try_start_3
    sget-object v4, Lcom/localytics/android/AnalyticsProvider$AnalyticsDatabaseHelper;->oldDB:Landroid/database/sqlite/SQLiteDatabase;

    const-string v5, "identifiers"

    const/4 v6, 0x0

    const/4 v7, 0x0

    const/4 v8, 0x0

    const/4 v9, 0x0

    const/4 v10, 0x0

    const/4 v11, 0x0

    invoke-virtual/range {v4 .. v11}, Landroid/database/sqlite/SQLiteDatabase;->query(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v22

    .line 530
    :goto_1
    invoke-interface/range {v22 .. v22}, Landroid/database/Cursor;->moveToNext()Z

    move-result v4

    if-eqz v4, :cond_6

    .line 532
    const-string v4, "key"

    move-object/from16 v0, v22

    invoke-interface {v0, v4}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v4

    move-object/from16 v0, v22

    invoke-interface {v0, v4}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v32

    .line 533
    .local v32, "key":Ljava/lang/String;
    const-string v4, "value"

    move-object/from16 v0, v22

    invoke-interface {v0, v4}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v4

    move-object/from16 v0, v22

    invoke-interface {v0, v4}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v43

    .line 534
    .local v43, "value":Ljava/lang/String;
    const-string v4, "customer_id"

    move-object/from16 v0, v32

    invoke-virtual {v0, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_2

    .line 535
    move-object/from16 v23, v43

    .line 537
    :cond_2
    const-string v4, "key"

    move-object/from16 v0, v44

    move-object/from16 v1, v32

    invoke-virtual {v0, v4, v1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 538
    const-string v4, "value"

    move-object/from16 v0, v44

    move-object/from16 v1, v43

    invoke-virtual {v0, v4, v1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 539
    const-string v4, "identifiers"

    const/4 v5, 0x0

    move-object/from16 v0, p1

    move-object/from16 v1, v44

    invoke-virtual {v0, v4, v5, v1}, Landroid/database/sqlite/SQLiteDatabase;->insert(Ljava/lang/String;Ljava/lang/String;Landroid/content/ContentValues;)J

    .line 540
    invoke-virtual/range {v44 .. v44}, Landroid/content/ContentValues;->clear()V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    goto :goto_1

    .line 545
    .end local v32    # "key":Ljava/lang/String;
    .end local v43    # "value":Ljava/lang/String;
    :catchall_0
    move-exception v4

    if-eqz v22, :cond_3

    .line 547
    :try_start_4
    invoke-interface/range {v22 .. v22}, Landroid/database/Cursor;->close()V

    .line 548
    const/16 v22, 0x0

    :cond_3
    throw v4

    .line 730
    .end local v12    # "apiKey":Ljava/lang/String;
    .end local v16    # "createdTime":J
    .end local v19    # "currentSessionUUID":Ljava/lang/String;
    .end local v23    # "customerID":Ljava/lang/String;
    .end local v26    # "headerNumber":J
    .end local v33    # "newestCloseSessionTag":Ljava/lang/String;
    .end local v36    # "newestCloseSessionTime":J
    .end local v38    # "optedOut":Z
    .end local v39    # "screenFlow":Ljava/lang/String;
    .end local v40    # "sessionNumber":J
    .end local v42    # "uuid":Ljava/lang/String;
    .end local v44    # "values":Landroid/content/ContentValues;
    :catchall_1
    move-exception v4

    monitor-exit v45
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_1

    throw v4

    .line 515
    .restart local v12    # "apiKey":Ljava/lang/String;
    .restart local v16    # "createdTime":J
    .restart local v19    # "currentSessionUUID":Ljava/lang/String;
    .restart local v23    # "customerID":Ljava/lang/String;
    .restart local v26    # "headerNumber":J
    .restart local v33    # "newestCloseSessionTag":Ljava/lang/String;
    .restart local v36    # "newestCloseSessionTime":J
    .restart local v38    # "optedOut":Z
    .restart local v39    # "screenFlow":Ljava/lang/String;
    .restart local v40    # "sessionNumber":J
    .restart local v42    # "uuid":Ljava/lang/String;
    .restart local v44    # "values":Landroid/content/ContentValues;
    :cond_4
    const/16 v38, 0x0

    goto :goto_0

    .line 520
    :catchall_2
    move-exception v4

    if-eqz v22, :cond_5

    .line 522
    :try_start_5
    invoke-interface/range {v22 .. v22}, Landroid/database/Cursor;->close()V

    .line 523
    const/16 v22, 0x0

    :cond_5
    throw v4

    .line 545
    :cond_6
    if-eqz v22, :cond_7

    .line 547
    invoke-interface/range {v22 .. v22}, Landroid/database/Cursor;->close()V
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_1

    .line 548
    const/16 v22, 0x0

    .line 554
    :cond_7
    :try_start_6
    sget-object v4, Lcom/localytics/android/AnalyticsProvider$AnalyticsDatabaseHelper;->oldDB:Landroid/database/sqlite/SQLiteDatabase;

    const-string v5, "custom_dimensions"

    const/4 v6, 0x0

    const/4 v7, 0x0

    const/4 v8, 0x0

    const/4 v9, 0x0

    const/4 v10, 0x0

    const/4 v11, 0x0

    invoke-virtual/range {v4 .. v11}, Landroid/database/sqlite/SQLiteDatabase;->query(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v22

    .line 555
    :goto_2
    invoke-interface/range {v22 .. v22}, Landroid/database/Cursor;->moveToNext()Z

    move-result v4

    if-eqz v4, :cond_9

    .line 557
    const-string v4, "custom_dimension_key"

    move-object/from16 v0, v22

    invoke-interface {v0, v4}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v4

    move-object/from16 v0, v22

    invoke-interface {v0, v4}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v32

    .line 558
    .restart local v32    # "key":Ljava/lang/String;
    const-string v4, "custom_dimension_key"

    const-string v5, "com.localytics.android:"

    const-string v6, ""

    move-object/from16 v0, v32

    invoke-virtual {v0, v5, v6}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v5

    move-object/from16 v0, v44

    invoke-virtual {v0, v4, v5}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 559
    const-string v4, "custom_dimension_value"

    const-string v5, "custom_dimension_value"

    move-object/from16 v0, v22

    invoke-interface {v0, v5}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v5

    move-object/from16 v0, v22

    invoke-interface {v0, v5}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v5

    move-object/from16 v0, v44

    invoke-virtual {v0, v4, v5}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 560
    const-string v4, "custom_dimensions"

    const/4 v5, 0x0

    move-object/from16 v0, p1

    move-object/from16 v1, v44

    invoke-virtual {v0, v4, v5, v1}, Landroid/database/sqlite/SQLiteDatabase;->insert(Ljava/lang/String;Ljava/lang/String;Landroid/content/ContentValues;)J

    .line 561
    invoke-virtual/range {v44 .. v44}, Landroid/content/ContentValues;->clear()V
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_3

    goto :goto_2

    .line 566
    .end local v32    # "key":Ljava/lang/String;
    :catchall_3
    move-exception v4

    if-eqz v22, :cond_8

    .line 568
    :try_start_7
    invoke-interface/range {v22 .. v22}, Landroid/database/Cursor;->close()V

    .line 569
    const/16 v22, 0x0

    :cond_8
    throw v4

    .line 566
    :cond_9
    if-eqz v22, :cond_a

    .line 568
    invoke-interface/range {v22 .. v22}, Landroid/database/Cursor;->close()V

    .line 569
    const/16 v22, 0x0

    .line 573
    :cond_a
    if-eqz v12, :cond_b

    .line 575
    sget-object v4, Lcom/localytics/android/AnalyticsProvider$AnalyticsDatabaseHelper;->oldDB:Landroid/database/sqlite/SQLiteDatabase;

    invoke-static {v4}, Lcom/localytics/android/MigrationDatabaseHelper;->preUploadBuildBlobs(Landroid/database/sqlite/SQLiteDatabase;)V

    .line 577
    const/16 v25, 0x0

    .line 580
    .local v25, "headerBlob":Lorg/json/JSONObject;
    :goto_3
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/localytics/android/AnalyticsProvider$AnalyticsDatabaseHelper;->mLocalyticsDao:Lcom/localytics/android/LocalyticsDao;

    invoke-interface {v4}, Lcom/localytics/android/LocalyticsDao;->getAppContext()Landroid/content/Context;

    move-result-object v4

    sget-object v5, Lcom/localytics/android/AnalyticsProvider$AnalyticsDatabaseHelper;->oldDB:Landroid/database/sqlite/SQLiteDatabase;

    invoke-static {v4, v5, v12}, Lcom/localytics/android/MigrationDatabaseHelper;->convertDatabaseToJson(Landroid/content/Context;Landroid/database/sqlite/SQLiteDatabase;Ljava/lang/String;)Ljava/util/List;

    move-result-object v24

    .line 581
    .local v24, "events":Ljava/util/List;, "Ljava/util/List<Lorg/json/JSONObject;>;"
    invoke-interface/range {v24 .. v24}, Ljava/util/List;->isEmpty()Z
    :try_end_7
    .catchall {:try_start_7 .. :try_end_7} :catchall_1

    move-result v4

    if-eqz v4, :cond_10

    .line 668
    .end local v24    # "events":Ljava/util/List;, "Ljava/util/List<Lorg/json/JSONObject;>;"
    .end local v25    # "headerBlob":Lorg/json/JSONObject;
    :cond_b
    :try_start_8
    sget-object v4, Lcom/localytics/android/AnalyticsProvider$AnalyticsDatabaseHelper;->oldDB:Landroid/database/sqlite/SQLiteDatabase;

    const-string v5, "info"

    const/4 v6, 0x0

    const/4 v7, 0x0

    const/4 v8, 0x0

    const/4 v9, 0x0

    const/4 v10, 0x0

    const/4 v11, 0x0

    invoke-virtual/range {v4 .. v11}, Landroid/database/sqlite/SQLiteDatabase;->query(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v22

    .line 669
    invoke-interface/range {v22 .. v22}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v4

    if-eqz v4, :cond_d

    .line 671
    const-string v4, "api_key"

    move-object/from16 v0, v44

    invoke-virtual {v0, v4, v12}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 672
    const-string v4, "uuid"

    move-object/from16 v0, v44

    move-object/from16 v1, v42

    invoke-virtual {v0, v4, v1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 673
    const-string v4, "created_time"

    invoke-static/range {v16 .. v17}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v5

    move-object/from16 v0, v44

    invoke-virtual {v0, v4, v5}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Long;)V

    .line 674
    const-string v4, "opt_out"

    invoke-static/range {v38 .. v38}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v5

    move-object/from16 v0, v44

    invoke-virtual {v0, v4, v5}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Boolean;)V

    .line 675
    const-string v4, "push_disabled"

    const-string v5, "push_disabled"

    move-object/from16 v0, v22

    invoke-interface {v0, v5}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v5

    move-object/from16 v0, v22

    invoke-interface {v0, v5}, Landroid/database/Cursor;->getInt(I)I

    move-result v5

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    move-object/from16 v0, v44

    invoke-virtual {v0, v4, v5}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 676
    const-string v4, "sender_id"

    const-string v5, "sender_id"

    move-object/from16 v0, v22

    invoke-interface {v0, v5}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v5

    move-object/from16 v0, v22

    invoke-interface {v0, v5}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v5

    move-object/from16 v0, v44

    invoke-virtual {v0, v4, v5}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 677
    const-string v4, "registration_id"

    const-string v5, "registration_id"

    move-object/from16 v0, v22

    invoke-interface {v0, v5}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v5

    move-object/from16 v0, v22

    invoke-interface {v0, v5}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v5

    move-object/from16 v0, v44

    invoke-virtual {v0, v4, v5}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 678
    const-string v4, "registration_version"

    const-string v5, "registration_version"

    move-object/from16 v0, v22

    invoke-interface {v0, v5}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v5

    move-object/from16 v0, v22

    invoke-interface {v0, v5}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v5

    move-object/from16 v0, v44

    invoke-virtual {v0, v4, v5}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 679
    if-eqz v23, :cond_18

    .line 681
    const-string v4, "customer_id"

    move-object/from16 v0, v44

    move-object/from16 v1, v23

    invoke-virtual {v0, v4, v1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 682
    const-string v4, "user_type"

    const-string v5, "known"

    move-object/from16 v0, v44

    invoke-virtual {v0, v4, v5}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 689
    :goto_4
    const-string v4, "fb_attribution"

    const-string v5, "fb_attribution"

    move-object/from16 v0, v22

    invoke-interface {v0, v5}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v5

    move-object/from16 v0, v22

    invoke-interface {v0, v5}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v5

    move-object/from16 v0, v44

    invoke-virtual {v0, v4, v5}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 690
    const-string v4, "play_attribution"

    const-string v5, "play_attribution"

    move-object/from16 v0, v22

    invoke-interface {v0, v5}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v5

    move-object/from16 v0, v22

    invoke-interface {v0, v5}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v5

    move-object/from16 v0, v44

    invoke-virtual {v0, v4, v5}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 691
    const-string v4, "first_android_id"

    const-string v5, "first_android_id"

    move-object/from16 v0, v22

    invoke-interface {v0, v5}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v5

    move-object/from16 v0, v22

    invoke-interface {v0, v5}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v5

    move-object/from16 v0, v44

    invoke-virtual {v0, v4, v5}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 692
    const-string v4, "first_advertising_id"

    const-string v5, "first_advertising_id"

    move-object/from16 v0, v22

    invoke-interface {v0, v5}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v5

    move-object/from16 v0, v22

    invoke-interface {v0, v5}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v5

    move-object/from16 v0, v44

    invoke-virtual {v0, v4, v5}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 693
    const-string v4, "app_version"

    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/localytics/android/AnalyticsProvider$AnalyticsDatabaseHelper;->mLocalyticsDao:Lcom/localytics/android/LocalyticsDao;

    invoke-interface {v5}, Lcom/localytics/android/LocalyticsDao;->getAppContext()Landroid/content/Context;

    move-result-object v5

    invoke-static {v5}, Lcom/localytics/android/DatapointHelper;->getAppVersion(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v5

    move-object/from16 v0, v44

    invoke-virtual {v0, v4, v5}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 694
    const-string v4, "package_name"

    const-string v5, "package_name"

    move-object/from16 v0, v22

    invoke-interface {v0, v5}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v5

    move-object/from16 v0, v22

    invoke-interface {v0, v5}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v5

    move-object/from16 v0, v44

    invoke-virtual {v0, v4, v5}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 695
    const-string v4, "current_session_uuid"

    move-object/from16 v0, v44

    move-object/from16 v1, v19

    invoke-virtual {v0, v4, v1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 696
    const-string v4, "last_session_open_time"

    move-object/from16 v0, v22

    invoke-interface {v0, v4}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v4

    move-object/from16 v0, v22

    invoke-interface {v0, v4}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v34

    .line 697
    .local v34, "lastSessionOpenTime":J
    const-string v4, "last_session_open_time"

    invoke-static/range {v34 .. v35}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v5

    move-object/from16 v0, v44

    invoke-virtual {v0, v4, v5}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Long;)V

    .line 698
    const-string v4, "last_session_close_time"

    invoke-static/range {v36 .. v37}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v5

    move-object/from16 v0, v44

    invoke-virtual {v0, v4, v5}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Long;)V

    .line 699
    const-string v4, "next_header_number"

    const-wide/16 v6, 0x1

    add-long v6, v6, v26

    invoke-static {v6, v7}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v5

    move-object/from16 v0, v44

    invoke-virtual {v0, v4, v5}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Long;)V

    .line 700
    const-string v4, "next_session_number"

    const-wide/16 v6, 0x1

    add-long v6, v6, v40

    invoke-static {v6, v7}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v5

    move-object/from16 v0, v44

    invoke-virtual {v0, v4, v5}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Long;)V

    .line 701
    cmp-long v4, v36, v34

    if-lez v4, :cond_1a

    .line 703
    const-string v4, "queued_close_session_blob"

    move-object/from16 v0, v44

    move-object/from16 v1, v33

    invoke-virtual {v0, v4, v1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 704
    const-string v4, "queued_close_session_blob_upload_format"

    sget-object v5, Lcom/localytics/android/AnalyticsProvider$EventsV3Columns$UploadFormat;->V2:Lcom/localytics/android/AnalyticsProvider$EventsV3Columns$UploadFormat;

    invoke-virtual {v5}, Lcom/localytics/android/AnalyticsProvider$EventsV3Columns$UploadFormat;->getValue()I

    move-result v5

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    move-object/from16 v0, v44

    invoke-virtual {v0, v4, v5}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 705
    if-eqz v39, :cond_c

    .line 707
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/localytics/android/AnalyticsProvider$AnalyticsDatabaseHelper;->mLocalyticsDao:Lcom/localytics/android/LocalyticsDao;

    const-string v5, ","

    move-object/from16 v0, v39

    invoke-virtual {v0, v5}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v5

    invoke-static {v5}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v5

    invoke-interface {v4, v5}, Lcom/localytics/android/LocalyticsDao;->setScreenFlow(Ljava/util/List;)V

    .line 717
    :cond_c
    :goto_5
    const-string v4, "info"

    const/4 v5, 0x0

    move-object/from16 v0, p1

    move-object/from16 v1, v44

    invoke-virtual {v0, v4, v5, v1}, Landroid/database/sqlite/SQLiteDatabase;->insert(Ljava/lang/String;Ljava/lang/String;Landroid/content/ContentValues;)J

    .line 718
    invoke-virtual/range {v44 .. v44}, Landroid/content/ContentValues;->clear()V
    :try_end_8
    .catchall {:try_start_8 .. :try_end_8} :catchall_4

    .line 723
    .end local v34    # "lastSessionOpenTime":J
    :cond_d
    if-eqz v22, :cond_e

    .line 725
    :try_start_9
    invoke-interface/range {v22 .. v22}, Landroid/database/Cursor;->close()V

    .line 729
    :cond_e
    invoke-static {}, Lcom/localytics/android/AnalyticsProvider$AnalyticsDatabaseHelper;->cleanUpOldDB()V

    .line 730
    monitor-exit v45

    .line 732
    .end local v12    # "apiKey":Ljava/lang/String;
    .end local v16    # "createdTime":J
    .end local v19    # "currentSessionUUID":Ljava/lang/String;
    .end local v22    # "cursor":Landroid/database/Cursor;
    .end local v23    # "customerID":Ljava/lang/String;
    .end local v26    # "headerNumber":J
    .end local v33    # "newestCloseSessionTag":Ljava/lang/String;
    .end local v36    # "newestCloseSessionTime":J
    .end local v38    # "optedOut":Z
    .end local v39    # "screenFlow":Ljava/lang/String;
    .end local v40    # "sessionNumber":J
    .end local v42    # "uuid":Ljava/lang/String;
    .end local v44    # "values":Landroid/content/ContentValues;
    :cond_f
    return-void

    .line 585
    .restart local v12    # "apiKey":Ljava/lang/String;
    .restart local v16    # "createdTime":J
    .restart local v19    # "currentSessionUUID":Ljava/lang/String;
    .restart local v22    # "cursor":Landroid/database/Cursor;
    .restart local v23    # "customerID":Ljava/lang/String;
    .restart local v24    # "events":Ljava/util/List;, "Ljava/util/List<Lorg/json/JSONObject;>;"
    .restart local v25    # "headerBlob":Lorg/json/JSONObject;
    .restart local v26    # "headerNumber":J
    .restart local v33    # "newestCloseSessionTag":Ljava/lang/String;
    .restart local v36    # "newestCloseSessionTime":J
    .restart local v38    # "optedOut":Z
    .restart local v39    # "screenFlow":Ljava/lang/String;
    .restart local v40    # "sessionNumber":J
    .restart local v42    # "uuid":Ljava/lang/String;
    .restart local v44    # "values":Landroid/content/ContentValues;
    :cond_10
    new-instance v13, Ljava/lang/StringBuilder;

    invoke-direct {v13}, Ljava/lang/StringBuilder;-><init>()V

    .line 586
    .local v13, "builder":Ljava/lang/StringBuilder;
    invoke-interface/range {v24 .. v24}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v30

    .local v30, "i$":Ljava/util/Iterator;
    move-wide/from16 v28, v26

    .end local v26    # "headerNumber":J
    .local v28, "headerNumber":J
    :goto_6
    invoke-interface/range {v30 .. v30}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_17

    invoke-interface/range {v30 .. v30}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v31

    check-cast v31, Lorg/json/JSONObject;
    :try_end_9
    .catchall {:try_start_9 .. :try_end_9} :catchall_1

    .line 590
    .local v31, "json":Lorg/json/JSONObject;
    :try_start_a
    const-string v4, "dt"

    move-object/from16 v0, v31

    invoke-virtual {v0, v4}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    const-string v5, "h"

    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_11

    .line 592
    if-nez v25, :cond_1b

    .line 594
    const-string v4, "seq"

    move-object/from16 v0, v31

    invoke-virtual {v0, v4}, Lorg/json/JSONObject;->getLong(Ljava/lang/String;)J

    move-result-wide v26

    .line 596
    .end local v28    # "headerNumber":J
    .restart local v26    # "headerNumber":J
    :goto_7
    move-object/from16 v25, v31

    :goto_8
    move-wide/from16 v28, v26

    .line 662
    .end local v26    # "headerNumber":J
    .restart local v28    # "headerNumber":J
    goto :goto_6

    .line 600
    :cond_11
    const-string v4, "seq"
    :try_end_a
    .catch Ljava/lang/Exception; {:try_start_a .. :try_end_a} :catch_1
    .catchall {:try_start_a .. :try_end_a} :catchall_1

    const-wide/16 v6, 0x1

    add-long v26, v28, v6

    .end local v28    # "headerNumber":J
    .restart local v26    # "headerNumber":J
    :try_start_b
    move-object/from16 v0, v25

    move-wide/from16 v1, v28

    invoke-virtual {v0, v4, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;J)Lorg/json/JSONObject;

    .line 601
    const-string v4, "u"

    invoke-static {}, Ljava/util/UUID;->randomUUID()Ljava/util/UUID;

    move-result-object v5

    invoke-virtual {v5}, Ljava/util/UUID;->toString()Ljava/lang/String;

    move-result-object v5

    move-object/from16 v0, v25

    invoke-virtual {v0, v4, v5}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 603
    invoke-virtual/range {v25 .. v25}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v13, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, "\n"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual/range {v31 .. v31}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 604
    const-string v4, "dt"

    move-object/from16 v0, v31

    invoke-virtual {v0, v4}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    const-string v5, "c"

    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_15

    .line 606
    invoke-virtual {v13}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v18

    .line 607
    .local v18, "currentCloseSessionTag":Ljava/lang/String;
    const-string v4, "ct"

    move-object/from16 v0, v31

    invoke-virtual {v0, v4}, Lorg/json/JSONObject;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/Long;

    invoke-virtual {v4}, Ljava/lang/Long;->longValue()J

    move-result-wide v4

    const-wide/16 v6, 0x3e8

    mul-long v20, v4, v6

    .line 611
    .local v20, "currentCloseSessionWallTimeMillis":J
    if-eqz v33, :cond_14

    .line 615
    new-instance v15, Landroid/content/ContentValues;

    invoke-direct {v15}, Landroid/content/ContentValues;-><init>()V

    .line 616
    .local v15, "closeSessionContentValues":Landroid/content/ContentValues;
    const-string v4, "upload_format"

    sget-object v5, Lcom/localytics/android/AnalyticsProvider$EventsV3Columns$UploadFormat;->V2:Lcom/localytics/android/AnalyticsProvider$EventsV3Columns$UploadFormat;

    invoke-virtual {v5}, Lcom/localytics/android/AnalyticsProvider$EventsV3Columns$UploadFormat;->getValue()I

    move-result v5

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    invoke-virtual {v15, v4, v5}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 619
    cmp-long v4, v20, v36

    if-lez v4, :cond_13

    .line 621
    const-string v4, "blob"

    move-object/from16 v0, v33

    invoke-virtual {v15, v4, v0}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 622
    const-string v4, "events"

    const/4 v5, 0x0

    move-object/from16 v0, p1

    invoke-virtual {v0, v4, v5, v15}, Landroid/database/sqlite/SQLiteDatabase;->insert(Ljava/lang/String;Ljava/lang/String;Landroid/content/ContentValues;)J

    .line 625
    move-object/from16 v33, v18

    .line 626
    move-wide/from16 v36, v20

    .line 639
    .end local v15    # "closeSessionContentValues":Landroid/content/ContentValues;
    :goto_9
    const-string v4, "fl"

    move-object/from16 v0, v31

    invoke-virtual {v0, v4}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_12

    .line 641
    const-string v4, "fl"

    move-object/from16 v0, v31

    invoke-virtual {v0, v4}, Lorg/json/JSONObject;->getJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v4

    const-string v5, ","

    invoke-virtual {v4, v5}, Lorg/json/JSONArray;->join(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v39

    .line 655
    .end local v18    # "currentCloseSessionTag":Ljava/lang/String;
    .end local v20    # "currentCloseSessionWallTimeMillis":J
    :cond_12
    :goto_a
    invoke-virtual/range {v44 .. v44}, Landroid/content/ContentValues;->clear()V

    .line 656
    const/4 v4, 0x0

    invoke-virtual {v13}, Ljava/lang/StringBuilder;->length()I

    move-result v5

    invoke-virtual {v13, v4, v5}, Ljava/lang/StringBuilder;->delete(II)Ljava/lang/StringBuilder;

    goto/16 :goto_8

    .line 659
    :catch_0
    move-exception v4

    goto/16 :goto_8

    .line 629
    .restart local v15    # "closeSessionContentValues":Landroid/content/ContentValues;
    .restart local v18    # "currentCloseSessionTag":Ljava/lang/String;
    .restart local v20    # "currentCloseSessionWallTimeMillis":J
    :cond_13
    const-string v4, "blob"

    move-object/from16 v0, v18

    invoke-virtual {v15, v4, v0}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 630
    const-string v4, "events"

    const/4 v5, 0x0

    move-object/from16 v0, p1

    invoke-virtual {v0, v4, v5, v15}, Landroid/database/sqlite/SQLiteDatabase;->insert(Ljava/lang/String;Ljava/lang/String;Landroid/content/ContentValues;)J

    goto :goto_9

    .line 635
    .end local v15    # "closeSessionContentValues":Landroid/content/ContentValues;
    :cond_14
    move-object/from16 v33, v18

    .line 636
    move-wide/from16 v36, v20

    goto :goto_9

    .line 646
    .end local v18    # "currentCloseSessionTag":Ljava/lang/String;
    .end local v20    # "currentCloseSessionWallTimeMillis":J
    :cond_15
    const-string v4, "dt"

    move-object/from16 v0, v31

    invoke-virtual {v0, v4}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    const-string v5, "s"

    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_16

    .line 648
    const-string v4, "nth"

    move-object/from16 v0, v31

    invoke-virtual {v0, v4}, Lorg/json/JSONObject;->getLong(Ljava/lang/String;)J

    move-result-wide v40

    .line 649
    const-string v4, "u"

    move-object/from16 v0, v31

    invoke-virtual {v0, v4}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v19

    .line 651
    :cond_16
    const-string v4, "blob"

    invoke-virtual {v13}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    move-object/from16 v0, v44

    invoke-virtual {v0, v4, v5}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 652
    const-string v4, "upload_format"

    sget-object v5, Lcom/localytics/android/AnalyticsProvider$EventsV3Columns$UploadFormat;->V2:Lcom/localytics/android/AnalyticsProvider$EventsV3Columns$UploadFormat;

    invoke-virtual {v5}, Lcom/localytics/android/AnalyticsProvider$EventsV3Columns$UploadFormat;->getValue()I

    move-result v5

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    move-object/from16 v0, v44

    invoke-virtual {v0, v4, v5}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 653
    const-string v4, "events"

    const/4 v5, 0x0

    move-object/from16 v0, p1

    move-object/from16 v1, v44

    invoke-virtual {v0, v4, v5, v1}, Landroid/database/sqlite/SQLiteDatabase;->insert(Ljava/lang/String;Ljava/lang/String;Landroid/content/ContentValues;)J
    :try_end_b
    .catch Ljava/lang/Exception; {:try_start_b .. :try_end_b} :catch_0
    .catchall {:try_start_b .. :try_end_b} :catchall_1

    goto :goto_a

    .end local v26    # "headerNumber":J
    .end local v31    # "json":Lorg/json/JSONObject;
    .restart local v28    # "headerNumber":J
    :cond_17
    move-wide/from16 v26, v28

    .line 663
    .end local v28    # "headerNumber":J
    .restart local v26    # "headerNumber":J
    goto/16 :goto_3

    .line 686
    .end local v13    # "builder":Ljava/lang/StringBuilder;
    .end local v24    # "events":Ljava/util/List;, "Ljava/util/List<Lorg/json/JSONObject;>;"
    .end local v25    # "headerBlob":Lorg/json/JSONObject;
    .end local v30    # "i$":Ljava/util/Iterator;
    :cond_18
    :try_start_c
    const-string v4, "customer_id"

    move-object/from16 v0, v44

    move-object/from16 v1, v42

    invoke-virtual {v0, v4, v1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 687
    const-string v4, "user_type"

    const-string v5, "anonymous"

    move-object/from16 v0, v44

    invoke-virtual {v0, v4, v5}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_c
    .catchall {:try_start_c .. :try_end_c} :catchall_4

    goto/16 :goto_4

    .line 723
    :catchall_4
    move-exception v4

    if-eqz v22, :cond_19

    .line 725
    :try_start_d
    invoke-interface/range {v22 .. v22}, Landroid/database/Cursor;->close()V

    :cond_19
    throw v4
    :try_end_d
    .catchall {:try_start_d .. :try_end_d} :catchall_1

    .line 710
    .restart local v34    # "lastSessionOpenTime":J
    :cond_1a
    if-eqz v33, :cond_c

    .line 712
    :try_start_e
    new-instance v14, Landroid/content/ContentValues;

    invoke-direct {v14}, Landroid/content/ContentValues;-><init>()V

    .line 713
    .local v14, "closeEventTagValues":Landroid/content/ContentValues;
    const-string v4, "blob"

    move-object/from16 v0, v33

    invoke-virtual {v14, v4, v0}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 714
    const-string v4, "upload_format"

    sget-object v5, Lcom/localytics/android/AnalyticsProvider$EventsV3Columns$UploadFormat;->V2:Lcom/localytics/android/AnalyticsProvider$EventsV3Columns$UploadFormat;

    invoke-virtual {v5}, Lcom/localytics/android/AnalyticsProvider$EventsV3Columns$UploadFormat;->getValue()I

    move-result v5

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    invoke-virtual {v14, v4, v5}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 715
    const-string v4, "events"

    const/4 v5, 0x0

    move-object/from16 v0, p1

    invoke-virtual {v0, v4, v5, v14}, Landroid/database/sqlite/SQLiteDatabase;->insert(Ljava/lang/String;Ljava/lang/String;Landroid/content/ContentValues;)J
    :try_end_e
    .catchall {:try_start_e .. :try_end_e} :catchall_4

    goto/16 :goto_5

    .line 659
    .end local v14    # "closeEventTagValues":Landroid/content/ContentValues;
    .end local v26    # "headerNumber":J
    .end local v34    # "lastSessionOpenTime":J
    .restart local v13    # "builder":Ljava/lang/StringBuilder;
    .restart local v24    # "events":Ljava/util/List;, "Ljava/util/List<Lorg/json/JSONObject;>;"
    .restart local v25    # "headerBlob":Lorg/json/JSONObject;
    .restart local v28    # "headerNumber":J
    .restart local v30    # "i$":Ljava/util/Iterator;
    .restart local v31    # "json":Lorg/json/JSONObject;
    :catch_1
    move-exception v4

    move-wide/from16 v26, v28

    .end local v28    # "headerNumber":J
    .restart local v26    # "headerNumber":J
    goto/16 :goto_8

    .end local v26    # "headerNumber":J
    .restart local v28    # "headerNumber":J
    :cond_1b
    move-wide/from16 v26, v28

    .end local v28    # "headerNumber":J
    .restart local v26    # "headerNumber":J
    goto/16 :goto_7
.end method

.method public onCreate(Landroid/database/sqlite/SQLiteDatabase;)V
    .locals 2
    .param p1, "db"    # Landroid/database/sqlite/SQLiteDatabase;

    .prologue
    .line 369
    if-nez p1, :cond_0

    .line 371
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "db cannot be null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 374
    :cond_0
    const-string v0, "PRAGMA auto_vacuum = INCREMENTAL;"

    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 375
    const/4 v0, 0x0

    const/4 v1, 0x2

    invoke-virtual {p0, p1, v0, v1}, Lcom/localytics/android/AnalyticsProvider$AnalyticsDatabaseHelper;->onUpgrade(Landroid/database/sqlite/SQLiteDatabase;II)V

    .line 376
    return-void
.end method

.method public onOpen(Landroid/database/sqlite/SQLiteDatabase;)V
    .locals 5
    .param p1, "db"    # Landroid/database/sqlite/SQLiteDatabase;

    .prologue
    .line 751
    invoke-super {p0, p1}, Lcom/localytics/android/BaseProvider$LocalyticsDatabaseHelper;->onOpen(Landroid/database/sqlite/SQLiteDatabase;)V

    .line 753
    const-string v0, "SQLite library version is: %s"

    const/4 v1, 0x1

    new-array v1, v1, [Ljava/lang/Object;

    const/4 v2, 0x0

    const-string v3, "select sqlite_version()"

    const/4 v4, 0x0

    invoke-static {p1, v3, v4}, Landroid/database/DatabaseUtils;->stringForQuery(Landroid/database/sqlite/SQLiteDatabase;Ljava/lang/String;[Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    aput-object v3, v1, v2

    invoke-static {v0, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/localytics/android/Localytics$Log;->v(Ljava/lang/String;)I

    .line 755
    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteDatabase;->isReadOnly()Z

    move-result v0

    if-nez v0, :cond_0

    .line 760
    const-string v0, "PRAGMA foreign_keys = ON;"

    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 762
    :cond_0
    return-void
.end method

.method public onUpgrade(Landroid/database/sqlite/SQLiteDatabase;II)V
    .locals 1
    .param p1, "db"    # Landroid/database/sqlite/SQLiteDatabase;
    .param p2, "oldVersion"    # I
    .param p3, "newVersion"    # I

    .prologue
    .line 737
    const/4 v0, 0x1

    if-ge p2, v0, :cond_0

    .line 739
    invoke-virtual {p0, p1}, Lcom/localytics/android/AnalyticsProvider$AnalyticsDatabaseHelper;->migrateV2ToV3(Landroid/database/sqlite/SQLiteDatabase;)V

    .line 742
    :cond_0
    const/4 v0, 0x2

    if-ge p2, v0, :cond_1

    .line 744
    invoke-virtual {p0, p1}, Lcom/localytics/android/AnalyticsProvider$AnalyticsDatabaseHelper;->addFirstOpenEventToInfoTable(Landroid/database/sqlite/SQLiteDatabase;)V

    .line 746
    :cond_1
    return-void
.end method
