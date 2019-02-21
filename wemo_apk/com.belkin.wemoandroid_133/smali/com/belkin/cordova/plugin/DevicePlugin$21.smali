.class Lcom/belkin/cordova/plugin/DevicePlugin$21;
.super Ljava/lang/Object;
.source "DevicePlugin.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/belkin/cordova/plugin/DevicePlugin;->registrationDataAsync()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/belkin/cordova/plugin/DevicePlugin;


# direct methods
.method constructor <init>(Lcom/belkin/cordova/plugin/DevicePlugin;)V
    .locals 0

    .prologue
    .line 2647
    iput-object p1, p0, Lcom/belkin/cordova/plugin/DevicePlugin$21;->this$0:Lcom/belkin/cordova/plugin/DevicePlugin;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 12

    .prologue
    .line 2651
    :try_start_0
    iget-object v9, p0, Lcom/belkin/cordova/plugin/DevicePlugin$21;->this$0:Lcom/belkin/cordova/plugin/DevicePlugin;

    invoke-static {v9}, Lcom/belkin/cordova/plugin/DevicePlugin;->access$000(Lcom/belkin/cordova/plugin/DevicePlugin;)Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;

    move-result-object v9

    invoke-virtual {v9}, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->getRegistrationData()Lorg/json/JSONObject;

    move-result-object v5

    .line 2652
    .local v5, "obj":Lorg/json/JSONObject;
    const-string v7, ""

    .line 2653
    .local v7, "status":Ljava/lang/String;
    if-eqz v5, :cond_0

    const-string v9, "registrationStatus"

    invoke-virtual {v5, v9}, Lorg/json/JSONObject;->isNull(Ljava/lang/String;)Z

    move-result v9

    if-nez v9, :cond_0

    .line 2654
    const-string v9, "registrationStatus"

    invoke-virtual {v5, v9}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    .line 2656
    :cond_0
    const-string v9, "DevicePlugin"

    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    const-string v11, "registrationDataAsync status: "

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-static {v9, v10}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 2657
    const-string v9, "S"

    invoke-virtual {v7, v9}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v9

    if-eqz v9, :cond_3

    .line 2658
    iget-object v9, p0, Lcom/belkin/cordova/plugin/DevicePlugin$21;->this$0:Lcom/belkin/cordova/plugin/DevicePlugin;

    invoke-static {v9}, Lcom/belkin/cordova/plugin/DevicePlugin;->access$600(Lcom/belkin/cordova/plugin/DevicePlugin;)Lcom/belkin/wemo/cache/utils/SharePreferences;

    move-result-object v9

    const/4 v10, 0x0

    invoke-virtual {v9, v10}, Lcom/belkin/wemo/cache/utils/SharePreferences;->setRemoteAutoEnableNeeded(Z)V

    .line 2660
    const-string v9, "privateKeyPhone"

    invoke-virtual {v5, v9}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    .line 2661
    .local v6, "privateKey":Ljava/lang/String;
    const-string v9, "NOKEY"

    invoke-virtual {v6, v9}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v9

    if-nez v9, :cond_1

    .line 2662
    iget-object v9, p0, Lcom/belkin/cordova/plugin/DevicePlugin$21;->this$0:Lcom/belkin/cordova/plugin/DevicePlugin;

    invoke-static {v9}, Lcom/belkin/cordova/plugin/DevicePlugin;->access$600(Lcom/belkin/cordova/plugin/DevicePlugin;)Lcom/belkin/wemo/cache/utils/SharePreferences;

    move-result-object v9

    invoke-virtual {v9, v6}, Lcom/belkin/wemo/cache/utils/SharePreferences;->storePrivateKey(Ljava/lang/String;)V

    .line 2665
    :cond_1
    iget-object v9, p0, Lcom/belkin/cordova/plugin/DevicePlugin$21;->this$0:Lcom/belkin/cordova/plugin/DevicePlugin;

    invoke-static {v9}, Lcom/belkin/cordova/plugin/DevicePlugin;->access$600(Lcom/belkin/cordova/plugin/DevicePlugin;)Lcom/belkin/wemo/cache/utils/SharePreferences;

    move-result-object v9

    const-string v10, "homeId"

    invoke-virtual {v5, v10}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v9, v10}, Lcom/belkin/wemo/cache/utils/SharePreferences;->storeHomeId(Ljava/lang/String;)V

    .line 2666
    new-instance v4, Ljava/util/HashSet;

    invoke-direct {v4}, Ljava/util/HashSet;-><init>()V

    .line 2667
    .local v4, "homeSSIDs":Ljava/util/HashSet;, "Ljava/util/HashSet<Ljava/lang/String;>;"
    iget-object v9, p0, Lcom/belkin/cordova/plugin/DevicePlugin$21;->this$0:Lcom/belkin/cordova/plugin/DevicePlugin;

    invoke-static {v9}, Lcom/belkin/cordova/plugin/DevicePlugin;->access$1500(Lcom/belkin/cordova/plugin/DevicePlugin;)Lcom/belkin/wemo/cache/utils/SDKNetworkUtils;

    move-result-object v9

    invoke-virtual {v9}, Lcom/belkin/wemo/cache/utils/SDKNetworkUtils;->getSSID()Ljava/lang/String;

    move-result-object v8

    .line 2668
    .local v8, "wifiSSID":Ljava/lang/String;
    invoke-virtual {v4, v8}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    .line 2669
    iget-object v9, p0, Lcom/belkin/cordova/plugin/DevicePlugin$21;->this$0:Lcom/belkin/cordova/plugin/DevicePlugin;

    invoke-static {v9}, Lcom/belkin/cordova/plugin/DevicePlugin;->access$600(Lcom/belkin/cordova/plugin/DevicePlugin;)Lcom/belkin/wemo/cache/utils/SharePreferences;

    move-result-object v9

    invoke-virtual {v9, v4}, Lcom/belkin/wemo/cache/utils/SharePreferences;->setHomeSSIDs(Ljava/util/Set;)Z

    .line 2670
    iget-object v9, p0, Lcom/belkin/cordova/plugin/DevicePlugin$21;->this$0:Lcom/belkin/cordova/plugin/DevicePlugin;

    invoke-static {v9}, Lcom/belkin/cordova/plugin/DevicePlugin;->access$600(Lcom/belkin/cordova/plugin/DevicePlugin;)Lcom/belkin/wemo/cache/utils/SharePreferences;

    move-result-object v9

    invoke-virtual {v9, v8}, Lcom/belkin/wemo/cache/utils/SharePreferences;->setRemoteAccessSSID(Ljava/lang/String;)Z

    .line 2671
    new-instance v1, Ljava/util/HashSet;

    invoke-direct {v1}, Ljava/util/HashSet;-><init>()V
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 2672
    .local v1, "arpMacs":Ljava/util/HashSet;, "Ljava/util/HashSet<Ljava/lang/String;>;"
    const/4 v0, 0x0

    .line 2674
    .local v0, "arpMac":Ljava/lang/String;
    :try_start_1
    const-string v9, "arpMac"

    invoke-virtual {v5, v9}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1
    .catch Lorg/json/JSONException; {:try_start_1 .. :try_end_1} :catch_0

    move-result-object v0

    .line 2677
    :goto_0
    if-eqz v0, :cond_4

    :try_start_2
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v9

    if-lez v9, :cond_4

    .line 2679
    invoke-virtual {v1, v0}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    .line 2680
    const-string v9, "DevicePlugin"

    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    const-string v11, "registrationDataAsync Got ArpMac from FW: "

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-static {v9, v10}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 2688
    :cond_2
    :goto_1
    iget-object v9, p0, Lcom/belkin/cordova/plugin/DevicePlugin$21;->this$0:Lcom/belkin/cordova/plugin/DevicePlugin;

    invoke-static {v9}, Lcom/belkin/cordova/plugin/DevicePlugin;->access$600(Lcom/belkin/cordova/plugin/DevicePlugin;)Lcom/belkin/wemo/cache/utils/SharePreferences;

    move-result-object v9

    invoke-virtual {v9, v1}, Lcom/belkin/wemo/cache/utils/SharePreferences;->setARPMacs(Ljava/util/Set;)Z

    .line 2689
    iget-object v9, p0, Lcom/belkin/cordova/plugin/DevicePlugin$21;->this$0:Lcom/belkin/cordova/plugin/DevicePlugin;

    invoke-static {v9}, Lcom/belkin/cordova/plugin/DevicePlugin;->access$600(Lcom/belkin/cordova/plugin/DevicePlugin;)Lcom/belkin/wemo/cache/utils/SharePreferences;

    move-result-object v9

    const/4 v10, 0x1

    invoke-virtual {v9, v10}, Lcom/belkin/wemo/cache/utils/SharePreferences;->setRemoteEnabled(Z)Z

    .line 2690
    const-string v9, "DevicePlugin"

    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    const-string v11, "registrationDataAsync ACTION_GET_REGISTRATION_DATA HomeId: "

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    iget-object v11, p0, Lcom/belkin/cordova/plugin/DevicePlugin$21;->this$0:Lcom/belkin/cordova/plugin/DevicePlugin;

    invoke-static {v11}, Lcom/belkin/cordova/plugin/DevicePlugin;->access$600(Lcom/belkin/cordova/plugin/DevicePlugin;)Lcom/belkin/wemo/cache/utils/SharePreferences;

    move-result-object v11

    invoke-virtual {v11}, Lcom/belkin/wemo/cache/utils/SharePreferences;->getHomeId()Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    const-string v11, " PrivateKey: "

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    iget-object v11, p0, Lcom/belkin/cordova/plugin/DevicePlugin$21;->this$0:Lcom/belkin/cordova/plugin/DevicePlugin;

    invoke-static {v11}, Lcom/belkin/cordova/plugin/DevicePlugin;->access$600(Lcom/belkin/cordova/plugin/DevicePlugin;)Lcom/belkin/wemo/cache/utils/SharePreferences;

    move-result-object v11

    invoke-virtual {v11}, Lcom/belkin/wemo/cache/utils/SharePreferences;->getPrivateKey()Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    const-string v11, " HomeSSID: "

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    iget-object v11, p0, Lcom/belkin/cordova/plugin/DevicePlugin$21;->this$0:Lcom/belkin/cordova/plugin/DevicePlugin;

    invoke-static {v11}, Lcom/belkin/cordova/plugin/DevicePlugin;->access$600(Lcom/belkin/cordova/plugin/DevicePlugin;)Lcom/belkin/wemo/cache/utils/SharePreferences;

    move-result-object v11

    invoke-virtual {v11}, Lcom/belkin/wemo/cache/utils/SharePreferences;->getHomeSSIDs()Ljava/util/Set;

    move-result-object v11

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v10

    const-string v11, " RemoteEnabled: "

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    iget-object v11, p0, Lcom/belkin/cordova/plugin/DevicePlugin$21;->this$0:Lcom/belkin/cordova/plugin/DevicePlugin;

    invoke-static {v11}, Lcom/belkin/cordova/plugin/DevicePlugin;->access$600(Lcom/belkin/cordova/plugin/DevicePlugin;)Lcom/belkin/wemo/cache/utils/SharePreferences;

    move-result-object v11

    invoke-virtual {v11}, Lcom/belkin/wemo/cache/utils/SharePreferences;->isRemoteEnabled()Z

    move-result v11

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-static {v9, v10}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 2692
    .end local v0    # "arpMac":Ljava/lang/String;
    .end local v1    # "arpMacs":Ljava/util/HashSet;, "Ljava/util/HashSet<Ljava/lang/String;>;"
    .end local v4    # "homeSSIDs":Ljava/util/HashSet;, "Ljava/util/HashSet<Ljava/lang/String;>;"
    .end local v6    # "privateKey":Ljava/lang/String;
    .end local v8    # "wifiSSID":Ljava/lang/String;
    :cond_3
    iget-object v9, p0, Lcom/belkin/cordova/plugin/DevicePlugin$21;->this$0:Lcom/belkin/cordova/plugin/DevicePlugin;

    invoke-static {v9, v7}, Lcom/belkin/cordova/plugin/DevicePlugin;->access$1700(Lcom/belkin/cordova/plugin/DevicePlugin;Ljava/lang/String;)V

    .line 2698
    .end local v5    # "obj":Lorg/json/JSONObject;
    .end local v7    # "status":Ljava/lang/String;
    :goto_2
    return-void

    .line 2684
    .restart local v0    # "arpMac":Ljava/lang/String;
    .restart local v1    # "arpMacs":Ljava/util/HashSet;, "Ljava/util/HashSet<Ljava/lang/String;>;"
    .restart local v4    # "homeSSIDs":Ljava/util/HashSet;, "Ljava/util/HashSet<Ljava/lang/String;>;"
    .restart local v5    # "obj":Lorg/json/JSONObject;
    .restart local v6    # "privateKey":Ljava/lang/String;
    .restart local v7    # "status":Ljava/lang/String;
    .restart local v8    # "wifiSSID":Ljava/lang/String;
    :cond_4
    iget-object v9, p0, Lcom/belkin/cordova/plugin/DevicePlugin$21;->this$0:Lcom/belkin/cordova/plugin/DevicePlugin;

    invoke-static {v9}, Lcom/belkin/cordova/plugin/DevicePlugin;->access$1500(Lcom/belkin/cordova/plugin/DevicePlugin;)Lcom/belkin/wemo/cache/utils/SDKNetworkUtils;

    move-result-object v9

    invoke-virtual {v9}, Lcom/belkin/wemo/cache/utils/SDKNetworkUtils;->getArpMac()Ljava/lang/String;

    move-result-object v2

    .line 2685
    .local v2, "currentArpMac":Ljava/lang/String;
    if-eqz v2, :cond_2

    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v9

    if-lez v9, :cond_2

    .line 2686
    invoke-virtual {v1, v2}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z
    :try_end_2
    .catch Lorg/json/JSONException; {:try_start_2 .. :try_end_2} :catch_0

    goto/16 :goto_1

    .line 2693
    .end local v0    # "arpMac":Ljava/lang/String;
    .end local v1    # "arpMacs":Ljava/util/HashSet;, "Ljava/util/HashSet<Ljava/lang/String;>;"
    .end local v2    # "currentArpMac":Ljava/lang/String;
    .end local v4    # "homeSSIDs":Ljava/util/HashSet;, "Ljava/util/HashSet<Ljava/lang/String;>;"
    .end local v5    # "obj":Lorg/json/JSONObject;
    .end local v6    # "privateKey":Ljava/lang/String;
    .end local v7    # "status":Ljava/lang/String;
    .end local v8    # "wifiSSID":Ljava/lang/String;
    :catch_0
    move-exception v3

    .line 2695
    .local v3, "e":Lorg/json/JSONException;
    invoke-virtual {v3}, Lorg/json/JSONException;->printStackTrace()V

    goto :goto_2

    .line 2675
    .end local v3    # "e":Lorg/json/JSONException;
    .restart local v0    # "arpMac":Ljava/lang/String;
    .restart local v1    # "arpMacs":Ljava/util/HashSet;, "Ljava/util/HashSet<Ljava/lang/String;>;"
    .restart local v4    # "homeSSIDs":Ljava/util/HashSet;, "Ljava/util/HashSet<Ljava/lang/String;>;"
    .restart local v5    # "obj":Lorg/json/JSONObject;
    .restart local v6    # "privateKey":Ljava/lang/String;
    .restart local v7    # "status":Ljava/lang/String;
    .restart local v8    # "wifiSSID":Ljava/lang/String;
    :catch_1
    move-exception v9

    goto/16 :goto_0
.end method
