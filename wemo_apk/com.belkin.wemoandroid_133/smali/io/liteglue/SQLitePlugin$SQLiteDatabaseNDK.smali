.class Lio/liteglue/SQLitePlugin$SQLiteDatabaseNDK;
.super Lio/liteglue/SQLiteAndroidDatabase;
.source "SQLitePlugin.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lio/liteglue/SQLitePlugin;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "SQLiteDatabaseNDK"
.end annotation


# instance fields
.field mydb:Lcom/almworks/sqlite4java/SQLiteConnection;

.field final synthetic this$0:Lio/liteglue/SQLitePlugin;


# direct methods
.method constructor <init>(Lio/liteglue/SQLitePlugin;)V
    .locals 0

    .prologue
    .line 366
    iput-object p1, p0, Lio/liteglue/SQLitePlugin$SQLiteDatabaseNDK;->this$0:Lio/liteglue/SQLitePlugin;

    invoke-direct {p0}, Lio/liteglue/SQLiteAndroidDatabase;-><init>()V

    return-void
.end method

.method private executeSqlStatementNDK(Ljava/lang/String;Lorg/json/JSONArray;Lorg/apache/cordova/CallbackContext;)Lorg/json/JSONObject;
    .locals 18
    .param p1, "query"    # Ljava/lang/String;
    .param p2, "paramsAsJson"    # Lorg/json/JSONArray;
    .param p3, "cbc"    # Lorg/apache/cordova/CallbackContext;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 484
    new-instance v14, Lorg/json/JSONObject;

    invoke-direct {v14}, Lorg/json/JSONObject;-><init>()V

    .line 486
    .local v14, "rowsResult":Lorg/json/JSONObject;
    const/4 v6, 0x0

    .line 488
    .local v6, "hasRows":Z
    move-object/from16 v0, p0

    iget-object v15, v0, Lio/liteglue/SQLitePlugin$SQLiteDatabaseNDK;->mydb:Lcom/almworks/sqlite4java/SQLiteConnection;

    move-object/from16 v0, p1

    invoke-virtual {v15, v0}, Lcom/almworks/sqlite4java/SQLiteConnection;->prepare(Ljava/lang/String;)Lcom/almworks/sqlite4java/SQLiteStatement;

    move-result-object v9

    .line 491
    .local v9, "myStatement":Lcom/almworks/sqlite4java/SQLiteStatement;
    const/4 v11, 0x0

    .line 493
    .local v11, "params":[Ljava/lang/String;
    :try_start_0
    invoke-virtual/range {p2 .. p2}, Lorg/json/JSONArray;->length()I

    move-result v15

    new-array v11, v15, [Ljava/lang/String;

    .line 495
    const/4 v7, 0x0

    .local v7, "i":I
    :goto_0
    invoke-virtual/range {p2 .. p2}, Lorg/json/JSONArray;->length()I

    move-result v15

    if-ge v7, v15, :cond_4

    .line 496
    move-object/from16 v0, p2

    invoke-virtual {v0, v7}, Lorg/json/JSONArray;->isNull(I)Z

    move-result v15

    if-eqz v15, :cond_0

    .line 497
    add-int/lit8 v15, v7, 0x1

    invoke-virtual {v9, v15}, Lcom/almworks/sqlite4java/SQLiteStatement;->bindNull(I)Lcom/almworks/sqlite4java/SQLiteStatement;

    .line 495
    :goto_1
    add-int/lit8 v7, v7, 0x1

    goto :goto_0

    .line 499
    :cond_0
    move-object/from16 v0, p2

    invoke-virtual {v0, v7}, Lorg/json/JSONArray;->get(I)Ljava/lang/Object;

    move-result-object v10

    .line 500
    .local v10, "p":Ljava/lang/Object;
    instance-of v15, v10, Ljava/lang/Float;

    if-nez v15, :cond_1

    instance-of v15, v10, Ljava/lang/Double;

    if-eqz v15, :cond_2

    .line 501
    :cond_1
    add-int/lit8 v15, v7, 0x1

    move-object/from16 v0, p2

    invoke-virtual {v0, v7}, Lorg/json/JSONArray;->getDouble(I)D

    move-result-wide v16

    move-wide/from16 v0, v16

    invoke-virtual {v9, v15, v0, v1}, Lcom/almworks/sqlite4java/SQLiteStatement;->bind(ID)Lcom/almworks/sqlite4java/SQLiteStatement;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_1

    .line 510
    .end local v7    # "i":I
    .end local v10    # "p":Ljava/lang/Object;
    :catch_0
    move-exception v5

    .line 511
    .local v5, "ex":Ljava/lang/Exception;
    invoke-virtual {v5}, Ljava/lang/Exception;->printStackTrace()V

    .line 512
    invoke-virtual {v5}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v4

    .line 513
    .local v4, "errorMessage":Ljava/lang/String;
    const-string v15, "executeSqlBatch"

    new-instance v16, Ljava/lang/StringBuilder;

    invoke-direct/range {v16 .. v16}, Ljava/lang/StringBuilder;-><init>()V

    const-string v17, "SQLitePlugin.executeSql[Batch](): Error="

    invoke-virtual/range {v16 .. v17}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v16

    move-object/from16 v0, v16

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v16

    invoke-virtual/range {v16 .. v16}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v16

    invoke-static/range {v15 .. v16}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 516
    invoke-virtual {v9}, Lcom/almworks/sqlite4java/SQLiteStatement;->dispose()V

    .line 517
    throw v5

    .line 502
    .end local v4    # "errorMessage":Ljava/lang/String;
    .end local v5    # "ex":Ljava/lang/Exception;
    .restart local v7    # "i":I
    .restart local v10    # "p":Ljava/lang/Object;
    :cond_2
    :try_start_1
    instance-of v15, v10, Ljava/lang/Number;

    if-eqz v15, :cond_3

    .line 503
    add-int/lit8 v15, v7, 0x1

    move-object/from16 v0, p2

    invoke-virtual {v0, v7}, Lorg/json/JSONArray;->getLong(I)J

    move-result-wide v16

    move-wide/from16 v0, v16

    invoke-virtual {v9, v15, v0, v1}, Lcom/almworks/sqlite4java/SQLiteStatement;->bind(IJ)Lcom/almworks/sqlite4java/SQLiteStatement;

    goto :goto_1

    .line 505
    :cond_3
    add-int/lit8 v15, v7, 0x1

    move-object/from16 v0, p2

    invoke-virtual {v0, v7}, Lorg/json/JSONArray;->getString(I)Ljava/lang/String;

    move-result-object v16

    move-object/from16 v0, v16

    invoke-virtual {v9, v15, v0}, Lcom/almworks/sqlite4java/SQLiteStatement;->bind(ILjava/lang/String;)Lcom/almworks/sqlite4java/SQLiteStatement;

    goto :goto_1

    .line 509
    .end local v10    # "p":Ljava/lang/Object;
    :cond_4
    invoke-virtual {v9}, Lcom/almworks/sqlite4java/SQLiteStatement;->step()Z
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    move-result v6

    .line 521
    if-eqz v6, :cond_6

    .line 522
    new-instance v13, Lorg/json/JSONArray;

    invoke-direct {v13}, Lorg/json/JSONArray;-><init>()V

    .line 523
    .local v13, "rowsArrayResult":Lorg/json/JSONArray;
    const-string v8, ""

    .line 524
    .local v8, "key":Ljava/lang/String;
    invoke-virtual {v9}, Lcom/almworks/sqlite4java/SQLiteStatement;->columnCount()I

    move-result v2

    .line 528
    .local v2, "colCount":I
    :cond_5
    new-instance v12, Lorg/json/JSONObject;

    invoke-direct {v12}, Lorg/json/JSONObject;-><init>()V

    .line 530
    .local v12, "row":Lorg/json/JSONObject;
    const/4 v7, 0x0

    :goto_2
    if-ge v7, v2, :cond_7

    .line 531
    :try_start_2
    invoke-virtual {v9, v7}, Lcom/almworks/sqlite4java/SQLiteStatement;->getColumnName(I)Ljava/lang/String;

    move-result-object v8

    .line 533
    invoke-virtual {v9, v7}, Lcom/almworks/sqlite4java/SQLiteStatement;->columnType(I)I

    move-result v15

    packed-switch v15, :pswitch_data_0

    .line 549
    :pswitch_0
    invoke-virtual {v9, v7}, Lcom/almworks/sqlite4java/SQLiteStatement;->columnString(I)Ljava/lang/String;

    move-result-object v15

    invoke-virtual {v12, v8, v15}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 530
    :goto_3
    add-int/lit8 v7, v7, 0x1

    goto :goto_2

    .line 535
    :pswitch_1
    sget-object v15, Lorg/json/JSONObject;->NULL:Ljava/lang/Object;

    invoke-virtual {v12, v8, v15}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_2
    .catch Lorg/json/JSONException; {:try_start_2 .. :try_end_2} :catch_1

    goto :goto_3

    .line 556
    :catch_1
    move-exception v3

    .line 557
    .local v3, "e":Lorg/json/JSONException;
    invoke-virtual {v3}, Lorg/json/JSONException;->printStackTrace()V

    .line 559
    .end local v3    # "e":Lorg/json/JSONException;
    :goto_4
    invoke-virtual {v9}, Lcom/almworks/sqlite4java/SQLiteStatement;->step()Z

    move-result v15

    if-nez v15, :cond_5

    .line 562
    :try_start_3
    const-string v15, "rows"

    invoke-virtual {v14, v15, v13}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_3
    .catch Lorg/json/JSONException; {:try_start_3 .. :try_end_3} :catch_2

    .line 568
    .end local v2    # "colCount":I
    .end local v8    # "key":Ljava/lang/String;
    .end local v12    # "row":Lorg/json/JSONObject;
    .end local v13    # "rowsArrayResult":Lorg/json/JSONArray;
    :cond_6
    :goto_5
    invoke-virtual {v9}, Lcom/almworks/sqlite4java/SQLiteStatement;->dispose()V

    .line 570
    return-object v14

    .line 539
    .restart local v2    # "colCount":I
    .restart local v8    # "key":Ljava/lang/String;
    .restart local v12    # "row":Lorg/json/JSONObject;
    .restart local v13    # "rowsArrayResult":Lorg/json/JSONArray;
    :pswitch_2
    :try_start_4
    invoke-virtual {v9, v7}, Lcom/almworks/sqlite4java/SQLiteStatement;->columnDouble(I)D

    move-result-wide v16

    move-wide/from16 v0, v16

    invoke-virtual {v12, v8, v0, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;D)Lorg/json/JSONObject;

    goto :goto_3

    .line 543
    :pswitch_3
    invoke-virtual {v9, v7}, Lcom/almworks/sqlite4java/SQLiteStatement;->columnLong(I)J

    move-result-wide v16

    move-wide/from16 v0, v16

    invoke-virtual {v12, v8, v0, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;J)Lorg/json/JSONObject;

    goto :goto_3

    .line 554
    :cond_7
    invoke-virtual {v13, v12}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;
    :try_end_4
    .catch Lorg/json/JSONException; {:try_start_4 .. :try_end_4} :catch_1

    goto :goto_4

    .line 563
    :catch_2
    move-exception v3

    .line 564
    .restart local v3    # "e":Lorg/json/JSONException;
    invoke-virtual {v3}, Lorg/json/JSONException;->printStackTrace()V

    goto :goto_5

    .line 533
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_3
        :pswitch_2
        :pswitch_0
        :pswitch_0
        :pswitch_1
    .end packed-switch
.end method


# virtual methods
.method bugWorkaround()V
    .locals 0

    .prologue
    .line 393
    return-void
.end method

.method closeDatabaseNow()V
    .locals 1

    .prologue
    .line 385
    iget-object v0, p0, Lio/liteglue/SQLitePlugin$SQLiteDatabaseNDK;->mydb:Lcom/almworks/sqlite4java/SQLiteConnection;

    if-eqz v0, :cond_0

    .line 386
    iget-object v0, p0, Lio/liteglue/SQLitePlugin$SQLiteDatabaseNDK;->mydb:Lcom/almworks/sqlite4java/SQLiteConnection;

    invoke-virtual {v0}, Lcom/almworks/sqlite4java/SQLiteConnection;->dispose()V

    .line 387
    :cond_0
    return-void
.end method

.method executeSqlBatch([Ljava/lang/String;[Lorg/json/JSONArray;[Ljava/lang/String;Lorg/apache/cordova/CallbackContext;)V
    .locals 27
    .param p1, "queryarr"    # [Ljava/lang/String;
    .param p2, "jsonparams"    # [Lorg/json/JSONArray;
    .param p3, "queryIDs"    # [Ljava/lang/String;
    .param p4, "cbc"    # Lorg/apache/cordova/CallbackContext;

    .prologue
    .line 408
    move-object/from16 v0, p0

    iget-object v0, v0, Lio/liteglue/SQLitePlugin$SQLiteDatabaseNDK;->mydb:Lcom/almworks/sqlite4java/SQLiteConnection;

    move-object/from16 v24, v0

    if-nez v24, :cond_0

    .line 410
    const-string v24, "database has been closed"

    move-object/from16 v0, p4

    move-object/from16 v1, v24

    invoke-virtual {v0, v1}, Lorg/apache/cordova/CallbackContext;->error(Ljava/lang/String;)V

    .line 474
    :goto_0
    return-void

    .line 414
    :cond_0
    move-object/from16 v0, p1

    array-length v9, v0

    .line 415
    .local v9, "len":I
    new-instance v4, Lorg/json/JSONArray;

    invoke-direct {v4}, Lorg/json/JSONArray;-><init>()V

    .line 417
    .local v4, "batchResults":Lorg/json/JSONArray;
    const/4 v8, 0x0

    .local v8, "i":I
    :goto_1
    if-ge v8, v9, :cond_3

    .line 418
    const/16 v21, 0x0

    .line 419
    .local v21, "rowsAffectedCompat":I
    const/4 v14, 0x0

    .line 420
    .local v14, "needRowsAffectedCompat":Z
    aget-object v19, p3, v8

    .line 422
    .local v19, "query_id":Ljava/lang/String;
    const/16 v18, 0x0

    .line 423
    .local v18, "queryResult":Lorg/json/JSONObject;
    const-string v6, "unknown"

    .line 426
    .local v6, "errorMessage":Ljava/lang/String;
    :try_start_0
    aget-object v15, p1, v8

    .line 428
    .local v15, "query":Ljava/lang/String;
    move-object/from16 v0, p0

    iget-object v0, v0, Lio/liteglue/SQLitePlugin$SQLiteDatabaseNDK;->mydb:Lcom/almworks/sqlite4java/SQLiteConnection;

    move-object/from16 v24, v0

    invoke-virtual/range {v24 .. v24}, Lcom/almworks/sqlite4java/SQLiteConnection;->getTotalChanges()I

    move-result v24

    move/from16 v0, v24

    int-to-long v12, v0

    .line 429
    .local v12, "lastTotal":J
    aget-object v24, p2, v8

    move-object/from16 v0, p0

    move-object/from16 v1, v24

    move-object/from16 v2, p4

    invoke-direct {v0, v15, v1, v2}, Lio/liteglue/SQLitePlugin$SQLiteDatabaseNDK;->executeSqlStatementNDK(Ljava/lang/String;Lorg/json/JSONArray;Lorg/apache/cordova/CallbackContext;)Lorg/json/JSONObject;

    move-result-object v18

    .line 430
    move-object/from16 v0, p0

    iget-object v0, v0, Lio/liteglue/SQLitePlugin$SQLiteDatabaseNDK;->mydb:Lcom/almworks/sqlite4java/SQLiteConnection;

    move-object/from16 v24, v0

    invoke-virtual/range {v24 .. v24}, Lcom/almworks/sqlite4java/SQLiteConnection;->getTotalChanges()I

    move-result v24

    move/from16 v0, v24

    int-to-long v0, v0

    move-wide/from16 v16, v0

    .line 431
    .local v16, "newTotal":J
    sub-long v22, v16, v12

    .line 433
    .local v22, "rowsAffected":J
    const-string v24, "rowsAffected"

    move-object/from16 v0, v18

    move-object/from16 v1, v24

    move-wide/from16 v2, v22

    invoke-virtual {v0, v1, v2, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;J)Lorg/json/JSONObject;

    .line 434
    const-wide/16 v24, 0x0

    cmp-long v24, v22, v24

    if-lez v24, :cond_1

    .line 435
    move-object/from16 v0, p0

    iget-object v0, v0, Lio/liteglue/SQLitePlugin$SQLiteDatabaseNDK;->mydb:Lcom/almworks/sqlite4java/SQLiteConnection;

    move-object/from16 v24, v0

    invoke-virtual/range {v24 .. v24}, Lcom/almworks/sqlite4java/SQLiteConnection;->getLastInsertId()J

    move-result-wide v10

    .line 436
    .local v10, "insertId":J
    const-wide/16 v24, 0x0

    cmp-long v24, v10, v24

    if-lez v24, :cond_1

    .line 437
    const-string v24, "insertId"

    move-object/from16 v0, v18

    move-object/from16 v1, v24

    invoke-virtual {v0, v1, v10, v11}, Lorg/json/JSONObject;->put(Ljava/lang/String;J)Lorg/json/JSONObject;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 447
    .end local v10    # "insertId":J
    .end local v12    # "lastTotal":J
    .end local v15    # "query":Ljava/lang/String;
    .end local v16    # "newTotal":J
    .end local v22    # "rowsAffected":J
    :cond_1
    :goto_2
    if-eqz v18, :cond_2

    .line 448
    :try_start_1
    new-instance v20, Lorg/json/JSONObject;

    invoke-direct/range {v20 .. v20}, Lorg/json/JSONObject;-><init>()V

    .line 449
    .local v20, "r":Lorg/json/JSONObject;
    const-string v24, "qid"

    move-object/from16 v0, v20

    move-object/from16 v1, v24

    move-object/from16 v2, v19

    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 451
    const-string v24, "type"

    const-string v25, "success"

    move-object/from16 v0, v20

    move-object/from16 v1, v24

    move-object/from16 v2, v25

    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 452
    const-string v24, "result"

    move-object/from16 v0, v20

    move-object/from16 v1, v24

    move-object/from16 v2, v18

    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 454
    move-object/from16 v0, v20

    invoke-virtual {v4, v0}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;
    :try_end_1
    .catch Lorg/json/JSONException; {:try_start_1 .. :try_end_1} :catch_1

    .line 417
    .end local v20    # "r":Lorg/json/JSONObject;
    :goto_3
    add-int/lit8 v8, v8, 0x1

    goto/16 :goto_1

    .line 440
    :catch_0
    move-exception v7

    .line 441
    .local v7, "ex":Ljava/lang/Exception;
    invoke-virtual {v7}, Ljava/lang/Exception;->printStackTrace()V

    .line 442
    invoke-virtual {v7}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v6

    .line 443
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

    goto :goto_2

    .line 456
    .end local v7    # "ex":Ljava/lang/Exception;
    :cond_2
    :try_start_2
    new-instance v20, Lorg/json/JSONObject;

    invoke-direct/range {v20 .. v20}, Lorg/json/JSONObject;-><init>()V

    .line 457
    .restart local v20    # "r":Lorg/json/JSONObject;
    const-string v24, "qid"

    move-object/from16 v0, v20

    move-object/from16 v1, v24

    move-object/from16 v2, v19

    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 458
    const-string v24, "type"

    const-string v25, "error"

    move-object/from16 v0, v20

    move-object/from16 v1, v24

    move-object/from16 v2, v25

    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 460
    new-instance v5, Lorg/json/JSONObject;

    invoke-direct {v5}, Lorg/json/JSONObject;-><init>()V

    .line 461
    .local v5, "er":Lorg/json/JSONObject;
    const-string v24, "message"

    move-object/from16 v0, v24

    invoke-virtual {v5, v0, v6}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 462
    const-string v24, "result"

    move-object/from16 v0, v20

    move-object/from16 v1, v24

    invoke-virtual {v0, v1, v5}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 464
    move-object/from16 v0, v20

    invoke-virtual {v4, v0}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;
    :try_end_2
    .catch Lorg/json/JSONException; {:try_start_2 .. :try_end_2} :catch_1

    goto :goto_3

    .line 466
    .end local v5    # "er":Lorg/json/JSONObject;
    .end local v20    # "r":Lorg/json/JSONObject;
    :catch_1
    move-exception v7

    .line 467
    .local v7, "ex":Lorg/json/JSONException;
    invoke-virtual {v7}, Lorg/json/JSONException;->printStackTrace()V

    .line 468
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

    goto :goto_3

    .line 473
    .end local v6    # "errorMessage":Ljava/lang/String;
    .end local v7    # "ex":Lorg/json/JSONException;
    .end local v14    # "needRowsAffectedCompat":Z
    .end local v18    # "queryResult":Lorg/json/JSONObject;
    .end local v19    # "query_id":Ljava/lang/String;
    .end local v21    # "rowsAffectedCompat":I
    :cond_3
    move-object/from16 v0, p4

    invoke-virtual {v0, v4}, Lorg/apache/cordova/CallbackContext;->success(Lorg/json/JSONArray;)V

    goto/16 :goto_0
.end method

.method open(Ljava/io/File;)V
    .locals 2
    .param p1, "dbFile"    # Ljava/io/File;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 376
    new-instance v0, Lcom/almworks/sqlite4java/SQLiteConnection;

    invoke-direct {v0, p1}, Lcom/almworks/sqlite4java/SQLiteConnection;-><init>(Ljava/io/File;)V

    iput-object v0, p0, Lio/liteglue/SQLitePlugin$SQLiteDatabaseNDK;->mydb:Lcom/almworks/sqlite4java/SQLiteConnection;

    .line 377
    iget-object v0, p0, Lio/liteglue/SQLitePlugin$SQLiteDatabaseNDK;->mydb:Lcom/almworks/sqlite4java/SQLiteConnection;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Lcom/almworks/sqlite4java/SQLiteConnection;->open(Z)Lcom/almworks/sqlite4java/SQLiteConnection;

    .line 378
    return-void
.end method
