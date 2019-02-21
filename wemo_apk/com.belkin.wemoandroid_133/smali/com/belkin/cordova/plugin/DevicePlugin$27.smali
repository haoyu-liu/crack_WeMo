.class Lcom/belkin/cordova/plugin/DevicePlugin$27;
.super Ljava/lang/Object;
.source "DevicePlugin.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/belkin/cordova/plugin/DevicePlugin;->getEndList()V
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
    .line 2959
    iput-object p1, p0, Lcom/belkin/cordova/plugin/DevicePlugin$27;->this$0:Lcom/belkin/cordova/plugin/DevicePlugin;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 6

    .prologue
    .line 2963
    :try_start_0
    iget-object v4, p0, Lcom/belkin/cordova/plugin/DevicePlugin$27;->this$0:Lcom/belkin/cordova/plugin/DevicePlugin;

    iget-object v5, p0, Lcom/belkin/cordova/plugin/DevicePlugin$27;->this$0:Lcom/belkin/cordova/plugin/DevicePlugin;

    invoke-static {v5}, Lcom/belkin/cordova/plugin/DevicePlugin;->access$000(Lcom/belkin/cordova/plugin/DevicePlugin;)Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;

    move-result-object v5

    invoke-virtual {v5}, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->parseGetEndDeviceList()Lorg/json/JSONArray;

    move-result-object v5

    invoke-static {v4, v5}, Lcom/belkin/cordova/plugin/DevicePlugin;->access$2002(Lcom/belkin/cordova/plugin/DevicePlugin;Lorg/json/JSONArray;)Lorg/json/JSONArray;

    .line 2964
    new-instance v2, Landroid/content/Intent;

    invoke-direct {v2}, Landroid/content/Intent;-><init>()V

    .line 2965
    .local v2, "intent":Landroid/content/Intent;
    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    .line 2966
    .local v3, "tempList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    iget-object v4, p0, Lcom/belkin/cordova/plugin/DevicePlugin$27;->this$0:Lcom/belkin/cordova/plugin/DevicePlugin;

    invoke-static {v4}, Lcom/belkin/cordova/plugin/DevicePlugin;->access$2000(Lcom/belkin/cordova/plugin/DevicePlugin;)Lorg/json/JSONArray;

    move-result-object v4

    invoke-virtual {v4}, Lorg/json/JSONArray;->length()I
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1

    move-result v4

    if-ge v1, v4, :cond_0

    .line 2968
    :try_start_1
    iget-object v4, p0, Lcom/belkin/cordova/plugin/DevicePlugin$27;->this$0:Lcom/belkin/cordova/plugin/DevicePlugin;

    invoke-static {v4}, Lcom/belkin/cordova/plugin/DevicePlugin;->access$2000(Lcom/belkin/cordova/plugin/DevicePlugin;)Lorg/json/JSONArray;

    move-result-object v4

    invoke-virtual {v4, v1}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v4

    invoke-virtual {v4}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
    :try_end_1
    .catch Lorg/json/JSONException; {:try_start_1 .. :try_end_1} :catch_0
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    .line 2966
    :goto_1
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 2969
    :catch_0
    move-exception v0

    .line 2970
    .local v0, "e":Lorg/json/JSONException;
    :try_start_2
    invoke-virtual {v0}, Lorg/json/JSONException;->printStackTrace()V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_1

    goto :goto_1

    .line 2976
    .end local v0    # "e":Lorg/json/JSONException;
    .end local v1    # "i":I
    .end local v2    # "intent":Landroid/content/Intent;
    .end local v3    # "tempList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    :catch_1
    move-exception v0

    .line 2977
    .local v0, "e":Ljava/lang/Exception;
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    .line 2979
    .end local v0    # "e":Ljava/lang/Exception;
    :goto_2
    return-void

    .line 2973
    .restart local v1    # "i":I
    .restart local v2    # "intent":Landroid/content/Intent;
    .restart local v3    # "tempList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    :cond_0
    :try_start_3
    const-string v4, "getLedList"

    invoke-virtual {v2, v4, v3}, Landroid/content/Intent;->putStringArrayListExtra(Ljava/lang/String;Ljava/util/ArrayList;)Landroid/content/Intent;

    .line 2974
    const-string v4, "com.controller.belkin.hybrid.BRIDGE_DEVICES"

    invoke-virtual {v2, v4}, Landroid/content/Intent;->setAction(Ljava/lang/String;)Landroid/content/Intent;

    .line 2975
    sget-object v4, Lcom/belkin/cordova/plugin/DevicePlugin;->mContext:Landroid/content/Context;

    invoke-virtual {v4, v2}, Landroid/content/Context;->sendBroadcast(Landroid/content/Intent;)V
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_1

    goto :goto_2
.end method
