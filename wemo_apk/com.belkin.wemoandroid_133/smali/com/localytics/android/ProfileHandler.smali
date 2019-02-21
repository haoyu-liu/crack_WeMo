.class Lcom/localytics/android/ProfileHandler;
.super Lcom/localytics/android/BaseHandler;
.source "ProfileHandler.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/localytics/android/ProfileHandler$ProfileListenersSet;,
        Lcom/localytics/android/ProfileHandler$ProfileOperation;
    }
.end annotation


# static fields
.field static final ATTRIBUTE_JSON_KEY_KEY:Ljava/lang/String; = "attr"

.field static final ATTRIBUTE_JSON_OP_KEY:Ljava/lang/String; = "op"

.field static final ATTRIBUTE_JSON_VALUE_KEY:Ljava/lang/String; = "value"

.field private static final MESSAGE_SET_PROFILE_ATTRIBUTE:I = 0x12d


# direct methods
.method constructor <init>(Lcom/localytics/android/LocalyticsDao;Landroid/os/Looper;)V
    .locals 2
    .param p1, "localyticsDao"    # Lcom/localytics/android/LocalyticsDao;
    .param p2, "looper"    # Landroid/os/Looper;

    .prologue
    .line 31
    invoke-direct {p0, p1, p2}, Lcom/localytics/android/BaseHandler;-><init>(Lcom/localytics/android/LocalyticsDao;Landroid/os/Looper;)V

    .line 32
    const-string v0, "Profile"

    iput-object v0, p0, Lcom/localytics/android/ProfileHandler;->siloName:Ljava/lang/String;

    .line 33
    new-instance v0, Lcom/localytics/android/ProfileHandler$ProfileListenersSet;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Lcom/localytics/android/ProfileHandler$ProfileListenersSet;-><init>(Lcom/localytics/android/ProfileHandler;Lcom/localytics/android/ProfileHandler$1;)V

    iput-object v0, p0, Lcom/localytics/android/ProfileHandler;->listeners:Lcom/localytics/android/BaseHandler$ListenersSet;

    .line 34
    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lcom/localytics/android/ProfileHandler;->obtainMessage(I)Landroid/os/Message;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/localytics/android/ProfileHandler;->queueMessage(Landroid/os/Message;)Z

    .line 35
    return-void
.end method

.method private _setAttribute(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 3
    .param p1, "attribute"    # Ljava/lang/String;
    .param p2, "database"    # Ljava/lang/String;
    .param p3, "customerID"    # Ljava/lang/String;

    .prologue
    .line 332
    new-instance v0, Landroid/content/ContentValues;

    invoke-direct {v0}, Landroid/content/ContentValues;-><init>()V

    .line 333
    .local v0, "values":Landroid/content/ContentValues;
    const-string v1, "scope"

    invoke-virtual {v0, v1, p2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 334
    const-string v1, "change"

    invoke-virtual {v0, v1, p1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 335
    const-string v1, "customer_id"

    invoke-virtual {v0, v1, p3}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 336
    iget-object v1, p0, Lcom/localytics/android/ProfileHandler;->mProvider:Lcom/localytics/android/BaseProvider;

    const-string v2, "changes"

    invoke-virtual {v1, v2, v0}, Lcom/localytics/android/BaseProvider;->insert(Ljava/lang/String;Landroid/content/ContentValues;)J

    .line 337
    return-void
.end method

.method static synthetic access$100(Lcom/localytics/android/ProfileHandler;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0
    .param p0, "x0"    # Lcom/localytics/android/ProfileHandler;
    .param p1, "x1"    # Ljava/lang/String;
    .param p2, "x2"    # Ljava/lang/String;
    .param p3, "x3"    # Ljava/lang/String;

    .prologue
    .line 20
    invoke-direct {p0, p1, p2, p3}, Lcom/localytics/android/ProfileHandler;->_setAttribute(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method private static checkAttributeName(Ljava/lang/String;)Z
    .locals 4
    .param p0, "attrName"    # Ljava/lang/String;

    .prologue
    const/4 v1, 0x0

    .line 265
    if-nez p0, :cond_0

    .line 267
    const-class v2, Ljava/lang/IllegalArgumentException;

    const-string v3, "attribute name cannot be null"

    invoke-static {v2, v3}, Lcom/localytics/android/LocalyticsManager;->throwOrLogError(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Object;

    .line 288
    :goto_0
    return v1

    .line 270
    :cond_0
    invoke-virtual {p0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v0

    .line 271
    .local v0, "attributeName":Ljava/lang/String;
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v2

    if-nez v2, :cond_1

    .line 273
    const-class v2, Ljava/lang/IllegalArgumentException;

    const-string v3, "attribute name cannot be empty"

    invoke-static {v2, v3}, Lcom/localytics/android/LocalyticsManager;->throwOrLogError(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Object;

    goto :goto_0

    .line 288
    :cond_1
    const/4 v1, 0x1

    goto :goto_0
.end method

.method private static convertDateToString(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 8
    .param p0, "attrVal"    # Ljava/lang/Object;

    .prologue
    const/4 v6, 0x0

    .line 293
    new-instance v4, Ljava/text/SimpleDateFormat;

    const-string v7, "yyyy-MM-dd"

    invoke-direct {v4, v7}, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;)V

    .line 294
    .local v4, "simpleDateFormat":Ljava/text/SimpleDateFormat;
    instance-of v7, p0, Ljava/util/Date;

    if-eqz v7, :cond_1

    .line 296
    invoke-virtual {v4, p0}, Ljava/text/SimpleDateFormat;->format(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v6

    .line 315
    .end local p0    # "attrVal":Ljava/lang/Object;
    :cond_0
    :goto_0
    return-object v6

    .line 298
    .restart local p0    # "attrVal":Ljava/lang/Object;
    :cond_1
    instance-of v7, p0, [Ljava/util/Date;

    if-eqz v7, :cond_0

    .line 300
    new-instance v5, Ljava/util/ArrayList;

    invoke-direct {v5}, Ljava/util/ArrayList;-><init>()V

    .line 301
    .local v5, "strings":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    check-cast p0, [Ljava/util/Date;

    .end local p0    # "attrVal":Ljava/lang/Object;
    move-object v0, p0

    check-cast v0, [Ljava/util/Date;

    .local v0, "arr$":[Ljava/util/Date;
    array-length v3, v0

    .local v3, "len$":I
    const/4 v2, 0x0

    .local v2, "i$":I
    :goto_1
    if-ge v2, v3, :cond_3

    aget-object v1, v0, v2

    .line 303
    .local v1, "d":Ljava/util/Date;
    if-eqz v1, :cond_2

    .line 305
    invoke-virtual {v4, v1}, Ljava/text/SimpleDateFormat;->format(Ljava/util/Date;)Ljava/lang/String;

    move-result-object v7

    invoke-interface {v5, v7}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 301
    :goto_2
    add-int/lit8 v2, v2, 0x1

    goto :goto_1

    .line 309
    :cond_2
    invoke-interface {v5, v6}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_2

    .line 312
    .end local v1    # "d":Ljava/util/Date;
    :cond_3
    invoke-interface {v5}, Ljava/util/List;->toArray()[Ljava/lang/Object;

    move-result-object v6

    goto :goto_0
.end method

.method private static convertToObjectArray([J)[Ljava/lang/Long;
    .locals 8
    .param p0, "longArray"    # [J

    .prologue
    .line 320
    array-length v7, p0

    new-array v1, v7, [Ljava/lang/Long;

    .line 321
    .local v1, "array":[Ljava/lang/Long;
    const/4 v3, 0x0

    .line 322
    .local v3, "index":I
    move-object v0, p0

    .local v0, "arr$":[J
    array-length v6, v0

    .local v6, "len$":I
    const/4 v2, 0x0

    .local v2, "i$":I
    :goto_0
    if-ge v2, v6, :cond_0

    aget-wide v4, v0, v2

    .line 324
    .local v4, "l":J
    invoke-static {v4, v5}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v7

    aput-object v7, v1, v3

    .line 325
    add-int/lit8 v3, v3, 0x1

    .line 322
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 327
    .end local v4    # "l":J
    :cond_0
    return-object v1
.end method

.method private saveAttributeChange(Lcom/localytics/android/ProfileHandler$ProfileOperation;Ljava/lang/String;Ljava/lang/Object;Ljava/lang/String;)V
    .locals 12
    .param p1, "op"    # Lcom/localytics/android/ProfileHandler$ProfileOperation;
    .param p2, "attrName"    # Ljava/lang/String;
    .param p3, "attrValue"    # Ljava/lang/Object;
    .param p4, "database"    # Ljava/lang/String;

    .prologue
    .line 164
    invoke-static {p2}, Lcom/localytics/android/ProfileHandler;->checkAttributeName(Ljava/lang/String;)Z

    move-result v8

    if-eqz v8, :cond_2

    .line 168
    :try_start_0
    new-instance v4, Lorg/json/JSONObject;

    invoke-direct {v4}, Lorg/json/JSONObject;-><init>()V

    .line 169
    .local v4, "json":Lorg/json/JSONObject;
    const-string v8, "op"

    invoke-virtual {p1}, Lcom/localytics/android/ProfileHandler$ProfileOperation;->getOperationString()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v4, v8, v9}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 170
    const-string v8, "attr"

    invoke-virtual {v4, v8, p2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 171
    instance-of v8, p3, [Ljava/lang/Object;

    if-eqz v8, :cond_3

    .line 173
    new-instance v5, Lorg/json/JSONArray;

    invoke-direct {v5}, Lorg/json/JSONArray;-><init>()V

    .line 174
    .local v5, "jsonArray":Lorg/json/JSONArray;
    check-cast p3, [Ljava/lang/Object;

    .end local p3    # "attrValue":Ljava/lang/Object;
    move-object v0, p3

    check-cast v0, [Ljava/lang/Object;

    move-object v1, v0

    .local v1, "arr$":[Ljava/lang/Object;
    array-length v6, v1

    .local v6, "len$":I
    const/4 v3, 0x0

    .local v3, "i$":I
    :goto_0
    if-ge v3, v6, :cond_0

    aget-object v7, v1, v3

    .line 176
    .local v7, "o":Ljava/lang/Object;
    invoke-virtual {v5, v7}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;

    .line 174
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 178
    .end local v7    # "o":Ljava/lang/Object;
    :cond_0
    const-string v8, "value"

    invoke-virtual {v4, v8, v5}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 184
    .end local v1    # "arr$":[Ljava/lang/Object;
    .end local v3    # "i$":I
    .end local v5    # "jsonArray":Lorg/json/JSONArray;
    .end local v6    # "len$":I
    :cond_1
    :goto_1
    const/16 v8, 0x12d

    const/4 v9, 0x3

    new-array v9, v9, [Ljava/lang/Object;

    const/4 v10, 0x0

    invoke-virtual {v4}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v11

    aput-object v11, v9, v10

    const/4 v10, 0x1

    aput-object p4, v9, v10

    const/4 v10, 0x2

    iget-object v11, p0, Lcom/localytics/android/ProfileHandler;->mLocalyticsDao:Lcom/localytics/android/LocalyticsDao;

    invoke-interface {v11}, Lcom/localytics/android/LocalyticsDao;->getCustomerIdInMemory()Ljava/lang/String;

    move-result-object v11

    aput-object v11, v9, v10

    invoke-virtual {p0, v8, v9}, Lcom/localytics/android/ProfileHandler;->obtainMessage(ILjava/lang/Object;)Landroid/os/Message;

    move-result-object v8

    invoke-virtual {p0, v8}, Lcom/localytics/android/ProfileHandler;->queueMessage(Landroid/os/Message;)Z

    .line 191
    .end local v4    # "json":Lorg/json/JSONObject;
    :cond_2
    :goto_2
    return-void

    .line 180
    .restart local v4    # "json":Lorg/json/JSONObject;
    .restart local p3    # "attrValue":Ljava/lang/Object;
    :cond_3
    if-eqz p3, :cond_1

    .line 182
    const-string v8, "value"

    invoke-virtual {v4, v8, p3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_1

    .line 186
    .end local v4    # "json":Lorg/json/JSONObject;
    .end local p3    # "attrValue":Ljava/lang/Object;
    :catch_0
    move-exception v2

    .line 188
    .local v2, "e":Lorg/json/JSONException;
    const-string v8, "Caught JSON exception"

    invoke-static {v8, v2}, Lcom/localytics/android/Localytics$Log;->w(Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_2
.end method


# virtual methods
.method protected _deleteUploadedData(I)V
    .locals 4
    .param p1, "maxRowToDelete"    # I

    .prologue
    .line 78
    iget-object v0, p0, Lcom/localytics/android/ProfileHandler;->mProvider:Lcom/localytics/android/BaseProvider;

    const-string v1, "changes"

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

    .line 79
    return-void
.end method

.method protected _getDataToUpload()Ljava/util/TreeMap;
    .locals 14
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
    .line 115
    new-instance v8, Ljava/util/TreeMap;

    invoke-direct {v8}, Ljava/util/TreeMap;-><init>()V

    .line 116
    .local v8, "attributesMap":Ljava/util/TreeMap;, "Ljava/util/TreeMap<Ljava/lang/Integer;Ljava/lang/Object;>;"
    const/4 v9, 0x0

    .line 119
    .local v9, "cursor":Landroid/database/Cursor;
    :try_start_0
    iget-object v0, p0, Lcom/localytics/android/ProfileHandler;->mProvider:Lcom/localytics/android/BaseProvider;

    const-string v1, "changes"

    const/4 v2, 0x0

    const/4 v3, 0x0

    const/4 v4, 0x0

    const-string v5, "_id ASC"

    invoke-virtual/range {v0 .. v5}, Lcom/localytics/android/BaseProvider;->query(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v9

    .line 120
    const/4 v12, 0x0

    .line 121
    .local v12, "previousCustomerID":Ljava/lang/String;
    const/4 v13, 0x0

    .line 122
    .local v13, "previousDatabase":Ljava/lang/String;
    :goto_0
    invoke-interface {v9}, Landroid/database/Cursor;->moveToNext()Z

    move-result v0

    if-eqz v0, :cond_2

    invoke-virtual {v8}, Ljava/util/TreeMap;->size()I

    move-result v0

    int-to-double v0, v0

    const-wide/high16 v2, 0x4049000000000000L    # 50.0

    cmpg-double v0, v0, v2

    if-gez v0, :cond_2

    .line 124
    const-string v0, "_id"

    invoke-interface {v9, v0}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v0

    invoke-interface {v9, v0}, Landroid/database/Cursor;->getInt(I)I

    move-result v7

    .line 125
    .local v7, "attributeID":I
    const-string v0, "change"

    invoke-interface {v9, v0}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v0

    invoke-interface {v9, v0}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v6

    .line 126
    .local v6, "attribute":Ljava/lang/String;
    const-string v0, "customer_id"

    invoke-interface {v9, v0}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v0

    invoke-interface {v9, v0}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v10

    .line 127
    .local v10, "customerID":Ljava/lang/String;
    const-string v0, "scope"

    invoke-interface {v9, v0}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v0

    invoke-interface {v9, v0}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v11

    .line 128
    .local v11, "database":Ljava/lang/String;
    if-nez v12, :cond_0

    .line 130
    move-object v12, v10

    .line 131
    move-object v13, v11

    .line 134
    :cond_0
    invoke-virtual {v12, v10}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2

    invoke-virtual {v13, v11}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 136
    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    const/4 v1, 0x3

    new-array v1, v1, [Ljava/lang/Object;

    const/4 v2, 0x0

    aput-object v10, v1, v2

    const/4 v2, 0x1

    aput-object v11, v1, v2

    const/4 v2, 0x2

    aput-object v6, v1, v2

    invoke-virtual {v8, v0, v1}, Ljava/util/TreeMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_0

    .line 146
    .end local v6    # "attribute":Ljava/lang/String;
    .end local v7    # "attributeID":I
    .end local v10    # "customerID":Ljava/lang/String;
    .end local v11    # "database":Ljava/lang/String;
    .end local v12    # "previousCustomerID":Ljava/lang/String;
    .end local v13    # "previousDatabase":Ljava/lang/String;
    :catchall_0
    move-exception v0

    if-eqz v9, :cond_1

    .line 148
    invoke-interface {v9}, Landroid/database/Cursor;->close()V

    .line 149
    const/4 v9, 0x0

    .line 152
    :cond_1
    :goto_1
    return-object v8

    .line 146
    .restart local v12    # "previousCustomerID":Ljava/lang/String;
    .restart local v13    # "previousDatabase":Ljava/lang/String;
    :cond_2
    if-eqz v9, :cond_1

    .line 148
    invoke-interface {v9}, Landroid/database/Cursor;->close()V

    .line 149
    const/4 v9, 0x0

    goto :goto_1
.end method

.method protected _getMaxRowToUpload()I
    .locals 9

    .prologue
    .line 90
    const/4 v7, 0x0

    .line 91
    .local v7, "numberOfAttributes":I
    const/4 v6, 0x0

    .line 94
    .local v6, "cursor":Landroid/database/Cursor;
    :try_start_0
    iget-object v0, p0, Lcom/localytics/android/ProfileHandler;->mProvider:Lcom/localytics/android/BaseProvider;

    const-string v1, "changes"

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

    .line 95
    invoke-interface {v6}, Landroid/database/Cursor;->moveToLast()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 97
    const-string v0, "_id"

    invoke-interface {v6, v0}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v0

    invoke-interface {v6, v0}, Landroid/database/Cursor;->getInt(I)I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result v7

    .line 102
    :cond_0
    if-eqz v6, :cond_1

    .line 104
    invoke-interface {v6}, Landroid/database/Cursor;->close()V

    .line 105
    const/4 v6, 0x0

    :cond_1
    move v8, v7

    .line 108
    .end local v7    # "numberOfAttributes":I
    .local v8, "numberOfAttributes":I
    :goto_0
    return v8

    .line 102
    .end local v8    # "numberOfAttributes":I
    .restart local v7    # "numberOfAttributes":I
    :catchall_0
    move-exception v0

    if-eqz v6, :cond_2

    .line 104
    invoke-interface {v6}, Landroid/database/Cursor;->close()V

    .line 105
    const/4 v6, 0x0

    :cond_2
    move v8, v7

    .line 108
    .end local v7    # "numberOfAttributes":I
    .restart local v8    # "numberOfAttributes":I
    goto :goto_0
.end method

.method protected _init()V
    .locals 3

    .prologue
    .line 71
    new-instance v0, Lcom/localytics/android/ProfileProvider;

    iget-object v1, p0, Lcom/localytics/android/ProfileHandler;->siloName:Ljava/lang/String;

    invoke-virtual {v1}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v1

    iget-object v2, p0, Lcom/localytics/android/ProfileHandler;->mLocalyticsDao:Lcom/localytics/android/LocalyticsDao;

    invoke-direct {v0, v1, v2}, Lcom/localytics/android/ProfileProvider;-><init>(Ljava/lang/String;Lcom/localytics/android/LocalyticsDao;)V

    iput-object v0, p0, Lcom/localytics/android/ProfileHandler;->mProvider:Lcom/localytics/android/BaseProvider;

    .line 72
    iget-object v0, p0, Lcom/localytics/android/ProfileHandler;->mProvider:Lcom/localytics/android/BaseProvider;

    invoke-virtual {v0}, Lcom/localytics/android/BaseProvider;->vacuumIfNecessary()V

    .line 73
    return-void
.end method

.method protected _onUploadCompleted(Ljava/lang/String;)V
    .locals 1
    .param p1, "responseBody"    # Ljava/lang/String;

    .prologue
    .line 84
    iget-object v0, p0, Lcom/localytics/android/ProfileHandler;->mProvider:Lcom/localytics/android/BaseProvider;

    invoke-virtual {v0}, Lcom/localytics/android/BaseProvider;->vacuumIfNecessary()V

    .line 85
    return-void
.end method

.method addProfileAttributesToSet(Ljava/lang/String;[JLjava/lang/String;)V
    .locals 2
    .param p1, "attrName"    # Ljava/lang/String;
    .param p2, "attrValues"    # [J
    .param p3, "database"    # Ljava/lang/String;

    .prologue
    .line 230
    sget-object v0, Lcom/localytics/android/ProfileHandler$ProfileOperation;->SETADD:Lcom/localytics/android/ProfileHandler$ProfileOperation;

    invoke-static {p2}, Lcom/localytics/android/ProfileHandler;->convertToObjectArray([J)[Ljava/lang/Long;

    move-result-object v1

    invoke-direct {p0, v0, p1, v1, p3}, Lcom/localytics/android/ProfileHandler;->saveAttributeChange(Lcom/localytics/android/ProfileHandler$ProfileOperation;Ljava/lang/String;Ljava/lang/Object;Ljava/lang/String;)V

    .line 231
    return-void
.end method

.method addProfileAttributesToSet(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)V
    .locals 1
    .param p1, "attrName"    # Ljava/lang/String;
    .param p2, "attrValues"    # [Ljava/lang/String;
    .param p3, "database"    # Ljava/lang/String;

    .prologue
    .line 235
    sget-object v0, Lcom/localytics/android/ProfileHandler$ProfileOperation;->SETADD:Lcom/localytics/android/ProfileHandler$ProfileOperation;

    invoke-direct {p0, v0, p1, p2, p3}, Lcom/localytics/android/ProfileHandler;->saveAttributeChange(Lcom/localytics/android/ProfileHandler$ProfileOperation;Ljava/lang/String;Ljava/lang/Object;Ljava/lang/String;)V

    .line 236
    return-void
.end method

.method addProfileAttributesToSet(Ljava/lang/String;[Ljava/util/Date;Ljava/lang/String;)V
    .locals 2
    .param p1, "attrName"    # Ljava/lang/String;
    .param p2, "attrValues"    # [Ljava/util/Date;
    .param p3, "database"    # Ljava/lang/String;

    .prologue
    .line 240
    sget-object v0, Lcom/localytics/android/ProfileHandler$ProfileOperation;->SETADD:Lcom/localytics/android/ProfileHandler$ProfileOperation;

    invoke-static {p2}, Lcom/localytics/android/ProfileHandler;->convertDateToString(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    invoke-direct {p0, v0, p1, v1, p3}, Lcom/localytics/android/ProfileHandler;->saveAttributeChange(Lcom/localytics/android/ProfileHandler$ProfileOperation;Ljava/lang/String;Ljava/lang/Object;Ljava/lang/String;)V

    .line 241
    return-void
.end method

.method deleteProfileAttribute(Ljava/lang/String;Ljava/lang/String;)V
    .locals 2
    .param p1, "attrName"    # Ljava/lang/String;
    .param p2, "database"    # Ljava/lang/String;

    .prologue
    .line 225
    sget-object v0, Lcom/localytics/android/ProfileHandler$ProfileOperation;->DELETE:Lcom/localytics/android/ProfileHandler$ProfileOperation;

    const/4 v1, 0x0

    invoke-direct {p0, v0, p1, v1, p2}, Lcom/localytics/android/ProfileHandler;->saveAttributeChange(Lcom/localytics/android/ProfileHandler$ProfileOperation;Ljava/lang/String;Ljava/lang/Object;Ljava/lang/String;)V

    .line 226
    return-void
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
    .line 159
    .local p1, "data":Ljava/util/TreeMap;, "Ljava/util/TreeMap<Ljava/lang/Integer;Ljava/lang/Object;>;"
    new-instance v0, Lcom/localytics/android/ProfileUploadHandler;

    iget-object v1, p0, Lcom/localytics/android/ProfileHandler;->mLocalyticsDao:Lcom/localytics/android/LocalyticsDao;

    invoke-direct {v0, p0, p1, p2, v1}, Lcom/localytics/android/ProfileUploadHandler;-><init>(Lcom/localytics/android/BaseHandler;Ljava/util/TreeMap;Ljava/lang/String;Lcom/localytics/android/LocalyticsDao;)V

    return-object v0
.end method

.method protected handleMessageExtended(Landroid/os/Message;)V
    .locals 6
    .param p1, "msg"    # Landroid/os/Message;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 40
    iget v4, p1, Landroid/os/Message;->what:I

    packed-switch v4, :pswitch_data_0

    .line 63
    invoke-super {p0, p1}, Lcom/localytics/android/BaseHandler;->handleMessageExtended(Landroid/os/Message;)V

    .line 67
    :goto_0
    return-void

    .line 44
    :pswitch_0
    const-string v4, "Profile handler received MESSAGE_SET_PROFILE_ATTRIBUTE"

    invoke-static {v4}, Lcom/localytics/android/Localytics$Log;->d(Ljava/lang/String;)I

    .line 46
    iget-object v4, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast v4, [Ljava/lang/Object;

    move-object v3, v4

    check-cast v3, [Ljava/lang/Object;

    .line 47
    .local v3, "params":[Ljava/lang/Object;
    const/4 v4, 0x0

    aget-object v0, v3, v4

    check-cast v0, Ljava/lang/String;

    .line 48
    .local v0, "attribute":Ljava/lang/String;
    const/4 v4, 0x1

    aget-object v2, v3, v4

    check-cast v2, Ljava/lang/String;

    .line 49
    .local v2, "database":Ljava/lang/String;
    const/4 v4, 0x2

    aget-object v1, v3, v4

    check-cast v1, Ljava/lang/String;

    .line 51
    .local v1, "customerID":Ljava/lang/String;
    iget-object v4, p0, Lcom/localytics/android/ProfileHandler;->mProvider:Lcom/localytics/android/BaseProvider;

    new-instance v5, Lcom/localytics/android/ProfileHandler$1;

    invoke-direct {v5, p0, v0, v2, v1}, Lcom/localytics/android/ProfileHandler$1;-><init>(Lcom/localytics/android/ProfileHandler;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v4, v5}, Lcom/localytics/android/BaseProvider;->runBatchTransaction(Ljava/lang/Runnable;)V

    goto :goto_0

    .line 40
    nop

    :pswitch_data_0
    .packed-switch 0x12d
        :pswitch_0
    .end packed-switch
.end method

.method incrementProfileAttribute(Ljava/lang/String;JLjava/lang/String;)V
    .locals 2
    .param p1, "attrName"    # Ljava/lang/String;
    .param p2, "incrementVal"    # J
    .param p4, "database"    # Ljava/lang/String;

    .prologue
    .line 260
    sget-object v0, Lcom/localytics/android/ProfileHandler$ProfileOperation;->INCREMENT:Lcom/localytics/android/ProfileHandler$ProfileOperation;

    invoke-static {p2, p3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v1

    invoke-direct {p0, v0, p1, v1, p4}, Lcom/localytics/android/ProfileHandler;->saveAttributeChange(Lcom/localytics/android/ProfileHandler$ProfileOperation;Ljava/lang/String;Ljava/lang/Object;Ljava/lang/String;)V

    .line 261
    return-void
.end method

.method removeProfileAttributesFromSet(Ljava/lang/String;[JLjava/lang/String;)V
    .locals 2
    .param p1, "attrName"    # Ljava/lang/String;
    .param p2, "attrValues"    # [J
    .param p3, "database"    # Ljava/lang/String;

    .prologue
    .line 245
    sget-object v0, Lcom/localytics/android/ProfileHandler$ProfileOperation;->SETREMOVE:Lcom/localytics/android/ProfileHandler$ProfileOperation;

    invoke-static {p2}, Lcom/localytics/android/ProfileHandler;->convertToObjectArray([J)[Ljava/lang/Long;

    move-result-object v1

    invoke-direct {p0, v0, p1, v1, p3}, Lcom/localytics/android/ProfileHandler;->saveAttributeChange(Lcom/localytics/android/ProfileHandler$ProfileOperation;Ljava/lang/String;Ljava/lang/Object;Ljava/lang/String;)V

    .line 246
    return-void
.end method

.method removeProfileAttributesFromSet(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)V
    .locals 1
    .param p1, "attrName"    # Ljava/lang/String;
    .param p2, "attrValues"    # [Ljava/lang/String;
    .param p3, "database"    # Ljava/lang/String;

    .prologue
    .line 250
    sget-object v0, Lcom/localytics/android/ProfileHandler$ProfileOperation;->SETREMOVE:Lcom/localytics/android/ProfileHandler$ProfileOperation;

    invoke-direct {p0, v0, p1, p2, p3}, Lcom/localytics/android/ProfileHandler;->saveAttributeChange(Lcom/localytics/android/ProfileHandler$ProfileOperation;Ljava/lang/String;Ljava/lang/Object;Ljava/lang/String;)V

    .line 251
    return-void
.end method

.method removeProfileAttributesFromSet(Ljava/lang/String;[Ljava/util/Date;Ljava/lang/String;)V
    .locals 2
    .param p1, "attrName"    # Ljava/lang/String;
    .param p2, "attrValues"    # [Ljava/util/Date;
    .param p3, "database"    # Ljava/lang/String;

    .prologue
    .line 255
    sget-object v0, Lcom/localytics/android/ProfileHandler$ProfileOperation;->SETREMOVE:Lcom/localytics/android/ProfileHandler$ProfileOperation;

    invoke-static {p2}, Lcom/localytics/android/ProfileHandler;->convertDateToString(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    invoke-direct {p0, v0, p1, v1, p3}, Lcom/localytics/android/ProfileHandler;->saveAttributeChange(Lcom/localytics/android/ProfileHandler$ProfileOperation;Ljava/lang/String;Ljava/lang/Object;Ljava/lang/String;)V

    .line 256
    return-void
.end method

.method setProfileAttribute(Ljava/lang/String;JLjava/lang/String;)V
    .locals 2
    .param p1, "attrName"    # Ljava/lang/String;
    .param p2, "attrValue"    # J
    .param p4, "database"    # Ljava/lang/String;

    .prologue
    .line 195
    sget-object v0, Lcom/localytics/android/ProfileHandler$ProfileOperation;->ASSIGN:Lcom/localytics/android/ProfileHandler$ProfileOperation;

    invoke-static {p2, p3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v1

    invoke-direct {p0, v0, p1, v1, p4}, Lcom/localytics/android/ProfileHandler;->saveAttributeChange(Lcom/localytics/android/ProfileHandler$ProfileOperation;Ljava/lang/String;Ljava/lang/Object;Ljava/lang/String;)V

    .line 196
    return-void
.end method

.method setProfileAttribute(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 1
    .param p1, "attrName"    # Ljava/lang/String;
    .param p2, "attrValue"    # Ljava/lang/String;
    .param p3, "database"    # Ljava/lang/String;

    .prologue
    .line 205
    sget-object v0, Lcom/localytics/android/ProfileHandler$ProfileOperation;->ASSIGN:Lcom/localytics/android/ProfileHandler$ProfileOperation;

    invoke-direct {p0, v0, p1, p2, p3}, Lcom/localytics/android/ProfileHandler;->saveAttributeChange(Lcom/localytics/android/ProfileHandler$ProfileOperation;Ljava/lang/String;Ljava/lang/Object;Ljava/lang/String;)V

    .line 206
    return-void
.end method

.method setProfileAttribute(Ljava/lang/String;Ljava/util/Date;Ljava/lang/String;)V
    .locals 2
    .param p1, "attrName"    # Ljava/lang/String;
    .param p2, "attrValue"    # Ljava/util/Date;
    .param p3, "database"    # Ljava/lang/String;

    .prologue
    .line 215
    sget-object v0, Lcom/localytics/android/ProfileHandler$ProfileOperation;->ASSIGN:Lcom/localytics/android/ProfileHandler$ProfileOperation;

    invoke-static {p2}, Lcom/localytics/android/ProfileHandler;->convertDateToString(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    invoke-direct {p0, v0, p1, v1, p3}, Lcom/localytics/android/ProfileHandler;->saveAttributeChange(Lcom/localytics/android/ProfileHandler$ProfileOperation;Ljava/lang/String;Ljava/lang/Object;Ljava/lang/String;)V

    .line 216
    return-void
.end method

.method setProfileAttribute(Ljava/lang/String;[JLjava/lang/String;)V
    .locals 2
    .param p1, "attrName"    # Ljava/lang/String;
    .param p2, "attrValues"    # [J
    .param p3, "database"    # Ljava/lang/String;

    .prologue
    .line 200
    sget-object v0, Lcom/localytics/android/ProfileHandler$ProfileOperation;->ASSIGN:Lcom/localytics/android/ProfileHandler$ProfileOperation;

    invoke-static {p2}, Lcom/localytics/android/ProfileHandler;->convertToObjectArray([J)[Ljava/lang/Long;

    move-result-object v1

    invoke-direct {p0, v0, p1, v1, p3}, Lcom/localytics/android/ProfileHandler;->saveAttributeChange(Lcom/localytics/android/ProfileHandler$ProfileOperation;Ljava/lang/String;Ljava/lang/Object;Ljava/lang/String;)V

    .line 201
    return-void
.end method

.method setProfileAttribute(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)V
    .locals 1
    .param p1, "attrName"    # Ljava/lang/String;
    .param p2, "attrValues"    # [Ljava/lang/String;
    .param p3, "database"    # Ljava/lang/String;

    .prologue
    .line 210
    sget-object v0, Lcom/localytics/android/ProfileHandler$ProfileOperation;->ASSIGN:Lcom/localytics/android/ProfileHandler$ProfileOperation;

    invoke-direct {p0, v0, p1, p2, p3}, Lcom/localytics/android/ProfileHandler;->saveAttributeChange(Lcom/localytics/android/ProfileHandler$ProfileOperation;Ljava/lang/String;Ljava/lang/Object;Ljava/lang/String;)V

    .line 211
    return-void
.end method

.method setProfileAttribute(Ljava/lang/String;[Ljava/util/Date;Ljava/lang/String;)V
    .locals 2
    .param p1, "attrName"    # Ljava/lang/String;
    .param p2, "attrValues"    # [Ljava/util/Date;
    .param p3, "database"    # Ljava/lang/String;

    .prologue
    .line 220
    sget-object v0, Lcom/localytics/android/ProfileHandler$ProfileOperation;->ASSIGN:Lcom/localytics/android/ProfileHandler$ProfileOperation;

    invoke-static {p2}, Lcom/localytics/android/ProfileHandler;->convertDateToString(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    invoke-direct {p0, v0, p1, v1, p3}, Lcom/localytics/android/ProfileHandler;->saveAttributeChange(Lcom/localytics/android/ProfileHandler$ProfileOperation;Ljava/lang/String;Ljava/lang/Object;Ljava/lang/String;)V

    .line 221
    return-void
.end method
