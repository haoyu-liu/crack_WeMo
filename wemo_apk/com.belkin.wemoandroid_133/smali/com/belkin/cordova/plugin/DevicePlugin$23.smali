.class Lcom/belkin/cordova/plugin/DevicePlugin$23;
.super Ljava/lang/Object;
.source "DevicePlugin.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/belkin/cordova/plugin/DevicePlugin;->checkIfWemoPresentAsync(Lorg/json/JSONArray;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/belkin/cordova/plugin/DevicePlugin;

.field final synthetic val$inParamArray:Lorg/json/JSONArray;


# direct methods
.method constructor <init>(Lcom/belkin/cordova/plugin/DevicePlugin;Lorg/json/JSONArray;)V
    .locals 0

    .prologue
    .line 2780
    iput-object p1, p0, Lcom/belkin/cordova/plugin/DevicePlugin$23;->this$0:Lcom/belkin/cordova/plugin/DevicePlugin;

    iput-object p2, p0, Lcom/belkin/cordova/plugin/DevicePlugin$23;->val$inParamArray:Lorg/json/JSONArray;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 7

    .prologue
    .line 2783
    const-string v2, ""

    .line 2785
    .local v2, "retStatus":Ljava/lang/String;
    :try_start_0
    iget-object v4, p0, Lcom/belkin/cordova/plugin/DevicePlugin$23;->val$inParamArray:Lorg/json/JSONArray;

    const/4 v5, 0x0

    invoke-virtual {v4, v5}, Lorg/json/JSONArray;->getString(I)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/String;->toString()Ljava/lang/String;

    move-result-object v3

    .line 2786
    .local v3, "serialNo":Ljava/lang/String;
    const-string v4, "DevicePlugin"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "ACTION_CHECK_WEMO_PRESENT serialNo: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 2787
    iget-object v4, p0, Lcom/belkin/cordova/plugin/DevicePlugin$23;->this$0:Lcom/belkin/cordova/plugin/DevicePlugin;

    invoke-static {v4}, Lcom/belkin/cordova/plugin/DevicePlugin;->access$000(Lcom/belkin/cordova/plugin/DevicePlugin;)Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;

    move-result-object v4

    invoke-virtual {v4, v3}, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->checkIfWemoPresent(Ljava/lang/String;)Z

    move-result v1

    .line 2788
    .local v1, "isExist":Z
    if-eqz v1, :cond_0

    .line 2789
    const-string v2, "1"

    .line 2795
    :goto_0
    const-string v4, "DevicePlugin"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "checkIfWemoPresentAsync retStatus Code: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 2796
    iget-object v4, p0, Lcom/belkin/cordova/plugin/DevicePlugin$23;->this$0:Lcom/belkin/cordova/plugin/DevicePlugin;

    invoke-static {v4, v2}, Lcom/belkin/cordova/plugin/DevicePlugin;->access$1800(Lcom/belkin/cordova/plugin/DevicePlugin;Ljava/lang/String;)V

    .line 2800
    .end local v1    # "isExist":Z
    .end local v3    # "serialNo":Ljava/lang/String;
    :goto_1
    return-void

    .line 2790
    .restart local v1    # "isExist":Z
    .restart local v3    # "serialNo":Ljava/lang/String;
    :cond_0
    const-string v4, "No_Network"

    iget-object v5, p0, Lcom/belkin/cordova/plugin/DevicePlugin$23;->this$0:Lcom/belkin/cordova/plugin/DevicePlugin;

    invoke-static {v5}, Lcom/belkin/cordova/plugin/DevicePlugin;->access$1500(Lcom/belkin/cordova/plugin/DevicePlugin;)Lcom/belkin/wemo/cache/utils/SDKNetworkUtils;

    move-result-object v5

    invoke-virtual {v5}, Lcom/belkin/wemo/cache/utils/SDKNetworkUtils;->getNetworkType()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_1

    .line 2791
    const-string v2, "2"

    goto :goto_0

    .line 2793
    :cond_1
    const-string v2, "0"
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 2797
    .end local v1    # "isExist":Z
    .end local v3    # "serialNo":Ljava/lang/String;
    :catch_0
    move-exception v0

    .line 2798
    .local v0, "e":Lorg/json/JSONException;
    invoke-virtual {v0}, Lorg/json/JSONException;->printStackTrace()V

    goto :goto_1
.end method
