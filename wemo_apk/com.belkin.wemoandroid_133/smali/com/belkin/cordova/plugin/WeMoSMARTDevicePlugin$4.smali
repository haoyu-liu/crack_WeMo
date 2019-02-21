.class Lcom/belkin/cordova/plugin/WeMoSMARTDevicePlugin$4;
.super Ljava/lang/Object;
.source "WeMoSMARTDevicePlugin.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/belkin/cordova/plugin/WeMoSMARTDevicePlugin;->callActionRemote(Lorg/json/JSONArray;Lorg/apache/cordova/CallbackContext;)Z
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
    .line 376
    iput-object p1, p0, Lcom/belkin/cordova/plugin/WeMoSMARTDevicePlugin$4;->this$0:Lcom/belkin/cordova/plugin/WeMoSMARTDevicePlugin;

    iput-object p2, p0, Lcom/belkin/cordova/plugin/WeMoSMARTDevicePlugin$4;->val$args:Lorg/json/JSONArray;

    iput-object p3, p0, Lcom/belkin/cordova/plugin/WeMoSMARTDevicePlugin$4;->val$callbackContext:Lorg/apache/cordova/CallbackContext;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 13

    .prologue
    .line 379
    const/4 v10, 0x0

    .local v10, "output":Ljava/lang/String;
    const-string v1, ""

    .line 380
    .local v1, "xml":Ljava/lang/String;
    const/4 v9, 0x0

    .line 384
    .local v9, "error":Ljava/lang/String;
    :try_start_0
    iget-object v3, p0, Lcom/belkin/cordova/plugin/WeMoSMARTDevicePlugin$4;->val$args:Lorg/json/JSONArray;

    const/4 v5, 0x0

    invoke-virtual {v3, v5}, Lorg/json/JSONArray;->getString(I)Ljava/lang/String;

    move-result-object v11

    .line 385
    .local v11, "udn":Ljava/lang/String;
    iget-object v3, p0, Lcom/belkin/cordova/plugin/WeMoSMARTDevicePlugin$4;->val$args:Lorg/json/JSONArray;

    const/4 v5, 0x3

    invoke-virtual {v3, v5}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v7

    .line 386
    .local v7, "arguments":Lorg/json/JSONObject;
    iget-object v3, p0, Lcom/belkin/cordova/plugin/WeMoSMARTDevicePlugin$4;->val$args:Lorg/json/JSONArray;

    const/4 v5, 0x2

    invoke-virtual {v3, v5}, Lorg/json/JSONArray;->getString(I)Ljava/lang/String;

    move-result-object v6

    .line 387
    .local v6, "action":Ljava/lang/String;
    const-string v3, "macAddress"

    invoke-virtual {v7, v3}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    .line 390
    .local v4, "macAddress":Ljava/lang/String;
    if-eqz v11, :cond_0

    invoke-virtual {v11}, Ljava/lang/String;->length()I

    move-result v3

    if-lez v3, :cond_0

    .line 391
    iget-object v3, p0, Lcom/belkin/cordova/plugin/WeMoSMARTDevicePlugin$4;->this$0:Lcom/belkin/cordova/plugin/WeMoSMARTDevicePlugin;

    invoke-static {v3}, Lcom/belkin/cordova/plugin/WeMoSMARTDevicePlugin;->access$500(Lcom/belkin/cordova/plugin/WeMoSMARTDevicePlugin;)Lcom/belkin/utils/WiFiSecurityUtil;

    move-result-object v3

    iget-object v5, p0, Lcom/belkin/cordova/plugin/WeMoSMARTDevicePlugin$4;->this$0:Lcom/belkin/cordova/plugin/WeMoSMARTDevicePlugin;

    invoke-static {v5}, Lcom/belkin/cordova/plugin/WeMoSMARTDevicePlugin;->access$200(Lcom/belkin/cordova/plugin/WeMoSMARTDevicePlugin;)Landroid/content/Context;

    move-result-object v5

    invoke-virtual {v3, v5}, Lcom/belkin/utils/WiFiSecurityUtil;->generateAuthCode(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v2

    .line 392
    .local v2, "authHeader":Ljava/lang/String;
    iget-object v3, p0, Lcom/belkin/cordova/plugin/WeMoSMARTDevicePlugin$4;->this$0:Lcom/belkin/cordova/plugin/WeMoSMARTDevicePlugin;

    invoke-static {v3}, Lcom/belkin/cordova/plugin/WeMoSMARTDevicePlugin;->access$200(Lcom/belkin/cordova/plugin/WeMoSMARTDevicePlugin;)Landroid/content/Context;

    move-result-object v3

    invoke-static {v3}, Lcom/belkin/cloud/CloudServices;->getInstance(Landroid/content/Context;)Lcom/belkin/cloud/CloudServices;

    move-result-object v0

    .line 394
    .local v0, "cs":Lcom/belkin/cloud/CloudServices;
    const-string v3, "GetRetailerDetails"

    invoke-virtual {v6, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_1

    .line 395
    const-string v3, "data"

    invoke-virtual {v7, v3}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v3

    const-string v5, "deviceDetails"

    invoke-virtual {v3, v5}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 396
    const-string v3, "xml data received to be sent via request"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v12, "xml : "

    invoke-virtual {v5, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v3, v5}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 397
    const-string v3, ""

    const-string v5, ""

    invoke-virtual/range {v0 .. v5}, Lcom/belkin/cloud/CloudServices;->getSerializationTracking(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v10

    .line 408
    :goto_0
    if-nez v10, :cond_0

    .line 409
    const-string v9, "No action response"
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 415
    .end local v0    # "cs":Lcom/belkin/cloud/CloudServices;
    .end local v2    # "authHeader":Ljava/lang/String;
    .end local v4    # "macAddress":Ljava/lang/String;
    .end local v6    # "action":Ljava/lang/String;
    .end local v7    # "arguments":Lorg/json/JSONObject;
    .end local v11    # "udn":Ljava/lang/String;
    :cond_0
    :goto_1
    const-string v3, "WeMoSMARTDevicePlugin"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v12, "output msg: "

    invoke-virtual {v5, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v3, v5}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 416
    if-eqz v9, :cond_6

    .line 417
    const-string v3, "WeMoSMARTDevicePlugin"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v12, "Call action error: "

    invoke-virtual {v5, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v3, v5}, Lcom/belkin/utils/LogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 418
    iget-object v3, p0, Lcom/belkin/cordova/plugin/WeMoSMARTDevicePlugin$4;->val$callbackContext:Lorg/apache/cordova/CallbackContext;

    invoke-virtual {v3, v9}, Lorg/apache/cordova/CallbackContext;->error(Ljava/lang/String;)V

    .line 422
    :goto_2
    return-void

    .line 399
    .restart local v0    # "cs":Lcom/belkin/cloud/CloudServices;
    .restart local v2    # "authHeader":Ljava/lang/String;
    .restart local v4    # "macAddress":Ljava/lang/String;
    .restart local v6    # "action":Ljava/lang/String;
    .restart local v7    # "arguments":Lorg/json/JSONObject;
    .restart local v11    # "udn":Ljava/lang/String;
    :cond_1
    :try_start_1
    const-string v3, "SetTemplates"

    invoke-virtual {v6, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_2

    const-string v3, "GetTemplates"

    invoke-virtual {v6, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_3

    .line 400
    :cond_2
    const-string v3, "data"

    invoke-virtual {v7, v3}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v3

    const-string v5, "templateList"

    invoke-virtual {v3, v5}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 406
    :goto_3
    const-string v3, ""

    invoke-virtual {v0, v1, v2, v3, v4}, Lcom/belkin/cloud/CloudServices;->sendRequest(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v10

    goto :goto_0

    .line 401
    :cond_3
    const-string v3, "SetRules"

    invoke-virtual {v6, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_4

    const-string v3, "GetRules"

    invoke-virtual {v6, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_5

    .line 402
    :cond_4
    const-string v3, "data"

    invoke-virtual {v7, v3}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v3

    const-string v5, "ruleList"

    invoke-virtual {v3, v5}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    goto :goto_3

    .line 404
    :cond_5
    const-string v3, "data"

    invoke-virtual {v7, v3}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;
    :try_end_1
    .catch Lorg/json/JSONException; {:try_start_1 .. :try_end_1} :catch_0

    move-result-object v1

    goto :goto_3

    .line 412
    .end local v0    # "cs":Lcom/belkin/cloud/CloudServices;
    .end local v2    # "authHeader":Ljava/lang/String;
    .end local v4    # "macAddress":Ljava/lang/String;
    .end local v6    # "action":Ljava/lang/String;
    .end local v7    # "arguments":Lorg/json/JSONObject;
    .end local v11    # "udn":Ljava/lang/String;
    :catch_0
    move-exception v8

    .line 413
    .local v8, "e":Lorg/json/JSONException;
    invoke-virtual {v8}, Lorg/json/JSONException;->toString()Ljava/lang/String;

    move-result-object v9

    goto/16 :goto_1

    .line 420
    .end local v8    # "e":Lorg/json/JSONException;
    :cond_6
    iget-object v3, p0, Lcom/belkin/cordova/plugin/WeMoSMARTDevicePlugin$4;->val$callbackContext:Lorg/apache/cordova/CallbackContext;

    invoke-virtual {v3, v10}, Lorg/apache/cordova/CallbackContext;->success(Ljava/lang/String;)V

    goto :goto_2
.end method
