.class public Lcom/belkin/wemo/cache/devicelist/runnable/ResetFNIconRulesRunnable;
.super Lcom/belkin/wemo/runnable/WeMoRunnable;
.source "ResetFNIconRulesRunnable.java"


# static fields
.field private static final TAG:Ljava/lang/String; = "ResetFNIconRulesRunnable"


# instance fields
.field private deviceInformation:Lorg/json/JSONObject;

.field private latch:Ljava/util/concurrent/CountDownLatch;

.field private mDeviceListManager:Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

.field private stateData:Lorg/json/JSONObject;

.field private udn:Ljava/lang/String;


# direct methods
.method public constructor <init>(Lcom/belkin/wemo/cache/devicelist/DeviceListManager;Ljava/util/concurrent/CountDownLatch;Ljava/lang/String;Lorg/json/JSONObject;Lorg/json/JSONObject;)V
    .locals 0
    .param p1, "devListMan"    # Lcom/belkin/wemo/cache/devicelist/DeviceListManager;
    .param p2, "latch"    # Ljava/util/concurrent/CountDownLatch;
    .param p3, "udn"    # Ljava/lang/String;
    .param p4, "deviceInformation"    # Lorg/json/JSONObject;
    .param p5, "stateData"    # Lorg/json/JSONObject;

    .prologue
    .line 31
    invoke-direct {p0}, Lcom/belkin/wemo/runnable/WeMoRunnable;-><init>()V

    .line 33
    iput-object p1, p0, Lcom/belkin/wemo/cache/devicelist/runnable/ResetFNIconRulesRunnable;->mDeviceListManager:Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    .line 34
    iput-object p2, p0, Lcom/belkin/wemo/cache/devicelist/runnable/ResetFNIconRulesRunnable;->latch:Ljava/util/concurrent/CountDownLatch;

    .line 35
    iput-object p3, p0, Lcom/belkin/wemo/cache/devicelist/runnable/ResetFNIconRulesRunnable;->udn:Ljava/lang/String;

    .line 36
    iput-object p4, p0, Lcom/belkin/wemo/cache/devicelist/runnable/ResetFNIconRulesRunnable;->deviceInformation:Lorg/json/JSONObject;

    .line 37
    iput-object p5, p0, Lcom/belkin/wemo/cache/devicelist/runnable/ResetFNIconRulesRunnable;->stateData:Lorg/json/JSONObject;

    .line 38
    return-void
.end method


# virtual methods
.method public run()V
    .locals 18

    .prologue
    .line 42
    const/4 v13, 0x0

    invoke-static {v13}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v8

    .line 44
    .local v8, "hasFinishedReset":Ljava/lang/Boolean;
    :try_start_0
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/belkin/wemo/cache/devicelist/runnable/ResetFNIconRulesRunnable;->mDeviceListManager:Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    invoke-virtual {v13}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->getUpnpControl()Lorg/cybergarage/upnp/ControlPoint;

    move-result-object v3

    .line 45
    .local v3, "controlPoint":Lorg/cybergarage/upnp/ControlPoint;
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/belkin/wemo/cache/devicelist/runnable/ResetFNIconRulesRunnable;->mDeviceListManager:Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/belkin/wemo/cache/devicelist/runnable/ResetFNIconRulesRunnable;->udn:Ljava/lang/String;

    const/4 v15, 0x0

    const/16 v16, 0x0

    const/16 v17, 0x1

    invoke-virtual/range {v13 .. v17}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->getDeviceFromDBByUDN(Ljava/lang/String;ZZZ)Lcom/belkin/wemo/cache/data/DeviceInformation;

    move-result-object v4

    .line 47
    .local v4, "dev":Lcom/belkin/wemo/cache/data/DeviceInformation;
    if-eqz v4, :cond_5

    .line 48
    const-string v13, "ResetFNIconRulesRunnable"

    new-instance v14, Ljava/lang/StringBuilder;

    invoke-direct {v14}, Ljava/lang/StringBuilder;-><init>()V

    const-string v15, "dev: "

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v14

    invoke-static {v13, v14}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 49
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/belkin/wemo/cache/devicelist/runnable/ResetFNIconRulesRunnable;->stateData:Lorg/json/JSONObject;

    const-string v14, "friendlyName"

    invoke-virtual {v13, v14}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    .line 51
    .local v7, "friendlyName":Ljava/lang/String;
    const-string v13, "ResetFNIconRulesRunnable"

    new-instance v14, Ljava/lang/StringBuilder;

    invoke-direct {v14}, Ljava/lang/StringBuilder;-><init>()V

    const-string v15, "Reset in local for udn: "

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/belkin/wemo/cache/devicelist/runnable/ResetFNIconRulesRunnable;->udn:Ljava/lang/String;

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v14

    invoke-static {v13, v14}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 53
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/belkin/wemo/cache/devicelist/runnable/ResetFNIconRulesRunnable;->mDeviceListManager:Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/belkin/wemo/cache/devicelist/runnable/ResetFNIconRulesRunnable;->udn:Ljava/lang/String;

    invoke-virtual {v13, v14}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->isZigbee(Ljava/lang/String;)Z

    move-result v13

    if-eqz v13, :cond_4

    .line 54
    new-instance v12, Lorg/json/JSONArray;

    invoke-direct {v12}, Lorg/json/JSONArray;-><init>()V

    .line 55
    .local v12, "setFNParams":Lorg/json/JSONArray;
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/belkin/wemo/cache/devicelist/runnable/ResetFNIconRulesRunnable;->udn:Ljava/lang/String;

    invoke-virtual {v12, v13}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;

    .line 56
    invoke-virtual {v12, v7}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;

    .line 57
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/belkin/wemo/cache/devicelist/runnable/ResetFNIconRulesRunnable;->mDeviceListManager:Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    invoke-virtual {v13, v12}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->setLedFriendlyName(Lorg/json/JSONArray;)Lorg/json/JSONArray;

    move-result-object v10

    .line 58
    .local v10, "response":Lorg/json/JSONArray;
    const-string v13, "ResetFNIconRulesRunnable"

    new-instance v14, Ljava/lang/StringBuilder;

    invoke-direct {v14}, Ljava/lang/StringBuilder;-><init>()V

    const-string v15, "jsonStatus :"

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v10}, Lorg/json/JSONArray;->toString()Ljava/lang/String;

    move-result-object v15

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v14

    invoke-static {v13, v14}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 59
    invoke-virtual {v10}, Lorg/json/JSONArray;->length()I

    move-result v13

    if-eqz v13, :cond_1

    const/4 v13, 0x0

    invoke-virtual {v10, v13}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v13

    if-eqz v13, :cond_1

    .line 60
    const/4 v13, 0x0

    invoke-virtual {v10, v13}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v13

    const-string v14, "GetFriendlyNameResponse"

    invoke-virtual {v13, v14}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v13

    if-eqz v13, :cond_1

    const/4 v13, 0x0

    invoke-virtual {v10, v13}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v13

    const-string v14, "GetFriendlyNameResponse"

    invoke-virtual {v13, v14}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v13

    const-string v14, "1"

    invoke-virtual {v13, v14}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v13

    if-eqz v13, :cond_1

    .line 63
    new-instance v6, Ljava/io/File;

    invoke-virtual {v4}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getIcon()Ljava/lang/String;

    move-result-object v13

    invoke-direct {v6, v13}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 64
    .local v6, "file":Ljava/io/File;
    invoke-virtual {v6}, Ljava/io/File;->exists()Z

    move-result v13

    if-eqz v13, :cond_0

    .line 65
    invoke-virtual {v6}, Ljava/io/File;->delete()Z

    .line 67
    :cond_0
    invoke-virtual {v4, v7}, Lcom/belkin/wemo/cache/data/DeviceInformation;->setFriendlyName(Ljava/lang/String;)V

    .line 69
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/belkin/wemo/cache/devicelist/runnable/ResetFNIconRulesRunnable;->mDeviceListManager:Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/belkin/wemo/cache/devicelist/runnable/ResetFNIconRulesRunnable;->udn:Ljava/lang/String;

    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/belkin/wemo/cache/devicelist/runnable/ResetFNIconRulesRunnable;->deviceInformation:Lorg/json/JSONObject;

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/wemo/cache/devicelist/runnable/ResetFNIconRulesRunnable;->stateData:Lorg/json/JSONObject;

    move-object/from16 v16, v0

    invoke-virtual/range {v13 .. v16}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->setDeviceProperties(Ljava/lang/String;Lorg/json/JSONObject;Lorg/json/JSONObject;)V

    .line 70
    const-string v13, ""

    invoke-virtual {v4, v13}, Lcom/belkin/wemo/cache/data/DeviceInformation;->setIcon(Ljava/lang/String;)V

    .line 71
    const-string v13, ""

    invoke-virtual {v4, v13}, Lcom/belkin/wemo/cache/data/DeviceInformation;->setIconVersion(Ljava/lang/String;)V

    .line 72
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/belkin/wemo/cache/devicelist/runnable/ResetFNIconRulesRunnable;->mDeviceListManager:Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    const/4 v14, 0x0

    invoke-static {v14}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v14

    invoke-virtual {v13, v4, v14}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->updateDeviceCacheInDeviceList(Lcom/belkin/wemo/cache/data/DeviceInformation;Ljava/lang/Boolean;)V

    .line 73
    const-string v13, "ResetFNIconRulesRunnable"

    new-instance v14, Ljava/lang/StringBuilder;

    invoke-direct {v14}, Ljava/lang/StringBuilder;-><init>()V

    const-string v15, "successful resetFNIconRules udn:"

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/belkin/wemo/cache/devicelist/runnable/ResetFNIconRulesRunnable;->udn:Ljava/lang/String;

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    const-string v15, ", baseReset:"

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v14

    invoke-static {v13, v14}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 75
    const/4 v13, 0x1

    invoke-static {v13}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v8

    .line 97
    .end local v6    # "file":Ljava/io/File;
    .end local v10    # "response":Lorg/json/JSONArray;
    .end local v12    # "setFNParams":Lorg/json/JSONArray;
    :cond_1
    :goto_0
    const-string v13, "ResetFNIconRulesRunnable"

    new-instance v14, Ljava/lang/StringBuilder;

    invoke-direct {v14}, Ljava/lang/StringBuilder;-><init>()V

    const-string v15, "resetFNIconRules: After FN change during reset. IP: "

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v4}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getIP()Ljava/lang/String;

    move-result-object v15

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    const-string v15, "; Port: "

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v4}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getPort()I

    move-result v15

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v14

    invoke-static {v13, v14}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->debugLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 98
    invoke-virtual {v8}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v13

    if-eqz v13, :cond_2

    .line 99
    invoke-virtual {v4, v7}, Lcom/belkin/wemo/cache/data/DeviceInformation;->setFriendlyName(Ljava/lang/String;)V

    .line 100
    const-string v13, ""

    invoke-virtual {v4, v13}, Lcom/belkin/wemo/cache/data/DeviceInformation;->setIcon(Ljava/lang/String;)V

    .line 101
    const-string v13, ""

    invoke-virtual {v4, v13}, Lcom/belkin/wemo/cache/data/DeviceInformation;->setIconVersion(Ljava/lang/String;)V

    .line 102
    const/4 v13, 0x1

    invoke-virtual {v4, v13}, Lcom/belkin/wemo/cache/data/DeviceInformation;->setIsDiscovered(Z)V

    .line 103
    const/4 v13, 0x0

    invoke-virtual {v4, v13}, Lcom/belkin/wemo/cache/data/DeviceInformation;->setInActive(I)V

    .line 104
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/belkin/wemo/cache/devicelist/runnable/ResetFNIconRulesRunnable;->mDeviceListManager:Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    invoke-virtual {v13, v4}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->updateDeviceCache(Lcom/belkin/wemo/cache/data/DeviceInformation;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 115
    .end local v3    # "controlPoint":Lorg/cybergarage/upnp/ControlPoint;
    .end local v4    # "dev":Lcom/belkin/wemo/cache/data/DeviceInformation;
    .end local v7    # "friendlyName":Ljava/lang/String;
    :cond_2
    :goto_1
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/belkin/wemo/cache/devicelist/runnable/ResetFNIconRulesRunnable;->latch:Ljava/util/concurrent/CountDownLatch;

    if-eqz v13, :cond_3

    .line 116
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/belkin/wemo/cache/devicelist/runnable/ResetFNIconRulesRunnable;->latch:Ljava/util/concurrent/CountDownLatch;

    invoke-virtual {v13}, Ljava/util/concurrent/CountDownLatch;->countDown()V

    .line 118
    :cond_3
    return-void

    .line 80
    .restart local v3    # "controlPoint":Lorg/cybergarage/upnp/ControlPoint;
    .restart local v4    # "dev":Lcom/belkin/wemo/cache/data/DeviceInformation;
    .restart local v7    # "friendlyName":Ljava/lang/String;
    :cond_4
    :try_start_1
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/belkin/wemo/cache/devicelist/runnable/ResetFNIconRulesRunnable;->udn:Ljava/lang/String;

    invoke-virtual {v3, v13}, Lorg/cybergarage/upnp/ControlPoint;->getDevice(Ljava/lang/String;)Lorg/cybergarage/upnp/Device;

    move-result-object v9

    .line 81
    .local v9, "localDevice":Lorg/cybergarage/upnp/Device;
    const-string v13, "ReSetup"

    invoke-virtual {v9, v13}, Lorg/cybergarage/upnp/Device;->getAction(Ljava/lang/String;)Lorg/cybergarage/upnp/Action;

    move-result-object v1

    .line 82
    .local v1, "action":Lorg/cybergarage/upnp/Action;
    const-string v13, "Reset"

    const-string v14, "1"

    invoke-virtual {v1, v13, v14}, Lorg/cybergarage/upnp/Action;->setArgumentValue(Ljava/lang/String;Ljava/lang/String;)V

    .line 83
    invoke-virtual {v1}, Lorg/cybergarage/upnp/Action;->postControlAction()Ljava/lang/String;

    move-result-object v10

    .line 84
    .local v10, "response":Ljava/lang/String;
    const-string v13, "ResetFNIconRulesRunnable"

    new-instance v14, Ljava/lang/StringBuilder;

    invoke-direct {v14}, Ljava/lang/StringBuilder;-><init>()V

    const-string v15, "clearNameIconRule response: "

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v14

    invoke-static {v13, v14}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 87
    const-string v13, "ChangeFriendlyName"

    invoke-virtual {v9, v13}, Lorg/cybergarage/upnp/Device;->getAction(Ljava/lang/String;)Lorg/cybergarage/upnp/Action;

    move-result-object v2

    .line 88
    .local v2, "actionFN":Lorg/cybergarage/upnp/Action;
    const-string v13, "FriendlyName"

    invoke-virtual {v2, v13, v7}, Lorg/cybergarage/upnp/Action;->setArgumentValue(Ljava/lang/String;Ljava/lang/String;)V

    .line 89
    invoke-virtual {v2}, Lorg/cybergarage/upnp/Action;->postControlAction()Ljava/lang/String;

    move-result-object v11

    .line 90
    .local v11, "responseFN":Ljava/lang/String;
    const-string v13, "ResetFNIconRulesRunnable"

    new-instance v14, Ljava/lang/StringBuilder;

    invoke-direct {v14}, Ljava/lang/StringBuilder;-><init>()V

    const-string v15, "resetFNIconRules: Friendly Name set to default in FW. Response: "

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v14

    invoke-static {v13, v14}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->debugLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 92
    invoke-static {v10}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v13

    if-nez v13, :cond_1

    sget-object v13, Lcom/belkin/wemo/cache/devicelist/UpnpConstants;->ERROR:Ljava/lang/String;

    invoke-virtual {v10, v13}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v13

    if-nez v13, :cond_1

    invoke-static {v11}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v13

    if-nez v13, :cond_1

    sget-object v13, Lcom/belkin/wemo/cache/devicelist/UpnpConstants;->ERROR:Ljava/lang/String;

    invoke-virtual {v11, v13}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v13

    if-nez v13, :cond_1

    .line 93
    const/4 v13, 0x1

    invoke-static {v13}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v8

    goto/16 :goto_0

    .line 107
    .end local v1    # "action":Lorg/cybergarage/upnp/Action;
    .end local v2    # "actionFN":Lorg/cybergarage/upnp/Action;
    .end local v7    # "friendlyName":Ljava/lang/String;
    .end local v9    # "localDevice":Lorg/cybergarage/upnp/Device;
    .end local v10    # "response":Ljava/lang/String;
    .end local v11    # "responseFN":Ljava/lang/String;
    :cond_5
    const-string v13, "ResetFNIconRulesRunnable"

    new-instance v14, Ljava/lang/StringBuilder;

    invoke-direct {v14}, Ljava/lang/StringBuilder;-><init>()V

    const-string v15, "NO device found in cache.db with UDN: "

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/belkin/wemo/cache/devicelist/runnable/ResetFNIconRulesRunnable;->udn:Ljava/lang/String;

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v14

    invoke-static {v13, v14}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    goto/16 :goto_1

    .line 110
    .end local v3    # "controlPoint":Lorg/cybergarage/upnp/ControlPoint;
    .end local v4    # "dev":Lcom/belkin/wemo/cache/data/DeviceInformation;
    :catch_0
    move-exception v5

    .line 111
    .local v5, "ex":Ljava/lang/Exception;
    const-string v13, "ResetFNIconRulesRunnable"

    const-string v14, "Exception in resetFNIconRules:"

    invoke-static {v13, v14, v5}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Exception;)V

    goto/16 :goto_1
.end method
