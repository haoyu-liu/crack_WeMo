.class Lcom/belkin/cordova/plugin/SetupPlugin$8;
.super Ljava/lang/Object;
.source "SetupPlugin.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/belkin/cordova/plugin/SetupPlugin;->GetendThread()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/belkin/cordova/plugin/SetupPlugin;


# direct methods
.method constructor <init>(Lcom/belkin/cordova/plugin/SetupPlugin;)V
    .locals 0

    .prologue
    .line 948
    iput-object p1, p0, Lcom/belkin/cordova/plugin/SetupPlugin$8;->this$0:Lcom/belkin/cordova/plugin/SetupPlugin;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 7

    .prologue
    .line 952
    :try_start_0
    const-string v4, "SetupPlugin"

    const-string v5, "GetendThread()"

    invoke-static {v4, v5}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 953
    iget-object v4, p0, Lcom/belkin/cordova/plugin/SetupPlugin$8;->this$0:Lcom/belkin/cordova/plugin/SetupPlugin;

    iget-object v5, p0, Lcom/belkin/cordova/plugin/SetupPlugin$8;->this$0:Lcom/belkin/cordova/plugin/SetupPlugin;

    invoke-static {v5}, Lcom/belkin/cordova/plugin/SetupPlugin;->access$100(Lcom/belkin/cordova/plugin/SetupPlugin;)Lcom/belkin/cybergarage/wrapper/UpnpDeviceSetup;

    move-result-object v5

    invoke-virtual {v5}, Lcom/belkin/cybergarage/wrapper/UpnpDeviceSetup;->parseGetEndDeviceList()Lorg/json/JSONArray;

    move-result-object v5

    invoke-static {v4, v5}, Lcom/belkin/cordova/plugin/SetupPlugin;->access$1102(Lcom/belkin/cordova/plugin/SetupPlugin;Lorg/json/JSONArray;)Lorg/json/JSONArray;

    .line 954
    const-string v4, "SetupPlugin"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "Thread response: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    iget-object v6, p0, Lcom/belkin/cordova/plugin/SetupPlugin$8;->this$0:Lcom/belkin/cordova/plugin/SetupPlugin;

    invoke-static {v6}, Lcom/belkin/cordova/plugin/SetupPlugin;->access$1100(Lcom/belkin/cordova/plugin/SetupPlugin;)Lorg/json/JSONArray;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 956
    new-instance v2, Landroid/content/Intent;

    invoke-direct {v2}, Landroid/content/Intent;-><init>()V

    .line 957
    .local v2, "intent":Landroid/content/Intent;
    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    .line 958
    .local v3, "tempList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    iget-object v4, p0, Lcom/belkin/cordova/plugin/SetupPlugin$8;->this$0:Lcom/belkin/cordova/plugin/SetupPlugin;

    invoke-static {v4}, Lcom/belkin/cordova/plugin/SetupPlugin;->access$1100(Lcom/belkin/cordova/plugin/SetupPlugin;)Lorg/json/JSONArray;

    move-result-object v4

    invoke-virtual {v4}, Lorg/json/JSONArray;->length()I
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_1

    move-result v4

    if-ge v1, v4, :cond_0

    .line 960
    :try_start_1
    iget-object v4, p0, Lcom/belkin/cordova/plugin/SetupPlugin$8;->this$0:Lcom/belkin/cordova/plugin/SetupPlugin;

    invoke-static {v4}, Lcom/belkin/cordova/plugin/SetupPlugin;->access$1100(Lcom/belkin/cordova/plugin/SetupPlugin;)Lorg/json/JSONArray;

    move-result-object v4

    invoke-virtual {v4, v1}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v4

    invoke-virtual {v4}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
    :try_end_1
    .catch Lorg/json/JSONException; {:try_start_1 .. :try_end_1} :catch_0

    .line 958
    :goto_1
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 961
    :catch_0
    move-exception v0

    .line 962
    .local v0, "e":Lorg/json/JSONException;
    :try_start_2
    invoke-virtual {v0}, Lorg/json/JSONException;->printStackTrace()V
    :try_end_2
    .catch Lorg/json/JSONException; {:try_start_2 .. :try_end_2} :catch_1

    goto :goto_1

    .line 968
    .end local v0    # "e":Lorg/json/JSONException;
    .end local v1    # "i":I
    .end local v2    # "intent":Landroid/content/Intent;
    .end local v3    # "tempList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    :catch_1
    move-exception v0

    .line 970
    .restart local v0    # "e":Lorg/json/JSONException;
    invoke-virtual {v0}, Lorg/json/JSONException;->printStackTrace()V

    .line 973
    .end local v0    # "e":Lorg/json/JSONException;
    :goto_2
    return-void

    .line 965
    .restart local v1    # "i":I
    .restart local v2    # "intent":Landroid/content/Intent;
    .restart local v3    # "tempList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    :cond_0
    :try_start_3
    const-string v4, "getLedList"

    invoke-virtual {v2, v4, v3}, Landroid/content/Intent;->putStringArrayListExtra(Ljava/lang/String;Ljava/util/ArrayList;)Landroid/content/Intent;

    .line 966
    const-string v4, "com.controller.belkin.hybrid.BRIDGE_DEVICES"

    invoke-virtual {v2, v4}, Landroid/content/Intent;->setAction(Ljava/lang/String;)Landroid/content/Intent;

    .line 967
    iget-object v4, p0, Lcom/belkin/cordova/plugin/SetupPlugin$8;->this$0:Lcom/belkin/cordova/plugin/SetupPlugin;

    invoke-static {v4}, Lcom/belkin/cordova/plugin/SetupPlugin;->access$000(Lcom/belkin/cordova/plugin/SetupPlugin;)Landroid/content/Context;

    move-result-object v4

    invoke-virtual {v4, v2}, Landroid/content/Context;->sendBroadcast(Landroid/content/Intent;)V
    :try_end_3
    .catch Lorg/json/JSONException; {:try_start_3 .. :try_end_3} :catch_1

    goto :goto_2
.end method
