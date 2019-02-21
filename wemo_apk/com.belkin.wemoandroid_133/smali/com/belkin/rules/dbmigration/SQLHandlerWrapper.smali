.class public Lcom/belkin/rules/dbmigration/SQLHandlerWrapper;
.super Ljava/lang/Object;
.source "SQLHandlerWrapper.java"


# instance fields
.field context:Landroid/content/Context;

.field myDb:Landroid/database/sqlite/SQLiteDatabase;


# direct methods
.method public constructor <init>(Ljava/lang/String;Landroid/content/Context;)V
    .locals 2
    .param p1, "dbName"    # Ljava/lang/String;
    .param p2, "context"    # Landroid/content/Context;

    .prologue
    const/4 v1, 0x0

    .line 50
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 48
    iput-object v1, p0, Lcom/belkin/rules/dbmigration/SQLHandlerWrapper;->myDb:Landroid/database/sqlite/SQLiteDatabase;

    .line 51
    iput-object p2, p0, Lcom/belkin/rules/dbmigration/SQLHandlerWrapper;->context:Landroid/content/Context;

    .line 52
    const/high16 v0, 0x10000000

    invoke-virtual {p2, p1, v0, v1}, Landroid/content/Context;->openOrCreateDatabase(Ljava/lang/String;ILandroid/database/sqlite/SQLiteDatabase$CursorFactory;)Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v0

    iput-object v0, p0, Lcom/belkin/rules/dbmigration/SQLHandlerWrapper;->myDb:Landroid/database/sqlite/SQLiteDatabase;

    .line 54
    return-void
.end method


# virtual methods
.method public CloseOpenedDatabase()Z
    .locals 2

    .prologue
    .line 58
    :try_start_0
    iget-object v1, p0, Lcom/belkin/rules/dbmigration/SQLHandlerWrapper;->myDb:Landroid/database/sqlite/SQLiteDatabase;

    invoke-virtual {v1}, Landroid/database/sqlite/SQLiteDatabase;->close()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 62
    const/4 v1, 0x1

    :goto_0
    return v1

    .line 59
    :catch_0
    move-exception v0

    .line 60
    .local v0, "e":Ljava/lang/Exception;
    const/4 v1, 0x0

    goto :goto_0
.end method

.method public gettheSensorRuleList(Ljava/lang/String;)Ljava/util/Vector;
    .locals 33
    .param p1, "tableName"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/Vector",
            "<",
            "Lcom/belkin/rules/dbmigration/Sensor_1_X;",
            ">;"
        }
    .end annotation

    .prologue
    .line 124
    const/16 v2, 0x10

    new-array v4, v2, [Ljava/lang/String;

    const/4 v2, 0x0

    const-string v3, "id"

    aput-object v3, v4, v2

    const/4 v2, 0x1

    const-string v3, "udn"

    aput-object v3, v4, v2

    const/4 v2, 0x2

    const-string v3, "sensorudn"

    aput-object v3, v4, v2

    const/4 v2, 0x3

    const-string v3, "name"

    aput-object v3, v4, v2

    const/4 v2, 0x4

    const-string v3, "type"

    aput-object v3, v4, v2

    const/4 v2, 0x5

    const-string v3, "enable"

    aput-object v3, v4, v2

    const/4 v2, 0x6

    const-string v3, "sun"

    aput-object v3, v4, v2

    const/4 v2, 0x7

    const-string v3, "mon"

    aput-object v3, v4, v2

    const/16 v2, 0x8

    const-string v3, "tue"

    aput-object v3, v4, v2

    const/16 v2, 0x9

    const-string v3, "wed"

    aput-object v3, v4, v2

    const/16 v2, 0xa

    const-string v3, "thu"

    aput-object v3, v4, v2

    const/16 v2, 0xb

    const-string v3, "fri"

    aput-object v3, v4, v2

    const/16 v2, 0xc

    const-string v3, "sat"

    aput-object v3, v4, v2

    const/16 v2, 0xd

    const-string v3, "starttime"

    aput-object v3, v4, v2

    const/16 v2, 0xe

    const-string v3, "endtime"

    aput-object v3, v4, v2

    const/16 v2, 0xf

    const-string v3, "sensitivity"

    aput-object v3, v4, v2

    .line 127
    .local v4, "fieldName":[Ljava/lang/String;
    :try_start_0
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/belkin/rules/dbmigration/SQLHandlerWrapper;->myDb:Landroid/database/sqlite/SQLiteDatabase;

    if-nez v2, :cond_1

    .line 128
    const/16 v19, 0x0

    .line 184
    :cond_0
    :goto_0
    return-object v19

    .line 130
    :cond_1
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/belkin/rules/dbmigration/SQLHandlerWrapper;->myDb:Landroid/database/sqlite/SQLiteDatabase;

    const/4 v5, 0x0

    const/4 v6, 0x0

    const/4 v7, 0x0

    const/4 v8, 0x0

    const/4 v9, 0x0

    const/4 v10, 0x0

    move-object/from16 v3, p1

    invoke-virtual/range {v2 .. v10}, Landroid/database/sqlite/SQLiteDatabase;->query(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v11

    .line 132
    .local v11, "cursor":Landroid/database/Cursor;
    const/16 v17, 0x0

    .line 133
    .local v17, "index":I
    if-eqz v11, :cond_3

    .line 135
    add-int/lit8 v18, v17, 0x1

    .end local v17    # "index":I
    .local v18, "index":I
    aget-object v2, v4, v17

    invoke-interface {v11, v2}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v16

    .line 136
    .local v16, "id":I
    add-int/lit8 v17, v18, 0x1

    .end local v18    # "index":I
    .restart local v17    # "index":I
    aget-object v2, v4, v18

    invoke-interface {v11, v2}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v31

    .line 137
    .local v31, "udn":I
    add-int/lit8 v18, v17, 0x1

    .end local v17    # "index":I
    .restart local v18    # "index":I
    aget-object v2, v4, v17

    invoke-interface {v11, v2}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v25

    .line 138
    .local v25, "sensorudn":I
    add-int/lit8 v17, v18, 0x1

    .end local v18    # "index":I
    .restart local v17    # "index":I
    aget-object v2, v4, v18

    invoke-interface {v11, v2}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v21

    .line 139
    .local v21, "name":I
    add-int/lit8 v18, v17, 0x1

    .end local v17    # "index":I
    .restart local v18    # "index":I
    aget-object v2, v4, v17

    invoke-interface {v11, v2}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v30

    .line 140
    .local v30, "type":I
    add-int/lit8 v17, v18, 0x1

    .end local v18    # "index":I
    .restart local v17    # "index":I
    aget-object v2, v4, v18

    invoke-interface {v11, v2}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v13

    .line 141
    .local v13, "enable":I
    add-int/lit8 v18, v17, 0x1

    .end local v17    # "index":I
    .restart local v18    # "index":I
    aget-object v2, v4, v17

    invoke-interface {v11, v2}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v27

    .line 142
    .local v27, "sun":I
    add-int/lit8 v17, v18, 0x1

    .end local v18    # "index":I
    .restart local v17    # "index":I
    aget-object v2, v4, v18

    invoke-interface {v11, v2}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v20

    .line 143
    .local v20, "mon":I
    add-int/lit8 v18, v17, 0x1

    .end local v17    # "index":I
    .restart local v18    # "index":I
    aget-object v2, v4, v17

    invoke-interface {v11, v2}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v29

    .line 144
    .local v29, "tue":I
    add-int/lit8 v17, v18, 0x1

    .end local v18    # "index":I
    .restart local v17    # "index":I
    aget-object v2, v4, v18

    invoke-interface {v11, v2}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v32

    .line 145
    .local v32, "wed":I
    add-int/lit8 v18, v17, 0x1

    .end local v17    # "index":I
    .restart local v18    # "index":I
    aget-object v2, v4, v17

    invoke-interface {v11, v2}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v28

    .line 146
    .local v28, "thu":I
    add-int/lit8 v17, v18, 0x1

    .end local v18    # "index":I
    .restart local v17    # "index":I
    aget-object v2, v4, v18

    invoke-interface {v11, v2}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v15

    .line 147
    .local v15, "fri":I
    add-int/lit8 v18, v17, 0x1

    .end local v17    # "index":I
    .restart local v18    # "index":I
    aget-object v2, v4, v17

    invoke-interface {v11, v2}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v22

    .line 148
    .local v22, "sat":I
    add-int/lit8 v17, v18, 0x1

    .end local v18    # "index":I
    .restart local v17    # "index":I
    aget-object v2, v4, v18

    invoke-interface {v11, v2}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v26

    .line 149
    .local v26, "starttime":I
    add-int/lit8 v18, v17, 0x1

    .end local v17    # "index":I
    .restart local v18    # "index":I
    aget-object v2, v4, v17

    invoke-interface {v11, v2}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v14

    .line 150
    .local v14, "endtime":I
    add-int/lit8 v17, v18, 0x1

    .end local v18    # "index":I
    .restart local v17    # "index":I
    aget-object v2, v4, v18

    invoke-interface {v11, v2}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v23

    .line 152
    .local v23, "sensitivity":I
    new-instance v19, Ljava/util/Vector;

    invoke-direct/range {v19 .. v19}, Ljava/util/Vector;-><init>()V

    .line 153
    .local v19, "list":Ljava/util/Vector;, "Ljava/util/Vector<Lcom/belkin/rules/dbmigration/Sensor_1_X;>;"
    invoke-interface {v11}, Landroid/database/Cursor;->moveToFirst()Z

    .line 156
    :cond_2
    new-instance v24, Lcom/belkin/rules/dbmigration/Sensor_1_X;

    invoke-direct/range {v24 .. v24}, Lcom/belkin/rules/dbmigration/Sensor_1_X;-><init>()V

    .line 158
    .local v24, "sensor_1_X":Lcom/belkin/rules/dbmigration/Sensor_1_X;
    move/from16 v0, v16

    invoke-interface {v11, v0}, Landroid/database/Cursor;->getInt(I)I

    move-result v2

    move-object/from16 v0, v24

    invoke-virtual {v0, v2}, Lcom/belkin/rules/dbmigration/Sensor_1_X;->setId(I)V

    .line 159
    move/from16 v0, v31

    invoke-interface {v11, v0}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v2

    move-object/from16 v0, v24

    invoke-virtual {v0, v2}, Lcom/belkin/rules/dbmigration/Sensor_1_X;->setUdn(Ljava/lang/String;)V

    .line 160
    move/from16 v0, v25

    invoke-interface {v11, v0}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v2

    move-object/from16 v0, v24

    invoke-virtual {v0, v2}, Lcom/belkin/rules/dbmigration/Sensor_1_X;->setSensorudn(Ljava/lang/String;)V

    .line 161
    move/from16 v0, v21

    invoke-interface {v11, v0}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v2

    move-object/from16 v0, v24

    invoke-virtual {v0, v2}, Lcom/belkin/rules/dbmigration/Sensor_1_X;->setName(Ljava/lang/String;)V

    .line 162
    move/from16 v0, v30

    invoke-interface {v11, v0}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v2

    move-object/from16 v0, v24

    invoke-virtual {v0, v2}, Lcom/belkin/rules/dbmigration/Sensor_1_X;->setType(Ljava/lang/String;)V

    .line 163
    invoke-interface {v11, v13}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v2

    move-object/from16 v0, v24

    invoke-virtual {v0, v2}, Lcom/belkin/rules/dbmigration/Sensor_1_X;->setEnable(Ljava/lang/String;)V

    .line 164
    move/from16 v0, v27

    invoke-interface {v11, v0}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v2

    move-object/from16 v0, v24

    invoke-virtual {v0, v2}, Lcom/belkin/rules/dbmigration/Sensor_1_X;->setSun(Ljava/lang/String;)V

    .line 165
    move/from16 v0, v20

    invoke-interface {v11, v0}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v2

    move-object/from16 v0, v24

    invoke-virtual {v0, v2}, Lcom/belkin/rules/dbmigration/Sensor_1_X;->setMon(Ljava/lang/String;)V

    .line 166
    move/from16 v0, v29

    invoke-interface {v11, v0}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v2

    move-object/from16 v0, v24

    invoke-virtual {v0, v2}, Lcom/belkin/rules/dbmigration/Sensor_1_X;->setTue(Ljava/lang/String;)V

    .line 167
    move/from16 v0, v32

    invoke-interface {v11, v0}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v2

    move-object/from16 v0, v24

    invoke-virtual {v0, v2}, Lcom/belkin/rules/dbmigration/Sensor_1_X;->setWed(Ljava/lang/String;)V

    .line 168
    move/from16 v0, v28

    invoke-interface {v11, v0}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v2

    move-object/from16 v0, v24

    invoke-virtual {v0, v2}, Lcom/belkin/rules/dbmigration/Sensor_1_X;->setThu(Ljava/lang/String;)V

    .line 169
    invoke-interface {v11, v15}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v2

    move-object/from16 v0, v24

    invoke-virtual {v0, v2}, Lcom/belkin/rules/dbmigration/Sensor_1_X;->setFri(Ljava/lang/String;)V

    .line 170
    move/from16 v0, v22

    invoke-interface {v11, v0}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v2

    move-object/from16 v0, v24

    invoke-virtual {v0, v2}, Lcom/belkin/rules/dbmigration/Sensor_1_X;->setSat(Ljava/lang/String;)V

    .line 171
    move/from16 v0, v26

    invoke-interface {v11, v0}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v2

    move-object/from16 v0, v24

    invoke-virtual {v0, v2}, Lcom/belkin/rules/dbmigration/Sensor_1_X;->setStartTime(Ljava/lang/String;)V

    .line 172
    invoke-interface {v11, v14}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v2

    move-object/from16 v0, v24

    invoke-virtual {v0, v2}, Lcom/belkin/rules/dbmigration/Sensor_1_X;->setEndTime(Ljava/lang/String;)V

    .line 173
    move/from16 v0, v23

    invoke-interface {v11, v0}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v2

    move-object/from16 v0, v24

    invoke-virtual {v0, v2}, Lcom/belkin/rules/dbmigration/Sensor_1_X;->setSensitivity(Ljava/lang/String;)V

    .line 174
    move-object/from16 v0, v19

    move-object/from16 v1, v24

    invoke-virtual {v0, v1}, Ljava/util/Vector;->addElement(Ljava/lang/Object;)V

    .line 175
    invoke-interface {v11}, Landroid/database/Cursor;->moveToNext()Z

    move-result v2

    if-nez v2, :cond_2

    .line 176
    if-eqz v11, :cond_0

    invoke-interface {v11}, Landroid/database/Cursor;->isClosed()Z

    move-result v2

    if-nez v2, :cond_0

    .line 177
    invoke-interface {v11}, Landroid/database/Cursor;->close()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto/16 :goto_0

    .line 180
    .end local v11    # "cursor":Landroid/database/Cursor;
    .end local v13    # "enable":I
    .end local v14    # "endtime":I
    .end local v15    # "fri":I
    .end local v16    # "id":I
    .end local v17    # "index":I
    .end local v19    # "list":Ljava/util/Vector;, "Ljava/util/Vector<Lcom/belkin/rules/dbmigration/Sensor_1_X;>;"
    .end local v20    # "mon":I
    .end local v21    # "name":I
    .end local v22    # "sat":I
    .end local v23    # "sensitivity":I
    .end local v24    # "sensor_1_X":Lcom/belkin/rules/dbmigration/Sensor_1_X;
    .end local v25    # "sensorudn":I
    .end local v26    # "starttime":I
    .end local v27    # "sun":I
    .end local v28    # "thu":I
    .end local v29    # "tue":I
    .end local v30    # "type":I
    .end local v31    # "udn":I
    .end local v32    # "wed":I
    :catch_0
    move-exception v12

    .line 181
    .local v12, "e":Ljava/lang/Exception;
    const/16 v19, 0x0

    goto/16 :goto_0

    .line 184
    .end local v12    # "e":Ljava/lang/Exception;
    .restart local v11    # "cursor":Landroid/database/Cursor;
    .restart local v17    # "index":I
    :cond_3
    const/16 v19, 0x0

    goto/16 :goto_0
.end method

.method public gettheSwitchRuleList(Ljava/lang/String;)Ljava/util/Vector;
    .locals 29
    .param p1, "tableName"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/Vector",
            "<",
            "Lcom/belkin/rules/dbmigration/Switch_1_X;",
            ">;"
        }
    .end annotation

    .prologue
    .line 66
    const/16 v1, 0xd

    new-array v3, v1, [Ljava/lang/String;

    const/4 v1, 0x0

    const-string v2, "id"

    aput-object v2, v3, v1

    const/4 v1, 0x1

    const-string v2, "udn"

    aput-object v2, v3, v1

    const/4 v1, 0x2

    const-string v2, "name"

    aput-object v2, v3, v1

    const/4 v1, 0x3

    const-string v2, "type"

    aput-object v2, v3, v1

    const/4 v1, 0x4

    const-string v2, "enable"

    aput-object v2, v3, v1

    const/4 v1, 0x5

    const-string v2, "sun"

    aput-object v2, v3, v1

    const/4 v1, 0x6

    const-string v2, "mon"

    aput-object v2, v3, v1

    const/4 v1, 0x7

    const-string v2, "tue"

    aput-object v2, v3, v1

    const/16 v1, 0x8

    const-string v2, "wed"

    aput-object v2, v3, v1

    const/16 v1, 0x9

    const-string v2, "thu"

    aput-object v2, v3, v1

    const/16 v1, 0xa

    const-string v2, "fri"

    aput-object v2, v3, v1

    const/16 v1, 0xb

    const-string v2, "sat"

    aput-object v2, v3, v1

    const/16 v1, 0xc

    const-string v2, "deviceact"

    aput-object v2, v3, v1

    .line 69
    .local v3, "fieldName":[Ljava/lang/String;
    :try_start_0
    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/belkin/rules/dbmigration/SQLHandlerWrapper;->myDb:Landroid/database/sqlite/SQLiteDatabase;

    if-nez v1, :cond_1

    .line 70
    const/16 v19, 0x0

    .line 119
    :cond_0
    :goto_0
    return-object v19

    .line 72
    :cond_1
    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/belkin/rules/dbmigration/SQLHandlerWrapper;->myDb:Landroid/database/sqlite/SQLiteDatabase;

    const/4 v4, 0x0

    const/4 v5, 0x0

    const/4 v6, 0x0

    const/4 v7, 0x0

    const/4 v8, 0x0

    const/4 v9, 0x0

    move-object/from16 v2, p1

    invoke-virtual/range {v1 .. v9}, Landroid/database/sqlite/SQLiteDatabase;->query(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v11

    .line 74
    .local v11, "cursor":Landroid/database/Cursor;
    const/16 v17, 0x0

    .line 75
    .local v17, "index":I
    if-eqz v11, :cond_3

    .line 76
    add-int/lit8 v18, v17, 0x1

    .end local v17    # "index":I
    .local v18, "index":I
    aget-object v1, v3, v17

    invoke-interface {v11, v1}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v16

    .line 77
    .local v16, "id":I
    add-int/lit8 v17, v18, 0x1

    .end local v18    # "index":I
    .restart local v17    # "index":I
    aget-object v1, v3, v18

    invoke-interface {v11, v1}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v27

    .line 78
    .local v27, "udn":I
    add-int/lit8 v18, v17, 0x1

    .end local v17    # "index":I
    .restart local v18    # "index":I
    aget-object v1, v3, v17

    invoke-interface {v11, v1}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v21

    .line 79
    .local v21, "name":I
    add-int/lit8 v17, v18, 0x1

    .end local v18    # "index":I
    .restart local v17    # "index":I
    aget-object v1, v3, v18

    invoke-interface {v11, v1}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v26

    .line 80
    .local v26, "type":I
    add-int/lit8 v18, v17, 0x1

    .end local v17    # "index":I
    .restart local v18    # "index":I
    aget-object v1, v3, v17

    invoke-interface {v11, v1}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v14

    .line 81
    .local v14, "enable":I
    add-int/lit8 v17, v18, 0x1

    .end local v18    # "index":I
    .restart local v17    # "index":I
    aget-object v1, v3, v18

    invoke-interface {v11, v1}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v23

    .line 82
    .local v23, "sun":I
    add-int/lit8 v18, v17, 0x1

    .end local v17    # "index":I
    .restart local v18    # "index":I
    aget-object v1, v3, v17

    invoke-interface {v11, v1}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v20

    .line 83
    .local v20, "mon":I
    add-int/lit8 v17, v18, 0x1

    .end local v18    # "index":I
    .restart local v17    # "index":I
    aget-object v1, v3, v18

    invoke-interface {v11, v1}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v25

    .line 84
    .local v25, "tue":I
    add-int/lit8 v18, v17, 0x1

    .end local v17    # "index":I
    .restart local v18    # "index":I
    aget-object v1, v3, v17

    invoke-interface {v11, v1}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v28

    .line 85
    .local v28, "wed":I
    add-int/lit8 v17, v18, 0x1

    .end local v18    # "index":I
    .restart local v17    # "index":I
    aget-object v1, v3, v18

    invoke-interface {v11, v1}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v24

    .line 86
    .local v24, "thu":I
    add-int/lit8 v18, v17, 0x1

    .end local v17    # "index":I
    .restart local v18    # "index":I
    aget-object v1, v3, v17

    invoke-interface {v11, v1}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v15

    .line 87
    .local v15, "fri":I
    add-int/lit8 v17, v18, 0x1

    .end local v18    # "index":I
    .restart local v17    # "index":I
    aget-object v1, v3, v18

    invoke-interface {v11, v1}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v22

    .line 88
    .local v22, "sat":I
    add-int/lit8 v18, v17, 0x1

    .end local v17    # "index":I
    .restart local v18    # "index":I
    aget-object v1, v3, v17

    invoke-interface {v11, v1}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v12

    .line 89
    .local v12, "deviceact":I
    new-instance v19, Ljava/util/Vector;

    invoke-direct/range {v19 .. v19}, Ljava/util/Vector;-><init>()V

    .line 90
    .local v19, "list":Ljava/util/Vector;, "Ljava/util/Vector<Lcom/belkin/rules/dbmigration/Switch_1_X;>;"
    invoke-interface {v11}, Landroid/database/Cursor;->moveToFirst()Z

    .line 93
    :cond_2
    new-instance v10, Lcom/belkin/rules/dbmigration/Switch_1_X;

    invoke-direct {v10}, Lcom/belkin/rules/dbmigration/Switch_1_X;-><init>()V

    .line 94
    .local v10, "brokerValues":Lcom/belkin/rules/dbmigration/Switch_1_X;
    move/from16 v0, v16

    invoke-interface {v11, v0}, Landroid/database/Cursor;->getInt(I)I

    move-result v1

    invoke-virtual {v10, v1}, Lcom/belkin/rules/dbmigration/Switch_1_X;->setId(I)V

    .line 95
    move/from16 v0, v27

    invoke-interface {v11, v0}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v10, v1}, Lcom/belkin/rules/dbmigration/Switch_1_X;->setUdn(Ljava/lang/String;)V

    .line 96
    move/from16 v0, v21

    invoke-interface {v11, v0}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v10, v1}, Lcom/belkin/rules/dbmigration/Switch_1_X;->setName(Ljava/lang/String;)V

    .line 97
    move/from16 v0, v26

    invoke-interface {v11, v0}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v10, v1}, Lcom/belkin/rules/dbmigration/Switch_1_X;->setType(Ljava/lang/String;)V

    .line 98
    invoke-interface {v11, v14}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v10, v1}, Lcom/belkin/rules/dbmigration/Switch_1_X;->setEnable(Ljava/lang/String;)V

    .line 99
    move/from16 v0, v23

    invoke-interface {v11, v0}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v10, v1}, Lcom/belkin/rules/dbmigration/Switch_1_X;->setSun(Ljava/lang/String;)V

    .line 100
    move/from16 v0, v20

    invoke-interface {v11, v0}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v10, v1}, Lcom/belkin/rules/dbmigration/Switch_1_X;->setMon(Ljava/lang/String;)V

    .line 101
    move/from16 v0, v25

    invoke-interface {v11, v0}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v10, v1}, Lcom/belkin/rules/dbmigration/Switch_1_X;->setTue(Ljava/lang/String;)V

    .line 102
    move/from16 v0, v28

    invoke-interface {v11, v0}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v10, v1}, Lcom/belkin/rules/dbmigration/Switch_1_X;->setWed(Ljava/lang/String;)V

    .line 103
    move/from16 v0, v24

    invoke-interface {v11, v0}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v10, v1}, Lcom/belkin/rules/dbmigration/Switch_1_X;->setThu(Ljava/lang/String;)V

    .line 104
    invoke-interface {v11, v15}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v10, v1}, Lcom/belkin/rules/dbmigration/Switch_1_X;->setFri(Ljava/lang/String;)V

    .line 105
    move/from16 v0, v22

    invoke-interface {v11, v0}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v10, v1}, Lcom/belkin/rules/dbmigration/Switch_1_X;->setSat(Ljava/lang/String;)V

    .line 106
    invoke-interface {v11, v12}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v10, v1}, Lcom/belkin/rules/dbmigration/Switch_1_X;->setDeviceact(Ljava/lang/String;)V

    .line 107
    move-object/from16 v0, v19

    invoke-virtual {v0, v10}, Ljava/util/Vector;->addElement(Ljava/lang/Object;)V

    .line 108
    invoke-interface {v11}, Landroid/database/Cursor;->moveToNext()Z

    move-result v1

    if-nez v1, :cond_2

    .line 110
    if-eqz v11, :cond_0

    invoke-interface {v11}, Landroid/database/Cursor;->isClosed()Z

    move-result v1

    if-nez v1, :cond_0

    .line 111
    invoke-interface {v11}, Landroid/database/Cursor;->close()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto/16 :goto_0

    .line 114
    .end local v10    # "brokerValues":Lcom/belkin/rules/dbmigration/Switch_1_X;
    .end local v11    # "cursor":Landroid/database/Cursor;
    .end local v12    # "deviceact":I
    .end local v14    # "enable":I
    .end local v15    # "fri":I
    .end local v16    # "id":I
    .end local v18    # "index":I
    .end local v19    # "list":Ljava/util/Vector;, "Ljava/util/Vector<Lcom/belkin/rules/dbmigration/Switch_1_X;>;"
    .end local v20    # "mon":I
    .end local v21    # "name":I
    .end local v22    # "sat":I
    .end local v23    # "sun":I
    .end local v24    # "thu":I
    .end local v25    # "tue":I
    .end local v26    # "type":I
    .end local v27    # "udn":I
    .end local v28    # "wed":I
    :catch_0
    move-exception v13

    .line 115
    .local v13, "e":Ljava/lang/Exception;
    invoke-virtual {v13}, Ljava/lang/Exception;->printStackTrace()V

    .line 116
    const/16 v19, 0x0

    goto/16 :goto_0

    .line 119
    .end local v13    # "e":Ljava/lang/Exception;
    .restart local v11    # "cursor":Landroid/database/Cursor;
    .restart local v17    # "index":I
    :cond_3
    const/16 v19, 0x0

    goto/16 :goto_0
.end method
