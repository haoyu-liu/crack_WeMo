.class public Lcom/belkin/wemo/cache/cloud/CloudRequestResetFNIRulesZigbee;
.super Ljava/lang/Object;
.source "CloudRequestResetFNIRulesZigbee.java"

# interfaces
.implements Lcom/belkin/wemo/cache/cloud/CloudRequestInterface;


# instance fields
.field private final MODEL_CODE_BRIDGE:Ljava/lang/String;

.field private final TAG:Ljava/lang/String;

.field private final TIMEOUT:I

.field private final TIMEOUTLIMIT:I

.field private final URLInsightParamsMessage:Ljava/lang/String;

.field private listener:Lcom/belkin/wemo/cache/cloud/listener/OnRequestCompleteListener;

.field private mBridgeData:Lorg/json/JSONObject;

.field private mContext:Landroid/content/Context;

.field private mDLM:Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

.field private mFN:Ljava/lang/String;

.field private mMac:Ljava/lang/String;

.field private mPluginId:Ljava/lang/String;

.field private mUdn:Ljava/lang/String;


# direct methods
.method public constructor <init>(Lcom/belkin/wemo/cache/devicelist/DeviceListManager;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lorg/json/JSONObject;Ljava/lang/String;Lcom/belkin/wemo/cache/cloud/listener/OnRequestCompleteListener;)V
    .locals 1
    .param p1, "oDLM"    # Lcom/belkin/wemo/cache/devicelist/DeviceListManager;
    .param p2, "udn"    # Ljava/lang/String;
    .param p3, "pluginId"    # Ljava/lang/String;
    .param p4, "mac"    # Ljava/lang/String;
    .param p5, "bridgeData"    # Lorg/json/JSONObject;
    .param p6, "friendlyName"    # Ljava/lang/String;
    .param p7, "listener"    # Lcom/belkin/wemo/cache/cloud/listener/OnRequestCompleteListener;

    .prologue
    .line 42
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 19
    const/16 v0, 0x3a98

    iput v0, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestResetFNIRulesZigbee;->TIMEOUT:I

    .line 20
    const v0, 0xafc8

    iput v0, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestResetFNIRulesZigbee;->TIMEOUTLIMIT:I

    .line 21
    const-string v0, "https://api.xbcs.net:8443/apis/http/plugin/insight/message/"

    iput-object v0, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestResetFNIRulesZigbee;->URLInsightParamsMessage:Ljava/lang/String;

    .line 25
    const-string v0, "CloudRequestResetFNIRulesZigbee"

    iput-object v0, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestResetFNIRulesZigbee;->TAG:Ljava/lang/String;

    .line 28
    const-string v0, "Bridge"

    iput-object v0, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestResetFNIRulesZigbee;->MODEL_CODE_BRIDGE:Ljava/lang/String;

    .line 43
    iput-object p1, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestResetFNIRulesZigbee;->mDLM:Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    .line 44
    iput-object p4, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestResetFNIRulesZigbee;->mMac:Ljava/lang/String;

    .line 45
    sget-object v0, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->context:Landroid/content/Context;

    iput-object v0, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestResetFNIRulesZigbee;->mContext:Landroid/content/Context;

    .line 46
    iput-object p2, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestResetFNIRulesZigbee;->mUdn:Ljava/lang/String;

    .line 47
    iput-object p3, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestResetFNIRulesZigbee;->mPluginId:Ljava/lang/String;

    .line 48
    iput-object p6, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestResetFNIRulesZigbee;->mFN:Ljava/lang/String;

    .line 49
    iput-object p5, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestResetFNIRulesZigbee;->mBridgeData:Lorg/json/JSONObject;

    .line 50
    iput-object p7, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestResetFNIRulesZigbee;->listener:Lcom/belkin/wemo/cache/cloud/listener/OnRequestCompleteListener;

    .line 51
    return-void
.end method


# virtual methods
.method public getAdditionalHeaders()Ljava/util/Map;
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
    .line 155
    const/4 v0, 0x0

    return-object v0
.end method

.method public getBody()Ljava/lang/String;
    .locals 6

    .prologue
    .line 76
    const-string v1, ""

    .line 78
    .local v1, "xmlString":Ljava/lang/String;
    :try_start_0
    iget-object v3, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestResetFNIRulesZigbee;->mBridgeData:Lorg/json/JSONObject;

    if-eqz v3, :cond_0

    .line 79
    iget-object v3, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestResetFNIRulesZigbee;->mBridgeData:Lorg/json/JSONObject;

    invoke-virtual {v3}, Lorg/json/JSONObject;->length()I

    move-result v3

    const/4 v4, 0x2

    if-le v3, v4, :cond_0

    .line 80
    iget-object v3, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestResetFNIRulesZigbee;->mBridgeData:Lorg/json/JSONObject;

    const-string v4, "bridgeMacAddress"

    invoke-virtual {v3, v4}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_0

    iget-object v3, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestResetFNIRulesZigbee;->mBridgeData:Lorg/json/JSONObject;

    const-string v4, "bridgePluginId"

    invoke-virtual {v3, v4}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_0

    iget-object v3, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestResetFNIRulesZigbee;->mBridgeData:Lorg/json/JSONObject;

    const-string v4, "bridgeudn"

    invoke-virtual {v3, v4}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 81
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "<plugins><plugin><recipientId>"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-object v4, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestResetFNIRulesZigbee;->mBridgeData:Lorg/json/JSONObject;

    const-string v5, "bridgePluginId"

    invoke-virtual {v4, v5}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "</recipientId>"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "<macAddress>"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-object v4, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestResetFNIRulesZigbee;->mBridgeData:Lorg/json/JSONObject;

    const-string v5, "bridgeMacAddress"

    invoke-virtual {v4, v5}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "</macAddress>"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "<modelCode>"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "Bridge"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "</modelCode>"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "<content><![CDATA[<resetNameRulesData>"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "<plugin>"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "<macAddress>"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-object v4, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestResetFNIRulesZigbee;->mMac:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "</macAddress>"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "<friendlyName>"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-object v4, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestResetFNIRulesZigbee;->mFN:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "</friendlyName>"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "<resetType>"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "1"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "</resetType>"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "</plugin>"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "</resetNameRulesData>]]></content>"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "</plugin>"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "</plugins>"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 92
    const-string v3, "CloudRequestResetFNIRulesZigbee"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "xmlString: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    move-object v2, v1

    .line 100
    .end local v1    # "xmlString":Ljava/lang/String;
    .local v2, "xmlString":Ljava/lang/String;
    :goto_0
    return-object v2

    .line 97
    .end local v2    # "xmlString":Ljava/lang/String;
    .restart local v1    # "xmlString":Ljava/lang/String;
    :catch_0
    move-exception v0

    .line 98
    .local v0, "ex":Lorg/json/JSONException;
    const-string v3, "CloudRequestResetFNIRulesZigbee"

    const-string v4, "Exception in getBody()"

    invoke-static {v3, v4, v0}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Exception;)V

    .end local v0    # "ex":Lorg/json/JSONException;
    :cond_0
    move-object v2, v1

    .line 100
    .end local v1    # "xmlString":Ljava/lang/String;
    .restart local v2    # "xmlString":Ljava/lang/String;
    goto :goto_0
.end method

.method public getFileByteArray()[B
    .locals 1

    .prologue
    .line 105
    const/4 v0, 0x0

    return-object v0
.end method

.method public getRequestMethod()I
    .locals 1

    .prologue
    .line 56
    const/4 v0, 0x1

    return v0
.end method

.method public getTimeout()I
    .locals 1

    .prologue
    .line 61
    const/16 v0, 0x3a98

    return v0
.end method

.method public getTimeoutLimit()I
    .locals 1

    .prologue
    .line 66
    const v0, 0xafc8

    return v0
.end method

.method public getURL()Ljava/lang/String;
    .locals 1

    .prologue
    .line 71
    const-string v0, "https://api.xbcs.net:8443/apis/http/plugin/insight/message/"

    return-object v0
.end method

.method public getUploadFileName()Ljava/lang/String;
    .locals 1

    .prologue
    .line 110
    const/4 v0, 0x0

    return-object v0
.end method

.method public isAuthHeaderRequired()Z
    .locals 1

    .prologue
    .line 150
    const/4 v0, 0x1

    return v0
.end method

.method public requestComplete(ZI[B)V
    .locals 17
    .param p1, "success"    # Z
    .param p2, "statusCode"    # I
    .param p3, "response"    # [B

    .prologue
    .line 117
    const-string v3, "CloudRequestResetFNIRulesZigbee"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Finished request to reset FN Icon Rules zigbee success: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    move/from16 v0, p1

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, ", response: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    move-object/from16 v0, p3

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 118
    if-eqz p1, :cond_1

    .line 119
    new-instance v11, Lcom/belkin/wemo/cache/cloud/CloudRequestManager;

    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/belkin/wemo/cache/cloud/CloudRequestResetFNIRulesZigbee;->mContext:Landroid/content/Context;

    invoke-direct {v11, v3}, Lcom/belkin/wemo/cache/cloud/CloudRequestManager;-><init>(Landroid/content/Context;)V

    .line 120
    .local v11, "cRM":Lcom/belkin/wemo/cache/cloud/CloudRequestManager;
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/belkin/wemo/cache/cloud/CloudRequestResetFNIRulesZigbee;->mDLM:Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    if-nez v3, :cond_0

    .line 121
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/belkin/wemo/cache/cloud/CloudRequestResetFNIRulesZigbee;->mContext:Landroid/content/Context;

    invoke-static {v3}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->getInstance(Landroid/content/Context;)Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    move-result-object v3

    move-object/from16 v0, p0

    iput-object v3, v0, Lcom/belkin/wemo/cache/cloud/CloudRequestResetFNIRulesZigbee;->mDLM:Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    .line 123
    :cond_0
    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/belkin/wemo/cache/cloud/CloudRequestResetFNIRulesZigbee;->mBridgeData:Lorg/json/JSONObject;

    .line 125
    .local v14, "props":Lorg/json/JSONObject;
    :try_start_0
    const-string v3, "notificationName"

    const-string v4, "reset_fn_icon_rules"

    invoke-virtual {v14, v3, v4}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 126
    new-instance v3, Lcom/belkin/wemo/cache/cloud/CloudRequestChangeFriendlyName;

    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/belkin/wemo/cache/cloud/CloudRequestResetFNIRulesZigbee;->mDLM:Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/belkin/wemo/cache/cloud/CloudRequestResetFNIRulesZigbee;->mContext:Landroid/content/Context;

    move-object/from16 v0, p0

    iget-object v6, v0, Lcom/belkin/wemo/cache/cloud/CloudRequestResetFNIRulesZigbee;->mUdn:Ljava/lang/String;

    move-object/from16 v0, p0

    iget-object v7, v0, Lcom/belkin/wemo/cache/cloud/CloudRequestResetFNIRulesZigbee;->mPluginId:Ljava/lang/String;

    move-object/from16 v0, p0

    iget-object v8, v0, Lcom/belkin/wemo/cache/cloud/CloudRequestResetFNIRulesZigbee;->mMac:Ljava/lang/String;

    move-object/from16 v0, p0

    iget-object v9, v0, Lcom/belkin/wemo/cache/cloud/CloudRequestResetFNIRulesZigbee;->mFN:Ljava/lang/String;

    const/4 v10, 0x1

    new-array v10, v10, [Ljava/lang/Object;

    const/4 v15, 0x0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/wemo/cache/cloud/CloudRequestResetFNIRulesZigbee;->mBridgeData:Lorg/json/JSONObject;

    move-object/from16 v16, v0

    aput-object v16, v10, v15

    invoke-direct/range {v3 .. v10}, Lcom/belkin/wemo/cache/cloud/CloudRequestChangeFriendlyName;-><init>(Lcom/belkin/wemo/cache/devicelist/DeviceListManager;Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    invoke-virtual {v11, v3}, Lcom/belkin/wemo/cache/cloud/CloudRequestManager;->makeRequest(Lcom/belkin/wemo/cache/cloud/CloudRequestInterface;)V

    .line 127
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/belkin/wemo/cache/cloud/CloudRequestResetFNIRulesZigbee;->mDLM:Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/belkin/wemo/cache/cloud/CloudRequestResetFNIRulesZigbee;->mUdn:Ljava/lang/String;

    invoke-virtual {v3, v4}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->getDevice(Ljava/lang/String;)Lcom/belkin/wemo/cache/data/DeviceInformation;

    move-result-object v12

    .line 128
    .local v12, "device":Lcom/belkin/wemo/cache/data/DeviceInformation;
    if-eqz v12, :cond_1

    .line 129
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/belkin/wemo/cache/cloud/CloudRequestResetFNIRulesZigbee;->mFN:Ljava/lang/String;

    invoke-virtual {v12, v3}, Lcom/belkin/wemo/cache/data/DeviceInformation;->setFriendlyName(Ljava/lang/String;)V

    .line 130
    const-string v3, ""

    invoke-virtual {v12, v3}, Lcom/belkin/wemo/cache/data/DeviceInformation;->setIcon(Ljava/lang/String;)V

    .line 131
    const-string v3, ""

    invoke-virtual {v12, v3}, Lcom/belkin/wemo/cache/data/DeviceInformation;->setIconVersion(Ljava/lang/String;)V

    .line 132
    const/4 v3, 0x1

    invoke-virtual {v12, v3}, Lcom/belkin/wemo/cache/data/DeviceInformation;->setIsDiscovered(Z)V

    .line 133
    const/4 v3, 0x0

    invoke-virtual {v12, v3}, Lcom/belkin/wemo/cache/data/DeviceInformation;->setInActive(I)V

    .line 134
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/belkin/wemo/cache/cloud/CloudRequestResetFNIRulesZigbee;->mDLM:Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    const/4 v4, 0x0

    invoke-virtual {v3, v12, v4}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->setDeviceInformationToDevicesArray(Lcom/belkin/wemo/cache/data/DeviceInformation;Z)V

    .line 136
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/belkin/wemo/cache/cloud/CloudRequestResetFNIRulesZigbee;->listener:Lcom/belkin/wemo/cache/cloud/listener/OnRequestCompleteListener;

    if-eqz v3, :cond_1

    .line 137
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/belkin/wemo/cache/cloud/CloudRequestResetFNIRulesZigbee;->listener:Lcom/belkin/wemo/cache/cloud/listener/OnRequestCompleteListener;

    move/from16 v0, p1

    move/from16 v1, p2

    move-object/from16 v2, p3

    invoke-interface {v3, v0, v1, v2}, Lcom/belkin/wemo/cache/cloud/listener/OnRequestCompleteListener;->onRequestComplete(ZI[B)V
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 146
    .end local v11    # "cRM":Lcom/belkin/wemo/cache/cloud/CloudRequestManager;
    .end local v12    # "device":Lcom/belkin/wemo/cache/data/DeviceInformation;
    .end local v14    # "props":Lorg/json/JSONObject;
    :cond_1
    :goto_0
    return-void

    .line 140
    .restart local v11    # "cRM":Lcom/belkin/wemo/cache/cloud/CloudRequestManager;
    .restart local v14    # "props":Lorg/json/JSONObject;
    :catch_0
    move-exception v13

    .line 141
    .local v13, "e":Lorg/json/JSONException;
    const-string v3, "CloudRequestResetFNIRulesZigbee"

    const-string v4, "Exception in requestComplete adding props"

    invoke-static {v3, v4, v13}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Exception;)V

    goto :goto_0
.end method
