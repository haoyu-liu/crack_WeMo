.class Lcom/belkin/controller/DeviceListController$FetchDevicesRulesCallback;
.super Ljava/lang/Object;
.source "DeviceListController.java"

# interfaces
.implements Lcom/belkin/wemo/rules/callback/FetchRulesAndSyncErrorCallback;
.implements Lcom/belkin/wemo/rules/callback/FetchRulesAndSyncSuccessCallback;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/belkin/controller/DeviceListController;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "FetchDevicesRulesCallback"
.end annotation


# static fields
.field private static final TAG:Ljava/lang/String; = "FetchDevicesRulesCallback - DeviceListController"


# instance fields
.field private device:Lorg/json/JSONObject;

.field private errorCallback:Lcom/belkin/wemo/cache/devicelist/callback/PluginResultErrorCallback;

.field private resetType:Ljava/lang/String;

.field private stateData:Lorg/json/JSONObject;

.field private successCallback:Lcom/belkin/wemo/cache/devicelist/callback/PluginResultSuccessCallback;

.field final synthetic this$0:Lcom/belkin/controller/DeviceListController;


# direct methods
.method public constructor <init>(Lcom/belkin/controller/DeviceListController;Lcom/belkin/wemo/cache/devicelist/callback/PluginResultErrorCallback;Lcom/belkin/wemo/cache/devicelist/callback/PluginResultSuccessCallback;Ljava/lang/String;Lorg/json/JSONObject;Lorg/json/JSONObject;)V
    .locals 0
    .param p2, "errorCallback"    # Lcom/belkin/wemo/cache/devicelist/callback/PluginResultErrorCallback;
    .param p3, "successCallback"    # Lcom/belkin/wemo/cache/devicelist/callback/PluginResultSuccessCallback;
    .param p4, "resetType"    # Ljava/lang/String;
    .param p5, "device"    # Lorg/json/JSONObject;
    .param p6, "stateData"    # Lorg/json/JSONObject;

    .prologue
    .line 1374
    iput-object p1, p0, Lcom/belkin/controller/DeviceListController$FetchDevicesRulesCallback;->this$0:Lcom/belkin/controller/DeviceListController;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 1375
    iput-object p4, p0, Lcom/belkin/controller/DeviceListController$FetchDevicesRulesCallback;->resetType:Ljava/lang/String;

    .line 1376
    iput-object p5, p0, Lcom/belkin/controller/DeviceListController$FetchDevicesRulesCallback;->device:Lorg/json/JSONObject;

    .line 1377
    iput-object p6, p0, Lcom/belkin/controller/DeviceListController$FetchDevicesRulesCallback;->stateData:Lorg/json/JSONObject;

    .line 1378
    iput-object p2, p0, Lcom/belkin/controller/DeviceListController$FetchDevicesRulesCallback;->errorCallback:Lcom/belkin/wemo/cache/devicelist/callback/PluginResultErrorCallback;

    .line 1379
    iput-object p3, p0, Lcom/belkin/controller/DeviceListController$FetchDevicesRulesCallback;->successCallback:Lcom/belkin/wemo/cache/devicelist/callback/PluginResultSuccessCallback;

    .line 1380
    return-void
.end method

.method private resetDevice()V
    .locals 10

    .prologue
    .line 1384
    :try_start_0
    invoke-static {}, Lcom/belkin/controller/DeviceListController;->access$200()Lcom/belkin/controller/DeviceListController;

    move-result-object v0

    iget-object v1, p0, Lcom/belkin/controller/DeviceListController$FetchDevicesRulesCallback;->errorCallback:Lcom/belkin/wemo/cache/devicelist/callback/PluginResultErrorCallback;

    iget-object v2, p0, Lcom/belkin/controller/DeviceListController$FetchDevicesRulesCallback;->successCallback:Lcom/belkin/wemo/cache/devicelist/callback/PluginResultSuccessCallback;

    iget-object v3, p0, Lcom/belkin/controller/DeviceListController$FetchDevicesRulesCallback;->resetType:Ljava/lang/String;

    iget-object v4, p0, Lcom/belkin/controller/DeviceListController$FetchDevicesRulesCallback;->device:Lorg/json/JSONObject;

    iget-object v5, p0, Lcom/belkin/controller/DeviceListController$FetchDevicesRulesCallback;->stateData:Lorg/json/JSONObject;

    const/4 v6, 0x1

    new-array v6, v6, [Ljava/lang/Boolean;

    const/4 v8, 0x0

    const/4 v9, 0x1

    invoke-static {v9}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v9

    aput-object v9, v6, v8

    invoke-virtual/range {v0 .. v6}, Lcom/belkin/controller/DeviceListController;->resetDevice(Lcom/belkin/wemo/cache/devicelist/callback/PluginResultErrorCallback;Lcom/belkin/wemo/cache/devicelist/callback/PluginResultSuccessCallback;Ljava/lang/String;Lorg/json/JSONObject;Lorg/json/JSONObject;[Ljava/lang/Boolean;)Lorg/json/JSONObject;
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 1390
    :goto_0
    return-void

    .line 1385
    :catch_0
    move-exception v7

    .line 1387
    .local v7, "e":Lorg/json/JSONException;
    const-string v0, "FetchDevicesRulesCallback - DeviceListController"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Exception in resetDevice() e:"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/belkin/utils/LogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 1388
    invoke-virtual {v7}, Lorg/json/JSONException;->printStackTrace()V

    goto :goto_0
.end method


# virtual methods
.method public onError()V
    .locals 2

    .prologue
    .line 1394
    const-string v0, "FetchDevicesRulesCallback - DeviceListController"

    const-string v1, "FetchDevicerulesCallback: error during fetchRules(), calling resetDevice again."

    invoke-static {v0, v1}, Lcom/belkin/utils/LogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 1395
    invoke-direct {p0}, Lcom/belkin/controller/DeviceListController$FetchDevicesRulesCallback;->resetDevice()V

    .line 1396
    return-void
.end method

.method public onSuccess(Ljava/lang/String;I)V
    .locals 2
    .param p1, "rules"    # Ljava/lang/String;
    .param p2, "latestDBVersion"    # I

    .prologue
    .line 1400
    const-string v0, "FetchDevicesRulesCallback - DeviceListController"

    const-string v1, "FetchDevicerulesCallback: fetchRules() succeeded, calling resetDevice again."

    invoke-static {v0, v1}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 1401
    invoke-direct {p0}, Lcom/belkin/controller/DeviceListController$FetchDevicesRulesCallback;->resetDevice()V

    .line 1402
    return-void
.end method
