.class public Lcom/belkin/wemo/cache/devicelist/runnable/SetDeviceAttributeRunnable;
.super Lcom/belkin/wemo/runnable/WeMoRunnable;
.source "SetDeviceAttributeRunnable.java"


# instance fields
.field private attributeList:Lorg/json/JSONObject;

.field private binaryState:Ljava/lang/String;

.field private context:Landroid/content/Context;

.field private devListManager:Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

.field private mDeviceInfo:Lcom/belkin/wemo/cache/data/DeviceInformation;

.field private udn:Ljava/lang/String;


# direct methods
.method public constructor <init>(Landroid/content/Context;Ljava/lang/String;Lorg/json/JSONObject;)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "udn"    # Ljava/lang/String;
    .param p3, "attributeList"    # Lorg/json/JSONObject;

    .prologue
    .line 29
    invoke-direct {p0}, Lcom/belkin/wemo/runnable/WeMoRunnable;-><init>()V

    .line 23
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/belkin/wemo/cache/devicelist/runnable/SetDeviceAttributeRunnable;->attributeList:Lorg/json/JSONObject;

    .line 30
    invoke-static {p1}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->getInstance(Landroid/content/Context;)Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    move-result-object v0

    iput-object v0, p0, Lcom/belkin/wemo/cache/devicelist/runnable/SetDeviceAttributeRunnable;->devListManager:Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    .line 31
    iput-object p1, p0, Lcom/belkin/wemo/cache/devicelist/runnable/SetDeviceAttributeRunnable;->context:Landroid/content/Context;

    .line 32
    iput-object p2, p0, Lcom/belkin/wemo/cache/devicelist/runnable/SetDeviceAttributeRunnable;->udn:Ljava/lang/String;

    .line 33
    iput-object p3, p0, Lcom/belkin/wemo/cache/devicelist/runnable/SetDeviceAttributeRunnable;->attributeList:Lorg/json/JSONObject;

    .line 34
    return-void
.end method

.method private processResult(Ljava/lang/Boolean;)V
    .locals 9
    .param p1, "result"    # Ljava/lang/Boolean;

    .prologue
    const/4 v8, 0x0

    .line 106
    const-string v5, "SetDeviceAttributeRunnable"

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "Result "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 107
    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v5

    if-eqz v5, :cond_1

    .line 109
    iget-object v5, p0, Lcom/belkin/wemo/cache/devicelist/runnable/SetDeviceAttributeRunnable;->mDeviceInfo:Lcom/belkin/wemo/cache/data/DeviceInformation;

    invoke-virtual {v5}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getAttributeList()Lorg/json/JSONObject;

    move-result-object v1

    .line 111
    .local v1, "deviceAttributes":Lorg/json/JSONObject;
    iget-object v5, p0, Lcom/belkin/wemo/cache/devicelist/runnable/SetDeviceAttributeRunnable;->attributeList:Lorg/json/JSONObject;

    invoke-virtual {v5}, Lorg/json/JSONObject;->keys()Ljava/util/Iterator;

    move-result-object v0

    .line 112
    .local v0, "attributeItr":Ljava/util/Iterator;, "Ljava/util/Iterator<*>;"
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_0

    .line 113
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    .line 115
    .local v3, "key":Ljava/lang/String;
    :try_start_0
    invoke-virtual {v1, v3}, Lorg/json/JSONObject;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lorg/json/JSONObject;

    .line 116
    .local v4, "valObject":Lorg/json/JSONObject;
    iget-object v5, p0, Lcom/belkin/wemo/cache/devicelist/runnable/SetDeviceAttributeRunnable;->attributeList:Lorg/json/JSONObject;

    invoke-virtual {v5, v3}, Lorg/json/JSONObject;->opt(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v5

    invoke-static {v5}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    iput-object v5, p0, Lcom/belkin/wemo/cache/devicelist/runnable/SetDeviceAttributeRunnable;->binaryState:Ljava/lang/String;

    .line 117
    const-string v5, "value"

    iget-object v6, p0, Lcom/belkin/wemo/cache/devicelist/runnable/SetDeviceAttributeRunnable;->attributeList:Lorg/json/JSONObject;

    invoke-virtual {v6, v3}, Lorg/json/JSONObject;->opt(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v6

    invoke-virtual {v4, v5, v6}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 118
    invoke-virtual {v1, v3, v4}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 119
    iget-object v5, p0, Lcom/belkin/wemo/cache/devicelist/runnable/SetDeviceAttributeRunnable;->TAG:Ljava/lang/String;

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "WEMO-48289 deviceAttributes: "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, "; value: "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    iget-object v7, p0, Lcom/belkin/wemo/cache/devicelist/runnable/SetDeviceAttributeRunnable;->binaryState:Ljava/lang/String;

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 120
    .end local v4    # "valObject":Lorg/json/JSONObject;
    :catch_0
    move-exception v2

    .line 122
    .local v2, "e":Lorg/json/JSONException;
    invoke-virtual {v2}, Lorg/json/JSONException;->printStackTrace()V

    goto :goto_0

    .line 125
    .end local v2    # "e":Lorg/json/JSONException;
    .end local v3    # "key":Ljava/lang/String;
    :cond_0
    iget-object v5, p0, Lcom/belkin/wemo/cache/devicelist/runnable/SetDeviceAttributeRunnable;->mDeviceInfo:Lcom/belkin/wemo/cache/data/DeviceInformation;

    invoke-virtual {v5, v1}, Lcom/belkin/wemo/cache/data/DeviceInformation;->setAttributeList(Lorg/json/JSONObject;)V

    .line 126
    iget-object v5, p0, Lcom/belkin/wemo/cache/devicelist/runnable/SetDeviceAttributeRunnable;->mDeviceInfo:Lcom/belkin/wemo/cache/data/DeviceInformation;

    iget-object v6, p0, Lcom/belkin/wemo/cache/devicelist/runnable/SetDeviceAttributeRunnable;->binaryState:Ljava/lang/String;

    invoke-virtual {v5, v6}, Lcom/belkin/wemo/cache/data/DeviceInformation;->setBinaryState(Ljava/lang/String;)V

    .line 127
    iget-object v5, p0, Lcom/belkin/wemo/cache/devicelist/runnable/SetDeviceAttributeRunnable;->mDeviceInfo:Lcom/belkin/wemo/cache/data/DeviceInformation;

    iget-object v6, p0, Lcom/belkin/wemo/cache/devicelist/runnable/SetDeviceAttributeRunnable;->binaryState:Ljava/lang/String;

    invoke-static {v6}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v6

    invoke-virtual {v5, v6}, Lcom/belkin/wemo/cache/data/DeviceInformation;->setState(I)V

    .line 128
    iget-object v5, p0, Lcom/belkin/wemo/cache/devicelist/runnable/SetDeviceAttributeRunnable;->context:Landroid/content/Context;

    invoke-static {v5}, Lcom/belkin/wemo/cache/data/DevicesArray;->getInstance(Landroid/content/Context;)Lcom/belkin/wemo/cache/data/DevicesArray;

    move-result-object v5

    iget-object v6, p0, Lcom/belkin/wemo/cache/devicelist/runnable/SetDeviceAttributeRunnable;->mDeviceInfo:Lcom/belkin/wemo/cache/data/DeviceInformation;

    invoke-virtual {v5, v6}, Lcom/belkin/wemo/cache/data/DevicesArray;->addOrUpdateDeviceInformation(Lcom/belkin/wemo/cache/data/DeviceInformation;)V

    .line 129
    iget-object v5, p0, Lcom/belkin/wemo/cache/devicelist/runnable/SetDeviceAttributeRunnable;->context:Landroid/content/Context;

    invoke-static {v5}, Lcom/belkin/wemo/cache/CacheManager;->getInstance(Landroid/content/Context;)Lcom/belkin/wemo/cache/CacheManager;

    move-result-object v5

    iget-object v6, p0, Lcom/belkin/wemo/cache/devicelist/runnable/SetDeviceAttributeRunnable;->mDeviceInfo:Lcom/belkin/wemo/cache/data/DeviceInformation;

    const/4 v7, 0x1

    invoke-virtual {v5, v6, v8, v8, v7}, Lcom/belkin/wemo/cache/CacheManager;->updateDB(Lcom/belkin/wemo/cache/data/DeviceInformation;ZZZ)V

    .line 130
    iget-object v5, p0, Lcom/belkin/wemo/cache/devicelist/runnable/SetDeviceAttributeRunnable;->TAG:Ljava/lang/String;

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "WEMO-48289 mDeviceInfo: "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    iget-object v7, p0, Lcom/belkin/wemo/cache/devicelist/runnable/SetDeviceAttributeRunnable;->mDeviceInfo:Lcom/belkin/wemo/cache/data/DeviceInformation;

    invoke-virtual {v7}, Lcom/belkin/wemo/cache/data/DeviceInformation;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 132
    .end local v0    # "attributeItr":Ljava/util/Iterator;, "Ljava/util/Iterator<*>;"
    .end local v1    # "deviceAttributes":Lorg/json/JSONObject;
    :cond_1
    iget-object v5, p0, Lcom/belkin/wemo/cache/devicelist/runnable/SetDeviceAttributeRunnable;->devListManager:Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    iget-object v6, p0, Lcom/belkin/wemo/cache/devicelist/runnable/SetDeviceAttributeRunnable;->devListManager:Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    const-string v6, "set_state"

    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v7

    invoke-static {v7}, Ljava/lang/Boolean;->toString(Z)Ljava/lang/String;

    move-result-object v7

    iget-object v8, p0, Lcom/belkin/wemo/cache/devicelist/runnable/SetDeviceAttributeRunnable;->mDeviceInfo:Lcom/belkin/wemo/cache/data/DeviceInformation;

    invoke-virtual {v8}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getUDN()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v5, v6, v7, v8}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->sendNotification(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 133
    return-void
.end method

.method private updateAttributeList()V
    .locals 0

    .prologue
    .line 196
    return-void
.end method


# virtual methods
.method public run()V
    .locals 11

    .prologue
    const/4 v10, 0x1

    const/4 v9, 0x0

    .line 38
    invoke-static {v10}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v5

    .line 40
    .local v5, "result":Ljava/lang/Boolean;
    iget-object v6, p0, Lcom/belkin/wemo/cache/devicelist/runnable/SetDeviceAttributeRunnable;->context:Landroid/content/Context;

    invoke-static {v6}, Lcom/belkin/wemo/cache/data/DevicesArray;->getInstance(Landroid/content/Context;)Lcom/belkin/wemo/cache/data/DevicesArray;

    move-result-object v6

    iget-object v7, p0, Lcom/belkin/wemo/cache/devicelist/runnable/SetDeviceAttributeRunnable;->udn:Ljava/lang/String;

    invoke-virtual {v6, v7}, Lcom/belkin/wemo/cache/data/DevicesArray;->getDeviceInformation(Ljava/lang/String;)Lcom/belkin/wemo/cache/data/DeviceInformation;

    move-result-object v6

    iput-object v6, p0, Lcom/belkin/wemo/cache/devicelist/runnable/SetDeviceAttributeRunnable;->mDeviceInfo:Lcom/belkin/wemo/cache/data/DeviceInformation;

    .line 41
    iget-object v6, p0, Lcom/belkin/wemo/cache/devicelist/runnable/SetDeviceAttributeRunnable;->mDeviceInfo:Lcom/belkin/wemo/cache/data/DeviceInformation;

    if-eqz v6, :cond_4

    .line 42
    const-string v6, "SetDeviceAttributeRunnable"

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "in SetDeviceAttributeRunnable attr list"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    iget-object v8, p0, Lcom/belkin/wemo/cache/devicelist/runnable/SetDeviceAttributeRunnable;->mDeviceInfo:Lcom/belkin/wemo/cache/data/DeviceInformation;

    invoke-virtual {v8}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getAttributeList()Lorg/json/JSONObject;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v6, v7}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 44
    const-string v6, "SetDeviceAttributeRunnable"

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "changed attr list"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    iget-object v8, p0, Lcom/belkin/wemo/cache/devicelist/runnable/SetDeviceAttributeRunnable;->attributeList:Lorg/json/JSONObject;

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v6, v7}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 45
    const/4 v3, 0x0

    .line 46
    .local v3, "device":Lorg/cybergarage/upnp/Device;
    const/4 v2, 0x0

    .line 48
    .local v2, "argumentList":[Ljava/lang/String;
    new-array v2, v10, [Ljava/lang/String;

    .end local v2    # "argumentList":[Ljava/lang/String;
    iget-object v6, p0, Lcom/belkin/wemo/cache/devicelist/runnable/SetDeviceAttributeRunnable;->devListManager:Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    iget-object v7, p0, Lcom/belkin/wemo/cache/devicelist/runnable/SetDeviceAttributeRunnable;->attributeList:Lorg/json/JSONObject;

    iget-object v8, p0, Lcom/belkin/wemo/cache/devicelist/runnable/SetDeviceAttributeRunnable;->mDeviceInfo:Lcom/belkin/wemo/cache/data/DeviceInformation;

    invoke-virtual {v8}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getAttributeList()Lorg/json/JSONObject;

    move-result-object v8

    invoke-virtual {v6, v7, v8}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->createAttributeList(Lorg/json/JSONObject;Lorg/json/JSONObject;)Ljava/lang/String;

    move-result-object v6

    aput-object v6, v2, v9

    .line 49
    .restart local v2    # "argumentList":[Ljava/lang/String;
    const-string v6, "SetDeviceAttributeRunnable"

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "created argumentList::"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-static {v2}, Ljava/util/Arrays;->toString([Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v6, v7}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 51
    iget-object v6, p0, Lcom/belkin/wemo/cache/devicelist/runnable/SetDeviceAttributeRunnable;->mDeviceInfo:Lcom/belkin/wemo/cache/data/DeviceInformation;

    if-eqz v6, :cond_0

    .line 52
    iget-object v6, p0, Lcom/belkin/wemo/cache/devicelist/runnable/SetDeviceAttributeRunnable;->mDeviceInfo:Lcom/belkin/wemo/cache/data/DeviceInformation;

    invoke-virtual {v6}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getDevice()Lorg/cybergarage/upnp/Device;

    move-result-object v3

    .line 54
    :cond_0
    if-nez v3, :cond_1

    .line 56
    :try_start_0
    iget-object v6, p0, Lcom/belkin/wemo/cache/devicelist/runnable/SetDeviceAttributeRunnable;->devListManager:Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    invoke-virtual {v6}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->getUpnpControl()Lorg/cybergarage/upnp/ControlPoint;

    move-result-object v6

    iget-object v7, p0, Lcom/belkin/wemo/cache/devicelist/runnable/SetDeviceAttributeRunnable;->udn:Ljava/lang/String;

    invoke-virtual {v6, v7}, Lorg/cybergarage/upnp/ControlPoint;->getDevice(Ljava/lang/String;)Lorg/cybergarage/upnp/Device;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v3

    .line 64
    :cond_1
    if-eqz v3, :cond_3

    .line 65
    const-string v6, "SetDeviceAttributeRunnable"

    const-string v7, "found device"

    invoke-static {v6, v7}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 67
    :try_start_1
    const-string v6, "SetAttributes"

    invoke-virtual {v3, v6}, Lorg/cybergarage/upnp/Device;->getAction(Ljava/lang/String;)Lorg/cybergarage/upnp/Action;

    move-result-object v0

    .line 68
    .local v0, "action":Lorg/cybergarage/upnp/Action;
    const-string v6, "SetDeviceAttributeRunnable"

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "Action:"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v0}, Lorg/cybergarage/upnp/Action;->getName()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v6, v7}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 70
    iget-object v6, p0, Lcom/belkin/wemo/cache/devicelist/runnable/SetDeviceAttributeRunnable;->devListManager:Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    sget-object v7, Lcom/belkin/wemo/cache/devicelist/UpnpConstants;->SET_ATTRIBUTE_KEYS:[Ljava/lang/String;

    invoke-virtual {v6, v0, v7, v2}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->setArgument(Lorg/cybergarage/upnp/Action;[Ljava/lang/String;[Ljava/lang/String;)V

    .line 72
    invoke-virtual {v0}, Lorg/cybergarage/upnp/Action;->postControlAction()Ljava/lang/String;

    move-result-object v1

    .line 73
    .local v1, "actionResult":Ljava/lang/String;
    const-string v6, "SetDeviceAttributeRunnable"

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "actionResult:"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v6, v7}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 74
    if-nez v1, :cond_2

    .line 75
    const/4 v6, 0x0

    invoke-static {v6}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v5

    .line 76
    const-string v6, "SetDeviceAttributeRunnable"

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "result:"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v6, v7}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    .line 102
    :goto_0
    invoke-direct {p0, v5}, Lcom/belkin/wemo/cache/devicelist/runnable/SetDeviceAttributeRunnable;->processResult(Ljava/lang/Boolean;)V

    .line 103
    .end local v0    # "action":Lorg/cybergarage/upnp/Action;
    .end local v1    # "actionResult":Ljava/lang/String;
    .end local v2    # "argumentList":[Ljava/lang/String;
    .end local v3    # "device":Lorg/cybergarage/upnp/Device;
    :goto_1
    return-void

    .line 57
    .restart local v2    # "argumentList":[Ljava/lang/String;
    .restart local v3    # "device":Lorg/cybergarage/upnp/Device;
    :catch_0
    move-exception v4

    .line 58
    .local v4, "e":Ljava/lang/Exception;
    invoke-static {v9}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v5

    .line 59
    const-string v6, "SetDeviceAttributeRunnable"

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "Error in executing action::result:"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v6, v7}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 60
    invoke-direct {p0, v5}, Lcom/belkin/wemo/cache/devicelist/runnable/SetDeviceAttributeRunnable;->processResult(Ljava/lang/Boolean;)V

    goto :goto_1

    .line 79
    .end local v4    # "e":Ljava/lang/Exception;
    .restart local v0    # "action":Lorg/cybergarage/upnp/Action;
    .restart local v1    # "actionResult":Ljava/lang/String;
    :cond_2
    :try_start_2
    new-instance v6, Lorg/cybergarage/xml/SetAttributeResponseParser;

    invoke-direct {v6}, Lorg/cybergarage/xml/SetAttributeResponseParser;-><init>()V

    invoke-virtual {v6, v1}, Lorg/cybergarage/xml/SetAttributeResponseParser;->parseSetAttributeRespone(Ljava/lang/String;)Z

    move-result v6

    invoke-static {v6}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v5

    .line 81
    const-string v6, "SetDeviceAttributeRunnable"

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "parsedresult:"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v6, v7}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_1

    goto :goto_0

    .line 84
    .end local v0    # "action":Lorg/cybergarage/upnp/Action;
    .end local v1    # "actionResult":Ljava/lang/String;
    :catch_1
    move-exception v4

    .line 85
    .restart local v4    # "e":Ljava/lang/Exception;
    const-string v6, "SetDeviceAttributeRunnable"

    const-string v7, "Error in executing action"

    invoke-static {v6, v7}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 86
    invoke-virtual {v4}, Ljava/lang/Exception;->printStackTrace()V

    .line 87
    invoke-static {v9}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v5

    .line 88
    invoke-direct {p0, v5}, Lcom/belkin/wemo/cache/devicelist/runnable/SetDeviceAttributeRunnable;->processResult(Ljava/lang/Boolean;)V

    goto :goto_1

    .line 92
    .end local v4    # "e":Ljava/lang/Exception;
    :cond_3
    iget-object v6, p0, Lcom/belkin/wemo/cache/devicelist/runnable/SetDeviceAttributeRunnable;->TAG:Ljava/lang/String;

    const-string v7, "Device is null"

    invoke-static {v6, v7}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 93
    invoke-static {v9}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v5

    .line 94
    invoke-direct {p0, v5}, Lcom/belkin/wemo/cache/devicelist/runnable/SetDeviceAttributeRunnable;->processResult(Ljava/lang/Boolean;)V

    goto :goto_1

    .line 98
    .end local v2    # "argumentList":[Ljava/lang/String;
    .end local v3    # "device":Lorg/cybergarage/upnp/Device;
    :cond_4
    invoke-direct {p0, v5}, Lcom/belkin/wemo/cache/devicelist/runnable/SetDeviceAttributeRunnable;->processResult(Ljava/lang/Boolean;)V

    goto :goto_1
.end method
