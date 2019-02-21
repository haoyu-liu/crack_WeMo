.class Lcom/belkin/cordova/plugin/WeMoSMARTDevicePlugin$1;
.super Ljava/lang/Object;
.source "WeMoSMARTDevicePlugin.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/belkin/cordova/plugin/WeMoSMARTDevicePlugin;->getDevice(Lorg/json/JSONArray;Lorg/apache/cordova/CallbackContext;)Z
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/belkin/cordova/plugin/WeMoSMARTDevicePlugin;

.field final synthetic val$args:Lorg/json/JSONArray;

.field final synthetic val$callbackContext:Lorg/apache/cordova/CallbackContext;


# direct methods
.method constructor <init>(Lcom/belkin/cordova/plugin/WeMoSMARTDevicePlugin;Lorg/json/JSONArray;Lorg/apache/cordova/CallbackContext;)V
    .locals 0

    .prologue
    .line 161
    iput-object p1, p0, Lcom/belkin/cordova/plugin/WeMoSMARTDevicePlugin$1;->this$0:Lcom/belkin/cordova/plugin/WeMoSMARTDevicePlugin;

    iput-object p2, p0, Lcom/belkin/cordova/plugin/WeMoSMARTDevicePlugin$1;->val$args:Lorg/json/JSONArray;

    iput-object p3, p0, Lcom/belkin/cordova/plugin/WeMoSMARTDevicePlugin$1;->val$callbackContext:Lorg/apache/cordova/CallbackContext;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 7

    .prologue
    .line 165
    const/4 v2, 0x0

    .line 166
    .local v2, "error":Ljava/lang/String;
    const/4 v0, 0x0

    .line 167
    .local v0, "device":Lorg/json/JSONObject;
    iget-object v4, p0, Lcom/belkin/cordova/plugin/WeMoSMARTDevicePlugin$1;->this$0:Lcom/belkin/cordova/plugin/WeMoSMARTDevicePlugin;

    iget-object v5, p0, Lcom/belkin/cordova/plugin/WeMoSMARTDevicePlugin$1;->this$0:Lcom/belkin/cordova/plugin/WeMoSMARTDevicePlugin;

    invoke-static {v5}, Lcom/belkin/cordova/plugin/WeMoSMARTDevicePlugin;->access$200(Lcom/belkin/cordova/plugin/WeMoSMARTDevicePlugin;)Landroid/content/Context;

    move-result-object v5

    invoke-static {v5}, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->getInstance(Landroid/content/Context;)Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;

    move-result-object v5

    invoke-static {v4, v5}, Lcom/belkin/cordova/plugin/WeMoSMARTDevicePlugin;->access$102(Lcom/belkin/cordova/plugin/WeMoSMARTDevicePlugin;Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;)Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;

    .line 169
    :try_start_0
    iget-object v4, p0, Lcom/belkin/cordova/plugin/WeMoSMARTDevicePlugin$1;->val$args:Lorg/json/JSONArray;

    if-eqz v4, :cond_2

    iget-object v4, p0, Lcom/belkin/cordova/plugin/WeMoSMARTDevicePlugin$1;->val$args:Lorg/json/JSONArray;

    invoke-virtual {v4}, Lorg/json/JSONArray;->length()I

    move-result v4

    const/4 v5, 0x1

    if-lt v4, v5, :cond_2

    .line 170
    iget-object v4, p0, Lcom/belkin/cordova/plugin/WeMoSMARTDevicePlugin$1;->val$args:Lorg/json/JSONArray;

    const/4 v5, 0x0

    invoke-virtual {v4, v5}, Lorg/json/JSONArray;->getString(I)Ljava/lang/String;

    move-result-object v3

    .line 171
    .local v3, "udn":Ljava/lang/String;
    if-eqz v3, :cond_1

    invoke-virtual {v3}, Ljava/lang/String;->length()I

    move-result v4

    if-lez v4, :cond_1

    .line 172
    iget-object v4, p0, Lcom/belkin/cordova/plugin/WeMoSMARTDevicePlugin$1;->this$0:Lcom/belkin/cordova/plugin/WeMoSMARTDevicePlugin;

    invoke-static {v4}, Lcom/belkin/cordova/plugin/WeMoSMARTDevicePlugin;->access$100(Lcom/belkin/cordova/plugin/WeMoSMARTDevicePlugin;)Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;

    move-result-object v4

    invoke-virtual {v4, v3}, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->getDevice(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v0

    .line 173
    if-nez v0, :cond_0

    .line 174
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Device not found "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v2

    .line 185
    .end local v3    # "udn":Ljava/lang/String;
    :cond_0
    :goto_0
    if-eqz v2, :cond_3

    .line 186
    const-string v4, "WeMoSMARTDevicePlugin"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "Get device error: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Lcom/belkin/utils/LogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 187
    iget-object v4, p0, Lcom/belkin/cordova/plugin/WeMoSMARTDevicePlugin$1;->val$callbackContext:Lorg/apache/cordova/CallbackContext;

    invoke-virtual {v4, v2}, Lorg/apache/cordova/CallbackContext;->error(Ljava/lang/String;)V

    .line 191
    :goto_1
    return-void

    .line 177
    .restart local v3    # "udn":Ljava/lang/String;
    :cond_1
    :try_start_1
    const-string v2, "Invalid UDN"

    goto :goto_0

    .line 180
    .end local v3    # "udn":Ljava/lang/String;
    :cond_2
    const-string v2, "Missing parameters"
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_0

    .line 181
    :catch_0
    move-exception v1

    .line 182
    .local v1, "e":Ljava/lang/Exception;
    invoke-virtual {v1}, Ljava/lang/Exception;->toString()Ljava/lang/String;

    move-result-object v2

    goto :goto_0

    .line 190
    .end local v1    # "e":Ljava/lang/Exception;
    :cond_3
    iget-object v4, p0, Lcom/belkin/cordova/plugin/WeMoSMARTDevicePlugin$1;->val$callbackContext:Lorg/apache/cordova/CallbackContext;

    invoke-virtual {v4, v0}, Lorg/apache/cordova/CallbackContext;->success(Lorg/json/JSONObject;)V

    goto :goto_1
.end method
