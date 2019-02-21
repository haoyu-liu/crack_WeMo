.class public Lcom/belkin/wemo/cache/devicelist/DLMSetFriendlyName;
.super Landroid/os/AsyncTask;
.source "DLMSetFriendlyName.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroid/os/AsyncTask",
        "<",
        "Ljava/lang/Object;",
        "Ljava/lang/Void;",
        "Ljava/lang/Boolean;",
        ">;"
    }
.end annotation


# static fields
.field private static final TAG:Ljava/lang/String; = "DLMSetFriendlyName"


# instance fields
.field private mDLM:Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

.field private mDeviceInfo:Lcom/belkin/wemo/cache/data/DeviceInformation;

.field private notifType:Ljava/lang/String;

.field private propertyList:Lorg/json/JSONObject;


# direct methods
.method public varargs constructor <init>(Lcom/belkin/wemo/cache/devicelist/DeviceListManager;[Ljava/lang/String;)V
    .locals 1
    .param p1, "oDLM"    # Lcom/belkin/wemo/cache/devicelist/DeviceListManager;
    .param p2, "notificationType"    # [Ljava/lang/String;

    .prologue
    const/4 v0, 0x0

    .line 25
    invoke-direct {p0}, Landroid/os/AsyncTask;-><init>()V

    .line 20
    iput-object v0, p0, Lcom/belkin/wemo/cache/devicelist/DLMSetFriendlyName;->notifType:Ljava/lang/String;

    .line 22
    iput-object v0, p0, Lcom/belkin/wemo/cache/devicelist/DLMSetFriendlyName;->propertyList:Lorg/json/JSONObject;

    .line 26
    iput-object p1, p0, Lcom/belkin/wemo/cache/devicelist/DLMSetFriendlyName;->mDLM:Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    .line 27
    if-eqz p2, :cond_0

    .line 28
    array-length v0, p2

    if-lez v0, :cond_0

    .line 29
    const/4 v0, 0x0

    aget-object v0, p2, v0

    iput-object v0, p0, Lcom/belkin/wemo/cache/devicelist/DLMSetFriendlyName;->notifType:Ljava/lang/String;

    .line 33
    :cond_0
    return-void
.end method


# virtual methods
.method protected varargs doInBackground([Ljava/lang/Object;)Ljava/lang/Boolean;
    .locals 17
    .param p1, "params"    # [Ljava/lang/Object;

    .prologue
    .line 37
    const/4 v13, 0x0

    invoke-static {v13}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v10

    .line 38
    .local v10, "result":Ljava/lang/Boolean;
    const-string v12, "-1"

    .line 41
    .local v12, "udn":Ljava/lang/String;
    const/4 v13, 0x0

    :try_start_0
    aget-object v13, p1, v13

    move-object v0, v13

    check-cast v0, Ljava/lang/String;

    move-object v12, v0

    .line 42
    const/4 v13, 0x1

    aget-object v13, p1, v13

    check-cast v13, Lorg/json/JSONObject;

    move-object/from16 v0, p0

    iput-object v13, v0, Lcom/belkin/wemo/cache/devicelist/DLMSetFriendlyName;->propertyList:Lorg/json/JSONObject;

    .line 43
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/belkin/wemo/cache/devicelist/DLMSetFriendlyName;->mDLM:Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    invoke-virtual {v13, v12}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->getDevice(Ljava/lang/String;)Lcom/belkin/wemo/cache/data/DeviceInformation;

    move-result-object v8

    .line 44
    .local v8, "mDeviceInfo":Lcom/belkin/wemo/cache/data/DeviceInformation;
    if-eqz v8, :cond_3

    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/belkin/wemo/cache/devicelist/DLMSetFriendlyName;->propertyList:Lorg/json/JSONObject;

    if-eqz v13, :cond_3

    .line 45
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/belkin/wemo/cache/devicelist/DLMSetFriendlyName;->mDLM:Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    invoke-virtual {v13}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->getUpnpControl()Lorg/cybergarage/upnp/ControlPoint;

    move-result-object v2

    .line 46
    .local v2, "controlPoint":Lorg/cybergarage/upnp/ControlPoint;
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/belkin/wemo/cache/devicelist/DLMSetFriendlyName;->propertyList:Lorg/json/JSONObject;

    const-string v14, "friendlyName"

    invoke-virtual {v13, v14}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v11

    .line 48
    .local v11, "sFriendlyName":Ljava/lang/String;
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/belkin/wemo/cache/devicelist/DLMSetFriendlyName;->mDLM:Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    invoke-virtual {v13, v12}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->isZigbee(Ljava/lang/String;)Z

    move-result v13

    if-eqz v13, :cond_7

    .line 49
    const-string v7, ""

    .line 50
    .local v7, "mBridgeUdn":Ljava/lang/String;
    if-eqz v2, :cond_2

    .line 51
    const/4 v5, 0x0

    .local v5, "i":I
    :goto_0
    invoke-virtual {v2}, Lorg/cybergarage/upnp/ControlPoint;->getDeviceList()Lorg/cybergarage/upnp/DeviceList;

    move-result-object v13

    invoke-virtual {v13}, Lorg/cybergarage/upnp/DeviceList;->size()I

    move-result v13

    if-ge v5, v13, :cond_1

    .line 52
    invoke-virtual {v2}, Lorg/cybergarage/upnp/ControlPoint;->getDeviceList()Lorg/cybergarage/upnp/DeviceList;

    move-result-object v13

    invoke-virtual {v13, v5}, Lorg/cybergarage/upnp/DeviceList;->getDevice(I)Lorg/cybergarage/upnp/Device;

    move-result-object v13

    invoke-virtual {v13}, Lorg/cybergarage/upnp/Device;->getUDN()Ljava/lang/String;

    move-result-object v13

    const-string v14, "Bridge"

    invoke-virtual {v13, v14}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v13

    if-eqz v13, :cond_0

    .line 53
    invoke-virtual {v2}, Lorg/cybergarage/upnp/ControlPoint;->getDeviceList()Lorg/cybergarage/upnp/DeviceList;

    move-result-object v13

    invoke-virtual {v13, v5}, Lorg/cybergarage/upnp/DeviceList;->getDevice(I)Lorg/cybergarage/upnp/Device;

    move-result-object v13

    invoke-virtual {v13}, Lorg/cybergarage/upnp/Device;->getUDN()Ljava/lang/String;

    move-result-object v7

    .line 51
    :cond_0
    add-int/lit8 v5, v5, 0x1

    goto :goto_0

    .line 56
    :cond_1
    const-string v13, "DLMSetFriendlyName"

    new-instance v14, Ljava/lang/StringBuilder;

    invoke-direct {v14}, Ljava/lang/StringBuilder;-><init>()V

    const-string v15, "bridge udn if:---"

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v2}, Lorg/cybergarage/upnp/ControlPoint;->getDeviceList()Lorg/cybergarage/upnp/DeviceList;

    move-result-object v15

    invoke-virtual {v15}, Lorg/cybergarage/upnp/DeviceList;->size()I

    move-result v15

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v14

    const-string v15, "--"

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v14

    invoke-static {v13, v14}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->debugLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 57
    const-string v13, "DLMSetFriendlyName"

    new-instance v14, Ljava/lang/StringBuilder;

    invoke-direct {v14}, Ljava/lang/StringBuilder;-><init>()V

    const-string v15, "deviceInformation: "

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v14

    invoke-static {v13, v14}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->debugLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 59
    .end local v5    # "i":I
    :cond_2
    if-eqz v7, :cond_3

    .line 60
    invoke-virtual {v2, v7}, Lorg/cybergarage/upnp/ControlPoint;->getDevice(Ljava/lang/String;)Lorg/cybergarage/upnp/Device;

    move-result-object v13

    const-string v14, "SetDeviceName"

    invoke-virtual {v13, v14}, Lorg/cybergarage/upnp/Device;->getAction(Ljava/lang/String;)Lorg/cybergarage/upnp/Action;

    move-result-object v1

    .line 61
    .local v1, "action":Lorg/cybergarage/upnp/Action;
    const-string v13, "DLMSetFriendlyName"

    new-instance v14, Ljava/lang/StringBuilder;

    invoke-direct {v14}, Ljava/lang/StringBuilder;-><init>()V

    const-string v15, "udn sent to setArgument: "

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v14

    invoke-static {v13, v14}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 62
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/belkin/wemo/cache/devicelist/DLMSetFriendlyName;->mDLM:Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    sget-object v14, Lcom/belkin/wemo/cache/devicelist/UpnpConstants;->ARGS_LED_FRIENDLY_NAME:[Ljava/lang/String;

    const/4 v15, 0x2

    new-array v15, v15, [Ljava/lang/String;

    const/16 v16, 0x0

    aput-object v12, v15, v16

    const/16 v16, 0x1

    aput-object v11, v15, v16

    invoke-virtual {v13, v1, v14, v15}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->setArgument(Lorg/cybergarage/upnp/Action;[Ljava/lang/String;[Ljava/lang/String;)V

    .line 63
    invoke-virtual {v1}, Lorg/cybergarage/upnp/Action;->postControlAction()Ljava/lang/String;

    move-result-object v9

    .line 64
    .local v9, "response":Ljava/lang/String;
    const-string v13, "DLMSetFriendlyName"

    new-instance v14, Ljava/lang/StringBuilder;

    invoke-direct {v14}, Ljava/lang/StringBuilder;-><init>()V

    const-string v15, "set friendly name: "

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v14

    invoke-static {v13, v14}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->debugLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 65
    if-eqz v9, :cond_6

    .line 66
    new-instance v3, Lcom/belkin/wemo/cache/utils/GetCreateGroupResponseParser;

    invoke-direct {v3}, Lcom/belkin/wemo/cache/utils/GetCreateGroupResponseParser;-><init>()V

    .line 67
    .local v3, "createGroupResponse":Lcom/belkin/wemo/cache/utils/GetCreateGroupResponseParser;
    invoke-virtual {v3, v9}, Lcom/belkin/wemo/cache/utils/GetCreateGroupResponseParser;->parseCreateGroupResponse(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v6

    .line 68
    .local v6, "jsonStatus":Lorg/json/JSONArray;
    const-string v13, "DLMSetFriendlyName"

    new-instance v14, Ljava/lang/StringBuilder;

    invoke-direct {v14}, Ljava/lang/StringBuilder;-><init>()V

    const-string v15, "jsonStatus :"

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v14

    const-string v15, "jsonStatus.getJSONObject(0).getString(\"GetFriendlyNameResponse\") :"

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    const/4 v15, 0x0

    invoke-virtual {v6, v15}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v15

    const-string v16, "GetFriendlyNameResponse"

    invoke-virtual/range {v15 .. v16}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v15

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v14

    invoke-static {v13, v14}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 71
    const/4 v13, 0x0

    invoke-virtual {v6, v13}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v13

    if-eqz v13, :cond_3

    const/4 v13, 0x0

    invoke-virtual {v6, v13}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v13

    const-string v14, "GetFriendlyNameResponse"

    invoke-virtual {v13, v14}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v13

    if-eqz v13, :cond_3

    .line 72
    const/4 v13, 0x0

    invoke-virtual {v6, v13}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v13

    const-string v14, "GetFriendlyNameResponse"

    invoke-virtual {v13, v14}, Lorg/json/JSONObject;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v13

    const-string v14, "1"

    invoke-virtual {v13, v14}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v13

    if-eqz v13, :cond_3

    .line 74
    const-string v13, "DLMSetFriendlyName"

    new-instance v14, Ljava/lang/StringBuilder;

    invoke-direct {v14}, Ljava/lang/StringBuilder;-><init>()V

    const-string v15, "Updating friendly name in cache for udn:"

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v14

    invoke-static {v13, v14}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 75
    invoke-virtual {v8, v11}, Lcom/belkin/wemo/cache/data/DeviceInformation;->setFriendlyName(Ljava/lang/String;)V

    .line 76
    const/4 v13, 0x1

    invoke-static {v13}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v10

    .line 106
    .end local v1    # "action":Lorg/cybergarage/upnp/Action;
    .end local v2    # "controlPoint":Lorg/cybergarage/upnp/ControlPoint;
    .end local v3    # "createGroupResponse":Lcom/belkin/wemo/cache/utils/GetCreateGroupResponseParser;
    .end local v6    # "jsonStatus":Lorg/json/JSONArray;
    .end local v7    # "mBridgeUdn":Ljava/lang/String;
    .end local v8    # "mDeviceInfo":Lcom/belkin/wemo/cache/data/DeviceInformation;
    .end local v9    # "response":Ljava/lang/String;
    .end local v11    # "sFriendlyName":Ljava/lang/String;
    :cond_3
    :goto_1
    invoke-virtual {v10}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v13

    const/4 v14, 0x1

    if-ne v13, v14, :cond_4

    .line 108
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/belkin/wemo/cache/devicelist/DLMSetFriendlyName;->mDLM:Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/belkin/wemo/cache/devicelist/DLMSetFriendlyName;->mDeviceInfo:Lcom/belkin/wemo/cache/data/DeviceInformation;

    const/4 v15, 0x0

    invoke-static {v15}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v15

    invoke-virtual {v13, v14, v15}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->updateDeviceCacheInDeviceList(Lcom/belkin/wemo/cache/data/DeviceInformation;Ljava/lang/Boolean;)V

    .line 111
    :cond_4
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/belkin/wemo/cache/devicelist/DLMSetFriendlyName;->notifType:Ljava/lang/String;

    invoke-static {v13}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v13

    if-nez v13, :cond_5

    .line 112
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/belkin/wemo/cache/devicelist/DLMSetFriendlyName;->mDLM:Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/belkin/wemo/cache/devicelist/DLMSetFriendlyName;->notifType:Ljava/lang/String;

    new-instance v15, Ljava/lang/StringBuilder;

    invoke-direct {v15}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v15, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v15

    const-string v16, ""

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    invoke-virtual {v15}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v15

    invoke-virtual {v13, v14, v15, v12}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->sendNotification(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 114
    :cond_5
    return-object v10

    .line 80
    .restart local v1    # "action":Lorg/cybergarage/upnp/Action;
    .restart local v2    # "controlPoint":Lorg/cybergarage/upnp/ControlPoint;
    .restart local v7    # "mBridgeUdn":Ljava/lang/String;
    .restart local v8    # "mDeviceInfo":Lcom/belkin/wemo/cache/data/DeviceInformation;
    .restart local v9    # "response":Ljava/lang/String;
    .restart local v11    # "sFriendlyName":Ljava/lang/String;
    :cond_6
    :try_start_1
    const-string v13, "DLMSetFriendlyName"

    new-instance v14, Ljava/lang/StringBuilder;

    invoke-direct {v14}, Ljava/lang/StringBuilder;-><init>()V

    const-string v15, "Error setting friendlyName Zigbee, response: "

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v14

    invoke-static {v13, v14}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 81
    const/4 v13, 0x0

    invoke-static {v13}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v10

    goto :goto_1

    .line 86
    .end local v1    # "action":Lorg/cybergarage/upnp/Action;
    .end local v7    # "mBridgeUdn":Ljava/lang/String;
    .end local v9    # "response":Ljava/lang/String;
    :cond_7
    invoke-virtual {v2, v12}, Lorg/cybergarage/upnp/ControlPoint;->getDevice(Ljava/lang/String;)Lorg/cybergarage/upnp/Device;

    move-result-object v13

    const-string v14, "ChangeFriendlyName"

    invoke-virtual {v13, v14}, Lorg/cybergarage/upnp/Device;->getAction(Ljava/lang/String;)Lorg/cybergarage/upnp/Action;

    move-result-object v1

    .line 87
    .restart local v1    # "action":Lorg/cybergarage/upnp/Action;
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/belkin/wemo/cache/devicelist/DLMSetFriendlyName;->mDLM:Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    sget-object v14, Lcom/belkin/wemo/cache/devicelist/UpnpConstants;->SET_FRIENDLY_NAME_ARGS_KEYS:[Ljava/lang/String;

    const/4 v15, 0x1

    new-array v15, v15, [Ljava/lang/String;

    const/16 v16, 0x0

    aput-object v11, v15, v16

    invoke-virtual {v13, v1, v14, v15}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->setArgument(Lorg/cybergarage/upnp/Action;[Ljava/lang/String;[Ljava/lang/String;)V

    .line 88
    invoke-virtual {v1}, Lorg/cybergarage/upnp/Action;->postControlAction()Ljava/lang/String;

    move-result-object v9

    .line 89
    .restart local v9    # "response":Ljava/lang/String;
    const-string v13, "DLMSetFriendlyName"

    new-instance v14, Ljava/lang/StringBuilder;

    invoke-direct {v14}, Ljava/lang/StringBuilder;-><init>()V

    const-string v15, "non-zigbee action response: "

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v14

    invoke-static {v13, v14}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 90
    if-eqz v9, :cond_8

    .line 91
    const-string v13, "DLMSetFriendlyName"

    new-instance v14, Ljava/lang/StringBuilder;

    invoke-direct {v14}, Ljava/lang/StringBuilder;-><init>()V

    const-string v15, "success from non-zigbee device response:"

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v14

    invoke-static {v13, v14}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 92
    invoke-virtual {v8, v11}, Lcom/belkin/wemo/cache/data/DeviceInformation;->setFriendlyName(Ljava/lang/String;)V

    .line 93
    const/4 v13, 0x1

    invoke-static {v13}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v10

    goto/16 :goto_1

    .line 95
    :cond_8
    const-string v13, "DLMSetFriendlyName"

    new-instance v14, Ljava/lang/StringBuilder;

    invoke-direct {v14}, Ljava/lang/StringBuilder;-><init>()V

    const-string v15, "Error setting friendlyName non-Zigbee, response: "

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v14

    invoke-static {v13, v14}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 96
    const/4 v13, 0x0

    invoke-static {v13}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    move-result-object v10

    goto/16 :goto_1

    .line 102
    .end local v1    # "action":Lorg/cybergarage/upnp/Action;
    .end local v2    # "controlPoint":Lorg/cybergarage/upnp/ControlPoint;
    .end local v8    # "mDeviceInfo":Lcom/belkin/wemo/cache/data/DeviceInformation;
    .end local v9    # "response":Ljava/lang/String;
    .end local v11    # "sFriendlyName":Ljava/lang/String;
    :catch_0
    move-exception v4

    .line 103
    .local v4, "e":Ljava/lang/Exception;
    const-string v13, "DLMSetFriendlyName"

    new-instance v14, Ljava/lang/StringBuilder;

    invoke-direct {v14}, Ljava/lang/StringBuilder;-><init>()V

    const-string v15, "Error setting friendlyName Zigbee"

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v14

    invoke-static {v13, v14}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;)V

    goto/16 :goto_1
.end method

.method protected bridge synthetic doInBackground([Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1
    .param p1, "x0"    # [Ljava/lang/Object;

    .prologue
    .line 16
    invoke-virtual {p0, p1}, Lcom/belkin/wemo/cache/devicelist/DLMSetFriendlyName;->doInBackground([Ljava/lang/Object;)Ljava/lang/Boolean;

    move-result-object v0

    return-object v0
.end method
