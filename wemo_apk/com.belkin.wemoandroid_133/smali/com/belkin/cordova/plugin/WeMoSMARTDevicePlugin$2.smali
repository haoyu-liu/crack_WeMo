.class Lcom/belkin/cordova/plugin/WeMoSMARTDevicePlugin$2;
.super Ljava/lang/Object;
.source "WeMoSMARTDevicePlugin.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/belkin/cordova/plugin/WeMoSMARTDevicePlugin;->getAllDevices(Lorg/json/JSONArray;Lorg/apache/cordova/CallbackContext;)Z
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/belkin/cordova/plugin/WeMoSMARTDevicePlugin;

.field final synthetic val$callbackContext:Lorg/apache/cordova/CallbackContext;


# direct methods
.method constructor <init>(Lcom/belkin/cordova/plugin/WeMoSMARTDevicePlugin;Lorg/apache/cordova/CallbackContext;)V
    .locals 0

    .prologue
    .line 199
    iput-object p1, p0, Lcom/belkin/cordova/plugin/WeMoSMARTDevicePlugin$2;->this$0:Lcom/belkin/cordova/plugin/WeMoSMARTDevicePlugin;

    iput-object p2, p0, Lcom/belkin/cordova/plugin/WeMoSMARTDevicePlugin$2;->val$callbackContext:Lorg/apache/cordova/CallbackContext;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 10

    .prologue
    .line 203
    const/4 v0, 0x0

    .line 204
    .local v0, "arrList":Lorg/json/JSONArray;
    const/4 v4, 0x0

    .line 207
    .local v4, "error":Ljava/lang/String;
    :try_start_0
    iget-object v7, p0, Lcom/belkin/cordova/plugin/WeMoSMARTDevicePlugin$2;->this$0:Lcom/belkin/cordova/plugin/WeMoSMARTDevicePlugin;

    invoke-static {v7}, Lcom/belkin/cordova/plugin/WeMoSMARTDevicePlugin;->access$100(Lcom/belkin/cordova/plugin/WeMoSMARTDevicePlugin;)Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;

    move-result-object v7

    invoke-virtual {v7}, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->getWeMoDeviceList()Lorg/json/JSONObject;

    move-result-object v6

    .line 208
    .local v6, "objList":Lorg/json/JSONObject;
    if-eqz v6, :cond_1

    .line 209
    new-instance v1, Lorg/json/JSONArray;

    invoke-direct {v1}, Lorg/json/JSONArray;-><init>()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1

    .line 210
    .end local v0    # "arrList":Lorg/json/JSONArray;
    .local v1, "arrList":Lorg/json/JSONArray;
    :try_start_1
    invoke-virtual {v6}, Lorg/json/JSONObject;->keys()Ljava/util/Iterator;

    move-result-object v5

    .line 211
    .local v5, "keys":Ljava/util/Iterator;, "Ljava/util/Iterator<*>;"
    :goto_0
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v7

    if-eqz v7, :cond_0

    .line 212
    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Ljava/lang/String;

    invoke-virtual {v6, v7}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v2

    .line 213
    .local v2, "device":Lorg/json/JSONObject;
    invoke-virtual {v1, v2}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_0

    .line 218
    .end local v2    # "device":Lorg/json/JSONObject;
    .end local v5    # "keys":Ljava/util/Iterator;, "Ljava/util/Iterator<*>;"
    :catch_0
    move-exception v3

    move-object v0, v1

    .line 219
    .end local v1    # "arrList":Lorg/json/JSONArray;
    .end local v6    # "objList":Lorg/json/JSONObject;
    .restart local v0    # "arrList":Lorg/json/JSONArray;
    .local v3, "e":Ljava/lang/Exception;
    :goto_1
    invoke-virtual {v3}, Ljava/lang/Exception;->toString()Ljava/lang/String;

    move-result-object v4

    .line 223
    .end local v3    # "e":Ljava/lang/Exception;
    :goto_2
    if-eqz v4, :cond_2

    .line 224
    const-string v7, "WeMoSMARTDevicePlugin"

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "Get all devices error: "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-static {v7, v8}, Lcom/belkin/utils/LogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 225
    iget-object v7, p0, Lcom/belkin/cordova/plugin/WeMoSMARTDevicePlugin$2;->val$callbackContext:Lorg/apache/cordova/CallbackContext;

    invoke-virtual {v7, v4}, Lorg/apache/cordova/CallbackContext;->error(Ljava/lang/String;)V

    .line 229
    :goto_3
    return-void

    .end local v0    # "arrList":Lorg/json/JSONArray;
    .restart local v1    # "arrList":Lorg/json/JSONArray;
    .restart local v5    # "keys":Ljava/util/Iterator;, "Ljava/util/Iterator<*>;"
    .restart local v6    # "objList":Lorg/json/JSONObject;
    :cond_0
    move-object v0, v1

    .line 215
    .end local v1    # "arrList":Lorg/json/JSONArray;
    .restart local v0    # "arrList":Lorg/json/JSONArray;
    goto :goto_2

    .line 217
    .end local v5    # "keys":Ljava/util/Iterator;, "Ljava/util/Iterator<*>;"
    :cond_1
    :try_start_2
    const-string v4, "Unexpected error"
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_1

    goto :goto_2

    .line 228
    .end local v6    # "objList":Lorg/json/JSONObject;
    :cond_2
    iget-object v7, p0, Lcom/belkin/cordova/plugin/WeMoSMARTDevicePlugin$2;->val$callbackContext:Lorg/apache/cordova/CallbackContext;

    invoke-virtual {v7, v0}, Lorg/apache/cordova/CallbackContext;->success(Lorg/json/JSONArray;)V

    goto :goto_3

    .line 218
    :catch_1
    move-exception v3

    goto :goto_1
.end method
