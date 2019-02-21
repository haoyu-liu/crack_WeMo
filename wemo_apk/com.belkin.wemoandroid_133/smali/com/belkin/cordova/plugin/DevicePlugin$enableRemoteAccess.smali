.class public Lcom/belkin/cordova/plugin/DevicePlugin$enableRemoteAccess;
.super Landroid/os/AsyncTask;
.source "DevicePlugin.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/belkin/cordova/plugin/DevicePlugin;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "enableRemoteAccess"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroid/os/AsyncTask",
        "<",
        "Ljava/lang/Void;",
        "Ljava/lang/Void;",
        "Lorg/json/JSONObject;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/belkin/cordova/plugin/DevicePlugin;


# direct methods
.method public constructor <init>(Lcom/belkin/cordova/plugin/DevicePlugin;)V
    .locals 0

    .prologue
    .line 2340
    iput-object p1, p0, Lcom/belkin/cordova/plugin/DevicePlugin$enableRemoteAccess;->this$0:Lcom/belkin/cordova/plugin/DevicePlugin;

    invoke-direct {p0}, Landroid/os/AsyncTask;-><init>()V

    return-void
.end method


# virtual methods
.method protected bridge synthetic doInBackground([Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1
    .param p1, "x0"    # [Ljava/lang/Object;

    .prologue
    .line 2340
    check-cast p1, [Ljava/lang/Void;

    .end local p1    # "x0":[Ljava/lang/Object;
    invoke-virtual {p0, p1}, Lcom/belkin/cordova/plugin/DevicePlugin$enableRemoteAccess;->doInBackground([Ljava/lang/Void;)Lorg/json/JSONObject;

    move-result-object v0

    return-object v0
.end method

.method protected varargs doInBackground([Ljava/lang/Void;)Lorg/json/JSONObject;
    .locals 8
    .param p1, "params"    # [Ljava/lang/Void;

    .prologue
    .line 2343
    const-string v5, "DevicePlugin"

    const-string v6, "doInBackground: enableRemoteAccess"

    invoke-static {v5, v6}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 2344
    const/4 v3, 0x0

    .line 2345
    .local v3, "remoteObject":Lorg/json/JSONObject;
    const/4 v4, 0x0

    .line 2346
    .local v4, "tmpDevice":Lcom/belkin/wemo/cache/data/DeviceInformation;
    sget-object v5, Lcom/belkin/cordova/plugin/DevicePlugin;->mDLM:Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    invoke-virtual {v5}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->getDeviceInformation()Ljava/util/ArrayList;

    move-result-object v5

    invoke-virtual {v5}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v2

    .local v2, "i$":Ljava/util/Iterator;
    :cond_0
    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_1

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/belkin/wemo/cache/data/DeviceInformation;

    .line 2347
    .local v0, "device":Lcom/belkin/wemo/cache/data/DeviceInformation;
    invoke-virtual {v0}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getInActive()I

    move-result v5

    if-nez v5, :cond_0

    .line 2348
    move-object v4, v0

    goto :goto_0

    .line 2352
    .end local v0    # "device":Lcom/belkin/wemo/cache/data/DeviceInformation;
    :cond_1
    const-wide/16 v6, 0x7d0

    :try_start_0
    invoke-static {v6, v7}, Ljava/lang/Thread;->sleep(J)V

    .line 2353
    iget-object v5, p0, Lcom/belkin/cordova/plugin/DevicePlugin$enableRemoteAccess;->this$0:Lcom/belkin/cordova/plugin/DevicePlugin;

    invoke-static {v5}, Lcom/belkin/cordova/plugin/DevicePlugin;->access$000(Lcom/belkin/cordova/plugin/DevicePlugin;)Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;

    move-result-object v5

    invoke-virtual {v5}, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->getWeMoDeviceList()Lorg/json/JSONObject;

    move-result-object v5

    invoke-virtual {v5}, Lorg/json/JSONObject;->length()I

    move-result v5

    if-lez v5, :cond_2

    .line 2354
    iget-object v5, p0, Lcom/belkin/cordova/plugin/DevicePlugin$enableRemoteAccess;->this$0:Lcom/belkin/cordova/plugin/DevicePlugin;

    invoke-static {v5}, Lcom/belkin/cordova/plugin/DevicePlugin;->access$000(Lcom/belkin/cordova/plugin/DevicePlugin;)Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;

    move-result-object v5

    invoke-virtual {v5, v4}, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->enableRemoteAccess(Lcom/belkin/wemo/cache/data/DeviceInformation;)Lorg/json/JSONObject;
    :try_end_0
    .catch Lcom/belkin/exception/DatabaseException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_2

    move-result-object v3

    .line 2366
    :cond_2
    :goto_1
    return-object v3

    .line 2356
    :catch_0
    move-exception v1

    .line 2358
    .local v1, "e":Lcom/belkin/exception/DatabaseException;
    invoke-virtual {v1}, Lcom/belkin/exception/DatabaseException;->printStackTrace()V

    goto :goto_1

    .line 2359
    .end local v1    # "e":Lcom/belkin/exception/DatabaseException;
    :catch_1
    move-exception v1

    .line 2361
    .local v1, "e":Lorg/json/JSONException;
    invoke-virtual {v1}, Lorg/json/JSONException;->printStackTrace()V

    goto :goto_1

    .line 2362
    .end local v1    # "e":Lorg/json/JSONException;
    :catch_2
    move-exception v1

    .line 2364
    .local v1, "e":Ljava/lang/InterruptedException;
    invoke-virtual {v1}, Ljava/lang/InterruptedException;->printStackTrace()V

    goto :goto_1
.end method

.method protected bridge synthetic onPostExecute(Ljava/lang/Object;)V
    .locals 0
    .param p1, "x0"    # Ljava/lang/Object;

    .prologue
    .line 2340
    check-cast p1, Lorg/json/JSONObject;

    .end local p1    # "x0":Ljava/lang/Object;
    invoke-virtual {p0, p1}, Lcom/belkin/cordova/plugin/DevicePlugin$enableRemoteAccess;->onPostExecute(Lorg/json/JSONObject;)V

    return-void
.end method

.method protected onPostExecute(Lorg/json/JSONObject;)V
    .locals 12
    .param p1, "obj"    # Lorg/json/JSONObject;

    .prologue
    .line 2372
    :try_start_0
    const-string v8, "DevicePlugin"

    const-string v9, "Remote Access enabled in background"

    invoke-static {v8, v9}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 2373
    const-string v8, "DevicePlugin"

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "private key...: "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    const-string v10, "privateKeyPhone"

    invoke-virtual {p1, v10}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-static {v8, v9}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 2374
    const-string v8, "DevicePlugin"

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "Home ID...: "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    const-string v10, "homeId"

    invoke-virtual {p1, v10}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-static {v8, v9}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 2375
    const-string v8, "DevicePlugin"

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "State...: "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    const-string v10, "statusCode"

    invoke-virtual {p1, v10}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-static {v8, v9}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 2376
    const-string v8, "DevicePlugin"

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "UUID...: "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    iget-object v10, p0, Lcom/belkin/cordova/plugin/DevicePlugin$enableRemoteAccess;->this$0:Lcom/belkin/cordova/plugin/DevicePlugin;

    invoke-static {v10}, Lcom/belkin/cordova/plugin/DevicePlugin;->access$700(Lcom/belkin/cordova/plugin/DevicePlugin;)Lcom/belkin/utils/WiFiSecurityUtil;

    move-result-object v10

    sget-object v11, Lcom/belkin/cordova/plugin/DevicePlugin;->mContext:Landroid/content/Context;

    invoke-virtual {v10, v11}, Lcom/belkin/utils/WiFiSecurityUtil;->getDeviceID(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-static {v8, v9}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 2377
    iget-object v8, p0, Lcom/belkin/cordova/plugin/DevicePlugin$enableRemoteAccess;->this$0:Lcom/belkin/cordova/plugin/DevicePlugin;

    invoke-static {v8}, Lcom/belkin/cordova/plugin/DevicePlugin;->access$600(Lcom/belkin/cordova/plugin/DevicePlugin;)Lcom/belkin/wemo/cache/utils/SharePreferences;

    move-result-object v8

    const/4 v9, 0x0

    invoke-virtual {v8, v9}, Lcom/belkin/wemo/cache/utils/SharePreferences;->setRemoteAutoEnableNeeded(Z)V

    .line 2378
    const/4 v6, 0x0

    .line 2379
    .local v6, "sucess":Z
    const-string v8, "statusCode"

    invoke-virtual {p1, v8}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    const-string v9, "S"

    invoke-virtual {v8, v9}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v8

    if-eqz v8, :cond_3

    .line 2380
    const/4 v6, 0x1

    .line 2381
    const-string v8, "privateKeyPhone"

    invoke-virtual {p1, v8}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    .line 2382
    .local v5, "privateKey":Ljava/lang/String;
    const-string v8, "NOKEY"

    invoke-virtual {v5, v8}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v8

    if-nez v8, :cond_0

    .line 2383
    iget-object v8, p0, Lcom/belkin/cordova/plugin/DevicePlugin$enableRemoteAccess;->this$0:Lcom/belkin/cordova/plugin/DevicePlugin;

    invoke-static {v8}, Lcom/belkin/cordova/plugin/DevicePlugin;->access$600(Lcom/belkin/cordova/plugin/DevicePlugin;)Lcom/belkin/wemo/cache/utils/SharePreferences;

    move-result-object v8

    invoke-virtual {v8, v5}, Lcom/belkin/wemo/cache/utils/SharePreferences;->storePrivateKey(Ljava/lang/String;)V

    .line 2386
    :cond_0
    iget-object v8, p0, Lcom/belkin/cordova/plugin/DevicePlugin$enableRemoteAccess;->this$0:Lcom/belkin/cordova/plugin/DevicePlugin;

    invoke-static {v8}, Lcom/belkin/cordova/plugin/DevicePlugin;->access$600(Lcom/belkin/cordova/plugin/DevicePlugin;)Lcom/belkin/wemo/cache/utils/SharePreferences;

    move-result-object v8

    const-string v9, "homeId"

    invoke-virtual {p1, v9}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Lcom/belkin/wemo/cache/utils/SharePreferences;->storeHomeId(Ljava/lang/String;)V

    .line 2387
    new-instance v4, Ljava/util/HashSet;

    invoke-direct {v4}, Ljava/util/HashSet;-><init>()V

    .line 2388
    .local v4, "homeSSIDs":Ljava/util/HashSet;, "Ljava/util/HashSet<Ljava/lang/String;>;"
    iget-object v8, p0, Lcom/belkin/cordova/plugin/DevicePlugin$enableRemoteAccess;->this$0:Lcom/belkin/cordova/plugin/DevicePlugin;

    invoke-static {v8}, Lcom/belkin/cordova/plugin/DevicePlugin;->access$1500(Lcom/belkin/cordova/plugin/DevicePlugin;)Lcom/belkin/wemo/cache/utils/SDKNetworkUtils;

    move-result-object v8

    invoke-virtual {v8}, Lcom/belkin/wemo/cache/utils/SDKNetworkUtils;->getSSID()Ljava/lang/String;

    move-result-object v7

    .line 2389
    .local v7, "wifiSSID":Ljava/lang/String;
    invoke-virtual {v4, v7}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    .line 2390
    iget-object v8, p0, Lcom/belkin/cordova/plugin/DevicePlugin$enableRemoteAccess;->this$0:Lcom/belkin/cordova/plugin/DevicePlugin;

    invoke-static {v8}, Lcom/belkin/cordova/plugin/DevicePlugin;->access$600(Lcom/belkin/cordova/plugin/DevicePlugin;)Lcom/belkin/wemo/cache/utils/SharePreferences;

    move-result-object v8

    invoke-virtual {v8, v4}, Lcom/belkin/wemo/cache/utils/SharePreferences;->setHomeSSIDs(Ljava/util/Set;)Z

    .line 2391
    iget-object v8, p0, Lcom/belkin/cordova/plugin/DevicePlugin$enableRemoteAccess;->this$0:Lcom/belkin/cordova/plugin/DevicePlugin;

    invoke-static {v8}, Lcom/belkin/cordova/plugin/DevicePlugin;->access$600(Lcom/belkin/cordova/plugin/DevicePlugin;)Lcom/belkin/wemo/cache/utils/SharePreferences;

    move-result-object v8

    invoke-virtual {v8, v7}, Lcom/belkin/wemo/cache/utils/SharePreferences;->setRemoteAccessSSID(Ljava/lang/String;)Z

    .line 2392
    new-instance v1, Ljava/util/HashSet;

    invoke-direct {v1}, Ljava/util/HashSet;-><init>()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 2393
    .local v1, "arpMacs":Ljava/util/HashSet;, "Ljava/util/HashSet<Ljava/lang/String;>;"
    const/4 v0, 0x0

    .line 2395
    .local v0, "arpMac":Ljava/lang/String;
    :try_start_1
    const-string v8, "arpMac"

    invoke-virtual {p1, v8}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    move-result-object v0

    .line 2398
    :goto_0
    if-eqz v0, :cond_4

    :try_start_2
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v8

    if-lez v8, :cond_4

    .line 2400
    invoke-virtual {v1, v0}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    .line 2401
    const-string v8, "DevicePlugin"

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "enableRemoteAccess onPostExecute Got ArpMac from FW: "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-static {v8, v9}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 2411
    :cond_1
    :goto_1
    iget-object v8, p0, Lcom/belkin/cordova/plugin/DevicePlugin$enableRemoteAccess;->this$0:Lcom/belkin/cordova/plugin/DevicePlugin;

    invoke-static {v8}, Lcom/belkin/cordova/plugin/DevicePlugin;->access$600(Lcom/belkin/cordova/plugin/DevicePlugin;)Lcom/belkin/wemo/cache/utils/SharePreferences;

    move-result-object v8

    invoke-virtual {v8, v1}, Lcom/belkin/wemo/cache/utils/SharePreferences;->setARPMacs(Ljava/util/Set;)Z

    .line 2412
    iget-object v8, p0, Lcom/belkin/cordova/plugin/DevicePlugin$enableRemoteAccess;->this$0:Lcom/belkin/cordova/plugin/DevicePlugin;

    invoke-static {v8}, Lcom/belkin/cordova/plugin/DevicePlugin;->access$600(Lcom/belkin/cordova/plugin/DevicePlugin;)Lcom/belkin/wemo/cache/utils/SharePreferences;

    move-result-object v8

    invoke-virtual {v8, v6}, Lcom/belkin/wemo/cache/utils/SharePreferences;->setRemoteEnabled(Z)Z

    .line 2413
    if-nez v6, :cond_2

    .line 2414
    iget-object v8, p0, Lcom/belkin/cordova/plugin/DevicePlugin$enableRemoteAccess;->this$0:Lcom/belkin/cordova/plugin/DevicePlugin;

    invoke-static {v8}, Lcom/belkin/cordova/plugin/DevicePlugin;->access$600(Lcom/belkin/cordova/plugin/DevicePlugin;)Lcom/belkin/wemo/cache/utils/SharePreferences;

    move-result-object v8

    const-string v9, "0"

    invoke-virtual {v8, v9}, Lcom/belkin/wemo/cache/utils/SharePreferences;->setDBVersion(Ljava/lang/String;)V

    .line 2417
    :cond_2
    const-string v8, "DevicePlugin"

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "onPostExecute SSID: "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    iget-object v10, p0, Lcom/belkin/cordova/plugin/DevicePlugin$enableRemoteAccess;->this$0:Lcom/belkin/cordova/plugin/DevicePlugin;

    invoke-static {v10}, Lcom/belkin/cordova/plugin/DevicePlugin;->access$1500(Lcom/belkin/cordova/plugin/DevicePlugin;)Lcom/belkin/wemo/cache/utils/SDKNetworkUtils;

    move-result-object v10

    invoke-virtual {v10}, Lcom/belkin/wemo/cache/utils/SDKNetworkUtils;->getSSID()Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    const-string v10, " arpMacs: "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-static {v8, v9}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 2419
    .end local v0    # "arpMac":Ljava/lang/String;
    .end local v1    # "arpMacs":Ljava/util/HashSet;, "Ljava/util/HashSet<Ljava/lang/String;>;"
    .end local v4    # "homeSSIDs":Ljava/util/HashSet;, "Ljava/util/HashSet<Ljava/lang/String;>;"
    .end local v5    # "privateKey":Ljava/lang/String;
    .end local v7    # "wifiSSID":Ljava/lang/String;
    :cond_3
    const-string v8, "DevicePlugin"

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "Sucess: "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, v6}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-static {v8, v9}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 2424
    .end local v6    # "sucess":Z
    :goto_2
    return-void

    .line 2405
    .restart local v0    # "arpMac":Ljava/lang/String;
    .restart local v1    # "arpMacs":Ljava/util/HashSet;, "Ljava/util/HashSet<Ljava/lang/String;>;"
    .restart local v4    # "homeSSIDs":Ljava/util/HashSet;, "Ljava/util/HashSet<Ljava/lang/String;>;"
    .restart local v5    # "privateKey":Ljava/lang/String;
    .restart local v6    # "sucess":Z
    .restart local v7    # "wifiSSID":Ljava/lang/String;
    :cond_4
    iget-object v8, p0, Lcom/belkin/cordova/plugin/DevicePlugin$enableRemoteAccess;->this$0:Lcom/belkin/cordova/plugin/DevicePlugin;

    invoke-static {v8}, Lcom/belkin/cordova/plugin/DevicePlugin;->access$1500(Lcom/belkin/cordova/plugin/DevicePlugin;)Lcom/belkin/wemo/cache/utils/SDKNetworkUtils;

    move-result-object v8

    invoke-virtual {v8}, Lcom/belkin/wemo/cache/utils/SDKNetworkUtils;->getArpMac()Ljava/lang/String;

    move-result-object v2

    .line 2406
    .local v2, "currentArpMac":Ljava/lang/String;
    if-eqz v2, :cond_1

    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v8

    if-lez v8, :cond_1

    .line 2408
    invoke-virtual {v1, v2}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0

    goto :goto_1

    .line 2421
    .end local v0    # "arpMac":Ljava/lang/String;
    .end local v1    # "arpMacs":Ljava/util/HashSet;, "Ljava/util/HashSet<Ljava/lang/String;>;"
    .end local v2    # "currentArpMac":Ljava/lang/String;
    .end local v4    # "homeSSIDs":Ljava/util/HashSet;, "Ljava/util/HashSet<Ljava/lang/String;>;"
    .end local v5    # "privateKey":Ljava/lang/String;
    .end local v6    # "sucess":Z
    .end local v7    # "wifiSSID":Ljava/lang/String;
    :catch_0
    move-exception v3

    .line 2422
    .local v3, "e":Ljava/lang/Exception;
    const-string v8, "DevicePlugin"

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "Exception: "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-static {v8, v9}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_2

    .line 2396
    .end local v3    # "e":Ljava/lang/Exception;
    .restart local v0    # "arpMac":Ljava/lang/String;
    .restart local v1    # "arpMacs":Ljava/util/HashSet;, "Ljava/util/HashSet<Ljava/lang/String;>;"
    .restart local v4    # "homeSSIDs":Ljava/util/HashSet;, "Ljava/util/HashSet<Ljava/lang/String;>;"
    .restart local v5    # "privateKey":Ljava/lang/String;
    .restart local v6    # "sucess":Z
    .restart local v7    # "wifiSSID":Ljava/lang/String;
    :catch_1
    move-exception v8

    goto/16 :goto_0
.end method
