.class public Lcom/belkin/wemo/cache/devicelist/runnable/ResetAllRunnable;
.super Lcom/belkin/wemo/runnable/WeMoRunnable;
.source "ResetAllRunnable.java"


# static fields
.field private static final TAG:Ljava/lang/String; = "ResetAllRunnable"


# instance fields
.field private deviceInformation:Lorg/json/JSONObject;

.field private errorCallback:Lcom/belkin/wemo/cache/devicelist/callback/PluginResultErrorCallback;

.field private mDeviceListManager:Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

.field private mMoreUtil:Lcom/belkin/wemo/cache/utils/MoreUtil;

.field private mSharePreference:Lcom/belkin/wemo/cache/utils/SharePreferences;

.field private stateData:Lorg/json/JSONObject;

.field private successCallback:Lcom/belkin/wemo/cache/devicelist/callback/PluginResultSuccessCallback;

.field private udn:Ljava/lang/String;


# direct methods
.method public constructor <init>(Lcom/belkin/wemo/cache/devicelist/DeviceListManager;Lcom/belkin/wemo/cache/devicelist/callback/PluginResultErrorCallback;Lcom/belkin/wemo/cache/devicelist/callback/PluginResultSuccessCallback;Ljava/lang/String;Lorg/json/JSONObject;Lorg/json/JSONObject;Lcom/belkin/wemo/cache/utils/SharePreferences;)V
    .locals 1
    .param p1, "devListMan"    # Lcom/belkin/wemo/cache/devicelist/DeviceListManager;
    .param p2, "errorCallback"    # Lcom/belkin/wemo/cache/devicelist/callback/PluginResultErrorCallback;
    .param p3, "successCallback"    # Lcom/belkin/wemo/cache/devicelist/callback/PluginResultSuccessCallback;
    .param p4, "udn"    # Ljava/lang/String;
    .param p5, "deviceInformation"    # Lorg/json/JSONObject;
    .param p6, "stateData"    # Lorg/json/JSONObject;
    .param p7, "mSharePreference"    # Lcom/belkin/wemo/cache/utils/SharePreferences;

    .prologue
    .line 37
    invoke-direct {p0}, Lcom/belkin/wemo/runnable/WeMoRunnable;-><init>()V

    .line 39
    iput-object p1, p0, Lcom/belkin/wemo/cache/devicelist/runnable/ResetAllRunnable;->mDeviceListManager:Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    .line 40
    new-instance v0, Lcom/belkin/wemo/cache/utils/MoreUtil;

    invoke-direct {v0}, Lcom/belkin/wemo/cache/utils/MoreUtil;-><init>()V

    iput-object v0, p0, Lcom/belkin/wemo/cache/devicelist/runnable/ResetAllRunnable;->mMoreUtil:Lcom/belkin/wemo/cache/utils/MoreUtil;

    .line 41
    iput-object p2, p0, Lcom/belkin/wemo/cache/devicelist/runnable/ResetAllRunnable;->errorCallback:Lcom/belkin/wemo/cache/devicelist/callback/PluginResultErrorCallback;

    .line 42
    iput-object p3, p0, Lcom/belkin/wemo/cache/devicelist/runnable/ResetAllRunnable;->successCallback:Lcom/belkin/wemo/cache/devicelist/callback/PluginResultSuccessCallback;

    .line 43
    iput-object p4, p0, Lcom/belkin/wemo/cache/devicelist/runnable/ResetAllRunnable;->udn:Ljava/lang/String;

    .line 44
    iput-object p5, p0, Lcom/belkin/wemo/cache/devicelist/runnable/ResetAllRunnable;->deviceInformation:Lorg/json/JSONObject;

    .line 45
    iput-object p6, p0, Lcom/belkin/wemo/cache/devicelist/runnable/ResetAllRunnable;->stateData:Lorg/json/JSONObject;

    .line 46
    iput-object p7, p0, Lcom/belkin/wemo/cache/devicelist/runnable/ResetAllRunnable;->mSharePreference:Lcom/belkin/wemo/cache/utils/SharePreferences;

    .line 47
    return-void
.end method

.method private resetDeviceAllLocalButZigbee(Ljava/lang/String;Lorg/cybergarage/upnp/ControlPoint;)Z
    .locals 11
    .param p1, "udn"    # Ljava/lang/String;
    .param p2, "controlPoint"    # Lorg/cybergarage/upnp/ControlPoint;

    .prologue
    .line 93
    const/4 v5, 0x0

    .line 94
    .local v5, "isResetDone":Z
    if-nez p1, :cond_0

    .line 95
    const-string v8, "ResetAllRunnable"

    const-string v9, "null udn on resetDeviceAllLocalButZigbee"

    invoke-static {v8, v9}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 99
    :cond_0
    :try_start_0
    invoke-virtual {p2, p1}, Lorg/cybergarage/upnp/ControlPoint;->getDevice(Ljava/lang/String;)Lorg/cybergarage/upnp/Device;

    move-result-object v6

    .line 101
    .local v6, "localDevice":Lorg/cybergarage/upnp/Device;
    iget-object v8, p0, Lcom/belkin/wemo/cache/devicelist/runnable/ResetAllRunnable;->mDeviceListManager:Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    invoke-virtual {v8, p1}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->getDeviceInformationByUDN(Ljava/lang/String;)Lcom/belkin/wemo/cache/data/DeviceInformation;

    move-result-object v1

    .line 102
    .local v1, "devInfo":Lcom/belkin/wemo/cache/data/DeviceInformation;
    if-nez v6, :cond_1

    .line 103
    const-string v8, "ResetAllRunnable"

    const-string v9, "null localdevice on resetDeviceAllLocalButZigbee"

    invoke-static {v8, v9}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 105
    :cond_1
    const-string v8, "ReSetup"

    invoke-virtual {v6, v8}, Lorg/cybergarage/upnp/Device;->getAction(Ljava/lang/String;)Lorg/cybergarage/upnp/Action;

    move-result-object v0

    .line 106
    .local v0, "action":Lorg/cybergarage/upnp/Action;
    const-string v8, "Reset"

    const-string v9, "2"

    invoke-virtual {v0, v8, v9}, Lorg/cybergarage/upnp/Action;->setArgumentValue(Ljava/lang/String;Ljava/lang/String;)V

    .line 107
    invoke-virtual {v0}, Lorg/cybergarage/upnp/Action;->postControlAction()Ljava/lang/String;

    move-result-object v7

    .line 108
    .local v7, "response":Ljava/lang/String;
    const-string v8, "ResetAllRunnable"

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "resetAllContentAndSettings response: "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-static {v8, v9}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 109
    if-eqz v7, :cond_4

    sget-object v8, Lcom/belkin/wemo/cache/devicelist/UpnpConstants;->ERROR:Ljava/lang/String;

    invoke-virtual {v7, v8}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v8

    if-nez v8, :cond_4

    .line 110
    const-string v8, "ResetAllRunnable"

    const-string v9, "if reset is successful then reset the firmware flags for the device type"

    invoke-static {v8, v9}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 111
    const-string v8, "reset_remote"

    invoke-virtual {v7, v8}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v8

    if-eqz v8, :cond_2

    .line 112
    const-string v8, "ResetAllRunnable"

    const-string v9, "response contains reset_remote; Home Id: "

    invoke-static {v8, v9}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 113
    iget-object v8, p0, Lcom/belkin/wemo/cache/devicelist/runnable/ResetAllRunnable;->mSharePreference:Lcom/belkin/wemo/cache/utils/SharePreferences;

    const-string v9, ""

    invoke-virtual {v8, v9}, Lcom/belkin/wemo/cache/utils/SharePreferences;->storeHomeId(Ljava/lang/String;)V

    .line 114
    iget-object v8, p0, Lcom/belkin/wemo/cache/devicelist/runnable/ResetAllRunnable;->mSharePreference:Lcom/belkin/wemo/cache/utils/SharePreferences;

    const-string v9, ""

    invoke-virtual {v8, v9}, Lcom/belkin/wemo/cache/utils/SharePreferences;->storePrivateKey(Ljava/lang/String;)V

    .line 115
    iget-object v8, p0, Lcom/belkin/wemo/cache/devicelist/runnable/ResetAllRunnable;->mSharePreference:Lcom/belkin/wemo/cache/utils/SharePreferences;

    const/4 v9, 0x0

    invoke-virtual {v8, v9}, Lcom/belkin/wemo/cache/utils/SharePreferences;->setRemoteEnabled(Z)Z

    .line 116
    iget-object v8, p0, Lcom/belkin/wemo/cache/devicelist/runnable/ResetAllRunnable;->mSharePreference:Lcom/belkin/wemo/cache/utils/SharePreferences;

    const-string v9, "0"

    invoke-virtual {v8, v9}, Lcom/belkin/wemo/cache/utils/SharePreferences;->setDBVersion(Ljava/lang/String;)V

    .line 117
    iget-object v8, p0, Lcom/belkin/wemo/cache/devicelist/runnable/ResetAllRunnable;->mSharePreference:Lcom/belkin/wemo/cache/utils/SharePreferences;

    const-string v9, ""

    invoke-virtual {v8, v9}, Lcom/belkin/wemo/cache/utils/SharePreferences;->setRemoteAccessSSID(Ljava/lang/String;)Z

    .line 120
    :cond_2
    invoke-virtual {v6}, Lorg/cybergarage/upnp/Device;->getDeviceType()Ljava/lang/String;

    move-result-object v2

    .line 121
    .local v2, "deviceType":Ljava/lang/String;
    if-eqz v2, :cond_3

    const-string v8, "insight"

    invoke-virtual {v2, v8}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v8

    if-eqz v8, :cond_3

    .line 122
    invoke-virtual {v1}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getHwVersion()Ljava/lang/String;

    move-result-object v4

    .line 124
    .local v4, "hwVersion":Ljava/lang/String;
    if-eqz v4, :cond_3

    const-string v8, "v2"

    invoke-virtual {v4, v8}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v8

    if-eqz v8, :cond_3

    .line 125
    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v8, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, "v2"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    .line 128
    .end local v4    # "hwVersion":Ljava/lang/String;
    :cond_3
    iget-object v8, p0, Lcom/belkin/wemo/cache/devicelist/runnable/ResetAllRunnable;->mMoreUtil:Lcom/belkin/wemo/cache/utils/MoreUtil;

    invoke-virtual {v8, v2}, Lcom/belkin/wemo/cache/utils/MoreUtil;->resetFWFlags(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 129
    const/4 v5, 0x1

    .line 134
    .end local v0    # "action":Lorg/cybergarage/upnp/Action;
    .end local v1    # "devInfo":Lcom/belkin/wemo/cache/data/DeviceInformation;
    .end local v2    # "deviceType":Ljava/lang/String;
    .end local v6    # "localDevice":Lorg/cybergarage/upnp/Device;
    .end local v7    # "response":Ljava/lang/String;
    :cond_4
    :goto_0
    return v5

    .line 131
    :catch_0
    move-exception v3

    .line 132
    .local v3, "e":Ljava/lang/Exception;
    const-string v8, "ResetAllRunnable"

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "exception in resetAllContentAndSettings: "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-static {v8, v9}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0
.end method

.method private resetDeviceLocalZigbee(Ljava/lang/String;Lorg/cybergarage/upnp/ControlPoint;)Z
    .locals 11
    .param p1, "udn"    # Ljava/lang/String;
    .param p2, "controlPoint"    # Lorg/cybergarage/upnp/ControlPoint;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .prologue
    const/4 v10, 0x0

    .line 138
    const/4 v1, 0x0

    .line 139
    .local v1, "isResetDone":Z
    const-string v7, "ResetAllRunnable"

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "Reset on local for Zigbee udn: "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-static {v7, v8}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 141
    new-instance v6, Lorg/json/JSONArray;

    invoke-direct {v6}, Lorg/json/JSONArray;-><init>()V

    .line 143
    .local v6, "tempJsonArray":Lorg/json/JSONArray;
    iget-object v7, p0, Lcom/belkin/wemo/cache/devicelist/runnable/ResetAllRunnable;->mDeviceListManager:Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    invoke-virtual {v7, p1, p2}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->getBridgeUdn(Ljava/lang/String;Lorg/cybergarage/upnp/ControlPoint;)Ljava/lang/String;

    move-result-object v2

    .line 156
    .local v2, "mBridgeUdn":Ljava/lang/String;
    const-string v7, "ResetAllRunnable"

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "remove dev id:"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-static {v7, v8}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->debugLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 157
    invoke-virtual {p2, v2}, Lorg/cybergarage/upnp/ControlPoint;->getDevice(Ljava/lang/String;)Lorg/cybergarage/upnp/Device;

    move-result-object v7

    const-string v8, "RemoveDevice"

    invoke-virtual {v7, v8}, Lorg/cybergarage/upnp/Device;->getAction(Ljava/lang/String;)Lorg/cybergarage/upnp/Action;

    move-result-object v0

    .line 160
    .local v0, "action":Lorg/cybergarage/upnp/Action;
    iget-object v7, p0, Lcom/belkin/wemo/cache/devicelist/runnable/ResetAllRunnable;->mDeviceListManager:Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    sget-object v8, Lcom/belkin/wemo/cache/devicelist/UpnpConstants;->ARGS_DEVICEIDS:[Ljava/lang/String;

    const/4 v9, 0x1

    new-array v9, v9, [Ljava/lang/String;

    aput-object p1, v9, v10

    invoke-virtual {v7, v0, v8, v9}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->setArgument(Lorg/cybergarage/upnp/Action;[Ljava/lang/String;[Ljava/lang/String;)V

    .line 161
    invoke-virtual {v0}, Lorg/cybergarage/upnp/Action;->postControlAction()Ljava/lang/String;

    move-result-object v3

    .line 162
    .local v3, "mResponseString":Ljava/lang/String;
    const-string v7, "ResetAllRunnable"

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "response remove device n/w===+"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-static {v7, v8}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->debugLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 165
    iget-object v7, p0, Lcom/belkin/wemo/cache/devicelist/runnable/ResetAllRunnable;->mMoreUtil:Lcom/belkin/wemo/cache/utils/MoreUtil;

    const-string v8, "MZ100"

    invoke-virtual {v7, v8}, Lcom/belkin/wemo/cache/utils/MoreUtil;->resetFWFlags(Ljava/lang/String;)V

    .line 167
    new-instance v5, Lcom/belkin/wemo/cache/utils/LedDeviceResponseParser;

    invoke-direct {v5}, Lcom/belkin/wemo/cache/utils/LedDeviceResponseParser;-><init>()V

    .line 168
    .local v5, "responseStatus":Lcom/belkin/wemo/cache/utils/LedDeviceResponseParser;
    invoke-virtual {v5, v3}, Lcom/belkin/wemo/cache/utils/LedDeviceResponseParser;->parseNetworkStatus(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v4

    .line 169
    .local v4, "parsedResponse":Lorg/json/JSONObject;
    const-string v7, "ResetAllRunnable"

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "JSONObject parsed response :"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-static {v7, v8}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 170
    invoke-static {v3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v7

    if-nez v7, :cond_0

    .line 171
    const-string v7, "GetAddLedDeviceStatus"

    invoke-virtual {v4, v7}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_0

    .line 172
    const-string v7, "GetAddLedDeviceStatus"

    invoke-virtual {v4, v7}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    const-string v8, "true"

    invoke-virtual {v7, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_0

    .line 173
    iget-object v7, p0, Lcom/belkin/wemo/cache/devicelist/runnable/ResetAllRunnable;->mDeviceListManager:Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    invoke-virtual {v7, p1, v10}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->removeDeviceByUDN(Ljava/lang/String;Z)V

    .line 174
    const-string v7, "ResetAllRunnable"

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "Removing device from database for udn: "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-static {v7, v8}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 179
    const/4 v1, 0x1

    .line 183
    :cond_0
    return v1
.end method


# virtual methods
.method public run()V
    .locals 11

    .prologue
    const/4 v10, 0x0

    .line 51
    invoke-static {v10}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v3

    .line 53
    .local v3, "isResetDone":Ljava/lang/Boolean;
    :try_start_0
    iget-object v5, p0, Lcom/belkin/wemo/cache/devicelist/runnable/ResetAllRunnable;->mDeviceListManager:Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    invoke-virtual {v5}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->getUpnpControl()Lorg/cybergarage/upnp/ControlPoint;

    move-result-object v0

    .line 54
    .local v0, "controlPoint":Lorg/cybergarage/upnp/ControlPoint;
    iget-object v5, p0, Lcom/belkin/wemo/cache/devicelist/runnable/ResetAllRunnable;->udn:Ljava/lang/String;

    invoke-static {v5}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v5

    if-nez v5, :cond_0

    iget-object v5, p0, Lcom/belkin/wemo/cache/devicelist/runnable/ResetAllRunnable;->deviceInformation:Lorg/json/JSONObject;

    if-eqz v5, :cond_0

    iget-object v5, p0, Lcom/belkin/wemo/cache/devicelist/runnable/ResetAllRunnable;->stateData:Lorg/json/JSONObject;

    if-nez v5, :cond_1

    .line 55
    :cond_0
    const-string v5, "ResetAllRunnable"

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "null in doInBackground udn:"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    iget-object v7, p0, Lcom/belkin/wemo/cache/devicelist/runnable/ResetAllRunnable;->udn:Ljava/lang/String;

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, ", deviceInformation:"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    iget-object v7, p0, Lcom/belkin/wemo/cache/devicelist/runnable/ResetAllRunnable;->deviceInformation:Lorg/json/JSONObject;

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, ",stateData:"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    iget-object v7, p0, Lcom/belkin/wemo/cache/devicelist/runnable/ResetAllRunnable;->stateData:Lorg/json/JSONObject;

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 57
    :cond_1
    const-string v5, "ResetAllRunnable"

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "Reset in local for udn: "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    iget-object v7, p0, Lcom/belkin/wemo/cache/devicelist/runnable/ResetAllRunnable;->udn:Ljava/lang/String;

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 58
    iget-object v5, p0, Lcom/belkin/wemo/cache/devicelist/runnable/ResetAllRunnable;->mDeviceListManager:Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    iget-object v6, p0, Lcom/belkin/wemo/cache/devicelist/runnable/ResetAllRunnable;->udn:Ljava/lang/String;

    const/4 v7, 0x0

    const/4 v8, 0x1

    const/4 v9, 0x0

    invoke-virtual {v5, v6, v7, v8, v9}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->getDeviceFromDBByUDN(Ljava/lang/String;ZZZ)Lcom/belkin/wemo/cache/data/DeviceInformation;

    move-result-object v1

    .line 59
    .local v1, "dev":Lcom/belkin/wemo/cache/data/DeviceInformation;
    const-string v5, "ResetAllRunnable"

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "dev: "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 61
    iget-object v5, p0, Lcom/belkin/wemo/cache/devicelist/runnable/ResetAllRunnable;->mDeviceListManager:Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    iget-object v6, p0, Lcom/belkin/wemo/cache/devicelist/runnable/ResetAllRunnable;->udn:Ljava/lang/String;

    invoke-virtual {v5, v6}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->isZigbee(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_3

    .line 62
    iget-object v5, p0, Lcom/belkin/wemo/cache/devicelist/runnable/ResetAllRunnable;->udn:Ljava/lang/String;

    invoke-direct {p0, v5, v0}, Lcom/belkin/wemo/cache/devicelist/runnable/ResetAllRunnable;->resetDeviceLocalZigbee(Ljava/lang/String;Lorg/cybergarage/upnp/ControlPoint;)Z

    move-result v5

    invoke-static {v5}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v3

    .line 70
    .end local v0    # "controlPoint":Lorg/cybergarage/upnp/ControlPoint;
    .end local v1    # "dev":Lcom/belkin/wemo/cache/data/DeviceInformation;
    :goto_0
    invoke-virtual {v3}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v5

    if-eqz v5, :cond_4

    .line 71
    iget-object v5, p0, Lcom/belkin/wemo/cache/devicelist/runnable/ResetAllRunnable;->mDeviceListManager:Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    iget-object v6, p0, Lcom/belkin/wemo/cache/devicelist/runnable/ResetAllRunnable;->udn:Ljava/lang/String;

    invoke-virtual {v5, v6, v10}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->removeDeviceByUDN(Ljava/lang/String;Z)V

    .line 72
    iget-object v5, p0, Lcom/belkin/wemo/cache/devicelist/runnable/ResetAllRunnable;->successCallback:Lcom/belkin/wemo/cache/devicelist/callback/PluginResultSuccessCallback;

    if-eqz v5, :cond_2

    .line 74
    :try_start_1
    iget-object v5, p0, Lcom/belkin/wemo/cache/devicelist/runnable/ResetAllRunnable;->mDeviceListManager:Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    const-string v6, "reset_all"

    iget-object v7, p0, Lcom/belkin/wemo/cache/devicelist/runnable/ResetAllRunnable;->udn:Ljava/lang/String;

    const-string v8, "true"

    invoke-virtual {v5, v6, v7, v8}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->prepareDeviceResetResponse(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v4

    .line 75
    .local v4, "response":Lorg/json/JSONObject;
    iget-object v5, p0, Lcom/belkin/wemo/cache/devicelist/runnable/ResetAllRunnable;->successCallback:Lcom/belkin/wemo/cache/devicelist/callback/PluginResultSuccessCallback;

    invoke-virtual {v4}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-interface {v5, v6}, Lcom/belkin/wemo/cache/devicelist/callback/PluginResultSuccessCallback;->onSuccess(Ljava/lang/String;)V
    :try_end_1
    .catch Lorg/json/JSONException; {:try_start_1 .. :try_end_1} :catch_1

    .line 88
    .end local v4    # "response":Lorg/json/JSONObject;
    :cond_2
    :goto_1
    iget-object v5, p0, Lcom/belkin/wemo/cache/devicelist/runnable/ResetAllRunnable;->mDeviceListManager:Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    const-string v6, "reset_all"

    invoke-virtual {v3}, Ljava/lang/Boolean;->toString()Ljava/lang/String;

    move-result-object v7

    iget-object v8, p0, Lcom/belkin/wemo/cache/devicelist/runnable/ResetAllRunnable;->udn:Ljava/lang/String;

    invoke-virtual {v5, v6, v7, v8}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->sendNotification(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 89
    const-string v5, "ResetAllRunnable"

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "Result of reset operation: "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->debugLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 90
    return-void

    .line 64
    .restart local v0    # "controlPoint":Lorg/cybergarage/upnp/ControlPoint;
    .restart local v1    # "dev":Lcom/belkin/wemo/cache/data/DeviceInformation;
    :cond_3
    :try_start_2
    iget-object v5, p0, Lcom/belkin/wemo/cache/devicelist/runnable/ResetAllRunnable;->udn:Ljava/lang/String;

    invoke-direct {p0, v5, v0}, Lcom/belkin/wemo/cache/devicelist/runnable/ResetAllRunnable;->resetDeviceAllLocalButZigbee(Ljava/lang/String;Lorg/cybergarage/upnp/ControlPoint;)Z

    move-result v5

    invoke-static {v5}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0

    move-result-object v3

    goto :goto_0

    .line 66
    .end local v0    # "controlPoint":Lorg/cybergarage/upnp/ControlPoint;
    .end local v1    # "dev":Lcom/belkin/wemo/cache/data/DeviceInformation;
    :catch_0
    move-exception v2

    .line 67
    .local v2, "e":Ljava/lang/Exception;
    const-string v5, "ResetAllRunnable"

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "exception in resetDeviceAll: "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 68
    invoke-static {v10}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v3

    goto :goto_0

    .line 76
    .end local v2    # "e":Ljava/lang/Exception;
    :catch_1
    move-exception v2

    .line 77
    .local v2, "e":Lorg/json/JSONException;
    const-string v5, "ResetAllRunnable"

    const-string v6, "exception in resetDeviceAll: "

    invoke-static {v5, v6, v2}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Exception;)V

    .line 78
    iget-object v5, p0, Lcom/belkin/wemo/cache/devicelist/runnable/ResetAllRunnable;->errorCallback:Lcom/belkin/wemo/cache/devicelist/callback/PluginResultErrorCallback;

    if-eqz v5, :cond_2

    .line 79
    iget-object v5, p0, Lcom/belkin/wemo/cache/devicelist/runnable/ResetAllRunnable;->errorCallback:Lcom/belkin/wemo/cache/devicelist/callback/PluginResultErrorCallback;

    invoke-virtual {v2}, Lorg/json/JSONException;->getMessage()Ljava/lang/String;

    move-result-object v6

    invoke-interface {v5, v6}, Lcom/belkin/wemo/cache/devicelist/callback/PluginResultErrorCallback;->onError(Ljava/lang/String;)V

    goto :goto_1

    .line 84
    .end local v2    # "e":Lorg/json/JSONException;
    :cond_4
    iget-object v5, p0, Lcom/belkin/wemo/cache/devicelist/runnable/ResetAllRunnable;->errorCallback:Lcom/belkin/wemo/cache/devicelist/callback/PluginResultErrorCallback;

    if-eqz v5, :cond_2

    .line 85
    iget-object v5, p0, Lcom/belkin/wemo/cache/devicelist/runnable/ResetAllRunnable;->errorCallback:Lcom/belkin/wemo/cache/devicelist/callback/PluginResultErrorCallback;

    const-string v6, "RESET_ALL failed"

    invoke-interface {v5, v6}, Lcom/belkin/wemo/cache/devicelist/callback/PluginResultErrorCallback;->onError(Ljava/lang/String;)V

    goto :goto_1
.end method
