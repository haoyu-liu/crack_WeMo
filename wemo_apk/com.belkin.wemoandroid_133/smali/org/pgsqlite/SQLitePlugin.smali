.class public Lorg/pgsqlite/SQLitePlugin;
.super Lorg/apache/cordova/CordovaPlugin;
.source "SQLitePlugin.java"


# static fields
.field private static final TAG:Ljava/lang/String;

.field static dbmap:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Landroid/database/sqlite/SQLiteDatabase;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field dbfile:Ljava/io/File;

.field private mAppController:Lcom/belkin/controller/AppController;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 34
    const-class v0, Lorg/pgsqlite/SQLitePlugin;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lorg/pgsqlite/SQLitePlugin;->TAG:Ljava/lang/String;

    .line 38
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    sput-object v0, Lorg/pgsqlite/SQLitePlugin;->dbmap:Ljava/util/HashMap;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 31
    invoke-direct {p0}, Lorg/apache/cordova/CordovaPlugin;-><init>()V

    return-void
.end method

.method static synthetic access$000(Lorg/pgsqlite/SQLitePlugin;Ljava/lang/String;[Ljava/lang/String;[Lorg/json/JSONArray;[Ljava/lang/String;Lorg/apache/cordova/CallbackContext;)V
    .locals 0
    .param p0, "x0"    # Lorg/pgsqlite/SQLitePlugin;
    .param p1, "x1"    # Ljava/lang/String;
    .param p2, "x2"    # [Ljava/lang/String;
    .param p3, "x3"    # [Lorg/json/JSONArray;
    .param p4, "x4"    # [Ljava/lang/String;
    .param p5, "x5"    # Lorg/apache/cordova/CallbackContext;

    .prologue
    .line 31
    invoke-direct/range {p0 .. p5}, Lorg/pgsqlite/SQLitePlugin;->executeSqlBatch(Ljava/lang/String;[Ljava/lang/String;[Lorg/json/JSONArray;[Ljava/lang/String;Lorg/apache/cordova/CallbackContext;)V

    return-void
.end method

.method private closeDatabase(Ljava/lang/String;)V
    .locals 3
    .param p1, "dbName"    # Ljava/lang/String;

    .prologue
    .line 249
    :try_start_0
    invoke-direct {p0, p1}, Lorg/pgsqlite/SQLitePlugin;->getDatabase(Ljava/lang/String;)Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v1

    .line 250
    .local v1, "mydb":Landroid/database/sqlite/SQLiteDatabase;
    invoke-virtual {v1}, Landroid/database/sqlite/SQLiteDatabase;->inTransaction()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 255
    :cond_0
    if-eqz v1, :cond_1

    .line 259
    sget-object v2, Lorg/pgsqlite/SQLitePlugin;->dbmap:Ljava/util/HashMap;

    invoke-virtual {v2, p1}, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 265
    .end local v1    # "mydb":Landroid/database/sqlite/SQLiteDatabase;
    :cond_1
    :goto_0
    return-void

    .line 261
    :catch_0
    move-exception v0

    .line 263
    .local v0, "e":Ljava/lang/Exception;
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_0
.end method

.method private deleteDatabase(Ljava/lang/String;)Z
    .locals 6
    .param p1, "dbname"    # Ljava/lang/String;
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "NewApi"
        }
    .end annotation

    .prologue
    .line 279
    const/4 v2, 0x0

    .line 281
    .local v2, "status":Z
    invoke-direct {p0, p1}, Lorg/pgsqlite/SQLitePlugin;->getDatabase(Ljava/lang/String;)Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v3

    if-eqz v3, :cond_0

    invoke-direct {p0, p1}, Lorg/pgsqlite/SQLitePlugin;->closeDatabase(Ljava/lang/String;)V

    .line 283
    :cond_0
    iget-object v3, p0, Lorg/pgsqlite/SQLitePlugin;->cordova:Lorg/apache/cordova/CordovaInterface;

    invoke-interface {v3}, Lorg/apache/cordova/CordovaInterface;->getActivity()Landroid/app/Activity;

    move-result-object v3

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v4, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, ".db"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Landroid/app/Activity;->getDatabasePath(Ljava/lang/String;)Ljava/io/File;

    move-result-object v0

    .line 285
    .local v0, "dbfile":Ljava/io/File;
    const-string v3, "info"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "delete sqlite db: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v0}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 289
    :try_start_0
    invoke-static {v0}, Landroid/database/sqlite/SQLiteDatabase;->deleteDatabase(Ljava/io/File;)Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result v2

    .line 296
    :goto_0
    return v2

    .line 290
    :catch_0
    move-exception v1

    .line 292
    .local v1, "ex":Ljava/lang/Exception;
    const-string v3, "executeSqlBatch"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "deleteDatabase(): Error="

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v1}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 293
    invoke-virtual {v1}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_0
.end method

.method private executeSqlBatch(Ljava/lang/String;[Ljava/lang/String;[Lorg/json/JSONArray;[Ljava/lang/String;Lorg/apache/cordova/CallbackContext;)V
    .locals 28
    .param p1, "dbname"    # Ljava/lang/String;
    .param p2, "queryarr"    # [Ljava/lang/String;
    .param p3, "jsonparams"    # [Lorg/json/JSONArray;
    .param p4, "queryIDs"    # [Ljava/lang/String;
    .param p5, "cbc"    # Lorg/apache/cordova/CallbackContext;

    .prologue
    .line 365
    invoke-direct/range {p0 .. p1}, Lorg/pgsqlite/SQLitePlugin;->getDatabase(Ljava/lang/String;)Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v15

    .line 367
    .local v15, "mydb":Landroid/database/sqlite/SQLiteDatabase;
    if-nez v15, :cond_0

    .line 575
    :goto_0
    return-void

    .line 369
    :cond_0
    invoke-virtual {v15}, Landroid/database/sqlite/SQLiteDatabase;->isOpen()Z

    move-result v24

    if-nez v24, :cond_1

    .line 371
    const-string v24, ""

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move-object/from16 v2, v24

    invoke-direct {v0, v1, v2}, Lorg/pgsqlite/SQLitePlugin;->openDatabase(Ljava/lang/String;Ljava/lang/String;)V

    .line 372
    invoke-direct/range {p0 .. p1}, Lorg/pgsqlite/SQLitePlugin;->getDatabase(Ljava/lang/String;)Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v15

    .line 375
    :cond_1
    const-string v18, ""

    .line 376
    .local v18, "query":Ljava/lang/String;
    const-string v21, ""

    .line 377
    .local v21, "query_id":Ljava/lang/String;
    move-object/from16 v0, p2

    array-length v12, v0

    .line 379
    .local v12, "len":I
    new-instance v4, Lorg/json/JSONArray;

    invoke-direct {v4}, Lorg/json/JSONArray;-><init>()V

    .line 381
    .local v4, "batchResults":Lorg/json/JSONArray;
    const/4 v8, 0x0

    .local v8, "i":I
    :goto_1
    if-ge v8, v12, :cond_15

    .line 382
    aget-object v21, p4, v8

    .line 384
    const/16 v19, 0x0

    .line 385
    .local v19, "queryResult":Lorg/json/JSONObject;
    const-string v6, "unknown"

    .line 388
    .local v6, "errorMessage":Ljava/lang/String;
    const/16 v16, 0x1

    .line 390
    .local v16, "needRawQuery":Z
    :try_start_0
    aget-object v18, p2, v8

    .line 391
    const-string v24, "executeSqlBatch"

    new-instance v25, Ljava/lang/StringBuilder;

    invoke-direct/range {v25 .. v25}, Ljava/lang/StringBuilder;-><init>()V

    const-string v26, "SQLiteQuery: "

    invoke-virtual/range {v25 .. v26}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v25

    move-object/from16 v0, v25

    move-object/from16 v1, v18

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v25

    invoke-virtual/range {v25 .. v25}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v25

    invoke-static/range {v24 .. v25}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 395
    sget v24, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v25, 0xb

    move/from16 v0, v24

    move/from16 v1, v25

    if-lt v0, v1, :cond_17

    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    move-result-object v24

    move-object/from16 v0, v18

    move-object/from16 v1, v24

    invoke-virtual {v0, v1}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v24

    const-string v25, "update"

    invoke-virtual/range {v24 .. v25}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v24

    if-nez v24, :cond_2

    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    move-result-object v24

    move-object/from16 v0, v18

    move-object/from16 v1, v24

    invoke-virtual {v0, v1}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v24

    const-string v25, "delete"

    invoke-virtual/range {v24 .. v25}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v24

    if-eqz v24, :cond_17

    .line 399
    :cond_2
    move-object/from16 v0, v18

    invoke-virtual {v15, v0}, Landroid/database/sqlite/SQLiteDatabase;->compileStatement(Ljava/lang/String;)Landroid/database/sqlite/SQLiteStatement;

    move-result-object v14

    .line 401
    .local v14, "myStatement":Landroid/database/sqlite/SQLiteStatement;
    if-eqz p3, :cond_8

    .line 402
    const/4 v9, 0x0

    .local v9, "j":I
    :goto_2
    aget-object v24, p3, v8

    invoke-virtual/range {v24 .. v24}, Lorg/json/JSONArray;->length()I

    move-result v24

    move/from16 v0, v24

    if-ge v9, v0, :cond_8

    .line 403
    aget-object v24, p3, v8

    move-object/from16 v0, v24

    invoke-virtual {v0, v9}, Lorg/json/JSONArray;->get(I)Ljava/lang/Object;

    move-result-object v24

    move-object/from16 v0, v24

    instance-of v0, v0, Ljava/lang/Float;

    move/from16 v24, v0

    if-nez v24, :cond_3

    aget-object v24, p3, v8

    move-object/from16 v0, v24

    invoke-virtual {v0, v9}, Lorg/json/JSONArray;->get(I)Ljava/lang/Object;

    move-result-object v24

    move-object/from16 v0, v24

    instance-of v0, v0, Ljava/lang/Double;

    move/from16 v24, v0

    if-eqz v24, :cond_4

    .line 404
    :cond_3
    add-int/lit8 v24, v9, 0x1

    aget-object v25, p3, v8

    move-object/from16 v0, v25

    invoke-virtual {v0, v9}, Lorg/json/JSONArray;->getDouble(I)D

    move-result-wide v26

    move/from16 v0, v24

    move-wide/from16 v1, v26

    invoke-virtual {v14, v0, v1, v2}, Landroid/database/sqlite/SQLiteStatement;->bindDouble(ID)V

    .line 402
    :goto_3
    add-int/lit8 v9, v9, 0x1

    goto :goto_2

    .line 405
    :cond_4
    aget-object v24, p3, v8

    move-object/from16 v0, v24

    invoke-virtual {v0, v9}, Lorg/json/JSONArray;->get(I)Ljava/lang/Object;

    move-result-object v24

    move-object/from16 v0, v24

    instance-of v0, v0, Ljava/lang/Number;

    move/from16 v24, v0

    if-eqz v24, :cond_6

    .line 406
    add-int/lit8 v24, v9, 0x1

    aget-object v25, p3, v8

    move-object/from16 v0, v25

    invoke-virtual {v0, v9}, Lorg/json/JSONArray;->getLong(I)J

    move-result-wide v26

    move/from16 v0, v24

    move-wide/from16 v1, v26

    invoke-virtual {v14, v0, v1, v2}, Landroid/database/sqlite/SQLiteStatement;->bindLong(IJ)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_3

    .line 541
    .end local v9    # "j":I
    .end local v14    # "myStatement":Landroid/database/sqlite/SQLiteStatement;
    :catch_0
    move-exception v7

    .line 542
    .local v7, "ex":Ljava/lang/Exception;
    :goto_4
    invoke-virtual {v7}, Ljava/lang/Exception;->printStackTrace()V

    .line 543
    invoke-virtual {v7}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v6

    .line 544
    const-string v24, "executeSqlBatch"

    new-instance v25, Ljava/lang/StringBuilder;

    invoke-direct/range {v25 .. v25}, Ljava/lang/StringBuilder;-><init>()V

    const-string v26, "SQLitePlugin.executeSql[Batch](): Error="

    invoke-virtual/range {v25 .. v26}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v25

    move-object/from16 v0, v25

    invoke-virtual {v0, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v25

    invoke-virtual/range {v25 .. v25}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v25

    invoke-static/range {v24 .. v25}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 548
    .end local v7    # "ex":Ljava/lang/Exception;
    :cond_5
    :goto_5
    if-eqz v19, :cond_14

    .line 549
    :try_start_1
    new-instance v22, Lorg/json/JSONObject;

    invoke-direct/range {v22 .. v22}, Lorg/json/JSONObject;-><init>()V

    .line 550
    .local v22, "r":Lorg/json/JSONObject;
    const-string v24, "qid"

    move-object/from16 v0, v22

    move-object/from16 v1, v24

    move-object/from16 v2, v21

    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 552
    const-string v24, "type"

    const-string v25, "success"

    move-object/from16 v0, v22

    move-object/from16 v1, v24

    move-object/from16 v2, v25

    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 553
    const-string v24, "result"

    move-object/from16 v0, v22

    move-object/from16 v1, v24

    move-object/from16 v2, v19

    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 555
    move-object/from16 v0, v22

    invoke-virtual {v4, v0}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;
    :try_end_1
    .catch Lorg/json/JSONException; {:try_start_1 .. :try_end_1} :catch_7

    .line 381
    .end local v22    # "r":Lorg/json/JSONObject;
    :goto_6
    add-int/lit8 v8, v8, 0x1

    goto/16 :goto_1

    .line 407
    .restart local v9    # "j":I
    .restart local v14    # "myStatement":Landroid/database/sqlite/SQLiteStatement;
    :cond_6
    :try_start_2
    aget-object v24, p3, v8

    move-object/from16 v0, v24

    invoke-virtual {v0, v9}, Lorg/json/JSONArray;->isNull(I)Z

    move-result v24

    if-eqz v24, :cond_7

    .line 408
    add-int/lit8 v24, v9, 0x1

    move/from16 v0, v24

    invoke-virtual {v14, v0}, Landroid/database/sqlite/SQLiteStatement;->bindNull(I)V

    goto/16 :goto_3

    .line 410
    :cond_7
    add-int/lit8 v24, v9, 0x1

    aget-object v25, p3, v8

    move-object/from16 v0, v25

    invoke-virtual {v0, v9}, Lorg/json/JSONArray;->getString(I)Ljava/lang/String;

    move-result-object v25

    move/from16 v0, v24

    move-object/from16 v1, v25

    invoke-virtual {v14, v0, v1}, Landroid/database/sqlite/SQLiteStatement;->bindString(ILjava/lang/String;)V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0

    goto/16 :goto_3

    .line 415
    .end local v9    # "j":I
    :cond_8
    const/16 v23, -0x1

    .line 419
    .local v23, "rowsAffected":I
    :try_start_3
    invoke-virtual {v14}, Landroid/database/sqlite/SQLiteStatement;->executeUpdateDelete()I
    :try_end_3
    .catch Landroid/database/sqlite/SQLiteException; {:try_start_3 .. :try_end_3} :catch_1
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_8

    move-result v23

    .line 421
    const/16 v16, 0x0

    .line 433
    :goto_7
    const/16 v24, -0x1

    move/from16 v0, v23

    move/from16 v1, v24

    if-eq v0, v1, :cond_17

    .line 434
    :try_start_4
    new-instance v20, Lorg/json/JSONObject;

    invoke-direct/range {v20 .. v20}, Lorg/json/JSONObject;-><init>()V
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_0

    .line 435
    .end local v19    # "queryResult":Lorg/json/JSONObject;
    .local v20, "queryResult":Lorg/json/JSONObject;
    :try_start_5
    const-string v24, "rowsAffected"

    move-object/from16 v0, v20

    move-object/from16 v1, v24

    move/from16 v2, v23

    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    .line 440
    .end local v14    # "myStatement":Landroid/database/sqlite/SQLiteStatement;
    .end local v23    # "rowsAffected":I
    :goto_8
    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    move-result-object v24

    move-object/from16 v0, v18

    move-object/from16 v1, v24

    invoke-virtual {v0, v1}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v24

    const-string v25, "insert"

    invoke-virtual/range {v24 .. v25}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v24

    if-eqz v24, :cond_e

    if-eqz p3, :cond_e

    .line 441
    const/16 v16, 0x0

    .line 443
    move-object/from16 v0, v18

    invoke-virtual {v15, v0}, Landroid/database/sqlite/SQLiteDatabase;->compileStatement(Ljava/lang/String;)Landroid/database/sqlite/SQLiteStatement;

    move-result-object v14

    .line 445
    .restart local v14    # "myStatement":Landroid/database/sqlite/SQLiteStatement;
    const/4 v9, 0x0

    .restart local v9    # "j":I
    :goto_9
    aget-object v24, p3, v8

    invoke-virtual/range {v24 .. v24}, Lorg/json/JSONArray;->length()I

    move-result v24

    move/from16 v0, v24

    if-ge v9, v0, :cond_d

    .line 446
    aget-object v24, p3, v8

    move-object/from16 v0, v24

    invoke-virtual {v0, v9}, Lorg/json/JSONArray;->get(I)Ljava/lang/Object;

    move-result-object v24

    move-object/from16 v0, v24

    instance-of v0, v0, Ljava/lang/Float;

    move/from16 v24, v0

    if-nez v24, :cond_9

    aget-object v24, p3, v8

    move-object/from16 v0, v24

    invoke-virtual {v0, v9}, Lorg/json/JSONArray;->get(I)Ljava/lang/Object;

    move-result-object v24

    move-object/from16 v0, v24

    instance-of v0, v0, Ljava/lang/Double;

    move/from16 v24, v0

    if-eqz v24, :cond_a

    .line 447
    :cond_9
    add-int/lit8 v24, v9, 0x1

    aget-object v25, p3, v8

    move-object/from16 v0, v25

    invoke-virtual {v0, v9}, Lorg/json/JSONArray;->getDouble(I)D

    move-result-wide v26

    move/from16 v0, v24

    move-wide/from16 v1, v26

    invoke-virtual {v14, v0, v1, v2}, Landroid/database/sqlite/SQLiteStatement;->bindDouble(ID)V
    :try_end_5
    .catch Ljava/lang/Exception; {:try_start_5 .. :try_end_5} :catch_2

    .line 445
    :goto_a
    add-int/lit8 v9, v9, 0x1

    goto :goto_9

    .line 422
    .end local v9    # "j":I
    .end local v20    # "queryResult":Lorg/json/JSONObject;
    .restart local v19    # "queryResult":Lorg/json/JSONObject;
    .restart local v23    # "rowsAffected":I
    :catch_1
    move-exception v7

    .line 424
    .local v7, "ex":Landroid/database/sqlite/SQLiteException;
    :try_start_6
    invoke-virtual {v7}, Landroid/database/sqlite/SQLiteException;->printStackTrace()V

    .line 425
    invoke-virtual {v7}, Landroid/database/sqlite/SQLiteException;->getMessage()Ljava/lang/String;

    move-result-object v6

    .line 426
    const-string v24, "executeSqlBatch"

    new-instance v25, Ljava/lang/StringBuilder;

    invoke-direct/range {v25 .. v25}, Ljava/lang/StringBuilder;-><init>()V

    const-string v26, "SQLiteStatement.executeUpdateDelete(): Error="

    invoke-virtual/range {v25 .. v26}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v25

    move-object/from16 v0, v25

    invoke-virtual {v0, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v25

    invoke-virtual/range {v25 .. v25}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v25

    invoke-static/range {v24 .. v25}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_6
    .catch Ljava/lang/Exception; {:try_start_6 .. :try_end_6} :catch_0

    .line 427
    const/16 v16, 0x0

    .line 431
    goto/16 :goto_7

    .line 448
    .end local v7    # "ex":Landroid/database/sqlite/SQLiteException;
    .end local v19    # "queryResult":Lorg/json/JSONObject;
    .end local v23    # "rowsAffected":I
    .restart local v9    # "j":I
    .restart local v20    # "queryResult":Lorg/json/JSONObject;
    :cond_a
    :try_start_7
    aget-object v24, p3, v8

    move-object/from16 v0, v24

    invoke-virtual {v0, v9}, Lorg/json/JSONArray;->get(I)Ljava/lang/Object;

    move-result-object v24

    move-object/from16 v0, v24

    instance-of v0, v0, Ljava/lang/Number;

    move/from16 v24, v0

    if-eqz v24, :cond_b

    .line 449
    add-int/lit8 v24, v9, 0x1

    aget-object v25, p3, v8

    move-object/from16 v0, v25

    invoke-virtual {v0, v9}, Lorg/json/JSONArray;->getLong(I)J

    move-result-wide v26

    move/from16 v0, v24

    move-wide/from16 v1, v26

    invoke-virtual {v14, v0, v1, v2}, Landroid/database/sqlite/SQLiteStatement;->bindLong(IJ)V

    goto :goto_a

    .line 541
    .end local v9    # "j":I
    .end local v14    # "myStatement":Landroid/database/sqlite/SQLiteStatement;
    :catch_2
    move-exception v7

    move-object/from16 v19, v20

    .end local v20    # "queryResult":Lorg/json/JSONObject;
    .restart local v19    # "queryResult":Lorg/json/JSONObject;
    goto/16 :goto_4

    .line 450
    .end local v19    # "queryResult":Lorg/json/JSONObject;
    .restart local v9    # "j":I
    .restart local v14    # "myStatement":Landroid/database/sqlite/SQLiteStatement;
    .restart local v20    # "queryResult":Lorg/json/JSONObject;
    :cond_b
    aget-object v24, p3, v8

    move-object/from16 v0, v24

    invoke-virtual {v0, v9}, Lorg/json/JSONArray;->isNull(I)Z

    move-result v24

    if-eqz v24, :cond_c

    .line 451
    add-int/lit8 v24, v9, 0x1

    move/from16 v0, v24

    invoke-virtual {v14, v0}, Landroid/database/sqlite/SQLiteStatement;->bindNull(I)V

    goto :goto_a

    .line 453
    :cond_c
    add-int/lit8 v24, v9, 0x1

    aget-object v25, p3, v8

    move-object/from16 v0, v25

    invoke-virtual {v0, v9}, Lorg/json/JSONArray;->getString(I)Ljava/lang/String;

    move-result-object v25

    move/from16 v0, v24

    move-object/from16 v1, v25

    invoke-virtual {v14, v0, v1}, Landroid/database/sqlite/SQLiteStatement;->bindString(ILjava/lang/String;)V
    :try_end_7
    .catch Ljava/lang/Exception; {:try_start_7 .. :try_end_7} :catch_2

    goto :goto_a

    .line 457
    :cond_d
    const-wide/16 v10, -0x1

    .line 460
    .local v10, "insertId":J
    :try_start_8
    invoke-virtual {v14}, Landroid/database/sqlite/SQLiteStatement;->executeInsert()J
    :try_end_8
    .catch Landroid/database/sqlite/SQLiteException; {:try_start_8 .. :try_end_8} :catch_3
    .catch Ljava/lang/Exception; {:try_start_8 .. :try_end_8} :catch_2

    move-result-wide v10

    .line 467
    :goto_b
    const-wide/16 v24, -0x1

    cmp-long v24, v10, v24

    if-eqz v24, :cond_e

    .line 468
    :try_start_9
    new-instance v19, Lorg/json/JSONObject;

    invoke-direct/range {v19 .. v19}, Lorg/json/JSONObject;-><init>()V
    :try_end_9
    .catch Ljava/lang/Exception; {:try_start_9 .. :try_end_9} :catch_2

    .line 469
    .end local v20    # "queryResult":Lorg/json/JSONObject;
    .restart local v19    # "queryResult":Lorg/json/JSONObject;
    :try_start_a
    const-string v24, "insertId"

    move-object/from16 v0, v19

    move-object/from16 v1, v24

    invoke-virtual {v0, v1, v10, v11}, Lorg/json/JSONObject;->put(Ljava/lang/String;J)Lorg/json/JSONObject;

    .line 470
    const-string v24, "rowsAffected"

    const/16 v25, 0x1

    move-object/from16 v0, v19

    move-object/from16 v1, v24

    move/from16 v2, v25

    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;
    :try_end_a
    .catch Ljava/lang/Exception; {:try_start_a .. :try_end_a} :catch_0

    move-object/from16 v20, v19

    .line 474
    .end local v9    # "j":I
    .end local v10    # "insertId":J
    .end local v14    # "myStatement":Landroid/database/sqlite/SQLiteStatement;
    .end local v19    # "queryResult":Lorg/json/JSONObject;
    .restart local v20    # "queryResult":Lorg/json/JSONObject;
    :cond_e
    :try_start_b
    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    move-result-object v24

    move-object/from16 v0, v18

    move-object/from16 v1, v24

    invoke-virtual {v0, v1}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v24

    const-string v25, "begin"

    invoke-virtual/range {v24 .. v25}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z
    :try_end_b
    .catch Ljava/lang/Exception; {:try_start_b .. :try_end_b} :catch_2

    move-result v24

    if-eqz v24, :cond_f

    .line 475
    const/16 v16, 0x0

    .line 477
    :try_start_c
    invoke-virtual {v15}, Landroid/database/sqlite/SQLiteDatabase;->beginTransaction()V

    .line 479
    new-instance v19, Lorg/json/JSONObject;

    invoke-direct/range {v19 .. v19}, Lorg/json/JSONObject;-><init>()V
    :try_end_c
    .catch Landroid/database/sqlite/SQLiteException; {:try_start_c .. :try_end_c} :catch_4
    .catch Ljava/lang/Exception; {:try_start_c .. :try_end_c} :catch_2

    .line 480
    .end local v20    # "queryResult":Lorg/json/JSONObject;
    .restart local v19    # "queryResult":Lorg/json/JSONObject;
    :try_start_d
    const-string v24, "rowsAffected"

    const/16 v25, 0x0

    move-object/from16 v0, v19

    move-object/from16 v1, v24

    move/from16 v2, v25

    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;
    :try_end_d
    .catch Landroid/database/sqlite/SQLiteException; {:try_start_d .. :try_end_d} :catch_b
    .catch Ljava/lang/Exception; {:try_start_d .. :try_end_d} :catch_0

    move-object/from16 v20, v19

    .line 488
    .end local v19    # "queryResult":Lorg/json/JSONObject;
    .restart local v20    # "queryResult":Lorg/json/JSONObject;
    :cond_f
    :goto_c
    :try_start_e
    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    move-result-object v24

    move-object/from16 v0, v18

    move-object/from16 v1, v24

    invoke-virtual {v0, v1}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v24

    const-string v25, "commit"

    invoke-virtual/range {v24 .. v25}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z
    :try_end_e
    .catch Ljava/lang/Exception; {:try_start_e .. :try_end_e} :catch_2

    move-result v24

    if-eqz v24, :cond_10

    .line 489
    const/16 v16, 0x0

    .line 491
    :try_start_f
    invoke-virtual {v15}, Landroid/database/sqlite/SQLiteDatabase;->setTransactionSuccessful()V

    .line 492
    invoke-virtual {v15}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    .line 494
    new-instance v19, Lorg/json/JSONObject;

    invoke-direct/range {v19 .. v19}, Lorg/json/JSONObject;-><init>()V
    :try_end_f
    .catch Landroid/database/sqlite/SQLiteException; {:try_start_f .. :try_end_f} :catch_5
    .catch Ljava/lang/Exception; {:try_start_f .. :try_end_f} :catch_2

    .line 495
    .end local v20    # "queryResult":Lorg/json/JSONObject;
    .restart local v19    # "queryResult":Lorg/json/JSONObject;
    :try_start_10
    const-string v24, "rowsAffected"

    const/16 v25, 0x0

    move-object/from16 v0, v19

    move-object/from16 v1, v24

    move/from16 v2, v25

    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;
    :try_end_10
    .catch Landroid/database/sqlite/SQLiteException; {:try_start_10 .. :try_end_10} :catch_a
    .catch Ljava/lang/Exception; {:try_start_10 .. :try_end_10} :catch_0

    move-object/from16 v20, v19

    .line 503
    .end local v19    # "queryResult":Lorg/json/JSONObject;
    .restart local v20    # "queryResult":Lorg/json/JSONObject;
    :cond_10
    :goto_d
    :try_start_11
    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    move-result-object v24

    move-object/from16 v0, v18

    move-object/from16 v1, v24

    invoke-virtual {v0, v1}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v24

    const-string v25, "rollback"

    invoke-virtual/range {v24 .. v25}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z
    :try_end_11
    .catch Ljava/lang/Exception; {:try_start_11 .. :try_end_11} :catch_2

    move-result v24

    if-eqz v24, :cond_16

    .line 504
    const/16 v16, 0x0

    .line 506
    :try_start_12
    invoke-virtual {v15}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    .line 508
    new-instance v19, Lorg/json/JSONObject;

    invoke-direct/range {v19 .. v19}, Lorg/json/JSONObject;-><init>()V
    :try_end_12
    .catch Landroid/database/sqlite/SQLiteException; {:try_start_12 .. :try_end_12} :catch_6
    .catch Ljava/lang/Exception; {:try_start_12 .. :try_end_12} :catch_2

    .line 509
    .end local v20    # "queryResult":Lorg/json/JSONObject;
    .restart local v19    # "queryResult":Lorg/json/JSONObject;
    :try_start_13
    const-string v24, "rowsAffected"

    const/16 v25, 0x0

    move-object/from16 v0, v19

    move-object/from16 v1, v24

    move/from16 v2, v25

    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;
    :try_end_13
    .catch Landroid/database/sqlite/SQLiteException; {:try_start_13 .. :try_end_13} :catch_9
    .catch Ljava/lang/Exception; {:try_start_13 .. :try_end_13} :catch_0

    .line 518
    :goto_e
    if-eqz v16, :cond_5

    .line 519
    const/16 v17, 0x0

    .line 521
    .local v17, "params":[Ljava/lang/String;
    if-eqz p3, :cond_12

    .line 522
    :try_start_14
    aget-object v24, p3, v8

    invoke-virtual/range {v24 .. v24}, Lorg/json/JSONArray;->length()I

    move-result v24

    move/from16 v0, v24

    new-array v0, v0, [Ljava/lang/String;

    move-object/from16 v17, v0

    .line 524
    const/4 v9, 0x0

    .restart local v9    # "j":I
    :goto_f
    aget-object v24, p3, v8

    invoke-virtual/range {v24 .. v24}, Lorg/json/JSONArray;->length()I

    move-result v24

    move/from16 v0, v24

    if-ge v9, v0, :cond_12

    .line 525
    aget-object v24, p3, v8

    move-object/from16 v0, v24

    invoke-virtual {v0, v9}, Lorg/json/JSONArray;->isNull(I)Z

    move-result v24

    if-eqz v24, :cond_11

    .line 526
    const-string v24, ""

    aput-object v24, v17, v9
    :try_end_14
    .catch Ljava/lang/Exception; {:try_start_14 .. :try_end_14} :catch_0

    .line 524
    :goto_10
    add-int/lit8 v9, v9, 0x1

    goto :goto_f

    .line 461
    .end local v17    # "params":[Ljava/lang/String;
    .end local v19    # "queryResult":Lorg/json/JSONObject;
    .restart local v10    # "insertId":J
    .restart local v14    # "myStatement":Landroid/database/sqlite/SQLiteStatement;
    .restart local v20    # "queryResult":Lorg/json/JSONObject;
    :catch_3
    move-exception v7

    .line 462
    .restart local v7    # "ex":Landroid/database/sqlite/SQLiteException;
    :try_start_15
    invoke-virtual {v7}, Landroid/database/sqlite/SQLiteException;->printStackTrace()V

    .line 463
    invoke-virtual {v7}, Landroid/database/sqlite/SQLiteException;->getMessage()Ljava/lang/String;

    move-result-object v6

    .line 464
    const-string v24, "executeSqlBatch"

    new-instance v25, Ljava/lang/StringBuilder;

    invoke-direct/range {v25 .. v25}, Ljava/lang/StringBuilder;-><init>()V

    const-string v26, "SQLiteDatabase.executeInsert(): Error="

    invoke-virtual/range {v25 .. v26}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v25

    move-object/from16 v0, v25

    invoke-virtual {v0, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v25

    invoke-virtual/range {v25 .. v25}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v25

    invoke-static/range {v24 .. v25}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_15
    .catch Ljava/lang/Exception; {:try_start_15 .. :try_end_15} :catch_2

    goto/16 :goto_b

    .line 481
    .end local v7    # "ex":Landroid/database/sqlite/SQLiteException;
    .end local v9    # "j":I
    .end local v10    # "insertId":J
    .end local v14    # "myStatement":Landroid/database/sqlite/SQLiteStatement;
    :catch_4
    move-exception v7

    move-object/from16 v19, v20

    .line 482
    .end local v20    # "queryResult":Lorg/json/JSONObject;
    .restart local v7    # "ex":Landroid/database/sqlite/SQLiteException;
    .restart local v19    # "queryResult":Lorg/json/JSONObject;
    :goto_11
    :try_start_16
    invoke-virtual {v7}, Landroid/database/sqlite/SQLiteException;->printStackTrace()V

    .line 483
    invoke-virtual {v7}, Landroid/database/sqlite/SQLiteException;->getMessage()Ljava/lang/String;

    move-result-object v6

    .line 484
    const-string v24, "executeSqlBatch"

    new-instance v25, Ljava/lang/StringBuilder;

    invoke-direct/range {v25 .. v25}, Ljava/lang/StringBuilder;-><init>()V

    const-string v26, "SQLiteDatabase.beginTransaction(): Error="

    invoke-virtual/range {v25 .. v26}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v25

    move-object/from16 v0, v25

    invoke-virtual {v0, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v25

    invoke-virtual/range {v25 .. v25}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v25

    invoke-static/range {v24 .. v25}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    move-object/from16 v20, v19

    .end local v19    # "queryResult":Lorg/json/JSONObject;
    .restart local v20    # "queryResult":Lorg/json/JSONObject;
    goto/16 :goto_c

    .line 496
    .end local v7    # "ex":Landroid/database/sqlite/SQLiteException;
    :catch_5
    move-exception v7

    move-object/from16 v19, v20

    .line 497
    .end local v20    # "queryResult":Lorg/json/JSONObject;
    .restart local v7    # "ex":Landroid/database/sqlite/SQLiteException;
    .restart local v19    # "queryResult":Lorg/json/JSONObject;
    :goto_12
    invoke-virtual {v7}, Landroid/database/sqlite/SQLiteException;->printStackTrace()V

    .line 498
    invoke-virtual {v7}, Landroid/database/sqlite/SQLiteException;->getMessage()Ljava/lang/String;

    move-result-object v6

    .line 499
    const-string v24, "executeSqlBatch"

    new-instance v25, Ljava/lang/StringBuilder;

    invoke-direct/range {v25 .. v25}, Ljava/lang/StringBuilder;-><init>()V

    const-string v26, "SQLiteDatabase.setTransactionSuccessful/endTransaction(): Error="

    invoke-virtual/range {v25 .. v26}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v25

    move-object/from16 v0, v25

    invoke-virtual {v0, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v25

    invoke-virtual/range {v25 .. v25}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v25

    invoke-static/range {v24 .. v25}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    move-object/from16 v20, v19

    .end local v19    # "queryResult":Lorg/json/JSONObject;
    .restart local v20    # "queryResult":Lorg/json/JSONObject;
    goto/16 :goto_d

    .line 510
    .end local v7    # "ex":Landroid/database/sqlite/SQLiteException;
    :catch_6
    move-exception v7

    move-object/from16 v19, v20

    .line 511
    .end local v20    # "queryResult":Lorg/json/JSONObject;
    .restart local v7    # "ex":Landroid/database/sqlite/SQLiteException;
    .restart local v19    # "queryResult":Lorg/json/JSONObject;
    :goto_13
    invoke-virtual {v7}, Landroid/database/sqlite/SQLiteException;->printStackTrace()V

    .line 512
    invoke-virtual {v7}, Landroid/database/sqlite/SQLiteException;->getMessage()Ljava/lang/String;

    move-result-object v6

    .line 513
    const-string v24, "executeSqlBatch"

    new-instance v25, Ljava/lang/StringBuilder;

    invoke-direct/range {v25 .. v25}, Ljava/lang/StringBuilder;-><init>()V

    const-string v26, "SQLiteDatabase.endTransaction(): Error="

    invoke-virtual/range {v25 .. v26}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v25

    move-object/from16 v0, v25

    invoke-virtual {v0, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v25

    invoke-virtual/range {v25 .. v25}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v25

    invoke-static/range {v24 .. v25}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    goto/16 :goto_e

    .line 528
    .end local v7    # "ex":Landroid/database/sqlite/SQLiteException;
    .restart local v9    # "j":I
    .restart local v17    # "params":[Ljava/lang/String;
    :cond_11
    aget-object v24, p3, v8

    move-object/from16 v0, v24

    invoke-virtual {v0, v9}, Lorg/json/JSONArray;->getString(I)Ljava/lang/String;

    move-result-object v24

    aput-object v24, v17, v9

    goto/16 :goto_10

    .line 532
    .end local v9    # "j":I
    :cond_12
    move-object/from16 v0, v18

    move-object/from16 v1, v17

    invoke-virtual {v15, v0, v1}, Landroid/database/sqlite/SQLiteDatabase;->rawQuery(Ljava/lang/String;[Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v13

    .line 534
    .local v13, "myCursor":Landroid/database/Cursor;
    invoke-virtual/range {v21 .. v21}, Ljava/lang/String;->length()I

    move-result v24

    if-lez v24, :cond_13

    .line 535
    move-object/from16 v0, p0

    invoke-direct {v0, v13}, Lorg/pgsqlite/SQLitePlugin;->getRowsResultFromQuery(Landroid/database/Cursor;)Lorg/json/JSONObject;

    move-result-object v19

    .line 538
    :cond_13
    if-eqz v13, :cond_5

    invoke-interface {v13}, Landroid/database/Cursor;->isClosed()Z

    move-result v24

    if-nez v24, :cond_5

    .line 539
    invoke-interface {v13}, Landroid/database/Cursor;->close()V
    :try_end_16
    .catch Ljava/lang/Exception; {:try_start_16 .. :try_end_16} :catch_0

    goto/16 :goto_5

    .line 557
    .end local v13    # "myCursor":Landroid/database/Cursor;
    .end local v17    # "params":[Ljava/lang/String;
    :cond_14
    :try_start_17
    new-instance v22, Lorg/json/JSONObject;

    invoke-direct/range {v22 .. v22}, Lorg/json/JSONObject;-><init>()V

    .line 558
    .restart local v22    # "r":Lorg/json/JSONObject;
    const-string v24, "qid"

    move-object/from16 v0, v22

    move-object/from16 v1, v24

    move-object/from16 v2, v21

    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 559
    const-string v24, "type"

    const-string v25, "error"

    move-object/from16 v0, v22

    move-object/from16 v1, v24

    move-object/from16 v2, v25

    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 561
    new-instance v5, Lorg/json/JSONObject;

    invoke-direct {v5}, Lorg/json/JSONObject;-><init>()V

    .line 562
    .local v5, "er":Lorg/json/JSONObject;
    const-string v24, "message"

    move-object/from16 v0, v24

    invoke-virtual {v5, v0, v6}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 563
    const-string v24, "result"

    move-object/from16 v0, v22

    move-object/from16 v1, v24

    invoke-virtual {v0, v1, v5}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 565
    move-object/from16 v0, v22

    invoke-virtual {v4, v0}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;
    :try_end_17
    .catch Lorg/json/JSONException; {:try_start_17 .. :try_end_17} :catch_7

    goto/16 :goto_6

    .line 567
    .end local v5    # "er":Lorg/json/JSONObject;
    .end local v22    # "r":Lorg/json/JSONObject;
    :catch_7
    move-exception v7

    .line 568
    .local v7, "ex":Lorg/json/JSONException;
    invoke-virtual {v7}, Lorg/json/JSONException;->printStackTrace()V

    .line 569
    const-string v24, "executeSqlBatch"

    new-instance v25, Ljava/lang/StringBuilder;

    invoke-direct/range {v25 .. v25}, Ljava/lang/StringBuilder;-><init>()V

    const-string v26, "SQLitePlugin.executeSql[Batch](): Error="

    invoke-virtual/range {v25 .. v26}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v25

    invoke-virtual {v7}, Lorg/json/JSONException;->getMessage()Ljava/lang/String;

    move-result-object v26

    invoke-virtual/range {v25 .. v26}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v25

    invoke-virtual/range {v25 .. v25}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v25

    invoke-static/range {v24 .. v25}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    goto/16 :goto_6

    .line 574
    .end local v6    # "errorMessage":Ljava/lang/String;
    .end local v7    # "ex":Lorg/json/JSONException;
    .end local v16    # "needRawQuery":Z
    .end local v19    # "queryResult":Lorg/json/JSONObject;
    :cond_15
    move-object/from16 v0, p5

    invoke-virtual {v0, v4}, Lorg/apache/cordova/CallbackContext;->success(Lorg/json/JSONArray;)V

    goto/16 :goto_0

    .line 428
    .restart local v6    # "errorMessage":Ljava/lang/String;
    .restart local v14    # "myStatement":Landroid/database/sqlite/SQLiteStatement;
    .restart local v16    # "needRawQuery":Z
    .restart local v19    # "queryResult":Lorg/json/JSONObject;
    .restart local v23    # "rowsAffected":I
    :catch_8
    move-exception v24

    goto/16 :goto_7

    .line 510
    .end local v14    # "myStatement":Landroid/database/sqlite/SQLiteStatement;
    .end local v23    # "rowsAffected":I
    :catch_9
    move-exception v7

    goto/16 :goto_13

    .line 496
    :catch_a
    move-exception v7

    goto/16 :goto_12

    .line 481
    :catch_b
    move-exception v7

    goto/16 :goto_11

    .end local v19    # "queryResult":Lorg/json/JSONObject;
    .restart local v20    # "queryResult":Lorg/json/JSONObject;
    :cond_16
    move-object/from16 v19, v20

    .end local v20    # "queryResult":Lorg/json/JSONObject;
    .restart local v19    # "queryResult":Lorg/json/JSONObject;
    goto/16 :goto_e

    :cond_17
    move-object/from16 v20, v19

    .end local v19    # "queryResult":Lorg/json/JSONObject;
    .restart local v20    # "queryResult":Lorg/json/JSONObject;
    goto/16 :goto_8
.end method

.method private executeSqlBatchInBackground(Ljava/lang/String;[Ljava/lang/String;[Lorg/json/JSONArray;[Ljava/lang/String;Lorg/apache/cordova/CallbackContext;)V
    .locals 9
    .param p1, "dbName"    # Ljava/lang/String;
    .param p2, "queryarr"    # [Ljava/lang/String;
    .param p3, "jsonparams"    # [Lorg/json/JSONArray;
    .param p4, "queryIDs"    # [Ljava/lang/String;
    .param p5, "cbc"    # Lorg/apache/cordova/CallbackContext;

    .prologue
    .line 333
    move-object v2, p0

    .line 335
    .local v2, "myself":Lorg/pgsqlite/SQLitePlugin;
    iget-object v0, p0, Lorg/pgsqlite/SQLitePlugin;->cordova:Lorg/apache/cordova/CordovaInterface;

    invoke-interface {v0}, Lorg/apache/cordova/CordovaInterface;->getThreadPool()Ljava/util/concurrent/ExecutorService;

    move-result-object v8

    new-instance v0, Lorg/pgsqlite/SQLitePlugin$1;

    move-object v1, p0

    move-object v3, p1

    move-object v4, p2

    move-object v5, p3

    move-object v6, p4

    move-object v7, p5

    invoke-direct/range {v0 .. v7}, Lorg/pgsqlite/SQLitePlugin$1;-><init>(Lorg/pgsqlite/SQLitePlugin;Lorg/pgsqlite/SQLitePlugin;Ljava/lang/String;[Ljava/lang/String;[Lorg/json/JSONArray;[Ljava/lang/String;Lorg/apache/cordova/CallbackContext;)V

    invoke-interface {v8, v0}, Ljava/util/concurrent/ExecutorService;->execute(Ljava/lang/Runnable;)V

    .line 342
    return-void
.end method

.method private getDatabase(Ljava/lang/String;)Landroid/database/sqlite/SQLiteDatabase;
    .locals 1
    .param p1, "dbname"    # Ljava/lang/String;

    .prologue
    .line 308
    invoke-static {p1}, Lorg/pgsqlite/SQLiteDBInstances;->getDBInstance(Ljava/lang/String;)Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v0

    return-object v0
.end method

.method private getRowsResultFromQuery(Landroid/database/Cursor;)Lorg/json/JSONObject;
    .locals 12
    .param p1, "cur"    # Landroid/database/Cursor;

    .prologue
    .line 588
    new-instance v8, Lorg/json/JSONObject;

    invoke-direct {v8}, Lorg/json/JSONObject;-><init>()V

    .line 591
    .local v8, "rowsResult":Lorg/json/JSONObject;
    invoke-interface {p1}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v9

    if-eqz v9, :cond_1

    .line 592
    new-instance v7, Lorg/json/JSONArray;

    invoke-direct {v7}, Lorg/json/JSONArray;-><init>()V

    .line 593
    .local v7, "rowsArrayResult":Lorg/json/JSONArray;
    const-string v5, ""

    .line 594
    .local v5, "key":Ljava/lang/String;
    invoke-interface {p1}, Landroid/database/Cursor;->getColumnCount()I

    move-result v0

    .line 598
    .local v0, "colCount":I
    :cond_0
    new-instance v6, Lorg/json/JSONObject;

    invoke-direct {v6}, Lorg/json/JSONObject;-><init>()V

    .line 600
    .local v6, "row":Lorg/json/JSONObject;
    const/4 v4, 0x0

    .local v4, "i":I
    :goto_0
    if-ge v4, v0, :cond_3

    .line 601
    :try_start_0
    invoke-interface {p1, v4}, Landroid/database/Cursor;->getColumnName(I)Ljava/lang/String;

    move-result-object v5

    .line 605
    sget v9, Landroid/os/Build$VERSION;->SDK_INT:I
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_1

    const/16 v10, 0xb

    if-lt v9, v10, :cond_2

    .line 607
    const/4 v1, 0x3

    .line 611
    .local v1, "curType":I
    :try_start_1
    invoke-interface {p1, v4}, Landroid/database/Cursor;->getType(I)I

    move-result v1

    .line 613
    packed-switch v1, :pswitch_data_0

    .line 629
    :pswitch_0
    invoke-interface {p1, v4}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v6, v5, v9}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 600
    .end local v1    # "curType":I
    :goto_1
    add-int/lit8 v4, v4, 0x1

    goto :goto_0

    .line 616
    .restart local v1    # "curType":I
    :pswitch_1
    sget-object v9, Lorg/json/JSONObject;->NULL:Ljava/lang/Object;

    invoke-virtual {v6, v5, v9}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0
    .catch Lorg/json/JSONException; {:try_start_1 .. :try_end_1} :catch_1

    goto :goto_1

    .line 633
    :catch_0
    move-exception v3

    .line 635
    .local v3, "ex":Ljava/lang/Exception;
    :try_start_2
    invoke-interface {p1, v4}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v6, v5, v9}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_2
    .catch Lorg/json/JSONException; {:try_start_2 .. :try_end_2} :catch_1

    goto :goto_1

    .line 646
    .end local v1    # "curType":I
    .end local v3    # "ex":Ljava/lang/Exception;
    :catch_1
    move-exception v2

    .line 647
    .local v2, "e":Lorg/json/JSONException;
    invoke-virtual {v2}, Lorg/json/JSONException;->printStackTrace()V

    .line 650
    .end local v2    # "e":Lorg/json/JSONException;
    :goto_2
    invoke-interface {p1}, Landroid/database/Cursor;->moveToNext()Z

    move-result v9

    if-nez v9, :cond_0

    .line 653
    :try_start_3
    const-string v9, "rows"

    invoke-virtual {v8, v9, v7}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_3
    .catch Lorg/json/JSONException; {:try_start_3 .. :try_end_3} :catch_2

    .line 659
    .end local v0    # "colCount":I
    .end local v4    # "i":I
    .end local v5    # "key":Ljava/lang/String;
    .end local v6    # "row":Lorg/json/JSONObject;
    .end local v7    # "rowsArrayResult":Lorg/json/JSONArray;
    :cond_1
    :goto_3
    return-object v8

    .line 619
    .restart local v0    # "colCount":I
    .restart local v1    # "curType":I
    .restart local v4    # "i":I
    .restart local v5    # "key":Ljava/lang/String;
    .restart local v6    # "row":Lorg/json/JSONObject;
    .restart local v7    # "rowsArrayResult":Lorg/json/JSONArray;
    :pswitch_2
    :try_start_4
    invoke-interface {p1, v4}, Landroid/database/Cursor;->getInt(I)I

    move-result v9

    invoke-virtual {v6, v5, v9}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    goto :goto_1

    .line 622
    :pswitch_3
    invoke-interface {p1, v4}, Landroid/database/Cursor;->getFloat(I)F

    move-result v9

    float-to-double v10, v9

    invoke-virtual {v6, v5, v10, v11}, Lorg/json/JSONObject;->put(Ljava/lang/String;D)Lorg/json/JSONObject;

    goto :goto_1

    .line 625
    :pswitch_4
    new-instance v9, Ljava/lang/String;

    invoke-interface {p1, v4}, Landroid/database/Cursor;->getBlob(I)[B

    move-result-object v10

    const/4 v11, 0x0

    invoke-static {v10, v11}, Landroid/util/Base64;->encode([BI)[B

    move-result-object v10

    invoke-direct {v9, v10}, Ljava/lang/String;-><init>([B)V

    invoke-virtual {v6, v5, v9}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_0
    .catch Lorg/json/JSONException; {:try_start_4 .. :try_end_4} :catch_1

    goto :goto_1

    .line 640
    .end local v1    # "curType":I
    :cond_2
    :try_start_5
    invoke-interface {p1, v4}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v6, v5, v9}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    goto :goto_1

    .line 644
    :cond_3
    invoke-virtual {v7, v6}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;
    :try_end_5
    .catch Lorg/json/JSONException; {:try_start_5 .. :try_end_5} :catch_1

    goto :goto_2

    .line 654
    :catch_2
    move-exception v2

    .line 655
    .restart local v2    # "e":Lorg/json/JSONException;
    invoke-virtual {v2}, Lorg/json/JSONException;->printStackTrace()V

    goto :goto_3

    .line 613
    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_1
        :pswitch_2
        :pswitch_3
        :pswitch_0
        :pswitch_4
    .end packed-switch
.end method

.method private openDatabase(Ljava/lang/String;Ljava/lang/String;)V
    .locals 7
    .param p1, "dbname"    # Ljava/lang/String;
    .param p2, "password"    # Ljava/lang/String;

    .prologue
    const/4 v6, 0x0

    .line 209
    invoke-direct {p0, p1}, Lorg/pgsqlite/SQLitePlugin;->getDatabase(Ljava/lang/String;)Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v3

    if-eqz v3, :cond_0

    invoke-direct {p0, p1}, Lorg/pgsqlite/SQLitePlugin;->getDatabase(Ljava/lang/String;)Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v3

    invoke-virtual {v3}, Landroid/database/sqlite/SQLiteDatabase;->isOpen()Z

    move-result v3

    if-eqz v3, :cond_0

    invoke-direct {p0, p1}, Lorg/pgsqlite/SQLitePlugin;->closeDatabase(Ljava/lang/String;)V

    .line 211
    :cond_0
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-static {}, Lcom/belkin/utils/RuleUtility;->getLocalDBPath()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-static {}, Lcom/belkin/utils/RuleUtility;->getLocalDBName()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 212
    .local v0, "dbfilePath":Ljava/lang/String;
    new-instance v3, Ljava/io/File;

    invoke-direct {v3, v0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    iput-object v3, p0, Lorg/pgsqlite/SQLitePlugin;->dbfile:Ljava/io/File;

    .line 214
    iget-object v3, p0, Lorg/pgsqlite/SQLitePlugin;->dbfile:Ljava/io/File;

    invoke-virtual {v3}, Ljava/io/File;->exists()Z

    move-result v3

    if-nez v3, :cond_1

    .line 215
    iget-object v3, p0, Lorg/pgsqlite/SQLitePlugin;->dbfile:Ljava/io/File;

    invoke-virtual {v3}, Ljava/io/File;->getParentFile()Ljava/io/File;

    move-result-object v3

    invoke-virtual {v3}, Ljava/io/File;->mkdirs()Z

    .line 218
    :cond_1
    const-string v3, "DBPLUGIN"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Open sqlite db: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget-object v5, p0, Lorg/pgsqlite/SQLitePlugin;->dbfile:Ljava/io/File;

    invoke-virtual {v5}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 220
    const/4 v2, 0x0

    .line 224
    .local v2, "mydb":Landroid/database/sqlite/SQLiteDatabase;
    const/4 v3, 0x0

    const/16 v4, 0x10

    :try_start_0
    invoke-static {v0, v3, v4}, Landroid/database/sqlite/SQLiteDatabase;->openDatabase(Ljava/lang/String;Landroid/database/sqlite/SQLiteDatabase$CursorFactory;I)Landroid/database/sqlite/SQLiteDatabase;
    :try_end_0
    .catch Landroid/database/sqlite/SQLiteException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v2

    .line 233
    :goto_0
    invoke-static {p1, v2}, Lorg/pgsqlite/SQLiteDBInstances;->setDBInstance(Ljava/lang/String;Landroid/database/sqlite/SQLiteDatabase;)V

    .line 235
    sget-object v3, Lorg/pgsqlite/SQLitePlugin;->dbmap:Ljava/util/HashMap;

    invoke-virtual {v3, p1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 236
    return-void

    .line 226
    :catch_0
    move-exception v1

    .line 227
    .local v1, "e":Landroid/database/sqlite/SQLiteException;
    sget-object v3, Lorg/pgsqlite/SQLitePlugin;->TAG:Ljava/lang/String;

    const-string v4, "SQLiteException while opening DB: "

    invoke-static {v3, v4, v1}, Lcom/belkin/utils/LogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 229
    iget-object v3, p0, Lorg/pgsqlite/SQLitePlugin;->dbfile:Ljava/io/File;

    invoke-static {v3, v6}, Landroid/database/sqlite/SQLiteDatabase;->openOrCreateDatabase(Ljava/io/File;Landroid/database/sqlite/SQLiteDatabase$CursorFactory;)Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v2

    goto :goto_0
.end method

.method private sendJavascriptCB(Ljava/lang/String;)V
    .locals 2
    .param p1, "cb"    # Ljava/lang/String;

    .prologue
    .line 670
    iget-object v0, p0, Lorg/pgsqlite/SQLitePlugin;->cordova:Lorg/apache/cordova/CordovaInterface;

    invoke-interface {v0}, Lorg/apache/cordova/CordovaInterface;->getActivity()Landroid/app/Activity;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/Activity;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Lcom/belkin/controller/AppController;->getInstance(Landroid/content/Context;)Lcom/belkin/controller/AppController;

    move-result-object v0

    iput-object v0, p0, Lorg/pgsqlite/SQLitePlugin;->mAppController:Lcom/belkin/controller/AppController;

    .line 671
    iget-object v0, p0, Lorg/pgsqlite/SQLitePlugin;->webView:Lorg/apache/cordova/CordovaWebView;

    if-eqz v0, :cond_0

    .line 672
    iget-object v0, p0, Lorg/pgsqlite/SQLitePlugin;->mAppController:Lcom/belkin/controller/AppController;

    iget-object v1, p0, Lorg/pgsqlite/SQLitePlugin;->webView:Lorg/apache/cordova/CordovaWebView;

    invoke-virtual {v0, v1, p1}, Lcom/belkin/controller/AppController;->sendJSCallBack(Lorg/apache/cordova/CordovaWebView;Ljava/lang/String;)V

    .line 674
    :cond_0
    return-void
.end method


# virtual methods
.method public execute(Ljava/lang/String;Lorg/json/JSONArray;Lorg/apache/cordova/CallbackContext;)Z
    .locals 27
    .param p1, "action"    # Ljava/lang/String;
    .param p2, "args"    # Lorg/json/JSONArray;
    .param p3, "cbc"    # Lorg/apache/cordova/CallbackContext;

    .prologue
    .line 76
    const/16 v24, 0x1

    .line 78
    .local v24, "status":Z
    :try_start_0
    const-string v2, "open"

    move-object/from16 v0, p1

    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 79
    const/4 v2, 0x0

    move-object/from16 v0, p2

    invoke-virtual {v0, v2}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v19

    .line 80
    .local v19, "o":Lorg/json/JSONObject;
    const-string v2, "name"

    move-object/from16 v0, v19

    invoke-virtual {v0, v2}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v11

    .line 82
    .local v11, "dbname":Ljava/lang/String;
    const/4 v2, 0x0

    move-object/from16 v0, p0

    invoke-direct {v0, v11, v2}, Lorg/pgsqlite/SQLitePlugin;->openDatabase(Ljava/lang/String;Ljava/lang/String;)V

    .line 175
    .end local v11    # "dbname":Ljava/lang/String;
    .end local v19    # "o":Lorg/json/JSONObject;
    .end local v24    # "status":Z
    :cond_0
    :goto_0
    return v24

    .line 84
    .restart local v24    # "status":Z
    :cond_1
    const-string v2, "close"

    move-object/from16 v0, p1

    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_2

    .line 85
    const/4 v2, 0x0

    move-object/from16 v0, p2

    invoke-virtual {v0, v2}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v19

    .line 86
    .restart local v19    # "o":Lorg/json/JSONObject;
    const-string v2, "path"

    move-object/from16 v0, v19

    invoke-virtual {v0, v2}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v11

    .line 88
    .restart local v11    # "dbname":Ljava/lang/String;
    move-object/from16 v0, p0

    invoke-direct {v0, v11}, Lorg/pgsqlite/SQLitePlugin;->closeDatabase(Ljava/lang/String;)V

    goto :goto_0

    .line 172
    .end local v11    # "dbname":Ljava/lang/String;
    .end local v19    # "o":Lorg/json/JSONObject;
    :catch_0
    move-exception v12

    .line 175
    .local v12, "e":Lorg/json/JSONException;
    const/16 v24, 0x0

    goto :goto_0

    .line 90
    .end local v12    # "e":Lorg/json/JSONException;
    :cond_2
    const-string v2, "delete"

    move-object/from16 v0, p1

    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_4

    .line 92
    sget v2, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v7, 0x10

    if-ge v2, v7, :cond_3

    const/16 v24, 0x0

    goto :goto_0

    .line 94
    :cond_3
    const/4 v2, 0x0

    move-object/from16 v0, p2

    invoke-virtual {v0, v2}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v19

    .line 95
    .restart local v19    # "o":Lorg/json/JSONObject;
    const-string v2, "path"

    move-object/from16 v0, v19

    invoke-virtual {v0, v2}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v11

    .line 97
    .restart local v11    # "dbname":Ljava/lang/String;
    move-object/from16 v0, p0

    invoke-direct {v0, v11}, Lorg/pgsqlite/SQLitePlugin;->deleteDatabase(Ljava/lang/String;)Z

    move-result v24

    .line 98
    goto :goto_0

    .line 99
    .end local v11    # "dbname":Ljava/lang/String;
    .end local v19    # "o":Lorg/json/JSONObject;
    :cond_4
    const-string v2, "executePragmaStatement"

    move-object/from16 v0, p1

    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_8

    .line 101
    const/4 v2, 0x0

    move-object/from16 v0, p2

    invoke-virtual {v0, v2}, Lorg/json/JSONArray;->getString(I)Ljava/lang/String;

    move-result-object v3

    .line 102
    .local v3, "dbName":Ljava/lang/String;
    const/4 v2, 0x1

    move-object/from16 v0, p2

    invoke-virtual {v0, v2}, Lorg/json/JSONArray;->getString(I)Ljava/lang/String;

    move-result-object v22

    .line 104
    .local v22, "query":Ljava/lang/String;
    invoke-virtual/range {p2 .. p2}, Lorg/json/JSONArray;->length()I

    move-result v2

    const/4 v7, 0x3

    if-ge v2, v7, :cond_5

    const/4 v15, 0x0

    .line 106
    .local v15, "jparams":Lorg/json/JSONArray;
    :goto_1
    const/16 v21, 0x0

    .line 108
    .local v21, "params":[Ljava/lang/String;
    if-eqz v15, :cond_7

    .line 109
    invoke-virtual {v15}, Lorg/json/JSONArray;->length()I

    move-result v2

    new-array v0, v2, [Ljava/lang/String;

    move-object/from16 v21, v0

    .line 111
    const/4 v14, 0x0

    .local v14, "j":I
    :goto_2
    invoke-virtual {v15}, Lorg/json/JSONArray;->length()I

    move-result v2

    if-ge v14, v2, :cond_7

    .line 112
    invoke-virtual {v15, v14}, Lorg/json/JSONArray;->isNull(I)Z

    move-result v2

    if-eqz v2, :cond_6

    .line 113
    const-string v2, ""

    aput-object v2, v21, v14

    .line 111
    :goto_3
    add-int/lit8 v14, v14, 0x1

    goto :goto_2

    .line 104
    .end local v14    # "j":I
    .end local v15    # "jparams":Lorg/json/JSONArray;
    .end local v21    # "params":[Ljava/lang/String;
    :cond_5
    const/4 v2, 0x2

    move-object/from16 v0, p2

    invoke-virtual {v0, v2}, Lorg/json/JSONArray;->getJSONArray(I)Lorg/json/JSONArray;

    move-result-object v15

    goto :goto_1

    .line 115
    .restart local v14    # "j":I
    .restart local v15    # "jparams":Lorg/json/JSONArray;
    .restart local v21    # "params":[Ljava/lang/String;
    :cond_6
    invoke-virtual {v15, v14}, Lorg/json/JSONArray;->getString(I)Ljava/lang/String;

    move-result-object v2

    aput-object v2, v21, v14

    goto :goto_3

    .line 119
    .end local v14    # "j":I
    :cond_7
    move-object/from16 v0, p0

    invoke-direct {v0, v3}, Lorg/pgsqlite/SQLitePlugin;->getDatabase(Ljava/lang/String;)Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v2

    move-object/from16 v0, v22

    move-object/from16 v1, v21

    invoke-virtual {v2, v0, v1}, Landroid/database/sqlite/SQLiteDatabase;->rawQuery(Ljava/lang/String;[Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v18

    .line 121
    .local v18, "myCursor":Landroid/database/Cursor;
    move-object/from16 v0, p0

    move-object/from16 v1, v18

    invoke-direct {v0, v1}, Lorg/pgsqlite/SQLitePlugin;->getRowsResultFromQuery(Landroid/database/Cursor;)Lorg/json/JSONObject;

    move-result-object v2

    const-string v7, "rows"

    invoke-virtual {v2, v7}, Lorg/json/JSONObject;->getJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v2

    invoke-virtual {v2}, Lorg/json/JSONArray;->toString()Ljava/lang/String;

    move-result-object v23

    .line 125
    .local v23, "result":Ljava/lang/String;
    const-string v25, "1"

    .line 126
    .local v25, "tempId":Ljava/lang/String;
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "window.SQLitePluginCallback.p1(\'"

    invoke-virtual {v2, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    move-object/from16 v0, v25

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v7, "\', "

    invoke-virtual {v2, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    move-object/from16 v0, v23

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v7, ");"

    invoke-virtual {v2, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    move-object/from16 v0, p0

    invoke-direct {v0, v2}, Lorg/pgsqlite/SQLitePlugin;->sendJavascriptCB(Ljava/lang/String;)V

    goto/16 :goto_0

    .line 128
    .end local v3    # "dbName":Ljava/lang/String;
    .end local v15    # "jparams":Lorg/json/JSONArray;
    .end local v18    # "myCursor":Landroid/database/Cursor;
    .end local v21    # "params":[Ljava/lang/String;
    .end local v22    # "query":Ljava/lang/String;
    .end local v23    # "result":Ljava/lang/String;
    .end local v25    # "tempId":Ljava/lang/String;
    :cond_8
    const-string v2, "executeSqlBatch"

    move-object/from16 v0, p1

    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_9

    const-string v2, "executeBatchTransaction"

    move-object/from16 v0, p1

    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_9

    const-string v2, "backgroundExecuteSqlBatch"

    move-object/from16 v0, p1

    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 130
    :cond_9
    const/4 v4, 0x0

    .line 131
    .local v4, "queries":[Ljava/lang/String;
    const/4 v6, 0x0

    .line 133
    .local v6, "queryIDs":[Ljava/lang/String;
    const/16 v16, 0x0

    .line 135
    .local v16, "jsonArr":Lorg/json/JSONArray;
    const/16 v20, 0x0

    .line 136
    .local v20, "paramLen":I
    const/4 v5, 0x0

    .line 138
    .local v5, "jsonparams":[Lorg/json/JSONArray;
    const/4 v2, 0x0

    move-object/from16 v0, p2

    invoke-virtual {v0, v2}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v9

    .line 139
    .local v9, "allargs":Lorg/json/JSONObject;
    const-string v2, "dbargs"

    invoke-virtual {v9, v2}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v10

    .line 140
    .local v10, "dbargs":Lorg/json/JSONObject;
    const-string v2, "dbname"

    invoke-virtual {v10, v2}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 141
    .restart local v3    # "dbName":Ljava/lang/String;
    const-string v2, "executes"

    invoke-virtual {v9, v2}, Lorg/json/JSONObject;->getJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v26

    .line 143
    .local v26, "txargs":Lorg/json/JSONArray;
    const/4 v2, 0x0

    move-object/from16 v0, v26

    invoke-virtual {v0, v2}, Lorg/json/JSONArray;->isNull(I)Z

    move-result v2

    if-eqz v2, :cond_b

    .line 144
    const/4 v2, 0x0

    new-array v4, v2, [Ljava/lang/String;

    .line 165
    :cond_a
    const-string v2, "backgroundExecuteSqlBatch"

    move-object/from16 v0, p1

    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_c

    move-object/from16 v2, p0

    move-object/from16 v7, p3

    .line 166
    invoke-direct/range {v2 .. v7}, Lorg/pgsqlite/SQLitePlugin;->executeSqlBatchInBackground(Ljava/lang/String;[Ljava/lang/String;[Lorg/json/JSONArray;[Ljava/lang/String;Lorg/apache/cordova/CallbackContext;)V

    goto/16 :goto_0

    .line 146
    :cond_b
    invoke-virtual/range {v26 .. v26}, Lorg/json/JSONArray;->length()I

    move-result v17

    .line 147
    .local v17, "len":I
    move/from16 v0, v17

    new-array v4, v0, [Ljava/lang/String;

    .line 148
    move/from16 v0, v17

    new-array v6, v0, [Ljava/lang/String;

    .line 149
    move/from16 v0, v17

    new-array v5, v0, [Lorg/json/JSONArray;

    .line 151
    const/4 v13, 0x0

    .local v13, "i":I
    :goto_4
    move/from16 v0, v17

    if-ge v13, v0, :cond_a

    .line 153
    move-object/from16 v0, v26

    invoke-virtual {v0, v13}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v8

    .line 154
    .local v8, "a":Lorg/json/JSONObject;
    const-string v2, "sql"

    invoke-virtual {v8, v2}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    aput-object v2, v4, v13

    .line 155
    const-string v2, "qid"

    invoke-virtual {v8, v2}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    aput-object v2, v6, v13

    .line 156
    const-string v2, "params"

    invoke-virtual {v8, v2}, Lorg/json/JSONObject;->getJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v16

    .line 157
    invoke-virtual/range {v16 .. v16}, Lorg/json/JSONArray;->length()I

    move-result v20

    .line 158
    aput-object v16, v5, v13

    .line 151
    add-int/lit8 v13, v13, 0x1

    goto :goto_4

    .end local v8    # "a":Lorg/json/JSONObject;
    .end local v13    # "i":I
    .end local v17    # "len":I
    :cond_c
    move-object/from16 v2, p0

    move-object/from16 v7, p3

    .line 168
    invoke-direct/range {v2 .. v7}, Lorg/pgsqlite/SQLitePlugin;->executeSqlBatch(Ljava/lang/String;[Ljava/lang/String;[Lorg/json/JSONArray;[Ljava/lang/String;Lorg/apache/cordova/CallbackContext;)V
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    goto/16 :goto_0
.end method

.method public onDestroy()V
    .locals 2

    .prologue
    .line 186
    :goto_0
    sget-object v1, Lorg/pgsqlite/SQLitePlugin;->dbmap:Ljava/util/HashMap;

    invoke-virtual {v1}, Ljava/util/HashMap;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_0

    .line 187
    sget-object v1, Lorg/pgsqlite/SQLitePlugin;->dbmap:Ljava/util/HashMap;

    invoke-virtual {v1}, Ljava/util/HashMap;->keySet()Ljava/util/Set;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    .line 188
    .local v0, "dbname":Ljava/lang/String;
    invoke-direct {p0, v0}, Lorg/pgsqlite/SQLitePlugin;->closeDatabase(Ljava/lang/String;)V

    .line 189
    sget-object v1, Lorg/pgsqlite/SQLitePlugin;->dbmap:Ljava/util/HashMap;

    invoke-virtual {v1, v0}, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_0

    .line 191
    .end local v0    # "dbname":Ljava/lang/String;
    :cond_0
    return-void
.end method
