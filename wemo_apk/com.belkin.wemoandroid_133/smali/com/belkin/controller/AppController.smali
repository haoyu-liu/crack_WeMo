.class public Lcom/belkin/controller/AppController;
.super Ljava/lang/Object;
.source "AppController.java"


# static fields
.field public static final TAG:Ljava/lang/String; = "AppController"

.field private static appController:Lcom/belkin/controller/AppController;


# instance fields
.field private mContext:Landroid/content/Context;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 28
    const/4 v0, 0x0

    sput-object v0, Lcom/belkin/controller/AppController;->appController:Lcom/belkin/controller/AppController;

    return-void
.end method

.method private constructor <init>(Landroid/content/Context;)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 43
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 29
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/belkin/controller/AppController;->mContext:Landroid/content/Context;

    .line 44
    iput-object p1, p0, Lcom/belkin/controller/AppController;->mContext:Landroid/content/Context;

    .line 45
    return-void
.end method

.method public static declared-synchronized getInstance(Landroid/content/Context;)Lcom/belkin/controller/AppController;
    .locals 2
    .param p0, "context"    # Landroid/content/Context;

    .prologue
    .line 37
    const-class v1, Lcom/belkin/controller/AppController;

    monitor-enter v1

    :try_start_0
    sget-object v0, Lcom/belkin/controller/AppController;->appController:Lcom/belkin/controller/AppController;

    if-nez v0, :cond_0

    .line 38
    new-instance v0, Lcom/belkin/controller/AppController;

    invoke-direct {v0, p0}, Lcom/belkin/controller/AppController;-><init>(Landroid/content/Context;)V

    sput-object v0, Lcom/belkin/controller/AppController;->appController:Lcom/belkin/controller/AppController;

    .line 40
    :cond_0
    sget-object v0, Lcom/belkin/controller/AppController;->appController:Lcom/belkin/controller/AppController;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit v1

    return-object v0

    .line 37
    :catchall_0
    move-exception v0

    monitor-exit v1

    throw v0
.end method


# virtual methods
.method public callEmergencyContact(Ljava/lang/String;Landroid/content/Context;)Z
    .locals 7
    .param p1, "phoneNumber"    # Ljava/lang/String;
    .param p2, "activityContext"    # Landroid/content/Context;

    .prologue
    .line 109
    const/4 v3, 0x0

    .line 110
    .local v3, "isRequestCompleted":Z
    if-eqz p2, :cond_1

    .line 111
    invoke-virtual {p2}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v4

    const-string v5, "android.hardware.telephony"

    invoke-virtual {v4, v5}, Landroid/content/pm/PackageManager;->hasSystemFeature(Ljava/lang/String;)Z

    move-result v1

    .line 112
    .local v1, "hasPhone":Z
    if-eqz v1, :cond_1

    .line 114
    :try_start_0
    new-instance v2, Landroid/content/Intent;

    const-string v4, "android.intent.action.DIAL"

    invoke-direct {v2, v4}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 115
    .local v2, "intent":Landroid/content/Intent;
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v4

    if-nez v4, :cond_0

    .line 116
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "tel:"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-static {p1}, Landroid/net/Uri;->encode(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v4

    invoke-virtual {v2, v4}, Landroid/content/Intent;->setData(Landroid/net/Uri;)Landroid/content/Intent;

    .line 119
    :cond_0
    const/high16 v4, 0x10000000

    invoke-virtual {v2, v4}, Landroid/content/Intent;->setFlags(I)Landroid/content/Intent;

    .line 120
    const/4 v3, 0x1

    .line 121
    invoke-virtual {p2, v2}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V
    :try_end_0
    .catch Landroid/content/ActivityNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    .line 130
    .end local v1    # "hasPhone":Z
    .end local v2    # "intent":Landroid/content/Intent;
    :cond_1
    :goto_0
    return v3

    .line 123
    .restart local v1    # "hasPhone":Z
    :catch_0
    move-exception v0

    .line 124
    .local v0, "e":Landroid/content/ActivityNotFoundException;
    const-string v4, "AppController"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "Exception in launching the DIAL PAD application:: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Lcom/belkin/utils/LogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 125
    const/4 v3, 0x0

    goto :goto_0
.end method

.method public getContactsList()Lorg/json/JSONArray;
    .locals 17

    .prologue
    .line 63
    new-instance v12, Lorg/json/JSONArray;

    invoke-direct {v12}, Lorg/json/JSONArray;-><init>()V

    .line 65
    .local v12, "mContactListArray":Lorg/json/JSONArray;
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/belkin/controller/AppController;->mContext:Landroid/content/Context;

    invoke-virtual {v2}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v1

    .line 66
    .local v1, "cr":Landroid/content/ContentResolver;
    sget-object v2, Landroid/provider/ContactsContract$Contacts;->CONTENT_URI:Landroid/net/Uri;

    const/4 v3, 0x0

    const/4 v4, 0x0

    const/4 v5, 0x0

    const-string v6, "display_name ASC"

    invoke-virtual/range {v1 .. v6}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v10

    .line 68
    .local v10, "contactsCursor":Landroid/database/Cursor;
    invoke-interface {v10}, Landroid/database/Cursor;->getCount()I

    move-result v2

    if-lez v2, :cond_3

    .line 70
    :goto_0
    invoke-interface {v10}, Landroid/database/Cursor;->moveToNext()Z

    move-result v2

    if-eqz v2, :cond_3

    .line 71
    const-string v2, "_id"

    invoke-interface {v10, v2}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v2

    invoke-interface {v10, v2}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v7

    .line 73
    .local v7, "contactId":Ljava/lang/String;
    sget-object v2, Landroid/provider/ContactsContract$CommonDataKinds$Phone;->CONTENT_URI:Landroid/net/Uri;

    const/4 v3, 0x0

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "contact_id = "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    const/4 v5, 0x0

    const/4 v6, 0x0

    invoke-virtual/range {v1 .. v6}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v13

    .line 76
    .local v13, "phoneCursor":Landroid/database/Cursor;
    :cond_0
    :goto_1
    invoke-interface {v13}, Landroid/database/Cursor;->moveToNext()Z

    move-result v2

    if-eqz v2, :cond_2

    .line 77
    new-instance v8, Lorg/json/JSONObject;

    invoke-direct {v8}, Lorg/json/JSONObject;-><init>()V

    .line 78
    .local v8, "contactInfo":Lorg/json/JSONObject;
    const-string v2, "data1"

    invoke-interface {v13, v2}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v2

    invoke-interface {v13, v2}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v14

    .line 79
    .local v14, "phoneNumber":Ljava/lang/String;
    const-string v2, "data2"

    invoke-interface {v13, v2}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v2

    invoke-interface {v13, v2}, Landroid/database/Cursor;->getInt(I)I

    move-result v15

    .line 80
    .local v15, "phoneType":I
    const-string v2, "display_name"

    invoke-interface {v10, v2}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v2

    invoke-interface {v10, v2}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v9

    .line 81
    .local v9, "contactName":Ljava/lang/String;
    const-string v16, ""

    .line 83
    .local v16, "phoneTypeLabel":Ljava/lang/String;
    if-nez v15, :cond_1

    .line 84
    const-string v2, "data3"

    invoke-interface {v13, v2}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v2

    invoke-interface {v13, v2}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v16

    .line 90
    :goto_2
    if-eqz v14, :cond_0

    :try_start_0
    invoke-virtual {v14}, Ljava/lang/String;->isEmpty()Z

    move-result v2

    if-nez v2, :cond_0

    .line 91
    const-string v2, "contactName"

    invoke-virtual {v8, v2, v9}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 92
    const-string v2, "phoneNumber"

    invoke-virtual {v8, v2, v14}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 93
    const-string v2, "phoneType"

    move-object/from16 v0, v16

    invoke-virtual {v8, v2, v0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 94
    invoke-virtual {v12, v8}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_1

    .line 96
    :catch_0
    move-exception v11

    .line 97
    .local v11, "e":Lorg/json/JSONException;
    invoke-virtual {v11}, Lorg/json/JSONException;->printStackTrace()V

    goto :goto_1

    .line 86
    .end local v11    # "e":Lorg/json/JSONException;
    :cond_1
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/belkin/controller/AppController;->mContext:Landroid/content/Context;

    invoke-virtual {v2}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    const-string v3, ""

    invoke-static {v2, v15, v3}, Landroid/provider/ContactsContract$CommonDataKinds$Phone;->getTypeLabel(Landroid/content/res/Resources;ILjava/lang/CharSequence;)Ljava/lang/CharSequence;

    move-result-object v16

    .end local v16    # "phoneTypeLabel":Ljava/lang/String;
    check-cast v16, Ljava/lang/String;

    .restart local v16    # "phoneTypeLabel":Ljava/lang/String;
    goto :goto_2

    .line 100
    .end local v8    # "contactInfo":Lorg/json/JSONObject;
    .end local v9    # "contactName":Ljava/lang/String;
    .end local v14    # "phoneNumber":Ljava/lang/String;
    .end local v15    # "phoneType":I
    .end local v16    # "phoneTypeLabel":Ljava/lang/String;
    :cond_2
    invoke-interface {v13}, Landroid/database/Cursor;->close()V

    goto/16 :goto_0

    .line 103
    .end local v7    # "contactId":Ljava/lang/String;
    .end local v13    # "phoneCursor":Landroid/database/Cursor;
    :cond_3
    invoke-interface {v10}, Landroid/database/Cursor;->close()V

    .line 105
    return-object v12
.end method

.method public sendJSCallBack(Lorg/apache/cordova/CordovaWebView;Ljava/lang/String;)V
    .locals 1
    .param p1, "appWebView"    # Lorg/apache/cordova/CordovaWebView;
    .param p2, "cb"    # Ljava/lang/String;

    .prologue
    .line 51
    const-string v0, "appController:Native:sendJavascriptCB cb"

    invoke-static {v0, p2}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 52
    if-eqz p1, :cond_0

    .line 53
    invoke-interface {p1, p2}, Lorg/apache/cordova/CordovaWebView;->sendJavascript(Ljava/lang/String;)V

    .line 55
    :cond_0
    return-void
.end method
