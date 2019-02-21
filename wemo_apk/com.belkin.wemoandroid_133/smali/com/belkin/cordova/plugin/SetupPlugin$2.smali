.class Lcom/belkin/cordova/plugin/SetupPlugin$2;
.super Ljava/lang/Object;
.source "SetupPlugin.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/belkin/cordova/plugin/SetupPlugin;->execute(Ljava/lang/String;Lorg/json/JSONArray;Lorg/apache/cordova/CallbackContext;)Z
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/belkin/cordova/plugin/SetupPlugin;

.field final synthetic val$callbackContext:Lorg/apache/cordova/CallbackContext;


# direct methods
.method constructor <init>(Lcom/belkin/cordova/plugin/SetupPlugin;Lorg/apache/cordova/CallbackContext;)V
    .locals 0

    .prologue
    .line 132
    iput-object p1, p0, Lcom/belkin/cordova/plugin/SetupPlugin$2;->this$0:Lcom/belkin/cordova/plugin/SetupPlugin;

    iput-object p2, p0, Lcom/belkin/cordova/plugin/SetupPlugin$2;->val$callbackContext:Lorg/apache/cordova/CallbackContext;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 13

    .prologue
    .line 134
    const/4 v10, 0x0

    invoke-static {v10}, Lcom/belkin/wemo/storage/FileStorage;->getInstance(Landroid/content/Context;)Lcom/belkin/wemo/storage/FileStorage;

    move-result-object v10

    const/4 v11, 0x1

    invoke-virtual {v10, v11}, Lcom/belkin/wemo/storage/FileStorage;->setReload(Z)V

    .line 135
    iget-object v10, p0, Lcom/belkin/cordova/plugin/SetupPlugin$2;->this$0:Lcom/belkin/cordova/plugin/SetupPlugin;

    invoke-static {v10}, Lcom/belkin/cordova/plugin/SetupPlugin;->access$100(Lcom/belkin/cordova/plugin/SetupPlugin;)Lcom/belkin/cybergarage/wrapper/UpnpDeviceSetup;

    move-result-object v10

    if-nez v10, :cond_0

    .line 136
    iget-object v10, p0, Lcom/belkin/cordova/plugin/SetupPlugin$2;->this$0:Lcom/belkin/cordova/plugin/SetupPlugin;

    new-instance v11, Lcom/belkin/cybergarage/wrapper/UpnpDeviceSetup;

    iget-object v12, p0, Lcom/belkin/cordova/plugin/SetupPlugin$2;->this$0:Lcom/belkin/cordova/plugin/SetupPlugin;

    invoke-static {v12}, Lcom/belkin/cordova/plugin/SetupPlugin;->access$000(Lcom/belkin/cordova/plugin/SetupPlugin;)Landroid/content/Context;

    move-result-object v12

    invoke-direct {v11, v12}, Lcom/belkin/cybergarage/wrapper/UpnpDeviceSetup;-><init>(Landroid/content/Context;)V

    invoke-static {v10, v11}, Lcom/belkin/cordova/plugin/SetupPlugin;->access$102(Lcom/belkin/cordova/plugin/SetupPlugin;Lcom/belkin/cybergarage/wrapper/UpnpDeviceSetup;)Lcom/belkin/cybergarage/wrapper/UpnpDeviceSetup;

    .line 140
    :cond_0
    :try_start_0
    invoke-static {}, Ljava/lang/Thread;->yield()V

    .line 141
    const-wide/16 v10, 0xfa0

    invoke-static {v10, v11}, Ljava/lang/Thread;->sleep(J)V
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0

    .line 146
    :goto_0
    iget-object v10, p0, Lcom/belkin/cordova/plugin/SetupPlugin$2;->this$0:Lcom/belkin/cordova/plugin/SetupPlugin;

    iget-object v10, v10, Lcom/belkin/cordova/plugin/SetupPlugin;->cordova:Lorg/apache/cordova/CordovaInterface;

    invoke-interface {v10}, Lorg/apache/cordova/CordovaInterface;->getThreadPool()Ljava/util/concurrent/ExecutorService;

    move-result-object v10

    new-instance v11, Lcom/belkin/cordova/plugin/SetupPlugin$2$1;

    invoke-direct {v11, p0}, Lcom/belkin/cordova/plugin/SetupPlugin$2$1;-><init>(Lcom/belkin/cordova/plugin/SetupPlugin$2;)V

    invoke-interface {v10, v11}, Ljava/util/concurrent/ExecutorService;->execute(Ljava/lang/Runnable;)V

    .line 157
    new-instance v0, Lorg/json/JSONArray;

    invoke-direct {v0}, Lorg/json/JSONArray;-><init>()V

    .line 159
    .local v0, "array":Lorg/json/JSONArray;
    iget-object v10, p0, Lcom/belkin/cordova/plugin/SetupPlugin$2;->this$0:Lcom/belkin/cordova/plugin/SetupPlugin;

    iget-object v10, v10, Lcom/belkin/cordova/plugin/SetupPlugin;->d:Lorg/cybergarage/upnp/Device;

    if-nez v10, :cond_1

    .line 161
    :try_start_1
    iget-object v10, p0, Lcom/belkin/cordova/plugin/SetupPlugin$2;->this$0:Lcom/belkin/cordova/plugin/SetupPlugin;

    iget-object v11, p0, Lcom/belkin/cordova/plugin/SetupPlugin$2;->this$0:Lcom/belkin/cordova/plugin/SetupPlugin;

    invoke-static {v11}, Lcom/belkin/cordova/plugin/SetupPlugin;->access$100(Lcom/belkin/cordova/plugin/SetupPlugin;)Lcom/belkin/cybergarage/wrapper/UpnpDeviceSetup;

    move-result-object v11

    invoke-virtual {v11}, Lcom/belkin/cybergarage/wrapper/UpnpDeviceSetup;->getSetupDevice()Lorg/cybergarage/upnp/Device;

    move-result-object v11

    iput-object v11, v10, Lcom/belkin/cordova/plugin/SetupPlugin;->d:Lorg/cybergarage/upnp/Device;
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    .line 167
    :cond_1
    :goto_1
    iget-object v10, p0, Lcom/belkin/cordova/plugin/SetupPlugin$2;->this$0:Lcom/belkin/cordova/plugin/SetupPlugin;

    invoke-static {v10}, Lcom/belkin/cordova/plugin/SetupPlugin;->access$200(Lcom/belkin/cordova/plugin/SetupPlugin;)Lcom/belkin/wemo/cache/utils/SDKNetworkUtils;

    move-result-object v10

    invoke-virtual {v10}, Lcom/belkin/wemo/cache/utils/SDKNetworkUtils;->getSSID()Ljava/lang/String;

    move-result-object v1

    .line 168
    .local v1, "deviceSSID":Ljava/lang/String;
    const-string v10, "SetupPlugin"

    new-instance v11, Ljava/lang/StringBuilder;

    invoke-direct {v11}, Ljava/lang/StringBuilder;-><init>()V

    const-string v12, "deviceSSID: "

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v11

    invoke-static {v10, v11}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 169
    invoke-virtual {v0, v1}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;

    .line 170
    iget-object v10, p0, Lcom/belkin/cordova/plugin/SetupPlugin$2;->this$0:Lcom/belkin/cordova/plugin/SetupPlugin;

    iget-object v10, v10, Lcom/belkin/cordova/plugin/SetupPlugin;->d:Lorg/cybergarage/upnp/Device;

    if-eqz v10, :cond_6

    .line 171
    iget-object v10, p0, Lcom/belkin/cordova/plugin/SetupPlugin$2;->this$0:Lcom/belkin/cordova/plugin/SetupPlugin;

    iget-object v10, v10, Lcom/belkin/cordova/plugin/SetupPlugin;->d:Lorg/cybergarage/upnp/Device;

    invoke-virtual {v10}, Lorg/cybergarage/upnp/Device;->getDeviceType()Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v0, v10}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;

    .line 176
    :goto_2
    iget-object v10, p0, Lcom/belkin/cordova/plugin/SetupPlugin$2;->this$0:Lcom/belkin/cordova/plugin/SetupPlugin;

    invoke-static {v10}, Lcom/belkin/cordova/plugin/SetupPlugin;->access$100(Lcom/belkin/cordova/plugin/SetupPlugin;)Lcom/belkin/cybergarage/wrapper/UpnpDeviceSetup;

    move-result-object v10

    invoke-virtual {v10}, Lcom/belkin/cybergarage/wrapper/UpnpDeviceSetup;->isSuperSmartSetup()Z

    move-result v10

    if-eqz v10, :cond_7

    .line 177
    const-string v10, "SUPER_SMART_SETUP"

    invoke-virtual {v0, v10}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;

    .line 186
    :goto_3
    const-string v5, ""

    .line 187
    .local v5, "iconLocation":Ljava/lang/String;
    iget-object v10, p0, Lcom/belkin/cordova/plugin/SetupPlugin$2;->this$0:Lcom/belkin/cordova/plugin/SetupPlugin;

    iget-object v10, v10, Lcom/belkin/cordova/plugin/SetupPlugin;->d:Lorg/cybergarage/upnp/Device;

    if-eqz v10, :cond_4

    .line 188
    iget-object v10, p0, Lcom/belkin/cordova/plugin/SetupPlugin$2;->this$0:Lcom/belkin/cordova/plugin/SetupPlugin;

    iget-object v10, v10, Lcom/belkin/cordova/plugin/SetupPlugin;->d:Lorg/cybergarage/upnp/Device;

    invoke-virtual {v10}, Lorg/cybergarage/upnp/Device;->getFriendlyName()Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v0, v10}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;

    .line 189
    iget-object v10, p0, Lcom/belkin/cordova/plugin/SetupPlugin$2;->this$0:Lcom/belkin/cordova/plugin/SetupPlugin;

    iget-object v10, v10, Lcom/belkin/cordova/plugin/SetupPlugin;->d:Lorg/cybergarage/upnp/Device;

    invoke-virtual {v10}, Lorg/cybergarage/upnp/Device;->getBrandName()Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v0, v10}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;

    .line 192
    iget-object v10, p0, Lcom/belkin/cordova/plugin/SetupPlugin$2;->this$0:Lcom/belkin/cordova/plugin/SetupPlugin;

    iget-object v10, v10, Lcom/belkin/cordova/plugin/SetupPlugin;->d:Lorg/cybergarage/upnp/Device;

    const-string v11, "GetIconVersion"

    invoke-virtual {v10, v11}, Lorg/cybergarage/upnp/Device;->getAction(Ljava/lang/String;)Lorg/cybergarage/upnp/Action;

    move-result-object v4

    .line 193
    .local v4, "getIconVersionAction":Lorg/cybergarage/upnp/Action;
    if-eqz v4, :cond_a

    .line 194
    invoke-virtual {v4}, Lorg/cybergarage/upnp/Action;->postControlAction()Ljava/lang/String;

    move-result-object v8

    .line 195
    .local v8, "response":Ljava/lang/String;
    invoke-static {v8}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v10

    if-nez v10, :cond_9

    .line 196
    new-instance v10, Lcom/belkin/wemo/upnp/parser/GetIconVersionResponseParser;

    invoke-direct {v10}, Lcom/belkin/wemo/upnp/parser/GetIconVersionResponseParser;-><init>()V

    invoke-virtual {v10, v8}, Lcom/belkin/wemo/upnp/parser/GetIconVersionResponseParser;->parseResponse(Ljava/lang/String;)I

    move-result v7

    .line 197
    .local v7, "iconVersion":I
    const-string v10, "SetupPlugin"

    new-instance v11, Ljava/lang/StringBuilder;

    invoke-direct {v11}, Ljava/lang/StringBuilder;-><init>()V

    const-string v12, "Icon version of setup device: "

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11, v7}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v11

    invoke-static {v10, v11}, Lcom/belkin/utils/LogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 198
    if-lez v7, :cond_2

    .line 199
    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    const-string v11, "http://"

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    iget-object v11, p0, Lcom/belkin/cordova/plugin/SetupPlugin$2;->this$0:Lcom/belkin/cordova/plugin/SetupPlugin;

    iget-object v11, v11, Lcom/belkin/cordova/plugin/SetupPlugin;->d:Lorg/cybergarage/upnp/Device;

    invoke-virtual {v11}, Lorg/cybergarage/upnp/Device;->getIPAddress()Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    const-string v11, ":"

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    iget-object v11, p0, Lcom/belkin/cordova/plugin/SetupPlugin$2;->this$0:Lcom/belkin/cordova/plugin/SetupPlugin;

    iget-object v11, v11, Lcom/belkin/cordova/plugin/SetupPlugin;->d:Lorg/cybergarage/upnp/Device;

    invoke-virtual {v11}, Lorg/cybergarage/upnp/Device;->getPort()I

    move-result v11

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v10

    const-string v11, "/icon.jpg"

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    .line 200
    .local v6, "iconURL":Ljava/lang/String;
    iget-object v10, p0, Lcom/belkin/cordova/plugin/SetupPlugin$2;->this$0:Lcom/belkin/cordova/plugin/SetupPlugin;

    iget-object v10, v10, Lcom/belkin/cordova/plugin/SetupPlugin;->d:Lorg/cybergarage/upnp/Device;

    invoke-virtual {v10}, Lorg/cybergarage/upnp/Device;->getMacAddress()Ljava/lang/String;

    move-result-object v10

    invoke-static {v7}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v11

    invoke-static {v6, v10, v11}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->saveIconToStorage(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    .line 202
    const-string v10, "SetupPlugin"

    new-instance v11, Ljava/lang/StringBuilder;

    invoke-direct {v11}, Ljava/lang/StringBuilder;-><init>()V

    const-string v12, "Downloaded icon from URL: "

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    const-string v12, "; UDN: "

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    iget-object v12, p0, Lcom/belkin/cordova/plugin/SetupPlugin$2;->this$0:Lcom/belkin/cordova/plugin/SetupPlugin;

    iget-object v12, v12, Lcom/belkin/cordova/plugin/SetupPlugin;->d:Lorg/cybergarage/upnp/Device;

    invoke-virtual {v12}, Lorg/cybergarage/upnp/Device;->getUDN()Ljava/lang/String;

    move-result-object v12

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    const-string v12, "Icon Loc in storage: "

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v11

    invoke-static {v10, v11}, Lcom/belkin/utils/LogUtils;->debugLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 211
    .end local v6    # "iconURL":Ljava/lang/String;
    .end local v7    # "iconVersion":I
    .end local v8    # "response":Ljava/lang/String;
    :cond_2
    :goto_4
    iget-object v10, p0, Lcom/belkin/cordova/plugin/SetupPlugin$2;->this$0:Lcom/belkin/cordova/plugin/SetupPlugin;

    iget-object v10, v10, Lcom/belkin/cordova/plugin/SetupPlugin;->mDeviceListManager:Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    if-nez v10, :cond_3

    .line 212
    iget-object v10, p0, Lcom/belkin/cordova/plugin/SetupPlugin$2;->this$0:Lcom/belkin/cordova/plugin/SetupPlugin;

    iget-object v11, p0, Lcom/belkin/cordova/plugin/SetupPlugin$2;->this$0:Lcom/belkin/cordova/plugin/SetupPlugin;

    invoke-static {v11}, Lcom/belkin/cordova/plugin/SetupPlugin;->access$000(Lcom/belkin/cordova/plugin/SetupPlugin;)Landroid/content/Context;

    move-result-object v11

    invoke-static {v11}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->getInstance(Landroid/content/Context;)Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    move-result-object v11

    iput-object v11, v10, Lcom/belkin/cordova/plugin/SetupPlugin;->mDeviceListManager:Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    .line 214
    :cond_3
    iget-object v10, p0, Lcom/belkin/cordova/plugin/SetupPlugin$2;->this$0:Lcom/belkin/cordova/plugin/SetupPlugin;

    iget-object v10, v10, Lcom/belkin/cordova/plugin/SetupPlugin;->mDeviceListManager:Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    iget-object v11, p0, Lcom/belkin/cordova/plugin/SetupPlugin$2;->this$0:Lcom/belkin/cordova/plugin/SetupPlugin;

    iget-object v11, v11, Lcom/belkin/cordova/plugin/SetupPlugin;->d:Lorg/cybergarage/upnp/Device;

    invoke-virtual {v10, v11}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->deviceAdded(Lorg/cybergarage/upnp/Device;)V

    .line 216
    .end local v4    # "getIconVersionAction":Lorg/cybergarage/upnp/Action;
    :cond_4
    invoke-virtual {v0, v5}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;

    .line 217
    const-string v9, ""

    .line 218
    .local v9, "udn":Ljava/lang/String;
    iget-object v10, p0, Lcom/belkin/cordova/plugin/SetupPlugin$2;->this$0:Lcom/belkin/cordova/plugin/SetupPlugin;

    iget-object v10, v10, Lcom/belkin/cordova/plugin/SetupPlugin;->d:Lorg/cybergarage/upnp/Device;

    if-eqz v10, :cond_5

    .line 219
    iget-object v10, p0, Lcom/belkin/cordova/plugin/SetupPlugin$2;->this$0:Lcom/belkin/cordova/plugin/SetupPlugin;

    iget-object v10, v10, Lcom/belkin/cordova/plugin/SetupPlugin;->d:Lorg/cybergarage/upnp/Device;

    invoke-virtual {v10}, Lorg/cybergarage/upnp/Device;->getUDN()Ljava/lang/String;

    move-result-object v9

    .line 221
    :cond_5
    invoke-virtual {v0, v9}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;

    .line 223
    iget-object v10, p0, Lcom/belkin/cordova/plugin/SetupPlugin$2;->val$callbackContext:Lorg/apache/cordova/CallbackContext;

    invoke-virtual {v10, v0}, Lorg/apache/cordova/CallbackContext;->success(Lorg/json/JSONArray;)V

    .line 224
    return-void

    .line 142
    .end local v0    # "array":Lorg/json/JSONArray;
    .end local v1    # "deviceSSID":Ljava/lang/String;
    .end local v5    # "iconLocation":Ljava/lang/String;
    .end local v9    # "udn":Ljava/lang/String;
    :catch_0
    move-exception v3

    .line 143
    .local v3, "e1":Ljava/lang/InterruptedException;
    const-string v10, "SetupPlugin"

    const-string v11, "Exception during ACTION_SETUP_DEVICE_DETAILS "

    invoke-static {v10, v11, v3}, Lcom/belkin/utils/LogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    goto/16 :goto_0

    .line 162
    .end local v3    # "e1":Ljava/lang/InterruptedException;
    .restart local v0    # "array":Lorg/json/JSONArray;
    :catch_1
    move-exception v2

    .line 164
    .local v2, "e":Ljava/lang/Exception;
    invoke-virtual {v2}, Ljava/lang/Exception;->printStackTrace()V

    goto/16 :goto_1

    .line 173
    .end local v2    # "e":Ljava/lang/Exception;
    .restart local v1    # "deviceSSID":Ljava/lang/String;
    :cond_6
    const-string v10, ""

    invoke-virtual {v0, v10}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;

    goto/16 :goto_2

    .line 179
    :cond_7
    iget-object v10, p0, Lcom/belkin/cordova/plugin/SetupPlugin$2;->this$0:Lcom/belkin/cordova/plugin/SetupPlugin;

    invoke-static {v10}, Lcom/belkin/cordova/plugin/SetupPlugin;->access$100(Lcom/belkin/cordova/plugin/SetupPlugin;)Lcom/belkin/cybergarage/wrapper/UpnpDeviceSetup;

    move-result-object v10

    invoke-virtual {v10}, Lcom/belkin/cybergarage/wrapper/UpnpDeviceSetup;->isSmartSetup()Z

    move-result v10

    if-eqz v10, :cond_8

    .line 180
    const-string v10, "SMART_SETUP"

    invoke-virtual {v0, v10}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;

    goto/16 :goto_3

    .line 183
    :cond_8
    const-string v10, ""

    invoke-virtual {v0, v10}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;

    goto/16 :goto_3

    .line 205
    .restart local v4    # "getIconVersionAction":Lorg/cybergarage/upnp/Action;
    .restart local v5    # "iconLocation":Ljava/lang/String;
    .restart local v8    # "response":Ljava/lang/String;
    :cond_9
    const-string v10, "SetupPlugin"

    const-string v11, "GET ICON VERSION Action response is EMPTY."

    invoke-static {v10, v11}, Lcom/belkin/utils/LogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_4

    .line 208
    .end local v8    # "response":Ljava/lang/String;
    :cond_a
    const-string v10, "SetupPlugin"

    const-string v11, "GET ICON VERSION Action not supported by setup device."

    invoke-static {v10, v11}, Lcom/belkin/utils/LogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_4
.end method
