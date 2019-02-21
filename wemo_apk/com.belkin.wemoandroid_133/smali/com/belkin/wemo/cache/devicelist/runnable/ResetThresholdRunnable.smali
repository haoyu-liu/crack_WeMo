.class public Lcom/belkin/wemo/cache/devicelist/runnable/ResetThresholdRunnable;
.super Lcom/belkin/wemo/runnable/WeMoRunnable;
.source "ResetThresholdRunnable.java"

# interfaces
.implements Lcom/belkin/wemo/controlaction/callback/ControlActionSuccessCallback;
.implements Lcom/belkin/wemo/controlaction/callback/ControlActionErrorCallback;


# instance fields
.field private errorCallback:Lcom/belkin/wemo/cache/devicelist/callback/PluginResultErrorCallback;

.field private mDLM:Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

.field private mResetType:Ljava/lang/String;

.field private successCallback:Lcom/belkin/wemo/cache/devicelist/callback/PluginResultSuccessCallback;

.field private udn:Ljava/lang/String;


# direct methods
.method public constructor <init>(Lcom/belkin/wemo/cache/devicelist/callback/PluginResultErrorCallback;Lcom/belkin/wemo/cache/devicelist/callback/PluginResultSuccessCallback;Ljava/lang/String;Lcom/belkin/wemo/cache/devicelist/DeviceListManager;Ljava/lang/String;)V
    .locals 0
    .param p1, "errorCallback"    # Lcom/belkin/wemo/cache/devicelist/callback/PluginResultErrorCallback;
    .param p2, "successCallback"    # Lcom/belkin/wemo/cache/devicelist/callback/PluginResultSuccessCallback;
    .param p3, "resetType"    # Ljava/lang/String;
    .param p4, "oDLM"    # Lcom/belkin/wemo/cache/devicelist/DeviceListManager;
    .param p5, "udn"    # Ljava/lang/String;

    .prologue
    .line 30
    invoke-direct {p0}, Lcom/belkin/wemo/runnable/WeMoRunnable;-><init>()V

    .line 31
    iput-object p4, p0, Lcom/belkin/wemo/cache/devicelist/runnable/ResetThresholdRunnable;->mDLM:Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    .line 32
    iput-object p5, p0, Lcom/belkin/wemo/cache/devicelist/runnable/ResetThresholdRunnable;->udn:Ljava/lang/String;

    .line 33
    iput-object p3, p0, Lcom/belkin/wemo/cache/devicelist/runnable/ResetThresholdRunnable;->mResetType:Ljava/lang/String;

    .line 34
    iput-object p1, p0, Lcom/belkin/wemo/cache/devicelist/runnable/ResetThresholdRunnable;->errorCallback:Lcom/belkin/wemo/cache/devicelist/callback/PluginResultErrorCallback;

    .line 35
    iput-object p2, p0, Lcom/belkin/wemo/cache/devicelist/runnable/ResetThresholdRunnable;->successCallback:Lcom/belkin/wemo/cache/devicelist/callback/PluginResultSuccessCallback;

    .line 36
    return-void
.end method

.method private processNewPowerThreshold(Ljava/lang/String;)Z
    .locals 5
    .param p1, "newPowerThreshold"    # Ljava/lang/String;

    .prologue
    .line 94
    const/4 v2, 0x0

    .line 96
    .local v2, "isProcessed":Z
    iget-object v3, p0, Lcom/belkin/wemo/cache/devicelist/runnable/ResetThresholdRunnable;->mDLM:Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    iget-object v4, p0, Lcom/belkin/wemo/cache/devicelist/runnable/ResetThresholdRunnable;->udn:Ljava/lang/String;

    invoke-virtual {v3, v4}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->getDeviceInformationFromDevicesArray(Ljava/lang/String;)Lcom/belkin/wemo/cache/data/DeviceInformation;

    move-result-object v0

    .line 97
    .local v0, "devInfo":Lcom/belkin/wemo/cache/data/DeviceInformation;
    if-eqz v0, :cond_0

    .line 99
    :try_start_0
    const-string v3, "powerThreshold"

    invoke-virtual {v0, v3, p1}, Lcom/belkin/wemo/cache/data/DeviceInformation;->setAttributeValue(Ljava/lang/String;Ljava/lang/String;)V

    .line 100
    iget-object v3, p0, Lcom/belkin/wemo/cache/devicelist/runnable/ResetThresholdRunnable;->mDLM:Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    const/4 v4, 0x0

    invoke-virtual {v3, v0, v4}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->setDeviceInformationToDevicesArrayLocal(Lcom/belkin/wemo/cache/data/DeviceInformation;Z)V
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 101
    const/4 v2, 0x1

    .line 108
    :goto_0
    return v2

    .line 102
    :catch_0
    move-exception v1

    .line 103
    .local v1, "e":Lorg/json/JSONException;
    iget-object v3, p0, Lcom/belkin/wemo/cache/devicelist/runnable/ResetThresholdRunnable;->TAG:Ljava/lang/String;

    const-string v4, "JSONException while setting attribute value: "

    invoke-static {v3, v4, v1}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Exception;)V

    goto :goto_0

    .line 106
    .end local v1    # "e":Lorg/json/JSONException;
    :cond_0
    iget-object v3, p0, Lcom/belkin/wemo/cache/devicelist/runnable/ResetThresholdRunnable;->TAG:Ljava/lang/String;

    const-string v4, "Null device information in updateAttribute() : "

    invoke-static {v3, v4}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0
.end method


# virtual methods
.method public onActionError(Ljava/lang/Exception;)V
    .locals 2
    .param p1, "e"    # Ljava/lang/Exception;

    .prologue
    .line 71
    iget-object v0, p0, Lcom/belkin/wemo/cache/devicelist/runnable/ResetThresholdRunnable;->errorCallback:Lcom/belkin/wemo/cache/devicelist/callback/PluginResultErrorCallback;

    if-eqz v0, :cond_0

    .line 72
    iget-object v0, p0, Lcom/belkin/wemo/cache/devicelist/runnable/ResetThresholdRunnable;->errorCallback:Lcom/belkin/wemo/cache/devicelist/callback/PluginResultErrorCallback;

    invoke-virtual {p1}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1}, Lcom/belkin/wemo/cache/devicelist/callback/PluginResultErrorCallback;->onError(Ljava/lang/String;)V

    .line 74
    :cond_0
    return-void
.end method

.method public onActionSuccess(Ljava/lang/String;)V
    .locals 4
    .param p1, "responseXMLStr"    # Ljava/lang/String;

    .prologue
    .line 78
    new-instance v1, Lcom/belkin/wemo/localsdk/parser/ResetPowerThresholdResponse;

    invoke-direct {v1}, Lcom/belkin/wemo/localsdk/parser/ResetPowerThresholdResponse;-><init>()V

    invoke-virtual {v1, p1}, Lcom/belkin/wemo/localsdk/parser/ResetPowerThresholdResponse;->parsePowerThreshold(Ljava/lang/String;)I

    move-result v1

    invoke-static {v1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v0

    .line 79
    .local v0, "powerThreshold":Ljava/lang/String;
    iget-object v1, p0, Lcom/belkin/wemo/cache/devicelist/runnable/ResetThresholdRunnable;->TAG:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Power Threshold from FW after Reset: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->debugLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 82
    invoke-direct {p0, v0}, Lcom/belkin/wemo/cache/devicelist/runnable/ResetThresholdRunnable;->processNewPowerThreshold(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 83
    iget-object v1, p0, Lcom/belkin/wemo/cache/devicelist/runnable/ResetThresholdRunnable;->successCallback:Lcom/belkin/wemo/cache/devicelist/callback/PluginResultSuccessCallback;

    if-eqz v1, :cond_0

    .line 84
    iget-object v1, p0, Lcom/belkin/wemo/cache/devicelist/runnable/ResetThresholdRunnable;->successCallback:Lcom/belkin/wemo/cache/devicelist/callback/PluginResultSuccessCallback;

    invoke-interface {v1, v0}, Lcom/belkin/wemo/cache/devicelist/callback/PluginResultSuccessCallback;->onSuccess(Ljava/lang/String;)V

    .line 91
    :cond_0
    :goto_0
    return-void

    .line 87
    :cond_1
    iget-object v1, p0, Lcom/belkin/wemo/cache/devicelist/runnable/ResetThresholdRunnable;->errorCallback:Lcom/belkin/wemo/cache/devicelist/callback/PluginResultErrorCallback;

    if-eqz v1, :cond_0

    .line 88
    iget-object v1, p0, Lcom/belkin/wemo/cache/devicelist/runnable/ResetThresholdRunnable;->errorCallback:Lcom/belkin/wemo/cache/devicelist/callback/PluginResultErrorCallback;

    const-string v2, "Error while processing new power threshold."

    invoke-interface {v1, v2}, Lcom/belkin/wemo/cache/devicelist/callback/PluginResultErrorCallback;->onError(Ljava/lang/String;)V

    goto :goto_0
.end method

.method public run()V
    .locals 6

    .prologue
    .line 41
    :try_start_0
    iget-object v3, p0, Lcom/belkin/wemo/cache/devicelist/runnable/ResetThresholdRunnable;->mResetType:Ljava/lang/String;

    invoke-static {v3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v3

    if-nez v3, :cond_4

    .line 42
    iget-object v3, p0, Lcom/belkin/wemo/cache/devicelist/runnable/ResetThresholdRunnable;->mDLM:Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    invoke-virtual {v3}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->getUpnpControl()Lorg/cybergarage/upnp/ControlPoint;

    move-result-object v3

    iget-object v4, p0, Lcom/belkin/wemo/cache/devicelist/runnable/ResetThresholdRunnable;->udn:Ljava/lang/String;

    invoke-virtual {v3, v4}, Lorg/cybergarage/upnp/ControlPoint;->getDevice(Ljava/lang/String;)Lorg/cybergarage/upnp/Device;

    move-result-object v1

    .line 43
    .local v1, "device":Lorg/cybergarage/upnp/Device;
    if-eqz v1, :cond_3

    .line 44
    const/4 v0, 0x0

    .line 45
    .local v0, "action":Lorg/cybergarage/upnp/Action;
    iget-object v3, p0, Lcom/belkin/wemo/cache/devicelist/runnable/ResetThresholdRunnable;->mResetType:Ljava/lang/String;

    const-string v4, "resetThreshold"

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_2

    .line 46
    const-string v3, "ResetPowerThreshold"

    invoke-virtual {v1, v3}, Lorg/cybergarage/upnp/Device;->getAction(Ljava/lang/String;)Lorg/cybergarage/upnp/Action;

    move-result-object v0

    .line 50
    :cond_0
    :goto_0
    invoke-static {}, Lcom/belkin/wemo/controlaction/ControlActionHandler;->newInstance()Lcom/belkin/wemo/controlaction/ControlActionHandler;

    move-result-object v3

    invoke-virtual {v3, v0, p0, p0}, Lcom/belkin/wemo/controlaction/ControlActionHandler;->postControlAction(Lorg/cybergarage/upnp/Action;Lcom/belkin/wemo/controlaction/callback/ControlActionErrorCallback;Lcom/belkin/wemo/controlaction/callback/ControlActionSuccessCallback;)V

    .line 67
    .end local v0    # "action":Lorg/cybergarage/upnp/Action;
    .end local v1    # "device":Lorg/cybergarage/upnp/Device;
    :cond_1
    :goto_1
    return-void

    .line 47
    .restart local v0    # "action":Lorg/cybergarage/upnp/Action;
    .restart local v1    # "device":Lorg/cybergarage/upnp/Device;
    :cond_2
    iget-object v3, p0, Lcom/belkin/wemo/cache/devicelist/runnable/ResetThresholdRunnable;->mResetType:Ljava/lang/String;

    const-string v4, "resetAutoThreshold"

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 48
    const-string v3, "SetAutoPowerThreshold"

    invoke-virtual {v1, v3}, Lorg/cybergarage/upnp/Device;->getAction(Ljava/lang/String;)Lorg/cybergarage/upnp/Action;

    move-result-object v0

    goto :goto_0

    .line 52
    .end local v0    # "action":Lorg/cybergarage/upnp/Action;
    :cond_3
    iget-object v3, p0, Lcom/belkin/wemo/cache/devicelist/runnable/ResetThresholdRunnable;->errorCallback:Lcom/belkin/wemo/cache/devicelist/callback/PluginResultErrorCallback;

    if-eqz v3, :cond_1

    .line 53
    iget-object v3, p0, Lcom/belkin/wemo/cache/devicelist/runnable/ResetThresholdRunnable;->errorCallback:Lcom/belkin/wemo/cache/devicelist/callback/PluginResultErrorCallback;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "uPnP Device is empty for UDN: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget-object v5, p0, Lcom/belkin/wemo/cache/devicelist/runnable/ResetThresholdRunnable;->udn:Ljava/lang/String;

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-interface {v3, v4}, Lcom/belkin/wemo/cache/devicelist/callback/PluginResultErrorCallback;->onError(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_1

    .line 61
    .end local v1    # "device":Lorg/cybergarage/upnp/Device;
    :catch_0
    move-exception v2

    .line 62
    .local v2, "ex":Ljava/lang/Exception;
    iget-object v3, p0, Lcom/belkin/wemo/cache/devicelist/runnable/ResetThresholdRunnable;->TAG:Ljava/lang/String;

    const-string v4, "Exception in run()"

    invoke-static {v3, v4, v2}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Exception;)V

    .line 63
    iget-object v3, p0, Lcom/belkin/wemo/cache/devicelist/runnable/ResetThresholdRunnable;->errorCallback:Lcom/belkin/wemo/cache/devicelist/callback/PluginResultErrorCallback;

    if-eqz v3, :cond_1

    .line 64
    iget-object v3, p0, Lcom/belkin/wemo/cache/devicelist/runnable/ResetThresholdRunnable;->errorCallback:Lcom/belkin/wemo/cache/devicelist/callback/PluginResultErrorCallback;

    const-string v4, "Empty reset type for run()"

    invoke-interface {v3, v4}, Lcom/belkin/wemo/cache/devicelist/callback/PluginResultErrorCallback;->onError(Ljava/lang/String;)V

    goto :goto_1

    .line 57
    .end local v2    # "ex":Ljava/lang/Exception;
    :cond_4
    :try_start_1
    iget-object v3, p0, Lcom/belkin/wemo/cache/devicelist/runnable/ResetThresholdRunnable;->errorCallback:Lcom/belkin/wemo/cache/devicelist/callback/PluginResultErrorCallback;

    if-eqz v3, :cond_1

    .line 58
    iget-object v3, p0, Lcom/belkin/wemo/cache/devicelist/runnable/ResetThresholdRunnable;->errorCallback:Lcom/belkin/wemo/cache/devicelist/callback/PluginResultErrorCallback;

    const-string v4, "Empty reset type for run()"

    invoke-interface {v3, v4}, Lcom/belkin/wemo/cache/devicelist/callback/PluginResultErrorCallback;->onError(Ljava/lang/String;)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_1
.end method
