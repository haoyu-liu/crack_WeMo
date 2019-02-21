.class public Lcom/belkin/wemo/push/service/GCMIntentService;
.super Lcom/belkin/wemo/push/service/PushNotificationIntentService;
.source "GCMIntentService.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/belkin/wemo/push/service/GCMIntentService$StoreDeviceRulesCallback;,
        Lcom/belkin/wemo/push/service/GCMIntentService$FetchDevicesRulesCallback;
    }
.end annotation


# static fields
.field public static final DELETED_MSG_STUB:Ljava/lang/String; = "Messages deleted on server"

.field public static final ERROR_STUB:Ljava/lang/String; = "Error received in GCM Push Notification"

.field public static final GCM_SERVICE_NAME:Ljava/lang/String; = "GCMIntentService"

.field public static final KEY_PAYLOAD:Ljava/lang/String; = "payload"

.field public static rMRulesDBManager:Lcom/belkin/rules/db/RMRulesDBManager;

.field public static sDeviceListManager:Lcom/belkin/wemo/cache/devicelist/DeviceListManager;


# instance fields
.field weeklyRecordsHashMap:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "[",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 50
    const-string v0, "GCMIntentService"

    invoke-direct {p0, v0}, Lcom/belkin/wemo/push/service/PushNotificationIntentService;-><init>(Ljava/lang/String;)V

    .line 42
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/belkin/wemo/push/service/GCMIntentService;->weeklyRecordsHashMap:Ljava/util/HashMap;

    .line 51
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;)V
    .locals 1
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    .line 46
    invoke-direct {p0, p1}, Lcom/belkin/wemo/push/service/PushNotificationIntentService;-><init>(Ljava/lang/String;)V

    .line 42
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/belkin/wemo/push/service/GCMIntentService;->weeklyRecordsHashMap:Ljava/util/HashMap;

    .line 47
    return-void
.end method

.method private getMessageType(Landroid/content/Intent;)Ljava/lang/String;
    .locals 5
    .param p1, "intent"    # Landroid/content/Intent;

    .prologue
    .line 240
    invoke-static {p0}, Lcom/google/android/gms/gcm/GoogleCloudMessaging;->getInstance(Landroid/content/Context;)Lcom/google/android/gms/gcm/GoogleCloudMessaging;

    move-result-object v0

    .line 242
    .local v0, "gcm":Lcom/google/android/gms/gcm/GoogleCloudMessaging;
    invoke-virtual {v0, p1}, Lcom/google/android/gms/gcm/GoogleCloudMessaging;->getMessageType(Landroid/content/Intent;)Ljava/lang/String;

    move-result-object v1

    .line 243
    .local v1, "messageType":Ljava/lang/String;
    iget-object v2, p0, Lcom/belkin/wemo/push/service/GCMIntentService;->TAG:Ljava/lang/String;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Push Notification: GCM message received - message type: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 245
    return-object v1
.end method


# virtual methods
.method protected getNotificationMessage(Landroid/content/Intent;)Lcom/belkin/wemo/push/PushNotificationInfo;
    .locals 27
    .param p1, "intent"    # Landroid/content/Intent;

    .prologue
    .line 55
    new-instance v18, Ljava/lang/String;

    invoke-direct/range {v18 .. v18}, Ljava/lang/String;-><init>()V

    .line 57
    .local v18, "notificationMessage":Ljava/lang/String;
    new-instance v15, Lcom/belkin/wemo/push/PushNotificationInfo;

    invoke-direct {v15}, Lcom/belkin/wemo/push/PushNotificationInfo;-><init>()V

    .line 59
    .local v15, "messageInfo":Lcom/belkin/wemo/push/PushNotificationInfo;
    invoke-virtual/range {p1 .. p1}, Landroid/content/Intent;->getExtras()Landroid/os/Bundle;

    move-result-object v10

    .line 60
    .local v10, "extras":Landroid/os/Bundle;
    invoke-direct/range {p0 .. p1}, Lcom/belkin/wemo/push/service/GCMIntentService;->getMessageType(Landroid/content/Intent;)Ljava/lang/String;

    move-result-object v16

    .line 62
    .local v16, "messageType":Ljava/lang/String;
    invoke-virtual {v10}, Landroid/os/Bundle;->isEmpty()Z

    move-result v23

    if-nez v23, :cond_1

    .line 63
    invoke-static {}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->isDebug()Z

    move-result v23

    if-eqz v23, :cond_0

    .line 64
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/wemo/push/service/GCMIntentService;->TAG:Ljava/lang/String;

    move-object/from16 v23, v0

    new-instance v24, Ljava/lang/StringBuilder;

    invoke-direct/range {v24 .. v24}, Ljava/lang/StringBuilder;-><init>()V

    const-string v25, "Push Notification Bundle. Printing the Intent: "

    invoke-virtual/range {v24 .. v25}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v24

    invoke-virtual/range {p1 .. p1}, Landroid/content/Intent;->toString()Ljava/lang/String;

    move-result-object v25

    invoke-virtual/range {v24 .. v25}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v24

    invoke-virtual/range {v24 .. v24}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v24

    invoke-static/range {v23 .. v24}, Lcom/belkin/utils/LogUtils;->debugLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 65
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/wemo/push/service/GCMIntentService;->TAG:Ljava/lang/String;

    move-object/from16 v23, v0

    new-instance v24, Ljava/lang/StringBuilder;

    invoke-direct/range {v24 .. v24}, Ljava/lang/StringBuilder;-><init>()V

    const-string v25, "Push Notification Bundle. Printing the Extras inside Intent: "

    invoke-virtual/range {v24 .. v25}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v24

    invoke-virtual {v10}, Landroid/os/Bundle;->toString()Ljava/lang/String;

    move-result-object v25

    invoke-virtual/range {v24 .. v25}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v24

    invoke-virtual/range {v24 .. v24}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v24

    invoke-static/range {v23 .. v24}, Lcom/belkin/utils/LogUtils;->debugLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 66
    invoke-virtual {v10}, Landroid/os/Bundle;->keySet()Ljava/util/Set;

    move-result-object v23

    invoke-interface/range {v23 .. v23}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v12

    .local v12, "i$":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v12}, Ljava/util/Iterator;->hasNext()Z

    move-result v23

    if-eqz v23, :cond_0

    invoke-interface {v12}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v13

    check-cast v13, Ljava/lang/String;

    .line 68
    .local v13, "key":Ljava/lang/String;
    :try_start_0
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/wemo/push/service/GCMIntentService;->TAG:Ljava/lang/String;

    move-object/from16 v23, v0

    new-instance v24, Ljava/lang/StringBuilder;

    invoke-direct/range {v24 .. v24}, Ljava/lang/StringBuilder;-><init>()V

    const-string v25, "Push Notification Bundle. Key: "

    invoke-virtual/range {v24 .. v25}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v24

    move-object/from16 v0, v24

    invoke-virtual {v0, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v24

    const-string v25, "; Value: "

    invoke-virtual/range {v24 .. v25}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v24

    invoke-virtual {v10, v13}, Landroid/os/Bundle;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v25

    invoke-virtual/range {v24 .. v25}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v24

    invoke-virtual/range {v24 .. v24}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v24

    invoke-static/range {v23 .. v24}, Lcom/belkin/utils/LogUtils;->debugLog(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 69
    :catch_0
    move-exception v6

    .line 70
    .local v6, "e":Ljava/lang/Exception;
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/wemo/push/service/GCMIntentService;->TAG:Ljava/lang/String;

    move-object/from16 v23, v0

    const-string v24, "Exception while iterating over Push Notification Bundle Extras: "

    move-object/from16 v0, v23

    move-object/from16 v1, v24

    invoke-static {v0, v1, v6}, Lcom/belkin/utils/LogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_0

    .line 76
    .end local v6    # "e":Ljava/lang/Exception;
    .end local v12    # "i$":Ljava/util/Iterator;
    .end local v13    # "key":Ljava/lang/String;
    :cond_0
    const-string v23, "send_error"

    move-object/from16 v0, v23

    move-object/from16 v1, v16

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v23

    if-eqz v23, :cond_2

    .line 78
    new-instance v23, Ljava/lang/StringBuilder;

    invoke-direct/range {v23 .. v23}, Ljava/lang/StringBuilder;-><init>()V

    const-string v24, "Error received in GCM Push Notification"

    invoke-virtual/range {v23 .. v24}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v23

    invoke-virtual {v10}, Landroid/os/Bundle;->toString()Ljava/lang/String;

    move-result-object v24

    invoke-virtual/range {v23 .. v24}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v23

    invoke-virtual/range {v23 .. v23}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v18

    .line 236
    :cond_1
    :goto_1
    return-object v15

    .line 80
    :cond_2
    const-string v23, "deleted_messages"

    move-object/from16 v0, v23

    move-object/from16 v1, v16

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v23

    if-eqz v23, :cond_3

    .line 82
    new-instance v23, Ljava/lang/StringBuilder;

    invoke-direct/range {v23 .. v23}, Ljava/lang/StringBuilder;-><init>()V

    const-string v24, "Messages deleted on server"

    invoke-virtual/range {v23 .. v24}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v23

    invoke-virtual {v10}, Landroid/os/Bundle;->toString()Ljava/lang/String;

    move-result-object v24

    invoke-virtual/range {v23 .. v24}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v23

    invoke-virtual/range {v23 .. v23}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v18

    goto :goto_1

    .line 84
    :cond_3
    const-string v23, "gcm"

    move-object/from16 v0, v23

    move-object/from16 v1, v16

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v23

    if-eqz v23, :cond_1

    .line 87
    invoke-virtual/range {p0 .. p0}, Lcom/belkin/wemo/push/service/GCMIntentService;->getApplicationContext()Landroid/content/Context;

    move-result-object v23

    invoke-static/range {v23 .. v23}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->getInstance(Landroid/content/Context;)Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    move-result-object v23

    sput-object v23, Lcom/belkin/wemo/push/service/GCMIntentService;->sDeviceListManager:Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    .line 88
    const-string v23, "statusMessage"

    move-object/from16 v0, p1

    move-object/from16 v1, v23

    invoke-virtual {v0, v1}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v22

    .line 89
    .local v22, "statusMessage":Ljava/lang/String;
    if-eqz v22, :cond_4

    .line 91
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/wemo/push/service/GCMIntentService;->TAG:Ljava/lang/String;

    move-object/from16 v23, v0

    new-instance v24, Ljava/lang/StringBuilder;

    invoke-direct/range {v24 .. v24}, Ljava/lang/StringBuilder;-><init>()V

    const-string v25, "Push Notification: statusMessage: "

    invoke-virtual/range {v24 .. v25}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v24

    move-object/from16 v0, v24

    move-object/from16 v1, v22

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v24

    invoke-virtual/range {v24 .. v24}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v24

    invoke-static/range {v23 .. v24}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 92
    const-string v23, "v10002"

    invoke-virtual/range {v22 .. v23}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v23

    if-eqz v23, :cond_6

    .line 93
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/wemo/push/service/GCMIntentService;->TAG:Ljava/lang/String;

    move-object/from16 v23, v0

    const-string v24, "Nest Silent Push Payload not available"

    invoke-static/range {v23 .. v24}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 94
    sget-object v23, Lcom/belkin/wemo/push/service/GCMIntentService;->sDeviceListManager:Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    invoke-virtual/range {v23 .. v23}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->getNestDevicesFromCloud()V

    .line 95
    const-string v23, "REST_REMOVE"

    invoke-virtual/range {v22 .. v23}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v23

    if-eqz v23, :cond_4

    .line 97
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/wemo/push/service/GCMIntentService;->TAG:Ljava/lang/String;

    move-object/from16 v23, v0

    const-string v24, "Push Notification: Nest Silent Push for Deauth"

    invoke-static/range {v23 .. v24}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 98
    invoke-virtual/range {p0 .. p0}, Lcom/belkin/wemo/push/service/GCMIntentService;->getApplicationContext()Landroid/content/Context;

    move-result-object v23

    invoke-static/range {v23 .. v23}, Lcom/belkin/wemo/rules/impl/WeMoRulesFactory;->getInstance(Landroid/content/Context;)Lcom/belkin/wemo/rules/IWeMoRules;

    move-result-object v20

    .line 99
    .local v20, "rules":Lcom/belkin/wemo/rules/IWeMoRules;
    new-instance v2, Lcom/belkin/wemo/push/service/GCMIntentService$FetchDevicesRulesCallback;

    move-object/from16 v0, p0

    invoke-direct {v2, v0}, Lcom/belkin/wemo/push/service/GCMIntentService$FetchDevicesRulesCallback;-><init>(Lcom/belkin/wemo/push/service/GCMIntentService;)V

    .line 100
    .local v2, "callback":Lcom/belkin/wemo/push/service/GCMIntentService$FetchDevicesRulesCallback;
    invoke-virtual/range {p0 .. p0}, Lcom/belkin/wemo/push/service/GCMIntentService;->getApplicationContext()Landroid/content/Context;

    move-result-object v23

    move-object/from16 v0, v20

    move-object/from16 v1, v23

    invoke-interface {v0, v1, v2, v2}, Lcom/belkin/wemo/rules/IWeMoRules;->fetchRules(Landroid/content/Context;Lcom/belkin/wemo/rules/callback/FetchRulesSuccessCallback;Lcom/belkin/wemo/rules/callback/FetchRulesErrorCallback;)V

    .line 117
    .end local v2    # "callback":Lcom/belkin/wemo/push/service/GCMIntentService$FetchDevicesRulesCallback;
    .end local v20    # "rules":Lcom/belkin/wemo/rules/IWeMoRules;
    :cond_4
    const-string v23, "eventCode"

    move-object/from16 v0, p1

    move-object/from16 v1, v23

    invoke-virtual {v0, v1}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    .line 118
    .local v7, "eventCodeStr":Ljava/lang/String;
    invoke-virtual {v15, v7}, Lcom/belkin/wemo/push/PushNotificationInfo;->setEventCode(Ljava/lang/String;)V

    .line 119
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/wemo/push/service/GCMIntentService;->TAG:Ljava/lang/String;

    move-object/from16 v23, v0

    new-instance v24, Ljava/lang/StringBuilder;

    invoke-direct/range {v24 .. v24}, Ljava/lang/StringBuilder;-><init>()V

    const-string v25, "Push Notification: "

    invoke-virtual/range {v24 .. v25}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v24

    move-object/from16 v0, v24

    invoke-virtual {v0, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v24

    invoke-virtual/range {v24 .. v24}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v24

    invoke-static/range {v23 .. v24}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 120
    invoke-static {v7}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v23

    if-nez v23, :cond_5

    .line 121
    const-string v23, "CREATE_RULE"

    move-object/from16 v0, v23

    invoke-virtual {v7, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v23

    if-eqz v23, :cond_9

    .line 122
    const-string v23, "eventMessage"

    move-object/from16 v0, p1

    move-object/from16 v1, v23

    invoke-virtual {v0, v1}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v9

    .line 123
    .local v9, "eventMsgStr":Ljava/lang/String;
    invoke-static {v9}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v23

    if-nez v23, :cond_5

    .line 124
    const-string v23, "#\\$"

    move-object/from16 v0, v23

    invoke-virtual {v9, v0}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v8

    .line 126
    .local v8, "eventMsgArr":[Ljava/lang/String;
    array-length v0, v8

    move/from16 v23, v0

    const/16 v24, 0x2

    move/from16 v0, v23

    move/from16 v1, v24

    if-lt v0, v1, :cond_5

    .line 127
    const/16 v23, 0x0

    aget-object v19, v8, v23

    .line 128
    .local v19, "ruleDBVersion":Ljava/lang/String;
    const/16 v23, 0x1

    aget-object v5, v8, v23

    .line 130
    .local v5, "dimmerUdn":Ljava/lang/String;
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/wemo/push/service/GCMIntentService;->TAG:Ljava/lang/String;

    move-object/from16 v23, v0

    new-instance v24, Ljava/lang/StringBuilder;

    invoke-direct/range {v24 .. v24}, Ljava/lang/StringBuilder;-><init>()V

    const-string v25, "Push Notification: Rule change notification. UDN: "

    invoke-virtual/range {v24 .. v25}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v24

    move-object/from16 v0, v24

    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v24

    const-string v25, "; ruleDBVersion: "

    invoke-virtual/range {v24 .. v25}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v24

    move-object/from16 v0, v24

    move-object/from16 v1, v19

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v24

    invoke-virtual/range {v24 .. v24}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v24

    invoke-static/range {v23 .. v24}, Lcom/belkin/utils/LogUtils;->debugLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 131
    invoke-static {}, Lcom/belkin/wemo/rules/RMRulesSDK;->instance()Lcom/belkin/wemo/rules/RMRulesSDK;

    move-result-object v23

    invoke-virtual/range {v23 .. v23}, Lcom/belkin/wemo/rules/RMRulesSDK;->getDependencyProvider()Lcom/belkin/wemo/rules/RMIRulesDependencyProvider;

    move-result-object v23

    invoke-interface/range {v23 .. v23}, Lcom/belkin/wemo/rules/RMIRulesDependencyProvider;->provideIRulesUtils()Lcom/belkin/wemo/rules/util/RMIRulesUtils;

    move-result-object v23

    invoke-interface/range {v23 .. v23}, Lcom/belkin/wemo/rules/util/RMIRulesUtils;->getRulesDBVerion()Ljava/lang/String;

    move-result-object v3

    .line 132
    .local v3, "dbVersion":Ljava/lang/String;
    if-eqz v3, :cond_5

    .line 133
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/wemo/push/service/GCMIntentService;->TAG:Ljava/lang/String;

    move-object/from16 v23, v0

    new-instance v24, Ljava/lang/StringBuilder;

    invoke-direct/range {v24 .. v24}, Ljava/lang/StringBuilder;-><init>()V

    const-string v25, "Push Notification: dbVersion: "

    invoke-virtual/range {v24 .. v25}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v24

    move-object/from16 v0, v24

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v24

    invoke-virtual/range {v24 .. v24}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v24

    invoke-static/range {v23 .. v24}, Lcom/belkin/utils/LogUtils;->debugLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 134
    invoke-static/range {v19 .. v19}, Ljava/lang/Integer;->valueOf(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v23

    invoke-virtual/range {v23 .. v23}, Ljava/lang/Integer;->intValue()I

    move-result v23

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v24

    invoke-virtual/range {v24 .. v24}, Ljava/lang/Integer;->intValue()I

    move-result v24

    move/from16 v0, v23

    move/from16 v1, v24

    if-le v0, v1, :cond_8

    .line 136
    invoke-static {}, Lcom/belkin/wemo/rules/RMRulesSDK;->instance()Lcom/belkin/wemo/rules/RMRulesSDK;

    move-result-object v23

    invoke-virtual/range {v23 .. v23}, Lcom/belkin/wemo/rules/RMRulesSDK;->getDependencyProvider()Lcom/belkin/wemo/rules/RMIRulesDependencyProvider;

    move-result-object v23

    invoke-interface/range {v23 .. v23}, Lcom/belkin/wemo/rules/RMIRulesDependencyProvider;->provideIRulesUtils()Lcom/belkin/wemo/rules/util/RMIRulesUtils;

    move-result-object v23

    const-string v24, "0"

    invoke-interface/range {v23 .. v24}, Lcom/belkin/wemo/rules/util/RMIRulesUtils;->setRulesDBVersion(Ljava/lang/String;)V

    .line 137
    invoke-static {}, Lcom/belkin/wemo/rules/RMRulesSDK;->instance()Lcom/belkin/wemo/rules/RMRulesSDK;

    move-result-object v23

    invoke-virtual/range {v23 .. v23}, Lcom/belkin/wemo/rules/RMRulesSDK;->getRules()Lcom/belkin/wemo/rules/RMIRules;

    move-result-object v23

    new-instance v24, Lcom/belkin/wemo/push/service/GCMIntentService$1;

    move-object/from16 v0, v24

    move-object/from16 v1, p0

    invoke-direct {v0, v1, v5}, Lcom/belkin/wemo/push/service/GCMIntentService$1;-><init>(Lcom/belkin/wemo/push/service/GCMIntentService;Ljava/lang/String;)V

    const/16 v25, 0x0

    invoke-interface/range {v23 .. v25}, Lcom/belkin/wemo/rules/RMIRules;->fetchRules(Lcom/belkin/wemo/rules/callback/RMShowRulesSuccessCallback;Lcom/belkin/wemo/rules/callback/RMShowRulesErrorCallback;)V

    .line 201
    .end local v3    # "dbVersion":Ljava/lang/String;
    .end local v5    # "dimmerUdn":Ljava/lang/String;
    .end local v8    # "eventMsgArr":[Ljava/lang/String;
    .end local v9    # "eventMsgStr":Ljava/lang/String;
    .end local v19    # "ruleDBVersion":Ljava/lang/String;
    :cond_5
    :goto_2
    const-string v23, "payload"

    move-object/from16 v0, p1

    move-object/from16 v1, v23

    invoke-virtual {v0, v1}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v18

    .line 202
    move-object/from16 v0, v18

    invoke-virtual {v15, v0}, Lcom/belkin/wemo/push/PushNotificationInfo;->setPushNotificationMsg(Ljava/lang/String;)V

    .line 205
    invoke-static/range {v18 .. v18}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v23

    if-eqz v23, :cond_1

    .line 206
    const-string v23, "macAddress"

    move-object/from16 v0, p1

    move-object/from16 v1, v23

    invoke-virtual {v0, v1}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v14

    .line 207
    .local v14, "mac":Ljava/lang/String;
    const-string v23, "status"

    move-object/from16 v0, p1

    move-object/from16 v1, v23

    invoke-virtual {v0, v1}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v21

    .line 209
    .local v21, "status":Ljava/lang/String;
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/wemo/push/service/GCMIntentService;->TAG:Ljava/lang/String;

    move-object/from16 v23, v0

    new-instance v24, Ljava/lang/StringBuilder;

    invoke-direct/range {v24 .. v24}, Ljava/lang/StringBuilder;-><init>()V

    const-string v25, "Push Notification: Silent Notification: Status = "

    invoke-virtual/range {v24 .. v25}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v24

    move-object/from16 v0, v24

    move-object/from16 v1, v21

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v24

    const-string v25, "; MAC = "

    invoke-virtual/range {v24 .. v25}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v24

    move-object/from16 v0, v24

    invoke-virtual {v0, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v24

    invoke-virtual/range {v24 .. v24}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v24

    invoke-static/range {v23 .. v24}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 211
    invoke-virtual/range {p0 .. p0}, Lcom/belkin/wemo/push/service/GCMIntentService;->getApplicationContext()Landroid/content/Context;

    move-result-object v23

    invoke-static/range {v23 .. v23}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->getInstance(Landroid/content/Context;)Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    move-result-object v23

    move-object/from16 v0, v23

    move-object/from16 v1, v21

    invoke-virtual {v0, v1, v14}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->onSilentStatusNotificationReceived(Ljava/lang/String;Ljava/lang/String;)Lcom/belkin/wemo/cache/data/DeviceInformation;

    goto/16 :goto_1

    .line 102
    .end local v7    # "eventCodeStr":Ljava/lang/String;
    .end local v14    # "mac":Ljava/lang/String;
    .end local v21    # "status":Ljava/lang/String;
    :cond_6
    const-string v23, "v10001"

    invoke-virtual/range {v22 .. v23}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v23

    if-eqz v23, :cond_4

    .line 103
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/wemo/push/service/GCMIntentService;->TAG:Ljava/lang/String;

    move-object/from16 v23, v0

    const-string v24, "Push Notification: Nest Silent Push Payload available"

    invoke-static/range {v23 .. v24}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 104
    invoke-virtual {v10}, Landroid/os/Bundle;->keySet()Ljava/util/Set;

    move-result-object v23

    invoke-interface/range {v23 .. v23}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v12

    .restart local v12    # "i$":Ljava/util/Iterator;
    :cond_7
    :goto_3
    invoke-interface {v12}, Ljava/util/Iterator;->hasNext()Z

    move-result v23

    if-eqz v23, :cond_4

    invoke-interface {v12}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v13

    check-cast v13, Ljava/lang/String;

    .line 105
    .restart local v13    # "key":Ljava/lang/String;
    const-string v23, "WEMO00"

    move-object/from16 v0, v23

    invoke-virtual {v13, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v23

    if-eqz v23, :cond_7

    .line 106
    const-string v23, "\\."

    move-object/from16 v0, v23

    invoke-virtual {v13, v0}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v17

    .line 107
    .local v17, "nest_entry":[Ljava/lang/String;
    move-object/from16 v0, v17

    array-length v0, v0

    move/from16 v23, v0

    if-lez v23, :cond_7

    .line 108
    sget-object v23, Lcom/belkin/wemo/push/service/GCMIntentService;->sDeviceListManager:Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    const/16 v24, 0x0

    aget-object v24, v17, v24

    const/16 v25, 0x1

    aget-object v25, v17, v25

    invoke-virtual {v10, v13}, Landroid/os/Bundle;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v26

    invoke-virtual/range {v26 .. v26}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v26

    invoke-virtual/range {v23 .. v26}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->onNestSilentPushNotificationReceived(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 109
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/wemo/push/service/GCMIntentService;->TAG:Ljava/lang/String;

    move-object/from16 v23, v0

    new-instance v24, Ljava/lang/StringBuilder;

    invoke-direct/range {v24 .. v24}, Ljava/lang/StringBuilder;-><init>()V

    const-string v25, "Push Notification: Nest attributeValue: "

    invoke-virtual/range {v24 .. v25}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v24

    invoke-virtual {v10, v13}, Landroid/os/Bundle;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v25

    invoke-virtual/range {v25 .. v25}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v25

    invoke-virtual/range {v24 .. v25}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v24

    const-string v25, "Nest :key: "

    invoke-virtual/range {v24 .. v25}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v24

    move-object/from16 v0, v24

    invoke-virtual {v0, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v24

    invoke-virtual/range {v24 .. v24}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v24

    invoke-static/range {v23 .. v24}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_3

    .line 145
    .end local v12    # "i$":Ljava/util/Iterator;
    .end local v13    # "key":Ljava/lang/String;
    .end local v17    # "nest_entry":[Ljava/lang/String;
    .restart local v3    # "dbVersion":Ljava/lang/String;
    .restart local v5    # "dimmerUdn":Ljava/lang/String;
    .restart local v7    # "eventCodeStr":Ljava/lang/String;
    .restart local v8    # "eventMsgArr":[Ljava/lang/String;
    .restart local v9    # "eventMsgStr":Ljava/lang/String;
    .restart local v19    # "ruleDBVersion":Ljava/lang/String;
    :cond_8
    invoke-virtual/range {p0 .. p0}, Lcom/belkin/wemo/push/service/GCMIntentService;->getApplicationContext()Landroid/content/Context;

    move-result-object v23

    invoke-static/range {v23 .. v23}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->getInstance(Landroid/content/Context;)Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    move-result-object v23

    sget-object v24, Lcom/belkin/wemo/rules/data/RMUserRules;->INSTANCE:Lcom/belkin/wemo/rules/data/RMUserRules;

    invoke-virtual/range {v24 .. v24}, Lcom/belkin/wemo/rules/data/RMUserRules;->getRulesList()Ljava/util/List;

    move-result-object v24

    move-object/from16 v0, v23

    move-object/from16 v1, v24

    invoke-virtual {v0, v5, v1}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->refreshLongPressRuleDetails(Ljava/lang/String;Ljava/util/List;)V

    goto/16 :goto_2

    .line 151
    .end local v3    # "dbVersion":Ljava/lang/String;
    .end local v5    # "dimmerUdn":Ljava/lang/String;
    .end local v8    # "eventMsgArr":[Ljava/lang/String;
    .end local v9    # "eventMsgStr":Ljava/lang/String;
    .end local v19    # "ruleDBVersion":Ljava/lang/String;
    :cond_9
    const-string v23, "overtempoff"

    move-object/from16 v0, v23

    invoke-virtual {v7, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v23

    if-eqz v23, :cond_d

    .line 154
    const-string v23, "macAddress"

    move-object/from16 v0, p1

    move-object/from16 v1, v23

    invoke-virtual {v0, v1}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v14

    .line 155
    .restart local v14    # "mac":Ljava/lang/String;
    const-string v23, "overtempon"

    move-object/from16 v0, v23

    invoke-virtual {v7, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v23

    if-eqz v23, :cond_b

    .line 157
    const/16 v23, 0x0

    move/from16 v0, v23

    invoke-virtual {v15, v0}, Lcom/belkin/wemo/push/PushNotificationInfo;->setAlertDialogRequired(Z)V

    .line 159
    invoke-virtual/range {p0 .. p0}, Lcom/belkin/wemo/push/service/GCMIntentService;->getApplicationContext()Landroid/content/Context;

    move-result-object v23

    invoke-static/range {v23 .. v23}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->getInstance(Landroid/content/Context;)Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    move-result-object v23

    const-string v24, "1"

    move-object/from16 v0, v23

    move-object/from16 v1, v24

    invoke-virtual {v0, v1, v14}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->onOverTempNotificationReceived(Ljava/lang/String;Ljava/lang/String;)Lcom/belkin/wemo/cache/data/DeviceInformation;

    move-result-object v4

    .line 160
    .local v4, "device":Lcom/belkin/wemo/cache/data/DeviceInformation;
    if-eqz v4, :cond_5

    .line 161
    invoke-virtual {v15, v14}, Lcom/belkin/wemo/push/PushNotificationInfo;->setMac(Ljava/lang/String;)V

    .line 163
    const-string v23, "tempName"

    move-object/from16 v0, p1

    move-object/from16 v1, v23

    invoke-virtual {v0, v1}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v11

    .line 164
    .local v11, "friendlyName":Ljava/lang/String;
    invoke-static {v11}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v23

    if-eqz v23, :cond_a

    .line 165
    invoke-virtual {v4}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getFriendlyName()Ljava/lang/String;

    move-result-object v11

    .line 167
    :cond_a
    invoke-virtual {v15, v11}, Lcom/belkin/wemo/push/PushNotificationInfo;->setFriendlyName(Ljava/lang/String;)V

    goto/16 :goto_2

    .line 169
    .end local v4    # "device":Lcom/belkin/wemo/cache/data/DeviceInformation;
    .end local v11    # "friendlyName":Ljava/lang/String;
    :cond_b
    const-string v23, "overtempoff"

    move-object/from16 v0, v23

    invoke-virtual {v7, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v23

    if-eqz v23, :cond_5

    .line 171
    const/16 v23, 0x0

    move/from16 v0, v23

    invoke-virtual {v15, v0}, Lcom/belkin/wemo/push/PushNotificationInfo;->setAlertDialogRequired(Z)V

    .line 173
    invoke-virtual/range {p0 .. p0}, Lcom/belkin/wemo/push/service/GCMIntentService;->getApplicationContext()Landroid/content/Context;

    move-result-object v23

    invoke-static/range {v23 .. v23}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->getInstance(Landroid/content/Context;)Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    move-result-object v23

    const-string v24, "0"

    move-object/from16 v0, v23

    move-object/from16 v1, v24

    invoke-virtual {v0, v1, v14}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->onOverTempNotificationReceived(Ljava/lang/String;Ljava/lang/String;)Lcom/belkin/wemo/cache/data/DeviceInformation;

    move-result-object v4

    .line 174
    .restart local v4    # "device":Lcom/belkin/wemo/cache/data/DeviceInformation;
    if-eqz v4, :cond_5

    .line 175
    invoke-virtual {v15, v14}, Lcom/belkin/wemo/push/PushNotificationInfo;->setMac(Ljava/lang/String;)V

    .line 176
    const-string v23, "tempName"

    move-object/from16 v0, p1

    move-object/from16 v1, v23

    invoke-virtual {v0, v1}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v11

    .line 177
    .restart local v11    # "friendlyName":Ljava/lang/String;
    invoke-static {v11}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v23

    if-eqz v23, :cond_c

    .line 178
    invoke-virtual {v4}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getFriendlyName()Ljava/lang/String;

    move-result-object v11

    .line 180
    :cond_c
    invoke-virtual {v15, v11}, Lcom/belkin/wemo/push/PushNotificationInfo;->setFriendlyName(Ljava/lang/String;)V

    goto/16 :goto_2

    .line 183
    .end local v4    # "device":Lcom/belkin/wemo/cache/data/DeviceInformation;
    .end local v11    # "friendlyName":Ljava/lang/String;
    .end local v14    # "mac":Ljava/lang/String;
    :cond_d
    const-string v23, "overtempon2"

    move-object/from16 v0, v23

    invoke-virtual {v7, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v23

    if-eqz v23, :cond_5

    .line 184
    const-string v23, "macAddress"

    move-object/from16 v0, p1

    move-object/from16 v1, v23

    invoke-virtual {v0, v1}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v14

    .line 185
    .restart local v14    # "mac":Ljava/lang/String;
    const/16 v23, 0x0

    move/from16 v0, v23

    invoke-virtual {v15, v0}, Lcom/belkin/wemo/push/PushNotificationInfo;->setAlertDialogRequired(Z)V

    .line 187
    invoke-virtual/range {p0 .. p0}, Lcom/belkin/wemo/push/service/GCMIntentService;->getApplicationContext()Landroid/content/Context;

    move-result-object v23

    invoke-static/range {v23 .. v23}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->getInstance(Landroid/content/Context;)Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    move-result-object v23

    const-string v24, "2"

    move-object/from16 v0, v23

    move-object/from16 v1, v24

    invoke-virtual {v0, v1, v14}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->onOverTempNotificationReceived(Ljava/lang/String;Ljava/lang/String;)Lcom/belkin/wemo/cache/data/DeviceInformation;

    move-result-object v4

    .line 188
    .restart local v4    # "device":Lcom/belkin/wemo/cache/data/DeviceInformation;
    if-eqz v4, :cond_5

    .line 189
    invoke-virtual {v15, v14}, Lcom/belkin/wemo/push/PushNotificationInfo;->setMac(Ljava/lang/String;)V

    .line 191
    const-string v23, "tempName"

    move-object/from16 v0, p1

    move-object/from16 v1, v23

    invoke-virtual {v0, v1}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v11

    .line 192
    .restart local v11    # "friendlyName":Ljava/lang/String;
    invoke-static {v11}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v23

    if-eqz v23, :cond_e

    .line 193
    invoke-virtual {v4}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getFriendlyName()Ljava/lang/String;

    move-result-object v11

    .line 195
    :cond_e
    invoke-virtual {v15, v11}, Lcom/belkin/wemo/push/PushNotificationInfo;->setFriendlyName(Ljava/lang/String;)V

    goto/16 :goto_2
.end method
