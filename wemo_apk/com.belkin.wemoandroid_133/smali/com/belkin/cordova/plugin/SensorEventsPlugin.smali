.class public Lcom/belkin/cordova/plugin/SensorEventsPlugin;
.super Lorg/apache/cordova/CordovaPlugin;
.source "SensorEventsPlugin.java"


# static fields
.field public static final ACTION_CALL_EMERGENCY_CONTACT:Ljava/lang/String; = "callEmergencyContact"

.field public static final ACTION_GET_CONTACT_LIST:Ljava/lang/String; = "getContactList"

.field public static final ACTION_GET_EMERGENCY_CONTACT:Ljava/lang/String; = "getEmergencyContact"

.field public static final ACTION_GET_EVENTS_FROM_DB:Ljava/lang/String; = "getEventHistoryFromDB"

.field public static final ACTION_GET_EVENT_HISTORY:Ljava/lang/String; = "getEventHistory"

.field public static final ACTION_GET_SENSOR_NOTIFICATIONS_COUNT:Ljava/lang/String; = "getSensorNotificationsCount"

.field public static final ACTION_SET_EMERGENCY_CONTACT:Ljava/lang/String; = "setEmergencyContact"

.field public static final TAG:Ljava/lang/String; = "SensorEventsPlugin"


# instance fields
.field private mAppController:Lcom/belkin/controller/AppController;

.field private mContext:Landroid/content/Context;


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 42
    invoke-direct {p0}, Lorg/apache/cordova/CordovaPlugin;-><init>()V

    .line 39
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/belkin/cordova/plugin/SensorEventsPlugin;->mContext:Landroid/content/Context;

    .line 44
    return-void
.end method

.method static synthetic access$000(Lcom/belkin/cordova/plugin/SensorEventsPlugin;)Lcom/belkin/controller/AppController;
    .locals 1
    .param p0, "x0"    # Lcom/belkin/cordova/plugin/SensorEventsPlugin;

    .prologue
    .line 28
    iget-object v0, p0, Lcom/belkin/cordova/plugin/SensorEventsPlugin;->mAppController:Lcom/belkin/controller/AppController;

    return-object v0
.end method


# virtual methods
.method public execute(Ljava/lang/String;Lorg/json/JSONArray;Lorg/apache/cordova/CallbackContext;)Z
    .locals 16
    .param p1, "action"    # Ljava/lang/String;
    .param p2, "inParamArray"    # Lorg/json/JSONArray;
    .param p3, "callbackContext"    # Lorg/apache/cordova/CallbackContext;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .prologue
    .line 57
    const-string v11, "SensorEventsPlugin"

    new-instance v12, Ljava/lang/StringBuilder;

    invoke-direct {v12}, Ljava/lang/StringBuilder;-><init>()V

    const-string v13, "action: "

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    move-object/from16 v0, p1

    invoke-virtual {v12, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v12

    invoke-static {v11, v12}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 59
    const-string v11, "getSensorNotificationsCount"

    move-object/from16 v0, p1

    invoke-virtual {v11, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v11

    if-eqz v11, :cond_1

    .line 60
    new-instance v11, Ljava/lang/StringBuilder;

    invoke-direct {v11}, Ljava/lang/StringBuilder;-><init>()V

    const-string v12, ""

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    move-object/from16 v0, p0

    iget-object v12, v0, Lcom/belkin/cordova/plugin/SensorEventsPlugin;->mContext:Landroid/content/Context;

    invoke-static {v12}, Lcom/belkin/wemo/cache/utils/SharePreferences;->getSensorEventsCount(Landroid/content/Context;)I

    move-result v12

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    .line 61
    .local v9, "notificationsCount":Ljava/lang/String;
    new-instance v6, Lorg/apache/cordova/PluginResult;

    sget-object v11, Lorg/apache/cordova/PluginResult$Status;->OK:Lorg/apache/cordova/PluginResult$Status;

    invoke-direct {v6, v11, v9}, Lorg/apache/cordova/PluginResult;-><init>(Lorg/apache/cordova/PluginResult$Status;Ljava/lang/String;)V

    .line 62
    .local v6, "dataresult":Lorg/apache/cordova/PluginResult;
    const/4 v11, 0x0

    invoke-virtual {v6, v11}, Lorg/apache/cordova/PluginResult;->setKeepCallback(Z)V

    .line 63
    move-object/from16 v0, p3

    invoke-virtual {v0, v6}, Lorg/apache/cordova/CallbackContext;->sendPluginResult(Lorg/apache/cordova/PluginResult;)V

    .line 136
    .end local v6    # "dataresult":Lorg/apache/cordova/PluginResult;
    .end local v9    # "notificationsCount":Ljava/lang/String;
    :cond_0
    :goto_0
    const/4 v11, 0x1

    return v11

    .line 65
    :cond_1
    const-string v11, "callEmergencyContact"

    move-object/from16 v0, p1

    invoke-virtual {v11, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v11

    if-eqz v11, :cond_3

    .line 67
    const/4 v11, 0x0

    move-object/from16 v0, p2

    invoke-virtual {v0, v11}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v11

    const-string v12, "Number"

    invoke-virtual {v11, v12}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    .line 68
    .local v8, "emergencyNumber":Ljava/lang/String;
    const-string v11, "SensorEventsPlugin"

    new-instance v12, Ljava/lang/StringBuilder;

    invoke-direct {v12}, Ljava/lang/StringBuilder;-><init>()V

    const-string v13, "Emergency Params: "

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v12

    invoke-static {v11, v12}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 70
    move-object/from16 v0, p0

    iget-object v11, v0, Lcom/belkin/cordova/plugin/SensorEventsPlugin;->mAppController:Lcom/belkin/controller/AppController;

    move-object/from16 v0, p0

    iget-object v12, v0, Lcom/belkin/cordova/plugin/SensorEventsPlugin;->mContext:Landroid/content/Context;

    invoke-virtual {v11, v8, v12}, Lcom/belkin/controller/AppController;->callEmergencyContact(Ljava/lang/String;Landroid/content/Context;)Z

    move-result v10

    .line 71
    .local v10, "result":Z
    const-string v11, "SensorEventsPlugin"

    new-instance v12, Ljava/lang/StringBuilder;

    invoke-direct {v12}, Ljava/lang/StringBuilder;-><init>()V

    const-string v13, "Result for callEmergencyContact :: "

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12, v10}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v12

    invoke-static {v11, v12}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 72
    if-eqz v10, :cond_2

    .line 73
    new-instance v6, Lorg/apache/cordova/PluginResult;

    sget-object v11, Lorg/apache/cordova/PluginResult$Status;->OK:Lorg/apache/cordova/PluginResult$Status;

    new-instance v12, Lorg/json/JSONObject;

    invoke-direct {v12}, Lorg/json/JSONObject;-><init>()V

    invoke-direct {v6, v11, v12}, Lorg/apache/cordova/PluginResult;-><init>(Lorg/apache/cordova/PluginResult$Status;Lorg/json/JSONObject;)V

    .line 74
    .restart local v6    # "dataresult":Lorg/apache/cordova/PluginResult;
    const/4 v11, 0x0

    invoke-virtual {v6, v11}, Lorg/apache/cordova/PluginResult;->setKeepCallback(Z)V

    .line 75
    move-object/from16 v0, p3

    invoke-virtual {v0, v6}, Lorg/apache/cordova/CallbackContext;->sendPluginResult(Lorg/apache/cordova/PluginResult;)V

    goto :goto_0

    .line 77
    .end local v6    # "dataresult":Lorg/apache/cordova/PluginResult;
    :cond_2
    new-instance v6, Lorg/apache/cordova/PluginResult;

    sget-object v11, Lorg/apache/cordova/PluginResult$Status;->ERROR:Lorg/apache/cordova/PluginResult$Status;

    invoke-direct {v6, v11}, Lorg/apache/cordova/PluginResult;-><init>(Lorg/apache/cordova/PluginResult$Status;)V

    .line 78
    .restart local v6    # "dataresult":Lorg/apache/cordova/PluginResult;
    const/4 v11, 0x0

    invoke-virtual {v6, v11}, Lorg/apache/cordova/PluginResult;->setKeepCallback(Z)V

    .line 79
    move-object/from16 v0, p3

    invoke-virtual {v0, v6}, Lorg/apache/cordova/CallbackContext;->sendPluginResult(Lorg/apache/cordova/PluginResult;)V

    goto :goto_0

    .line 82
    .end local v6    # "dataresult":Lorg/apache/cordova/PluginResult;
    .end local v8    # "emergencyNumber":Ljava/lang/String;
    .end local v10    # "result":Z
    :cond_3
    const-string v11, "getEventHistory"

    move-object/from16 v0, p1

    invoke-virtual {v11, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v11

    if-eqz v11, :cond_4

    .line 83
    const-string v11, "SensorEventsPlugin"

    new-instance v12, Ljava/lang/StringBuilder;

    invoke-direct {v12}, Ljava/lang/StringBuilder;-><init>()V

    const-string v13, ":: ACTION_GET_EVENT_HISTORY :: 1st param :: "

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    const/4 v13, 0x0

    move-object/from16 v0, p2

    invoke-virtual {v0, v13}, Lorg/json/JSONArray;->getString(I)Ljava/lang/String;

    move-result-object v13

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    const-string v13, ":: 2nd param ::"

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    const/4 v13, 0x1

    move-object/from16 v0, p2

    invoke-virtual {v0, v13}, Lorg/json/JSONArray;->getLong(I)J

    move-result-wide v14

    invoke-virtual {v12, v14, v15}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v12

    invoke-static {v11, v12}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 84
    move-object/from16 v0, p0

    iget-object v11, v0, Lcom/belkin/cordova/plugin/SensorEventsPlugin;->mContext:Landroid/content/Context;

    invoke-static {v11}, Lcom/belkin/wemo/cache/utils/SharePreferences;->resetSensorEventCounter(Landroid/content/Context;)V

    .line 85
    new-instance v3, Lcom/belkin/devices/callback/GetSensorEventHistoryCallBack;

    move-object/from16 v0, p3

    invoke-direct {v3, v0}, Lcom/belkin/devices/callback/GetSensorEventHistoryCallBack;-><init>(Lorg/apache/cordova/CallbackContext;)V

    .line 86
    .local v3, "callback":Lcom/belkin/devices/callback/GetSensorEventHistoryCallBack;
    new-instance v11, Lcom/belkin/devices/runnable/GetSensorEventRunnable;

    move-object/from16 v0, p0

    iget-object v12, v0, Lcom/belkin/cordova/plugin/SensorEventsPlugin;->mContext:Landroid/content/Context;

    move-object/from16 v0, p2

    invoke-direct {v11, v3, v12, v0}, Lcom/belkin/devices/runnable/GetSensorEventRunnable;-><init>(Lcom/belkin/devices/callback/GetSensorEventHistoryCallBack;Landroid/content/Context;Lorg/json/JSONArray;)V

    invoke-static {v11}, Lcom/belkin/wemo/thread/WeMoThreadPoolHandler;->executeInBackground(Ljava/lang/Runnable;)V

    goto/16 :goto_0

    .line 88
    .end local v3    # "callback":Lcom/belkin/devices/callback/GetSensorEventHistoryCallBack;
    :cond_4
    const-string v11, "getEventHistoryFromDB"

    move-object/from16 v0, p1

    invoke-virtual {v11, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v11

    if-eqz v11, :cond_5

    .line 89
    const-string v11, "SensorEventsPlugin"

    const-string v12, ":: ACTION_GET_EVENTS_FROM_DB :: "

    invoke-static {v11, v12}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 90
    new-instance v3, Lcom/belkin/devices/callback/GetSensorEventFromDBCallBack;

    move-object/from16 v0, p3

    invoke-direct {v3, v0}, Lcom/belkin/devices/callback/GetSensorEventFromDBCallBack;-><init>(Lorg/apache/cordova/CallbackContext;)V

    .line 91
    .local v3, "callback":Lcom/belkin/devices/callback/GetSensorEventFromDBCallBack;
    new-instance v11, Lcom/belkin/devices/runnable/GetSensorEventsFromDBRunnable;

    move-object/from16 v0, p0

    iget-object v12, v0, Lcom/belkin/cordova/plugin/SensorEventsPlugin;->mContext:Landroid/content/Context;

    invoke-direct {v11, v3, v12}, Lcom/belkin/devices/runnable/GetSensorEventsFromDBRunnable;-><init>(Lcom/belkin/devices/callback/GetSensorEventFromDBCallBack;Landroid/content/Context;)V

    invoke-static {v11}, Lcom/belkin/wemo/thread/WeMoThreadPoolHandler;->executeInBackground(Ljava/lang/Runnable;)V

    goto/16 :goto_0

    .line 93
    .end local v3    # "callback":Lcom/belkin/devices/callback/GetSensorEventFromDBCallBack;
    :cond_5
    const-string v11, "getContactList"

    move-object/from16 v0, p1

    invoke-virtual {v11, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v11

    if-eqz v11, :cond_6

    .line 95
    move-object/from16 v4, p3

    .line 96
    .local v4, "callbackContxt":Lorg/apache/cordova/CallbackContext;
    new-instance v11, Ljava/lang/Thread;

    new-instance v12, Lcom/belkin/cordova/plugin/SensorEventsPlugin$1;

    move-object/from16 v0, p0

    invoke-direct {v12, v0, v4}, Lcom/belkin/cordova/plugin/SensorEventsPlugin$1;-><init>(Lcom/belkin/cordova/plugin/SensorEventsPlugin;Lorg/apache/cordova/CallbackContext;)V

    invoke-direct {v11, v12}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    invoke-virtual {v11}, Ljava/lang/Thread;->start()V

    goto/16 :goto_0

    .line 115
    .end local v4    # "callbackContxt":Lorg/apache/cordova/CallbackContext;
    :cond_6
    const-string v11, "setEmergencyContact"

    move-object/from16 v0, p1

    invoke-virtual {v11, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v11

    if-eqz v11, :cond_8

    .line 116
    const/4 v11, 0x0

    move-object/from16 v0, p2

    invoke-virtual {v0, v11}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v5

    .line 117
    .local v5, "contactsObject":Lorg/json/JSONObject;
    const-string v2, ""

    .line 118
    .local v2, "bridgeUDN":Ljava/lang/String;
    const-string v11, "SensorEventsPlugin"

    new-instance v12, Ljava/lang/StringBuilder;

    invoke-direct {v12}, Ljava/lang/StringBuilder;-><init>()V

    const-string v13, "Emergency contact: "

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v12

    invoke-static {v11, v12}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 119
    invoke-virtual {v5}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v7

    .line 120
    .local v7, "emergencyContactsInfo":Ljava/lang/String;
    invoke-virtual/range {p2 .. p2}, Lorg/json/JSONArray;->length()I

    move-result v11

    const/4 v12, 0x1

    if-le v11, v12, :cond_7

    .line 121
    const/4 v11, 0x1

    move-object/from16 v0, p2

    invoke-virtual {v0, v11}, Lorg/json/JSONArray;->getString(I)Ljava/lang/String;

    move-result-object v2

    .line 123
    :cond_7
    new-instance v3, Lcom/belkin/devices/callback/SetDataStoreOnLinkCallBack;

    move-object/from16 v0, p3

    invoke-direct {v3, v0}, Lcom/belkin/devices/callback/SetDataStoreOnLinkCallBack;-><init>(Lorg/apache/cordova/CallbackContext;)V

    .line 124
    .local v3, "callback":Lcom/belkin/devices/callback/SetDataStoreOnLinkCallBack;
    new-instance v11, Lcom/belkin/devices/runnable/SetDataStoreRunnable;

    move-object/from16 v0, p0

    iget-object v12, v0, Lcom/belkin/cordova/plugin/SensorEventsPlugin;->mContext:Landroid/content/Context;

    invoke-direct {v11, v2, v3, v12, v7}, Lcom/belkin/devices/runnable/SetDataStoreRunnable;-><init>(Ljava/lang/String;Lcom/belkin/devices/callback/SetDataStoreOnLinkCallBack;Landroid/content/Context;Ljava/lang/String;)V

    invoke-static {v11}, Lcom/belkin/wemo/thread/WeMoThreadPoolHandler;->executeInBackground(Ljava/lang/Runnable;)V

    goto/16 :goto_0

    .line 126
    .end local v2    # "bridgeUDN":Ljava/lang/String;
    .end local v3    # "callback":Lcom/belkin/devices/callback/SetDataStoreOnLinkCallBack;
    .end local v5    # "contactsObject":Lorg/json/JSONObject;
    .end local v7    # "emergencyContactsInfo":Ljava/lang/String;
    :cond_8
    const-string v11, "getEmergencyContact"

    move-object/from16 v0, p1

    invoke-virtual {v11, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v11

    if-eqz v11, :cond_0

    .line 127
    const-string v2, ""

    .line 128
    .restart local v2    # "bridgeUDN":Ljava/lang/String;
    invoke-virtual/range {p2 .. p2}, Lorg/json/JSONArray;->length()I

    move-result v11

    const/4 v12, 0x1

    if-lt v11, v12, :cond_9

    .line 129
    const/4 v11, 0x0

    move-object/from16 v0, p2

    invoke-virtual {v0, v11}, Lorg/json/JSONArray;->getString(I)Ljava/lang/String;

    move-result-object v2

    .line 131
    :cond_9
    const-string v11, "SensorEventsPlugin"

    new-instance v12, Ljava/lang/StringBuilder;

    invoke-direct {v12}, Ljava/lang/StringBuilder;-><init>()V

    const-string v13, "ACTION_GET_EMERGENCY_CONTACT :: bridgeUDN"

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v12

    invoke-static {v11, v12}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 132
    new-instance v3, Lcom/belkin/devices/callback/GetDataStoreOnLinkCallBack;

    move-object/from16 v0, p3

    invoke-direct {v3, v0}, Lcom/belkin/devices/callback/GetDataStoreOnLinkCallBack;-><init>(Lorg/apache/cordova/CallbackContext;)V

    .line 133
    .local v3, "callback":Lcom/belkin/devices/callback/GetDataStoreOnLinkCallBack;
    new-instance v11, Lcom/belkin/devices/runnable/GetDataStoreRunnable;

    move-object/from16 v0, p0

    iget-object v12, v0, Lcom/belkin/cordova/plugin/SensorEventsPlugin;->mContext:Landroid/content/Context;

    invoke-direct {v11, v2, v3, v12}, Lcom/belkin/devices/runnable/GetDataStoreRunnable;-><init>(Ljava/lang/String;Lcom/belkin/devices/callback/GetDataStoreOnLinkCallBack;Landroid/content/Context;)V

    invoke-static {v11}, Lcom/belkin/wemo/thread/WeMoThreadPoolHandler;->executeInBackground(Ljava/lang/Runnable;)V

    goto/16 :goto_0
.end method

.method public initialize(Lorg/apache/cordova/CordovaInterface;Lorg/apache/cordova/CordovaWebView;)V
    .locals 2
    .param p1, "cordova"    # Lorg/apache/cordova/CordovaInterface;
    .param p2, "webView"    # Lorg/apache/cordova/CordovaWebView;

    .prologue
    .line 48
    const-string v0, "SensorEventsPlugin"

    const-string v1, "SensorEventsPlugin initialize"

    invoke-static {v0, v1}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 49
    invoke-super {p0, p1, p2}, Lorg/apache/cordova/CordovaPlugin;->initialize(Lorg/apache/cordova/CordovaInterface;Lorg/apache/cordova/CordovaWebView;)V

    .line 50
    invoke-interface {p1}, Lorg/apache/cordova/CordovaInterface;->getActivity()Landroid/app/Activity;

    move-result-object v0

    iput-object v0, p0, Lcom/belkin/cordova/plugin/SensorEventsPlugin;->mContext:Landroid/content/Context;

    .line 51
    iget-object v0, p0, Lcom/belkin/cordova/plugin/SensorEventsPlugin;->mContext:Landroid/content/Context;

    invoke-static {v0}, Lcom/belkin/controller/AppController;->getInstance(Landroid/content/Context;)Lcom/belkin/controller/AppController;

    move-result-object v0

    iput-object v0, p0, Lcom/belkin/cordova/plugin/SensorEventsPlugin;->mAppController:Lcom/belkin/controller/AppController;

    .line 52
    return-void
.end method
