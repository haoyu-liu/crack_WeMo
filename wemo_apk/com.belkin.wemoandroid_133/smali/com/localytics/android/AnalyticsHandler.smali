.class Lcom/localytics/android/AnalyticsHandler;
.super Lcom/localytics/android/BaseHandler;
.source "AnalyticsHandler.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/localytics/android/AnalyticsHandler$AnalyticsListenersSet;
    }
.end annotation


# static fields
.field private static final MESSAGE_CLOSE:I = 0x66

.field private static final MESSAGE_DISABLE_PUSH:I = 0x70

.field private static final MESSAGE_HANDLE_PUSH_REGISTRATION:I = 0x6e

.field private static final MESSAGE_OPEN:I = 0x65

.field private static final MESSAGE_OPT_OUT:I = 0x6c

.field private static final MESSAGE_REGISTER_PUSH:I = 0x6d

.field private static final MESSAGE_SET_CUSTOM_DIMENSION:I = 0x6b

.field private static final MESSAGE_SET_IDENTIFIER:I = 0x69

.field private static final MESSAGE_SET_LOCATION:I = 0x6a

.field private static final MESSAGE_SET_PUSH_REGID:I = 0x71

.field private static final MESSAGE_SET_REFERRERID:I = 0x72

.field private static final MESSAGE_TAG_EVENT:I = 0x67

.field private static final MESSAGE_TAG_SCREEN:I = 0x68

.field private static final PARAM_LOCALYTICS_REFERRER_TEST_MODE:Ljava/lang/String; = "localytics_test_mode"

.field private static final PROJECTION_SET_CUSTOM_DIMENSION:[Ljava/lang/String;

.field private static final PROJECTION_SET_IDENTIFIER:[Ljava/lang/String;

.field private static final SELECTION_SET_CUSTOM_DIMENSION:Ljava/lang/String;

.field private static final SELECTION_SET_IDENTIFIER:Ljava/lang/String;

.field private static sLastLocation:Landroid/location/Location;


# instance fields
.field private mAppWasUpgraded:Z

.field mFirstSessionEver:Z

.field mReferrerTestModeEnabled:Z

.field mSentReferrerTestMode:Z

.field private final screenFlow:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 5

    .prologue
    const/4 v4, 0x1

    const/4 v3, 0x0

    .line 132
    new-array v0, v4, [Ljava/lang/String;

    const-string v1, "custom_dimension_value"

    aput-object v1, v0, v3

    sput-object v0, Lcom/localytics/android/AnalyticsHandler;->PROJECTION_SET_CUSTOM_DIMENSION:[Ljava/lang/String;

    .line 137
    const-string v0, "%s = ?"

    new-array v1, v4, [Ljava/lang/Object;

    const-string v2, "custom_dimension_key"

    aput-object v2, v1, v3

    invoke-static {v0, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/localytics/android/AnalyticsHandler;->SELECTION_SET_CUSTOM_DIMENSION:Ljava/lang/String;

    .line 142
    const/4 v0, 0x2

    new-array v0, v0, [Ljava/lang/String;

    const-string v1, "key"

    aput-object v1, v0, v3

    const-string v1, "value"

    aput-object v1, v0, v4

    sput-object v0, Lcom/localytics/android/AnalyticsHandler;->PROJECTION_SET_IDENTIFIER:[Ljava/lang/String;

    .line 147
    const-string v0, "%s = ?"

    new-array v1, v4, [Ljava/lang/Object;

    const-string v2, "key"

    aput-object v2, v1, v3

    invoke-static {v0, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/localytics/android/AnalyticsHandler;->SELECTION_SET_IDENTIFIER:Ljava/lang/String;

    .line 153
    const/4 v0, 0x0

    sput-object v0, Lcom/localytics/android/AnalyticsHandler;->sLastLocation:Landroid/location/Location;

    return-void
.end method

.method constructor <init>(Lcom/localytics/android/LocalyticsDao;Landroid/os/Looper;)V
    .locals 2
    .param p1, "localyticsDao"    # Lcom/localytics/android/LocalyticsDao;
    .param p2, "looper"    # Landroid/os/Looper;

    .prologue
    const/4 v1, 0x0

    .line 180
    invoke-direct {p0, p1, p2}, Lcom/localytics/android/BaseHandler;-><init>(Lcom/localytics/android/LocalyticsDao;Landroid/os/Looper;)V

    .line 155
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/localytics/android/AnalyticsHandler;->screenFlow:Ljava/util/List;

    .line 156
    iput-boolean v1, p0, Lcom/localytics/android/AnalyticsHandler;->mAppWasUpgraded:Z

    .line 157
    iput-boolean v1, p0, Lcom/localytics/android/AnalyticsHandler;->mFirstSessionEver:Z

    .line 158
    iput-boolean v1, p0, Lcom/localytics/android/AnalyticsHandler;->mReferrerTestModeEnabled:Z

    .line 159
    iput-boolean v1, p0, Lcom/localytics/android/AnalyticsHandler;->mSentReferrerTestMode:Z

    .line 181
    const-string v0, "Analytics"

    iput-object v0, p0, Lcom/localytics/android/AnalyticsHandler;->siloName:Ljava/lang/String;

    .line 182
    new-instance v0, Lcom/localytics/android/AnalyticsHandler$AnalyticsListenersSet;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Lcom/localytics/android/AnalyticsHandler$AnalyticsListenersSet;-><init>(Lcom/localytics/android/AnalyticsHandler;Lcom/localytics/android/AnalyticsHandler$1;)V

    iput-object v0, p0, Lcom/localytics/android/AnalyticsHandler;->listeners:Lcom/localytics/android/BaseHandler$ListenersSet;

    .line 183
    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lcom/localytics/android/AnalyticsHandler;->obtainMessage(I)Landroid/os/Message;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/localytics/android/AnalyticsHandler;->queueMessage(Landroid/os/Message;)Z

    .line 184
    return-void
.end method

.method private _addLocationIDsAndCustomDimensions(Lorg/json/JSONObject;Lorg/json/JSONObject;Ljava/lang/String;Ljava/lang/String;)V
    .locals 16
    .param p1, "eventBlob"    # Lorg/json/JSONObject;
    .param p2, "identifiers"    # Lorg/json/JSONObject;
    .param p3, "customerID"    # Ljava/lang/String;
    .param p4, "userType"    # Ljava/lang/String;

    .prologue
    .line 1135
    :try_start_0
    sget-object v2, Lcom/localytics/android/AnalyticsHandler;->sLastLocation:Landroid/location/Location;

    if-eqz v2, :cond_0

    .line 1137
    sget-object v2, Lcom/localytics/android/AnalyticsHandler;->sLastLocation:Landroid/location/Location;

    invoke-virtual {v2}, Landroid/location/Location;->getLatitude()D

    move-result-wide v10

    .line 1138
    .local v10, "lat":D
    sget-object v2, Lcom/localytics/android/AnalyticsHandler;->sLastLocation:Landroid/location/Location;

    invoke-virtual {v2}, Landroid/location/Location;->getLongitude()D

    move-result-wide v12

    .line 1139
    .local v12, "lng":D
    const-wide/16 v2, 0x0

    cmpl-double v2, v10, v2

    if-eqz v2, :cond_0

    const-wide/16 v2, 0x0

    cmpl-double v2, v12, v2

    if-eqz v2, :cond_0

    .line 1141
    const-string v2, "lat"

    move-object/from16 v0, p1

    invoke-virtual {v0, v2, v10, v11}, Lorg/json/JSONObject;->put(Ljava/lang/String;D)Lorg/json/JSONObject;

    .line 1142
    const-string v2, "lng"

    move-object/from16 v0, p1

    invoke-virtual {v0, v2, v12, v13}, Lorg/json/JSONObject;->put(Ljava/lang/String;D)Lorg/json/JSONObject;

    .line 1146
    .end local v10    # "lat":D
    .end local v12    # "lng":D
    :cond_0
    const-string v2, "cid"

    move-object/from16 v0, p1

    move-object/from16 v1, p3

    invoke-virtual {v0, v2, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 1147
    const-string v2, "utp"

    move-object/from16 v0, p1

    move-object/from16 v1, p4

    invoke-virtual {v0, v2, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 1149
    invoke-virtual/range {p2 .. p2}, Lorg/json/JSONObject;->length()I

    move-result v2

    if-lez v2, :cond_1

    .line 1151
    const-string v2, "ids"

    move-object/from16 v0, p1

    move-object/from16 v1, p2

    invoke-virtual {v0, v2, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 1157
    :cond_1
    const/4 v8, 0x0

    .line 1160
    .local v8, "cursor":Landroid/database/Cursor;
    :try_start_1
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/localytics/android/AnalyticsHandler;->mProvider:Lcom/localytics/android/BaseProvider;

    const-string v3, "custom_dimensions"

    const/4 v4, 0x0

    const/4 v5, 0x0

    const/4 v6, 0x0

    const/4 v7, 0x0

    invoke-virtual/range {v2 .. v7}, Lcom/localytics/android/BaseProvider;->query(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v8

    .line 1162
    :goto_0
    invoke-interface {v8}, Landroid/database/Cursor;->moveToNext()Z

    move-result v2

    if-eqz v2, :cond_4

    .line 1164
    const-string v2, "custom_dimension_key"

    invoke-interface {v8, v2}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v2

    invoke-interface {v8, v2}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v9

    .line 1165
    .local v9, "key":Ljava/lang/String;
    const-string v2, "custom_dimension_value"

    invoke-interface {v8, v2}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v2

    invoke-interface {v8, v2}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v15

    .line 1166
    .local v15, "value":Ljava/lang/String;
    const-string v2, "custom_dimension_"

    const-string v3, "c"

    invoke-virtual {v9, v2, v3}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v14

    .line 1167
    .local v14, "newKey":Ljava/lang/String;
    move-object/from16 v0, p1

    invoke-virtual {v0, v14, v15}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    .line 1172
    .end local v9    # "key":Ljava/lang/String;
    .end local v14    # "newKey":Ljava/lang/String;
    .end local v15    # "value":Ljava/lang/String;
    :catchall_0
    move-exception v2

    if-eqz v8, :cond_2

    .line 1174
    :try_start_2
    invoke-interface {v8}, Landroid/database/Cursor;->close()V

    .line 1175
    const/4 v8, 0x0

    :cond_2
    throw v2

    .line 1179
    .end local v8    # "cursor":Landroid/database/Cursor;
    :catch_0
    move-exception v2

    .line 1182
    :cond_3
    :goto_1
    return-void

    .line 1172
    .restart local v8    # "cursor":Landroid/database/Cursor;
    :cond_4
    if-eqz v8, :cond_3

    .line 1174
    invoke-interface {v8}, Landroid/database/Cursor;->close()V
    :try_end_2
    .catch Lorg/json/JSONException; {:try_start_2 .. :try_end_2} :catch_0

    .line 1175
    const/4 v8, 0x0

    goto :goto_1
.end method

.method private _close()V
    .locals 1

    .prologue
    .line 1374
    invoke-direct {p0}, Lcom/localytics/android/AnalyticsHandler;->_isSessionOpen()Z

    move-result v0

    if-nez v0, :cond_0

    .line 1376
    const-string v0, "Session was not open, so close is not possible."

    invoke-static {v0}, Lcom/localytics/android/Localytics$Log;->w(Ljava/lang/String;)I

    .line 1383
    :goto_0
    return-void

    .line 1380
    :cond_0
    iget-object v0, p0, Lcom/localytics/android/AnalyticsHandler;->listeners:Lcom/localytics/android/BaseHandler$ListenersSet;

    check-cast v0, Lcom/localytics/android/AnalyticsListener;

    invoke-interface {v0}, Lcom/localytics/android/AnalyticsListener;->localyticsSessionWillClose()V

    .line 1382
    const-string v0, "close"

    invoke-direct {p0, v0}, Lcom/localytics/android/AnalyticsHandler;->_tagEvent(Ljava/lang/String;)V

    goto :goto_0
.end method

.method private _dequeQueuedCloseSessionTag(Z)V
    .locals 12
    .param p1, "saveAsEvent"    # Z

    .prologue
    const/4 v11, 0x0

    const/4 v10, 0x0

    .line 1282
    new-instance v9, Landroid/content/ContentValues;

    invoke-direct {v9}, Landroid/content/ContentValues;-><init>()V

    .line 1284
    .local v9, "values":Landroid/content/ContentValues;
    if-eqz p1, :cond_1

    .line 1286
    const/4 v6, 0x0

    .line 1289
    .local v6, "cursor":Landroid/database/Cursor;
    :try_start_0
    iget-object v0, p0, Lcom/localytics/android/AnalyticsHandler;->mProvider:Lcom/localytics/android/BaseProvider;

    const-string v1, "info"

    const/4 v2, 0x2

    new-array v2, v2, [Ljava/lang/String;

    const/4 v3, 0x0

    const-string v4, "queued_close_session_blob"

    aput-object v4, v2, v3

    const/4 v3, 0x1

    const-string v4, "queued_close_session_blob_upload_format"

    aput-object v4, v2, v3

    const/4 v3, 0x0

    const/4 v4, 0x0

    const/4 v5, 0x0

    invoke-virtual/range {v0 .. v5}, Lcom/localytics/android/BaseProvider;->query(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v6

    .line 1290
    invoke-interface {v6}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 1292
    const-string v0, "queued_close_session_blob"

    invoke-interface {v6, v0}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v0

    invoke-interface {v6, v0}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v7

    .line 1293
    .local v7, "queuedCloseSessionTag":Ljava/lang/String;
    const-string v0, "queued_close_session_blob_upload_format"

    invoke-interface {v6, v0}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v0

    invoke-interface {v6, v0}, Landroid/database/Cursor;->getInt(I)I

    move-result v8

    .line 1295
    .local v8, "queuedCloseSessionTagUploadFormat":I
    invoke-static {v7}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 1297
    iget-object v0, p0, Lcom/localytics/android/AnalyticsHandler;->screenFlow:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->clear()V

    .line 1298
    const-string v0, "blob"

    invoke-virtual {v9, v0, v7}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 1299
    const-string v0, "upload_format"

    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v9, v0, v1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 1300
    iget-object v0, p0, Lcom/localytics/android/AnalyticsHandler;->mProvider:Lcom/localytics/android/BaseProvider;

    const-string v1, "events"

    invoke-virtual {v0, v1, v9}, Lcom/localytics/android/BaseProvider;->insert(Ljava/lang/String;Landroid/content/ContentValues;)J

    .line 1301
    invoke-virtual {v9}, Landroid/content/ContentValues;->clear()V

    .line 1302
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/localytics/android/AnalyticsHandler;->mAppWasUpgraded:Z

    .line 1303
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/localytics/android/AnalyticsHandler;->mFirstSessionEver:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 1309
    .end local v7    # "queuedCloseSessionTag":Ljava/lang/String;
    .end local v8    # "queuedCloseSessionTagUploadFormat":I
    :cond_0
    if-eqz v6, :cond_1

    .line 1311
    invoke-interface {v6}, Landroid/database/Cursor;->close()V

    .line 1312
    const/4 v6, 0x0

    .line 1317
    .end local v6    # "cursor":Landroid/database/Cursor;
    :cond_1
    const-string v0, "queued_close_session_blob"

    invoke-virtual {v9, v0}, Landroid/content/ContentValues;->putNull(Ljava/lang/String;)V

    .line 1318
    const-string v0, "queued_close_session_blob_upload_format"

    invoke-virtual {v9, v0}, Landroid/content/ContentValues;->putNull(Ljava/lang/String;)V

    .line 1319
    const-string v0, "last_session_close_time"

    invoke-static {v11}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v9, v0, v1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 1320
    iget-object v0, p0, Lcom/localytics/android/AnalyticsHandler;->mProvider:Lcom/localytics/android/BaseProvider;

    const-string v1, "info"

    invoke-virtual {v0, v1, v9, v10, v10}, Lcom/localytics/android/BaseProvider;->update(Ljava/lang/String;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I

    .line 1321
    return-void

    .line 1309
    .restart local v6    # "cursor":Landroid/database/Cursor;
    :catchall_0
    move-exception v0

    if-eqz v6, :cond_2

    .line 1311
    invoke-interface {v6}, Landroid/database/Cursor;->close()V

    .line 1312
    const/4 v6, 0x0

    :cond_2
    throw v0
.end method

.method private _getCustomDimension(I)Ljava/lang/String;
    .locals 9
    .param p1, "dimension"    # I

    .prologue
    const/4 v8, 0x0

    .line 737
    if-ltz p1, :cond_0

    const/16 v0, 0xa

    if-le p1, v0, :cond_1

    .line 763
    :cond_0
    :goto_0
    return-object v8

    .line 742
    :cond_1
    const/4 v8, 0x0

    .line 743
    .local v8, "value":Ljava/lang/String;
    invoke-direct {p0, p1}, Lcom/localytics/android/AnalyticsHandler;->getCustomDimensionAttributeKey(I)Ljava/lang/String;

    move-result-object v7

    .line 744
    .local v7, "key":Ljava/lang/String;
    const/4 v6, 0x0

    .line 747
    .local v6, "cursor":Landroid/database/Cursor;
    :try_start_0
    iget-object v0, p0, Lcom/localytics/android/AnalyticsHandler;->mProvider:Lcom/localytics/android/BaseProvider;

    const-string v1, "custom_dimensions"

    sget-object v2, Lcom/localytics/android/AnalyticsHandler;->PROJECTION_SET_CUSTOM_DIMENSION:[Ljava/lang/String;

    sget-object v3, Lcom/localytics/android/AnalyticsHandler;->SELECTION_SET_CUSTOM_DIMENSION:Ljava/lang/String;

    const/4 v4, 0x1

    new-array v4, v4, [Ljava/lang/String;

    const/4 v5, 0x0

    aput-object v7, v4, v5

    const/4 v5, 0x0

    invoke-virtual/range {v0 .. v5}, Lcom/localytics/android/BaseProvider;->query(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v6

    .line 749
    invoke-interface {v6}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v0

    if-eqz v0, :cond_2

    .line 751
    const-string v0, "custom_dimension_value"

    invoke-interface {v6, v0}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v0

    invoke-interface {v6, v0}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result-object v8

    .line 756
    :cond_2
    if-eqz v6, :cond_0

    .line 758
    invoke-interface {v6}, Landroid/database/Cursor;->close()V

    .line 759
    const/4 v6, 0x0

    goto :goto_0

    .line 756
    :catchall_0
    move-exception v0

    if-eqz v6, :cond_3

    .line 758
    invoke-interface {v6}, Landroid/database/Cursor;->close()V

    .line 759
    const/4 v6, 0x0

    :cond_3
    throw v0
.end method

.method private _getIdentifiers()Lorg/json/JSONObject;
    .locals 8

    .prologue
    .line 1485
    const/4 v6, 0x0

    .line 1486
    .local v6, "cursor":Landroid/database/Cursor;
    new-instance v7, Lorg/json/JSONObject;

    invoke-direct {v7}, Lorg/json/JSONObject;-><init>()V

    .line 1489
    .local v7, "result":Lorg/json/JSONObject;
    :try_start_0
    iget-object v0, p0, Lcom/localytics/android/AnalyticsHandler;->mProvider:Lcom/localytics/android/BaseProvider;

    const-string v1, "identifiers"

    const/4 v2, 0x0

    const/4 v3, 0x0

    const/4 v4, 0x0

    const/4 v5, 0x0

    invoke-virtual/range {v0 .. v5}, Lcom/localytics/android/BaseProvider;->query(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v6

    .line 1491
    :goto_0
    invoke-interface {v6}, Landroid/database/Cursor;->moveToNext()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 1493
    const-string v0, "key"

    invoke-interface {v6, v0}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v0

    invoke-interface {v6, v0}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v0

    const-string v1, "value"

    invoke-interface {v6, v1}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v1

    invoke-interface {v6, v1}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v7, v0, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_0

    .line 1496
    :catch_0
    move-exception v0

    .line 1501
    if-eqz v6, :cond_0

    .line 1503
    invoke-interface {v6}, Landroid/database/Cursor;->close()V

    .line 1504
    const/4 v6, 0x0

    .line 1507
    :cond_0
    :goto_1
    return-object v7

    .line 1501
    :cond_1
    if-eqz v6, :cond_0

    .line 1503
    invoke-interface {v6}, Landroid/database/Cursor;->close()V

    .line 1504
    const/4 v6, 0x0

    goto :goto_1

    .line 1501
    :catchall_0
    move-exception v0

    if-eqz v6, :cond_0

    .line 1503
    invoke-interface {v6}, Landroid/database/Cursor;->close()V

    .line 1504
    const/4 v6, 0x0

    goto :goto_1
.end method

.method private _handlePushRegistration(Landroid/content/Intent;)V
    .locals 4
    .param p1, "intent"    # Landroid/content/Intent;

    .prologue
    const/4 v2, 0x0

    .line 526
    const-string v1, "registration_id"

    invoke-virtual {p1, v1}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 529
    .local v0, "registrationId":Ljava/lang/String;
    invoke-direct {p0}, Lcom/localytics/android/AnalyticsHandler;->_isPushDisabled()Z

    move-result v1

    if-eqz v1, :cond_1

    .line 531
    const-string v1, "GCM registered but push disabled: removing id"

    invoke-static {v1}, Lcom/localytics/android/Localytics$Log;->v(Ljava/lang/String;)I

    .line 533
    invoke-direct {p0, v2}, Lcom/localytics/android/AnalyticsHandler;->_setPushID(Ljava/lang/String;)V

    .line 554
    :cond_0
    :goto_0
    return-void

    .line 536
    :cond_1
    const-string v1, "error"

    invoke-virtual {p1, v1}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    if-eqz v1, :cond_2

    .line 538
    const-string v1, "GCM registration failed"

    invoke-static {v1}, Lcom/localytics/android/Localytics$Log;->v(Ljava/lang/String;)I

    goto :goto_0

    .line 541
    :cond_2
    const-string v1, "unregistered"

    invoke-virtual {p1, v1}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    if-eqz v1, :cond_3

    .line 543
    const-string v1, "GCM unregistered: removing id"

    invoke-static {v1}, Lcom/localytics/android/Localytics$Log;->v(Ljava/lang/String;)I

    .line 545
    invoke-direct {p0, v2}, Lcom/localytics/android/AnalyticsHandler;->_setPushID(Ljava/lang/String;)V

    goto :goto_0

    .line 548
    :cond_3
    if-eqz v0, :cond_0

    .line 550
    const-string v1, "GCM registered, new id: %s"

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    aput-object v0, v2, v3

    invoke-static {v1, v2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lcom/localytics/android/Localytics$Log;->v(Ljava/lang/String;)I

    .line 552
    invoke-direct {p0, v0}, Lcom/localytics/android/AnalyticsHandler;->_setPushID(Ljava/lang/String;)V

    goto :goto_0
.end method

.method private _isOptedOut()Z
    .locals 9

    .prologue
    const/4 v7, 0x1

    const/4 v8, 0x0

    .line 1599
    const/4 v6, 0x0

    .line 1602
    .local v6, "cursor":Landroid/database/Cursor;
    :try_start_0
    iget-object v0, p0, Lcom/localytics/android/AnalyticsHandler;->mProvider:Lcom/localytics/android/BaseProvider;

    const-string v1, "info"

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/String;

    const/4 v3, 0x0

    const-string v4, "opt_out"

    aput-object v4, v2, v3

    const/4 v3, 0x0

    const/4 v4, 0x0

    const/4 v5, 0x0

    invoke-virtual/range {v0 .. v5}, Lcom/localytics/android/BaseProvider;->query(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v6

    .line 1604
    invoke-interface {v6}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v0

    if-eqz v0, :cond_2

    .line 1606
    const-string v0, "opt_out"

    invoke-interface {v6, v0}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v0

    invoke-interface {v6, v0}, Landroid/database/Cursor;->getInt(I)I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result v0

    if-eqz v0, :cond_1

    move v0, v7

    .line 1611
    :goto_0
    if-eqz v6, :cond_0

    .line 1613
    invoke-interface {v6}, Landroid/database/Cursor;->close()V

    .line 1614
    const/4 v6, 0x0

    .line 1618
    :cond_0
    :goto_1
    return v0

    :cond_1
    move v0, v8

    .line 1606
    goto :goto_0

    .line 1611
    :cond_2
    if-eqz v6, :cond_3

    .line 1613
    invoke-interface {v6}, Landroid/database/Cursor;->close()V

    .line 1614
    const/4 v6, 0x0

    :cond_3
    move v0, v8

    .line 1618
    goto :goto_1

    .line 1611
    :catchall_0
    move-exception v0

    if-eqz v6, :cond_4

    .line 1613
    invoke-interface {v6}, Landroid/database/Cursor;->close()V

    .line 1614
    const/4 v6, 0x0

    :cond_4
    throw v0
.end method

.method private _isPushDisabled()Z
    .locals 12

    .prologue
    const/4 v11, 0x0

    const/4 v10, 0x1

    .line 680
    const/4 v7, 0x0

    .line 681
    .local v7, "disabled":Z
    const/4 v6, 0x0

    .line 684
    .local v6, "cursor":Landroid/database/Cursor;
    :try_start_0
    iget-object v0, p0, Lcom/localytics/android/AnalyticsHandler;->mProvider:Lcom/localytics/android/BaseProvider;

    const-string v1, "info"

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/String;

    const/4 v3, 0x0

    const-string v4, "push_disabled"

    aput-object v4, v2, v3

    const/4 v3, 0x0

    const/4 v4, 0x0

    const/4 v5, 0x0

    invoke-virtual/range {v0 .. v5}, Lcom/localytics/android/BaseProvider;->query(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v6

    .line 685
    :goto_0
    invoke-interface {v6}, Landroid/database/Cursor;->moveToNext()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 687
    const-string v0, "push_disabled"

    invoke-interface {v6, v0}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v0

    invoke-interface {v6, v0}, Landroid/database/Cursor;->getInt(I)I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result v9

    .line 688
    .local v9, "disabledBit":I
    if-ne v9, v10, :cond_0

    move v7, v10

    .line 689
    :goto_1
    goto :goto_0

    :cond_0
    move v7, v11

    .line 688
    goto :goto_1

    .line 693
    .end local v9    # "disabledBit":I
    :cond_1
    if-eqz v6, :cond_2

    .line 695
    invoke-interface {v6}, Landroid/database/Cursor;->close()V

    .line 696
    const/4 v6, 0x0

    :cond_2
    move v8, v7

    .line 698
    .end local v7    # "disabled":Z
    .local v8, "disabled":I
    :goto_2
    return v8

    .line 693
    .end local v8    # "disabled":I
    .restart local v7    # "disabled":Z
    :catchall_0
    move-exception v0

    if-eqz v6, :cond_3

    .line 695
    invoke-interface {v6}, Landroid/database/Cursor;->close()V

    .line 696
    const/4 v6, 0x0

    :cond_3
    move v8, v7

    .line 698
    .restart local v8    # "disabled":I
    goto :goto_2
.end method

.method private _isSessionOpen()Z
    .locals 13

    .prologue
    const/4 v7, 0x1

    const/4 v12, 0x0

    .line 1451
    const-wide/16 v10, 0x0

    .line 1452
    .local v10, "lastSessionOpenTime":J
    const-wide/16 v8, 0x0

    .line 1453
    .local v8, "lastSessionCloseTime":J
    const/4 v6, 0x0

    .line 1456
    .local v6, "cursor":Landroid/database/Cursor;
    :try_start_0
    iget-object v0, p0, Lcom/localytics/android/AnalyticsHandler;->mProvider:Lcom/localytics/android/BaseProvider;

    const-string v1, "info"

    const/4 v2, 0x2

    new-array v2, v2, [Ljava/lang/String;

    const/4 v3, 0x0

    const-string v4, "last_session_open_time"

    aput-object v4, v2, v3

    const/4 v3, 0x1

    const-string v4, "last_session_close_time"

    aput-object v4, v2, v3

    const/4 v3, 0x0

    const/4 v4, 0x0

    const/4 v5, 0x0

    invoke-virtual/range {v0 .. v5}, Lcom/localytics/android/BaseProvider;->query(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v6

    .line 1457
    invoke-interface {v6}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 1459
    const-string v0, "last_session_open_time"

    invoke-interface {v6, v0}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v0

    invoke-interface {v6, v0}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v10

    .line 1460
    const-string v0, "last_session_close_time"

    invoke-interface {v6, v0}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v0

    invoke-interface {v6, v0}, Landroid/database/Cursor;->getLong(I)J
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result-wide v8

    .line 1465
    :cond_0
    if-eqz v6, :cond_1

    .line 1467
    invoke-interface {v6}, Landroid/database/Cursor;->close()V

    .line 1468
    const/4 v6, 0x0

    .line 1475
    :cond_1
    const-wide/16 v0, 0x0

    cmp-long v0, v10, v0

    if-eqz v0, :cond_3

    cmp-long v0, v10, v8

    if-ltz v0, :cond_3

    move v0, v7

    :goto_0
    return v0

    .line 1465
    :catchall_0
    move-exception v0

    if-eqz v6, :cond_2

    .line 1467
    invoke-interface {v6}, Landroid/database/Cursor;->close()V

    .line 1468
    const/4 v6, 0x0

    :cond_2
    throw v0

    :cond_3
    move v0, v12

    .line 1475
    goto :goto_0
.end method

.method private _open()V
    .locals 11

    .prologue
    const/4 v10, 0x0

    .line 1223
    invoke-direct {p0}, Lcom/localytics/android/AnalyticsHandler;->_isSessionOpen()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 1225
    const-string v0, "Session was already open"

    invoke-static {v0}, Lcom/localytics/android/Localytics$Log;->w(Ljava/lang/String;)I

    .line 1278
    :cond_0
    :goto_0
    return-void

    .line 1231
    :cond_1
    const/4 v7, 0x0

    .line 1234
    .local v7, "cursor":Landroid/database/Cursor;
    :try_start_0
    iget-object v0, p0, Lcom/localytics/android/AnalyticsHandler;->mProvider:Lcom/localytics/android/BaseProvider;

    const-string v1, "info"

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/String;

    const/4 v3, 0x0

    const-string v4, "last_session_close_time"

    aput-object v4, v2, v3

    const/4 v3, 0x0

    const/4 v4, 0x0

    const/4 v5, 0x0

    invoke-virtual/range {v0 .. v5}, Lcom/localytics/android/BaseProvider;->query(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v7

    .line 1235
    invoke-interface {v7}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v0

    if-eqz v0, :cond_2

    .line 1237
    const-string v0, "last_session_close_time"

    invoke-interface {v7, v0}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v0

    invoke-interface {v7, v0}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v8

    .line 1239
    .local v8, "sessionCloseTime":J
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    sget-wide v2, Lcom/localytics/android/Constants;->SESSION_EXPIRATION:J

    add-long/2addr v2, v8

    cmp-long v0, v0, v2

    if-gez v0, :cond_3

    .line 1241
    iget-object v0, p0, Lcom/localytics/android/AnalyticsHandler;->listeners:Lcom/localytics/android/BaseHandler$ListenersSet;

    check-cast v0, Lcom/localytics/android/AnalyticsListener;

    const/4 v1, 0x0

    iget-boolean v2, p0, Lcom/localytics/android/AnalyticsHandler;->mAppWasUpgraded:Z

    const/4 v3, 0x1

    invoke-interface {v0, v1, v2, v3}, Lcom/localytics/android/AnalyticsListener;->localyticsSessionWillOpen(ZZZ)V

    .line 1244
    const-string v0, "Opening old closed session and reconnecting"

    invoke-static {v0}, Lcom/localytics/android/Localytics$Log;->v(Ljava/lang/String;)I

    .line 1246
    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lcom/localytics/android/AnalyticsHandler;->_dequeQueuedCloseSessionTag(Z)V

    .line 1248
    iget-object v0, p0, Lcom/localytics/android/AnalyticsHandler;->listeners:Lcom/localytics/android/BaseHandler$ListenersSet;

    check-cast v0, Lcom/localytics/android/AnalyticsListener;

    const/4 v1, 0x0

    iget-boolean v2, p0, Lcom/localytics/android/AnalyticsHandler;->mAppWasUpgraded:Z

    const/4 v3, 0x1

    invoke-interface {v0, v1, v2, v3}, Lcom/localytics/android/AnalyticsListener;->localyticsSessionDidOpen(ZZZ)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 1272
    .end local v8    # "sessionCloseTime":J
    :cond_2
    :goto_1
    if-eqz v7, :cond_0

    .line 1274
    invoke-interface {v7}, Landroid/database/Cursor;->close()V

    .line 1275
    const/4 v7, 0x0

    goto :goto_0

    .line 1252
    .restart local v8    # "sessionCloseTime":J
    :cond_3
    :try_start_1
    iget-object v0, p0, Lcom/localytics/android/AnalyticsHandler;->listeners:Lcom/localytics/android/BaseHandler$ListenersSet;

    check-cast v0, Lcom/localytics/android/AnalyticsListener;

    iget-boolean v1, p0, Lcom/localytics/android/AnalyticsHandler;->mFirstSessionEver:Z

    iget-boolean v2, p0, Lcom/localytics/android/AnalyticsHandler;->mAppWasUpgraded:Z

    const/4 v3, 0x0

    invoke-interface {v0, v1, v2, v3}, Lcom/localytics/android/AnalyticsListener;->localyticsSessionWillOpen(ZZZ)V

    .line 1255
    const-string v0, "Opening new session"

    invoke-static {v0}, Lcom/localytics/android/Localytics$Log;->v(Ljava/lang/String;)I

    .line 1257
    const/4 v0, 0x1

    invoke-direct {p0, v0}, Lcom/localytics/android/AnalyticsHandler;->_dequeQueuedCloseSessionTag(Z)V

    .line 1258
    iget-object v0, p0, Lcom/localytics/android/AnalyticsHandler;->mLocalyticsDao:Lcom/localytics/android/LocalyticsDao;

    invoke-interface {v0}, Lcom/localytics/android/LocalyticsDao;->getAppContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Lcom/localytics/android/DatapointHelper;->getAdvertisingInfo(Landroid/content/Context;)Lcom/localytics/android/DatapointHelper$AdvertisingInfo;

    move-result-object v6

    .line 1259
    .local v6, "advertisingInfo":Lcom/localytics/android/DatapointHelper$AdvertisingInfo;
    if-nez v6, :cond_5

    move-object v0, v10

    :goto_2
    invoke-direct {p0, v0}, Lcom/localytics/android/AnalyticsHandler;->_setFirstAdvertisingId(Ljava/lang/String;)V

    .line 1260
    const-string v0, "open"

    invoke-direct {p0, v0}, Lcom/localytics/android/AnalyticsHandler;->_tagEvent(Ljava/lang/String;)V

    .line 1265
    iget-object v0, p0, Lcom/localytics/android/AnalyticsHandler;->mLocalyticsDao:Lcom/localytics/android/LocalyticsDao;

    invoke-interface {v0}, Lcom/localytics/android/LocalyticsDao;->getAppContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Lcom/localytics/android/BaseProvider;->deleteOldFiles(Landroid/content/Context;)V

    .line 1266
    iget-object v0, p0, Lcom/localytics/android/AnalyticsHandler;->listeners:Lcom/localytics/android/BaseHandler$ListenersSet;

    check-cast v0, Lcom/localytics/android/AnalyticsListener;

    iget-boolean v1, p0, Lcom/localytics/android/AnalyticsHandler;->mFirstSessionEver:Z

    iget-boolean v2, p0, Lcom/localytics/android/AnalyticsHandler;->mAppWasUpgraded:Z

    const/4 v3, 0x0

    invoke-interface {v0, v1, v2, v3}, Lcom/localytics/android/AnalyticsListener;->localyticsSessionDidOpen(ZZZ)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_1

    .line 1272
    .end local v6    # "advertisingInfo":Lcom/localytics/android/DatapointHelper$AdvertisingInfo;
    .end local v8    # "sessionCloseTime":J
    :catchall_0
    move-exception v0

    if-eqz v7, :cond_4

    .line 1274
    invoke-interface {v7}, Landroid/database/Cursor;->close()V

    .line 1275
    const/4 v7, 0x0

    :cond_4
    throw v0

    .line 1259
    .restart local v6    # "advertisingInfo":Lcom/localytics/android/DatapointHelper$AdvertisingInfo;
    .restart local v8    # "sessionCloseTime":J
    :cond_5
    :try_start_2
    iget-object v0, v6, Lcom/localytics/android/DatapointHelper$AdvertisingInfo;->id:Ljava/lang/String;
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    goto :goto_2
.end method

.method private _registerPush(Ljava/lang/String;)V
    .locals 12
    .param p1, "newSenderID"    # Ljava/lang/String;

    .prologue
    .line 623
    invoke-direct {p0}, Lcom/localytics/android/AnalyticsHandler;->_isPushDisabled()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 625
    const-string v0, "Registering for GCM but push disabled"

    invoke-static {v0}, Lcom/localytics/android/Localytics$Log;->v(Ljava/lang/String;)I

    .line 676
    :cond_0
    :goto_0
    return-void

    .line 630
    :cond_1
    const/4 v7, 0x0

    .line 632
    .local v7, "cursor":Landroid/database/Cursor;
    const/4 v11, 0x0

    .line 633
    .local v11, "senderId":Ljava/lang/String;
    const/4 v9, 0x0

    .line 634
    .local v9, "pushRegId":Ljava/lang/String;
    const/4 v10, 0x0

    .line 637
    .local v10, "pushRegVersion":Ljava/lang/String;
    :try_start_0
    iget-object v0, p0, Lcom/localytics/android/AnalyticsHandler;->mProvider:Lcom/localytics/android/BaseProvider;

    const-string v1, "info"

    const/4 v2, 0x3

    new-array v2, v2, [Ljava/lang/String;

    const/4 v3, 0x0

    const-string v4, "sender_id"

    aput-object v4, v2, v3

    const/4 v3, 0x1

    const-string v4, "registration_version"

    aput-object v4, v2, v3

    const/4 v3, 0x2

    const-string v4, "registration_id"

    aput-object v4, v2, v3

    const/4 v3, 0x0

    const/4 v4, 0x0

    const/4 v5, 0x0

    invoke-virtual/range {v0 .. v5}, Lcom/localytics/android/BaseProvider;->query(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v7

    .line 639
    invoke-interface {v7}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v0

    if-eqz v0, :cond_2

    .line 641
    const-string v0, "sender_id"

    invoke-interface {v7, v0}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v0

    invoke-interface {v7, v0}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v11

    .line 642
    const-string v0, "registration_version"

    invoke-interface {v7, v0}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v0

    invoke-interface {v7, v0}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v10

    .line 643
    const-string v0, "registration_id"

    invoke-interface {v7, v0}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v0

    invoke-interface {v7, v0}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result-object v9

    .line 648
    :cond_2
    if-eqz v7, :cond_3

    .line 650
    invoke-interface {v7}, Landroid/database/Cursor;->close()V

    .line 651
    const/4 v7, 0x0

    .line 656
    :cond_3
    invoke-virtual {p1, v11}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_4

    .line 658
    const/4 v9, 0x0

    .line 660
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lcom/localytics/android/AnalyticsHandler;->_setPushID(Ljava/lang/String;Ljava/lang/String;)V

    .line 663
    :cond_4
    iget-object v0, p0, Lcom/localytics/android/AnalyticsHandler;->mLocalyticsDao:Lcom/localytics/android/LocalyticsDao;

    invoke-interface {v0}, Lcom/localytics/android/LocalyticsDao;->getAppContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Lcom/localytics/android/DatapointHelper;->getAppVersion(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v6

    .line 666
    .local v6, "appVersion":Ljava/lang/String;
    invoke-static {v9}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_5

    invoke-virtual {v6, v10}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 669
    :cond_5
    const-string v0, "com.google.android.gms.gcm.GoogleCloudMessaging"

    const-string v1, "getInstance"

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/Class;

    const/4 v3, 0x0

    const-class v4, Landroid/content/Context;

    aput-object v4, v2, v3

    const/4 v3, 0x1

    new-array v3, v3, [Ljava/lang/Object;

    const/4 v4, 0x0

    iget-object v5, p0, Lcom/localytics/android/AnalyticsHandler;->mLocalyticsDao:Lcom/localytics/android/LocalyticsDao;

    invoke-interface {v5}, Lcom/localytics/android/LocalyticsDao;->getAppContext()Landroid/content/Context;

    move-result-object v5

    aput-object v5, v3, v4

    invoke-static {v0, v1, v2, v3}, Lcom/localytics/android/ReflectionUtils;->tryInvokeStatic(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Class;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v8

    .line 670
    .local v8, "gcm":Ljava/lang/Object;
    if-eqz v8, :cond_0

    .line 672
    sput-object p1, Lcom/localytics/android/PushReceiver;->retrySenderId:Ljava/lang/String;

    .line 673
    const-string v0, "register"

    const/4 v1, 0x1

    new-array v1, v1, [Ljava/lang/Class;

    const/4 v2, 0x0

    const-class v3, [Ljava/lang/String;

    aput-object v3, v1, v2

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    const/4 v4, 0x1

    new-array v4, v4, [Ljava/lang/String;

    const/4 v5, 0x0

    aput-object p1, v4, v5

    aput-object v4, v2, v3

    invoke-static {v8, v0, v1, v2}, Lcom/localytics/android/ReflectionUtils;->tryInvokeInstance(Ljava/lang/Object;Ljava/lang/String;[Ljava/lang/Class;[Ljava/lang/Object;)Ljava/lang/Object;

    goto/16 :goto_0

    .line 648
    .end local v6    # "appVersion":Ljava/lang/String;
    .end local v8    # "gcm":Ljava/lang/Object;
    :catchall_0
    move-exception v0

    if-eqz v7, :cond_6

    .line 650
    invoke-interface {v7}, Landroid/database/Cursor;->close()V

    .line 651
    const/4 v7, 0x0

    :cond_6
    throw v0
.end method

.method private _reuploadFirstSession(Ljava/lang/String;)V
    .locals 3
    .param p1, "referrerId"    # Ljava/lang/String;

    .prologue
    .line 1835
    invoke-virtual {p0, p1}, Lcom/localytics/android/AnalyticsHandler;->_replaceAttributionInFirstSession(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 1836
    .local v0, "updatedEventBlob":Ljava/lang/String;
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_0

    .line 1838
    new-instance v1, Lcom/localytics/android/ReferralUploader;

    iget-object v2, p0, Lcom/localytics/android/AnalyticsHandler;->mLocalyticsDao:Lcom/localytics/android/LocalyticsDao;

    invoke-direct {v1, p0, v0, v2}, Lcom/localytics/android/ReferralUploader;-><init>(Lcom/localytics/android/AnalyticsHandler;Ljava/lang/String;Lcom/localytics/android/LocalyticsDao;)V

    invoke-virtual {v1}, Lcom/localytics/android/ReferralUploader;->start()V

    .line 1840
    :cond_0
    return-void
.end method

.method private _setCustomDimension(ILjava/lang/String;)V
    .locals 9
    .param p1, "dimension"    # I
    .param p2, "value"    # Ljava/lang/String;

    .prologue
    const/4 v8, 0x1

    const/4 v7, 0x0

    .line 1394
    invoke-direct {p0, p1}, Lcom/localytics/android/AnalyticsHandler;->getCustomDimensionAttributeKey(I)Ljava/lang/String;

    move-result-object v0

    .line 1395
    .local v0, "key":Ljava/lang/String;
    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 1397
    iget-object v2, p0, Lcom/localytics/android/AnalyticsHandler;->mProvider:Lcom/localytics/android/BaseProvider;

    const-string v3, "custom_dimensions"

    const-string v4, "%s = ?"

    new-array v5, v8, [Ljava/lang/Object;

    const-string v6, "custom_dimension_key"

    aput-object v6, v5, v7

    invoke-static {v4, v5}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    new-array v5, v8, [Ljava/lang/String;

    aput-object v0, v5, v7

    invoke-virtual {v2, v3, v4, v5}, Lcom/localytics/android/BaseProvider;->remove(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)I

    .line 1409
    :cond_0
    :goto_0
    return-void

    .line 1401
    :cond_1
    new-instance v1, Landroid/content/ContentValues;

    invoke-direct {v1}, Landroid/content/ContentValues;-><init>()V

    .line 1402
    .local v1, "values":Landroid/content/ContentValues;
    const-string v2, "custom_dimension_key"

    invoke-virtual {v1, v2, v0}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 1403
    const-string v2, "custom_dimension_value"

    invoke-virtual {v1, v2, p2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 1404
    iget-object v2, p0, Lcom/localytics/android/AnalyticsHandler;->mProvider:Lcom/localytics/android/BaseProvider;

    const-string v3, "custom_dimensions"

    sget-object v4, Lcom/localytics/android/AnalyticsHandler;->SELECTION_SET_CUSTOM_DIMENSION:Ljava/lang/String;

    new-array v5, v8, [Ljava/lang/String;

    aput-object v0, v5, v7

    invoke-virtual {v2, v3, v1, v4, v5}, Lcom/localytics/android/BaseProvider;->update(Ljava/lang/String;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I

    move-result v2

    if-nez v2, :cond_0

    .line 1406
    iget-object v2, p0, Lcom/localytics/android/AnalyticsHandler;->mProvider:Lcom/localytics/android/BaseProvider;

    const-string v3, "custom_dimensions"

    invoke-virtual {v2, v3, v1}, Lcom/localytics/android/BaseProvider;->insert(Ljava/lang/String;Landroid/content/ContentValues;)J

    goto :goto_0
.end method

.method private _setFirstAdvertisingId(Ljava/lang/String;)V
    .locals 10
    .param p1, "advertisingId"    # Ljava/lang/String;

    .prologue
    const/4 v9, 0x0

    .line 1330
    const/4 v7, 0x0

    .line 1332
    .local v7, "firstAdvertisingId":Ljava/lang/String;
    const/4 v6, 0x0

    .line 1335
    .local v6, "cursor":Landroid/database/Cursor;
    :try_start_0
    iget-object v0, p0, Lcom/localytics/android/AnalyticsHandler;->mProvider:Lcom/localytics/android/BaseProvider;

    const-string v1, "info"

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/String;

    const/4 v3, 0x0

    const-string v4, "first_advertising_id"

    aput-object v4, v2, v3

    const/4 v3, 0x0

    const/4 v4, 0x0

    const/4 v5, 0x0

    invoke-virtual/range {v0 .. v5}, Lcom/localytics/android/BaseProvider;->query(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v6

    .line 1337
    invoke-interface {v6}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 1339
    const-string v0, "first_advertising_id"

    invoke-interface {v6, v0}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v0

    invoke-interface {v6, v0}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result-object v7

    .line 1344
    :cond_0
    if-eqz v6, :cond_1

    .line 1346
    invoke-interface {v6}, Landroid/database/Cursor;->close()V

    .line 1347
    const/4 v6, 0x0

    .line 1351
    :cond_1
    invoke-static {v7}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_3

    .line 1353
    const-string v0, "First advertising id has already been set before."

    invoke-static {v0}, Lcom/localytics/android/Localytics$Log;->v(Ljava/lang/String;)I

    .line 1360
    :goto_0
    return-void

    .line 1344
    :catchall_0
    move-exception v0

    if-eqz v6, :cond_2

    .line 1346
    invoke-interface {v6}, Landroid/database/Cursor;->close()V

    .line 1347
    const/4 v6, 0x0

    :cond_2
    throw v0

    .line 1357
    :cond_3
    new-instance v8, Landroid/content/ContentValues;

    invoke-direct {v8}, Landroid/content/ContentValues;-><init>()V

    .line 1358
    .local v8, "values":Landroid/content/ContentValues;
    const-string v0, "first_advertising_id"

    invoke-virtual {v8, v0, p1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 1359
    iget-object v0, p0, Lcom/localytics/android/AnalyticsHandler;->mProvider:Lcom/localytics/android/BaseProvider;

    const-string v1, "info"

    invoke-virtual {v0, v1, v8, v9, v9}, Lcom/localytics/android/BaseProvider;->update(Ljava/lang/String;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I

    goto :goto_0
.end method

.method private _setIdentifier(Ljava/lang/String;Ljava/lang/String;)V
    .locals 9
    .param p1, "key"    # Ljava/lang/String;
    .param p2, "value"    # Ljava/lang/String;

    .prologue
    const/4 v8, 0x0

    const/4 v7, 0x1

    const/4 v6, 0x0

    .line 1413
    if-eqz p2, :cond_0

    .line 1414
    invoke-virtual {p2}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object p2

    .line 1417
    :cond_0
    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_3

    .line 1419
    iget-object v1, p0, Lcom/localytics/android/AnalyticsHandler;->mProvider:Lcom/localytics/android/BaseProvider;

    const-string v2, "identifiers"

    const-string v3, "%s = ?"

    new-array v4, v7, [Ljava/lang/Object;

    const-string v5, "key"

    aput-object v5, v4, v6

    invoke-static {v3, v4}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    new-array v4, v7, [Ljava/lang/String;

    aput-object p1, v4, v6

    invoke-virtual {v1, v2, v3, v4}, Lcom/localytics/android/BaseProvider;->remove(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)I

    .line 1432
    :cond_1
    :goto_0
    const-string v1, "customer_id"

    invoke-virtual {p1, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    .line 1434
    new-instance v0, Landroid/content/ContentValues;

    invoke-direct {v0}, Landroid/content/ContentValues;-><init>()V

    .line 1435
    .local v0, "values":Landroid/content/ContentValues;
    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_4

    .line 1437
    const-string v1, "customer_id"

    iget-object v2, p0, Lcom/localytics/android/AnalyticsHandler;->mLocalyticsDao:Lcom/localytics/android/LocalyticsDao;

    invoke-interface {v2}, Lcom/localytics/android/LocalyticsDao;->getInstallationId()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 1438
    const-string v1, "user_type"

    const-string v2, "anonymous"

    invoke-virtual {v0, v1, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 1445
    :goto_1
    iget-object v1, p0, Lcom/localytics/android/AnalyticsHandler;->mProvider:Lcom/localytics/android/BaseProvider;

    const-string v2, "info"

    invoke-virtual {v1, v2, v0, v8, v8}, Lcom/localytics/android/BaseProvider;->update(Ljava/lang/String;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I

    .line 1447
    .end local v0    # "values":Landroid/content/ContentValues;
    :cond_2
    return-void

    .line 1423
    :cond_3
    new-instance v0, Landroid/content/ContentValues;

    invoke-direct {v0}, Landroid/content/ContentValues;-><init>()V

    .line 1424
    .restart local v0    # "values":Landroid/content/ContentValues;
    const-string v1, "key"

    invoke-virtual {v0, v1, p1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 1425
    const-string v1, "value"

    invoke-virtual {v0, v1, p2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 1426
    iget-object v1, p0, Lcom/localytics/android/AnalyticsHandler;->mProvider:Lcom/localytics/android/BaseProvider;

    const-string v2, "identifiers"

    sget-object v3, Lcom/localytics/android/AnalyticsHandler;->SELECTION_SET_IDENTIFIER:Ljava/lang/String;

    new-array v4, v7, [Ljava/lang/String;

    aput-object p1, v4, v6

    invoke-virtual {v1, v2, v0, v3, v4}, Lcom/localytics/android/BaseProvider;->update(Ljava/lang/String;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I

    move-result v1

    if-nez v1, :cond_1

    .line 1428
    iget-object v1, p0, Lcom/localytics/android/AnalyticsHandler;->mProvider:Lcom/localytics/android/BaseProvider;

    const-string v2, "identifiers"

    invoke-virtual {v1, v2, v0}, Lcom/localytics/android/BaseProvider;->insert(Ljava/lang/String;Landroid/content/ContentValues;)J

    goto :goto_0

    .line 1442
    :cond_4
    const-string v1, "customer_id"

    invoke-virtual {v0, v1, p2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 1443
    const-string v1, "user_type"

    const-string v2, "known"

    invoke-virtual {v0, v1, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_1
.end method

.method private _setOptedOut(Z)V
    .locals 4
    .param p1, "isOptingOut"    # Z

    .prologue
    const/4 v3, 0x0

    .line 1624
    invoke-direct {p0}, Lcom/localytics/android/AnalyticsHandler;->_isOptedOut()Z

    move-result v1

    if-ne v1, p1, :cond_0

    .line 1639
    :goto_0
    return-void

    .line 1629
    :cond_0
    if-eqz p1, :cond_2

    const-string v1, "opt_out"

    :goto_1
    invoke-direct {p0, v1}, Lcom/localytics/android/AnalyticsHandler;->_tagEvent(Ljava/lang/String;)V

    .line 1631
    invoke-direct {p0}, Lcom/localytics/android/AnalyticsHandler;->_isSessionOpen()Z

    move-result v1

    if-eqz v1, :cond_1

    if-eqz p1, :cond_1

    .line 1633
    invoke-direct {p0}, Lcom/localytics/android/AnalyticsHandler;->_close()V

    .line 1636
    :cond_1
    new-instance v0, Landroid/content/ContentValues;

    invoke-direct {v0}, Landroid/content/ContentValues;-><init>()V

    .line 1637
    .local v0, "values":Landroid/content/ContentValues;
    const-string v1, "opt_out"

    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Boolean;)V

    .line 1638
    iget-object v1, p0, Lcom/localytics/android/AnalyticsHandler;->mProvider:Lcom/localytics/android/BaseProvider;

    const-string v2, "info"

    invoke-virtual {v1, v2, v0, v3, v3}, Lcom/localytics/android/BaseProvider;->update(Ljava/lang/String;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I

    goto :goto_0

    .line 1629
    .end local v0    # "values":Landroid/content/ContentValues;
    :cond_2
    const-string v1, "opt_in"

    goto :goto_1
.end method

.method private _setPushDisabled(I)V
    .locals 4
    .param p1, "disabled"    # I

    .prologue
    const/4 v3, 0x0

    .line 519
    new-instance v0, Landroid/content/ContentValues;

    invoke-direct {v0}, Landroid/content/ContentValues;-><init>()V

    .line 520
    .local v0, "values":Landroid/content/ContentValues;
    const-string v1, "push_disabled"

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 521
    iget-object v1, p0, Lcom/localytics/android/AnalyticsHandler;->mProvider:Lcom/localytics/android/BaseProvider;

    const-string v2, "info"

    invoke-virtual {v1, v2, v0, v3, v3}, Lcom/localytics/android/BaseProvider;->update(Ljava/lang/String;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I

    .line 522
    return-void
.end method

.method private _setPushID(Ljava/lang/String;)V
    .locals 4
    .param p1, "pushRegId"    # Ljava/lang/String;

    .prologue
    const/4 v3, 0x0

    .line 1683
    new-instance v0, Landroid/content/ContentValues;

    invoke-direct {v0}, Landroid/content/ContentValues;-><init>()V

    .line 1684
    .local v0, "values":Landroid/content/ContentValues;
    const-string v1, "registration_id"

    if-nez p1, :cond_0

    const-string p1, ""

    .end local p1    # "pushRegId":Ljava/lang/String;
    :cond_0
    invoke-virtual {v0, v1, p1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 1685
    const-string v1, "registration_version"

    iget-object v2, p0, Lcom/localytics/android/AnalyticsHandler;->mLocalyticsDao:Lcom/localytics/android/LocalyticsDao;

    invoke-interface {v2}, Lcom/localytics/android/LocalyticsDao;->getAppContext()Landroid/content/Context;

    move-result-object v2

    invoke-static {v2}, Lcom/localytics/android/DatapointHelper;->getAppVersion(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 1686
    iget-object v1, p0, Lcom/localytics/android/AnalyticsHandler;->mProvider:Lcom/localytics/android/BaseProvider;

    const-string v2, "info"

    invoke-virtual {v1, v2, v0, v3, v3}, Lcom/localytics/android/BaseProvider;->update(Ljava/lang/String;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I

    .line 1687
    return-void
.end method

.method private _setPushID(Ljava/lang/String;Ljava/lang/String;)V
    .locals 4
    .param p1, "senderId"    # Ljava/lang/String;
    .param p2, "pushRegId"    # Ljava/lang/String;

    .prologue
    const/4 v3, 0x0

    .line 1691
    new-instance v0, Landroid/content/ContentValues;

    invoke-direct {v0}, Landroid/content/ContentValues;-><init>()V

    .line 1692
    .local v0, "values":Landroid/content/ContentValues;
    const-string v1, "sender_id"

    invoke-virtual {v0, v1, p1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 1693
    const-string v1, "registration_id"

    if-nez p2, :cond_0

    const-string p2, ""

    .end local p2    # "pushRegId":Ljava/lang/String;
    :cond_0
    invoke-virtual {v0, v1, p2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 1694
    iget-object v1, p0, Lcom/localytics/android/AnalyticsHandler;->mProvider:Lcom/localytics/android/BaseProvider;

    const-string v2, "info"

    invoke-virtual {v1, v2, v0, v3, v3}, Lcom/localytics/android/BaseProvider;->update(Ljava/lang/String;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I

    .line 1695
    return-void
.end method

.method private _setReferrerId(Ljava/lang/String;)V
    .locals 9
    .param p1, "referrerId"    # Ljava/lang/String;

    .prologue
    .line 1803
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_1

    .line 1805
    const/4 v7, 0x0

    .line 1808
    .local v7, "cursor":Landroid/database/Cursor;
    :try_start_0
    iget-object v0, p0, Lcom/localytics/android/AnalyticsHandler;->mProvider:Lcom/localytics/android/BaseProvider;

    const-string v1, "info"

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/String;

    const/4 v3, 0x0

    const-string v4, "play_attribution"

    aput-object v4, v2, v3

    const/4 v3, 0x0

    const/4 v4, 0x0

    const/4 v5, 0x0

    invoke-virtual/range {v0 .. v5}, Lcom/localytics/android/BaseProvider;->query(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v7

    .line 1810
    invoke-interface {v7}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 1812
    const-string v0, "play_attribution"

    invoke-interface {v7, v0}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v0

    invoke-interface {v7, v0}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v6

    .line 1813
    .local v6, "currentReferrerID":Ljava/lang/String;
    invoke-static {v6}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 1815
    new-instance v8, Landroid/content/ContentValues;

    invoke-direct {v8}, Landroid/content/ContentValues;-><init>()V

    .line 1816
    .local v8, "values":Landroid/content/ContentValues;
    const-string v0, "play_attribution"

    invoke-virtual {v8, v0, p1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 1817
    iget-object v0, p0, Lcom/localytics/android/AnalyticsHandler;->mProvider:Lcom/localytics/android/BaseProvider;

    const-string v1, "info"

    const/4 v2, 0x0

    const/4 v3, 0x0

    invoke-virtual {v0, v1, v8, v2, v3}, Lcom/localytics/android/BaseProvider;->update(Ljava/lang/String;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I

    .line 1818
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "[REFERRAL] _setReferrerId: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/localytics/android/Localytics$Log;->i(Ljava/lang/String;)I

    .line 1819
    invoke-direct {p0, p1}, Lcom/localytics/android/AnalyticsHandler;->_reuploadFirstSession(Ljava/lang/String;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 1825
    .end local v6    # "currentReferrerID":Ljava/lang/String;
    .end local v8    # "values":Landroid/content/ContentValues;
    :cond_0
    if-eqz v7, :cond_1

    .line 1827
    invoke-interface {v7}, Landroid/database/Cursor;->close()V

    .line 1831
    .end local v7    # "cursor":Landroid/database/Cursor;
    :cond_1
    return-void

    .line 1825
    .restart local v7    # "cursor":Landroid/database/Cursor;
    :catchall_0
    move-exception v0

    if-eqz v7, :cond_2

    .line 1827
    invoke-interface {v7}, Landroid/database/Cursor;->close()V

    :cond_2
    throw v0
.end method

.method private _tagEvent(Ljava/lang/String;)V
    .locals 1
    .param p1, "event"    # Ljava/lang/String;

    .prologue
    const/4 v0, 0x0

    .line 714
    invoke-direct {p0, p1, v0, v0}, Lcom/localytics/android/AnalyticsHandler;->_tagEvent(Ljava/lang/String;Ljava/util/Map;Ljava/lang/Long;)V

    .line 715
    return-void
.end method

.method private _tagEvent(Ljava/lang/String;Ljava/util/Map;Ljava/lang/Long;)V
    .locals 48
    .param p1, "event"    # Ljava/lang/String;
    .param p3, "clv"    # Ljava/lang/Long;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;",
            "Ljava/lang/Long;",
            ")V"
        }
    .end annotation

    .prologue
    .line 833
    .local p2, "attributes":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    const/16 v31, 0x0

    .line 834
    .local v31, "headerSequenceNumber":I
    const/16 v42, 0x0

    .line 835
    .local v42, "sessionSequenceNumber":I
    :try_start_0
    const-string v36, ""

    .line 836
    .local v36, "openSessionUUID":Ljava/lang/String;
    const-string v18, ""

    .line 837
    .local v18, "customerID":Ljava/lang/String;
    const-string v47, ""

    .line 838
    .local v47, "userType":Ljava/lang/String;
    const/4 v15, 0x0

    .line 839
    .local v15, "cursor":Landroid/database/Cursor;
    new-instance v29, Lorg/json/JSONObject;

    invoke-direct/range {v29 .. v29}, Lorg/json/JSONObject;-><init>()V

    .line 840
    .local v29, "headerBlob":Lorg/json/JSONObject;
    const-wide/16 v34, 0x0

    .line 841
    .local v34, "lastSessionStartTime":J
    const-string v6, "dt"

    const-string v7, "h"

    move-object/from16 v0, v29

    invoke-virtual {v0, v6, v7}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 842
    const-string v6, "u"

    invoke-static {}, Ljava/util/UUID;->randomUUID()Ljava/util/UUID;

    move-result-object v7

    invoke-virtual {v7}, Ljava/util/UUID;->toString()Ljava/lang/String;

    move-result-object v7

    move-object/from16 v0, v29

    invoke-virtual {v0, v6, v7}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 844
    move-object/from16 v0, p0

    iget-object v6, v0, Lcom/localytics/android/AnalyticsHandler;->mLocalyticsDao:Lcom/localytics/android/LocalyticsDao;

    invoke-interface {v6}, Lcom/localytics/android/LocalyticsDao;->getAppContext()Landroid/content/Context;

    move-result-object v14

    .line 845
    .local v14, "appContext":Landroid/content/Context;
    const-string v6, "phone"

    invoke-virtual {v14, v6}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v43

    check-cast v43, Landroid/telephony/TelephonyManager;

    .line 846
    .local v43, "telephonyManager":Landroid/telephony/TelephonyManager;
    new-instance v28, Lorg/json/JSONObject;

    invoke-direct/range {v28 .. v28}, Lorg/json/JSONObject;-><init>()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 849
    .local v28, "headerAttributes":Lorg/json/JSONObject;
    :try_start_1
    move-object/from16 v0, p0

    iget-object v6, v0, Lcom/localytics/android/AnalyticsHandler;->mProvider:Lcom/localytics/android/BaseProvider;

    const-string v7, "info"

    const/4 v8, 0x0

    const/4 v9, 0x0

    const/4 v10, 0x0

    const/4 v11, 0x0

    invoke-virtual/range {v6 .. v11}, Lcom/localytics/android/BaseProvider;->query(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v15

    .line 851
    invoke-interface {v15}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v6

    if-eqz v6, :cond_a

    .line 853
    const-string v6, "pa"

    const-string v7, "created_time"

    invoke-interface {v15, v7}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v7

    invoke-interface {v15, v7}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v8

    const-wide/16 v10, 0x3e8

    div-long/2addr v8, v10

    long-to-float v7, v8

    invoke-static {v7}, Ljava/lang/Math;->round(F)I

    move-result v7

    move-object/from16 v0, v29

    invoke-virtual {v0, v6, v7}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    .line 854
    const-string v6, "next_header_number"

    invoke-interface {v15, v6}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v6

    invoke-interface {v15, v6}, Landroid/database/Cursor;->getInt(I)I

    move-result v31

    .line 855
    const-string v6, "next_session_number"

    invoke-interface {v15, v6}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v6

    invoke-interface {v15, v6}, Landroid/database/Cursor;->getInt(I)I

    move-result v42

    .line 856
    const-string v6, "customer_id"

    invoke-interface {v15, v6}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v6

    invoke-interface {v15, v6}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v18

    .line 857
    const-string v6, "user_type"

    invoke-interface {v15, v6}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v6

    invoke-interface {v15, v6}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v47

    .line 858
    const-string v6, "current_session_uuid"

    invoke-interface {v15, v6}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v6

    invoke-interface {v15, v6}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v36

    .line 859
    const-string v6, "seq"

    move-object/from16 v0, v29

    move/from16 v1, v31

    invoke-virtual {v0, v6, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    .line 861
    const-string v6, "dt"

    const-string v7, "a"

    move-object/from16 v0, v28

    invoke-virtual {v0, v6, v7}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 862
    const-string v6, "au"

    move-object/from16 v0, p0

    iget-object v7, v0, Lcom/localytics/android/AnalyticsHandler;->mLocalyticsDao:Lcom/localytics/android/LocalyticsDao;

    invoke-interface {v7}, Lcom/localytics/android/LocalyticsDao;->getApiKey()Ljava/lang/String;

    move-result-object v7

    move-object/from16 v0, v28

    invoke-virtual {v0, v6, v7}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 863
    move-object/from16 v0, p0

    iget-object v6, v0, Lcom/localytics/android/AnalyticsHandler;->mLocalyticsDao:Lcom/localytics/android/LocalyticsDao;

    invoke-interface {v6}, Lcom/localytics/android/LocalyticsDao;->getAppContext()Landroid/content/Context;

    move-result-object v6

    invoke-static {v6}, Lcom/localytics/android/DatapointHelper;->getAndroidIdHashOrNull(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v19

    .line 864
    .local v19, "deviceID":Ljava/lang/String;
    if-eqz v19, :cond_0

    .line 866
    const-string v6, "du"

    move-object/from16 v0, v28

    move-object/from16 v1, v19

    invoke-virtual {v0, v6, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 868
    :cond_0
    const-string v6, "lv"

    const-string v7, "androida_3.4.0"

    move-object/from16 v0, v28

    invoke-virtual {v0, v6, v7}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 869
    const-string v6, "av"

    move-object/from16 v0, p0

    iget-object v7, v0, Lcom/localytics/android/AnalyticsHandler;->mLocalyticsDao:Lcom/localytics/android/LocalyticsDao;

    invoke-interface {v7}, Lcom/localytics/android/LocalyticsDao;->getAppContext()Landroid/content/Context;

    move-result-object v7

    invoke-static {v7}, Lcom/localytics/android/DatapointHelper;->getAppVersion(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v7

    move-object/from16 v0, v28

    invoke-virtual {v0, v6, v7}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 870
    const-string v6, "dp"

    const-string v7, "Android"

    move-object/from16 v0, v28

    invoke-virtual {v0, v6, v7}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 871
    const-string v6, "dll"

    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    move-result-object v7

    invoke-virtual {v7}, Ljava/util/Locale;->getLanguage()Ljava/lang/String;

    move-result-object v7

    move-object/from16 v0, v28

    invoke-virtual {v0, v6, v7}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 872
    const-string v6, "dlc"

    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    move-result-object v7

    invoke-virtual {v7}, Ljava/util/Locale;->getCountry()Ljava/lang/String;

    move-result-object v7

    move-object/from16 v0, v28

    invoke-virtual {v0, v6, v7}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 873
    const-string v6, "nc"

    invoke-virtual/range {v43 .. v43}, Landroid/telephony/TelephonyManager;->getNetworkCountryIso()Ljava/lang/String;

    move-result-object v7

    move-object/from16 v0, v28

    invoke-virtual {v0, v6, v7}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 874
    const-string v6, "dc"

    invoke-virtual/range {v43 .. v43}, Landroid/telephony/TelephonyManager;->getSimCountryIso()Ljava/lang/String;

    move-result-object v7

    move-object/from16 v0, v28

    invoke-virtual {v0, v6, v7}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 875
    const-string v6, "dma"

    invoke-static {}, Lcom/localytics/android/DatapointHelper;->getManufacturer()Ljava/lang/String;

    move-result-object v7

    move-object/from16 v0, v28

    invoke-virtual {v0, v6, v7}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 876
    const-string v6, "dmo"

    sget-object v7, Landroid/os/Build;->MODEL:Ljava/lang/String;

    move-object/from16 v0, v28

    invoke-virtual {v0, v6, v7}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 877
    const-string v6, "dov"

    sget-object v7, Landroid/os/Build$VERSION;->RELEASE:Ljava/lang/String;

    move-object/from16 v0, v28

    invoke-virtual {v0, v6, v7}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 878
    const-string v6, "nca"

    invoke-virtual/range {v43 .. v43}, Landroid/telephony/TelephonyManager;->getNetworkOperatorName()Ljava/lang/String;

    move-result-object v7

    move-object/from16 v0, v28

    invoke-virtual {v0, v6, v7}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 879
    const-string v6, "dac"

    move-object/from16 v0, p0

    iget-object v7, v0, Lcom/localytics/android/AnalyticsHandler;->mLocalyticsDao:Lcom/localytics/android/LocalyticsDao;

    invoke-interface {v7}, Lcom/localytics/android/LocalyticsDao;->getAppContext()Landroid/content/Context;

    move-result-object v7

    move-object/from16 v0, v43

    invoke-static {v0, v7}, Lcom/localytics/android/DatapointHelper;->getNetworkType(Landroid/telephony/TelephonyManager;Landroid/content/Context;)Ljava/lang/String;

    move-result-object v7

    move-object/from16 v0, v28

    invoke-virtual {v0, v6, v7}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 880
    const-string v6, "iu"

    move-object/from16 v0, p0

    iget-object v7, v0, Lcom/localytics/android/AnalyticsHandler;->mLocalyticsDao:Lcom/localytics/android/LocalyticsDao;

    invoke-interface {v7}, Lcom/localytics/android/LocalyticsDao;->getInstallationId()Ljava/lang/String;

    move-result-object v7

    move-object/from16 v0, v28

    invoke-virtual {v0, v6, v7}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 881
    const-string v6, "fb_attribution"

    invoke-interface {v15, v6}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v6

    invoke-interface {v15, v6}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v25

    .line 882
    .local v25, "fbAttribution":Ljava/lang/String;
    if-eqz v25, :cond_1

    .line 884
    const-string v6, "fbat"

    move-object/from16 v0, v28

    move-object/from16 v1, v25

    invoke-virtual {v0, v6, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 886
    :cond_1
    const-string v6, "registration_id"

    invoke-interface {v15, v6}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v6

    invoke-interface {v15, v6}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v39

    .line 887
    .local v39, "registrationId":Ljava/lang/String;
    if-eqz v39, :cond_2

    .line 889
    const-string v6, "push"

    move-object/from16 v0, v28

    move-object/from16 v1, v39

    invoke-virtual {v0, v6, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 891
    :cond_2
    const-string v6, "first_android_id"

    invoke-interface {v15, v6}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v6

    invoke-interface {v15, v6}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v27

    .line 892
    .local v27, "firstAndroidId":Ljava/lang/String;
    if-eqz v27, :cond_3

    .line 894
    const-string v6, "aid"

    move-object/from16 v0, v28

    move-object/from16 v1, v27

    invoke-virtual {v0, v6, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 896
    :cond_3
    move-object/from16 v0, p0

    iget-object v6, v0, Lcom/localytics/android/AnalyticsHandler;->mLocalyticsDao:Lcom/localytics/android/LocalyticsDao;

    invoke-interface {v6}, Lcom/localytics/android/LocalyticsDao;->getAppContext()Landroid/content/Context;

    move-result-object v6

    invoke-static {v6}, Lcom/localytics/android/DatapointHelper;->getAndroidIdOrNull(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v13

    .line 897
    .local v13, "androidID":Ljava/lang/String;
    const-string v6, "caid"

    if-nez v13, :cond_4

    sget-object v13, Lorg/json/JSONObject;->NULL:Ljava/lang/Object;

    .end local v13    # "androidID":Ljava/lang/String;
    :cond_4
    move-object/from16 v0, v28

    invoke-virtual {v0, v6, v13}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 899
    move-object/from16 v0, p0

    iget-object v6, v0, Lcom/localytics/android/AnalyticsHandler;->mLocalyticsDao:Lcom/localytics/android/LocalyticsDao;

    invoke-interface {v6}, Lcom/localytics/android/LocalyticsDao;->getAppContext()Landroid/content/Context;

    move-result-object v6

    invoke-static {v6}, Lcom/localytics/android/DatapointHelper;->getAdvertisingInfo(Landroid/content/Context;)Lcom/localytics/android/DatapointHelper$AdvertisingInfo;

    move-result-object v12

    .line 900
    .local v12, "advertisingInfo":Lcom/localytics/android/DatapointHelper$AdvertisingInfo;
    const-string v7, "lad"

    if-eqz v12, :cond_11

    iget-boolean v6, v12, Lcom/localytics/android/DatapointHelper$AdvertisingInfo;->limitAdTracking:Z

    if-eqz v6, :cond_11

    const/4 v6, 0x1

    :goto_0
    move-object/from16 v0, v28

    invoke-virtual {v0, v7, v6}, Lorg/json/JSONObject;->put(Ljava/lang/String;Z)Lorg/json/JSONObject;

    .line 901
    const-string v6, "first_advertising_id"

    invoke-interface {v15, v6}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v6

    invoke-interface {v15, v6}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v26

    .line 902
    .local v26, "firstAdvertisingId":Ljava/lang/String;
    if-eqz v26, :cond_5

    .line 904
    const-string v6, "gadid"

    move-object/from16 v0, v28

    move-object/from16 v1, v26

    invoke-virtual {v0, v6, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 906
    :cond_5
    if-eqz v12, :cond_6

    iget-object v6, v12, Lcom/localytics/android/DatapointHelper$AdvertisingInfo;->id:Ljava/lang/String;

    if-eqz v6, :cond_6

    .line 908
    const-string v6, "gcadid"

    iget-object v7, v12, Lcom/localytics/android/DatapointHelper$AdvertisingInfo;->id:Ljava/lang/String;

    move-object/from16 v0, v28

    invoke-virtual {v0, v6, v7}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 911
    :cond_6
    invoke-static {}, Ljava/util/TimeZone;->getDefault()Ljava/util/TimeZone;

    move-result-object v46

    .line 912
    .local v46, "tz":Ljava/util/TimeZone;
    invoke-static/range {v46 .. v46}, Ljava/util/Calendar;->getInstance(Ljava/util/TimeZone;)Ljava/util/Calendar;

    move-result-object v6

    invoke-virtual {v6}, Ljava/util/Calendar;->getTime()Ljava/util/Date;

    move-result-object v44

    .line 913
    .local v44, "time":Ljava/util/Date;
    move-object/from16 v0, v46

    move-object/from16 v1, v44

    invoke-virtual {v0, v1}, Ljava/util/TimeZone;->inDaylightTime(Ljava/util/Date;)Z

    move-result v6

    if-eqz v6, :cond_12

    invoke-virtual/range {v46 .. v46}, Ljava/util/TimeZone;->getRawOffset()I

    move-result v6

    invoke-virtual/range {v46 .. v46}, Ljava/util/TimeZone;->getDSTSavings()I

    move-result v7

    add-int v45, v6, v7

    .line 914
    .local v45, "timezone":I
    :goto_1
    const-string v6, "tz"

    move/from16 v0, v45

    int-to-long v8, v0

    const-wide/16 v10, 0x3e8

    div-long/2addr v8, v10

    move-object/from16 v0, v28

    invoke-virtual {v0, v6, v8, v9}, Lorg/json/JSONObject;->put(Ljava/lang/String;J)Lorg/json/JSONObject;

    .line 916
    const-string v6, "package_name"

    invoke-interface {v15, v6}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v6

    invoke-interface {v15, v6}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v37

    .line 917
    .local v37, "packageName":Ljava/lang/String;
    if-eqz v37, :cond_7

    .line 919
    const-string v6, "pkg"

    move-object/from16 v0, v28

    move-object/from16 v1, v37

    invoke-virtual {v0, v6, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 921
    :cond_7
    invoke-static {}, Lcom/localytics/android/DatapointHelper;->getSerialNumberHashOrNull()Ljava/lang/String;

    move-result-object v41

    .line 922
    .local v41, "serialNumberHash":Ljava/lang/String;
    const-string v6, "dms"

    if-nez v41, :cond_8

    sget-object v41, Lorg/json/JSONObject;->NULL:Ljava/lang/Object;

    .end local v41    # "serialNumberHash":Ljava/lang/String;
    :cond_8
    move-object/from16 v0, v28

    move-object/from16 v1, v41

    invoke-virtual {v0, v6, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 923
    const-string v6, "dsdk"

    sget v7, Lcom/localytics/android/Constants;->CURRENT_API_LEVEL:I

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    move-object/from16 v0, v28

    invoke-virtual {v0, v6, v7}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 924
    const-string v6, "play_attribution"

    invoke-interface {v15, v6}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v6

    invoke-interface {v15, v6}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v38

    .line 925
    .local v38, "playAttribution":Ljava/lang/String;
    if-eqz v38, :cond_9

    .line 927
    const-string v6, "aurl"

    move-object/from16 v0, v28

    move-object/from16 v1, v38

    invoke-virtual {v0, v6, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 929
    :cond_9
    const-string v6, "last_session_open_time"

    invoke-interface {v15, v6}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v6

    invoke-interface {v15, v6}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v34

    .line 931
    const/4 v6, 0x0

    move-object/from16 v0, p0

    move-object/from16 v1, v38

    move-object/from16 v2, v28

    invoke-direct {v0, v1, v2, v12, v6}, Lcom/localytics/android/AnalyticsHandler;->_updateHeaderForTestModeAttribution(Ljava/lang/String;Lorg/json/JSONObject;Lcom/localytics/android/DatapointHelper$AdvertisingInfo;Z)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 936
    .end local v12    # "advertisingInfo":Lcom/localytics/android/DatapointHelper$AdvertisingInfo;
    .end local v19    # "deviceID":Ljava/lang/String;
    .end local v25    # "fbAttribution":Ljava/lang/String;
    .end local v26    # "firstAdvertisingId":Ljava/lang/String;
    .end local v27    # "firstAndroidId":Ljava/lang/String;
    .end local v37    # "packageName":Ljava/lang/String;
    .end local v38    # "playAttribution":Ljava/lang/String;
    .end local v39    # "registrationId":Ljava/lang/String;
    .end local v44    # "time":Ljava/util/Date;
    .end local v45    # "timezone":I
    .end local v46    # "tz":Ljava/util/TimeZone;
    :cond_a
    if-eqz v15, :cond_b

    .line 938
    :try_start_2
    invoke-interface {v15}, Landroid/database/Cursor;->close()V

    .line 939
    const/4 v15, 0x0

    .line 942
    :cond_b
    const-string v6, "attrs"

    move-object/from16 v0, v29

    move-object/from16 v1, v28

    invoke-virtual {v0, v6, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 944
    invoke-direct/range {p0 .. p0}, Lcom/localytics/android/AnalyticsHandler;->_getIdentifiers()Lorg/json/JSONObject;

    move-result-object v32

    .line 946
    .local v32, "identifiers":Lorg/json/JSONObject;
    invoke-virtual/range {v32 .. v32}, Lorg/json/JSONObject;->length()I

    move-result v6

    if-lez v6, :cond_c

    .line 948
    const-string v6, "ids"

    move-object/from16 v0, v29

    move-object/from16 v1, v32

    invoke-virtual {v0, v6, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 951
    :cond_c
    new-instance v33, Landroid/content/ContentValues;

    invoke-direct/range {v33 .. v33}, Landroid/content/ContentValues;-><init>()V

    .line 952
    .local v33, "infoValues":Landroid/content/ContentValues;
    new-instance v24, Landroid/content/ContentValues;

    invoke-direct/range {v24 .. v24}, Landroid/content/ContentValues;-><init>()V

    .line 954
    .local v24, "eventValues":Landroid/content/ContentValues;
    const-string v6, "next_header_number"

    add-int/lit8 v7, v31, 0x1

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    move-object/from16 v0, v33

    invoke-virtual {v0, v6, v7}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 957
    new-instance v22, Lorg/json/JSONObject;

    invoke-direct/range {v22 .. v22}, Lorg/json/JSONObject;-><init>()V

    .line 958
    .local v22, "eventBlob":Lorg/json/JSONObject;
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v16

    .line 959
    .local v16, "currentTime":J
    invoke-static {}, Ljava/util/UUID;->randomUUID()Ljava/util/UUID;

    move-result-object v6

    invoke-virtual {v6}, Ljava/util/UUID;->toString()Ljava/lang/String;

    move-result-object v23

    .line 960
    .local v23, "eventUUID":Ljava/lang/String;
    const-string v6, "open"

    move-object/from16 v0, p1

    invoke-virtual {v6, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_15

    .line 962
    const-string v6, "dt"

    const-string v7, "s"

    move-object/from16 v0, v22

    invoke-virtual {v0, v6, v7}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 963
    const-string v6, "ct"

    const-wide/16 v8, 0x3e8

    div-long v8, v16, v8

    long-to-double v8, v8

    invoke-static {v8, v9}, Ljava/lang/Math;->round(D)J

    move-result-wide v8

    move-object/from16 v0, v22

    invoke-virtual {v0, v6, v8, v9}, Lorg/json/JSONObject;->put(Ljava/lang/String;J)Lorg/json/JSONObject;

    .line 964
    const-string v6, "u"

    move-object/from16 v0, v22

    move-object/from16 v1, v23

    invoke-virtual {v0, v6, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 966
    sub-long v20, v16, v34

    .line 967
    .local v20, "elapsedTime":J
    const-wide/16 v6, 0x0

    cmp-long v6, v34, v6

    if-nez v6, :cond_14

    .line 969
    const-string v6, "sl"

    const-wide/16 v8, 0x0

    move-object/from16 v0, v22

    invoke-virtual {v0, v6, v8, v9}, Lorg/json/JSONObject;->put(Ljava/lang/String;D)Lorg/json/JSONObject;

    .line 979
    :cond_d
    :goto_2
    const-string v6, "nth"

    move-object/from16 v0, v22

    move/from16 v1, v42

    invoke-virtual {v0, v6, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    .line 981
    move-object/from16 v0, p0

    move-object/from16 v1, v22

    move-object/from16 v2, v32

    move-object/from16 v3, v18

    move-object/from16 v4, v47

    invoke-direct {v0, v1, v2, v3, v4}, Lcom/localytics/android/AnalyticsHandler;->_addLocationIDsAndCustomDimensions(Lorg/json/JSONObject;Lorg/json/JSONObject;Ljava/lang/String;Ljava/lang/String;)V

    .line 983
    const-string v6, "%s\n%s"

    const/4 v7, 0x2

    new-array v7, v7, [Ljava/lang/Object;

    const/4 v8, 0x0

    invoke-virtual/range {v29 .. v29}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v9

    aput-object v9, v7, v8

    const/4 v8, 0x1

    invoke-virtual/range {v22 .. v22}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v9

    aput-object v9, v7, v8

    invoke-static {v6, v7}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v30

    .line 984
    .local v30, "headerEventBlob":Ljava/lang/String;
    const-string v6, "blob"

    move-object/from16 v0, v24

    move-object/from16 v1, v30

    invoke-virtual {v0, v6, v1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 985
    const-string v6, "upload_format"

    sget-object v7, Lcom/localytics/android/AnalyticsProvider$EventsV3Columns$UploadFormat;->V2:Lcom/localytics/android/AnalyticsProvider$EventsV3Columns$UploadFormat;

    invoke-virtual {v7}, Lcom/localytics/android/AnalyticsProvider$EventsV3Columns$UploadFormat;->getValue()I

    move-result v7

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    move-object/from16 v0, v24

    invoke-virtual {v0, v6, v7}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 987
    const-string v6, "last_session_open_time"

    invoke-static/range {v16 .. v17}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v7

    move-object/from16 v0, v33

    invoke-virtual {v0, v6, v7}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Long;)V

    .line 988
    const-string v6, "next_session_number"

    add-int/lit8 v7, v42, 0x1

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    move-object/from16 v0, v33

    invoke-virtual {v0, v6, v7}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 989
    const-string v6, "current_session_uuid"

    move-object/from16 v0, v33

    move-object/from16 v1, v23

    invoke-virtual {v0, v6, v1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 990
    move-object/from16 v0, p0

    iget-boolean v6, v0, Lcom/localytics/android/AnalyticsHandler;->mFirstSessionEver:Z

    if-eqz v6, :cond_e

    .line 992
    const-string v6, "first_open_event_blob"

    move-object/from16 v0, v33

    move-object/from16 v1, v30

    invoke-virtual {v0, v6, v1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 1063
    .end local v20    # "elapsedTime":J
    .end local v30    # "headerEventBlob":Ljava/lang/String;
    .end local v36    # "openSessionUUID":Ljava/lang/String;
    :cond_e
    :goto_3
    move-object/from16 v0, p0

    iget-object v6, v0, Lcom/localytics/android/AnalyticsHandler;->mProvider:Lcom/localytics/android/BaseProvider;

    const-string v7, "info"

    const/4 v8, 0x0

    const/4 v9, 0x0

    move-object/from16 v0, v33

    invoke-virtual {v6, v7, v0, v8, v9}, Lcom/localytics/android/BaseProvider;->update(Ljava/lang/String;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I

    .line 1064
    invoke-virtual/range {v24 .. v24}, Landroid/content/ContentValues;->size()I

    move-result v6

    if-lez v6, :cond_f

    .line 1066
    move-object/from16 v0, p0

    iget-object v6, v0, Lcom/localytics/android/AnalyticsHandler;->mProvider:Lcom/localytics/android/BaseProvider;

    const-string v7, "events"

    move-object/from16 v0, v24

    invoke-virtual {v6, v7, v0}, Lcom/localytics/android/BaseProvider;->insert(Ljava/lang/String;Landroid/content/ContentValues;)J

    .line 1069
    :cond_f
    const/4 v6, 0x4

    new-array v6, v6, [Ljava/lang/String;

    const/4 v7, 0x0

    const-string v8, "open"

    aput-object v8, v6, v7

    const/4 v7, 0x1

    const-string v8, "close"

    aput-object v8, v6, v7

    const/4 v7, 0x2

    const-string v8, "opt_in"

    aput-object v8, v6, v7

    const/4 v7, 0x3

    const-string v8, "opt_out"

    aput-object v8, v6, v7

    invoke-static {v6}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v6

    move-object/from16 v0, p1

    invoke-interface {v6, v0}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v6

    if-nez v6, :cond_10

    .line 1071
    move-object/from16 v0, p0

    iget-object v6, v0, Lcom/localytics/android/AnalyticsHandler;->listeners:Lcom/localytics/android/BaseHandler$ListenersSet;

    check-cast v6, Lcom/localytics/android/AnalyticsListener;

    if-nez p3, :cond_1f

    const-wide/16 v8, 0x0

    :goto_4
    move-object/from16 v0, p1

    move-object/from16 v1, p2

    invoke-interface {v6, v0, v1, v8, v9}, Lcom/localytics/android/AnalyticsListener;->localyticsDidTagEvent(Ljava/lang/String;Ljava/util/Map;J)V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0

    .line 1077
    .end local v14    # "appContext":Landroid/content/Context;
    .end local v15    # "cursor":Landroid/database/Cursor;
    .end local v16    # "currentTime":J
    .end local v18    # "customerID":Ljava/lang/String;
    .end local v22    # "eventBlob":Lorg/json/JSONObject;
    .end local v23    # "eventUUID":Ljava/lang/String;
    .end local v24    # "eventValues":Landroid/content/ContentValues;
    .end local v28    # "headerAttributes":Lorg/json/JSONObject;
    .end local v29    # "headerBlob":Lorg/json/JSONObject;
    .end local v32    # "identifiers":Lorg/json/JSONObject;
    .end local v33    # "infoValues":Landroid/content/ContentValues;
    .end local v34    # "lastSessionStartTime":J
    .end local v43    # "telephonyManager":Landroid/telephony/TelephonyManager;
    .end local v47    # "userType":Ljava/lang/String;
    :cond_10
    :goto_5
    return-void

    .line 900
    .restart local v12    # "advertisingInfo":Lcom/localytics/android/DatapointHelper$AdvertisingInfo;
    .restart local v14    # "appContext":Landroid/content/Context;
    .restart local v15    # "cursor":Landroid/database/Cursor;
    .restart local v18    # "customerID":Ljava/lang/String;
    .restart local v19    # "deviceID":Ljava/lang/String;
    .restart local v25    # "fbAttribution":Ljava/lang/String;
    .restart local v27    # "firstAndroidId":Ljava/lang/String;
    .restart local v28    # "headerAttributes":Lorg/json/JSONObject;
    .restart local v29    # "headerBlob":Lorg/json/JSONObject;
    .restart local v34    # "lastSessionStartTime":J
    .restart local v36    # "openSessionUUID":Ljava/lang/String;
    .restart local v39    # "registrationId":Ljava/lang/String;
    .restart local v43    # "telephonyManager":Landroid/telephony/TelephonyManager;
    .restart local v47    # "userType":Ljava/lang/String;
    :cond_11
    const/4 v6, 0x0

    goto/16 :goto_0

    .line 913
    .restart local v26    # "firstAdvertisingId":Ljava/lang/String;
    .restart local v44    # "time":Ljava/util/Date;
    .restart local v46    # "tz":Ljava/util/TimeZone;
    :cond_12
    :try_start_3
    invoke-virtual/range {v46 .. v46}, Ljava/util/TimeZone;->getRawOffset()I
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    move-result v45

    goto/16 :goto_1

    .line 936
    .end local v12    # "advertisingInfo":Lcom/localytics/android/DatapointHelper$AdvertisingInfo;
    .end local v19    # "deviceID":Ljava/lang/String;
    .end local v25    # "fbAttribution":Ljava/lang/String;
    .end local v26    # "firstAdvertisingId":Ljava/lang/String;
    .end local v27    # "firstAndroidId":Ljava/lang/String;
    .end local v39    # "registrationId":Ljava/lang/String;
    .end local v44    # "time":Ljava/util/Date;
    .end local v46    # "tz":Ljava/util/TimeZone;
    :catchall_0
    move-exception v6

    if-eqz v15, :cond_13

    .line 938
    :try_start_4
    invoke-interface {v15}, Landroid/database/Cursor;->close()V

    .line 939
    const/4 v15, 0x0

    :cond_13
    throw v6

    .line 1074
    .end local v14    # "appContext":Landroid/content/Context;
    .end local v15    # "cursor":Landroid/database/Cursor;
    .end local v18    # "customerID":Ljava/lang/String;
    .end local v28    # "headerAttributes":Lorg/json/JSONObject;
    .end local v29    # "headerBlob":Lorg/json/JSONObject;
    .end local v34    # "lastSessionStartTime":J
    .end local v36    # "openSessionUUID":Ljava/lang/String;
    .end local v43    # "telephonyManager":Landroid/telephony/TelephonyManager;
    .end local v47    # "userType":Ljava/lang/String;
    :catch_0
    move-exception v6

    goto :goto_5

    .line 971
    .restart local v14    # "appContext":Landroid/content/Context;
    .restart local v15    # "cursor":Landroid/database/Cursor;
    .restart local v16    # "currentTime":J
    .restart local v18    # "customerID":Ljava/lang/String;
    .restart local v20    # "elapsedTime":J
    .restart local v22    # "eventBlob":Lorg/json/JSONObject;
    .restart local v23    # "eventUUID":Ljava/lang/String;
    .restart local v24    # "eventValues":Landroid/content/ContentValues;
    .restart local v28    # "headerAttributes":Lorg/json/JSONObject;
    .restart local v29    # "headerBlob":Lorg/json/JSONObject;
    .restart local v32    # "identifiers":Lorg/json/JSONObject;
    .restart local v33    # "infoValues":Landroid/content/ContentValues;
    .restart local v34    # "lastSessionStartTime":J
    .restart local v36    # "openSessionUUID":Ljava/lang/String;
    .restart local v43    # "telephonyManager":Landroid/telephony/TelephonyManager;
    .restart local v47    # "userType":Ljava/lang/String;
    :cond_14
    const-wide/16 v6, 0x0

    cmp-long v6, v20, v6

    if-lez v6, :cond_d

    .line 973
    const-string v6, "sl"

    const-wide/16 v8, 0x3e8

    div-long v8, v20, v8

    long-to-double v8, v8

    invoke-static {v8, v9}, Ljava/lang/Math;->round(D)J

    move-result-wide v8

    move-object/from16 v0, v22

    invoke-virtual {v0, v6, v8, v9}, Lorg/json/JSONObject;->put(Ljava/lang/String;J)Lorg/json/JSONObject;

    goto/16 :goto_2

    .line 995
    .end local v20    # "elapsedTime":J
    :cond_15
    const-string v6, "close"

    move-object/from16 v0, p1

    invoke-virtual {v6, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_17

    .line 997
    const-string v6, "dt"

    const-string v7, "c"

    move-object/from16 v0, v22

    invoke-virtual {v0, v6, v7}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 998
    const-string v6, "u"

    move-object/from16 v0, v22

    move-object/from16 v1, v23

    invoke-virtual {v0, v6, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 999
    const-string v6, "su"

    move-object/from16 v0, v22

    move-object/from16 v1, v36

    invoke-virtual {v0, v6, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 1000
    const-string v6, "ss"

    const-wide/16 v8, 0x3e8

    div-long v8, v34, v8

    long-to-double v8, v8

    invoke-static {v8, v9}, Ljava/lang/Math;->round(D)J

    move-result-wide v8

    move-object/from16 v0, v22

    invoke-virtual {v0, v6, v8, v9}, Lorg/json/JSONObject;->put(Ljava/lang/String;J)Lorg/json/JSONObject;

    .line 1001
    const-string v6, "ct"

    const-wide/16 v8, 0x3e8

    div-long v8, v16, v8

    long-to-double v8, v8

    invoke-static {v8, v9}, Ljava/lang/Math;->round(D)J

    move-result-wide v8

    move-object/from16 v0, v22

    invoke-virtual {v0, v6, v8, v9}, Lorg/json/JSONObject;->put(Ljava/lang/String;J)Lorg/json/JSONObject;

    .line 1002
    const-string v6, "ctl"

    sub-long v8, v16, v34

    const-wide/16 v10, 0x3e8

    div-long/2addr v8, v10

    long-to-double v8, v8

    invoke-static {v8, v9}, Ljava/lang/Math;->round(D)J

    move-result-wide v8

    move-object/from16 v0, v22

    invoke-virtual {v0, v6, v8, v9}, Lorg/json/JSONObject;->put(Ljava/lang/String;J)Lorg/json/JSONObject;

    .line 1004
    new-instance v40, Lorg/json/JSONArray;

    move-object/from16 v0, p0

    iget-object v6, v0, Lcom/localytics/android/AnalyticsHandler;->screenFlow:Ljava/util/List;

    move-object/from16 v0, v40

    invoke-direct {v0, v6}, Lorg/json/JSONArray;-><init>(Ljava/util/Collection;)V

    .line 1005
    .local v40, "screens":Lorg/json/JSONArray;
    invoke-virtual/range {v40 .. v40}, Lorg/json/JSONArray;->length()I

    move-result v6

    if-lez v6, :cond_16

    .line 1007
    const-string v6, "fl"

    move-object/from16 v0, v22

    move-object/from16 v1, v40

    invoke-virtual {v0, v6, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 1010
    :cond_16
    move-object/from16 v0, p0

    move-object/from16 v1, v22

    move-object/from16 v2, v32

    move-object/from16 v3, v18

    move-object/from16 v4, v47

    invoke-direct {v0, v1, v2, v3, v4}, Lcom/localytics/android/AnalyticsHandler;->_addLocationIDsAndCustomDimensions(Lorg/json/JSONObject;Lorg/json/JSONObject;Ljava/lang/String;Ljava/lang/String;)V

    .line 1012
    const-string v6, "last_session_close_time"

    invoke-static/range {v16 .. v17}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v7

    move-object/from16 v0, v33

    invoke-virtual {v0, v6, v7}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Long;)V

    .line 1013
    const-string v6, "queued_close_session_blob"

    const-string v7, "%s\n%s"

    const/4 v8, 0x2

    new-array v8, v8, [Ljava/lang/Object;

    const/4 v9, 0x0

    invoke-virtual/range {v29 .. v29}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v10

    aput-object v10, v8, v9

    const/4 v9, 0x1

    invoke-virtual/range {v22 .. v22}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v10

    aput-object v10, v8, v9

    invoke-static {v7, v8}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v7

    move-object/from16 v0, v33

    invoke-virtual {v0, v6, v7}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 1014
    const-string v6, "queued_close_session_blob_upload_format"

    sget-object v7, Lcom/localytics/android/AnalyticsProvider$EventsV3Columns$UploadFormat;->V2:Lcom/localytics/android/AnalyticsProvider$EventsV3Columns$UploadFormat;

    invoke-virtual {v7}, Lcom/localytics/android/AnalyticsProvider$EventsV3Columns$UploadFormat;->getValue()I

    move-result v7

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    move-object/from16 v0, v33

    invoke-virtual {v0, v6, v7}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    goto/16 :goto_3

    .line 1016
    .end local v40    # "screens":Lorg/json/JSONArray;
    :cond_17
    const-string v6, "opt_in"

    move-object/from16 v0, p1

    invoke-virtual {v6, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-nez v6, :cond_18

    const-string v6, "opt_out"

    move-object/from16 v0, p1

    invoke-virtual {v6, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_1a

    .line 1018
    :cond_18
    const-string v6, "dt"

    const-string v7, "o"

    move-object/from16 v0, v22

    invoke-virtual {v0, v6, v7}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 1019
    const-string v6, "u"

    move-object/from16 v0, p0

    iget-object v7, v0, Lcom/localytics/android/AnalyticsHandler;->mLocalyticsDao:Lcom/localytics/android/LocalyticsDao;

    invoke-interface {v7}, Lcom/localytics/android/LocalyticsDao;->getApiKey()Ljava/lang/String;

    move-result-object v7

    move-object/from16 v0, v22

    invoke-virtual {v0, v6, v7}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 1020
    const-string v7, "out"

    const-string v6, "opt_out"

    move-object/from16 v0, p1

    invoke-virtual {v6, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_19

    sget-object v6, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    invoke-virtual {v6}, Ljava/lang/Boolean;->toString()Ljava/lang/String;

    move-result-object v6

    :goto_6
    move-object/from16 v0, v22

    invoke-virtual {v0, v7, v6}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 1021
    const-string v6, "ct"

    const-wide/16 v8, 0x3e8

    div-long v8, v16, v8

    long-to-double v8, v8

    invoke-static {v8, v9}, Ljava/lang/Math;->round(D)J

    move-result-wide v8

    move-object/from16 v0, v22

    invoke-virtual {v0, v6, v8, v9}, Lorg/json/JSONObject;->put(Ljava/lang/String;J)Lorg/json/JSONObject;

    .line 1023
    const-string v6, "blob"

    const-string v7, "%s\n%s"

    const/4 v8, 0x2

    new-array v8, v8, [Ljava/lang/Object;

    const/4 v9, 0x0

    invoke-virtual/range {v29 .. v29}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v10

    aput-object v10, v8, v9

    const/4 v9, 0x1

    invoke-virtual/range {v22 .. v22}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v10

    aput-object v10, v8, v9

    invoke-static {v7, v8}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v7

    move-object/from16 v0, v24

    invoke-virtual {v0, v6, v7}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 1024
    const-string v6, "upload_format"

    sget-object v7, Lcom/localytics/android/AnalyticsProvider$EventsV3Columns$UploadFormat;->V2:Lcom/localytics/android/AnalyticsProvider$EventsV3Columns$UploadFormat;

    invoke-virtual {v7}, Lcom/localytics/android/AnalyticsProvider$EventsV3Columns$UploadFormat;->getValue()I

    move-result v7

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    move-object/from16 v0, v24

    invoke-virtual {v0, v6, v7}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    goto/16 :goto_3

    .line 1020
    :cond_19
    sget-object v6, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    invoke-virtual {v6}, Ljava/lang/Boolean;->toString()Ljava/lang/String;

    move-result-object v6

    goto :goto_6

    .line 1031
    :cond_1a
    const-string v6, "dt"

    const-string v7, "e"

    move-object/from16 v0, v22

    invoke-virtual {v0, v6, v7}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 1032
    const-string v6, "ct"

    const-wide/16 v8, 0x3e8

    div-long v8, v16, v8

    long-to-double v8, v8

    invoke-static {v8, v9}, Ljava/lang/Math;->round(D)J

    move-result-wide v8

    move-object/from16 v0, v22

    invoke-virtual {v0, v6, v8, v9}, Lorg/json/JSONObject;->put(Ljava/lang/String;J)Lorg/json/JSONObject;

    .line 1033
    const-string v6, "u"

    move-object/from16 v0, v22

    move-object/from16 v1, v23

    invoke-virtual {v0, v6, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 1034
    const-string v6, "su"

    invoke-direct/range {p0 .. p0}, Lcom/localytics/android/AnalyticsHandler;->_isSessionOpen()Z

    move-result v7

    if-eqz v7, :cond_1d

    .end local v36    # "openSessionUUID":Ljava/lang/String;
    :goto_7
    move-object/from16 v0, v22

    move-object/from16 v1, v36

    invoke-virtual {v0, v6, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 1035
    invoke-virtual {v14}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v6

    move-object/from16 v0, p1

    invoke-virtual {v0, v6}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v6

    if-eqz v6, :cond_1e

    .line 1037
    const-string v6, "n"

    invoke-virtual {v14}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/String;->length()I

    move-result v7

    add-int/lit8 v7, v7, 0x1

    invoke-virtual/range {p1 .. p1}, Ljava/lang/String;->length()I

    move-result v8

    move-object/from16 v0, p1

    invoke-virtual {v0, v7, v8}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v7

    move-object/from16 v0, v22

    invoke-virtual {v0, v6, v7}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 1047
    :goto_8
    invoke-virtual/range {p3 .. p3}, Ljava/lang/Long;->longValue()J

    move-result-wide v6

    const-wide/16 v8, 0x0

    cmp-long v6, v6, v8

    if-eqz v6, :cond_1b

    .line 1049
    const-string v6, "v"

    move-object/from16 v0, v22

    move-object/from16 v1, p3

    invoke-virtual {v0, v6, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 1052
    :cond_1b
    move-object/from16 v0, p0

    move-object/from16 v1, v22

    move-object/from16 v2, v32

    move-object/from16 v3, v18

    move-object/from16 v4, v47

    invoke-direct {v0, v1, v2, v3, v4}, Lcom/localytics/android/AnalyticsHandler;->_addLocationIDsAndCustomDimensions(Lorg/json/JSONObject;Lorg/json/JSONObject;Ljava/lang/String;Ljava/lang/String;)V

    .line 1054
    if-eqz p2, :cond_1c

    .line 1056
    const-string v6, "attrs"

    new-instance v7, Lorg/json/JSONObject;

    move-object/from16 v0, p2

    invoke-direct {v7, v0}, Lorg/json/JSONObject;-><init>(Ljava/util/Map;)V

    move-object/from16 v0, v22

    invoke-virtual {v0, v6, v7}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 1059
    :cond_1c
    const-string v6, "blob"

    const-string v7, "%s\n%s"

    const/4 v8, 0x2

    new-array v8, v8, [Ljava/lang/Object;

    const/4 v9, 0x0

    invoke-virtual/range {v29 .. v29}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v10

    aput-object v10, v8, v9

    const/4 v9, 0x1

    invoke-virtual/range {v22 .. v22}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v10

    aput-object v10, v8, v9

    invoke-static {v7, v8}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v7

    move-object/from16 v0, v24

    invoke-virtual {v0, v6, v7}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 1060
    const-string v6, "upload_format"

    sget-object v7, Lcom/localytics/android/AnalyticsProvider$EventsV3Columns$UploadFormat;->V2:Lcom/localytics/android/AnalyticsProvider$EventsV3Columns$UploadFormat;

    invoke-virtual {v7}, Lcom/localytics/android/AnalyticsProvider$EventsV3Columns$UploadFormat;->getValue()I

    move-result v7

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    move-object/from16 v0, v24

    invoke-virtual {v0, v6, v7}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    goto/16 :goto_3

    .line 1034
    .restart local v36    # "openSessionUUID":Ljava/lang/String;
    :cond_1d
    const-string v36, ""

    goto/16 :goto_7

    .line 1041
    .end local v36    # "openSessionUUID":Ljava/lang/String;
    :cond_1e
    const-string v6, "n"

    move-object/from16 v0, v22

    move-object/from16 v1, p1

    invoke-virtual {v0, v6, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    goto :goto_8

    .line 1071
    :cond_1f
    invoke-virtual/range {p3 .. p3}, Ljava/lang/Long;->longValue()J
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_0

    move-result-wide v8

    goto/16 :goto_4
.end method

.method private _tagScreen(Ljava/lang/String;)V
    .locals 2
    .param p1, "screen"    # Ljava/lang/String;

    .prologue
    .line 1199
    invoke-direct {p0}, Lcom/localytics/android/AnalyticsHandler;->_isSessionOpen()Z

    move-result v0

    if-eqz v0, :cond_2

    .line 1201
    iget-object v0, p0, Lcom/localytics/android/AnalyticsHandler;->screenFlow:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/localytics/android/AnalyticsHandler;->screenFlow:Ljava/util/List;

    iget-object v1, p0, Lcom/localytics/android/AnalyticsHandler;->screenFlow:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    add-int/lit8 v1, v1, -0x1

    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_1

    .line 1203
    :cond_0
    iget-object v0, p0, Lcom/localytics/android/AnalyticsHandler;->screenFlow:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1210
    :cond_1
    :goto_0
    return-void

    .line 1208
    :cond_2
    const-string v0, "Screen not tagged because a session is not open"

    invoke-static {v0}, Lcom/localytics/android/Localytics$Log;->w(Ljava/lang/String;)I

    goto :goto_0
.end method

.method private _updateHeaderForTestModeAttribution(Ljava/lang/String;Lorg/json/JSONObject;Lcom/localytics/android/DatapointHelper$AdvertisingInfo;Z)V
    .locals 16
    .param p1, "playAttribution"    # Ljava/lang/String;
    .param p2, "headerAttributes"    # Lorg/json/JSONObject;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p3, "advertisingInfo"    # Lcom/localytics/android/DatapointHelper$AdvertisingInfo;
    .param p4, "ignoreFirstSession"    # Z

    .prologue
    .line 1082
    move-object/from16 v0, p0

    iget-boolean v13, v0, Lcom/localytics/android/AnalyticsHandler;->mSentReferrerTestMode:Z

    if-nez v13, :cond_6

    .line 1090
    invoke-static/range {p1 .. p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v13

    if-nez v13, :cond_3

    .line 1092
    invoke-static/range {p1 .. p1}, Ljava/net/URLDecoder;->decode(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v13

    const-string v14, "[&]"

    invoke-virtual {v13, v14}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v4

    .line 1093
    .local v4, "attributions":[Ljava/lang/String;
    move-object v2, v4

    .local v2, "arr$":[Ljava/lang/String;
    array-length v11, v2

    .local v11, "len$":I
    const/4 v8, 0x0

    .local v8, "i$":I
    :goto_0
    if-ge v8, v11, :cond_3

    aget-object v3, v2, v8

    .line 1095
    .local v3, "attribution":Ljava/lang/String;
    const-string v13, "[=]"

    invoke-virtual {v3, v13}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v10

    .line 1096
    .local v10, "keyValue":[Ljava/lang/String;
    array-length v13, v10

    const/4 v14, 0x1

    if-le v13, v14, :cond_1

    .line 1098
    const/4 v13, 0x0

    aget-object v13, v10, v13

    invoke-virtual {v13}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v9

    .local v9, "key":Ljava/lang/String;
    const/4 v13, 0x1

    aget-object v13, v10, v13

    invoke-virtual {v13}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v12

    .line 1099
    .local v12, "value":Ljava/lang/String;
    const-string v13, "localytics_test_mode"

    invoke-virtual {v9, v13}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v13

    if-eqz v13, :cond_2

    const-string v13, "1"

    invoke-virtual {v12, v13}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v13

    if-nez v13, :cond_0

    const-string v13, "true"

    invoke-virtual {v12, v13}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v13

    if-eqz v13, :cond_2

    :cond_0
    const/4 v13, 0x1

    :goto_1
    move-object/from16 v0, p0

    iput-boolean v13, v0, Lcom/localytics/android/AnalyticsHandler;->mReferrerTestModeEnabled:Z

    .line 1093
    .end local v9    # "key":Ljava/lang/String;
    .end local v12    # "value":Ljava/lang/String;
    :cond_1
    add-int/lit8 v8, v8, 0x1

    goto :goto_0

    .line 1099
    .restart local v9    # "key":Ljava/lang/String;
    .restart local v12    # "value":Ljava/lang/String;
    :cond_2
    const/4 v13, 0x0

    goto :goto_1

    .line 1103
    .end local v2    # "arr$":[Ljava/lang/String;
    .end local v3    # "attribution":Ljava/lang/String;
    .end local v4    # "attributions":[Ljava/lang/String;
    .end local v8    # "i$":I
    .end local v9    # "key":Ljava/lang/String;
    .end local v10    # "keyValue":[Ljava/lang/String;
    .end local v11    # "len$":I
    .end local v12    # "value":Ljava/lang/String;
    :cond_3
    if-nez p4, :cond_4

    move-object/from16 v0, p0

    iget-boolean v13, v0, Lcom/localytics/android/AnalyticsHandler;->mFirstSessionEver:Z

    if-eqz v13, :cond_6

    :cond_4
    move-object/from16 v0, p0

    iget-boolean v13, v0, Lcom/localytics/android/AnalyticsHandler;->mReferrerTestModeEnabled:Z

    if-eqz v13, :cond_6

    .line 1107
    :try_start_0
    const-string v13, "[REFERRAL] using fake id for attribution test mode"

    invoke-static {v13}, Lcom/localytics/android/Localytics$Log;->i(Ljava/lang/String;)I

    .line 1108
    new-instance v13, Ljava/security/SecureRandom;

    invoke-direct {v13}, Ljava/security/SecureRandom;-><init>()V

    invoke-virtual {v13}, Ljava/security/SecureRandom;->nextLong()J

    move-result-wide v14

    invoke-static {v14, v15}, Ljava/lang/Long;->toHexString(J)Ljava/lang/String;

    move-result-object v7

    .line 1109
    .local v7, "fakeDeviceID":Ljava/lang/String;
    const-string v13, "aid"

    move-object/from16 v0, p2

    invoke-virtual {v0, v13, v7}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 1110
    const-string v13, "du"

    invoke-static {v7}, Lcom/localytics/android/DatapointHelper;->getSha256_buggy(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v14

    move-object/from16 v0, p2

    invoke-virtual {v0, v13, v14}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 1111
    const-string v13, "caid"

    move-object/from16 v0, p2

    invoke-virtual {v0, v13, v7}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 1112
    if-eqz p3, :cond_5

    .line 1114
    invoke-static {}, Ljava/util/UUID;->randomUUID()Ljava/util/UUID;

    move-result-object v13

    invoke-virtual {v13}, Ljava/util/UUID;->toString()Ljava/lang/String;

    move-result-object v6

    .line 1115
    .local v6, "fakeAdvertisingId":Ljava/lang/String;
    const-string v13, "gadid"

    move-object/from16 v0, p2

    invoke-virtual {v0, v13, v6}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 1116
    const-string v13, "gcadid"

    move-object/from16 v0, p2

    invoke-virtual {v0, v13, v6}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 1118
    .end local v6    # "fakeAdvertisingId":Ljava/lang/String;
    :cond_5
    const/4 v13, 0x1

    move-object/from16 v0, p0

    iput-boolean v13, v0, Lcom/localytics/android/AnalyticsHandler;->mSentReferrerTestMode:Z
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 1126
    .end local v7    # "fakeDeviceID":Ljava/lang/String;
    :cond_6
    :goto_2
    return-void

    .line 1120
    :catch_0
    move-exception v5

    .line 1122
    .local v5, "e":Lorg/json/JSONException;
    const-class v13, Lorg/json/JSONException;

    const-string v14, "Exception adding values to object"

    invoke-static {v13, v14}, Lcom/localytics/android/LocalyticsManager;->throwOrLogError(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Object;

    goto :goto_2
.end method

.method static synthetic access$000(Lcom/localytics/android/AnalyticsHandler;)Z
    .locals 1
    .param p0, "x0"    # Lcom/localytics/android/AnalyticsHandler;

    .prologue
    .line 42
    invoke-direct {p0}, Lcom/localytics/android/AnalyticsHandler;->_isPushDisabled()Z

    move-result v0

    return v0
.end method

.method static synthetic access$1000(Lcom/localytics/android/AnalyticsHandler;I)V
    .locals 0
    .param p0, "x0"    # Lcom/localytics/android/AnalyticsHandler;
    .param p1, "x1"    # I

    .prologue
    .line 42
    invoke-direct {p0, p1}, Lcom/localytics/android/AnalyticsHandler;->_setPushDisabled(I)V

    return-void
.end method

.method static synthetic access$1100(Lcom/localytics/android/AnalyticsHandler;Z)V
    .locals 0
    .param p0, "x0"    # Lcom/localytics/android/AnalyticsHandler;
    .param p1, "x1"    # Z

    .prologue
    .line 42
    invoke-direct {p0, p1}, Lcom/localytics/android/AnalyticsHandler;->_setOptedOut(Z)V

    return-void
.end method

.method static synthetic access$1200(Lcom/localytics/android/AnalyticsHandler;Ljava/lang/String;)V
    .locals 0
    .param p0, "x0"    # Lcom/localytics/android/AnalyticsHandler;
    .param p1, "x1"    # Ljava/lang/String;

    .prologue
    .line 42
    invoke-direct {p0, p1}, Lcom/localytics/android/AnalyticsHandler;->_registerPush(Ljava/lang/String;)V

    return-void
.end method

.method static synthetic access$1300(Lcom/localytics/android/AnalyticsHandler;Landroid/content/Intent;)V
    .locals 0
    .param p0, "x0"    # Lcom/localytics/android/AnalyticsHandler;
    .param p1, "x1"    # Landroid/content/Intent;

    .prologue
    .line 42
    invoke-direct {p0, p1}, Lcom/localytics/android/AnalyticsHandler;->_handlePushRegistration(Landroid/content/Intent;)V

    return-void
.end method

.method static synthetic access$1400(Lcom/localytics/android/AnalyticsHandler;Ljava/lang/String;)V
    .locals 0
    .param p0, "x0"    # Lcom/localytics/android/AnalyticsHandler;
    .param p1, "x1"    # Ljava/lang/String;

    .prologue
    .line 42
    invoke-direct {p0, p1}, Lcom/localytics/android/AnalyticsHandler;->_setReferrerId(Ljava/lang/String;)V

    return-void
.end method

.method static synthetic access$1500(Lcom/localytics/android/AnalyticsHandler;I)Ljava/lang/String;
    .locals 1
    .param p0, "x0"    # Lcom/localytics/android/AnalyticsHandler;
    .param p1, "x1"    # I

    .prologue
    .line 42
    invoke-direct {p0, p1}, Lcom/localytics/android/AnalyticsHandler;->_getCustomDimension(I)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$1600()[Ljava/lang/String;
    .locals 1

    .prologue
    .line 42
    sget-object v0, Lcom/localytics/android/AnalyticsHandler;->PROJECTION_SET_IDENTIFIER:[Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$1700()Ljava/lang/String;
    .locals 1

    .prologue
    .line 42
    sget-object v0, Lcom/localytics/android/AnalyticsHandler;->SELECTION_SET_IDENTIFIER:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$200(Lcom/localytics/android/AnalyticsHandler;)Z
    .locals 1
    .param p0, "x0"    # Lcom/localytics/android/AnalyticsHandler;

    .prologue
    .line 42
    invoke-direct {p0}, Lcom/localytics/android/AnalyticsHandler;->_isOptedOut()Z

    move-result v0

    return v0
.end method

.method static synthetic access$300(Lcom/localytics/android/AnalyticsHandler;)V
    .locals 0
    .param p0, "x0"    # Lcom/localytics/android/AnalyticsHandler;

    .prologue
    .line 42
    invoke-direct {p0}, Lcom/localytics/android/AnalyticsHandler;->_open()V

    return-void
.end method

.method static synthetic access$400(Lcom/localytics/android/AnalyticsHandler;)V
    .locals 0
    .param p0, "x0"    # Lcom/localytics/android/AnalyticsHandler;

    .prologue
    .line 42
    invoke-direct {p0}, Lcom/localytics/android/AnalyticsHandler;->_close()V

    return-void
.end method

.method static synthetic access$500(Lcom/localytics/android/AnalyticsHandler;Ljava/lang/String;Ljava/util/Map;Ljava/lang/Long;)V
    .locals 0
    .param p0, "x0"    # Lcom/localytics/android/AnalyticsHandler;
    .param p1, "x1"    # Ljava/lang/String;
    .param p2, "x2"    # Ljava/util/Map;
    .param p3, "x3"    # Ljava/lang/Long;

    .prologue
    .line 42
    invoke-direct {p0, p1, p2, p3}, Lcom/localytics/android/AnalyticsHandler;->_tagEvent(Ljava/lang/String;Ljava/util/Map;Ljava/lang/Long;)V

    return-void
.end method

.method static synthetic access$600(Lcom/localytics/android/AnalyticsHandler;Ljava/lang/String;)V
    .locals 0
    .param p0, "x0"    # Lcom/localytics/android/AnalyticsHandler;
    .param p1, "x1"    # Ljava/lang/String;

    .prologue
    .line 42
    invoke-direct {p0, p1}, Lcom/localytics/android/AnalyticsHandler;->_tagScreen(Ljava/lang/String;)V

    return-void
.end method

.method static synthetic access$700(Lcom/localytics/android/AnalyticsHandler;ILjava/lang/String;)V
    .locals 0
    .param p0, "x0"    # Lcom/localytics/android/AnalyticsHandler;
    .param p1, "x1"    # I
    .param p2, "x2"    # Ljava/lang/String;

    .prologue
    .line 42
    invoke-direct {p0, p1, p2}, Lcom/localytics/android/AnalyticsHandler;->_setCustomDimension(ILjava/lang/String;)V

    return-void
.end method

.method static synthetic access$800(Lcom/localytics/android/AnalyticsHandler;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0
    .param p0, "x0"    # Lcom/localytics/android/AnalyticsHandler;
    .param p1, "x1"    # Ljava/lang/String;
    .param p2, "x2"    # Ljava/lang/String;

    .prologue
    .line 42
    invoke-direct {p0, p1, p2}, Lcom/localytics/android/AnalyticsHandler;->_setIdentifier(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method static synthetic access$900(Lcom/localytics/android/AnalyticsHandler;Ljava/lang/String;)V
    .locals 0
    .param p0, "x0"    # Lcom/localytics/android/AnalyticsHandler;
    .param p1, "x1"    # Ljava/lang/String;

    .prologue
    .line 42
    invoke-direct {p0, p1}, Lcom/localytics/android/AnalyticsHandler;->_setPushID(Ljava/lang/String;)V

    return-void
.end method

.method private getCustomDimensionAttributeKey(I)Ljava/lang/String;
    .locals 4
    .param p1, "index"    # I

    .prologue
    const/16 v3, 0xa

    .line 768
    if-ltz p1, :cond_0

    if-gt p1, v3, :cond_0

    .line 770
    const-string v0, "%s%s"

    const/4 v1, 0x2

    new-array v1, v1, [Ljava/lang/Object;

    const/4 v2, 0x0

    const-string v3, "custom_dimension_"

    aput-object v3, v1, v2

    const/4 v2, 0x1

    invoke-static {p1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v3

    aput-object v3, v1, v2

    invoke-static {v0, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    .line 774
    :goto_0
    return-object v0

    :cond_0
    const-class v0, Ljava/lang/IndexOutOfBoundsException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Custom dimension index cannot exceed "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-static {v3}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/localytics/android/LocalyticsManager;->throwOrLogError(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    goto :goto_0
.end method


# virtual methods
.method protected _deleteUploadedData(I)V
    .locals 4
    .param p1, "maxRowToDelete"    # I

    .prologue
    .line 514
    iget-object v0, p0, Lcom/localytics/android/AnalyticsHandler;->mProvider:Lcom/localytics/android/BaseProvider;

    const-string v1, "events"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "_id <= "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    const/4 v3, 0x0

    invoke-virtual {v0, v1, v2, v3}, Lcom/localytics/android/BaseProvider;->remove(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)I

    .line 515
    return-void
.end method

.method protected _getDataToUpload()Ljava/util/TreeMap;
    .locals 10
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/TreeMap",
            "<",
            "Ljava/lang/Integer;",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation

    .prologue
    .line 590
    new-instance v9, Ljava/util/TreeMap;

    invoke-direct {v9}, Ljava/util/TreeMap;-><init>()V

    .line 591
    .local v9, "eventsMap":Ljava/util/TreeMap;, "Ljava/util/TreeMap<Ljava/lang/Integer;Ljava/lang/Object;>;"
    const/4 v6, 0x0

    .line 594
    .local v6, "cursor":Landroid/database/Cursor;
    :try_start_0
    iget-object v0, p0, Lcom/localytics/android/AnalyticsHandler;->mProvider:Lcom/localytics/android/BaseProvider;

    const-string v1, "events"

    const/4 v2, 0x0

    const/4 v3, 0x0

    const/4 v4, 0x0

    const-string v5, "_id ASC"

    invoke-virtual/range {v0 .. v5}, Lcom/localytics/android/BaseProvider;->query(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v6

    .line 596
    :goto_0
    invoke-interface {v6}, Landroid/database/Cursor;->moveToNext()Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-virtual {v9}, Ljava/util/TreeMap;->size()I

    move-result v0

    const/16 v1, 0x64

    if-ge v0, v1, :cond_1

    .line 598
    const-string v0, "_id"

    invoke-interface {v6, v0}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v0

    invoke-interface {v6, v0}, Landroid/database/Cursor;->getInt(I)I

    move-result v8

    .line 599
    .local v8, "eventID":I
    const-string v0, "blob"

    invoke-interface {v6, v0}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v0

    invoke-interface {v6, v0}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v7

    .line 600
    .local v7, "eventBlob":Ljava/lang/String;
    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-virtual {v9, v0, v7}, Ljava/util/TreeMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_0

    .line 605
    .end local v7    # "eventBlob":Ljava/lang/String;
    .end local v8    # "eventID":I
    :catchall_0
    move-exception v0

    if-eqz v6, :cond_0

    .line 607
    invoke-interface {v6}, Landroid/database/Cursor;->close()V

    .line 608
    const/4 v6, 0x0

    .line 611
    :cond_0
    :goto_1
    return-object v9

    .line 605
    :cond_1
    if-eqz v6, :cond_0

    .line 607
    invoke-interface {v6}, Landroid/database/Cursor;->close()V

    .line 608
    const/4 v6, 0x0

    goto :goto_1
.end method

.method protected _getMaxRowToUpload()I
    .locals 9

    .prologue
    .line 565
    const/4 v7, 0x0

    .line 566
    .local v7, "numberOfAttributes":I
    const/4 v6, 0x0

    .line 569
    .local v6, "cursor":Landroid/database/Cursor;
    :try_start_0
    iget-object v0, p0, Lcom/localytics/android/AnalyticsHandler;->mProvider:Lcom/localytics/android/BaseProvider;

    const-string v1, "events"

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/String;

    const/4 v3, 0x0

    const-string v4, "_id"

    aput-object v4, v2, v3

    const/4 v3, 0x0

    const/4 v4, 0x0

    const-string v5, "_id ASC"

    invoke-virtual/range {v0 .. v5}, Lcom/localytics/android/BaseProvider;->query(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v6

    .line 570
    invoke-interface {v6}, Landroid/database/Cursor;->moveToLast()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 572
    const-string v0, "_id"

    invoke-interface {v6, v0}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v0

    invoke-interface {v6, v0}, Landroid/database/Cursor;->getInt(I)I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result v7

    .line 577
    :cond_0
    if-eqz v6, :cond_1

    .line 579
    invoke-interface {v6}, Landroid/database/Cursor;->close()V

    .line 580
    const/4 v6, 0x0

    :cond_1
    move v8, v7

    .line 583
    .end local v7    # "numberOfAttributes":I
    .local v8, "numberOfAttributes":I
    :goto_0
    return v8

    .line 577
    .end local v8    # "numberOfAttributes":I
    .restart local v7    # "numberOfAttributes":I
    :catchall_0
    move-exception v0

    if-eqz v6, :cond_2

    .line 579
    invoke-interface {v6}, Landroid/database/Cursor;->close()V

    .line 580
    const/4 v6, 0x0

    :cond_2
    move v8, v7

    .line 583
    .end local v7    # "numberOfAttributes":I
    .restart local v8    # "numberOfAttributes":I
    goto :goto_0
.end method

.method protected _init()V
    .locals 3

    .prologue
    .line 1704
    iget-object v0, p0, Lcom/localytics/android/AnalyticsHandler;->mProvider:Lcom/localytics/android/BaseProvider;

    if-nez v0, :cond_0

    .line 1706
    new-instance v0, Lcom/localytics/android/AnalyticsProvider;

    iget-object v1, p0, Lcom/localytics/android/AnalyticsHandler;->siloName:Ljava/lang/String;

    invoke-virtual {v1}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v1

    iget-object v2, p0, Lcom/localytics/android/AnalyticsHandler;->mLocalyticsDao:Lcom/localytics/android/LocalyticsDao;

    invoke-direct {v0, v1, v2}, Lcom/localytics/android/AnalyticsProvider;-><init>(Ljava/lang/String;Lcom/localytics/android/LocalyticsDao;)V

    iput-object v0, p0, Lcom/localytics/android/AnalyticsHandler;->mProvider:Lcom/localytics/android/BaseProvider;

    .line 1709
    :cond_0
    invoke-virtual {p0}, Lcom/localytics/android/AnalyticsHandler;->_initApiKey()V

    .line 1710
    return-void
.end method

.method protected _initApiKey()V
    .locals 13

    .prologue
    const/4 v12, 0x0

    const/4 v11, 0x1

    .line 1714
    const/4 v7, 0x0

    .line 1717
    .local v7, "cursor":Landroid/database/Cursor;
    :try_start_0
    iget-object v0, p0, Lcom/localytics/android/AnalyticsHandler;->mLocalyticsDao:Lcom/localytics/android/LocalyticsDao;

    invoke-interface {v0}, Lcom/localytics/android/LocalyticsDao;->getAppContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Lcom/localytics/android/DatapointHelper;->getAppVersion(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v6

    .line 1718
    .local v6, "appVersion":Ljava/lang/String;
    iget-object v0, p0, Lcom/localytics/android/AnalyticsHandler;->mProvider:Lcom/localytics/android/BaseProvider;

    const-string v1, "info"

    const/4 v2, 0x4

    new-array v2, v2, [Ljava/lang/String;

    const/4 v3, 0x0

    const-string v4, "app_version"

    aput-object v4, v2, v3

    const/4 v3, 0x1

    const-string v4, "uuid"

    aput-object v4, v2, v3

    const/4 v3, 0x2

    const-string v4, "next_session_number"

    aput-object v4, v2, v3

    const/4 v3, 0x3

    const-string v4, "customer_id"

    aput-object v4, v2, v3

    const/4 v3, 0x0

    const/4 v4, 0x0

    const/4 v5, 0x0

    invoke-virtual/range {v0 .. v5}, Lcom/localytics/android/BaseProvider;->query(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v7

    .line 1720
    invoke-interface {v7}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v0

    if-eqz v0, :cond_6

    .line 1723
    const-string v0, "Loading details for API key %s"

    const/4 v1, 0x1

    new-array v1, v1, [Ljava/lang/Object;

    const/4 v2, 0x0

    iget-object v3, p0, Lcom/localytics/android/AnalyticsHandler;->mLocalyticsDao:Lcom/localytics/android/LocalyticsDao;

    invoke-interface {v3}, Lcom/localytics/android/LocalyticsDao;->getApiKey()Ljava/lang/String;

    move-result-object v3

    aput-object v3, v1, v2

    invoke-static {v0, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/localytics/android/Localytics$Log;->v(Ljava/lang/String;)I

    .line 1725
    new-instance v10, Landroid/content/ContentValues;

    invoke-direct {v10}, Landroid/content/ContentValues;-><init>()V

    .line 1726
    .local v10, "values":Landroid/content/ContentValues;
    const-string v0, "app_version"

    invoke-interface {v7, v0}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v0

    invoke-interface {v7, v0}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 1728
    const-string v0, "app_version"

    invoke-virtual {v10, v0, v6}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 1729
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/localytics/android/AnalyticsHandler;->mAppWasUpgraded:Z

    .line 1732
    :cond_0
    invoke-virtual {v10}, Landroid/content/ContentValues;->size()I

    move-result v0

    if-eqz v0, :cond_1

    .line 1734
    iget-object v0, p0, Lcom/localytics/android/AnalyticsHandler;->mProvider:Lcom/localytics/android/BaseProvider;

    const-string v1, "info"

    const/4 v2, 0x0

    const/4 v3, 0x0

    invoke-virtual {v0, v1, v10, v2, v3}, Lcom/localytics/android/BaseProvider;->update(Ljava/lang/String;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I

    .line 1737
    :cond_1
    const-string v0, "next_session_number"

    invoke-interface {v7, v0}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v0

    invoke-interface {v7, v0}, Landroid/database/Cursor;->getInt(I)I

    move-result v0

    if-ne v0, v11, :cond_4

    move v0, v11

    :goto_0
    iput-boolean v0, p0, Lcom/localytics/android/AnalyticsHandler;->mFirstSessionEver:Z

    .line 1738
    iget-object v0, p0, Lcom/localytics/android/AnalyticsHandler;->mLocalyticsDao:Lcom/localytics/android/LocalyticsDao;

    const-string v1, "uuid"

    invoke-interface {v7, v1}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v1

    invoke-interface {v7, v1}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1}, Lcom/localytics/android/LocalyticsDao;->setInstallationId(Ljava/lang/String;)V

    .line 1739
    const-string v0, "customer_id"

    invoke-interface {v7, v0}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v0

    invoke-interface {v7, v0}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v8

    .line 1740
    .local v8, "customerId":Ljava/lang/String;
    const-class v1, Lcom/localytics/android/LocalyticsManager;

    monitor-enter v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 1742
    :try_start_1
    iget-object v0, p0, Lcom/localytics/android/AnalyticsHandler;->mLocalyticsDao:Lcom/localytics/android/LocalyticsDao;

    const/4 v2, 0x1

    invoke-interface {v0, v2}, Lcom/localytics/android/LocalyticsDao;->getCustomerIdInMemory(Z)Ljava/lang/String;

    move-result-object v0

    if-nez v0, :cond_2

    .line 1744
    iget-object v0, p0, Lcom/localytics/android/AnalyticsHandler;->mLocalyticsDao:Lcom/localytics/android/LocalyticsDao;

    invoke-interface {v0, v8}, Lcom/localytics/android/LocalyticsDao;->setCustomerIdInMemory(Ljava/lang/String;)V

    .line 1746
    :cond_2
    monitor-exit v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 1786
    .end local v8    # "customerId":Ljava/lang/String;
    :goto_1
    if-eqz v7, :cond_3

    .line 1788
    invoke-interface {v7}, Landroid/database/Cursor;->close()V

    .line 1790
    :cond_3
    iget-object v0, p0, Lcom/localytics/android/AnalyticsHandler;->mLocalyticsDao:Lcom/localytics/android/LocalyticsDao;

    invoke-interface {v0}, Lcom/localytics/android/LocalyticsDao;->getCustomerIdInitiatedLatch()Ljava/util/concurrent/CountDownLatch;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/concurrent/CountDownLatch;->countDown()V

    .line 1793
    iget-object v0, p0, Lcom/localytics/android/AnalyticsHandler;->mProvider:Lcom/localytics/android/BaseProvider;

    invoke-virtual {v0}, Lcom/localytics/android/BaseProvider;->vacuumIfNecessary()V

    .line 1794
    return-void

    :cond_4
    move v0, v12

    .line 1737
    goto :goto_0

    .line 1746
    .restart local v8    # "customerId":Ljava/lang/String;
    :catchall_0
    move-exception v0

    :try_start_2
    monitor-exit v1
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    :try_start_3
    throw v0
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    .line 1786
    .end local v6    # "appVersion":Ljava/lang/String;
    .end local v8    # "customerId":Ljava/lang/String;
    .end local v10    # "values":Landroid/content/ContentValues;
    :catchall_1
    move-exception v0

    if-eqz v7, :cond_5

    .line 1788
    invoke-interface {v7}, Landroid/database/Cursor;->close()V

    .line 1790
    :cond_5
    iget-object v1, p0, Lcom/localytics/android/AnalyticsHandler;->mLocalyticsDao:Lcom/localytics/android/LocalyticsDao;

    invoke-interface {v1}, Lcom/localytics/android/LocalyticsDao;->getCustomerIdInitiatedLatch()Ljava/util/concurrent/CountDownLatch;

    move-result-object v1

    invoke-virtual {v1}, Ljava/util/concurrent/CountDownLatch;->countDown()V

    throw v0

    .line 1751
    .restart local v6    # "appVersion":Ljava/lang/String;
    :cond_6
    :try_start_4
    const-string v0, "Performing first-time initialization for new API key %s"

    const/4 v1, 0x1

    new-array v1, v1, [Ljava/lang/Object;

    const/4 v2, 0x0

    iget-object v3, p0, Lcom/localytics/android/AnalyticsHandler;->mLocalyticsDao:Lcom/localytics/android/LocalyticsDao;

    invoke-interface {v3}, Lcom/localytics/android/LocalyticsDao;->getApiKey()Ljava/lang/String;

    move-result-object v3

    aput-object v3, v1, v2

    invoke-static {v0, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/localytics/android/Localytics$Log;->v(Ljava/lang/String;)I

    .line 1753
    invoke-static {}, Ljava/util/UUID;->randomUUID()Ljava/util/UUID;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/UUID;->toString()Ljava/lang/String;

    move-result-object v9

    .line 1754
    .local v9, "installationID":Ljava/lang/String;
    iget-object v0, p0, Lcom/localytics/android/AnalyticsHandler;->mLocalyticsDao:Lcom/localytics/android/LocalyticsDao;

    invoke-interface {v0, v9}, Lcom/localytics/android/LocalyticsDao;->setInstallationId(Ljava/lang/String;)V

    .line 1755
    new-instance v10, Landroid/content/ContentValues;

    invoke-direct {v10}, Landroid/content/ContentValues;-><init>()V

    .line 1756
    .restart local v10    # "values":Landroid/content/ContentValues;
    const-string v0, "api_key"

    iget-object v1, p0, Lcom/localytics/android/AnalyticsHandler;->mLocalyticsDao:Lcom/localytics/android/LocalyticsDao;

    invoke-interface {v1}, Lcom/localytics/android/LocalyticsDao;->getApiKey()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v10, v0, v1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 1757
    const-string v0, "uuid"

    invoke-virtual {v10, v0, v9}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 1758
    const-string v0, "created_time"

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v1

    invoke-virtual {v10, v0, v1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Long;)V

    .line 1759
    const-string v0, "opt_out"

    sget-object v1, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    invoke-virtual {v10, v0, v1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Boolean;)V

    .line 1760
    const-string v0, "push_disabled"

    sget-object v1, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    invoke-virtual {v10, v0, v1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Boolean;)V

    .line 1761
    const-string v0, "customer_id"

    invoke-virtual {v10, v0, v9}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 1762
    const-string v0, "user_type"

    const-string v1, "anonymous"

    invoke-virtual {v10, v0, v1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 1763
    const-string v0, "fb_attribution"

    iget-object v1, p0, Lcom/localytics/android/AnalyticsHandler;->mLocalyticsDao:Lcom/localytics/android/LocalyticsDao;

    invoke-interface {v1}, Lcom/localytics/android/LocalyticsDao;->getAppContext()Landroid/content/Context;

    move-result-object v1

    invoke-static {v1}, Lcom/localytics/android/DatapointHelper;->getFBAttribution(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v10, v0, v1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 1764
    const-string v0, "first_android_id"

    iget-object v1, p0, Lcom/localytics/android/AnalyticsHandler;->mLocalyticsDao:Lcom/localytics/android/LocalyticsDao;

    invoke-interface {v1}, Lcom/localytics/android/LocalyticsDao;->getAppContext()Landroid/content/Context;

    move-result-object v1

    invoke-static {v1}, Lcom/localytics/android/DatapointHelper;->getAndroidIdOrNull(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v10, v0, v1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 1765
    const-string v0, "package_name"

    iget-object v1, p0, Lcom/localytics/android/AnalyticsHandler;->mLocalyticsDao:Lcom/localytics/android/LocalyticsDao;

    invoke-interface {v1}, Lcom/localytics/android/LocalyticsDao;->getAppContext()Landroid/content/Context;

    move-result-object v1

    invoke-virtual {v1}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v10, v0, v1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 1766
    const-string v0, "app_version"

    invoke-virtual {v10, v0, v6}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 1767
    const-string v0, "next_session_number"

    const/4 v1, 0x1

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v10, v0, v1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 1768
    const-string v0, "next_header_number"

    const/4 v1, 0x1

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v10, v0, v1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 1769
    const-string v0, "last_session_open_time"

    const/4 v1, 0x0

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v10, v0, v1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 1770
    const-string v0, "last_session_close_time"

    const/4 v1, 0x0

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v10, v0, v1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 1771
    iget-object v0, p0, Lcom/localytics/android/AnalyticsHandler;->mProvider:Lcom/localytics/android/BaseProvider;

    const-string v1, "info"

    invoke-virtual {v0, v1, v10}, Lcom/localytics/android/BaseProvider;->insert(Ljava/lang/String;Landroid/content/ContentValues;)J

    .line 1773
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/localytics/android/AnalyticsHandler;->mFirstSessionEver:Z

    .line 1775
    const-class v1, Lcom/localytics/android/LocalyticsManager;

    monitor-enter v1
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_1

    .line 1777
    :try_start_5
    iget-object v0, p0, Lcom/localytics/android/AnalyticsHandler;->mLocalyticsDao:Lcom/localytics/android/LocalyticsDao;

    const/4 v2, 0x1

    invoke-interface {v0, v2}, Lcom/localytics/android/LocalyticsDao;->getCustomerIdInMemory(Z)Ljava/lang/String;

    move-result-object v0

    if-nez v0, :cond_7

    .line 1779
    iget-object v0, p0, Lcom/localytics/android/AnalyticsHandler;->mLocalyticsDao:Lcom/localytics/android/LocalyticsDao;

    invoke-interface {v0, v9}, Lcom/localytics/android/LocalyticsDao;->setCustomerIdInMemory(Ljava/lang/String;)V

    .line 1781
    :cond_7
    monitor-exit v1

    goto/16 :goto_1

    :catchall_2
    move-exception v0

    monitor-exit v1
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_2

    :try_start_6
    throw v0
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_1
.end method

.method protected _onUploadCompleted(Ljava/lang/String;)V
    .locals 1
    .param p1, "responseBody"    # Ljava/lang/String;

    .prologue
    .line 559
    iget-object v0, p0, Lcom/localytics/android/AnalyticsHandler;->mProvider:Lcom/localytics/android/BaseProvider;

    invoke-virtual {v0}, Lcom/localytics/android/BaseProvider;->vacuumIfNecessary()V

    .line 560
    return-void
.end method

.method _replaceAttributionInFirstSession(Ljava/lang/String;)Ljava/lang/String;
    .locals 14
    .param p1, "referrerId"    # Ljava/lang/String;
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation

    .prologue
    const/4 v13, 0x0

    .line 1846
    const/4 v8, 0x0

    .line 1849
    .local v8, "cursor":Landroid/database/Cursor;
    :try_start_0
    iget-object v0, p0, Lcom/localytics/android/AnalyticsHandler;->mProvider:Lcom/localytics/android/BaseProvider;

    const-string v1, "info"

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/String;

    const/4 v3, 0x0

    const-string v4, "first_open_event_blob"

    aput-object v4, v2, v3

    const/4 v3, 0x0

    const/4 v4, 0x0

    const/4 v5, 0x0

    invoke-virtual/range {v0 .. v5}, Lcom/localytics/android/BaseProvider;->query(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v8

    .line 1851
    invoke-interface {v8}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 1853
    const-string v0, "first_open_event_blob"

    invoke-interface {v8, v0}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v0

    invoke-interface {v8, v0}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v10

    .line 1854
    .local v10, "firstEventBlob":Ljava/lang/String;
    invoke-static {v10}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_1

    .line 1859
    const-string v0, "[\n]"

    invoke-virtual {v10, v0}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result-object v7

    .line 1862
    .local v7, "blobs":[Ljava/lang/String;
    :try_start_1
    new-instance v12, Lorg/json/JSONObject;

    const/4 v0, 0x0

    aget-object v0, v7, v0

    invoke-direct {v12, v0}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 1863
    .local v12, "headerBlob":Lorg/json/JSONObject;
    const-string v0, "attrs"

    invoke-virtual {v12, v0}, Lorg/json/JSONObject;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v11

    check-cast v11, Lorg/json/JSONObject;

    .line 1865
    .local v11, "headerAttributes":Lorg/json/JSONObject;
    iget-object v0, p0, Lcom/localytics/android/AnalyticsHandler;->mLocalyticsDao:Lcom/localytics/android/LocalyticsDao;

    invoke-interface {v0}, Lcom/localytics/android/LocalyticsDao;->getAppContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Lcom/localytics/android/DatapointHelper;->getAdvertisingInfo(Landroid/content/Context;)Lcom/localytics/android/DatapointHelper$AdvertisingInfo;

    move-result-object v6

    .line 1866
    .local v6, "advertisingInfo":Lcom/localytics/android/DatapointHelper$AdvertisingInfo;
    const/4 v0, 0x1

    invoke-direct {p0, p1, v11, v6, v0}, Lcom/localytics/android/AnalyticsHandler;->_updateHeaderForTestModeAttribution(Ljava/lang/String;Lorg/json/JSONObject;Lcom/localytics/android/DatapointHelper$AdvertisingInfo;Z)V

    .line 1868
    const-string v0, "aurl"

    invoke-virtual {v11, v0, p1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 1869
    const-string v0, "%s\n%s"

    const/4 v1, 0x2

    new-array v1, v1, [Ljava/lang/Object;

    const/4 v2, 0x0

    invoke-virtual {v12}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v3

    aput-object v3, v1, v2

    const/4 v2, 0x1

    const/4 v3, 0x1

    aget-object v3, v7, v3

    aput-object v3, v1, v2

    invoke-static {v0, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;
    :try_end_1
    .catch Lorg/json/JSONException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    move-result-object v0

    .line 1880
    if-eqz v8, :cond_0

    .line 1882
    invoke-interface {v8}, Landroid/database/Cursor;->close()V

    .line 1886
    .end local v6    # "advertisingInfo":Lcom/localytics/android/DatapointHelper$AdvertisingInfo;
    .end local v7    # "blobs":[Ljava/lang/String;
    .end local v10    # "firstEventBlob":Ljava/lang/String;
    .end local v11    # "headerAttributes":Lorg/json/JSONObject;
    .end local v12    # "headerBlob":Lorg/json/JSONObject;
    :cond_0
    :goto_0
    return-object v0

    .line 1871
    .restart local v7    # "blobs":[Ljava/lang/String;
    .restart local v10    # "firstEventBlob":Ljava/lang/String;
    :catch_0
    move-exception v9

    .line 1873
    .local v9, "e":Lorg/json/JSONException;
    :try_start_2
    const-string v0, "JSONException"

    invoke-static {v0, v9}, Lcom/localytics/android/Localytics$Log;->e(Ljava/lang/String;Ljava/lang/Throwable;)I
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 1880
    .end local v7    # "blobs":[Ljava/lang/String;
    .end local v9    # "e":Lorg/json/JSONException;
    .end local v10    # "firstEventBlob":Ljava/lang/String;
    :cond_1
    if-eqz v8, :cond_2

    .line 1882
    invoke-interface {v8}, Landroid/database/Cursor;->close()V

    :cond_2
    move-object v0, v13

    .line 1886
    goto :goto_0

    .line 1880
    :catchall_0
    move-exception v0

    if-eqz v8, :cond_3

    .line 1882
    invoke-interface {v8}, Landroid/database/Cursor;->close()V

    :cond_3
    throw v0
.end method

.method closeSession()V
    .locals 1

    .prologue
    .line 1570
    const/16 v0, 0x66

    invoke-virtual {p0, v0}, Lcom/localytics/android/AnalyticsHandler;->obtainMessage(I)Landroid/os/Message;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/localytics/android/AnalyticsHandler;->queueMessage(Landroid/os/Message;)Z

    .line 1571
    return-void
.end method

.method getCustomDimension(I)Ljava/lang/String;
    .locals 1
    .param p1, "dimension"    # I

    .prologue
    .line 719
    new-instance v0, Lcom/localytics/android/AnalyticsHandler$15;

    invoke-direct {v0, p0, p1}, Lcom/localytics/android/AnalyticsHandler$15;-><init>(Lcom/localytics/android/AnalyticsHandler;I)V

    invoke-virtual {p0, v0}, Lcom/localytics/android/AnalyticsHandler;->getString(Ljava/util/concurrent/Callable;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method getIdentifier(Ljava/lang/String;)Ljava/lang/String;
    .locals 1
    .param p1, "key"    # Ljava/lang/String;

    .prologue
    .line 1538
    new-instance v0, Lcom/localytics/android/AnalyticsHandler$17;

    invoke-direct {v0, p0, p1}, Lcom/localytics/android/AnalyticsHandler$17;-><init>(Lcom/localytics/android/AnalyticsHandler;Ljava/lang/String;)V

    invoke-virtual {p0, v0}, Lcom/localytics/android/AnalyticsHandler;->getString(Ljava/util/concurrent/Callable;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method getIdentifiers()Ljava/util/Map;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    .line 188
    new-instance v0, Lcom/localytics/android/AnalyticsHandler$2;

    invoke-direct {v0, p0}, Lcom/localytics/android/AnalyticsHandler$2;-><init>(Lcom/localytics/android/AnalyticsHandler;)V

    invoke-virtual {p0, v0}, Lcom/localytics/android/AnalyticsHandler;->getMap(Ljava/util/concurrent/Callable;)Ljava/util/Map;

    move-result-object v0

    return-object v0
.end method

.method getPushRegistrationID()Ljava/lang/String;
    .locals 1

    .prologue
    .line 780
    new-instance v0, Lcom/localytics/android/AnalyticsHandler$16;

    invoke-direct {v0, p0}, Lcom/localytics/android/AnalyticsHandler$16;-><init>(Lcom/localytics/android/AnalyticsHandler;)V

    invoke-virtual {p0, v0}, Lcom/localytics/android/AnalyticsHandler;->getString(Ljava/util/concurrent/Callable;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method protected getUploadThread(Ljava/util/TreeMap;Ljava/lang/String;)Lcom/localytics/android/BaseUploadThread;
    .locals 2
    .param p2, "customerId"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/TreeMap",
            "<",
            "Ljava/lang/Integer;",
            "Ljava/lang/Object;",
            ">;",
            "Ljava/lang/String;",
            ")",
            "Lcom/localytics/android/BaseUploadThread;"
        }
    .end annotation

    .prologue
    .line 618
    .local p1, "data":Ljava/util/TreeMap;, "Ljava/util/TreeMap<Ljava/lang/Integer;Ljava/lang/Object;>;"
    new-instance v0, Lcom/localytics/android/AnalyticsUploadHandler;

    iget-object v1, p0, Lcom/localytics/android/AnalyticsHandler;->mLocalyticsDao:Lcom/localytics/android/LocalyticsDao;

    invoke-direct {v0, p0, p1, p2, v1}, Lcom/localytics/android/AnalyticsUploadHandler;-><init>(Lcom/localytics/android/BaseHandler;Ljava/util/TreeMap;Ljava/lang/String;Lcom/localytics/android/LocalyticsDao;)V

    return-object v0
.end method

.method protected handleMessageExtended(Landroid/os/Message;)V
    .locals 18
    .param p1, "msg"    # Landroid/os/Message;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 267
    move-object/from16 v0, p1

    iget v0, v0, Landroid/os/Message;->what:I

    move/from16 v16, v0

    packed-switch v16, :pswitch_data_0

    .line 505
    :pswitch_0
    invoke-super/range {p0 .. p1}, Lcom/localytics/android/BaseHandler;->handleMessageExtended(Landroid/os/Message;)V

    .line 509
    :goto_0
    return-void

    .line 271
    :pswitch_1
    const-string v16, "Analytics handler received MESSAGE_OPEN"

    invoke-static/range {v16 .. v16}, Lcom/localytics/android/Localytics$Log;->d(Ljava/lang/String;)I

    .line 273
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/localytics/android/AnalyticsHandler;->mProvider:Lcom/localytics/android/BaseProvider;

    move-object/from16 v16, v0

    new-instance v17, Lcom/localytics/android/AnalyticsHandler$3;

    invoke-direct/range {v17 .. v18}, Lcom/localytics/android/AnalyticsHandler$3;-><init>(Lcom/localytics/android/AnalyticsHandler;)V

    invoke-virtual/range {v16 .. v17}, Lcom/localytics/android/BaseProvider;->runBatchTransaction(Ljava/lang/Runnable;)V

    goto :goto_0

    .line 291
    :pswitch_2
    const-string v16, "Analytics handler received MESSAGE_CLOSE"

    invoke-static/range {v16 .. v16}, Lcom/localytics/android/Localytics$Log;->d(Ljava/lang/String;)I

    .line 293
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/localytics/android/AnalyticsHandler;->mProvider:Lcom/localytics/android/BaseProvider;

    move-object/from16 v16, v0

    new-instance v17, Lcom/localytics/android/AnalyticsHandler$4;

    invoke-direct/range {v17 .. v18}, Lcom/localytics/android/AnalyticsHandler$4;-><init>(Lcom/localytics/android/AnalyticsHandler;)V

    invoke-virtual/range {v16 .. v17}, Lcom/localytics/android/BaseProvider;->runBatchTransaction(Ljava/lang/Runnable;)V

    goto :goto_0

    .line 311
    :pswitch_3
    const-string v16, "Analytics handler received MESSAGE_TAG_EVENT"

    invoke-static/range {v16 .. v16}, Lcom/localytics/android/Localytics$Log;->d(Ljava/lang/String;)I

    .line 313
    move-object/from16 v0, p1

    iget-object v0, v0, Landroid/os/Message;->obj:Ljava/lang/Object;

    move-object/from16 v16, v0

    check-cast v16, [Ljava/lang/Object;

    move-object/from16 v11, v16

    check-cast v11, [Ljava/lang/Object;

    .line 314
    .local v11, "params":[Ljava/lang/Object;
    const/16 v16, 0x0

    aget-object v6, v11, v16

    check-cast v6, Ljava/lang/String;

    .line 316
    .local v6, "event":Ljava/lang/String;
    const/16 v16, 0x1

    aget-object v2, v11, v16

    check-cast v2, Ljava/util/Map;

    .line 317
    .local v2, "attributes":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    const/16 v16, 0x2

    aget-object v3, v11, v16

    check-cast v3, Ljava/lang/Long;

    .line 319
    .local v3, "clv":Ljava/lang/Long;
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/localytics/android/AnalyticsHandler;->mProvider:Lcom/localytics/android/BaseProvider;

    move-object/from16 v16, v0

    new-instance v17, Lcom/localytics/android/AnalyticsHandler$5;

    move-object/from16 v0, v17

    move-object/from16 v1, p0

    invoke-direct {v0, v1, v6, v2, v3}, Lcom/localytics/android/AnalyticsHandler$5;-><init>(Lcom/localytics/android/AnalyticsHandler;Ljava/lang/String;Ljava/util/Map;Ljava/lang/Long;)V

    invoke-virtual/range {v16 .. v17}, Lcom/localytics/android/BaseProvider;->runBatchTransaction(Ljava/lang/Runnable;)V

    goto :goto_0

    .line 337
    .end local v2    # "attributes":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    .end local v3    # "clv":Ljava/lang/Long;
    .end local v6    # "event":Ljava/lang/String;
    .end local v11    # "params":[Ljava/lang/Object;
    :pswitch_4
    const-string v16, "Analytics handler received MESSAGE_TAG_SCREEN"

    invoke-static/range {v16 .. v16}, Lcom/localytics/android/Localytics$Log;->d(Ljava/lang/String;)I

    .line 339
    move-object/from16 v0, p1

    iget-object v14, v0, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast v14, Ljava/lang/String;

    .line 341
    .local v14, "screen":Ljava/lang/String;
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/localytics/android/AnalyticsHandler;->mProvider:Lcom/localytics/android/BaseProvider;

    move-object/from16 v16, v0

    new-instance v17, Lcom/localytics/android/AnalyticsHandler$6;

    move-object/from16 v0, v17

    move-object/from16 v1, p0

    invoke-direct {v0, v1, v14}, Lcom/localytics/android/AnalyticsHandler$6;-><init>(Lcom/localytics/android/AnalyticsHandler;Ljava/lang/String;)V

    invoke-virtual/range {v16 .. v17}, Lcom/localytics/android/BaseProvider;->runBatchTransaction(Ljava/lang/Runnable;)V

    goto :goto_0

    .line 359
    .end local v14    # "screen":Ljava/lang/String;
    :pswitch_5
    const-string v16, "Analytics handler received MESSAGE_SET_CUSTOM_DIMENSION"

    invoke-static/range {v16 .. v16}, Lcom/localytics/android/Localytics$Log;->d(Ljava/lang/String;)I

    .line 361
    move-object/from16 v0, p1

    iget-object v0, v0, Landroid/os/Message;->obj:Ljava/lang/Object;

    move-object/from16 v16, v0

    check-cast v16, [Ljava/lang/Object;

    move-object/from16 v11, v16

    check-cast v11, [Ljava/lang/Object;

    .line 362
    .restart local v11    # "params":[Ljava/lang/Object;
    const/16 v16, 0x0

    aget-object v16, v11, v16

    check-cast v16, Ljava/lang/Integer;

    invoke-virtual/range {v16 .. v16}, Ljava/lang/Integer;->intValue()I

    move-result v4

    .line 363
    .local v4, "dimension":I
    const/16 v16, 0x1

    aget-object v15, v11, v16

    check-cast v15, Ljava/lang/String;

    .line 365
    .local v15, "value":Ljava/lang/String;
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/localytics/android/AnalyticsHandler;->mProvider:Lcom/localytics/android/BaseProvider;

    move-object/from16 v16, v0

    new-instance v17, Lcom/localytics/android/AnalyticsHandler$7;

    move-object/from16 v0, v17

    move-object/from16 v1, p0

    invoke-direct {v0, v1, v4, v15}, Lcom/localytics/android/AnalyticsHandler$7;-><init>(Lcom/localytics/android/AnalyticsHandler;ILjava/lang/String;)V

    invoke-virtual/range {v16 .. v17}, Lcom/localytics/android/BaseProvider;->runBatchTransaction(Ljava/lang/Runnable;)V

    goto/16 :goto_0

    .line 377
    .end local v4    # "dimension":I
    .end local v11    # "params":[Ljava/lang/Object;
    .end local v15    # "value":Ljava/lang/String;
    :pswitch_6
    const-string v16, "Analytics handler received MESSAGE_SET_IDENTIFIER"

    invoke-static/range {v16 .. v16}, Lcom/localytics/android/Localytics$Log;->d(Ljava/lang/String;)I

    .line 379
    move-object/from16 v0, p1

    iget-object v0, v0, Landroid/os/Message;->obj:Ljava/lang/Object;

    move-object/from16 v16, v0

    check-cast v16, [Ljava/lang/Object;

    move-object/from16 v11, v16

    check-cast v11, [Ljava/lang/Object;

    .line 380
    .restart local v11    # "params":[Ljava/lang/Object;
    const/16 v16, 0x0

    aget-object v9, v11, v16

    check-cast v9, Ljava/lang/String;

    .line 381
    .local v9, "key":Ljava/lang/String;
    const/16 v16, 0x1

    aget-object v15, v11, v16

    check-cast v15, Ljava/lang/String;

    .line 383
    .restart local v15    # "value":Ljava/lang/String;
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/localytics/android/AnalyticsHandler;->mProvider:Lcom/localytics/android/BaseProvider;

    move-object/from16 v16, v0

    new-instance v17, Lcom/localytics/android/AnalyticsHandler$8;

    move-object/from16 v0, v17

    move-object/from16 v1, p0

    invoke-direct {v0, v1, v9, v15}, Lcom/localytics/android/AnalyticsHandler$8;-><init>(Lcom/localytics/android/AnalyticsHandler;Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual/range {v16 .. v17}, Lcom/localytics/android/BaseProvider;->runBatchTransaction(Ljava/lang/Runnable;)V

    goto/16 :goto_0

    .line 395
    .end local v9    # "key":Ljava/lang/String;
    .end local v11    # "params":[Ljava/lang/Object;
    .end local v15    # "value":Ljava/lang/String;
    :pswitch_7
    const-string v16, "Analytics handler received MESSAGE_SET_LOCATION"

    invoke-static/range {v16 .. v16}, Lcom/localytics/android/Localytics$Log;->d(Ljava/lang/String;)I

    .line 397
    move-object/from16 v0, p1

    iget-object v0, v0, Landroid/os/Message;->obj:Ljava/lang/Object;

    move-object/from16 v16, v0

    check-cast v16, Landroid/location/Location;

    sput-object v16, Lcom/localytics/android/AnalyticsHandler;->sLastLocation:Landroid/location/Location;

    goto/16 :goto_0

    .line 402
    :pswitch_8
    const-string v16, "Analytics handler received MESSAGE_SET_PUSH_REGID"

    invoke-static/range {v16 .. v16}, Lcom/localytics/android/Localytics$Log;->d(Ljava/lang/String;)I

    .line 404
    move-object/from16 v0, p1

    iget-object v12, v0, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast v12, Ljava/lang/String;

    .line 406
    .local v12, "pushRegId":Ljava/lang/String;
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/localytics/android/AnalyticsHandler;->mProvider:Lcom/localytics/android/BaseProvider;

    move-object/from16 v16, v0

    new-instance v17, Lcom/localytics/android/AnalyticsHandler$9;

    move-object/from16 v0, v17

    move-object/from16 v1, p0

    invoke-direct {v0, v1, v12}, Lcom/localytics/android/AnalyticsHandler$9;-><init>(Lcom/localytics/android/AnalyticsHandler;Ljava/lang/String;)V

    invoke-virtual/range {v16 .. v17}, Lcom/localytics/android/BaseProvider;->runBatchTransaction(Ljava/lang/Runnable;)V

    goto/16 :goto_0

    .line 425
    .end local v12    # "pushRegId":Ljava/lang/String;
    :pswitch_9
    const-string v16, "Analytics handler received MESSAGE_DISABLE_PUSH"

    invoke-static/range {v16 .. v16}, Lcom/localytics/android/Localytics$Log;->d(Ljava/lang/String;)I

    .line 427
    move-object/from16 v0, p1

    iget v5, v0, Landroid/os/Message;->arg1:I

    .line 429
    .local v5, "disabled":I
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/localytics/android/AnalyticsHandler;->mProvider:Lcom/localytics/android/BaseProvider;

    move-object/from16 v16, v0

    new-instance v17, Lcom/localytics/android/AnalyticsHandler$10;

    move-object/from16 v0, v17

    move-object/from16 v1, p0

    invoke-direct {v0, v1, v5}, Lcom/localytics/android/AnalyticsHandler$10;-><init>(Lcom/localytics/android/AnalyticsHandler;I)V

    invoke-virtual/range {v16 .. v17}, Lcom/localytics/android/BaseProvider;->runBatchTransaction(Ljava/lang/Runnable;)V

    goto/16 :goto_0

    .line 441
    .end local v5    # "disabled":I
    :pswitch_a
    const-string v16, "Analytics handler received MESSAGE_OPT_OUT"

    invoke-static/range {v16 .. v16}, Lcom/localytics/android/Localytics$Log;->v(Ljava/lang/String;)I

    .line 443
    move-object/from16 v0, p1

    iget v0, v0, Landroid/os/Message;->arg1:I

    move/from16 v16, v0

    if-eqz v16, :cond_0

    const/4 v8, 0x1

    .line 445
    .local v8, "isOptingOut":Z
    :goto_1
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/localytics/android/AnalyticsHandler;->mProvider:Lcom/localytics/android/BaseProvider;

    move-object/from16 v16, v0

    new-instance v17, Lcom/localytics/android/AnalyticsHandler$11;

    move-object/from16 v0, v17

    move-object/from16 v1, p0

    invoke-direct {v0, v1, v8}, Lcom/localytics/android/AnalyticsHandler$11;-><init>(Lcom/localytics/android/AnalyticsHandler;Z)V

    invoke-virtual/range {v16 .. v17}, Lcom/localytics/android/BaseProvider;->runBatchTransaction(Ljava/lang/Runnable;)V

    goto/16 :goto_0

    .line 443
    .end local v8    # "isOptingOut":Z
    :cond_0
    const/4 v8, 0x0

    goto :goto_1

    .line 457
    :pswitch_b
    const-string v16, "Analytics handler received MESSAGE_REGISTER_PUSH"

    invoke-static/range {v16 .. v16}, Lcom/localytics/android/Localytics$Log;->d(Ljava/lang/String;)I

    .line 459
    move-object/from16 v0, p1

    iget-object v10, v0, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast v10, Ljava/lang/String;

    .line 461
    .local v10, "newSenderId":Ljava/lang/String;
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/localytics/android/AnalyticsHandler;->mProvider:Lcom/localytics/android/BaseProvider;

    move-object/from16 v16, v0

    new-instance v17, Lcom/localytics/android/AnalyticsHandler$12;

    move-object/from16 v0, v17

    move-object/from16 v1, p0

    invoke-direct {v0, v1, v10}, Lcom/localytics/android/AnalyticsHandler$12;-><init>(Lcom/localytics/android/AnalyticsHandler;Ljava/lang/String;)V

    invoke-virtual/range {v16 .. v17}, Lcom/localytics/android/BaseProvider;->runBatchTransaction(Ljava/lang/Runnable;)V

    goto/16 :goto_0

    .line 473
    .end local v10    # "newSenderId":Ljava/lang/String;
    :pswitch_c
    const-string v16, "Analytics handler received MESSAGE_HANDLE_PUSH_REGISTRATION"

    invoke-static/range {v16 .. v16}, Lcom/localytics/android/Localytics$Log;->d(Ljava/lang/String;)I

    .line 475
    move-object/from16 v0, p1

    iget-object v7, v0, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast v7, Landroid/content/Intent;

    .line 477
    .local v7, "intent":Landroid/content/Intent;
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/localytics/android/AnalyticsHandler;->mProvider:Lcom/localytics/android/BaseProvider;

    move-object/from16 v16, v0

    new-instance v17, Lcom/localytics/android/AnalyticsHandler$13;

    move-object/from16 v0, v17

    move-object/from16 v1, p0

    invoke-direct {v0, v1, v7}, Lcom/localytics/android/AnalyticsHandler$13;-><init>(Lcom/localytics/android/AnalyticsHandler;Landroid/content/Intent;)V

    invoke-virtual/range {v16 .. v17}, Lcom/localytics/android/BaseProvider;->runBatchTransaction(Ljava/lang/Runnable;)V

    goto/16 :goto_0

    .line 489
    .end local v7    # "intent":Landroid/content/Intent;
    :pswitch_d
    const-string v16, "Analytics handler received MESSAGE_SET_REFERRERID"

    invoke-static/range {v16 .. v16}, Lcom/localytics/android/Localytics$Log;->d(Ljava/lang/String;)I

    .line 491
    move-object/from16 v0, p1

    iget-object v13, v0, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast v13, Ljava/lang/String;

    .line 493
    .local v13, "referrerId":Ljava/lang/String;
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/localytics/android/AnalyticsHandler;->mProvider:Lcom/localytics/android/BaseProvider;

    move-object/from16 v16, v0

    new-instance v17, Lcom/localytics/android/AnalyticsHandler$14;

    move-object/from16 v0, v17

    move-object/from16 v1, p0

    invoke-direct {v0, v1, v13}, Lcom/localytics/android/AnalyticsHandler$14;-><init>(Lcom/localytics/android/AnalyticsHandler;Ljava/lang/String;)V

    invoke-virtual/range {v16 .. v17}, Lcom/localytics/android/BaseProvider;->runBatchTransaction(Ljava/lang/Runnable;)V

    goto/16 :goto_0

    .line 267
    nop

    :pswitch_data_0
    .packed-switch 0x65
        :pswitch_1
        :pswitch_2
        :pswitch_3
        :pswitch_4
        :pswitch_6
        :pswitch_7
        :pswitch_5
        :pswitch_a
        :pswitch_b
        :pswitch_c
        :pswitch_0
        :pswitch_9
        :pswitch_8
        :pswitch_d
    .end packed-switch
.end method

.method handleRegistration(Landroid/content/Intent;)V
    .locals 1
    .param p1, "intent"    # Landroid/content/Intent;

    .prologue
    .line 1891
    const/16 v0, 0x6e

    invoke-virtual {p0, v0, p1}, Lcom/localytics/android/AnalyticsHandler;->obtainMessage(ILjava/lang/Object;)Landroid/os/Message;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/localytics/android/AnalyticsHandler;->queueMessage(Landroid/os/Message;)Z

    .line 1892
    return-void
.end method

.method isOptedOut()Z
    .locals 1

    .prologue
    .line 1666
    new-instance v0, Lcom/localytics/android/AnalyticsHandler$18;

    invoke-direct {v0, p0}, Lcom/localytics/android/AnalyticsHandler$18;-><init>(Lcom/localytics/android/AnalyticsHandler;)V

    invoke-virtual {p0, v0}, Lcom/localytics/android/AnalyticsHandler;->getBool(Ljava/util/concurrent/Callable;)Z

    move-result v0

    return v0
.end method

.method isPushDisabled()Z
    .locals 1

    .prologue
    .line 163
    new-instance v0, Lcom/localytics/android/AnalyticsHandler$1;

    invoke-direct {v0, p0}, Lcom/localytics/android/AnalyticsHandler$1;-><init>(Lcom/localytics/android/AnalyticsHandler;)V

    invoke-virtual {p0, v0}, Lcom/localytics/android/AnalyticsHandler;->getBool(Ljava/util/concurrent/Callable;)Z

    move-result v0

    return v0
.end method

.method openSession()V
    .locals 1

    .prologue
    .line 1513
    const/16 v0, 0x65

    invoke-virtual {p0, v0}, Lcom/localytics/android/AnalyticsHandler;->obtainMessage(I)Landroid/os/Message;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/localytics/android/AnalyticsHandler;->queueMessage(Landroid/os/Message;)Z

    .line 1514
    return-void
.end method

.method registerPush(Ljava/lang/String;J)V
    .locals 2
    .param p1, "senderID"    # Ljava/lang/String;
    .param p2, "delay"    # J

    .prologue
    .line 1699
    const/16 v0, 0x6d

    invoke-virtual {p0, v0, p1}, Lcom/localytics/android/AnalyticsHandler;->obtainMessage(ILjava/lang/Object;)Landroid/os/Message;

    move-result-object v0

    invoke-virtual {p0, v0, p2, p3}, Lcom/localytics/android/AnalyticsHandler;->queueMessageDelayed(Landroid/os/Message;J)Z

    .line 1700
    return-void
.end method

.method setCustomDimension(ILjava/lang/String;)V
    .locals 4
    .param p1, "dimension"    # I
    .param p2, "value"    # Ljava/lang/String;

    .prologue
    .line 1518
    if-ltz p1, :cond_0

    const/16 v0, 0xa

    if-lt p1, v0, :cond_1

    .line 1520
    :cond_0
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "Only valid dimensions are 0 - 9"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 1523
    :cond_1
    const/16 v0, 0x6b

    const/4 v1, 0x2

    new-array v1, v1, [Ljava/lang/Object;

    const/4 v2, 0x0

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    aput-object v3, v1, v2

    const/4 v2, 0x1

    aput-object p2, v1, v2

    invoke-virtual {p0, v0, v1}, Lcom/localytics/android/AnalyticsHandler;->obtainMessage(ILjava/lang/Object;)Landroid/os/Message;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/localytics/android/AnalyticsHandler;->queueMessage(Landroid/os/Message;)Z

    .line 1524
    return-void
.end method

.method setIdentifier(Ljava/lang/String;Ljava/lang/String;)V
    .locals 3
    .param p1, "key"    # Ljava/lang/String;
    .param p2, "value"    # Ljava/lang/String;

    .prologue
    .line 1528
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 1530
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "key cannot be null or empty"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 1533
    :cond_0
    const/16 v0, 0x69

    const/4 v1, 0x2

    new-array v1, v1, [Ljava/lang/Object;

    const/4 v2, 0x0

    aput-object p1, v1, v2

    const/4 v2, 0x1

    aput-object p2, v1, v2

    invoke-virtual {p0, v0, v1}, Lcom/localytics/android/AnalyticsHandler;->obtainMessage(ILjava/lang/Object;)Landroid/os/Message;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/localytics/android/AnalyticsHandler;->queueMessage(Landroid/os/Message;)Z

    .line 1534
    return-void
.end method

.method setLocation(Landroid/location/Location;)V
    .locals 2
    .param p1, "location"    # Landroid/location/Location;

    .prologue
    .line 1594
    const/16 v0, 0x6a

    new-instance v1, Landroid/location/Location;

    invoke-direct {v1, p1}, Landroid/location/Location;-><init>(Landroid/location/Location;)V

    invoke-virtual {p0, v0, v1}, Lcom/localytics/android/AnalyticsHandler;->obtainMessage(ILjava/lang/Object;)Landroid/os/Message;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/localytics/android/AnalyticsHandler;->queueMessage(Landroid/os/Message;)Z

    .line 1595
    return-void
.end method

.method setOptedOut(Z)V
    .locals 5
    .param p1, "isOptingOut"    # Z

    .prologue
    const/4 v0, 0x1

    const/4 v1, 0x0

    .line 1659
    const-string v2, "Requested opt-out state is %b"

    new-array v3, v0, [Ljava/lang/Object;

    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v4

    aput-object v4, v3, v1

    invoke-static {v2, v3}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Lcom/localytics/android/Localytics$Log;->v(Ljava/lang/String;)I

    .line 1661
    const/16 v2, 0x6c

    if-eqz p1, :cond_0

    :goto_0
    invoke-virtual {p0, v2, v0, v1}, Lcom/localytics/android/AnalyticsHandler;->obtainMessage(III)Landroid/os/Message;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/localytics/android/AnalyticsHandler;->queueMessage(Landroid/os/Message;)Z

    .line 1662
    return-void

    :cond_0
    move v0, v1

    .line 1661
    goto :goto_0
.end method

.method setPushDisabled(Z)V
    .locals 3
    .param p1, "disabled"    # Z

    .prologue
    const/4 v1, 0x0

    .line 1678
    const/16 v2, 0x70

    if-eqz p1, :cond_0

    const/4 v0, 0x1

    :goto_0
    invoke-virtual {p0, v2, v0, v1}, Lcom/localytics/android/AnalyticsHandler;->obtainMessage(III)Landroid/os/Message;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/localytics/android/AnalyticsHandler;->queueMessage(Landroid/os/Message;)Z

    .line 1679
    return-void

    :cond_0
    move v0, v1

    .line 1678
    goto :goto_0
.end method

.method setPushRegistrationId(Ljava/lang/String;)V
    .locals 1
    .param p1, "registrationId"    # Ljava/lang/String;

    .prologue
    .line 813
    const/16 v0, 0x71

    invoke-virtual {p0, v0, p1}, Lcom/localytics/android/AnalyticsHandler;->obtainMessage(ILjava/lang/Object;)Landroid/os/Message;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/localytics/android/AnalyticsHandler;->queueMessage(Landroid/os/Message;)Z

    .line 814
    return-void
.end method

.method setReferrerId(Ljava/lang/String;)V
    .locals 1
    .param p1, "referrerId"    # Ljava/lang/String;

    .prologue
    .line 1798
    const/16 v0, 0x72

    invoke-virtual {p0, v0, p1}, Lcom/localytics/android/AnalyticsHandler;->obtainMessage(ILjava/lang/Object;)Landroid/os/Message;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/localytics/android/AnalyticsHandler;->queueMessage(Landroid/os/Message;)Z

    .line 1799
    return-void
.end method

.method setScreenFlow(Ljava/util/List;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 175
    .local p1, "screens":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    iget-object v0, p0, Lcom/localytics/android/AnalyticsHandler;->screenFlow:Ljava/util/List;

    const/4 v1, 0x0

    invoke-interface {v0, v1, p1}, Ljava/util/List;->addAll(ILjava/util/Collection;)Z

    .line 176
    return-void
.end method

.method tagEvent(Ljava/lang/String;Ljava/util/Map;J)V
    .locals 9
    .param p1, "eventName"    # Ljava/lang/String;
    .param p3, "customerValueIncrease"    # J
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;J)V"
        }
    .end annotation

    .prologue
    .line 224
    .local p2, "attributes":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v4

    if-eqz v4, :cond_0

    .line 226
    new-instance v4, Ljava/lang/IllegalArgumentException;

    const-string v5, "event cannot be null or empty"

    invoke-direct {v4, v5}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 229
    :cond_0
    if-eqz p2, :cond_5

    .line 235
    invoke-interface {p2}, Ljava/util/Map;->isEmpty()Z

    move-result v4

    if-eqz v4, :cond_1

    .line 237
    const-class v4, Ljava/lang/IllegalArgumentException;

    const-string v5, "attributes is empty.  Did the caller make an error?"

    invoke-static {v4, v5}, Lcom/localytics/android/LocalyticsManager;->throwOrLogError(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Object;

    .line 240
    :cond_1
    invoke-interface {p2}, Ljava/util/Map;->size()I

    move-result v4

    const/16 v5, 0x32

    if-le v4, v5, :cond_2

    .line 242
    const-class v4, Ljava/lang/IllegalArgumentException;

    const-string v5, "attributes size is %d, exceeding the maximum size of %d.  Did the caller make an error?"

    const/4 v6, 0x2

    new-array v6, v6, [Ljava/lang/Object;

    const/4 v7, 0x0

    invoke-interface {p2}, Ljava/util/Map;->size()I

    move-result v8

    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v8

    aput-object v8, v6, v7

    const/4 v7, 0x1

    const/16 v8, 0x32

    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v8

    aput-object v8, v6, v7

    invoke-static {v5, v6}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Lcom/localytics/android/LocalyticsManager;->throwOrLogError(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Object;

    .line 245
    :cond_2
    invoke-interface {p2}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v4

    invoke-interface {v4}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "i$":Ljava/util/Iterator;
    :cond_3
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_5

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Map$Entry;

    .line 247
    .local v0, "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Ljava/lang/String;>;"
    invoke-interface {v0}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    .line 248
    .local v2, "key":Ljava/lang/String;
    invoke-interface {v0}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    .line 250
    .local v3, "value":Ljava/lang/String;
    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v4

    if-eqz v4, :cond_4

    .line 252
    const-class v4, Ljava/lang/IllegalArgumentException;

    const-string v5, "attributes cannot contain null or empty keys"

    invoke-static {v4, v5}, Lcom/localytics/android/LocalyticsManager;->throwOrLogError(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Object;

    .line 254
    :cond_4
    invoke-static {v3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v4

    if-eqz v4, :cond_3

    .line 256
    const-class v4, Ljava/lang/IllegalArgumentException;

    const-string v5, "attributes cannot contain null or empty values"

    invoke-static {v4, v5}, Lcom/localytics/android/LocalyticsManager;->throwOrLogError(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Object;

    goto :goto_0

    .line 261
    .end local v0    # "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Ljava/lang/String;>;"
    .end local v1    # "i$":Ljava/util/Iterator;
    .end local v2    # "key":Ljava/lang/String;
    .end local v3    # "value":Ljava/lang/String;
    :cond_5
    const/16 v4, 0x67

    const/4 v5, 0x3

    new-array v5, v5, [Ljava/lang/Object;

    const/4 v6, 0x0

    aput-object p1, v5, v6

    const/4 v6, 0x1

    aput-object p2, v5, v6

    const/4 v6, 0x2

    invoke-static {p3, p4}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v7

    aput-object v7, v5, v6

    invoke-virtual {p0, v4, v5}, Lcom/localytics/android/AnalyticsHandler;->obtainMessage(ILjava/lang/Object;)Landroid/os/Message;

    move-result-object v4

    invoke-virtual {p0, v4}, Lcom/localytics/android/AnalyticsHandler;->queueMessage(Landroid/os/Message;)Z

    .line 262
    return-void
.end method

.method tagScreen(Ljava/lang/String;)V
    .locals 2
    .param p1, "screen"    # Ljava/lang/String;

    .prologue
    .line 1584
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 1586
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "event cannot be null or empty"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 1589
    :cond_0
    const/16 v0, 0x68

    invoke-virtual {p0, v0, p1}, Lcom/localytics/android/AnalyticsHandler;->obtainMessage(ILjava/lang/Object;)Landroid/os/Message;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/localytics/android/AnalyticsHandler;->queueMessage(Landroid/os/Message;)Z

    .line 1590
    return-void
.end method
