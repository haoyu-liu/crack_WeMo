.class Lcom/belkin/cordova/plugin/WeMoSMARTDevicePlugin$DeviceChangeReceiver$1;
.super Ljava/lang/Object;
.source "WeMoSMARTDevicePlugin.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/belkin/cordova/plugin/WeMoSMARTDevicePlugin$DeviceChangeReceiver;->onReceive(Landroid/content/Context;Landroid/content/Intent;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/belkin/cordova/plugin/WeMoSMARTDevicePlugin$DeviceChangeReceiver;

.field final synthetic val$intentT:Landroid/content/Intent;


# direct methods
.method constructor <init>(Lcom/belkin/cordova/plugin/WeMoSMARTDevicePlugin$DeviceChangeReceiver;Landroid/content/Intent;)V
    .locals 0

    .prologue
    .line 537
    iput-object p1, p0, Lcom/belkin/cordova/plugin/WeMoSMARTDevicePlugin$DeviceChangeReceiver$1;->this$1:Lcom/belkin/cordova/plugin/WeMoSMARTDevicePlugin$DeviceChangeReceiver;

    iput-object p2, p0, Lcom/belkin/cordova/plugin/WeMoSMARTDevicePlugin$DeviceChangeReceiver$1;->val$intentT:Landroid/content/Intent;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 10

    .prologue
    .line 544
    :try_start_0
    iget-object v7, p0, Lcom/belkin/cordova/plugin/WeMoSMARTDevicePlugin$DeviceChangeReceiver$1;->val$intentT:Landroid/content/Intent;

    const-string v8, "udn"

    invoke-virtual {v7, v8}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    .line 545
    .local v4, "udn":Ljava/lang/String;
    if-eqz v4, :cond_1

    .line 546
    iget-object v7, p0, Lcom/belkin/cordova/plugin/WeMoSMARTDevicePlugin$DeviceChangeReceiver$1;->this$1:Lcom/belkin/cordova/plugin/WeMoSMARTDevicePlugin$DeviceChangeReceiver;

    invoke-static {v7}, Lcom/belkin/cordova/plugin/WeMoSMARTDevicePlugin$DeviceChangeReceiver;->access$700(Lcom/belkin/cordova/plugin/WeMoSMARTDevicePlugin$DeviceChangeReceiver;)Ljava/util/Map;

    move-result-object v7

    invoke-interface {v7, v4}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_1

    .line 547
    iget-object v7, p0, Lcom/belkin/cordova/plugin/WeMoSMARTDevicePlugin$DeviceChangeReceiver$1;->this$1:Lcom/belkin/cordova/plugin/WeMoSMARTDevicePlugin$DeviceChangeReceiver;

    iget-object v7, v7, Lcom/belkin/cordova/plugin/WeMoSMARTDevicePlugin$DeviceChangeReceiver;->this$0:Lcom/belkin/cordova/plugin/WeMoSMARTDevicePlugin;

    invoke-static {v7}, Lcom/belkin/cordova/plugin/WeMoSMARTDevicePlugin;->access$100(Lcom/belkin/cordova/plugin/WeMoSMARTDevicePlugin;)Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;

    move-result-object v7

    invoke-virtual {v7, v4}, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->getDevice(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v1

    .line 548
    .local v1, "device":Lorg/json/JSONObject;
    if-eqz v1, :cond_3

    .line 549
    const-string v7, "state"

    iget-object v8, p0, Lcom/belkin/cordova/plugin/WeMoSMARTDevicePlugin$DeviceChangeReceiver$1;->val$intentT:Landroid/content/Intent;

    const-string v9, "state"

    invoke-virtual {v8, v9}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v1, v7, v8}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 550
    sget-object v7, Lcom/belkin/wemo/cache/devicelist/JSONConstants;->NOTIFY_TYPE:Ljava/lang/String;

    iget-object v8, p0, Lcom/belkin/cordova/plugin/WeMoSMARTDevicePlugin$DeviceChangeReceiver$1;->val$intentT:Landroid/content/Intent;

    sget-object v9, Lcom/belkin/wemo/cache/devicelist/JSONConstants;->NOTIFY_TYPE:Ljava/lang/String;

    invoke-virtual {v8, v9}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v1, v7, v8}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 551
    iget-object v7, p0, Lcom/belkin/cordova/plugin/WeMoSMARTDevicePlugin$DeviceChangeReceiver$1;->val$intentT:Landroid/content/Intent;

    const-string v8, "attributeList"

    invoke-virtual {v7, v8}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 552
    .local v0, "attributeList":Ljava/lang/String;
    if-nez v0, :cond_2

    .line 553
    new-instance v5, Lorg/json/JSONObject;

    invoke-direct {v5}, Lorg/json/JSONObject;-><init>()V

    .line 554
    .local v5, "wemoDeviceJsonObject":Lorg/json/JSONObject;
    iget-object v7, p0, Lcom/belkin/cordova/plugin/WeMoSMARTDevicePlugin$DeviceChangeReceiver$1;->this$1:Lcom/belkin/cordova/plugin/WeMoSMARTDevicePlugin$DeviceChangeReceiver;

    iget-object v7, v7, Lcom/belkin/cordova/plugin/WeMoSMARTDevicePlugin$DeviceChangeReceiver;->this$0:Lcom/belkin/cordova/plugin/WeMoSMARTDevicePlugin;

    invoke-static {v7, v4}, Lcom/belkin/cordova/plugin/WeMoSMARTDevicePlugin;->access$800(Lcom/belkin/cordova/plugin/WeMoSMARTDevicePlugin;Ljava/lang/String;)Lcom/belkin/wemo/localsdk/WeMoDevice;

    move-result-object v6

    .line 555
    .local v6, "wemodevice":Lcom/belkin/wemo/localsdk/WeMoDevice;
    if-nez v6, :cond_0

    .line 556
    iget-object v7, p0, Lcom/belkin/cordova/plugin/WeMoSMARTDevicePlugin$DeviceChangeReceiver$1;->this$1:Lcom/belkin/cordova/plugin/WeMoSMARTDevicePlugin$DeviceChangeReceiver;

    iget-object v7, v7, Lcom/belkin/cordova/plugin/WeMoSMARTDevicePlugin$DeviceChangeReceiver;->this$0:Lcom/belkin/cordova/plugin/WeMoSMARTDevicePlugin;

    invoke-static {v7}, Lcom/belkin/cordova/plugin/WeMoSMARTDevicePlugin;->access$200(Lcom/belkin/cordova/plugin/WeMoSMARTDevicePlugin;)Landroid/content/Context;

    move-result-object v7

    invoke-static {v7}, Lcom/belkin/wemo/localsdk/WeMoSDKContext;->getInstance(Landroid/content/Context;)Lcom/belkin/wemo/localsdk/WeMoSDKContext;

    move-result-object v7

    sput-object v7, Lcom/belkin/cordova/plugin/WeMoSMARTDevicePlugin;->mWeMoSDKContext:Lcom/belkin/wemo/localsdk/WeMoSDKContext;

    .line 557
    iget-object v7, p0, Lcom/belkin/cordova/plugin/WeMoSMARTDevicePlugin$DeviceChangeReceiver$1;->this$1:Lcom/belkin/cordova/plugin/WeMoSMARTDevicePlugin$DeviceChangeReceiver;

    iget-object v7, v7, Lcom/belkin/cordova/plugin/WeMoSMARTDevicePlugin$DeviceChangeReceiver;->this$0:Lcom/belkin/cordova/plugin/WeMoSMARTDevicePlugin;

    invoke-static {v7, v4}, Lcom/belkin/cordova/plugin/WeMoSMARTDevicePlugin;->access$800(Lcom/belkin/cordova/plugin/WeMoSMARTDevicePlugin;Ljava/lang/String;)Lcom/belkin/wemo/localsdk/WeMoDevice;

    move-result-object v6

    .line 559
    :cond_0
    sget-object v7, Lcom/belkin/wemo/cache/devicelist/JSONConstants;->BINARY_STATE:Ljava/lang/String;

    iget-object v8, p0, Lcom/belkin/cordova/plugin/WeMoSMARTDevicePlugin$DeviceChangeReceiver$1;->val$intentT:Landroid/content/Intent;

    const-string v9, "state"

    invoke-virtual {v8, v9}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v5, v7, v8}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 560
    const-string v7, "RuleAutoOffTime"

    invoke-virtual {v6}, Lcom/belkin/wemo/localsdk/WeMoDevice;->getCountdownEndTime()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v5, v7, v8}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 561
    sget-object v7, Lcom/belkin/wemo/cache/devicelist/JSONConstants;->INSIGHT_ON_FOR:Ljava/lang/String;

    iget-object v8, p0, Lcom/belkin/cordova/plugin/WeMoSMARTDevicePlugin$DeviceChangeReceiver$1;->val$intentT:Landroid/content/Intent;

    sget-object v9, Lcom/belkin/wemo/cache/devicelist/JSONConstants;->INSIGHT_ON_FOR:Ljava/lang/String;

    invoke-virtual {v8, v9}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v5, v7, v8}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 562
    sget-object v7, Lcom/belkin/wemo/cache/devicelist/JSONConstants;->INSIGHT_TTTON:Ljava/lang/String;

    iget-object v8, p0, Lcom/belkin/cordova/plugin/WeMoSMARTDevicePlugin$DeviceChangeReceiver$1;->val$intentT:Landroid/content/Intent;

    sget-object v9, Lcom/belkin/wemo/cache/devicelist/JSONConstants;->INSIGHT_TTTON:Ljava/lang/String;

    invoke-virtual {v8, v9}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v5, v7, v8}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 563
    sget-object v7, Lcom/belkin/wemo/cache/devicelist/JSONConstants;->INSIGHT_PAST_14_TOTAL_TIME:Ljava/lang/String;

    iget-object v8, p0, Lcom/belkin/cordova/plugin/WeMoSMARTDevicePlugin$DeviceChangeReceiver$1;->val$intentT:Landroid/content/Intent;

    sget-object v9, Lcom/belkin/wemo/cache/devicelist/JSONConstants;->INSIGHT_PAST_14_TOTAL_TIME:Ljava/lang/String;

    invoke-virtual {v8, v9}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v5, v7, v8}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 564
    sget-object v7, Lcom/belkin/wemo/cache/devicelist/JSONConstants;->INSIGHT_HRS_CONNECTED:Ljava/lang/String;

    iget-object v8, p0, Lcom/belkin/cordova/plugin/WeMoSMARTDevicePlugin$DeviceChangeReceiver$1;->val$intentT:Landroid/content/Intent;

    sget-object v9, Lcom/belkin/wemo/cache/devicelist/JSONConstants;->INSIGHT_HRS_CONNECTED:Ljava/lang/String;

    invoke-virtual {v8, v9}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v5, v7, v8}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 565
    sget-object v7, Lcom/belkin/wemo/cache/devicelist/JSONConstants;->INSIGHT_AVG_POWER_ON:Ljava/lang/String;

    iget-object v8, p0, Lcom/belkin/cordova/plugin/WeMoSMARTDevicePlugin$DeviceChangeReceiver$1;->val$intentT:Landroid/content/Intent;

    sget-object v9, Lcom/belkin/wemo/cache/devicelist/JSONConstants;->INSIGHT_AVG_POWER_ON:Ljava/lang/String;

    invoke-virtual {v8, v9}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v5, v7, v8}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 566
    sget-object v7, Lcom/belkin/wemo/cache/devicelist/JSONConstants;->INSIGHT_POWER_NOW:Ljava/lang/String;

    iget-object v8, p0, Lcom/belkin/cordova/plugin/WeMoSMARTDevicePlugin$DeviceChangeReceiver$1;->val$intentT:Landroid/content/Intent;

    sget-object v9, Lcom/belkin/wemo/cache/devicelist/JSONConstants;->INSIGHT_POWER_NOW:Ljava/lang/String;

    invoke-virtual {v8, v9}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v5, v7, v8}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 567
    sget-object v7, Lcom/belkin/wemo/cache/devicelist/JSONConstants;->INSIGHT_TODAY_TOTAL_KWH:Ljava/lang/String;

    iget-object v8, p0, Lcom/belkin/cordova/plugin/WeMoSMARTDevicePlugin$DeviceChangeReceiver$1;->val$intentT:Landroid/content/Intent;

    sget-object v9, Lcom/belkin/wemo/cache/devicelist/JSONConstants;->INSIGHT_TODAY_TOTAL_KWH:Ljava/lang/String;

    invoke-virtual {v8, v9}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v5, v7, v8}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 568
    sget-object v7, Lcom/belkin/wemo/cache/devicelist/JSONConstants;->INSIGHT_PAST_14_DAYS_KWH:Ljava/lang/String;

    iget-object v8, p0, Lcom/belkin/cordova/plugin/WeMoSMARTDevicePlugin$DeviceChangeReceiver$1;->val$intentT:Landroid/content/Intent;

    sget-object v9, Lcom/belkin/wemo/cache/devicelist/JSONConstants;->INSIGHT_PAST_14_DAYS_KWH:Ljava/lang/String;

    invoke-virtual {v8, v9}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v5, v7, v8}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 569
    sget-object v7, Lcom/belkin/wemo/cache/devicelist/JSONConstants;->INSIGHT_POWER_THRESHOLD:Ljava/lang/String;

    iget-object v8, p0, Lcom/belkin/cordova/plugin/WeMoSMARTDevicePlugin$DeviceChangeReceiver$1;->val$intentT:Landroid/content/Intent;

    sget-object v9, Lcom/belkin/wemo/cache/devicelist/JSONConstants;->INSIGHT_POWER_THRESHOLD:Ljava/lang/String;

    invoke-virtual {v8, v9}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v5, v7, v8}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 571
    const-string v7, "attributeList"

    invoke-virtual {v1, v7, v5}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 577
    .end local v5    # "wemoDeviceJsonObject":Lorg/json/JSONObject;
    .end local v6    # "wemodevice":Lcom/belkin/wemo/localsdk/WeMoDevice;
    :goto_0
    const-string v7, "WeMoSMARTDevicePlugin"

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "onReceive() wemosmart plugin notifications: "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-static {v7, v8}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 578
    new-instance v3, Lorg/apache/cordova/PluginResult;

    sget-object v7, Lorg/apache/cordova/PluginResult$Status;->OK:Lorg/apache/cordova/PluginResult$Status;

    invoke-direct {v3, v7, v1}, Lorg/apache/cordova/PluginResult;-><init>(Lorg/apache/cordova/PluginResult$Status;Lorg/json/JSONObject;)V

    .line 579
    .local v3, "result":Lorg/apache/cordova/PluginResult;
    const/4 v7, 0x1

    invoke-virtual {v3, v7}, Lorg/apache/cordova/PluginResult;->setKeepCallback(Z)V

    .line 580
    iget-object v7, p0, Lcom/belkin/cordova/plugin/WeMoSMARTDevicePlugin$DeviceChangeReceiver$1;->this$1:Lcom/belkin/cordova/plugin/WeMoSMARTDevicePlugin$DeviceChangeReceiver;

    invoke-static {v7}, Lcom/belkin/cordova/plugin/WeMoSMARTDevicePlugin$DeviceChangeReceiver;->access$700(Lcom/belkin/cordova/plugin/WeMoSMARTDevicePlugin$DeviceChangeReceiver;)Ljava/util/Map;

    move-result-object v7

    invoke-interface {v7, v4}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Lorg/apache/cordova/CallbackContext;

    invoke-virtual {v7, v3}, Lorg/apache/cordova/CallbackContext;->sendPluginResult(Lorg/apache/cordova/PluginResult;)V

    .line 589
    .end local v0    # "attributeList":Ljava/lang/String;
    .end local v1    # "device":Lorg/json/JSONObject;
    .end local v3    # "result":Lorg/apache/cordova/PluginResult;
    .end local v4    # "udn":Ljava/lang/String;
    :cond_1
    :goto_1
    return-void

    .line 574
    .restart local v0    # "attributeList":Ljava/lang/String;
    .restart local v1    # "device":Lorg/json/JSONObject;
    .restart local v4    # "udn":Ljava/lang/String;
    :cond_2
    const-string v7, "attributeList"

    invoke-virtual {v1, v7, v0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 586
    .end local v0    # "attributeList":Ljava/lang/String;
    .end local v1    # "device":Lorg/json/JSONObject;
    .end local v4    # "udn":Ljava/lang/String;
    :catch_0
    move-exception v2

    .line 587
    .local v2, "e":Ljava/lang/Exception;
    const-string v7, "WeMoSMARTDevicePlugin"

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "DeviceChangeReceiver onReceive() exception: "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-static {v7, v8}, Lcom/belkin/utils/LogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_1

    .line 582
    .end local v2    # "e":Ljava/lang/Exception;
    .restart local v1    # "device":Lorg/json/JSONObject;
    .restart local v4    # "udn":Ljava/lang/String;
    :cond_3
    :try_start_1
    const-string v7, "WeMoSMARTDevicePlugin"

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "Device change error: Device not found "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-static {v7, v8}, Lcom/belkin/utils/LogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_1
.end method
