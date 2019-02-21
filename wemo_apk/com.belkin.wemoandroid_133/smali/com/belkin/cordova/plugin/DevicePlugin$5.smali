.class Lcom/belkin/cordova/plugin/DevicePlugin$5;
.super Landroid/content/BroadcastReceiver;
.source "DevicePlugin.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/belkin/cordova/plugin/DevicePlugin;->execute(Ljava/lang/String;Lorg/json/JSONArray;Lorg/apache/cordova/CallbackContext;)Z
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/belkin/cordova/plugin/DevicePlugin;

.field final synthetic val$tmpDP:Lcom/belkin/cordova/plugin/DevicePlugin;


# direct methods
.method constructor <init>(Lcom/belkin/cordova/plugin/DevicePlugin;Lcom/belkin/cordova/plugin/DevicePlugin;)V
    .locals 0

    .prologue
    .line 466
    iput-object p1, p0, Lcom/belkin/cordova/plugin/DevicePlugin$5;->this$0:Lcom/belkin/cordova/plugin/DevicePlugin;

    iput-object p2, p0, Lcom/belkin/cordova/plugin/DevicePlugin$5;->val$tmpDP:Lcom/belkin/cordova/plugin/DevicePlugin;

    invoke-direct {p0}, Landroid/content/BroadcastReceiver;-><init>()V

    return-void
.end method


# virtual methods
.method public onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .locals 18
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "intent"    # Landroid/content/Intent;

    .prologue
    .line 469
    const-string v15, "DevicePlugin"

    new-instance v16, Ljava/lang/StringBuilder;

    invoke-direct/range {v16 .. v16}, Ljava/lang/StringBuilder;-><init>()V

    const-string v17, "trying to send positive result"

    invoke-virtual/range {v16 .. v17}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v16

    invoke-virtual/range {p2 .. p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v17

    invoke-virtual/range {v16 .. v17}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v16

    invoke-virtual/range {v16 .. v16}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v16

    invoke-static/range {v15 .. v16}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 471
    invoke-virtual/range {p2 .. p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v15

    const-string v16, "com.controller.belkin.hybrid.DEVICE_ADDED"

    invoke-virtual/range {v15 .. v16}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v15

    if-eqz v15, :cond_2

    .line 472
    const-string v15, "DevicePlugin"

    const-string v16, "onReceive(Context context, Intent intent):: com.controller.belkin.hybrid.DEVICE_ADDED"

    invoke-static/range {v15 .. v16}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 474
    :try_start_0
    const-string v15, "com.controller.belkin.hybrid.DEVICE_ADDED"

    move-object/from16 v0, p2

    invoke-virtual {v0, v15}, Landroid/content/Intent;->getBundleExtra(Ljava/lang/String;)Landroid/os/Bundle;

    move-result-object v6

    .line 475
    .local v6, "bundle":Landroid/os/Bundle;
    new-instance v8, Lorg/json/JSONObject;

    invoke-direct {v8}, Lorg/json/JSONObject;-><init>()V

    .line 477
    .local v8, "deviceObject":Lorg/json/JSONObject;
    const-string v15, "udn"

    invoke-virtual {v6, v15}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v14

    .line 478
    .local v14, "udn":Ljava/lang/String;
    const-string v15, "listen"

    const-string v16, "device_added"

    move-object/from16 v0, v16

    invoke-virtual {v8, v15, v0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 479
    const-string v15, "friendlyName"

    const-string v16, "friendlyName"

    move-object/from16 v0, v16

    invoke-virtual {v6, v0}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v16

    move-object/from16 v0, v16

    invoke-virtual {v8, v15, v0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 480
    const-string v15, "state"

    const-string v16, "state"

    move-object/from16 v0, v16

    invoke-virtual {v6, v0}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v16

    move-object/from16 v0, v16

    invoke-virtual {v8, v15, v0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 481
    const-string v15, "iconUrl"

    const-string v16, "iconUrl"

    move-object/from16 v0, v16

    invoke-virtual {v6, v0}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v16

    move-object/from16 v0, v16

    invoke-virtual {v8, v15, v0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 482
    const-string v15, "type"

    const-string v16, "type"

    move-object/from16 v0, v16

    invoke-virtual {v6, v0}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v16

    move-object/from16 v0, v16

    invoke-virtual {v8, v15, v0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 483
    const-string v15, "udn"

    const-string v16, "udn"

    move-object/from16 v0, v16

    invoke-virtual {v6, v0}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v16

    move-object/from16 v0, v16

    invoke-virtual {v8, v15, v0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 484
    const-string v15, "modelName"

    const-string v16, "modelName"

    move-object/from16 v0, v16

    invoke-virtual {v6, v0}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v16

    move-object/from16 v0, v16

    invoke-virtual {v8, v15, v0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 485
    const-string v15, "customizedState"

    const-string v16, "customizedState"

    move-object/from16 v0, v16

    invoke-virtual {v6, v0}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v16

    move-object/from16 v0, v16

    invoke-virtual {v8, v15, v0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 486
    const-string v15, "serialNumber"

    const-string v16, "serialNumber"

    move-object/from16 v0, v16

    invoke-virtual {v6, v0}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v16

    move-object/from16 v0, v16

    invoke-virtual {v8, v15, v0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 487
    const-string v15, "firmwareVersion"

    const-string v16, "firmwareVersion"

    move-object/from16 v0, v16

    invoke-virtual {v6, v0}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v16

    move-object/from16 v0, v16

    invoke-virtual {v8, v15, v0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 488
    const-string v15, "countdownEndTime"

    const-string v16, "countdownEndTime"

    move-object/from16 v0, v16

    invoke-virtual {v6, v0}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v16

    move-object/from16 v0, v16

    invoke-virtual {v8, v15, v0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 489
    const-string v15, "macAddress"

    const-string v16, "macAddress"

    move-object/from16 v0, v16

    invoke-virtual {v6, v0}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v16

    move-object/from16 v0, v16

    invoke-virtual {v8, v15, v0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 490
    const-string v15, "attributeList"

    invoke-virtual {v6, v15}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    .line 492
    .local v4, "attributesListStr":Ljava/lang/String;
    if-eqz v4, :cond_0

    const-string v15, ""

    invoke-virtual {v4, v15}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v15

    if-nez v15, :cond_0

    .line 494
    new-instance v3, Lorg/json/JSONObject;

    invoke-direct {v3, v4}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 495
    .local v3, "attributeList":Lorg/json/JSONObject;
    const-string v15, "attributeList"

    invoke-virtual {v8, v15, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 498
    .end local v3    # "attributeList":Lorg/json/JSONObject;
    :cond_0
    const-string v15, "DevicePlugin"

    new-instance v16, Ljava/lang/StringBuilder;

    invoke-direct/range {v16 .. v16}, Ljava/lang/StringBuilder;-><init>()V

    const-string v17, "device added JSON: "

    invoke-virtual/range {v16 .. v17}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v16

    invoke-virtual {v8}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v17

    invoke-virtual/range {v16 .. v17}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v16

    invoke-virtual/range {v16 .. v16}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v16

    invoke-static/range {v15 .. v16}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 500
    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/belkin/cordova/plugin/DevicePlugin$5;->val$tmpDP:Lcom/belkin/cordova/plugin/DevicePlugin;

    new-instance v16, Ljava/lang/StringBuilder;

    invoke-direct/range {v16 .. v16}, Ljava/lang/StringBuilder;-><init>()V

    const-string v17, "device_list.onDeviceAdded(\'"

    invoke-virtual/range {v16 .. v17}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v16

    invoke-virtual {v8}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v17

    invoke-virtual/range {v16 .. v17}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v16

    const-string v17, "\');"

    invoke-virtual/range {v16 .. v17}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v16

    invoke-virtual/range {v16 .. v16}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v16

    invoke-static/range {v15 .. v16}, Lcom/belkin/cordova/plugin/DevicePlugin;->access$200(Lcom/belkin/cordova/plugin/DevicePlugin;Ljava/lang/String;)V
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 670
    .end local v4    # "attributesListStr":Ljava/lang/String;
    .end local v6    # "bundle":Landroid/os/Bundle;
    .end local v8    # "deviceObject":Lorg/json/JSONObject;
    .end local v14    # "udn":Ljava/lang/String;
    :cond_1
    :goto_0
    return-void

    .line 508
    :catch_0
    move-exception v9

    .line 509
    .local v9, "e":Lorg/json/JSONException;
    invoke-virtual {v9}, Lorg/json/JSONException;->printStackTrace()V

    goto :goto_0

    .line 511
    .end local v9    # "e":Lorg/json/JSONException;
    :cond_2
    invoke-virtual/range {p2 .. p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v15

    const-string v16, "com.controller.belkin.hybrid.DEVICE_REMOVED"

    invoke-virtual/range {v15 .. v16}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v15

    if-eqz v15, :cond_3

    .line 512
    const-string v15, "DevicePlugin"

    const-string v16, "onReceive(Context context, Intent intent):: com.controller.belkin.hybrid.DEVICE_REMOVED"

    invoke-static/range {v15 .. v16}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 514
    :try_start_1
    new-instance v13, Lorg/json/JSONObject;

    invoke-direct {v13}, Lorg/json/JSONObject;-><init>()V

    .line 515
    .local v13, "state":Lorg/json/JSONObject;
    const-string v15, "listen"

    const-string v16, "device_removed"

    move-object/from16 v0, v16

    invoke-virtual {v13, v15, v0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 516
    const-string v15, "udn"

    const-string v16, "udn"

    move-object/from16 v0, p2

    move-object/from16 v1, v16

    invoke-virtual {v0, v1}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v16

    move-object/from16 v0, v16

    invoke-virtual {v13, v15, v0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 517
    const-string v15, "DevicePlugin"

    new-instance v16, Ljava/lang/StringBuilder;

    invoke-direct/range {v16 .. v16}, Ljava/lang/StringBuilder;-><init>()V

    const-string v17, "device removed JSON: "

    invoke-virtual/range {v16 .. v17}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v16

    invoke-virtual {v13}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v17

    invoke-virtual/range {v16 .. v17}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v16

    invoke-virtual/range {v16 .. v16}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v16

    invoke-static/range {v15 .. v16}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 518
    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/belkin/cordova/plugin/DevicePlugin$5;->val$tmpDP:Lcom/belkin/cordova/plugin/DevicePlugin;

    new-instance v16, Ljava/lang/StringBuilder;

    invoke-direct/range {v16 .. v16}, Ljava/lang/StringBuilder;-><init>()V

    const-string v17, "WeMoDeviceList.removeDevice(\'"

    invoke-virtual/range {v16 .. v17}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v16

    const-string v17, "udn"

    move-object/from16 v0, p2

    move-object/from16 v1, v17

    invoke-virtual {v0, v1}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v17

    invoke-virtual/range {v16 .. v17}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v16

    const-string v17, "\');"

    invoke-virtual/range {v16 .. v17}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v16

    invoke-virtual/range {v16 .. v16}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v16

    invoke-static/range {v15 .. v16}, Lcom/belkin/cordova/plugin/DevicePlugin;->access$200(Lcom/belkin/cordova/plugin/DevicePlugin;Ljava/lang/String;)V
    :try_end_1
    .catch Lorg/json/JSONException; {:try_start_1 .. :try_end_1} :catch_1

    goto :goto_0

    .line 519
    .end local v13    # "state":Lorg/json/JSONObject;
    :catch_1
    move-exception v9

    .line 520
    .restart local v9    # "e":Lorg/json/JSONException;
    invoke-virtual {v9}, Lorg/json/JSONException;->printStackTrace()V

    goto/16 :goto_0

    .line 522
    .end local v9    # "e":Lorg/json/JSONException;
    :cond_3
    invoke-virtual/range {p2 .. p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v15

    const-string v16, "com.controller.belkin.hybrid.STATE_CHANGED"

    invoke-virtual/range {v15 .. v16}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v15

    if-eqz v15, :cond_5

    .line 523
    const-string v15, "DevicePlugin"

    const-string v16, "onReceive(Context context, Intent intent):: com.controller.belkin.hybrid.STATE_CHANGED"

    invoke-static/range {v15 .. v16}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 525
    :try_start_2
    new-instance v13, Lorg/json/JSONObject;

    invoke-direct {v13}, Lorg/json/JSONObject;-><init>()V

    .line 526
    .restart local v13    # "state":Lorg/json/JSONObject;
    const-string v15, "listen"

    const-string v16, "state_change"

    move-object/from16 v0, v16

    invoke-virtual {v13, v15, v0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 527
    const-string v15, "state"

    const-string v16, "state"

    move-object/from16 v0, p2

    move-object/from16 v1, v16

    invoke-virtual {v0, v1}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v16

    move-object/from16 v0, v16

    invoke-virtual {v13, v15, v0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 528
    const-string v15, "udn"

    const-string v16, "udn"

    move-object/from16 v0, p2

    move-object/from16 v1, v16

    invoke-virtual {v0, v1}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v16

    move-object/from16 v0, v16

    invoke-virtual {v13, v15, v0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 529
    sget-object v15, Lcom/belkin/wemo/cache/devicelist/JSONConstants;->NOTIFY_TYPE:Ljava/lang/String;

    sget-object v16, Lcom/belkin/wemo/cache/devicelist/JSONConstants;->NOTIFY_TYPE:Ljava/lang/String;

    move-object/from16 v0, p2

    move-object/from16 v1, v16

    invoke-virtual {v0, v1}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v16

    move-object/from16 v0, v16

    invoke-virtual {v13, v15, v0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 530
    sget-object v15, Lcom/belkin/wemo/cache/devicelist/JSONConstants;->NOTIFY_DEVICE_ID:Ljava/lang/String;

    sget-object v16, Lcom/belkin/wemo/cache/devicelist/JSONConstants;->NOTIFY_DEVICE_ID:Ljava/lang/String;

    move-object/from16 v0, p2

    move-object/from16 v1, v16

    invoke-virtual {v0, v1}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v16

    move-object/from16 v0, v16

    invoke-virtual {v13, v15, v0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 531
    sget-object v15, Lcom/belkin/wemo/cache/devicelist/JSONConstants;->NOTIFY_CAPABILITY_ID:Ljava/lang/String;

    sget-object v16, Lcom/belkin/wemo/cache/devicelist/JSONConstants;->NOTIFY_CAPABILITY_ID:Ljava/lang/String;

    move-object/from16 v0, p2

    move-object/from16 v1, v16

    invoke-virtual {v0, v1}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v16

    move-object/from16 v0, v16

    invoke-virtual {v13, v15, v0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 532
    const-string v15, "Availability"

    const-string v16, "Availability"

    move-object/from16 v0, p2

    move-object/from16 v1, v16

    invoke-virtual {v0, v1}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v16

    move-object/from16 v0, v16

    invoke-virtual {v13, v15, v0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 533
    const-string v15, "customizedState"

    const-string v16, "customizedState"

    move-object/from16 v0, p2

    move-object/from16 v1, v16

    invoke-virtual {v0, v1}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v16

    move-object/from16 v0, v16

    invoke-virtual {v13, v15, v0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 535
    const-string v15, "attributeList"

    move-object/from16 v0, p2

    invoke-virtual {v0, v15}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    .line 537
    .restart local v4    # "attributesListStr":Ljava/lang/String;
    if-eqz v4, :cond_4

    const-string v15, ""

    invoke-virtual {v4, v15}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v15

    if-nez v15, :cond_4

    .line 539
    new-instance v3, Lorg/json/JSONObject;

    invoke-direct {v3, v4}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 540
    .restart local v3    # "attributeList":Lorg/json/JSONObject;
    const-string v15, "attributeList"

    invoke-virtual {v13, v15, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 542
    .end local v3    # "attributeList":Lorg/json/JSONObject;
    :cond_4
    sget-object v15, Lcom/belkin/wemo/cache/devicelist/JSONConstants;->INSIGHT_STATE_CHANGE_TS:Ljava/lang/String;

    sget-object v16, Lcom/belkin/wemo/cache/devicelist/JSONConstants;->INSIGHT_STATE_CHANGE_TS:Ljava/lang/String;

    move-object/from16 v0, p2

    move-object/from16 v1, v16

    invoke-virtual {v0, v1}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v16

    move-object/from16 v0, v16

    invoke-virtual {v13, v15, v0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 543
    sget-object v15, Lcom/belkin/wemo/cache/devicelist/JSONConstants;->INSIGHT_ON_FOR:Ljava/lang/String;

    sget-object v16, Lcom/belkin/wemo/cache/devicelist/JSONConstants;->INSIGHT_ON_FOR:Ljava/lang/String;

    move-object/from16 v0, p2

    move-object/from16 v1, v16

    invoke-virtual {v0, v1}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v16

    move-object/from16 v0, v16

    invoke-virtual {v13, v15, v0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 544
    sget-object v15, Lcom/belkin/wemo/cache/devicelist/JSONConstants;->INSIGHT_TTTON:Ljava/lang/String;

    sget-object v16, Lcom/belkin/wemo/cache/devicelist/JSONConstants;->INSIGHT_TTTON:Ljava/lang/String;

    move-object/from16 v0, p2

    move-object/from16 v1, v16

    invoke-virtual {v0, v1}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v16

    move-object/from16 v0, v16

    invoke-virtual {v13, v15, v0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 545
    sget-object v15, Lcom/belkin/wemo/cache/devicelist/JSONConstants;->INSIGHT_PAST_14_TOTAL_TIME:Ljava/lang/String;

    sget-object v16, Lcom/belkin/wemo/cache/devicelist/JSONConstants;->INSIGHT_PAST_14_TOTAL_TIME:Ljava/lang/String;

    move-object/from16 v0, p2

    move-object/from16 v1, v16

    invoke-virtual {v0, v1}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v16

    move-object/from16 v0, v16

    invoke-virtual {v13, v15, v0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 546
    sget-object v15, Lcom/belkin/wemo/cache/devicelist/JSONConstants;->INSIGHT_HRS_CONNECTED:Ljava/lang/String;

    sget-object v16, Lcom/belkin/wemo/cache/devicelist/JSONConstants;->INSIGHT_HRS_CONNECTED:Ljava/lang/String;

    move-object/from16 v0, p2

    move-object/from16 v1, v16

    invoke-virtual {v0, v1}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v16

    move-object/from16 v0, v16

    invoke-virtual {v13, v15, v0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 547
    sget-object v15, Lcom/belkin/wemo/cache/devicelist/JSONConstants;->INSIGHT_AVG_POWER_ON:Ljava/lang/String;

    sget-object v16, Lcom/belkin/wemo/cache/devicelist/JSONConstants;->INSIGHT_AVG_POWER_ON:Ljava/lang/String;

    move-object/from16 v0, p2

    move-object/from16 v1, v16

    invoke-virtual {v0, v1}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v16

    move-object/from16 v0, v16

    invoke-virtual {v13, v15, v0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 548
    sget-object v15, Lcom/belkin/wemo/cache/devicelist/JSONConstants;->INSIGHT_POWER_NOW:Ljava/lang/String;

    sget-object v16, Lcom/belkin/wemo/cache/devicelist/JSONConstants;->INSIGHT_POWER_NOW:Ljava/lang/String;

    move-object/from16 v0, p2

    move-object/from16 v1, v16

    invoke-virtual {v0, v1}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v16

    move-object/from16 v0, v16

    invoke-virtual {v13, v15, v0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 549
    sget-object v15, Lcom/belkin/wemo/cache/devicelist/JSONConstants;->INSIGHT_TODAY_TOTAL_KWH:Ljava/lang/String;

    sget-object v16, Lcom/belkin/wemo/cache/devicelist/JSONConstants;->INSIGHT_TODAY_TOTAL_KWH:Ljava/lang/String;

    move-object/from16 v0, p2

    move-object/from16 v1, v16

    invoke-virtual {v0, v1}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v16

    move-object/from16 v0, v16

    invoke-virtual {v13, v15, v0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 550
    sget-object v15, Lcom/belkin/wemo/cache/devicelist/JSONConstants;->INSIGHT_PAST_14_DAYS_KWH:Ljava/lang/String;

    sget-object v16, Lcom/belkin/wemo/cache/devicelist/JSONConstants;->INSIGHT_PAST_14_DAYS_KWH:Ljava/lang/String;

    move-object/from16 v0, p2

    move-object/from16 v1, v16

    invoke-virtual {v0, v1}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v16

    move-object/from16 v0, v16

    invoke-virtual {v13, v15, v0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 552
    const-string v15, "DevicePlugin"

    new-instance v16, Ljava/lang/StringBuilder;

    invoke-direct/range {v16 .. v16}, Ljava/lang/StringBuilder;-><init>()V

    const-string v17, "state change JSON: "

    invoke-virtual/range {v16 .. v17}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v16

    invoke-virtual {v13}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v17

    invoke-virtual/range {v16 .. v17}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v16

    invoke-virtual/range {v16 .. v16}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v16

    invoke-static/range {v15 .. v16}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 553
    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/belkin/cordova/plugin/DevicePlugin$5;->val$tmpDP:Lcom/belkin/cordova/plugin/DevicePlugin;

    new-instance v16, Ljava/lang/StringBuilder;

    invoke-direct/range {v16 .. v16}, Ljava/lang/StringBuilder;-><init>()V

    const-string v17, "device_list.onDeviceStateChange(\'"

    invoke-virtual/range {v16 .. v17}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v16

    invoke-virtual {v13}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v17

    invoke-virtual/range {v16 .. v17}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v16

    const-string v17, "\');"

    invoke-virtual/range {v16 .. v17}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v16

    invoke-virtual/range {v16 .. v16}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v16

    invoke-static/range {v15 .. v16}, Lcom/belkin/cordova/plugin/DevicePlugin;->access$200(Lcom/belkin/cordova/plugin/DevicePlugin;Ljava/lang/String;)V
    :try_end_2
    .catch Lorg/json/JSONException; {:try_start_2 .. :try_end_2} :catch_2

    goto/16 :goto_0

    .line 559
    .end local v4    # "attributesListStr":Ljava/lang/String;
    .end local v13    # "state":Lorg/json/JSONObject;
    :catch_2
    move-exception v9

    .line 560
    .restart local v9    # "e":Lorg/json/JSONException;
    invoke-virtual {v9}, Lorg/json/JSONException;->printStackTrace()V

    goto/16 :goto_0

    .line 562
    .end local v9    # "e":Lorg/json/JSONException;
    :cond_5
    invoke-virtual/range {p2 .. p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v15

    const-string v16, "com.controller.belkin.hybrid.SET_INACTIVE_STATE"

    invoke-virtual/range {v15 .. v16}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v15

    if-nez v15, :cond_6

    invoke-virtual/range {p2 .. p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v15

    const-string v16, "com.controller.belkin.hybrid.SET_UNAVAILABLE_STATE"

    invoke-virtual/range {v15 .. v16}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v15

    if-eqz v15, :cond_a

    .line 563
    :cond_6
    const-string v15, "DevicePlugin"

    const-string v16, "onReceive(Context context, Intent intent):: com.controller.belkin.hybrid.SET_INACTIVE_STATE"

    invoke-static/range {v15 .. v16}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 566
    :try_start_3
    new-instance v13, Lorg/json/JSONObject;

    invoke-direct {v13}, Lorg/json/JSONObject;-><init>()V

    .line 567
    .restart local v13    # "state":Lorg/json/JSONObject;
    invoke-virtual/range {p2 .. p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v15

    const-string v16, "com.controller.belkin.hybrid.SET_INACTIVE_STATE"

    invoke-virtual/range {v15 .. v16}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v15

    if-eqz v15, :cond_8

    .line 568
    const-string v15, "listen"

    const-string v16, "set_inactive_state"

    move-object/from16 v0, v16

    invoke-virtual {v13, v15, v0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 573
    :goto_1
    new-instance v11, Lorg/json/JSONArray;

    invoke-direct {v11}, Lorg/json/JSONArray;-><init>()V

    .line 574
    .local v11, "list":Lorg/json/JSONArray;
    sget-object v15, Lcom/belkin/cordova/plugin/DevicePlugin;->mDLM:Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    invoke-virtual {v15}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->getDeviceInformation()Ljava/util/ArrayList;

    move-result-object v15

    invoke-virtual {v15}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v10

    .local v10, "i$":Ljava/util/Iterator;
    :cond_7
    :goto_2
    invoke-interface {v10}, Ljava/util/Iterator;->hasNext()Z

    move-result v15

    if-eqz v15, :cond_9

    invoke-interface {v10}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Lcom/belkin/wemo/cache/data/DeviceInformation;

    .line 575
    .local v7, "cacheDevice":Lcom/belkin/wemo/cache/data/DeviceInformation;
    invoke-virtual {v7}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getInActive()I

    move-result v15

    const/16 v16, 0x1

    move/from16 v0, v16

    if-ne v15, v0, :cond_7

    .line 576
    const-string v15, "WeMoSDK"

    new-instance v16, Ljava/lang/StringBuilder;

    invoke-direct/range {v16 .. v16}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v7}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getUDN()Ljava/lang/String;

    move-result-object v17

    invoke-virtual/range {v16 .. v17}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v16

    const-string v17, " is unavailable"

    invoke-virtual/range {v16 .. v17}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v16

    invoke-virtual/range {v16 .. v16}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v16

    invoke-static/range {v15 .. v16}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 577
    invoke-virtual {v7}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getUDN()Ljava/lang/String;

    move-result-object v15

    invoke-virtual {v11, v15}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;
    :try_end_3
    .catch Lorg/json/JSONException; {:try_start_3 .. :try_end_3} :catch_3

    goto :goto_2

    .line 586
    .end local v7    # "cacheDevice":Lcom/belkin/wemo/cache/data/DeviceInformation;
    .end local v10    # "i$":Ljava/util/Iterator;
    .end local v11    # "list":Lorg/json/JSONArray;
    .end local v13    # "state":Lorg/json/JSONObject;
    :catch_3
    move-exception v9

    .line 587
    .restart local v9    # "e":Lorg/json/JSONException;
    invoke-virtual {v9}, Lorg/json/JSONException;->printStackTrace()V

    goto/16 :goto_0

    .line 570
    .end local v9    # "e":Lorg/json/JSONException;
    .restart local v13    # "state":Lorg/json/JSONObject;
    :cond_8
    :try_start_4
    const-string v15, "listen"

    const-string v16, "set_unavailable_state"

    move-object/from16 v0, v16

    invoke-virtual {v13, v15, v0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    goto :goto_1

    .line 581
    .restart local v10    # "i$":Ljava/util/Iterator;
    .restart local v11    # "list":Lorg/json/JSONArray;
    :cond_9
    const-string v15, "udn"

    invoke-virtual {v13, v15, v11}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 583
    new-instance v12, Lorg/apache/cordova/PluginResult;

    sget-object v15, Lorg/apache/cordova/PluginResult$Status;->OK:Lorg/apache/cordova/PluginResult$Status;

    invoke-direct {v12, v15, v13}, Lorg/apache/cordova/PluginResult;-><init>(Lorg/apache/cordova/PluginResult$Status;Lorg/json/JSONObject;)V

    .line 584
    .local v12, "result":Lorg/apache/cordova/PluginResult;
    const/4 v15, 0x1

    invoke-virtual {v12, v15}, Lorg/apache/cordova/PluginResult;->setKeepCallback(Z)V

    .line 585
    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/belkin/cordova/plugin/DevicePlugin$5;->this$0:Lcom/belkin/cordova/plugin/DevicePlugin;

    invoke-static {v15}, Lcom/belkin/cordova/plugin/DevicePlugin;->access$300(Lcom/belkin/cordova/plugin/DevicePlugin;)Lorg/apache/cordova/CallbackContext;

    move-result-object v15

    invoke-virtual {v15, v12}, Lorg/apache/cordova/CallbackContext;->sendPluginResult(Lorg/apache/cordova/PluginResult;)V
    :try_end_4
    .catch Lorg/json/JSONException; {:try_start_4 .. :try_end_4} :catch_3

    goto/16 :goto_0

    .line 589
    .end local v10    # "i$":Ljava/util/Iterator;
    .end local v11    # "list":Lorg/json/JSONArray;
    .end local v12    # "result":Lorg/apache/cordova/PluginResult;
    .end local v13    # "state":Lorg/json/JSONObject;
    :cond_a
    invoke-virtual/range {p2 .. p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v15

    const-string v16, "com.controller.belkin.hybrid.SET_INACTIVE_STATE_ASYNC"

    invoke-virtual/range {v15 .. v16}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v15

    if-eqz v15, :cond_d

    .line 590
    const-string v15, "DevicePlugin"

    const-string v16, "onReceive(Context context, Intent intent):: com.controller.belkin.hybrid.SET_INACTIVE_STATE_ASYNC"

    invoke-static/range {v15 .. v16}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 591
    new-instance v13, Lorg/json/JSONObject;

    invoke-direct {v13}, Lorg/json/JSONObject;-><init>()V

    .line 593
    .restart local v13    # "state":Lorg/json/JSONObject;
    :try_start_5
    const-string v15, "listen"

    const-string v16, "set_inactive_state_async"

    move-object/from16 v0, v16

    invoke-virtual {v13, v15, v0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 594
    new-instance v11, Lorg/json/JSONArray;

    invoke-direct {v11}, Lorg/json/JSONArray;-><init>()V

    .line 595
    .restart local v11    # "list":Lorg/json/JSONArray;
    sget-object v15, Lcom/belkin/cordova/plugin/DevicePlugin;->mDLM:Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    invoke-virtual {v15}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->getDeviceInformation()Ljava/util/ArrayList;

    move-result-object v15

    invoke-virtual {v15}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v10

    .restart local v10    # "i$":Ljava/util/Iterator;
    :cond_b
    :goto_3
    invoke-interface {v10}, Ljava/util/Iterator;->hasNext()Z

    move-result v15

    if-eqz v15, :cond_c

    invoke-interface {v10}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Lcom/belkin/wemo/cache/data/DeviceInformation;

    .line 596
    .restart local v7    # "cacheDevice":Lcom/belkin/wemo/cache/data/DeviceInformation;
    invoke-virtual {v7}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getInActive()I

    move-result v15

    const/16 v16, 0x1

    move/from16 v0, v16

    if-ne v15, v0, :cond_b

    .line 597
    const-string v15, "WeMoSDK"

    new-instance v16, Ljava/lang/StringBuilder;

    invoke-direct/range {v16 .. v16}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v7}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getUDN()Ljava/lang/String;

    move-result-object v17

    invoke-virtual/range {v16 .. v17}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v16

    const-string v17, " is unavailable"

    invoke-virtual/range {v16 .. v17}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v16

    invoke-virtual/range {v16 .. v16}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v16

    invoke-static/range {v15 .. v16}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 598
    invoke-virtual {v7}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getUDN()Ljava/lang/String;

    move-result-object v15

    invoke-virtual {v11, v15}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;
    :try_end_5
    .catch Lorg/json/JSONException; {:try_start_5 .. :try_end_5} :catch_4

    goto :goto_3

    .line 605
    .end local v7    # "cacheDevice":Lcom/belkin/wemo/cache/data/DeviceInformation;
    .end local v10    # "i$":Ljava/util/Iterator;
    .end local v11    # "list":Lorg/json/JSONArray;
    :catch_4
    move-exception v9

    .line 607
    .restart local v9    # "e":Lorg/json/JSONException;
    invoke-virtual {v9}, Lorg/json/JSONException;->printStackTrace()V

    goto/16 :goto_0

    .line 601
    .end local v9    # "e":Lorg/json/JSONException;
    .restart local v10    # "i$":Ljava/util/Iterator;
    .restart local v11    # "list":Lorg/json/JSONArray;
    :cond_c
    :try_start_6
    const-string v15, "udn"

    invoke-virtual {v13, v15, v11}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 602
    new-instance v12, Lorg/apache/cordova/PluginResult;

    sget-object v15, Lorg/apache/cordova/PluginResult$Status;->OK:Lorg/apache/cordova/PluginResult$Status;

    invoke-direct {v12, v15, v13}, Lorg/apache/cordova/PluginResult;-><init>(Lorg/apache/cordova/PluginResult$Status;Lorg/json/JSONObject;)V

    .line 603
    .restart local v12    # "result":Lorg/apache/cordova/PluginResult;
    const/4 v15, 0x1

    invoke-virtual {v12, v15}, Lorg/apache/cordova/PluginResult;->setKeepCallback(Z)V

    .line 604
    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/belkin/cordova/plugin/DevicePlugin$5;->this$0:Lcom/belkin/cordova/plugin/DevicePlugin;

    invoke-static {v15}, Lcom/belkin/cordova/plugin/DevicePlugin;->access$300(Lcom/belkin/cordova/plugin/DevicePlugin;)Lorg/apache/cordova/CallbackContext;

    move-result-object v15

    invoke-virtual {v15, v12}, Lorg/apache/cordova/CallbackContext;->sendPluginResult(Lorg/apache/cordova/PluginResult;)V
    :try_end_6
    .catch Lorg/json/JSONException; {:try_start_6 .. :try_end_6} :catch_4

    goto/16 :goto_0

    .line 609
    .end local v10    # "i$":Ljava/util/Iterator;
    .end local v11    # "list":Lorg/json/JSONArray;
    .end local v12    # "result":Lorg/apache/cordova/PluginResult;
    .end local v13    # "state":Lorg/json/JSONObject;
    :cond_d
    invoke-virtual/range {p2 .. p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v15

    const-string v16, "com.controller.belkin.hybrid.BRIDGE_DEVICES_STATUS"

    invoke-virtual/range {v15 .. v16}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v15

    if-eqz v15, :cond_e

    .line 610
    const-string v15, "DevicePlugin"

    const-string v16, "onReceive(Context context, Intent intent):: com.controller.belkin.hybrid.BRIDGE_DEVICES_STATUS"

    invoke-static/range {v15 .. v16}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 611
    const/4 v15, 0x1

    new-array v5, v15, [Ljava/lang/String;

    const/4 v15, 0x0

    const-string v16, "getLedStatusList"

    aput-object v16, v5, v15

    .line 612
    .local v5, "attrs":[Ljava/lang/String;
    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/belkin/cordova/plugin/DevicePlugin$5;->this$0:Lcom/belkin/cordova/plugin/DevicePlugin;

    const-string v16, "get_end_device_status_list"

    move-object/from16 v0, p2

    move-object/from16 v1, v16

    invoke-static {v15, v0, v1, v5}, Lcom/belkin/cordova/plugin/DevicePlugin;->access$400(Lcom/belkin/cordova/plugin/DevicePlugin;Landroid/content/Intent;Ljava/lang/String;[Ljava/lang/String;)V

    goto/16 :goto_0

    .line 613
    .end local v5    # "attrs":[Ljava/lang/String;
    :cond_e
    invoke-virtual/range {p2 .. p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v15

    const-string v16, "com.controller.belkin.hybrid.BRIDGE_DEVICES"

    invoke-virtual/range {v15 .. v16}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v15

    if-eqz v15, :cond_f

    .line 614
    const-string v15, "DevicePlugin"

    const-string v16, "onReceive(Context context, Intent intent):: com.controller.belkin.hybrid.BRIDGE_DEVICES"

    invoke-static/range {v15 .. v16}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 615
    const/4 v15, 0x1

    new-array v5, v15, [Ljava/lang/String;

    const/4 v15, 0x0

    const-string v16, "getLedList"

    aput-object v16, v5, v15

    .line 616
    .restart local v5    # "attrs":[Ljava/lang/String;
    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/belkin/cordova/plugin/DevicePlugin$5;->this$0:Lcom/belkin/cordova/plugin/DevicePlugin;

    const-string v16, "get_end_device_list"

    move-object/from16 v0, p2

    move-object/from16 v1, v16

    invoke-static {v15, v0, v1, v5}, Lcom/belkin/cordova/plugin/DevicePlugin;->access$400(Lcom/belkin/cordova/plugin/DevicePlugin;Landroid/content/Intent;Ljava/lang/String;[Ljava/lang/String;)V

    goto/16 :goto_0

    .line 617
    .end local v5    # "attrs":[Ljava/lang/String;
    :cond_f
    invoke-virtual/range {p2 .. p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v15

    const-string v16, "SubDeviceFWUpdate"

    invoke-virtual/range {v15 .. v16}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v15

    if-eqz v15, :cond_10

    .line 618
    const-string v15, "DevicePlugin"

    const-string v16, "onReceive(Context context, Intent intent)::buld SubDeviceFWUpdate"

    invoke-static/range {v15 .. v16}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 619
    new-instance v2, Lorg/json/JSONObject;

    invoke-direct {v2}, Lorg/json/JSONObject;-><init>()V

    .line 621
    .local v2, "ListObject":Lorg/json/JSONObject;
    :try_start_7
    const-string v15, "listen"

    const-string v16, "get_led_firmware_status"

    move-object/from16 v0, v16

    invoke-virtual {v2, v15, v0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 622
    sget-object v15, Lcom/belkin/wemo/cache/devicelist/JSONConstants;->NOTIFY_DEVICE_ID:Ljava/lang/String;

    sget-object v16, Lcom/belkin/wemo/cache/devicelist/JSONConstants;->NOTIFY_DEVICE_ID:Ljava/lang/String;

    move-object/from16 v0, p2

    move-object/from16 v1, v16

    invoke-virtual {v0, v1}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v16

    move-object/from16 v0, v16

    invoke-virtual {v2, v15, v0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 623
    sget-object v15, Lcom/belkin/wemo/cache/devicelist/JSONConstants;->NOTIFY_EVENT_TYPE:Ljava/lang/String;

    sget-object v16, Lcom/belkin/wemo/cache/devicelist/JSONConstants;->NOTIFY_EVENT_TYPE:Ljava/lang/String;

    move-object/from16 v0, p2

    move-object/from16 v1, v16

    invoke-virtual {v0, v1}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v16

    move-object/from16 v0, v16

    invoke-virtual {v2, v15, v0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 624
    const-string v15, "state"

    const-string v16, "state"

    move-object/from16 v0, p2

    move-object/from16 v1, v16

    invoke-virtual {v0, v1}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v16

    move-object/from16 v0, v16

    invoke-virtual {v2, v15, v0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 626
    new-instance v12, Lorg/apache/cordova/PluginResult;

    sget-object v15, Lorg/apache/cordova/PluginResult$Status;->OK:Lorg/apache/cordova/PluginResult$Status;

    invoke-direct {v12, v15, v2}, Lorg/apache/cordova/PluginResult;-><init>(Lorg/apache/cordova/PluginResult$Status;Lorg/json/JSONObject;)V

    .line 627
    .restart local v12    # "result":Lorg/apache/cordova/PluginResult;
    const/4 v15, 0x1

    invoke-virtual {v12, v15}, Lorg/apache/cordova/PluginResult;->setKeepCallback(Z)V

    .line 628
    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/belkin/cordova/plugin/DevicePlugin$5;->this$0:Lcom/belkin/cordova/plugin/DevicePlugin;

    invoke-static {v15}, Lcom/belkin/cordova/plugin/DevicePlugin;->access$300(Lcom/belkin/cordova/plugin/DevicePlugin;)Lorg/apache/cordova/CallbackContext;

    move-result-object v15

    invoke-virtual {v15, v12}, Lorg/apache/cordova/CallbackContext;->sendPluginResult(Lorg/apache/cordova/PluginResult;)V

    .line 630
    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/belkin/cordova/plugin/DevicePlugin$5;->val$tmpDP:Lcom/belkin/cordova/plugin/DevicePlugin;

    new-instance v16, Ljava/lang/StringBuilder;

    invoke-direct/range {v16 .. v16}, Ljava/lang/StringBuilder;-><init>()V

    const-string v17, "WeMoDeviceUtils.onFirmwareLedUpgrade(\'"

    invoke-virtual/range {v16 .. v17}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v16

    invoke-virtual {v2}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v17

    invoke-virtual/range {v16 .. v17}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v16

    const-string v17, "\');"

    invoke-virtual/range {v16 .. v17}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v16

    invoke-virtual/range {v16 .. v16}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v16

    invoke-static/range {v15 .. v16}, Lcom/belkin/cordova/plugin/DevicePlugin;->access$200(Lcom/belkin/cordova/plugin/DevicePlugin;Ljava/lang/String;)V
    :try_end_7
    .catch Lorg/json/JSONException; {:try_start_7 .. :try_end_7} :catch_5

    goto/16 :goto_0

    .line 631
    .end local v12    # "result":Lorg/apache/cordova/PluginResult;
    :catch_5
    move-exception v9

    .line 632
    .restart local v9    # "e":Lorg/json/JSONException;
    invoke-virtual {v9}, Lorg/json/JSONException;->printStackTrace()V

    goto/16 :goto_0

    .line 635
    .end local v2    # "ListObject":Lorg/json/JSONObject;
    .end local v9    # "e":Lorg/json/JSONException;
    :cond_10
    invoke-virtual/range {p2 .. p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v15

    const-string v16, "FirmwareUpdateStatus"

    invoke-virtual/range {v15 .. v16}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v15

    if-eqz v15, :cond_11

    .line 636
    const-string v15, "DevicePlugin"

    const-string v16, "onReceive(Context context, Intent intent):: FirmwareUpdateStatus"

    invoke-static/range {v15 .. v16}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 637
    new-instance v2, Lorg/json/JSONObject;

    invoke-direct {v2}, Lorg/json/JSONObject;-><init>()V

    .line 639
    .restart local v2    # "ListObject":Lorg/json/JSONObject;
    :try_start_8
    const-string v15, "listen"

    const-string v16, "get_firmware_message"

    move-object/from16 v0, v16

    invoke-virtual {v2, v15, v0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 640
    const-string v15, "udn"

    const-string v16, "udn"

    move-object/from16 v0, p2

    move-object/from16 v1, v16

    invoke-virtual {v0, v1}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v16

    move-object/from16 v0, v16

    invoke-virtual {v2, v15, v0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 641
    const-string v15, "state"

    const-string v16, "state"

    move-object/from16 v0, p2

    move-object/from16 v1, v16

    invoke-virtual {v0, v1}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v16

    move-object/from16 v0, v16

    invoke-virtual {v2, v15, v0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 643
    new-instance v12, Lorg/apache/cordova/PluginResult;

    sget-object v15, Lorg/apache/cordova/PluginResult$Status;->OK:Lorg/apache/cordova/PluginResult$Status;

    invoke-direct {v12, v15, v2}, Lorg/apache/cordova/PluginResult;-><init>(Lorg/apache/cordova/PluginResult$Status;Lorg/json/JSONObject;)V

    .line 644
    .restart local v12    # "result":Lorg/apache/cordova/PluginResult;
    const/4 v15, 0x1

    invoke-virtual {v12, v15}, Lorg/apache/cordova/PluginResult;->setKeepCallback(Z)V

    .line 645
    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/belkin/cordova/plugin/DevicePlugin$5;->this$0:Lcom/belkin/cordova/plugin/DevicePlugin;

    invoke-static {v15}, Lcom/belkin/cordova/plugin/DevicePlugin;->access$300(Lcom/belkin/cordova/plugin/DevicePlugin;)Lorg/apache/cordova/CallbackContext;

    move-result-object v15

    invoke-virtual {v15, v12}, Lorg/apache/cordova/CallbackContext;->sendPluginResult(Lorg/apache/cordova/PluginResult;)V

    .line 647
    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/belkin/cordova/plugin/DevicePlugin$5;->val$tmpDP:Lcom/belkin/cordova/plugin/DevicePlugin;

    new-instance v16, Ljava/lang/StringBuilder;

    invoke-direct/range {v16 .. v16}, Ljava/lang/StringBuilder;-><init>()V

    const-string v17, "WeMoDeviceUtils.onFirmwareUpgrade(\'"

    invoke-virtual/range {v16 .. v17}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v16

    invoke-virtual {v2}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v17

    invoke-virtual/range {v16 .. v17}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v16

    const-string v17, "\');"

    invoke-virtual/range {v16 .. v17}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v16

    invoke-virtual/range {v16 .. v16}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v16

    invoke-static/range {v15 .. v16}, Lcom/belkin/cordova/plugin/DevicePlugin;->access$200(Lcom/belkin/cordova/plugin/DevicePlugin;Ljava/lang/String;)V
    :try_end_8
    .catch Lorg/json/JSONException; {:try_start_8 .. :try_end_8} :catch_6

    goto/16 :goto_0

    .line 648
    .end local v12    # "result":Lorg/apache/cordova/PluginResult;
    :catch_6
    move-exception v9

    .line 649
    .restart local v9    # "e":Lorg/json/JSONException;
    invoke-virtual {v9}, Lorg/json/JSONException;->printStackTrace()V

    goto/16 :goto_0

    .line 652
    .end local v2    # "ListObject":Lorg/json/JSONObject;
    .end local v9    # "e":Lorg/json/JSONException;
    :cond_11
    invoke-virtual/range {p2 .. p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v15

    const-string v16, "CountdownEndTime"

    invoke-virtual/range {v15 .. v16}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v15

    if-eqz v15, :cond_1

    .line 653
    const-string v15, "DevicePlugin"

    const-string v16, "onReceive(Context context, Intent intent):: CountdownEndTime"

    invoke-static/range {v15 .. v16}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 654
    new-instance v2, Lorg/json/JSONObject;

    invoke-direct {v2}, Lorg/json/JSONObject;-><init>()V

    .line 656
    .restart local v2    # "ListObject":Lorg/json/JSONObject;
    :try_start_9
    const-string v15, "listen"

    const-string v16, "get_countdown_time"

    move-object/from16 v0, v16

    invoke-virtual {v2, v15, v0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 657
    const-string v15, "udn"

    const-string v16, "udn"

    move-object/from16 v0, p2

    move-object/from16 v1, v16

    invoke-virtual {v0, v1}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v16

    move-object/from16 v0, v16

    invoke-virtual {v2, v15, v0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 658
    const-string v15, "countdownEndTime"

    const-string v16, "countdownEndTime"

    move-object/from16 v0, p2

    move-object/from16 v1, v16

    invoke-virtual {v0, v1}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v16

    move-object/from16 v0, v16

    invoke-virtual {v2, v15, v0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 660
    new-instance v12, Lorg/apache/cordova/PluginResult;

    sget-object v15, Lorg/apache/cordova/PluginResult$Status;->OK:Lorg/apache/cordova/PluginResult$Status;

    invoke-direct {v12, v15, v2}, Lorg/apache/cordova/PluginResult;-><init>(Lorg/apache/cordova/PluginResult$Status;Lorg/json/JSONObject;)V

    .line 661
    .restart local v12    # "result":Lorg/apache/cordova/PluginResult;
    const/4 v15, 0x1

    invoke-virtual {v12, v15}, Lorg/apache/cordova/PluginResult;->setKeepCallback(Z)V

    .line 662
    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/belkin/cordova/plugin/DevicePlugin$5;->this$0:Lcom/belkin/cordova/plugin/DevicePlugin;

    invoke-static {v15}, Lcom/belkin/cordova/plugin/DevicePlugin;->access$300(Lcom/belkin/cordova/plugin/DevicePlugin;)Lorg/apache/cordova/CallbackContext;

    move-result-object v15

    invoke-virtual {v15, v12}, Lorg/apache/cordova/CallbackContext;->sendPluginResult(Lorg/apache/cordova/PluginResult;)V

    .line 663
    const-string v15, "DevicePlugin"

    new-instance v16, Ljava/lang/StringBuilder;

    invoke-direct/range {v16 .. v16}, Ljava/lang/StringBuilder;-><init>()V

    const-string v17, "the listObject is:: "

    invoke-virtual/range {v16 .. v17}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v16

    invoke-virtual {v2}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v17

    invoke-virtual/range {v16 .. v17}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v16

    invoke-virtual/range {v16 .. v16}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v16

    invoke-static/range {v15 .. v16}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_9
    .catch Lorg/json/JSONException; {:try_start_9 .. :try_end_9} :catch_7

    goto/16 :goto_0

    .line 664
    .end local v12    # "result":Lorg/apache/cordova/PluginResult;
    :catch_7
    move-exception v9

    .line 665
    .restart local v9    # "e":Lorg/json/JSONException;
    invoke-virtual {v9}, Lorg/json/JSONException;->printStackTrace()V

    goto/16 :goto_0
.end method
