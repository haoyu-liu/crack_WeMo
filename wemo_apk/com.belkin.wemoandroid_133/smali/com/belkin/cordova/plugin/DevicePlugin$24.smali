.class Lcom/belkin/cordova/plugin/DevicePlugin$24;
.super Ljava/lang/Object;
.source "DevicePlugin.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/belkin/cordova/plugin/DevicePlugin;->getEndListStatus(Lorg/json/JSONArray;)V
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
    .line 2872
    iput-object p1, p0, Lcom/belkin/cordova/plugin/DevicePlugin$24;->this$0:Lcom/belkin/cordova/plugin/DevicePlugin;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 8

    .prologue
    .line 2876
    :try_start_0
    new-instance v0, Ljava/lang/StringBuffer;

    invoke-direct {v0}, Ljava/lang/StringBuffer;-><init>()V

    .line 2877
    .local v0, "LedDevices":Ljava/lang/StringBuffer;
    const-string v5, "DevicePlugin"

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "params..........."

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    iget-object v7, p0, Lcom/belkin/cordova/plugin/DevicePlugin$24;->this$0:Lcom/belkin/cordova/plugin/DevicePlugin;

    invoke-static {v7}, Lcom/belkin/cordova/plugin/DevicePlugin;->access$1900(Lcom/belkin/cordova/plugin/DevicePlugin;)Lorg/json/JSONArray;

    move-result-object v7

    invoke-virtual {v7}, Lorg/json/JSONArray;->length()I

    move-result v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, "--"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    iget-object v7, p0, Lcom/belkin/cordova/plugin/DevicePlugin$24;->this$0:Lcom/belkin/cordova/plugin/DevicePlugin;

    invoke-static {v7}, Lcom/belkin/cordova/plugin/DevicePlugin;->access$1900(Lcom/belkin/cordova/plugin/DevicePlugin;)Lorg/json/JSONArray;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 2878
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_0
    iget-object v5, p0, Lcom/belkin/cordova/plugin/DevicePlugin$24;->this$0:Lcom/belkin/cordova/plugin/DevicePlugin;

    invoke-static {v5}, Lcom/belkin/cordova/plugin/DevicePlugin;->access$1900(Lcom/belkin/cordova/plugin/DevicePlugin;)Lorg/json/JSONArray;

    move-result-object v5

    invoke-virtual {v5}, Lorg/json/JSONArray;->length()I

    move-result v5

    if-ge v2, v5, :cond_1

    .line 2879
    iget-object v5, p0, Lcom/belkin/cordova/plugin/DevicePlugin$24;->this$0:Lcom/belkin/cordova/plugin/DevicePlugin;

    invoke-static {v5}, Lcom/belkin/cordova/plugin/DevicePlugin;->access$1900(Lcom/belkin/cordova/plugin/DevicePlugin;)Lorg/json/JSONArray;

    move-result-object v5

    invoke-virtual {v5, v2}, Lorg/json/JSONArray;->get(I)Ljava/lang/Object;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v0, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 2880
    iget-object v5, p0, Lcom/belkin/cordova/plugin/DevicePlugin$24;->this$0:Lcom/belkin/cordova/plugin/DevicePlugin;

    invoke-static {v5}, Lcom/belkin/cordova/plugin/DevicePlugin;->access$1900(Lcom/belkin/cordova/plugin/DevicePlugin;)Lorg/json/JSONArray;

    move-result-object v5

    invoke-virtual {v5}, Lorg/json/JSONArray;->length()I

    move-result v5

    add-int/lit8 v5, v5, -0x1

    if-ge v2, v5, :cond_0

    .line 2881
    const-string v5, ","

    invoke-virtual {v0, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 2882
    :cond_0
    const-string v5, "DevicePlugin"

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "params inside..........."

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    iget-object v7, p0, Lcom/belkin/cordova/plugin/DevicePlugin$24;->this$0:Lcom/belkin/cordova/plugin/DevicePlugin;

    invoke-static {v7}, Lcom/belkin/cordova/plugin/DevicePlugin;->access$1900(Lcom/belkin/cordova/plugin/DevicePlugin;)Lorg/json/JSONArray;

    move-result-object v7

    invoke-virtual {v7, v2}, Lorg/json/JSONArray;->get(I)Ljava/lang/Object;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, "---"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 2878
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 2884
    :cond_1
    iget-object v5, p0, Lcom/belkin/cordova/plugin/DevicePlugin$24;->this$0:Lcom/belkin/cordova/plugin/DevicePlugin;

    iget-object v6, p0, Lcom/belkin/cordova/plugin/DevicePlugin$24;->this$0:Lcom/belkin/cordova/plugin/DevicePlugin;

    invoke-static {v6}, Lcom/belkin/cordova/plugin/DevicePlugin;->access$000(Lcom/belkin/cordova/plugin/DevicePlugin;)Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;

    move-result-object v6

    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->getLedDeviceStatus(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v6

    invoke-static {v5, v6}, Lcom/belkin/cordova/plugin/DevicePlugin;->access$2002(Lcom/belkin/cordova/plugin/DevicePlugin;Lorg/json/JSONArray;)Lorg/json/JSONArray;

    .line 2886
    const-string v5, "DevicePlugin"

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "pushDeviceListStatusIntent: "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    iget-object v7, p0, Lcom/belkin/cordova/plugin/DevicePlugin$24;->this$0:Lcom/belkin/cordova/plugin/DevicePlugin;

    invoke-static {v7}, Lcom/belkin/cordova/plugin/DevicePlugin;->access$2000(Lcom/belkin/cordova/plugin/DevicePlugin;)Lorg/json/JSONArray;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 2887
    new-instance v3, Landroid/content/Intent;

    invoke-direct {v3}, Landroid/content/Intent;-><init>()V

    .line 2888
    .local v3, "intent":Landroid/content/Intent;
    new-instance v4, Ljava/util/ArrayList;

    invoke-direct {v4}, Ljava/util/ArrayList;-><init>()V

    .line 2889
    .local v4, "tempList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    const/4 v2, 0x0

    :goto_1
    iget-object v5, p0, Lcom/belkin/cordova/plugin/DevicePlugin$24;->this$0:Lcom/belkin/cordova/plugin/DevicePlugin;

    invoke-static {v5}, Lcom/belkin/cordova/plugin/DevicePlugin;->access$2000(Lcom/belkin/cordova/plugin/DevicePlugin;)Lorg/json/JSONArray;

    move-result-object v5

    invoke-virtual {v5}, Lorg/json/JSONArray;->length()I
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_1

    move-result v5

    if-ge v2, v5, :cond_2

    .line 2891
    :try_start_1
    iget-object v5, p0, Lcom/belkin/cordova/plugin/DevicePlugin$24;->this$0:Lcom/belkin/cordova/plugin/DevicePlugin;

    invoke-static {v5}, Lcom/belkin/cordova/plugin/DevicePlugin;->access$2000(Lcom/belkin/cordova/plugin/DevicePlugin;)Lorg/json/JSONArray;

    move-result-object v5

    invoke-virtual {v5, v2}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v5

    invoke-virtual {v5}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
    :try_end_1
    .catch Lorg/json/JSONException; {:try_start_1 .. :try_end_1} :catch_0

    .line 2889
    :goto_2
    add-int/lit8 v2, v2, 0x1

    goto :goto_1

    .line 2892
    :catch_0
    move-exception v1

    .line 2893
    .local v1, "e":Lorg/json/JSONException;
    :try_start_2
    invoke-virtual {v1}, Lorg/json/JSONException;->printStackTrace()V
    :try_end_2
    .catch Lorg/json/JSONException; {:try_start_2 .. :try_end_2} :catch_1

    goto :goto_2

    .line 2900
    .end local v0    # "LedDevices":Ljava/lang/StringBuffer;
    .end local v1    # "e":Lorg/json/JSONException;
    .end local v2    # "i":I
    .end local v3    # "intent":Landroid/content/Intent;
    .end local v4    # "tempList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    :catch_1
    move-exception v1

    .line 2902
    .restart local v1    # "e":Lorg/json/JSONException;
    invoke-virtual {v1}, Lorg/json/JSONException;->printStackTrace()V

    .line 2905
    .end local v1    # "e":Lorg/json/JSONException;
    :goto_3
    return-void

    .line 2896
    .restart local v0    # "LedDevices":Ljava/lang/StringBuffer;
    .restart local v2    # "i":I
    .restart local v3    # "intent":Landroid/content/Intent;
    .restart local v4    # "tempList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    :cond_2
    :try_start_3
    const-string v5, "getLedStatusList"

    invoke-virtual {v3, v5, v4}, Landroid/content/Intent;->putStringArrayListExtra(Ljava/lang/String;Ljava/util/ArrayList;)Landroid/content/Intent;

    .line 2897
    const-string v5, "com.controller.belkin.hybrid.BRIDGE_DEVICES_STATUS"

    invoke-virtual {v3, v5}, Landroid/content/Intent;->setAction(Ljava/lang/String;)Landroid/content/Intent;

    .line 2898
    sget-object v5, Lcom/belkin/cordova/plugin/DevicePlugin;->mContext:Landroid/content/Context;

    invoke-virtual {v5, v3}, Landroid/content/Context;->sendBroadcast(Landroid/content/Intent;)V
    :try_end_3
    .catch Lorg/json/JSONException; {:try_start_3 .. :try_end_3} :catch_1

    goto :goto_3
.end method
