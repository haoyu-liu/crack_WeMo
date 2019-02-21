.class public Lcom/belkin/wemo/cache/devicelist/runnable/SetDevicePropertiesRunnable;
.super Lcom/belkin/wemo/runnable/WeMoRunnable;
.source "SetDevicePropertiesRunnable.java"


# instance fields
.field private context:Landroid/content/Context;

.field private devListManager:Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

.field private deviceInfoList:Lorg/json/JSONObject;

.field private isZigbee:Ljava/lang/Boolean;

.field private mDeviceInfo:Lcom/belkin/wemo/cache/data/DeviceInformation;

.field private propertyList:Lorg/json/JSONObject;

.field private udn:Ljava/lang/String;


# direct methods
.method public constructor <init>(Landroid/content/Context;Ljava/lang/String;Lorg/json/JSONObject;Lorg/json/JSONObject;)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "udn"    # Ljava/lang/String;
    .param p3, "propertyList"    # Lorg/json/JSONObject;
    .param p4, "deviceInfoList"    # Lorg/json/JSONObject;

    .prologue
    const/4 v0, 0x0

    .line 34
    invoke-direct {p0}, Lcom/belkin/wemo/runnable/WeMoRunnable;-><init>()V

    .line 27
    iput-object v0, p0, Lcom/belkin/wemo/cache/devicelist/runnable/SetDevicePropertiesRunnable;->propertyList:Lorg/json/JSONObject;

    .line 28
    iput-object v0, p0, Lcom/belkin/wemo/cache/devicelist/runnable/SetDevicePropertiesRunnable;->deviceInfoList:Lorg/json/JSONObject;

    .line 29
    const/4 v0, 0x0

    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    iput-object v0, p0, Lcom/belkin/wemo/cache/devicelist/runnable/SetDevicePropertiesRunnable;->isZigbee:Ljava/lang/Boolean;

    .line 35
    invoke-static {p1}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->getInstance(Landroid/content/Context;)Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    move-result-object v0

    iput-object v0, p0, Lcom/belkin/wemo/cache/devicelist/runnable/SetDevicePropertiesRunnable;->devListManager:Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    .line 36
    iput-object p1, p0, Lcom/belkin/wemo/cache/devicelist/runnable/SetDevicePropertiesRunnable;->context:Landroid/content/Context;

    .line 37
    iput-object p3, p0, Lcom/belkin/wemo/cache/devicelist/runnable/SetDevicePropertiesRunnable;->propertyList:Lorg/json/JSONObject;

    .line 38
    iput-object p4, p0, Lcom/belkin/wemo/cache/devicelist/runnable/SetDevicePropertiesRunnable;->deviceInfoList:Lorg/json/JSONObject;

    .line 39
    iput-object p2, p0, Lcom/belkin/wemo/cache/devicelist/runnable/SetDevicePropertiesRunnable;->udn:Ljava/lang/String;

    .line 40
    return-void
.end method


# virtual methods
.method public run()V
    .locals 17

    .prologue
    .line 44
    const/4 v12, 0x0

    invoke-static {v12}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v10

    .line 46
    .local v10, "result":Ljava/lang/Boolean;
    move-object/from16 v0, p0

    iget-object v12, v0, Lcom/belkin/wemo/cache/devicelist/runnable/SetDevicePropertiesRunnable;->context:Landroid/content/Context;

    invoke-static {v12}, Lcom/belkin/wemo/cache/data/DevicesArray;->getInstance(Landroid/content/Context;)Lcom/belkin/wemo/cache/data/DevicesArray;

    move-result-object v12

    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/belkin/wemo/cache/devicelist/runnable/SetDevicePropertiesRunnable;->udn:Ljava/lang/String;

    invoke-virtual {v12, v13}, Lcom/belkin/wemo/cache/data/DevicesArray;->getDeviceInformation(Ljava/lang/String;)Lcom/belkin/wemo/cache/data/DeviceInformation;

    move-result-object v12

    move-object/from16 v0, p0

    iput-object v12, v0, Lcom/belkin/wemo/cache/devicelist/runnable/SetDevicePropertiesRunnable;->mDeviceInfo:Lcom/belkin/wemo/cache/data/DeviceInformation;

    .line 48
    move-object/from16 v0, p0

    iget-object v12, v0, Lcom/belkin/wemo/cache/devicelist/runnable/SetDevicePropertiesRunnable;->mDeviceInfo:Lcom/belkin/wemo/cache/data/DeviceInformation;

    if-eqz v12, :cond_8

    move-object/from16 v0, p0

    iget-object v12, v0, Lcom/belkin/wemo/cache/devicelist/runnable/SetDevicePropertiesRunnable;->propertyList:Lorg/json/JSONObject;

    if-eqz v12, :cond_8

    move-object/from16 v0, p0

    iget-object v12, v0, Lcom/belkin/wemo/cache/devicelist/runnable/SetDevicePropertiesRunnable;->deviceInfoList:Lorg/json/JSONObject;

    if-eqz v12, :cond_8

    .line 49
    move-object/from16 v0, p0

    iget-object v12, v0, Lcom/belkin/wemo/cache/devicelist/runnable/SetDevicePropertiesRunnable;->mDeviceInfo:Lcom/belkin/wemo/cache/data/DeviceInformation;

    invoke-virtual {v12}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getBridgeUDN()Ljava/lang/String;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/String;->isEmpty()Z

    move-result v12

    if-nez v12, :cond_0

    .line 50
    const/4 v12, 0x1

    invoke-static {v12}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v12

    move-object/from16 v0, p0

    iput-object v12, v0, Lcom/belkin/wemo/cache/devicelist/runnable/SetDevicePropertiesRunnable;->isZigbee:Ljava/lang/Boolean;

    .line 53
    :cond_0
    :try_start_0
    move-object/from16 v0, p0

    iget-object v12, v0, Lcom/belkin/wemo/cache/devicelist/runnable/SetDevicePropertiesRunnable;->devListManager:Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    invoke-virtual {v12}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->getUpnpControl()Lorg/cybergarage/upnp/ControlPoint;

    move-result-object v2

    .line 54
    .local v2, "controlPoint":Lorg/cybergarage/upnp/ControlPoint;
    move-object/from16 v0, p0

    iget-object v12, v0, Lcom/belkin/wemo/cache/devicelist/runnable/SetDevicePropertiesRunnable;->propertyList:Lorg/json/JSONObject;

    const-string v13, "friendlyName"

    invoke-virtual {v12, v13}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v11

    .line 56
    .local v11, "sFriendlyName":Ljava/lang/String;
    move-object/from16 v0, p0

    iget-object v12, v0, Lcom/belkin/wemo/cache/devicelist/runnable/SetDevicePropertiesRunnable;->isZigbee:Ljava/lang/Boolean;

    invoke-virtual {v12}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v12

    if-eqz v12, :cond_7

    .line 57
    const-string v7, ""

    .line 58
    .local v7, "mBridgeUdn":Ljava/lang/String;
    if-eqz v2, :cond_3

    .line 59
    const/4 v5, 0x0

    .local v5, "i":I
    :goto_0
    invoke-virtual {v2}, Lorg/cybergarage/upnp/ControlPoint;->getDeviceList()Lorg/cybergarage/upnp/DeviceList;

    move-result-object v12

    invoke-virtual {v12}, Lorg/cybergarage/upnp/DeviceList;->size()I

    move-result v12

    if-ge v5, v12, :cond_2

    .line 60
    invoke-virtual {v2}, Lorg/cybergarage/upnp/ControlPoint;->getDeviceList()Lorg/cybergarage/upnp/DeviceList;

    move-result-object v12

    invoke-virtual {v12, v5}, Lorg/cybergarage/upnp/DeviceList;->getDevice(I)Lorg/cybergarage/upnp/Device;

    move-result-object v12

    invoke-virtual {v12}, Lorg/cybergarage/upnp/Device;->getUDN()Ljava/lang/String;

    move-result-object v12

    const-string v13, "Bridge"

    invoke-virtual {v12, v13}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v12

    if-eqz v12, :cond_1

    .line 61
    invoke-virtual {v2}, Lorg/cybergarage/upnp/ControlPoint;->getDeviceList()Lorg/cybergarage/upnp/DeviceList;

    move-result-object v12

    invoke-virtual {v12, v5}, Lorg/cybergarage/upnp/DeviceList;->getDevice(I)Lorg/cybergarage/upnp/Device;

    move-result-object v12

    invoke-virtual {v12}, Lorg/cybergarage/upnp/Device;->getUDN()Ljava/lang/String;

    move-result-object v7

    .line 59
    :cond_1
    add-int/lit8 v5, v5, 0x1

    goto :goto_0

    .line 64
    :cond_2
    move-object/from16 v0, p0

    iget-object v12, v0, Lcom/belkin/wemo/cache/devicelist/runnable/SetDevicePropertiesRunnable;->TAG:Ljava/lang/String;

    new-instance v13, Ljava/lang/StringBuilder;

    invoke-direct {v13}, Ljava/lang/StringBuilder;-><init>()V

    const-string v14, "bridge udn if:---"

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v2}, Lorg/cybergarage/upnp/ControlPoint;->getDeviceList()Lorg/cybergarage/upnp/DeviceList;

    move-result-object v14

    invoke-virtual {v14}, Lorg/cybergarage/upnp/DeviceList;->size()I

    move-result v14

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v13

    const-string v14, "--"

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v13

    invoke-static {v12, v13}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->debugLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 65
    move-object/from16 v0, p0

    iget-object v12, v0, Lcom/belkin/wemo/cache/devicelist/runnable/SetDevicePropertiesRunnable;->TAG:Ljava/lang/String;

    new-instance v13, Ljava/lang/StringBuilder;

    invoke-direct {v13}, Ljava/lang/StringBuilder;-><init>()V

    const-string v14, "deviceInformation: "

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/belkin/wemo/cache/devicelist/runnable/SetDevicePropertiesRunnable;->mDeviceInfo:Lcom/belkin/wemo/cache/data/DeviceInformation;

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v13

    invoke-static {v12, v13}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->debugLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 67
    .end local v5    # "i":I
    :cond_3
    if-eqz v7, :cond_4

    .line 68
    invoke-virtual {v2, v7}, Lorg/cybergarage/upnp/ControlPoint;->getDevice(Ljava/lang/String;)Lorg/cybergarage/upnp/Device;

    move-result-object v12

    const-string v13, "SetDeviceName"

    invoke-virtual {v12, v13}, Lorg/cybergarage/upnp/Device;->getAction(Ljava/lang/String;)Lorg/cybergarage/upnp/Action;

    move-result-object v1

    .line 69
    .local v1, "action":Lorg/cybergarage/upnp/Action;
    move-object/from16 v0, p0

    iget-object v12, v0, Lcom/belkin/wemo/cache/devicelist/runnable/SetDevicePropertiesRunnable;->TAG:Ljava/lang/String;

    new-instance v13, Ljava/lang/StringBuilder;

    invoke-direct {v13}, Ljava/lang/StringBuilder;-><init>()V

    const-string v14, "udn sent to setArgument: "

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/belkin/wemo/cache/devicelist/runnable/SetDevicePropertiesRunnable;->udn:Ljava/lang/String;

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v13

    invoke-static {v12, v13}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 70
    move-object/from16 v0, p0

    iget-object v12, v0, Lcom/belkin/wemo/cache/devicelist/runnable/SetDevicePropertiesRunnable;->devListManager:Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    sget-object v13, Lcom/belkin/wemo/cache/devicelist/UpnpConstants;->ARGS_LED_FRIENDLY_NAME:[Ljava/lang/String;

    const/4 v14, 0x2

    new-array v14, v14, [Ljava/lang/String;

    const/4 v15, 0x0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/wemo/cache/devicelist/runnable/SetDevicePropertiesRunnable;->udn:Ljava/lang/String;

    move-object/from16 v16, v0

    aput-object v16, v14, v15

    const/4 v15, 0x1

    aput-object v11, v14, v15

    invoke-virtual {v12, v1, v13, v14}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->setArgument(Lorg/cybergarage/upnp/Action;[Ljava/lang/String;[Ljava/lang/String;)V

    .line 71
    invoke-virtual {v1}, Lorg/cybergarage/upnp/Action;->postControlAction()Ljava/lang/String;

    move-result-object v9

    .line 72
    .local v9, "response":Ljava/lang/String;
    move-object/from16 v0, p0

    iget-object v12, v0, Lcom/belkin/wemo/cache/devicelist/runnable/SetDevicePropertiesRunnable;->TAG:Ljava/lang/String;

    new-instance v13, Ljava/lang/StringBuilder;

    invoke-direct {v13}, Ljava/lang/StringBuilder;-><init>()V

    const-string v14, "set friendly name: "

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v13

    invoke-static {v12, v13}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->debugLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 73
    if-eqz v9, :cond_6

    .line 74
    new-instance v3, Lcom/belkin/wemo/cache/utils/GetCreateGroupResponseParser;

    invoke-direct {v3}, Lcom/belkin/wemo/cache/utils/GetCreateGroupResponseParser;-><init>()V

    .line 75
    .local v3, "createGroupResponse":Lcom/belkin/wemo/cache/utils/GetCreateGroupResponseParser;
    invoke-virtual {v3, v9}, Lcom/belkin/wemo/cache/utils/GetCreateGroupResponseParser;->parseCreateGroupResponse(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v6

    .line 76
    .local v6, "jsonStatus":Lorg/json/JSONArray;
    move-object/from16 v0, p0

    iget-object v12, v0, Lcom/belkin/wemo/cache/devicelist/runnable/SetDevicePropertiesRunnable;->TAG:Ljava/lang/String;

    new-instance v13, Ljava/lang/StringBuilder;

    invoke-direct {v13}, Ljava/lang/StringBuilder;-><init>()V

    const-string v14, "jsonStatus :"

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v13

    const-string v14, "jsonStatus.getJSONObject(0).getString(\"GetFriendlyNameResponse\") :"

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    const/4 v14, 0x0

    invoke-virtual {v6, v14}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v14

    const-string v15, "GetFriendlyNameResponse"

    invoke-virtual {v14, v15}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v14

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v13

    invoke-static {v12, v13}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 79
    const/4 v12, 0x0

    invoke-virtual {v6, v12}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v12

    if-eqz v12, :cond_4

    const/4 v12, 0x0

    invoke-virtual {v6, v12}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v12

    const-string v13, "GetFriendlyNameResponse"

    invoke-virtual {v12, v13}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v12

    if-eqz v12, :cond_4

    .line 80
    const/4 v12, 0x0

    invoke-virtual {v6, v12}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v12

    const-string v13, "GetFriendlyNameResponse"

    invoke-virtual {v12, v13}, Lorg/json/JSONObject;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v12

    const-string v13, "1"

    invoke-virtual {v12, v13}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v12

    if-eqz v12, :cond_4

    .line 82
    move-object/from16 v0, p0

    iget-object v12, v0, Lcom/belkin/wemo/cache/devicelist/runnable/SetDevicePropertiesRunnable;->TAG:Ljava/lang/String;

    new-instance v13, Ljava/lang/StringBuilder;

    invoke-direct {v13}, Ljava/lang/StringBuilder;-><init>()V

    const-string v14, "Updating friendly name in cache for udn:"

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/belkin/wemo/cache/devicelist/runnable/SetDevicePropertiesRunnable;->udn:Ljava/lang/String;

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v13

    invoke-static {v12, v13}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 83
    move-object/from16 v0, p0

    iget-object v12, v0, Lcom/belkin/wemo/cache/devicelist/runnable/SetDevicePropertiesRunnable;->mDeviceInfo:Lcom/belkin/wemo/cache/data/DeviceInformation;

    invoke-virtual {v12, v11}, Lcom/belkin/wemo/cache/data/DeviceInformation;->setFriendlyName(Ljava/lang/String;)V

    .line 84
    const/4 v12, 0x1

    invoke-static {v12}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v10

    .line 108
    .end local v1    # "action":Lorg/cybergarage/upnp/Action;
    .end local v2    # "controlPoint":Lorg/cybergarage/upnp/ControlPoint;
    .end local v3    # "createGroupResponse":Lcom/belkin/wemo/cache/utils/GetCreateGroupResponseParser;
    .end local v6    # "jsonStatus":Lorg/json/JSONArray;
    .end local v7    # "mBridgeUdn":Ljava/lang/String;
    .end local v9    # "response":Ljava/lang/String;
    .end local v11    # "sFriendlyName":Ljava/lang/String;
    :cond_4
    :goto_1
    invoke-virtual {v10}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v12

    const/4 v13, 0x1

    if-ne v12, v13, :cond_5

    .line 110
    move-object/from16 v0, p0

    iget-object v12, v0, Lcom/belkin/wemo/cache/devicelist/runnable/SetDevicePropertiesRunnable;->context:Landroid/content/Context;

    invoke-static {v12}, Lcom/belkin/wemo/cache/data/DevicesArray;->getInstance(Landroid/content/Context;)Lcom/belkin/wemo/cache/data/DevicesArray;

    move-result-object v12

    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/belkin/wemo/cache/devicelist/runnable/SetDevicePropertiesRunnable;->mDeviceInfo:Lcom/belkin/wemo/cache/data/DeviceInformation;

    const/4 v14, 0x0

    invoke-virtual {v12, v13, v14}, Lcom/belkin/wemo/cache/data/DevicesArray;->updateDeviceCache(Lcom/belkin/wemo/cache/data/DeviceInformation;Z)V

    .line 111
    move-object/from16 v0, p0

    iget-object v12, v0, Lcom/belkin/wemo/cache/devicelist/runnable/SetDevicePropertiesRunnable;->context:Landroid/content/Context;

    invoke-static {v12}, Lcom/belkin/wemo/cache/CacheManager;->getInstance(Landroid/content/Context;)Lcom/belkin/wemo/cache/CacheManager;

    move-result-object v12

    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/belkin/wemo/cache/devicelist/runnable/SetDevicePropertiesRunnable;->mDeviceInfo:Lcom/belkin/wemo/cache/data/DeviceInformation;

    const/4 v14, 0x0

    const/4 v15, 0x0

    const/16 v16, 0x1

    invoke-virtual/range {v12 .. v16}, Lcom/belkin/wemo/cache/CacheManager;->updateDB(Lcom/belkin/wemo/cache/data/DeviceInformation;ZZZ)V

    .line 113
    :cond_5
    move-object/from16 v0, p0

    iget-object v12, v0, Lcom/belkin/wemo/cache/devicelist/runnable/SetDevicePropertiesRunnable;->devListManager:Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/belkin/wemo/cache/devicelist/runnable/SetDevicePropertiesRunnable;->devListManager:Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    const-string v13, "set_properties"

    invoke-virtual {v10}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v14

    invoke-static {v14}, Ljava/lang/Boolean;->toString(Z)Ljava/lang/String;

    move-result-object v14

    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/belkin/wemo/cache/devicelist/runnable/SetDevicePropertiesRunnable;->mDeviceInfo:Lcom/belkin/wemo/cache/data/DeviceInformation;

    invoke-virtual {v15}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getUDN()Ljava/lang/String;

    move-result-object v15

    invoke-virtual {v12, v13, v14, v15}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->sendNotification(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 114
    return-void

    .line 88
    .restart local v1    # "action":Lorg/cybergarage/upnp/Action;
    .restart local v2    # "controlPoint":Lorg/cybergarage/upnp/ControlPoint;
    .restart local v7    # "mBridgeUdn":Ljava/lang/String;
    .restart local v9    # "response":Ljava/lang/String;
    .restart local v11    # "sFriendlyName":Ljava/lang/String;
    :cond_6
    :try_start_1
    move-object/from16 v0, p0

    iget-object v12, v0, Lcom/belkin/wemo/cache/devicelist/runnable/SetDevicePropertiesRunnable;->TAG:Ljava/lang/String;

    new-instance v13, Ljava/lang/StringBuilder;

    invoke-direct {v13}, Ljava/lang/StringBuilder;-><init>()V

    const-string v14, "Error setting friendlyName Zigbee, response: "

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v13

    invoke-static {v12, v13}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 89
    const/4 v12, 0x0

    invoke-static {v12}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v10

    goto :goto_1

    .line 94
    .end local v1    # "action":Lorg/cybergarage/upnp/Action;
    .end local v7    # "mBridgeUdn":Ljava/lang/String;
    .end local v9    # "response":Ljava/lang/String;
    :cond_7
    new-instance v8, Lcom/belkin/wemo/cache/devicelist/DLMGetActionResult;

    move-object/from16 v0, p0

    iget-object v12, v0, Lcom/belkin/wemo/cache/devicelist/runnable/SetDevicePropertiesRunnable;->devListManager:Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    invoke-direct {v8, v12}, Lcom/belkin/wemo/cache/devicelist/DLMGetActionResult;-><init>(Lcom/belkin/wemo/cache/devicelist/DeviceListManager;)V

    .line 95
    .local v8, "oGetAction":Lcom/belkin/wemo/cache/devicelist/DLMGetActionResult;
    const/4 v12, 0x4

    new-array v12, v12, [Ljava/lang/Object;

    const/4 v13, 0x0

    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/belkin/wemo/cache/devicelist/runnable/SetDevicePropertiesRunnable;->udn:Ljava/lang/String;

    aput-object v14, v12, v13

    const/4 v13, 0x1

    const-string v14, "ChangeFriendlyName"

    aput-object v14, v12, v13

    const/4 v13, 0x2

    sget-object v14, Lcom/belkin/wemo/cache/devicelist/UpnpConstants;->SET_FRIENDLY_NAME_ARGS_KEYS:[Ljava/lang/String;

    aput-object v14, v12, v13

    const/4 v13, 0x3

    const/4 v14, 0x1

    new-array v14, v14, [Ljava/lang/String;

    const/4 v15, 0x0

    aput-object v11, v14, v15

    aput-object v14, v12, v13

    invoke-virtual {v8, v12}, Lcom/belkin/wemo/cache/devicelist/DLMGetActionResult;->doInBackground([Ljava/lang/Object;)Ljava/lang/Boolean;

    move-result-object v10

    .line 96
    invoke-virtual {v10}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v12

    if-eqz v12, :cond_4

    .line 97
    move-object/from16 v0, p0

    iget-object v12, v0, Lcom/belkin/wemo/cache/devicelist/runnable/SetDevicePropertiesRunnable;->mDeviceInfo:Lcom/belkin/wemo/cache/data/DeviceInformation;

    invoke-virtual {v12, v11}, Lcom/belkin/wemo/cache/data/DeviceInformation;->setFriendlyName(Ljava/lang/String;)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    goto/16 :goto_1

    .line 100
    .end local v2    # "controlPoint":Lorg/cybergarage/upnp/ControlPoint;
    .end local v8    # "oGetAction":Lcom/belkin/wemo/cache/devicelist/DLMGetActionResult;
    .end local v11    # "sFriendlyName":Ljava/lang/String;
    :catch_0
    move-exception v4

    .line 101
    .local v4, "e":Ljava/lang/Exception;
    move-object/from16 v0, p0

    iget-object v12, v0, Lcom/belkin/wemo/cache/devicelist/runnable/SetDevicePropertiesRunnable;->TAG:Ljava/lang/String;

    const-string v13, "Error setting friendlyName Zigbee"

    invoke-static {v12, v13, v4}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Exception;)V

    goto/16 :goto_1

    .line 105
    .end local v4    # "e":Ljava/lang/Exception;
    :cond_8
    const/4 v12, 0x0

    invoke-static {v12}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v10

    goto/16 :goto_1
.end method
