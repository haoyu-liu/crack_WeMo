.class public Lcom/belkin/wemo/cache/devicelist/runnable/SetDeviceStateRunnable;
.super Lcom/belkin/wemo/runnable/WeMoRunnable;
.source "SetDeviceStateRunnable.java"


# instance fields
.field actionResult:Ljava/lang/String;

.field private changedBrightness:Ljava/lang/String;

.field private changedFader:Ljava/lang/String;

.field private changedState:Ljava/lang/String;

.field private changedValues:Lorg/json/JSONArray;

.field private context:Landroid/content/Context;

.field private devListManager:Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

.field private executedActions:Lorg/json/JSONArray;

.field private mDeviceInfo:Lcom/belkin/wemo/cache/data/DeviceInformation;

.field private mode:Ljava/lang/String;

.field private params:[Ljava/lang/Object;

.field private time:Ljava/lang/String;


# direct methods
.method public varargs constructor <init>(Landroid/content/Context;[Ljava/lang/Object;)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "params"    # [Ljava/lang/Object;

    .prologue
    const/4 v0, 0x0

    .line 40
    invoke-direct {p0}, Lcom/belkin/wemo/runnable/WeMoRunnable;-><init>()V

    .line 31
    iput-object v0, p0, Lcom/belkin/wemo/cache/devicelist/runnable/SetDeviceStateRunnable;->executedActions:Lorg/json/JSONArray;

    .line 32
    iput-object v0, p0, Lcom/belkin/wemo/cache/devicelist/runnable/SetDeviceStateRunnable;->changedValues:Lorg/json/JSONArray;

    .line 35
    iput-object v0, p0, Lcom/belkin/wemo/cache/devicelist/runnable/SetDeviceStateRunnable;->actionResult:Ljava/lang/String;

    .line 41
    invoke-static {p1}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->getInstance(Landroid/content/Context;)Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    move-result-object v0

    iput-object v0, p0, Lcom/belkin/wemo/cache/devicelist/runnable/SetDeviceStateRunnable;->devListManager:Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    .line 42
    iput-object p1, p0, Lcom/belkin/wemo/cache/devicelist/runnable/SetDeviceStateRunnable;->context:Landroid/content/Context;

    .line 43
    iput-object p2, p0, Lcom/belkin/wemo/cache/devicelist/runnable/SetDeviceStateRunnable;->params:[Ljava/lang/Object;

    .line 44
    return-void
.end method

.method private processResult(Ljava/lang/Boolean;)V
    .locals 18
    .param p1, "result"    # Ljava/lang/Boolean;

    .prologue
    .line 170
    const/4 v10, 0x0

    .line 171
    .local v10, "udn":Ljava/lang/String;
    const-string v4, "set_state"

    .line 172
    .local v4, "event":Ljava/lang/String;
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/belkin/wemo/cache/devicelist/runnable/SetDeviceStateRunnable;->mDeviceInfo:Lcom/belkin/wemo/cache/data/DeviceInformation;

    if-eqz v13, :cond_1

    .line 173
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/belkin/wemo/cache/devicelist/runnable/SetDeviceStateRunnable;->mDeviceInfo:Lcom/belkin/wemo/cache/data/DeviceInformation;

    invoke-virtual {v13}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getUDN()Ljava/lang/String;

    move-result-object v10

    .line 174
    if-nez p1, :cond_3

    .line 175
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/belkin/wemo/cache/devicelist/runnable/SetDeviceStateRunnable;->TAG:Ljava/lang/String;

    const-string v14, " Setting state FAILED."

    invoke-static {v13, v14}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 177
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/belkin/wemo/cache/devicelist/runnable/SetDeviceStateRunnable;->mDeviceInfo:Lcom/belkin/wemo/cache/data/DeviceInformation;

    if-eqz v13, :cond_0

    .line 178
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/belkin/wemo/cache/devicelist/runnable/SetDeviceStateRunnable;->mDeviceInfo:Lcom/belkin/wemo/cache/data/DeviceInformation;

    const/4 v14, 0x1

    invoke-virtual {v13, v14}, Lcom/belkin/wemo/cache/data/DeviceInformation;->setInActive(I)V

    .line 179
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/belkin/wemo/cache/devicelist/runnable/SetDeviceStateRunnable;->mDeviceInfo:Lcom/belkin/wemo/cache/data/DeviceInformation;

    const/4 v14, 0x0

    invoke-virtual {v13, v14}, Lcom/belkin/wemo/cache/data/DeviceInformation;->setIsDiscovered(Z)V

    .line 180
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/belkin/wemo/cache/devicelist/runnable/SetDeviceStateRunnable;->context:Landroid/content/Context;

    invoke-static {v13}, Lcom/belkin/wemo/cache/data/DevicesArray;->getInstance(Landroid/content/Context;)Lcom/belkin/wemo/cache/data/DevicesArray;

    move-result-object v13

    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/belkin/wemo/cache/devicelist/runnable/SetDeviceStateRunnable;->mDeviceInfo:Lcom/belkin/wemo/cache/data/DeviceInformation;

    invoke-virtual {v13, v14}, Lcom/belkin/wemo/cache/data/DevicesArray;->addOrUpdateDeviceInformation(Lcom/belkin/wemo/cache/data/DeviceInformation;)V

    .line 181
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/belkin/wemo/cache/devicelist/runnable/SetDeviceStateRunnable;->context:Landroid/content/Context;

    invoke-static {v13}, Lcom/belkin/wemo/cache/CacheManager;->getInstance(Landroid/content/Context;)Lcom/belkin/wemo/cache/CacheManager;

    move-result-object v13

    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/belkin/wemo/cache/devicelist/runnable/SetDeviceStateRunnable;->mDeviceInfo:Lcom/belkin/wemo/cache/data/DeviceInformation;

    const/4 v15, 0x0

    const/16 v16, 0x0

    const/16 v17, 0x1

    invoke-virtual/range {v13 .. v17}, Lcom/belkin/wemo/cache/CacheManager;->updateDB(Lcom/belkin/wemo/cache/data/DeviceInformation;ZZZ)V

    .line 294
    :cond_0
    :goto_0
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/belkin/wemo/cache/devicelist/runnable/SetDeviceStateRunnable;->devListManager:Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    invoke-virtual/range {p1 .. p1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v14

    invoke-static {v14}, Ljava/lang/Boolean;->toString(Z)Ljava/lang/String;

    move-result-object v14

    invoke-virtual {v13, v4, v14, v10}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->sendNotification(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 297
    :cond_1
    invoke-static {}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->isDebug()Z

    move-result v13

    if-eqz v13, :cond_2

    .line 299
    new-instance v7, Lcom/belkin/wemo/cache/utils/MoreUtil;

    invoke-direct {v7}, Lcom/belkin/wemo/cache/utils/MoreUtil;-><init>()V

    .line 300
    .local v7, "mU":Lcom/belkin/wemo/cache/utils/MoreUtil;
    const-string v13, "cache.db"

    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/belkin/wemo/cache/devicelist/runnable/SetDeviceStateRunnable;->context:Landroid/content/Context;

    invoke-virtual {v7, v13, v14}, Lcom/belkin/wemo/cache/utils/MoreUtil;->copyDbToDownloadDirectory(Ljava/lang/String;Landroid/content/Context;)V

    .line 302
    .end local v7    # "mU":Lcom/belkin/wemo/cache/utils/MoreUtil;
    :cond_2
    return-void

    .line 184
    :cond_3
    invoke-virtual/range {p1 .. p1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v13

    if-eqz v13, :cond_e

    .line 185
    invoke-static {v10}, Lcom/belkin/wemo/cache/utils/IsDevice;->Crockpot(Ljava/lang/String;)Z

    move-result v13

    if-nez v13, :cond_d

    .line 186
    invoke-static {v10}, Lcom/belkin/wemo/cache/utils/IsDevice;->Insight(Ljava/lang/String;)Z

    move-result v13

    if-eqz v13, :cond_a

    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/belkin/wemo/cache/devicelist/runnable/SetDeviceStateRunnable;->changedValues:Lorg/json/JSONArray;

    if-eqz v13, :cond_a

    .line 188
    const/4 v6, 0x0

    .local v6, "i":I
    :goto_1
    :try_start_0
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/belkin/wemo/cache/devicelist/runnable/SetDeviceStateRunnable;->executedActions:Lorg/json/JSONArray;

    invoke-virtual {v13}, Lorg/json/JSONArray;->length()I

    move-result v13

    if-ge v6, v13, :cond_6

    .line 189
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/belkin/wemo/cache/devicelist/runnable/SetDeviceStateRunnable;->executedActions:Lorg/json/JSONArray;

    invoke-virtual {v13, v6}, Lorg/json/JSONArray;->get(I)Ljava/lang/Object;

    move-result-object v13

    invoke-virtual {v13}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v5

    .line 190
    .local v5, "executeAction":Ljava/lang/String;
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/belkin/wemo/cache/devicelist/runnable/SetDeviceStateRunnable;->changedValues:Lorg/json/JSONArray;

    invoke-virtual {v13, v6}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v13

    invoke-virtual {v13, v5}, Lorg/json/JSONObject;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v13

    check-cast v13, [Ljava/lang/String;

    move-object v0, v13

    check-cast v0, [Ljava/lang/String;

    move-object v12, v0

    .line 191
    .local v12, "values":[Ljava/lang/String;
    const-string v13, "SetInsightHomeSettings"

    invoke-virtual {v5, v13}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v13

    if-eqz v13, :cond_5

    .line 192
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/belkin/wemo/cache/devicelist/runnable/SetDeviceStateRunnable;->mDeviceInfo:Lcom/belkin/wemo/cache/data/DeviceInformation;

    sget-object v14, Lcom/belkin/wemo/cache/devicelist/JSONConstants;->INSIGHT_ENERGY_PER_UNIT_COST:Ljava/lang/String;

    const/4 v15, 0x0

    aget-object v15, v12, v15

    invoke-virtual {v13, v14, v15}, Lcom/belkin/wemo/cache/data/DeviceInformation;->setAttributeValue(Ljava/lang/String;Ljava/lang/String;)V

    .line 193
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/belkin/wemo/cache/devicelist/runnable/SetDeviceStateRunnable;->mDeviceInfo:Lcom/belkin/wemo/cache/data/DeviceInformation;

    sget-object v14, Lcom/belkin/wemo/cache/devicelist/JSONConstants;->INSIGHT_CURRENCY:Ljava/lang/String;

    const/4 v15, 0x1

    aget-object v15, v12, v15

    invoke-virtual {v13, v14, v15}, Lcom/belkin/wemo/cache/data/DeviceInformation;->setAttributeValue(Ljava/lang/String;Ljava/lang/String;)V

    .line 188
    :cond_4
    :goto_2
    add-int/lit8 v6, v6, 0x1

    goto :goto_1

    .line 194
    :cond_5
    const-string v13, "SetPowerThreshold"

    invoke-virtual {v5, v13}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v13

    if-eqz v13, :cond_9

    .line 195
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/belkin/wemo/cache/devicelist/runnable/SetDeviceStateRunnable;->mDeviceInfo:Lcom/belkin/wemo/cache/data/DeviceInformation;

    sget-object v14, Lcom/belkin/wemo/cache/devicelist/JSONConstants;->INSIGHT_POWER_THRESHOLD:Ljava/lang/String;

    const/4 v15, 0x0

    aget-object v15, v12, v15

    invoke-virtual {v13, v14, v15}, Lcom/belkin/wemo/cache/data/DeviceInformation;->setAttributeValue(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_2

    .line 201
    .end local v5    # "executeAction":Ljava/lang/String;
    .end local v12    # "values":[Ljava/lang/String;
    :catch_0
    move-exception v3

    .line 202
    .local v3, "e":Lorg/json/JSONException;
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/belkin/wemo/cache/devicelist/runnable/SetDeviceStateRunnable;->TAG:Ljava/lang/String;

    const-string v14, "UnsupportedEncodingException while saving insight attributes "

    invoke-static {v13, v14, v3}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Exception;)V

    .line 248
    .end local v3    # "e":Lorg/json/JSONException;
    .end local v6    # "i":I
    :cond_6
    :goto_3
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/belkin/wemo/cache/devicelist/runnable/SetDeviceStateRunnable;->changedFader:Ljava/lang/String;

    invoke-static {v13}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v13

    if-eqz v13, :cond_8

    .line 249
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/belkin/wemo/cache/devicelist/runnable/SetDeviceStateRunnable;->devListManager:Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    invoke-virtual {v13}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->getBinaryStateRequestTrackerMap()Ljava/util/Map;

    move-result-object v13

    invoke-interface {v13, v10}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Lcom/belkin/wemo/cache/devicelist/DeviceRequestTracker;

    .line 250
    .local v9, "requestTracker":Lcom/belkin/wemo/cache/devicelist/DeviceRequestTracker;
    if-nez v9, :cond_7

    .line 251
    new-instance v9, Lcom/belkin/wemo/cache/devicelist/DeviceRequestTracker;

    .end local v9    # "requestTracker":Lcom/belkin/wemo/cache/devicelist/DeviceRequestTracker;
    invoke-direct {v9, v10}, Lcom/belkin/wemo/cache/devicelist/DeviceRequestTracker;-><init>(Ljava/lang/String;)V

    .line 252
    .restart local v9    # "requestTracker":Lcom/belkin/wemo/cache/devicelist/DeviceRequestTracker;
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/belkin/wemo/cache/devicelist/runnable/SetDeviceStateRunnable;->devListManager:Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    invoke-virtual {v13}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->getBinaryStateRequestTrackerMap()Ljava/util/Map;

    move-result-object v13

    invoke-interface {v13, v10, v9}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 254
    :cond_7
    invoke-virtual {v9}, Lcom/belkin/wemo/cache/devicelist/DeviceRequestTracker;->onRequestSuccess()V

    .line 257
    .end local v9    # "requestTracker":Lcom/belkin/wemo/cache/devicelist/DeviceRequestTracker;
    :cond_8
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/belkin/wemo/cache/devicelist/runnable/SetDeviceStateRunnable;->context:Landroid/content/Context;

    invoke-static {v13}, Lcom/belkin/wemo/cache/data/DevicesArray;->getInstance(Landroid/content/Context;)Lcom/belkin/wemo/cache/data/DevicesArray;

    move-result-object v13

    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/belkin/wemo/cache/devicelist/runnable/SetDeviceStateRunnable;->mDeviceInfo:Lcom/belkin/wemo/cache/data/DeviceInformation;

    invoke-virtual {v13, v14}, Lcom/belkin/wemo/cache/data/DevicesArray;->addOrUpdateDeviceInformation(Lcom/belkin/wemo/cache/data/DeviceInformation;)V

    .line 258
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/belkin/wemo/cache/devicelist/runnable/SetDeviceStateRunnable;->context:Landroid/content/Context;

    invoke-static {v13}, Lcom/belkin/wemo/cache/CacheManager;->getInstance(Landroid/content/Context;)Lcom/belkin/wemo/cache/CacheManager;

    move-result-object v13

    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/belkin/wemo/cache/devicelist/runnable/SetDeviceStateRunnable;->mDeviceInfo:Lcom/belkin/wemo/cache/data/DeviceInformation;

    const/4 v15, 0x0

    const/16 v16, 0x0

    const/16 v17, 0x1

    invoke-virtual/range {v13 .. v17}, Lcom/belkin/wemo/cache/CacheManager;->updateDB(Lcom/belkin/wemo/cache/data/DeviceInformation;ZZZ)V

    goto/16 :goto_0

    .line 196
    .restart local v5    # "executeAction":Ljava/lang/String;
    .restart local v6    # "i":I
    .restart local v12    # "values":[Ljava/lang/String;
    :cond_9
    :try_start_1
    const-string v13, "ScheduleDataExport"

    invoke-virtual {v5, v13}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v13

    if-eqz v13, :cond_4

    .line 197
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/belkin/wemo/cache/devicelist/runnable/SetDeviceStateRunnable;->mDeviceInfo:Lcom/belkin/wemo/cache/data/DeviceInformation;

    sget-object v14, Lcom/belkin/wemo/cache/devicelist/JSONConstants;->INSIGHT_EXPORT_EMAIL:Ljava/lang/String;

    const/4 v15, 0x0

    aget-object v15, v12, v15

    invoke-virtual {v13, v14, v15}, Lcom/belkin/wemo/cache/data/DeviceInformation;->setAttributeValue(Ljava/lang/String;Ljava/lang/String;)V

    .line 198
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/belkin/wemo/cache/devicelist/runnable/SetDeviceStateRunnable;->mDeviceInfo:Lcom/belkin/wemo/cache/data/DeviceInformation;

    sget-object v14, Lcom/belkin/wemo/cache/devicelist/JSONConstants;->INSIGHT_EXPORT_INTERVAL:Ljava/lang/String;

    const/4 v15, 0x1

    aget-object v15, v12, v15

    invoke-virtual {v13, v14, v15}, Lcom/belkin/wemo/cache/data/DeviceInformation;->setAttributeValue(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_1
    .catch Lorg/json/JSONException; {:try_start_1 .. :try_end_1} :catch_0

    goto/16 :goto_2

    .line 205
    .end local v5    # "executeAction":Ljava/lang/String;
    .end local v6    # "i":I
    .end local v12    # "values":[Ljava/lang/String;
    :cond_a
    new-instance v8, Lcom/belkin/wemo/upnp/parser/InsightBinaryStateResponseParser;

    invoke-direct {v8}, Lcom/belkin/wemo/upnp/parser/InsightBinaryStateResponseParser;-><init>()V

    .line 206
    .local v8, "parser":Lcom/belkin/wemo/upnp/parser/InsightBinaryStateResponseParser;
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/belkin/wemo/cache/devicelist/runnable/SetDeviceStateRunnable;->actionResult:Ljava/lang/String;

    invoke-virtual {v8, v13}, Lcom/belkin/wemo/upnp/parser/InsightBinaryStateResponseParser;->parseResponse(Ljava/lang/String;)Lcom/belkin/wemo/upnp/response/InsightBinaryState;

    move-result-object v1

    .line 207
    .local v1, "binaryState":Lcom/belkin/wemo/upnp/response/InsightBinaryState;
    invoke-virtual {v1}, Lcom/belkin/wemo/upnp/response/InsightBinaryState;->getBinaryState()Ljava/lang/String;

    move-result-object v13

    move-object/from16 v0, p0

    iput-object v13, v0, Lcom/belkin/wemo/cache/devicelist/runnable/SetDeviceStateRunnable;->changedState:Ljava/lang/String;

    .line 208
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/belkin/wemo/cache/devicelist/runnable/SetDeviceStateRunnable;->changedState:Ljava/lang/String;

    invoke-static {v13}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v13

    if-nez v13, :cond_b

    .line 209
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/belkin/wemo/cache/devicelist/runnable/SetDeviceStateRunnable;->mDeviceInfo:Lcom/belkin/wemo/cache/data/DeviceInformation;

    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/belkin/wemo/cache/devicelist/runnable/SetDeviceStateRunnable;->changedState:Ljava/lang/String;

    invoke-virtual {v13, v14}, Lcom/belkin/wemo/cache/data/DeviceInformation;->setBinaryState(Ljava/lang/String;)V

    .line 210
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/belkin/wemo/cache/devicelist/runnable/SetDeviceStateRunnable;->mDeviceInfo:Lcom/belkin/wemo/cache/data/DeviceInformation;

    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/belkin/wemo/cache/devicelist/runnable/SetDeviceStateRunnable;->changedState:Ljava/lang/String;

    invoke-static {v14}, Ljava/lang/Integer;->valueOf(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v14

    invoke-virtual {v14}, Ljava/lang/Integer;->intValue()I

    move-result v14

    invoke-virtual {v13, v14}, Lcom/belkin/wemo/cache/data/DeviceInformation;->setState(I)V

    .line 212
    :try_start_2
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/belkin/wemo/cache/devicelist/runnable/SetDeviceStateRunnable;->mDeviceInfo:Lcom/belkin/wemo/cache/data/DeviceInformation;

    const-string v14, "binaryState"

    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/belkin/wemo/cache/devicelist/runnable/SetDeviceStateRunnable;->changedState:Ljava/lang/String;

    invoke-virtual {v13, v14, v15}, Lcom/belkin/wemo/cache/data/DeviceInformation;->setAttributeValue(Ljava/lang/String;Ljava/lang/String;)V

    .line 213
    const-string v4, "change_state"
    :try_end_2
    .catch Lorg/json/JSONException; {:try_start_2 .. :try_end_2} :catch_1

    .line 219
    :cond_b
    :goto_4
    invoke-virtual {v1}, Lcom/belkin/wemo/upnp/response/InsightBinaryState;->getBrightness()Ljava/lang/String;

    move-result-object v13

    move-object/from16 v0, p0

    iput-object v13, v0, Lcom/belkin/wemo/cache/devicelist/runnable/SetDeviceStateRunnable;->changedBrightness:Ljava/lang/String;

    .line 220
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/belkin/wemo/cache/devicelist/runnable/SetDeviceStateRunnable;->changedBrightness:Ljava/lang/String;

    invoke-static {v13}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v13

    if-nez v13, :cond_c

    .line 222
    :try_start_3
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/belkin/wemo/cache/devicelist/runnable/SetDeviceStateRunnable;->mDeviceInfo:Lcom/belkin/wemo/cache/data/DeviceInformation;

    const-string v14, "brightness"

    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/belkin/wemo/cache/devicelist/runnable/SetDeviceStateRunnable;->changedBrightness:Ljava/lang/String;

    invoke-virtual {v13, v14, v15}, Lcom/belkin/wemo/cache/data/DeviceInformation;->setAttributeValue(Ljava/lang/String;Ljava/lang/String;)V

    .line 223
    const-string v4, "change_state"
    :try_end_3
    .catch Lorg/json/JSONException; {:try_start_3 .. :try_end_3} :catch_2

    .line 242
    :cond_c
    :goto_5
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/belkin/wemo/cache/devicelist/runnable/SetDeviceStateRunnable;->TAG:Ljava/lang/String;

    new-instance v14, Ljava/lang/StringBuilder;

    invoke-direct {v14}, Ljava/lang/StringBuilder;-><init>()V

    const-string v15, " changedState : "

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/belkin/wemo/cache/devicelist/runnable/SetDeviceStateRunnable;->changedState:Ljava/lang/String;

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    const-string v15, "; changedBrightness: "

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/belkin/wemo/cache/devicelist/runnable/SetDeviceStateRunnable;->changedBrightness:Ljava/lang/String;

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    const-string v15, "; changedFader: UPDATED ONLY VIA FW NOTIFICATION."

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v14

    invoke-static {v13, v14}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    goto/16 :goto_3

    .line 214
    :catch_1
    move-exception v3

    .line 215
    .restart local v3    # "e":Lorg/json/JSONException;
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/belkin/wemo/cache/devicelist/runnable/SetDeviceStateRunnable;->TAG:Ljava/lang/String;

    const-string v14, "UnsupportedEncodingException while saving binaryState attribute: "

    invoke-static {v13, v14, v3}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Exception;)V

    goto :goto_4

    .line 224
    .end local v3    # "e":Lorg/json/JSONException;
    :catch_2
    move-exception v3

    .line 225
    .restart local v3    # "e":Lorg/json/JSONException;
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/belkin/wemo/cache/devicelist/runnable/SetDeviceStateRunnable;->TAG:Ljava/lang/String;

    const-string v14, "UnsupportedEncodingException while saving brightness attribute: "

    invoke-static {v13, v14, v3}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Exception;)V

    goto :goto_5

    .line 261
    .end local v1    # "binaryState":Lcom/belkin/wemo/upnp/response/InsightBinaryState;
    .end local v3    # "e":Lorg/json/JSONException;
    .end local v8    # "parser":Lcom/belkin/wemo/upnp/parser/InsightBinaryStateResponseParser;
    :cond_d
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/belkin/wemo/cache/devicelist/runnable/SetDeviceStateRunnable;->mDeviceInfo:Lcom/belkin/wemo/cache/data/DeviceInformation;

    invoke-virtual {v13}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getAttributeList()Lorg/json/JSONObject;

    move-result-object v2

    .line 263
    .local v2, "deviceAttributes":Lorg/json/JSONObject;
    :try_start_4
    const-string v13, "mode"

    invoke-virtual {v2, v13}, Lorg/json/JSONObject;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v11

    check-cast v11, Lorg/json/JSONObject;

    .line 264
    .local v11, "valObject":Lorg/json/JSONObject;
    const-string v13, "value"

    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/belkin/wemo/cache/devicelist/runnable/SetDeviceStateRunnable;->mode:Ljava/lang/String;

    invoke-virtual {v11, v13, v14}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 265
    const-string v13, "mode"

    invoke-virtual {v2, v13, v11}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 267
    const-string v13, "time"

    invoke-virtual {v2, v13}, Lorg/json/JSONObject;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v11

    .end local v11    # "valObject":Lorg/json/JSONObject;
    check-cast v11, Lorg/json/JSONObject;

    .line 268
    .restart local v11    # "valObject":Lorg/json/JSONObject;
    const-string v13, "value"

    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/belkin/wemo/cache/devicelist/runnable/SetDeviceStateRunnable;->time:Ljava/lang/String;

    invoke-virtual {v11, v13, v14}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 269
    const-string v13, "time"

    invoke-virtual {v2, v13, v11}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 271
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/belkin/wemo/cache/devicelist/runnable/SetDeviceStateRunnable;->mDeviceInfo:Lcom/belkin/wemo/cache/data/DeviceInformation;

    invoke-virtual {v13, v2}, Lcom/belkin/wemo/cache/data/DeviceInformation;->setAttributeList(Lorg/json/JSONObject;)V

    .line 272
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/belkin/wemo/cache/devicelist/runnable/SetDeviceStateRunnable;->context:Landroid/content/Context;

    invoke-static {v13}, Lcom/belkin/wemo/cache/data/DevicesArray;->getInstance(Landroid/content/Context;)Lcom/belkin/wemo/cache/data/DevicesArray;

    move-result-object v13

    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/belkin/wemo/cache/devicelist/runnable/SetDeviceStateRunnable;->mDeviceInfo:Lcom/belkin/wemo/cache/data/DeviceInformation;

    invoke-virtual {v13, v14}, Lcom/belkin/wemo/cache/data/DevicesArray;->addOrUpdateDeviceInformation(Lcom/belkin/wemo/cache/data/DeviceInformation;)V

    .line 273
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/belkin/wemo/cache/devicelist/runnable/SetDeviceStateRunnable;->context:Landroid/content/Context;

    invoke-static {v13}, Lcom/belkin/wemo/cache/CacheManager;->getInstance(Landroid/content/Context;)Lcom/belkin/wemo/cache/CacheManager;

    move-result-object v13

    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/belkin/wemo/cache/devicelist/runnable/SetDeviceStateRunnable;->mDeviceInfo:Lcom/belkin/wemo/cache/data/DeviceInformation;

    const/4 v15, 0x0

    const/16 v16, 0x0

    const/16 v17, 0x1

    invoke-virtual/range {v13 .. v17}, Lcom/belkin/wemo/cache/CacheManager;->updateDB(Lcom/belkin/wemo/cache/data/DeviceInformation;ZZZ)V
    :try_end_4
    .catch Lorg/json/JSONException; {:try_start_4 .. :try_end_4} :catch_3

    .line 278
    .end local v11    # "valObject":Lorg/json/JSONObject;
    :goto_6
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/belkin/wemo/cache/devicelist/runnable/SetDeviceStateRunnable;->TAG:Ljava/lang/String;

    const-string v14, "SetDeviceStateRunnable State Changed for crockpot::"

    invoke-static {v13, v14}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    goto/16 :goto_0

    .line 274
    :catch_3
    move-exception v3

    .line 276
    .restart local v3    # "e":Lorg/json/JSONException;
    invoke-virtual {v3}, Lorg/json/JSONException;->printStackTrace()V

    goto :goto_6

    .line 281
    .end local v2    # "deviceAttributes":Lorg/json/JSONObject;
    .end local v3    # "e":Lorg/json/JSONException;
    :cond_e
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/belkin/wemo/cache/devicelist/runnable/SetDeviceStateRunnable;->mDeviceInfo:Lcom/belkin/wemo/cache/data/DeviceInformation;

    const/4 v14, 0x0

    invoke-virtual {v13, v14}, Lcom/belkin/wemo/cache/data/DeviceInformation;->setInActive(I)V

    .line 282
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/belkin/wemo/cache/devicelist/runnable/SetDeviceStateRunnable;->mDeviceInfo:Lcom/belkin/wemo/cache/data/DeviceInformation;

    const/4 v14, 0x1

    invoke-virtual {v13, v14}, Lcom/belkin/wemo/cache/data/DeviceInformation;->setIsDiscovered(Z)V

    .line 283
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/belkin/wemo/cache/devicelist/runnable/SetDeviceStateRunnable;->context:Landroid/content/Context;

    invoke-static {v13}, Lcom/belkin/wemo/cache/data/DevicesArray;->getInstance(Landroid/content/Context;)Lcom/belkin/wemo/cache/data/DevicesArray;

    move-result-object v13

    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/belkin/wemo/cache/devicelist/runnable/SetDeviceStateRunnable;->mDeviceInfo:Lcom/belkin/wemo/cache/data/DeviceInformation;

    invoke-virtual {v13, v14}, Lcom/belkin/wemo/cache/data/DevicesArray;->addOrUpdateDeviceInformation(Lcom/belkin/wemo/cache/data/DeviceInformation;)V

    .line 284
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/belkin/wemo/cache/devicelist/runnable/SetDeviceStateRunnable;->context:Landroid/content/Context;

    invoke-static {v13}, Lcom/belkin/wemo/cache/CacheManager;->getInstance(Landroid/content/Context;)Lcom/belkin/wemo/cache/CacheManager;

    move-result-object v13

    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/belkin/wemo/cache/devicelist/runnable/SetDeviceStateRunnable;->mDeviceInfo:Lcom/belkin/wemo/cache/data/DeviceInformation;

    const/4 v15, 0x0

    const/16 v16, 0x0

    const/16 v17, 0x1

    invoke-virtual/range {v13 .. v17}, Lcom/belkin/wemo/cache/CacheManager;->updateDB(Lcom/belkin/wemo/cache/data/DeviceInformation;ZZZ)V

    goto/16 :goto_0
.end method


# virtual methods
.method public run()V
    .locals 15

    .prologue
    .line 48
    const/4 v10, 0x1

    invoke-static {v10}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v7

    .line 49
    .local v7, "result":Ljava/lang/Boolean;
    iget-object v10, p0, Lcom/belkin/wemo/cache/devicelist/runnable/SetDeviceStateRunnable;->params:[Ljava/lang/Object;

    const/4 v11, 0x1

    aget-object v9, v10, v11

    check-cast v9, Ljava/lang/String;

    .line 51
    .local v9, "udn":Ljava/lang/String;
    iget-object v10, p0, Lcom/belkin/wemo/cache/devicelist/runnable/SetDeviceStateRunnable;->context:Landroid/content/Context;

    invoke-static {v10}, Lcom/belkin/wemo/cache/data/DevicesArray;->getInstance(Landroid/content/Context;)Lcom/belkin/wemo/cache/data/DevicesArray;

    move-result-object v10

    invoke-virtual {v10, v9}, Lcom/belkin/wemo/cache/data/DevicesArray;->getDeviceInformation(Ljava/lang/String;)Lcom/belkin/wemo/cache/data/DeviceInformation;

    move-result-object v10

    iput-object v10, p0, Lcom/belkin/wemo/cache/devicelist/runnable/SetDeviceStateRunnable;->mDeviceInfo:Lcom/belkin/wemo/cache/data/DeviceInformation;

    .line 52
    iget-object v10, p0, Lcom/belkin/wemo/cache/devicelist/runnable/SetDeviceStateRunnable;->mDeviceInfo:Lcom/belkin/wemo/cache/data/DeviceInformation;

    if-eqz v10, :cond_11

    .line 53
    iget-object v10, p0, Lcom/belkin/wemo/cache/devicelist/runnable/SetDeviceStateRunnable;->mDeviceInfo:Lcom/belkin/wemo/cache/data/DeviceInformation;

    invoke-virtual {v10}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getDevice()Lorg/cybergarage/upnp/Device;

    move-result-object v3

    .line 54
    .local v3, "device":Lorg/cybergarage/upnp/Device;
    if-nez v3, :cond_0

    .line 55
    iget-object v10, p0, Lcom/belkin/wemo/cache/devicelist/runnable/SetDeviceStateRunnable;->TAG:Ljava/lang/String;

    const-string v11, "SetDeviceStateRunnable device is null"

    invoke-static {v10, v11}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 56
    iget-object v10, p0, Lcom/belkin/wemo/cache/devicelist/runnable/SetDeviceStateRunnable;->devListManager:Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    invoke-virtual {v10}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->getUpnpControl()Lorg/cybergarage/upnp/ControlPoint;

    move-result-object v2

    .line 57
    .local v2, "controlPoint":Lorg/cybergarage/upnp/ControlPoint;
    if-eqz v2, :cond_0

    .line 58
    invoke-virtual {v2, v9}, Lorg/cybergarage/upnp/ControlPoint;->getDevice(Ljava/lang/String;)Lorg/cybergarage/upnp/Device;

    move-result-object v3

    .line 61
    .end local v2    # "controlPoint":Lorg/cybergarage/upnp/ControlPoint;
    :cond_0
    iget-object v10, p0, Lcom/belkin/wemo/cache/devicelist/runnable/SetDeviceStateRunnable;->TAG:Ljava/lang/String;

    new-instance v11, Ljava/lang/StringBuilder;

    invoke-direct {v11}, Ljava/lang/StringBuilder;-><init>()V

    const-string v12, "SetDeviceStateRunnable mDeviceInfo.getDevice()::"

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    iget-object v12, p0, Lcom/belkin/wemo/cache/devicelist/runnable/SetDeviceStateRunnable;->mDeviceInfo:Lcom/belkin/wemo/cache/data/DeviceInformation;

    invoke-virtual {v12}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getDevice()Lorg/cybergarage/upnp/Device;

    move-result-object v12

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v11

    const-string v12, " UDN: "

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v11

    invoke-static {v10, v11}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 63
    if-eqz v3, :cond_10

    .line 64
    const/4 v0, 0x0

    .line 66
    .local v0, "action":Lorg/cybergarage/upnp/Action;
    :try_start_0
    invoke-static {v9}, Lcom/belkin/wemo/cache/utils/IsDevice;->Crockpot(Ljava/lang/String;)Z

    move-result v10

    if-eqz v10, :cond_6

    .line 67
    iget-object v10, p0, Lcom/belkin/wemo/cache/devicelist/runnable/SetDeviceStateRunnable;->params:[Ljava/lang/Object;

    const/4 v11, 0x0

    aget-object v10, v10, v11

    check-cast v10, Ljava/lang/String;

    iput-object v10, p0, Lcom/belkin/wemo/cache/devicelist/runnable/SetDeviceStateRunnable;->mode:Ljava/lang/String;

    .line 68
    iget-object v10, p0, Lcom/belkin/wemo/cache/devicelist/runnable/SetDeviceStateRunnable;->params:[Ljava/lang/Object;

    const/4 v11, 0x2

    aget-object v10, v10, v11

    check-cast v10, Ljava/lang/String;

    iput-object v10, p0, Lcom/belkin/wemo/cache/devicelist/runnable/SetDeviceStateRunnable;->time:Ljava/lang/String;

    .line 69
    const-string v10, "SetCrockpotState"

    invoke-virtual {v3, v10}, Lorg/cybergarage/upnp/Device;->getAction(Ljava/lang/String;)Lorg/cybergarage/upnp/Action;

    move-result-object v0

    .line 70
    if-nez v0, :cond_1

    .line 71
    const/4 v10, 0x0

    invoke-static {v10}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v7

    .line 72
    invoke-direct {p0, v7}, Lcom/belkin/wemo/cache/devicelist/runnable/SetDeviceStateRunnable;->processResult(Ljava/lang/Boolean;)V

    .line 167
    .end local v0    # "action":Lorg/cybergarage/upnp/Action;
    .end local v3    # "device":Lorg/cybergarage/upnp/Device;
    :goto_0
    return-void

    .line 75
    .restart local v0    # "action":Lorg/cybergarage/upnp/Action;
    .restart local v3    # "device":Lorg/cybergarage/upnp/Device;
    :cond_1
    iget-object v10, p0, Lcom/belkin/wemo/cache/devicelist/runnable/SetDeviceStateRunnable;->devListManager:Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    const/4 v11, 0x2

    new-array v11, v11, [Ljava/lang/String;

    const/4 v12, 0x0

    const-string v13, "mode"

    aput-object v13, v11, v12

    const/4 v12, 0x1

    const-string v13, "time"

    aput-object v13, v11, v12

    const/4 v12, 0x2

    new-array v12, v12, [Ljava/lang/String;

    const/4 v13, 0x0

    iget-object v14, p0, Lcom/belkin/wemo/cache/devicelist/runnable/SetDeviceStateRunnable;->mode:Ljava/lang/String;

    aput-object v14, v12, v13

    const/4 v13, 0x1

    iget-object v14, p0, Lcom/belkin/wemo/cache/devicelist/runnable/SetDeviceStateRunnable;->time:Ljava/lang/String;

    aput-object v14, v12, v13

    invoke-virtual {v10, v0, v11, v12}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->setArgument(Lorg/cybergarage/upnp/Action;[Ljava/lang/String;[Ljava/lang/String;)V

    .line 76
    iget-object v10, p0, Lcom/belkin/wemo/cache/devicelist/runnable/SetDeviceStateRunnable;->TAG:Ljava/lang/String;

    const-string v11, "SetDeviceStateRunnable setCrockpotState"

    invoke-static {v10, v11}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 134
    :cond_2
    :goto_1
    iget-object v10, p0, Lcom/belkin/wemo/cache/devicelist/runnable/SetDeviceStateRunnable;->TAG:Ljava/lang/String;

    new-instance v11, Ljava/lang/StringBuilder;

    invoke-direct {v11}, Ljava/lang/StringBuilder;-><init>()V

    const-string v12, "SetDeviceStateRunnable Action:"

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v11

    invoke-static {v10, v11}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 136
    iget-object v10, p0, Lcom/belkin/wemo/cache/devicelist/runnable/SetDeviceStateRunnable;->executedActions:Lorg/json/JSONArray;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    if-nez v10, :cond_3

    .line 138
    :try_start_1
    invoke-virtual {v0}, Lorg/cybergarage/upnp/Action;->postControlAction()Ljava/lang/String;

    move-result-object v10

    iput-object v10, p0, Lcom/belkin/wemo/cache/devicelist/runnable/SetDeviceStateRunnable;->actionResult:Ljava/lang/String;

    .line 139
    iget-object v10, p0, Lcom/belkin/wemo/cache/devicelist/runnable/SetDeviceStateRunnable;->TAG:Ljava/lang/String;

    new-instance v11, Ljava/lang/StringBuilder;

    invoke-direct {v11}, Ljava/lang/StringBuilder;-><init>()V

    const-string v12, "SetDeviceStateRunnable action response)::"

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    iget-object v12, p0, Lcom/belkin/wemo/cache/devicelist/runnable/SetDeviceStateRunnable;->actionResult:Ljava/lang/String;

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v11

    invoke-static {v10, v11}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_2

    .line 146
    :cond_3
    :try_start_2
    iget-object v10, p0, Lcom/belkin/wemo/cache/devicelist/runnable/SetDeviceStateRunnable;->actionResult:Ljava/lang/String;

    if-eqz v10, :cond_4

    iget-object v10, p0, Lcom/belkin/wemo/cache/devicelist/runnable/SetDeviceStateRunnable;->actionResult:Ljava/lang/String;

    sget-object v11, Lcom/belkin/wemo/cache/devicelist/UpnpConstants;->ERROR:Ljava/lang/String;

    invoke-virtual {v10, v11}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v10

    if-eqz v10, :cond_5

    .line 147
    :cond_4
    iget-object v10, p0, Lcom/belkin/wemo/cache/devicelist/runnable/SetDeviceStateRunnable;->actionResult:Ljava/lang/String;

    const-string v11, "<errorCode>600</errorCode>"

    invoke-virtual {v10, v11}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v10

    if-eqz v10, :cond_f

    .line 149
    iget-object v10, p0, Lcom/belkin/wemo/cache/devicelist/runnable/SetDeviceStateRunnable;->TAG:Ljava/lang/String;

    new-instance v11, Ljava/lang/StringBuilder;

    invoke-direct {v11}, Ljava/lang/StringBuilder;-><init>()V

    const-string v12, "State of device was ALREADY set. UDN: "

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    const-string v12, "; Current State: "

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    iget-object v12, p0, Lcom/belkin/wemo/cache/devicelist/runnable/SetDeviceStateRunnable;->changedState:Ljava/lang/String;

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v11

    invoke-static {v10, v11}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->debugLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 150
    iget-object v10, p0, Lcom/belkin/wemo/cache/devicelist/runnable/SetDeviceStateRunnable;->devListManager:Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    const-string v11, "set_state"

    const-string v12, "true"

    invoke-virtual {v10, v11, v12, v9}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->sendNotification(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0

    goto/16 :goto_0

    .line 155
    :catch_0
    move-exception v4

    .line 156
    .local v4, "e":Ljava/lang/Exception;
    invoke-virtual {v4}, Ljava/lang/Exception;->printStackTrace()V

    .line 157
    const/4 v10, 0x0

    invoke-static {v10}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v7

    .line 166
    .end local v0    # "action":Lorg/cybergarage/upnp/Action;
    .end local v3    # "device":Lorg/cybergarage/upnp/Device;
    .end local v4    # "e":Ljava/lang/Exception;
    :cond_5
    :goto_2
    invoke-direct {p0, v7}, Lcom/belkin/wemo/cache/devicelist/runnable/SetDeviceStateRunnable;->processResult(Ljava/lang/Boolean;)V

    goto/16 :goto_0

    .line 77
    .restart local v0    # "action":Lorg/cybergarage/upnp/Action;
    .restart local v3    # "device":Lorg/cybergarage/upnp/Device;
    :cond_6
    :try_start_3
    invoke-static {v9}, Lcom/belkin/wemo/cache/utils/IsDevice;->Insight(Ljava/lang/String;)Z

    move-result v10

    if-eqz v10, :cond_b

    iget-object v10, p0, Lcom/belkin/wemo/cache/devicelist/runnable/SetDeviceStateRunnable;->params:[Ljava/lang/Object;

    array-length v10, v10

    const/4 v11, 0x2

    if-le v10, v11, :cond_b

    .line 78
    iget-object v10, p0, Lcom/belkin/wemo/cache/devicelist/runnable/SetDeviceStateRunnable;->params:[Ljava/lang/Object;

    const/4 v11, 0x0

    aget-object v10, v10, v11

    check-cast v10, Lorg/json/JSONArray;

    iput-object v10, p0, Lcom/belkin/wemo/cache/devicelist/runnable/SetDeviceStateRunnable;->executedActions:Lorg/json/JSONArray;

    .line 79
    iget-object v10, p0, Lcom/belkin/wemo/cache/devicelist/runnable/SetDeviceStateRunnable;->params:[Ljava/lang/Object;

    const/4 v11, 0x2

    aget-object v10, v10, v11

    check-cast v10, Lorg/json/JSONArray;

    iput-object v10, p0, Lcom/belkin/wemo/cache/devicelist/runnable/SetDeviceStateRunnable;->changedValues:Lorg/json/JSONArray;

    .line 80
    const/4 v1, 0x0

    .line 81
    .local v1, "args":[Ljava/lang/String;
    const/4 v6, 0x0

    .local v6, "i":I
    :goto_3
    iget-object v10, p0, Lcom/belkin/wemo/cache/devicelist/runnable/SetDeviceStateRunnable;->executedActions:Lorg/json/JSONArray;

    invoke-virtual {v10}, Lorg/json/JSONArray;->length()I

    move-result v10

    if-ge v6, v10, :cond_2

    .line 82
    iget-object v10, p0, Lcom/belkin/wemo/cache/devicelist/runnable/SetDeviceStateRunnable;->executedActions:Lorg/json/JSONArray;

    invoke-virtual {v10, v6}, Lorg/json/JSONArray;->get(I)Ljava/lang/Object;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v5

    .line 83
    .local v5, "executeAction":Ljava/lang/String;
    invoke-virtual {v3, v5}, Lorg/cybergarage/upnp/Device;->getAction(Ljava/lang/String;)Lorg/cybergarage/upnp/Action;

    move-result-object v0

    .line 84
    if-nez v0, :cond_7

    .line 85
    const/4 v10, 0x0

    invoke-static {v10}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v7

    .line 86
    invoke-direct {p0, v7}, Lcom/belkin/wemo/cache/devicelist/runnable/SetDeviceStateRunnable;->processResult(Ljava/lang/Boolean;)V

    goto/16 :goto_0

    .line 89
    :cond_7
    const-string v10, "SetInsightHomeSettings"

    invoke-virtual {v5, v10}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v10

    if-eqz v10, :cond_9

    .line 90
    sget-object v1, Lcom/belkin/wemo/cache/devicelist/UpnpConstants;->ENERGY_PER_UNIT_COST_DATA:[Ljava/lang/String;

    .line 96
    :cond_8
    :goto_4
    iget-object v11, p0, Lcom/belkin/wemo/cache/devicelist/runnable/SetDeviceStateRunnable;->devListManager:Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    iget-object v10, p0, Lcom/belkin/wemo/cache/devicelist/runnable/SetDeviceStateRunnable;->changedValues:Lorg/json/JSONArray;

    invoke-virtual {v10, v6}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v10

    invoke-virtual {v10, v5}, Lorg/json/JSONObject;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v10

    check-cast v10, [Ljava/lang/String;

    check-cast v10, [Ljava/lang/String;

    invoke-virtual {v11, v0, v1, v10}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->setArgument(Lorg/cybergarage/upnp/Action;[Ljava/lang/String;[Ljava/lang/String;)V
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_0

    .line 98
    :try_start_4
    invoke-virtual {v0}, Lorg/cybergarage/upnp/Action;->postControlAction()Ljava/lang/String;

    move-result-object v10

    iput-object v10, p0, Lcom/belkin/wemo/cache/devicelist/runnable/SetDeviceStateRunnable;->actionResult:Ljava/lang/String;

    .line 99
    iget-object v10, p0, Lcom/belkin/wemo/cache/devicelist/runnable/SetDeviceStateRunnable;->TAG:Ljava/lang/String;

    new-instance v11, Ljava/lang/StringBuilder;

    invoke-direct {v11}, Ljava/lang/StringBuilder;-><init>()V

    const-string v12, "SetDeviceStateRunnable action response)::"

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    iget-object v12, p0, Lcom/belkin/wemo/cache/devicelist/runnable/SetDeviceStateRunnable;->actionResult:Ljava/lang/String;

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v11

    invoke-static {v10, v11}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_1

    .line 81
    add-int/lit8 v6, v6, 0x1

    goto :goto_3

    .line 91
    :cond_9
    :try_start_5
    const-string v10, "SetPowerThreshold"

    invoke-virtual {v5, v10}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v10

    if-eqz v10, :cond_a

    .line 92
    sget-object v1, Lcom/belkin/wemo/cache/devicelist/UpnpConstants;->POWER_THRESHOLD:[Ljava/lang/String;

    goto :goto_4

    .line 93
    :cond_a
    const-string v10, "ScheduleDataExport"

    invoke-virtual {v5, v10}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v10

    if-eqz v10, :cond_8

    .line 94
    sget-object v1, Lcom/belkin/wemo/cache/devicelist/UpnpConstants;->SCHEDULE_DATA_EXPORT_ARGS:[Ljava/lang/String;

    goto :goto_4

    .line 100
    :catch_1
    move-exception v4

    .line 101
    .restart local v4    # "e":Ljava/lang/Exception;
    const/4 v10, 0x0

    invoke-static {v10}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v7

    .line 102
    invoke-direct {p0, v7}, Lcom/belkin/wemo/cache/devicelist/runnable/SetDeviceStateRunnable;->processResult(Ljava/lang/Boolean;)V

    goto/16 :goto_0

    .line 108
    .end local v1    # "args":[Ljava/lang/String;
    .end local v4    # "e":Ljava/lang/Exception;
    .end local v5    # "executeAction":Ljava/lang/String;
    .end local v6    # "i":I
    :cond_b
    invoke-static {v9}, Lcom/belkin/wemo/cache/utils/IsDevice;->Dimmer(Ljava/lang/String;)Z

    move-result v10

    if-eqz v10, :cond_d

    .line 109
    iget-object v10, p0, Lcom/belkin/wemo/cache/devicelist/runnable/SetDeviceStateRunnable;->params:[Ljava/lang/Object;

    const/4 v11, 0x0

    aget-object v10, v10, v11

    check-cast v10, Ljava/lang/String;

    iput-object v10, p0, Lcom/belkin/wemo/cache/devicelist/runnable/SetDeviceStateRunnable;->changedState:Ljava/lang/String;

    .line 110
    iget-object v10, p0, Lcom/belkin/wemo/cache/devicelist/runnable/SetDeviceStateRunnable;->params:[Ljava/lang/Object;

    const/4 v11, 0x2

    aget-object v10, v10, v11

    check-cast v10, Ljava/lang/String;

    iput-object v10, p0, Lcom/belkin/wemo/cache/devicelist/runnable/SetDeviceStateRunnable;->changedBrightness:Ljava/lang/String;

    .line 111
    iget-object v10, p0, Lcom/belkin/wemo/cache/devicelist/runnable/SetDeviceStateRunnable;->params:[Ljava/lang/Object;

    const/4 v11, 0x3

    aget-object v10, v10, v11

    check-cast v10, Ljava/lang/String;

    iput-object v10, p0, Lcom/belkin/wemo/cache/devicelist/runnable/SetDeviceStateRunnable;->changedFader:Ljava/lang/String;

    .line 112
    const-string v10, "SetBinaryState"

    invoke-virtual {v3, v10}, Lorg/cybergarage/upnp/Device;->getAction(Ljava/lang/String;)Lorg/cybergarage/upnp/Action;

    move-result-object v0

    .line 113
    if-eqz v0, :cond_c

    .line 114
    const-string v10, "brightness"

    iget-object v11, p0, Lcom/belkin/wemo/cache/devicelist/runnable/SetDeviceStateRunnable;->changedBrightness:Ljava/lang/String;

    invoke-virtual {v0, v10, v11}, Lorg/cybergarage/upnp/Action;->setArgumentValue(Ljava/lang/String;Ljava/lang/String;)V

    .line 115
    const-string v10, "fader"

    iget-object v11, p0, Lcom/belkin/wemo/cache/devicelist/runnable/SetDeviceStateRunnable;->changedFader:Ljava/lang/String;

    invoke-virtual {v0, v10, v11}, Lorg/cybergarage/upnp/Action;->setArgumentValue(Ljava/lang/String;Ljava/lang/String;)V

    .line 116
    sget-object v10, Lcom/belkin/wemo/cache/devicelist/UpnpConstants;->SET_BINARY_STATE_ARGS:[Ljava/lang/String;

    const/4 v11, 0x0

    aget-object v10, v10, v11

    iget-object v11, p0, Lcom/belkin/wemo/cache/devicelist/runnable/SetDeviceStateRunnable;->changedState:Ljava/lang/String;

    invoke-virtual {v0, v10, v11}, Lorg/cybergarage/upnp/Action;->setArgumentValue(Ljava/lang/String;Ljava/lang/String;)V

    goto/16 :goto_1

    .line 118
    :cond_c
    iget-object v10, p0, Lcom/belkin/wemo/cache/devicelist/runnable/SetDeviceStateRunnable;->TAG:Ljava/lang/String;

    const-string v11, "SetDeviceStateRunnable Dimmer SetBinaryState Action is null"

    invoke-static {v10, v11}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 119
    const/4 v10, 0x0

    invoke-static {v10}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v7

    .line 120
    invoke-direct {p0, v7}, Lcom/belkin/wemo/cache/devicelist/runnable/SetDeviceStateRunnable;->processResult(Ljava/lang/Boolean;)V

    goto/16 :goto_0

    .line 124
    :cond_d
    iget-object v10, p0, Lcom/belkin/wemo/cache/devicelist/runnable/SetDeviceStateRunnable;->params:[Ljava/lang/Object;

    const/4 v11, 0x0

    aget-object v8, v10, v11

    check-cast v8, Ljava/lang/String;

    .line 125
    .local v8, "state":Ljava/lang/String;
    iput-object v8, p0, Lcom/belkin/wemo/cache/devicelist/runnable/SetDeviceStateRunnable;->changedState:Ljava/lang/String;

    .line 126
    const-string v10, "SetBinaryState"

    invoke-virtual {v3, v10}, Lorg/cybergarage/upnp/Device;->getAction(Ljava/lang/String;)Lorg/cybergarage/upnp/Action;

    move-result-object v0

    .line 127
    if-nez v0, :cond_e

    .line 128
    const/4 v10, 0x0

    invoke-static {v10}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v7

    .line 129
    invoke-direct {p0, v7}, Lcom/belkin/wemo/cache/devicelist/runnable/SetDeviceStateRunnable;->processResult(Ljava/lang/Boolean;)V

    goto/16 :goto_0

    .line 132
    :cond_e
    iget-object v10, p0, Lcom/belkin/wemo/cache/devicelist/runnable/SetDeviceStateRunnable;->devListManager:Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    sget-object v11, Lcom/belkin/wemo/cache/devicelist/UpnpConstants;->SET_BINARY_STATE_ARGS:[Ljava/lang/String;

    const/4 v12, 0x1

    new-array v12, v12, [Ljava/lang/String;

    const/4 v13, 0x0

    aput-object v8, v12, v13

    invoke-virtual {v10, v0, v11, v12}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->setArgument(Lorg/cybergarage/upnp/Action;[Ljava/lang/String;[Ljava/lang/String;)V

    goto/16 :goto_1

    .line 140
    .end local v8    # "state":Ljava/lang/String;
    :catch_2
    move-exception v4

    .line 141
    .restart local v4    # "e":Ljava/lang/Exception;
    const/4 v10, 0x0

    invoke-static {v10}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v7

    .line 142
    invoke-direct {p0, v7}, Lcom/belkin/wemo/cache/devicelist/runnable/SetDeviceStateRunnable;->processResult(Ljava/lang/Boolean;)V

    goto/16 :goto_0

    .line 153
    .end local v4    # "e":Ljava/lang/Exception;
    :cond_f
    const/4 v10, 0x0

    invoke-static {v10}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;
    :try_end_5
    .catch Ljava/lang/Exception; {:try_start_5 .. :try_end_5} :catch_0

    move-result-object v7

    goto/16 :goto_2

    .line 160
    .end local v0    # "action":Lorg/cybergarage/upnp/Action;
    :cond_10
    const/4 v10, 0x0

    invoke-static {v10}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v7

    goto/16 :goto_2

    .line 163
    .end local v3    # "device":Lorg/cybergarage/upnp/Device;
    :cond_11
    iget-object v10, p0, Lcom/belkin/wemo/cache/devicelist/runnable/SetDeviceStateRunnable;->TAG:Ljava/lang/String;

    const-string v11, "SetDeviceStateRunnable: FAILED to change state as DeviceInfo Object is NULL."

    invoke-static {v10, v11}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 164
    const/4 v10, 0x0

    invoke-static {v10}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v7

    goto/16 :goto_2
.end method
