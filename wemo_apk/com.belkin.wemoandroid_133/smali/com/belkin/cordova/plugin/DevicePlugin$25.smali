.class Lcom/belkin/cordova/plugin/DevicePlugin$25;
.super Ljava/lang/Object;
.source "DevicePlugin.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/belkin/cordova/plugin/DevicePlugin;->getStatusForGrpLed(Lorg/apache/cordova/CallbackContext;Lorg/json/JSONArray;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/belkin/cordova/plugin/DevicePlugin;

.field final synthetic val$callbackContext:Lorg/apache/cordova/CallbackContext;


# direct methods
.method constructor <init>(Lcom/belkin/cordova/plugin/DevicePlugin;Lorg/apache/cordova/CallbackContext;)V
    .locals 0

    .prologue
    .line 2912
    iput-object p1, p0, Lcom/belkin/cordova/plugin/DevicePlugin$25;->this$0:Lcom/belkin/cordova/plugin/DevicePlugin;

    iput-object p2, p0, Lcom/belkin/cordova/plugin/DevicePlugin$25;->val$callbackContext:Lorg/apache/cordova/CallbackContext;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 7

    .prologue
    .line 2916
    :try_start_0
    new-instance v2, Ljava/lang/StringBuffer;

    invoke-direct {v2}, Ljava/lang/StringBuffer;-><init>()V

    .line 2917
    .local v2, "ledDevicesIDs":Ljava/lang/StringBuffer;
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    iget-object v3, p0, Lcom/belkin/cordova/plugin/DevicePlugin$25;->this$0:Lcom/belkin/cordova/plugin/DevicePlugin;

    invoke-static {v3}, Lcom/belkin/cordova/plugin/DevicePlugin;->access$1900(Lcom/belkin/cordova/plugin/DevicePlugin;)Lorg/json/JSONArray;

    move-result-object v3

    invoke-virtual {v3}, Lorg/json/JSONArray;->length()I

    move-result v3

    if-ge v1, v3, :cond_1

    .line 2918
    iget-object v3, p0, Lcom/belkin/cordova/plugin/DevicePlugin$25;->this$0:Lcom/belkin/cordova/plugin/DevicePlugin;

    invoke-static {v3}, Lcom/belkin/cordova/plugin/DevicePlugin;->access$1900(Lcom/belkin/cordova/plugin/DevicePlugin;)Lorg/json/JSONArray;

    move-result-object v3

    invoke-virtual {v3, v1}, Lorg/json/JSONArray;->get(I)Ljava/lang/Object;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 2919
    iget-object v3, p0, Lcom/belkin/cordova/plugin/DevicePlugin$25;->this$0:Lcom/belkin/cordova/plugin/DevicePlugin;

    invoke-static {v3}, Lcom/belkin/cordova/plugin/DevicePlugin;->access$1900(Lcom/belkin/cordova/plugin/DevicePlugin;)Lorg/json/JSONArray;

    move-result-object v3

    invoke-virtual {v3}, Lorg/json/JSONArray;->length()I

    move-result v3

    add-int/lit8 v3, v3, -0x1

    if-ge v1, v3, :cond_0

    .line 2920
    const-string v3, ","

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 2921
    :cond_0
    const-string v3, "DevicePlugin"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "params inside..........."

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget-object v5, p0, Lcom/belkin/cordova/plugin/DevicePlugin$25;->this$0:Lcom/belkin/cordova/plugin/DevicePlugin;

    invoke-static {v5}, Lcom/belkin/cordova/plugin/DevicePlugin;->access$1900(Lcom/belkin/cordova/plugin/DevicePlugin;)Lorg/json/JSONArray;

    move-result-object v5

    invoke-virtual {v5, v1}, Lorg/json/JSONArray;->get(I)Ljava/lang/Object;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, "---"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v2}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 2917
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 2923
    :cond_1
    iget-object v3, p0, Lcom/belkin/cordova/plugin/DevicePlugin$25;->this$0:Lcom/belkin/cordova/plugin/DevicePlugin;

    iget-object v4, p0, Lcom/belkin/cordova/plugin/DevicePlugin$25;->this$0:Lcom/belkin/cordova/plugin/DevicePlugin;

    invoke-static {v4}, Lcom/belkin/cordova/plugin/DevicePlugin;->access$000(Lcom/belkin/cordova/plugin/DevicePlugin;)Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;

    move-result-object v4

    invoke-virtual {v2}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->getLedDeviceStatus(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v4

    invoke-static {v3, v4}, Lcom/belkin/cordova/plugin/DevicePlugin;->access$2002(Lcom/belkin/cordova/plugin/DevicePlugin;Lorg/json/JSONArray;)Lorg/json/JSONArray;

    .line 2924
    const-string v3, "DevicePlugin"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "pushDeviceListStatusIntent: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget-object v5, p0, Lcom/belkin/cordova/plugin/DevicePlugin$25;->this$0:Lcom/belkin/cordova/plugin/DevicePlugin;

    invoke-static {v5}, Lcom/belkin/cordova/plugin/DevicePlugin;->access$2000(Lcom/belkin/cordova/plugin/DevicePlugin;)Lorg/json/JSONArray;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 2925
    iget-object v3, p0, Lcom/belkin/cordova/plugin/DevicePlugin$25;->this$0:Lcom/belkin/cordova/plugin/DevicePlugin;

    new-instance v4, Lorg/apache/cordova/PluginResult;

    sget-object v5, Lorg/apache/cordova/PluginResult$Status;->OK:Lorg/apache/cordova/PluginResult$Status;

    iget-object v6, p0, Lcom/belkin/cordova/plugin/DevicePlugin$25;->this$0:Lcom/belkin/cordova/plugin/DevicePlugin;

    invoke-static {v6}, Lcom/belkin/cordova/plugin/DevicePlugin;->access$2000(Lcom/belkin/cordova/plugin/DevicePlugin;)Lorg/json/JSONArray;

    move-result-object v6

    invoke-direct {v4, v5, v6}, Lorg/apache/cordova/PluginResult;-><init>(Lorg/apache/cordova/PluginResult$Status;Lorg/json/JSONArray;)V

    invoke-static {v3, v4}, Lcom/belkin/cordova/plugin/DevicePlugin;->access$102(Lcom/belkin/cordova/plugin/DevicePlugin;Lorg/apache/cordova/PluginResult;)Lorg/apache/cordova/PluginResult;

    .line 2926
    iget-object v3, p0, Lcom/belkin/cordova/plugin/DevicePlugin$25;->this$0:Lcom/belkin/cordova/plugin/DevicePlugin;

    invoke-static {v3}, Lcom/belkin/cordova/plugin/DevicePlugin;->access$100(Lcom/belkin/cordova/plugin/DevicePlugin;)Lorg/apache/cordova/PluginResult;

    move-result-object v3

    const/4 v4, 0x0

    invoke-virtual {v3, v4}, Lorg/apache/cordova/PluginResult;->setKeepCallback(Z)V

    .line 2927
    iget-object v3, p0, Lcom/belkin/cordova/plugin/DevicePlugin$25;->val$callbackContext:Lorg/apache/cordova/CallbackContext;

    iget-object v4, p0, Lcom/belkin/cordova/plugin/DevicePlugin$25;->this$0:Lcom/belkin/cordova/plugin/DevicePlugin;

    invoke-static {v4}, Lcom/belkin/cordova/plugin/DevicePlugin;->access$100(Lcom/belkin/cordova/plugin/DevicePlugin;)Lorg/apache/cordova/PluginResult;

    move-result-object v4

    invoke-virtual {v3, v4}, Lorg/apache/cordova/CallbackContext;->sendPluginResult(Lorg/apache/cordova/PluginResult;)V
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 2931
    .end local v1    # "i":I
    .end local v2    # "ledDevicesIDs":Ljava/lang/StringBuffer;
    :goto_1
    return-void

    .line 2928
    :catch_0
    move-exception v0

    .line 2929
    .local v0, "e":Lorg/json/JSONException;
    invoke-virtual {v0}, Lorg/json/JSONException;->printStackTrace()V

    goto :goto_1
.end method
