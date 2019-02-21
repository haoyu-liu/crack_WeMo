.class Lio/liteglue/SQLiteAndroidDatabase;
.super Ljava/lang/Object;
.source "SQLiteAndroidDatabase.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lio/liteglue/SQLiteAndroidDatabase$QueryType;
    }
.end annotation


# static fields
.field private static final DELETE_TABLE_NAME:Ljava/util/regex/Pattern;

.field private static final FIRST_WORD:Ljava/util/regex/Pattern;

.field private static final TAG:Ljava/lang/String;

.field private static final UPDATE_TABLE_NAME:Ljava/util/regex/Pattern;

.field private static final WHERE_CLAUSE:Ljava/util/regex/Pattern;


# instance fields
.field dbFile:Ljava/io/File;

.field mydb:Landroid/database/sqlite/SQLiteDatabase;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .prologue
    const/4 v1, 0x2

    .line 35
    const-string v0, "^\\s*(\\S+)"

    invoke-static {v0, v1}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;I)Ljava/util/regex/Pattern;

    move-result-object v0

    sput-object v0, Lio/liteglue/SQLiteAndroidDatabase;->FIRST_WORD:Ljava/util/regex/Pattern;

    .line 38
    const-string v0, "\\s+WHERE\\s+(.+)$"

    invoke-static {v0, v1}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;I)Ljava/util/regex/Pattern;

    move-result-object v0

    sput-object v0, Lio/liteglue/SQLiteAndroidDatabase;->WHERE_CLAUSE:Ljava/util/regex/Pattern;

    .line 41
    const-string v0, "^\\s*UPDATE\\s+(\\S+)"

    invoke-static {v0, v1}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;I)Ljava/util/regex/Pattern;

    move-result-object v0

    sput-object v0, Lio/liteglue/SQLiteAndroidDatabase;->UPDATE_TABLE_NAME:Ljava/util/regex/Pattern;

    .line 44
    const-string v0, "^\\s*DELETE\\s+FROM\\s+(\\S+)"

    invoke-static {v0, v1}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;I)Ljava/util/regex/Pattern;

    move-result-object v0

    sput-object v0, Lio/liteglue/SQLiteAndroidDatabase;->DELETE_TABLE_NAME:Ljava/util/regex/Pattern;

    .line 51
    const-class v0, Lio/liteglue/SQLiteAndroidDatabase;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lio/liteglue/SQLiteAndroidDatabase;->TAG:Ljava/lang/String;

    return-void
.end method

.method constructor <init>()V
    .locals 0

    .prologue
    .line 33
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 508
    return-void
.end method

.method private bindArgsToStatement(Landroid/database/sqlite/SQLiteStatement;Lorg/json/JSONArray;)V
    .locals 4
    .param p1, "myStatement"    # Landroid/database/sqlite/SQLiteStatement;
    .param p2, "sqlArgs"    # Lorg/json/JSONArray;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .prologue
    .line 360
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    invoke-virtual {p2}, Lorg/json/JSONArray;->length()I

    move-result v1

    if-ge v0, v1, :cond_4

    .line 361
    invoke-virtual {p2, v0}, Lorg/json/JSONArray;->get(I)Ljava/lang/Object;

    move-result-object v1

    instance-of v1, v1, Ljava/lang/Float;

    if-nez v1, :cond_0

    invoke-virtual {p2, v0}, Lorg/json/JSONArray;->get(I)Ljava/lang/Object;

    move-result-object v1

    instance-of v1, v1, Ljava/lang/Double;

    if-eqz v1, :cond_1

    .line 362
    :cond_0
    add-int/lit8 v1, v0, 0x1

    invoke-virtual {p2, v0}, Lorg/json/JSONArray;->getDouble(I)D

    move-result-wide v2

    invoke-virtual {p1, v1, v2, v3}, Landroid/database/sqlite/SQLiteStatement;->bindDouble(ID)V

    .line 360
    :goto_1
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 363
    :cond_1
    invoke-virtual {p2, v0}, Lorg/json/JSONArray;->get(I)Ljava/lang/Object;

    move-result-object v1

    instance-of v1, v1, Ljava/lang/Number;

    if-eqz v1, :cond_2

    .line 364
    add-int/lit8 v1, v0, 0x1

    invoke-virtual {p2, v0}, Lorg/json/JSONArray;->getLong(I)J

    move-result-wide v2

    invoke-virtual {p1, v1, v2, v3}, Landroid/database/sqlite/SQLiteStatement;->bindLong(IJ)V

    goto :goto_1

    .line 365
    :cond_2
    invoke-virtual {p2, v0}, Lorg/json/JSONArray;->isNull(I)Z

    move-result v1

    if-eqz v1, :cond_3

    .line 366
    add-int/lit8 v1, v0, 0x1

    invoke-virtual {p1, v1}, Landroid/database/sqlite/SQLiteStatement;->bindNull(I)V

    goto :goto_1

    .line 368
    :cond_3
    add-int/lit8 v1, v0, 0x1

    invoke-virtual {p2, v0}, Lorg/json/JSONArray;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p1, v1, v2}, Landroid/database/sqlite/SQLiteStatement;->bindString(ILjava/lang/String;)V

    goto :goto_1

    .line 371
    :cond_4
    return-void
.end method

.method private bindPostHoneycomb(Lorg/json/JSONObject;Ljava/lang/String;Landroid/database/Cursor;I)V
    .locals 4
    .param p1, "row"    # Lorg/json/JSONObject;
    .param p2, "key"    # Ljava/lang/String;
    .param p3, "cur"    # Landroid/database/Cursor;
    .param p4, "i"    # I
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "NewApi"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .prologue
    .line 454
    invoke-interface {p3, p4}, Landroid/database/Cursor;->getType(I)I

    move-result v0

    .line 456
    .local v0, "curType":I
    packed-switch v0, :pswitch_data_0

    .line 471
    :pswitch_0
    invoke-interface {p3, p4}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1, p2, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 474
    :goto_0
    return-void

    .line 458
    :pswitch_1
    sget-object v1, Lorg/json/JSONObject;->NULL:Ljava/lang/Object;

    invoke-virtual {p1, p2, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    goto :goto_0

    .line 461
    :pswitch_2
    invoke-interface {p3, p4}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v2

    invoke-virtual {p1, p2, v2, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;J)Lorg/json/JSONObject;

    goto :goto_0

    .line 464
    :pswitch_3
    invoke-interface {p3, p4}, Landroid/database/Cursor;->getDouble(I)D

    move-result-wide v2

    invoke-virtual {p1, p2, v2, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;D)Lorg/json/JSONObject;

    goto :goto_0

    .line 467
    :pswitch_4
    new-instance v1, Ljava/lang/String;

    invoke-interface {p3, p4}, Landroid/database/Cursor;->getBlob(I)[B

    move-result-object v2

    const/4 v3, 0x0

    invoke-static {v2, v3}, Landroid/util/Base64;->encode([BI)[B

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/String;-><init>([B)V

    invoke-virtual {p1, p2, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    goto :goto_0

    .line 456
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

.method private bindPreHoneycomb(Lorg/json/JSONObject;Ljava/lang/String;Landroid/database/Cursor;I)V
    .locals 6
    .param p1, "row"    # Lorg/json/JSONObject;
    .param p2, "key"    # Ljava/lang/String;
    .param p3, "cursor"    # Landroid/database/Cursor;
    .param p4, "i"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .prologue
    .line 480
    move-object v2, p3

    check-cast v2, Landroid/database/sqlite/SQLiteCursor;

    .line 481
    .local v2, "sqLiteCursor":Landroid/database/sqlite/SQLiteCursor;
    invoke-virtual {v2}, Landroid/database/sqlite/SQLiteCursor;->getWindow()Landroid/database/CursorWindow;

    move-result-object v0

    .line 482
    .local v0, "cursorWindow":Landroid/database/CursorWindow;
    invoke-interface {p3}, Landroid/database/Cursor;->getPosition()I

    move-result v1

    .line 483
    .local v1, "pos":I
    invoke-virtual {v0, v1, p4}, Landroid/database/CursorWindow;->isNull(II)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 484
    sget-object v3, Lorg/json/JSONObject;->NULL:Ljava/lang/Object;

    invoke-virtual {p1, p2, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 494
    :goto_0
    return-void

    .line 485
    :cond_0
    invoke-virtual {v0, v1, p4}, Landroid/database/CursorWindow;->isLong(II)Z

    move-result v3

    if-eqz v3, :cond_1

    .line 486
    invoke-interface {p3, p4}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v4

    invoke-virtual {p1, p2, v4, v5}, Lorg/json/JSONObject;->put(Ljava/lang/String;J)Lorg/json/JSONObject;

    goto :goto_0

    .line 487
    :cond_1
    invoke-virtual {v0, v1, p4}, Landroid/database/CursorWindow;->isFloat(II)Z

    move-result v3

    if-eqz v3, :cond_2

    .line 488
    invoke-interface {p3, p4}, Landroid/database/Cursor;->getDouble(I)D

    move-result-wide v4

    invoke-virtual {p1, p2, v4, v5}, Lorg/json/JSONObject;->put(Ljava/lang/String;D)Lorg/json/JSONObject;

    goto :goto_0

    .line 489
    :cond_2
    invoke-virtual {v0, v1, p4}, Landroid/database/CursorWindow;->isBlob(II)Z

    move-result v3

    if-eqz v3, :cond_3

    .line 490
    new-instance v3, Ljava/lang/String;

    invoke-interface {p3, p4}, Landroid/database/Cursor;->getBlob(I)[B

    move-result-object v4

    const/4 v5, 0x0

    invoke-static {v4, v5}, Landroid/util/Base64;->encode([BI)[B

    move-result-object v4

    invoke-direct {v3, v4}, Ljava/lang/String;-><init>([B)V

    invoke-virtual {p1, p2, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    goto :goto_0

    .line 492
    :cond_3
    invoke-interface {p3, p4}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p1, p2, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    goto :goto_0
.end method

.method private countRowsAffectedCompat(Lio/liteglue/SQLiteAndroidDatabase$QueryType;Ljava/lang/String;[Lorg/json/JSONArray;Landroid/database/sqlite/SQLiteDatabase;I)I
    .locals 16
    .param p1, "queryType"    # Lio/liteglue/SQLiteAndroidDatabase$QueryType;
    .param p2, "query"    # Ljava/lang/String;
    .param p3, "jsonparams"    # [Lorg/json/JSONArray;
    .param p4, "mydb"    # Landroid/database/sqlite/SQLiteDatabase;
    .param p5, "i"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .prologue
    .line 288
    sget-object v14, Lio/liteglue/SQLiteAndroidDatabase;->WHERE_CLAUSE:Ljava/util/regex/Pattern;

    move-object/from16 v0, p2

    invoke-virtual {v14, v0}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v13

    .line 290
    .local v13, "whereMatcher":Ljava/util/regex/Matcher;
    const-string v12, ""

    .line 292
    .local v12, "where":Ljava/lang/String;
    const/4 v6, 0x0

    .line 293
    .local v6, "pos":I
    :goto_0
    invoke-virtual {v13, v6}, Ljava/util/regex/Matcher;->find(I)Z

    move-result v14

    if-eqz v14, :cond_0

    .line 294
    new-instance v14, Ljava/lang/StringBuilder;

    invoke-direct {v14}, Ljava/lang/StringBuilder;-><init>()V

    const-string v15, " WHERE "

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    const/4 v15, 0x1

    invoke-virtual {v13, v15}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v15

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v12

    .line 295
    const/4 v14, 0x1

    invoke-virtual {v13, v14}, Ljava/util/regex/Matcher;->start(I)I

    move-result v6

    goto :goto_0

    .line 301
    :cond_0
    const/4 v4, 0x0

    .line 302
    .local v4, "numQuestionMarks":I
    const/4 v3, 0x0

    .local v3, "j":I
    :goto_1
    invoke-virtual {v12}, Ljava/lang/String;->length()I

    move-result v14

    if-ge v3, v14, :cond_2

    .line 303
    invoke-virtual {v12, v3}, Ljava/lang/String;->charAt(I)C

    move-result v14

    const/16 v15, 0x3f

    if-ne v14, v15, :cond_1

    .line 304
    add-int/lit8 v4, v4, 0x1

    .line 302
    :cond_1
    add-int/lit8 v3, v3, 0x1

    goto :goto_1

    .line 308
    :cond_2
    const/4 v9, 0x0

    .line 310
    .local v9, "subParams":Lorg/json/JSONArray;
    if-eqz p3, :cond_3

    .line 312
    aget-object v5, p3, p5

    .line 313
    .local v5, "origArray":Lorg/json/JSONArray;
    new-instance v9, Lorg/json/JSONArray;

    .end local v9    # "subParams":Lorg/json/JSONArray;
    invoke-direct {v9}, Lorg/json/JSONArray;-><init>()V

    .line 314
    .restart local v9    # "subParams":Lorg/json/JSONArray;
    invoke-virtual {v5}, Lorg/json/JSONArray;->length()I

    move-result v14

    sub-int v7, v14, v4

    .line 315
    .local v7, "startPos":I
    move v3, v7

    :goto_2
    invoke-virtual {v5}, Lorg/json/JSONArray;->length()I

    move-result v14

    if-ge v3, v14, :cond_3

    .line 316
    sub-int v14, v3, v7

    invoke-virtual {v5, v3}, Lorg/json/JSONArray;->get(I)Ljava/lang/Object;

    move-result-object v15

    invoke-virtual {v9, v14, v15}, Lorg/json/JSONArray;->put(ILjava/lang/Object;)Lorg/json/JSONArray;

    .line 315
    add-int/lit8 v3, v3, 0x1

    goto :goto_2

    .line 320
    .end local v5    # "origArray":Lorg/json/JSONArray;
    .end local v7    # "startPos":I
    :cond_3
    sget-object v14, Lio/liteglue/SQLiteAndroidDatabase$QueryType;->update:Lio/liteglue/SQLiteAndroidDatabase$QueryType;

    move-object/from16 v0, p1

    if-ne v0, v14, :cond_6

    .line 321
    sget-object v14, Lio/liteglue/SQLiteAndroidDatabase;->UPDATE_TABLE_NAME:Ljava/util/regex/Pattern;

    move-object/from16 v0, p2

    invoke-virtual {v14, v0}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v11

    .line 322
    .local v11, "tableMatcher":Ljava/util/regex/Matcher;
    invoke-virtual {v11}, Ljava/util/regex/Matcher;->find()Z

    move-result v14

    if-eqz v14, :cond_5

    .line 323
    const/4 v14, 0x1

    invoke-virtual {v11, v14}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v10

    .line 325
    .local v10, "table":Ljava/lang/String;
    :try_start_0
    new-instance v14, Ljava/lang/StringBuilder;

    invoke-direct {v14}, Ljava/lang/StringBuilder;-><init>()V

    const-string v15, "SELECT count(*) FROM "

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v14

    move-object/from16 v0, p4

    invoke-virtual {v0, v14}, Landroid/database/sqlite/SQLiteDatabase;->compileStatement(Ljava/lang/String;)Landroid/database/sqlite/SQLiteStatement;

    move-result-object v8

    .line 328
    .local v8, "statement":Landroid/database/sqlite/SQLiteStatement;
    if-eqz v9, :cond_4

    .line 329
    move-object/from16 v0, p0

    invoke-direct {v0, v8, v9}, Lio/liteglue/SQLiteAndroidDatabase;->bindArgsToStatement(Landroid/database/sqlite/SQLiteStatement;Lorg/json/JSONArray;)V

    .line 332
    :cond_4
    invoke-virtual {v8}, Landroid/database/sqlite/SQLiteStatement;->simpleQueryForLong()J
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result-wide v14

    long-to-int v14, v14

    .line 356
    .end local v8    # "statement":Landroid/database/sqlite/SQLiteStatement;
    .end local v10    # "table":Ljava/lang/String;
    :goto_3
    return v14

    .line 333
    .restart local v10    # "table":Ljava/lang/String;
    :catch_0
    move-exception v2

    .line 335
    .local v2, "e":Ljava/lang/Exception;
    const-class v14, Lio/liteglue/SQLiteAndroidDatabase;

    invoke-virtual {v14}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v14

    const-string v15, "uncaught"

    invoke-static {v14, v15, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 356
    .end local v2    # "e":Ljava/lang/Exception;
    .end local v10    # "table":Ljava/lang/String;
    :cond_5
    :goto_4
    const/4 v14, 0x0

    goto :goto_3

    .line 339
    .end local v11    # "tableMatcher":Ljava/util/regex/Matcher;
    :cond_6
    sget-object v14, Lio/liteglue/SQLiteAndroidDatabase;->DELETE_TABLE_NAME:Ljava/util/regex/Pattern;

    move-object/from16 v0, p2

    invoke-virtual {v14, v0}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v11

    .line 340
    .restart local v11    # "tableMatcher":Ljava/util/regex/Matcher;
    invoke-virtual {v11}, Ljava/util/regex/Matcher;->find()Z

    move-result v14

    if-eqz v14, :cond_5

    .line 341
    const/4 v14, 0x1

    invoke-virtual {v11, v14}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v10

    .line 343
    .restart local v10    # "table":Ljava/lang/String;
    :try_start_1
    new-instance v14, Ljava/lang/StringBuilder;

    invoke-direct {v14}, Ljava/lang/StringBuilder;-><init>()V

    const-string v15, "SELECT count(*) FROM "

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v14

    move-object/from16 v0, p4

    invoke-virtual {v0, v14}, Landroid/database/sqlite/SQLiteDatabase;->compileStatement(Ljava/lang/String;)Landroid/database/sqlite/SQLiteStatement;

    move-result-object v8

    .line 345
    .restart local v8    # "statement":Landroid/database/sqlite/SQLiteStatement;
    move-object/from16 v0, p0

    invoke-direct {v0, v8, v9}, Lio/liteglue/SQLiteAndroidDatabase;->bindArgsToStatement(Landroid/database/sqlite/SQLiteStatement;Lorg/json/JSONArray;)V

    .line 347
    invoke-virtual {v8}, Landroid/database/sqlite/SQLiteStatement;->simpleQueryForLong()J
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    move-result-wide v14

    long-to-int v14, v14

    goto :goto_3

    .line 348
    .end local v8    # "statement":Landroid/database/sqlite/SQLiteStatement;
    :catch_1
    move-exception v2

    .line 350
    .restart local v2    # "e":Ljava/lang/Exception;
    const-class v14, Lio/liteglue/SQLiteAndroidDatabase;

    invoke-virtual {v14}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v14

    const-string v15, "uncaught"

    invoke-static {v14, v15, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_4
.end method

.method private executeSqlStatementQuery(Landroid/database/sqlite/SQLiteDatabase;Ljava/lang/String;Lorg/json/JSONArray;Lorg/apache/cordova/CallbackContext;)Lorg/json/JSONObject;
    .locals 17
    .param p1, "mydb"    # Landroid/database/sqlite/SQLiteDatabase;
    .param p2, "query"    # Ljava/lang/String;
    .param p3, "paramsAsJson"    # Lorg/json/JSONArray;
    .param p4, "cbc"    # Lorg/apache/cordova/CallbackContext;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 382
    new-instance v13, Lorg/json/JSONObject;

    invoke-direct {v13}, Lorg/json/JSONObject;-><init>()V

    .line 384
    .local v13, "rowsResult":Lorg/json/JSONObject;
    const/4 v3, 0x0

    .line 386
    .local v3, "cur":Landroid/database/Cursor;
    const/4 v10, 0x0

    .line 388
    .local v10, "params":[Ljava/lang/String;
    :try_start_0
    invoke-virtual/range {p3 .. p3}, Lorg/json/JSONArray;->length()I

    move-result v14

    new-array v10, v14, [Ljava/lang/String;

    .line 390
    const/4 v8, 0x0

    .local v8, "j":I
    :goto_0
    invoke-virtual/range {p3 .. p3}, Lorg/json/JSONArray;->length()I

    move-result v14

    if-ge v8, v14, :cond_1

    .line 391
    move-object/from16 v0, p3

    invoke-virtual {v0, v8}, Lorg/json/JSONArray;->isNull(I)Z

    move-result v14

    if-eqz v14, :cond_0

    .line 392
    const-string v14, ""

    aput-object v14, v10, v8

    .line 390
    :goto_1
    add-int/lit8 v8, v8, 0x1

    goto :goto_0

    .line 394
    :cond_0
    move-object/from16 v0, p3

    invoke-virtual {v0, v8}, Lorg/json/JSONArray;->getString(I)Ljava/lang/String;

    move-result-object v14

    aput-object v14, v10, v8
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_1

    .line 398
    .end local v8    # "j":I
    :catch_0
    move-exception v6

    .line 399
    .local v6, "ex":Ljava/lang/Exception;
    invoke-virtual {v6}, Ljava/lang/Exception;->printStackTrace()V

    .line 400
    invoke-virtual {v6}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v5

    .line 401
    .local v5, "errorMessage":Ljava/lang/String;
    const-string v14, "executeSqlBatch"

    new-instance v15, Ljava/lang/StringBuilder;

    invoke-direct {v15}, Ljava/lang/StringBuilder;-><init>()V

    const-string v16, "SQLiteAndroidDatabase.executeSql[Batch](): Error="

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    invoke-virtual {v15, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    invoke-virtual {v15}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v15

    invoke-static {v14, v15}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 402
    throw v6

    .line 397
    .end local v5    # "errorMessage":Ljava/lang/String;
    .end local v6    # "ex":Ljava/lang/Exception;
    .restart local v8    # "j":I
    :cond_1
    :try_start_1
    move-object/from16 v0, p1

    move-object/from16 v1, p2

    invoke-virtual {v0, v1, v10}, Landroid/database/sqlite/SQLiteDatabase;->rawQuery(Ljava/lang/String;[Ljava/lang/String;)Landroid/database/Cursor;
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    move-result-object v3

    .line 406
    if-eqz v3, :cond_3

    invoke-interface {v3}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v14

    if-eqz v14, :cond_3

    .line 407
    new-instance v12, Lorg/json/JSONArray;

    invoke-direct {v12}, Lorg/json/JSONArray;-><init>()V

    .line 408
    .local v12, "rowsArrayResult":Lorg/json/JSONArray;
    const-string v9, ""

    .line 409
    .local v9, "key":Ljava/lang/String;
    invoke-interface {v3}, Landroid/database/Cursor;->getColumnCount()I

    move-result v2

    .line 413
    .local v2, "colCount":I
    :cond_2
    new-instance v11, Lorg/json/JSONObject;

    invoke-direct {v11}, Lorg/json/JSONObject;-><init>()V

    .line 415
    .local v11, "row":Lorg/json/JSONObject;
    const/4 v7, 0x0

    .local v7, "i":I
    :goto_2
    if-ge v7, v2, :cond_6

    .line 416
    :try_start_2
    invoke-interface {v3, v7}, Landroid/database/Cursor;->getColumnName(I)Ljava/lang/String;

    move-result-object v9

    .line 418
    sget v14, Landroid/os/Build$VERSION;->SDK_INT:I
    :try_end_2
    .catch Lorg/json/JSONException; {:try_start_2 .. :try_end_2} :catch_2

    const/16 v15, 0xb

    if-lt v14, v15, :cond_5

    .line 422
    :try_start_3
    move-object/from16 v0, p0

    invoke-direct {v0, v11, v9, v3, v7}, Lio/liteglue/SQLiteAndroidDatabase;->bindPostHoneycomb(Lorg/json/JSONObject;Ljava/lang/String;Landroid/database/Cursor;I)V
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_1
    .catch Lorg/json/JSONException; {:try_start_3 .. :try_end_3} :catch_2

    .line 415
    :goto_3
    add-int/lit8 v7, v7, 0x1

    goto :goto_2

    .line 423
    :catch_1
    move-exception v6

    .line 424
    .restart local v6    # "ex":Ljava/lang/Exception;
    :try_start_4
    move-object/from16 v0, p0

    invoke-direct {v0, v11, v9, v3, v7}, Lio/liteglue/SQLiteAndroidDatabase;->bindPreHoneycomb(Lorg/json/JSONObject;Ljava/lang/String;Landroid/database/Cursor;I)V
    :try_end_4
    .catch Lorg/json/JSONException; {:try_start_4 .. :try_end_4} :catch_2

    goto :goto_3

    .line 433
    .end local v6    # "ex":Ljava/lang/Exception;
    :catch_2
    move-exception v4

    .line 434
    .local v4, "e":Lorg/json/JSONException;
    invoke-virtual {v4}, Lorg/json/JSONException;->printStackTrace()V

    .line 436
    .end local v4    # "e":Lorg/json/JSONException;
    :goto_4
    invoke-interface {v3}, Landroid/database/Cursor;->moveToNext()Z

    move-result v14

    if-nez v14, :cond_2

    .line 439
    :try_start_5
    const-string v14, "rows"

    invoke-virtual {v13, v14, v12}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_5
    .catch Lorg/json/JSONException; {:try_start_5 .. :try_end_5} :catch_3

    .line 445
    .end local v2    # "colCount":I
    .end local v7    # "i":I
    .end local v9    # "key":Ljava/lang/String;
    .end local v11    # "row":Lorg/json/JSONObject;
    .end local v12    # "rowsArrayResult":Lorg/json/JSONArray;
    :cond_3
    :goto_5
    if-eqz v3, :cond_4

    .line 446
    invoke-interface {v3}, Landroid/database/Cursor;->close()V

    .line 449
    :cond_4
    return-object v13

    .line 427
    .restart local v2    # "colCount":I
    .restart local v7    # "i":I
    .restart local v9    # "key":Ljava/lang/String;
    .restart local v11    # "row":Lorg/json/JSONObject;
    .restart local v12    # "rowsArrayResult":Lorg/json/JSONArray;
    :cond_5
    :try_start_6
    move-object/from16 v0, p0

    invoke-direct {v0, v11, v9, v3, v7}, Lio/liteglue/SQLiteAndroidDatabase;->bindPreHoneycomb(Lorg/json/JSONObject;Ljava/lang/String;Landroid/database/Cursor;I)V

    goto :goto_3

    .line 431
    :cond_6
    invoke-virtual {v12, v11}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;
    :try_end_6
    .catch Lorg/json/JSONException; {:try_start_6 .. :try_end_6} :catch_2

    goto :goto_4

    .line 440
    :catch_3
    move-exception v4

    .line 441
    .restart local v4    # "e":Lorg/json/JSONException;
    invoke-virtual {v4}, Lorg/json/JSONException;->printStackTrace()V

    goto :goto_5
.end method

.method static getQueryType(Ljava/lang/String;)Lio/liteglue/SQLiteAndroidDatabase$QueryType;
    .locals 2
    .param p0, "query"    # Ljava/lang/String;

    .prologue
    .line 497
    sget-object v1, Lio/liteglue/SQLiteAndroidDatabase;->FIRST_WORD:Ljava/util/regex/Pattern;

    invoke-virtual {v1, p0}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v0

    .line 498
    .local v0, "matcher":Ljava/util/regex/Matcher;
    invoke-virtual {v0}, Ljava/util/regex/Matcher;->find()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 500
    const/4 v1, 0x1

    :try_start_0
    invoke-virtual {v0, v1}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lio/liteglue/SQLiteAndroidDatabase$QueryType;->valueOf(Ljava/lang/String;)Lio/liteglue/SQLiteAndroidDatabase$QueryType;
    :try_end_0
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v1

    .line 505
    :goto_0
    return-object v1

    .line 501
    :catch_0
    move-exception v1

    .line 505
    :cond_0
    sget-object v1, Lio/liteglue/SQLiteAndroidDatabase$QueryType;->other:Lio/liteglue/SQLiteAndroidDatabase$QueryType;

    goto :goto_0
.end method


# virtual methods
.method bugWorkaround()V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 88
    invoke-virtual {p0}, Lio/liteglue/SQLiteAndroidDatabase;->closeDatabaseNow()V

    .line 89
    iget-object v0, p0, Lio/liteglue/SQLiteAndroidDatabase;->dbFile:Ljava/io/File;

    invoke-virtual {p0, v0}, Lio/liteglue/SQLiteAndroidDatabase;->open(Ljava/io/File;)V

    .line 90
    return-void
.end method

.method closeDatabaseNow()V
    .locals 1

    .prologue
    .line 81
    iget-object v0, p0, Lio/liteglue/SQLiteAndroidDatabase;->mydb:Landroid/database/sqlite/SQLiteDatabase;

    if-eqz v0, :cond_0

    .line 82
    iget-object v0, p0, Lio/liteglue/SQLiteAndroidDatabase;->mydb:Landroid/database/sqlite/SQLiteDatabase;

    invoke-virtual {v0}, Landroid/database/sqlite/SQLiteDatabase;->close()V

    .line 83
    const/4 v0, 0x0

    iput-object v0, p0, Lio/liteglue/SQLiteAndroidDatabase;->mydb:Landroid/database/sqlite/SQLiteDatabase;

    .line 85
    :cond_0
    return-void
.end method

.method executeSqlBatch([Ljava/lang/String;[Lorg/json/JSONArray;[Ljava/lang/String;Lorg/apache/cordova/CallbackContext;)V
    .locals 26
    .param p1, "queryarr"    # [Ljava/lang/String;
    .param p2, "jsonparams"    # [Lorg/json/JSONArray;
    .param p3, "queryIDs"    # [Ljava/lang/String;
    .param p4, "cbc"    # Lorg/apache/cordova/CallbackContext;
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "NewApi"
        }
    .end annotation

    .prologue
    .line 105
    move-object/from16 v0, p0

    iget-object v2, v0, Lio/liteglue/SQLiteAndroidDatabase;->mydb:Landroid/database/sqlite/SQLiteDatabase;

    if-nez v2, :cond_0

    .line 107
    const-string v2, "database has been closed"

    move-object/from16 v0, p4

    invoke-virtual {v0, v2}, Lorg/apache/cordova/CallbackContext;->error(Ljava/lang/String;)V

    .line 282
    :goto_0
    return-void

    .line 111
    :cond_0
    const-string v4, ""

    .line 112
    .local v4, "query":Ljava/lang/String;
    const-string v20, ""

    .line 113
    .local v20, "query_id":Ljava/lang/String;
    move-object/from16 v0, p1

    array-length v14, v0

    .line 114
    .local v14, "len":I
    new-instance v8, Lorg/json/JSONArray;

    invoke-direct {v8}, Lorg/json/JSONArray;-><init>()V

    .line 116
    .local v8, "batchResults":Lorg/json/JSONArray;
    const/4 v7, 0x0

    .local v7, "i":I
    :goto_1
    if-ge v7, v14, :cond_b

    .line 117
    const/16 v23, 0x0

    .line 118
    .local v23, "rowsAffectedCompat":I
    const/16 v17, 0x0

    .line 119
    .local v17, "needRowsAffectedCompat":Z
    aget-object v20, p3, v7

    .line 121
    const/16 v18, 0x0

    .line 122
    .local v18, "queryResult":Lorg/json/JSONObject;
    const-string v10, "unknown"

    .line 125
    .local v10, "errorMessage":Ljava/lang/String;
    const/16 v16, 0x1

    .line 127
    .local v16, "needRawQuery":Z
    :try_start_0
    aget-object v4, p1, v7

    .line 129
    invoke-static {v4}, Lio/liteglue/SQLiteAndroidDatabase;->getQueryType(Ljava/lang/String;)Lio/liteglue/SQLiteAndroidDatabase$QueryType;

    move-result-object v3

    .line 131
    .local v3, "queryType":Lio/liteglue/SQLiteAndroidDatabase$QueryType;
    sget-object v2, Lio/liteglue/SQLiteAndroidDatabase$QueryType;->update:Lio/liteglue/SQLiteAndroidDatabase$QueryType;

    if-eq v3, v2, :cond_1

    sget-object v2, Lio/liteglue/SQLiteAndroidDatabase$QueryType;->delete:Lio/liteglue/SQLiteAndroidDatabase$QueryType;

    if-ne v3, v2, :cond_d

    .line 132
    :cond_1
    sget v2, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v5, 0xb

    if-lt v2, v5, :cond_8

    .line 133
    move-object/from16 v0, p0

    iget-object v2, v0, Lio/liteglue/SQLiteAndroidDatabase;->mydb:Landroid/database/sqlite/SQLiteDatabase;

    invoke-virtual {v2, v4}, Landroid/database/sqlite/SQLiteDatabase;->compileStatement(Ljava/lang/String;)Landroid/database/sqlite/SQLiteStatement;

    move-result-object v15

    .line 135
    .local v15, "myStatement":Landroid/database/sqlite/SQLiteStatement;
    if-eqz p2, :cond_2

    .line 136
    aget-object v2, p2, v7

    move-object/from16 v0, p0

    invoke-direct {v0, v15, v2}, Lio/liteglue/SQLiteAndroidDatabase;->bindArgsToStatement(Landroid/database/sqlite/SQLiteStatement;Lorg/json/JSONArray;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_5

    .line 139
    :cond_2
    const/16 v22, -0x1

    .line 143
    .local v22, "rowsAffected":I
    :try_start_1
    invoke-virtual {v15}, Landroid/database/sqlite/SQLiteStatement;->executeUpdateDelete()I
    :try_end_1
    .catch Landroid/database/sqlite/SQLiteException; {:try_start_1 .. :try_end_1} :catch_0
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_7

    move-result v22

    .line 145
    const/16 v16, 0x0

    .line 157
    :goto_2
    const/4 v2, -0x1

    move/from16 v0, v22

    if-eq v0, v2, :cond_3

    .line 158
    :try_start_2
    new-instance v19, Lorg/json/JSONObject;

    invoke-direct/range {v19 .. v19}, Lorg/json/JSONObject;-><init>()V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_5

    .line 159
    .end local v18    # "queryResult":Lorg/json/JSONObject;
    .local v19, "queryResult":Lorg/json/JSONObject;
    :try_start_3
    const-string v2, "rowsAffected"

    move-object/from16 v0, v19

    move/from16 v1, v22

    invoke-virtual {v0, v2, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    move-object/from16 v18, v19

    .end local v19    # "queryResult":Lorg/json/JSONObject;
    .restart local v18    # "queryResult":Lorg/json/JSONObject;
    :cond_3
    move-object/from16 v19, v18

    .line 168
    .end local v15    # "myStatement":Landroid/database/sqlite/SQLiteStatement;
    .end local v18    # "queryResult":Lorg/json/JSONObject;
    .end local v22    # "rowsAffected":I
    .restart local v19    # "queryResult":Lorg/json/JSONObject;
    :goto_3
    sget-object v2, Lio/liteglue/SQLiteAndroidDatabase$QueryType;->insert:Lio/liteglue/SQLiteAndroidDatabase$QueryType;

    if-ne v3, v2, :cond_4

    if-eqz p2, :cond_4

    .line 169
    const/16 v16, 0x0

    .line 171
    move-object/from16 v0, p0

    iget-object v2, v0, Lio/liteglue/SQLiteAndroidDatabase;->mydb:Landroid/database/sqlite/SQLiteDatabase;

    invoke-virtual {v2, v4}, Landroid/database/sqlite/SQLiteDatabase;->compileStatement(Ljava/lang/String;)Landroid/database/sqlite/SQLiteStatement;

    move-result-object v15

    .line 173
    .restart local v15    # "myStatement":Landroid/database/sqlite/SQLiteStatement;
    aget-object v2, p2, v7

    move-object/from16 v0, p0

    invoke-direct {v0, v15, v2}, Lio/liteglue/SQLiteAndroidDatabase;->bindArgsToStatement(Landroid/database/sqlite/SQLiteStatement;Lorg/json/JSONArray;)V
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_8

    .line 175
    const-wide/16 v12, -0x1

    .line 178
    .local v12, "insertId":J
    :try_start_4
    invoke-virtual {v15}, Landroid/database/sqlite/SQLiteStatement;->executeInsert()J

    move-result-wide v12

    .line 181
    new-instance v18, Lorg/json/JSONObject;

    invoke-direct/range {v18 .. v18}, Lorg/json/JSONObject;-><init>()V
    :try_end_4
    .catch Landroid/database/sqlite/SQLiteException; {:try_start_4 .. :try_end_4} :catch_c
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_8

    .line 182
    .end local v19    # "queryResult":Lorg/json/JSONObject;
    .restart local v18    # "queryResult":Lorg/json/JSONObject;
    const-wide/16 v24, -0x1

    cmp-long v2, v12, v24

    if-eqz v2, :cond_9

    .line 183
    :try_start_5
    const-string v2, "insertId"

    move-object/from16 v0, v18

    invoke-virtual {v0, v2, v12, v13}, Lorg/json/JSONObject;->put(Ljava/lang/String;J)Lorg/json/JSONObject;

    .line 184
    const-string v2, "rowsAffected"

    const/4 v5, 0x1

    move-object/from16 v0, v18

    invoke-virtual {v0, v2, v5}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;
    :try_end_5
    .catch Landroid/database/sqlite/SQLiteException; {:try_start_5 .. :try_end_5} :catch_1
    .catch Ljava/lang/Exception; {:try_start_5 .. :try_end_5} :catch_5

    :goto_4
    move-object/from16 v19, v18

    .line 197
    .end local v12    # "insertId":J
    .end local v15    # "myStatement":Landroid/database/sqlite/SQLiteStatement;
    .end local v18    # "queryResult":Lorg/json/JSONObject;
    .restart local v19    # "queryResult":Lorg/json/JSONObject;
    :cond_4
    :goto_5
    :try_start_6
    sget-object v2, Lio/liteglue/SQLiteAndroidDatabase$QueryType;->begin:Lio/liteglue/SQLiteAndroidDatabase$QueryType;
    :try_end_6
    .catch Ljava/lang/Exception; {:try_start_6 .. :try_end_6} :catch_8

    if-ne v3, v2, :cond_5

    .line 198
    const/16 v16, 0x0

    .line 200
    :try_start_7
    move-object/from16 v0, p0

    iget-object v2, v0, Lio/liteglue/SQLiteAndroidDatabase;->mydb:Landroid/database/sqlite/SQLiteDatabase;

    invoke-virtual {v2}, Landroid/database/sqlite/SQLiteDatabase;->beginTransaction()V

    .line 202
    new-instance v18, Lorg/json/JSONObject;

    invoke-direct/range {v18 .. v18}, Lorg/json/JSONObject;-><init>()V
    :try_end_7
    .catch Landroid/database/sqlite/SQLiteException; {:try_start_7 .. :try_end_7} :catch_2
    .catch Ljava/lang/Exception; {:try_start_7 .. :try_end_7} :catch_8

    .line 203
    .end local v19    # "queryResult":Lorg/json/JSONObject;
    .restart local v18    # "queryResult":Lorg/json/JSONObject;
    :try_start_8
    const-string v2, "rowsAffected"

    const/4 v5, 0x0

    move-object/from16 v0, v18

    invoke-virtual {v0, v2, v5}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;
    :try_end_8
    .catch Landroid/database/sqlite/SQLiteException; {:try_start_8 .. :try_end_8} :catch_b
    .catch Ljava/lang/Exception; {:try_start_8 .. :try_end_8} :catch_5

    move-object/from16 v19, v18

    .line 211
    .end local v18    # "queryResult":Lorg/json/JSONObject;
    .restart local v19    # "queryResult":Lorg/json/JSONObject;
    :cond_5
    :goto_6
    :try_start_9
    sget-object v2, Lio/liteglue/SQLiteAndroidDatabase$QueryType;->commit:Lio/liteglue/SQLiteAndroidDatabase$QueryType;
    :try_end_9
    .catch Ljava/lang/Exception; {:try_start_9 .. :try_end_9} :catch_8

    if-ne v3, v2, :cond_6

    .line 212
    const/16 v16, 0x0

    .line 214
    :try_start_a
    move-object/from16 v0, p0

    iget-object v2, v0, Lio/liteglue/SQLiteAndroidDatabase;->mydb:Landroid/database/sqlite/SQLiteDatabase;

    invoke-virtual {v2}, Landroid/database/sqlite/SQLiteDatabase;->setTransactionSuccessful()V

    .line 215
    move-object/from16 v0, p0

    iget-object v2, v0, Lio/liteglue/SQLiteAndroidDatabase;->mydb:Landroid/database/sqlite/SQLiteDatabase;

    invoke-virtual {v2}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    .line 217
    new-instance v18, Lorg/json/JSONObject;

    invoke-direct/range {v18 .. v18}, Lorg/json/JSONObject;-><init>()V
    :try_end_a
    .catch Landroid/database/sqlite/SQLiteException; {:try_start_a .. :try_end_a} :catch_3
    .catch Ljava/lang/Exception; {:try_start_a .. :try_end_a} :catch_8

    .line 218
    .end local v19    # "queryResult":Lorg/json/JSONObject;
    .restart local v18    # "queryResult":Lorg/json/JSONObject;
    :try_start_b
    const-string v2, "rowsAffected"

    const/4 v5, 0x0

    move-object/from16 v0, v18

    invoke-virtual {v0, v2, v5}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;
    :try_end_b
    .catch Landroid/database/sqlite/SQLiteException; {:try_start_b .. :try_end_b} :catch_a
    .catch Ljava/lang/Exception; {:try_start_b .. :try_end_b} :catch_5

    move-object/from16 v19, v18

    .line 226
    .end local v18    # "queryResult":Lorg/json/JSONObject;
    .restart local v19    # "queryResult":Lorg/json/JSONObject;
    :cond_6
    :goto_7
    :try_start_c
    sget-object v2, Lio/liteglue/SQLiteAndroidDatabase$QueryType;->rollback:Lio/liteglue/SQLiteAndroidDatabase$QueryType;
    :try_end_c
    .catch Ljava/lang/Exception; {:try_start_c .. :try_end_c} :catch_8

    if-ne v3, v2, :cond_c

    .line 227
    const/16 v16, 0x0

    .line 229
    :try_start_d
    move-object/from16 v0, p0

    iget-object v2, v0, Lio/liteglue/SQLiteAndroidDatabase;->mydb:Landroid/database/sqlite/SQLiteDatabase;

    invoke-virtual {v2}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    .line 231
    new-instance v18, Lorg/json/JSONObject;

    invoke-direct/range {v18 .. v18}, Lorg/json/JSONObject;-><init>()V
    :try_end_d
    .catch Landroid/database/sqlite/SQLiteException; {:try_start_d .. :try_end_d} :catch_4
    .catch Ljava/lang/Exception; {:try_start_d .. :try_end_d} :catch_8

    .line 232
    .end local v19    # "queryResult":Lorg/json/JSONObject;
    .restart local v18    # "queryResult":Lorg/json/JSONObject;
    :try_start_e
    const-string v2, "rowsAffected"

    const/4 v5, 0x0

    move-object/from16 v0, v18

    invoke-virtual {v0, v2, v5}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;
    :try_end_e
    .catch Landroid/database/sqlite/SQLiteException; {:try_start_e .. :try_end_e} :catch_9
    .catch Ljava/lang/Exception; {:try_start_e .. :try_end_e} :catch_5

    .line 241
    :goto_8
    if-eqz v16, :cond_7

    .line 242
    :try_start_f
    move-object/from16 v0, p0

    iget-object v2, v0, Lio/liteglue/SQLiteAndroidDatabase;->mydb:Landroid/database/sqlite/SQLiteDatabase;

    aget-object v5, p2, v7

    move-object/from16 v0, p0

    move-object/from16 v1, p4

    invoke-direct {v0, v2, v4, v5, v1}, Lio/liteglue/SQLiteAndroidDatabase;->executeSqlStatementQuery(Landroid/database/sqlite/SQLiteDatabase;Ljava/lang/String;Lorg/json/JSONArray;Lorg/apache/cordova/CallbackContext;)Lorg/json/JSONObject;

    move-result-object v18

    .line 244
    if-eqz v17, :cond_7

    .line 245
    const-string v2, "rowsAffected"

    move-object/from16 v0, v18

    move/from16 v1, v23

    invoke-virtual {v0, v2, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;
    :try_end_f
    .catch Ljava/lang/Exception; {:try_start_f .. :try_end_f} :catch_5

    .line 255
    .end local v3    # "queryType":Lio/liteglue/SQLiteAndroidDatabase$QueryType;
    :cond_7
    :goto_9
    if-eqz v18, :cond_a

    .line 256
    :try_start_10
    new-instance v21, Lorg/json/JSONObject;

    invoke-direct/range {v21 .. v21}, Lorg/json/JSONObject;-><init>()V

    .line 257
    .local v21, "r":Lorg/json/JSONObject;
    const-string v2, "qid"

    move-object/from16 v0, v21

    move-object/from16 v1, v20

    invoke-virtual {v0, v2, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 259
    const-string v2, "type"

    const-string v5, "success"

    move-object/from16 v0, v21

    invoke-virtual {v0, v2, v5}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 260
    const-string v2, "result"

    move-object/from16 v0, v21

    move-object/from16 v1, v18

    invoke-virtual {v0, v2, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 262
    move-object/from16 v0, v21

    invoke-virtual {v8, v0}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;
    :try_end_10
    .catch Lorg/json/JSONException; {:try_start_10 .. :try_end_10} :catch_6

    .line 116
    .end local v21    # "r":Lorg/json/JSONObject;
    :goto_a
    add-int/lit8 v7, v7, 0x1

    goto/16 :goto_1

    .line 146
    .restart local v3    # "queryType":Lio/liteglue/SQLiteAndroidDatabase$QueryType;
    .restart local v15    # "myStatement":Landroid/database/sqlite/SQLiteStatement;
    .restart local v22    # "rowsAffected":I
    :catch_0
    move-exception v11

    .line 148
    .local v11, "ex":Landroid/database/sqlite/SQLiteException;
    :try_start_11
    invoke-virtual {v11}, Landroid/database/sqlite/SQLiteException;->printStackTrace()V

    .line 149
    invoke-virtual {v11}, Landroid/database/sqlite/SQLiteException;->getMessage()Ljava/lang/String;

    move-result-object v10

    .line 150
    const-string v2, "executeSqlBatch"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "SQLiteStatement.executeUpdateDelete(): Error="

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v2, v5}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 151
    const/16 v16, 0x0

    .line 155
    goto/16 :goto_2

    .line 162
    .end local v11    # "ex":Landroid/database/sqlite/SQLiteException;
    .end local v15    # "myStatement":Landroid/database/sqlite/SQLiteStatement;
    .end local v22    # "rowsAffected":I
    :cond_8
    move-object/from16 v0, p0

    iget-object v6, v0, Lio/liteglue/SQLiteAndroidDatabase;->mydb:Landroid/database/sqlite/SQLiteDatabase;

    move-object/from16 v2, p0

    move-object/from16 v5, p2

    invoke-direct/range {v2 .. v7}, Lio/liteglue/SQLiteAndroidDatabase;->countRowsAffectedCompat(Lio/liteglue/SQLiteAndroidDatabase$QueryType;Ljava/lang/String;[Lorg/json/JSONArray;Landroid/database/sqlite/SQLiteDatabase;I)I
    :try_end_11
    .catch Ljava/lang/Exception; {:try_start_11 .. :try_end_11} :catch_5

    move-result v23

    .line 163
    const/16 v17, 0x1

    move-object/from16 v19, v18

    .end local v18    # "queryResult":Lorg/json/JSONObject;
    .restart local v19    # "queryResult":Lorg/json/JSONObject;
    goto/16 :goto_3

    .line 186
    .end local v19    # "queryResult":Lorg/json/JSONObject;
    .restart local v12    # "insertId":J
    .restart local v15    # "myStatement":Landroid/database/sqlite/SQLiteStatement;
    .restart local v18    # "queryResult":Lorg/json/JSONObject;
    :cond_9
    :try_start_12
    const-string v2, "rowsAffected"

    const/4 v5, 0x0

    move-object/from16 v0, v18

    invoke-virtual {v0, v2, v5}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;
    :try_end_12
    .catch Landroid/database/sqlite/SQLiteException; {:try_start_12 .. :try_end_12} :catch_1
    .catch Ljava/lang/Exception; {:try_start_12 .. :try_end_12} :catch_5

    goto/16 :goto_4

    .line 188
    :catch_1
    move-exception v11

    .line 191
    .restart local v11    # "ex":Landroid/database/sqlite/SQLiteException;
    :goto_b
    :try_start_13
    invoke-virtual {v11}, Landroid/database/sqlite/SQLiteException;->printStackTrace()V

    .line 192
    invoke-virtual {v11}, Landroid/database/sqlite/SQLiteException;->getMessage()Ljava/lang/String;

    move-result-object v10

    .line 193
    const-string v2, "executeSqlBatch"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "SQLiteDatabase.executeInsert(): Error="

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v2, v5}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    move-object/from16 v19, v18

    .end local v18    # "queryResult":Lorg/json/JSONObject;
    .restart local v19    # "queryResult":Lorg/json/JSONObject;
    goto/16 :goto_5

    .line 204
    .end local v11    # "ex":Landroid/database/sqlite/SQLiteException;
    .end local v12    # "insertId":J
    .end local v15    # "myStatement":Landroid/database/sqlite/SQLiteStatement;
    :catch_2
    move-exception v11

    move-object/from16 v18, v19

    .line 205
    .end local v19    # "queryResult":Lorg/json/JSONObject;
    .restart local v11    # "ex":Landroid/database/sqlite/SQLiteException;
    .restart local v18    # "queryResult":Lorg/json/JSONObject;
    :goto_c
    invoke-virtual {v11}, Landroid/database/sqlite/SQLiteException;->printStackTrace()V

    .line 206
    invoke-virtual {v11}, Landroid/database/sqlite/SQLiteException;->getMessage()Ljava/lang/String;

    move-result-object v10

    .line 207
    const-string v2, "executeSqlBatch"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "SQLiteDatabase.beginTransaction(): Error="

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v2, v5}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    move-object/from16 v19, v18

    .end local v18    # "queryResult":Lorg/json/JSONObject;
    .restart local v19    # "queryResult":Lorg/json/JSONObject;
    goto/16 :goto_6

    .line 219
    .end local v11    # "ex":Landroid/database/sqlite/SQLiteException;
    :catch_3
    move-exception v11

    move-object/from16 v18, v19

    .line 220
    .end local v19    # "queryResult":Lorg/json/JSONObject;
    .restart local v11    # "ex":Landroid/database/sqlite/SQLiteException;
    .restart local v18    # "queryResult":Lorg/json/JSONObject;
    :goto_d
    invoke-virtual {v11}, Landroid/database/sqlite/SQLiteException;->printStackTrace()V

    .line 221
    invoke-virtual {v11}, Landroid/database/sqlite/SQLiteException;->getMessage()Ljava/lang/String;

    move-result-object v10

    .line 222
    const-string v2, "executeSqlBatch"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "SQLiteDatabase.setTransactionSuccessful/endTransaction(): Error="

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v2, v5}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    move-object/from16 v19, v18

    .end local v18    # "queryResult":Lorg/json/JSONObject;
    .restart local v19    # "queryResult":Lorg/json/JSONObject;
    goto/16 :goto_7

    .line 233
    .end local v11    # "ex":Landroid/database/sqlite/SQLiteException;
    :catch_4
    move-exception v11

    move-object/from16 v18, v19

    .line 234
    .end local v19    # "queryResult":Lorg/json/JSONObject;
    .restart local v11    # "ex":Landroid/database/sqlite/SQLiteException;
    .restart local v18    # "queryResult":Lorg/json/JSONObject;
    :goto_e
    invoke-virtual {v11}, Landroid/database/sqlite/SQLiteException;->printStackTrace()V

    .line 235
    invoke-virtual {v11}, Landroid/database/sqlite/SQLiteException;->getMessage()Ljava/lang/String;

    move-result-object v10

    .line 236
    const-string v2, "executeSqlBatch"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "SQLiteDatabase.endTransaction(): Error="

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v2, v5}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_13
    .catch Ljava/lang/Exception; {:try_start_13 .. :try_end_13} :catch_5

    goto/16 :goto_8

    .line 248
    .end local v3    # "queryType":Lio/liteglue/SQLiteAndroidDatabase$QueryType;
    .end local v11    # "ex":Landroid/database/sqlite/SQLiteException;
    :catch_5
    move-exception v11

    .line 249
    .local v11, "ex":Ljava/lang/Exception;
    :goto_f
    invoke-virtual {v11}, Ljava/lang/Exception;->printStackTrace()V

    .line 250
    invoke-virtual {v11}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v10

    .line 251
    const-string v2, "executeSqlBatch"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "SQLiteAndroidDatabase.executeSql[Batch](): Error="

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v2, v5}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    goto/16 :goto_9

    .line 264
    .end local v11    # "ex":Ljava/lang/Exception;
    :cond_a
    :try_start_14
    new-instance v21, Lorg/json/JSONObject;

    invoke-direct/range {v21 .. v21}, Lorg/json/JSONObject;-><init>()V

    .line 265
    .restart local v21    # "r":Lorg/json/JSONObject;
    const-string v2, "qid"

    move-object/from16 v0, v21

    move-object/from16 v1, v20

    invoke-virtual {v0, v2, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 266
    const-string v2, "type"

    const-string v5, "error"

    move-object/from16 v0, v21

    invoke-virtual {v0, v2, v5}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 268
    new-instance v9, Lorg/json/JSONObject;

    invoke-direct {v9}, Lorg/json/JSONObject;-><init>()V

    .line 269
    .local v9, "er":Lorg/json/JSONObject;
    const-string v2, "message"

    invoke-virtual {v9, v2, v10}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 270
    const-string v2, "result"

    move-object/from16 v0, v21

    invoke-virtual {v0, v2, v9}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 272
    move-object/from16 v0, v21

    invoke-virtual {v8, v0}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;
    :try_end_14
    .catch Lorg/json/JSONException; {:try_start_14 .. :try_end_14} :catch_6

    goto/16 :goto_a

    .line 274
    .end local v9    # "er":Lorg/json/JSONObject;
    .end local v21    # "r":Lorg/json/JSONObject;
    :catch_6
    move-exception v11

    .line 275
    .local v11, "ex":Lorg/json/JSONException;
    invoke-virtual {v11}, Lorg/json/JSONException;->printStackTrace()V

    .line 276
    const-string v2, "executeSqlBatch"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "SQLiteAndroidDatabase.executeSql[Batch](): Error="

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v11}, Lorg/json/JSONException;->getMessage()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v2, v5}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    goto/16 :goto_a

    .line 281
    .end local v10    # "errorMessage":Ljava/lang/String;
    .end local v11    # "ex":Lorg/json/JSONException;
    .end local v16    # "needRawQuery":Z
    .end local v17    # "needRowsAffectedCompat":Z
    .end local v18    # "queryResult":Lorg/json/JSONObject;
    .end local v23    # "rowsAffectedCompat":I
    :cond_b
    move-object/from16 v0, p4

    invoke-virtual {v0, v8}, Lorg/apache/cordova/CallbackContext;->success(Lorg/json/JSONArray;)V

    goto/16 :goto_0

    .line 152
    .restart local v3    # "queryType":Lio/liteglue/SQLiteAndroidDatabase$QueryType;
    .restart local v10    # "errorMessage":Ljava/lang/String;
    .restart local v15    # "myStatement":Landroid/database/sqlite/SQLiteStatement;
    .restart local v16    # "needRawQuery":Z
    .restart local v17    # "needRowsAffectedCompat":Z
    .restart local v18    # "queryResult":Lorg/json/JSONObject;
    .restart local v22    # "rowsAffected":I
    .restart local v23    # "rowsAffectedCompat":I
    :catch_7
    move-exception v2

    goto/16 :goto_2

    .line 248
    .end local v15    # "myStatement":Landroid/database/sqlite/SQLiteStatement;
    .end local v18    # "queryResult":Lorg/json/JSONObject;
    .end local v22    # "rowsAffected":I
    .restart local v19    # "queryResult":Lorg/json/JSONObject;
    :catch_8
    move-exception v11

    move-object/from16 v18, v19

    .end local v19    # "queryResult":Lorg/json/JSONObject;
    .restart local v18    # "queryResult":Lorg/json/JSONObject;
    goto :goto_f

    .line 233
    :catch_9
    move-exception v11

    goto/16 :goto_e

    .line 219
    :catch_a
    move-exception v11

    goto/16 :goto_d

    .line 204
    :catch_b
    move-exception v11

    goto/16 :goto_c

    .line 188
    .end local v18    # "queryResult":Lorg/json/JSONObject;
    .restart local v12    # "insertId":J
    .restart local v15    # "myStatement":Landroid/database/sqlite/SQLiteStatement;
    .restart local v19    # "queryResult":Lorg/json/JSONObject;
    :catch_c
    move-exception v11

    move-object/from16 v18, v19

    .end local v19    # "queryResult":Lorg/json/JSONObject;
    .restart local v18    # "queryResult":Lorg/json/JSONObject;
    goto/16 :goto_b

    .end local v12    # "insertId":J
    .end local v15    # "myStatement":Landroid/database/sqlite/SQLiteStatement;
    .end local v18    # "queryResult":Lorg/json/JSONObject;
    .restart local v19    # "queryResult":Lorg/json/JSONObject;
    :cond_c
    move-object/from16 v18, v19

    .end local v19    # "queryResult":Lorg/json/JSONObject;
    .restart local v18    # "queryResult":Lorg/json/JSONObject;
    goto/16 :goto_8

    :cond_d
    move-object/from16 v19, v18

    .end local v18    # "queryResult":Lorg/json/JSONObject;
    .restart local v19    # "queryResult":Lorg/json/JSONObject;
    goto/16 :goto_3
.end method

.method open(Ljava/io/File;)V
    .locals 5
    .param p1, "dbfile"    # Ljava/io/File;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    const/4 v4, 0x0

    .line 63
    iput-object p1, p0, Lio/liteglue/SQLiteAndroidDatabase;->dbFile:Ljava/io/File;

    .line 66
    :try_start_0
    invoke-virtual {p1}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v1

    const/4 v2, 0x0

    const/16 v3, 0x10

    invoke-static {v1, v2, v3}, Landroid/database/sqlite/SQLiteDatabase;->openDatabase(Ljava/lang/String;Landroid/database/sqlite/SQLiteDatabase$CursorFactory;I)Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v1

    iput-object v1, p0, Lio/liteglue/SQLiteAndroidDatabase;->mydb:Landroid/database/sqlite/SQLiteDatabase;
    :try_end_0
    .catch Landroid/database/sqlite/SQLiteException; {:try_start_0 .. :try_end_0} :catch_0

    .line 75
    :goto_0
    return-void

    .line 68
    :catch_0
    move-exception v0

    .line 69
    .local v0, "e":Landroid/database/sqlite/SQLiteException;
    sget-object v1, Lio/liteglue/SQLiteAndroidDatabase;->TAG:Ljava/lang/String;

    const-string v2, "SQLiteException while opening DB: "

    invoke-static {v1, v2, v0}, Lcom/belkin/utils/LogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 71
    invoke-virtual {p0}, Lio/liteglue/SQLiteAndroidDatabase;->closeDatabaseNow()V

    .line 73
    invoke-static {p1, v4}, Landroid/database/sqlite/SQLiteDatabase;->openOrCreateDatabase(Ljava/io/File;Landroid/database/sqlite/SQLiteDatabase$CursorFactory;)Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v1

    iput-object v1, p0, Lio/liteglue/SQLiteAndroidDatabase;->mydb:Landroid/database/sqlite/SQLiteDatabase;

    goto :goto_0
.end method
